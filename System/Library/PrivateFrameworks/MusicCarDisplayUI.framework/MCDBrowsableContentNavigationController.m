@interface MCDBrowsableContentNavigationController
- (BOOL)didFinishInitialLoad;
- (BOOL)didFinishInitialViewAppear;
- (BOOL)hasCarScreen;
- (BOOL)hasInvalidatedDummyTabs;
- (BOOL)visible;
- (CPUINowPlayingButtonWrapperView)nowPlayingButtonView;
- (MCDBrowsableContentNavigationController)initWithBundleID:(id)a3 model:(id)a4;
- (MCDPCContainer)container;
- (MCDPCModel)model;
- (NSString)bundleID;
- (OS_dispatch_queue)serialQueue;
- (UITabBarController)tabBarController;
- (id)_hostTabAtIndex:(unint64_t)a3 dummyTab:(BOOL)a4;
- (id)_tabBarItemForViewController:(id)a3 fromItem:(id)a4;
- (void)_appRegisteredForContent:(id)a3;
- (void)_loadAllHostTabs;
- (void)_nowPlayingButtonTapped:(id)a3;
- (void)_nowPlayingDidChange:(id)a3;
- (void)_updateNowPlayingButtonVisibility;
- (void)container:(id)a3 didInvalidateIndicies:(id)a4;
- (void)invalidateAndReloadTabsWithCompletion:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDidFinishInitialLoad:(BOOL)a3;
- (void)setDidFinishInitialViewAppear:(BOOL)a3;
- (void)setHasCarScreen:(BOOL)a3;
- (void)setHasInvalidatedDummyTabs:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setNowPlayingButtonView:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setTabBarController:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTitleAndTabBarItemsAtIndexes:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MCDBrowsableContentNavigationController

- (MCDBrowsableContentNavigationController)initWithBundleID:(id)a3 model:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MCDBrowsableContentNavigationController;
  v8 = [(MCDBrowsableContentNavigationController *)&v17 initWithNibName:0 bundle:0];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v9;

    objc_storeStrong((id *)&v8->_model, a4);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.MusicCarDisplayUI.playableContent.navigationController", 0);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [(MCDPCModel *)v8->_model containerForRoot];
    container = v8->_container;
    v8->_container = (MCDPCContainer *)v13;

    [(MCDPCContainer *)v8->_container setDelegate:v8];
    [(MCDBrowsableContentNavigationController *)v8 setDelegate:v8];
    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v8 selector:sel__appRegisteredForContent_ name:@"appReadyToFetch" object:0];
    [v15 addObserver:v8 selector:sel__nowPlayingDidChange_ name:@"nowPlayingChange" object:0];
    [v15 addObserver:v8 selector:sel__nowPlayingDidChange_ name:@"MCDContentItemsChangedNotification" object:0];
  }
  return v8;
}

- (void)_appRegisteredForContent:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = +[MCDMediaRemoteSerialQueueManager sharedInstance];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __68__MCDBrowsableContentNavigationController__appRegisteredForContent___block_invoke;
  v10 = &unk_26505BDF0;
  objc_copyWeak(&v11, &location);
  [v5 addOperation:&v7 cancelAllOperations:1];

  id v6 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v7, v8, v9, v10);
  [v6 removeObserver:self name:@"appReadyToFetch" object:0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __68__MCDBrowsableContentNavigationController__appRegisteredForContent___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__MCDBrowsableContentNavigationController__appRegisteredForContent___block_invoke_2;
  block[3] = &unk_26505BDF0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_sync(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __68__MCDBrowsableContentNavigationController__appRegisteredForContent___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = MCDGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F140000, v2, OS_LOG_TYPE_DEFAULT, "Loading content in tab controller for the first time since app registered", buf, 2u);
  }

  v3 = [WeakRetained container];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__MCDBrowsableContentNavigationController__appRegisteredForContent___block_invoke_25;
  v5[3] = &unk_26505BE68;
  id v6 = WeakRetained;
  id v4 = WeakRetained;
  [v3 refreshWithCompletion:v5];
}

void __68__MCDBrowsableContentNavigationController__appRegisteredForContent___block_invoke_25(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__MCDBrowsableContentNavigationController__appRegisteredForContent___block_invoke_2_26;
  block[3] = &unk_26505BE68;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __68__MCDBrowsableContentNavigationController__appRegisteredForContent___block_invoke_2_26(uint64_t a1)
{
  [*(id *)(a1 + 32) setDidFinishInitialLoad:1];
  uint64_t result = [*(id *)(a1 + 32) visible];
  if (result)
  {
    v3 = MCDGeneralLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_23F140000, v3, OS_LOG_TYPE_DEFAULT, "finished loading content after the view appeared, setting tabs", v4, 2u);
    }

    [*(id *)(a1 + 32) _updateNowPlayingButtonVisibility];
    [*(id *)(a1 + 32) _loadAllHostTabs];
    return [*(id *)(a1 + 32) setDidFinishInitialViewAppear:1];
  }
  return result;
}

- (void)_nowPlayingDidChange:(id)a3
{
  id v4 = MCDGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Received MCDPCNowPlayingDidChangeNotificationName", v5, 2u);
  }

  [(MCDBrowsableContentNavigationController *)self _updateNowPlayingButtonVisibility];
}

- (void)_updateNowPlayingButtonVisibility
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__MCDBrowsableContentNavigationController__updateNowPlayingButtonVisibility__block_invoke;
  block[3] = &unk_26505BE68;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __76__MCDBrowsableContentNavigationController__updateNowPlayingButtonVisibility__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1240) playableContentPlaybackManager];
  v3 = [v2 currentPlayingSong];
  if (v3 && [*(id *)(*(void *)(a1 + 32) + 1240) isCurrentPlayingApp])
  {
    int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1216);

    if (v4)
    {
      v5 = MCDGeneralLogging();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "Showing Now Playing button in tab bar", buf, 2u);
      }

      id v6 = [*(id *)(a1 + 32) _accessoryView];

      uint64_t v7 = MCDGeneralLogging();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          __int16 v26 = 0;
          uint64_t v9 = "Accessory view already set.";
          v10 = (uint8_t *)&v26;
LABEL_17:
          _os_log_impl(&dword_23F140000, v7, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
          goto LABEL_18;
        }
        goto LABEL_18;
      }
      if (v8)
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_23F140000, v7, OS_LOG_TYPE_DEFAULT, "Showing Now Playing button in tab bar", v25, 2u);
      }

      uint64_t v13 = *(void **)(a1 + 32);
      uint64_t v14 = v13[157];
      if (!v14)
      {
        id v15 = objc_alloc(MEMORY[0x263F31398]);
        v16 = [*(id *)(a1 + 32) tabBar];
        [v16 bounds];
        double Height = CGRectGetHeight(v28);
        v18 = [*(id *)(*(void *)(a1 + 32) + 1240) bundleID];
        uint64_t v19 = objc_msgSend(v15, "initWithFrame:bundleIdentifier:", v18, 0.0, 0.0, 0.0, Height);
        uint64_t v20 = *(void *)(a1 + 32);
        v21 = *(void **)(v20 + 1256);
        *(void *)(v20 + 1256) = v19;

        v22 = [*(id *)(*(void *)(a1 + 32) + 1256) nowPlayingButton];
        [v22 addTarget:*(void *)(a1 + 32) action:sel__nowPlayingButtonTapped_ forControlEvents:64];

        uint64_t v13 = *(void **)(a1 + 32);
        uint64_t v14 = v13[157];
      }
LABEL_14:
      [v13 _setAccessoryView:v14];
      return;
    }
  }
  else
  {
  }
  id v11 = [*(id *)(a1 + 32) _accessoryView];

  uint64_t v7 = MCDGeneralLogging();
  BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v12)
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_23F140000, v7, OS_LOG_TYPE_DEFAULT, "Hiding Now Playing button in tab bar", v24, 2u);
    }

    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = 0;
    goto LABEL_14;
  }
  if (v12)
  {
    __int16 v23 = 0;
    uint64_t v9 = "No Now Playing button hide needed.";
    v10 = (uint8_t *)&v23;
    goto LABEL_17;
  }
LABEL_18:
}

- (void)_nowPlayingButtonTapped:(id)a3
{
  int v4 = [MCDNowPlayingViewController alloc];
  v5 = [(MCDPCModel *)self->_model bundleID];
  id v6 = [(MCDPCModel *)self->_model appTitle];
  uint64_t v7 = [(MCDNowPlayingViewController *)v4 initWithPlayableBundleID:v5 appName:v6];

  BOOL v8 = MCDGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_23F140000, v8, OS_LOG_TYPE_DEFAULT, "Now playing button tapped in tab bar, pushing to Now Playing screen", v11, 2u);
  }

  uint64_t v9 = [(MCDBrowsableContentNavigationController *)self navigationController];
  [v9 setNavigationBarHidden:0];

  v10 = [(MCDBrowsableContentNavigationController *)self navigationController];
  [v10 pushViewController:v7 animated:1];
}

- (void)container:(id)a3 didInvalidateIndicies:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = MCDGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 identifier];
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl(&dword_23F140000, v8, OS_LOG_TYPE_DEFAULT, "Some content has invalidated, preparing to reload tab views for container: %{public}@, indicies: %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v10 = +[MCDMediaRemoteSerialQueueManager sharedInstance];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__MCDBrowsableContentNavigationController_container_didInvalidateIndicies___block_invoke;
  v13[3] = &unk_26505C5A0;
  objc_copyWeak(&v16, (id *)buf);
  id v11 = v6;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [v10 addOperation:v13 cancelAllOperations:0];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __75__MCDBrowsableContentNavigationController_container_didInvalidateIndicies___block_invoke(id *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__MCDBrowsableContentNavigationController_container_didInvalidateIndicies___block_invoke_2;
  block[3] = &unk_26505C5A0;
  objc_copyWeak(&v5, a1 + 6);
  id v3 = a1[4];
  id v4 = a1[5];
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v5);
}

void __75__MCDBrowsableContentNavigationController_container_didInvalidateIndicies___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained visible])
  {
    id v3 = [WeakRetained viewControllers];

    if (v3)
    {
      id v4 = MCDGeneralLogging();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [*(id *)(a1 + 32) identifier];
        uint64_t v6 = *(void *)(a1 + 40);
        int v13 = 138543618;
        id v14 = v5;
        __int16 v15 = 2114;
        uint64_t v16 = v6;
        _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Reloading specific tabs since they are invalid for container: %{public}@, indicies: %{public}@", (uint8_t *)&v13, 0x16u);
      }
      [WeakRetained updateTitleAndTabBarItemsAtIndexes:*(void *)(a1 + 40)];
    }
    else if ([WeakRetained didFinishInitialLoad])
    {
      v10 = MCDGeneralLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [*(id *)(a1 + 32) identifier];
        uint64_t v12 = *(void *)(a1 + 40);
        int v13 = 138543618;
        id v14 = v11;
        __int16 v15 = 2114;
        uint64_t v16 = v12;
        _os_log_impl(&dword_23F140000, v10, OS_LOG_TYPE_DEFAULT, "Reloading all host tabs since table views are nil for container: %{public}@, indicies: %{public}@", (uint8_t *)&v13, 0x16u);
      }
      [WeakRetained _loadAllHostTabs];
    }
  }
  else
  {
    id v7 = MCDGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [*(id *)(a1 + 32) identifier];
      uint64_t v9 = *(void *)(a1 + 40);
      int v13 = 138543618;
      id v14 = v8;
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      _os_log_impl(&dword_23F140000, v7, OS_LOG_TYPE_DEFAULT, "Tab view not visible for container indicies reload: %{public}@, indicies: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)_loadAllHostTabs
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = [(MCDBrowsableContentNavigationController *)self container];
  uint64_t v4 = [v3 cachedCount];

  id v5 = MCDGeneralLogging();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      id v7 = [(MCDBrowsableContentNavigationController *)self bundleID];
      *(_DWORD *)buf = 138543618;
      v30 = v7;
      __int16 v31 = 2050;
      uint64_t v32 = v4;
      _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "Number of tabs returned from client %{public}@: %{public}ld", buf, 0x16u);
    }
    uint64_t v8 = v4;
  }
  else
  {
    if (v6)
    {
      uint64_t v9 = [(MCDBrowsableContentNavigationController *)self bundleID];
      *(_DWORD *)buf = 138543362;
      v30 = v9;
      _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "No tabs available from host, loading default tabs for %{public}@", buf, 0xCu);
    }
    if (![(MCDBrowsableContentNavigationController *)self hasInvalidatedDummyTabs])
    {
      v10 = MCDGeneralLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(MCDBrowsableContentNavigationController *)self bundleID];
        *(_DWORD *)buf = 138543362;
        v30 = v11;
        _os_log_impl(&dword_23F140000, v10, OS_LOG_TYPE_DEFAULT, "Scheduling dummy tab reload for %{public}@", buf, 0xCu);
      }
      [(MCDBrowsableContentNavigationController *)self setHasInvalidatedDummyTabs:1];
      dispatch_time_t v12 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __59__MCDBrowsableContentNavigationController__loadAllHostTabs__block_invoke;
      block[3] = &unk_26505BE68;
      void block[4] = self;
      dispatch_after(v12, MEMORY[0x263EF83A0], block);
    }
    uint64_t v8 = 3;
  }
  int v13 = [MEMORY[0x263EFF980] array];
  if ([(MCDBrowsableContentNavigationController *)self selectedIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = [(MCDBrowsableContentNavigationController *)self selectedIndex];
  }
  uint64_t v16 = 0;
  *(void *)&long long v14 = 138543618;
  long long v27 = v14;
  do
  {
    uint64_t v17 = [(MCDBrowsableContentNavigationController *)self _hostTabAtIndex:v16 dummyTab:v4 == 0];
    if (v17)
    {
      if (v4)
      {
        v18 = MCDGeneralLogging();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        if (v15 == v16)
        {
          if (v19)
          {
            id v20 = [v17 container];
            uint64_t v21 = [v20 identifier];
            *(_DWORD *)buf = v27;
            v30 = v21;
            __int16 v31 = 2050;
            uint64_t v32 = v15;
            _os_log_impl(&dword_23F140000, v18, OS_LOG_TYPE_DEFAULT, "Refreshing view controller %{public}@ because it is the selected index: %{public}ld", buf, 0x16u);
          }
          [v17 reloadWithCompletion:0];
        }
        else
        {
          if (v19)
          {
            v24 = [v17 container];
            v25 = [v24 identifier];
            *(_DWORD *)buf = 138543362;
            v30 = v25;
            _os_log_impl(&dword_23F140000, v18, OS_LOG_TYPE_DEFAULT, "View controller %{public}@ is not selected but is reloaded, begin loading item", buf, 0xCu);
          }
          __int16 v26 = [v17 container];
          [v26 beginLoadingItemWithCompletion:0];
        }
      }
      else
      {
        v22 = MCDGeneralLogging();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v23 = [(MCDBrowsableContentNavigationController *)self bundleID];
          *(_DWORD *)buf = 138543362;
          v30 = v23;
          _os_log_impl(&dword_23F140000, v22, OS_LOG_TYPE_DEFAULT, "Dummy tab, no need to refresh in %{public}@", buf, 0xCu);
        }
      }
      objc_msgSend(v13, "addObject:", v17, v27);
    }

    ++v16;
  }
  while (v8 != v16);
  [(MCDBrowsableContentNavigationController *)self setViewControllers:v13];
}

uint64_t __59__MCDBrowsableContentNavigationController__loadAllHostTabs__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = MCDGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) bundleID];
    int v5 = 138543362;
    BOOL v6 = v3;
    _os_log_impl(&dword_23F140000, v2, OS_LOG_TYPE_DEFAULT, "Performing dummy tab reload for %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) invalidateAndReloadTabsWithCompletion:0];
}

- (void)invalidateAndReloadTabsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  int v5 = +[MCDMediaRemoteSerialQueueManager sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__MCDBrowsableContentNavigationController_invalidateAndReloadTabsWithCompletion___block_invoke;
  v7[3] = &unk_26505C328;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 addOperation:v7 cancelAllOperations:0];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __81__MCDBrowsableContentNavigationController_invalidateAndReloadTabsWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = MCDGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F140000, v2, OS_LOG_TYPE_DEFAULT, "Reloading tabs after invalidate", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained container];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __81__MCDBrowsableContentNavigationController_invalidateAndReloadTabsWithCompletion___block_invoke_33;
  v6[3] = &unk_26505C278;
  id v7 = WeakRetained;
  id v8 = *(id *)(a1 + 32);
  id v5 = WeakRetained;
  [v4 refreshWithCompletion:v6];
}

void __81__MCDBrowsableContentNavigationController_invalidateAndReloadTabsWithCompletion___block_invoke_33(uint64_t a1)
{
  id v2 = MCDGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F140000, v2, OS_LOG_TYPE_DEFAULT, "Finished reloading tabs after invalidate", buf, 2u);
  }

  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __81__MCDBrowsableContentNavigationController_invalidateAndReloadTabsWithCompletion___block_invoke_34;
  v3[3] = &unk_26505C278;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __81__MCDBrowsableContentNavigationController_invalidateAndReloadTabsWithCompletion___block_invoke_34(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadAllHostTabs];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a4;
  id v5 = MCDGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 title];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "Tab selected, reloading content for %{public}@", (uint8_t *)&v7, 0xCu);
  }
  if (objc_opt_respondsToSelector()) {
    [v4 reloadWithCompletion:0];
  }
}

- (id)_tabBarItemForViewController:(id)a3 fromItem:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 artworkImage];
  id v8 = [v7 imageWithRenderingMode:2];

  uint64_t v9 = [v5 tabBarItem];

  if (!v9)
  {
    v10 = MCDGeneralLogging();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      id v20 = MCDGeneralLogging();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v6 title];
        v22 = [v6 artworkImage];
        __int16 v23 = @"NO";
        if (!v22) {
          __int16 v23 = @"YES";
        }
        int v27 = 138412546;
        CGRect v28 = v21;
        __int16 v29 = 2112;
        v30 = v23;
        _os_log_impl(&dword_23F140000, v20, OS_LOG_TYPE_DEFAULT, "Creating tab bar item for item: %@, artwork is nil? %@", (uint8_t *)&v27, 0x16u);
      }
      id v24 = objc_alloc(MEMORY[0x263F82C70]);
      uint64_t v16 = [v6 title];
      v10 = [v24 initWithTitle:v16 image:v8 selectedImage:v8];
      goto LABEL_19;
    }
    uint64_t v16 = [v6 title];
    int v27 = 138412290;
    CGRect v28 = v16;
    _os_log_impl(&dword_23F140000, v10, OS_LOG_TYPE_DEFAULT, "No existing tab bar item and artwork for item: %@", (uint8_t *)&v27, 0xCu);
    goto LABEL_13;
  }
  v10 = [v5 tabBarItem];
  id v11 = MCDGeneralLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v12 = [v6 title];
    int v27 = 138412290;
    CGRect v28 = v12;
    _os_log_impl(&dword_23F140000, v11, OS_LOG_TYPE_DEFAULT, "Examining existing tab bar item and artwork for item: %@", (uint8_t *)&v27, 0xCu);
  }
  int v13 = [v10 title];
  long long v14 = [v6 title];
  char v15 = [v13 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    uint64_t v16 = MCDGeneralLogging();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v6 title];
      int v27 = 138412290;
      CGRect v28 = v18;
      BOOL v19 = "Titles differ; invalidating tab bar item: %@";
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v16 = MCDGeneralLogging();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v17)
    {
      v18 = [v6 title];
      int v27 = 138412290;
      CGRect v28 = v18;
      BOOL v19 = "New image provided; invalidating tab bar item: %@";
LABEL_12:
      _os_log_impl(&dword_23F140000, v16, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v27, 0xCu);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (v17)
  {
    __int16 v26 = [v6 title];
    int v27 = 138412290;
    CGRect v28 = v26;
    _os_log_impl(&dword_23F140000, v16, OS_LOG_TYPE_DEFAULT, "Repurposing tab bar item and artwork for tab bar item: %@", (uint8_t *)&v27, 0xCu);
  }
LABEL_19:

  return v10;
}

- (id)_hostTabAtIndex:(unint64_t)a3 dummyTab:(BOOL)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a4)
  {
    id v4 = [[MCDBrowsableContentTableViewController alloc] initWithContainer:0 tabbedBrowsing:1];
  }
  else
  {
    int v7 = [(MCDBrowsableContentNavigationController *)self container];
    id v8 = [v7 containerAtIndex:a3];

    uint64_t v9 = [(MCDBrowsableContentNavigationController *)self container];
    v10 = [v9 cachedItemForIndex:a3];

    if ([v10 isContainer] && (objc_msgSend(v10, "isPlayable") & 1) == 0)
    {
      id v11 = [v10 title];
      dispatch_time_t v12 = [(MCDBrowsableContentNavigationController *)self viewControllers];
      unint64_t v13 = [v12 count];

      if (v13 <= a3)
      {
        id v4 = 0;
      }
      else
      {
        long long v14 = [(MCDBrowsableContentNavigationController *)self viewControllers];
        id v4 = [v14 objectAtIndexedSubscript:a3];
      }
      char v15 = [(MCDBrowsableContentTableViewController *)v4 container];
      uint64_t v16 = [v15 identifier];
      BOOL v17 = [v8 identifier];
      char v18 = [v16 isEqualToString:v17];

      if ((v18 & 1) == 0)
      {
        BOOL v19 = [[MCDBrowsableContentTableViewController alloc] initWithContainer:v8 tabbedBrowsing:1];

        id v4 = v19;
      }
      id v20 = MCDGeneralLogging();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v10 title];
        v22 = [v10 artworkImage];
        __int16 v23 = @"NO";
        if (!v22) {
          __int16 v23 = @"YES";
        }
        int v28 = 138412546;
        __int16 v29 = v21;
        __int16 v30 = 2112;
        uint64_t v31 = v23;
        _os_log_impl(&dword_23F140000, v20, OS_LOG_TYPE_DEFAULT, "Adding view controller for tab: %@, artwork is nil? %@", (uint8_t *)&v28, 0x16u);
      }
      [(MCDBrowsableContentTableViewController *)v4 setTitle:v11];
      id v24 = [(MCDBrowsableContentNavigationController *)self _tabBarItemForViewController:v4 fromItem:v10];
      v25 = [(MCDBrowsableContentTableViewController *)v4 tabBarItem];
      char v26 = [v24 isEqual:v25];

      if ((v26 & 1) == 0) {
        [(MCDBrowsableContentTableViewController *)v4 setTabBarItem:v24];
      }
    }
    else
    {
      id v4 = 0;
    }
  }
  return v4;
}

- (void)updateTitleAndTabBarItemsAtIndexes:(id)a3
{
  id v4 = a3;
  id v5 = [(MCDBrowsableContentNavigationController *)self viewControllers];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [v6 count];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __78__MCDBrowsableContentNavigationController_updateTitleAndTabBarItemsAtIndexes___block_invoke;
  v9[3] = &unk_26505C618;
  id v10 = v6;
  uint64_t v11 = v7;
  v9[4] = self;
  id v8 = v6;
  [v4 enumerateIndexesUsingBlock:v9];

  [(MCDBrowsableContentNavigationController *)self setViewControllers:v8];
}

void __78__MCDBrowsableContentNavigationController_updateTitleAndTabBarItemsAtIndexes___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 48) > a2)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 1224) cachedItemForIndex:a2];
    if ([v4 isContainer] && (objc_msgSend(v4, "isPlayable") & 1) == 0)
    {
      id v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
      id v6 = MCDGeneralLogging();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [v4 title];
        id v8 = [v4 artworkImage];
        uint64_t v9 = @"NO";
        if (!v8) {
          uint64_t v9 = @"YES";
        }
        int v14 = 138412546;
        char v15 = v7;
        __int16 v16 = 2112;
        BOOL v17 = v9;
        _os_log_impl(&dword_23F140000, v6, OS_LOG_TYPE_DEFAULT, "Adding title for tab: %@, artwork is nil? %@", (uint8_t *)&v14, 0x16u);
      }
      id v10 = [v4 title];
      [v5 setTitle:v10];

      uint64_t v11 = [*(id *)(a1 + 32) _tabBarItemForViewController:v5 fromItem:v4];
      dispatch_time_t v12 = [v5 tabBarItem];
      char v13 = [v11 isEqual:v12];

      if ((v13 & 1) == 0) {
        [v5 setTabBarItem:v11];
      }
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MCDBrowsableContentNavigationController;
  [(MCDBrowsableContentNavigationController *)&v8 viewWillAppear:a3];
  id v4 = [(MCDBrowsableContentNavigationController *)self traitCollection];
  -[MCDBrowsableContentNavigationController setHasCarScreen:](self, "setHasCarScreen:", [v4 userInterfaceIdiom] == 3);

  if ([(MCDBrowsableContentNavigationController *)self didFinishInitialLoad]
    && ![(MCDBrowsableContentNavigationController *)self didFinishInitialViewAppear])
  {
    id v6 = MCDGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_23F140000, v6, OS_LOG_TYPE_DEFAULT, "Container finished initial load when viewWillAppear is called, start loading host tabs", v7, 2u);
    }

    [(MCDBrowsableContentNavigationController *)self _updateNowPlayingButtonVisibility];
    [(MCDBrowsableContentNavigationController *)self _loadAllHostTabs];
    [(MCDBrowsableContentNavigationController *)self setDidFinishInitialViewAppear:1];
  }
  else
  {
    id v5 = MCDGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "viewWillAppear called for MCDBrowsableContentNavigationController, but container isn't finished loading yet", v7, 2u);
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MCDBrowsableContentNavigationController;
  [(MCDBrowsableContentNavigationController *)&v7 viewDidAppear:a3];
  [(MCDBrowsableContentNavigationController *)self setVisible:1];
  if ([(MCDBrowsableContentNavigationController *)self didFinishInitialViewAppear]
    || ![(MCDBrowsableContentNavigationController *)self didFinishInitialLoad])
  {
    if (![(MCDBrowsableContentNavigationController *)self didFinishInitialViewAppear]
      && ![(MCDBrowsableContentNavigationController *)self didFinishInitialViewAppear])
    {
      id v5 = MCDGeneralLogging();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "viewDidAppear called for MCDBrowsableContentNavigationController, but container isn't finished loading yet", v6, 2u);
      }
    }
  }
  else
  {
    id v4 = MCDGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Container finished initial load when viewDidAppear is called, start loading host tabs", v6, 2u);
    }

    [(MCDBrowsableContentNavigationController *)self _updateNowPlayingButtonVisibility];
    [(MCDBrowsableContentNavigationController *)self _loadAllHostTabs];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MCDBrowsableContentNavigationController;
  [(MCDBrowsableContentNavigationController *)&v4 viewWillDisappear:a3];
  [(MCDBrowsableContentNavigationController *)self setVisible:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MCDBrowsableContentNavigationController;
  [(MCDBrowsableContentNavigationController *)&v7 traitCollectionDidChange:a3];
  objc_super v4 = [(MCDBrowsableContentNavigationController *)self traitCollection];
  -[MCDBrowsableContentNavigationController setHasCarScreen:](self, "setHasCarScreen:", [v4 userInterfaceIdiom] == 3);

  id v5 = MCDGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "traitCollectionDidChange is called", v6, 2u);
  }
}

- (MCDPCContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (UITabBarController)tabBarController
{
  return self->_tabBarController;
}

- (void)setTabBarController:(id)a3
{
}

- (MCDPCModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (CPUINowPlayingButtonWrapperView)nowPlayingButtonView
{
  return self->_nowPlayingButtonView;
}

- (void)setNowPlayingButtonView:(id)a3
{
}

- (BOOL)hasCarScreen
{
  return self->_hasCarScreen;
}

- (void)setHasCarScreen:(BOOL)a3
{
  self->_hasCarScreen = a3;
}

- (BOOL)didFinishInitialLoad
{
  return self->_didFinishInitialLoad;
}

- (void)setDidFinishInitialLoad:(BOOL)a3
{
  self->_didFinishInitialLoad = a3;
}

- (BOOL)didFinishInitialViewAppear
{
  return self->_didFinishInitialViewAppear;
}

- (void)setDidFinishInitialViewAppear:(BOOL)a3
{
  self->_didFinishInitialViewAppear = a3;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)hasInvalidatedDummyTabs
{
  return self->_hasInvalidatedDummyTabs;
}

- (void)setHasInvalidatedDummyTabs:(BOOL)a3
{
  self->_hasInvalidatedDummyTabs = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_nowPlayingButtonView, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end