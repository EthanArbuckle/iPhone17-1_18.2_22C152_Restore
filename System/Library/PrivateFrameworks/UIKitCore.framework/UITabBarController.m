@interface UITabBarController
+ (BOOL)_directlySetsContentOverlayInsetsForChildren;
+ (BOOL)_shouldSendLegacyMethodsFromViewWillTransitionToSize;
+ (BOOL)_uip_isFloatingTabBarEnabled;
+ (BOOL)doesOverridePreferredInterfaceOrientationForPresentation;
+ (Class)_moreNavigationControllerClass;
+ (NSCopying)visualStyleRegistryIdentity;
- (BOOL)_allowsAutorotation;
- (BOOL)_allowsCustomizing;
- (BOOL)_canRestoreFocusAfterTransitionToRecalledItem:(id)a3 inViewController:(id)a4;
- (BOOL)_doAllViewControllersSupportInterfaceOrientation:(int64_t)a3;
- (BOOL)_hasPreferredInterfaceOrientationForPresentation;
- (BOOL)_ignoreUnselectedTabsForStateRestoration;
- (BOOL)_isBarEffectivelyHidden;
- (BOOL)_isBarLayoutValid;
- (BOOL)_isFocusedTabVisible;
- (BOOL)_isInSidebarTransition;
- (BOOL)_isModernTVTabBar;
- (BOOL)_isPresentationContextByDefault;
- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3;
- (BOOL)_isTabBarController;
- (BOOL)_isTabBarFocused;
- (BOOL)_isTabBarOffscreen;
- (BOOL)_isViewControllerContainedInSelected:(id)a3;
- (BOOL)_notifySplitViewControllerForSelectionChange;
- (BOOL)_preferTabBarFocused;
- (BOOL)_reallyWantsFullScreenLayout;
- (BOOL)_shouldFocusViewControllerAfterTransition;
- (BOOL)_shouldPersistViewWhenCoding;
- (BOOL)_shouldUseOnePartRotation;
- (BOOL)_suspendBarBackgroundUpdating;
- (BOOL)_transitionsChildViewControllers;
- (BOOL)_tvTabBarShouldTrackScrollView:(id)a3;
- (BOOL)_uip_isSidebarVisible;
- (BOOL)_wantsBarHidden;
- (BOOL)_wrapsNavigationController:(id *)a3;
- (BOOL)becomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isTabBarHidden;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)showsEditButtonOnLeft;
- (CGRect)_frameForViewController:(id)a3;
- (CGRect)_frameForWrapperViewForViewController:(id)a3;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (NSArray)_tabElements;
- (NSArray)compactTabIdentifiers;
- (NSArray)customizableViewControllers;
- (NSArray)tabs;
- (NSArray)viewControllers;
- (NSMapTable)_rememberedFocusedItemsByViewController;
- (NSMutableArray)moreChildViewControllers;
- (NSString)customizationIdentifier;
- (NSUInteger)selectedIndex;
- (UIAction)_overrideTidebarButtonAction;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UINavigationController)moreNavigationController;
- (UITab)_selectedTabElement;
- (UITab)selectedTab;
- (UITabBar)tabBar;
- (UITabBarController)initWithCoder:(id)a3;
- (UITabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (UITabBarController)initWithTabs:(id)a3;
- (UITabBarControllerSidebar)sidebar;
- (UIView)_accessoryView;
- (UIViewController)selectedViewController;
- (UIViewControllerAnimatedTransitioning)_animator;
- (UIViewControllerInteractiveTransitioning)_interactor;
- (double)_leftContentMargin;
- (double)_rightContentMargin;
- (double)_sidebarOverlapAmount;
- (id)_additionalViewControllersToCheckForUserActivity;
- (id)_backdropBarGroupName;
- (id)_childViewControllerForExclusiveCollectionPhysicalButtonConfigurations;
- (id)_childViewControllerForMultitaskingDragExclusionRects;
- (id)_containerView;
- (id)_customAnimatorForFromViewController:(id)a3 toViewController:(id)a4;
- (id)_customInteractionControllerForAnimator:(id)a3;
- (id)_deepestActionResponder;
- (id)_displayedViewControllersForTab:(void *)a3 proposedViewControllers:;
- (id)_effectiveInteractionActivityTrackingBaseName;
- (id)_existingMoreNavigationController;
- (id)_internalTabBar;
- (id)_observingScrollView;
- (id)_overrideTraitCollectionToPassDuringTraitChangeToChildViewController:(id)a3;
- (id)_overridingPreferredFocusEnvironment;
- (id)_recallRememberedFocusedItemForViewController:(id)a3;
- (id)_resolvedPopoverPresentationControllerSourceItemForTab:(id *)a1;
- (id)_responderSelectionContainerViewForResponder:(id)a3;
- (id)_scrollViewObservedBeforeHidingBar;
- (id)_selectedViewControllerInTabBar;
- (id)_tabBarWindowForInterfaceOrientation:(id)a3;
- (id)_tabCustomizationProxy;
- (id)_tabs_compactTabs;
- (id)_transitionView;
- (id)_viewControllerForObservableScrollView;
- (id)_viewControllerForSelectAtIndex:(unint64_t)a3;
- (id)_viewControllerForTabBarItem:(id)a3;
- (id)_viewControllersForTabs;
- (id)_viewForViewController:(id)a3;
- (id)_viewsWithDisabledInteractionGivenTransitionContext:(id)a3;
- (id)_visualStyle;
- (id)_wrapperViewForViewController:(id)a3;
- (id)allViewControllers;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForPointerLock;
- (id)childViewControllerForScreenEdgesDeferringSystemGestures;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)childViewControllerForUserInterfaceStyle;
- (id)childViewControllerForWhitePointAdaptivityStyle;
- (id)delegate;
- (id)preferredFocusEnvironments;
- (id)preferredFocusedView;
- (id)rotatingFooterView;
- (id)rotatingHeaderView;
- (id)rotatingSnapshotViewForWindow:(id)a3;
- (id)tabForIdentifier:(id)a3;
- (id)transientViewController;
- (id)transitionCoordinator;
- (int64_t)_effectiveTabBarPosition;
- (int64_t)_subclassPreferredFocusedViewPrioritizationType;
- (int64_t)_tabBarPosition;
- (int64_t)_uip_preferredSidebarMode;
- (int64_t)mode;
- (int64_t)preferredCenterStatusBarStyle;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredLeadingStatusBarStyle;
- (int64_t)preferredTrailingStatusBarStyle;
- (uint64_t)_shouldSelectTab:(uint64_t)a1;
- (unint64_t)_effectiveMaxItems;
- (unint64_t)_relevantEdgeForScrollViewObservation;
- (unint64_t)supportedInterfaceOrientations;
- (void)__viewWillLayoutSubviews;
- (void)_childViewController:(id)a3 updatedObservedScrollView:(id)a4;
- (void)_compatibility_updateViewController:(id)a3 forTabBarObservedScrollView:(id)a4;
- (void)_configureTabModel;
- (void)_configureTargetActionForTabBarItem:(id)a3;
- (void)_didUpdateFocusInContext:(id)a3;
- (void)_displayedViewControllerDidChangeForTab:(void *)a3 previousViewController:;
- (void)_forceUpdateScrollViewIfNecessary;
- (void)_forgetFocusedItemForViewController:(id)a3;
- (void)_getRotationContentSettings:(id *)a3;
- (void)_handleObservingForScrollView:(id)a3 sharedWithNavigationController:(id)a4;
- (void)_hideBarWithTransition:(int)a3 isExplicit:(BOOL)a4;
- (void)_hideBarWithTransition:(int)a3 isExplicit:(BOOL)a4 duration:(double)a5;
- (void)_hideBarWithTransition:(int)a3 isExplicit:(BOOL)a4 duration:(double)a5 reason:(unint64_t)a6;
- (void)_hideBarWithTransition:(int)a3 isExplicit:(BOOL)a4 reason:(unint64_t)a5;
- (void)_invalidateBarLayout;
- (void)_invalidateBarLayoutIfNecessary;
- (void)_layoutContainerView;
- (void)_layoutViewController:(id)a3;
- (void)_navigationController:(id)a3 didUpdateAndObserveScrollView:(id)a4 forEdges:(unint64_t)a5;
- (void)_navigationControllerDidUpdateStack:(id)a3;
- (void)_notifyDisplayOrderChangesForGroup:(uint64_t)a1;
- (void)_notifyEditingStateChange:(id *)a1;
- (void)_notifyVisibilityChangesForTabs:(id *)a1;
- (void)_observableScrollViewDidChangeFrom:(id)a3 forViewController:(id)a4 edges:(unint64_t)a5;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)_observeScrollViewGeometryAffectingContentBottomDidChange:(id)a3;
- (void)_performFocusGesture:(unint64_t)a3;
- (void)_performWithoutNotifyingSelectionChange:(id)a3;
- (void)_populateArchivedChildViewControllers:(id)a3;
- (void)_prepareTabBar;
- (void)_rebuildTabBarItemsAnimated:(BOOL)a3;
- (void)_rebuildTabBarItemsIfNeeded;
- (void)_rebuildTabModelAnimated:(BOOL)a3;
- (void)_rememberFocusedItem:(id)a3 forViewController:(id)a4;
- (void)_rememberPresentingFocusedItem:(id)a3;
- (void)_resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary:(BOOL)a3 animated:(BOOL)a4;
- (void)_safeAreaInsetsDidChangeForView;
- (void)_selectDefaultViewControllerIfNecessaryWithAppearanceTransitions:(BOOL)a3;
- (void)_selectedElementDidChange:(void *)a3 previousElement:;
- (void)_selectedLeafDidChange:(void *)a3 previousLeaf:;
- (void)_setAccessoryView:(id)a3;
- (void)_setAnimator:(id)a3;
- (void)_setBadgeValue:(id)a3 forTabBarItem:(id)a4;
- (void)_setInteractor:(id)a3;
- (void)_setMaximumNumberOfItems:(unint64_t)a3;
- (void)_setMoreNavigationControllerRestorationIdentifier;
- (void)_setNotifySplitViewControllerForSelectionChange:(BOOL)a3;
- (void)_setOverrideTidebarButtonAction:(id)a3;
- (void)_setPreferTabBarFocused:(BOOL)a3;
- (void)_setScrollViewObservedBeforeHidingBar:(id)a3;
- (void)_setSelectedTabBarItem:(id)a3;
- (void)_setSelectedViewController:(id)a3;
- (void)_setSelectedViewController:(id)a3 performUpdates:(BOOL)a4;
- (void)_setSelectedViewControllerAndNotify:(id)a3;
- (void)_setSelectedViewControllerNeedsLayout;
- (void)_setSuspendBarBackgroundUpdating:(BOOL)a3;
- (void)_setTabBarOffscreen:(BOOL)a3;
- (void)_setTabBarPosition:(int64_t)a3;
- (void)_setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)_showBarWithTransition:(int)a3 isExplicit:(BOOL)a4;
- (void)_showBarWithTransition:(int)a3 isExplicit:(BOOL)a4 duration:(double)a5;
- (void)_showBarWithTransition:(int)a3 isExplicit:(BOOL)a4 duration:(double)a5 reason:(unint64_t)a6;
- (void)_showBarWithTransition:(int)a3 isExplicit:(BOOL)a4 reason:(unint64_t)a5;
- (void)_stopObservingScrollView:(id)a3;
- (void)_suspendAllTabBarBackgroundUpdates;
- (void)_tab:(void *)a3 acceptItemsFromDropSession:;
- (void)_tab:(void *)a3 operationForAcceptingItemsFromDropSession:;
- (void)_tabBarItemClicked:(id)a3;
- (void)_tabBarVisibilityDidChange;
- (void)_tabDropSessionDidUpdate:(void *)a3 withDestinationTab:;
- (void)_tabs_rebuildTabBarItemsAnimated:(BOOL)a3;
- (void)_uip_setPreferredSidebarMode:(int64_t)a3;
- (void)_uip_setSidebarVisible:(BOOL)a3;
- (void)_updateAndObserveScrollView:(id)a3 viewController:(id)a4;
- (void)_updateAndObserveScrollView:(id)a3 viewController:(id)a4 updateBackgroundTransitionProgressForNilScrollView:(BOOL)a5;
- (void)_updateBackgroundTransitionProgressForScrollView:(id)a3 tabBar:(id)a4;
- (void)_updateBackgroundTransitionProgressForScrollView:(id)a3 tabBar:(id)a4 isNavigationTransitionUpdate:(BOOL)a5;
- (void)_updateBackgroundTransitionProgressForScrollView:(id)a3 tabBar:(id)a4 isNavigationTransitionUpdate:(BOOL)a5 forceTwoPartCrossfade:(BOOL)a6 completion:(id)a7;
- (void)_updateBarHiddenByClientStateIfNecessary;
- (void)_updateLayoutForStatusBarAndInterfaceOrientation;
- (void)_updateLayoutForTraitCollection:(id)a3;
- (void)_updateObservingScrollViewWithScrollView:(id)a3 viewController:(id)a4 getTabBarRequiresStandardBackground:(BOOL *)a5;
- (void)_updateTabBarLayout;
- (void)_updateVisualStyleForTraitCollection:(id)a3;
- (void)_validateTabSelectionIfNeeded;
- (void)_viewControllerDidBeginDismissal:(id)a3;
- (void)_viewControllerObservableScrollViewAmbiguityStatusDidChange:(id)a3;
- (void)_viewDidPerformLayout;
- (void)_viewSubtreeDidGainScrollView:(id)a3 enclosingViewController:(id)a4;
- (void)_viewSubtreeDidGainScrollView:(id)a3 enclosingViewController:(id)a4 tvSearchController:(id)a5;
- (void)_willChangeToIdiom:(int64_t)a3 onScreen:(id)a4;
- (void)animationDidStop:(id)a3 finished:(id)a4 context:(id)a5;
- (void)applicationWillSuspend;
- (void)beginCustomizingTabBar:(id)a3;
- (void)concealTabBarSelection;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)didAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)hideBarWithTransition:(int)a3;
- (void)hideBarWithTransition:(int)a3 duration:(double)a4;
- (void)loadView;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)revealTabBarSelection;
- (void)setCompactTabIdentifiers:(id)a3;
- (void)setCustomizableViewControllers:(NSArray *)customizableViewControllers;
- (void)setCustomizationIdentifier:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setMode:(int64_t)a3;
- (void)setMoreChildViewControllers:(id)a3;
- (void)setRestorationIdentifier:(id)a3;
- (void)setSelectedIndex:(NSUInteger)selectedIndex;
- (void)setSelectedTab:(id)a3;
- (void)setSelectedViewController:(UIViewController *)selectedViewController;
- (void)setShowsEditButtonOnLeft:(BOOL)a3;
- (void)setTabBar:(id)a3;
- (void)setTabBarHidden:(BOOL)a3;
- (void)setTabBarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setTabs:(id)a3;
- (void)setTabs:(id)a3 animated:(BOOL)a4;
- (void)setTitle:(id)a3;
- (void)setTransientViewController:(id)a3;
- (void)setTransientViewController:(id)a3 animated:(BOOL)a4;
- (void)setView:(id)a3;
- (void)setViewControllers:(NSArray *)viewControllers;
- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated;
- (void)set_shouldFocusViewControllerAfterTransition:(BOOL)a3;
- (void)showBarWithTransition:(int)a3;
- (void)showBarWithTransition:(int)a3 duration:(double)a4;
- (void)tabBar:(id)a3 didEndCustomizingItems:(id)a4 changed:(BOOL)a5;
- (void)tabBar:(id)a3 willBeginCustomizingItems:(id)a4;
- (void)tabBar:(id)a3 willEndCustomizingItems:(id)a4 changed:(BOOL)a5;
- (void)tabBarSizingDidChange:(id)a3;
- (void)toggleSidebar:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionFromViewController:(id)a3 toViewController:(id)a4;
- (void)transitionFromViewController:(id)a3 toViewController:(id)a4 transition:(int)a5 shouldSetSelected:(BOOL)a6;
- (void)transitionViewDidComplete:(id)a3 fromView:(id)a4 toView:(id)a5;
- (void)transitionViewDidStart:(id)a3;
- (void)unwindForSegue:(id)a3 towardsViewController:(id)a4;
- (void)updateTabBarItemForViewController:(id)a3;
- (void)updateViewConstraints;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UITabBarController

uint64_t __51__UITabBarController__setViewControllers_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelectedIndex:*(void *)(a1 + 40)];
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_selectedViewController;
}

- (void)_navigationController:(id)a3 didUpdateAndObserveScrollView:(id)a4 forEdges:(unint64_t)a5
{
  id v9 = a3;
  id v8 = a4;
  if (([(UITabBarController *)self _relevantEdgeForScrollViewObservation] & a5) != 0) {
    [(UITabBarController *)self _handleObservingForScrollView:v8 sharedWithNavigationController:v9];
  }
}

- (void)_handleObservingForScrollView:(id)a3 sharedWithNavigationController:(id)a4
{
  id v10 = a3;
  v6 = a4;
  if (_UIBarsApplyChromelessEverywhere())
  {
    if (!v6) {
      goto LABEL_11;
    }
  }
  else
  {
    char v7 = _UIViewControllerUseContentScrollViewAPI();
    if (!v6 || (v7 & 1) == 0) {
      goto LABEL_11;
    }
  }
  if (((v6[94] >> 1) & 3u) - 1 <= 1)
  {
    id v8 = [v6 presentedViewController];

    if (!v8)
    {
      if (v10)
      {
        id v9 = [v6 _viewControllerForObservableScrollView];
        [(UITabBarController *)self _updateAndObserveScrollView:v10 viewController:v9];
      }
      else
      {
        [(UITabBarController *)self _updateBackgroundTransitionProgressForScrollView:0 tabBar:self->_tabBar];
      }
    }
  }
LABEL_11:
}

- (void)_updateAndObserveScrollView:(id)a3 viewController:(id)a4
{
}

- (double)_leftContentMargin
{
  v7.receiver = self;
  v7.super_class = (Class)UITabBarController;
  [(UIViewController *)&v7 _leftContentMargin];
  double v4 = v3;
  [(_UITabBarControllerVisualStyle *)self->_visualStyle additionalContentMargins];
  return v4 + v5;
}

- (double)_rightContentMargin
{
  v7.receiver = self;
  v7.super_class = (Class)UITabBarController;
  [(UIViewController *)&v7 _rightContentMargin];
  double v4 = v3;
  [(_UITabBarControllerVisualStyle *)self->_visualStyle additionalContentMargins];
  return v4 + v5;
}

- (BOOL)becomeFirstResponder
{
  double v3 = [(UITabBarController *)self selectedViewController];

  if (v3)
  {
    double v4 = [(UITabBarController *)self selectedViewController];
    char v5 = [v4 becomeFirstResponder];

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBarController;
    return [(UIResponder *)&v7 becomeFirstResponder];
  }
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  [(_UITabBarControllerVisualStyle *)self->_visualStyle edgeInsetsForChildViewController:a3];
  *a4 = 0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)_safeAreaInsetsDidChangeForView
{
  v3.receiver = self;
  v3.super_class = (Class)UITabBarController;
  [(UIViewController *)&v3 _safeAreaInsetsDidChangeForView];
  if (dyld_program_sdk_at_least()) {
    [(_UITabBarControllerVisualStyle *)self->_visualStyle updateTabBarLayout];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if ((*(unsigned char *)&self->_tabBarControllerFlags & 0x80) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unint64_t v5 = [WeakRetained tabBarControllerSupportedInterfaceOrientations:self];

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UITabBarController;
    return [(UIViewController *)&v6 supportedInterfaceOrientations];
  }
}

- (void)_updateObservingScrollViewWithScrollView:(id)a3 viewController:(id)a4 getTabBarRequiresStandardBackground:(BOOL *)a5
{
  id v21 = a3;
  id v8 = a4;
  if ([v8 _isViewControllerForObservableScrollViewAmbiguous])
  {
    uint64_t v9 = 1;
  }
  else
  {
    id v10 = [v8 _splitViewControllerEnforcingClass:1];
    if (!v10
      || ([(UIViewController *)self _splitViewControllerEnforcingClass:1],
          v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v10 == v11))
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = [v10 _isViewControllerForObservableScrollViewAmbiguous];
    }
  }
  if (!v21 || (_UIViewControllerUseContentScrollViewAPI() & 1) == 0)
  {
    if (([v21 _isScrollViewScrollObserver:self] & 1) == 0)
    {
LABEL_16:
      int v14 = 0;
      goto LABEL_17;
    }
LABEL_15:
    [(UITabBarController *)self _stopObservingScrollView:v21];
    goto LABEL_16;
  }
  BOOL v12 = [(_UITabBarControllerVisualStyle *)self->_visualStyle shouldTrackContentScrollView:v21 viewController:v8 tabBarBackgroundRequired:v9];
  int v13 = [v21 _isScrollViewScrollObserver:self];
  if (!v12)
  {
    if (!v13) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if ((v13 & 1) == 0) {
    [v21 _addScrollViewScrollObserver:self];
  }
  int v14 = 1;
LABEL_17:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);
  if (WeakRetained)
  {
    v16 = WeakRetained;
    id v17 = objc_loadWeakRetained((id *)&self->_observingScrollView);
    char v18 = v17 == v21 ? v14 : 0;

    if ((v18 & 1) == 0)
    {
      id v19 = objc_loadWeakRetained((id *)&self->_observingScrollView);
      [(UITabBarController *)self _stopObservingScrollView:v19];
    }
  }
  if (v14) {
    v20 = v21;
  }
  else {
    v20 = 0;
  }
  objc_storeWeak((id *)&self->_observingScrollView, v20);
  if (a5) {
    *a5 = v9;
  }
}

- (unint64_t)_relevantEdgeForScrollViewObservation
{
  int64_t v2 = [(_UITabBarControllerVisualStyle *)self->_visualStyle tabBarPosition];
  if ((_UIViewControllerUseContentScrollViewAPI() & (v2 == 2)) != 0) {
    return 1;
  }
  else {
    return 4;
  }
}

- (id)_internalTabBar
{
  if (a1)
  {
    a1 = (id *)a1[122];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_overrideTraitCollectionToPassDuringTraitChangeToChildViewController:(id)a3
{
  id v4 = a3;
  if (_overrideUISplitViewControllerToCompact_onceToken != -1) {
    dispatch_once(&_overrideUISplitViewControllerToCompact_onceToken, &__block_literal_global_851_0);
  }
  if (_overrideUISplitViewControllerToCompact_override
    && -[_UITabBarControllerVisualStyle overrideUISplitViewControllerToCompact](self->_visualStyle, "overrideUISplitViewControllerToCompact")&& !-[UITabBarController _isBarEffectivelyHidden](self, "_isBarEffectivelyHidden")&& (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)&& [v4 style])
  {
    unint64_t v5 = +[UITraitCollection traitCollectionWithHorizontalSizeClass:1];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_isBarEffectivelyHidden
{
  if ([(UITabBarController *)self _wantsBarHidden]) {
    return 1;
  }
  visualStyle = self->_visualStyle;
  return [(_UITabBarControllerVisualStyle *)visualStyle isTabBarEffectivelyHidden];
}

- (BOOL)_wantsBarHidden
{
  return (*(unsigned char *)&self->_tabBarControllerFlags & 0xC) != 0;
}

- (int64_t)_effectiveTabBarPosition
{
  if (self->_tabBarPosition <= 1uLL) {
    return 1;
  }
  else {
    return self->_tabBarPosition;
  }
}

- (UITabBar)tabBar
{
  return self->_tabBar;
}

- (id)_tabBarWindowForInterfaceOrientation:(id)a3
{
  if (self->_tabBar == a3) {
    [(UIViewController *)self _window];
  }
  else {
  objc_super v3 = [a3 window];
  }
  return v3;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v20 = a3;
  [(_UITabBarControllerVisualStyle *)self->_visualStyle overlayInsetsAdjustment];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(_UITabBarControllerVisualStyle *)self->_visualStyle adjustTabBarForContentScrollView:v20];
  [(_UITabBarControllerVisualStyle *)self->_visualStyle overlayInsetsAdjustment];
  if (v7 != v15 || v5 != v12 || v11 != v14 || v9 != v13)
  {
    id v19 = [(UIViewController *)self _window];
    [v19 _noteOverlayInsetsDidChange];
  }
  [(UITabBarController *)self _updateBackgroundTransitionProgressForScrollView:v20 tabBar:self->_tabBar];
}

- (void)_updateAndObserveScrollView:(id)a3 viewController:(id)a4 updateBackgroundTransitionProgressForNilScrollView:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  unsigned __int8 v13 = 0;
  [(UITabBarController *)self _updateObservingScrollViewWithScrollView:v8 viewController:a4 getTabBarRequiresStandardBackground:&v13];
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);

    if (WeakRetained == v8)
    {
      [(_UITabBarControllerVisualStyle *)self->_visualStyle adjustTabBarForContentScrollView:v8];
      [(UITabBarController *)self _updateBackgroundTransitionProgressForScrollView:v8 tabBar:self->_tabBar];
    }
  }
  int v10 = v13;
  self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFBFFFF | (v13 << 18));
  if (v10) {
    [(UITabBar *)self->_tabBar _setBackgroundTransitionProgress:0.0];
  }
  id v11 = objc_loadWeakRetained((id *)&self->_observingScrollView);
  if (v11) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = !v5;
  }
  if (v12)
  {
  }
  else if (!v13)
  {
    [(UITabBarController *)self _updateBackgroundTransitionProgressForScrollView:0 tabBar:self->_tabBar];
  }
}

- (void)_updateBackgroundTransitionProgressForScrollView:(id)a3 tabBar:(id)a4 isNavigationTransitionUpdate:(BOOL)a5 forceTwoPartCrossfade:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (!self->_backgroundUpdatesSuspendCount)
  {
    $BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = self->_tabBarControllerFlags;
    if ((*(_WORD *)&tabBarControllerFlags & 0x800) == 0 || v9)
    {
      if ((*(_WORD *)&tabBarControllerFlags & 0x800) != 0 && v9) {
        self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&tabBarControllerFlags & 0xFFFFF7FF);
      }
      double v40 = 0.0;
      if (_UIBarsGetBottomBarBackgroundTransitionProgressForScrollView(v12, v13, &v40))
      {
        [v13 _backgroundTransitionProgress];
        double v17 = v16;
        if (v40 == 1.0)
        {
          char v18 = objc_msgSend(v13, "selectedItem", v40);
          id v19 = [v18 scrollEdgeAppearance];
          id v20 = v19;
          if (v19)
          {
            id v21 = v19;
          }
          else
          {
            id v21 = [v13 scrollEdgeAppearance];
          }
          v23 = v21;

          if (v17 == 1.0)
          {
            v24 = [v23 _backgroundData];
            v25 = [(UIBarAppearance *)self->_lastUsedScrollEdgeAppearance _backgroundData];
            id v26 = v24;
            id v27 = v25;
            v28 = v27;
            if (v26 == v27)
            {
              uint64_t v22 = 0;
            }
            else
            {
              uint64_t v22 = 1;
              if (v26 && v27) {
                uint64_t v22 = [v26 isEqual:v27] ^ 1;
              }
            }
          }
          else
          {
            uint64_t v22 = 0;
          }
        }
        else
        {
          uint64_t v22 = 0;
          v23 = 0;
        }
        BOOL v29 = v17 != v40 && v9;
        if ((v29 || v8)
          && +[UIView _isInAnimationBlockWithAnimationsEnabled])
        {
          v30 = [(UITabBar *)self->_tabBar selectedItem];
          uint64_t v31 = [v30 scrollEdgeAppearance];
          if (v31)
          {
            v32 = (void *)v31;
          }
          else
          {
            v32 = [(UITabBar *)self->_tabBar scrollEdgeAppearance];

            if (!v32)
            {
LABEL_34:
              double v34 = v40;
              v36[0] = MEMORY[0x1E4F143A8];
              v36[1] = 3221225472;
              v36[2] = __140__UITabBarController__updateBackgroundTransitionProgressForScrollView_tabBar_isNavigationTransitionUpdate_forceTwoPartCrossfade_completion___block_invoke;
              v36[3] = &unk_1E52E8040;
              id v37 = v13;
              double v38 = v34;
              char v39 = v22;
              _UIBarsTwoPartCrossfadeTransitionProgress(v36, v14, v34);

LABEL_37:
              if (v17 == 1.0) {
                int v35 = v22;
              }
              else {
                int v35 = 1;
              }
              if (v40 == 1.0 && v35) {
                objc_storeStrong((id *)&self->_lastUsedScrollEdgeAppearance, v23);
              }

              goto LABEL_13;
            }
          }
          int v33 = [v32 _hasTransparentBackground];

          if (v33) {
            goto LABEL_34;
          }
        }
        [v13 _setBackgroundTransitionProgress:v22 forceUpdate:0 animated:v40];
        if (v14) {
          (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
        }
        goto LABEL_37;
      }
    }
  }
  if (v14) {
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
  }
LABEL_13:
}

- (void)_updateBackgroundTransitionProgressForScrollView:(id)a3 tabBar:(id)a4 isNavigationTransitionUpdate:(BOOL)a5
{
}

- (void)_updateBackgroundTransitionProgressForScrollView:(id)a3 tabBar:(id)a4
{
}

- (void)_observeScrollViewGeometryAffectingContentBottomDidChange:(id)a3
{
}

- (BOOL)_isPresentationContextByDefault
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UITabBarController;
  -[UIViewController viewDidAppear:](&v7, sel_viewDidAppear_);
  BOOL v5 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  double v6 = v5;
  if (v5 == self->_selectedViewControllerDuringWillAppear)
  {
    [(UIViewController *)v5 __viewDidAppear:v3];
    if (![(UIViewController *)v6 _containsFirstResponder]) {
      [(UIViewController *)v6 _viewControllerWasSelected];
    }
  }
  [(_UITabBarControllerVisualStyle *)self->_visualStyle viewDidAppear:v3];
}

void __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_294(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[UIViewController _invalidatePreferences:excluding:](WeakRetained, -1, 0);
    id WeakRetained = v2;
  }
}

void __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UITabBarController;
  -[UIViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  BOOL v5 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  -[UIViewController __viewWillDisappear:]((uint64_t)v5, v3);

  [(_UITabBarControllerVisualStyle *)self->_visualStyle viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UITabBarController;
  -[UIViewController viewDidDisappear:](&v6, sel_viewDidDisappear_);
  BOOL v5 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  -[UIViewController __viewDidDisappear:]((uint64_t)v5, v3);

  [(_UITabBarControllerVisualStyle *)self->_visualStyle viewDidDisappear:v3];
  if ([(_UITabBarControllerVisualStyle *)self->_visualStyle removeTabBarFocusedOnViewDidDisappear])
  {
    *(_DWORD *)&self->_tabBarControllerFlags &= ~0x200u;
  }
  [(_UITabBarControllerVisualStyle *)self->_visualStyle teardown];
}

- (id)_backdropBarGroupName
{
  BOOL v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  objc_super v6 = [v3 stringWithFormat:@"<%@:%p> Backdrop Group", v5, self];

  return v6;
}

- (void)_configureTargetActionForTabBarItem:(id)a3
{
  id v4 = a3;
  [v4 setTarget:self];
  [v4 setAction:sel__tabBarItemClicked_];
}

void __64__UITabBarController__setSelectedViewController_performUpdates___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[145];
  }
  objc_super v7 = v2;
  BOOL v3 = [*(id *)(a1 + 40) _tabModel];

  id v4 = v7;
  if (v3 == v7)
  {
    if ([*(id *)(a1 + 40) _isGroup])
    {
      BOOL v5 = [v7 selectedItem];
      objc_super v6 = *(void **)(a1 + 40);

      if (v5 != v6) {
        [*(id *)(a1 + 40) _updateManagingNavigationStackUsingTransition:0];
      }
    }
    [v7 selectElement:*(void *)(a1 + 40) notifyOnReselection:0];
    id v4 = v7;
  }
}

- (id)childViewControllerForStatusBarStyle
{
  return [(_UITabBarControllerVisualStyle *)self->_visualStyle childViewControllerForStatusBarStyle];
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return self->_selectedViewController;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_selectedViewController;
}

- (id)childViewControllerForWhitePointAdaptivityStyle
{
  return self->_selectedViewController;
}

- (int64_t)preferredTrailingStatusBarStyle
{
  return [(_UITabBarControllerVisualStyle *)self->_visualStyle preferredTrailingStatusBarStyle];
}

- (int64_t)preferredLeadingStatusBarStyle
{
  return [(_UITabBarControllerVisualStyle *)self->_visualStyle preferredLeadingStatusBarStyle];
}

- (int64_t)preferredCenterStatusBarStyle
{
  return [(_UITabBarControllerVisualStyle *)self->_visualStyle preferredCenterStatusBarStyle];
}

- (BOOL)_isInSidebarTransition
{
  return *((unsigned char *)&self->_tabBarControllerFlags + 2) & 1;
}

+ (BOOL)_uip_isFloatingTabBarEnabled
{
  if (qword_1EB25E600 != -1) {
    dispatch_once(&qword_1EB25E600, &__block_literal_global_130);
  }
  return _MergedGlobals_43;
}

- (void)_navigationControllerDidUpdateStack:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(UITabBarController *)self _relevantEdgeForScrollViewObservation];
  objc_super v6 = [v4 topViewController];
  id v7 = [v6 _contentOrObservableScrollViewForEdge:v5];

  [(UITabBarController *)self _handleObservingForScrollView:v7 sharedWithNavigationController:v4];
}

void __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endAppearanceTransition];
}

- (void)setViewControllers:(NSArray *)viewControllers
{
}

void __52__UITabBarController__registerDefaultStylesIfNeeded__block_invoke()
{
  v0 = +[_UIVisualStyleRegistry defaultRegistry];
  uint64_t v1 = objc_opt_class();
  [v0 registerVisualStyleClass:v1 forStylableClass:objc_opt_class()];

  id v2 = +[_UIVisualStyleRegistry registryForIdiom:3];
  uint64_t v3 = objc_opt_class();
  [v2 registerVisualStyleClass:v3 forStylableClass:objc_opt_class()];

  id v4 = +[_UIVisualStyleRegistry registryForIdiom:2];
  uint64_t v5 = objc_opt_class();
  [v4 registerVisualStyleClass:v5 forStylableClass:objc_opt_class()];

  objc_super v6 = +[_UIVisualStyleRegistry registryForIdiom:8];
  uint64_t v7 = objc_opt_class();
  [v6 registerVisualStyleClass:v7 forStylableClass:objc_opt_class()];

  if (qword_1EB25E600 != -1) {
    dispatch_once(&qword_1EB25E600, &__block_literal_global_130);
  }
  if (_MergedGlobals_43)
  {
    id v9 = +[_UIVisualStyleRegistry registryForIdiom:1];
    uint64_t v8 = objc_opt_class();
    [v9 registerVisualStyleClass:v8 forStylableClass:objc_opt_class()];
  }
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)@"UITabBarController";
}

- (void)_viewDidPerformLayout
{
  v11.receiver = self;
  v11.super_class = (Class)UITabBarController;
  [(UIViewController *)&v11 _viewDidPerformLayout];
  $BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = self->_tabBarControllerFlags;
  if ((*(_WORD *)&tabBarControllerFlags & 0x1000) != 0)
  {
    self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&tabBarControllerFlags & 0xFFFFEFFF);
    if (_UIViewControllerUseContentScrollViewAPI())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);
      if (!WeakRetained) {
        goto LABEL_5;
      }
      uint64_t v5 = WeakRetained;
      id v6 = objc_loadWeakRetained((id *)&self->_observingScrollView);
      uint64_t v7 = [v6 _viewControllerForAncestor];
      BOOL v8 = [(UITabBarController *)self _isViewControllerContainedInSelected:v7];

      if (!v8)
      {
LABEL_5:
        id v9 = [(_UITabBarControllerVisualStyle *)self->_visualStyle viewControllerForObservableScrollViewFromViewController:self->_selectedViewController];
        int v10 = objc_msgSend(v9, "_contentOrObservableScrollViewForEdge:", -[UITabBarController _relevantEdgeForScrollViewObservation](self, "_relevantEdgeForScrollViewObservation"));
        [(UITabBarController *)self _updateAndObserveScrollView:v10 viewController:v9 updateBackgroundTransitionProgressForNilScrollView:1];
      }
    }
  }
}

- (void)_viewSubtreeDidGainScrollView:(id)a3 enclosingViewController:(id)a4 tvSearchController:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  BOOL v8 = [(_UITabBarControllerVisualStyle *)self->_visualStyle viewControllerForObservableScrollViewFromViewController:self->_selectedViewController];
  unint64_t v9 = [(UITabBarController *)self _relevantEdgeForScrollViewObservation];
  id v10 = [v8 _contentOrObservableScrollViewForEdge:v9];
  if (v10) {
    goto LABEL_6;
  }
  objc_super v11 = [(_UITabBarControllerVisualStyle *)self->_visualStyle viewControllerForObservableScrollViewFromViewController:v7];
  id v12 = [v11 _contentOrObservableScrollViewForEdge:v9];
  if (v12 != v15)
  {

    goto LABEL_6;
  }
  BOOL v13 = [(UITabBarController *)self _isViewControllerContainedInSelected:v7];

  if (!v13)
  {
LABEL_6:
    if (v10 != v15) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v14 = v15;
LABEL_7:
  *(_DWORD *)&self->_tabBarControllerFlags |= 0x20000u;
  [(UITabBarController *)self _updateAndObserveScrollView:v15 viewController:v8];
  id v10 = v15;
LABEL_8:
}

- (void)_viewSubtreeDidGainScrollView:(id)a3 enclosingViewController:(id)a4
{
}

- (BOOL)_isViewControllerContainedInSelected:(id)a3
{
  id v4 = (UIViewController *)a3;
  uint64_t v5 = v4;
  while (v5)
  {
    id v6 = [(UIViewController *)v5 parentViewController];
    id v7 = v6;
    if (v6)
    {
      BOOL v8 = v5;
      uint64_t v5 = v6;
    }
    else
    {
      BOOL v8 = [(UIViewController *)v5 presentingViewController];
      unint64_t v9 = [v8 presentationController];
      if ([v9 _presentedViewControllerProvidesContentScrollView]) {
        id v10 = v8;
      }
      else {
        id v10 = 0;
      }

      uint64_t v5 = v10;
    }

    selectedViewController = self->_selectedViewController;
    if (v5 == selectedViewController)
    {
      if (v5)
      {
        BOOL v12 = v5 == self->_selectedViewController;

        goto LABEL_13;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (void)_stopObservingScrollView:(id)a3
{
  id v4 = a3;
  if ([v4 _isScrollViewScrollObserver:self]) {
    [v4 _removeScrollViewScrollObserver:self];
  }
}

- (void)_updateTabBarLayout
{
}

- (void)transitionFromViewController:(id)a3 toViewController:(id)a4 transition:(int)a5 shouldSetSelected:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v111 = v10;
  if (v10 == v11) {
    goto LABEL_111;
  }
  SEL v101 = a2;
  if (objc_opt_respondsToSelector()) {
    [(UIViewControllerAnimatedTransitioning *)self->__animator interruptTabBarControllerTransition];
  }
  if (objc_opt_respondsToSelector())
  {
    BOOL v12 = +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:self->__animator];
    BOOL v13 = self->__animator;
    id v14 = v13;
    if (v12
      && [(UIViewControllerAnimatedTransitioning *)v13 shouldPreemptWithContext:v12])
    {
      v105 = [(UIViewControllerAnimatedTransitioning *)self->__animator preemptWithContext:v12];
    }
    else
    {
      v105 = 0;
    }
    id v15 = v10;

    if (!v10) {
      goto LABEL_13;
    }
  }
  else
  {
    v105 = 0;
    id v15 = v10;
    if (!v10)
    {
LABEL_13:
      int v19 = 0;
      goto LABEL_16;
    }
  }
  double v16 = [(UITabBarController *)self _viewForViewController:v15];
  double v17 = [v16 superview];
  if (v17)
  {
    char v18 = [v16 layer];
    int v19 = [v18 hasBeenCommitted];
  }
  else
  {
    int v19 = 0;
  }

  id v15 = v10;
LABEL_16:
  if (+[UIView areAnimationsEnabled])
  {
    int v20 = ((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 < 2 ? v19 : 0;
    if (v20 == 1)
    {
      id v21 = [(UITabBarController *)self _customAnimatorForFromViewController:v15 toViewController:v11];
      [(UITabBarController *)self _setAnimator:v21];
    }
  }
  if (self->__animator)
  {
    uint64_t v22 = -[UITabBarController _customInteractionControllerForAnimator:](self, "_customInteractionControllerForAnimator:");
    [(UITabBarController *)self _setInteractor:v22];

    animator = self->__animator;
  }
  else
  {
    animator = 0;
  }
  interactor = self->__interactor;
  BOOL v24 = animator != 0;
  v110 = animator;
  char v98 = objc_opt_respondsToSelector();
  char v97 = objc_opt_respondsToSelector();
  v25 = [v11 parentModalViewController];
  id v26 = [v25 tabBarItem];
  id v27 = v26;
  if (v26)
  {
    id v106 = v26;
  }
  else
  {
    id v106 = [v11 tabBarItem];
  }
  if (v110)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UITabBarController", &qword_1EB25E620);
    BOOL v29 = *(id *)(CategoryCachedImpl + 8);
    os_signpost_id_t v30 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self);
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v31 = v30;
      if (os_signpost_enabled(v29))
      {
        v32 = (objc_class *)objc_opt_class();
        Name = class_getName(v32);
        double v34 = (objc_class *)objc_opt_class();
        *(_DWORD *)buf = 136446466;
        *(void *)&buf[4] = Name;
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = class_getName(v34);
        _os_signpost_emit_with_name_impl(&dword_1853B0000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v31, "SwitchTabs", " enableTelemetry=YES  isAnimation=YES from=%{signpost.telemetry:string1,public}s to=%{signpost.telemetry:string2,public}s", buf, 0x16u);
      }
    }

    v108 = [(UITabBarController *)self _viewForViewController:v11];
    int v35 = [(UITabBarController *)self _viewForViewController:v111];
    v109 = [v35 superview];

    [(UITabBarController *)self _layoutViewController:v11];
  }
  else
  {
    unint64_t v36 = __UILogGetCategoryCachedImpl("UITabBarController", &qword_1EB25E628);
    id v37 = *(id *)(v36 + 8);
    os_signpost_id_t v38 = os_signpost_id_make_with_pointer(*(os_log_t *)(v36 + 8), self);
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v39 = v38;
      if (os_signpost_enabled(v37))
      {
        double v40 = (objc_class *)objc_opt_class();
        v41 = class_getName(v40);
        v42 = (objc_class *)objc_opt_class();
        *(_DWORD *)buf = 136446466;
        *(void *)&buf[4] = v41;
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = class_getName(v42);
        _os_signpost_emit_with_name_impl(&dword_1853B0000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v39, "SwitchTabs", " enableTelemetry=YES from=%{signpost.telemetry:string1,public}s to=%{public, signpost.telemetry:string2,public}s", buf, 0x16u);
      }
    }

    [(UITabBarController *)self _setSelectedTabBarItem:v106];
    v108 = [(UITabBarController *)self _viewForViewController:v11];
    v109 = [(UITabBarController *)self _wrapperViewForViewController:v11];
  }
  v43 = [(_UITabBarControllerVisualStyle *)self->_visualStyle viewControllerForObservableScrollViewFromViewController:v11];
  v44 = [v43 _contentOrObservableScrollViewForEdge:1];

  if (v44)
  {
    v45 = [(UIViewController *)self navigationController];
    v46 = [v45 view];
    [v46 setNeedsLayout];
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v143 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke;
  aBlock[3] = &unk_1E52E8090;
  v47 = (UIViewController *)v11;
  v136 = v47;
  BOOL v140 = v24;
  id v48 = v111;
  id v137 = v48;
  v138 = self;
  v139 = buf;
  v107 = (void (**)(void))_Block_copy(aBlock);
  if (((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 3 >= 0xFFFFFFFE && v110 == 0) {
    v107[2]();
  }
  if (!v108
    || ([(UITabBarController *)self _viewForViewController:v47],
        v50 = objc_claimAutoreleasedReturnValue(),
        BOOL v51 = v108 == v50,
        v50,
        !v51))
  {
    uint64_t v52 = [(UITabBarController *)self _wrapperViewForViewController:v47];

    v109 = (void *)v52;
  }
  p_selectedViewController = &self->_selectedViewController;
  v104 = self->_selectedViewController;
  if (!v6) {
    goto LABEL_61;
  }
  v54 = [(UITabBarController *)self allViewControllers];
  if ([v54 containsObject:v47])
  {
    v55 = v47;
  }
  else
  {
    v56 = [(UIViewController *)v47 presentingViewController];
    if ([v54 containsObject:v56])
    {
      v55 = [(UIViewController *)v47 presentingViewController];
    }
    else
    {
      v55 = 0;
    }
  }
  if (dyld_program_sdk_at_least())
  {
    if (v55) {
      goto LABEL_58;
    }
    v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:v101, self, @"UITabBarController.m", 4353, @"Attempting to select a view controller that isn't a child! %@", 0 object file lineNumber description];
  }
  else
  {
    if (v55) {
      goto LABEL_58;
    }
    v57 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25E630) + 8);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = 0;
      _os_log_impl(&dword_1853B0000, v57, OS_LOG_TYPE_ERROR, "Attempting to select a view controller that isn't a child! %@", (uint8_t *)location, 0xCu);
    }
  }

LABEL_58:
  objc_storeStrong((id *)&self->_selectedViewController, v55);
  [(UITabBarController *)self _compatibility_updateViewController:*p_selectedViewController forTabBarObservedScrollView:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);
  BOOL v59 = WeakRetained == 0;

  if (!v59 && (_UIViewControllerUseContentScrollViewAPI() & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v95 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_fault_impl(&dword_1853B0000, v95, OS_LOG_TYPE_FAULT, "Unexpected non-nil _observingScrollView only accessible on tvOS for this OS version", (uint8_t *)location, 2u);
      }
    }
    else
    {
      v95 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25E638) + 8);
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1853B0000, v95, OS_LOG_TYPE_ERROR, "Unexpected non-nil _observingScrollView only accessible on tvOS for this OS version", (uint8_t *)location, 2u);
      }
    }
  }
  *(_DWORD *)&self->_tabBarControllerFlags |= 0x1000u;

LABEL_61:
  if (dyld_program_sdk_at_least()
    && *(unsigned char *)(*(void *)&buf[8] + 24)
    && *p_selectedViewController == v47)
  {
    objc_initWeak(location, self);
    v133[0] = MEMORY[0x1E4F143A8];
    v133[1] = 3221225472;
    v133[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_294;
    v133[3] = &unk_1E52E80B8;
    objc_copyWeak(&v134, location);
    -[UIViewController _performAtViewIsAppearing:]((uint64_t)v47, v133);
    objc_destroyWeak(&v134);
    objc_destroyWeak(location);
    char v102 = 1;
  }
  else
  {
    char v102 = 0;
  }
  visualStyle = self->_visualStyle;
  v132[0] = MEMORY[0x1E4F143A8];
  v132[1] = 3221225472;
  v132[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_2;
  v132[3] = &unk_1E52DC3A0;
  v132[4] = self;
  if ([(_UITabBarControllerVisualStyle *)visualStyle transitionFromViewController:v48 toViewController:v47 animated:v110 != 0 completion:v132])
  {
    v61 = 0;
  }
  else
  {
    if (v110)
    {
      v62 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
      [(_UIViewControllerTransitionContext *)v62 _setIsAnimated:1];
      [(_UIViewControllerOneToOneTransitionContext *)v62 _setFromViewController:v48];
      [(_UIViewControllerOneToOneTransitionContext *)v62 _setToViewController:v47];
      v63 = [(UITabBarController *)self _viewForViewController:v48];
      [(_UIViewControllerOneToOneTransitionContext *)v62 _setFromView:v63];

      v64 = [(UITabBarController *)self _viewForViewController:v47];
      [(_UIViewControllerOneToOneTransitionContext *)v62 _setToView:v64];

      [(_UIViewControllerTransitionContext *)v62 _setContainerView:v109];
      v65 = [(UIViewController *)v47 view];
      [v65 frame];
      -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v62, "_setToEndFrame:");

      v66 = [v48 view];
      [v66 frame];
      -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](v62, "_setFromStartFrame:");

      double v67 = *MEMORY[0x1E4F1DB28];
      double v68 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v69 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v70 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v62, "_setToStartFrame:", *MEMORY[0x1E4F1DB28], v68, v69, v70);
      -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](v62, "_setFromEndFrame:", v67, v68, v69, v70);
      [(_UIViewControllerTransitionContext *)v62 _setAnimator:self->__animator];
      [(_UIViewControllerTransitionContext *)v62 _setInteractor:self->__interactor];
      [(UITabBarController *)self _suspendAllTabBarBackgroundUpdates];
      *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20000u;
      char v99 = (interactor != 0) | v98 | v97;
      if ((v99 & 1) == 0)
      {
        v71 = [(UIViewController *)self view];
        [v71 setUserInteractionEnabled:0];
      }
      v72 = NSString;
      v73 = self;
      v74 = NSString;
      v75 = (objc_class *)objc_opt_class();
      v76 = NSStringFromClass(v75);
      v77 = [v74 stringWithFormat:@"<%@: %p>", v76, v73];

      v100 = [v72 stringWithFormat:@"UITabBarControllerTransition: %@", v77];

      v78 = [(UIViewController *)v73 view];
      v79 = [v78 window];
      v80 = -[UIWindow _acquireOrientationLockAssertionWithReason:](v79, v100);

      if (interactor)
      {
        v81 = [(UITabBarController *)v73 transitionCoordinator];
        v130[0] = MEMORY[0x1E4F143A8];
        v130[1] = 3221225472;
        v130[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_3;
        v130[3] = &unk_1E52DB270;
        v130[4] = v73;
        id v131 = v106;
        [v81 notifyWhenInteractionChangesUsingBlock:v130];
      }
      else
      {
        [(UITabBarController *)v73 _setSelectedTabBarItem:v106];
      }
      v123[0] = MEMORY[0x1E4F143A8];
      v123[1] = 3221225472;
      v123[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_4;
      v123[3] = &unk_1E52E80E0;
      v123[4] = v73;
      id v124 = v48;
      v128 = buf;
      v125 = v47;
      v126 = v104;
      id v83 = v80;
      id v127 = v83;
      BOOL v129 = (v99 & 1) == 0;
      [(_UIViewControllerTransitionContext *)v62 _setCompletionHandler:v123];
      [(UIViewControllerAnimatedTransitioning *)self->__animator transitionDuration:v62];
      -[_UIViewControllerTransitionContext _setDuration:](v62, "_setDuration:");
      v84 = (void *)UIApp;
      v116[0] = MEMORY[0x1E4F143A8];
      v116[1] = 3221225472;
      v116[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_303;
      v116[3] = &unk_1E52E8108;
      id v117 = v105;
      v118 = v73;
      v61 = v62;
      v119 = v61;
      v121 = buf;
      v120 = v107;
      BOOL v122 = interactor != 0;
      [v84 _performBlockAfterCATransactionCommits:v116];
    }
    else
    {
      v82 = [(UITabBarController *)self _transitionView];
      [v82 transition:a5 toView:v109];

      [(UITabBarController *)self set_shouldFocusViewControllerAfterTransition:0];
      v61 = 0;
    }
    if (!a5)
    {
      [v109 frame];
      objc_msgSend(v109, "setFrame:");
    }
  }
  objc_opt_class();
  id v85 = v48;
  if (objc_opt_isKindOfClass()) {
    v86 = v85;
  }
  else {
    v86 = 0;
  }
  id v87 = v86;

  objc_opt_class();
  v88 = v47;
  if (objc_opt_isKindOfClass()) {
    v89 = v88;
  }
  else {
    v89 = 0;
  }
  v90 = v89;

  if (v87)
  {
    [(UIViewController *)v90 _updateBottomBarHiddenStateFromOtherNavigationController:v87];
    [v87 _resetBottomBarHiddenState];
    [(UITabBarController *)self _showBarWithTransition:0 isExplicit:0 reason:2];
  }
  if (v90) {
    [(UIViewController *)v90 _updateBottomBarHiddenState];
  }
  if (!v110 && ((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 <= 1)
  {
    if (v111 && ([v85 appearanceTransitionsAreDisabled] & 1) == 0)
    {
      objc_initWeak(location, v85);
      v114[0] = MEMORY[0x1E4F143A8];
      v114[1] = 3221225472;
      v114[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_5;
      v114[3] = &unk_1E52DC308;
      objc_copyWeak(&v115, location);
      [v85 setAfterAppearanceBlock:v114];
      if (+[UIViewController _shouldDeferTransitions]) {
        [(id)UIApp _addAfterCACommitBlockForViewController:v85];
      }
      else {
        [v85 _executeAfterAppearanceBlock];
      }
      objc_destroyWeak(&v115);
      objc_destroyWeak(location);
    }
    if (v88
      && [(UIViewController *)self _hasAppeared]
      && ![(UIViewController *)v88 appearanceTransitionsAreDisabled])
    {
      objc_initWeak(location, v88);
      v112[0] = MEMORY[0x1E4F143A8];
      v112[1] = 3221225472;
      v112[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_6;
      v112[3] = &unk_1E52DC308;
      objc_copyWeak(&v113, location);
      [(UIViewController *)v88 setAfterAppearanceBlock:v112];
      if (+[UIViewController _shouldDeferTransitions]) {
        [(id)UIApp _addAfterCACommitBlockForViewController:v88];
      }
      else {
        [(UIViewController *)v88 _executeAfterAppearanceBlock];
      }
      objc_destroyWeak(&v113);
      objc_destroyWeak(location);
    }
  }
  if ((v102 & 1) == 0) {
    -[UIViewController _invalidatePreferences:excluding:](self, -1, 0);
  }
  if (!v110)
  {
    unint64_t v91 = __UILogGetCategoryCachedImpl("UITabBarController", &qword_1EB25E640);
    v92 = *(id *)(v91 + 8);
    os_signpost_id_t v93 = os_signpost_id_make_with_pointer(*(os_log_t *)(v91 + 8), self);
    if (v93 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v94 = v93;
      if (os_signpost_enabled(v92))
      {
        LOWORD(location[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_1853B0000, v92, OS_SIGNPOST_INTERVAL_END, v94, "SwitchTabs", "", (uint8_t *)location, 2u);
      }
    }
  }
  _Block_object_dispose(buf, 8);

LABEL_111:
}

- (void)_layoutViewController:(id)a3
{
  id v14 = (UIViewController *)a3;
  id v4 = [(UITabBarController *)self _viewForViewController:v14];
  uint64_t v5 = +[UIViewControllerWrapperView existingWrapperViewForView:]((uint64_t)UIViewControllerWrapperView, v4);
  [(UITabBarController *)self _frameForWrapperViewForViewController:v14];
  objc_msgSend(v5, "setFrame:");
  [(UITabBarController *)self _frameForViewController:v14];
  objc_msgSend(v4, "setFrame:");
  BOOL v6 = [(UIViewController *)v14 view];

  if (v4 != v6)
  {
    [v4 frame];
    double v8 = v7;
    [v4 frame];
    double v10 = v9;
    id v11 = [(UIViewController *)v14 view];
    objc_msgSend(v11, "setFrame:", 0.0, 0.0, v8, v10);
  }
  BOOL v12 = [(UIViewController *)v14 _bottomBarInsetGuideConstraint];

  if (v12)
  {
    BOOL v13 = [(UIViewController *)v14 view];
    [v13 layoutIfNeeded];
  }
  if (self->_selectedViewController == v14) {
    [(UITabBarController *)self _compatibility_updateViewController:v14 forTabBarObservedScrollView:0];
  }
}

- (id)_viewForViewController:(id)a3
{
  return (id)[a3 view];
}

- (CGRect)_frameForWrapperViewForViewController:(id)a3
{
  uint64_t v3 = [(UITabBarController *)self _transitionView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)_transitionView
{
  return self->_viewControllerTransitionView;
}

- (CGRect)_frameForViewController:(id)a3
{
  id v4 = a3;
  [(UIView *)self->_viewControllerTransitionView bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(UIViewController *)self _statusBarHeightForCurrentInterfaceOrientation];
  double v14 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int64_t v15 = [(UITabBarController *)self _effectiveTabBarPosition];
    BOOL v16 = [(UITabBar *)self->_tabBar _isTranslucent];
    uint64_t v17 = [v4 edgesForExtendedLayout];
    if ([(UIView *)self->_tabBar isHidden])
    {
      int v18 = 0;
    }
    else
    {
      uint64_t v19 = 4;
      if (v15 == 2) {
        uint64_t v19 = 1;
      }
      BOOL v20 = (v17 & v19) == 0;
      int v18 = v20;
      char v21 = v20 || v16;
      if ((v21 & 1) == 0) {
        int v18 = [v4 extendedLayoutIncludesOpaqueBars] ^ 1;
      }
    }
    int v22 = [(UIView *)self->_tabBar isHidden] | v18;
    if ((v18 & 1) != 0 || (double v23 = 0.0, !v22))
    {
      -[UITabBar sizeThatFits:](self->_tabBar, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v23 = v24;
    }
    if ([(UITabBarController *)self _isModernTVTabBar]) {
      double v23 = 157.0;
    }
    if (v18)
    {
      double v6 = v6 + 0.0;
      double v12 = v12 - (v23 + 0.0);
      if ([(UITabBarController *)self _effectiveTabBarPosition] == 2) {
        double v8 = v8 + v23;
      }
      else {
        double v8 = v8 + 0.0;
      }
    }
    if ([(id)objc_opt_class() _directlySetsContentOverlayInsetsForChildren])
    {
      double v25 = -0.0;
      if (v22) {
        double v26 = -0.0;
      }
      else {
        double v26 = v23;
      }
      if (v15 == 2) {
        double v25 = v26;
      }
      double v27 = v14 + v25;
      if (v15 == 2) {
        int v28 = 1;
      }
      else {
        int v28 = v22;
      }
      if (v28) {
        double v29 = 0.0;
      }
      else {
        double v29 = v23;
      }
      objc_msgSend(v4, "_setContentOverlayInsets:andLeftMargin:rightMargin:", v27, 0.0, v29, 0.0, -1.79769313e308, -1.79769313e308);
    }
  }
  -[_UITabBarControllerVisualStyle adjustedContentViewFrame:viewController:](self->_visualStyle, "adjustedContentViewFrame:viewController:", v4, v6, v8, v10, v12);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  double v38 = v31;
  double v39 = v33;
  double v40 = v35;
  double v41 = v37;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (void)_compatibility_updateViewController:(id)a3 forTabBarObservedScrollView:(id)a4
{
  id v12 = a4;
  if ([(_UITabBarControllerVisualStyle *)self->_visualStyle isScrollViewObservationInCompatibilityMode])
  {
    if (_UIViewControllerUseContentScrollViewAPI())
    {
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"UITabBarController.m" lineNumber:1800 description:@"Invalid code path for new API. This is a UIKit problem."];
    }
    id v6 = v12;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);
    if (WeakRetained)
    {
      double v8 = WeakRetained;
      id v9 = objc_loadWeakRetained((id *)&self->_observingScrollView);

      if (v9 != v6)
      {
        id v10 = objc_loadWeakRetained((id *)&self->_observingScrollView);
        [v10 _removeScrollViewScrollObserver:self];
      }
    }
    objc_storeWeak((id *)&self->_observingScrollView, v6);
    if (v6) {
      [v6 _addScrollViewScrollObserver:self];
    }
    [(_UITabBarControllerVisualStyle *)self->_visualStyle adjustTabBarForContentScrollView:v6];
  }
}

- (BOOL)_isModernTVTabBar
{
  return 0;
}

- (void)_updateLayoutForStatusBarAndInterfaceOrientation
{
  id v3 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  [v3 _updateLayoutForStatusBarAndInterfaceOrientation];
  if (([(id)objc_opt_class() _directlySetsContentOverlayInsetsForChildren] & 1) == 0)
  {
    [(UIViewController *)self _updateContentOverlayInsetsFromParentIfNecessary];
    [v3 _updateContentOverlayInsetsFromParentIfNecessary];
  }
  [(UITabBarController *)self _layoutViewController:v3];
}

+ (BOOL)_directlySetsContentOverlayInsetsForChildren
{
  return dyld_program_sdk_at_least() ^ 1;
}

- (void)_selectDefaultViewControllerIfNecessaryWithAppearanceTransitions:(BOOL)a3
{
  double v5 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  if (v5)
  {
  }
  else
  {
    id v10 = [(UITabBarController *)self viewControllers];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      id v12 = [(UITabBarController *)self viewControllers];
      double v13 = [v12 objectAtIndex:0];

      if (!a3) {
        [v13 setAppearanceTransitionsAreDisabled:1];
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __87__UITabBarController__selectDefaultViewControllerIfNecessaryWithAppearanceTransitions___block_invoke;
      v20[3] = &unk_1E52D9F98;
      v20[4] = self;
      id v14 = v13;
      id v21 = v14;
      +[UIView performWithoutAnimation:v20];
      if (!a3) {
        [v14 setAppearanceTransitionsAreDisabled:0];
      }

      return;
    }
  }
  id v6 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  if (!v6) {
    return;
  }
  double v7 = v6;
  if ((*(unsigned char *)&self->_tabBarControllerFlags & 0x40) != 0)
  {
  }
  else
  {
    double v8 = [(UITabBarController *)self _selectedViewControllerInTabBar];
    id v9 = [v8 _existingView];

    if (v9) {
      return;
    }
  }
  int64_t v15 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  id v19 = [(UITabBarController *)self _wrapperViewForViewController:v15];

  BOOL v16 = [(UITabBarController *)self _transitionView];
  [v16 transition:0 toView:v19];

  if ((*(unsigned char *)&self->_tabBarControllerFlags & 0x40) != 0)
  {
    [(UITabBarController *)self _rebuildTabBarItemsIfNeeded];
    uint64_t v17 = [(UITabBarController *)self _selectedViewControllerInTabBar];
    int v18 = [v17 tabBarItem];
    [(UITabBarController *)self _setSelectedTabBarItem:v18];

    *(_DWORD *)&self->_tabBarControllerFlags &= ~0x40u;
  }
}

- (NSUInteger)selectedIndex
{
  if (self->_transientViewController) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v4 = [(UITabBarController *)self selectedViewController];
  double v5 = [(UITabBarController *)self _existingMoreNavigationController];
  if (v4 == v5)
  {
    NSUInteger v2 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v6 = [(UITabBarController *)self _viewControllersInTabBar];
    NSUInteger v2 = [v6 indexOfObjectIdenticalTo:v4];
  }
  double v7 = [(UITabBarController *)self _existingMoreNavigationController];

  if (v4 != v7 && v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [(NSMutableArray *)self->_moreChildViewControllers indexOfObjectIdenticalTo:v4];
    NSUInteger v2 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v2 = v8 + [(UITabBarController *)self _effectiveMaxItems] - 1;
    }
  }

  return v2;
}

- (UIViewController)selectedViewController
{
  id v3 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  id v4 = [(UITabBarController *)self _existingMoreNavigationController];
  if (v3 == v4)
  {
    uint64_t v5 = [v3 displayedViewController];

    id v3 = (void *)v5;
  }

  return (UIViewController *)v3;
}

- (id)_selectedViewControllerInTabBar
{
  transientViewController = self->_transientViewController;
  if (!transientViewController) {
    transientViewController = self->_selectedViewController;
  }
  return transientViewController;
}

- (id)_existingMoreNavigationController
{
  if (*(unsigned char *)&self->_tabBarControllerFlags) {
    NSUInteger v2 = self->_moreNavigationController;
  }
  else {
    NSUInteger v2 = 0;
  }
  return v2;
}

- (id)allViewControllers
{
  id v3 = [(UIViewController *)self mutableChildViewControllers];
  if ([(NSMutableArray *)self->_moreChildViewControllers count])
  {
    id v4 = (void *)[v3 mutableCopy];
    id v5 = v4;
    moreNavigationController = self->_moreNavigationController;
    if (moreNavigationController)
    {
      double v7 = [v4 lastObject];

      if (moreNavigationController != v7) {
        [v5 addObject:self->_moreNavigationController];
      }
    }
    [v5 addObjectsFromArray:self->_moreChildViewControllers];
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

- (void)_setSelectedTabBarItem:(id)a3
{
  id v4 = a3;
  id v5 = [(UITabBarController *)self tabBar];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__UITabBarController__setSelectedTabBarItem___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[UITabBar _performWhileIgnoringLock:]((uint64_t)v5, v7);
}

- (void)transitionViewDidStart:(id)a3
{
  id v4 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  if (v4)
  {
    id v5 = v4;
    [v4 _prepareForContainerTransition:self];
    id v4 = v5;
  }
}

- (void)transitionViewDidComplete:(id)a3 fromView:(id)a4 toView:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  if (self->_viewControllerTransitionView == a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [(UIViewController *)self view];
      char v10 = [v12 isDescendantOfView:v9];

      if (v12 != v8 && (v10 & 1) == 0) {
        -[UIViewControllerWrapperView unwrapView](v12);
      }
    }
    if ((*((unsigned char *)&self->_tabBarControllerFlags + 1) & 0x10) != 0)
    {
      uint64_t v11 = [(UIViewController *)self view];
      [v11 setNeedsLayout];
    }
  }
}

- (void)set_shouldFocusViewControllerAfterTransition:(BOOL)a3
{
  self->__shouldFocusViewControllerAfterTransition = a3;
}

- (id)_wrapperViewForViewController:(id)a3
{
  id v4 = a3;
  [(UITabBarController *)self _frameForWrapperViewForViewController:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(UITabBarController *)self _viewForViewController:v4];
  [v13 frame];
  int v18 = +[UIViewControllerWrapperView wrapperViewForView:wrapperFrame:viewFrame:](v6, v8, v10, v12, v14, v15, v16, v17, (uint64_t)UIViewControllerWrapperView, v13);
  [(UITabBarController *)self _layoutViewController:v4];

  return v18;
}

void __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endAppearanceTransition];
  if (([WeakRetained _containsFirstResponder] & 1) == 0) {
    [WeakRetained _viewControllerWasSelected];
  }
}

- (void)setTabBar:(id)a3
{
  double v5 = (UITabBar *)a3;
  p_tabBar = &self->_tabBar;
  tabBar = self->_tabBar;
  if (tabBar != v5)
  {
    double v8 = v5;
    [(UITabBar *)tabBar setLocked:0];
    [(UITabBar *)*p_tabBar setDelegate:0];
    [(UIView *)*p_tabBar removeFromSuperview];
    objc_storeStrong((id *)&self->_tabBar, a3);
    *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20u;
    [(UITabBarController *)self _prepareTabBar];
    double v5 = v8;
  }
}

- (BOOL)showsEditButtonOnLeft
{
  return (*(unsigned char *)&self->_tabBarControllerFlags >> 4) & 1;
}

- (id)transitionCoordinator
{
  id v3 = [(UITabBarController *)self _animator];

  if (v3)
  {
    id v4 = [(UITabBarController *)self _animator];
    double v5 = +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:v4];

    double v6 = [v5 _transitionCoordinator];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITabBarController;
    double v6 = [(UIViewController *)&v8 transitionCoordinator];
  }
  return v6;
}

- (UIViewControllerAnimatedTransitioning)_animator
{
  return self->__animator;
}

- (void)setRestorationIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITabBarController;
  [(UIResponder *)&v4 setRestorationIdentifier:a3];
  [(UITabBarController *)self _setMoreNavigationControllerRestorationIdentifier];
}

- (void)_setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v73 = a4;
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(_UITabBarControllerVisualStyle *)self->_visualStyle willUpdateViewControllers];
  v80 = self;
  double v6 = [(UIViewController *)self mutableChildViewControllers];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v92 objects:v98 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v93 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v92 + 1) + 8 * i) _setViewHostsLayoutEngine:1];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v92 objects:v98 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [(UITabBarController *)v80 transientViewController];
  v72 = (void *)v12;
  if (v12)
  {
    uint64_t v13 = [v7 indexOfObject:v12];
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = v13;
      double v15 = (void *)[v7 mutableCopy];
      [v15 removeObjectAtIndex:v14];

      id v7 = v15;
    }
    p_isa = (id *)&v80->super.super.super.isa;
    [(UITabBarController *)v80 setTransientViewController:0 animated:0];
    BOOL v73 = 0;
  }
  else
  {
    p_isa = (id *)&v80->super.super.super.isa;
  }
  uint64_t v17 = [p_isa selectedViewController];
  v71 = (void *)v17;
  if (v17) {
    int v70 = [p_isa[142] containsObject:v17];
  }
  else {
    int v70 = 0;
  }
  unint64_t v69 = [p_isa selectedIndex];
  if (!p_isa[136])
  {
    int v18 = [p_isa traitCollection];
    [p_isa _updateVisualStyleForTraitCollection:v18];
  }
  unint64_t v19 = [v6 count];
  unint64_t v77 = [p_isa[142] count];
  unint64_t v20 = [p_isa _effectiveMaxItems];
  if ([p_isa[136] supportsShowingMoreItem]) {
    BOOL v21 = [v7 count] > v20;
  }
  else {
    BOOL v21 = 0;
  }
  if (![(_UITabBarControllerVisualStyle *)v80->_visualStyle supportsShowingMoreItem]
    && [v7 count] > v20)
  {
    int v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    double v23 = [NSNumber numberWithUnsignedInteger:v20];
    NSLog(&cfstr_IsTryingToSetV.isa, v80, v22, v23);
  }
  v79 = v6;
  long long v90 = 0u;
  long long v91 = 0u;
  unint64_t v75 = v20 - 1;
  if (v21) {
    unint64_t v24 = v20 - 1;
  }
  else {
    unint64_t v24 = v20;
  }
  long long v88 = 0uLL;
  long long v89 = 0uLL;
  obuint64_t j = v7;
  uint64_t v25 = [obj countByEnumeratingWithState:&v88 objects:v97 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    unint64_t v27 = 0;
    unint64_t v28 = 0;
    uint64_t v29 = *(void *)v89;
    unint64_t v74 = 1 - v20;
    double v30 = v80;
    uint64_t v76 = *(void *)v89;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v89 != v29) {
          objc_enumerationMutation(obj);
        }
        unint64_t v32 = v28 + v31;
        double v33 = *(void **)(*((void *)&v88 + 1) + 8 * v31);
        if (v28 + v31 >= v24)
        {
          if (v32 < v19 && !(v74 + v28 + v31))
          {
            double v37 = [v79 objectAtIndex:v75];
            [v79 removeObjectAtIndex:v75];
            if ([v79 indexOfObjectIdenticalTo:v37] == 0x7FFFFFFFFFFFFFFFLL)
            {
              [v37 willMoveToParentViewController:0];
              [(UIViewController *)v80 _removeChildViewController:v37];
              [v37 didMoveToParentViewController:0];
            }

            double v30 = v80;
            uint64_t v29 = v76;
          }
          moreChildViewControllers = v30->_moreChildViewControllers;
          if (v27 >= v77) {
            [(NSMutableArray *)moreChildViewControllers addObject:v33];
          }
          else {
            [(NSMutableArray *)moreChildViewControllers replaceObjectAtIndex:v27 withObject:v33];
          }
          ++v27;
        }
        else if (v32 >= v19)
        {
          [(UIMoreNavigationController *)v30->_moreNavigationController restoreOriginalNavigationControllerIfNecessary:*(void *)(*((void *)&v88 + 1) + 8 * v31)];
          double v39 = [v33 parentViewController];

          BOOL v40 = v39 == v80;
          double v30 = v80;
          if (v40)
          {
            [v79 addObject:v33];
          }
          else
          {
            [(UIViewController *)v80 addChildViewController:v33];
            [v33 didMoveToParentViewController:v80];
          }
        }
        else
        {
          double v34 = [v79 objectAtIndex:v28 + v31];
          if (v33 != v34)
          {
            [v79 replaceObjectAtIndex:v28 + v31 withObject:v33];
            [(UIMoreNavigationController *)v80->_moreNavigationController restoreOriginalNavigationControllerIfNecessary:v33];
            if ([obj indexOfObjectIdenticalTo:v34] == 0x7FFFFFFFFFFFFFFFLL) {
              [(UIViewController *)v80 _removeChildViewController:v34];
            }
            double v35 = [v33 parentViewController];

            if (v35 != v80)
            {
              double v36 = [v33 parentViewController];

              if (v36)
              {
                [v33 willMoveToParentViewController:0];
                [v33 removeFromParentViewController];
              }
              [v33 willMoveToParentViewController:v80];
              [(UIViewController *)v80 _addChildViewController:v33];
              [v33 didMoveToParentViewController:v80];
            }
          }

          double v30 = v80;
          uint64_t v29 = v76;
        }
        ++v31;
      }
      while (v26 != v31);
      uint64_t v41 = [obj countByEnumeratingWithState:&v88 objects:v97 count:16];
      uint64_t v26 = v41;
      v28 += v31;
    }
    while (v41);
  }
  else
  {
    unint64_t v27 = 0;
    unint64_t v28 = 0;
    double v30 = v80;
  }

  if (v28 < v19 && v28 < v24)
  {
    do
    {
      v42 = [v79 objectAtIndex:v28];
      [v79 removeObjectAtIndex:v28];
      if ([v79 indexOfObjectIdenticalTo:v42] == 0x7FFFFFFFFFFFFFFFLL)
      {
        [v42 willMoveToParentViewController:0];
        [(UIViewController *)v30 _removeChildViewController:v42];
        [v42 didMoveToParentViewController:0];
      }
      --v19;
    }
    while (v28 < v19);
  }
  unint64_t v43 = v77 - v27;
  if (v77 > v27) {
    -[NSMutableArray removeObjectsInRange:](v30->_moreChildViewControllers, "removeObjectsInRange:", v27, v43);
  }
  -[UITabBarController _rebuildTabModelAnimated:](v30, "_rebuildTabModelAnimated:", v73, v43);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v44 = v30->_moreChildViewControllers;
  uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v84 objects:v96 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v85;
    do
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v85 != v47) {
          objc_enumerationMutation(v44);
        }
        [v79 removeObject:*(void *)(*((void *)&v84 + 1) + 8 * j)];
      }
      uint64_t v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v84 objects:v96 count:16];
    }
    while (v46);
  }

  v49 = [(UITabBarController *)v30 _viewControllersInTabBar];
  uint64_t v50 = [v49 count];
  BOOL v51 = v71;
  if (!v71 || !v50)
  {
    v53 = v72;
    if (!v50) {
      goto LABEL_117;
    }
    if (!v71)
    {
      uint64_t v54 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_85;
    }
LABEL_79:
    uint64_t v54 = [v49 indexOfObject:v71];
    if (v54 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v55 = v71;
      if ([(NSMutableArray *)v30->_moreChildViewControllers containsObject:v71]) {
        id v56 = v71;
      }
      else {
        id v56 = 0;
      }
      uint64_t v54 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_86;
    }
LABEL_85:
    id v56 = 0;
    v55 = v71;
    if (!v30)
    {
      char v57 = 1;
      tabModel = 0;
      goto LABEL_87;
    }
LABEL_86:
    char v57 = 0;
    tabModel = v30->_tabModel;
LABEL_87:
    uint64_t v59 = [(_UITabModel *)tabModel selectedItem];
    v60 = (void *)v59;
    if (v54 == 0x7FFFFFFFFFFFFFFFLL && v59)
    {
      if (v57) {
        v61 = 0;
      }
      else {
        v61 = v30->_tabModel;
      }
      v62 = [(_UITabModel *)v61 tabItems];
      uint64_t v54 = [v62 indexOfObject:v60];

      double v30 = v80;
    }
    if (v56)
    {
      BOOL v51 = v55;
    }
    else
    {
      BOOL v51 = v55;
      if (v54 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v54 = v69;
        if (v69 >= [v49 count])
        {
          uint64_t v54 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_103:
          if (v70)
          {
            selectedViewController = v30->_selectedViewController;
            v30->_selectedViewController = 0;
          }
          id v56 = 0;
          goto LABEL_106;
        }
        id v56 = [(UITabBarController *)v30 _viewControllerForSelectAtIndex:v69];
      }
      if (!v56) {
        goto LABEL_103;
      }
    }
    int v63 = [(NSMutableArray *)v30->_moreChildViewControllers containsObject:v56];
    v64 = v30;
    char v65 = v63;
    if (v70 == v63)
    {
      if (!v63) {
        goto LABEL_101;
      }
    }
    else
    {
      v66 = v64->_selectedViewController;
      v64->_selectedViewController = 0;

      if ((v65 & 1) == 0)
      {
LABEL_101:
        double v30 = v80;
LABEL_106:
        if (v54 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v68 = 0;
        }
        else {
          uint64_t v68 = v54;
        }
        if (v73)
        {
          [(UITabBarController *)v30 setSelectedIndex:v68];
        }
        else
        {
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __51__UITabBarController__setViewControllers_animated___block_invoke_2;
          v81[3] = &unk_1E52D9CD0;
          v81[4] = v30;
          v81[5] = v68;
          +[UIView performWithoutAnimation:v81];
        }
        goto LABEL_116;
      }
    }
    if (v73)
    {
      double v30 = v80;
      [(UITabBarController *)v80 setSelectedViewController:v56];
    }
    else
    {
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __51__UITabBarController__setViewControllers_animated___block_invoke;
      v82[3] = &unk_1E52D9F98;
      double v30 = v80;
      v82[4] = v80;
      id v56 = v56;
      id v83 = v56;
      +[UIView performWithoutAnimation:v82];
    }
LABEL_116:

    goto LABEL_117;
  }
  uint64_t v52 = [(UITabBarController *)v30 _existingMoreNavigationController];

  v53 = v72;
  if (v71 != v52) {
    goto LABEL_79;
  }
LABEL_117:
  [(UITabBarController *)v30 setCustomizableViewControllers:obj];
  if (v53) {
    [(UITabBarController *)v30 setTransientViewController:v53 animated:0];
  }
}

- (void)_rebuildTabBarItemsAnimated:(BOOL)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  $BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = self->_tabBarControllerFlags;
  if ((*(_WORD *)&tabBarControllerFlags & 0x8000) != 0)
  {
    -[UITabBarController _tabs_rebuildTabBarItemsAnimated:](self, "_tabs_rebuildTabBarItemsAnimated:");
  }
  else if ((*(unsigned char *)&tabBarControllerFlags & 2) != 0)
  {
    -[UITabBarController _rebuildTabModelAnimated:](self, "_rebuildTabModelAnimated:");
  }
  else
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([(_UITabBarControllerVisualStyle *)self->_visualStyle supportsShowingMoreItem]) {
      BOOL v5 = [(NSMutableArray *)self->_moreChildViewControllers count] != 0;
    }
    else {
      BOOL v5 = 0;
    }
    self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFFFC | v5);
    double v6 = [(UITabBarController *)self _viewControllersInTabBar];
    unint64_t v7 = [(UITabBarController *)self _effectiveMaxItems];
    $BD46499A0F4D7D3F2887BDC393DB39C9 v8 = self->_tabBarControllerFlags;
    uint64_t v9 = [v6 count];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      unint64_t v13 = 0;
      unint64_t v14 = v7 - (*(unsigned char *)&v8 & 1);
      uint64_t v15 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v10);
          }
          uint64_t v17 = *(UIViewController **)(*((void *)&v33 + 1) + 8 * i);
          if (v17 != self->_transientViewController || v9 == 1)
          {
            if (v13 < v14)
            {
              unint64_t v19 = [(UIViewController *)v17 tabBarItem];
              [(UITabBarController *)self _configureTargetActionForTabBarItem:v19];
              [v29 addObject:v19];
            }
            ++v13;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v12);
    }

    if (*(unsigned char *)&self->_tabBarControllerFlags)
    {
      p_isa = [(UITabBarController *)self moreNavigationController];
      -[UIViewController _parentViewController](p_isa);
      double v23 = (UITabBarController *)objc_claimAutoreleasedReturnValue();

      int v22 = v29;
      if (v23 != self)
      {
        [(UIViewController *)self addChildViewController:p_isa];
        [p_isa didMoveToParentViewController:self];
      }
      unint64_t v24 = (void *)[(NSMutableArray *)self->_moreChildViewControllers copy];
      [p_isa setMoreViewControllers:v24];
      uint64_t v25 = [p_isa tabBarItem];
      [(UITabBarController *)self _configureTargetActionForTabBarItem:v25];
      [v29 addObject:v25];

      BOOL v21 = a3;
    }
    else
    {
      [(UIMoreNavigationController *)self->_moreNavigationController _restoreOriginalNavigationController];
      p_isa = (id *)&self->_moreNavigationController->super.super.super.super.isa;
      self->_moreNavigationController = 0;
      BOOL v21 = a3;
      int v22 = v29;
    }

    uint64_t v26 = [(UITabBarController *)self tabBar];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __50__UITabBarController__rebuildTabBarItemsAnimated___block_invoke;
    v30[3] = &unk_1E52DC3D0;
    v30[4] = self;
    id v31 = v22;
    BOOL v32 = v21;
    id v27 = v22;
    -[UITabBar _performWhileIgnoringLock:]((uint64_t)v26, v30);

    [(UIView *)self->_containerView setNeedsLayout];
  }
}

- (id)_viewControllerForSelectAtIndex:(unint64_t)a3
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL || self->_transientViewController == 0)
  {
    unint64_t v4 = a3;
    unint64_t v6 = [(UITabBarController *)self _effectiveMaxItems];
    if (v4 + 2 > v6 && (*(unsigned char *)&self->_tabBarControllerFlags & 1) != 0)
    {
      unint64_t v4 = v4 - v6 + 1;
      unint64_t v7 = self->_moreChildViewControllers;
    }
    else
    {
      unint64_t v7 = [(UITabBarController *)self _viewControllersInTabBar];
    }
    uint64_t v9 = v7;
    if (v4 == 0x7FFFFFFFFFFFFFFFLL || v4 >= [(NSMutableArray *)v7 count])
    {
      $BD46499A0F4D7D3F2887BDC393DB39C9 v8 = 0;
    }
    else
    {
      $BD46499A0F4D7D3F2887BDC393DB39C9 v8 = [(NSMutableArray *)v9 objectAtIndex:v4];
    }
  }
  else
  {
    $BD46499A0F4D7D3F2887BDC393DB39C9 v8 = 0;
  }
  return v8;
}

- (unint64_t)_effectiveMaxItems
{
  unint64_t customMaxItems = self->_customMaxItems;
  if (!customMaxItems) {
    return self->_defaultMaxItems;
  }
  return customMaxItems;
}

void __47__UITabBarController__rebuildTabModelAnimated___block_invoke(uint64_t a1)
{
  NSUInteger v2 = [*(id *)(a1 + 32) array];
  id v3 = *(void **)(a1 + 40);
  if (v3) {
    id v3 = (void *)v3[145];
  }
  unint64_t v4 = v3;
  id v5 = [v4 tabItems];
  id v6 = v2;
  unint64_t v7 = v6;
  if (v5 == v6)
  {
    char v8 = 0;
  }
  else
  {
    char v8 = 1;
    if (v6 && v5) {
      char v8 = [v5 isEqual:v6] ^ 1;
    }
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__UITabBarController__rebuildTabModelAnimated___block_invoke_2;
  aBlock[3] = &unk_1E52E5B08;
  void aBlock[4] = *(void *)(a1 + 40);
  id v9 = v7;
  id v13 = v9;
  char v16 = v8;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = v10;
  if (*(unsigned char *)(a1 + 64)) {
    (*((void (**)(void *))v10 + 2))(v10);
  }
  else {
    +[UIView performWithoutAnimation:v10];
  }
}

- (id)transientViewController
{
  return self->_transientViewController;
}

- (void)setCustomizableViewControllers:(NSArray *)customizableViewControllers
{
  if (self->_customizableViewControllers != customizableViewControllers)
  {
    unint64_t v4 = customizableViewControllers;
    id v5 = (NSArray *)[(NSArray *)v4 copy];
    id v6 = self->_customizableViewControllers;
    self->_customizableViewControllers = v5;

    uint64_t v7 = [(NSArray *)v4 count];
    id v8 = [(UITabBarController *)self _existingMoreNavigationController];
    [v8 setAllowsCustomizing:v7 != 0];
  }
}

- (BOOL)_isTabBarController
{
  return 1;
}

- (UITabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)UITabBarController;
  unint64_t v4 = [(UIViewController *)&v10 initWithNibName:a3 bundle:a4];
  id v5 = v4;
  if (v4)
  {
    [(UITabBarController *)v4 _configureTabModel];
    id v6 = [(UIViewController *)v5 traitCollection];
    v5->_defaultMaxItems = _UITabBarDefaultMaxItemsForTraitCollection(v6);

    uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    moreChildViewControllers = v5->_moreChildViewControllers;
    v5->_moreChildViewControllers = v7;

    [(UIViewController *)v5 setContainmentSupport:0];
    [(UITabBarController *)v5 loadView];
    [(UITabBarController *)v5 viewDidLoad];
  }
  return v5;
}

- (void)loadView
{
  [(UITabBarController *)self _layoutContainerView];
  visualStyle = self->_visualStyle;
  [(_UITabBarControllerVisualStyle *)visualStyle updateGestureRecognizers];
}

- (void)_configureTabModel
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(_UITabModel);
  tabModel = self->_tabModel;
  self->_tabModel = v3;

  [(_UITabModel *)self->_tabModel setTabBarController:self];
  v7[0] = 0x1ED3F5A90;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v6 = [(UIViewController *)self _registerForTraitTokenChanges:v5 withTarget:self action:sel__validateTabSelectionIfNeeded];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)UITabBarController;
  [(UIViewController *)&v4 viewDidLoad];
  if ([(_UITabBarControllerVisualStyle *)self->_visualStyle prefersTabBarFocusedOnViewDidLoad])
  {
    int v3 = 512;
  }
  else
  {
    int v3 = 0;
  }
  self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFDFF | v3);
  [(_UITabBarControllerVisualStyle *)self->_visualStyle viewDidLoad];
}

- (void)setSelectedViewController:(UIViewController *)selectedViewController
{
  id v6 = selectedViewController;
  objc_super v4 = [(UITabBarController *)self allViewControllers];
  char v5 = [v4 containsObject:v6];

  if (v5) {
    [(UITabBarController *)self _setSelectedViewController:v6];
  }
  else {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"-[UITabBarController setSelectedViewController:] only a view controller in the tab bar controller's list of view controllers can be selected."];
  }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
  if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL || self->_transientViewController == 0)
  {
    [(UITabBarController *)self setTransientViewController:0];
    id v6 = [(UITabBarController *)self _viewControllerForSelectAtIndex:selectedIndex];
    if (v6)
    {
      uint64_t v7 = v6;
      [(UITabBarController *)self _setSelectedViewController:v6];
      id v6 = v7;
    }
  }
}

- (void)_setSelectedViewController:(id)a3
{
}

- (void)setTransientViewController:(id)a3
{
}

- (void)setTransientViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = (UIViewController *)a3;
  if (v8 && (*(_DWORD *)&self->_tabBarControllerFlags & 0x8000) != 0)
  {
    int v18 = v8;
    char v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"UITabBarController.m" lineNumber:4660 description:@"transientViewController isn't support with UITab."];

    id v8 = v18;
  }
  p_transientViewController = (id *)&self->_transientViewController;
  if (self->_transientViewController != v8)
  {
    uint64_t v17 = v8;
    objc_super v10 = (void *)_UISetCurrentFallbackEnvironment(self);
    if (v4) {
      uint64_t v11 = 6;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = *p_transientViewController;
    if (v17)
    {
      if (v12)
      {
        [v12 willMoveToParentViewController:0];
        [*p_transientViewController removeFromParentViewController];
      }
      objc_storeStrong((id *)&self->_transientViewController, a3);
      [(UIViewController *)self addChildViewController:*p_transientViewController];
      [*p_transientViewController setNeedsDidMoveCleanup:1];
      [(UITabBarController *)self concealTabBarSelection];
      [(UITabBarController *)self transitionFromViewController:self->_selectedViewController toViewController:*p_transientViewController transition:v11 shouldSetSelected:0];
      id v13 = [(_UITabBarControllerVisualStyle *)self->_visualStyle viewControllerForObservableScrollViewFromViewController:v17];
      objc_msgSend(v13, "_contentOrObservableScrollViewForEdge:", -[UITabBarController _relevantEdgeForScrollViewObservation](self, "_relevantEdgeForScrollViewObservation"));
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      [(UITabBarController *)self _updateAndObserveScrollView:v14 viewController:v13];
    }
    else
    {
      id *p_transientViewController = 0;
      id v14 = v12;

      id v13 = [(_UITabBarControllerVisualStyle *)self->_visualStyle viewControllerForObservableScrollViewFromViewController:v14];
      id v15 = [v13 _contentOrObservableScrollViewForEdge:4];
      [(UITabBarController *)self _stopObservingScrollView:v15];

      [(UITabBarController *)self revealTabBarSelection];
      [v14 willMoveToParentViewController:0];
      [(UITabBarController *)self transitionFromViewController:v14 toViewController:self->_selectedViewController transition:v11 shouldSetSelected:0];
      [v14 removeFromParentViewController];
    }

    _UIRestorePreviousFallbackEnvironment(v10);
    id v8 = v17;
  }
}

- (void)_rebuildTabModelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  $BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = self->_tabBarControllerFlags;
  if ((*(_WORD *)&tabBarControllerFlags & 0x8000) != 0)
  {
    visualStyle = self->_visualStyle;
    -[_UITabBarControllerVisualStyle updateViewControllers:](visualStyle, "updateViewControllers:");
  }
  else
  {
    self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&tabBarControllerFlags & 0xFFFFFFFD);
    id v6 = [(UITabBarController *)self viewControllers];
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(UIViewController **)(*((void *)&v27 + 1) + 8 * i);
          if (v13 != self->_transientViewController)
          {
            id v14 = [(UIViewController *)v13 _resolvedTab];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v10);
    }

    id v15 = [(UITabBarController *)self selectedViewController];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __47__UITabBarController__rebuildTabModelAnimated___block_invoke;
    v21[3] = &unk_1E52E5B08;
    id v22 = v7;
    double v23 = self;
    id v24 = v15;
    id v25 = v8;
    BOOL v26 = v3;
    id v16 = v8;
    id v17 = v15;
    id v18 = v7;
    [(UITabBarController *)self _performWithoutNotifyingSelectionChange:v21];
    [(_UITabBarControllerVisualStyle *)self->_visualStyle updateViewControllers:v3];
    unint64_t v19 = [(UIViewController *)self _existingView];
    [v19 setNeedsLayout];
  }
}

- (NSArray)viewControllers
{
  if ((*((unsigned char *)&self->_tabBarControllerFlags + 1) & 0x80) != 0)
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v3 = [(UIViewController *)self mutableChildViewControllers];
    BOOL v4 = (void *)[v3 mutableCopy];

    if (self->_moreNavigationController) {
      objc_msgSend(v4, "removeObject:");
    }
    if ([(NSMutableArray *)self->_moreChildViewControllers count]) {
      [v4 addObjectsFromArray:self->_moreChildViewControllers];
    }
  }
  return (NSArray *)v4;
}

- (void)_setSelectedViewController:(id)a3 performUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = (UIViewController *)a3;
  uint64_t v9 = v8;
  if (v4)
  {
    transientViewController = self->_transientViewController;
    if (transientViewController) {
      BOOL v11 = transientViewController == v8;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11) {
      goto LABEL_39;
    }
    id v12 = (void *)_UISetCurrentFallbackEnvironment(self);
    if (self->_selectedViewController == v9)
    {
      if (![(UIViewController *)v9 _containsFirstResponder]) {
        [(UIViewController *)v9 _viewControllerWasSelected];
      }
    }
    else
    {
      [(UITabBarController *)self _rebuildTabBarItemsIfNeeded];
      if (*(unsigned char *)&self->_tabBarControllerFlags)
      {
        id v14 = [(UITabBarController *)self moreNavigationController];
        id v15 = [v14 moreViewControllers];
        int v16 = [v15 containsObject:v9];

        if (v16)
        {
          id v13 = v9;
          uint64_t v9 = v14;
        }
        else
        {
          id v13 = 0;
        }
      }
      else
      {
        id v13 = 0;
      }
      id v17 = [(UIViewController *)self view];
      id v18 = [(UIViewController *)self->_selectedViewController childModalViewController];
      selectedViewController = v18;
      if (!v18) {
        selectedViewController = self->_selectedViewController;
      }
      uint64_t v20 = [(UIViewController *)v9 childModalViewController];
      BOOL v21 = (void *)v20;
      if (v20) {
        uint64_t v22 = v20;
      }
      else {
        uint64_t v22 = (uint64_t)v9;
      }
      [(UITabBarController *)self transitionFromViewController:selectedViewController toViewController:v22];

      if (v13)
      {
        double v23 = [(UITabBarController *)self moreNavigationController];
        [v23 setDisplayedViewController:v13];
      }
      if ([(UITabBarController *)self _isModernTVTabBar])
      {
        if ([(UITabBarController *)self _shouldFocusViewControllerAfterTransition])
        {
          int v24 = 0;
        }
        else
        {
          int v24 = 512;
        }
        self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFDFF | v24);
      }
      [(UIViewController *)self setNeedsFocusUpdate];
      [(UIResponder *)self _didChangeDeepestActionResponder];
      if ([(UITabBarController *)self _notifySplitViewControllerForSelectionChange])
      {
        id v25 = [(UIViewController *)self _splitViewControllerEnforcingClass:1];
        [v25 _tabBarControllerDidChangeSelection:self];
      }
    }
    _UIRestorePreviousFallbackEnvironment(v12);
    [(id)UIApp _findBestActivityToMakeCurrent:self];
  }
  else
  {
    objc_storeStrong((id *)&self->_selectedViewController, a3);
  }
  if ((*((unsigned char *)&self->_tabBarControllerFlags + 1) & 0x80) == 0
    || ([(UITabBarController *)self _existingMoreNavigationController],
        BOOL v26 = (UIViewController *)objc_claimAutoreleasedReturnValue(),
        v26,
        v9 == v26))
  {
    uint64_t v27 = [(UIViewController *)v9 _resolvedTab];
  }
  else
  {
    uint64_t v27 = [(UIViewController *)v9 tab];
  }
  long long v28 = (void *)v27;
  if (!v27)
  {
    long long v30 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITabBarController.m", 2477, @"UITabBarController inconsistency; tried selecting a view controller without a valid tab: %@",
      v9);
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __64__UITabBarController__setSelectedViewController_performUpdates___block_invoke;
  v31[3] = &unk_1E52D9F98;
  v31[4] = self;
  id v32 = v28;
  id v29 = v28;
  [(UITabBarController *)self _performWithoutNotifyingSelectionChange:v31];
  [(_UITabBarControllerVisualStyle *)self->_visualStyle selectedViewControllerDidChange];

LABEL_39:
}

- (void)_performWithoutNotifyingSelectionChange:(id)a3
{
  *(_DWORD *)&self->_tabBarControllerFlags |= 0x4000u;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *(_DWORD *)&self->_tabBarControllerFlags &= ~0x4000u;
}

- (void)__viewWillLayoutSubviews
{
  [(UITabBarController *)self _layoutContainerView];
  [(UITabBarController *)self _rebuildTabBarItemsIfNeeded];
  [(UITabBarController *)self _selectDefaultViewControllerIfNecessaryWithAppearanceTransitions:1];
  id v3 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  [(UITabBarController *)self _layoutViewController:v3];
}

- (void)_rebuildTabBarItemsIfNeeded
{
  if ((*(unsigned char *)&self->_tabBarControllerFlags & 2) != 0)
  {
    if (!self->_visualStyle)
    {
      id v3 = [(UIViewController *)self traitCollection];
      [(UITabBarController *)self _updateVisualStyleForTraitCollection:v3];
    }
    [(UITabBarController *)self _rebuildTabModelAnimated:0];
    *(_DWORD *)&self->_tabBarControllerFlags &= ~2u;
  }
}

- (void)transitionFromViewController:(id)a3 toViewController:(id)a4
{
}

- (BOOL)_notifySplitViewControllerForSelectionChange
{
  return (*((unsigned __int8 *)&self->_tabBarControllerFlags + 1) >> 2) & 1;
}

- (UINavigationController)moreNavigationController
{
  moreNavigationController = self->_moreNavigationController;
  if (!moreNavigationController)
  {
    BOOL v4 = (UIMoreNavigationController *)objc_alloc_init((Class)[(id)objc_opt_class() _moreNavigationControllerClass]);
    char v5 = self->_moreNavigationController;
    self->_moreNavigationController = v4;

    id v6 = _UINSLocalizedStringWithDefaultValue(@"More", @"More");
    uint64_t v7 = [(UIMoreNavigationController *)self->_moreNavigationController moreListController];
    [v7 setTitle:v6];

    [(UITabBarController *)self _setMoreNavigationControllerRestorationIdentifier];
    [(UIMoreNavigationController *)self->_moreNavigationController setAllowsCustomizing:[(UITabBarController *)self _allowsCustomizing]];
    UISemanticContentAttribute v8 = [(UIView *)self->_tabBar semanticContentAttribute];
    uint64_t v9 = [(UIViewController *)self->_moreNavigationController view];
    [v9 setSemanticContentAttribute:v8];

    UISemanticContentAttribute v10 = [(UIView *)self->_tabBar semanticContentAttribute];
    BOOL v11 = [(UINavigationController *)self->_moreNavigationController topViewController];
    id v12 = [v11 view];
    [v12 setSemanticContentAttribute:v10];

    UISemanticContentAttribute v13 = [(UIView *)self->_tabBar semanticContentAttribute];
    id v14 = [(UINavigationController *)self->_moreNavigationController navigationBar];
    [v14 setSemanticContentAttribute:v13];

    moreNavigationController = self->_moreNavigationController;
  }
  return (UINavigationController *)moreNavigationController;
}

- (void)_tabs_rebuildTabBarItemsAnimated:(BOOL)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(_UITabBarControllerVisualStyle *)self->_visualStyle supportsShowingMoreItem]) {
    BOOL v6 = [(NSMutableArray *)self->_moreChildViewControllers count] != 0;
  }
  else {
    BOOL v6 = 0;
  }
  self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFFFC | v6);
  unint64_t v7 = [(UITabBarController *)self _effectiveMaxItems]
     - (*(_DWORD *)&self->_tabBarControllerFlags & 1);
  UISemanticContentAttribute v8 = [(UITabBarController *)self _tabs_compactTabs];
  [v8 count];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __55__UITabBarController__tabs_rebuildTabBarItemsAnimated___block_invoke;
  v25[3] = &unk_1E52E7F50;
  unint64_t v27 = v7;
  v25[4] = self;
  id v10 = v5;
  id v26 = v10;
  [v8 enumerateObjectsUsingBlock:v25];
  if ([(_UITabBarControllerVisualStyle *)self->_visualStyle supportsShowingMoreItem]
    && [(NSMutableArray *)self->_moreChildViewControllers count])
  {
    p_isa = [(UITabBarController *)self moreNavigationController];
    -[UIViewController _parentViewController](p_isa);
    id v12 = (UITabBarController *)objc_claimAutoreleasedReturnValue();

    if (v12 != self)
    {
      [(UIViewController *)self addChildViewController:p_isa];
      [p_isa didMoveToParentViewController:self];
    }
    UISemanticContentAttribute v13 = (void *)[(NSMutableArray *)self->_moreChildViewControllers copy];
    [p_isa setMoreViewControllers:v13];
    id v14 = [p_isa tabBarItem];
    [(UITabBarController *)self _configureTargetActionForTabBarItem:v14];
    [v10 addObject:v14];

    int v15 = 1;
  }
  else
  {
    [(UIMoreNavigationController *)self->_moreNavigationController _restoreOriginalNavigationController];
    int v15 = 0;
    p_isa = (id *)&self->_moreNavigationController->super.super.super.super.isa;
    self->_moreNavigationController = 0;
  }

  self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFFFC | v15);
  int v16 = [(UITabBarController *)self tabBar];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __55__UITabBarController__tabs_rebuildTabBarItemsAnimated___block_invoke_2;
  BOOL v21 = &unk_1E52DC3D0;
  uint64_t v22 = self;
  id v23 = v10;
  BOOL v24 = a3;
  id v17 = v10;
  -[UITabBar _performWhileIgnoringLock:]((uint64_t)v16, &v18);

  [(UIView *)self->_containerView setNeedsLayout];
}

- (id)_tabs_compactTabs
{
  NSUInteger v2 = self;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = &OBJC_IVAR___UITab__hiddenByDefault;
  if (self) {
    self = (UITabBarController *)self->_tabModel;
  }
  BOOL v4 = [(UITabBarController *)self tabItems];
  id v5 = [(UITabBarController *)v2 compactTabIdentifiers];
  if ([v5 count])
  {
    uint64_t v19 = v4;
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    obuint64_t j = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          BOOL v11 = v3;
          uint64_t v12 = v3[737];
          UISemanticContentAttribute v13 = [*(id *)((char *)&v2->super.super.super.isa + v12) tabItems];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __39__UITabBarController__tabs_compactTabs__block_invoke;
          v22[3] = &unk_1E52E7F28;
          v22[4] = v10;
          uint64_t v14 = [v13 indexOfObjectPassingTest:v22];

          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            int v15 = [*(id *)((char *)&v2->super.super.super.isa + v12) tabItems];
            int v16 = [v15 objectAtIndex:v14];

            [v20 addObject:v16];
          }
          id v3 = v11;
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v7);
    }

    uint64_t v17 = [v20 copy];
    BOOL v4 = (void *)v17;
  }

  return v4;
}

- (NSArray)compactTabIdentifiers
{
  return self->_compactTabIdentifiers;
}

- (void)setTabs:(id)a3 animated:(BOOL)a4
{
  id v7 = a3;
  *(_DWORD *)&self->_tabBarControllerFlags |= 0x8000u;
  uint64_t v8 = [(UITabBarController *)self selectedTab];
  id v9 = self->_tabModel;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__UITabBarController_setTabs_animated___block_invoke;
  v13[3] = &unk_1E52E7F00;
  uint64_t v14 = v9;
  id v15 = v7;
  int v16 = self;
  SEL v17 = a2;
  BOOL v18 = a4;
  id v10 = v7;
  BOOL v11 = v9;
  [(UITabBarController *)self _performWithoutNotifyingSelectionChange:v13];
  uint64_t v12 = [(UIViewController *)self _existingView];
  [v12 setNeedsLayout];
}

- (UITab)selectedTab
{
  if (self) {
    self = (UITabBarController *)self->_tabModel;
  }
  return (UITab *)[(UITabBarController *)self selectedLeaf];
}

void __39__UITabBarController_setTabs_animated___block_invoke(uint64_t a1)
{
  NSUInteger v2 = [*(id *)(a1 + 32) tabItems];
  id v3 = *(void **)(a1 + 40);
  id v4 = v2;
  id v5 = v3;
  uint64_t v6 = v5;
  if (v4 != v5 && v4 != 0 && v5 != 0) {
    [v4 isEqual:v5];
  }

  id v9 = [*(id *)(a1 + 32) selectedLeaf];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  SEL v17 = __39__UITabBarController_setTabs_animated___block_invoke_2;
  BOOL v18 = &unk_1E52E7ED8;
  id v19 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v23 = *(void *)(a1 + 56);
  id v20 = v10;
  uint64_t v21 = v11;
  char v24 = *(unsigned char *)(a1 + 64);
  id v12 = v9;
  id v22 = v12;
  UISemanticContentAttribute v13 = _Block_copy(&v15);
  uint64_t v14 = v13;
  if (*(unsigned char *)(a1 + 64)) {
    (*((void (**)(void *))v13 + 2))(v13);
  }
  else {
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v13, v15, v16, v17, v18, v19, v20, v21);
  }
}

- (void)_setMoreNavigationControllerRestorationIdentifier
{
  if (self->_moreNavigationController)
  {
    id v3 = [(UIResponder *)self restorationIdentifier];
    if (v3)
    {
      id v7 = v3;
      [(UIResponder *)self->_moreNavigationController setRestorationIdentifier:@"_$MoreNavigationController$_"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v3 = v7;
      if (isKindOfClass)
      {
        id v5 = [(UIMoreNavigationController *)self->_moreNavigationController moreListController];
        uint64_t v6 = v5;
        if (v5) {
          [v5 setRestorationIdentifier:@"_$MoreNavigationListController$_"];
        }

        id v3 = v7;
      }
    }
  }
}

- (BOOL)_allowsCustomizing
{
  NSUInteger v2 = [(UITabBarController *)self customizableViewControllers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)customizableViewControllers
{
  NSUInteger v2 = (void *)[(NSArray *)self->_customizableViewControllers copy];
  return (NSArray *)v2;
}

+ (Class)_moreNavigationControllerClass
{
  return (Class)objc_opt_class();
}

- (void)_willChangeToIdiom:(int64_t)a3 onScreen:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)UITabBarController;
  [(UIViewController *)&v10 _willChangeToIdiom:a3 onScreen:a4];
  uint64_t v6 = [(UIViewController *)self traitCollection];
  id v7 = [v6 _traitCollectionByReplacingNSIntegerValue:a3 forTraitToken:0x1ED3F5A30];

  [(UITabBarController *)self _updateVisualStyleForTraitCollection:v7];
  [(UITabBarController *)self _updateLayoutForTraitCollection:v7];
  BOOL v8 = [(UITabBarController *)self _wantsBarHidden];
  unint64_t v9 = ((unint64_t)self->_tabBarControllerFlags >> 2) & 3;
  if (v8) {
    [(UITabBarController *)self _hideBarWithTransition:0 isExplicit:0 reason:v9];
  }
  else {
    [(UITabBarController *)self _showBarWithTransition:0 isExplicit:0 reason:v9];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITabBarController;
  [(UIViewController *)&v9 traitCollectionDidChange:v4];
  id v5 = [(UIViewController *)self traitCollection];
  [(UITabBarController *)self _updateLayoutForTraitCollection:v5];

  if (dyld_program_sdk_at_least())
  {
    uint64_t v6 = [v4 horizontalSizeClass];
    id v7 = [(UIViewController *)self traitCollection];
    uint64_t v8 = [v7 horizontalSizeClass];

    if (v6 != v8)
    {
      *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20u;
      [(UITabBarController *)self _prepareTabBar];
    }
  }
}

- (void)_layoutContainerView
{
  if (!self->_containerView)
  {
    [(UIViewController *)self _defaultInitialViewFrame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id v12 = -[UILayoutContainerView initWithFrame:]([UILayoutContainerView alloc], "initWithFrame:", v4, v6, v8, v10);
    containerView = self->_containerView;
    self->_containerView = v12;

    [(UILayoutContainerView *)self->_containerView setDelegate:self];
    -[UILayoutContainerView setFrame:](self->_containerView, "setFrame:", v5, v7, v9, v11);
    [(UIView *)self->_containerView setAutoresizingMask:18];
    [(UITabBarController *)self setView:self->_containerView];
    visualStyle = self->_visualStyle;
    if (visualStyle)
    {
      [(_UITabBarControllerVisualStyle *)visualStyle loadViews];
    }
    else
    {
      uint64_t v15 = [(UIViewController *)self traitCollection];
      [(UITabBarController *)self _updateVisualStyleForTraitCollection:v15];
    }
  }
  [(UIView *)self->_containerView bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  char v24 = self->_visualStyle;
  if (!v24)
  {
    long long v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"UITabBarController.m" lineNumber:972 description:@"_visualStyle must be created before we can layout the container view"];

    char v24 = self->_visualStyle;
  }
  if ([(_UITabBarControllerVisualStyle *)v24 wantsDefaultTabBar] && !self->_tabBar)
  {
    long long v25 = -[UITabBar initWithFrame:]([UITabBar alloc], "initWithFrame:", v17, v19, v21, v23);
    tabBar = self->_tabBar;
    self->_tabBar = v25;
  }
  [(UITabBarController *)self _prepareTabBar];
  if (dyld_program_sdk_at_least()) {
    [(_UITabBarControllerVisualStyle *)self->_visualStyle updateTabBarLayout];
  }
  if (!self->_viewControllerTransitionView)
  {
    unint64_t v27 = [UITransitionView alloc];
    uint64_t v28 = -[UITransitionView initWithFrame:](v27, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    viewControllerTransitionView = self->_viewControllerTransitionView;
    self->_viewControllerTransitionView = v28;

    long long v30 = [(UITabBarController *)self _transitionView];
    [v30 setDelegate:self];

    id v31 = [(UITabBarController *)self _transitionView];
    [v31 setShouldNotifyDidCompleteImmediately:1];

    [(UIView *)self->_viewControllerTransitionView setAutoresizingMask:18];
    id v32 = self->_visualStyle;
    long long v33 = [(UITabBarController *)self _transitionView];
    [(_UITabBarControllerVisualStyle *)v32 configureTransitionView:v33];

    long long v34 = [(_UITabBarControllerVisualStyle *)self->_visualStyle tabBarView];
    [(UIView *)self->_containerView insertSubview:self->_viewControllerTransitionView belowSubview:v34];
  }
  -[_UITabBarControllerVisualStyle adjustedTransitionViewFrame:](self->_visualStyle, "adjustedTransitionViewFrame:", v17, v19, v21, v23);
  long long v35 = self->_viewControllerTransitionView;
  -[UIView setFrame:](v35, "setFrame:");
}

- (void)_prepareTabBar
{
  if ((*(unsigned char *)&self->_tabBarControllerFlags & 0x20) == 0)
  {
    unint64_t v3 = [(UITabBarController *)self _effectiveTabBarPosition];
    if (v3 - 3 < 2) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 4;
    }
    [(UITabBar *)self->_tabBar _setBarOrientation:v4];
    [(UITabBar *)self->_tabBar setLocked:0];
    [(UIView *)self->_tabBar sizeToFit];
    [(_UITabBarControllerVisualStyle *)self->_visualStyle updateTabBarLayout];
    if (v3 > 4) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = qword_186B941A8[v3];
    }
    [(UITabBar *)self->_tabBar _setAccessoryView:self->_accessoryView];
    [(UIView *)self->_tabBar setAutoresizingMask:v5];
    tabBar = self->_tabBar;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __36__UITabBarController__prepareTabBar__block_invoke;
    v12[3] = &unk_1E52D9F70;
    v12[4] = self;
    -[UITabBar _performWhileIgnoringLock:]((uint64_t)tabBar, v12);
    [(UITabBar *)self->_tabBar _setHidesShadow:(*(_DWORD *)&self->_tabBarControllerFlags >> 13) & 1];
    double v7 = [(_UITabBarControllerVisualStyle *)self->_visualStyle tabBarView];
    double v8 = v7;
    if (!v7) {
      double v8 = self->_tabBar;
    }
    double v9 = v8;

    double v10 = [(UIView *)v9 superview];
    containerView = self->_containerView;

    if (v10 != containerView) {
      [(UILayoutContainerView *)self->_containerView addSubview:v9];
    }
    [(UITabBar *)self->_tabBar setLocked:1];
    *(_DWORD *)&self->_tabBarControllerFlags |= 0x22u;
    [(UIView *)self->_containerView setNeedsLayout];
  }
}

- (void)_updateLayoutForTraitCollection:(id)a3
{
  [(UITabBarController *)self _updateVisualStyleForTraitCollection:a3];
  unint64_t v4 = [(_UITabBarControllerVisualStyle *)self->_visualStyle defaultMaxItems];
  [(UITabBarController *)self _setTabBarPosition:[(_UITabBarControllerVisualStyle *)self->_visualStyle tabBarPosition]];
  if (v4 != self->_defaultMaxItems)
  {
    uint64_t v5 = -[UITabBarController _viewControllersForTabs]((id *)&self->super.super.super.isa);
    unint64_t v6 = [v5 count];
    unint64_t defaultMaxItems = self->_defaultMaxItems;
    if (v4 < defaultMaxItems) {
      unint64_t defaultMaxItems = v4;
    }
    self->_unint64_t defaultMaxItems = v4;
    if (v6 > defaultMaxItems)
    {
      *(_DWORD *)&self->_tabBarControllerFlags |= 2u;
      [(UITabBarController *)self _setViewControllers:v5 animated:0];
    }
  }
  double v8 = _UINSLocalizedStringWithDefaultValue(@"More", @"More");
  double v9 = [(UIMoreNavigationController *)self->_moreNavigationController moreListController];
  [v9 setTitle:v8];

  [(_UITabBarControllerVisualStyle *)self->_visualStyle updateGestureRecognizers];
  unint64_t v10 = [(_UITabBarControllerVisualStyle *)self->_visualStyle tabBarFocusSpeedBumpEdges];
  tabBar = self->_tabBar;
  [(UIView *)tabBar _setFocusSpeedBumpEdges:v10];
}

- (id)_containerView
{
  return self->_containerView;
}

- (void)_setTabBarPosition:(int64_t)a3
{
  if (self->_tabBarPosition != a3)
  {
    if ((unint64_t)a3 >= 5)
    {
      double v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"UITabBarController.m", 3977, @"Invalid parameter not satisfying: %@", @"UITabBarControllerBarPositionUnspecified <= position && position <= UITabBarControllerBarPositionRight" object file lineNumber description];
    }
    int64_t v5 = [(UITabBarController *)self _effectiveTabBarPosition];
    self->_tabBarPosition = a3;
    if (v5 != [(UITabBarController *)self _effectiveTabBarPosition])
    {
      *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20u;
      containerView = self->_containerView;
      [(UIView *)containerView setNeedsLayout];
    }
  }
}

- (void)_updateVisualStyleForTraitCollection:(id)a3
{
  uint64_t v4 = [a3 userInterfaceIdiom];
  int64_t v5 = v4;
  p_visualStyle = &self->_visualStyle;
  if (!self->_visualStyle || self->_visualStyleIdiom != v4)
  {
    self;
    if (_registerDefaultStylesIfNeeded___defaultRegistrationToken != -1) {
      dispatch_once(&_registerDefaultStylesIfNeeded___defaultRegistrationToken, &__block_literal_global_32_0);
    }
    double v7 = +[_UIVisualStyleRegistry registryForIdiom:v5];
    double v8 = (objc_class *)[v7 visualStyleClassForStylableClass:objc_opt_class()];

    if (!*p_visualStyle || ([(objc_class *)v8 isEqual:objc_opt_class()] & 1) == 0)
    {
      obuint64_t j = (id)[[v8 alloc] initWithTabBarController:self];
      if (*p_visualStyle)
      {
        double v9 = [(_UITabBarControllerVisualStyle *)*p_visualStyle tabBarView];
        [v9 removeFromSuperview];
        *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20u;
        [(_UITabBarControllerVisualStyle *)*p_visualStyle teardown];
      }
      objc_storeStrong((id *)&self->_visualStyle, obj);
      self->_visualStyleIdiom = v5;
      [(_UITabBarControllerVisualStyle *)*p_visualStyle prepare];
      if ([(UIViewController *)self isViewLoaded])
      {
        [(_UITabBarControllerVisualStyle *)*p_visualStyle loadViews];
        unint64_t v10 = [(UIViewController *)self view];
        [v10 setNeedsLayout];
      }
    }
  }
}

void __45__UITabBarController__setSelectedTabBarItem___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) tabBar];
  [v2 setSelectedItem:v1];
}

void __50__UITabBarController__rebuildTabBarItemsAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tabBar];
  [v2 setItems:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_showBarWithTransition:(int)a3 isExplicit:(BOOL)a4 duration:(double)a5 reason:(unint64_t)a6
{
  $BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = self->_tabBarControllerFlags;
  int v8 = (*(unsigned int *)&tabBarControllerFlags >> 2) & 3;
  int v9 = v8 & ~a6;
  self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&tabBarControllerFlags & 0xFFFFFFF3 | (4 * (v9 & 3)));
  if (v8 != v9)
  {
    BOOL v11 = a4;
    if (![(UITabBarController *)self _wantsBarHidden])
    {
      uint64_t v14 = [(UITabBarController *)self _selectedViewControllerInTabBar];
      objc_opt_class();
      int v50 = objc_opt_isKindOfClass() & 1;
      visualStyle = self->_visualStyle;
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke;
      v69[3] = &unk_1E52D9FC0;
      v69[4] = self;
      BOOL v70 = a3 != 0;
      [(_UITabBarControllerVisualStyle *)visualStyle performWithoutNotifyingTabBarController:v69];
      double v16 = [(UITabBarController *)self _selectedViewControllerInTabBar];
      double v17 = [v16 transitionCoordinator];

      if ((a3 - 1) > 1)
      {
        double v18 = v17;
      }
      else
      {
        double v18 = v17;
        double v19 = [v17 _mainContext];
        double v20 = [v19 _animator];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          double v22 = [v19 _animator];

          if (v22)
          {
            v49 = v22;
            BOOL v51 = [v22 resizedToContainerView];
            char v23 = 0;
            goto LABEL_10;
          }
        }
        else
        {
        }
      }
      v49 = 0;
      BOOL v51 = 0;
      char v23 = 1;
LABEL_10:
      [(UITabBar *)self->_tabBar setHidden:0];
      if ([(_UITabBarControllerVisualStyle *)self->_visualStyle canDisplayUITabBar]) {
        uint64_t v24 = a3;
      }
      else {
        uint64_t v24 = 0;
      }
      double v25 = transitionGapGivenTabController(self);
      char v26 = 0;
      unint64_t v27 = v18;
      uint64_t v28 = v14;
      if (v50)
      {
        char v26 = [v14 _didExplicitlyHideTabBar];
        if (v11) {
          [v14 _setDidExplicitlyHideTabBar:0];
        }
      }
      if (v23)
      {
        switch((int)v24)
        {
          case 1:
            [(UIView *)self->_tabBar frame];
            double v30 = v25 + v29;
            tabBar = self->_tabBar;
            goto LABEL_20;
          case 2:
            [(UIView *)self->_tabBar frame];
            BOOL v40 = [(UIView *)self->_tabBar superview];
            [v40 frame];
            double v42 = v41;
            [(UIView *)self->_tabBar bounds];
            double v44 = v42 - v43 - v25;

            tabBar = self->_tabBar;
            double v30 = v44;
            goto LABEL_20;
          case 3:
            [(UIView *)self->_tabBar frame];
            double v46 = v45;
            uint64_t v47 = [(UIView *)self->_tabBar superview];
            [v47 bounds];

            tabBar = self->_tabBar;
            double v30 = v46;
            goto LABEL_20;
          case 6:
            if (v50) {
              [v14 _setCrossfadingInTabBar:1];
            }
            [(UITabBar *)self->_tabBar setAlpha:0.0];
            [(UIView *)self->_tabBar frame];
            id v48 = [(UIView *)self->_tabBar superview];
            [v48 bounds];

            tabBar = self->_tabBar;
            double v30 = 0.0;
            goto LABEL_20;
          default:
            break;
        }
      }
      else
      {
        [(UIView *)self->_tabBar frame];
        [v51 bounds];
        tabBar = self->_tabBar;
        double v30 = 0.0;
LABEL_20:
        [(UITabBar *)tabBar setFrame:v30];
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_2;
      aBlock[3] = &unk_1E52E7FF0;
      int v68 = v24;
      void aBlock[4] = self;
      id v32 = (void (**)(void))_Block_copy(aBlock);
      if ((v23 & 1) != 0
        || ([(UIView *)self->_tabBar superview],
            long long v33 = objc_claimAutoreleasedReturnValue(),
            v33,
            !v33))
      {
        if (v24)
        {
          if (a5 < 0.0)
          {
            [(id)objc_opt_class() durationForTransition:v24];
            a5 = v36;
          }
          if (v27)
          {
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_6;
            v57[3] = &unk_1E52DA110;
            v58 = v32;
            double v37 = (void (**)(void *, void))_Block_copy(v57);
            uint64_t v38 = self->_tabBar;
            v52[0] = MEMORY[0x1E4F143A8];
            v52[1] = 3221225472;
            v52[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_8;
            v52[3] = &unk_1E52E8018;
            v52[4] = self;
            unint64_t v54 = a6;
            char v55 = v50;
            id v53 = v28;
            char v56 = v26;
            if (([v27 animateAlongsideTransitionInView:v38 animation:v37 completion:v52] & 1) == 0) {
              v37[2](v37, 0);
            }
          }
          else
          {
            v59[0] = MEMORY[0x1E4F143A8];
            v59[1] = 3221225472;
            v59[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_5;
            v59[3] = &unk_1E52DC3A0;
            v59[4] = self;
            +[UIView animateWithDuration:0 delay:v32 options:v59 animations:a5 completion:0.0];
          }
          long long v35 = v49;
          goto LABEL_36;
        }
        v32[2](v32);
        long long v35 = v49;
      }
      else
      {
        long long v34 = [(UIView *)self->_tabBar superview];
        [(UITabBar *)self->_tabBar set_expectedSuperviewFollowingAnimation:v34];

        LOBYTE(v34) = [(UIView *)self->_tabBar _safeAreaInsetsFrozen];
        [(UIView *)self->_tabBar _setSafeAreaInsetsFrozen:1];
        [v51 addSubview:self->_tabBar];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_3;
        v60[3] = &unk_1E52E7FA0;
        v60[4] = self;
        char v64 = (char)v34;
        v62 = v32;
        unint64_t v63 = a6;
        char v65 = v50;
        id v61 = v28;
        char v66 = v26;
        [v27 animateAlongsideTransition:0 completion:v60];

        long long v35 = v49;
        if (v24)
        {
LABEL_36:

          return;
        }
      }
      double v39 = [NSNumber numberWithBool:1];
      [(UITabBarController *)self animationDidStop:@"UITabBarControllerShowBar" finished:v39 context:0];

      goto LABEL_36;
    }
  }
}

- (void)_showBarWithTransition:(int)a3 isExplicit:(BOOL)a4 reason:(unint64_t)a5
{
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIViewController *)self isViewLoaded])
  {
    int64_t v5 = [(UITabBarController *)self _selectedViewControllerInTabBar];
    unint64_t v6 = [v5 _existingView];
    double v7 = [(UIViewController *)self view];
    char v8 = [v6 isDescendantOfView:v7];

    if ((v8 & 1) == 0) {
      [(UITabBarController *)self _selectDefaultViewControllerIfNecessaryWithAppearanceTransitions:0];
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)UITabBarController;
  [(UIViewController *)&v12 viewWillAppear:v3];
  int v9 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  [(UIViewController *)v9 __viewWillAppear:v3];
  selectedViewControllerDuringWillAppear = self->_selectedViewControllerDuringWillAppear;
  self->_selectedViewControllerDuringWillAppear = v9;
  BOOL v11 = v9;

  [(_UITabBarControllerVisualStyle *)self->_visualStyle viewWillAppear:v3];
  [(_UITabBarControllerVisualStyle *)self->_visualStyle prepare];
}

uint64_t __36__UITabBarController__prepareTabBar__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "setDelegate:");
}

- (void)setView:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    int64_t v5 = [(UILayoutContainerView *)self->_containerView delegate];

    if (v5 == self) {
      [(UILayoutContainerView *)self->_containerView setDelegate:0];
    }
    transientViewController = self->_transientViewController;
    self->_transientViewController = 0;

    containerView = self->_containerView;
    self->_containerView = 0;

    char v8 = [(UITabBarController *)self _transitionView];
    int v9 = [v8 delegate];

    if (v9 == self)
    {
      unint64_t v10 = [(UITabBarController *)self _transitionView];
      [v10 setDelegate:0];
    }
    viewControllerTransitionView = self->_viewControllerTransitionView;
    self->_viewControllerTransitionView = 0;

    [(UITabBar *)self->_tabBar setLocked:0];
    objc_super v12 = [(UITabBar *)self->_tabBar delegate];

    if (v12 == self) {
      [(UITabBar *)self->_tabBar setDelegate:0];
    }
    tabBar = self->_tabBar;
    self->_tabBar = 0;

    self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFF9D | 0x42);
  }
  v14.receiver = self;
  v14.super_class = (Class)UITabBarController;
  [(UIViewController *)&v14 setView:v4];
}

void __55__UITabBarController__tabs_rebuildTabBarItemsAnimated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tabBar];
  [v2 setItems:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_2(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 40);
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 976);
  if (v2 == 6)
  {
    return [v3 setAlpha:1.0];
  }
  else
  {
    [v3 frame];
    double v6 = v5;
    double v8 = v7;
    int v9 = [*(id *)(*(void *)(a1 + 32) + 976) superview];
    [v9 bounds];
    double v11 = v10 - v8;

    objc_super v12 = *(void **)(*(void *)(a1 + 32) + 976);
    return objc_msgSend(v12, "setFrame:", 0.0, v11, v6, v8);
  }
}

- (void)_hideBarWithTransition:(int)a3 isExplicit:(BOOL)a4 reason:(unint64_t)a5
{
}

- (void)dealloc
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UILayoutContainerView *)self->_containerView delegate];

  if (v3 == self) {
    [(UILayoutContainerView *)self->_containerView setDelegate:0];
  }
  transientViewController = self->_transientViewController;
  self->_transientViewController = 0;

  containerView = self->_containerView;
  self->_containerView = 0;

  double v6 = [(UITabBarController *)self _transitionView];
  double v7 = [v6 delegate];

  if (v7 == self)
  {
    double v8 = [(UITabBarController *)self _transitionView];
    [v8 setDelegate:0];
  }
  viewControllerTransitionView = self->_viewControllerTransitionView;
  self->_viewControllerTransitionView = 0;

  [(UITabBar *)self->_tabBar setLocked:0];
  double v10 = [(UITabBar *)self->_tabBar delegate];

  if (v10 == self) {
    [(UITabBar *)self->_tabBar setDelegate:0];
  }
  tabBar = self->_tabBar;
  self->_tabBar = 0;

  id tabBarItemsToViewControllers = self->_tabBarItemsToViewControllers;
  self->_id tabBarItemsToViewControllers = 0;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  UISemanticContentAttribute v13 = self->_moreChildViewControllers;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
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
        uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        if (*(UITabBarController **)(v18 + 104) == self) {
          *(void *)(v18 + 104) = 0;
        }
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v15);
  }

  moreNavigationController = self->_moreNavigationController;
  self->_moreNavigationController = 0;

  moreChildViewControllers = self->_moreChildViewControllers;
  self->_moreChildViewControllers = 0;

  selectedViewController = self->_selectedViewController;
  self->_selectedViewController = 0;

  customizableViewControllers = self->_customizableViewControllers;
  self->_customizableViewControllers = 0;

  accessoryView = self->_accessoryView;
  self->_accessoryView = 0;

  visualStyle = self->_visualStyle;
  self->_visualStyle = 0;

  v25.receiver = self;
  v25.super_class = (Class)UITabBarController;
  [(UIViewController *)&v25 dealloc];
}

- (void)_observableScrollViewDidChangeFrom:(id)a3 forViewController:(id)a4 edges:(unint64_t)a5
{
  double v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)UITabBarController;
  [(UIViewController *)&v23 _observableScrollViewDidChangeFrom:a3 forViewController:v8 edges:a5];
  if (v8)
  {
    if (((v8[94] >> 1) & 3u) - 1 <= 1)
    {
      unint64_t v9 = [(UITabBarController *)self _relevantEdgeForScrollViewObservation];
      if ((v9 & a5) != 0)
      {
        unint64_t v10 = v9;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);
        id v12 = [v8 _contentOrObservableScrollViewForEdge:v10];
        id v13 = objc_loadWeakRetained((id *)&self->_observingScrollView);

        if (v12 != v13)
        {
          uint64_t v14 = [(_UITabBarControllerVisualStyle *)self->_visualStyle viewControllerForObservableScrollViewFromViewController:self->_selectedViewController];
          id v15 = [v14 _contentOrObservableScrollViewForEdge:v10];

          if (v15) {
            BOOL v16 = v12 == v15;
          }
          else {
            BOOL v16 = 1;
          }
          if (v16)
          {
            double v17 = [v12 _viewControllerForAncestor];
            uint64_t v18 = [v17 presentingViewController];
            double v19 = [v18 tabBarController];
            double v20 = v19;
            if (v19)
            {
              double v21 = v19;
            }
            else
            {
              double v21 = [v17 tabBarController];
            }
            double v22 = v21;

            if (v22 == self) {
              [(UITabBarController *)self _updateAndObserveScrollView:v12 viewController:v8];
            }
          }
        }
      }
    }
  }
}

- (void)updateViewConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)UITabBarController;
  [(UIViewController *)&v3 updateViewConstraints];
  [(_UITabBarControllerVisualStyle *)self->_visualStyle updateConstraints];
}

- (void)setTabBarHidden:(BOOL)a3
{
}

- (BOOL)isTabBarHidden
{
  return [(_UITabBarControllerVisualStyle *)self->_visualStyle isBarHidden];
}

- (NSArray)tabs
{
  if ((*((unsigned char *)&self->_tabBarControllerFlags + 1) & 0x80) != 0)
  {
    int v2 = [(_UITabModel *)self->_tabModel tabItems];
  }
  else
  {
    int v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v2;
}

- (UITabBarControllerSidebar)sidebar
{
  sidebar = self->_sidebar;
  if (!sidebar)
  {
    id v4 = (UITabBarControllerSidebar *)-[UITabBarControllerSidebar _initWithTabBarController:]([UITabBarControllerSidebar alloc], (uint64_t)self);
    double v5 = self->_sidebar;
    self->_sidebar = v4;

    sidebar = self->_sidebar;
  }
  return sidebar;
}

- (void)setTabs:(id)a3
{
}

- (void)setTabBarHidden:(BOOL)a3 animated:(BOOL)a4
{
}

BOOL __56__UITabBarController_updateTabBarItemForViewController___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 _displayedViewController];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)updateTabBarItemForViewController:(id)a3
{
  BOOL v4 = (UIViewController *)a3;
  if ((*(unsigned char *)&self->_tabBarControllerFlags & 2) == 0)
  {
    double v5 = [(UIViewController *)self mutableChildViewControllers];
    uint64_t v6 = [v5 indexOfObjectIdenticalTo:v4];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v6 = [(NSMutableArray *)self->_moreChildViewControllers indexOfObjectIdenticalTo:v4];
    }
    if (self->_transientViewController != v4 || [v5 count] == 1)
    {
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [(UITabBarController *)self _rebuildTabModelAnimated:1];
      }
      else
      {
        double v7 = [(UIViewController *)v4 _resolvedTab];
        if (([v7 _isMoreTab] & 1) == 0 && (*((unsigned char *)&self->_tabBarControllerFlags + 1) & 0x80) == 0)
        {
          double v8 = self->_tabModel;
          unint64_t v9 = [(_UITabModel *)v8 tabItems];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __56__UITabBarController_updateTabBarItemForViewController___block_invoke;
          v15[3] = &unk_1E52E7F28;
          unint64_t v10 = v4;

          BOOL v16 = v10;
          uint64_t v11 = [v9 indexOfObjectPassingTest:v15];

          if (v11 == 0x7FFFFFFFFFFFFFFFLL)
          {
            *(_DWORD *)&self->_tabBarControllerFlags |= 2u;
            id v12 = [(UIViewController *)self _existingView];
            [v12 setNeedsLayout];
          }
          else
          {
            [(_UITabModel *)self->_tabModel replaceItemAtIndex:v11 withItem:v7];
          }
        }
        [(_UITabBarControllerVisualStyle *)self->_visualStyle updateTabForChildViewController:v4];
        id v13 = [(UITabBarController *)self _selectedViewControllerInTabBar];

        if (v13 == v4)
        {
          uint64_t v14 = [(UIViewController *)v4 tabBarItem];
          [(UITabBarController *)self _setSelectedTabBarItem:v14];
        }
      }
    }
  }
}

- (id)_visualStyle
{
  if (a1)
  {
    a1 = (id *)a1[136];
    uint64_t v1 = vars8;
  }
  return a1;
}

void __39__UITabBarController_setTabs_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setTabItems:*(void *)(a1 + 40) inferSelection:0];
  int v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    unint64_t v7 = 0x1E4F28000uLL;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v9 _isUniquelySPI])
        {
          uint64_t v11 = [*(id *)(v7 + 2816) currentHandler];
          [v11 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 48), @"UITabBarController.m", 597, @"_UITabElement (%@) is not supported in setTabs:animated:", v9 object file lineNumber description];
        }
        unint64_t v10 = [v9 _displayedViewController];
        if (!v10)
        {
          [*(id *)(v7 + 2816) currentHandler];
          v13 = unint64_t v12 = v7;
          [v13 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 48), @"UITabBarController.m", 600, @"Every root UITab must have a non-nil UIViewController associated with it: %@", v9 object file lineNumber description];

          unint64_t v7 = v12;
        }
        [v2 addObject:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  uint64_t v14 = (void *)[v2 copy];
  [*(id *)(a1 + 48) _setViewControllers:v14 animated:*(unsigned __int8 *)(a1 + 72)];
  objc_storeStrong((id *)(*(void *)(a1 + 48) + 1120), v14);
  id v15 = *(void **)(a1 + 32);
  BOOL v16 = [*(id *)(a1 + 56) identifier];
  double v17 = [v15 tabForIdentifier:v16];

  if (v17) {
    [*(id *)(a1 + 32) selectElement:v17 notifyOnReselection:0];
  }
}

- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated
{
  BOOL v4 = animated;
  unint64_t v9 = viewControllers;
  *(_DWORD *)&self->_tabBarControllerFlags &= ~0x8000u;
  uint64_t v6 = [(UITabBarController *)self viewControllers];
  char v7 = [v6 isEqualToArray:v9];

  if (v7)
  {
    *(_DWORD *)&self->_tabBarControllerFlags |= 2u;
    double v8 = [(UIViewController *)self _existingView];
    [v8 setNeedsLayout];
  }
  else
  {
    [(UITabBarController *)self _setViewControllers:v9 animated:v4];
  }
}

- (id)tabForIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UITabBarController.m", 645, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  uint64_t v6 = [(_UITabModel *)self->_tabModel tabForIdentifier:v5];

  return v6;
}

void __47__UITabBarController__rebuildTabModelAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v3) {
    BOOL v4 = *(void **)(v3 + 1160);
  }
  else {
    BOOL v4 = 0;
  }
  [v4 setTabItems:v2];
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(void *)(a1 + 48))
    {
      if (objc_msgSend(*(id *)(a1 + 56), "containsObject:"))
      {
        id v5 = *(void **)(a1 + 48);
        if (v5 != *(void **)(*(void *)(a1 + 32) + 1040))
        {
          uint64_t v6 = [v5 _resolvedTab];
          uint64_t v7 = *(void *)(a1 + 32);
          if (v7) {
            double v8 = *(void **)(v7 + 1160);
          }
          else {
            double v8 = 0;
          }
          id v9 = (id)v6;
          [v8 selectElement:v6 notifyOnReselection:0];
        }
      }
    }
  }
}

- (void)_selectedLeafDidChange:(void *)a3 previousLeaf:
{
  id v10 = a2;
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = [*(id *)(a1 + 1160) selectedItem];
    if ([v6 _isGroup]) {
      [v6 _updateManagingNavigationStackUsingTransition:2];
    }
    if (v10)
    {
      if ((*(_DWORD *)(a1 + 1112) & 0x8000) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1176));
        char v8 = objc_opt_respondsToSelector();

        if (v8)
        {
          id v9 = objc_loadWeakRetained((id *)(a1 + 1176));
          [v9 tabBarController:a1 didSelectTab:v10 previousTab:v5];
        }
      }
    }
  }
}

- (void)_selectedElementDidChange:(void *)a3 previousElement:
{
  id v9 = a2;
  id v5 = a3;
  if (a1)
  {
    if (v9)
    {
      [a1 _validateTabSelectionIfNeeded];
      if ((a1[1113] & 0x40) == 0)
      {
        uint64_t v6 = [v9 _displayedViewController];
        if (v6)
        {
          do
          {
            uint64_t v7 = [v6 parentViewController];

            if (v7 == a1) {
              break;
            }
            uint64_t v8 = [v6 parentViewController];

            uint64_t v6 = (void *)v8;
          }
          while (v8);
        }
        [a1 _setSelectedViewControllerAndNotify:v6];
      }
    }
  }
}

- (void)_validateTabSelectionIfNeeded
{
  uint64_t v3 = [(UIViewController *)self traitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];

  LODWORD(v3) = [(_UITabBarControllerVisualStyle *)self->_visualStyle shouldEnforceChildSelectionInGroupTabs];
  long long v20 = self->_tabModel;
  if (v3)
  {
    id v5 = [(_UITabModel *)v20 selectedItem];
    uint64_t v6 = v5;
    if ([v5 _isGroup])
    {
      uint64_t v6 = v5;
      while (1)
      {
        id v7 = v6;
        uint64_t v6 = [v7 selectedChild];
        if (!v6)
        {
          uint64_t v6 = [v7 _defaultChildForSelection];
          if (!v6) {
            break;
          }
        }

        if (([v6 _isGroup] & 1) == 0) {
          goto LABEL_9;
        }
      }

      uint64_t v6 = v7;
    }
LABEL_9:
    uint64_t v8 = [(_UITabModel *)self->_tabModel selectedLeaf];

    if (v8 != v6)
    {
      if (v6)
      {
        do
        {
          id v9 = [v6 _parentGroup];
          id v10 = [v9 selectedChild];

          if (v10 != v6) {
            break;
          }
          uint64_t v11 = [v6 _parentGroup];

          uint64_t v6 = (void *)v11;
        }
        while (v11);
      }
      [(_UITabModel *)self->_tabModel selectElement:v6 notifyOnReselection:0];
    }
    if ([(_UITabBarControllerVisualStyle *)self->_visualStyle supportsShowingMoreItem]
      && [v5 _isMoreTab])
    {
      unint64_t v12 = self->_moreNavigationController;
      id v13 = [(UIMoreNavigationController *)v12 displayedViewController];
      if (v13 == v12)
      {
        uint64_t v14 = [(UIMoreNavigationController *)v12 moreViewControllers];
        id v13 = [v14 firstObject];
      }
      id v15 = [(UIMoreNavigationController *)v13 _resolvedTab];
      [(_UITabModel *)v20 selectElement:v15 notifyOnReselection:0];
    }
  }
  BOOL v16 = self->_moreNavigationController;
  double v17 = v16;
  if (v4 != 2)
  {
    if (v16)
    {
      long long v18 = [(UITabBarController *)self selectedViewController];

      if (v18 == v17)
      {
        long long v19 = [(UIMoreNavigationController *)v17 _resolvedTab];
        [(_UITabModel *)v20 selectElement:v19 notifyOnReselection:0];
      }
    }
  }
}

- (void)_uip_setPreferredSidebarMode:(int64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2 * (a3 == 2);
  }
  [(UITabBarController *)self setMode:v3];
}

- (void)setSelectedTab:(id)a3
{
  if (self) {
    self = (UITabBarController *)self->_tabModel;
  }
  [(UITabBarController *)self selectElement:a3 notifyOnReselection:0];
}

- (id)_additionalViewControllersToCheckForUserActivity
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v4 = [(UITabBarController *)self selectedViewController];
  id v5 = objc_msgSend(v3, "arrayWithObjects:", v4, self->_moreNavigationController, 0);

  return v5;
}

void __55__UITabBarController__tabs_rebuildTabBarItemsAnimated___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  if (*(void *)(a1 + 48) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    id v5 = [a2 _linkedTabBarItem];
    [*(id *)(a1 + 32) _configureTargetActionForTabBarItem:v5];
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (void)setDelegate:(id)delegate
{
  obuint64_t j = delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v5 = obj;
  if (!obj || WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (objc_opt_respondsToSelector()) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFEFF | v6);
    char v7 = objc_opt_respondsToSelector();
    id v5 = obj;
    if (v7) {
      int v8 = 128;
    }
    else {
      int v8 = 0;
    }
    self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFF7F | v8);
  }
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    [(_UITabBarControllerVisualStyle *)self->_visualStyle preferredSidebarModeDidChange];
  }
}

- (void)setTitle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITabBarController;
  [(UIViewController *)&v4 setTitle:a3];
  [(_UITabBarControllerVisualStyle *)self->_visualStyle titleDidChange];
}

- (void)_hideBarWithTransition:(int)a3 isExplicit:(BOOL)a4 duration:(double)a5 reason:(unint64_t)a6
{
  BOOL v8 = a4;
  BOOL v11 = [(UITabBarController *)self _wantsBarHidden];
  *(_DWORD *)&self->_tabBarControllerFlags |= 4 * (a6 & 3);
  if (v11) {
    return;
  }
  unint64_t v12 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  objc_opt_class();
  uint64_t v52 = v12;
  uint64_t v13 = objc_opt_isKindOfClass() & 1;
  if (a6 != 2)
  {
    visualStyle = self->_visualStyle;
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke;
    v72[3] = &unk_1E52D9FC0;
    v72[4] = self;
    BOOL v73 = a3 != 0;
    [(_UITabBarControllerVisualStyle *)visualStyle performWithoutNotifyingTabBarController:v72];
  }
  if ([(_UITabBarControllerVisualStyle *)self->_visualStyle canDisplayUITabBar]) {
    uint64_t v15 = a3;
  }
  else {
    uint64_t v15 = 0;
  }
  [(UIView *)self->_viewControllerTransitionView frame];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [(UIView *)self->_containerView bounds];
  -[UIView setFrame:](self->_viewControllerTransitionView, "setFrame:", v17, v19, v21);
  double v22 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  uint64_t v23 = [v22 transitionCoordinator];

  BOOL v51 = v23;
  if ((v15 - 1) <= 1)
  {
    int v24 = v13;
    objc_super v25 = [v23 _mainContext];
    long long v26 = [v25 _animator];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      long long v28 = [v25 _animator];

      if (v28)
      {
        long long v29 = [v28 resizedFromContainerView];
        [(UIView *)self->_tabBar frame];
        double v31 = v30;
        double v33 = v32;
        int v50 = v29;
        [v29 bounds];
        -[UITabBar setFrame:](self->_tabBar, "setFrame:", 0.0, v34 - v33, v31, v33);
        char v35 = 0;
        goto LABEL_15;
      }
    }
    else
    {

      long long v28 = 0;
    }
    int v50 = 0;
    char v35 = 1;
LABEL_15:
    LOBYTE(v13) = v24;
    if (v24) {
      goto LABEL_16;
    }
LABEL_12:
    char v36 = 0;
    goto LABEL_20;
  }
  long long v28 = 0;
  int v50 = 0;
  char v35 = 1;
  if (!v13) {
    goto LABEL_12;
  }
LABEL_16:
  char v36 = [v12 _didExplicitlyHideTabBar];
  if (v8) {
    [v12 _setDidExplicitlyHideTabBar:1];
  }
  if (v15 == 6) {
    [v12 _setCrossfadingOutTabBar:1];
  }
LABEL_20:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_2;
  aBlock[3] = &unk_1E52DDF08;
  void aBlock[4] = self;
  id v37 = v28;
  id v70 = v37;
  int v71 = v15;
  uint64_t v38 = (void (**)(void))_Block_copy(aBlock);
  if ((v35 & 1) != 0
    || ([(UIView *)self->_tabBar superview],
        double v39 = objc_claimAutoreleasedReturnValue(),
        v39,
        !v39))
  {
    if (v15)
    {
      char v43 = v36;
      if (a5 < 0.0)
      {
        [(id)objc_opt_class() durationForTransition:v15];
        a5 = v44;
      }
      double v42 = v51;
      if (v51)
      {
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_6;
        v59[3] = &unk_1E52DA110;
        v60 = v38;
        double v45 = (void (**)(void *, void))_Block_copy(v59);
        tabBar = self->_tabBar;
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_8;
        v53[3] = &unk_1E52E7FC8;
        v53[4] = self;
        unint64_t v55 = a6;
        BOOL v56 = a6 != 2;
        char v57 = v13;
        id v54 = v52;
        char v58 = v43;
        if (([v51 animateAlongsideTransitionInView:tabBar animation:v45 completion:v53] & 1) == 0) {
          v45[2](v45, 0);
        }
      }
      else
      {
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_5;
        v61[3] = &unk_1E52DC3A0;
        v61[4] = self;
        +[UIView animateWithDuration:4 delay:v38 options:v61 animations:a5 completion:0.0];
      }
      double v41 = v50;
      goto LABEL_35;
    }
    v38[2](v38);
    double v41 = v50;
    double v42 = v51;
    goto LABEL_32;
  }
  BOOL v40 = [(UIView *)self->_tabBar superview];
  [(UITabBar *)self->_tabBar set_expectedSuperviewFollowingAnimation:v40];

  double v41 = v50;
  [v50 addSubview:self->_tabBar];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_3;
  v62[3] = &unk_1E52E7FA0;
  v62[4] = self;
  char v64 = v38;
  unint64_t v65 = a6;
  BOOL v66 = a6 != 2;
  char v67 = v13;
  id v63 = v12;
  char v68 = v36;
  double v42 = v51;
  [v51 animateAlongsideTransition:0 completion:v62];

  if (!v15)
  {
LABEL_32:
    uint64_t v47 = [NSNumber numberWithBool:1];
    [(UITabBarController *)self animationDidStop:@"UITabBarControllerHideBar" finished:v47 context:0];
  }
LABEL_35:
  id v48 = [(UIViewController *)self traitCollection];
  uint64_t v49 = [v48 userInterfaceIdiom];

  if (v49 == 6) {
    [(UITabBarController *)self _rebuildTabModelAnimated:1];
  }
}

- (void)animationDidStop:(id)a3 finished:(id)a4 context:(id)a5
{
  char v7 = [a4 BOOLValue];
  BOOL v8 = [(UITabBarController *)self _wantsBarHidden];
  if (a3 == @"UITabBarControllerHideBar" || (v7 & 1) == 0) {
    [(UITabBar *)self->_tabBar setHidden:v8];
  }
  id v18 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  if (a3 == @"UITabBarControllerShowBar")
  {
    if (v7) {
      [(UIView *)self->_containerView setNeedsLayout];
    }
  }
  else
  {
    if (a3 != @"UITabBarControllerHideBar") {
      goto LABEL_15;
    }
    if (v7)
    {
      if (objc_opt_respondsToSelector()) {
        [v18 _tabBarControllerDidFinishShowingTabBar:self isHidden:v8];
      }
      [(UITabBar *)self->_tabBar setAlpha:1.0];
      goto LABEL_15;
    }
    [(UIView *)self->_viewControllerTransitionView frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [(UIView *)self->_containerView bounds];
    double v16 = v15;
    [(UIView *)self->_tabBar frame];
    -[UIView setFrame:](self->_viewControllerTransitionView, "setFrame:", v10, v12, v14, v16 - v17);
  }
  if (objc_opt_respondsToSelector()) {
    [v18 _tabBarControllerDidFinishShowingTabBar:self isHidden:v8];
  }
LABEL_15:
  [v18 _updateContentOverlayInsetsForSelfAndChildren];
}

- (void)_tabBarVisibilityDidChange
{
  id v12 = [(UITabBarController *)self selectedViewController];
  uint64_t v3 = [(UIViewController *)self traitCollection];
  if ([v3 horizontalSizeClass] == 2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v12 style];

      if (!v4) {
        goto LABEL_6;
      }
      uint64_t v3 = [v12 view];
      [v3 setNeedsLayout];
    }
  }

LABEL_6:
  if (!_UIBarsApplyChromelessEverywhere()) {
    goto LABEL_13;
  }
  id v5 = [(_UITabBarControllerVisualStyle *)self->_visualStyle viewControllerForObservableScrollViewFromViewController:self->_selectedViewController];
  if ([(UITabBarController *)self _isBarEffectivelyHidden])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);
    char v7 = WeakRetained;
  }
  else
  {
    uint64_t v8 = [v5 _contentOrObservableScrollViewForEdge:4];
    if (v8)
    {
      char v7 = (void *)v8;
    }
    else
    {
      double v9 = [(UITabBarController *)self _scrollViewObservedBeforeHidingBar];
      char v7 = v9;
      if (v9)
      {
        double v10 = [v9 _viewControllerForAncestor];
        BOOL v11 = [(UITabBarController *)self _isViewControllerContainedInSelected:v10];

        if (!v11)
        {

          id WeakRetained = 0;
          char v7 = 0;
          goto LABEL_12;
        }
      }
    }
    id WeakRetained = 0;
  }
LABEL_12:
  [(UITabBarController *)self _setScrollViewObservedBeforeHidingBar:WeakRetained];
  [(UITabBarController *)self _updateAndObserveScrollView:v7 viewController:v5];
  [(UITabBarController *)self _updateBarHiddenByClientStateIfNecessary];

LABEL_13:
}

- (void)_updateBarHiddenByClientStateIfNecessary
{
  if (qword_1EB25E618 != -1) {
    dispatch_once(&qword_1EB25E618, &__block_literal_global_234);
  }
  if (byte_1EB25E5F9)
  {
    if ([(UIView *)self->_tabBar isHidden]) {
      int v3 = 4;
    }
    else {
      int v3 = 0;
    }
    self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFFFB | v3);
  }
}

- (void)_setScrollViewObservedBeforeHidingBar:(id)a3
{
}

uint64_t __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1088) setBarHidden:0 animated:*(unsigned __int8 *)(a1 + 40)];
}

void __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_2(uint64_t a1)
{
  double v2 = transitionGapGivenTabController(*(void **)(a1 + 32));
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "frame", v2);
    double v4 = v3;
    double v6 = v5;
    char v7 = [*(id *)(*(void *)(a1 + 32) + 976) superview];
    [v7 bounds];
    double v9 = v8 - v6;

    double v10 = *(void **)(*(void *)(a1 + 32) + 976);
    double v11 = 0.0;
    double v12 = v9;
    double v13 = v4;
    double v14 = v6;
LABEL_3:
    objc_msgSend(v10, "setFrame:", v11, v12, v13, v14);
  }
  else
  {
    double v15 = v2;
    switch(*(_DWORD *)(a1 + 48))
    {
      case 1:
        [*(id *)(*(void *)(a1 + 32) + 976) frame];
        double v10 = *(void **)(*(void *)(a1 + 32) + 976);
        double v11 = v16 - (v15 + v13);
        goto LABEL_3;
      case 2:
        [*(id *)(*(void *)(a1 + 32) + 976) frame];
        double v10 = *(void **)(*(void *)(a1 + 32) + 976);
        double v11 = v17 + v15 + v13;
        goto LABEL_3;
      case 6:
        id v18 = *(void **)(*(void *)(a1 + 32) + 976);
        [v18 setAlpha:0.0];
        break;
      case 7:
        [*(id *)(*(void *)(a1 + 32) + 976) frame];
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        [*(id *)(*(void *)(a1 + 32) + 976) bounds];
        double v10 = *(void **)(*(void *)(a1 + 32) + 976);
        double v12 = v22 + v27;
        double v11 = v20;
        double v13 = v24;
        double v14 = v26;
        goto LABEL_3;
      default:
        return;
    }
  }
}

uint64_t __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1088) setBarHidden:1 animated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_showBarWithTransition:(int)a3 isExplicit:(BOOL)a4 duration:(double)a5
{
}

- (void)_showBarWithTransition:(int)a3 isExplicit:(BOOL)a4
{
}

- (id)_scrollViewObservedBeforeHidingBar
{
  return objc_getAssociatedObject(self, &__previouslyObservedScrollViewKey);
}

- (void)_hideBarWithTransition:(int)a3 isExplicit:(BOOL)a4
{
}

- (void)_setMaximumNumberOfItems:(unint64_t)a3
{
  if (a3 <= 1) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = a3;
  }
  if (self->_customMaxItems != v3)
  {
    self->_unint64_t customMaxItems = v3;
    *(_DWORD *)&self->_tabBarControllerFlags |= 2u;
    [(UIView *)self->_containerView setNeedsLayout];
  }
}

void __62__UITabBarController__updateBarHiddenByClientStateIfNecessary__block_invoke()
{
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    _UIMainBundleIdentifier();
    id v0 = (id)objc_claimAutoreleasedReturnValue();
    byte_1EB25E5F9 = [v0 isEqualToString:@"com.zhiliaoapp.musically"];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__interactor, 0);
  objc_storeStrong((id *)&self->__animator, 0);
  objc_storeStrong((id *)&self->_compactTabIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rememberedFocusedItemsByViewController, 0);
  objc_storeStrong((id *)&self->_tabModel, 0);
  objc_storeStrong((id *)&self->_sidebar, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_moreChildViewControllers, 0);
  objc_storeStrong((id *)&self->_viewControllersForTabs, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_destroyWeak((id *)&self->_observingScrollView);
  objc_storeStrong((id *)&self->_lastUsedScrollEdgeAppearance, 0);
  objc_storeStrong((id *)&self->_transientViewController, 0);
  objc_storeStrong((id *)&self->_selectedViewControllerDuringWillAppear, 0);
  objc_storeStrong((id *)&self->_customizableViewControllers, 0);
  objc_storeStrong((id *)&self->_moreNavigationController, 0);
  objc_storeStrong((id *)&self->_selectedViewController, 0);
  objc_storeStrong(&self->_tabBarItemsToViewControllers, 0);
  objc_storeStrong((id *)&self->_viewControllerTransitionView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_tabBar, 0);
}

- (id)_effectiveInteractionActivityTrackingBaseName
{
  unint64_t v3 = [(UIViewController *)self interactionActivityTrackingBaseName];
  if ([(UITabBarController *)self isMemberOfClass:objc_opt_class()])
  {
    double v4 = [(UITabBarController *)self selectedViewController];
    double v5 = [v4 _effectiveInteractionActivityTrackingBaseName];

    if (v5)
    {
      uint64_t v6 = [@"UITBC-" stringByAppendingString:v5];

      unint64_t v3 = (void *)v6;
    }
  }
  else
  {
    char v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    unint64_t v3 = v5 = v3;
  }

  return v3;
}

+ (BOOL)doesOverridePreferredInterfaceOrientationForPresentation
{
  uint64_t v3 = objc_opt_class();
  return [a1 doesOverrideViewControllerMethod:sel_preferredInterfaceOrientationForPresentation inBaseClass:v3];
}

- (UITabBarController)initWithCoder:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)UITabBarController;
  double v5 = [(UIViewController *)&v52 initWithCoder:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    [(UITabBarController *)v5 _configureTabModel];
    char v7 = [(UIViewController *)v6 traitCollection];
    v6->_unint64_t defaultMaxItems = _UITabBarDefaultMaxItemsForTraitCollection(v7);

    unint64_t v8 = [(UITabBarController *)v6 _effectiveMaxItems];
    uint64_t v9 = [v4 decodeObjectForKey:@"UITabBar"];
    tabBar = v6->_tabBar;
    v6->_tabBar = (UITabBar *)v9;

    [(UITabBar *)v6->_tabBar setLocked:1];
    uint64_t v11 = [v4 decodeObjectForKey:@"UITabBarItemsToViewControllers"];
    id tabBarItemsToViewControllers = v6->_tabBarItemsToViewControllers;
    v6->_id tabBarItemsToViewControllers = (id)v11;

    uint64_t v13 = [v4 decodeObjectForKey:@"UICustomizableViewControllers"];
    customizableViewControllers = v6->_customizableViewControllers;
    v6->_customizableViewControllers = (NSArray *)v13;

    double v15 = [v4 decodeObjectForKey:@"UIDelegate"];
    objc_storeWeak((id *)&v6->_delegate, v15);

    double v16 = [v4 decodeObjectForKey:@"UIViewControllers"];
    uint64_t v17 = [v16 mutableCopy];
    moreChildViewControllers = v6->_moreChildViewControllers;
    v6->_moreChildViewControllers = (NSMutableArray *)v17;

    double v19 = [(UIViewController *)v6 mutableChildViewControllers];
    unint64_t v20 = v8 - 1;
    double v21 = [MEMORY[0x1E4F1CAD0] setWithArray:v6->_moreChildViewControllers];
    double v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v19];
    int v23 = [v21 isEqualToSet:v22];

    unint64_t v24 = [(NSMutableArray *)v6->_moreChildViewControllers count];
    double v25 = v6->_moreChildViewControllers;
    if (v23)
    {
      if (v24 <= v8)
      {
        [v19 setArray:v25];
        [(NSMutableArray *)v6->_moreChildViewControllers removeAllObjects];
      }
      else
      {
        double v26 = -[NSMutableArray subarrayWithRange:](v6->_moreChildViewControllers, "subarrayWithRange:", 0, v8 - 1);
        [v19 setArray:v26];
        -[NSMutableArray removeObjectsInRange:](v6->_moreChildViewControllers, "removeObjectsInRange:", 0, v20);
      }
    }
    else
    {
      if (v24 <= v8)
      {
        if (v25)
        {
          [(NSMutableArray *)v6->_moreChildViewControllers removeAllObjects];
        }
        else
        {
          uint64_t v27 = objc_opt_new();
          long long v28 = v6->_moreChildViewControllers;
          v6->_moreChildViewControllers = (NSMutableArray *)v27;
        }
      }
      else
      {
        -[NSMutableArray removeObjectsInRange:](v6->_moreChildViewControllers, "removeObjectsInRange:", 0, v8 - 1);
      }
      unint64_t v29 = [v19 count];
      BOOL v30 = v29 >= v8;
      unint64_t v31 = v29 - v8;
      if (v31 != 0 && v30 || !v31 && [(NSMutableArray *)v6->_moreChildViewControllers count]) {
        objc_msgSend(v19, "removeObjectsInRange:", v20, v31 + 1);
      }
    }
    double v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v33 = v19;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v49 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = [*(id *)(*((void *)&v48 + 1) + 8 * i) _resolvedTab];
          [v32 addObject:v38];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v35);
    }

    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    double v44 = __36__UITabBarController_initWithCoder___block_invoke;
    double v45 = &unk_1E52D9F98;
    double v39 = v6;
    double v46 = v39;
    id v47 = v32;
    id v40 = v32;
    [(UITabBarController *)v39 _performWithoutNotifyingSelectionChange:&v42];
    *(_DWORD *)&v39->_tabBarControllerFlags |= 2u;
    -[UIViewController setContainmentSupport:](v39, "setContainmentSupport:", 0, v42, v43, v44, v45);
  }
  return v6;
}

void __36__UITabBarController_initWithCoder___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __36__UITabBarController_initWithCoder___block_invoke_2;
  v2[3] = &unk_1E52D9F98;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  +[UIView performWithoutAnimation:v2];
}

uint64_t __36__UITabBarController_initWithCoder___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v1 = (void *)v1[145];
  }
  return [v1 setTabItems:*(void *)(a1 + 40) inferSelection:0];
}

- (void)_populateArchivedChildViewControllers:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UITabBarController;
  [(UIViewController *)&v5 _populateArchivedChildViewControllers:v4];
  [v4 addObjectsFromArray:self->_moreChildViewControllers];
  if (self->_moreNavigationController) {
    objc_msgSend(v4, "removeObject:");
  }
}

- (BOOL)_shouldPersistViewWhenCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UITabBarController;
  [(UIViewController *)&v12 encodeWithCoder:v4];
  tabBar = self->_tabBar;
  if (tabBar) {
    [v4 encodeObject:tabBar forKey:@"UITabBar"];
  }
  id tabBarItemsToViewControllers = self->_tabBarItemsToViewControllers;
  if (tabBarItemsToViewControllers) {
    [v4 encodeObject:tabBarItemsToViewControllers forKey:@"UITabBarItemsToViewControllers"];
  }
  customizableViewControllers = self->_customizableViewControllers;
  if (customizableViewControllers) {
    [v4 encodeObject:customizableViewControllers forKey:@"UICustomizableViewControllers"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained) {
    [v4 encodeConditionalObject:WeakRetained forKey:@"UIDelegate"];
  }
  if ([(UIViewController *)self childViewControllersCount])
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[UIViewController childViewControllersCount](self, "childViewControllersCount")+ -[NSMutableArray count](self->_moreChildViewControllers, "count"));
    [(UITabBarController *)self _populateArchivedChildViewControllers:v9];
    if ([v9 count])
    {
      double v10 = [(UITabBarController *)self viewControllers];
      uint64_t v11 = UIArrayByKeepingObjectsInSet(v10, v9);
      [v4 encodeObject:v11 forKey:@"UIViewControllers"];
    }
  }
}

- (UITabBarController)initWithTabs:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UITabBarController *)self initWithNibName:0 bundle:0];
  uint64_t v6 = v5;
  if (v5) {
    [(UITabBarController *)v5 setTabs:v4];
  }

  return v6;
}

- (void)setCompactTabIdentifiers:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self->_compactTabIdentifiers;
  char v7 = (NSArray *)v5;
  uint64_t v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  char v8 = [(NSArray *)v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_compactTabIdentifiers, a3);
    *(_DWORD *)&self->_tabBarControllerFlags |= 2u;
    [(UITabBarController *)self _rebuildTabBarItemsIfNeeded];
  }
LABEL_9:
}

- (NSString)customizationIdentifier
{
  if (self) {
    self = (UITabBarController *)self->_tabModel;
  }
  return (NSString *)[(UITabBarController *)self persistenceIdentifier];
}

- (void)setCustomizationIdentifier:(id)a3
{
  if (self) {
    self = (UITabBarController *)self->_tabModel;
  }
  [(UITabBarController *)self setPersistenceIdentifier:a3];
}

- (id)_deepestActionResponder
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__UITabBarController__deepestActionResponder__block_invoke;
  v4[3] = &unk_1E52E6838;
  v4[4] = self;
  double v2 = [(UIViewController *)self _deepestPresentedActionResponderOrBlock:v4];
  return v2;
}

id __45__UITabBarController__deepestActionResponder__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) _selectedViewControllerInTabBar];
  if ([v2 _hasDeepestActionResponder])
  {
    id v3 = [*(id *)(a1 + 32) _selectedViewControllerInTabBar];
    id v4 = [v3 _deepestActionResponder];
  }
  else
  {
    v6.receiver = *(id *)(a1 + 32);
    v6.super_class = (Class)UITabBarController;
    id v4 = objc_msgSendSuper2(&v6, sel__deepestActionResponder);
  }

  return v4;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_toggleSidebar_ == a3)
  {
    id v5 = -[UITabBarController _visualStyle]((id *)&self->super.super.super.isa);
    char v6 = [v5 canToggleSidebar];

    return v6;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBarController;
    return -[UIViewController canPerformAction:withSender:](&v7, sel_canPerformAction_withSender_);
  }
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  if ((char *)[v4 action] == sel_toggleSidebar_)
  {
    id v5 = [(UITabBarController *)self sidebar];
    int v6 = [v5 isHidden];

    if (v6) {
      objc_super v7 = @"Show Sidebar";
    }
    else {
      objc_super v7 = @"Hide Sidebar";
    }
    char v8 = _UINSLocalizedStringWithDefaultValue(v7, v7);
    [v4 setTitle:v8];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UITabBarController;
    [(UIResponder *)&v9 validateCommand:v4];
  }
}

- (void)toggleSidebar:(id)a3
{
  id v4 = -[UITabBarController _visualStyle]((id *)&self->super.super.super.isa);
  int v5 = [v4 canToggleSidebar];

  if (v5)
  {
    id v7 = [(UITabBarController *)self sidebar];
    int v6 = [(UITabBarController *)self sidebar];
    -[UITabBarControllerSidebar _setHidden:source:]((uint64_t)v7, [v6 isHidden] ^ 1, 2);
  }
}

uint64_t __87__UITabBarController__selectDefaultViewControllerIfNecessaryWithAppearanceTransitions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelectedViewController:*(void *)(a1 + 40)];
}

- (void)_setTabBarOffscreen:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFDFFF | v3);
}

- (BOOL)_isTabBarOffscreen
{
  return (*((unsigned __int8 *)&self->_tabBarControllerFlags + 1) >> 5) & 1;
}

- (void)_setAccessoryView:(id)a3
{
  int v5 = (UIView *)a3;
  if (self->_accessoryView != v5)
  {
    int v6 = v5;
    objc_storeStrong((id *)&self->_accessoryView, a3);
    *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20u;
    [(UITabBarController *)self _prepareTabBar];
    int v5 = v6;
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UITabBarController;
  id v7 = a4;
  [(UIViewController *)&v11 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__UITabBarController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E52DB270;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 animateAlongsideTransition:v9 completion:0];
}

uint64_t __80__UITabBarController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if ((result & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 _updateLayoutForTraitCollection:v5];
  }
  return result;
}

- (BOOL)_reallyWantsFullScreenLayout
{
  return 1;
}

- (id)_viewControllersForTabs
{
  if (a1)
  {
    if ((*((unsigned char *)a1 + 1113) & 0x80) != 0)
    {
      a1 = (id *)a1[140];
    }
    else
    {
      a1 = [a1 viewControllers];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(_UITabBarControllerVisualStyle *)self->_visualStyle shouldSuppressPresses:v6 withEvent:v7])
  {
    v8.receiver = self;
    v8.super_class = (Class)UITabBarController;
    [(UIResponder *)&v8 pressesBegan:v6 withEvent:v7];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(_UITabBarControllerVisualStyle *)self->_visualStyle shouldSuppressPresses:v6 withEvent:v7])
  {
    v8.receiver = self;
    v8.super_class = (Class)UITabBarController;
    [(UIResponder *)&v8 pressesCancelled:v6 withEvent:v7];
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(_UITabBarControllerVisualStyle *)self->_visualStyle shouldSuppressPresses:v6 withEvent:v7])
  {
    v8.receiver = self;
    v8.super_class = (Class)UITabBarController;
    [(UIResponder *)&v8 pressesChanged:v6 withEvent:v7];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(_UITabBarControllerVisualStyle *)self->_visualStyle shouldSuppressPresses:v6 withEvent:v7])
  {
    v8.receiver = self;
    v8.super_class = (Class)UITabBarController;
    [(UIResponder *)&v8 pressesEnded:v6 withEvent:v7];
  }
}

- (void)_performFocusGesture:(unint64_t)a3
{
  id v10 = [(UIViewController *)self _focusSystem];
  uint64_t v5 = [(UITabBarController *)self selectedViewController];
  if ([v5 isViewLoaded])
  {
    id v6 = [v5 view];
    int v7 = [v10 _focusedItemIsContainedInEnvironment:v6 includeSelf:1];

    if (v7)
    {
      objc_super v8 = [v10 focusedItem];
      [(UITabBarController *)self _rememberFocusedItem:v8 forViewController:v5];
    }
  }
  *(_DWORD *)&self->_tabBarControllerFlags |= 0x200u;
  if ([(_UITabBarControllerVisualStyle *)self->_visualStyle updatesTabBarFocusHeadingOnChange])
  {
    objc_super v9 = [(UITabBarController *)self tabBar];
    [v9 _setPreferredFocusHeading:a3];
  }
  [(UIViewController *)self _setNeedsNonDeferredFocusUpdate];
}

- (id)_responderSelectionContainerViewForResponder:(id)a3
{
  if ([(UITabBarController *)self _isTabBarFocused])
  {
    id v4 = [(UITabBarController *)self tabBar];
  }
  else
  {
    id v4 = self->_viewControllerTransitionView;
  }
  return v4;
}

- (BOOL)_isTabBarFocused
{
  int v3 = [(_UITabBarControllerVisualStyle *)self->_visualStyle tabBarView];
  id v4 = [(UIViewController *)self _focusSystem];
  uint64_t v5 = [v4 _focusedView];
  char v6 = [v5 isDescendantOfView:v3];

  return v6;
}

- (void)_setPreferTabBarFocused:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFDFF | v3);
}

- (BOOL)_preferTabBarFocused
{
  return (*((unsigned __int8 *)&self->_tabBarControllerFlags + 1) >> 1) & 1;
}

- (void)unwindForSegue:(id)a3 towardsViewController:(id)a4
{
  id v7 = a4;
  uint64_t v5 = [(UITabBarController *)self viewControllers];
  int v6 = [v5 containsObject:v7];

  if (v6) {
    [(UITabBarController *)self setSelectedViewController:v7];
  }
}

- (void)applicationWillSuspend
{
  v4.receiver = self;
  v4.super_class = (Class)UITabBarController;
  [(UIViewController *)&v4 applicationWillSuspend];
  int v3 = +[_UITabAnalytics sharedInstance]();
  -[_UITabAnalytics updateStatusIfNeeded:](v3, self);
}

- (NSArray)_tabElements
{
  return [(_UITabModel *)self->_tabModel tabItems];
}

- (UITab)_selectedTabElement
{
  return [(_UITabModel *)self->_tabModel selectedItem];
}

- (uint64_t)_shouldSelectTab:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_super v4 = [(id)a1 delegate];
    if (([v3 _isBridgedItem] & 1) != 0
      || (id v5 = objc_loadWeakRetained((id *)(a1 + 1176)),
          char v6 = objc_opt_respondsToSelector(),
          v5,
          (v6 & 1) == 0))
    {
      a1 = 1;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1176));
      a1 = [WeakRetained tabBarController:a1 shouldSelectTab:v3];
    }
  }

  return a1;
}

- (id)_resolvedPopoverPresentationControllerSourceItemForTab:(id *)a1
{
  if (a1)
  {
    a1 = [a1[136] resolvedPopoverPresentationControllerSourceItemForTab:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)_displayedViewControllerDidChangeForTab:(void *)a3 previousViewController:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1 && (*(unsigned char *)(a1 + 1113) & 0x80) != 0)
  {
    if ([v5 _isUniquelySPI])
    {
      unint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:sel__displayedViewControllerDidChangeForTab_previousViewController_, a1, @"UITabBarController.m", 1528, @"_UITabElement (%@) is not supported with displayedViewControllers", v5 object file lineNumber description];
    }
    id v7 = [v5 _displayedViewController];
    objc_super v8 = &OBJC_IVAR___UITab__hiddenByDefault;
    objc_super v9 = (void *)[*(id *)(a1 + 1120) mutableCopy];
    uint64_t v10 = [*(id *)(a1 + 1120) indexOfObject:v6];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL
      && ([(id)a1 tabs],
          objc_super v11 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v11 indexOfObject:v5],
          v11,
          v10 == 0x7FFFFFFFFFFFFFFFLL))
    {
      [v9 removeAllObjects];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      objc_super v12 = [(id)a1 tabs];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = [*(id *)(*((void *)&v21 + 1) + 8 * v16) _displayedViewController];
            [v9 addObject:v17];

            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v14);
      }

      objc_super v8 = &OBJC_IVAR___UITab__hiddenByDefault;
    }
    else
    {
      [v9 replaceObjectAtIndex:v10 withObject:v7];
    }
    [(id)a1 _setViewControllers:v9 animated:0];
    uint64_t v18 = v8[736];
    double v19 = *(void **)(a1 + v18);
    *(void *)(a1 + v18) = v9;
  }
}

- (id)_displayedViewControllersForTab:(void *)a3 proposedViewControllers:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 147);
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0
      || (id v9 = objc_loadWeakRetained(a1 + 147),
          [v9 tabBarController:a1 displayedViewControllersForTab:v5 proposedViewControllers:v6],
          a1 = (id *)objc_claimAutoreleasedReturnValue(),
          v9,
          !a1))
    {
      a1 = (id *)v6;
    }
  }

  return a1;
}

- (id)preferredFocusedView
{
  if ((*((unsigned char *)&self->_tabBarControllerFlags + 1) & 2) != 0)
  {
    objc_super v4 = [(_UITabBarControllerVisualStyle *)self->_visualStyle tabBarView];
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v3 = [(UITabBarController *)self selectedViewController];
    objc_super v4 = [v3 preferredFocusedItem];

    if (v4)
    {
LABEL_3:
      id v5 = v4;
      goto LABEL_6;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)UITabBarController;
  id v5 = [(UIViewController *)&v8 preferredFocusedView];
LABEL_6:
  id v6 = v5;

  return v6;
}

- (int64_t)_subclassPreferredFocusedViewPrioritizationType
{
  if (!qword_1EB25E608)
  {
    qword_1EB25E608 = +[UITabBarController instanceMethodForSelector:sel_preferredFocusedView];
    qword_1EB25E610 = +[UITabBarController instanceMethodForSelector:sel_preferredFocusEnvironments];
  }
  uint64_t v3 = [(UITabBarController *)self methodForSelector:sel_preferredFocusedView];
  uint64_t v4 = [(UITabBarController *)self methodForSelector:sel_preferredFocusEnvironments];
  if (v3) {
    BOOL v5 = v3 == qword_1EB25E608;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0;
  }
  if (v4) {
    BOOL v7 = v4 == qword_1EB25E610;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)preferredFocusEnvironments
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(UITabBarController *)self selectedViewController];
  uint64_t v5 = [(_UITabBarControllerVisualStyle *)self->_visualStyle tabBarView];
  id v6 = (void *)v5;
  if ((*((unsigned char *)&self->_tabBarControllerFlags + 1) & 2) == 0)
  {
    if (v4) {
      [v3 addObject:v4];
    }
    BOOL v7 = v6;
    if (!v6) {
      goto LABEL_10;
    }
LABEL_9:
    [v3 addObject:v7];
    goto LABEL_10;
  }
  if (v5) {
    [v3 addObject:v5];
  }
  BOOL v7 = v4;
  if (v4) {
    goto LABEL_9;
  }
LABEL_10:
  v11.receiver = self;
  v11.super_class = (Class)UITabBarController;
  objc_super v8 = [(UIViewController *)&v11 preferredFocusEnvironments];
  [v3 addObjectsFromArray:v8];

  id v9 = _UIFocusEnvironmentCombinedPreferredFocusEnvironments(self, v3, [(UITabBarController *)self _subclassPreferredFocusedViewPrioritizationType]);

  return v9;
}

- (void)_rememberPresentingFocusedItem:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITabBarController;
  id v4 = a3;
  [(UIViewController *)&v6 _rememberPresentingFocusedItem:v4];
  uint64_t v5 = [(UITabBarController *)self selectedViewController];
  [(UITabBarController *)self _rememberFocusedItem:v4 forViewController:v5];
}

- (BOOL)_canRestoreFocusAfterTransitionToRecalledItem:(id)a3 inViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dyld_program_sdk_at_least())
  {
    char IsFocusedOrFocusable = [(UIViewController *)self _canRestoreFocusAfterTransitionToItem:v6];
  }
  else if ([(UIViewController *)self restoresFocusAfterTransition] {
         && [v7 restoresFocusAfterTransition])
  }
  {
    id v9 = [(UIViewController *)self view];
    if (_UIFocusEnvironmentIsAncestorOfEnvironment(v9, v6)) {
      char IsFocusedOrFocusable = _UIFocusItemIsFocusedOrFocusable(v6);
    }
    else {
      char IsFocusedOrFocusable = 0;
    }
  }
  else
  {
    char IsFocusedOrFocusable = 0;
  }

  return IsFocusedOrFocusable;
}

- (id)_overridingPreferredFocusEnvironment
{
  v14.receiver = self;
  v14.super_class = (Class)UITabBarController;
  id v3 = [(UIViewController *)&v14 _overridingPreferredFocusEnvironment];
  if (!v3)
  {
    id v4 = [(UIViewController *)self _existingView];
    uint64_t v5 = [v4 _window];
    if (!v5)
    {
      id v3 = 0;
LABEL_18:

      goto LABEL_19;
    }
    $BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = self->_tabBarControllerFlags;

    if ((*(_WORD *)&tabBarControllerFlags & 0x200) != 0)
    {
      id v3 = 0;
      goto LABEL_19;
    }
    id v4 = [(UITabBarController *)self selectedViewController];
    id v7 = [(UITabBarController *)self _recallRememberedFocusedItemForViewController:v4];
    if (v7)
    {
      if ([(UITabBarController *)self _canRestoreFocusAfterTransitionToRecalledItem:v7 inViewController:v4])
      {
        id v3 = v7;
LABEL_17:

        goto LABEL_18;
      }
      [(UITabBarController *)self _forgetFocusedItemForViewController:v4];
    }
    else if ([(UITabBarController *)self _isModernTVTabBar] {
           && [(UITabBarController *)self _shouldFocusViewControllerAfterTransition])
    }
    {
      objc_super v8 = [v4 preferredFocusEnvironments];
      id v9 = [v8 firstObject];

      uint64_t v10 = [(UIViewController *)self _focusSystem];
      uint64_t v11 = [v10 focusedItem];
      objc_super v12 = (void *)v11;
      if (!v9
        || v9 == (void *)v11
        || [v10 _focusedItemIsContainedInEnvironment:v9 includeSelf:1])
      {
        [(UITabBarController *)self set_shouldFocusViewControllerAfterTransition:0];
        id v3 = 0;
      }
      else
      {
        id v3 = v9;
      }

      goto LABEL_17;
    }
    id v3 = 0;
    goto LABEL_17;
  }
LABEL_19:
  return v3;
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UITabBarController;
  [(UIViewController *)&v12 _didUpdateFocusInContext:v5];
  id v6 = [(UITabBarController *)self selectedViewController];
  id v7 = [v6 view];
  objc_super v8 = [v5 nextFocusedItem];
  BOOL IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(v7, v8);

  if ([(_UITabBarControllerVisualStyle *)self->_visualStyle shouldForgetRememberedFocusItemForSelectedViewController:v6 context:v5])
  {
    [(UITabBarController *)self _forgetFocusedItemForViewController:v6];
  }
  uint64_t v10 = +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:v5];
  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UITabBarController.m" lineNumber:1681 description:@"Received call to _didUpdateFocusInContext: outside of a focus update."];
  }
  [(UITabBarController *)self _setPreferTabBarFocused:[(UITabBarController *)self _isTabBarFocused]];
  [(_UITabBarControllerVisualStyle *)self->_visualStyle didUpdateFocusInContext:v5 withAnimationCoordinator:v10];
  if (IsAncestorOfEnvironment) {
    [(UITabBarController *)self set_shouldFocusViewControllerAfterTransition:0];
  }
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)UITabBarController;
  if (![(UIViewController *)&v30 shouldUpdateFocusInContext:v4])
  {
    BOOL v5 = 0;
    goto LABEL_33;
  }
  if (([v4 focusHeading] & 0x330) == 0)
  {
    id v6 = [v4 nextFocusedView];
    id v7 = [(UITabBarController *)self tabBar];
    int v8 = [v6 isDescendantOfView:v7];

    id v9 = [v4 previouslyFocusedView];
    uint64_t v10 = [(UITabBarController *)self tabBar];
    int v11 = [v9 isDescendantOfView:v10];

    int v12 = 0;
    if (((v8 ^ 1) & 1) == 0 && (v11 & 1) == 0) {
      int v12 = (*((unsigned __int8 *)&self->_tabBarControllerFlags + 1) >> 5) & 1;
    }
    int v13 = (v8 ^ 1) & v11;
    if ((v12 & 1) != 0 || v13)
    {
      switch([(UITabBarController *)self _effectiveTabBarPosition])
      {
        case 1:
          uint64_t v14 = [v4 focusHeading];
          uint64_t v15 = 1;
          if (v12) {
            uint64_t v15 = 2;
          }
          goto LABEL_22;
        case 2:
          uint64_t v14 = [v4 focusHeading];
          uint64_t v15 = 1;
          if (!v12) {
            uint64_t v15 = 2;
          }
          goto LABEL_22;
        case 3:
          uint64_t v14 = [v4 focusHeading];
          BOOL v16 = v12 == 0;
          uint64_t v15 = 8;
          uint64_t v17 = 4;
          goto LABEL_20;
        case 4:
          uint64_t v14 = [v4 focusHeading];
          BOOL v16 = v12 == 0;
          uint64_t v15 = 4;
          uint64_t v17 = 8;
LABEL_20:
          if (!v16) {
            uint64_t v15 = v17;
          }
LABEL_22:
          BOOL v5 = (v14 & v15) != 0;
          break;
        default:
          goto LABEL_10;
      }
    }
    else
    {
LABEL_10:
      BOOL v5 = 1;
    }
    uint64_t v18 = [(UIViewController *)self _splitViewControllerEnforcingClass:0];
    double v19 = [v18 viewControllers];
    unint64_t v20 = [v19 firstObject];

    long long v21 = [v18 viewControllers];
    long long v22 = [v21 lastObject];

    if (!v13 || ([v4 focusHeading] & 2) != 0) {
      goto LABEL_32;
    }
    long long v23 = [(UIViewController *)self view];
    uint64_t v24 = [v23 effectiveUserInterfaceLayoutDirection];

    if (v20 == self)
    {
      uint64_t v25 = [v4 focusHeading];
      BOOL v26 = v24 == 1;
      uint64_t v27 = 8;
      uint64_t v28 = 4;
    }
    else
    {
      if (v22 != self)
      {
LABEL_32:

        goto LABEL_33;
      }
      uint64_t v25 = [v4 focusHeading];
      BOOL v26 = v24 == 1;
      uint64_t v27 = 4;
      uint64_t v28 = 8;
    }
    if (v26) {
      uint64_t v27 = v28;
    }
    BOOL v5 = (v25 & v27) != 0;
    goto LABEL_32;
  }
  BOOL v5 = 1;
LABEL_33:

  return v5;
}

- (NSMapTable)_rememberedFocusedItemsByViewController
{
  rememberedFocusedItemsByViewController = self->_rememberedFocusedItemsByViewController;
  if (!rememberedFocusedItemsByViewController)
  {
    id v4 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    BOOL v5 = self->_rememberedFocusedItemsByViewController;
    self->_rememberedFocusedItemsByViewController = v4;

    rememberedFocusedItemsByViewController = self->_rememberedFocusedItemsByViewController;
  }
  return rememberedFocusedItemsByViewController;
}

- (void)_rememberFocusedItem:(id)a3 forViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UITabBarController *)self _rememberedFocusedItemsByViewController];
  [v8 setObject:v7 forKey:v6];
}

- (void)_forgetFocusedItemForViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(UITabBarController *)self _rememberedFocusedItemsByViewController];
  [v5 removeObjectForKey:v4];
}

- (id)_recallRememberedFocusedItemForViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(UITabBarController *)self _rememberedFocusedItemsByViewController];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (BOOL)_isFocusedTabVisible
{
  int64_t v3 = [(UITabBar *)self->_tabBar _focusedIndex];
  id v4 = [(UITabBarController *)self viewControllers];
  id v5 = [(UITabBarController *)self selectedViewController];
  uint64_t v6 = [v4 indexOfObject:v5];

  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v3 = [(UITabBarController *)self selectedIndex];
  }
  return v3 == v6;
}

uint64_t __39__UITabBarController__tabs_compactTabs__block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqual:v6];
    }
  }

  return v8;
}

uint64_t __51__UITabBarController__setViewControllers_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelectedViewController:*(void *)(a1 + 40)];
}

- (id)childViewControllerForUserInterfaceStyle
{
  return self->_selectedViewController;
}

- (id)childViewControllerForPointerLock
{
  return self->_selectedViewController;
}

- (id)_childViewControllerForMultitaskingDragExclusionRects
{
  return self->_selectedViewController;
}

- (id)_childViewControllerForExclusiveCollectionPhysicalButtonConfigurations
{
  return self->_selectedViewController;
}

- (BOOL)_transitionsChildViewControllers
{
  return 0;
}

- (BOOL)_uip_isSidebarVisible
{
  uint64_t v2 = [(UITabBarController *)self sidebar];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (void)_uip_setSidebarVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UITabBarController *)self sidebar];
  [v4 setHidden:!v3];
}

- (int64_t)_uip_preferredSidebarMode
{
  int64_t v2 = [(UITabBarController *)self mode];
  if (v2 == 1) {
    return 1;
  }
  else {
    return 2 * (v2 == 2);
  }
}

- (void)_tab:(void *)a3 operationForAcceptingItemsFromDropSession:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    int v7 = [v5 _isUniquelySPI];
    uint64_t v8 = [a1 delegate];
    if (v7)
    {
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        uint64_t v10 = [a1 delegate];
        uint64_t v11 = objc_msgSend(v10, "_uip_tabBarController:tab:operationForAcceptingItemsFromDropSession:", a1, v5, v6);
LABEL_7:
        a1 = (void *)v11;

        goto LABEL_9;
      }
    }
    else
    {
      int v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        uint64_t v10 = [a1 delegate];
        uint64_t v11 = [v10 tabBarController:a1 tab:v5 operationForAcceptingItemsFromDropSession:v6];
        goto LABEL_7;
      }
    }
    a1 = 0;
  }
LABEL_9:

  return a1;
}

- (void)_tab:(void *)a3 acceptItemsFromDropSession:
{
  id v11 = a2;
  id v5 = a3;
  if (a1)
  {
    int v6 = [v11 _isUniquelySPI];
    int v7 = [a1 delegate];
    if (v6)
    {
      char v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) == 0) {
        goto LABEL_8;
      }
      char v9 = [a1 delegate];
      objc_msgSend(v9, "_uip_tabBarController:tab:acceptItemsFromDropSession:", a1, v11, v5);
    }
    else
    {
      int v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0) {
        goto LABEL_8;
      }
      char v9 = [a1 delegate];
      [v9 tabBarController:a1 tab:v11 acceptItemsFromDropSession:v5];
    }
  }
LABEL_8:
}

- (void)_tabDropSessionDidUpdate:(void *)a3 withDestinationTab:
{
  id v9 = a2;
  id v5 = a3;
  if (a1)
  {
    int v6 = [a1 delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [a1 delegate];
      objc_msgSend(v8, "_uip_tabBarController:dropSessionDidUpdate:withDestinationTab:", a1, v9, v5);
    }
  }
}

- (double)_sidebarOverlapAmount
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v1 = [a1 sidebar];
  double Width = 0.0;
  if (-[UITabBarControllerSidebar _resolvedLayout]((uint64_t)v1) == 1
    && -[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v1))
  {
    BOOL v3 = [v1 _outlineView];
    [v3 frame];
    double Width = CGRectGetWidth(v5);
  }
  return Width;
}

- (void)beginCustomizingTabBar:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F28E10], "weakToWeakObjectsMapTable", a3);
  id tabBarItemsToViewControllers = self->_tabBarItemsToViewControllers;
  self->_id tabBarItemsToViewControllers = v4;

  int v6 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  char v7 = [(UITabBarController *)self viewControllers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v13 = [v12 tabBarItem];
        [self->_tabBarItemsToViewControllers setObject:v12 forKey:v13];
        uint64_t v14 = [(UITabBarController *)self customizableViewControllers];
        LODWORD(v12) = [v14 containsObject:v12];

        if (v12) {
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  uint64_t v15 = [(UITabBarController *)self tabBar];
  [v15 setLocked:0];

  BOOL v16 = [(UITabBarController *)self tabBar];
  [v16 beginCustomizingItems:v6];

  uint64_t v17 = [(UITabBarController *)self tabBar];
  [v17 setLocked:1];
}

- (void)tabBar:(id)a3 willBeginCustomizingItems:(id)a4
{
  id v6 = [(UITabBarController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    CGRect v5 = [(UITabBarController *)self viewControllers];
    [v6 tabBarController:self willBeginCustomizingViewControllers:v5];
  }
}

- (void)tabBarSizingDidChange:(id)a3
{
  *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20u;
  id v4 = [(UIViewController *)self _existingView];

  if (v4)
  {
    [(UITabBarController *)self _prepareTabBar];
  }
}

- (id)_viewsWithDisabledInteractionGivenTransitionContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITabBarController;
  id v4 = [(UIViewController *)&v6 _viewsWithDisabledInteractionGivenTransitionContext:a3];
  if (!v4) {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  if (self->_tabBar) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (void)tabBar:(id)a3 willEndCustomizingItems:(id)a4 changed:(BOOL)a5
{
  uint64_t v5 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v24 = a4;
  char v7 = [(UIViewController *)self mutableChildViewControllers];
  if (!v5) {
    goto LABEL_23;
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v24, "count"));
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __61__UITabBarController_tabBar_willEndCustomizingItems_changed___block_invoke;
  v32[3] = &unk_1E52E7F78;
  v32[4] = self;
  id v9 = v8;
  id v33 = v9;
  [v24 enumerateObjectsUsingBlock:v32];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v9;
  uint64_t v25 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (!v25) {
    goto LABEL_20;
  }
  uint64_t v26 = 0;
  uint64_t v23 = *(void *)v29;
  do
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v29 != v23) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      int v12 = [v24 objectAtIndex:v26 + i];
      int v13 = [v7 objectAtIndex:v26 + i];
      if (v13 != v11)
      {
        *(_DWORD *)&self->_tabBarControllerFlags |= 2u;
        uint64_t v14 = [(NSMutableArray *)self->_moreChildViewControllers indexOfObjectIdenticalTo:v11];
        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if ([obj indexOfObjectIdenticalTo:v13] == 0x7FFFFFFFFFFFFFFFLL)
          {
            [(NSMutableArray *)self->_moreChildViewControllers addObject:v13];
            goto LABEL_15;
          }
        }
        else
        {
          uint64_t v15 = v14;
          [v11 willMoveToParentViewController:self];
          [(UIViewController *)self _addChildViewController:v11];
          [v11 didMoveToParentViewController:self];
          if ([obj indexOfObjectIdenticalTo:v13] == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v16 = (id)[v13 popToRootViewControllerAnimated:0];
            }
            [(NSMutableArray *)self->_moreChildViewControllers replaceObjectAtIndex:v15 withObject:v13];
LABEL_15:
            [v13 willMoveToParentViewController:0];
            [(UIViewController *)self _removeChildViewController:v13];
            [v13 didMoveToParentViewController:0];
          }
          else
          {
            [(NSMutableArray *)self->_moreChildViewControllers removeObjectAtIndex:v15];
          }
        }
        [v7 replaceObjectAtIndex:v26 + i withObject:v11];
        [(UITabBarController *)self _configureTargetActionForTabBarItem:v12];
      }
    }
    uint64_t v25 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    v26 += i;
  }
  while (v25);
LABEL_20:

  unint64_t v17 = [v7 count];
  if (v17 > [(UITabBarController *)self _effectiveMaxItems])
  {
    long long v18 = [(UITabBarController *)self _existingMoreNavigationController];
    [v18 setMoreViewControllersChanged:1];

    long long v19 = [(UITabBarController *)self _existingMoreNavigationController];
    [v19 setMoreViewControllers:self->_moreChildViewControllers];
  }
  id tabBarItemsToViewControllers = self->_tabBarItemsToViewControllers;
  self->_id tabBarItemsToViewControllers = 0;

  [(UITabBarController *)self _rebuildTabBarItemsIfNeeded];
  uint64_t v5 = v5;
LABEL_23:
  long long v21 = [(UITabBarController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    long long v22 = [(UITabBarController *)self viewControllers];
    [v21 tabBarController:self willEndCustomizingViewControllers:v22 changed:v5];
  }
}

void __61__UITabBarController_tabBar_willEndCustomizingItems_changed___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 1000) objectForKey:a2];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    BOOL v3 = v4;
  }
}

- (void)tabBar:(id)a3 didEndCustomizingItems:(id)a4 changed:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = [(UITabBarController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v7 = [(UITabBarController *)self viewControllers];
    [v8 tabBarController:self didEndCustomizingViewControllers:v7 changed:v5];
  }
}

- (void)_hideBarWithTransition:(int)a3 isExplicit:(BOOL)a4 duration:(double)a5
{
}

void __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 976) _expectedSuperviewFollowingAnimation];
  [v4 addSubview:*(void *)(*(void *)(a1 + 32) + 976)];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "set_expectedSuperviewFollowingAnimation:", 0);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if ([v3 isCancelled])
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 1112) = *(_DWORD *)(*(void *)(a1 + 32) + 1112) & 0xFFFFFFF3 | (4 * (((*(_DWORD *)(*(void *)(a1 + 32) + 1112) & (4 * ~*(_DWORD *)(a1 + 56))) >> 2) & 3));
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      objc_super v6 = *(void **)(v5 + 1088);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_4;
      v9[3] = &unk_1E52D9F70;
      v9[4] = v5;
      [v6 performWithoutNotifyingTabBarController:v9];
    }
    if (*(unsigned char *)(a1 + 65))
    {
      [*(id *)(a1 + 40) _setDidExplicitlyHideTabBar:*(unsigned __int8 *)(a1 + 66)];
      [*(id *)(a1 + 40) _setCrossfadingOutTabBar:0];
    }
  }
  char v7 = *(void **)(a1 + 32);
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isCancelled") ^ 1);
  [v7 animationDidStop:@"UITabBarControllerHideBar" finished:v8 context:0];
}

uint64_t __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _wantsBarHidden];
  id v3 = *(void **)(*(void *)(a1 + 32) + 1088);
  return [v3 setBarHidden:v2];
}

void __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  [v2 animationDidStop:@"UITabBarControllerHideBar" finished:v3 context:0];
}

void __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isInteractive]) {
    uint64_t v4 = 196704;
  }
  else {
    uint64_t v4 = 0;
  }
  [v3 transitionDuration];
  double v6 = v5;

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_7;
  v7[3] = &unk_1E52DA040;
  id v8 = *(id *)(a1 + 32);
  +[UIView animateWithDuration:v4 delay:v7 options:0 animations:v6 completion:0.0];
}

uint64_t __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isCancelled])
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 1112) = *(_DWORD *)(*(void *)(a1 + 32) + 1112) & 0xFFFFFFF3 | (4 * (((*(_DWORD *)(*(void *)(a1 + 32) + 1112) & (4 * ~*(_DWORD *)(a1 + 48))) >> 2) & 3));
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      double v5 = *(void **)(v4 + 1088);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_9;
      v8[3] = &unk_1E52D9F70;
      v8[4] = v4;
      [v5 performWithoutNotifyingTabBarController:v8];
    }
    if (*(unsigned char *)(a1 + 57))
    {
      [*(id *)(a1 + 40) _setDidExplicitlyHideTabBar:*(unsigned __int8 *)(a1 + 58)];
      [*(id *)(a1 + 40) _setCrossfadingOutTabBar:0];
    }
  }
  double v6 = *(void **)(a1 + 32);
  char v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isCancelled") ^ 1);
  [v6 animationDidStop:@"UITabBarControllerHideBar" finished:v7 context:0];
}

uint64_t __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _wantsBarHidden];
  id v3 = *(void **)(*(void *)(a1 + 32) + 1088);
  return [v3 setBarHidden:v2];
}

- (void)hideBarWithTransition:(int)a3
{
}

- (void)hideBarWithTransition:(int)a3 duration:(double)a4
{
}

void __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 976) _expectedSuperviewFollowingAnimation];
  [v4 addSubview:*(void *)(*(void *)(a1 + 32) + 976)];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "set_expectedSuperviewFollowingAnimation:", 0);
  [*(id *)(*(void *)(a1 + 32) + 976) _setSafeAreaInsetsFrozen:*(unsigned __int8 *)(a1 + 64)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if ([v3 isCancelled])
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 1112) |= 4 * (*(_DWORD *)(a1 + 56) & 3);
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = *(void **)(v5 + 1088);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_4;
    v9[3] = &unk_1E52D9F70;
    v9[4] = v5;
    [v6 performWithoutNotifyingTabBarController:v9];
    if (*(unsigned char *)(a1 + 65))
    {
      [*(id *)(a1 + 40) _setDidExplicitlyHideTabBar:*(unsigned __int8 *)(a1 + 66)];
      [*(id *)(a1 + 40) _setCrossfadingInTabBar:0];
    }
  }
  char v7 = *(void **)(a1 + 32);
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isCancelled") ^ 1);
  [v7 animationDidStop:@"UITabBarControllerShowBar" finished:v8 context:0];
}

uint64_t __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _wantsBarHidden];
  id v3 = *(void **)(*(void *)(a1 + 32) + 1088);
  return [v3 setBarHidden:v2];
}

void __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  [v2 animationDidStop:@"UITabBarControllerShowBar" finished:v3 context:0];
}

void __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isInteractive]) {
    uint64_t v4 = 196704;
  }
  else {
    uint64_t v4 = 0;
  }
  [v3 transitionDuration];
  double v6 = v5;

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_7;
  v7[3] = &unk_1E52DA040;
  id v8 = *(id *)(a1 + 32);
  +[UIView animateWithDuration:v4 delay:v7 options:0 animations:v6 completion:0.0];
}

uint64_t __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isCancelled])
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 1112) |= 4 * (*(_DWORD *)(a1 + 48) & 3);
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = *(void **)(v4 + 1088);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_9;
    v8[3] = &unk_1E52D9F70;
    v8[4] = v4;
    [v5 performWithoutNotifyingTabBarController:v8];
    if (*(unsigned char *)(a1 + 56))
    {
      [*(id *)(a1 + 40) _setDidExplicitlyHideTabBar:*(unsigned __int8 *)(a1 + 57)];
      [*(id *)(a1 + 40) _setCrossfadingInTabBar:0];
    }
  }
  double v6 = *(void **)(a1 + 32);
  char v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isCancelled") ^ 1);
  [v6 animationDidStop:@"UITabBarControllerShowBar" finished:v7 context:0];
}

uint64_t __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _wantsBarHidden];
  id v3 = *(void **)(*(void *)(a1 + 32) + 1088);
  return [v3 setBarHidden:v2];
}

- (void)showBarWithTransition:(int)a3 duration:(double)a4
{
}

- (void)showBarWithTransition:(int)a3
{
}

- (id)_observingScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);
  return WeakRetained;
}

- (void)_forceUpdateScrollViewIfNecessary
{
  if (_UIViewControllerUseContentScrollViewAPI())
  {
    $BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = self->_tabBarControllerFlags;
    if ((*(_DWORD *)&tabBarControllerFlags & 0x20000) == 0)
    {
      self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&tabBarControllerFlags | 0x20000);
      id v5 = [(_UITabBarControllerVisualStyle *)self->_visualStyle viewControllerForObservableScrollViewFromViewController:self->_selectedViewController];
      uint64_t v4 = objc_msgSend(v5, "_contentOrObservableScrollViewForEdge:", -[UITabBarController _relevantEdgeForScrollViewObservation](self, "_relevantEdgeForScrollViewObservation"));
      [(UITabBarController *)self _updateAndObserveScrollView:v4 viewController:v5 updateBackgroundTransitionProgressForNilScrollView:1];
    }
  }
}

- (void)_viewControllerObservableScrollViewAmbiguityStatusDidChange:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (((*((_DWORD *)v4 + 94) >> 1) & 3u) - 1 <= 1)
    {
      id v10 = v4;
      if ((_UIBarsApplyChromelessEverywhere() & 1) != 0
        || (v6 = _UIViewControllerUseContentScrollViewAPI(), id v5 = v10, v6))
      {
        unint64_t v7 = [(UITabBarController *)self _relevantEdgeForScrollViewObservation];
        id v8 = [(_UITabBarControllerVisualStyle *)self->_visualStyle viewControllerForObservableScrollViewFromViewController:v10];
        id v9 = [v8 _contentOrObservableScrollViewForEdge:v7];
        [(UITabBarController *)self _updateAndObserveScrollView:v9 viewController:v8];

        id v5 = v10;
      }
    }
  }
}

- (void)_setSuspendBarBackgroundUpdating:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFF7FF | v3);
}

- (BOOL)_suspendBarBackgroundUpdating
{
  return (*((unsigned __int8 *)&self->_tabBarControllerFlags + 1) >> 3) & 1;
}

- (void)_suspendAllTabBarBackgroundUpdates
{
  int64_t backgroundUpdatesSuspendCount = self->_backgroundUpdatesSuspendCount;
  self->_int64_t backgroundUpdatesSuspendCount = backgroundUpdatesSuspendCount + 1;
  if (!backgroundUpdatesSuspendCount) {
    [(UITabBar *)self->_tabBar _setSuspendBackgroundUpdates:1];
  }
}

- (void)_resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary:(BOOL)a3 animated:(BOOL)a4
{
  int64_t backgroundUpdatesSuspendCount = self->_backgroundUpdatesSuspendCount;
  if (backgroundUpdatesSuspendCount)
  {
    int64_t v6 = backgroundUpdatesSuspendCount - 1;
    self->_int64_t backgroundUpdatesSuspendCount = v6;
    if (!v6)
    {
      if (!a3 || (*((unsigned char *)&self->_tabBarControllerFlags + 2) & 4) != 0)
      {
        tabBar = self->_tabBar;
        -[UITabBar _setSuspendBackgroundUpdates:](tabBar, "_setSuspendBackgroundUpdates:", 0, a4);
      }
      else
      {
        BOOL v7 = a4;
        objc_initWeak(location, self);
        id v8 = [(UITabBarController *)self _observingScrollView];
        id v9 = [(UITabBarController *)self tabBar];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __85__UITabBarController__resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary_animated___block_invoke;
        v13[3] = &unk_1E52DC888;
        objc_copyWeak(&v14, location);
        [(UITabBarController *)self _updateBackgroundTransitionProgressForScrollView:v8 tabBar:v9 isNavigationTransitionUpdate:0 forceTwoPartCrossfade:v7 completion:v13];

        objc_destroyWeak(&v14);
        objc_destroyWeak(location);
      }
    }
  }
  else if (os_variant_has_internal_diagnostics())
  {
    int v12 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "Over-release of backgorund updates on tab bar controller.", (uint8_t *)location, 2u);
    }
  }
  else
  {
    id v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary_animated____s_category)+ 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Over-release of backgorund updates on tab bar controller.", (uint8_t *)location, 2u);
    }
  }
}

void __85__UITabBarController__resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[138])
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained[122] _setSuspendBackgroundUpdates:0];
    id WeakRetained = v2;
  }
}

uint64_t __140__UITabBarController__updateBackgroundTransitionProgressForScrollView_tabBar_isNavigationTransitionUpdate_forceTwoPartCrossfade_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setBackgroundTransitionProgress:*(unsigned __int8 *)(a1 + 48) forceUpdate:1 animated:*(double *)(a1 + 40)];
}

- (BOOL)_tvTabBarShouldTrackScrollView:(id)a3
{
  if (!a3) {
    return 0;
  }
  int v3 = [a3 _viewControllerForAncestor];
  uint64_t v4 = objc_opt_class();
  id v5 = -[UIViewController _ancestorViewControllerOfClass:allowModalParent:]((uint64_t)v3, v4, 0);
  int64_t v6 = v5;
  if (v5) {
    char v7 = [v5 _tvShouldScrollWithObservedScrollViewIfPossible];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)_viewControllerDidBeginDismissal:(id)a3
{
  id v4 = a3;
  if (_UIBarsApplyChromelessEverywhere())
  {
    id v5 = [v4 _viewControllerForObservableScrollView];
    if (![(UITabBarController *)self _isViewControllerContainedInSelected:v5])
    {
LABEL_9:

      goto LABEL_10;
    }
    int64_t v6 = [v5 _contentOrObservableScrollViewForEdge:4];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__UITabBarController__viewControllerDidBeginDismissal___block_invoke;
    aBlock[3] = &unk_1E52E7BF8;
    void aBlock[4] = self;
    id v7 = v6;
    id v19 = v7;
    id v8 = v4;
    id v20 = v8;
    id v9 = (void (**)(void *, void))_Block_copy(aBlock);
    id v10 = [v8 transitionCoordinator];
    if (!v10) {
      goto LABEL_7;
    }
    [(UITabBar *)self->_tabBar _backgroundTransitionProgress];
    double v12 = v11;
    BOOL v13 = v11 == 1.0;
    unsigned __int8 v17 = 0;
    [(UITabBarController *)self _updateObservingScrollViewWithScrollView:v7 viewController:v8 getTabBarRequiresStandardBackground:&v17];
    BOOL v14 = 0;
    if (!v17)
    {
      if (v7)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);

        BOOL v14 = v13;
        if (v7 == WeakRetained)
        {
          double v16 = 0.0;
          if (_UIBarsGetBottomBarBackgroundTransitionProgressForScrollView(v7, self->_tabBar, &v16)) {
            BOOL v14 = v16 == 1.0;
          }
          else {
            BOOL v14 = v12 == 1.0;
          }
        }
      }
      else
      {
        BOOL v14 = v13;
      }
    }
    self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFBFFFF | (v17 << 18));
    if ((v12 == 1.0) == v14) {
      goto LABEL_8;
    }
    if (v12 != 1.0) {
      [v10 animateAlongsideTransition:0 completion:v9];
    }
    else {
LABEL_7:
    }
      v9[2](v9, 0);
LABEL_8:

    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __55__UITabBarController__viewControllerDidBeginDismissal___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAndObserveScrollView:*(void *)(a1 + 40) viewController:*(void *)(a1 + 48)];
}

- (void)_setNotifySplitViewControllerForSelectionChange:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFBFF | v3);
}

- (BOOL)_wrapsNavigationController:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return 0;
}

- (int64_t)_tabBarPosition
{
  return self->_tabBarPosition;
}

- (id)_viewControllerForTabBarItem:(id)a3
{
  id v5 = a3;
  int64_t v6 = [(UITabBarController *)self tabBar];
  id v7 = [v6 items];

  id v8 = [(UITabBarController *)self _viewControllersInTabBar];
  id v9 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  long long v21 = __51__UITabBarController__viewControllerForTabBarItem___block_invoke;
  long long v22 = &unk_1E52E8068;
  id v10 = v5;
  id v23 = v10;
  double v11 = [v9 predicateWithBlock:&v19];
  double v12 = [v8 filteredArrayUsingPredicate:v11];

  if ([v12 count] != 1)
  {
    unsigned __int8 v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"UITabBarController.m", 4002, @"Inconsistency in UITabBar items and view controllers detected. No view controller matches the UITabBarItem '%@'.", v10, v19, v20, v21, v22 object file lineNumber description];
  }
  BOOL v13 = [v12 firstObject];
  BOOL v14 = [v13 tabBarItem];
  char v15 = [v7 containsObject:v14];

  if ((v15 & 1) == 0)
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"UITabBarController.m", 4006, @"Inconsistency in UITabBar items and view controllers detected. The matching UITabBarItem '%@' is not available in the UITabBar.", v10 object file lineNumber description];
  }
  return v13;
}

uint64_t __51__UITabBarController__viewControllerForTabBarItem___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 tabBarItem];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)_tabBarItemClicked:(id)a3
{
  uint64_t v4 = [(UITabBarController *)self _viewControllerForTabBarItem:a3];
  id v14 = v4;
  if ((*((unsigned char *)&self->_tabBarControllerFlags + 1) & 0x80) == 0)
  {
    id v5 = objc_msgSend(v4, "_uip_tabElement");
    if (v5)
    {
      int64_t v6 = v5;
      char v7 = [v5 isDisabled];

      if (v7) {
        goto LABEL_10;
      }
    }
LABEL_9:
    [(UITabBarController *)self _setSelectedViewControllerAndNotify:v14];
    goto LABEL_13;
  }
  id v8 = [v4 tab];
  if (!v8) {
    goto LABEL_9;
  }
  id v9 = v8;
  if ([v8 isDisabled])
  {
  }
  else
  {
    char v10 = -[UITabBarController _shouldSelectTab:]((uint64_t)self, v9);

    if (v10) {
      goto LABEL_9;
    }
  }
LABEL_10:
  double v11 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  double v12 = v11;
  if (v11)
  {
    BOOL v13 = [v11 tabBarItem];
    [(UITabBarController *)self _setSelectedTabBarItem:v13];
  }
  [(UIViewController *)self setNeedsFocusUpdate];

LABEL_13:
}

- (void)_setSelectedViewControllerAndNotify:(id)a3
{
  uint64_t v4 = (UIViewController *)a3;
  $BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = self->_tabBarControllerFlags;
  int64_t v6 = [(UITabBarController *)self delegate];
  if ((*(_WORD *)&tabBarControllerFlags & 0x8000) == 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([v6 tabBarController:self shouldSelectViewController:v4] & 1) == 0)
  {
    id v9 = [(UITabBarController *)self _selectedViewControllerInTabBar];
    char v7 = v9;
    if (v9)
    {
      char v10 = [(UIViewController *)v9 tabBarItem];
      [(UITabBarController *)self _setSelectedTabBarItem:v10];

      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      BOOL v13 = __58__UITabBarController__setSelectedViewControllerAndNotify___block_invoke;
      id v14 = &unk_1E52D9F98;
      char v15 = v7;
      double v16 = self;
      [(UITabBarController *)self _performWithoutNotifyingSelectionChange:&v11];
    }
    [(UIViewController *)self setNeedsFocusUpdate];
    goto LABEL_15;
  }
  if (self->_transientViewController != v4)
  {
    char v7 = [(UITabBarController *)self _selectedViewControllerInTabBar];
    if (v7 == v4) {
      [(_UITabBarControllerVisualStyle *)self->_visualStyle updateViewControllerForReselection:v4];
    }
    [(_UITabBarControllerVisualStyle *)self->_visualStyle updateFocusForSelectedViewControllerChange];
    if ((*(_WORD *)&tabBarControllerFlags & 0x8000) != 0)
    {
      [(UITabBarController *)self _setSelectedViewController:v4 performUpdates:1];
    }
    else
    {
      [(UITabBarController *)self setTransientViewController:0];
      [(UITabBarController *)self setSelectedViewController:v4];
      if (objc_opt_respondsToSelector())
      {
        id v8 = [(UITabBarController *)self selectedViewController];
        [v6 tabBarController:self didSelectViewController:v8];
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  [(UITabBarController *)self concealTabBarSelection];
LABEL_16:
}

void __58__UITabBarController__setSelectedViewControllerAndNotify___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _resolvedTab];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 1160);
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = (id)v2;
  [v4 selectElement:v2 notifyOnReselection:0];
}

- (id)_customInteractionControllerForAnimator:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [WeakRetained tabBarController:self interactionControllerUsingAnimator:v4];
LABEL_6:
      char v7 = (void *)v6;
      goto LABEL_8;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [WeakRetained tabBarController:self interactionControllerForAnimationController:v4];
      goto LABEL_6;
    }
  }
  char v7 = 0;
LABEL_8:

  return v7;
}

- (id)_customAnimatorForFromViewController:(id)a3 toViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [WeakRetained tabBarController:self animatorForFromViewController:v6 toViewController:v7];
      goto LABEL_6;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [WeakRetained tabBarController:self animationControllerForTransitionFromViewController:v6 toViewController:v7];
LABEL_6:
      char v10 = (void *)v9;
      if (v9) {
        goto LABEL_8;
      }
    }
  }
  char v10 = [(_UITabBarControllerVisualStyle *)self->_visualStyle defaultAnimatorForFromViewController:v6 toViewController:v7];
LABEL_8:

  return v10;
}

- (id)_viewControllerForObservableScrollView
{
  visualStyle = self->_visualStyle;
  uint64_t v3 = [(UITabBarController *)self selectedViewController];
  id v4 = [(_UITabBarControllerVisualStyle *)visualStyle viewControllerForObservableScrollViewFromViewController:v3];

  return v4;
}

uint64_t __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "set_shouldFocusViewControllerAfterTransition:", 0);
}

uint64_t __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if ((result & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 _setSelectedTabBarItem:v5];
  }
  return result;
}

void __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "set_shouldFocusViewControllerAfterTransition:", 0);
  id v6 = v5;
  if (a3)
  {
    id v7 = [*(id *)(a1 + 32) _viewForViewController:*(void *)(a1 + 40)];
    [v7 removeFromSuperview];

    id v8 = [*(id *)(a1 + 40) view];
    [v8 removeFromSuperview];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      [*(id *)(a1 + 48) endAppearanceTransition];
      [*(id *)(a1 + 40) endAppearanceTransition];
    }
    if (([*(id *)(a1 + 48) _containsFirstResponder] & 1) == 0) {
      [*(id *)(a1 + 48) _viewControllerWasSelected];
    }
  }
  else
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      [*(id *)(a1 + 48) cancelBeginAppearanceTransition];
      [*(id *)(a1 + 40) cancelBeginAppearanceTransition];
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 1032), *(id *)(a1 + 40));
    }
    uint64_t v9 = [*(id *)(a1 + 32) _viewForViewController:*(void *)(a1 + 48)];
    [v9 removeFromSuperview];

    char v10 = [*(id *)(a1 + 48) view];
    [v10 removeFromSuperview];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1008), *(id *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "_compatibility_updateViewController:forTabBarObservedScrollView:", *(void *)(*(void *)(a1 + 32) + 1008), 0);
  }
  uint64_t v11 = [v6 _postInteractiveCompletionHandler];

  if (v11)
  {
    uint64_t v12 = [v6 _postInteractiveCompletionHandler];
    v12[2]();

    [v6 _setPostInteractiveCompletionHandler:0];
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 32) + 1200) animationEnded:a3];
  }
  [v6 _setTransitionIsInFlight:0];
  [v6 _setInteractor:0];
  [v6 _setAnimator:0];
  [*(id *)(a1 + 32) _setAnimator:0];
  [*(id *)(a1 + 32) _setInteractor:0];
  [*(id *)(a1 + 64) _invalidate];
  if (*(unsigned char *)(a1 + 80))
  {
    BOOL v13 = [*(id *)(a1 + 32) view];
    [v13 setUserInteractionEnabled:1];
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UITabBarController", &_UIInternalPreference_IgnoreFloatingTabBarLinkCheck_block_invoke___s_category);
  char v15 = *(id *)(CategoryCachedImpl + 8);
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), *(const void **)(a1 + 32));
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v17 = v16;
    if (os_signpost_enabled(v15))
    {
      v18[0] = 67109120;
      v18[1] = a3;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v15, OS_SIGNPOST_INTERVAL_END, v17, "SwitchTabs", "didComplete=%{attribute}d done with transition", (uint8_t *)v18, 8u);
    }
  }
}

void __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_303(uint64_t a1)
{
  if (*(void *)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0) {
    [*(id *)(*(void *)(a1 + 40) + 1200) willBeginAfterPreemptionWithContext:*(void *)(a1 + 48) data:*(void *)(a1 + 32)];
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_2_306;
  char v10 = &unk_1E52D9F98;
  id v2 = *(id *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 40);
  id v11 = v2;
  uint64_t v12 = v3;
  +[UIView _setAlongsideAnimations:&v7];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  if (*(unsigned char *)(a1 + 72)) {
    objc_msgSend(*(id *)(v5 + 1208), "startInteractiveTransition:", v4, v7, v8, v9, v10);
  }
  else {
    objc_msgSend(*(id *)(v5 + 1200), "animateTransition:", v4, v7, v8, v9, v10);
  }
  id v6 = +[UIView _alongsideAnimations];

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "__runAlongsideAnimations");
    [*(id *)(a1 + 40) _forceUpdateScrollViewIfNecessary];
    [*(id *)(a1 + 40) _resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary:1 animated:0];
    +[UIView _setAlongsideAnimations:0];
  }
  [*(id *)(a1 + 48) _setTransitionIsInFlight:1];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 48) _setInterruptible:1];
  }
}

uint64_t __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_2_306(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations");
  [*(id *)(a1 + 40) _forceUpdateScrollViewIfNecessary];
  id v2 = [*(id *)(a1 + 40) _observingScrollView];

  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    return [v3 _resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary:1 animated:1];
  }
  else
  {
    +[UIView _currentAnimationDuration];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_3_307;
    v6[3] = &unk_1E52D9CD0;
    v6[4] = *(void *)(a1 + 40);
    v6[5] = v5;
    return [(id)UIApp _performBlockAfterCATransactionCommits:v6];
  }
}

uint64_t __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_3_307(uint64_t a1)
{
  [*(id *)(a1 + 32) _forceUpdateScrollViewIfNecessary];
  double v2 = *(double *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_4_308;
  v4[3] = &unk_1E52D9F70;
  v4[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:v4 animations:v2];
}

uint64_t __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_4_308(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary:1 animated:1];
}

- (void)concealTabBarSelection
{
}

- (void)revealTabBarSelection
{
  uint64_t v3 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  if (v3)
  {
    id v5 = v3;
    uint64_t v4 = [v3 tabBarItem];
    [(UITabBarController *)self _setSelectedTabBarItem:v4];

    uint64_t v3 = v5;
  }
}

- (void)setShowsEditButtonOnLeft:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFFEF | v3);
}

- (void)_setSelectedViewControllerNeedsLayout
{
}

- (void)_childViewController:(id)a3 updatedObservedScrollView:(id)a4
{
  if (self->_selectedViewController == a3) {
    -[UITabBarController _compatibility_updateViewController:forTabBarObservedScrollView:](self, "_compatibility_updateViewController:forTabBarObservedScrollView:");
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UITabBarController;
  [(UIViewController *)&v6 setEditing:a3 animated:a4];
  [(_UITabModel *)self->_tabModel setEditing:v4];
}

- (void)_notifyEditingStateChange:(id *)a1
{
  if (a1)
  {
    if (a2)
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 147);
      char v4 = objc_opt_respondsToSelector();

      if (v4)
      {
        id v5 = objc_loadWeakRetained(a1 + 147);
        [v5 tabBarControllerWillBeginEditing:a1];
      }
      else
      {
        id v5 = [a1 sidebar];
        -[UITabBarControllerSidebar _editingStateDidChange:]((uint64_t)v5, 1);
      }

      [a1 setEditing:1];
      id v8 = a1[136];
      [v8 editingStateDidChange];
    }
    else
    {
      [a1 setEditing:0];
      [a1[136] editingStateDidChange];
      id v6 = objc_loadWeakRetained(a1 + 147);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v9 = objc_loadWeakRetained(a1 + 147);
        [v9 tabBarControllerDidEndEditing:a1];
      }
      else
      {
        id v9 = [a1 sidebar];
        -[UITabBarControllerSidebar _editingStateDidChange:]((uint64_t)v9, 0);
      }
    }
  }
}

- (void)_notifyVisibilityChangesForTabs:(id *)a1
{
  id v7 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 147);
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [v7 allObjects];
      id v6 = objc_loadWeakRetained(a1 + 147);
      [v6 tabBarController:a1 visibilityDidChangeForTabs:v5];
    }
    else
    {
      id v5 = [a1 sidebar];
      -[UITabBarControllerSidebar _visibilityDidChangeForTabs:]((uint64_t)v5, v7);
    }
  }
}

- (void)_notifyDisplayOrderChangesForGroup:(uint64_t)a1
{
  id v6 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1176));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 1176));
      [v5 tabBarController:a1 displayOrderDidChangeForGroup:v6];
    }
  }
}

- (BOOL)_allowsAutorotation
{
  v9.receiver = self;
  v9.super_class = (Class)UITabBarController;
  unsigned int v3 = [(UIViewController *)&v9 _allowsAutorotation];
  char v4 = [(UITabBarController *)self tabBar];
  int v5 = v3 & ([v4 isCustomizing] ^ 1);

  id v6 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  id v7 = v6;
  if (v6) {
    v5 &= [v6 _allowsAutorotation];
  }

  return v5;
}

- (BOOL)_doAllViewControllersSupportInterfaceOrientation:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v4 = [(UITabBarController *)self viewControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (![*(id *)(*((void *)&v11 + 1) + 8 * i) _isSupportedInterfaceOrientation:a3])
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)_hasPreferredInterfaceOrientationForPresentation
{
  v5.receiver = self;
  v5.super_class = (Class)UITabBarController;
  if ([(UIViewController *)&v5 _hasPreferredInterfaceOrientationForPresentation])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    int v3 = dyld_program_sdk_at_least();
    if (v3) {
      LOBYTE(v3) = *((unsigned char *)&self->_tabBarControllerFlags + 1) & 1;
    }
  }
  return v3;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  if (*((unsigned char *)&self->_tabBarControllerFlags + 1))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int64_t v5 = [WeakRetained tabBarControllerPreferredInterfaceOrientationForPresentation:self];

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UITabBarController;
    return [(UIViewController *)&v6 preferredInterfaceOrientationForPresentation];
  }
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  if ([(id)objc_opt_class() _doesOverrideLegacyShouldAutorotateMethod])
  {
    return [(UITabBarController *)self shouldAutorotateToInterfaceOrientation:a3];
  }
  else
  {
    return [(UITabBarController *)self _doAllViewControllersSupportInterfaceOrientation:a3];
  }
}

- (id)rotatingHeaderView
{
  double v2 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  int v3 = [v2 rotatingHeaderView];

  return v3;
}

- (id)rotatingFooterView
{
  if ([(UITabBarController *)self _wantsBarHidden])
  {
    int v3 = [(UITabBarController *)self _selectedViewControllerInTabBar];
    char v4 = [v3 rotatingFooterView];
  }
  else
  {
    char v4 = [(UITabBarController *)self tabBar];
  }
  return v4;
}

- (BOOL)_shouldUseOnePartRotation
{
  double v2 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  char v3 = [v2 _shouldUseOnePartRotation];

  return v3;
}

- (void)_getRotationContentSettings:(id *)a3
{
  id v4 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  [v4 _getRotationContentSettings:a3];
}

- (BOOL)_isBarLayoutValid
{
  return (*(unsigned char *)&self->_tabBarControllerFlags >> 5) & 1;
}

- (void)_invalidateBarLayout
{
  *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20u;
}

- (void)_invalidateBarLayoutIfNecessary
{
  id v4 = [(UIView *)self->_tabBar traitCollection];
  if ([v4 userInterfaceIdiom])
  {
  }
  else
  {
    int v3 = dyld_program_sdk_at_least();

    if (v3) {
      *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20u;
    }
  }
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  [(UITabBarController *)self _invalidateBarLayoutIfNecessary];
  id v7 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  [v7 willRotateToInterfaceOrientation:a3 duration:a4];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UITabBarController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(UITabBarController *)self _invalidateBarLayoutIfNecessary];
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  [v6 willAnimateRotationToInterfaceOrientation:a3 duration:a4];
}

+ (BOOL)_shouldSendLegacyMethodsFromViewWillTransitionToSize
{
  return 0;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  char v10 = v9;
  if (v9
    && ([v9 _existingView], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0)
    && (long long v12 = (void *)v11,
        [(UITabBarController *)self _selectedViewControllerInTabBar],
        long long v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v10 == v13))
  {
    uint64_t v20 = [(UIViewController *)self view];
    [v20 frame];
    double v22 = v21;
    double v24 = v23;

    uint64_t v25 = [v10 view];
    [v25 frame];
    double v27 = v26;
    double v29 = v28;

    double v15 = width - v22 + v27;
    double v17 = height - v24 + v29;
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)UITabBarController;
    -[UIViewController sizeForChildContentContainer:withParentContainerSize:](&v30, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
    double v15 = v14;
    double v17 = v16;
  }

  double v18 = v15;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  [v6 willAnimateFirstHalfOfRotationToInterfaceOrientation:a3 duration:a4];
}

- (void)didAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3
{
  id v4 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  [v4 didAnimateFirstHalfOfRotationToInterfaceOrientation:a3];
}

- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  [v6 willAnimateSecondHalfOfRotationFromInterfaceOrientation:a3 duration:a4];
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  id v4 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  [v4 didRotateFromInterfaceOrientation:a3];
}

- (id)rotatingSnapshotViewForWindow:(id)a3
{
  int v3 = [(UITabBarController *)self _selectedViewControllerInTabBar];
  id v4 = [v3 view];

  return v4;
}

- (void)_setBadgeValue:(id)a3 forTabBarItem:(id)a4
{
  if (a4)
  {
    [a4 setBadgeValue:a3];
    id v5 = [(UITabBarController *)self _existingMoreNavigationController];
    [v5 _redisplayMoreTableView];
  }
}

- (NSMutableArray)moreChildViewControllers
{
  return self->_moreChildViewControllers;
}

- (void)setMoreChildViewControllers:(id)a3
{
}

- (UIView)_accessoryView
{
  return self->_accessoryView;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)_setAnimator:(id)a3
{
}

- (UIViewControllerInteractiveTransitioning)_interactor
{
  return self->__interactor;
}

- (void)_setInteractor:(id)a3
{
}

- (BOOL)_shouldFocusViewControllerAfterTransition
{
  return self->__shouldFocusViewControllerAfterTransition;
}

- (BOOL)_ignoreUnselectedTabsForStateRestoration
{
  return 0;
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UITabBarController *)self _ignoreUnselectedTabsForStateRestoration];
  id v6 = [(UITabBarController *)self tabBar];
  int v7 = [v6 isCustomizing];

  if (v7)
  {
    [v4 encodeBool:1 forKey:@"kTabBarIsCustomizingKey"];
    [(id)UIApp ignoreSnapshotOnNextApplicationLaunch];
  }
  if (!v5)
  {
    id v8 = [(UITabBarController *)self allViewControllers];
    _UISaveReferencedChildViewControllers(v8, 0);
  }
  id v9 = [(UITabBarController *)self selectedViewController];
  char v10 = [v9 _restorationIdentifierPath];
  int v11 = _UIStateRestorationDebugLogEnabled();
  if (v10)
  {
    if (v11) {
      NSLog(&cfstr_SSelectedViewC.isa, "-[UITabBarController(StateRestoration) encodeRestorableStateWithCoder:]", v10, v9);
    }
    [v4 encodeObject:v9 forKey:@"kTabBarSelectedViewControllerKey"];
    if (v5) {
      goto LABEL_20;
    }
LABEL_13:
    if (v9
      && self->_moreNavigationController
      && ([(NSMutableArray *)self->_moreChildViewControllers containsObject:v9] & 1) == 0)
    {
      long long v12 = [(UIMoreNavigationController *)self->_moreNavigationController displayedViewController];
      long long v13 = v12;
      if (v12 != self->_moreNavigationController)
      {
        double v14 = [(UIResponder *)v12 restorationIdentifier];

        if (v14) {
          [v4 encodeObject:v13 forKey:@"kTabBarMoreDisplayedViewControllerKey"];
        }
      }
    }
    goto LABEL_20;
  }
  if (v11) {
    NSLog(&cfstr_SSelectedViewC_0.isa, "-[UITabBarController(StateRestoration) encodeRestorableStateWithCoder:]", v9);
  }
  [(id)UIApp ignoreSnapshotOnNextApplicationLaunch];
  if (!v5) {
    goto LABEL_13;
  }
LABEL_20:
  v15.receiver = self;
  v15.super_class = (Class)UITabBarController;
  [(UIViewController *)&v15 encodeRestorableStateWithCoder:v4];
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTabBarSelectedViewControllerKey"];
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_STabBarControl.isa, "-[UITabBarController(StateRestoration) decodeRestorableStateWithCoder:]", v5);
  }
  if (v5)
  {
    id v6 = [(UITabBarController *)self allViewControllers];
    int v7 = [v6 containsObject:v5];

    if (v7)
    {
      [(UITabBarController *)self setSelectedViewController:v5];
    }
    else if (_UIStateRestorationDebugLogEnabled())
    {
      NSLog(&cfstr_STabbarcontrol.isa, "-[UITabBarController(StateRestoration) decodeRestorableStateWithCoder:]", v5);
    }
  }
  if (self->_moreNavigationController)
  {
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTabBarMoreDisplayedViewControllerKey"];
    if (v8)
    {
      uint64_t v9 = [(UITabBarController *)self selectedViewController];
      if (v8 == (void *)v9)
      {
      }
      else
      {
        char v10 = (void *)v9;
        int v11 = [(NSMutableArray *)self->_moreChildViewControllers containsObject:v8];

        if (v11) {
          [(UIMoreNavigationController *)self->_moreNavigationController setDisplayedViewController:v8];
        }
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)UITabBarController;
  [(UIResponder *)&v12 decodeRestorableStateWithCoder:v4];
}

- (UIAction)_overrideTidebarButtonAction
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v3 = [(_UITabBarControllerVisualStyle *)self->_visualStyle overrideTidebarButtonAction];
  }
  else
  {
    int v3 = 0;
  }
  return (UIAction *)v3;
}

- (void)_setOverrideTidebarButtonAction:(id)a3
{
  id v8 = a3;
  BOOL v5 = _UIMainBundleIdentifier();
  if (([v5 isEqualToString:@"com.apple.DocumentsApp"] & 1) == 0)
  {
    id v6 = _UIMainBundleIdentifier();
    char v7 = [v6 isEqualToString:@"com.apple.DocumentManagerUICore.Service"];

    if (v7) {
      goto LABEL_5;
    }
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"UITabBarController.m" lineNumber:5144 description:@"This may only be used by Files."];
  }

LABEL_5:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(_UITabBarControllerVisualStyle *)self->_visualStyle setOverrideTidebarButtonAction:v8];
  }
}

- (id)_tabCustomizationProxy
{
  double v2 = -[UITabBarController _visualStyle]((id *)&self->super.super.super.isa);
  int v3 = [v2 _tabCustomizationProxy];

  return v3;
}

@end