@interface PBFFocusPosterSelectionViewController
- (BOOL)posterRackCollectionViewControllerDidPressDone:(id)a3;
- (PBFFocusPosterSelectionViewController)initWithActivityUUID:(id)a3 activityIdentifier:(id)a4 galleryDataProvider:(id)a5 dataStore:(id)a6;
- (PBFFocusPosterSelectionViewControllerDelegate)delegate;
- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3;
- (id)_cancelBarButtonItem;
- (id)_cellForItemAtIndexPath:(id)a3 identifier:(id)a4;
- (id)_createLockScreenFromSuggestionsHeaderDescription;
- (id)_createLockScreenHeaderDescription;
- (id)_doneBarButtonItem;
- (id)_posterLimitExceededAlert;
- (id)_supplementaryViewAtIndexPath:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)compositionalLayout;
- (id)galleryViewController:(id)a3 willUseAnimationController:(id)a4 forDismissingEditingViewControllerWithAction:(int64_t)a5;
- (id)mastheadSectionWithEnvironment:(id)a3;
- (id)sectionWithEnvironment:(id)a3 section:(id)a4;
- (int64_t)pbf_layoutOrientation;
- (void)_applySnapshotForCurrentStateWithAnimation:(BOOL)a3;
- (void)_cancel:(id)a3;
- (void)_commitCheckedStates;
- (void)_done:(id)a3;
- (void)_logEditWithEditingViewController:(id)a3 posterUUID:(id)a4 lastModifiedDate:(id)a5;
- (void)_populateActivityMetadata;
- (void)_reloadDataWithAnimation:(BOOL)a3;
- (void)_showEditingForPoster:(id)a3 fromFocusPosterCell:(id)a4;
- (void)_showGallery;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)editingIngestionManager:(id)a3 didAccept:(id)a4 userChoice:(int64_t)a5;
- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7;
- (void)editingSceneViewControllerDidFinalize:(id)a3;
- (void)galleryViewController:(id)a3 didSelectPreview:(id)a4 fromPreviewView:(id)a5;
- (void)posterExtensionDataStoreDidUpdateConfigurations:(id)a3;
- (void)posterRackCollectionViewControllerDidPressCancel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PBFFocusPosterSelectionViewController

- (id)mastheadSectionWithEnvironment:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4FB1338];
  v4 = objc_msgSend(MEMORY[0x1E4FB1308], "fractionalWidthDimension:", a3, 1.0);
  v5 = [MEMORY[0x1E4FB1308] estimatedDimension:0.0];
  v6 = [v3 sizeWithWidthDimension:v4 heightDimension:v5];

  v7 = [MEMORY[0x1E4FB1318] customGroupWithLayoutSize:v6 itemProvider:&__block_literal_global];
  v8 = (void *)MEMORY[0x1E4FB1338];
  v9 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v10 = [MEMORY[0x1E4FB1308] estimatedDimension:100.0];
  v11 = [v8 sizeWithWidthDimension:v9 heightDimension:v10];

  v12 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v11 elementKind:*MEMORY[0x1E4FB2770] alignment:1];
  v13 = [MEMORY[0x1E4FB1330] sectionWithGroup:v7];
  v16[0] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v13 setBoundarySupplementaryItems:v14];

  return v13;
}

uint64_t __72__PBFFocusPosterSelectionViewController_mastheadSectionWithEnvironment___block_invoke()
{
  return MEMORY[0x1E4F1CBF0];
}

- (id)sectionWithEnvironment:(id)a3 section:(id)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [a3 container];
  [v7 effectiveContentSize];
  double v9 = (v8 + -64.0 + -40.0) / 3.0;

  v10 = [(PBFFocusPosterSelectionViewController *)self view];
  v11 = [v10 window];
  v12 = [v11 screen];
  v13 = v12;
  if (!v12)
  {
    v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
  }
  +[PBFFocusPosterCell estimatedCellSizeForItemWidth:screen:hasAccessory:](PBFFocusPosterCell, "estimatedCellSizeForItemWidth:screen:hasAccessory:", v13, [v6 isEqualToString:@"Configured"], v9);
  double v15 = v14;
  if (!v12) {

  }
  v16 = (void *)MEMORY[0x1E4FB1338];
  v17 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v18 = [MEMORY[0x1E4FB1308] estimatedDimension:v15];
  v19 = [v16 sizeWithWidthDimension:v17 heightDimension:v18];

  v20 = (void *)MEMORY[0x1E4FB1338];
  v21 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v22 = [MEMORY[0x1E4FB1308] estimatedDimension:v15];
  v23 = [v20 sizeWithWidthDimension:v21 heightDimension:v22];

  v24 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v19 supplementaryItems:MEMORY[0x1E4F1CBF0]];
  objc_msgSend(v24, "setContentInsets:", 10.0, 10.0, 10.0, 10.0);
  v25 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v23 subitem:v24 count:3];
  v26 = (void *)MEMORY[0x1E4FB1338];
  v27 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v28 = [MEMORY[0x1E4FB1308] estimatedDimension:60.0];
  v29 = [v26 sizeWithWidthDimension:v27 heightDimension:v28];

  v30 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v29 elementKind:*MEMORY[0x1E4FB2770] alignment:1];
  v31 = [MEMORY[0x1E4FB1330] sectionWithGroup:v25];
  objc_msgSend(v31, "setContentInsets:", 2.0, 22.0, 26.0, 22.0);
  [v31 setInterGroupSpacing:26.0];
  v34[0] = v30;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  [v31 setBoundarySupplementaryItems:v32];

  return v31;
}

- (id)compositionalLayout
{
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x1E4FB1580]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__PBFFocusPosterSelectionViewController_compositionalLayout__block_invoke;
  v7[3] = &unk_1E69806D0;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a2;
  v7[4] = self;
  v5 = (void *)[v4 initWithSectionProvider:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

id __60__PBFFocusPosterSelectionViewController_compositionalLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (!WeakRetained || (double v8 = (void *)*((void *)WeakRetained + 133)) == 0)
  {
    v11 = 0;
LABEL_12:

    return v11;
  }
  double v9 = [v8 sectionIdentifierForIndex:a2];
  if ([v9 isEqualToString:@"Masthead"])
  {
    uint64_t v10 = [v7 mastheadSectionWithEnvironment:v5];
LABEL_8:
    v11 = (void *)v10;
LABEL_11:

    goto LABEL_12;
  }
  if ([v9 isEqualToString:@"Create"])
  {
    uint64_t v10 = [v7 sectionWithEnvironment:v5 section:v9];
    goto LABEL_8;
  }
  if ([v9 isEqualToString:@"Configured"])
  {
    v11 = [v7 sectionWithEnvironment:v5 section:v9];
    objc_msgSend(v11, "setContentInsets:", 2.0, 22.0, 20.0, 22.0);
    goto LABEL_11;
  }
  v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"NO"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __60__PBFFocusPosterSelectionViewController_compositionalLayout__block_invoke_cold_1(a1);
  }
  [v13 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (PBFFocusPosterSelectionViewController)initWithActivityUUID:(id)a3 activityIdentifier:(id)a4 galleryDataProvider:(id)a5 dataStore:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v11;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v15)
  {
    v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:]();
    }
LABEL_37:
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D2854);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:]();
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D28B8);
  }

  id v16 = v12;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v16)
  {
    v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:]();
    }
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D291CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:]();
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D2980);
  }

  id v17 = v13;
  NSClassFromString(&cfstr_Pbfpostergalle.isa);
  if (!v17)
  {
    v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:]();
    }
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D29E4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFPosterGalleryDataProviderClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:]();
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D2A48);
  }

  id v18 = v14;
  NSClassFromString(&cfstr_Pbfposterexten.isa);
  if (!v18)
  {
    v37 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:].cold.4();
    }
    [v37 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D2AACLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFPosterExtensionDataStoreClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:].cold.4();
    }
    goto LABEL_37;
  }

  v19 = [(PBFFocusPosterSelectionViewController *)self compositionalLayout];
  v41.receiver = self;
  v41.super_class = (Class)PBFFocusPosterSelectionViewController;
  v20 = [(PBFFocusPosterSelectionViewController *)&v41 initWithCollectionViewLayout:v19];

  if (v20)
  {
    v21 = PBFLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[PBFFocusPosterSelectionViewController initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:].cold.5();
    }

    objc_storeStrong((id *)&v20->_activityUUID, a3);
    uint64_t v22 = [v16 copy];
    activityIdentifier = v20->_activityIdentifier;
    v20->_activityIdentifier = (NSString *)v22;

    uint64_t v24 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    configurationsToMetadata = v20->_configurationsToMetadata;
    v20->_configurationsToMetadata = (NSMapTable *)v24;

    objc_storeStrong((id *)&v20->_galleryDataProvider, a5);
    objc_storeStrong((id *)&v20->_dataStore, a6);
    CFTimeInterval v26 = CACurrentMediaTime();
    [(PBFPosterExtensionDataStore *)v20->_dataStore addObserver:v20];
    dataStore = v20->_dataStore;
    v28 = [(NSUUID *)v20->_activityUUID UUIDString];
    v29 = +[PBFGenericDisplayContext mainScreen];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __111__PBFFocusPosterSelectionViewController_initWithActivityUUID_activityIdentifier_galleryDataProvider_dataStore___block_invoke;
    v38[3] = &unk_1E6980720;
    v39 = v20;
    CFTimeInterval v40 = v26;
    [(PBFPosterExtensionDataStore *)dataStore fetchPosterSuggestionsForFocusModeWithUUID:v28 context:v29 completion:v38];
  }
  return v20;
}

void __111__PBFFocusPosterSelectionViewController_initWithActivityUUID_activityIdentifier_galleryDataProvider_dataStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = PBFLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __111__PBFFocusPosterSelectionViewController_initWithActivityUUID_activityIdentifier_galleryDataProvider_dataStore___block_invoke_cold_1();
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__PBFFocusPosterSelectionViewController_initWithActivityUUID_activityIdentifier_galleryDataProvider_dataStore___block_invoke_134;
    block[3] = &unk_1E69806F8;
    double v9 = *(id *)(a1 + 32);
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);

    v7 = v9;
  }
}

uint64_t __111__PBFFocusPosterSelectionViewController_initWithActivityUUID_activityIdentifier_galleryDataProvider_dataStore___block_invoke_134(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1080) = 1;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1088), *(id *)(a1 + 40));
  uint64_t result = [*(id *)(a1 + 32) isViewLoaded];
  if (result)
  {
    BOOL v3 = CACurrentMediaTime() - *(double *)(a1 + 48) > 0.25;
    id v4 = *(void **)(a1 + 32);
    return [v4 _applySnapshotForCurrentStateWithAnimation:v3];
  }
  return result;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_editingSessionInProgressAssertion invalidate];
  editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
  self->_editingSessionInProgressAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBFFocusPosterSelectionViewController;
  [(PBFFocusPosterSelectionViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)PBFFocusPosterSelectionViewController;
  [(PBFFocusPosterSelectionViewController *)&v25 viewDidLoad];
  self->_initialLayoutOrientation = [(PBFFocusPosterSelectionViewController *)self pbf_layoutOrientation];
  BOOL v3 = [(PBFFocusPosterSelectionViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  id v5 = [(PBFFocusPosterSelectionViewController *)self navigationItem];
  id v6 = [(PBFFocusPosterSelectionViewController *)self _cancelBarButtonItem];
  [v5 setLeftBarButtonItem:v6];

  v7 = [(PBFFocusPosterSelectionViewController *)self navigationItem];
  double v8 = [(PBFFocusPosterSelectionViewController *)self _doneBarButtonItem];
  [v7 setRightBarButtonItem:v8];

  double v9 = [(PBFFocusPosterSelectionViewController *)self collectionView];
  [v9 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"Suggestion"];

  id v10 = [(PBFFocusPosterSelectionViewController *)self collectionView];
  [v10 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"Poster"];

  uint64_t v11 = [(PBFFocusPosterSelectionViewController *)self collectionView];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = *MEMORY[0x1E4FB2770];
  [v11 registerClass:v12 forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"Header"];

  id v14 = [(PBFFocusPosterSelectionViewController *)self collectionView];
  [v14 registerClass:objc_opt_class() forSupplementaryViewOfKind:v13 withReuseIdentifier:@"Masthead"];

  [(PBFFocusPosterSelectionViewController *)self _populateActivityMetadata];
  objc_initWeak(&location, self);
  id v15 = objc_alloc(MEMORY[0x1E4FB1598]);
  id v16 = [(PBFFocusPosterSelectionViewController *)self collectionView];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __52__PBFFocusPosterSelectionViewController_viewDidLoad__block_invoke;
  v22[3] = &unk_1E6980748;
  objc_copyWeak(&v23, &location);
  id v17 = (UICollectionViewDiffableDataSource *)[v15 initWithCollectionView:v16 cellProvider:v22];
  dataSource = self->_dataSource;
  self->_dataSource = v17;

  v19 = self->_dataSource;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52__PBFFocusPosterSelectionViewController_viewDidLoad__block_invoke_2;
  v20[3] = &unk_1E6980770;
  objc_copyWeak(&v21, &location);
  [(UICollectionViewDiffableDataSource *)v19 setSupplementaryViewProvider:v20];
  [(PBFFocusPosterSelectionViewController *)self _reloadDataWithAnimation:0];
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

id __52__PBFFocusPosterSelectionViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  double v9 = [WeakRetained _cellForItemAtIndexPath:v7 identifier:v6];

  return v9;
}

id __52__PBFFocusPosterSelectionViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_super v4 = (id *)(a1 + 32);
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = [WeakRetained _supplementaryViewAtIndexPath:v5];

  return v7;
}

- (int64_t)pbf_layoutOrientation
{
  v2 = [(PBFFocusPosterSelectionViewController *)self presentingViewController];
  int64_t v3 = [v2 interfaceOrientation];

  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)PBFFocusPosterSelectionViewController;
  id v7 = a4;
  -[PBFFocusPosterSelectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = [(PBFFocusPosterSelectionViewController *)self collectionView];
  double v9 = [v8 collectionViewLayout];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__PBFFocusPosterSelectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_1E6980798;
  id v12 = v9;
  uint64_t v13 = self;
  id v10 = v9;
  [v7 animateAlongsideTransition:v11 completion:&__block_literal_global_151];
}

uint64_t __92__PBFFocusPosterSelectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateLayout];
  v2 = *(void **)(a1 + 40);
  return [v2 _reloadDataWithAnimation:0];
}

- (id)_cancelBarButtonItem
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancel_];
  return v2;
}

- (id)_doneBarButtonItem
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
  return v2;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  dataSource = self->_dataSource;
  id v8 = a3;
  double v9 = -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:](dataSource, "sectionIdentifierForIndex:", [v6 section]);
  id v10 = [v8 cellForItemAtIndexPath:v6];

  if ([v9 isEqualToString:@"Create"])
  {
    uint64_t v11 = -[PBFFocusPosterSuggestionData objectAtIndexedSubscript:](self->_suggestionData, "objectAtIndexedSubscript:", [v6 row]);
    [(PBFFocusPosterSelectionViewController *)self _showEditingForPoster:v11 fromFocusPosterCell:v10];
LABEL_20:

    goto LABEL_21;
  }
  if ([v9 isEqualToString:@"Configured"])
  {
    uint64_t v11 = -[NSArray objectAtIndexedSubscript:](self->_configurations, "objectAtIndexedSubscript:", [v6 item]);
    id v12 = [(NSMapTable *)self->_configurationsToMetadata objectForKey:v11];
    int v13 = [v12 isChecked];
    if (v13)
    {
      [v12 setChecked:0];
      objc_super v14 = [v11 loadFocusConfigurationWithError:0];
      id v15 = v14;
      if (!v14
        || ([v14 activityUUID],
            id v16 = objc_claimAutoreleasedReturnValue(),
            int v17 = [v16 isEqual:self->_activityUUID],
            v16,
            v17))
      {
        [(NSMutableArray *)self->_nonFocusAssociatedConfigurations addObject:v11];
      }

      goto LABEL_18;
    }
    if ([(NSMutableArray *)self->_nonFocusAssociatedConfigurations count] == 1
      && [(NSMutableArray *)self->_nonFocusAssociatedConfigurations containsObject:v11])
    {
      id v18 = PBFLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_DEFAULT, "Cannot check checkbox because at least one Poster needs to be not associated with a focus.", buf, 2u);
      }

      v19 = (void *)MEMORY[0x1E4FB1418];
      v20 = PBFLocalizedString(@"CANNOT_SET_POSTER_FOCUS_ALERT_TITLE");
      id v21 = PBFLocalizedString(@"CANNOT_SET_POSTER_FOCUS_ALERT_MESSAGE");
      uint64_t v22 = [v19 alertControllerWithTitle:v20 message:v21 preferredStyle:1];

      id v23 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v24 = PBFLocalizedString(@"OK");
      objc_super v25 = [v23 actionWithTitle:v24 style:0 handler:0];

      [v22 addAction:v25];
      [(PBFFocusPosterSelectionViewController *)self presentViewController:v22 animated:1 completion:0];
    }
    else
    {
      CFTimeInterval v26 = [v12 otherFocusSymbolImageName];

      if (!v26)
      {
        [v12 setChecked:1];
        [(NSMutableArray *)self->_nonFocusAssociatedConfigurations removeObject:v11];
LABEL_18:
        [v10 setCheckboxOn:v13 ^ 1u];
        goto LABEL_19;
      }
      v37 = (void *)MEMORY[0x1E4FB1418];
      v27 = PBFLocalizedString(@"LINK_POSTER_CONFIRMATION_TITLE");
      v28 = NSString;
      v39 = PBFBundle();
      v29 = [v39 localizedStringForKey:@"LINK_POSTER_CONFIRMATION_MESSAGE" value:&stru_1F2A71F00 table:0];
      v30 = [v12 otherFocusDisplayName];
      v31 = objc_msgSend(v28, "localizedStringWithFormat:", v29, v30);
      v38 = [v37 alertControllerWithTitle:v27 message:v31 preferredStyle:1];

      v32 = (void *)MEMORY[0x1E4FB1410];
      v33 = PBFLocalizedString(@"CANCEL");
      objc_super v25 = [v32 actionWithTitle:v33 style:1 handler:0];

      v34 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v22 = v38;
      v35 = PBFLocalizedString(@"LINK");
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __81__PBFFocusPosterSelectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
      v40[3] = &unk_1E69807E0;
      id v41 = v12;
      v42 = self;
      id v43 = v11;
      id v44 = v10;
      v36 = [v34 actionWithTitle:v35 style:0 handler:v40];

      [v38 addAction:v25];
      [v38 addAction:v36];
      [(PBFFocusPosterSelectionViewController *)self presentViewController:v38 animated:1 completion:0];
    }
LABEL_19:

    goto LABEL_20;
  }
LABEL_21:
}

uint64_t __81__PBFFocusPosterSelectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setChecked:1];
  [*(id *)(a1 + 32) setOtherFocusSymbolImageName:0];
  [*(id *)(*(void *)(a1 + 40) + 1152) removeObject:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) setCheckboxOn:1];
  v2 = *(void **)(a1 + 56);
  return [v2 setFocusSymbolImageName:0];
}

- (void)_reloadDataWithAnimation:(BOOL)a3
{
  BOOL v39 = a3;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [(PBFPosterExtensionDataStore *)self->_dataStore switcherConfiguration];
  switcherConfiguration = self->_switcherConfiguration;
  self->_switcherConfiguration = v4;

  id v6 = [(PRSwitcherConfiguration *)self->_switcherConfiguration configurations];
  configurations = self->_configurations;
  self->_configurations = v6;

  id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  nonFocusAssociatedConfigurations = self->_nonFocusAssociatedConfigurations;
  self->_nonFocusAssociatedConfigurations = v8;

  id v10 = [MEMORY[0x1E4F62278] sharedActivityManager];
  id v44 = [v10 availableActivities];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v42 = [(UIViewController *)self pbf_displayContext];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obj = self->_configurations;
  uint64_t v45 = [(NSArray *)obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v45)
  {
    uint64_t v12 = *(void *)v55;
    uint64_t v40 = *(void *)v55;
    id v41 = v11;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v55 != v12) {
          objc_enumerationMutation(obj);
        }
        objc_super v14 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        id v15 = [v14 loadFocusConfigurationWithError:0];
        id v16 = [v14 _path];
        v46 = [v16 serverIdentity];

        int v17 = [(NSMapTable *)self->_configurationsToMetadata objectForKey:v14];
        if (!v17)
        {
          int v17 = objc_alloc_init(PBFFocusPosterConfigurationMetadata);
          [(NSMapTable *)self->_configurationsToMetadata setObject:v17 forKey:v14];
        }
        if (self->_activityUUID)
        {
          id v18 = [v15 activityUUID];
          uint64_t v19 = [v18 isEqual:self->_activityUUID];

          [(PBFFocusPosterConfigurationMetadata *)v17 setChecked:v19];
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __66__PBFFocusPosterSelectionViewController__reloadDataWithAnimation___block_invoke;
          v52[3] = &unk_1E6980808;
          id v53 = v15;
          v20 = objc_msgSend(v44, "bs_firstObjectPassingTest:", v52);
          id v21 = v20;
          if (v19)
          {
            [(PBFFocusPosterConfigurationMetadata *)v17 setOtherFocusSymbolImageName:0];
            [(PBFFocusPosterConfigurationMetadata *)v17 setOtherFocusDisplayName:0];
          }
          else
          {
            uint64_t v22 = [v20 activitySymbolImageName];
            [(PBFFocusPosterConfigurationMetadata *)v17 setOtherFocusSymbolImageName:v22];

            id v23 = [v21 activityDisplayName];
            [(PBFFocusPosterConfigurationMetadata *)v17 setOtherFocusDisplayName:v23];
          }
        }
        if (!v15) {
          [(NSMutableArray *)self->_nonFocusAssociatedConfigurations addObject:v14];
        }
        uint64_t v24 = v46;
        objc_super v25 = [v46 posterUUID];
        CFTimeInterval v26 = [v25 UUIDString];

        if (!v26)
        {
          v38 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"uuidString != nil"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[PBFFocusPosterSelectionViewController _reloadDataWithAnimation:]();
          }
          [v38 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1D31D3E28);
        }
        [v11 setObject:v14 forKey:v26];
        v27 = [(PBFFocusPosterConfigurationMetadata *)v17 cachedSnapshot];

        if (!v27)
        {
          dataStore = self->_dataStore;
          v29 = [v46 provider];
          v30 = [(PBFPosterExtensionDataStore *)dataStore providerForExtensionIdentifier:v29];

          v31 = [[PBFPosterConfigurationGalleryPreview alloc] initWithConfiguration:v14 extension:v30];
          [(PBFFocusPosterConfigurationMetadata *)v17 setPosterPreview:v31];
          v32 = self->_dataStore;
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __66__PBFFocusPosterSelectionViewController__reloadDataWithAnimation___block_invoke_193;
          v47[3] = &unk_1E6980858;
          id v33 = v42;
          id v48 = v33;
          v49 = self;
          v50 = v17;
          id v51 = v26;
          v34 = v32;
          uint64_t v24 = v46;
          id v35 = v33;
          id v11 = v41;
          [(PBFPosterExtensionDataStore *)v34 fetchGallerySnapshotForConfiguration:v14 context:v35 completion:v47];

          uint64_t v12 = v40;
        }
      }
      uint64_t v45 = [(NSArray *)obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v45);
  }

  v36 = (NSDictionary *)[v11 copy];
  uuidsToConfigurations = self->_uuidsToConfigurations;
  self->_uuidsToConfigurations = v36;

  [(PBFFocusPosterSelectionViewController *)self _applySnapshotForCurrentStateWithAnimation:v39];
}

uint64_t __66__PBFFocusPosterSelectionViewController__reloadDataWithAnimation___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 activityUniqueIdentifier];
  objc_super v4 = [*(id *)(a1 + 32) activityUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

void __66__PBFFocusPosterSelectionViewController__reloadDataWithAnimation___block_invoke_193(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PBFFocusPosterSelectionViewController__reloadDataWithAnimation___block_invoke_2;
  v12[3] = &unk_1E6980830;
  id v13 = v5;
  id v14 = v6;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  double v9 = *(void **)(a1 + 48);
  id v15 = v7;
  uint64_t v16 = v8;
  id v17 = v9;
  id v18 = *(id *)(a1 + 56);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __66__PBFFocusPosterSelectionViewController__reloadDataWithAnimation___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 48);
    int64_t v3 = objc_msgSend(*(id *)(a1 + 56), "pbf_displayContext");
    LOBYTE(v2) = [v2 isEqualToDisplayContext:v3];

    if (v2)
    {
      [*(id *)(a1 + 64) setCachedSnapshot:*(void *)(a1 + 32)];
      objc_super v4 = [*(id *)(*(void *)(a1 + 56) + 1064) indexPathForItemIdentifier:*(void *)(a1 + 72)];
      if (v4)
      {
        id v16 = v4;
        id v5 = [*(id *)(a1 + 56) collectionView];
        id v6 = [v5 cellForItemAtIndexPath:v16];

        [v6 setPosterImage:*(void *)(a1 + 32)];
        id v7 = [@"poster-uuid--" stringByAppendingString:*(void *)(a1 + 72)];
        [v6 setCheckboxAssociatedPosterIdentifier:v7];

        objc_super v4 = v16;
      }
    }
    else
    {
      id v15 = PBFLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D31CE000, v15, OS_LOG_TYPE_DEFAULT, "Focus Poster Selection: Display context changed. Will need to requery.", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v8 = PBFLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __66__PBFFocusPosterSelectionViewController__reloadDataWithAnimation___block_invoke_2_cold_1(a1, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)_applySnapshotForCurrentStateWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(PBFFocusPosterSuggestionData *)self->_suggestionData previews];
  id v6 = objc_msgSend(v5, "bs_compactMap:", &__block_literal_global_197);

  id v7 = [(NSArray *)self->_configurations bs_compactMap:&__block_literal_global_200];
  id v8 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  v15[0] = @"Masthead";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v8 appendSectionsWithIdentifiers:v9];

  if (self->_receivedSuggestionsResponse)
  {
    uint64_t v14 = @"Create";
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    [v8 appendSectionsWithIdentifiers:v10];

    if ([v6 count]) {
      [v8 appendItemsWithIdentifiers:v6];
    }
  }
  uint64_t v13 = @"Configured";
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  [v8 appendSectionsWithIdentifiers:v11];

  if (v7)
  {
    [v8 appendItemsWithIdentifiers:v7];
  }
  else
  {
    uint64_t v12 = PBFLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      [(PBFFocusPosterSelectionViewController *)&self->_configurations _applySnapshotForCurrentStateWithAnimation:v12];
    }
  }
  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v8 animatingDifferences:v3];
}

uint64_t __84__PBFFocusPosterSelectionViewController__applySnapshotForCurrentStateWithAnimation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 previewUniqueIdentifier];
}

id __84__PBFFocusPosterSelectionViewController__applySnapshotForCurrentStateWithAnimation___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 _path];
  BOOL v3 = [v2 serverIdentity];
  objc_super v4 = [v3 posterUUID];
  id v5 = [v4 UUIDString];

  return v5;
}

- (void)posterExtensionDataStoreDidUpdateConfigurations:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PBFFocusPosterSelectionViewController_posterExtensionDataStoreDidUpdateConfigurations___block_invoke;
  block[3] = &unk_1E69808C0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __89__PBFFocusPosterSelectionViewController_posterExtensionDataStoreDidUpdateConfigurations___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadDataWithAnimation:1];
}

- (id)_cellForItemAtIndexPath:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PBFFocusPosterSelectionViewController *)self collectionView];
  uint64_t v9 = -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:](self->_dataSource, "sectionIdentifierForIndex:", [v6 section]);
  int v10 = [v9 isEqualToString:@"Configured"];

  if (v10)
  {
    uint64_t v11 = [v8 dequeueReusableCellWithReuseIdentifier:@"Poster" forIndexPath:v6];
    uint64_t v12 = [(NSDictionary *)self->_uuidsToConfigurations objectForKey:v7];
    uint64_t v13 = [(NSMapTable *)self->_configurationsToMetadata objectForKey:v12];
    [v11 setLayoutOrientation:self->_initialLayoutOrientation];
    uint64_t v14 = [v13 cachedSnapshot];
    [v11 setPosterImage:v14];

    [v11 setPosterPreviewGenerator:self->_galleryDataProvider];
    id v15 = [v13 posterPreview];
    [v11 setPosterPreview:v15];

    [v11 setCheckboxAssociatedPosterIdentifier:v7];
    if (self->_activityUUID)
    {
      objc_msgSend(v11, "setCheckboxOn:", objc_msgSend(v13, "isChecked"));
      id v16 = [v13 otherFocusSymbolImageName];
      [v11 setFocusSymbolImageName:v16];
    }
    else
    {
      [v11 setCheckboxOn:0];
      [v11 setFocusSymbolImageName:0];
    }
    [v11 setActionType:1];
  }
  else
  {
    uint64_t v12 = [(PBFFocusPosterSuggestionData *)self->_suggestionData previewForUniqueIdentifier:v7];
    uint64_t v11 = [v8 dequeueReusableCellWithReuseIdentifier:@"Suggestion" forIndexPath:v6];
    [v11 setLayoutOrientation:self->_initialLayoutOrientation];
    [v11 setActionType:0];
    id v17 = [(PBFFocusPosterSuggestionData *)self->_suggestionData snapshotForPoster:v12];
    [v11 setPosterImage:v17];

    [v11 setPosterPreviewGenerator:self->_galleryDataProvider];
    [v11 setPosterPreview:v12];
  }

  return v11;
}

- (id)_supplementaryViewAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PBFFocusPosterSelectionViewController *)self collectionView];
  id v6 = -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:](self->_dataSource, "sectionIdentifierForIndex:", [v4 section]);
  int v7 = [v6 isEqualToString:@"Masthead"];
  uint64_t v8 = *MEMORY[0x1E4FB2770];
  if (!v7)
  {
    uint64_t v9 = [v5 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:@"Header" forIndexPath:v4];

    if ([v6 isEqualToString:@"Create"])
    {
      uint64_t v11 = PBFLocalizedString(@"CREATE_NEW_LOCK_SCREEN");
      [v9 setTitle:v11];

      if ([(PBFFocusPosterSuggestionData *)self->_suggestionData count]) {
        [(PBFFocusPosterSelectionViewController *)self _createLockScreenFromSuggestionsHeaderDescription];
      }
      else {
      uint64_t v12 = [(PBFFocusPosterSelectionViewController *)self _createLockScreenHeaderDescription];
      }
      [v9 setAttributedSubtitle:v12];

      int v10 = (_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__showGallery];
      [v9 addGestureRecognizer:v10];
    }
    else
    {
      if (![v6 isEqualToString:@"Configured"]) {
        goto LABEL_13;
      }
      PBFLocalizedString(@"CHOOSE_FROM_YOUR_LOCK_SCREENS");
      int v10 = (_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration *)objc_claimAutoreleasedReturnValue();
      [v9 setTitle:v10];
    }
    goto LABEL_12;
  }
  uint64_t v9 = [v5 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:@"Masthead" forIndexPath:v4];

  if (self->_activitySymbolColor && self->_activitySymbolImageName)
  {
    int v10 = [[_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration alloc] initWithKeyColor:self->_activitySymbolColor symbolImageName:self->_activitySymbolImageName];
    [v9 setConfiguration:v10];
LABEL_12:
  }
LABEL_13:

  return v9;
}

- (void)editingSceneViewControllerDidFinalize:(id)a3
{
  [(BSInvalidatable *)self->_editingSessionInProgressAssertion invalidate];
  editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
  self->_editingSessionInProgressAssertion = 0;
}

- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3
{
  id v6 = [(PBFFocusPosterSelectionViewController *)self delegate];
  if (v6)
  {
    uint64_t v8 = v6;
    [v6 topButtonLayoutForFocusPosterSelectionViewController:self];
    id v6 = v8;
  }
  else
  {
    retstr->trailingTopButtonFrame.origin = 0u;
    retstr->trailingTopButtonFrame.size = 0u;
    retstr->leadingTopButtonFrame.origin = 0u;
    retstr->leadingTopButtonFrame.size = 0u;
  }

  return result;
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void))a7;
  uint64_t v16 = objc_opt_class();
  id v17 = v12;
  if (v16)
  {
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }
  id v19 = v18;

  [v19 setGalleryDismissalAction:a4];
  [(BSInvalidatable *)self->_editingSessionInProgressAssertion invalidate];
  editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
  self->_editingSessionInProgressAssertion = 0;

  if (a4 == 1)
  {
    id v43 = v19;
    id v44 = (void (**)(void, id))v15;
    id v21 = [v14 suggestionMetadata];
    v42 = [v21 lastModifiedDate];

    uint64_t v22 = [v14 suggestionMetadata];
    uint64_t v23 = [v22 metadataBySettingLastModifiedDateToNow];

    if (!v23)
    {
      id v24 = objc_alloc(MEMORY[0x1E4F926D8]);
      objc_super v25 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v23 = [v24 initWithSuggestedGalleryItem:0 suggestedComplicationsByIdentifier:MEMORY[0x1E4F1CC08] lastModifiedDate:v25];
    }
    BOOL v39 = (void *)v23;
    id v41 = (void *)[v14 mutableCopy];
    [v41 setSuggestionMetadata:v23];
    uint64_t v40 = objc_alloc_init(PBFPosterEditingIngestionManager);
    [(PBFPosterEditingIngestionManager *)v40 setDelegate:self];
    id v26 = [(PBFPosterEditingIngestionManager *)v40 ingestConfiguration:v13 updatedConfiguredProperties:v41 editingViewController:v17 galleryViewController:0 showEditingConfirmation:1];
    id v45 = v14;
    v27 = [(PBFPosterExtensionDataStore *)self->_dataStore switcherConfiguration];
    id v46 = v13;
    v28 = (void *)[v27 mutableCopy];

    v29 = [v28 configurations];
    v30 = [v29 lastObject];

    v31 = (void *)[objc_alloc(MEMORY[0x1E4F92668]) initWithActivityIdentifier:self->_activityIdentifier activityUUID:self->_activityUUID];
    [v28 setFocusConfiguration:v31 forPosterConfiguration:v30];
    dataStore = self->_dataStore;
    id v47 = 0;
    id v33 = [(PBFPosterExtensionDataStore *)dataStore updateDataStoreForSwitcherConfiguration:v28 reason:@"Focus Poster Selection change focus configuration" error:&v47];
    id v34 = v47;
    id v35 = [v30 _path];
    v36 = [v35 serverIdentity];
    v37 = [v36 posterUUID];
    v38 = [v37 UUIDString];

    id v14 = v45;
    [(PBFFocusPosterSelectionViewController *)self _logEditWithEditingViewController:v17 posterUUID:v38 lastModifiedDate:v42];
    id v15 = (void (**)(id, void))v44;
    v44[2](v44, v34);

    id v13 = v46;
    id v19 = v43;
  }
  else
  {
    [v17 dismissViewControllerAnimated:1 completion:0];
    v15[2](v15, 0);
  }
}

- (void)_cancel:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F92450], "cancel", a3);
  id v5 = [(PBFFocusPosterSelectionViewController *)self delegate];
  [v5 focusPosterSelectionViewController:self willDismissWithResponse:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PBFFocusPosterSelectionViewController__cancel___block_invoke;
  v7[3] = &unk_1E69808E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PBFFocusPosterSelectionViewController *)self dismissViewControllerAnimated:1 completion:v7];
}

void __49__PBFFocusPosterSelectionViewController__cancel___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 focusPosterSelectionViewController:*(void *)(a1 + 32) didDismissWithResponse:*(void *)(a1 + 40)];
}

- (void)_done:(id)a3
{
  [(PBFFocusPosterSelectionViewController *)self _commitCheckedStates];
  id v4 = [MEMORY[0x1E4F92450] done];
  id v5 = [(PBFFocusPosterSelectionViewController *)self delegate];
  [v5 focusPosterSelectionViewController:self willDismissWithResponse:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__PBFFocusPosterSelectionViewController__done___block_invoke;
  v7[3] = &unk_1E69808E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PBFFocusPosterSelectionViewController *)self dismissViewControllerAnimated:1 completion:v7];
}

void __47__PBFFocusPosterSelectionViewController__done___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 focusPosterSelectionViewController:*(void *)(a1 + 32) didDismissWithResponse:*(void *)(a1 + 40)];
}

- (void)_commitCheckedStates
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Could not save focus configuration after checkbox action: %@", v2, v3, v4, v5, v6);
}

- (void)_showGallery
{
  id v8 = [[PBFPosterGalleryPreviewViewController alloc] initWithNibName:0 bundle:0];
  [(PBFPosterGalleryPreviewViewController *)v8 setDelegate:self];
  [(PBFPosterGalleryPreviewViewController *)v8 setEditingSceneDelegate:self];
  [(PBFPosterGalleryPreviewViewController *)v8 setDataProvider:self->_galleryDataProvider];
  uint64_t v3 = [(PBFPosterGalleryPreviewViewController *)v8 sheetPresentationController];
  +[PBFPosterGalleryPreviewViewController configureSheetPresentationController:v3];
  [(PBFFocusPosterSelectionViewController *)self presentViewController:v8 animated:1 completion:0];
  uint64_t v4 = [(PBFPosterExtensionDataStore *)self->_dataStore currentGalleryConfiguration];
  uint64_t v5 = [v4 suggestedLayout];

  if (v5)
  {
    uint8_t v6 = [MEMORY[0x1E4F4B040] sharedInstance];
    int v7 = [v5 proactiveRepresentation];
    [v6 logFaceGalleryDidAppearWithFaceGalleryConfiguration:v7];
  }
}

- (void)_showEditingForPoster:(id)a3 fromFocusPosterCell:(id)a4
{
  id v41 = a3;
  id v7 = a4;
  if (self->_editingSessionInProgressAssertion)
  {
    uint64_t v40 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_editingSessionInProgressAssertion == nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFFocusPosterSelectionViewController _showEditingForPoster:fromFocusPosterCell:]();
    }
    [v40 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    id v8 = v7;
    if ([(PBFPosterExtensionDataStore *)self->_dataStore canPersistNewPosterConfiguration])
    {
      uint64_t v9 = [v41 posterDescriptorLookupInfo];
      int v10 = [v9 posterDescriptorPath];

      uint64_t v11 = [v41 posterDescriptorLookupInfo];
      id v12 = [v11 posterDescriptorExtension];

      id v13 = (void *)MEMORY[0x1E4F924A8];
      id v14 = [v12 identity];
      id v15 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v16 = [v13 extensionInstanceForIdentity:v14 instanceIdentifier:v15];

      dataStore = self->_dataStore;
      id v18 = [v12 posterExtensionBundleIdentifier];
      id v19 = NSStringFromSelector(a2);
      v20 = [(PBFPosterExtensionDataStore *)dataStore acquireEditingSessionAssertionForProvider:v18 withReason:v19];
      editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
      self->_editingSessionInProgressAssertion = v20;

      uint64_t v22 = [PBFFocusEditingSceneViewController alloc];
      uint64_t v23 = objc_msgSend(MEMORY[0x1E4F92630], "pbf_configurableOptionsForPreview:", v41);
      id v24 = objc_msgSend(MEMORY[0x1E4F92640], "pbf_configuredPropertiesForPreview:", v41);
      objc_super v25 = [(PRSceneViewController *)v22 initWithProvider:v16 contents:v10 configurableOptions:v23 configuredProperties:v24];

      [(PREditingSceneViewController *)v25 setAcceptButtonType:1];
      [(PREditingSceneViewController *)v25 setDelegate:self];
      [(PREditingSceneViewController *)v25 addObserver:self];
      id v26 = [v8 contentView];
      [v8 posterPreviewFrame];
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      id v35 = [v8 window];
      objc_msgSend(v26, "convertRect:toCoordinateSpace:", v35, v28, v30, v32, v34);
      -[PBFFocusEditingSceneViewController setPosterPreviewFrame:](v25, "setPosterPreviewFrame:");

      v36 = [v8 posterView];
      v37 = [v36 snapshot];
      [(PBFFocusEditingSceneViewController *)v25 setGalleryPreviewView:v37];

      v38 = [v8 makeComplicationsPortalView];
      [(PBFFocusEditingSceneViewController *)v25 setPosterPreviewComplicationsView:v38];

      BOOL v39 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v25];
      [v39 setNavigationBarHidden:1 animated:0];
      [v39 setModalPresentationStyle:0];
      [v39 setTransitioningDelegate:self];
      [(PBFFocusPosterSelectionViewController *)self presentViewController:v39 animated:1 completion:0];
    }
    else
    {
      int v10 = [(PBFFocusPosterSelectionViewController *)self _posterLimitExceededAlert];
      [(PBFFocusPosterSelectionViewController *)self presentViewController:v10 animated:1 completion:0];
    }
  }
}

- (id)_createLockScreenFromSuggestionsHeaderDescription
{
  p_createLockScreensFromSuggestionsHeaderDescription = &self->_createLockScreensFromSuggestionsHeaderDescription;
  createLockScreensFromSuggestionsHeaderDescription = self->_createLockScreensFromSuggestionsHeaderDescription;
  if (createLockScreensFromSuggestionsHeaderDescription)
  {
    uint64_t v4 = createLockScreensFromSuggestionsHeaderDescription;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint8_t v6 = PBFLocalizedString(@"CREATE_NEW_LOCK_SCREEN_FROM_SUGGESTIONS_HEADER_DESCRIPTION");
    uint64_t v4 = (NSAttributedString *)[v5 initWithString:v6];

    id v7 = [(NSAttributedString *)v4 string];
    id v8 = PBFLocalizedString(@"CREATE_NEW_LOCK_SCREEN_HEADER_DESCRIPTION_GALLERY");
    uint64_t v9 = [v7 rangeOfString:v8];
    uint64_t v11 = v10;

    uint64_t v12 = *MEMORY[0x1E4FB0700];
    id v13 = [MEMORY[0x1E4FB1618] systemBlueColor];
    -[NSAttributedString addAttribute:value:range:](v4, "addAttribute:value:range:", v12, v13, v9, v11);

    objc_storeStrong((id *)p_createLockScreensFromSuggestionsHeaderDescription, v4);
  }
  return v4;
}

- (id)_createLockScreenHeaderDescription
{
  p_createLockScreensHeaderDescription = &self->_createLockScreensHeaderDescription;
  createLockScreensHeaderDescription = self->_createLockScreensHeaderDescription;
  if (createLockScreensHeaderDescription)
  {
    uint64_t v4 = createLockScreensHeaderDescription;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint8_t v6 = PBFLocalizedString(@"CREATE_NEW_LOCK_SCREEN_HEADER_DESCRIPTION");
    uint64_t v4 = (NSAttributedString *)[v5 initWithString:v6];

    id v7 = [(NSAttributedString *)v4 string];
    id v8 = PBFLocalizedString(@"CREATE_NEW_LOCK_SCREEN_HEADER_DESCRIPTION_GALLERY");
    uint64_t v9 = [v7 rangeOfString:v8];
    uint64_t v11 = v10;

    uint64_t v12 = *MEMORY[0x1E4FB0700];
    id v13 = [MEMORY[0x1E4FB1618] systemBlueColor];
    -[NSAttributedString addAttribute:value:range:](v4, "addAttribute:value:range:", v12, v13, v9, v11);

    objc_storeStrong((id *)p_createLockScreensHeaderDescription, v4);
  }
  return v4;
}

- (void)_populateActivityMetadata
{
}

- (void)_logEditWithEditingViewController:(id)a3 posterUUID:(id)a4 lastModifiedDate:(id)a5
{
  id v8 = a5;
  id v28 = a4;
  id v9 = a3;
  uint64_t v10 = [(PBFFocusPosterSelectionViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v12 = @"focusSettingsSuggestion";
  if (isKindOfClass) {
    uint64_t v12 = @"focusSettingsGallery";
  }
  id v13 = v12;

  id v29 = [v9 modifications];

  id v14 = objc_alloc(MEMORY[0x1E4F4B278]);
  [v8 timeIntervalSinceNow];
  double v16 = v15;

  uint64_t v17 = [v29 colorModified];
  char v18 = [v29 fontModified];
  char v19 = [v29 numberingSystemModified];
  char v20 = [v29 posterContentModified];
  char v21 = [v29 widgetsModified];
  char v22 = [v29 containedWidgetsBeforeEdit];
  uint64_t v23 = [v29 startDate];
  [v23 timeIntervalSinceNow];
  BYTE4(v27) = v22;
  BYTE3(v27) = v21;
  BYTE2(v27) = v20;
  BYTE1(v27) = v19;
  LOBYTE(v27) = v18;
  objc_super v25 = objc_msgSend(v14, "initWithLockscreenId:entryPoint:newlyCreated:secondsSinceLastEdit:outcome:userChangedColor:userChangedFont:userChangedNumberingSystem:userChangedPosterContent:userChangedWidgets:didLockscreenHaveWidgetsBeforeEdit:duration:", v28, v13, 1, (uint64_t)-v16, @"accepted", v17, v27, (unint64_t)-v24);

  id v26 = [MEMORY[0x1E4F4B040] sharedInstance];
  [v26 logPosterEdit:v25 completion:&__block_literal_global_259];
}

void __103__PBFFocusPosterSelectionViewController__logEditWithEditingViewController_posterUUID_lastModifiedDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = PBFLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __103__PBFFocusPosterSelectionViewController__logEditWithEditingViewController_posterUUID_lastModifiedDate___block_invoke_cold_1();
    }
  }
}

- (id)_posterLimitExceededAlert
{
  id v2 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v3 = PBFLocalizedString(@"TOO_MANY_CONFIGURATIONS_TITLE");
  uint64_t v4 = PBFLocalizedString(@"TOO_MANY_CONFIGURATIONS_MESSAGE");
  id v5 = [v2 alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  uint8_t v6 = (void *)MEMORY[0x1E4FB1410];
  id v7 = PBFLocalizedString(@"OK");
  id v8 = [v6 actionWithTitle:v7 style:0 handler:0];
  [v5 addAction:v8];

  return v5;
}

- (void)galleryViewController:(id)a3 didSelectPreview:(id)a4 fromPreviewView:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(PBFPosterExtensionDataStore *)self->_dataStore canPersistNewPosterConfiguration])
  {
    [v11 presentPreview:v8 withMode:2 fromView:v9];
  }
  else
  {
    uint64_t v10 = [(PBFFocusPosterSelectionViewController *)self _posterLimitExceededAlert];
    [v11 presentViewController:v10 animated:1 completion:0];
  }
}

- (id)galleryViewController:(id)a3 willUseAnimationController:(id)a4 forDismissingEditingViewControllerWithAction:(int64_t)a5
{
  editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
  id v8 = a4;
  [(BSInvalidatable *)editingSessionInProgressAssertion invalidate];
  id v9 = self->_editingSessionInProgressAssertion;
  self->_editingSessionInProgressAssertion = 0;

  if (a5 == 1) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v8;
  }
  id v11 = v10;

  return v11;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7 = a3;
  if (a5 == self
    && (self,
        id v8 = objc_claimAutoreleasedReturnValue(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        (isKindOfClass & 1) != 0))
  {
    uint64_t v10 = [v7 bottomViewController];
    uint64_t v11 = objc_opt_class();
    id v12 = v10;
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        id v13 = v12;
      }
      else {
        id v13 = 0;
      }
    }
    else
    {
      id v13 = 0;
    }
    id v16 = v13;

    [v16 posterPreviewFrame];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    objc_super v25 = [v16 galleryPreviewView];
    id v26 = [v16 posterPreviewComplicationsView];

    uint64_t v27 = [PBFEditingZoomUpAnimationController alloc];
    +[PBFFocusPosterCell cornerRadius];
    id v14 = -[PBFEditingZoomAnimationController initWithPreviewFrame:previewCornerRadius:previewView:complicationsView:](v27, "initWithPreviewFrame:previewCornerRadius:previewView:complicationsView:", v25, v26, v18, v20, v22, v24, v28);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v3 = a3;
  uint64_t v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint8_t v6 = [v3 bottomViewController];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
    id v11 = v9;

    if ([v11 galleryDismissalAction] == 1)
    {
      uint64_t v10 = 0;
    }
    else
    {
      +[PBFFocusPosterCell cornerRadius];
      double v13 = v12;
      [v11 posterPreviewFrame];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v22 = [v11 galleryPreviewView];
      double v23 = [v11 posterPreviewComplicationsView];
      uint64_t v10 = -[PBFEditingZoomAnimationController initWithPreviewFrame:previewCornerRadius:previewView:complicationsView:]([PBFEditingZoomDownAnimationController alloc], "initWithPreviewFrame:previewCornerRadius:previewView:complicationsView:", v22, v23, v15, v17, v19, v21, v13);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)editingIngestionManager:(id)a3 didAccept:(id)a4 userChoice:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    double v12 = [MEMORY[0x1E4F92450] done];
    double v13 = [(PBFFocusPosterSelectionViewController *)self delegate];
    [v13 focusPosterSelectionViewController:self willDismissWithResponse:v12];

    double v14 = [(PBFFocusPosterSelectionViewController *)self presentingViewController];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __86__PBFFocusPosterSelectionViewController_editingIngestionManager_didAccept_userChoice___block_invoke;
    v27[3] = &unk_1E69808E8;
    v27[4] = self;
    id v28 = v12;
    id v15 = v12;
    [v14 dismissViewControllerAnimated:1 completion:v27];

LABEL_8:
    return;
  }
  [v8 dismissViewController];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = [(PBFFocusPosterSelectionViewController *)self delegate];
  id v11 = v10;
  if (v10)
  {
    [v10 topButtonLayoutForFocusPosterSelectionViewController:self];
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
  }

  v22[0] = v23;
  v22[1] = v24;
  v22[2] = v25;
  v22[3] = v26;
  double v16 = +[PBFPosterRackCollectionViewController simplifiedHomeScreenSwitcherFor:v9 delegate:self topButtonLayout:v22];
  double v17 = [v8 editingViewController];
  double v18 = [v17 navigationController];

  if (v18)
  {
    double v19 = [v8 editingViewController];
    double v20 = [v19 navigationController];
    [v20 pushViewController:v16 animated:1];

    goto LABEL_8;
  }
  double v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[manager editingViewController] navigationController]"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[PBFFocusPosterSelectionViewController editingIngestionManager:didAccept:userChoice:]();
  }
  [v21 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __86__PBFFocusPosterSelectionViewController_editingIngestionManager_didAccept_userChoice___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 focusPosterSelectionViewController:*(void *)(a1 + 32) didDismissWithResponse:*(void *)(a1 + 40)];
}

- (BOOL)posterRackCollectionViewControllerDidPressDone:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F92450], "done", a3);
  id v5 = [(PBFFocusPosterSelectionViewController *)self delegate];
  [v5 focusPosterSelectionViewController:self willDismissWithResponse:v4];

  uint8_t v6 = [(PBFFocusPosterSelectionViewController *)self presentingViewController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__PBFFocusPosterSelectionViewController_posterRackCollectionViewControllerDidPressDone___block_invoke;
  v9[3] = &unk_1E69808E8;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  [v6 dismissViewControllerAnimated:1 completion:v9];

  return 1;
}

void __88__PBFFocusPosterSelectionViewController_posterRackCollectionViewControllerDidPressDone___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 focusPosterSelectionViewController:*(void *)(a1 + 32) didDismissWithResponse:*(void *)(a1 + 40)];
}

- (void)posterRackCollectionViewControllerDidPressCancel:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F92450], "cancel", a3);
  id v5 = [(PBFFocusPosterSelectionViewController *)self delegate];
  [v5 focusPosterSelectionViewController:self willDismissWithResponse:v4];

  uint8_t v6 = [(PBFFocusPosterSelectionViewController *)self presentingViewController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __90__PBFFocusPosterSelectionViewController_posterRackCollectionViewControllerDidPressCancel___block_invoke;
  v8[3] = &unk_1E69808E8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 dismissViewControllerAnimated:1 completion:v8];
}

void __90__PBFFocusPosterSelectionViewController_posterRackCollectionViewControllerDidPressCancel___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 focusPosterSelectionViewController:*(void *)(a1 + 32) didDismissWithResponse:*(void *)(a1 + 40)];
}

- (PBFFocusPosterSelectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBFFocusPosterSelectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nonFocusAssociatedConfigurations, 0);
  objc_storeStrong((id *)&self->_configurationsToMetadata, 0);
  objc_storeStrong((id *)&self->_uuidsToConfigurations, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_switcherConfiguration, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_createLockScreensHeaderDescription, 0);
  objc_storeStrong((id *)&self->_createLockScreensFromSuggestionsHeaderDescription, 0);
  objc_storeStrong((id *)&self->_suggestionData, 0);
  objc_storeStrong((id *)&self->_editingSessionInProgressAssertion, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_galleryDataProvider, 0);
  objc_storeStrong((id *)&self->_activitySymbolColor, 0);
  objc_storeStrong((id *)&self->_activitySymbolImageName, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
}

void __60__PBFFocusPosterSelectionViewController_compositionalLayout__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 48));
  id v2 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

- (void)initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithActivityUUID:activityIdentifier:galleryDataProvider:dataStore:.cold.5()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1D31CE000, v0, OS_LOG_TYPE_DEBUG, "Creating PBFFocusPosterSelectionViewController with UUID: %@", v1, 0xCu);
}

void __111__PBFFocusPosterSelectionViewController_initWithActivityUUID_activityIdentifier_galleryDataProvider_dataStore___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Could not get Proactive suggestions for Focus poster selection: %@", v2, v3, v4, v5, v6);
}

- (void)_reloadDataWithAnimation:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __66__PBFFocusPosterSelectionViewController__reloadDataWithAnimation___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_applySnapshotForCurrentStateWithAnimation:(os_log_t)log .cold.1(void *a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = @"NOT ";
  if (*a1) {
    uint64_t v4 = @"NOT ";
  }
  else {
    uint64_t v4 = &stru_1F2A71F00;
  }
  if (!*(void *)(a2 + 1120)) {
    uint64_t v3 = &stru_1F2A71F00;
  }
  int v5 = 138412546;
  uint64_t v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  _os_log_fault_impl(&dword_1D31CE000, log, OS_LOG_TYPE_FAULT, "PBFFocusPosterSelectionViewController: Invalid state: _configurations is %@nil, _switcherConfiguration is %@nil", (uint8_t *)&v5, 0x16u);
}

- (void)_showEditingForPoster:fromFocusPosterCell:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __103__PBFFocusPosterSelectionViewController__logEditWithEditingViewController_posterUUID_lastModifiedDate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Error logging poster edit: %@", v2, v3, v4, v5, v6);
}

- (void)editingIngestionManager:didAccept:userChoice:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end