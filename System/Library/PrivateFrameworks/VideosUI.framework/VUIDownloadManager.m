@interface VUIDownloadManager
+ (id)sharedInstance;
- (BOOL)_anyDownloadsFailedDueToInvalidUserToken:(id)a3;
- (BOOL)dialogBeingPresented;
- (BOOL)isInitialized;
- (BOOL)performingAddDownloadsBatch;
- (NSArray)downloads;
- (NSMutableArray)failedDownloads;
- (NSMutableArray)mutableDownloads;
- (NSPointerArray)delegates;
- (VUIDownloadManager)init;
- (id)_alertControllerForFailedDownloads:(id)a3 outIncludeGoToSettingsButton:(BOOL *)a4;
- (id)_createMediaItemForVideoManagedObject:(id)a3 isForStartingDownload:(BOOL)a4 downloadQuality:(int64_t)a5;
- (id)_failedDownloadsNeedingDialog;
- (id)existingDownloadForAdamID:(id)a3;
- (void)_activeAccountDidChange:(id)a3;
- (void)_appDidStartRunning:(id)a3;
- (void)_configureDownloadFromUserPrefs:(id)a3 allowCellular:(BOOL)a4 quality:(int64_t)a5 prefer3DOrImmersiveDownload:(BOOL)a6;
- (void)_downloadQueueManagerHandleErrorsIfNeeded;
- (void)_isPlaybackUIBeingShownDidChange:(id)a3;
- (void)_loadImageForImageInfoManagedObject:(id)a3 imageType:(unint64_t)a4 download:(id)a5 useForStorageSettings:(BOOL)a6;
- (void)_loadImageForSeriesManagedObject:(id)a3 imageType:(unint64_t)a4 download:(id)a5 useForStorageSettings:(BOOL)a6;
- (void)_loadImageForVideoManagedObject:(id)a3 download:(id)a4;
- (void)_loadImageForVideoManagedObject:(id)a3 imageType:(unint64_t)a4 download:(id)a5 useForStorageSettings:(BOOL)a6;
- (void)_loadStorageSettingsImageFromMediaLibraryForVideoManagedObject:(id)a3 download:(id)a4;
- (void)_notifyDelegatesThatDownloadsDidChange;
- (void)_notifyDelegatesThatManagerDidBecomeInitialized;
- (void)_preflightDownloadForPresentingViewController:(id)a3 contentAllowsCellularDownload:(BOOL)a4 completion:(id)a5;
- (void)_showDownloadErrorDialogIfAppropriate;
- (void)_showDownloadErrorDialogIfAppropriateAfterDelay;
- (void)_showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:(BOOL)a3;
- (void)addDelegate:(id)a3;
- (void)addDownloadForVideoManagedObject:(id)a3 allowCellular:(BOOL)a4 quality:(int64_t)a5 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a6 prefer3DOrImmersiveDownload:(BOOL)a7;
- (void)addDownloadOrRenewKeysForMediaItem:(id)a3 allowCellular:(BOOL)a4 quality:(int64_t)a5 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a6;
- (void)cancelAndRemoveDownloadForMediaItem:(id)a3;
- (void)cancelDownloadForAdamID:(id)a3;
- (void)dealloc;
- (void)download:(id)a3 didChangeStateTo:(int64_t)a4;
- (void)download:(id)a3 didReceiveTaskIdentifier:(id)a4;
- (void)download:(id)a3 processFinishedDownloadWithCompletion:(id)a4;
- (void)download:(id)a3 willDownloadToURL:(id)a4;
- (void)download:(id)a3 willDownloadVariants:(id)a4;
- (void)downloadSession:(id)a3 didAddRestoredDownloads:(id)a4;
- (void)fetchNewKeysForDownloadedVideoManagedObject:(id)a3;
- (void)initializeDownloadManager;
- (void)loadImageForVideoManagedObject:(id)a3;
- (void)performBatchAddDownloadsWithBlock:(id)a3;
- (void)preflightDownloadForContentRating:(id)a3 presentingViewController:(id)a4 contentAllowsCellularDownload:(BOOL)a5 completion:(id)a6;
- (void)preflightDownloadForLibraryMediaEntity:(id)a3 presentingViewController:(id)a4 contentAllowsCellularDownload:(BOOL)a5 completion:(id)a6;
- (void)preflightDownloadForTVPMediaItem:(id)a3 presentingViewController:(id)a4 contentAllowsCellularDownload:(BOOL)a5 completion:(id)a6;
- (void)preflightDownloadForVideosPlayable:(id)a3 presentingViewController:(id)a4 contentAllowsCellularDownload:(BOOL)a5 completion:(id)a6;
- (void)removeDelegate:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setDialogBeingPresented:(BOOL)a3;
- (void)setFailedDownloads:(id)a3;
- (void)setIsInitialized:(BOOL)a3;
- (void)setMutableDownloads:(id)a3;
- (void)setPerformingAddDownloadsBatch:(BOOL)a3;
@end

@implementation VUIDownloadManager

- (void)addDelegate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(VUIDownloadManager *)self delegates];
    [v5 addPointer:v4];
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_29 != -1) {
    dispatch_once(&sharedInstance_onceToken_29, &__block_literal_global_130);
  }
  v2 = (void *)sharedInstance_instance_5;
  return v2;
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

- (id)existingDownloadForAdamID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__28;
  v15 = __Block_byref_object_dispose__28;
  id v16 = 0;
  if ([v4 length])
  {
    id v5 = [(VUIDownloadManager *)self downloads];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__VUIDownloadManager_existingDownloadForAdamID___block_invoke;
    v8[3] = &unk_1E6DFB588;
    id v9 = v4;
    v10 = &v11;
    [v5 enumerateObjectsUsingBlock:v8];
  }
  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)_notifyDelegatesThatManagerDidBecomeInitialized
{
  v3 = [(VUIDownloadManager *)self delegates];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [(VUIDownloadManager *)self delegates];
      v7 = (void *)[v6 pointerAtIndex:v5];

      if (v7)
      {
        id v8 = v7;
        if (objc_opt_respondsToSelector()) {
          [v8 downloadManagerDidBecomeInitialized:self];
        }
      }
      ++v5;
      id v9 = [(VUIDownloadManager *)self delegates];
      unint64_t v10 = [v9 count];
    }
    while (v5 < v10);
  }
}

- (NSPointerArray)delegates
{
  return self->_delegates;
}

- (void)_appDidStartRunning:(id)a3
{
  uint64_t v4 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "App did start running", v5, 2u);
  }
  [(VUIDownloadManager *)self _showDownloadErrorDialogIfAppropriateAfterDelay];
}

- (void)_showDownloadErrorDialogIfAppropriateAfterDelay
{
  v3 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "Will show error dialog (if needed) after delay", v4, 2u);
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__showDownloadErrorDialogIfAppropriate object:0];
  [(VUIDownloadManager *)self performSelector:sel__showDownloadErrorDialogIfAppropriate withObject:0 afterDelay:1.0];
}

- (VUIDownloadManager)init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)VUIDownloadManager;
  v2 = [(VUIDownloadManager *)&v20 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableDownloads = v2->_mutableDownloads;
    v2->_mutableDownloads = v3;

    unint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    failedDownloads = v2->_failedDownloads;
    v2->_failedDownloads = v5;

    uint64_t v7 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    delegates = v2->_delegates;
    v2->_delegates = (NSPointerArray *)v7;

    if (+[VUIUtilities isTVApp])
    {
      id v9 = (void *)sLogObject_20;
      if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v10 = v9;
        uint64_t v11 = +[VUITVAppLauncher sharedInstance];
        int v12 = [v11 isAppRunning];
        uint64_t v13 = @"NO";
        if (v12) {
          uint64_t v13 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        v22 = v13;
        _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIDownloadManager init - is app running: %@", buf, 0xCu);
      }
    }
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v2 selector:sel__appDidStartRunning_ name:@"VUITVAppLauncherDidStartRunningNotification" object:0];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v16 = VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0];
    v17 = +[VUIPlaybackManager sharedInstance];
    [v15 addObserver:v2 selector:sel__isPlaybackUIBeingShownDidChange_ name:v16 object:v17];

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v2 selector:sel__activeAccountDidChange_ name:*MEMORY[0x1E4FA83B0] object:0];
  }
  return v2;
}

- (NSArray)downloads
{
  v2 = [(VUIDownloadManager *)self mutableDownloads];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSMutableArray)mutableDownloads
{
  return self->_mutableDownloads;
}

- (void)initializeDownloadManager
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = +[VUIMediaLibraryManager defaultManager];
  unint64_t v5 = [v4 sidebandMediaLibrary];
  id v6 = [v5 videosWithDownloadState:1 entitlementTypes:0 sortDescriptors:0 useMainThreadContext:1];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v12 = [v11 adamID];
        if ([v12 length])
        {
          uint64_t v13 = [(VUIDownloadManager *)self _createMediaItemForVideoManagedObject:v11 isForStartingDownload:0 downloadQuality:1];
          if (v13) {
            [v3 addObject:v13];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v8);
  }

  v14 = (void *)sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    uint64_t v16 = [v3 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = v16;
    _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Found %lu media item(s) that were previously being downloaded (according to database)", buf, 0xCu);
  }
  v17 = [MEMORY[0x1E4FA9D60] sharedInstance];
  [v17 setDelegate:self];

  v18 = [MEMORY[0x1E4FA9D60] sharedInstance];
  [v18 initializeWithDownloadingMediaItems:v3];
}

void __36__VUIDownloadManager_sharedInstance__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUIDownloadManager");
  v1 = (void *)sLogObject_20;
  sLogObject_20 = (uint64_t)v0;

  v2 = objc_alloc_init(VUIDownloadManager);
  id v3 = (void *)sharedInstance_instance_5;
  sharedInstance_instance_5 = (uint64_t)v2;
}

- (void)downloadSession:(id)a3 didAddRestoredDownloads:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = a4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    uint64_t v25 = *MEMORY[0x1E4FA9E28];
    uint64_t v23 = *MEMORY[0x1E4FAA0D8];
    uint64_t v8 = &unk_1EBFC8000;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(obj);
        }
        unint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v11 = [(VUIDownloadManager *)self mutableDownloads];
        [v11 addObject:v10];

        int v12 = *((void *)v8 + 340);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          log = v12;
          uint64_t v13 = [v10 mediaItem];
          v27 = [v13 mediaItemMetadataForProperty:v25];
          v14 = [v10 mediaItem];
          v15 = [v14 mediaItemMetadataForProperty:v23];
          [(VUIDownloadManager *)self mutableDownloads];
          uint64_t v16 = v8;
          v17 = self;
          long long v19 = v18 = v6;
          uint64_t v20 = [v19 count];
          *(_DWORD *)buf = 138413058;
          v36 = v10;
          __int16 v37 = 2112;
          v38 = v27;
          __int16 v39 = 2112;
          v40 = v15;
          __int16 v41 = 2048;
          uint64_t v42 = v20;
          _os_log_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_DEFAULT, "Added restored download %@ for canonical ID %@ adam ID %@ to list of downloads.  Number of downloads is now %lu", buf, 0x2Au);

          uint64_t v6 = v18;
          self = v17;
          uint64_t v8 = v16;

          uint64_t v7 = v24;
        }
        [v10 addDelegate:self];
        uint64_t v21 = [v10 state];
        long long v22 = *((void *)v8 + 340);
        if (v21 == 5)
        {
          if (os_log_type_enabled(*((os_log_t *)v8 + 340), OS_LOG_TYPE_ERROR)) {
            -[VUIDownloadManager downloadSession:didAddRestoredDownloads:](&v29, v30, v22);
          }
          [(VUIDownloadManager *)self download:v10 didChangeStateTo:5];
        }
        else
        {
          if (os_log_type_enabled(*((os_log_t *)v8 + 340), OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_DEFAULT, "Resuming restored download", buf, 2u);
          }
          [v10 start];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v6);
  }
  if ([obj count]) {
    [(VUIDownloadManager *)self _notifyDelegatesThatDownloadsDidChange];
  }
  [(VUIDownloadManager *)self setIsInitialized:1];
  [(VUIDownloadManager *)self _notifyDelegatesThatManagerDidBecomeInitialized];
}

- (void)setIsInitialized:(BOOL)a3
{
  self->_isInitialized = a3;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadManager;
  [(VUIDownloadManager *)&v4 dealloc];
}

- (void)removeDelegate:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    objc_super v4 = [(VUIDownloadManager *)self delegates];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      unint64_t v6 = 0;
      while (1)
      {
        uint64_t v7 = [(VUIDownloadManager *)self delegates];
        uint64_t v8 = [v7 pointerAtIndex:v6];

        if ((id)v8 == v12) {
          break;
        }
        ++v6;
        uint64_t v9 = [(VUIDownloadManager *)self delegates];
        unint64_t v10 = [v9 count];

        if (v6 >= v10) {
          goto LABEL_8;
        }
      }
      uint64_t v11 = [(VUIDownloadManager *)self delegates];
      [v11 removePointerAtIndex:v6];
    }
  }
LABEL_8:
}

- (void)addDownloadForVideoManagedObject:(id)a3 allowCellular:(BOOL)a4 quality:(int64_t)a5 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a6 prefer3DOrImmersiveDownload:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v10 = a4;
  v42[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v13 = +[VUIMediaLibraryManager defaultManager];
  v14 = [v13 sidebandMediaLibrary];
  v15 = [v14 mainContextVideoForVideo:v12];

  if (v15)
  {
    uint64_t v16 = [v15 adamID];
    v17 = [(VUIDownloadManager *)self existingDownloadForAdamID:v16];

    if (v17)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR)) {
        -[VUIDownloadManager addDownloadForVideoManagedObject:allowCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:]();
      }
    }
    else
    {
      uint64_t v18 = +[VUIMediaLibraryManager defaultManager];
      long long v19 = [v18 sidebandMediaLibrary];
      [v19 removeDownloadedMediaForVideoManagedObject:v15 markAsDeleted:0 invalidateImmediately:0];

      [v15 setShouldMarkAsDeletedAfterCancellationOrFailure:v8];
      [v15 setAllowsCellular:v10];
      [v15 setDownloadFailedDueToError:0];
      uint64_t v20 = +[VUIMediaLibraryManager defaultManager];
      uint64_t v21 = [v20 sidebandMediaLibrary];
      [v21 saveChangesToManagedObjects];

      long long v22 = [(VUIDownloadManager *)self _createMediaItemForVideoManagedObject:v15 isForStartingDownload:1 downloadQuality:a5];
      uint64_t v23 = [MEMORY[0x1E4FA9D60] sharedInstance];
      uint64_t v24 = [v23 downloadForMediaItem:v22];

      __int16 v41 = @"Download Quality";
      uint64_t v25 = [MEMORY[0x1E4F28ED0] numberWithInteger:a5];
      v42[0] = v25;
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
      [v24 setUserInfo:v26];

      [(VUIDownloadManager *)self _configureDownloadFromUserPrefs:v24 allowCellular:v10 quality:a5 prefer3DOrImmersiveDownload:v7];
      v27 = [(VUIDownloadManager *)self mutableDownloads];
      [v27 addObject:v24];

      [v24 addDelegate:self];
      v28 = (void *)sLogObject_20;
      if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
      {
        uint8_t v29 = v28;
        v30 = [v15 canonicalID];
        long long v31 = [v15 adamID];
        long long v32 = [(VUIDownloadManager *)self mutableDownloads];
        int v33 = 138413058;
        long long v34 = v24;
        __int16 v35 = 2112;
        v36 = v30;
        __int16 v37 = 2112;
        v38 = v31;
        __int16 v39 = 2048;
        uint64_t v40 = [v32 count];
        _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "Added download %@ for canonical ID %@ adam ID %@ to list of downloads.  Number of downloads is now %lu", (uint8_t *)&v33, 0x2Au);
      }
      [v24 start];
      if (![(VUIDownloadManager *)self performingAddDownloadsBatch]) {
        [(VUIDownloadManager *)self _notifyDelegatesThatDownloadsDidChange];
      }
      [(VUIDownloadManager *)self _loadImageForVideoManagedObject:v15 download:v24];
    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
  {
    -[VUIDownloadManager addDownloadForVideoManagedObject:allowCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:]();
  }
}

- (void)loadImageForVideoManagedObject:(id)a3
{
}

- (void)performBatchAddDownloadsWithBlock:(id)a3
{
  objc_super v4 = (void (**)(void))a3;
  [(VUIDownloadManager *)self setPerformingAddDownloadsBatch:1];
  if (v4)
  {
    v4[2]();
    [(VUIDownloadManager *)self _notifyDelegatesThatDownloadsDidChange];
  }
  [(VUIDownloadManager *)self setPerformingAddDownloadsBatch:0];
}

- (void)fetchNewKeysForDownloadedVideoManagedObject:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[VUIMediaLibraryManager defaultManager];
  unint64_t v6 = [v5 sidebandMediaLibrary];
  BOOL v7 = [v6 mainContextVideoForVideo:v4];

  if (v7)
  {
    if ([v7 downloadState] == 2)
    {
      int v8 = [v7 allowsManualRenewal];
      uint64_t v9 = (void *)sLogObject_20;
      if (v8)
      {
        if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v10 = v9;
          uint64_t v11 = [v7 canonicalID];
          id v12 = [v7 adamID];
          int v19 = 138412546;
          uint64_t v20 = v11;
          __int16 v21 = 2112;
          long long v22 = v12;
          _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Fetching new keys for canonical ID %@ adam ID %@", (uint8_t *)&v19, 0x16u);
        }
        uint64_t v13 = [[VUIStoreAuxMediaItem alloc] initWithVideoManagedObject:v7 isForStartingDownload:0];
        v14 = [MEMORY[0x1E4FA9D60] sharedInstance];
        v15 = [v14 downloadForMediaItem:v13];

        [v7 setShouldMarkAsDeletedAfterCancellationOrFailure:0];
        uint64_t v16 = +[VUIMediaLibraryManager defaultManager];
        v17 = [v16 sidebandMediaLibrary];
        [v17 saveChangesToManagedObjects];

        [(VUIStoreAuxMediaItem *)v13 setIgnoreExistingOfflineKeyData:1];
        [v15 setPerformKeyFetchOnly:1];
        [v15 addDelegate:self];
        uint64_t v18 = [(VUIDownloadManager *)self mutableDownloads];
        [v18 addObject:v15];

        [v15 start];
        [(VUIDownloadManager *)self _notifyDelegatesThatDownloadsDidChange];
      }
      else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
      {
        -[VUIDownloadManager fetchNewKeysForDownloadedVideoManagedObject:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
    {
      -[VUIDownloadManager fetchNewKeysForDownloadedVideoManagedObject:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
  {
    -[VUIDownloadManager fetchNewKeysForDownloadedVideoManagedObject:]();
  }
}

- (void)addDownloadOrRenewKeysForMediaItem:(id)a3 allowCellular:(BOOL)a4 quality:(int64_t)a5 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 mediaItemMetadataForProperty:@"VUIContentMetadataDownloadVideoManagedObject"];
  if (v11)
  {
    id v12 = [v10 mediaItemMetadataForProperty:@"VUIContentMetadataDownloadAllowsManualRenewal"];
    int v13 = [v12 BOOLValue];

    if (v13) {
      [(VUIDownloadManager *)self fetchNewKeysForDownloadedVideoManagedObject:v11];
    }
    else {
      [(VUIDownloadManager *)self addDownloadForVideoManagedObject:v11 allowCellular:v8 quality:a5 shouldMarkAsDeletedOnCancellationOrFailure:v6 prefer3DOrImmersiveDownload:1];
    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
  {
    -[VUIDownloadManager addDownloadOrRenewKeysForMediaItem:allowCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:]();
  }
}

- (void)cancelAndRemoveDownloadForMediaItem:(id)a3
{
  id v8 = [a3 mediaItemMetadataForProperty:@"VUIContentMetadataDownloadVideoManagedObject"];
  id v4 = [v8 adamID];
  uint64_t v5 = [v8 downloadState];
  [(VUIDownloadManager *)self cancelDownloadForAdamID:v4];
  if (v8)
  {
    BOOL v6 = +[VUIMediaLibraryManager defaultManager];
    BOOL v7 = [v6 sidebandMediaLibrary];
    [v7 removeDownloadedMediaForVideoManagedObject:v8 markAsDeleted:v5 != 1 invalidateImmediately:1];
  }
}

void __48__VUIDownloadManager_existingDownloadForAdamID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  BOOL v7 = [v9 mediaItem];
  id v8 = [v7 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];

  if ([*(id *)(a1 + 32) isEqualToString:v8])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)cancelDownloadForAdamID:(id)a3
{
  id v3 = [(VUIDownloadManager *)self existingDownloadForAdamID:a3];
  [v3 cancel];
}

- (void)preflightDownloadForVideosPlayable:(id)a3 presentingViewController:(id)a4 contentAllowsCellularDownload:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[VUIPreflightManager defaultPreflightManager];
  [v13 setVideosPlayable:v12];

  [(VUIDownloadManager *)self _preflightDownloadForPresentingViewController:v11 contentAllowsCellularDownload:v6 completion:v10];
}

- (void)preflightDownloadForLibraryMediaEntity:(id)a3 presentingViewController:(id)a4 contentAllowsCellularDownload:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[VUIPreflightManager defaultPreflightManager];
  [v13 setMediaEntity:v12];

  [(VUIDownloadManager *)self _preflightDownloadForPresentingViewController:v11 contentAllowsCellularDownload:v6 completion:v10];
}

- (void)preflightDownloadForTVPMediaItem:(id)a3 presentingViewController:(id)a4 contentAllowsCellularDownload:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[VUIPreflightManager defaultPreflightManager];
  [v13 setMediaItem:v12];

  [(VUIDownloadManager *)self _preflightDownloadForPresentingViewController:v11 contentAllowsCellularDownload:v6 completion:v10];
}

- (void)preflightDownloadForContentRating:(id)a3 presentingViewController:(id)a4 contentAllowsCellularDownload:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[VUIPreflightManager defaultPreflightManager];
  [v13 setContentRating:v12];

  [(VUIDownloadManager *)self _preflightDownloadForPresentingViewController:v11 contentAllowsCellularDownload:v6 completion:v10];
}

- (void)_preflightDownloadForPresentingViewController:(id)a3 contentAllowsCellularDownload:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = +[VUIPreflightManager defaultPreflightManager];
  [v9 setPresentingController:v8];

  [v9 setRestrictionsCheckType:1];
  [v9 setContentAllowsCellularDownload:v5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __109__VUIDownloadManager__preflightDownloadForPresentingViewController_contentAllowsCellularDownload_completion___block_invoke;
  v11[3] = &unk_1E6DFA5B8;
  id v12 = v7;
  id v10 = v7;
  [v9 preflightWithOptions:11 completion:v11];
}

void __109__VUIDownloadManager__preflightDownloadForPresentingViewController_contentAllowsCellularDownload_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (!*(void *)(a1 + 32)) {
    return;
  }
  id v4 = VUIPreflightCellularAllowedKey[0];
  id v5 = a3;
  id v7 = [v5 objectForKey:v4];
  BOOL v6 = [v5 objectForKey:VUIPreflightDownloadQualityKey];

  if (!v7)
  {
    if (!v6) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  [v7 BOOLValue];
  if (v6) {
LABEL_4:
  }
    [v6 integerValue];
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)download:(id)a3 didChangeStateTo:(int64_t)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6) {
    goto LABEL_42;
  }
  id v7 = (void *)sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [v6 descriptionForState:a4];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Download %@ state did change to %@", buf, 0x16u);
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    switch(a4)
    {
      case 6:
        goto LABEL_17;
      case 3:
        v28 = [v6 mediaItem];
        id v11 = [v28 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];

        uint8_t v29 = +[VUIMediaLibraryManager defaultManager];
        v30 = [v29 sidebandMediaLibrary];
        v14 = [v30 videoForAdamID:v11 useMainThreadContext:1];

        [v14 setDownloadState:2];
        long long v31 = sLogObject_20;
        if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v31, OS_LOG_TYPE_DEFAULT, "Setting managed object's task identifier to nil", buf, 2u);
        }
        goto LABEL_31;
      case 1:
LABEL_17:
        __int16 v21 = [v6 mediaItem];
        long long v22 = [v21 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];

        uint64_t v23 = +[VUIMediaLibraryManager defaultManager];
        uint64_t v24 = [v23 sidebandMediaLibrary];
        uint64_t v25 = [v24 videoForAdamID:v22 useMainThreadContext:1];

        [v25 setDownloadState:1];
        uint64_t v26 = +[VUIMediaLibraryManager defaultManager];
        v27 = [v26 sidebandMediaLibrary];
        [v27 saveChangesToManagedObjects];

        break;
    }
    if ((unint64_t)(a4 - 3) >= 3) {
      goto LABEL_42;
    }
    goto LABEL_33;
  }
  id v10 = [v6 mediaItem];
  id v11 = [v10 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];

  id v12 = +[VUIMediaLibraryManager defaultManager];
  id v13 = [v12 sidebandMediaLibrary];
  v14 = [v13 videoForAdamID:v11 useMainThreadContext:1];

  if (v14)
  {
    if ([v6 performKeyFetchOnly])
    {
      if (a4 == 5)
      {
        v15 = [v6 error];
        if (TVPErrorIsSKDError())
        {
          uint64_t v16 = [v6 error];
          BOOL v17 = [v16 code] == -345015;

          if (v17)
          {
            uint64_t v18 = sLogObject_20;
            if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "Will remove download after performing key fetch because user is no longer entitled", buf, 2u);
            }
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      long long v34 = sLogObject_20;
      if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v34, OS_LOG_TYPE_DEFAULT, "Not removing download on cancellation/failure since download was only performing a key fetch.  Resetting state to Downloaded.", buf, 2u);
      }
      [v14 setDownloadState:2];
      long long v32 = [v6 error];
      [v14 setDownloadFailedDueToError:v32 != 0];
      goto LABEL_29;
    }
LABEL_12:
    int v19 = [v6 error];
    [v14 setDownloadFailedDueToError:v19 != 0];

    if (a4 == 4)
    {
      uint64_t v20 = [v6 performKeyFetchOnly] ^ 1;
    }
    else
    {
      [v14 setHasExpirationDate:0];
      [v14 setAvailabilityEndDate:0];
      uint64_t v20 = 0;
    }
    long long v32 = +[VUIMediaLibraryManager defaultManager];
    int v33 = [v32 sidebandMediaLibrary];
    [v33 removeDownloadedMediaForVideoManagedObject:v14 markAsDeleted:v20 invalidateImmediately:1];

LABEL_29:
    __int16 v35 = sLogObject_20;
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v35, OS_LOG_TYPE_DEFAULT, "Setting managed object's task identifier to nil", buf, 2u);
    }
LABEL_31:
    [v14 setDownloadTaskIdentifier:0];
    v36 = +[VUIMediaLibraryManager defaultManager];
    __int16 v37 = [v36 sidebandMediaLibrary];
    [v37 saveChangesToManagedObjects];
  }
LABEL_33:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v63 = 0x7FFFFFFFFFFFFFFFLL;
  v38 = [(VUIDownloadManager *)self mutableDownloads];
  uint64_t v52 = MEMORY[0x1E4F143A8];
  uint64_t v53 = 3221225472;
  v54 = __48__VUIDownloadManager_download_didChangeStateTo___block_invoke;
  v55 = &unk_1E6DFB588;
  id v39 = v6;
  id v56 = v39;
  v57 = buf;
  [v38 enumerateObjectsUsingBlock:&v52];

  if (*(void *)(*(void *)&buf[8] + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v39, "removeDelegate:", self, v52, v53, v54, v55);
    uint64_t v40 = [(VUIDownloadManager *)self mutableDownloads];
    [v40 removeObjectAtIndex:*(void *)(*(void *)&buf[8] + 24)];

    __int16 v41 = (id)sLogObject_20;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = [(VUIDownloadManager *)self mutableDownloads];
      uint64_t v43 = [v42 count];
      *(_DWORD *)v58 = 138412546;
      id v59 = v39;
      __int16 v60 = 2048;
      uint64_t v61 = v43;
      _os_log_impl(&dword_1E2BD7000, v41, OS_LOG_TYPE_DEFAULT, "Removed download %@ from list of downloads.  Number of downloads is now %lu", v58, 0x16u);
    }
    [(VUIDownloadManager *)self _notifyDelegatesThatDownloadsDidChange];
  }

  _Block_object_dispose(buf, 8);
  if (a4 == 5)
  {
    uint64_t v44 = [(VUIDownloadManager *)self failedDownloads];
    [v44 addObject:v39];

    v45 = [v39 error];
    v46 = [v45 userInfo];
    v47 = [v46 objectForKey:@"VUIDownloadManagerSuppressErrorDialogKey"];
    int v48 = [v47 BOOLValue];

    if (v48)
    {
      v49 = (void *)sLogObject_20;
      if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
      {
        v50 = v49;
        v51 = [v39 error];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v51;
        _os_log_impl(&dword_1E2BD7000, v50, OS_LOG_TYPE_DEFAULT, "Suppressing error dialog for %@", buf, 0xCu);
      }
    }
    [(VUIDownloadManager *)self _showDownloadErrorDialogIfAppropriateAfterDelay];
    [(VUIDownloadManager *)self _downloadQueueManagerHandleErrorsIfNeeded];
  }
LABEL_42:
}

void __48__VUIDownloadManager_download_didChangeStateTo___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 mediaItem];
  id v8 = [*(id *)(a1 + 32) mediaItem];
  int v9 = [v7 isEqualToMediaItem:v8];

  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)download:(id)a3 willDownloadToURL:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Download %@ will download to %@", (uint8_t *)&v15, 0x16u);
  }
  id v8 = [v5 mediaItem];
  int v9 = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];

  if (v9)
  {
    id v10 = +[VUIMediaLibraryManager defaultManager];
    id v11 = [v10 sidebandMediaLibrary];
    id v12 = [v11 videoForAdamID:v9 useMainThreadContext:1];

    if (v12)
    {
      [v12 setLocalPlaybackURL:v6];
      id v13 = +[VUIMediaLibraryManager defaultManager];
      v14 = [v13 sidebandMediaLibrary];
      [v14 saveChangesToManagedObjects];
    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
  {
    -[VUIDownloadManager download:willDownloadToURL:]();
  }
}

- (void)download:(id)a3 didReceiveTaskIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Download %@ did receive task identifier %@", (uint8_t *)&v16, 0x16u);
  }
  id v8 = [v5 mediaItem];
  int v9 = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];

  if (v9)
  {
    id v10 = +[VUIMediaLibraryManager defaultManager];
    id v11 = [v10 sidebandMediaLibrary];
    id v12 = [v11 videoForAdamID:v9 useMainThreadContext:1];

    if (v12)
    {
      id v13 = sLogObject_20;
      if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v6;
        _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Setting managed object's task identifier to %@", (uint8_t *)&v16, 0xCu);
      }
      [v12 setDownloadTaskIdentifier:v6];
      v14 = +[VUIMediaLibraryManager defaultManager];
      int v15 = [v14 sidebandMediaLibrary];
      [v15 saveChangesToManagedObjects];
    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
  {
    -[VUIDownloadManager download:didReceiveTaskIdentifier:]();
  }
}

- (void)download:(id)a3 processFinishedDownloadWithCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 mediaItem];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = (void *)sLogObject_20;
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      id v11 = [v5 mediaItem];
      *(_DWORD *)buf = 138412290;
      int v16 = v11;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Calling processFinishedDownloadWithCompletion for mediaItem %@", buf, 0xCu);
    }
    id v12 = [v5 mediaItem];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__VUIDownloadManager_download_processFinishedDownloadWithCompletion___block_invoke;
    v13[3] = &unk_1E6DF8228;
    id v14 = v6;
    [v12 processFinishedDownloadWithCompletion:v13];
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

uint64_t __69__VUIDownloadManager_download_processFinishedDownloadWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)download:(id)a3 willDownloadVariants:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 mediaItem];
  char v8 = [v7 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];

  if (v8)
  {
    int v9 = +[VUIMediaLibraryManager defaultManager];
    id v10 = [v9 sidebandMediaLibrary];
    id v11 = [v10 videoForAdamID:v8 useMainThreadContext:1];

    if (v11)
    {
      v30 = v11;
      long long v31 = v8;
      id v12 = @"Monoscopic";
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v32 = v6;
      id obj = v6;
      uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v39 != v15) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            __int16 v18 = objc_msgSend(v17, "videoAttributes", v30);
            id v19 = [v18 videoLayoutAttributes];

            uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v35;
              while (2)
              {
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v35 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  uint64_t v24 = *(void **)(*((void *)&v34 + 1) + 8 * j);
                  if ((~[v24 stereoViewComponents] & 3) == 0)
                  {
                    uint64_t v25 = [v24 projectionType];
                    uint64_t v26 = @"Stereoscopic";
                    if (v25 == 1718186856) {
                      uint64_t v26 = @"Immersive";
                    }
                    v27 = v26;

                    id v12 = v27;
                    goto LABEL_20;
                  }
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
                if (v21) {
                  continue;
                }
                break;
              }
            }
LABEL_20:
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v14);
      }

      id v11 = v30;
      [v30 setDownloadedPlaybackMode:v12];
      v28 = +[VUIMediaLibraryManager defaultManager];
      uint8_t v29 = [v28 sidebandMediaLibrary];
      [v29 saveChangesToManagedObjects];

      id v6 = v32;
      char v8 = v31;
    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
  {
    -[VUIDownloadManager download:willDownloadVariants:]();
  }
}

- (void)_notifyDelegatesThatDownloadsDidChange
{
  id v3 = [(VUIDownloadManager *)self delegates];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [(VUIDownloadManager *)self delegates];
      id v7 = (void *)[v6 pointerAtIndex:v5];

      if (v7)
      {
        id v8 = v7;
        if (objc_opt_respondsToSelector()) {
          [v8 downloadManagerDownloadsDidChange:self];
        }
      }
      ++v5;
      int v9 = [(VUIDownloadManager *)self delegates];
      unint64_t v10 = [v9 count];
    }
    while (v5 < v10);
  }
}

- (void)_isPlaybackUIBeingShownDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[VUIPlaybackManager sharedInstance];
  int v5 = [v4 isPlaybackUIBeingShown];

  id v6 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (v5) {
      id v7 = @"YES";
    }
    int v9 = 138412290;
    unint64_t v10 = v7;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "isPlaybackUIBeingShown did change to %@", (uint8_t *)&v9, 0xCu);
  }
  if ((v5 & 1) == 0)
  {
    id v8 = sLogObject_20;
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Will show error dialog (if needed) after playback transition finishes", (uint8_t *)&v9, 2u);
    }
    [(VUIDownloadManager *)self _showDownloadErrorDialogIfAppropriateAfterDelay];
  }
}

- (void)_showDownloadErrorDialogIfAppropriate
{
  id v3 = +[VUIPlaybackManager sharedInstance];
  int v4 = [v3 isPlaybackUIBeingShown];

  if (v4)
  {
    int v5 = sLogObject_20;
    if (!os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v12 = 0;
    id v6 = "Playback is happening.  Delaying error dialog until playback ends.";
    id v7 = (uint8_t *)&v12;
LABEL_13:
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    return;
  }
  if ([(VUIDownloadManager *)self dialogBeingPresented])
  {
    int v5 = sLogObject_20;
    if (!os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v11 = 0;
    id v6 = "Error dialog is already being presented.  Delaying error dialog until existing dialog ends.";
    id v7 = (uint8_t *)&v11;
    goto LABEL_13;
  }
  id v8 = +[VUITVAppLauncher sharedInstance];
  char v9 = [v8 isAppRunning];

  if ((v9 & 1) == 0)
  {
    int v5 = sLogObject_20;
    if (!os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v10 = 0;
    id v6 = "App hasn't finished launching.  Delaying error dialog until app finishes launching.";
    id v7 = (uint8_t *)&v10;
    goto LABEL_13;
  }
  [(VUIDownloadManager *)self _showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:1];
}

- (void)_showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:(BOOL)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v5 = [(VUIDownloadManager *)self _failedDownloadsNeedingDialog];
  uint64_t v6 = [v5 count];
  id v7 = (void *)sLogObject_20;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      *(_DWORD *)buf = 134217984;
      uint64_t v34 = [v5 count];
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Will show error dialog for %lu failed downloads", buf, 0xCu);
    }
    char v32 = 0;
    char v9 = [(VUIDownloadManager *)self _alertControllerForFailedDownloads:v5 outIncludeGoToSettingsButton:&v32];
    BOOL v10 = [(VUIDownloadManager *)self _anyDownloadsFailedDueToInvalidUserToken:v5];
    objc_initWeak((id *)buf, self);
    __int16 v11 = +[VUILocalizationManager sharedInstance];
    __int16 v12 = [v11 localizedStringForKey:@"OK"];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke;
    v28[3] = &unk_1E6DFB5B0;
    location = &v29;
    objc_copyWeak(&v29, (id *)buf);
    BOOL v30 = v10;
    BOOL v31 = a3;
    uint64_t v13 = +[VUIAlertAction vui_actionWithTitle:v12 style:0 handler:v28];

    objc_msgSend(v9, "vui_addAction:", v13);
    if (v32)
    {
      uint64_t v14 = +[VUILocalizationManager sharedInstance];
      uint64_t v15 = [v14 localizedStringForKey:@"DOWNLOAD_FAILED_ALERT_ACTION_GO_TO_SETTINGS"];
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      uint64_t v25 = __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke_2_57;
      uint64_t v26 = &unk_1E6DFA338;
      objc_copyWeak(&v27, (id *)buf);
      int v16 = +[VUIAlertAction vui_actionWithTitle:v15 style:0 handler:&v23];

      objc_msgSend(v9, "vui_addAction:", v16);
      objc_destroyWeak(&v27);
    }
    uint64_t v17 = +[VUIApplicationRouter topPresentedViewController];
    if (v17
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
       || ([v17 presentedViewController],
           __int16 v18 = objc_claimAutoreleasedReturnValue(),
           BOOL v19 = v18 == 0,
           v18,
           v19)))
    {
      [(VUIDownloadManager *)self setDialogBeingPresented:1];
      objc_msgSend(v9, "vui_presentAlertFromPresentingController:animated:completion:", v17, 1, 0);
    }
    else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
    {
      -[VUIDownloadManager _showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:]();
    }

    objc_destroyWeak(locationa);
    objc_destroyWeak((id *)buf);
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
  {
    -[VUIDownloadManager _showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:]();
  }
  uint64_t v20 = [(VUIDownloadManager *)self failedDownloads];
  [v20 removeAllObjects];
}

void __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke_2;
  v2[3] = &unk_1E6DF73E8;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  __int16 v4 = *(_WORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
}

void __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke_2(uint64_t a1)
{
  v2 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "Done presenting download error dialog", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v4 = WeakRetained;
  if (*(unsigned char *)(a1 + 40) && *(unsigned char *)(a1 + 41))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke_51;
    v5[3] = &unk_1E6DF6A38;
    objc_copyWeak(&v6, (id *)(a1 + 32));
    +[VUIAuthenticationManager requestAuthenticationAlwaysPrompt:1 withCompletionHandler:v5];
    objc_destroyWeak(&v6);
  }
  else
  {
    [WeakRetained setDialogBeingPresented:0];
    [v4 _showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:1];
  }
}

void __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke_51(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setDialogBeingPresented:0];
  [WeakRetained _showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:0];
}

void __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke_2_57(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=USAGE"];
  [v2 openSensitiveURL:v3 withOptions:0];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke_3;
  block[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v5);
}

void __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke_3(uint64_t a1)
{
  v2 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v4 = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "Done presenting download error dialog", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setDialogBeingPresented:0];
  [WeakRetained _showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:1];
}

- (BOOL)_anyDownloadsFailedDueToInvalidUserToken:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        char v9 = objc_msgSend(v8, "error", (void)v15);
        BOOL v10 = [v9 domain];
        if ([v10 isEqualToString:@"TVPlaybackErrorDomain"])
        {
          __int16 v11 = [v8 error];
          uint64_t v12 = [v11 code];

          if (v12 == 813)
          {
            BOOL v13 = 1;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (id)_alertControllerForFailedDownloads:(id)a3 outIncludeGoToSettingsButton:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [v6 firstObject];
  id v8 = [v7 error];
  if (a4) {
    *a4 = 0;
  }
  if (!TVPErrorIsSKDError())
  {
    if ([(VUIDownloadManager *)self _anyDownloadsFailedDueToInvalidUserToken:v6])
    {
      if ([v8 code] != 813) {
        goto LABEL_47;
      }
      long long v15 = +[VUILocalizationManager sharedInstance];
      long long v16 = [(__CFString *)v15 localizedStringForKey:@"DOWNLOAD_FAILED_SIGN_IN_TO_DOWNLOAD_MESSAGE"];
    }
    else
    {
      long long v18 = [v8 domain];
      if ([v18 isEqualToString:@"TVPlaybackErrorDomain"])
      {
        uint64_t v19 = [v8 code];

        if (v19 == 812)
        {
          uint64_t v20 = [v6 firstObject];
          uint64_t v21 = [v20 mediaItem];
          long long v15 = [v21 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];

          if (![(__CFString *)v15 length])
          {

            long long v15 = &stru_1F3E921E0;
          }
          uint64_t v22 = NSString;
          uint64_t v23 = +[VUILocalizationManager sharedInstance];
          uint64_t v24 = [v23 localizedStringForKey:@"UNABLE_TO_DOWNLOAD_RENTAL_ALREADY_DOWNLOADED_ON_ANOTHER_DEVICE_FORMAT"];
          long long v16 = [v22 localizedStringWithValidatedFormat:v24, @"%@", 0, v15 validFormatSpecifiers error];

          goto LABEL_39;
        }
      }
      else
      {
      }
      if (!+[VUIPlaybackUtilities isOutOfSpaceError:v8]) {
        goto LABEL_47;
      }
      long long v36 = [v7 mediaItem];
      long long v15 = [v36 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];

      if ([(__CFString *)v15 length])
      {
        long long v37 = NSString;
        long long v38 = +[VUILocalizationManager sharedInstance];
        long long v39 = [v38 localizedStringForKey:@"DOWNLOAD_FAILED_NOT_ENOUGH_SPACE_SPECIFIC_TITLE"];
        long long v16 = [v37 localizedStringWithValidatedFormat:v39, @"%@ %lu", 0, v15, objc_msgSend(v6, "count") - 1 validFormatSpecifiers error];
      }
      else
      {
        uint64_t v56 = [v6 count];
        v57 = +[VUILocalizationManager sharedInstance];
        long long v38 = v57;
        if (v56 == 1) {
          v58 = @"DOWNLOAD_FAILED_NOT_ENOUGH_SPACE_GENERIC_ONE";
        }
        else {
          v58 = @"DOWNLOAD_FAILED_NOT_ENOUGH_SPACE_GENERIC_MANY";
        }
        long long v16 = [v57 localizedStringForKey:v58];
      }

      if (a4) {
        *a4 = 1;
      }
    }
LABEL_39:

    goto LABEL_48;
  }
  if ([v8 code] == -345015)
  {
    char v9 = +[VUILocalizationManager sharedInstance];
    BOOL v10 = [v9 localizedStringForKey:@"DOWNLOAD_FAILED_NOT_ENTITLED_TITLE"];

    int v11 = [v7 performKeyFetchOnly];
    uint64_t v12 = +[VUILocalizationManager sharedInstance];
    BOOL v13 = v12;
    if (v11) {
      uint64_t v14 = @"DOWNLOAD_RENEWAL_FAILED_NOT_ENTITLED_MESSAGE";
    }
    else {
      uint64_t v14 = @"DOWNLOAD_FAILED_NOT_ENTITLED_MESSAGE";
    }
    goto LABEL_18;
  }
  if ([v8 code] == -345024)
  {
    long long v17 = +[VUILocalizationManager sharedInstance];
    BOOL v10 = [v17 localizedStringForKey:@"DOWNLOAD_FAILED_CONTENT_NOT_DOWNLOADABLE_TITLE"];

    uint64_t v12 = +[VUILocalizationManager sharedInstance];
    BOOL v13 = v12;
    uint64_t v14 = @"DOWNLOAD_FAILED_CONTENT_NOT_DOWNLOADABLE_MESSAGE";
LABEL_18:
    long long v16 = [v12 localizedStringForKey:v14];
    goto LABEL_43;
  }
  if ([v8 code] == -345025)
  {
    uint64_t v25 = [v7 mediaItem];
    BOOL v13 = [v25 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E18]];

    uint64_t v26 = [v7 mediaItem];
    id v27 = [v26 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];

    v28 = NSString;
    id v29 = +[VUILocalizationManager sharedInstance];
    BOOL v30 = [v29 localizedStringForKey:@"DOWNLOAD_FAILED_DEVICE_LIMIT_REACHED_TITLE_FORMAT"];
    BOOL v10 = [v28 localizedStringWithValidatedFormat:v30, @"%@", 0, v13 validFormatSpecifiers error];

    LODWORD(v29) = [v27 isEqualToString:*MEMORY[0x1E4FAA200]];
    BOOL v31 = NSString;
    char v32 = +[VUILocalizationManager sharedInstance];
    int v33 = v32;
    if (v29) {
      uint64_t v34 = @"EPISODE_DOWNLOAD_FAILED_DEVICE_LIMIT_REACHED_FORMAT";
    }
    else {
      uint64_t v34 = @"MOVIE_DOWNLOAD_FAILED_DEVICE_LIMIT_REACHED_FORMAT";
    }
    uint64_t v35 = [v32 localizedStringForKey:v34];
    long long v16 = [v31 localizedStringWithValidatedFormat:v35, @"%@", 0, v13 validFormatSpecifiers error];

    goto LABEL_42;
  }
  if ([v8 code] == -345026)
  {
    long long v40 = [v7 mediaItem];
    BOOL v13 = [v40 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];

    int v41 = [v13 isEqualToString:*MEMORY[0x1E4FAA200]];
    uint64_t v42 = [v7 mediaItem];
    uint64_t v43 = v42;
    if (v41)
    {
      id v27 = [v42 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA068]];

      uint64_t v44 = [v7 mediaItem];
      v45 = [v44 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA060]];
      uint64_t v46 = [v45 integerValue];

      v47 = [v7 mediaItem];
      int v48 = [v47 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EC0]];
      uint64_t v49 = [v48 integerValue];

      v50 = NSString;
      v51 = +[VUILocalizationManager sharedInstance];
      uint64_t v52 = [v51 localizedStringForKey:@"DOWNLOAD_FAILED_TOO_MANY_DEVICES_WITH_THIS_EPISODE_TITLE"];
      BOOL v10 = [v50 localizedStringWithValidatedFormat:v52, @"%@ %d %d", 0, v27, v46, v49 validFormatSpecifiers error];

      uint64_t v53 = NSString;
      v54 = +[VUILocalizationManager sharedInstance];
      v55 = [v54 localizedStringForKey:@"DOWNLOAD_FAILED_TOO_MANY_DEVICES_WITH_THIS_EPISODE_FORMAT"];
      long long v16 = [v53 localizedStringWithValidatedFormat:v55, @"%@", 0, v27 validFormatSpecifiers error];
    }
    else
    {
      id v27 = [v42 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];

      v65 = NSString;
      v66 = +[VUILocalizationManager sharedInstance];
      v67 = [v66 localizedStringForKey:@"DOWNLOAD_FAILED_TOO_MANY_DEVICES_WITH_THIS_MOVIE_TITLE"];
      BOOL v10 = [v65 localizedStringWithValidatedFormat:v67, @"%@", 0, v27 validFormatSpecifiers error];

      v54 = +[VUILocalizationManager sharedInstance];
      long long v16 = [v54 localizedStringForKey:@"DOWNLOAD_FAILED_TOO_MANY_DEVICES_WITH_THIS_MOVIE_MESSAGE"];
    }

    goto LABEL_42;
  }
  if ([v8 code] != -345027)
  {
    if ([v8 code] == -345023)
    {
      v68 = +[VUILocalizationManager sharedInstance];
      BOOL v10 = [v68 localizedStringForKey:@"DOWNLOAD_FAILED_NOT_ENTITLED_TITLE"];

      uint64_t v12 = +[VUILocalizationManager sharedInstance];
      BOOL v13 = v12;
      uint64_t v14 = @"VIDEO_UNAVAILABLE_IN_THIS_REGION_ERROR";
      goto LABEL_18;
    }
LABEL_47:
    long long v16 = 0;
    goto LABEL_48;
  }
  id v59 = [v7 mediaItem];
  BOOL v13 = [v59 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E18]];

  __int16 v60 = NSString;
  uint64_t v61 = +[VUILocalizationManager sharedInstance];
  v62 = [v61 localizedStringForKey:@"DOWNLOAD_FAILED_DOWNLOAD_LIMIT_REACHED_TITLE_FORMAT"];
  BOOL v10 = [v60 localizedStringWithValidatedFormat:v62, @"%@", 0, v13 validFormatSpecifiers error];

  uint64_t v63 = NSString;
  id v27 = +[VUILocalizationManager sharedInstance];
  uint64_t v64 = [v27 localizedStringForKey:@"DOWNLOAD_FAILED_DOWNLOAD_LIMIT_REACHED_FORMAT"];
  long long v16 = [v63 localizedStringWithValidatedFormat:v64, @"%@", 0, v13 validFormatSpecifiers error];

LABEL_42:
LABEL_43:

  if (v10) {
    goto LABEL_50;
  }
LABEL_48:
  if ([v8 code] == 812)
  {
    BOOL v10 = 0;
LABEL_50:
    if (v16) {
      goto LABEL_65;
    }
    goto LABEL_58;
  }
  if ([v6 count] == 1)
  {
    int v69 = [v7 performKeyFetchOnly];
    v70 = NSString;
    v71 = +[VUILocalizationManager sharedInstance];
    v72 = v71;
    if (v69) {
      v73 = @"DOWNLOAD_RENEWAL_FAILED_TITLE_FORMAT";
    }
    else {
      v73 = @"DOWNLOAD_FAILED_TITLE_FORMAT_ONE";
    }
  }
  else
  {
    v70 = NSString;
    v71 = +[VUILocalizationManager sharedInstance];
    v72 = v71;
    v73 = @"DOWNLOAD_FAILED_TITLE_FORMAT_MANY";
  }
  v74 = [v71 localizedStringForKey:v73];
  BOOL v10 = objc_msgSend(v70, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v74, @"%lu", 0, objc_msgSend(v6, "count"));

  if (v16) {
    goto LABEL_65;
  }
LABEL_58:
  v75 = [v6 firstObject];
  v76 = [v75 mediaItem];
  v77 = [v76 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];

  if ([v77 length])
  {
    int v78 = [v75 performKeyFetchOnly];
    v79 = NSString;
    v80 = +[VUILocalizationManager sharedInstance];
    v81 = v80;
    if (v78) {
      v82 = @"DOWNLOAD_RENEWAL_FAILED_MESSAGE_FORMAT";
    }
    else {
      v82 = @"DOWNLOAD_FAILED_MESSAGE_FORMAT";
    }
    v84 = [v80 localizedStringForKey:v82];
    [v79 localizedStringWithValidatedFormat:v84, @"%@ %lu", 0, v77, objc_msgSend(v6, "count") - 1 validFormatSpecifiers error];
  }
  else
  {
    v83 = NSString;
    v81 = +[VUILocalizationManager sharedInstance];
    v84 = [v81 localizedStringForKey:@"DOWNLOAD_FAILED_MESSAGE_GENERIC_FORMAT"];
    objc_msgSend(v83, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v84, @"%lu", 0, objc_msgSend(v6, "count") - 1, v87);
  long long v16 = };

LABEL_65:
  v85 = +[VUIAlertController vui_alertControllerWithTitle:v10 message:v16 preferredStyle:1];

  return v85;
}

- (void)_loadImageForVideoManagedObject:(id)a3 download:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v8 = [v11 series];
    if (v8)
    {
      [(VUIDownloadManager *)self _loadImageForSeriesManagedObject:v8 imageType:0 download:v6 useForStorageSettings:1];
      [(VUIDownloadManager *)self _loadImageForSeriesManagedObject:v8 imageType:1 download:v6 useForStorageSettings:0];
    }
  }
  [(VUIDownloadManager *)self _loadImageForVideoManagedObject:v11 imageType:0 download:v6 useForStorageSettings:(isKindOfClass & 1) == 0];
  [(VUIDownloadManager *)self _loadImageForVideoManagedObject:v11 imageType:1 download:v6 useForStorageSettings:0];
  [(VUIDownloadManager *)self _loadImageForVideoManagedObject:v11 imageType:2 download:v6 useForStorageSettings:0];
  char v9 = [v11 entitlementType];
  uint64_t v10 = [v9 integerValue];

  if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    [(VUIDownloadManager *)self _loadStorageSettingsImageFromMediaLibraryForVideoManagedObject:v11 download:v6];
  }
}

- (void)_loadImageForVideoManagedObject:(id)a3 imageType:(unint64_t)a4 download:(id)a5 useForStorageSettings:(BOOL)a6
{
  BOOL v6 = a6;
  id v14 = a5;
  id v10 = a3;
  id v11 = +[VUIMediaLibraryManager defaultManager];
  uint64_t v12 = [v11 sidebandMediaLibrary];
  BOOL v13 = [v12 imageInfoForVideo:v10 imageType:a4 createIfNeeded:0 wasCreated:0];

  if (v13) {
    [(VUIDownloadManager *)self _loadImageForImageInfoManagedObject:v13 imageType:a4 download:v14 useForStorageSettings:v6];
  }
}

- (void)_loadImageForSeriesManagedObject:(id)a3 imageType:(unint64_t)a4 download:(id)a5 useForStorageSettings:(BOOL)a6
{
  BOOL v6 = a6;
  id v14 = a5;
  id v10 = a3;
  id v11 = +[VUIMediaLibraryManager defaultManager];
  uint64_t v12 = [v11 sidebandMediaLibrary];
  BOOL v13 = [v12 imageInfoForSeries:v10 imageType:a4 createIfNeeded:0 wasCreated:0];

  if (v13) {
    [(VUIDownloadManager *)self _loadImageForImageInfoManagedObject:v13 imageType:a4 download:v14 useForStorageSettings:v6];
  }
}

- (void)_loadImageForImageInfoManagedObject:(id)a3 imageType:(unint64_t)a4 download:(id)a5 useForStorageSettings:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = [v9 imageData];
  uint64_t v12 = [v11 data];

  if (v12)
  {
    if (v6) {
      [v10 setStorageSettingsImageData:v12];
    }
  }
  else
  {
    BOOL v13 = [v9 urlFormat];
    [v9 canonicalWidth];
    double v15 = v14;
    [v9 canonicalHeight];
    double v17 = v16;
    if ([v13 length] && v15 > 0.0 && v17 > 0.0)
    {
      if (v15 <= v17) {
        double v18 = v17;
      }
      else {
        double v18 = v15;
      }
      if (a4 == 2)
      {
        uint64_t v19 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v19 bounds];
        double Width = CGRectGetWidth(v37);
      }
      else
      {
        double Width = 400.0;
      }
      uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA9CC0]), "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:", v13, 0, @"jpeg", v15 * (Width / v18), v17 * (Width / v18), 0.0);
      uint64_t v22 = [MEMORY[0x1E4FA9CD0] imageURLWithDescription:v21];
      if (v22)
      {
        objc_initWeak(&location, v10);
        uint64_t v23 = (id)sLogObject_20;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = VUIImageTypeString(a4);
          *(_DWORD *)buf = 138412546;
          int v33 = v24;
          __int16 v34 = 2112;
          id v35 = v9;
          _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_DEFAULT, "Loading image of type %@ for %@", buf, 0x16u);
        }
        uint64_t v25 = [MEMORY[0x1E4F290E0] sharedSession];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __99__VUIDownloadManager__loadImageForImageInfoManagedObject_imageType_download_useForStorageSettings___block_invoke;
        v27[3] = &unk_1E6DFB600;
        v29[1] = (id)a4;
        id v28 = v9;
        objc_copyWeak(v29, &location);
        BOOL v30 = v6;
        uint64_t v26 = [v25 dataTaskWithURL:v22 completionHandler:v27];

        [v26 resume];
        objc_destroyWeak(v29);

        objc_destroyWeak(&location);
      }
    }
  }
}

void __99__VUIDownloadManager__loadImageForImageInfoManagedObject_imageType_download_useForStorageSettings___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__VUIDownloadManager__loadImageForImageInfoManagedObject_imageType_download_useForStorageSettings___block_invoke_2;
  block[3] = &unk_1E6DFB5D8;
  id v10 = *(void **)(a1 + 48);
  id v15 = v8;
  v19[1] = v10;
  id v16 = *(id *)(a1 + 32);
  id v17 = v9;
  id v18 = v7;
  id v11 = v7;
  id v12 = v9;
  id v13 = v8;
  objc_copyWeak(v19, (id *)(a1 + 40));
  char v20 = *(unsigned char *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v19);
}

void __99__VUIDownloadManager__loadImageForImageInfoManagedObject_imageType_download_useForStorageSettings___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = *(void **)(a1 + 32);
  }
  else {
    v2 = 0;
  }
  id v3 = v2;
  uint64_t v4 = (void *)sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    uint64_t v6 = [v3 statusCode];
    id v7 = VUIImageTypeString(*(void *)(a1 + 72));
    uint64_t v8 = *(void *)(a1 + 40);
    int v21 = 134218498;
    uint64_t v22 = v6;
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v7;
    __int16 v25 = 2112;
    uint64_t v26 = v8;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Received image response with http status %ld for type %@ of %@", (uint8_t *)&v21, 0x20u);
  }
  if (*(void *)(a1 + 48) || [v3 statusCode] < 200 || objc_msgSend(v3, "statusCode") > 399)
  {
    char v20 = (void *)sLogObject_20;
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR)) {
      __99__VUIDownloadManager__loadImageForImageInfoManagedObject_imageType_download_useForStorageSettings___block_invoke_2_cold_2(a1, v20, (uint64_t *)(a1 + 48));
    }
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 56) length];
    id v10 = (void *)sLogObject_20;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v11 = *(void *)(a1 + 72);
        id v12 = v10;
        id v13 = VUIImageTypeString(v11);
        uint64_t v14 = [*(id *)(a1 + 56) length];
        int v21 = 138412546;
        uint64_t v22 = (uint64_t)v13;
        __int16 v23 = 2048;
        uint64_t v24 = v14;
        _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Received image of type %@ with length %lu", (uint8_t *)&v21, 0x16u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      id v16 = [*(id *)(a1 + 40) imageData];
      if (*(unsigned char *)(a1 + 80)) {
        [WeakRetained setStorageSettingsImageData:*(void *)(a1 + 56)];
      }
      [v16 setData:*(void *)(a1 + 56)];
      id v17 = +[VUIMediaLibraryManager defaultManager];
      id v18 = [v17 sidebandMediaLibrary];
      [v18 saveChangesToManagedObjects];

      if (v16)
      {
        uint64_t v19 = [v16 managedObjectContext];
        [v19 refreshObject:v16 mergeChanges:0];
      }
    }
    else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
    {
      __99__VUIDownloadManager__loadImageForImageInfoManagedObject_imageType_download_useForStorageSettings___block_invoke_2_cold_1();
    }
  }
}

- (void)_loadStorageSettingsImageFromMediaLibraryForVideoManagedObject:(id)a3 download:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [a3 adamID];
  if ([v6 length])
  {
    id v7 = sLogObject_20;
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v6;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Looking up artwork for adam ID %@ to use with storage settings", buf, 0xCu);
    }
    uint64_t v8 = (void *)MEMORY[0x1E4F31928];
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));
    id v10 = objc_msgSend(v8, "vui_mediaItemForStoreIdentifier:", v9);

    if (v10)
    {
      uint64_t v11 = _loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download__dispatchQueueNum++;
      objc_msgSend(NSString, "stringWithFormat:", @"VUIDownloadManager media library image load queue %d", v11);
      id v12 = objc_claimAutoreleasedReturnValue();
      id v13 = dispatch_queue_create((const char *)[v12 UTF8String], 0);

      objc_initWeak((id *)buf, v5);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __94__VUIDownloadManager__loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download___block_invoke;
      block[3] = &unk_1E6DF64E8;
      id v15 = v10;
      objc_copyWeak(&v17, (id *)buf);
      id v16 = v6;
      dispatch_async(v13, block);

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __94__VUIDownloadManager__loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download___block_invoke(id *a1)
{
  v2 = [a1[4] artworkCatalog];
  id v3 = v2;
  if (v2)
  {
    if ([v2 hasImageOnDisk])
    {
      uint64_t v4 = [v3 bestImageFromDisk];
      id v5 = v4;
      if (v4)
      {
        uint64_t v6 = UIImageJPEGRepresentation(v4, 1.0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __94__VUIDownloadManager__loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download___block_invoke_2;
        block[3] = &unk_1E6DF3F90;
        objc_copyWeak(&v14, a1 + 6);
        id v12 = v6;
        id v13 = a1[5];
        id v7 = v6;
        dispatch_async(MEMORY[0x1E4F14428], block);

        objc_destroyWeak(&v14);
      }
    }
    else
    {
      objc_msgSend(v3, "setFittingSize:", *MEMORY[0x1E4F31290], *(double *)(MEMORY[0x1E4F31290] + 8));
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __94__VUIDownloadManager__loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download___block_invoke_172;
      v8[3] = &unk_1E6DFB628;
      objc_copyWeak(&v10, a1 + 6);
      id v9 = a1[5];
      [v3 requestImageWithCompletion:v8];

      objc_destroyWeak(&v10);
    }
  }
}

void __94__VUIDownloadManager__loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v3 = sLogObject_20;
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "Retrieved image data (on-disk) for adam ID %@ to use with storage settings", (uint8_t *)&v5, 0xCu);
    }
    [WeakRetained setStorageSettingsImageData:*(void *)(a1 + 32)];
  }
}

void __94__VUIDownloadManager__loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download___block_invoke_172(uint64_t a1, UIImage *image)
{
  if (image)
  {
    id v3 = UIImageJPEGRepresentation(image, 1.0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__VUIDownloadManager__loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download___block_invoke_2_173;
    block[3] = &unk_1E6DF3F90;
    objc_copyWeak(&v8, (id *)(a1 + 40));
    id v6 = v3;
    id v7 = *(id *)(a1 + 32);
    id v4 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v8);
  }
}

void __94__VUIDownloadManager__loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download___block_invoke_2_173(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v3 = sLogObject_20;
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "Retrieved image data (requested from network) for adam ID %@ to use with storage settings", (uint8_t *)&v5, 0xCu);
    }
    [WeakRetained setStorageSettingsImageData:*(void *)(a1 + 32)];
  }
}

- (void)_activeAccountDidChange:(id)a3
{
  uint64_t v4 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Active account did change.  Cancelling in-progress downloads for user that is no longer signed in.", buf, 2u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VUIDownloadManager__activeAccountDidChange___block_invoke;
  block[3] = &unk_1E6DF3D58;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __46__VUIDownloadManager__activeAccountDidChange___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v3 = objc_msgSend(v2, "ams_activeiTunesAccount");
  uint64_t v4 = objc_msgSend(v3, "ams_DSID");

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v5 = [*(id *)(a1 + 32) downloads];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    uint64_t v9 = *MEMORY[0x1E4FA9E70];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [v11 mediaItem];
        id v13 = [v12 mediaItemMetadataForProperty:v9];

        if (v13) {
          BOOL v14 = v4 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (v14 || ([v13 isEqualToNumber:v4] & 1) == 0)
        {
          [v11 cancel];
        }
        else
        {
          id v15 = sLogObject_20;
          if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v16 = 0;
            _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Allowing download to continue after account change since download is for the current user", v16, 2u);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
}

- (id)_createMediaItemForVideoManagedObject:(id)a3 isForStartingDownload:(BOOL)a4 downloadQuality:(int64_t)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 entitlementType];
  uint64_t v9 = [v8 integerValue];

  if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v10 = [v7 adamID];
    uint64_t v11 = -[VUIStoreMediaItem_iOS initWithAdamID:videoManagedObject:isForStartingDownload:]([VUIStoreMediaItem_iOS alloc], "initWithAdamID:videoManagedObject:isForStartingDownload:", [v10 longLongValue], v7, v6);

    id v12 = [(VUIStoreMediaItem_iOS *)v11 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
    id v13 = +[VUIMetricsController sharedInstance];
    BOOL v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v10, "longLongValue"));
    id v15 = [v13 iTunesLibraryPlaybackMediaMetricsForAdamID:v14 mediaType:v12];

    [(VUIStoreMediaItem_iOS *)v11 setMediaItemMetadata:v15 forProperty:*MEMORY[0x1E4FA9FA8]];
    id v7 = v10;
  }
  else
  {
    uint64_t v11 = [[VUIStoreAuxMediaItem alloc] initWithVideoManagedObject:v7 isForStartingDownload:v6];
  }

  if (v6)
  {
    id v16 = [MEMORY[0x1E4F28ED0] numberWithInteger:a5];
    [(VUIStoreMediaItem_iOS *)v11 setMediaItemMetadata:v16 forProperty:@"VUIContentMetadataDownloadQuality"];
  }
  return v11;
}

- (void)_configureDownloadFromUserPrefs:(id)a3 allowCellular:(BOOL)a4 quality:(int64_t)a5 prefer3DOrImmersiveDownload:(BOOL)a6
{
  BOOL v40 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[VUIPlaybackSettings sharedSettings];
  uint64_t v8 = [v7 preferredAudioDownloadLanguages];
  uint64_t v9 = (void *)[v8 mutableCopy];

  id v10 = +[VUIPlaybackSettings sharedSettings];
  char v11 = [v10 useDefaultSubtitleDownloadLanguages];

  id v12 = +[VUIPlaybackSettings sharedSettings];
  long long v39 = [v12 preferredSubtitleDownloadLanguages];

  id v13 = +[VUIPlaybackSettings sharedSettings];
  uint64_t v14 = [v13 preferAVAdapterCompatibility];

  uint64_t v15 = [v9 containsObject:@"DEFAULT_LANGUAGE"];
  if (v15) {
    [v9 removeObject:@"DEFAULT_LANGUAGE"];
  }
  uint64_t v16 = [v9 containsObject:@"ORIGINAL_AUDIO_LANGUAGE"];
  if (v16) {
    [v9 removeObject:@"ORIGINAL_AUDIO_LANGUAGE"];
  }
  uint64_t v17 = [v9 containsObject:@"DEVICE_AUDIO_LANGUAGE"];
  if (v17) {
    [v9 removeObject:@"DEVICE_AUDIO_LANGUAGE"];
  }
  long long v18 = +[VUIPlaybackSettings sharedSettings];
  long long v19 = [v18 preferredAudioLanguageCode];

  if (v19)
  {
    long long v20 = +[VUIPlaybackSettings sharedSettings];
    int v21 = [v20 preferredAudioLanguageCode];
    [v9 addObject:v21];
  }
  if (v11) {
    id v22 = 0;
  }
  else {
    id v22 = v39;
  }
  [v6 setAllowCellularUsage:v40];
  [v6 setIncludeDefaultAudioOption:v15];
  [v6 setIncludeOriginalAudio:v16];
  [v6 setIncludeDeviceLanguageAudio:v17];
  [v6 setPreferredAudioLanguageCodes:v9];
  [v6 setAllowMultichannelAudio:1];
  [v6 setIncludesAllSubtitles:0];
  [v6 setPreferredSubtitleLanguageCodes:v22];
  [v6 setPreferMostCompatibleRendition:v14];
  [v6 setLimitMultichannelAudioToSingleLanguage:1];
  if ((a5 | 2) == 2)
  {
    if ([MEMORY[0x1E4F4DC48] deviceIsiPad])
    {
LABEL_14:
      char v23 = 0;
      uint64_t v24 = &unk_1F3F3D3D0;
      __int16 v25 = &unk_1F3F3D3E8;
      uint64_t v26 = &unk_1F3F3E698;
      uint64_t v27 = &unk_1F3F3D3D0;
      goto LABEL_34;
    }
    int v28 = MGGetSInt32Answer();
    id v29 = sLogObject_20;
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v42 = v28;
      _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "Screen class: %ld", buf, 0xCu);
    }
    if (v28 > 8)
    {
      if (v28 == 9)
      {
        char v23 = 0;
        uint64_t v27 = &unk_1F3F3D3D0;
        uint64_t v24 = &unk_1F3F3D3A0;
        __int16 v25 = &unk_1F3F3D3B8;
        uint64_t v26 = &unk_1F3F3E698;
      }
      else
      {
        if (v28 != 19) {
          goto LABEL_14;
        }
        __int16 v25 = 0;
        uint64_t v24 = 0;
        uint64_t v27 = 0;
        char v23 = 1;
        uint64_t v26 = &unk_1F3F3E6A8;
      }
    }
    else if (v28 == 5)
    {
      __int16 v25 = 0;
      uint64_t v24 = 0;
      uint64_t v27 = 0;
      char v23 = 1;
      uint64_t v26 = &unk_1F3F3E6D8;
    }
    else
    {
      if (v28 != 8) {
        goto LABEL_14;
      }
      __int16 v25 = 0;
      uint64_t v24 = 0;
      uint64_t v27 = 0;
      char v23 = 1;
      uint64_t v26 = &unk_1F3F3E6C8;
    }
  }
  else if ([MEMORY[0x1E4F4DC48] deviceIsiPad])
  {
    __int16 v25 = 0;
    uint64_t v24 = 0;
    uint64_t v27 = 0;
    char v23 = 1;
    uint64_t v26 = &unk_1F3F3E6B8;
  }
  else
  {
    int v30 = MGGetSInt32Answer();
    BOOL v31 = &unk_1F3F3E6C8;
    if (v30 == 8) {
      BOOL v31 = &unk_1F3F3E6D8;
    }
    if (v30 == 5) {
      uint64_t v26 = &unk_1F3F3E6E8;
    }
    else {
      uint64_t v26 = v31;
    }
    char v23 = 1;
    __int16 v25 = 0;
    uint64_t v24 = 0;
    uint64_t v27 = 0;
  }
LABEL_34:
  [v6 setMaximumPresentationWidth:v26];
  [v6 setMaximumAverageBitrateForHDR:v25];
  [v6 setMaximumAverageBitrateForSDRHEVC:v24];
  [v6 setMaximumAverageBitrateForAVC:v27];
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v32 setObject:v26 forKey:@"maxWidth"];
  if ((v23 & 1) == 0)
  {
    [v32 setObject:v25 forKey:@"maximumAverageBitrateForHDR"];
    [v32 setObject:v24 forKey:@"maximumAverageBitrateForSDRHEVC"];
    [v32 setObject:v27 forKey:@"maximumAverageBitrateForAVC"];
  }
  int v33 = @"Fast Downloads";
  if (!a5) {
    int v33 = @"High Quality";
  }
  __int16 v34 = (void *)MEMORY[0x1E4F28ED0];
  id v35 = v33;
  uint64_t v36 = [v34 numberWithBool:v40];
  [v32 setObject:v36 forKey:@"cellularAllowed"];

  [v32 setObject:v35 forKey:@"downloadQualitySetting"];
  [v32 setObject:MEMORY[0x1E4F1CC38] forKey:@"preferHDR"];
  CGRect v37 = [v6 mediaItem];
  [v37 setMediaItemMetadata:v32 forProperty:*MEMORY[0x1E4FA9E98]];
}

- (void)_downloadQueueManagerHandleErrorsIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    id v3 = +[VUIInterfaceFactory sharedInstance];
    uint64_t v4 = [v3 downloadQueueManager];

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [(VUIDownloadManager *)self failedDownloads];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          char v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) error];
          if (v11) {
            [v5 addObject:v11];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    id v12 = (void *)[v5 copy];
    [v4 handleErrors:v12];
  }
}

- (id)_failedDownloadsNeedingDialog
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [(VUIDownloadManager *)self failedDownloads];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = [v8 error];
        uint64_t v10 = [v9 userInfo];
        char v11 = [v10 objectForKey:@"VUIDownloadManagerSuppressErrorDialogKey"];
        char v12 = [v11 BOOLValue];

        if ((v12 & 1) == 0) {
          [v15 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  long long v13 = (void *)[v15 copy];
  return v13;
}

- (void)setMutableDownloads:(id)a3
{
}

- (NSMutableArray)failedDownloads
{
  return self->_failedDownloads;
}

- (void)setFailedDownloads:(id)a3
{
}

- (BOOL)dialogBeingPresented
{
  return self->_dialogBeingPresented;
}

- (void)setDialogBeingPresented:(BOOL)a3
{
  self->_dialogBeingPresented = a3;
}

- (void)setDelegates:(id)a3
{
}

- (BOOL)performingAddDownloadsBatch
{
  return self->_performingAddDownloadsBatch;
}

- (void)setPerformingAddDownloadsBatch:(BOOL)a3
{
  self->_performingAddDownloadsBatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_failedDownloads, 0);
  objc_storeStrong((id *)&self->_mutableDownloads, 0);
}

- (void)addDownloadForVideoManagedObject:allowCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to add download because video managed object is nil", v2, v3, v4, v5, v6);
}

- (void)addDownloadForVideoManagedObject:allowCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Not adding download since one already exists for this item", v2, v3, v4, v5, v6);
}

- (void)fetchNewKeysForDownloadedVideoManagedObject:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to fetch new keys because video managed object is nil", v2, v3, v4, v5, v6);
}

- (void)fetchNewKeysForDownloadedVideoManagedObject:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to fetch new keys because video managed object does not allow manual renewal", v2, v3, v4, v5, v6);
}

- (void)fetchNewKeysForDownloadedVideoManagedObject:.cold.3()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to fetch new keys because video managed object is not in state Downloaded", v2, v3, v4, v5, v6);
}

- (void)addDownloadOrRenewKeysForMediaItem:allowCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to fetch new keys or redownload because video managed object is nil", v2, v3, v4, v5, v6);
}

- (void)download:willDownloadToURL:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to persist download URL because media item has no adam ID", v2, v3, v4, v5, v6);
}

- (void)download:didReceiveTaskIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to persist task identifier because media item has no adam ID", v2, v3, v4, v5, v6);
}

- (void)downloadSession:(os_log_t)log didAddRestoredDownloads:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Restored download is failed", buf, 2u);
}

- (void)download:willDownloadVariants:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to save downloaded playback mode because media item has no adam ID", v2, v3, v4, v5, v6);
}

- (void)_showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Not showing error dialog because no failed downloads exist", v2, v3, v4, v5, v6);
}

- (void)_showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to find view controller from which to present download error dialog, or another dialog is already being presented", v2, v3, v4, v5, v6);
}

void __99__VUIDownloadManager__loadImageForImageInfoManagedObject_imageType_download_useForStorageSettings___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Image has zero length", v2, v3, v4, v5, v6);
}

void __99__VUIDownloadManager__loadImageForImageInfoManagedObject_imageType_download_useForStorageSettings___block_invoke_2_cold_2(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = *(void *)(a1 + 72);
  uint8_t v6 = a2;
  uint64_t v7 = VUIImageTypeString(v5);
  uint64_t v8 = *a3;
  uint64_t v9 = *(void *)(a1 + 40);
  int v10 = 138412802;
  char v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = v8;
  __int16 v14 = 2112;
  uint64_t v15 = v9;
  _os_log_error_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_ERROR, "Error loading image of type %@: %@ for %@", (uint8_t *)&v10, 0x20u);
}

@end