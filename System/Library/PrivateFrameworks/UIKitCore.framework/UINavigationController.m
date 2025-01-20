@interface UINavigationController
+ (BOOL)_directlySetsContentOverlayInsetsForChildren;
+ (BOOL)_shouldSendLegacyMethodsFromViewWillTransitionToSize;
+ (BOOL)doesOverridePreferredInterfaceOrientationForPresentation;
- ($1AB5FA073B851C12C2339EC22442E995)_heightRangeOfTopViews;
- ($1AB5FA073B851C12C2339EC22442E995)_intrinsicNavigationBarHeightRangeForNavItem:(id)a3;
- ($512FAC6031DC579ED3B9B436D64463DA)_calculateTopLayoutInfoForViewController:(SEL)a3;
- (BOOL)_allowChildSplitViewControllers;
- (BOOL)_allowNestedNavigationControllers;
- (BOOL)_allowsAutorotation;
- (BOOL)_allowsFreezeLayoutForOrientationChangeOnDismissal;
- (BOOL)_allowsInteractivePopWhenNavigationBarHidden;
- (BOOL)_animationParametersForHidingNavigationBar:(BOOL)a3 lastOperation:(int64_t)a4 edge:(unint64_t *)a5 duration:(double *)a6;
- (BOOL)_canHostRefreshControlOwnedByScrollView:(id)a3;
- (BOOL)_canPerformBackKeyCommandToPopViewController;
- (BOOL)_canPerformRename:(id)a3;
- (BOOL)_canRestoreFocusAfterTransitionToRecalledItem:(id)a3 inViewController:(id)a4;
- (BOOL)_canUpdateTopViewFramesToMatchScrollView;
- (BOOL)_canUseBackKeyCommandToTriggerSidebarKeyCommandWithSender:(id)a3;
- (BOOL)_clipUnderlapWhileTransitioning;
- (BOOL)_didExplicitlyHideTabBar;
- (BOOL)_doesTopViewControllerSupportInterfaceOrientation:(int64_t)a3;
- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)_gestureRecognizerShouldBegin:(id)a3;
- (BOOL)_hasInterruptibleNavigationTransition;
- (BOOL)_hasNestedNavigationController;
- (BOOL)_hasPotentiallyChromelessBottomBar;
- (BOOL)_hasPreferredInterfaceOrientationForPresentation;
- (BOOL)_hasTranslucentNavigationBarIncludingViewController:(id)a3;
- (BOOL)_ignoreFinishingModalTransitionForFiles;
- (BOOL)_interactiveScrollActive;
- (BOOL)_isAppearingOrAppearedCheck;
- (BOOL)_isCreatedBySplitViewController;
- (BOOL)_isCrossfadingInTabBar;
- (BOOL)_isCrossfadingOutTabBar;
- (BOOL)_isCurrentTransitionPreemptable;
- (BOOL)_isExecutingSplitViewControllerActions;
- (BOOL)_isLayingOutTopViewController;
- (BOOL)_isNavigationBarEffectivelyVisible;
- (BOOL)_isNavigationBarVisible;
- (BOOL)_isNavigationController;
- (BOOL)_isNestedNavigationController;
- (BOOL)_isPerformingLayoutToLayoutTransition;
- (BOOL)_isPopping;
- (BOOL)_isPresentationContextByDefault;
- (BOOL)_isPushing;
- (BOOL)_isPushingOrPopping;
- (BOOL)_isPushingOrPoppingUsingLayoutToLayoutNavigationTransition;
- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3;
- (BOOL)_isTransitioning;
- (BOOL)_isTransitioningOrPaletteIsTransitioning;
- (BOOL)_isTransitioningSearchController;
- (BOOL)_isUsingBuiltinAnimator;
- (BOOL)_isViewControllerFullWidth;
- (BOOL)_isViewControllerInRootPresentationHierarchy:(id)a3;
- (BOOL)_navbarIsAppearingInteractively;
- (BOOL)_navigationBar:(id)a3 getContentOffsetOfObservedScrollViewIfApplicable:(CGPoint *)a4;
- (BOOL)_navigationBarAnimationWasCancelled;
- (BOOL)_navigationBarLayoutIsInInteractiveScroll;
- (BOOL)_navigationBarShouldShowSidebarToggleInNSToolbar:(id)a3;
- (BOOL)_navigationBarShouldUpdateProgress;
- (BOOL)_navigationBarTopItemIsNestedNavigationController:(id)a3;
- (BOOL)_navigationControllerShouldObserveScrollView;
- (BOOL)_navigationItemShouldDeferSearchPresentationOrDismissalForScrollViewAnimation:(id)a3;
- (BOOL)_navigationSoundsEnabled;
- (BOOL)_otherExpectedNavigationControllerObservesScrollView:(id)a3;
- (BOOL)_positionBarsExclusivelyWithSafeArea;
- (BOOL)_sanityCheckPushViewController:(id)a3 transition:(int)a4 forceImmediate:(BOOL)a5;
- (BOOL)_searchHidNavigationBar;
- (BOOL)_shouldBottomBarBeHidden;
- (BOOL)_shouldChildViewControllerUseFullScreenLayout:(id)a3;
- (BOOL)_shouldCrossFadeBottomBars;
- (BOOL)_shouldCrossFadeNavigationBar;
- (BOOL)_shouldCrossFadeNavigationBarVisibility;
- (BOOL)_shouldHideBarsForTraits:(id)a3;
- (BOOL)_shouldHideSearchBarWhenScrollingForNavigationItem:(id)a3;
- (BOOL)_shouldIgnoreDelegateTransitionController;
- (BOOL)_shouldInteractivePopGestureBeEnabled;
- (BOOL)_shouldNavigationBarInsetViewController:(id)a3;
- (BOOL)_shouldNavigationBarInsetViewController:(id)a3 orOverlayContent:(BOOL *)a4;
- (BOOL)_shouldOverlayTabBar;
- (BOOL)_shouldPersistViewWhenCoding;
- (BOOL)_shouldSkipHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary;
- (BOOL)_shouldTabBarController:(id)a3 insetViewController:(id)a4 orOverlayContent:(BOOL *)a5;
- (BOOL)_shouldToolBar:(id)a3 insetViewController:(id)a4;
- (BOOL)_shouldToolBar:(id)a3 insetViewController:(id)a4 orOverlayContent:(BOOL *)a5;
- (BOOL)_shouldUpdateFocusInContext:(id)a3;
- (BOOL)_shouldUseBuiltinInteractionController;
- (BOOL)_shouldUseOnePartRotation;
- (BOOL)_suspendToolbarBackgroundUpdating;
- (BOOL)_toolbarAnimationWasCancelled;
- (BOOL)_toolbarIsAnimatingInteractively;
- (BOOL)_transitionConflictsWithNavigationTransitions:(id)a3;
- (BOOL)_tryRequestPopToItem:(id)a3;
- (BOOL)_useCrossFadeForGestureHiding;
- (BOOL)_useCurrentStatusBarHeight;
- (BOOL)_useStandardStatusBarHeight;
- (BOOL)_viewControllerIgnoresClippedGlyphPathFrame;
- (BOOL)_viewControllerUnderlapsStatusBar;
- (BOOL)_viewControllerWasSelected;
- (BOOL)_wantsTabCrossFadeTransition;
- (BOOL)_willPerformCustomNavigationTransitionForPop;
- (BOOL)_willPerformCustomNavigationTransitionForPush;
- (BOOL)allowUserInteractionDuringTransition;
- (BOOL)avoidMovingNavBarOffscreenBeforeUnhiding;
- (BOOL)becomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)editing;
- (BOOL)enableBackButtonDuringTransition;
- (BOOL)hidesBarsOnSwipe;
- (BOOL)hidesBarsOnTap;
- (BOOL)hidesBarsWhenKeyboardAppears;
- (BOOL)hidesBarsWhenVerticallyCompact;
- (BOOL)isBuiltinTransition;
- (BOOL)isCustomTransition;
- (BOOL)isExpanded;
- (BOOL)isInteractiveTransition;
- (BOOL)isModalInPopover;
- (BOOL)isNavigationBarHidden;
- (BOOL)isToolbarHidden;
- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4;
- (BOOL)navigationBar:(id)a3 shouldPushItem:(id)a4;
- (BOOL)needsDeferredTransition;
- (BOOL)pretendNavBarHidden;
- (BOOL)searchBarHidNavBar;
- (BOOL)wasLastOperationAnimated;
- (CGPoint)_computeTopBarCenter:(id)a3 hidden:(BOOL)a4 edge:(unint64_t)a5 center:(CGPoint)a6 offset:(double)a7;
- (CGRect)_boundsForPalette:(id)a3 size:(CGSize)a4;
- (CGRect)_frameForPalette:(id)a3;
- (CGRect)_frameForViewController:(id)a3;
- (CGRect)_frameForWrapperViewForViewController:(id)a3;
- (CGRect)_incomingNavigationBarFrame;
- (CGRect)transitionConductor:(id)a3 frameForViewController:(id)a4;
- (CGRect)transitionConductor:(id)a3 frameForWrapperViewForViewController:(id)a4;
- (CGSize)_adjustedContentSizeForPopover:(CGSize)a3;
- (CGSize)_navigationBarSizeForViewController:(id)a3 proposedHeight:(double)a4 allowRubberBandStretch:(BOOL)a5;
- (CGSize)_preferredContentSizeForcingLoad:(BOOL)a3;
- (CGSize)contentSizeForViewInPopover;
- (CGSize)preferredContentSize;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (Class)_toolbarClass;
- (Class)navigationBarClass;
- (NSArray)popToRootViewControllerAnimated:(BOOL)animated;
- (NSArray)popToViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (NSDirectionalEdgeInsets)_layoutMarginsforNavigationBar:(id)a3;
- (NSMapTable)_rememberedFocusedItemsByViewController;
- (NSUUID)_navbarAnimationId;
- (NSUUID)_toolbarAnimationId;
- (UIEdgeInsets)_avoidanceInsets;
- (UIEdgeInsets)_calculateEdgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIEdgeInsets)_collapsableContentPaddingForObservedScrollView:(id)a3;
- (UIEdgeInsets)_edgeInsetsDeferringToCommandeeringTableHeaderViewStyleSearchControllerWithPresentingViewController:(id)a3;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIEdgeInsets)_expectedContentInsetDeltaForViewController:(id)a3;
- (UIEdgeInsets)_revealableContentPaddingForObservedScrollView:(id)a3 includeContentWithCollapsedAffinity:(BOOL)a4;
- (UIFocusContainerGuide)_contentFocusContainerGuide;
- (UINavigationBar)navigationBar;
- (UINavigationController)initWithCoder:(NSCoder *)aDecoder;
- (UINavigationController)initWithNavigationBarClass:(Class)navigationBarClass toolbarClass:(Class)toolbarClass;
- (UINavigationController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (UINavigationController)initWithRootViewController:(UIViewController *)rootViewController;
- (UIPanGestureRecognizer)barHideOnSwipeGestureRecognizer;
- (UITabGroup)_managedTabGroup;
- (UITapGestureRecognizer)barHideOnTapGestureRecognizer;
- (UIToolbar)toolbar;
- (UIView)navigationTransitionView;
- (UIViewController)_temporaryWindowLocator;
- (UIViewController)bottomViewController;
- (UIViewController)detailViewController;
- (UIViewController)disappearingViewController;
- (UIViewController)popViewControllerAnimated:(BOOL)animated;
- (UIViewController)previousViewController;
- (UIViewController)topViewController;
- (UIViewController)visibleViewController;
- (UIViewControllerAnimatedTransitioning)_cachedTransitionController;
- (UIViewControllerAnimatedTransitioning)_transitionController;
- (UIViewControllerInteractiveTransitioning)_cachedInteractionController;
- (UIViewControllerInteractiveTransitioning)_interactionController;
- (_UIAnimationCoordinator)_barInteractiveAnimationCoordinator;
- (_UIBarPanGestureRecognizer)_barSwipeHideGesture;
- (_UIBarTapGestureRecognizer)_barTapHideGesture;
- (_UIViewControllerTransitionConductor)_transitionConductor;
- (double)_builtinTransitionGap;
- (double)_contentMarginForView:(id)a3;
- (double)_customNavigationTransitionDuration;
- (double)_navigationBar:(id)a3 preferredHeightForTransitionToHeightRange:(id)a4;
- (double)_preferredHeightForHidingNavigationBarForViewController:(id)a3 topItem:(id)a4;
- (double)_scrollOffsetRetargettedToDetentOffsetIfNecessary:(double)a3 unclampedOriginalTargetOffset:(double)a4 scrollView:(id)a5;
- (double)_scrollViewBottomContentInsetForViewController:(id)a3;
- (double)_scrollViewTopContentInsetForViewController:(id)a3;
- (double)_statusBarHeightAdjustmentForCurrentOrientation;
- (double)_statusBarHeightForCurrentInterfaceOrientation;
- (double)_topBarHeight;
- (double)_topPalettePreferredLayoutHeightForVisibilityStateIfDisplayedForViewController:(id)a3;
- (double)_widthForLayout;
- (double)durationForTransition:(int)a3;
- (id)_additionalViewControllersToCheckForUserActivity;
- (id)_backdropBarGroupName;
- (id)_builtinInteractionController;
- (id)_builtinTransitionController;
- (id)_childViewControllersEligibleForOverridingPreferredFocusEnvironments;
- (id)_childViewControllersToSendViewWillTransitionToSize;
- (id)_contentOrObservableScrollViewForEdge:(unint64_t)a3;
- (id)_createBuiltInInteractionControllerForAnimationController:(id)a3;
- (id)_createBuiltInTransitionControllerForOperation:(int64_t)a3;
- (id)_customInteractionController:(id)a3;
- (id)_customTransitionController:(BOOL)a3;
- (id)_deepestActionResponder;
- (id)_effectiveActivityItemsConfiguration;
- (id)_effectiveDelegateForNavigationItem:(id)a3;
- (id)_effectiveInteractionActivityTrackingBaseName;
- (id)_existingActiveVisibleToolbar;
- (id)_existingNavigationBar;
- (id)_existingToolbar;
- (id)_existingToolbarWithItems;
- (id)_findViewControllerToPopTo;
- (id)_findViewControllerToPopToForNavigationItem:(id)a3;
- (id)_hostingNavigationBar;
- (id)_independentContainedScrollViewIntermediateToDescendantViewController:(id)a3;
- (id)_interfaceOrientationWindowForBar:(id)a3 matchingBar:(id)a4;
- (id)_interruptibleNavigationTransitionAnimator;
- (id)_keyboardAnimationStyle;
- (id)_keyboardAppearedNotificationToken;
- (id)_lastNavigationItems;
- (id)_managedSearchPaletteForEdge:(unint64_t)a3 size:(CGSize)a4;
- (id)_moreListTitle;
- (id)_navigationBarAdditionalActionsForBackButtonMenu:(id)a3;
- (id)_navigationBarForNestedNavigationController;
- (id)_navigationBarHiddenByDefault:(BOOL)a3;
- (id)_navigationBarTransitionOverlay;
- (id)_navigationBarWindowForInterfaceOrientation:(id)a3;
- (id)_navigationItems;
- (id)_navigationItemsCallingPublicAccessor:(BOOL)a3;
- (id)_navigationToolbarTransitionController;
- (id)_nestedTopViewController;
- (id)_nthChildViewControllerFromTop:(unint64_t)a3;
- (id)_outermostNavigationController;
- (id)_overridingPreferredFocusEnvironment;
- (id)_paletteForEdge:(unint64_t)a3 size:(CGSize)a4 paletteClass:(Class)a5;
- (id)_pinningBarForPalette:(id)a3;
- (id)_popViewControllerWithTransition:(int)a3 allowPoppingLast:(BOOL)a4;
- (id)_recallRememberedFocusedItemForViewController:(id)a3;
- (id)_screenEdgePanGestureRecognizer;
- (id)_scrollDetentOffsetsForScrollView:(id)a3;
- (id)_separateViewControllersAfterAndIncludingViewController:(id)a3 forSplitViewController:(id)a4;
- (id)_showcaseView;
- (id)_startInteractiveBarTransition:(id)a3;
- (id)_targetNavigationBarForUISplitViewControllerSidebarButton;
- (id)_toolbarWindowForInterfaceOrientation:(id)a3;
- (id)_topPalette;
- (id)_topViewControllerObservableScrollViewForEdge:(unint64_t)a3;
- (id)_traitOverridesForChildViewController:(id)a3;
- (id)_transitionAnimationContext;
- (id)_transitionCoordinator;
- (id)_uip_tabElement;
- (id)_updateNavigationBarHandler;
- (id)_viewControllerForDisappearCallback;
- (id)_viewControllerForObservableScrollView;
- (id)_viewForContentInPopover;
- (id)_viewsWithDisabledInteractionGivenTransitionContext:(id)a3;
- (id)_window;
- (id)allowedChildViewControllersForUnwindingFromSource:(id)a3;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)defaultPNGName;
- (id)delegate;
- (id)existingPaletteForEdge:(unint64_t)a3;
- (id)moreListImage;
- (id)moreListSelectedImage;
- (id)moreListTableCell;
- (id)navigationItem;
- (id)paletteForEdge:(unint64_t)a3 size:(CGSize)a4;
- (id)popToRootViewControllerWithTransition:(int)a3;
- (id)popToViewController:(id)a3 transition:(int)a4;
- (id)popToViewControllerWithSnapbackIdentifier:(id)a3 animated:(BOOL)a4;
- (id)popViewControllerWithAnimationTransition:(int64_t)a3 duration:(double)a4 curve:(int64_t)a5;
- (id)popViewControllerWithTransition:(int)a3;
- (id)preferredFocusEnvironments;
- (id)preferredFocusedView;
- (id)rotatingFooterView;
- (id)rotatingHeaderView;
- (id)rotatingSnapshotViewForWindow:(id)a3;
- (id)segueForUnwindingToViewController:(id)a3 fromViewController:(id)a4 identifier:(id)a5;
- (id)separateSecondaryViewControllerForSplitViewController:(id)a3;
- (id)tab;
- (id)tabBarItem;
- (id)transitionConductor:(id)a3 retargetedToViewControllerForTransitionFromViewController:(id)a4 toViewController:(id)a5 transition:(int)a6;
- (id)valueForUndefinedKey:(id)a3;
- (id)viewControllerForUnwindSegueAction:(SEL)a3 fromViewController:(id)a4 withSender:(id)a5;
- (int)_deferredTransition;
- (int)_effectiveTransitionForTransition:(int)a3;
- (int)_transitionForOldViewControllers:(id)a3 newViewControllers:(id)a4;
- (int64_t)_builtinTransitionStyle;
- (int64_t)_navigationBarTransitionVariant;
- (int64_t)_positionForBar:(id)a3;
- (int64_t)_preferredNavigationBarPosition;
- (int64_t)_subclassPreferredFocusedViewPrioritizationType;
- (int64_t)_topLayoutTypeForViewController:(id)a3;
- (int64_t)lastOperation;
- (int64_t)modalTransitionStyle;
- (int64_t)navigationBarNSToolbarSection:(id)a3;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)_keyboardScreenEdgeForTransition:(int)a3;
- (unint64_t)preferredScreenEdgesDeferringSystemGestures;
- (unint64_t)supportedInterfaceOrientations;
- (void)__viewWillLayoutSubviews;
- (void)_applyViewControllers:(id)a3 transition:(int)a4 animated:(BOOL)a5 operation:(int64_t)a6 rescheduleBlock:(id)a7;
- (void)_calculateTopViewFramesForExpandedLayoutWithViewController:(id)a3 contentScrollView:(id)a4 gettingNavBarFrame:(CGRect *)a5 topPaletteFrame:(CGRect *)a6;
- (void)_calculateTopViewFramesForLayoutWithViewController:(id)a3 contentScrollView:(id)a4 navBarFrame:(CGRect *)a5 topPaletteFrame:(CGRect *)a6 topLayoutType:(int64_t)a7;
- (void)_calculateTopViewFramesFromLayoutHeightsWithViewController:(id)a3 contentScrollView:(id)a4 preservingContentInset:(BOOL)a5 respectFullExtension:(BOOL)a6 gettingNavBarFrame:(CGRect *)a7 topPaletteFrame:(CGRect *)a8;
- (void)_cancelInteractiveTransition:(double)a3 transitionContext:(id)a4;
- (void)_clearLastOperation;
- (void)_collapseViewController:(id)a3 forSplitViewController:(id)a4;
- (void)_commonInitWithBuiltinTransitionGap:(double)a3;
- (void)_commonNonCoderInit;
- (void)_computeAndApplyScrollContentInsetDeltaForViewController:(id)a3;
- (void)_configureBarSwipeGesture;
- (void)_configureBarTapGesture;
- (void)_configureBarsAutomaticActions;
- (void)_configureKeyboardBarHiding;
- (void)_configureToolbar;
- (void)_detachPalette:(id)a3;
- (void)_detachTopPaletteIfShowingSearchBarForTopmostViewControllerInNavigationController:(id)a3;
- (void)_didBecomeContentViewControllerOfPopover:(id)a3;
- (void)_didCancelTransitionFromViewController:(id)a3 toViewController:(id)a4 wrapperView:(id)a5 wasCustom:(BOOL)a6;
- (void)_didEndTransitionFromView:(id)a3 toView:(id)a4 wasCustom:(BOOL)a5;
- (void)_didResignContentViewControllerOfPopover:(id)a3;
- (void)_didUpdateFocusInContext:(id)a3;
- (void)_eagerlyUpdateSafeAreaInsets;
- (void)_ensureToViewControllersViewIsLoaded:(id)a3;
- (void)_executeNavigationHandler:(id)a3 deferred:(BOOL)a4;
- (void)_executeSplitViewControllerActions:(id)a3;
- (void)_finishAnimationTracking;
- (void)_finishInteractiveTransition:(double)a3 transitionContext:(id)a4;
- (void)_forgetFocusedItemForViewController:(id)a3;
- (void)_forwardPaletteToViewControllerIfNeeded:(id)a3;
- (void)_gestureRecognizedInteractiveHide:(id)a3;
- (void)_gestureRecognizedToggleVisibility:(id)a3;
- (void)_getRotationContentSettings:(id *)a3;
- (void)_handleSubtreeDidGainScrollView:(id)a3;
- (void)_hideForKeyboardAppearance;
- (void)_hideOrShowBottomBarIfNeededWithTransition:(int)a3;
- (void)_hideShowNavigationBarDidStop:(id)a3 finished:(id)a4 context:(id)a5;
- (void)_hideShowToolbarDidStop:(id)a3 finished:(id)a4 context:(id)a5;
- (void)_immediatelyApplyViewControllers:(id)a3 transition:(int)a4 animated:(BOOL)a5 operation:(int64_t)a6;
- (void)_immediatelyFinishNavigationBarTransition;
- (void)_initializeNavigationDeferredTransitionContextIfNecessary;
- (void)_installPaletteIntoViewHierarchy:(id)a3;
- (void)_layoutContainerViewDidMoveToWindow:(id)a3;
- (void)_layoutContainerViewSemanticContentAttributeChanged:(id)a3;
- (void)_layoutTopViewController;
- (void)_layoutTopViewControllerLookForNested:(BOOL)a3;
- (void)_layoutViewController:(id)a3;
- (void)_makeBarHideGestureIfNecessary;
- (void)_makeBarSwipeGestureIfNecessary;
- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5;
- (void)_navigationBar:(id)a3 itemBackButtonUpdated:(id)a4;
- (void)_navigationBar:(id)a3 itemEnabledAutoScrollTransition:(id)a4;
- (void)_navigationBar:(id)a3 requestPopToItem:(id)a4;
- (void)_navigationBar:(id)a3 topItemUpdatedContentLayout:(id)a4;
- (void)_navigationBar:(id)a3 topItemUpdatedLargeTitleDisplayMode:(id)a4;
- (void)_navigationBarChangedSize:(id)a3;
- (void)_navigationBarDidChangeStyle:(id)a3;
- (void)_navigationBarDidEndAnimation:(id)a3;
- (void)_navigationBarDidUpdateVisibility:(id)a3;
- (void)_navigationBarPrepareToAnimateTransition:(id)a3;
- (void)_navigationBarWillBeginCoordinatedTransitionAnimations:(id)a3;
- (void)_navigationBarWillChangeHeightForManualShowOrHideOfSearchScopeBar:(id)a3;
- (void)_navigationBarWillRunAutomaticDeferredShowsScopeBar:(id)a3;
- (void)_navigationItemDidUpdateSearchController:(id)a3 oldSearchController:(id)a4;
- (void)_noteNestedNavigationControllerDidReturnToNormal:(id)a3;
- (void)_notifyTransitionBegan:(id)a3;
- (void)_observableScrollViewDidChangeFrom:(id)a3 forViewController:(id)a4 edges:(unint64_t)a5;
- (void)_observeScrollView:(id)a3 didBeginTransitionToDeferredContentOffset:(CGPoint)a4;
- (void)_observeScrollView:(id)a3 willEndDraggingWithVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 unclampedOriginalTarget:(CGPoint)a6;
- (void)_observeScrollViewAlignedContentMarginDidChange:(id)a3;
- (void)_observeScrollViewDidEndDecelerating:(id)a3;
- (void)_observeScrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)_observeScrollViewDidScroll:(id)a3 topLayoutType:(int64_t)a4;
- (void)_observeScrollViewGeometryAffectingContentBottomDidChange:(id)a3;
- (void)_observeScrollViewHasClearedContentOffsetAnimation:(id)a3;
- (void)_observeScrollViewWillBeginDragging:(id)a3;
- (void)_performBackGesture:(id)a3;
- (void)_performBackKeyCommand:(id)a3;
- (void)_performCoordinatedUpdateTopFramesTransitionAnimation;
- (void)_performSkippedHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary;
- (void)_performTopViewGeometryUpdates:(id)a3;
- (void)_performWhileIgnoringUpdateTopViewFramesToMatchScrollOffset:(id)a3;
- (void)_popNavigationBar:(id)a3 item:(id)a4;
- (void)_positionNavigationBar:(id)a3 hidden:(BOOL)a4 edge:(unint64_t)a5 center:(CGPoint)a6 offset:(double)a7;
- (void)_positionNavigationBarHidden:(BOOL)a3;
- (void)_positionNavigationBarHidden:(BOOL)a3 edge:(unint64_t)a4;
- (void)_positionNavigationBarHidden:(BOOL)a3 edge:(unint64_t)a4 initialOffset:(double)a5;
- (void)_positionPaletteHidden:(BOOL)a3 edge:(unint64_t)a4;
- (void)_positionPaletteHidden:(BOOL)a3 edge:(unint64_t)a4 initialOffset:(double)a5;
- (void)_positionToolbarHidden:(BOOL)a3;
- (void)_positionToolbarHidden:(BOOL)a3 edge:(unint64_t)a4;
- (void)_positionToolbarHidden:(BOOL)a3 edge:(unint64_t)a4 crossFade:(BOOL)a5;
- (void)_positionTransitioningPalette:(id)a3 outside:(BOOL)a4 edge:(unint64_t)a5 preservingYPosition:(BOOL)a6;
- (void)_prepareCollectionViewController:(id)a3 forSharingWithCollectionViewController:(id)a4;
- (void)_prepareCollectionViewControllerForSharing:(id)a3;
- (void)_prepareCollectionViewControllers:(id)a3 forSharingInRange:(id)a4;
- (void)_prepareForNestedDisplayWithNavigationController:(id)a3;
- (void)_prepareForNormalDisplayWithNavigationController:(id)a3;
- (void)_presentationTransitionUnwrapViewController:(id)a3;
- (void)_presentationTransitionWrapViewController:(id)a3 forTransitionContext:(id)a4;
- (void)_propagateContentAdjustmentsForControllersWithSharedViews;
- (void)_releaseContainerViews;
- (void)_reloadCachedInteractiveScrollMeasurements;
- (void)_rememberFocusedItem:(id)a3 forViewController:(id)a4;
- (void)_rememberPresentingFocusedItem:(id)a3;
- (void)_repositionPaletteWithNavigationBarHidden:(BOOL)a3 duration:(double)a4 shouldUpdateNavigationItems:(BOOL)a5;
- (void)_requestNavigationBarUpdateSearchBarForPlacementChangeIfApplicable;
- (void)_resetBottomBarHiddenState;
- (void)_resetScrollViewObservingForViewController:(id)a3;
- (void)_safeAreaInsetsDidChangeForView;
- (void)_scrollToRevealNavigationBarPart:(int64_t)a3 animated:(BOOL)a4;
- (void)_scrollViewManagerDidFinishScrolling:(id)a3;
- (void)_sendNavigationBarToBack;
- (void)_setAllowChildSplitViewControllers:(BOOL)a3;
- (void)_setAllowNestedNavigationControllers:(BOOL)a3;
- (void)_setAllowsFreezeLayoutForOrientationChangeOnDismissal:(BOOL)a3;
- (void)_setAllowsInteractivePopWhenNavigationBarHidden:(BOOL)a3;
- (void)_setBarSwipeHideGesture:(id)a3;
- (void)_setBarTapHideGesture:(id)a3;
- (void)_setBarsHidden:(BOOL)a3;
- (void)_setBarsHidden:(BOOL)a3 allowAnimation:(BOOL)a4;
- (void)_setBuiltinTransitionGap:(double)a3;
- (void)_setBuiltinTransitionStyle:(int64_t)a3;
- (void)_setCachedInteractionController:(id)a3;
- (void)_setCachedTransitionController:(id)a3;
- (void)_setClipUnderlapWhileTransitioning:(BOOL)a3;
- (void)_setClipsToBounds:(BOOL)a3;
- (void)_setContentInset:(UIEdgeInsets)a3;
- (void)_setContentOverlayInsets:(UIEdgeInsets)a3;
- (void)_setCreatedBySplitViewController:(BOOL)a3;
- (void)_setCrossfadingInTabBar:(BOOL)a3;
- (void)_setCrossfadingOutTabBar:(BOOL)a3;
- (void)_setCustomTransition:(BOOL)a3;
- (void)_setDefinesPresentationContextIfNecessaryForViewController:(id)a3;
- (void)_setDidExplicitlyHideTabBar:(BOOL)a3;
- (void)_setInteractionController:(id)a3;
- (void)_setInteractiveAnimationCoordinator:(id)a3;
- (void)_setInteractiveScrollActive:(BOOL)a3;
- (void)_setIsNestedNavigationController:(BOOL)a3;
- (void)_setIsWrappingDuringAdaptation:(BOOL)a3;
- (void)_setKeyboardAppearedNotificationToken:(id)a3;
- (void)_setKeyboardNotificationToken:(id)a3;
- (void)_setManagedTabGroup:(id)a3;
- (void)_setNavbarAnimationId:(id)a3;
- (void)_setNavigationBarAnimationWasCancelled:(BOOL)a3;
- (void)_setNavigationBarHidden:(BOOL)a3 edge:(unint64_t)a4 duration:(double)a5;
- (void)_setNavigationBarHidden:(BOOL)a3 edgeIfNotNavigating:(unint64_t)a4 duration:(double)a5;
- (void)_setNavigationBarHidesCompletelyOffscreen:(BOOL)a3;
- (void)_setNavigationSoundsEnabled:(BOOL)a3;
- (void)_setPositionBarsExclusivelyWithSafeArea:(BOOL)a3;
- (void)_setPreferredContentSizeFromChildContentContainer:(id)a3;
- (void)_setPreferredNavigationBarPosition:(int64_t)a3;
- (void)_setSearchHidNavigationBar:(BOOL)a3;
- (void)_setShouldIgnoreDelegateTransitionController:(BOOL)a3;
- (void)_setSuspendToolbarBackgroundUpdating:(BOOL)a3;
- (void)_setTemporaryWindowLocator:(id)a3;
- (void)_setToolbarAnimationId:(id)a3;
- (void)_setToolbarAnimationWasCancelled:(BOOL)a3;
- (void)_setToolbarClass:(Class)a3;
- (void)_setToolbarHidden:(BOOL)a3 edge:(unint64_t)a4 duration:(double)a5;
- (void)_setTransitionController:(id)a3;
- (void)_setUpContentFocusContainerGuide;
- (void)_setUpHostedRefreshControlForScrollView:(id)a3;
- (void)_setUpdateNavigationBarHandler:(id)a3;
- (void)_setUseStandardStatusBarHeight:(BOOL)a3;
- (void)_setUsingBuiltinAnimator:(BOOL)a3;
- (void)_setViewControllers:(id)a3 transition:(int)a4;
- (void)_setViewControllers:(id)a3 transition:(int)a4 animated:(BOOL)a5;
- (void)_setViewControllers:(id)a3 transition:(int)a4 animated:(BOOL)a5 operation:(int64_t)a6;
- (void)_setWantsTabCrossfadeTransition:(BOOL)a3;
- (void)_setupBackGestureRecognizer;
- (void)_setupBackKeyCommand;
- (void)_setupVisualStyle;
- (void)_startCoordinatedBottomBarUpdateForTransition:(int)a3;
- (void)_startDeferredTransitionIfNeeded;
- (void)_startInteractiveNavbarTransition;
- (void)_startInteractiveToolbarTransition;
- (void)_startPaletteTransitionIfNecessary:(id)a3 animated:(BOOL)a4;
- (void)_startToolbarTransitionIfNecessary:(id)a3 animated:(BOOL)a4;
- (void)_stopObservingContentScrollView:(id)a3;
- (void)_stopObservingContentScrollViewsForViewController:(id)a3;
- (void)_stopTransitionsImmediately;
- (void)_tabBarControllerDidFinishShowingTabBar:(id)a3 isHidden:(BOOL)a4;
- (void)_unhideNavigationBarForEdge:(unint64_t)a3;
- (void)_updateAndObserveScrollView:(id)a3 viewController:(id)a4 forEdges:(unint64_t)a5;
- (void)_updateBackgroundTransitionProgressForScrollView:(id)a3 toolbar:(id)a4;
- (void)_updateBackgroundTransitionProgressForScrollView:(id)a3 toolbar:(id)a4 isNavigationTransitionUpdate:(BOOL)a5;
- (void)_updateBarsForCurrentInterfaceOrientation;
- (void)_updateBarsForCurrentInterfaceOrientationAndForceBarLayout:(BOOL)a3;
- (void)_updateBottomBarHiddenState;
- (void)_updateBottomBarHiddenStateFromOtherNavigationController:(id)a3;
- (void)_updateBottomBarsForNavigationTransition;
- (void)_updateChildContentMargins;
- (void)_updateContainersForStackChange;
- (void)_updateControlledViewsToFrame:(CGRect)a3;
- (void)_updateEnclosingSplitViewControllerForStackChange;
- (void)_updateEnclosingTabBarControllerForStackChange;
- (void)_updateInteractiveBarTransition:(id)a3 withUUID:(id)a4 percent:(double)a5 isFinished:(BOOL)a6 didComplete:(BOOL)a7 completionSpeed:(double)a8 completionCurve:(int64_t)a9;
- (void)_updateInteractivePopGestureEnabledState;
- (void)_updateInteractiveTransition:(double)a3;
- (void)_updateLayoutForScrollView:(id)a3 topLayoutType:(int64_t)a4;
- (void)_updateLayoutForStatusBarAndInterfaceOrientation;
- (void)_updateManualScrollEdgeAppearanceProgressForScrollView:(id)a3 navigationItem:(id)a4;
- (void)_updateNavigationBar:(id)a3 fromItems:(id)a4 toItems:(id)a5 animated:(BOOL)a6;
- (void)_updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:(id)a3;
- (void)_updatePaletteConstraints;
- (void)_updatePalettesWithBlock:(id)a3;
- (void)_updateScrollViewFromViewController:(id)a3 toViewController:(id)a4;
- (void)_updateScrollViewObservationFlagsForScrollView:(id)a3 navigationItem:(id)a4 forEdges:(unint64_t)a5;
- (void)_updateToolbarItemsFromViewController:(id)a3 animated:(BOOL)a4;
- (void)_updateTopViewFramesForViewController:(id)a3;
- (void)_updateTopViewFramesForViewController:(id)a3 isCancelledTransition:(BOOL)a4 isOrientationChange:(BOOL)a5;
- (void)_updateTopViewFramesToMatchScrollOffsetInViewController:(id)a3 contentScrollView:(id)a4 topLayoutType:(int64_t)a5;
- (void)_userInterfaceIdiomChanged;
- (void)_viewControllerSubtreeDidGainViewController:(id)a3;
- (void)_viewSubtreeDidGainScrollView:(id)a3 enclosingViewController:(id)a4;
- (void)_willBecomeContentViewControllerOfPopover:(id)a3;
- (void)attachPalette:(id)a3 isPinned:(BOOL)a4;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)detachPalette:(id)a3;
- (void)detachPalette:(id)a3 isInPaletteTransition:(BOOL)a4;
- (void)didAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)loadView;
- (void)navigationBarDidResizeForPrompt:(id)a3;
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)pushViewController:(id)a3 transition:(int)a4;
- (void)pushViewController:(id)a3 transition:(int)a4 forceImmediate:(BOOL)a5;
- (void)removeChildViewController:(id)a3 notifyDidMove:(BOOL)a4;
- (void)rename:(id)a3;
- (void)setAllowUserInteractionDuringTransition:(BOOL)a3;
- (void)setAvoidMovingNavBarOffscreenBeforeUnhiding:(BOOL)a3;
- (void)setContentSizeForViewInPopover:(CGSize)a3;
- (void)setDelegate:(id)delegate;
- (void)setDisappearingViewController:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEnableBackButtonDuringTransition:(BOOL)a3;
- (void)setHidesBarsOnSwipe:(BOOL)hidesBarsOnSwipe;
- (void)setHidesBarsOnTap:(BOOL)hidesBarsOnTap;
- (void)setHidesBarsWhenKeyboardAppears:(BOOL)hidesBarsWhenKeyboardAppears;
- (void)setHidesBarsWhenVerticallyCompact:(BOOL)hidesBarsWhenVerticallyCompact;
- (void)setInteractiveTransition:(BOOL)a3;
- (void)setNavigationBar:(id)a3;
- (void)setNavigationBarClass:(Class)a3;
- (void)setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated;
- (void)setNavigationBarHidden:(BOOL)navigationBarHidden;
- (void)setNeedsDeferredTransition;
- (void)setNeedsDeferredTransition:(BOOL)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setPretendNavBarHidden:(BOOL)a3;
- (void)setSearchBarHidNavBar:(BOOL)a3;
- (void)setToolbar:(id)a3;
- (void)setToolbarHidden:(BOOL)hidden animated:(BOOL)animated;
- (void)setToolbarHidden:(BOOL)toolbarHidden;
- (void)setViewControllers:(NSArray *)viewControllers;
- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated;
- (void)showViewController:(UIViewController *)vc sender:(id)sender;
- (void)transitionConductor:(id)a3 beginPinningInputViewsForTransitionFromViewController:(id)a4 toViewController:(id)a5 forTransitionType:(int)a6;
- (void)transitionConductor:(id)a3 didEndCustomTransitionWithContext:(id)a4 didComplete:(BOOL)a5;
- (void)transitionConductor:(id)a3 didEndTransitionFromView:(id)a4 toView:(id)a5;
- (void)transitionConductor:(id)a3 didStartCustomTransitionWithContext:(id)a4;
- (void)transitionConductor:(id)a3 didStartDeferredTransition:(BOOL)a4 context:(id)a5;
- (void)transitionConductor:(id)a3 interactiveTransitionDidUpdateProgress:(double)a4 finish:(BOOL)a5 transitionCompleted:(BOOL)a6 transitionContext:(id)a7;
- (void)transitionConductor:(id)a3 willTransitionFromViewController:(id)a4 toViewController:(id)a5;
- (void)transitionConductorDidStartImmediateTransition:(id)a3;
- (void)transitionConductorWillStartImmediateTransition:(id)a3;
- (void)unwindForSegue:(id)a3 towardsViewController:(id)a4;
- (void)updateTabBarItemForViewController:(id)a3;
- (void)updateTitleForViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willShowViewController:(id)a3 animated:(BOOL)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UINavigationController

uint64_t __96__UINavigationController__updateManualScrollEdgeAppearanceProgressForScrollView_navigationItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setManualScrollEdgeAppearanceProgress:*(double *)(a1 + 40)];
}

void __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_11(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) toolbar];
  [v1 layoutIfNeeded];
}

uint64_t __55__UINavigationController__navigationBarDidChangeStyle___block_invoke(uint64_t result)
{
  id v1 = *(void **)(result + 32);
  if (v1)
  {
    [*(id *)(result + 32) setNeedsStatusBarAppearanceUpdate];
    [v1 _setNeedsUserInterfaceAppearanceUpdate];
    return [v1 setNeedsWhitePointAdaptivityStyleUpdate];
  }
  return result;
}

uint64_t __54__UINavigationController__unhideNavigationBarForEdge___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 1088) && (v3 = [*(id *)(v2 + 1088) isAttached], uint64_t v2 = *(void *)(a1 + 32), v3))
  {
    int v4 = [*(id *)(v2 + 1088) isVisibleWhenPinningBarIsHidden];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    int v4 = 0;
  }
  if ((*(void *)(v2 + 1232) & 0x4000) == 0)
  {
    [(id)v2 _positionNavigationBarHidden:1 edge:*(void *)(a1 + 48)];
    if ((([*(id *)(a1 + 32) _isTransitioningOrPaletteIsTransitioning] | v4) & 1) == 0) {
      [*(id *)(a1 + 32) _positionPaletteHidden:1 edge:*(void *)(a1 + 48)];
    }
  }
  [*(id *)(a1 + 40) setNeedsLayout];
  [*(id *)(a1 + 40) layoutIfNeeded];
  v5 = *(void **)(a1 + 40);
  return [v5 setHidden:0];
}

- (void)_calculateTopViewFramesForExpandedLayoutWithViewController:(id)a3 contentScrollView:(id)a4 gettingNavBarFrame:(CGRect *)a5 topPaletteFrame:(CGRect *)a6
{
  id v34 = a3;
  id v10 = a4;
  [(UINavigationController *)self _widthForLayout];
  CGFloat v12 = v11;
  [(UIView *)self->_navigationBar frame];
  [(UINavigationController *)self _navigationBarSizeForViewController:v34 proposedHeight:0 allowRubberBandStretch:v13];
  CGFloat v15 = v14;
  BOOL v16 = [(UINavigationController *)self _interactiveScrollActive];
  if (v10) {
    int v17 = [v10 _hasContentForBarInteractions];
  }
  else {
    int v17 = 0;
  }
  if (((v16 | v17) & 1) == 0)
  {
    [(UINavigationController *)self _widthForLayout];
    double v19 = v18;
    v20 = [(UINavigationController *)self _navigationBarForNestedNavigationController];
    v21 = [v34 navigationItem];
    [v20 _layoutHeightsForNavigationItem:v21 fittingWidth:v19];
    CGFloat v15 = v22;
  }
  if (a5)
  {
    [(UIView *)self->_navigationBar frame];
    a5->origin.x = v23;
    a5->origin.y = v24;
    if (self->__positionBarsExclusivelyWithSafeArea)
    {
      v25 = [(UINavigationController *)self navigationBar];
      v26 = [v25 traitCollection];
      uint64_t v27 = [v26 userInterfaceIdiom];

      if (v27 == 3)
      {
        [(UIViewController *)self _contentOverlayInsets];
        a5->origin.x = v28;
      }
    }
    a5->size.width = v12;
    a5->size.height = v15;
  }
  if (a6)
  {
    if (self->_topPalette)
    {
      -[UINavigationController _frameForPalette:](self, "_frameForPalette:");
      a6->origin.x = v29;
      a6->origin.y = v30;
      a6->size.width = v31;
      a6->size.height = v32;
    }
    else
    {
      CGSize v33 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      a6->origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      a6->size = v33;
    }
  }
}

- (BOOL)_interactiveScrollActive
{
  return self->_interactiveScrollActive;
}

- (BOOL)_isNavigationBarVisible
{
  if (![(UINavigationController *)self isNavigationBarHidden])
  {
    v6 = [(UINavigationController *)self navigationBar];
    [v6 alpha];
    double v8 = v7;
    if (v7 > 0.0
      || ([(UINavigationController *)self topViewController],
          uint64_t v2 = objc_claimAutoreleasedReturnValue(),
          [v2 navigationItem],
          int v3 = objc_claimAutoreleasedReturnValue(),
          [v3 _navigationBarVisibility] == 2))
    {
      v9 = [(UINavigationController *)self navigationBar];
      int v5 = [v9 isHidden] ^ 1;

      if (v8 > 0.0) {
        goto LABEL_9;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }

LABEL_9:
    return v5;
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (double)_widthForLayout
{
  containerView = self->_containerView;
  if (containerView)
  {
    [(UIView *)containerView bounds];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      v6 = [(UIViewController *)self _screen];
      [v6 bounds];
      double v5 = v7;
    }
  }
  if (self->__positionBarsExclusivelyWithSafeArea)
  {
    double v8 = [(UINavigationController *)self navigationBar];
    v9 = [v8 traitCollection];
    uint64_t v10 = [v9 userInterfaceIdiom];

    if (v10 == 3)
    {
      [(UIViewController *)self _contentOverlayInsets];
      double v12 = v11;
      [(UIViewController *)self _contentOverlayInsets];
      return v5 - (v12 + v13);
    }
  }
  return v5;
}

- (id)_navigationBarHiddenByDefault:(BOOL)a3
{
  navigationBar = self->_navigationBar;
  if (!navigationBar)
  {
    BOOL v5 = a3;
    id v6 = objc_alloc(self->_navigationBarClass);
    double v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v7 setHidden:v5];
    [(UINavigationController *)self setNavigationBar:v7];

    navigationBar = self->_navigationBar;
  }
  return navigationBar;
}

- (UINavigationBar)navigationBar
{
  return (UINavigationBar *)[(UINavigationController *)self _navigationBarHiddenByDefault:0];
}

- (BOOL)isNavigationBarHidden
{
  if ([(UINavigationController *)self _isNestedNavigationController])
  {
    int v3 = [(UINavigationController *)self _outermostNavigationController];
    double v4 = v3;
    if (v3 == self) {
      int v5 = *(_DWORD *)&self->_navigationControllerFlags & 1;
    }
    else {
      LOBYTE(v5) = [(UINavigationController *)v3 isNavigationBarHidden];
    }
  }
  else
  {
    return *(_DWORD *)&self->_navigationControllerFlags & 1;
  }
  return v5;
}

- (id)_outermostNavigationController
{
  if ([(UINavigationController *)self _isNestedNavigationController])
  {
    int v3 = [(UIViewController *)self navigationController];
    double v4 = v3;
    if (v3)
    {
      int v5 = [v3 _outermostNavigationController];
    }
    else
    {
      int v5 = self;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = self;
  }
  return v6;
}

- (BOOL)_isNestedNavigationController
{
  return (*(void *)&self->_navigationControllerFlags >> 46) & 1;
}

- (id)_effectiveDelegateForNavigationItem:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(UINavigationController *)self disappearingViewController];
  id v6 = [v5 _existingNavigationItem];

  if (v6 == v4)
  {
    uint64_t v10 = self;
    goto LABEL_23;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v7 = [(UIViewController *)self childViewControllers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v8)
  {
    uint64_t v10 = 0;
    goto LABEL_22;
  }
  uint64_t v9 = v8;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v22;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v22 != v11) {
        objc_enumerationMutation(v7);
      }
      double v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      id v14 = [v13 _existingNavigationItem];

      if (v14 == v4)
      {
        double v18 = self;
LABEL_21:

        uint64_t v10 = v18;
        goto LABEL_22;
      }
      if (![v13 _isNestedNavigationController]) {
        continue;
      }
      CGFloat v15 = v13;
      BOOL v16 = [(UINavigationController *)v15 bottomViewController];
      id v17 = [v16 _existingNavigationItem];

      if (v17 == v4)
      {
        double v19 = self;

        uint64_t v10 = v19;
        goto LABEL_13;
      }
      double v18 = [(UINavigationController *)v15 _effectiveDelegateForNavigationItem:v4];

      if (v18)
      {
        uint64_t v10 = v15;
        goto LABEL_21;
      }
      uint64_t v10 = 0;
LABEL_13:
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_22:

LABEL_23:
  return v10;
}

- (UIViewController)disappearingViewController
{
  return self->_disappearingViewController;
}

- (id)_backdropBarGroupName
{
  int v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@:%p> Backdrop Group", v5, self];

  return v6;
}

- (id)_independentContainedScrollViewIntermediateToDescendantViewController:(id)a3
{
  return 0;
}

- (id)_window
{
  v8.receiver = self;
  v8.super_class = (Class)UINavigationController;
  int v3 = [(UIViewController *)&v8 _window];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(UINavigationController *)self _temporaryWindowLocator];
    id v5 = [v6 _window];
  }
  return v5;
}

- (UIViewController)_temporaryWindowLocator
{
  return self->__temporaryWindowLocator;
}

- (id)_traitOverridesForChildViewController:(id)a3
{
  id v4 = a3;
  if (((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_NavigationControllerShouldMaintainOverrideTraitCollectionForPoppingViewController, @"NavigationControllerShouldMaintainOverrideTraitCollectionForPoppingViewController") & 1) != 0|| byte_1EB25706C)&& ([v4 _departingParentViewController], id v5 = (UINavigationController *)objc_claimAutoreleasedReturnValue(), v5, v5 == self))
  {
    id v6 = self->_overrideTraitCollectionForPoppingViewControler;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSDirectionalEdgeInsets)_layoutMarginsforNavigationBar:(id)a3
{
  id v4 = a3;
  [v4 _contentMargin];
  double v6 = v5;
  double v7 = v5;
  if ([v4 insetsLayoutMarginsFromSafeArea])
  {
    uint64_t v8 = [v4 effectiveUserInterfaceLayoutDirection];
    [(UIViewController *)self _contentOverlayInsets];
    if (v8 == 1) {
      double v11 = v9;
    }
    else {
      double v11 = v10;
    }
    if (v8 == 1) {
      double v9 = v10;
    }
    double v7 = v6 + v9;
    double v6 = v6 + v11;
  }

  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = v7;
  double v15 = v6;
  result.trailing = v15;
  result.bottom = v13;
  result.leading = v14;
  result.top = v12;
  return result;
}

- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5
{
  uint64_t v8 = [(UIViewController *)self _existingView];
  int v9 = [v8 _shouldReverseLayoutDirection];

  [(UIViewController *)self systemMinimumLayoutMargins];
  if (v9) {
    double v12 = v11;
  }
  else {
    double v12 = v10;
  }
  *a4 = v12;
  if (v9) {
    double v13 = v10;
  }
  else {
    double v13 = v11;
  }
  *a5 = v13;
}

- (BOOL)_hasPotentiallyChromelessBottomBar
{
  if (_UIBarsApplyChromelessEverywhere())
  {
    int v3 = [(UINavigationController *)self _existingActiveVisibleToolbar];

    if (v3)
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      double v5 = [(UIViewController *)self _tabBarControllerEnforcingClass:1];
      double v6 = v5;
      if (v5) {
        int v4 = [v5 _isBarEffectivelyHidden] ^ 1;
      }
      else {
        LOBYTE(v4) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_observeScrollViewDidScroll:(id)a3 topLayoutType:(int64_t)a4
{
  id v25 = a3;
  double v5 = [(UINavigationController *)self topViewController];
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v5, 1, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  double v7 = [(UINavigationController *)self topViewController];
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v7, 4, 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  int v9 = _UIBarsApplyChromelessEverywhere();
  id v10 = v25;
  if (v9)
  {
    double v11 = [(UINavigationBar *)self->_navigationBar _stack];
    double v12 = [v11 topEntry];
    double v13 = [v12 activeLayout];

    id v14 = v25;
    if (v6 == v25 && (*(void *)&self->_navigationControllerFlags & 0x1000000000000000) != 0)
    {
      if (!-[_UINavigationBarLayout isVariableHeight]((BOOL)v13)
        || (double v15 = -[_UINavigationBarLayout layoutHeights]((uint64_t)v13),
            [(UIView *)self->_navigationBar bounds],
            double Height = CGRectGetHeight(v27),
            id v14 = v25,
            vabdd_f64(v15, Height) < 0.00000011920929))
      {
        id v17 = [(UINavigationController *)self _nestedTopViewController];
        double v18 = [v17 navigationItem];
        [(UINavigationController *)self _updateManualScrollEdgeAppearanceProgressForScrollView:v25 navigationItem:v18];

        id v14 = v25;
      }
    }
    if (v8 == v14)
    {
      double v19 = [(UINavigationController *)self _existingActiveVisibleToolbar];
      [(UINavigationController *)self _updateBackgroundTransitionProgressForScrollView:v25 toolbar:v19];
    }
    id v10 = v25;
  }
  v20 = v10;
  if (v6 == v10)
  {
    uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
    if ((navigationControllerFlags & 0x200000000000000) != 0)
    {
      [(UINavigationController *)self _updateLayoutForScrollView:v25 topLayoutType:1];
      v20 = v25;
      if ((*(void *)&self->_navigationControllerFlags & 0x1000000000000000) == 0) {
        goto LABEL_18;
      }
      long long v22 = [(UINavigationController *)self _nestedTopViewController];
      goto LABEL_17;
    }
    if ((navigationControllerFlags & 0x1000000000000000) == 0
      && (navigationControllerFlags & 0xC00000000000000) != 0)
    {
      long long v22 = [(UINavigationController *)self topViewController];
LABEL_17:
      long long v23 = v22;
      long long v24 = [v22 navigationItem];
      [(UINavigationController *)self _updateManualScrollEdgeAppearanceProgressForScrollView:v25 navigationItem:v24];

      v20 = v25;
    }
  }
LABEL_18:
}

- (CGSize)_navigationBarSizeForViewController:(id)a3 proposedHeight:(double)a4 allowRubberBandStretch:(BOOL)a5
{
  id v8 = a3;
  int v9 = [(UINavigationController *)self _navigationBarForNestedNavigationController];
  [(UINavigationController *)self _widthForLayout];
  double v11 = v10;
  double v12 = [v8 navigationItem];
  [v9 _layoutHeightsForNavigationItem:v12 fittingWidth:v11];
  double v14 = v13;
  double v16 = v15;

  if (v14 < a4) {
    double v14 = a4;
  }
  id v17 = [(UINavigationController *)self _nestedTopViewController];
  double v18 = v17;
  if (v17 == v8) {
    goto LABEL_6;
  }
  double v19 = [v17 navigationItem];
  v20 = [v19 _searchControllerIfAllowed];
  id v21 = [v20 _currentActiveChildViewController];

  if (!v21)
  {
    double v22 = v16;
    goto LABEL_15;
  }
  double v22 = v16;
  if (v21 == v8)
  {
LABEL_6:
    int isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets = _isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets(self, v8);
    if (isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets) {
      double v22 = v14;
    }
    else {
      double v22 = v16;
    }
    if (isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets && !a5)
    {
      if (v16 >= v14) {
        double v22 = v14;
      }
      else {
        double v22 = v16;
      }
    }
  }
LABEL_15:

  double v24 = v11;
  double v25 = v22;
  result.height = v25;
  result.width = v24;
  return result;
}

- (id)_navigationBarForNestedNavigationController
{
  uint64_t v2 = [(UINavigationController *)self _outermostNavigationController];
  int v3 = [v2 _existingNavigationBar];

  return v3;
}

- (id)_existingNavigationBar
{
  return self->_navigationBar;
}

- (UIViewController)bottomViewController
{
  int v3 = [(UIViewController *)self mutableChildViewControllers];
  if ([v3 count])
  {
    int v4 = [v3 firstObject];
    if ((*(void *)&self->_navigationControllerFlags & 0x3000000000000) != 0
      && ([(UINavigationController *)self disappearingViewController],
          double v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v4 == v5))
    {
      if ((unint64_t)[v3 count] < 2)
      {
        double v7 = 0;
        goto LABEL_6;
      }
      id v6 = [v3 objectAtIndexedSubscript:1];
    }
    else
    {
      id v6 = v4;
    }
    double v7 = v6;
LABEL_6:

    goto LABEL_8;
  }
  double v7 = 0;
LABEL_8:

  return (UIViewController *)v7;
}

- (id)_nestedTopViewController
{
  uint64_t v2 = [(UINavigationController *)self topViewController];
  if ([v2 _isNestedNavigationController])
  {
    uint64_t v3 = [v2 topViewController];

    uint64_t v2 = (void *)v3;
  }
  return v2;
}

- (UIViewController)topViewController
{
  uint64_t v2 = [(UIViewController *)self mutableChildViewControllers];
  uint64_t v3 = [v2 lastObject];

  return (UIViewController *)v3;
}

- (void)_updateAndObserveScrollView:(id)a3 viewController:(id)a4 forEdges:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = [(UINavigationController *)self _outermostNavigationController];

  if (v8 && v10 != self)
  {
    if (os_variant_has_internal_diagnostics())
    {
      CGFloat v28 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v28, OS_LOG_TYPE_FAULT, "Internal UIKit problem. A nested navigation controller is being asked to observe a scrollView.", buf, 2u);
      }
    }
    else
    {
      CGRect v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateAndObserveScrollView_viewController_forEdges____s_category)+ 8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CGFloat v29 = 0;
        _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "Internal UIKit problem. A nested navigation controller is being asked to observe a scrollView.", v29, 2u);
      }
    }
  }
  double v11 = [v9 navigationItem];
  [(UINavigationController *)self _updateScrollViewObservationFlagsForScrollView:v8 navigationItem:v11 forEdges:a5];

  if (v8)
  {
    BOOL v12 = [(UINavigationController *)self _navigationControllerShouldObserveScrollView];
    int v13 = [v8 _isScrollViewScrollObserver:self];
    if ((a5 & 1) == 0)
    {
      if ((a5 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_24;
    }
    if (v12)
    {
      uint64_t v16 = (*(void *)&self->_navigationControllerFlags >> 57) & 1;
      [v8 _setTopScrollIndicatorFollowsContentOffset:v16];
      if (v16)
      {
        BOOL v17 = [(UINavigationBar *)self->_navigationBar _scrollEdgeAppearanceHasChromelessBehavior];
        [v8 _setVerticalScrollIndicatorUsesAlternativeTopSafeAreaInset:v17];
        if (v17)
        {
          navigationBar = self->_navigationBar;
          double v19 = [(UINavigationController *)self _nestedTopViewController];
          v20 = [v19 navigationItem];
          [(UINavigationController *)self _widthForLayout];
          -[UINavigationBar _layoutHeightsForNavigationItem:fittingWidth:](navigationBar, "_layoutHeightsForNavigationItem:fittingWidth:", v20);
          double v22 = v21;

          [(UIView *)self->super._view safeAreaInsets];
          double v24 = v22 + v23;
        }
        else
        {
          double v24 = 0.0;
        }
        int v25 = 1;
LABEL_23:
        [v8 _setAlternativeVerticalScrollIndicatorTopSafeAreaInset:v24];
        objc_msgSend(v8, "_setShouldAdjustLayoutToCollapseTopSpacing:", v25 | v12 & -[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"));
        [v8 _setShouldAdjustLayoutToDrawTopSeparator:v12];
        if ((a5 & 4) == 0)
        {
LABEL_6:
          if (v12)
          {
LABEL_7:
            if ((v13 & 1) == 0) {
              [v8 _addScrollViewScrollObserver:self];
            }
            [(UINavigationController *)self _observeScrollViewDidScroll:v8 topLayoutType:[(UINavigationController *)self _topLayoutTypeForViewController:v9]];
            goto LABEL_29;
          }
          goto LABEL_27;
        }
LABEL_24:
        uint64_t v26 = [(UINavigationController *)self _existingActiveVisibleToolbar];
        if (!v26)
        {
          uint64_t v26 = [(UIViewController *)self _tabBarControllerEnforcingClass:1];
          [v26 _navigationController:self didUpdateAndObserveScrollView:v8 forEdges:a5];
        }

        if (v12) {
          goto LABEL_7;
        }
LABEL_27:
        if (v13) {
          [(UINavigationController *)self _stopObservingContentScrollView:v8];
        }
        goto LABEL_29;
      }
    }
    else
    {
      [v8 _setTopScrollIndicatorFollowsContentOffset:0];
    }
    [v8 _setVerticalScrollIndicatorUsesAlternativeTopSafeAreaInset:0];
    int v25 = 0;
    double v24 = 0.0;
    goto LABEL_23;
  }
  if (![(UINavigationController *)self _isNestedNavigationController])
  {
    uint64_t v14 = [(UINavigationController *)self _existingActiveVisibleToolbar];
    double v15 = (void *)v14;
    if ((a5 & 4) != 0 && v14) {
      [(UINavigationController *)self _updateBackgroundTransitionProgressForScrollView:0 toolbar:v14];
    }
  }
LABEL_29:
}

- (id)_existingActiveVisibleToolbar
{
  if ([(UINavigationController *)self isToolbarHidden]) {
    toolbar = 0;
  }
  else {
    toolbar = self->_toolbar;
  }
  int v4 = toolbar;
  if ([(UINavigationController *)self _allowNestedNavigationControllers])
  {
    double v5 = [(UINavigationController *)self topViewController];
    if ([v5 _isNavigationController])
    {
      if ([v5 isToolbarHidden])
      {
        uint64_t v6 = 0;
      }
      else
      {
        uint64_t v6 = [v5 _existingToolbar];
      }

      int v4 = (UIToolbar *)v6;
    }
  }
  return v4;
}

- (BOOL)isToolbarHidden
{
  return (*(void *)&self->_navigationControllerFlags & 2) == 0;
}

- (BOOL)_allowNestedNavigationControllers
{
  return (*(void *)&self->_navigationControllerFlags >> 41) & 1;
}

- (void)_updateScrollViewObservationFlagsForScrollView:(id)a3 navigationItem:(id)a4 forEdges:(unint64_t)a5
{
  char v5 = a5;
  id v18 = a3;
  id v8 = a4;
  if (v18
    && (![(UINavigationController *)self isNavigationBarHidden]
     || [(UINavigationController *)self _hasPotentiallyChromelessBottomBar])
    && ![(UINavigationController *)self _otherExpectedNavigationControllerObservesScrollView:v18])
  {
    if (v5)
    {
      int isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets = _isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets(self, v18);
      uint64_t v12 = 0x200000000000000;
      if (!isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets) {
        uint64_t v12 = 0;
      }
      *(void *)&self->_unint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFDFFFFFFFFFFFFFFLL | v12;
      BOOL v13 = [(UINavigationBar *)self->_navigationBar _forceScrollEdgeAppearance];
      uint64_t v14 = 0x400000000000000;
      if (!v13) {
        uint64_t v14 = 0;
      }
      *(void *)&self->_unint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFBFFFFFFFFFFFFFFLL | v14;
      if (v8 && [v8 _isManualScrollEdgeAppearanceEnabled])
      {
        [v8 _autoScrollEdgeTransitionDistance];
        BOOL v16 = v15 > 0.0;
      }
      else
      {
        BOOL v16 = 0;
      }
      *(void *)&self->_unint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xF7FFFFFFFFFFFFFFLL | ((unint64_t)v16 << 59);
    }
    else if ((v5 & 4) == 0)
    {
      goto LABEL_26;
    }
    if (_UIBarsApplyChromelessEverywhere()) {
      char v17 = [v8 _isManualScrollEdgeAppearanceEnabled] ^ 1;
    }
    else {
      char v17 = 0;
    }
    *(void *)&self->_unint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xEFFFFFFFFFFFFFFFLL | ((unint64_t)(v17 & 1) << 60);
    goto LABEL_26;
  }
  if (v5)
  {
    char v10 = *((unsigned char *)&self->_navigationControllerFlags + 8);
    unint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xF1FFFFFFFFFFFFFFLL;
    *(void *)&self->_unint64_t navigationControllerFlags = navigationControllerFlags;
  }
  else
  {
    if ((v5 & 4) == 0) {
      goto LABEL_26;
    }
    unint64_t navigationControllerFlags = (unint64_t)self->_navigationControllerFlags;
    char v10 = *((unsigned char *)&self->_navigationControllerFlags + 8);
  }
  *(void *)&self->_unint64_t navigationControllerFlags = navigationControllerFlags & 0xEFFFFFFFFFFFFFFFLL;
  *((unsigned char *)&self->_navigationControllerFlags + 8) = v10;
LABEL_26:
}

- (id)navigationItem
{
  if ([(UINavigationController *)self _isNestedNavigationController]
    && ([(UINavigationController *)self bottomViewController],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v4 = v3;
    char v5 = [v3 navigationItem];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UINavigationController;
    char v5 = [(UIViewController *)&v7 navigationItem];
  }
  return v5;
}

- (void)_updateBackgroundTransitionProgressForScrollView:(id)a3 toolbar:(id)a4 isNavigationTransitionUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  p_uint64_t navigationControllerFlags = &self->_navigationControllerFlags;
  uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  if ((navigationControllerFlags & 0x8000000000000000) == 0)
  {
    if ([(id)UIApp _isActivating]) {
      goto LABEL_27;
    }
    uint64_t v12 = [(UINavigationController *)self _window];
    BOOL v13 = [v12 windowScene];
    uint64_t v14 = [v13 activationState];

    if (v14 == -1) {
      goto LABEL_27;
    }
    p_uint64_t navigationControllerFlags = &self->_navigationControllerFlags;
    uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  }
  char v15 = *((unsigned char *)p_navigationControllerFlags + 8);
  if ((navigationControllerFlags & 0x2000000000000000) == 0 || v5)
  {
    BOOL v16 = (navigationControllerFlags & 0x2000000000000000) == 0;
    unint64_t v17 = navigationControllerFlags | 0x8000000000000000;
    int v18 = !v5;
    if (v16) {
      int v18 = 1;
    }
    *((unsigned char *)&self->_navigationControllerFlags + 8) = v15;
    if (v18) {
      unint64_t v19 = v17;
    }
    else {
      unint64_t v19 = v17 & 0xDFFFFFFFFFFFFFFFLL;
    }
    *(void *)&self->_uint64_t navigationControllerFlags = v19;
    double v30 = 0.0;
    if (_UIBarsGetBottomBarBackgroundTransitionProgressForScrollView(v8, v9, &v30))
    {
      if (!v5) {
        goto LABEL_26;
      }
      [v9 _backgroundTransitionProgress];
      if (v20 == v30
        || !+[UIView _isInAnimationBlockWithAnimationsEnabled])
      {
        goto LABEL_26;
      }
      if ([v9 isMinibar])
      {
        double v21 = [v9 compactScrollEdgeAppearance];
        double v22 = v21;
        if (v21)
        {
          id v23 = v21;
        }
        else
        {
          id v23 = [v9 scrollEdgeAppearance];
        }
        double v24 = v23;
      }
      else
      {
        double v24 = [v9 scrollEdgeAppearance];
      }
      if (!v24 || (int v25 = [v24 _hasTransparentBackground], v24, v25))
      {
        double v26 = v30;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __112__UINavigationController__updateBackgroundTransitionProgressForScrollView_toolbar_isNavigationTransitionUpdate___block_invoke;
        v27[3] = &unk_1E52D9CD0;
        id v28 = v9;
        double v29 = v26;
        _UIBarsTwoPartCrossfadeTransitionProgress(v27, 0, v26);
      }
      else
      {
LABEL_26:
        [v9 _setBackgroundTransitionProgress:v30];
      }
    }
  }
LABEL_27:
}

- (void)_updateBackgroundTransitionProgressForScrollView:(id)a3 toolbar:(id)a4
{
}

- (void)_updateManualScrollEdgeAppearanceProgressForScrollView:(id)a3 navigationItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 contentOffset];
  double v9 = v8;
  [v7 adjustedContentInset];
  double v11 = v10;

  double v12 = v9 + v11;
  double v13 = 0.0;
  double v14 = 0.0;
  if ((*(void *)&self->_navigationControllerFlags & 0x800000000000000) != 0) {
    objc_msgSend(v6, "_autoScrollEdgeTransitionDistance", 0.0);
  }
  if (v14 == 0.0) {
    double v14 = 4.0;
  }
  if (v12 >= 0.0)
  {
    double v13 = 1.0;
    if (v12 < v14) {
      double v13 = v12 / v14;
    }
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__UINavigationController__updateManualScrollEdgeAppearanceProgressForScrollView_navigationItem___block_invoke;
  v16[3] = &unk_1E52D9CD0;
  id v17 = v6;
  double v18 = v13;
  id v15 = v6;
  +[UIView performWithoutAnimation:v16];
}

- (BOOL)_navigationControllerShouldObserveScrollView
{
  return (*(void *)&self->_navigationControllerFlags & 0x1E00000000000000) != 0;
}

- (BOOL)_otherExpectedNavigationControllerObservesScrollView:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = [v4 _viewControllerForAncestor];
    id v7 = [v6 navigationController];
    double v8 = [v7 _outermostNavigationController];

    char v9 = 0;
    if (v8 && v8 != self) {
      char v9 = [v5 _isScrollViewScrollObserver:v8];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (int64_t)_topLayoutTypeForViewController:(id)a3
{
  int64_t v4 = 1;
  BOOL v5 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, a3, 1, 0);
  [v5 contentOffset];
  if (v6 == 0.0)
  {
    if ([(UINavigationController *)self _isPushing])
    {
      int64_t v4 = 2;
    }
    else if ([(UINavigationController *)self _isPopping])
    {
      int64_t v4 = 3;
    }
    else
    {
      int64_t v4 = 0;
    }
  }

  return v4;
}

- (BOOL)_canHostRefreshControlOwnedByScrollView:(id)a3
{
  id v4 = a3;
  BOOL v7 = (!_isNestedNavigationControllerFullyInstalledIntoContainingNavigationController(self)
     || ([(UINavigationController *)self _outermostNavigationController],
         BOOL v5 = objc_claimAutoreleasedReturnValue(),
         char v6 = [v5 _canHostRefreshControlOwnedByScrollView:v4],
         v5,
         (v6 & 1) == 0))
    && +[_UINavigationControllerRefreshControlHost canHostRefreshControlOwnedByScrollView:v4 inNavigationController:self];

  return v7;
}

- (void)_updatePalettesWithBlock:(id)a3
{
  id v4 = (void (**)(void, _UINavigationControllerPalette *))a3;
  topPalette = self->_topPalette;
  if (topPalette)
  {
    BOOL v7 = v4;
    BOOL v6 = [(_UINavigationControllerPalette *)topPalette _shouldUpdateBackground];
    id v4 = v7;
    if (v6)
    {
      v7[2](v7, self->_topPalette);
      id v4 = v7;
    }
  }
}

- (void)transitionConductor:(id)a3 beginPinningInputViewsForTransitionFromViewController:(id)a4 toViewController:(id)a5 forTransitionType:(int)a6
{
  id v30 = a4;
  id v9 = a5;
  double v10 = [(UIViewController *)self _focusBehavior];
  if ([v10 syncsFocusAndResponder])
  {
    double v11 = [(UIViewController *)self _focusSystem];
    double v12 = [v11 focusedItem];

    if (v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  double v13 = [(UIViewController *)self presentedViewController];
  if (v13) {
    goto LABEL_6;
  }
  if (![v9 _containedInAbsoluteResponderChain]) {
    goto LABEL_12;
  }
  if (([v9 _containsFirstResponder] & 1) == 0
    && ![(UIResponder *)self _disableAutomaticKeyboardBehavior])
  {
    double v13 = -[UIViewController _keyboardSceneDelegate](self);
    BOOL v15 = [(UINavigationController *)self _isViewControllerFullWidth];
    BOOL v16 = (a6 - 17) < 0xFFFFFFFE && v15;
    if (v16) {
      [v13 _setIgnoresPinning:1 allowImmediateReload:0];
    }
    id v17 = [(UIViewController *)self parentViewController];
    char v18 = [v17 _isHostedRootViewController];

    if (v30)
    {
      char v19 = 1;
    }
    else
    {
      CGRect v27 = [(UIViewController *)self presentingViewController];
      if (v27) {
        char v18 = 1;
      }

      if (v18)
      {
        char v19 = 1;
        char v21 = 1;
        goto LABEL_23;
      }
      [v13 _beginDisablingAnimations];
      char v19 = 0;
    }
    double v20 = [(UINavigationController *)self _keyboardAnimationStyle];
    [v13 pushAnimationStyle:v20];

    char v21 = 0;
LABEL_23:
    if (([v9 becomeFirstResponder] & 1) == 0)
    {
      double v22 = [(UINavigationController *)self _keyboardAnimationStyle];
      [v13 pushAnimationStyle:v22];

      id v23 = [v13 responder];
      int v24 = [v30 _shouldAttemptToPreserveInputViewsForResponder:v23];

      if (v24)
      {
        int v25 = [MEMORY[0x1E4F29238] valueWithPointer:v30];
        [v13 _preserveInputViewsWithId:v25 animated:1];

        double v26 = [v13 responder];
        [v26 resignFirstResponder];
      }
      else
      {
        double v26 = [v13 responder];
        [v26 _clearBecomeFirstResponderWhenCapable];
      }

      [v13 popAnimationStyle];
      id v28 = [v13 responder];

      if (!v28)
      {
        double v29 = [MEMORY[0x1E4F29238] valueWithPointer:v9];
        [v13 _restoreInputViewsWithId:v29 animated:1];
      }
    }
    if (v21)
    {
      if (v19) {
        goto LABEL_35;
      }
    }
    else
    {
      [v13 popAnimationStyle];
      if (v19)
      {
LABEL_35:
        if (!v16) {
          goto LABEL_6;
        }
LABEL_39:
        [v13 _setIgnoresPinning:0 allowImmediateReload:0];
        goto LABEL_6;
      }
    }
    [v13 _endDisablingAnimations];
    if (!v16) {
      goto LABEL_6;
    }
    goto LABEL_39;
  }
  if ([v30 _containsFirstResponder])
  {
    double v13 = -[UIViewController _keyboardSceneDelegate](self);
    double v14 = [v13 responder];
    [v14 resignFirstResponder];

LABEL_6:
  }
LABEL_12:
}

- (BOOL)_isViewControllerFullWidth
{
  uint64_t v3 = [(UIViewController *)self view];
  [v3 frame];
  objc_msgSend(v3, "convertRect:toView:", 0);
  double v5 = v4;
  double v7 = v6;
  double v8 = [(UINavigationController *)self _window];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  BOOL v13 = v7 > v12 * 0.5 && v10 == v5;
  return v13;
}

- (BOOL)becomeFirstResponder
{
  uint64_t v3 = [(UINavigationController *)self topViewController];
  if (v3
    && (double v4 = (void *)v3,
        [(UINavigationController *)self topViewController],
        double v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 canBecomeFirstResponder],
        v5,
        v4,
        v6))
  {
    double v7 = [(UINavigationController *)self topViewController];
    char v8 = [v7 becomeFirstResponder];

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UINavigationController;
    return [(UIResponder *)&v10 becomeFirstResponder];
  }
}

- (void)__viewWillLayoutSubviews
{
  if (![(UIViewController *)self _freezeLayoutForOrientationChangeOnDismissal])
  {
    uint64_t v3 = [(UINavigationController *)self topViewController];
    int isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets = _isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets(self, v3);

    [(_UIViewControllerTransitionConductor *)self->_transitionConductor startDeferredTransitionIfNeeded];
    if (![(UINavigationController *)self _isNestedNavigationController]
      && [(UINavigationController *)self _isNavigationBarVisible]
      && ![(UINavigationController *)self _isPushingOrPopping])
    {
      [(UINavigationController *)self _positionNavigationBarHidden:0];
    }
    double v5 = [(UINavigationController *)self topViewController];
    int v6 = _isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets(self, v5);

    if ((*(void *)&self->_navigationControllerFlags & 4) == 0
      || [(UINavigationController *)self _isPushingOrPopping]
      || isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets != v6)
    {
      double v7 = [(UINavigationController *)self topViewController];
      if ([v7 _isNestedNavigationController]
        && [v7 _isPushingOrPopping])
      {
        char v8 = [v7 _existingView];
        [v8 setNeedsLayout];
      }
      [(UINavigationController *)self _computeAndApplyScrollContentInsetDeltaForViewController:v7];
    }
    if (objc_opt_respondsToSelector())
    {
      visualStyle = self->_visualStyle;
      containerView = self->_containerView;
      [(_UINavigationControllerVisualStyle *)visualStyle containerViewWillLayoutSubviews:containerView];
    }
  }
}

void __105__UINavigationController__repositionPaletteWithNavigationBarHidden_duration_shouldUpdateNavigationItems___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    double v2 = 0.0;
    if ([*(id *)(a1 + 32) _viewControllerUnderlapsStatusBar])
    {
      [*(id *)(a1 + 32) _statusBarHeightAdjustmentForCurrentOrientation];
      double v2 = v3;
    }
    [*(id *)(a1 + 32) _setNavigationBarHidesCompletelyOffscreen:1];
    [*(id *)(a1 + 32) _positionNavigationBarHidden:1 edge:1 initialOffset:*(double *)(a1 + 64)];
    [*(id *)(a1 + 32) _positionPaletteHidden:0 edge:1 initialOffset:v2];
    [*(id *)(*(void *)(a1 + 32) + 1088) _setPalettePinningBarHidden:1];
  }
  else
  {
    if (*(unsigned char *)(a1 + 73) && ([*(id *)(a1 + 32) _hasNestedNavigationController] & 1) == 0)
    {
      double v4 = [*(id *)(a1 + 32) navigationBar];
      [v4 setLocked:0];

      double v5 = [*(id *)(a1 + 32) _navigationItems];
      int v6 = [*(id *)(a1 + 32) navigationBar];
      [v6 setItems:v5];

      double v7 = [*(id *)(a1 + 32) navigationBar];
      [v7 setLocked:1];
    }
    char v8 = *(void **)(a1 + 32);
    double v9 = [v8 _viewControllerForObservableScrollView];
    objc_super v10 = [*(id *)(a1 + 32) _topViewControllerObservableScrollViewForEdge:1];
    [v8 _updateTopViewFramesToMatchScrollOffsetInViewController:v9 contentScrollView:v10 topLayoutType:0];

    [*(id *)(a1 + 32) _setNavigationBarHidesCompletelyOffscreen:0];
    [*(id *)(a1 + 32) _positionNavigationBarHidden:0 edge:1 initialOffset:0.0];
    [*(id *)(a1 + 32) _positionPaletteHidden:0 edge:1 initialOffset:0.0];
  }
  if ([*(id *)(a1 + 32) _searchHidNavigationBar])
  {
    double v11 = [*(id *)(a1 + 32) navigationBar];
    [v11 _animateForSearchPresentation:*(unsigned __int8 *)(a1 + 72)];
  }
  [*(id *)(a1 + 32) _layoutTopViewController];
  double v12 = *(void **)(a1 + 32);
  id v13 = [v12 topViewController];
  [v12 _computeAndApplyScrollContentInsetDeltaForViewController:v13];
}

- (void)_positionNavigationBarHidden:(BOOL)a3 edge:(unint64_t)a4 initialOffset:(double)a5
{
  BOOL v7 = a3;
  containerView = self->_containerView;
  if (containerView)
  {
    [(UIView *)containerView bounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
  }
  else
  {
    CGFloat v11 = *MEMORY[0x1E4F1DB28];
    CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  v43.origin.x = v11;
  v43.origin.y = v13;
  v43.size.width = v15;
  v43.size.height = v17;
  double MidX = CGRectGetMidX(v43);
  v44.origin.x = v11;
  v44.origin.y = v13;
  v44.size.width = v15;
  v44.size.height = v17;
  double MinY = CGRectGetMinY(v44);
  double v20 = [(UINavigationController *)self navigationBar];
  [v20 bounds];
  double v22 = v21;
  double v24 = v23;
  [(UINavigationController *)self _widthForLayout];
  double v26 = v25;
  CGRect v27 = [(UINavigationController *)self _nestedTopViewController];
  id v28 = [v20 topItem];
  [(UINavigationController *)self _preferredHeightForHidingNavigationBarForViewController:v27 topItem:v28];
  double v30 = v29;

  objc_msgSend(v20, "setBounds:", v22, v24, v26, v30);
  topPalette = self->_topPalette;
  if (topPalette)
  {
    if ([(_UINavigationControllerPalette *)topPalette isAttached])
    {
      if ([(_UINavigationControllerPalette *)self->_topPalette isVisibleWhenPinningBarIsHidden])
      {
        if (*(void *)&self->_navigationControllerFlags)
        {
          BOOL v32 = [(_UINavigationControllerPalette *)self->_topPalette _isPalettePinningBarHidden];
          if (v7 && v32 && (a4 == 4 || a4 == 1))
          {
            [v20 frame];
            objc_msgSend(v20, "setFrame:", 0.0, -v33);
            goto LABEL_28;
          }
        }
      }
    }
    id v34 = self->_topPalette;
    double v35 = v30 * 0.5 + a5;
    if (v34 && (a4 == 4 || a4 == 1) && v7 && [(_UINavigationControllerPalette *)v34 isAttached])
    {
      [(UIView *)self->_topPalette bounds];
      double v37 = v36;
      unint64_t v38 = [(_UINavigationControllerPalette *)self->_topPalette boundaryEdge];
      double v39 = -v37;
      if (v38 == 5) {
        double v39 = v37;
      }
      double v35 = v35 + v39;
    }
  }
  else
  {
    double v35 = v30 * 0.5 + a5;
  }
  -[UINavigationController _positionNavigationBar:hidden:edge:center:offset:](self, "_positionNavigationBar:hidden:edge:center:offset:", v20, v7, a4, MidX, MinY, v35);
  if (dyld_program_sdk_at_least())
  {
    v40 = [v20 window];

    if (v40) {
      [v20 layoutBelowIfNeeded];
    }
  }
  else
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __74__UINavigationController__positionNavigationBarHidden_edge_initialOffset___block_invoke;
    v41[3] = &unk_1E52D9F70;
    id v42 = v20;
    +[UIView performWithoutAnimation:v41];
  }
  if (objc_opt_respondsToSelector()) {
    [(_UINavigationControllerVisualStyle *)self->_visualStyle navigationBarFrameChanged];
  }
LABEL_28:
}

- (void)_positionNavigationBar:(id)a3 hidden:(BOOL)a4 edge:(unint64_t)a5 center:(CGPoint)a6 offset:(double)a7
{
  double y = a6.y;
  double x = a6.x;
  BOOL v11 = a4;
  id v18 = a3;
  -[UINavigationController _computeTopBarCenter:hidden:edge:center:offset:](self, "_computeTopBarCenter:hidden:edge:center:offset:", x, y, a7);
  double v14 = v13;
  double v16 = v15;
  if ((*(void *)&self->_navigationControllerFlags & 0x100000000) != 0
    && v11
    && (a5 == 4 || a5 == 1)
    && ![(UINavigationController *)self _useStandardStatusBarHeight]
    && [(UINavigationController *)self _viewControllerUnderlapsStatusBar])
  {
    [(UINavigationController *)self _statusBarHeightAdjustmentForCurrentOrientation];
    double v16 = v16 - v17;
  }
  objc_msgSend(v18, "setCenter:", v14, v16);
}

- (CGPoint)_computeTopBarCenter:(id)a3 hidden:(BOOL)a4 edge:(unint64_t)a5 center:(CGPoint)a6 offset:(double)a7
{
  double y = a6.y;
  double x = a6.x;
  BOOL v11 = a4;
  id v13 = a3;
  BOOL v14 = (*(void *)&self->_navigationControllerFlags & 0x2000) == 0 && v11;
  if ([(UINavigationController *)self _searchHidNavigationBar])
  {
    int v15 = 1;
  }
  else
  {
    double v16 = [(UINavigationController *)self topViewController];
    double v17 = [v16 searchDisplayController];
    int v15 = [v17 hidNavigationBar];
  }
  double v18 = y + a7;
  int v19 = !v14;
  if (a5 > 1) {
    int v19 = 1;
  }
  int v20 = v19 | v15;
  if (self->__positionBarsExclusivelyWithSafeArea)
  {
    if ((v20 & 1) != 0 || self->__preferredNavigationBarPosition == 3)
    {
      double v21 = self;
      double v22 = v21;
      if (self->__positionBarsExclusivelyWithSafeArea
        && ([(UIViewController *)v21 _existingView],
            double v23 = objc_claimAutoreleasedReturnValue(),
            int v24 = [v23 _usesMinimumSafeAreas],
            v23,
            v24))
      {
        double v25 = [(UIViewController *)v22 _existingView];
        [v25 _minimumSafeAreaInsets];
        double v27 = v26;
      }
      else
      {
        [(UIViewController *)v22 _contentOverlayInsets];
        double v27 = v30;
      }

      double v18 = v18 + v27;
    }
    CGFloat v31 = [(UINavigationController *)self navigationBar];
    BOOL v32 = [v31 traitCollection];
    uint64_t v33 = [v32 userInterfaceIdiom];

    if (v33 == 3)
    {
      [(UIViewController *)self _contentOverlayInsets];
      double v35 = v34 * 0.5;
      [(UIViewController *)self _contentOverlayInsets];
      double x = x + v35 - v36 * 0.5;
    }
  }
  else
  {
    int64_t preferredNavigationBarPosition = self->__preferredNavigationBarPosition;
    if (preferredNavigationBarPosition == 3)
    {
      double v37 = [(UIViewController *)self _existingView];
      unint64_t v38 = [v37 window];

      double v39 = __UIStatusBarManagerForWindow(v38);
      v40 = [v38 windowScene];
      objc_msgSend(v39, "defaultStatusBarHeightInOrientation:", objc_msgSend(v40, "interfaceOrientation"));
      double v42 = v41;

      double v18 = v18 + v42;
    }
    else if (!preferredNavigationBarPosition {
           && ([(UINavigationController *)self _viewControllerUnderlapsStatusBar] & v20) == 1)
    }
    {
      if ([(UINavigationController *)self _useStandardStatusBarHeight]) {
        double statusBarHeightForHideShow = self->_statusBarHeightForHideShow;
      }
      else {
        [(UINavigationController *)self _statusBarHeightAdjustmentForCurrentOrientation];
      }
      double v18 = v18 + statusBarHeightForHideShow;
    }
  }
  if ([(_UINavigationControllerPalette *)self->_topPalette boundaryEdge] == 5)
  {
    [(UIView *)self->_topPalette frame];
    double v18 = v18 + v43;
  }
  char v44 = !v14;
  if (!a5) {
    char v44 = 1;
  }
  if ((v44 & 1) == 0)
  {
    [v13 bounds];
    double builtinTransitionGap = 0.0;
    if (self->_builtinTransitionStyle == 1) {
      double builtinTransitionGap = self->_builtinTransitionGap;
    }
    if (a5 == 8)
    {
      double x = x + v45 + builtinTransitionGap;
    }
    else if (a5 == 2)
    {
      double x = x - (v45 + builtinTransitionGap);
    }
    else
    {
      double v18 = v18 - v46;
    }
  }

  double v48 = x;
  double v49 = v18;
  result.double y = v49;
  result.double x = v48;
  return result;
}

- (BOOL)_searchHidNavigationBar
{
  double v3 = [(UINavigationController *)self _outermostNavigationController];
  double v4 = v3;
  if (v3 == self) {
    uint64_t v5 = (*(void *)&self->_navigationControllerFlags >> 47) & 1;
  }
  else {
    LOBYTE(v5) = [(UINavigationController *)v3 _searchHidNavigationBar];
  }

  return v5;
}

- (double)_scrollViewTopContentInsetForViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UINavigationController *)self _outermostNavigationController];
  if ([v5 _hasTranslucentNavigationBarIncludingViewController:v4]) {
    char v6 = 1;
  }
  else {
    char v6 = [v4 extendedLayoutIncludesOpaqueBars];
  }

  BOOL v7 = [(UINavigationController *)self _outermostNavigationController];
  int v8 = [v7 _isNavigationBarVisible];

  -[UINavigationController _calculateTopLayoutInfoForViewController:](self, "_calculateTopLayoutInfoForViewController:", v4, 0, 0);
  int v9 = v8 ^ 1;
  if ((v6 & 1) != 0 || v9)
  {
    double v10 = [v4 searchDisplayController];
    [v10 hidNavigationBar];

    BOOL v11 = [(UINavigationController *)self _window];
    if (![(id)UIApp _appAdoptsUISceneLifecycle] || v11)
    {
      double v12 = __UIStatusBarManagerForWindow(v11);
      [v12 isStatusBarHidden];
    }
  }

  return 0.0;
}

- (void)_updateTopViewFramesForViewController:(id)a3 isCancelledTransition:(BOOL)a4 isOrientationChange:(BOOL)a5
{
  id v15 = a3;
  int v8 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v15, 1, 0);
  int v9 = self;
  double v10 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(v9, v15, 1, 0);
  if (a4)
  {
    uint64_t v11 = 5;
  }
  else if ([(UINavigationController *)v9 _isPushing])
  {
    uint64_t v11 = 2;
  }
  else
  {
    BOOL v12 = [(UINavigationController *)v9 _isPopping];
    uint64_t v13 = 3;
    if (!v12) {
      uint64_t v13 = 4;
    }
    BOOL v14 = v10 != 0;
    if (a5) {
      BOOL v14 = v13;
    }
    if (v12) {
      uint64_t v11 = v13;
    }
    else {
      uint64_t v11 = v14;
    }
  }

  [(UINavigationController *)v9 _updateTopViewFramesToMatchScrollOffsetInViewController:v15 contentScrollView:v8 topLayoutType:v11];
}

- (void)_updateTopViewFramesToMatchScrollOffsetInViewController:(id)a3 contentScrollView:(id)a4 topLayoutType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(UINavigationController *)self _canUpdateTopViewFramesToMatchScrollView])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    [(UINavigationController *)self _calculateTopViewFramesForLayoutWithViewController:v8 contentScrollView:v9 navBarFrame:&v17 topPaletteFrame:&v15 topLayoutType:a5];
    [v9 setProgrammaticScrollEnabled:!self->_interactiveScrollActive];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    long long v11 = v17;
    long long v12 = v18;
    long long v13 = v15;
    long long v14 = v16;
    v10[2] = __114__UINavigationController__updateTopViewFramesToMatchScrollOffsetInViewController_contentScrollView_topLayoutType___block_invoke;
    v10[3] = &unk_1E52DD590;
    v10[4] = self;
    [(UINavigationController *)self _performTopViewGeometryUpdates:v10];
    [v9 setProgrammaticScrollEnabled:1];
  }
}

- (BOOL)_canUpdateTopViewFramesToMatchScrollView
{
  return self->_updateTopViewFramesToMatchScrollOffsetDisabledCount <= 0
      && self->_navigationBar
      && (*(void *)&self->_navigationControllerFlags & 1) == 0;
}

- ($512FAC6031DC579ED3B9B436D64463DA)_calculateTopLayoutInfoForViewController:(SEL)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v33 = 0;
  BOOL v7 = [(UINavigationController *)self _shouldNavigationBarInsetViewController:v6 orOverlayContent:&v33];
  char v8 = [v6 edgesForExtendedLayout];
  id v9 = self;
  id v10 = v6;
  if ([(UINavigationController *)v9 _isPushing])
  {
    uint64_t v11 = 2;
  }
  else if ([(UINavigationController *)v9 _isPopping])
  {
    uint64_t v11 = 3;
  }
  else
  {
    uint64_t v11 = 0;
  }
  long long v12 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(v9, v10, 1, 0);
  if (qword_1EB25A910 != -1) {
    dispatch_once(&qword_1EB25A910, &__block_literal_global_1748);
  }
  BOOL v13 = v8 & 1;
  if (byte_1EB25A81B)
  {
    if (v11 == 3)
    {
      unint64_t computingNavigationBarHeightWithRevealPresentationIterations = v9->_computingNavigationBarHeightWithRevealPresentationIterations;
      if (computingNavigationBarHeightWithRevealPresentationIterations < 0x65)
      {
        v9->_unint64_t computingNavigationBarHeightWithRevealPresentationIterations = computingNavigationBarHeightWithRevealPresentationIterations
                                                                          + 1;
        uint64_t v11 = 3;
      }
      else
      {
        if (os_variant_has_internal_diagnostics())
        {
          BOOL v32 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v9;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v10;
            _os_log_fault_impl(&dword_1853B0000, v32, OS_LOG_TYPE_FAULT, "Breaking out of suspected layout loop while popping. self=%@ vc=%@", buf, 0x16u);
          }
        }
        else
        {
          long long v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25A918) + 8);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v9;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v10;
            _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Breaking out of suspected layout loop while popping. self=%@ vc=%@", buf, 0x16u);
          }
        }
        uint64_t v11 = 0;
      }
    }
    else
    {
      v9->_unint64_t computingNavigationBarHeightWithRevealPresentationIterations = 0;
    }
  }
  memset(buf, 0, 32);
  [(UINavigationController *)v9 _calculateTopViewFramesForLayoutWithViewController:v10 contentScrollView:v12 navBarFrame:buf topPaletteFrame:0 topLayoutType:v11];
  double v16 = *(double *)&buf[24];

  topPalette = v9->_topPalette;
  double v18 = 0.0;
  if (topPalette && [(_UINavigationControllerPalette *)topPalette isAttached])
  {
    [(_UINavigationControllerPalette *)v9->_topPalette preferredContentInsets];
    if (v19 == 0.0)
    {
      [(UIView *)v9->_topPalette frame];
      double v21 = v20;
    }
    else
    {
      double v21 = v19;
    }
    BOOL v22 = 1;
  }
  else
  {
    BOOL v22 = 0;
    double v21 = 0.0;
  }
  if (v7) {
    double v18 = v16 + 0.0;
  }
  if (v13)
  {
    int v24 = ![(UINavigationController *)v9 _isNavigationBarVisible];
    if (v33) {
      int v23 = 1;
    }
    else {
      int v23 = v24;
    }
  }
  else
  {
    int v23 = 0;
  }
  if ([(UINavigationController *)v9 _isNavigationBarVisible])
  {
    uint64_t v25 = (*(void *)&v9->_navigationControllerFlags >> 13) & 1;
    if (!v22)
    {
LABEL_33:
      double v26 = v18;
      goto LABEL_41;
    }
  }
  else
  {
    LODWORD(v25) = 1;
    if (!v22) {
      goto LABEL_33;
    }
  }
  if (v7
    || (double v26 = 0.0, v25)
    && [(_UINavigationControllerPalette *)v9->_topPalette isVisibleWhenPinningBarIsHidden])
  {
    double v27 = -0.0;
    if (!v23) {
      double v27 = v21;
    }
    double v26 = v18 + v27;
  }
LABEL_41:
  BOOL v28 = v33;
  double v29 = -0.0;
  if (v33) {
    double v29 = v16;
  }
  double v30 = v21 + v29;
  if (v7) {
    double v30 = 0.0;
  }
  retstr->var0 = v30;
  retstr->var1 = v26;
  retstr->var2 = v16;
  retstr->var3 = v21;
  retstr->var4 = v22;
  retstr->var5 = v13;
  retstr->var6 = v7;
  retstr->var7 = v28;

  return result;
}

- (BOOL)_isPopping
{
  double v3 = [(UINavigationBar *)self->_navigationBar _stack];
  char v4 = [v3 isPopping];

  return (v4 & 1) != 0
      || [(UINavigationController *)self _isTransitioning]
      && [(UINavigationController *)self lastOperation] == 2;
}

- (BOOL)_isPushing
{
  double v3 = [(UINavigationBar *)self->_navigationBar _stack];
  char v4 = [v3 isPushing];

  if (v4)
  {
    LOBYTE(v5) = 1;
  }
  else if (![(UINavigationController *)self _isTransitioning] {
         || (int64_t v5 = [(UINavigationController *)self lastOperation], v5 != 1))
  }
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)_isTransitioning
{
  return (*(void *)&self->_navigationControllerFlags >> 2) & 1;
}

- (void)_calculateTopViewFramesForLayoutWithViewController:(id)a3 contentScrollView:(id)a4 navBarFrame:(CGRect *)a5 topPaletteFrame:(CGRect *)a6 topLayoutType:(int64_t)a7
{
  id v91 = a3;
  id v13 = a4;
  if (!a5)
  {
    v86 = [MEMORY[0x1E4F28B00] currentHandler];
    [v86 handleFailureInMethod:a2, self, @"UINavigationController.m", 6550, @"Invalid parameter not satisfying: %@", @"oNavBarFrame != NULL" object file lineNumber description];
  }
  if (!v13) {
    a7 = 0;
  }
  if ((unint64_t)(a7 - 2) < 3)
  {
    [(UINavigationController *)self _calculateTopViewFramesFromLayoutHeightsWithViewController:v91 contentScrollView:v13 preservingContentInset:(a7 & 0xFFFFFFFFFFFFFFFELL) == 2 respectFullExtension:a7 == 3 gettingNavBarFrame:a5 topPaletteFrame:a6];
    if (a7 != 4) {
      goto LABEL_57;
    }
LABEL_11:
    id v14 = v91;
    if ([v14 _isNestedNavigationController])
    {
      uint64_t v15 = [v14 topViewController];

      id v14 = (id)v15;
    }
    double v16 = [v14 navigationItem];
    [(UINavigationController *)self _intrinsicNavigationBarHeightRangeForNavItem:v16];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    int v23 = self;
    id v24 = v14;
    id v25 = v13;
    if (v24)
    {
      if (v13)
      {
LABEL_15:
        [(UINavigationController *)v23 _topPalettePreferredLayoutHeightForVisibilityStateIfDisplayedForViewController:v24];
        double v27 = v26;
        [(UIView *)v23->_navigationBar frame];
        double v29 = v28;
        topPalette = v23->_topPalette;
        if (topPalette)
        {
          [(UIView *)topPalette frame];
          double v32 = v31;
        }
        else
        {
          double v32 = 0.0;
        }
        double v43 = v23;
        char v44 = v43;
        if (v43->__positionBarsExclusivelyWithSafeArea
          && ([(UIViewController *)v43 _existingView],
              double v45 = objc_claimAutoreleasedReturnValue(),
              int v46 = [v45 _usesMinimumSafeAreas],
              v45,
              v46))
        {
          v47 = [(UIViewController *)v44 _existingView];
          [v47 _minimumSafeAreaInsets];
          double v49 = v48;
        }
        else
        {
          [(UIViewController *)v44 _contentOverlayInsets];
          double v49 = v50;
        }
        double v51 = v22 + v27;

        [v25 adjustedContentInset];
        if (v49 >= v52) {
          double v49 = v52;
        }
        if ((_insetsOfTopViewControllerScrollViewAutomaticallyAdjustedForLargeTitleView(v24) & 1) != 0
          || ![v25 _isScrollingToTop])
        {
          BOOL v54 = [(UINavigationController *)v44 _interactiveScrollActive];
          if (v13) {
            int v55 = [v25 _hasContentForBarInteractions];
          }
          else {
            int v55 = 0;
          }
          if ((v54 | v55) == 1)
          {
            double v56 = v29 + v32;
            double v57 = _possibleTopViewsHeightBasedOnContentOffsetForScrollView(v44, v25);
            [v25 contentInset];
            double v59 = v58;
            [v25 _systemContentInset];
            double v61 = v57 - (v59 + v60 - v49);
            if (v51 >= v56) {
              double v62 = v56;
            }
            else {
              double v62 = v51;
            }
            double v51 = v62 + v61;
          }
        }
        else
        {
          [v25 _contentOffsetOrDeferredContentOffset];
          double v51 = fmax(v51 - v53, 0.0);
        }

        v63 = v23->_topPalette;
        if (v63)
        {
          [(UIView *)v63 frame];
          double v65 = v64;
        }
        else
        {
          double v65 = 0.0;
        }
        double v66 = v51 - v65;
        if (v44->_interactiveScrollActive || v66 <= v18)
        {
          double v22 = v51 - v65;
        }
        else if (v66 < v22)
        {
          if (v66 >= v20) {
            double v22 = v51 - v65;
          }
          else {
            double v22 = v20;
          }
        }
        [(UINavigationController *)v44 _navigationBarSizeForViewController:v24 proposedHeight:[(UINavigationBar *)v23->_navigationBar _hasFixedMaximumHeight] ^ 1 allowRubberBandStretch:v22];
        CGFloat v68 = v67;
        [(UINavigationController *)v44 _widthForLayout];
        CGFloat v70 = v69;
        [(UIView *)v23->_navigationBar frame];
        CGFloat v72 = v71;
        CGFloat v74 = v73;
        if (v44->__positionBarsExclusivelyWithSafeArea)
        {
          v75 = [(UINavigationController *)v44 navigationBar];
          v76 = [v75 traitCollection];
          uint64_t v77 = [v76 userInterfaceIdiom];

          if (v77 == 3)
          {
            [(UIViewController *)v44 _contentOverlayInsets];
            CGFloat v72 = v78;
          }
        }
        if (a6)
        {
          v79 = v23->_topPalette;
          if (v79)
          {
            [(UIView *)v79 frame];
            CGFloat v81 = v80;
            CGFloat v83 = v82;
            v93.origin.double x = v72;
            v93.origin.double y = v74;
            v93.size.width = v70;
            v93.size.height = v68;
            CGFloat MaxY = CGRectGetMaxY(v93);
            a6->origin.double x = v81;
            a6->origin.double y = MaxY;
            a6->size.width = v83;
            a6->size.height = v65;
          }
          else
          {
            CGSize v85 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
            a6->origin = (CGPoint)*MEMORY[0x1E4F1DB28];
            a6->size = v85;
          }
        }
        a5->origin.double x = v72;
        a5->origin.double y = v74;
        a5->size.width = v70;
        a5->size.height = v68;

        goto LABEL_57;
      }
    }
    else
    {
      v87 = [MEMORY[0x1E4F28B00] currentHandler];
      v88 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat _verticalSpaceToUseForDynamicTopViewLayout(UINavigationController *__strong, CGFloat, UIViewController *__strong, UIScrollView *__strong)");
      [v87 handleFailureInFunction:v88, @"UINavigationController.m", 6847, @"Invalid parameter not satisfying: %@", @"topViewController != nil" file lineNumber description];

      if (v13) {
        goto LABEL_15;
      }
    }
    v89 = [MEMORY[0x1E4F28B00] currentHandler];
    v90 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat _verticalSpaceToUseForDynamicTopViewLayout(UINavigationController *__strong, CGFloat, UIViewController *__strong, UIScrollView *__strong)");
    [v89 handleFailureInFunction:v90, @"UINavigationController.m", 6848, @"Invalid parameter not satisfying: %@", @"contentScrollView != nil" file lineNumber description];

    goto LABEL_15;
  }
  if (a7 != 5)
  {
    if (!a7)
    {
      [(UINavigationController *)self _calculateTopViewFramesForExpandedLayoutWithViewController:v91 contentScrollView:v13 gettingNavBarFrame:a5 topPaletteFrame:a6];
      goto LABEL_57;
    }
    goto LABEL_11;
  }
  [(UIView *)self->_navigationBar frame];
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  [(UINavigationController *)self _widthForLayout];
  CGFloat v38 = v37;
  [(UINavigationBar *)self->_navigationBar _heightForRestoringFromCancelledTransition];
  a5->origin.double x = v34;
  a5->origin.double y = v36;
  a5->size.width = v38;
  a5->size.height = v39;
  if (a6)
  {
    transitioningTopPalette = self->_transitioningTopPalette;
    if (!transitioningTopPalette) {
      transitioningTopPalette = self->_topPalette;
    }
    [(UIView *)transitioningTopPalette frame];
    a6->origin.double x = 0.0;
    a6->origin.double y = 0.0;
    a6->size.width = v41;
    a6->size.height = v42;
  }
LABEL_57:
}

- (BOOL)_shouldNavigationBarInsetViewController:(id)a3 orOverlayContent:(BOOL *)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  if (([v6 _isNestedNavigationController] & 1) != 0
    || ([(UINavigationController *)self _outermostNavigationController],
        char v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 _isNavigationBarEffectivelyVisible],
        v8,
        !v9))
  {
    BOOL v10 = 0;
  }
  else
  {
    if (([v7 extendedLayoutIncludesOpaqueBars] & 1) != 0
      || [(UINavigationController *)self _hasTranslucentNavigationBarIncludingViewController:v7])
    {
      BOOL v10 = ([v7 edgesForExtendedLayout] & 1) == 0;
      if (!a4) {
        goto LABEL_10;
      }
      goto LABEL_12;
    }
    BOOL v10 = 1;
    if (a4) {
LABEL_12:
    }
      *a4 = !v10;
  }
LABEL_10:

  return v10;
}

- (BOOL)_hasTranslucentNavigationBarIncludingViewController:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(UINavigationController *)self navigationBar];
  char IsTranslucentOnScreen = [v5 isTranslucent];

  BOOL v7 = [(UINavigationController *)self navigationBar];
  char v8 = [v7 _appearanceStorage];
  char v9 = [v8 hasAnyCustomBackgroundImage];

  if ((v9 & 1) == 0)
  {
    BOOL v10 = [v4 navigationItem];
    if (objc_opt_respondsToSelector())
    {
      unint64_t v11 = [v10 barStyle];
      long long v12 = [(UIViewController *)self view];
      id v13 = [v12 _screen];
      char IsTranslucentOnScreen = _UIBarStyleWithTintColorIsTranslucentOnScreen(v11, 0, v13);
    }
  }

  return IsTranslucentOnScreen;
}

- (BOOL)_isNavigationBarEffectivelyVisible
{
  BOOL v3 = [(UINavigationController *)self _isNavigationBarVisible];
  if (v3) {
    LOBYTE(v3) = (*(void *)&self->_navigationControllerFlags & 0x2000) == 0;
  }
  return v3;
}

- (void)_computeAndApplyScrollContentInsetDeltaForViewController:(id)a3
{
  id v4 = a3;
  [(UINavigationController *)self _resetScrollViewObservingForViewController:v4];
  uint64_t v5 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, 1, 0);
  id v6 = (void *)v5;
  if ((*(void *)&self->_navigationControllerFlags & 0x1000000000) == 0)
  {
    if (!v5 || [(UINavigationController *)self _isPushingOrPopping]) {
      [(UINavigationController *)self _updateTopViewFramesForViewController:v4];
    }
    BOOL v7 = [v6 _viewControllerForAncestor];
    char v8 = [v7 navigationController];

    if (v8 != self) {
      [(UINavigationController *)v8 _layoutTopViewController];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__UINavigationController__computeAndApplyScrollContentInsetDeltaForViewController___block_invoke;
    v9[3] = &unk_1E52DCB30;
    id v10 = v6;
    unint64_t v11 = self;
    id v12 = v4;
    [(UINavigationController *)self _performWhileIgnoringUpdateTopViewFramesToMatchScrollOffset:v9];
  }
}

- (void)_performTopViewGeometryUpdates:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__UINavigationController__performTopViewGeometryUpdates___block_invoke;
  v6[3] = &unk_1E52DA160;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(UINavigationController *)self _performWhileIgnoringUpdateTopViewFramesToMatchScrollOffset:v6];
}

- (void)_performWhileIgnoringUpdateTopViewFramesToMatchScrollOffset:(id)a3
{
}

void *__57__UINavigationController__performTopViewGeometryUpdates___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 984) frame];
  double v3 = v2;
  double v5 = v4;
  id v6 = *(void **)(*(void *)(a1 + 32) + 1088);
  if (v6)
  {
    [v6 frame];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(*(void *)(a1 + 32) + 984) frame];
  double v12 = v11;
  double v14 = v13;
  CGPoint result = *(void **)(*(void *)(a1 + 32) + 1088);
  if (result)
  {
    CGPoint result = (void *)[result frame];
  }
  else
  {
    double v16 = *MEMORY[0x1E4F1DB30];
    double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (v3 != v12 || v5 != v14 || v8 != v16 || v10 != v17)
  {
    double v21 = *(void **)(a1 + 32);
    return (void *)[v21 _layoutTopViewController];
  }
  return result;
}

uint64_t __114__UINavigationController__updateTopViewFramesToMatchScrollOffsetInViewController_contentScrollView_topLayoutType___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 984);
  if (v3)
  {
    [v3 frame];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __114__UINavigationController__updateTopViewFramesToMatchScrollOffsetInViewController_contentScrollView_topLayoutType___block_invoke_2;
    v16[3] = &unk_1E52E8A60;
    void v16[4] = *(void *)(a1 + 32);
    v16[5] = v4;
    v16[6] = v5;
    v16[7] = v6;
    v16[8] = v7;
    long long v17 = *(_OWORD *)(a1 + 40);
    long long v18 = *(_OWORD *)(a1 + 56);
    +[UIView _animateInProcessAlongsideTransition:v16];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t result = *(void *)(v2 + 1088);
  if (result)
  {
    uint64_t result = [(id)result _attachmentIsChanging];
    if ((result & 1) == 0)
    {
      [*(id *)(*(void *)(a1 + 32) + 1088) frame];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __114__UINavigationController__updateTopViewFramesToMatchScrollOffsetInViewController_contentScrollView_topLayoutType___block_invoke_3;
      v13[3] = &unk_1E52E8A60;
      v13[4] = *(void *)(a1 + 32);
      v13[5] = v9;
      v13[6] = v10;
      v13[7] = v11;
      v13[8] = v12;
      long long v14 = *(_OWORD *)(a1 + 72);
      long long v15 = *(_OWORD *)(a1 + 88);
      return +[UIView _animateInProcessAlongsideTransition:v13];
    }
  }
  return result;
}

- (void)_resetScrollViewObservingForViewController:(id)a3
{
  id v8 = a3;
  uint64_t v4 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v8, 1, 0);
  uint64_t v5 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v8, 4, 0);
  if (v5 == v4) {
    uint64_t v6 = 5;
  }
  else {
    uint64_t v6 = 1;
  }
  [(UINavigationController *)self _updateAndObserveScrollView:v4 viewController:v8 forEdges:v6];
  if (v5 != v4)
  {
    [(UINavigationController *)self _updateAndObserveScrollView:v5 viewController:v8 forEdges:4];
    if (!v5)
    {
      uint64_t v7 = [v8 navigationItem];
      [(UINavigationController *)self _updateScrollViewObservationFlagsForScrollView:v4 navigationItem:v7 forEdges:1];
    }
  }
}

void __83__UINavigationController__computeAndApplyScrollContentInsetDeltaForViewController___block_invoke(id *a1)
{
  if (a1[4])
  {
    [a1[5] _expectedContentInsetDeltaForViewController:a1[6]];
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    if (![a1[5] _isTransitioning]) {
      goto LABEL_12;
    }
    uint64_t v10 = [a1[4] window];
    uint64_t v11 = [v10 windowScene];
    uint64_t v12 = [v11 statusBarManager];
    int v13 = [v12 isInStatusBarFadeAnimation];

    if (v13)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __83__UINavigationController__computeAndApplyScrollContentInsetDeltaForViewController___block_invoke_2;
      v15[3] = &unk_1E52DA520;
      id v16 = a1[6];
      double v17 = v3;
      double v18 = v5;
      double v19 = v7;
      double v20 = v9;
      +[UIView performWithoutAnimation:v15];
    }
    else
    {
LABEL_12:
      if ([a1[5] _appearState] != 3 && objc_msgSend(a1[5], "_appearState"))
      {
        id v14 = a1[6];
        objc_msgSend(v14, "_setNavigationControllerContentInsetAdjustment:", v3, v5, v7, v9);
      }
    }
  }
}

- (int64_t)lastOperation
{
  return *(void *)&self->_navigationControllerFlags >> 4;
}

- (BOOL)_isPushingOrPopping
{
  if ([(UINavigationController *)self _isPushing]) {
    return 1;
  }
  return [(UINavigationController *)self _isPopping];
}

- (double)_preferredHeightForHidingNavigationBarForViewController:(id)a3 topItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  id v9 = v6;
  if ([(UINavigationController *)v8 isNavigationBarHidden]
    && [(_UINavigationControllerPalette *)v8->_topPalette _isPalettePinningBarHidden])
  {
    goto LABEL_14;
  }
  uint64_t v10 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(v8, v9, 1, 0);
  uint64_t v11 = [(UINavigationController *)v8 navigationBar];
  [v11 frame];
  if (v12 == 0.0
    || !_isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets(v8, v10)
    || !v8->_interactiveScrollActive
    && ([v10 isScrollAnimating] & 1) == 0
    && ([v10 refreshControl],
        int v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 refreshControlState],
        v13,
        v14 != 4)
    && ![(UINavigationController *)v8 _isPushingOrPopping]
    && [(UIViewController *)v8 _appearState] != 3
    && (![(UINavigationController *)v8 _isAppearingOrAppearedCheck]
     || ([v11 _hasVariableHeight] & 1) == 0))
  {

LABEL_14:
    [(UINavigationController *)v8 _intrinsicNavigationBarHeightRangeForNavItem:v7];
    double v16 = v17;
    goto LABEL_15;
  }

  [(UIView *)v8->_navigationBar frame];
  double v16 = v15;
LABEL_15:

  return v16;
}

- ($1AB5FA073B851C12C2339EC22442E995)_intrinsicNavigationBarHeightRangeForNavItem:(id)a3
{
  if (self->_interactiveScrollActive)
  {
    double minimum = self->_interactiveScrollNavBarIntrinsicHeightRange.minimum;
    double preferred = self->_interactiveScrollNavBarIntrinsicHeightRange.preferred;
    double maximum = self->_interactiveScrollNavBarIntrinsicHeightRange.maximum;
  }
  else
  {
    navigationBar = self->_navigationBar;
    id v8 = a3;
    [(UINavigationController *)self _widthForLayout];
    -[UINavigationBar _layoutHeightsForNavigationItem:fittingWidth:](navigationBar, "_layoutHeightsForNavigationItem:fittingWidth:", v8);
    double minimum = v9;
    double preferred = v10;
    double maximum = v11;
  }
  double v12 = minimum;
  double v13 = preferred;
  double v14 = maximum;
  result.var2 = v14;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (double)_statusBarHeightAdjustmentForCurrentOrientation
{
  if (self->__positionBarsExclusivelyWithSafeArea)
  {
    double v3 = self;
    double v4 = v3;
    if (self->__positionBarsExclusivelyWithSafeArea
      && ([(UIViewController *)v3 _existingView],
          double v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 _usesMinimumSafeAreas],
          v5,
          v6))
    {
      id v7 = [(UIViewController *)v4 _existingView];
      [v7 _minimumSafeAreaInsets];
      double v9 = v8;
    }
    else
    {
      [(UIViewController *)v4 _contentOverlayInsets];
      double v9 = v10;
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UINavigationController;
    [(UIViewController *)&v13 _statusBarHeightAdjustmentForCurrentOrientation];
    return v11;
  }
  return v9;
}

- (double)_topPalettePreferredLayoutHeightForVisibilityStateIfDisplayedForViewController:(id)a3
{
  id v4 = a3;
  double v5 = self->_topPalette;
  double v6 = 0.0;
  if (v5)
  {
    id v7 = [(UINavigationController *)self topViewController];
    if (v7 == v4)
    {
      double v8 = [(UINavigationDeferredTransitionContext *)self->_deferredTransitionContext outgoingTopPalette];
      if (v8 == v5)
      {
        double v11 = [(UINavigationDeferredTransitionContext *)self->_deferredTransitionContext outgoingTopPalette];
        char v12 = [v11 isAttached];

        if ((v12 & 1) == 0) {
          goto LABEL_7;
        }
        goto LABEL_6;
      }

      id v7 = v4;
    }

LABEL_6:
    [(UIView *)v5 frame];
    double v6 = v9;
  }
LABEL_7:

  return v6;
}

- (void)_updateTopViewFramesForViewController:(id)a3
{
}

- (int64_t)_positionForBar:(id)a3
{
  double v5 = (UIToolbar *)a3;
  double v6 = v5;
  if ((UIToolbar *)self->_navigationBar == v5)
  {
    int64_t preferredNavigationBarPosition = self->__preferredNavigationBarPosition;
    if (!preferredNavigationBarPosition)
    {
      if ([(UINavigationController *)self _viewControllerUnderlapsStatusBar]) {
        int64_t preferredNavigationBarPosition = 3;
      }
      else {
        int64_t preferredNavigationBarPosition = 2;
      }
    }
  }
  else if (self->_toolbar == v5)
  {
    if (dyld_program_sdk_at_least()) {
      int64_t preferredNavigationBarPosition = 4;
    }
    else {
      int64_t preferredNavigationBarPosition = 1;
    }
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"Unexpected bar sending delegate -barPositionForBar:! %@", v5];
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UINavigationController.m", 9317, @"%@", v7 object file lineNumber description];

    int64_t preferredNavigationBarPosition = 0;
  }

  return preferredNavigationBarPosition;
}

- (BOOL)_viewControllerUnderlapsStatusBar
{
  if (self->__positionBarsExclusivelyWithSafeArea)
  {
    [(UIViewController *)self _contentOverlayInsets];
    return v3 > 0.0;
  }
  else if (self->__preferredNavigationBarPosition {
         && [(UINavigationController *)self _isNavigationBarVisible])
  }
  {
    return self->__preferredNavigationBarPosition == 3;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UINavigationController;
    return [(UIViewController *)&v5 _viewControllerUnderlapsStatusBar];
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)_heightRangeOfTopViews
{
  double v3 = [(UINavigationController *)self topViewController];
  id v4 = [v3 navigationItem];
  [(UINavigationController *)self _intrinsicNavigationBarHeightRangeForNavItem:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  topPalette = self->_topPalette;
  if (topPalette)
  {
    [(UIView *)topPalette frame];
    double v6 = v6 + v12;
    double v8 = v8 + v12;
    double v10 = v10 + v12;
  }
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (BOOL)_isAppearingOrAppearedCheck
{
  if (!dyld_program_sdk_at_least()) {
    return [(UIViewController *)self _appearState] == 2;
  }
  if (self) {
    return ((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 < 2;
  }
  return 0;
}

- (void)_setNavigationBarHidesCompletelyOffscreen:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (id)_topViewControllerObservableScrollViewForEdge:(unint64_t)a3
{
  id v4 = [(UINavigationController *)self _viewControllerForObservableScrollView];
  double v5 = [v4 _contentOrObservableScrollViewForEdge:a3];

  return v5;
}

- (BOOL)_useStandardStatusBarHeight
{
  return (*(void *)&self->_navigationControllerFlags >> 37) & 1;
}

- (void)_applyViewControllers:(id)a3 transition:(int)a4 animated:(BOOL)a5 operation:(int64_t)a6 rescheduleBlock:(id)a7
{
  BOOL v9 = a5;
  id v13 = a3;
  id v14 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke;
  aBlock[3] = &unk_1E52E8840;
  id v15 = v13;
  aBlock[4] = self;
  id v49 = v15;
  int v51 = a4;
  BOOL v52 = v9;
  int64_t v50 = a6;
  double v16 = (void (**)(void))_Block_copy(aBlock);
  double v17 = [(UINavigationController *)self _transitionCoordinator];
  if (!v17)
  {
    if ([(UINavigationController *)self _isTransitioning])
    {
      if (!v9)
      {
LABEL_19:
        v16[2](v16);
        goto LABEL_32;
      }
    }
    else if (![(UINavigationController *)self needsDeferredTransition] || !v9)
    {
      goto LABEL_19;
    }
    [(id)UIApp _performBlockAfterCATransactionCommits:v16];
    goto LABEL_32;
  }
  if (![(UINavigationController *)self _transitionConflictsWithNavigationTransitions:v17])
  {
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke_2;
    v42[3] = &unk_1E52E8890;
    v42[4] = self;
    id v43 = v14;
    int v46 = a4;
    BOOL v47 = v9;
    id v44 = v15;
    int64_t v45 = a6;
    double v21 = _Block_copy(v42);
    if (!v9 && [v17 presentationStyle] != -1)
    {
      +[UIViewController _performWithoutDeferringTransitions:v16];
      dyld_program_sdk_at_least();
LABEL_31:

      goto LABEL_32;
    }
    if ([(UINavigationController *)self _isCurrentTransitionPreemptable])
    {
      double v37 = (void (**)(void, void *))v21;
      uint64_t v22 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionContext];
      int v23 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionController];
      id v24 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionContext];
      CGFloat v38 = v23;
      id v25 = [v23 preemptWithContext:v24];

      uint64_t v26 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionContext];
      double v27 = (void *)v26;
      if (v26)
      {
        double v28 = (void *)v22;
        if (v26 != v22)
        {
          double v29 = *(NSObject **)(__UILogGetCategoryCachedImpl("UINavigationController", &_applyViewControllers_transition_animated_operation_rescheduleBlock____s_category)+ 8);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_DEFAULT, "A transition was started while preempting previous transition. Deferring new transition.", buf, 2u);
          }
          double v30 = [(UINavigationController *)self _transitionCoordinator];
          double v21 = v37;
          v37[2](v37, v30);

          id v31 = v38;
          goto LABEL_28;
        }
        CGFloat v36 = [MEMORY[0x1E4F28B00] currentHandler];
        [v36 handleFailureInMethod:a2 object:self file:@"UINavigationController.m" lineNumber:1515 description:@"Failed to preempt running transition."];

        id v31 = v38;
      }
      else
      {
        [(UIView *)self->_navigationBar layoutIfNeeded];
        [(_UIViewControllerTransitionConductor *)self->_transitionConductor setPendingPreemptionHandoffData:v25];
        v16[2](v16);
        id v31 = v38;
        double v28 = (void *)v22;
      }
      double v21 = v37;
LABEL_28:

      goto LABEL_29;
    }
    (*((void (**)(void *, void *))v21 + 2))(v21, v17);
    id v32 = v17;
    if (sel__addInvalidationHandler_)
    {
      double v33 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionContext];
      [v33 _state];
      char v34 = objc_opt_respondsToSelector();

      if (v34)
      {
LABEL_22:
        double v35 = [(UILayoutContainerView *)self->_containerView _disableUserInteractionForReason:@"_applyViewControllers"];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke_333;
        v39[3] = &unk_1E52D9F70;
        v40 = v35;
        id v31 = v35;
        [v32 _addInvalidationHandler:v39];
        id v25 = v40;
        double v28 = v32;
LABEL_29:

        goto LABEL_30;
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      goto LABEL_22;
    }
    double v28 = v32;
LABEL_30:

    goto LABEL_31;
  }
  double v18 = NSStringFromSelector(a2);
  double v19 = (objc_class *)objc_opt_class();
  double v20 = NSStringFromClass(v19);
  NSLog(&cfstr_CalledOnPWhile.isa, v18, v20, self);

LABEL_32:
}

- (id)_transitionCoordinator
{
  uint64_t v3 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionCoordinator];
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UINavigationController;
    uint64_t v3 = [(UIViewController *)&v5 _transitionCoordinator];
  }
  return v3;
}

- (void)_updateLayoutForScrollView:(id)a3 topLayoutType:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    if ((*(void *)&self->_navigationControllerFlags & 0x1000000000) == 0)
    {
      id v17 = v6;
      int isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets = _isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets(self, v6);
      id v6 = v17;
      if (isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets)
      {
        double v8 = [(UINavigationController *)self topViewController];
        _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v8, 1, 1);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        if (v9 == v17)
        {

          id v11 = v17;
        }
        else
        {
          _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v8, 1, 0);
          id v10 = (id)objc_claimAutoreleasedReturnValue();

          id v11 = v17;
          if (v10 != v17)
          {
            disappearingViewController = self->_disappearingViewController;
            id v13 = [(UINavigationController *)self topViewController];
            id v14 = [v13 navigationItem];
            id v15 = [v14 _searchControllerIfAllowed];

            if (!disappearingViewController)
            {
              if (!v15
                || ![v15 isActive]
                || ([v15 _contentOrObservableScrollViewForEdge:1],
                    id v16 = (id)objc_claimAutoreleasedReturnValue(),
                    v16,
                    v16 != v17))
              {
                [(UINavigationController *)self _stopObservingContentScrollView:v17];
              }
            }

            goto LABEL_14;
          }
        }
        [(UINavigationController *)self _updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:v11];
        [(UINavigationController *)self _updateTopViewFramesToMatchScrollOffsetInViewController:v8 contentScrollView:v17 topLayoutType:a4];
LABEL_14:

        id v6 = v17;
      }
    }
  }
}

- (void)_layoutViewController:(id)a3
{
  id v50 = a3;
  [v50 loadViewIfRequired];
  if (([(id)objc_opt_class() _directlySetsContentOverlayInsetsForChildren] & 1) == 0)
  {
    [(UIViewController *)self _updateContentOverlayInsetsFromParentIfNecessary];
    [v50 _updateContentOverlayInsetsForSelfAndChildren];
    id v4 = [(UINavigationController *)self topViewController];

    if (v4 == v50)
    {
      objc_super v5 = [(UINavigationController *)self topViewController];
      id v6 = [v5 navigationItem];
      double v7 = [v6 _searchControllerIfAllowed];

      if (v7 && [v7 isActive]) {
        [v7 _updateContentOverlayInsetsForSelfAndChildren];
      }
    }
  }
  double v8 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v50, 1, 0);
  [(UINavigationController *)self _updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:v8];

  [(UINavigationController *)self _computeAndApplyScrollContentInsetDeltaForViewController:v50];
  id v9 = [v50 view];
  id v10 = [v9 superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v50 view];
    double v12 = [(UINavigationController *)self navigationTransitionView];
    int v13 = [v11 isDescendantOfView:v12];

    id v14 = v50;
    if (!v13) {
      goto LABEL_23;
    }
    [(UINavigationController *)self _frameForViewController:v50];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [(UINavigationController *)self _frameForWrapperViewForViewController:v50];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    id v31 = [v50 view];
    id v32 = [v31 superview];
    [v32 frame];
    v54.origin.double x = v33;
    v54.origin.double y = v34;
    v54.size.width = v35;
    v54.size.height = v36;
    v52.origin.double x = v24;
    v52.origin.double y = v26;
    v52.size.width = v28;
    v52.size.height = v30;
    BOOL v37 = CGRectEqualToRect(v52, v54);

    if (!v37)
    {
      CGFloat v38 = [v50 view];
      CGFloat v39 = [v38 superview];
      objc_msgSend(v39, "setFrame:", v24, v26, v28, v30);
    }
    v40 = [v50 view];
    [v40 frame];
    v55.origin.double x = v41;
    v55.origin.double y = v42;
    v55.size.width = v43;
    v55.size.height = v44;
    v53.origin.double x = v16;
    v53.origin.double y = v18;
    v53.size.width = v20;
    v53.size.height = v22;
    BOOL v45 = CGRectEqualToRect(v53, v55);

    if (v45)
    {
      char v46 = !v37;
    }
    else
    {
      BOOL v47 = [v50 view];
      objc_msgSend(v47, "setFrame:", v16, v18, v20, v22);

      char v46 = 1;
    }
    if (![(UINavigationController *)self isToolbarHidden]) {
      [(UINavigationController *)self _positionToolbarHidden:0];
    }
    id v14 = v50;
    if ((v46 & 1) == 0)
    {
      double v48 = [v50 _topBarInsetGuideConstraint];
      if (v48)
      {

        id v14 = v50;
      }
      else
      {
        id v49 = [v50 _bottomBarInsetGuideConstraint];

        id v14 = v50;
        if (!v49) {
          goto LABEL_23;
        }
      }
    }
    id v9 = [v14 view];
    [v9 layoutIfNeeded];
  }
  else
  {
  }
  id v14 = v50;
LABEL_23:
}

- (void)_layoutTopViewControllerLookForNested:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(UINavigationController *)self topViewController];
  id v14 = v5;
  if (v3 && [v5 _isNestedNavigationController])
  {
    uint64_t v6 = [v14 topViewController];

    id v14 = (id)v6;
  }
  id v7 = [(UINavigationController *)self disappearingViewController];

  double v8 = v14;
  if (v14 != v7)
  {
    if ([(UINavigationController *)self needsDeferredTransition]
      || ![v14 isViewLoaded]
      || [(UINavigationController *)self isCustomTransition])
    {
      p_uint64_t navigationControllerFlags = &self->_navigationControllerFlags;
      *(void *)&self->_navigationControllerFlags |= 0x40000000000000uLL;
      goto LABEL_9;
    }
    if ([(UINavigationController *)self _isNestedNavigationController])
    {
      double v12 = [(UINavigationController *)self _outermostNavigationController];
      char v13 = [v12 isCustomTransition];

      p_uint64_t navigationControllerFlags = &self->_navigationControllerFlags;
      *(void *)&self->_navigationControllerFlags |= 0x40000000000000uLL;
      if (v13)
      {
LABEL_9:
        if (([(id)objc_opt_class() _directlySetsContentOverlayInsetsForChildren] & 1) == 0)
        {
          [(UIViewController *)self _updateContentOverlayInsetsFromParentIfNecessary];
          [v14 _updateContentOverlayInsetsForSelfAndChildren];
          id v10 = [v14 navigationItem];
          id v11 = [v10 _searchControllerIfAllowed];

          if (v11 && [v11 isActive]) {
            [v11 _updateContentOverlayInsetsForSelfAndChildren];
          }
        }
        goto LABEL_14;
      }
    }
    else
    {
      p_uint64_t navigationControllerFlags = &self->_navigationControllerFlags;
      *(void *)&self->_navigationControllerFlags |= 0x40000000000000uLL;
    }
    [(UINavigationController *)self _layoutViewController:v14];
LABEL_14:
    *(void *)p_navigationControllerFlags &= ~0x40000000000000uLL;
    [(UINavigationController *)self _eagerlyUpdateSafeAreaInsets];
    double v8 = v14;
  }
}

+ (BOOL)_directlySetsContentOverlayInsetsForChildren
{
  return dyld_program_sdk_at_least() ^ 1;
}

- (BOOL)needsDeferredTransition
{
  return [(_UIViewControllerTransitionConductor *)self->_transitionConductor needsDeferredTransition];
}

- (void)_eagerlyUpdateSafeAreaInsets
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UINavigationController *)self topViewController];
  uint64_t v4 = 0;
  objc_super v5 = 0;
  char v6 = 1;
  do
  {
    char v7 = v6;
    uint64_t v8 = [v3 _contentOrObservableScrollViewForEdge:qword_186B94240[v4]];
    id v9 = (void *)v8;
    if (v8) {
      BOOL v10 = v5 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      objc_super v5 = [MEMORY[0x1E4F1CA48] array];
    }
    else if (!v8)
    {
      goto LABEL_12;
    }
    if (([v9 _safeAreaInsetsFrozen] & 1) == 0 && (objc_msgSend(v5, "containsObject:", v9) & 1) == 0) {
      [v5 addObject:v9];
    }
LABEL_12:

    char v6 = 0;
    uint64_t v4 = 1;
  }
  while ((v7 & 1) != 0);
  id v11 = [v3 _existingView];
  double v12 = v11;
  if (!v5 && v11)
  {
    if ([v11 _safeAreaInsetsFrozen])
    {
      objc_super v5 = 0;
    }
    else
    {
      char v13 = [v12 subviews];
      if ([v13 count])
      {
        id v14 = [v12 subviews];
        objc_super v5 = (void *)[v14 mutableCopy];
      }
      else
      {
        objc_super v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:v12];
      }
    }
  }
  double v15 = [v3 navigationItem];
  double v16 = [v15 _searchControllerIfAllowed];

  double v17 = [v16 _currentActiveChildViewController];
  double v18 = v17;
  if (v17)
  {
    double v19 = [v17 contentScrollView];
    if (v19 || ([v18 _existingView], (double v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (([v19 _safeAreaInsetsFrozen] & 1) == 0)
      {
        if (!v5)
        {
          objc_super v5 = [MEMORY[0x1E4F1CA48] array];
        }
        [v5 addObject:v19];
      }
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = v5;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        -[UIViewController _eagerlyUpdateSafeAreaInsetsToViewDescendant:](self, "_eagerlyUpdateSafeAreaInsetsToViewDescendant:", *(void *)(*((void *)&v25 + 1) + 8 * i), (void)v25);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v22);
  }
}

- (void)_updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:(id)a3
{
  id v9 = a3;
  if (![(UINavigationController *)self _shouldSkipHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary])
  {
    uint64_t v4 = [(UINavigationController *)self navigationBar];
    objc_super v5 = [v4 refreshControlHost];

    char v6 = v5;
    char v7 = v6;
    if (![(_UINavigationControllerRefreshControlHost *)v6 isHostingRefreshControlOwnedByScrollView:v9])
    {
      if ([(UINavigationController *)self _canHostRefreshControlOwnedByScrollView:v9])
      {
        char v7 = [[_UINavigationControllerRefreshControlHost alloc] initWithNavigationController:self scrollView:v9];
      }
      else
      {
        char v7 = 0;
      }
    }
    uint64_t v8 = [(UINavigationController *)self navigationBar];
    [v8 setRefreshControlHost:v7];
  }
}

- (BOOL)_shouldSkipHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary
{
  BOOL v3 = [(UINavigationController *)self _updateNavigationBarHandler];
  if (v3)
  {
    uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
    if ((navigationControllerFlags & 0x80000000000000) == 0)
    {
      char v5 = *((unsigned char *)&self->_navigationControllerFlags + 8);
      *(void *)&self->_uint64_t navigationControllerFlags = navigationControllerFlags | 0x80000000000000;
      *((unsigned char *)&self->_navigationControllerFlags + 8) = v5;
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __98__UINavigationController__shouldSkipHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary__block_invoke;
      v7[3] = &unk_1E52E8AB0;
      id v8 = v3;
      objc_copyWeak(&v9, &location);
      [(UINavigationController *)self _setUpdateNavigationBarHandler:v7];
      objc_destroyWeak(&v9);

      objc_destroyWeak(&location);
    }
  }

  return v3 != 0;
}

- (id)_updateNavigationBarHandler
{
  return self->__updateNavigationBarHandler;
}

- (UIEdgeInsets)_expectedContentInsetDeltaForViewController:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  double v6 = 0.0;
  if (v4)
  {
    double v7 = 0.0;
    if ([v4 automaticallyAdjustsScrollViewInsets])
    {
      [(UINavigationController *)self _scrollViewTopContentInsetForViewController:v5];
      double v7 = v8;
      [(UINavigationController *)self _scrollViewBottomContentInsetForViewController:v5];
      double v6 = v9;
    }
  }
  else
  {
    double v7 = 0.0;
  }

  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = v7;
  double v13 = v6;
  result.right = v11;
  result.bottom = v13;
  result.left = v10;
  result.top = v12;
  return result;
}

- (BOOL)_isNavigationController
{
  return 1;
}

- (id)_contentOrObservableScrollViewForEdge:(unint64_t)a3
{
  return -[UIViewController _contentOrObservableScrollViewInContainerForEdge:](self, a3);
}

- (BOOL)isCustomTransition
{
  return (~*(_DWORD *)&self->_navigationControllerFlags & 0x10004) == 0;
}

- (CGRect)_frameForWrapperViewForViewController:(id)a3
{
  BOOL v3 = [(UINavigationController *)self navigationTransitionView];
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
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)_updateLayoutForStatusBarAndInterfaceOrientation
{
}

void __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) childViewControllers];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) _immediatelyApplyViewControllers:v4 transition:*(unsigned int *)(a1 + 56) animated:*(unsigned __int8 *)(a1 + 60) operation:*(void *)(a1 + 48)];
}

uint64_t __71__UINavigationController_pushViewController_transition_forceImmediate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 arrayByAddingObject:*(void *)(a1 + 32)];
}

id __76__UINavigationController__setViewControllers_transition_animated_operation___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_safeAreaInsetsDidChangeForView
{
  v3.receiver = self;
  v3.super_class = (Class)UINavigationController;
  [(UIViewController *)&v3 _safeAreaInsetsDidChangeForView];
  -[UIView _eagerlyUpdateSafeAreaInsetsToDescendant:](self->super._view, self->_navigationBar);
  [(UINavigationBar *)self->_navigationBar safeAreaInsetsDidChange];
}

id __57__UINavigationController_popToViewController_transition___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  double v5 = [v3 lastObject];

  if (v4 == v5)
  {
LABEL_6:
    id v8 = v3;
    goto LABEL_8;
  }
  uint64_t v6 = [v3 indexOfObjectIdenticalTo:*(void *)(a1 + 32)];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v15 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "Tried to pop to a view controller that doesn't exist.", buf, 2u);
      }
    }
    else
    {
      double v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_ForcePositionBarsExclusivelyWithSafeArea_block_invoke_2___s_category)+ 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v16 = 0;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Tried to pop to a view controller that doesn't exist.", v16, 2u);
      }
    }
    goto LABEL_6;
  }
  uint64_t v9 = v6 + 1;
  uint64_t v10 = objc_msgSend(v3, "subarrayWithRange:", v9, objc_msgSend(v3, "count") - v9);
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  double v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  objc_msgSend(v3, "subarrayWithRange:", 0, v9);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  double v13 = v8;

  return v13;
}

- (id)childViewControllerForStatusBarHidden
{
  id v3 = +[UIDevice currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4
    || +[UIDevice _hasHomeButton]
    || [(UINavigationController *)self isNavigationBarHidden])
  {
    double v5 = [(UINavigationController *)self topViewController];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (unint64_t)supportedInterfaceOrientations
{
  if ((*(void *)&self->_navigationControllerFlags & 0x10000000) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unint64_t v5 = [WeakRetained navigationControllerSupportedInterfaceOrientations:self];

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UINavigationController;
    return [(UIViewController *)&v6 supportedInterfaceOrientations];
  }
}

- (void)_updateControlledViewsToFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UINavigationController;
  -[UIViewController _updateControlledViewsToFrame:](&v4, sel__updateControlledViewsToFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UINavigationController *)self _frameForPalette:self->_topPalette];
  -[_UINavigationControllerPalette setFrame:](self->_topPalette, "setFrame:");
}

- (CGRect)_frameForPalette:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 boundaryEdge];
  [v4 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  if (v5)
  {
    if (v5 == 5)
    {
      double v7 = 0.0;
      double v9 = 0.0;
      if ([(UINavigationController *)self _viewControllerUnderlapsStatusBar])
      {
        [(UINavigationController *)self _statusBarHeightAdjustmentForCurrentOrientation];
        double v9 = v19;
      }
      if (*(void *)&self->_navigationControllerFlags)
      {
        [(UINavigationController *)self _widthForLayout];
        double v11 = v22;
      }
      else
      {
        id v20 = [(UINavigationController *)self _navigationBarForNestedNavigationController];
        [v20 frame];
        double v11 = v21;
      }
    }
    else if (v5 == 2)
    {
      double v9 = 0.0;
      if ([(UINavigationController *)self _viewControllerUnderlapsStatusBar])
      {
        [(UINavigationController *)self _statusBarHeightAdjustmentForCurrentOrientation];
        double v9 = v14;
      }
      if (*(void *)&self->_navigationControllerFlags)
      {
        [(UINavigationController *)self _widthForLayout];
        double v11 = v23;
      }
      else
      {
        double v15 = [(UINavigationController *)self _navigationBarForNestedNavigationController];
        [v15 frame];
        double v11 = v16;
        double v18 = v17;

        double v9 = v9 + v18;
      }
      double v7 = 0.0;
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Palettes currently can only have a top boundary edge or no boundary edge"];
    }
  }
  double v24 = v7;
  double v25 = v9;
  double v26 = v11;
  double v27 = v13;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  id v6 = a3;
  if ([v6 _isNestedNavigationController])
  {
    *a4 = 1;
    [(UIViewController *)self _contentOverlayInsets];
  }
  else
  {
    [(UINavigationController *)self _calculateEdgeInsetsForChildViewController:v6 insetsAreAbsolute:a4];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (UIEdgeInsets)_calculateEdgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  id v6 = a3;
  double v7 = [(UINavigationController *)self _outermostNavigationController];
  double v8 = v7;
  uint64_t v35 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  if (v7)
  {
    [v7 _calculateTopLayoutInfoForViewController:v6];
    double v9 = *(double *)&v33;
  }
  else
  {
    double v9 = 0.0;
  }
  double v10 = [v8 _existingView];
  if (![v10 _usesMinimumSafeAreas]) {
    goto LABEL_8;
  }
  char v11 = [v8 isNavigationBarHidden];

  if (v11) {
    goto LABEL_9;
  }
  int v12 = [v8 _positionBarsExclusivelyWithSafeArea];
  [v8 _contentOverlayInsets];
  double v14 = v13;
  if (v12)
  {
    double v10 = [v8 _existingView];
    [v10 _minimumSafeAreaInsets];
    double v9 = v9 - (v14 - v15);
LABEL_8:

    goto LABEL_9;
  }
  v32.receiver = self;
  v32.super_class = (Class)UINavigationController;
  [(UIViewController *)&v32 _statusBarHeightAdjustmentForCurrentOrientation];
  double v9 = v9 - (v14 - v30);
LABEL_9:
  double v16 = 0.0;
  if (v9 == 0.0)
  {
    double v17 = 0.0;
    double v18 = 0.0;
    if ([v8 _searchHidNavigationBar])
    {
      [(UINavigationController *)self _edgeInsetsDeferringToCommandeeringTableHeaderViewStyleSearchControllerWithPresentingViewController:v6];
      double v9 = v19;
      double v18 = v20;
      double v17 = v21;
      double v16 = v22;
    }
  }
  else
  {
    double v17 = 0.0;
    double v18 = 0.0;
  }
  double v23 = [(UINavigationController *)self _existingToolbar];
  if (v23)
  {
    char v31 = 0;
    [(UINavigationController *)self _shouldToolBar:v23 insetViewController:v6 orOverlayContent:&v31];
    if (v31)
    {
      double v24 = [(UINavigationController *)self toolbar];
      objc_msgSend(v24, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v17 = v25;
    }
  }
  *a4 = 0;

  double v26 = v9;
  double v27 = v18;
  double v28 = v17;
  double v29 = v16;
  result.right = v29;
  result.bottom = v28;
  result.left = v27;
  result.top = v26;
  return result;
}

- (BOOL)_positionBarsExclusivelyWithSafeArea
{
  return self->__positionBarsExclusivelyWithSafeArea;
}

- (void)_updateBarsForCurrentInterfaceOrientationAndForceBarLayout:(BOOL)a3
{
  [(UINavigationController *)self _setInteractiveScrollActive:0];
  if (a3
    || ([(UINavigationController *)self topViewController],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets = _isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets(self, v5), v5, (isHeightOfTopViewsCoordinatedToMatchViewControllerOffsets & 1) == 0))
  {
    [(UINavigationController *)self _positionNavigationBarHidden:*(_DWORD *)&self->_navigationControllerFlags & 1];
    [(UINavigationController *)self _repositionPaletteWithNavigationBarHidden:*(_DWORD *)&self->_navigationControllerFlags & 1 duration:0 shouldUpdateNavigationItems:0.0];
  }
  [(UINavigationController *)self _setInteractiveScrollActive:self->_interactiveScrollActive];
  [(UINavigationController *)self _positionToolbarHidden:[(UINavigationController *)self isToolbarHidden]];
  [(UINavigationController *)self _layoutTopViewController];
  double v7 = [(UINavigationController *)self topViewController];
  [(UINavigationController *)self _computeAndApplyScrollContentInsetDeltaForViewController:v7];

  double v8 = [(UINavigationController *)self topViewController];
  [(UINavigationController *)self _updateTopViewFramesForViewController:v8 isCancelledTransition:0 isOrientationChange:1];

  topPalette = self->_topPalette;
  if (topPalette && (*(void *)&self->_navigationControllerFlags & 1) != 0)
  {
    [(_UINavigationControllerPalette *)topPalette _updateLayoutForCurrentConfiguration];
    uint64_t v10 = *(_DWORD *)&self->_navigationControllerFlags & 1;
    [(UINavigationController *)self _repositionPaletteWithNavigationBarHidden:v10 duration:0 shouldUpdateNavigationItems:0.0];
  }
}

- (void)_layoutTopViewController
{
}

- (void)_positionNavigationBarHidden:(BOOL)a3
{
}

- (void)_setInteractiveScrollActive:(BOOL)a3
{
  if (self->_interactiveScrollActive != a3)
  {
    self->_interactiveScrollActive = a3;
    if (a3) {
      [(UINavigationController *)self _reloadCachedInteractiveScrollMeasurements];
    }
  }
}

- (void)_positionToolbarHidden:(BOOL)a3 edge:(unint64_t)a4 crossFade:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  id v54 = [(UINavigationController *)self _existingToolbar];
  [v54 bounds];
  double v10 = v9;
  double v12 = v11;
  objc_msgSend(v54, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v14 = v13;
  double v16 = v15;
  objc_msgSend(v54, "setBounds:", v10, v12, v13, v15);
  uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  double v18 = [(UIViewController *)self tabBarController];
  double v19 = v18;
  double v20 = 0.0;
  if (!v18 || (navigationControllerFlags & 0xC00) != 0) {
    goto LABEL_11;
  }
  double v21 = [v18 tabBar];
  double v22 = v21;
  if (v21)
  {
    double v23 = [v21 window];

    if (v23)
    {
      double v24 = [v19 tabBar];
      if (([v24 isHidden] & 1) == 0)
      {

LABEL_9:
        [v22 bounds];
        double v20 = v26;
        goto LABEL_10;
      }
      double v25 = [(UIViewController *)self parentViewController];

      if (v25 == v19) {
        goto LABEL_9;
      }
    }
  }
LABEL_10:

LABEL_11:
  containerView = self->_containerView;
  if (containerView)
  {
    [(UIView *)containerView bounds];
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
  }
  else
  {
    CGFloat v29 = *MEMORY[0x1E4F1DB28];
    CGFloat v31 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v33 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v35 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  v56.origin.double x = v29;
  v56.origin.double y = v31;
  v56.size.width = v33;
  v56.size.height = v35;
  double MidX = CGRectGetMidX(v56);
  v57.origin.double x = v29;
  v57.origin.double y = v31;
  v57.size.width = v33;
  v57.size.height = v35;
  double v37 = CGRectGetMaxY(v57) + v16 * -0.5;
  int v38 = !v7;
  int v39 = v20 <= 0.0 || v7;
  if (v39) {
    double v40 = 0.0;
  }
  else {
    double v40 = v20;
  }
  if (v7) {
    double v41 = 0.0;
  }
  else {
    double v41 = 1.0;
  }
  if ((v38 & 1) != 0 || v5)
  {
    [v54 alpha];
    if (v42 != v41 && ![(UINavigationController *)self _toolbarAnimationWasCancelled]) {
      [v54 setAlpha:v41];
    }
  }
  double v43 = v37 - v40;
  int v44 = ![(_UIViewControllerTransitionConductor *)self->_transitionConductor shouldAnimateBottomBarVisibility]|| v5;
  if ((v38 | v44))
  {
    BOOL v45 = v54;
  }
  else
  {
    double builtinTransitionGap = 0.0;
    if (self->_builtinTransitionStyle == 1) {
      double builtinTransitionGap = self->_builtinTransitionGap;
    }
    double v47 = v14 + builtinTransitionGap;
    BOOL v45 = v54;
    if (a4 == 8)
    {
      double MidX = MidX + v47;
      int v38 = 1;
    }
    else
    {
      double v48 = MidX - v47;
      if (a4 == 2) {
        double MidX = v48;
      }
      else {
        double v43 = v16 + v43;
      }
      int v38 = a4 == 2;
    }
  }
  if (((v38 | v44) & v39) == 1)
  {
    [v45 bounds];
    v58.origin.double y = round(v43 - v58.size.height * 0.5);
    v58.origin.double x = round(MidX - v58.size.width * 0.5);
    CGFloat MaxY = CGRectGetMaxY(v58);
    _UIBackgroundExtensionForBarWithMaxY(v54, MaxY);
  }
  UIFloorToViewScale(self->_containerView);
  double v51 = v50 * 0.5;
  [v54 center];
  if (v53 != MidX || v52 != v51) {
    objc_msgSend(v54, "setCenter:", MidX, v51);
  }
  if (objc_opt_respondsToSelector()) {
    [(_UINavigationControllerVisualStyle *)self->_visualStyle toolbarFrameChanged];
  }
}

- (void)_positionToolbarHidden:(BOOL)a3 edge:(unint64_t)a4
{
}

- (void)_positionToolbarHidden:(BOOL)a3
{
}

- (CGRect)_frameForViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UINavigationController *)self navigationTransitionView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  uint64_t v56 = 0;
  long long v54 = 0u;
  long long v55 = 0u;
  [(UINavigationController *)self _calculateTopLayoutInfoForViewController:v4];
  BOOL v14 = [(UINavigationController *)self _viewControllerUnderlapsStatusBar];
  id v15 = v4;
  double v16 = [(UINavigationController *)self navigationBar];
  uint64_t v17 = [v16 _barPosition];
  double v18 = [v15 searchDisplayController];
  if ([v18 isActive])
  {
    double v19 = [v15 searchDisplayController];
    if ([v19 hidNavigationBar]) {
      int v21 = ([v15 edgesForExtendedLayout] & 1) == 0 && v17 == 3;
    }
    else {
      int v21 = 0;
    }
  }
  else
  {
    int v21 = 0;
  }

  double v22 = v9 + *((double *)&v54 + 1);
  double v23 = 0.0;
  double v24 = v13 - (*((double *)&v54 + 1) + 0.0);
  if ((v21 | v14) == 1)
  {
    [(UINavigationController *)self _statusBarHeightAdjustmentForCurrentOrientation];
    double v23 = v25;
    int v26 = v25 > 0.0 ? v21 : 0;
    double v27 = v22 + v25;
    if (v26 == 1)
    {
      double v24 = v24 - (v23 + 0.0);
      double v22 = v27;
    }
  }
  double v28 = [(UINavigationController *)self _existingToolbar];
  char v53 = 0;
  BOOL v29 = [(UINavigationController *)self _shouldToolBar:v28 insetViewController:v4 orOverlayContent:&v53];
  char v52 = 0;
  double v30 = [(UIViewController *)self tabBarController];
  CGFloat v31 = [v30 tabBar];

  double v32 = [(UIViewController *)self tabBarController];
  BOOL v33 = [(UINavigationController *)self _shouldTabBarController:v32 insetViewController:v4 orOverlayContent:&v52];

  if (!v33 && v29)
  {
    double v22 = v22 + 0.0;
    double v24 = v24 - (_UIBackgroundExtensionForBar(v28) + 0.0);
LABEL_25:
    CGFloat v36 = [(UINavigationController *)self toolbar];
    objc_msgSend(v36, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v35 = v37;

    goto LABEL_26;
  }
  if (v53) {
    int v34 = 1;
  }
  else {
    int v34 = v29;
  }
  double v35 = 0.0;
  if (v34 == 1) {
    goto LABEL_25;
  }
LABEL_26:
  if (v29)
  {
    if (v31 && (~*(_DWORD *)&self->_navigationControllerFlags & 0xC00) != 0) {
      BOOL v33 = 1;
    }
    double v22 = v22 + 0.0;
    double v24 = v24 - (v35 + 0.0);
  }
  if (v53 && v31 && (~*(_DWORD *)&self->_navigationControllerFlags & 0xC00) != 0) {
    char v52 = 1;
  }
  if (v52) {
    int v38 = 1;
  }
  else {
    int v38 = v33;
  }
  double v39 = 0.0;
  if (v38 == 1)
  {
    [v31 bounds];
    double v39 = v40;
  }
  if (v33)
  {
    double v41 = [v4 _screen];
    uint64_t v42 = [v41 _userInterfaceIdiom];

    double v24 = v24 - (v39 + 0.0);
    if (v42 == 3) {
      double v22 = v22 + v39;
    }
    else {
      double v22 = v22 + 0.0;
    }
  }
  if ([(id)objc_opt_class() _directlySetsContentOverlayInsetsForChildren])
  {
    double v43 = *(double *)&v55 + *((double *)&v55 + 1);
    double v44 = 0.0;
    if (!BYTE3(v56)) {
      double v43 = 0.0;
    }
    if ((v14 & ~v21) != 0) {
      double v45 = v23;
    }
    else {
      double v45 = 0.0;
    }
    double v46 = v45 + v43;
    if (v52) {
      double v47 = v39;
    }
    else {
      double v47 = 0.0;
    }
    if (v53) {
      double v44 = v35;
    }
    objc_msgSend(v4, "_setContentOverlayInsets:andLeftMargin:rightMargin:", v46, 0.0, v47 + v44, 0.0, -1.79769313e308, -1.79769313e308);
  }

  double v48 = v7 + 0.0;
  double v49 = v22;
  double v50 = v11;
  double v51 = v24;
  result.size.height = v51;
  result.size.width = v50;
  result.origin.double y = v49;
  result.origin.double x = v48;
  return result;
}

- (UIView)navigationTransitionView
{
  return (UIView *)self->_navigationTransitionView;
}

- (BOOL)_shouldToolBar:(id)a3 insetViewController:(id)a4 orOverlayContent:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    goto LABEL_7;
  }
  if ([(UINavigationController *)self isToolbarHidden])
  {
    if ((*(void *)&self->_navigationControllerFlags & 0x400000000000) == 0) {
      goto LABEL_7;
    }
    double v10 = [(UINavigationController *)self _outermostNavigationController];
    if ([v10 isToolbarHidden])
    {

      goto LABEL_7;
    }
    uint64_t v11 = v10[154];

    if ((v11 & 0x100000000000) == 0)
    {
LABEL_7:
      BOOL v12 = 0;
      BOOL v13 = 0;
      if (!a5) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  int v14 = [v8 isTranslucent];
  if (([v9 extendedLayoutIncludesOpaqueBars] & 1) == 0 && !v14)
  {
    BOOL v13 = 1;
    if (!a5) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  BOOL v13 = ([v9 edgesForExtendedLayout] & 4) == 0;
  if (a5)
  {
LABEL_14:
    BOOL v12 = !v13;
LABEL_15:
    *a5 = v12;
  }
LABEL_16:

  return v13;
}

- (double)_scrollViewBottomContentInsetForViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UINavigationController *)self _existingToolbar];
  double v6 = 0.0;
  if (v5
    && ![(UINavigationController *)self isToolbarHidden]
    && ![(UINavigationController *)self _shouldToolBar:v5 insetViewController:v4])
  {
    double v7 = [(UINavigationController *)self toolbar];
    objc_msgSend(v7, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v6 = v8;
  }
  id v9 = [(UIViewController *)self tabBarController];
  double v10 = [v9 tabBar];
  uint64_t v11 = [(UIViewController *)self tabBarController];
  uint64_t v12 = [v11 _effectiveTabBarPosition];

  if (v10
    && v12 == 1
    && (*(void *)&self->_navigationControllerFlags & 0xC00) == 0
    && ![(UINavigationController *)self _shouldTabBarController:v9 insetViewController:v4 orOverlayContent:0])
  {
    [v10 bounds];
    double v6 = v6 + v13;
  }
  int v14 = [(UIView *)self->super._view _window];
  [v14 safeAreaInsets];
  double v16 = v6 + v15;

  uint64_t v17 = [(UIViewController *)self _multiColumnViewController];
  double v18 = v17;
  if (v17)
  {
    [v17 keyboardInset];
    if (v16 < v19) {
      double v16 = v19;
    }
  }

  return v16;
}

- (id)_existingToolbar
{
  return self->_toolbar;
}

- (BOOL)_shouldTabBarController:(id)a3 insetViewController:(id)a4 orOverlayContent:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = [v8 tabBar];
  if ((*(void *)&self->_navigationControllerFlags & 0xC00) == 0)
  {
    id v14 = [(UIViewController *)self parentViewController];
    int v15 = v14 == v8 ? 1 : [v10 isHidden] ^ 1;

    if (v10)
    {
      if (v15)
      {
        if (([v9 extendedLayoutIncludesOpaqueBars] & 1) != 0
          || [v10 _isTranslucent])
        {
          BOOL v12 = ([v9 edgesForExtendedLayout] & 4) == 0;
          if (!a5) {
            goto LABEL_4;
          }
        }
        else
        {
          BOOL v12 = 1;
          if (!a5) {
            goto LABEL_4;
          }
        }
        BOOL v11 = !v12;
        goto LABEL_3;
      }
    }
  }
  BOOL v11 = 0;
  BOOL v12 = 0;
  if (a5) {
LABEL_3:
  }
    *a5 = v11;
LABEL_4:

  return v12;
}

- (UIToolbar)toolbar
{
  toolbar = self->_toolbar;
  if (!toolbar)
  {
    containerView = self->_containerView;
    if (containerView)
    {
      [(UIView *)containerView bounds];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
    }
    else
    {
      double v6 = *MEMORY[0x1E4F1DB28];
      double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    toolbarClass = self->_toolbarClass;
    if (!toolbarClass) {
      toolbarClass = (objc_class *)objc_opt_class();
    }
    id v14 = (UIToolbar *)objc_msgSend([toolbarClass alloc], "initWithFrame:", v6, v8, v10, v12);
    int v15 = self->_toolbar;
    self->_toolbar = v14;

    [(UINavigationController *)self _configureToolbar];
    toolbar = self->_toolbar;
  }
  return toolbar;
}

- (void)_repositionPaletteWithNavigationBarHidden:(BOOL)a3 duration:(double)a4 shouldUpdateNavigationItems:(BOOL)a5
{
  BOOL v7 = a3;
  [(UIView *)self->_topPalette bounds];
  *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFFFFFELL | v7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__UINavigationController__repositionPaletteWithNavigationBarHidden_duration_shouldUpdateNavigationItems___block_invoke;
  aBlock[3] = &unk_1E52E8950;
  BOOL v18 = v7;
  aBlock[4] = self;
  void aBlock[5] = v9;
  aBlock[6] = v10;
  aBlock[7] = v11;
  aBlock[8] = v12;
  BOOL v19 = a5;
  double v13 = (void (**)(void))_Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __105__UINavigationController__repositionPaletteWithNavigationBarHidden_duration_shouldUpdateNavigationItems___block_invoke_2;
  v15[3] = &unk_1E52E0478;
  BOOL v16 = v7;
  void v15[4] = self;
  id v14 = (void (**)(void *, uint64_t))_Block_copy(v15);
  if (a4 <= 0.0)
  {
    v13[2](v13);
    v14[2](v14, 1);
  }
  else
  {
    +[UIView animateWithDuration:v13 animations:v14 completion:a4];
  }
}

uint64_t __105__UINavigationController__repositionPaletteWithNavigationBarHidden_duration_shouldUpdateNavigationItems___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40)) {
    [*(id *)(*(void *)(a1 + 32) + 1088) _setPalettePinningBarHidden:0];
  }
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _layoutTopViewController];
}

- (BOOL)_shouldToolBar:(id)a3 insetViewController:(id)a4
{
  return [(UINavigationController *)self _shouldToolBar:a3 insetViewController:a4 orOverlayContent:0];
}

- (void)_viewControllerSubtreeDidGainViewController:(id)a3
{
  id v7 = a3;
  id v4 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v7, 1, 0);
  if (v4) {
    [(UINavigationController *)self _handleSubtreeDidGainScrollView:v4];
  }
  uint64_t v5 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v7, 4, 0);
  double v6 = (void *)v5;
  if (v5 && (void *)v5 != v4) {
    [(UINavigationController *)self _handleSubtreeDidGainScrollView:v5];
  }
}

- (id)_toolbarWindowForInterfaceOrientation:(id)a3
{
  return [(UINavigationController *)self _interfaceOrientationWindowForBar:a3 matchingBar:self->_toolbar];
}

- (id)_interfaceOrientationWindowForBar:(id)a3 matchingBar:(id)a4
{
  if (a3 == a4) {
    [(UINavigationController *)self _window];
  }
  else {
  id v4 = [a3 window];
  }
  return v4;
}

- (void)_configureToolbar
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__UINavigationController__configureToolbar__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)_observeScrollViewAlignedContentMarginDidChange:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  uint64_t v5 = __74__UINavigationController__observeScrollViewAlignedContentMarginDidChange___block_invoke;
  double v6 = &unk_1E52E8A88;
  id v7 = self;
  if (__74__UINavigationController__observeScrollViewAlignedContentMarginDidChange___block_invoke((uint64_t)v4, self->_navigationBar))
  {
    [(UINavigationBar *)self->_navigationBar layoutMarginsDidChange];
  }
  if (((unsigned int (*)(void *, UIToolbar *))v5)(v4, self->_toolbar)) {
    [(UIView *)self->_toolbar setNeedsLayout];
  }
}

BOOL __74__UINavigationController__observeScrollViewAlignedContentMarginDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1192) objectForKey:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    double v7 = v6;
    [*(id *)(a1 + 32) _contentMarginForView:v3];
    BOOL v9 = v7 != v8;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (double)_contentMarginForView:(id)a3
{
  id v4 = (UINavigationBar *)a3;
  v16.receiver = self;
  v16.super_class = (Class)UINavigationController;
  [(UIViewController *)&v16 _contentMarginForView:v4];
  double v6 = v5;
  if (self->_navigationBar == v4 || (UINavigationBar *)self->_toolbar == v4)
  {
    if (dyld_program_sdk_at_least())
    {
      double v7 = [(UINavigationController *)self topViewController];
      double v8 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v7, 1, 0);

      if (v8
        || ([(UINavigationController *)self topViewController],
            BOOL v9 = objc_claimAutoreleasedReturnValue(),
            _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v9, 4, 0),
            double v8 = objc_claimAutoreleasedReturnValue(),
            v9,
            v8))
      {
        [v8 _alignedContentMarginGivenMargin:v6];
        double v6 = v10;
        lastContentMarginForView = self->_lastContentMarginForView;
        if (!lastContentMarginForView)
        {
          uint64_t v12 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:2];
          double v13 = self->_lastContentMarginForView;
          self->_lastContentMarginForView = v12;

          lastContentMarginForView = self->_lastContentMarginForView;
        }
        id v14 = [NSNumber numberWithDouble:v6];
        [(NSMapTable *)lastContentMarginForView setObject:v14 forKey:v4];
      }
    }
  }

  return v6;
}

- (void)_positionNavigationBarHidden:(BOOL)a3 edge:(unint64_t)a4
{
  BOOL v5 = a3;
  if (a3)
  {
    if ([(UINavigationController *)self _isNestedNavigationController])
    {
      double v7 = [(UINavigationController *)self _existingNavigationBar];
      char v8 = [v7 isHidden];

      if (v8) {
        return;
      }
    }
  }
  if (!a4)
  {
    if (v5)
    {
      id v14 = [(UINavigationController *)self navigationBar];
      [v14 setAlpha:0.0];
      goto LABEL_12;
    }
LABEL_10:
    if ([(UINavigationController *)self _navigationBarAnimationWasCancelled])
    {
LABEL_13:
      uint64_t v11 = self;
      BOOL v12 = v5;
      unint64_t v13 = a4;
      goto LABEL_14;
    }
    int v15 = [(UINavigationController *)self navigationBar];
    [v15 setAlpha:1.0];

    id v14 = [(UINavigationController *)self navigationBar];
    [v14 _updateBarVisibilityForTopItem];
LABEL_12:

    goto LABEL_13;
  }
  if (a4 != 15) {
    goto LABEL_10;
  }
  BOOL v9 = [(UINavigationController *)self navigationBar];
  double v10 = v9;
  if (!v5)
  {
    [v9 setAlpha:1.0];

    uint64_t v17 = [(UINavigationController *)self navigationBar];
    [v17 _updateBarVisibilityForTopItem];

    goto LABEL_15;
  }
  [v9 setAlpha:0.0];

  uint64_t v11 = self;
  BOOL v12 = 0;
  unint64_t v13 = 15;
LABEL_14:
  [(UINavigationController *)v11 _positionNavigationBarHidden:v12 edge:v13 initialOffset:0.0];
LABEL_15:
  id v18 = [(UINavigationController *)self navigationBar];
  objc_super v16 = [(UINavigationController *)self navigationBar];
  objc_msgSend(v18, "_setBarPosition:", -[UINavigationController _positionForBar:](self, "_positionForBar:", v16));
}

- (BOOL)_navigationBarAnimationWasCancelled
{
  return self->__navigationBarAnimationWasCancelled;
}

- (BOOL)_allowsFreezeLayoutForOrientationChangeOnDismissal
{
  return HIBYTE(*(void *)&self->_navigationControllerFlags) & 1;
}

- (void)_observeScrollViewGeometryAffectingContentBottomDidChange:(id)a3
{
  id v7 = a3;
  if (_UIBarsApplyChromelessEverywhere())
  {
    id v4 = [(UINavigationController *)self _nestedTopViewController];
    _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, 4, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v7)
    {
      double v6 = [(UINavigationController *)self _existingActiveVisibleToolbar];
      [(UINavigationController *)self _updateBackgroundTransitionProgressForScrollView:v7 toolbar:v6];
    }
  }
}

- (BOOL)_navigationBarLayoutIsInInteractiveScroll
{
  return self->_interactiveScrollActive;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
}

- (UIEdgeInsets)_revealableContentPaddingForObservedScrollView:(id)a3 includeContentWithCollapsedAffinity:(BOOL)a4
{
  id v5 = a3;
  double v6 = [(UINavigationController *)self topViewController];
  int v7 = _insetsOfTopViewControllerScrollViewAutomaticallyAdjustedForLargeTitleView(v6);

  double v8 = 0.0;
  if (v7 && _isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets(self, v5))
  {
    [(UINavigationController *)self _heightRangeOfTopViews];
    double v10 = v9;
    double v12 = v9 - v11;
    unint64_t v13 = [(UINavigationController *)self navigationBar];
    [v13 bounds];
    double v15 = v10 - v14;
    [(UIView *)self->_topPalette bounds];
    double v17 = v15 - v16;

    double v18 = 0.0;
    if (v17 >= 0.0) {
      double v18 = v17;
    }
    if (v12 >= v18) {
      double v8 = v18;
    }
    else {
      double v8 = v12;
    }
  }

  double v19 = 0.0;
  double v20 = 0.0;
  double v21 = 0.0;
  double v22 = v8;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v22;
  return result;
}

- (UINavigationController)initWithNavigationBarClass:(Class)navigationBarClass toolbarClass:(Class)toolbarClass
{
  if (dyld_program_sdk_at_least())
  {
    v10.receiver = self;
    v10.super_class = (Class)UINavigationController;
    int v7 = [(UIViewController *)&v10 initWithNibName:0 bundle:0];
  }
  else
  {
    int v7 = [(UINavigationController *)self initWithNibName:0 bundle:0];
  }
  double v8 = v7;
  if (v7)
  {
    if (dyld_program_sdk_at_least()) {
      [(UINavigationController *)v8 _commonNonCoderInit];
    }
    [(UINavigationController *)v8 setNavigationBarClass:navigationBarClass];
    [(UINavigationController *)v8 _setToolbarClass:toolbarClass];
  }
  return v8;
}

- (BOOL)_isPresentationContextByDefault
{
  return 1;
}

- (void)_commonNonCoderInit
{
  self->super._modalTransitionStyle = -1;
  [(UINavigationController *)self _commonInitWithBuiltinTransitionGap:20.0];
}

- (void)setNavigationBarClass:(Class)a3
{
  double v6 = (objc_class *)objc_opt_class();
  if (a3)
  {
    if (([(objc_class *)a3 isSubclassOfClass:v6] & 1) == 0)
    {
      int v7 = [MEMORY[0x1E4F28B00] currentHandler];
      double v8 = NSStringFromClass(a3);
      [v7 handleFailureInMethod:a2, self, @"UINavigationController.m", 2603, @"%@ is not a subclass of UINavigationBar", v8 object file lineNumber description];
    }
  }
  else
  {
    a3 = v6;
  }
  self->_navigationBarClass = a3;
}

- (void)_setToolbarClass:(Class)a3
{
  if (a3 && ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    int v7 = NSStringFromClass(a3);
    [v6 handleFailureInMethod:a2, self, @"UINavigationController.m", 573, @"%@ is not a subclass of UIToolbar", v7 object file lineNumber description];
  }
  self->_toolbarClass = a3;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ((+[UIView _uip_transitionEnabled]() & 1) == 0) {
    [(UINavigationController *)self _updateBarsForCurrentInterfaceOrientation];
  }
  v10.receiver = self;
  v10.super_class = (Class)UINavigationController;
  [(UIViewController *)&v10 viewDidAppear:v3];
  [(_UIViewControllerTransitionConductor *)self->_transitionConductor setHostIsAppearingAnimated:0];
  if (![(UINavigationController *)self needsDeferredTransition]
    && (*(void *)&self->_navigationControllerFlags & 0x4000000000004) == 0)
  {
    id v5 = [(UINavigationController *)self topViewController];
    objc_msgSend(v5, "__viewDidAppear:", v3);

    if (dyld_program_sdk_at_least())
    {
      uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_delegate);
    }
    else
    {
      uint64_t WeakRetained = [(UINavigationController *)self delegate];
    }
    int v7 = (void *)WeakRetained;
    double v8 = [(UINavigationController *)self topViewController];
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if ([(UINavigationController *)self _ignoreFinishingModalTransitionForFiles])
      {
      }
      else
      {
        char v9 = -[UIViewController _doesSelfOrAncestorPassPredicate:]((uint64_t)self, &__block_literal_global_438);

        if (v9)
        {
LABEL_15:

          return;
        }
      }
      double v8 = [(UINavigationController *)self topViewController];
      [v7 navigationController:self didShowViewController:v8 animated:v3];
    }

    goto LABEL_15;
  }
}

uint64_t __40__UINavigationController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isFinishingModalTransition];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIViewController *)self isViewLoaded])
  {
    uint64_t v5 = [(UINavigationController *)self topViewController];
    if (v5)
    {
      double v6 = (void *)v5;
      int v7 = [(UINavigationController *)self topViewController];
      double v8 = [v7 _existingView];
      char v9 = [(UIViewController *)self view];
      char v10 = [v8 isDescendantOfView:v9];

      if ((v10 & 1) == 0)
      {
        [(UINavigationController *)self setNeedsDeferredTransition];
        double v11 = [(UIViewController *)self view];
        [v11 setNeedsLayout];
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)UINavigationController;
  [(UIViewController *)&v17 viewWillAppear:v3];
  [(_UIViewControllerTransitionConductor *)self->_transitionConductor setHostIsAppearingAnimated:v3];
  if (![(UINavigationController *)self needsDeferredTransition]
    || (*(void *)&self->_navigationControllerFlags & 0x1000) != 0)
  {
    double v12 = [(UINavigationController *)self topViewController];
    objc_msgSend(v12, "__viewWillAppear:", v3);

    unint64_t v13 = [(UINavigationController *)self topViewController];

    if (v13)
    {
      if (dyld_program_sdk_at_least())
      {
        uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_delegate);
      }
      else
      {
        uint64_t WeakRetained = [(UINavigationController *)self delegate];
      }
      double v15 = (void *)WeakRetained;
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (-[UIViewController _doesSelfOrAncestorPassPredicate:]((uint64_t)self, &__block_literal_global_418_0) & 1) == 0)
      {
        double v16 = [(UINavigationController *)self topViewController];
        [v15 navigationController:self willShowViewController:v16 animated:v3];
      }
    }
  }
}

uint64_t __41__UINavigationController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPerformingModalTransition];
}

- (BOOL)_ignoreFinishingModalTransitionForFiles
{
  if (qword_1EB25A868 != -1) {
    dispatch_once(&qword_1EB25A868, &__block_literal_global_422);
  }
  return _MergedGlobals_90;
}

- (BOOL)_viewControllerWasSelected
{
  uint64_t v2 = [(UINavigationController *)self topViewController];
  char v3 = [v2 _viewControllerWasSelected];

  return v3;
}

void __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[UIViewController _invalidatePreferences:excluding:](WeakRetained, -1, 0);
    id WeakRetained = v2;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UINavigationController;
  -[UIViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  if ((*(void *)&self->_navigationControllerFlags & 0x4000000001000) == 0)
  {
    uint64_t v5 = [(UINavigationController *)self _viewControllerForDisappearCallback];
    -[UIViewController __viewWillDisappear:]((uint64_t)v5, v3);
  }
}

- (id)_viewControllerForObservableScrollView
{
  if (-[UIViewController _shouldRequestViewControllerForObservableScrollViewFromPresentedViewController](self))
  {
    v6.receiver = self;
    v6.super_class = (Class)UINavigationController;
    BOOL v3 = [(UIViewController *)&v6 _viewControllerForObservableScrollView];
  }
  else
  {
    id v4 = [(UINavigationController *)self _nestedTopViewController];
    BOOL v3 = _viewControllerForObservableScrollViewForViewController(v4);
  }
  return v3;
}

- (void)loadView
{
  [(UIViewController *)self _defaultInitialViewFrame];
  int v7 = -[UILayoutContainerView initWithFrame:]([UILayoutContainerView alloc], "initWithFrame:", v3, v4, v5, v6);
  containerView = self->_containerView;
  self->_containerView = v7;

  [(UIView *)self->_containerView setAutoresizingMask:18];
  [(UIView *)self->_containerView setClipsToBounds:1];
  [(UILayoutContainerView *)self->_containerView setDelegate:self];
  [(UIViewController *)self setView:self->_containerView];
  id v18 = [(UINavigationController *)self navigationBar];
  [(UILayoutContainerView *)self->_containerView addSubview:v18];
  [(UINavigationController *)self _positionNavigationBarHidden:*(_DWORD *)&self->_navigationControllerFlags & 1];
  [(UIView *)self->_containerView bounds];
  unint64_t v13 = -[UIView initWithFrame:]([UINavigationTransitionView alloc], "initWithFrame:", v9, v10, v11, v12);
  navigationTransitionView = self->_navigationTransitionView;
  self->_navigationTransitionView = v13;

  [(UIView *)self->_navigationTransitionView setAutoresizingMask:18];
  [(UIView *)self->_containerView insertSubview:self->_navigationTransitionView belowSubview:v18];
  [(UINavigationController *)self _setupVisualStyle];
  if (![(UINavigationController *)self isToolbarHidden])
  {
    double v15 = self->_containerView;
    double v16 = [(UINavigationController *)self toolbar];
    [(UILayoutContainerView *)v15 addSubview:v16];

    [(UINavigationController *)self _positionToolbarHidden:[(UINavigationController *)self isToolbarHidden]];
  }
  if ([(UIViewController *)self childViewControllersCount]) {
    [(UINavigationController *)self setNeedsDeferredTransition];
  }
  [(UINavigationController *)self _configureBarsAutomaticActions];
  [(UINavigationController *)self _setUpContentFocusContainerGuide];
  [(UINavigationController *)self _setupBackKeyCommand];
  objc_super v17 = [(UIViewController *)self view];
  [(_UIViewControllerTransitionConductor *)self->_transitionConductor setTransitionContainerView:v17];
}

- (void)_configureBarsAutomaticActions
{
  [(UINavigationController *)self _configureKeyboardBarHiding];
  [(UINavigationController *)self _configureBarSwipeGesture];
  [(UINavigationController *)self _configureBarTapGesture];
}

- (void)_setKeyboardAppearedNotificationToken:(id)a3
{
}

- (void)_configureKeyboardBarHiding
{
  if (self->_hidesBarsWhenKeyboardAppears)
  {
    objc_initWeak(&location, self);
    double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    int v7 = __53__UINavigationController__configureKeyboardBarHiding__block_invoke;
    double v8 = &unk_1E52DA728;
    objc_copyWeak(&v9, &location);
    double v4 = [v3 addObserverForName:@"UIKeyboardWillShowNotification" object:0 queue:0 usingBlock:&v5];
    -[UINavigationController _setKeyboardAppearedNotificationToken:](self, "_setKeyboardAppearedNotificationToken:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    [(UINavigationController *)self _setKeyboardAppearedNotificationToken:0];
  }
}

- (void)_configureBarSwipeGesture
{
  barSwipeHideGesture = self->__barSwipeHideGesture;
  if (barSwipeHideGesture)
  {
    if (self->_hidesBarsOnSwipe)
    {
      id v4 = [(UIViewController *)self _existingView];
      [v4 addGestureRecognizer:self->__barSwipeHideGesture];
    }
    else
    {
      id v4 = [(UIGestureRecognizer *)barSwipeHideGesture view];
      [v4 removeGestureRecognizer:self->__barSwipeHideGesture];
    }
  }
}

- (void)_configureBarTapGesture
{
  if (self->__barTapHideGesture)
  {
    double v3 = [(UIViewController *)self _existingView];
    id v5 = v3;
    if (self->_hidesBarsOnTap || self->_hidesBarsWhenVerticallyCompact || self->_hidesBarsOnSwipe)
    {
      [v3 addGestureRecognizer:self->__barTapHideGesture];
    }
    else
    {
      id v4 = [(UIGestureRecognizer *)self->__barTapHideGesture view];
      [v4 removeGestureRecognizer:self->__barTapHideGesture];
    }
  }
}

- (void)_setupVisualStyle
{
  id v4 = +[_UINavigationControllerVisualStyleFactory sharedInstance];
  id v5 = [v4 styleForNavigationController:self];
  visualStyle = self->_visualStyle;
  self->_visualStyle = v5;

  if (!self->_visualStyle)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UINavigationController.m" lineNumber:908 description:@"Visual provider must always be set"];
  }
}

- (void)_setUpContentFocusContainerGuide
{
  v24[4] = *MEMORY[0x1E4F143B8];
  if (!self->_contentFocusContainerGuide)
  {
    double v3 = objc_alloc_init(UIFocusContainerGuide);
    contentFocusContainerGuide = self->_contentFocusContainerGuide;
    self->_contentFocusContainerGuide = v3;

    id v5 = [(UIViewController *)self view];
    [v5 addLayoutGuide:self->_contentFocusContainerGuide];

    [(UILayoutGuide *)self->_contentFocusContainerGuide setIdentifier:@"UINavigationControllerContentFocusContainerGuide"];
    double v16 = (void *)MEMORY[0x1E4F5B268];
    double v22 = [(UILayoutGuide *)self->_contentFocusContainerGuide topAnchor];
    double v23 = [(UINavigationController *)self navigationBar];
    double v21 = [v23 bottomAnchor];
    double v20 = [v22 constraintEqualToAnchor:v21];
    v24[0] = v20;
    id v18 = [(UILayoutGuide *)self->_contentFocusContainerGuide leadingAnchor];
    double v19 = [(UIViewController *)self view];
    objc_super v17 = [v19 leadingAnchor];
    uint64_t v6 = [v18 constraintEqualToAnchor:v17];
    v24[1] = v6;
    id v7 = [(UILayoutGuide *)self->_contentFocusContainerGuide trailingAnchor];
    double v8 = [(UIViewController *)self view];
    id v9 = [v8 trailingAnchor];
    double v10 = [v7 constraintEqualToAnchor:v9];
    v24[2] = v10;
    double v11 = [(UILayoutGuide *)self->_contentFocusContainerGuide bottomAnchor];
    double v12 = [(UIViewController *)self view];
    unint64_t v13 = [v12 bottomAnchor];
    double v14 = [v11 constraintEqualToAnchor:v13];
    v24[3] = v14;
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    [v16 activateConstraints:v15];
  }
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (![(UINavigationController *)self isToolbarHidden])
  {
    [(UIViewController *)self _contentOverlayInsets];
    if (bottom != v8)
    {
      id v9 = [(UINavigationController *)self toolbar];
      uint64_t v10 = [v9 barPosition];
      if (v10 == 4 || v10 == 1) {
        [v9 setNeedsLayout];
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)UINavigationController;
  -[UIViewController _setContentOverlayInsets:](&v11, sel__setContentOverlayInsets_, top, left, bottom, right);
}

- (void)_setupBackKeyCommand
{
  if (!self->_backKeyCommand && dyld_program_sdk_at_least())
  {
    double v3 = +[UIKeyCommand keyCommandWithInput:@"[" modifierFlags:0x100000 action:sel__performBackKeyCommand_];
    backKeyCommand = self->_backKeyCommand;
    self->_backKeyCommand = v3;

    [(UIKeyCommand *)self->_backKeyCommand _setEnumerationPriority:-1];
    id v5 = self->_backKeyCommand;
    [(UIViewController *)self addKeyCommand:v5];
  }
}

uint64_t __114__UINavigationController__updateTopViewFramesToMatchScrollOffsetInViewController_contentScrollView_topLayoutType___block_invoke_2(uint64_t a1, double a2)
{
  CGFloat v3 = *(double *)(a1 + 40);
  v24.origin.CGFloat y = *(CGFloat *)(a1 + 48);
  v24.size.CGFloat width = *(CGFloat *)(a1 + 56);
  CGFloat v4 = *(double *)(a1 + 64);
  CGFloat width = v24.size.width;
  CGFloat y = v24.origin.y;
  CGFloat v5 = *(double *)(a1 + 72);
  CGFloat v6 = *(double *)(a1 + 80);
  CGFloat v7 = *(double *)(a1 + 96);
  CGFloat v20 = *(double *)(a1 + 88);
  v24.origin.double x = v3;
  v24.size.height = v4;
  double MinX = CGRectGetMinX(v24);
  v25.origin.double x = v5;
  v25.origin.CGFloat y = v6;
  v25.size.CGFloat width = v20;
  v25.size.height = v7;
  double v19 = (1.0 - a2) * MinX + CGRectGetMinX(v25) * a2;
  v26.origin.double x = v3;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.height = v4;
  double MinY = CGRectGetMinY(v26);
  CGFloat v15 = v5;
  v27.origin.double x = v5;
  v27.origin.CGFloat y = v6;
  v27.size.CGFloat width = v20;
  v27.size.height = v7;
  double v18 = (1.0 - a2) * MinY + CGRectGetMinY(v27) * a2;
  v28.origin.double x = v3;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.height = v4;
  double v9 = CGRectGetWidth(v28);
  v29.origin.double x = v5;
  v29.origin.CGFloat y = v6;
  v29.size.CGFloat width = v20;
  v29.size.height = v7;
  double v10 = (1.0 - a2) * v9 + CGRectGetWidth(v29) * a2;
  v30.origin.double x = v3;
  v30.size.CGFloat width = width;
  v30.origin.CGFloat y = y;
  v30.size.height = v4;
  double Height = CGRectGetHeight(v30);
  v31.origin.double x = v15;
  v31.origin.CGFloat y = v6;
  v31.size.CGFloat width = v20;
  v31.size.height = v7;
  double v12 = CGRectGetHeight(v31);
  unint64_t v13 = *(void **)(*(void *)(a1 + 32) + 984);
  return objc_msgSend(v13, "setFrame:", v19, v18, v10, (1.0 - a2) * Height + v12 * a2);
}

- (void)_updateContainersForStackChange
{
  [(UINavigationController *)self _updateEnclosingSplitViewControllerForStackChange];
  [(UINavigationController *)self _updateEnclosingTabBarControllerForStackChange];
}

- (void)_updateEnclosingSplitViewControllerForStackChange
{
  if ((*((unsigned char *)&self->_navigationControllerFlags + 8) & 2) == 0)
  {
    id v3 = [(UIViewController *)self _splitViewControllerEnforcingClass:1];
    [v3 _navigationControllerDidUpdateStack:self];
  }
}

- (void)_navigationBar:(id)a3 topItemUpdatedLargeTitleDisplayMode:(id)a4
{
  id v10 = a4;
  CGFloat v5 = [(UINavigationController *)self _nestedTopViewController];
  id v6 = [v5 navigationItem];

  if (v6 == v10)
  {
    CGFloat v7 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v5, 1, 0);
    if (v7 && _isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets(self, v7))
    {
      double v8 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v5, 4, 0);

      if (v7 == v8) {
        uint64_t v9 = 5;
      }
      else {
        uint64_t v9 = 1;
      }
      [(UINavigationController *)self _updateScrollViewObservationFlagsForScrollView:v7 navigationItem:v10 forEdges:v9];
    }
  }
}

- (id)_keyboardAnimationStyle
{
  id v3 = [(UINavigationController *)self _transitionAnimationContext];
  if (v3)
  {
    if ([(UINavigationController *)self _isViewControllerFullWidth])
    {
      CGFloat v4 = +[UIDevice currentDevice];
      uint64_t v5 = [v4 userInterfaceIdiom];

      BOOL v6 = (v5 & 0xFFFFFFFFFFFFFFFBLL) != 1;
    }
    else
    {
      BOOL v6 = 0;
    }
    double v8 = +[_UIViewControllerKeyboardAnimationStyle animationStyleWithContext:v3 useCustomTransition:v6];
    uint64_t v9 = +[UIDevice currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1
      || (-[UIViewController _parentViewController]((id *)&self->super.super.super.isa),
          objc_super v11 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v11,
          (isKindOfClass & 1) != 0))
    {
      [v8 setOutDirection:0];
    }
  }
  else
  {
    CGFloat v7 = -[UIViewController _keyboardSceneDelegate](self);
    double v8 = [v7 nextAnimationStyle];
  }
  return v8;
}

- (void)transitionConductor:(id)a3 didStartDeferredTransition:(BOOL)a4 context:(id)a5
{
  id v42 = a3;
  id v8 = a5;
  if (v8
    || ([v42 transitionContext],
        double v32 = objc_claimAutoreleasedReturnValue(),
        v32,
        !v32))
  {
    if (a4)
    {
      uint64_t v9 = [v8 fromViewController];
      if ((*(void *)&self->_navigationControllerFlags & 0xF0) == 0x20
        || (*(void *)&self->_navigationControllerFlags & 0x2000000000000) != 0)
      {
        if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_NavigationControllerShouldMaintainOverrideTraitCollectionForPoppingViewController, @"NavigationControllerShouldMaintainOverrideTraitCollectionForPoppingViewController") & 1) != 0|| byte_1EB25706C)
        {
          objc_super v11 = [(UIViewController *)self overrideTraitCollectionForChildViewController:v9];
          overrideTraitCollectionForPoppingViewControler = self->_overrideTraitCollectionForPoppingViewControler;
          self->_overrideTraitCollectionForPoppingViewControler = v11;

          objc_msgSend(v9, "set_departingParentViewController:", self);
        }
        [(UINavigationController *)self removeChildViewController:v9 notifyDidMove:0];
      }
      unint64_t v13 = [(UINavigationController *)self topViewController];
      double v14 = [v13 childModalViewController];

      if (v14)
      {
        CGFloat v15 = [v13 view];
        double v16 = [v15 superview];

        if (v16)
        {
          [v16 bounds];
          double v18 = v17;
          double v20 = v19;
          double v22 = v21;
          double v24 = v23;
          CGRect v25 = [v13 view];
          objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

          CGRect v26 = [v13 presentedViewController];
          CGRect v27 = [v26 presentationController];
          CGRect v28 = [v27 containerView];
          objc_msgSend(v28, "setFrame:", v18, v20, v22, v24);

          CGRect v29 = [v13 presentedViewController];
          CGRect v30 = [v29 presentationController];
          CGRect v31 = [v30 containerView];
          [v16 addSubview:v31];
        }
      }
      [(UINavigationController *)self _notifyTransitionBegan:v8];
    }
    if ((*(void *)&self->_navigationControllerFlags & 4) == 0) {
      -[UINavigationController _clearLastOperation](self);
    }
    if (!a4) {
      [(UINavigationController *)self _layoutTopViewController];
    }
    if ((*(void *)&self->_navigationControllerFlags & 2) != 0)
    {
      BOOL v33 = [(UINavigationController *)self topViewController];
      int v34 = [v33 toolbarItems];
      uint64_t v35 = [v34 count];

      if (v35)
      {
        CGFloat v36 = [(UINavigationController *)self _existingToolbar];
        double v37 = [(UINavigationController *)self topViewController];
        int v38 = [v37 toolbarItems];
        [v36 setItems:v38 animated:(*(void *)&self->_navigationControllerFlags >> 8) & 1];
      }
    }
    double v39 = [(UINavigationController *)self _updateNavigationBarHandler];

    if (v39)
    {
      double v40 = [(UINavigationController *)self _updateNavigationBarHandler];
      [(UINavigationController *)self _setUpdateNavigationBarHandler:0];
      v40[2](v40);
      if ([(UINavigationController *)self isInteractiveTransition])
      {
        double v41 = [(UINavigationController *)self _navigationBarForNestedNavigationController];
        [v41 _beginInteractiveTransition];
      }
    }
    *(void *)&self->_navigationControllerFlags &= ~0x4000000000000000uLL;
  }
}

- (void)setDisappearingViewController:(id)a3
{
}

- (id)_transitionAnimationContext
{
  return [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionContext];
}

- (void)_startPaletteTransitionIfNecessary:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(UINavigationController *)self _isNestedNavigationController]) {
    goto LABEL_5;
  }
  CGFloat v7 = [(UINavigationController *)self _outermostNavigationController];
  if (v7 == self)
  {

LABEL_5:
    *(void *)&self->_navigationControllerFlags &= ~8uLL;
    [(UIView *)self->_paletteClippingView setClipsToBounds:1];
    if ([(UINavigationController *)self isBuiltinTransition]) {
      BOOL v9 = [(UINavigationController *)self isCustomTransition];
    }
    else {
      BOOL v9 = 0;
    }
    BOOL v10 = [(UINavigationController *)self isInteractiveTransition];
    objc_super v11 = [(UINavigationController *)self _navigationBarForNestedNavigationController];
    if (!self->_topPalette) {
      goto LABEL_68;
    }
    BOOL v12 = [(UINavigationController *)self _isNavigationBarVisible];
    BOOL v13 = [(_UINavigationControllerPalette *)self->_topPalette isAttached];
    if (v12)
    {
      if (!v13
        || ([(UIView *)self->_topPalette superview],
            double v14 = objc_claimAutoreleasedReturnValue(),
            v14,
            v14))
      {
        if (![(_UINavigationControllerPalette *)self->_topPalette isAttached]
          || [(_UINavigationControllerPalette *)self->_topPalette isPinned])
        {
          if ([(_UINavigationControllerPalette *)self->_topPalette isAttached])
          {
            BOOL v15 = 0;
            if (v9 && v10)
            {
              [v11 frame];
              double MaxY = CGRectGetMaxY(v93);
              double v17 = [v11 layer];
              double v18 = [v17 presentationLayer];
              [v18 frame];
              BOOL v15 = MaxY != CGRectGetMaxY(v94);
            }
            goto LABEL_34;
          }
          goto LABEL_32;
        }
        [(UINavigationController *)self detachPalette:self->_topPalette isInPaletteTransition:1];
LABEL_38:
        BOOL v63 = v10;
        BOOL v65 = v9;
        [(UINavigationDeferredTransitionContext *)self->_deferredTransitionContext setOutgoingTopPalette:self->_topPalette];
        int v23 = 0;
        char v64 = 1;
        goto LABEL_39;
      }
      goto LABEL_31;
    }
    if (v13)
    {
      uint64_t v19 = [(UIView *)self->_topPalette superview];
      if (v19)
      {
        double v20 = (void *)v19;
        if (![(_UINavigationControllerPalette *)self->_topPalette isPinned]
          && [(UINavigationController *)self _isTransitioning])
        {

LABEL_28:
          if (![(_UINavigationControllerPalette *)self->_topPalette isPinned]) {
            goto LABEL_38;
          }
          BOOL v63 = v10;
          char v64 = 0;
          BOOL v65 = v9;
          int v23 = 0;
LABEL_39:
          id v42 = [(UIViewController *)self view];
          int v43 = [v42 _shouldReverseLayoutDirection];

          int64_t v44 = [(UINavigationController *)self lastOperation];
          uint64_t v45 = 8;
          if (v43) {
            uint64_t v46 = 2;
          }
          else {
            uint64_t v46 = 8;
          }
          if (!v43) {
            uint64_t v45 = 2;
          }
          if (v44 == 1) {
            uint64_t v47 = v46;
          }
          else {
            uint64_t v47 = v45;
          }
          double v48 = [(UIView *)self->_topPalette superview];
          BOOL v49 = v48 == 0;

          v83[0] = 0;
          v83[1] = v83;
          v83[2] = 0x2020000000;
          char v84 = 0;
          if ([(_UINavigationControllerPalette *)self->_topPalette _supportsSpecialSearchBarTransitions])
          {
            topPalette = self->_topPalette;
          }
          else
          {
            topPalette = 0;
          }
          double v51 = topPalette;
          char v52 = v51;
          if (v23) {
            double v53 = 1.0;
          }
          else {
            double v53 = 0.0;
          }
          [(_UINavigationControllerPalette *)v51 _setShadowAlpha:v53];
          if (v23) {
            double v54 = 0.0;
          }
          else {
            double v54 = 1.0;
          }
          [(UINavigationBar *)self->_navigationBar _setShadowAlpha:v54];
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_5;
          aBlock[3] = &unk_1E52E8C58;
          aBlock[4] = self;
          long long v55 = v52;
          v75 = v55;
          uint64_t v77 = v83;
          uint64_t v56 = v11;
          id v57 = v11;
          char v79 = v64;
          char v80 = v23;
          BOOL v81 = v65;
          id v76 = v57;
          uint64_t v78 = v47;
          BOOL v82 = v49;
          CGRect v58 = (void (**)(void *, void))_Block_copy(aBlock);
          if (v6 && v4)
          {
            double v59 = self->_topPalette;
            v66[0] = MEMORY[0x1E4F143A8];
            v66[1] = 3221225472;
            v66[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_7;
            v66[3] = &unk_1E52E8D70;
            char v71 = v23;
            id v67 = v57;
            CGFloat v68 = self;
            BOOL v72 = v65;
            double v69 = v83;
            uint64_t v70 = v47;
            BOOL v73 = v63;
            [v6 animateAlongsideTransitionInView:v59 animation:v66 completion:v58];
            objc_super v11 = v56;
            if (self->_transitioningTopPalette)
            {
              double v60 = [v6 _alongsideAnimationViews];
              [v60 addObject:self->_transitioningTopPalette];
            }
          }
          else
          {
            [(UINavigationController *)self _positionPaletteHidden:v23 ^ 1u edge:v47];
            objc_super v11 = v56;
            v58[2](v58, 0);
            double v61 = self->_topPalette;
            if (v61
              && [(_UINavigationControllerPalette *)v61 isVisibleWhenPinningBarIsHidden]&& [(_UINavigationControllerPalette *)self->_topPalette _isPalettePinningBarHidden])
            {
              double v62 = self->_topPalette;
              [(UIView *)v62 frame];
              [(_UINavigationControllerPalette *)v62 _resetConstraintConstants:CGRectGetMinY(v96)];
            }
          }

          _Block_object_dispose(v83, 8);
          goto LABEL_68;
        }
        BOOL v21 = [(_UINavigationControllerPalette *)self->_topPalette isVisibleWhenPinningBarIsHidden];

        if (!v21) {
          goto LABEL_28;
        }
      }
    }
    if ([(_UINavigationControllerPalette *)self->_topPalette isAttached])
    {
      double v22 = [(UIView *)self->_topPalette superview];
      if (v22)
      {
      }
      else if ([(_UINavigationControllerPalette *)self->_topPalette isVisibleWhenPinningBarIsHidden])
      {
LABEL_31:
        BOOL v63 = v10;
        char v64 = 0;
        BOOL v65 = v9;
        int v23 = 1;
        goto LABEL_39;
      }
    }
LABEL_32:
    if ([(_UINavigationControllerPalette *)self->_topPalette isAttached])
    {
      BOOL v15 = 0;
LABEL_34:
      if (!v6)
      {
LABEL_68:

        goto LABEL_69;
      }
      if (v15)
      {
        double v24 = [v11 layer];
        CGRect v25 = [v24 presentationLayer];
        [v25 frame];
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        CGFloat v31 = v30;
        CGFloat v33 = v32;

        [(UIView *)self->_topPalette frame];
        uint64_t v35 = v34;
        uint64_t v37 = v36;
        uint64_t v39 = v38;
        v95.origin.double x = v27;
        v95.origin.CGFloat y = v29;
        v95.size.CGFloat width = v31;
        v95.size.height = v33;
        CGFloat v40 = CGRectGetMaxY(v95);
        v87[0] = MEMORY[0x1E4F143A8];
        v87[1] = 3221225472;
        v87[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke;
        v87[3] = &unk_1E52E8C08;
        v87[4] = self;
        id v88 = v11;
        uint64_t v89 = v35;
        CGFloat v90 = v40;
        uint64_t v91 = v37;
        uint64_t v92 = v39;
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_3;
        v86[3] = &unk_1E52E8C30;
        v86[4] = self;
        v86[5] = v35;
        *(CGFloat *)&v86[6] = v40;
        v86[7] = v37;
        v86[8] = v39;
        [v6 animateAlongsideTransition:v87 completion:v86];

        goto LABEL_68;
      }
LABEL_67:
      [(_UINavigationControllerPalette *)self->_topPalette _setRestartPaletteTransitionIfNecessary:1];
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_4;
      v85[3] = &unk_1E52DA598;
      v85[4] = self;
      [v6 animateAlongsideTransition:0 completion:v85];
      goto LABEL_68;
    }
    double v41 = [(UIView *)self->_topPalette superview];

    if (!v41)
    {
      if (!v6) {
        goto LABEL_68;
      }
      goto LABEL_67;
    }
    goto LABEL_38;
  }
  id v8 = v7;
  [(UINavigationController *)v7 _startPaletteTransitionIfNecessary:v6 animated:v4];

LABEL_69:
}

- (void)transitionConductorWillStartImmediateTransition:(id)a3
{
  *(void *)&self->_navigationControllerFlags |= 4uLL;
  id v3 = [(UINavigationController *)self _outermostNavigationController];
  v3[154] |= 8uLL;
}

- (void)transitionConductorDidStartImmediateTransition:(id)a3
{
}

- (void)transitionConductor:(id)a3 willTransitionFromViewController:(id)a4 toViewController:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  [(UINavigationController *)self _initializeNavigationDeferredTransitionContextIfNecessary];
  id v8 = [(UIViewController *)self _focusSystem];
  if (v12)
  {
    if ([v12 isViewLoaded])
    {
      BOOL v9 = [v12 view];
      int v10 = [v8 _focusedItemIsContainedInEnvironment:v9 includeSelf:1];

      if (v10)
      {
        objc_super v11 = [v8 focusedItem];
        [(UINavigationController *)self _rememberFocusedItem:v11 forViewController:v12];
      }
    }
  }
  [(UINavigationController *)self _ensureToViewControllersViewIsLoaded:v7];
}

- (id)transitionConductor:(id)a3 retargetedToViewControllerForTransitionFromViewController:(id)a4 toViewController:(id)a5 transition:(int)a6
{
  id v46 = a3;
  BOOL v9 = a4;
  int v10 = a5;
  unint64_t v11 = *(void *)&self->_navigationControllerFlags & 0x100;
  uint64_t v12 = (*(void *)&self->_navigationControllerFlags >> 8) & 1;
  int v13 = [(UIViewController *)self _appearState];
  unsigned int v14 = v13 - 3;
  if (v9 == v10 || v14 < 0xFFFFFFFE) {
    goto LABEL_19;
  }
  int v15 = v13;
  if (v13 == 1) {
    uint64_t v16 = [v46 hostIsAppearingAnimated];
  }
  else {
    uint64_t v16 = v11 >> 8;
  }
  if ((*(void *)&self->_navigationControllerFlags & 0x1000) == 0)
  {
    double v17 = v9;
    if (!v11)
    {
      double v17 = v9;
      if ((*(void *)&self->_navigationControllerFlags & 0xF0) == 0x20)
      {
        double v18 = [v9 parentViewController];

        double v17 = v9;
        if (!v18)
        {
          if (v9)
          {
            __int16 v20 = v9[192];
            v9[192] = v20 | 0x100;
            [v9 setParentViewController:self];
            v9[192] = v9[192] & 0xFEFF | v20 & 0x100;
            [v9 beginAppearanceTransition:0 animated:v16];
            __int16 v21 = v9[192];
            v9[192] = v21 | 0x100;
            [v9 setParentViewController:0];
            v9[192] = v9[192] & 0xFEFF | v21 & 0x100;
            uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
            goto LABEL_17;
          }
          double v17 = 0;
        }
      }
    }
    [v17 beginAppearanceTransition:0 animated:v16];
  }
  uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  if (!v9 && v15 == 1)
  {
    uint64_t v12 = v16 != 0;
    if ((navigationControllerFlags & 0x4000000001000) == 0) {
      objc_msgSend(v10, "__viewWillAppear:", v16);
    }
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v12 = v16 != 0;
  if ((navigationControllerFlags & 0x1000) == 0) {
    [v10 beginAppearanceTransition:1 animated:v16];
  }
LABEL_19:
  if (dyld_program_sdk_at_least())
  {
    uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_delegate);
  }
  else
  {
    uint64_t WeakRetained = [(UINavigationController *)self delegate];
  }
  int v23 = (void *)WeakRetained;
  if (v14 >= 0xFFFFFFFE && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v24 = [(UINavigationController *)self topViewController];
    if (v24) {
      [v23 navigationController:self willShowViewController:v24 animated:v11 != 0];
    }

    int v25 = 1;
  }
  else
  {
    int v25 = 0;
  }
  uint64_t v26 = [(UINavigationController *)self topViewController];
  if ((_WORD *)v26 == v10)
  {
    id v29 = v10;
  }
  else
  {
    id v27 = (id)v26;
    do
    {
      double v28 = [v10 parentViewController];
      [v10 didMoveToParentViewController:v28];

      [v10 cancelBeginAppearanceTransition];
      [v27 loadViewIfRequired];
      id v29 = v27;

      [v29 beginAppearanceTransition:1 animated:v12];
      id v27 = [(UINavigationController *)self topViewController];

      if (v27) {
        int v30 = v25;
      }
      else {
        int v30 = 0;
      }
      if (v30 == 1) {
        [v23 navigationController:self willShowViewController:v27 animated:v11 != 0];
      }
      int v10 = v29;
    }
    while (v29 != v27);
  }
  [(UINavigationController *)self willShowViewController:v29 animated:v11 != 0];
  [(UINavigationController *)self _privateWillShowViewController:v29];
  CGFloat v31 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  double v32 = v31;
  if (v9) {
    [v31 setObject:v9 forKey:@"UINavigationControllerLastVisibleViewController"];
  }
  if (!v29)
  {
    uint64_t v37 = [NSNumber numberWithBool:v11 != 0];
    [v32 setObject:v37 forKey:@"UINavigationControllerTransitionIsAnimated"];

    uint64_t v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v35 postNotificationName:@"UINavigationControllerWillShowViewControllerNotification" object:self userInfo:v32];
    goto LABEL_47;
  }
  [v32 setObject:v29 forKey:@"UINavigationControllerNextVisibleViewController"];
  CGFloat v33 = [NSNumber numberWithBool:v11 != 0];
  [v32 setObject:v33 forKey:@"UINavigationControllerTransitionIsAnimated"];

  uint64_t v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v34 postNotificationName:@"UINavigationControllerWillShowViewControllerNotification" object:self userInfo:v32];

  if (a6)
  {
    *(void *)&self->_navigationControllerFlags |= 0x200uLL;
    uint64_t v35 = -[UIViewController _keyboardSceneDelegate](self);
    uint64_t v36 = [(UINavigationController *)self _keyboardAnimationStyle];
    [v35 pushAnimationStyle:v36];

LABEL_47:
    goto LABEL_48;
  }
  uint64_t v38 = [(UINavigationController *)self _window];
  int v39 = [v38 isTrackingKeyboard];

  if (v39)
  {
    if (!self->_keyboardLayoutGuideTransitionAssertion) {
      goto LABEL_46;
    }
    if (os_variant_has_internal_diagnostics())
    {
      int64_t v44 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)double v48 = 0;
        _os_log_fault_impl(&dword_1853B0000, v44, OS_LOG_TYPE_FAULT, "Should not already have a KLG transition assertion when starting a non-animated navigation transition", v48, 2u);
      }
    }
    else
    {
      int v43 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &transitionConductor_retargetedToViewControllerForTransitionFromViewController_toViewController_transition____s_category)+ 8);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v43, OS_LOG_TYPE_ERROR, "Should not already have a KLG transition assertion when starting a non-animated navigation transition", buf, 2u);
      }
    }
    if (!self->_keyboardLayoutGuideTransitionAssertion)
    {
LABEL_46:
      uint64_t v35 = [(UINavigationController *)self _window];
      CGFloat v40 = [v35 _obtainKeyboardLayoutGuideTransitionAssertionForReason:@"UINavigationController unanimated transition"];
      keyboardLayoutGuideTransitionAssertion = self->_keyboardLayoutGuideTransitionAssertion;
      self->_keyboardLayoutGuideTransitionAssertion = v40;

      goto LABEL_47;
    }
  }
LABEL_48:
  [(UINavigationController *)self _presentationTransitionUnwrapViewController:v29];

  return v29;
}

- (void)willShowViewController:(id)a3 animated:(BOOL)a4
{
  if ((*(void *)&self->_navigationControllerFlags & 2) != 0)
  {
    BOOL v4 = a4;
    transitionConductor = self->_transitionConductor;
    id v7 = a3;
    uint64_t v8 = [(_UIViewControllerTransitionConductor *)transitionConductor shouldAnimateBottomBarVisibility] & v4;
    id v10 = [(UINavigationController *)self _existingToolbar];
    BOOL v9 = [v7 toolbarItems];

    [v10 setItems:v9 animated:v8];
  }
}

- (CGRect)transitionConductor:(id)a3 frameForWrapperViewForViewController:(id)a4
{
  [(UINavigationController *)self _frameForWrapperViewForViewController:a4];
  result.size.height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)transitionConductor:(id)a3 frameForViewController:(id)a4
{
  [(UINavigationController *)self _frameForViewController:a4];
  result.size.height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.double x = v4;
  return result;
}

- (void)transitionConductor:(id)a3 didEndTransitionFromView:(id)a4 toView:(id)a5
{
}

- (BOOL)isInteractiveTransition
{
  return [(_UIViewControllerTransitionConductor *)self->_transitionConductor isInteractiveTransition];
}

- (BOOL)isBuiltinTransition
{
  return (*(void *)&self->_navigationControllerFlags >> 17) & 1;
}

- (void)_notifyTransitionBegan:(id)a3
{
  id v4 = [a3 toViewController];
  [v4 _prepareForContainerTransition:self];
}

- (void)_initializeNavigationDeferredTransitionContextIfNecessary
{
  if ([(UINavigationController *)self needsDeferredTransition]
    && !self->_deferredTransitionContext)
  {
    id v3 = (UINavigationDeferredTransitionContext *)objc_opt_new();
    deferredTransitionContext = self->_deferredTransitionContext;
    self->_deferredTransitionContext = v3;
  }
}

- (void)_ensureToViewControllersViewIsLoaded:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v4 topViewController];
    [v3 loadViewIfNeeded];
  }
  [v4 loadViewIfNeeded];
}

- (void)_navigationBarDidChangeStyle:(id)a3
{
  if (self->_navigationBar == a3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    void v4[2] = __55__UINavigationController__navigationBarDidChangeStyle___block_invoke;
    v4[3] = &unk_1E52D9F70;
    v4[4] = self;
    +[UIView performWithoutAnimation:v4];
    -[UIViewController _invalidateBehaviorPreferences](self);
  }
}

- (id)_uip_tabElement
{
  v6.receiver = self;
  v6.super_class = (Class)UINavigationController;
  id v3 = [(UIViewController *)&v6 _uip_tabElement];
  if (!v3)
  {
    id v4 = [(UINavigationController *)self bottomViewController];
    id v3 = objc_msgSend(v4, "_uip_tabElement");
  }
  return v3;
}

- (id)tabBarItem
{
  v12.receiver = self;
  v12.super_class = (Class)UINavigationController;
  id v3 = [(UIViewController *)&v12 tabBarItem];
  uint64_t v4 = [v3 image];
  if (v4
    || ([v3 selectedImage], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v3 unselectedImage], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v5 = (void *)v4;
LABEL_5:
    id v6 = v3;
LABEL_6:

    id v3 = v6;
    goto LABEL_7;
  }
  if (([v3 isSystemItem] & 1) == 0)
  {
    uint64_t v8 = [(UINavigationController *)self bottomViewController];
    double v5 = [v8 tabBarItem];

    BOOL v9 = [v5 image];
    if (v9
      || ([v5 selectedImage], (BOOL v9 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([v5 unselectedImage], (BOOL v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else if (([v5 isSystemItem] & 1) == 0)
    {
      goto LABEL_5;
    }
    id v6 = v5;

    id v10 = [(UIViewController *)self _fallbackTabElementCreateIfNeeded:0];
    unint64_t v11 = v10;
    if (v10) {
      [v10 _setBridgedTabBarItem:v6];
    }

    goto LABEL_6;
  }
LABEL_7:
  return v3;
}

- (void)updateTabBarItemForViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(UINavigationController *)self bottomViewController];

  if (v5 == v4)
  {
    -[UIViewController _parentViewController]((id *)&self->super.super.super.isa);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 updateTabBarItemForViewController:self];
  }
}

- (id)childViewControllerForStatusBarStyle
{
  if ([(UINavigationController *)self isNavigationBarHidden])
  {
    id v3 = [(UINavigationController *)self topViewController];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  v3.receiver = self;
  v3.super_class = (Class)UINavigationController;
  return [(UIViewController *)&v3 preferredStatusBarStyle];
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  objc_super v3 = [(UINavigationController *)self topViewController];
  id v4 = [v3 _effectiveScreenEdgesDeferringSystemGesturesViewController];
  unint64_t v5 = [v4 preferredScreenEdgesDeferringSystemGestures];

  if ((*((unsigned char *)&self->_navigationControllerFlags + 8) & 4) != 0)
  {
    id v6 = [(UIViewController *)self _existingView];
    int v7 = [v6 _shouldReverseLayoutDirection];

    uint64_t v8 = 2;
    if (v7) {
      uint64_t v8 = 8;
    }
    v5 |= v8;
  }
  return v5;
}

- (BOOL)_isLayingOutTopViewController
{
  return (*(void *)&self->_navigationControllerFlags >> 54) & 1;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  BOOL v4 = animated;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = viewController;
  if (qword_1EB25A920 != -1) {
    dispatch_once(&qword_1EB25A920, &__block_literal_global_1759_0);
  }
  if (byte_1EB25A81C)
  {
    int v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("NavigationControllerVerboseLoggingForStrictRepeatedPushAssertion", &qword_1EB25A888)+ 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (v4) {
        uint64_t v8 = @"YES";
      }
      else {
        uint64_t v8 = @"NO";
      }
      BOOL v9 = (void *)MEMORY[0x1E4F29060];
      id v10 = v7;
      unint64_t v11 = [v9 callStackSymbols];
      *(_DWORD *)buf = 138413058;
      uint64_t v16 = self;
      __int16 v17 = 2112;
      double v18 = v6;
      __int16 v19 = 2112;
      __int16 v20 = v8;
      __int16 v21 = 2112;
      double v22 = v11;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "-pushViewController:animated: sent to %@ passing %@, animated = %@,\n%@", buf, 0x2Au);
    }
  }
  uint64_t v12 = [(UINavigationController *)self _effectiveTransitionForTransition:v4];
  if ([(UIViewController *)v6 useLayoutToLayoutNavigationTransitions])
  {
    int v13 = [(UINavigationController *)self topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Attempt to push collection view controller %@ on %@ with layout to layout transitions but the top view controller is not a UICollectionViewController!", v6, self format];
    }
  }
  if ([(UIViewController *)v6 useLayoutToLayoutNavigationTransitions]) {
    [(UINavigationController *)self _prepareCollectionViewControllerForSharing:v6];
  }
  [(UINavigationController *)self pushViewController:v6 transition:v12 forceImmediate:+[UIViewController _shouldDeferTransitions] ^ 1];
}

- (void)_commonInitWithBuiltinTransitionGap:(double)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  self->_navigationBarClass = (Class)objc_opt_class();
  *(void *)&self->super._viewControllerFlags = *(void *)&self->super._viewControllerFlags & 0xFFFFFFFFFFEFFBFFLL | 0x400;
  self->_double builtinTransitionGap = a3;
  *(void *)&self->_navigationControllerFlags &= ~0x4000000000uLL;
  int v5 = dyld_program_sdk_at_least();
  uint64_t v6 = 0x8000000000;
  if (!v5) {
    uint64_t v6 = 0;
  }
  *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFF7FFFFFFFFFLL | v6;
  if ((_UIInternalPreferenceUsesDefault_0(&_MergedGlobals_89, @"PositionBarsExclusivelyWithSafeArea") & 1) == 0
    && !byte_1EB25707C)
  {
    goto LABEL_9;
  }
  int v7 = self;
  if (qword_1EB25A900 != -1) {
    dispatch_once(&qword_1EB25A900, &__block_literal_global_1729);
  }
  if (byte_1EB25A819)
  {

LABEL_9:
    BOOL v8 = (byte_1EB257084 != 0) & ~_UIInternalPreferenceUsesDefault_0(&dword_1EB257080, @"ForcePositionBarsExclusivelyWithSafeArea");
    goto LABEL_10;
  }
  if (qword_1EB25A8F8)
  {
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  BOOL v8 = 1;
LABEL_10:
  self->__positionBarsExclusivelyWithSafeArea = v8;
  BOOL v9 = [[_UIViewControllerTransitionConductor alloc] initWithDelegate:self transitionManager:self->_transitionManager];
  transitionConductor = self->_transitionConductor;
  self->_transitionConductor = v9;

  [(_UIViewControllerTransitionConductor *)self->_transitionConductor setNeedsDeferredTransition:[(UIViewController *)self childViewControllersCount] != 0];
  [(_UIViewControllerTransitionConductor *)self->_transitionConductor setDeferredTransitionType:0];
  if (!qword_1EB25A820)
  {
    qword_1EB25A820 = +[UINavigationController instanceMethodForSelector:sel_navigationBar];
    qword_1EB25A828 = +[UINavigationController instanceMethodForSelector:sel_toolbar];
  }
  uint64_t v11 = [(UINavigationController *)self methodForSelector:sel_navigationBar];
  if (v11)
  {
    if (v11 != qword_1EB25A820)
    {
      uint64_t v12 = [(UINavigationController *)self navigationBar];
      objc_opt_class();
      char v13 = objc_opt_isKindOfClass();

      if ((v13 & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"An override of -[UINavigationController navigationBar] is returning an object that is not a kind of UINavigationBar"];
      }
    }
  }
  uint64_t v14 = [(UINavigationController *)self methodForSelector:sel_toolbar];
  if (v14)
  {
    if (v14 != qword_1EB25A828)
    {
      int v15 = [(UINavigationController *)self toolbar];
      objc_opt_class();
      char v16 = objc_opt_isKindOfClass();

      if ((v16 & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"An override of -[UINavigationController toolbar] is returning an object that is not a kind of UIToolbar"];
      }
    }
  }
  v20[0] = 0x1ED3F5A30;
  __int16 v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v18 = [(UIViewController *)self _registerForTraitTokenChanges:v17 withTarget:self action:sel__userInterfaceIdiomChanged];
}

- (void)_immediatelyApplyViewControllers:(id)a3 transition:(int)a4 animated:(BOOL)a5 operation:(int64_t)a6
{
  BOOL v6 = a5;
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v103 = a3;
  unint64_t navigationControllerFlags = (unint64_t)self->_navigationControllerFlags;
  BOOL v8 = [(UIViewController *)self _existingView];
  uint64_t v92 = [v8 window];

  BOOL v105 = v6 && [(UINavigationController *)self _isAppearingOrAppearedCheck];
  CGRect v93 = [(UIViewController *)self childViewControllers];
  if (a6 == 3)
  {
    uint64_t v11 = v103;
    id v9 = v103;
    id v10 = v93;
  }
  else
  {
    id v9 = [v103 arrayByExcludingObjectsInArray:v93];
    id v10 = [v93 arrayByExcludingObjectsInArray:v103];
    uint64_t v11 = v103;
  }
  CGFloat v90 = v9;
  uint64_t v91 = [v9 count];
  uint64_t v12 = [v11 lastObject];
  CGRect v96 = [(UINavigationController *)self topViewController];

  if (v96 == v12)
  {
    BOOL v99 = v92 == 0;
    *(void *)&self->_navigationControllerFlags &= ~0x100uLL;
    [(_UIViewControllerTransitionConductor *)self->_transitionConductor setDeferredTransitionType:0];
    BOOL v105 = 0;
    int v98 = 0;
    BOOL v89 = a4 != 0;
  }
  else if (v92)
  {
    char v13 = [(UINavigationController *)self disappearingViewController];
    if (v13)
    {

      BOOL v99 = 0;
      BOOL v89 = 0;
      int v98 = 0;
    }
    else
    {
      BOOL v99 = 0;
      if ([(UINavigationController *)self needsDeferredTransition]
        || (navigationControllerFlags & 4) != 0)
      {
        int v15 = 0;
        BOOL v89 = 0;
      }
      else
      {
        uint64_t v14 = [(UINavigationController *)self topViewController];
        [(UINavigationController *)self setDisappearingViewController:v14];

        BOOL v99 = 0;
        BOOL v89 = 0;
        int v15 = 1;
      }
      int v98 = v15;
    }
  }
  else
  {
    BOOL v89 = 0;
    int v98 = 0;
    BOOL v99 = 1;
  }
  char v16 = [(UINavigationController *)self disappearingViewController];
  if (v16)
  {
  }
  else
  {
    __int16 v20 = [(UINavigationController *)self topViewController];

    if (v20)
    {
      CGRect v94 = [(UINavigationController *)self topViewController];
      goto LABEL_27;
    }
  }
  __int16 v17 = [(UINavigationController *)self topViewController];

  CGRect v94 = 0;
  BOOL v18 = v105;
  if (!v17) {
    BOOL v18 = 0;
  }
  BOOL v105 = v18;
  int v19 = a4;
  if (!v17) {
    int v19 = 0;
  }
  a4 = v19;
LABEL_27:
  char v21 = v98 ^ 1;
  if (a6 != 2) {
    char v21 = 1;
  }
  if ((v21 & 1) == 0)
  {
    double v22 = [(UIViewController *)self mutableChildViewControllers];
    id v23 = [v22 lastObject];
    cleanupHelper = self->_cleanupHelper;
    if (cleanupHelper
      || (v25 = (_UIUnsafeUnretainedCleanupHelper *)-[_UIUnsafeUnretainedCleanupHelper initWithParent:deallocationHandler:]([_UIUnsafeUnretainedCleanupHelper alloc], (uint64_t)self, &__block_literal_global_344), uint64_t v26 = self->_cleanupHelper, self->_cleanupHelper = v25, v26, (cleanupHelper = self->_cleanupHelper) != 0))
    {
      [(NSHashTable *)cleanupHelper->_children addObject:v23];
    }

    [v22 removeLastObject];
  }
  int v101 = dyld_program_sdk_at_least();
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  obuint64_t j = v10;
  uint64_t v27 = [obj countByEnumeratingWithState:&v129 objects:v134 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v130;
    BOOL v30 = v96 == v12 || v91 != 0;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v130 != v28) {
          objc_enumerationMutation(obj);
        }
        double v32 = *(void **)(*((void *)&v129 + 1) + 8 * i);
        if (([v103 containsObject:v32] & 1) == 0)
        {
          uint64_t v35 = [(UINavigationController *)self disappearingViewController];
          BOOL v34 = v32 != v35;

          uint64_t v36 = [(UINavigationController *)self disappearingViewController];
          if (v32 == v36) {
            int v33 = v98;
          }
          else {
            int v33 = 0;
          }

          if (v33)
          {
            *(void *)&self->_navigationControllerFlags |= 0x1000000000000uLL;
LABEL_53:
            [v32 willMoveToParentViewController:0];
            goto LABEL_54;
          }
          if (v32 != v35)
          {
            BOOL v34 = 1;
            goto LABEL_53;
          }
        }
        int v33 = 0;
        BOOL v34 = 0;
LABEL_54:
        if (!v30)
        {
          uint64_t v37 = [obj lastObject];
          BOOL v38 = v32 == v37;

          if (v38)
          {
            if ((dyld_program_sdk_at_least() ^ 1 | v99))
            {
              -[UIViewController _invalidatePreferences:excluding:](self, -1, 0);
            }
            else
            {
              objc_initWeak(&location, self);
              v126[0] = MEMORY[0x1E4F143A8];
              v126[1] = 3221225472;
              v126[2] = __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke;
              v126[3] = &unk_1E52E80B8;
              objc_copyWeak(&v127, &location);
              -[UIViewController _performAtViewIsAppearing:]((uint64_t)v12, v126);
              objc_destroyWeak(&v127);
              objc_destroyWeak(&location);
            }
          }
        }
        if ([v32 _isNestedNavigationController] & v34) {
          [v32 _prepareForNormalDisplayWithNavigationController:self];
        }
        if (v105 & v33 & v101) {
          *(void *)&self->_navigationControllerFlags |= 0x2000000000000uLL;
        }
        else {
          [(UINavigationController *)self removeChildViewController:v32 notifyDidMove:v34];
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v129 objects:v134 count:16];
    }
    while (v27);
  }

  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v39 = v90;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v122 objects:v133 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v123;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v123 != v41) {
          objc_enumerationMutation(v39);
        }
        int v43 = *(void **)(*((void *)&v122 + 1) + 8 * j);
        int v44 = [obj containsObject:v43];
        if ((v44 & 1) == 0
          && [(UINavigationController *)self _allowNestedNavigationControllers])
        {
          [v43 _prepareForNestedDisplayWithNavigationController:self];
        }
        [(UIViewController *)self _addChildViewController:v43 performHierarchyCheck:0 notifyWillMove:v44 ^ 1u];
        if (v43 == v12 && v96 != v12)
        {
          if ((dyld_program_sdk_at_least() ^ 1 | v99))
          {
            if (self) {
              -[UIViewController _invalidatePreferences:excluding:](self, -1, 0);
            }
          }
          else
          {
            objc_initWeak(&location, self);
            v120[0] = MEMORY[0x1E4F143A8];
            v120[1] = 3221225472;
            v120[2] = __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_2;
            v120[3] = &unk_1E52E80B8;
            objc_copyWeak(&v121, &location);
            -[UIViewController _performAtViewIsAppearing:]((uint64_t)v12, v120);
            objc_destroyWeak(&v121);
            objc_destroyWeak(&location);
          }
        }
        if (v43 == v12) {
          char v46 = 1;
        }
        else {
          char v46 = v44;
        }
        if ((v46 & 1) == 0) {
          [v43 didMoveToParentViewController:self];
        }
        char v47 = v44 ^ 1;
        if (v43 != v12) {
          char v47 = 1;
        }
        if ((v47 & 1) == 0) {
          [(UINavigationController *)self _resetScrollViewObservingForViewController:v12];
        }
      }
      uint64_t v40 = [v39 countByEnumeratingWithState:&v122 objects:v133 count:16];
    }
    while (v40);
  }

  if (![(UINavigationController *)self _isNestedNavigationController]) {
    [(UINavigationBar *)self->_navigationBar _redisplayItems];
  }
  [(id)UIApp _deactivateReachability];
  if (v94)
  {
    double v48 = [v94 parentViewController];
    if (!v48)
    {
      if ([(id)UIApp _isSpringBoard]) {
        goto LABEL_100;
      }
      double v48 = [v94 _existingView];
      BOOL v49 = [v48 superview];
      [v49 removeFromSuperview];
    }
  }
LABEL_100:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_3;
  aBlock[3] = &unk_1E52E88D8;
  aBlock[4] = self;
  id v102 = v39;
  id v114 = v102;
  id v50 = obj;
  id v115 = v50;
  BOOL v119 = v105;
  int v118 = a4;
  id v51 = v103;
  id v116 = v51;
  id v52 = v12;
  id v117 = v52;
  double v53 = (void (**)(void))_Block_copy(aBlock);
  if (self) {
    transitionManager = self->_transitionManager;
  }
  else {
    transitionManager = 0;
  }
  long long v55 = transitionManager;

  if (v55)
  {
    if (self) {
      uint64_t v56 = self->_transitionManager;
    }
    else {
      uint64_t v56 = 0;
    }
    id v57 = v56;
    [(_UIViewControllerTransitionManager *)v57 applyViewControllers:v51];
  }
  int v58 = v89;
  if (v96 != v12) {
    int v58 = 1;
  }
  if (v58 == 1)
  {
    BOOL v59 = v92 != 0;
    int64_t v60 = 2;
    if (a4 != 2) {
      int64_t v60 = 3;
    }
    if (a4 == 1) {
      int64_t v60 = 1;
    }
    if (a6 != 3) {
      int64_t v60 = a6;
    }
    int64_t v104 = v60;
    int v61 = -[UINavigationController _effectiveTransitionForTransition:](self, "_effectiveTransitionForTransition:");
    if (v61) {
      BOOL v62 = v105;
    }
    else {
      BOOL v62 = 0;
    }
    BOOL v106 = v62;
    uint64_t v63 = 256;
    if (!v59 || !v62) {
      uint64_t v63 = 0;
    }
    *(void *)&self->_unint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFFFE0FLL | (16 * (v104 & 0xF)) | v63;
    if (v59 && v62) {
      int v64 = v61;
    }
    else {
      int v64 = 0;
    }
    unsigned int v100 = v64;
    -[_UIViewControllerTransitionConductor setDeferredTransitionType:](self->_transitionConductor, "setDeferredTransitionType:");
    if ((navigationControllerFlags >> 2))
    {
      BOOL v66 = a6 != 3 && v91 != 0;
      id obja = _Block_copy(v53);
    }
    else
    {
      [(UINavigationController *)self setNeedsDeferredTransition];
      id obja = _Block_copy(v53);
      if (v106)
      {
        *(void *)&self->_navigationControllerFlags |= 0x10000uLL;
        double v69 = [(UINavigationController *)self _customTransitionController:1];
        [(_UIViewControllerTransitionConductor *)self->_transitionConductor setTransitionController:v69];
        uint64_t v70 = +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:v69];
        if (v70 && (objc_opt_respondsToSelector() & 1) != 0) {
          int v71 = [v69 shouldPreemptWithContext:v70];
        }
        else {
          int v71 = 0;
        }
        uint64_t v75 = [(UINavigationController *)self allowUserInteractionDuringTransition] | v71;
        [v70 _setAllowUserInteraction:v75];
        id v76 = [(UINavigationController *)self disappearingViewController];
        [(UINavigationController *)self _presentationTransitionWrapViewController:v76 forTransitionContext:v70];

        if (v70)
        {
          uint64_t v77 = [(UINavigationController *)self _customInteractionController:v70];
          [(_UIViewControllerTransitionConductor *)self->_transitionConductor setInteractiveTransitionController:v77];
          [v69 transitionDuration:v70];
          -[_UIViewControllerTransitionConductor setCustomNavigationTransitionDuration:](self->_transitionConductor, "setCustomNavigationTransitionDuration:");
          [(_UIViewControllerTransitionConductor *)self->_transitionConductor customNavigationTransitionDuration];
          objc_msgSend(v70, "_setDuration:");
          v109[0] = MEMORY[0x1E4F143A8];
          v109[1] = 3221225472;
          v109[2] = __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_6;
          v109[3] = &unk_1E52DA138;
          char v112 = v75;
          v109[4] = self;
          id v110 = v70;
          v111 = v53;
          uint64_t v78 = _Block_copy(v109);

          id obja = v78;
        }

        BOOL v66 = 1;
      }
      else
      {
        BOOL v72 = [(UINavigationController *)self disappearingViewController];
        [(UINavigationController *)self _presentationTransitionWrapViewController:v72 forTransitionContext:0];

        if (!self->_navigationBar
          && ([(UIViewController *)self _existingView],
              BOOL v73 = objc_claimAutoreleasedReturnValue(),
              BOOL v74 = v73 == 0,
              v73,
              v74))
        {
          BOOL v66 = a6 != 3 && v91 != 0;
        }
        else
        {
          v53[2](v53);
          BOOL v66 = 0;
        }
        [(UINavigationController *)self _propagateContentAdjustmentsForControllersWithSharedViews];
      }
    }
    char v79 = [(UINavigationController *)self _existingToolbar];

    if (v79)
    {
      char v80 = [(UINavigationController *)self _navigationToolbarTransitionController];
      BOOL v81 = [(UINavigationController *)self _existingToolbar];
      [v80 prepareTransitionWithToolbar:v81];
    }
    [(UINavigationController *)self _hideOrShowBottomBarIfNeededWithTransition:v100];
    BOOL v82 = [(UIViewController *)self _existingTabBarItem];
    if (([v82 isSystemItem] & 1) == 0)
    {
      CGFloat v83 = [(UINavigationController *)self tab];
      BOOL v84 = v83 == 0;

      if (!v84)
      {
LABEL_156:
        if (v66) {
          [(UINavigationController *)self _executeNavigationHandler:obja deferred:1];
        }
        if (!+[UIViewController _shouldDeferTransitions]
          && !v106)
        {
          [(_UIViewControllerTransitionConductor *)self->_transitionConductor setTransitionController:0];
          [(_UIViewControllerTransitionConductor *)self->_transitionConductor startDeferredTransitionIfNeeded];
        }

        goto LABEL_161;
      }
      CGSize v85 = [(UINavigationController *)self bottomViewController];
      BOOL v82 = [v85 title];

      uint64_t v86 = [v82 length];
      if (v104 == 1 && v86 && ![v93 count]) {
        [(UIViewController *)self setTitle:v82];
      }
      v87 = self->super._parentViewController;
      [(UIViewController *)v87 updateTabBarItemForViewController:self];
    }
    goto LABEL_156;
  }
  if (self->_navigationBar
    || ([(UIViewController *)self _existingView],
        id v67 = objc_claimAutoreleasedReturnValue(),
        BOOL v68 = v67 == 0,
        v67,
        !v68))
  {
    v53[2](v53);
  }
LABEL_161:
}

- (int)_effectiveTransitionForTransition:(int)a3
{
  if (+[UIViewController _shouldDeferTransitions]) {
    return a3;
  }
  else {
    return 0;
  }
}

- (void)setNeedsDeferredTransition
{
}

- (void)setNeedsDeferredTransition:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UINavigationController *)self allowsWeakReference]) {
    int v5 = self;
  }
  else {
    int v5 = 0;
  }
  BOOL v6 = v5;
  if ([(_UIViewControllerTransitionConductor *)self->_transitionConductor needsDeferredTransition] != v3&& v6 != 0)
  {
    [(_UIViewControllerTransitionConductor *)self->_transitionConductor setNeedsDeferredTransition:v3];
    if (v3)
    {
      [(UIView *)self->_containerView setNeedsLayout];
      BOOL v8 = [(UIView *)self->_containerView superview];
      [(UIView *)self->_containerView frame];
      objc_msgSend(v8, "convertPoint:toView:", 0);
      double v10 = v9;

      [(UIView *)self->_containerView frame];
      if (v10 + v11 <= 0.0)
      {
        objc_initWeak(&location, self);
        uint64_t v12 = (void *)UIApp;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __53__UINavigationController_setNeedsDeferredTransition___block_invoke;
        v13[3] = &unk_1E52DC308;
        objc_copyWeak(&v14, &location);
        [v12 _performBlockAfterCATransactionCommits:v13];
        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)_clearLastOperation
{
  if (result)
  {
    id v1 = result;
    if (([result _isPerformingLayoutToLayoutTransition] & 1) == 0)
    {
      id v2 = (void *)*((void *)v1 + 128);
      if (v2)
      {
        BOOL v3 = [v2 _contentOrObservableScrollViewForEdge:1];
        BOOL v4 = [v1 topViewController];
        int v5 = [v4 _contentOrObservableScrollViewForEdge:1];

        if (v3 != v5) {
          [v1 _stopObservingContentScrollViewsForViewController:*((void *)v1 + 128)];
        }
      }
    }
    *((void *)v1 + 154) &= 0xFFFCFFFFFFFFFE0FLL;
    [*((id *)v1 + 160) setDeferredTransitionType:0];
    return (void *)[v1 setDisappearingViewController:0];
  }
  return result;
}

- (BOOL)_isPerformingLayoutToLayoutTransition
{
  BOOL v3 = [(UINavigationController *)self disappearingViewController];
  BOOL v4 = [(UINavigationController *)self topViewController];
  int64_t v5 = [(UINavigationController *)self lastOperation];
  BOOL v6 = [v4 _uiCollectionView];
  int v7 = [v3 _uiCollectionView];

  if (v5 == 1) {
    BOOL v8 = v4;
  }
  else {
    BOOL v8 = v3;
  }
  char v9 = [v8 _usesSharedView];
  if (v6 == v7) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_updateEnclosingTabBarControllerForStackChange
{
  if (_UIBarsApplyChromelessEverywhere())
  {
    BOOL v3 = [(UIViewController *)self tabBarController];
    [v3 _navigationControllerDidUpdateStack:self];
  }
  BOOL v4 = [(UINavigationController *)self _managedTabGroup];

  if (v4)
  {
    id v5 = [(UINavigationController *)self _managedTabGroup];
    [v5 _updateForManagingNavigationStackChange];
  }
}

- (id)tab
{
  BOOL v3 = [(UINavigationController *)self _managedTabGroup];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UINavigationController;
    id v5 = [(UIViewController *)&v8 tab];
  }
  BOOL v6 = v5;

  return v6;
}

- (UITabGroup)_managedTabGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__managedTabGroup);
  return (UITabGroup *)WeakRetained;
}

- (void)_propagateContentAdjustmentsForControllersWithSharedViews
{
  id v5 = [(UINavigationController *)self disappearingViewController];
  BOOL v3 = [(UINavigationController *)self topViewController];
  int64_t v4 = [(UINavigationController *)self lastOperation];
  if (v4 == 2)
  {
    if (![v5 _usesSharedView]) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v4 == 1 && ([v3 _usesSharedView] & 1) != 0)
  {
LABEL_6:
    [v5 _navigationControllerContentInsetAdjustment];
    objc_msgSend(v3, "_setNavigationControllerContentInsetAdjustment:");
    [v5 _navigationControllerContentOffsetAdjustment];
    objc_msgSend(v3, "_setNavigationControllerContentOffsetAdjustment:");
  }
LABEL_7:
}

- (void)_presentationTransitionWrapViewController:(id)a3 forTransitionContext:(id)a4
{
  id v24 = a3;
  id v5 = a4;
  BOOL v6 = [v24 childModalViewController];

  if (v6)
  {
    int v7 = [v24 view];
    objc_super v8 = +[UIViewControllerWrapperView existingWrapperViewForView:]((uint64_t)UIViewControllerWrapperView, v7);

    if (!v8)
    {
      char v9 = [v24 view];
      BOOL v10 = [v9 superview];

      double v11 = [v24 view];
      [v10 bounds];
      objc_super v8 = +[UIViewControllerWrapperView wrapperViewForView:frame:](v12, v13, v14, v15, (uint64_t)UIViewControllerWrapperView, v11);

      [v8 setAutoresizingMask:18];
      char v16 = [v24 view];
      [v10 insertSubview:v8 belowSubview:v16];

      __int16 v17 = [v24 view];
      [v8 addSubview:v17];
    }
    BOOL v18 = [_UINavigationPresentationWrapperView alloc];
    [v8 bounds];
    int v19 = -[UIView initWithFrame:](v18, "initWithFrame:");
    [(UIView *)v19 setAutoresizingMask:18];
    [v8 insertSubview:v19 atIndex:0];
    __int16 v20 = [v24 view];
    [(UIView *)v19 addSubview:v20];

    char v21 = [v24 presentedViewController];
    double v22 = [v21 presentationController];
    id v23 = [v22 containerView];
    [(UIView *)v19 addSubview:v23];

    [v5 _setFromView:v19];
  }
}

void __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_3(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) navigationBar];
  if ([*(id *)(a1 + 32) isNavigationBarHidden]
    && ![*(id *)(a1 + 32) _isNestedNavigationController])
  {
    if (*(unsigned char *)(a1 + 76) && [*(id *)(a1 + 32) _hasPotentiallyChromelessBottomBar]) {
      [*(id *)(a1 + 32) _startCoordinatedBottomBarUpdateForTransition:*(unsigned int *)(a1 + 72)];
    }
  }
  else
  {
    [v2 setLocked:0];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v57;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v57 != v6) {
            objc_enumerationMutation(v3);
          }
          if ([*(id *)(*((void *)&v56 + 1) + 8 * i) _isNestedNavigationController])
          {
            char v8 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v56 objects:v63 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    char v8 = 0;
LABEL_13:

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v53;
      while (2)
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v53 != v12) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v52 + 1) + 8 * j) _isNestedNavigationController])
          {

            goto LABEL_29;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v52 objects:v62 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    if ((v8 & 1) != 0 || [*(id *)(a1 + 32) _isNestedNavigationController])
    {
LABEL_29:
      uint64_t v40 = v2;
      uint64_t v16 = [*(id *)(a1 + 40) count];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      __int16 v17 = [*(id *)(a1 + 48) reverseObjectEnumerator];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v61 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v49;
        do
        {
          for (uint64_t k = 0; k != v19; ++k)
          {
            if (*(void *)v49 != v20) {
              objc_enumerationMutation(v17);
            }
            double v22 = *(void **)(*((void *)&v48 + 1) + 8 * k);
            if ([v22 _isNestedNavigationController])
            {
              id v23 = [v22 navigationBar];
              id v24 = [v23 _stack];

              [v24 iterateEntries:&__block_literal_global_337_0];
            }
            if (*(unsigned char *)(a1 + 76))
            {
              int v25 = [*(id *)(a1 + 48) firstObject];
              if (v22 == v25 && v16 == 0) {
                uint64_t v27 = *(unsigned int *)(a1 + 72);
              }
              else {
                uint64_t v27 = 0;
              }
            }
            else
            {
              uint64_t v27 = 0;
            }
            -[UIViewController _removeNavigationItemsFromNavigationController:transition:](v22, *(void **)(a1 + 32), v27);
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v48 objects:v61 count:16];
        }
        while (v19);
      }

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v28 = *(id *)(a1 + 40);
      uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v60 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v45;
        do
        {
          for (uint64_t m = 0; m != v30; ++m)
          {
            if (*(void *)v45 != v31) {
              objc_enumerationMutation(v28);
            }
            int v33 = *(void **)(*((void *)&v44 + 1) + 8 * m);
            if (*(unsigned char *)(a1 + 76))
            {
              BOOL v34 = [*(id *)(a1 + 40) lastObject];
              if (v33 == v34) {
                uint64_t v35 = *(unsigned int *)(a1 + 72);
              }
              else {
                uint64_t v35 = 0;
              }
            }
            else
            {
              uint64_t v35 = 0;
            }
            -[UIViewController _appendNavigationItemsToNavigationController:transition:](v33, *(void **)(a1 + 32), v35);
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v60 count:16];
        }
        while (v30);
      }

      [*(id *)(a1 + 32) _updateContainersForStackChange];
      id v2 = v40;
    }
    else
    {
      double v14 = [v2 items];
      double v15 = [*(id *)(a1 + 32) _navigationItems];
      [*(id *)(a1 + 32) _updateNavigationBar:v2 fromItems:v14 toItems:v15 animated:*(unsigned __int8 *)(a1 + 76)];
      if (*(unsigned char *)(a1 + 76)
        && [*(id *)(a1 + 32) _hasPotentiallyChromelessBottomBar]
        && ![v2 _transitionForOldItems:v14 newItems:v15])
      {
        [*(id *)(a1 + 32) _startCoordinatedBottomBarUpdateForTransition:*(unsigned int *)(a1 + 72)];
      }
    }
    [v2 setLocked:1];
  }
  uint64_t v36 = [*(id *)(a1 + 32) disappearingViewController];
  if ([v36 _isNestedNavigationController])
  {
    if ([*(id *)(a1 + 56) containsObject:v36]) {
      goto LABEL_73;
    }
  }
  else if (([*(id *)(a1 + 32) _isNestedNavigationController] & 1) == 0)
  {
    goto LABEL_73;
  }
  uint64_t v37 = [*(id *)(a1 + 32) _transitionCoordinator];
  if (v37)
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_5;
    v41[3] = &unk_1E52DB270;
    id v38 = v36;
    uint64_t v39 = *(void *)(a1 + 32);
    id v42 = v38;
    uint64_t v43 = v39;
    [v37 animateAlongsideTransition:0 completion:v41];
  }
  else
  {
    [v36 _prepareForNormalDisplayWithNavigationController:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) _updateInteractivePopGestureEnabledState];
  }

LABEL_73:
  [*(id *)(a1 + 32) _forwardPaletteToViewControllerIfNeeded:*(void *)(a1 + 64)];
}

- (id)_navigationItemsCallingPublicAccessor:(BOOL)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v6 = [(UIViewController *)self mutableChildViewControllers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (a3) {
          [v11 navigationItem];
        }
        else {
        uint64_t v12 = [v11 _navigationItemCreatingDefaultIfNotSet];
        }
        if ((dyld_program_sdk_at_least() & 1) != 0 || v12) {
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }

  double v13 = [(UINavigationController *)self topViewController];
  if ([v13 _isNestedNavigationController])
  {
    id v14 = v13;
    double v15 = [v14 _outermostNavigationController];
    uint64_t v16 = [(UINavigationController *)self _outermostNavigationController];

    if (v15 == v16)
    {
      __int16 v17 = [v14 _navigationItems];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v25 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v24 + 1) + 8 * j);
            if (([v5 containsObject:v22] & 1) == 0) {
              [v5 addObject:v22];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v19);
      }
    }
  }

  return v5;
}

- (id)_navigationItems
{
  return [(UINavigationController *)self _navigationItemsCallingPublicAccessor:1];
}

- (void)_forwardPaletteToViewControllerIfNeeded:(id)a3
{
  id v8 = a3;
  if (_UIGetBarNavigationPaletteEnabled())
  {
    uint64_t v4 = [(UINavigationController *)self disappearingViewController];
    id v5 = [v4 navigationItem];
    uint64_t v6 = [v5 _bottomPalette];

    if ([v6 isPinned])
    {
      uint64_t v7 = [v8 navigationItem];
      [v7 _setBottomPalette:v6];
    }
  }
}

- (void)setNavigationBar:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (UINavigationBar *)a3;
  p_navigationBar = &self->_navigationBar;
  if (self->_navigationBar != v6)
  {
    int v8 = dyld_program_sdk_at_least();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v8)
    {
      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2, self, @"UINavigationController.m", 2705, @"%@ is not a subclass of UINavigationBar", v6 object file lineNumber description];
      }
    }
    else if ((isKindOfClass & 1) == 0)
    {
      long long v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25A850) + 8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v6;
        _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "%@ is not a subclass of UINavigationBar", buf, 0xCu);
      }
    }
    uint64_t v11 = [(UIViewController *)self mutableChildViewControllers];
    [(UINavigationBar *)*p_navigationBar setLocked:0];
    [(UINavigationBar *)*p_navigationBar setDelegate:0];
    [(UIView *)*p_navigationBar removeFromSuperview];
    [(NSMapTable *)self->_lastContentMarginForView removeObjectForKey:*p_navigationBar];
    objc_storeStrong((id *)&self->_navigationBar, a3);
    double v12 = *MEMORY[0x1E4F1DAD8];
    double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(UINavigationController *)self _widthForLayout];
    double v15 = v14;
    -[UINavigationBar _layoutHeightsForNavigationItem:fittingWidth:](v6, "_layoutHeightsForNavigationItem:fittingWidth:", 0);
    -[UINavigationBar setFrame:](*p_navigationBar, "setFrame:", v12, v13, v15, v16);
    __int16 v17 = *p_navigationBar;
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      if (qword_1EB25A908 != -1) {
        dispatch_once(&qword_1EB25A908, &__block_literal_global_1743);
      }
      if (byte_1EB25A81A)
      {
        [(UIView *)v17 frame];
        -[UINavigationBar sizeThatFits:](v17, "sizeThatFits:", v18, v19);
      }
    }

    [(UIView *)*p_navigationBar setAutoresizingMask:2];
    [(UINavigationBar *)*p_navigationBar setDelegate:self];
    [(UIView *)self->super._view addSubview:*p_navigationBar];
    if ([v11 count])
    {
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v21 = v11;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v29 != v24) {
              objc_enumerationMutation(v21);
            }
            long long v26 = [*(id *)(*((void *)&v28 + 1) + 8 * i) navigationItem];
            [v20 addObject:v26];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v23);
      }

      [(UINavigationBar *)*p_navigationBar setItems:v20];
    }
    [(UINavigationBar *)*p_navigationBar setLocked:1];
    [(UINavigationController *)self _positionNavigationBarHidden:*(_DWORD *)&self->_navigationControllerFlags & 1];
    [(UIView *)*p_navigationBar setHidden:*(_DWORD *)&self->_navigationControllerFlags & 1];
  }
}

- (void)_updateNavigationBar:(id)a3 fromItems:(id)a4 toItems:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v20 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v10 count];
  if (v12 + 1 == [v11 count])
  {
    id v13 = v10;
    id v14 = v11;
    if ([v13 count] < (unint64_t)v12 || objc_msgSend(v14, "count") < (unint64_t)v12) {
      goto LABEL_6;
    }
    if (v12 >= 1)
    {
      double v15 = [v13 objectAtIndexedSubscript:0];
      double v16 = [v14 objectAtIndexedSubscript:0];

      if (v15 != v16)
      {
LABEL_6:

LABEL_7:
        goto LABEL_8;
      }
      uint64_t v17 = 1;
      while (v12 != v17)
      {
        double v18 = [v13 objectAtIndexedSubscript:v17];
        double v19 = [v14 objectAtIndexedSubscript:v17];

        ++v17;
        if (v18 != v19)
        {

          if (v17 - 1 < v12) {
            goto LABEL_8;
          }
          goto LABEL_17;
        }
      }
    }

LABEL_17:
    id v13 = [v14 lastObject];
    [(UINavigationController *)self navigationBar:v20 shouldPushItem:v13];
    goto LABEL_7;
  }
LABEL_8:
  [v20 setItems:v11 animated:v6];
}

- (void)_hideOrShowBottomBarIfNeededWithTransition:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = [(UINavigationController *)self _shouldBottomBarBeHidden];
  uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  BOOL v7 = [(UINavigationController *)self _shouldCrossFadeBottomBars];
  int v8 = [(UIViewController *)self viewIfLoaded];
  int v9 = [v8 _shouldReverseLayoutDirection];

  uint64_t v10 = (uint64_t)self->_navigationControllerFlags;
  if (v5)
  {
    if ((v10 & 0xC00) != 0) {
      return;
    }
    if (v3)
    {
      id v11 = [(UINavigationController *)self disappearingViewController];
      uint64_t v12 = [v11 view];

      if ((navigationControllerFlags & 0x10000) != 0)
      {
        id v13 = v12;
      }
      else
      {
        +[UIViewControllerWrapperView existingWrapperViewForView:]((uint64_t)UIViewControllerWrapperView, v12);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v35 = v13;
      uint64_t v24 = [v13 autoresizingMask];
      objc_msgSend(v35, "setAutoresizingMask:", objc_msgSend(v35, "autoresizingMask") & 0xFFFFFFFFFFFFFFEFLL);
    }
    else
    {
      uint64_t v24 = 0;
      id v35 = 0;
    }
    long long v25 = [(UIViewController *)self tabBarController];
    long long v26 = [v25 _selectedViewControllerInTabBar];

    if (v26 == self)
    {
      if (v7) {
        uint64_t v34 = 6;
      }
      else {
        uint64_t v34 = v3;
      }
      [v25 _hideBarWithTransition:v34 isExplicit:0 reason:2];
      char v31 = *((unsigned char *)&self->_navigationControllerFlags + 8);
      uint64_t v32 = (uint64_t)self->_navigationControllerFlags;
      *(void *)&self->_uint64_t navigationControllerFlags = v32 | 0x400;
      if (!v7) {
        goto LABEL_47;
      }
      uint64_t v33 = 0x400000400;
    }
    else
    {
      if ([(UINavigationController *)self isToolbarHidden])
      {
LABEL_47:
        [v35 setAutoresizingMask:v24];

        goto LABEL_48;
      }
      uint64_t v27 = 15;
      uint64_t v28 = 8;
      if (v9) {
        uint64_t v28 = 2;
      }
      uint64_t v29 = 2;
      if (v9) {
        uint64_t v29 = 8;
      }
      if (v3 == 1) {
        uint64_t v27 = v29;
      }
      if (v3 == 2) {
        uint64_t v30 = v28;
      }
      else {
        uint64_t v30 = v27;
      }
      [(UINavigationController *)self durationForTransition:v3];
      -[UINavigationController _setToolbarHidden:edge:duration:](self, "_setToolbarHidden:edge:duration:", 1, v30);
      char v31 = *((unsigned char *)&self->_navigationControllerFlags + 8);
      uint64_t v32 = (uint64_t)self->_navigationControllerFlags;
      uint64_t v33 = 263168;
    }
    *(void *)&self->_uint64_t navigationControllerFlags = v32 | v33;
    *((unsigned char *)&self->_navigationControllerFlags + 8) = v31;
    goto LABEL_47;
  }
  if ((v10 & 0x400) == 0) {
    return;
  }
  id v35 = [(UIViewController *)self tabBarController];
  id v14 = [v35 _selectedViewControllerInTabBar];

  if (v14 == self)
  {
    if (v7) {
      uint64_t v21 = 6;
    }
    else {
      uint64_t v21 = v3;
    }
    [v35 _showBarWithTransition:v21 isExplicit:1 reason:2];
    char v19 = *((unsigned char *)&self->_navigationControllerFlags + 8);
    unint64_t v22 = *(void *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFFFBFFLL;
    *(void *)&self->_uint64_t navigationControllerFlags = v22;
    if (!v7) {
      goto LABEL_48;
    }
    unint64_t v20 = v22 | 0x800000000;
  }
  else
  {
    if (![(UINavigationController *)self isToolbarHidden])
    {
LABEL_48:
      uint64_t v23 = v35;
      goto LABEL_49;
    }
    uint64_t v15 = 15;
    uint64_t v16 = 2;
    if (v9) {
      uint64_t v16 = 8;
    }
    uint64_t v17 = 8;
    if (v9) {
      uint64_t v17 = 2;
    }
    if (v3 == 1) {
      uint64_t v15 = v17;
    }
    if (v3 == 2) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = v15;
    }
    [(UINavigationController *)self durationForTransition:v3];
    -[UINavigationController _setToolbarHidden:edge:duration:](self, "_setToolbarHidden:edge:duration:", 0, v18);
    char v19 = *((unsigned char *)&self->_navigationControllerFlags + 8);
    unint64_t v20 = *(void *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFBFBFFLL | 0x40000;
  }
  uint64_t v23 = v35;
  *(void *)&self->_uint64_t navigationControllerFlags = v20;
  *((unsigned char *)&self->_navigationControllerFlags + 8) = v19;
LABEL_49:
}

- (BOOL)_shouldCrossFadeBottomBars
{
  if ([(UINavigationController *)self _isUsingBuiltinAnimator]
    && [(_UINavigationControllerVisualStyle *)self->_visualStyle isUsingParallaxTransition])
  {
    return 0;
  }
  if ([(_UIViewControllerTransitionConductor *)self->_transitionConductor shouldCrossFadeBottomBars])
  {
    return 1;
  }
  if ((*(void *)&self->_navigationControllerFlags & 0x4000000) == 0) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = [WeakRetained _navigationControllerShouldCrossFadeBottomBars:self];

  return v5;
}

- (BOOL)_isUsingBuiltinAnimator
{
  return self->__usingBuiltinAnimator;
}

- (BOOL)_shouldBottomBarBeHidden
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UINavigationController *)self bottomViewController];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(UIViewController *)self mutableChildViewControllers];
  char v5 = [v4 reverseObjectEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 hidesBottomBarWhenPushed])
        {

          char v11 = 1;
          goto LABEL_12;
        }
        if (v10 == v3) {
          goto LABEL_10;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_10:

  uint64_t v3 = [(UINavigationController *)self topViewController];
  char v11 = [v3 _suppressesBottomBar];
LABEL_12:

  return v11;
}

- (BOOL)navigationBar:(id)a3 shouldPushItem:(id)a4
{
  return 1;
}

- (void)pushViewController:(id)a3 transition:(int)a4 forceImmediate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if ([(UINavigationController *)self _sanityCheckPushViewController:v8 transition:v6 forceImmediate:v5])
  {
    int v9 = [(UIViewController *)self view];
    uint64_t v10 = [v9 window];

    uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
    uint64_t v12 = [(UIViewController *)self mutableChildViewControllers];
    uint64_t v13 = [v12 lastObject];
    if (v10) {
      int v14 = 1;
    }
    else {
      int v14 = v5;
    }
    if ((navigationControllerFlags & 4) == 0 && v14)
    {
      long long v15 = [(UINavigationController *)self disappearingViewController];
      if (v15)
      {
      }
      else if (![(UINavigationController *)self needsDeferredTransition])
      {
        [(UINavigationController *)self setDisappearingViewController:v13];
      }
    }
    if (v10)
    {
      long long v16 = [(UINavigationController *)self disappearingViewController];

      uint64_t v10 = 0;
      uint64_t v17 = 0;
      if (v6 && v16)
      {
        uint64_t v10 = [(UINavigationController *)self _isAppearingOrAppearedCheck];
        if (v10) {
          uint64_t v17 = v6;
        }
        else {
          uint64_t v17 = 0;
        }
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__UINavigationController_pushViewController_transition_forceImmediate___block_invoke;
    aBlock[3] = &unk_1E52DAF40;
    id v18 = v8;
    id v30 = v18;
    char v19 = _Block_copy(aBlock);
    char v20 = dyld_program_sdk_at_least();
    uint64_t v21 = v12;
    unint64_t v22 = (void *)v13;
    if (v20)
    {
      uint64_t v23 = 0;
    }
    else
    {
      uint64_t v23 = v26;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __71__UINavigationController_pushViewController_transition_forceImmediate___block_invoke_2;
      v26[3] = &unk_1E52DC3D0;
      v26[4] = self;
      long long v25 = &v27;
      id v27 = v18;
      char v28 = v10;
    }
    uint64_t v24 = _Block_copy(v23);
    [(UINavigationController *)self _applyViewControllers:v19 transition:v17 animated:v10 operation:1 rescheduleBlock:v24];
    if (v10) {
      [(UINavigationController *)self _playPushNavigationSound];
    }

    if ((v20 & 1) == 0) {
  }
    }
}

- (BOOL)_sanityCheckPushViewController:(id)a3 transition:(int)a4 forceImmediate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  if (qword_1EB25A920 != -1) {
    dispatch_once(&qword_1EB25A920, &__block_literal_global_1759_0);
  }
  if (byte_1EB25A81C)
  {
    id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("NavigationControllerVerboseLoggingForStrictRepeatedPushAssertion", &qword_1EB25A890)+ 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (v5) {
        int v9 = @"YES";
      }
      else {
        int v9 = @"NO";
      }
      uint64_t v10 = (void *)MEMORY[0x1E4F29060];
      char v11 = v8;
      uint64_t v12 = [v10 callStackSymbols];
      *(_DWORD *)buf = 138413314;
      BOOL v73 = self;
      __int16 v74 = 2112;
      id v75 = v61;
      __int16 v76 = 2048;
      uint64_t v77 = a4;
      __int16 v78 = 2112;
      char v79 = v9;
      __int16 v80 = 2112;
      BOOL v81 = v12;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "-pushViewController:transition:forceImmediate: sent to %@ passing %@, transition=%lu, forceImmediate=%@\n%@", buf, 0x34u);
    }
  }
  if (v61)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || [(UINavigationController *)self _allowChildSplitViewControllers])
    {
      int64_t v60 = [(UIViewController *)self mutableChildViewControllers];
      int v13 = [v61 _isNavigationController];
      if ([v60 containsObject:v61])
      {
        int v14 = NSString;
        long long v15 = _UIMainBundleIdentifier();
        long long v16 = [v14 stringWithFormat:@"%@ is pushing the same view controller instance (%@) more than once which is not supported and is most likely an error in the application : %@", self, v61, v15];

        if (v16) {
          goto LABEL_14;
        }
      }
      else if (v13)
      {
        if (![(UINavigationController *)self _allowNestedNavigationControllers])
        {
          long long v16 = [NSString stringWithFormat:@"Pushing a navigation controller is not supported"];
          if (v16)
          {
LABEL_14:
            uint64_t v17 = [(UIViewController *)self _splitViewControllerEnforcingClass:1];
            long long v59 = [v17 _panelImpl];
            if (!v59) {
              goto LABEL_83;
            }
            id v18 = (UINavigationController *)v61;
            id v19 = v17;
            char v20 = v19;
            BOOL v56 = 0;
            if (!self || !v19)
            {
LABEL_37:
              long long v58 = v20;

              long long v57 = [v59 currentState];
              uint64_t v25 = [v57 _collapsedState];
              if (v25 == 1)
              {
                long long v26 = @"collapsing";
              }
              else if (v25 == 2)
              {
                long long v26 = @"collapsed";
              }
              else
              {
                long long v26 = @"expanding";
                if (!v25) {
                  long long v26 = @"expanded";
                }
              }
              long long v55 = v26;
              long long v54 = [v16 stringByAppendingFormat:@" [%@]", v55];

              id v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("UINavigationController_in_UISplitViewController", &qword_1EB25A898)+ 8);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                BOOL v73 = (UINavigationController *)v55;
                __int16 v74 = 2112;
                id v75 = v20;
                _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_DEFAULT, "Incorrect push in %@ UISplitViewController, %@", buf, 0x16u);
              }
              char v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("UINavigationController_in_UISplitViewController", &qword_1EB25A8A0)+ 8);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                BOOL v73 = v18;
                _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_DEFAULT, "Rejecting %@", buf, 0xCu);
              }
              uint64_t v29 = [v20 _printHierarchy];
              id v30 = [v29 componentsSeparatedByString:@"\n"];

              long long v68 = 0u;
              long long v69 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              id v31 = v30;
              uint64_t v32 = [v31 countByEnumeratingWithState:&v66 objects:v71 count:16];
              if (v32)
              {
                uint64_t v33 = *(void *)v67;
                do
                {
                  for (uint64_t i = 0; i != v32; ++i)
                  {
                    if (*(void *)v67 != v33) {
                      objc_enumerationMutation(v31);
                    }
                    id v35 = *(UINavigationController **)(*((void *)&v66 + 1) + 8 * i);
                    uint64_t v36 = *(NSObject **)(__UILogGetCategoryCachedImpl("UINavigationController_in_UISplitViewController", &qword_1EB25A8A8)+ 8);
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      BOOL v73 = v35;
                      _os_log_impl(&dword_1853B0000, v36, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
                    }
                  }
                  uint64_t v32 = [v31 countByEnumeratingWithState:&v66 objects:v71 count:16];
                }
                while (v32);
              }

              if ([v59 style])
              {
                id v53 = v31;
                uint64_t v37 = [v59 valueForKey:@"_perColumnViewControllers"];
                id v38 = [v37 description];
                uint64_t v39 = [v38 componentsSeparatedByString:@"\n"];

                long long v64 = 0u;
                long long v65 = 0u;
                long long v62 = 0u;
                long long v63 = 0u;
                id v40 = v39;
                uint64_t v41 = [v40 countByEnumeratingWithState:&v62 objects:v70 count:16];
                if (v41)
                {
                  uint64_t v42 = *(void *)v63;
                  do
                  {
                    for (uint64_t j = 0; j != v41; ++j)
                    {
                      if (*(void *)v63 != v42) {
                        objc_enumerationMutation(v40);
                      }
                      long long v44 = *(UINavigationController **)(*((void *)&v62 + 1) + 8 * j);
                      long long v45 = *(NSObject **)(__UILogGetCategoryCachedImpl("UINavigationController_in_UISplitViewController", &qword_1EB25A8B0)+ 8);
                      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        BOOL v73 = v44;
                        _os_log_impl(&dword_1853B0000, v45, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
                      }
                    }
                    uint64_t v41 = [v40 countByEnumeratingWithState:&v62 objects:v70 count:16];
                  }
                  while (v41);
                }

                id v31 = v53;
              }
              if (os_variant_has_internal_diagnostics())
              {
                long long v48 = *(id *)(__UILogGetCategoryCachedImpl("UINavigationController_in_UISplitViewController", &qword_1EB25A8C0)+ 8);
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  long long v49 = [v59 valueForKey:@"panelController"];
                  long long v50 = [v49 valueForKey:@"_internalState"];
                  *(_DWORD *)buf = 138412290;
                  BOOL v73 = v50;
                  _os_log_impl(&dword_1853B0000, v48, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
                }
              }

              if (v56)
              {
                if (os_variant_has_internal_diagnostics())
                {
                  long long v51 = __UIFaultDebugAssertLog();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    BOOL v73 = v54;
                    _os_log_fault_impl(&dword_1853B0000, v51, OS_LOG_TYPE_FAULT, "Ignoring push instead of throwing exception per UINavigationControllerRelaxRepeatedPushAssertionForSplitViewController default: %@", buf, 0xCu);
                  }
                }
                else
                {
                  long long v46 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25A8D0) + 8);
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    BOOL v73 = v54;
                    _os_log_impl(&dword_1853B0000, v46, OS_LOG_TYPE_ERROR, "Ignoring push instead of throwing exception per UINavigationControllerRelaxRepeatedPushAssertionForSplitViewController default: %@", buf, 0xCu);
                  }
                }

                BOOL v22 = 0;
                goto LABEL_73;
              }
              long long v16 = v54;
LABEL_83:
              id v52 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
              objc_exception_throw(v52);
            }
            uint64_t v21 = v19;
            if (_UIIsPrivateMainBundle() && qword_1EB25A928 != -1) {
              dispatch_once(&qword_1EB25A928, &__block_literal_global_1765_0);
            }
            if (byte_1EB25A81D)
            {
              if (qword_1EB25A920 != -1) {
                dispatch_once(&qword_1EB25A920, &__block_literal_global_1759_0);
              }
              if (byte_1EB25A81C)
              {
                BOOL v56 = 0;
                goto LABEL_37;
              }
              uint64_t v23 = [(UINavigationController *)self topViewController];
              if (v23 == v18)
              {
                BOOL v24 = [v21 _columnForViewController:self] == 0;

                if (v24)
                {
                  BOOL v56 = (unint64_t)([v21 _columnForViewController:v18] - 1) < 2;
                  goto LABEL_36;
                }
              }
              else
              {
              }
            }
            BOOL v56 = 0;
LABEL_36:
            char v20 = v21;
            goto LABEL_37;
          }
        }
      }
      BOOL v22 = 1;
LABEL_73:

      goto LABEL_74;
    }
    NSLog(&cfstr_SplitViewContr.isa, self);
  }
  else
  {
    NSLog(&cfstr_ApplicationTri.isa, self);
  }
  BOOL v22 = 0;
LABEL_74:

  return v22;
}

- (void)updateTitleForViewController:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(UIViewController *)self mutableChildViewControllers];
  BOOL v5 = v4;
  if (v4 && ![v4 indexOfObjectIdenticalTo:v7])
  {
    uint64_t v6 = [v7 title];
    [(UIViewController *)self setTitle:v6];
  }
}

- (double)durationForTransition:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(UINavigationController *)self isCustomTransition])
  {
    transitionConductor = self->_transitionConductor;
    [(_UIViewControllerTransitionConductor *)transitionConductor customNavigationTransitionDuration];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UINavigationController;
    [(UIViewController *)&v7 durationForTransition:v3];
  }
  return result;
}

- (CGSize)preferredContentSize
{
  [(UINavigationController *)self _preferredContentSizeForcingLoad:1];
  result.height = v3;
  result.CGFloat width = v2;
  return result;
}

- (UIViewController)visibleViewController
{
  double v3 = [(UIViewController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 visibleViewController];
LABEL_5:
    BOOL v5 = v4;
LABEL_6:
    id v6 = v5;
    objc_super v7 = v6;
    goto LABEL_7;
  }
  if (v3)
  {
    id v4 = v3;
    goto LABEL_5;
  }
  BOOL v5 = [(UINavigationController *)self topViewController];
  if (![v5 _isNestedNavigationController]) {
    goto LABEL_6;
  }
  objc_super v7 = [v5 visibleViewController];

  id v6 = 0;
LABEL_7:

  return (UIViewController *)v7;
}

- (void)setDelegate:(id)delegate
{
  id v4 = delegate;
  if (!v4)
  {
LABEL_7:
    id v6 = 0;
    goto LABEL_8;
  }
  char v5 = dyld_program_sdk_at_least();
  id v6 = v4;
  if ((v5 & 1) == 0)
  {
    unsigned __int8 v7 = objc_msgSend(v4, sel_allowsWeakReference);
    id v6 = v4;
    if ((v7 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__UINavigationController_setDelegate___block_invoke;
      block[3] = &unk_1E52D9F98;
      id v47 = v4;
      long long v48 = self;
      if (setDelegate__once_0 != -1) {
        dispatch_once(&setDelegate__once_0, block);
      }

      goto LABEL_7;
    }
  }
LABEL_8:
  id v8 = v6;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v10 = WeakRetained;
  if (WeakRetained != v8 || !v8 && (*(_DWORD *)&self->_navigationControllerFlags & 0x80000000) != 0)
  {
    if (WeakRetained) {
      objc_setAssociatedObject(WeakRetained, (char *)&self->super.super.super.isa + 1, 0, (void *)1);
    }
    objc_storeWeak((id *)&self->_delegate, v8);
    id v11 = v8;
    id v12 = [(UINavigationController *)self delegate];
    if (v11 == v12)
    {
      unsigned int v14 = [(UINavigationController *)self allowsWeakReference];

      unint64_t v13 = (unint64_t)(v11 != 0) << 31;
      if (v11 && v14)
      {
        objc_initWeak(&location, self);
        long long v15 = [_UIWeakHelper alloc];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __38__UINavigationController_setDelegate___block_invoke_268;
        v43[3] = &unk_1E52DC308;
        objc_copyWeak(&v44, &location);
        long long v16 = [(_UIWeakHelper *)v15 initWithDeallocationBlock:v43];
        objc_setAssociatedObject(v11, (char *)&self->super.super.super.isa + 1, v16, (void *)1);

        objc_destroyWeak(&v44);
        objc_destroyWeak(&location);
        unint64_t v13 = 0x80000000;
      }
    }
    else
    {

      unint64_t v13 = (unint64_t)(v11 != 0) << 31;
    }

    p_uint64_t navigationControllerFlags = &self->_navigationControllerFlags;
    char v18 = *((unsigned char *)p_navigationControllerFlags + 8);
    *(void *)p_uint64_t navigationControllerFlags = *(void *)p_navigationControllerFlags & 0xFFFFFFFF7FFFFFFFLL | v13;
    *((unsigned char *)p_navigationControllerFlags + 8) = v18;
    char v19 = objc_opt_respondsToSelector();
    uint64_t v20 = 0x80000;
    if ((v19 & 1) == 0) {
      uint64_t v20 = 0;
    }
    *(void *)p_uint64_t navigationControllerFlags = *(void *)p_navigationControllerFlags & 0xFFFFFFFFFFF7FFFFLL | v20;
    char v21 = objc_opt_respondsToSelector();
    uint64_t v22 = 0x100000;
    if ((v21 & 1) == 0) {
      uint64_t v22 = 0;
    }
    *(void *)p_uint64_t navigationControllerFlags = *(void *)p_navigationControllerFlags & 0xFFFFFFFFFFEFFFFFLL | v22;
    char v23 = objc_opt_respondsToSelector();
    uint64_t v24 = 0x400000;
    if ((v23 & 1) == 0) {
      uint64_t v24 = 0;
    }
    *(void *)p_uint64_t navigationControllerFlags = *(void *)p_navigationControllerFlags & 0xFFFFFFFFFFBFFFFFLL | v24;
    char v25 = objc_opt_respondsToSelector();
    uint64_t v26 = 0x200000;
    if ((v25 & 1) == 0) {
      uint64_t v26 = 0;
    }
    *(void *)p_uint64_t navigationControllerFlags = *(void *)p_navigationControllerFlags & 0xFFFFFFFFFFDFFFFFLL | v26;
    char v27 = objc_opt_respondsToSelector();
    uint64_t v28 = 0x1000000;
    if ((v27 & 1) == 0) {
      uint64_t v28 = 0;
    }
    *(void *)p_uint64_t navigationControllerFlags = *(void *)p_navigationControllerFlags & 0xFFFFFFFFFEFFFFFFLL | v28;
    char v29 = objc_opt_respondsToSelector();
    uint64_t v30 = 0x800000;
    if ((v29 & 1) == 0) {
      uint64_t v30 = 0;
    }
    *(void *)p_uint64_t navigationControllerFlags = *(void *)p_navigationControllerFlags & 0xFFFFFFFFFF7FFFFFLL | v30;
    char v31 = objc_opt_respondsToSelector();
    uint64_t v32 = 0x2000000;
    if ((v31 & 1) == 0) {
      uint64_t v32 = 0;
    }
    *(void *)p_uint64_t navigationControllerFlags = *(void *)p_navigationControllerFlags & 0xFFFFFFFFFDFFFFFFLL | v32;
    char v33 = objc_opt_respondsToSelector();
    uint64_t v34 = 0x4000000;
    if ((v33 & 1) == 0) {
      uint64_t v34 = 0;
    }
    *(void *)p_uint64_t navigationControllerFlags = *(void *)p_navigationControllerFlags & 0xFFFFFFFFFBFFFFFFLL | v34;
    char v35 = objc_opt_respondsToSelector();
    uint64_t v36 = 0x8000000;
    if ((v35 & 1) == 0) {
      uint64_t v36 = 0;
    }
    *(void *)p_uint64_t navigationControllerFlags = *(void *)p_navigationControllerFlags & 0xFFFFFFFFF7FFFFFFLL | v36;
    char v37 = objc_opt_respondsToSelector();
    uint64_t v38 = 0x10000000;
    if ((v37 & 1) == 0) {
      uint64_t v38 = 0;
    }
    *(void *)p_uint64_t navigationControllerFlags = *(void *)p_navigationControllerFlags & 0xFFFFFFFFEFFFFFFFLL | v38;
    char v39 = objc_opt_respondsToSelector();
    uint64_t v40 = 0x20000000;
    if ((v39 & 1) == 0) {
      uint64_t v40 = 0;
    }
    *(void *)p_uint64_t navigationControllerFlags = *(void *)p_navigationControllerFlags & 0xFFFFFFFFDFFFFFFFLL | v40;
    char v41 = objc_opt_respondsToSelector();
    uint64_t v42 = 0x40000000;
    if ((v41 & 1) == 0) {
      uint64_t v42 = 0;
    }
    *(void *)p_uint64_t navigationControllerFlags = *(void *)p_navigationControllerFlags & 0xFFFFFFFFBFFFFFFFLL | v42;
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (BOOL)_isCreatedBySplitViewController
{
  return *((unsigned char *)&self->_navigationControllerFlags + 8) & 1;
}

- (void)_viewSubtreeDidGainScrollView:(id)a3 enclosingViewController:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  unsigned __int8 v7 = [(UINavigationController *)self _outermostNavigationController];
  id v8 = v7;
  if (v7 == self)
  {
    [(UINavigationController *)self _handleSubtreeDidGainScrollView:v13];
    int v9 = [(UIViewController *)self _tabBarControllerEnforcingClass:1];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v12 = [(UIViewController *)self presentingViewController];
      id v11 = [v12 _tabBarControllerEnforcingClass:1];
    }
    [v11 _viewSubtreeDidGainScrollView:v13 enclosingViewController:v6];
  }
  else
  {
    [(UINavigationController *)v7 _viewSubtreeDidGainScrollView:v13 enclosingViewController:v6];
  }
}

- (void)_handleSubtreeDidGainScrollView:(id)a3
{
  id v12 = a3;
  id v4 = [(UINavigationController *)self topViewController];
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, 1, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, 4, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v7 = [v12 window];
  if (v7)
  {

    if (v5 == v12 || v6 == v12)
    {
      if (([v5 _isScrollViewScrollObserver:self] & 1) == 0)
      {
        if (v5 == v12) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = 4;
        }
        _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, v10, 1);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [v9 _safeAreaInsetsFrozen];
        if (v9 != v5) {
          [v9 _setSafeAreaInsetsFrozen:1];
        }
        [(UINavigationController *)self _computeAndApplyScrollContentInsetDeltaForViewController:v4];
        [v9 _setSafeAreaInsetsFrozen:v11 updateForUnfreeze:0];
        goto LABEL_18;
      }
      if (!v6 || v6 == v5 || ([v6 _isScrollViewScrollObserver:self] & 1) != 0)
      {
        if ((*(void *)&self->_navigationControllerFlags & 0x1E00000000000000) == 0)
        {
          id v8 = [v4 navigationItem];
          -[UINavigationController _updateScrollViewObservationFlagsForScrollView:navigationItem:forEdges:](self, "_updateScrollViewObservationFlagsForScrollView:navigationItem:forEdges:");

          if (v6)
          {
            if (v6 != v12)
            {
              id v9 = [v4 navigationItem];
              [(UINavigationController *)self _updateScrollViewObservationFlagsForScrollView:v6 navigationItem:v9 forEdges:4];
LABEL_18:
            }
          }
        }
      }
      else
      {
        [(UINavigationController *)self _updateAndObserveScrollView:v6 viewController:v4 forEdges:4];
      }
    }
  }
}

- (void)removeChildViewController:(id)a3 notifyDidMove:(BOOL)a4
{
  BOOL v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UINavigationController;
  id v6 = a3;
  [(UIViewController *)&v11 removeChildViewController:v6 notifyDidMove:v4];
  unsigned __int8 v7 = objc_msgSend(v6, "_viewControllerForObservableScrollView", v11.receiver, v11.super_class);

  id v8 = [v7 _contentOrObservableScrollViewForEdge:1];
  id v9 = [v7 _contentOrObservableScrollViewForEdge:4];
  if ([v8 _isScrollViewScrollObserver:self])
  {
    [(UINavigationController *)self _stopObservingContentScrollView:v8];
LABEL_6:
    uint64_t v10 = [(UINavigationController *)self topViewController];
    [(UINavigationController *)self _resetScrollViewObservingForViewController:v10];

    goto LABEL_7;
  }
  if (v9 != v8 && [v9 _isScrollViewScrollObserver:self])
  {
    [v9 _removeScrollViewScrollObserver:self];
    goto LABEL_6;
  }
LABEL_7:
}

- (void)_stopObservingContentScrollViewsForViewController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _contentOrObservableScrollViewForEdge:1];
  [(UINavigationController *)self _stopObservingContentScrollView:v5];

  id v6 = [v4 _contentOrObservableScrollViewForEdge:4];

  [(UINavigationController *)self _stopObservingContentScrollView:v6];
}

- (void)_prepareForNestedDisplayWithNavigationController:(id)a3
{
  long long v16 = a3;
  id v4 = [(UINavigationController *)self viewControllers];
  uint64_t v5 = [v4 count];

  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Cannot display a nested UINavigationController with zero viewControllers: %@", self format];
  }
  id v6 = [(UINavigationController *)self _topViewControllerObservableScrollViewForEdge:1];
  [(UINavigationController *)self _stopObservingContentScrollView:v6];

  unsigned __int8 v7 = [(UINavigationController *)self _topViewControllerObservableScrollViewForEdge:4];
  [(UINavigationController *)self _stopObservingContentScrollView:v7];

  [(UINavigationController *)self _setIsNestedNavigationController:1];
  id v8 = [(UINavigationController *)self interactivePopGestureRecognizer];
  [v8 setEnabled:0];

  p_unint64_t navigationControllerFlags = &self->_navigationControllerFlags;
  char v10 = *((unsigned char *)&self->_navigationControllerFlags + 8);
  unint64_t navigationControllerFlags = (unint64_t)self->_navigationControllerFlags;
  if (navigationControllerFlags)
  {
    *((unsigned char *)&self->_navigationControllerFlags + 8) = v10;
    *(void *)p_unint64_t navigationControllerFlags = (navigationControllerFlags >> 4) & 0x80000000000 | navigationControllerFlags & 0xFFFF77FFFFFFFFFFLL;
  }
  else
  {
    *(void *)p_unint64_t navigationControllerFlags = navigationControllerFlags | 0x80000000000;
    *((unsigned char *)&self->_navigationControllerFlags + 8) = v10;
    [(UINavigationController *)self setNavigationBarHidden:1 animated:0];
  }
  int v12 = [v16 isToolbarHidden];
  id v13 = v16 + 154;
  uint64_t v14 = v16[154];
  char v15 = *((unsigned char *)v16 + 1240);
  if (v12)
  {
    *id v13 = v14 & 0xFFFFEFFFFFFFFFFFLL;
    *((unsigned char *)v16 + 1240) = v15;
  }
  else
  {
    *id v13 = v14 | 0x100000000000;
    *((unsigned char *)v16 + 1240) = v15;
    [v16 setToolbarHidden:1];
  }
  [(UIViewController *)self setDefinesPresentationContext:0];
}

- (void)_calculateTopViewFramesFromLayoutHeightsWithViewController:(id)a3 contentScrollView:(id)a4 preservingContentInset:(BOOL)a5 respectFullExtension:(BOOL)a6 gettingNavBarFrame:(CGRect *)a7 topPaletteFrame:(CGRect *)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  [(UINavigationController *)self _widthForLayout];
  double v17 = v16;
  if ([v14 _isNestedNavigationController])
  {
    char v18 = [v14 navigationBar];
    uint64_t v19 = [v18 topItem];
  }
  else
  {
    uint64_t v19 = [v14 navigationItem];
  }
  v97 = (void *)v19;
  [(UINavigationBar *)self->_navigationBar _layoutHeightsForNavigationItem:v19 fittingWidth:v17];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  [(UINavigationController *)self _topPalettePreferredLayoutHeightForVisibilityStateIfDisplayedForViewController:v14];
  double v27 = v26;
  BOOL v28 = [(UINavigationController *)self _interactiveScrollActive];
  if (v15) {
    int v29 = [v15 _hasContentForBarInteractions];
  }
  else {
    int v29 = 0;
  }
  int v30 = (v28 | v29) & v11;
  CGRect v96 = v15;
  CGFloat rect = v17;
  if (v30 == 1)
  {
    double v31 = _possibleTopViewsHeightBasedOnContentOffsetForScrollView(self, v15);
    if (v31 == 0.0)
    {
      uint64_t v32 = [(UINavigationController *)self topViewController];
      int v33 = [v32 _isNavigationController];

      if (v33)
      {
        [(UIView *)self->_navigationBar bounds];
        double v31 = v27 + CGRectGetHeight(v108);
      }
      else
      {
        double v31 = v23 + v27;
      }
    }
  }
  else
  {
    double v31 = v25 + v27;
  }
  double v34 = 0.0;
  if (self->_topPalette) {
    double v34 = v27;
  }
  double v35 = v31 - v34;
  double v36 = v23 - (v31 - v34);
  if (v36 < 0.05) {
    double v21 = v23;
  }
  if ((v30 & v10) == 1)
  {
    char v37 = v97;
    if (v25 <= v23 || v36 >= 0.05)
    {
      double v25 = v21;
    }
    else
    {
      double v36 = v25 - v35;
      if (v25 - v35 >= 0.05)
      {
        CGRect v93 = a8;
        uint64_t v38 = [(UINavigationBar *)self->_navigationBar _stack];
        char v39 = [(UINavigationController *)self viewControllers];
        uint64_t v40 = [v39 count];

        char v41 = [(UINavigationController *)self topViewController];
        int v42 = [v41 _isNestedNavigationController];

        if (v42)
        {
          uint64_t v43 = [(UINavigationController *)self topViewController];
          id v44 = [v43 viewControllers];
          uint64_t v45 = [v44 count];

          BOOL v46 = v45 != 0;
          uint64_t v47 = v45 - 1;
          char v37 = v97;
          if (!v46) {
            uint64_t v47 = 0;
          }
          v40 += v47;
        }
        CGRect v94 = v38;
        uint64_t v48 = [v38 itemCount];
        uint64_t v49 = v48 - 1;
        if (v40 != v48 && v40 != v49)
        {
          if (os_variant_has_internal_diagnostics())
          {
            id v88 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
            {
              BOOL v89 = [(UINavigationController *)self viewControllers];
              CGFloat v90 = [v94 items];
              *(_DWORD *)buf = 138412546;
              int64_t v104 = v89;
              __int16 v105 = 2112;
              BOOL v106 = v90;
              _os_log_fault_impl(&dword_1853B0000, v88, OS_LOG_TYPE_FAULT, "Unexpected configuration of navigation stack. viewControllers = %@, stack.items = %@", buf, 0x16u);
            }
            char v37 = v97;
          }
          else
          {
            BOOL v84 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_calculateTopViewFramesFromLayoutHeightsWithViewController_contentScrollView_preservingContentInset_respectFullExtension_gettingNavBarFrame_topPaletteFrame____s_category)+ 8);
            if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            {
              CGSize v85 = v84;
              uint64_t v86 = [(UINavigationController *)self viewControllers];
              v87 = [v94 items];
              *(_DWORD *)buf = 138412546;
              int64_t v104 = v86;
              __int16 v105 = 2112;
              BOOL v106 = v87;
              _os_log_impl(&dword_1853B0000, v85, OS_LOG_TYPE_ERROR, "Unexpected configuration of navigation stack. viewControllers = %@, stack.items = %@", buf, 0x16u);

              char v37 = v97;
            }
          }
        }
        if (v40 == v49)
        {
          long long v51 = [v94 previousBackEntry];
          id v52 = v51;
          if (v51)
          {
            id v53 = v51;
          }
          else
          {
            id v53 = [v94 backEntry];
          }
          long long v50 = v53;
        }
        else
        {
          long long v50 = [v94 topEntry];
        }
        long long v54 = [v50 activeLayout];
        long long v55 = -[_UINavigationBarLayout restingHeights](v54);

        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        uint64_t v92 = v55;
        BOOL v56 = [v55 reverseObjectEnumerator];
        uint64_t v57 = [v56 countByEnumeratingWithState:&v98 objects:v102 count:16];
        if (v57)
        {
          uint64_t v58 = v57;
          uint64_t v91 = v50;
          uint64_t v59 = *(void *)v99;
          double v60 = v35 + 0.05;
          while (2)
          {
            for (uint64_t i = 0; i != v58; ++i)
            {
              if (*(void *)v99 != v59) {
                objc_enumerationMutation(v56);
              }
              long long v62 = *(void **)(*((void *)&v98 + 1) + 8 * i);
              [v62 doubleValue];
              if (v63 <= v60)
              {
                [v62 doubleValue];
                double v21 = v64;
                goto LABEL_45;
              }
            }
            uint64_t v58 = [v56 countByEnumeratingWithState:&v98 objects:v102 count:16];
            if (v58) {
              continue;
            }
            break;
          }
LABEL_45:
          char v37 = v97;
          long long v50 = v91;
        }

        double v25 = v21;
        a8 = v93;
      }
    }
  }
  else
  {
    double v25 = v21;
    char v37 = v97;
  }
  [(UIView *)self->_navigationBar frame];
  CGFloat v66 = v65;
  CGFloat v68 = v67;
  if (self->__positionBarsExclusivelyWithSafeArea)
  {
    long long v69 = [(UINavigationController *)self navigationBar];
    uint64_t v70 = [v69 traitCollection];
    uint64_t v71 = [v70 userInterfaceIdiom];

    if (v71 == 3)
    {
      [(UIViewController *)self _contentOverlayInsets];
      CGFloat v66 = v72;
    }
  }
  topPalette = self->_topPalette;
  if (topPalette)
  {
    [(UIView *)topPalette frame];
    CGFloat v75 = v74;
    CGFloat MaxY = v76;
    CGFloat v79 = v78;
    CGFloat v81 = v80;
    uint64_t v82 = self->_topPalette;
    if (v82)
    {
      CGFloat v83 = [(UINavigationDeferredTransitionContext *)self->_deferredTransitionContext outgoingTopPalette];

      if (v82 != v83)
      {
        v109.origin.double x = v66;
        v109.origin.CGFloat y = v68;
        v109.size.CGFloat width = rect;
        v109.size.height = v25;
        CGFloat MaxY = CGRectGetMaxY(v109);
        CGFloat v81 = v27;
      }
    }
  }
  else
  {
    CGFloat v75 = *MEMORY[0x1E4F1DB28];
    CGFloat MaxY = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v79 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v81 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  if (a7)
  {
    a7->origin.double x = v66;
    a7->origin.CGFloat y = v68;
    a7->size.CGFloat width = rect;
    a7->size.height = v25;
  }
  if (a8)
  {
    a8->origin.double x = v75;
    a8->origin.CGFloat y = MaxY;
    a8->size.CGFloat width = v79;
    a8->size.height = v81;
  }
}

- (void)_stopObservingContentScrollView:(id)a3
{
  id v4 = a3;
  if ([v4 _isScrollViewScrollObserver:self])
  {
    [(UINavigationController *)self _setInteractiveScrollActive:0];
    [v4 _setTopScrollIndicatorFollowsContentOffset:0];
    [v4 _setVerticalScrollIndicatorUsesAlternativeTopSafeAreaInset:0];
    [v4 _setAlternativeVerticalScrollIndicatorTopSafeAreaInset:0.0];
    [v4 _removeScrollViewScrollObserver:self];
  }
}

- (void)setToolbarHidden:(BOOL)hidden animated:(BOOL)animated
{
  BOOL v4 = hidden;
  if (animated) {
    double v6 = 0.2;
  }
  else {
    double v6 = 0.0;
  }
  if ((*(void *)&self->_navigationControllerFlags & 4) != 0)
  {
    BOOL v8 = animated;
    id v9 = [(UINavigationController *)self disappearingViewController];
    if (v9)
    {
      BOOL v10 = [(UIViewController *)self mutableChildViewControllers];
      BOOL v11 = [(UINavigationController *)self disappearingViewController];
      int v12 = [v10 containsObject:v11] ^ 1;
    }
    else
    {
      int v12 = 0;
    }

    id v13 = [(UIViewController *)self view];
    int v14 = [v13 _shouldReverseLayoutDirection];

    uint64_t v15 = 2;
    if (v14) {
      uint64_t v16 = 8;
    }
    else {
      uint64_t v16 = 2;
    }
    if (!v14) {
      uint64_t v15 = 8;
    }
    if (v4) {
      uint64_t v17 = v15;
    }
    else {
      uint64_t v17 = v16;
    }
    if (v4) {
      uint64_t v15 = v16;
    }
    if (v12) {
      uint64_t v7 = v17;
    }
    else {
      uint64_t v7 = v15;
    }
    double v6 = 0.0;
    if (v8)
    {
      [(UINavigationController *)self durationForTransition:1];
      double v6 = v18;
    }
  }
  else
  {
    uint64_t v7 = 4;
  }
  if ([(UINavigationController *)self _isNestedNavigationController]) {
    *(void *)&self->_navigationControllerFlags &= ~0x100000000000uLL;
  }
  [(UINavigationController *)self _setToolbarHidden:v4 edge:v7 duration:v6];
}

- (void)setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated
{
  BOOL v4 = animated;
  BOOL v5 = hidden;
  id v10 = [(UINavigationController *)self _outermostNavigationController];
  uint64_t v7 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionContext];

  if (v7)
  {
    BOOL v8 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionContext];
    LOBYTE(v7) = [v8 transitionWasCancelled];
  }
  if (!v4 || (v7 & 1) != 0)
  {
    [v10 _setNavigationBarHidden:v5 edge:1 duration:0.0];
  }
  else
  {
    if ([(UINavigationController *)self _isTransitioning]) {
      [(_UIViewControllerTransitionConductor *)self->_transitionConductor customNavigationTransitionDuration];
    }
    else {
      double v9 = 0.2;
    }
    [v10 _setNavigationBarHidden:v5 edgeIfNotNavigating:1 duration:v9];
  }
}

- (void)_setToolbarHidden:(BOOL)a3 edge:(unint64_t)a4 duration:(double)a5
{
  BOOL v7 = a3;
  if (a4 == 15)
  {
    BOOL v10 = 1;
  }
  else if ([(UINavigationController *)self _shouldCrossFadeBottomBars])
  {
    BOOL v10 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor shouldAnimateBottomBarVisibility];
  }
  else
  {
    BOOL v10 = 0;
  }
  if (((*(void *)&self->_navigationControllerFlags >> 1) & 1) == v7)
  {
    BOOL v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"_UINavigationControllerToolbarVisibilityWillChangeNotification" object:self];

    if (!v10
      || (*(void *)&self->_navigationControllerFlags & 0xC00000000) == 0
      || ![(UIViewController *)self isViewLoaded])
    {
      goto LABEL_61;
    }
    int v12 = [(UIViewController *)self tabBarController];
    id v13 = [v12 tabBar];

    int v14 = [(UINavigationController *)self toolbar];
    uint64_t v15 = [v13 barStyle];
    if (v15 != [v14 barStyle]) {
      goto LABEL_60;
    }
    uint64_t v16 = [v13 barTintColor];
    v126 = v14;
    id v127 = v13;
    if (v16 || ([v14 barTintColor], (id v121 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v13 = [v13 barTintColor];
      int v14 = [v14 barTintColor];
      if (![v13 isEqual:v14])
      {
        BOOL v17 = 0;
        goto LABEL_19;
      }
      int v124 = 1;
    }
    else
    {
      int v124 = 0;
      id v121 = 0;
    }
    double v18 = [v127 backgroundImage];
    if (v18)
    {

      BOOL v17 = 0;
      if (!v124)
      {
LABEL_20:
        int v14 = v126;
        id v13 = v127;
        if (v16)
        {

          if (!v17) {
            goto LABEL_60;
          }
LABEL_24:
          if (!v7)
          {
            v197[0] = MEMORY[0x1E4F143A8];
            v197[1] = 3221225472;
            v197[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke;
            v197[3] = &unk_1E52E89B8;
            v197[4] = self;
            id v198 = v126;
            unint64_t v199 = a4;
            BOOL v200 = v10;
            +[UIView performWithoutAnimation:v197];
          }
          uint64_t v19 = MEMORY[0x1E4F1DAB8];
          long long v135 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 8);
          int v114 = [v126 _shouldStretchDuringCrossfadeTransition];
          if (v114)
          {
            double v20 = [v126 _backgroundView];
            [v20 bounds];
            double v22 = v21;

            double v23 = v127;
            [v127 bounds];
            double v25 = (v22 - v24) * 0.5;
            long long v135 = 0uLL;
            double v26 = 1.0;
            uint64_t v112 = 0;
            double v111 = v24 / v22;
          }
          else
          {
            double v26 = *(double *)v19;
            double v25 = *(double *)(v19 + 40);
            double v111 = *(double *)(v19 + 24);
            uint64_t v112 = *(void *)(v19 + 32);
            double v23 = v127;
          }
          uint64_t v27 = [(UIViewController *)self view];
          id v120 = [v23 barTintColor];
          char v28 = [v23 isTranslucent];
          int v122 = [v126 isTranslucent];
          if ((*(void *)&self->_navigationControllerFlags & 0x400000000) == 0) {
            double v23 = v126;
          }
          int v29 = [v23 _backgroundView];
          [v29 frame];
          long long v125 = (void *)v27;
          objc_msgSend(v23, "convertRect:toView:", v27);
          double v31 = v30;
          double v33 = v32;
          double v35 = v34;
          double v37 = v36;

          char v116 = v28;
          if ((v28 & 1) != 0 || v122)
          {
            uint64_t v38 = -[_UIBarBackground initWithFrame:]([_UIBarBackground alloc], "initWithFrame:", v31, v33, v35, v37);
            [(_UIBarBackground *)v38 setTopAligned:0];
            char v41 = objc_alloc_init(_UIBarBackgroundLayoutLegacy);
            [(_UIBarBackground *)v38 setLayout:v41];
            -[_UIBarBackgroundLayoutLegacy configureEffectForStyle:backgroundTintColor:forceOpaque:](v41, "configureEffectForStyle:backgroundTintColor:forceOpaque:", [v127 barStyle], v120, 0);
            v113 = v41;
            -[_UIBarBackgroundLayoutLegacy configureShadowForBarStyle:](v41, "configureShadowForBarStyle:", [v127 barStyle]);
            int v42 = [v127 traitCollection];
            uint64_t v43 = self;
            id v44 = [v42 objectForTrait:v43];
            [(_UIBarBackground *)v38 setGroupName:v44];

            int v14 = v126;
            char v39 = v127;

            [(_UIBarBackground *)v38 transitionBackgroundViews];
            [(UIView *)v38 layoutIfNeeded];
          }
          else
          {
            uint64_t v38 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v31, v33, v35, v37);
            char v39 = v127;
            v113 = [v127 _backgroundView];
            uint64_t v40 = [v113 backgroundColor];
            [(UIView *)v38 setBackgroundColor:v40];
          }
          uint64_t v45 = [(UIView *)v38 layer];
          [v45 setAllowsGroupOpacity:0];

          BOOL v46 = [v14 superview];

          int v118 = v38;
          if (v46 == v125) {
            [v125 insertSubview:v38 belowSubview:v14];
          }
          else {
            [v125 addSubview:v38];
          }
          uint64_t v48 = [(UIViewController *)self view];
          uint64_t v49 = [v14 _backgroundView];
          [v49 bounds];
          double v51 = v50;
          double v53 = v52;
          double v55 = v54;
          double v57 = v56;
          uint64_t v58 = [v14 _backgroundView];
          objc_msgSend(v48, "convertRect:fromView:", v58, v51, v53, v55, v57);
          double MinY = CGRectGetMinY(v201);

          double v60 = [(UIViewController *)self view];
          id v61 = [v39 _backgroundView];
          [v61 bounds];
          double v63 = v62;
          double v65 = v64;
          double v67 = v66;
          double v69 = v68;
          uint64_t v70 = [v39 _backgroundView];
          objc_msgSend(v60, "convertRect:fromView:", v70, v63, v65, v67, v69);
          double v71 = CGRectGetMinY(v202);

          int v72 = v114;
          if (MinY >= v71) {
            int v72 = 1;
          }
          if (v71 >= MinY) {
            BOOL v73 = 0;
          }
          else {
            BOOL v73 = v39;
          }
          BOOL v74 = v72 == 0;
          CGFloat v75 = v126;
          if (!v74) {
            CGFloat v75 = v73;
          }
          id v76 = v75;
          if (v76) {
            uint64_t v77 = objc_alloc_init(UIView);
          }
          else {
            uint64_t v77 = 0;
          }
          double v78 = +[UIColor blackColor];
          [(UIView *)v77 setBackgroundColor:v78];

          [(UIView *)v77 setOpaque:1];
          v178[0] = MEMORY[0x1E4F143A8];
          v178[1] = 3221225472;
          v178[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_2;
          v178[3] = &unk_1E52E89E0;
          char v193 = v116;
          id v115 = v39;
          id v179 = v115;
          char v194 = v122;
          id v79 = v126;
          BOOL v195 = !v7;
          id v180 = v79;
          v181 = self;
          double v80 = v77;
          v182 = v80;
          id v81 = v76;
          id v183 = v81;
          double v184 = v26;
          long long v185 = v135;
          double v186 = v111;
          uint64_t v187 = v112;
          double v188 = v25;
          BOOL v196 = v7;
          uint64_t v189 = 0x3FF0000000000000;
          uint64_t v190 = 0;
          uint64_t v192 = 0;
          uint64_t v191 = 0;
          +[UIView performWithoutAnimation:v178];
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_3;
          aBlock[3] = &unk_1E52E8A08;
          BOOL v176 = !v7;
          void aBlock[4] = self;
          id v82 = v79;
          id v162 = v82;
          id v117 = v80;
          v163 = v117;
          id v83 = v81;
          id v164 = v83;
          uint64_t v167 = 0x3FF0000000000000;
          uint64_t v170 = 0;
          uint64_t v168 = 0;
          uint64_t v169 = 0;
          BOOL v84 = v118;
          v165 = v84;
          BOOL v177 = v7;
          double v171 = v26;
          long long v172 = v135;
          double v173 = v111;
          uint64_t v174 = v112;
          double v175 = v25;
          id v85 = v115;
          id v166 = v85;
          long long v123 = _Block_copy(aBlock);
          v156[0] = MEMORY[0x1E4F143A8];
          v156[1] = 3221225472;
          v156[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_4;
          v156[3] = &unk_1E52DD450;
          id v157 = v85;
          id v158 = v82;
          id v86 = v83;
          id v159 = v86;
          v87 = v84;
          v160 = v87;
          id v88 = (void (**)(void))_Block_copy(v156);
          BOOL v89 = [(UIViewController *)self transitionCoordinator];
          BOOL v119 = v86;
          if (v89)
          {
            v154[0] = MEMORY[0x1E4F143A8];
            v154[1] = 3221225472;
            v154[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_6;
            v154[3] = &unk_1E52DA110;
            id v155 = v123;
            v152[0] = MEMORY[0x1E4F143A8];
            v152[1] = 3221225472;
            v152[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_7;
            v152[3] = &unk_1E52DA110;
            v153 = v88;
            [v89 animateAlongsideTransitionInView:v87 animation:v154 completion:v152];

            id v13 = v127;
            a2 = v110;
          }
          else
          {
            a2 = v110;
            if (a5 <= 0.0)
            {
              v88[2](v88);
            }
            else
            {
              v150[0] = MEMORY[0x1E4F143A8];
              v150[1] = 3221225472;
              v150[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_8;
              v150[3] = &unk_1E52DA040;
              id v151 = v123;
              v148[0] = MEMORY[0x1E4F143A8];
              v148[1] = 3221225472;
              v148[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_9;
              v148[3] = &unk_1E52D9FE8;
              v149 = v88;
              +[UIView animateWithDuration:v150 animations:v148 completion:a5];
            }
            id v13 = v127;
          }

          int v14 = v126;
          goto LABEL_60;
        }

        if (v17) {
          goto LABEL_24;
        }
LABEL_60:

LABEL_61:
        CGFloat v90 = [(UIViewController *)self transitionCoordinator];
        BOOL v91 = [(UINavigationController *)self _hasInterruptibleNavigationTransition];
        if (v90) {
          BOOL v92 = [v90 presentationStyle] == -1;
        }
        else {
          BOOL v92 = 0;
        }
        if ([(UIViewController *)self isViewLoaded])
        {
          if (!v7)
          {
            v146[0] = MEMORY[0x1E4F143A8];
            v146[1] = 3221225472;
            v146[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_10;
            v146[3] = &unk_1E52E8040;
            v146[4] = self;
            v146[5] = a4;
            BOOL v147 = v10;
            +[UIView performWithoutAnimation:v146];
          }
          int v93 = a5 > 0.0 || v92;
          if (v93 == 1)
          {
            if (!v7 && !v10) {
              *(void *)&self->_navigationControllerFlags |= 0x4000000000000000uLL;
            }
            if ([(UINavigationController *)self isInteractiveTransition]) {
              [(UINavigationController *)self _startInteractiveToolbarTransition];
            }
            if (!v90 && v91)
            {
              CGRect v94 = [MEMORY[0x1E4F28B00] currentHandler];
              [v94 handleFailureInMethod:a2 object:self file:@"UINavigationController.m" lineNumber:3951 description:@"Expected a non-nil coordinator if there is an interruptible animator associated with this transition"];
            }
          }
          else if (a5 == 0.0)
          {
            v145[0] = MEMORY[0x1E4F143A8];
            v145[1] = 3221225472;
            v145[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_11;
            v145[3] = &unk_1E52D9F70;
            v145[4] = self;
            +[UIView performWithoutAnimation:v145];
          }
        }
        uint64_t v95 = 2;
        if (v7) {
          uint64_t v95 = 0;
        }
        *(void *)&self->_unint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFFFFFDLL | v95;
        if (objc_opt_respondsToSelector()) {
          [(_UINavigationControllerVisualStyle *)self->_visualStyle toolbarVisibilityChanged];
        }
        if (![(UIViewController *)self isViewLoaded]) {
          goto LABEL_118;
        }
        v142[0] = MEMORY[0x1E4F143A8];
        v142[1] = 3221225472;
        v142[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_12;
        v142[3] = &unk_1E52E8A30;
        BOOL v143 = v7;
        v142[4] = self;
        v142[5] = a4;
        BOOL v144 = v10;
        CGRect v96 = (void (**)(void))_Block_copy(v142);
        v97 = v96;
        if (v91)
        {
          v140[0] = MEMORY[0x1E4F143A8];
          v140[1] = 3221225472;
          v140[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_13;
          v140[3] = &unk_1E52DA110;
          v141 = v96;
          v138[0] = MEMORY[0x1E4F143A8];
          v138[1] = 3221225472;
          v138[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_14;
          v138[3] = &unk_1E52E7B28;
          BOOL v139 = v7;
          v138[4] = self;
          [v90 animateAlongsideTransition:v140 completion:v138];
        }
        else
        {
          int v98 = a5 > 0.0 || v92;
          if (v98 == 1)
          {
            double v99 = a5;
            if (v90)
            {
              [v90 transitionDuration];
              double v99 = v100;
            }
            BOOL v101 = [(UINavigationController *)self isInteractiveTransition];
            if (v101) {
              uint64_t v102 = 196608;
            }
            else {
              uint64_t v102 = 0;
            }
            if (!v101 && v90) {
              uint64_t v102 = [v90 completionCurve] << 16;
            }
            *(void *)&long long v135 = 0;
            *((void *)&v135 + 1) = &v135;
            uint64_t v136 = 0x2020000000;
            char v137 = 0;
            v132[0] = MEMORY[0x1E4F143A8];
            v132[1] = 3221225472;
            v132[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_15;
            v132[3] = &unk_1E52DA288;
            id v133 = v97;
            v134 = &v135;
            v131[0] = MEMORY[0x1E4F143A8];
            v131[1] = 3221225472;
            v131[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_16;
            v131[3] = &unk_1E52E5B98;
            v131[4] = self;
            v131[5] = &v135;
            +[UIView animateWithDuration:v102 delay:v132 options:v131 animations:v99 completion:0.0];
            if (!*(unsigned char *)(*((void *)&v135 + 1) + 24)) {
              [(UINavigationController *)self _hideShowToolbarDidStop:@"UINavigationControllerHideShowToolbar" finished:MEMORY[0x1E4F1CC38] context:0];
            }

            _Block_object_dispose(&v135, 8);
          }
          else
          {
            v96[2](v96);
          }
        }
        v130[0] = MEMORY[0x1E4F143A8];
        v130[1] = 3221225472;
        v130[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_17;
        v130[3] = &unk_1E52D9CD0;
        v130[4] = self;
        v130[5] = a4;
        id v103 = (void (**)(void))_Block_copy(v130);
        if (a5 > 0.0 || v90)
        {
          if (v91) {
            goto LABEL_116;
          }
          if ([(UINavigationController *)self isInteractiveTransition]) {
            [(UINavigationController *)self _finishAnimationTracking];
          }
          if (a5 > 0.0 || v92) {
            goto LABEL_116;
          }
        }
        else if ((*(void *)&self->_navigationControllerFlags & 0x10000) != 0)
        {
          int64_t v104 = [(UINavigationController *)self topViewController];
          __int16 v105 = [v104 transitionCoordinator];

          v128[0] = MEMORY[0x1E4F143A8];
          v128[1] = 3221225472;
          v128[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_18;
          v128[3] = &unk_1E52E79C0;
          v128[4] = self;
          long long v129 = v103;
          [v105 animateAlongsideTransition:0 completion:v128];

LABEL_117:
LABEL_118:

          return;
        }
        uint64_t v107 = [NSNumber numberWithBool:1];
        [(UINavigationController *)self _hideShowToolbarDidStop:@"UINavigationControllerHideShowToolbar" finished:v107 context:0];

LABEL_116:
        v103[2](v103);
        goto LABEL_117;
      }
    }
    else
    {
      uint64_t v47 = [v126 backgroundImageForToolbarPosition:1 barMetrics:0];
      if (v47
        || ([v126 backgroundImageForToolbarPosition:1 barMetrics:1],
            (uint64_t v47 = objc_claimAutoreleasedReturnValue()) != 0))
      {

        BOOL v17 = 0;
      }
      else
      {
        CGRect v108 = [v126 backgroundImageForToolbarPosition:4 barMetrics:0];
        if (v108)
        {
          BOOL v17 = 0;
        }
        else
        {
          CGRect v109 = [v126 backgroundImageForToolbarPosition:4 barMetrics:1];
          BOOL v17 = v109 == 0;

          CGRect v108 = 0;
        }
      }
      if ((v124 & 1) == 0) {
        goto LABEL_20;
      }
    }
LABEL_19:

    goto LABEL_20;
  }
}

- (void)_setNavigationBarHidden:(BOOL)a3 edge:(unint64_t)a4 duration:(double)a5
{
  BOOL v5 = a3;
  if (((((*(void *)&self->_navigationControllerFlags & 1) == 0) ^ a3) & 1) == 0)
  {
    BOOL v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"_UINavigationControllerNavigationBarVisibilityWillChangeNotification" object:self];

    BOOL v11 = [(UINavigationController *)self _navigationBarHiddenByDefault:v5];
    BOOL v12 = [(UINavigationController *)self _isTransitioningOrPaletteIsTransitioning];
    if (!v5)
    {
      id v13 = [(UINavigationController *)self _navigationItems];
      [v11 _displayItemsKeepingOwningNavigationBar:v13];

      [(UINavigationController *)self _unhideNavigationBarForEdge:a4];
    }
    BOOL v14 = [(UINavigationController *)self _hasInterruptibleNavigationTransition];
    uint64_t v15 = [(UIViewController *)self transitionCoordinator];
    if (a5 > 0.0)
    {
      if ([(UINavigationController *)self isInteractiveTransition] || v14) {
        [(UINavigationController *)self _startInteractiveNavbarTransition];
      }
      if (v14 && !v15)
      {
        double v25 = [MEMORY[0x1E4F28B00] currentHandler];
        [v25 handleFailureInMethod:a2 object:self file:@"UINavigationController.m" lineNumber:3351 description:@"Expected a non-nil coordinator if there is an interruptible animator associated with this transition"];
      }
    }
    *(void *)&self->_unint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFFFFFELL | v5;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke;
    aBlock[3] = &unk_1E52E8980;
    BOOL v35 = v14;
    void aBlock[4] = self;
    void aBlock[5] = a4;
    BOOL v36 = v5;
    BOOL v37 = v12;
    uint64_t v16 = (void (**)(void))_Block_copy(aBlock);
    BOOL v17 = v16;
    if (a5 <= 0.0)
    {
      v16[2](v16);
    }
    else if (v14)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_2;
      v32[3] = &unk_1E52DA110;
      double v33 = v16;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_3;
      v30[3] = &unk_1E52E7B28;
      v30[4] = self;
      BOOL v31 = v5;
      [v15 animateAlongsideTransition:v32 completion:v30];
    }
    else
    {
      if ([(UINavigationController *)self isInteractiveTransition])
      {
        uint64_t v18 = 196608;
      }
      else if (v15)
      {
        uint64_t v18 = [v15 completionCurve] << 16;
      }
      else
      {
        uint64_t v18 = 0;
      }
      if (v5) {
        uint64_t v19 = v18 | 4;
      }
      else {
        uint64_t v19 = v18;
      }
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_4;
      v29[3] = &unk_1E52DC3A0;
      v29[4] = self;
      +[UIView animateWithDuration:v19 delay:v17 options:v29 animations:a5 completion:0.0];
    }
    -[UIViewController _invalidateBehaviorPreferences](self);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_5;
    v28[3] = &unk_1E52D9CD0;
    v28[4] = self;
    v28[5] = a4;
    double v20 = (void (**)(void))_Block_copy(v28);
    if (a5 <= 0.0)
    {
      if ((*(void *)&self->_navigationControllerFlags & 0x10000) != 0)
      {
        double v22 = [(UINavigationController *)self topViewController];
        double v23 = [v22 transitionCoordinator];

        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_6;
        v26[3] = &unk_1E52E79C0;
        v26[4] = self;
        uint64_t v27 = v20;
        [v23 animateAlongsideTransition:0 completion:v26];

        goto LABEL_32;
      }
      double v21 = [NSNumber numberWithBool:1];
      [(UINavigationController *)self _hideShowNavigationBarDidStop:@"UINavigationControllerHideShowNavigationBar" finished:v21 context:0];
    }
    else if (!v14 && [(UINavigationController *)self isInteractiveTransition])
    {
      +[UIView _finishAnimationTracking];
    }
    v20[2](v20);
LABEL_32:
  }
  if (objc_opt_respondsToSelector()) {
    [(_UINavigationControllerVisualStyle *)self->_visualStyle navigationBarVisibilityChanged];
  }
  [(UIViewController *)self _updateTabBarLayout];
  if (!v5 && [(UINavigationController *)self _isPushingOrPopping])
  {
    double v24 = -[UIViewController _containingTabBarController](self);

    if (v24) {
      [(UINavigationController *)self _positionNavigationBarHidden:0];
    }
  }
}

- (BOOL)_hasInterruptibleNavigationTransition
{
  return [(_UIViewControllerTransitionConductor *)self->_transitionConductor hasInterruptibleNavigationTransition];
}

- (void)setToolbarHidden:(BOOL)toolbarHidden
{
}

- (BOOL)_isTransitioningOrPaletteIsTransitioning
{
  if ([(UINavigationController *)self _isTransitioning]
    || (*(void *)&self->_navigationControllerFlags & 8) != 0)
  {
    return 1;
  }
  topPalette = self->_topPalette;
  return [(_UINavigationControllerPalette *)topPalette _restartPaletteTransitionIfNecessary];
}

void __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_5(uint64_t a1)
{
  if (*(void *)(a1 + 40) != 1) {
    [*(id *)(a1 + 32) _layoutTopViewController];
  }
  double v2 = *(void **)(a1 + 32);
  id v3 = [v2 topViewController];
  [v2 _computeAndApplyScrollContentInsetDeltaForViewController:v3];
}

- (void)_hideShowNavigationBarDidStop:(id)a3 finished:(id)a4 context:(id)a5
{
  BOOL v6 = [(UINavigationController *)self _navbarIsAppearingInteractively];
  if ([(UINavigationController *)self _navigationBarAnimationWasCancelled])
  {
    *(void *)&self->_navigationControllerFlags ^= 1uLL;
    [(UINavigationController *)self _setNavigationBarAnimationWasCancelled:0];
  }
  BOOL v7 = [(UINavigationController *)self navigationBar];
  id v19 = v7;
  if (*(void *)&self->_navigationControllerFlags)
  {
    BOOL v12 = [(UINavigationController *)self _navigationItems];
    [v19 _displayItemsKeepingOwningNavigationBar:v12];

    if ((*(void *)&self->_navigationControllerFlags & 0x2000) == 0)
    {
      topPalette = self->_topPalette;
      if (topPalette
        && [(_UINavigationControllerPalette *)topPalette isVisibleWhenPinningBarIsHidden])
      {
        [(UINavigationController *)self _repositionPaletteWithNavigationBarHidden:1 duration:1 shouldUpdateNavigationItems:0.0];
      }
      else
      {
        [v19 removeFromSuperview];
        [v19 setHidden:1];
        BOOL v14 = self->_topPalette;
        if (v14
          && ![(_UINavigationControllerPalette *)v14 isVisibleWhenPinningBarIsHidden])
        {
          [(UIView *)self->_topPalette removeFromSuperview];
        }
      }
    }
  }
  else
  {
    BOOL v8 = [v7 superview];
    double v9 = [(UINavigationController *)self navigationBar];
    [v8 bringSubviewToFront:v9];

    BOOL v10 = self->_topPalette;
    if (v10 && [(_UINavigationControllerPalette *)v10 boundaryEdge] == 5)
    {
      BOOL v11 = [(UIView *)self->_topPalette superview];
      if (v11)
      {
      }
      else if ([(_UINavigationControllerPalette *)self->_topPalette isAttached])
      {
        [(UINavigationController *)self _installPaletteIntoViewHierarchy:self->_topPalette];
        goto LABEL_18;
      }
      uint64_t v15 = [(UIView *)self->_topPalette superview];
      [v15 bringSubviewToFront:self->_topPalette];
    }
  }
LABEL_18:
  if (v6)
  {
    if (![(UINavigationController *)self _hasInterruptibleNavigationTransition])
    {
      uint64_t v16 = [v19 layer];
      [v16 setTimeOffset:0.0];
      LODWORD(v17) = 1.0;
      [v16 setSpeed:v17];
    }
    [(UINavigationController *)self _setNavbarAnimationId:0];
  }
  uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v18 postNotificationName:@"_UINavigationControllerNavigationBarVisibilityDidChangeNotification" object:self];
}

- (BOOL)_navbarIsAppearingInteractively
{
  double v2 = [(UINavigationController *)self _navbarAnimationId];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSUUID)_navbarAnimationId
{
  return self->__navbarAnimationId;
}

void __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_17(uint64_t a1)
{
  if (*(void *)(a1 + 40) != 4) {
    [*(id *)(a1 + 32) _layoutTopViewController];
  }
  id v5 = [*(id *)(a1 + 32) topViewController];
  objc_msgSend(*(id *)(a1 + 32), "_computeAndApplyScrollContentInsetDeltaForViewController:");
  if (_UIBarsApplyChromelessEverywhere())
  {
    double v2 = *(void **)(a1 + 32);
    if ((~v2[154] & 0x400000000002) == 0)
    {
      BOOL v3 = [v2 _outermostNavigationController];
      BOOL v4 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(v3, v5, 4, 0);
      [v3 _updateBackgroundTransitionProgressForScrollView:v4 toolbar:*(void *)(*(void *)(a1 + 32) + 1000)];
    }
  }
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_12(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1000) setAutoresizingMask:0];
  uint64_t result = [*(id *)(a1 + 32) _positionToolbarHidden:*(unsigned __int8 *)(a1 + 48) edge:*(void *)(a1 + 40) crossFade:*(unsigned __int8 *)(a1 + 49)];
  if (*(void *)(a1 + 40) == 4)
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 _layoutTopViewController];
  }
  return result;
}

- (void)_hideShowToolbarDidStop:(id)a3 finished:(id)a4 context:(id)a5
{
  id v24 = a4;
  BOOL v7 = [(UINavigationController *)self _toolbarIsAnimatingInteractively];
  uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  *(void *)&self->_uint64_t navigationControllerFlags = navigationControllerFlags & 0xFFFFFFFFFFFBFFFFLL;
  if ([(UINavigationController *)self _toolbarAnimationWasCancelled])
  {
    BOOL v9 = [(UINavigationController *)self isToolbarHidden];
    uint64_t v10 = (uint64_t)self->_navigationControllerFlags;
    char v11 = *((unsigned char *)&self->_navigationControllerFlags + 8);
    if (v9)
    {
      uint64_t v12 = v10 | 2;
      if ((navigationControllerFlags & 0x40000) != 0) {
        v12 &= ~0x400uLL;
      }
      *((unsigned char *)&self->_navigationControllerFlags + 8) = v11;
      *(void *)&self->_uint64_t navigationControllerFlags = v12;
      id v13 = [(UINavigationController *)self toolbar];
      BOOL v14 = v13;
      uint64_t v15 = 0;
    }
    else
    {
      unint64_t v18 = v10 & 0xFFFFFFFFFFFFFFFDLL;
      if ((navigationControllerFlags & 0x40000) != 0) {
        v18 |= 0x400uLL;
      }
      *((unsigned char *)&self->_navigationControllerFlags + 8) = v11;
      *(void *)&self->_uint64_t navigationControllerFlags = v18;
      id v19 = [(UINavigationController *)self toolbar];
      [v19 removeFromSuperview];

      id v13 = [(UINavigationController *)self toolbar];
      BOOL v14 = v13;
      uint64_t v15 = 1;
    }
    [v13 setHidden:v15];

    [(UINavigationController *)self _setToolbarAnimationWasCancelled:0];
  }
  else if ([v24 BOOLValue])
  {
    if ([(UINavigationController *)self isToolbarHidden])
    {
      uint64_t v16 = [(UINavigationController *)self toolbar];
      [v16 removeFromSuperview];

      double v17 = [(UINavigationController *)self toolbar];
      [v17 setHidden:1];
    }
    else if (a5)
    {
      [(UINavigationController *)self _layoutTopViewController];
    }
  }
  if (v7)
  {
    if (![(UINavigationController *)self _hasInterruptibleNavigationTransition])
    {
      double v20 = [(UINavigationController *)self _existingToolbar];
      double v21 = [v20 layer];
      [v21 setTimeOffset:0.0];
      LODWORD(v22) = 1.0;
      [v21 setSpeed:v22];
    }
    [(UINavigationController *)self _setToolbarAnimationId:0];
  }
  [(UIView *)self->_toolbar setAutoresizingMask:10];
  double v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v23 postNotificationName:@"_UINavigationControllerToolbarVisibilityDidChangeNotification" object:self];
}

- (BOOL)_toolbarAnimationWasCancelled
{
  return self->__toolbarAnimationWasCancelled;
}

- (BOOL)_toolbarIsAnimatingInteractively
{
  double v2 = [(UINavigationController *)self _toolbarAnimationId];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSUUID)_toolbarAnimationId
{
  return self->__toolbarAnimationId;
}

- (id)_screenEdgePanGestureRecognizer
{
  double v2 = [(_UINavigationControllerVisualStyle *)self->_visualStyle interactionController];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [v2 screenEdgePanGestureRecognizer];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

void __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    double v2 = [*(id *)(a1 + 32) _splitViewControllerEnforcingClass:1];
    [v2 _navigationControllerDidChangeNavigationBarHidden:*(void *)(a1 + 32)];
  }
  BOOL v3 = *(void **)(a1 + 32);
  if (v3)
  {
    [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
    [v3 _setNeedsUserInterfaceAppearanceUpdate];
    [v3 setNeedsWhitePointAdaptivityStyleUpdate];
  }
  BOOL v4 = +[UIDevice currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 && *(void *)(a1 + 40) == 1)
  {
    BOOL v6 = *(void **)(a1 + 32);
    if ((v6[154] & 0x2000) != 0)
    {
      BOOL v7 = [v6 navigationBar];
      BOOL v8 = [v7 superview];
      BOOL v9 = [*(id *)(a1 + 32) navigationBar];
      [v8 sendSubviewToBack:v9];
    }
  }
  uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 1088);
  if (v10 && [v10 boundaryEdge] == 5)
  {
    if (*(unsigned char *)(a1 + 49)
      && ([*(id *)(*(void *)(a1 + 32) + 1088) isVisibleWhenPinningBarIsHidden] & 1) == 0)
    {
      char v11 = [*(id *)(*(void *)(a1 + 32) + 1088) superview];
      [v11 sendSubviewToBack:*(void *)(*(void *)(a1 + 32) + 1088)];
    }
    else
    {
      char v11 = [*(id *)(*(void *)(a1 + 32) + 1088) superview];
      [v11 bringSubviewToFront:*(void *)(*(void *)(a1 + 32) + 1088)];
    }
  }
  [*(id *)(a1 + 32) _positionNavigationBarHidden:*(unsigned __int8 *)(a1 + 49) edge:*(void *)(a1 + 40)];
  int v12 = [*(id *)(*(void *)(a1 + 32) + 1088) _restartPaletteTransitionIfNecessary];
  if (*(unsigned char *)(a1 + 50))
  {
    if (v12)
    {
      id v13 = *(void **)(a1 + 32);
      BOOL v14 = [v13 transitionCoordinator];
      [v13 _startPaletteTransitionIfNecessary:v14 animated:0];
    }
  }
  else
  {
    [*(id *)(a1 + 32) _positionPaletteHidden:*(unsigned __int8 *)(a1 + 49) edge:*(void *)(a1 + 40)];
  }
  if (!*(unsigned char *)(a1 + 49))
  {
    uint64_t v15 = [*(id *)(a1 + 32) navigationBar];
    [v15 _fadeAllViewsIn];
  }
  if (*(void *)(a1 + 40) == 1)
  {
    uint64_t v16 = *(void **)(a1 + 32);
    [v16 _layoutTopViewController];
  }
}

- (void)_positionPaletteHidden:(BOOL)a3 edge:(unint64_t)a4 initialOffset:(double)a5
{
  BOOL v7 = a3;
  if ([(UINavigationController *)self _isTransitioning]) {
    return;
  }
  topPalette = self->_topPalette;
  if (!topPalette || [(_UINavigationControllerPalette *)topPalette boundaryEdge] == 5) {
    return;
  }
  uint64_t v10 = [(UINavigationController *)self navigationBar];
  [v10 frame];
  double v54 = v11;
  double v13 = v12;

  uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  [(UIView *)self->_topPalette bounds];
  double v59 = v15;
  double v60 = v16 * 0.5;
  double v17 = v16 * 0.5 + 0.0;
  if (!v7 && (navigationControllerFlags & 1) == 0
    || v7
    && ![(_UINavigationControllerPalette *)self->_topPalette _isPalettePinningBarHidden]
    && (a4 == 8 || a4 == 2))
  {
    double v17 = v13 + v17;
  }
  if ([(_UINavigationControllerPalette *)self->_topPalette paletteIsHidden])
  {
    [(UINavigationController *)self _frameForPalette:self->_topPalette];
    -[_UINavigationControllerPalette setFrame:](self->_topPalette, "setFrame:");
    [(UINavigationController *)self _installPaletteIntoViewHierarchy:self->_topPalette];
  }
  double v55 = v13;
  containerView = self->_containerView;
  if (containerView)
  {
    [(UIView *)containerView bounds];
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v27 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v56 = *MEMORY[0x1E4F1DB28];
  }
  else
  {
    CGFloat v20 = *MEMORY[0x1E4F1DB28];
    CGFloat v22 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v24 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v26 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v56 = *MEMORY[0x1E4F1DB28];
    CGFloat v27 = v22;
  }
  double v61 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v62 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  v64.origin.double x = v20;
  v64.origin.CGFloat y = v22;
  v64.size.CGFloat width = v24;
  v64.size.height = v26;
  double MidX = CGRectGetMidX(v64);
  v65.origin.double x = v20;
  v65.origin.CGFloat y = v22;
  v65.size.CGFloat width = v24;
  v65.size.height = v26;
  double MinY = CGRectGetMinY(v65);
  -[UINavigationController _computeTopBarCenter:hidden:edge:center:offset:](self, "_computeTopBarCenter:hidden:edge:center:offset:", self->_topPalette, v7, a4, MidX, MinY, v17);
  double v31 = v30;
  double v33 = v32;
  [(UIView *)self->_topPalette frame];
  double v57 = v34;
  double v58 = v35;
  if (self->_transitioningTopPalette)
  {
    -[UINavigationController _computeTopBarCenter:hidden:edge:center:offset:](self, "_computeTopBarCenter:hidden:edge:center:offset:", MidX, MinY, v17);
    double v37 = v36;
    double v39 = v38;
    [(UIView *)self->_transitioningTopPalette bounds];
    double v41 = v37 - v40 * 0.5;
    double v43 = v39 - v42 * 0.5;
    [(UIView *)self->_transitioningTopPalette frame];
    double v61 = v45;
    double v62 = v44;
    double v46 = v41;
  }
  else
  {
    double v46 = 0.0;
    double v43 = v27;
    double v41 = v56;
  }
  if (v7
    && [(_UINavigationControllerPalette *)self->_topPalette _isPalettePinningBarHidden]
    && (a4 == 8 || a4 == 2))
  {
    uint64_t v47 = self->_topPalette;
    double v48 = -v55;
  }
  else
  {
    uint64_t v47 = self->_topPalette;
    double v48 = a5;
  }
  [(_UINavigationControllerPalette *)v47 _setTopConstraintConstant:v48];
  double v49 = v31 + v59 * -0.5;
  double v50 = v33 - v60;
  if (a4 != 8 && a4 != 2)
  {
    -[_UINavigationControllerPalette setFrame:](self->_topPalette, "setFrame:", v49, v33 - v60, v57, v58);
    transitioningTopPalette = self->_transitioningTopPalette;
    if (!transitioningTopPalette) {
      return;
    }
    goto LABEL_43;
  }
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    if (!v7 || (navigationControllerFlags & 1) != 0)
    {
      if (!v7 && (navigationControllerFlags & 1) != 0)
      {
        [(_UINavigationControllerPalette *)self->_topPalette _setLeftConstraintConstant:v49 - v54];
        [(_UINavigationControllerPalette *)self->_topPalette _setTopConstraintConstant:-v55];
      }
    }
    else
    {
      [(_UINavigationControllerPalette *)self->_topPalette _setLeftConstraintConstant:v49];
    }
    -[_UINavigationControllerPalette setFrame:](self->_topPalette, "setFrame:", v49, v50, v57, v58);
    double v53 = self->_transitioningTopPalette;
    if (v53)
    {
      [(_UINavigationControllerPalette *)v53 _setLeftConstraintConstant:v46];
      transitioningTopPalette = self->_transitioningTopPalette;
LABEL_43:
      -[_UINavigationControllerPalette setFrame:](transitioningTopPalette, "setFrame:", v41, v43, v62, v61);
    }
  }
  else
  {
    -[_UINavigationControllerPalette setFrame:isAnimating:](self->_topPalette, "setFrame:isAnimating:", 0, v49, v50, v57, v58);
    double v51 = self->_transitioningTopPalette;
    if (v51)
    {
      -[_UINavigationControllerPalette setFrame:isAnimating:](v51, "setFrame:isAnimating:", 0, v41, v43, v62, v61);
    }
  }
}

- (void)_positionPaletteHidden:(BOOL)a3 edge:(unint64_t)a4
{
}

- (void)_setIsNestedNavigationController:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (void)_unhideNavigationBarForEdge:(unint64_t)a3
{
  uint64_t v5 = [(UINavigationController *)self _navigationBarHiddenByDefault:1];
  BOOL v6 = [(UIViewController *)self view];
  [v6 addSubview:v5];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__UINavigationController__unhideNavigationBarForEdge___block_invoke;
  v8[3] = &unk_1E52DA070;
  id v9 = v5;
  unint64_t v10 = a3;
  v8[4] = self;
  id v7 = v5;
  +[UIView performWithoutAnimation:v8];
}

- (void)_updateBottomBarHiddenState
{
}

- (void)_updateBottomBarHiddenStateFromOtherNavigationController:(id)a3
{
  if (a3) {
    *(void *)&self->_navigationControllerFlags |= *((void *)a3 + 154) & 0x400;
  }
}

- (void)_resetBottomBarHiddenState
{
  *(void *)&self->_navigationControllerFlags &= ~0x400uLL;
}

- (CGSize)_preferredContentSizeForcingLoad:(BOOL)a3
{
  BOOL v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UINavigationController;
  [(UIViewController *)&v18 preferredContentSize];
  double v7 = v6;
  double v8 = v5;
  if (v6 == *MEMORY[0x1E4F1DB30] && v5 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    unint64_t v10 = [(UINavigationController *)self topViewController];

    if (v10)
    {
      double v11 = [(UINavigationController *)self topViewController];
      double v12 = v11;
      if (v3)
      {
        [v11 view];
      }
      [v12 preferredContentSize];
      double v7 = fmax(v14, v7);
      if (v13 == 0.0)
      {
        double v8 = fmax(v13, v8);
      }
      else
      {
        [(UINavigationController *)self _adjustedContentSizeForPopover:v7];
        double v8 = v15;
      }
    }
  }
  double v16 = v7;
  double v17 = v8;
  result.height = v17;
  result.CGFloat width = v16;
  return result;
}

- (void)_navigationBarChangedSize:(id)a3
{
  if (self->_interactiveScrollActive)
  {
    id v7 = [(UINavigationController *)self _topViewControllerObservableScrollViewForEdge:1];
    [v7 _setAutomaticContentOffsetAdjustmentEnabled:0];
    [(UINavigationController *)self _reloadCachedInteractiveScrollMeasurements];
    [(UINavigationController *)self _layoutTopViewController];
    [v7 _setAutomaticContentOffsetAdjustmentEnabled:1];
  }
  else
  {
    [(UIView *)self->_containerView setNeedsLayout];
    BOOL v4 = [(UINavigationController *)self _nestedTopViewController];
    [(UINavigationController *)self _updateTopViewFramesForViewController:v4];
    double v5 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, 1, 0);
    [(UINavigationController *)self _updateAndObserveScrollView:v5 viewController:v4 forEdges:1];

    if (self->_externallySetNavControllerPreferredContentSize.width == *MEMORY[0x1E4F1DB30]
      && self->_externallySetNavControllerPreferredContentSize.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      [(UINavigationController *)self _setPreferredContentSizeFromChildContentContainer:v4];
    }
    else
    {
      -[UINavigationController _adjustedContentSizeForPopover:](self, "_adjustedContentSizeForPopover:");
      v8.receiver = self;
      v8.super_class = (Class)UINavigationController;
      -[UIViewController setPreferredContentSize:](&v8, sel_setPreferredContentSize_);
    }
  }
}

- (void)_setPreferredContentSizeFromChildContentContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(UINavigationController *)self topViewController];

  if (v5 == v4)
  {
    [v4 preferredContentSize];
    double v7 = v6;
    double v9 = v8;
    v13.receiver = self;
    v13.super_class = (Class)UINavigationController;
    [(UIViewController *)&v13 preferredContentSize];
    if (v7 > 0.0) {
      double v10 = v7;
    }
    if (v9 > 0.0) {
      -[UINavigationController _adjustedContentSizeForPopover:](self, "_adjustedContentSizeForPopover:", v10, v9);
    }
    v12.receiver = self;
    v12.super_class = (Class)UINavigationController;
    -[UIViewController setPreferredContentSize:](&v12, sel_setPreferredContentSize_);
    self->_externallySetNavControllerPreferredContentSize = (CGSize)*MEMORY[0x1E4F1DB30];
    v11.receiver = self;
    v11.super_class = (Class)UINavigationController;
    [(UIViewController *)&v11 preferredContentSizeDidChangeForChildContentContainer:self];
  }
}

uint64_t __43__UINavigationController__configureToolbar__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "_setBarPosition:", objc_msgSend(*(id *)(a1 + 32), "_positionForBar:", *(void *)(*(void *)(a1 + 32) + 1000)));
  [*(id *)(*(void *)(a1 + 32) + 1000) setAutoresizingMask:10];
  [*(id *)(*(void *)(a1 + 32) + 1000) sizeToFit];
  double v2 = [*(id *)(*(void *)(a1 + 32) + 1000) superview];
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 976);

  if (v2 != v3) {
    [*(id *)(*(void *)(a1 + 32) + 976) addSubview:*(void *)(*(void *)(a1 + 32) + 1000)];
  }
  uint64_t v4 = [*(id *)(a1 + 32) isToolbarHidden];
  if ((v4 & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    double v6 = [v5 topViewController];
    [v5 _updateToolbarItemsFromViewController:v6 animated:0];
  }
  [*(id *)(a1 + 32) _positionToolbarHidden:v4];
  [*(id *)(*(void *)(a1 + 32) + 1000) setHidden:v4];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 1000) _setLocked:1];
  double v7 = *(void **)(a1 + 32);
  return [v7 _configureBarsAutomaticActions];
}

- (void)_updatePaletteConstraints
{
  topPalette = self->_topPalette;
  if (topPalette)
  {
    id v8 = [(_UINavigationControllerPalette *)topPalette _constraints];
    if ([v8 count])
    {
      uint64_t v4 = [(_UINavigationControllerPalette *)self->_topPalette _constraints];
      id v5 = [v4 firstObject];
      char v6 = [v5 isActive];

      if ((v6 & 1) == 0)
      {
        double v7 = self->_topPalette;
        [(_UINavigationControllerPalette *)v7 _configurePaletteConstraintsForBoundary];
      }
    }
    else
    {
    }
  }
}

void __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_10(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) toolbar];
  double v2 = [*(id *)(a1 + 32) view];
  [v2 addSubview:v6];

  BOOL v3 = [v6 layer];
  [v3 removeAllAnimations];

  [*(id *)(a1 + 32) _positionToolbarHidden:1 edge:*(void *)(a1 + 40) crossFade:*(unsigned __int8 *)(a1 + 48)];
  [v6 setHidden:0];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v4 topViewController];
  [v4 _updateToolbarItemsFromViewController:v5 animated:0];
}

- (void)_updateToolbarItemsFromViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = [(UINavigationController *)self topViewController];

  if (v6 == v9)
  {
    double v7 = [(UINavigationController *)self _existingToolbar];
    id v8 = [v9 toolbarItems];
    [v7 setItems:v8 animated:v4];
  }
}

- (id)_lastNavigationItems
{
  unint64_t v3 = [(UIViewController *)self childViewControllersCount];
  if (v3 < 2)
  {
    id v6 = 0;
  }
  else
  {
    unint64_t v4 = v3;
    id v5 = [(UIViewController *)self mutableChildViewControllers];
    id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4 - 1];
    for (uint64_t i = 1; i != v4; ++i)
    {
      id v8 = [v5 objectAtIndex:i];
      id v9 = [v8 navigationItem];
      [v6 addObject:v9];
    }
  }
  return v6;
}

- (void)viewDidLayoutSubviews
{
  BOOL v3 = [(UINavigationController *)self _shouldInteractivePopGestureBeEnabled];
  char v4 = *((unsigned char *)&self->_navigationControllerFlags + 8);
  if (((v3 ^ ((v4 & 4) == 0)) & 1) == 0)
  {
    char v5 = v4 & 0xFB;
    if (v3) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *(void *)&self->_uint64_t navigationControllerFlags = self->_navigationControllerFlags;
    *((unsigned char *)&self->_navigationControllerFlags + 8) = v5 | v6;
    [(UIViewController *)self setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
  }
}

- (BOOL)_shouldInteractivePopGestureBeEnabled
{
  BOOL v3 = [(UINavigationController *)self navigationBar];
  if ([v3 state]
    && ![(UINavigationController *)self _isCurrentTransitionPreemptable])
  {
    BOOL v10 = 0;
    goto LABEL_17;
  }
  char v4 = [(UINavigationController *)self topViewController];
  char v5 = [v4 searchDisplayController];
  char v6 = [v4 navigationItem];
  double v7 = [v6 _searchControllerIfAllowed];
  if ([(UINavigationController *)self isNavigationBarHidden]
    && !-[UINavigationController _allowsInteractivePopWhenNavigationBarHidden](self, "_allowsInteractivePopWhenNavigationBarHidden")&& ![v6 _allowsInteractivePopWhenNavigationBarHidden]|| !objc_msgSend(v6, "_allowsInteractivePop")|| objc_msgSend(v5, "isActive") && (objc_msgSend(v5, "isNavigationBarHidingEnabled") & 1) != 0|| objc_msgSend(v7, "isActive")&& (objc_msgSend(v7, "_hidesNavigationBarDuringPresentationRespectingInlineSearch") & 1) != 0|| (objc_msgSend(v6, "hidesBackButton") & 1) != 0)
  {
    goto LABEL_14;
  }
  id v8 = [v6 leftBarButtonItems];
  if (![v8 count])
  {

    goto LABEL_19;
  }
  int v9 = [v6 leftItemsSupplementBackButton];

  if (v9)
  {
LABEL_19:
    objc_super v12 = [(UINavigationController *)self previousViewController];
    BOOL v10 = v12 != 0;

    goto LABEL_15;
  }
LABEL_14:
  BOOL v10 = 0;
LABEL_15:

LABEL_17:
  return v10;
}

- (UIViewController)previousViewController
{
  double v2 = [(UIViewController *)self mutableChildViewControllers];
  unint64_t v3 = [v2 count];
  if (v3 < 2)
  {
    char v4 = 0;
  }
  else
  {
    char v4 = [v2 objectAtIndex:v3 - 2];
  }

  return (UIViewController *)v4;
}

- (BOOL)_allowsInteractivePopWhenNavigationBarHidden
{
  return ((unint64_t)*((unsigned __int8 *)&self->_navigationControllerFlags + 8) >> 3) & 1;
}

- (BOOL)_shouldPersistViewWhenCoding
{
  return 0;
}

- (UINavigationController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  v7.receiver = self;
  v7.super_class = (Class)UINavigationController;
  char v4 = [(UIViewController *)&v7 initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  char v5 = v4;
  if (v4) {
    [(UINavigationController *)v4 _commonNonCoderInit];
  }
  return v5;
}

- (void)didMoveToParentViewController:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UINavigationController;
  [(UIViewController *)&v3 didMoveToParentViewController:a3];
}

- (void)_setCreatedBySplitViewController:(BOOL)a3
{
  *((unsigned char *)&self->_navigationControllerFlags + 8) = *((unsigned char *)&self->_navigationControllerFlags + 8) & 0xFE | a3;
}

void __53__UINavigationController_setNeedsDeferredTransition___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v2 = WeakRetained;
    [WeakRetained[122] layoutSubviews];
    id WeakRetained = v2;
  }
}

- (void)_updateChildContentMargins
{
  v5.receiver = self;
  v5.super_class = (Class)UINavigationController;
  [(UIViewController *)&v5 _updateChildContentMargins];
  objc_super v3 = [(UINavigationController *)self _existingNavigationBar];
  [v3 layoutMarginsDidChange];

  char v4 = [(UINavigationController *)self _existingToolbar];
  [v4 setNeedsLayout];
}

- (void)_layoutContainerViewSemanticContentAttributeChanged:(id)a3
{
  if (self->_containerView == a3) {
    [(_UINavigationControllerVisualStyle *)self->_visualStyle layoutContainerViewSemanticContentAttributeChanged:"layoutContainerViewSemanticContentAttributeChanged:"];
  }
}

- (void)_setDidExplicitlyHideTabBar:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)_didExplicitlyHideTabBar
{
  return (*(void *)&self->_navigationControllerFlags >> 11) & 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)UINavigationController;
  -[UIViewController viewDidDisappear:](&v17, sel_viewDidDisappear_);
  if ((*(void *)&self->_navigationControllerFlags & 0x4000000001000) == 0)
  {
    objc_super v5 = [(UINavigationController *)self _viewControllerForDisappearCallback];
    char v6 = v5;
    if ((*(void *)&self->_navigationControllerFlags & 0xF0) != 0)
    {
      objc_msgSend(v5, "_setNavigationControllerContentInsetAdjustment:", 0.0, 0.0, 0.0, 0.0);
      [v6 _setNavigationControllerContentOffsetAdjustment:0.0];
    }
    -[UIViewController __viewDidDisappear:]((uint64_t)v6, v3);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v7 = [(UIViewController *)self mutableChildViewControllers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v12 _appearState] == 3) {
            -[UIViewController __viewDidDisappear:]((uint64_t)v12, v3);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v9);
    }

    [(UINavigationController *)self setDisappearingViewController:0];
  }
}

- (void)_didEndTransitionFromView:(id)a3 toView:(id)a4 wasCustom:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v84 = a4;
  unint64_t navigationControllerFlags = (unint64_t)self->_navigationControllerFlags;
  uint64_t v10 = [(UINavigationController *)self disappearingViewController];
  objc_super v11 = [(UINavigationController *)self topViewController];
  if (!v10)
  {
    char v82 = *((unsigned char *)&self->_navigationControllerFlags + 6) & 1;
    goto LABEL_5;
  }
  int64_t v12 = [(UINavigationController *)self lastOperation];
  char v82 = *((unsigned char *)&self->_navigationControllerFlags + 6) & 1;
  if (v12 == 1)
  {
LABEL_5:
    char v13 = [v11 _usesSharedView];
    int v14 = 1;
    goto LABEL_6;
  }
  char v13 = [v10 _usesSharedView];
  int v14 = 0;
LABEL_6:
  if (v10 != v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v15 = [v10 view];
      -[UIViewControllerWrapperView unwrapView:](v8, v15);

      if (v8 == v84) {
        goto LABEL_17;
      }
LABEL_16:
      [v8 removeFromSuperview];
      goto LABEL_17;
    }
  }
  if (!v5) {
    goto LABEL_17;
  }
  long long v16 = [v10 childModalViewController];

  if (!v16) {
    goto LABEL_16;
  }
  objc_super v17 = [v10 view];
  [v17 superview];
  char v81 = v13;
  int v18 = v14;
  unint64_t v19 = navigationControllerFlags;
  BOOL v20 = v5;
  id v21 = v8;
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  if (v22 == v84) {
    double v23 = v21;
  }
  else {
    double v23 = v22;
  }
  [v23 removeFromSuperview];

  id v8 = v21;
  BOOL v5 = v20;
  unint64_t navigationControllerFlags = v19;
  int v14 = v18;
  char v13 = v81;
LABEL_17:
  [(UINavigationController *)self _presentationTransitionUnwrapViewController:v11];
  if ((*(void *)&self->_navigationControllerFlags & 0x200) != 0)
  {
    CGFloat v24 = -[UIViewController _keyboardSceneDelegate](self);
    [v24 popAnimationStyle];

    *(void *)&self->_navigationControllerFlags &= ~0x200uLL;
  }
  keyboardLayoutGuideTransitionAssertion = self->_keyboardLayoutGuideTransitionAssertion;
  if (keyboardLayoutGuideTransitionAssertion)
  {
    [(_UIInvalidatable *)keyboardLayoutGuideTransitionAssertion _invalidate];
    CGFloat v26 = self->_keyboardLayoutGuideTransitionAssertion;
    self->_keyboardLayoutGuideTransitionAssertion = 0;
  }
  if (v5)
  {
    [v11 view];
    CGFloat v27 = v11;
    char v28 = v10;
    char v29 = v13;
    int v30 = v14;
    unint64_t v31 = navigationControllerFlags;
    BOOL v32 = v5;
    v34 = id v33 = v8;
    +[UIViewControllerWrapperView existingWrapperViewForView:]((uint64_t)UIViewControllerWrapperView, v34);
    id v35 = (id)objc_claimAutoreleasedReturnValue();

    id v8 = v33;
    BOOL v5 = v32;
    unint64_t navigationControllerFlags = v31;
    int v14 = v30;
    char v13 = v29;
    uint64_t v10 = v28;
    objc_super v11 = v27;
    if (v35 == v84)
    {
      [(UINavigationController *)self _frameForWrapperViewForViewController:v27];
      uint64_t v37 = v36;
      uint64_t v39 = v38;
      uint64_t v41 = v40;
      uint64_t v43 = v42;
      [(UINavigationController *)self _frameForViewController:v27];
      uint64_t v45 = v44;
      uint64_t v47 = v46;
      uint64_t v49 = v48;
      uint64_t v51 = v50;
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke;
      v96[3] = &unk_1E52DF190;
      id v97 = v84;
      uint64_t v99 = v37;
      uint64_t v100 = v39;
      uint64_t v101 = v41;
      uint64_t v102 = v43;
      id v98 = v27;
      uint64_t v103 = v45;
      uint64_t v104 = v47;
      uint64_t v105 = v49;
      uint64_t v106 = v51;
      +[UIView performWithoutAnimation:v96];
    }
  }
  [(UINavigationController *)self _layoutTopViewController];
  if ((v13 & 1) == 0)
  {
    objc_msgSend(v10, "_setNavigationControllerContentInsetAdjustment:", 0.0, 0.0, 0.0, 0.0);
    [v10 _setNavigationControllerContentOffsetAdjustment:0.0];
  }
  double v52 = [(UINavigationController *)self _navigationToolbarTransitionController];
  [v52 endTransition];

  -[UINavigationController _clearLastOperation](self);
  *(void *)&self->_navigationControllerFlags &= ~4uLL;
  deferredTransitionContext = self->_deferredTransitionContext;
  self->_deferredTransitionContext = 0;

  if (v10 != v11 && [(UIViewController *)self _appearState] == 2)
  {
    if ((*(void *)&self->_navigationControllerFlags & 0x1000) == 0)
    {
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke_2;
      v93[3] = &unk_1E52D9FC0;
      char v95 = v82;
      id v94 = v10;
      -[UIViewController _endAppearanceTransition:]((uint64_t)v94, v93);
    }
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke_3;
    v90[3] = &unk_1E52DC3D0;
    char v92 = v14;
    double v54 = (id *)v91;
    id v55 = v11;
    v91[0] = v55;
    v91[1] = self;
    double v56 = v90;
    goto LABEL_37;
  }
  if ((*(void *)&self->_navigationControllerFlags & 0x1000) == 0
    && [(UIViewController *)self _appearState] != 2)
  {
    if (v14) {
      [v11 setNeedsDidMoveCleanup:1];
    }
    if (v10)
    {
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke_4;
      v87[3] = &unk_1E52D9FC0;
      char v89 = v82;
      double v54 = &v88;
      id v55 = v10;
      id v88 = v55;
      double v56 = v87;
LABEL_37:
      -[UIViewController _endAppearanceTransition:]((uint64_t)v55, v56);
    }
  }
  *(void *)&self->_navigationControllerFlags &= ~0x1000uLL;
  uint64_t v57 = (navigationControllerFlags >> 8) & 1;
  if (((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 <= 1)
  {
    if (dyld_program_sdk_at_least())
    {
      uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_delegate);
    }
    else
    {
      uint64_t WeakRetained = [(UINavigationController *)self delegate];
    }
    double v59 = (void *)WeakRetained;
    if (objc_opt_respondsToSelector())
    {
      if ([(id)UIApp _hasApplicationCalledLaunchDelegate]) {
        goto LABEL_45;
      }
      [v11 _existingView];
      BOOL v83 = v5;
      v61 = id v60 = v8;
      double v62 = [v61 window];
      int v63 = [v62 _isHostedInAnotherProcess];

      id v8 = v60;
      BOOL v5 = v83;
      if (v63) {
LABEL_45:
      }
        [v59 navigationController:self didShowViewController:v11 animated:v57];
    }
  }
  [(UINavigationController *)self didShowViewController:v11 animated:v57];
  uint64_t v64 = (uint64_t)self->_navigationControllerFlags;
  if ((v64 & 0x20000000000000) == 0)
  {
    char v65 = *((unsigned char *)&self->_navigationControllerFlags + 8);
    *(void *)&self->_unint64_t navigationControllerFlags = v64 | 0x20000000000000;
    *((unsigned char *)&self->_navigationControllerFlags + 8) = v65;
    if (v5)
    {
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke_5;
      v86[3] = &unk_1E52D9F70;
      v86[4] = self;
      [(id)UIApp _performBlockAfterCATransactionCommits:v86];
    }
    else
    {
      double v66 = [(UIViewController *)self _focusSystem];
      double v67 = [(UINavigationController *)self topViewController];
      id v68 = v8;
      if (v67) {
        char v69 = [v66 _focusedItemIsContainedInEnvironment:v67 includeSelf:1];
      }
      else {
        char v69 = 0;
      }
      uint64_t v70 = [(UINavigationController *)self navigationBar];
      char v71 = [v66 _focusedItemIsContainedInEnvironment:v70 includeSelf:1];

      if ((v69 & 1) == 0 && (v71 & 1) == 0)
      {
        int v72 = [[_UIFocusUpdateRequest alloc] initWithEnvironment:self];
        [(_UIFocusUpdateRequest *)v72 setAllowsFocusingCurrentItem:1];
        BOOL v73 = [(UIViewController *)self _focusSystem];
        [v73 _requestFocusUpdate:v72];
      }
      id v8 = v68;
    }
  }
  BOOL v74 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  CGFloat v75 = v74;
  if (v10) {
    [v74 setObject:v10 forKey:@"UINavigationControllerLastVisibleViewController"];
  }
  if (v11) {
    [v75 setObject:v11 forKey:@"UINavigationControllerNextVisibleViewController"];
  }
  id v76 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v76 postNotificationName:@"UINavigationControllerDidShowViewControllerNotification" object:self userInfo:v75];

  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UINavigationController", &_didEndTransitionFromView_toView_wasCustom____s_category);
  double v78 = *(id *)(CategoryCachedImpl + 8);
  os_signpost_id_t v79 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self);
  if (v79 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v80 = v79;
    if (os_signpost_enabled(v78))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v78, OS_SIGNPOST_INTERVAL_END, v80, "NavigationTransition", " enableTelemetry=YES ", buf, 2u);
    }
  }
}

- (void)_presentationTransitionUnwrapViewController:(id)a3
{
  id v29 = a3;
  BOOL v3 = [v29 childModalViewController];

  char v4 = v29;
  if (v3)
  {
    BOOL v5 = [v29 view];
    char v6 = [v5 superview];

    id v7 = v6;
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = v7;
      while (1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v10 = [v9 superview];

        uint64_t v9 = (void *)v10;
        if (!v10) {
          goto LABEL_6;
        }
      }
      [v9 bounds];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      BOOL v20 = [v29 view];
      objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

      id v21 = [v29 presentedViewController];
      id v22 = [v21 presentationController];
      double v23 = [v22 containerView];
      objc_msgSend(v23, "setFrame:", v13, v15, v17, v19);

      CGFloat v24 = [v29 view];
      [v9 insertSubview:v24 atIndex:0];

      double v25 = [v29 presentedViewController];
      CGFloat v26 = [v25 presentationController];
      CGFloat v27 = [v26 containerView];
      char v28 = [v29 view];
      [v9 insertSubview:v27 aboveSubview:v28];

      objc_super v11 = v8;
      if (v8 != v9)
      {
        [v8 removeFromSuperview];
        objc_super v11 = v9;
      }
    }
    else
    {
LABEL_6:
      objc_super v11 = 0;
    }

    char v4 = v29;
  }
}

- (id)_navigationToolbarTransitionController
{
  return [(_UIViewControllerTransitionConductor *)self->_transitionConductor navigationToolbarTransitionController];
}

- (id)_viewControllerForDisappearCallback
{
  BOOL v3 = [(UINavigationController *)self topViewController];
  if ((*(void *)&self->_navigationControllerFlags & 0xF0) != 0x20)
  {
    char v4 = [(UINavigationController *)self disappearingViewController];

    if (v4)
    {
      uint64_t v5 = [(UINavigationController *)self disappearingViewController];

      BOOL v3 = (void *)v5;
    }
  }
  return v3;
}

uint64_t __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke_3(uint64_t result)
{
  if (*(unsigned char *)(result + 48)) {
    return [*(id *)(result + 32) didMoveToParentViewController:*(void *)(result + 40)];
  }
  return result;
}

uint64_t __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) didMoveToParentViewController:0];
  }
  return result;
}

- (void)_setAllowNestedNavigationControllers:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_unint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (void)_collapseViewController:(id)a3 forSplitViewController:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 _isNavigationController]) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;
  objc_super v11 = v10;
  if (v10)
  {
    uint64_t v12 = *((void *)v10 + 154) & 0x800000000000;
    *(void *)&self->_unint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFF7FFFFFFFFFFFLL | v12;
  }
  else
  {
    uint64_t v12 = *(void *)&self->_navigationControllerFlags & 0x800000000000;
  }
  if (v12) {
    [(UINavigationController *)self setNavigationBarHidden:1 animated:0];
  }
  double v13 = -[UIViewController _keyboardSceneDelegate](self);
  double v14 = [v13 responder];
  int v15 = [v7 _shouldAttemptToPreserveInputViewsForResponder:v14];

  if (v15)
  {
    double v16 = [MEMORY[0x1E4F29238] valueWithPointer:v7];
    [v13 _preserveInputViewsWithId:v16];

    double v17 = [v13 responder];
    [v17 resignFirstResponder];
  }
  if (os_variant_has_internal_diagnostics())
  {
    CGFloat v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("UINavigationController", &qword_1EB25A8D8) + 8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CGFloat v27 = 138477827;
      *(void *)&void v27[4] = v7;
      _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_DEFAULT, "UINavigationController for collapsing UISplitViewController about to push view controller %{private}@", v27, 0xCu);
    }
  }
  else
  {
    double v18 = [v8 _panelImpl];

    if (!v18)
    {
      double v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &qword_1EB25A8E0) + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v20 = v19;
        *(_DWORD *)CGFloat v27 = 138543618;
        *(void *)&void v27[4] = objc_opt_class();
        *(_WORD *)&v27[12] = 2048;
        *(void *)&v27[14] = v7;
        id v21 = *(id *)&v27[4];
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEFAULT, "UINavigationController for collapsing UISplitViewController about to push view controller <%{public}@: %p>", v27, 0x16u);
      }
      if (objc_msgSend(v8, "isCollapsed", *(_OWORD *)v27, *(void *)&v27[16], v28))
      {
        id v22 = [(UINavigationController *)self viewControllers];
        int v23 = [v22 containsObject:v7];

        if (v23)
        {
          CGFloat v24 = [MEMORY[0x1E4F28B00] currentHandler];
          [v24 handleFailureInMethod:a2 object:self file:@"UINavigationController.m" lineNumber:10662 description:@"UISplitViewController collapse will push the same view controller a second time"];
        }
      }
    }
  }
  [(UINavigationController *)self pushViewController:v7 animated:0];
  double v25 = [MEMORY[0x1E4F29238] valueWithPointer:v7];
  [v13 _restoreInputViewsWithId:v25 animated:0];
}

- (void)_executeSplitViewControllerActions:(id)a3
{
  p_unint64_t navigationControllerFlags = &self->_navigationControllerFlags;
  char v4 = *((unsigned char *)&self->_navigationControllerFlags + 8);
  *((unsigned char *)&self->_navigationControllerFlags + 8) = v4 | 2;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *((unsigned char *)p_navigationControllerFlags + 8) = *((unsigned char *)p_navigationControllerFlags + 8) & 0xFD | v4 & 2;
}

- (UINavigationController)initWithRootViewController:(UIViewController *)rootViewController
{
  char v4 = rootViewController;
  if (dyld_program_sdk_at_least())
  {
    v8.receiver = self;
    v8.super_class = (Class)UINavigationController;
    uint64_t v5 = [(UIViewController *)&v8 initWithNibName:0 bundle:0];
  }
  else
  {
    uint64_t v5 = [(UINavigationController *)self initWithNibName:0 bundle:0];
  }
  char v6 = v5;
  if (v5)
  {
    if (dyld_program_sdk_at_least()) {
      [(UINavigationController *)v6 _commonNonCoderInit];
    }
    [(UINavigationController *)v6 pushViewController:v4 animated:0];
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__barTapHideGesture, 0);
  objc_storeStrong((id *)&self->__barInteractiveAnimationCoordinator, 0);
  objc_storeStrong((id *)&self->__barSwipeHideGesture, 0);
  objc_storeStrong(&self->__keyboardAppearedNotificationToken, 0);
  objc_destroyWeak((id *)&self->__managedTabGroup);
  objc_storeStrong((id *)&self->_contentFocusContainerGuide, 0);
  objc_storeStrong(&self->__updateNavigationBarHandler, 0);
  objc_storeStrong((id *)&self->__navbarAnimationId, 0);
  objc_storeStrong((id *)&self->__toolbarAnimationId, 0);
  objc_storeStrong((id *)&self->_transitionManager, 0);
  objc_storeStrong((id *)&self->__temporaryWindowLocator, 0);
  objc_storeStrong((id *)&self->_rememberedFocusedItemsByViewController, 0);
  objc_storeStrong((id *)&self->_transitionConductor, 0);
  objc_storeStrong((id *)&self->_cleanupHelper, 0);
  objc_destroyWeak((id *)&self->_searchControllerToNotifyWhenScrollingAnimationStops);
  objc_storeStrong((id *)&self->_windowRotationLockAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardLayoutGuideTransitionAssertion, 0);
  objc_storeStrong((id *)&self->_scrollViewManager, 0);
  objc_storeStrong((id *)&self->_overridingDestinationItemForFocusUpdate, 0);
  objc_storeStrong((id *)&self->_lastContentMarginForView, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_transitioningTopPalette, 0);
  objc_storeStrong((id *)&self->_freePalette, 0);
  objc_storeStrong((id *)&self->_paletteClippingView, 0);
  objc_storeStrong((id *)&self->_topPalette, 0);
  objc_storeStrong((id *)&self->_backKeyCommand, 0);
  objc_storeStrong((id *)&self->_backGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overrideTraitCollectionForPoppingViewControler, 0);
  objc_storeStrong((id *)&self->_deferredTransitionContext, 0);
  objc_storeStrong((id *)&self->_disappearingViewController, 0);
  objc_storeStrong((id *)&self->_navigationTransitionView, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = WeakRetained;
  if (WeakRetained) {
    objc_setAssociatedObject(WeakRetained, (char *)&self->super.super.super.isa + 1, 0, (void *)1);
  }

  [(UINavigationController *)self _setKeyboardAppearedNotificationToken:0];
  [(UINavigationController *)self _setBarSwipeHideGesture:0];
  [(UINavigationController *)self _setInteractiveAnimationCoordinator:0];
  [(UINavigationController *)self _setBarTapHideGesture:0];
  [(UINavigationController *)self _releaseContainerViews];
  [(UINavigationBar *)self->_navigationBar setLocked:0];
  uint64_t v5 = [(UINavigationBar *)self->_navigationBar delegate];

  if (v5 == self) {
    [(UINavigationBar *)self->_navigationBar setDelegate:0];
  }
  [(UIGestureRecognizer *)self->_backGestureRecognizer setDelegate:0];
  [(_UIViewControllerTransitionConductor *)self->_transitionConductor setTransitionController:0];
  [(_UIViewControllerTransitionConductor *)self->_transitionConductor setInteractiveTransitionController:0];
  [(UINavigationController *)self _setToolbarAnimationId:0];
  scrollViewManager = self->_scrollViewManager;
  self->_scrollViewManager = 0;

  v7.receiver = self;
  v7.super_class = (Class)UINavigationController;
  [(UIViewController *)&v7 dealloc];
}

- (void)_setToolbarAnimationId:(id)a3
{
}

- (void)_setInteractiveAnimationCoordinator:(id)a3
{
}

- (void)_setBarTapHideGesture:(id)a3
{
}

- (void)_setBarSwipeHideGesture:(id)a3
{
}

- (void)_releaseContainerViews
{
  uint64_t v3 = [(UILayoutContainerView *)self->_containerView delegate];

  if (v3 == self) {
    [(UILayoutContainerView *)self->_containerView setDelegate:0];
  }
  containerView = self->_containerView;
  self->_containerView = 0;

  navigationTransitionView = self->_navigationTransitionView;
  self->_navigationTransitionView = 0;
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UINavigationController;
  [(UIViewController *)&v4 viewIsAppearing:a3];
  [(UINavigationController *)self _setupBackGestureRecognizer];
  if (+[UIView _uip_transitionEnabled]()) {
    [(UINavigationController *)self _updateBarsForCurrentInterfaceOrientation];
  }
}

- (void)_layoutContainerViewDidMoveToWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UINavigationController;
  [(UIViewController *)&v4 _layoutContainerViewDidMoveToWindow:a3];
  [(UINavigationController *)self _setupBackGestureRecognizer];
}

- (void)_setupBackGestureRecognizer
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIViewController *)self traitCollection];
  unint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 > 8 || ((1 << v4) & 0x10C) == 0)
  {
    if (self->_backGestureRecognizer)
    {
      -[UIView removeGestureRecognizer:](self->_containerView, "removeGestureRecognizer:");
      backGestureRecognizer = self->_backGestureRecognizer;
      self->_backGestureRecognizer = 0;
    }
  }
  else
  {
    if (v4 == 3) {
      uint64_t v6 = 7;
    }
    else {
      uint64_t v6 = 5;
    }
    objc_super v7 = self->_backGestureRecognizer;
    if (!v7) {
      goto LABEL_12;
    }
    objc_super v8 = [(UIGestureRecognizer *)v7 allowedPressTypes];
    uint64_t v9 = [NSNumber numberWithInteger:v6];
    char v10 = [v8 containsObject:v9];

    if ((v10 & 1) == 0)
    {
      [(UIView *)self->_containerView removeGestureRecognizer:self->_backGestureRecognizer];
      objc_super v11 = self->_backGestureRecognizer;
      self->_backGestureRecognizer = 0;
    }
    if (!self->_backGestureRecognizer)
    {
LABEL_12:
      uint64_t v12 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__performBackGesture_];
      double v13 = self->_backGestureRecognizer;
      self->_backGestureRecognizer = v12;

      [(UIGestureRecognizer *)self->_backGestureRecognizer setDelegate:self];
      double v14 = [NSNumber numberWithInteger:v6];
      v17[0] = v14;
      int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      [(UITapGestureRecognizer *)self->_backGestureRecognizer setAllowedPressTypes:v15];

      [(UIGestureRecognizer *)self->_backGestureRecognizer setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
      [(UIView *)self->_containerView addGestureRecognizer:self->_backGestureRecognizer];
    }
  }
}

- (void)_updateBarsForCurrentInterfaceOrientation
{
}

- (void)_observableScrollViewDidChangeFrom:(id)a3 forViewController:(id)a4 edges:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UINavigationController;
  [(UIViewController *)&v18 _observableScrollViewDidChangeFrom:v8 forViewController:v9 edges:a5];
  if ((a5 & 5) != 0)
  {
    if (a5)
    {
      [(UINavigationController *)self _stopObservingContentScrollView:v8];
    }
    else if ([v8 _isScrollViewScrollObserver:self])
    {
      [v8 _removeScrollViewScrollObserver:self];
    }
    id v10 = [(UINavigationController *)self _viewControllerForObservableScrollView];
    if (v10 != v9) {
      goto LABEL_29;
    }
    if (a5)
    {
      objc_super v11 = [v9 _contentOrObservableScrollViewForEdge:1];
      if ((a5 & 4) == 0) {
        goto LABEL_9;
      }
    }
    else
    {
      objc_super v11 = 0;
      if ((a5 & 4) == 0)
      {
LABEL_9:
        uint64_t v12 = 0;
        if (!v8) {
          goto LABEL_15;
        }
        goto LABEL_13;
      }
    }
    uint64_t v12 = [v9 _contentOrObservableScrollViewForEdge:4];
    if (!v8) {
      goto LABEL_15;
    }
LABEL_13:
    if ((a5 & 1) != 0 && !v11)
    {
LABEL_16:
      double v14 = [(UINavigationController *)self _nestedTopViewController];
      if (v11 == v12) {
        unint64_t v15 = a5;
      }
      else {
        unint64_t v15 = 1;
      }
      [(UINavigationController *)self _updateAndObserveScrollView:v11 viewController:v14 forEdges:v15];

LABEL_20:
      if (v8 && (a5 & 4) != 0 && !v12)
      {
        if (!v11) {
          goto LABEL_28;
        }
      }
      else
      {
        double v16 = [v12 window];
        if (!v16) {
          goto LABEL_28;
        }

        if (v12 == v11) {
          goto LABEL_28;
        }
      }
      double v17 = [(UINavigationController *)self _nestedTopViewController];
      [(UINavigationController *)self _updateAndObserveScrollView:v12 viewController:v17 forEdges:4];

LABEL_28:
LABEL_29:

      goto LABEL_30;
    }
LABEL_15:
    double v13 = [v11 window];

    if (!v13) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
LABEL_30:
}

- (void)_setUpHostedRefreshControlForScrollView:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [(UINavigationController *)self topViewController];
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, 1, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = v7;
  if (v5 == v7)
  {
    [(UINavigationController *)self _updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:v7];
    uint64_t v6 = v7;
  }
}

- (void)_setAllowsInteractivePopWhenNavigationBarHidden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)&self->_navigationControllerFlags + 8) = *((unsigned char *)&self->_navigationControllerFlags + 8) & 0xF7 | v3;
}

- (void)_navigationItemDidUpdateSearchController:(id)a3 oldSearchController:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(UINavigationController *)self _outermostNavigationController];
  id v8 = v7;
  if (v7 != self) {
    [(UINavigationController *)v7 _navigationItemDidUpdateSearchController:v11 oldSearchController:v6];
  }
  id v9 = [(UINavigationController *)self topViewController];
  id v10 = [v9 navigationItem];

  if (v10 == v11)
  {
    [(UINavigationController *)self _setDefinesPresentationContextIfNecessaryForViewController:v9];
    [(UIView *)self->_navigationTransitionView setNeedsLayout];
    [(UIView *)self->_containerView setNeedsLayout];
  }
}

- (void)_setDefinesPresentationContextIfNecessaryForViewController:(id)a3
{
  id v7 = a3;
  char v3 = [v7 navigationItem];
  uint64_t v4 = [v3 searchController];
  if (v4)
  {
    id v5 = (void *)v4;
    int v6 = dyld_program_sdk_at_least();

    if (v6) {
      [v7 setDefinesPresentationContext:1];
    }
  }
  else
  {
  }
}

- (void)_navigationBar:(id)a3 itemBackButtonUpdated:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIViewController *)self _splitViewControllerEnforcingClass:1];
  [v8 _navigationController:self navigationBar:v7 itemBackButtonUpdated:v6];
}

- (id)_targetNavigationBarForUISplitViewControllerSidebarButton
{
  return self->_navigationBar;
}

void __76__UINavigationController__setViewControllers_transition_animated_operation___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0 && ![*(id *)(a1 + 32) _allowNestedNavigationControllers]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([*(id *)(a1 + 32) _allowChildSplitViewControllers] & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = v4;
    id v6 = @"UISplitViewControllers";
    if (isKindOfClass) {
      id v6 = @"UINavigationControllers";
    }
    [v4 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"UINavigationController.m", 1400, @"%@ are not allowed in a navigation controller!", v6 object file lineNumber description];
  }
}

- (NSArray)popToRootViewControllerAnimated:(BOOL)animated
{
  if (animated) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  return (NSArray *)[(UINavigationController *)self popToRootViewControllerWithTransition:v3];
}

- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated
{
  BOOL v4 = animated;
  id v7 = viewControllers;
  if (!self || (*((_WORD *)&self->super._viewControllerFlags + 4) & 0x80) == 0)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__UINavigationController_setViewControllers_animated___block_invoke;
    aBlock[3] = &unk_1E52E87A0;
    void aBlock[4] = self;
    id v8 = _Block_copy(aBlock);
    id v9 = [(UINavigationController *)self _transitionCoordinator];
    if (v9)
    {
      if ([(UINavigationController *)self _transitionConflictsWithNavigationTransitions:v9])
      {
        id v10 = NSStringFromSelector(a2);
        id v11 = (objc_class *)objc_opt_class();
        uint64_t v12 = NSStringFromClass(v11);
        NSLog(&cfstr_CalledOnPWhile.isa, v10, v12, self);

LABEL_34:
        goto LABEL_35;
      }
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __54__UINavigationController_setViewControllers_animated___block_invoke_2;
      v43[3] = &unk_1E52E87C8;
      void v43[4] = self;
      double v13 = v7;
      uint64_t v44 = v13;
      BOOL v45 = v4;
      double v14 = _Block_copy(v43);
      if (!v4 && [v9 presentationStyle] != -1)
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __54__UINavigationController_setViewControllers_animated___block_invoke_4;
        v40[3] = &unk_1E52DB330;
        id v42 = v8;
        uint64_t v41 = v13;
        +[UIViewController _performWithoutDeferringTransitions:v40];

        id v15 = v42;
LABEL_32:

        double v25 = v44;
        goto LABEL_33;
      }
      if ([(UINavigationController *)self _isCurrentTransitionPreemptable])
      {
        uint64_t v32 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionContext];
        double v16 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionController];
        double v17 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionContext];
        unint64_t v31 = v16;
        objc_super v18 = [v16 preemptWithContext:v17];

        uint64_t v19 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionContext];
        BOOL v20 = (void *)v19;
        if (v19)
        {
          id v15 = (id)v32;
          if (v19 == v32)
          {
            int v30 = [MEMORY[0x1E4F28B00] currentHandler];
            [v30 handleFailureInMethod:a2 object:self file:@"UINavigationController.m" lineNumber:1198 description:@"Failed to preempt running transition."];
          }
          else
          {
            id v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("UINavigationController", &setViewControllers_animated____s_category)+ 8);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "A transition was started while preempting previous transition. Deferring new transition.", buf, 2u);
            }
            id v22 = [(UINavigationController *)self _transitionCoordinator];
            (*((void (**)(void *, void *))v14 + 2))(v14, v22);
          }
          id v28 = v31;
        }
        else
        {
          [(UIView *)self->_navigationBar layoutIfNeeded];
          [(_UIViewControllerTransitionConductor *)self->_transitionConductor setPendingPreemptionHandoffData:v18];
          (*((void (**)(void *, NSArray *, BOOL))v8 + 2))(v8, v13, v4);
          id v28 = v31;
          id v15 = (id)v32;
        }
      }
      else
      {
        (*((void (**)(void *, void *))v14 + 2))(v14, v9);
        id v15 = v9;
        if (sel__addInvalidationHandler_)
        {
          CGFloat v26 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionContext];
          [v26 _state];
          char v27 = objc_opt_respondsToSelector();

          if ((v27 & 1) == 0) {
            goto LABEL_32;
          }
        }
        else if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          goto LABEL_32;
        }
        id v29 = [(UILayoutContainerView *)self->_containerView _disableUserInteractionForReason:@"setViewControllers"];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __54__UINavigationController_setViewControllers_animated___block_invoke_307;
        v37[3] = &unk_1E52D9F70;
        id v38 = v29;
        id v28 = v29;
        [v15 _addInvalidationHandler:v37];
      }
      goto LABEL_32;
    }
    if ([(UINavigationController *)self _isTransitioning])
    {
      if (!v4)
      {
LABEL_21:
        (*((void (**)(void *, NSArray *, BOOL))v8 + 2))(v8, v7, v4);
        goto LABEL_34;
      }
    }
    else if (![(UINavigationController *)self needsDeferredTransition] || !v4)
    {
      goto LABEL_21;
    }
    uint64_t v23 = dyld_program_sdk_at_least() ^ 1;
    CGFloat v24 = (void *)UIApp;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __54__UINavigationController_setViewControllers_animated___block_invoke_2_308;
    v33[3] = &unk_1E52E87F0;
    id v35 = v8;
    double v34 = v7;
    BOOL v36 = v4;
    [v24 _performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming:v23 block:v33];

    double v25 = v35;
LABEL_33:

    goto LABEL_34;
  }
LABEL_35:
}

void __54__UINavigationController_setViewControllers_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) mutableChildViewControllers];
    int v7 = [v5 isEqualToArray:v6];

    if (!v7) {
      goto LABEL_5;
    }
  }
  if (![v5 count]) {
    goto LABEL_5;
  }
  id v8 = [v5 lastObject];
  id v9 = [v8 view];
  id v10 = [*(id *)(a1 + 32) view];
  char v11 = [v9 isDescendantOfView:v10];

  if ((v11 & 1) == 0)
  {
LABEL_5:
    uint64_t v12 = *(void **)(a1 + 32);
    double v13 = [v12 mutableChildViewControllers];
    uint64_t v14 = [v12 _transitionForOldViewControllers:v13 newViewControllers:v5];

    id v15 = v5;
    uint64_t v16 = [v15 count];
    if (v16)
    {
      uint64_t v17 = v16;
      unsigned int v28 = v14;
      unsigned int v29 = a3;
      id v18 = 0;
      uint64_t v19 = 0;
      do
      {
        uint64_t v20 = v17--;
        id v21 = [v15 objectAtIndex:v17];
        if ([v21 useLayoutToLayoutNavigationTransitions])
        {
          if (v19)
          {
            [v19 addIndex:v17];
          }
          else
          {
            uint64_t v19 = [MEMORY[0x1E4F28E60] indexSetWithIndex:v17];
            if (v18)
            {
              [v18 addObject:v19];
            }
            else
            {
              id v18 = [MEMORY[0x1E4F1CA48] arrayWithObject:v19];
            }
          }
        }
        else if (v19)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v19 addIndex:v17];
          }
          else
          {
            id v22 = [v15 objectAtIndex:v20];
            [v22 _setUseLayoutToLayoutNavigationTransitions:0 withCheck:0];
            [v19 addIndex:v20];
          }
          uint64_t v19 = 0;
        }
      }
      while (v17);
      if (v19)
      {
        uint64_t v23 = [v15 objectAtIndex:0];
        [v23 _setUseLayoutToLayoutNavigationTransitions:0 withCheck:0];
        [v19 addIndex:0];
      }
      a3 = v29;
      if (v18)
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v18 = v18;
        uint64_t v24 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v31 != v26) {
                objc_enumerationMutation(v18);
              }
              [*(id *)(a1 + 32) _prepareCollectionViewControllers:v15 forSharingInRange:*(void *)(*((void *)&v30 + 1) + 8 * i)];
            }
            uint64_t v25 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
          }
          while (v25);
        }
      }
      uint64_t v14 = v28;
    }
    else
    {

      id v18 = 0;
    }
    [*(id *)(a1 + 32) _setViewControllers:v15 transition:v14 animated:a3];
  }
}

- (int)_transitionForOldViewControllers:(id)a3 newViewControllers:(id)a4
{
  id v6 = a3;
  int v7 = [a4 lastObject];
  char v8 = [(UINavigationController *)self isMemberOfClass:objc_opt_class()];
  id v9 = [v7 _existingView];
  if ((dyld_program_sdk_at_least() & 1) != 0 || (v8 & 1) != 0 || !v9)
  {
    if (!v9)
    {
LABEL_8:
      int v11 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    [(UIViewController *)self loadViewIfNeeded];
  }
  if (![(UIViewController *)self isViewLoaded]) {
    goto LABEL_8;
  }
  id v10 = [(UIViewController *)self view];
  int v11 = [v9 isDescendantOfView:v10];

LABEL_9:
  uint64_t v12 = [v6 lastObject];

  if (v7 == v12 && (v11 & 1) != 0)
  {
    int v13 = 0;
  }
  else if ([v6 containsObject:v7] ^ 1 | v11)
  {
    int v13 = 1;
  }
  else
  {
    int v13 = 2;
  }

  return v13;
}

- (void)_setViewControllers:(id)a3 transition:(int)a4 animated:(BOOL)a5 operation:(int64_t)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  id v11 = a3;
  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  uint64_t v13 = [v12 count];
  uint64_t v14 = [v11 count];

  if (v13 != v14)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"UINavigationController.m", 1394, @"All view controllers in a navigation controller must be distinct (%@)", v11 object file lineNumber description];
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__UINavigationController__setViewControllers_transition_animated_operation___block_invoke;
  v21[3] = &unk_1E52E8818;
  v21[4] = self;
  v21[5] = a2;
  [v11 enumerateObjectsUsingBlock:v21];
  if (!v8)
  {
    id v15 = [(UIViewController *)self mutableChildViewControllers];
    uint64_t v8 = [(UINavigationController *)self _transitionForOldViewControllers:v15 newViewControllers:v11];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__UINavigationController__setViewControllers_transition_animated_operation___block_invoke_2;
  aBlock[3] = &unk_1E52DAF40;
  id v20 = v11;
  id v16 = v11;
  uint64_t v17 = _Block_copy(aBlock);
  [(UINavigationController *)self _applyViewControllers:v17 transition:v8 animated:v7 operation:a6 rescheduleBlock:0];
}

- (void)_setViewControllers:(id)a3 transition:(int)a4 animated:(BOOL)a5
{
}

- (void)setViewControllers:(NSArray *)viewControllers
{
}

- (id)_hostingNavigationBar
{
  if ([(UINavigationController *)self isNavigationBarHidden]) {
    navigationBar = 0;
  }
  else {
    navigationBar = self->_navigationBar;
  }
  return navigationBar;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UINavigationController;
  [(UIViewController *)&v8 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (v6)
  {
    if ([(UINavigationController *)self needsDeferredTransition])
    {
      BOOL v7 = [(UIViewController *)self view];
      [v7 setNeedsLayout];
    }
    if ([v6 _isHostedInAnotherProcess]) {
      [(UINavigationController *)self _setPositionBarsExclusivelyWithSafeArea:1];
    }
  }
}

- (void)_navigationBar:(id)a3 topItemUpdatedContentLayout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIViewController *)self _splitViewControllerEnforcingClass:1];
  [v8 _navigationController:self navigationBar:v7 topItemUpdatedContentLayout:v6];
}

- (void)_setClipUnderlapWhileTransitioning:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_unint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (void)setNavigationBarHidden:(BOOL)navigationBarHidden
{
}

void __65__UINavigationController__ignoreFinishingModalTransitionForFiles__block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_90 = [&unk_1ED3EF758 containsObject:v0];
}

- (id)_additionalViewControllersToCheckForUserActivity
{
  v6[1] = *MEMORY[0x1E4F143B8];
  double v2 = [(UINavigationController *)self topViewController];
  int v3 = _UIStateRestorationDebugLogEnabled();
  if (v2)
  {
    if (v3) {
      NSLog(&cfstr_SNavigationcon.isa, "-[UINavigationController(ActivityContinuationPrivate) _additionalViewControllersToCheckForUserActivity]", v2);
    }
    v6[0] = v2;
    BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    if (v3) {
      NSLog(&cfstr_SNavigationcon_0.isa, "-[UINavigationController(ActivityContinuationPrivate) _additionalViewControllersToCheckForUserActivity]");
    }
    BOOL v4 = 0;
  }

  return v4;
}

- (void)detachPalette:(id)a3
{
  id v11 = a3;
  BOOL v4 = [(UINavigationController *)self _outermostNavigationController];
  id v5 = v4;
  if (v4 == self)
  {
    if (_UIGetBarNavigationPaletteEnabled())
    {
      id v6 = [(UINavigationController *)self disappearingViewController];
      id v7 = [v6 navigationItem];
      id v8 = [v7 _bottomPalette];
      [v8 setPinned:0];

      id v9 = [(UINavigationController *)self topViewController];
      id v10 = [v9 navigationItem];
      [v10 _setBottomPalette:0];
    }
    else
    {
      [(UINavigationController *)self detachPalette:v11 isInPaletteTransition:0];
    }
  }
  else
  {
    [(UINavigationController *)v4 detachPalette:v11];
  }
}

- (NSArray)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  if (animated) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  return (NSArray *)[(UINavigationController *)self popToViewController:viewController transition:v4];
}

- (id)popToRootViewControllerWithTransition:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(UIViewController *)self mutableChildViewControllers];
  if ((unint64_t)[v5 count] < 2)
  {
    id v7 = 0;
  }
  else
  {
    id v6 = [v5 objectAtIndex:0];
    id v7 = [(UINavigationController *)self popToViewController:v6 transition:v3];
  }
  return v7;
}

- (id)existingPaletteForEdge:(unint64_t)a3
{
  if (_UIGetBarNavigationPaletteEnabled())
  {
    id v5 = [(UINavigationController *)self topViewController];
    id v6 = [v5 navigationItem];
    self = [v6 _bottomPalette];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      transitioningTopPalette = self;
    }
    else {
      transitioningTopPalette = 0;
    }
    goto LABEL_5;
  }
  id v9 = [(UINavigationController *)self _outermostNavigationController];
  if (v9 != self)
  {
    id v10 = v9;
    id v8 = [(UINavigationController *)v9 existingPaletteForEdge:a3];
    self = v10;
    goto LABEL_8;
  }
  uint64_t v12 = [(UIViewController *)self transitionCoordinator];
  int v13 = [v12 isCancelled];

  if (!a3)
  {
    uint64_t v14 = 1104;
LABEL_18:
    transitioningTopPalette = *(Class *)((char *)&self->super.super.super.isa + v14);
LABEL_5:
    id v8 = transitioningTopPalette;
    goto LABEL_8;
  }
  if (a3 == 5 || a3 == 2)
  {
    if (v13)
    {
      transitioningTopPalette = self->_transitioningTopPalette;
      if (transitioningTopPalette) {
        goto LABEL_5;
      }
    }
    uint64_t v14 = 1088;
    goto LABEL_18;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Palettes currently can only have a top boundary edge or no boundary edge"];
  id v8 = 0;
LABEL_8:

  return v8;
}

- (void)_tabBarControllerDidFinishShowingTabBar:(id)a3 isHidden:(BOOL)a4
{
  if (a4)
  {
    if ([(UINavigationController *)self _didExplicitlyHideTabBar]) {
      unsigned int v5 = 0;
    }
    else {
      unsigned int v5 = 1024;
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  *(void *)&self->_unint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFFF3FFFFFBFFLL | v5;
  id v6 = [(UINavigationController *)self topViewController];
  [(UINavigationController *)self _computeAndApplyScrollContentInsetDeltaForViewController:v6];

  [(UINavigationController *)self _layoutTopViewController];
}

- (int64_t)_builtinTransitionStyle
{
  return self->_builtinTransitionStyle;
}

- (void)_setBuiltinTransitionStyle:(int64_t)a3
{
  self->_builtinTransitionStyle = a3;
  uint64_t v4 = [(_UINavigationControllerVisualStyle *)self->_visualStyle transitionController];

  if (v4)
  {
    id v5 = [(_UINavigationControllerVisualStyle *)self->_visualStyle transitionController];
    if (objc_opt_respondsToSelector()) {
      [v5 setTransitionStyle:self->_builtinTransitionStyle];
    }
  }
}

- (void)_prepareForNormalDisplayWithNavigationController:(id)a3
{
  int v13 = (unint64_t *)a3;
  if ([(UINavigationController *)self _isNestedNavigationController])
  {
    uint64_t v4 = [(UINavigationController *)self interactivePopGestureRecognizer];
    [v4 setEnabled:1];

    id v5 = [(UINavigationController *)self navigationBar];
    [v5 _redisplayItems];

    [v13 _noteNestedNavigationControllerDidReturnToNormal:self];
    [(UINavigationController *)self _setTemporaryWindowLocator:v13];
    [(UINavigationController *)self _setIsNestedNavigationController:0];
    p_uint64_t navigationControllerFlags = &self->_navigationControllerFlags;
    uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
    if ((navigationControllerFlags & 0x880000000000) == 0x80000000000)
    {
      [(UINavigationController *)self setNavigationBarHidden:0 animated:0];
      uint64_t navigationControllerFlags = *(void *)p_navigationControllerFlags;
    }
    char v8 = *((unsigned char *)&self->_navigationControllerFlags + 8);
    *(void *)p_uint64_t navigationControllerFlags = navigationControllerFlags & 0xFFFFF7FFFFFFFFFFLL;
    *((unsigned char *)&self->_navigationControllerFlags + 8) = v8;
    id v9 = v13 + 154;
    unint64_t v10 = v13[154];
    if ((v10 & 0x100000000000) != 0)
    {
      [v13 setToolbarHidden:0];
      unint64_t v10 = *v9;
    }
    char v11 = *((unsigned char *)v13 + 1240);
    unint64_t *v9 = v10 & 0xFFFFEFFFFFFFFFFFLL;
    *((unsigned char *)v13 + 1240) = v11;
    [(UINavigationController *)self _setTemporaryWindowLocator:0];
    [(UIViewController *)self setDefinesPresentationContext:1];
    [(UIView *)self->_paletteClippingView removeFromSuperview];
    paletteClippingView = self->_paletteClippingView;
    self->_paletteClippingView = 0;
  }
}

- (void)_setTemporaryWindowLocator:(id)a3
{
}

- (void)_noteNestedNavigationControllerDidReturnToNormal:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 _topViewControllerObservableScrollViewForEdge:1];
  [(UINavigationController *)self _stopObservingContentScrollView:v4];

  id v5 = [v6 _topViewControllerObservableScrollViewForEdge:4];
  [(UINavigationController *)self _stopObservingContentScrollView:v5];

  [(UINavigationController *)self _detachTopPaletteIfShowingSearchBarForTopmostViewControllerInNavigationController:v6];
}

- (void)_detachTopPaletteIfShowingSearchBarForTopmostViewControllerInNavigationController:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (UINavigationController *)a3;
  id v5 = [(_UINavigationControllerPalette *)self->_topPalette navController];

  if (v5 != v4 && (*(unsigned char *)__UILogGetCategoryCachedImpl("", &qword_1EB25A870) & 1) != 0)
  {
    if (v4 == self)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Navigation", &qword_1EB25A878);
      if ((*(unsigned char *)CategoryCachedImpl & 1) == 0) {
        goto LABEL_3;
      }
      id v15 = *(NSObject **)(CategoryCachedImpl + 8);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_3;
      }
      topPalette = self->_topPalette;
      id v9 = v15;
      unint64_t v10 = [(_UINavigationControllerPalette *)topPalette navController];
      int v17 = 138412802;
      id v18 = topPalette;
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = self;
      char v11 = "Palette %@ belongs to nav controller %@, which is not the nav controller which should be displaying it (%@)";
      uint64_t v12 = v9;
      uint32_t v13 = 32;
    }
    else
    {
      unint64_t v6 = __UILogGetCategoryCachedImpl("Navigation", &qword_1EB25A880);
      if ((*(unsigned char *)v6 & 1) == 0) {
        goto LABEL_3;
      }
      id v7 = *(NSObject **)(v6 + 8);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_3;
      }
      char v8 = self->_topPalette;
      id v9 = v7;
      unint64_t v10 = [(_UINavigationControllerPalette *)v8 navController];
      int v17 = 138413058;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = self;
      __int16 v23 = 2112;
      uint64_t v24 = v4;
      char v11 = "Palette %@ belongs to nav controller %@, which is neither outer (%@) or inner (%@) nav controller";
      uint64_t v12 = v9;
      uint32_t v13 = 42;
    }
    _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v17, v13);
  }
LABEL_3:
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(UINavigationController *)self topViewController];
  [v6 setEditing:v5 animated:v4];
}

- (void)_setUseStandardStatusBarHeight:(BOOL)a3
{
  if (((((*(void *)&self->_navigationControllerFlags & 0x2000000000) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    BOOL v5 = [(UIViewController *)self _existingView];
    id v6 = [v5 window];

    uint64_t v7 = 0x2000000000;
    if (!v3) {
      uint64_t v7 = 0;
    }
    *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFFDFFFFFFFFFLL | v7;
    double v8 = 0.0;
    if (v3)
    {
      id v9 = [v6 windowScene];
      uint64_t v10 = [v9 interfaceOrientation];

      char v11 = __UIStatusBarManagerForWindow(v6);
      uint64_t v12 = v11;
      if ((unint64_t)(v10 - 1) > 3) {
        [v11 statusBarHeight];
      }
      else {
        [v11 defaultStatusBarHeightInOrientation:v10];
      }
      double v8 = v13;
    }
    self->_double statusBarHeightForHideShow = v8;
    [(UINavigationBar *)self->_navigationBar _setOverrideBackgroundExtension:v8];
    if ((*(_DWORD *)&self->_navigationControllerFlags & 1) == 0
      && ![(UIViewController *)self _freezeLayoutForOrientationChangeOnDismissal])
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__UINavigationController__setUseStandardStatusBarHeight___block_invoke;
      v14[3] = &unk_1E52D9F70;
      v14[4] = self;
      +[UIView performWithoutAnimation:v14];
    }
  }
}

- (id)popToViewController:(id)a3 transition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  __int16 v21 = __Block_byref_object_copy__53;
  id v22 = __Block_byref_object_dispose__53;
  id v23 = 0;
  id v7 = [(UINavigationController *)self topViewController];

  if (v7 != v6)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __57__UINavigationController_popToViewController_transition___block_invoke;
    id v15 = &unk_1E52E8AF8;
    id v16 = v6;
    int v17 = &v18;
    double v8 = _Block_copy(&v12);
    uint64_t v9 = -[UINavigationController _effectiveTransitionForTransition:](self, "_effectiveTransitionForTransition:", v4, v12, v13, v14, v15);
    [(UINavigationController *)self _applyViewControllers:v8 transition:v9 animated:v9 != 0 operation:2 rescheduleBlock:0];
  }
  id v10 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v10;
}

- (UINavigationController)initWithCoder:(NSCoder *)aDecoder
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = aDecoder;
  v30.receiver = self;
  v30.super_class = (Class)UINavigationController;
  BOOL v5 = [(UIViewController *)&v30 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [(NSCoder *)v4 decodeObjectForKey:@"UINavigationBar"];
    navigationBar = v5->_navigationBar;
    v5->_navigationBar = (UINavigationBar *)v6;

    double v8 = [(UINavigationBar *)v5->_navigationBar delegate];

    char v9 = [(UINavigationBar *)v5->_navigationBar isLocked];
    char v10 = v9;
    if (v8 == v5) {
      char v11 = v9;
    }
    else {
      char v11 = 0;
    }
    if (v5->_navigationBar && (v11 & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        unsigned int v28 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          unsigned int v29 = v5->_navigationBar;
          *(_DWORD *)buf = 138412546;
          long long v32 = v5;
          __int16 v33 = 2112;
          double v34 = v29;
          _os_log_fault_impl(&dword_1853B0000, v28, OS_LOG_TYPE_FAULT, "UINavigationBar decoded as unlocked for UINavigationController, or navigationBar delegate set up incorrectly. Inconsistent configuration may cause problems. navigationController=%@, navigationBar=%@", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &initWithCoder____s_category) + 8);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          char v27 = v5->_navigationBar;
          *(_DWORD *)buf = 138412546;
          long long v32 = v5;
          __int16 v33 = 2112;
          double v34 = v27;
          _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_ERROR, "UINavigationBar decoded as unlocked for UINavigationController, or navigationBar delegate set up incorrectly. Inconsistent configuration may cause problems. navigationController=%@, navigationBar=%@", buf, 0x16u);
        }
      }
    }
    uint64_t v12 = v5->_navigationBar;
    if (v12) {
      BOOL v13 = v8 == v5;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13) {
      char v14 = v10;
    }
    else {
      char v14 = 1;
    }
    if ((v14 & 1) == 0) {
      [(UINavigationBar *)v12 _setDecodedUnlockedWithNavigationControllerDelegate:1];
    }
    uint64_t v15 = [(NSCoder *)v4 decodeObjectForKey:@"UIToolbar"];
    toolbar = v5->_toolbar;
    v5->_toolbar = (UIToolbar *)v15;

    int v17 = [(NSCoder *)v4 decodeObjectForKey:@"UIDelegate"];
    objc_storeWeak((id *)&v5->_delegate, v17);

    *(void *)&v5->_uint64_t navigationControllerFlags = *(void *)&v5->_navigationControllerFlags & 0xFFFFFFFFFFFFFFFELL | [(NSCoder *)v4 decodeBoolForKey:@"UINavigationBarHidden"];
    BOOL v18 = [(NSCoder *)v4 decodeBoolForKey:@"UIToolbarShown"];
    uint64_t v19 = 2;
    if (!v18) {
      uint64_t v19 = 0;
    }
    *(void *)&v5->_uint64_t navigationControllerFlags = *(void *)&v5->_navigationControllerFlags & 0xFFFFFFFFFFFFFFFDLL | v19;
    v5->_builtinTransitionStyle = [(NSCoder *)v4 decodeIntegerForKey:@"UINavigationControllerTransitionStyle"];
    if (*(void *)&v5->_navigationControllerFlags) {
      [(UIView *)v5->_navigationBar setHidden:1];
    }
    [(NSCoder *)v4 decodeFloatForKey:@"UINavigationControllerTransitionGap"];
    [(UINavigationController *)v5 _commonInitWithBuiltinTransitionGap:v20];
    if ([(NSCoder *)v4 decodeBoolForKey:@"UINavigationControllerCondensesBarsWhenKeyboardAppears"])
    {
      [(UINavigationController *)v5 setHidesBarsWhenKeyboardAppears:1];
    }
    if ([(NSCoder *)v4 decodeBoolForKey:@"UINavigationControllerCondensesBarsOnSwipe"]) {
      [(UINavigationController *)v5 setHidesBarsOnSwipe:1];
    }
    if ([(NSCoder *)v4 decodeBoolForKey:@"UINavigationControllerHidesBarsWhenVerticallyCompact"])
    {
      [(UINavigationController *)v5 setHidesBarsWhenVerticallyCompact:1];
    }
    if ([(NSCoder *)v4 decodeBoolForKey:@"UINavigationControllerHidesBarsOnTap"]) {
      [(UINavigationController *)v5 setHidesBarsOnTap:1];
    }
    if ([(NSCoder *)v4 decodeBoolForKey:@"UINavigationControllerCreatedBySplitViewController"])
    {
      *((unsigned char *)&v5->_navigationControllerFlags + 8) |= 1u;
    }
    __int16 v21 = v5->_navigationBar;
    id v22 = [(UINavigationController *)v5 _navigationItemsCallingPublicAccessor:0];
    [(UINavigationBar *)v21 _setDecodedItems:v22];

    transitionManager = v5->_transitionManager;
    if (transitionManager)
    {
      uint64_t v24 = [(UINavigationController *)v5 viewControllers];
      [(_UIViewControllerTransitionManager *)transitionManager configureWithInitialViewControllers:v24];
    }
  }

  return v5;
}

+ (BOOL)doesOverridePreferredInterfaceOrientationForPresentation
{
  uint64_t v3 = objc_opt_class();
  return [a1 doesOverrideViewControllerMethod:sel_preferredInterfaceOrientationForPresentation inBaseClass:v3];
}

- (id)_effectiveInteractionActivityTrackingBaseName
{
  uint64_t v3 = [(UIViewController *)self interactionActivityTrackingBaseName];
  if (!v3)
  {
    if ([(UINavigationController *)self isMemberOfClass:objc_opt_class()])
    {
      uint64_t v4 = [(UINavigationController *)self topViewController];
      BOOL v5 = [v4 _effectiveInteractionActivityTrackingBaseName];

      if (v5)
      {
        uint64_t v3 = [@"UINC-" stringByAppendingString:v5];
      }
      else
      {
        uint64_t v3 = 0;
      }
    }
    else
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      uint64_t v3 = NSStringFromClass(v6);
    }
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UINavigationController;
  [(UIViewController *)&v11 encodeWithCoder:v4];
  navigationBar = self->_navigationBar;
  if (navigationBar) {
    [v4 encodeObject:navigationBar forKey:@"UINavigationBar"];
  }
  toolbar = self->_toolbar;
  if (toolbar) {
    [v4 encodeObject:toolbar forKey:@"UIToolbar"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained) {
    [v4 encodeConditionalObject:WeakRetained forKey:@"UIDelegate"];
  }
  uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  if (navigationControllerFlags)
  {
    [v4 encodeBool:1 forKey:@"UINavigationBarHidden"];
    uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  }
  if ((navigationControllerFlags & 2) != 0) {
    [v4 encodeBool:1 forKey:@"UIToolbarShown"];
  }
  double builtinTransitionGap = self->_builtinTransitionGap;
  if (builtinTransitionGap != 0.0)
  {
    *(float *)&double builtinTransitionGap = builtinTransitionGap;
    [v4 encodeFloat:@"UINavigationControllerTransitionGap" forKey:builtinTransitionGap];
  }
  int64_t builtinTransitionStyle = self->_builtinTransitionStyle;
  if (builtinTransitionStyle) {
    [v4 encodeInteger:builtinTransitionStyle forKey:@"UINavigationControllerTransitionStyle"];
  }
  if (self->_hidesBarsWhenKeyboardAppears) {
    [v4 encodeBool:1 forKey:@"UINavigationControllerCondensesBarsWhenKeyboardAppears"];
  }
  if (self->_hidesBarsOnSwipe) {
    [v4 encodeBool:1 forKey:@"UINavigationControllerCondensesBarsOnSwipe"];
  }
  if (self->_hidesBarsWhenVerticallyCompact) {
    [v4 encodeBool:1 forKey:@"UINavigationControllerHidesBarsWhenVerticallyCompact"];
  }
  if (self->_hidesBarsOnTap) {
    [v4 encodeBool:1 forKey:@"UINavigationControllerHidesBarsOnTap"];
  }
  if (*((unsigned char *)&self->_navigationControllerFlags + 8)) {
    [v4 encodeBool:1 forKey:@"UINavigationControllerCreatedBySplitViewController"];
  }
}

void __38__UINavigationController_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_ForcePositionBarsExclusivelyWithSafeArea_block_invoke___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "You are trying to set a deallocating object as a delegate. This will be a hard crash in the future. Offending object: %@ hostObject: %@", (uint8_t *)&v5, 0x16u);
  }
}

void __38__UINavigationController_setDelegate___block_invoke_268(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    double v2 = [WeakRetained delegate];
    if (!v2) {
      [v3 setDelegate:0];
    }

    id WeakRetained = v3;
  }
}

- (BOOL)_isCrossfadingOutTabBar
{
  return (*(void *)&self->_navigationControllerFlags >> 34) & 1;
}

- (BOOL)_isCrossfadingInTabBar
{
  return (*(void *)&self->_navigationControllerFlags >> 35) & 1;
}

- (void)_setCrossfadingOutTabBar:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (void)_setCrossfadingInTabBar:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFFF7FFFFFFFFLL | v3;
}

uint64_t __57__UINavigationController__setUseStandardStatusBarHeight___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _positionNavigationBarHidden:0 edge:1 initialOffset:0.0];
  double v2 = *(void **)(a1 + 32);
  return [v2 _positionPaletteHidden:0 edge:1 initialOffset:0.0];
}

- (BOOL)_useCurrentStatusBarHeight
{
  return 0;
}

- (BOOL)allowUserInteractionDuringTransition
{
  return (*(void *)&self->_navigationControllerFlags >> 38) & 1;
}

- (void)setAllowUserInteractionDuringTransition:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)enableBackButtonDuringTransition
{
  return (*(void *)&self->_navigationControllerFlags >> 39) & 1;
}

- (void)setEnableBackButtonDuringTransition:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (int64_t)modalTransitionStyle
{
  uint64_t modalTransitionStyle = self->super._modalTransitionStyle;
  if (modalTransitionStyle == -1)
  {
    uint64_t v4 = [(UINavigationController *)self topViewController];
    if (v4)
    {
      int v5 = [(UINavigationController *)self topViewController];
      uint64_t modalTransitionStyle = [v5 modalTransitionStyle];
    }
    else
    {
      uint64_t modalTransitionStyle = 0;
    }
  }
  return modalTransitionStyle;
}

void __54__UINavigationController_setViewControllers_animated___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__UINavigationController_setViewControllers_animated___block_invoke_3;
  v5[3] = &unk_1E52E4FF8;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  char v7 = *(unsigned char *)(a1 + 48);
  [a2 animateAlongsideTransition:0 completion:v5];
}

uint64_t __54__UINavigationController_setViewControllers_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setViewControllers:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __54__UINavigationController_setViewControllers_animated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __54__UINavigationController_setViewControllers_animated___block_invoke_307(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

uint64_t __54__UINavigationController_setViewControllers_animated___block_invoke_2_308(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (BOOL)_hasNestedNavigationController
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(UINavigationController *)self _allowNestedNavigationControllers])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v3 = [(UIViewController *)self mutableChildViewControllers];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          if ([*(id *)(*((void *)&v8 + 1) + 8 * i) _isNestedNavigationController])
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_setAllowChildSplitViewControllers:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)_allowChildSplitViewControllers
{
  return (*(void *)&self->_navigationControllerFlags >> 42) & 1;
}

- (void)_updateInteractivePopGestureEnabledState
{
  if (![(UINavigationController *)self _isNestedNavigationController]
    && ![(UINavigationController *)self _allowNestedNavigationControllers])
  {
    return;
  }
  char v14 = [(UINavigationController *)self topViewController];
  if ([(UINavigationController *)self _isNestedNavigationController])
  {
    unint64_t v3 = [(UIViewController *)self childViewControllersCount];
    BOOL v4 = v3 < 2;
    BOOL v5 = v3 > 1;
    id v6 = [(UINavigationController *)self interactivePopGestureRecognizer];
    [v6 setEnabled:v5];

    char v7 = [(UIViewController *)self navigationController];
    long long v8 = [v7 interactivePopGestureRecognizer];
    [v8 setEnabled:v4];
  }
  else
  {
    BOOL v9 = [(UINavigationController *)self _allowNestedNavigationControllers];
    long long v10 = v14;
    if (!v9) {
      goto LABEL_13;
    }
    BOOL v11 = ![v14 _isNestedNavigationController]
       || (unint64_t)((unint64_t)[v14 childViewControllersCount] < 2);
    uint64_t v12 = [(UINavigationController *)self interactivePopGestureRecognizer];
    [v12 setEnabled:v11];

    int v13 = [v14 _isNestedNavigationController];
    long long v10 = v14;
    if (!v13) {
      goto LABEL_13;
    }
    char v7 = [v14 interactivePopGestureRecognizer];
    [v7 setEnabled:v11 ^ 1];
  }

  long long v10 = v14;
LABEL_13:
}

- (void)_setViewControllers:(id)a3 transition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  uint64_t v6 = v4;
  if (!v4)
  {
    char v7 = [(UIViewController *)self mutableChildViewControllers];
    uint64_t v6 = [(UINavigationController *)self _transitionForOldViewControllers:v7 newViewControllers:v8];
  }
  [(UINavigationController *)self _setViewControllers:v8 transition:v6 animated:v4 != 0];
}

void __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke_3;
    v13[3] = &unk_1E52DA110;
    id v14 = v3;
    [a2 animateAlongsideTransition:0 completion:v13];
    uint64_t v4 = v14;
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke_4;
    v8[3] = &unk_1E52E8868;
    v8[4] = *(void *)(a1 + 32);
    id v6 = *(id *)(a1 + 48);
    int v11 = *(_DWORD *)(a1 + 64);
    char v12 = *(unsigned char *)(a1 + 68);
    uint64_t v7 = *(void *)(a1 + 56);
    id v9 = v6;
    uint64_t v10 = v7;
    [a2 animateAlongsideTransition:0 completion:v8];
    uint64_t v4 = v9;
  }
}

uint64_t __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyViewControllers:*(void *)(a1 + 40) transition:*(unsigned int *)(a1 + 56) animated:*(unsigned __int8 *)(a1 + 60) operation:*(void *)(a1 + 48) rescheduleBlock:0];
}

uint64_t __94__UINavigationController__applyViewControllers_transition_animated_operation_rescheduleBlock___block_invoke_333(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

void __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[UIViewController _invalidatePreferences:excluding:](WeakRetained, -1, 0);
    id WeakRetained = v2;
  }
}

void __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [v2 item];
  unint64_t v3 = [v4 _stackEntry];
  [v2 updateStateFromCounterpart:v3];
}

uint64_t __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_5(uint64_t a1, void *a2)
{
  if (([a2 isCancelled] & 1) == 0) {
    [*(id *)(a1 + 32) _prepareForNormalDisplayWithNavigationController:*(void *)(a1 + 40)];
  }
  unint64_t v3 = *(void **)(a1 + 40);
  return [v3 _updateInteractivePopGestureEnabledState];
}

uint64_t __89__UINavigationController__immediatelyApplyViewControllers_transition_animated_operation___block_invoke_6(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56))
  {
    id v2 = [*(id *)(a1 + 32) _rootAncestorViewController];
    unint64_t v3 = [v2 _viewsWithDisabledInteractionGivenTransitionContext:*(void *)(a1 + 40)];

    [*(id *)(a1 + 40) _disableInteractionForViews:v3];
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

void __82__UINavigationController__ensureParentViewControllerReferenceIsCleanedUpForChild___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (*(void *)(v9 + 104) == a2) {
          *(void *)(v9 + 104) = 0;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_setClipsToBounds:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIViewController *)self loadViewIfNeeded];
  navigationTransitionView = self->_navigationTransitionView;
  [(UIView *)navigationTransitionView setClipsToBounds:v3];
}

- (void)_setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(UIViewController *)self loadViewIfNeeded];
  navigationTransitionView = self->_navigationTransitionView;
  [(UIView *)navigationTransitionView frame];
  double v10 = left + v9;
  double v12 = top + v11;
  double v14 = v13 - (left + right);
  double v16 = v15 - (top + bottom);
  -[UIView setFrame:](navigationTransitionView, "setFrame:", v10, v12, v14, v16);
}

- (void)setInteractiveTransition:(BOOL)a3
{
}

- (void)_setBuiltinTransitionGap:(double)a3
{
  self->_double builtinTransitionGap = a3;
  id v4 = [(_UINavigationControllerVisualStyle *)self->_visualStyle transitionController];

  if (v4)
  {
    id v5 = [(_UINavigationControllerVisualStyle *)self->_visualStyle transitionController];
    if (objc_opt_respondsToSelector()) {
      [v5 setTransitionGap:self->_builtinTransitionGap];
    }
  }
}

- (void)_finishAnimationTracking
{
  if (+[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled])
  {
    +[UIViewPropertyAnimator _finishTrackingAnimations];
  }
  else
  {
    +[UIView _finishAnimationTracking];
  }
}

- (id)_startInteractiveBarTransition:(id)a3
{
  id v4 = a3;
  [(UINavigationController *)self _setNavigationBarAnimationWasCancelled:0];
  [(UINavigationController *)self _setToolbarAnimationWasCancelled:0];
  if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators])
  {
    if (!+[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled])
    {
      id v5 = +[UIViewPropertyAnimator _startTrackingAnimations];
      +[UIViewPropertyAnimator _setTrackedAnimationsStartPaused:1];
    }
    uint64_t v6 = +[UIViewPropertyAnimator _currentTrackedAnimationsUUID];
  }
  else
  {
    uint64_t v7 = [v4 layer];
    uint64_t v6 = +[UIView _startAnimationTracking];
    [v7 setSpeed:0.0];
    [v7 setTimeOffset:0.0];
  }
  return v6;
}

- (void)_startInteractiveToolbarTransition
{
  if (qword_1EB25A838 != -1) {
    dispatch_once(&qword_1EB25A838, &__block_literal_global_351_0);
  }
  if ([(UINavigationController *)self _hasInterruptibleNavigationTransition])
  {
    id v4 = (id)qword_1EB25A830;
  }
  else
  {
    BOOL v3 = [(UINavigationController *)self _existingToolbar];
    id v4 = [(UINavigationController *)self _startInteractiveBarTransition:v3];
  }
  [(UINavigationController *)self _setToolbarAnimationId:v4];
}

void __60__UINavigationController__startInteractiveToolbarTransition__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29128] UUID];
  id v1 = (void *)qword_1EB25A830;
  qword_1EB25A830 = v0;
}

- (void)_startInteractiveNavbarTransition
{
  if (qword_1EB25A848 != -1) {
    dispatch_once(&qword_1EB25A848, &__block_literal_global_354);
  }
  if ([(UINavigationController *)self _hasInterruptibleNavigationTransition])
  {
    id v3 = (id)qword_1EB25A840;
  }
  else
  {
    id v3 = [(UINavigationController *)self _startInteractiveBarTransition:self->_navigationBar];
  }
  id v4 = v3;
  [(UINavigationController *)self _setNavbarAnimationId:v3];
}

void __59__UINavigationController__startInteractiveNavbarTransition__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29128] UUID];
  id v1 = (void *)qword_1EB25A840;
  qword_1EB25A840 = v0;
}

- (void)_updateInteractiveBarTransition:(id)a3 withUUID:(id)a4 percent:(double)a5 isFinished:(BOOL)a6 didComplete:(BOOL)a7 completionSpeed:(double)a8 completionCurve:(int64_t)a9
{
  BOOL v11 = a7;
  id v26 = a3;
  id v16 = a4;
  if (![(UINavigationController *)self _hasInterruptibleNavigationTransition])
  {
    if (+[UIViewPropertyAnimator _containsAnimatorForTrackedAnimationsUUID:v16])
    {
      int v17 = +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:v16];
      BOOL v18 = v17;
      if (a6)
      {
        double v19 = 1.0 - a5;
        if (!v11) {
          double v19 = a5;
        }
        double v20 = v19 / a8;
        __int16 v21 = [[UICubicTimingParameters alloc] initWithAnimationCurve:a9];
        [v18 setReversed:!v11];
        [v18 continueAnimationWithTimingParameters:v21 durationFactor:v20];
      }
      else
      {
        [v17 setFractionComplete:a5];
      }
    }
    else
    {
      BOOL v18 = [v26 layer];
      [(_UIViewControllerTransitionConductor *)self->_transitionConductor customNavigationTransitionDuration];
      double v23 = v22;
      if (a6)
      {
        [v18 timeOffset];
        if (v11) {
          double v24 = v23 - v24;
        }
        +[UIView _completeAnimationWithUUID:v16 duration:a9 curve:!v11 reverse:v24];
        *(float *)&double v25 = a8;
        [v18 setSpeed:v25];
      }
      else
      {
        [v18 setTimeOffset:v22 * a5];
      }
    }
  }
}

- (void)_updateInteractiveTransition:(double)a3
{
  if (a3 >= 0.0) {
    double v4 = a3;
  }
  else {
    double v4 = 0.0;
  }
  BOOL v5 = [(UINavigationController *)self _navbarIsAppearingInteractively];
  uint64_t v6 = [(UINavigationController *)self _navigationBarForNestedNavigationController];
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = [(UINavigationController *)self _navbarAnimationId];
    [(UINavigationController *)self _updateInteractiveBarTransition:v7 withUUID:v8 percent:0 isFinished:0 didComplete:3 completionSpeed:v4 completionCurve:1.0];
  }
  else
  {
    [v6 _updateInteractiveTransition:v4];
  }

  if ([(UINavigationController *)self _toolbarIsAnimatingInteractively])
  {
    id v10 = [(UINavigationController *)self _existingToolbar];
    double v9 = [(UINavigationController *)self _toolbarAnimationId];
    [(UINavigationController *)self _updateInteractiveBarTransition:v10 withUUID:v9 percent:0 isFinished:0 didComplete:3 completionSpeed:v4 completionCurve:1.0];
  }
}

- (void)_finishInteractiveTransition:(double)a3 transitionContext:(id)a4
{
  id v14 = a4;
  BOOL v6 = [(UINavigationController *)self _navbarIsAppearingInteractively];
  uint64_t v7 = [(UINavigationController *)self _navigationBarForNestedNavigationController];
  if (v6)
  {
    id v8 = [(UINavigationController *)self _navbarAnimationId];
    [v14 _completionVelocity];
    -[UINavigationController _updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:](self, "_updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:", v7, v8, 1, 1, [v14 _completionCurve], a3, v9);
  }
  else
  {
    [v14 _completionVelocity];
    objc_msgSend(v7, "_finishInteractiveTransition:completionSpeed:completionCurve:", objc_msgSend(v14, "_completionCurve"), a3, v10);
  }

  if ([(UINavigationController *)self _toolbarIsAnimatingInteractively])
  {
    BOOL v11 = [(UINavigationController *)self _existingToolbar];
    double v12 = [(UINavigationController *)self _toolbarAnimationId];
    [v14 _completionVelocity];
    -[UINavigationController _updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:](self, "_updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:", v11, v12, 1, 1, [v14 _completionCurve], a3, v13);
  }
}

- (void)_cancelInteractiveTransition:(double)a3 transitionContext:(id)a4
{
  id v14 = a4;
  [v14 _completionVelocity];
  double v7 = v6;
  if ([(UINavigationController *)self _navbarIsAppearingInteractively])
  {
    [(UINavigationController *)self _setNavigationBarAnimationWasCancelled:1];
    id v8 = [(UINavigationController *)self _navigationBarForNestedNavigationController];
    double v9 = [(UINavigationController *)self _navbarAnimationId];
    -[UINavigationController _updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:](self, "_updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:", v8, v9, 1, 0, [v14 _completionCurve], a3, fabs(v7));
  }
  else
  {
    id v8 = [(UINavigationController *)self _navigationBarForNestedNavigationController];
    [v14 _completionVelocity];
    objc_msgSend(v8, "_cancelInteractiveTransition:completionSpeed:completionCurve:", objc_msgSend(v14, "_completionCurve"), a3, fabs(v10));
  }

  if ([(UINavigationController *)self _toolbarIsAnimatingInteractively])
  {
    [(UINavigationController *)self _setToolbarAnimationWasCancelled:1];
    BOOL v11 = [(UINavigationController *)self _existingToolbar];
    double v12 = [(UINavigationController *)self _toolbarAnimationId];
    [v14 _completionVelocity];
    -[UINavigationController _updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:](self, "_updateInteractiveBarTransition:withUUID:percent:isFinished:didComplete:completionSpeed:completionCurve:", v11, v12, 1, 0, [v14 _completionCurve], a3, fabs(v13));
  }
}

- (BOOL)_shouldCrossFadeNavigationBar
{
  if ([(UINavigationController *)self _isUsingBuiltinAnimator]
    && [(_UINavigationControllerVisualStyle *)self->_visualStyle isUsingParallaxTransition])
  {
    return 0;
  }
  if ([(_UIViewControllerTransitionConductor *)self->_transitionConductor shouldCrossFadeNavigationBar])
  {
    return 1;
  }
  uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  if ((navigationControllerFlags & 0x2000000) == 0) {
    return (navigationControllerFlags & 0x600000) != 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = [WeakRetained _navigationControllerShouldCrossFadeNavigationBar:self];

  return v6;
}

- (int64_t)_navigationBarTransitionVariant
{
  int64_t result = [(_UIViewControllerTransitionConductor *)self->_transitionConductor navigationBarTransitionVariant];
  if (!result) {
    return [(UINavigationController *)self _shouldCrossFadeNavigationBar];
  }
  return result;
}

- (id)_navigationBarTransitionOverlay
{
  return [(_UIViewControllerTransitionConductor *)self->_transitionConductor navigationBarTransitionOverlay];
}

- (BOOL)_shouldCrossFadeNavigationBarVisibility
{
  id v3 = [(UINavigationController *)self _nestedTopViewController];
  double v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 navigationController];
    if (v5 == self)
    {
    }
    else
    {
      char v6 = v5;
      double v7 = [v4 navigationController];
      int v8 = [v7 _isTransitioning];

      if (v8)
      {
        double v9 = [v4 navigationController];
        char v10 = [v9 _shouldCrossFadeNavigationBarVisibility];

        goto LABEL_9;
      }
    }
  }
  if ([(UINavigationController *)self _shouldCrossFadeNavigationBar]) {
    char v10 = 1;
  }
  else {
    char v10 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor shouldCrossFadeNavigationBarVisibility];
  }
LABEL_9:

  return v10;
}

- (void)_startToolbarTransitionIfNecessary:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [v6 _transitionCoordinator];
  int v8 = [v6 fromViewController];
  double v9 = [v6 toViewController];
  char v10 = [(UINavigationController *)self _existingToolbar];
  BOOL v11 = [v10 items];

  double v12 = [v9 toolbarItems];
  double v13 = [(UINavigationController *)self _navigationToolbarTransitionController];

  if (v13)
  {
    if (![(UINavigationController *)self isToolbarHidden])
    {
      id v14 = [(UINavigationController *)self _navigationToolbarTransitionController];
      double v15 = [(UINavigationController *)self _existingToolbar];
      [v14 beginTransitionWithToolbar:v15 items:v12 animated:v4];
    }
    id v16 = 0;
    int v17 = 0;
    goto LABEL_60;
  }
  double v58 = v7;
  double v59 = v12;
  if (!v4 || !dyld_program_sdk_at_least()) {
    goto LABEL_16;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v19 = isKindOfClass;
  if (isKindOfClass)
  {
    char v20 = isKindOfClass;
    __int16 v21 = v8;
    int v17 = v21;
    if ((v21[154] & 2) == 0 || (*(void *)&self->_navigationControllerFlags & 0x100000000002) == 0)
    {
      char v57 = 0;
      int v26 = 0;
      id v16 = 0;
      goto LABEL_18;
    }
    double v54 = [v21 _existingToolbar];
    uint64_t v22 = [v54 items];
    id v16 = 0;
    double v23 = v11;
    BOOL v11 = (void *)v22;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_16:
    char v57 = 0;
    int v26 = 0;
    id v16 = 0;
LABEL_17:
    int v17 = 0;
    goto LABEL_18;
  }
  double v24 = v9;
  id v16 = v24;
  if ((v24[154] & 2) == 0 || (*(void *)&self->_navigationControllerFlags & 0x100000000002) == 0)
  {
    char v57 = 0;
    int v26 = 0;
    goto LABEL_17;
  }
  char v20 = v19;
  double v54 = [v24 _existingToolbar];
  uint64_t v25 = [v54 items];
  int v17 = 0;
  double v23 = v12;
  double v59 = (void *)v25;
LABEL_15:
  char v57 = v20 ^ 1;

  int v26 = 1;
LABEL_18:
  int v27 = v26 & _UIBarsApplyChromelessEverywhere();
  uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  uint64_t v29 = 0x200000000000;
  if (!v27) {
    uint64_t v29 = 0;
  }
  *(void *)&self->_uint64_t navigationControllerFlags = navigationControllerFlags & 0xFFFFDFFFFFFFFFFFLL | v29;
  if (((v26 & 1) != 0 || (navigationControllerFlags & 2) != 0)
    && (char v55 = v27, ![(UINavigationController *)self _toolbarIsAnimatingInteractively]))
  {
    double v12 = v59;
    if ([v59 count] || objc_msgSend(v11, "count"))
    {
      double v53 = [(UINavigationController *)self _existingToolbar];
      if (v55)
      {
        if ([v8 _isNavigationController]) {
          objc_super v30 = v8;
        }
        else {
          objc_super v30 = v9;
        }
        double v52 = [v30 _existingToolbar];
      }
      else
      {
        double v52 = 0;
      }
      uint64_t v50 = v11;
      if (v4)
      {
        BOOL v51 = [(UINavigationController *)self _hasInterruptibleNavigationTransition];
        BOOL v31 = [(UINavigationController *)self isInteractiveTransition];
        if (v26)
        {
          LODWORD(v49) = v31;
          [v17 _setToolbarHidden:1 edge:15 duration:0.0];
          uint64_t v47 = [v17 _existingToolbar];
          [v47 setItems:0];

          [v16 _setToolbarHidden:1 edge:15 duration:0.0];
          uint64_t v48 = [v16 _existingToolbar];
          [v48 setItems:0];

          v87[0] = MEMORY[0x1E4F143A8];
          v87[1] = 3221225472;
          v87[2] = __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke;
          v87[3] = &unk_1E52D9F70;
          void v87[4] = self;
          +[UIView performWithoutAnimation:v87];
          [v53 setItems:v11];
          BOOL v31 = (int)v49;
        }
        if (v31 || v51) {
          [(UINavigationController *)self _startInteractiveToolbarTransition];
        }
        [v53 bounds];
        double v33 = v32;
        double v35 = v34;
        objc_msgSend(v53, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
        BOOL v38 = v35 != v37 || v33 != v36;
        if (v51)
        {
          aBlock[0] = MEMORY[0x1E4F143A8];
          BOOL v56 = v38;
          aBlock[1] = 3221225472;
          aBlock[2] = __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_2;
          aBlock[3] = &unk_1E52DAD98;
          id v82 = v53;
          BOOL v85 = v4;
          BOOL v86 = v56;
          id v83 = v59;
          id v84 = self;
          uint64_t v39 = _Block_copy(aBlock);
        }
        else
        {
          BOOL v42 = v38;
          [v53 setItems:v59 animated:1];
          char v43 = v55;
          uint64_t v44 = 0;
          if (!(v57 & 1 | ((v55 & 1) == 0)))
          {
            [v53 _backgroundTransitionProgress];
            uint64_t v44 = v45;
            [v52 _backgroundTransitionProgress];
            objc_msgSend(v53, "_setBackgroundTransitionProgress:");
            char v43 = v55;
          }
          if (v42 || (v43 & 1) != 0)
          {
            v73[0] = MEMORY[0x1E4F143A8];
            v73[1] = 3221225472;
            v73[2] = __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_3;
            v73[3] = &unk_1E52E8900;
            BOOL v78 = v42;
            v73[4] = self;
            char v79 = v43;
            char v80 = v57 & 1;
            id v74 = v52;
            id v75 = v16;
            uint64_t v77 = v44;
            id v76 = v53;
            uint64_t v39 = _Block_copy(v73);
          }
          else
          {
            uint64_t v39 = 0;
          }
          [(UINavigationController *)self _finishAnimationTracking];
        }
        objc_initWeak(&location, self);
        if (v39)
        {
          uint64_t v46 = v70;
          v70[0] = MEMORY[0x1E4F143A8];
          v70[1] = 3221225472;
          v70[2] = __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_4;
          v70[3] = &unk_1E52DA110;
          uint64_t v49 = &v71;
          id v71 = v39;
        }
        else
        {
          uint64_t v46 = 0;
        }
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_5;
        v60[3] = &unk_1E52E8928;
        objc_copyWeak(&v66, &location);
        char v67 = v26;
        id v61 = v53;
        id v62 = v16;
        id v63 = v17;
        char v68 = v57 & 1;
        id v64 = v8;
        char v65 = self;
        BOOL v69 = v51;
        double v7 = v58;
        [v58 animateAlongsideTransition:v46 completion:v60];

        objc_destroyWeak(&v66);
        if (v39) {

        }
        objc_destroyWeak(&location);
        uint64_t v41 = v53;
      }
      else
      {
        uint64_t v40 = [v9 toolbarItems];
        uint64_t v41 = v53;
        [v53 setItems:v40 animated:0];

        double v7 = v58;
      }

      BOOL v11 = v50;
    }
    else
    {
      double v7 = v58;
    }
  }
  else
  {
    double v7 = v58;
    double v12 = v59;
  }
LABEL_60:
}

uint64_t __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setToolbarHidden:0 edge:15 duration:0.0];
}

uint64_t __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setItems:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 56)];
  if (*(unsigned char *)(a1 + 57))
  {
    id v3 = *(void **)(a1 + 48);
    uint64_t v4 = [v3 isToolbarHidden];
    return [v3 _positionToolbarHidden:v4];
  }
  return result;
}

uint64_t __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_3(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 72)) {
    uint64_t result = objc_msgSend(*(id *)(result + 32), "_positionToolbarHidden:", objc_msgSend(*(id *)(result + 32), "isToolbarHidden"));
  }
  if (*(unsigned char *)(v1 + 73))
  {
    if (*(unsigned char *)(v1 + 74))
    {
      uint64_t v2 = [*(id *)(v1 + 40) _appearanceHint];
      if (v2 == 1)
      {
        double v3 = 0.0;
      }
      else if (v2 == 2)
      {
        double v3 = 1.0;
      }
      else
      {
        [*(id *)(v1 + 40) _backgroundTransitionProgress];
        double v7 = v4;
        BOOL v5 = [*(id *)(v1 + 48) _viewControllerForObservableScrollView];
        id v6 = [v5 _contentOrObservableScrollViewForEdge:4];
        _UIBarsGetBottomBarBackgroundTransitionProgressForScrollView(v6, *(void **)(v1 + 40), &v7);

        double v3 = v7;
      }
    }
    else
    {
      double v3 = *(double *)(v1 + 64);
    }
    return [*(id *)(v1 + 56) _setBackgroundTransitionProgress:v3];
  }
  return result;
}

uint64_t __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_5(uint64_t a1, void *a2)
{
  double v3 = (id *)(a1 + 72);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  int v6 = [v4 isCancelled];

  if (v6)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      [WeakRetained _setToolbarAnimationWasCancelled:0];
      [*(id *)(a1 + 32) setItems:0];
      [*(id *)(a1 + 40) _setToolbarHidden:0 edge:15 duration:0.0];
      [*(id *)(a1 + 48) _setToolbarHidden:0 edge:15 duration:0.0];
      [WeakRetained _setToolbarHidden:*(unsigned char *)(a1 + 81) == 0 edge:15 duration:0.0];
    }
    else
    {
      double v7 = *(void **)(a1 + 32);
      int v8 = [*(id *)(a1 + 56) toolbarItems];
      [v7 setItems:v8 animated:0];

      [WeakRetained _setToolbarAnimationWasCancelled:0];
    }
  }
  else if (*(unsigned char *)(a1 + 80))
  {
    if (*(unsigned char *)(a1 + 81))
    {
      [*(id *)(a1 + 32) setItems:0];
      [WeakRetained _setToolbarHidden:1 edge:15 duration:0.0];
    }
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    double v13 = __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_6;
    id v14 = &unk_1E52D9F98;
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    +[UIView performWithoutAnimation:&v11];
  }
  *(void *)(*(void *)(a1 + 64) + 1232) &= ~0x200000000000uLL;
  if (!*(unsigned char *)(a1 + 82))
  {
    double v9 = [*(id *)(a1 + 32) layer];
    [v9 setTimeOffset:0.0];
    LODWORD(v10) = 1.0;
    [v9 setSpeed:v10];
  }
  objc_msgSend(WeakRetained, "_setToolbarAnimationId:", 0, v11, v12, v13, v14);
}

uint64_t __70__UINavigationController__startToolbarTransitionIfNecessary_animated___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _existingToolbar];
  [v2 setItems:0];

  double v3 = *(void **)(a1 + 32);
  id v4 = [v3 topViewController];
  [v3 _updateToolbarItemsFromViewController:v4 animated:0];

  [*(id *)(a1 + 32) _setToolbarHidden:0 edge:15 duration:0.0];
  BOOL v5 = [*(id *)(a1 + 40) _existingToolbar];
  [v5 setItems:0];

  int v6 = *(void **)(a1 + 40);
  double v7 = [v6 topViewController];
  [v6 _updateToolbarItemsFromViewController:v7 animated:0];

  int v8 = *(void **)(a1 + 40);
  return [v8 _setToolbarHidden:0 edge:15 duration:0.0];
}

- (unint64_t)_keyboardScreenEdgeForTransition:(int)a3
{
  unsigned int v3 = [(id)objc_opt_class() _keyboardDirectionForTransition:*(void *)&a3] - 1;
  if (v3 > 4) {
    return 4;
  }
  else {
    return qword_186B94258[v3];
  }
}

- (BOOL)_shouldHideSearchBarWhenScrollingForNavigationItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UINavigationController *)self _topViewControllerObservableScrollViewForEdge:1];

  if (v5) {
    LOBYTE(v5) = [v4 hidesSearchBarWhenScrolling];
  }

  return (char)v5;
}

- (Class)navigationBarClass
{
  return self->_navigationBarClass;
}

- (id)_viewsWithDisabledInteractionGivenTransitionContext:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UINavigationController;
  BOOL v5 = [(UIViewController *)&v13 _viewsWithDisabledInteractionGivenTransitionContext:v4];
  if (!v5)
  {
    BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  }
  int v6 = [(UINavigationController *)self _existingToolbar];

  if (v6)
  {
    double v7 = [(UINavigationController *)self _existingToolbar];
    [v5 addObject:v7];
  }
  id v8 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionContext];
  if (![(UINavigationController *)self enableBackButtonDuringTransition]) {
    [v5 addObject:self->_navigationBar];
  }
  if (v8 == v4
    && ([v4 isInterruptible] & 1) == 0
    && ([v4 _allowUserInteraction] & 1) == 0)
  {
    double v9 = [(UINavigationController *)self disappearingViewController];
    double v10 = [v9 view];
    uint64_t v11 = [v10 superview];

    if (v11) {
      [v5 addObject:v11];
    }
  }
  return v5;
}

- (BOOL)_canPerformRename:(id)a3
{
  id v4 = (UINavigationBar *)a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(UINavigationBar *)v4 sender];

    id v4 = (UINavigationBar *)v5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4 == self->_navigationBar)
    {
LABEL_10:
      double v10 = [(UINavigationController *)self navigationBar];
      uint64_t v11 = [v10 topItem];
      char v9 = [v11 _canRename];

      goto LABEL_11;
    }
  }
  else if (![(UINavigationController *)self isNavigationBarHidden])
  {
    uint64_t v6 = [(UIView *)self->_navigationBar window];
    if (v6)
    {
      double v7 = (void *)v6;
      id v8 = [(UIViewController *)self presentedViewController];

      if (!v8) {
        goto LABEL_10;
      }
    }
  }
  char v9 = 0;
LABEL_11:

  return v9;
}

- (void)rename:(id)a3
{
  id v3 = [(UINavigationController *)self navigationBar];
  [v3 _beginRenaming];
}

- (BOOL)_navigationBarShouldUpdateProgress
{
  uint64_t v2 = [(UIViewController *)self childViewControllers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_clipUnderlapWhileTransitioning
{
  return (*(void *)&self->_navigationControllerFlags >> 33) & 1;
}

- (BOOL)_animationParametersForHidingNavigationBar:(BOOL)a3 lastOperation:(int64_t)a4 edge:(unint64_t *)a5 duration:(double *)a6
{
  BOOL v9 = a3;
  uint64_t v11 = [(UIViewController *)self view];
  int v12 = [v11 _shouldReverseLayoutDirection];

  if (v12) {
    uint64_t v13 = 8;
  }
  else {
    uint64_t v13 = 2;
  }
  if (v12) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 8;
  }
  BOOL v15 = [(UINavigationController *)self _shouldCrossFadeNavigationBarVisibility];
  if (a4 == 2)
  {
    if (a5)
    {
      if (v9) {
        unint64_t v19 = v14;
      }
      else {
        unint64_t v19 = v13;
      }
      if (v15) {
        unint64_t v19 = 15;
      }
      *a5 = v19;
    }
    if (!a6) {
      return 1;
    }
    int v17 = self;
    uint64_t v18 = 2;
    goto LABEL_27;
  }
  if (a4 == 1)
  {
    if (a5)
    {
      if (v9) {
        unint64_t v16 = v13;
      }
      else {
        unint64_t v16 = v14;
      }
      if (v15) {
        unint64_t v16 = 15;
      }
      *a5 = v16;
    }
    if (!a6) {
      return 1;
    }
    int v17 = self;
    uint64_t v18 = 1;
LABEL_27:
    [(UINavigationController *)v17 durationForTransition:v18];
    double v21 = v20;
    uint64_t v22 = [(UINavigationController *)self _transitionConductor];
    [v22 navigationBarHidingDurationWithDefaultDuration:v21];
    *(void *)a6 = v23;

    return 1;
  }
  return 0;
}

- (BOOL)_viewControllerIgnoresClippedGlyphPathFrame
{
  v4.receiver = self;
  v4.super_class = (Class)UINavigationController;
  return [(UIViewController *)&v4 _viewControllerIgnoresClippedGlyphPathFrame]|| self->_interactiveScrollActive|| [(UINavigationController *)self _isTransitioning];
}

uint64_t __74__UINavigationController__positionNavigationBarHidden_edge_initialOffset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutBelowIfNeeded];
}

- (void)_positionTransitioningPalette:(id)a3 outside:(BOOL)a4 edge:(unint64_t)a5 preservingYPosition:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = v10;
  if (!v10 || [v10 boundaryEdge] == 5) {
    goto LABEL_26;
  }
  if (os_variant_has_internal_diagnostics())
  {
    if (v8 && a5 != 2 && a5 != 8)
    {
      uint64_t v49 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        double v58 = "-[UINavigationController _positionTransitioningPalette:outside:edge:preservingYPosition:]";
        _os_log_fault_impl(&dword_1853B0000, v49, OS_LOG_TYPE_FAULT, "Only pass outside==YES to %s for transitions!", buf, 0xCu);
      }
    }
  }
  else if (v8 && a5 != 2 && a5 != 8)
  {
    int v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_positionTransitioningPalette_outside_edge_preservingYPosition____s_category)+ 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      double v58 = "-[UINavigationController _positionTransitioningPalette:outside:edge:preservingYPosition:]";
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Only pass outside==YES to %s for transitions!", buf, 0xCu);
    }
  }
  uint64_t v13 = [(UINavigationController *)self navigationBar];
  [v13 frame];
  uint64_t v52 = v15;
  uint64_t v54 = v14;
  uint64_t v50 = v16;
  double v18 = v17;

  uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  [(UIView *)self->_topPalette bounds];
  double v21 = v20;
  double v23 = v22 * 0.5;
  double v24 = v22 * 0.5 + 0.0;
  double rect = v18;
  if ([v11 _isPalettePinningBarHidden]) {
    double v18 = -0.0;
  }
  if (objc_msgSend(v11, "paletteIsHidden", v50, v52, v54))
  {
    [(UINavigationController *)self _frameForPalette:v11];
    objc_msgSend(v11, "setFrame:");
    [(UINavigationController *)self _installPaletteIntoViewHierarchy:v11];
  }
  double v25 = v18 + v24;
  containerView = self->_containerView;
  if (containerView)
  {
    [(UIView *)containerView bounds];
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
  }
  else
  {
    CGFloat v28 = *MEMORY[0x1E4F1DB28];
    CGFloat v30 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v32 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v34 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  v60.origin.double x = v28;
  v60.origin.CGFloat y = v30;
  v60.size.CGFloat width = v32;
  v60.size.height = v34;
  double MidX = CGRectGetMidX(v60);
  v61.origin.double x = v28;
  v61.origin.CGFloat y = v30;
  v61.size.CGFloat width = v32;
  v61.size.height = v34;
  -[UINavigationController _computeTopBarCenter:hidden:edge:center:offset:](self, "_computeTopBarCenter:hidden:edge:center:offset:", v11, v8, a5, MidX, CGRectGetMinY(v61), v25);
  double v37 = v36;
  double v39 = v38 + v21 * -0.5;
  [v11 frame];
  double v43 = v41;
  double v44 = v42;
  if (v6)
  {
    double v45 = v40;
    double v46 = v39;
    double MinY = CGRectGetMinY(*(CGRect *)(&v40 - 1));
    v62.origin.CGFloat y = v53;
    v62.origin.double x = v55;
    v62.size.CGFloat width = v51;
    v62.size.height = rect;
    double v48 = MinY - CGRectGetMaxY(v62);
  }
  else
  {
    double v45 = v37 - v23;
    if (![v11 _isPalettePinningBarHidden]) {
      goto LABEL_21;
    }
    double v48 = -rect;
  }
  [v11 _setTopConstraintConstant:v48];
LABEL_21:
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    if ((navigationControllerFlags & 1) == 0) {
      [v11 _setLeftConstraintConstant:v39];
    }
    objc_msgSend(v11, "setFrame:", v39, v45, v43, v44);
  }
  else
  {
    -[_UINavigationControllerPalette setFrame:isAnimating:](self->_topPalette, "setFrame:isAnimating:", 0, v39, v45, v43, v44);
    [v11 _setLeftConstraintConstant:v39];
  }
LABEL_26:
}

- (void)_setNavigationBarHidden:(BOOL)a3 edgeIfNotNavigating:(unint64_t)a4 duration:(double)a5
{
  if ((((*(void *)&self->_navigationControllerFlags & 1) == 0) ^ a3)) {
    return;
  }
  BOOL v7 = a3;
  unint64_t v18 = a4;
  double v17 = a5;
  BOOL v9 = [(UINavigationController *)self _isTransitioningOrPaletteIsTransitioning];
  topPalette = self->_topPalette;
  if (!topPalette || ![(_UINavigationControllerPalette *)topPalette isAttached])
  {
    int v12 = 0;
LABEL_9:
    if ([(UINavigationController *)self wasLastOperationAnimated]) {
      [(UINavigationController *)self _animationParametersForHidingNavigationBar:v7 lastOperation:[(UINavigationController *)self lastOperation] edge:&v18 duration:&v17];
    }
    if (v12)
    {
      if ([(_UINavigationControllerPalette *)self->_topPalette isPinned])
      {
        [(_UINavigationControllerPalette *)self->_topPalette _setPalettePinningBarHidden:v7];
        [(_UINavigationControllerPalette *)self->_topPalette _resetConstraintConstants:0.0];
      }
      else
      {
        uint64_t v14 = [(UIViewController *)self transitionCoordinator];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __79__UINavigationController__setNavigationBarHidden_edgeIfNotNavigating_duration___block_invoke;
        v15[3] = &unk_1E52E7B28;
        void v15[4] = self;
        BOOL v16 = v7;
        [v14 animateAlongsideTransition:0 completion:v15];
      }
    }
    [(UINavigationController *)self _setNavigationBarHidden:v7 edge:v18 duration:v17];
    return;
  }
  BOOL v11 = [(_UINavigationControllerPalette *)self->_topPalette isVisibleWhenPinningBarIsHidden];
  if (v9 || !v11)
  {
    int v12 = v11;
    if (v7 && v11 && v9)
    {
      uint64_t v13 = [(UIView *)self->_topPalette superview];

      if (v13)
      {
        int v12 = 1;
      }
      else
      {
        int v12 = 1;
        [(_UINavigationControllerPalette *)self->_topPalette _setPalettePinningBarHidden:1];
      }
    }
    goto LABEL_9;
  }
  if (!v7) {
    [(UINavigationController *)self _unhideNavigationBarForEdge:a4];
  }
  [(UINavigationController *)self _repositionPaletteWithNavigationBarHidden:v7 duration:1 shouldUpdateNavigationItems:a5];
}

uint64_t __79__UINavigationController__setNavigationBarHidden_edgeIfNotNavigating_duration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if ((result & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 1088) _setPalettePinningBarHidden:*(unsigned __int8 *)(a1 + 40)];
    int v4 = [*(id *)(a1 + 32) _viewControllerUnderlapsStatusBar];
    double v5 = 0.0;
    if (v4) {
      objc_msgSend(*(id *)(a1 + 32), "_statusBarHeightAdjustmentForCurrentOrientation", 0.0);
    }
    BOOL v6 = *(void **)(*(void *)(a1 + 32) + 1088);
    if (!*(unsigned char *)(a1 + 40)) {
      double v5 = 0.0;
    }
    return [v6 _resetConstraintConstants:v5];
  }
  return result;
}

- (void)_setSearchHidNavigationBar:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UINavigationController *)self _outermostNavigationController];
  if (v5 == self)
  {
    uint64_t v6 = 0x800000000000;
    if (!v3) {
      uint64_t v6 = 0;
    }
    *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFF7FFFFFFFFFFFLL | v6;
  }
  else
  {
    BOOL v7 = v5;
    [(UINavigationController *)v5 _setSearchHidNavigationBar:v3];
    double v5 = v7;
  }
}

uint64_t __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 1232);
  id v4 = a2;
  if ([v4 isCancelled] && (v3 & 1) != *(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) _setNavigationBarAnimationWasCancelled:0];
  }
  double v5 = *(void **)(a1 + 32);
  id v6 = [NSNumber numberWithBool:1];
  [v5 _hideShowNavigationBarDidStop:@"UINavigationControllerHideShowNavigationBar" finished:v6 context:v4];
}

void __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  [v2 _hideShowNavigationBarDidStop:@"UINavigationControllerHideShowNavigationBar" finished:v3 context:0];
}

uint64_t __64__UINavigationController__setNavigationBarHidden_edge_duration___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = NSNumber;
  id v5 = a2;
  id v6 = [v4 numberWithBool:1];
  [v3 _hideShowNavigationBarDidStop:@"UINavigationControllerHideShowNavigationBar" finished:v6 context:v5];

  BOOL v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v7();
}

- (BOOL)pretendNavBarHidden
{
  return (*(void *)&self->_navigationControllerFlags >> 13) & 1;
}

- (void)setPretendNavBarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UINavigationController *)self _outermostNavigationController];
  if (v5 == self)
  {
    uint64_t v6 = 0x2000;
    if (!v3) {
      uint64_t v6 = 0;
    }
    *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFFDFFFLL | v6;
  }
  else
  {
    BOOL v7 = v5;
    [(UINavigationController *)v5 setPretendNavBarHidden:v3];
    id v5 = v7;
  }
}

- (BOOL)searchBarHidNavBar
{
  return (*(void *)&self->_navigationControllerFlags >> 15) & 1;
}

- (void)setSearchBarHidNavBar:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)avoidMovingNavBarOffscreenBeforeUnhiding
{
  return (*(void *)&self->_navigationControllerFlags >> 14) & 1;
}

- (void)setAvoidMovingNavBarOffscreenBeforeUnhiding:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (void)_sendNavigationBarToBack
{
  id v5 = [(UINavigationController *)self navigationBar];
  uint64_t v3 = [v5 superview];
  id v4 = [(UINavigationController *)self navigationBar];
  [v3 sendSubviewToBack:v4];
}

- (void)setToolbar:(id)a3
{
  id v5 = (UIToolbar *)a3;
  p_toolbar = &self->_toolbar;
  toolbar = self->_toolbar;
  BOOL v9 = v5;
  if (toolbar != v5)
  {
    if (toolbar)
    {
      BOOL v8 = [MEMORY[0x1E4F1C978] array];
      [(UIToolbar *)toolbar setItems:v8 animated:0];

      [(UIView *)*p_toolbar removeFromSuperview];
      [(NSMapTable *)self->_lastContentMarginForView removeObjectForKey:*p_toolbar];
    }
    objc_storeStrong((id *)&self->_toolbar, a3);
    if (*p_toolbar) {
      [(UINavigationController *)self _configureToolbar];
    }
  }
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 addSubview:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) _positionToolbarHidden:1 edge:*(void *)(a1 + 48) crossFade:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v3 = *(void **)(a1 + 40);
  return [v3 layoutIfNeeded];
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 152))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _backgroundView];
    [v2 setAlpha:0.0];
  }
  if (*(unsigned char *)(a1 + 153))
  {
    uint64_t v3 = [*(id *)(a1 + 40) _backgroundView];
    [v3 setAlpha:0.0];
  }
  if (*(unsigned char *)(a1 + 154) && (*(void *)(*(void *)(a1 + 48) + 1232) & 0x400000000) != 0)
  {
    id v5 = *(void **)(a1 + 64);
    [*(id *)(a1 + 32) bounds];
    objc_msgSend(v5, "convertRect:fromView:", *(void *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 56), "setFrame:");
    uint64_t v6 = *(void **)(a1 + 40);
    long long v7 = *(_OWORD *)(a1 + 88);
    v13[0] = *(_OWORD *)(a1 + 72);
    v13[1] = v7;
    v13[2] = *(_OWORD *)(a1 + 104);
    [v6 setTransform:v13];
  }
  else if (*(unsigned char *)(a1 + 155) && (*(void *)(*(void *)(a1 + 48) + 1232) & 0x800000000) != 0)
  {
    id v4 = *(void **)(a1 + 64);
    [*(id *)(a1 + 40) bounds];
    objc_msgSend(v4, "convertRect:fromView:", *(void *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 56), "setFrame:");
  }
  [*(id *)(a1 + 56) frame];
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", v8 + *(double *)(a1 + 128), *(double *)(a1 + 120) + v9, v10 - (*(double *)(a1 + 128) + *(double *)(a1 + 144)), v11 - (*(double *)(a1 + 120) + *(double *)(a1 + 136)));
  return [*(id *)(a1 + 64) setMaskView:*(void *)(a1 + 56)];
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 160) && (*(void *)(*(void *)(a1 + 32) + 1232) & 0x400000000) != 0)
  {
    double v9 = *(void **)(a1 + 40);
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v28[0] = *MEMORY[0x1E4F1DAB8];
    v28[1] = v10;
    v28[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v9 setTransform:v28];
    double v11 = *(void **)(a1 + 56);
    [*(id *)(a1 + 40) bounds];
    objc_msgSend(v11, "convertRect:fromView:", *(void *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "setFrame:", v12 + *(double *)(a1 + 88), *(double *)(a1 + 80) + v13, v14 - (*(double *)(a1 + 88) + *(double *)(a1 + 104)), v15 - (*(double *)(a1 + 80) + *(double *)(a1 + 96)));
    double v8 = *(void **)(a1 + 40);
    goto LABEL_7;
  }
  if (*(unsigned char *)(a1 + 161) && (*(void *)(*(void *)(a1 + 32) + 1232) & 0x800000000) != 0)
  {
    long long v2 = *(_OWORD *)(a1 + 128);
    v27[0] = *(_OWORD *)(a1 + 112);
    v27[1] = v2;
    v27[2] = *(_OWORD *)(a1 + 144);
    [*(id *)(a1 + 40) setTransform:v27];
    uint64_t v3 = *(void **)(a1 + 56);
    [*(id *)(a1 + 72) bounds];
    objc_msgSend(v3, "convertRect:fromView:", *(void *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 48), "setFrame:", v4 + *(double *)(a1 + 88), *(double *)(a1 + 80) + v5, v6 - (*(double *)(a1 + 88) + *(double *)(a1 + 104)), v7 - (*(double *)(a1 + 80) + *(double *)(a1 + 96)));
    double v8 = *(void **)(a1 + 72);
LABEL_7:
    BOOL v16 = [v8 _backgroundView];
    [v16 frame];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v25 = [*(id *)(a1 + 32) view];
    objc_msgSend(v8, "convertRect:toView:", v25, v18, v20, v22, v24);
    objc_msgSend(*(id *)(a1 + 64), "setFrame:");
  }
  return [*(id *)(a1 + 64) layoutIfNeeded];
}

void __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_4(id *a1)
{
  long long v2 = [a1[4] _backgroundView];
  [v2 setAlpha:1.0];

  uint64_t v3 = [a1[5] _backgroundView];
  [v3 setAlpha:1.0];

  id v4 = a1[5];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v10[0] = *MEMORY[0x1E4F1DAB8];
  v10[1] = v5;
  v10[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v4 setTransform:v10];
  double v6 = (void *)UIApp;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_5;
  v7[3] = &unk_1E52D9F98;
  id v8 = a1[6];
  id v9 = a1[7];
  [v6 _performBlockAfterCATransactionCommits:v7];
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setMaskView:0];
  long long v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperview];
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_14(uint64_t a1, void *a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 40);
  unint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1232);
  id v5 = a2;
  if ([v5 isCancelled] && (v3 != 0) == ((v4 >> 1) & 1)) {
    [*(id *)(a1 + 32) _setToolbarAnimationWasCancelled:0];
  }
  double v6 = *(void **)(a1 + 32);
  id v7 = [NSNumber numberWithBool:1];
  [v6 _hideShowToolbarDidStop:@"UINavigationControllerHideShowToolbar" finished:v7 context:v5];
}

void __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_15(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = +[UIView _currentViewAnimationState];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (int)[v2 _didEndCount] > 0;
}

void __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_16(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = [NSNumber numberWithBool:a2];
    [v2 _hideShowToolbarDidStop:@"UINavigationControllerHideShowToolbar" finished:v3 context:0];
  }
}

uint64_t __58__UINavigationController__setToolbarHidden_edge_duration___block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  unint64_t v4 = NSNumber;
  id v5 = a2;
  double v6 = [v4 numberWithBool:1];
  [v3 _hideShowToolbarDidStop:@"UINavigationControllerHideShowToolbar" finished:v6 context:v5];

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v7();
}

- (void)_navigationBarDidEndAnimation:(id)a3
{
  unint64_t v4 = (UINavigationBar *)a3;
  if (self->_navigationBar == v4)
  {
    id v5 = [(UIViewController *)self view];
    double v6 = [v5 traitCollection];
    if ([v6 userInterfaceIdiom] == 3)
    {
      uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;

      if ((navigationControllerFlags & 0x20000000000000) == 0)
      {
        *(void *)&self->_navigationControllerFlags |= 0x20000000000000uLL;
        [(UIViewController *)self setNeedsFocusUpdate];
      }
    }
    else
    {
    }
  }
  id v8 = [(UINavigationController *)self _outermostNavigationController];
  id v9 = [v8 _existingNavigationBar];

  if (v9 == v4)
  {
    long long v10 = [(UIViewController *)self transitionCoordinator];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __56__UINavigationController__navigationBarDidEndAnimation___block_invoke;
      v11[3] = &unk_1E52DA598;
      double v12 = v4;
      [v10 animateAlongsideTransition:0 completion:v11];
    }
    else
    {
      [(UINavigationBar *)v4 _reenableUserInteraction];
    }
  }
}

uint64_t __56__UINavigationController__navigationBarDidEndAnimation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reenableUserInteraction];
}

- (void)_rememberPresentingFocusedItem:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UINavigationController;
  id v4 = a3;
  [(UIViewController *)&v6 _rememberPresentingFocusedItem:v4];
  id v5 = [(UINavigationController *)self topViewController];
  [(UINavigationController *)self _rememberFocusedItem:v4 forViewController:v5];
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
  id v3 = self->_overridingDestinationItemForFocusUpdate;
  if (!v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)UINavigationController;
    id v3 = [(UIViewController *)&v9 _overridingPreferredFocusEnvironment];
    if (!v3)
    {
      id v4 = [(UIViewController *)self _existingView];
      id v5 = [v4 _window];

      if (!v5)
      {
        id v3 = 0;
        goto LABEL_11;
      }
      id v6 = [(UINavigationController *)self topViewController];
      id v7 = [(UINavigationController *)self _recallRememberedFocusedItemForViewController:v6];
      if (v7)
      {
        if ([(UINavigationController *)self _canRestoreFocusAfterTransitionToRecalledItem:v7 inViewController:v6])
        {
          id v3 = v7;
LABEL_10:

          goto LABEL_11;
        }
        [(UINavigationController *)self _forgetFocusedItemForViewController:v6];
      }
      id v3 = 0;
      goto LABEL_10;
    }
  }
LABEL_11:
  return v3;
}

- (id)_childViewControllersEligibleForOverridingPreferredFocusEnvironments
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(UINavigationController *)self topViewController];
  id v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (id)preferredFocusedView
{
  id v3 = [(UINavigationController *)self topViewController];
  id v4 = [v3 preferredFocusedView];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UINavigationController;
    id v6 = [(UIViewController *)&v9 preferredFocusedView];
  }
  id v7 = v6;

  return v7;
}

- (int64_t)_subclassPreferredFocusedViewPrioritizationType
{
  if (!qword_1EB25A858)
  {
    qword_1EB25A858 = +[UINavigationController instanceMethodForSelector:sel_preferredFocusedView];
    qword_1EB25A860 = +[UINavigationController instanceMethodForSelector:sel_preferredFocusEnvironments];
  }
  uint64_t v3 = [(UINavigationController *)self methodForSelector:sel_preferredFocusedView];
  uint64_t v4 = [(UINavigationController *)self methodForSelector:sel_preferredFocusEnvironments];
  if (v3) {
    BOOL v5 = v3 == qword_1EB25A858;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0;
  }
  if (v4) {
    BOOL v7 = v4 == qword_1EB25A860;
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
  uint64_t v4 = [(UINavigationController *)self topViewController];
  if (v4) {
    [v3 addObject:v4];
  }
  if (![(UINavigationController *)self isNavigationBarHidden])
  {
    BOOL v5 = [(UINavigationController *)self navigationBar];
    if (v5) {
      [v3 addObject:v5];
    }
  }
  id v6 = _UIFocusEnvironmentPreferredNodeToFocusedItem(self, v3);
  if (v6)
  {
    uint64_t v7 = [v3 firstObject];
    if ((void *)v7 == v6)
    {
    }
    else
    {
      id v8 = (void *)v7;
      int v9 = [v3 containsObject:v6];

      if (v9)
      {
        [v3 removeObject:v6];
        [v3 insertObject:v6 atIndex:0];
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)UINavigationController;
  long long v10 = [(UIViewController *)&v13 preferredFocusEnvironments];
  [v3 addObjectsFromArray:v10];

  double v11 = _UIFocusEnvironmentCombinedPreferredFocusEnvironments(self, v3, [(UINavigationController *)self _subclassPreferredFocusedViewPrioritizationType]);

  return v11;
}

- (BOOL)_shouldUpdateFocusInContext:(id)a3
{
  return !self->_scrollViewManager
      && [(UIViewController *)self shouldUpdateFocusInContext:a3];
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UINavigationController *)self topViewController];
  id v6 = [v5 view];
  uint64_t v7 = [v4 nextFocusedItem];
  BOOL IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(v6, v7);

  if (IsAncestorOfEnvironment) {
    [(UINavigationController *)self _forgetFocusedItemForViewController:v5];
  }
  v9.receiver = self;
  v9.super_class = (Class)UINavigationController;
  [(UIViewController *)&v9 _didUpdateFocusInContext:v4];
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
  id v8 = [(UINavigationController *)self _rememberedFocusedItemsByViewController];
  [v8 setObject:v7 forKey:v6];
}

- (void)_forgetFocusedItemForViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(UINavigationController *)self _rememberedFocusedItemsByViewController];
  [v5 removeObjectForKey:v4];
}

- (id)_recallRememberedFocusedItemForViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(UINavigationController *)self _rememberedFocusedItemsByViewController];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)_setIsWrappingDuringAdaptation:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)editing
{
  uint64_t v2 = [(UINavigationController *)self topViewController];
  char v3 = [v2 isEditing];

  return v3;
}

- (id)viewControllerForUnwindSegueAction:(SEL)a3 fromViewController:(id)a4 withSender:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  long long v10 = [(UIViewController *)self mutableChildViewControllers];
  double v11 = 0;
  uint64_t v12 = [v10 count] - 1;
  while (v12 != -1)
  {
    objc_super v13 = [v10 objectAtIndex:v12];

    --v12;
    double v11 = v13;
    if ([v13 _canPerformUnwindSegueAction:a3 fromViewController:v8 sender:v9])
    {
      id v14 = v13;
      double v11 = v14;
      goto LABEL_6;
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)UINavigationController;
  id v14 = [(UIViewController *)&v17 viewControllerForUnwindSegueAction:a3 fromViewController:v8 withSender:v9];
LABEL_6:
  double v15 = v14;

  return v15;
}

- (id)allowedChildViewControllersForUnwindingFromSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(UIViewController *)self childViewControllerContainingSegueSource:v4];

  id v7 = [(UINavigationController *)self viewControllers];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__UINavigationController_allowedChildViewControllersForUnwindingFromSource___block_invoke;
  _OWORD v13[3] = &unk_1E52E8DB8;
  id v14 = v6;
  id v8 = v5;
  id v15 = v8;
  id v9 = v6;
  [v7 enumerateObjectsWithOptions:2 usingBlock:v13];

  long long v10 = v15;
  id v11 = v8;

  return v11;
}

uint64_t __76__UINavigationController_allowedChildViewControllersForUnwindingFromSource___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32) != a2) {
    return [*(id *)(result + 40) addObject:a2];
  }
  return result;
}

- (void)unwindForSegue:(id)a3 towardsViewController:(id)a4
{
  id v8 = a4;
  id v5 = [(UINavigationController *)self viewControllers];
  int v6 = [v5 containsObject:v8];

  if (v6) {
    id v7 = [(UINavigationController *)self popToViewController:v8 animated:+[UIView areAnimationsEnabled]];
  }
}

- (id)segueForUnwindingToViewController:(id)a3 fromViewController:(id)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = [(UINavigationController *)self viewControllers];
  char v13 = [v12 containsObject:v9];

  if ((v13 & 1) == 0)
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"UINavigationController.m", 4675, @"toViewController (%@) is not one of my view controllers.", v9 object file lineNumber description];
  }
  id v14 = _UIFirstPopoverSeguePresentedControllerInUnwindingResponderChain(v11, self);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __90__UINavigationController_segueForUnwindingToViewController_fromViewController_identifier___block_invoke;
  v20[3] = &unk_1E52DCB30;
  v20[4] = self;
  id v21 = v9;
  id v22 = v14;
  id v15 = v14;
  id v16 = v9;
  objc_super v17 = +[UIStoryboardSegue segueWithIdentifier:v10 source:v11 destination:v16 performHandler:v20];

  return v17;
}

void __90__UINavigationController_segueForUnwindingToViewController_fromViewController_identifier___block_invoke(uint64_t a1)
{
  BOOL v2 = +[UIView areAnimationsEnabled];
  char v3 = [*(id *)(a1 + 32) presentedViewController];
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v4 _existingView];
    int v6 = [v5 window];

    if (v6) {
      BOOL v7 = v2;
    }
    else {
      BOOL v7 = 0;
    }
    id v8 = (id)[*(id *)(a1 + 32) popToViewController:*(void *)(a1 + 40) animated:v7];
    if (!v6)
    {
      id v9 = [*(id *)(a1 + 32) presentedViewController];
      id v10 = [v9 presentingViewController];
      [v10 dismissViewControllerAnimated:v2 completion:0];
    }
  }
  else
  {
    id v11 = (id)[v4 popToViewController:*(void *)(a1 + 40) animated:v2];
  }
  uint64_t v12 = *(void **)(a1 + 48);
  if (v12)
  {
    id v13 = [v12 _popoverController];
    [v13 dismissPopoverAnimated:v2];
  }
}

- (BOOL)_canPerformBackKeyCommandToPopViewController
{
  if ([(UIViewController *)self childViewControllersCount] >= 2
    && [(UINavigationController *)self _isNavigationBarVisible])
  {
    char v3 = [(UINavigationController *)self navigationBar];
    id v4 = [v3 topItem];
    int v5 = [v4 hidesBackButton] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)_canUseBackKeyCommandToTriggerSidebarKeyCommandWithSender:(id)a3
{
  id v4 = a3;
  int v5 = [(UIViewController *)self splitViewController];
  int v6 = v5;
  BOOL v7 = v5
    && [v5 displayMode] != 2
    && [v6 displayMode] != 4
    && [v6 canPerformAction:sel_toggleSidebar_ withSender:v4]
    && [(UINavigationController *)self _isNavigationBarVisible];

  return v7;
}

- (void)_performBackKeyCommand:(id)a3
{
  id v6 = a3;
  if ([(UINavigationController *)self _canPerformBackKeyCommandToPopViewController])
  {
    id v4 = [(UINavigationController *)self popViewControllerAnimated:1];
  }
  else if ([(UINavigationController *)self _canUseBackKeyCommandToTriggerSidebarKeyCommandWithSender:v6])
  {
    int v5 = [(UIViewController *)self splitViewController];
    [v5 toggleSidebar:v6];
  }
}

- (void)_userInterfaceIdiomChanged
{
  [(UINavigationController *)self _setupBackGestureRecognizer];
  [(UINavigationController *)self _setupVisualStyle];
}

- (void)_performBackGesture:(id)a3
{
  id v3 = [(UINavigationController *)self popViewControllerAnimated:1];
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  if (self->_backGestureRecognizer != a3) {
    return 1;
  }
  id v4 = [(UIViewController *)self mutableChildViewControllers];
  unint64_t v5 = [v4 count];

  if (v5 > 1) {
    return 1;
  }
  return [(UINavigationController *)self _isTransitioning];
}

- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = (_UIBarTapGestureRecognizer *)a3;
  id v7 = a4;
  BOOL v10 = 1;
  if (self->__barTapHideGesture == v6 || (_UIBarTapGestureRecognizer *)self->__barSwipeHideGesture == v6)
  {
    id v8 = [(UINavigationController *)self topViewController];
    char v9 = [v8 _isNestedNavigationController];

    if (v9) {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  id v8 = v7;
  if ((UITapGestureRecognizer *)self->__barSwipeHideGesture == v6
    && [v7 _isGestureType:9])
  {
    id v9 = v8;
    BOOL v10 = [(UIViewController *)self _existingView];
    id v11 = [v9 scrollView];

    uint64_t v12 = [v11 superview];
    [v11 frame];
    objc_msgSend(v12, "convertRect:toView:", v10);
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    id v21 = [(UINavigationController *)self _existingNavigationBar];
    id v22 = [v21 superview];
    [v21 frame];
    objc_msgSend(v22, "convertRect:toView:", v10);
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;

    v36.origin.double x = v14;
    v36.origin.CGFloat y = v16;
    v36.size.CGFloat width = v18;
    v36.size.height = v20;
    double MinY = CGRectGetMinY(v36);
    v37.origin.double x = v24;
    v37.origin.CGFloat y = v26;
    v37.size.CGFloat width = v28;
    v37.size.height = v30;
    double MaxY = CGRectGetMaxY(v37);
    UICeilToViewScale(v10);
    char v34 = MinY <= MaxY + v33;
  }
  else if (self->_backGestureRecognizer == v6)
  {
    char v34 = [v8 _isGestureType:8];
  }
  else
  {
    char v34 = 0;
  }

  return v34;
}

- (id)_deepestActionResponder
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __49__UINavigationController__deepestActionResponder__block_invoke;
  v4[3] = &unk_1E52E6838;
  v4[4] = self;
  BOOL v2 = [(UIViewController *)self _deepestPresentedActionResponderOrBlock:v4];
  return v2;
}

id __49__UINavigationController__deepestActionResponder__block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) topViewController];
  int v3 = [v2 _hasDeepestActionResponder];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) topViewController];
    unint64_t v5 = [v4 _deepestActionResponder];
  }
  else
  {
    v7.receiver = *(id *)(a1 + 32);
    v7.super_class = (Class)UINavigationController;
    unint64_t v5 = objc_msgSendSuper2(&v7, sel__deepestActionResponder);
  }
  return v5;
}

void __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  double v2 = *(double *)(a1 + 80);
  double v3 = *(double *)(a1 + 88);
  double v4 = *(double *)(a1 + 96);
  double v5 = *(double *)(a1 + 104);
  id v6 = [*(id *)(a1 + 40) view];
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);
}

uint64_t __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke_4(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) didMoveToParentViewController:0];
  }
  return result;
}

uint64_t __69__UINavigationController__didEndTransitionFromView_toView_wasCustom___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsFocusUpdate];
}

- (void)_didCancelTransitionFromViewController:(id)a3 toViewController:(id)a4 wrapperView:(id)a5 wasCustom:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t navigationControllerFlags = (unint64_t)self->_navigationControllerFlags;
  if (v10)
  {
    CGFloat v14 = [v10 parentViewController];
    BOOL v15 = v14 == self && (*(void *)&self->_navigationControllerFlags & 0x1000) == 0;
  }
  else
  {
    BOOL v15 = 1;
  }
  [(UINavigationController *)self setDisappearingViewController:0];
  CGFloat v16 = [(UIViewController *)self presentedViewController];
  double v58 = v12;
  if (v16) {
    goto LABEL_18;
  }
  if (![v10 _containedInAbsoluteResponderChain]) {
    goto LABEL_19;
  }
  CGFloat v16 = -[UIViewController _keyboardSceneDelegate](self);
  double v17 = +[UIInputViewAnimationStyle animationStyleImmediate];
  [v16 pushAnimationStyle:v17];

  CGFloat v18 = [MEMORY[0x1E4F29238] valueWithPointer:v10];
  char v19 = [v16 _restoreInputViewsWithId:v18 animated:1];

  if ((v19 & 1) == 0)
  {
    if ([v10 _containsFirstResponder])
    {
      if (![v11 _containsFirstResponder]) {
        goto LABEL_17;
      }
    }
    else
    {
      if ([v10 becomeFirstResponder]) {
        goto LABEL_17;
      }
      CGFloat v20 = [v16 responder];
      int v21 = [v11 _shouldAttemptToPreserveInputViewsForResponder:v20];

      if (!v21) {
        goto LABEL_17;
      }
      id v22 = [MEMORY[0x1E4F29238] valueWithPointer:v11];
      [v16 _preserveInputViewsWithId:v22 animated:1];
    }
    double v23 = [v16 responder];
    [v23 resignFirstResponder];
  }
LABEL_17:
  [v16 popAnimationStyle];
  id v12 = v58;
LABEL_18:

LABEL_19:
  if (v6)
  {
    CGFloat v24 = [v11 childModalViewController];

    double v25 = [v11 view];
    CGFloat v26 = v25;
    if (v24)
    {
      id v27 = [v25 superview];

      if (v27 == v12)
      {
        CGFloat v28 = [v11 view];
        [v28 removeFromSuperview];

        CGFloat v26 = v12;
      }
      else
      {
        [v27 removeFromSuperview];
        CGFloat v26 = v27;
      }
    }
    else
    {
      [v25 removeFromSuperview];
    }
  }
  [(UINavigationController *)self _presentationTransitionUnwrapViewController:v10];
  if ((*(void *)&self->_navigationControllerFlags & 0x200) != 0)
  {
    double v29 = -[UIViewController _keyboardSceneDelegate](self);
    [v29 popAnimationStyle];

    keyboardLayoutGuideTransitionAssertion = self->_keyboardLayoutGuideTransitionAssertion;
    if (keyboardLayoutGuideTransitionAssertion)
    {
      [(_UIInvalidatable *)keyboardLayoutGuideTransitionAssertion _invalidate];
      double v31 = self->_keyboardLayoutGuideTransitionAssertion;
      self->_keyboardLayoutGuideTransitionAssertion = 0;
    }
    CGFloat v32 = [(UINavigationController *)self _window];
    int v33 = [v32 isTrackingKeyboard];

    if (v33)
    {
      char v34 = [(UINavigationController *)self _window];
      [v34 moveKeyboardLayoutGuideOverEdge:0 layoutViews:0];
    }
    *(void *)&self->_navigationControllerFlags &= ~0x200uLL;
  }
  if (v15) {
    [(UINavigationController *)self removeChildViewController:v11 notifyDidMove:0];
  }
  else {
    [(UIViewController *)self _addChildViewController:v10 performHierarchyCheck:0 notifyWillMove:0];
  }
  -[UIViewController _invalidatePreferences:excluding:](self, -1, 0);
  [v11 cancelBeginAppearanceTransition];
  [v10 cancelBeginAppearanceTransition];
  double v35 = [(UINavigationController *)self _outermostNavigationController];
  CGRect v36 = [(UINavigationController *)self topViewController];
  [v35 _updateTopViewFramesForViewController:v36 isCancelledTransition:1 isOrientationChange:0];

  -[UINavigationController _clearLastOperation](self);
  *(void *)&self->_navigationControllerFlags &= ~4uLL;
  deferredTransitionContext = self->_deferredTransitionContext;
  self->_deferredTransitionContext = 0;

  if (dyld_program_sdk_at_least())
  {
    uint64_t v38 = (navigationControllerFlags >> 8) & 1;
    if (((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 <= 1)
    {
      if (dyld_program_sdk_at_least())
      {
        uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_delegate);
      }
      else
      {
        uint64_t WeakRetained = [(UINavigationController *)self delegate];
      }
      double v40 = (void *)WeakRetained;
      if (objc_opt_respondsToSelector())
      {
        if (([(id)UIApp _hasApplicationCalledLaunchDelegate] & 1) != 0
          || ([v11 _existingView],
              double v41 = objc_claimAutoreleasedReturnValue(),
              [v41 window],
              double v42 = objc_claimAutoreleasedReturnValue(),
              int v43 = [v42 _isHostedInAnotherProcess],
              v42,
              v41,
              v43))
        {
          [v40 navigationController:self willShowViewController:v10 animated:v38];
        }
      }
      if (objc_opt_respondsToSelector())
      {
        if (([(id)UIApp _hasApplicationCalledLaunchDelegate] & 1) != 0
          || ([v11 _existingView],
              double v44 = objc_claimAutoreleasedReturnValue(),
              [v44 window],
              double v45 = objc_claimAutoreleasedReturnValue(),
              int v46 = [v45 _isHostedInAnotherProcess],
              v45,
              v44,
              v46))
        {
          [v40 navigationController:self didShowViewController:v10 animated:v38];
        }
      }
    }
    [(UINavigationController *)self willShowViewController:v10 animated:v38];
    [(UINavigationController *)self didShowViewController:v10 animated:v38];
  }
  uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  double v48 = v47;
  if (v10) {
    [v47 setObject:v10 forKey:@"UINavigationControllerLastVisibleViewController"];
  }
  if (v11) {
    [v48 setObject:v11 forKey:@"UINavigationControllerNextVisibleViewController"];
  }
  uint64_t v49 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v49 postNotificationName:@"UINavigationControllerDidCancelShowingViewControllerNotification" object:self userInfo:v48];

  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UINavigationController", &_didCancelTransitionFromViewController_toViewController_wrapperView_wasCustom____s_category);
  CGFloat v51 = *(id *)(CategoryCachedImpl + 8);
  os_signpost_id_t v52 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self);
  if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v53 = v52;
    if (os_signpost_enabled(v51))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v51, OS_SIGNPOST_INTERVAL_END, v53, "NavigationTransition", " enableTelemetry=YES ", buf, 2u);
    }
  }

  uint64_t v54 = [(UINavigationController *)self _outermostNavigationController];
  [v54 _resetScrollViewObservingForViewController:v10];
  CGFloat v55 = [v11 _contentOrObservableScrollViewForEdge:1];
  BOOL v56 = [v11 _contentOrObservableScrollViewForEdge:4];
  [v54 _stopObservingContentScrollView:v55];
  if (v56 != v55) {
    [v54 _stopObservingContentScrollView:v56];
  }
  char v57 = [(UINavigationController *)self _navigationToolbarTransitionController];
  [v57 cancelTransition];

  [(UINavigationController *)self _updateEnclosingTabBarControllerForStackChange];
  [(UINavigationController *)self _updateBottomBarHiddenState];
}

- (void)_setCustomTransition:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_unint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)wasLastOperationAnimated
{
  return (*(void *)&self->_navigationControllerFlags >> 8) & 1;
}

- (void)_requestNavigationBarUpdateSearchBarForPlacementChangeIfApplicable
{
  if ([(UINavigationController *)self _isNavigationBarEffectivelyVisible])
  {
    navigationBar = self->_navigationBar;
    [(UINavigationBar *)navigationBar _updateSearchBarForPlacementChangeIfApplicable];
  }
}

- (BOOL)_shouldNavigationBarInsetViewController:(id)a3
{
  return [(UINavigationController *)self _shouldNavigationBarInsetViewController:a3 orOverlayContent:0];
}

- (BOOL)_shouldChildViewControllerUseFullScreenLayout:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UINavigationController;
  if ([(UIViewController *)&v7 _shouldChildViewControllerUseFullScreenLayout:v4])
  {
    BOOL v5 = ![(UINavigationController *)self _shouldNavigationBarInsetViewController:v4];
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (UIEdgeInsets)_avoidanceInsets
{
  v17.receiver = self;
  v17.super_class = (Class)UINavigationController;
  [(UIViewController *)&v17 _avoidanceInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(UINavigationController *)self existingPaletteForEdge:2];
  id v12 = v11;
  if (v11)
  {
    [v11 frame];
    double v4 = v4 + CGRectGetHeight(v18);
  }

  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.double right = v16;
  result.double bottom = v15;
  result.double left = v14;
  result.double top = v13;
  return result;
}

- (UIEdgeInsets)_edgeInsetsDeferringToCommandeeringTableHeaderViewStyleSearchControllerWithPresentingViewController:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = [v3 presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v4 == 0;
  }
  int v9 = !v8;
  if (has_internal_diagnostics)
  {
    if (v9)
    {
      CGRect v18 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        int v24 = 138412290;
        id v25 = v3;
        _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "Paying the price for an isKindOfClass check for pre-iOS 11.0 search controller behavior that failed. Presenting view controller: %@", (uint8_t *)&v24, 0xCu);
      }

      goto LABEL_18;
    }
  }
  else if (v9)
  {
    double v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_edgeInsetsDeferringToCommandeeringTableHeaderViewStyleSearchControllerWithPresentingViewController____s_category)+ 8);
    double v17 = 0.0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v24 = 138412290;
      id v25 = v3;
      _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Paying the price for an isKindOfClass check for pre-iOS 11.0 search controller behavior that failed. Presenting view controller: %@", (uint8_t *)&v24, 0xCu);
    }
    goto LABEL_19;
  }
  if (!v6)
  {
LABEL_18:
    double v17 = 0.0;
LABEL_19:
    double v15 = 0.0;
    double v13 = 0.0;
    double v11 = 0.0;
    goto LABEL_20;
  }
  LOBYTE(v24) = 0;
  [v6 _edgeInsetsForChildViewController:v3 insetsAreAbsolute:&v24];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
LABEL_20:

  double v19 = v11;
  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  result.double right = v22;
  result.double bottom = v21;
  result.double left = v20;
  result.double top = v19;
  return result;
}

- (BOOL)_navigationBar:(id)a3 getContentOffsetOfObservedScrollViewIfApplicable:(CGPoint *)a4
{
  id v6 = [(UINavigationController *)self _nestedTopViewController];
  double v7 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v6, 1, 0);

  if (v7 && _isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets(self, v7))
  {
    if (a4)
    {
      [v7 contentOffset];
      a4->double x = v8;
      a4->CGFloat y = v9;
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __83__UINavigationController__computeAndApplyScrollContentInsetDeltaForViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setNavigationControllerContentInsetAdjustment:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)_isTransitioningSearchController
{
  double v2 = [(UINavigationController *)self topViewController];
  id v3 = v2;
  if (v2)
  {
    double v4 = [v2 navigationItem];
    double v5 = [v4 _searchControllerIfAllowed];

    if ([v5 isActive])
    {
      id v6 = [v5 transitionCoordinator];
      BOOL v7 = v6 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_scrollToRevealNavigationBarPart:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v18 = [(UINavigationController *)self _outermostNavigationController];
  BOOL v7 = [(UINavigationController *)self topViewController];
  CGFloat v8 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(v18, v7, 1, 0);

  if (v8)
  {
    CGFloat v9 = [v18 navigationBar];
    BOOL v10 = [v9 topItem];
    double v11 = [v10 _stackEntry];
    double v12 = [v11 activeLayout];

    if (v12)
    {
      double v13 = -[_UINavigationBarLayout layoutHeightRevealingPart:](v12, a3);
      if (v13 > 0.0)
      {
        double v14 = v13;
        [v9 frame];
        double v16 = -(v14 + v15);
        [v8 contentOffset];
        if (v17 > v16) {
          objc_msgSend(v8, "setContentOffset:animated:", v4);
        }
      }
    }
  }
}

uint64_t __114__UINavigationController__updateTopViewFramesToMatchScrollOffsetInViewController_contentScrollView_topLayoutType___block_invoke_3(uint64_t a1, double a2)
{
  CGFloat v3 = *(double *)(a1 + 40);
  v24.origin.CGFloat y = *(CGFloat *)(a1 + 48);
  v24.size.CGFloat width = *(CGFloat *)(a1 + 56);
  CGFloat v4 = *(double *)(a1 + 64);
  CGFloat width = v24.size.width;
  CGFloat y = v24.origin.y;
  CGFloat v5 = *(double *)(a1 + 72);
  CGFloat v6 = *(double *)(a1 + 80);
  CGFloat v7 = *(double *)(a1 + 96);
  CGFloat v20 = *(double *)(a1 + 88);
  v24.origin.double x = v3;
  v24.size.height = v4;
  double MinX = CGRectGetMinX(v24);
  v25.origin.double x = v5;
  v25.origin.CGFloat y = v6;
  v25.size.CGFloat width = v20;
  v25.size.height = v7;
  double v19 = (1.0 - a2) * MinX + CGRectGetMinX(v25) * a2;
  v26.origin.double x = v3;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.height = v4;
  double MinY = CGRectGetMinY(v26);
  CGFloat v15 = v5;
  v27.origin.double x = v5;
  v27.origin.CGFloat y = v6;
  v27.size.CGFloat width = v20;
  v27.size.height = v7;
  double v18 = (1.0 - a2) * MinY + CGRectGetMinY(v27) * a2;
  v28.origin.double x = v3;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.height = v4;
  double v9 = CGRectGetWidth(v28);
  v29.origin.double x = v5;
  v29.origin.CGFloat y = v6;
  v29.size.CGFloat width = v20;
  v29.size.height = v7;
  double v10 = (1.0 - a2) * v9 + CGRectGetWidth(v29) * a2;
  v30.origin.double x = v3;
  v30.size.CGFloat width = width;
  v30.origin.CGFloat y = y;
  v30.size.height = v4;
  double Height = CGRectGetHeight(v30);
  v31.origin.double x = v15;
  v31.origin.CGFloat y = v6;
  v31.size.CGFloat width = v20;
  v31.size.height = v7;
  double v12 = CGRectGetHeight(v31);
  double v13 = *(void **)(*(void *)(a1 + 32) + 1088);
  return objc_msgSend(v13, "setFrame:", v19, v18, v10, (1.0 - a2) * Height + v12 * a2);
}

- (double)_topBarHeight
{
  double v3 = 0.0;
  if ([(UINavigationController *)self _isNavigationBarVisible])
  {
    CGFloat v4 = [(UINavigationController *)self navigationBar];
    [v4 bounds];
    double v3 = v5;
  }
  [(UINavigationController *)self _statusBarHeightForCurrentInterfaceOrientation];
  double v7 = v3 + v6;
  topPalette = self->_topPalette;
  if (topPalette
    && [(_UINavigationControllerPalette *)topPalette isAttached]
    && ([(UINavigationController *)self _isNavigationBarVisible]
     || [(_UINavigationControllerPalette *)self->_topPalette isVisibleWhenPinningBarIsHidden]))
  {
    [(UIView *)self->_topPalette bounds];
    return v7 + v9;
  }
  return v7;
}

- (id)_scrollDetentOffsetsForScrollView:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = self;
  p_isa = (id *)&v5->super.super.super.isa;
  if (v5->__positionBarsExclusivelyWithSafeArea
    && ([(UIViewController *)v5 _existingView],
        double v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 _usesMinimumSafeAreas],
        v7,
        v8))
  {
    double v9 = [p_isa _existingView];
    [v9 _minimumSafeAreaInsets];
    double v11 = v10;
  }
  else
  {
    [p_isa _contentOverlayInsets];
    double v11 = v12;
  }

  double v13 = [MEMORY[0x1E4F1CA48] array];
  [v4 _allowedNavigationOverlapAmount];
  double v15 = v14;
  double v16 = v14 - v11;
  if ([p_isa _isNavigationBarVisible])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    double v17 = objc_msgSend(p_isa[123], "_restingHeights", 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v18)
    {
      uint64_t v20 = v18;
      uint64_t v21 = *(void *)v33;
      char v22 = 1;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v17);
          }
          CGRect v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if ((v22 & 1) == 0
            || (int v25 = [v4 _canScrollWithoutBouncingIncludingRevealableContentPaddingTopY],
                double v19 = -1073741820.0,
                v25))
          {
            objc_msgSend(v24, "floatValue", v19);
            double v19 = v26;
          }
          CGRect v27 = [NSNumber numberWithDouble:v16 - v19];
          [v13 addObject:v27];

          char v22 = 0;
        }
        uint64_t v20 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
        char v22 = 0;
      }
      while (v20);
    }

    CGRect v28 = [v13 lastObject];
    [v28 floatValue];
    double v16 = v16 - v29;
  }
  if (v15 > 0.0)
  {
    CGRect v30 = [NSNumber numberWithDouble:v16 - v15];
    [v13 addObject:v30];
  }
  return v13;
}

- (double)_scrollOffsetRetargettedToDetentOffsetIfNecessary:(double)a3 unclampedOriginalTargetOffset:(double)a4 scrollView:(id)a5
{
  id v7 = a5;
  int v8 = [(UINavigationController *)self _scrollDetentOffsetsForScrollView:v7];
  double v9 = [v8 firstObject];
  [v9 floatValue];
  if (v10 <= a3) {
    goto LABEL_16;
  }
  double v11 = [v8 lastObject];
  [v11 floatValue];
  if (v12 >= a3)
  {

    goto LABEL_16;
  }
  unint64_t v13 = [v8 count];

  if (v13 < 2) {
    goto LABEL_17;
  }
  [v7 _allowedNavigationOverlapAmount];
  double v15 = v14;
  if ((unint64_t)[v8 count] < 2)
  {
LABEL_14:
    double v9 = [v8 lastObject];
    [v9 floatValue];
    a3 = v27;
LABEL_16:

    goto LABEL_17;
  }
  double v16 = -a3;
  uint64_t v17 = 1;
  while (1)
  {
    uint64_t v18 = [v8 objectAtIndexedSubscript:v17 - 1];
    [v18 floatValue];
    float v20 = v19;

    uint64_t v21 = [v8 objectAtIndexedSubscript:v17];
    [v21 floatValue];
    float v23 = v22;

    if (v15 != 0.0 && v17 == [v8 count] - 1) {
      break;
    }
    double v24 = (float)-v20;
    double v25 = (float)-v23;
    if (v24 <= v16 && v16 <= v25)
    {
      if ((v24 + v25) * 0.5 <= v16) {
        double v24 = (float)-v23;
      }
      a3 = -v24;
      break;
    }
    if (++v17 >= (unint64_t)[v8 count]) {
      goto LABEL_14;
    }
  }
LABEL_17:

  return a3;
}

- (void)_observeScrollView:(id)a3 willEndDraggingWithVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 unclampedOriginalTarget:(CGPoint)a6
{
  double y = a6.y;
  id v9 = a3;
  if (a5)
  {
    id v14 = v9;
    int isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets = _isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets(self, v9);
    id v9 = v14;
    if (isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets)
    {
      double v11 = [(UINavigationController *)self topViewController];
      int v12 = _insetsOfTopViewControllerScrollViewAutomaticallyAdjustedForLargeTitleView(v11);

      id v9 = v14;
      if (v12)
      {
        [(UINavigationController *)self _scrollOffsetRetargettedToDetentOffsetIfNecessary:v14 unclampedOriginalTargetOffset:a5->y scrollView:y];
        id v9 = v14;
        a5->double y = v13;
      }
    }
  }
}

- (UIEdgeInsets)_collapsableContentPaddingForObservedScrollView:(id)a3
{
  id v4 = a3;
  double v5 = [(UINavigationController *)self topViewController];
  int v6 = _insetsOfTopViewControllerScrollViewAutomaticallyAdjustedForLargeTitleView(v5);

  double v7 = 0.0;
  if (v6 && _isHeightOfTopViewsCoordinatedToMatchContentScrollViewOffsets(self, v4))
  {
    [(UINavigationController *)self _heightRangeOfTopViews];
    double v9 = v8;
    float v10 = [(UINavigationController *)self navigationBar];
    [v10 bounds];
    double v12 = v11;
    [(UIView *)self->_topPalette bounds];
    double v14 = v12 + v13 - v9;

    double v7 = fmax(v14, 0.0);
  }

  double v15 = 0.0;
  double v16 = 0.0;
  double v17 = 0.0;
  double v18 = v7;
  result.double right = v17;
  result.double bottom = v16;
  result.double left = v15;
  result.double top = v18;
  return result;
}

- (double)_navigationBar:(id)a3 preferredHeightForTransitionToHeightRange:(id)a4
{
  double var2 = a4.var2;
  double var0 = a4.var0;
  double v7 = [(UINavigationController *)self topViewController];
  double v8 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v7, 1, 0);

  if (v8)
  {
    [v8 contentOffset];
    double v10 = v9;
    [v8 adjustedContentInset];
    if (v10 + v11 > 0.0) {
      double var2 = var0;
    }
  }

  return var2;
}

- (void)_navigationBar:(id)a3 itemEnabledAutoScrollTransition:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (_isNestedNavigationControllerFullyInstalledIntoContainingNavigationController(self))
  {
    double v7 = [(UINavigationController *)self _outermostNavigationController];
    [v7 _navigationBar:v11 itemEnabledAutoScrollTransition:v6];
  }
  else
  {
    id v8 = [(UINavigationBar *)self->_navigationBar topItem];

    if (v8 != v6) {
      goto LABEL_12;
    }
    double v7 = [(UINavigationController *)self topViewController];
    _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v7, 1, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v7, 4, 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v9) {
      uint64_t v10 = 5;
    }
    else {
      uint64_t v10 = 1;
    }
    [(UINavigationController *)self _updateAndObserveScrollView:v6 viewController:v7 forEdges:v10];
    if (v9 && v6 != v9) {
      [(UINavigationController *)self _updateAndObserveScrollView:v9 viewController:v7 forEdges:4];
    }
  }
LABEL_12:
}

- (BOOL)_tryRequestPopToItem:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(UINavigationController *)self viewControllers];
  unint64_t v6 = [v5 count];
  if (v6 < 2) {
    goto LABEL_21;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v8) {
    goto LABEL_20;
  }
  uint64_t v9 = v8;
  float v20 = self;
  uint64_t v21 = v5;
  uint64_t v10 = *(void *)v23;
LABEL_4:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v23 != v10) {
      objc_enumerationMutation(v7);
    }
    double v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    id v13 = v12;
    if ([v13 _tryRequestPopToItem:v4])
    {

LABEL_16:
      double v5 = v21;
      goto LABEL_20;
    }
    double v14 = [v13 topViewController];
    id v15 = [v14 navigationItem];

    if (v15 == v4) {
      goto LABEL_18;
    }

LABEL_12:
    if (v9 == ++v11)
    {
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  id v16 = [v12 navigationItem];

  if (v16 != v4) {
    goto LABEL_12;
  }
  id v17 = v12;
LABEL_18:

  double v5 = v21;
  if (v12)
  {
    id v18 = [(UINavigationController *)v20 popToViewController:v12 animated:1];
    id v7 = v12;
LABEL_20:
  }
LABEL_21:

  return v6 > 1;
}

- (void)_navigationBar:(id)a3 requestPopToItem:(id)a4
{
}

- (BOOL)_navigationBarTopItemIsNestedNavigationController:(id)a3
{
  double v3 = [(UINavigationController *)self topViewController];
  char v4 = [v3 _isNestedNavigationController];

  return v4;
}

- (void)_observeScrollViewWillBeginDragging:(id)a3
{
  id v6 = a3;
  [(UINavigationController *)self _immediatelyFinishNavigationBarTransition];
  if ((*(void *)&self->_navigationControllerFlags & 0x200000000000000) != 0)
  {
    char v4 = [(UINavigationController *)self topViewController];
    _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, 1, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v6) {
      [(UINavigationController *)self _setInteractiveScrollActive:1];
    }
  }
}

- (void)_observeScrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(UINavigationController *)self topViewController];
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v7, 1, 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6 && !a4)
  {
    [(UINavigationController *)self _setInteractiveScrollActive:0];
  }
}

- (void)_observeScrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = [(UINavigationController *)self topViewController];
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v5, 1, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    [(UINavigationController *)self _setInteractiveScrollActive:0];
  }
}

- (void)_setSuspendToolbarBackgroundUpdating:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_unint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)_suspendToolbarBackgroundUpdating
{
  return (*(void *)&self->_navigationControllerFlags >> 61) & 1;
}

uint64_t __112__UINavigationController__updateBackgroundTransitionProgressForScrollView_toolbar_isNavigationTransitionUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setBackgroundTransitionProgress:*(double *)(a1 + 40)];
}

- (void)_observeScrollView:(id)a3 didBeginTransitionToDeferredContentOffset:(CGPoint)a4
{
  if ([(UINavigationController *)self _isPushingOrPoppingUsingLayoutToLayoutNavigationTransition])
  {
    [(UINavigationController *)self _performCoordinatedUpdateTopFramesTransitionAnimation];
  }
}

- (void)_observeScrollViewHasClearedContentOffsetAnimation:(id)a3
{
  p_searchControllerToNotifyWhenScrollingAnimationStops = &self->_searchControllerToNotifyWhenScrollingAnimationStops;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchControllerToNotifyWhenScrollingAnimationStops);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_searchControllerToNotifyWhenScrollingAnimationStops);
    [v5 _contentScrollViewDidFinishContentOffsetAnimation];

    objc_storeWeak((id *)p_searchControllerToNotifyWhenScrollingAnimationStops, 0);
  }
}

- (BOOL)_navigationItemShouldDeferSearchPresentationOrDismissalForScrollViewAnimation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _searchControllerIfAllowed];
  if (v5)
  {
    id v6 = [(UINavigationController *)self _nestedTopViewController];
    id v7 = [v6 navigationItem];

    if (v7 == v4)
    {
      uint64_t v9 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v6, 1, 0);
      uint64_t v10 = v9;
      if (v9 && [v9 isScrollAnimating])
      {
        objc_storeWeak((id *)&self->_searchControllerToNotifyWhenScrollingAnimationStops, v5);
        BOOL v8 = 1;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_immediatelyFinishNavigationBarTransition
{
  uint64_t v3 = [(UINavigationController *)self _outermostNavigationController];
  id v4 = v3;
  if (v3 == self)
  {
    id v5 = [(UINavigationController *)self navigationBar];
    id v6 = [v5 _immediatelyFinishRunningTransition];

    id v7 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionCoordinator];

    if (v7)
    {
      BOOL v8 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionCoordinator];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __67__UINavigationController__immediatelyFinishNavigationBarTransition__block_invoke;
      v9[3] = &unk_1E52DA110;
      uint64_t v10 = v6;
      [v8 animateAlongsideTransition:0 completion:v9];
    }
    else
    {
      v6[2](v6);
    }
  }
  else
  {
    [(UINavigationController *)v3 _immediatelyFinishNavigationBarTransition];
  }
}

uint64_t __67__UINavigationController__immediatelyFinishNavigationBarTransition__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_reloadCachedInteractiveScrollMeasurements
{
  if (self->_interactiveScrollActive)
  {
    self->_interactiveScrollActive = 0;
    p_interactiveScrollNavBarIntrinsicHeightRange = &self->_interactiveScrollNavBarIntrinsicHeightRange;
    id v4 = [(UINavigationController *)self _nestedTopViewController];
    id v5 = [v4 navigationItem];
    [(UINavigationController *)self _intrinsicNavigationBarHeightRangeForNavItem:v5];
    p_interactiveScrollNavBarIntrinsicHeightRange->double minimum = v6;
    p_interactiveScrollNavBarIntrinsicHeightRange->double preferred = v7;
    p_interactiveScrollNavBarIntrinsicHeightRange->double maximum = v8;

    self->_interactiveScrollActive = 1;
  }
}

- (void)_scrollViewManagerDidFinishScrolling:(id)a3
{
  scrollViewManager = self->_scrollViewManager;
  self->_scrollViewManager = 0;
  id v5 = a3;

  id v36 = [v5 scrollView];

  double v6 = [(UIViewController *)self view];
  double v7 = [v6 _focusSystem];

  if (v7)
  {
    double v8 = [_UIFocusRegionContainerProxy alloc];
    uint64_t v9 = [(UIViewController *)self view];
    uint64_t v10 = [(UIViewController *)self view];
    uint64_t v11 = [(_UIFocusRegionContainerProxy *)v8 initWithOwningEnvironment:v9 itemContainer:v10];

    double v12 = [_UIFocusMap alloc];
    id v13 = [(UIViewController *)self view];
    double v14 = [v13 _focusSystem];
    id v15 = [(UIViewController *)self view];
    id v16 = [v15 coordinateSpace];
    id v17 = [(_UIFocusMap *)v12 initWithFocusSystem:v14 rootContainer:v11 coordinateSpace:v16 searchInfo:0 ignoresRootContainerClippingRect:1];

    id v18 = [(UIViewController *)self view];
    LODWORD(v14) = [v18 _shouldReverseLayoutDirection];

    float v19 = [(UIViewController *)self view];
    [v19 bounds];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    double v28 = v21;
    double v29 = v23;
    double v30 = v25;
    double v31 = v27;
    if (v14)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v28);
      double v33 = 1.0;
    }
    else
    {
      double MaxX = CGRectGetMinX(*(CGRect *)&v28);
      double v33 = 0.0;
    }
    v38.origin.double x = v21;
    v38.origin.double y = v23;
    v38.size.CGFloat width = v25;
    v38.size.height = v27;
    long long v34 = -[_UIFocusMap _closestFocusableItemToPoint:inRect:excludingItems:distanceMeasuringUnitPoint:](v17, "_closestFocusableItemToPoint:inRect:excludingItems:distanceMeasuringUnitPoint:", 0, MaxX, CGRectGetMinY(v38), v21, v23, v25, v27, 0.0, v33);
    if (v34) {
      objc_storeStrong((id *)&self->_overridingDestinationItemForFocusUpdate, v34);
    }
  }
  [(UIViewController *)self setNeedsFocusUpdate];
  [(UIViewController *)self updateFocusIfNeeded];
  overridingDestinationItemForFocusUpdate = self->_overridingDestinationItemForFocusUpdate;
  self->_overridingDestinationItemForFocusUpdate = 0;
}

void __98__UINavigationController__shouldSkipHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performSkippedHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary];
}

- (void)_performSkippedHostedRefreshControlUpdateSchedulingDeferredUpdateIfNecessary
{
  uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  if ((navigationControllerFlags & 0x80000000000000) != 0)
  {
    char v4 = *((unsigned char *)&self->_navigationControllerFlags + 8);
    *(void *)&self->_uint64_t navigationControllerFlags = navigationControllerFlags & 0xFF7FFFFFFFFFFFFFLL;
    *((unsigned char *)&self->_navigationControllerFlags + 8) = v4;
    id v5 = [(UINavigationController *)self _topViewControllerObservableScrollViewForEdge:1];
    [(UINavigationController *)self _updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:v5];
  }
}

- (void)_updateScrollViewFromViewController:(id)a3 toViewController:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  [(UINavigationController *)self _ensureToViewControllersViewIsLoaded:v6];
  double v7 = [v29 _contentOrObservableScrollViewForEdge:1];
  double v8 = v7;
  if (v7)
  {
    containerView = self->_containerView;
    [v7 center];
    double v11 = v10;
    double v13 = v12;
    double v14 = [v8 superview];
    -[UIView convertPoint:fromView:](containerView, "convertPoint:fromView:", v14, v11, v13);
    double v16 = v15;
  }
  else
  {
    double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  id v17 = [v6 _contentOrObservableScrollViewForEdge:1];
  if (v17 == v8
    || dyld_program_sdk_at_least()
    && ([v6 view],
        id v18 = objc_claimAutoreleasedReturnValue(),
        [v18 window],
        float v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        v19))
  {
    *(void *)&self->_navigationControllerFlags |= 0x1000000000uLL;
  }
  [(UINavigationController *)self _layoutViewController:v6];
  *(void *)&self->_navigationControllerFlags &= ~0x1000000000uLL;
  if (v8)
  {
    double v20 = self->_containerView;
    [v8 center];
    double v22 = v21;
    double v24 = v23;
    double v25 = [v8 superview];
    -[UIView convertPoint:fromView:](v20, "convertPoint:fromView:", v25, v22, v24);
    double v27 = v26;

    [v29 _setNavigationControllerContentOffsetAdjustment:v27 - v16 + v27 - v16];
  }
  double v28 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v6, 1, 0);
  [(UINavigationController *)self _updateNavigationBarHostedRefreshControlToHostRefreshControlForScrollView:v28];
}

- (void)_startDeferredTransitionIfNeeded
{
}

- (int)_deferredTransition
{
  return [(_UIViewControllerTransitionConductor *)self->_transitionConductor deferredTransitionType];
}

- (UIViewControllerAnimatedTransitioning)_transitionController
{
  return [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionController];
}

- (void)_setTransitionController:(id)a3
{
}

- (UIViewControllerAnimatedTransitioning)_cachedTransitionController
{
  return [(_UINavigationControllerVisualStyle *)self->_visualStyle transitionController];
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"__cachedTransitionController"])
  {
    UIKVCAccessProhibited((uint64_t)v4, @"UINavigationController");

    id v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UINavigationController;
    id v5 = [(UINavigationController *)&v7 valueForUndefinedKey:v4];
  }
  return v5;
}

- (UIViewControllerInteractiveTransitioning)_interactionController
{
  return [(_UIViewControllerTransitionConductor *)self->_transitionConductor interactiveTransitionController];
}

- (void)_setInteractionController:(id)a3
{
}

- (UIViewControllerInteractiveTransitioning)_cachedInteractionController
{
  return [(_UINavigationControllerVisualStyle *)self->_visualStyle interactionController];
}

- (void)_setCachedTransitionController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(_UINavigationControllerVisualStyle *)self->_visualStyle setTransitionController:v4];
  }
}

- (void)_setCachedInteractionController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(_UINavigationControllerVisualStyle *)self->_visualStyle setInteractionController:v4];
  }
}

- (id)_builtinTransitionController
{
  return [(_UINavigationControllerVisualStyle *)self->_visualStyle transitionController];
}

- (id)_builtinInteractionController
{
  return [(_UINavigationControllerVisualStyle *)self->_visualStyle interactionController];
}

- (id)_createBuiltInTransitionControllerForOperation:(int64_t)a3
{
  [(_UINavigationControllerVisualStyle *)self->_visualStyle updateTransitionControllerWithOperation:a3];
  visualStyle = self->_visualStyle;
  return [(_UINavigationControllerVisualStyle *)visualStyle transitionController];
}

- (id)_createBuiltInInteractionControllerForAnimationController:(id)a3
{
  return 0;
}

- (id)_customTransitionController:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionController];

  if (v5)
  {
    id v6 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionController];
    goto LABEL_55;
  }
  objc_super v7 = [(UINavigationController *)self disappearingViewController];
  double v8 = [(UINavigationController *)self topViewController];
  uint64_t v9 = [v7 view];
  uint64_t v60 = [v9 superview];

  int64_t v10 = [(UINavigationController *)self lastOperation];
  [(UINavigationController *)self _setUsingBuiltinAnimator:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v10 == 1) {
    double v11 = v8;
  }
  else {
    double v11 = v7;
  }
  id v12 = v11;
  if ([(UINavigationController *)self _wantsTabCrossFadeTransition]
    && ([(UIViewController *)self traitCollection],
        double v13 = objc_claimAutoreleasedReturnValue(),
        BOOL v14 = +[_UITabCrossFadeTransition isSupportedForTraits:v13], v13, v14))
  {
    double v15 = [_UITabCrossFadeTransition alloc];
    double v16 = [(UIViewController *)self view];
    id v17 = [v16 backgroundColor];
    id v6 = [(_UITabCrossFadeTransition *)v15 initWithBackgroundColor:v17];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v18 = [v12 preferredTransition];
  float v19 = (void *)v18;
  if (v6 || !v18)
  {
    if (v6) {
      goto LABEL_21;
    }
    if (![(UINavigationController *)self _shouldIgnoreDelegateTransitionController])
    {
      uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
      if ((navigationControllerFlags & 0x200000) != 0)
      {
        uint64_t v22 = [WeakRetained navigationController:self animationControllerForOperation:v10 fromViewController:v7 toViewController:v8];
      }
      else
      {
        if ((navigationControllerFlags & 0x400000) == 0) {
          goto LABEL_17;
        }
        uint64_t v22 = [WeakRetained navigationController:self animatorForOperation:v10 fromViewController:v7 toViewController:v8];
      }
      id v6 = (_UINavigationCrossfadeAnimator *)v22;
      goto LABEL_21;
    }
LABEL_17:
    id v6 = 0;
    goto LABEL_21;
  }
  double v20 = [(UIViewController *)self traitCollection];
  [v19 _transitionControllerForViewController:v12 traits:v20 isAppearing:v10 == 1];
  id v6 = (_UINavigationCrossfadeAnimator *)objc_claimAutoreleasedReturnValue();

LABEL_21:
  if (![(UINavigationController *)self isInteractiveTransition])
  {
    int v23 = _AXSReduceMotionReduceSlideTransitionsEnabled();
    if (!v6)
    {
      if (v23) {
        id v6 = objc_alloc_init(_UINavigationCrossfadeAnimator);
      }
    }
  }
  if (v6) {
    goto LABEL_46;
  }
  if ((*(void *)&self->_navigationControllerFlags & 0x40000000) != 0) {
    uint64_t v24 = [WeakRetained _navigationControllerLayoutTransitioningClass:self];
  }
  else {
    uint64_t v24 = 0;
  }
  if (v10 == 1)
  {
    if ([v8 _usesSharedView])
    {
      uint64_t v25 = [v8 _uiCollectionView];
      if (v25)
      {
        double v26 = (void *)v25;
        double v27 = [v8 _uiCollectionView];
        [v7 _uiCollectionView];
        double v28 = v58 = (void *)v24;

        if (v27 == v28)
        {
          if (v58)
          {
            id v6 = [v58 transitionForOperation:1 fromViewController:v7 toViewController:v8];
            if (v6) {
              goto LABEL_46;
            }
          }
          id v29 = v8;
          uint64_t v30 = 1;
LABEL_43:
          id v6 = [v29 _animatorForOperation:v30 fromViewController:v7 toViewController:v8];
          if (v6) {
            goto LABEL_46;
          }
        }
      }
    }
  }
  else if (v10 == 2)
  {
    if ([v7 _usesSharedView])
    {
      uint64_t v31 = [v8 _uiCollectionView];
      if (v31)
      {
        long long v32 = (void *)v31;
        double v33 = [v8 _uiCollectionView];
        [v7 _uiCollectionView];
        long long v34 = v59 = (void *)v24;

        if (v33 == v34)
        {
          if (v59)
          {
            id v6 = [v59 transitionForOperation:2 fromViewController:v7 toViewController:v8];
            if (v6) {
              goto LABEL_46;
            }
          }
          id v29 = v7;
          uint64_t v30 = 2;
          goto LABEL_43;
        }
      }
    }
  }
  id v6 = [(UINavigationController *)self _createBuiltInTransitionControllerForOperation:*(void *)&self->_navigationControllerFlags >> 4];
  [(UINavigationController *)self _setCachedTransitionController:v6];
  if (!v6)
  {
    [(UINavigationController *)self _setUsingBuiltinAnimator:1];
    goto LABEL_47;
  }
  *(void *)&self->_navigationControllerFlags |= 0x20000uLL;
  [(UINavigationController *)self _setUsingBuiltinAnimator:1];
LABEL_46:
  long long v35 = +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:v6];

  if (!v35)
  {
    uint64_t v37 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
    CGRect v38 = [v7 view];
    [v38 frame];
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;

    [(_UIViewControllerTransitionContext *)v37 _setIsAnimated:v3];
    [(_UIViewControllerOneToOneTransitionContext *)v37 _setFromViewController:v7];
    [(_UIViewControllerOneToOneTransitionContext *)v37 _setToViewController:v8];
    id v36 = (void *)v60;
    [(_UIViewControllerTransitionContext *)v37 _setContainerView:v60];
    -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](v37, "_setFromStartFrame:", v40, v42, v44, v46);
    -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v37, "_setToEndFrame:", v40, v42, v44, v46);
    double v47 = *MEMORY[0x1E4F1DB28];
    double v48 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v49 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v50 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v37, "_setToStartFrame:", *MEMORY[0x1E4F1DB28], v48, v49, v50);
    -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](v37, "_setFromEndFrame:", v47, v48, v49, v50);
    [(_UIViewControllerTransitionContext *)v37 _setAnimator:v6];
    if ([(UINavigationController *)self _isUsingBuiltinAnimator]) {
      [(_UIViewControllerTransitionContext *)v37 _setCompletionCurve:7];
    }
    uint64_t v51 = [v8 childModalViewController];
    if (v51)
    {
      os_signpost_id_t v52 = (void *)v51;
      os_signpost_id_t v53 = [v8 view];
      uint64_t v54 = [v53 superview];

      if (v54)
      {
        CGFloat v55 = [v8 view];
        BOOL v56 = [v55 superview];
        [(_UIViewControllerOneToOneTransitionContext *)v37 _setToView:v56];
      }
    }

    goto LABEL_54;
  }
LABEL_47:
  id v36 = (void *)v60;
LABEL_54:

LABEL_55:
  return v6;
}

- (id)_showcaseView
{
  double v2 = [(UINavigationController *)self topViewController];
  BOOL v3 = [v2 _showcaseView];

  return v3;
}

- (BOOL)_shouldUseBuiltinInteractionController
{
  BOOL v3 = [(UINavigationController *)self topViewController];
  id v4 = [v3 preferredTransition];
  id v5 = [(UIViewController *)self traitCollection];
  char v6 = [v4 _hasOwnInteractiveExitGestureForTraits:v5];

  if ((v6 & 1) != 0
    || ![(UINavigationController *)self _isUsingBuiltinAnimator]
    && [(UINavigationController *)self _hasInterruptibleNavigationTransition])
  {
    return 0;
  }
  if ([(UINavigationController *)self _isUsingBuiltinAnimator])
  {
    objc_super v7 = [(_UINavigationControllerVisualStyle *)self->_visualStyle interactionController];

    if (v7) {
      return 1;
    }
  }
  uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  if ((navigationControllerFlags & 0x600000) == 0) {
    return 1;
  }
  if ((navigationControllerFlags & 0x8000000) == 0) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = [WeakRetained _navigationControllerShouldUseBuiltinInteractionController:self];

  return v11;
}

- (id)_customInteractionController:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor interactiveTransitionController];

  if (v5)
  {
    id v6 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor interactiveTransitionController];
    goto LABEL_29;
  }
  objc_super v7 = [v4 _animator];
  double v8 = [(_UINavigationControllerVisualStyle *)self->_visualStyle transitionController];

  if (v8 == v7) {
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = WeakRetained;
    uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
    if ((navigationControllerFlags & 0x800000) != 0)
    {
      id v9 = [WeakRetained navigationController:self interactionControllerForAnimationController:v7];
      if (v9) {
        goto LABEL_13;
      }
      uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
    }
    if ((navigationControllerFlags & 0x1000000) != 0)
    {
      id v9 = [v11 navigationController:self interactionControllerUsingAnimator:v7];
    }
    else
    {
      id v9 = 0;
    }
LABEL_13:

    if (v9) {
      goto LABEL_6;
    }
LABEL_14:
    double v13 = [(UIViewController *)self traitCollection];
    if (+[UIView _interruptibleParallaxTransitionsEnabledWithTraitCollection:]((uint64_t)UIView, v13))
    {
      BOOL v14 = [(UINavigationController *)self _isUsingBuiltinAnimator];

      if (v14) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    if (![(UINavigationController *)self isInteractiveTransition])
    {
LABEL_21:
      id v9 = 0;
      goto LABEL_28;
    }
LABEL_19:
    if ([(UINavigationController *)self _shouldUseBuiltinInteractionController]|| ([(_UINavigationControllerVisualStyle *)self->_visualStyle transitionController], double v15 = objc_claimAutoreleasedReturnValue(), v15, v7 == v15))
    {
      double v16 = [(_UINavigationControllerVisualStyle *)self->_visualStyle interactionController];
      if (v16)
      {
        [v4 _setInteractor:v16];
        id v9 = v16;
        if (objc_opt_respondsToSelector())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v9 setAnimationController:v7];
          }
        }
      }
      else
      {
        id v9 = [(UINavigationController *)self _createBuiltInInteractionControllerForAnimationController:v7];
      }

      goto LABEL_28;
    }
    goto LABEL_21;
  }
  id v9 = [v7 _interactionController];
  if (!v9) {
    goto LABEL_14;
  }
LABEL_6:
  [v4 _setInteractor:v9];
LABEL_28:
  id v6 = v9;

LABEL_29:
  return v6;
}

- (void)_executeNavigationHandler:(id)a3 deferred:(BOOL)a4
{
  BOOL v4 = a4;
  char v11 = (void (**)(void))a3;
  id v6 = [(UINavigationController *)self _updateNavigationBarHandler];

  if (v4)
  {
    if (v6)
    {
      objc_super v7 = [(UINavigationController *)self _updateNavigationBarHandler];
      v7[2]();
    }
    [(UINavigationController *)self _setUpdateNavigationBarHandler:v11];
    goto LABEL_10;
  }
  if (v6)
  {
    double v8 = [(UINavigationController *)self _updateNavigationBarHandler];
    v8[2]();
    [(UINavigationController *)self _setUpdateNavigationBarHandler:v11];

LABEL_10:
    id v9 = v11;
    goto LABEL_11;
  }
  id v9 = v11;
  if (self->_navigationBar
    || ([(UIViewController *)self _existingView],
        int64_t v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        id v9 = v11,
        v10))
  {
    v9[2](v9);
    goto LABEL_10;
  }
LABEL_11:
}

- (id)separateSecondaryViewControllerForSplitViewController:(id)a3
{
  BOOL v3 = [(UINavigationController *)self _separateViewControllersAfterAndIncludingViewController:0 forSplitViewController:a3];
  BOOL v4 = [v3 firstObject];

  return v4;
}

- (void)showViewController:(UIViewController *)vc sender:(id)sender
{
  id v6 = vc;
  id v7 = sender;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ![(UINavigationController *)self _allowNestedNavigationControllers])
  {
    *(void *)&self->_navigationControllerFlags |= 0x8000000000000uLL;
    v8.receiver = self;
    v8.super_class = (Class)UINavigationController;
    [(UIViewController *)&v8 showViewController:v6 sender:v7];
    *(void *)&self->_navigationControllerFlags &= ~0x8000000000000uLL;
  }
  else
  {
    [(UINavigationController *)self pushViewController:v6 animated:+[UIView areAnimationsEnabled]];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (sel_showViewController_sender_ == a3 && (*(void *)&self->_navigationControllerFlags & 0x8000000000000) != 0)
  {
    BOOL v8 = 0;
    goto LABEL_13;
  }
  if (sel__performBackKeyCommand_ != a3 || ![v6 isEqual:self->_backKeyCommand])
  {
    if (sel_rename_ == a3)
    {
      unsigned __int8 v9 = [(UINavigationController *)self _canPerformRename:v7];
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)UINavigationController;
      unsigned __int8 v9 = [(UIViewController *)&v11 canPerformAction:a3 withSender:v7];
    }
    goto LABEL_12;
  }
  if (![(UINavigationController *)self _canPerformBackKeyCommandToPopViewController])
  {
    unsigned __int8 v9 = [(UINavigationController *)self _canUseBackKeyCommandToTriggerSidebarKeyCommandWithSender:v7];
LABEL_12:
    BOOL v8 = v9;
    goto LABEL_13;
  }
  BOOL v8 = 1;
LABEL_13:

  return v8;
}

uint64_t __71__UINavigationController_pushViewController_transition_forceImmediate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)pushViewController:(id)a3 transition:(int)a4
{
}

- (id)_nthChildViewControllerFromTop:(unint64_t)a3
{
  BOOL v4 = [(UIViewController *)self mutableChildViewControllers];
  unint64_t v5 = [v4 count];
  if (v5 <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v4 objectAtIndex:v5 + ~a3];
  }

  return v6;
}

- (id)_findViewControllerToPopTo
{
  BOOL v3 = [(UIViewController *)self mutableChildViewControllers];
  BOOL v4 = [(UINavigationController *)self disappearingViewController];
  unint64_t v5 = [v3 lastObject];
  BOOL v6 = v5 == v4;

  id v7 = [(UINavigationController *)self _nthChildViewControllerFromTop:v6];

  return v7;
}

- (UIViewController)popViewControllerAnimated:(BOOL)animated
{
  if (animated) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  return (UIViewController *)[(UINavigationController *)self _popViewControllerWithTransition:v3 allowPoppingLast:0];
}

- (BOOL)_isCurrentTransitionPreemptable
{
  uint64_t v3 = [(UINavigationController *)self _transitionController];
  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor transitionContext];
    if ([v4 _state] && (objc_msgSend(v4, "_transitionHasCompleted") & 1) == 0) {
      char v5 = [v3 shouldPreemptWithContext:v4];
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_hasPreferredInterfaceOrientationForPresentation
{
  v5.receiver = self;
  v5.super_class = (Class)UINavigationController;
  if ([(UIViewController *)&v5 _hasPreferredInterfaceOrientationForPresentation])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    LODWORD(v3) = dyld_program_sdk_at_least();
    if (v3) {
      return (*(void *)&self->_navigationControllerFlags >> 29) & 1;
    }
  }
  return v3;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  if ((*(void *)&self->_navigationControllerFlags & 0x20000000) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int64_t v5 = [WeakRetained navigationControllerPreferredInterfaceOrientationForPresentation:self];

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UINavigationController;
    return [(UIViewController *)&v6 preferredInterfaceOrientationForPresentation];
  }
}

- (BOOL)_willPerformCustomNavigationTransitionForPop
{
  return [(_UIViewControllerTransitionConductor *)self->_transitionConductor willPerformCustomTransition];
}

- (BOOL)_willPerformCustomNavigationTransitionForPush
{
  return [(_UIViewControllerTransitionConductor *)self->_transitionConductor willPerformCustomTransition];
}

- (id)_interruptibleNavigationTransitionAnimator
{
  return [(_UIViewControllerTransitionConductor *)self->_transitionConductor interruptibleNavigationTransitionAnimator];
}

- (double)_customNavigationTransitionDuration
{
  [(_UIViewControllerTransitionConductor *)self->_transitionConductor customNavigationTransitionDuration];
  return result;
}

- (id)_popViewControllerWithTransition:(int)a3 allowPoppingLast:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = [(UINavigationController *)self viewControllers];
  unint64_t v8 = [v7 count];

  BOOL v9 = v8 == 1 && v4;
  if (v8 > 1 || v9)
  {
    uint64_t v11 = [(UINavigationController *)self _effectiveTransitionForTransition:v5];
    id v10 = [(UINavigationController *)self topViewController];
    id v12 = [(UIViewController *)self view];
    double v13 = [v12 window];

    BOOL v14 = [(UINavigationController *)self _isAppearingOrAppearedCheck];
    if (v13) {
      BOOL v15 = v14;
    }
    else {
      BOOL v15 = 0;
    }
    if (!v11) {
      BOOL v15 = 0;
    }
    BOOL v16 = v8 != 1 && v15;
    if (![(UIResponder *)self _disableAutomaticKeyboardBehavior])
    {
      id v17 = -[UIViewController _keyboardSceneDelegate](self);
      uint64_t v18 = [v17 responder];
      int v19 = [v10 _shouldAttemptToPreserveInputViewsForResponder:v18];

      if (v19)
      {
        double v20 = [MEMORY[0x1E4F29238] valueWithPointer:v10];
        [v17 _preserveInputViewsWithId:v20];
      }
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __76__UINavigationController__popViewControllerWithTransition_allowPoppingLast___block_invoke;
    v23[3] = &__block_descriptor_41_e26___NSArray_16__0__NSArray_8l;
    v23[4] = v8;
    BOOL v24 = v4;
    double v21 = _Block_copy(v23);
    [(UINavigationController *)self _applyViewControllers:v21 transition:v11 animated:v16 operation:2 rescheduleBlock:0];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

id __76__UINavigationController__popViewControllerWithTransition_allowPoppingLast___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[v3 count] > 1 || *(void *)(a1 + 32) == 1 && *(unsigned char *)(a1 + 40))
  {
    objc_msgSend(v3, "subarrayWithRange:", 0, objc_msgSend(v3, "count") - 1);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v3;
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)popViewControllerWithAnimationTransition:(int64_t)a3 duration:(double)a4 curve:(int64_t)a5
{
  int64_t v7 = (a5 << 16) | (a3 << 20);
  unint64_t v8 = [(UINavigationController *)self navigationTransitionView];
  +[UIView transitionWithView:v8 duration:v7 options:0 animations:0 completion:a4];

  return [(UINavigationController *)self popViewControllerAnimated:0];
}

- (id)popViewControllerWithTransition:(int)a3
{
  return [(UINavigationController *)self _popViewControllerWithTransition:*(void *)&a3 allowPoppingLast:0];
}

- (id)popToViewControllerWithSnapbackIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int64_t v7 = [(UIViewController *)self mutableChildViewControllers];
  unint64_t v8 = [v7 count];
  unint64_t v9 = v8 - 2;
  if (v8 < 2) {
    goto LABEL_7;
  }
  while (1)
  {
    id v10 = [v7 objectAtIndex:v9];
    if ([v10 canHandleSnapbackIdentifier:v6 animated:v4]) {
      break;
    }

    if (--v9 == -1) {
      goto LABEL_7;
    }
  }
  if (v10)
  {
    uint64_t v11 = [(UINavigationController *)self popToViewController:v10 animated:v4];
  }
  else
  {
LABEL_7:
    uint64_t v11 = [MEMORY[0x1E4F1C978] array];
  }

  return v11;
}

- (BOOL)_transitionConflictsWithNavigationTransitions:(id)a3
{
  id v4 = a3;
  if ([v4 presentationStyle] == 4
    || [v4 presentationStyle] == 3
    || [v4 presentationStyle] == 6)
  {
    uint64_t v5 = [v4 viewControllerForKey:@"UITransitionContextToViewController"];
    if (v5 || [v4 presentationStyle] != 4)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __72__UINavigationController__transitionConflictsWithNavigationTransitions___block_invoke;
      v9[3] = &unk_1E52E8B20;
      id v10 = v5;
      int v7 = -[UIViewController _doesSelfOrAncestorPassPredicate:]((uint64_t)self, v9) ^ 1;
    }
    else
    {
      id v6 = [v4 viewControllerForKey:@"UITransitionContextFromViewController"];
      LOBYTE(v7) = v6 != 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

BOOL __72__UINavigationController__transitionConflictsWithNavigationTransitions___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

- (void)_setAllowsFreezeLayoutForOrientationChangeOnDismissal:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)_allowsAutorotation
{
  v7.receiver = self;
  v7.super_class = (Class)UINavigationController;
  unsigned int v3 = [(UIViewController *)&v7 _allowsAutorotation];
  id v4 = [(UINavigationController *)self topViewController];

  if (v4)
  {
    uint64_t v5 = [(UINavigationController *)self topViewController];
    v3 &= [v5 _allowsAutorotation];
  }
  return v3;
}

- (BOOL)_doesTopViewControllerSupportInterfaceOrientation:(int64_t)a3
{
  uint64_t v5 = [(UINavigationController *)self topViewController];

  if (!v5) {
    return 1;
  }
  id v6 = [(UINavigationController *)self topViewController];
  char v7 = [v6 _isSupportedInterfaceOrientation:a3];

  return v7;
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  if ([(id)objc_opt_class() _doesOverrideLegacyShouldAutorotateMethod])
  {
    return [(UINavigationController *)self shouldAutorotateToInterfaceOrientation:a3];
  }
  else
  {
    return [(UINavigationController *)self _doesTopViewControllerSupportInterfaceOrientation:a3];
  }
}

- (id)rotatingHeaderView
{
  if ([(UINavigationController *)self isNavigationBarHidden])
  {
    unsigned int v3 = [(UINavigationController *)self topViewController];
    id v4 = [v3 rotatingHeaderView];
  }
  else
  {
    id v4 = [(UINavigationController *)self navigationBar];
  }
  return v4;
}

- (id)rotatingFooterView
{
  if ([(UINavigationController *)self isToolbarHidden])
  {
    unsigned int v3 = [(UINavigationController *)self topViewController];
    id v4 = [v3 rotatingFooterView];
  }
  else
  {
    id v4 = [(UINavigationController *)self toolbar];
  }
  return v4;
}

- (BOOL)_shouldUseOnePartRotation
{
  unsigned int v3 = [(UINavigationController *)self topViewController];

  if (!v3) {
    return 1;
  }
  id v4 = [(UINavigationController *)self topViewController];
  char v5 = [v4 _shouldUseOnePartRotation];

  return v5;
}

- (void)_getRotationContentSettings:(id *)a3
{
  id v4 = [(UINavigationController *)self topViewController];
  [v4 _getRotationContentSettings:a3];
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6 = [(UINavigationController *)self topViewController];
  [v6 willRotateToInterfaceOrientation:a3 duration:a4];
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v7 = [(UINavigationController *)self topViewController];
  [(UINavigationController *)self _updateBarsForCurrentInterfaceOrientation];
  [v7 willAnimateRotationToInterfaceOrientation:a3 duration:a4];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)UINavigationController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (v7)
  {
    [v7 targetTransform];
    if (!CGAffineTransformIsIdentity(&v10))
    {
      [(UINavigationController *)self _stopTransitionsImmediately];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __77__UINavigationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
      v8[3] = &unk_1E52DA598;
      v8[4] = self;
      [v7 animateAlongsideTransition:v8 completion:0];
    }
  }
}

uint64_t __77__UINavigationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBarsForCurrentInterfaceOrientation];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(UIViewController *)self _freezeLayoutForOrientationChangeOnDismissal])
  {
    unint64_t v8 = [(UIViewController *)self traitCollection];
    uint64_t v9 = [v6 userInterfaceStyle];
    if (v9 == [v8 userInterfaceStyle]
      || ([v8 _traitCollectionByReplacingNSIntegerValue:0 forTraitToken:0x1ED3F5A48],
          CGAffineTransform v10 = objc_claimAutoreleasedReturnValue(),
          [v6 _traitCollectionByReplacingNSIntegerValue:0 forTraitToken:0x1ED3F5A48],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          char v12 = [v10 isEqual:v11],
          v11,
          v10,
          (v12 & 1) == 0))
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __84__UINavigationController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
      v14[3] = &unk_1E52DA598;
      v14[4] = self;
      [v7 animateAlongsideTransition:v14 completion:0];
    }
    v13.receiver = self;
    v13.super_class = (Class)UINavigationController;
    [(UIViewController *)&v13 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
  }
}

void __84__UINavigationController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  char v5 = [v4 traitCollection];
  LODWORD(v4) = [v4 _shouldHideBarsForTraits:v5];

  id v6 = *(unsigned char **)(a1 + 32);
  if (v4)
  {
    int v7 = [v6 _useCrossFadeForGestureHiding];
    unint64_t v8 = [*(id *)(a1 + 32) _existingNavigationBar];
    if (v8)
    {
      uint64_t v9 = *(void **)(a1 + 32);
      if (v7) {
        uint64_t v10 = 15;
      }
      else {
        uint64_t v10 = 1;
      }
      [v3 transitionDuration];
      objc_msgSend(v9, "_setNavigationBarHidden:edge:duration:", 1, v10);
    }
    uint64_t v11 = [*(id *)(a1 + 32) _existingToolbarWithItems];

    if (!v11) {
      goto LABEL_24;
    }
    char v12 = *(void **)(a1 + 32);
    if (v7) {
      uint64_t v13 = 15;
    }
    else {
      uint64_t v13 = 4;
    }
    [v3 transitionDuration];
    BOOL v14 = v12;
    uint64_t v15 = 1;
LABEL_23:
    objc_msgSend(v14, "_setToolbarHidden:edge:duration:", v15, v13);
LABEL_24:

    goto LABEL_25;
  }
  if (v6[1266])
  {
    int v16 = [v6 _useCrossFadeForGestureHiding];
    unint64_t v8 = [*(id *)(a1 + 32) _existingNavigationBar];
    if (v8)
    {
      id v17 = *(void **)(a1 + 32);
      if (v16) {
        uint64_t v18 = 15;
      }
      else {
        uint64_t v18 = 1;
      }
      [v3 transitionDuration];
      objc_msgSend(v17, "_setNavigationBarHidden:edge:duration:", 0, v18);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __84__UINavigationController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_2;
      v21[3] = &unk_1E52D9F70;
      v21[4] = *(void *)(a1 + 32);
      +[UIView performWithoutAnimation:v21];
    }
    int v19 = [*(id *)(a1 + 32) _existingToolbarWithItems];

    if (!v19) {
      goto LABEL_24;
    }
    double v20 = *(void **)(a1 + 32);
    if (v16) {
      uint64_t v13 = 15;
    }
    else {
      uint64_t v13 = 4;
    }
    [v3 transitionDuration];
    BOOL v14 = v20;
    uint64_t v15 = 0;
    goto LABEL_23;
  }
LABEL_25:
  [*(id *)(a1 + 32) _requestNavigationBarUpdateSearchBarForPlacementChangeIfApplicable];
  [*(id *)(a1 + 32) _updateBarsForCurrentInterfaceOrientation];
}

void __84__UINavigationController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) _navigationBarForNestedNavigationController];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) _navigationBarForNestedNavigationController];
  [v3 layoutIfNeeded];
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
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = 0;
  }
  id v9 = v8;
  uint64_t v10 = v9;
  if (v9
    && ([v9 _existingView], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0)
    && (char v12 = (void *)v11,
        [(UINavigationController *)self topViewController],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v10 == v13))
  {
    double v20 = [(UIViewController *)self _splitViewControllerEnforcingClass:1];
    double v21 = v20;
    if (v20
      && [v20 _navigationControllerShouldNotAdjustTransitioningSizeForChildContainer:self])
    {
      v35.receiver = self;
      v35.super_class = (Class)UINavigationController;
      -[UIViewController sizeForChildContentContainer:withParentContainerSize:](&v35, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
      double v15 = v22;
      double v17 = v23;
    }
    else
    {
      BOOL v24 = [(UIViewController *)self view];
      [v24 frame];
      double v26 = v25;
      double v28 = v27;

      id v29 = [v10 view];
      [v29 frame];
      double v31 = v30;
      double v33 = v32;

      double v15 = width - v26 + v31;
      double v17 = height - v28 + v33;
    }
  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)UINavigationController;
    -[UIViewController sizeForChildContentContainer:withParentContainerSize:](&v34, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
    double v15 = v14;
    double v17 = v16;
  }

  double v18 = v15;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (id)_childViewControllersToSendViewWillTransitionToSize
{
  if (![(UINavigationController *)self _allowNestedNavigationControllers]
    || ![(UINavigationController *)self _hasNestedNavigationController])
  {
    goto LABEL_18;
  }
  id v3 = [(UIViewController *)self parentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if ([v5 style])
  {
    if ([v5 style] && !objc_msgSend(v5, "_columnForViewController:", self)) {
      goto LABEL_15;
    }
    goto LABEL_17;
  }
  id v6 = [v5 childViewControllers];
  id v7 = [v6 firstObject];
  if (v7 == self)
  {

LABEL_15:
    v15.receiver = self;
    v15.super_class = (Class)UINavigationController;
    uint64_t v10 = [(UIViewController *)&v15 _childViewControllersToSendViewWillTransitionToSize];
    uint64_t v11 = (void *)[v10 mutableCopy];

    char v12 = [v5 _childViewControllersToSendViewWillTransitionToSize];
    [v11 removeObjectsInArray:v12];

    goto LABEL_19;
  }
  unint64_t v8 = v7;
  if ([v5 style])
  {
    uint64_t v9 = [v5 _columnForViewController:self];

    if (!v9) {
      goto LABEL_15;
    }
  }
  else
  {
  }
LABEL_17:

LABEL_18:
  v14.receiver = self;
  v14.super_class = (Class)UINavigationController;
  uint64_t v11 = [(UIViewController *)&v14 _childViewControllersToSendViewWillTransitionToSize];
LABEL_19:
  return v11;
}

- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6 = [(UINavigationController *)self topViewController];
  [v6 willAnimateFirstHalfOfRotationToInterfaceOrientation:a3 duration:a4];
}

- (void)didAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3
{
  if (![(UINavigationController *)self _shouldUseOnePartRotation]) {
    [(UINavigationController *)self _updateBarsForCurrentInterfaceOrientation];
  }
  id v5 = [(UINavigationController *)self topViewController];
  [v5 didAnimateFirstHalfOfRotationToInterfaceOrientation:a3];
}

- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6 = [(UINavigationController *)self topViewController];
  [v6 willAnimateSecondHalfOfRotationFromInterfaceOrientation:a3 duration:a4];
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  id v4 = [(UINavigationController *)self topViewController];
  [v4 didRotateFromInterfaceOrientation:a3];
}

- (id)rotatingSnapshotViewForWindow:(id)a3
{
  id v3 = [(UINavigationController *)self topViewController];
  id v4 = [v3 view];

  return v4;
}

- (void)_setPreferredNavigationBarPosition:(int64_t)a3
{
  if (a3 == 4 || a3 == 1)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UINavigationController.m" lineNumber:9243 description:@"UINavigationBar does not support UIBarPositionBottom or UIBarPositionBottomAttached"];
  }
  if (self->__preferredNavigationBarPosition != a3)
  {
    self->__int64_t preferredNavigationBarPosition = a3;
    if ([(UINavigationController *)self _isNavigationBarVisible])
    {
      id v7 = [(UIViewController *)self _existingView];
      [v7 setNeedsLayout];
    }
  }
}

- (double)_statusBarHeightForCurrentInterfaceOrientation
{
  if (self->__positionBarsExclusivelyWithSafeArea)
  {
    id v3 = self;
    id v4 = v3;
    if (self->__positionBarsExclusivelyWithSafeArea
      && ([(UIViewController *)v3 _existingView],
          id v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 _usesMinimumSafeAreas],
          v5,
          v6))
    {
      id v7 = [(UIViewController *)v4 _existingView];
      [v7 _minimumSafeAreaInsets];
      double v9 = v8;
    }
    else
    {
      [(UIViewController *)v4 _contentOverlayInsets];
      double v9 = v10;
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UINavigationController;
    [(UIViewController *)&v13 _statusBarHeightForCurrentInterfaceOrientation];
    return v11;
  }
  return v9;
}

- (id)_findViewControllerToPopToForNavigationItem:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(UIViewController *)self mutableChildViewControllers];
  int v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  id v7 = 0;
  if (v6)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      double v9 = 0;
      double v10 = v7;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v9);
        id v12 = [v11 navigationItem];

        if (v12 == v4)
        {
          id v7 = v10;
          int v6 = v7;
          goto LABEL_11;
        }
        id v7 = v11;

        double v9 = (char *)v9 + 1;
        double v10 = v7;
      }
      while (v6 != v9);
      int v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  return 1;
}

- (BOOL)_isViewControllerInRootPresentationHierarchy:(id)a3
{
  id v4 = a3;
  id v5 = [(UINavigationController *)self _window];
  id v6 = [v5 rootViewController];

  if (v6 == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    id v7 = [v4 parentViewController];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v4 presentingViewController];
    }
    id v11 = v9;

    if (!v11 || v6 == v11)
    {
      id v15 = v11;
    }
    else
    {
      do
      {
        id v12 = [v11 parentViewController];
        objc_super v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [v11 presentingViewController];
        }
        id v15 = v14;

        if (!v15) {
          break;
        }
        id v11 = v15;
      }
      while (v6 != v15);
    }
    if (v6 == v15)
    {
      id v16 = [v6 presentedViewController];
      BOOL v10 = v16 == v4;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  return v10;
}

- (int64_t)navigationBarNSToolbarSection:(id)a3
{
  id v4 = [(UINavigationController *)self _window];
  id v5 = [v4 rootViewController];

  if ([(UINavigationController *)self _isViewControllerInRootPresentationHierarchy:self])
  {
    int64_t v6 = 3;
  }
  else
  {
    id v7 = [(UIViewController *)self _splitViewControllerEnforcingClass:1];
    if (-[UINavigationController _isViewControllerInRootPresentationHierarchy:](self, "_isViewControllerInRootPresentationHierarchy:", v7)&& (unint64_t v8 = [v7 _columnForViewController:self], v8 < 4))
    {
      int64_t v6 = qword_186B94280[v8];
    }
    else
    {
      id v9 = [(UIViewController *)self _tabBarControllerEnforcingClass:1];
      if ([(UINavigationController *)self _isViewControllerInRootPresentationHierarchy:v9])
      {
        int64_t v6 = 3;
      }
      else
      {
        int64_t v6 = 0;
      }
    }
  }

  return v6;
}

- (void)navigationBarDidResizeForPrompt:(id)a3
{
  [(UINavigationController *)self _layoutTopViewController];
  id v4 = [(UINavigationController *)self topViewController];
  [(UINavigationController *)self _computeAndApplyScrollContentInsetDeltaForViewController:v4];
}

- (id)_navigationBarWindowForInterfaceOrientation:(id)a3
{
  return [(UINavigationController *)self _interfaceOrientationWindowForBar:a3 matchingBar:self->_navigationBar];
}

- (void)_popNavigationBar:(id)a3 item:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(UINavigationController *)self _isTransitioning])
  {
    if (![(UINavigationController *)self navigationBar:v7 shouldPopItem:v8]) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  BOOL v9 = [(UINavigationController *)self needsDeferredTransition];
  BOOL v10 = [(UINavigationController *)self navigationBar:v7 shouldPopItem:v8];
  BOOL v11 = v10;
  if (!v9
    && v10
    && ([(UINavigationController *)self _isTransitioning]
     || [(UINavigationController *)self needsDeferredTransition]))
  {
    if (dyld_program_sdk_at_least())
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"UINavigationController.m", 9567, @"Override of -navigationBar:shouldPopItem: returned YES after manually popping a view controller (navigationController=%@)", self object file lineNumber description];
    }
    else
    {
      id v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_popNavigationBar_item____s_category) + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = self;
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Override of -navigationBar:shouldPopItem: returned YES after manually popping a view controller (navigationController=%@)", buf, 0xCu);
      }
    }
  }
  else if (v11)
  {
LABEL_11:
    id v13 = [(UINavigationController *)self popViewControllerAnimated:1];
  }
LABEL_12:
}

- (BOOL)_isPushingOrPoppingUsingLayoutToLayoutNavigationTransition
{
  if (![(UINavigationController *)self _isPushingOrPopping]) {
    return 0;
  }
  id v3 = [(UINavigationController *)self topViewController];
  if ([v3 useLayoutToLayoutNavigationTransitions]) {
    BOOL v4 = [(UINavigationController *)self _isPerformingLayoutToLayoutTransition];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_updateBottomBarsForNavigationTransition
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(UINavigationController *)self _nestedTopViewController];
  BOOL v4 = v3;
  if (v3) {
    BOOL v5 = ((v3[94] >> 1) & 3u) - 1 < 2;
  }
  else {
    BOOL v5 = 0;
  }
  int64_t v6 = [v3 _existingView];
  id v7 = [v6 window];

  if (v7)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    double v18 = __66__UINavigationController__updateBottomBarsForNavigationTransition__block_invoke;
    uint64_t v19 = &unk_1E52D9F98;
    double v20 = self;
    id v21 = v4;
    +[UIView performWithoutAnimation:&v16];
  }
  else if (v5)
  {
    id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("UINavigationController", &_updateBottomBarsForNavigationTransition___s_category)+ 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      double v23 = self;
      __int16 v24 = 2114;
      double v25 = v4;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Top view controller's view unexpectedly not in window for navigation transition. Skipping layout. nav = %{public}@, topVC = %{public}@", buf, 0x16u);
    }
  }
  BOOL v9 = -[UIViewController _tabBarControllerEnforcingClass:](self, "_tabBarControllerEnforcingClass:", 1, v16, v17, v18, v19, v20);
  BOOL v10 = v9;
  if (!v9)
  {
    if (v5) {
      goto LABEL_13;
    }
LABEL_15:
    [(UINavigationController *)self _setSuspendToolbarBackgroundUpdating:0];
    goto LABEL_17;
  }
  char v11 = [v9 _isBarEffectivelyHidden];
  if (!v5)
  {
    if ((v11 & 1) == 0)
    {
      [v10 _setSuspendBarBackgroundUpdating:0];
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (v11)
  {
LABEL_13:
    id v14 = [v4 _contentOrObservableScrollViewForEdge:4];
    id v15 = [(UINavigationController *)self _existingActiveVisibleToolbar];
    [(UINavigationController *)self _updateBackgroundTransitionProgressForScrollView:v14 toolbar:v15 isNavigationTransitionUpdate:1];

    goto LABEL_17;
  }
  id v12 = [v4 _contentOrObservableScrollViewForEdge:4];
  id v13 = [v10 tabBar];
  [v10 _updateBackgroundTransitionProgressForScrollView:v12 tabBar:v13 isNavigationTransitionUpdate:1];

LABEL_17:
}

void __66__UINavigationController__updateBottomBarsForNavigationTransition__block_invoke(uint64_t a1)
{
  _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(*(void **)(a1 + 32), *(void **)(a1 + 40), 1, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 _isAutomaticContentOffsetAdjustmentEnabled];
  uint64_t v3 = [v5 _shouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange];
  [v5 _setAutomaticContentOffsetAdjustmentEnabled:0];
  [v5 _setShouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange:1];
  [*(id *)(a1 + 40) _updateContentOverlayInsetsFromParentIfNecessary];
  [v5 _setAutomaticContentOffsetAdjustmentEnabled:v2];
  [v5 _setShouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange:v3];
  BOOL v4 = [*(id *)(a1 + 40) view];
  [v4 layoutIfNeeded];
}

- (void)_startCoordinatedBottomBarUpdateForTransition:(int)a3
{
  if (![(UINavigationController *)self _isNestedNavigationController])
  {
    if (a3 == 2) {
      +[_UINavigationBarTransitionAssistant popTransitionAssistantForNavigationBar:self->_navigationBar delegate:self crossfade:0];
    }
    else {
    id v5 = +[_UINavigationBarTransitionAssistant pushTransitionAssistantForNavigationBar:self->_navigationBar delegate:self crossfade:a3 != 1];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__UINavigationController__startCoordinatedBottomBarUpdateForTransition___block_invoke;
    aBlock[3] = &unk_1E52D9F70;
    void aBlock[4] = self;
    int64_t v6 = _Block_copy(aBlock);
    if ([v5 shouldAnimateAlongside])
    {
      id v7 = [v5 transitionCoordinator];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __72__UINavigationController__startCoordinatedBottomBarUpdateForTransition___block_invoke_2;
      v8[3] = &unk_1E52DA110;
      id v9 = v6;
      [v7 animateAlongsideTransition:v8 completion:0];
    }
    else
    {
      [v5 duration];
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6);
    }
  }
}

uint64_t __72__UINavigationController__startCoordinatedBottomBarUpdateForTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBottomBarsForNavigationTransition];
}

uint64_t __72__UINavigationController__startCoordinatedBottomBarUpdateForTransition___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_navigationBarPrepareToAnimateTransition:(id)a3
{
  id v3 = [(UINavigationController *)self topViewController];
  [v3 _prepareForNavigationTransition:1];
}

- (void)_navigationBarWillBeginCoordinatedTransitionAnimations:(id)a3
{
  [(UINavigationController *)self _initializeNavigationDeferredTransitionContextIfNecessary];
  if (![(UINavigationController *)self _isPushingOrPoppingUsingLayoutToLayoutNavigationTransition])
  {
    BOOL v4 = [(UINavigationController *)self _nestedTopViewController];
    _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v4, 1, 0);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    id v5 = [(UINavigationController *)self _nestedTopViewController];
    _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v5, 1, 1);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v7 = [v6 _safeAreaInsetsFrozen];
    if (v8 != v6) {
      [v6 _setSafeAreaInsetsFrozen:1];
    }
    [(UINavigationController *)self _performCoordinatedUpdateTopFramesTransitionAnimation];
    if ([(UINavigationController *)self _hasPotentiallyChromelessBottomBar]) {
      [(UINavigationController *)self _updateBottomBarsForNavigationTransition];
    }
    [v6 _setSafeAreaInsetsFrozen:v7 updateForUnfreeze:0];
  }
}

- (void)_navigationBarWillRunAutomaticDeferredShowsScopeBar:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__UINavigationController__navigationBarWillRunAutomaticDeferredShowsScopeBar___block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  +[UIView animateWithDuration:v3 animations:0.25];
}

uint64_t __78__UINavigationController__navigationBarWillRunAutomaticDeferredShowsScopeBar___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _performCoordinatedUpdateTopFramesTransitionAnimation];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 984);
  return [v2 layoutIfNeeded];
}

- (void)_navigationBarDidUpdateVisibility:(id)a3
{
}

- (void)_navigationBarWillChangeHeightForManualShowOrHideOfSearchScopeBar:(id)a3
{
  id v3 = [(UIViewController *)self _existingView];
  if (v3 && (v3[12] & 0x8000000000000000) == 0)
  {
    BOOL v4 = v3;
    [v3 setNeedsLayout];
    id v3 = v4;
  }
}

- (CGRect)_incomingNavigationBarFrame
{
  id v3 = [(UINavigationController *)self topViewController];
  BOOL v4 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(self, v3, 1, 0);
  id v5 = self;
  id v6 = _insetCoordinatableContentScrollViewForEdgePotentiallyIgnoringSearch(v5, v3, 1, 0);
  if ([(UINavigationController *)v5 _isPushing])
  {
    uint64_t v7 = 2;
  }
  else if ([(UINavigationController *)v5 _isPopping])
  {
    uint64_t v7 = 3;
  }
  else
  {
    uint64_t v7 = v6 != 0;
  }

  long long v12 = 0u;
  long long v13 = 0u;
  [(UINavigationController *)v5 _calculateTopViewFramesForLayoutWithViewController:v3 contentScrollView:v4 navBarFrame:&v12 topPaletteFrame:0 topLayoutType:v7];

  double v9 = *((double *)&v12 + 1);
  double v8 = *(double *)&v12;
  double v11 = *((double *)&v13 + 1);
  double v10 = *(double *)&v13;
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (void)_performCoordinatedUpdateTopFramesTransitionAnimation
{
  id v3 = [(UINavigationController *)self topViewController];
  if ([v3 _isNestedNavigationController])
  {
    uint64_t v4 = [v3 topViewController];

    id v3 = (void *)v4;
  }
  [(UINavigationController *)self _updateTopViewFramesForViewController:v3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__UINavigationController__performCoordinatedUpdateTopFramesTransitionAnimation__block_invoke;
  v5[3] = &unk_1E52D9F70;
  v5[4] = self;
  +[UIView performWithoutAnimation:v5];
}

uint64_t __79__UINavigationController__performCoordinatedUpdateTopFramesTransitionAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutTopViewControllerLookForNested:1];
}

- (void)setHidesBarsWhenKeyboardAppears:(BOOL)hidesBarsWhenKeyboardAppears
{
  if (self->_hidesBarsWhenKeyboardAppears != hidesBarsWhenKeyboardAppears)
  {
    self->_hidesBarsWhenKeyboardAppears = hidesBarsWhenKeyboardAppears;
    [(UINavigationController *)self _configureKeyboardBarHiding];
  }
}

- (void)_setKeyboardNotificationToken:(id)a3
{
  id v5 = a3;
  p_keyboardAppearedNotificationToken = &self->__keyboardAppearedNotificationToken;
  if (*p_keyboardAppearedNotificationToken != v5)
  {
    id v8 = v5;
    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:*p_keyboardAppearedNotificationToken];

    objc_storeStrong(p_keyboardAppearedNotificationToken, a3);
    id v5 = v8;
  }
}

- (void)_hideForKeyboardAppearance
{
  if (![(UINavigationController *)self _isTransitioning])
  {
    id v3 = [(UIViewController *)self _existingView];
    uint64_t v4 = [v3 window];

    if (v4)
    {
      [(UINavigationController *)self _setBarsHidden:1 allowAnimation:1];
    }
  }
}

void __53__UINavigationController__configureKeyboardBarHiding__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideForKeyboardAppearance];
}

- (void)setHidesBarsOnSwipe:(BOOL)hidesBarsOnSwipe
{
  if (self->_hidesBarsOnSwipe != hidesBarsOnSwipe)
  {
    self->_hidesBarsOnSwipe = hidesBarsOnSwipe;
    if (hidesBarsOnSwipe)
    {
      [(UINavigationController *)self _makeBarSwipeGestureIfNecessary];
      [(UINavigationController *)self _makeBarHideGestureIfNecessary];
    }
    [(UINavigationController *)self _configureBarTapGesture];
    [(UINavigationController *)self _configureBarSwipeGesture];
  }
}

- (void)_makeBarSwipeGestureIfNecessary
{
  if (!self->__barSwipeHideGesture)
  {
    id v3 = [[_UIBarPanGestureRecognizer alloc] initWithTarget:self action:sel__gestureRecognizedInteractiveHide_];
    barSwipeHideGesture = self->__barSwipeHideGesture;
    self->__barSwipeHideGesture = v3;

    id v5 = self->__barSwipeHideGesture;
    [(_UIBarPanGestureRecognizer *)v5 _setDelegate:self];
  }
}

- (UIPanGestureRecognizer)barHideOnSwipeGestureRecognizer
{
  [(UINavigationController *)self _makeBarSwipeGestureIfNecessary];
  barSwipeHideGesture = self->__barSwipeHideGesture;
  return (UIPanGestureRecognizer *)barSwipeHideGesture;
}

- (void)_gestureRecognizedInteractiveHide:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 barAction];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [(UINavigationController *)self _outermostNavigationController];
    uint64_t v9 = [v5 state];
    uint64_t v10 = [(UINavigationController *)self _barInteractiveAnimationCoordinator];
    double v11 = (_UIAnimationCoordinator *)v10;
    if ((unint64_t)(v9 - 1) <= 1)
    {
      long long v12 = [(UIViewController *)self _existingView];
      [v5 velocityInView:v12];
      double v14 = v13;
      if (v11)
      {
        id v15 = [(_UIAnimationCoordinator *)v11 stash];
        uint64_t v16 = [v15 objectForKeyedSubscript:@"NavigationTransitionFinishedEarly"];
        if ([v16 BOOLValue])
        {
        }
        else
        {
          char v81 = v8;
          double v42 = v12;
          double v43 = [(_UIAnimationCoordinator *)v11 stash];
          double v44 = [v43 objectForKeyedSubscript:@"NavigationBarAnimateOnEnd"];
          char v45 = [v44 BOOLValue];

          if (v45)
          {
            long long v12 = v42;
          }
          else
          {
            id v63 = [(_UIAnimationCoordinator *)v11 stash];
            id v64 = [v63 objectForKeyedSubscript:@"NavigationBarCriticalVelocity"];
            [v64 doubleValue];
            double v66 = v65;

            long long v12 = v42;
            if ((v7 != 1 || v14 >= v66) && (v7 != 2 || v14 <= v66))
            {
              BOOL v73 = v14 < -v66 && v7 == 2;
              BOOL v74 = v14 > -v66 && v7 == 1;
              id v8 = v81;
              if (v74 || v73)
              {
                id v76 = [(_UIAnimationCoordinator *)v11 stash];
                [v76 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"NavigationTransitionFinishedEarly"];

                [(_UIAnimationCoordinator *)v11 cancelInteractiveAnimation];
                uint64_t v77 = [(_UIAnimationCoordinator *)v11 stash];
                BOOL v78 = [v77 objectForKeyedSubscript:@"NavigationBarStartingMode"];
                -[UINavigationController _setBarsHidden:allowAnimation:](self, "_setBarsHidden:allowAnimation:", [v78 BOOLValue], 0);
              }
              else
              {
                id v75 = [(UINavigationController *)self _barInteractiveAnimationCoordinator];
                _gestureProgress((uint64_t)v12, v5, v11);
                objc_msgSend(v75, "updateInteractiveProgress:");
              }
              goto LABEL_48;
            }
            char v67 = [(_UIAnimationCoordinator *)v11 stash];
            [v67 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"NavigationTransitionFinishedEarly"];

            [(_UIAnimationCoordinator *)v11 finishInteractiveAnimation];
          }
          id v8 = v81;
        }
LABEL_48:

        goto LABEL_49;
      }
      BOOL v32 = [(UINavigationController *)self isNavigationBarHidden];
      double v11 = objc_alloc_init(_UIAnimationCoordinator);
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __60__UINavigationController__gestureRecognizedInteractiveHide___block_invoke;
      v82[3] = &unk_1E52E8B48;
      v82[4] = self;
      BOOL v83 = v32;
      [(_UIAnimationCoordinator *)v11 setAnimator:v82];
      double v33 = [v8 _existingView];
      [(_UIAnimationCoordinator *)v11 setContainerView:v33];

      objc_super v34 = [v8 topViewController];
      [(_UIAnimationCoordinator *)v11 setViewController:v34];

      objc_super v35 = [v8 topViewController];
      id v36 = [v35 view];
      [v36 frame];
      -[_UIAnimationCoordinator setStartFrame:](v11, "setStartFrame:");

      uint64_t v37 = [v8 topViewController];
      CGRect v38 = [v37 view];
      [v38 frame];
      -[_UIAnimationCoordinator setEndFrame:](v11, "setEndFrame:");

      double v39 = [NSNumber numberWithBool:v32];
      double v40 = [(_UIAnimationCoordinator *)v11 stash];
      [v40 setObject:v39 forKeyedSubscript:@"NavigationBarStartingMode"];

      if (v7 == 2 && v32)
      {
        double v41 = [(_UIAnimationCoordinator *)v11 stash];
        [v41 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"NavigationBarAnimateOnEnd"];
      }
      else
      {
        char v50 = v7 != 1 || v32;
        if (v50) {
          goto LABEL_41;
        }
        double v51 = fabs(v14);
        if (v51 >= 10.0) {
          double v52 = v51;
        }
        else {
          double v52 = 10.0;
        }
        self;
        _durationOfSpringAnimation(1.0, 900.0, 50.0, v52);
        -[_UIAnimationCoordinator setDuration:](v11, "setDuration:");
        double v41 = [v8 _existingNavigationBar];
        [v41 frame];
        double v54 = v53;
        [(_UIAnimationCoordinator *)v11 animateInteractively];
        [v41 frame];
        double v56 = v55 - v54;
        char v57 = [NSNumber numberWithDouble:v56];
        double v58 = [(_UIAnimationCoordinator *)v11 stash];
        [v58 setObject:v57 forKeyedSubscript:@"NavigationBarTravelDistance"];

        uint64_t v59 = NSNumber;
        [(_UIAnimationCoordinator *)v11 duration];
        CGRect v61 = [v59 numberWithDouble:v56 / v60];
        CGRect v62 = [(_UIAnimationCoordinator *)v11 stash];
        [v62 setObject:v61 forKeyedSubscript:@"NavigationBarCriticalVelocity"];
      }
LABEL_41:
      [(UINavigationController *)self _setInteractiveAnimationCoordinator:v11];
      goto LABEL_48;
    }
    if (v9 == 3)
    {
      if (!v10)
      {
        char v79 = [MEMORY[0x1E4F28B00] currentHandler];
        [v79 handleFailureInMethod:a2, self, @"UINavigationController.m", 9976, @"Trying to complete an interactive gesture but the animation coordinator is nil! (gesture=%@)", v5 object file lineNumber description];
      }
      uint64_t v17 = [(_UIAnimationCoordinator *)v11 stash];
      double v18 = [v17 objectForKeyedSubscript:@"NavigationTransitionFinishedEarly"];
      char v19 = [v18 BOOLValue];

      if (v19) {
        goto LABEL_31;
      }
      double v20 = [v8 _existingView];
      _gestureProgress((uint64_t)v20, v5, v11);
      double v22 = v21;
      [v5 velocityInView:v20];
      double v24 = v23;
      double v25 = [(_UIAnimationCoordinator *)v11 stash];
      uint64_t v26 = [v25 objectForKeyedSubscript:@"NavigationBarAnimateOnEnd"];
      int v27 = [v26 BOOLValue];

      if (v27)
      {
        if (v24 > 300.0)
        {
          double v28 = fabs(v24);
          if (v28 >= 10.0) {
            double v29 = v28;
          }
          else {
            double v29 = 10.0;
          }
          self;
          _durationOfSpringAnimation(1.0, 900.0, 50.0, v29);
          -[_UIAnimationCoordinator setDuration:](v11, "setDuration:");
          [(_UIAnimationCoordinator *)v11 animate];
        }
        goto LABEL_30;
      }
      char v68 = [(_UIAnimationCoordinator *)v11 stash];
      BOOL v69 = [v68 objectForKeyedSubscript:@"NavigationBarCriticalVelocity"];
      [v69 doubleValue];
      double v71 = v70;

      if (v7 == 1)
      {
        if (v22 >= 0.25 || v24 <= v71)
        {
LABEL_58:
          [(_UIAnimationCoordinator *)v11 finishInteractiveAnimation];
          goto LABEL_30;
        }
      }
      else if (v22 >= 0.5 || v24 >= v71)
      {
        goto LABEL_58;
      }
      [(_UIAnimationCoordinator *)v11 cancelInteractiveAnimation];
      double v49 = [(_UIAnimationCoordinator *)v11 stash];
      int v72 = [v49 objectForKeyedSubscript:@"NavigationBarStartingMode"];
      -[UINavigationController _setBarsHidden:allowAnimation:](self, "_setBarsHidden:allowAnimation:", [v72 BOOLValue], 0);
    }
    else
    {
      if (!v10)
      {
        char v80 = [MEMORY[0x1E4F28B00] currentHandler];
        [v80 handleFailureInMethod:a2, self, @"UINavigationController.m", 10007, @"Trying to complete an interactive gesture but the animation coordinator is nil! (gesture=%@)", v5 object file lineNumber description];
      }
      double v30 = [(_UIAnimationCoordinator *)v11 stash];
      double v31 = [v30 objectForKeyedSubscript:@"NavigationTransitionFinishedEarly"];
      if ([v31 BOOLValue])
      {
      }
      else
      {
        double v46 = [(_UIAnimationCoordinator *)v11 stash];
        double v47 = [v46 objectForKeyedSubscript:@"NavigationBarAnimateOnEnd"];
        char v48 = [v47 BOOLValue];

        if ((v48 & 1) == 0) {
          [(_UIAnimationCoordinator *)v11 cancelInteractiveAnimation];
        }
      }
      double v20 = [(_UIAnimationCoordinator *)v11 stash];
      double v49 = [v20 objectForKeyedSubscript:@"NavigationBarStartingMode"];
      -[UINavigationController _setBarsHidden:allowAnimation:](self, "_setBarsHidden:allowAnimation:", [v49 BOOLValue], 0);
    }

LABEL_30:
LABEL_31:
    [(UINavigationController *)self _setInteractiveAnimationCoordinator:0];
LABEL_49:

    goto LABEL_50;
  }
  [(UINavigationController *)self _setInteractiveAnimationCoordinator:0];
LABEL_50:
}

uint64_t __60__UINavigationController__gestureRecognizedInteractiveHide___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setBarsHidden:*(unsigned char *)(a1 + 40) == 0 allowAnimation:1];
}

- (void)setHidesBarsWhenVerticallyCompact:(BOOL)hidesBarsWhenVerticallyCompact
{
  if (self->_hidesBarsWhenVerticallyCompact != hidesBarsWhenVerticallyCompact)
  {
    self->_hidesBarsWhenVerticallyCompact = hidesBarsWhenVerticallyCompact;
    if (hidesBarsWhenVerticallyCompact) {
      [(UINavigationController *)self _makeBarHideGestureIfNecessary];
    }
    [(UINavigationController *)self _configureBarTapGesture];
  }
}

- (void)setHidesBarsOnTap:(BOOL)hidesBarsOnTap
{
  if (self->_hidesBarsOnTap != hidesBarsOnTap)
  {
    self->_hidesBarsOnTap = hidesBarsOnTap;
    if (hidesBarsOnTap) {
      [(UINavigationController *)self _makeBarHideGestureIfNecessary];
    }
    [(UINavigationController *)self _configureBarTapGesture];
  }
}

- (void)_makeBarHideGestureIfNecessary
{
  if (!self->__barTapHideGesture)
  {
    id v3 = [[_UIBarTapGestureRecognizer alloc] initWithTarget:self action:sel__gestureRecognizedToggleVisibility_];
    barTapHideGesture = self->__barTapHideGesture;
    self->__barTapHideGesture = v3;

    id v5 = self->__barTapHideGesture;
    [(_UIBarTapGestureRecognizer *)v5 _setDelegate:self];
  }
}

- (UITapGestureRecognizer)barHideOnTapGestureRecognizer
{
  [(UINavigationController *)self _makeBarHideGestureIfNecessary];
  barTapHideGesture = self->__barTapHideGesture;
  return (UITapGestureRecognizer *)barTapHideGesture;
}

- (id)_existingToolbarWithItems
{
  uint64_t v2 = [(UINavigationController *)self _existingToolbar];
  id v3 = [v2 items];
  uint64_t v4 = [v3 count];

  if (!v4)
  {

    uint64_t v2 = 0;
  }
  return v2;
}

- (BOOL)_shouldHideBarsForTraits:(id)a3
{
  return [a3 verticalSizeClass] == 1 && self->_hidesBarsWhenVerticallyCompact;
}

- (BOOL)_useCrossFadeForGestureHiding
{
  id v3 = [(UIViewController *)self traitCollection];
  BOOL v4 = [(UINavigationController *)self _shouldHideBarsForTraits:v3];

  return v4
      && [(UIViewController *)self preferredStatusBarUpdateAnimation] == UIStatusBarAnimationFade;
}

- (void)_gestureRecognizedToggleVisibility:(id)a3
{
  unint64_t v5 = [a3 tapCategory];
  unint64_t v6 = v5;
  if (v5 <= 5)
  {
    if (((1 << v5) & 0x15) != 0) {
      return;
    }
    if (((1 << v5) & 0x28) == 0)
    {
      if (self->_hidesBarsOnTap)
      {
        uint64_t v9 = [(UINavigationController *)self _navigationBarForNestedNavigationController];

        if (v9)
        {
          BOOL v10 = [(UINavigationController *)self isNavigationBarHidden];
        }
        else
        {
          double v11 = [(UINavigationController *)self _existingToolbarWithItems];

          if (!v11) {
            return;
          }
          BOOL v10 = [(UINavigationController *)self isToolbarHidden];
        }
        BOOL v8 = !v10;
        uint64_t v7 = self;
        goto LABEL_6;
      }
      if (!self->_hidesBarsWhenVerticallyCompact) {
        return;
      }
    }
    uint64_t v7 = self;
    BOOL v8 = 0;
LABEL_6:
    [(UINavigationController *)v7 _setBarsHidden:v8];
    return;
  }
  id v12 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UINavigationController.m", 10135, @"Unknown tap gesture category %li", v6);
}

- (void)_setBarsHidden:(BOOL)a3
{
  BOOL v5 = [(UINavigationController *)self _useCrossFadeForGestureHiding];
  unint64_t v6 = objc_alloc_init(_UIAnimationCoordinator);
  uint64_t v7 = [(UINavigationController *)self _outermostNavigationController];
  self;
  _durationOfSpringAnimation(1.0, 900.0, 50.0, 10.0);
  -[_UIAnimationCoordinator setDuration:](v6, "setDuration:");
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __41__UINavigationController__setBarsHidden___block_invoke;
  v21[3] = &unk_1E52E8B70;
  v21[4] = self;
  [(_UIAnimationCoordinator *)v6 setPreperation:v21];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __41__UINavigationController__setBarsHidden___block_invoke_2;
  uint64_t v16 = &unk_1E52E8B98;
  BOOL v19 = a3;
  BOOL v20 = v5;
  id v17 = v7;
  double v18 = self;
  id v8 = v7;
  [(_UIAnimationCoordinator *)v6 setAnimator:&v13];
  uint64_t v9 = objc_msgSend(v8, "_existingView", v13, v14, v15, v16);
  [(_UIAnimationCoordinator *)v6 setContainerView:v9];

  BOOL v10 = [v8 topViewController];
  [(_UIAnimationCoordinator *)v6 setViewController:v10];

  double v11 = [v8 topViewController];
  id v12 = [v11 view];
  [v12 frame];
  -[_UIAnimationCoordinator setStartFrame:](v6, "setStartFrame:");

  [(_UIAnimationCoordinator *)v6 animate];
}

void __41__UINavigationController__setBarsHidden___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  id v3 = *(void **)(a1 + 32);
  BOOL v4 = [v3 topViewController];
  [v3 _frameForViewController:v4];
  objc_msgSend(v19, "setEndFrame:");

  [v19 startFrame];
  double v6 = v5;
  double v8 = v7;
  [v19 endFrame];
  if (v6 != v10 || v8 != v9)
  {
    id v12 = [v19 viewController];
    [v19 endFrame];
    double v14 = v13;
    double v16 = v15;
    id v17 = [v19 transitionContext];
    double v18 = [v17 _transitionCoordinator];
    objc_msgSend(v12, "viewWillTransitionToSize:withTransitionCoordinator:", v18, v14, v16);
  }
}

void __41__UINavigationController__setBarsHidden___block_invoke_2(uint64_t a1, void *a2)
{
  id v16 = a2;
  id v3 = [*(id *)(a1 + 32) _existingNavigationBar];
  if (v3)
  {
    BOOL v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
    if (*(unsigned char *)(a1 + 49)) {
      uint64_t v6 = 15;
    }
    else {
      uint64_t v6 = 1;
    }
    [v16 duration];
    objc_msgSend(v4, "_setNavigationBarHidden:edge:duration:", v5, v6);
  }
  double v7 = [*(id *)(a1 + 40) _existingToolbarWithItems];

  if (v7)
  {
    double v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 48);
    if (*(unsigned char *)(a1 + 49)) {
      uint64_t v10 = 15;
    }
    else {
      uint64_t v10 = 4;
    }
    [v16 duration];
    objc_msgSend(v8, "_setToolbarHidden:edge:duration:", v9, v10);
  }
  double v11 = [*(id *)(a1 + 40) _outermostNavigationController];
  id v12 = [v11 topViewController];
  double v13 = [v12 view];
  [v13 setNeedsLayout];

  double v14 = [v11 topViewController];
  double v15 = [v14 view];
  [v15 layoutIfNeeded];
}

- (void)_setBarsHidden:(BOOL)a3 allowAnimation:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v6 = +[UIView areAnimationsEnabled] & a4;
  double v7 = [(UINavigationController *)self _navigationBarForNestedNavigationController];

  if (v7) {
    [(UINavigationController *)self setNavigationBarHidden:v4 animated:v6];
  }
  double v8 = [(UINavigationController *)self _existingToolbarWithItems];

  if (v8) {
    [(UINavigationController *)self setToolbarHidden:v4 animated:v6];
  }
  id v13 = [(UINavigationController *)self _outermostNavigationController];
  uint64_t v9 = [v13 topViewController];
  uint64_t v10 = [v9 view];
  [v10 setNeedsLayout];

  double v11 = [v13 topViewController];
  id v12 = [v11 view];
  [v12 layoutIfNeeded];
}

- (id)defaultPNGName
{
  uint64_t v2 = [(UINavigationController *)self topViewController];
  id v3 = [v2 defaultPNGName];

  return v3;
}

- (void)_setNavigationSoundsEnabled:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t navigationControllerFlags = *(void *)&self->_navigationControllerFlags & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)_navigationSoundsEnabled
{
  return (*(void *)&self->_navigationControllerFlags >> 52) & 1;
}

- (BOOL)_shouldOverlayTabBar
{
  return ![(UINavigationController *)self isNavigationBarHidden];
}

- (CGSize)_adjustedContentSizeForPopover:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  if ((*(_DWORD *)&self->_navigationControllerFlags & 1) == 0)
  {
    uint64_t v6 = [(UINavigationController *)self navigationBar];

    if (v6)
    {
      double v7 = [(UINavigationController *)self navigationBar];
      [v7 bounds];
      double height = height + v8;
    }
  }
  if ((*(void *)&self->_navigationControllerFlags & 2) != 0)
  {
    uint64_t v9 = [(UINavigationController *)self _existingToolbar];

    if (v9)
    {
      uint64_t v10 = [(UINavigationController *)self toolbar];
      [v10 bounds];
      double height = height + v11;
    }
  }
  double v12 = width;
  double v13 = height;
  result.double height = v13;
  result.CGFloat width = v12;
  return result;
}

- (void)setContentSizeForViewInPopover:(CGSize)a3
{
  -[UINavigationController _adjustedContentSizeForPopover:](self, "_adjustedContentSizeForPopover:", a3.width, a3.height);
  v4.receiver = self;
  v4.super_class = (Class)UINavigationController;
  -[UIViewController setContentSizeForViewInPopover:](&v4, sel_setContentSizeForViewInPopover_);
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_externallySetNavControllerPreferredContentSize = a3;
  if (a3.width != *MEMORY[0x1E4F1DB30] || a3.height != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    -[UINavigationController _adjustedContentSizeForPopover:](self, "_adjustedContentSizeForPopover:");
  }
  v5.receiver = self;
  v5.super_class = (Class)UINavigationController;
  -[UIViewController setPreferredContentSize:](&v5, sel_setPreferredContentSize_);
}

- (CGSize)contentSizeForViewInPopover
{
  uint64_t v3 = [(UINavigationController *)self topViewController];

  if (v3)
  {
    objc_super v4 = [(UINavigationController *)self topViewController];
    [v4 view];

    objc_super v5 = [(UINavigationController *)self topViewController];
    [v5 contentSizeForViewInPopover];
    double v7 = v6;
    double v9 = v8;

    -[UINavigationController _adjustedContentSizeForPopover:](self, "_adjustedContentSizeForPopover:", v7, v9);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UINavigationController;
    [(UIViewController *)&v12 contentSizeForViewInPopover];
  }
  result.double height = v11;
  result.CGFloat width = v10;
  return result;
}

- (BOOL)isModalInPopover
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(UIViewController *)self mutableChildViewControllers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) isModalInPresentation])
        {

          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)UINavigationController;
  BOOL v8 = [(UIViewController *)&v10 isModalInPopover];
LABEL_11:

  return v8;
}

- (id)_viewForContentInPopover
{
  uint64_t v3 = [(UIViewController *)self childModalViewController];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [(UIViewController *)self childModalViewController],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isModalInPopover],
        v5,
        v4,
        v6))
  {
    double v7 = [(UIViewController *)self childModalViewController];
    BOOL v8 = [v7 _viewForContentInPopover];
  }
  else
  {
    BOOL v8 = [(UIViewController *)self view];
  }
  return v8;
}

- (void)_willBecomeContentViewControllerOfPopover:(id)a3
{
  [(UIViewController *)self _setPopoverController:a3];
  if (self->_navigationBar)
  {
    uint64_t v4 = [(UINavigationController *)self navigationBar];
    if ([v4 barStyle])
    {
LABEL_3:

      goto LABEL_5;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._popoverController);
    uint64_t v6 = [WeakRetained _popoverControllerStyle];

    if (!v6)
    {
      objc_super v10 = [(UINavigationController *)self navigationBar];
      self->_savedNavBarStyleBeforeSheet = [v10 barStyle];

      uint64_t v4 = [(UINavigationController *)self navigationBar];
      [v4 setBarStyle:4];
      goto LABEL_3;
    }
  }
LABEL_5:
  if (!self->_toolbar) {
    goto LABEL_9;
  }
  double v7 = [(UINavigationController *)self toolbar];
  if ([v7 barStyle]) {
    goto LABEL_7;
  }
  id v8 = objc_loadWeakRetained((id *)&self->super._popoverController);
  uint64_t v9 = [v8 _popoverControllerStyle];

  if (!v9)
  {
    long long v11 = [(UINavigationController *)self toolbar];
    self->_savedToolBarStyleBeforeSheet = [v11 barStyle];

    double v7 = [(UINavigationController *)self toolbar];
    [v7 setBarStyle:4];
LABEL_7:
  }
LABEL_9:
  [(UINavigationController *)self _setClipUnderlapWhileTransitioning:1];
  [(UINavigationController *)self _startDeferredTransitionIfNeeded];
}

- (void)_didBecomeContentViewControllerOfPopover:(id)a3
{
}

- (void)_didResignContentViewControllerOfPopover:(id)a3
{
  id v17 = a3;
  [(UINavigationController *)self _setClipUnderlapWhileTransitioning:0];
  id v4 = [(UIViewController *)self _popoverController];

  if (v4 == v17)
  {
    [(UIViewController *)self _setPopoverController:0];
    uint64_t v5 = [(UINavigationController *)self navigationBar];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      double v7 = [(UINavigationController *)self navigationBar];
      uint64_t v8 = [v7 barStyle];

      if (v8 == 4)
      {
        int64_t savedNavBarStyleBeforeSheet = self->_savedNavBarStyleBeforeSheet;
        objc_super v10 = [(UINavigationController *)self navigationBar];
        [v10 setBarStyle:savedNavBarStyleBeforeSheet];
      }
    }
    uint64_t v11 = [(UINavigationController *)self toolbar];
    if (v11)
    {
      long long v12 = (void *)v11;
      long long v13 = [(UINavigationController *)self toolbar];
      uint64_t v14 = [v13 barStyle];

      if (v14 == 4)
      {
        int64_t savedToolBarStyleBeforeSheet = self->_savedToolBarStyleBeforeSheet;
        uint64_t v16 = [(UINavigationController *)self toolbar];
        [v16 setBarStyle:savedToolBarStyleBeforeSheet];
      }
    }
  }
  [v17 _stopWatchingForNavigationControllerNotifications:self];
}

- (BOOL)_isExecutingSplitViewControllerActions
{
  return ((unint64_t)*((unsigned __int8 *)&self->_navigationControllerFlags + 8) >> 1) & 1;
}

- (id)_navigationBarAdditionalActionsForBackButtonMenu:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIViewController *)self _splitViewControllerEnforcingClass:1];
  uint64_t v6 = [v5 _navigationController:self navigationBarAdditionalActionsForBackButtonMenu:v4];

  return v6;
}

- (BOOL)_navigationBarShouldShowSidebarToggleInNSToolbar:(id)a3
{
  uint64_t v3 = [(UIViewController *)self _splitViewControllerEnforcingClass:1];
  char v4 = [v3 _needsNSToolbarSidebarToggle];

  return v4;
}

- (id)_separateViewControllersAfterAndIncludingViewController:(id)a3 forSplitViewController:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(UINavigationController *)self topViewController];
  double v7 = (void *)v6;
  if (v5) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = (void *)v6;
  }
  uint64_t v9 = v8;
  objc_super v10 = [(UINavigationController *)self viewControllers];
  uint64_t v11 = v10;
  id v12 = (id)MEMORY[0x1E4F1CBF0];
  if (v9)
  {
    uint64_t v13 = [v10 indexOfObject:v9];
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v22 = v9;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      goto LABEL_23;
    }
    uint64_t v14 = v13;
    if ([v9 _isNavigationController])
    {
      unint64_t navigationControllerFlags = (unint64_t)self->_navigationControllerFlags;
      v9[154] = v9[154] & 0xFFFF7FFFFFFFFFFFLL | (((navigationControllerFlags >> 47) & 1) << 47);
      if ((navigationControllerFlags & 0x800000000000) != 0)
      {
        *(void *)&self->_navigationControllerFlags &= ~0x800000000000uLL;
        [(UINavigationController *)self setNavigationBarHidden:0];
      }
    }
    if (v5 || v14 != [v11 count] - 1)
    {
      if (!v14)
      {
        [(UINavigationController *)self setViewControllers:MEMORY[0x1E4F1CBF0] animated:0];
        id v19 = 0;
        goto LABEL_19;
      }
      id v17 = [v11 objectAtIndexedSubscript:v14 - 1];
      uint64_t v18 = [(UINavigationController *)self popToViewController:v17 animated:0];
    }
    else
    {
      uint64_t v16 = [(UINavigationController *)self popViewControllerAnimated:0];
      id v17 = (void *)v16;
      if (!v16)
      {
        id v19 = 0;
        goto LABEL_17;
      }
      v23[0] = v16;
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    }
    id v19 = (void *)v18;
LABEL_17:

LABEL_19:
    if (v19) {
      BOOL v20 = v19;
    }
    else {
      BOOL v20 = v12;
    }
    id v12 = v20;
  }
LABEL_23:

  return v12;
}

- (id)_moreListTitle
{
  uint64_t v2 = [(UINavigationController *)self bottomViewController];
  uint64_t v3 = [v2 _moreListTitle];

  return v3;
}

- (id)moreListImage
{
  uint64_t v2 = [(UINavigationController *)self bottomViewController];
  uint64_t v3 = [v2 moreListImage];

  return v3;
}

- (id)moreListSelectedImage
{
  uint64_t v2 = [(UINavigationController *)self bottomViewController];
  uint64_t v3 = [v2 moreListSelectedImage];

  return v3;
}

- (id)moreListTableCell
{
  uint64_t v2 = [(UINavigationController *)self bottomViewController];
  uint64_t v3 = [v2 moreListTableCell];

  return v3;
}

- (void)transitionConductor:(id)a3 didStartCustomTransitionWithContext:(id)a4
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 toViewController];
  double v7 = [v5 fromViewController];
  uint64_t v8 = [v7 navigationItem];
  uint64_t v9 = [v8 _searchControllerIfAllowed];

  if ([v9 isActive]) {
    [v9 _setTransitioningOutWithoutDisappearing:1];
  }
  v87 = v9;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UINavigationController", &qword_1EB25A8E8);
  uint64_t v11 = *(id *)(CategoryCachedImpl + 8);
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self);
  char v89 = v5;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      Name = class_getName(v14);
      uint64_t v16 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 67240706;
      int v104 = 1;
      __int16 v105 = 2082;
      uint64_t v106 = Name;
      id v5 = v89;
      __int16 v107 = 2082;
      CGRect v108 = class_getName(v16);
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "NavigationTransition", " enableTelemetry=YES  isAnimation=YES custom=%{signpost.telemetry:number1,signpost.description:attribute,public}u, from=%{signpost.telemetry:string1,public}s to=%{signpost.telemetry:string2,public}s", buf, 0x1Cu);
    }
  }

  *(void *)&self->_navigationControllerFlags |= 4uLL;
  id v17 = [(UINavigationController *)self _outermostNavigationController];
  v17[154] |= 8uLL;

  *(void *)&self->_navigationControllerFlags |= 0x10000uLL;
  uint64_t v18 = [(UIViewController *)self _focusSystem];
  [v18 _lockEnvironment:self];

  uint64_t v19 = *(void *)&self->_navigationControllerFlags & 0xF0;
  id v88 = [v5 _transitionCoordinator];
  BOOL v20 = [(UIViewController *)self presentedViewController];
  double v21 = [v20 activePresentationController];
  double v22 = [(_UIViewControllerTransitionConductor *)self->_transitionConductor interactiveTransitionController];
  if (v19 != 16)
  {
    if (v20)
    {
      if ([v21 _shouldDismissWithNavigationPop])
      {
        double v23 = [v21 _sourceViewController];
        int v24 = [v23 _isMemberOfViewControllerHierarchy:v7];

        if (v24)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0
            && [v22 _supportsCoordinatedPresentationDismissal])
          {
            double v25 = objc_alloc_init(_UIPresentedViewControllerInteractivePopTransitioningDelegate);
            uint64_t v26 = [UIViewControllerBuiltinTransitionViewAnimator alloc];
            int v27 = [(UIViewController *)self view];
            if ([v27 _shouldReverseLayoutDirection]) {
              uint64_t v28 = 1;
            }
            else {
              uint64_t v28 = 2;
            }
            double v29 = [(UIViewControllerBuiltinTransitionViewAnimator *)v26 initWithTransition:v28];
            [(_UIPresentedViewControllerInteractivePopTransitioningDelegate *)v25 setAnimator:v29];

            [(_UIPresentedViewControllerInteractivePopTransitioningDelegate *)v25 setInteractor:v22];
          }
          else
          {
            double v25 = 0;
          }
          v97[0] = MEMORY[0x1E4F143A8];
          v97[1] = 3221225472;
          v97[2] = __82__UINavigationController_transitionConductor_didStartCustomTransitionWithContext___block_invoke;
          v97[3] = &unk_1E52E8E00;
          id v98 = v25;
          id v99 = v20;
          id v100 = v21;
          uint64_t v101 = self;
          v95[0] = MEMORY[0x1E4F143A8];
          v95[1] = 3221225472;
          v95[2] = __82__UINavigationController_transitionConductor_didStartCustomTransitionWithContext___block_invoke_2;
          v95[3] = &unk_1E52DA598;
          id v96 = v99;
          double v30 = v25;
          [v88 animateAlongsideTransition:v97 completion:v95];
        }
      }
    }
  }
  id v31 = [(UINavigationController *)self topViewController];
  BOOL v32 = v31;
  CGFloat v90 = v7;
  id v84 = v22;
  if (v31 != v6)
  {
    id v33 = v31;

    id v6 = v33;
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  objc_super v34 = [(UIViewController *)self mutableChildViewControllers];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v91 objects:v102 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v92;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v92 != v37) {
          objc_enumerationMutation(v34);
        }
        id v39 = *(id *)(*((void *)&v91 + 1) + 8 * i);
        if (v39 != v6 && [*(id *)(*((void *)&v91 + 1) + 8 * i) _isContainmentChanging]) {
          [v39 didMoveToParentViewController:self];
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v91 objects:v102 count:16];
    }
    while (v36);
  }

  BOOL v40 = [(UINavigationController *)self _isAppearingOrAppearedCheck];
  if (v40)
  {
    if ((*(void *)&self->_navigationControllerFlags & 0x1000) != 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"custom navigation transition - no popping between different orienations!"];
    }
    [v90 beginAppearanceTransition:0 animated:1];
    [v6 beginAppearanceTransition:1 animated:1];
  }
  BOOL v85 = v21;
  if (dyld_program_sdk_at_least())
  {
    uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_delegate);
  }
  else
  {
    uint64_t WeakRetained = [(UINavigationController *)self delegate];
  }
  double v42 = (void *)WeakRetained;
  if (v40 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v43 = [(UINavigationController *)self topViewController];
    int v44 = 1;
    [v42 navigationController:self willShowViewController:v43 animated:1];
  }
  else
  {
    int v44 = 0;
  }
  BOOL v86 = v20;
  id v45 = [(UINavigationController *)self topViewController];

  if (v6 == v45)
  {
    id v47 = v6;
  }
  else
  {
    do
    {
      double v46 = [v6 parentViewController];
      [v6 didMoveToParentViewController:v46];

      [v6 cancelBeginAppearanceTransition];
      [v45 view];

      id v47 = v45;
      [v47 beginAppearanceTransition:1 animated:1];
      if (v44)
      {
        char v48 = [(UINavigationController *)self topViewController];
        [v42 navigationController:self willShowViewController:v48 animated:1];
      }
      id v45 = [(UINavigationController *)self topViewController];

      id v6 = v47;
    }
    while (v47 != v45);
  }
  [(UINavigationController *)self _privateWillShowViewController:v47];
  [(UINavigationController *)self _setDefinesPresentationContextIfNecessaryForViewController:v47];
  double v49 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  char v50 = v49;
  if (v90) {
    [v49 setObject:v90 forKey:@"UINavigationControllerLastVisibleViewController"];
  }
  if (v47) {
    [v50 setObject:v47 forKey:@"UINavigationControllerNextVisibleViewController"];
  }
  double v51 = [NSNumber numberWithBool:1];
  [v50 setObject:v51 forKey:@"UINavigationControllerTransitionIsAnimated"];

  double v52 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v52 postNotificationName:@"UINavigationControllerWillShowViewControllerNotification" object:self userInfo:v50];

  [(UINavigationController *)self _startToolbarTransitionIfNecessary:v89 animated:1];
  [(UINavigationController *)self _startPaletteTransitionIfNecessary:v88 animated:1];
  double v53 = [(UINavigationController *)self _outermostNavigationController];
  double v54 = [v53 _tabBarControllerEnforcingClass:1];
  double v55 = v54;
  if (v54) {
    int v56 = [v54 _isBarEffectivelyHidden] ^ 1;
  }
  else {
    int v56 = 0;
  }
  int v57 = [v53 _hasPotentiallyChromelessBottomBar];
  unint64_t navigationControllerFlags = (unint64_t)self->_navigationControllerFlags;
  char v59 = *((unsigned char *)&self->_navigationControllerFlags + 8);
  if (!v57)
  {
    *(void *)&self->_unint64_t navigationControllerFlags = navigationControllerFlags & 0xBFFFFFFFFFFFFFFFLL;
    *((unsigned char *)&self->_navigationControllerFlags + 8) = v59;
    [v89 _setNeedsBottomBarCrossfade:0];
    goto LABEL_62;
  }
  if ((navigationControllerFlags & 0x4000000000000000) != 0)
  {
    uint64_t v60 = (navigationControllerFlags >> 45) & 1;
    *(void *)&self->_unint64_t navigationControllerFlags = navigationControllerFlags & 0xBFFFFFFFFFFFFFFFLL;
    *((unsigned char *)&self->_navigationControllerFlags + 8) = v59;
    [v89 _setNeedsBottomBarCrossfade:v60];
    if ((v60 & 1) == 0) {
      goto LABEL_62;
    }
  }
  else
  {
    *(void *)&self->_unint64_t navigationControllerFlags = navigationControllerFlags & 0xBFFFFFFFFFFFFFFFLL;
    *((unsigned char *)&self->_navigationControllerFlags + 8) = v59;
    [v89 _setNeedsBottomBarCrossfade:1];
  }
  if (v56) {
    [v55 _setSuspendBarBackgroundUpdating:1];
  }
  else {
    [v53 _setSuspendToolbarBackgroundUpdating:1];
  }
LABEL_62:
  [(UINavigationController *)self _updateScrollViewFromViewController:v90 toViewController:v47];
  uint64_t v61 = [(UINavigationController *)self _deferredTransition];
  if (v61)
  {
    uint64_t v62 = v61;
    id v63 = [(UINavigationController *)self _keyboardAnimationStyle];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(void *)&self->_navigationControllerFlags |= 0x200uLL;
      id v64 = [(UINavigationController *)self _window];
      int v65 = [v64 isTrackingKeyboard];

      if (v65)
      {
        unint64_t v66 = [(UINavigationController *)self _keyboardScreenEdgeForTransition:v62];
        if (([v63 disableAlongsideView] & 1) == 0)
        {
          char v67 = [(UINavigationController *)self _window];
          [v67 moveKeyboardLayoutGuideOverEdge:v66 layoutViews:1];

          if (!self->_keyboardLayoutGuideTransitionAssertion) {
            goto LABEL_67;
          }
          if (os_variant_has_internal_diagnostics())
          {
            BOOL v83 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1853B0000, v83, OS_LOG_TYPE_FAULT, "Should not already have a KLG transition assertion when starting a custom navigation transition", buf, 2u);
            }
          }
          else
          {
            id v82 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25A8F0) + 8);
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1853B0000, v82, OS_LOG_TYPE_ERROR, "Should not already have a KLG transition assertion when starting a custom navigation transition", buf, 2u);
            }
          }
          if (!self->_keyboardLayoutGuideTransitionAssertion)
          {
LABEL_67:
            char v68 = [(UINavigationController *)self _window];
            BOOL v69 = [v68 _obtainKeyboardLayoutGuideTransitionAssertionForReason:@"UINavigationController custom transition"];
            keyboardLayoutGuideTransitionAssertion = self->_keyboardLayoutGuideTransitionAssertion;
            self->_keyboardLayoutGuideTransitionAssertion = v69;
          }
        }
      }
      double v71 = -[UIViewController _keyboardSceneDelegate](self);
      [v71 pushAnimationStyle:v63];
    }
  }
  int v72 = NSString;
  BOOL v73 = self;
  BOOL v74 = (objc_class *)objc_opt_class();
  id v75 = NSStringFromClass(v74);
  id v76 = [v72 stringWithFormat:@"<%@: %p>", v75, v73];

  uint64_t v77 = [v72 stringWithFormat:@"UINavigationController transition : %@", v76];

  BOOL v78 = [(UIViewController *)v73 view];
  char v79 = [v78 window];
  uint64_t v80 = -[UIWindow _acquireOrientationLockAssertionWithReason:](v79, v77);
  windowRotationLockAssertion = v73->_windowRotationLockAssertion;
  v73->_windowRotationLockAssertion = (_UIInvalidatable *)v80;

  *(void *)&self->_navigationControllerFlags &= ~0x20000000000000uLL;
  objc_msgSend(v89, "_setPerformingLayoutToLayoutTransition:", -[UINavigationController _isPerformingLayoutToLayoutTransition](v73, "_isPerformingLayoutToLayoutTransition"));
}

void __82__UINavigationController_transitionConductor_didStartCustomTransitionWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "_setOverrideTransitioningDelegate:");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = *(void **)(a1 + 48);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  objc_msgSend(v4, "set_dismissingHorizontallyAlongsideNavigationPop:", 1);
  [*(id *)(a1 + 56) dismissViewControllerAnimated:1 completion:0];
  objc_msgSend(v4, "set_dismissingHorizontallyAlongsideNavigationPop:", 0);
}

uint64_t __82__UINavigationController_transitionConductor_didStartCustomTransitionWithContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setOverrideTransitioningDelegate:0];
}

- (void)transitionConductor:(id)a3 didEndCustomTransitionWithContext:(id)a4 didComplete:(BOOL)a5
{
  BOOL v5 = a5;
  id v48 = a4;
  double v7 = [v48 fromViewController];
  uint64_t v8 = [v48 toViewController];
  uint64_t v9 = [v48 viewForKey:@"UITransitionContextFromView"];
  objc_super v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v7 view];
  }
  os_signpost_id_t v12 = v11;

  os_signpost_id_t v13 = [v7 navigationItem];
  uint64_t v14 = [v13 _searchControllerIfAllowed];

  [v14 _setTransitioningOutWithoutDisappearing:0];
  int v15 = [v48 _needsBottomBarCrossfade];
  uint64_t v16 = v48;
  if (v15)
  {
    int v17 = [v48 _transitioningBottomBarIsTabBar];
    uint64_t v18 = [(UINavigationController *)self _outermostNavigationController];
    uint64_t v19 = [v18 _tabBarControllerEnforcingClass:1];
    BOOL v20 = v19;
    if (v17)
    {
      if ([v19 _suspendBarBackgroundUpdating])
      {
        id v47 = v12;
        [v20 _setSuspendBarBackgroundUpdating:0];
        double v21 = [v18 _viewControllerForObservableScrollView];
        double v22 = [v21 _contentOrObservableScrollViewForEdge:4];
        double v23 = [v20 tabBar];
        [v20 _updateBackgroundTransitionProgressForScrollView:v22 tabBar:v23 isNavigationTransitionUpdate:1];
LABEL_10:

        os_signpost_id_t v12 = v47;
      }
    }
    else if ([v18 _suspendToolbarBackgroundUpdating])
    {
      id v47 = v12;
      [v18 _setSuspendToolbarBackgroundUpdating:0];
      double v21 = [v18 _viewControllerForObservableScrollView];
      double v22 = [v21 _contentOrObservableScrollViewForEdge:4];
      double v23 = [v18 _existingActiveVisibleToolbar];
      [v18 _updateBackgroundTransitionProgressForScrollView:v22 toolbar:v23 isNavigationTransitionUpdate:1];
      goto LABEL_10;
    }

    uint64_t v16 = v48;
  }
  int v24 = [v16 containerView];
  if (v5)
  {
    double v25 = [(UINavigationController *)self topViewController];
    [(UINavigationController *)self _didEndTransitionFromView:v12 toView:v24 wasCustom:1];
    [(UINavigationController *)self _setPreferredContentSizeFromChildContentContainer:v25];
  }
  else
  {
    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    double v25 = v26;
    if (v7) {
      [v26 setObject:v7 forKey:@"UINavigationControllerNextVisibleViewController"];
    }
    if (v8) {
      [v25 setObject:v8 forKey:@"UINavigationControllerLastVisibleViewController"];
    }
    int v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v48, "isAnimated"));
    [v25 setObject:v27 forKey:@"UINavigationControllerTransitionIsAnimated"];

    uint64_t v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 postNotificationName:@"UINavigationControllerWillShowViewControllerNotification" object:self userInfo:v25];

    [(UINavigationController *)self _forgetFocusedItemForViewController:v7];
    [(UINavigationController *)self _didCancelTransitionFromViewController:v7 toViewController:v8 wrapperView:v24 wasCustom:1];
  }

  double v29 = [(UIViewController *)self _focusSystem];
  [v29 _unlockEnvironment:self];

  overrideTraitCollectionForPoppingViewControler = self->_overrideTraitCollectionForPoppingViewControler;
  self->_overrideTraitCollectionForPoppingViewControler = 0;

  objc_msgSend(v7, "set_departingParentViewController:", 0);
  *(void *)&self->_navigationControllerFlags &= 0xFFFFFFFFFFFCFFFFLL;
  id v31 = [v48 _postInteractiveCompletionHandler];

  if (v31)
  {
    BOOL v32 = [v48 _postInteractiveCompletionHandler];
    v32[2]();

    [v48 _setPostInteractiveCompletionHandler:0];
  }
  if ([v48 isInterruptible])
  {
    [(_UIViewControllerTransitionConductor *)self->_transitionConductor setCustomNavigationTransitionDuration:0.0];
    [(UINavigationController *)self setInteractiveTransition:0];
  }
  uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags;
  if ([v48 _isPerformingLayoutToLayoutTransition])
  {
    objc_super v34 = v24;
    uint64_t v35 = v14;
    uint64_t v36 = v12;
    uint64_t v37 = navigationControllerFlags & 0xF0;
    CGRect v38 = [v7 view];
    if (v5)
    {
      id v39 = [v8 _uiCollectionView];
      BOOL v40 = [v39 delegate];

      if (v40 == v7)
      {
        double v41 = [v8 _uiCollectionView];
        [v41 setDelegate:v8];
      }
      double v42 = v7;
      if (v37 == 16) {
        goto LABEL_31;
      }
    }
    else
    {
      double v43 = [v7 _uiCollectionView];
      [v38 addSubview:v43];

      double v42 = v8;
      if (v37 != 16)
      {
LABEL_31:

        os_signpost_id_t v12 = v36;
        uint64_t v14 = v35;
        int v24 = v34;
        goto LABEL_32;
      }
    }
    [v42 _clearSharedView];
    goto LABEL_31;
  }
LABEL_32:
  if (![(UINavigationController *)self isInteractiveTransition]) {
    [(_UIViewControllerTransitionConductor *)self->_transitionConductor setCustomNavigationTransitionDuration:0.0];
  }
  [v48 _setTransitionIsInFlight:0];
  [v48 _setInteractor:0];
  [v48 _setAnimator:0];
  [(_UIViewControllerTransitionConductor *)self->_transitionConductor setTransitionController:0];
  [(_UIViewControllerTransitionConductor *)self->_transitionConductor setInteractiveTransitionController:0];
  int v44 = [(UINavigationController *)self navigationBar];
  id v45 = v44;
  if (v44) {
    [v44 _reenableUserInteractionWhenReadyWithContext:v48];
  }
  else {
    [v48 _enableInteractionForDisabledViews];
  }
  [(_UIInvalidatable *)self->_windowRotationLockAssertion _invalidate];
  windowRotationLockAssertion = self->_windowRotationLockAssertion;
  self->_windowRotationLockAssertion = 0;

  [(UINavigationController *)self _setUsingBuiltinAnimator:0];
}

- (void)transitionConductor:(id)a3 interactiveTransitionDidUpdateProgress:(double)a4 finish:(BOOL)a5 transitionCompleted:(BOOL)a6 transitionContext:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v13 = a3;
  id v12 = a7;
  if (v9 && v8)
  {
    [(UINavigationController *)self _finishInteractiveTransition:v12 transitionContext:a4];
  }
  else if (v9)
  {
    [(UINavigationController *)self _cancelInteractiveTransition:v12 transitionContext:a4];
  }
  else
  {
    [(UINavigationController *)self _updateInteractiveTransition:a4];
  }
}

- (_UIViewControllerTransitionConductor)_transitionConductor
{
  return self->_transitionConductor;
}

- (Class)_toolbarClass
{
  return self->_toolbarClass;
}

- (BOOL)hidesBarsWhenKeyboardAppears
{
  return self->_hidesBarsWhenKeyboardAppears;
}

- (BOOL)hidesBarsOnSwipe
{
  return self->_hidesBarsOnSwipe;
}

- (BOOL)hidesBarsWhenVerticallyCompact
{
  return self->_hidesBarsWhenVerticallyCompact;
}

- (BOOL)hidesBarsOnTap
{
  return self->_hidesBarsOnTap;
}

- (double)_builtinTransitionGap
{
  return self->_builtinTransitionGap;
}

- (int64_t)_preferredNavigationBarPosition
{
  return self->__preferredNavigationBarPosition;
}

- (void)_setPositionBarsExclusivelyWithSafeArea:(BOOL)a3
{
  self->__positionBarsExclusivelyWithSafeArea = a3;
}

- (void)_setUsingBuiltinAnimator:(BOOL)a3
{
  self->__usingBuiltinAnimator = a3;
}

- (BOOL)_shouldIgnoreDelegateTransitionController
{
  return self->__shouldIgnoreDelegateTransitionController;
}

- (void)_setShouldIgnoreDelegateTransitionController:(BOOL)a3
{
  self->__shouldIgnoreDelegateTransitionController = a3;
}

- (void)_setNavbarAnimationId:(id)a3
{
}

- (void)_setToolbarAnimationWasCancelled:(BOOL)a3
{
  self->__toolbarAnimationWasCancelled = a3;
}

- (void)_setNavigationBarAnimationWasCancelled:(BOOL)a3
{
  self->__navigationBarAnimationWasCancelled = a3;
}

- (BOOL)_wantsTabCrossFadeTransition
{
  return self->__wantsTabCrossFadeTransition;
}

- (void)_setWantsTabCrossfadeTransition:(BOOL)a3
{
  self->__wantsTabCrossFadeTransition = a3;
}

- (void)_setUpdateNavigationBarHandler:(id)a3
{
}

- (UIFocusContainerGuide)_contentFocusContainerGuide
{
  return self->_contentFocusContainerGuide;
}

- (void)_setManagedTabGroup:(id)a3
{
}

- (id)_keyboardAppearedNotificationToken
{
  return self->__keyboardAppearedNotificationToken;
}

- (_UIBarPanGestureRecognizer)_barSwipeHideGesture
{
  return self->__barSwipeHideGesture;
}

- (_UIAnimationCoordinator)_barInteractiveAnimationCoordinator
{
  return self->__barInteractiveAnimationCoordinator;
}

- (_UIBarTapGestureRecognizer)_barTapHideGesture
{
  return self->__barTapHideGesture;
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIViewController *)self childViewControllers];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SChildViewCont.isa, "-[UINavigationController(StateRestoration) encodeRestorableStateWithCoder:]", v5);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__UINavigationController_StateRestoration__encodeRestorableStateWithCoder___block_invoke;
  v14[3] = &unk_1E52E8BC0;
  id v7 = v6;
  id v15 = v7;
  _UISaveReferencedChildViewControllers(v5, (uint64_t)v14);
  if ([(UINavigationController *)self _allowNestedNavigationControllers]) {
    [v4 encodeBool:1 forKey:@"kAllowsNestedNavigationControllerKey"];
  }
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SNavigationCon.isa, "-[UINavigationController(StateRestoration) encodeRestorableStateWithCoder:]", v7);
  }
  [v4 encodeObject:v7 forKey:@"kUIViewControllerChildrenKey"];
  uint64_t v8 = [(UINavigationController *)self topViewController];
  if (v8)
  {
    BOOL v9 = (void *)v8;
    objc_super v10 = [(UINavigationController *)self topViewController];
    id v11 = [v10 restorationIdentifier];

    if (!v11)
    {
      if (_UIStateRestorationDebugLogEnabled())
      {
        id v12 = [(UINavigationController *)self topViewController];
        NSLog(&cfstr_STopViewContro.isa, "-[UINavigationController(StateRestoration) encodeRestorableStateWithCoder:]", v12);
      }
      [(id)UIApp ignoreSnapshotOnNextApplicationLaunch];
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)UINavigationController;
  [(UIViewController *)&v13 encodeRestorableStateWithCoder:v4];
}

BOOL __75__UINavigationController_StateRestoration__encodeRestorableStateWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) addObject:v6];
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(&cfstr_SChildViewCont_0.isa, "-[UINavigationController(StateRestoration) encodeRestorableStateWithCoder:]_block_invoke", v5);
  }

  return v6 != 0;
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeBoolForKey:@"kAllowsNestedNavigationControllerKey"]) {
    [(UINavigationController *)self _setAllowNestedNavigationControllers:1];
  }
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"kUIViewControllerChildrenKey"];

  BOOL v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SNavigationCon_0.isa, "-[UINavigationController(StateRestoration) decodeRestorableStateWithCoder:]", v8);
  }
  uint64_t v10 = [v8 count];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    while (1)
    {
      objc_super v13 = [v8 objectAtIndex:v12];
      uint64_t v14 = +[UIResponder objectWithRestorationIdentifierPath:v13];
      if (!v14) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (_UIStateRestorationDebugLogEnabled()) {
          NSLog(&cfstr_InvalidObjectN.isa, v12, v13, v14);
        }
        goto LABEL_15;
      }
      [v9 addObject:v14];

      if (v11 == ++v12) {
        goto LABEL_16;
      }
    }
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_CanTFindChildV.isa, v12, v13);
    }
LABEL_15:
  }
LABEL_16:
  if ([v9 count])
  {
    [(UINavigationController *)self setViewControllers:v9];
    if ((*(void *)&self->_navigationControllerFlags & 4) == 0) {
      [(UINavigationController *)self _startDeferredTransitionIfNeeded];
    }
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    id v15 = [(UIResponder *)self _restorationIdentifierPath];
    NSLog(&cfstr_SNoChildViewCo.isa, "-[UINavigationController(StateRestoration) decodeRestorableStateWithCoder:]", v15, self);
  }
  v16.receiver = self;
  v16.super_class = (Class)UINavigationController;
  [(UIResponder *)&v16 decodeRestorableStateWithCoder:v4];
}

- (UIViewController)detailViewController
{
  return 0;
}

- (BOOL)isExpanded
{
  return 0;
}

- (id)_topPalette
{
  return self->_topPalette;
}

- (CGRect)_boundsForPalette:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v7 = [a3 boundaryEdge];
  if (v7)
  {
    if (v7 == 5 || v7 == 2)
    {
      uint64_t v8 = [(UINavigationController *)self _navigationBarForNestedNavigationController];
      [v8 bounds];
      double v10 = v9;
      double v12 = v11;
      CGFloat width = v13;
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Palettes currently can only have a top boundary edge or no boundary edge"];
      CGFloat height = 0.0;
      CGFloat width = 0.0;
      double v12 = 0.0;
      double v10 = 0.0;
    }
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DAD8];
    double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v14 = v10;
  double v15 = v12;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (id)_pinningBarForPalette:(id)a3
{
  id v4 = (void *)[a3 boundaryEdge];
  if (v4)
  {
    if (v4 == (void *)5 || v4 == (void *)2)
    {
      id v4 = [(UINavigationController *)self _navigationBarForNestedNavigationController];
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Palettes currently can only have a top boundary edge or no boundary edge"];
      id v4 = 0;
    }
  }
  return v4;
}

- (id)paletteForEdge:(unint64_t)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (_UIGetBarNavigationPaletteEnabled())
  {
    uint64_t v8 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, width, height);
    double v9 = [(_UINavigationBarPalette *)[_UINavigationBarBridgingPalette alloc] initWithContentView:v8];
  }
  else
  {
    -[UINavigationController _paletteForEdge:size:paletteClass:](self, "_paletteForEdge:size:paletteClass:", a3, objc_opt_class(), width, height);
    double v9 = (_UINavigationBarBridgingPalette *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)_managedSearchPaletteForEdge:(unint64_t)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v8 = objc_opt_class();
  return -[UINavigationController _paletteForEdge:size:paletteClass:](self, "_paletteForEdge:size:paletteClass:", a3, v8, width, height);
}

- (id)_paletteForEdge:(unint64_t)a3 size:(CGSize)a4 paletteClass:(Class)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a3 != 2 && a3 != 5)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UINavigationController.m" lineNumber:11689 description:@"Only edge = UIBoundaryEdgeTop and UIBoundaryEdgeTopAbove are currently supported!"];
  }
  char v12 = [(objc_class *)a5 isSubclassOfClass:objc_opt_class()];
  if (os_variant_has_internal_diagnostics())
  {
    if (v12) {
      goto LABEL_6;
    }
    int v24 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      goto LABEL_15;
    }
    double v25 = NSStringFromClass(a5);
    int v27 = 138412290;
    uint64_t v28 = v25;
    _os_log_fault_impl(&dword_1853B0000, v24, OS_LOG_TYPE_FAULT, "DEBUG ASSERTION: Requested to make a palette of a class that isn't a subclass of _UINavigationControllerPalette. Requested class = %@. Making a _UINavigationControllerPalette instead on release builds of UIKit.", (uint8_t *)&v27, 0xCu);
  }
  else
  {
    if (v12) {
      goto LABEL_6;
    }
    uint64_t v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_paletteForEdge_size_paletteClass____s_category) + 8);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    int v24 = v26;
    double v25 = NSStringFromClass(a5);
    int v27 = 138412290;
    uint64_t v28 = v25;
    _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "DEBUG ASSERTION: Requested to make a palette of a class that isn't a subclass of _UINavigationControllerPalette. Requested class = %@. Making a _UINavigationControllerPalette instead on release builds of UIKit.", (uint8_t *)&v27, 0xCu);
  }

LABEL_15:
LABEL_16:
  a5 = (Class)objc_opt_class();
LABEL_6:
  double v13 = (void *)[[a5 alloc] _initWithNavigationController:self forEdge:a3];
  -[UINavigationController _boundsForPalette:size:](self, "_boundsForPalette:size:", v13, width, height);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  objc_msgSend(v13, "_setSize:", width, height);
  objc_msgSend(v13, "setBounds:", v15, v17, v19, v21);
  double v22 = [(UINavigationController *)self _pinningBarForPalette:v13];
  [v13 setAutoresizingMask:0];
  [v13 _setPinningBar:v22];

  return v13;
}

- (void)_installPaletteIntoViewHierarchy:(id)a3
{
  id v11 = a3;
  id v4 = [(UINavigationController *)self navigationBar];
  id v5 = [(UIViewController *)self view];
  if ([v11 boundaryEdge] == 5)
  {
    [v5 insertSubview:v11 aboveSubview:v4];
  }
  else
  {
    paletteClippingView = self->_paletteClippingView;
    if (!paletteClippingView)
    {
      uint64_t v7 = [_UINavigationControllerPaletteClippingView alloc];
      uint64_t v8 = [(UIViewController *)self view];
      [v8 bounds];
      double v9 = -[UIView initWithFrame:](v7, "initWithFrame:");

      [(UIView *)v9 setAutoresizingMask:18];
      [(UIView *)v9 setPreservesSuperviewLayoutMargins:1];
      [v5 insertSubview:v9 belowSubview:v4];
      double v10 = self->_paletteClippingView;
      self->_paletteClippingView = v9;

      paletteClippingView = self->_paletteClippingView;
    }
    [(UIView *)paletteClippingView addSubview:v11];
  }
}

- (void)attachPalette:(id)a3 isPinned:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = (_UINavigationControllerPalette *)a3;
  if (_UIGetBarNavigationPaletteEnabled())
  {
    uint64_t v8 = v29;
    [(_UINavigationControllerPalette *)v8 setPinned:v4];
    self = [(UINavigationController *)self topViewController];
    double v9 = [(UINavigationController *)self navigationItem];
    [v9 _setBottomPalette:v8];

LABEL_3:
    goto LABEL_8;
  }
  if (!v29)
  {
    double v25 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v26 = *MEMORY[0x1E4F1C3C8];
    int v27 = NSStringFromSelector(a2);
    [v25 raise:v26, @"%@ requires a non-nil palette as its first argument!", v27 format];
  }
  double v10 = [(UINavigationController *)self _outermostNavigationController];
  if (v10 != self)
  {
    id v11 = v10;
    [(UINavigationController *)v10 attachPalette:v29 isPinned:v4];
    self = v11;
    goto LABEL_8;
  }
  char v12 = [(UINavigationController *)self navigationBar];
  double v13 = [v12 superview];
  if (v13
    || (uint64_t navigationControllerFlags = (uint64_t)self->_navigationControllerFlags,
        (navigationControllerFlags & 0x800000000000) != 0))
  {
  }
  else
  {

    if ((navigationControllerFlags & 0x8000) == 0)
    {
      NSLog(&cfstr_WarningAttempt.isa, v29);
      goto LABEL_8;
    }
  }
  uint64_t v15 = [(_UINavigationControllerPalette *)v29 boundaryEdge];
  if (v15)
  {
    if (v15 != 5 && v15 != 2)
    {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Palettes currently can only have a top boundary edge or no boundary edge", v28);
      goto LABEL_35;
    }
    topPalette = self->_topPalette;
    if (!topPalette || topPalette == v29)
    {
      if (topPalette == v29)
      {
        double v19 = [(UINavigationDeferredTransitionContext *)self->_deferredTransitionContext incomingTopPalette];

        if (v19 != v29) {
          goto LABEL_8;
        }
      }
    }
    else
    {
      if ((*(void *)&self->_navigationControllerFlags & 8) == 0)
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Only one palette with a top boundary edge can be active outside of a transition. Current active palette is %@", self->_topPalette format];
        goto LABEL_35;
      }
      if ([(_UINavigationControllerPalette *)topPalette isPinned]) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Attaching a new palette while transitioning from a pinned palette makes no sense"];
      }
      objc_storeStrong((id *)&self->_transitioningTopPalette, self->_topPalette);
    }
    p_topPalette = &self->_topPalette;
  }
  else
  {
    p_topPalette = &self->_freePalette;
    freePalette = self->_freePalette;
    if (freePalette && freePalette != v29)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Only one palette with no boundary edge can be active. Current active palette is %@", self->_freePalette format];
      goto LABEL_35;
    }
    if (freePalette == v29) {
      goto LABEL_8;
    }
  }
  objc_storeStrong((id *)p_topPalette, a3);
LABEL_35:
  BOOL v20 = [(UINavigationController *)self isNavigationBarHidden];
  double v21 = 0.0;
  if (v20) {
    [(UINavigationController *)self _statusBarHeightForCurrentInterfaceOrientation];
  }
  [(_UINavigationControllerPalette *)v29 _resetConstraintConstants:v21];
  [(UIView *)v29 setAlpha:1.0];
  [(_UINavigationControllerPalette *)v29 _setAttached:1 didComplete:0];
  [(UINavigationController *)self _frameForPalette:v29];
  -[_UINavigationControllerPalette setFrame:](v29, "setFrame:");
  BOOL v22 = [(_UINavigationControllerPalette *)self->_topPalette _restartPaletteTransitionIfNecessary];
  BOOL v23 = v22;
  if ((*(void *)&self->_navigationControllerFlags & 8) != 0
    || v22
    || v20 && ![(_UINavigationControllerPalette *)v29 isVisibleWhenPinningBarIsHidden])
  {
    [(_UINavigationControllerPalette *)v29 _setAttached:1 didComplete:1];
  }
  else
  {
    [(UINavigationController *)self _installPaletteIntoViewHierarchy:v29];
    [(_UINavigationControllerPalette *)v29 _setAttached:1 didComplete:1];
    int v24 = [(UINavigationController *)self topViewController];
    [(UINavigationController *)self _computeAndApplyScrollContentInsetDeltaForViewController:v24];
  }
  [(_UINavigationControllerPalette *)v29 setPinned:v4];
  if ([(_UINavigationControllerPalette *)v29 boundaryEdge] == 5) {
    [(UINavigationController *)self _updateBarsForCurrentInterfaceOrientation];
  }
  if (v23)
  {
    double v9 = [(UIViewController *)self transitionCoordinator];
    [(UINavigationController *)self _startPaletteTransitionIfNecessary:v9 animated:0];
    goto LABEL_3;
  }
LABEL_8:
}

- (void)_detachPalette:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 boundaryEdge];
  id v5 = [v8 _pinningBar];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(v5, "_setShadowAlpha:", (double)(objc_msgSend(v8, "pinningBarShadowWasHidden") ^ 1));
  }
  if ([(UINavigationController *)self isNavigationBarHidden]) {
    [v8 _setPalettePinningBarHidden:0];
  }
  [v8 removeFromSuperview];
  if (!v4)
  {
    uint64_t v6 = 1104;
    goto LABEL_11;
  }
  if (v4 == 5 || v4 == 2)
  {
    uint64_t v6 = 1088;
LABEL_11:
    uint64_t v7 = *(Class *)((char *)&self->super.super.super.isa + v6);
    *(Class *)((char *)&self->super.super.super.isa + v6) = 0;

    goto LABEL_13;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Palettes currently can only have a top boundary edge or no boundary edge"];
LABEL_13:
  [v8 _setAttached:0 didComplete:1];
}

- (void)detachPalette:(id)a3 isInPaletteTransition:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = (_UINavigationControllerPalette *)a3;
  uint64_t v6 = [(UINavigationController *)self _outermostNavigationController];
  uint64_t v7 = v6;
  if (v6 == self)
  {
    if (self->_topPalette == v11
      || self->_freePalette == v11
      || ([(UINavigationDeferredTransitionContext *)self->_deferredTransitionContext outgoingTopPalette], id v8 = (_UINavigationControllerPalette *)objc_claimAutoreleasedReturnValue(), v8, v8 == v11))
    {
      [(_UINavigationControllerPalette *)v11 _setAttached:0 didComplete:0];
      if (!v4)
      {
        [(UINavigationController *)self _detachPalette:v11];
        if (![(UINavigationController *)self isNavigationBarHidden])
        {
          double v9 = [(UINavigationController *)self topViewController];
          [(UINavigationController *)self _computeAndApplyScrollContentInsetDeltaForViewController:v9];
        }
      }
      if ([(_UINavigationControllerPalette *)self->_topPalette _restartPaletteTransitionIfNecessary])
      {
        double v10 = [(UIViewController *)self transitionCoordinator];
        [(UINavigationController *)self _startPaletteTransitionIfNecessary:v10 animated:0];
      }
    }
  }
  else
  {
    [(UINavigationController *)v6 detachPalette:v11 isInPaletteTransition:v4];
  }
}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1088) layer];
  [v2 removeAllAnimations];

  [*(id *)(a1 + 40) frame];
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 64);
  double v5 = *(double *)(a1 + 72);
  double MaxY = CGRectGetMaxY(v12);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  long long v7 = *(_OWORD *)(a1 + 64);
  long long v10 = *(_OWORD *)(a1 + 48);
  long long v11 = v7;
  v9[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_2;
  v9[3] = &unk_1E52DA520;
  void v9[4] = *(void *)(a1 + 32);
  +[UIView performWithoutAnimation:v9];
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1088), "setFrame:", v3, MaxY, v4, v5);
}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1088), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_3(double *a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    double v4 = a1[5];
    double v5 = a1[6];
    uint64_t v6 = *(void **)(*((void *)a1 + 4) + 1088);
    double v7 = a1[7];
    double v8 = a1[8];
    return objc_msgSend(v6, "setFrame:", v4, v5, v7, v8);
  }
  return result;
}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1088) _setRestartPaletteTransitionIfNecessary:0];
}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_5(uint64_t a1, void *a2)
{
  double v3 = *(void **)(*(void *)(a1 + 32) + 1096);
  id v4 = a2;
  [v3 setClipsToBounds:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_6;
  aBlock[3] = &unk_1E52DDEB8;
  id v26 = *(id *)(a1 + 40);
  double v5 = (void (**)(void *, void))_Block_copy(aBlock);
  v5[2](v5, *(void *)(*(void *)(a1 + 32) + 1088));
  v5[2](v5, *(void *)(*(void *)(a1 + 32) + 1112));
  char v6 = [v4 isCancelled];

  if (v6)
  {
    double v7 = 1.0;
    if (!*(unsigned char *)(a1 + 73)) {
      double v7 = 0.0;
    }
    [*(id *)(*(void *)(a1 + 32) + 984) _setShadowAlpha:v7];
    if ([*(id *)(*(void *)(a1 + 32) + 1088) _attachmentIsChanging])
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1088), "_setAttached:didComplete:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1088), "isAttached") ^ 1, 1);
      double v8 = *(id **)(a1 + 32);
      if (*(unsigned char *)(a1 + 74))
      {
        if (*(unsigned char *)(a1 + 73))
        {
          uint64_t v9 = *(void *)(a1 + 64);
          uint64_t v10 = 1;
        }
        else
        {
          uint64_t v10 = 0;
          uint64_t v9 = 1;
        }
        [v8 _positionTransitioningPalette:v8[136] outside:v10 edge:v9 preservingYPosition:1];
      }
      else
      {
        if (*(unsigned char *)(a1 + 73)) {
          double v15 = 0.0;
        }
        else {
          double v15 = 1.0;
        }
        [v8[136] setAlpha:v15];
      }
      if (*(unsigned char *)(a1 + 75)) {
        [*(id *)(*(void *)(a1 + 32) + 1088) removeFromSuperview];
      }
    }
    uint64_t v21 = *(void *)(a1 + 32);
    if (*(void *)(v21 + 1112))
    {
      [*(id *)(v21 + 1088) removeFromSuperview];
      [*(id *)(*(void *)(a1 + 32) + 1088) _setAttached:0 didComplete:1];
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 1088), *(id *)(*(void *)(a1 + 32) + 1112));
      uint64_t v22 = *(void *)(a1 + 32);
      BOOL v23 = *(void **)(v22 + 1112);
      *(void *)(v22 + 1112) = 0;

      [*(id *)(*(void *)(a1 + 32) + 1088) _setAttached:1 didComplete:1];
      [*(id *)(a1 + 32) _positionTransitioningPalette:*(void *)(*(void *)(a1 + 32) + 1088) outside:0 edge:1 preservingYPosition:1];
    }
    else if (*(unsigned char *)(a1 + 75))
    {
      int v24 = [*(id *)(v21 + 1088) superview];

      if (v24)
      {
        [*(id *)(*(void *)(a1 + 32) + 1088) removeFromSuperview];
        if (([*(id *)(*(void *)(a1 + 32) + 1088) isPinned] & 1) == 0) {
          [*(id *)(a1 + 32) _detachPalette:*(void *)(*(void *)(a1 + 32) + 1088)];
        }
      }
    }
    goto LABEL_37;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    long long v11 = [*(id *)(*(void *)(a1 + 32) + 1096) superview];
    [v11 insertSubview:*(void *)(*(void *)(a1 + 32) + 1096) belowSubview:*(void *)(a1 + 48)];
  }
  if (([*(id *)(*(void *)(a1 + 32) + 1088) isAttached] & 1) == 0)
  {
    double v13 = *(void **)(a1 + 32);
    uint64_t v12 = v13[136];
    if (*(unsigned char *)(a1 + 72))
    {
LABEL_18:
      [v13 _detachPalette:v12];
      goto LABEL_24;
    }
    double v14 = (void *)v13[136];
LABEL_23:
    objc_msgSend(v14, "removeFromSuperview", v12);
    goto LABEL_24;
  }
  if (!*(unsigned char *)(a1 + 73)
    || ![*(id *)(*(void *)(a1 + 32) + 1088) _attachmentIsChanging])
  {
    if (*(unsigned char *)(a1 + 72))
    {
      double v13 = *(void **)(a1 + 32);
      uint64_t v12 = v13[136];
      goto LABEL_18;
    }
    if (*(unsigned char *)(a1 + 73)) {
      goto LABEL_24;
    }
    double v14 = *(void **)(*(void *)(a1 + 32) + 1088);
    goto LABEL_23;
  }
  [*(id *)(*(void *)(a1 + 32) + 1088) _setAttached:1 didComplete:1];
LABEL_24:
  uint64_t v16 = *(void *)(a1 + 32);
  double v17 = *(void **)(v16 + 1112);
  if (v17)
  {
    [v17 removeFromSuperview];
    [*(id *)(*(void *)(a1 + 32) + 1112) _setAttached:0 didComplete:1];
    uint64_t v18 = *(void *)(a1 + 32);
    double v19 = *(void **)(v18 + 1112);
    *(void *)(v18 + 1112) = 0;

    uint64_t v16 = *(void *)(a1 + 32);
  }
  double v20 = 0.0;
  if (!*(unsigned char *)(a1 + 73)) {
    double v20 = 1.0;
  }
  [*(id *)(v16 + 984) _setShadowAlpha:v20];
LABEL_37:
}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = v3;
    char v5 = [v4 paletteShadowIsHidden];
    id v3 = v6;
    if ((v5 & 1) == 0)
    {
      [*(id *)(a1 + 32) _setShadowAlpha:1.0];
      id v3 = v6;
    }
  }
}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_7(uint64_t a1, void *a2)
{
  id v100 = a2;
  id v3 = [*(id *)(a1 + 32) layer];
  id v4 = [v3 presentationLayer];
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  [*(id *)(a1 + 32) frame];
  CGFloat v95 = v14;
  CGFloat v96 = v13;
  CGFloat v93 = v16;
  CGFloat v94 = v15;
  int v17 = [*(id *)(a1 + 32) _hidesShadow];
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v18 = *(void **)(*(void *)(a1 + 40) + 1088);
  }
  else {
    uint64_t v18 = 0;
  }
  id v19 = v18;
  if ([v19 _supportsSpecialSearchBarTransitions]) {
    double v20 = v19;
  }
  else {
    double v20 = 0;
  }
  id v21 = v20;
  uint64_t v22 = [v21 viewForAsymmetricFade];
  uint64_t v23 = 28;
  if (!*(unsigned char *)(a1 + 64)) {
    uint64_t v23 = 27;
  }
  id v24 = objc_retain(*(id *)(*(void *)(a1 + 40)
                          + OBJC_IVAR___UISnapshotModalViewController__disappearingViewController[v23]));
  uint64_t v101 = v24;
  if ([v24 _supportsSpecialSearchBarTransitions]) {
    double v25 = v24;
  }
  else {
    double v25 = 0;
  }
  id v26 = v25;
  int v27 = [v26 viewForAsymmetricFade];
  if (v21) {
    int v28 = v17;
  }
  else {
    int v28 = 0;
  }
  if (v28 == 1 && ([v21 paletteShadowIsHidden] & 1) == 0)
  {
    if (v24) {
      int v98 = [v24 paletteShadowIsHidden];
    }
    else {
      int v98 = 1;
    }
  }
  else
  {
    int v98 = 0;
  }
  if (v26) {
    int v29 = v17;
  }
  else {
    int v29 = 0;
  }
  if (v29 == 1 && ([v26 paletteShadowIsHidden] & 1) == 0)
  {
    if (v19) {
      int v92 = [v19 paletteShadowIsHidden];
    }
    else {
      int v92 = 1;
    }
  }
  else
  {
    int v92 = 0;
  }
  if ((v22 != 0) != (v27 != 0))
  {
    v169.origin.double y = v95;
    v169.origin.double x = v96;
    v169.size.double height = v93;
    v169.size.double width = v94;
    double MaxY = CGRectGetMaxY(v169);
    v170.origin.double x = v6;
    v170.origin.double y = v8;
    v170.size.double width = v10;
    v170.size.double height = v12;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = MaxY >= CGRectGetMaxY(v170);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      id v31 = [*(id *)(*(void *)(a1 + 40) + 1096) superview];
      [v31 insertSubview:*(void *)(*(void *)(a1 + 40) + 1096) aboveSubview:*(void *)(a1 + 32)];
    }
  }
  uint64_t v165 = 0;
  id v166 = (double *)&v165;
  uint64_t v167 = 0x2020000000;
  CGFloat Height = 0.0;
  [v19 frame];
  CGFloat Height = CGRectGetHeight(v171);
  uint64_t v159 = 0;
  v160 = (CGRect *)&v159;
  uint64_t v161 = 0x4010000000;
  id v162 = &unk_186D7DBA7;
  long long v32 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v163 = *MEMORY[0x1E4F1DB28];
  long long v164 = v32;
  if (v19)
  {
    v143[0] = MEMORY[0x1E4F143A8];
    v143[1] = 3221225472;
    v143[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_8;
    v143[3] = &unk_1E52E8C80;
    id v33 = v19;
    uint64_t v34 = *(void *)(a1 + 40);
    id v144 = v33;
    uint64_t v145 = v34;
    v150 = &v165;
    char v157 = v98;
    id v146 = v21;
    id v147 = *(id *)(a1 + 32);
    char v158 = *(unsigned char *)(a1 + 65);
    id v148 = v22;
    id v151 = &v159;
    CGFloat v152 = v6;
    CGFloat v153 = v8;
    CGFloat v154 = v10;
    CGFloat v155 = v12;
    id v35 = v27;
    uint64_t v36 = *(void *)(a1 + 56);
    id v149 = v35;
    uint64_t v156 = v36;
    +[UIView performWithoutAnimation:v143];
  }
  if (*(unsigned char *)(a1 + 65))
  {
    if (v22 && v166[3] > 0.0)
    {
      double MinX = CGRectGetMinX(v160[1]);
      v172.origin.double y = v95;
      v172.origin.double x = v96;
      v172.size.double height = v93;
      v172.size.double width = v94;
      double v38 = CGRectGetMaxY(v172);
      double Width = CGRectGetWidth(v160[1]);
      double v87 = v166[3];
      [v22 frame];
      double v40 = v39;
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      double v47 = v166[3];
      double v48 = CGRectGetHeight(v160[1]);
      double v49 = [v21 _searchBar];
      BOOL v85 = [v49 backgroundColor];
      double v50 = v47 - v48;

      v135[0] = MEMORY[0x1E4F143A8];
      v135[1] = 3221225472;
      v135[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_9;
      v135[3] = &unk_1E52E8CA8;
      id v51 = v21;
      id v136 = v51;
      v138 = &v159;
      id v52 = v22;
      id v137 = v52;
      double v139 = v40;
      double v140 = v42 - v50;
      double v141 = v44;
      double v142 = v46;
      +[UIView performWithoutAnimation:v135];
      objc_msgSend(v51, "setFrame:", MinX, v38, Width, v87);
      double v53 = v50 + v42 - v50;
      objc_msgSend(v52, "setFrame:", v40, v53, v44, v46);
      [v100 transitionDuration];
      double v55 = v54;
      v132[0] = MEMORY[0x1E4F143A8];
      v132[1] = 3221225472;
      v132[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_10;
      v132[3] = &unk_1E52D9FC0;
      id v133 = v52;
      char v134 = *(unsigned char *)(a1 + 66);
      v121[0] = MEMORY[0x1E4F143A8];
      v121[1] = 3221225472;
      v121[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_13;
      v121[3] = &unk_1E52E8CF8;
      id v122 = v51;
      id v56 = v85;
      uint64_t v57 = *(void *)(a1 + 48);
      id v123 = v56;
      uint64_t v126 = v57;
      int8x16_t v90 = *(int8x16_t *)(a1 + 32);
      id v58 = (id)v90.i64[0];
      int8x16_t v124 = vextq_s8(v90, v90, 8uLL);
      id v125 = v133;
      id v127 = &v165;
      double v128 = v40;
      double v129 = v53;
      double v130 = v44;
      double v131 = v46;
      +[UIView animateKeyframesWithDuration:0 delay:v132 options:v121 animations:v55 completion:0.0];
    }
    else
    {
      [*(id *)(a1 + 40) _positionTransitioningPalette:v19 outside:0 edge:1 preservingYPosition:0];
    }
    if (v98) {
      [v21 _setShadowAlpha:1.0];
    }
    if (v27)
    {
      [v27 frame];
      double v99 = v59;
      double v88 = v61;
      double v91 = v60;
      double v86 = v62;
      [v26 frame];
      double v64 = v63;
      double v66 = v65;
      double v68 = v67;
      p_double x = &v160->origin.x;
      v160[1].origin.double x = v63;
      *((void *)p_x + 5) = v70;
      uint64_t v84 = v70;
      p_x[6] = v65;
      p_x[7] = v67;
      v173.origin.double y = v95;
      v173.origin.double x = v96;
      v173.size.double height = v93;
      v173.size.double width = v94;
      double v71 = CGRectGetMaxY(v173);
      double v72 = CGRectGetHeight(v160[1]);
      if (v22) {
        double v73 = v68;
      }
      else {
        double v73 = 0.0;
      }
      v174.origin.double x = v64;
      v174.origin.double y = v71;
      v174.size.double width = v66;
      v174.size.double height = v73;
      double v74 = CGRectGetHeight(v174);
      id v75 = [v26 _searchBar];
      id v76 = [v75 backgroundColor];

      v119[0] = MEMORY[0x1E4F143A8];
      v119[1] = 3221225472;
      v119[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_15;
      v119[3] = &unk_1E52D9F70;
      id v77 = v26;
      id v120 = v77;
      +[UIView performWithoutAnimation:v119];
      [v77 _pushDisableLayoutFlushingForTransition];
      objc_msgSend(v77, "setFrame:", v64, v71, v66, v73);
      objc_msgSend(v27, "setFrame:", v99, v91 - (v72 - v74), v88, v86);
      [v100 transitionDuration];
      double v79 = v78;
      v116[0] = MEMORY[0x1E4F143A8];
      v116[1] = 3221225472;
      v116[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_16;
      v116[3] = &unk_1E52D9FC0;
      char v118 = *(unsigned char *)(a1 + 66);
      id v117 = v27;
      v102[0] = MEMORY[0x1E4F143A8];
      v102[1] = 3221225472;
      v102[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_18;
      v102[3] = &unk_1E52E8D48;
      uint64_t v107 = *(void *)(a1 + 48);
      int8x16_t v97 = *(int8x16_t *)(a1 + 32);
      id v80 = (id)v97.i64[0];
      int8x16_t v103 = vextq_s8(v97, v97, 8uLL);
      id v104 = v77;
      id v81 = v76;
      id v105 = v81;
      id v106 = v117;
      double v108 = v64;
      uint64_t v109 = v84;
      double v110 = v66;
      double v111 = v68;
      double v112 = v99;
      double v113 = v91;
      double v114 = v88;
      double v115 = v86;
      +[UIView animateKeyframesWithDuration:0 delay:v116 options:v102 animations:v79 completion:0.0];
    }
    else if (v101)
    {
      if (*(void *)(a1 + 56) == 2) {
        uint64_t v83 = 8;
      }
      else {
        uint64_t v83 = 2;
      }
      [*(id *)(a1 + 40) _positionTransitioningPalette:v101 outside:1 edge:v83 preservingYPosition:1];
    }
    if (v92) {
      [v26 _setShadowAlpha:0.0];
    }
  }
  else
  {
    double v82 = 1.0;
    if (!*(unsigned char *)(a1 + 64)) {
      double v82 = 0.0;
    }
    [*(id *)(*(void *)(a1 + 40) + 1088) setAlpha:v82];
    if (v21)
    {
      [*(id *)(a1 + 40) _positionTransitioningPalette:v21 outside:0 edge:1 preservingYPosition:0];
      [v21 setAlpha:1.0];
    }
    if (v26)
    {
      [*(id *)(a1 + 40) _positionTransitioningPalette:v26 outside:0 edge:1 preservingYPosition:1];
      [v26 setAlpha:0.0];
    }
  }
  _Block_object_dispose(&v159, 8);
  _Block_object_dispose(&v165, 8);
}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) superview];

  if (!v2)
  {
    id v3 = [*(id *)(a1 + 32) layer];
    [v3 removeAllAnimations];

    [*(id *)(a1 + 40) _frameForPalette:*(void *)(a1 + 32)];
    objc_msgSend(*(id *)(a1 + 32), "setFrame:");
    [*(id *)(a1 + 32) frame];
    *(CGFloat *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = CGRectGetHeight(v29);
    if (*(unsigned char *)(a1 + 136)) {
      [*(id *)(a1 + 48) _setShadowAlpha:0.0];
    }
    id v4 = *(void **)(a1 + 48);
    if (v4)
    {
      double v5 = [v4 _searchBar];
      CGFloat v6 = [v5 backgroundImage];

      if (!v6)
      {
        double v7 = objc_msgSend(*(id *)(a1 + 56), "backgroundImageForBarMetrics:", objc_msgSend(*(id *)(a1 + 56), "_activeBarMetrics"));
        CGFloat v8 = v7;
        if (v7)
        {
          [v7 size];
          if (v10 == *MEMORY[0x1E4F1DB30] && v9 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
          {
            double v11 = [*(id *)(a1 + 48) _searchBar];
            [v11 setBackgroundImage:v8];
          }
        }
      }
    }
    [*(id *)(a1 + 40) _installPaletteIntoViewHierarchy:*(void *)(a1 + 32)];
    if (*(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) > 0.0) {
      [*(id *)(a1 + 32) layoutIfNeeded];
    }
  }
  if (!*(unsigned char *)(a1 + 137))
  {
    int v17 = *(void **)(a1 + 32);
    goto LABEL_20;
  }
  if (*(void *)(a1 + 64))
  {
    [*(id *)(a1 + 48) frame];
    CGFloat v12 = *(void **)(*(void *)(a1 + 88) + 8);
    v12[4] = v13;
    v12[5] = v14;
    v12[6] = v15;
    v12[7] = v16;
    *(CGFloat *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) = CGRectGetMaxY(*(CGRect *)(a1 + 96));
    if (!*(void *)(a1 + 72)) {
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 56) = 0;
    }
    if (*(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) > 0.0)
    {
      int v17 = *(void **)(a1 + 64);
LABEL_20:
      return [v17 setAlpha:0.0];
    }
    uint64_t v22 = *(double **)(*(void *)(a1 + 88) + 8);
    double v23 = v22[4];
    double v24 = v22[5];
    double v25 = v22[6];
    double v26 = v22[7];
    int v27 = *(void **)(a1 + 48);
    return objc_msgSend(v27, "setFrame:", v23, v24, v25, v26);
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 32);
    id v19 = *(void **)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 128);
    return [v19 _positionTransitioningPalette:v20 outside:1 edge:v21 preservingYPosition:0];
  }
}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_9(uint64_t a1)
{
  [*(id *)(a1 + 32) _pushDisableLayoutFlushingForTransition];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 56));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v2 = [*(id *)(a1 + 32) _searchBar];
  [v2 setBackgroundColor:0];
}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_10(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_11;
  v5[3] = &unk_1E52D9F70;
  id v6 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:v5 relativeDuration:0.0 animations:0.01];
  double v2 = dbl_186B94230[*(unsigned char *)(a1 + 40) == 0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_12;
  v3[3] = &unk_1E52D9F70;
  id v4 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:v3 relativeDuration:v2 animations:1.0 - v2];
}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_13(uint64_t a1)
{
  [*(id *)(a1 + 32) _popDisableLayoutFlushingForTransition];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) _searchBar];
  [v3 setBackgroundColor:v2];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    id v4 = [*(id *)(*(void *)(a1 + 48) + 1096) superview];
    [v4 insertSubview:*(void *)(*(void *)(a1 + 48) + 1096) belowSubview:*(void *)(a1 + 56)];
  }
  [*(id *)(a1 + 64) alpha];
  if (v5 != 1.0)
  {
    [*(id *)(a1 + 48) _frameForPalette:*(void *)(a1 + 32)];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    CGFloat v12 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    objc_initWeak(&location, *(id *)(a1 + 32));
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_14;
    aBlock[3] = &unk_1E52E8CD0;
    objc_copyWeak(v18, &location);
    v18[1] = v7;
    v18[2] = v9;
    v18[3] = v11;
    v18[4] = v12;
    id v17 = *(id *)(a1 + 64);
    long long v13 = *(_OWORD *)(a1 + 104);
    long long v19 = *(_OWORD *)(a1 + 88);
    long long v20 = v13;
    uint64_t v14 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v15 = [*(id *)(a1 + 32) window];

    if (v15) {
      [*(id *)(a1 + 32) setResetAfterSearchFieldFade:v14];
    }
    else {
      v14[2](v14);
    }

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_14(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  double v5 = *(double *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setFrame:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  double v7 = *(void **)(a1 + 32);
  return [v7 setAlpha:1.0];
}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_15(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _searchBar];
  [v1 setBackgroundColor:0];
}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_16(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.25;
  }
  else {
    double v1 = 0.1;
  }
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_17;
  v2[3] = &unk_1E52D9F70;
  id v3 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:v2 relativeDuration:0.0 animations:v1];
}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_17(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_18(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    double v2 = [*(id *)(*(void *)(a1 + 32) + 1096) superview];
    [v2 insertSubview:*(void *)(*(void *)(a1 + 32) + 1096) belowSubview:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 48) _popDisableLayoutFlushingForTransition];
  uint64_t v3 = *(void *)(a1 + 56);
  double v4 = [*(id *)(a1 + 48) _searchBar];
  [v4 setBackgroundColor:v3];

  [*(id *)(a1 + 64) alpha];
  if (v5 != 1.0)
  {
    objc_initWeak(&location, *(id *)(a1 + 48));
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    CGFloat v12 = __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_19;
    long long v13 = &unk_1E52E8D20;
    id v14 = *(id *)(a1 + 64);
    objc_copyWeak(&v16, &location);
    long long v6 = *(_OWORD *)(a1 + 96);
    long long v17 = *(_OWORD *)(a1 + 80);
    long long v18 = v6;
    long long v7 = *(_OWORD *)(a1 + 128);
    long long v19 = *(_OWORD *)(a1 + 112);
    long long v20 = v7;
    id v15 = *(id *)(a1 + 48);
    CGFloat v8 = (void (**)(void))_Block_copy(&v10);
    double v9 = objc_msgSend(*(id *)(a1 + 48), "window", v10, v11, v12, v13);

    if (v9) {
      [*(id *)(a1 + 48) setResetAfterSearchFieldFade:v8];
    }
    else {
      v8[2](v8);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

uint64_t __82__UINavigationController__UIPalette___startPaletteTransitionIfNecessary_animated___block_invoke_19(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  double v2 = *(double *)(a1 + 56);
  double v3 = *(double *)(a1 + 64);
  double v4 = *(double *)(a1 + 72);
  double v5 = *(double *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setFrame:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  long long v7 = *(void **)(a1 + 40);
  return [v7 _setShadowAlpha:1.0];
}

- (void)_prepareCollectionViewController:(id)a3 forSharingWithCollectionViewController:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  long long v6 = [v10 parentViewController];

  if (v6)
  {
    long long v7 = [v5 _uiCollectionView];
    CGFloat v8 = [v10 _uiCollectionView];

    if (v7 != v8) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is configured to share a different collection view than %@", v10, v5 format];
    }
  }
  else
  {
    [v10 _clearSharedView];
    [v10 _setUsesSharedView:1];
    double v9 = [v5 _uiCollectionView];
    [v10 _setSharedCollectionView:v9];
  }
}

- (void)_prepareCollectionViewControllerForSharing:(id)a3
{
  id v4 = a3;
  id v5 = [(UINavigationController *)self topViewController];
  [(UINavigationController *)self _prepareCollectionViewController:v4 forSharingWithCollectionViewController:v5];
}

- (void)_prepareCollectionViewControllers:(id)a3 forSharingInRange:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 firstIndex];
  uint64_t v8 = [v6 indexGreaterThanIndex:v7];
  double v9 = [v17 objectAtIndex:v7];
  id v10 = [v9 _uiCollectionView];
  if (v10)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v9 != v10 && (isKindOfClass & 1) != 0)
    {
      CGFloat v12 = [v9 _uiCollectionView];
      [v12 setDataSource:v9];

      long long v13 = [v9 _uiCollectionView];
      [v13 layoutIfNeeded];
    }
  }
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    do
    {
      id v14 = [v17 objectAtIndex:v7];
      id v15 = [v17 objectAtIndex:v8];
      [(UINavigationController *)self _prepareCollectionViewController:v15 forSharingWithCollectionViewController:v14];
      uint64_t v16 = [v6 indexGreaterThanIndex:v8];

      uint64_t v7 = v8;
      uint64_t v8 = v16;
    }
    while (v16 != 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (void)_stopTransitionsImmediately
{
}

- (id)_effectiveActivityItemsConfiguration
{
  v7.receiver = self;
  v7.super_class = (Class)UINavigationController;
  double v3 = [(UIResponder *)&v7 _effectiveActivityItemsConfiguration];
  if (!v3)
  {
    id v4 = [(UINavigationController *)self viewControllers];
    id v5 = [v4 lastObject];

    double v3 = [v5 _effectiveActivityItemsConfiguration];
  }
  return v3;
}

@end