@interface UISplitViewController
+ (BOOL)_automaticDisplayModeOnPhoneUsesOverlayInLandscapeDefaultValue;
+ (BOOL)_devicePrefersOverlayInRegularWidth;
+ (BOOL)doesOverridePreferredInterfaceOrientationForPresentation;
+ (NSCopying)visualStyleRegistryIdentity;
+ (int64_t)_forcedImpl;
+ (void)_setForcedImpl:(int64_t)a3;
- (BOOL)_allowsDimmedSecondaryAsDeepestUnambiguousResponder;
- (BOOL)_alwaysAllowsSystemPreferredContentSize;
- (BOOL)_canTileSidebarColumn:(int64_t)a3;
- (BOOL)_disableAutomaticKeyboardBehavior;
- (BOOL)_forceDisplayModeBarButtonHidden;
- (BOOL)_handlesCounterRotationForPresentation;
- (BOOL)_hasPreferredInterfaceOrientationForPresentation;
- (BOOL)_iPhoneShouldUseOverlayInCurrentEnvironment;
- (BOOL)_ignoresSheetContext;
- (BOOL)_isAnimating;
- (BOOL)_isCollapsed;
- (BOOL)_isExpanding;
- (BOOL)_isLockedForDelegateCallback;
- (BOOL)_isRotating;
- (BOOL)_isSplitViewController;
- (BOOL)_isViewControllerForObservableScrollViewAmbiguous;
- (BOOL)_layoutPrimaryOnRight;
- (BOOL)_navigationControllerShouldNotAdjustTransitioningSizeForChildContainer:(id)a3;
- (BOOL)_needsNSToolbarSidebarToggle;
- (BOOL)_optsOutOfPopoverControllerHierarchyCheck;
- (BOOL)_prefersOverlayInRegularWidthPhone;
- (BOOL)_shouldInitializeColumnStyle;
- (BOOL)_shouldOverlayTabBar;
- (BOOL)_shouldPersistViewWhenCoding;
- (BOOL)_shouldUseFluidSidebarGestures;
- (BOOL)_shouldUseNewStatusBarBehavior;
- (BOOL)_shouldUseSeparateStatusBarStyles;
- (BOOL)_super_disableAutomaticKeyboardBehavior;
- (BOOL)_super_shouldUpdateFocusInContext:(id)a3;
- (BOOL)_supplementaryColumnAdoptsPrimaryBackgroundStyle;
- (BOOL)_usesDeviceOverlayPreferences;
- (BOOL)_usesExtraWidePrimaryColumn;
- (BOOL)_usesPanelImpl;
- (BOOL)_visibleToggleButtonRequiresPresentsWithGesture;
- (BOOL)_wantsFloatingSidebar;
- (BOOL)_wrapsNavigationController:(id *)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)hidesMasterViewInPortrait;
- (BOOL)isCollapsed;
- (BOOL)presentsWithGesture;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)showsSecondaryOnlyButton;
- (CGFloat)maximumPrimaryColumnWidth;
- (CGFloat)maximumSupplementaryColumnWidth;
- (CGFloat)minimumPrimaryColumnWidth;
- (CGFloat)minimumSupplementaryColumnWidth;
- (CGFloat)preferredPrimaryColumnWidth;
- (CGFloat)preferredPrimaryColumnWidthFraction;
- (CGFloat)preferredSupplementaryColumnWidth;
- (CGFloat)preferredSupplementaryColumnWidthFraction;
- (CGFloat)primaryColumnWidth;
- (CGFloat)supplementaryColumnWidth;
- (CGRect)_frameForChildContentContainer:(id)a3;
- (CGSize)_contentSizeForChildViewController:(id)a3 inPopoverController:(id)a4;
- (CGSize)_super_preferredContentSize;
- (CGSize)_super_sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (CGSize)preferredContentSize;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (NSArray)possibleStates;
- (NSArray)viewControllers;
- (NSString)_displayModeButtonItemTitle;
- (NSString)description;
- (UIBarButtonItem)displayModeButtonItem;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIEdgeInsets)_tvOSColumnStyleExtraInsetsForChildViewController:(id)a3;
- (UIScreenEdgePanGestureRecognizer)_fluidOpenSidebarPresentationGestureRecognizer;
- (UISlidingBarConfiguration)configuration;
- (UISlidingBarState)currentState;
- (UISlidingBarStateRequest)stateRequest;
- (UISplitViewController)initWithCoder:(NSCoder *)coder;
- (UISplitViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (UISplitViewController)initWithStyle:(UISplitViewControllerStyle)style;
- (UISplitViewControllerBackgroundStyle)primaryBackgroundStyle;
- (UISplitViewControllerDisplayMode)displayMode;
- (UISplitViewControllerDisplayMode)preferredDisplayMode;
- (UISplitViewControllerDisplayModeButtonVisibility)displayModeButtonVisibility;
- (UISplitViewControllerPrimaryEdge)primaryEdge;
- (UISplitViewControllerSplitBehavior)preferredSplitBehavior;
- (UISplitViewControllerSplitBehavior)splitBehavior;
- (UISplitViewControllerStyle)style;
- (UIViewController)viewControllerForColumn:(UISplitViewControllerColumn)column;
- (_UISplitViewControllerStyle)_styleProvider;
- (_UITabContainerView)_tabBarHostedView;
- (double)_contentMarginForChildViewController:(id)a3;
- (double)_primaryDividerPosition;
- (double)_supplementaryDividerPosition;
- (float)gutterWidth;
- (id)_additionalViewControllersToCheckForUserActivity;
- (id)_allContainedViewControllers;
- (id)_childViewControllersToSendViewWillTransitionToSize;
- (id)_contentOrObservableScrollViewForEdge:(unint64_t)a3;
- (id)_deepestActionResponder;
- (id)_effectiveActivityItemsConfiguration;
- (id)_effectiveInteractionActivityTrackingBaseName;
- (id)_hostingNavigationBar;
- (id)_multitaskingDragExclusionRects;
- (id)_navigationController:(id)a3 navigationBarAdditionalActionsForBackButtonMenu:(id)a4;
- (id)_nextResponderUsingTargetActionStrategyFromChildViewController:(id)a3 didTraverseToParentViewController:(BOOL *)a4;
- (id)_overridingPreferredFocusEnvironment;
- (id)_panelImpl;
- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)_primaryContentResponder;
- (id)_primaryDimmingView;
- (id)_super_childViewControllerForStatusBarStyle;
- (id)_super_childViewControllersToSendViewWillTransitionToSize;
- (id)_super_deepestActionResponder;
- (id)_super_effectiveActivityItemsConfiguration;
- (id)_super_multitaskingDragExclusionRects;
- (id)_super_overridingPreferredFocusEnvironment;
- (id)_super_preferredFocusEnvironments;
- (id)_super_preferredFocusedView;
- (id)_traitOverridesForChildViewController:(id)a3;
- (id)_viewControllerForObservableScrollView;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)delegate;
- (id)detailViewController;
- (id)masterViewController;
- (id)preferredFocusEnvironments;
- (id)preferredFocusedView;
- (id)transitionCoordinator;
- (int64_t)_columnForMonitoredNavigationController:(id)a3;
- (int64_t)_columnForViewController:(id)a3;
- (int64_t)_preferredModalPresentationStyle;
- (int64_t)_primaryOffscreenGestureMode;
- (int64_t)_subclassPreferredFocusedViewPrioritizationType;
- (int64_t)_super_preferredInterfaceOrientationForPresentation;
- (int64_t)composition;
- (int64_t)preferredCenterStatusBarStyle;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredLeadingStatusBarStyle;
- (int64_t)preferredTrailingStatusBarStyle;
- (unint64_t)_super_preferredScreenEdgesDeferringSystemGestures;
- (unint64_t)_super_supportedInterfaceOrientations;
- (unint64_t)preferredScreenEdgesDeferringSystemGestures;
- (unint64_t)supportedInterfaceOrientations;
- (void)_allowingMutationsInDelegateCallback:(id)a3;
- (void)_animateToRequest:(id)a3;
- (void)_commonInitForcingColumnStyle:(BOOL)a3;
- (void)_descendantWillPresentViewController:(id)a3 modalSourceViewController:(id)a4 presentationController:(id)a5 animated:(BOOL)a6;
- (void)_didChangeToFirstResponder:(id)a3;
- (void)_didEndSnapshotSession:(id)a3;
- (void)_didUpdateFocusInContext:(id)a3;
- (void)_getRotationContentSettings:(id *)a3;
- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5;
- (void)_navigationController:(id)a3 navigationBar:(id)a4 itemBackButtonUpdated:(id)a5;
- (void)_navigationController:(id)a3 navigationBar:(id)a4 topItemUpdatedContentLayout:(id)a5;
- (void)_navigationControllerDidChangeNavigationBarHidden:(id)a3;
- (void)_navigationControllerDidUpdateStack:(id)a3;
- (void)_popoverController:(id)a3 didChangeFromVisible:(BOOL)a4;
- (void)_popoverController:(id)a3 willChangeToVisible:(BOOL)a4;
- (void)_setAllowsDimmedSecondaryAsDeepestUnambiguousResponder:(BOOL)a3;
- (void)_setDisplayModeButtonItemTitle:(id)a3;
- (void)_setForceDisplayModeBarButtonHidden:(BOOL)a3;
- (void)_setIgnoresSheetContext:(BOOL)a3;
- (void)_setLockedForDelegateCallback:(BOOL)a3;
- (void)_setPrefersOverlayInRegularWidthPhone:(BOOL)a3;
- (void)_setPrimaryOffscreenGestureMode:(int64_t)a3;
- (void)_setSupplementaryColumnAdoptsPrimaryBackgroundStyle:(BOOL)a3;
- (void)_setTabBarHostedView:(id)a3;
- (void)_setUsesDeviceOverlayPreferences:(BOOL)a3;
- (void)_setUsesExtraWidePrimaryColumn:(BOOL)a3;
- (void)_setVisibleToggleButtonRequiresPresentsWithGesture:(BOOL)a3;
- (void)_setWantsFloatingSidebar:(BOOL)a3;
- (void)_super_didUpdateFocusInContext:(id)a3;
- (void)_super_removeChildViewController:(id)a3;
- (void)_super_viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)_super_willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
- (void)_tabBarControllerDidChangeSelection:(id)a3;
- (void)_updateChildContentMargins;
- (void)_updateDisplayModeButtonItem;
- (void)_updateLayoutForStatusBarAndInterfaceOrientation;
- (void)_updateScrollEdgeBehaviorForDetailNavigationContoller;
- (void)_viewControllerChildViewControllersDidChange:(id)a3;
- (void)_willBeginSnapshotSession:(id)a3;
- (void)_willShowCollapsedDetailViewController:(id)a3 inTargetController:(id)a4;
- (void)addChildViewController:(id)a3;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)hideColumn:(UISplitViewControllerColumn)column;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)removeChildViewController:(id)a3;
- (void)removeFromParentViewController;
- (void)setAutomaticallyAdjustsScrollViewInsets:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setDefinesPresentationContext:(BOOL)a3;
- (void)setDelegate:(id)delegate;
- (void)setDisplayModeButtonVisibility:(UISplitViewControllerDisplayModeButtonVisibility)displayModeButtonVisibility;
- (void)setEdgesForExtendedLayout:(unint64_t)a3;
- (void)setExtendedLayoutIncludesOpaqueBars:(BOOL)a3;
- (void)setGutterWidth:(float)a3;
- (void)setHidesMasterViewInPortrait:(BOOL)a3;
- (void)setMaximumPrimaryColumnWidth:(CGFloat)maximumPrimaryColumnWidth;
- (void)setMaximumSupplementaryColumnWidth:(CGFloat)maximumSupplementaryColumnWidth;
- (void)setMinimumPrimaryColumnWidth:(CGFloat)minimumPrimaryColumnWidth;
- (void)setMinimumSupplementaryColumnWidth:(CGFloat)minimumSupplementaryColumnWidth;
- (void)setModalPresentationCapturesStatusBarAppearance:(BOOL)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)setModalTransitionStyle:(int64_t)a3;
- (void)setOverrideTraitCollection:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setPreferredDisplayMode:(UISplitViewControllerDisplayMode)preferredDisplayMode;
- (void)setPreferredPrimaryColumnWidth:(CGFloat)preferredPrimaryColumnWidth;
- (void)setPreferredPrimaryColumnWidthFraction:(CGFloat)preferredPrimaryColumnWidthFraction;
- (void)setPreferredSplitBehavior:(UISplitViewControllerSplitBehavior)preferredSplitBehavior;
- (void)setPreferredSupplementaryColumnWidth:(CGFloat)preferredSupplementaryColumnWidth;
- (void)setPreferredSupplementaryColumnWidthFraction:(CGFloat)preferredSupplementaryColumnWidthFraction;
- (void)setPresentsWithGesture:(BOOL)presentsWithGesture;
- (void)setPrimaryBackgroundStyle:(UISplitViewControllerBackgroundStyle)primaryBackgroundStyle;
- (void)setPrimaryEdge:(UISplitViewControllerPrimaryEdge)primaryEdge;
- (void)setProvidesPresentationContextTransitionStyle:(BOOL)a3;
- (void)setRestoresFocusAfterTransition:(BOOL)a3;
- (void)setShowsSecondaryOnlyButton:(BOOL)showsSecondaryOnlyButton;
- (void)setStateRequest:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setView:(id)a3;
- (void)setViewController:(UIViewController *)vc forColumn:(UISplitViewControllerColumn)column;
- (void)setViewControllers:(NSArray *)viewControllers;
- (void)setViewRespectsSystemMinimumLayoutMargins:(BOOL)a3;
- (void)set_alwaysAllowsSystemPreferredContentSize:(BOOL)a3;
- (void)showColumn:(UISplitViewControllerColumn)column;
- (void)showDetailViewController:(UIViewController *)vc sender:(id)sender;
- (void)showViewController:(UIViewController *)vc sender:(id)sender;
- (void)toggleMasterVisible:(id)a3;
- (void)toggleSidebar:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)unloadViewForced:(BOOL)a3;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UISplitViewController

- (void)viewWillLayoutSubviews
{
}

- (void)viewDidLayoutSubviews
{
}

- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5
{
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  [(UISplitViewControllerImpl *)self->_impl _edgeInsetsForChildViewController:a3 insetsAreAbsolute:a4];
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (double)_contentMarginForChildViewController:(id)a3
{
  [(UISplitViewControllerImpl *)self->_impl _contentMarginForChildViewController:a3];
  return result;
}

- (void)loadView
{
}

- (id)_traitOverridesForChildViewController:(id)a3
{
  return (id)[(UISplitViewControllerImpl *)self->_impl _traitCollectionForChildEnvironment:a3];
}

- (BOOL)_super_disableAutomaticKeyboardBehavior
{
  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  return [(UIResponder *)&v3 _disableAutomaticKeyboardBehavior];
}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  return [(UISplitViewControllerImpl *)self->_impl _disableAutomaticKeyboardBehavior];
}

- (void)_didChangeToFirstResponder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISplitViewController;
  id v4 = a3;
  [(UIResponder *)&v5 _didChangeToFirstResponder:v4];
  -[UISplitViewControllerImpl _didChangeToFirstResponder:](self->_impl, "_didChangeToFirstResponder:", v4, v5.receiver, v5.super_class);
}

- (void)traitCollectionDidChange:(id)a3
{
  [(UISplitViewControllerImpl *)self->_impl traitCollectionDidChange:a3];
  [(UISplitViewController *)self _updateScrollEdgeBehaviorForDetailNavigationContoller];
}

+ (BOOL)_devicePrefersOverlayInRegularWidth
{
  if (qword_1EB25E920 != -1) {
    dispatch_once(&qword_1EB25E920, &__block_literal_global_73_0);
  }
  return byte_1EB25E911;
}

- (BOOL)_isSplitViewController
{
  return 1;
}

- (int64_t)_preferredModalPresentationStyle
{
  if (!self) {
    return 4;
  }
  if (!dyld_program_sdk_at_least()) {
    return 4;
  }
  if ([(UISplitViewControllerImpl *)self->_impl style]) {
    return 2;
  }
  return 4;
}

- (unint64_t)supportedInterfaceOrientations
{
  return [(UISplitViewControllerImpl *)self->_impl supportedInterfaceOrientations];
}

- (BOOL)presentsWithGesture
{
  return [(UISplitViewControllerImpl *)self->_impl presentsWithGesture];
}

- (UISplitViewControllerStyle)style
{
  return [(UISplitViewControllerImpl *)self->_impl style];
}

- (void)_viewControllerChildViewControllersDidChange:(id)a3
{
  id v5 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl style])
  {
    id v4 = [(UISplitViewController *)self _panelImpl];
    [v4 _viewControllerChildViewControllersDidChange:v5];
  }
}

- (void)setDefinesPresentationContext:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    double v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v9 setDefinesPresentationContext:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UISplitViewController;
  -[UIViewController viewDidAppear:](&v5, sel_viewDidAppear_);
  [(UISplitViewControllerImpl *)self->_impl viewDidAppear:v3];
}

- (void)didMoveToParentViewController:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v3 didMoveToParentViewController:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UISplitViewController;
  -[UIViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [(UISplitViewControllerImpl *)self->_impl viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UISplitViewController;
  -[UIViewController viewDidDisappear:](&v5, sel_viewDidDisappear_);
  [(UISplitViewControllerImpl *)self->_impl viewDidDisappear:v3];
}

void __60__UISplitViewController__devicePrefersOverlayInRegularWidth__block_invoke()
{
  id v0 = +[UIScreen _embeddedScreen];
  byte_1EB25E911 = _UIScreenIsPhyiscallyLargePhone([v0 _screenType]);
}

- (void)_navigationControllerDidUpdateStack:(id)a3
{
  id v5 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl style])
  {
    id v4 = [(UISplitViewController *)self _panelImpl];
    [v4 _navigationControllerDidUpdateStack:v5];
  }
}

- (BOOL)_shouldUseSeparateStatusBarStyles
{
  if ((_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_UISplitViewAutomaticStatusBarStyleSeparationMode, @"UISplitViewAutomaticStatusBarStyleSeparationMode", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger) & 1) != 0|| !qword_1EB257090)
  {
    if (![(UISplitViewController *)self _shouldUseNewStatusBarBehavior]) {
      return 0;
    }
  }
  else if (qword_1EB257090 < 1)
  {
    return 0;
  }
  if ([(UISplitViewController *)self isCollapsed]) {
    return 0;
  }
  if ([(UISplitViewControllerImpl *)self->_impl style]) {
    return 1;
  }
  id v4 = [(UISplitViewController *)self viewControllers];
  BOOL v3 = [v4 count] == 2;

  return v3;
}

- (BOOL)_isCollapsed
{
  return [(UISplitViewControllerImpl *)self->_impl _isCollapsed];
}

- (BOOL)isCollapsed
{
  return [(UISplitViewControllerImpl *)self->_impl isCollapsed];
}

- (BOOL)_shouldUseNewStatusBarBehavior
{
  return dyld_program_sdk_at_least();
}

- (id)childViewControllerForStatusBarStyle
{
  return (id)[(UISplitViewControllerImpl *)self->_impl childViewControllerForStatusBarStyle];
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  return [(UISplitViewControllerImpl *)self->_impl preferredScreenEdgesDeferringSystemGestures];
}

- (int64_t)preferredTrailingStatusBarStyle
{
  return [(UISplitViewControllerImpl *)self->_impl preferredTrailingStatusBarStyle];
}

- (int64_t)preferredLeadingStatusBarStyle
{
  return [(UISplitViewControllerImpl *)self->_impl preferredLeadingStatusBarStyle];
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return (id)[(UISplitViewControllerImpl *)self->_impl childViewControllerForHomeIndicatorAutoHidden];
}

- (int64_t)preferredCenterStatusBarStyle
{
  return [(UISplitViewControllerImpl *)self->_impl preferredCenterStatusBarStyle];
}

- (UISplitViewControllerDisplayMode)displayMode
{
  return [(UISplitViewControllerImpl *)self->_impl displayMode];
}

- (_UISplitViewControllerStyle)_styleProvider
{
  return self->_styleProvider;
}

- (UIViewController)viewControllerForColumn:(UISplitViewControllerColumn)column
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  id v5 = [(UISplitViewController *)self _panelImpl];
  double v6 = [v5 viewControllerForColumn:column];

  return (UIViewController *)v6;
}

- (id)_panelImpl
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    impl = self->_impl;
  }
  else {
    impl = 0;
  }
  return impl;
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)@"UISplitViewController";
}

- (CGFloat)maximumPrimaryColumnWidth
{
  [(UISplitViewControllerImpl *)self->_impl maximumPrimaryColumnWidth];
  return result;
}

- (void)_setWantsFloatingSidebar:(BOOL)a3
{
}

- (CGFloat)preferredPrimaryColumnWidth
{
  v2 = [(UISplitViewController *)self _panelImpl];
  [v2 preferredPrimaryColumnWidth];
  double v4 = v3;

  return v4;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)UISplitViewController;
  double v3 = [(UISplitViewController *)&v6 description];
  double v4 = (void *)[v3 mutableCopy];

  if (os_variant_has_internal_diagnostics()) {
    objc_msgSend(v4, "appendFormat:", @" impl=%p", self->_impl);
  }
  return (NSString *)v4;
}

- (id)_viewControllerForObservableScrollView
{
  if (-[UIViewController _shouldRequestViewControllerForObservableScrollViewFromPresentedViewController](self))
  {
    v10.receiver = self;
    v10.super_class = (Class)UISplitViewController;
    double v3 = [(UIViewController *)&v10 _viewControllerForObservableScrollView];
  }
  else
  {
    double v4 = [(UISplitViewController *)self _panelImpl];
    id v5 = [v4 _viewControllerForObservableScrollView];
    objc_super v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)UISplitViewController;
      id v7 = [(UIViewController *)&v9 _viewControllerForObservableScrollView];
    }
    double v3 = v7;
  }
  return v3;
}

- (void)_updateLayoutForStatusBarAndInterfaceOrientation
{
  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v3 _updateLayoutForStatusBarAndInterfaceOrientation];
  [(UISplitViewControllerImpl *)self->_impl _updateLayoutForStatusBarAndInterfaceOrientation];
}

- (id)_contentOrObservableScrollViewForEdge:(unint64_t)a3
{
  return -[UIViewController _contentOrObservableScrollViewInContainerForEdge:](self, a3);
}

- (BOOL)_shouldPersistViewWhenCoding
{
  return [(UISplitViewControllerImpl *)self->_impl _shouldPersistViewWhenCoding];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UISplitViewController;
  -[UIViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  [(UISplitViewControllerImpl *)self->_impl viewWillAppear:v3];
  [(UISplitViewController *)self _updateScrollEdgeBehaviorForDetailNavigationContoller];
}

- (void)setViewController:(UIViewController *)vc forColumn:(UISplitViewControllerColumn)column
{
  id v7 = vc;
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  if (column != UISplitViewControllerColumnCompact
    || ([(UISplitViewController *)self _panelImpl],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 inCollapsingToProposedTopColumnCallback],
        v8,
        (v9 & 1) == 0))
  {
    if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
    {
      objc_super v10 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v11 = *MEMORY[0x1E4F1C3C8];
      v12 = NSStringFromSelector(a2);
      [v10 raise:v11, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v12 format];
    }
  }
  if (v7
    && (unint64_t)(column - 2) >= 2
    && column
    && (column != UISplitViewControllerColumnSupplementary
     || [(UISplitViewControllerImpl *)self->_impl style] != 2))
  {
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3B8];
    v15 = _UISplitViewControllerColumnDescription(column);
    v16 = _UISplitViewControllerStyleDescription([(UISplitViewControllerImpl *)self->_impl style]);
    [v13 raise:v14, @"Non-nil view controller not accepted for %@ column in %@ UISplitViewController", v15, v16 format];
  }
  id v17 = [(UISplitViewController *)self _panelImpl];
  [v17 setViewController:v7 forColumn:column];
}

- (void)addChildViewController:(id)a3
{
  id v5 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v9 addChildViewController:v5];
  [(UISplitViewController *)self _updateScrollEdgeBehaviorForDetailNavigationContoller];
}

- (void)_updateScrollEdgeBehaviorForDetailNavigationContoller
{
  id v9 = [(UISplitViewController *)self masterViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [(UISplitViewController *)self detailViewController];
    goto LABEL_6;
  }
  BOOL v3 = [v9 navigationBar];
  int v4 = [v3 prefersLargeTitles];

  id v5 = [(UISplitViewController *)self detailViewController];
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_6:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
  }
  objc_super v6 = [v5 navigationBar];
  if (_UIBarAppearanceAPIVersion() >= 1 && (_UIBarsApplyChromelessEverywhere() & 1) == 0)
  {
    uint64_t v7 = [(UIViewController *)self traitCollection];
    BOOL v8 = [v7 verticalSizeClass] != 1;

    [v6 _setForceScrollEdgeAppearance:v8];
  }

LABEL_11:
}

- (id)masterViewController
{
  return (id)[(UISplitViewControllerImpl *)self->_impl masterViewController];
}

- (id)detailViewController
{
  return (id)[(UISplitViewControllerImpl *)self->_impl detailViewController];
}

- (BOOL)_wrapsNavigationController:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  return [(UIViewController *)&v4 _wrapsNavigationController:a3];
}

- (void)setPresentsWithGesture:(BOOL)presentsWithGesture
{
}

- (NSArray)viewControllers
{
  return (NSArray *)[(UISplitViewControllerImpl *)self->_impl viewControllers];
}

- (void)_updateChildContentMargins
{
}

- (UISplitViewControllerSplitBehavior)preferredSplitBehavior
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  BOOL v3 = [(UISplitViewController *)self _panelImpl];
  UISplitViewControllerSplitBehavior v4 = [v3 preferredSplitBehavior];

  return v4;
}

- (void)_navigationController:(id)a3 navigationBar:(id)a4 itemBackButtonUpdated:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(UISplitViewControllerImpl *)self->_impl style])
  {
    objc_super v10 = [(UISplitViewController *)self _panelImpl];
    [v10 _navigationController:v11 navigationBar:v8 itemBackButtonUpdated:v9];
  }
}

- (void)_navigationControllerDidChangeNavigationBarHidden:(id)a3
{
  id v4 = a3;
  id v5 = [(UISplitViewController *)self _panelImpl];
  [v5 _navigationControllerDidChangeNavigationBarHidden:v4];
}

- (BOOL)_isViewControllerForObservableScrollViewAmbiguous
{
  BOOL v3 = [(UISplitViewController *)self _panelImpl];
  id v4 = v3;
  if (v3)
  {
    unsigned __int8 v5 = [v3 _isViewControllerForObservableScrollViewAmbiguous];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UISplitViewController;
    unsigned __int8 v5 = [(UIViewController *)&v8 _isViewControllerForObservableScrollViewAmbiguous];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)delegate
{
  return (id)[(UISplitViewControllerImpl *)self->_impl delegate];
}

- (unint64_t)_super_supportedInterfaceOrientations
{
  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  return [(UIViewController *)&v3 supportedInterfaceOrientations];
}

- (void)setViewControllers:(NSArray *)viewControllers
{
  objc_super v8 = viewControllers;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    unsigned __int8 v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    uint64_t v7 = NSStringFromSelector(a2);
    [v5 raise:v6, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v7 format];
  }
  [(UISplitViewControllerImpl *)self->_impl setViewControllers:v8];
}

- (UISplitViewController)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v8.receiver = self;
  v8.super_class = (Class)UISplitViewController;
  unsigned __int8 v5 = [(UIViewController *)&v8 initWithCoder:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    [(UISplitViewController *)v5 _commonInitForcingColumnStyle:0];
    [(UISplitViewControllerImpl *)v6->_impl _initWithCoder:v4];
  }

  return v6;
}

- (UISplitViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  v11.receiver = self;
  v11.super_class = (Class)UISplitViewController;
  unsigned __int8 v5 = [(UIViewController *)&v11 initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(UISplitViewController *)v5 _shouldInitializeColumnStyle];
    [(UISplitViewController *)v6 _commonInitForcingColumnStyle:v7];
    if (v7)
    {
      objc_super v8 = [(UISplitViewController *)v6 _panelImpl];
      if (!v8)
      {
        objc_super v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2 object:v6 file:@"UISplitViewController.m" lineNumber:176 description:@"Wrong implementation class for column-style UISplitViewController support"];
      }
      [v8 setStyle:1];
    }
  }
  return v6;
}

- (UISplitViewController)initWithStyle:(UISplitViewControllerStyle)style
{
  if (style == UISplitViewControllerStyleUnspecified)
  {
    objc_super v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"UISplitViewController.m" lineNumber:208 description:@"API misuse. -initWithStyle: may not be used with UISplitViewControllerStyleUnspecified"];
  }
  v12.receiver = self;
  v12.super_class = (Class)UISplitViewController;
  uint64_t v6 = [(UIViewController *)&v12 initWithNibName:0 bundle:0];
  uint64_t v7 = v6;
  if (v6)
  {
    [(UISplitViewController *)v6 _commonInitForcingColumnStyle:1];
    objc_super v8 = [(UISplitViewController *)v7 _panelImpl];
    if (!v8)
    {
      objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:v7 file:@"UISplitViewController.m" lineNumber:213 description:@"Wrong implementation class for column-style UISplitViewController support"];
    }
    [v8 setStyle:style];
  }
  return v7;
}

- (void)_commonInitForcingColumnStyle:(BOOL)a3
{
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    id v4 = +[UIDevice currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (!v5) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"UISplitViewController is only supported when running under UIUserInterfaceIdiomPad"];
    }
  }
  if (qword_1EB25E918 != -1) {
    dispatch_once(&qword_1EB25E918, &__block_literal_global_140);
  }
  [(id)objc_opt_class() _forcedImpl];
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = +[_UIVisualStyleRegistry defaultRegistry];
  uint64_t v8 = objc_opt_class();
  [v7 registerVisualStyleClass:v8 forStylableClass:objc_opt_class()];

  id v9 = +[UIDevice currentDevice];
  objc_super v10 = +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", [v9 userInterfaceIdiom]);
  objc_super v11 = (objc_class *)[v10 visualStyleClassForStylableClass:objc_opt_class()];

  objc_super v12 = (_UISplitViewControllerStyle *)[[v11 alloc] initWithSplitViewController:self];
  styleProvider = self->_styleProvider;
  self->_styleProvider = v12;

  uint64_t v14 = (UISplitViewControllerImpl *)[[v6 alloc] initWithSplitViewController:self];
  impl = self->_impl;
  self->_impl = v14;

  [(UISplitViewControllerImpl *)self->_impl _commonInit];
  id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 addObserver:self selector:sel__willBeginSnapshotSession_ name:@"UISceneWillBeginSystemSnapshotSequence" object:0];
  [v16 addObserver:self selector:sel__didEndSnapshotSession_ name:@"UISceneDidCompleteSystemSnapshotSequence" object:0];
}

+ (int64_t)_forcedImpl
{
  return __forcedImpl;
}

- (BOOL)_shouldInitializeColumnStyle
{
  return 0;
}

- (void)setView:(id)a3
{
  id v5 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v9 setView:v5];
}

- (CGFloat)minimumPrimaryColumnWidth
{
  [(UISplitViewControllerImpl *)self->_impl minimumPrimaryColumnWidth];
  return result;
}

- (void)_navigationController:(id)a3 navigationBar:(id)a4 topItemUpdatedContentLayout:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(UISplitViewControllerImpl *)self->_impl style])
  {
    objc_super v10 = [(UISplitViewController *)self _panelImpl];
    [v10 _navigationController:v11 navigationBar:v8 topItemUpdatedContentLayout:v9];
  }
}

- (UISplitViewControllerDisplayModeButtonVisibility)displayModeButtonVisibility
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  objc_super v3 = [(UISplitViewController *)self _panelImpl];
  UISplitViewControllerDisplayModeButtonVisibility v4 = [v3 displayModeButtonVisibility];

  return v4;
}

- (void)setDisplayModeButtonVisibility:(UISplitViewControllerDisplayModeButtonVisibility)displayModeButtonVisibility
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  id v5 = [(UISplitViewController *)self _panelImpl];
  [v5 setDisplayModeButtonVisibility:displayModeButtonVisibility];
}

- (CGFloat)supplementaryColumnWidth
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  objc_super v3 = [(UISplitViewController *)self _panelImpl];
  [v3 supplementaryColumnWidth];
  double v5 = v4;

  return v5;
}

- (void)setPreferredSupplementaryColumnWidth:(CGFloat)preferredSupplementaryColumnWidth
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  id v9 = [(UISplitViewController *)self _panelImpl];
  [v9 setPreferredSupplementaryColumnWidth:preferredSupplementaryColumnWidth];
}

- (void)setMinimumSupplementaryColumnWidth:(CGFloat)minimumSupplementaryColumnWidth
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  id v9 = [(UISplitViewController *)self _panelImpl];
  [v9 setMinimumSupplementaryColumnWidth:minimumSupplementaryColumnWidth];
}

- (void)setMaximumSupplementaryColumnWidth:(CGFloat)maximumSupplementaryColumnWidth
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  id v9 = [(UISplitViewController *)self _panelImpl];
  [v9 setMaximumSupplementaryColumnWidth:maximumSupplementaryColumnWidth];
}

- (void)setPreferredPrimaryColumnWidth:(CGFloat)preferredPrimaryColumnWidth
{
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  id v9 = [(UISplitViewController *)self _panelImpl];
  [v9 setPreferredPrimaryColumnWidth:preferredPrimaryColumnWidth];
}

- (void)removeChildViewController:(id)a3
{
  id v5 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  if (objc_opt_respondsToSelector())
  {
    [(UISplitViewControllerImpl *)self->_impl removeChildViewController:v5];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UISplitViewController;
    [(UIViewController *)&v9 removeChildViewController:v5];
  }
}

- (void)_super_removeChildViewController:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v3 removeChildViewController:a3];
}

- (CGSize)preferredContentSize
{
  v12.receiver = self;
  v12.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v12 preferredContentSize];
  double v4 = v3;
  double v6 = v5;
  if (((dyld_program_sdk_at_least() & 1) != 0
     || [(UISplitViewController *)self _alwaysAllowsSystemPreferredContentSize])&& v4 == *MEMORY[0x1E4F1DB30]&& v6 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [(UISplitViewControllerImpl *)self->_impl _preferredContentSize];
    double v4 = v8;
    double v6 = v9;
  }
  double v10 = v4;
  double v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setPreferredSplitBehavior:(UISplitViewControllerSplitBehavior)preferredSplitBehavior
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    double v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    double v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  id v9 = [(UISplitViewController *)self _panelImpl];
  [v9 setPreferredSplitBehavior:preferredSplitBehavior];
}

- (id)_additionalViewControllersToCheckForUserActivity
{
  return (id)[(UISplitViewControllerImpl *)self->_impl _additionalViewControllersToCheckForUserActivity];
}

- (void)setDelegate:(id)delegate
{
  id v8 = delegate;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    double v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    uint64_t v7 = NSStringFromSelector(a2);
    [v5 raise:v6, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v7 format];
  }
  [(UISplitViewControllerImpl *)self->_impl setDelegate:v8];
}

- (void)setShowsSecondaryOnlyButton:(BOOL)showsSecondaryOnlyButton
{
  BOOL v3 = showsSecondaryOnlyButton;
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  id v9 = [(UISplitViewController *)self _panelImpl];
  [v9 setShowsSecondaryOnlyButton:v3];
}

- (void)setPreferredDisplayMode:(UISplitViewControllerDisplayMode)preferredDisplayMode
{
  uint64_t v6 = [(UISplitViewControllerImpl *)self->_impl style];
  UISplitViewControllerDisplayMode v7 = UISplitViewControllerDisplayModeTwoDisplaceSecondary;
  if (!v6) {
    UISplitViewControllerDisplayMode v7 = UISplitViewControllerDisplayModeOneOverSecondary;
  }
  if (preferredDisplayMode < 0 || v7 < preferredDisplayMode)
  {
    NSLog(&cfstr_SCallerIsTryin.isa, "-[UISplitViewController setPreferredDisplayMode:]", preferredDisplayMode, self);
  }
  else
  {
    if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
    {
      id v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      double v10 = NSStringFromSelector(a2);
      [v8 raise:v9, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v10 format];
    }
    impl = self->_impl;
    [(UISplitViewControllerImpl *)impl setPreferredDisplayMode:preferredDisplayMode];
  }
}

- (id)transitionCoordinator
{
  if (![(UISplitViewControllerImpl *)self->_impl style]
    || ([(UISplitViewController *)self _panelImpl],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [v3 transitionCoordinator],
        double v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    v6.receiver = self;
    v6.super_class = (Class)UISplitViewController;
    double v4 = [(UIViewController *)&v6 transitionCoordinator];
  }
  return v4;
}

- (void)setMinimumPrimaryColumnWidth:(CGFloat)minimumPrimaryColumnWidth
{
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  impl = self->_impl;
  [(UISplitViewControllerImpl *)impl setMinimumPrimaryColumnWidth:minimumPrimaryColumnWidth];
}

- (void)setMaximumPrimaryColumnWidth:(CGFloat)maximumPrimaryColumnWidth
{
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  impl = self->_impl;
  [(UISplitViewControllerImpl *)impl setMaximumPrimaryColumnWidth:maximumPrimaryColumnWidth];
}

- (CGFloat)primaryColumnWidth
{
  [(UISplitViewControllerImpl *)self->_impl primaryColumnWidth];
  return result;
}

- (UISplitViewControllerDisplayMode)preferredDisplayMode
{
  return [(UISplitViewControllerImpl *)self->_impl preferredDisplayMode];
}

void __55__UISplitViewController__commonInitForcingColumnStyle___block_invoke()
{
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    _MergedGlobals_15_1 = 1;
  }
  _UIMainBundleIdentifier();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if ([v2 isEqualToString:@"com.apple.Preferences"]) {
    _MergedGlobals_15_1 = 1;
  }
  if (([v2 isEqualToString:@"com.apple.mobilemail"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.mobilenotes"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.DocumentManagerUICore.Service"] & 1) != 0
    || [v2 isEqualToString:@"com.apple.DocumentsApp"])
  {
    _MergedGlobals_15_1 = 0;
  }
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = [v0 objectForKey:@"_UISplitViewControllerUseSlidingBars"];

  if (os_variant_has_internal_diagnostics() && v1 && [v1 BOOLValue]) {
    _MergedGlobals_15_1 = 0;
  }
}

- (void)setExtendedLayoutIncludesOpaqueBars:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v9 setExtendedLayoutIncludesOpaqueBars:v3];
}

- (UISplitViewControllerPrimaryEdge)primaryEdge
{
  return [(UISplitViewControllerImpl *)self->_impl primaryEdge];
}

- (void)setPrimaryBackgroundStyle:(UISplitViewControllerBackgroundStyle)primaryBackgroundStyle
{
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  impl = self->_impl;
  [(UISplitViewControllerImpl *)impl setPrimaryBackgroundStyle:primaryBackgroundStyle];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

- (void)setPrimaryEdge:(UISplitViewControllerPrimaryEdge)primaryEdge
{
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  impl = self->_impl;
  [(UISplitViewControllerImpl *)impl setPrimaryEdge:primaryEdge];
}

- (void)_setUsesExtraWidePrimaryColumn:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  impl = self->_impl;
  [(UISplitViewControllerImpl *)impl _setUsesExtraWidePrimaryColumn:v3];
}

- (void)_setDisplayModeButtonItemTitle:(id)a3
{
  id v8 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    double v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    uint64_t v7 = NSStringFromSelector(a2);
    [v5 raise:v6, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v7 format];
  }
  [(UISplitViewControllerImpl *)self->_impl _setDisplayModeButtonItemTitle:v8];
}

- (void)setConfiguration:(id)a3
{
  impl = self->_impl;
  id v6 = a3;
  if ([(UISplitViewControllerImpl *)impl lockedForDelegateCallback])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    objc_super v9 = NSStringFromSelector(a2);
    [v7 raise:v8, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v9 format];
  }
  id v10 = [(UISplitViewController *)self _panelImpl];
  [v10 setConfiguration:v6];
}

- (void)_setPrefersOverlayInRegularWidthPhone:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  impl = self->_impl;
  [(UISplitViewControllerImpl *)impl setPrefersOverlayInRegularWidthPhone:v3];
}

- (void)setGutterWidth:(float)a3
{
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    objc_super v9 = NSStringFromSelector(a2);
    [v7 raise:v8, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v9 format];
  }
  impl = self->_impl;
  *(float *)&double v6 = a3;
  [(UISplitViewControllerImpl *)impl setGutterWidth:v6];
}

- (BOOL)_canTileSidebarColumn:(int64_t)a3
{
  double v4 = [(UISplitViewController *)self _panelImpl];
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"-_canTileSidebarColumn not available"];
  }
  char v5 = [v4 canTileSidebarColumn:a3];

  return v5;
}

- (void)showColumn:(UISplitViewControllerColumn)column
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  int v6 = [(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback];
  uint64_t v7 = (void *)MEMORY[0x1E4F1C3C8];
  if (v6)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    id v10 = NSStringFromSelector(a2);
    [v8 raise:v9, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v10 format];
  }
  if (column == UISplitViewControllerColumnCompact) {
    [MEMORY[0x1E4F1CA00] raise:*v7 format:@"Progammatic column showing not supported for Compact column of UISplitViewController"];
  }
  id v11 = [(UISplitViewController *)self _panelImpl];
  [v11 showColumn:column];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISplitViewController;
  id v4 = a3;
  [(UIViewController *)&v5 encodeWithCoder:v4];
  -[UISplitViewControllerImpl encodeWithCoder:](self->_impl, "encodeWithCoder:", v4, v5.receiver, v5.super_class);
}

- (void)setStyle:(int64_t)a3
{
  if (!a3)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UISplitViewController.m" lineNumber:226 description:@"SPI misuse. -setStyle: should be used by IB to set up UISplitViewController for column-style behavior using UISplitViewControllerStyleDoubleColumn or -TripleColumn"];
  }
  id v7 = [(UISplitViewController *)self _panelImpl];
  [v7 setStyle:a3];
}

- (int64_t)composition
{
  return [(UISplitViewControllerImpl *)self->_impl style];
}

- (BOOL)showsSecondaryOnlyButton
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  BOOL v3 = [(UISplitViewController *)self _panelImpl];
  char v4 = [v3 showsSecondaryOnlyButton];

  return v4;
}

- (UISplitViewControllerSplitBehavior)splitBehavior
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  BOOL v3 = [(UISplitViewController *)self _panelImpl];
  UISplitViewControllerSplitBehavior v4 = [v3 splitBehavior];

  return v4;
}

- (void)hideColumn:(UISplitViewControllerColumn)column
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  id v10 = [(UISplitViewController *)self _panelImpl];
  if (([v10 inCollapsingToProposedTopColumnCallback] & 1) == 0
    && ([v10 inExpandingToProposedDisplayModeCallback] & 1) == 0
    && [(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    int v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  if (column == UISplitViewControllerColumnCompact) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Progammatic column hiding not supported for Compact column of UISplitViewController"];
  }
  uint64_t v9 = [(UISplitViewController *)self _panelImpl];
  [v9 hideColumn:column];
}

- (void)setPreferredSupplementaryColumnWidthFraction:(CGFloat)preferredSupplementaryColumnWidthFraction
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    int v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  id v9 = [(UISplitViewController *)self _panelImpl];
  [v9 setPreferredSupplementaryColumnWidthFraction:preferredSupplementaryColumnWidthFraction];
}

- (CGFloat)preferredSupplementaryColumnWidthFraction
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  BOOL v3 = [(UISplitViewController *)self _panelImpl];
  [v3 preferredSupplementaryColumnWidthFraction];
  double v5 = v4;

  return v5;
}

- (CGFloat)minimumSupplementaryColumnWidth
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  BOOL v3 = [(UISplitViewController *)self _panelImpl];
  [v3 minimumSupplementaryColumnWidth];
  double v5 = v4;

  return v5;
}

- (CGFloat)maximumSupplementaryColumnWidth
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  BOOL v3 = [(UISplitViewController *)self _panelImpl];
  [v3 maximumSupplementaryColumnWidth];
  double v5 = v4;

  return v5;
}

- (void)_setVisibleToggleButtonRequiresPresentsWithGesture:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl style])
  {
    id v5 = [(UISplitViewController *)self _panelImpl];
    [v5 _setVisibleToggleButtonRequiresPresentsWithGesture:v3];
  }
}

- (BOOL)_visibleToggleButtonRequiresPresentsWithGesture
{
  uint64_t v3 = [(UISplitViewControllerImpl *)self->_impl style];
  if (v3)
  {
    double v4 = [(UISplitViewController *)self _panelImpl];
    char v5 = [v4 _visibleToggleButtonRequiresPresentsWithGesture];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)_setForceDisplayModeBarButtonHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl style])
  {
    id v5 = [(UISplitViewController *)self _panelImpl];
    [v5 _setForceDisplayModeBarButtonHidden:v3];
  }
}

- (BOOL)_forceDisplayModeBarButtonHidden
{
  uint64_t v3 = [(UISplitViewControllerImpl *)self->_impl style];
  if (v3)
  {
    double v4 = [(UISplitViewController *)self _panelImpl];
    char v5 = [v4 _forceDisplayModeBarButtonHidden];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)_setAllowsDimmedSecondaryAsDeepestUnambiguousResponder:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl style])
  {
    id v5 = [(UISplitViewController *)self _panelImpl];
    [v5 _setAllowsDimmedSecondaryAsDeepestUnambiguousResponder:v3];
  }
}

- (BOOL)_allowsDimmedSecondaryAsDeepestUnambiguousResponder
{
  uint64_t v3 = [(UISplitViewControllerImpl *)self->_impl style];
  if (v3)
  {
    double v4 = [(UISplitViewController *)self _panelImpl];
    char v5 = [v4 _allowsDimmedSecondaryAsDeepestUnambiguousResponder];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)_setIgnoresSheetContext:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl style])
  {
    id v5 = [(UISplitViewController *)self _panelImpl];
    [v5 _setIgnoresSheetContext:v3];
  }
}

- (BOOL)_ignoresSheetContext
{
  uint64_t v3 = [(UISplitViewControllerImpl *)self->_impl style];
  if (v3)
  {
    double v4 = [(UISplitViewController *)self _panelImpl];
    char v5 = [v4 _ignoresSheetContext];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (UIBarButtonItem)displayModeButtonItem
{
  return (UIBarButtonItem *)[(UISplitViewControllerImpl *)self->_impl displayModeButtonItem];
}

- (CGFloat)preferredPrimaryColumnWidthFraction
{
  [(UISplitViewControllerImpl *)self->_impl preferredPrimaryColumnWidthFraction];
  return result;
}

- (void)setPreferredPrimaryColumnWidthFraction:(CGFloat)preferredPrimaryColumnWidthFraction
{
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    int v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  impl = self->_impl;
  [(UISplitViewControllerImpl *)impl setPreferredPrimaryColumnWidthFraction:preferredPrimaryColumnWidthFraction];
}

- (void)showViewController:(UIViewController *)vc sender:(id)sender
{
}

- (void)showDetailViewController:(UIViewController *)vc sender:(id)sender
{
}

- (id)_effectiveInteractionActivityTrackingBaseName
{
  uint64_t v3 = [(UIViewController *)self interactionActivityTrackingBaseName];
  if (!v3)
  {
    if ([(UISplitViewController *)self isMemberOfClass:objc_opt_class()])
    {
      double v4 = [(UISplitViewController *)self masterViewController];
      char v5 = [v4 _effectiveInteractionActivityTrackingBaseName];

      if (v5)
      {
        uint64_t v3 = [@"UISVC-" stringByAppendingString:v5];
      }
      else
      {
        uint64_t v3 = 0;
      }
    }
    else
    {
      int v6 = (objc_class *)objc_opt_class();
      uint64_t v3 = NSStringFromClass(v6);
    }
  }
  return v3;
}

- (float)gutterWidth
{
  [(UISplitViewControllerImpl *)self->_impl gutterWidth];
  return result;
}

- (BOOL)hidesMasterViewInPortrait
{
  return [(UISplitViewControllerImpl *)self->_impl hidesMasterViewInPortrait];
}

- (void)setHidesMasterViewInPortrait:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    int v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  impl = self->_impl;
  [(UISplitViewControllerImpl *)impl setHidesMasterViewInPortrait:v3];
}

- (NSString)_displayModeButtonItemTitle
{
  return (NSString *)[(UISplitViewControllerImpl *)self->_impl _displayModeButtonItemTitle];
}

- (id)_primaryDimmingView
{
  return (id)[(UISplitViewControllerImpl *)self->_impl _primaryDimmingView];
}

- (BOOL)_wantsFloatingSidebar
{
  return [(UISplitViewControllerImpl *)self->_impl _wantsFloatingSidebar];
}

- (BOOL)_prefersOverlayInRegularWidthPhone
{
  return [(UISplitViewControllerImpl *)self->_impl prefersOverlayInRegularWidthPhone];
}

- (void)_setUsesDeviceOverlayPreferences:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    int v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  impl = self->_impl;
  [(UISplitViewControllerImpl *)impl setUsesDeviceOverlayPreferences:v3];
}

- (BOOL)_usesDeviceOverlayPreferences
{
  return [(UISplitViewControllerImpl *)self->_impl usesDeviceOverlayPreferences];
}

- (BOOL)_usesExtraWidePrimaryColumn
{
  return [(UISplitViewControllerImpl *)self->_impl _usesExtraWidePrimaryColumn];
}

- (CGFloat)preferredSupplementaryColumnWidth
{
  _UISplitViewControllerCheckSupportColumnStyleRaiseIfNot(self);
  _supplementaryColumnWidthSupportCheck(self);
  BOOL v3 = [(UISplitViewController *)self _panelImpl];
  [v3 preferredSupplementaryColumnWidth];
  double v5 = v4;

  return v5;
}

- (int64_t)_primaryOffscreenGestureMode
{
  return [(UISplitViewControllerImpl *)self->_impl _primaryOffscreenGestureMode];
}

- (void)_setPrimaryOffscreenGestureMode:(int64_t)a3
{
}

- (void)_allowingMutationsInDelegateCallback:(id)a3
{
  double v4 = (void (**)(void))a3;
  if (v4)
  {
    int v6 = v4;
    if ([(UISplitViewControllerImpl *)self->_impl style])
    {
      double v5 = [(UISplitViewController *)self _panelImpl];
      [v5 _allowingMutationsInDelegateCallback:v6];
    }
    else
    {
      v6[2]();
    }
    double v4 = v6;
  }
}

- (void)_tabBarControllerDidChangeSelection:(id)a3
{
  id v4 = a3;
  id v5 = [(UISplitViewController *)self _panelImpl];
  [v5 _tabBarControllerDidChangeSelection:v4];
}

- (id)_navigationController:(id)a3 navigationBarAdditionalActionsForBackButtonMenu:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UISplitViewControllerImpl *)self->_impl style])
  {
    uint64_t v8 = [(UISplitViewController *)self _panelImpl];
    id v9 = [v8 _navigationController:v6 navigationBarAdditionalActionsForBackButtonMenu:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)_navigationControllerShouldNotAdjustTransitioningSizeForChildContainer:(id)a3
{
  id v4 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl style])
  {
    id v5 = [(UISplitViewController *)self _panelImpl];
    char v6 = [v5 _navigationControllerShouldNotAdjustTransitioningSizeForChildContainer:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (int64_t)_columnForViewController:(id)a3
{
  id v4 = a3;
  if (v4 && [(UISplitViewControllerImpl *)self->_impl style])
  {
    id v5 = [(UISplitViewController *)self _panelImpl];
    int64_t v6 = [v5 _columnForViewController:v4];
  }
  else
  {
    int64_t v6 = 999;
  }

  return v6;
}

- (int64_t)_columnForMonitoredNavigationController:(id)a3
{
  id v4 = a3;
  id v5 = [(UISplitViewController *)self _panelImpl];
  if (v5)
  {
    int64_t v6 = [(UISplitViewController *)self _panelImpl];
    int64_t v7 = [v6 _columnForMonitoredNavigationController:v4];
  }
  else
  {
    int64_t v7 = 999;
  }

  return v7;
}

- (UIEdgeInsets)_tvOSColumnStyleExtraInsetsForChildViewController:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if (v4)
  {
    double v6 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
    if ([(UISplitViewControllerImpl *)self->_impl style])
    {
      id v9 = [(UISplitViewController *)self _panelImpl];
      [v9 _tvOSColumnStyleExtraInsetsForChildViewController:v4];
      double v5 = v10;
      double v6 = v11;
      double v7 = v12;
      double v8 = v13;
    }
  }
  else
  {
    double v6 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
  }

  double v14 = v5;
  double v15 = v6;
  double v16 = v7;
  double v17 = v8;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIScreenEdgePanGestureRecognizer)_fluidOpenSidebarPresentationGestureRecognizer
{
  id v2 = [(UISplitViewController *)self _panelImpl];
  BOOL v3 = [v2 _fluidOpenSidebarPresentationGestureRecognizer];

  return (UIScreenEdgePanGestureRecognizer *)v3;
}

- (BOOL)_shouldUseFluidSidebarGestures
{
  uint64_t v3 = [(UISplitViewControllerImpl *)self->_impl style];
  if (v3)
  {
    id v4 = [(UISplitViewController *)self _panelImpl];
    char v5 = [v4 _shouldUseFluidSidebarGestures];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_isRotating
{
  return [(UISplitViewControllerImpl *)self->_impl _isRotating];
}

- (BOOL)_isAnimating
{
  return [(UISplitViewControllerImpl *)self->_impl _isAnimating];
}

- (BOOL)_isExpanding
{
  return [(UISplitViewControllerImpl *)self->_impl _isExpanding];
}

- (double)_primaryDividerPosition
{
  [(UISplitViewControllerImpl *)self->_impl _primaryDividerPosition];
  return result;
}

- (double)_supplementaryDividerPosition
{
  [(UISplitViewControllerImpl *)self->_impl _supplementaryDividerPosition];
  return result;
}

- (CGSize)_contentSizeForChildViewController:(id)a3 inPopoverController:(id)a4
{
  [(UISplitViewControllerImpl *)self->_impl _contentSizeForChildViewController:a3 inPopoverController:a4];
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_popoverController:(id)a3 willChangeToVisible:(BOOL)a4
{
}

- (void)_popoverController:(id)a3 didChangeFromVisible:(BOOL)a4
{
}

- (void)_descendantWillPresentViewController:(id)a3 modalSourceViewController:(id)a4 presentationController:(id)a5 animated:(BOOL)a6
{
}

- (void)_willShowCollapsedDetailViewController:(id)a3 inTargetController:(id)a4
{
}

- (void)_willBeginSnapshotSession:(id)a3
{
  double v4 = [a3 object];
  if (v4)
  {
    id v8 = v4;
    double v5 = [(UIViewController *)self viewIfLoaded];
    double v6 = [v5 window];
    id v7 = [v6 windowScene];

    double v4 = v8;
    if (v8 == v7)
    {
      [(UISplitViewControllerImpl *)self->_impl _willBeginSnapshotSession];
      double v4 = v8;
    }
  }
}

- (void)_didEndSnapshotSession:(id)a3
{
  double v4 = [a3 object];
  if (v4)
  {
    id v8 = v4;
    double v5 = [(UIViewController *)self viewIfLoaded];
    double v6 = [v5 window];
    id v7 = [v6 windowScene];

    double v4 = v8;
    if (v8 == v7)
    {
      [(UISplitViewControllerImpl *)self->_impl _didEndSnapshotSession];
      double v4 = v8;
    }
  }
}

+ (BOOL)_automaticDisplayModeOnPhoneUsesOverlayInLandscapeDefaultValue
{
  return (byte_1E8FD5094 != 0) & ~_UIInternalPreferenceUsesDefault(&_UIInternalPreference_PhoneLandscapeSVCUsesOverlay, @"PhoneLandscapeSVCUsesOverlay", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
}

- (BOOL)_iPhoneShouldUseOverlayInCurrentEnvironment
{
  return [(UISplitViewControllerImpl *)self->_impl _iPhoneShouldUseOverlayInCurrentEnvironment];
}

- (BOOL)_layoutPrimaryOnRight
{
  return [(UISplitViewControllerImpl *)self->_impl _layoutPrimaryOnRight];
}

- (void)toggleMasterVisible:(id)a3
{
}

- (UISplitViewControllerBackgroundStyle)primaryBackgroundStyle
{
  return [(UISplitViewControllerImpl *)self->_impl primaryBackgroundStyle];
}

- (void)_setSupplementaryColumnAdoptsPrimaryBackgroundStyle:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISplitViewController *)self _panelImpl];
  [v4 setSupplementaryColumnAdoptsPrimaryBackgroundStyle:v3];
}

- (BOOL)_supplementaryColumnAdoptsPrimaryBackgroundStyle
{
  id v2 = [(UISplitViewController *)self _panelImpl];
  char v3 = [v2 supplementaryColumnAdoptsPrimaryBackgroundStyle];

  return v3;
}

- (void)toggleSidebar:(id)a3
{
  id v5 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl style])
  {
    id v4 = [(UISplitViewController *)self _panelImpl];
    [v4 _triggerSidebarKeyCommandAction:v5];
  }
}

- (BOOL)_needsNSToolbarSidebarToggle
{
  return 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_toggleSidebar_ == a3)
  {
    id v5 = [(UISplitViewController *)self _panelImpl];
    char v6 = [v5 _allowsTriggeringSidebarKeyCommandAction];

    return v6;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UISplitViewController;
    return -[UIViewController canPerformAction:withSender:](&v7, sel_canPerformAction_withSender_);
  }
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  if ((char *)[v4 action] == sel_toggleSidebar_)
  {
    id v5 = [(UISplitViewController *)self _panelImpl];
    [v5 _validateTriggerSidebarKeyCommand:v4];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UISplitViewController;
    [(UIResponder *)&v6 validateCommand:v4];
  }
}

- (void)setProvidesPresentationContextTransitionStyle:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v9 setProvidesPresentationContextTransitionStyle:v3];
}

- (void)setRestoresFocusAfterTransition:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v9 setRestoresFocusAfterTransition:v3];
}

- (void)setModalTransitionStyle:(int64_t)a3
{
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v9 setModalTransitionStyle:a3];
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v9 setModalPresentationStyle:a3];
}

- (void)setModalPresentationCapturesStatusBarAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v9 setModalPresentationCapturesStatusBarAppearance:v3];
}

- (void)setEdgesForExtendedLayout:(unint64_t)a3
{
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v9 setEdgesForExtendedLayout:a3];
}

- (void)setAutomaticallyAdjustsScrollViewInsets:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v9 setAutomaticallyAdjustsScrollViewInsets:v3];
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    objc_super v9 = NSStringFromSelector(a2);
    [v7 raise:v8, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v9 format];
  }
  v10.receiver = self;
  v10.super_class = (Class)UISplitViewController;
  -[UIViewController setPreferredContentSize:](&v10, sel_setPreferredContentSize_, width, height);
}

- (CGSize)_super_preferredContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v4 preferredContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setOverrideTraitCollection:(id)a3
{
  id v5 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v9 setOverrideTraitCollection:v5];
}

- (void)setViewRespectsSystemMinimumLayoutMargins:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v8 format];
  }
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v9 setViewRespectsSystemMinimumLayoutMargins:v3];
}

- (void)removeFromParentViewController
{
  if ([(UISplitViewControllerImpl *)self->_impl lockedForDelegateCallback])
  {
    objc_super v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    objc_super v6 = NSStringFromSelector(a2);
    [v4 raise:v5, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v6 format];
  }
  v7.receiver = self;
  v7.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v7 removeFromParentViewController];
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  -[UISplitViewControllerImpl sizeForChildContentContainer:withParentContainerSize:](self->_impl, "sizeForChildContentContainer:withParentContainerSize:", a3, a4.width, a4.height);
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGSize)_super_sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  v6.receiver = self;
  v6.super_class = (Class)UISplitViewController;
  -[UIViewController sizeForChildContentContainer:withParentContainerSize:](&v6, sel_sizeForChildContentContainer_withParentContainerSize_, a3, a4.width, a4.height);
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
}

- (void)_super_willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v4 willTransitionToTraitCollection:a3 withTransitionCoordinator:a4];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
}

- (void)_super_viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v4, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(UISplitViewControllerImpl *)self->_impl preferredContentSizeDidChangeForChildContentContainer:v4];
  }
}

- (id)preferredFocusedView
{
  return (id)[(UISplitViewControllerImpl *)self->_impl preferredFocusedView];
}

- (id)_super_preferredFocusedView
{
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  double v2 = [(UIViewController *)&v4 preferredFocusedView];
  return v2;
}

- (int64_t)_subclassPreferredFocusedViewPrioritizationType
{
  if (!qword_1EB25E928)
  {
    qword_1EB25E928 = +[UISplitViewController instanceMethodForSelector:sel_preferredFocusedView];
    qword_1EB25E930 = +[UISplitViewController instanceMethodForSelector:sel_preferredFocusEnvironments];
  }
  uint64_t v3 = [(UISplitViewController *)self methodForSelector:sel_preferredFocusedView];
  uint64_t v4 = [(UISplitViewController *)self methodForSelector:sel_preferredFocusEnvironments];
  if (v3) {
    BOOL v5 = v3 == qword_1EB25E928;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0;
  }
  if (v4) {
    BOOL v7 = v4 == qword_1EB25E930;
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
  return (id)[(UISplitViewControllerImpl *)self->_impl preferredFocusEnvironments];
}

- (id)_super_preferredFocusEnvironments
{
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  double v2 = [(UIViewController *)&v4 preferredFocusEnvironments];
  return v2;
}

- (id)_overridingPreferredFocusEnvironment
{
  return (id)[(UISplitViewControllerImpl *)self->_impl _overridingPreferredFocusEnvironment];
}

- (id)_super_overridingPreferredFocusEnvironment
{
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  double v2 = [(UIViewController *)&v4 _overridingPreferredFocusEnvironment];
  return v2;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return [(UISplitViewControllerImpl *)self->_impl shouldUpdateFocusInContext:a3];
}

- (BOOL)_super_shouldUpdateFocusInContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  return [(UIViewController *)&v4 shouldUpdateFocusInContext:a3];
}

- (id)_super_childViewControllerForStatusBarStyle
{
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  double v2 = [(UIViewController *)&v4 childViewControllerForStatusBarStyle];
  return v2;
}

- (unint64_t)_super_preferredScreenEdgesDeferringSystemGestures
{
  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  return [(UIViewController *)&v3 preferredScreenEdgesDeferringSystemGestures];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return [(UISplitViewControllerImpl *)self->_impl shouldAutorotateToInterfaceOrientation:a3];
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    impl = self->_impl;
    [(UISplitViewControllerImpl *)impl willRotateToInterfaceOrientation:a3 duration:a4];
  }
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    impl = self->_impl;
    [(UISplitViewControllerImpl *)impl willAnimateRotationToInterfaceOrientation:a3 duration:a4];
  }
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    impl = self->_impl;
    [(UISplitViewControllerImpl *)impl didRotateFromInterfaceOrientation:a3];
  }
}

- (BOOL)_hasPreferredInterfaceOrientationForPresentation
{
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  if ([(UIViewController *)&v4 _hasPreferredInterfaceOrientationForPresentation])
  {
    return 1;
  }
  else
  {
    return [(UISplitViewControllerImpl *)self->_impl _hasPreferredInterfaceOrientationForPresentation];
  }
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return [(UISplitViewControllerImpl *)self->_impl preferredInterfaceOrientationForPresentation];
}

- (int64_t)_super_preferredInterfaceOrientationForPresentation
{
  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  return [(UIViewController *)&v3 preferredInterfaceOrientationForPresentation];
}

- (void)unloadViewForced:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UISplitViewController;
  -[UIViewController unloadViewForced:](&v5, sel_unloadViewForced_);
  [(UISplitViewControllerImpl *)self->_impl unloadViewForced:v3];
}

- (void)_didUpdateFocusInContext:(id)a3
{
}

- (void)_super_didUpdateFocusInContext:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v3 _didUpdateFocusInContext:a3];
}

- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self && dyld_program_sdk_at_least() && [(UISplitViewControllerImpl *)self->_impl style])
  {
    v13.receiver = self;
    v13.super_class = (Class)UISplitViewController;
    double v11 = [(UIViewController *)&v13 _presentationControllerForPresentedController:v8 presentingController:v9 sourceController:v10];
  }
  else
  {
    double v11 = [[_UISheetPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v9];
    [(UISheetPresentationController *)v11 _setWantsBottomAttached:1];
  }

  return v11;
}

- (id)_multitaskingDragExclusionRects
{
  return (id)[(UISplitViewControllerImpl *)self->_impl _multitaskingDragExclusionRects];
}

- (id)_super_multitaskingDragExclusionRects
{
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  double v2 = [(UIViewController *)&v4 _multitaskingDragExclusionRects];
  return v2;
}

- (CGRect)_frameForChildContentContainer:(id)a3
{
  [(UISplitViewControllerImpl *)self->_impl _frameForChildContentContainer:a3];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (BOOL)doesOverridePreferredInterfaceOrientationForPresentation
{
  uint64_t v3 = objc_opt_class();
  return [a1 doesOverrideViewControllerMethod:sel_preferredInterfaceOrientationForPresentation inBaseClass:v3];
}

- (BOOL)_optsOutOfPopoverControllerHierarchyCheck
{
  return [(UISplitViewControllerImpl *)self->_impl _optsOutOfPopoverControllerHierarchyCheck];
}

- (void)_getRotationContentSettings:(id *)a3
{
}

- (id)_childViewControllersToSendViewWillTransitionToSize
{
  return (id)[(UISplitViewControllerImpl *)self->_impl _childViewControllersToSendViewWillTransitionToSize];
}

- (id)_super_childViewControllersToSendViewWillTransitionToSize
{
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  double v2 = [(UIViewController *)&v4 _childViewControllersToSendViewWillTransitionToSize];
  return v2;
}

- (BOOL)_handlesCounterRotationForPresentation
{
  return [(UISplitViewControllerImpl *)self->_impl _handlesCounterRotationForPresentation];
}

- (id)_hostingNavigationBar
{
  return 0;
}

- (BOOL)_shouldOverlayTabBar
{
  return 1;
}

- (_UITabContainerView)_tabBarHostedView
{
  double v2 = [(UISplitViewController *)self _panelImpl];
  uint64_t v3 = [v2 tabBarHostedView];

  return (_UITabContainerView *)v3;
}

- (void)_setTabBarHostedView:(id)a3
{
  id v4 = a3;
  id v5 = [(UISplitViewController *)self _panelImpl];
  [v5 setTabBarHostedView:v4];
}

- (id)_primaryContentResponder
{
  return (id)[(UISplitViewControllerImpl *)self->_impl _primaryContentResponder];
}

- (id)_deepestActionResponder
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__UISplitViewController__deepestActionResponder__block_invoke;
  v4[3] = &unk_1E52E6838;
  v4[4] = self;
  double v2 = [(UIViewController *)self _deepestPresentedActionResponderOrBlock:v4];
  return v2;
}

uint64_t __48__UISplitViewController__deepestActionResponder__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) _deepestActionResponder];
}

- (id)_super_deepestActionResponder
{
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  double v2 = [(UIViewController *)&v4 _deepestActionResponder];
  return v2;
}

- (id)_nextResponderUsingTargetActionStrategyFromChildViewController:(id)a3 didTraverseToParentViewController:(BOOL *)a4
{
  id v6 = a3;
  if (qword_1EB25E938 != -1) {
    dispatch_once(&qword_1EB25E938, &__block_literal_global_179);
  }
  if ((byte_1EB25E912 & 1) == 0 && dyld_program_sdk_at_least())
  {
    id v7 = v6;
    if (v7)
    {
      id v8 = v7;
      while (1)
      {
        id v9 = [(UISplitViewControllerImpl *)self->_impl _nextVisibleViewControllerForResponderAfterChildViewController:v8];
        if ([v9 _hasDeepestActionResponder]) {
          break;
        }

        id v8 = v9;
        if (!v9) {
          goto LABEL_9;
        }
      }
      id v10 = [v9 _deepestActionResponder];

      if (!a4) {
        goto LABEL_11;
      }
    }
    else
    {
LABEL_9:
      id v10 = 0;
      if (!a4) {
        goto LABEL_11;
      }
    }
    *a4 = 1;
LABEL_11:
    if (!v10)
    {
      double v11 = [(UIViewController *)self _existingView];
      double v12 = [v11 window];

      if (v12)
      {
        objc_super v13 = [v11 _deepestActionResponder];
      }
      else
      {
        objc_super v13 = self;
      }
      id v10 = v13;
    }
    goto LABEL_17;
  }
  if (a4) {
    *a4 = 1;
  }
  id v10 = [v6 nextResponder];
LABEL_17:

  return v10;
}

void __122__UISplitViewController__nextResponderUsingTargetActionStrategyFromChildViewController_didTraverseToParentViewController___block_invoke()
{
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_UISplitViewControllerSkipTargetActionBundleChecks, @"UISplitViewControllerSkipTargetActionBundleChecks", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1EB25709C)
  {
    id v0 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v3 = [v0 bundleIdentifier];

    v1 = (void *)v3;
    if (v3)
    {
      int v2 = [&unk_1ED3EF7B8 containsObject:v3];
      v1 = (void *)v3;
      if (v2) {
        byte_1EB25E912 = 1;
      }
    }
  }
}

+ (void)_setForcedImpl:(int64_t)a3
{
  __forcedImpl = a3;
}

- (BOOL)_isLockedForDelegateCallback
{
  return self->__lockedForDelegateCallback;
}

- (void)_setLockedForDelegateCallback:(BOOL)a3
{
  self->__lockedForDelegateCallback = a3;
}

- (BOOL)_alwaysAllowsSystemPreferredContentSize
{
  return self->__alwaysAllowsSystemPreferredContentSize;
}

- (void)set_alwaysAllowsSystemPreferredContentSize:(BOOL)a3
{
  self->__alwaysAllowsSystemPreferredContentSize = a3;
}

- (id)_allContainedViewControllers
{
  return (id)[(UISplitViewControllerImpl *)self->_impl _allContainedViewControllers];
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  impl = self->_impl;
  id v5 = a3;
  [(UISplitViewControllerImpl *)impl encodeRestorableStateWithCoder:v5];
  v6.receiver = self;
  v6.super_class = (Class)UISplitViewController;
  [(UIViewController *)&v6 encodeRestorableStateWithCoder:v5];
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  impl = self->_impl;
  id v5 = a3;
  [(UISplitViewControllerImpl *)impl decodeRestorableStateWithCoder:v5];
  v6.receiver = self;
  v6.super_class = (Class)UISplitViewController;
  [(UIResponder *)&v6 decodeRestorableStateWithCoder:v5];
}

- (id)_effectiveActivityItemsConfiguration
{
  return (id)[(UISplitViewControllerImpl *)self->_impl _effectiveActivityItemsConfiguration];
}

- (id)_super_effectiveActivityItemsConfiguration
{
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewController;
  int v2 = [(UIResponder *)&v4 _effectiveActivityItemsConfiguration];
  return v2;
}

- (BOOL)_usesPanelImpl
{
  return objc_opt_isKindOfClass() & 1;
}

- (UISlidingBarConfiguration)configuration
{
  int v2 = [(UISplitViewController *)self _panelImpl];
  uint64_t v3 = [v2 configuration];

  return (UISlidingBarConfiguration *)v3;
}

- (UISlidingBarState)currentState
{
  int v2 = [(UISplitViewController *)self _panelImpl];
  uint64_t v3 = [v2 currentState];

  return (UISlidingBarState *)v3;
}

- (NSArray)possibleStates
{
  int v2 = [(UISplitViewController *)self _panelImpl];
  uint64_t v3 = [v2 possibleStates];

  return (NSArray *)v3;
}

- (UISlidingBarStateRequest)stateRequest
{
  int v2 = [(UISplitViewController *)self _panelImpl];
  uint64_t v3 = [v2 stateRequest];

  return (UISlidingBarStateRequest *)v3;
}

- (void)setStateRequest:(id)a3
{
  impl = self->_impl;
  id v6 = a3;
  if ([(UISplitViewControllerImpl *)impl lockedForDelegateCallback])
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    id v9 = NSStringFromSelector(a2);
    [v7 raise:v8, @"Mutating UISplitViewController with -%@ is not allowed during a delegate callback.", v9 format];
  }
  id v10 = [(UISplitViewController *)self _panelImpl];
  [v10 setStateRequest:v6];
}

- (void)_animateToRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(UISplitViewController *)self _panelImpl];
  [v5 animateToRequest:v4];
}

- (void)_updateDisplayModeButtonItem
{
  id v2 = [(UISplitViewController *)self _panelImpl];
  [v2 updateDisplayModeButtonItem];
}

@end