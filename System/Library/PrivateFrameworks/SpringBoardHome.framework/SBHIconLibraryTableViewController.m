@interface SBHIconLibraryTableViewController
+ (Class)tableViewClass;
- (BOOL)_executeQuery:(id)a3;
- (BOOL)_isIndexPathVisible:(id)a3;
- (BOOL)_isViewControllerVisible;
- (BOOL)_observeIcon:(id)a3;
- (BOOL)_shouldShowNoResultsViewForQueryResult:(id)a3;
- (BOOL)_startObservingIcon:(id)a3;
- (BOOL)disablesNullQueryExecution;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4;
- (BOOL)isDisplayingIconView:(id)a3;
- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isPresentingIconLocation:(id)a3;
- (BOOL)searchControllerShouldReturn:(id)a3;
- (BOOL)tableView:(id)a3 dragSessionAllowsMoveOperation:(id)a4;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4;
- (CGRect)tableView:(id)a3 frameForSectionIndexGivenProposedFrame:(CGRect)a4;
- (NSSet)presentedIconLocations;
- (SBHIconImageCache)iconImageCache;
- (SBHIconLibraryQuery)currentQuery;
- (SBHIconLibraryTableViewController)init;
- (SBHIconLibraryTableViewController)initWithCoder:(id)a3;
- (SBHIconLibraryTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBHIconLibraryTableViewController)initWithStyle:(int64_t)a3;
- (SBHIconLibraryTableViewControllerLayoutDelegate)layoutDelegate;
- (SBHIconLibraryTableViewControllerObserver)observer;
- (SBHIconModel)iconModel;
- (SBHIconTableViewDiffableDataSource)dataSource;
- (SBHLibraryCategoryMap)libraryCategoryMap;
- (SBHLibrarySearchController)searchController;
- (SBHTableViewIconLibrary)library;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconViewProviding)iconViewProvider;
- (SBRootFolder)rootFolder;
- (UIEdgeInsets)visibleContainerInsets;
- (UIView)headerBlurView;
- (_UILegibilitySettings)legibilitySettings;
- (double)headerTopOccludingInset;
- (id)_contentUnavailableConfigurationState;
- (id)_createIconView;
- (id)_dragSessionForIconView:(id)a3;
- (id)_iconFilter;
- (id)_iconViewAtIndexPath:(id)a3;
- (id)_iconViewForDragSession:(id)a3;
- (id)_iconViewForIcon:(id)a3;
- (id)_indexPathForDefaultSearchResult;
- (id)_nullQuery;
- (id)_processDragItemsForIconView:(id)a3 session:(id)a4;
- (id)_queryForCurrentSearchTextField;
- (id)_searchTextField;
- (id)_visibleIcons;
- (id)_visibleIndexPaths;
- (id)_visibleSectionIndicies;
- (id)acquireLibrarySearchPrewarmAssertionForReason:(id)a3;
- (id)firstIconViewForIcon:(id)a3;
- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4;
- (id)iconViewForIcon:(id)a3 location:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 dragPreviewParametersForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)_configureCell:(id)a3 forIcon:(id)a4;
- (void)_handleAlphaFadeForCell:(id)a3 atIndexPath:(id)a4;
- (void)_handleDidTapEmptyResultsArea:(id)a3;
- (void)_handleLowQualityAlphaFade;
- (void)_iconModelWillReload:(id)a3;
- (void)_invalidatePrewarmAssertion:(id)a3;
- (void)_logLaunchOfIcon:(id)a3 atIndexPath:(id)a4;
- (void)_mapIconView:(id)a3 forDragSession:(id)a4;
- (void)_notifyDelegatesOfAppLaunchFromSearchController:(id)a3;
- (void)_refreshIconIfVisible:(id)a3;
- (void)_reloadAppIcons;
- (void)_reloadRowsAtIndexPaths:(id)a3;
- (void)_reloadVisibleCells;
- (void)_resetDragSession:(id)a3;
- (void)_setupLibrary;
- (void)_setupObservedIcons;
- (void)_stopObservingIcon:(id)a3;
- (void)_teardownLibrary;
- (void)_teardownObservedIcons;
- (void)_unobserveIcon:(id)a3;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)_updateSectionHeaderHeight;
- (void)_updateShowHeadersFromQueryResult:(id)a3;
- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4;
- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3;
- (void)iconLibrary:(id)a3 hasUpdatedQueryResult:(id)a4;
- (void)iconViewDidEndDrag:(id)a3;
- (void)iconViewWillBeginDrag:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setDisablesNullQueryExecution:(BOOL)a3;
- (void)setHeaderBlurView:(id)a3;
- (void)setIconImageCache:(id)a3;
- (void)setIconModel:(id)a3;
- (void)setIconViewProvider:(id)a3;
- (void)setLayoutDelegate:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLibraryCategoryMap:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setObserver:(id)a3;
- (void)setRootFolder:(id)a3;
- (void)setSearchController:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBHIconLibraryTableViewController

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(SBHIconLibraryTableViewController *)self _visibleIcons];
  v6 = [(SBHIconLibraryTableViewController *)self dataSource];
  v7 = [v6 queryResult];

  v8 = [(SBHIconLibraryTableViewController *)self _visibleSectionIndicies];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__SBHIconLibraryTableViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke;
  v12[3] = &unk_1E6AB0540;
  id v13 = v7;
  id v14 = v5;
  v15 = self;
  id v16 = v4;
  id v9 = v4;
  id v10 = v5;
  id v11 = v7;
  [v8 enumerateIndexesUsingBlock:v12];
}

- (SBHIconTableViewDiffableDataSource)dataSource
{
  dataSource = self->_dataSource;
  if (dataSource)
  {
    v3 = dataSource;
  }
  else
  {
    objc_initWeak(&location, self);
    v5 = [SBHIconTableViewDiffableDataSource alloc];
    v6 = [(SBHIconLibraryTableViewController *)self tableView];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __47__SBHIconLibraryTableViewController_dataSource__block_invoke;
    id v13 = &unk_1E6AB04F0;
    objc_copyWeak(&v14, &location);
    v7 = [(UITableViewDiffableDataSource *)v5 initWithTableView:v6 cellProvider:&v10];
    v8 = self->_dataSource;
    self->_dataSource = v7;

    -[UITableViewDiffableDataSource setDefaultRowAnimation:](self->_dataSource, "setDefaultRowAnimation:", 5, v10, v11, v12, v13);
    [(SBHIconTableViewDiffableDataSource *)self->_dataSource setIconLibrary:self->_library];
    v3 = self->_dataSource;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (id)_visibleSectionIndicies
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(SBHIconLibraryTableViewController *)self _visibleIndexPaths];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addIndex:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "section"));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_visibleIcons
{
  char v3 = [(SBHIconLibraryTableViewController *)self isViewLoaded];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  if (v3)
  {
    uint64_t v5 = [(SBHIconLibraryTableViewController *)self _visibleIndexPaths];
    uint64_t v6 = [v5 allObjects];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__SBHIconLibraryTableViewController__visibleIcons__block_invoke;
    v10[3] = &unk_1E6AB04C8;
    v10[4] = self;
    uint64_t v7 = objc_msgSend(v6, "bs_mapNoNulls:", v10);
    v8 = [v4 setWithArray:v7];
  }
  else
  {
    v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  return v8;
}

- (id)_visibleIndexPaths
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  char v3 = [(SBHIconLibraryTableViewController *)self tableView];
  id v4 = [v3 indexPathsForVisibleRows];
  uint64_t v5 = [v2 setWithArray:v4];

  return v5;
}

+ (Class)tableViewClass
{
  return (Class)self;
}

- (SBHIconLibraryTableViewController)init
{
  v15.receiver = self;
  v15.super_class = (Class)SBHIconLibraryTableViewController;
  v2 = [(SBHIconLibraryTableViewController *)&v15 initWithStyle:0];
  if (v2)
  {
    +[SBHLocalizedIndexedCollationStrategy prewarm];
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4FB21E0]) initWithStyle:1];
    legibilitySettings = v2->_legibilitySettings;
    v2->_legibilitySettings = (_UILegibilitySettings *)v3;

    uint64_t v5 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v6 = [v5 appLibrarySettings];
    settings = v2->_settings;
    v2->_settings = (SBHAppLibrarySettings *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    grabbedIconViews = v2->_grabbedIconViews;
    v2->_grabbedIconViews = (NSHashTable *)v8;

    long long v10 = [(SBHScrollableIconViewInteraction *)[SBHScrollableZoomingIconViewInteraction alloc] initWithContainer:v2];
    scrollingInteraction = v2->_scrollingInteraction;
    v2->_scrollingInteraction = &v10->super;

    [(PTSettings *)v2->_settings addKeyObserver:v2];
    long long v12 = objc_msgSend(NSString, "stringWithFormat:", @"SBHIconLibraryTableViewController-<%p>", v2);
    [(SBHIconLibraryTableViewController *)v2 setFocusGroupIdentifier:v12];

    long long v13 = [MEMORY[0x1E4FB16C8] currentDevice];
    v2->_needsLowQualityAlphaFade = objc_msgSend(v13, "sbf_featherBlurGraphicsQuality") < 100;
  }
  return v2;
}

- (SBHIconLibraryTableViewController)initWithCoder:(id)a3
{
  return 0;
}

- (SBHIconLibraryTableViewController)initWithStyle:(int64_t)a3
{
  return 0;
}

- (SBHIconLibraryTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (void)viewDidLoad
{
  v49.receiver = self;
  v49.super_class = (Class)SBHIconLibraryTableViewController;
  [(SBHTableViewController *)&v49 viewDidLoad];
  uint64_t v3 = [(SBHIconLibraryTableViewController *)self listLayoutProvider];
  id v4 = [v3 layoutForIconLocation:@"SBIconLocationAppLibrarySearch"];
  [v4 iconImageInfo];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  +[SBHIconTableViewCell defaultTableViewCellHeightForIconImageInfo:](SBHIconTableViewCell, "defaultTableViewCellHeightForIconImageInfo:", v6, v8, v10, v12);
  double v48 = v13;
  id v14 = [v3 layoutForIconLocation:@"SBIconLocationAppLibrary"];
  objc_super v15 = [v14 appLibraryVisualConfiguration];
  int v16 = [v15 usesInsetPlatterSearchAppearance];

  self->_usesPlatterAppearance = v16;
  v17 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v18 = [v17 userInterfaceIdiom];

  if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    +[SBHIconTableViewCell defaultTableViewCellHorizontalMargin];
    UIEdgeInsetsMakeWithEdges();
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
  }
  else
  {
    v27 = [v3 layoutForIconLocation:@"SBIconLocationRoot"];
    double v20 = SBHIconListLayoutNonDefaultIconGridSizeClassLayoutInsets(v27, 1);
    double v22 = v28;
    double v24 = v29;
    double v26 = v30;
  }
  +[SBHIconTableViewCell defaultTableViewCellSeparatorInsetsForIconImageInfo:](SBHIconTableViewCell, "defaultTableViewCellSeparatorInsetsForIconImageInfo:", v6, v8, v10, v12);
  UIEdgeInsetsAdd();
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  v39 = [(SBHIconLibraryTableViewController *)self tableView];
  [v39 setDragInteractionEnabled:1];
  [v39 setDragDelegate:self];
  [v39 setClipsToBounds:0];
  v40 = [MEMORY[0x1E4FB1618] whiteColor];
  [v39 _setSectionIndexColor:v40];

  [v39 setBackgroundView:0];
  [v39 setBackgroundColor:0];
  id v41 = [(SBHIconLibraryTableViewController *)self dataSource];
  [v39 setRowHeight:v48];
  v42 = objc_opt_new();
  [v39 setTableFooterView:v42];

  [v39 setPreservesSuperviewLayoutMargins:0];
  v43 = self;
  [v39 registerClass:v43 forCellReuseIdentifier:@"IconTableViewCell"];

  v44 = self;
  [v39 registerClass:v44 forHeaderFooterViewReuseIdentifier:@"IconTableViewHeaderFooterView"];

  [v39 setContentInsetAdjustmentBehavior:1];
  [v39 setKeyboardDismissMode:1];
  [v39 _setDrawsSeparatorAtTopOfSections:0];
  [v39 setInsetsContentViewsToSafeArea:0];
  objc_msgSend(v39, "setLayoutMargins:", v20, v22, v24, v26);
  objc_msgSend(v39, "setSeparatorInset:", v32, v34, v36, v38);
  [v39 setSectionHeaderTopPadding:0.0];
  if (v16)
  {
    [v39 _setHeaderAndFooterViewsFloat:0];
    self->_needsLowQualityAlphaFade = 0;
  }
  else
  {
    [v39 _setUseLegacySectionHeaderFooterPinningBehavior:1];
  }
  [(SBHIconLibraryTableViewController *)self _updateSectionHeaderHeight];
  v45 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleDidTapEmptyResultsArea_];
  [v45 setCancelsTouchesInView:0];
  [v45 setDelaysTouchesBegan:0];
  [v45 setDelaysTouchesEnded:0];
  [v45 setDelegate:self];
  [v39 addGestureRecognizer:v45];
  v46 = [MEMORY[0x1E4FB1618] colorWithRed:0.1 green:0.1 blue:0.1 alpha:1.0];
  v47 = [MEMORY[0x1E4FB1EA0] vibrantEffectWithCompositingMode:24 compositingColor:v46];
  [v39 setSeparatorEffect:v47];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBHIconLibraryTableViewController;
  [(SBHTableViewController *)&v6 viewWillAppear:a3];
  [(SBHIconLibraryTableViewController *)self _setupObservedIcons];
  id v4 = [(SBHIconLibraryTableViewController *)self acquireLibrarySearchPrewarmAssertionForReason:@"SBHIconLibraryTableViewController view will appear"];
  isVisibleLibrarySearchPrewarmAssertion = self->_isVisibleLibrarySearchPrewarmAssertion;
  self->_isVisibleLibrarySearchPrewarmAssertion = v4;

  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHIconLibraryTableViewController;
  [(SBHIconLibraryTableViewController *)&v5 viewDidAppear:a3];
  self->_hasAppeared = 1;
  id v4 = [(SBHIconLibraryTableViewController *)self observer];
  [v4 libraryTableViewControllerDidAppear:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBHIconLibraryTableViewController;
  [(SBHTableViewController *)&v8 viewWillDisappear:a3];
  id v4 = [(SBHIconLibraryTableViewController *)self observer];
  [v4 libraryTableViewControllerWillDisappear:self];

  objc_super v5 = [(SBHIconLibraryTableViewController *)self searchController];
  objc_super v6 = [v5 searchBar];
  [v6 endEditing:1];

  [(SBHIconLibraryTableViewController *)self _teardownObservedIcons];
  [(BSInvalidatable *)self->_isVisibleLibrarySearchPrewarmAssertion invalidate];
  isVisibleLibrarySearchPrewarmAssertion = self->_isVisibleLibrarySearchPrewarmAssertion;
  self->_isVisibleLibrarySearchPrewarmAssertion = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHIconLibraryTableViewController;
  [(SBHIconLibraryTableViewController *)&v5 viewDidDisappear:a3];
  self->_hasAppeared = 0;
  dragSessionsForIconView = self->_dragSessionsForIconView;
  self->_dragSessionsForIconView = 0;

  [(SBHIconLibraryTableViewController *)self _reloadAppIcons];
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v12 = a3;
  if ([(SBHTableViewController *)self showNoResultsView])
  {
    id v4 = [MEMORY[0x1E4FB1658] searchConfiguration];
    objc_super v5 = [v4 updatedConfigurationForState:v12];

    objc_super v6 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
    double v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    objc_super v8 = [v7 resolvedColorWithTraitCollection:v6];

    double v9 = [v5 imageProperties];
    [v9 setTintColor:v8];

    double v10 = [v5 textProperties];
    [v10 setColor:v8];

    double v11 = [v5 secondaryTextProperties];
    [v11 setColor:v8];
  }
  else
  {
    objc_super v5 = 0;
  }
  [(SBHIconLibraryTableViewController *)self _setContentUnavailableConfiguration:v5];
}

- (id)_contentUnavailableConfigurationState
{
  v7.receiver = self;
  v7.super_class = (Class)SBHIconLibraryTableViewController;
  uint64_t v3 = [(SBHIconLibraryTableViewController *)&v7 _contentUnavailableConfigurationState];
  id v4 = [(SBHIconLibraryTableViewController *)self _searchTextField];
  objc_super v5 = [v4 searchText];
  [v3 setSearchControllerText:v5];

  return v3;
}

- (double)headerTopOccludingInset
{
  uint64_t v3 = [(SBHIconLibraryTableViewController *)self searchController];
  id v4 = [v3 searchBar];
  objc_super v5 = [v4 searchTextField];

  if (!v5)
  {
    v36.receiver = self;
    v36.super_class = (Class)SBHIconLibraryTableViewController;
    [(SBHTableViewController *)&v36 headerTopOccludingInset];
    goto LABEL_5;
  }
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(SBHIconLibraryTableViewController *)self view];
  objc_super v15 = [v14 superview];
  objc_msgSend(v5, "convertRect:toView:", v15, v7, v9, v11, v13);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  double v24 = [(SBHIconLibraryTableViewController *)self view];
  [v24 frame];
  v41.origin.CGFloat x = v25;
  v41.origin.CGFloat y = v26;
  v41.size.CGFloat width = v27;
  v41.size.CGFloat height = v28;
  v37.origin.CGFloat x = v17;
  v37.origin.CGFloat y = v19;
  v37.size.CGFloat width = v21;
  v37.size.CGFloat height = v23;
  CGRect v38 = CGRectIntersection(v37, v41);
  CGFloat x = v38.origin.x;
  CGFloat y = v38.origin.y;
  CGFloat width = v38.size.width;
  CGFloat height = v38.size.height;

  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  double v33 = 0.0;
  if (!CGRectIsNull(v39))
  {
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v40);
LABEL_5:
    double v33 = MaxY;
  }

  return v33;
}

- (void)setIconModel:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_iconModel] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_iconModel, a3);
    [(SBHIconLibraryTableViewController *)self _teardownObservedIcons];
    [(SBHIconLibraryTableViewController *)self _teardownLibrary];
  }
}

- (void)_teardownLibrary
{
  [(SBHIconTableViewDiffableDataSource *)self->_dataSource setIconLibrary:0];
  [(SBHTableViewIconLibrary *)self->_library removeObserver:self];
  librarCGFloat y = self->_library;
  self->_librarCGFloat y = 0;

  libraryPrewarmAssertions = self->_libraryPrewarmAssertions;
  self->_libraryPrewarmAssertions = 0;

  currentQuerCGFloat y = self->_currentQuery;
  self->_currentQuerCGFloat y = 0;
}

- (void)_setupLibrary
{
  if (!self->_library && self->_iconModel)
  {
    double v8 = [(SBHIconLibraryAbstractQueryEngine *)[SBHIconLibrarySpotlightQueryEngine alloc] initWithIconModel:self->_iconModel];
    uint64_t v3 = [[SBHTableViewIconLibrary alloc] initWithIconModel:self->_iconModel queryEngine:v8];
    librarCGFloat y = self->_library;
    self->_librarCGFloat y = v3;

    [(SBHTableViewIconLibrary *)self->_library addObserver:self];
    id v5 = [(SBHTableViewIconLibrary *)self->_library lastQueryResults];
    double v6 = [v5 query];
    currentQuerCGFloat y = self->_currentQuery;
    self->_currentQuerCGFloat y = v6;

    [(SBHIconTableViewDiffableDataSource *)self->_dataSource setIconLibrary:self->_library];
  }
}

- (void)setRootFolder:(id)a3
{
  id v6 = a3;
  if ((-[SBRootFolder isEqual:](self->_rootFolder, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_rootFolder, a3);
    id v5 = [v6 model];
    [(SBHIconLibraryTableViewController *)self setIconModel:v5];
  }
}

- (void)setIconViewProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_iconViewProvider, obj);
    int v6 = [(SBHIconLibraryTableViewController *)self isViewLoaded];
    id v5 = obj;
    if (v6)
    {
      double v7 = [(SBHIconLibraryTableViewController *)self tableView];
      [v7 reloadData];

      id v5 = obj;
    }
  }
}

- (void)setLibraryCategoryMap:(id)a3
{
  id v7 = a3;
  if (!-[SBHLibraryCategoryMap isEqualToCategoryMap:](self->_libraryCategoryMap, "isEqualToCategoryMap:"))
  {
    id v4 = (SBHLibraryCategoryMap *)[v7 copy];
    libraryCategoryMap = self->_libraryCategoryMap;
    self->_libraryCategoryMap = v4;

    if ([(SBHIconLibraryTableViewController *)self isViewLoaded])
    {
      int v6 = [(SBHIconLibraryTableViewController *)self tableView];
      [v6 reloadData];
    }
  }
}

- (UIView)headerBlurView
{
  v2 = [(SBHIconLibraryTableViewController *)self tableView];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 headerBlur];

  return (UIView *)v7;
}

id __47__SBHIconLibraryTableViewController_dataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [a2 dequeueReusableCellWithIdentifier:@"IconTableViewCell"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v11 = WeakRetained;
  if (WeakRetained)
  {
    double v12 = [WeakRetained focusGroupIdentifier];
    [v9 setFocusGroupIdentifier:v12];

    double v13 = [v11 dataSource];
    id v14 = [v13 queryResult];
    objc_super v15 = [v14 iconForItemIdentifier:v8];

    if (v15)
    {
      [v11 _configureCell:v9 forIcon:v15];
      [v11 _handleAlphaFadeForCell:v9 atIndexPath:v7];
    }
    else
    {
      double v16 = SBLogIcon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __47__SBHIconLibraryTableViewController_dataSource__block_invoke_cold_1((uint64_t)v8, v16);
      }
    }
  }

  return v9;
}

- (void)_iconModelWillReload:(id)a3
{
  id v4 = +[SBHIconLibraryQueryResult nullQueryResults];
  dataSource = self->_dataSource;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__SBHIconLibraryTableViewController__iconModelWillReload___block_invoke;
  v6[3] = &unk_1E6AAC810;
  v6[4] = self;
  [(SBHIconTableViewDiffableDataSource *)dataSource applyQueryResult:v4 animatingDifferences:0 completion:v6];
}

uint64_t __58__SBHIconLibraryTableViewController__iconModelWillReload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAppIcons];
}

- (void)_refreshIconIfVisible:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    id v5 = [(SBHIconLibraryTableViewController *)self dataSource];
    id v6 = [v5 queryResult];

    id v7 = [v6 indexPathForIcon:v13];
    if (v7)
    {
      id v8 = [(SBHIconLibraryTableViewController *)self tableView];
      double v9 = [v8 indexPathsForVisibleRows];
      int v10 = [v9 containsObject:v7];

      if (v10)
      {
        double v11 = [(SBHIconLibraryTableViewController *)self tableView];
        double v12 = [v11 cellForRowAtIndexPath:v7];

        [(SBHIconLibraryTableViewController *)self _configureCell:v12 forIcon:v13];
      }
    }

    id v4 = v13;
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  -[SBHIconLibraryTableViewController _updateShowHeadersFromQueryResult:](self, "_updateShowHeadersFromQueryResult:", 0, a4);
  id v5 = [(SBHIconLibraryTableViewController *)self tableView];
  [v5 reloadData];
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBHIconLibraryTableViewController *)self _reloadVisibleCells];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v8 = [(SBHIconLibraryTableViewController *)self _iconViewAtIndexPath:v6];
  [v8 performTap];
  id v7 = [v8 icon];
  [(SBHIconLibraryTableViewController *)self _logLaunchOfIcon:v7 atIndexPath:v6];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (self->_showHeaders)
  {
    id v6 = a3;
    id v7 = [(SBHIconLibraryTableViewController *)self tableView:v6 titleForHeaderInSection:a4];
    id v8 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"IconTableViewHeaderFooterView"];

    [v8 setTitle:v7];
    double v9 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    double v11 = 4.0;
    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v11 = 12.0;
    }
    objc_msgSend(v8, "setTitleLayoutMargins:", v11, 0.0, 4.0, 0.0);
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(SBHIconLibraryTableViewController *)self dataSource];
  id v8 = [v7 queryResult];
  id v9 = [v8 iconAtIndexPath:v6];

  [(SBHIconLibraryTableViewController *)self _observeIcon:v9];
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  objc_msgSend(a4, "icon", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(SBHIconLibraryTableViewController *)self _unobserveIcon:v6];
}

- (CGRect)tableView:(id)a3 frameForSectionIndexGivenProposedFrame:(CGRect)a4
{
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v8 = a3;
  [v8 frame];
  double Height = CGRectGetHeight(v20);
  [v8 adjustedContentInset];
  double v11 = v10;

  double v12 = [(SBHIconLibraryTableViewController *)self layoutDelegate];
  [v12 fixedBottomLayoutInsetInWindowCoordinateSpaceForTableViewController:self];
  double v14 = v13;

  [(SBHTableViewController *)self keyboardFrame];
  double v15 = CGRectGetHeight(v21) - v14;
  if (v15 < 0.0) {
    double v15 = 0.0;
  }
  double v16 = Height - v11 - v15;
  double v17 = x;
  double v18 = y;
  double v19 = width;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return [a3 numberOfSections] - 1 > a4;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(SBHIconLibraryTableViewController *)self dataSource];
  id v6 = [v5 queryResult];
  id v7 = [v6 titleForSectionAtIndex:a4];

  return v7;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  return 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  [(SBHScrollableIconViewInteraction *)self->_scrollingInteraction clippingScrollViewDidScroll:a3];
  [(SBHIconLibraryTableViewController *)self _handleLowQualityAlphaFade];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if (![(SBHTableViewController *)self showNoResultsView])
  {
    [(SBHScrollableIconViewInteraction *)self->_scrollingInteraction updateScrolling:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained libraryTableViewControllerWillBeginDragging:self];
    }
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(SBHScrollableIconViewInteraction *)self->_scrollingInteraction updateScrolling:0];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(SBHScrollableIconViewInteraction *)self->_scrollingInteraction updateScrolling:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained libraryTableViewControllerDidEndDecelerating:self];
  }
}

- (UIEdgeInsets)visibleContainerInsets
{
  v2 = [(SBHIconLibraryTableViewController *)self headerBlurView];
  [v2 frame];
  CGFloat Height = CGRectGetHeight(v8);

  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = Height;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v7;
  return result;
}

- (void)_handleLowQualityAlphaFade
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_needsLowQualityAlphaFade)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = [(SBHIconLibraryTableViewController *)self tableView];
    double v4 = [v3 indexPathsForVisibleRows];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [(SBHIconLibraryTableViewController *)self _handleAlphaFadeForCell:0 atIndexPath:*(void *)(*((void *)&v9 + 1) + 8 * i)];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_handleAlphaFadeForCell:(id)a3 atIndexPath:(id)a4
{
  unint64_t v22 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v22 | v6)
  {
    if (self->_needsLowQualityAlphaFade && self->_hasAppeared)
    {
      uint64_t v7 = [(SBHIconLibraryTableViewController *)self tableView];
      uint64_t v8 = v22;
      if (!v22)
      {
        uint64_t v8 = [v7 cellForRowAtIndexPath:v6];
      }
      unint64_t v22 = v8;
      [v7 rectForRowAtIndexPath:v6];
      long long v9 = [(id)v22 iconView];
      [v9 frame];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v18 = [v7 superview];
      objc_msgSend((id)v22, "convertRect:toView:", v18, v11, v13, v15, v17);
      double v20 = v19;

      [v7 rowHeight];
      objc_msgSend((id)v22, "setAlpha:", fmin(fmax(v20 / (v21 + v21) * 0.75 / 0.66 + 0.25, 0.25), 1.0));
    }
  }
  else
  {
    unint64_t v22 = 0;
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBHIconLibraryTableViewController *)self tableView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = objc_msgSend(v5, "indexPathForRowAtPoint:", v7, v9);
  LOBYTE(v4) = v10 == 0;

  return (char)v4;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = [(SBHIconLibraryTableViewController *)self _queryForCurrentSearchTextField];
  [(SBHIconLibraryTableViewController *)self _executeQuery:v4];
}

- (BOOL)searchControllerShouldReturn:(id)a3
{
  id v4 = [(SBHIconLibraryTableViewController *)self currentQuery];
  uint64_t v5 = [v4 searchString];
  double v6 = (void *)[v5 length];

  if (v6)
  {
    double v7 = [(SBHIconLibraryTableViewController *)self _indexPathForDefaultSearchResult];
    double v8 = [v4 markedTextRange];
    LOBYTE(v6) = v8 == 0;

    if (v7 && !v8)
    {
      double v6 = [(SBHIconLibraryTableViewController *)self tableView];
      [(SBHIconLibraryTableViewController *)self tableView:v6 didSelectRowAtIndexPath:v7];

      LOBYTE(v6) = 1;
    }
  }
  return (char)v6;
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  return [a3 isEqualToString:@"SBIconLocationAppLibrarySearch"];
}

- (NSSet)presentedIconLocations
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithObject:@"SBIconLocationAppLibrarySearch"];
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:@"SBIconLocationAppLibrarySearch"]
    && [(SBHIconLibraryTableViewController *)self _isViewControllerVisible])
  {
    double v7 = [(SBHIconLibraryTableViewController *)self dataSource];
    double v8 = [v7 queryResult];
    double v9 = [v8 indexPathForIcon:v6];

    if (v9 && [(SBHIconLibraryTableViewController *)self _isIndexPathVisible:v9])
    {
      double v10 = [(SBHIconLibraryTableViewController *)self _iconViewAtIndexPath:v9];
    }
    else
    {
      double v10 = 0;
    }
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6 = a3;
  if ([a4 containsObject:@"SBIconLocationAppLibrarySearch"]
    && [(SBHIconLibraryTableViewController *)self _isViewControllerVisible])
  {
    double v7 = [(SBHIconLibraryTableViewController *)self firstIconViewForIcon:v6];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)firstIconViewForIcon:(id)a3
{
  id v4 = a3;
  if ([(SBHIconLibraryTableViewController *)self _isViewControllerVisible])
  {
    uint64_t v5 = [(SBHIconLibraryTableViewController *)self dataSource];
    id v6 = [v5 queryResult];
    double v7 = [v6 indexPathForIcon:v4];

    if ([(SBHIconLibraryTableViewController *)self _isIndexPathVisible:v7])
    {
      double v8 = [(SBHIconLibraryTableViewController *)self _iconViewAtIndexPath:v7];
    }
    else
    {
      double v8 = 0;
    }
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  id v4 = a3;
  if ([(SBHIconLibraryTableViewController *)self _isViewControllerVisible])
  {
    uint64_t v5 = [(SBHIconLibraryTableViewController *)self dataSource];
    id v6 = [v5 queryResult];
    double v7 = [v6 indexPathForIcon:v4];

    if (v7) {
      BOOL v8 = [(SBHIconLibraryTableViewController *)self _isIndexPathVisible:v7];
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:@"SBIconLocationAppLibrarySearch"]) {
    BOOL v7 = [(SBHIconLibraryTableViewController *)self isDisplayingIcon:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (-[SBHIconLibraryTableViewController isDisplayingIcon:inLocation:](self, "isDisplayingIcon:inLocation:", v6, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  id v4 = a3;
  if ([(SBHIconLibraryTableViewController *)self _isViewControllerVisible])
  {
    uint64_t v5 = [(SBHIconLibraryTableViewController *)self dataSource];
    id v6 = [v5 queryResult];
    id v7 = [v4 icon];
    uint64_t v8 = [v6 indexPathForIcon:v7];

    if (v8) {
      BOOL v9 = [(SBHIconLibraryTableViewController *)self _isIndexPathVisible:v8];
    }
    else {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:@"SBIconLocationAppLibrarySearch"]) {
    BOOL v7 = [(SBHIconLibraryTableViewController *)self isDisplayingIconView:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  double v11 = (void (**)(id, void *))a4;
  id v6 = a3;
  BOOL v7 = [(SBHIconLibraryTableViewController *)self dataSource];
  uint64_t v8 = [v7 queryResult];
  BOOL v9 = [v8 indexPathForIcon:v6];

  if (v9 && [(SBHIconLibraryTableViewController *)self _isIndexPathVisible:v9])
  {
    uint64_t v10 = [(SBHIconLibraryTableViewController *)self _iconViewAtIndexPath:v9];
    v11[2](v11, v10);
  }
}

void __75__SBHIconLibraryTableViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) iconsForSectionAtIndex:a2];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__SBHIconLibraryTableViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke_2;
  v9[3] = &unk_1E6AB0518;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void **)(a1 + 56);
  id v10 = v6;
  uint64_t v11 = v7;
  id v12 = v8;
  uint64_t v13 = a3;
  [v5 enumerateObjectsUsingBlock:v9];
}

void __75__SBHIconLibraryTableViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    id v4 = [*(id *)(a1 + 40) _iconViewForIcon:v3];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SBHIconLibraryTableViewController *)self presentedIconLocations];
  BOOL v9 = (void *)[v8 mutableCopy];

  [v9 minusSet:v6];
  id v10 = [v9 allObjects];
  uint64_t v11 = [(SBHIconLibraryTableViewController *)self firstIconViewForIcon:v7 inLocations:v10];

  return v11;
}

- (void)iconViewWillBeginDrag:(id)a3
{
  id v13 = a3;
  [(NSHashTable *)self->_grabbedIconViews addObject:v13];
  id v4 = [v13 icon];
  uint64_t v5 = [(SBHIconLibraryTableViewController *)self dataSource];
  id v6 = [v5 queryResult];
  id v7 = [v6 indexPathForIcon:v4];

  uint64_t v8 = [(SBHIconLibraryTableViewController *)self tableView];
  BOOL v9 = [v8 cellForRowAtIndexPath:v7];

  id v10 = [v9 iconView];
  int v11 = [v10 isEqual:v13];

  if (v11)
  {
    id v12 = [(SBHIconLibraryTableViewController *)self view];
    [v12 addSubview:v13];

    objc_msgSend(v13, "setCenter:", 10000.0, 10000.0);
    [v9 setIconView:0];
    [(SBHIconLibraryTableViewController *)self _configureCell:v9 forIcon:v4];
  }
}

- (void)iconViewDidEndDrag:(id)a3
{
  id v6 = a3;
  [(NSHashTable *)self->_grabbedIconViews removeObject:v6];
  id v4 = [v6 superview];
  uint64_t v5 = [(SBHIconLibraryTableViewController *)self view];

  if (v4 == v5) {
    [v6 removeFromSuperview];
  }
}

- (BOOL)_observeIcon:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  observedIcons = self->_observedIcons;
  if (!observedIcons)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_observedIcons;
    self->_observedIcons = v6;

    observedIcons = self->_observedIcons;
  }
  if (![(NSHashTable *)observedIcons containsObject:v4]
    && [(SBHIconLibraryTableViewController *)self _startObservingIcon:v4])
  {
    [(NSHashTable *)self->_observedIcons addObject:v4];
    BOOL v8 = 1;
  }
  else
  {
LABEL_7:
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_unobserveIcon:(id)a3
{
  if (a3)
  {
    observedIcons = self->_observedIcons;
    id v5 = a3;
    [(NSHashTable *)observedIcons removeObject:v5];
    [(SBHIconLibraryTableViewController *)self _stopObservingIcon:v5];
  }
}

- (BOOL)_startObservingIcon:(id)a3
{
  id v4 = a3;
  int v5 = [(SBHIconLibraryTableViewController *)self bs_isAppearingOrAppeared];
  if (v5) {
    [v4 addObserver:self];
  }

  return v5;
}

- (void)_stopObservingIcon:(id)a3
{
}

- (void)_teardownObservedIcons
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_observedIcons;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[SBHIconLibraryTableViewController _stopObservingIcon:](self, "_stopObservingIcon:", *(void *)(*((void *)&v9 + 1) + 8 * v7++), (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  observedIcons = self->_observedIcons;
  self->_observedIcons = 0;
}

- (void)_setupObservedIcons
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBHIconLibraryTableViewController *)self dataSource];
  uint64_t v4 = [v3 queryResult];

  uint64_t v5 = [(SBHIconLibraryTableViewController *)self tableView];
  uint64_t v6 = [v5 indexPathsForVisibleRows];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__SBHIconLibraryTableViewController__setupObservedIcons__block_invoke;
  v18[3] = &unk_1E6AB04C8;
  id v7 = v4;
  id v19 = v7;
  BOOL v8 = objc_msgSend(v6, "bs_mapNoNulls:", v18);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[SBHIconLibraryTableViewController _observeIcon:](self, "_observeIcon:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v11);
  }
}

uint64_t __56__SBHIconLibraryTableViewController__setupObservedIcons__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) iconAtIndexPath:a2];
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  BOOL v8 = [(SBHIconLibraryTableViewController *)self _iconViewAtIndexPath:a5];
  id v9 = [(SBHIconLibraryTableViewController *)self _processDragItemsForIconView:v8 session:v7];

  return v9;
}

- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconLibraryTableViewController *)self _iconViewForDragSession:v5];
  [v6 dragSessionWillBegin:v5];
}

- (void)tableView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconLibraryTableViewController *)self _iconViewForDragSession:v5];
  [v6 dragSession:v5 willEndWithOperation:2];
  [v6 dragSession:v5 didEndWithOperation:2];
  [(SBHIconLibraryTableViewController *)self _resetDragSession:v5];
}

- (id)tableView:(id)a3 dragPreviewParametersForRowAtIndexPath:(id)a4
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1720]);
  id v5 = [MEMORY[0x1E4FB1618] clearColor];
  [v4 setBackgroundColor:v5];

  return v4;
}

- (BOOL)tableView:(id)a3 dragSessionAllowsMoveOperation:(id)a4
{
  return 0;
}

- (id)_processDragItemsForIconView:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 canBeginDrags])
  {
    [(SBHIconLibraryTableViewController *)self _mapIconView:v6 forDragSession:v7];
    objc_initWeak(&location, v7);
    BOOL v8 = [v6 dragItems];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__SBHIconLibraryTableViewController__processDragItemsForIconView_session___block_invoke;
    v10[3] = &unk_1E6AB0590;
    objc_copyWeak(&v12, &location);
    id v11 = v6;
    [v8 enumerateObjectsUsingBlock:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

void __74__SBHIconLibraryTableViewController__processDragItemsForIconView_session___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, v3);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__SBHIconLibraryTableViewController__processDragItemsForIconView_session___block_invoke_2;
  v4[3] = &unk_1E6AB0568;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  [v3 setPreviewProvider:v4];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __74__SBHIconLibraryTableViewController__processDragItemsForIconView_session___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  id v4 = [a1[4] dragPreviewForItem:WeakRetained session:v3];
  id v5 = [v4 parameters];
  id v6 = [v4 view];
  if [a1[4] isDragging] && (objc_opt_respondsToSelector()) {
    [v6 setDragState:2];
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1718]) initWithView:v6 parameters:v5];

  return v7;
}

- (id)_iconViewForDragSession:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(NSMapTable *)self->_dragSessionsForIconView keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [(NSMapTable *)self->_dragSessionsForIconView objectForKey:v10];
        if (v11 == v4)
        {
          id v12 = v10;

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (id)_dragSessionForIconView:(id)a3
{
  return [(NSMapTable *)self->_dragSessionsForIconView objectForKey:a3];
}

- (void)_mapIconView:(id)a3 forDragSession:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  dragSessionsForIconView = self->_dragSessionsForIconView;
  if (!dragSessionsForIconView)
  {
    uint64_t v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    id v9 = self->_dragSessionsForIconView;
    self->_dragSessionsForIconView = v8;

    dragSessionsForIconView = self->_dragSessionsForIconView;
  }
  [(NSMapTable *)dragSessionsForIconView setObject:v6 forKey:v10];
}

- (void)_resetDragSession:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (void *)[(NSMapTable *)self->_dragSessionsForIconView copy];
  id v6 = [v5 keyEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [(NSMapTable *)self->_dragSessionsForIconView objectForKey:v11];

        if (v12 == v4) {
          [(NSMapTable *)self->_dragSessionsForIconView removeObjectForKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if (![(NSMapTable *)self->_dragSessionsForIconView count])
  {
    dragSessionsForIconView = self->_dragSessionsForIconView;
    self->_dragSessionsForIconView = 0;
  }
}

- (id)_iconFilter
{
  return &__block_literal_global_34;
}

uint64_t __48__SBHIconLibraryTableViewController__iconFilter__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isLeafIcon]) {
    uint64_t v3 = [v2 isWidgetIcon] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_executeQuery:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) != 0
    || ((int v6 = [(SBHIconLibraryTableViewController *)self _appearState],
         BOOL v7 = [(SBHIconLibraryTableViewController *)self disablesNullQueryExecution],
         [(SBHIconLibraryTableViewController *)self _nullQuery],
         uint64_t v8 = objc_claimAutoreleasedReturnValue(),
         int v9 = [v5 isEqual:v8],
         v8,
         !v6)
      ? (char v10 = 1)
      : (char v10 = v7),
        v9 && (v10 & 1) != 0))
  {
    BOOL v11 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_currentQuery, a3);
    id v12 = [(SBHIconLibraryTableViewController *)self library];
    [v12 executeQuery:self->_currentQuery];

    [(SBHIconLibraryTableViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
    [(SBHIconLibraryTableViewController *)self _updateShowHeadersFromQueryResult:0];
    BOOL v11 = 1;
  }

  return v11;
}

- (void)_reloadAppIcons
{
  if (self->_library)
  {
    uint64_t v3 = self->_currentQuery;
    if (!v3)
    {
      uint64_t v3 = [(SBHIconLibraryTableViewController *)self _nullQuery];
    }
    id v4 = v3;
    [(SBHIconLibraryTableViewController *)self _executeQuery:v3];
  }
}

- (void)iconLibrary:(id)a3 hasUpdatedQueryResult:(id)a4
{
  id v5 = a4;
  int v6 = [v5 query];
  objc_storeStrong((id *)&self->_currentQuery, v6);
  [(SBHIconLibraryTableViewController *)self _updateShowHeadersFromQueryResult:v5];
  BOOL v7 = [(SBHIconLibraryTableViewController *)self dataSource];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__SBHIconLibraryTableViewController_iconLibrary_hasUpdatedQueryResult___block_invoke;
  v14[3] = &unk_1E6AAC810;
  v14[4] = self;
  [v7 applyQueryResult:v5 animatingDifferences:0 completion:v14];

  BOOL v8 = [(SBHIconLibraryTableViewController *)self _shouldShowNoResultsViewForQueryResult:v5];
  [(SBHTableViewController *)self setShowNoResultsView:v8];
  [(SBHIconLibraryTableViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
  int v9 = [v6 searchString];
  uint64_t v10 = [v9 length];

  BOOL v11 = [(SBHIconLibraryTableViewController *)self _searchTextField];
  id v12 = v11;
  if (v8 || !v10 || [v11 hasMarkedText]) {
    uint64_t v13 = 6;
  }
  else {
    uint64_t v13 = 1;
  }
  [v12 setReturnKeyType:v13];
}

void __71__SBHIconLibraryTableViewController_iconLibrary_hasUpdatedQueryResult___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadSectionIndexTitles];
}

- (void)_updateShowHeadersFromQueryResult:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = [(SBHIconLibraryTableViewController *)self dataSource];
    id v11 = [v5 queryResult];

    id v4 = v11;
  }
  id v12 = v4;
  uint64_t v6 = [v4 query];
  if (v6
    && (BOOL v7 = (void *)v6,
        [v12 query],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        BOOL v9 = SBLibraryUseSectionsForQuery(v8),
        v8,
        v7,
        !v9))
  {
    self->_showHeaders = 0;
  }
  else
  {
    unint64_t v10 = [(SBHAppLibrarySettings *)self->_settings minimumNumberOfIconsToShowSectionHeaderInDeweySearch];
    self->_showHeaders = [v12 totalNumberOfItems] > v10;
  }
  [(SBHIconLibraryTableViewController *)self _updateSectionHeaderHeight];
}

- (void)_updateSectionHeaderHeight
{
  uint64_t v3 = [(SBHIconLibraryTableViewController *)self tableView];
  id v5 = v3;
  double v4 = *MEMORY[0x1E4FB2F28];
  if (!self->_showHeaders) {
    double v4 = 0.0;
  }
  [v3 setSectionHeaderHeight:v4];
}

- (void)_reloadVisibleCells
{
  if ([(SBHIconLibraryTableViewController *)self _isViewControllerVisible])
  {
    id v4 = [(SBHIconLibraryTableViewController *)self _visibleIndexPaths];
    uint64_t v3 = [v4 allObjects];
    [(SBHIconLibraryTableViewController *)self _reloadRowsAtIndexPaths:v3];
  }
}

- (void)_reloadRowsAtIndexPaths:(id)a3
{
  dataSource = self->_dataSource;
  id v5 = a3;
  uint64_t v6 = [(SBHIconTableViewDiffableDataSource *)dataSource queryResult];
  BOOL v7 = [v6 snapshot];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SBHIconLibraryTableViewController__reloadRowsAtIndexPaths___block_invoke;
  v9[3] = &unk_1E6AB04C8;
  void v9[4] = self;
  BOOL v8 = objc_msgSend(v5, "bs_map:", v9);

  [v7 reloadItemsWithIdentifiers:v8];
}

uint64_t __61__SBHIconLibraryTableViewController__reloadRowsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 1168) itemIdentifierForIndexPath:a2];
}

id __50__SBHIconLibraryTableViewController__visibleIcons__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 dataSource];
  id v5 = [v4 queryResult];
  uint64_t v6 = [v5 iconAtIndexPath:v3];

  return v6;
}

- (BOOL)_isViewControllerVisible
{
  return [(SBHIconLibraryTableViewController *)self _appearState] - 1 < 2;
}

- (BOOL)_isIndexPathVisible:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconLibraryTableViewController *)self _visibleIndexPaths];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)_configureCell:(id)a3 forIcon:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  BOOL v7 = [(SBHIconLibraryTableViewController *)self listLayoutProvider];
  if (v7)
  {
    BOOL v8 = [(SBHIconLibraryTableViewController *)self iconViewProvider];
    BOOL v9 = [v16 iconView];
    uint64_t v10 = [v16 iconView];
    if (!v10
      || (id v11 = (void *)v10,
          BOOL v12 = [(NSHashTable *)self->_grabbedIconViews containsObject:v9],
          v11,
          v12))
    {
      uint64_t v13 = [(SBHIconLibraryTableViewController *)self _createIconView];

      BOOL v9 = (void *)v13;
    }
    [v8 configureIconView:v9 forIcon:v6];
    [v9 setLabelHidden:1];
    [v9 setAllowsLabelArea:0];
    [v9 setAllowsCloseBox:0];
    [v9 setAllowsAccessoryView:0];
    long long v14 = [(SBHIconLibraryTableViewController *)self iconImageCache];
    [v9 setIconImageCache:v14];

    [v9 setListLayoutProvider:v7];
    [v9 setLocation:@"SBIconLocationAppLibrarySearch"];
    [v9 addObserver:self];
    [v9 setImageLoadingBehavior:1];
    [v9 setIcon:v6];
    [v16 setIconView:v9];
    [v16 configureCellForIcon:v6];
    long long v15 = [(SBHIconLibraryTableViewController *)self legibilitySettings];
    [v16 setLegibilitySettings:v15];
  }
}

- (BOOL)_shouldShowNoResultsViewForQueryResult:(id)a3
{
  id v4 = a3;
  if (([(SBHIconLibraryTableViewController *)self bs_isDisappearingOrDisappeared] & 1) == 0)
  {
    if ([v4 isNullQueryResult])
    {
      LOBYTE(v5) = 1;
      goto LABEL_8;
    }
    id v5 = [v4 query];

    if (!v5) {
      goto LABEL_8;
    }
    id v6 = [v4 query];
    BOOL v7 = [v6 searchString];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      BOOL v9 = [v4 snapshot];
      LOBYTE(v5) = [v9 numberOfItems] < 1;

      goto LABEL_8;
    }
  }
  LOBYTE(v5) = 0;
LABEL_8:

  return (char)v5;
}

- (void)_logLaunchOfIcon:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SBHIconLibraryTableViewController *)self _notifyDelegatesOfAppLaunchFromSearchController:v6];
  if (!self->_appDirectoryClient)
  {
    uint64_t v8 = [MEMORY[0x1E4F4AEB8] sharedInstance];
    appDirectoryClient = self->_appDirectoryClient;
    self->_appDirectoryClient = v8;
  }
  uint64_t v10 = [(SBHIconLibraryTableViewController *)self _iconFilter];
  char v11 = ((uint64_t (**)(void, id))v10)[2](v10, v6);

  if (v11)
  {
    BOOL v12 = [v6 leafIdentifier];
    uint64_t v13 = [(SBHIconLibraryTableViewController *)self currentQuery];
    uint64_t v14 = [v7 indexAtPosition:0];
    long long v15 = [(SBHIconLibraryTableViewController *)self libraryCategoryMap];
    id v16 = [v15 metadata];
    long long v17 = [v16 objectForKey:@"response"];

    double v18 = self->_appDirectoryClient;
    uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
    double v20 = [v13 searchString];
    -[ATXAppDirectoryClient logLaunchFromSearchWithDate:bundleID:bundleIndex:searchQueryLength:searchTab:appDirectoryResponse:](v18, "logLaunchFromSearchWithDate:bundleID:bundleIndex:searchQueryLength:searchTab:appDirectoryResponse:", v19, v12, v14, [v20 length], 0, v17);
  }
  else
  {
    uint64_t v21 = SBLogIcon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[SBHIconLibraryTableViewController _logLaunchOfIcon:atIndexPath:](v21);
    }
  }
}

- (void)_handleDidTapEmptyResultsArea:(id)a3
{
  id v3 = [(SBHIconLibraryTableViewController *)self searchController];
  [v3 setActive:0];
}

- (void)_notifyDelegatesOfAppLaunchFromSearchController:(id)a3
{
  p_observer = &self->_observer;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_observer);
  [WeakRetained libraryTableViewControllerDidLaunchIcon:v4];
}

- (id)_indexPathForDefaultSearchResult
{
  id v2 = [(SBHIconLibraryTableViewController *)self tableView];
  id v3 = [v2 indexPathsForVisibleRows];
  id v4 = [v3 firstObject];

  return v4;
}

- (id)_searchTextField
{
  id v2 = [(SBHIconLibraryTableViewController *)self searchController];
  id v3 = [v2 searchBar];
  id v4 = [v3 searchTextField];

  return v4;
}

- (id)_queryForCurrentSearchTextField
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v2 = [(SBHIconLibraryTableViewController *)self _searchTextField];
  id v3 = [v2 searchText];
  id v4 = [v2 markedTextRange];
  if (v4)
  {
    id v5 = [v2 textInRange:v4];
    if ([v5 length])
    {
      id v6 = [v2 beginningOfDocument];
      CGFloat v26 = [v2 endOfDocument];
      id v7 = [v4 start];
      uint64_t v8 = [v2 textRangeFromPosition:v6 toPosition:v7];

      uint64_t v9 = [v2 textInRange:v8];
      uint64_t v10 = (void *)v9;
      char v11 = &stru_1F2FA0300;
      if (v9) {
        BOOL v12 = (__CFString *)v9;
      }
      else {
        BOOL v12 = &stru_1F2FA0300;
      }
      CGFloat v25 = v12;

      uint64_t v13 = [v4 end];
      uint64_t v14 = [v2 positionFromPosition:v13 offset:1];

      if (v14)
      {
        long long v15 = [v2 textRangeFromPosition:v14 toPosition:v26];
        uint64_t v16 = [v2 textInRange:v15];
        long long v17 = v6;
        double v18 = (void *)v16;
        if (v16) {
          uint64_t v19 = (__CFString *)v16;
        }
        else {
          uint64_t v19 = &stru_1F2FA0300;
        }
        char v11 = v19;

        id v6 = v17;
      }
      v27[0] = v25;
      v27[1] = v5;
      v27[2] = v11;
      double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
    }
    else
    {
      double v20 = 0;
    }
    uint64_t v21 = [[SBHIconLibraryQuery alloc] initWithMarkedTextSearchString:v3 markedTextRange:v4 markedTextArray:v20];
  }
  else
  {
    uint64_t v21 = [[SBHIconLibraryQuery alloc] initWithSearchString:v3];
  }
  if ([v3 length])
  {
    unint64_t v22 = [v2 textInputMode];
    CGFloat v23 = [v22 primaryLanguage];
    [(SBHIconLibraryQuery *)v21 setKeyboardLanguageHint:v23];
  }
  return v21;
}

- (id)_nullQuery
{
  id v2 = [[SBHIconLibraryQuery alloc] initWithSearchString:&stru_1F2FA0300];
  return v2;
}

- (id)_iconViewForIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconLibraryTableViewController *)self dataSource];
  id v6 = [v5 queryResult];
  id v7 = [v6 indexPathForIcon:v4];

  if (v7)
  {
    uint64_t v8 = [(SBHIconLibraryTableViewController *)self _iconViewAtIndexPath:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_iconViewAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(SBHIconLibraryTableViewController *)self _isIndexPathVisible:v4])
  {
    id v5 = [(SBHIconLibraryTableViewController *)self tableView];
    id v6 = [v5 cellForRowAtIndexPath:v4];

    id v7 = [v6 iconView];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_createIconView
{
  id v2 = [[SBIconView alloc] initWithConfigurationOptions:2 listLayoutProvider:self->_listLayoutProvider];
  return v2;
}

- (void)_invalidatePrewarmAssertion:(id)a3
{
  [(NSCountedSet *)self->_libraryPrewarmAssertions removeObject:a3];
  if (![(NSCountedSet *)self->_libraryPrewarmAssertions count])
  {
    [(SBHIconLibraryTableViewController *)self _teardownLibrary];
  }
}

- (id)acquireLibrarySearchPrewarmAssertionForReason:(id)a3
{
  id v4 = a3;
  if (!self->_libraryPrewarmAssertions)
  {
    id v5 = [MEMORY[0x1E4F28BD0] set];
    libraryPrewarmAssertions = self->_libraryPrewarmAssertions;
    self->_libraryPrewarmAssertions = v5;
  }
  id v7 = [[_SBHIconLibraryPrewarmAssertion alloc] initWithReason:v4 iconLibraryTableViewController:self];
  [(NSCountedSet *)self->_libraryPrewarmAssertions addObject:v7];
  [(SBHIconLibraryTableViewController *)self _setupLibrary];

  return v7;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void)setIconImageCache:(id)a3
{
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)setListLayoutProvider:(id)a3
{
}

- (SBHLibrarySearchController)searchController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);
  return (SBHLibrarySearchController *)WeakRetained;
}

- (void)setSearchController:(id)a3
{
}

- (SBIconViewProviding)iconViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  return (SBIconViewProviding *)WeakRetained;
}

- (SBHIconLibraryTableViewControllerObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (SBHIconLibraryTableViewControllerObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (SBHIconLibraryTableViewControllerLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  return (SBHIconLibraryTableViewControllerLayoutDelegate *)WeakRetained;
}

- (void)setLayoutDelegate:(id)a3
{
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (SBRootFolder)rootFolder
{
  return self->_rootFolder;
}

- (SBHLibraryCategoryMap)libraryCategoryMap
{
  return self->_libraryCategoryMap;
}

- (void)setHeaderBlurView:(id)a3
{
}

- (BOOL)disablesNullQueryExecution
{
  return self->_disablesNullQueryExecution;
}

- (void)setDisablesNullQueryExecution:(BOOL)a3
{
  self->_disablesNullQueryExecution = a3;
}

- (SBHTableViewIconLibrary)library
{
  return self->_library;
}

- (SBHIconLibraryQuery)currentQuery
{
  return self->_currentQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_headerBlurView, 0);
  objc_storeStrong((id *)&self->_libraryCategoryMap, 0);
  objc_storeStrong((id *)&self->_rootFolder, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
  objc_destroyWeak((id *)&self->_observer);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_destroyWeak((id *)&self->_searchController);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_libraryPrewarmAssertions, 0);
  objc_storeStrong((id *)&self->_isVisibleLibrarySearchPrewarmAssertion, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_dragSessionsForIconView, 0);
  objc_storeStrong((id *)&self->_observedIcons, 0);
  objc_storeStrong((id *)&self->_grabbedIconViews, 0);
  objc_storeStrong((id *)&self->_scrollingInteraction, 0);
  objc_storeStrong((id *)&self->_appDirectoryClient, 0);
}

void __47__SBHIconLibraryTableViewController_dataSource__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "no icon for identifier: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_logLaunchOfIcon:(os_log_t)log atIndexPath:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "Encountered unsupported icon for app search. Undefined how to log this.", v1, 2u);
}

@end