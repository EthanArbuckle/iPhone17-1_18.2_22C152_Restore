@interface TVRUIMediaViewController
- (BOOL)_canShowMediaInfo;
- (BOOL)_canShowWhileLocked;
- (BOOL)isRequestingMediaInfo;
- (BOOL)upNextOperationInProgress;
- (NSString)mediaIdentifier;
- (NSString)mediaTitle;
- (TVRCMediaInfo)mediaInfo;
- (TVRUIActionProviding)actionProvider;
- (TVRUIImageFetcher)imageFetcher;
- (TVRUIUpNextProviding)upNextProvider;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIButton)actionButton;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIImage)mediaImage;
- (_TVRUIAvatarGenerator)avatarGenerator;
- (id)_collectionViewLayout;
- (id)actionButtonMenu;
- (id)infosDidChangeNotificationObserver;
- (void)_addToUpNext:(id)a3;
- (void)_configureHierarchy;
- (void)_didBeginUpNextCommand;
- (void)_gotoMediaInfo;
- (void)_markAsWatched:(id)a3;
- (void)_performWebSearch;
- (void)_removeFromUpNext:(id)a3;
- (void)_requestMediaInfoWithID:(id)a3;
- (void)_shareMediaInfo;
- (void)_upNextCommand:(id)a3 didCompleteWithError:(id)a4;
- (void)_updateBarButtonItemFromCurrentState;
- (void)_updateMediaInfo:(id)a3;
- (void)_updateUIFromCurrentState;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)requestImageForTemplate:(id)a3 size:(CGSize)a4 identifier:(id)a5 completion:(id)a6;
- (void)setActionButton:(id)a3;
- (void)setActionProvider:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setAvatarGenerator:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setImageFetcher:(id)a3;
- (void)setInfosDidChangeNotificationObserver:(id)a3;
- (void)setIsRequestingMediaInfo:(BOOL)a3;
- (void)setMediaIdentifier:(id)a3;
- (void)setMediaImage:(id)a3;
- (void)setMediaInfo:(id)a3;
- (void)setMediaTitle:(id)a3;
- (void)setUpNextOperationInProgress:(BOOL)a3;
- (void)setUpNextProvider:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVRUIMediaViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIMediaViewController;
  [(TVRUIMediaViewController *)&v3 viewDidLoad];
  [(TVRUIMediaViewController *)self _configureHierarchy];
  [(TVRUIMediaViewController *)self _updateUIFromCurrentState];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TVRUIMediaViewController;
  [(TVRUIMediaViewController *)&v8 viewDidAppear:a3];
  v4 = [(TVRUIMediaViewController *)self collectionView];
  v5 = [v4 indexPathsForSelectedItems];

  if ([v5 count])
  {
    v6 = [(TVRUIMediaViewController *)self collectionView];
    v7 = [v5 firstObject];
    [v6 deselectItemAtIndexPath:v7 animated:1];
  }
}

- (void)setMediaIdentifier:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_mediaIdentifier, a3);
  if ([v5 length]) {
    [(TVRUIMediaViewController *)self _requestMediaInfoWithID:v5];
  }
}

- (void)setMediaTitle:(id)a3
{
  objc_storeStrong((id *)&self->_mediaTitle, a3);
  id v5 = a3;
  id v6 = [(TVRUIMediaViewController *)self navigationItem];
  [v6 setTitle:v5];
}

- (void)dealloc
{
  objc_super v3 = [(TVRUIMediaViewController *)self infosDidChangeNotificationObserver];

  if (v3)
  {
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    id v5 = [(TVRUIMediaViewController *)self infosDidChangeNotificationObserver];
    [v4 removeObserver:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)TVRUIMediaViewController;
  [(TVRUIMediaViewController *)&v6 dealloc];
}

- (void)setMediaInfo:(id)a3
{
  objc_storeStrong((id *)&self->_mediaInfo, a3);
  [(TVRUIMediaViewController *)self _updateUIFromCurrentState];
}

- (TVRUIImageFetcher)imageFetcher
{
  imageFetcher = self->_imageFetcher;
  if (!imageFetcher)
  {
    v4 = +[TVRUIImageFetcher imageFetcher];
    id v5 = self->_imageFetcher;
    self->_imageFetcher = v4;

    imageFetcher = self->_imageFetcher;
  }
  return imageFetcher;
}

- (_TVRUIAvatarGenerator)avatarGenerator
{
  avatarGenerator = self->_avatarGenerator;
  if (!avatarGenerator)
  {
    v4 = objc_alloc_init(_TVRUIAvatarGenerator);
    id v5 = self->_avatarGenerator;
    self->_avatarGenerator = v4;

    avatarGenerator = self->_avatarGenerator;
  }
  return avatarGenerator;
}

- (void)_configureHierarchy
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  [(TVRUIMediaViewController *)self setOverrideUserInterfaceStyle:2];
  val = self;
  objc_super v3 = [(TVRUIMediaViewController *)self view];
  v4 = [MEMORY[0x263F825C8] colorWithWhite:0.1 alpha:1.0];
  [v3 setBackgroundColor:v4];

  v59 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:101];
  id v5 = [MEMORY[0x263F82538] registrationWithCellClass:objc_opt_class() configurationHandler:&__block_literal_global_1];
  objc_initWeak(&location, val);
  objc_super v6 = (void *)MEMORY[0x263F82538];
  uint64_t v7 = objc_opt_class();
  v78[0] = MEMORY[0x263EF8330];
  v78[1] = 3221225472;
  v78[2] = __47__TVRUIMediaViewController__configureHierarchy__block_invoke_2;
  v78[3] = &unk_264800298;
  objc_copyWeak(&v79, &location);
  objc_super v8 = [v6 registrationWithCellClass:v7 configurationHandler:v78];
  id v9 = objc_alloc(MEMORY[0x263F82528]);
  v10 = [(TVRUIMediaViewController *)val _collectionViewLayout];
  v61 = objc_msgSend(v9, "initWithFrame:collectionViewLayout:", v10, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  [v61 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v61 setClipsToBounds:1];
  [v61 setDelegate:val];
  id v11 = objc_alloc(MEMORY[0x263F82560]);
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = __47__TVRUIMediaViewController__configureHierarchy__block_invoke_3;
  v75[3] = &unk_2648002C0;
  id v45 = v5;
  id v76 = v45;
  id v46 = v8;
  id v77 = v46;
  v58 = (void *)[v11 initWithCollectionView:v61 cellProvider:v75];
  uint64_t v12 = objc_opt_class();
  v13 = +[_TVRUIImageHeaderView elementKind];
  v14 = +[_TVRUIImageHeaderView reuseIdentifier];
  [v61 registerClass:v12 forSupplementaryViewOfKind:v13 withReuseIdentifier:v14];

  v15 = (void *)MEMORY[0x263F825B8];
  uint64_t v16 = objc_opt_class();
  v17 = +[_TVRUIImageHeaderView elementKind];
  v73[0] = MEMORY[0x263EF8330];
  v73[1] = 3221225472;
  v73[2] = __47__TVRUIMediaViewController__configureHierarchy__block_invoke_4;
  v73[3] = &unk_2648002E8;
  objc_copyWeak(&v74, &location);
  v18 = [v15 registrationWithSupplementaryClass:v16 elementKind:v17 configurationHandler:v73];

  uint64_t v19 = objc_opt_class();
  v20 = +[_TVRUILabelHeaderView elementKind];
  v21 = +[_TVRUILabelHeaderView reuseIdentifier];
  [v61 registerClass:v19 forSupplementaryViewOfKind:v20 withReuseIdentifier:v21];

  v22 = (void *)MEMORY[0x263F825B8];
  uint64_t v23 = objc_opt_class();
  v24 = +[_TVRUILabelHeaderView elementKind];
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __47__TVRUIMediaViewController__configureHierarchy__block_invoke_5;
  v71[3] = &unk_264800310;
  objc_copyWeak(&v72, &location);
  v25 = [v22 registrationWithSupplementaryClass:v23 elementKind:v24 configurationHandler:v71];

  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __47__TVRUIMediaViewController__configureHierarchy__block_invoke_6;
  v68[3] = &unk_264800338;
  id v44 = v25;
  id v69 = v44;
  id v43 = v18;
  id v70 = v43;
  [v58 setSupplementaryViewProvider:v68];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v82[0] = v61;
  v82[1] = v59;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:2];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v64 objects:v83 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v65 != v28) {
          objc_enumerationMutation(v26);
        }
        v30 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v3 addSubview:v30];
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v64 objects:v83 count:16];
    }
    while (v27);
  }

  v42 = (void *)MEMORY[0x263F08938];
  v57 = [v59 centerXAnchor];
  v56 = [v3 centerXAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v81[0] = v55;
  v54 = [v59 centerYAnchor];
  v53 = [v3 centerYAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v81[1] = v52;
  v50 = [v61 topAnchor];
  v51 = [v3 safeAreaLayoutGuide];
  v49 = [v51 topAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v81[2] = v48;
  v47 = [v61 leadingAnchor];
  v31 = [v3 leadingAnchor];
  v32 = [v47 constraintEqualToAnchor:v31];
  v81[3] = v32;
  v33 = [v61 trailingAnchor];
  v34 = [v3 trailingAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  v81[4] = v35;
  v36 = [v61 bottomAnchor];
  v37 = [v3 bottomAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  v81[5] = v38;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:6];
  [v42 activateConstraints:v39];

  [(TVRUIMediaViewController *)val setActivityIndicatorView:v59];
  [(TVRUIMediaViewController *)val setCollectionView:v61];
  [(TVRUIMediaViewController *)val setDataSource:v58];
  v40 = [MEMORY[0x263F08A00] defaultCenter];
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __47__TVRUIMediaViewController__configureHierarchy__block_invoke_7;
  v62[3] = &unk_264800360;
  objc_copyWeak(&v63, &location);
  v41 = [v40 addObserverForName:@"TVRUIUpNextInfosDidChangeNotification" object:0 queue:0 usingBlock:v62];
  [(TVRUIMediaViewController *)val setInfosDidChangeNotificationObserver:v41];

  objc_destroyWeak(&v63);
  objc_destroyWeak(&v72);

  objc_destroyWeak(&v74);
  objc_destroyWeak(&v79);
  objc_destroyWeak(&location);
}

void __47__TVRUIMediaViewController__configureHierarchy__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  objc_msgSend(v6, "setIsExpanded:", objc_msgSend(v5, "isExpanded"));
  id v7 = [v5 factoidItem];

  [v6 setItem:v7];
}

void __47__TVRUIMediaViewController__configureHierarchy__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [v10 setImageProvider:WeakRetained];
    objc_super v8 = [WeakRetained avatarGenerator];
    [v10 setAvatarGenerator:v8];
  }
  id v9 = [v6 role];
  [v10 setRole:v9];
}

id __47__TVRUIMediaViewController__configureHierarchy__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  int v10 = [v7 isFactoid];
  uint64_t v11 = 40;
  if (v10) {
    uint64_t v11 = 32;
  }
  uint64_t v12 = [v9 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + v11) forIndexPath:v8 item:v7];

  return v12;
}

void __47__TVRUIMediaViewController__configureHierarchy__block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained mediaImage];
    [v6 setImage:v5];
  }
}

void __47__TVRUIMediaViewController__configureHierarchy__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v9 = [WeakRetained dataSource];
  id v13 = [v9 itemIdentifierForIndexPath:v6];

  int v10 = [v13 role];
  uint64_t v11 = [v10 roleDescription];
  uint64_t v12 = [v7 titleLabel];

  [v12 setText:v11];
}

id __47__TVRUIMediaViewController__configureHierarchy__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  int v10 = +[_TVRUILabelHeaderView elementKind];
  int v11 = [v8 isEqualToString:v10];

  uint64_t v12 = 40;
  if (v11) {
    uint64_t v12 = 32;
  }
  id v13 = [v9 dequeueConfiguredReusableSupplementaryViewWithRegistration:*(void *)(a1 + v12) forIndexPath:v7];

  return v13;
}

void __47__TVRUIMediaViewController__configureHierarchy__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setUpNextOperationInProgress:0];
    [v2 _updateBarButtonItemFromCurrentState];
    id WeakRetained = v2;
  }
}

- (id)actionButtonMenu
{
  v63[2] = *MEMORY[0x263EF8340];
  id v43 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.up.right.square"];
  v41 = [MEMORY[0x263F827E8] systemImageNamed:@"square.and.arrow.up"];
  v39 = [MEMORY[0x263F827E8] systemImageNamed:@"magnifyingglass"];
  id v44 = [(TVRUIMediaViewController *)self mediaInfo];
  uint64_t v3 = [v44 kind];
  switch(v3)
  {
    case 5:
      id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v42 = [v6 localizedStringForKey:@"TVRUIGotoSportingEvent" value:&stru_26DB4CAE0 table:@"Localizable"];

      id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v40 = [v5 localizedStringForKey:@"TVRUIShareSportingEvent" value:&stru_26DB4CAE0 table:@"Localizable"];
      goto LABEL_7;
    case 3:
      id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v42 = [v7 localizedStringForKey:@"TVRUIGotoShow" value:&stru_26DB4CAE0 table:@"Localizable"];

      id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v40 = [v5 localizedStringForKey:@"TVRUIShareShow" value:&stru_26DB4CAE0 table:@"Localizable"];
      goto LABEL_7;
    case 2:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v42 = [v4 localizedStringForKey:@"TVRUIGotoMovie" value:&stru_26DB4CAE0 table:@"Localizable"];

      id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v40 = [v5 localizedStringForKey:@"TVRUIShareMovie" value:&stru_26DB4CAE0 table:@"Localizable"];
LABEL_7:

      goto LABEL_9;
  }
  v42 = &stru_26DB4CAE0;
  v40 = &stru_26DB4CAE0;
LABEL_9:
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v38 = [v8 localizedStringForKey:@"TVRUISearchPerson" value:&stru_26DB4CAE0 table:@"Localizable"];

  objc_initWeak(&location, self);
  id v9 = (void *)MEMORY[0x263F823D0];
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __44__TVRUIMediaViewController_actionButtonMenu__block_invoke;
  v58[3] = &unk_264800190;
  objc_copyWeak(&v59, &location);
  v37 = [v9 actionWithTitle:v42 image:v43 identifier:0 handler:v58];
  int v10 = (void *)MEMORY[0x263F823D0];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __44__TVRUIMediaViewController_actionButtonMenu__block_invoke_2;
  v56[3] = &unk_264800190;
  objc_copyWeak(&v57, &location);
  v36 = [v10 actionWithTitle:v40 image:v41 identifier:0 handler:v56];
  int v11 = (void *)MEMORY[0x263F823D0];
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __44__TVRUIMediaViewController_actionButtonMenu__block_invoke_3;
  v54[3] = &unk_264800190;
  objc_copyWeak(&v55, &location);
  v35 = [v11 actionWithTitle:v38 image:v39 identifier:0 handler:v54];
  uint64_t v12 = [(TVRUIMediaViewController *)self upNextProvider];
  int v13 = [v12 isItemInUpNextForMediaInfo:v44];

  v14 = (void *)MEMORY[0x263F823D0];
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (v13)
  {
    v34 = [v15 localizedStringForKey:@"RemoveFromUpNext" value:&stru_26DB4CAE0 table:@"Localizable"];
    uint64_t v16 = [MEMORY[0x263F827E8] systemImageNamed:@"minus.circle"];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __44__TVRUIMediaViewController_actionButtonMenu__block_invoke_4;
    v51[3] = &unk_264800388;
    v17 = &v53;
    objc_copyWeak(&v53, &location);
    id v18 = v44;
    id v52 = v18;
    uint64_t v19 = [v14 actionWithTitle:v34 image:v16 identifier:0 handler:v51];
    v63[0] = v19;
    v20 = (void *)MEMORY[0x263F823D0];
    v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"MarkAsWatched" value:&stru_26DB4CAE0 table:@"Localizable"];
    uint64_t v23 = [MEMORY[0x263F827E8] systemImageNamed:@"rectangle.badge.checkmark"];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __44__TVRUIMediaViewController_actionButtonMenu__block_invoke_5;
    v48[3] = &unk_264800388;
    objc_copyWeak(&v50, &location);
    id v49 = v18;
    v24 = [v20 actionWithTitle:v22 image:v23 identifier:0 handler:v48];
    v63[1] = v24;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:2];

    objc_destroyWeak(&v50);
    v26 = &v52;
  }
  else
  {
    uint64_t v27 = [v15 localizedStringForKey:@"TVRUIAddToUpNext" value:&stru_26DB4CAE0 table:@"Localizable"];
    uint64_t v28 = [MEMORY[0x263F827E8] systemImageNamed:@"plus.circle"];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __44__TVRUIMediaViewController_actionButtonMenu__block_invoke_6;
    v45[3] = &unk_264800388;
    v17 = &v47;
    objc_copyWeak(&v47, &location);
    id v46 = v44;
    v29 = [v14 actionWithTitle:v27 image:v28 identifier:0 handler:v45];
    v62 = v29;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];

    v26 = &v46;
  }

  objc_destroyWeak(v17);
  v30 = [MEMORY[0x263F82940] menuWithTitle:&stru_26DB4CAE0 image:0 identifier:0 options:1 children:v25];

  v61[0] = v37;
  v61[1] = v36;
  v61[2] = v35;
  v61[3] = v30;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:4];
  v32 = [MEMORY[0x263F82940] menuWithChildren:v31];

  objc_destroyWeak(&v55);
  objc_destroyWeak(&v57);

  objc_destroyWeak(&v59);
  objc_destroyWeak(&location);

  return v32;
}

void __44__TVRUIMediaViewController_actionButtonMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _gotoMediaInfo];
}

void __44__TVRUIMediaViewController_actionButtonMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _shareMediaInfo];
}

void __44__TVRUIMediaViewController_actionButtonMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performWebSearch];
}

void __44__TVRUIMediaViewController_actionButtonMenu__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeFromUpNext:*(void *)(a1 + 32)];
}

void __44__TVRUIMediaViewController_actionButtonMenu__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _markAsWatched:*(void *)(a1 + 32)];
}

void __44__TVRUIMediaViewController_actionButtonMenu__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _addToUpNext:*(void *)(a1 + 32)];
}

- (id)_collectionViewLayout
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F82540]) initWithSectionProvider:&__block_literal_global_85];
  id v3 = objc_alloc_init(MEMORY[0x263F82548]);
  [v3 setInterSectionSpacing:20.0];
  [v2 setConfiguration:v3];

  return v2;
}

id __49__TVRUIMediaViewController__collectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v46[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (a2)
  {
    +[_TVRUIRoleCell preferredHeight];
    double v6 = v5;
    id v7 = (void *)MEMORY[0x263F82338];
    id v8 = [MEMORY[0x263F822F0] fractionalWidthDimension:1.0];
    id v9 = [MEMORY[0x263F822F0] absoluteDimension:v6];
    int v10 = [v7 sizeWithWidthDimension:v8 heightDimension:v9];

    int v11 = [MEMORY[0x263F82310] itemWithLayoutSize:v10];
    uint64_t v12 = (void *)MEMORY[0x263F82300];
    id v44 = v11;
    int v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
    v14 = [v12 verticalGroupWithLayoutSize:v10 subitems:v13];

    v15 = [MEMORY[0x263F82320] sectionWithGroup:v14];
    [v15 setInterGroupSpacing:10.0];
    objc_msgSend(v15, "setContentInsets:", 10.0, 20.0, 0.0, 20.0);
    uint64_t v16 = (void *)MEMORY[0x263F82338];
    v17 = [MEMORY[0x263F822F0] fractionalWidthDimension:1.0];
    id v18 = [MEMORY[0x263F822F0] estimatedDimension:44.0];
    uint64_t v19 = [v16 sizeWithWidthDimension:v17 heightDimension:v18];

    v20 = (void *)MEMORY[0x263F822D8];
    v21 = +[_TVRUILabelHeaderView elementKind];
    v22 = objc_msgSend(MEMORY[0x263F822D0], "layoutAnchorWithEdges:fractionalOffset:", 1, 0.0, -1.0);
    uint64_t v23 = [v20 supplementaryItemWithLayoutSize:v19 elementKind:v21 containerAnchor:v22];

    [v23 setExtendsBoundary:1];
    id v43 = v23;
    v24 = (void *)MEMORY[0x263EFF8C0];
    v25 = &v43;
  }
  else
  {
    v26 = (void *)MEMORY[0x263F82338];
    uint64_t v27 = [MEMORY[0x263F822F0] fractionalWidthDimension:1.0];
    uint64_t v28 = (void *)MEMORY[0x263F822F0];
    +[_TVRUIFactoidCell preferredHeight];
    v29 = objc_msgSend(v28, "estimatedDimension:");
    int v10 = [v26 sizeWithWidthDimension:v27 heightDimension:v29];

    int v11 = [MEMORY[0x263F82310] itemWithLayoutSize:v10];
    v30 = (void *)MEMORY[0x263F82300];
    v46[0] = v11;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:1];
    v14 = [v30 verticalGroupWithLayoutSize:v10 subitems:v31];

    v15 = [MEMORY[0x263F82320] sectionWithGroup:v14];
    v32 = [v4 container];
    [v32 contentSize];
    +[_TVRUIImageHeaderView computedHeightForWidth:](_TVRUIImageHeaderView, "computedHeightForWidth:");
    double v34 = v33;

    v35 = (void *)MEMORY[0x263F82338];
    v36 = [MEMORY[0x263F822F0] fractionalWidthDimension:1.0];
    v37 = [MEMORY[0x263F822F0] absoluteDimension:v34];
    uint64_t v19 = [v35 sizeWithWidthDimension:v36 heightDimension:v37];

    v38 = (void *)MEMORY[0x263F822D8];
    v39 = +[_TVRUIImageHeaderView elementKind];
    v40 = objc_msgSend(MEMORY[0x263F822D0], "layoutAnchorWithEdges:fractionalOffset:", 1, 0.0, -1.0);
    uint64_t v23 = [v38 supplementaryItemWithLayoutSize:v19 elementKind:v39 containerAnchor:v40];

    [v23 setExtendsBoundary:1];
    id v45 = v23;
    v24 = (void *)MEMORY[0x263EFF8C0];
    v25 = &v45;
  }
  v41 = [v24 arrayWithObjects:v25 count:1];
  [v15 setBoundarySupplementaryItems:v41];

  return v15;
}

- (void)_updateBarButtonItemFromCurrentState
{
  if ([(TVRUIMediaViewController *)self upNextOperationInProgress])
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [v3 startAnimating];
    id v14 = (id)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v3];
  }
  else
  {
    id v4 = (void *)MEMORY[0x263F82818];
    double v5 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83580] variant:1024];
    id v3 = [v4 configurationWithFont:v5];

    double v6 = (void *)MEMORY[0x263F823D0];
    id v7 = [MEMORY[0x263F827E8] systemImageNamed:@"ellipsis.circle" withConfiguration:v3];
    id v8 = [v6 actionWithTitle:&stru_26DB4CAE0 image:v7 identifier:0 handler:&__block_literal_global_101];

    id v9 = [MEMORY[0x263F824F0] plainButtonConfiguration];
    int v10 = [MEMORY[0x263F824E8] buttonWithConfiguration:v9 primaryAction:v8];
    int v11 = [MEMORY[0x263F825C8] whiteColor];
    [v10 setTintColor:v11];

    [v10 setOverrideUserInterfaceStyle:2];
    uint64_t v12 = [(TVRUIMediaViewController *)self actionButtonMenu];
    [v10 setMenu:v12];

    [v10 setShowsMenuAsPrimaryAction:1];
    [(TVRUIMediaViewController *)self setActionButton:v10];
    id v14 = (id)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v10];
  }
  int v13 = [(TVRUIMediaViewController *)self navigationItem];
  [v13 setRightBarButtonItem:v14];
}

- (void)_requestMediaInfoWithID:(id)a3
{
  id v4 = a3;
  if (![(TVRUIMediaViewController *)self isRequestingMediaInfo])
  {
    [(TVRUIMediaViewController *)self setIsRequestingMediaInfo:1];
    objc_initWeak(&location, self);
    id v5 = objc_alloc_init(MEMORY[0x263F7CA00]);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__TVRUIMediaViewController__requestMediaInfoWithID___block_invoke;
    v6[3] = &unk_2648003F0;
    objc_copyWeak(&v7, &location);
    [v5 requestForCanonicalID:v4 includeRoles:1 completion:v6];
    objc_destroyWeak(&v7);

    objc_destroyWeak(&location);
  }
}

void __52__TVRUIMediaViewController__requestMediaInfoWithID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v6 = WeakRetained;
  if (WeakRetained)
  {
    if (!a3) {
      [WeakRetained _updateMediaInfo:v7];
    }
    [v6 setIsRequestingMediaInfo:0];
  }
}

- (void)_updateMediaInfo:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_mediaInfo, a3);
  if (v5)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v6 = [v5 roles];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v6);
          }
          int v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          int v11 = [v10 imageURLTemplate];
          +[_TVRUIRoleCell preferredImageSize];
          double v13 = v12;
          double v15 = v14;
          uint64_t v16 = [v10 canonicalID];
          -[TVRUIMediaViewController requestImageForTemplate:size:identifier:completion:](self, "requestImageForTemplate:size:identifier:completion:", v11, v16, &__block_literal_global_108, v13, v15);
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v7);
    }

    objc_initWeak(&location, self);
    v17 = [(TVRUIMediaViewController *)self imageFetcher];
    id v18 = [v5 imageURLTemplate];
    uint64_t v19 = [v5 identifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __45__TVRUIMediaViewController__updateMediaInfo___block_invoke_2;
    v20[3] = &unk_264800418;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v17, "fetchImageWithTemplateString:size:identifier:completion:", v18, v19, v20, 600.0, 338.0);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __45__TVRUIMediaViewController__updateMediaInfo___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setMediaImage:v6];
    [v5 _updateUIFromCurrentState];
  }
}

- (void)_updateUIFromCurrentState
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  [(TVRUIMediaViewController *)self _updateBarButtonItemFromCurrentState];
  id v3 = [(TVRUIMediaViewController *)self mediaInfo];
  BOOL v4 = [(TVRUIMediaViewController *)self _canShowMediaInfo];
  id v5 = [(TVRUIMediaViewController *)self activityIndicatorView];
  [v5 setHidden:v4];

  if (v4)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F82358]);
    [v6 appendSectionsWithIdentifiers:&unk_26DB65B18];
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v8 = objc_msgSend(v3, "tvrui_formattedSummary");
    if ([v8 length])
    {
      id v9 = +[_TVRUIFactoidItem factoidWithText:v8 options:1];
      int v10 = +[_TVRUIMediaItem itemWithFactoidItem:v9];
      [v7 addObject:v10];
    }
    int v11 = objc_msgSend(v3, "extendedDescription", v8);
    uint64_t v12 = [v11 length];

    if (v12)
    {
      double v13 = [v3 extendedDescription];
      double v14 = +[_TVRUIFactoidItem factoidWithText:v13 options:6];
      double v15 = +[_TVRUIMediaItem itemWithFactoidItem:v14];
      [v7 addObject:v15];
    }
    v32 = v7;
    [v6 appendItemsWithIdentifiers:v7];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    double v33 = v3;
    obuint64_t j = [v3 roleCategories];
    uint64_t v16 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v35 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v41 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v20 = [v19 roleDescription];
          id v45 = v20;
          id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
          [v6 appendSectionsWithIdentifiers:v21];

          id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v23 = [v19 roles];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v37;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v37 != v26) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v28 = +[_TVRUIMediaItem itemWithRole:*(void *)(*((void *)&v36 + 1) + 8 * j)];
                [v22 addObject:v28];
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }
            while (v25);
          }

          [v6 appendItemsWithIdentifiers:v22];
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v17);
    }

    v29 = [(TVRUIMediaViewController *)self dataSource];
    [v29 applySnapshot:v6 animatingDifferences:0];

    id v3 = v33;
  }
  else
  {
    v30 = [(TVRUIMediaViewController *)self activityIndicatorView];
    [v30 startAnimating];
  }
}

- (BOOL)_canShowMediaInfo
{
  id v3 = [(TVRUIMediaViewController *)self mediaInfo];

  BOOL v4 = [(TVRUIMediaViewController *)self mediaImage];

  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (void)_shareMediaInfo
{
  id v3 = [(TVRUIMediaViewController *)self mediaInfo];
  id v6 = [v3 productURL];

  if (v6)
  {
    BOOL v4 = [(TVRUIMediaViewController *)self actionProvider];
    BOOL v5 = [(TVRUIMediaViewController *)self view];
    [v4 shareItem:v6 presentingViewController:self sourceView:v5];
  }
}

- (void)_gotoMediaInfo
{
  id v3 = [(TVRUIMediaViewController *)self mediaInfo];
  id v5 = [v3 productURL];

  if (v5)
  {
    BOOL v4 = [(TVRUIMediaViewController *)self actionProvider];
    [v4 openURL:v5];
  }
}

- (void)_performWebSearch
{
  id v3 = [(TVRUIMediaViewController *)self mediaInfo];
  id v5 = [v3 title];

  if ([v5 length])
  {
    BOOL v4 = [(TVRUIMediaViewController *)self actionProvider];
    [v4 webSearch:v5];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_addToUpNext:(id)a3
{
  id v5 = a3;
  id v6 = [v5 identifier];
  if ([v6 length])
  {
    [(TVRUIMediaViewController *)self _didBeginUpNextCommand];
    objc_initWeak(&location, self);
    id v7 = [(TVRUIMediaViewController *)self upNextProvider];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __41__TVRUIMediaViewController__addToUpNext___block_invoke;
    v8[3] = &unk_264800440;
    objc_copyWeak(v9, &location);
    v9[1] = (id)a2;
    [v7 addItemWithMediaIdentifier:v6 completion:v8];

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

void __41__TVRUIMediaViewController__addToUpNext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
  [WeakRetained _upNextCommand:v5 didCompleteWithError:v4];
}

- (void)_removeFromUpNext:(id)a3
{
  id v5 = a3;
  id v6 = [v5 identifier];
  if ([v6 length])
  {
    [(TVRUIMediaViewController *)self _didBeginUpNextCommand];
    objc_initWeak(&location, self);
    id v7 = [(TVRUIMediaViewController *)self upNextProvider];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __46__TVRUIMediaViewController__removeFromUpNext___block_invoke;
    v8[3] = &unk_264800440;
    objc_copyWeak(v9, &location);
    v9[1] = (id)a2;
    [v7 removeItemWithMediaIdentifier:v6 completion:v8];

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

void __46__TVRUIMediaViewController__removeFromUpNext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
  [WeakRetained _upNextCommand:v5 didCompleteWithError:v4];
}

- (void)_markAsWatched:(id)a3
{
  id v5 = a3;
  id v6 = [v5 identifier];
  if ([v6 length])
  {
    [(TVRUIMediaViewController *)self _didBeginUpNextCommand];
    objc_initWeak(&location, self);
    id v7 = [(TVRUIMediaViewController *)self upNextProvider];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __43__TVRUIMediaViewController__markAsWatched___block_invoke;
    v8[3] = &unk_264800440;
    objc_copyWeak(v9, &location);
    v9[1] = (id)a2;
    [v7 markAsWatchedWithMediaIdentifier:v6 completion:v8];

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

void __43__TVRUIMediaViewController__markAsWatched___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
  [WeakRetained _upNextCommand:v5 didCompleteWithError:v4];
}

- (void)_didBeginUpNextCommand
{
  [(TVRUIMediaViewController *)self setUpNextOperationInProgress:1];
  [(TVRUIMediaViewController *)self _updateBarButtonItemFromCurrentState];
}

- (void)_upNextCommand:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[TVRUIMediaViewController _upNextCommand:didCompleteWithError:]((uint64_t)v6, (uint64_t)v7, v8);
    }

    [(TVRUIMediaViewController *)self setUpNextOperationInProgress:0];
    [(TVRUIMediaViewController *)self _updateBarButtonItemFromCurrentState];
  }
}

- (void)requestImageForTemplate:(id)a3 size:(CGSize)a4 identifier:(id)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [(TVRUIMediaViewController *)self imageFetcher];
  objc_msgSend(v14, "fetchImageWithTemplateString:size:identifier:completion:", v13, v12, v11, width, height);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(TVRUIMediaViewController *)self dataSource];
  id v7 = [v6 itemIdentifierForIndexPath:v5];

  if ([v7 isFactoid] && objc_msgSend(v7, "isExpandable"))
  {
    objc_msgSend(v7, "setIsExpanded:", objc_msgSend(v7, "isExpanded") ^ 1);
    uint64_t v8 = [(TVRUIMediaViewController *)self dataSource];
    id v9 = [v8 snapshot];

    v16[0] = v7;
    int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [v9 reconfigureItemsWithIdentifiers:v10];

    id v11 = [(TVRUIMediaViewController *)self dataSource];
    [v11 applySnapshot:v9 animatingDifferences:0];
  }
  else if ([v7 isRole])
  {
    id v12 = [v7 role];
    id v13 = [(TVRUIMediaViewController *)self actionProvider];
    id v14 = [v12 canonicalID];
    double v15 = [v12 actorName];
    [v13 presentPersonWithID:v14 name:v15 presentingViewController:self];
  }
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

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (NSString)mediaTitle
{
  return self->_mediaTitle;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void)setImageFetcher:(id)a3
{
}

- (void)setAvatarGenerator:(id)a3
{
}

- (TVRCMediaInfo)mediaInfo
{
  return self->_mediaInfo;
}

- (UIImage)mediaImage
{
  return self->_mediaImage;
}

- (void)setMediaImage:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (BOOL)isRequestingMediaInfo
{
  return self->_isRequestingMediaInfo;
}

- (void)setIsRequestingMediaInfo:(BOOL)a3
{
  self->_isRequestingMediaInfo = a3;
}

- (BOOL)upNextOperationInProgress
{
  return self->_upNextOperationInProgress;
}

- (void)setUpNextOperationInProgress:(BOOL)a3
{
  self->_upNextOperationInProgress = a3;
}

- (id)infosDidChangeNotificationObserver
{
  return self->_infosDidChangeNotificationObserver;
}

- (void)setInfosDidChangeNotificationObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_infosDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_mediaImage, 0);
  objc_storeStrong((id *)&self->_mediaInfo, 0);
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_imageFetcher, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_mediaTitle, 0);
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);
  objc_destroyWeak((id *)&self->_upNextProvider);
  objc_destroyWeak((id *)&self->_actionProvider);
}

- (void)_upNextCommand:(os_log_t)log didCompleteWithError:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_227326000, log, OS_LOG_TYPE_ERROR, "Error performing %@ %{public}@", (uint8_t *)&v3, 0x16u);
}

@end