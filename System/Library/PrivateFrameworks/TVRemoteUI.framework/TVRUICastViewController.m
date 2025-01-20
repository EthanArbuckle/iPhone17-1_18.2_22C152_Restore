@interface TVRUICastViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hasAppeared;
- (TVRCMediaInfo)mediaInfo;
- (TVRCNowPlayingMetadata)metadata;
- (TVRUIActionProviding)actionProvider;
- (TVRUIImageFetcher)imageFetcher;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (id)_layout;
- (void)_filterNonCharacterRolesIfNeededForMediaInfo:(id)a3;
- (void)_updateUIForMediaInfo:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureHierarchy;
- (void)openURL:(id)a3;
- (void)requestImageForTemplate:(id)a3 size:(CGSize)a4 identifier:(id)a5 completion:(id)a6;
- (void)setActionProvider:(id)a3;
- (void)setHasAppeared:(BOOL)a3;
- (void)setImageFetcher:(id)a3;
- (void)setMediaInfo:(id)a3;
- (void)setMetadata:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVRUICastViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)TVRUICastViewController;
  [(TVRUICastViewController *)&v4 viewDidLoad];
  v3 = +[TVRUIImageFetcher imageFetcher];
  [(TVRUICastViewController *)self setImageFetcher:v3];

  [(TVRUICastViewController *)self configureHierarchy];
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TVRUICastViewController;
  [(TVRUICastViewController *)&v14 viewDidAppear:a3];
  [(TVRUICastViewController *)self setHasAppeared:1];
  objc_super v4 = [(TVRUICastViewController *)self dataSource];
  v5 = [v4 snapshot];
  v6 = [v5 itemIdentifiers];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    v8 = [(TVRUICastViewController *)self mediaInfo];

    if (v8)
    {
      v9 = [(TVRUICastViewController *)self mediaInfo];
      [(TVRUICastViewController *)self _updateUIForMediaInfo:v9];
    }
  }
  v10 = [(TVRUICastViewController *)self collectionView];
  v11 = [v10 indexPathsForSelectedItems];

  if ([v11 count])
  {
    v12 = [(TVRUICastViewController *)self collectionView];
    v13 = [v11 firstObject];
    [v12 deselectItemAtIndexPath:v13 animated:1];
  }
}

- (void)setMetadata:(id)a3
{
  id v5 = a3;
  v6 = [v5 canonicalID];
  uint64_t v7 = [(TVRCNowPlayingMetadata *)self->_metadata canonicalID];
  int v8 = [v6 isEqualToString:v7];

  objc_storeStrong((id *)&self->_metadata, a3);
  if (v5)
  {
    v9 = [v5 canonicalID];
    if ([v9 length])
    {
      v10 = [v5 canonicalID];
      int v11 = [v10 isEqualToString:*MEMORY[0x263F7CA68]];

      if (((v11 | v8) & 1) == 0)
      {
        [(TVRUICastViewController *)self setMediaInfo:0];
        id v12 = objc_alloc_init(MEMORY[0x263F7CA00]);
        objc_initWeak(&location, self);
        v13 = [v5 canonicalID];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __39__TVRUICastViewController_setMetadata___block_invoke;
        v14[3] = &unk_2648003F0;
        objc_copyWeak(&v15, &location);
        [v12 requestForCanonicalID:v13 includeRoles:1 completion:v14];

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
    }
    else
    {
    }
  }
}

void __39__TVRUICastViewController_setMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = [v3 roles];
    uint64_t v6 = [v5 count];

    if (v6
      || ([v3 showIdentifier], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
    {
      [WeakRetained setMediaInfo:v3];
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x263F7CA00]);
      v9 = [v3 showIdentifier];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __39__TVRUICastViewController_setMetadata___block_invoke_2;
      v10[3] = &unk_264800EB8;
      v10[4] = WeakRetained;
      [v8 requestForCanonicalID:v9 includeRoles:1 completion:v10];
    }
  }
}

void __39__TVRUICastViewController_setMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 roles];
  uint64_t v4 = [v3 count];

  if (v4) {
    [*(id *)(a1 + 32) setMediaInfo:v5];
  }
}

- (void)configureHierarchy
{
  v36[4] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x263F82538];
  uint64_t v4 = objc_opt_class();
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __45__TVRUICastViewController_configureHierarchy__block_invoke;
  v33[3] = &unk_264800EE0;
  objc_copyWeak(&v34, &location);
  id v5 = [v3 registrationWithCellClass:v4 configurationHandler:v33];
  id v6 = objc_alloc(MEMORY[0x263F82528]);
  uint64_t v7 = [(TVRUICastViewController *)self _layout];
  id v8 = (UICollectionView *)objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v7, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  [(UICollectionView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [MEMORY[0x263F825C8] clearColor];
  [(UICollectionView *)v8 setBackgroundColor:v9];

  [(UICollectionView *)v8 setDelegate:self];
  id v10 = objc_alloc(MEMORY[0x263F82560]);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __45__TVRUICastViewController_configureHierarchy__block_invoke_2;
  v31[3] = &unk_264800570;
  id v22 = v5;
  id v32 = v22;
  v23 = (UICollectionViewDiffableDataSource *)[v10 initWithCollectionView:v8 cellProvider:v31];
  int v11 = [(TVRUICastViewController *)self view];
  [v11 addSubview:v8];
  v24 = (void *)MEMORY[0x263F08938];
  v30 = [(UICollectionView *)v8 leadingAnchor];
  v29 = [v11 leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v36[0] = v28;
  v27 = [(UICollectionView *)v8 trailingAnchor];
  v26 = [v11 trailingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v36[1] = v25;
  id v12 = [(UICollectionView *)v8 topAnchor];
  v13 = [v11 topAnchor];
  objc_super v14 = [v12 constraintEqualToAnchor:v13];
  v36[2] = v14;
  id v15 = [(UICollectionView *)v8 bottomAnchor];
  v16 = [v11 bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v36[3] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:4];
  [v24 activateConstraints:v18];

  collectionView = self->_collectionView;
  self->_collectionView = v8;
  v20 = v8;

  dataSource = self->_dataSource;
  self->_dataSource = v23;

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

void __45__TVRUICastViewController_configureHierarchy__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [v8 setImageProvider:WeakRetained];

  [v8 setRole:v6];
}

uint64_t __45__TVRUICastViewController_configureHierarchy__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 32) forIndexPath:a3 item:a4];
}

- (void)setMediaInfo:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_mediaInfo, a3);
  uint64_t v5 = [(TVRUICastViewController *)self _filterNonCharacterRolesIfNeededForMediaInfo:self->_mediaInfo];
  id v6 = v7;
  if (v7)
  {
    uint64_t v5 = [(TVRUICastViewController *)self hasAppeared];
    id v6 = v7;
    if (v5)
    {
      uint64_t v5 = [(TVRUICastViewController *)self _updateUIForMediaInfo:v7];
      id v6 = v7;
    }
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (id)_layout
{
  v19[1] = *MEMORY[0x263EF8340];
  +[_TVRUIRoleCell preferredHeight];
  double v3 = v2;
  uint64_t v4 = (void *)MEMORY[0x263F82338];
  uint64_t v5 = [MEMORY[0x263F822F0] fractionalWidthDimension:1.0];
  id v6 = [MEMORY[0x263F822F0] absoluteDimension:v3];
  id v7 = [v4 sizeWithWidthDimension:v5 heightDimension:v6];

  id v8 = [MEMORY[0x263F82310] itemWithLayoutSize:v7];
  v9 = (void *)MEMORY[0x263F82338];
  id v10 = [MEMORY[0x263F822F0] fractionalWidthDimension:1.0];
  int v11 = [MEMORY[0x263F822F0] absoluteDimension:v3];
  id v12 = [v9 sizeWithWidthDimension:v10 heightDimension:v11];

  v13 = (void *)MEMORY[0x263F82300];
  v19[0] = v8;
  objc_super v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  id v15 = [v13 verticalGroupWithLayoutSize:v12 subitems:v14];

  v16 = [MEMORY[0x263F82320] sectionWithGroup:v15];
  [v16 setInterGroupSpacing:10.0];
  v17 = (void *)[objc_alloc(MEMORY[0x263F82540]) initWithSection:v16];

  return v17;
}

- (void)_updateUIForMediaInfo:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F82358];
  id v5 = a3;
  id v8 = objc_alloc_init(v4);
  [v8 appendSectionsWithIdentifiers:&unk_26DB65CB0];
  id v6 = [v5 roles];

  [v8 appendItemsWithIdentifiers:v6];
  id v7 = [(TVRUICastViewController *)self dataSource];
  [v7 applySnapshot:v8 animatingDifferences:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)openURL:(id)a3
{
  id v4 = a3;
  id v5 = [(TVRUICastViewController *)self actionProvider];
  [v5 openURL:v4];
}

- (void)_filterNonCharacterRolesIfNeededForMediaInfo:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 roles];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = objc_msgSend(v3, "roles", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v13 = [v12 characterName];
          uint64_t v14 = [v13 length];

          if (v14) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    if ([v6 count]) {
      [v3 setRoles:v6];
    }
  }
}

- (void)requestImageForTemplate:(id)a3 size:(CGSize)a4 identifier:(id)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [(TVRUICastViewController *)self imageFetcher];
  objc_msgSend(v14, "fetchImageWithTemplateString:size:identifier:completion:", v13, v12, v11, width, height);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(TVRUICastViewController *)self dataSource];
  id v10 = [v6 itemIdentifierForIndexPath:v5];

  if (v10)
  {
    id v7 = [(TVRUICastViewController *)self actionProvider];
    uint64_t v8 = [v10 canonicalID];
    uint64_t v9 = [v10 actorName];
    [v7 presentPersonWithID:v8 name:v9 presentingViewController:self];
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

- (TVRCNowPlayingMetadata)metadata
{
  return self->_metadata;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (TVRCMediaInfo)mediaInfo
{
  return self->_mediaInfo;
}

- (BOOL)hasAppeared
{
  return self->_hasAppeared;
}

- (void)setHasAppeared:(BOOL)a3
{
  self->_hasAppeared = a3;
}

- (TVRUIImageFetcher)imageFetcher
{
  return self->_imageFetcher;
}

- (void)setImageFetcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFetcher, 0);
  objc_storeStrong((id *)&self->_mediaInfo, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_actionProvider);
}

@end