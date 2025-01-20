@interface MCDNowPlayingViewController
- (BOOL)handledWillAppear;
- (BOOL)shouldShowPlaybackQueue;
- (BOOL)showNavigationBar;
- (BOOL)trackBuffering;
- (MCDNowPlayingBackdropView)backdropView;
- (MCDNowPlayingContentManagerProtocol)contentManager;
- (MCDNowPlayingViewController)initWithBundleID:(id)a3 appName:(id)a4;
- (MCDNowPlayingViewController)initWithPlayableBundleID:(id)a3 appName:(id)a4;
- (MPWeakTimer)activityTimer;
- (NSArray)additionalBarButtonItems;
- (NSString)appName;
- (UIActivityIndicatorView)activityIndicator;
- (UIBarButtonItem)activityIndicatorBarButtonItem;
- (UIBarButtonItem)queueBarButtonItem;
- (UIBarButtonItem)rightTitleLabelBarButtonItem;
- (UILabel)rightTitleLabel;
- (UITableViewController)playbackQueueViewController;
- (id)_upNextBarButtonItem;
- (void)_adjustRightTitleLabelToFit;
- (void)_handleWillAppear;
- (void)_invalidateActivityTimer;
- (void)_popViewControllerAnimated;
- (void)_setupActivityTimer;
- (void)_updateBackButton;
- (void)contentManager:(id)a3 bufferingItem:(BOOL)a4;
- (void)contentManager:(id)a3 displayItemIndex:(int64_t)a4 totalItemCount:(int64_t)a5;
- (void)contentManager:(id)a3 presentViewController:(id)a4;
- (void)contentManager:(id)a3 processResponse:(id)a4 error:(id)a5;
- (void)contentManager:(id)a3 pushViewController:(id)a4;
- (void)contentManager:(id)a3 sectionName:(id)a4;
- (void)contentManager:(id)a3 setAdditionalBarButtonItems:(id)a4;
- (void)contentManager:(id)a3 shouldShowPlaybackQueue:(BOOL)a4;
- (void)contentManagerCompletedAllPlayback:(id)a3;
- (void)contentManagerInitiatedPlaybackFromPlaybackQueue:(id)a3;
- (void)contentManagerReloadData:(id)a3;
- (void)dealloc;
- (void)setActivityIndicator:(id)a3;
- (void)setActivityIndicatorBarButtonItem:(id)a3;
- (void)setActivityTimer:(id)a3;
- (void)setAdditionalBarButtonItems:(id)a3;
- (void)setAppName:(id)a3;
- (void)setBackdropView:(id)a3;
- (void)setContentManager:(id)a3;
- (void)setHandledWillAppear:(BOOL)a3;
- (void)setPlaybackQueueViewController:(id)a3;
- (void)setQueueBarButtonItem:(id)a3;
- (void)setRightTitle:(id)a3;
- (void)setRightTitleLabel:(id)a3;
- (void)setRightTitleLabelBarButtonItem:(id)a3;
- (void)setShouldShowPlaybackQueue:(BOOL)a3;
- (void)setShowNavigationBar:(BOOL)a3;
- (void)setTrackBuffering:(BOOL)a3;
- (void)upNextButtonTapped:(id)a3;
- (void)updateBarButtonItems;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation MCDNowPlayingViewController

- (MCDNowPlayingViewController)initWithBundleID:(id)a3 appName:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCDNowPlayingViewController;
  v8 = [(CPUINowPlayingViewController *)&v11 initWithBundleIdentifier:a3 dataSource:0 delegate:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_appName, a4);
  }

  return v9;
}

- (MCDNowPlayingViewController)initWithPlayableBundleID:(id)a3 appName:(id)a4
{
  id v6 = a3;
  id v7 = [(MCDNowPlayingViewController *)self initWithBundleID:v6 appName:a4];
  if (v7)
  {
    v8 = [MCDPlayableContentPlaybackManager alloc];
    v9 = objc_opt_new();
    v10 = [(_MCDNowPlayingContentManager *)v8 initWithDelegate:v7 dataSource:v9 bundleID:v6];
    [(MCDNowPlayingViewController *)v7 setContentManager:v10];

    objc_super v11 = [MCDPlayableContentQueueTableViewController alloc];
    v12 = [(MCDNowPlayingViewController *)v7 contentManager];
    v13 = [(MCDPlayableContentQueueTableViewController *)v11 initWithContentManager:v12];
    [(MCDNowPlayingViewController *)v7 setPlaybackQueueViewController:v13];
  }
  return v7;
}

- (void)setContentManager:(id)a3
{
  v5 = (MCDNowPlayingContentManagerProtocol *)a3;
  if (self->_contentManager != v5)
  {
    objc_storeStrong((id *)&self->_contentManager, a3);
    [(CPUINowPlayingViewController *)self setDataSource:v5];
    [(CPUINowPlayingViewController *)self setDelegate:v5];
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v4 = [(MCDNowPlayingViewController *)self contentManager];
  id v5 = v4;
  if (a3) {
    [v4 beginRequestObservation];
  }
  else {
    [v4 endRequestObservation];
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MCDNowPlayingViewController;
  [(CPUINowPlayingViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v59[2] = *MEMORY[0x263EF8340];
  v58.receiver = self;
  v58.super_class = (Class)MCDNowPlayingViewController;
  [(CPUINowPlayingViewController *)&v58 viewDidLoad];
  v3 = [(MCDNowPlayingViewController *)self navigationItem];
  id v4 = objc_alloc(MEMORY[0x263F82E00]);
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
  [v3 setTitleView:v9];

  v10 = [(CPUINowPlayingViewController *)self bundleIdentifier];
  int v11 = MRMediaRemoteApplicationSupportsBrowsableContent();

  if (v11)
  {
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:self selector:sel__updateBackButton name:*MEMORY[0x263F54978] object:0];
  }
  [(MCDNowPlayingViewController *)self _updateBackButton];
  v13 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v5, v6, v7, v8);
  [(MCDNowPlayingViewController *)self setRightTitleLabel:v13];

  v14 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
  v15 = [(MCDNowPlayingViewController *)self rightTitleLabel];
  [v15 setFont:v14];

  v16 = [(MCDNowPlayingViewController *)self rightTitleLabel];
  [v16 setLineBreakMode:4];

  v17 = [MEMORY[0x263F825C8] _labelColor];
  v18 = [v17 colorWithAlphaComponent:0.5];
  v19 = [(MCDNowPlayingViewController *)self rightTitleLabel];
  [v19 setTextColor:v18];

  v20 = [(MCDNowPlayingViewController *)self rightTitleLabel];
  [v20 setTextAlignment:2];

  [(MCDNowPlayingViewController *)self _adjustRightTitleLabelToFit];
  v21 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [(MCDNowPlayingViewController *)self setActivityIndicator:v21];

  v22 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:self->_activityIndicator];
  [(MCDNowPlayingViewController *)self setActivityIndicatorBarButtonItem:v22];

  [(MCDNowPlayingViewController *)self _setupActivityTimer];
  id v23 = objc_alloc(MEMORY[0x263F824A8]);
  v24 = [(MCDNowPlayingViewController *)self rightTitleLabel];
  v25 = (void *)[v23 initWithCustomView:v24];
  [(MCDNowPlayingViewController *)self setRightTitleLabelBarButtonItem:v25];

  LODWORD(v25) = _os_feature_enabled_impl();
  v26 = objc_opt_new();
  if (v25)
  {
    v27 = [MEMORY[0x263F827E8] systemImageNamed:@"list.bullet"];
    [v26 setImage:v27 forState:0];

    [v26 addTarget:self action:sel_upNextButtonTapped_ forControlEvents:64];
    objc_msgSend(v26, "setFrame:", 0.0, 0.0, 48.0, 26.0);
    v28 = MCDCarDisplayBundle();
    v29 = [v28 localizedStringForKey:@"ACCESSIBILITY_QUEUE" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
    v59[0] = v29;
    v30 = MCDCarDisplayBundle();
    v31 = [v30 localizedStringForKey:@"ACCESSIBILITY_LIST" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
    v59[1] = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:2];
    [v26 setAccessibilityUserInputLabels:v32];
  }
  else
  {
    v33 = [MEMORY[0x263F81708] systemFontOfSize:16.0];
    v34 = [v26 titleLabel];
    [v34 setFont:v33];

    v35 = MCDCarDisplayBundle();
    v36 = [v35 localizedStringForKey:@"PLAYBACK_QUEUE_TITLE" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
    [v26 setTitle:v36 forState:0];

    [v26 addTarget:self action:sel_upNextButtonTapped_ forControlEvents:64];
    [v26 sizeToFit];
    [v26 frame];
    objc_msgSend(v26, "setFrame:", v60.origin.x, v60.origin.y, CGRectGetWidth(v60) + 16.0, v60.size.height + 6.0);
  }
  v37 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v26];
  [(MCDNowPlayingViewController *)self setQueueBarButtonItem:v37];

  [(MCDNowPlayingViewController *)self setRightTitle:0];
  v38 = [(CPUINowPlayingViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v39 = [(CPUINowPlayingViewController *)self delegate];
    uint64_t v40 = [v39 nowPlayingViewControllerCanShowUpNext:self];
  }
  else
  {
    uint64_t v40 = 0;
  }

  v41 = [(MCDNowPlayingViewController *)self contentManager];
  [(MCDNowPlayingViewController *)self contentManager:v41 shouldShowPlaybackQueue:v40];

  if (MSVDeviceOSIsInternalInstall())
  {
    v42 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v43 = [v42 BOOLForKey:@"rogueCarPlayBackdrop"];

    if (v43)
    {
      uint64_t v52 = 0;
      v53 = &v52;
      uint64_t v54 = 0x3032000000;
      v55 = __Block_byref_object_copy__0;
      v56 = __Block_byref_object_dispose__0;
      id v57 = 0;
      v44 = [(MCDNowPlayingViewController *)self view];
      v45 = [v44 subviews];
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __42__MCDNowPlayingViewController_viewDidLoad__block_invoke;
      v51[3] = &unk_26505C108;
      v51[4] = &v52;
      [v45 enumerateObjectsUsingBlock:v51];

      v46 = [MCDNowPlayingBackdropView alloc];
      v47 = [(MCDNowPlayingViewController *)self view];
      [v47 bounds];
      v48 = -[MCDNowPlayingBackdropView initWithFrame:](v46, "initWithFrame:");

      [(MCDNowPlayingBackdropView *)v48 setAutoresizingMask:18];
      [(MCDNowPlayingViewController *)self setBackdropView:v48];
      v49 = (void *)v53[5];
      if (v49)
      {
        [v49 setHidden:1];
        v50 = [(MCDNowPlayingViewController *)self view];
        [v50 insertSubview:v48 aboveSubview:v53[5]];
      }
      else
      {
        v50 = [(MCDNowPlayingViewController *)self view];
        [v50 insertSubview:v48 atIndex:0];
      }

      _Block_object_dispose(&v52, 8);
    }
  }
}

void __42__MCDNowPlayingViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)upNextButtonTapped:(id)a3
{
  id v4 = [(MCDNowPlayingViewController *)self navigationController];
  double v5 = [v4 viewControllers];
  double v6 = [(MCDNowPlayingViewController *)self playbackQueueViewController];
  int v7 = [v5 containsObject:v6];

  id v10 = [(MCDNowPlayingViewController *)self navigationController];
  double v8 = [(MCDNowPlayingViewController *)self playbackQueueViewController];
  if (v7) {
    id v9 = (id)[v10 popToViewController:v8 animated:1];
  }
  else {
    [v10 pushViewController:v8 animated:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MCDNowPlayingViewController;
  [(CPUINowPlayingViewController *)&v4 viewWillAppear:a3];
  [(MCDNowPlayingViewController *)self _handleWillAppear];
  [(MCDNowPlayingViewController *)self updateBarButtonItems];
}

- (void)_handleWillAppear
{
  if (self->_showNavigationBar)
  {
    v3 = [(MCDNowPlayingViewController *)self navigationController];
    [v3 setNavigationBarHidden:0 animated:1];
  }
  [(MCDNowPlayingViewController *)self setHandledWillAppear:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_handledWillAppear) {
    [(MCDNowPlayingViewController *)self _handleWillAppear];
  }
  v5.receiver = self;
  v5.super_class = (Class)MCDNowPlayingViewController;
  [(MCDNowPlayingViewController *)&v5 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MCDNowPlayingViewController;
  [(CPUINowPlayingViewController *)&v4 viewWillDisappear:a3];
  [(MCDNowPlayingViewController *)self setHandledWillAppear:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCDNowPlayingViewController;
  [(CPUINowPlayingViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(MCDNowPlayingViewController *)self contentManager];
  [v4 viewWillDisappear];

  [(MCDNowPlayingViewController *)self setHandledWillAppear:0];
}

- (void)viewSafeAreaInsetsDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)MCDNowPlayingViewController;
  [(MCDNowPlayingViewController *)&v6 viewSafeAreaInsetsDidChange];
  BOOL v3 = [(MCDNowPlayingViewController *)self contentManager];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    objc_super v5 = [(MCDNowPlayingViewController *)self contentManager];
    [v5 updateNoContentViewFrameIfNeeded];
  }
}

- (id)_upNextBarButtonItem
{
  return 0;
}

- (void)_updateBackButton
{
  v2 = [(CPUINowPlayingViewController *)self bundleIdentifier];
  MRMediaRemoteGetSupportedBrowsableContentAPIs();
}

void __48__MCDNowPlayingViewController__updateBackButton__block_invoke(uint64_t a1, int a2, int a3)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__MCDNowPlayingViewController__updateBackButton__block_invoke_2;
  v3[3] = &unk_26505C130;
  int v4 = a3;
  int v5 = a2;
  v3[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __48__MCDNowPlayingViewController__updateBackButton__block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = *(_DWORD *)(a1 + 44) == 0;
  }
  BOOL v3 = [*(id *)(a1 + 32) contentManager];
  [v3 setShouldHideBackButton:v2];

  int v4 = *(void **)(a1 + 32);
  return [v4 reloadData];
}

- (void)setRightTitle:(id)a3
{
  id v15 = a3;
  int v4 = [(MCDNowPlayingViewController *)self appName];

  if (v4)
  {
    int v5 = +[MCDBrowsableContentUtilities sharedInstance];
    objc_super v6 = [v5 firstPartyAppBundleIDs];
    int v7 = [(CPUINowPlayingViewController *)self bundleIdentifier];
    char v8 = [v6 containsObject:v7];

    if (v8)
    {
      id v9 = v15;
    }
    else
    {
      if (v15)
      {
        id v10 = NSString;
        int v11 = MCDCarDisplayBundle();
        v12 = [v11 localizedStringForKey:@"AppName_PlaybackQueue" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
        v13 = [(MCDNowPlayingViewController *)self appName];
        int v4 = objc_msgSend(v10, "localizedStringWithFormat:", v12, v13, v15);

        goto LABEL_8;
      }
      id v9 = [(MCDNowPlayingViewController *)self appName];
    }
    int v4 = v9;
  }
LABEL_8:
  v14 = [(MCDNowPlayingViewController *)self rightTitleLabel];
  [v14 setText:v4];

  [(MCDNowPlayingViewController *)self _adjustRightTitleLabelToFit];
}

- (void)_adjustRightTitleLabelToFit
{
  BOOL v3 = [(MCDNowPlayingViewController *)self rightTitleLabel];
  [v3 sizeToFit];

  int v4 = [(MCDNowPlayingViewController *)self rightTitleLabel];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;

  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  double Width = CGRectGetWidth(v24);
  v14 = [(MCDNowPlayingViewController *)self view];
  [v14 frame];
  double v15 = CGRectGetWidth(v25) * 0.6;

  if (Width > v15) {
    double Width = v15;
  }
  v16 = [(MCDNowPlayingViewController *)self rightTitleLabel];
  [v16 frame];
  v27.origin.x = v17;
  v27.origin.y = v18;
  v27.size.width = v19;
  v27.size.height = v20;
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = Width;
  v26.size.height = v12;
  BOOL v21 = CGRectEqualToRect(v26, v27);

  if (!v21)
  {
    id v22 = [(MCDNowPlayingViewController *)self rightTitleLabel];
    objc_msgSend(v22, "setFrame:", v6, v8, Width, v12);
  }
}

- (void)updateBarButtonItems
{
  if ([(MCDNowPlayingViewController *)self shouldShowPlaybackQueue]) {
    [(MCDNowPlayingViewController *)self queueBarButtonItem];
  }
  else {
  uint64_t v3 = [(MCDNowPlayingViewController *)self rightTitleLabelBarButtonItem];
  }
  if (v3)
  {
    uint64_t v12 = v3;
    int v4 = [(MCDNowPlayingViewController *)self activityIndicatorBarButtonItem];

    if (v4)
    {
      double v5 = [MEMORY[0x263EFF980] arrayWithObject:v12];
      double v6 = [(MCDNowPlayingViewController *)self additionalBarButtonItems];
      [v5 addObjectsFromArray:v6];

      double v7 = [(MCDNowPlayingViewController *)self activityIndicatorBarButtonItem];
      [v5 addObject:v7];

      double v8 = [(MCDNowPlayingViewController *)self navigationItem];
      double v9 = [v8 rightBarButtonItems];
      char v10 = [v9 isEqualToArray:v5];

      if ((v10 & 1) == 0)
      {
        double v11 = [(MCDNowPlayingViewController *)self navigationItem];
        [v11 setRightBarButtonItems:v5];
      }
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)contentManager:(id)a3 processResponse:(id)a4 error:(id)a5
{
  id v6 = a4;
  if (MSVDeviceOSIsInternalInstall())
  {
    double v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v8 = [v7 BOOLForKey:@"rogueCarPlayBackdrop"];

    if (v8)
    {
      double v9 = [v6 tracklist];
      char v10 = [v9 playingItem];
      double v11 = [v10 metadataObject];
      uint64_t v12 = [v11 flattenedGenericObject];

      v13 = [v12 artworkCatalog];
      v14 = [(MCDNowPlayingViewController *)self view];
      [v14 bounds];
      objc_msgSend(v13, "setFittingSize:", v15, v16);

      CGFloat v17 = (void *)MEMORY[0x263F11D30];
      CGFloat v18 = [(MCDNowPlayingViewController *)self backdropView];
      [v17 setCacheLimit:1 forCacheIdentifier:@"Backdrop" cacheReference:v18];

      CGFloat v19 = [(MCDNowPlayingViewController *)self backdropView];
      [v13 setCacheIdentifier:@"Backdrop" forCacheReference:v19];

      CGFloat v20 = [(MCDNowPlayingViewController *)self traitCollection];
      [v20 displayScale];
      objc_msgSend(v13, "setDestinationScale:");

      BOOL v21 = [(MCDNowPlayingViewController *)self backdropView];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __68__MCDNowPlayingViewController_contentManager_processResponse_error___block_invoke;
      v23[3] = &unk_26505C158;
      id v24 = v12;
      CGRect v25 = self;
      id v22 = v12;
      [v13 setDestination:v21 configurationBlock:v23];
    }
  }
}

void __68__MCDNowPlayingViewController_contentManager_processResponse_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) anyObject];
  double v7 = [v6 identifiers];
  int v8 = [*(id *)(a1 + 40) contentManager];
  double v9 = [v8 currentPlayingSong];
  char v10 = [v9 identifiers];
  int v11 = [v7 intersectsSet:v10];

  if (v11) {
    [v12 updateWithImage:v5 animated:1];
  }
}

- (void)contentManager:(id)a3 bufferingItem:(BOOL)a4
{
  [(MCDNowPlayingViewController *)self setTrackBuffering:a4];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__MCDNowPlayingViewController_contentManager_bufferingItem___block_invoke;
  block[3] = &unk_26505BE68;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__MCDNowPlayingViewController_contentManager_bufferingItem___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) trackBuffering];
  uint64_t v3 = [*(id *)(a1 + 32) activityIndicator];
  id v4 = v3;
  if (v2) {
    [v3 startAnimating];
  }
  else {
    [v3 stopAnimating];
  }
}

- (void)contentManagerReloadData:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__MCDNowPlayingViewController_contentManagerReloadData___block_invoke;
  block[3] = &unk_26505BE68;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__MCDNowPlayingViewController_contentManagerReloadData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

- (void)contentManager:(id)a3 presentViewController:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__MCDNowPlayingViewController_contentManager_presentViewController___block_invoke;
  v7[3] = &unk_26505BE18;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __68__MCDNowPlayingViewController_contentManager_presentViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)contentManager:(id)a3 pushViewController:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__MCDNowPlayingViewController_contentManager_pushViewController___block_invoke;
  v7[3] = &unk_26505BE18;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __65__MCDNowPlayingViewController_contentManager_pushViewController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 pushViewController:*(void *)(a1 + 40) animated:1];
}

- (void)contentManager:(id)a3 shouldShowPlaybackQueue:(BOOL)a4
{
  [(MCDNowPlayingViewController *)self setShouldShowPlaybackQueue:a4];
  if ([(MCDNowPlayingViewController *)self handledWillAppear])
  {
    [(MCDNowPlayingViewController *)self updateBarButtonItems];
  }
}

- (void)contentManager:(id)a3 sectionName:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__MCDNowPlayingViewController_contentManager_sectionName___block_invoke;
  v7[3] = &unk_26505BE18;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __58__MCDNowPlayingViewController_contentManager_sectionName___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRightTitle:*(void *)(a1 + 40)];
}

- (void)contentManager:(id)a3 displayItemIndex:(int64_t)a4 totalItemCount:(int64_t)a5
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__MCDNowPlayingViewController_contentManager_displayItemIndex_totalItemCount___block_invoke;
  block[3] = &unk_26505C180;
  block[4] = self;
  void block[5] = a4;
  block[6] = a5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __78__MCDNowPlayingViewController_contentManager_displayItemIndex_totalItemCount___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = NSString;
  MCDCarDisplayBundle();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v10 localizedStringForKey:@"POSITION_IN_PLAYLIST_FORMAT" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
  id v5 = [NSNumber numberWithInteger:a1[5] + 1];
  id v6 = MCDFormattedNumberString(v5);
  double v7 = [NSNumber numberWithInteger:a1[6]];
  id v8 = MCDFormattedNumberString(v7);
  double v9 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v6, v8);
  [v2 setRightTitle:v9];
}

- (void)contentManagerInitiatedPlaybackFromPlaybackQueue:(id)a3
{
  id v4 = MCDGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Row selected in Playback Queue, dismissing Playback Queue screen", v5, 2u);
  }

  [(MCDNowPlayingViewController *)self _popViewControllerAnimated];
}

- (void)contentManagerCompletedAllPlayback:(id)a3
{
  id v4 = MCDGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "All playback completed, dismissing Now Playing screen", v5, 2u);
  }

  [(MCDNowPlayingViewController *)self _popViewControllerAnimated];
}

- (void)contentManager:(id)a3 setAdditionalBarButtonItems:(id)a4
{
  [(MCDNowPlayingViewController *)self setAdditionalBarButtonItems:a4];
  [(MCDNowPlayingViewController *)self updateBarButtonItems];
}

- (void)_popViewControllerAnimated
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__MCDNowPlayingViewController__popViewControllerAnimated__block_invoke;
  block[3] = &unk_26505BE68;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __57__MCDNowPlayingViewController__popViewControllerAnimated__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  uint64_t v3 = [v2 viewControllers];
  int v4 = [v3 containsObject:*(void *)(a1 + 32)];

  if (v4)
  {
    id v6 = [*(id *)(a1 + 32) navigationController];
    id v5 = (id)[v6 popViewControllerAnimated:1];
  }
}

- (void)_setupActivityTimer
{
  [(MCDNowPlayingViewController *)self _invalidateActivityTimer];
  objc_initWeak(&location, self);
  uint64_t v3 = (void *)MEMORY[0x263F12358];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__MCDNowPlayingViewController__setupActivityTimer__block_invoke;
  v5[3] = &unk_26505C1A8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  int v4 = [v3 timerWithInterval:0 repeats:v5 block:2.0];
  [(MCDNowPlayingViewController *)self setActivityTimer:v4];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __50__MCDNowPlayingViewController__setupActivityTimer__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    if (([WeakRetained[157] isAnimating] & 1) == 0
      && [*(id *)(a1 + 32) trackBuffering])
    {
      [v3[157] startAnimating];
    }
    [v3 _invalidateActivityTimer];
    WeakRetained = v3;
  }
}

- (void)_invalidateActivityTimer
{
  uint64_t v3 = [(MCDNowPlayingViewController *)self activityTimer];

  if (v3)
  {
    int v4 = [(MCDNowPlayingViewController *)self activityTimer];
    [v4 invalidate];

    [(MCDNowPlayingViewController *)self setActivityTimer:0];
  }
}

- (BOOL)showNavigationBar
{
  return self->_showNavigationBar;
}

- (void)setShowNavigationBar:(BOOL)a3
{
  self->_showNavigationBar = a3;
}

- (UITableViewController)playbackQueueViewController
{
  return self->_playbackQueueViewController;
}

- (void)setPlaybackQueueViewController:(id)a3
{
}

- (MCDNowPlayingContentManagerProtocol)contentManager
{
  return self->_contentManager;
}

- (MCDNowPlayingBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UIBarButtonItem)activityIndicatorBarButtonItem
{
  return self->_activityIndicatorBarButtonItem;
}

- (void)setActivityIndicatorBarButtonItem:(id)a3
{
}

- (BOOL)trackBuffering
{
  return self->_trackBuffering;
}

- (void)setTrackBuffering:(BOOL)a3
{
  self->_trackBuffering = a3;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (MPWeakTimer)activityTimer
{
  return self->_activityTimer;
}

- (void)setActivityTimer:(id)a3
{
}

- (UILabel)rightTitleLabel
{
  return self->_rightTitleLabel;
}

- (void)setRightTitleLabel:(id)a3
{
}

- (UIBarButtonItem)rightTitleLabelBarButtonItem
{
  return self->_rightTitleLabelBarButtonItem;
}

- (void)setRightTitleLabelBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)queueBarButtonItem
{
  return self->_queueBarButtonItem;
}

- (void)setQueueBarButtonItem:(id)a3
{
}

- (NSArray)additionalBarButtonItems
{
  return self->_additionalBarButtonItems;
}

- (void)setAdditionalBarButtonItems:(id)a3
{
}

- (BOOL)handledWillAppear
{
  return self->_handledWillAppear;
}

- (void)setHandledWillAppear:(BOOL)a3
{
  self->_handledWillAppear = a3;
}

- (BOOL)shouldShowPlaybackQueue
{
  return self->_shouldShowPlaybackQueue;
}

- (void)setShouldShowPlaybackQueue:(BOOL)a3
{
  self->_shouldShowPlaybackQueue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalBarButtonItems, 0);
  objc_storeStrong((id *)&self->_queueBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightTitleLabelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightTitleLabel, 0);
  objc_storeStrong((id *)&self->_activityTimer, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_activityIndicatorBarButtonItem, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_contentManager, 0);
  objc_storeStrong((id *)&self->_playbackQueueViewController, 0);
}

@end