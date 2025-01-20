@interface SUUIScrollingTabBarController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (BOOL)areScrollingTabsAllowed;
- ($6FC496E8309A5FF7C7AA8B90E862B691)_viewControllerContentScrollViewContentInsetDescriptor;
- (BOOL)_focusedContentScrollViewIsScrolledToOrPastBottom;
- (BOOL)chargeEnabledOnTabBarButtonsContainer;
- (BOOL)dynamicBarAnimator:(id)a3 canHideBarsByDraggingWithOffset:(double)a4;
- (BOOL)scrollEnabled;
- (CGRect)tabBarButtonsContainerFrame;
- (CGRect)tabBarPaletteFrame;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)viewControllers;
- (SUUIScrollingTabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (SUUITabBarControllerDelegate)delegate;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIOffset)_roundedOffsetFromOffset:(UIOffset)a3;
- (UIOffset)additionalTabBarButtonsContainerPositionOffset;
- (UIOffset)additionalTabBarPalettePositionOffset;
- (UIView)tabBar;
- (UIViewController)selectedViewController;
- (UIViewController)transientViewController;
- (double)_effectiveBottomBarOffset;
- (double)_effectiveTopBarHeight;
- (double)contentViewControllerBottomInsetAdjustment;
- (id)_deepestFocusedViewControllerWithTopLevelFocusedViewController:(id)a3;
- (id)_parentCellForViewController:(id)a3;
- (id)_tabBarBackdropGroupName;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)contentScrollView;
- (id)existingTabBarPalette;
- (id)presentedViewController;
- (id)rotatingSnapshotViewForWindow:(id)a3;
- (id)tabBarPaletteWithHeight:(double)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (unint64_t)selectedIndex;
- (unint64_t)supportedInterfaceOrientations;
- (void)_animatePaletteWithSetup:(id)a3 animations:(id)a4 completion:(id)a5;
- (void)_discardUndesirableLastSelectedPageIndexesWithHorizontalLayoutContext:(id *)a3;
- (void)_invalidateContentCollectionViewLayoutForUpdatedContentSizeWithHorizontalLayoutContext:(id *)a3 indexOfViewControllerWithUpdatedContentSize:(unint64_t)a4;
- (void)_notifyViewControllerAppearanceProgressUpdateWithHorizontalLayoutContext:(id *)a3;
- (void)_popVisibleNavigationStacksToRootWithHorizontalLayoutContext:(id *)a3;
- (void)_selectTabAtIndex:(unint64_t)a3 shouldFallbackToPoppingToTabRootContent:(BOOL)a4;
- (void)_setFocusedViewController:(id)a3 showBarsIfNeeded:(BOOL)a4 animated:(BOOL)a5 notifyDelegate:(BOOL)a6;
- (void)_setViewControllers:(id)a3 collectionViewsUpdateHandler:(id)a4 forFinalTearDown:(BOOL)a5;
- (void)_tabBarButtonTapped:(id)a3;
- (void)_updateAdditionalPositionOffsetsWithUpdateRecord:(id *)a3;
- (void)_updateDynamicBarGeometry;
- (void)_updateFocusedViewControllerInsetsForVerticalLayoutChange;
- (void)_updateFocusedViewControllerWithHorizontalLayoutContext:(id *)a3;
- (void)_updateForHorizontalLayoutChange;
- (void)_updateHidesBarsOnSwipeAvailability;
- (void)_updateHorizontalScrollingAvailability;
- (void)_updateLayoutOfCollectionViewCell:(id)a3;
- (void)_updateLayoutOfTabBar;
- (void)_updateLayoutOfVisibleCollectionViewCells;
- (void)_updateNavigationBarsForVerticalLayoutChange;
- (void)_updateScrollViewContentOffsetsToTargetContentOffsets;
- (void)_updateStatusBarPositionForcingVisible:(BOOL)a3;
- (void)_updateTabBarBackgroundsAndHairlines;
- (void)_updateTabBarButtons;
- (void)_updateTabBarButtonsSelectionProgressWithHorizontalLayoutContext:(id *)a3;
- (void)_updateViewControllerContentScrollViewInset;
- (void)_viewControllerNeedsNestedPagingScrollViewUpdate:(id)a3;
- (void)attachTabBarPalette:(id)a3;
- (void)attachTabBarPalette:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)detachTabBarPalette:(id)a3;
- (void)detachTabBarPalette:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)didUpdateAdditionalTabBarComponentsPositionOffsets;
- (void)dynamicBarAnimatorDidUpdate:(id)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)hideBarWithTransition:(int)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)observedScrollViewDidScroll:(id)a3;
- (void)observedScrollViewWillBeginDragging:(id)a3;
- (void)observedScrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint)a5;
- (void)scrollViewDidChangeContentInset:(id)a3;
- (void)scrollingTabBarContentCollectionViewDidLayoutSubviews:(id)a3;
- (void)scrollingTabBarControllerItemContext:(id)a3 observedNavigationStackDidChange:(id)a4;
- (void)scrollingTabBarControllerItemContextRequestsContentOffsetUpdate:(id)a3;
- (void)scrollingTabBarControllerItemContextRequestsContentSizeUpdate:(id)a3;
- (void)setAdditionalTabBarButtonsContainerPositionOffset:(UIOffset)a3;
- (void)setAdditionalTabBarPalettePositionOffset:(UIOffset)a3;
- (void)setChargeEnabledOnTabBarButtonsContainer:(BOOL)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)setSelectedViewController:(id)a3;
- (void)setTransientViewController:(id)a3;
- (void)setTransientViewController:(id)a3 animated:(BOOL)a4;
- (void)setViewControllers:(id)a3;
- (void)showBarWithTransition:(int)a3;
- (void)tabBarBackgroundExtendsBehindPaletteDidChangeForPalette:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTabBarComponentPositionOffsetsWithPresentationValues;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willUpdateAdditionalTabBarComponentsPositionOffsets;
@end

@implementation SUUIScrollingTabBarController

+ (BOOL)areScrollingTabsAllowed
{
  if (areScrollingTabsAllowed_sOnceToken != -1) {
    dispatch_once(&areScrollingTabsAllowed_sOnceToken, &__block_literal_global_22);
  }
  return areScrollingTabsAllowed_sAreScrollingTabsAllowed;
}

void __56__SUUIScrollingTabBarController_areScrollingTabsAllowed__block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  areScrollingTabsAllowed_sAreScrollingTabsAllowed = [v0 BOOLForKey:@"AllowsScrollingTabs"];
}

- (SUUIScrollingTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIScrollingTabBarController;
  v4 = [(SUUIScrollingTabBarController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_chargeEnabledOnTabBarButtonsContainer = 1;
    v4->_indexOfViewControllerWithUpdatedContentSize = 0x7FFFFFFFFFFFFFFFLL;
    v4->_scrollEnabled = [(id)objc_opt_class() areScrollingTabsAllowed];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(SUUIScrollingTabBarController *)self _setViewControllers:0 collectionViewsUpdateHandler:0 forFinalTearDown:1];
  [(SUUIProxyScrollView *)self->_proxyScrollView setDelegate:0];
  [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView setDataSource:0];
  [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView setDelegate:0];
  v3 = [(SUUICrossFadingTabBar *)self->_tabBar tabBarButtons];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SUUIScrollingTabBarController;
  [(SUUIViewController *)&v8 dealloc];
}

- (id)childViewControllerForStatusBarHidden
{
  v3 = self->_transientViewController;
  if (!v3) {
    v3 = self->_topLevelFocusedViewController;
  }
  return v3;
}

- (id)childViewControllerForStatusBarStyle
{
  v3 = self->_transientViewController;
  if (!v3) {
    v3 = self->_topLevelFocusedViewController;
  }
  return v3;
}

- (id)presentedViewController
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIScrollingTabBarController;
  v3 = [(SUUIScrollingTabBarController *)&v5 presentedViewController];
  if (!v3)
  {
    if (self->_isDelegatingPresentedViewControllerLogicToSelectedViewController)
    {
      v3 = 0;
    }
    else
    {
      self->_isDelegatingPresentedViewControllerLogicToSelectedViewController = 1;
      v3 = [(UIViewController *)self->_topLevelFocusedViewController presentedViewController];
      self->_isDelegatingPresentedViewControllerLogicToSelectedViewController = 0;
    }
  }
  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  v3 = [(SUUIScrollingTabBarController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = (id)[v3 tabBarControllerSupportedInterfaceOrientations:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUIScrollingTabBarController;
    id v4 = [(SUUIViewController *)&v7 supportedInterfaceOrientations];
  }
  unint64_t v5 = (unint64_t)v4;

  return v5;
}

- (void)viewDidLoad
{
  v37[1] = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)SUUIScrollingTabBarController;
  [(SUUIScrollingTabBarController *)&v35 viewDidLoad];
  v3 = [(SUUIScrollingTabBarController *)self view];
  id v4 = [MEMORY[0x263F825C8] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 bounds];
  double v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  id v13 = objc_alloc(MEMORY[0x263F82E00]);
  uint64_t v14 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v14 setHidden:1];
  [v3 addSubview:v14];
  self->_contentCollectionViewItemSize.width = v10;
  self->_contentCollectionViewItemSize.height = v12;
  id v15 = objc_alloc_init(MEMORY[0x263F82570]);
  [v15 setScrollDirection:1];
  [v15 setMinimumInteritemSpacing:0.0];
  [v15 setMinimumLineSpacing:0.0];
  uint64_t v36 = *MEMORY[0x263F83500];
  v37[0] = &unk_2705D0B50;
  v16 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
  [v15 _setRowAlignmentsOptions:v16];

  v38.origin.x = v6;
  v38.origin.y = v8;
  v38.size.width = v10;
  v38.size.height = v12;
  double Width = CGRectGetWidth(v38);
  if (Width >= 2.0) {
    double v18 = Width;
  }
  else {
    double v18 = 2.0;
  }
  v39.origin.x = v6;
  v39.origin.y = v8;
  v39.size.width = v18;
  v39.size.height = v12;
  double Height = CGRectGetHeight(v39);
  if (Height >= 2.0) {
    double v20 = Height;
  }
  else {
    double v20 = 2.0;
  }
  v21 = -[SUUIScrollingTabBarContentCollectionView initWithFrame:collectionViewLayout:]([SUUIScrollingTabBarContentCollectionView alloc], "initWithFrame:collectionViewLayout:", v15, v6, v8, v18, v20);
  contentCollectionView = self->_contentCollectionView;
  self->_contentCollectionView = v21;

  v23 = [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView panGestureRecognizer];
  [v23 _setHysteresis:15.0];

  [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView setAllowsSelection:0];
  v24 = self->_contentCollectionView;
  v25 = [MEMORY[0x263F825C8] clearColor];
  [(SUUIScrollingTabBarContentCollectionView *)v24 setBackgroundColor:v25];

  [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView setDataSource:self];
  [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView setDelegate:self];
  [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x2704FB0D0];
  [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView setScrollsToTop:0];
  [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView setShowsHorizontalScrollIndicator:0];
  [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView setShowsVerticalScrollIndicator:0];
  [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView setPagingEnabled:1];
  [v3 addSubview:self->_contentCollectionView];
  [(SUUIScrollingTabBarController *)self _updateHorizontalScrollingAvailability];
  v26 = [(SUUIScrollingTabBarController *)self _tabBarBackdropGroupName];
  v27 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
  tabBarContainerView = self->_tabBarContainerView;
  self->_tabBarContainerView = v27;

  [v3 addSubview:self->_tabBarContainerView];
  v29 = objc_alloc_init(SUUICrossFadingTabBar);
  tabBar = self->_tabBar;
  self->_tabBar = v29;

  [(SUUICrossFadingTabBar *)self->_tabBar _setChargeEnabled:self->_chargeEnabledOnTabBarButtonsContainer];
  v31 = [(SUUICrossFadingTabBar *)self->_tabBar backgroundView];
  [v31 setBackdropBarGroupName:v26];
  [(UIView *)self->_tabBarContainerView addSubview:self->_tabBar];
  [(SUUIScrollingTabBarController *)self _updateTabBarButtons];
  v32 = objc_alloc_init(SUUIDynamicBarAnimator);
  dynamicBarAnimator = self->_dynamicBarAnimator;
  self->_dynamicBarAnimator = v32;

  [(SUUIDynamicBarAnimator *)self->_dynamicBarAnimator setDelegate:self];
  [(SUUIScrollingTabBarController *)self _updateDynamicBarGeometry];
  if (self->_transientViewController)
  {
    [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView setHidden:1];
    v34 = [(UIViewController *)self->_transientViewController view];
    [v3 insertSubview:v34 belowSubview:self->_tabBarContainerView];
  }
}

- (void)viewDidLayoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)SUUIScrollingTabBarController;
  [(SUUIScrollingTabBarController *)&v29 viewDidLayoutSubviews];
  v3 = [(SUUIScrollingTabBarController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  proxyScrollView = self->_proxyScrollView;
  if (proxyScrollView)
  {
    id v13 = [(SUUIProxyScrollView *)proxyScrollView superview];

    if (!v13) {
      [v3 addSubview:self->_proxyScrollView];
    }
  }
  double v15 = *MEMORY[0x263F00148];
  double v14 = *(double *)(MEMORY[0x263F00148] + 8);
  v16 = (void *)SUUIMPUFoundationFramework();
  v17 = (uint64_t (*)(double, double, double, double))SUUIWeakLinkedSymbolForString("MPUSizeEqualToSize", v16);
  p_contentCollectionViewItemSize = &self->_contentCollectionViewItemSize;
  if (v17(self->_contentCollectionViewItemSize.width, self->_contentCollectionViewItemSize.height, v9, v11))
  {
    BOOL v19 = 0;
  }
  else
  {
    if (self->_shouldPreserveFocusUponNextContentCollectionViewItemSizeChange)
    {
      BOOL v19 = p_contentCollectionViewItemSize->width > 0.00000011920929;
      if (p_contentCollectionViewItemSize->width > 0.00000011920929)
      {
        [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView contentOffset];
        double v14 = v20;
        UIRoundToViewScale();
        double v15 = v21;
      }
      self->_shouldPreserveFocusUponNextContentCollectionViewItemSizeChange = 0;
    }
    else
    {
      BOOL v19 = 0;
    }
    p_contentCollectionViewItemSize->width = v9;
    self->_contentCollectionViewItemSize.height = v11;
    v22 = [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView collectionViewLayout];
    id v23 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);

    [v23 setInvalidateFlowLayoutDelegateMetrics:1];
    v24 = [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView collectionViewLayout];
    [v24 invalidateLayoutWithContext:v23];
  }
  v30.origin.x = v5;
  v30.origin.y = v7;
  v30.size.width = v9;
  v30.size.height = v11;
  double Width = CGRectGetWidth(v30);
  if (Width >= 2.0) {
    double v26 = Width;
  }
  else {
    double v26 = 2.0;
  }
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v26;
  v31.size.height = v11;
  double Height = CGRectGetHeight(v31);
  if (Height >= 2.0) {
    double v28 = Height;
  }
  else {
    double v28 = 2.0;
  }
  -[SUUIScrollingTabBarContentCollectionView setFrame:](self->_contentCollectionView, "setFrame:", v5, v7, v26, v28);
  if (v19) {
    -[SUUIScrollingTabBarContentCollectionView setContentOffset:](self->_contentCollectionView, "setContentOffset:", v15, v14);
  }
  [(SUUIScrollingTabBarController *)self _updateLayoutOfTabBar];
  [(SUUIScrollingTabBarController *)self _updateForHorizontalLayoutChange];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIScrollingTabBarController;
  [(SUUIViewController *)&v8 viewWillAppear:a3];
  double v4 = [(SUUIScrollingTabBarController *)self transitionCoordinator];
  double v5 = v4;
  if (v4)
  {
    v6[4] = self;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__SUUIScrollingTabBarController_viewWillAppear___block_invoke;
    v7[3] = &unk_265400820;
    v7[4] = self;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __48__SUUIScrollingTabBarController_viewWillAppear___block_invoke_2;
    v6[3] = &unk_265400820;
    [v4 animateAlongsideTransition:v7 completion:v6];
  }
  else
  {
    [(SUUIScrollingTabBarController *)self _updateStatusBarPositionForcingVisible:0];
  }
}

uint64_t __48__SUUIScrollingTabBarController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStatusBarPositionForcingVisible:0];
}

uint64_t __48__SUUIScrollingTabBarController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    double v4 = *(void **)(a1 + 32);
    return [v4 _updateStatusBarPositionForcingVisible:1];
  }
  return result;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIScrollingTabBarController;
  [(SUUIScrollingTabBarController *)&v8 viewWillDisappear:a3];
  double v4 = [(SUUIScrollingTabBarController *)self transitionCoordinator];
  double v5 = v4;
  if (v4)
  {
    v6[4] = self;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__SUUIScrollingTabBarController_viewWillDisappear___block_invoke;
    v7[3] = &unk_265400820;
    v7[4] = self;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __51__SUUIScrollingTabBarController_viewWillDisappear___block_invoke_2;
    v6[3] = &unk_265400820;
    [v4 animateAlongsideTransition:v7 completion:v6];
  }
  else
  {
    [(SUUIScrollingTabBarController *)self _updateStatusBarPositionForcingVisible:1];
  }
}

uint64_t __51__SUUIScrollingTabBarController_viewWillDisappear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStatusBarPositionForcingVisible:1];
}

uint64_t __51__SUUIScrollingTabBarController_viewWillDisappear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    double v4 = *(void **)(a1 + 32);
    return [v4 _updateStatusBarPositionForcingVisible:0];
  }
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  objc_super v8 = [(SUUIScrollingTabBarController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "tabBarController:willTransitionToSize:withTransitionCoordinator:", self, v7, width, height);
  }
  self->_shouldPreserveFocusUponNextContentCollectionViewItemSizeChange = 1;
  if (v7)
  {
    ++self->_referenceCountForIgnoringContentOffsetUpdateRequests;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __84__SUUIScrollingTabBarController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v10[3] = &unk_265400820;
    v10[4] = self;
    [v7 animateAlongsideTransition:0 completion:v10];
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUIScrollingTabBarController;
  -[SUUIScrollingTabBarController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __84__SUUIScrollingTabBarController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t result)
{
  return result;
}

- (id)contentScrollView
{
  if (!self->_proxyScrollView && [(SUUIScrollingTabBarController *)self isViewLoaded])
  {
    v3 = [SUUIProxyScrollView alloc];
    double v4 = -[SUUIProxyScrollView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    proxyScrollView = self->_proxyScrollView;
    self->_proxyScrollView = v4;

    [(SUUIProxyScrollView *)self->_proxyScrollView setHidden:1];
    [(SUUIProxyScrollView *)self->_proxyScrollView setDelegate:self];
    [(SUUIProxyScrollView *)self->_proxyScrollView setScrollEnabled:0];
    [(SUUIProxyScrollView *)self->_proxyScrollView setScrollsToTop:0];
    double v6 = [(SUUIScrollingTabBarController *)self view];
    [v6 addSubview:self->_proxyScrollView];
  }
  id v7 = self->_proxyScrollView;
  return v7;
}

- (id)rotatingSnapshotViewForWindow:(id)a3
{
  double v4 = self->_transientViewController;
  if (!v4) {
    double v4 = self->_topLevelFocusedViewController;
  }
  double v5 = [(UIViewController *)v4 view];

  return v5;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  v17.receiver = self;
  v17.super_class = (Class)SUUIScrollingTabBarController;
  -[SUUIScrollingTabBarController _edgeInsetsForChildViewController:insetsAreAbsolute:](&v17, sel__edgeInsetsForChildViewController_insetsAreAbsolute_, a3);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(SUUIScrollingTabBarController *)self contentViewControllerBottomInsetAdjustment];
  double v13 = v12;
  if (a4) {
    *a4 = 0;
  }
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  result.right = v16;
  result.bottom = v13;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)setClientContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIScrollingTabBarController;
  [(SUUIViewController *)&v15 setClientContext:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v5 = self->_viewControllers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_2705E11B8, (void)v11)) {
          [v10 setClientContext:v4];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)_SUUIScrollingTabFocusedContentScrollViewContentSizeObservationContext == a6)
  {
    [(SUUIScrollingTabBarController *)self _updateHidesBarsOnSwipeAvailability];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SUUIScrollingTabBarController;
    -[SUUIScrollingTabBarController observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (BOOL)dynamicBarAnimator:(id)a3 canHideBarsByDraggingWithOffset:(double)a4
{
  [(UIScrollView *)self->_focusedContentScrollView contentSize];
  double v7 = v6;
  [(UIScrollView *)self->_focusedContentScrollView contentInset];
  double v9 = v7 + v8;
  [(UIScrollView *)self->_focusedContentScrollView bounds];
  return v9 - CGRectGetMaxY(v11) - a4 > 49.0;
}

- (void)dynamicBarAnimatorDidUpdate:(id)a3
{
  [(SUUIScrollingTabBarController *)self _updateNavigationBarsForVerticalLayoutChange];
  [(SUUIScrollingTabBarController *)self _updateLayoutOfTabBar];
  [(SUUIScrollingTabBarController *)self _updateFocusedViewControllerInsetsForVerticalLayoutChange];
}

- (void)scrollViewDidChangeContentInset:(id)a3
{
  if (self->_proxyScrollView == a3)
  {
    [a3 contentInset];
    BOOL v8 = self->_proxyScrollViewContentInsetAdjustment.left == v5
      && self->_proxyScrollViewContentInsetAdjustment.top == v4;
    BOOL v9 = v8 && self->_proxyScrollViewContentInsetAdjustment.right == v7;
    if (!v9 || self->_proxyScrollViewContentInsetAdjustment.bottom != v6)
    {
      self->_proxyScrollViewContentInsetAdjustment.top = v4;
      self->_proxyScrollViewContentInsetAdjustment.left = v5;
      self->_proxyScrollViewContentInsetAdjustment.bottom = v6;
      self->_proxyScrollViewContentInsetAdjustment.right = v7;
      [(SUUIScrollingTabBarController *)self _updateViewControllerContentScrollViewInset];
    }
  }
}

- (void)scrollingTabBarContentCollectionViewDidLayoutSubviews:(id)a3
{
  if (self->_contentCollectionView == a3) {
    [(SUUIScrollingTabBarController *)self _updateForHorizontalLayoutChange];
  }
}

- (void)scrollingTabBarControllerItemContextRequestsContentOffsetUpdate:(id)a3
{
  id v4 = a3;
  if (!self->_referenceCountForIgnoringContentOffsetUpdateRequests)
  {
    id v14 = v4;
    double v5 = [v4 viewController];
    if ([v5 isViewLoaded])
    {
      double v6 = [v5 view];
      double v7 = [v6 window];

      if (v7)
      {
        BOOL v8 = [(SUUIScrollingTabBarController *)self _parentCellForViewController:v5];
        if (v8)
        {
          BOOL v9 = [v14 nestedPagingScrollView];
          [v9 contentOffset];
          double v11 = v10;
          [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView contentOffset];
          double v13 = v12;
          [v8 frame];
          -[SUUIScrollingTabBarContentCollectionView setContentOffset:](self->_contentCollectionView, "setContentOffset:", v11 + CGRectGetMinX(v16), v13);
        }
      }
    }

    id v4 = v14;
  }
}

- (void)scrollingTabBarControllerItemContextRequestsContentSizeUpdate:(id)a3
{
  viewControllers = self->_viewControllers;
  double v5 = [a3 viewController];
  self->_indexOfViewControllerWithUpdatedContentSize = [(NSArray *)viewControllers indexOfObject:v5];

  if (![(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView isPerformingLayout])
  {
    [(SUUIScrollingTabBarController *)self _updateForHorizontalLayoutChange];
  }
}

- (void)scrollingTabBarControllerItemContext:(id)a3 observedNavigationStackDidChange:(id)a4
{
  if (self->_topLevelFocusedViewController == a4) {
    [(SUUIScrollingTabBarController *)self _updateHorizontalScrollingAvailability];
  }
}

- (void)tabBarBackgroundExtendsBehindPaletteDidChangeForPalette:(id)a3
{
  if (self->_tabBarPalette == a3 && [a3 isAttached])
  {
    [(SUUIScrollingTabBarController *)self _updateTabBarBackgroundsAndHairlines];
  }
}

- (void)observedScrollViewDidScroll:(id)a3
{
  id v5 = a3;
  [(SUUIScrollingTabBarController *)self _updateDynamicBarGeometry];
  if (self->_focusedScrollViewIsDragging)
  {
    if (self->_shouldShowBarsAfterDraggingDownward)
    {
      if ([(SUUIScrollingTabBarController *)self _focusedContentScrollViewIsScrolledToOrPastBottom])
      {
        [(SUUIDynamicBarAnimator *)self->_dynamicBarAnimator attemptTransitionToState:1 animated:1];
      }
      self->_shouldShowBarsAfterDraggingDownward = 0;
    }
    [v5 contentOffset];
    [(SUUIDynamicBarAnimator *)self->_dynamicBarAnimator updateDraggingWithOffset:v4];
  }
  [(SUUIScrollingTabBarController *)self _updateNavigationBarsForVerticalLayoutChange];
  [(SUUIScrollingTabBarController *)self _updateFocusedViewControllerInsetsForVerticalLayoutChange];
}

- (void)observedScrollViewWillBeginDragging:(id)a3
{
  self->_focusedScrollViewIsDragging = 1;
  [a3 contentOffset];
  [(SUUIDynamicBarAnimator *)self->_dynamicBarAnimator beginDraggingWithOffset:v4];
  self->_shouldShowBarsAfterDraggingDownward = [(SUUIScrollingTabBarController *)self _focusedContentScrollViewIsScrolledToOrPastBottom];
}

- (void)observedScrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint)a5
{
  if (self->_focusedScrollViewIsDragging)
  {
    self->_focusedScrollViewIsDragging = 0;
    -[SUUIDynamicBarAnimator endDraggingWithTargetOffset:velocity:](self->_dynamicBarAnimator, "endDraggingWithTargetOffset:velocity:", a3, a5.y, a4.y * 1000.0, a5.x);
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (self->_contentCollectionView == a3) {
    return [(NSArray *)self->_viewControllers count];
  }
  else {
    return 0;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  double v6 = (SUUIScrollingTabBarContentCollectionView *)a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (self->_contentCollectionView == v6)
  {
    ++self->_referenceCountForIgnoringContentOffsetUpdateRequests;
    double v10 = -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", [v7 item]);
    double v11 = [(NSMapTable *)self->_viewControllerToItemContext objectForKey:v10];
    uint64_t v12 = [v11 collectionViewCell];
    if (v12)
    {
      double v13 = (void *)v12;
      id v14 = [(SUUIScrollingTabBarContentCollectionView *)v6 layoutAttributesForItemAtIndexPath:v8];
      objc_super v15 = (void *)MEMORY[0x263F82E00];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __71__SUUIScrollingTabBarController_collectionView_cellForItemAtIndexPath___block_invoke;
      v23[3] = &unk_265400958;
      v24 = v6;
      id v25 = v14;
      id v9 = v13;
      id v26 = v9;
      id v16 = v14;
      [v15 performWithoutAnimation:v23];
    }
    else
    {
      id v9 = [(SUUIScrollingTabBarContentCollectionView *)v6 dequeueReusableCellWithReuseIdentifier:0x2704FB0D0 forIndexPath:v8];
      [v11 setCollectionViewCell:v9];
    }
    id v17 = (id)[v10 view];
    if ([v11 viewControllerIsNavigationController])
    {
      double v18 = [v10 viewControllers];
      BOOL v19 = [v18 firstObject];

      id v20 = (id)[v19 view];
    }
    [(SUUIScrollingTabBarController *)self _viewControllerContentScrollViewContentInsetDescriptor];
    [v11 applyNewContentInsetDescriptor:&v22];
    [v9 setManagesViewControllerContainerViewLayout:0];
    [v9 setViewController:v10];
    --self->_referenceCountForIgnoringContentOffsetUpdateRequests;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __71__SUUIScrollingTabBarController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyLayoutAttributes:*(void *)(a1 + 40) toView:*(void *)(a1 + 48)];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a4;
  [a3 bounds];
  double v9 = v8;
  double v11 = v10;
  viewControllerToItemContext = self->_viewControllerToItemContext;
  double v13 = [v7 viewController];
  id v14 = [(NSMapTable *)viewControllerToItemContext objectForKey:v13];

  objc_msgSend(v14, "prepareViewControllerForDisplayWithSize:", v9, v11);
  objc_super v15 = (void *)MEMORY[0x263F82E00];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  double v21 = __83__SUUIScrollingTabBarController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
  uint64_t v22 = &unk_265400890;
  id v23 = self;
  id v16 = v7;
  id v24 = v16;
  [v15 performWithoutAnimation:&v19];
  id v17 = [(SUUIScrollingTabBarController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v18 = [v16 viewController];
    [v17 tabBarController:self willDisplayViewController:v18];
  }
}

uint64_t __83__SUUIScrollingTabBarController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLayoutOfCollectionViewCell:*(void *)(a1 + 40)];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  objc_msgSend(a4, "viewController", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  double v6 = -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:");
  objc_msgSend(v6, "notifyOfUpdatedAppearanceStatus:", 0, 0);
  id v7 = [(SUUIScrollingTabBarController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 tabBarController:self didEndDisplayingViewController:v8];
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  if (self->_contentCollectionView == a3)
  {
    double width = self->_contentCollectionViewItemSize.width;
    double height = self->_contentCollectionViewItemSize.height;
    double v10 = -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", [a5 item]);
    double v11 = [(NSMapTable *)self->_viewControllerToItemContext objectForKey:v10];
    [v11 nestedPagingScrollViewContentWidth];
    double v13 = v12;
    if ([v10 isViewLoaded])
    {
      id v14 = [v10 view];
      [v14 bounds];
      double v15 = CGRectGetWidth(v21);

      if (v15 > 0.00000011920929)
      {
        UIRoundToViewScale();
        double v13 = v16;
      }
    }
    if (v13 <= width) {
      double v17 = width;
    }
    else {
      double v17 = v13;
    }
    if (v17 >= 2.0) {
      double v5 = v17;
    }
    else {
      double v5 = 2.0;
    }
    if (height >= 2.0) {
      double v6 = height;
    }
    else {
      double v6 = 2.0;
    }
  }
  else
  {
    double v5 = *MEMORY[0x263F001B0];
    double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v18 = v5;
  double v19 = v6;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectForKey:@"_SUUIScrollingTabStateRestorationSelectedViewController"];
  if (v5)
  {
    double v6 = [(SUUIScrollingTabBarController *)self allViewControllers];
    int v7 = [v6 containsObject:v5];

    if (v7) {
      [(SUUIScrollingTabBarController *)self setSelectedViewController:v5];
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)SUUIScrollingTabBarController;
  [(SUUIScrollingTabBarController *)&v8 decodeRestorableStateWithCoder:v4];
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUIScrollingTabBarController *)self selectedViewController];
  if (v5)
  {
    [v4 encodeObject:v5 forKey:@"_SUUIScrollingTabStateRestorationSelectedViewController"];
  }
  else
  {
    double v6 = [MEMORY[0x263F82438] sharedApplication];
    [v6 ignoreSnapshotOnNextApplicationLaunch];
  }
  v7.receiver = self;
  v7.super_class = (Class)SUUIScrollingTabBarController;
  [(SUUIScrollingTabBarController *)&v7 encodeRestorableStateWithCoder:v4];
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SUUIScrollingTabBarController;
  id v4 = a3;
  [(SUUIScrollingTabBarController *)&v11 traitCollectionDidChange:v4];
  objc_msgSend(v4, "displayScale", v11.receiver, v11.super_class);
  double v6 = v5;

  objc_super v7 = [(SUUIScrollingTabBarController *)self traitCollection];
  [v7 displayScale];
  double v9 = vabdd_f64(v6, v8);

  if (v9 > 0.00000011920929)
  {
    if ([(SUUIScrollingTabBarController *)self isViewLoaded])
    {
      double v10 = [(SUUIScrollingTabBarController *)self view];
      [v10 setNeedsLayout];
    }
  }
}

- (double)contentViewControllerBottomInsetAdjustment
{
  [(SUUIScrollingTabBarController *)self _viewControllerContentScrollViewContentInsetDescriptor];
  [(SUUIScrollingTabBarController *)self _effectiveBottomBarOffset];
  return 0.0 - v3;
}

- (unint64_t)selectedIndex
{
  if (self->_transientViewController) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v4 = [(SUUIScrollingTabBarController *)self viewControllers];
  double v5 = [(SUUIScrollingTabBarController *)self selectedViewController];
  unint64_t v6 = [v4 indexOfObject:v5];

  return v6;
}

- (UIViewController)selectedViewController
{
  return self->_topLevelFocusedViewController;
}

- (void)setAdditionalTabBarButtonsContainerPositionOffset:(UIOffset)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  -[SUUIScrollingTabBarController _roundedOffsetFromOffset:](self, "_roundedOffsetFromOffset:", a3.horizontal, a3.vertical);
  p_additionalTabBarButtonsContainerPositionOffset = &self->_additionalTabBarButtonsContainerPositionOffset;
  if (self->_additionalTabBarButtonsContainerPositionOffset.horizontal != v4
    || self->_additionalTabBarButtonsContainerPositionOffset.vertical != v5)
  {
    UIOffset v12 = *p_additionalTabBarButtonsContainerPositionOffset;
    p_additionalTabBarButtonsContainerPositionOffset->horizontal = v4;
    self->_additionalTabBarButtonsContainerPositionOffset.vertical = v5;
    if ([(SUUIScrollingTabBarController *)self isViewLoaded])
    {
      if (self->_additionalPositionOffsetsAtomicUpdateRequestCount)
      {
        if (!self->_additionalPositionOffsetsUpdateRecord.didUpdateAdditionalTabBarButtonsContainerPositionOffset)
        {
          self->_additionalPositionOffsetsUpdateRecord.didUpdateAdditionalTabBarButtonsContainerPositionOffset = 1;
          self->_additionalPositionOffsetsUpdateRecord.oldAdditionalTabBarButtonsContainerPositionOffset = v12;
        }
      }
      else
      {
        *(_DWORD *)&v14[3] = 0;
        *(_DWORD *)id v14 = 0;
        *(_DWORD *)&v13[3] = 0;
        *(_DWORD *)double v13 = 0;
        *(UIOffset *)&v14[7] = v12;
        *(_OWORD *)&v13[7] = *MEMORY[0x263F838D8];
        char v8 = 1;
        *(_OWORD *)double v9 = *(_OWORD *)v14;
        *(CGFloat *)&v9[15] = v12.vertical;
        char v10 = 0;
        *(_OWORD *)objc_super v11 = *(_OWORD *)v13;
        *(void *)&v11[15] = *(void *)&v13[15];
        [(SUUIScrollingTabBarController *)self _updateAdditionalPositionOffsetsWithUpdateRecord:&v8];
      }
    }
  }
}

- (void)setAdditionalTabBarPalettePositionOffset:(UIOffset)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  -[SUUIScrollingTabBarController _roundedOffsetFromOffset:](self, "_roundedOffsetFromOffset:", a3.horizontal, a3.vertical);
  p_additionalTabBarPalettePositionOffset = &self->_additionalTabBarPalettePositionOffset;
  if (self->_additionalTabBarPalettePositionOffset.horizontal != v4
    || self->_additionalTabBarPalettePositionOffset.vertical != v5)
  {
    UIOffset v12 = *p_additionalTabBarPalettePositionOffset;
    p_additionalTabBarPalettePositionOffset->horizontal = v4;
    self->_additionalTabBarPalettePositionOffset.vertical = v5;
    if ([(SUUIScrollingTabBarController *)self isViewLoaded])
    {
      if (self->_additionalPositionOffsetsAtomicUpdateRequestCount)
      {
        if (!self->_additionalPositionOffsetsUpdateRecord.didUpdateAdditionalTabBarPalettePositionOffset)
        {
          self->_additionalPositionOffsetsUpdateRecord.didUpdateAdditionalTabBarPalettePositionOffset = 1;
          self->_additionalPositionOffsetsUpdateRecord.oldAdditionalTabBarPalettePositionOffset = v12;
        }
      }
      else
      {
        *(_DWORD *)&v14[3] = 0;
        *(_DWORD *)id v14 = 0;
        *(_DWORD *)&v13[3] = 0;
        *(_DWORD *)double v13 = 0;
        *(_OWORD *)&v14[7] = *MEMORY[0x263F838D8];
        *(UIOffset *)&v13[7] = v12;
        char v8 = 0;
        *(_OWORD *)double v9 = *(_OWORD *)v14;
        *(void *)&v9[15] = *(void *)&v14[15];
        char v10 = 1;
        *(_OWORD *)objc_super v11 = *(_OWORD *)v13;
        *(CGFloat *)&v11[15] = v12.vertical;
        [(SUUIScrollingTabBarController *)self _updateAdditionalPositionOffsetsWithUpdateRecord:&v8];
      }
    }
  }
}

- (void)setChargeEnabledOnTabBarButtonsContainer:(BOOL)a3
{
  if (self->_chargeEnabledOnTabBarButtonsContainer != a3)
  {
    BOOL v3 = a3;
    self->_chargeEnabledOnTabBarButtonsContainer = a3;
    if ([(SUUIScrollingTabBarController *)self isViewLoaded])
    {
      tabBar = self->_tabBar;
      [(SUUICrossFadingTabBar *)tabBar _setChargeEnabled:v3];
    }
  }
}

- (void)setScrollEnabled:(BOOL)a3
{
  if (a3) {
    int v4 = [(id)objc_opt_class() areScrollingTabsAllowed];
  }
  else {
    int v4 = 0;
  }
  if (self->_scrollEnabled != v4)
  {
    self->_scrollEnabled = v4;
    [(SUUIScrollingTabBarController *)self _updateHorizontalScrollingAvailability];
  }
}

- (void)setSelectedIndex:(unint64_t)a3
{
}

- (void)setSelectedViewController:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUIScrollingTabBarController *)self viewControllers];
  uint64_t v6 = [v5 indexOfObject:v4];

  [(SUUIScrollingTabBarController *)self setSelectedIndex:v6];
}

- (void)setTransientViewController:(id)a3
{
}

- (void)setTransientViewController:(id)a3 animated:(BOOL)a4
{
  uint64_t v6 = (UIViewController *)a3;
  p_transientViewController = &self->_transientViewController;
  transientViewController = self->_transientViewController;
  if (transientViewController != v6)
  {
    double v9 = transientViewController;
    if (v9)
    {
      long long v10 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
      long long v26 = *MEMORY[0x263F834E8];
      long long v27 = v10;
      transientViewControllerItemContext = self->_transientViewControllerItemContext;
      uint64_t v28 = 0;
      [(SUUIScrollingTabBarControllerItemContext *)transientViewControllerItemContext applyNewContentInsetDescriptor:&v26];
      UIOffset v12 = self->_transientViewControllerItemContext;
      self->_transientViewControllerItemContext = 0;

      [(UIViewController *)v9 willMoveToParentViewController:0];
      if ([(UIViewController *)v9 isViewLoaded])
      {
        double v13 = [(UIViewController *)v9 view];
        [v13 removeFromSuperview];
      }
      [(UIViewController *)v9 removeFromParentViewController];
    }
    objc_storeStrong((id *)&self->_transientViewController, a3);
    if (*p_transientViewController)
    {
      -[SUUIScrollingTabBarController addChildViewController:](self, "addChildViewController:");
      if ([(SUUIScrollingTabBarController *)self isViewLoaded])
      {
        id v14 = [(SUUIScrollingTabBarController *)self view];
        uint64_t v15 = [(UIViewController *)*p_transientViewController view];
        [v14 insertSubview:v15 belowSubview:self->_tabBarContainerView];
      }
      [(UIViewController *)*p_transientViewController didMoveToParentViewController:self];
    }
    double v16 = *p_transientViewController;
    if (v9)
    {
      if (v16)
      {
LABEL_15:
        double v17 = [[SUUIScrollingTabBarControllerItemContext alloc] initWithViewController:*p_transientViewController];
        double v18 = self->_transientViewControllerItemContext;
        self->_transientViewControllerItemContext = v17;

        id v19 = [(UIViewController *)*p_transientViewController view];
        if ([(SUUIScrollingTabBarControllerItemContext *)self->_transientViewControllerItemContext viewControllerIsNavigationController])
        {
          uint64_t v20 = [(UIViewController *)*p_transientViewController viewControllers];
          CGRect v21 = [v20 firstObject];

          id v22 = (id)[v21 view];
        }
        uint64_t v28 = 0;
        long long v26 = 0u;
        long long v27 = 0u;
        [(SUUIScrollingTabBarController *)self _viewControllerContentScrollViewContentInsetDescriptor];
        id v23 = self->_transientViewControllerItemContext;
        v24[0] = v26;
        v24[1] = v27;
        uint64_t v25 = v28;
        [(SUUIScrollingTabBarControllerItemContext *)v23 applyNewContentInsetDescriptor:v24];
        goto LABEL_18;
      }
    }
    else if (!v16)
    {
      goto LABEL_18;
    }
    [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView setHidden:v16 != 0];
    [(SUUIScrollingTabBarController *)self _updateForHorizontalLayoutChange];
    [(SUUIScrollingTabBarController *)self _updateHidesBarsOnSwipeAvailability];
    if (*p_transientViewController) {
      goto LABEL_15;
    }
LABEL_18:
    [(SUUIScrollingTabBarController *)self setNeedsStatusBarAppearanceUpdate];
  }
}

- (void)setViewControllers:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__SUUIScrollingTabBarController_setViewControllers___block_invoke;
  v5[3] = &unk_265400980;
  v5[4] = self;
  id v4 = self;
  [(SUUIScrollingTabBarController *)v4 _setViewControllers:a3 collectionViewsUpdateHandler:v5 forFinalTearDown:0];
}

uint64_t __52__SUUIScrollingTabBarController_setViewControllers___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1136) reloadData];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateScrollViewContentOffsetsToTargetContentOffsets];
}

- (UIView)tabBar
{
  return self->_tabBarContainerView;
}

- (CGRect)tabBarButtonsContainerFrame
{
  if ([(SUUIScrollingTabBarController *)self isViewLoaded])
  {
    BOOL v3 = [(SUUIScrollingTabBarController *)self view];
    [(SUUICrossFadingTabBar *)self->_tabBar bounds];
    objc_msgSend(v3, "convertRect:fromView:", self->_tabBar);
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    UIOffset v12 = [(SUUICrossFadingTabBar *)self->_tabBar traitCollection];
    [v12 displayScale];
    double v14 = v13;

    if (v14 < 0.00000011920929)
    {
      uint64_t v15 = [MEMORY[0x263F82B60] mainScreen];
      [v15 scale];
      double v14 = v16;
    }
    double v17 = v7 - 1.0 / v14;
    double v18 = v11 + 1.0 / v14;
  }
  else
  {
    double v5 = *MEMORY[0x263F001A0];
    double v17 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v9 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v18 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  double v19 = v5;
  double v20 = v9;
  result.size.double height = v18;
  result.size.double width = v20;
  result.origin.y = v17;
  result.origin.x = v19;
  return result;
}

- (CGRect)tabBarPaletteFrame
{
  if ([(SUUIScrollingTabBarPalette *)self->_tabBarPalette isAttached])
  {
    BOOL v3 = [(SUUIScrollingTabBarController *)self view];
    [(SUUIScrollingTabBarPalette *)self->_tabBarPalette bounds];
    objc_msgSend(v3, "convertRect:fromView:", self->_tabBarPalette);
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v5 = *MEMORY[0x263F001A0];
    double v7 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v9 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v11 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)existingTabBarPalette
{
  return self->_tabBarPalette;
}

- (id)tabBarPaletteWithHeight:(double)a3
{
  tabBarPalette = self->_tabBarPalette;
  if (!tabBarPalette)
  {
    double v6 = *MEMORY[0x263F001A8];
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v8 = [(SUUIScrollingTabBarController *)self view];
    [v8 bounds];
    double Width = CGRectGetWidth(v16);

    double v10 = -[SUUIScrollingTabBarPalette initWithFrame:]([SUUIScrollingTabBarPalette alloc], "initWithFrame:", v6, v7, Width, a3);
    double v11 = self->_tabBarPalette;
    self->_tabBarPalette = v10;

    double v12 = [(SUUIScrollingTabBarPalette *)self->_tabBarPalette _backgroundView];
    double v13 = [(SUUIScrollingTabBarController *)self _tabBarBackdropGroupName];
    [v12 setBackdropBarGroupName:v13];

    tabBarPalette = self->_tabBarPalette;
  }
  return tabBarPalette;
}

- (void)attachTabBarPalette:(id)a3
{
}

- (void)attachTabBarPalette:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  double v8 = (SUUIScrollingTabBarPalette *)a3;
  id v9 = a5;
  if (v8 && self->_tabBarPalette == v8)
  {
    double v10 = [(SUUIScrollingTabBarController *)self view];
    [(SUUIScrollingTabBarPalette *)self->_tabBarPalette _setAttached:1];
    [(SUUIScrollingTabBarPalette *)self->_tabBarPalette _setDelegate:self];
    [(SUUIScrollingTabBarController *)self _updateViewControllerContentScrollViewInset];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__SUUIScrollingTabBarController_attachTabBarPalette_animated_completion___block_invoke;
    aBlock[3] = &unk_265404230;
    aBlock[4] = self;
    id v11 = v10;
    id v26 = v11;
    id v27 = v9;
    double v12 = _Block_copy(aBlock);
    double v13 = v12;
    if (v6)
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __73__SUUIScrollingTabBarController_attachTabBarPalette_animated_completion___block_invoke_2;
      v22[3] = &unk_265400890;
      id v23 = v11;
      id v24 = self;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __73__SUUIScrollingTabBarController_attachTabBarPalette_animated_completion___block_invoke_3;
      v21[3] = &unk_265400980;
      v21[4] = self;
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      double v17 = __73__SUUIScrollingTabBarController_attachTabBarPalette_animated_completion___block_invoke_4;
      double v18 = &unk_265404258;
      double v19 = self;
      id v20 = v13;
      [(SUUIScrollingTabBarController *)self _animatePaletteWithSetup:v22 animations:v21 completion:&v15];
    }
    else
    {
      (*((void (**)(void *))v12 + 2))(v12);
      [(SUUIScrollingTabBarController *)self _updateTabBarBackgroundsAndHairlines];
    }
    double v14 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v15, v16, v17, v18, v19);
    [v14 postNotificationName:@"SUUIScrollingTabBarControllerPaletteWasAttached" object:self];
  }
}

uint64_t __73__SUUIScrollingTabBarController_attachTabBarPalette_animated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1256) insertSubview:*(void *)(*(void *)(a1 + 32) + 1296) belowSubview:*(void *)(*(void *)(a1 + 32) + 1248)];
  [*(id *)(a1 + 40) setNeedsLayout];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __73__SUUIScrollingTabBarController_attachTabBarPalette_animated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(*(void *)(a1 + 40) + 1296) frame];
  v8.size.double height = v2 + 5.0;
  v8.origin.y = v3 + -5.0;
  double v4 = *(void **)(*(void *)(a1 + 40) + 1296);
  CGFloat Height = CGRectGetHeight(v8);
  CGAffineTransformMakeTranslation(&v7, 0.0, Height);
  return [v4 setTransform:&v7];
}

uint64_t __73__SUUIScrollingTabBarController_attachTabBarPalette_animated_completion___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 1296);
  CGAffineTransformMakeTranslation(&v3, 0.0, 5.0);
  return [v1 setTransform:&v3];
}

uint64_t __73__SUUIScrollingTabBarController_attachTabBarPalette_animated_completion___block_invoke_4(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 1296);
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v5];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)detachTabBarPalette:(id)a3
{
}

- (void)detachTabBarPalette:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  CGRect v8 = (SUUIScrollingTabBarPalette *)a3;
  id v9 = a5;
  double v10 = v9;
  if (v8 && self->_tabBarPalette == v8)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__SUUIScrollingTabBarController_detachTabBarPalette_animated_completion___block_invoke;
    aBlock[3] = &unk_265400DC8;
    aBlock[4] = self;
    id v22 = v9;
    id v11 = _Block_copy(aBlock);
    double v12 = v11;
    if (v6)
    {
      [(SUUIScrollingTabBarPalette *)self->_tabBarPalette frame];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __73__SUUIScrollingTabBarController_detachTabBarPalette_animated_completion___block_invoke_2;
      v20[3] = &unk_265400B40;
      v20[4] = self;
      v20[5] = v13;
      v20[6] = v14;
      v20[7] = v15;
      v20[8] = v16;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __73__SUUIScrollingTabBarController_detachTabBarPalette_animated_completion___block_invoke_3;
      v18[3] = &unk_265404258;
      v18[4] = self;
      id v19 = v12;
      [(SUUIScrollingTabBarController *)self _animatePaletteWithSetup:0 animations:v20 completion:v18];
    }
    else
    {
      (*((void (**)(void *))v11 + 2))(v11);
    }
    double v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 postNotificationName:@"SUUIScrollingTabBarControllerPaletteWasDetached" object:self];
  }
}

uint64_t __73__SUUIScrollingTabBarController_detachTabBarPalette_animated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1296) _setAttached:0];
  [*(id *)(a1 + 32) _updateViewControllerContentScrollViewInset];
  [*(id *)(*(void *)(a1 + 32) + 1296) removeFromSuperview];
  [*(id *)(*(void *)(a1 + 32) + 1296) _setDelegate:0];
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(void **)(v2 + 1296);
  *(void *)(v2 + 1296) = 0;

  double v4 = [*(id *)(a1 + 32) view];
  [v4 setNeedsLayout];

  [*(id *)(a1 + 32) _updateTabBarBackgroundsAndHairlines];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

uint64_t __73__SUUIScrollingTabBarController_detachTabBarPalette_animated_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 1296);
  CGFloat Height = CGRectGetHeight(*(CGRect *)(a1 + 40));
  CGAffineTransformMakeTranslation(&v4, 0.0, Height + 5.0);
  return [v1 setTransform:&v4];
}

uint64_t __73__SUUIScrollingTabBarController_detachTabBarPalette_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1296);
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v5];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)willUpdateAdditionalTabBarComponentsPositionOffsets
{
}

- (void)didUpdateAdditionalTabBarComponentsPositionOffsets
{
  unint64_t additionalPositionOffsetsAtomicUpdateRequestCount = self->_additionalPositionOffsetsAtomicUpdateRequestCount;
  if (additionalPositionOffsetsAtomicUpdateRequestCount)
  {
    unint64_t v3 = additionalPositionOffsetsAtomicUpdateRequestCount - 1;
    self->_unint64_t additionalPositionOffsetsAtomicUpdateRequestCount = v3;
    if (!v3)
    {
      p_additionalPositionOffsetsUpdateRecord = &self->_additionalPositionOffsetsUpdateRecord;
      long long v5 = *(_OWORD *)&self->_additionalPositionOffsetsUpdateRecord.oldAdditionalTabBarButtonsContainerPositionOffset.vertical;
      v7[0] = *(_OWORD *)&self->_additionalPositionOffsetsUpdateRecord.didUpdateAdditionalTabBarButtonsContainerPositionOffset;
      v7[1] = v5;
      v7[2] = self->_additionalPositionOffsetsUpdateRecord.oldAdditionalTabBarPalettePositionOffset;
      [(SUUIScrollingTabBarController *)self _updateAdditionalPositionOffsetsWithUpdateRecord:v7];
      p_additionalPositionOffsetsUpdateRecord->didUpdateAdditionalTabBarButtonsContainerPositionOffset = 0;
      UIOffset v6 = (UIOffset)*MEMORY[0x263F838D8];
      p_additionalPositionOffsetsUpdateRecord->oldAdditionalTabBarButtonsContainerPositionOffset = (UIOffset)*MEMORY[0x263F838D8];
      p_additionalPositionOffsetsUpdateRecord->didUpdateAdditionalTabBarPalettePositionOffset = 0;
      p_additionalPositionOffsetsUpdateRecord->oldAdditionalTabBarPalettePositionOffset = v6;
    }
  }
}

- (void)updateTabBarComponentPositionOffsetsWithPresentationValues
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __91__SUUIScrollingTabBarController_updateTabBarComponentPositionOffsetsWithPresentationValues__block_invoke;
  v2[3] = &unk_265400980;
  v2[4] = self;
  [MEMORY[0x263F82E00] performWithoutAnimation:v2];
}

void __91__SUUIScrollingTabBarController_updateTabBarComponentPositionOffsetsWithPresentationValues__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1256) layer];
  id v43 = [v2 presentationLayer];

  unint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1296) layer];
  CGAffineTransform v4 = [v3 presentationLayer];

  long long v5 = [*(id *)(a1 + 32) view];
  UIOffset v6 = [v5 layer];
  CGAffineTransform v7 = [v6 presentationLayer];
  [v43 bounds];
  objc_msgSend(v7, "convertRect:fromLayer:", v43);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  uint64_t v16 = [*(id *)(a1 + 32) view];
  double v17 = [v16 layer];
  double v18 = [v17 presentationLayer];
  [v4 bounds];
  objc_msgSend(v18, "convertRect:fromLayer:", v4);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  id v27 = (void *)SUUIMPUFoundationFramework();
  uint64_t v28 = (unsigned int (*)(uint64_t, double, double))SUUIWeakLinkedSymbolForString("MPUSizeEqualToSize", v27);
  if (v28([v43 bounds], v13, v15)
    && (((uint64_t (*)(uint64_t, double, double))v28)([v4 bounds], v24, v26) & 1) != 0)
  {
    [*(id *)(a1 + 32) willUpdateAdditionalTabBarComponentsPositionOffsets];
    double v29 = *MEMORY[0x263F838D8];
    double v30 = *(double *)(MEMORY[0x263F838D8] + 8);
    objc_msgSend(*(id *)(a1 + 32), "setAdditionalTabBarButtonsContainerPositionOffset:", *MEMORY[0x263F838D8], v30);
    objc_msgSend(*(id *)(a1 + 32), "setAdditionalTabBarPalettePositionOffset:", v29, v30);
    [*(id *)(a1 + 32) didUpdateAdditionalTabBarComponentsPositionOffsets];
    CGRect v31 = [*(id *)(a1 + 32) view];
    [v31 setNeedsLayout];

    v32 = [*(id *)(a1 + 32) view];
    [v32 layoutIfNeeded];

    v33 = [*(id *)(a1 + 32) view];
    [*(id *)(*(void *)(a1 + 32) + 1256) bounds];
    objc_msgSend(v33, "convertRect:fromView:", *(void *)(*(void *)(a1 + 32) + 1256));
    double v35 = v34;
    double v37 = v36;

    CGRect v38 = [*(id *)(a1 + 32) view];
    [*(id *)(*(void *)(a1 + 32) + 1296) bounds];
    objc_msgSend(v38, "convertRect:fromView:", *(void *)(*(void *)(a1 + 32) + 1296));
    double v40 = v39;
    double v42 = v41;

    [*(id *)(a1 + 32) willUpdateAdditionalTabBarComponentsPositionOffsets];
    objc_msgSend(*(id *)(a1 + 32), "setAdditionalTabBarButtonsContainerPositionOffset:", v9 - v35, v11 - v37);
    objc_msgSend(*(id *)(a1 + 32), "setAdditionalTabBarPalettePositionOffset:", v20 - v40, v22 - v42);
    [*(id *)(a1 + 32) didUpdateAdditionalTabBarComponentsPositionOffsets];
  }
  else
  {
    NSLog(&cfstr_InvalidSizeRet.isa);
  }
}

- (void)hideBarWithTransition:(int)a3
{
  if (!self->_tabBarExplicitlyHidden)
  {
    uint64_t v3 = *(void *)&a3;
    self->_tabBarExplicitlyHidden = 1;
    [(SUUIScrollingTabBarController *)self _updateHidesBarsOnSwipeAvailability];
    long long v5 = [(SUUIScrollingTabBarController *)self view];
    [v5 layoutIfNeeded];

    [(UIView *)self->_tabBarContainerView bounds];
    double v10 = *MEMORY[0x263F838D8];
    double v11 = *(double *)(MEMORY[0x263F838D8] + 8);
    double v12 = 0.0;
    switch((int)v3)
    {
      case 1:
        double v10 = v10 - CGRectGetWidth(*(CGRect *)&v6);
        goto LABEL_6;
      case 2:
        double v10 = v10 + CGRectGetWidth(*(CGRect *)&v6);
        goto LABEL_6;
      case 6:
        goto LABEL_7;
      case 7:
        double v11 = v11 + CGRectGetHeight(*(CGRect *)&v6);
LABEL_6:
        double v12 = 1.0;
LABEL_7:
        double v13 = (void *)MEMORY[0x263F82E00];
        [(id)objc_opt_class() durationForTransition:v3];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __55__SUUIScrollingTabBarController_hideBarWithTransition___block_invoke;
        v16[3] = &unk_265404280;
        v16[4] = self;
        *(double *)&v16[5] = v10;
        *(double *)&v16[6] = v11;
        *(double *)&v16[7] = v12;
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __55__SUUIScrollingTabBarController_hideBarWithTransition___block_invoke_2;
        v15[3] = &unk_265400AC8;
        v15[4] = self;
        objc_msgSend(v13, "animateWithDuration:animations:completion:", v16, v15);
        break;
      default:
        [(UIView *)self->_tabBarContainerView setHidden:1];
        if ([(UIViewController *)self->_topLevelFocusedViewController conformsToProtocol:&unk_2706347F0])
        {
          topLevelFocusedViewController = self->_topLevelFocusedViewController;
          [(UIViewController *)topLevelFocusedViewController scrollingTabBarBottomInsetAdjustmentDidChange];
        }
        break;
    }
  }
}

uint64_t __55__SUUIScrollingTabBarController_hideBarWithTransition___block_invoke(uint64_t a1)
{
  *(_OWORD *)(*(void *)(a1 + 32) + 1264) = *(_OWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(double *)(v2 + 1264) != *MEMORY[0x263F838D8]
    || *(double *)(v2 + 1272) != *(double *)(MEMORY[0x263F838D8] + 8))
  {
    [(id)v2 _updateLayoutOfTabBar];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(double *)(a1 + 56) < 0.999999881)
  {
    objc_msgSend(*(id *)(v2 + 1256), "setAlpha:");
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t result = [*(id *)(v2 + 1304) conformsToProtocol:&unk_2706347F0];
  if (result)
  {
    long long v5 = *(void **)(*(void *)(a1 + 32) + 1304);
    return [v5 scrollingTabBarBottomInsetAdjustmentDidChange];
  }
  return result;
}

uint64_t __55__SUUIScrollingTabBarController_hideBarWithTransition___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 1256) setHidden:1];
  }
  return result;
}

- (void)showBarWithTransition:(int)a3
{
  if (self->_tabBarExplicitlyHidden)
  {
    uint64_t v3 = *(void *)&a3;
    long long v5 = [(SUUIScrollingTabBarController *)self view];
    [v5 layoutIfNeeded];

    [(UIView *)self->_tabBarContainerView bounds];
    double v10 = (UIOffset *)MEMORY[0x263F838D8];
    double v11 = *MEMORY[0x263F838D8];
    double v12 = *(double *)(MEMORY[0x263F838D8] + 8);
    double v13 = 0.0;
    switch((int)v3)
    {
      case 1:
        double v11 = v11 + CGRectGetWidth(*(CGRect *)&v6);
        goto LABEL_6;
      case 2:
        double v11 = v11 - CGRectGetWidth(*(CGRect *)&v6);
        goto LABEL_6;
      case 3:
        double v12 = v12 + CGRectGetHeight(*(CGRect *)&v6);
LABEL_6:
        double v13 = 1.0;
        goto LABEL_7;
      case 6:
LABEL_7:
        [(UIView *)self->_tabBarContainerView setHidden:0];
        self->_tabBarExplicitHidingOffset.horizontal = v11;
        self->_tabBarExplicitHidingOffset.vertical = v12;
        [(SUUIScrollingTabBarController *)self _updateLayoutOfTabBar];
        [(UIView *)self->_tabBarContainerView setAlpha:v13];
        double v14 = (void *)MEMORY[0x263F82E00];
        [(id)objc_opt_class() durationForTransition:v3];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __55__SUUIScrollingTabBarController_showBarWithTransition___block_invoke;
        v17[3] = &unk_265400980;
        v17[4] = self;
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __55__SUUIScrollingTabBarController_showBarWithTransition___block_invoke_2;
        v16[3] = &unk_265400AC8;
        v16[4] = self;
        objc_msgSend(v14, "animateWithDuration:animations:completion:", v17, v16);
        break;
      default:
        [(UIView *)self->_tabBarContainerView setHidden:0];
        self->_tabBarExplicitlyHidden = 0;
        self->_tabBarExplicitHidingOffset = *v10;
        [(SUUIScrollingTabBarController *)self _updateLayoutOfTabBar];
        [(UIView *)self->_tabBarContainerView setAlpha:1.0];
        if ([(UIViewController *)self->_topLevelFocusedViewController conformsToProtocol:&unk_2706347F0])
        {
          topLevelFocusedViewController = self->_topLevelFocusedViewController;
          [(UIViewController *)topLevelFocusedViewController scrollingTabBarBottomInsetAdjustmentDidChange];
        }
        break;
    }
  }
}

uint64_t __55__SUUIScrollingTabBarController_showBarWithTransition___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1280) = 0;
  *(_OWORD *)(*(void *)(a1 + 32) + 1264) = *MEMORY[0x263F838D8];
  [*(id *)(a1 + 32) _updateLayoutOfTabBar];
  [*(id *)(*(void *)(a1 + 32) + 1256) setAlpha:1.0];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1304) conformsToProtocol:&unk_2706347F0];
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1304);
    return [v3 scrollingTabBarBottomInsetAdjustmentDidChange];
  }
  return result;
}

uint64_t __55__SUUIScrollingTabBarController_showBarWithTransition___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _updateHidesBarsOnSwipeAvailability];
  }
  return result;
}

- (void)_tabBarButtonTapped:(id)a3
{
  id v6 = a3;
  if (self->_transientViewController) {
    [(SUUIScrollingTabBarController *)self setTransientViewController:0 animated:0];
  }
  CGAffineTransform v4 = [(SUUICrossFadingTabBar *)self->_tabBar tabBarButtons];
  uint64_t v5 = [v4 indexOfObject:v6];

  [(SUUIScrollingTabBarController *)self _selectTabAtIndex:v5 shouldFallbackToPoppingToTabRootContent:1];
}

- (id)_deepestFocusedViewControllerWithTopLevelFocusedViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_viewControllerToItemContext objectForKey:v4];
  id v6 = [v5 nestedPagingScrollView];
  CGAffineTransform v7 = v4;
  if (v6)
  {
    [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView bounds];
    double Width = CGRectGetWidth(v13);
    if (Width >= 2.0) {
      double v9 = Width;
    }
    else {
      double v9 = 2.0;
    }
    [v6 contentOffset];
    if (v10 < 0.0) {
      double v10 = 0.0;
    }
    CGAffineTransform v7 = [v5 viewControllerInNestedPagingScrollViewAtPageIndex:vcvtmd_u64_f64(v10 / v9)];
  }
  return v7;
}

- (void)_discardUndesirableLastSelectedPageIndexesWithHorizontalLayoutContext:(id *)a3
{
  if (a3->var0 != a3->var1)
  {
    viewControllers = self->_viewControllers;
    if (a3->var2 >= 0.5) {
      unint64_t var0 = a3->var0;
    }
    else {
      unint64_t var0 = a3->var1;
    }
    id v7 = [(NSArray *)viewControllers objectAtIndex:var0];
    id v6 = [(NSMapTable *)self->_viewControllerToItemContext objectForKey:v7];
    [v6 setLastSelectedPageIndex:0];
  }
}

- (double)_effectiveBottomBarOffset
{
  if (self->_tabBarExplicitlyHidden)
  {
    [(SUUIScrollingTabBarController *)self _viewControllerContentScrollViewContentInsetDescriptor];
    return 0.0;
  }
  else
  {
    dynamicBarAnimator = self->_dynamicBarAnimator;
    [(SUUIDynamicBarAnimator *)dynamicBarAnimator bottomBarOffset];
  }
  return result;
}

- (double)_effectiveTopBarHeight
{
  if (self->_tabBarExplicitlyHidden)
  {
    uint64_t v2 = [(UIViewController *)self->_focusedViewController navigationController];
    uint64_t v3 = [v2 navigationBar];
    [v3 bounds];
    double Height = CGRectGetHeight(v8);

    return Height;
  }
  else
  {
    dynamicBarAnimator = self->_dynamicBarAnimator;
    [(SUUIDynamicBarAnimator *)dynamicBarAnimator topBarHeight];
  }
  return result;
}

- (BOOL)_focusedContentScrollViewIsScrolledToOrPastBottom
{
  [(UIScrollView *)self->_focusedContentScrollView contentSize];
  double v4 = v3;
  [(UIScrollView *)self->_focusedContentScrollView contentInset];
  double v6 = v5;
  [(UIScrollView *)self->_focusedContentScrollView bounds];
  return CGRectGetMaxY(v8) >= v4 + v6;
}

- (void)_invalidateContentCollectionViewLayoutForUpdatedContentSizeWithHorizontalLayoutContext:(id *)a3 indexOfViewControllerWithUpdatedContentSize:(unint64_t)a4
{
  uint64_t v7 = [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView collectionViewLayout];
  double v8 = *(double *)(MEMORY[0x263F00148] + 8);
  BOOL v9 = a3->var0 != a4 || a3->var0 == a3->var1;
  id v20 = (id)v7;
  if (v9)
  {
    double v17 = *MEMORY[0x263F00148];
  }
  else
  {
    double v10 = [MEMORY[0x263F088C8] indexPathForItem:a4 inSection:0];
    double v11 = [v20 layoutAttributesForItemAtIndexPath:v10];
    [v11 frame];
    double Width = CGRectGetWidth(v22);

    viewControllerToItemContext = self->_viewControllerToItemContext;
    double v14 = [(NSArray *)self->_viewControllers objectAtIndex:a4];
    double v15 = [(NSMapTable *)viewControllerToItemContext objectForKey:v14];

    [v15 nestedPagingScrollViewContentWidth];
    double v17 = v16 - Width;
  }
  id v18 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
  [v18 setInvalidateFlowLayoutDelegateMetrics:1];
  objc_msgSend(v18, "setContentOffsetAdjustment:", v17, v8);
  double v19 = [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView collectionViewLayout];
  [v19 invalidateLayoutWithContext:v18];
}

- (void)_notifyViewControllerAppearanceProgressUpdateWithHorizontalLayoutContext:(id *)a3
{
  unint64_t var0 = a3->var0;
  unint64_t var1 = a3->var1;
  double v8 = 1.0 - a3->var2;
  BOOL v10 = v8 < 0.999999881 && var1 == var0;
  -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  double v11 = -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:");
  objc_msgSend(v11, "notifyOfUpdatedAppearanceStatus:", *(void *)&v8, v10);
  if (a3->var1 != a3->var0)
  {
    double var2 = a3->var2;
    CGRect v13 = -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:");
    double v14 = [(NSMapTable *)self->_viewControllerToItemContext objectForKey:v13];
    objc_msgSend(v14, "notifyOfUpdatedAppearanceStatus:", *(void *)&var2, 0);
  }
}

- (id)_parentCellForViewController:(id)a3
{
  id v3 = a3;
  if ([v3 isViewLoaded])
  {
    double v4 = [v3 view];
    double v5 = [v4 superview];
    if (v5)
    {
      do
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v6 = [v5 superview];

        double v5 = (void *)v6;
      }
      while (v6);
    }
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)_animatePaletteWithSetup:(id)a3 animations:(id)a4 completion:(id)a5
{
  double v8 = (void (**)(void))a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t activePaletteTransitions = self->_activePaletteTransitions;
  if (!activePaletteTransitions)
  {
    [(SUUIScrollingTabBarPalette *)self->_tabBarPalette bounds];
    double v16 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v14, v13 + -5.0, v15, v12 + 5.0);
    [v16 setClipsToBounds:1];
    [v16 addSubview:self->_tabBarPalette];
    double v17 = [(SUUIScrollingTabBarPalette *)self->_tabBarPalette layer];
    [v17 setValue:v16 forKey:@"SUUIScrollingTabBarPaletteClippingView"];

    [(UIView *)self->_tabBarContainerView insertSubview:v16 belowSubview:self->_tabBar];
    [(SUUIScrollingTabBarPalette *)self->_tabBarPalette setTabBarBackgroundExtendsBehindPalette:0];
    [(SUUIScrollingTabBarController *)self _updateTabBarBackgroundsAndHairlines];
    if (v8) {
      v8[2](v8);
    }

    unint64_t activePaletteTransitions = self->_activePaletteTransitions;
  }
  self->_unint64_t activePaletteTransitions = activePaletteTransitions + 1;
  uint64_t v18 = SUUIMPUFoundationFramework();
  id v19 = SUUIWeakLinkedClassForString(&cfstr_Mpuspringanima.isa, v18);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __80__SUUIScrollingTabBarController__animatePaletteWithSetup_animations_completion___block_invoke;
  v21[3] = &unk_265404258;
  v21[4] = self;
  id v22 = v10;
  id v20 = v10;
  [v19 animateUsingSpringWithDamping:v9 mass:1024 stiffness:v21 velocity:700.0 animations:2.0 options:300.0 completion:0.0];
}

void __80__SUUIScrollingTabBarController__animatePaletteWithSetup_animations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  --*(void *)(*(void *)(a1 + 32) + 1048);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 1048))
  {
    [*(id *)(v2 + 1296) setTabBarBackgroundExtendsBehindPalette:1];
    [*(id *)(a1 + 32) _updateTabBarBackgroundsAndHairlines];
    double v5 = [*(id *)(*(void *)(a1 + 32) + 1296) layer];
    id v8 = [v5 valueForKey:@"SUUIScrollingTabBarPaletteClippingView"];

    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1296) layer];
    [v6 setValue:0 forKey:@"SUUIScrollingTabBarPaletteClippingView"];

    [v8 removeFromSuperview];
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
    }
  }
}

- (void)_popVisibleNavigationStacksToRootWithHorizontalLayoutContext:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a3->var0 != a3->var1)
  {
    id v3 = [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView visibleCells];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) viewController];
          if ([v8 conformsToProtocol:&unk_270634910]) {
            [v8 popToNavigationStackRootContentAnimated:0 withBehavior:1];
          }

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (UIOffset)_roundedOffsetFromOffset:(UIOffset)a3
{
  CGFloat vertical = a3.vertical;
  CGFloat horizontal = a3.horizontal;
  if ([(SUUIScrollingTabBarController *)self isViewLoaded])
  {
    uint64_t v6 = [(SUUIScrollingTabBarController *)self view];
    UIRoundToViewScale();
    CGFloat horizontal = v7;
    UIRoundToViewScale();
    CGFloat vertical = v8;
  }
  double v9 = horizontal;
  double v10 = vertical;
  result.CGFloat vertical = v10;
  result.CGFloat horizontal = v9;
  return result;
}

- (void)_setFocusedViewController:(id)a3 showBarsIfNeeded:(BOOL)a4 animated:(BOOL)a5 notifyDelegate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  double v10 = (UIViewController *)a3;
  id v20 = v10;
  if (v10)
  {
    long long v11 = [(SUUIScrollingTabBarController *)self _deepestFocusedViewControllerWithTopLevelFocusedViewController:v10];
  }
  else
  {
    long long v11 = 0;
  }
  p_focusedViewController = &self->_focusedViewController;
  focusedViewController = self->_focusedViewController;
  if (focusedViewController != v11)
  {
    if (self->_canHideBarsOnSwipe
      && [(UIViewController *)focusedViewController conformsToProtocol:&unk_27065D920])
    {
      [(UIViewController *)*p_focusedViewController setScrollViewDelegateObserver:0];
    }
    focusedContentScrollView = self->_focusedContentScrollView;
    if (focusedContentScrollView) {
      [(UIScrollView *)focusedContentScrollView removeObserver:self forKeyPath:@"contentSize" context:_SUUIScrollingTabFocusedContentScrollViewContentSizeObservationContext];
    }
    topLevelFocusedViewController = self->_topLevelFocusedViewController;
    if (topLevelFocusedViewController != v20) {
      objc_storeStrong((id *)&self->_topLevelFocusedViewController, a3);
    }
    objc_storeStrong((id *)&self->_focusedViewController, v11);
    double v16 = [(UIViewController *)v11 contentScrollView];
    double v17 = self->_focusedContentScrollView;
    self->_focusedContentScrollView = v16;

    uint64_t v18 = self->_focusedContentScrollView;
    if (v18) {
      [(UIScrollView *)v18 addObserver:self forKeyPath:@"contentSize" options:0 context:_SUUIScrollingTabFocusedContentScrollViewContentSizeObservationContext];
    }
    if (self->_canHideBarsOnSwipe
      && [(UIViewController *)*p_focusedViewController conformsToProtocol:&unk_27065D920])
    {
      [(UIViewController *)*p_focusedViewController setScrollViewDelegateObserver:self];
    }
    if (v7) {
      [(SUUIDynamicBarAnimator *)self->_dynamicBarAnimator attemptTransitionToState:1 animated:1];
    }
    [(SUUIScrollingTabBarController *)self _updateHidesBarsOnSwipeAvailability];
    [(SUUIScrollingTabBarController *)self _updateHorizontalScrollingAvailability];
    if (topLevelFocusedViewController != v20)
    {
      [(SUUIScrollingTabBarController *)self setNeedsStatusBarAppearanceUpdate];
      if (v6)
      {
        id v19 = [(SUUIScrollingTabBarController *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v19 tabBarController:self didSelectViewController:self->_topLevelFocusedViewController];
        }
      }
    }
  }
}

- (void)_selectTabAtIndex:(unint64_t)a3 shouldFallbackToPoppingToTabRootContent:(BOOL)a4
{
  BOOL v4 = a4;
  contentCollectionView = self->_contentCollectionView;
  double v8 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
  id v37 = [(SUUIScrollingTabBarContentCollectionView *)contentCollectionView layoutAttributesForItemAtIndexPath:v8];

  [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView contentOffset];
  double v10 = v9;
  double v12 = v11;
  [v37 frame];
  double MinX = CGRectGetMinX(v39);
  uint64_t v14 = [(NSArray *)self->_viewControllers objectAtIndex:a3];
  double v15 = [(NSMapTable *)self->_viewControllerToItemContext objectForKey:v14];
  [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView bounds];
  double Width = CGRectGetWidth(v40);
  double v17 = MinX + Width * (double)(unint64_t)[v15 lastSelectedPageIndex];
  uint64_t v18 = [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView collectionViewLayout];
  objc_msgSend(v18, "targetContentOffsetForProposedContentOffset:", v17, v12);
  double v20 = v19;
  double v22 = v21;

  if (vabdd_f64(v20, v10) > 0.00000011920929)
  {
    double v23 = self->_contentCollectionView;
    double v24 = v20;
    double v25 = v22;
    uint64_t v26 = 0;
LABEL_13:
    -[SUUIScrollingTabBarContentCollectionView setContentOffset:animated:](v23, "setContentOffset:animated:", v26, v24, v25);
    goto LABEL_14;
  }
  if (!v4) {
    goto LABEL_14;
  }
  if ([(UIViewController *)self->_topLevelFocusedViewController conformsToProtocol:&unk_270634910])
  {
    id v27 = self->_topLevelFocusedViewController;
    if (([(UIViewController *)v27 isShowingNavigationStackRootContent] & 1) == 0)
    {
      uint64_t v28 = [(SUUIScrollingTabBarController *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        double v29 = [(SUUIScrollingTabBarController *)self delegate];
        int v30 = [v29 tabBarController:self shouldFallbackToRootForController:v14];

        if (v30)
        {
          [(UIViewController *)v27 popToNavigationStackRootContentAnimated:1 withBehavior:0];

          goto LABEL_14;
        }
      }
      else
      {
      }
    }
  }
  if ([v15 lastSelectedPageIndex])
  {
    [v37 frame];
    double v31 = CGRectGetMinX(v41);
    v32 = [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView collectionViewLayout];
    objc_msgSend(v32, "targetContentOffsetForProposedContentOffset:", v31, v22);
    double v34 = v33;
    double v36 = v35;

    double v23 = self->_contentCollectionView;
    double v24 = v34;
    double v25 = v36;
    uint64_t v26 = 1;
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_setViewControllers:(id)a3 collectionViewsUpdateHandler:(id)a4 forFinalTearDown:(BOOL)a5
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  double v8 = (NSArray *)a3;
  double v9 = (void (**)(void))a4;
  viewControllers = self->_viewControllers;
  if (viewControllers == v8 || [(NSArray *)viewControllers isEqualToArray:v8]) {
    goto LABEL_74;
  }
  BOOL v63 = a5;
  v67 = v9;
  v65 = self->_transientViewController;
  if (v65) {
    [(SUUIScrollingTabBarController *)self setTransientViewController:0 animated:0];
  }
  v64 = self->_topLevelFocusedViewController;
  unint64_t v62 = [(SUUIScrollingTabBarController *)self selectedIndex];
  double v11 = (void *)[(NSArray *)self->_viewControllers copy];
  v66 = v8;
  double v12 = (NSArray *)[(NSArray *)v8 copy];
  double v13 = self->_viewControllers;
  self->_viewControllers = v12;

  ++self->_referenceCountForIgnoringContentOffsetUpdateRequests;
  v70 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v85 objects:v92 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v86;
    uint64_t v18 = (_OWORD *)MEMORY[0x263F834E8];
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v86 != v17) {
          objc_enumerationMutation(v14);
        }
        double v20 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        if (![(NSArray *)self->_viewControllers containsObject:v20])
        {
          double v21 = [v20 parentViewController];

          if (v21 == self)
          {
            [v70 addObject:v20];
            [v20 willMoveToParentViewController:0];
          }
          double v22 = [(NSMapTable *)self->_viewControllerToItemContext objectForKey:v20];
          [v22 prepareViewControllerForTearDown];
          long long v23 = v18[1];
          v83[0] = *v18;
          v83[1] = v23;
          uint64_t v84 = 0;
          [v22 applyNewContentInsetDescriptor:v83];
          double v24 = [(SUUIScrollingTabBarController *)self _parentCellForViewController:v20];
          [v24 setViewController:0];
          [(NSMapTable *)self->_viewControllerToItemContext removeObjectForKey:v20];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v85 objects:v92 count:16];
    }
    while (v16);
  }

  --self->_referenceCountForIgnoringContentOffsetUpdateRequests;
  NSUInteger v68 = [(NSArray *)self->_viewControllers count];
  double v25 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v68];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v26 = self->_viewControllers;
  uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v79 objects:v91 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v80;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v80 != v29) {
          objc_enumerationMutation(v26);
        }
        double v31 = *(void **)(*((void *)&v79 + 1) + 8 * j);
        if (([v14 containsObject:v31] & 1) == 0)
        {
          [v25 addObject:v31];
          if ([v31 conformsToProtocol:&unk_2705E11B8])
          {
            v32 = [(SUUIViewController *)self clientContext];
            [v31 setClientContext:v32];
          }
          [(SUUIScrollingTabBarController *)self addChildViewController:v31];
          double v33 = [[SUUIScrollingTabBarControllerItemContext alloc] initWithViewController:v31];
          [(SUUIScrollingTabBarControllerItemContext *)v33 setDelegate:self];
          viewControllerToItemContext = self->_viewControllerToItemContext;
          if (!viewControllerToItemContext)
          {
            double v35 = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:v68];
            double v36 = self->_viewControllerToItemContext;
            self->_viewControllerToItemContext = v35;

            viewControllerToItemContext = self->_viewControllerToItemContext;
          }
          [(NSMapTable *)viewControllerToItemContext setObject:v33 forKey:v31];
        }
      }
      uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v79 objects:v91 count:16];
    }
    while (v28);
  }

  if (v67) {
    v67[2]();
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v37 = v25;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v75 objects:v90 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v76;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v76 != v40) {
          objc_enumerationMutation(v37);
        }
        [*(id *)(*((void *)&v75 + 1) + 8 * k) didMoveToParentViewController:self];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v75 objects:v90 count:16];
    }
    while (v39);
  }
  id v69 = v37;

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v42 = v70;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v71 objects:v89 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v72;
    do
    {
      for (uint64_t m = 0; m != v44; ++m)
      {
        if (*(void *)v72 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v71 + 1) + 8 * m);
        [v47 removeFromParentViewController];
        v48 = [(SUUIScrollingTabBarController *)self _deepestFocusedViewControllerWithTopLevelFocusedViewController:v47];
        focusedViewController = self->_focusedViewController;

        if (v48 == focusedViewController) {
          [(SUUIScrollingTabBarController *)self _setFocusedViewController:0 showBarsIfNeeded:1 animated:0 notifyDelegate:0];
        }
        if ([v47 conformsToProtocol:&unk_2705E11B8]) {
          [v47 setClientContext:0];
        }
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v71 objects:v89 count:16];
    }
    while (v44);
  }

  if (v63 || ![(SUUIScrollingTabBarController *)self isViewLoaded])
  {
    v50 = v64;
    v51 = v69;
    if (!v64) {
      goto LABEL_71;
    }
  }
  else
  {
    [(SUUIScrollingTabBarController *)self _updateTabBarButtons];
    v50 = v64;
    if (!v64)
    {
      [(SUUIScrollingTabBarController *)self _updateForHorizontalLayoutChange];
      v51 = v69;
      goto LABEL_71;
    }
    [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView setNeedsLayout];
    v51 = v69;
  }
  NSUInteger v52 = [(NSArray *)self->_viewControllers indexOfObject:v50];
  if (v52 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v56 = v52;
    [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView bounds];
    double Width = CGRectGetWidth(v94);
    unint64_t v58 = v62;
    if (Width > 0.00000011920929)
    {
      [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView contentSize];
      double v60 = v59;
      [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView contentOffset];
      if (v61 < 0.0) {
        double v61 = 0.0;
      }
      if (v61 >= v60 - Width) {
        double v61 = v60 - Width;
      }
      unint64_t v58 = vcvtad_u64_f64(v61 / Width);
    }
    if (v58 == v56) {
      goto LABEL_71;
    }
    v54 = self;
    unint64_t v55 = v56;
    goto LABEL_69;
  }
  if (v62 >= [(NSArray *)self->_viewControllers count]) {
    unint64_t v53 = 0;
  }
  else {
    unint64_t v53 = v62;
  }
  if (v53 < [(NSArray *)self->_viewControllers count]
    && v53 != [(SUUIScrollingTabBarController *)self selectedIndex])
  {
    v54 = self;
    unint64_t v55 = v53;
LABEL_69:
    [(SUUIScrollingTabBarController *)v54 setSelectedIndex:v55];
  }
LABEL_71:
  if (v65) {
    [(SUUIScrollingTabBarController *)self setTransientViewController:v65 animated:0];
  }

  double v8 = v66;
  double v9 = v67;
LABEL_74:
}

- (id)_tabBarBackdropGroupName
{
  id v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  BOOL v6 = [v3 stringWithFormat:@"<%@: %p> Backdrop Group", v5, self];

  return v6;
}

- (void)_updateAdditionalPositionOffsetsWithUpdateRecord:(id *)a3
{
  if (!self->_tabBarExplicitlyHidden)
  {
    BOOL var0 = a3->var0;
    BOOL var2 = a3->var2;
    double horizontal = a3->var1.horizontal;
    double vertical = a3->var1.vertical;
    double v9 = a3->var3.horizontal;
    double v8 = a3->var3.vertical;
    if (a3->var0)
    {
      [(UIView *)self->_tabBarContainerView center];
      -[UIView setCenter:](self->_tabBarContainerView, "setCenter:", v10 - horizontal + self->_additionalTabBarButtonsContainerPositionOffset.horizontal, v11 - vertical + self->_additionalTabBarButtonsContainerPositionOffset.vertical);
    }
    else if (!a3->var2)
    {
      return;
    }
    if ([(SUUIScrollingTabBarPalette *)self->_tabBarPalette isAttached])
    {
      [(SUUIScrollingTabBarPalette *)self->_tabBarPalette center];
      if (var0)
      {
        double v12 = horizontal + v12 - self->_additionalTabBarButtonsContainerPositionOffset.horizontal;
        double v13 = vertical + v13 - self->_additionalTabBarButtonsContainerPositionOffset.vertical;
      }
      if (var2)
      {
        double v12 = v12 - v9 + self->_additionalTabBarPalettePositionOffset.horizontal;
        double v13 = v13 - v8 + self->_additionalTabBarPalettePositionOffset.vertical;
      }
      tabBarPalette = self->_tabBarPalette;
      -[SUUIScrollingTabBarPalette setCenter:](tabBarPalette, "setCenter:", v12, v13);
    }
  }
}

- (void)_updateDynamicBarGeometry
{
  id v3 = [(UIViewController *)self->_focusedViewController navigationController];
  BOOL v4 = [v3 navigationBar];
  [v4 bounds];
  double Height = CGRectGetHeight(v20);

  BOOL v6 = [MEMORY[0x263F82438] sharedApplication];
  [v6 statusBarFrame];
  double v7 = CGRectGetHeight(v21);

  [(SUUIDynamicBarAnimator *)self->_dynamicBarAnimator setTopBarHeight:1 forState:Height];
  [(SUUIDynamicBarAnimator *)self->_dynamicBarAnimator setTopBarHeight:0 forState:-1.0 - v7];
  [(SUUIDynamicBarAnimator *)self->_dynamicBarAnimator setBottomBarOffset:1 forState:0.0];
  [(SUUIDynamicBarAnimator *)self->_dynamicBarAnimator setBottomBarOffset:0 forState:49.0];
  [(UIScrollView *)self->_focusedContentScrollView bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(UIScrollView *)self->_focusedContentScrollView contentInset];
  double v17 = Height - v16;
  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.double width = v13;
  v22.size.double height = v15;
  [(SUUIDynamicBarAnimator *)self->_dynamicBarAnimator setMinimumTopBarHeight:v17 - CGRectGetMinY(v22)];
  dynamicBarAnimator = self->_dynamicBarAnimator;
  [(SUUIDynamicBarAnimator *)dynamicBarAnimator setMaximumBottomBarOffset:1.79769313e308];
}

- (void)_updateFocusedViewControllerInsetsForVerticalLayoutChange
{
  id v3 = [(SUUIScrollingTabBarController *)self view];
  BOOL v4 = [(UIViewController *)self->_focusedViewController navigationController];
  uint64_t v5 = [v4 navigationBar];

  [(SUUIScrollingTabBarController *)self _viewControllerContentScrollViewContentInsetDescriptor];
  [v5 bounds];
  objc_msgSend(v3, "convertRect:fromView:", v5);
  double MaxY = CGRectGetMaxY(v7);
  [(SUUIScrollingTabBarController *)self _effectiveBottomBarOffset];
  [(UIScrollView *)self->_focusedContentScrollView contentInset];
  [(UIScrollView *)self->_focusedContentScrollView setContentInset:MaxY];
  [(UIScrollView *)self->_focusedContentScrollView scrollIndicatorInsets];
  [(UIScrollView *)self->_focusedContentScrollView setScrollIndicatorInsets:MaxY];
}

- (void)_updateFocusedViewControllerWithHorizontalLayoutContext:(id *)a3
{
  double var2 = a3->var2;
  if (var2 == (double)a3->var1 || var2 <= 0.5) {
    unint64_t var0 = a3->var0;
  }
  else {
    unint64_t var0 = a3->var1;
  }
  id v7 = [(NSArray *)self->_viewControllers objectAtIndex:var0];
  [(SUUIScrollingTabBarController *)self _setFocusedViewController:v7 showBarsIfNeeded:1 animated:1 notifyDelegate:1];
}

- (void)_updateForHorizontalLayoutChange
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView bounds];
  double x = v42.origin.x;
  double y = v42.origin.y;
  double width = v42.size.width;
  double height = v42.size.height;
  double v7 = CGRectGetWidth(v42);
  if (v7 >= 2.0) {
    double v8 = v7;
  }
  else {
    double v8 = 2.0;
  }
  CGFloat v9 = [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView collectionViewLayout];
  double v10 = objc_msgSend(v9, "layoutAttributesForElementsInRect:", x, y, width, height);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * i) frame];
        v49.origin.double x = v18;
        v49.origin.double y = v19;
        v49.size.double width = v20;
        v49.size.double height = v21;
        v43.origin.double x = x;
        v43.origin.double y = y;
        v43.size.double width = width;
        v43.size.double height = height;
        if (!CGRectIntersectsRect(v43, v49))
        {
          if (!v14) {
            id v14 = objc_alloc_init(MEMORY[0x263F089C8]);
          }
          [v14 addIndex:v15 + i];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
      v15 += i;
    }
    while (v13);
  }
  else
  {
    id v14 = 0;
  }

  if ([v14 count])
  {
    CGRect v22 = (void *)[v11 mutableCopy];
    [v22 removeObjectsAtIndexes:v14];

    id v11 = v22;
  }
  long long v23 = [v11 sortedArrayUsingComparator:&__block_literal_global_162];

  if ([v23 count])
  {
    double v24 = [v23 firstObject];
    double v25 = [v24 indexPath];
    uint64_t v26 = [v25 item];

    uint64_t v27 = [v23 lastObject];
    uint64_t v28 = [v27 indexPath];
    uint64_t v29 = [v28 item];

    if (v29 == v26 + 1)
    {
      [v27 frame];
      v50.origin.double x = x;
      v50.origin.double y = y;
      v50.size.double width = width;
      v50.size.double height = height;
      CGRect v45 = CGRectIntersection(v44, v50);
      double v30 = CGRectGetWidth(v45) / v8;
    }
    else
    {
      [v24 frame];
      v51.origin.double x = x;
      v51.origin.double y = y;
      v51.size.double width = width;
      v51.size.double height = height;
      CGRect v47 = CGRectIntersection(v46, v51);
      double v31 = CGRectGetWidth(v47);
      v48.origin.double x = x;
      v48.origin.double y = y;
      v48.size.double width = width;
      v48.size.double height = height;
      double v30 = 1.0 - v31 / CGRectGetWidth(v48);
    }
    if (v30 < 0.0) {
      double v30 = 0.0;
    }
    double v32 = fmin(v30, 1.0);
    if (self->_indexOfViewControllerWithUpdatedContentSize == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v33 = v26;
      uint64_t v34 = v29;
      double v35 = v32;
      [(SUUIScrollingTabBarController *)self _popVisibleNavigationStacksToRootWithHorizontalLayoutContext:&v33];
      [(SUUIScrollingTabBarController *)self _updateLayoutOfVisibleCollectionViewCells];
      uint64_t v33 = v26;
      uint64_t v34 = v29;
      double v35 = v32;
      [(SUUIScrollingTabBarController *)self _updateTabBarButtonsSelectionProgressWithHorizontalLayoutContext:&v33];
      uint64_t v33 = v26;
      uint64_t v34 = v29;
      double v35 = v32;
      [(SUUIScrollingTabBarController *)self _updateFocusedViewControllerWithHorizontalLayoutContext:&v33];
      uint64_t v33 = v26;
      uint64_t v34 = v29;
      double v35 = v32;
      [(SUUIScrollingTabBarController *)self _discardUndesirableLastSelectedPageIndexesWithHorizontalLayoutContext:&v33];
      uint64_t v33 = v26;
      uint64_t v34 = v29;
      double v35 = v32;
      [(SUUIScrollingTabBarController *)self _notifyViewControllerAppearanceProgressUpdateWithHorizontalLayoutContext:&v33];
    }
    else
    {
      uint64_t v33 = v26;
      uint64_t v34 = v29;
      double v35 = v32;
      -[SUUIScrollingTabBarController _invalidateContentCollectionViewLayoutForUpdatedContentSizeWithHorizontalLayoutContext:indexOfViewControllerWithUpdatedContentSize:](self, "_invalidateContentCollectionViewLayoutForUpdatedContentSizeWithHorizontalLayoutContext:indexOfViewControllerWithUpdatedContentSize:", &v33);
      self->_indexOfViewControllerWithUpdatedContentSize = 0x7FFFFFFFFFFFFFFFLL;
      [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView layoutIfNeeded];
    }
  }
}

uint64_t __65__SUUIScrollingTabBarController__updateForHorizontalLayoutChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 indexPath];
  uint64_t v6 = [v5 item];

  double v7 = [v4 indexPath];

  uint64_t v8 = [v7 item];
  uint64_t v9 = -1;
  if (v6 >= v8) {
    uint64_t v9 = 1;
  }
  if (v6 == v8) {
    return 0;
  }
  else {
    return v9;
  }
}

- (void)_updateHidesBarsOnSwipeAvailability
{
  focusedContentScrollView = self->_focusedContentScrollView;
  if (!focusedContentScrollView || self->_transientViewController || self->_tabBarExplicitlyHidden)
  {
    BOOL v4 = 0;
  }
  else
  {
    [(UIScrollView *)focusedContentScrollView contentSize];
    double v8 = v7;
    uint64_t v9 = [(SUUIScrollingTabBarController *)self view];
    [v9 bounds];
    BOOL v4 = v8 > CGRectGetHeight(v11) * 1.5;
  }
  if (self->_canHideBarsOnSwipe != v4)
  {
    self->_canHideBarsOnSwipe = v4;
    if ([(UIViewController *)self->_focusedViewController conformsToProtocol:&unk_27065D920])
    {
      if (self->_canHideBarsOnSwipe) {
        uint64_t v5 = self;
      }
      else {
        uint64_t v5 = 0;
      }
      [(UIViewController *)self->_focusedViewController setScrollViewDelegateObserver:v5];
    }
    if (!self->_canHideBarsOnSwipe)
    {
      dynamicBarAnimator = self->_dynamicBarAnimator;
      [(SUUIDynamicBarAnimator *)dynamicBarAnimator attemptTransitionToState:1 animated:0];
    }
  }
}

- (void)_updateHorizontalScrollingAvailability
{
  if (self->_scrollEnabled)
  {
    if ([(UIViewController *)self->_topLevelFocusedViewController conformsToProtocol:&unk_270634910])uint64_t v3 = [(UIViewController *)self->_topLevelFocusedViewController isShowingNavigationStackRootContent]; {
    else
    }
      uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
  }
  contentCollectionView = self->_contentCollectionView;
  [(SUUIScrollingTabBarContentCollectionView *)contentCollectionView setScrollEnabled:v3];
}

- (void)_updateLayoutOfCollectionViewCell:(id)a3
{
  id v4 = a3;
  [v4 layoutIfNeeded];
  id v46 = [v4 viewController];
  uint64_t v5 = [v4 viewControllerContainerView];

  uint64_t v6 = [v5 superview];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView contentSize];
  double v40 = v15;
  [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView bounds];
  double Width = CGRectGetWidth(v48);
  if (Width >= 2.0) {
    double v17 = Width;
  }
  else {
    double v17 = 2.0;
  }
  [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView contentOffset];
  double v19 = v18;
  CGFloat v20 = [(NSMapTable *)self->_viewControllerToItemContext objectForKey:v46];
  CGFloat v21 = [v20 nestedPagingScrollView];
  CGRect v22 = v21;
  if (v21)
  {
    [v21 contentOffset];
    double v42 = v24;
    double v43 = v23;
    -[SUUIScrollingTabBarContentCollectionView convertRect:fromView:](self->_contentCollectionView, "convertRect:fromView:", v6, v8, v10, v12, v14);
    CGFloat v41 = v14;
    CGFloat x = v49.origin.x;
    CGFloat y = v49.origin.y;
    double v44 = v17;
    CGFloat v27 = v49.size.width;
    CGFloat height = v49.size.height;
    double v45 = v19;
    double v29 = v19 - CGRectGetMinX(v49);
    if (v29 >= 0.0) {
      double v30 = v29;
    }
    else {
      double v30 = 0.0;
    }
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.double width = v27;
    double v17 = v44;
    v50.size.CGFloat height = height;
    double v31 = CGRectGetWidth(v50) - v44;
    if (v30 >= v31) {
      double v32 = v31;
    }
    else {
      double v32 = v30;
    }
    v51.origin.CGFloat x = v8;
    v51.origin.CGFloat y = v10;
    v51.size.double width = v12;
    v51.size.CGFloat height = v41;
    double MinY = CGRectGetMinY(v51);
    v52.origin.CGFloat x = v8;
    v52.origin.CGFloat y = v10;
    v52.size.double width = v12;
    v52.size.CGFloat height = v41;
    objc_msgSend(v5, "setFrame:", v32, MinY, v44, CGRectGetHeight(v52));
    if (v43 != v32) {
      objc_msgSend(v20, "updateNestedPagingScrollViewContentOffset:", v32, v42);
    }
    unint64_t v34 = vcvtmd_u64_f64((v44 * 0.5 + v32) / v44);
    double v19 = v45;
  }
  else
  {
    objc_msgSend(v5, "setFrame:", v8, v10, v12, v14);
    unint64_t v34 = 0;
  }
  [v20 setLastSelectedPageIndex:v34];
  if ([v20 viewControllerIsNavigationController])
  {
    double v35 = [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView layer];
    char v36 = [v35 needsLayout];

    if ((v36 & 1) == 0)
    {
      long long v37 = [v46 navigationBar];
      if ([v37 conformsToProtocol:&unk_27064AC80])
      {
        id v38 = v37;
        [v38 positionOffset];
        double v39 = v19;
        if (v19 >= 0.0)
        {
          double v39 = 0.0;
          if (v19 > v40 - v17) {
            double v39 = v19 - (v40 - v17);
          }
        }
        [v38 setPositionOffset:v39];
      }
    }
  }
}

- (void)_updateLayoutOfTabBar
{
  if ([(SUUIScrollingTabBarController *)self isViewLoaded])
  {
    id v36 = [(SUUIScrollingTabBarController *)self view];
    [v36 bounds];
    double v4 = v3;
    CGFloat v6 = v5;
    double v8 = v7;
    CGFloat v10 = v9;
    BOOL v11 = [(SUUIScrollingTabBarPalette *)self->_tabBarPalette isAttached];
    double v12 = 0.0;
    if (v11)
    {
      double v13 = [v36 traitCollection];
      [v13 displayScale];
      double v15 = v14;

      if (v15 < 0.00000011920929)
      {
        uint64_t v16 = [MEMORY[0x263F82B60] mainScreen];
        [v16 scale];
        double v15 = v17;
      }
      [(SUUIScrollingTabBarPalette *)self->_tabBarPalette paletteHeight];
      double v12 = 1.0 / v15 + v18;
    }
    if (self->_tabBarExplicitlyHidden)
    {
      double horizontal = self->_tabBarExplicitHidingOffset.horizontal;
      double vertical = self->_tabBarExplicitHidingOffset.vertical;
      double v35 = 0.0;
      double v33 = vertical;
      double v34 = horizontal;
    }
    else
    {
      [(SUUIScrollingTabBarController *)self _effectiveBottomBarOffset];
      double v35 = v21;
      double horizontal = self->_additionalTabBarButtonsContainerPositionOffset.horizontal;
      double vertical = self->_additionalTabBarButtonsContainerPositionOffset.vertical;
      double v33 = self->_additionalTabBarPalettePositionOffset.vertical;
      double v34 = self->_additionalTabBarPalettePositionOffset.horizontal;
    }
    v38.origin.CGFloat x = v4;
    v38.origin.CGFloat y = v6;
    v38.size.double width = v8;
    v38.size.CGFloat height = v10;
    double MaxY = CGRectGetMaxY(v38);
    v39.origin.CGFloat x = v4;
    v39.origin.CGFloat y = v6;
    v39.size.double width = v8;
    v39.size.CGFloat height = v12 + 49.0;
    -[UIView setFrame:](self->_tabBarContainerView, "setFrame:", v4 + horizontal, vertical + v35 + MaxY - CGRectGetHeight(v39), v8, v39.size.height);
    [(UIView *)self->_tabBarContainerView bounds];
    double v27 = v23;
    double v28 = v24;
    double v29 = v25;
    CGFloat v30 = v26;
    tabBarExtendedBackgroundView = self->_tabBarExtendedBackgroundView;
    if (tabBarExtendedBackgroundView) {
      -[SUUIScrollingTabBarBackgroundView setFrame:](tabBarExtendedBackgroundView, "setFrame:", v23, v24, v25, v26);
    }
    if (v11) {
      -[SUUIScrollingTabBarPalette setFrame:](self->_tabBarPalette, "setFrame:", v34 + v27 - horizontal, v33 + v28 - vertical, v29, v12);
    }
    v40.origin.CGFloat x = v27;
    v40.origin.CGFloat y = v28;
    v40.size.double width = v29;
    v40.size.CGFloat height = v30;
    double v32 = CGRectGetMaxY(v40);
    v41.origin.CGFloat x = v27;
    v41.origin.CGFloat y = v28;
    v41.size.double width = v29;
    v41.size.CGFloat height = 49.0;
    -[SUUICrossFadingTabBar setFrame:](self->_tabBar, "setFrame:", v27, v32 - CGRectGetHeight(v41), v29, 49.0);
  }
}

- (void)_updateLayoutOfVisibleCollectionViewCells
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v3 = [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView visibleCells];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(SUUIScrollingTabBarController *)self _updateLayoutOfCollectionViewCell:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updateNavigationBarsForVerticalLayoutChange
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  double v3 = [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView visibleCells];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v24;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v3);
        }
        long long v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) viewController];
        long long v11 = [(SUUIScrollingTabBarController *)self _deepestFocusedViewControllerWithTopLevelFocusedViewController:v10];

        double v12 = [v11 navigationController];
        uint64_t v13 = [v12 navigationBar];

        if ([v13 conformsToProtocol:&unk_27064AC80])
        {
          id v14 = v13;
          [v14 positionOffset];
          double v16 = v15;
          [(SUUIScrollingTabBarController *)self _effectiveBottomBarOffset];
          double v18 = v17;
          [v14 frame];
          double v19 = v18 - CGRectGetHeight(v29);
          objc_msgSend(v14, "setPositionOffset:", v16, v19);
          if (v6)
          {
            if (vabdd_f64(v8, v19) > 0.00000011920929) {
              double v8 = 0.0;
            }
          }
          else
          {
            double v8 = v19;
          }

          char v6 = 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }
  else
  {
    double v8 = 0.0;
  }
  CGFloat v20 = [MEMORY[0x263F82438] sharedApplication];
  double v21 = [v20 statusBar];

  CGAffineTransformMakeTranslation(&v22, 0.0, v8);
  [v21 setTransform:&v22];
}

- (void)_updateScrollViewContentOffsetsToTargetContentOffsets
{
  if ([(SUUIScrollingTabBarController *)self isViewLoaded])
  {
    double v3 = [(SUUIScrollingTabBarController *)self view];
    [v3 bounds];
    double Width = CGRectGetWidth(v12);

    [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView contentSize];
    double v6 = v5;
    [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView bounds];
    double MidX = CGRectGetMidX(v13);
    if (MidX < 1.0) {
      double MidX = 1.0;
    }
    if (MidX >= v6) {
      double MidX = v6;
    }
    double v8 = round((MidX + -1.0) / Width);
    [(SUUIScrollingTabBarContentCollectionView *)self->_contentCollectionView contentOffset];
    if (v9 != Width * v8)
    {
      contentCollectionView = self->_contentCollectionView;
      -[SUUIScrollingTabBarContentCollectionView setContentOffset:](contentCollectionView, "setContentOffset:");
    }
  }
}

- (void)_updateStatusBarPositionForcingVisible:(BOOL)a3
{
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v11.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v11.c = v3;
  *(_OWORD *)&v11.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  if (!a3)
  {
    uint64_t v4 = [(UIViewController *)self->_focusedViewController navigationController];
    double v5 = [v4 navigationBar];

    if ([v5 conformsToProtocol:&unk_27064AC80])
    {
      [v5 positionOffset];
      CGAffineTransformMakeTranslation(&v11, v6, v7);
    }
  }
  double v8 = [MEMORY[0x263F82438] sharedApplication];
  double v9 = [v8 statusBar];
  CGAffineTransform v10 = v11;
  [v9 setTransform:&v10];
}

- (void)_updateTabBarBackgroundsAndHairlines
{
  if ([(SUUIScrollingTabBarPalette *)self->_tabBarPalette tabBarBackgroundExtendsBehindPalette])
  {
    if ([(SUUIScrollingTabBarPalette *)self->_tabBarPalette isAttached])
    {
      if (self->_tabBarExtendedBackgroundView)
      {
        uint64_t v3 = 1;
      }
      else
      {
        uint64_t v4 = [SUUIScrollingTabBarBackgroundView alloc];
        [(UIView *)self->_tabBarContainerView bounds];
        double v5 = -[SUUIScrollingTabBarBackgroundView initWithFrame:](v4, "initWithFrame:");
        tabBarExtendedBackgroundView = self->_tabBarExtendedBackgroundView;
        self->_tabBarExtendedBackgroundView = v5;

        uint64_t v3 = 1;
        [(SUUIScrollingTabBarBackgroundView *)self->_tabBarExtendedBackgroundView setShowsBackdrop:1];
        [(SUUIScrollingTabBarBackgroundView *)self->_tabBarExtendedBackgroundView setShowsTopHairline:1];
        CGFloat v7 = self->_tabBarExtendedBackgroundView;
        double v8 = [(SUUIScrollingTabBarController *)self _tabBarBackdropGroupName];
        [(SUUIScrollingTabBarBackgroundView *)v7 setBackdropBarGroupName:v8];

        [(UIView *)self->_tabBarContainerView insertSubview:self->_tabBarExtendedBackgroundView atIndex:0];
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  [(SUUIScrollingTabBarBackgroundView *)self->_tabBarExtendedBackgroundView setHidden:v3 ^ 1];
  id v10 = [(SUUICrossFadingTabBar *)self->_tabBar backgroundView];
  [v10 setHidden:v3];
  [v10 setUsesOpaqueColorForTopHairline:v3 ^ 1];
  double v9 = [(SUUIScrollingTabBarPalette *)self->_tabBarPalette _backgroundView];
  [v9 setShowsBackdrop:v3 ^ 1];
  [v9 setShowsTopHairline:v3 ^ 1];
  [v9 setShowsBottomHairline:1];
}

- (void)_updateTabBarButtons
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SUUICrossFadingTabBar *)self->_tabBar tabBarButtons];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * i) removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }
  double v18 = v3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = self->_viewControllers;
  uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        CGRect v13 = [*(id *)(*((void *)&v20 + 1) + 8 * j) tabBarItem];
        id v14 = objc_alloc_init(SUUICrossFadingTabBarButton);
        double v15 = [v13 title];
        [(SUUICrossFadingTabBarButton *)v14 setTitle:v15];

        double v16 = [v13 image];
        [(SUUICrossFadingTabBarButton *)v14 setImage:v16];

        double v17 = [v13 selectedImage];
        [(SUUICrossFadingTabBarButton *)v14 setSelectedImage:v17];

        [(SUUICrossFadingTabBarButton *)v14 addTarget:self action:sel__tabBarButtonTapped_ forControlEvents:1];
        if (!v10) {
          id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
        }
        [v10 addObject:v14];
        [v13 setView:v14];
      }
      uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  [(SUUICrossFadingTabBar *)self->_tabBar setTabBarButtons:v10];
}

- (void)_updateTabBarButtonsSelectionProgressWithHorizontalLayoutContext:(id *)a3
{
  if (a3->var0 == a3->var1) {
    double var2 = 0.0;
  }
  else {
    double var2 = a3->var2;
  }
  uint64_t v6 = [(SUUICrossFadingTabBar *)self->_tabBar tabBarButtons];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __98__SUUIScrollingTabBarController__updateTabBarButtonsSelectionProgressWithHorizontalLayoutContext___block_invoke;
  _OWORD v7[3] = &unk_2654042C8;
  v7[4] = self;
  long long v8 = *(_OWORD *)&a3->var0;
  double v9 = a3->var2;
  double v10 = var2;
  [v6 enumerateObjectsUsingBlock:v7];
}

uint64_t __98__SUUIScrollingTabBarController__updateTabBarButtonsSelectionProgressWithHorizontalLayoutContext___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v3 = 0.0;
  if (!*(void *)(*(void *)(a1 + 32) + 1344))
  {
    unint64_t v4 = *(void *)(a1 + 40);
    if (v4 <= a3)
    {
      unint64_t v5 = *(void *)(a1 + 48);
      if (v5 >= a3)
      {
        if (v4 == a3)
        {
          double v3 = 1.0 - *(double *)(a1 + 64);
        }
        else if (v5 == a3)
        {
          double v3 = *(double *)(a1 + 64);
        }
      }
    }
  }
  return [a2 setSelectionProgress:v3];
}

- (void)_updateViewControllerContentScrollViewInset
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  [(SUUIScrollingTabBarController *)self _viewControllerContentScrollViewContentInsetDescriptor];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v3 = self->_viewControllers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = [(NSMapTable *)self->_viewControllerToItemContext objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * v7)];
        long long v10 = v17;
        long long v11 = v18;
        uint64_t v12 = v19;
        [v8 applyNewContentInsetDescriptor:&v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v20 count:16];
    }
    while (v5);
  }

  transientViewControllerItemContext = self->_transientViewControllerItemContext;
  long long v10 = v17;
  long long v11 = v18;
  uint64_t v12 = v19;
  [(SUUIScrollingTabBarControllerItemContext *)transientViewControllerItemContext applyNewContentInsetDescriptor:&v10];
}

- ($6FC496E8309A5FF7C7AA8B90E862B691)_viewControllerContentScrollViewContentInsetDescriptor
{
  long long v5 = *(_OWORD *)&self->_proxyScrollViewContentInsetAdjustment.bottom;
  *(_OWORD *)&retstr->var0.top = *(_OWORD *)&self->_proxyScrollViewContentInsetAdjustment.top;
  *(_OWORD *)&retstr->var0.bottouint64_t m = v5;
  retstr->unint64_t var1 = 49.0;
  UIOffset result = ($6FC496E8309A5FF7C7AA8B90E862B691 *)[(SUUIScrollingTabBarPalette *)self->_tabBarPalette isAttached];
  if (result)
  {
    uint64_t v7 = [(SUUIScrollingTabBarController *)self view];
    long long v8 = [v7 traitCollection];
    [v8 displayScale];
    double v10 = v9;

    if (v10 < 0.00000011920929)
    {
      long long v11 = [MEMORY[0x263F82B60] mainScreen];
      [v11 scale];
      double v10 = v12;
    }
    UIOffset result = ($6FC496E8309A5FF7C7AA8B90E862B691 *)[(SUUIScrollingTabBarPalette *)self->_tabBarPalette paletteHeight];
    double v14 = 1.0 / v10 + v13 + 49.0;
    retstr->unint64_t var1 = v14;
  }
  else
  {
    double v14 = 49.0;
  }
  retstr->var0.bottouint64_t m = v14 + retstr->var0.bottom;
  return result;
}

- (void)_viewControllerNeedsNestedPagingScrollViewUpdate:(id)a3
{
  id v3 = [(NSMapTable *)self->_viewControllerToItemContext objectForKey:a3];
  [v3 updateForPossibleNestedPagingScrollViewChange];
}

- (SUUITabBarControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUUITabBarControllerDelegate *)a3;
}

- (UIViewController)transientViewController
{
  return self->_transientViewController;
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (UIOffset)additionalTabBarButtonsContainerPositionOffset
{
  double horizontal = self->_additionalTabBarButtonsContainerPositionOffset.horizontal;
  double vertical = self->_additionalTabBarButtonsContainerPositionOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (UIOffset)additionalTabBarPalettePositionOffset
{
  double horizontal = self->_additionalTabBarPalettePositionOffset.horizontal;
  double vertical = self->_additionalTabBarPalettePositionOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (BOOL)chargeEnabledOnTabBarButtonsContainer
{
  return self->_chargeEnabledOnTabBarButtonsContainer;
}

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_transientViewController, 0);
  objc_storeStrong((id *)&self->_viewControllerToItemContext, 0);
  objc_storeStrong((id *)&self->_transientViewControllerItemContext, 0);
  objc_storeStrong((id *)&self->_topLevelFocusedViewController, 0);
  objc_storeStrong((id *)&self->_tabBarPalette, 0);
  objc_storeStrong((id *)&self->_tabBarExtendedBackgroundView, 0);
  objc_storeStrong((id *)&self->_tabBarContainerView, 0);
  objc_storeStrong((id *)&self->_tabBar, 0);
  objc_storeStrong((id *)&self->_proxyScrollView, 0);
  objc_storeStrong((id *)&self->_focusedViewController, 0);
  objc_storeStrong((id *)&self->_focusedContentScrollView, 0);
  objc_storeStrong((id *)&self->_dynamicBarAnimator, 0);
  objc_storeStrong((id *)&self->_contentCollectionView, 0);
}

@end