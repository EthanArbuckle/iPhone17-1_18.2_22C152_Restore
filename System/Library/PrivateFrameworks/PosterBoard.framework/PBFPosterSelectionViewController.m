@interface PBFPosterSelectionViewController
- (PBFPosterSelectionViewController)initWithAllowedConfigurationUUIDs:(id)a3 selectedConfigurationUUID:(id)a4 galleryDataProvider:(id)a5 dataStore:(id)a6;
- (PBFPosterSelectionViewControllerDelegate)delegate;
- (id)_cancelBarButtonItem;
- (id)_cellForItemAtIndexPath:(id)a3 identifier:(id)a4;
- (id)_doneBarButtonItem;
- (id)compositionalLayout;
- (id)sectionWithEnvironment:(id)a3;
- (int64_t)layoutOrientation;
- (void)_applySnapshotForCurrentStateWithAnimation:(BOOL)a3;
- (void)_cancel:(id)a3;
- (void)_done:(id)a3;
- (void)_orientationDidChange;
- (void)_reloadDataWithAnimation:(BOOL)a3;
- (void)_validateDoneButton;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)posterExtensionDataStoreDidUpdateConfigurations:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PBFPosterSelectionViewController

- (id)sectionWithEnvironment:(id)a3
{
  v4 = [a3 container];
  [v4 effectiveContentSize];
  double v6 = (v5 + -64.0 + -40.0) / 3.0;

  v7 = [(PBFPosterSelectionViewController *)self view];
  v8 = [v7 window];
  v9 = [v8 screen];
  if (v9)
  {
    +[PBFFocusPosterCell estimatedCellSizeForItemWidth:v9 screen:1 hasAccessory:v6];
    double v11 = v10;
  }
  else
  {
    v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
    +[PBFFocusPosterCell estimatedCellSizeForItemWidth:v12 screen:1 hasAccessory:v6];
    double v11 = v13;
  }
  v14 = (void *)MEMORY[0x1E4FB1338];
  v15 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v16 = [MEMORY[0x1E4FB1308] estimatedDimension:v11];
  v17 = [v14 sizeWithWidthDimension:v15 heightDimension:v16];

  v18 = (void *)MEMORY[0x1E4FB1338];
  v19 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v20 = [MEMORY[0x1E4FB1308] estimatedDimension:v11];
  v21 = [v18 sizeWithWidthDimension:v19 heightDimension:v20];

  v22 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v17 supplementaryItems:MEMORY[0x1E4F1CBF0]];
  objc_msgSend(v22, "setContentInsets:", 10.0, 10.0, 10.0, 10.0);
  v23 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v21 subitem:v22 count:3];
  v24 = [MEMORY[0x1E4FB1330] sectionWithGroup:v23];
  objc_msgSend(v24, "setContentInsets:", 26.0, 22.0, 26.0, 22.0);
  [v24 setInterGroupSpacing:26.0];

  return v24;
}

- (id)compositionalLayout
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x1E4FB1580]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PBFPosterSelectionViewController_compositionalLayout__block_invoke;
  v5[3] = &unk_1E6982BD8;
  objc_copyWeak(&v6, &location);
  v3 = (void *)[v2 initWithSectionProvider:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __55__PBFPosterSelectionViewController_compositionalLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained && WeakRetained[129])
  {
    v7 = [WeakRetained sectionWithEnvironment:v4];
    objc_msgSend(v7, "setContentInsets:", 26.0, 22.0, 20.0, 22.0);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PBFPosterSelectionViewController)initWithAllowedConfigurationUUIDs:(id)a3 selectedConfigurationUUID:(id)a4 galleryDataProvider:(id)a5 dataStore:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v12;
  NSClassFromString(&cfstr_Pbfpostergalle.isa);
  if (!v14)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSelectionViewController initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:galleryDataProvider:dataStore:]();
    }
LABEL_19:
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32410E4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFPosterGalleryDataProviderClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSelectionViewController initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:galleryDataProvider:dataStore:]();
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3241148);
  }

  id v15 = v13;
  NSClassFromString(&cfstr_Pbfposterexten.isa);
  if (!v15)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSelectionViewController initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:galleryDataProvider:dataStore:]();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32411ACLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFPosterExtensionDataStoreClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSelectionViewController initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:galleryDataProvider:dataStore:]();
    }
    goto LABEL_19;
  }

  v16 = [(PBFPosterSelectionViewController *)self compositionalLayout];
  v26.receiver = self;
  v26.super_class = (Class)PBFPosterSelectionViewController;
  v17 = [(PBFPosterSelectionViewController *)&v26 initWithCollectionViewLayout:v16];

  if (v17)
  {
    uint64_t v18 = [v10 copy];
    allowedConfigurationUUIDs = v17->_allowedConfigurationUUIDs;
    v17->_allowedConfigurationUUIDs = (NSSet *)v18;

    objc_storeStrong((id *)&v17->_selectedConfigurationUUID, a4);
    uint64_t v20 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    configurationsToMetadata = v17->_configurationsToMetadata;
    v17->_configurationsToMetadata = (NSMapTable *)v20;

    objc_storeStrong((id *)&v17->_galleryDataProvider, a5);
    objc_storeStrong((id *)&v17->_dataStore, a6);
    [(PBFPosterExtensionDataStore *)v17->_dataStore addObserver:v17];
  }

  return v17;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)PBFPosterSelectionViewController;
  [(PBFPosterSelectionViewController *)&v17 viewDidLoad];
  v3 = [(PBFPosterSelectionViewController *)self view];
  id v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  double v5 = [(PBFPosterSelectionViewController *)self navigationItem];
  id v6 = [(PBFPosterSelectionViewController *)self _cancelBarButtonItem];
  [v5 setLeftBarButtonItem:v6];

  v7 = [(PBFPosterSelectionViewController *)self navigationItem];
  v8 = [(PBFPosterSelectionViewController *)self _doneBarButtonItem];
  [v7 setRightBarButtonItem:v8];

  v9 = [(PBFPosterSelectionViewController *)self collectionView];
  [v9 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"Poster"];

  [(PBFPosterSelectionViewController *)self _validateDoneButton];
  objc_initWeak(&location, self);
  id v10 = objc_alloc(MEMORY[0x1E4FB1598]);
  id v11 = [(PBFPosterSelectionViewController *)self collectionView];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__PBFPosterSelectionViewController_viewDidLoad__block_invoke;
  v14[3] = &unk_1E6980748;
  objc_copyWeak(&v15, &location);
  id v12 = (UICollectionViewDiffableDataSource *)[v10 initWithCollectionView:v11 cellProvider:v14];
  dataSource = self->_dataSource;
  self->_dataSource = v12;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

id __47__PBFPosterSelectionViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  double v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  v9 = [WeakRetained _cellForItemAtIndexPath:v7 identifier:v6];

  return v9;
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBFPosterSelectionViewController;
  [(PBFPosterSelectionViewController *)&v4 viewIsAppearing:a3];
  self->_layoutOrientation = [(UIViewController *)self pbf_layoutOrientation];
  [(PBFPosterSelectionViewController *)self _reloadDataWithAnimation:0];
}

- (void)_orientationDidChange
{
  id v8 = [(PBFPosterSelectionViewController *)self view];
  uint64_t v3 = [v8 window];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    int64_t layoutOrientation = self->_layoutOrientation;
    int64_t v6 = [(UIViewController *)self pbf_layoutOrientation];

    if (layoutOrientation == v6) {
      return;
    }
    self->_int64_t layoutOrientation = [(UIViewController *)self pbf_layoutOrientation];
    [(PBFPosterSelectionViewController *)self _reloadDataWithAnimation:0];
    id v8 = [(PBFPosterSelectionViewController *)self collectionView];
    id v7 = [v8 collectionViewLayout];
    [v7 invalidateLayout];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87__PBFPosterSelectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E6982C00;
  v4[4] = self;
  [a4 animateAlongsideTransition:v4 completion:0];
}

uint64_t __87__PBFPosterSelectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _orientationDidChange];
}

- (id)_cancelBarButtonItem
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancel_];
  return v2;
}

- (id)_doneBarButtonItem
{
  doneButtonItem = self->_doneButtonItem;
  if (!doneButtonItem)
  {
    objc_super v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
    double v5 = self->_doneButtonItem;
    self->_doneButtonItem = v4;

    [(UIBarButtonItem *)self->_doneButtonItem setEnabled:0];
    doneButtonItem = self->_doneButtonItem;
  }
  int64_t v6 = doneButtonItem;
  return v6;
}

- (void)_validateDoneButton
{
  [(UIBarButtonItem *)self->_doneButtonItem setEnabled:self->_selectedConfigurationUUID != 0];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSArray objectAtIndexedSubscript:](self->_configurations, "objectAtIndexedSubscript:", [v7 item]);
  v9 = [v8 _path];
  id v10 = [v9 serverIdentity];
  id v11 = [v10 posterUUID];

  allowedConfigurationUUIDs = self->_allowedConfigurationUUIDs;
  if (!allowedConfigurationUUIDs || [(NSSet *)allowedConfigurationUUIDs containsObject:v11])
  {
    v25 = v6;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = objc_msgSend(v6, "visibleCells", v8);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v19 = objc_opt_class();
          id v20 = v18;
          if (v19)
          {
            if (objc_opt_isKindOfClass()) {
              v21 = v20;
            }
            else {
              v21 = 0;
            }
          }
          else
          {
            v21 = 0;
          }
          id v22 = v21;

          [v22 setCheckboxOn:0];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }

    id v6 = v25;
    v23 = [v25 cellForItemAtIndexPath:v7];
    objc_storeStrong((id *)&self->_selectedConfigurationUUID, v11);
    [v23 setCheckboxOn:1];
    [(PBFPosterSelectionViewController *)self _validateDoneButton];

    id v8 = v24;
  }
}

- (void)_reloadDataWithAnimation:(BOOL)a3
{
  BOOL v28 = a3;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [(PBFPosterExtensionDataStore *)self->_dataStore switcherConfiguration];
  switcherConfiguration = self->_switcherConfiguration;
  self->_switcherConfiguration = v4;

  id v6 = [(PRSwitcherConfiguration *)self->_switcherConfiguration configurations];
  configurations = self->_configurations;
  self->_configurations = v6;

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v30 = [(UIViewController *)self pbf_displayContext];
  [(NSMapTable *)self->_configurationsToMetadata removeAllObjects];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obj = self->_configurations;
  uint64_t v32 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v32)
  {
    uint64_t v9 = *(void *)v38;
    uint64_t v29 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v12 = [v11 _path];
        id v13 = [v12 serverIdentity];

        uint64_t v14 = [(NSMapTable *)self->_configurationsToMetadata objectForKey:v11];
        if (!v14)
        {
          uint64_t v14 = objc_alloc_init(PBFPosterSelectionConfigurationMetadata);
          [(NSMapTable *)self->_configurationsToMetadata setObject:v14 forKey:v11];
        }
        uint64_t v15 = [v13 posterUUID];
        uint64_t v16 = [v15 UUIDString];

        if (!v16)
        {
          long long v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"uuidString != nil"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[PBFPosterSelectionViewController _reloadDataWithAnimation:]();
          }
          [v27 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1D3241D54);
        }
        [v8 setObject:v11 forKey:v16];
        objc_super v17 = [(PBFPosterSelectionConfigurationMetadata *)v14 cachedSnapshot];

        if (!v17)
        {
          dataStore = self->_dataStore;
          [v13 provider];
          id v20 = v19 = v8;
          v21 = [(PBFPosterExtensionDataStore *)dataStore providerForExtensionIdentifier:v20];

          id v22 = [[PBFPosterConfigurationGalleryPreview alloc] initWithConfiguration:v11 extension:v21];
          [(PBFPosterSelectionConfigurationMetadata *)v14 setPosterPreview:v22];
          v23 = self->_dataStore;
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __61__PBFPosterSelectionViewController__reloadDataWithAnimation___block_invoke;
          v33[3] = &unk_1E6981418;
          v34 = v14;
          v35 = self;
          id v36 = v16;
          v24 = v23;
          uint64_t v9 = v29;
          [(PBFPosterExtensionDataStore *)v24 fetchGallerySnapshotForConfiguration:v11 context:v30 completion:v33];

          id v8 = v19;
        }
      }
      uint64_t v32 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v32);
  }

  v25 = (NSDictionary *)[v8 copy];
  uuidsToConfigurations = self->_uuidsToConfigurations;
  self->_uuidsToConfigurations = v25;

  [(PBFPosterSelectionViewController *)self _applySnapshotForCurrentStateWithAnimation:v28];
}

void __61__PBFPosterSelectionViewController__reloadDataWithAnimation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PBFPosterSelectionViewController__reloadDataWithAnimation___block_invoke_2;
  block[3] = &unk_1E69825A0;
  id v13 = v5;
  id v14 = v6;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  id v15 = v7;
  uint64_t v16 = v8;
  id v17 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __61__PBFPosterSelectionViewController__reloadDataWithAnimation___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 48), "setCachedSnapshot:");
    id v2 = [*(id *)(*(void *)(a1 + 56) + 1032) indexPathForItemIdentifier:*(void *)(a1 + 64)];
    if (v2)
    {
      id v6 = v2;
      uint64_t v3 = [*(id *)(a1 + 56) collectionView];
      objc_super v4 = [v3 cellForItemAtIndexPath:v6];

      [v4 setPosterImage:*(void *)(a1 + 32)];
      [v4 setCheckboxAssociatedPosterIdentifier:*(void *)(a1 + 64)];

      id v2 = v6;
    }
  }
  else
  {
    id v5 = PBFLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __61__PBFPosterSelectionViewController__reloadDataWithAnimation___block_invoke_2_cold_1(a1, v5);
    }
  }
}

- (void)_applySnapshotForCurrentStateWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(NSArray *)self->_configurations bs_compactMap:&__block_literal_global_12];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1360]);
    v8[0] = @"Configured";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v6 appendSectionsWithIdentifiers:v7];

    [v6 appendItemsWithIdentifiers:v5];
    [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v6 animatingDifferences:v3];
  }
}

id __79__PBFPosterSelectionViewController__applySnapshotForCurrentStateWithAnimation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 _path];
  BOOL v3 = [v2 serverIdentity];
  objc_super v4 = [v3 posterUUID];
  id v5 = [v4 UUIDString];

  return v5;
}

- (void)posterExtensionDataStoreDidUpdateConfigurations:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PBFPosterSelectionViewController_posterExtensionDataStoreDidUpdateConfigurations___block_invoke;
  block[3] = &unk_1E69808C0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __84__PBFPosterSelectionViewController_posterExtensionDataStoreDidUpdateConfigurations___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  BOOL v3 = [v2 window];

  if (v3)
  {
    objc_super v4 = *(void **)(a1 + 32);
    [v4 _reloadDataWithAnimation:1];
  }
}

- (id)_cellForItemAtIndexPath:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v23 = [(PBFPosterSelectionViewController *)self collectionView];
  uint64_t v8 = [v23 dequeueReusableCellWithReuseIdentifier:@"Poster" forIndexPath:v7];

  uint64_t v9 = [(NSDictionary *)self->_uuidsToConfigurations objectForKey:v6];
  id v10 = [(NSMapTable *)self->_configurationsToMetadata objectForKey:v9];
  id v11 = [v9 _path];
  id v12 = [v11 serverIdentity];
  id v13 = [v12 posterUUID];

  allowedConfigurationUUIDs = self->_allowedConfigurationUUIDs;
  if (allowedConfigurationUUIDs) {
    uint64_t v15 = [(NSSet *)allowedConfigurationUUIDs containsObject:v13];
  }
  else {
    uint64_t v15 = 1;
  }
  uint64_t v16 = [v10 cachedSnapshot];
  [v8 setPosterImage:v16];

  [v8 setPosterPreviewGenerator:self->_galleryDataProvider];
  id v17 = [v10 posterPreview];
  [v8 setPosterPreview:v17];

  [v8 setCheckboxAssociatedPosterIdentifier:v6];
  selectedConfigurationUUID = self->_selectedConfigurationUUID;
  id v19 = [v9 _path];
  id v20 = [v19 serverIdentity];
  v21 = [v20 posterUUID];
  objc_msgSend(v8, "setCheckboxOn:", -[NSUUID isEqual:](selectedConfigurationUUID, "isEqual:", v21));

  [v8 setActionType:1];
  [v8 setEnabled:v15];

  return v8;
}

- (void)_cancel:(id)a3
{
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F92448]) initWithResult:0 configurationUUID:0];
  id v5 = [(PBFPosterSelectionViewController *)self delegate];
  [v5 posterSelectionViewController:self willDismissWithResponse:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PBFPosterSelectionViewController__cancel___block_invoke;
  v7[3] = &unk_1E69808E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PBFPosterSelectionViewController *)self dismissViewControllerAnimated:1 completion:v7];
}

void __44__PBFPosterSelectionViewController__cancel___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 posterSelectionViewController:*(void *)(a1 + 32) didDismissWithResponse:*(void *)(a1 + 40)];
}

- (void)_done:(id)a3
{
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F92448]) initWithResult:1 configurationUUID:self->_selectedConfigurationUUID];
  id v5 = [(PBFPosterSelectionViewController *)self delegate];
  [v5 posterSelectionViewController:self willDismissWithResponse:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__PBFPosterSelectionViewController__done___block_invoke;
  v7[3] = &unk_1E69808E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PBFPosterSelectionViewController *)self dismissViewControllerAnimated:1 completion:v7];
}

void __42__PBFPosterSelectionViewController__done___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 posterSelectionViewController:*(void *)(a1 + 32) didDismissWithResponse:*(void *)(a1 + 40)];
}

- (PBFPosterSelectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBFPosterSelectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  self->_int64_t layoutOrientation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configurationsToMetadata, 0);
  objc_storeStrong((id *)&self->_uuidsToConfigurations, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_switcherConfiguration, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_selectedConfigurationUUID, 0);
  objc_storeStrong((id *)&self->_allowedConfigurationUUIDs, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_galleryDataProvider, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
}

- (void)initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:galleryDataProvider:dataStore:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithAllowedConfigurationUUIDs:selectedConfigurationUUID:galleryDataProvider:dataStore:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_reloadDataWithAnimation:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __61__PBFPosterSelectionViewController__reloadDataWithAnimation___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_ERROR, "Poster Selection: Could not fetch snapshot for configuration: %@", (uint8_t *)&v3, 0xCu);
}

@end