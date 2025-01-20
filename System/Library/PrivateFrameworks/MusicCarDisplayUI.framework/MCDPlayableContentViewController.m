@interface MCDPlayableContentViewController
- (MCDPlayableContentViewController)initWithBundleID:(id)a3;
- (MCDPlayableContentViewController)initWithBundleID:(id)a3 stack:(id)a4;
- (NSOperationQueue)modelInvalidationQueue;
- (NSString)bundleID;
- (id)_createRootViewController;
- (id)_createSectionedRootViewController;
- (id)currentStack;
- (void)_modelDidInvalidate:(id)a3;
- (void)_nowPlayingIdentifiersChanged:(id)a3;
- (void)_populateStack;
- (void)_setupView;
- (void)refreshNavigationStackForLaunch;
- (void)setModelInvalidationQueue:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MCDPlayableContentViewController

- (MCDPlayableContentViewController)initWithBundleID:(id)a3 stack:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MCDPlayableContentViewController;
  v8 = [(MCDPlayableContentViewController *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v9;

    v11 = MCDGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_23F140000, v11, OS_LOG_TYPE_DEFAULT, "Initializing a new view for bundle: %@", buf, 0xCu);
    }

    v12 = [[MCDPCModel alloc] initWithBundleID:v8->_bundleID];
    model = v8->_model;
    v8->_model = v12;

    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    modelInvalidationQueue = v8->_modelInvalidationQueue;
    v8->_modelInvalidationQueue = v14;

    [(NSOperationQueue *)v8->_modelInvalidationQueue setQualityOfService:25];
    [(NSOperationQueue *)v8->_modelInvalidationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v8->_modelInvalidationQueue setName:@"com.apple.MusicCarDisplayUI.playableContent.invalidate"];
    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v8 selector:sel__modelDidInvalidate_ name:@"didInvalidate" object:0];
    [v16 addObserver:v8 selector:sel__nowPlayingIdentifiersChanged_ name:*MEMORY[0x263F549A0] object:0];
    objc_storeStrong((id *)&v8->_stackToRebuild, a4);
  }
  return v8;
}

- (MCDPlayableContentViewController)initWithBundleID:(id)a3
{
  return [(MCDPlayableContentViewController *)self initWithBundleID:a3 stack:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCDPlayableContentViewController;
  [(MCDPlayableContentViewController *)&v5 viewWillAppear:a3];
  if (self->_bundleID) {
    BOOL v4 = MRMediaRemoteApplicationSupportsSectionedBrowsing() != 0;
  }
  else {
    BOOL v4 = 0;
  }
  self->_hasSectionedContent = v4;
  [(MCDPlayableContentViewController *)self _setupView];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MCDPlayableContentViewController;
  [(MCDPlayableContentViewController *)&v9 viewWillDisappear:a3];
  BOOL v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  bundleID = self->_bundleID;
  self->_bundleID = 0;

  model = self->_model;
  self->_model = 0;

  stackToRebuild = self->_stackToRebuild;
  self->_stackToRebuild = 0;

  rootContainer = self->_rootContainer;
  self->_rootContainer = 0;
}

- (void)_nowPlayingIdentifiersChanged:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__MCDPlayableContentViewController__nowPlayingIdentifiersChanged___block_invoke;
  block[3] = &unk_26505BE68;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __66__MCDPlayableContentViewController__nowPlayingIdentifiersChanged___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) userInfo];
  v2 = [v1 valueForKey:*MEMORY[0x263F54E40]];

  id v3 = MCDGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_23F140000, v3, OS_LOG_TYPE_DEFAULT, "Received kMRMediaRemoteBrowsableContentNowPlayingIdentifiersUpdatedNotification", v5, 2u);
  }

  id v4 = +[MCDBrowsableContentUtilities sharedInstance];
  [v4 setNowPlayingIdentifiers:v2];
}

- (id)_createSectionedRootViewController
{
  if (!self->_rootContainer)
  {
    id v3 = [(MCDPCModel *)self->_model containerForRoot];
    rootContainer = self->_rootContainer;
    self->_rootContainer = v3;
  }
  [(MCDPlayableContentViewController *)self setNavigationBarHidden:1];
  objc_super v5 = [[MCDBrowsableContentNavigationController alloc] initWithBundleID:self->_bundleID model:self->_model];
  return v5;
}

- (id)_createRootViewController
{
  if (!self->_rootContainer)
  {
    id v3 = [(MCDPCModel *)self->_model containerForRoot];
    rootContainer = self->_rootContainer;
    self->_rootContainer = v3;
  }
  objc_super v5 = [[MCDBrowsableContentTableViewController alloc] initWithContainer:self->_rootContainer tabbedBrowsing:0];
  return v5;
}

- (void)_setupView
{
  v21[1] = *MEMORY[0x263EF8340];
  if (!self->_hasLoaded)
  {
    if (self->_bundleID) {
      BOOL v3 = MRMediaRemoteApplicationSupportsBrowsableContent() != 0;
    }
    else {
      BOOL v3 = 0;
    }
    self->_hasBrowsableContent = v3;
    id v4 = +[MCDBrowsableContentUtilities sharedInstance];
    [v4 setNowPlayingIdentifiers:0];

    if (!self->_hasBrowsableContent)
    {
      id v7 = MCDGeneralLogging();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23F140000, v7, OS_LOG_TYPE_DEFAULT, "App does not use browsable content API, pushing to now playing", buf, 2u);
      }

      v8 = [MCDNowPlayingViewController alloc];
      objc_super v9 = [(MCDPCModel *)self->_model bundleID];
      v10 = [(MCDPCModel *)self->_model appTitle];
      id v6 = [(MCDNowPlayingViewController *)v8 initWithPlayableBundleID:v9 appName:v10];

      id v20 = v6;
      v11 = (void *)MEMORY[0x263EFF8C0];
      v12 = &v20;
      goto LABEL_13;
    }
    if (self->_stackToRebuild)
    {
      objc_super v5 = MCDGeneralLogging();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "Rebuilding stack for app launch", buf, 2u);
      }

      id v6 = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __46__MCDPlayableContentViewController__setupView__block_invoke;
      block[3] = &unk_26505BE68;
      void block[4] = self;
      dispatch_async(v6, block);
      goto LABEL_14;
    }
    if (!self->_hasLoaded)
    {
      BOOL hasSectionedContent = self->_hasSectionedContent;
      v15 = MCDGeneralLogging();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (hasSectionedContent)
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23F140000, v15, OS_LOG_TYPE_DEFAULT, "Creating view controller for sectioned browsing", buf, 2u);
        }

        uint64_t v17 = [(MCDPlayableContentViewController *)self _createSectionedRootViewController];
      }
      else
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23F140000, v15, OS_LOG_TYPE_DEFAULT, "Creating view controller for table view browsing", buf, 2u);
        }

        uint64_t v17 = [(MCDPlayableContentViewController *)self _createRootViewController];
      }
      id v6 = v17;
      v21[0] = v17;
      v11 = (void *)MEMORY[0x263EFF8C0];
      v12 = (NSObject **)v21;
LABEL_13:
      v13 = [v11 arrayWithObjects:v12 count:1];
      [(MCDPlayableContentViewController *)self setViewControllers:v13 animated:0];

      self->_hasLoaded = 1;
LABEL_14:
    }
  }
}

unsigned char *__46__MCDPlayableContentViewController__setupView__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[1442])
  {
    [result _populateStack];
    result = *(unsigned char **)(a1 + 32);
  }
  result[1442] = 1;
  return result;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 count])
  {
    v7.receiver = self;
    v7.super_class = (Class)MCDPlayableContentViewController;
    [(MCDPlayableContentViewController *)&v7 setViewControllers:v6 animated:v4];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__MCDPlayableContentViewController_setViewControllers_animated___block_invoke;
    block[3] = &unk_26505BE68;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __64__MCDPlayableContentViewController_setViewControllers_animated___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1442) = 0;
  return [*(id *)(a1 + 32) _setupView];
}

- (void)refreshNavigationStackForLaunch
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  BOOL v3 = [(MCDPCModel *)self->_model playableContentPlaybackManager];
  BOOL v4 = [v3 currentPlayingSong];
  if (v4) {
    BOOL v5 = [(MCDPCModel *)self->_model isCurrentPlayingApp];
  }
  else {
    BOOL v5 = 0;
  }

  [(MCDPCModel *)self->_model bundleID];
  int v6 = MRMediaRemoteApplicationSupportsImmediatePlayback();
  objc_super v7 = [(MCDPlayableContentViewController *)self visibleViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && v5)
  {
    objc_super v9 = MCDGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F140000, v9, OS_LOG_TYPE_DEFAULT, "Now Playing view already frontmost when Now Playing app tapped", buf, 2u);
    }
LABEL_32:

    return;
  }
  int v24 = v6;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v10 = [(MCDPlayableContentViewController *)self viewControllers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
LABEL_10:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v26 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v25 + 1) + 8 * v14);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v12) {
          goto LABEL_10;
        }
        goto LABEL_16;
      }
    }
    objc_super v9 = v15;

    if (!v9) {
      goto LABEL_21;
    }
    BOOL v16 = MCDGeneralLogging();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F140000, v16, OS_LOG_TYPE_DEFAULT, "popping from view controller to Now Playing view", buf, 2u);
    }

    id v17 = (id)[(MCDPlayableContentViewController *)self popToViewController:v9 animated:0];
    goto LABEL_32;
  }
LABEL_16:

LABEL_21:
  if (v24) {
    int v18 = 1;
  }
  else {
    int v18 = v5;
  }
  if (v18 == 1)
  {
    if (v24)
    {
      v19 = MCDGeneralLogging();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23F140000, v19, OS_LOG_TYPE_DEFAULT, "Sending play command since the app supports immediate playback", buf, 2u);
      }

      MRMediaRemoteSendCommandToApp();
    }
    id v20 = MCDGeneralLogging();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F140000, v20, OS_LOG_TYPE_DEFAULT, "Show Now Playing view on app foreground", buf, 2u);
    }

    uint64_t v21 = [MCDNowPlayingViewController alloc];
    v22 = [(MCDPCModel *)self->_model bundleID];
    v23 = [(MCDPCModel *)self->_model appTitle];
    objc_super v9 = [(MCDNowPlayingViewController *)v21 initWithPlayableBundleID:v22 appName:v23];

    [v9 setShowNavigationBar:self->_hasSectionedContent];
    [(MCDPlayableContentViewController *)self pushViewController:v9 animated:0];
    goto LABEL_32;
  }
}

- (void)_modelDidInvalidate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v4 = [(MCDPlayableContentViewController *)self modelInvalidationQueue];
  unint64_t v5 = [v4 operationCount];

  if (v5 < 4)
  {
    int v6 = [(MCDPlayableContentViewController *)self modelInvalidationQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke;
    v8[3] = &unk_26505BE68;
    v8[4] = self;
    [v6 addOperationWithBlock:v8];
  }
  else
  {
    int v6 = MCDGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v7 = [(MCDPlayableContentViewController *)self bundleID];
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_23F140000, v6, OS_LOG_TYPE_DEFAULT, "Cancelling extra model invalidation for %{public}@.", buf, 0xCu);
    }
  }
}

void __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  v2 = MCDGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = [*(id *)(a1 + 32) bundleID];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_23F140000, v2, OS_LOG_TYPE_DEFAULT, "Playable content invalidated, refreshing all index paths for %{public}@", (uint8_t *)&buf, 0xCu);
  }
  BOOL v4 = [MEMORY[0x263EFF980] array];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy_;
  v62 = __Block_byref_object_dispose_;
  id v63 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy_;
  v51 = __Block_byref_object_dispose_;
  id v52 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke_41;
  block[3] = &unk_26505C090;
  void block[4] = *(void *)(a1 + 32);
  void block[5] = &v47;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy_;
  v44 = __Block_byref_object_dispose_;
  id v45 = [(id)v48[5] firstObject];
  while (v41[5])
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (id)v41[5];
      objc_super v7 = MCDGeneralLogging();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v57 = 0;
        _os_log_impl(&dword_23F140000, v7, OS_LOG_TYPE_DEFAULT, "Adding MCDBrowsableContentTableViewController after model invalidate", v57, 2u);
      }

      [v4 addObject:v6];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke_42;
      v33[3] = &unk_26505C0B8;
      p_long long buf = &buf;
      id v8 = v6;
      id v34 = v8;
      v37 = &v53;
      v38 = &v47;
      v39 = &v40;
      objc_super v9 = v5;
      v35 = v9;
      [v8 reloadWithCompletion:v33];
      dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = (id)v41[5];
        uint64_t v11 = MCDGeneralLogging();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = a1;
          uint64_t v13 = [*(id *)(a1 + 32) bundleID];
          *(_DWORD *)v57 = 138543362;
          v58 = v13;
          _os_log_impl(&dword_23F140000, v11, OS_LOG_TYPE_DEFAULT, "Adding MCDBrowsableNavigationController to view controllers after model invalidate for %{public}@", v57, 0xCu);

          a1 = v12;
        }

        [v4 addObject:v10];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke_43;
        v26[3] = &unk_26505C0B8;
        v29 = &buf;
        id v8 = v10;
        id v27 = v8;
        v30 = &v53;
        uint64_t v31 = &v47;
        v32 = &v40;
        uint64_t v14 = v5;
        long long v28 = v14;
        [v8 invalidateAndReloadTabsWithCompletion:v26];
        dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = MCDGeneralLogging();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v16 = [*(id *)(a1 + 32) bundleID];
            *(_DWORD *)v57 = 138543362;
            v58 = v16;
            _os_log_impl(&dword_23F140000, v15, OS_LOG_TYPE_DEFAULT, "Adding now playing view controller for model invalidate for %{public}@", v57, 0xCu);
          }
          [v4 addObject:v41[5]];
          uint64_t v17 = v54[3];
          if (v17 + 1 >= (unint64_t)[(id)v48[5] count])
          {
            id v20 = (void *)v41[5];
            v41[5] = 0;
          }
          else
          {
            int v18 = (void *)v48[5];
            ++v54[3];
            uint64_t v19 = objc_msgSend(v18, "objectAtIndexedSubscript:");
            id v20 = (void *)v41[5];
            v41[5] = v19;
          }

          uint64_t v21 = (uint64_t *)*((void *)&buf + 1);
        }
        else
        {
          uint64_t v21 = v41;
        }
        id v8 = (id)v21[5];
        v21[5] = 0;
      }
    }
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke_44;
  v24[3] = &unk_26505BE18;
  v24[4] = *(void *)(a1 + 32);
  id v25 = v4;
  id v22 = v4;
  v23 = (void *)MEMORY[0x263EF83A0];
  dispatch_sync(MEMORY[0x263EF83A0], v24);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&buf, 8);
}

void __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke_41(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) viewControllers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  dispatch_semaphore_t v5 = MCDGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) bundleID];
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v8 = 138543618;
    objc_super v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "Fetched current view controllers to reload after playable content invalidated for %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

intptr_t __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke_42(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) container];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + 1;
  if (v5 < [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + 1];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 container];
      int v8 = [v7 isValidForRefreshedParent:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      objc_super v9 = MCDGeneralLogging();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          LOWORD(v22) = 0;
          _os_log_impl(&dword_23F140000, v9, OS_LOG_TYPE_DEFAULT, "Container is valid for table view", (uint8_t *)&v22, 2u);
        }

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v6);
        ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        goto LABEL_17;
      }
      if (!v10) {
        goto LABEL_15;
      }
      LOWORD(v22) = 0;
      uint64_t v17 = "Container isn't valid for refreshed parent for table views";
      int v18 = v9;
      uint32_t v19 = 2;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        uint64_t v14 = objc_msgSend(v13, "objectAtIndexedSubscript:");
        uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
        BOOL v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;
LABEL_16:

LABEL_17:
        return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
      }
      objc_super v9 = MCDGeneralLogging();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

        uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
        BOOL v16 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = 0;
        goto LABEL_16;
      }
      int v22 = 138543362;
      v23 = v6;
      uint64_t v17 = "Next view controller is neither a table view nor now playing view when current VC is a table view, which sho"
            "uldn't be here: %{public}@";
      int v18 = v9;
      uint32_t v19 = 12;
    }
    _os_log_impl(&dword_23F140000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v22, v19);
    goto LABEL_15;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke_43(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) container];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + 1;
  if (v5 < [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + 1];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [*(id *)(a1 + 32) selectedViewController];
      uint64_t v8 = [v7 container];
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      BOOL v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      uint64_t v11 = [v6 container];
      int v12 = [v11 isValidForRefreshedParent:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      uint64_t v13 = MCDGeneralLogging();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_23F140000, v13, OS_LOG_TYPE_DEFAULT, "Container is valid for tab bar", (uint8_t *)&v26, 2u);
        }

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v6);
        ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        goto LABEL_17;
      }
      if (!v14) {
        goto LABEL_15;
      }
      LOWORD(v26) = 0;
      uint64_t v21 = "Container isn't valid for tab bar";
      int v22 = v13;
      uint32_t v23 = 2;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        uint64_t v18 = objc_msgSend(v17, "objectAtIndexedSubscript:");
        uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
        uint64_t v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;
LABEL_16:

LABEL_17:
        return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
      }
      uint64_t v13 = MCDGeneralLogging();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

        uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8);
        uint64_t v20 = *(void **)(v24 + 40);
        *(void *)(v24 + 40) = 0;
        goto LABEL_16;
      }
      int v26 = 138543362;
      id v27 = v6;
      uint64_t v21 = "Next view controller is neither a table view nor a now playing view when current VC is a tab bar, which shou"
            "ldn't be here: %{public}@";
      int v22 = v13;
      uint32_t v23 = 12;
    }
    _os_log_impl(&dword_23F140000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v26, v23);
    goto LABEL_15;
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
  BOOL v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke_44(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = MCDGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) bundleID];
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_23F140000, v2, OS_LOG_TYPE_DEFAULT, "Setting view controllers after model invalidate for %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) setViewControllers:*(void *)(a1 + 40) animated:0];
}

- (void)_populateStack
{
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  uint64_t v42 = __Block_byref_object_dispose_;
  id v43 = 0;
  uint64_t v32 = 0;
  v33 = (id *)&v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  id v37 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  uint64_t v3 = [(NSArray *)self->_stackToRebuild objectEnumerator];
  BOOL v4 = [v3 nextObject];
  int v5 = [MEMORY[0x263EFF980] array];
  if (v4)
  {
    do
    {
      id v6 = [v4 indexPath];
      uint64_t v7 = [v6 length];

      if (!v7)
      {
        rootContainer = self->_rootContainer;
        if (!rootContainer)
        {
          uint64_t v9 = [(MCDPCModel *)self->_model containerForRoot];
          BOOL v10 = self->_rootContainer;
          self->_rootContainer = v9;

          rootContainer = self->_rootContainer;
        }
        objc_storeStrong(v33 + 5, rootContainer);
      }
      if (v33[5]) {
        objc_msgSend(v5, "addObject:");
      }
      uint64_t v11 = [v3 nextObject];
      int v12 = (void *)v39[5];
      v39[5] = v11;

      dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
      id v14 = v33[5];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      void v21[2] = __50__MCDPlayableContentViewController__populateStack__block_invoke;
      v21[3] = &unk_26505C0E0;
      uint32_t v23 = &v38;
      uint64_t v24 = &v26;
      id v25 = &v32;
      uint64_t v15 = v13;
      int v22 = v15;
      [v14 refreshWithCompletion:v21];
      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      id v16 = (id)v39[5];

      objc_storeStrong(v33 + 5, (id)v27[5]);
      BOOL v4 = v16;
    }
    while (v16);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__MCDPlayableContentViewController__populateStack__block_invoke_2;
  block[3] = &unk_26505BE18;
  id v19 = v5;
  uint64_t v20 = self;
  id v17 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
}

intptr_t __50__MCDPlayableContentViewController__populateStack__block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1[5] + 8) + 40);
  if (v2)
  {
    uint64_t v3 = [v2 indexPath];
    uint64_t v4 = objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "containerAtIndex:", objc_msgSend(v3, "indexAtPosition:", objc_msgSend(v3, "length") - 1));
    uint64_t v5 = *(void *)(a1[6] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (([*(id *)(*(void *)(a1[6] + 8) + 40) isValidForRefreshedParent:*(void *)(*(void *)(a1[7] + 8) + 40)] & 1) == 0)
    {
      uint64_t v7 = *(void *)(a1[5] + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = 0;
    }
  }
  uint64_t v9 = a1[4];
  return dispatch_semaphore_signal(v9);
}

void __50__MCDPlayableContentViewController__populateStack__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        uint64_t v9 = [MCDBrowsableContentTableViewController alloc];
        BOOL v10 = -[MCDBrowsableContentTableViewController initWithContainer:](v9, "initWithContainer:", v8, (void)v11);
        [(MCDBrowsableContentTableViewController *)v10 reloadWithCompletion:0];
        [v2 addObject:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 40) setViewControllers:v2 animated:0];
}

- (id)currentStack
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = MCDGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(MCDPlayableContentViewController *)self viewControllers];
    *(_DWORD *)long long buf = 138412290;
    int v22 = v4;
    _os_log_impl(&dword_23F140000, v3, OS_LOG_TYPE_DEFAULT, "current stack: %@", buf, 0xCu);
  }
  if (self->_hasSectionedContent)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [(MCDPlayableContentViewController *)self viewControllers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            long long v13 = [v12 container];
            long long v14 = +[_MCDStackItem stackItemWithContainer:v13];

            [v6 addObject:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    if ([v6 count] == 1) {
      id v5 = 0;
    }
    else {
      id v5 = v6;
    }
  }
  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSOperationQueue)modelInvalidationQueue
{
  return self->_modelInvalidationQueue;
}

- (void)setModelInvalidationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelInvalidationQueue, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_stackToRebuild, 0);
  objc_storeStrong((id *)&self->_rootContainer, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end