@interface VUILibraryGridCollectionViewController
- (BOOL)_didFailUpdateCloudLibrary;
- (BOOL)_isDeviceMediaLibraryInitialUpdateInProgress;
- (BOOL)forceBackButton;
- (BOOL)hideLockupTitles;
- (BOOL)waitingForFetch;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)mediaEntities;
- (NSString)pageType;
- (UIBarButtonItem)currentNavBarButtonItem;
- (UIBarButtonItem)libraryBarButton;
- (UICollectionViewCell)sizingCell;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (VUIFamilyMember)familyMember;
- (VUILibraryGridCollectionViewController)initWithDataSource:(id)a3 categoryType:(int64_t)a4;
- (VUILibraryGridCollectionViewControllerDelegate)delegate;
- (VUIMediaEntitiesDataSource)entitiesDataSource;
- (VUIMediaEntityFetchRequest)fetchRequest;
- (VUIViewControllerContentPresenter)contentPresenter;
- (double)_computeBottomMargin;
- (double)cellWidth;
- (id)_createCollectionView;
- (id)_createCollectionViewFlowLayout;
- (id)_createDiffableDataSource;
- (id)_createDiffableDataSourceSnapshot;
- (id)_deviceMediaLibrary;
- (id)_getEntityIdentifiersFromEntities;
- (id)noContentErrorMessage;
- (id)noContentTitle;
- (int64_t)categoryType;
- (int64_t)gridFilter;
- (int64_t)gridStyle;
- (int64_t)gridType;
- (void)_applyInitialSnapshot;
- (void)_applySnapshotFromEntitiesAndAnimateDifferences:(BOOL)a3;
- (void)_configureSizingCellForItemAtIndexPath:(id)a3;
- (void)_iOSHandleCellSelectionAtIndexPath:(id)a3;
- (void)_updateCurrentViewIfNeeded;
- (void)_updateLayoutForSize:(CGSize)a3;
- (void)_updateNavigationBarPadding;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dataSourceDidFinishFetching:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setCategoryType:(int64_t)a3;
- (void)setCellWidth:(double)a3;
- (void)setContentPresenter:(id)a3;
- (void)setCurrentNavBarButtonItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setEntitiesDataSource:(id)a3;
- (void)setFamilyMember:(id)a3;
- (void)setFetchRequest:(id)a3;
- (void)setForceBackButton:(BOOL)a3;
- (void)setGridFilter:(int64_t)a3;
- (void)setGridStyle:(int64_t)a3;
- (void)setGridType:(int64_t)a3;
- (void)setHideLockupTitles:(BOOL)a3;
- (void)setLibraryBarButton:(id)a3;
- (void)setMediaEntities:(id)a3;
- (void)setPageType:(id)a3;
- (void)setSizingCell:(id)a3;
- (void)setTitle:(id)a3 withLargeTitleDisplayEnabled:(BOOL)a4;
- (void)setWaitingForFetch:(BOOL)a3;
- (void)updateWithLatestMediaEntities:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation VUILibraryGridCollectionViewController

- (VUILibraryGridCollectionViewController)initWithDataSource:(id)a3 categoryType:(int64_t)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  v18.receiver = self;
  v18.super_class = (Class)VUILibraryGridCollectionViewController;
  v9 = [(VUILibraryGridCollectionViewController *)&v18 initWithCollectionViewLayout:v8];

  if (v9)
  {
    v9->_gridStyle = 5;
    v9->_lastViewWidth = 0.0;
    v9->_gridType = 1;
    objc_storeStrong((id *)&v9->_entitiesDataSource, a3);
    v10 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v9->_contentPresenter;
    v9->_contentPresenter = v10;

    [(VUIViewControllerContentPresenter *)v9->_contentPresenter setLogName:@"VUILibraryGridCollectionViewController"];
    v9->_waitingForFetch = 0;
    v9->_categoryType = a4;
    objc_initWeak(&location, v9);
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__VUILibraryGridCollectionViewController_initWithDataSource_categoryType___block_invoke;
    v15[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v16, &location);
    id v13 = (id)[(VUILibraryGridCollectionViewController *)v9 registerForTraitChanges:v12 withHandler:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __74__VUILibraryGridCollectionViewController_initWithDataSource_categoryType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1024) = 1;
    v9 = [v5 traitCollection];
    uint64_t v10 = [v9 vuiPreferredContentSizeCategory];
    uint64_t v11 = [v6 vuiPreferredContentSizeCategory];

    if (v10 != v11)
    {
      if ([v8 vuiIsViewLoaded])
      {
        v12 = [v8 vuiView];
        id v13 = [v12 window];

        if (v13)
        {
          v14 = VUIDefaultLogObject();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_INFO, "VUILibraryGridCollectionViewController:: size category changed, update traits to relayout the collection view", v15, 2u);
          }

          [v8 updateTraitsIfNeeded];
        }
      }
    }
  }
}

- (void)dealloc
{
  [(VUILibraryDataSource *)self->_entitiesDataSource setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)VUILibraryGridCollectionViewController;
  [(VUILibraryGridCollectionViewController *)&v3 dealloc];
}

- (void)updateWithLatestMediaEntities:(id)a3
{
  [(VUILibraryGridCollectionViewController *)self setMediaEntities:a3];
  [(VUILibraryGridCollectionViewController *)self _updateCurrentViewIfNeeded];
  v4 = [(VUILibraryGridCollectionViewController *)self contentPresenter];
  uint64_t v5 = [v4 currentContentViewType];

  if (v5 == 3)
  {
    [(VUILibraryGridCollectionViewController *)self _applySnapshotFromEntitiesAndAnimateDifferences:1];
  }
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)VUILibraryGridCollectionViewController;
  [(VUILibraryGridCollectionViewController *)&v4 loadView];
  objc_super v3 = [(VUILibraryGridCollectionViewController *)self contentPresenter];
  [v3 setRootViewForViewController:self];
}

- (void)viewDidLoad
{
  v45.receiver = self;
  v45.super_class = (Class)VUILibraryGridCollectionViewController;
  [(VUILibraryGridCollectionViewController *)&v45 viewDidLoad];
  objc_super v3 = [(VUILibraryGridCollectionViewController *)self _createCollectionView];
  objc_super v4 = [(VUILibraryGridCollectionViewController *)self view];
  [v4 bounds];
  double Width = CGRectGetWidth(v46);
  id v6 = [(VUILibraryGridCollectionViewController *)self view];
  [v6 bounds];
  -[VUILibraryGridCollectionViewController _updateLayoutForSize:](self, "_updateLayoutForSize:", Width, CGRectGetHeight(v47));

  [(VUILibraryGridCollectionViewController *)self setCollectionView:v3];
  id v7 = [(VUILibraryGridCollectionViewController *)self contentPresenter];
  id v8 = [(VUILibraryGridCollectionViewController *)self noContentTitle];
  [v7 setNoContentErrorTitle:v8];

  v9 = [(VUILibraryGridCollectionViewController *)self contentPresenter];
  uint64_t v10 = [(VUILibraryGridCollectionViewController *)self noContentErrorMessage];
  [v9 setNoContentErrorMessage:v10];

  uint64_t v11 = [(VUILibraryGridCollectionViewController *)self contentPresenter];
  v12 = +[VUILocalizationManager sharedInstance];
  id v13 = [v12 localizedStringForKey:@"LIBRARY_LOADING_MESSAGE"];
  [v11 setLoadingMessage:v13];

  v14 = [(VUILibraryGridCollectionViewController *)self contentPresenter];
  v15 = +[VUILocalizationManager sharedInstance];
  id v16 = [v15 localizedStringForKey:@"LIBRARY_LOADING_TITLE"];
  [v14 setLoadingTitle:v16];

  v17 = [(VUILibraryGridCollectionViewController *)self contentPresenter];
  objc_super v18 = +[VUILocalizationManager sharedInstance];
  v19 = [v18 localizedStringForKey:@"LIBRARY_CLOUD_UPDATE_FAILED_TITLE"];
  [v17 setCloudUpdateFailedTitle:v19];

  v20 = [(VUILibraryGridCollectionViewController *)self contentPresenter];
  v21 = +[VUILocalizationManager sharedInstance];
  v22 = [v21 localizedStringForKey:@"LIBRARY_CLOUD_UPDATE_FAILED_MESSAGE"];
  [v20 setCloudUpdateFailedMessage:v22];

  v23 = [(VUILibraryGridCollectionViewController *)self contentPresenter];
  [v23 setCurrentContentViewType:1];

  v24 = [(VUILibraryGridCollectionViewController *)self contentPresenter];
  v25 = [(VUILibraryGridCollectionViewController *)self collectionView];
  [v24 setContentView:v25];

  v26 = (void *)MEMORY[0x1E4FB1F48];
  int64_t v27 = [(VUILibraryGridCollectionViewController *)self gridStyle];
  int64_t v28 = [(VUILibraryGridCollectionViewController *)self gridType];
  v29 = [(VUILibraryGridCollectionViewController *)self view];
  [v29 bounds];
  objc_msgSend(v26, "vui_itemWidthForGridStyle:gridType:numGridColumns:windowWidth:", v27, v28, 1, CGRectGetWidth(v48));
  self->_celldouble Width = v30;

  self->_requiresRelayout = 1;
  self->_gridFilter = 1;
  v31 = [(VUILibraryGridCollectionViewController *)self navigationItem];
  v32 = [v31 leftBarButtonItem];
  currentNavBarButtonItem = self->_currentNavBarButtonItem;
  self->_currentNavBarButtonItem = v32;

  v34 = [(VUILibraryGridCollectionViewController *)self _createDiffableDataSource];
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v34;

  v36 = [(VUILibraryGridCollectionViewController *)self entitiesDataSource];
  [v36 setDelegate:self];

  v37 = [(VUILibraryGridCollectionViewController *)self entitiesDataSource];
  LODWORD(v27) = [v37 hasCompletedInitialFetch];

  if (v27)
  {
    [(VUILibraryGridCollectionViewController *)self setWaitingForFetch:0];
    v38 = [(VUILibraryGridCollectionViewController *)self entitiesDataSource];
    v39 = [v38 mediaEntities];
    v40 = (void *)[v39 copy];
    [(VUILibraryGridCollectionViewController *)self setMediaEntities:v40];

    [(VUILibraryGridCollectionViewController *)self _updateCurrentViewIfNeeded];
    [(VUILibraryGridCollectionViewController *)self _applyInitialSnapshot];
  }
  else
  {
    v41 = [(VUILibraryGridCollectionViewController *)self entitiesDataSource];
    [v41 startFetch];

    [(VUILibraryGridCollectionViewController *)self setWaitingForFetch:1];
  }
  v42 = [NSString stringWithFormat:@"Library.id=\"%@\", @"Collection""];
  v43 = [(VUILibraryGridCollectionViewController *)self view];
  v44 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:v42];
  [v43 setAccessibilityIdentifier:v44];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VUILibraryGridCollectionViewController;
  [(VUILibraryGridCollectionViewController *)&v11 viewWillAppear:a3];
  objc_super v4 = [(VUILibraryGridCollectionViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  if (self->_lastViewWidth != v6) {
    -[VUILibraryGridCollectionViewController _updateLayoutForSize:](self, "_updateLayoutForSize:", v6, v8);
  }
  [(VUILibraryGridCollectionViewController *)self _updateNavigationBarPadding];
  v9 = [(VUILibraryGridCollectionViewController *)self navigationController];
  uint64_t v10 = [v9 navigationBar];
  [v10 sizeToFit];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VUILibraryGridCollectionViewController;
  [(VUILibraryGridCollectionViewController *)&v3 viewWillDisappear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VUILibraryGridCollectionViewController;
  [(VUILibraryGridCollectionViewController *)&v7 viewDidAppear:a3];
  objc_super v4 = [(VUILibraryGridCollectionViewController *)self pageType];
  if (v4)
  {
    double v5 = [(VUILibraryGridCollectionViewController *)self pageType];
  }
  else
  {
    double v5 = @"LibraryMain";
  }
  double v6 = v5;

  +[VUILibraryMetrics recordPageEventWithPageType:v6];
}

- (void)viewWillLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)VUILibraryGridCollectionViewController;
  [(VUILibraryGridCollectionViewController *)&v7 viewWillLayoutSubviews];
  objc_super v3 = [(VUILibraryGridCollectionViewController *)self contentPresenter];
  objc_super v4 = [(VUILibraryGridCollectionViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");

  if (+[VUIUtilities isIpadInterface] && !self->_forceBackButton)
  {
    double v5 = [(VUILibraryGridCollectionViewController *)self navigationItem];
    double v6 = &OBJC_IVAR___VUILibraryGridCollectionViewController__libraryBarButton;
  }
  else
  {
    double v5 = [(VUILibraryGridCollectionViewController *)self navigationItem];
    double v6 = &OBJC_IVAR___VUILibraryGridCollectionViewController__currentNavBarButtonItem;
  }
  [v5 setLeftBarButtonItem:*(Class *)((char *)&self->super.super.super.super.isa + *v6)];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)VUILibraryGridCollectionViewController;
  [(VUILibraryGridCollectionViewController *)&v6 viewDidLayoutSubviews];
  [(VUILibraryGridCollectionViewController *)self _updateNavigationBarPadding];
  if (self->_requiresRelayout)
  {
    objc_super v3 = [(VUILibraryGridCollectionViewController *)self view];
    [v3 bounds];
    double Width = CGRectGetWidth(v7);
    double v5 = [(VUILibraryGridCollectionViewController *)self view];
    [v5 bounds];
    -[VUILibraryGridCollectionViewController _updateLayoutForSize:](self, "_updateLayoutForSize:", Width, CGRectGetHeight(v8));

    self->_requiresRelayout = 0;
  }
}

- (void)setMediaEntities:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_mediaEntities = &self->_mediaEntities;
  objc_storeStrong((id *)p_mediaEntities, a3);
  CGRect v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(NSArray *)*p_mediaEntities count];
    int v9 = 134217984;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUILibraryGridCollectionViewController:Setting %lu media entities", (uint8_t *)&v9, 0xCu);
  }
}

- (void)dataSourceDidFinishFetching:(id)a3
{
  id v4 = a3;
  id v5 = [(VUILibraryGridCollectionViewController *)self entitiesDataSource];

  if (v5 == v4)
  {
    [(VUILibraryGridCollectionViewController *)self setWaitingForFetch:0];
    objc_super v6 = [(VUILibraryGridCollectionViewController *)self entitiesDataSource];
    CGRect v7 = [v6 mediaEntities];
    uint64_t v8 = (void *)[v7 copy];
    [(VUILibraryGridCollectionViewController *)self setMediaEntities:v8];

    [(VUILibraryGridCollectionViewController *)self _updateCurrentViewIfNeeded];
    [(VUILibraryGridCollectionViewController *)self _applySnapshotFromEntitiesAndAnimateDifferences:0];
  }
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  [(VUILibraryGridCollectionViewController *)self _computeBottomMargin];
  double v7 = v6;
  int64_t v8 = [(VUILibraryGridCollectionViewController *)self gridStyle];
  double v9 = 0.0;
  if (v8 == 5) {
    double v9 = 10.0;
  }
  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = v7;
  result.right = v11;
  result.bottom = v12;
  result.left = v10;
  result.top = v9;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  double v7 = [(VUILibraryGridCollectionViewController *)self traitCollection];
  int v8 = [v7 isAXEnabled];

  if (v8)
  {
    double v9 = [(NSMutableDictionary *)self->_cellMetrics objectForKeyedSubscript:v6];

    if (v9)
    {
      double v10 = [(NSMutableDictionary *)self->_cellMetrics objectForKeyedSubscript:v6];
      [v10 CGSizeValue];
      CGFloat v12 = v11;
      CGFloat v14 = v13;
    }
    else
    {
      [(VUILibraryGridCollectionViewController *)self _configureSizingCellForItemAtIndexPath:v6];
      -[UICollectionViewCell sizeThatFits:](self->_sizingCell, "sizeThatFits:", self->_cellWidth, 1.79769313e308);
      CGFloat v12 = v17;
      CGFloat v14 = v18;
      cellMetrics = self->_cellMetrics;
      v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:");
      [(NSMutableDictionary *)cellMetrics setObject:v20 forKey:v6];
    }
  }
  else
  {
    [(VUILibraryGridCollectionViewController *)self _configureSizingCellForItemAtIndexPath:v6];
    -[UICollectionViewCell sizeThatFits:](self->_sizingCell, "sizeThatFits:", self->_cellWidth, 1.79769313e308);
    CGFloat v12 = v15;
    CGFloat v14 = v16;
    self->_cellSize.width = v15;
    self->_cellSize.height = v16;
  }

  double v21 = v12;
  double v22 = v14;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v13 = [(VUILibraryGridCollectionViewController *)self mediaEntities];
  uint64_t v7 = [v13 count];
  uint64_t v8 = [v6 row];

  if ((unint64_t)(v7 - v8) > 0x13)
  {
  }
  else
  {
    BOOL v9 = [(VUILibraryGridCollectionViewController *)self waitingForFetch];

    if (!v9)
    {
      double v10 = [(VUILibraryGridCollectionViewController *)self entitiesDataSource];
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        CGFloat v12 = [(VUILibraryGridCollectionViewController *)self entitiesDataSource];
        [v12 loadNextEntityBatch];

        [(VUILibraryGridCollectionViewController *)self setWaitingForFetch:1];
      }
    }
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)VUILibraryGridCollectionViewController;
  id v7 = a4;
  -[VUILibraryGridCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__VUILibraryGridCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6DFA790;
  v8[4] = self;
  *(double *)&v8[5] = width;
  *(double *)&v8[6] = height;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __93__VUILibraryGridCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLayoutForSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_iOSHandleCellSelectionAtIndexPath:(id)a3
{
  id v4 = a3;
  id v17 = [(VUILibraryGridCollectionViewController *)self mediaEntities];
  uint64_t v5 = [v4 row];

  id v6 = [v17 objectAtIndex:v5];
  id v7 = [(VUILibraryGridCollectionViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v7 gridCollectionViewController:self didSelectMediaEntity:v6];
  }
  else
  {
    uint64_t v8 = [(VUILibraryGridCollectionViewController *)self familyMember];
    objc_super v9 = +[VUILibraryViewFactory viewControllerForMediaEntity:v6 withFamilyMember:v8];

    double v10 = NSString;
    char v11 = [v6 type];
    CGFloat v12 = [v11 stringDescription];
    id v13 = [v10 stringWithFormat:@"Library.id=\"%@\"", v12];

    CGFloat v14 = [v9 view];
    CGFloat v15 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:v13];
    [v14 setAccessibilityIdentifier:v15];

    CGFloat v16 = [(VUILibraryGridCollectionViewController *)self navigationController];
    [v16 pushViewController:v9 animated:1];

    +[VUILibraryMetrics recordClickOnMediaEntity:v6];
  }
}

- (void)setTitle:(id)a3 withLargeTitleDisplayEnabled:(BOOL)a4
{
  id v10 = a3;
  id v6 = [(VUILibraryGridCollectionViewController *)self navigationItem];
  [v6 setTitle:v10];
  if (!a4) {
    [v6 setLargeTitleDisplayMode:2];
  }
  id v7 = [NSString stringWithFormat:@"Library.id=\"%@\"", v10];
  uint64_t v8 = [(VUILibraryGridCollectionViewController *)self view];
  objc_super v9 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:v7];
  [v8 setAccessibilityIdentifier:v9];
}

- (id)_createCollectionView
{
  v2 = [(VUILibraryGridCollectionViewController *)self _createCollectionViewFlowLayout];
  objc_super v3 = [VUILegacyCollectionView alloc];
  id v4 = -[VUILegacyCollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(VUILegacyCollectionView *)v4 setAlwaysBounceVertical:1];
  [(VUILegacyCollectionView *)v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"VUILibraryLockupCellReuseIdentifier"];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
  [(VUILegacyCollectionView *)v4 setBackgroundColor:v5];

  [(VUILegacyCollectionView *)v4 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"VUILibraryCollectionHeaderReuseIdentifier"];
  return v4;
}

- (id)_createCollectionViewFlowLayout
{
  v2 = objc_alloc_init(VUITopAlignedCollectionViewFlowLayout);
  [(UICollectionViewFlowLayout *)v2 setScrollDirection:0];
  [(UICollectionViewFlowLayout *)v2 setMinimumLineSpacing:0.0];
  return v2;
}

- (id)_createDiffableDataSource
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4FB1598]);
  id v4 = [(VUILibraryGridCollectionViewController *)self collectionView];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__VUILibraryGridCollectionViewController__createDiffableDataSource__block_invoke;
  v7[3] = &unk_1E6DF3EB8;
  objc_copyWeak(&v8, &location);
  uint64_t v5 = (void *)[v3 initWithCollectionView:v4 cellProvider:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

id __67__VUILibraryGridCollectionViewController__createDiffableDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [v6 dequeueReusableCellWithReuseIdentifier:@"VUILibraryLockupCellReuseIdentifier" forIndexPath:v5];

  objc_super v9 = [WeakRetained mediaEntities];
  uint64_t v10 = [v5 row];

  char v11 = [v9 objectAtIndex:v10];

  [WeakRetained cellWidth];
  +[VUILibraryLockupViewCell configureLockupCell:withMedia:width:forMetrics:](VUILibraryLockupViewCell, "configureLockupCell:withMedia:width:forMetrics:", v8, v11, 0);
  if ([WeakRetained hideLockupTitles]) {
    [v8 setHideTitleLabel:1];
  }

  return v8;
}

- (id)_createDiffableDataSourceSnapshot
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v14[0] = @"GridMainSection";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v3 appendSectionsWithIdentifiers:v4];

  id v5 = [(VUILibraryGridCollectionViewController *)self _getEntityIdentifiersFromEntities];
  [v3 appendItemsWithIdentifiers:v5 intoSectionWithIdentifier:@"GridMainSection"];
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 count];
    NSUInteger v8 = [(NSArray *)self->_mediaEntities count];
    int v10 = 134218240;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    NSUInteger v13 = v8;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUILibraryGridCollectionViewController:Creating snapshot using %lu media entity identifiers and %lu entities", (uint8_t *)&v10, 0x16u);
  }

  return v3;
}

- (id)_getEntityIdentifiersFromEntities
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(VUILibraryGridCollectionViewController *)self mediaEntities];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) identifier];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  int v10 = [v3 array];

  return v10;
}

- (void)_configureSizingCellForItemAtIndexPath:(id)a3
{
  id v13 = a3;
  id v4 = [(VUILibraryGridCollectionViewController *)self mediaEntities];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [v13 row];

  if (v5 <= v6)
  {
    NSUInteger v8 = 0;
  }
  else
  {
    uint64_t v7 = [(VUILibraryGridCollectionViewController *)self mediaEntities];
    NSUInteger v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v13, "row"));
  }
  sizingCell = self->_sizingCell;
  if (!sizingCell)
  {
    int v10 = objc_alloc_init(VUILibraryLockupViewCell);
    uint64_t v11 = self->_sizingCell;
    self->_sizingCell = &v10->super;

    [(UICollectionViewCell *)self->_sizingCell setHidden:1];
    long long v12 = [(VUILibraryGridCollectionViewController *)self vuiView];
    [v12 addSubview:self->_sizingCell];

    sizingCell = self->_sizingCell;
  }
  +[VUILibraryLockupViewCell configureLockupCell:sizingCell withMedia:v8 width:1 forMetrics:self->_cellWidth];
  if ([(VUILibraryGridCollectionViewController *)self hideLockupTitles]) {
    [(UICollectionViewCell *)self->_sizingCell setHideTitleLabel:1];
  }
}

- (double)_computeBottomMargin
{
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  [(VUILibraryGridCollectionViewController *)self _configureSizingCellForItemAtIndexPath:v3];

  sizingCell = self->_sizingCell;
  +[VUIViewSpacer spacerB];
  -[UICollectionViewCell bottomMarginWithBaselineMargin:](sizingCell, "bottomMarginWithBaselineMargin:");
  if (result == 0.0)
  {
    +[VUIViewSpacer spacerB];
    double v7 = v6;
    NSUInteger v8 = [(VUILibraryGridCollectionViewController *)self traitCollection];
    +[VUIUtilities scaleContentSizeValue:v8 forTraitCollection:v7];
    double v10 = v9;

    return v10;
  }
  return result;
}

- (void)_updateNavigationBarPadding
{
  id v3 = (void *)MEMORY[0x1E4FB1F48];
  id v4 = [(VUILibraryGridCollectionViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "vui_paddingForWindowWidth:", CGRectGetWidth(v27));
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = [(VUILibraryGridCollectionViewController *)self navigationController];
  long long v14 = [v13 navigationBar];
  [v14 layoutMargins];
  if (v8 == v18 && v6 == v15 && v12 == v17)
  {
    double v21 = v16;

    if (v10 == v21) {
      return;
    }
  }
  else
  {
  }
  double v22 = [(VUILibraryGridCollectionViewController *)self navigationController];
  v23 = [v22 navigationBar];
  objc_msgSend(v23, "setLayoutMargins:", v6, v8, v10, v12);

  id v25 = [(VUILibraryGridCollectionViewController *)self navigationController];
  v24 = [v25 navigationBar];
  [v24 setNeedsLayout];
}

- (void)_updateLayoutForSize:(CGSize)a3
{
  CGFloat width = a3.width;
  self->_cellSize = (CGSize)*MEMORY[0x1E4F1DB30];
  double v5 = (NSMutableDictionary *)objc_opt_new();
  cellMetrics = self->_cellMetrics;
  self->_cellMetrics = v5;

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_currentSizeClassForWindowWidth:", width);
  int64_t v8 = 3;
  if ((unint64_t)(v7 - 3) < 3) {
    int64_t v8 = 5;
  }
  self->_gridStyle = v8;
  double v9 = [(VUILibraryGridCollectionViewController *)self collectionView];
  id v22 = [v9 collectionViewLayout];

  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_collectionInteritemSpace:gridType:windowWidth:", -[VUILibraryGridCollectionViewController gridStyle](self, "gridStyle"), -[VUILibraryGridCollectionViewController gridType](self, "gridType"), width);
  objc_msgSend(v22, "setMinimumInteritemSpacing:");
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_itemWidthForGridStyle:gridType:numGridColumns:windowWidth:", -[VUILibraryGridCollectionViewController gridStyle](self, "gridStyle"), -[VUILibraryGridCollectionViewController gridType](self, "gridType"), 1, width);
  self->_celldouble Width = v10;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_paddingForWindowWidth:", width);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [(VUILibraryGridCollectionViewController *)self collectionView];
  objc_msgSend(v19, "setContentInset:", v12, v14, v16, v18);

  self->_lastViewdouble Width = width;
  v20 = [(VUILibraryGridCollectionViewController *)self collectionView];
  double v21 = [v20 collectionViewLayout];
  [v21 invalidateLayout];
}

- (void)_updateCurrentViewIfNeeded
{
  id v3 = [(VUILibraryGridCollectionViewController *)self mediaEntities];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    double v5 = [(VUILibraryGridCollectionViewController *)self contentPresenter];
    id v8 = v5;
    uint64_t v6 = 3;
  }
  else if ([(VUILibraryGridCollectionViewController *)self _isDeviceMediaLibraryInitialUpdateInProgress])
  {
    double v5 = [(VUILibraryGridCollectionViewController *)self contentPresenter];
    id v8 = v5;
    uint64_t v6 = 1;
  }
  else
  {
    BOOL v7 = [(VUILibraryGridCollectionViewController *)self _didFailUpdateCloudLibrary];
    id v8 = [(VUILibraryGridCollectionViewController *)self contentPresenter];
    double v5 = v8;
    if (v7) {
      uint64_t v6 = 4;
    }
    else {
      uint64_t v6 = 2;
    }
  }
  [v5 setCurrentContentViewType:v6];
}

- (BOOL)_isDeviceMediaLibraryInitialUpdateInProgress
{
  v2 = [(VUILibraryGridCollectionViewController *)self _deviceMediaLibrary];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 isInitialUpdateInProgress];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_didFailUpdateCloudLibrary
{
  v2 = [(VUILibraryGridCollectionViewController *)self _deviceMediaLibrary];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 didFailUpdateCloudLibrary];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)_deviceMediaLibrary
{
  id v3 = [(VUILibraryGridCollectionViewController *)self entitiesDataSource];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  BOOL v4 = +[VUIAuthenticationManager userHasActiveAccount];

  if (v4)
  {
    double v5 = [(VUILibraryGridCollectionViewController *)self entitiesDataSource];
    id v3 = [v5 mediaLibrary];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v3;
      uint64_t v6 = v3;
LABEL_6:

      goto LABEL_8;
    }
LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = 0;
LABEL_8:
  return v6;
}

- (void)_applyInitialSnapshot
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(VUILibraryGridCollectionViewController *)self mediaEntities];
  unint64_t v4 = [v3 count];

  if (v4 > 0x35)
  {
    double v5 = [(VUILibraryGridCollectionViewController *)self mediaEntities];
    uint64_t v6 = objc_msgSend(v5, "subarrayWithRange:", 0, 54);

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "identifier", (void)v18);
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v10);
    }

    double v14 = objc_opt_new();
    id v22 = @"GridMainSection";
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    [v14 appendSectionsWithIdentifiers:v15];

    double v16 = [v7 array];
    [v14 appendItemsWithIdentifiers:v16 intoSectionWithIdentifier:@"GridMainSection"];

    double v17 = [(VUILibraryGridCollectionViewController *)self diffableDataSource];
    [v17 applySnapshot:v14 animatingDifferences:0];

    [(VUILibraryGridCollectionViewController *)self performSelector:sel__applySnapshotFromEntitiesAndAnimateDifferences_ withObject:MEMORY[0x1E4F1CC38] afterDelay:2.0];
  }
  else
  {
    [(VUILibraryGridCollectionViewController *)self _applySnapshotFromEntitiesAndAnimateDifferences:0];
  }
}

- (void)_applySnapshotFromEntitiesAndAnimateDifferences:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUILibraryGridCollectionViewController: Creating full snapshot", buf, 2u);
  }

  uint64_t v6 = [(VUILibraryGridCollectionViewController *)self _createDiffableDataSourceSnapshot];
  id v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUILibraryGridCollectionViewController: Snapshot created", v9, 2u);
  }

  id v8 = [(VUILibraryGridCollectionViewController *)self diffableDataSource];
  [v8 applySnapshot:v6 animatingDifferences:v3 completion:&__block_literal_global_113];
}

void __90__VUILibraryGridCollectionViewController__applySnapshotFromEntitiesAndAnimateDifferences___block_invoke()
{
  v0 = VUIDefaultLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1E2BD7000, v0, OS_LOG_TYPE_DEFAULT, "VUILibraryGridCollectionViewController: Snapshot applied", v1, 2u);
  }
}

- (id)noContentTitle
{
  int64_t v2 = [(VUILibraryGridCollectionViewController *)self categoryType];
  if (v2)
  {
    if (v2 == 3)
    {
      BOOL v3 = +[VUILocalizationManager sharedInstance];
      unint64_t v4 = v3;
      double v5 = @"LIBRARY_NO_TV_SHOWS_TITLE";
    }
    else if (v2 == 2)
    {
      BOOL v3 = +[VUILocalizationManager sharedInstance];
      unint64_t v4 = v3;
      double v5 = @"LIBRARY_NO_MOVIES_TITLE";
    }
    else
    {
      BOOL v3 = +[VUILocalizationManager sharedInstance];
      unint64_t v4 = v3;
      double v5 = @"LIBRARY_GENERIC_FETCH_ERROR_TITLE";
    }
  }
  else
  {
    BOOL v3 = +[VUILocalizationManager sharedInstance];
    unint64_t v4 = v3;
    double v5 = @"LIBRARY_EMPTY_TITLE_NEW";
  }
  uint64_t v6 = [v3 localizedStringForKey:v5];

  return v6;
}

- (id)noContentErrorMessage
{
  int64_t v2 = [(VUILibraryGridCollectionViewController *)self categoryType];
  switch(v2)
  {
    case 0:
      BOOL v3 = +[VUILocalizationManager sharedInstance];
      unint64_t v4 = v3;
      double v5 = @"LIBRARY_EMPTY_DESCRIPTION_NEW";
      goto LABEL_7;
    case 3:
      BOOL v3 = +[VUILocalizationManager sharedInstance];
      unint64_t v4 = v3;
      double v5 = @"LIBRARY_NO_TV_SHOWS_MESSAGE";
      goto LABEL_7;
    case 2:
      BOOL v3 = +[VUILocalizationManager sharedInstance];
      unint64_t v4 = v3;
      double v5 = @"LIBRARY_NO_MOVIES_MESSAGE";
LABEL_7:
      uint64_t v6 = [v3 localizedStringForKey:v5];

      goto LABEL_9;
  }
  uint64_t v6 = &stru_1F3E921E0;
LABEL_9:
  return v6;
}

- (VUIFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
}

- (VUILibraryGridCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUILibraryGridCollectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)gridFilter
{
  return self->_gridFilter;
}

- (void)setGridFilter:(int64_t)a3
{
  self->_gridFilter = a3;
}

- (BOOL)hideLockupTitles
{
  return self->_hideLockupTitles;
}

- (void)setHideLockupTitles:(BOOL)a3
{
  self->_hideLockupTitles = a3;
}

- (UIBarButtonItem)libraryBarButton
{
  return self->_libraryBarButton;
}

- (void)setLibraryBarButton:(id)a3
{
}

- (BOOL)forceBackButton
{
  return self->_forceBackButton;
}

- (void)setForceBackButton:(BOOL)a3
{
  self->_forceBackButton = a3;
}

- (NSString)pageType
{
  return self->_pageType;
}

- (void)setPageType:(id)a3
{
}

- (int64_t)categoryType
{
  return self->_categoryType;
}

- (void)setCategoryType:(int64_t)a3
{
  self->_categoryType = a3;
}

- (VUIMediaEntitiesDataSource)entitiesDataSource
{
  return self->_entitiesDataSource;
}

- (void)setEntitiesDataSource:(id)a3
{
}

- (VUIMediaEntityFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
}

- (UICollectionViewCell)sizingCell
{
  return self->_sizingCell;
}

- (void)setSizingCell:(id)a3
{
}

- (double)cellWidth
{
  return self->_cellWidth;
}

- (void)setCellWidth:(double)a3
{
  self->_celldouble Width = a3;
}

- (UIBarButtonItem)currentNavBarButtonItem
{
  return self->_currentNavBarButtonItem;
}

- (void)setCurrentNavBarButtonItem:(id)a3
{
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (BOOL)waitingForFetch
{
  return self->_waitingForFetch;
}

- (void)setWaitingForFetch:(BOOL)a3
{
  self->_waitingForFetch = a3;
}

- (NSArray)mediaEntities
{
  return self->_mediaEntities;
}

- (int64_t)gridStyle
{
  return self->_gridStyle;
}

- (void)setGridStyle:(int64_t)a3
{
  self->_gridStyle = a3;
}

- (int64_t)gridType
{
  return self->_gridType;
}

- (void)setGridType:(int64_t)a3
{
  self->_gridType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaEntities, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_currentNavBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_entitiesDataSource, 0);
  objc_storeStrong((id *)&self->_pageType, 0);
  objc_storeStrong((id *)&self->_libraryBarButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_sizingHeaderView, 0);
  objc_storeStrong((id *)&self->_cellMetrics, 0);
}

@end