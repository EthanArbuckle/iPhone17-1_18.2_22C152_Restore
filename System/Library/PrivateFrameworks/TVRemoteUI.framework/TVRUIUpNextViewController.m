@interface TVRUIUpNextViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_currentTraitsSizeCategoryRequiresStackedLayout;
- (BOOL)isVisibleInParentUI;
- (NSArray)infos;
- (NSDate)didAppearTimestamp;
- (NSObject)infosDidChangeNotificationObserver;
- (NSTimer)refreshTimer;
- (TVREventHaptic)eventHaptic;
- (TVRUIActionProviding)actionProvider;
- (TVRUIUpNextProviding)upNextProvider;
- (UIActivityIndicatorView)activityIndicatorView;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIView)emptyStateView;
- (double)rowHeight;
- (id)_layout;
- (unint64_t)mode;
- (void)_configureHierarchy;
- (void)_refreshAsNeededIfVisible;
- (void)_refreshUIAnimated:(BOOL)a3;
- (void)_updateEmptyStateAndActivityIndicatorForCurrentState;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)markItemAsWatched:(id)a3;
- (void)openURL:(id)a3;
- (void)removeItemFromUpNext:(id)a3;
- (void)requestImageForInfo:(id)a3 completion:(id)a4;
- (void)setActionProvider:(id)a3;
- (void)setDidAppearTimestamp:(id)a3;
- (void)setInfos:(id)a3;
- (void)setInfosDidChangeNotificationObserver:(id)a3;
- (void)setIsVisibleInParentUI:(BOOL)a3;
- (void)setMode:(unint64_t)a3;
- (void)setRefreshTimer:(id)a3;
- (void)setRowHeight:(double)a3;
- (void)setUpNextProvider:(id)a3;
- (void)shareEpisodeForInfo:(id)a3 sourceView:(id)a4;
- (void)sharePrimaryForInfo:(id)a3 sourceView:(id)a4;
- (void)shareShowForInfo:(id)a3 sourceView:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVRUIUpNextViewController

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)TVRUIUpNextViewController;
  [(TVRUIUpNextViewController *)&v13 viewDidLoad];
  [(TVRUIUpNextViewController *)self _configureHierarchy];
  v3 = [(TVRUIUpNextViewController *)self upNextProvider];
  v4 = [v3 infos];
  [(TVRUIUpNextViewController *)self setInfos:v4];

  [(TVRUIUpNextViewController *)self _refreshUIAnimated:0];
  objc_initWeak(&location, self);
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __40__TVRUIUpNextViewController_viewDidLoad__block_invoke;
  v10 = &unk_264800360;
  objc_copyWeak(&v11, &location);
  v6 = [v5 addObserverForName:@"TVRUIUpNextInfosDidChangeNotification" object:0 queue:0 usingBlock:&v7];
  -[TVRUIUpNextViewController setInfosDidChangeNotificationObserver:](self, "setInfosDidChangeNotificationObserver:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __40__TVRUIUpNextViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__TVRUIUpNextViewController_viewDidLoad__block_invoke_2;
    block[3] = &unk_2647FFF70;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __40__TVRUIUpNextViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) upNextProvider];
  v3 = [v2 infos];
  [*(id *)(a1 + 32) setInfos:v3];

  v4 = *(void **)(a1 + 32);
  return [v4 _refreshUIAnimated:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TVRUIUpNextViewController;
  [(TVRUIUpNextViewController *)&v9 viewWillAppear:a3];
  v4 = [MEMORY[0x263EFF910] now];
  [(TVRUIUpNextViewController *)self setDidAppearTimestamp:v4];

  [(TVRUIUpNextViewController *)self _updateEmptyStateAndActivityIndicatorForCurrentState];
  v5 = [(TVRUIUpNextViewController *)self upNextProvider];
  char v6 = [v5 hasFetchedInfos];

  if ((v6 & 1) == 0)
  {
    dispatch_time_t v7 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__TVRUIUpNextViewController_viewWillAppear___block_invoke;
    block[3] = &unk_2647FFF70;
    block[4] = self;
    dispatch_after(v7, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __44__TVRUIUpNextViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateEmptyStateAndActivityIndicatorForCurrentState];
}

- (void)dealloc
{
  v3 = [(TVRUIUpNextViewController *)self infosDidChangeNotificationObserver];

  if (v3)
  {
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    v5 = [(TVRUIUpNextViewController *)self infosDidChangeNotificationObserver];
    [v4 removeObserver:v5];
  }
  char v6 = [(TVRUIUpNextViewController *)self refreshTimer];
  [v6 invalidate];

  v7.receiver = self;
  v7.super_class = (Class)TVRUIUpNextViewController;
  [(TVRUIUpNextViewController *)&v7 dealloc];
}

- (void)_configureHierarchy
{
  uint64_t v155 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F82528]);
  v128 = self;
  v4 = [(TVRUIUpNextViewController *)self _layout];
  v5 = objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  id obj = v5;
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  char v6 = [MEMORY[0x263F825C8] clearColor];
  [v5 setBackgroundColor:v6];

  [v5 setPrefetchingEnabled:0];
  [v5 setDelegate:v128];
  objc_initWeak(&location, v128);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__TVRUIUpNextViewController__configureHierarchy__block_invoke;
  aBlock[3] = &unk_2648007E8;
  objc_copyWeak(&v148, &location);
  objc_super v7 = _Block_copy(aBlock);
  uint64_t v8 = (void *)MEMORY[0x263F82538];
  uint64_t v9 = objc_opt_class();
  v145[0] = MEMORY[0x263EF8330];
  v145[1] = 3221225472;
  v145[2] = __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_2;
  v145[3] = &unk_264800810;
  id v10 = v7;
  id v146 = v10;
  id v11 = [v8 registrationWithCellClass:v9 configurationHandler:v145];
  v12 = (void *)MEMORY[0x263F82538];
  uint64_t v13 = objc_opt_class();
  v143[0] = MEMORY[0x263EF8330];
  v143[1] = 3221225472;
  v143[2] = __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_3;
  v143[3] = &unk_264800810;
  id v76 = v10;
  id v144 = v76;
  v14 = [v12 registrationWithCellClass:v13 configurationHandler:v143];
  v15 = (void *)MEMORY[0x263F82538];
  uint64_t v16 = objc_opt_class();
  v141[0] = MEMORY[0x263EF8330];
  v141[1] = 3221225472;
  v141[2] = __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_4;
  v141[3] = &unk_264800838;
  objc_copyWeak(&v142, &location);
  v17 = [v15 registrationWithCellClass:v16 configurationHandler:v141];
  id v18 = objc_alloc(MEMORY[0x263F82560]);
  v137[0] = MEMORY[0x263EF8330];
  v137[1] = 3221225472;
  v137[2] = __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_5;
  v137[3] = &unk_264800860;
  id v77 = v17;
  id v138 = v77;
  id v75 = v14;
  id v139 = v75;
  id v74 = v11;
  id v140 = v74;
  uint64_t v19 = [v18 initWithCollectionView:obj cellProvider:v137];
  dataSource = v128->_dataSource;
  v128->_dataSource = (UICollectionViewDiffableDataSource *)v19;

  v21 = [(TVRUIUpNextViewController *)v128 view];
  [v21 addSubview:obj];
  v127 = v21;
  v22 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:101];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v22 setHidden:1];
  [v127 addSubview:v22];
  id v120 = v22;
  id v23 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v23 setHidden:1];
  id v124 = v23;
  id v24 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v23 addSubview:v24];
  id v122 = objc_alloc_init(MEMORY[0x263F828E0]);
  uint64_t v25 = *MEMORY[0x263F817D8];
  uint64_t v26 = *MEMORY[0x263F83420];
  v27 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83618] design:*MEMORY[0x263F817D8] variant:1024 maximumContentSizeCategory:*MEMORY[0x263F83420] compatibleWithTraitCollection:0];
  [v122 setFont:v27];

  [v122 setTextAlignment:1];
  if ([MEMORY[0x263F7C9A8] testarossaEnabled])
  {
    v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v28 localizedStringForKey:@"TVRUIUpNextEmptyTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
  }
  else
  {
    v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v28 localizedStringForKey:@"TVRUIUpNextEmptyTitleDeprecated" value:&stru_26DB4CAE0 table:@"Localizable"];
  v29 = };
  [v122 setText:v29];

  v30 = [MEMORY[0x263F825C8] labelColor];
  [v122 setTextColor:v30];

  id v125 = objc_alloc_init(MEMORY[0x263F828E0]);
  v31 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835E8] design:v25 variant:0 maximumContentSizeCategory:v26 compatibleWithTraitCollection:0];
  [v125 setFont:v31];

  [v125 setTextAlignment:1];
  [v125 setNumberOfLines:2];
  v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v33 = [v32 localizedStringForKey:@"TVRUIUpNextEmptySubheading" value:&stru_26DB4CAE0 table:@"Localizable"];
  [v125 setText:v33];

  v34 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v125 setTextColor:v34];

  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  v153[0] = v122;
  v153[1] = v125;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v153 count:2];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v133 objects:v154 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v134;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v134 != v37) {
          objc_enumerationMutation(v35);
        }
        v39 = *(void **)(*((void *)&v133 + 1) + 8 * i);
        [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v39 setAdjustsFontForContentSizeCategory:1];
        [v24 addSubview:v39];
      }
      uint64_t v36 = [v35 countByEnumeratingWithState:&v133 objects:v154 count:16];
    }
    while (v36);
  }

  v73 = (void *)MEMORY[0x263F08938];
  v118 = [v24 centerXAnchor];
  v116 = [v124 centerXAnchor];
  v114 = [v118 constraintEqualToAnchor:v116];
  v152[0] = v114;
  v112 = [v24 centerYAnchor];
  v110 = [v124 centerYAnchor];
  v108 = [v112 constraintEqualToAnchor:v110 constant:-80.0];
  v152[1] = v108;
  v106 = [v24 widthAnchor];
  v104 = [v124 widthAnchor];
  v102 = [v106 constraintEqualToAnchor:v104 constant:-40.0];
  v152[2] = v102;
  v100 = [v122 topAnchor];
  v98 = [v24 topAnchor];
  v96 = [v100 constraintEqualToAnchor:v98];
  v152[3] = v96;
  v94 = [v122 leadingAnchor];
  v92 = [v24 leadingAnchor];
  v90 = [v94 constraintEqualToAnchor:v92];
  v152[4] = v90;
  v88 = [v122 trailingAnchor];
  v86 = [v24 trailingAnchor];
  v84 = [v88 constraintEqualToAnchor:v86];
  v152[5] = v84;
  v82 = [v125 topAnchor];
  v80 = [v122 bottomAnchor];
  v79 = [v82 constraintEqualToAnchor:v80 constant:10.0];
  v152[6] = v79;
  v78 = [v125 leadingAnchor];
  v40 = [v24 leadingAnchor];
  v41 = [v78 constraintEqualToAnchor:v40];
  v152[7] = v41;
  v42 = [v125 trailingAnchor];
  v43 = [v24 trailingAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  v152[8] = v44;
  v45 = [v125 bottomAnchor];
  v46 = [v24 bottomAnchor];
  v47 = [v45 constraintEqualToAnchor:v46];
  v152[9] = v47;
  v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v152 count:10];
  [v73 activateConstraints:v48];

  [v127 addSubview:v124];
  v81 = (void *)MEMORY[0x263F08938];
  v126 = [v120 centerYAnchor];
  v123 = [v127 centerYAnchor];
  v119 = [v126 constraintEqualToAnchor:v123 constant:-80.0];
  v151[0] = v119;
  v117 = [v120 centerXAnchor];
  v115 = [v127 centerXAnchor];
  v113 = [v117 constraintEqualToAnchor:v115];
  v151[1] = v113;
  v111 = [v124 topAnchor];
  v109 = [v127 topAnchor];
  v107 = [v111 constraintEqualToAnchor:v109];
  v151[2] = v107;
  v105 = [v124 leadingAnchor];
  v103 = [v127 leadingAnchor];
  v101 = [v105 constraintEqualToAnchor:v103];
  v151[3] = v101;
  v99 = [v124 trailingAnchor];
  v97 = [v127 trailingAnchor];
  v95 = [v99 constraintEqualToAnchor:v97];
  v151[4] = v95;
  v93 = [v124 bottomAnchor];
  v91 = [v127 bottomAnchor];
  v89 = [v93 constraintEqualToAnchor:v91];
  v151[5] = v89;
  v87 = [obj topAnchor];
  v85 = [v127 topAnchor];
  v83 = [v87 constraintEqualToAnchor:v85];
  v151[6] = v83;
  v49 = [obj bottomAnchor];
  v50 = [v127 bottomAnchor];
  v51 = [v49 constraintEqualToAnchor:v50];
  v151[7] = v51;
  v52 = [obj leadingAnchor];
  v53 = [v127 leadingAnchor];
  v54 = [v52 constraintEqualToAnchor:v53];
  v151[8] = v54;
  v55 = [obj trailingAnchor];
  v56 = [v127 trailingAnchor];
  v57 = [v55 constraintEqualToAnchor:v56];
  v151[9] = v57;
  v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v151 count:10];
  [v81 activateConstraints:v58];

  objc_storeStrong((id *)&v128->_collectionView, obj);
  objc_storeStrong((id *)&v128->_activityIndicatorView, v120);
  objc_storeStrong((id *)&v128->_emptyStateView, v124);
  if ([(TVRUIUpNextViewController *)v128 mode] == 1)
  {
    [(TVRUIUpNextViewController *)v128 setIsVisibleInParentUI:1];
    v59 = [MEMORY[0x263F825C8] blackColor];
    v60 = [(TVRUIUpNextViewController *)v128 view];
    [v60 setBackgroundColor:v59];

    if ([MEMORY[0x263F7C9A8] testarossaEnabled])
    {
      v61 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      [v61 localizedStringForKey:@"TVRemoteUIUpNextTab" value:&stru_26DB4CAE0 table:@"Localizable"];
    }
    else
    {
      v61 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      [v61 localizedStringForKey:@"TVRemoteUIUpNextTabDeprecated" value:&stru_26DB4CAE0 table:@"Localizable"];
    v62 = };
    v63 = [(TVRUIUpNextViewController *)v128 navigationItem];
    [v63 setTitle:v62];

    id v64 = objc_alloc(MEMORY[0x263F824A8]);
    v65 = (void *)MEMORY[0x263F823D0];
    v131[0] = MEMORY[0x263EF8330];
    v131[1] = 3221225472;
    v131[2] = __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_6;
    v131[3] = &unk_264800190;
    objc_copyWeak(&v132, &location);
    v66 = [v65 actionWithHandler:v131];
    v67 = (void *)[v64 initWithBarButtonSystemItem:0 primaryAction:v66];
    v68 = [(TVRUIUpNextViewController *)v128 navigationItem];
    [v68 setRightBarButtonItem:v67];

    objc_destroyWeak(&v132);
  }
  +[_TVRUIUpNextViewControllerCell setIsStackedLayout:[(TVRUIUpNextViewController *)v128 _currentTraitsSizeCategoryRequiresStackedLayout]];
  uint64_t v150 = objc_opt_class();
  v69 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v150 count:1];
  v129[0] = MEMORY[0x263EF8330];
  v129[1] = 3221225472;
  v129[2] = __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_7;
  v129[3] = &unk_2648001B8;
  objc_copyWeak(&v130, &location);
  id v70 = (id)[(TVRUIUpNextViewController *)v128 registerForTraitChanges:v69 withHandler:v129];

  v71 = objc_alloc_init(TVREventHaptic);
  eventHaptic = v128->_eventHaptic;
  v128->_eventHaptic = v71;

  objc_destroyWeak(&v130);
  objc_destroyWeak(&v142);

  objc_destroyWeak(&v148);
  objc_destroyWeak(&location);
}

void __48__TVRUIUpNextViewController__configureHierarchy__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v16 = a3;
  objc_super v7 = (id *)(a1 + 32);
  id v8 = a4;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = [WeakRetained infos];
    uint64_t v13 = [v12 count];

    BOOL v14 = [v16 item] != v13 - 1;
  }
  else
  {
    BOOL v14 = 1;
  }
  [v9 setShowsSeparator:v14];
  id v15 = objc_loadWeakRetained(v7);
  [v9 setDelegate:v15];

  [v9 setUpNextInfo:v8];
}

uint64_t __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [WeakRetained upNextProvider];
  [v4 requestMore];

  [v5 animate];
}

id __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_5(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v8 section] == 1)
  {
    id v10 = [v7 dequeueConfiguredReusableCellWithRegistration:a1[4] forIndexPath:v8 item:v9];
  }
  else
  {
    if (+[_TVRUIUpNextViewControllerCell isStackedLayout])
    {
      uint64_t v11 = a1[5];
    }
    else
    {
      uint64_t v11 = a1[6];
    }
    v12 = [v9 upNextInfo];
    id v10 = [v7 dequeueConfiguredReusableCellWithRegistration:v11 forIndexPath:v8 item:v12];
  }
  return v10;
}

void __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void __48__TVRUIUpNextViewController__configureHierarchy__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    +[_TVRUIUpNextViewControllerCell setIsStackedLayout:](_TVRUIUpNextViewControllerCell, "setIsStackedLayout:", [WeakRetained _currentTraitsSizeCategoryRequiresStackedLayout]);
    v2 = [v5 dataSource];
    id v3 = [v2 snapshot];

    v4 = [v5 dataSource];
    [v4 applySnapshotUsingReloadData:v3];

    id WeakRetained = v5;
  }
}

- (id)_layout
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x263F82540]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__TVRUIUpNextViewController__layout__block_invoke;
  v5[3] = &unk_264800770;
  objc_copyWeak(&v6, &location);
  id v3 = (void *)[v2 initWithSectionProvider:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __36__TVRUIUpNextViewController__layout__block_invoke(uint64_t a1, uint64_t a2)
{
  v20[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained rowHeight];
  if (v4 == 0.0) {
    double v5 = 88.0;
  }
  else {
    double v5 = v4;
  }

  if (a2 == 1) {
    double v5 = 32.0;
  }
  id v6 = (void *)MEMORY[0x263F82338];
  id v7 = [MEMORY[0x263F822F0] fractionalWidthDimension:1.0];
  id v8 = [MEMORY[0x263F822F0] estimatedDimension:v5];
  id v9 = [v6 sizeWithWidthDimension:v7 heightDimension:v8];

  id v10 = [MEMORY[0x263F82310] itemWithLayoutSize:v9];
  uint64_t v11 = (void *)MEMORY[0x263F82338];
  v12 = [MEMORY[0x263F822F0] fractionalWidthDimension:1.0];
  uint64_t v13 = [MEMORY[0x263F822F0] estimatedDimension:v5];
  BOOL v14 = [v11 sizeWithWidthDimension:v12 heightDimension:v13];

  id v15 = (void *)MEMORY[0x263F82300];
  v20[0] = v10;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  v17 = [v15 verticalGroupWithLayoutSize:v14 subitems:v16];

  id v18 = [MEMORY[0x263F82320] sectionWithGroup:v17];
  [v18 setInterGroupSpacing:2.0];

  return v18;
}

- (void)_refreshAsNeededIfVisible
{
  if ([(TVRUIUpNextViewController *)self isVisibleInParentUI])
  {
    id v3 = [(TVRUIUpNextViewController *)self upNextProvider];
    [v3 refreshIfNeeded];
  }
}

- (void)_refreshUIAnimated:(BOOL)a3
{
  BOOL v55 = a3;
  uint64_t v77 = *MEMORY[0x263EF8340];
  [(TVRUIUpNextViewController *)self _updateEmptyStateAndActivityIndicatorForCurrentState];
  double v4 = [(TVRUIUpNextViewController *)self dataSource];
  double v5 = [v4 snapshot];

  uint64_t v54 = [v5 numberOfItems];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v57 = self;
  id v7 = [(TVRUIUpNextViewController *)self infos];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v69 objects:v76 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v70 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = +[_TVRUIUpNextItem itemWithUpNextInfo:*(void *)(*((void *)&v69 + 1) + 8 * i)];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v69 objects:v76 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [v6 array];

  id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v58 = v5;
  if ([v5 indexOfSectionIdentifier:@"itemsSection"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v15 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    id v15 = [v5 itemIdentifiersInSectionWithIdentifier:@"itemsSection"];
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v66 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v65 + 1) + 8 * j);
        v22 = [v21 upNextInfo];
        id v23 = [v22 mediaInfo];
        id v24 = [v23 identifier];
        [v14 setObject:v21 forKeyedSubscript:v24];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v65 objects:v75 count:16];
    }
    while (v18);
  }
  v56 = v16;

  id v59 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v13;
  uint64_t v25 = [obj countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v62;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v62 != v27) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v61 + 1) + 8 * v28);
        v30 = [v29 upNextInfo];
        v31 = [v30 mediaInfo];
        v32 = [v31 identifier];
        v33 = [v14 objectForKeyedSubscript:v32];

        if (v33)
        {
          v34 = [v29 upNextInfo];
          v35 = [v34 timestamp];

          uint64_t v36 = [v33 upNextInfo];
          uint64_t v37 = [v36 timestamp];
          v38 = v37;
          if (v35)
          {
            char v39 = [v37 isEqualToNumber:v35];

            if ((v39 & 1) == 0) {
              goto LABEL_26;
            }
          }
          else
          {

            if (v38) {
LABEL_26:
            }
              [v59 addObject:v29];
          }
        }
        ++v28;
      }
      while (v26 != v28);
      uint64_t v40 = [obj countByEnumeratingWithState:&v61 objects:v74 count:16];
      uint64_t v26 = v40;
    }
    while (v40);
  }

  id v41 = objc_alloc_init(MEMORY[0x263F82358]);
  [v41 appendSectionsWithIdentifiers:&unk_26DB65B60];
  [v41 appendItemsWithIdentifiers:obj];
  v42 = [(TVRUIUpNextViewController *)v57 dataSource];
  v43 = [v42 snapshot];
  char v44 = [v41 isEqual:v43];

  [v41 reconfigureItemsWithIdentifiers:v59];
  uint64_t v45 = [v59 count];
  if ([obj count])
  {
    v46 = [(TVRUIUpNextViewController *)v57 upNextProvider];
    int v47 = [v46 hasMoreInfo];

    if (v47)
    {
      [v41 appendSectionsWithIdentifiers:&unk_26DB65B78];
      v48 = +[_TVRUIUpNextItem moreItem];
      v73 = v48;
      v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v73 count:1];
      [v41 appendItemsWithIdentifiers:v49];
    }
  }
  uint64_t v50 = [v41 numberOfItems];
  if (v45) {
    char v51 = 0;
  }
  else {
    char v51 = v44;
  }
  if ((v51 & 1) == 0)
  {
    BOOL v52 = v54 <= v50 && v55;
    v53 = [(TVRUIUpNextViewController *)v57 dataSource];
    [v53 applySnapshot:v41 animatingDifferences:v52];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_currentTraitsSizeCategoryRequiresStackedLayout
{
  id v2 = [(TVRUIUpNextViewController *)self traitCollection];
  id v3 = [v2 preferredContentSizeCategory];

  LOBYTE(v2) = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x263F83410]) == NSOrderedDescending;
  return (char)v2;
}

- (void)_updateEmptyStateAndActivityIndicatorForCurrentState
{
  id v3 = [(TVRUIUpNextViewController *)self upNextProvider];
  unsigned int v4 = [v3 hasFetchedInfos];

  double v5 = [(TVRUIUpNextViewController *)self upNextProvider];
  id v6 = [v5 infos];
  uint64_t v7 = [v6 count];

  uint64_t v8 = [(TVRUIUpNextViewController *)self didAppearTimestamp];
  [v8 timeIntervalSinceNow];
  double v10 = fabs(v9);

  if (v10 < 1.75) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v4;
  }
  v12 = [(TVRUIUpNextViewController *)self activityIndicatorView];
  uint64_t v13 = v12;
  if (v11) {
    [v12 stopAnimating];
  }
  else {
    [v12 startAnimating];
  }

  if (v7) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v4 ^ 1;
  }
  id v15 = [(TVRUIUpNextViewController *)self activityIndicatorView];
  [v15 setHidden:v11];

  id v16 = [(TVRUIUpNextViewController *)self emptyStateView];
  [v16 setHidden:v14];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__TVRUIUpNextViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  block[3] = &unk_264800638;
  id v8 = v6;
  id v29 = v8;
  id v9 = v7;
  id v30 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
  double v10 = [(TVRUIUpNextViewController *)self dataSource];
  uint64_t v11 = [v10 itemIdentifierForIndexPath:v9];

  v12 = [v11 upNextInfo];
  uint64_t v13 = [v12 mediaInfo];
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = [v13 identifier];
    uint64_t v16 = [v14 kind];
    uint64_t v17 = [v12 actionURL];
    uint64_t v18 = (void *)MEMORY[0x263F7C9D8];
    id v24 = v8;
    if (v17)
    {
      uint64_t v19 = [v12 actionURL];
      v20 = [v18 playItemWithURL:v19];
    }
    else
    {
      v20 = [MEMORY[0x263F7C9D8] playItemWithMediaIdentifier:v15 kind:v16];
    }
    v21 = [(TVRUIUpNextViewController *)self eventHaptic];
    [v21 playSelectionEventHaptic];

    v22 = [(TVRUIUpNextViewController *)self upNextProvider];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __69__TVRUIUpNextViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
    v26[3] = &unk_264800888;
    id v23 = v15;
    id v27 = v23;
    [v22 playItem:v20 completion:v26];

    if ([(TVRUIUpNextViewController *)self mode] == 1) {
      [(TVRUIUpNextViewController *)self dismissViewControllerAnimated:1 completion:0];
    }

    id v8 = v25;
  }
}

uint64_t __69__TVRUIUpNextViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectItemAtIndexPath:*(void *)(a1 + 40) animated:1];
}

void __69__TVRUIUpNextViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _TVRUINowPlayingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __69__TVRUIUpNextViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2_cold_1();
  }
}

- (void)markItemAsWatched:(id)a3
{
  unsigned int v4 = [a3 mediaInfo];
  double v5 = [v4 identifier];

  id v6 = [(TVRUIUpNextViewController *)self upNextProvider];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__TVRUIUpNextViewController_markItemAsWatched___block_invoke;
  v8[3] = &unk_264800888;
  id v9 = v5;
  id v7 = v5;
  [v6 markAsWatchedWithMediaIdentifier:v7 completion:v8];
}

void __47__TVRUIUpNextViewController_markItemAsWatched___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __47__TVRUIUpNextViewController_markItemAsWatched___block_invoke_cold_1();
    }
  }
}

- (void)removeItemFromUpNext:(id)a3
{
  unsigned int v4 = objc_msgSend(a3, "tvruiupnextvc_favoritesIdentifier");
  double v5 = [(TVRUIUpNextViewController *)self upNextProvider];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__TVRUIUpNextViewController_removeItemFromUpNext___block_invoke;
  v7[3] = &unk_264800888;
  id v8 = v4;
  id v6 = v4;
  [v5 removeItemWithMediaIdentifier:v6 completion:v7];
}

void __50__TVRUIUpNextViewController_removeItemFromUpNext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __50__TVRUIUpNextViewController_removeItemFromUpNext___block_invoke_cold_1();
    }
  }
}

- (void)requestImageForInfo:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TVRUIUpNextViewController *)self upNextProvider];
  [v8 fetchImageForUpNextInfo:v7 completion:v6];
}

- (void)shareEpisodeForInfo:(id)a3 sourceView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [TVRUIUpNextActivityItem alloc];
  id v9 = [(TVRUIUpNextViewController *)self upNextProvider];
  uint64_t v11 = [(TVRUIUpNextActivityItem *)v8 initWithUpNextInfo:v7 upNextProvider:v9 shareShow:0];

  double v10 = [(TVRUIUpNextViewController *)self actionProvider];
  [v10 shareItem:v11 presentingViewController:self sourceView:v6];
}

- (void)shareShowForInfo:(id)a3 sourceView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [TVRUIUpNextActivityItem alloc];
  id v9 = [(TVRUIUpNextViewController *)self upNextProvider];
  uint64_t v11 = [(TVRUIUpNextActivityItem *)v8 initWithUpNextInfo:v7 upNextProvider:v9 shareShow:1];

  double v10 = [(TVRUIUpNextViewController *)self actionProvider];
  [v10 shareItem:v11 presentingViewController:self sourceView:v6];
}

- (void)sharePrimaryForInfo:(id)a3 sourceView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [TVRUIUpNextActivityItem alloc];
  id v9 = [(TVRUIUpNextViewController *)self upNextProvider];
  uint64_t v11 = [(TVRUIUpNextActivityItem *)v8 initWithUpNextInfo:v7 upNextProvider:v9 shareShow:0];

  double v10 = [(TVRUIUpNextViewController *)self actionProvider];
  [v10 shareItem:v11 presentingViewController:self sourceView:v6];
}

- (void)openURL:(id)a3
{
  id v4 = a3;
  id v5 = [(TVRUIUpNextViewController *)self actionProvider];
  [v5 openURL:v4];
}

- (TVRUIActionProviding)actionProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionProvider);
  return (TVRUIActionProviding *)WeakRetained;
}

- (void)setActionProvider:(id)a3
{
}

- (TVRUIUpNextProviding)upNextProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_upNextProvider);
  return (TVRUIUpNextProviding *)WeakRetained;
}

- (void)setUpNextProvider:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (BOOL)isVisibleInParentUI
{
  return self->_isVisibleInParentUI;
}

- (void)setIsVisibleInParentUI:(BOOL)a3
{
  self->_isVisibleInParentUI = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (UIView)emptyStateView
{
  return self->_emptyStateView;
}

- (NSArray)infos
{
  return self->_infos;
}

- (void)setInfos:(id)a3
{
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (NSObject)infosDidChangeNotificationObserver
{
  return self->_infosDidChangeNotificationObserver;
}

- (void)setInfosDidChangeNotificationObserver:(id)a3
{
}

- (NSTimer)refreshTimer
{
  return self->_refreshTimer;
}

- (void)setRefreshTimer:(id)a3
{
}

- (NSDate)didAppearTimestamp
{
  return self->_didAppearTimestamp;
}

- (void)setDidAppearTimestamp:(id)a3
{
}

- (TVREventHaptic)eventHaptic
{
  return self->_eventHaptic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventHaptic, 0);
  objc_storeStrong((id *)&self->_didAppearTimestamp, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_infosDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_emptyStateView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_upNextProvider);
  objc_destroyWeak((id *)&self->_actionProvider);
}

void __69__TVRUIUpNextViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227326000, v0, v1, "Error playing %{public}@: %@");
}

void __47__TVRUIUpNextViewController_markItemAsWatched___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227326000, v0, v1, "Error marking %{public}@ as watched: %@");
}

void __50__TVRUIUpNextViewController_removeItemFromUpNext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227326000, v0, v1, "Error removing %{public}@ from watch list: %@");
}

@end