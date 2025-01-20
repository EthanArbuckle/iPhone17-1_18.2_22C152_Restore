@interface MCDBrowsableContentTableViewController
- (BOOL)_shouldLimitLists;
- (BOOL)currentlyPlayingApp;
- (BOOL)didFinishInitialLoad;
- (BOOL)didFinishInitialViewAppear;
- (BOOL)isVisible;
- (BOOL)pushToNowPlaying;
- (MCDBrowsableContentTableViewController)initWithContainer:(id)a3;
- (MCDBrowsableContentTableViewController)initWithContainer:(id)a3 tabbedBrowsing:(BOOL)a4;
- (MCDBrowsableContentTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MCDPCContainer)container;
- (MPWeakTimer)loadingTimer;
- (NSIndexPath)selectedIndexPath;
- (NSString)description;
- (UIAlertController)alertController;
- (UIView)placeholderView;
- (id)contentScrollView;
- (id)preferredFocusEnvironments;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_appRegisteredForContent:(id)a3;
- (void)_clearLoadingActivity;
- (void)_clearTableViewSelectionAnimated:(BOOL)a3;
- (void)_configureCell:(id)a3 forIndexPath:(id)a4;
- (void)_displayErrorAlertController:(id)a3;
- (void)_displayLoadingActivity;
- (void)_limitedUIChanged:(id)a3;
- (void)_nowPlayingButtonTapped:(id)a3;
- (void)_playbackStateChanged:(id)a3;
- (void)_pushToNowPlaying:(BOOL)a3;
- (void)_replacePlaceholderViewWithView:(id)a3;
- (void)_showLoadingScreen;
- (void)_showTimeoutScreen;
- (void)_updateNowPlayingButtonVisibility;
- (void)container:(id)a3 didInvalidateIndicies:(id)a4;
- (void)containerDidChangeCount:(id)a3;
- (void)dealloc;
- (void)errorViewDidTapButton:(id)a3;
- (void)reloadTable;
- (void)reloadWithCompletion:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setContainer:(id)a3;
- (void)setCurrentlyPlayingApp:(BOOL)a3;
- (void)setDidFinishInitialLoad:(BOOL)a3;
- (void)setDidFinishInitialViewAppear:(BOOL)a3;
- (void)setLoadingTimer:(id)a3;
- (void)setPlaceholderView:(id)a3;
- (void)setPushToNowPlaying:(BOOL)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)tableView:(id)a3 didFocusRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MCDBrowsableContentTableViewController

- (MCDBrowsableContentTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (MCDBrowsableContentTableViewController)initWithContainer:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MCDBrowsableContentTableViewController;
  v6 = [(MCDBrowsableContentTableViewController *)&v24 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    p_container = (id *)&v6->_container;
    objc_storeStrong((id *)&v6->_container, a3);
    [*p_container setDelegate:v7];
    v9 = [*p_container title];
    [(MCDBrowsableContentTableViewController *)v7 setTitle:v9];

    v10 = (_UIFilteredDataSource *)objc_alloc_init(MEMORY[0x263F82F68]);
    dataSource = v7->_dataSource;
    v7->_dataSource = v10;

    [(_UIFilteredDataSource *)v7->_dataSource setTableDataSource:v7];
    [(_UIFilteredDataSource *)v7->_dataSource setFilterType:0];
    v12 = [v5 model];
    objc_msgSend(v12, "setImageSize:", 48.0, 48.0);

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    v14 = (CARSessionStatus *)objc_alloc_init(MEMORY[0x263F30E50]);
    carSessionStatus = v7->_carSessionStatus;
    v7->_carSessionStatus = v14;

    [(CARSessionStatus *)v7->_carSessionStatus addSessionObserver:v7];
    [v13 addObserver:v7 selector:sel__limitedUIChanged_ name:*MEMORY[0x263F30DA0] object:0];
    [v13 addObserver:v7 selector:sel__nowPlayingDidChange_ name:@"MCDContentItemsChangedNotification" object:0];
    v16 = [v5 indexPath];
    uint64_t v17 = [v16 length];

    if (v17) {
      v7->_didFinishInitialLoad = 1;
    }
    else {
      [v13 addObserver:v7 selector:sel__appRegisteredForContent_ name:@"appReadyToFetch" object:0];
    }
    v18 = [v5 indexPath];
    uint64_t v19 = [v18 length];

    if (v19) {
      v7->_didFinishInitialLoad = 1;
    }
    else {
      [v13 addObserver:v7 selector:sel__appRegisteredForContent_ name:@"appReadyToFetch" object:0];
    }
    dispatch_queue_t v20 = dispatch_queue_create("MCDBrowsableContentViewControllerQueue", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v20;

    v22 = [MEMORY[0x263F08A00] defaultCenter];
    [v22 addObserver:v7 selector:sel__playbackStateChanged_ name:@"MCDPlaybackStateChangedNotification" object:0];
  }
  return v7;
}

- (MCDBrowsableContentTableViewController)initWithContainer:(id)a3 tabbedBrowsing:(BOOL)a4
{
  result = [(MCDBrowsableContentTableViewController *)self initWithContainer:a3];
  result->_hasTabbedBrowsing = a4;
  return result;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];
  [v3 removeObserver:self name:*MEMORY[0x263F30DA0] object:0];
  [(UITableView *)self->_tableView setDataSource:0];
  [(UITableView *)self->_tableView setDelegate:0];
  nowPlayingButton = self->_nowPlayingButton;
  self->_nowPlayingButton = 0;

  serialQueue = self->_serialQueue;
  self->_serialQueue = 0;

  container = self->_container;
  self->_container = 0;

  v7.receiver = self;
  v7.super_class = (Class)MCDBrowsableContentTableViewController;
  [(MCDBrowsableContentTableViewController *)&v7 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(MCDBrowsableContentTableViewController *)self container];
  objc_super v7 = [v6 indexPath];
  v8 = _MCDStringFromIndexPath(v7);
  v9 = [v3 stringWithFormat:@"<%@: %p [%@]>", v5, self, v8];

  return (NSString *)v9;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)MCDBrowsableContentTableViewController;
  [(MCDBrowsableContentTableViewController *)&v15 viewDidLoad];
  v3 = [(MCDBrowsableContentTableViewController *)self navigationController];
  v4 = [v3 viewControllers];
  self->_isRootTableViewController = (unint64_t)[v4 count] < 2;

  id v5 = [(MCDBrowsableContentTableViewController *)self view];
  MCD_tableView = self->_MCD_tableView;
  self->_MCD_tableView = v5;
  objc_super v7 = v5;

  [(UIView *)v7 bounds];
  v12 = -[_MCDBrowsableTableView initWithFrame:]([_MCDBrowsableTableView alloc], "initWithFrame:", v8, v9, v10, v11);
  tableView = self->_tableView;
  self->_tableView = &v12->super;

  [(UITableView *)self->_tableView setAutoresizingMask:18];
  [(UIView *)v7 addSubview:self->_tableView];
  [(UITableView *)self->_tableView setDataSource:self->_dataSource];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setRemembersLastFocusedIndexPath:1];
  double v14 = *MEMORY[0x263F839B8];
  [(UITableView *)self->_tableView setRowHeight:*MEMORY[0x263F839B8]];
  [(UITableView *)self->_tableView setEstimatedRowHeight:v14];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MCDBrowsableContentTableViewController;
  -[MCDBrowsableContentTableViewController viewWillAppear:](&v7, sel_viewWillAppear_);
  if (self->_hasTabbedBrowsing)
  {
    id v5 = [(MCDBrowsableContentTableViewController *)self navigationController];
    [v5 setNavigationBarHidden:self->_isRootTableViewController animated:1];
  }
  [(MCDBrowsableContentTableViewController *)self _clearTableViewSelectionAnimated:v3];
  v6 = [MEMORY[0x263F82B60] _carScreen];
  self->_hasCarScreen = v6 != 0;

  [(MCDBrowsableContentTableViewController *)self _updateNowPlayingButtonVisibility];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MCDBrowsableContentTableViewController *)self setVisible:1];
  v8.receiver = self;
  v8.super_class = (Class)MCDBrowsableContentTableViewController;
  [(MCDBrowsableContentTableViewController *)&v8 viewDidAppear:v3];
  [(MCDBrowsableContentTableViewController *)self setDidFinishInitialViewAppear:1];
  id v5 = [(MCDBrowsableContentTableViewController *)self container];
  v6 = [v5 model];
  objc_super v7 = [v6 bundleID];
  MRMediaRemoteGetSupportedBrowsableContentAPIs();

  [(UITableView *)self->_tableView flashScrollIndicators];
}

void __56__MCDBrowsableContentTableViewController_viewDidAppear___block_invoke(uint64_t a1, int a2, int a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 1066) = (a3 | a2) == 0;
  v4 = MCDGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = *(unsigned char *)(*(void *)(a1 + 32) + 1066) == 0;
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Playable Content API implemented? %d", (uint8_t *)v6, 8u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MCDBrowsableContentTableViewController;
  [(MCDBrowsableContentTableViewController *)&v9 viewWillDisappear:a3];
  [(MPWeakTimer *)self->_delayTimer invalidate];
  delayTimer = self->_delayTimer;
  self->_delayTimer = 0;

  [(MPWeakTimer *)self->_loadingTimer invalidate];
  loadingTimer = self->_loadingTimer;
  self->_loadingTimer = 0;

  v6 = [(UITableView *)self->_tableView indexPathsForSelectedRows];
  uint64_t v7 = [v6 firstObject];
  reselectIndexPath = self->_reselectIndexPath;
  self->_reselectIndexPath = v7;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MCDBrowsableContentTableViewController *)self setVisible:0];
  v6.receiver = self;
  v6.super_class = (Class)MCDBrowsableContentTableViewController;
  [(MCDBrowsableContentTableViewController *)&v6 viewDidDisappear:v3];
  BOOL v5 = [(MCDBrowsableContentTableViewController *)self alertController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MCDBrowsableContentTableViewController;
  [(MCDBrowsableContentTableViewController *)&v13 viewDidLayoutSubviews];
  BOOL v3 = [(MCDBrowsableContentTableViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  MCD_tableView = self->_MCD_tableView;
  if (MCD_tableView) {
    -[UIView setFrame:](MCD_tableView, "setFrame:", v5, v7, v9, v11);
  }
}

- (void)_showLoadingScreen
{
  [(MPWeakTimer *)self->_delayTimer invalidate];
  delayTimer = self->_delayTimer;
  self->_delayTimer = 0;

  if ([(MCDBrowsableContentTableViewController *)self isVisible])
  {
    objc_initWeak(&location, self);
    double v4 = (void *)MEMORY[0x263F12358];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __60__MCDBrowsableContentTableViewController__showLoadingScreen__block_invoke;
    v11[3] = &unk_26505BDF0;
    objc_copyWeak(&v12, &location);
    double v5 = [v4 timerWithInterval:0 repeats:v11 block:10.0];
    loadingTimer = self->_loadingTimer;
    self->_loadingTimer = v5;

    double v7 = MCDGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl(&dword_23F140000, v7, OS_LOG_TYPE_DEFAULT, "Showing loading screen", v10, 2u);
    }

    double v8 = [MCDLoadingContentView alloc];
    [(UITableView *)self->_tableView frame];
    double v9 = -[MCDLoadingContentView initWithFrame:](v8, "initWithFrame:");
    [(MCDBrowsableContentTableViewController *)self _replacePlaceholderViewWithView:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __60__MCDBrowsableContentTableViewController__showLoadingScreen__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _showTimeoutScreen];
    id WeakRetained = v2;
  }
}

- (void)_showTimeoutScreen
{
  [(MPWeakTimer *)self->_loadingTimer invalidate];
  loadingTimer = self->_loadingTimer;
  self->_loadingTimer = 0;

  if ([(MCDBrowsableContentTableViewController *)self isVisible])
  {
    double v4 = MCDGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Showing timeout screen", buf, 2u);
    }

    double v5 = NSString;
    double v6 = MCDCarDisplayBundle();
    double v7 = [v6 localizedStringForKey:@"Unable to connect to “%@.”" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
    double v8 = [(MCDBrowsableContentTableViewController *)self container];
    double v9 = [v8 appTitle];
    double v10 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v9);

    double v11 = [[MCDErrorLoadingView alloc] initWithTitle:v10 buttonText:0];
    id v12 = [(MCDBrowsableContentTableViewController *)self view];
    [v12 frame];
    -[MCDErrorLoadingView setFrame:](v11, "setFrame:");

    [(MCDErrorLoadingView *)v11 setDelegate:self];
    [(MCDBrowsableContentTableViewController *)self _replacePlaceholderViewWithView:v11];
  }
}

- (void)_replacePlaceholderViewWithView:(id)a3
{
  id v28 = a3;
  double v4 = [(MCDBrowsableContentTableViewController *)self placeholderView];
  double v5 = [v4 superview];

  if (v5)
  {
    double v6 = [(MCDBrowsableContentTableViewController *)self placeholderView];
    [v6 removeFromSuperview];
  }
  [(MCDBrowsableContentTableViewController *)self setPlaceholderView:v28];
  double v7 = [(MCDBrowsableContentTableViewController *)self placeholderView];
  [(UITableView *)self->_tableView setScrollEnabled:v7 == 0];

  double v8 = [(MCDBrowsableContentTableViewController *)self placeholderView];

  if (v8)
  {
    [(UITableView *)self->_tableView frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [(UITableView *)self->_tableView safeAreaInsets];
    double v18 = v10 + v17;
    double v20 = v12 + v19;
    double v22 = v14 - (v17 + v21);
    double v24 = v16 - (v19 + v23);
    v25 = [(MCDBrowsableContentTableViewController *)self placeholderView];
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

    v26 = [(UITableView *)self->_tableView superview];
    v27 = [(MCDBrowsableContentTableViewController *)self placeholderView];
    [v26 addSubview:v27];
  }
}

- (void)errorViewDidTapButton:(id)a3
{
  container = self->_container;
  double v5 = MCDGeneralLogging();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (container)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "Retrying container reload, showing loading screen", buf, 2u);
    }

    [(MCDBrowsableContentTableViewController *)self reloadWithCompletion:0];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "Retrying full refresh, showing loading screen", v8, 2u);
    }

    double v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"didInvalidate" object:0];
  }
  [(MCDBrowsableContentTableViewController *)self _showLoadingScreen];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MCDBrowsableContentTableViewController;
  [(MCDBrowsableContentTableViewController *)&v9 traitCollectionDidChange:a3];
  double v4 = [(MCDBrowsableContentTableViewController *)self traitCollection];
  BOOL v5 = [v4 userInterfaceIdiom] == 3;

  if (self->_hasCarScreen != v5)
  {
    self->_hasCarScreen = v5;
    BOOL v6 = [(MCDBrowsableContentTableViewController *)self view];
    [v6 layoutIfNeeded];

    double v7 = [(MCDBrowsableContentTableViewController *)self navigationItem];
    [v7 setRightBarButtonItem:0];

    nowPlayingButton = self->_nowPlayingButton;
    self->_nowPlayingButton = 0;

    [(MCDBrowsableContentTableViewController *)self _updateNowPlayingButtonVisibility];
  }
}

- (id)contentScrollView
{
  if (self->_hasCarScreen) {
    id v2 = 0;
  }
  else {
    id v2 = self->_tableView;
  }
  return v2;
}

- (id)preferredFocusEnvironments
{
  v5[1] = *MEMORY[0x263EF8340];
  if (self->_tableView)
  {
    v5[0] = self->_tableView;
    id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)MCDBrowsableContentTableViewController;
    id v2 = [(MCDBrowsableContentTableViewController *)&v4 preferredFocusEnvironments];
  }
  return v2;
}

- (void)_configureCell:(id)a3 forIndexPath:(id)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 row];
  objc_super v9 = [(MCDBrowsableContentTableViewController *)self container];
  double v10 = [v9 cachedItemForIndex:v8];

  [v6 setAccessoryView:0];
  double v11 = [(UITableView *)self->_tableView indexPathForSelectedRow];
  v47 = v11;
  if (v11)
  {
    double v12 = v11;
    if ([v11 compare:v7])
    {
      double v13 = [(MCDBrowsableContentTableViewController *)self selectedIndexPath];
      int v14 = [v12 isEqual:v13];
    }
    else
    {
      int v14 = 1;
    }
  }
  else
  {
    int v14 = 0;
  }
  int64_t v15 = [(MCDPCContainer *)self->_container showCurrentlyPlayingIndex];
  if (![(MCDBrowsableContentTableViewController *)self currentlyPlayingApp])
  {
    int v49 = 0;
    if (!v14) {
      goto LABEL_14;
    }
LABEL_13:
    [v6 setSelected:0];
    goto LABEL_14;
  }
  int v16 = [v10 currentlyPlaying];
  if (v15 == v8) {
    int v17 = v16;
  }
  else {
    int v17 = 0;
  }
  int v49 = v17;
  if (v14) {
    goto LABEL_13;
  }
LABEL_14:
  v50 = v6;
  v48 = v7;
  unsigned int v46 = v14;
  if ([v10 isCloudItem] && objc_msgSend(v10, "isPlayable"))
  {
    double v18 = self;
    uint64_t v19 = [MEMORY[0x263F313D8] accessoryWithCloudIcon];
LABEL_19:
    double v20 = (void *)v19;
    goto LABEL_21;
  }
  double v18 = self;
  if ([v10 isContainer])
  {
    uint64_t v19 = [MEMORY[0x263F313D8] accessoryWithDisclosureIndicator];
    goto LABEL_19;
  }
  double v20 = 0;
LABEL_21:
  double v21 = (void *)MEMORY[0x263F313E0];
  double v22 = [v10 title];
  double v23 = [v10 subtitle];
  double v24 = [v10 artworkImage];
  uint64_t v25 = [v10 isExplicitItem];
  BOOL v26 = [(MCDPCContainer *)v18->_container showPlaybackProgress];
  [v10 playbackProgress];
  BYTE1(v45) = v49;
  LOBYTE(v45) = v26;
  p_isa = (id *)&v18->super.super.super.isa;
  v29 = objc_msgSend(v21, "configurationWithText:detailText:image:showExplicit:accessory:showActivityIndicator:showPlaybackProgress:playbackProgress:currentlyPlaying:", v22, v23, v24, v25, v20, v46, v27, v45);

  v30 = v50;
  [v50 applyConfiguration:v29];
  if (v49)
  {
    v31 = [(MCDBrowsableContentTableViewController *)v18 container];
    v32 = [v31 model];
    v33 = [v32 playableContentPlaybackManager];
    if ([v33 playerState] == 2) {
      uint64_t v34 = 1;
    }
    else {
      uint64_t v34 = 2;
    }

    v35 = [v50 nowPlayingIndicator];
    [v35 setPlaybackState:v34];
  }
  v36 = MCDGeneralLogging();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = v29;
    v38 = [v10 title];
    v39 = [v10 subtitle];
    int v40 = [v10 isExplicitItem];
    if ([v10 isCloudItem]) {
      int v41 = [v10 isPlayable];
    }
    else {
      int v41 = 0;
    }
    int v42 = [p_isa[135] showPlaybackProgress];
    [v10 playbackProgress];
    *(_DWORD *)buf = 138545154;
    v52 = v38;
    __int16 v53 = 2114;
    v54 = v39;
    __int16 v55 = 1026;
    int v56 = v40;
    __int16 v57 = 1026;
    int v58 = v41;
    __int16 v59 = 1026;
    int v60 = v42;
    __int16 v61 = 2050;
    double v62 = v43;
    __int16 v63 = 1026;
    int v64 = v49;
    __int16 v65 = 1026;
    int v66 = [v10 isContainer];
    _os_log_impl(&dword_23F140000, v36, OS_LOG_TYPE_DEFAULT, "Cell displayed: title: %{public}@, subtitle: %{public}@, showExplicit: %{public}d, showCloud: %{public}d, shouldShowPlaybackProgress: %{public}d, playbackProgress: %{public}f, currentlyPlaying: %{public}d, isContainer: %{public}d", buf, 0x3Eu);

    v30 = v50;
    v29 = v37;
  }

  [v30 setNeedsLayout];
  if ([v10 isContainer])
  {
    v44 = [p_isa container];
    [v44 beginLoadingItem:v10 completion:0];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t count = 12;
  if (self->_count < 12) {
    int64_t count = self->_count;
  }
  if (self->_limited) {
    return count;
  }
  else {
    return self->_count;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = (void *)MEMORY[0x263F313D0];
  id v7 = a4;
  uint64_t v8 = [v6 cellForTableView:a3];
  [(MCDBrowsableContentTableViewController *)self _configureCell:v8 forIndexPath:v7];

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[MCDPCContainer cachedItemForIndex:](self->_container, "cachedItemForIndex:", [v7 row]);
  if (([v8 isContainer] & 1) == 0 && !objc_msgSend(v8, "isPlayable"))
  {
    double v13 = v7;
    goto LABEL_14;
  }
  objc_initWeak(&location, self);
  objc_super v9 = (void *)MEMORY[0x263F12358];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v24[3] = &unk_26505BDF0;
  objc_copyWeak(&v25, &location);
  double v10 = [v9 timerWithInterval:0 repeats:v24 block:20.0];
  [(MCDBrowsableContentTableViewController *)self setLoadingTimer:v10];

  [(MCDBrowsableContentTableViewController *)self setSelectedIndexPath:v7];
  double v11 = [(MCDBrowsableContentTableViewController *)self container];
  double v12 = [v11 indexPath];
  double v13 = objc_msgSend(v12, "indexPathByAddingIndex:", objc_msgSend(v7, "row"));

  if ([v8 isPlayable])
  {
    int v14 = MCDGeneralLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F140000, v14, OS_LOG_TYPE_DEFAULT, "Selected playable content, preparing to play back", buf, 2u);
    }

    int64_t v15 = [(MCDBrowsableContentTableViewController *)self container];
    int v16 = [v15 model];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_77;
    v22[3] = &unk_26505BE40;
    v22[4] = self;
    [(MCDBrowsableContentTableViewController *)v16 initiatePlaybackAtIndexPath:v13 completion:v22];
  }
  else
  {
    if (![v8 isContainer])
    {
      int64_t v15 = MCDGeneralLogging();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23F140000, v15, OS_LOG_TYPE_DEFAULT, "Selected neither a container nor a playable cell", buf, 2u);
      }
      goto LABEL_12;
    }
    int v17 = MCDGeneralLogging();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F140000, v17, OS_LOG_TYPE_DEFAULT, "Selected container, preparing to push to container", buf, 2u);
    }

    double v18 = [(MCDBrowsableContentTableViewController *)self container];
    int64_t v15 = objc_msgSend(v18, "containerAtIndex:", objc_msgSend(v13, "indexAtPosition:", objc_msgSend(v13, "length") - 1));

    uint64_t v19 = [[MCDBrowsableContentTableViewController alloc] initWithContainer:v15 tabbedBrowsing:self->_hasTabbedBrowsing];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_80;
    v20[3] = &unk_26505BE18;
    v20[4] = self;
    int v16 = v19;
    double v21 = v16;
    [(MCDBrowsableContentTableViewController *)v16 reloadWithCompletion:v20];
  }
LABEL_12:

  [(MCDBrowsableContentTableViewController *)self performSelector:sel__displayLoadingActivity withObject:0 afterDelay:0.25];
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
LABEL_14:
}

void __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F08320];
    BOOL v3 = MCDCarDisplayBundle();
    objc_super v4 = [v3 localizedStringForKey:@"ERROR_LOADING_ITEM" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
    v10[0] = v4;
    BOOL v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v6 = [v2 errorWithDomain:@"MCDError" code:1 userInfo:v5];

    id v7 = MCDGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_cold_1((uint64_t)v6, v7);
    }

    [WeakRetained _displayErrorAlertController:v6];
    uint64_t v8 = [WeakRetained loadingTimer];
    [v8 invalidate];

    [WeakRetained setLoadingTimer:0];
  }
}

void __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_77(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) loadingTimer];
  [v4 invalidate];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _DWORD v6[2] = __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v6[3] = &unk_26505BE18;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _clearLoadingActivity];
  id v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v3 = [v2 domain];
    int v4 = [v3 isEqualToString:*MEMORY[0x263F111D8]];

    if (v4)
    {
      id v5 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F08320];
      id v6 = MCDCarDisplayBundle();
      id v7 = [v6 localizedStringForKey:@"ERROR_LOADING_ITEM" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
      v15[0] = v7;
      uint64_t v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      id v9 = [v5 errorWithDomain:@"MCDError" code:1 userInfo:v8];

      double v10 = MCDGeneralLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_cold_1(v10);
      }
    }
    else
    {
      double v12 = MCDGeneralLogging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_cold_2((uint64_t *)(a1 + 40), v12);
      }

      id v9 = *(id *)(a1 + 40);
    }
    [*(id *)(a1 + 32) _displayErrorAlertController:v9];
  }
  else
  {
    double v11 = MCDGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v13 = 0;
      _os_log_impl(&dword_23F140000, v11, OS_LOG_TYPE_DEFAULT, "Initiating playback complete, preparing to push to now playing", v13, 2u);
    }

    [*(id *)(a1 + 32) setPushToNowPlaying:1];
    [*(id *)(a1 + 32) _updateNowPlayingButtonVisibility];
  }
}

void __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_80(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_81;
  v2[3] = &unk_26505BE18;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_81(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) loadingTimer];
  [v2 invalidate];

  [*(id *)(a1 + 32) _clearLoadingActivity];
  id v3 = MCDGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_23F140000, v3, OS_LOG_TYPE_DEFAULT, "Container preparation complete, pushing to container", v5, 2u);
  }

  return [*(id *)(a1 + 32) showViewController:*(void *)(a1 + 40) sender:*(void *)(a1 + 32)];
}

- (void)tableView:(id)a3 didFocusRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [v9 indexPathForSelectedRow];
  uint64_t v7 = [v6 compare:v5];

  if (v7)
  {
    uint64_t v8 = [v9 cellForRowAtIndexPath:v6];
    [v8 setSelected:0];
  }
}

- (void)_displayErrorAlertController:(id)a3
{
  id v4 = a3;
  id v5 = [(MCDBrowsableContentTableViewController *)self alertController];

  if (!v5)
  {
    id v6 = (void *)MEMORY[0x263F82418];
    uint64_t v7 = [v4 localizedDescription];
    uint64_t v8 = [v6 alertControllerWithTitle:0 message:v7 preferredStyle:1];
    [(MCDBrowsableContentTableViewController *)self setAlertController:v8];

    id v9 = (void *)MEMORY[0x263F82400];
    double v10 = MCDCarDisplayBundle();
    double v11 = [v10 localizedStringForKey:@"OK" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
    double v12 = [v9 actionWithTitle:v11 style:1 handler:0];

    double v13 = [(MCDBrowsableContentTableViewController *)self alertController];
    [v13 addAction:v12];

    uint64_t v14 = [(MCDBrowsableContentTableViewController *)self alertController];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    void v15[2] = __71__MCDBrowsableContentTableViewController__displayErrorAlertController___block_invoke;
    v15[3] = &unk_26505BE68;
    v15[4] = self;
    [(MCDBrowsableContentTableViewController *)self presentViewController:v14 animated:1 completion:v15];
  }
}

uint64_t __71__MCDBrowsableContentTableViewController__displayErrorAlertController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearLoadingActivity];
  id v2 = *(void **)(a1 + 32);
  return [v2 setAlertController:0];
}

- (void)container:(id)a3 didInvalidateIndicies:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MCDGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 identifier];
    *(_DWORD *)buf = 138543618;
    double v18 = v9;
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl(&dword_23F140000, v8, OS_LOG_TYPE_DEFAULT, "Some content have invalidated, preparing to reload table view: %{public}@, indicies: %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  double v10 = +[MCDMediaRemoteSerialQueueManager sharedInstance];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __74__MCDBrowsableContentTableViewController_container_didInvalidateIndicies___block_invoke;
  v13[3] = &unk_26505BEB8;
  objc_copyWeak(&v16, (id *)buf);
  v13[4] = self;
  id v11 = v7;
  id v14 = v11;
  id v12 = v6;
  id v15 = v12;
  [v10 addOperation:v13 cancelAllOperations:0];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __74__MCDBrowsableContentTableViewController_container_didInvalidateIndicies___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __74__MCDBrowsableContentTableViewController_container_didInvalidateIndicies___block_invoke_2;
  v3[3] = &unk_26505BEB8;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  dispatch_sync(MEMORY[0x263EF83A0], v3);

  objc_destroyWeak(&v6);
}

void __74__MCDBrowsableContentTableViewController_container_didInvalidateIndicies___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 976) indexPathsForVisibleRows];
  id v5 = (void *)[v4 copy];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __74__MCDBrowsableContentTableViewController_container_didInvalidateIndicies___block_invoke_3;
  v10[3] = &unk_26505BE90;
  id v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v3;
  id v13 = WeakRetained;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 40);
  id v7 = WeakRetained;
  id v8 = v3;
  id v9 = v5;
  [v6 enumerateIndexesUsingBlock:v10];
}

void __74__MCDBrowsableContentTableViewController_container_didInvalidateIndicies___block_invoke_3(uint64_t a1, unint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a2 < 0xB || !*(unsigned char *)(*(void *)(a1 + 32) + 1064))
  {
    id v3 = [MEMORY[0x263F088C8] indexPathForRow:a2 inSection:0];
    if ([*(id *)(a1 + 40) containsObject:v3]) {
      [*(id *)(a1 + 48) addObject:v3];
    }
  }
  if ([*(id *)(a1 + 48) count])
  {
    int v4 = [*(id *)(a1 + 56) didFinishInitialLoad];
    id v5 = MCDGeneralLogging();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        id v7 = [*(id *)(a1 + 64) identifier];
        uint64_t v8 = *(void *)(a1 + 72);
        int v12 = 138543618;
        id v13 = v7;
        __int16 v14 = 2114;
        uint64_t v15 = v8;
        _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "Content that has been been invalidated is visible, reloading those index paths in table view: %{public}@, indicies: %{public}@", (uint8_t *)&v12, 0x16u);
      }
      [*(id *)(*(void *)(a1 + 32) + 976) reloadRowsAtIndexPaths:*(void *)(a1 + 48) withRowAnimation:5];
    }
    else
    {
      if (v6)
      {
        double v10 = [*(id *)(a1 + 64) identifier];
        uint64_t v11 = *(void *)(a1 + 72);
        int v12 = 138543618;
        id v13 = v10;
        __int16 v14 = 2114;
        uint64_t v15 = v11;
        _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "Content has been invalidated, but view isn't finished loading yet. Container: %{public}@, indicies: %{public}@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  else
  {
    id v9 = MCDGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_23F140000, v9, OS_LOG_TYPE_DEFAULT, "Content was invalidated, but there are no indexes to reload.", (uint8_t *)&v12, 2u);
    }
  }
}

- (void)containerDidChangeCount:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__MCDBrowsableContentTableViewController_containerDidChangeCount___block_invoke;
  block[3] = &unk_26505BE68;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __66__MCDBrowsableContentTableViewController_containerDidChangeCount___block_invoke(uint64_t a1)
{
  id v2 = MCDGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_23F140000, v2, OS_LOG_TYPE_DEFAULT, "The container changed count, preparing to reload", v11, 2u);
  }

  if (MCDIndexPathIsRootForContainer(*(void **)(*(void *)(a1 + 32) + 1080)))
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 1080) indexPath];
    if ([v3 length] || objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1080), "cachedCount") < 1)
    {
      int v4 = [*(id *)(*(void *)(a1 + 32) + 1080) indexPath];
      uint64_t v5 = [v4 length];

      if (!v5) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    [*(id *)(*(void *)(a1 + 32) + 1032) invalidate];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 1032);
    *(void *)(v6 + 1032) = 0;

    [*(id *)(*(void *)(a1 + 32) + 1024) invalidate];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 1024);
    *(void *)(v8 + 1024) = 0;

    [*(id *)(a1 + 32) _replacePlaceholderViewWithView:0];
  }
LABEL_10:
  *(unsigned char *)(*(void *)(a1 + 32) + 1064) = [*(id *)(a1 + 32) _shouldLimitLists];
  return [*(id *)(a1 + 32) reloadTable];
}

- (void)_displayLoadingActivity
{
  v5[1] = *MEMORY[0x263EF8340];
  tableView = self->_tableView;
  id v3 = [(MCDBrowsableContentTableViewController *)self selectedIndexPath];
  v5[0] = v3;
  int v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  [(UITableView *)tableView reloadRowsAtIndexPaths:v4 withRowAnimation:5];
}

- (void)_clearLoadingActivity
{
  v8[1] = *MEMORY[0x263EF8340];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__displayLoadingActivity object:0];
  tableView = self->_tableView;
  int v4 = [(MCDBrowsableContentTableViewController *)self selectedIndexPath];
  [(UITableView *)tableView deselectRowAtIndexPath:v4 animated:1];

  uint64_t v5 = self->_tableView;
  uint64_t v6 = [(MCDBrowsableContentTableViewController *)self selectedIndexPath];
  v8[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  [(UITableView *)v5 reloadRowsAtIndexPaths:v7 withRowAnimation:5];
}

- (void)_playbackStateChanged:(id)a3
{
  int v4 = [(MCDBrowsableContentTableViewController *)self container];
  uint64_t v5 = [v4 model];
  uint64_t v6 = [v5 playableContentPlaybackManager];
  if ([v6 playerState] == 2) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }

  uint64_t v8 = [(UITableView *)self->_tableView visibleCells];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__MCDBrowsableContentTableViewController__playbackStateChanged___block_invoke;
  v9[3] = &unk_26505BEE0;
  v9[4] = self;
  v9[5] = v7;
  [v8 enumerateObjectsUsingBlock:v9];
}

void __64__MCDBrowsableContentTableViewController__playbackStateChanged___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "indexPathForCell:");
  int v4 = [*(id *)(a1 + 32) container];
  uint64_t v5 = objc_msgSend(v4, "cachedItemForIndex:", objc_msgSend(v3, "row"));

  if ([*(id *)(a1 + 32) currentlyPlayingApp])
  {
    if ([v5 currentlyPlaying])
    {
      uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1080) showCurrentlyPlayingIndex];
      if (v6 == [v3 row])
      {
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = [v9 nowPlayingIndicator];
        [v8 setPlaybackState:v7];
      }
    }
  }
}

- (void)reloadWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  if (MCDIndexPathIsRootForContainer(self->_container))
  {
    uint64_t v5 = (void *)MEMORY[0x263F12358];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __63__MCDBrowsableContentTableViewController_reloadWithCompletion___block_invoke;
    v16[3] = &unk_26505BDF0;
    objc_copyWeak(&v17, &location);
    uint64_t v6 = [v5 timerWithInterval:0 repeats:v16 block:2.0];
    delayTimer = self->_delayTimer;
    self->_delayTimer = v6;

    uint64_t v8 = MCDGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F140000, v8, OS_LOG_TYPE_DEFAULT, "Fetching content for root container", buf, 2u);
    }

    objc_destroyWeak(&v17);
  }
  else
  {
    id v9 = MCDGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = [(MCDPCContainer *)self->_container identifier];
      *(_DWORD *)buf = 138543362;
      id v20 = v10;
      _os_log_impl(&dword_23F140000, v9, OS_LOG_TYPE_DEFAULT, "Fetching content for non-root container: %{public}@", buf, 0xCu);
    }
  }
  container = self->_container;
  if (container)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __63__MCDBrowsableContentTableViewController_reloadWithCompletion___block_invoke_95;
    v13[3] = &unk_26505BF08;
    objc_copyWeak(&v15, &location);
    v13[4] = self;
    id v14 = v4;
    [(MCDPCContainer *)container refreshWithCompletion:v13];

    objc_destroyWeak(&v15);
  }
  else
  {
    int v12 = MCDGeneralLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F140000, v12, OS_LOG_TYPE_DEFAULT, "No container available to refresh.", buf, 2u);
    }

    if (v4) {
      dispatch_async(MEMORY[0x263EF83A0], v4);
    }
  }
  objc_destroyWeak(&location);
}

void __63__MCDBrowsableContentTableViewController_reloadWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _showLoadingScreen];
    id WeakRetained = v2;
  }
}

void __63__MCDBrowsableContentTableViewController_reloadWithCompletion___block_invoke_95(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__MCDBrowsableContentTableViewController_reloadWithCompletion___block_invoke_2;
  block[3] = &unk_26505BF08;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v5);
}

void __63__MCDBrowsableContentTableViewController_reloadWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained[135];
  id v4 = MCDGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 1080) identifier];
    int v20 = 138543362;
    uint64_t v21 = v5;
    _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Refreshing content complete for container: %{public}@", (uint8_t *)&v20, 0xCu);
  }
  if (MCDIndexPathIsRootForContainer(v3))
  {
    uint64_t v6 = [v3 model];
    uint64_t v7 = [v6 bundleID];
    int v8 = MRMediaRemoteApplicationSupportsSectionedBrowsing();

    if (v8)
    {
LABEL_5:
      id v9 = MCDGeneralLogging();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_23F140000, v9, OS_LOG_TYPE_DEFAULT, "Root container has content", (uint8_t *)&v20, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 1032) invalidate];
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void **)(v10 + 1032);
      *(void *)(v10 + 1032) = 0;

      [*(id *)(*(void *)(a1 + 32) + 1024) invalidate];
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(void **)(v12 + 1024);
      *(void *)(v12 + 1024) = 0;

      [*(id *)(a1 + 32) _replacePlaceholderViewWithView:0];
      goto LABEL_13;
    }
    id v14 = [v3 indexPath];
    if ([v14 length])
    {
    }
    else
    {
      uint64_t v19 = [v3 cachedCount];

      if (v19 >= 1) {
        goto LABEL_5;
      }
    }
    id v15 = MCDGeneralLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_23F140000, v15, OS_LOG_TYPE_DEFAULT, "Root container does not have content", (uint8_t *)&v20, 2u);
    }
  }
LABEL_13:
  *(unsigned char *)(*(void *)(a1 + 32) + 1064) = [*(id *)(a1 + 32) _shouldLimitLists];
  [*(id *)(a1 + 32) reloadTable];
  uint64_t v16 = MCDGeneralLogging();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [*(id *)(*(void *)(a1 + 32) + 1080) identifier];
    int v20 = 138543362;
    uint64_t v21 = v17;
    _os_log_impl(&dword_23F140000, v16, OS_LOG_TYPE_DEFAULT, "Completed refresh for container %{public}@", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(void))(v18 + 16))();
  }
}

- (void)reloadTable
{
  self->_int64_t count = [(MCDPCContainer *)self->_container cachedCount];
  tableView = self->_tableView;
  [(UITableView *)tableView reloadData];
}

- (void)_updateNowPlayingButtonVisibility
{
  id v3 = [(MCDPCContainer *)self->_container model];
  id v4 = [v3 playableContentPlaybackManager];
  uint64_t v5 = [v4 currentPlayingSong];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = [(MCDPCContainer *)self->_container model];
    uint64_t v8 = [v7 isCurrentPlayingApp];

    [(MCDBrowsableContentTableViewController *)self setCurrentlyPlayingApp:v8];
    [(MCDBrowsableContentTableViewController *)self reloadTable];
    if (v8 && self->_hasCarScreen)
    {
      if (!self->_nowPlayingButton)
      {
        id v9 = [(MCDPCContainer *)self->_container model];
        uint64_t v10 = [v9 bundleID];
        MCDGetNowPlayingButton(v10, self, (uint64_t)sel__nowPlayingButtonTapped_);
        uint64_t v11 = (CPUINowPlayingButton *)objc_claimAutoreleasedReturnValue();
        nowPlayingButton = self->_nowPlayingButton;
        self->_nowPlayingButton = v11;

        id v13 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:self->_nowPlayingButton];
        id v14 = [(MCDBrowsableContentTableViewController *)self navigationItem];
        [v14 setRightBarButtonItem:v13];
      }
      if (self->_hasNoBrowsableContent && !self->_didPushToNowPlayingAtLaunch)
      {
        [(MCDBrowsableContentTableViewController *)self _pushToNowPlaying:1];
        self->_didPushToNowPlayingAtLaunch = 1;
      }
      else if ([(MCDBrowsableContentTableViewController *)self pushToNowPlaying])
      {
        [(MCDBrowsableContentTableViewController *)self _pushToNowPlaying:1];
        [(MCDBrowsableContentTableViewController *)self setPushToNowPlaying:0];
      }
      return;
    }
  }
  else
  {

    [(MCDBrowsableContentTableViewController *)self setCurrentlyPlayingApp:0];
    [(MCDBrowsableContentTableViewController *)self reloadTable];
  }
  id v15 = self->_nowPlayingButton;
  self->_nowPlayingButton = 0;

  id v16 = [(MCDBrowsableContentTableViewController *)self navigationItem];
  [v16 setRightBarButtonItem:0];
}

- (void)_nowPlayingButtonTapped:(id)a3
{
  id v4 = MCDGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Now Playing button tapped in table view, pushing to Now Playing", v5, 2u);
  }

  [(MCDBrowsableContentTableViewController *)self _pushToNowPlaying:1];
}

- (void)_pushToNowPlaying:(BOOL)a3
{
  id v4 = [MCDNowPlayingViewController alloc];
  uint64_t v5 = [(MCDPCContainer *)self->_container model];
  uint64_t v6 = [v5 bundleID];
  uint64_t v7 = [(MCDPCContainer *)self->_container model];
  uint64_t v8 = [v7 appTitle];
  id v9 = [(MCDNowPlayingViewController *)v4 initWithPlayableBundleID:v6 appName:v8];

  [(MCDNowPlayingViewController *)v9 setShowNavigationBar:self->_isRootTableViewController];
  uint64_t v10 = MCDGeneralLogging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F140000, v10, OS_LOG_TYPE_DEFAULT, "Pushing to Now Playing view", buf, 2u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__MCDBrowsableContentTableViewController__pushToNowPlaying___block_invoke;
  v12[3] = &unk_26505BE18;
  v12[4] = self;
  id v13 = v9;
  uint64_t v11 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

uint64_t __60__MCDBrowsableContentTableViewController__pushToNowPlaying___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showViewController:sender:", *(void *)(a1 + 40));
}

- (void)_appRegisteredForContent:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = +[MCDMediaRemoteSerialQueueManager sharedInstance];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __67__MCDBrowsableContentTableViewController__appRegisteredForContent___block_invoke;
  uint64_t v10 = &unk_26505BDF0;
  objc_copyWeak(&v11, &location);
  [v5 addOperation:&v7 cancelAllOperations:1];

  uint64_t v6 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v7, v8, v9, v10);
  [v6 removeObserver:self name:@"appReadyToFetch" object:0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __67__MCDBrowsableContentTableViewController__appRegisteredForContent___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__MCDBrowsableContentTableViewController__appRegisteredForContent___block_invoke_2;
  block[3] = &unk_26505BDF0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_sync(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __67__MCDBrowsableContentTableViewController__appRegisteredForContent___block_invoke_2(uint64_t a1)
{
  id v2 = MCDGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F140000, v2, OS_LOG_TYPE_DEFAULT, "Loading content in table controller for the first time since app registered", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __67__MCDBrowsableContentTableViewController__appRegisteredForContent___block_invoke_100;
  v5[3] = &unk_26505BE68;
  id v6 = WeakRetained;
  id v4 = WeakRetained;
  [v4 reloadWithCompletion:v5];
}

uint64_t __67__MCDBrowsableContentTableViewController__appRegisteredForContent___block_invoke_100(uint64_t a1)
{
  [*(id *)(a1 + 32) setDidFinishInitialLoad:1];
  [*(id *)(a1 + 32) setDidFinishInitialViewAppear:1];
  id v2 = *(void **)(a1 + 32);
  return [v2 _updateNowPlayingButtonVisibility];
}

- (void)_clearTableViewSelectionAnimated:(BOOL)a3
{
}

- (BOOL)_shouldLimitLists
{
  id v2 = [(CARSessionStatus *)self->_carSessionStatus currentSession];
  id v3 = [v2 limitUserInterfaces];
  if ([v3 BOOLValue])
  {
    id v4 = [v2 configuration];
    unint64_t v5 = ((unint64_t)[v4 limitableUserInterfaces] >> 3) & 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_limitedUIChanged:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__MCDBrowsableContentTableViewController__limitedUIChanged___block_invoke;
  block[3] = &unk_26505BE68;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__MCDBrowsableContentTableViewController__limitedUIChanged___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _shouldLimitLists];
  if (*(unsigned __int8 *)(*(void *)(a1 + 32) + 1064) != v2)
  {
    uint64_t v3 = v2;
    id v4 = MCDGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1064)];
      id v6 = [NSNumber numberWithBool:v3];
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v5;
      __int16 v20 = 2114;
      uint64_t v21 = v6;
      _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Limited UI changed from %{public}@ to %{public}@", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 1064) = v3;
    char v7 = [*(id *)(a1 + 32) isVisible];
    uint64_t v8 = *(id **)(a1 + 32);
    if (v7)
    {
      id v9 = [v8[122] superview];
      uint64_t v10 = [v9 snapshotViewAfterScreenUpdates:1];

      id v11 = [*(id *)(*(void *)(a1 + 32) + 976) superview];
      [v11 addSubview:v10];

      [*(id *)(a1 + 32) reloadTable];
      if (v10)
      {
        uint64_t v12 = (void *)MEMORY[0x263F82E00];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __60__MCDBrowsableContentTableViewController__limitedUIChanged___block_invoke_103;
        v16[3] = &unk_26505BE68;
        id v17 = v10;
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __60__MCDBrowsableContentTableViewController__limitedUIChanged___block_invoke_2;
        v14[3] = &unk_26505BF30;
        id v15 = v17;
        id v13 = v17;
        [v12 animateWithDuration:v16 animations:v14 completion:0.4];
      }
    }
    else
    {
      [v8 reloadTable];
    }
  }
}

uint64_t __60__MCDBrowsableContentTableViewController__limitedUIChanged___block_invoke_103(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __60__MCDBrowsableContentTableViewController__limitedUIChanged___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (MCDPCContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
}

- (BOOL)currentlyPlayingApp
{
  return self->_currentlyPlayingApp;
}

- (void)setCurrentlyPlayingApp:(BOOL)a3
{
  self->_currentlyPlayingApp = a3;
}

- (MPWeakTimer)loadingTimer
{
  return self->_loadingTimer;
}

- (void)setLoadingTimer:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (BOOL)pushToNowPlaying
{
  return self->_pushToNowPlaying;
}

- (void)setPushToNowPlaying:(BOOL)a3
{
  self->_pushToNowPlaying = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_MCD_tableView, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_loadingTimer, 0);
  objc_storeStrong((id *)&self->_reselectIndexPath, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectedNextIndexPath, 0);
  objc_storeStrong((id *)&self->_nowPlayingButton, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

void __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F140000, a2, OS_LOG_TYPE_ERROR, "Loading content timed out, displaying error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23F140000, log, OS_LOG_TYPE_ERROR, "Initiating playback failed due to timeout", v1, 2u);
}

void __76__MCDBrowsableContentTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_23F140000, a2, OS_LOG_TYPE_ERROR, "Initiating playback failed, displaying error: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end