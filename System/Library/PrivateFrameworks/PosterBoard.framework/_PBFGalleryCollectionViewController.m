@interface _PBFGalleryCollectionViewController
- (BOOL)_reloadCellForPosterPreviewIfVisible:(id)a3;
- (CGRect)previewFrameForScrollingPreviewWithIdentifierToVisible:(id)a3;
- (PBFApplicationStateMonitor)applicationStateMonitor;
- (PBFPosterGalleryDataProvider)dataProvider;
- (UIViewController)hostingViewController;
- (_PBFGalleryCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_PBFGalleryCollectionViewControllerDelegate)delegate;
- (void)_applySnapshotFromDataProvider:(id)a3;
- (void)_kickstartAssetHelperIfPossible;
- (void)_purgeSnapshots;
- (void)_resetState;
- (void)_updateAssetHelperActiveContexts:(BOOL)a3;
- (void)assetHelper:(id)a3 didUpdateAssetsForPosterPreview:(id)a4;
- (void)assetHelper:(id)a3 posterPreview:(id)a4 teardownLiveViewController:(id)a5;
- (void)assetHelper:(id)a3 prepareForPosterPreview:(id)a4 movingToLive:(id)a5;
- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)configureCell:(id)a3 forCollectionView:(id)a4 posterPreview:(id)a5 indexPath:(id)a6;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setApplicationStateMonitor:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHostingViewController:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _PBFGalleryCollectionViewController

- (_PBFGalleryCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_PBFGalleryCollectionViewController;
  v3 = [(_PBFGalleryCollectionViewController *)&v7 initWithCollectionViewLayout:a3];
  if (v3)
  {
    v4 = [[PBFApplicationStateNode alloc] initWithDescription:@"Gallery Collection View Controller"];
    state = v3->_state;
    v3->_state = v4;
  }
  return v3;
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)_PBFGalleryCollectionViewController;
  [(_PBFGalleryCollectionViewController *)&v18 viewDidLoad];
  v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  displayedCellForIndexPath = self->_displayedCellForIndexPath;
  self->_displayedCellForIndexPath = v3;

  v5 = [(_PBFGalleryCollectionViewController *)self collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kGalleryPosterCellReuseIdentifier"];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kGalleryPosterHeroCellReuseIdentifier"];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kGalleryPosterCellWithComplicationsReuseIdentifier"];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kGalleryPosterSmartAlbumCellReuseIdentifier"];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kGalleryPosterCellWithDescriptionReuseIdentifier"];
  [v5 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"KGalleryHeaderElementKind" withReuseIdentifier:@"KGalleryHeaderElementKind"];
  if (PRIsLowQualityDevice())
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    objc_super v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v8 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_360];
    [v7 setBackgroundColor:v8];
    [v5 setBackgroundView:v7];
  }
  else
  {
    objc_super v7 = objc_msgSend(MEMORY[0x1E4F743C8], "pbf_materialView");
    [v7 setGroupNameBase:@"Gallery-Sheet"];
    [v5 setBackgroundView:v7];
  }

  [v5 setShowsVerticalScrollIndicator:0];
  if (!self->_diffableDataSource)
  {
    objc_initWeak(&location, self);
    id v9 = objc_alloc(MEMORY[0x1E4FB1598]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50___PBFGalleryCollectionViewController_viewDidLoad__block_invoke_2;
    v15[3] = &unk_1E69820F0;
    objc_copyWeak(&v16, &location);
    v10 = (UICollectionViewDiffableDataSource *)[v9 initWithCollectionView:v5 cellProvider:v15];
    diffableDataSource = self->_diffableDataSource;
    self->_diffableDataSource = v10;

    v12 = self->_diffableDataSource;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50___PBFGalleryCollectionViewController_viewDidLoad__block_invoke_3;
    v13[3] = &unk_1E6980770;
    objc_copyWeak(&v14, &location);
    [(UICollectionViewDiffableDataSource *)v12 setSupplementaryViewProvider:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  [(_PBFGalleryCollectionViewController *)self _updateAssetHelperActiveContexts:1];
}

- (void)setHostingViewController:(id)a3
{
  p_hostingViewController = &self->_hostingViewController;
  id v5 = a3;
  objc_storeWeak((id *)p_hostingViewController, v5);
  id v13 = [v5 view];

  containerView = self->_containerView;
  if (!containerView)
  {
    [v13 bounds];
    v11 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v7, v8, v9, v10);
    v12 = self->_containerView;
    self->_containerView = v11;

    [(UIView *)self->_containerView _setLayoutDebuggingIdentifier:@"PBFPosterGalleryPreviewViewController Container View"];
    [(UIView *)self->_containerView setHidden:1];
    [(UIView *)self->_containerView setUserInteractionEnabled:0];
    containerView = self->_containerView;
  }
  [v13 addSubview:containerView];
  [v13 sendSubviewToBack:self->_containerView];
}

- (void)setDataProvider:(id)a3
{
  id v5 = (PBFPosterGalleryDataProvider *)a3;
  p_dataProvider = &self->_dataProvider;
  dataProvider = self->_dataProvider;
  if (dataProvider != v5)
  {
    v12 = v5;
    [(PBFPosterGalleryDataProvider *)dataProvider removeObserver:self];
    [(PBFPosterGalleryDataProvider *)*p_dataProvider invalidate];
    [(PBFPosterGalleryAssetHelper *)self->_assetHelper invalidate];
    objc_storeStrong((id *)&self->_dataProvider, a3);
    [(PBFPosterGalleryDataProvider *)*p_dataProvider addObserver:self];
    if (v12)
    {
      double v8 = [[PBFPosterGalleryAssetHelper alloc] initWithPreviewGenerator:*p_dataProvider extensionInstanceProvider:v12];
      assetHelper = self->_assetHelper;
      self->_assetHelper = v8;

      [(PBFPosterGalleryAssetHelper *)self->_assetHelper setDelegate:self];
      if ([(_PBFGalleryCollectionViewController *)self isViewLoaded]) {
        [(_PBFGalleryCollectionViewController *)self _updateAssetHelperActiveContexts:1];
      }
      double v10 = self->_assetHelper;
      v11 = [(PBFPosterGalleryDataProvider *)*p_dataProvider posterPreviews];
      [(PBFPosterGalleryAssetHelper *)v10 setPosterPreviews:v11];

      if ([(_PBFGalleryCollectionViewController *)self bs_isAppearingOrAppeared])[(PBFPosterGalleryAssetHelper *)self->_assetHelper setSuspended:0]; {
    }
      }
    [(_PBFGalleryCollectionViewController *)self _applySnapshotFromDataProvider:*p_dataProvider];
    id v5 = v12;
  }
}

- (void)setApplicationStateMonitor:(id)a3
{
  id v5 = a3;
  if ((-[PBFApplicationStateMonitor isEqual:](self->_applicationStateMonitor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_applicationStateMonitor, a3);
    if ([(_PBFGalleryCollectionViewController *)self bs_isAppearingOrAppeared])
    {
      [(_PBFGalleryCollectionViewController *)self _resetState];
      [v5 pushState:self->_state];
    }
  }
}

- (void)_updateAssetHelperActiveContexts:(BOOL)a3
{
  if (a3) {
    [(PBFPosterGalleryAssetHelper *)self->_assetHelper resetKnownDisplayContexts];
  }
  v4 = [(UIViewController *)self pbf_displayContext];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  double v8 = __72___PBFGalleryCollectionViewController__updateAssetHelperActiveContexts___block_invoke;
  double v9 = &unk_1E6982118;
  id v10 = v4;
  v11 = self;
  id v5 = v4;
  PBFSnapshotDefinitionEnumerateSupportedOrientationsForCurrentDeviceClass(&v6);
  -[PBFPosterGalleryAssetHelper setActiveDisplayContext:](self->_assetHelper, "setActiveDisplayContext:", v5, v6, v7, v8, v9);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PBFGalleryCollectionViewController;
  [(_PBFGalleryCollectionViewController *)&v4 viewWillAppear:a3];
  [(_PBFGalleryCollectionViewController *)self _applySnapshotFromDataProvider:self->_dataProvider];
  [(PBFApplicationStateMonitor *)self->_applicationStateMonitor pushState:self->_state];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PBFGalleryCollectionViewController;
  [(_PBFGalleryCollectionViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(_PBFGalleryCollectionViewController *)self collectionView];
  [v4 setPrefetchingEnabled:0];

  [(PBFPosterGalleryAssetHelper *)self->_assetHelper setSuspended:1];
  [(PBFPosterGalleryAssetHelper *)self->_assetHelper setActiveDisplayContext:0];
  [(_PBFGalleryCollectionViewController *)self _purgeSnapshots];
  [(PBFApplicationStateNode *)self->_state cancel];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PBFGalleryCollectionViewController;
  [(_PBFGalleryCollectionViewController *)&v4 viewIsAppearing:a3];
  [(_PBFGalleryCollectionViewController *)self _kickstartAssetHelperIfPossible];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)_PBFGalleryCollectionViewController;
  id v7 = a4;
  -[_PBFGalleryCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = [(_PBFGalleryCollectionViewController *)self collectionView];
  double v9 = [v8 collectionViewLayout];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90___PBFGalleryCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v12[3] = &unk_1E6982140;
  v12[4] = self;
  id v13 = v9;
  id v14 = v8;
  id v10 = v8;
  id v11 = v9;
  [v7 animateAlongsideTransition:v12 completion:&__block_literal_global_383];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PBFGalleryCollectionViewController;
  [(_PBFGalleryCollectionViewController *)&v4 traitCollectionDidChange:a3];
  [(_PBFGalleryCollectionViewController *)self _updateAssetHelperActiveContexts:1];
}

- (CGRect)previewFrameForScrollingPreviewWithIdentifierToVisible:(id)a3
{
  objc_super v4 = [(UICollectionViewDiffableDataSource *)self->_diffableDataSource indexPathForItemIdentifier:a3];
  if (!v4) {
    goto LABEL_5;
  }
  objc_super v5 = [(_PBFGalleryCollectionViewController *)self collectionView];
  uint64_t v6 = [v5 cellForItemAtIndexPath:v4];
  if (!v6)
  {

LABEL_5:
    double v14 = *MEMORY[0x1E4F1DB20];
    double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    goto LABEL_6;
  }
  id v7 = (void *)v6;
  double v8 = [v5 window];
  double v9 = [v8 screen];
  id v10 = +[PBFPosterGalleryViewSpec specForScreen:v9];

  [v10 sectionHeaderBottomSpacing];
  id v11 = [v10 sectionHeaderTitleFont];
  [v11 lineHeight];

  [v7 frame];
  UIRectInset();
  objc_msgSend(v5, "scrollRectToVisible:animated:", 0);
  v12 = [v7 posterPreviewView];
  [v12 posterPreviewFrame];
  objc_msgSend(v12, "convertRect:toCoordinateSpace:", v5);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

LABEL_6:
  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)_kickstartAssetHelperIfPossible
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(_PBFGalleryCollectionViewController *)self isViewLoaded]
    && [(PBFPosterGalleryAssetHelper *)self->_assetHelper isSuspended])
  {
    assetHelper = self->_assetHelper;
    objc_super v4 = [(UIViewController *)self pbf_displayContext];
    [(PBFPosterGalleryAssetHelper *)assetHelper setActiveDisplayContext:v4];

    [(PBFPosterGalleryAssetHelper *)self->_assetHelper setSuspended:0];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v5 = [(_PBFGalleryCollectionViewController *)self collectionView];
    uint64_t v6 = [v5 indexPathsForVisibleItems];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          dataProvider = self->_dataProvider;
          v12 = [(UICollectionViewDiffableDataSource *)self->_diffableDataSource itemIdentifierForIndexPath:*(void *)(*((void *)&v14 + 1) + 8 * v10)];
          double v13 = [(PBFPosterGalleryDataProvider *)dataProvider previewForPreviewUniqueIdentifier:v12];

          [(PBFPosterGalleryAssetHelper *)self->_assetHelper updatePosterPreview:v13 isVisible:1];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (void)_applySnapshotFromDataProvider:(id)a3
{
  id v9 = a3;
  if ([(_PBFGalleryCollectionViewController *)self isViewLoaded])
  {
    int v4 = [(_PBFGalleryCollectionViewController *)self bs_isAppearingOrAppeared];
    if (v9)
    {
      if (v4)
      {
        objc_super v5 = [(UICollectionViewDiffableDataSource *)self->_diffableDataSource snapshot];
        uint64_t v6 = [v9 buildSnapshot];
        if (!v5 || ([v5 isEqual:v6] & 1) == 0)
        {
          assetHelper = self->_assetHelper;
          uint64_t v8 = [(PBFPosterGalleryDataProvider *)self->_dataProvider posterPreviews];
          [(PBFPosterGalleryAssetHelper *)assetHelper setPosterPreviews:v8];

          [(UICollectionViewDiffableDataSource *)self->_diffableDataSource applySnapshotUsingReloadData:v6];
          [(_PBFGalleryCollectionViewController *)self _resetState];
        }
      }
    }
  }
}

- (void)_purgeSnapshots
{
  v3 = (void *)MEMORY[0x1D9433EF0](self, a2);
  diffableDataSource = self->_diffableDataSource;
  objc_super v5 = objc_opt_new();
  [(UICollectionViewDiffableDataSource *)diffableDataSource applySnapshotUsingReloadData:v5];

  [(PBFPosterGalleryDataProvider *)self->_dataProvider invalidate];
  [(PBFPosterGalleryAssetHelper *)self->_assetHelper cancel];
}

- (void)_resetState
{
  state = self->_state;
  id v4 = [(PBFPosterGalleryDataProvider *)self->_dataProvider posterPreviews];
  v3 = objc_msgSend(v4, "bs_map:", &__block_literal_global_389);
  [(PBFApplicationStateNode *)state setComponents:v3];
}

- (void)configureCell:(id)a3 forCollectionView:(id)a4 posterPreview:(id)a5 indexPath:(id)a6
{
  id v67 = a3;
  id v9 = a5;
  id v10 = a6;
  id v11 = [(PBFPosterGalleryAssetHelper *)self->_assetHelper activeDisplayContext];
  v12 = [(UIViewController *)self pbf_displayContext];
  char v13 = [v11 isEqualToDisplayContext:v12];

  if ((v13 & 1) == 0) {
    [(_PBFGalleryCollectionViewController *)self _updateAssetHelperActiveContexts:0];
  }
  int64_t v14 = [(UIViewController *)self pbf_layoutOrientation];
  long long v15 = [(PBFPosterGalleryAssetHelper *)self->_assetHelper assetsForPosterPreview:v9];
  long long v16 = v15;
  if (!v15)
  {
    v26 = [v9 type];
    objc_msgSend(v67, "updatePreviewType:scale:posterPreviewView:layoutOrientation:index:", v26, 0, v14, objc_msgSend(v10, "row"), 1.0);

    double v18 = [v67 contentView];
    uint64_t v19 = [v18 layer];
    [v19 setBorderWidth:0.0];
    goto LABEL_18;
  }
  long long v17 = v10;
  double v18 = [v15 imageView];
  uint64_t v19 = [v16 liveViewController];
  uint64_t v20 = [v19 view];
  double v21 = (void *)v20;
  if (v20) {
    double v22 = (void *)v20;
  }
  else {
    double v22 = v18;
  }
  id v23 = v22;

  double v24 = [v23 superview];
  containerView = self->_containerView;

  if (v24 == containerView) {
    [v23 setNeedsLayout];
  }
  else {
    [(UIView *)self->_containerView addSubview:v23];
  }
  id v10 = v17;
  v27 = [v9 type];
  objc_msgSend(v67, "updatePreviewType:scale:posterPreviewView:layoutOrientation:index:", v27, v23, v14, objc_msgSend(v17, "row"), 1.0);

  int v28 = PBFDebugLiveWallpapers();
  if (v19)
  {
    if (v28)
    {
      v29 = [v67 contentView];
      v30 = [v29 layer];
      v31 = v30;
      double v32 = 1.0;
LABEL_16:
      [v30 setBorderWidth:v32];
    }
  }
  else if (v28)
  {
    v29 = [v67 contentView];
    v30 = [v29 layer];
    v31 = v30;
    double v32 = 0.0;
    goto LABEL_16;
  }

LABEL_18:
  v33 = [v67 posterPreviewView];
  v34 = [v33 complicationContentView];

  v35 = [v34 posterPreview];
  char v36 = [v35 isEqual:v9];

  if ((v36 & 1) == 0)
  {
    [v34 setPosterPreview:v9];
    [v34 prepareComplicationPreviewWithGenerator:self->_dataProvider];
  }
  v37 = [v9 galleryLocalizedTitle];
  if (![v37 length]) {
    goto LABEL_29;
  }
  int v38 = [v67 supportsPosterTitle];

  if (v38)
  {
    v39 = [v9 galleryOptions];
    v37 = [v39 modeSymbolImageName];

    if (v37)
    {
      v66 = v16;
      uint64_t v40 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28F0] scale:1];
      id v65 = objc_alloc_init(MEMORY[0x1E4FB0870]);
      v41 = [(_PBFGalleryCollectionViewController *)self view];
      v42 = [v41 window];
      v43 = [v42 screen];
      v44 = +[PBFPosterGalleryViewSpec specForScreen:v43];

      v64 = (void *)v40;
      v45 = [MEMORY[0x1E4FB1818] _systemImageNamed:v37 withConfiguration:v40];
      v63 = v44;
      v46 = [v44 previewCellLabelColor];
      v47 = [v45 imageWithTintColor:v46];
      [v65 setImage:v47];

      v48 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v65];
      id v49 = objc_alloc(MEMORY[0x1E4F28B18]);
      v50 = [v9 galleryLocalizedTitle];
      v51 = (void *)[v49 initWithString:v50];

      v52 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"%@ %@"];
      v53 = [(_PBFGalleryCollectionViewController *)self traitCollection];
      uint64_t v54 = [v53 layoutDirection];

      id v55 = objc_alloc(MEMORY[0x1E4F28B18]);
      if (v54 == 1) {
        uint64_t v56 = objc_msgSend(v55, "initWithFormat:options:locale:", v52, 0, 0, v51, v48);
      }
      else {
        uint64_t v56 = objc_msgSend(v55, "initWithFormat:options:locale:", v52, 0, 0, v48, v51);
      }
      v58 = (void *)v56;
      [v67 setAttributedPosterTitle:v56];

      long long v16 = v66;
      v57 = v64;
    }
    else
    {
      v57 = [v9 galleryLocalizedTitle];
      [v67 setPosterTitle:v57];
    }

LABEL_29:
  }
  uint64_t v59 = [v9 galleryLocalizedDescription];
  if (v59)
  {
    v60 = (void *)v59;
    int v61 = [v67 supportsPosterDescription];

    if (v61)
    {
      v62 = [v9 galleryLocalizedDescription];
      [v67 setPosterDescription:v62];
    }
  }
}

- (void)assetHelper:(id)a3 didUpdateAssetsForPosterPreview:(id)a4
{
}

- (void)assetHelper:(id)a3 prepareForPosterPreview:(id)a4 movingToLive:(id)a5
{
  p_hostingViewController = &self->_hostingViewController;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_hostingViewController);
  objc_msgSend(WeakRetained, "bs_addChildViewController:withSuperview:", v7, self->_containerView);
}

- (void)assetHelper:(id)a3 posterPreview:(id)a4 teardownLiveViewController:(id)a5
{
  p_hostingViewController = &self->_hostingViewController;
  id v8 = a5;
  id v11 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_hostingViewController);
  objc_msgSend(WeakRetained, "bs_removeChildViewController:", v8);

  id v10 = [v8 view];

  [v10 removeFromSuperview];
  [(_PBFGalleryCollectionViewController *)self _reloadCellForPosterPreviewIfVisible:v11];
}

- (BOOL)_reloadCellForPosterPreviewIfVisible:(id)a3
{
  id v4 = a3;
  diffableDataSource = self->_diffableDataSource;
  uint64_t v6 = [v4 previewUniqueIdentifier];
  id v7 = [(UICollectionViewDiffableDataSource *)diffableDataSource indexPathForItemIdentifier:v6];

  if (v7)
  {
    id v8 = [(NSMapTable *)self->_displayedCellForIndexPath objectForKey:v7];
    BOOL v9 = v8 != 0;
    if (v8)
    {
      id v10 = [(_PBFGalleryCollectionViewController *)self collectionView];
      [(_PBFGalleryCollectionViewController *)self configureCell:v8 forCollectionView:v10 posterPreview:v4 indexPath:v7];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v17 = [a3 cellForItemAtIndexPath:v6];
  dataProvider = self->_dataProvider;
  id v8 = [(UICollectionViewDiffableDataSource *)self->_diffableDataSource itemIdentifierForIndexPath:v6];

  BOOL v9 = [(PBFPosterGalleryDataProvider *)dataProvider previewForPreviewUniqueIdentifier:v8];

  id v10 = [v9 type];
  if (([v10 isEqualToString:PBFPreviewTypeHero] & 1) == 0)
  {
    uint64_t v11 = [v9 presentationStyle];

    if (v11 == 1) {
      goto LABEL_7;
    }
    id v10 = [(PBFPosterGalleryAssetHelper *)self->_assetHelper assetsForPosterPreview:v9];
    v12 = [v10 keyFrameImage];
    if (v12 || ([v10 image], (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      char v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v12];
      int64_t v14 = [v17 posterPreviewView];
      [v14 prepareForFullScreenTransitionWithContentView:v13];
    }
  }

LABEL_7:
  long long v15 = [(_PBFGalleryCollectionViewController *)self delegate];
  long long v16 = [v17 posterPreviewView];
  [v15 galleryCollectionViewControllerDidSelectPreview:v9 fromPreviewView:v16];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  displayedCellForIndexPath = self->_displayedCellForIndexPath;
  id v8 = a5;
  id v9 = a4;
  [(NSMapTable *)displayedCellForIndexPath setObject:v9 forKey:v8];
  dataProvider = self->_dataProvider;
  uint64_t v11 = [(UICollectionViewDiffableDataSource *)self->_diffableDataSource itemIdentifierForIndexPath:v8];
  id v14 = [(PBFPosterGalleryDataProvider *)dataProvider previewForPreviewUniqueIdentifier:v11];

  [(PBFPosterGalleryAssetHelper *)self->_assetHelper updatePosterPreview:v14 isVisible:1];
  v12 = [(_PBFGalleryCollectionViewController *)self collectionView];
  [(_PBFGalleryCollectionViewController *)self configureCell:v9 forCollectionView:v12 posterPreview:v14 indexPath:v8];

  char v13 = [(_PBFGalleryCollectionViewController *)self delegate];
  [v13 galleryCollectionViewControllerWillDisplayPreview:v14];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  displayedCellForIndexPath = self->_displayedCellForIndexPath;
  id v7 = a5;
  [(NSMapTable *)displayedCellForIndexPath removeObjectForKey:v7];
  dataProvider = self->_dataProvider;
  id v9 = [(UICollectionViewDiffableDataSource *)self->_diffableDataSource itemIdentifierForIndexPath:v7];

  id v10 = [(PBFPosterGalleryDataProvider *)dataProvider previewForPreviewUniqueIdentifier:v9];

  [(PBFPosterGalleryAssetHelper *)self->_assetHelper updatePosterPreview:v10 isVisible:0];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80___PBFGalleryCollectionViewController_collectionView_prefetchItemsAtIndexPaths___block_invoke;
  v8[3] = &unk_1E6982188;
  v8[4] = self;
  objc_super v5 = objc_msgSend(a4, "bs_mapNoNulls:", v8);
  assetHelper = self->_assetHelper;
  id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  [(PBFPosterGalleryAssetHelper *)assetHelper prefetchPosterPreviews:v7];
}

- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92___PBFGalleryCollectionViewController_collectionView_cancelPrefetchingForItemsAtIndexPaths___block_invoke;
  v8[3] = &unk_1E6982188;
  v8[4] = self;
  objc_super v5 = objc_msgSend(a4, "bs_mapNoNulls:", v8);
  assetHelper = self->_assetHelper;
  id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  [(PBFPosterGalleryAssetHelper *)assetHelper cancelPrefetchForPosterPreviews:v7];
}

- (PBFPosterGalleryDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (_PBFGalleryCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_PBFGalleryCollectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PBFApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (UIViewController)hostingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingViewController);
  return (UIViewController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostingViewController);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_displayedCellForIndexPath, 0);
  objc_storeStrong((id *)&self->_assetHelper, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
}

@end