@interface SFStartPageViewController
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isShowingRootView;
- (BOOL)isTrackingDropSession;
- (BOOL)rootViewHidesEmptyNavigationBar;
- (BOOL)showsWallpaper;
- (BOOL)startPageCollectionViewController:(id)a3 isSectionExpanded:(id)a4;
- (BOOL)startPageCollectionViewControllerShouldDeferLoadingContentUntilKeyboardAnimatesIn:(id)a3;
- (BOOL)startPageCollectionViewControllerShouldInstallCustomBackdrops:(id)a3;
- (SFStartPageCustomizationDataSource)customizationDataSource;
- (SFStartPageDataSource)dataSource;
- (SFStartPageDelegate)delegate;
- (SFStartPageScrollObserver)scrollObserver;
- (SFStartPageViewController)init;
- (SFStartPageViewController)initWithVisualStyleProvider:(id)a3 forProfile:(id)a4;
- (UIColor)preferredControlTintColor;
- (UIScrollView)test_scrollView;
- (UIViewController)alternateContentViewController;
- (WBProfile)profile;
- (double)navigationBarHeight;
- (double)navigationBarPrimaryContentHeight;
- (double)scrollDistance;
- (double)startPageCollectionViewControllerTopPadding:(id)a3;
- (id)_wallpaperImageIdentifier;
- (id)effectiveControlTintColor;
- (id)previewViewControllerForItemIdentifier:(id)a3;
- (id)scrollViewForStartPageCollectionViewsOnly:(BOOL)a3;
- (id)sectionsForStartPageCollectionViewController:(id)a3;
- (id)topStartPageCollectionViewController;
- (int64_t)backgroundDisplayMode;
- (int64_t)customizationControlPolicyForStartPageCollectionViewController:(id)a3;
- (int64_t)customizationPolicy;
- (int64_t)navigationBarPosition;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredStatusBarUpdateAnimation;
- (void)_backgroundImageDidToggle;
- (void)_createSearchControllerIfNeeded;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)_reloadCustomizationViewController;
- (void)_setLeadingBarItems:(BOOL)a3 trailingBarItems:(BOOL)a4 onNavigationItem:(id)a5 forSection:(id)a6;
- (void)_updateOverrideTraitCollectionWithUserInterfaceStyle:(int64_t)a3;
- (void)_updateSearchBarAppearance;
- (void)_updateWallpaperIfNeededWithCompletionHandler:(id)a3;
- (void)_wallpaperDidChange:(id)a3;
- (void)_wallpaperDidChangeRemotely;
- (void)_wallpaperWasDeletedRemotely;
- (void)beginCustomizationForStartPageCollectionViewController:(id)a3;
- (void)cancelGestures;
- (void)coalesceDataReloadWithBlock:(id)a3 animatingDifferences:(BOOL)a4;
- (void)configureModelWithIdentifier:(id)a3 usingBlock:(id)a4;
- (void)configurePaletteForNavigationItem:(id)a3;
- (void)dealloc;
- (void)ignorePreviousLayoutSize;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)presentViewController:(id)a3 fromItemWithIdentifier:(id)a4;
- (void)reloadDataAnimatingDifferences:(BOOL)a3;
- (void)reloadNavigationItemAnimated:(BOOL)a3;
- (void)reloadSection:(id)a3 animated:(BOOL)a4;
- (void)resetToRootViewWithCustomizationPolicy:(int64_t)a3;
- (void)setAlternateContentViewController:(id)a3;
- (void)setBackgroundDisplayMode:(int64_t)a3;
- (void)setCustomizationDataSource:(id)a3;
- (void)setCustomizationPolicy:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNavigationBarPaletteHeight:(double)a3 alignmentInsets:(UIEdgeInsets)a4;
- (void)setNavigationBarPosition:(int64_t)a3;
- (void)setPreferredControlTintColor:(id)a3;
- (void)setProfile:(id)a3;
- (void)setRootViewHidesEmptyNavigationBar:(BOOL)a3;
- (void)setScrollObserver:(id)a3;
- (void)showDetailForItemWithIdentifier:(id)a3;
- (void)startPageCollectionViewController:(id)a3 didSelectItemWithIdentifier:(id)a4 atGridLocation:(id)a5;
- (void)startPageCollectionViewController:(id)a3 shouldExpandSectionWithIdentifier:(id)a4;
- (void)startPageCollectionViewController:(id)a3 toggleSectionExpanded:(id)a4;
- (void)startPageCollectionViewControllerDidChangeBackgroundStyle:(id)a3;
- (void)startPageCollectionViewControllerDidCompleteDismissGesture:(id)a3;
- (void)startPageCollectionViewControllerDidScroll:(id)a3;
- (void)startPageCollectionViewControllerDidUpdateContent:(id)a3;
- (void)startPageCollectionViewControllerWillUpdateNavigationBar:(id)a3;
- (void)unfocusGestureDidUpdate:(id)a3;
- (void)updateNavigationBarTintColor;
- (void)updateNavigationBarTitleInsets;
- (void)updateOverrideTraitCollection;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)updateStartPageTopPadding;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillLayoutSubviews;
@end

@implementation SFStartPageViewController

- (void)setProfile:(id)a3
{
}

- (BOOL)startPageCollectionViewController:(id)a3 isSectionExpanded:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (objc_opt_respondsToSelector()) {
    char v7 = [WeakRetained startPageViewController:self isSectionExpanded:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (id)sectionsForStartPageCollectionViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v5 = [WeakRetained sectionsForStartPageViewController:self];

  return v5;
}

- (int64_t)customizationControlPolicyForStartPageCollectionViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customizationDataSource);
  if (WeakRetained) {
    int64_t customizationPolicy = self->_customizationPolicy;
  }
  else {
    int64_t customizationPolicy = 2;
  }

  return customizationPolicy;
}

- (void)setRootViewHidesEmptyNavigationBar:(BOOL)a3
{
}

- (void)setCustomizationPolicy:(int64_t)a3
{
  if (self->_customizationPolicy != a3)
  {
    self->_int64_t customizationPolicy = a3;
    [(SFStartPageViewController *)self reloadDataAnimatingDifferences:0];
  }
}

- (void)startPageCollectionViewControllerDidUpdateContent:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained startPageViewControllerDidUpdateContent:self];
  }
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SFStartPageViewController;
  [(SFStartPageViewController *)&v3 viewLayoutMarginsDidChange];
  [(SFStartPageViewController *)self updateNavigationBarTitleInsets];
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SFStartPageViewController;
  [(SFStartPageViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(SFStartPageViewController *)self updateNavigationBarTitleInsets];
}

- (void)updateNavigationBarTitleInsets
{
  id v17 = [(SFStartPageViewController *)self view];
  [v17 safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  [v17 directionalLayoutMargins];
  double v8 = v7;
  double v10 = v9;
  int v11 = objc_msgSend(v17, "_sf_usesLeftToRightLayout");
  v12 = [(SFStartPageCollectionViewController *)self->_rootCollectionViewController navigationItem];
  v13 = v12;
  if (v11) {
    double v14 = v6;
  }
  else {
    double v14 = v4;
  }
  double v15 = v10 + v14;
  if (v11) {
    double v16 = v4;
  }
  else {
    double v16 = v6;
  }
  objc_msgSend(v12, "setLargeTitleInsets:", 0.0, v8 + v16, 0.0, v15);
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFStartPageViewController;
  [(SFStartPageViewController *)&v5 viewDidAppear:a3];
  [(SFStartPageViewController *)self _updateWallpaperIfNeededWithCompletionHandler:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained startPageViewControllerDidAppear:self];
  }
}

- (void)viewDidLoad
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)SFStartPageViewController;
  [(SFStartPageViewController *)&v16 viewDidLoad];
  [(SFStartPageViewController *)self addChildViewController:self->_navigationController];
  double v3 = [(UINavigationController *)self->_navigationController view];
  [v3 setAutoresizingMask:18];
  double v4 = [(SFStartPageViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  objc_super v5 = [(SFStartPageViewController *)self view];
  [v5 addSubview:v3];

  [(UINavigationController *)self->_navigationController didMoveToParentViewController:self];
  v18[0] = self->_rootCollectionViewController;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [(UINavigationController *)self->_navigationController setViewControllers:v6];

  [(SFStartPageViewController *)self navigationController:self->_navigationController willShowViewController:self->_rootCollectionViewController animated:0];
  [(SFStartPageViewController *)self _wallpaperDidChange:0];
  double v7 = [(UINavigationController *)self->_navigationController navigationBar];
  [v7 setPrefersLargeTitles:1];

  if (objc_opt_respondsToSelector()) {
    [(SFStartPageVisualStyleProviding *)self->_visualStyleProvider prepareNavigationController:self->_navigationController forStartPageViewController:self];
  }
  double v8 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel_unfocusGestureDidUpdate_];
  unfocusGesture = self->_unfocusGesture;
  self->_unfocusGesture = v8;

  [(UIPanGestureRecognizer *)self->_unfocusGesture setDelegate:self];
  double v10 = [(SFStartPageViewController *)self view];
  [v10 addGestureRecognizer:self->_unfocusGesture];

  if ([(SFStartPageViewController *)self startPageCollectionViewControllerShouldInstallCustomBackdrops:self->_rootCollectionViewController])
  {
    objc_msgSend(MEMORY[0x1E4FB1F00], "safari_statusBarGradientBlurEffectView");
    int v11 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
    statusBarBackdrop = self->_statusBarBackdrop;
    self->_statusBarBackdrop = v11;

    [(UIVisualEffectView *)self->_statusBarBackdrop setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIVisualEffectView *)self->_statusBarBackdrop setAlpha:0.0];
    v13 = [(SFStartPageViewController *)self view];
    [v13 addSubview:self->_statusBarBackdrop];
  }
  uint64_t v17 = objc_opt_class();
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  id v15 = (id)[(SFStartPageViewController *)self registerForTraitChanges:v14 withTarget:self action:sel_updateOverrideTraitCollection];
}

- (void)_wallpaperDidChange:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (!v4
    || ([v4 object],
        double v6 = (WBSStartPageBackgroundManager *)objc_claimAutoreleasedReturnValue(),
        wallpaperManager = self->_wallpaperManager,
        v6,
        v6 == wallpaperManager))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__SFStartPageViewController__wallpaperDidChange___block_invoke;
    v8[3] = &unk_1E54EB768;
    v8[4] = self;
    [(SFStartPageViewController *)self _updateWallpaperIfNeededWithCompletionHandler:v8];
  }
}

- (void)startPageCollectionViewControllerDidChangeBackgroundStyle:(id)a3
{
  id v5 = a3;
  id v4 = [(UINavigationController *)self->_navigationController topViewController];

  if (v4 == v5) {
    [(SFStartPageViewController *)self _updateWallpaperIfNeededWithCompletionHandler:0];
  }
}

- (void)startPageCollectionViewControllerWillUpdateNavigationBar:(id)a3
{
  id v9 = [a3 navigationItem];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [WeakRetained startPageViewControllerShouldShowSearchField:self])
  {
    [(SFStartPageViewController *)self _createSearchControllerIfNeeded];
    searchController = self->_searchController;
  }
  else
  {
    searchController = 0;
  }
  [v9 setSearchController:searchController];
  [(SFStartPageViewController *)self _setLeadingBarItems:1 trailingBarItems:1 onNavigationItem:v9 forSection:0];
  id v6 = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_alternateContentViewController || (objc_opt_respondsToSelector() & 1) == 0)
  {
    double v7 = 0;
  }
  else
  {
    double v7 = [v6 startPageViewControllerTitleForRootView:self];
  }
  if ([v7 length])
  {
    [v9 setTitle:v7];
    uint64_t v8 = 1;
  }
  else
  {
    [v9 setTitle:0];
    uint64_t v8 = 2;
  }
  [v9 setLargeTitleDisplayMode:v8];
}

- (void)_setLeadingBarItems:(BOOL)a3 trailingBarItems:(BOOL)a4 onNavigationItem:(id)a5 forSection:(id)a6
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v10 = [WeakRetained startPageViewController:self leadingBarItemsForSection:0];
    [v12 setLeftBarButtonItems:v10];
  }
  else
  {
    [v12 setLeftBarButtonItems:0];
  }
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int v11 = [WeakRetained startPageViewController:self trailingBarItemsForSection:0];
    [v12 setRightBarButtonItems:v11];
  }
  else
  {
    [v12 setRightBarButtonItems:0];
  }
}

void __68__SFStartPageViewController_resetToRootViewWithCustomizationPolicy___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 1040) popToRootViewControllerAnimated:0];
  *(void *)(*(void *)(a1 + 32) + 1160) = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) updateStartPageTopPadding];
  [*(id *)(a1 + 32) reloadDataAnimatingDifferences:0];
  [*(id *)(a1 + 32) reloadNavigationItemAnimated:0];
  id v3 = [*(id *)(a1 + 32) topStartPageCollectionViewController];
  [v3 scrollToTop];
}

- (void)coalesceDataReloadWithBlock:(id)a3 animatingDifferences:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = (void (**)(void))a3;
  self->_coalescingDataReload = 1;
  BOOL v7 = v6;
  v6[2]();
  self->_coalescingDataReload = 0;
  if (self->_needsDataReloadAfterBatchUpdate) {
    [(SFStartPageViewController *)self reloadDataAnimatingDifferences:v4];
  }
}

- (void)reloadDataAnimatingDifferences:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_coalescingDataReload)
  {
    self->_needsDataReloadAfterBatchUpdate = 1;
  }
  else
  {
    BOOL v3 = a3;
    self->_needsDataReloadAfterBatchUpdate = 0;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    BOOL v4 = self->_dataSourceObservers;
    uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "reloadDataAnimatingDifferences:", v3, (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)reloadNavigationItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_dataSourceObservers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "reloadNavigationItemAnimated:", v3, (void)v11);
      }
      uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  alternateContentViewController = self->_alternateContentViewController;
  if (alternateContentViewController)
  {
    long long v10 = [(UIViewController *)alternateContentViewController navigationItem];
    [(SFStartPageViewController *)self _setLeadingBarItems:1 trailingBarItems:1 onNavigationItem:v10 forSection:0];
  }
}

- (void)viewWillLayoutSubviews
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)SFStartPageViewController;
  [(SFStartPageViewController *)&v26 viewWillLayoutSubviews];
  BOOL v3 = [(SFStartPageViewController *)self view];
  [v3 layoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v12 = [(UINavigationController *)self->_navigationController viewControllers];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = [*(id *)(*((void *)&v22 + 1) + 8 * v15) viewIfLoaded];
        objc_msgSend(v16, "setLayoutMargins:", v5, v7, v9, v11);

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v13);
  }

  if (self->_statusBarBackdrop)
  {
    uint64_t v17 = [(UINavigationController *)self->_navigationController view];
    [v17 safeAreaInsets];
    double v19 = v18;

    v20 = [(SFStartPageViewController *)self view];
    [v20 bounds];
    double Width = CGRectGetWidth(v29);

    -[UIVisualEffectView setFrame:](self->_statusBarBackdrop, "setFrame:", 0.0, 0.0, Width, v19);
    if ([(UINavigationController *)self->_navigationController isNavigationBarHidden]) {
      [(UIVisualEffectView *)self->_statusBarBackdrop setAlpha:0.0];
    }
  }
}

- (double)startPageCollectionViewControllerTopPadding:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v5 = -1.0;
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained startPageViewControllerTopPadding:self];
    double v5 = v6;
  }

  return v5;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = a4;
  double v7 = [v16 view];
  [v7 setInsetsLayoutMarginsFromSafeArea:0];
  double v8 = [(SFStartPageViewController *)self view];
  [v8 layoutMargins];
  objc_msgSend(v7, "setLayoutMargins:");

  double v9 = [v16 navigationItem];
  [(SFStartPageViewController *)self configurePaletteForNavigationItem:v9];

  foregroundScrollView = self->_foregroundScrollView;
  if (foregroundScrollView)
  {
    [(UIScrollView *)foregroundScrollView _removeScrollViewScrollObserver:self];
    double v11 = self->_foregroundScrollView;
    self->_foregroundScrollView = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v12 = [(SFStartPageViewController *)self scrollViewForStartPageCollectionViewsOnly:0];
    uint64_t v13 = self->_foregroundScrollView;
    self->_foregroundScrollView = v12;

    [(UIScrollView *)self->_foregroundScrollView _addScrollViewScrollObserver:self];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained startPageViewControllerDidScroll:self animated:v5];
  }
  [(SFStartPageViewController *)self updateNavigationBarTintColor];
  if ([(SFStartPageViewController *)self isShowingRootView])
  {
    if ([(NSString *)self->_expandedSectionIdentifier isEqualToString:*MEMORY[0x1E4F988C8]]) {
      [(SFStartPageViewController *)self reloadDataAnimatingDifferences:1];
    }
    expandedSectionIdentifier = self->_expandedSectionIdentifier;
    self->_expandedSectionIdentifier = 0;
  }
}

- (void)startPageCollectionViewControllerDidScroll:(id)a3
{
  [(SFStartPageViewController *)self updateNavigationBarTintColor];
  [(SFStartPageViewController *)self setNeedsStatusBarAppearanceUpdate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained startPageViewControllerDidScroll:self animated:0];
  }
  id v4 = objc_loadWeakRetained((id *)&self->_scrollObserver);
  [v4 startPageViewControllerDidScroll:self];
}

- (BOOL)isShowingRootView
{
  BOOL v3 = [(UINavigationController *)self->_navigationController topViewController];
  if (v3)
  {
    id v4 = [(UINavigationController *)self->_navigationController topViewController];
    BOOL v5 = v4 == self->_rootCollectionViewController;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)configurePaletteForNavigationItem:(id)a3
{
  id v4 = a3;
  double navigationBarPaletteHeight = self->_navigationBarPaletteHeight;
  double top = self->_navigationBarPaletteInsets.top;
  double bottom = self->_navigationBarPaletteInsets.bottom;
  id v16 = v4;
  double v8 = [v4 _bottomPalette];
  double v9 = v8;
  double v10 = navigationBarPaletteHeight + top + bottom;
  if (v10 != 0.0 && v8 == 0)
  {
    id v13 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v14 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    objc_msgSend(v14, "setFrame:", 0.0, 0.0, 0.0, v10);
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4FB21F8]) initWithContentView:v14];
    [v16 _setBottomPalette:v15];
  }
  else if (v10 == 0.0)
  {
    [v16 _setBottomPalette:0];
  }
  else
  {
    long long v12 = [v8 contentView];
    objc_msgSend(v12, "setFrame:", 0.0, 0.0, 0.0, v10);

    [v16 _setBottomPaletteNeedsUpdate];
  }
}

- (void)_updateWallpaperIfNeededWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SFStartPageViewController *)self showsWallpaper];
  wallpaperManager = self->_wallpaperManager;
  double v7 = [(SFStartPageViewController *)self _wallpaperImageIdentifier];
  double v8 = [(WBProfile *)self->_profile identifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__SFStartPageViewController__updateWallpaperIfNeededWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E54EB790;
  BOOL v12 = v5;
  v10[4] = self;
  id v9 = v4;
  id v11 = v9;
  [(WBSStartPageBackgroundManager *)wallpaperManager getHasGeneratedBackgroundImage:v7 forProfileWithIdentifier:v8 completionHandler:v10];
}

- (void)updateNavigationBarTintColor
{
  v21[1] = *MEMORY[0x1E4F143B8];
  p_navigationController = &self->_navigationController;
  id v4 = [(UINavigationController *)self->_navigationController traitCollection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__SFStartPageViewController_updateNavigationBarTintColor__block_invoke;
  v19[3] = &unk_1E54EB7B8;
  v19[4] = self;
  BOOL v5 = [(UINavigationController *)*p_navigationController navigationBar];
  double v6 = __57__SFStartPageViewController_updateNavigationBarTintColor__block_invoke((uint64_t)v19);
  [v5 setTintColor:v6];

  double v7 = [(UINavigationController *)self->_navigationController topViewController];
  double v8 = [v7 navigationItem];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__SFStartPageViewController_updateNavigationBarTintColor__block_invoke_2;
  v15[3] = &unk_1E54EB7E0;
  id v9 = v8;
  id v16 = v9;
  uint64_t v17 = self;
  id v10 = v4;
  id v18 = v10;
  uint64_t v11 = __57__SFStartPageViewController_updateNavigationBarTintColor__block_invoke_2((id *)v15);
  BOOL v12 = (void *)v11;
  if (v11)
  {
    uint64_t v20 = *MEMORY[0x1E4FB0700];
    v21[0] = v11;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v14 = [v9 standardAppearance];
    [v14 setTitleTextAttributes:v13];
  }
  else
  {
    id v13 = [v9 standardAppearance];
    [v13 setTitleTextAttributes:MEMORY[0x1E4F1CC08]];
  }
}

- (BOOL)showsWallpaper
{
  BOOL v3 = [(SFStartPageViewController *)self topStartPageCollectionViewController];
  char v4 = [v3 wantsWallpaperHiddenForCurrentBackgroundStyle];

  BOOL result = (v4 & 1) == 0
        && (wallpaperManager = self->_wallpaperManager,
            [(WBSStartPageBackgroundManager *)wallpaperManager imageForIdentifier:v6 forProfile:self->_profile], double v7 = v6 = [(SFStartPageViewController *)self _wallpaperImageIdentifier],;
  return result;
}

- (id)_wallpaperImageIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (objc_opt_respondsToSelector())
  {
    char v4 = [WeakRetained backgroundImageIdentifierForStartPageViewController:self];
  }
  else
  {
    char v4 = &stru_1EDA07C28;
  }

  return v4;
}

- (id)topStartPageCollectionViewController
{
  id v2 = [(UINavigationController *)self->_navigationController topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __57__SFStartPageViewController_updateNavigationBarTintColor__block_invoke_2(id *a1)
{
  id v2 = [a1[4] title];
  if ([v2 length])
  {
    uint64_t v3 = *((void *)a1[5] + 151);

    if (v3 || !objc_msgSend(a1[6], "sf_alternateUserInterfaceStyle"))
    {
      char v4 = 0;
      goto LABEL_8;
    }
    [a1[5] scrollDistance];
    double v6 = SFChromeVisibilityForScrollDistance(v5);
    id v2 = [MEMORY[0x1E4FB1618] labelColor];
    double v7 = objc_msgSend(a1[6], "sf_traitCollectionWithAlternateUserInterfaceColorAsPrimary");
    double v8 = [v2 resolvedColorWithTraitCollection:v7];

    char v4 = SFInterpolateColor(v8, v2, v6);
  }
  else
  {
    char v4 = 0;
  }

LABEL_8:

  return v4;
}

id __57__SFStartPageViewController_updateNavigationBarTintColor__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2[151])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [v2 effectiveControlTintColor];
    if (v3)
    {
      char v4 = [*(id *)(*(void *)(a1 + 32) + 1040) traitCollection];
      if (objc_msgSend(v4, "sf_alternateUserInterfaceStyle"))
      {
        [*(id *)(a1 + 32) scrollDistance];
        double v6 = SFChromeVisibilityForScrollDistance(v5);
        double v7 = objc_msgSend(v4, "sf_traitCollectionWithAlternateUserInterfaceColorAsPrimary");
        double v8 = [v3 resolvedColorWithTraitCollection:v7];

        uint64_t v9 = SFInterpolateColor(v8, v3, v6);

        uint64_t v3 = (void *)v9;
      }
    }
  }

  return v3;
}

- (id)effectiveControlTintColor
{
  preferredControlTintColor = self->_preferredControlTintColor;
  if (preferredControlTintColor)
  {
    uint64_t v3 = preferredControlTintColor;
  }
  else
  {
    double v5 = [(UIImageView *)self->_wallpaperView image];
    if (v5)
    {
      double v6 = [MEMORY[0x1E4FB1618] labelColor];
    }
    else
    {
      double v6 = self->_preferredControlTintColor;
    }
    uint64_t v3 = v6;
  }

  return v3;
}

uint64_t __75__SFStartPageViewController__updateWallpaperIfNeededWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  int v4 = *(unsigned __int8 *)(a1 + 48);
  double v5 = *(id **)(a1 + 32);
  id v6 = v5[140];
  if (v4)
  {
    if (v6) {
      goto LABEL_9;
    }
    double v7 = [v5 view];
    id v8 = objc_alloc(MEMORY[0x1E4FB1838]);
    [v7 bounds];
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:");
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 1120);
    *(void *)(v10 + 1120) = v9;

    [*(id *)(*(void *)(a1 + 32) + 1120) setAutoresizingMask:18];
    if ((a2 & 1) == 0) {
      [*(id *)(*(void *)(a1 + 32) + 1120) setContentMode:2];
    }
    [v7 insertSubview:*(void *)(*(void *)(a1 + 32) + 1120) atIndex:0];
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    [v5[140] removeFromSuperview];
    uint64_t v12 = *(void *)(a1 + 32);
    double v7 = *(void **)(v12 + 1120);
    *(void *)(v12 + 1120) = 0;
  }

LABEL_9:
  if (*(unsigned char *)(a1 + 48))
  {
    id v13 = *(void **)(a1 + 32);
    uint64_t v14 = (void *)v13[139];
    uint64_t v15 = [v13 _wallpaperImageIdentifier];
    id v16 = [v14 imageForIdentifier:v15 forProfile:*(void *)(*(void *)(a1 + 32) + 1192)];

    if (a2)
    {
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:scale:orientation:", objc_msgSend(v16, "CGImage"), 0, 3.0);
      id v18 = objc_msgSend(v17, "resizableImageWithCapInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
      [*(id *)(*(void *)(a1 + 32) + 1120) setImage:v18];

      [*(id *)(*(void *)(a1 + 32) + 1120) setContentMode:0];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 1120) setContentMode:2];
      double v19 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:", objc_msgSend(v16, "CGImage"));
      [*(id *)(*(void *)(a1 + 32) + 1120) setImage:v19];
    }
  }
  [*(id *)(a1 + 32) updateOverrideTraitCollection];
  [*(id *)(a1 + 32) _reloadCustomizationViewController];
  [*(id *)(a1 + 32) _updateSearchBarAppearance];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v21 = *(uint64_t (**)(void))(result + 16);
    return v21();
  }
  return result;
}

- (void)updateOverrideTraitCollection
{
  if (self->_alternateContentViewController || ![(SFStartPageViewController *)self showsWallpaper])
  {
    uint64_t v5 = 0;
  }
  else
  {
    wallpaperManager = self->_wallpaperManager;
    int v4 = [(SFStartPageViewController *)self _wallpaperImageIdentifier];
    uint64_t v5 = [(WBSStartPageBackgroundManager *)wallpaperManager appearanceForImageWithIdentifier:v4 forProfile:self->_profile];
  }
  [(SFStartPageViewController *)self _updateOverrideTraitCollectionWithUserInterfaceStyle:v5];
  [(SFStartPageViewController *)self updateNavigationBarTintColor];

  [(SFStartPageViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)_updateSearchBarAppearance
{
  if (self->_searchController)
  {
    BOOL v3 = [(SFStartPageViewController *)self showsWallpaper];
    int v4 = [(UISearchController *)self->_searchController searchBar];
    id v14 = [v4 searchTextField];

    searchFieldBackgroundView = self->_searchFieldBackgroundView;
    if (searchFieldBackgroundView) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = v3;
    }
    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4FB1F00]);
      id v8 = [MEMORY[0x1E4FB14C8] effectWithStyle:7];
      uint64_t v9 = (UIVisualEffectView *)[v7 initWithEffect:v8];
      uint64_t v10 = self->_searchFieldBackgroundView;
      self->_searchFieldBackgroundView = v9;

      [(UIVisualEffectView *)self->_searchFieldBackgroundView setClipsToBounds:1];
      [(UIVisualEffectView *)self->_searchFieldBackgroundView setUserInteractionEnabled:0];
      [(UIVisualEffectView *)self->_searchFieldBackgroundView _setContinuousCornerRadius:10.0];
      [v14 bounds];
      -[UIVisualEffectView setFrame:](self->_searchFieldBackgroundView, "setFrame:");
      [(UIVisualEffectView *)self->_searchFieldBackgroundView setAutoresizingMask:18];
      searchFieldBackgroundView = self->_searchFieldBackgroundView;
    }
    uint64_t v11 = [(UIVisualEffectView *)searchFieldBackgroundView superview];

    if (v11) {
      BOOL v12 = 0;
    }
    else {
      BOOL v12 = v3;
    }
    if (v12)
    {
      [v14 insertSubview:self->_searchFieldBackgroundView atIndex:0];
    }
    else
    {
      if (v11) {
        char v13 = v3;
      }
      else {
        char v13 = 1;
      }
      if ((v13 & 1) == 0) {
        [(UIVisualEffectView *)self->_searchFieldBackgroundView removeFromSuperview];
      }
    }
  }
}

- (void)_updateOverrideTraitCollectionWithUserInterfaceStyle:(int64_t)a3
{
  id v10 = [(UINavigationController *)self->_navigationController traitOverrides];
  if (self->_alternateContentViewController)
  {
    [v10 removeTrait:objc_opt_class()];
    objc_msgSend(MEMORY[0x1E4FB1E20], "safari_removeAllCustomTraits:", v10);
  }
  else
  {
    if (a3) {
      [v10 setNSIntegerValue:a3 forTrait:objc_opt_class()];
    }
    else {
      [v10 removeTrait:objc_opt_class()];
    }
    if (self->_backgroundDisplayMode == 1)
    {
      [v10 setNSIntegerValue:1 forTrait:objc_opt_class()];
      uint64_t v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
      [v10 setObject:v5 forTrait:objc_opt_class()];
    }
    else
    {
      BOOL v6 = [(UIImageView *)self->_wallpaperView image];

      if (v6) {
        [v10 setNSIntegerValue:1 forTrait:objc_opt_class()];
      }
      else {
        [v10 removeTrait:objc_opt_class()];
      }
      [v10 removeTrait:objc_opt_class()];
    }
    id v7 = [(SFStartPageViewController *)self effectiveControlTintColor];
    if (v7) {
      [v10 setObject:v7 forTrait:objc_opt_class()];
    }
    else {
      [v10 removeTrait:objc_opt_class()];
    }

    id v8 = [(SFStartPageViewController *)self traitCollection];
    uint64_t v9 = [v8 userInterfaceStyle];

    if (v9 == 2) {
      [v10 setNSIntegerValue:1 forTrait:objc_opt_class()];
    }
    else {
      [v10 removeTrait:objc_opt_class()];
    }
  }
}

- (void)_reloadCustomizationViewController
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = self->_dataSourceObservers;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        BOOL v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "reloadDataAnimatingDifferences:", 1, (void)v7);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)updateStartPageTopPadding
{
}

- (int64_t)preferredStatusBarStyle
{
  if (!self->_wallpaperView || self->_alternateContentViewController) {
    return 0;
  }
  uint64_t v4 = [(UINavigationController *)self->_navigationController traitCollection];
  uint64_t v5 = [(UINavigationController *)self->_navigationController topViewController];
  BOOL v6 = v5;
  double v7 = 8.0;
  if (v5 != self->_rootCollectionViewController) {
    goto LABEL_7;
  }
  long long v8 = [(SFStartPageCollectionViewController *)v5 navigationItem];
  int v9 = objc_msgSend(v8, "sf_isEmpty");

  if (v9)
  {
    BOOL v6 = [(UINavigationController *)self->_navigationController navigationBar];
    [v6 bounds];
    double v7 = CGRectGetHeight(v13) + 8.0;
LABEL_7:
  }
  [(SFStartPageViewController *)self scrollDistance];
  if (v10 <= v7) {
    uint64_t v11 = objc_msgSend(v4, "sf_alternateUserInterfaceStyle");
  }
  else {
    uint64_t v11 = [v4 userInterfaceStyle];
  }
  int64_t v3 = SFContrastingStatusBarStyleForInterfaceStyle(v11);

  return v3;
}

uint64_t __49__SFStartPageViewController__wallpaperDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startPageCollectionViewControllerDidUpdateContent:*(void *)(*(void *)(a1 + 32) + 1088)];
}

- (void)setScrollObserver:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setCustomizationDataSource:(id)a3
{
}

- (BOOL)startPageCollectionViewControllerShouldInstallCustomBackdrops:(id)a3
{
  uint64_t v4 = (SFStartPageCollectionViewController *)a3;
  BOOL v5 = (_SFDeviceIsPad() & 1) == 0 && self->_rootCollectionViewController == v4;

  return v5;
}

- (SFStartPageViewController)initWithVisualStyleProvider:(id)a3 forProfile:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)SFStartPageViewController;
  int v9 = [(SFStartPageViewController *)&v33 initWithNibName:0 bundle:0];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_visualStyleProvider, a3);
    v10->_int64_t customizationPolicy = 0;
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB19E8]) initWithNavigationBarClass:objc_opt_class() toolbarClass:0];
    navigationController = v10->_navigationController;
    v10->_navigationController = (UINavigationController *)v11;

    [(UINavigationController *)v10->_navigationController _setClipUnderlapWhileTransitioning:1];
    [(UINavigationController *)v10->_navigationController setDelegate:v10];
    CGRect v13 = [[SFStartPageCollectionViewController alloc] initWithVisualStyleProvider:v7];
    rootCollectionViewController = v10->_rootCollectionViewController;
    v10->_rootCollectionViewController = v13;

    [(SFStartPageCollectionViewController *)v10->_rootCollectionViewController setDataSource:v10];
    [(SFStartPageCollectionViewController *)v10->_rootCollectionViewController setDelegate:v10];
    uint64_t v15 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    dataSourceObservers = v10->_dataSourceObservers;
    v10->_dataSourceObservers = (NSHashTable *)v15;

    [(NSHashTable *)v10->_dataSourceObservers addObject:v10->_rootCollectionViewController];
    uint64_t v17 = [MEMORY[0x1E4F98E88] defaultManager];
    wallpaperManager = v10->_wallpaperManager;
    v10->_wallpaperManager = (WBSStartPageBackgroundManager *)v17;

    objc_storeStrong((id *)&v10->_profile, a4);
    double v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v10 selector:sel__wallpaperDidChange_ name:*MEMORY[0x1E4F99658] object:0];
    CFStringRef v20 = (const __CFString *)*MEMORY[0x1E4F99648];
    [v19 addObserver:v10 selector:sel__wallpaperDidChange_ name:*MEMORY[0x1E4F99648] object:0];
    [v19 addObserver:v10 selector:sel__wallpaperDidChangeRemotely name:*MEMORY[0x1E4F99660] object:0];
    [v19 addObserver:v10 selector:sel__wallpaperWasDeletedRemotely name:*MEMORY[0x1E4F99650] object:0];
    [v19 addObserver:v10 selector:sel__backgroundImageDidToggle name:*MEMORY[0x1E4F993D8] object:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v10, (CFNotificationCallback)_settingsBundleUpdatedWallpaper, v20, 0, (CFNotificationSuspensionBehavior)1028);
    objc_initWeak(&location, v10);
    long long v22 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v23 = *MEMORY[0x1E4F98860];
    uint64_t v24 = MEMORY[0x1E4F14428];
    id v25 = MEMORY[0x1E4F14428];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __68__SFStartPageViewController_initWithVisualStyleProvider_forProfile___block_invoke;
    v30[3] = &unk_1E54EB320;
    objc_copyWeak(&v31, &location);
    uint64_t v26 = objc_msgSend(v22, "safari_observeValueForKey:onQueue:notifyForInitialValue:handler:", v23, v24, 0, v30);
    wallpaperDefaultsObservation = v10->_wallpaperDefaultsObservation;
    v10->_wallpaperDefaultsObservation = (WBSUserDefaultObservation *)v26;

    uint64_t v28 = v10;
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return v10;
}

- (void)setBackgroundDisplayMode:(int64_t)a3
{
  if (self->_backgroundDisplayMode != a3)
  {
    self->_backgroundDisplayMode = a3;
    [(SFStartPageViewController *)self _updateWallpaperIfNeededWithCompletionHandler:0];
  }
}

- (void)reloadSection:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_dataSourceObservers;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reloadSection:v6 animated:v4];
        }
        else {
          objc_msgSend(v11, "reloadDataAnimatingDifferences:", v4, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)resetToRootViewWithCustomizationPolicy:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__SFStartPageViewController_resetToRootViewWithCustomizationPolicy___block_invoke;
  v3[3] = &unk_1E54EB740;
  v3[4] = self;
  v3[5] = a3;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

- (void)setPreferredControlTintColor:(id)a3
{
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredControlTintColor, a3);
    [(SFStartPageViewController *)self _updateWallpaperIfNeededWithCompletionHandler:0];
  }
}

- (void)setDataSource:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_dataSource, v4);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_dataSourceObservers;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "reloadDataAnimatingDifferences:", 0, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (SFStartPageViewController)init
{
  int64_t v3 = +[SFDefaultStartPageVisualStyleProvider sharedProvider];
  id v4 = [(SFStartPageViewController *)self initWithVisualStyleProvider:v3 forProfile:0];

  return v4;
}

void __68__SFStartPageViewController_initWithVisualStyleProvider_forProfile___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [WeakRetained _updateWallpaperIfNeededWithCompletionHandler:0];
    v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v1 postNotificationName:*MEMORY[0x1E4F99658] object:WeakRetained];

    [WeakRetained _reloadCustomizationViewController];
  }
}

- (void)dealloc
{
  int64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SFStartPageViewController;
  [(SFStartPageViewController *)&v4 dealloc];
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (double)scrollDistance
{
  id v2 = [(SFStartPageViewController *)self scrollViewForStartPageCollectionViewsOnly:1];
  [v2 contentOffset];
  double v4 = v3;
  [v2 adjustedContentInset];
  double v6 = v4 + v5;

  return v6;
}

- (BOOL)isTrackingDropSession
{
  id v2 = [(SFStartPageViewController *)self topStartPageCollectionViewController];
  char v3 = [v2 isTrackingDropSession];

  return v3;
}

- (id)scrollViewForStartPageCollectionViewsOnly:(BOOL)a3
{
  double v4 = [(UINavigationController *)self->_navigationController topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 scrollView];
  }
  else if (a3)
  {
    id v5 = 0;
  }
  else
  {
    double v6 = [v4 viewIfLoaded];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v5 = v7;
  }

  return v5;
}

- (void)configureModelWithIdentifier:(id)a3 usingBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_alternateContentViewController)
  {
    uint64_t v8 = self->_originalNavigationStack;
  }
  else
  {
    uint64_t v8 = [(UINavigationController *)self->_navigationController viewControllers];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = v8;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          objc_msgSend(v14, "configureModelWithIdentifier:usingBlock:", v6, v7, (void)v15);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)ignorePreviousLayoutSize
{
  id v2 = [(SFStartPageViewController *)self topStartPageCollectionViewController];
  [v2 ignorePreviousLayoutSize];
}

- (void)cancelGestures
{
  id v2 = [(SFStartPageViewController *)self topStartPageCollectionViewController];
  [v2 cancelGestures];
}

- (BOOL)rootViewHidesEmptyNavigationBar
{
  return [(SFStartPageCollectionViewController *)self->_rootCollectionViewController hidesEmptyNavigationBar];
}

- (void)showDetailForItemWithIdentifier:(id)a3
{
  id v4 = [(SFStartPageViewController *)self previewViewControllerForItemIdentifier:a3];
  -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:");
}

- (void)presentViewController:(id)a3 fromItemWithIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(UINavigationController *)self->_navigationController topViewController];
  [v7 presentViewController:v8 fromItemWithIdentifier:v6];
}

- (double)navigationBarHeight
{
  id v2 = [(UINavigationController *)self->_navigationController navigationBar];
  [v2 bounds];
  double Height = CGRectGetHeight(v5);

  return Height;
}

- (double)navigationBarPrimaryContentHeight
{
  double v3 = _SFRoundFloatToPixels(self->_navigationBarPaletteHeight + self->_navigationBarPaletteInsets.bottom);
  [(SFStartPageViewController *)self navigationBarHeight];
  return v4 - v3;
}

- (void)setNavigationBarPaletteHeight:(double)a3 alignmentInsets:(UIEdgeInsets)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3 == 0.0) {
    a4 = *(UIEdgeInsets *)*(void *)&MEMORY[0x1E4FB2848];
  }
  if (self->_navigationBarPaletteHeight != a3
    || (self->_navigationBarPaletteInsets.left == a4.left
      ? (BOOL v5 = self->_navigationBarPaletteInsets.top == a4.top)
      : (BOOL v5 = 0),
        v5 ? (BOOL v6 = self->_navigationBarPaletteInsets.right == a4.right) : (BOOL v6 = 0),
        v6 ? (BOOL v7 = self->_navigationBarPaletteInsets.bottom == a4.bottom) : (BOOL v7 = 0),
        !v7))
  {
    self->_navigationBarPaletteInsets = a4;
    self->_double navigationBarPaletteHeight = a3;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = [(UINavigationController *)self->_navigationController viewControllers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = [*(id *)(*((void *)&v13 + 1) + 8 * i) navigationItem];
          [(SFStartPageViewController *)self configurePaletteForNavigationItem:v12];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (int64_t)navigationBarPosition
{
  return [(UINavigationController *)self->_navigationController _preferredNavigationBarPosition];
}

- (void)setNavigationBarPosition:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(SFStartPageViewController *)self navigationBarPosition] != a3)
  {
    [(UINavigationController *)self->_navigationController _setPreferredNavigationBarPosition:a3];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    BOOL v5 = [(UINavigationController *)self->_navigationController viewControllers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v9 navigationBarPositionDidChange];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setAlternateContentViewController:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (UIViewController *)a3;
  if (self->_alternateContentViewController != v5)
  {
    [(SFStartPageViewController *)self loadViewIfNeeded];
    uint64_t v6 = [(UIViewController *)self->_alternateContentViewController navigationItem];
    objc_storeStrong((id *)&self->_alternateContentViewController, a3);
    originalNavigationStack = self->_originalNavigationStack;
    if (!v5 || originalNavigationStack)
    {
      if (!v5)
      {
        long long v13 = originalNavigationStack;
        long long v14 = self->_originalNavigationStack;
        self->_originalNavigationStack = 0;

        [(UINavigationController *)self->_navigationController setViewControllers:v13];
        [(UIImageView *)self->_wallpaperView setHidden:0];

        double v12 = 0.0;
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v8 = [(UINavigationController *)self->_navigationController viewControllers];
      uint64_t v9 = self->_originalNavigationStack;
      self->_originalNavigationStack = v8;
    }
    long long v10 = [(UIViewController *)v5 navigationItem];
    [(SFStartPageViewController *)self configurePaletteForNavigationItem:v10];

    v15[0] = v5;
    long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [(UINavigationController *)self->_navigationController setViewControllers:v11];

    [(UIImageView *)self->_wallpaperView setHidden:1];
    double v12 = (double)([(UINavigationController *)self->_navigationController isNavigationBarHidden] ^ 1);
LABEL_7:
    [(UIVisualEffectView *)self->_statusBarBackdrop setAlpha:v12];
    [(SFStartPageViewController *)self updateOverrideTraitCollection];
    [(SFStartPageViewController *)self reloadNavigationItemAnimated:0];
    [(SFStartPageViewController *)self setNeedsStatusBarAppearanceUpdate];
    [v6 setLeftBarButtonItems:0];
    [v6 setRightBarButtonItems:0];
    [v6 _setBottomPalette:0];
  }
}

- (void)_wallpaperDidChangeRemotely
{
  wallpaperManager = self->_wallpaperManager;
  id v3 = [(SFStartPageViewController *)self _wallpaperImageIdentifier];
  -[WBSStartPageBackgroundManager loadImageFromDiskForIdentifier:](wallpaperManager, "loadImageFromDiskForIdentifier:");
}

- (void)_wallpaperWasDeletedRemotely
{
}

- (void)_backgroundImageDidToggle
{
  [(SFStartPageViewController *)self _updateWallpaperIfNeededWithCompletionHandler:0];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:*MEMORY[0x1E4F99658] object:self];

  [(SFStartPageViewController *)self _reloadCustomizationViewController];
}

- (void)unfocusGestureDidUpdate:(id)a3
{
  id v8 = a3;
  if ([v8 state] == 2)
  {
    double v4 = [(SFStartPageViewController *)self view];
    [v8 translationInView:v4];
    double v6 = v5;

    if (v6 < -5.0)
    {
      [v8 setEnabled:0];
      [v8 setEnabled:1];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained startPageControllerDidCompleteUnfocusGesture:self];
    }
  }
}

- (void)startPageCollectionViewController:(id)a3 toggleSectionExpanded:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained startPageViewController:self toggleSectionExpanded:v6];
  }
}

- (void)_createSearchControllerIfNeeded
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!self->_searchController)
  {
    id v3 = (UISearchController *)[objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
    searchController = self->_searchController;
    self->_searchController = v3;

    [(UISearchController *)self->_searchController setObscuresBackgroundDuringPresentation:0];
    [(UISearchController *)self->_searchController setHidesNavigationBarDuringPresentation:0];
    [(UISearchController *)self->_searchController setDelegate:self];
    [(UISearchController *)self->_searchController setSearchResultsUpdater:self];
    double v5 = [(UISearchController *)self->_searchController searchBar];
    id v6 = [v5 searchTextField];

    uint64_t v7 = [MEMORY[0x1E4FB1618] labelColor];
    id v8 = [v7 colorWithAlphaComponent:0.4];

    id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
    long long v10 = _WBSLocalizedString();
    uint64_t v14 = *MEMORY[0x1E4FB0700];
    v15[0] = v8;
    long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    double v12 = (void *)[v9 initWithString:v10 attributes:v11];
    [v6 setAttributedPlaceholder:v12];

    long long v13 = [v6 rightView];
    [v13 setTintColor:v8];

    [(SFStartPageViewController *)self _updateSearchBarAppearance];
  }
}

- (void)startPageCollectionViewController:(id)a3 didSelectItemWithIdentifier:(id)a4 atGridLocation:(id)a5
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "startPageViewController:didSelectItemWithIdentifier:atGridLocation:", self, v9, var0, var1);
  }
}

- (void)beginCustomizationForStartPageCollectionViewController:(id)a3
{
  double v4 = [SFStartPageCustomizationViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customizationDataSource);
  id v9 = [(SFStartPageCustomizationViewController *)v4 initWithDataSource:WeakRetained];

  [(SFStartPageCustomizationViewController *)v9 setShowsCloseButton:1];
  [(NSHashTable *)self->_dataSourceObservers addObject:v9];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v9];
  [v6 setModalPresentationStyle:2];
  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [v7 startPageViewController:self willPresentCustomizationViewController:v9];
  }
  id v8 = [(SFStartPageViewController *)self presentedViewController];
  [v8 dismissViewControllerAnimated:0 completion:0];

  [(SFStartPageViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)startPageCollectionViewControllerDidCompleteDismissGesture:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained startPageControllerDidCompleteDismissGesture:self];
  }
}

- (BOOL)startPageCollectionViewControllerShouldDeferLoadingContentUntilKeyboardAnimatesIn:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v5 = [WeakRetained startPageViewControllerShouldDeferLoadingContentUntilKeyboardAnimatesIn:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)startPageCollectionViewController:(id)a3 shouldExpandSectionWithIdentifier:(id)a4
{
  char v5 = (NSString *)a4;
  [(SFStartPageViewController *)self showDetailForItemWithIdentifier:v5];
  expandedSectionIdentifier = self->_expandedSectionIdentifier;
  self->_expandedSectionIdentifier = v5;
}

- (id)previewViewControllerForItemIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if ([MEMORY[0x1E4F97EA0] is2024CloudTabsEnabled]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v4 isEqualToString:*MEMORY[0x1E4F98878]])
  {
    char v5 = [SFStartPageMultiSectionDataSource alloc];
    id v6 = _WBSLocalizedString();
    id v7 = v20;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__SFStartPageViewController_previewViewControllerForItemIdentifier___block_invoke;
    v20[3] = &unk_1E54EB808;
    id v8 = &v21;
    objc_copyWeak(&v21, &location);
    v20[4] = v4;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __68__SFStartPageViewController_previewViewControllerForItemIdentifier___block_invoke_2;
    v18[3] = &unk_1E54EB830;
    id v9 = &v19;
    objc_copyWeak(&v19, &location);
    long long v10 = [(SFStartPageMultiSectionDataSource *)v5 initWithSectionTitle:v6 reloadHandler:v20 navigationItemHandler:v18];

    [(NSHashTable *)self->_dataSourceObservers addObject:v10];
    long long v11 = [[SFStartPageCollectionViewController alloc] initWithVisualStyleProvider:self->_visualStyleProvider];
    [(SFStartPageCollectionViewController *)v11 setDelegate:self];
    [(SFStartPageMultiSectionDataSource *)v10 connectToViewController:v11];
  }
  else
  {
    double v12 = [SFStartPageSingleSectionDataSource alloc];
    id v7 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__SFStartPageViewController_previewViewControllerForItemIdentifier___block_invoke_3;
    v16[3] = &unk_1E54EB858;
    id v8 = &v17;
    objc_copyWeak(&v17, &location);
    v16[4] = v4;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__SFStartPageViewController_previewViewControllerForItemIdentifier___block_invoke_107;
    v14[3] = &unk_1E54EB880;
    id v9 = &v15;
    objc_copyWeak(&v15, &location);
    long long v10 = [(SFStartPageSingleSectionDataSource *)v12 initWithReloadHandler:v16 navigationItemHandler:v14];
    [(NSHashTable *)self->_dataSourceObservers addObject:v10];
    long long v11 = [[SFStartPageCollectionViewController alloc] initWithVisualStyleProvider:self->_visualStyleProvider];
    [(SFStartPageCollectionViewController *)v11 setDelegate:self];
    [(SFStartPageMultiSectionDataSource *)v10 connectToViewController:v11];
  }

  objc_destroyWeak(v9);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

  return v11;
}

id __68__SFStartPageViewController_previewViewControllerForItemIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(WeakRetained + 146);
    char v5 = [v4 startPageViewController:v3 detailSectionsForItemIdentifier:*(void *)(a1 + 32)];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

void __68__SFStartPageViewController_previewViewControllerForItemIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = [v5 firstObject];
    [WeakRetained _setLeadingBarItems:0 trailingBarItems:1 onNavigationItem:v8 forSection:v7];
  }
}

id __68__SFStartPageViewController_previewViewControllerForItemIdentifier___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v8 = 138739971;
      uint64_t v9 = v4;
      _os_log_impl(&dword_18C354000, v3, OS_LOG_TYPE_INFO, "Creating single data source section with identifier %{sensitive}@", (uint8_t *)&v8, 0xCu);
    }
    id v5 = objc_loadWeakRetained(WeakRetained + 146);
    id v6 = [v5 startPageViewController:WeakRetained detailSectionForItemIdentifier:*(void *)(a1 + 32)];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __68__SFStartPageViewController_previewViewControllerForItemIdentifier___block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _setLeadingBarItems:0 trailingBarItems:1 onNavigationItem:v8 forSection:v5];
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained startPageViewControllerDidChangeRootViewVisibility:self];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_unfocusGesture == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v3 = objc_opt_respondsToSelector();
  }
  else
  {
    char v3 = 1;
  }
  return v3 & 1;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollObserver);
  [WeakRetained startPageViewControllerDidScroll:self];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v7 searchBar];
    id v6 = [v5 text];
    [WeakRetained startPageViewController:self didUpdateSearchPattern:v6];
  }
}

- (UIScrollView)test_scrollView
{
  return (UIScrollView *)[(SFStartPageViewController *)self scrollViewForStartPageCollectionViewsOnly:1];
}

- (int64_t)backgroundDisplayMode
{
  return self->_backgroundDisplayMode;
}

- (SFStartPageCustomizationDataSource)customizationDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customizationDataSource);

  return (SFStartPageCustomizationDataSource *)WeakRetained;
}

- (int64_t)customizationPolicy
{
  return self->_customizationPolicy;
}

- (SFStartPageDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SFStartPageDataSource *)WeakRetained;
}

- (SFStartPageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFStartPageDelegate *)WeakRetained;
}

- (SFStartPageScrollObserver)scrollObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollObserver);

  return (SFStartPageScrollObserver *)WeakRetained;
}

- (WBProfile)profile
{
  return self->_profile;
}

- (UIColor)preferredControlTintColor
{
  return self->_preferredControlTintColor;
}

- (UIViewController)alternateContentViewController
{
  return self->_alternateContentViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateContentViewController, 0);
  objc_storeStrong((id *)&self->_preferredControlTintColor, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_scrollObserver);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_customizationDataSource);
  objc_storeStrong((id *)&self->_expandedSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_statusBarBackdrop, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
  objc_storeStrong((id *)&self->_wallpaperManager, 0);
  objc_storeStrong((id *)&self->_wallpaperDefaultsObservation, 0);
  objc_storeStrong((id *)&self->_visualStyleProvider, 0);
  objc_storeStrong((id *)&self->_rootCollectionViewController, 0);
  objc_storeStrong((id *)&self->_originalNavigationStack, 0);
  objc_storeStrong((id *)&self->_searchFieldBackgroundView, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_foregroundScrollView, 0);
  objc_storeStrong((id *)&self->_unfocusGesture, 0);

  objc_storeStrong((id *)&self->_dataSourceObservers, 0);
}

@end