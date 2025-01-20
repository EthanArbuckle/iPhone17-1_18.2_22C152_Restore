@interface TVRUIPersonViewController
- (BOOL)_canShowPerson;
- (BOOL)_canShowWhileLocked;
- (BOOL)isRequestingPerson;
- (BOOL)personImageIsAvatar;
- (NSString)personID;
- (NSString)personName;
- (TVRCFilmography)filmography;
- (TVRCPerson)person;
- (TVRUIActionProviding)actionProvider;
- (TVRUIImageFetcher)imageFetcher;
- (TVRUIUpNextProviding)upNextProvider;
- (UIActivityIndicatorView)activityIndicatorView;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIImage)personImage;
- (id)_collectionViewLayout;
- (id)actionButtonMenu;
- (void)_configureHierarchy;
- (void)_gotoPerson;
- (void)_performPersonSearch;
- (void)_requestPersonWithID:(id)a3;
- (void)_sharePerson;
- (void)_updatePerson:(id)a3 filmography:(id)a4;
- (void)_updatePersonFallbackImageFromCurrentState;
- (void)_updateUIFromCurrentState;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)requestImageForTemplate:(id)a3 size:(CGSize)a4 identifier:(id)a5 completion:(id)a6;
- (void)setActionProvider:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFilmography:(id)a3;
- (void)setImageFetcher:(id)a3;
- (void)setIsRequestingPerson:(BOOL)a3;
- (void)setPerson:(id)a3;
- (void)setPersonID:(id)a3;
- (void)setPersonImage:(id)a3;
- (void)setPersonImageIsAvatar:(BOOL)a3;
- (void)setPersonName:(id)a3;
- (void)setUpNextProvider:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVRUIPersonViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIPersonViewController;
  [(TVRUIPersonViewController *)&v3 viewDidLoad];
  [(TVRUIPersonViewController *)self _configureHierarchy];
  [(TVRUIPersonViewController *)self _updateUIFromCurrentState];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TVRUIPersonViewController;
  [(TVRUIPersonViewController *)&v8 viewDidAppear:a3];
  v4 = [(TVRUIPersonViewController *)self collectionView];
  v5 = [v4 indexPathsForSelectedItems];

  if ([v5 count])
  {
    v6 = [(TVRUIPersonViewController *)self collectionView];
    v7 = [v5 firstObject];
    [v6 deselectItemAtIndexPath:v7 animated:1];
  }
}

- (void)setPersonID:(id)a3
{
  id v6 = a3;
  char v5 = [v6 isEqualToString:self->_personID];
  objc_storeStrong((id *)&self->_personID, a3);
  if ((v5 & 1) == 0 && ![(TVRUIPersonViewController *)self isRequestingPerson]) {
    [(TVRUIPersonViewController *)self _requestPersonWithID:v6];
  }
}

- (void)setPersonName:(id)a3
{
  objc_storeStrong((id *)&self->_personName, a3);
  id v5 = a3;
  id v6 = [(TVRUIPersonViewController *)self navigationItem];
  [v6 setTitle:v5];
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

- (void)_configureHierarchy
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  [(TVRUIPersonViewController *)self setOverrideUserInterfaceStyle:2];
  val = self;
  objc_super v3 = [(TVRUIPersonViewController *)self view];
  v4 = [MEMORY[0x263F825C8] colorWithWhite:0.1 alpha:1.0];
  [v3 setBackgroundColor:v4];

  v69 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:101];
  id v5 = [MEMORY[0x263F82538] registrationWithCellClass:objc_opt_class() configurationHandler:&__block_literal_global_7];
  objc_initWeak(&location, val);
  id v6 = (void *)MEMORY[0x263F82538];
  uint64_t v7 = objc_opt_class();
  v86[0] = MEMORY[0x263EF8330];
  v86[1] = 3221225472;
  v86[2] = __48__TVRUIPersonViewController__configureHierarchy__block_invoke_2;
  v86[3] = &unk_2648006F8;
  objc_copyWeak(&v87, &location);
  objc_super v8 = [v6 registrationWithCellClass:v7 configurationHandler:v86];
  id v9 = objc_alloc(MEMORY[0x263F82528]);
  v10 = [(TVRUIPersonViewController *)val _collectionViewLayout];
  v71 = objc_msgSend(v9, "initWithFrame:collectionViewLayout:", v10, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  [v71 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v71 setClipsToBounds:1];
  [v71 setDelegate:val];
  id v11 = objc_alloc(MEMORY[0x263F82560]);
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __48__TVRUIPersonViewController__configureHierarchy__block_invoke_3;
  v83[3] = &unk_264800720;
  id v55 = v5;
  id v84 = v55;
  id v56 = v8;
  id v85 = v56;
  v68 = (void *)[v11 initWithCollectionView:v71 cellProvider:v83];
  uint64_t v12 = objc_opt_class();
  v13 = +[_TVRUIPersonHeader elementKind];
  v14 = +[_TVRUIPersonHeader reuseIdentifier];
  [v71 registerClass:v12 forSupplementaryViewOfKind:v13 withReuseIdentifier:v14];

  v15 = (void *)MEMORY[0x263F825B8];
  uint64_t v16 = objc_opt_class();
  v17 = +[_TVRUIPersonHeader elementKind];
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __48__TVRUIPersonViewController__configureHierarchy__block_invoke_4;
  v81[3] = &unk_264800748;
  objc_copyWeak(&v82, &location);
  v18 = [v15 registrationWithSupplementaryClass:v16 elementKind:v17 configurationHandler:v81];

  uint64_t v19 = objc_opt_class();
  v20 = +[_TVRUILabelHeaderView elementKind];
  v21 = +[_TVRUILabelHeaderView reuseIdentifier];
  [v71 registerClass:v19 forSupplementaryViewOfKind:v20 withReuseIdentifier:v21];

  v22 = (void *)MEMORY[0x263F825B8];
  uint64_t v23 = objc_opt_class();
  v24 = +[_TVRUILabelHeaderView elementKind];
  v79[0] = MEMORY[0x263EF8330];
  v79[1] = 3221225472;
  v79[2] = __48__TVRUIPersonViewController__configureHierarchy__block_invoke_5;
  v79[3] = &unk_264800310;
  objc_copyWeak(&v80, &location);
  v25 = [v22 registrationWithSupplementaryClass:v23 elementKind:v24 configurationHandler:v79];

  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = __48__TVRUIPersonViewController__configureHierarchy__block_invoke_6;
  v76[3] = &unk_264800338;
  id v54 = v25;
  id v77 = v54;
  id v53 = v18;
  id v78 = v53;
  [v68 setSupplementaryViewProvider:v76];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v90[0] = v71;
  v90[1] = v69;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v90 count:2];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v72 objects:v91 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v73 != v28) {
          objc_enumerationMutation(v26);
        }
        v30 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v3 addSubview:v30];
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v72 objects:v91 count:16];
    }
    while (v27);
  }

  v52 = (void *)MEMORY[0x263F08938];
  v67 = [v69 centerXAnchor];
  v66 = [v3 centerXAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v89[0] = v65;
  v64 = [v69 centerYAnchor];
  v63 = [v3 centerYAnchor];
  v62 = [v64 constraintEqualToAnchor:v63];
  v89[1] = v62;
  v60 = [v71 topAnchor];
  v61 = [v3 safeAreaLayoutGuide];
  v59 = [v61 topAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v89[2] = v58;
  v57 = [v71 leadingAnchor];
  v31 = [v3 leadingAnchor];
  v32 = [v57 constraintEqualToAnchor:v31];
  v89[3] = v32;
  v33 = [v71 trailingAnchor];
  v34 = [v3 trailingAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  v89[4] = v35;
  v36 = [v71 bottomAnchor];
  v37 = [v3 bottomAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  v89[5] = v38;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:6];
  [v52 activateConstraints:v39];

  v40 = (void *)MEMORY[0x263F82818];
  v41 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83580] variant:1024];
  v42 = [v40 configurationWithFont:v41];

  v43 = (void *)MEMORY[0x263F823D0];
  v44 = [MEMORY[0x263F827E8] systemImageNamed:@"ellipsis.circle" withConfiguration:v42];
  v45 = [v43 actionWithTitle:&stru_26DB4CAE0 image:v44 identifier:0 handler:&__block_literal_global_30];

  v46 = [MEMORY[0x263F824F0] plainButtonConfiguration];
  v47 = [MEMORY[0x263F824E8] buttonWithConfiguration:v46 primaryAction:v45];
  v48 = [MEMORY[0x263F825C8] whiteColor];
  [v47 setTintColor:v48];

  [v47 setOverrideUserInterfaceStyle:2];
  v49 = [(TVRUIPersonViewController *)val actionButtonMenu];
  [v47 setMenu:v49];
  [v47 setShowsMenuAsPrimaryAction:1];
  v50 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v47];

  v51 = [(TVRUIPersonViewController *)val navigationItem];
  [v51 setRightBarButtonItem:v50];

  [(TVRUIPersonViewController *)val setActivityIndicatorView:v69];
  [(TVRUIPersonViewController *)val setCollectionView:v71];
  [(TVRUIPersonViewController *)val setDataSource:v68];

  objc_destroyWeak(&v80);
  objc_destroyWeak(&v82);

  objc_destroyWeak(&v87);
  objc_destroyWeak(&location);
}

void __48__TVRUIPersonViewController__configureHierarchy__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  objc_msgSend(v6, "setIsExpanded:", objc_msgSend(v5, "isExpanded"));
  id v7 = [v5 factoidItem];

  [v6 setItem:v7];
}

void __48__TVRUIPersonViewController__configureHierarchy__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [v10 setImageProvider:WeakRetained];
    objc_super v8 = [WeakRetained upNextProvider];
    [v10 setUpNextProvider:v8];
  }
  id v9 = [v6 mediaInfo];
  [v10 setMediaInfo:v9];
}

id __48__TVRUIPersonViewController__configureHierarchy__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
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

void __48__TVRUIPersonViewController__configureHierarchy__block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(v6, "setShowsImageBorder:", objc_msgSend(WeakRetained, "personImageIsAvatar") ^ 1);
    id v5 = [v4 personImage];
    [v6 setImage:v5];
  }
}

void __48__TVRUIPersonViewController__configureHierarchy__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v11 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained dataSource];
    int v10 = objc_msgSend(v9, "sectionIdentifierForIndex:", objc_msgSend(v6, "section"));

    [v11 setTitle:v10];
  }
}

id __48__TVRUIPersonViewController__configureHierarchy__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = +[_TVRUILabelHeaderView elementKind];
  int v11 = [v8 isEqualToString:v10];

  if (v11)
  {
    uint64_t v12 = (void *)(a1 + 32);
LABEL_5:
    v15 = [v7 dequeueConfiguredReusableSupplementaryViewWithRegistration:*v12 forIndexPath:v9];
    goto LABEL_7;
  }
  v13 = +[_TVRUIPersonHeader elementKind];
  int v14 = [v8 isEqualToString:v13];

  if (v14)
  {
    uint64_t v12 = (void *)(a1 + 40);
    goto LABEL_5;
  }
  v15 = 0;
LABEL_7:

  return v15;
}

- (id)actionButtonMenu
{
  v28[3] = *MEMORY[0x263EF8340];
  v20 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.up.right.square"];
  uint64_t v19 = [MEMORY[0x263F827E8] systemImageNamed:@"square.and.arrow.up"];
  v18 = [MEMORY[0x263F827E8] systemImageNamed:@"magnifyingglass"];
  objc_initWeak(&location, self);
  objc_super v3 = (void *)MEMORY[0x263F823D0];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"TVRUIGotoPerson" value:&stru_26DB4CAE0 table:@"Localizable"];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __45__TVRUIPersonViewController_actionButtonMenu__block_invoke;
  v25[3] = &unk_264800190;
  objc_copyWeak(&v26, &location);
  id v6 = [v3 actionWithTitle:v5 image:v20 identifier:0 handler:v25];

  id v7 = (void *)MEMORY[0x263F823D0];
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"TVRUISharePerson" value:&stru_26DB4CAE0 table:@"Localizable"];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __45__TVRUIPersonViewController_actionButtonMenu__block_invoke_2;
  v23[3] = &unk_264800190;
  objc_copyWeak(&v24, &location);
  int v10 = [v7 actionWithTitle:v9 image:v19 identifier:0 handler:v23];

  int v11 = (void *)MEMORY[0x263F823D0];
  uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"TVRUISearchPerson" value:&stru_26DB4CAE0 table:@"Localizable"];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __45__TVRUIPersonViewController_actionButtonMenu__block_invoke_3;
  v21[3] = &unk_264800190;
  objc_copyWeak(&v22, &location);
  int v14 = [v11 actionWithTitle:v13 image:v18 identifier:0 handler:v21];

  v28[0] = v6;
  v28[1] = v10;
  v28[2] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  uint64_t v16 = [MEMORY[0x263F82940] menuWithChildren:v15];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v16;
}

void __45__TVRUIPersonViewController_actionButtonMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _gotoPerson];
}

void __45__TVRUIPersonViewController_actionButtonMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sharePerson];
}

void __45__TVRUIPersonViewController_actionButtonMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performPersonSearch];
}

- (id)_collectionViewLayout
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x263F82540]);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __50__TVRUIPersonViewController__collectionViewLayout__block_invoke;
  id v9 = &unk_264800770;
  objc_copyWeak(&v10, &location);
  objc_super v3 = (void *)[v2 initWithSectionProvider:&v6];
  id v4 = objc_alloc_init(MEMORY[0x263F82548]);
  objc_msgSend(v4, "setInterSectionSpacing:", 20.0, v6, v7, v8, v9);
  [v3 setConfiguration:v4];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v3;
}

id __50__TVRUIPersonViewController__collectionViewLayout__block_invoke(uint64_t a1, uint64_t a2)
{
  v44[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    int v5 = [WeakRetained personImageIsAvatar] ^ 1;
    if (a2)
    {
LABEL_3:
      +[_TVRUIMediaInfoCell preferredHeight];
      double v7 = v6;
      id v8 = (void *)MEMORY[0x263F82338];
      id v9 = [MEMORY[0x263F822F0] fractionalWidthDimension:1.0];
      id v10 = [MEMORY[0x263F822F0] absoluteDimension:v7];
      int v11 = [v8 sizeWithWidthDimension:v9 heightDimension:v10];

      uint64_t v12 = [MEMORY[0x263F82310] itemWithLayoutSize:v11];
      v13 = (void *)MEMORY[0x263F82300];
      v42 = v12;
      int v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
      v15 = [v13 verticalGroupWithLayoutSize:v11 subitems:v14];

      uint64_t v16 = [MEMORY[0x263F82320] sectionWithGroup:v15];
      v17 = (void *)MEMORY[0x263F82338];
      v18 = [MEMORY[0x263F822F0] fractionalWidthDimension:1.0];
      uint64_t v19 = [MEMORY[0x263F822F0] estimatedDimension:44.0];
      v20 = [v17 sizeWithWidthDimension:v18 heightDimension:v19];

      v21 = (void *)MEMORY[0x263F822D8];
      id v22 = +[_TVRUILabelHeaderView elementKind];
      uint64_t v23 = objc_msgSend(MEMORY[0x263F822D0], "layoutAnchorWithEdges:fractionalOffset:", 1, 0.0, -1.0);
      id v24 = [v21 supplementaryItemWithLayoutSize:v20 elementKind:v22 containerAnchor:v23];

      objc_msgSend(v24, "setContentInsets:", 10.0, 20.0, 0.0, 20.0);
      [v24 setExtendsBoundary:1];
      v41 = v24;
      v25 = (void *)MEMORY[0x263EFF8C0];
      id v26 = &v41;
      goto LABEL_7;
    }
  }
  else
  {
    int v5 = 0;
    if (a2) {
      goto LABEL_3;
    }
  }
  uint64_t v27 = (void *)MEMORY[0x263F82338];
  uint64_t v28 = [MEMORY[0x263F822F0] fractionalWidthDimension:1.0];
  v29 = (void *)MEMORY[0x263F822F0];
  +[_TVRUIFactoidCell preferredHeight];
  v30 = objc_msgSend(v29, "estimatedDimension:");
  int v11 = [v27 sizeWithWidthDimension:v28 heightDimension:v30];

  uint64_t v12 = [MEMORY[0x263F82310] itemWithLayoutSize:v11];
  v31 = (void *)MEMORY[0x263F82300];
  v44[0] = v12;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
  v15 = [v31 verticalGroupWithLayoutSize:v11 subitems:v32];

  uint64_t v16 = [MEMORY[0x263F82320] sectionWithGroup:v15];
  if (!v5) {
    goto LABEL_8;
  }
  v33 = (void *)MEMORY[0x263F82338];
  v34 = [MEMORY[0x263F822F0] fractionalWidthDimension:1.0];
  v35 = [MEMORY[0x263F822F0] absoluteDimension:300.0];
  v20 = [v33 sizeWithWidthDimension:v34 heightDimension:v35];

  v36 = (void *)MEMORY[0x263F822D8];
  v37 = +[_TVRUIPersonHeader elementKind];
  v38 = objc_msgSend(MEMORY[0x263F822D0], "layoutAnchorWithEdges:fractionalOffset:", 1, 0.0, -1.0);
  id v24 = [v36 supplementaryItemWithLayoutSize:v20 elementKind:v37 containerAnchor:v38];

  [v24 setExtendsBoundary:1];
  v43 = v24;
  v25 = (void *)MEMORY[0x263EFF8C0];
  id v26 = &v43;
LABEL_7:
  v39 = [v25 arrayWithObjects:v26 count:1];
  [v16 setBoundarySupplementaryItems:v39];

LABEL_8:
  return v16;
}

- (void)_requestPersonWithID:(id)a3
{
  id v4 = a3;
  [(TVRUIPersonViewController *)self setIsRequestingPerson:1];
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init(MEMORY[0x263F7CA08]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__TVRUIPersonViewController__requestPersonWithID___block_invoke;
  v6[3] = &unk_264800798;
  objc_copyWeak(&v7, &location);
  [v5 requestForPersonID:v4 completion:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

void __50__TVRUIPersonViewController__requestPersonWithID___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v10 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    if (!a4) {
      [WeakRetained _updatePerson:v10 filmography:v7];
    }
    [v9 setIsRequestingPerson:0];
  }
}

- (void)_updatePerson:(id)a3 filmography:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_person, a3);
  objc_storeStrong((id *)&self->_filmography, a4);
  if (v7)
  {
    id v9 = [v7 imageURLTemplate];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      objc_initWeak(&location, self);
      int v11 = [(TVRUIPersonViewController *)self imageFetcher];
      uint64_t v12 = [v7 imageURLTemplate];
      [v7 imageSize];
      double v14 = v13;
      double v16 = v15;
      v17 = [v7 identifier];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __55__TVRUIPersonViewController__updatePerson_filmography___block_invoke;
      v18[3] = &unk_264800418;
      objc_copyWeak(&v19, &location);
      objc_msgSend(v11, "fetchImageWithTemplateString:size:identifier:completion:", v12, v17, v18, v14, v16);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    else
    {
      [(TVRUIPersonViewController *)self _updatePersonFallbackImageFromCurrentState];
      [(TVRUIPersonViewController *)self _updateUIFromCurrentState];
    }
  }
}

void __55__TVRUIPersonViewController__updatePerson_filmography___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v6) {
      objc_msgSend(WeakRetained, "setPersonImage:");
    }
    else {
      [WeakRetained _updatePersonFallbackImageFromCurrentState];
    }
    [v5 _updateUIFromCurrentState];
  }
}

- (void)_updatePersonFallbackImageFromCurrentState
{
}

- (void)_updateUIFromCurrentState
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  objc_super v3 = [(TVRUIPersonViewController *)self person];
  BOOL v4 = [(TVRUIPersonViewController *)self _canShowPerson];
  id v5 = [(TVRUIPersonViewController *)self activityIndicatorView];
  [v5 setHidden:v4];

  if (v4)
  {
    id v6 = [v3 name];
    id v7 = [(TVRUIPersonViewController *)self navigationItem];
    [v7 setTitle:v6];

    id v8 = objc_alloc_init(MEMORY[0x263F82358]);
    [v8 appendSectionsWithIdentifiers:&unk_26DB65B48];
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v10 = [v3 birthplace];
    int v11 = __54__TVRUIPersonViewController__updateUIFromCurrentState__block_invoke((uint64_t)v10, &stru_26DB4CAE0, v10);

    uint64_t v12 = [v3 formattedBirthDate];
    double v13 = __54__TVRUIPersonViewController__updateUIFromCurrentState__block_invoke((uint64_t)v12, v11, v12);

    double v14 = [v3 formattedDeathDate];
    double v15 = __54__TVRUIPersonViewController__updateUIFromCurrentState__block_invoke((uint64_t)v14, v13, v14);

    double v16 = [v3 formattedAge];
    v17 = __54__TVRUIPersonViewController__updateUIFromCurrentState__block_invoke((uint64_t)v16, v15, v16);

    if ([v17 length])
    {
      v18 = +[_TVRUIFactoidItem factoidWithText:v17 options:1];
      id v19 = +[_TVRUIPersonItem itemWithFactoidItem:v18];
      [v9 addObject:v19];
    }
    v20 = objc_msgSend(v3, "bio", v17);
    uint64_t v21 = [v20 length];

    if (v21)
    {
      id v22 = [v3 bio];
      uint64_t v23 = +[_TVRUIFactoidItem factoidWithText:v22 options:6];
      id v24 = +[_TVRUIPersonItem itemWithFactoidItem:v23];
      [v9 addObject:v24];
    }
    v46 = v3;
    v44 = v9;
    [v8 appendItemsWithIdentifiers:v9];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v45 = self;
    v25 = [(TVRUIPersonViewController *)self filmography];
    id v26 = [v25 categories];

    obuint64_t j = v26;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v48 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v54 != v48) {
            objc_enumerationMutation(obj);
          }
          v30 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          v31 = [v30 title];
          v58 = v31;
          v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
          v33 = v8;
          [v8 appendSectionsWithIdentifiers:v32];

          id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          v35 = [v30 orderedItems];
          uint64_t v36 = [v35 countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v50;
            do
            {
              for (uint64_t j = 0; j != v37; ++j)
              {
                if (*(void *)v50 != v38) {
                  objc_enumerationMutation(v35);
                }
                v40 = +[_TVRUIPersonItem itemWithMediaInfo:*(void *)(*((void *)&v49 + 1) + 8 * j)];
                [v34 addObject:v40];
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v49 objects:v57 count:16];
            }
            while (v37);
          }

          id v8 = v33;
          [v33 appendItemsWithIdentifiers:v34];
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v28);
    }

    v41 = [(TVRUIPersonViewController *)v45 dataSource];
    [v41 applySnapshot:v8 animatingDifferences:0];

    objc_super v3 = v46;
  }
  else
  {
    v42 = [(TVRUIPersonViewController *)self activityIndicatorView];
    [v42 startAnimating];
  }
}

id __54__TVRUIPersonViewController__updateUIFromCurrentState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 length])
  {
    if ([v5 length])
    {
      id v6 = [NSString stringWithFormat:@"%@ %@ %@", v4, @"・", v5];
    }
    else
    {
      id v6 = v4;
    }
  }
  else
  {
    id v6 = v5;
  }
  id v7 = v6;

  return v7;
}

- (BOOL)_canShowPerson
{
  objc_super v3 = [(TVRUIPersonViewController *)self person];

  id v4 = [(TVRUIPersonViewController *)self filmography];

  id v5 = [(TVRUIPersonViewController *)self personImage];

  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  char v7 = v6;
  if (v6 || v5) {
    return v7 ^ 1;
  }
  return [(TVRUIPersonViewController *)self personImageIsAvatar];
}

- (void)_sharePerson
{
  objc_super v3 = [(TVRUIPersonViewController *)self person];
  id v6 = [v3 url];

  if (v6)
  {
    id v4 = [(TVRUIPersonViewController *)self actionProvider];
    id v5 = [(TVRUIPersonViewController *)self view];
    [v4 shareItem:v6 presentingViewController:self sourceView:v5];
  }
}

- (void)_gotoPerson
{
  objc_super v3 = [(TVRUIPersonViewController *)self person];
  id v5 = [v3 url];

  if (v5)
  {
    id v4 = [(TVRUIPersonViewController *)self actionProvider];
    [v4 openURL:v5];
  }
}

- (void)_performPersonSearch
{
  objc_super v3 = [(TVRUIPersonViewController *)self person];
  id v5 = [v3 name];

  if ([v5 length])
  {
    id v4 = [(TVRUIPersonViewController *)self actionProvider];
    [v4 webSearch:v5];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)requestImageForTemplate:(id)a3 size:(CGSize)a4 identifier:(id)a5 completion:(id)a6
{
  CGFloat v9 = a4.width + a4.width;
  CGFloat v10 = a4.height + a4.height;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [(TVRUIPersonViewController *)self imageFetcher];
  objc_msgSend(v14, "fetchImageWithTemplateString:size:identifier:completion:", v13, v12, v11, v9, v10);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(TVRUIPersonViewController *)self dataSource];
  char v7 = [v6 itemIdentifierForIndexPath:v5];

  if ([v7 isFactoid] && objc_msgSend(v7, "isExpandable"))
  {
    objc_msgSend(v7, "setIsExpanded:", objc_msgSend(v7, "isExpanded") ^ 1);
    id v8 = [(TVRUIPersonViewController *)self dataSource];
    CGFloat v9 = [v8 snapshot];

    v17[0] = v7;
    CGFloat v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    [v9 reconfigureItemsWithIdentifiers:v10];

    id v11 = [(TVRUIPersonViewController *)self dataSource];
    [v11 applySnapshot:v9 animatingDifferences:0];
  }
  else if ([v7 isMediaInfo])
  {
    id v12 = [(TVRUIPersonViewController *)self actionProvider];
    id v13 = [v7 mediaInfo];
    id v14 = [v13 identifier];
    double v15 = [v7 mediaInfo];
    double v16 = [v15 title];
    [v12 presentMediaWithID:v14 title:v16 presentingViewController:self];
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

- (NSString)personID
{
  return self->_personID;
}

- (NSString)personName
{
  return self->_personName;
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

- (TVRCPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
}

- (UIImage)personImage
{
  return self->_personImage;
}

- (void)setPersonImage:(id)a3
{
}

- (BOOL)personImageIsAvatar
{
  return self->_personImageIsAvatar;
}

- (void)setPersonImageIsAvatar:(BOOL)a3
{
  self->_personImageIsAvatar = a3;
}

- (TVRCFilmography)filmography
{
  return self->_filmography;
}

- (void)setFilmography:(id)a3
{
}

- (BOOL)isRequestingPerson
{
  return self->_isRequestingPerson;
}

- (void)setIsRequestingPerson:(BOOL)a3
{
  self->_isRequestingPerson = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filmography, 0);
  objc_storeStrong((id *)&self->_personImage, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_imageFetcher, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_personName, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_destroyWeak((id *)&self->_upNextProvider);
  objc_destroyWeak((id *)&self->_actionProvider);
}

@end