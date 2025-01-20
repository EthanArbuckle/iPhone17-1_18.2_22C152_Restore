@interface MCDPCModel
- (BOOL)didFinishInitialLoad;
- (BOOL)isCurrentPlayingApp;
- (CGSize)imageSize;
- (MCDPCItem)rootItem;
- (MCDPCModel)initWithBundleID:(id)a3;
- (MCDPlayableContentPlaybackManager)playableContentPlaybackManager;
- (MPWeakTimer)beginLoadingTimeoutTimer;
- (MPWeakTimer)playbackProgressTimeoutTimer;
- (NSIndexPath)selectedIndexPath;
- (NSMutableDictionary)beginLoadingBlocks;
- (NSMutableDictionary)items;
- (NSString)appTitle;
- (NSString)bundleID;
- (OS_dispatch_queue)mediaRemoteItemQueue;
- (OS_dispatch_queue)mediaRemoteNotificationQueue;
- (id)_errorForNotification:(id)a3;
- (id)containerCompletion;
- (id)containerForRoot;
- (id)itemsFromMRContentItems:(id)a3;
- (id)playbackCompletion;
- (unsigned)supportedAPIMask;
- (void)_browsableContentDidRegisterNotification:(id)a3;
- (void)_contentItemsUpdated:(id)a3;
- (void)_dataSourceInvalidated:(id)a3;
- (void)_finishBeginLoadingNotification:(id)a3;
- (void)_finishPlaybackNotification:(id)a3;
- (void)_invalidateBeginLoadingTimeoutTimer;
- (void)_invalidatePlaybackProgressTimeoutTimer;
- (void)_nowPlayingDidChangeNotification:(id)a3;
- (void)_registerForClientContent;
- (void)_registerNotifications;
- (void)_setupBeginLoadingTimeoutTimerWithCompletion:(id)a3;
- (void)_setupPlaybackProgressTimeoutTimerWithCompletion:(id)a3;
- (void)beginLoadingItemAtIndexPath:(id)a3 completion:(id)a4;
- (void)contentManager:(id)a3 itemDidChange:(id)a4 response:(id)a5;
- (void)dealloc;
- (void)getChildrenAtIndexPath:(id)a3 inRange:(_NSRange)a4 completion:(id)a5;
- (void)getChildrenSupportsPlaybackProgressForIndexPath:(id)a3 withCompletion:(id)a4;
- (void)getCountOfChildrenAtIndexPath:(id)a3 withCompletion:(id)a4;
- (void)getNowPlayingIdentifiersWithCompletion:(id)a3;
- (void)initiatePlaybackAtIndexPath:(id)a3 completion:(id)a4;
- (void)setBeginLoadingBlocks:(id)a3;
- (void)setBeginLoadingTimeoutTimer:(id)a3;
- (void)setContainerCompletion:(id)a3;
- (void)setCurrentPlayingApp:(BOOL)a3;
- (void)setDidFinishInitialLoad:(BOOL)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setItems:(id)a3;
- (void)setMediaRemoteItemQueue:(id)a3;
- (void)setMediaRemoteNotificationQueue:(id)a3;
- (void)setPlayableContentPlaybackManager:(id)a3;
- (void)setPlaybackCompletion:(id)a3;
- (void)setPlaybackProgressTimeoutTimer:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setSupportedAPIMask:(unsigned int)a3;
@end

@implementation MCDPCModel

- (MCDPCModel)initWithBundleID:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MCDPCModel;
  v6 = [(MCDPCModel *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleID, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MusicCarDisplayUI.playableContent.mediaRemote", v8);
    mediaRemoteNotificationQueue = v7->_mediaRemoteNotificationQueue;
    v7->_mediaRemoteNotificationQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.MusicCarDisplayUI.playableContent.mediaRemote.items", v11);
    mediaRemoteItemQueue = v7->_mediaRemoteItemQueue;
    v7->_mediaRemoteItemQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    items = v7->_items;
    v7->_items = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    beginLoadingBlocks = v7->_beginLoadingBlocks;
    v7->_beginLoadingBlocks = (NSMutableDictionary *)v16;

    v18 = [MCDPlayableContentPlaybackManager alloc];
    v19 = objc_alloc_init(MCDPlayableContentNowPlayingDataSource);
    uint64_t v20 = [(_MCDNowPlayingContentManager *)v18 initWithDelegate:v7 dataSource:v19 bundleID:v5];
    playableContentPlaybackManager = v7->_playableContentPlaybackManager;
    v7->_playableContentPlaybackManager = (MCDPlayableContentPlaybackManager *)v20;

    [(MCDPCModel *)v7 _registerForClientContent];
  }

  return v7;
}

- (void)dealloc
{
  MRMediaRemoteUnregisterForNowPlayingNotifications();
  [(_MCDNowPlayingContentManager *)self->_playableContentPlaybackManager endRequestObservation];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MCDPCModel;
  [(MCDPCModel *)&v4 dealloc];
}

- (void)contentManager:(id)a3 itemDidChange:(id)a4 response:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v6 = objc_msgSend(a5, "playerPath", a3, a4);
  v7 = [v6 representedBundleID];
  -[MCDPCModel setCurrentPlayingApp:](self, "setCurrentPlayingApp:", [v7 isEqualToString:self->_bundleID]);

  v8 = MCDGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    bundleID = self->_bundleID;
    BOOL v10 = [(MCDPCModel *)self isCurrentPlayingApp];
    v11 = @"NO";
    if (v10) {
      v11 = @"YES";
    }
    int v12 = 138543618;
    v13 = bundleID;
    __int16 v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_23F140000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ is now playing app? %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)_registerForClientContent
{
  objc_initWeak(&location, self);
  id v3 = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  objc_copyWeak(&v5, &location);
  MRMediaRemoteGetSupportedBrowsableContentAPIs();

  [(MCDPCModel *)self _registerNotifications];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__MCDPCModel__registerForClientContent__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSupportedAPIMask:a2];
  [WeakRetained _browsableContentDidRegisterNotification:0];
}

- (void)_registerNotifications
{
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__dataSourceInvalidated_ name:*MEMORY[0x263F54970] object:0];
  [v4 addObserver:self selector:sel__contentItemsUpdated_ name:*MEMORY[0x263F54AD8] object:0];
  [v4 addObserver:self selector:sel__nowPlayingDidChangeNotification_ name:*MEMORY[0x263F54B28] object:0];
  [v4 addObserver:self selector:sel__nowPlayingDidChangeNotification_ name:*MEMORY[0x263F54DD0] object:0];
  [v4 addObserver:self selector:sel__nowPlayingDidChangeNotification_ name:*MEMORY[0x263F54B88] object:0];
  [v4 addObserver:self selector:sel__nowPlayingDidChangeNotification_ name:*MEMORY[0x263F54B30] object:0];
  MRMediaRemoteRegisterForNowPlayingNotifications();
  id v3 = [(MCDPCModel *)self playableContentPlaybackManager];
  [v3 beginRequestObservation];
}

- (void)_dataSourceInvalidated:(id)a3
{
  objc_initWeak(&location, self);
  mediaRemoteNotificationQueue = self->_mediaRemoteNotificationQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__MCDPCModel__dataSourceInvalidated___block_invoke;
  v5[3] = &unk_26505BDF0;
  objc_copyWeak(&v6, &location);
  dispatch_async(mediaRemoteNotificationQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __37__MCDPCModel__dataSourceInvalidated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = MCDGeneralLogging();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F140000, v2, OS_LOG_TYPE_DEFAULT, "Data source invalidated", buf, 2u);
    }

    id v3 = WeakRetained[13];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__MCDPCModel__dataSourceInvalidated___block_invoke_39;
    block[3] = &unk_26505BE68;
    v7 = WeakRetained;
    dispatch_sync(v3, block);
    id v4 = MCDGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Posting MCDPCDidInvalidateNotificationName", buf, 2u);
    }

    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"didInvalidate" object:0];
  }
}

void __37__MCDPCModel__dataSourceInvalidated___block_invoke_39(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF9A0] dictionary];
  [*(id *)(a1 + 32) setItems:v2];
}

- (void)_contentItemsUpdated:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = MCDGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "Content items updated", buf, 2u);
  }

  id v6 = [v4 userInfo];

  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F54980]];
  v8 = [(MCDPCModel *)self bundleID];
  char v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    BOOL v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263F54E38]];
    if (v10)
    {
      v11 = [(MCDPCModel *)self itemsFromMRContentItems:v10];
      if ([v11 count])
      {
        uint64_t v16 = @"items";
        v17 = v11;
        int v12 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      }
      else
      {
        int v12 = 0;
      }
      __int16 v14 = MCDGeneralLogging();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23F140000, v14, OS_LOG_TYPE_DEFAULT, "Posting MCDPCDidUpdateContentNotificationName", buf, 2u);
      }

      v15 = [MEMORY[0x263F08A00] defaultCenter];
      [v15 postNotificationName:@"didUpdateContent" object:self userInfo:v12];
    }
    else
    {
      v11 = MCDGeneralLogging();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23F140000, v11, OS_LOG_TYPE_DEFAULT, "Got content items updated notification, but no updated content items", buf, 2u);
      }
    }
  }
  else
  {
    BOOL v10 = MCDGeneralLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(MCDPCModel *)self bundleID];
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      __int16 v20 = 2114;
      v21 = v7;
      _os_log_impl(&dword_23F140000, v10, OS_LOG_TYPE_DEFAULT, "Content items updated for wrong app, expected %{public}@, got %{public}@", buf, 0x16u);
    }
  }
}

- (void)_nowPlayingDidChangeNotification:(id)a3
{
  id v4 = MCDGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Posting MCDPCNowPlayingDidChangeNotificationName", v6, 2u);
  }

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"nowPlayingChange" object:self];
}

- (void)_browsableContentDidRegisterNotification:(id)a3
{
  id v4 = MCDGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Posting MCDPCAppReadyToFetchNotificationName", v6, 2u);
  }

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"appReadyToFetch" object:self];
}

- (NSString)appTitle
{
  id v2 = (void *)MEMORY[0x263F01868];
  id v3 = [(MCDPCModel *)self bundleID];
  id v4 = [v2 applicationProxyForIdentifier:v3];

  id v5 = [v4 localizedNameForContext:@"Car"];
  if (!v5)
  {
    id v5 = [v4 localizedName];
  }

  return (NSString *)v5;
}

- (id)containerForRoot
{
  id v3 = [MCDPCContainer alloc];
  id v4 = [MEMORY[0x263F088C8] indexPathWithIndexes:0 length:0];
  id v5 = [(MCDPCContainer *)v3 _initWithModel:self rootItem:0 indexPath:v4];

  return v5;
}

- (void)beginLoadingItemAtIndexPath:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  BOOL v8 = ([(MCDPCModel *)self supportedAPIMask] & 1) == 0;
  char v9 = MCDGeneralLogging();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F140000, v9, OS_LOG_TYPE_DEFAULT, "beginLoadingPlayableContent API is not implemented", buf, 2u);
    }

    v7[2](v7, 0);
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      id v35 = v6;
      _os_log_impl(&dword_23F140000, v9, OS_LOG_TYPE_DEFAULT, "Beginning to load item at index path: %{public}@", buf, 0xCu);
    }

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:self selector:sel__finishBeginLoadingNotification_ name:*MEMORY[0x263F54960] object:0];

    int v12 = (void **)_MCDCreateMediaRemoteIndexPath(v6);
    v13 = [(MCDPCModel *)self bundleID];
    unsigned int v14 = MRMediaRemoteBeginLoadingBrowsableContent();

    free(*v12);
    free(v12);
    if (v14)
    {
      if (v14 == 6)
      {
        v15 = MCDGeneralLogging();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v35 = v6;
          _os_log_impl(&dword_23F140000, v15, OS_LOG_TYPE_DEFAULT, "beginLoadingPlayableContent API is not implemented, receiving unsupported operation for index path: %{public}@", buf, 0xCu);
        }

        if (v7) {
          v7[2](v7, 0);
        }
      }
      else
      {
        objc_super v23 = MCDGeneralLogging();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v35) = v14;
          _os_log_impl(&dword_23F140000, v23, OS_LOG_TYPE_DEFAULT, "beginLoadingPlayableContent API error, code: %d", buf, 8u);
        }

        if (v7)
        {
          v24 = (void *)MEMORY[0x263F087E8];
          uint64_t v32 = *MEMORY[0x263F08320];
          v25 = MCDCarDisplayBundle();
          v26 = [v25 localizedStringForKey:@"ERROR_LOADING_ITEM" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
          v33 = v26;
          v27 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          v28 = [v24 errorWithDomain:@"MCDError" code:v14 userInfo:v27];
          ((void (**)(id, void *))v7)[2](v7, v28);
        }
      }
    }
    else
    {
      uint64_t v16 = MCDGeneralLogging();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v35 = v6;
        _os_log_impl(&dword_23F140000, v16, OS_LOG_TYPE_DEFAULT, "beginLoadingPlayableContent API in progress for %{public}@", buf, 0xCu);
      }

      v17 = [(MCDPCModel *)self beginLoadingBlocks];
      v18 = [v17 objectForKeyedSubscript:v6];
      BOOL v19 = v18 == 0;

      if (v19)
      {
        __int16 v20 = (void *)[v7 copy];
        v21 = (void *)MEMORY[0x2455C5E50]();
        uint64_t v22 = [(MCDPCModel *)self beginLoadingBlocks];
        [v22 setObject:v21 forKeyedSubscript:v6];
      }
      objc_initWeak((id *)buf, self);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __53__MCDPCModel_beginLoadingItemAtIndexPath_completion___block_invoke;
      v29[3] = &unk_26505C228;
      id v30 = v6;
      objc_copyWeak(&v31, (id *)buf);
      [(MCDPCModel *)self _setupBeginLoadingTimeoutTimerWithCompletion:v29];
      objc_destroyWeak(&v31);

      objc_destroyWeak((id *)buf);
    }
  }
}

void __53__MCDPCModel_beginLoadingItemAtIndexPath_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = MCDGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v3;
    _os_log_impl(&dword_23F140000, v2, OS_LOG_TYPE_DEFAULT, "beginLoadingPlayableContent API timed out, completion block wasn't called for index path: %{public}@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 length];
  v7 = malloc_type_malloc(0x10uLL, 0x1010040FDD9F14CuLL);
  BOOL v8 = v7;
  v7[1] = v6;
  if (v6)
  {
    uint64_t v9 = 0;
    void *v7 = malloc_type_malloc(8 * v6, 0x100004000313F17uLL);
    do
    {
      *(void *)(*v8 + 8 * v9) = [v5 indexAtPosition:v9];
      ++v9;
    }
    while (v6 != v9);
  }
  else
  {
    void *v7 = 0;
  }
  BOOL v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytes:length:", *v8, 8 * objc_msgSend(v5, "length"));

  id v11 = objc_alloc(MEMORY[0x263F089F8]);
  uint64_t v12 = *MEMORY[0x263F54960];
  uint64_t v15 = *MEMORY[0x263F54AE8];
  uint64_t v16 = v10;
  v13 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  unsigned int v14 = (void *)[v11 initWithName:v12 object:0 userInfo:v13];

  [WeakRetained _finishBeginLoadingNotification:v14];
}

- (void)_finishBeginLoadingNotification:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F54988]];
  v7 = [v4 userInfo];
  BOOL v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F54AE8]];

  id v9 = v8;
  uint64_t v10 = [v9 bytes];
  unint64_t v11 = [v9 length];

  id v12 = MCDNSIndexPathFromMRMediaRemoteIndexPath(v10, v11 >> 3);
  v13 = [(MCDPCModel *)self beginLoadingBlocks];
  unsigned int v14 = [v13 objectForKeyedSubscript:v12];

  if ([v6 isEqualToNumber:&unk_26F2E2E90])
  {
    uint64_t v15 = MCDGeneralLogging();
    uint64_t v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138543362;
        id v25 = v12;
        _os_log_impl(&dword_23F140000, v16, OS_LOG_TYPE_DEFAULT, "Received kMRMediaRemoteApplicationFinishedLoadingContentNotification, beginLoadingPlayableContent API not implemented for index path: %{public}@", (uint8_t *)&v24, 0xCu);
      }

      v14[2](v14, 0);
      uint64_t v16 = [(MCDPCModel *)self beginLoadingBlocks];
      [v16 setObject:0 forKeyedSubscript:v12];
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[MCDPCModel _finishBeginLoadingNotification:]((uint64_t)v12, v16);
    }
    goto LABEL_20;
  }
  uint64_t v16 = [(MCDPCModel *)self _errorForNotification:v4];
  v17 = MCDGeneralLogging();
  uint64_t v18 = v17;
  if (v14)
  {
    BOOL v19 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v19)
      {
        int v24 = 138543618;
        id v25 = v12;
        __int16 v26 = 2114;
        v27 = v6;
        __int16 v20 = "Received kMRMediaRemoteApplicationFinishedLoadingContentNotification for index path: %{public}@, beginLoad"
              "ingPlayableContent API error: %{public}@";
        v21 = v18;
        uint32_t v22 = 22;
LABEL_17:
        _os_log_impl(&dword_23F140000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v24, v22);
      }
    }
    else if (v19)
    {
      int v24 = 138543362;
      id v25 = v12;
      __int16 v20 = "Received kMRMediaRemoteApplicationFinishedLoadingContentNotification without error for index path: %{public}@";
      v21 = v18;
      uint32_t v22 = 12;
      goto LABEL_17;
    }

    ((void (**)(void, NSObject *))v14)[2](v14, v16);
    uint64_t v18 = [(MCDPCModel *)self beginLoadingBlocks];
    [v18 setObject:0 forKeyedSubscript:v12];
LABEL_19:

    goto LABEL_20;
  }
  BOOL v23 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v16)
  {
    if (v23) {
      [(MCDPCModel *)(uint64_t)v6 _finishBeginLoadingNotification:v18];
    }
    goto LABEL_19;
  }
  if (v23) {
    -[MCDPCModel _finishBeginLoadingNotification:]((uint64_t)v12, v18);
  }
  uint64_t v16 = v18;
LABEL_20:

  [(MCDPCModel *)self _invalidateBeginLoadingTimeoutTimer];
}

- (void)getChildrenSupportsPlaybackProgressForIndexPath:(id)a3 withCompletion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(MCDPCModel *)self supportedAPIMask];
  id v9 = MCDGeneralLogging();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 2) != 0)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v6;
      _os_log_impl(&dword_23F140000, v9, OS_LOG_TYPE_DEFAULT, "Preparing to fetch if children support playback progress for index path: %{public}@", buf, 0xCu);
    }

    unint64_t v11 = (void **)_MCDCreateMediaRemoteIndexPath(v6);
    id v12 = [(MCDPCModel *)self bundleID];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __77__MCDPCModel_getChildrenSupportsPlaybackProgressForIndexPath_withCompletion___block_invoke;
    BOOL v19 = &unk_26505C250;
    __int16 v20 = self;
    id v21 = v6;
    id v22 = v7;
    MRMediaRemoteBrowsableContentSupportsPlaybackProgress();

    free(*v11);
    free(v11);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __77__MCDPCModel_getChildrenSupportsPlaybackProgressForIndexPath_withCompletion___block_invoke_63;
    v13[3] = &unk_26505C278;
    id v14 = v21;
    id v15 = v22;
    [(MCDPCModel *)self _setupPlaybackProgressTimeoutTimerWithCompletion:v13];
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F140000, v9, OS_LOG_TYPE_DEFAULT, "childItemsDisplayPlaybackProgress API is not implemented", buf, 2u);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

uint64_t __77__MCDPCModel_getChildrenSupportsPlaybackProgressForIndexPath_withCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _invalidatePlaybackProgressTimeoutTimer];
  id v4 = MCDGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Fetched children supporting playback progress for index path: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void, BOOL, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2 != 0, 0);
}

uint64_t __77__MCDPCModel_getChildrenSupportsPlaybackProgressForIndexPath_withCompletion___block_invoke_63(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = MCDGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_23F140000, v2, OS_LOG_TYPE_DEFAULT, "Children support playback progress timed out for: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getNowPlayingIdentifiersWithCompletion:(id)a3
{
  id v4 = a3;
  char v5 = [(MCDPCModel *)self supportedAPIMask];
  uint64_t v6 = MCDGeneralLogging();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 4) != 0)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F140000, v6, OS_LOG_TYPE_DEFAULT, "Preparing to fetch now playing identifiers", buf, 2u);
    }

    id v8 = v4;
    MRMediaRemoteBrowsableContentGetNowPlayingContentIdentifiers();
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F140000, v6, OS_LOG_TYPE_DEFAULT, "now playing identifiers API is not implemented", buf, 2u);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __53__MCDPCModel_getNowPlayingIdentifiersWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = MCDGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23F140000, v2, OS_LOG_TYPE_DEFAULT, "Fetched now playing identifiers", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCountOfChildrenAtIndexPath:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = MCDGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_23F140000, v8, OS_LOG_TYPE_DEFAULT, "Fetching count of children at index path: %@", buf, 0xCu);
  }

  uint64_t v9 = (void **)_MCDCreateMediaRemoteIndexPath(v6);
  BOOL v10 = [(MCDPCModel *)self bundleID];
  v13 = v6;
  id v14 = v7;
  id v11 = v7;
  id v12 = v6;
  MRMediaRemoteGetCountOfBrowsableContentChildItems();

  free(*v9);
  free(v9);
}

uint64_t __59__MCDPCModel_getCountOfChildrenAtIndexPath_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = MCDGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2050;
    uint64_t v10 = a2;
    _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Completed fetching count of children at index path: %{public}@, number of children: %{public}llu", (uint8_t *)&v7, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getChildrenAtIndexPath:(id)a3 inRange:(_NSRange)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  __int16 v9 = MCDGeneralLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v7;
    _os_log_impl(&dword_23F140000, v9, OS_LOG_TYPE_DEFAULT, "Fetching children at index path: %{public}@", buf, 0xCu);
  }

  uint64_t v10 = (void **)_MCDCreateMediaRemoteIndexPath(v7);
  uint64_t v11 = [(MCDPCModel *)self bundleID];
  id v14 = v7;
  id v15 = v8;
  id v12 = v8;
  id v13 = v7;
  MRMediaRemoteGetBrowsableContentChildItems();

  free(*v10);
  free(v10);
}

void __56__MCDPCModel_getChildrenAtIndexPath_inRange_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(a1 + 32) itemsFromMRContentItems:a2];
  id v4 = MCDGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Completed fetching children at index path: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void, void *, void, uint64_t, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v3, *(void *)(a1 + 56), [v3 count], 0);
  if (([*(id *)(a1 + 32) didFinishInitialLoad] & 1) == 0)
  {
    [*(id *)(a1 + 32) setDidFinishInitialLoad:1];
    id v6 = MCDGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_23F140000, v6, OS_LOG_TYPE_DEFAULT, "Finishing initial load", (uint8_t *)&v7, 2u);
    }
  }
}

- (void)initiatePlaybackAtIndexPath:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(MCDPCModel *)self setPlaybackCompletion:a4];
  [(MCDPCModel *)self setSelectedIndexPath:v6];
  int v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel__finishPlaybackNotification_ name:*MEMORY[0x263F54968] object:0];

  uint64_t v8 = (void **)_MCDCreateMediaRemoteIndexPath(v6);
  uint64_t v9 = MCDGeneralLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl(&dword_23F140000, v9, OS_LOG_TYPE_DEFAULT, "Asking MediaRemote to initialize playback for index path: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = [(MCDPCModel *)self bundleID];
  MRMediaRemoteRequestPlaybackInitialization();

  free(*v8);
  free(v8);
}

- (void)_finishPlaybackNotification:(id)a3
{
  id v4 = [(MCDPCModel *)self _errorForNotification:a3];
  uint64_t v5 = MCDGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "Received kMRMediaRemoteApplicationInitiatedPlaybackOfContentItemNotification", v8, 2u);
  }

  id v6 = [(MCDPCModel *)self playbackCompletion];

  if (v6)
  {
    int v7 = [(MCDPCModel *)self playbackCompletion];
    ((void (**)(void, void *))v7)[2](v7, v4);

    [(MCDPCModel *)self setPlaybackCompletion:0];
    [(MCDPCModel *)self setSelectedIndexPath:0];
  }
}

- (id)_errorForNotification:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x263F54998]];

  if (v6)
  {
    int v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKey:*MEMORY[0x263F54990]];
    uint64_t v9 = (void *)v8;
    uint64_t v10 = @"MCDError";
    if (v8) {
      uint64_t v10 = (__CFString *)v8;
    }
    int v11 = v10;

    id v12 = [v4 userInfo];
    uint64_t v13 = [v12 objectForKey:*MEMORY[0x263F54988]];

    if (v13) {
      uint64_t v14 = [v13 integerValue];
    }
    else {
      uint64_t v14 = 1;
    }
    v21[0] = *MEMORY[0x263F08320];
    v21[1] = @"model";
    v22[0] = v6;
    v22[1] = self;
    id v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    id v17 = (void *)[v16 mutableCopy];

    uint64_t v18 = [(MCDPCModel *)self selectedIndexPath];

    if (v18)
    {
      BOOL v19 = [(MCDPCModel *)self selectedIndexPath];
      [v17 setObject:v19 forKeyedSubscript:@"indexPath"];
    }
    id v15 = [MEMORY[0x263F087E8] errorWithDomain:v11 code:v14 userInfo:v17];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)_setupBeginLoadingTimeoutTimerWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = (void *)MEMORY[0x263F12358];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__MCDPCModel__setupBeginLoadingTimeoutTimerWithCompletion___block_invoke;
  v8[3] = &unk_26505C328;
  objc_copyWeak(&v10, &location);
  id v6 = v4;
  id v9 = v6;
  int v7 = [v5 timerWithInterval:0 repeats:v8 block:2.0];
  [(MCDPCModel *)self setBeginLoadingTimeoutTimer:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __59__MCDPCModel__setupBeginLoadingTimeoutTimerWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [WeakRetained _invalidateBeginLoadingTimeoutTimer];
}

- (void)_invalidateBeginLoadingTimeoutTimer
{
  uint64_t v3 = [(MCDPCModel *)self beginLoadingTimeoutTimer];

  if (v3)
  {
    id v4 = [(MCDPCModel *)self beginLoadingTimeoutTimer];
    [v4 invalidate];

    [(MCDPCModel *)self setBeginLoadingTimeoutTimer:0];
  }
}

- (void)_setupPlaybackProgressTimeoutTimerWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = (void *)MEMORY[0x263F12358];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__MCDPCModel__setupPlaybackProgressTimeoutTimerWithCompletion___block_invoke;
  v8[3] = &unk_26505C328;
  objc_copyWeak(&v10, &location);
  id v6 = v4;
  id v9 = v6;
  int v7 = [v5 timerWithInterval:0 repeats:v8 block:2.0];
  [(MCDPCModel *)self setPlaybackProgressTimeoutTimer:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __63__MCDPCModel__setupPlaybackProgressTimeoutTimerWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [WeakRetained _invalidatePlaybackProgressTimeoutTimer];
}

- (void)_invalidatePlaybackProgressTimeoutTimer
{
  uint64_t v3 = [(MCDPCModel *)self playbackProgressTimeoutTimer];

  if (v3)
  {
    id v4 = [(MCDPCModel *)self playbackProgressTimeoutTimer];
    [v4 invalidate];

    [(MCDPCModel *)self setPlaybackProgressTimeoutTimer:0];
  }
}

- (id)itemsFromMRContentItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  mediaRemoteItemQueue = self->_mediaRemoteItemQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__MCDPCModel_itemsFromMRContentItems___block_invoke;
  block[3] = &unk_26505C350;
  id v12 = v4;
  uint64_t v13 = self;
  id v14 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_sync(mediaRemoteItemQueue, block);
  id v9 = (void *)[v7 copy];

  return v9;
}

void __38__MCDPCModel_itemsFromMRContentItems___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v28;
    unint64_t v5 = 0x26505B000uLL;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v28 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v8 = MRContentItemGetIdentifier();
        id v9 = (void *)[objc_alloc(*(Class *)(v5 + 2808)) _initWithModel:*(void *)(v1 + 40) MRContentItem:v7];
        id v10 = [*(id *)(v1 + 40) items];
        [v10 setObject:v9 forKeyedSubscript:v8];

        int v11 = MCDGeneralLogging();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v32 = v8;
          _os_log_impl(&dword_23F140000, v11, OS_LOG_TYPE_DEFAULT, "Adding %{public}@ to items dictionary", buf, 0xCu);
        }
        __int16 v26 = (void *)v8;

        id v12 = [v9 artworkData];
        if (v12)
        {
          uint64_t v13 = [MEMORY[0x263F827E8] imageWithData:v12];
          [v13 size];
          if (v15 != 48.0 || v14 != 48.0)
          {
            id v17 = -[NSObject car_scaledImageWithSize:](v13, "car_scaledImageWithSize:", 48.0, 48.0);
            uint64_t v18 = v1;
            uint64_t v19 = v3;
            uint64_t v20 = v4;
            unint64_t v21 = v5;
            uint64_t v22 = [v17 copy];

            uint64_t v13 = v22;
            unint64_t v5 = v21;
            uint64_t v4 = v20;
            uint64_t v3 = v19;
            uint64_t v1 = v18;
          }
          BOOL v23 = MCDGeneralLogging();
          BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          if (v13)
          {
            if (v24)
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v32 = (uint64_t)v26;
              _os_log_impl(&dword_23F140000, v23, OS_LOG_TYPE_DEFAULT, "Updating artwork to %{public}@", buf, 0xCu);
            }

            [v9 setArtworkImage:v13];
          }
          else
          {
            if (v24)
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v32 = (uint64_t)v26;
              _os_log_impl(&dword_23F140000, v23, OS_LOG_TYPE_DEFAULT, "Have artwork data, but artwork is nil for %{public}@", buf, 0xCu);
            }
          }
        }
        else
        {
          uint64_t v13 = MCDGeneralLogging();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v32 = (uint64_t)v26;
            _os_log_impl(&dword_23F140000, v13, OS_LOG_TYPE_DEFAULT, "Artwork is nil for %{public}@", buf, 0xCu);
          }
        }

        [*(id *)(v1 + 48) addObject:v9];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v3);
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (MCDPCItem)rootItem
{
  return self->_rootItem;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (MCDPlayableContentPlaybackManager)playableContentPlaybackManager
{
  return self->_playableContentPlaybackManager;
}

- (void)setPlayableContentPlaybackManager:(id)a3
{
}

- (BOOL)isCurrentPlayingApp
{
  return self->_currentPlayingApp;
}

- (void)setCurrentPlayingApp:(BOOL)a3
{
  self->_currentPlayingApp = a3;
}

- (id)playbackCompletion
{
  return self->_playbackCompletion;
}

- (void)setPlaybackCompletion:(id)a3
{
}

- (id)containerCompletion
{
  return self->_containerCompletion;
}

- (void)setContainerCompletion:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (NSMutableDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (BOOL)didFinishInitialLoad
{
  return self->_didFinishInitialLoad;
}

- (void)setDidFinishInitialLoad:(BOOL)a3
{
  self->_didFinishInitialLoad = a3;
}

- (unsigned)supportedAPIMask
{
  return self->_supportedAPIMask;
}

- (void)setSupportedAPIMask:(unsigned int)a3
{
  self->_supportedAPIMask = a3;
}

- (NSMutableDictionary)beginLoadingBlocks
{
  return self->_beginLoadingBlocks;
}

- (void)setBeginLoadingBlocks:(id)a3
{
}

- (MPWeakTimer)beginLoadingTimeoutTimer
{
  return self->_beginLoadingTimeoutTimer;
}

- (void)setBeginLoadingTimeoutTimer:(id)a3
{
}

- (MPWeakTimer)playbackProgressTimeoutTimer
{
  return self->_playbackProgressTimeoutTimer;
}

- (void)setPlaybackProgressTimeoutTimer:(id)a3
{
}

- (OS_dispatch_queue)mediaRemoteNotificationQueue
{
  return self->_mediaRemoteNotificationQueue;
}

- (void)setMediaRemoteNotificationQueue:(id)a3
{
}

- (OS_dispatch_queue)mediaRemoteItemQueue
{
  return self->_mediaRemoteItemQueue;
}

- (void)setMediaRemoteItemQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteItemQueue, 0);
  objc_storeStrong((id *)&self->_mediaRemoteNotificationQueue, 0);
  objc_storeStrong((id *)&self->_playbackProgressTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_beginLoadingTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_beginLoadingBlocks, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong(&self->_containerCompletion, 0);
  objc_storeStrong(&self->_playbackCompletion, 0);
  objc_storeStrong((id *)&self->_playableContentPlaybackManager, 0);
  objc_storeStrong((id *)&self->_rootItem, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)_finishBeginLoadingNotification:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23F140000, a2, OS_LOG_TYPE_DEBUG, "Received kMRMediaRemoteApplicationFinishedLoadingContentNotification, beginLoadingPlayableContent API not implemented and null completion block for index path: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_finishBeginLoadingNotification:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23F140000, a2, OS_LOG_TYPE_DEBUG, "Received kMRMediaRemoteApplicationFinishedLoadingContentNotification, but completion block is null for index path: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_finishBeginLoadingNotification:(os_log_t)log .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_23F140000, log, OS_LOG_TYPE_DEBUG, "Received kMRMediaRemoteApplicationFinishedLoadingContentNotification with error: %{public}@, but completion block is null for index path: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end