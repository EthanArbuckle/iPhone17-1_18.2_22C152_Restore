@interface SBHPadAddSheetViewController
- (BOOL)allowsFakeWidgets;
- (BOOL)wantsBottomAttachedPresentation;
- (BOOL)wantsCloseButton;
- (BOOL)wantsSeparator;
- (MTMaterialView)backgroundView;
- (NSArray)applicationWidgetCollections;
- (NSArray)customApplicationWidgetCollections;
- (NSArray)disfavoredApplicationWidgetCollections;
- (NSArray)favoredApplicationWidgetCollections;
- (NSArray)searchBarGradientMaskLayers;
- (NSMutableDictionary)suggestedItemsByGalleryLayoutSize;
- (NSMutableDictionary)userInfo;
- (SBHAddWidgetSheetViewController)left;
- (SBHPadAddSheetViewController)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 allowedWidgets:(SBHWidgetFilteringParameters)a5 appCellConfigurator:(id)a6 addWidgetSheetStyle:(unint64_t)a7;
- (SBHPadAddWidgetSheetMetrics)_metricsForCurrentOrientation;
- (SBHPadAddWidgetSheetMetrics)_metricsForOrientation:(SEL)a3;
- (SBHWidgetDragHandling)widgetDragHandler;
- (SBHWidgetSearchController)widgetSearchController;
- (SBHWidgetSheetViewControllerPresenter)presenter;
- (UIEdgeInsets)preferredInsetsForSheetPresentationInInterfaceOrientation:(int64_t)a3;
- (UISplitViewController)splitViewController;
- (UIView)redBox;
- (UIView)separatorView;
- (double)_columnSpacing;
- (double)_paddedSidebarWidthForInterfaceOrientation:(int64_t)a3;
- (double)_widthNeededForWidgetColumns:(unint64_t)a3;
- (id)_detailViewController;
- (id)_newBackgroundView;
- (id)addWidgetSheetViewController:(id)a3 detailViewControllerForWidgetCollection:(id)a4;
- (id)backgroundViewMatchingMaterialBeneathAddWidgetSheetViewController:(id)a3;
- (id)contentUnavailableConfigurationState;
- (id)galleryViewControllerForAddWidgetSheetViewController:(id)a3;
- (id)suggestedItemsForGalleryLayoutSize:(unint64_t)a3;
- (unint64_t)_numberOfWidgetColumnsThatFitInWidth:(double)a3;
- (unint64_t)addWidgetSheetLocation;
- (unint64_t)galleryLayoutSize;
- (void)_layoutSearchBarGradientMaskLayers;
- (void)_layoutSeparatorView;
- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4;
- (void)addWidgetSheetViewControllerDidAppear:(id)a3;
- (void)addWidgetSheetViewControllerDidCancel:(id)a3;
- (void)addWidgetSheetViewControllerDidDisappear:(id)a3;
- (void)addWidgetSheetViewControllerWillAppear:(id)a3;
- (void)addWidgetSheetViewControllerWillDisappear:(id)a3;
- (void)closeButtonTapped:(id)a3;
- (void)configureViewsForCurrentInterfaceOrientation;
- (void)configureViewsForInterfaceOrientation:(int64_t)a3;
- (void)dealloc;
- (void)setAddWidgetSheetLocation:(unint64_t)a3;
- (void)setAddWidgetSheetWidgetBackgroundType:(unint64_t)a3;
- (void)setAllowsFakeWidgets:(BOOL)a3;
- (void)setApplicationWidgetCollections:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCustomApplicationWidgetCollections:(id)a3;
- (void)setDisfavoredApplicationWidgetCollections:(id)a3;
- (void)setFavoredApplicationWidgetCollections:(id)a3;
- (void)setGalleryLayoutSize:(unint64_t)a3;
- (void)setLeft:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setRedBox:(id)a3;
- (void)setSearchBarGradientMaskLayers:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setSplitViewController:(id)a3;
- (void)setSuggestedItems:(id)a3 forGalleryLayoutSize:(unint64_t)a4;
- (void)setSuggestedItemsByGalleryLayoutSize:(id)a3;
- (void)setWantsBottomAttachedPresentation:(BOOL)a3;
- (void)setWantsCloseButton:(BOOL)a3;
- (void)setWantsSeparator:(BOOL)a3;
- (void)setWidgetSearchController:(id)a3;
- (void)updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBHPadAddSheetViewController

- (SBHPadAddSheetViewController)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 allowedWidgets:(SBHWidgetFilteringParameters)a5 appCellConfigurator:(id)a6 addWidgetSheetStyle:(unint64_t)a7
{
  v33.receiver = self;
  v33.super_class = (Class)SBHPadAddSheetViewController;
  v7 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:](&v33, sel_initWithListLayoutProvider_iconViewProvider_allowedWidgets_appCellConfigurator_addWidgetSheetStyle_, a3, a4, a5.families, *(void *)&a5.includesNonStackable, a6, a7);
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    v9 = (void *)*((void *)v7 + 183);
    *((void *)v7 + 183) = v8;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

    unint64_t v11 = SBHScreenTypeForCurrentDevice();
    SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation(v11, 3, (uint64_t)&v25);
    long long v12 = v25;
    long long v13 = v26;
    long long v14 = v28;
    *(_OWORD *)(v7 + 1224) = v27;
    *(_OWORD *)(v7 + 1240) = v14;
    *(_OWORD *)(v7 + 1192) = v12;
    *(_OWORD *)(v7 + 1208) = v13;
    long long v15 = v29;
    long long v16 = v30;
    long long v17 = v31;
    *((void *)v7 + 163) = v32;
    *(_OWORD *)(v7 + 1272) = v16;
    *(_OWORD *)(v7 + 1288) = v17;
    *(_OWORD *)(v7 + 1256) = v15;
    SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation(v11, 1, (uint64_t)&v25);
    long long v18 = v25;
    long long v19 = v26;
    long long v20 = v28;
    *((_OWORD *)v7 + 84) = v27;
    *((_OWORD *)v7 + 85) = v20;
    *((_OWORD *)v7 + 82) = v18;
    *((_OWORD *)v7 + 83) = v19;
    long long v21 = v29;
    long long v22 = v30;
    long long v23 = v31;
    *((void *)v7 + 178) = v32;
    *((_OWORD *)v7 + 87) = v22;
    *((_OWORD *)v7 + 88) = v23;
    *((_OWORD *)v7 + 86) = v21;
    [v7 setWantsBottomAttachedPresentation:1];
  }
  return (SBHPadAddSheetViewController *)v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBHPadAddSheetViewController;
  [(SBHPadAddSheetViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v62[2] = *MEMORY[0x1E4F143B8];
  v61.receiver = self;
  v61.super_class = (Class)SBHPadAddSheetViewController;
  [(SBHPadAddSheetViewController *)&v61 viewDidLoad];
  v3 = [(SBHPadAddSheetViewController *)self view];
  uint64_t v4 = [v3 window];
  v5 = [(SBHPadAddSheetViewController *)self _newBackgroundView];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v5;

  v7 = self->_backgroundView;
  v60 = v3;
  [v3 bounds];
  -[MTMaterialView setFrame:](v7, "setFrame:");
  [(MTMaterialView *)self->_backgroundView setAutoresizingMask:18];
  [v3 addSubview:self->_backgroundView];
  uint64_t v8 = (UISplitViewController *)[objc_alloc(MEMORY[0x1E4FB1C48]) initWithStyle:1];
  splitViewController = self->_splitViewController;
  self->_splitViewController = v8;

  [(UISplitViewController *)self->_splitViewController _setOverrideHorizontalSizeClass:2];
  v10 = [(UISplitViewController *)self->_splitViewController view];
  unint64_t v11 = [MEMORY[0x1E4FB1618] clearColor];
  [v10 setBackgroundColor:v11];

  [(UISplitViewController *)self->_splitViewController setGutterWidth:0.0];
  [(UISplitViewController *)self->_splitViewController setPreferredSplitBehavior:1];
  [(UISplitViewController *)self->_splitViewController setPreferredDisplayMode:2];
  [(UISplitViewController *)self->_splitViewController setDisplayModeButtonVisibility:1];
  [(UISplitViewController *)self->_splitViewController setPrimaryBackgroundStyle:1];
  v59 = (void *)v4;
  if (v4) {
    long long v12 = (SBHPadAddSheetViewController *)v4;
  }
  else {
    long long v12 = self;
  }
  [(SBHPadAddSheetViewController *)self _paddedSidebarWidthForInterfaceOrientation:[(SBHPadAddSheetViewController *)v12 interfaceOrientation]];
  double v14 = v13;
  -[UISplitViewController setPreferredPrimaryColumnWidth:](self->_splitViewController, "setPreferredPrimaryColumnWidth:");
  [(UISplitViewController *)self->_splitViewController setMaximumPrimaryColumnWidth:v14];
  [(SBHPadAddSheetViewController *)self bs_addChildViewController:self->_splitViewController];
  unint64_t v15 = [(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetStyle];
  long long v16 = [SBHAddWidgetSheetViewController alloc];
  long long v17 = [(SBHAddWidgetSheetViewControllerBase *)self listLayoutProvider];
  long long v18 = [(SBHAddWidgetSheetViewControllerBase *)self iconViewProvider];
  uint64_t v19 = [(SBHAddWidgetSheetViewControllerBase *)self allowedWidgets];
  uint64_t v21 = v20;
  long long v22 = [(SBHAddWidgetSheetViewControllerBase *)self appCellConfigurator];
  long long v23 = [v22 iconImageCache];
  v24 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:](v16, "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:", v17, v18, v19, v21, v23, v15);
  left = self->_left;
  self->_left = v24;

  [(SBHAddWidgetSheetViewControllerBase *)self->_left setAllowsFakeWidgets:self->_allowsFakeWidgets];
  [(SBHAddWidgetSheetViewControllerBase *)self->_left setExternalBackgroundView:self->_backgroundView];
  [(SBHAddWidgetSheetViewController *)self->_left setAddWidgetSheetLocation:self->_addWidgetSheetLocation];
  [(SBHAddWidgetSheetViewControllerBase *)self->_left setAddWidgetSheetWidgetBackgroundType:[(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetWidgetBackgroundType]];
  [(SBHAddWidgetSheetViewController *)self->_left setApplicationWidgetCollections:self->_applicationWidgetCollections];
  long long v26 = self->_left;
  long long v27 = [(SBHPadAddSheetViewController *)self suggestedItemsForGalleryLayoutSize:self->_galleryLayoutSize];
  [(SBHAddWidgetSheetViewController *)v26 setSuggestedItems:v27 forGalleryLayoutSize:self->_galleryLayoutSize];

  long long v28 = self->_left;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  [(SBHAddWidgetSheetViewController *)v28 setPresenter:WeakRetained];

  [(SBHAddWidgetSheetViewController *)self->_left setGalleryLayoutSize:self->_galleryLayoutSize];
  [(SBHAddWidgetSheetViewControllerBase *)self->_left setDelegate:self];
  long long v30 = [(SBHAddWidgetSheetViewController *)self->_left view];
  long long v31 = [MEMORY[0x1E4FB1618] clearColor];
  [v30 setBackgroundColor:v31];

  [(UISplitViewController *)self->_splitViewController setViewController:self->_left forColumn:0];
  uint64_t v32 = [(SBHAddWidgetSheetViewController *)self->_left navigationController];
  [v32 setNavigationBarHidden:1];

  objc_super v33 = SBHBundle();
  v34 = [v33 localizedStringForKey:@"WIDGET_ADD_SHEET_SEARCH_PLACEHOLDER" value:&stru_1F2FA0300 table:@"SpringBoardHome"];

  v35 = [[SBHWidgetSearchController alloc] initWithAddWidgetSheetStyle:v15 placeholderText:v34];
  widgetSearchController = self->_widgetSearchController;
  self->_widgetSearchController = v35;

  [(SBHWidgetSearchController *)self->_widgetSearchController setObscuresBackgroundDuringPresentation:0];
  [(SBHWidgetSearchController *)self->_widgetSearchController setDelegate:self->_left];
  [(SBHWidgetSearchController *)self->_widgetSearchController setSearchResultsUpdater:self];
  [(SBHWidgetSearchController *)self->_widgetSearchController setAlwaysShowBarBackground:self->_wantsSeparator];
  [(SBHWidgetSearchController *)self->_widgetSearchController setShouldInsetContentForGrabber:self->_wantsBottomAttachedPresentation];
  v37 = [(MTMaterialView *)self->_backgroundView visualStylingProviderForCategory:2];
  v38 = [(SBHWidgetSearchController *)self->_widgetSearchController searchBarTextFieldBackgroundView];
  [v37 automaticallyUpdateView:v38 withStyle:2];

  v39 = [(SBHWidgetSearchController *)self->_widgetSearchController searchBar];
  [v39 sizeToFit];
  [v3 addSubview:v39];
  v40 = self->_widgetSearchController;
  [v3 bounds];
  [(SBHWidgetSearchController *)v40 updateSearchBarContentInsetsWithWidth:v41];
  v42 = [(SBHWidgetSearchController *)self->_widgetSearchController searchBar];
  [v42 sizeToFit];

  v43 = [(SBHWidgetSearchController *)self->_widgetSearchController searchBar];
  [v43 layoutIfNeeded];

  [(SBHAddWidgetSheetViewController *)self->_left setExternalSearchController:self->_widgetSearchController];
  v44 = (void *)MEMORY[0x1E4FA5F00];
  v45 = [(UISplitViewController *)self->_splitViewController view];
  v46 = [v44 configureGradientMaskForFeatherBlurRecipe:0 onContentView:v45];
  searchBarGradientMaskLayers = self->_searchBarGradientMaskLayers;
  self->_searchBarGradientMaskLayers = v46;

  if ([(SBHPadAddSheetViewController *)self wantsCloseButton])
  {
    v48 = [MEMORY[0x1E4FB14D0] buttonWithType:7];
    [v48 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v48 addTarget:self action:sel_closeButtonTapped_ forControlEvents:64];
    [v39 addSubview:v48];
    v57 = (void *)MEMORY[0x1E4F28DC8];
    v49 = [v48 trailingAnchor];
    v50 = [v39 trailingAnchor];
    v51 = [v49 constraintEqualToAnchor:v50 constant:-21.0];
    v62[0] = v51;
    [v48 centerYAnchor];
    v52 = v58 = v34;
    v53 = [v39 searchTextField];
    v54 = [v53 centerYAnchor];
    v55 = [v52 constraintEqualToAnchor:v54];
    v62[1] = v55;
    v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
    [v57 activateConstraints:v56];

    v34 = v58;
  }
}

- (id)_newBackgroundView
{
  v2 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:54];
  [v2 setBackdropScaleAdjustment:&__block_literal_global_23];
  [v2 setGroupNameBase:@"Add-Sheet"];
  return v2;
}

double __50__SBHPadAddSheetViewController__newBackgroundView__block_invoke()
{
  return 0.25;
}

- (void)setWantsSeparator:(BOOL)a3
{
  if (self->_wantsSeparator != a3)
  {
    self->_BOOL wantsSeparator = a3;
    if (a3)
    {
      [(SBHPadAddSheetViewController *)self loadViewIfNeeded];
      uint64_t v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      separatorView = self->_separatorView;
      self->_separatorView = v4;

      v6 = self->_separatorView;
      v7 = [MEMORY[0x1E4FB1618] separatorColor];
      [(UIView *)v6 setBackgroundColor:v7];

      uint64_t v8 = [(UISplitViewController *)self->_splitViewController view];
      [v8 addSubview:self->_separatorView];
    }
    else
    {
      [(UIView *)self->_separatorView removeFromSuperview];
      uint64_t v8 = self->_separatorView;
      self->_separatorView = 0;
    }

    [(SBHWidgetSearchController *)self->_widgetSearchController setAlwaysShowBarBackground:self->_wantsSeparator];
    left = self->_left;
    BOOL wantsSeparator = self->_wantsSeparator;
    [(SBHAddWidgetSheetViewController *)left setShouldCenterAppCells:wantsSeparator];
  }
}

- (void)closeButtonTapped:(id)a3
{
  id v4 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 addWidgetSheetViewControllerDidCancel:self];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHPadAddSheetViewController;
  [(SBHPadAddSheetViewController *)&v4 viewWillAppear:a3];
  [(SBHPadAddSheetViewController *)self configureViewsForCurrentInterfaceOrientation];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHPadAddSheetViewController;
  [(SBHPadAddSheetViewController *)&v4 viewDidAppear:a3];
  [(SBHPadAddSheetViewController *)self _layoutSeparatorView];
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SBHPadAddSheetViewController;
  [(SBHPadAddSheetViewController *)&v9 viewDidLayoutSubviews];
  widgetSearchController = self->_widgetSearchController;
  objc_super v4 = [(SBHPadAddSheetViewController *)self view];
  [v4 bounds];
  [(SBHWidgetSearchController *)widgetSearchController updateSearchBarContentInsetsWithWidth:v5];

  v6 = [(SBHWidgetSearchController *)self->_widgetSearchController searchBar];
  [v6 sizeToFit];

  v7 = [(SBHWidgetSearchController *)self->_widgetSearchController searchBar];
  [v7 layoutIfNeeded];

  [(SBHPadAddSheetViewController *)self _layoutSearchBarGradientMaskLayers];
  [(SBHPadAddSheetViewController *)self _layoutSeparatorView];
  uint64_t v8 = [(SBHPadAddSheetViewController *)self sheetPresentationController];
  [(SBHWidgetSearchController *)self->_widgetSearchController grabberTopSpacing];
  objc_msgSend(v8, "_setGrabberTopSpacing:");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  uint64_t v8 = SBFWindowForViewControllerTransition();
  uint64_t v9 = [v8 _toWindowOrientation];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__SBHPadAddSheetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_1E6AAEFB0;
  v11[4] = self;
  v11[5] = v9;
  [v7 animateAlongsideTransition:v11 completion:0];
  v10.receiver = self;
  v10.super_class = (Class)SBHPadAddSheetViewController;
  -[SBHPadAddSheetViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __83__SBHPadAddSheetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) configureViewsForInterfaceOrientation:*(void *)(a1 + 40)];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  [(SBHAddWidgetSheetViewController *)self->_left updateSearchResultsForSearchController:a3];
  [(SBHPadAddSheetViewController *)self setNeedsUpdateContentUnavailableConfiguration];
}

- (id)contentUnavailableConfigurationState
{
  return [(SBHAddWidgetSheetViewController *)self->_left contentUnavailableConfigurationState];
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4 = [(SBHAddWidgetSheetViewController *)self->_left _updatedContentUnavailableConfigurationUsingState:a3];
  [(SBHPadAddSheetViewController *)self setContentUnavailableConfiguration:v4];
}

- (UIEdgeInsets)preferredInsetsForSheetPresentationInInterfaceOrientation:(int64_t)a3
{
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  unint64_t v4 = SBHScreenTypeForCurrentDevice();
  SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation(v4, a3, (uint64_t)v9);
  double v5 = *(double *)v9;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = *(double *)v9;
  result.right = v8;
  result.bottom = v7;
  result.left = v5;
  result.top = v6;
  return result;
}

- (void)setAddWidgetSheetWidgetBackgroundType:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBHPadAddSheetViewController;
  -[SBHAddWidgetSheetViewControllerBase setAddWidgetSheetWidgetBackgroundType:](&v6, sel_setAddWidgetSheetWidgetBackgroundType_);
  [(SBHAddWidgetSheetViewControllerBase *)self->_left setAddWidgetSheetWidgetBackgroundType:a3];
  double v5 = [(SBHPadAddSheetViewController *)self _detailViewController];
  [v5 setAddWidgetSheetWidgetBackgroundType:a3];
}

- (void)configureViewsForInterfaceOrientation:(int64_t)a3
{
  double v5 = [(SBHPadAddSheetViewController *)self view];
  objc_super v6 = [v5 _screen];
  [v6 _referenceBounds];
  double v8 = v7;
  double v10 = v9;

  if ((unint64_t)(a3 - 3) >= 2) {
    double v11 = v10;
  }
  else {
    double v11 = v8;
  }
  if ((unint64_t)(a3 - 3) < 2) {
    double v8 = v10;
  }
  [(SBHPadAddSheetViewController *)self preferredInsetsForSheetPresentationInInterfaceOrientation:a3];
  -[SBHPadAddSheetViewController setPreferredContentSize:](self, "setPreferredContentSize:", v8 - (v12 + v13), v11 - (v14 + v15));
  [(SBHPadAddSheetViewController *)self _paddedSidebarWidthForInterfaceOrientation:a3];
  double v17 = v16;
  double v18 = *MEMORY[0x1E4FB2F10];
  if (self->_wantsSeparator) {
    double v16 = *MEMORY[0x1E4FB2F10];
  }
  [(UISplitViewController *)self->_splitViewController setPreferredPrimaryColumnWidth:v16];
  splitViewController = self->_splitViewController;
  if (self->_wantsSeparator) {
    double v20 = v18;
  }
  else {
    double v20 = v17;
  }
  [(UISplitViewController *)splitViewController setMaximumPrimaryColumnWidth:v20];
}

- (void)configureViewsForCurrentInterfaceOrientation
{
  v3 = [(SBHPadAddSheetViewController *)self view];
  double v5 = [v3 window];

  unint64_t v4 = v5;
  if (!v5) {
    unint64_t v4 = self;
  }
  [(SBHPadAddSheetViewController *)self configureViewsForInterfaceOrientation:[(SBHPadAddSheetViewController *)v4 interfaceOrientation]];
}

- (double)_columnSpacing
{
  v2 = [(SBHAddWidgetSheetViewControllerBase *)self listLayoutProvider];
  v3 = [v2 layoutForIconLocation:@"SBIconLocationRoot"];

  [v3 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassSmall"];
  double v5 = v4;
  [v3 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassMedium"];
  double v7 = v6 + v5 * -2.0;

  return v7;
}

- (unint64_t)_numberOfWidgetColumnsThatFitInWidth:(double)a3
{
  double v5 = [(SBHAddWidgetSheetViewControllerBase *)self listLayoutProvider];
  double v6 = [v5 layoutForIconLocation:@"SBIconLocationRoot"];

  [v6 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassSmall"];
  double v8 = v7;
  [v6 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassMedium"];
  double v10 = v9 - v8;
  [(SBHPadAddSheetViewController *)self _metricsForCurrentOrientation];
  unint64_t v11 = (unint64_t)((v10 - v8 - 0.0 - 0.0 + a3) / v10);
  if (v11 <= 2) {
    unint64_t v11 = 2;
  }
  if (v11 >= 5) {
    unint64_t v12 = 5;
  }
  else {
    unint64_t v12 = v11;
  }

  return v12;
}

- (double)_widthNeededForWidgetColumns:(unint64_t)a3
{
  double v5 = [(SBHAddWidgetSheetViewControllerBase *)self listLayoutProvider];
  double v6 = [v5 layoutForIconLocation:@"SBIconLocationRoot"];

  [v6 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassSmall"];
  double v8 = v7;
  [v6 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassMedium"];
  double v10 = v9 - v8;
  [(SBHPadAddSheetViewController *)self _metricsForCurrentOrientation];

  return 0.0 - (v10 - v8 - (double)a3 * v10) + 0.0;
}

- (double)_paddedSidebarWidthForInterfaceOrientation:(int64_t)a3
{
  return 0.0 + 0.0;
}

- (void)_layoutSearchBarGradientMaskLayers
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4FA5F00] gradientMaskLayerInsetsForFeatherBlurRecipe:4];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = [(SBHWidgetSearchController *)self->_widgetSearchController searchBar];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v20 = self->_searchBarGradientMaskLayers;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    double v23 = v19 - (v4 + v8);
    double v24 = v17 - (v6 + v10);
    double v25 = v4 + v15;
    double v26 = v6 + v13;
    uint64_t v27 = *(void *)v30;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v28++), "setFrame:", v26, v25, v24, v23, (void)v29);
      }
      while (v22 != v28);
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v22);
  }
}

- (void)_layoutSeparatorView
{
  double v3 = [(UISplitViewController *)self->_splitViewController view];
  double v4 = [(SBHAddWidgetSheetViewController *)self->_left view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(SBHAddWidgetSheetViewController *)self->_left view];
  objc_msgSend(v3, "convertRect:fromView:", v13, v6, v8, v10, v12);
  double MaxX = CGRectGetMaxX(v23);

  double v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v15 scale];
  double v17 = 1.0 / v16;

  double v18 = [(SBHPadAddSheetViewController *)self view];
  [v18 bounds];
  double v20 = v19;

  separatorView = self->_separatorView;
  -[UIView setFrame:](separatorView, "setFrame:", MaxX, 0.0, v17, v20);
}

- (id)_detailViewController
{
  v2 = [(SBHPadAddSheetViewController *)self splitViewController];
  double v3 = [v2 viewControllerForColumn:2];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      double v6 = v5;
    }
    else {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [v5 navigationController];
  }
  double v9 = v8;

  double v10 = [v9 topViewController];
  uint64_t v11 = objc_opt_class();
  id v12 = v10;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      double v13 = v12;
    }
    else {
      double v13 = 0;
    }
  }
  else
  {
    double v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (SBHPadAddWidgetSheetMetrics)_metricsForOrientation:(SEL)a3
{
  if ((unint64_t)(a4 - 3) >= 2) {
    uint64_t v4 = &OBJC_IVAR___SBHPadAddSheetViewController__portraitMetrics;
  }
  else {
    uint64_t v4 = &OBJC_IVAR___SBHPadAddSheetViewController__landscapeMetrics;
  }
  id v5 = (char *)self + *v4;
  CGSize v6 = (CGSize)*((_OWORD *)v5 + 5);
  *(_OWORD *)&retstr->scaledWidgetSize.double height = *((_OWORD *)v5 + 4);
  retstr->detailWidgetPadding = v6;
  *(_OWORD *)&retstr->detailAddButtonTopSpacing = *((_OWORD *)v5 + 6);
  retstr->detailPageControlTopSpacing = *((double *)v5 + 14);
  long long v7 = *((_OWORD *)v5 + 1);
  *(_OWORD *)&retstr->sheetMargin = *(_OWORD *)v5;
  *(_OWORD *)&retstr->sidebarWidth = v7;
  long long v8 = *((_OWORD *)v5 + 3);
  *(_OWORD *)&retstr->trailingPadding = *((_OWORD *)v5 + 2);
  *(_OWORD *)&retstr->widgetScaleFactor = v8;
  return self;
}

- (SBHPadAddWidgetSheetMetrics)_metricsForCurrentOrientation
{
  uint64_t v4 = [(SBHPadAddSheetViewController *)self view];
  long long v7 = [v4 window];

  id v5 = v7;
  if (!v7) {
    id v5 = self;
  }
  [(SBHPadAddSheetViewController *)self _metricsForOrientation:[(SBHPadAddSheetViewController *)v5 interfaceOrientation]];

  return result;
}

- (void)setApplicationWidgetCollections:(id)a3
{
  objc_storeStrong((id *)&self->_applicationWidgetCollections, a3);
  id v5 = a3;
  [(SBHAddWidgetSheetViewController *)self->_left setApplicationWidgetCollections:v5];
  id v6 = [(SBHPadAddSheetViewController *)self _detailViewController];
  [v6 setApplicationWidgetCollections:v5];
}

- (void)setFavoredApplicationWidgetCollections:(id)a3
{
  id v4 = a3;
  id v5 = (NSArray *)[v4 copy];
  favoredApplicationWidgetCollections = self->_favoredApplicationWidgetCollections;
  self->_favoredApplicationWidgetCollections = v5;

  [(SBHAddWidgetSheetViewController *)self->_left setFavoredApplicationWidgetCollections:v4];
  id v7 = [(SBHPadAddSheetViewController *)self _detailViewController];
  [v7 setFavoredApplicationWidgetCollections:v4];
}

- (void)setDisfavoredApplicationWidgetCollections:(id)a3
{
  id v4 = a3;
  id v5 = (NSArray *)[v4 copy];
  disfavoredApplicationWidgetCollections = self->_disfavoredApplicationWidgetCollections;
  self->_disfavoredApplicationWidgetCollections = v5;

  [(SBHAddWidgetSheetViewController *)self->_left setDisfavoredApplicationWidgetCollections:v4];
  id v7 = [(SBHPadAddSheetViewController *)self _detailViewController];
  [v7 setDisfavoredApplicationWidgetCollections:v4];
}

- (void)setSuggestedItems:(id)a3 forGalleryLayoutSize:(unint64_t)a4
{
  id v11 = a3;
  suggestedItemsByGalleryLayoutSize = self->_suggestedItemsByGalleryLayoutSize;
  id v7 = [NSNumber numberWithUnsignedInteger:a4];
  id v8 = [(NSMutableDictionary *)suggestedItemsByGalleryLayoutSize objectForKeyedSubscript:v7];

  if (v8 != v11)
  {
    double v9 = self->_suggestedItemsByGalleryLayoutSize;
    double v10 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v9 setObject:v11 forKeyedSubscript:v10];

    [(SBHAddWidgetSheetViewController *)self->_left setSuggestedItems:v11 forGalleryLayoutSize:a4];
  }
}

- (void)setCustomApplicationWidgetCollections:(id)a3
{
  objc_storeStrong((id *)&self->_customApplicationWidgetCollections, a3);
  id v5 = a3;
  [(SBHAddWidgetSheetViewController *)self->_left setCustomApplicationWidgetCollections:v5];
  id v6 = [(SBHPadAddSheetViewController *)self _detailViewController];
  [v6 setCustomApplicationWidgetCollections:v5];
}

- (void)setAllowsFakeWidgets:(BOOL)a3
{
  self->_allowsFakeWidgets = a3;
  -[SBHAddWidgetSheetViewControllerBase setAllowsFakeWidgets:](self->_left, "setAllowsFakeWidgets:");
}

- (void)setWantsBottomAttachedPresentation:(BOOL)a3
{
  if (self->_wantsBottomAttachedPresentation != a3)
  {
    BOOL v3 = a3;
    self->_wantsBottomAttachedPresentation = a3;
    -[SBHWidgetSearchController setShouldInsetContentForGrabber:](self->_widgetSearchController, "setShouldInsetContentForGrabber:");
    id v5 = [(SBHPadAddSheetViewController *)self sheetPresentationController];
    [v5 _setWantsBottomAttached:v3];
  }
}

- (id)suggestedItemsForGalleryLayoutSize:(unint64_t)a3
{
  suggestedItemsByGalleryLayoutSize = self->_suggestedItemsByGalleryLayoutSize;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(NSMutableDictionary *)suggestedItemsByGalleryLayoutSize objectForKeyedSubscript:v4];

  return v5;
}

- (void)setPresenter:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_presenter, obj);
    [(SBHAddWidgetSheetViewController *)self->_left setPresenter:obj];
  }
}

- (void)setGalleryLayoutSize:(unint64_t)a3
{
  self->_galleryLayoutSize = a3;
  [(SBHAddWidgetSheetViewController *)self->_left setGalleryLayoutSize:"setGalleryLayoutSize:"];
  [(SBHPadAddSheetViewController *)self configureViewsForCurrentInterfaceOrientation];
}

- (void)setAddWidgetSheetLocation:(unint64_t)a3
{
  self->_addWidgetSheetLocation = a3;
  -[SBHAddWidgetSheetViewController setAddWidgetSheetLocation:](self->_left, "setAddWidgetSheetLocation:");
}

- (NSMutableDictionary)userInfo
{
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  [v6 addWidgetSheetViewController:self didSelectWidgetIconView:v5];
}

- (void)addWidgetSheetViewControllerDidCancel:(id)a3
{
  id v4 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  [v4 addWidgetSheetViewControllerDidCancel:self];
}

- (void)addWidgetSheetViewControllerWillAppear:(id)a3
{
  id v4 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  [v4 addWidgetSheetViewControllerWillAppear:self];
}

- (void)addWidgetSheetViewControllerDidAppear:(id)a3
{
  id v4 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  [v4 addWidgetSheetViewControllerDidAppear:self];
}

- (void)addWidgetSheetViewControllerWillDisappear:(id)a3
{
  id v4 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  [v4 addWidgetSheetViewControllerWillDisappear:self];
}

- (void)addWidgetSheetViewControllerDidDisappear:(id)a3
{
  id v4 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  [v4 addWidgetSheetViewControllerDidDisappear:self];
}

- (SBHWidgetDragHandling)widgetDragHandler
{
  v2 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  BOOL v3 = [v2 widgetDragHandler];

  return (SBHWidgetDragHandling *)v3;
}

- (id)backgroundViewMatchingMaterialBeneathAddWidgetSheetViewController:(id)a3
{
  id v3 = [(SBHPadAddSheetViewController *)self _newBackgroundView];
  return v3;
}

- (id)addWidgetSheetViewController:(id)a3 detailViewControllerForWidgetCollection:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 addWidgetSheetViewController:self detailViewControllerForWidgetCollection:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)galleryViewControllerForAddWidgetSheetViewController:(id)a3
{
  id v4 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 galleryViewControllerForAddWidgetSheetViewController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSArray)applicationWidgetCollections
{
  return self->_applicationWidgetCollections;
}

- (NSArray)favoredApplicationWidgetCollections
{
  return self->_favoredApplicationWidgetCollections;
}

- (NSArray)disfavoredApplicationWidgetCollections
{
  return self->_disfavoredApplicationWidgetCollections;
}

- (NSMutableDictionary)suggestedItemsByGalleryLayoutSize
{
  return self->_suggestedItemsByGalleryLayoutSize;
}

- (void)setSuggestedItemsByGalleryLayoutSize:(id)a3
{
}

- (NSArray)customApplicationWidgetCollections
{
  return self->_customApplicationWidgetCollections;
}

- (BOOL)allowsFakeWidgets
{
  return self->_allowsFakeWidgets;
}

- (BOOL)wantsBottomAttachedPresentation
{
  return self->_wantsBottomAttachedPresentation;
}

- (SBHWidgetSheetViewControllerPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (SBHWidgetSheetViewControllerPresenter *)WeakRetained;
}

- (unint64_t)galleryLayoutSize
{
  return self->_galleryLayoutSize;
}

- (unint64_t)addWidgetSheetLocation
{
  return self->_addWidgetSheetLocation;
}

- (BOOL)wantsCloseButton
{
  return self->_wantsCloseButton;
}

- (void)setWantsCloseButton:(BOOL)a3
{
  self->_wantsCloseButton = a3;
}

- (BOOL)wantsSeparator
{
  return self->_wantsSeparator;
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UISplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (void)setSplitViewController:(id)a3
{
}

- (SBHAddWidgetSheetViewController)left
{
  return self->_left;
}

- (void)setLeft:(id)a3
{
}

- (SBHWidgetSearchController)widgetSearchController
{
  return self->_widgetSearchController;
}

- (void)setWidgetSearchController:(id)a3
{
}

- (NSArray)searchBarGradientMaskLayers
{
  return self->_searchBarGradientMaskLayers;
}

- (void)setSearchBarGradientMaskLayers:(id)a3
{
}

- (UIView)redBox
{
  return self->_redBox;
}

- (void)setRedBox:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_redBox, 0);
  objc_storeStrong((id *)&self->_searchBarGradientMaskLayers, 0);
  objc_storeStrong((id *)&self->_widgetSearchController, 0);
  objc_storeStrong((id *)&self->_left, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_customApplicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_suggestedItemsByGalleryLayoutSize, 0);
  objc_storeStrong((id *)&self->_disfavoredApplicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_favoredApplicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_applicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end