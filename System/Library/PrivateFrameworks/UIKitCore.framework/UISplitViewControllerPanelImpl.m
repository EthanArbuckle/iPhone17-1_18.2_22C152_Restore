@interface UISplitViewControllerPanelImpl
- (BOOL)_allowClientAnimationCoordination;
- (BOOL)_allowMoveToSecondaryOnlyGetIsInForcedOverlayFromGestureOrRestrictedWidth:(BOOL *)a3;
- (BOOL)_allowsDimmedSecondaryAsDeepestUnambiguousResponder;
- (BOOL)_allowsFocusBehindDimmingView;
- (BOOL)_allowsTriggeringSidebarKeyCommandAction;
- (BOOL)_alwaysHideSidebarToggleButton;
- (BOOL)_configurationPermitsFluidCloseGestureWithPrimaryShown:(BOOL)a3 supplementaryShown:(BOOL)a4;
- (BOOL)_configurationPermitsFluidOpenGestureWithPrimaryShown:(BOOL)a3 supplementaryShown:(BOOL)a4;
- (BOOL)_disableAutomaticKeyboardBehavior;
- (BOOL)_fluidGestureRecognizerShouldBegin:(id)a3;
- (BOOL)_forceDisplayModeBarButtonHidden;
- (BOOL)_gestureIsForcingOverlay;
- (BOOL)_gestureIsForcingOverlayForDisplayMode:(int64_t)a3;
- (BOOL)_handlesCounterRotationForPresentation;
- (BOOL)_hasDoubleSideBar;
- (BOOL)_hasPreferredInterfaceOrientationForPresentation;
- (BOOL)_iPadShouldUseOverlayInCurrentEnvironment;
- (BOOL)_iPhoneShouldUseOverlayInCurrentEnvironment;
- (BOOL)_ignoresSheetContext;
- (BOOL)_interfaceIsCompactForWidth:(double)a3;
- (BOOL)_isAnimating;
- (BOOL)_isCollapsed;
- (BOOL)_isCollapsedOrCollapsing;
- (BOOL)_isDisplayModeBarButtonVisible;
- (BOOL)_isExpanding;
- (BOOL)_isPrimaryLeading;
- (BOOL)_isPrimaryShown;
- (BOOL)_isRotating;
- (BOOL)_isSecondaryColumnCompactInTotalWidth:(double)a3 withPrimaryColumnWidth:(double)a4 supplementaryColumnWidth:(double)a5;
- (BOOL)_isViewControllerForObservableScrollViewAmbiguous;
- (BOOL)_layoutPrimaryOnRight;
- (BOOL)_navigationControllerShouldNotAdjustTransitioningSizeForChildContainer:(id)a3;
- (BOOL)_optsOutOfPopoverControllerHierarchyCheck;
- (BOOL)_scrollViewPreventsGestureForHitView:(id)a3;
- (BOOL)_setPanelConfigurationWithIsPrimaryShown:(BOOL)a3 isSupplementaryShown:(BOOL)a4 shouldUseOverlay:(BOOL)a5 dimMainIfNecessary:(BOOL)a6;
- (BOOL)_setPanelConfigurationWithIsPrimaryShown:(BOOL)a3 shouldUseOverlay:(BOOL)a4;
- (BOOL)_shouldPersistViewWhenCoding;
- (BOOL)_shouldReturnBoundsWidthForColumnWidth;
- (BOOL)_shouldShowNSToolbarSidebarToggle;
- (BOOL)_shouldUseFluidSidebarGestures;
- (BOOL)_shouldZeroSafeAreaInsetsForViewController:(id)a3;
- (BOOL)_unspecifiedStyleGestureRecognizerShouldBegin:(id)a3;
- (BOOL)_usePaddingForEdgeInsetsForChildViewController:(id)a3;
- (BOOL)_usesExtraWidePrimaryColumn;
- (BOOL)_visibleToggleButtonRequiresPresentsWithGesture;
- (BOOL)_wantsFloatingSidebar;
- (BOOL)_wantsSideBarImageForOneOverSecondary;
- (BOOL)_wantsVisibleDimmingView;
- (BOOL)allowsSecondaryOnlyShortcutButton;
- (BOOL)canTileSidebarColumn:(int64_t)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hidesMasterViewInPortrait;
- (BOOL)inCollapsingToProposedTopColumnCallback;
- (BOOL)inExpandingToProposedDisplayModeCallback;
- (BOOL)isCollapsed;
- (BOOL)lockedForDelegateCallback;
- (BOOL)panelController:(id)a3 collapseOntoPrimaryViewController:(id)a4;
- (BOOL)panelController:(id)a3 collapsePrimaryViewController:(id)a4 withFallbackSecondaryViewController:(id)a5 onTopOfSupplementaryViewController:(id)a6 transitionCoordinator:(id)a7;
- (BOOL)prefersOverlayInRegularWidthPhone;
- (BOOL)presentsWithGesture;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)showsSecondaryOnlyButton;
- (BOOL)supplementaryColumnAdoptsPrimaryBackgroundStyle;
- (BOOL)usesDeviceOverlayPreferences;
- (CGRect)_frameForChildContentContainer:(id)a3;
- (CGSize)_contentSizeForChildViewController:(id)a3 inPopoverController:(id)a4;
- (CGSize)_defaultViewSizeForResolvingDisplayModeOrSplitBehavior;
- (CGSize)_predictedDetailSizeForPredictedEndState:(id)a3;
- (CGSize)_preferredContentSize;
- (CGSize)_screenSize;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (Class)viewClassForPanelController:(id)a3;
- (NSArray)possibleStates;
- (NSArray)viewControllers;
- (NSString)_displayModeButtonItemTitle;
- (NSString)description;
- (UIColor)primaryBackgroundColor;
- (UIDimmingView)_dimmingView;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIEdgeInsets)_tvOSColumnStyleExtraInsetsForChildViewController:(id)a3;
- (UIFocusContainerGuide)_detailFocusContainerGuide;
- (UIFocusContainerGuide)_masterFocusContainerGuide;
- (UIImage)_fullScreenButtonImage;
- (UILongPressGestureRecognizer)_sidebarArrowButtonRecognizer;
- (UIPanGestureRecognizer)_fluidSidebarPresentationGestureRecognizer;
- (UIPanGestureRecognizer)_presentationGestureRecognizer;
- (UIPanelController)panelController;
- (UIScreenEdgePanGestureRecognizer)_fluidOpenSidebarPresentationGestureRecognizer;
- (UISlidingBarConfiguration)configuration;
- (UISlidingBarState)currentState;
- (UISlidingBarStateRequest)stateRequest;
- (UISplitViewController)splitViewController;
- (UISplitViewControllerDelegate)delegate;
- (UISplitViewControllerPanelImpl)initWithSplitViewController:(id)a3;
- (UITapGestureRecognizer)_menuGestureRecognizer;
- (UIViewControllerTransitionCoordinator)transitionCoordinator;
- (_UISplitViewControllerStyle)styleProvider;
- (_UITabContainerView)tabBarHostedView;
- (double)_contentMarginForChildViewController:(id)a3;
- (double)_defaultMaximumPrimaryColumnWidthForSize:(CGSize)a3;
- (double)_defaultMaximumSupplementaryColumnWidthForSize:(CGSize)a3;
- (double)_primaryColumnWidthForSize:(CGSize)a3 isCompact:(BOOL)a4 shouldUseOverlay:(BOOL)a5;
- (double)_primaryColumnWidthForSize:(CGSize)a3 shouldUseOverlay:(BOOL)a4;
- (double)_primaryDividerPosition;
- (double)_supplementaryDividerPosition;
- (double)maximumPrimaryColumnWidth;
- (double)maximumSupplementaryColumnWidth;
- (double)minimumPrimaryColumnWidth;
- (double)minimumSupplementaryColumnWidth;
- (double)panelController:(id)a3 expectedWidthForColumnForViewController:(id)a4;
- (double)preferredPrimaryColumnWidth;
- (double)preferredPrimaryColumnWidthFraction;
- (double)preferredSupplementaryColumnWidth;
- (double)preferredSupplementaryColumnWidthFraction;
- (double)primaryColumnWidth;
- (double)supplementaryColumnWidth;
- (float)gutterWidth;
- (id)_additionalViewControllersToCheckForUserActivity;
- (id)_allContainedViewControllers;
- (id)_childContainingSender:(id)a3;
- (id)_childViewControllersToSendViewWillTransitionToSize;
- (id)_columnStyleDelegate;
- (id)_currentPrimaryChildViewController;
- (id)_currentSupplementaryChildViewController;
- (id)_deepestActionResponder;
- (id)_displayModeButtonItem;
- (id)_effectiveActivityItemsConfiguration;
- (id)_enterFullScreenSymbolImage;
- (id)_fullScreenSymbolImageForDisplayMode:(int64_t)a3;
- (id)_hiddenColumnsInCurrentEnvironmentWithConcreteDisplayMode:(int64_t)a3;
- (id)_leaveFullScreenSymbolImage;
- (id)_multitaskingDragExclusionRects;
- (id)_navigationBarForSidebarButtonForColumn:(int64_t)a3;
- (id)_navigationBarForSidebarButtonForDisplayMode:(int64_t)a3;
- (id)_navigationController:(id)a3 navigationBarAdditionalActionsForBackButtonMenu:(id)a4;
- (id)_newBarContentAnimationClippingView;
- (id)_nextVisibleViewControllerForResponderAfterChildViewController:(id)a3;
- (id)_orderedPreferredFocusedViewControllers;
- (id)_overridingPreferredFocusEnvironment;
- (id)_primaryContentResponder;
- (id)_primaryDimmingView;
- (id)_primaryViewControllerFocusPromiseItem;
- (id)_sidebarChevronSymbolImage;
- (id)_sidebarToggleSymbolImage;
- (id)_topLevelViewControllerForColumn:(uint64_t)a1;
- (id)_traitCollectionForChildEnvironment:(id)a3;
- (id)_unspecifiedCompositionDisplayModeButtonItem;
- (id)_unspecifiedStyleChildViewControllersToSendViewWillTransitionToSize;
- (id)_unspecifiedStyleViewControllers;
- (id)_viewControllerForObservableScrollView;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)detailViewController;
- (id)displayModeButtonItem;
- (id)leadingVisibleViewController;
- (id)masterViewController;
- (id)panelController:(id)a3 navigationBarForViewController:(id)a4;
- (id)panelController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4;
- (id)panelController:(id)a3 separateSupplementaryViewControllerFromPrimaryViewController:(id)a4;
- (id)panelController:(id)a3 unspecifiedStyleSeparateSecondaryViewControllerFromPrimaryViewController:(id)a4;
- (id)panelController:(id)a3 willBeginAnimatedTransitionToStateRequest:(id)a4 predictedEndState:(id)a5 predictedDuration:(double)a6;
- (id)panelControllerWillUpdate:(id)a3;
- (id)preferredFocusEnvironments;
- (id)preferredFocusedView;
- (id)primaryViewControllerForCollapsingPanelController:(id)a3;
- (id)primaryViewControllerForExpandingPanelController:(id)a3;
- (id)trailingVisibleViewController;
- (id)viewControllerForColumn:(int64_t)a3;
- (int64_t)_columnForMonitoredNavigationController:(id)a3;
- (int64_t)_columnForView:(id)a3 getIsContent:(BOOL *)a4;
- (int64_t)_columnForViewController:(id)a3;
- (int64_t)_concreteDisplayModeForCurrentEnvironment;
- (int64_t)_currentInterfaceIdiom;
- (int64_t)_defaultPrimaryOffscreenGestureModeForCurrentIdiom;
- (int64_t)_displayModeForState:(id)a3;
- (int64_t)_effectiveTargetDisplayMode;
- (int64_t)_effectiveTargetDisplayModeForDisplayMode:(int64_t)a3;
- (int64_t)_fullScreenStateForOrientation:(int64_t)a3 viewWidth:(double)a4;
- (int64_t)_greatestAllowedAutohidingDisplayModeInSize:(CGSize)a3;
- (int64_t)_lastFocusedChildViewControllerColumn;
- (int64_t)_lastSettledDisplayMode;
- (int64_t)_nextTargetDisplayModeForDisplayMode:(int64_t)a3 showMoreIfPossible:(BOOL)a4;
- (int64_t)_primaryHidingState;
- (int64_t)_primaryOffscreenGestureMode;
- (int64_t)_svcOrientation;
- (int64_t)_svcViewWindowOrientation;
- (int64_t)_unspecifiedStyleDisplayModeForState:(id)a3;
- (int64_t)allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:(int64_t)a3;
- (int64_t)defaultDisplayModeForSize:(CGSize)a3;
- (int64_t)defaultDisplayModeForSplitBehavior:(int64_t)a3;
- (int64_t)displayMode;
- (int64_t)displayModeButtonVisibility;
- (int64_t)preferredCenterStatusBarStyle;
- (int64_t)preferredDisplayMode;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredLeadingStatusBarStyle;
- (int64_t)preferredSplitBehavior;
- (int64_t)preferredTrailingStatusBarStyle;
- (int64_t)primaryBackgroundStyle;
- (int64_t)primaryEdge;
- (int64_t)splitBehavior;
- (int64_t)splitBehaviorForSize:(CGSize)a3;
- (int64_t)splitBehaviorInCurrentEnvironment;
- (int64_t)style;
- (int64_t)topColumnForCollapsingPanelController:(id)a3;
- (int64_t)userGeneratedDisplayMode;
- (int64_t)validDisplayModeWithAllColumns;
- (uint64_t)_columnForViewController:(char)a3 forceExpandedResult:;
- (unint64_t)_effectivePrimaryRectEdge;
- (unint64_t)preferredScreenEdgesDeferringSystemGestures;
- (unint64_t)supportedInterfaceOrientations;
- (void)_allowingMutationsInDelegateCallback:(id)a3;
- (void)_changeToDisplayMode:(int64_t)a3 fromPreferredDisplayMode:(int64_t)a4;
- (void)_commonInit;
- (void)_didChangeToFirstResponder:(id)a3;
- (void)_didEndSnapshotSession;
- (void)_didUpdateFocusInContext:(id)a3;
- (void)_displayModeBarButtonItemWasUsedForFirstTime:(id)a3;
- (void)_fluidPresentationGestureRecognizerChanged:(id)a3;
- (void)_fluidUpdatePresentationGestureRecognizers;
- (void)_getPrimaryShown:(BOOL *)a3 shouldUseOverlay:(BOOL *)a4;
- (void)_getPrimaryShown:(BOOL *)a3 supplementaryShown:(BOOL *)a4 shouldUseOverlay:(BOOL *)a5 dimMainIfNecessary:(BOOL *)a6;
- (void)_getPrimaryShown:(BOOL *)a3 supplementaryShown:(BOOL *)a4 shouldUseOverlay:(BOOL *)a5 dimMainIfNecessary:(BOOL *)a6 forDisplayMode:(int64_t)a7;
- (void)_handleArrowPress:(id)a3;
- (void)_handleFocusMovementDidFail:(id)a3;
- (void)_initWithCoder:(id)a3;
- (void)_invalidateAllowsTriggeringSidebarKeyCommandAction;
- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5;
- (void)_navigationController:(id)a3 navigationBar:(id)a4 itemBackButtonUpdated:(id)a5;
- (void)_navigationController:(id)a3 navigationBar:(id)a4 topItemUpdatedContentLayout:(id)a5;
- (void)_navigationControllerDidChangeNavigationBarHidden:(id)a3;
- (void)_navigationControllerDidUpdateStack:(id)a3;
- (void)_notifyFluidPresentationGestureDidEnd;
- (void)_notifyFluidPresentationGestureWillBegin;
- (void)_popOverrideOfReportedDisplayMode;
- (void)_popoverController:(id)a3 didChangeFromVisible:(BOOL)a4;
- (void)_popoverController:(id)a3 willChangeToVisible:(BOOL)a4;
- (void)_presentationGestureRecognizerChanged:(id)a3;
- (void)_primaryColumnWidthAffectingPropertyDidChange;
- (void)_pushOverrideOfReportedDisplayMode:(int64_t)a3;
- (void)_revealSecondaryColumnIfNecessary;
- (void)_setAllowsDimmedSecondaryAsDeepestUnambiguousResponder:(BOOL)a3;
- (void)_setDimmingView:(id)a3;
- (void)_setDisplayModeButtonItemTitle:(id)a3;
- (void)_setFluidOpenSidebarPresentationGestureRecognizer:(id)a3;
- (void)_setFluidSidebarPresentationGestureRecognizer:(id)a3;
- (void)_setForceDisplayModeBarButtonHidden:(BOOL)a3;
- (void)_setFullScreenButtonImage:(id)a3;
- (void)_setIgnoresSheetContext:(BOOL)a3;
- (void)_setInteractiveSidebarWidth:(double)a3;
- (void)_setNumberOfSidebarColumnsVisibleFromGesture:(unint64_t)a3 withVelocity:(double)a4;
- (void)_setPresentationGestureRecognizer:(id)a3;
- (void)_setPrimaryHidingState:(int64_t)a3;
- (void)_setPrimaryOffscreenGestureMode:(int64_t)a3;
- (void)_setPrimaryShownFromGesture:(BOOL)a3 hideAll:(BOOL)a4;
- (void)_setUsesExtraWidePrimaryColumn:(BOOL)a3;
- (void)_setVisibleToggleButtonRequiresPresentsWithGesture:(BOOL)a3;
- (void)_setWantsFloatingSidebar:(BOOL)a3;
- (void)_stopTransitionsInViewController:(id)a3;
- (void)_supplementaryOrPrimaryColumnWidthAffectingPropertyDidChange;
- (void)_tabBarControllerDidChangeSelection:(id)a3;
- (void)_transitionFromDisplayMode:(int64_t)a3 toDisplayMode:(int64_t)a4;
- (void)_transitionFromDisplayMode:(int64_t)a3 toDisplayMode:(int64_t)a4 updateSplitBehaviorOverrides:(BOOL)a5 userGenerated:(BOOL)a6;
- (void)_triggerDisplayModeAction:(id)a3;
- (void)_triggerSecondaryOnlyShortcutAction:(id)a3;
- (void)_triggerSidebarKeyCommandAction:(id)a3;
- (void)_unspecifiedShowDetailViewController:(id)a3 onTargetVC:(id)a4 sender:(id)a5;
- (void)_unspecifiedStyleChangeToDisplayMode:(int64_t)a3 fromPreferredDisplayMode:(int64_t)a4;
- (void)_unspecifiedStylePanelController:(id)a3 didChangeToState:(id)a4 withSize:(CGSize)a5;
- (void)_unspecifiedStylePresentationGestureRecognizerChanged:(id)a3;
- (void)_unspecifiedStyleSetPrimaryShownFromGesture:(BOOL)a3;
- (void)_unspecifiedStyleSetViewControllers:(id)a3;
- (void)_unspecifiedStyleTriggerDisplayModeAction:(id)a3;
- (void)_unspecifiedStyleUpdateDisplayModeButtonItem;
- (void)_updateAllowsTriggeringSidebarKeyCommandAction;
- (void)_updateChildContentMargins;
- (void)_updateConfigurationBackgroundStyle;
- (void)_updateDimmingView;
- (void)_updateDisplayModeButtonItem;
- (void)_updateDisplayModeButtonItemAndResetForCanceledAnimationWithTransitionCoordinator:(id)a3;
- (void)_updateDisplayModeButtonItemForDisplayMode:(int64_t)a3;
- (void)_updateDisplayModeButtonItemIfNecessaryForChangingNavigationController:(id)a3;
- (void)_updatePresentationGestureRecognizer;
- (void)_updateSplitBehaviorOverridesForTransitionFromDisplayMode:(uint64_t)a1 toDisplayMode:(uint64_t)a2 shouldResizeIfNecessary:(uint64_t)a3;
- (void)_updateTriggerSidebarKeyCommandTitleForNewDisplayMode:(int64_t)a3;
- (void)_validateTriggerSidebarKeyCommand:(id)a3;
- (void)_viewControllerChildViewControllersDidChange:(id)a3;
- (void)_willBeginSnapshotSession;
- (void)_willShowCollapsedDetailViewController:(id)a3 inTargetController:(id)a4;
- (void)animateToRequest:(id)a3;
- (void)callDeprecatedWillHideDelegateCallbackIfNecessary;
- (void)callDeprecatedWillShowDelegateCallbackIfNecessary;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)dimmingViewWasTapped:(id)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getPrimaryColumnWidth:(double *)a3 supplementaryColumnWidth:(double *)a4 forSize:(CGSize)a5 displayMode:(int64_t)a6 isCompact:(BOOL)a7 shouldUseOverlay:(BOOL)a8;
- (void)getPrimaryColumnWidth:(double *)a3 supplementaryColumnWidth:(double *)a4 forSize:(CGSize)a5 displayMode:(int64_t)a6 shouldUseOverlay:(BOOL)a7;
- (void)getPrimaryColumnWidth:(double *)a3 supplementaryColumnWidth:(double *)a4 forSize:(CGSize)a5 displayMode:(int64_t)a6 splitBehavior:(int64_t)a7 isCompact:(BOOL)a8 shouldUseOverlay:(BOOL)a9;
- (void)hideColumn:(int64_t)a3;
- (void)loadView;
- (void)panelController:(id)a3 adjustLeadingViewController:(id)a4 forKeyboardInfo:(id)a5;
- (void)panelController:(id)a3 adjustTrailingViewController:(id)a4 forKeyboardInfo:(id)a5;
- (void)panelController:(id)a3 animateTransitionToStateRequest:(id)a4 predictedEndState:(id)a5 predictedDuration:(double)a6;
- (void)panelController:(id)a3 collapsePrimaryViewController:(id)a4 withFallbackSecondaryViewController:(id)a5 transitionCoordinator:(id)a6;
- (void)panelController:(id)a3 didChangeToState:(id)a4 withSize:(CGSize)a5;
- (void)panelController:(id)a3 didEndAnimatedTransitionToStateRequest:(id)a4;
- (void)panelController:(id)a3 willBeginAnimationToPrimarySize:(CGSize)a4 supplementarySize:(CGSize)a5 secondarySize:(CGSize)a6;
- (void)panelController:(id)a3 willChangeToState:(id)a4;
- (void)panelControllerDidCollapse:(id)a3;
- (void)panelControllerDidExpand:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)preparePanelControllerForCollapse;
- (void)removeChildViewController:(id)a3;
- (void)sendColumnShowHideNotificationsForNewState:(id)a3 newDisplayMode:(int64_t)a4 oldDisplayMode:(int64_t)a5;
- (void)sendWillHideColumn:(int64_t)a3;
- (void)sendWillShowColumn:(int64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayModeButtonVisibility:(int64_t)a3;
- (void)setGutterWidth:(float)a3;
- (void)setHidesMasterViewInPortrait:(BOOL)a3;
- (void)setMaximumPrimaryColumnWidth:(double)a3;
- (void)setMaximumSupplementaryColumnWidth:(double)a3;
- (void)setMinimumPrimaryColumnWidth:(double)a3;
- (void)setMinimumSupplementaryColumnWidth:(double)a3;
- (void)setPanelController:(id)a3;
- (void)setPreferredDisplayMode:(int64_t)a3;
- (void)setPreferredPrimaryColumnWidth:(double)a3;
- (void)setPreferredPrimaryColumnWidthFraction:(double)a3;
- (void)setPreferredSplitBehavior:(int64_t)a3;
- (void)setPreferredSupplementaryColumnWidth:(double)a3;
- (void)setPreferredSupplementaryColumnWidthFraction:(double)a3;
- (void)setPrefersOverlayInRegularWidthPhone:(BOOL)a3;
- (void)setPresentsWithGesture:(BOOL)a3;
- (void)setPrimaryBackgroundStyle:(int64_t)a3;
- (void)setPrimaryEdge:(int64_t)a3;
- (void)setShowsSecondaryOnlyButton:(BOOL)a3;
- (void)setStateRequest:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSupplementaryColumnAdoptsPrimaryBackgroundStyle:(BOOL)a3;
- (void)setTabBarHostedView:(id)a3;
- (void)setUserGeneratedDisplayMode:(int64_t)a3;
- (void)setUsesDeviceOverlayPreferences:(BOOL)a3;
- (void)setViewController:(id)a3 forColumn:(int64_t)a4;
- (void)setViewControllers:(id)a3;
- (void)showColumn:(int64_t)a3;
- (void)showDetailViewController:(id)a3 sender:(id)a4;
- (void)showViewController:(id)a3 sender:(id)a4;
- (void)toggleMasterVisible:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)unloadViewForced:(BOOL)a3;
- (void)updatePanelControllerForViewControllerChangeInColumn:(int64_t)a3;
- (void)updatePanelControllerForViewControllerChangeInColumn:(int64_t)a3 alwaysAnimate:(BOOL)a4;
- (void)updatePanelControllerForViewControllerChangeInColumn:(int64_t)a3 alwaysAnimate:(BOOL)a4 shouldUpdateCollapsedNavStack:(BOOL)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UISplitViewControllerPanelImpl

void __70__UISplitViewControllerPanelImpl__traitCollectionForChildEnvironment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 _setNSIntegerValue:v2 forTraitToken:0x1ED3F5C28];
  [v3 setHorizontalSizeClass:1];
}

- (void)viewDidLayoutSubviews
{
  [(UISplitViewControllerPanelImpl *)self _updateFocusContainerGuideFrames];
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    [(UISplitViewControllerPanelImpl *)self _updateAllowsTriggeringSidebarKeyCommandAction];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v4 = [WeakRetained view];

    if ([(UIBarButtonItem *)self->_sidebarToggleButtonItem isHidden]
      || ![(_UIFloatableBarButtonItem *)self->_sidebarToggleButtonItem _isFloating]
      || [(UISplitViewControllerPanelImpl *)self _alwaysHideSidebarToggleButton])
    {
      if (self->_floatableButtonContainer
        || [(UIBarButtonItem *)self->_sidebarToggleButtonItem isHidden]
        || [(UISplitViewControllerPanelImpl *)self _alwaysHideSidebarToggleButton])
      {
        [(UIView *)self->_floatableButtonContainer setAlpha:0.0];
LABEL_46:

        return;
      }
      int v56 = 1;
    }
    else
    {
      int v56 = 0;
    }
    v5 = &unk_1ED3F3A08;
    if ([(UISplitViewControllerPanelImpl *)self style] == 2)
    {
      v6 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

      BOOL v7 = v6 == 0;
      if (v6) {
        v5 = &unk_1ED3F3A50;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
    perColumnViewControllers = self->_perColumnViewControllers;
    v9 = [NSNumber numberWithInteger:v7];
    v10 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:v9];
    v11 = [v10 navigationController];

    v12 = [v11 _existingNavigationBar];
    v57 = v11;
    if ([v11 isNavigationBarHidden])
    {
      v13 = [v11 _targetNavigationBarForUISplitViewControllerSidebarButton];
      v14 = v13;
      if (v13 == v12) {
        id v15 = 0;
      }
      else {
        id v15 = v13;
      }

      v12 = v15;
    }
    v16 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:v5];
    v17 = [v16 navigationController];

    v18 = [v17 _existingNavigationBar];
    if ([v17 isNavigationBarHidden])
    {
      v19 = [v17 _targetNavigationBarForUISplitViewControllerSidebarButton];
      v20 = v19;
      if (v19 == v18) {
        id v21 = 0;
      }
      else {
        id v21 = v19;
      }

      v18 = v21;
    }
    v22 = [(_UIFloatableBarButtonItem *)self->_sidebarToggleButtonItem _configuredFloatableView];
    v23 = [(_UIFloatableBarButtonItem *)self->_sidebarToggleButtonItem _referenceView];
    v24 = [(UISplitViewControllerPanelImpl *)self panelController];
    v25 = [v24 view];
    [v25 layoutIfNeeded];

    [v23 bounds];
    objc_msgSend(v4, "convertRect:fromView:", v23);
    CGFloat v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    v34 = [v23 window];

    if (!v34)
    {
      [(UIView *)self->_floatableButtonContainer frame];
      CGFloat v27 = v35;
      double v29 = v36;
    }
    BOOL v37 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
    v38 = [v23 visualProvider];
    v39 = v38;
    if (v37) {
      [v38 alignmentViewForStaticNavBarButtonLeading];
    }
    else {
    v40 = [v38 alignmentViewForStaticNavBarButtonTrailing];
    }

    if ([(UISplitViewControllerPanelImpl *)self _layoutPrimaryOnRight])
    {
      [v23 bounds];
      double MaxX = CGRectGetMaxX(v59);
      [v40 frame];
      double MinX = MaxX - CGRectGetMaxX(v60);
    }
    else
    {
      [v40 frame];
      double MinX = CGRectGetMinX(v61);
    }
    double v58 = 0.0;
    if (v56) {
      v43 = 0;
    }
    else {
      v43 = &v58;
    }
    v44 = [(UISplitViewControllerPanelImpl *)self panelController];
    [v44 interpolatedMarginForPrimaryNavigationBar:v12 supplementaryOrSecondaryNavbar:v18 getInterpolatedAlpha:v43];
    double v46 = v45 - MinX;

    if ([(UISplitViewControllerPanelImpl *)self _layoutPrimaryOnRight])
    {
      [v4 bounds];
      double v47 = CGRectGetMaxX(v62);
      [v4 safeAreaInsets];
      double v49 = v47 - v48 - v46;
      v63.origin.x = v27;
      v63.origin.y = v29;
      v63.size.width = v31;
      v63.size.height = v33;
      double v50 = v49 - CGRectGetWidth(v63);
    }
    else
    {
      [v4 safeAreaInsets];
      double v50 = v46 + v51;
    }
    if (!self->_floatableButtonContainer)
    {
      v52 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v50, v29, v31, v33);
      floatableButtonContainer = self->_floatableButtonContainer;
      self->_floatableButtonContainer = v52;

      [v4 addSubview:self->_floatableButtonContainer];
      _UIBarsSetAccessibilityLimits(self->_floatableButtonContainer);
    }
    if (v22)
    {
      v54 = [v22 superview];
      v55 = self->_floatableButtonContainer;

      if (v54 != v55)
      {
        [(UIView *)self->_floatableButtonContainer bounds];
        objc_msgSend(v22, "setFrame:");
        [(UIView *)self->_floatableButtonContainer addSubview:v22];
        [v22 setAutoresizingMask:18];
      }
    }
    -[UIView setFrame:](self->_floatableButtonContainer, "setFrame:", v50, v29, v31, v33);
    [(UIView *)self->_floatableButtonContainer setAlpha:v58];

    goto LABEL_46;
  }
}

- (void)_updateAllowsTriggeringSidebarKeyCommandAction
{
  if ([(UISplitViewControllerPanelImpl *)self style]
    && ![(UISplitViewControllerPanelImpl *)self _alwaysHideSidebarToggleButton])
  {
    $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x400000) != 0) {
      return;
    }
    $692BA5F601ABB544448C4E0A48A865F8 v4 = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x400000);
  }
  else
  {
    $692BA5F601ABB544448C4E0A48A865F8 v3 = self->_flags;
    if ((*(_DWORD *)&v3 & 0x400000) == 0) {
      return;
    }
    $692BA5F601ABB544448C4E0A48A865F8 v4 = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&v3 & 0xFFFFFFFFFFBFFFFFLL);
  }
  self->_$692BA5F601ABB544448C4E0A48A865F8 flags = v4;
  id v6 = +[UIMenuSystem mainSystem];
  [v6 setNeedsRevalidate];
}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  if (self->_postTransitionResponder) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  char v4 = objc_msgSend(WeakRetained, "_super_disableAutomaticKeyboardBehavior");

  return v4;
}

- (void)_didChangeToFirstResponder:(id)a3
{
  postTransitionResponder = self->_postTransitionResponder;
  if (postTransitionResponder)
  {
    if (postTransitionResponder == a3)
    {
      $692BA5F601ABB544448C4E0A48A865F8 v5 = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFFFFFF3FFLL);
    }
    else
    {
      $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
      if (a3) {
        $692BA5F601ABB544448C4E0A48A865F8 v5 = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x400);
      }
      else {
        $692BA5F601ABB544448C4E0A48A865F8 v5 = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x800);
      }
    }
    self->_$692BA5F601ABB544448C4E0A48A865F8 flags = v5;
  }
}

- (void)_commonInit
{
  $692BA5F601ABB544448C4E0A48A865F8 v3 = [UIPanelController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  $692BA5F601ABB544448C4E0A48A865F8 v5 = [(UIPanelController *)v3 initWithOwningViewController:WeakRetained];
  [(UISplitViewControllerPanelImpl *)self setPanelController:v5];

  id v6 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v6 setDelegate:self];

  self->_preferredPrimaryColumnWidthFraction = -3.40282347e38;
  int64x2_t v7 = vdupq_n_s64(0xC7EFFFFFE0000000);
  self->_preferredSupplementaryColumnWidthFraction = -3.40282347e38;
  *(int64x2_t *)&self->_preferredPrimaryColumnWidth = v7;
  *(int64x2_t *)&self->_maximumPrimaryColumnWidth = v7;
  *(int64x2_t *)&self->_minimumSupplementaryColumnWidth = v7;
  self->_primaryEdge = 0;
  v8 = (void *)MEMORY[0x1E4F1CA48];
  v9 = [[_UIHyperpoint alloc] initWithDimensions:1];
  v10 = [[_UIHyperpoint alloc] initWithDimensions:1];
  objc_msgSend(v8, "arrayWithObjects:", v9, v10, 0);
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  hyperpoints = self->_hyperpoints;
  self->_hyperpoints = v11;

  v13 = [[_UIHyperregionUnion alloc] initWithDimensions:1];
  regionUnion = self->_regionUnion;
  self->_regionUnion = v13;

  [(_UIHyperregionUnion *)self->_regionUnion _setRegions:self->_hyperpoints];
  id v15 = [[_UIHyperrectangle alloc] initWithDimensions:1];
  hyperrectangle = self->_hyperrectangle;
  self->_hyperrectangle = v15;

  v17 = [[_UIHyperInteractor alloc] initWithDimensions:1];
  interactor = self->_interactor;
  self->_interactor = v17;

  v19 = [(_UIHyperInteractor *)self->_interactor _extender];
  extender = self->_extender;
  self->_extender = v19;

  id v21 = [(UISplitViewControllerPanelImpl *)self styleProvider];
  [v21 maximumRubberbandingDistance];
  -[_UIHyperConstantExtender _setMaximumDistance:](self->_extender, "_setMaximumDistance:");

  id v22 = objc_loadWeakRetained((id *)&self->_svc);
  v23 = [v22 traitCollection];
  self->_presentsWithGesture = [v23 userInterfaceIdiom] != 6;

  int v24 = dyld_program_sdk_at_least();
  uint64_t v25 = 0x2000;
  if (!v24) {
    uint64_t v25 = 0;
  }
  self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v25);
  BOOL v26 = +[UISplitViewController _devicePrefersOverlayInRegularWidth];
  uint64_t v27 = 0x4000;
  if (!v26) {
    uint64_t v27 = 0;
  }
  self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v27);
  self->_primaryBackgroundStyle = 0;
  self->_lastFocusedChildViewControllerColumn = 999;
  self->__primaryOffscreenGestureMode = [(UISplitViewControllerPanelImpl *)self _defaultPrimaryOffscreenGestureModeForCurrentIdiom];
}

- (void)setPanelController:(id)a3
{
}

- (int64_t)_defaultPrimaryOffscreenGestureModeForCurrentIdiom
{
  if (qword_1EB260170 != -1) {
    dispatch_once(&qword_1EB260170, &__block_literal_global_1405);
  }
  return 0;
}

- (void)_setWantsFloatingSidebar:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v4 setWantsFloatingSidebar:v3];
}

- (void)_setFluidSidebarPresentationGestureRecognizer:(id)a3
{
  $692BA5F601ABB544448C4E0A48A865F8 v5 = (UIPanGestureRecognizer *)a3;
  int64_t v6 = [(UISplitViewControllerPanelImpl *)self style];
  if ((unint64_t)(v6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v8 = v6;
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = _UISplitViewControllerStyleDescription(v8);
    [v9 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 7496, @"Incorrect code path for UISplitViewControllerStyle %@", v10 object file lineNumber description];
  }
  if (![(UISplitViewControllerPanelImpl *)self _shouldUseFluidSidebarGestures])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UISplitViewControllerPanelImpl.m" lineNumber:7497 description:@"Wrong accessor for fluid sidebar gesture"];
  }
  sidebarPanGestureRecognizer = self->_sidebarPanGestureRecognizer;
  self->_sidebarPanGestureRecognizer = v5;
}

- (UIPanGestureRecognizer)_presentationGestureRecognizer
{
  if ([(UISplitViewControllerPanelImpl *)self _shouldUseFluidSidebarGestures])
  {
    int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UISplitViewControllerPanelImpl.m" lineNumber:7490 description:@"Wrong accessor for pre-iOS14 sidebar gesture"];
  }
  sidebarPanGestureRecognizer = self->_sidebarPanGestureRecognizer;
  return sidebarPanGestureRecognizer;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  if ([(UISplitViewControllerPanelImpl *)self _shouldUseFluidSidebarGestures])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    $692BA5F601ABB544448C4E0A48A865F8 v5 = [WeakRetained traitCollection];
    uint64_t v6 = [v5 layoutDirection];
    uint64_t v7 = [v47 layoutDirection];

    if (v6 != v7) {
      [(UISplitViewControllerPanelImpl *)self _updatePresentationGestureRecognizer];
    }
  }
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    id v8 = objc_loadWeakRetained((id *)&self->_svc);
    v9 = [v8 traitCollection];
    uint64_t v10 = [v9 _presentationSemanticContext];
    uint64_t v11 = [v47 _presentationSemanticContext];

    if (v10 != v11)
    {
      uint64_t v12 = [v47 _presentationSemanticContext];
      if (!self) {
        goto LABEL_23;
      }
      uint64_t v14 = v12;
      int64_t v15 = [(UISplitViewControllerPanelImpl *)self style];
      if ((unint64_t)(v15 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        unint64_t v44 = v15;
        double v45 = [MEMORY[0x1E4F28B00] currentHandler];
        double v46 = _UISplitViewControllerStyleDescription(v44);
        [v45 handleFailureInMethod:sel__updateDisplayModeIfNecessaryForChangeFromPresentationSemanticContext_, self, @"UISplitViewControllerPanelImpl.m", 3407, @"Incorrect code path for UISplitViewControllerStyle %@", v46 object file lineNumber description];
      }
      id v16 = objc_loadWeakRetained((id *)&self->_svc);
      v17 = [v16 _existingView];
      [v17 bounds];
      double Width = CGRectGetWidth(v62);

      id v19 = objc_loadWeakRetained((id *)&self->_svc);
      v20 = [v19 traitCollection];
      uint64_t v21 = [v20 _presentationSemanticContext];

      if (Width <= 0.0) {
        goto LABEL_23;
      }
      id v22 = objc_loadWeakRetained((id *)&self->_svc);
      if (!_UISplitViewControllerAutoHidesColumns(v22) || v21 == v14)
      {
      }
      else
      {
        BOOL v23 = [(UISplitViewControllerPanelImpl *)self _isCollapsedOrCollapsing];

        if (!v23)
        {
          double v48 = 0.0;
          double v49 = 0.0;
          -[UISplitViewControllerPanelImpl getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:](self, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", &v49, &v48, 2, 1, 0, 0, Width, 800.0);
          if (v48 == 0.0 || (double v13 = v49, v49 == 0.0))
          {
            if (_UIGetUISplitViewControllerChamoisResizeLogging())
            {
              int v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("ChamoisResize", &qword_1EB2600F8) + 8);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                uint64_t v25 = v24;
                id v26 = objc_loadWeakRetained((id *)&self->_svc);
                *(_DWORD *)buf = 138412546;
                id v51 = v26;
                __int16 v52 = 2048;
                double v53 = Width;
                _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "%@: Updating display mode if necessary for change in presentationSemanticContext with width %g", buf, 0x16u);
              }
            }
            int64_t v27 = [(UISplitViewControllerPanelImpl *)self displayMode];
            unint64_t v28 = v27;
            if (v27 != 2 || v21 == 2)
            {
              if (v27 == 1
                && v21 == 2
                && ![(UISplitViewControllerPanelImpl *)self _isSecondaryColumnCompactInTotalWidth:Width withPrimaryColumnWidth:v49 supplementaryColumnWidth:v48])
              {
                unint64_t v29 = 2;
LABEL_34:
                if (_UIGetUISplitViewControllerChamoisResizeLogging())
                {
                  v38 = *(NSObject **)(__UILogGetCategoryCachedImpl("ChamoisResize", &qword_1EB260100) + 8);
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    v39 = v38;
                    id v40 = objc_loadWeakRetained((id *)&self->_svc);
                    v41 = _UISplitViewControllerDisplayModeDescription(v28);
                    v42 = _UISplitViewControllerDisplayModeDescription(v29);
                    *(_DWORD *)buf = 138413058;
                    id v51 = v40;
                    __int16 v52 = 2112;
                    double v53 = *(double *)&v41;
                    __int16 v54 = 2112;
                    uint64_t v55 = (uint64_t)v42;
                    __int16 v56 = 2048;
                    double v57 = Width;
                    _os_log_impl(&dword_1853B0000, v39, OS_LOG_TYPE_ERROR, "%@: Automatically changing displayMode from %@ to %@ for change in presentationSemanticContext with width %g", buf, 0x2Au);
                  }
                }
                [(UISplitViewControllerPanelImpl *)self setUserGeneratedDisplayMode:0];
                v43 = [(UISplitViewControllerPanelImpl *)self panelController];
                [v43 setNeedsUpdate];

                goto LABEL_23;
              }
            }
            else if ([(UISplitViewControllerPanelImpl *)self _isSecondaryColumnCompactInTotalWidth:Width withPrimaryColumnWidth:v49 supplementaryColumnWidth:v48])
            {
              unint64_t v29 = 1;
              goto LABEL_34;
            }
            if (_UIGetUISplitViewControllerChamoisResizeLogging())
            {
              v34 = *(NSObject **)(__UILogGetCategoryCachedImpl("ChamoisResize", &qword_1EB260108) + 8);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                double v35 = v34;
                id v36 = objc_loadWeakRetained((id *)&self->_svc);
                BOOL v37 = _UISplitViewControllerDisplayModeDescription(v28);
                *(_DWORD *)buf = 138413314;
                id v51 = v36;
                __int16 v52 = 2112;
                double v53 = *(double *)&v37;
                __int16 v54 = 2048;
                uint64_t v55 = v14;
                __int16 v56 = 2048;
                double v57 = *(double *)&v21;
                __int16 v58 = 2048;
                double v59 = Width;
                _os_log_impl(&dword_1853B0000, v35, OS_LOG_TYPE_ERROR, "%@: Unchanged displayMode, %@, despite change in presentationSemanticContext (from %ld to %ld) with width %g", buf, 0x34u);
              }
            }
          }
        }
      }
LABEL_23:
      double v30 = [(UISplitViewControllerPanelImpl *)self panelController];
      [v30 setNeedsUpdate];
    }
  }
  double v31 = [(UISplitViewControllerPanelImpl *)self panelController];
  id v32 = objc_loadWeakRetained((id *)&self->_svc);
  double v33 = [v32 traitCollection];
  [v31 traitCollectionDidChange:v47 toNewTraits:v33];
}

- (UIPanGestureRecognizer)_fluidSidebarPresentationGestureRecognizer
{
  int64_t v4 = [(UISplitViewControllerPanelImpl *)self style];
  if ((unint64_t)(v4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v7 = v4;
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = _UISplitViewControllerStyleDescription(v7);
    [v8 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 7503, @"Incorrect code path for UISplitViewControllerStyle %@", v9 object file lineNumber description];
  }
  if (![(UISplitViewControllerPanelImpl *)self _shouldUseFluidSidebarGestures])
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"UISplitViewControllerPanelImpl.m" lineNumber:7504 description:@"Wrong accessor for fluid sidebar gesture"];
  }
  sidebarPanGestureRecognizer = self->_sidebarPanGestureRecognizer;
  return sidebarPanGestureRecognizer;
}

- (void)_updatePresentationGestureRecognizer
{
  if ([(UISplitViewControllerPanelImpl *)self _shouldUseFluidSidebarGestures])
  {
    [(UISplitViewControllerPanelImpl *)self _fluidUpdatePresentationGestureRecognizers];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    int v3 = [WeakRetained presentsWithGesture];
    int64_t v4 = [(UISplitViewControllerPanelImpl *)self _presentationGestureRecognizer];
    $692BA5F601ABB544448C4E0A48A865F8 v5 = v4;
    if (v3)
    {

      if (!v5)
      {
        uint64_t v6 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:sel__presentationGestureRecognizerChanged_];
        [(UIPanGestureRecognizer *)v6 setMinimumNumberOfTouches:1];
        [(UIPanGestureRecognizer *)v6 setMaximumNumberOfTouches:2];
        [(UIGestureRecognizer *)v6 setAllowedTouchTypes:&unk_1ED3EF8C0];
        [(UIPanGestureRecognizer *)v6 setDelegate:self];
        [(UIPanGestureRecognizer *)v6 setAllowedScrollTypesMask:2];
        [(UISplitViewControllerPanelImpl *)self _setPresentationGestureRecognizer:v6];
        unint64_t v7 = [WeakRetained view];
        [v7 addGestureRecognizer:v6];
      }
      id v8 = [(UISplitViewControllerPanelImpl *)self panelController];
      v9 = [v8 currentState];

      if ([(UISplitViewControllerPanelImpl *)self style])
      {
        uint64_t v10 = 1;
      }
      else
      {
        if ([(UISplitViewControllerPanelImpl *)self _isPrimaryLeading]) {
          uint64_t v13 = [v9 _leadingEntirelyOverlapsMain];
        }
        else {
          uint64_t v13 = [v9 _trailingEntirelyOverlapsMain];
        }
        uint64_t v10 = v13;
      }
      uint64_t v14 = [(UISplitViewControllerPanelImpl *)self _presentationGestureRecognizer];
      [v14 setEnabled:v10];
    }
    else
    {

      if (v5)
      {
        uint64_t v11 = [WeakRetained view];
        uint64_t v12 = [(UISplitViewControllerPanelImpl *)self _presentationGestureRecognizer];
        [v11 removeGestureRecognizer:v12];

        [(UISplitViewControllerPanelImpl *)self _setPresentationGestureRecognizer:0];
      }
    }
  }
}

- (BOOL)_shouldUseFluidSidebarGestures
{
  return [(UISplitViewControllerPanelImpl *)self style] != 0;
}

- (void)_fluidUpdatePresentationGestureRecognizers
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int v4 = [WeakRetained presentsWithGesture];
  $692BA5F601ABB544448C4E0A48A865F8 v5 = [(UISplitViewControllerPanelImpl *)self _fluidSidebarPresentationGestureRecognizer];
  uint64_t v6 = v5;
  if (v4)
  {

    if (!v6)
    {
      unint64_t v7 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:sel__presentationGestureRecognizerChanged_];
      [(UIPanGestureRecognizer *)v7 setMinimumNumberOfTouches:1];
      [(UIPanGestureRecognizer *)v7 setMaximumNumberOfTouches:2];
      [(UIGestureRecognizer *)v7 setAllowedTouchTypes:&unk_1ED3EF890];
      [(UIPanGestureRecognizer *)v7 setDelegate:self];
      [(UIPanGestureRecognizer *)v7 setAllowedScrollTypesMask:2];
      [(UISplitViewControllerPanelImpl *)self _setFluidSidebarPresentationGestureRecognizer:v7];
      id v8 = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:sel__presentationGestureRecognizerChanged_];
      [(UIScreenEdgePanGestureRecognizer *)v8 setMinimumNumberOfTouches:1];
      [(UIPanGestureRecognizer *)v8 setMaximumNumberOfTouches:2];
      [(UIGestureRecognizer *)v8 setAllowedTouchTypes:&unk_1ED3EF8A8];
      [(UIPanGestureRecognizer *)v8 setDelegate:self];
      [(UISplitViewControllerPanelImpl *)self _setFluidOpenSidebarPresentationGestureRecognizer:v8];
      id v9 = objc_loadWeakRetained((id *)p_svc);
      uint64_t v10 = [v9 view];

      [v10 addGestureRecognizer:v7];
      [v10 addGestureRecognizer:v8];
    }
    unint64_t v11 = [(UISplitViewControllerPanelImpl *)self _effectivePrimaryRectEdge];
    uint64_t v12 = [(UISplitViewControllerPanelImpl *)self _fluidOpenSidebarPresentationGestureRecognizer];
    [v12 setEdges:v11];
  }
  else
  {

    if (!v6) {
      goto LABEL_8;
    }
    id v13 = objc_loadWeakRetained((id *)p_svc);
    uint64_t v12 = [v13 view];

    uint64_t v14 = [(UISplitViewControllerPanelImpl *)self _fluidOpenSidebarPresentationGestureRecognizer];
    [v12 removeGestureRecognizer:v14];

    int64_t v15 = [(UISplitViewControllerPanelImpl *)self _fluidSidebarPresentationGestureRecognizer];
    [v12 removeGestureRecognizer:v15];

    [(UISplitViewControllerPanelImpl *)self _setFluidOpenSidebarPresentationGestureRecognizer:0];
    [(UISplitViewControllerPanelImpl *)self _setFluidSidebarPresentationGestureRecognizer:0];
  }

LABEL_8:
}

- (UIScreenEdgePanGestureRecognizer)_fluidOpenSidebarPresentationGestureRecognizer
{
  return self->__fluidOpenSidebarPresentationGestureRecognizer;
}

- (unint64_t)_effectivePrimaryRectEdge
{
  if ([(UISplitViewControllerPanelImpl *)self _layoutPrimaryOnRight]) {
    return 8;
  }
  else {
    return 2;
  }
}

- (void)_setFluidOpenSidebarPresentationGestureRecognizer:(id)a3
{
}

- (void)_setPresentationGestureRecognizer:(id)a3
{
  $692BA5F601ABB544448C4E0A48A865F8 v5 = (UIPanGestureRecognizer *)a3;
  if ([(UISplitViewControllerPanelImpl *)self _shouldUseFluidSidebarGestures])
  {
    unint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UISplitViewControllerPanelImpl.m" lineNumber:7484 description:@"Wrong accessor for pre-iOS14 sidebar gesture"];
  }
  sidebarPanGestureRecognizer = self->_sidebarPanGestureRecognizer;
  self->_sidebarPanGestureRecognizer = v5;
}

- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5
{
  id v9 = a3;
  if (-[UISplitViewControllerPanelImpl _shouldZeroSafeAreaInsetsForViewController:](self, "_shouldZeroSafeAreaInsetsForViewController:"))
  {
    *a4 = 0.0;
    *a5 = 0.0;
  }
  else if ([(UISplitViewControllerPanelImpl *)self style])
  {
    [(UISplitViewControllerPanelImpl *)self _contentMarginForChildViewController:v9];
    *(void *)a5 = v8;
    *(void *)a4 = v8;
  }
  else
  {
    *a4 = -1.79769313e308;
    *a5 = -1.79769313e308;
  }
}

- (BOOL)_shouldZeroSafeAreaInsetsForViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];

  if (v5 == v4 && qword_1EB260170 != -1) {
    dispatch_once(&qword_1EB260170, &__block_literal_global_1405);
  }

  return 0;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  [WeakRetained _contentOverlayInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    if ([(UISplitViewControllerPanelImpl *)self _usePaddingForEdgeInsetsForChildViewController:v6])
    {
      BOOL v16 = [(UISplitViewControllerPanelImpl *)self _layoutPrimaryOnRight];
      [(_UIHyperConstantExtender *)self->_extender _maximumDistance];
      double v18 = v11 + v17;
      double v19 = v15 + v17;
      if (v16) {
        double v15 = v19;
      }
      else {
        double v15 = 0.0;
      }
      if (v16) {
        double v11 = 0.0;
      }
      else {
        double v11 = v18;
      }
    }
    else if (![(UISplitViewControllerPanelImpl *)self _isCollapsedOrCollapsing])
    {
      uint64_t v21 = [v6 view];
      [v21 frame];
      CGFloat v23 = v22;
      CGFloat v50 = v24;
      CGFloat v51 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v48 = v28;
      CGFloat v49 = v26;
      CGFloat v29 = v28;

      v52.origin.x = v23;
      v52.origin.y = v25;
      v52.size.width = v27;
      v52.size.height = v29;
      double v11 = fmax(fmin(v11 - CGRectGetMinX(v52), v11), 0.0);
      double v30 = [v6 view];
      double v31 = [v30 superview];
      [v31 bounds];
      CGFloat v33 = v32;
      CGFloat v35 = v34;
      CGFloat v37 = v36;
      CGFloat v39 = v38;

      v53.origin.x = v33;
      v53.origin.y = v35;
      v53.size.width = v37;
      v53.size.height = v39;
      double MaxX = CGRectGetMaxX(v53);
      v54.origin.y = v50;
      v54.origin.x = v51;
      v54.size.height = v48;
      v54.size.width = v49;
      double v15 = fmax(fmin(v15 - (MaxX - CGRectGetMaxX(v54)), v15), 0.0);
    }
  }
  else
  {
    [(UISplitViewControllerPanelImpl *)self _contentMarginForChildViewController:v6];
    double v15 = v20;
    double v11 = v20;
  }
  v41 = [(UISplitViewControllerPanelImpl *)self tabBarHostedView];
  v42 = v41;
  if (v41)
  {
    [v41 floatingTabBarTopInsetForViewController:v6];
    double v9 = v9 + v43;
  }

  *a4 = 1;
  double v44 = v9;
  double v45 = v11;
  double v46 = v13;
  double v47 = v15;
  result.right = v47;
  result.bottom = v46;
  result.left = v45;
  result.top = v44;
  return result;
}

- (BOOL)isCollapsed
{
  if (self->_transitioningToTraitCollection)
  {
    return [(UISplitViewControllerPanelImpl *)self _isCollapsed];
  }
  else
  {
    int v3 = [(UISplitViewControllerPanelImpl *)self panelController];
    id v4 = [v3 currentState];
    char v5 = [v4 isCollapsed];

    return v5;
  }
}

- (double)_contentMarginForChildViewController:(id)a3
{
  id v4 = a3;
  char v5 = [(UISplitViewControllerPanelImpl *)self panelController];
  uint64_t v6 = [v5 mainViewController];
  if ((id)v6 == v4)
  {

    goto LABEL_5;
  }
  unint64_t v7 = (void *)v6;
  double v8 = [(UISplitViewControllerPanelImpl *)self panelController];
  id v9 = [v8 collapsedViewController];

  if (v9 == v4)
  {
LABEL_5:
    double v10 = [v4 view];
    +[UIViewController _horizontalContentMarginForView:v10];
    goto LABEL_6;
  }
  double v10 = [v4 traitCollection];
  +[UIViewController _slimHorizontalContentMarginForTraitCollection:v10];
LABEL_6:
  double v12 = v11;

  return v12;
}

- (BOOL)_isCollapsedOrCollapsing
{
  if ([(UISplitViewControllerPanelImpl *)self _isCollapsed]) {
    return 1;
  }
  id v4 = [(UISplitViewControllerPanelImpl *)self panelController];
  char v5 = [v4 currentState];
  BOOL v3 = [v5 _collapsedState] == 1;

  return v3;
}

- (BOOL)_isCollapsed
{
  uint64_t v2 = [(UISplitViewControllerPanelImpl *)self panelController];
  char v3 = [v2 isCollapsed];

  return v3;
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  id v4 = a3;
  char v5 = +[UITraitCollection _emptyTraitCollection]();
  if (!v5) {
    goto LABEL_29;
  }
  id v6 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];

  if (v6 == v4)
  {
    unint64_t v7 = [(UISplitViewControllerPanelImpl *)self panelController];
    double v8 = [v7 currentState];

    if ([(UISplitViewControllerPanelImpl *)self _isPrimaryLeading])
    {
      if (([v8 leadingOverlapsMain] & 1) == 0)
      {
LABEL_5:

        goto LABEL_8;
      }
    }
    else if (([v8 trailingOverlapsMain] & 1) == 0)
    {
      goto LABEL_5;
    }
    uint64_t v9 = -[UITraitCollection _traitCollectionWithIncrementedBackgroundLevel](v5);

    char v5 = (void *)v9;
    if (!v9) {
      goto LABEL_29;
    }
  }
LABEL_8:
  if (!objc_msgSend(v4, "__isKindOfUIViewController")) {
    goto LABEL_29;
  }
  uint64_t v10 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];
  if ((id)v10 == v4)
  {
  }
  else
  {
    double v11 = (void *)v10;
    if ((*((unsigned char *)&self->_flags + 5) & 4) == 0 || [(UISplitViewControllerPanelImpl *)self style] != 2) {
      goto LABEL_17;
    }
    int64_t v12 = [(UISplitViewControllerPanelImpl *)self _columnForViewController:v4];

    if (v12 != 1) {
      goto LABEL_18;
    }
  }
  if (self->_primaryBackgroundStyle == 1)
  {
    [v5 _traitCollectionByReplacingNSIntegerValue:2 forTraitToken:0x1ED3F5BF8];
    char v5 = v11 = v5;
LABEL_17:
  }
LABEL_18:
  if ([(UISplitViewControllerPanelImpl *)self style]
    && ![(UISplitViewControllerPanelImpl *)self _isCollapsed])
  {
    unint64_t v13 = [(UISplitViewControllerPanelImpl *)self _columnForViewController:v4];
    unint64_t v14 = v13;
    if (v13 < 2)
    {
      if (v13 == 1)
      {
        uint64_t v15 = 3;
      }
      else
      {
        int64_t v17 = [(UISplitViewControllerPanelImpl *)self style];
        uint64_t v15 = 1;
        if (v17 == 2) {
          uint64_t v15 = 2;
        }
      }
      goto LABEL_28;
    }
    char v16 = dyld_program_sdk_at_least();
    if (v14 == 3 && (v16 & 1) != 0)
    {
      uint64_t v15 = 0;
LABEL_28:
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __70__UISplitViewControllerPanelImpl__traitCollectionForChildEnvironment___block_invoke;
      v20[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
      v20[4] = v15;
      uint64_t v18 = [v5 traitCollectionByModifyingTraits:v20];

      char v5 = (void *)v18;
    }
  }
LABEL_29:

  return v5;
}

- (int64_t)style
{
  return [(UIPanelController *)self->_panelController style];
}

- (id)_currentPrimaryChildViewController
{
  char v3 = [(UISplitViewControllerPanelImpl *)self panelController];
  if ([(UISplitViewControllerPanelImpl *)self _isPrimaryLeading]) {
    [v3 leadingViewController];
  }
  else {
  id v4 = [v3 trailingViewController];
  }

  return v4;
}

- (UIPanelController)panelController
{
  return self->_panelController;
}

- (BOOL)_isPrimaryLeading
{
  return self->_primaryEdge == 0;
}

- (_UITabContainerView)tabBarHostedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarHostedView);
  return (_UITabContainerView *)WeakRetained;
}

- (BOOL)_usePaddingForEdgeInsetsForChildViewController:(id)a3
{
  id v4 = a3;
  if ([(UISplitViewControllerPanelImpl *)self _isCollapsedOrCollapsing]
    || (int64_t v5 = [(UISplitViewControllerPanelImpl *)self style]) == 0)
  {
    BOOL v8 = 0;
  }
  else
  {
    if (v5 == 1)
    {
      uint64_t v7 = 0;
    }
    else if (v5 == 2)
    {
      id v6 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
      uint64_t v7 = v6 == 0;
    }
    else
    {
      uint64_t v7 = 1;
    }
    BOOL v8 = [(UISplitViewControllerPanelImpl *)self _columnForViewController:v4] == v7;
  }

  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if (_UISplitViewControllerAutoHidesColumns(WeakRetained)
    && ![(UISplitViewControllerPanelImpl *)self _isCollapsedOrCollapsing])
  {
    uint64_t v4 = *(void *)&self->_flags & 0xC0000;

    if (v4)
    {
      $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
      self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&flags & 0xFFFFFFFFFFF3FFFFLL);
      int64_t v6 = [(UISplitViewControllerPanelImpl *)self displayMode];
      if (v6 != [(UISplitViewControllerPanelImpl *)self allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:v6])self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFFFF3FFFFLL | (((*(unint64_t *)&flags >> 18) & 3) << 18)); {
    }
      }
  }
  else
  {
  }
}

- (int64_t)preferredTrailingStatusBarStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int v4 = [WeakRetained _shouldUseSeparateStatusBarStyles];

  if (!v4) {
    return 4;
  }
  int64_t v5 = [(UISplitViewControllerPanelImpl *)self trailingVisibleViewController];
  int64_t v6 = [v5 _effectiveStatusBarStyleViewController];

  uint64_t v7 = _viewControllerIfStatusBarPartStyleProviding(v6);
  BOOL v8 = v7;
  if (!v7 || (int64_t v9 = [v7 preferredTrailingStatusBarStyle], v9 == 4))
  {
    uint64_t v10 = [v6 preferredStatusBarStyle];
    if (v10 == 1) {
      int64_t v9 = 1;
    }
    else {
      int64_t v9 = 2 * (v10 == 3);
    }
  }

  return v9;
}

- (id)childViewControllerForStatusBarStyle
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  char v5 = [WeakRetained _shouldUseNewStatusBarBehavior];

  id v6 = objc_loadWeakRetained((id *)p_svc);
  uint64_t v7 = v6;
  if (v5)
  {
    if ([v6 _shouldUseSeparateStatusBarStyles])
    {
      BOOL v8 = 0;
    }
    else
    {
      int64_t v9 = [(UISplitViewControllerPanelImpl *)self panelController];
      BOOL v8 = [v9 collapsedViewController];
    }
  }
  else
  {
    BOOL v8 = objc_msgSend(v6, "_super_childViewControllerForStatusBarStyle");
  }

  return v8;
}

- (int64_t)preferredLeadingStatusBarStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int v4 = [WeakRetained _shouldUseSeparateStatusBarStyles];

  if (!v4) {
    return 4;
  }
  char v5 = [(UISplitViewControllerPanelImpl *)self leadingVisibleViewController];
  id v6 = [v5 _effectiveStatusBarStyleViewController];

  uint64_t v7 = _viewControllerIfStatusBarPartStyleProviding(v6);
  BOOL v8 = v7;
  if (!v7 || (int64_t v9 = [v7 preferredLeadingStatusBarStyle], v9 == 4))
  {
    uint64_t v10 = [v6 preferredStatusBarStyle];
    if (v10 == 1) {
      int64_t v9 = 1;
    }
    else {
      int64_t v9 = 2 * (v10 == 3);
    }
  }

  return v9;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  BOOL v3 = [(UISplitViewControllerPanelImpl *)self _isCollapsed];
  int v4 = [(UISplitViewControllerPanelImpl *)self panelController];
  char v5 = v4;
  if (v3) {
    [v4 collapsedViewController];
  }
  else {
  id v6 = [v4 mainViewController];
  }

  return v6;
}

- (int64_t)preferredCenterStatusBarStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int v4 = [WeakRetained _shouldUseSeparateStatusBarStyles];

  if (v4)
  {
    int64_t v5 = [(UISplitViewControllerPanelImpl *)self style];
    id v6 = [(UISplitViewControllerPanelImpl *)self panelController];
    uint64_t v7 = v6;
    if (!v5)
    {
      double v11 = [v6 mainViewController];
      int64_t v12 = [v11 _effectiveStatusBarStyleViewController];
      unint64_t v13 = v12;
      unint64_t v14 = v7;
      goto LABEL_16;
    }
    if ([v6 isAnimating])
    {
      int v8 = [v7 isLeadingViewControllerVisibleAfterAnimation];
      int v9 = [v7 isTrailingViewControllerVisibleAfterAnimation];
      if (![v7 isSupplementaryViewControllerVisibleAfterAnimation]) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v15 = [v7 currentState];
      int v8 = [v15 isLeadingVisible];

      char v16 = [v7 currentState];
      int v9 = [v16 isTrailingVisible];

      int64_t v17 = [v7 currentState];
      LODWORD(v16) = [v17 isSupplementaryVisible];

      if (!v16) {
        goto LABEL_11;
      }
    }
    if (v8 | v9)
    {
      uint64_t v18 = [v7 supplementaryViewController];
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v18 = [v7 mainViewController];
LABEL_12:
    double v19 = v18;
    int64_t v12 = [v18 _effectiveStatusBarStyleViewController];

    double v20 = _viewControllerIfStatusBarPartStyleProviding(v12);
    unint64_t v13 = v20;
    if (v20)
    {
      int64_t v10 = [v20 preferredTrailingStatusBarStyle];
      double v11 = v7;
      unint64_t v14 = v12;
      if (v10 != 4)
      {
LABEL_20:

        return v10;
      }
    }
    else
    {
      double v11 = v7;
      unint64_t v14 = v12;
    }
LABEL_16:
    uint64_t v21 = [v12 preferredStatusBarStyle];
    if (v21 == 1) {
      int64_t v10 = 1;
    }
    else {
      int64_t v10 = 2 * (v21 == 3);
    }
    uint64_t v7 = v11;
    int64_t v12 = v14;
    goto LABEL_20;
  }
  return 4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabBarHostedView);
  objc_storeStrong((id *)&self->_sidebarArrowButtonRecognizer, 0);
  objc_storeStrong((id *)&self->_detailFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_masterFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_menuGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__fullScreenButtonImage, 0);
  objc_storeStrong((id *)&self->__dimmingView, 0);
  objc_storeStrong((id *)&self->_panelController, 0);
  objc_storeStrong((id *)&self->__fluidOpenSidebarPresentationGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_extender, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_hyperrectangle, 0);
  objc_storeStrong((id *)&self->_regionUnion, 0);
  objc_storeStrong((id *)&self->_hyperpoints, 0);
  objc_storeStrong((id *)&self->_postTransitionResponder, 0);
  objc_storeStrong((id *)&self->_suspendedFirstResponder, 0);
  objc_storeStrong((id *)&self->_suspendedStateRequest, 0);
  objc_storeStrong((id *)&self->_suspendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_transitioningToTraitCollection, 0);
  objc_storeStrong((id *)&self->_overrideReportedDisplayModeStack, 0);
  objc_storeStrong((id *)&self->_sidebarPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_navBarForShortcutButton, 0);
  objc_storeStrong((id *)&self->_secondaryOnlyShortcutButtonItem, 0);
  objc_storeStrong((id *)&self->_navBarForToggleButton, 0);
  objc_storeStrong((id *)&self->_floatableButtonContainer, 0);
  objc_storeStrong((id *)&self->_sidebarToggleButtonItem, 0);
  objc_storeStrong((id *)&self->_displayModeButtonItemTitle, 0);
  objc_storeStrong((id *)&self->_unspecifiedStyleDisplayModeButtonItem, 0);
  objc_destroyWeak((id *)&self->_svc);
  objc_storeStrong((id *)&self->_perColumnViewControllers, 0);
}

- (double)maximumPrimaryColumnWidth
{
  return self->_maximumPrimaryColumnWidth;
}

- (void)_viewControllerChildViewControllersDidChange:(id)a3
{
  id v27 = a3;
  int64_t v4 = [(UISplitViewControllerPanelImpl *)self _columnForViewController:v27];
  uint64_t v5 = -[UISplitViewControllerPanelImpl _columnForViewController:forceExpandedResult:]((id *)&self->super.isa, v27, 1);
  if ((v5 & 0x3FD) == 0)
  {
    uint64_t v6 = v5;
    perColumnViewControllers = self->_perColumnViewControllers;
    int v8 = [NSNumber numberWithInteger:v5];
    int v9 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:v8];
    id v10 = [v9 navigationControllerWrapper];
    if (v10 == v27)
    {
      char v18 = [v27 _isTabBarController];

      if ((v18 & 1) == 0) {
        goto LABEL_8;
      }
    }
    else
    {
      double v11 = self->_perColumnViewControllers;
      int64_t v12 = [NSNumber numberWithInteger:v6];
      unint64_t v13 = [(NSMutableDictionary *)v11 objectForKeyedSubscript:v12];
      id v14 = [v13 viewController];
      if (v14 == v27)
      {
        uint64_t v15 = self->_perColumnViewControllers;
        double v26 = [NSNumber numberWithInteger:v6];
        char v16 = -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:");
        int64_t v17 = [v16 navigationController];
        if ([v17 _isCreatedBySplitViewController])
        {
          char v25 = [v27 _isTabBarController];

          if (v25) {
            goto LABEL_11;
          }
LABEL_8:
          [(UISplitViewControllerPanelImpl *)self setViewController:v27 forColumn:v6];
          goto LABEL_17;
        }

        id v14 = v27;
      }
    }
  }
LABEL_11:
  if (v4 != 3 && v4 != 999)
  {
    double v19 = self->_perColumnViewControllers;
    double v20 = [NSNumber numberWithInteger:v4];
    uint64_t v21 = [(NSMutableDictionary *)v19 objectForKeyedSubscript:v20];
    double v22 = [v21 navigationController];

    if ([v22 isNavigationBarHidden])
    {
      CGFloat v23 = [v22 _targetNavigationBarForUISplitViewControllerSidebarButton];
      double v24 = [v22 _existingNavigationBar];

      if (v23 != v24) {
        [(UISplitViewControllerPanelImpl *)self _updateDisplayModeButtonItem];
      }
    }
  }
LABEL_17:
}

- (void)updatePanelControllerForViewControllerChangeInColumn:(int64_t)a3 alwaysAnimate:(BOOL)a4 shouldUpdateCollapsedNavStack:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v9 = [(UISplitViewControllerPanelImpl *)self style];
  if (v9 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    CGRect v63 = [MEMORY[0x1E4F28B00] currentHandler];
    v64 = _UISplitViewControllerStyleDescription(v9);
    [v63 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 2652, @"Incorrect code path for UISplitViewControllerStyle %@", v64 object file lineNumber description];
  }
  SEL v70 = a2;
  perColumnViewControllers = self->_perColumnViewControllers;
  double v11 = [NSNumber numberWithInteger:a3];
  int64_t v12 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:v11];

  uint64_t v13 = [v12 navigationController];
  uint64_t v14 = [v12 navigationControllerWrapper];
  BOOL v15 = [(UISplitViewControllerPanelImpl *)self _isCollapsed];
  if (v15 || !(v13 | v14))
  {
    id v17 = [v12 viewController];
  }
  else
  {
    if (v14) {
      char v16 = (void *)v14;
    }
    else {
      char v16 = (void *)v13;
    }
    id v17 = v16;
  }
  v73 = v17;
  if (!a3) {
    [(UIPanelController *)self->_panelController setLeadingTrailingWrapsNavigationController:v14 != 0];
  }
  int64_t v18 = [(UISplitViewControllerPanelImpl *)self primaryEdge];
  if (v73) {
    BOOL v19 = v5;
  }
  else {
    BOOL v19 = 0;
  }
  if (v15 && v19)
  {
    if (v9 == 2)
    {
      char v25 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
      BOOL v20 = v25 == 0;

      BOOL v21 = v20;
    }
    else
    {
      BOOL v20 = 0;
      BOOL v21 = 0;
    }
    switch(a3)
    {
      case 0:
        double v26 = [(UIPanelController *)self->_panelController collapsedViewController];
        id v27 = [(UIPanelController *)self->_panelController leadingViewController];
        if (v27)
        {
          BOOL v28 = 0;
        }
        else
        {
          uint64_t v55 = [(UIPanelController *)self->_panelController trailingViewController];
          BOOL v28 = v55 == 0;
        }
        if (v14) {
          uint64_t v56 = v14;
        }
        else {
          uint64_t v56 = v13;
        }
        panelController = self->_panelController;
        if (v18)
        {
          [(UIPanelController *)panelController setTrailingViewController:v56];
          if (!v28) {
            break;
          }
        }
        else
        {
          [(UIPanelController *)panelController setLeadingViewController:v56];
          if (!v28) {
            break;
          }
        }
        __int16 v58 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
        double v59 = [v58 navigationController];

        if (v26 != v59)
        {
          if (os_variant_has_internal_diagnostics())
          {
            v68 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1853B0000, v68, OS_LOG_TYPE_FAULT, "Surprising configuration when changing view controller in primary column while collapsed", buf, 2u);
            }
          }
          else
          {
            v67 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack____s_category)+ 8);
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1853B0000, v67, OS_LOG_TYPE_ERROR, "Surprising configuration when changing view controller in primary column while collapsed", buf, 2u);
            }
          }
        }
        uint64_t v60 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
        CGRect v61 = [v60 navigationController];

        if (v26 == v61)
        {
          [(UIPanelController *)self->_panelController setSupplementaryViewController:0];
          [(UIPanelController *)self->_panelController setCollapsedViewController:v13];
          *(void *)buf = 0;
          v91 = buf;
          uint64_t v92 = 0x3032000000;
          v93 = __Block_byref_object_copy__60;
          v94 = __Block_byref_object_dispose__60;
          id v95 = 0;
          v86[0] = MEMORY[0x1E4F143A8];
          v86[1] = 3221225472;
          v86[2] = __131__UISplitViewControllerPanelImpl_updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack___block_invoke;
          v86[3] = &unk_1E52E1B98;
          v89 = buf;
          id v62 = v26;
          id v87 = v62;
          v88 = self;
          [v62 _executeSplitViewControllerActions:v86];
          [v62 _setAllowNestedNavigationControllers:0];
          [(id)v13 _setAllowNestedNavigationControllers:1];
          v82[0] = MEMORY[0x1E4F143A8];
          v82[1] = 3221225472;
          v82[2] = __131__UISplitViewControllerPanelImpl_updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack___block_invoke_2;
          v82[3] = &unk_1E52E5180;
          id v83 = (id)v13;
          id v84 = v62;
          v85 = buf;
          [v83 _executeSplitViewControllerActions:v82];

          _Block_object_dispose(buf, 8);
        }
        break;
      case 1:
        CGFloat v33 = self->_perColumnViewControllers;
        double v34 = [NSNumber numberWithInteger:v20];
        CGFloat v35 = [(NSMutableDictionary *)v33 objectForKeyedSubscript:v34];
        double v26 = [v35 navigationController];

        if (v26)
        {
          if (([v26 _isNavigationController] & 1) == 0)
          {
            v65 = [MEMORY[0x1E4F28B00] currentHandler];
            [v65 handleFailureInMethod:v70, self, @"UISplitViewControllerPanelImpl.m", 2703, @"Unexpectedly lost track of navigation controller for showing %@ column when collapsed", @"Supplementary" object file lineNumber description];
          }
          double v36 = [v26 topViewController];
          if (v36 != v73)
          {
            CGFloat v37 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
            double v38 = [v37 viewController];

            if (v36 == v38) {
              [(UISplitViewControllerPanelImpl *)self sendWillHideColumn:0];
            }
            [(UISplitViewControllerPanelImpl *)self sendWillShowColumn:1];
            v78[0] = MEMORY[0x1E4F143A8];
            v78[1] = 3221225472;
            v78[2] = __131__UISplitViewControllerPanelImpl_updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack___block_invoke_3;
            v78[3] = &unk_1E52DC3D0;
            id v79 = v26;
            id v80 = (id)v13;
            BOOL v81 = a4;
            [v79 _executeSplitViewControllerActions:v78];
          }
        }
        break;
      case 2:
        v41 = self->_perColumnViewControllers;
        v42 = [NSNumber numberWithInteger:v20];
        double v43 = [(NSMutableDictionary *)v41 objectForKeyedSubscript:v42];
        double v44 = [v43 navigationController];

        if (v44)
        {
          char v69 = v21;
          if (([v44 _isNavigationController] & 1) == 0)
          {
            v66 = [MEMORY[0x1E4F28B00] currentHandler];
            [v66 handleFailureInMethod:v70, self, @"UISplitViewControllerPanelImpl.m", 2722, @"Unexpectedly lost track of navigation controller for showing %@ column when collapsed", @"Secondary" object file lineNumber description];
          }
          v71 = [v44 topViewController];
          double v45 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
          double v46 = [v45 viewController];

          double v47 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
          CGFloat v48 = [v47 navigationController];

          CGFloat v49 = [v44 viewControllers];
          CGFloat v50 = (void *)[v49 mutableCopy];

          if (v9 != 2 || v48 == 0) {
            char v52 = 1;
          }
          else {
            char v52 = v69;
          }
          if ((v52 & 1) == 0 && v71 != v48) {
            [v50 addObject:v48];
          }
          if (v71 == v46 || v71 == v48)
          {
            [(UISplitViewControllerPanelImpl *)self sendWillHideColumn:v71 != v46];
            [(UISplitViewControllerPanelImpl *)self sendWillShowColumn:2];
          }
          if (v13) {
            CGRect v53 = (void *)v13;
          }
          else {
            CGRect v53 = v73;
          }
          [v50 addObject:v53];
          v74[0] = MEMORY[0x1E4F143A8];
          v74[1] = 3221225472;
          v74[2] = __131__UISplitViewControllerPanelImpl_updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack___block_invoke_4;
          v74[3] = &unk_1E52DC3D0;
          id v75 = v44;
          id v76 = v50;
          BOOL v77 = a4;
          id v54 = v50;
          [v75 _executeSplitViewControllerActions:v74];
        }
        goto LABEL_82;
      case 3:
        goto LABEL_82;
      default:
        goto LABEL_30;
    }
LABEL_81:
  }
  else
  {
    switch(a3)
    {
      case 0:
        uint64_t v22 = (uint64_t)v73;
        if (v13) {
          uint64_t v22 = v13;
        }
        if (v14) {
          uint64_t v23 = v14;
        }
        else {
          uint64_t v23 = v22;
        }
        double v24 = self->_panelController;
        if (v18) {
          [(UIPanelController *)v24 setTrailingViewController:v23];
        }
        else {
          [(UIPanelController *)v24 setLeadingViewController:v23];
        }
        break;
      case 1:
        double v31 = [(UIPanelController *)self->_panelController configuration];
        [v31 setSupplementaryEdge:v18];

        if (v13) {
          double v32 = (void *)v13;
        }
        else {
          double v32 = v73;
        }
        [(UIPanelController *)self->_panelController setSupplementaryViewController:v32];
        break;
      case 2:
        uint64_t v39 = (uint64_t)v73;
        if (v13) {
          uint64_t v39 = v13;
        }
        if (v14) {
          uint64_t v40 = v14;
        }
        else {
          uint64_t v40 = v39;
        }
        [(UIPanelController *)self->_panelController setMainViewController:v40];
        break;
      case 3:
        break;
      default:
LABEL_30:
        CGFloat v29 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v30 = *MEMORY[0x1E4F1C3C8];
        double v26 = _UISplitViewControllerColumnDescription(a3);
        [v29 raise:v30, @"Can't assign a view controller to %@ column", v26 format];
        goto LABEL_81;
    }
  }
LABEL_82:
}

- (void)_updateDisplayModeButtonItemForDisplayMode:(int64_t)a3
{
  unint64_t v123 = [(UISplitViewControllerPanelImpl *)self style];
  if (v123 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v113 = [MEMORY[0x1E4F28B00] currentHandler];
    v114 = _UISplitViewControllerStyleDescription(v123);
    [v113 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 8548, @"Incorrect code path for UISplitViewControllerStyle %@", v114 object file lineNumber description];
  }
  BOOL v127 = [(UISplitViewControllerPanelImpl *)self _isCollapsedOrCollapsing];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int64_t v6 = [(UISplitViewControllerPanelImpl *)self _concreteDisplayModeForCurrentEnvironment];
  int64_t v7 = v6;
  if (a3) {
    int v8 = (void *)a3;
  }
  else {
    int v8 = (void *)v6;
  }
  int64_t v9 = [(UISplitViewControllerPanelImpl *)self splitBehavior];
  if (!self->_sidebarToggleButtonItem && !v127)
  {
    id v10 = [(UIBarButtonItem *)[_UIFloatableBarButtonItem alloc] initWithImage:0 style:0 target:self action:sel__triggerDisplayModeAction_];
    sidebarToggleButtonItem = self->_sidebarToggleButtonItem;
    self->_sidebarToggleButtonItem = v10;
  }
  BOOL v12 = [(UISplitViewControllerPanelImpl *)self _alwaysHideSidebarToggleButton];
  uint64_t v13 = [(UISplitViewControllerPanelImpl *)self primaryEdge];
  BOOL v14 = v13 == 0;
  uint64_t v169 = 0;
  v170 = &v169;
  uint64_t v171 = 0x3032000000;
  v172 = __Block_byref_object_copy__60;
  v173 = __Block_byref_object_dispose__60;
  id v174 = 0;
  uint64_t v163 = 0;
  v164 = &v163;
  uint64_t v165 = 0x3032000000;
  v166 = __Block_byref_object_copy__60;
  v167 = __Block_byref_object_dispose__60;
  id v168 = 0;
  uint64_t v157 = 0;
  v158 = &v157;
  uint64_t v159 = 0x3032000000;
  v160 = __Block_byref_object_copy__60;
  v161 = __Block_byref_object_dispose__60;
  id v162 = 0;
  uint64_t v151 = 0;
  v152 = &v151;
  uint64_t v153 = 0x3032000000;
  v154 = __Block_byref_object_copy__60;
  v155 = __Block_byref_object_dispose__60;
  id v156 = 0;
  uint64_t v145 = 0;
  v146 = (double *)&v145;
  uint64_t v147 = 0x4010000000;
  v148 = &unk_186D7DBA7;
  long long v149 = 0u;
  long long v150 = 0u;
  [(_UIFloatableBarButtonItem *)self->_sidebarToggleButtonItem _setFloatable:0];
  BOOL v15 = [(UISplitViewControllerPanelImpl *)self _gestureIsForcingOverlay];
  if (v12)
  {
    int v121 = 0;
    BOOL v14 = 0;
    id v124 = 0;
    obj = 0;
LABEL_11:
    uint64_t v16 = 1;
    goto LABEL_86;
  }
  int v17 = v15;
  v137[0] = MEMORY[0x1E4F143A8];
  v137[1] = 3221225472;
  v138 = __77__UISplitViewControllerPanelImpl__updateDisplayModeButtonItemForDisplayMode___block_invoke;
  v139 = &unk_1E52E9C60;
  v140 = &v169;
  v141 = &v163;
  v142 = &v157;
  v143 = &v151;
  v144 = &v145;
  obj = [(UISplitViewControllerPanelImpl *)self _navigationBarForSidebarButtonForDisplayMode:v8];
  switch((unint64_t)v8)
  {
    case 1uLL:
    case 4uLL:
      id v124 = [(UISplitViewControllerPanelImpl *)self _sidebarToggleSymbolImage];
      [(_UIFloatableBarButtonItem *)self->_sidebarToggleButtonItem _setFloatable:v17 ^ 1u];
      int v121 = 0;
      BOOL v14 = 0;
      uint64_t v16 = 0;
      goto LABEL_86;
    case 2uLL:
      if (v123 != 2) {
        goto LABEL_60;
      }
      BOOL v20 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
      if (v20) {
        BOOL v21 = v9 == 1;
      }
      else {
        BOOL v21 = 1;
      }
      int v23 = v21 || v9 == 3;

      unsigned int v24 = v23 ^ 1;
      if (v13) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = v24;
      }
      if ((v23 & 1) != 0 || v25 != v24)
      {
        if (v23)
        {
LABEL_60:
          double v34 = [(UISplitViewControllerPanelImpl *)self _sidebarToggleSymbolImage];
          BOOL v14 = 0;
          int v121 = 0;
        }
        else
        {
          double v34 = [(UISplitViewControllerPanelImpl *)self _sidebarChevronSymbolImage];
          int v121 = 1;
        }
        id v124 = v34;

        unsigned int v26 = 1;
      }
      else
      {
        int v121 = v23 ^ 1;
        unsigned int v26 = 0;
        id v124 = 0;
        BOOL v14 = v25;
      }
      CGFloat v35 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
      double v36 = [v35 viewController];
      v138(v137, v36);

      perColumnViewControllers = self->_perColumnViewControllers;
      if (v123 == 2) {
        [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
      }
      else {
      double v38 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
      }
      id v39 = [v38 navigationController];

      v125 = v39;
      if (v14)
      {
        uint64_t v40 = [v39 viewControllers];
        if ((unint64_t)[v40 count] < 2)
        {
          uint64_t v16 = 0;
        }
        else
        {
          v41 = [v125 topViewController];
          v42 = [v41 navigationItem];
          unsigned int v119 = v26;
          double v43 = v41;
          uint64_t v16 = [v42 hidesBackButton] ^ 1;

          unsigned int v26 = v119;
        }

        if ((v17 & 1) == 0) {
          goto LABEL_75;
        }
LABEL_69:
        uint64_t v44 = 0;
        goto LABEL_78;
      }
      uint64_t v16 = 0;
      if (v17) {
        goto LABEL_69;
      }
LABEL_75:
      if (v9 == 3) {
        uint64_t v44 = 0;
      }
      else {
        uint64_t v44 = v26;
      }
LABEL_78:
      [(_UIFloatableBarButtonItem *)self->_sidebarToggleButtonItem _setFloatable:v44];
LABEL_85:

LABEL_86:
      if (v127
        || ![(UISplitViewControllerPanelImpl *)self allowsSecondaryOnlyShortcutButton])
      {
        v126 = 0;
        double v57 = 0;
LABEL_107:
        if (v14)
        {
          int v120 = 0;
          BOOL v62 = v8 == (void *)3 || v8 == (void *)5;
        }
        else
        {
          int v120 = 0;
          BOOL v62 = 0;
        }
        uint64_t v61 = 1;
        goto LABEL_116;
      }
      if (!self->_secondaryOnlyShortcutButtonItem)
      {
        CGRect v53 = [[UIBarButtonItem alloc] initWithImage:0 style:0 target:self action:sel__triggerSecondaryOnlyShortcutAction_];
        secondaryOnlyShortcutButtonItem = self->_secondaryOnlyShortcutButtonItem;
        self->_secondaryOnlyShortcutButtonItem = v53;
      }
      v126 = [(UISplitViewControllerPanelImpl *)self _fullScreenSymbolImageForDisplayMode:v8];
      uint64_t v55 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
      uint64_t v56 = [v55 navigationController];
      double v57 = [v56 navigationBar];

      BOOL v59 = v8 == (void *)3 || v8 == (void *)5;
      if ((v8 == (void *)6
         || v8 == (void *)v59
         || [(UISplitViewControllerPanelImpl *)self splitBehavior] == 2)
        && (v8 != (void *)1
         || ![(UISplitViewControllerPanelImpl *)self _gestureIsForcingOverlayForDisplayMode:v7]))
      {
        goto LABEL_107;
      }
      if (v57 == obj) {
        char v60 = v16;
      }
      else {
        char v60 = 1;
      }
      if (v60)
      {
        uint64_t v61 = 0;
        BOOL v62 = 0;
        int v120 = 1;
      }
      else
      {
        char v69 = self->_navBarForToggleButton;

        uint64_t v61 = 0;
        BOOL v62 = 0;
        int v120 = 1;
        double v57 = obj;
        uint64_t v16 = 1;
        obj = v69;
      }
LABEL_116:
      v64 = [(UISplitViewControllerPanelImpl *)self _navigationBarForSidebarButtonForColumn:2];
      [v64 _setStaticNavBarButtonLingers:v62];

      v65 = self->_sidebarToggleButtonItem;
      if (!v65)
      {
LABEL_157:
        BOOL v66 = 0;
        goto LABEL_158;
      }
      if ((v16 & 1) == 0)
      {
        int v8 = [(UIBarButtonItem *)v65 image];
        if (!v8)
        {
          BOOL v66 = 1;
          goto LABEL_137;
        }
        int64_t v67 = v9;
        BOOL v66 = 1;
        if (v14 | v121
          || v67 == 3
          || [(UIBarButtonItem *)self->_sidebarToggleButtonItem _showsBackButtonIndicator]
          || [(UIBarButtonItem *)self->_sidebarToggleButtonItem _showsChevron])
        {
          goto LABEL_137;
        }
        v68 = [(UIBarButtonItem *)self->_sidebarToggleButtonItem title];
        if (v68)
        {
LABEL_136:

          goto LABEL_137;
        }
      }
      if (self->_navBarForToggleButton == obj
        && v16 == [(UIBarButtonItem *)self->_sidebarToggleButtonItem isHidden])
      {
        if (v16)
        {
          BOOL v66 = 0;
          goto LABEL_138;
        }
        if (v14 | v121)
        {
          v68 = 0;
          BOOL v66 = 0;
        }
        else
        {
          SEL v70 = [(UIBarButtonItem *)self->_sidebarToggleButtonItem view];
          [v70 alpha];
          BOOL v66 = v71 < 0.01;

          v68 = 0;
        }
        goto LABEL_136;
      }
      BOOL v66 = 1;
      if ((v16 & 1) == 0) {
LABEL_137:
      }

LABEL_138:
      [(UIBarButtonItem *)self->_sidebarToggleButtonItem _setShowsBackButtonIndicator:v14];
      [(UIBarButtonItem *)self->_sidebarToggleButtonItem _setShowsChevron:v14];
      [(UIBarButtonItem *)self->_sidebarToggleButtonItem _setActsAsFakeBackButton:v14];
      v72 = self->_sidebarToggleButtonItem;
      if (v14)
      {
        [(UIBarButtonItem *)v72 setImage:v158[5]];
        [(UIBarButtonItem *)self->_sidebarToggleButtonItem setLargeContentSizeImage:v152[5]];
        -[UIBarButtonItem setLargeContentSizeImageInsets:](self->_sidebarToggleButtonItem, "setLargeContentSizeImageInsets:", v146[4], v146[5], v146[6], v146[7]);
        v73 = self->_sidebarToggleButtonItem;
        if (v158[5])
        {
          [(UIBarButtonItem *)self->_sidebarToggleButtonItem setTitle:0];
          uint64_t v74 = MEMORY[0x1E4F1CBF0];
        }
        else
        {
          if ([(id)v170[5] length]) {
            BOOL v77 = (__CFString *)v170[5];
          }
          else {
            BOOL v77 = @" ";
          }
          [(UIBarButtonItem *)v73 setTitle:v77];
          if (v164[5]) {
            uint64_t v74 = v164[5];
          }
          else {
            uint64_t v74 = MEMORY[0x1E4F1CBF0];
          }
        }
        [(UIBarButtonItem *)self->_sidebarToggleButtonItem _setBackButtonAlternateTitles:v74];
        [(UIBarButtonItem *)self->_sidebarToggleButtonItem _setLargeContentSizeTitle:0];
      }
      else
      {
        [(UIBarButtonItem *)v72 setImage:v124];
        [(UIBarButtonItem *)self->_sidebarToggleButtonItem setTitle:0];
        id v75 = self->_sidebarToggleButtonItem;
        id v76 = _UINSLocalizedStringWithDefaultValue(@"Sidebar", @"Sidebar");
        [(UIBarButtonItem *)v75 _setLargeContentSizeTitle:v76];
      }
      [(UIBarButtonItem *)self->_sidebarToggleButtonItem setHidden:v16];
      if (v121) {
        BOOL v78 = +[UIDragInteraction isEnabledByDefault];
      }
      else {
        BOOL v78 = 0;
      }
      [(UIBarButtonItem *)self->_sidebarToggleButtonItem setSpringLoaded:v78];
      navBarForToggleButton = self->_navBarForToggleButton;
      if (navBarForToggleButton == obj) {
        char v80 = 1;
      }
      else {
        char v80 = v16;
      }
      if ((v80 & 1) == 0)
      {
        [(UINavigationBar *)navBarForToggleButton _setStaticNavBarButtonItem:0];
        [(UINavigationBar *)obj _setStaticNavBarButtonItem:self->_sidebarToggleButtonItem];
        objc_storeStrong((id *)&self->_navBarForToggleButton, obj);
        goto LABEL_157;
      }
LABEL_158:
      BOOL v81 = self->_secondaryOnlyShortcutButtonItem;
      if (!v81)
      {
LABEL_175:
        int v88 = 0;
        goto LABEL_176;
      }
      int v82 = [(UIBarButtonItem *)v81 isHidden];
      if (v61 == v82)
      {
        int v83 = 0;
      }
      else
      {
        [(UIBarButtonItem *)self->_secondaryOnlyShortcutButtonItem setHidden:v61];
        int v83 = 1;
      }
      id v84 = [(UIBarButtonItem *)self->_secondaryOnlyShortcutButtonItem image];
      if (!v84
        || ([(UIBarButtonItem *)self->_secondaryOnlyShortcutButtonItem image],
            v85 = objc_claimAutoreleasedReturnValue(),
            char v86 = [v85 isEqual:v126],
            v85,
            v84,
            (v86 & 1) == 0))
      {
        [(UIBarButtonItem *)self->_secondaryOnlyShortcutButtonItem setImage:v126];
        int v83 = v61 & v82 ^ 1;
      }
      navBarForShortcutButton = self->_navBarForShortcutButton;
      if (navBarForShortcutButton != v57)
      {
        int v88 = v83 != 0;
        if (!v120) {
          goto LABEL_176;
        }
        goto LABEL_172;
      }
      v89 = [(UINavigationBar *)v57 _staticNavBarButtonItem];
      v90 = self->_secondaryOnlyShortcutButtonItem;

      int v88 = v83 != 0;
      char v91 = v120 ^ 1;
      if (v89 == v90) {
        char v91 = 1;
      }
      if ((v91 & 1) == 0)
      {
        navBarForShortcutButton = self->_navBarForShortcutButton;
LABEL_172:
        if (navBarForShortcutButton != self->_navBarForToggleButton) {
          [(UINavigationBar *)navBarForShortcutButton _setStaticNavBarButtonItem:0];
        }
        [(UINavigationBar *)v57 _setStaticNavBarButtonItem:self->_secondaryOnlyShortcutButtonItem];
        objc_storeStrong((id *)&self->_navBarForShortcutButton, v57);
        goto LABEL_175;
      }
LABEL_176:
      if (v123 == 2)
      {
        uint64_t v92 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
        BOOL v93 = v92 == 0;
      }
      else
      {
        BOOL v93 = 0;
      }
      if (v66 & v88)
      {
        v94 = self->_navBarForToggleButton;
        if (v94 != self->_navBarForShortcutButton)
        {
          BOOL v66 = 1;
          int v88 = 1;
          goto LABEL_188;
        }
        id v95 = v94;
        v96 = v95;
        int v88 = v120 | v16;
        if ((v120 | v16))
        {
          if ((v61 & 1) == 0)
          {
            [(UINavigationBar *)v95 _setStaticNavBarButtonItem:self->_secondaryOnlyShortcutButtonItem];
            BOOL v66 = 0;
LABEL_187:

            goto LABEL_188;
          }
        }
        else
        {
          [(UINavigationBar *)v95 _setStaticNavBarButtonItem:self->_sidebarToggleButtonItem];
        }
        BOOL v66 = 1;
        goto LABEL_187;
      }
LABEL_188:
      uint64_t v133 = 0;
      v134 = &v133;
      uint64_t v135 = 0x2020000000;
      char v136 = 0;
      v97 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A38];
      v98 = [v97 viewController];

      if (v98)
      {
        v99 = [(UINavigationBar *)self->_navBarForToggleButton delegate];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v101 = [(UINavigationBar *)self->_navBarForToggleButton delegate];
          v102 = (void *)v101;
          if (v101 && ((*(_DWORD *)(v101 + 376) >> 1) & 3u) - 1 <= 1)
          {
            v103 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A38];
            v104 = [v103 viewController];

            char v132 = 0;
            v129[0] = MEMORY[0x1E4F143A8];
            v129[1] = 3221225472;
            v129[2] = __77__UISplitViewControllerPanelImpl__updateDisplayModeButtonItemForDisplayMode___block_invoke_2;
            v129[3] = &unk_1E52E9C88;
            id v105 = v104;
            id v130 = v105;
            v131 = &v133;
            [v102 _enumerateAncestorViewControllersUntilStop:&v132 usingBlock:v129];
          }
        }
      }
      if (v66)
      {
        if (*((unsigned char *)v134 + 24) || !v127) {
          goto LABEL_200;
        }
        v107 = [(UINavigationBar *)self->_navBarForToggleButton delegate];
        v108 = self->_perColumnViewControllers;
        v109 = [NSNumber numberWithInteger:v93];
        v110 = [(NSMutableDictionary *)v108 objectForKeyedSubscript:v109];
        v111 = [v110 navigationController];

        if (v107 == v111) {
LABEL_200:
        }
          [(UINavigationBar *)self->_navBarForToggleButton _setNeedsStaticNavBarButtonUpdate];
      }
      if (v88) {
        [(UINavigationBar *)self->_navBarForShortcutButton _setNeedsStaticNavBarButtonUpdate];
      }
      if ([(_UIFloatableBarButtonItem *)self->_sidebarToggleButtonItem _isFloating])
      {
        v112 = [(_UIFloatableBarButtonItem *)self->_sidebarToggleButtonItem _configuredFloatableView];
        [v112 setTintColor:0];
      }
      _Block_object_dispose(&v133, 8);

      _Block_object_dispose(&v145, 8);
      _Block_object_dispose(&v151, 8);

      _Block_object_dispose(&v157, 8);
      _Block_object_dispose(&v163, 8);

      _Block_object_dispose(&v169, 8);
      return;
    case 3uLL:
      int64_t v116 = v9;
      v125 = [(UISplitViewControllerPanelImpl *)self _sidebarToggleSymbolImage];
      BOOL v118 = [(UISplitViewControllerPanelImpl *)self _wantsSideBarImageForOneOverSecondary];
      int v121 = !v118;
      if (v13) {
        BOOL v14 = 0;
      }
      else {
        BOOL v14 = !v118;
      }
      if (v13) {
        char v27 = v118;
      }
      else {
        char v27 = 1;
      }
      if (v27)
      {
        BOOL v28 = v125;
        if (!v118) {
          BOOL v28 = 0;
        }
        id v124 = v28;
      }
      else
      {
        id v124 = [(UISplitViewControllerPanelImpl *)self _sidebarChevronSymbolImage];
      }
      if (v123 == 2
        && ([(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20], (v117 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v115 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
        CGFloat v29 = [v115 viewController];
        v117 = 0;
        int v31 = 0;
        int v30 = 1;
      }
      else
      {
        uint64_t v13 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
        CGFloat v29 = [v13 viewController];
        int v30 = 0;
        int v31 = 1;
      }
      v138(v137, v29);
      if (v31)
      {
      }
      if (v30)
      {
      }
      uint64_t v16 = v14;
      BOOL v32 = v118;
      if (v123 != 2) {
        goto LABEL_84;
      }

      if (v118 || !v14)
      {
        if (!v14)
        {
          uint64_t v16 = 0;
          goto LABEL_84;
        }
      }
      else
      {
        double v45 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

        BOOL v32 = v118;
        if (!v45)
        {
          uint64_t v16 = 1;
          goto LABEL_84;
        }
      }
      double v46 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
      id v47 = [v46 navigationController];

      CGFloat v48 = [v47 viewControllers];
      if ((unint64_t)[v48 count] < 2)
      {
        uint64_t v16 = 0;
      }
      else
      {
        CGFloat v49 = [v47 topViewController];
        CGFloat v50 = [v49 navigationItem];
        int v51 = [v50 hidesBackButton];
        char v52 = v50;
        uint64_t v16 = v51 ^ 1u;
      }
LABEL_84:
      [(_UIFloatableBarButtonItem *)self->_sidebarToggleButtonItem _setFloatable:v32 & ~v17];
      int64_t v9 = v116;
      goto LABEL_85;
    case 5uLL:
      if (v13)
      {
        id v124 = [(UISplitViewControllerPanelImpl *)self _sidebarChevronSymbolImage];
      }
      else
      {
        id v124 = 0;
      }
      CGFloat v33 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
      BOOL v19 = [v33 viewController];
      v138(v137, v19);
      v125 = v33;
      int v121 = 1;
      goto LABEL_58;
    case 6uLL:
      id v124 = [(UISplitViewControllerPanelImpl *)self _sidebarToggleSymbolImage];
      int v121 = 0;
      BOOL v14 = 0;
      goto LABEL_11;
    default:
      int64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v19 = _UISplitViewControllerDisplayModeDescription((unint64_t)v8);
      [v18 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 8638, @"Unsupported displayMode for configuring bar buttons. %@", v19 object file lineNumber description];
      id v124 = 0;
      v125 = v18;
      int v121 = 0;
      BOOL v14 = 0;
LABEL_58:

      uint64_t v16 = v14;
      goto LABEL_85;
  }
}

- (int64_t)splitBehaviorForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v5 = [(UISplitViewControllerPanelImpl *)self styleProvider];
  int64_t v6 = objc_msgSend(v5, "splitBehaviorForSize:", width, height);

  return v6;
}

- (BOOL)_alwaysHideSidebarToggleButton
{
  uint64_t v2 = [(UISplitViewControllerPanelImpl *)self styleProvider];
  char v3 = [v2 alwaysHideSidebarToggleButton];

  return v3;
}

- (_UISplitViewControllerStyle)styleProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  char v3 = [WeakRetained _styleProvider];

  return (_UISplitViewControllerStyle *)v3;
}

- (id)viewControllerForColumn:(int64_t)a3
{
  perColumnViewControllers = self->_perColumnViewControllers;
  int64_t v4 = [NSNumber numberWithInteger:a3];
  BOOL v5 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:v4];

  int64_t v6 = [v5 navigationController];
  int64_t v7 = [v5 navigationControllerWrapper];
  int v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else if (v6 && ![v6 _isCreatedBySplitViewController])
  {
    id v9 = v6;
  }
  else
  {
    id v9 = [v5 viewController];
  }
  id v10 = v9;

  return v10;
}

- (uint64_t)_columnForViewController:(char)a3 forceExpandedResult:
{
  id v5 = a2;
  if (!a1)
  {
    uint64_t v9 = 0;
    goto LABEL_19;
  }
  uint64_t v6 = [a1 style];
  if ((unint64_t)(v6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v16 = v6;
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v18 = _UISplitViewControllerStyleDescription(v16);
    [v17 handleFailureInMethod:sel__columnForViewController_forceExpandedResult_, a1, @"UISplitViewControllerPanelImpl.m", 2796, @"Incorrect code path for UISplitViewControllerStyle %@", v18 object file lineNumber description];

    if (v5) {
      goto LABEL_4;
    }
LABEL_18:
    uint64_t v9 = 999;
    goto LABEL_19;
  }
  if (!v5) {
    goto LABEL_18;
  }
LABEL_4:
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  BOOL v21 = __79__UISplitViewControllerPanelImpl__columnForViewController_forceExpandedResult___block_invoke;
  uint64_t v22 = &unk_1E52E9B50;
  id v23 = v5;
  unsigned int v24 = a1;
  int64_t v7 = [a1[1] objectForKeyedSubscript:&unk_1ED3F3A38];
  int v8 = ((uint64_t (*)(void *, void *))__79__UISplitViewControllerPanelImpl__columnForViewController_forceExpandedResult___block_invoke)(v20, v7);

  if (v8) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 999;
  }
  if (!v8 || (a3 & 1) != 0 || ([a1 _isCollapsedOrCollapsing] & 1) == 0)
  {
    id v10 = [a1[1] objectForKeyedSubscript:&unk_1ED3F3A08];
    BOOL v11 = v21((uint64_t)v20, v10);

    if (v11)
    {
      uint64_t v9 = 2;
    }
    else
    {
      BOOL v12 = [a1[1] objectForKeyedSubscript:&unk_1ED3F3A50];
      BOOL v13 = v21((uint64_t)v20, v12);

      if (v13)
      {
        uint64_t v9 = 1;
      }
      else
      {
        BOOL v14 = [a1[1] objectForKeyedSubscript:&unk_1ED3F3A20];
        int v15 = ((uint64_t (*)(void *, void *))v21)(v20, v14);

        if (v15) {
          uint64_t v9 = 0;
        }
      }
    }
  }

LABEL_19:
  return v9;
}

BOOL __79__UISplitViewControllerPanelImpl__columnForViewController_forceExpandedResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v3 navigationController];
  if (v4 == (id)v5)
  {
    BOOL v21 = 1;
    BOOL v20 = v4;
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = [v3 viewController];
  if (v4 == (id)v7)
  {
    BOOL v21 = 1;
    id v13 = v4;
LABEL_24:
    BOOL v20 = v4;

    id v4 = v6;
    goto LABEL_25;
  }
  int v8 = (void *)v7;
  id v9 = [v3 navigationControllerWrapper];

  if (v4 != v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    uint64_t v6 = [WeakRetained presentingViewController];

    uint64_t v11 = [v4 presentingViewController];
    BOOL v12 = (void *)v11;
    if (v11 && (void *)v11 != v6)
    {
      id v13 = 0;
      do
      {
        BOOL v14 = v13;
        id v13 = v12;

        BOOL v12 = [v13 presentingViewController];
      }
      while (v12 && v12 != v6);

      uint64_t v15 = [v3 navigationController];
      if (v13 == (id)v15)
      {
        BOOL v21 = 1;
        id v16 = v13;
      }
      else
      {
        id v16 = (id)v15;
        uint64_t v17 = [v3 viewController];
        if (v13 != (id)v17)
        {
          int64_t v18 = (void *)v17;
          id v19 = [v3 navigationControllerWrapper];

          if (v13 == v19)
          {
            BOOL v21 = 1;
            goto LABEL_24;
          }
          BOOL v12 = v4;
          BOOL v20 = v13;
          goto LABEL_17;
        }

        BOOL v21 = 1;
      }
LABEL_23:

      goto LABEL_24;
    }
    BOOL v20 = v4;
LABEL_17:

    if ([v20 _isNestedNavigationController])
    {
      BOOL v21 = 0;
LABEL_26:
      id v4 = v20;
      goto LABEL_27;
    }
    uint64_t v22 = [v20 navigationController];
    if (!v22)
    {
      id v4 = 0;
      BOOL v21 = 0;
      goto LABEL_25;
    }
    uint64_t v6 = (void *)v22;
    id v13 = [v20 navigationController];
    id v16 = [v3 navigationController];
    BOOL v21 = v13 == v16;
    id v4 = v20;
    goto LABEL_23;
  }
  BOOL v21 = 1;
LABEL_27:

  return v21;
}

- (BOOL)_forceDisplayModeBarButtonHidden
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (int64_t)_concreteDisplayModeForCurrentEnvironment
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int64_t v4 = [(UISplitViewControllerPanelImpl *)self style];
  if ((unint64_t)(v4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v23 = v4;
    unsigned int v24 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v25 = _UISplitViewControllerStyleDescription(v23);
    [v24 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 5654, @"Incorrect code path for UISplitViewControllerStyle %@", v25 object file lineNumber description];
  }
  int64_t v5 = [(UISplitViewControllerPanelImpl *)self preferredDisplayMode];
  uint64_t v6 = [(UISplitViewControllerPanelImpl *)self userGeneratedDisplayMode];
  if ([(UIPanelController *)self->_panelController collapsedState] == 2) {
    return 2;
  }
  if (![(UISplitViewControllerPanelImpl *)self presentsWithGesture]
    && [(UISplitViewControllerPanelImpl *)self _visibleToggleButtonRequiresPresentsWithGesture])
  {
    if (v6)
    {
      if (v6 == (void *)v5) {
        return v5;
      }
    }
    else if (v5)
    {
      return v5;
    }
  }
  if (v6) {
    unint64_t v8 = (unint64_t)v6;
  }
  else {
    unint64_t v8 = v5;
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    BOOL v9 = 0;
    int64_t v5 = v8;
    if (v8) {
      goto LABEL_17;
    }
  }
  else
  {
    int64_t v5 = [(UISplitViewControllerPanelImpl *)self allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:v8];
    BOOL v9 = v5 != v8;
    if (v5)
    {
LABEL_17:
      p_svc = &self->_svc;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      int v12 = _UISplitViewControllerAutoHidesColumns(WeakRetained);

      if (v12 && _UIGetUISplitViewControllerChamoisResizeLogging())
      {
        id v13 = *(id *)(__UILogGetCategoryCachedImpl("ChamoisResize", &qword_1EB260130) + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v14 = objc_loadWeakRetained((id *)p_svc);
          if (v6) {
            uint64_t v15 = @"user-generated";
          }
          else {
            uint64_t v15 = @"preferred";
          }
          if (v9)
          {
            id v16 = NSString;
            uint64_t v6 = _UISplitViewControllerDisplayModeDescription(v8);
            uint64_t v17 = [v16 stringWithFormat:@" converted from %@", v6];
          }
          else
          {
            uint64_t v17 = &stru_1ED0E84C0;
          }
          uint64_t v22 = _UISplitViewControllerDisplayModeDescription(v5);
          *(_DWORD *)buf = 138413058;
          id v27 = v14;
          __int16 v28 = 2112;
          CGFloat v29 = v15;
          __int16 v30 = 2112;
          int v31 = v17;
          __int16 v32 = 2112;
          CGFloat v33 = v22;
          _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "%@: Using %@ display mode %@%@ for current environment", buf, 0x2Au);
          if (v9)
          {
          }
        }
      }
      return v5;
    }
  }
  if (qword_1EB260170 != -1) {
    dispatch_once(&qword_1EB260170, &__block_literal_global_1405);
  }
  if (dyld_program_sdk_at_least())
  {
    id v18 = objc_loadWeakRetained((id *)&self->_svc);
    char v19 = _UISplitViewControllerWantsPickerBehaviors(v18);

    if (v19) {
      return 2;
    }
  }
  if (*((unsigned char *)&self->_flags + 1))
  {
    double width = self->_transitioningToSize.width;
    double height = self->_transitioningToSize.height;
  }
  else
  {
    [(UISplitViewControllerPanelImpl *)self _defaultViewSizeForResolvingDisplayModeOrSplitBehavior];
  }
  return -[UISplitViewControllerPanelImpl defaultDisplayModeForSize:](self, "defaultDisplayModeForSize:", width, height);
}

- (BOOL)presentsWithGesture
{
  return self->_presentsWithGesture;
}

- (BOOL)_gestureIsForcingOverlay
{
  int64_t v3 = [(UISplitViewControllerPanelImpl *)self userGeneratedDisplayMode];
  return [(UISplitViewControllerPanelImpl *)self _gestureIsForcingOverlayForDisplayMode:v3];
}

- (int64_t)userGeneratedDisplayMode
{
  int64_t v4 = [(UISplitViewControllerPanelImpl *)self style];
  if ((unint64_t)(v4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v6 = v4;
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v8 = _UISplitViewControllerStyleDescription(v6);
    [v7 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 2541, @"Incorrect code path for UISplitViewControllerStyle %@", v8 object file lineNumber description];
  }
  return (*(void *)&self->_flags >> 3) & 7;
}

- (int64_t)preferredDisplayMode
{
  return self->_preferredDisplayMode;
}

- (int64_t)splitBehaviorInCurrentEnvironment
{
  unint64_t v4 = [(UISplitViewControllerPanelImpl *)self style];
  if (v4 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = _UISplitViewControllerStyleDescription(v4);
    [v12 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 1668, @"Incorrect code path for UISplitViewControllerStyle %@", v13 object file lineNumber description];
  }
  if ([(UISplitViewControllerPanelImpl *)self _gestureIsForcingOverlay]) {
    return 2;
  }
  int64_t v5 = (*(void *)&self->_flags >> 18) & 3;
  if (v5) {
    return v5;
  }
  if (dyld_program_sdk_at_least())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    int v8 = _UISplitViewControllerWantsPickerBehaviors(WeakRetained);

    if (v8)
    {
      if (v4 != 2) {
        return 1;
      }
      BOOL v9 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
      if (v9) {
        int64_t v5 = 3;
      }
      else {
        int64_t v5 = 1;
      }

      return v5;
    }
  }
  if (*((unsigned char *)&self->_flags + 1))
  {
    double width = self->_transitioningToSize.width;
    double height = self->_transitioningToSize.height;
  }
  else
  {
    [(UISplitViewControllerPanelImpl *)self _defaultViewSizeForResolvingDisplayModeOrSplitBehavior];
  }
  return -[UISplitViewControllerPanelImpl splitBehaviorForSize:](self, "splitBehaviorForSize:", width, height);
}

- (BOOL)_gestureIsForcingOverlayForDisplayMode:(int64_t)a3
{
  BOOL v4 = a3 == 3 || a3 == 5;
  return (*((unsigned char *)&self->_flags + 2) & 2) != 0 && v4;
}

- (CGSize)_defaultViewSizeForResolvingDisplayModeOrSplitBehavior
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v4 = [WeakRetained _existingView];

  if (v4)
  {
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    id v9 = objc_loadWeakRetained((id *)p_svc);
    id v10 = [v9 _window];
    [v10 bounds];
    double v6 = v11;
    double v8 = v12;
  }
  double v13 = v6;
  double v14 = v8;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (id)_navigationBarForSidebarButtonForColumn:(int64_t)a3
{
  perColumnViewControllers = self->_perColumnViewControllers;
  BOOL v4 = [NSNumber numberWithInteger:a3];
  double v5 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:v4];
  double v6 = [v5 navigationController];

  double v7 = [v6 _existingNavigationBar];
  if ([v6 isNavigationBarHidden])
  {
    uint64_t v8 = [v6 _targetNavigationBarForUISplitViewControllerSidebarButton];
    id v9 = (void *)v8;
    if (v7 == (void *)v8) {
      id v10 = 0;
    }
    else {
      id v10 = (void *)v8;
    }
    id v11 = v10;

    double v7 = v11;
  }

  return v7;
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  BOOL v3 = [(UISplitViewControllerPanelImpl *)self _layoutPrimaryOnRight];
  BOOL v4 = [(UISplitViewControllerPanelImpl *)self leadingVisibleViewController];
  uint64_t v5 = [(UISplitViewControllerPanelImpl *)self trailingVisibleViewController];
  double v6 = (void *)v5;
  if (v3) {
    double v7 = (void *)v5;
  }
  else {
    double v7 = v4;
  }
  if (v3) {
    uint64_t v8 = v4;
  }
  else {
    uint64_t v8 = (void *)v5;
  }
  id v9 = v8;
  id v10 = v7;
  id v11 = [v10 _effectiveScreenEdgesDeferringSystemGesturesViewController];
  uint64_t v12 = [v11 preferredScreenEdgesDeferringSystemGestures];

  if (v10 == v9)
  {
    uint64_t v14 = v12;
  }
  else
  {
    double v13 = [v9 _effectiveScreenEdgesDeferringSystemGesturesViewController];
    uint64_t v14 = [v13 preferredScreenEdgesDeferringSystemGestures];
  }
  unint64_t v15 = v14 & 0xFFFFFFFFFFFFFFFDLL | v12 & 0xFFFFFFFFFFFFFFF7;
  id v16 = [(UISplitViewControllerPanelImpl *)self panelController];
  if ([v16 isAnimating])
  {
    if (([v16 isSupplementaryViewControllerVisibleAfterAnimation] & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v17 = [v16 currentState];
  int v18 = [v17 isSupplementaryVisible];

  if (v18)
  {
LABEL_14:
    char v19 = [v16 supplementaryViewController];
    BOOL v20 = [v19 _effectiveScreenEdgesDeferringSystemGesturesViewController];
    uint64_t v21 = [v20 preferredScreenEdgesDeferringSystemGestures];

    v15 |= v21 & 0xFFFFFFFFFFFFFFF5;
  }
LABEL_15:
  if (![(UISplitViewControllerPanelImpl *)self _isCollapsed]
    && ![(UISplitViewControllerPanelImpl *)self _isPrimaryShown])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    int v23 = [WeakRetained presentsWithGesture];

    uint64_t v24 = 2;
    if (v3) {
      uint64_t v24 = 8;
    }
    if (!v23) {
      uint64_t v24 = 0;
    }
    v15 |= v24;
  }

  return v15;
}

- (id)leadingVisibleViewController
{
  int64_t v3 = [(UISplitViewControllerPanelImpl *)self style];
  BOOL v4 = [(UISplitViewControllerPanelImpl *)self panelController];
  int v5 = [v4 isAnimating];
  if (!v3)
  {
    double v7 = [(UISplitViewControllerPanelImpl *)self panelController];
    uint64_t v8 = v7;
    if (v5)
    {
      char v9 = [v7 isLeadingViewControllerVisibleAfterAnimation];

      if ((v9 & 1) == 0)
      {
LABEL_6:
        double v6 = [(UISplitViewControllerPanelImpl *)self panelController];
        BOOL v4 = v6;
        goto LABEL_7;
      }
    }
    else
    {
      id v11 = [v7 currentState];
      char v12 = [v11 isLeadingVisible];

      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
    double v13 = [(UISplitViewControllerPanelImpl *)self panelController];
    BOOL v4 = v13;
LABEL_16:
    uint64_t v10 = [v13 leadingViewController];
    goto LABEL_17;
  }
  if ([(UISplitViewControllerPanelImpl *)self primaryEdge])
  {
LABEL_3:
    double v6 = v4;
LABEL_7:
    uint64_t v10 = [v6 mainViewController];
    goto LABEL_17;
  }
  if (v5)
  {
    if (([v4 isLeadingViewControllerVisibleAfterAnimation] & 1) == 0)
    {
      if (([v4 isSupplementaryViewControllerVisibleAfterAnimation] & 1) == 0) {
        goto LABEL_3;
      }
      goto LABEL_21;
    }
    goto LABEL_15;
  }
  uint64_t v14 = [v4 currentState];
  int v15 = [v14 isLeadingVisible];

  if (v15)
  {
LABEL_15:
    double v13 = v4;
    goto LABEL_16;
  }
  int v18 = [v4 currentState];
  int v19 = [v18 isSupplementaryVisible];

  if (!v19) {
    goto LABEL_3;
  }
LABEL_21:
  uint64_t v10 = [v4 supplementaryViewController];
LABEL_17:
  id v16 = (void *)v10;

  return v16;
}

- (id)trailingVisibleViewController
{
  int64_t v3 = [(UISplitViewControllerPanelImpl *)self style];
  BOOL v4 = [(UISplitViewControllerPanelImpl *)self panelController];
  int v5 = [v4 isAnimating];
  if (!v3)
  {
    double v7 = [(UISplitViewControllerPanelImpl *)self panelController];
    uint64_t v8 = v7;
    if (v5)
    {
      char v9 = [v7 isTrailingViewControllerVisibleAfterAnimation];

      if ((v9 & 1) == 0)
      {
LABEL_9:
        double v6 = [(UISplitViewControllerPanelImpl *)self panelController];
        BOOL v4 = v6;
        goto LABEL_10;
      }
    }
    else
    {
      id v11 = [v7 currentState];
      char v12 = [v11 isTrailingVisible];

      if ((v12 & 1) == 0) {
        goto LABEL_9;
      }
    }
    double v13 = [(UISplitViewControllerPanelImpl *)self panelController];
    BOOL v4 = v13;
LABEL_15:
    uint64_t v10 = [v13 trailingViewController];
    goto LABEL_16;
  }
  if ([(UISplitViewControllerPanelImpl *)self primaryEdge] != 1)
  {
LABEL_6:
    double v6 = v4;
LABEL_10:
    uint64_t v10 = [v6 mainViewController];
    goto LABEL_16;
  }
  if (v5)
  {
    if (([v4 isTrailingViewControllerVisibleAfterAnimation] & 1) == 0)
    {
      if (([v4 isSupplementaryViewControllerVisibleAfterAnimation] & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  uint64_t v14 = [v4 currentState];
  int v15 = [v14 isTrailingVisible];

  if (v15)
  {
LABEL_14:
    double v13 = v4;
    goto LABEL_15;
  }
  int v18 = [v4 currentState];
  int v19 = [v18 isSupplementaryVisible];

  if (!v19) {
    goto LABEL_6;
  }
LABEL_20:
  uint64_t v10 = [v4 supplementaryViewController];
LABEL_16:
  id v16 = (void *)v10;

  return v16;
}

- (int64_t)primaryEdge
{
  return self->_primaryEdge;
}

- (BOOL)_layoutPrimaryOnRight
{
  int64_t primaryEdge = self->_primaryEdge;
  if (!primaryEdge)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    int64_t v3 = [WeakRetained view];
    if ([v3 _shouldReverseLayoutDirection])
    {
      LOBYTE(v6) = 1;
      goto LABEL_10;
    }
    if (self->_primaryEdge != 1)
    {
      LOBYTE(v6) = 0;
      goto LABEL_10;
    }
LABEL_7:
    id v7 = objc_loadWeakRetained((id *)&self->_svc);
    uint64_t v8 = [v7 view];
    int v6 = [v8 _shouldReverseLayoutDirection] ^ 1;

    if (primaryEdge) {
      return v6;
    }
LABEL_10:

    return v6;
  }
  if (primaryEdge == 1) {
    goto LABEL_7;
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (int64_t)allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:(int64_t)a3
{
  int64_t v5 = [(UISplitViewControllerPanelImpl *)self splitBehavior];
  if (!self) {
    return 0;
  }
  if ((unint64_t)(a3 - 4) >= 3)
  {
    if ((unint64_t)(a3 - 2) <= 1)
    {
      if (v5 == 2)
      {
        return 3;
      }
      else if ((*((unsigned char *)&self->_flags + 2) & 2) != 0)
      {
        return 3;
      }
      else
      {
        return 2;
      }
    }
  }
  else if (v5 == 2)
  {
    return 5;
  }
  else
  {
    int64_t v6 = 4;
    int64_t v7 = 6;
    if (v5 != 3) {
      int64_t v7 = a3;
    }
    if (v5 != 1) {
      int64_t v6 = v7;
    }
    if ((*((unsigned char *)&self->_flags + 2) & 2) != 0) {
      return 5;
    }
    else {
      return v6;
    }
  }
  return a3;
}

- (int64_t)splitBehavior
{
  if (self->_preferredSplitBehavior) {
    return self->_preferredSplitBehavior;
  }
  else {
    return [(UISplitViewControllerPanelImpl *)self splitBehaviorInCurrentEnvironment];
  }
}

- (void)panelController:(id)a3 didChangeToState:(id)a4 withSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v39 = a3;
  id v9 = a4;
  id v10 = [(UISplitViewControllerPanelImpl *)self panelController];

  if (v10 == v39)
  {
    if (![(UISplitViewControllerPanelImpl *)self style])
    {
      -[UISplitViewControllerPanelImpl _unspecifiedStylePanelController:didChangeToState:withSize:](self, "_unspecifiedStylePanelController:didChangeToState:withSize:", v39, v9, width, height);
      goto LABEL_50;
    }
    if (([v39 isAnimating] & 1) == 0)
    {
      id v11 = [v39 stateRequest];
      char v12 = v11;
      if (v11 && [v11 userInitiated])
      {
        if ([(UISplitViewControllerPanelImpl *)self _isPrimaryShown])
        {
          if ([(UISplitViewControllerPanelImpl *)self _isPrimaryLeading]) {
            [v9 leadingWidth];
          }
          else {
            [v9 trailingWidth];
          }
          self->_lastUserInitiatedPrimarydouble Width = v13;
        }
        [(UISplitViewControllerPanelImpl *)self setUserGeneratedDisplayMode:[(UISplitViewControllerPanelImpl *)self _displayModeForState:v9]];
        [v12 setUserInitiated:0];
        [v39 setStateRequest:v12];
      }
    }
    [(UISplitViewControllerPanelImpl *)self _updateDisplayModeButtonItem];
    [(UISplitViewControllerPanelImpl *)self _updatePresentationGestureRecognizer];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    int v15 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      uint64_t v17 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];
      objc_msgSend(v17, "_splitViewControllerDidUpdate:withSize:", WeakRetained, width, height);
    }
    int v18 = [WeakRetained isCollapsed];
    if (self->_lastNotifiedIsCollapsed != v18)
    {
      self->_lastNotifiedIsCollapsed = v18;
      int v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v20 = objc_loadWeakRetained((id *)&self->_svc);
      [v19 postNotificationName:@"UIViewControllerShowDetailTargetDidChangeNotification" object:v20];
    }
    int64_t v21 = [(UISplitViewControllerPanelImpl *)self displayMode];
    if ((*(unsigned char *)&self->_flags & 0x80) != 0)
    {
      int64_t v22 = [(UISplitViewControllerPanelImpl *)self _nextTargetDisplayModeForDisplayMode:v21 showMoreIfPossible:0];
      BOOL v23 = !v22 || v22 == v21;
      BOOL v24 = !v23;
      if (self->_lastShouldAllowChange != v24) {
        [v39 setNeedsUpdate];
      }
    }
    uint64_t v25 = [(UISplitViewControllerPanelImpl *)self panelController];
    char v26 = [v25 isAnimating];

    if ((v26 & 1) == 0)
    {
      id v27 = objc_loadWeakRetained((id *)&self->_svc);
      [v27 setNeedsStatusBarAppearanceUpdate];

      id v28 = objc_loadWeakRetained((id *)&self->_svc);
      [v28 setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
    }
    int64_t lastSettledDisplayMode = self->_lastSettledDisplayMode;
    BOOL v31 = lastSettledDisplayMode != v21 && lastSettledDisplayMode != 0;
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")|| ([v39 isAnimating] & 1) != 0|| !v31 && (*((unsigned char *)&self->_flags + 3) & 0xC0) == 0|| -[UIGestureRecognizer state](self->__fluidOpenSidebarPresentationGestureRecognizer, "state"))
    {
      goto LABEL_49;
    }
    id v32 = objc_loadWeakRetained((id *)&self->_svc);
    CGFloat v33 = [v32 delegate];

    if ((*((unsigned char *)&self->_flags + 3) & 0x40) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_48:
        $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
        self->_int64_t lastSettledDisplayMode = v21;
        self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&flags & 0xFFFFFFFF3FFFFFFFLL);

LABEL_49:
        goto LABEL_50;
      }
      id v37 = objc_loadWeakRetained((id *)&self->_svc);
      [v33 _splitViewController:v37 didFinishExpandToDisplayMode:v21];
    }
    else
    {
      if (!v31) {
        goto LABEL_48;
      }
      uint64_t v34 = [(UISplitViewControllerPanelImpl *)self panelController];
      CGFloat v35 = [v34 currentState];
      uint64_t v36 = [v35 _collapsedState];

      if (v36 || (objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_48;
      }
      id v37 = objc_loadWeakRetained((id *)&self->_svc);
      [v33 _splitViewController:v37 didChangeFromDisplayMode:self->_lastSettledDisplayMode toDisplayMode:v21];
    }

    goto LABEL_48;
  }
LABEL_50:
}

- (void)_updateDisplayModeButtonItem
{
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    int64_t animatingToDisplayMode = self->_animatingToDisplayMode;
    [(UISplitViewControllerPanelImpl *)self _updateDisplayModeButtonItemForDisplayMode:animatingToDisplayMode];
  }
  else
  {
    [(UISplitViewControllerPanelImpl *)self _unspecifiedStyleUpdateDisplayModeButtonItem];
  }
}

- (id)_sidebarToggleSymbolImage
{
  if ([(UISplitViewControllerPanelImpl *)self _isPrimaryLeading]) {
    uint64_t v2 = @"sidebar.leading";
  }
  else {
    uint64_t v2 = @"sidebar.trailing";
  }
  return +[UIImage systemImageNamed:v2];
}

- (BOOL)_isPrimaryShown
{
  int64_t v3 = [(UISplitViewControllerPanelImpl *)self panelController];
  BOOL v4 = [v3 currentState];

  if ([(UISplitViewControllerPanelImpl *)self _isPrimaryLeading]) {
    char v5 = [v4 isLeadingVisible];
  }
  else {
    char v5 = [v4 isTrailingVisible];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)panelControllerWillUpdate:(id)a3
{
  id v4 = a3;
  [(UISplitViewControllerPanelImpl *)self _updateDimmingView];
  if (qword_1EB260170 != -1) {
    dispatch_once(&qword_1EB260170, &__block_literal_global_1405);
  }
  char v5 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v5 setShowShadowViews:1];

  *(void *)&self->_flags &= 0xFFFFFFFFFFFFFD7FLL;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int64_t v7 = [WeakRetained traitCollection];
  if ([v7 horizontalSizeClass] == 1) {
    goto LABEL_28;
  }
  uint64_t v8 = [(UISplitViewControllerPanelImpl *)self style];
  BOOL v9 = v8 != 0;
  if (v8 && [(UISplitViewControllerPanelImpl *)self splitBehavior] == 1)
  {
    if ([(UISplitViewControllerPanelImpl *)self _alwaysHideSidebarToggleButton])
    {
      [v4 setClippingViewsUnnecessary:1];
    }
    else
    {
      if (v8 == (void *)2)
      {
        id v10 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

        if (!v10) {
          goto LABEL_18;
        }
      }
      if ([(UISplitViewControllerPanelImpl *)self _isPrimaryLeading])
      {
        id v11 = [v4 leadingBarContentClippingView];

        if (!v11)
        {
          id v12 = [(UISplitViewControllerPanelImpl *)self _newBarContentAnimationClippingView];
          [v4 setLeadingBarContentClippingView:v12];
        }
        [v4 setTrailingBarContentClippingView:0];
      }
      else
      {
        double v13 = [v4 trailingBarContentClippingView];

        if (!v13)
        {
          id v14 = [(UISplitViewControllerPanelImpl *)self _newBarContentAnimationClippingView];
          [v4 setTrailingBarContentClippingView:v14];
        }
        [v4 setLeadingBarContentClippingView:0];
      }
      if (v8 == (void *)2)
      {
LABEL_18:
        int v15 = [v4 supplementaryBarContentClippingView];

        if (!v15)
        {
          id v16 = [(UISplitViewControllerPanelImpl *)self _newBarContentAnimationClippingView];
          [v4 setSupplementaryBarContentClippingView:v16];
        }
      }
    }
    [v4 setFloatingBarButtonItem:self->_sidebarToggleButtonItem];
  }
  if ([v4 isAnimating])
  {
    uint64_t v17 = [v4 configuration];
    BOOL v18 = (*((unsigned char *)&self->_flags + 2) & 2) != 0
       && [(UISplitViewControllerPanelImpl *)self userGeneratedDisplayMode] == 3;
    [v17 setForceOverlay:v18];
    [v4 setConfiguration:v17];

LABEL_28:
    id v20 = 0;
    goto LABEL_34;
  }
  int v19 = [v4 stateRequest];
  if ([v19 userInitiated])
  {
    id v20 = 0;
  }
  else
  {
    int v34 = 0;
    __int16 v33 = 0;
    if (v8)
    {
      uint64_t v8 = [(UISplitViewControllerPanelImpl *)self currentState];
      [(UISplitViewControllerPanelImpl *)self _getPrimaryShown:(char *)&v33 + 1 supplementaryShown:&v33 shouldUseOverlay:0 dimMainIfNecessary:0 forDisplayMode:[(UISplitViewControllerPanelImpl *)self _displayModeForState:v8]];

      [(UISplitViewControllerPanelImpl *)self _getPrimaryShown:(char *)&v34 + 3 supplementaryShown:(char *)&v34 + 2 shouldUseOverlay:(char *)&v34 + 1 dimMainIfNecessary:&v34];
      BOOL v21 = [(UISplitViewControllerPanelImpl *)self _setPanelConfigurationWithIsPrimaryShown:HIBYTE(v34) isSupplementaryShown:BYTE2(v34) shouldUseOverlay:BYTE1(v34) dimMainIfNecessary:v34];
      char v22 = BYTE2(v34);
      char v23 = HIBYTE(v33);
      LOBYTE(v8) = v33;
    }
    else
    {
      [(UISplitViewControllerPanelImpl *)self _getPrimaryShown:(char *)&v34 + 3 shouldUseOverlay:(char *)&v34 + 1];
      BOOL v21 = [(UISplitViewControllerPanelImpl *)self _setPanelConfigurationWithIsPrimaryShown:HIBYTE(v34) shouldUseOverlay:BYTE1(v34)];
      char v23 = 0;
      char v22 = 0;
    }
    self->_lastShouldAllowChange = v21;
    *(void *)&self->_flags |= 0x80uLL;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __60__UISplitViewControllerPanelImpl_panelControllerWillUpdate___block_invoke;
    v26[3] = &unk_1E52E9B98;
    v26[4] = self;
    id v27 = WeakRetained;
    char v28 = HIBYTE(v34);
    char v29 = v22;
    char v30 = v23;
    char v31 = (char)v8;
    BOOL v32 = v9;
    BOOL v24 = _Block_copy(v26);
    id v20 = _Block_copy(v24);
  }
LABEL_34:

  return v20;
}

- (void)panelController:(id)a3 willChangeToState:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  int64_t animatingToDisplayMode = self->_animatingToDisplayMode;
  if (!animatingToDisplayMode) {
    int64_t animatingToDisplayMode = [(UISplitViewControllerPanelImpl *)self _displayModeForState:v6];
  }
  int64_t lastNotifiedMode = self->_lastNotifiedMode;
  BOOL v10 = animatingToDisplayMode != lastNotifiedMode && lastNotifiedMode != 0;
  if (!lastNotifiedMode) {
    goto LABEL_12;
  }
  id v11 = [v27 currentState];

  if (!v10)
  {
    if (v11) {
      goto LABEL_43;
    }
LABEL_12:
    if (!dyld_program_sdk_at_least()) {
      goto LABEL_43;
    }
  }
  int64_t v12 = self->_lastNotifiedMode;
  self->_int64_t lastNotifiedMode = animatingToDisplayMode;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v14 = [WeakRetained delegate];
  unint64_t v15 = animatingToDisplayMode & 0xFFFFFFFFFFFFFFFELL;
  if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 2 && animatingToDisplayMode == 1)
  {
    [(UISplitViewControllerPanelImpl *)self callDeprecatedWillHideDelegateCallbackIfNecessary];
  }
  else if (v15 == 2 && v12 == 1)
  {
    [(UISplitViewControllerPanelImpl *)self callDeprecatedWillShowDelegateCallbackIfNecessary];
  }
  if (objc_opt_respondsToSelector())
  {
    *(void *)&self->_flags |= 0x8000000uLL;
    [v14 splitViewController:WeakRetained willChangeToDisplayMode:animatingToDisplayMode];
    *(void *)&self->_flags &= ~0x8000000uLL;
  }
  [(UISplitViewControllerPanelImpl *)self sendColumnShowHideNotificationsForNewState:v6 newDisplayMode:animatingToDisplayMode oldDisplayMode:v12];
  [(UISplitViewControllerPanelImpl *)self _updateTriggerSidebarKeyCommandTitleForNewDisplayMode:animatingToDisplayMode];
  if (![(UIPanelController *)self->_panelController collapsedState])
  {
    int v16 = [v6 isCollapsed];
    BOOL v17 = animatingToDisplayMode == 1 || v12 == 1;
    BOOL v18 = v17;
    if (!v16 && v12 != animatingToDisplayMode && v18)
    {
      id v26 = objc_loadWeakRetained((id *)&self->_svc);
      int v19 = [v26 _tabBarControllerEnforcingClass:1];
      id v20 = objc_loadWeakRetained((id *)&self->_svc);
      [v19 _viewControllerObservableScrollViewAmbiguityStatusDidChange:v20];

      unint64_t v15 = animatingToDisplayMode & 0xFFFFFFFFFFFFFFFELL;
    }
  }
  if ([(UISplitViewControllerPanelImpl *)self style] == 2)
  {
    BOOL v21 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
    BOOL v22 = v21 && v10;

    if (v22
      && (v15 == 2 && (unint64_t)(v12 - 5) < 2
       || (unint64_t)(animatingToDisplayMode - 5) <= 1 && (v12 & 0xFFFFFFFFFFFFFFFELL) == 2))
    {
      char v23 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
      BOOL v24 = [v23 navigationController];
      uint64_t v25 = [v24 navigationBar];
      [v25 _refreshBackButtonMenu];
    }
  }

LABEL_43:
}

- (int64_t)displayMode
{
  if ([(NSMutableArray *)self->_overrideReportedDisplayModeStack count])
  {
    int64_t v3 = [(NSMutableArray *)self->_overrideReportedDisplayModeStack lastObject];
    int64_t v4 = [v3 integerValue];
  }
  else
  {
    int64_t v3 = [(UISplitViewControllerPanelImpl *)self panelController];
    char v5 = [v3 currentState];
    int64_t v4 = [(UISplitViewControllerPanelImpl *)self _displayModeForState:v5];
  }
  return v4;
}

- (int64_t)_displayModeForState:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    if (v4)
    {
      id v5 = v4;
      if (!self)
      {
        int64_t v11 = 0;
        goto LABEL_44;
      }
      unint64_t v6 = [(UISplitViewControllerPanelImpl *)self style];
      if (v6 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        id v20 = [MEMORY[0x1E4F28B00] currentHandler];
        BOOL v21 = _UISplitViewControllerStyleDescription(v6);
        [v20 handleFailureInMethod:sel__columnStyleDisplayModeDirectlyFromState_, self, @"UISplitViewControllerPanelImpl.m", 9057, @"Incorrect code path for UISplitViewControllerStyle %@", v21 object file lineNumber description];
      }
      BOOL v7 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
      uint64_t v8 = [v5 _collapsedState];
      if (v8 == 1) {
        int v9 = (*((unsigned __int8 *)&self->_flags + 3) >> 4) & 1;
      }
      else {
        int v9 = 0;
      }
      if ((unint64_t)(v8 - 3) >= 0xFFFFFFFFFFFFFFFELL && !v9)
      {
        int64_t v11 = 2;
LABEL_44:

        goto LABEL_45;
      }
      if (v7)
      {
        int v12 = [v5 isLeadingVisible];
        int v13 = [v5 isSupplementaryVisible];
        if (v12 && (v13 & 1) != 0)
        {
          if ([v5 leadingOverlapsMain])
          {
LABEL_19:
            int64_t v11 = 5;
            goto LABEL_44;
          }
LABEL_23:
          id v14 = [v5 configuration];
          int v15 = [v14 allowTotalWidthGreaterThanParent];

          if (v15) {
            int64_t v11 = 6;
          }
          else {
            int64_t v11 = 4;
          }
          goto LABEL_44;
        }
        if (v6 == 1) {
          char v16 = v12;
        }
        else {
          char v16 = 0;
        }
        if (v16)
        {
          int v17 = [v5 leadingOverlapsMain];
          goto LABEL_39;
        }
      }
      else
      {
        int v12 = [v5 isTrailingVisible];
        int v13 = [v5 isSupplementaryVisible];
        if (v12 && (v13 & 1) != 0)
        {
          if ([v5 trailingOverlapsMain]) {
            goto LABEL_19;
          }
          goto LABEL_23;
        }
        if (v6 == 1) {
          char v18 = v12;
        }
        else {
          char v18 = 0;
        }
        if (v18)
        {
          int v17 = [v5 trailingOverlapsMain];
LABEL_39:
          if (v17) {
            int64_t v11 = 3;
          }
          else {
            int64_t v11 = 2;
          }
          goto LABEL_44;
        }
      }
      if ((v12 & 1) != 0 || !v13)
      {
        if (v12)
        {
          if (os_variant_has_internal_diagnostics())
          {
            char v23 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v25 = v5;
              _os_log_fault_impl(&dword_1853B0000, v23, OS_LOG_TYPE_FAULT, "Unsupported UISlidingBarState (primary visible and supplementary not visible) for calculating displayMode. This is an internal UIKit problem. %@", buf, 0xCu);
            }
          }
          else
          {
            BOOL v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_columnStyleDisplayModeDirectlyFromState____s_category)+ 8);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v25 = v5;
              _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "Unsupported UISlidingBarState (primary visible and supplementary not visible) for calculating displayMode. This is an internal UIKit problem. %@", buf, 0xCu);
            }
          }
        }
        int64_t v11 = 1;
        goto LABEL_44;
      }
      int v17 = [v5 supplementaryOverlapsMain];
      goto LABEL_39;
    }
    int64_t v10 = [(UISplitViewControllerPanelImpl *)self _concreteDisplayModeForCurrentEnvironment];
  }
  else
  {
    int64_t v10 = [(UISplitViewControllerPanelImpl *)self _unspecifiedStyleDisplayModeForState:v4];
  }
  int64_t v11 = v10;
LABEL_45:

  return v11;
}

- (void)_updateDimmingView
{
  int64_t v3 = [(UISplitViewControllerPanelImpl *)self _dimmingView];

  if (!v3)
  {
    id v4 = objc_alloc_init(UIDimmingView);
    [(UISplitViewControllerPanelImpl *)self _setDimmingView:v4];
    [(UIDimmingView *)v4 setDelegate:self];
    id v5 = [(UISplitViewControllerPanelImpl *)self panelController];
    [v5 setDimmingView:v4];
  }
  if ([(UISplitViewControllerPanelImpl *)self _wantsVisibleDimmingView]) {
    +[UIDimmingView defaultDimmingColor];
  }
  else {
  id v7 = +[UIColor clearColor];
  }
  unint64_t v6 = [(UISplitViewControllerPanelImpl *)self _dimmingView];
  [v6 setDimmingColor:v7];
}

- (UIDimmingView)_dimmingView
{
  return self->__dimmingView;
}

- (BOOL)_wantsVisibleDimmingView
{
  return 1;
}

- (int64_t)_unspecifiedStyleDisplayModeForState:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
  if (!v4)
  {
    id v7 = +[UIDevice currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 1
      || ![(UISplitViewControllerPanelImpl *)self _iPadShouldUseOverlayInCurrentEnvironment])
    {
      goto LABEL_13;
    }
LABEL_14:
    int64_t v9 = 1;
    goto LABEL_15;
  }
  BOOL v6 = v5;
  if ([v4 isCollapsed])
  {
LABEL_13:
    int64_t v9 = 2;
    goto LABEL_15;
  }
  if (!v6)
  {
    if (([v4 isTrailingVisible] & 1) == 0) {
      goto LABEL_14;
    }
    if ([v4 trailingOverlapsMain]) {
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (([v4 isLeadingVisible] & 1) == 0) {
    goto LABEL_14;
  }
  if (([v4 leadingOverlapsMain] & 1) == 0) {
    goto LABEL_13;
  }
LABEL_12:
  int64_t v9 = 3;
LABEL_15:

  return v9;
}

- (int64_t)defaultDisplayModeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int64_t v7 = [(UISplitViewControllerPanelImpl *)self style];
  if ((unint64_t)(v7 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v24 = v7;
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v26 = _UISplitViewControllerStyleDescription(v24);
    [v25 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 2597, @"Incorrect code path for UISplitViewControllerStyle %@", v26 object file lineNumber description];
  }
  if ([(UISplitViewControllerPanelImpl *)self preferredDisplayMode])
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    char v28 = _UISplitViewControllerDisplayModeDescription([(UISplitViewControllerPanelImpl *)self preferredDisplayMode]);
    [v27 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 2598, @"Default display mode should not override nonautomatic preferred display mode, %@", v28 object file lineNumber description];
  }
  unint64_t v8 = -[UISplitViewControllerPanelImpl splitBehaviorForSize:](self, "splitBehaviorForSize:", width, height);
  int64_t v9 = [(UISplitViewControllerPanelImpl *)self defaultDisplayModeForSplitBehavior:v8];
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int v12 = _UISplitViewControllerAutoHidesColumns(WeakRetained);

  if (v12)
  {
    if (_UIGetUISplitViewControllerChamoisResizeLogging())
    {
      int v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("ChamoisResize", &qword_1EB2600E8) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = v13;
        id v15 = objc_loadWeakRetained((id *)&self->_svc);
        char v16 = _UISplitViewControllerSplitBehaviorDescription(v8);
        int v17 = _UISplitViewControllerDisplayModeDescription(v9);
        *(_DWORD *)buf = 138413058;
        id v30 = v15;
        __int16 v31 = 2112;
        BOOL v32 = v16;
        __int16 v33 = 2048;
        double v34 = width;
        __int16 v35 = 2112;
        uint64_t v36 = v17;
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "%@: Initial default display mode for %@ in width %g is %@", buf, 0x2Au);
      }
    }
    if ((v8 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      int64_t v9 = -[UISplitViewControllerPanelImpl _greatestAllowedAutohidingDisplayModeInSize:](self, "_greatestAllowedAutohidingDisplayModeInSize:", width, height);
      if (_UIGetUISplitViewControllerChamoisResizeLogging())
      {
        char v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("ChamoisResize", &qword_1EB2600F0) + 8);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v19 = v18;
          id v20 = objc_loadWeakRetained((id *)p_svc);
          BOOL v21 = _UISplitViewControllerSplitBehaviorDescription(v8);
          BOOL v22 = _UISplitViewControllerDisplayModeDescription(v9);
          *(_DWORD *)buf = 138413058;
          id v30 = v20;
          __int16 v31 = 2112;
          BOOL v32 = v21;
          __int16 v33 = 2048;
          double v34 = width;
          __int16 v35 = 2112;
          uint64_t v36 = v22;
          _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "%@: Greatest allowed autohiding display mode for %@ split behavior in width %g is %@", buf, 0x2Au);
        }
      }
    }
  }
  return v9;
}

- (int64_t)defaultDisplayModeForSplitBehavior:(int64_t)a3
{
  if (((a3 - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (Class)viewClassForPanelController:(id)a3
{
  return (Class)objc_opt_class();
}

- (UIColor)primaryBackgroundColor
{
  uint64_t v2 = [(UISplitViewControllerPanelImpl *)self styleProvider];
  int64_t v3 = [v2 primaryBackgroundColor];

  return (UIColor *)v3;
}

- (int64_t)topColumnForCollapsingPanelController:(id)a3
{
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    id v4 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A38];
    BOOL v5 = [v4 viewController];
    BOOL v6 = v5;
    if (v5) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 2;
    }

    uint64_t v18 = v7;
    if (v6)
    {
      int64_t v8 = 3;
    }
    else
    {
      int64_t suspendedState = self->_suspendedState;
      if (suspendedState == 5)
      {
        int64_t v8 = 1;
        uint64_t v18 = 1;
      }
      else if (suspendedState == 3)
      {
        int64_t v8 = 0;
        uint64_t v18 = 0;
      }
      else
      {
        int64_t v8 = 2;
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    int64_t v10 = [WeakRetained delegate];

    if (objc_opt_respondsToSelector())
    {
      objc_opt_respondsToSelector();
      p_$692BA5F601ABB544448C4E0A48A865F8 flags = &self->_flags;
      *(void *)&self->_flags |= 0x18000000uLL;
      id v12 = objc_loadWeakRetained((id *)&self->_svc);
      int64_t v8 = [v10 splitViewController:v12 topColumnForCollapsingToProposedTopColumn:v8];
      uint64_t v18 = v8;
    }
    else if (objc_opt_respondsToSelector())
    {
      p_$692BA5F601ABB544448C4E0A48A865F8 flags = &self->_flags;
      *(void *)&self->_flags |= 0x18000000uLL;
      id v13 = objc_loadWeakRetained((id *)&self->_svc);
      [v10 splitViewController:v13 willCollapseToProposedTopColumn:&v18];

      int64_t v8 = v18;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_18:
        self->_lastNotifiedTopColumnForCollapse = v8;

        return v8;
      }
      p_$692BA5F601ABB544448C4E0A48A865F8 flags = &self->_flags;
      *(void *)&self->_flags |= 0x18000000uLL;
      int64_t v17 = v8;
      id v15 = objc_loadWeakRetained((id *)&self->_svc);
      [v10 _splitViewController:v15 willCollapseToProposedTopColumn:&v17];

      int64_t v8 = v17;
      uint64_t v18 = v17;
    }
    *(void *)p_flags &= 0xFFFFFFFFE7FFFFFFLL;
    goto LABEL_18;
  }
  return 999;
}

- (void)sendColumnShowHideNotificationsForNewState:(id)a3 newDisplayMode:(int64_t)a4 oldDisplayMode:(int64_t)a5
{
  id v38 = a3;
  int64_t v8 = [(UISplitViewControllerPanelImpl *)self style];
  if (!v8) {
    goto LABEL_42;
  }
  uint64_t v9 = v8;
  int64_t v10 = [(UISplitViewControllerPanelImpl *)self panelController];
  int64_t v11 = [v10 currentState];

  uint64_t v12 = [v11 _collapsedState];
  perColumnViewControllers = self->_perColumnViewControllers;
  if (!v12)
  {
    BOOL v21 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
    BOOL v22 = [v21 viewController];
    if ([v22 _appearState] == 2) {
      int IsVisibleForDisplayMode = _UISplitViewControllerColumnIsVisibleForDisplayMode(v9, 0, a5);
    }
    else {
      int IsVisibleForDisplayMode = 0;
    }

    uint64_t v26 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
    id v27 = [v26 viewController];
    if ([v27 _appearState] == 2) {
      int v18 = _UISplitViewControllerColumnIsVisibleForDisplayMode(v9, 1, a5);
    }
    else {
      int v18 = 0;
    }

    char v28 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
    char v29 = [v28 viewController];
    if ([v29 _appearState] == 2) {
      int v19 = _UISplitViewControllerColumnIsVisibleForDisplayMode(v9, 2, a5);
    }
    else {
      int v19 = 0;
    }
    goto LABEL_19;
  }
  id v14 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A38];
  id v15 = [v14 viewController];
  int v16 = [v15 _appearState];

  if (v16 != 2)
  {
    char v23 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
    unint64_t v24 = [v23 viewController];
    int v25 = [v24 _appearState];

    if (v25 == 2)
    {
      int IsVisibleForDisplayMode = 0;
      int v18 = 0;
      int v20 = 0;
      int v19 = 1;
      goto LABEL_20;
    }
    id v30 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
    __int16 v31 = [v30 viewController];
    int v32 = [v31 _appearState];

    if (v32 == 2)
    {
      int IsVisibleForDisplayMode = 0;
      int v19 = 0;
      int v20 = 0;
      int v18 = 1;
      goto LABEL_20;
    }
    char v28 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
    char v29 = [v28 viewController];
    int v18 = 0;
    int v19 = 0;
    int IsVisibleForDisplayMode = [v29 _appearState] == 2;
LABEL_19:

    int v20 = 0;
    goto LABEL_20;
  }
  int IsVisibleForDisplayMode = 0;
  int v18 = 0;
  int v19 = 0;
  int v20 = 1;
LABEL_20:
  if (![v38 _collapsedState] || objc_msgSend(v38, "_collapsedState") == 3)
  {
    int v33 = _UISplitViewControllerColumnIsVisibleForDisplayMode(v9, 0, a4);
    int v34 = _UISplitViewControllerColumnIsVisibleForDisplayMode(v9, 1, a4);
    int v35 = _UISplitViewControllerColumnIsVisibleForDisplayMode(v9, 2, a4);
    BOOL v36 = 0;
    if (!IsVisibleForDisplayMode) {
      goto LABEL_27;
    }
LABEL_25:
    if ((v33 & 1) == 0) {
      [(UISplitViewControllerPanelImpl *)self sendWillHideColumn:0];
    }
    goto LABEL_27;
  }
  int64_t lastNotifiedTopColumnForCollapse = self->_lastNotifiedTopColumnForCollapse;
  int v33 = lastNotifiedTopColumnForCollapse == 0;
  int v34 = lastNotifiedTopColumnForCollapse == 1;
  int v35 = lastNotifiedTopColumnForCollapse == 2;
  BOOL v36 = lastNotifiedTopColumnForCollapse == 3;
  if (IsVisibleForDisplayMode) {
    goto LABEL_25;
  }
LABEL_27:
  if (((v18 ^ 1 | v34) & 1) == 0) {
    [(UISplitViewControllerPanelImpl *)self sendWillHideColumn:1];
  }
  if (((v19 ^ 1 | v35) & 1) == 0) {
    [(UISplitViewControllerPanelImpl *)self sendWillHideColumn:2];
  }
  if (((v20 ^ 1 | v36) & 1) == 0) {
    [(UISplitViewControllerPanelImpl *)self sendWillHideColumn:3];
  }
  if (((v18 | v34 ^ 1) & 1) == 0) {
    [(UISplitViewControllerPanelImpl *)self sendWillShowColumn:1];
  }
  if (((IsVisibleForDisplayMode | v33 ^ 1) & 1) == 0) {
    [(UISplitViewControllerPanelImpl *)self sendWillShowColumn:0];
  }
  if (((v19 | v35 ^ 1) & 1) == 0) {
    [(UISplitViewControllerPanelImpl *)self sendWillShowColumn:2];
  }
  if (((v20 | !v36) & 1) == 0) {
    [(UISplitViewControllerPanelImpl *)self sendWillShowColumn:3];
  }

LABEL_42:
}

- (id)primaryViewControllerForCollapsingPanelController:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v5 = [WeakRetained delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_5:
    uint64_t v12 = 0;
    goto LABEL_6;
  }
  int64_t v6 = [(UISplitViewControllerPanelImpl *)self style];
  if (v6)
  {
    unint64_t v7 = v6;
    int64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &primaryViewControllerForCollapsingPanelController____s_category)+ 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = v8;
      int64_t v10 = NSStringFromSelector(sel_primaryViewControllerForCollapsingSplitViewController_);
      int64_t v11 = _UISplitViewControllerStyleDescription(v7);
      int v14 = 138543618;
      id v15 = v10;
      __int16 v16 = 2114;
      int64_t v17 = v11;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_5;
  }
  uint64_t v12 = [v5 primaryViewControllerForCollapsingSplitViewController:WeakRetained];
LABEL_6:

  return v12;
}

- (void)_updateTriggerSidebarKeyCommandTitleForNewDisplayMode:(int64_t)a3
{
  if ([(UISplitViewControllerPanelImpl *)self style] == 2
    && ([(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20], BOOL v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    if ((unint64_t)(a3 - 4) >= 3)
    {
LABEL_4:
      $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
      if ((*(_DWORD *)&flags & 0x800000) == 0) {
        return;
      }
      $692BA5F601ABB544448C4E0A48A865F8 v7 = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&flags & 0xFFFFFFFFFF7FFFFFLL);
      goto LABEL_9;
    }
  }
  else if (a3 == 1)
  {
    goto LABEL_4;
  }
  $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x800000) != 0) {
    return;
  }
  $692BA5F601ABB544448C4E0A48A865F8 v7 = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x800000);
LABEL_9:
  self->_$692BA5F601ABB544448C4E0A48A865F8 flags = v7;
  if ((*(_DWORD *)&flags & 0x400000) != 0)
  {
    id v8 = +[UIMenuSystem mainSystem];
    [v8 setNeedsRevalidate];
  }
}

- (void)_setDimmingView:(id)a3
{
}

void __77__UISplitViewControllerPanelImpl__updateDisplayModeButtonItemForDisplayMode___block_invoke(void *a1, void *a2)
{
  int64_t v3 = [a2 navigationItem];
  id v21 = [v3 _effectiveBackBarButtonItem];

  uint64_t v4 = [v21 title];
  uint64_t v5 = *(void *)(a1[4] + 8);
  int64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [v21 _backButtonAlternateTitles];
  uint64_t v8 = *(void *)(a1[5] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = [v21 image];
  uint64_t v11 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = [v21 largeContentSizeImage];
  uint64_t v14 = *(void *)(a1[7] + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  [v21 largeContentSizeImageInsets];
  __int16 v16 = *(void **)(a1[8] + 8);
  v16[4] = v17;
  v16[5] = v18;
  v16[6] = v19;
  v16[7] = v20;
}

- (double)preferredPrimaryColumnWidth
{
  return self->_preferredPrimaryColumnWidth;
}

- (id)_viewControllerForObservableScrollView
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if ([(UIPanelController *)self->_panelController isCollapsed])
  {
    uint64_t v5 = [(UISplitViewControllerPanelImpl *)self panelController];
    id v6 = [v5 collapsedViewController];

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)p_svc);

      if (v6 != v7)
      {
        uint64_t v8 = [v6 _viewControllerForObservableScrollView];

        id WeakRetained = (id)v8;
      }
    }
    else if ([(UIPanelController *)self->_panelController collapsedState] != 1)
    {
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v18 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "Unexpected nil collapsedVC in the panelController", buf, 2u);
        }
      }
      else
      {
        uint64_t v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_viewControllerForObservableScrollView___s_category)+ 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v19 = 0;
          _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Unexpected nil collapsedVC in the panelController", v19, 2u);
        }
      }
    }
  }
  else
  {
    int64_t animatingToDisplayMode = self->_animatingToDisplayMode;
    if (!animatingToDisplayMode) {
      int64_t animatingToDisplayMode = [(UISplitViewControllerPanelImpl *)self displayMode];
    }
    if (animatingToDisplayMode == 1)
    {
      if ([(UISplitViewControllerPanelImpl *)self style])
      {
        uint64_t v10 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
        uint64_t v11 = [v10 viewController];
        uint64_t v12 = [v11 _viewControllerForObservableScrollView];

        id WeakRetained = (id)v12;
      }
      else
      {
        uint64_t v14 = [(UIPanelController *)self->_panelController mainViewController];
        id v15 = v14;
        if (!v14)
        {
          id v15 = [(UIPanelController *)self->_panelController preservedDetailController];
        }
        uint64_t v16 = [v15 _viewControllerForObservableScrollView];

        if (!v14) {
        id WeakRetained = (id)v16;
        }
      }
    }
  }
  return WeakRetained;
}

- (void)_unspecifiedStylePanelController:(id)a3 didChangeToState:(id)a4 withSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v36 = a4;
  int64_t v9 = [(UISplitViewControllerPanelImpl *)self style];
  if (v9)
  {
    unint64_t v33 = v9;
    int v34 = [MEMORY[0x1E4F28B00] currentHandler];
    int v35 = _UISplitViewControllerStyleDescription(v33);
    [v34 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 6190, @"Incorrect code path for UISplitViewControllerStyle %@", v35 object file lineNumber description];
  }
  uint64_t v10 = [(UISplitViewControllerPanelImpl *)self panelController];
  char v11 = [v10 isAnimating];

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = [(UISplitViewControllerPanelImpl *)self panelController];
    uint64_t v13 = [v12 stateRequest];

    if (v13 && [v13 userInitiated])
    {
      if ([(UISplitViewControllerPanelImpl *)self _isPrimaryShown])
      {
        [(UISplitViewControllerPanelImpl *)self _setPrimaryHidingState:2];
        if ([(UISplitViewControllerPanelImpl *)self _isPrimaryLeading]) {
          [v36 leadingWidth];
        }
        else {
          [v36 trailingWidth];
        }
        self->_lastUserInitiatedPrimarydouble Width = v14;
      }
      else
      {
        [(UISplitViewControllerPanelImpl *)self _setPrimaryHidingState:1];
      }
      [v13 setUserInitiated:0];
      id v15 = [(UISplitViewControllerPanelImpl *)self panelController];
      [v15 setStateRequest:v13];
    }
  }
  [(UISplitViewControllerPanelImpl *)self _updateDisplayModeButtonItem];
  [(UISplitViewControllerPanelImpl *)self _updatePresentationGestureRecognizer];
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v18 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    uint64_t v20 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];
    objc_msgSend(v20, "_splitViewControllerDidUpdate:withSize:", WeakRetained, width, height);
  }
  int v21 = [WeakRetained isCollapsed];
  if (self->_lastNotifiedIsCollapsed != v21)
  {
    self->_lastNotifiedIsCollapsed = v21;
    BOOL v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v23 = objc_loadWeakRetained((id *)&self->_svc);
    [v22 postNotificationName:@"UIViewControllerShowDetailTargetDidChangeNotification" object:v23];
  }
  if ((*(unsigned char *)&self->_flags & 0x80) != 0)
  {
    int64_t v24 = [(UISplitViewControllerPanelImpl *)self displayMode];
    int64_t v25 = [(UISplitViewControllerPanelImpl *)self _effectiveTargetDisplayModeForDisplayMode:v24];
    BOOL v26 = !v25 || v25 == v24;
    BOOL v27 = !v26;
    if (self->_lastShouldAllowChange != v27)
    {
      char v28 = [(UISplitViewControllerPanelImpl *)self panelController];
      [v28 setNeedsUpdate];
    }
  }
  char v29 = [(UISplitViewControllerPanelImpl *)self panelController];
  char v30 = [v29 isAnimating];

  if ((v30 & 1) == 0)
  {
    id v31 = objc_loadWeakRetained((id *)p_svc);
    [v31 setNeedsStatusBarAppearanceUpdate];

    id v32 = objc_loadWeakRetained((id *)p_svc);
    [v32 setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
  }
}

- (void)_unspecifiedStyleUpdateDisplayModeButtonItem
{
  int64_t v4 = [(UISplitViewControllerPanelImpl *)self style];
  if (v4)
  {
    unint64_t v26 = v4;
    BOOL v27 = [MEMORY[0x1E4F28B00] currentHandler];
    char v28 = _UISplitViewControllerStyleDescription(v26);
    [v27 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 8390, @"Incorrect code path for UISplitViewControllerStyle %@", v28 object file lineNumber description];
  }
  if (self->_unspecifiedStyleDisplayModeButtonItem)
  {
    __int16 v36 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    int64_t v6 = [(UISplitViewControllerPanelImpl *)self _effectiveTargetDisplayMode];
    int64_t v7 = v6;
    if ((unint64_t)(v6 - 2) < 2) {
      goto LABEL_9;
    }
    if (v6 != 1)
    {
      if (v6)
      {
        char v11 = 0;
        char v8 = 0;
        int64_t v9 = 0;
        uint64_t v10 = 0;
      }
      else
      {
        char v8 = 0;
        int64_t v9 = 0;
        uint64_t v10 = 0;
        char v11 = 1;
        LOBYTE(v36) = 1;
      }
      goto LABEL_20;
    }
    if ([WeakRetained displayMode] == 3)
    {
LABEL_9:
      uint64_t v12 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];
      char v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0
        || (-[UISplitViewControllerPanelImpl _currentPrimaryChildViewController](self, "_currentPrimaryChildViewController"), v14 = objc_claimAutoreleasedReturnValue(), [v14 _splitViewControllerImageForDisplayModeButtonToShowPrimary:WeakRetained], uint64_t v10 = objc_claimAutoreleasedReturnValue(), v14, !v10))
      {
        id v15 = [WeakRetained _displayModeButtonItemTitle];
        uint64_t v16 = v15;
        if (v15)
        {
          int64_t v9 = v15;
        }
        else
        {
          uint64_t v17 = [WeakRetained masterViewController];
          int64_t v9 = [v17 title];
        }
        char v11 = 0;
        uint64_t v10 = 0;
        char v8 = 1;
        HIBYTE(v36) = 1;
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v18 = [(UISplitViewControllerPanelImpl *)self _fullScreenButtonImage];

      if (!v18)
      {
        char v19 = _UIImageWithName(@"UISplitViewControllerFullScreen.png");
        uint64_t v20 = [v19 imageFlippedForRightToLeftLayoutDirection];
        [(UISplitViewControllerPanelImpl *)self _setFullScreenButtonImage:v20];
      }
      uint64_t v10 = [(UISplitViewControllerPanelImpl *)self _fullScreenButtonImage];
    }
    char v11 = 0;
    char v8 = 0;
    int64_t v9 = 0;
LABEL_20:
    if (![(__CFString *)v9 length] && !v10)
    {

      int64_t v9 = @" ";
    }
    int v21 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector())
    {
      int v34 = v9;
      id v35 = v10;
      [v21 _splitViewController:WeakRetained willUpdateDisplayModeButtonItemForTargetMode:v7 withHidden:&v36 image:&v35 title:&v34 showsBackButtonIndicator:(char *)&v36 + 1];
      id v22 = v35;

      id v23 = v34;
      char v8 = HIBYTE(v36);
      char v11 = v36;
      int64_t v9 = v23;
      uint64_t v10 = v22;
    }
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __78__UISplitViewControllerPanelImpl__unspecifiedStyleUpdateDisplayModeButtonItem__block_invoke;
    v29[3] = &unk_1E52DAD98;
    char v32 = v8;
    v29[4] = self;
    id v30 = v10;
    id v31 = v9;
    char v33 = v11;
    int64_t v24 = v9;
    id v25 = v10;
    +[UIView performWithoutAnimation:v29];
  }
}

- (BOOL)lockedForDelegateCallback
{
  return (*((unsigned char *)&self->_flags + 3) & 8) != 0 && [(UISplitViewControllerPanelImpl *)self style] != 0;
}

- (id)masterViewController
{
  if ([(UISplitViewControllerPanelImpl *)self style] == 2)
  {
    int64_t v3 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
    if (v3)
    {
      id v4 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];
    }
    else
    {
      uint64_t v5 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
      int64_t v6 = [v5 navigationController];
      int64_t v7 = v6;
      if (v6)
      {
        id v4 = v6;
      }
      else
      {
        char v8 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
        id v4 = [v8 viewController];
      }
    }
  }
  else
  {
    id v4 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];
  }
  return v4;
}

- (id)detailViewController
{
  return [(UIPanelController *)self->_panelController mainViewController];
}

- (int64_t)_columnForMonitoredNavigationController:(id)a3
{
  id v4 = a3;
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    int64_t v5 = [(UISplitViewControllerPanelImpl *)self _columnForViewController:v4];
    if (v5 != 999)
    {
      perColumnViewControllers = self->_perColumnViewControllers;
      int64_t v7 = [NSNumber numberWithInteger:v5];
      char v8 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:v7];
      id v9 = [v8 navigationController];

      if (v9 != v4) {
        int64_t v5 = 999;
      }
    }
  }
  else
  {
    int64_t v5 = 999;
  }

  return v5;
}

- (void)setViewController:(id)a3 forColumn:(int64_t)a4
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int64_t v8 = [(UISplitViewControllerPanelImpl *)self _columnForViewController:v7];
  BOOL v9 = v8 != a4;
  int v10 = [v7 _isTabBarController];
  if (v10) {
    char v11 = v7;
  }
  else {
    char v11 = 0;
  }
  id v118 = v11;
  BOOL v12 = a4 == 2 || a4 == 0;
  int v13 = v12;
  int v116 = v13;
  if (!v12 || v8 != a4)
  {
    if (v8 == a4) {
      goto LABEL_150;
    }
    goto LABEL_32;
  }
  double v14 = [v7 navigationController];
  if ([v14 _isCreatedBySplitViewController])
  {
    id v15 = [v7 childViewControllers];
    id v4 = [v15 firstObject];
    char v16 = [v4 _isNavigationController];

    if (v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  if (a4 == 2 && v118)
  {
    uint64_t v17 = [v118 selectedViewController];
    int v18 = [v17 _isNavigationController];
    if (v18)
    {
      id v4 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
      char v19 = [v4 navigationController];
      if (v17 != v19)
      {
        BOOL v9 = 1;
LABEL_29:

        goto LABEL_30;
      }
      if ([v17 _isNavigationController])
      {
        BOOL v9 = 0;
        char v19 = v17;
        goto LABEL_29;
      }
    }
    else if ([v17 _isNavigationController])
    {
      BOOL v9 = 0;
      goto LABEL_30;
    }
    uint64_t v20 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
    id v21 = [v20 navigationControllerWrapper];
    BOOL v9 = v118 == v21;

    char v19 = v17;
    if (v18) {
      goto LABEL_29;
    }
LABEL_30:
  }
  if (v9) {
    goto LABEL_32;
  }
  perColumnViewControllers = self->_perColumnViewControllers;
  int v51 = [NSNumber numberWithInteger:a4];
  char v52 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:v51];
  id v53 = [v52 navigationControllerWrapper];

  if (v53 == v7)
  {
    id v54 = [v7 childViewControllers];
    uint64_t v55 = [v54 count];

    if (v55)
    {
      id v149 = 0;
      int v56 = [v7 _wrapsNavigationController:&v149];
      uint64_t v49 = (uint64_t)v149;
      if (v49) {
        int v57 = v56;
      }
      else {
        int v57 = 0;
      }
      if (v57 != 1)
      {
LABEL_149:

        goto LABEL_150;
      }
      __int16 v58 = self->_perColumnViewControllers;
      BOOL v59 = [NSNumber numberWithInteger:a4];
      char v60 = [(NSMutableDictionary *)v58 objectForKeyedSubscript:v59];
      uint64_t v61 = [v60 navigationController];
      BOOL v62 = v49 == (void)v61;

      if (v62) {
        goto LABEL_150;
      }
LABEL_32:
      BOOL v22 = [(UISplitViewControllerPanelImpl *)self _isCollapsed];
      id v23 = v7;
      if (v22)
      {
        int64_t v24 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A38];
        id v25 = [v24 viewController];
        BOOL v26 = v25 == 0;
      }
      else
      {
        BOOL v26 = 0;
      }
      BOOL v27 = (unint64_t)(a4 - 3) < 0xFFFFFFFFFFFFFFFELL && v26;
      BOOL v115 = v27;
      char v28 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A38];
      char v29 = [v28 viewController];
      BOOL v30 = a4 != 3 && v22;
      if (v29 || !v30)
      {
      }
      else
      {
        id v31 = self->_perColumnViewControllers;
        char v32 = [NSNumber numberWithInteger:a4];
        char v33 = [(NSMutableDictionary *)v31 objectForKeyedSubscript:v32];
        int v34 = [v33 navigationController];
        if (v34)
        {
          BOOL v35 = ((v34[94] >> 1) & 3u) - 1 < 2;

          if (v35)
          {
            if (os_variant_has_internal_diagnostics())
            {
              v106 = __UIFaultDebugAssertLog();
              if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
              {
                v108 = _UISplitViewControllerColumnDescription(a4);
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v108;
                _os_log_fault_impl(&dword_1853B0000, v106, OS_LOG_TYPE_FAULT, "live swap of view controller in the %@ column when collapsed will result in broken UI", (uint8_t *)&buf, 0xCu);
              }
            }
            else
            {
              __int16 v36 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2600A8) + 8);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                uint64_t v37 = v36;
                id v38 = _UISplitViewControllerColumnDescription(a4);
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v38;
                _os_log_impl(&dword_1853B0000, v37, OS_LOG_TYPE_ERROR, "live swap of view controller in the %@ column when collapsed will result in broken UI", (uint8_t *)&buf, 0xCu);
              }
            }
          }
        }
        else
        {
        }
      }
      uint64_t v39 = 0;
      int v40 = 1;
      if (!v23 || a4 == 3)
      {
        uint64_t v49 = (uint64_t)v23;
        id v117 = 0;
      }
      else
      {
        id v148 = 0;
        int v41 = [v23 _wrapsNavigationController:&v148];
        id v42 = v148;
        uint64_t v39 = (uint64_t)v42;
        if ((v116 & v41 & 1) == 0 && v42 != v23)
        {
          char v43 = v10 ^ 1;
          if (a4 == 2) {
            char v43 = 1;
          }
          if ((v43 & 1) == 0)
          {
            uint64_t v44 = (void *)MEMORY[0x1E4F1CA00];
            double v45 = _UISplitViewControllerColumnDescription(a4);
            [v44 raise:*MEMORY[0x1E4F1C3C8], @"UITabBarController is unsupported as viewController for -[UISplitViewController setViewController:forColumn:] in %@ column", v45 format];
          }
          if (v10)
          {
            double v46 = [v23 selectedViewController];
            if ([v46 _isNavigationController])
            {
              id v47 = v46;

              uint64_t v48 = [v47 topViewController];
              uint64_t v39 = (uint64_t)v47;
              id v117 = v23;
            }
            else
            {
              id v117 = 0;
              uint64_t v48 = (uint64_t)v23;
            }
            [v23 _setNotifySplitViewControllerForSelectionChange:1];

            id v23 = (id)v48;
            if (!v39)
            {
LABEL_79:
              v64 = self->_perColumnViewControllers;
              v65 = [NSNumber numberWithInteger:a4];
              BOOL v66 = [(NSMutableDictionary *)v64 objectForKeyedSubscript:v65];
              uint64_t v39 = [v66 navigationController];

              if (v39)
              {
                int v40 = 0;
                int v63 = 1;
              }
              else
              {
                if (a4 == 2 && v10 == 1)
                {
                  uint64_t v39 = 0;
                  int v40 = 1;
LABEL_94:
                  uint64_t v49 = (uint64_t)v23;
                  goto LABEL_141;
                }
                char v86 = objc_alloc_init(UINavigationController);
                [(UINavigationController *)v86 _setCreatedBySplitViewController:1];
                v137[0] = MEMORY[0x1E4F143A8];
                v137[1] = 3221225472;
                void v137[2] = __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_3;
                v137[3] = &unk_1E52D9F98;
                uint64_t v39 = v86;
                id v138 = (id)v39;
                uint64_t v49 = (uint64_t)v23;
                id v139 = (id)v49;
                [(id)v39 _executeSplitViewControllerActions:v137];

                int v40 = 1;
                if (!v39) {
                  goto LABEL_141;
                }
                int v63 = 0;
              }
LABEL_81:
              id v67 = [(id)v39 topViewController];
              BOOL v68 = v67 == v23;

              if (!v68)
              {
                if (v63)
                {
                  char v69 = [(id)v39 _existingView];
                  SEL v70 = [v69 window];
                  if (v70) {
                    BOOL v113 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
                  }
                  else {
                    BOOL v113 = 0;
                  }
                }
                else
                {
                  BOOL v113 = 0;
                }
                if (a4 == 2)
                {
                  BOOL v77 = [(id)v39 viewControllers];
                  int v78 = [v77 containsObject:v23];

                  if (v78)
                  {
                    id v79 = v134;
                    v134[0] = MEMORY[0x1E4F143A8];
                    v134[1] = 3221225472;
                    v134[2] = __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_4;
                    v134[3] = &unk_1E52DC3D0;
                    uint64_t v39 = (uint64_t)(id)v39;
                    v134[4] = v39;
                    uint64_t v49 = (uint64_t)v23;
                    id v135 = (id)v49;
                    BOOL v136 = v113;
                    [(id)v39 _executeSplitViewControllerActions:v134];
                  }
                  else
                  {
                    id v79 = v131;
                    v131[0] = MEMORY[0x1E4F143A8];
                    v131[1] = 3221225472;
                    v131[2] = __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_5;
                    v131[3] = &unk_1E52DC3D0;
                    uint64_t v39 = (uint64_t)(id)v39;
                    v131[4] = v39;
                    uint64_t v49 = (uint64_t)v23;
                    id v132 = (id)v49;
                    BOOL v133 = v113;
                    [(id)v39 _executeSplitViewControllerActions:v131];
                  }
                  goto LABEL_108;
                }
                if (a4 == 1 || !v22)
                {
                  id v79 = v128;
                  v128[0] = MEMORY[0x1E4F143A8];
                  v128[1] = 3221225472;
                  v128[2] = __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_6;
                  v128[3] = &unk_1E52DC3D0;
                  uint64_t v39 = (uint64_t)(id)v39;
                  v128[4] = v39;
                  uint64_t v49 = (uint64_t)v23;
                  id v129 = (id)v49;
                  BOOL v130 = v113;
                  [(id)v39 _executeSplitViewControllerActions:v128];

LABEL_108:
                  id v72 = (id)v79[4];
LABEL_140:

                  goto LABEL_141;
                }
                BOOL v81 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
                id v72 = [v81 navigationController];

                [(id)v39 _setAllowNestedNavigationControllers:1];
                int v82 = [(id)v39 viewControllers];
                v112 = (void *)[v82 mutableCopy];

                int v83 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
                id v84 = [v83 navigationController];
                v85 = v84;
                if (v84)
                {
                  id v111 = v84;
                }
                else
                {
                  v110 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
                  id v87 = [v110 navigationControllerWrapper];
                  int v88 = v87;
                  if (v87)
                  {
                    id v111 = v87;
                  }
                  else
                  {
                    char v91 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
                    id v111 = [v91 navigationController];

                    int v88 = 0;
                  }
                }
                if (v72 && v72 != (id)v39)
                {
                  *(void *)&long long buf = 0;
                  *((void *)&buf + 1) = &buf;
                  uint64_t v151 = 0x3032000000;
                  v152 = __Block_byref_object_copy__60;
                  uint64_t v153 = __Block_byref_object_dispose__60;
                  id v154 = 0;
                  v123[0] = MEMORY[0x1E4F143A8];
                  v123[1] = 3221225472;
                  v123[2] = __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_7;
                  v123[3] = &unk_1E52E9B00;
                  p_long long buf = &buf;
                  id v124 = v72;
                  id v125 = v111;
                  v126 = self;
                  [v124 _executeSplitViewControllerActions:v123];
                  if ([*(id *)(*((void *)&buf + 1) + 40) count]) {
                    [v112 addObjectsFromArray:*(void *)(*((void *)&buf + 1) + 40)];
                  }

                  _Block_object_dispose(&buf, 8);
                  goto LABEL_134;
                }
                if (!v72)
                {
                  if (os_variant_has_internal_diagnostics())
                  {
                    v109 = __UIFaultDebugAssertLog();
                    if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT))
                    {
                      LOWORD(buf) = 0;
                      _os_log_fault_impl(&dword_1853B0000, v109, OS_LOG_TYPE_FAULT, "Internal logic error setting a view controller for the Primary column", (uint8_t *)&buf, 2u);
                    }
                  }
                  else
                  {
                    v107 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2600B0) + 8);
                    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
                    {
                      LOWORD(buf) = 0;
                      _os_log_impl(&dword_1853B0000, v107, OS_LOG_TYPE_ERROR, "Internal logic error setting a view controller for the Primary column", (uint8_t *)&buf, 2u);
                    }
                  }
                  goto LABEL_134;
                }
                uint64_t v92 = [v112 indexOfObject:v111];
                uint64_t v93 = [v112 indexOfObject:v23];
                uint64_t v94 = [v112 count];
                if (v93 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  if (v94)
                  {
                    if (v92 != 0 && v92 != 0x7FFFFFFFFFFFFFFFLL) {
                      uint64_t v95 = v92 - 1;
                    }
                    else {
                      uint64_t v95 = 0;
                    }
LABEL_128:
                    [v112 insertObject:v23 atIndex:v95];
LABEL_134:
                    v119[0] = MEMORY[0x1E4F143A8];
                    v119[1] = 3221225472;
                    v119[2] = __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_245;
                    v119[3] = &unk_1E52DC3D0;
                    uint64_t v39 = (uint64_t)(id)v39;
                    id v120 = (id)v39;
                    id v121 = v112;
                    BOOL v122 = v113;
                    id v97 = v112;
                    [(id)v39 _executeSplitViewControllerActions:v119];

                    uint64_t v49 = (uint64_t)v23;
                    goto LABEL_140;
                  }
                }
                else
                {
                  [v112 removeObjectAtIndex:v93];
                  if (v92 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    uint64_t v96 = [v112 indexOfObject:v111];
                    if (v96 != 0 && v96 != 0x7FFFFFFFFFFFFFFFLL) {
                      uint64_t v95 = v96 - 1;
                    }
                    else {
                      uint64_t v95 = 0;
                    }
                    goto LABEL_128;
                  }
                }
                [v112 addObject:v23];
                goto LABEL_134;
              }
              goto LABEL_94;
            }
          }
          else
          {
            id v117 = 0;
            if (!v39) {
              goto LABEL_79;
            }
          }
          int v63 = 0;
          int v40 = 1;
          goto LABEL_81;
        }
        if ((v116 & v41) != 0) {
          id v117 = v23;
        }
        else {
          id v117 = 0;
        }
        uint64_t v49 = [(id)v39 topViewController];

        if (v22 && !a4)
        {
          [(id)v39 _setAllowNestedNavigationControllers:1];
          double v71 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
          id v72 = [v71 navigationController];

          int v40 = 1;
          if (v72 && v39 && v72 != (id)v39)
          {
            v73 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
            uint64_t v74 = [v73 navigationController];
            id v75 = v74;
            if (v74)
            {
              id v76 = v74;
            }
            else
            {
              v114 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
              v89 = [v114 navigationControllerWrapper];
              v90 = v89;
              if (v89)
              {
                id v76 = v89;
              }
              else
              {
                v98 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
                id v76 = [v98 navigationController];

                v90 = 0;
              }
            }
            *(void *)&long long buf = 0;
            *((void *)&buf + 1) = &buf;
            uint64_t v151 = 0x3032000000;
            v152 = __Block_byref_object_copy__60;
            uint64_t v153 = __Block_byref_object_dispose__60;
            id v154 = 0;
            v143[0] = MEMORY[0x1E4F143A8];
            v143[1] = 3221225472;
            v143[2] = __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke;
            v143[3] = &unk_1E52E9B00;
            uint64_t v147 = &buf;
            id v72 = v72;
            id v144 = v72;
            id v99 = v76;
            id v145 = v99;
            v146 = self;
            [v72 _executeSplitViewControllerActions:v143];
            if ([*(id *)(*((void *)&buf + 1) + 40) count])
            {
              v140[0] = MEMORY[0x1E4F143A8];
              v140[1] = 3221225472;
              v140[2] = __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_2;
              v140[3] = &unk_1E52E3210;
              v142 = &buf;
              id v141 = (id)v39;
              [v141 _executeSplitViewControllerActions:v140];
            }
            _Block_object_dispose(&buf, 8);

            int v40 = 1;
          }
          goto LABEL_140;
        }
        int v40 = 1;
      }
LABEL_141:
      v100 = self->_perColumnViewControllers;
      if (!v100)
      {
        uint64_t v101 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v102 = self->_perColumnViewControllers;
        self->_perColumnViewControllers = v101;

        v100 = self->_perColumnViewControllers;
      }
      if (v39 | v49)
      {
        v103 = [[_UISplitViewControllerColumnContents alloc] initWithViewController:v49 navigationController:v39 navigationControllerWrapper:v117];
        v104 = [NSNumber numberWithInteger:a4];
        [(NSMutableDictionary *)v100 setObject:v103 forKey:v104];
      }
      else
      {
        v103 = [NSNumber numberWithInteger:a4];
        [(NSMutableDictionary *)v100 removeObjectForKey:v103];
      }

      if (v40) {
        [(UISplitViewControllerPanelImpl *)self updatePanelControllerForViewControllerChangeInColumn:a4 alwaysAnimate:0 shouldUpdateCollapsedNavStack:v115];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      [WeakRetained _didChangeDeepestActionResponder];

      goto LABEL_149;
    }
  }
LABEL_150:
}

- (int64_t)_columnForViewController:(id)a3
{
  return -[UISplitViewControllerPanelImpl _columnForViewController:forceExpandedResult:]((id *)&self->super.isa, a3, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | ((unint64_t)(self->_lastSettledDisplayMode == 0) << 31));
}

- (BOOL)inCollapsingToProposedTopColumnCallback
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 4) & 1;
}

- (void)_updateChildContentMargins
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v4 = objc_msgSend(WeakRetained, "viewControllers", 0);

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
        BOOL v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [(UISplitViewControllerPanelImpl *)self _contentMarginForChildViewController:v9];
        objc_msgSend(v9, "_setContentMargin:");
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (NSArray)viewControllers
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    int64_t v3 = [(UISplitViewControllerPanelImpl *)self panelController];
    id v4 = [v3 collapsedViewController];

    if (v4)
    {
      v10[0] = v4;
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    }
    else
    {
      uint64_t v5 = objc_opt_new();
      uint64_t v6 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];
      if (v6) {
        [v5 addObject:v6];
      }
      uint64_t v7 = [(UISplitViewControllerPanelImpl *)self _currentSupplementaryChildViewController];

      if (v7) {
        [v5 addObject:v7];
      }
      int64_t v8 = [(UISplitViewControllerPanelImpl *)self panelController];
      id v4 = [v8 mainViewController];

      if (v4) {
        [v5 addObject:v4];
      }
    }
  }
  else
  {
    uint64_t v5 = [(UISplitViewControllerPanelImpl *)self _unspecifiedStyleViewControllers];
  }
  return (NSArray *)v5;
}

- (id)_unspecifiedStyleViewControllers
{
  v9[1] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(UISplitViewControllerPanelImpl *)self panelController];
  id v4 = [v3 collapsedViewController];

  if (v4)
  {
    v9[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];
    if (v6) {
      [v5 addObject:v6];
    }
    uint64_t v7 = [(UISplitViewControllerPanelImpl *)self panelController];
    id v4 = [v7 mainViewController];

    if (v4) {
      [v5 addObject:v4];
    }
  }

  return v5;
}

- (id)_currentSupplementaryChildViewController
{
  if (![(UIPanelController *)self->_panelController supportsColumnStyle])
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UISplitViewControllerPanelImpl.m" lineNumber:7473 description:@"Incorrect panelController for UISplitViewControllerStyleTripleColumn."];
  }
  panelController = self->_panelController;
  return [(UIPanelController *)panelController supplementaryViewController];
}

- (int64_t)preferredSplitBehavior
{
  return self->_preferredSplitBehavior;
}

- (void)setPresentsWithGesture:(BOOL)a3
{
  if (self->_presentsWithGesture != a3)
  {
    self->_presentsWithGesture = a3;
    [(UISplitViewControllerPanelImpl *)self _updatePresentationGestureRecognizer];
    if ([(UISplitViewControllerPanelImpl *)self style])
    {
      if ([(UISplitViewControllerPanelImpl *)self _visibleToggleButtonRequiresPresentsWithGesture])
      {
        [(UISplitViewControllerPanelImpl *)self _updateDisplayModeButtonItem];
        [(UISplitViewControllerPanelImpl *)self _invalidateAllowsTriggeringSidebarKeyCommandAction];
      }
    }
  }
}

- (BOOL)_visibleToggleButtonRequiresPresentsWithGesture
{
  return (*((unsigned char *)&self->_flags + 2) & 0x10) == 0;
}

- (BOOL)panelController:(id)a3 collapsePrimaryViewController:(id)a4 withFallbackSecondaryViewController:(id)a5 onTopOfSupplementaryViewController:(id)a6 transitionCoordinator:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int64_t v17 = [(UISplitViewControllerPanelImpl *)self style];
  if (v17)
  {
    if (v15 && v13 != v15)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __173__UISplitViewControllerPanelImpl_panelController_collapsePrimaryViewController_withFallbackSecondaryViewController_onTopOfSupplementaryViewController_transitionCoordinator___block_invoke;
      v19[3] = &unk_1E52DCB30;
      id v20 = v13;
      id v21 = v15;
      BOOL v22 = self;
      [v20 _executeSplitViewControllerActions:v19];
    }
    if (v14) {
      [(UISplitViewControllerPanelImpl *)self panelController:v12 collapsePrimaryViewController:v13 withFallbackSecondaryViewController:v14 transitionCoordinator:v16];
    }
  }

  return v17 != 0;
}

void __138__UISplitViewControllerPanelImpl_panelController_collapsePrimaryViewController_withFallbackSecondaryViewController_transitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  int64_t v8 = __138__UISplitViewControllerPanelImpl_panelController_collapsePrimaryViewController_withFallbackSecondaryViewController_transitionCoordinator___block_invoke_2;
  BOOL v9 = &unk_1E52DD450;
  id v10 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(void **)(a1 + 56);
  id v11 = v2;
  uint64_t v12 = v3;
  id v13 = v4;
  uint64_t v5 = (void (**)(void))_Block_copy(&v6);
  if (objc_msgSend(*(id *)(a1 + 32), "_isNavigationController", v6, v7, v8, v9)) {
    [*(id *)(a1 + 32) _executeSplitViewControllerActions:v5];
  }
  else {
    v5[2](v5);
  }
}

void __138__UISplitViewControllerPanelImpl_panelController_collapsePrimaryViewController_withFallbackSecondaryViewController_transitionCoordinator___block_invoke_2(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 16));
  [v2 _collapseSecondaryViewController:v3 forSplitViewController:WeakRetained withTransitionCoordinator:a1[7]];
}

uint64_t __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 40) animated:0];
}

void __173__UISplitViewControllerPanelImpl_panelController_collapsePrimaryViewController_withFallbackSecondaryViewController_onTopOfSupplementaryViewController_transitionCoordinator___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 16));
  [v1 _collapseViewController:v2 forSplitViewController:WeakRetained];
}

- (void)panelController:(id)a3 collapsePrimaryViewController:(id)a4 withFallbackSecondaryViewController:(id)a5 transitionCoordinator:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __138__UISplitViewControllerPanelImpl_panelController_collapsePrimaryViewController_withFallbackSecondaryViewController_transitionCoordinator___block_invoke;
  v15[3] = &unk_1E52DD450;
  id v16 = v9;
  id v17 = v10;
  int v18 = self;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  +[UIView performWithoutAnimation:v15];
}

void __45__UISplitViewControllerPanelImpl_showColumn___block_invoke(uint64_t a1)
{
  if (+[UIView areAnimationsEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    uint64_t v3 = [WeakRetained view];
    id v4 = [v3 window];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  unint64_t v6 = *(void *)(a1 + 56);
  unint64_t v7 = *(void *)(a1 + 64);
  unint64_t v8 = v6 - v7;
  if (v6 <= v7)
  {
    unint64_t v13 = v7 - v6;
    if (v7 > v6)
    {
      do
      {
        if (--v13) {
          BOOL v14 = 0;
        }
        else {
          BOOL v14 = v5;
        }
        id v15 = (id)[*(id *)(a1 + 40) popViewControllerAnimated:v14];
      }
      while (v13);
    }
  }
  else
  {
    uint64_t v9 = 0;
    do
    {
      id v10 = *(void **)(a1 + 40);
      id v11 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v9];
      BOOL v12 = v8 - 1 == v9 && v5;
      [v10 pushViewController:v11 animated:v12];

      ++v9;
    }
    while (v8 != v9);
  }
}

- (BOOL)allowsSecondaryOnlyShortcutButton
{
  int64_t v3 = [(UISplitViewControllerPanelImpl *)self style];
  BOOL v4 = 0;
  if ([(UISplitViewControllerPanelImpl *)self showsSecondaryOnlyButton] && v3 == 2)
  {
    BOOL v5 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)showsSecondaryOnlyButton
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 2) & 1;
}

- (double)minimumPrimaryColumnWidth
{
  return self->_minimumPrimaryColumnWidth;
}

- (id)panelController:(id)a3 navigationBarForViewController:(id)a4
{
  id v5 = a4;
  if ([(UISplitViewControllerPanelImpl *)self _alwaysHideSidebarToggleButton]
    || (unint64_t v6 = [(UISplitViewControllerPanelImpl *)self _columnForViewController:v5], v6 > 2))
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = [(UISplitViewControllerPanelImpl *)self _navigationBarForSidebarButtonForColumn:v6];
  }

  return v7;
}

- (void)_navigationController:(id)a3 navigationBar:(id)a4 itemBackButtonUpdated:(id)a5
{
  if ((unint64_t)-[UISplitViewControllerPanelImpl _columnForMonitoredNavigationController:](self, "_columnForMonitoredNavigationController:", a3, a4, a5) <= 1)
  {
    [(UISplitViewControllerPanelImpl *)self _updateDisplayModeButtonItem];
  }
}

- (void)_navigationControllerDidUpdateStack:(id)a3
{
  id v18 = a3;
  unint64_t v4 = -[UISplitViewControllerPanelImpl _columnForMonitoredNavigationController:](self, "_columnForMonitoredNavigationController:");
  if (v4 <= 2)
  {
    unint64_t v5 = v4;
    unint64_t v6 = [v18 topViewController];
    perColumnViewControllers = self->_perColumnViewControllers;
    unint64_t v8 = [NSNumber numberWithInteger:v5];
    uint64_t v9 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:v8];
    id v10 = [v9 viewController];

    if (v6 != v10)
    {
      BOOL v11 = [(UISplitViewControllerPanelImpl *)self _isCollapsedOrCollapsing];
      if (v5 || !v11)
      {
        if (v5 == 2) {
          BOOL v12 = &unk_1ED3F3A08;
        }
        else {
          BOOL v12 = &unk_1ED3F3A20;
        }
        if ((v5 | 2) != 2)
        {
          BOOL v14 = 0;
          goto LABEL_13;
        }
LABEL_11:
        unint64_t v13 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:v12];
        BOOL v14 = [v13 navigationControllerWrapper];

LABEL_13:
        id v15 = [[_UISplitViewControllerColumnContents alloc] initWithViewController:v6 navigationController:v18 navigationControllerWrapper:v14];
        id v16 = self->_perColumnViewControllers;
        id v17 = [NSNumber numberWithInteger:v5];
        [(NSMutableDictionary *)v16 setObject:v15 forKey:v17];

        goto LABEL_14;
      }
      if ((unint64_t)([(UISplitViewControllerPanelImpl *)self _columnForViewController:v6]- 3) < 0xFFFFFFFFFFFFFFFELL)
      {
        BOOL v12 = &unk_1ED3F3A20;
        goto LABEL_11;
      }
    }
LABEL_14:
    [(UISplitViewControllerPanelImpl *)self _updateDisplayModeButtonItemIfNecessaryForChangingNavigationController:v18];
  }
}

- (void)_updateDisplayModeButtonItemIfNecessaryForChangingNavigationController:(id)a3
{
  id v22 = a3;
  unint64_t v5 = [(UISplitViewControllerPanelImpl *)self style];
  if (v5 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    id v21 = _UISplitViewControllerStyleDescription(v5);
    [v20 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 9477, @"Incorrect code path for UISplitViewControllerStyle %@", v21 object file lineNumber description];
  }
  if (![v22 isNavigationBarHidden]
    || ([v22 _targetNavigationBarForUISplitViewControllerSidebarButton],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v22 _existingNavigationBar],
        unint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v6 != v7))
  {
    unint64_t v8 = [(UISplitViewControllerPanelImpl *)self panelController];
    uint64_t v9 = [v8 collapsedState];

    if (!v9)
    {
      id v10 = [v22 transitionCoordinator];
      [(UISplitViewControllerPanelImpl *)self _updateDisplayModeButtonItemAndResetForCanceledAnimationWithTransitionCoordinator:v10];

      unint64_t v11 = [(UISplitViewControllerPanelImpl *)self _columnForMonitoredNavigationController:v22];
      if (v11 <= 1)
      {
        unint64_t v12 = v11;
        unint64_t v13 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
        BOOL v14 = [v13 navigationController];
        id v15 = [v14 navigationBar];
        [v15 _refreshBackButtonMenu];

        if (v5 == 2)
        {
          id v16 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

          if (!v12)
          {
            if (v16)
            {
              id v17 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
              id v18 = [v17 navigationController];
              id v19 = [v18 navigationBar];
              [v19 _refreshBackButtonMenu];
            }
          }
        }
      }
    }
  }
}

- (void)_updateDisplayModeButtonItemAndResetForCanceledAnimationWithTransitionCoordinator:(id)a3
{
  id v4 = a3;
  [(UISplitViewControllerPanelImpl *)self _updateDisplayModeButtonItem];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __116__UISplitViewControllerPanelImpl__updateDisplayModeButtonItemAndResetForCanceledAnimationWithTransitionCoordinator___block_invoke;
  v5[3] = &unk_1E52E9CB0;
  objc_copyWeak(&v6, &location);
  [v4 animateAlongsideTransition:0 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_navigationControllerDidChangeNavigationBarHidden:(id)a3
{
  id v8 = a3;
  id v4 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v4 navigationControllerDidChangeNavigationBarHidden:v8];

  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    unint64_t v5 = [v8 _targetNavigationBarForUISplitViewControllerSidebarButton];
    id v6 = [v8 _existingNavigationBar];
    if (v5 == v6)
    {
      char v7 = [v8 isNavigationBarHidden];

      if (v7) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    if ((unint64_t)[(UISplitViewControllerPanelImpl *)self _columnForMonitoredNavigationController:v8] <= 2)[(UISplitViewControllerPanelImpl *)self _updateDisplayModeButtonItemIfNecessaryForChangingNavigationController:v8]; {
  }
    }
LABEL_7:
}

- (BOOL)_isViewControllerForObservableScrollViewAmbiguous
{
  int64_t animatingToDisplayMode = self->_animatingToDisplayMode;
  if (!animatingToDisplayMode) {
    int64_t animatingToDisplayMode = [(UISplitViewControllerPanelImpl *)self displayMode];
  }
  return (animatingToDisplayMode != 1) & ~[(UISplitViewControllerPanelImpl *)self isCollapsed];
}

- (void)setMinimumPrimaryColumnWidth:(double)a3
{
  if (self->_minimumPrimaryColumnWidth != a3)
  {
    self->_minimumPrimaryColumndouble Width = a3;
    [(UISplitViewControllerPanelImpl *)self _primaryColumnWidthAffectingPropertyDidChange];
  }
}

- (void)setMaximumPrimaryColumnWidth:(double)a3
{
  if (self->_maximumPrimaryColumnWidth != a3)
  {
    self->_maximumPrimaryColumndouble Width = a3;
    [(UISplitViewControllerPanelImpl *)self _primaryColumnWidthAffectingPropertyDidChange];
  }
}

- (void)_initWithCoder:(id)a3
{
  id v25 = a3;
  if ([v25 containsValueForKey:@"UISplitViewControllerPreferredDisplayMode"]) {
    self->_preferredDisplayMode = [v25 decodeIntegerForKey:@"UISplitViewControllerPreferredDisplayMode"];
  }
  if ([v25 containsValueForKey:@"UISplitViewControllerPreferredSplitBehavior"]) {
    self->_preferredSplitBehavior = [v25 decodeIntegerForKey:@"UISplitViewControllerPreferredSplitBehavior"];
  }
  if ([v25 containsValueForKey:@"UISplitViewControllerPreferredPrimaryColumnWidthFraction"])
  {
    [v25 decodeDoubleForKey:@"UISplitViewControllerPreferredPrimaryColumnWidthFraction"];
    self->_preferredPrimaryColumnWidthFraction = v4;
  }
  if ([v25 containsValueForKey:@"UISplitViewControllerPreferredPrimaryColumnWidth"])
  {
    [v25 decodeDoubleForKey:@"UISplitViewControllerPreferredPrimaryColumnWidth"];
    self->_preferredPrimaryColumndouble Width = v5;
  }
  if ([v25 containsValueForKey:@"UISplitViewControllerMaximumPrimaryColumnWidth"])
  {
    [v25 decodeDoubleForKey:@"UISplitViewControllerMaximumPrimaryColumnWidth"];
    self->_maximumPrimaryColumndouble Width = v6;
  }
  if ([v25 containsValueForKey:@"UISplitViewControllerMinimumPrimaryColumnWidth"])
  {
    [v25 decodeDoubleForKey:@"UISplitViewControllerMinimumPrimaryColumnWidth"];
    self->_minimumPrimaryColumndouble Width = v7;
  }
  if ([v25 containsValueForKey:@"UISplitViewControllerPreferredSupplementaryColumnWidthFraction"])
  {
    [v25 decodeDoubleForKey:@"UISplitViewControllerPreferredSupplementaryColumnWidthFraction"];
    self->_preferredSupplementaryColumnWidthFraction = v8;
  }
  if ([v25 containsValueForKey:@"UISplitViewControllerPreferredSupplementaryColumnWidth"])
  {
    [v25 decodeDoubleForKey:@"UISplitViewControllerPreferredSupplementaryColumnWidth"];
    self->_preferredSupplementaryColumndouble Width = v9;
  }
  if ([v25 containsValueForKey:@"UISplitViewControllerMaximumSupplementaryColumnWidth"])
  {
    [v25 decodeDoubleForKey:@"UISplitViewControllerMaximumSupplementaryColumnWidth"];
    self->_maximumSupplementaryColumndouble Width = v10;
  }
  if ([v25 containsValueForKey:@"UISplitViewControllerMinimumSupplementaryColumnWidth"])
  {
    [v25 decodeDoubleForKey:@"UISplitViewControllerMinimumSupplementaryColumnWidth"];
    self->_minimumSupplementaryColumndouble Width = v11;
  }
  if ([v25 containsValueForKey:@"UISplitViewControllerPrimaryEdge"]) {
    self->_int64_t primaryEdge = [v25 decodeIntegerForKey:@"UISplitViewControllerPrimaryEdge"];
  }
  if ([v25 containsValueForKey:@"UISplitViewControllerPresentsWithGesture"]) {
    self->_presentsWithGesture = [v25 decodeBoolForKey:@"UISplitViewControllerPresentsWithGesture"];
  }
  if ([v25 containsValueForKey:@"UISplitViewControllerShowsSecondaryOnlyButton"])
  {
    int v12 = [v25 decodeBoolForKey:@"UISplitViewControllerShowsSecondaryOnlyButton"];
    uint64_t v13 = 0x4000000;
    if (!v12) {
      uint64_t v13 = 0;
    }
    self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v13);
  }
  if ([v25 containsValueForKey:@"UISplitViewControllerUsesDeviceOverlayPreferences"])
  {
    int v14 = [v25 decodeBoolForKey:@"UISplitViewControllerUsesDeviceOverlayPreferences"];
    uint64_t v15 = 0x2000;
    if (!v14) {
      uint64_t v15 = 0;
    }
    self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v15);
  }
  if ([v25 containsValueForKey:@"UISplitViewControllerUsesExtraWidePrimaryColumn"])
  {
    int v16 = [v25 decodeBoolForKey:@"UISplitViewControllerUsesExtraWidePrimaryColumn"];
    uint64_t v17 = 4096;
    if (!v16) {
      uint64_t v17 = 0;
    }
    self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v17);
  }
  if ([v25 containsValueForKey:@"UISplitViewControllerPrimaryBackgroundStyle"]) {
    -[UISplitViewControllerPanelImpl setPrimaryBackgroundStyle:](self, "setPrimaryBackgroundStyle:", [v25 decodeIntegerForKey:@"UISplitViewControllerPrimaryBackgroundStyle"]);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v19 = [WeakRetained childViewControllers];
  id v20 = (void *)[v19 mutableCopy];

  if ([v25 containsValueForKey:@"UISplitViewControllerStyle"])
  {
    uint64_t v21 = [v25 decodeIntegerForKey:@"UISplitViewControllerStyle"];
    if ((dyld_program_sdk_at_least() & 1) == 0 && v21 == 1)
    {
      id v22 = objc_loadWeakRetained((id *)&self->_svc);
      id v23 = [v22 childViewControllers];
      uint64_t v21 = [v23 count] != 1;
    }
    [(UIPanelController *)self->_panelController setStyle:v21];
  }
  [(UISplitViewControllerPanelImpl *)self setViewControllers:v20];
  if ([v25 containsValueForKey:@"UISplitViewControllerCompactColumnVC"])
  {
    int64_t v24 = [v25 decodeObjectForKey:@"UISplitViewControllerCompactColumnVC"];
    [(UISplitViewControllerPanelImpl *)self setViewController:v24 forColumn:3];
  }
}

- (void)setPrimaryEdge:(int64_t)a3
{
  if (self->_primaryEdge != a3)
  {
    id v12 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];
    self->_int64_t primaryEdge = a3;
    BOOL v5 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
    double v6 = [(UISplitViewControllerPanelImpl *)self panelController];
    if (v5) {
      id v7 = v12;
    }
    else {
      id v7 = 0;
    }
    if (v5) {
      id v8 = 0;
    }
    else {
      id v8 = v12;
    }
    [v6 setLeadingViewController:v7 changingParentage:0];

    double v9 = [(UISplitViewControllerPanelImpl *)self panelController];
    [v9 setTrailingViewController:v8 changingParentage:0];

    [(UISplitViewControllerPanelImpl *)self _updateConfigurationBackgroundStyle];
    if ([(UISplitViewControllerPanelImpl *)self _shouldUseFluidSidebarGestures]) {
      [(UISplitViewControllerPanelImpl *)self _updatePresentationGestureRecognizer];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    double v11 = [WeakRetained view];
    [v11 setNeedsLayout];
  }
}

- (BOOL)panelController:(id)a3 collapseOntoPrimaryViewController:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v32 = 0;
  char v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    [(UISplitViewControllerPanelImpl *)self preparePanelControllerForCollapse];
    double v9 = 0;
  }
  else
  {
    [v7 _splitViewControllerWillCollapseOntoPrimaryViewController:WeakRetained];
    double v9 = [(UIPanelController *)self->_panelController mainViewController];
    id v10 = objc_loadWeakRetained((id *)&self->_svc);
    v40[0] = v7;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    [v10 setViewControllers:v11];
  }
  if (!UIApp)
  {
    char v21 = 1;
    goto LABEL_15;
  }
  id v12 = [WeakRetained delegate];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__UISplitViewControllerPanelImpl_panelController_collapseOntoPrimaryViewController___block_invoke;
  aBlock[3] = &unk_1E52E9BC0;
  id v13 = v12;
  id v26 = v13;
  BOOL v27 = self;
  id v31 = &v32;
  id v14 = WeakRetained;
  id v28 = v14;
  id v15 = v9;
  id v29 = v15;
  id v16 = v7;
  id v30 = v16;
  uint64_t v17 = (void (**)(void))_Block_copy(aBlock);
  if ([(UISplitViewControllerPanelImpl *)self style] || (unint64_t)(self->_suspendedState - 3) > 1)
  {
    v17[2](v17);
    char v21 = *((unsigned char *)v33 + 24) != 0;
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      unint64_t v24 = [(UISplitViewControllerPanelImpl *)self style];
      if (v24)
      {
        id v18 = *(id *)(__UILogGetCategoryCachedImpl("UISplitViewController", &panelController_collapseOntoPrimaryViewController____s_category)+ 8);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__splitViewController_collapseSecondaryViewController_ontoPrimaryViewController_forRestorationOfCollapsedWhileSuspendedWithPrimaryVisible_);
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          id v20 = _UISplitViewControllerStyleDescription(v24);
          *(_DWORD *)long long buf = 138543618;
          id v37 = v19;
          __int16 v38 = 2114;
          uint64_t v39 = v20;
          _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", buf, 0x16u);
        }
        char v21 = 0;
      }
      else
      {
        char v21 = [v13 _splitViewController:v14 collapseSecondaryViewController:v15 ontoPrimaryViewController:v16 forRestorationOfCollapsedWhileSuspendedWithPrimaryVisible:self->_suspendedState == 3];
      }
      id v23 = v33;
LABEL_20:
      *((unsigned char *)v23 + 24) = v21;
      goto LABEL_13;
    }
    v17[2](v17);
    id v23 = v33;
    if (!*((unsigned char *)v33 + 24))
    {
      if (self->_suspendedState != 3)
      {
        char v21 = 0;
        goto LABEL_13;
      }
      char v21 = 1;
      goto LABEL_20;
    }
    char v21 = 1;
  }
LABEL_13:

LABEL_15:
  _Block_object_dispose(&v32, 8);

  return v21;
}

- (void)panelControllerDidCollapse:(id)a3
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v6 = [WeakRetained delegate];

  if (objc_opt_respondsToSelector())
  {
    id v5 = objc_loadWeakRetained((id *)p_svc);
    [v6 splitViewControllerDidCollapse:v5];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  double v4 = [WeakRetained delegate];

  if dyld_program_sdk_at_least() && (objc_opt_respondsToSelector())
  {
    id v5 = objc_loadWeakRetained((id *)p_svc);
    uint64_t v6 = [v4 splitViewControllerSupportedInterfaceOrientations:v5];
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)p_svc);
    uint64_t v6 = objc_msgSend(v5, "_super_supportedInterfaceOrientations");
  }
  unint64_t v7 = v6;

  return v7;
}

- (UISplitViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UISplitViewControllerDelegate *)WeakRetained;
}

- (void)setViewControllers:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(UISplitViewControllerPanelImpl *)self style];
  if (!v5)
  {
    [(UISplitViewControllerPanelImpl *)self _unspecifiedStyleSetViewControllers:v4];
    goto LABEL_30;
  }
  unint64_t v6 = v5;
  unint64_t v7 = [v4 count];
  unint64_t v8 = v7;
  if (v7 > 3 || v7 == 1 || v6 != 1 && v7 == 2 || v6 != 2 && v7 == 3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v10 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        goto LABEL_12;
      }
      double v11 = _UISplitViewControllerStyleDescription(v6);
      int v22 = 134218242;
      unint64_t v23 = v8;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Assigning %ld viewControllers in -[UISplitViewController setViewControllers:] is not supported by %@ style. Extra view controllers are ignored. Dummy view controllers are inserted for missing ones.", (uint8_t *)&v22, 0x16u);
LABEL_11:

LABEL_12:
      goto LABEL_13;
    }
    double v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setViewControllers____s_category_0) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = v9;
      double v11 = _UISplitViewControllerStyleDescription(v6);
      int v22 = 134218242;
      unint64_t v23 = v8;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Assigning %ld viewControllers in -[UISplitViewController setViewControllers:] is not supported by %@ style. Extra view controllers are ignored. Dummy view controllers are inserted for missing ones.", (uint8_t *)&v22, 0x16u);
      goto LABEL_11;
    }
  }
LABEL_13:
  if (v6 == 1)
  {
    if (v8)
    {
      id v12 = [v4 objectAtIndexedSubscript:0];
      [(UISplitViewControllerPanelImpl *)self setViewController:v12 forColumn:0];

      if (v8 == 1) {
        goto LABEL_28;
      }
      uint64_t v17 = v4;
      uint64_t v18 = 1;
LABEL_27:
      id v20 = [v17 objectAtIndexedSubscript:v18];
LABEL_29:
      char v21 = v20;
      [(UISplitViewControllerPanelImpl *)self setViewController:v20 forColumn:2];

      goto LABEL_30;
    }
    id v15 = self;
    uint64_t v16 = 0;
  }
  else
  {
    if (v8)
    {
      id v13 = [v4 objectAtIndexedSubscript:0];
      [(UISplitViewControllerPanelImpl *)self setViewController:v13 forColumn:0];

      if (v8 == 1)
      {
        id v14 = objc_alloc_init(UIViewController);
        [(UISplitViewControllerPanelImpl *)self setViewController:v14 forColumn:1];
      }
      else
      {
        id v19 = [v4 objectAtIndexedSubscript:1];
        [(UISplitViewControllerPanelImpl *)self setViewController:v19 forColumn:1];

        if (v8 >= 3)
        {
          uint64_t v17 = v4;
          uint64_t v18 = 2;
          goto LABEL_27;
        }
      }
LABEL_28:
      id v20 = objc_alloc_init(UIViewController);
      goto LABEL_29;
    }
    [(UISplitViewControllerPanelImpl *)self setViewController:0 forColumn:0];
    id v15 = self;
    uint64_t v16 = 1;
  }
  [(UISplitViewControllerPanelImpl *)v15 setViewController:0 forColumn:v16];
  [(UISplitViewControllerPanelImpl *)self setViewController:0 forColumn:2];
LABEL_30:
}

uint64_t __84__UISplitViewControllerPanelImpl_panelController_collapseOntoPrimaryViewController___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = [*(id *)(a1 + 40) style];
    if (v3)
    {
      unint64_t v4 = v3;
      int64_t v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &kSplitViewControllerInterfaceOrientationKey_block_invoke___s_category)+ 8);
      uint64_t result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
      if (result)
      {
        unint64_t v6 = v5;
        unint64_t v7 = NSStringFromSelector(sel_splitViewController_collapseSecondaryViewController_ontoPrimaryViewController_);
        unint64_t v8 = _UISplitViewControllerStyleDescription(v4);
        int v9 = 138543618;
        id v10 = v7;
        __int16 v11 = 2114;
        id v12 = v8;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v9, 0x16u);

        uint64_t result = 0;
      }
    }
    else
    {
      uint64_t result = [*(id *)(a1 + 32) splitViewController:*(void *)(a1 + 48) collapseSecondaryViewController:*(void *)(a1 + 56) ontoPrimaryViewController:*(void *)(a1 + 64)];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = result;
  }
  return result;
}

- (void)preparePanelControllerForCollapse
{
  unint64_t v4 = [(UISplitViewControllerPanelImpl *)self style];
  if (v4 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v11 = _UISplitViewControllerStyleDescription(v4);
    [v10 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 2631, @"Incorrect code path for UISplitViewControllerStyle %@", v11 object file lineNumber description];
  }
  id v12 = [(UIPanelController *)self->_panelController collapsedViewController];
  if (v4 == 2)
  {
    int64_t v5 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

    if (v5)
    {
      panelController = self->_panelController;
      id v7 = [(UIPanelController *)panelController supplementaryViewController];
      [(UIPanelController *)panelController setSupplementaryViewController:0 changingParentage:v12 != v7];
    }
  }
  unint64_t v8 = self->_panelController;
  id v9 = [(UIPanelController *)v8 mainViewController];
  [(UIPanelController *)v8 setMainViewController:0 changingParentage:v12 != v9];
}

- (void)_unspecifiedStyleSetViewControllers:(id)a3
{
  id v16 = a3;
  if ([v16 count])
  {
    unint64_t v4 = [v16 objectAtIndexedSubscript:0];
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((unint64_t)[v16 count] < 2)
  {
    int64_t v5 = 0;
  }
  else
  {
    int64_t v5 = [v16 objectAtIndexedSubscript:1];
  }
  BOOL v6 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
  id v7 = [(UISplitViewControllerPanelImpl *)self panelController];
  unint64_t v8 = v7;
  if (v6) {
    id v9 = v4;
  }
  else {
    id v9 = 0;
  }
  if (v6) {
    id v10 = 0;
  }
  else {
    id v10 = v4;
  }
  [v7 setLeadingViewController:v9];

  __int16 v11 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v11 setMainViewController:v5];

  id v12 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v12 setTrailingViewController:v10];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    id v14 = [WeakRetained mutableChildViewControllers];

    uint64_t v15 = [v14 indexOfObjectIdenticalTo:v4];
    if (v15 && v15 != 0x7FFFFFFFFFFFFFFFLL) {
      [v14 exchangeObjectAtIndex:v15 withObjectAtIndex:0];
    }
  }
}

- (void)setPrimaryBackgroundStyle:(int64_t)a3
{
  if (self->_primaryBackgroundStyle != a3)
  {
    self->_primaryBackgroundStyle = a3;
    [(UISplitViewControllerPanelImpl *)self _updateConfigurationBackgroundStyle];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    [WeakRetained _updateTraitsIfNecessary];
  }
}

- (void)_updateConfigurationBackgroundStyle
{
  int64_t primaryBackgroundStyle = self->_primaryBackgroundStyle;
  if (primaryBackgroundStyle == 999 || primaryBackgroundStyle == 1)
  {
    BOOL v5 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
    BOOL v6 = !v5;
    BOOL v7 = v5;
  }
  else
  {
    BOOL v6 = 0;
    BOOL v7 = 0;
  }
  unint64_t v8 = [(UISplitViewControllerPanelImpl *)self panelController];
  id v11 = [v8 configuration];

  [v11 _setLeadingBackgroundStyle:v7];
  [v11 _setTrailingBackgroundStyle:v6];
  BOOL v9 = (*((unsigned char *)&self->_flags + 5) & 4) != 0 && [(UISplitViewControllerPanelImpl *)self style] == 2;
  [v11 _setSupplementaryAdoptsPrimaryBackgroundStyle:v9];
  id v10 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v10 setConfiguration:v11];
}

- (UISplitViewControllerPanelImpl)initWithSplitViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UISplitViewControllerPanelImpl;
  BOOL v5 = [(UISplitViewControllerPanelImpl *)&v8 init];
  BOOL v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_svc, v4);
    v6->_int64_t lastNotifiedTopColumnForCollapse = 999;
  }

  return v6;
}

- (void)setStyle:(int64_t)a3
{
  if ([(UIPanelController *)self->_panelController style] != a3)
  {
    panelController = self->_panelController;
    [(UIPanelController *)panelController setStyle:a3];
  }
}

- (void)loadView
{
  uint64_t v3 = [(UISplitViewControllerPanelImpl *)self panelController];
  id v5 = [v3 view];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  [WeakRetained setView:v5];

  [v5 setImpl:self];
  [(UISplitViewControllerPanelImpl *)self _setUpFocusContainerGuides];
}

- (void)_navigationController:(id)a3 navigationBar:(id)a4 topItemUpdatedContentLayout:(id)a5
{
  id v14 = a3;
  BOOL v7 = (UINavigationBar *)a4;
  objc_super v8 = [(UISplitViewControllerPanelImpl *)self _navigationBarForSidebarButtonForDisplayMode:[(UISplitViewControllerPanelImpl *)self displayMode]];
  navBarForToggleButton = v8;
  if (!v8) {
    navBarForToggleButton = self->_navBarForToggleButton;
  }
  id v10 = navBarForToggleButton;

  if (v10 == v7 && ([v14 isNavigationBarHidden] & 1) == 0)
  {
    id v11 = [(UISplitViewControllerPanelImpl *)self panelController];
    unint64_t v12 = [v11 collapsedState];

    if (v12 <= 1)
    {
      uint64_t v13 = [v14 transitionCoordinator];
      [(UISplitViewControllerPanelImpl *)self _updateDisplayModeButtonItemAndResetForCanceledAnimationWithTransitionCoordinator:v13];
    }
  }
}

- (id)_navigationBarForSidebarButtonForDisplayMode:(int64_t)a3
{
  unint64_t v6 = [(UISplitViewControllerPanelImpl *)self style];
  if (v6 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    id v19 = _UISplitViewControllerStyleDescription(v6);
    [v18 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 6953, @"Incorrect code path for UISplitViewControllerStyle %@", v19 object file lineNumber description];
  }
  switch(a3)
  {
    case 1:
      BOOL v7 = [(UISplitViewControllerPanelImpl *)self _navigationBarForSidebarButtonForColumn:2];
      goto LABEL_20;
    case 2:
      if (v6 == 2) {
        BOOL v9 = &unk_1ED3F3A50;
      }
      else {
        BOOL v9 = &unk_1ED3F3A20;
      }
      id v10 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:v9];
      id v11 = [v10 navigationController];

      objc_super v8 = [v11 navigationBar];
      goto LABEL_15;
    case 3:
      BOOL v12 = [(UISplitViewControllerPanelImpl *)self _wantsSideBarImageForOneOverSecondary];
      if (v6 == 2
        && ([(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v11 = (void *)v13;
        id v14 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
        uint64_t v15 = [v14 navigationController];
        objc_super v8 = [v15 navigationBar];

LABEL_14:
LABEL_15:
      }
      else
      {
        if (v12) {
          navBarForToggleButton = self->_navBarForToggleButton;
        }
        else {
          navBarForToggleButton = 0;
        }
        BOOL v7 = navBarForToggleButton;
LABEL_20:
        objc_super v8 = v7;
      }
LABEL_21:
      return v8;
    case 4:
      id v11 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
      id v14 = [v11 navigationController];
      objc_super v8 = [v14 navigationBar];
      goto LABEL_14;
    default:
      objc_super v8 = 0;
      goto LABEL_21;
  }
}

- (void)setDisplayModeButtonVisibility:(int64_t)a3
{
  if ([(UISplitViewControllerPanelImpl *)self displayModeButtonVisibility] == a3) {
    return;
  }
  BOOL v5 = [(UISplitViewControllerPanelImpl *)self _isDisplayModeBarButtonVisible];
  switch(a3)
  {
    case 2:
      unint64_t v6 = *(void *)&self->_flags & 0xFFFFFFFFFFCFFFFFLL | 0x100000;
      goto LABEL_8;
    case 1:
      unint64_t v6 = *(void *)&self->_flags & 0xFFFFFFFFFFCFFFFFLL | 0x200000;
      goto LABEL_8;
    case 0:
      unint64_t v6 = *(void *)&self->_flags & 0xFFFFFFFFFFCFFFFFLL;
LABEL_8:
      self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)v6;
      goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Unknown displayModeButtonVisibility value: %ld", a3);
LABEL_10:
  if (v5 == [(UISplitViewControllerPanelImpl *)self _alwaysHideSidebarToggleButton])
  {
    [(UISplitViewControllerPanelImpl *)self _updateDisplayModeButtonItem];
    [(UISplitViewControllerPanelImpl *)self _invalidateAllowsTriggeringSidebarKeyCommandAction];
  }
}

- (int64_t)displayModeButtonVisibility
{
  $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
  if ((*(void *)&flags & 0x200000) != 0) {
    return 1;
  }
  else {
    return (*(unint64_t *)&flags >> 19) & 2;
  }
}

- (BOOL)_isDisplayModeBarButtonVisible
{
  if ([(UISplitViewControllerPanelImpl *)self _alwaysHideSidebarToggleButton]) {
    return 0;
  }
  uint64_t v3 = [(UIView *)self->_navBarForToggleButton window];
  if (!v3 || [(UIView *)self->_navBarForToggleButton isHidden])
  {

    return 0;
  }
  [(UIView *)self->_navBarForToggleButton alpha];
  double v6 = v5;

  if (v6 <= 0.1) {
    return 0;
  }
  return ![(UIBarButtonItem *)self->_sidebarToggleButtonItem isHidden];
}

- (double)supplementaryColumnWidth
{
  double MatchingState = 0.0;
  if ([(UISplitViewControllerPanelImpl *)self style] == 2)
  {
    if ([(UISplitViewControllerPanelImpl *)self _shouldReturnBoundsWidthForColumnWidth])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      double v5 = [WeakRetained view];
      [v5 bounds];
      double MatchingState = v6;
    }
    else
    {
      BOOL v7 = [(UISplitViewControllerPanelImpl *)self panelController];
      id WeakRetained = [v7 currentState];

      [WeakRetained supplementaryWidth];
      if (v8 > 0.0)
      {
        double MatchingState = v8;
LABEL_14:

        return MatchingState;
      }
      int v9 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
      id v10 = [(UISplitViewControllerPanelImpl *)self panelController];
      id v11 = v10;
      if (WeakRetained)
      {
        double v5 = [v10 possibleStates];

        if (v9) {
          [WeakRetained leadingWidth];
        }
        else {
          [WeakRetained trailingWidth];
        }
        double v13 = fmax(v12, 0.0);
      }
      else
      {
        double v5 = [v10 uncachedPossibleStates];

        double v13 = minNonzeroPrimaryWidthInStates(v5, v9);
      }
      double MatchingState = minNonzeroSupplementaryWidthInStateWithPrimaryWidthGetMatchingState(v5, v9, 0, v13);
    }

    goto LABEL_14;
  }
  return MatchingState;
}

- (double)primaryColumnWidth
{
  if ([(UISplitViewControllerPanelImpl *)self _shouldReturnBoundsWidthForColumnWidth])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    id v4 = [WeakRetained view];
    [v4 bounds];
    double v6 = v5;
LABEL_11:

    goto LABEL_12;
  }
  BOOL v7 = [(UISplitViewControllerPanelImpl *)self panelController];
  id WeakRetained = [v7 currentState];

  int v8 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
  if (v8) {
    [WeakRetained leadingWidth];
  }
  else {
    [WeakRetained trailingWidth];
  }
  double v6 = v9;
  if (v9 <= 0.0)
  {
    id v10 = [(UISplitViewControllerPanelImpl *)self panelController];
    id v11 = v10;
    if (WeakRetained) {
      [v10 possibleStates];
    }
    else {
    id v4 = [v10 uncachedPossibleStates];
    }

    double v6 = minNonzeroPrimaryWidthInStates(v4, v8);
    goto LABEL_11;
  }
LABEL_12:

  return v6;
}

- (BOOL)_shouldReturnBoundsWidthForColumnWidth
{
  uint64_t v3 = [(UISplitViewControllerPanelImpl *)self panelController];
  id v4 = [v3 currentState];

  char v5 = v4 == 0;
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    if (v4)
    {
      char v5 = [v4 isCollapsed];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      BOOL v7 = [WeakRetained traitCollection];
      char v5 = [v7 horizontalSizeClass] == 1;
    }
  }
  else if (v4 && ([v4 isCollapsed] & 1) != 0)
  {
    char v5 = 1;
  }

  return v5;
}

- (void)setPreferredSupplementaryColumnWidth:(double)a3
{
  if (self->_preferredSupplementaryColumnWidth != a3)
  {
    self->_preferredSupplementaryColumndouble Width = a3;
    dyld_program_sdk_at_least();
    [(UISplitViewControllerPanelImpl *)self _supplementaryOrPrimaryColumnWidthAffectingPropertyDidChange];
  }
}

- (void)setMinimumSupplementaryColumnWidth:(double)a3
{
  if (self->_minimumSupplementaryColumnWidth != a3)
  {
    if (a3 < 0.0 && a3 != -3.40282347e38) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported %@, %g, for supplementary column. Value must be %@", @"width fraction", *(void *)&a3, @"UISplitViewControllerAutomaticDimension or nonnegative" format];
    }
    self->_minimumSupplementaryColumndouble Width = a3;
    [(UISplitViewControllerPanelImpl *)self _primaryColumnWidthAffectingPropertyDidChange];
  }
}

- (void)setMaximumSupplementaryColumnWidth:(double)a3
{
  if (self->_maximumSupplementaryColumnWidth != a3)
  {
    if (a3 < 0.0 && a3 != -3.40282347e38) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported %@, %g, for supplementary column. Value must be %@", @"width fraction", *(void *)&a3, @"UISplitViewControllerAutomaticDimension or nonnegative" format];
    }
    self->_maximumSupplementaryColumndouble Width = a3;
    [(UISplitViewControllerPanelImpl *)self _primaryColumnWidthAffectingPropertyDidChange];
  }
}

- (void)setPreferredDisplayMode:(int64_t)a3
{
  if (self->_preferredDisplayMode | a3)
  {
    self->_preferredDisplayMode = a3;
    -[UISplitViewControllerPanelImpl _changeToDisplayMode:fromPreferredDisplayMode:](self, "_changeToDisplayMode:fromPreferredDisplayMode:");
    *(void *)&self->_flags |= 0x200uLL;
  }
}

- (void)_primaryColumnWidthAffectingPropertyDidChange
{
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    [(UISplitViewControllerPanelImpl *)self _supplementaryOrPrimaryColumnWidthAffectingPropertyDidChange];
  }
  else
  {
    if (*(unsigned char *)&self->_flags)
    {
      char v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"UISplitViewControllerPanelImpl.m" lineNumber:5626 description:@"Setting this property is not compatible with the new UISplitViewController SPI"];
    }
    panelController = self->_panelController;
    [(UIPanelController *)panelController setNeedsUpdate];
  }
}

- (void)setPreferredPrimaryColumnWidth:(double)a3
{
  if (self->_preferredPrimaryColumnWidth != a3)
  {
    self->_preferredPrimaryColumndouble Width = a3;
    [(UISplitViewControllerPanelImpl *)self _primaryColumnWidthAffectingPropertyDidChange];
  }
}

- (void)_changeToDisplayMode:(int64_t)a3 fromPreferredDisplayMode:(int64_t)a4
{
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    BOOL v7 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
    if (!a3)
    {
      if (a4 == 3 && (*(void *)&self->_flags & 0x200) != 0
        || ([(UISplitViewControllerPanelImpl *)self panelController],
            int v8 = objc_claimAutoreleasedReturnValue(),
            [v8 currentState],
            double v9 = objc_claimAutoreleasedReturnValue(),
            int64_t v10 = [(UISplitViewControllerPanelImpl *)self _displayModeForState:v9],
            v9,
            v8,
            v10 == 3))
      {
        if ([(UISplitViewControllerPanelImpl *)self splitBehavior] == 2) {
          a3 = 3;
        }
        else {
          a3 = 2;
        }
      }
      else
      {
        a3 = 0;
      }
    }
    if (v7)
    {
      int64_t v11 = [(UISplitViewControllerPanelImpl *)self displayMode];
      [(UISplitViewControllerPanelImpl *)self _transitionFromDisplayMode:v11 toDisplayMode:a3];
      return;
    }
    [(UISplitViewControllerPanelImpl *)self setUserGeneratedDisplayMode:a3];
  }
  else
  {
    [(UISplitViewControllerPanelImpl *)self _unspecifiedStyleChangeToDisplayMode:a3 fromPreferredDisplayMode:a4];
  }
  id v12 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v12 setNeedsUpdate];
}

- (void)_supplementaryOrPrimaryColumnWidthAffectingPropertyDidChange
{
  BOOL v3 = [(UIPanelController *)self->_panelController areClippingViewsUnnecessary];
  [(UIPanelController *)self->_panelController setClippingViewsUnnecessary:1];
  [(UIPanelController *)self->_panelController setNeedsUpdate];
  panelController = self->_panelController;
  [(UIPanelController *)panelController setClippingViewsUnnecessary:v3];
}

- (void)setUserGeneratedDisplayMode:(int64_t)a3
{
  int64_t v6 = [(UISplitViewControllerPanelImpl *)self style];
  if ((unint64_t)(v6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v8 = v6;
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v10 = _UISplitViewControllerStyleDescription(v8);
    [v9 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 2523, @"Incorrect code path for UISplitViewControllerStyle %@", v10 object file lineNumber description];
  }
  unint64_t v7 = *(void *)&self->_flags & 0xFFFFFFFFFFFFFF87 | (8 * (a3 & 7));
  self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)v7;
  if (a3 != 3 && a3 != 5) {
    self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(v7 & 0xFFFFFFFFFFFDFFBFLL);
  }
}

- (void)_unspecifiedStyleChangeToDisplayMode:(int64_t)a3 fromPreferredDisplayMode:(int64_t)a4
{
  int64_t v8 = [(UISplitViewControllerPanelImpl *)self style];
  if (v8)
  {
    unint64_t v13 = v8;
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = _UISplitViewControllerStyleDescription(v13);
    [v14 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 4922, @"Incorrect code path for UISplitViewControllerStyle %@", v15 object file lineNumber description];
  }
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (a4 == 3 && (*(void *)&self->_flags & 0x200) != 0)
    {
      uint64_t v9 = 2;
    }
    else
    {
      int64_t v10 = [(UISplitViewControllerPanelImpl *)self panelController];
      int64_t v11 = [v10 currentState];
      BOOL v12 = [(UISplitViewControllerPanelImpl *)self _displayModeForState:v11] == 3;

      uint64_t v9 = 2 * v12;
    }
  }
  else
  {
    uint64_t v9 = qword_186B94620[a3 - 1];
  }
  [(UISplitViewControllerPanelImpl *)self _setPrimaryHidingState:v9];
  id v16 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v16 setNeedsUpdate];
}

- (void)_setPrimaryHidingState:(int64_t)a3
{
  self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFF9 | (2 * (a3 & 3)));
}

- (void)removeChildViewController:(id)a3
{
  id v4 = a3;
  char v5 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v5 removeChildViewController:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_super_removeChildViewController:", v4);
}

- (CGSize)_preferredContentSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if ([(UISplitViewControllerPanelImpl *)self style]
    && ([WeakRetained traitCollection],
        char v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 _presentationSemanticContext],
        v5,
        v6 != 3))
  {
    unint64_t v13 = [(UISplitViewControllerPanelImpl *)self style];
    if (v13 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      int v22 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v23 = _UISplitViewControllerStyleDescription(v13);
      [v22 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 5335, @"Incorrect code path for UISplitViewControllerStyle %@", v23 object file lineNumber description];
    }
    id v14 = [WeakRetained _screen];
    [v14 bounds];
    +[UIViewController defaultFormSheetSizeForScreenSize:](UIViewController, "defaultFormSheetSizeForScreenSize:", v15, v16);
    double v18 = v17;
    double v10 = v19;

    if (v13 == 2)
    {
      id v20 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
      double v21 = 320.0;
      if (!v20) {
        double v21 = 240.0;
      }
      double v8 = v18 + v21;
    }
    else
    {
      double v8 = v18 + 240.0;
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "_super_preferredContentSize");
    double v8 = v7;
    double v10 = v9;
  }

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)setPreferredSplitBehavior:(int64_t)a3
{
  self->_preferredSplitBehavior = a3;
}

- (id)_additionalViewControllersToCheckForUserActivity
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(UISplitViewControllerPanelImpl *)self panelController];
  char v5 = [v4 allViewControllers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (v10 && ((*(_DWORD *)(v10 + 376) >> 1) & 3u) - 1 <= 1) {
          objc_msgSend(v3, "addObject:");
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)sendWillShowColumn:(int64_t)a3
{
  $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
  if ((*(void *)&flags & 0x500000000) == 0x100000000)
  {
    self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x8000000);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    $692BA5F601ABB544448C4E0A48A865F8 v6 = self->_flags;
    uint64_t v7 = [(UISplitViewControllerPanelImpl *)self _columnStyleDelegate];
    uint64_t v8 = v7;
    if ((*(void *)&v6 & 0x800000000) != 0) {
      [v7 _splitViewController:WeakRetained willShowColumn:a3];
    }
    else {
      [v7 splitViewController:WeakRetained willShowColumn:a3];
    }

    *(void *)&self->_flags &= ~0x8000000uLL;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  char v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    $692BA5F601ABB544448C4E0A48A865F8 v6 = [(UISplitViewControllerPanelImpl *)self _columnStyleDelegate];
    if (v6)
    {
      char v7 = objc_opt_respondsToSelector();
      uint64_t v8 = 0x100000000;
      if ((v7 & 1) == 0) {
        uint64_t v8 = 0;
      }
      self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v8);
      char v9 = objc_opt_respondsToSelector();
      $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
      uint64_t v11 = 0x200000000;
      if ((v9 & 1) == 0) {
        uint64_t v11 = 0;
      }
      self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&flags & 0xFFFFFFFDFFFFFFFFLL | v11);
      if ((v9 & 1) == 0 && (*(void *)&flags & 0x100000000) == 0)
      {
        if (objc_opt_respondsToSelector()) {
          *(void *)&self->_flags |= 0x900000000uLL;
        }
        if (objc_opt_respondsToSelector()) {
          *(void *)&self->_flags |= 0xA00000000uLL;
        }
      }
      char v12 = objc_opt_respondsToSelector();
      uint64_t v13 = 0x1000000000;
      if ((v12 & 1) == 0) {
        uint64_t v13 = 0;
      }
      self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v13);
      char v14 = objc_opt_respondsToSelector();
      uint64_t v15 = 0x4000000000;
      if ((v14 & 1) == 0) {
        uint64_t v15 = 0;
      }
      self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFBFFFFFFFFFLL | v15);
      char v16 = objc_opt_respondsToSelector();
      uint64_t v17 = 0x10000000000;
      if ((v16 & 1) == 0) {
        uint64_t v17 = 0;
      }
      self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFEFFFFFFFFFFLL | v17);
      char v18 = objc_opt_respondsToSelector();
      uint64_t v19 = 0x20000000000;
      if ((v18 & 1) == 0) {
        uint64_t v19 = 0;
      }
      self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFDFFFFFFFFFFLL | v19);
      char v20 = objc_opt_respondsToSelector();
      uint64_t v21 = 0x2000000000;
      if ((v20 & 1) == 0) {
        uint64_t v21 = 0;
      }
      self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFDFFFFFFFFFLL | v21);
      char v22 = objc_opt_respondsToSelector();
      uint64_t v23 = 0x8000000000;
      if ((v22 & 1) == 0) {
        uint64_t v23 = 0;
      }
      unint64_t v24 = *(void *)&self->_flags & 0xFFFFFF7FFFFFFFFFLL | v23;
    }
    else
    {
      unint64_t v24 = *(void *)&self->_flags & 0xFFFFFE04FFFFFFFFLL;
    }
    self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)v24;

    char v5 = obj;
  }
}

- (id)_columnStyleDelegate
{
  id WeakRetained = [(UISplitViewControllerPanelImpl *)self style];
  if (WeakRetained) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  return WeakRetained;
}

- (void)setShowsSecondaryOnlyButton:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (void)_invalidateAllowsTriggeringSidebarKeyCommandAction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v2 = [WeakRetained viewIfLoaded];
  [v2 setNeedsLayout];
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(UISplitViewControllerPanelImpl *)self style];
  if (v5 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v2 = _UISplitViewControllerStyleDescription(v5);
    [v13 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 2104, @"Incorrect code path for UISplitViewControllerStyle %@", v2 object file lineNumber description];
  }
  if (![(UISplitViewControllerPanelImpl *)self isCollapsed])
  {
    char v9 = [(UIPanelController *)self->_panelController transitionCoordinator];
    goto LABEL_15;
  }
  $692BA5F601ABB544448C4E0A48A865F8 v6 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A38];
  uint64_t v7 = [v6 viewController];
  if (!v7)
  {
    if (v5 == 2
      && ([(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20], (uint64_t v2 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v11 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
      uint64_t v8 = [v11 navigationController];
    }
    else
    {
      uint64_t v10 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
      uint64_t v8 = [v10 navigationController];

      if (v5 != 2)
      {
LABEL_13:

        if (v8) {
          goto LABEL_14;
        }
        if (os_variant_has_internal_diagnostics())
        {
          uint64_t v15 = __UIFaultDebugAssertLog();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            goto LABEL_22;
          }
          char v16 = _UISplitViewControllerStyleDescription([(UISplitViewControllerPanelImpl *)self style]);
          *(_DWORD *)long long buf = 138412290;
          char v18 = v16;
          _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "Unable to locate transition coordinator for collapsed %@ UISplitViewController", buf, 0xCu);
        }
        else
        {
          char v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &transitionCoordinator___s_category) + 8);
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
LABEL_23:
            uint64_t v8 = 0;
            goto LABEL_14;
          }
          uint64_t v15 = v14;
          char v16 = _UISplitViewControllerStyleDescription([(UISplitViewControllerPanelImpl *)self style]);
          *(_DWORD *)long long buf = 138412290;
          char v18 = v16;
          _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Unable to locate transition coordinator for collapsed %@ UISplitViewController", buf, 0xCu);
        }

LABEL_22:
        goto LABEL_23;
      }
    }

    goto LABEL_13;
  }
  uint64_t v8 = (void *)v7;

LABEL_14:
  char v9 = [v8 transitionCoordinator];

LABEL_15:
  return (UIViewControllerTransitionCoordinator *)v9;
}

- (void)_setUsesExtraWidePrimaryColumn:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (void)setPrefersOverlayInRegularWidthPhone:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (void)setGutterWidth:(float)a3
{
  unint64_t v5 = [(UISplitViewControllerPanelImpl *)self panelController];
  id v8 = [v5 configuration];

  double v6 = a3;
  [v8 setLeadingBorderWidthInPoints:v6];
  [v8 setTrailingBorderWidthInPoints:v6];
  uint64_t v7 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v7 setConfiguration:v8];
}

- (void)_setDisplayModeButtonItemTitle:(id)a3
{
  id v4 = (NSString *)a3;
  displayModeButtonItemTitle = self->_displayModeButtonItemTitle;
  if (displayModeButtonItemTitle != v4)
  {
    char v9 = v4;
    BOOL v6 = [(NSString *)displayModeButtonItemTitle isEqualToString:v4];
    id v4 = v9;
    if (!v6)
    {
      uint64_t v7 = (NSString *)[(NSString *)v9 copy];
      id v8 = self->_displayModeButtonItemTitle;
      self->_displayModeButtonItemTitle = v7;

      [(UISplitViewControllerPanelImpl *)self _updateDisplayModeButtonItem];
      id v4 = v9;
    }
  }
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIFocusMovementDidFailNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)UISplitViewControllerPanelImpl;
  [(UISplitViewControllerPanelImpl *)&v4 dealloc];
}

- (void)setConfiguration:(id)a3
{
  *(void *)&self->_flags |= 1uLL;
  id v4 = a3;
  id v5 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v5 setConfiguration:v4];
}

- (BOOL)canTileSidebarColumn:(int64_t)a3
{
  unint64_t v6 = [(UISplitViewControllerPanelImpl *)self style];
  if (v6 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v24 = _UISplitViewControllerStyleDescription(v6);
    [v23 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 3454, @"Incorrect code path for UISplitViewControllerStyle %@", v24 object file lineNumber description];
  }
  if ((unint64_t)a3 >= 2)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    char v9 = _UISplitViewControllerColumnDescription(a3);
    [v7 raise:v8, @"canTileSidebarColumn not supported for %@ column", v9 format];
  }
  if ([(UISplitViewControllerPanelImpl *)self _isCollapsed]) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  char v12 = [WeakRetained _existingView];
  [v12 bounds];
  double Width = CGRectGetWidth(v30);
  if (!self) {
    goto LABEL_11;
  }
  double v14 = Width;
  unint64_t v15 = [(UISplitViewControllerPanelImpl *)self style];
  if (v15 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v26 = _UISplitViewControllerStyleDescription(v15);
    [v25 handleFailureInMethod:sel__maximumNumberOfColumnsAllowedToTileInWidth_, self, @"UISplitViewControllerPanelImpl.m", 3478, @"Incorrect code path for UISplitViewControllerStyle %@", v26 object file lineNumber description];
  }
  if (![(UISplitViewControllerPanelImpl *)self _isSecondaryColumnCompactInTotalWidth:v14 withPrimaryColumnWidth:0.0 supplementaryColumnWidth:0.0])
  {
    double v28 = 0.0;
    double v29 = 0.0;
    -[UISplitViewControllerPanelImpl getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:](self, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", &v29, &v28, 2, 1, 0, 0, v14, 800.0);
    double v18 = v28;
    double v17 = v29;
    if (v29 != 0.0 && v28 != 0.0)
    {
      BOOL v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:sel__maximumNumberOfColumnsAllowedToTileInWidth_ object:self file:@"UISplitViewControllerPanelImpl.m" lineNumber:3489 description:@"Internal UIKit error: UISplitViewControllerDisplayModeOneBesideSecondary should only report nonzero width for one of the primary or supplementary columns"];

      double v18 = v28;
      double v17 = v29;
    }
    BOOL v19 = [(UISplitViewControllerPanelImpl *)self _isSecondaryColumnCompactInTotalWidth:v14 withPrimaryColumnWidth:v17 supplementaryColumnWidth:v18];
    if (v19) {
      unint64_t v16 = 1;
    }
    else {
      unint64_t v16 = 2;
    }
    if (v15 == 2 && !v19)
    {
      char v20 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

      if (v20)
      {
        double v28 = 0.0;
        double v29 = 0.0;
        -[UISplitViewControllerPanelImpl getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:](self, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", &v29, &v28, 4, 1, 0, 0, v14, 800.0);
        if ([(UISplitViewControllerPanelImpl *)self _isSecondaryColumnCompactInTotalWidth:v14 withPrimaryColumnWidth:v29 supplementaryColumnWidth:v28])
        {
          unint64_t v16 = 2;
        }
        else
        {
          unint64_t v16 = 3;
        }
      }
      else
      {
        unint64_t v16 = 2;
      }
    }
  }
  else
  {
LABEL_11:
    unint64_t v16 = 0;
  }

  BOOL result = v16 > 1;
  if (v6 == 2 && v16 >= 2)
  {
    if (a3 == 1)
    {
      BOOL v21 = 1;
    }
    else
    {
      char v22 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
      BOOL v21 = v22 == 0;
    }
    return v16 == 3 || v21;
  }
  return result;
}

- (BOOL)_isSecondaryColumnCompactInTotalWidth:(double)a3 withPrimaryColumnWidth:(double)a4 supplementaryColumnWidth:(double)a5
{
  int64_t v10 = [(UISplitViewControllerPanelImpl *)self style];
  unint64_t v11 = v10;
  if ((unint64_t)(v10 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    double v18 = _UISplitViewControllerStyleDescription(v11);
    [v17 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 1615, @"Incorrect code path for UISplitViewControllerStyle %@", v18 object file lineNumber description];

    double v12 = a4;
  }
  else
  {
    double v12 = a4;
    if (v10 == 2)
    {
      uint64_t v13 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

      double v14 = -0.0;
      if (v13) {
        double v14 = a5;
      }
      double v12 = v14 + a4;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if (_UISplitViewControllerWantsPickerBehaviors(WeakRetained))
  {

    if (a4 == 0.0 || a5 == 0.0) {
      return 0;
    }
  }
  else
  {
  }
  return [(UISplitViewControllerPanelImpl *)self _interfaceIsCompactForWidth:a3 - v12];
}

- (BOOL)_interfaceIsCompactForWidth:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v5 = [WeakRetained traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 6) {
    return a3 < 260.0;
  }
  else {
    return _UIUserInterfaceSizeClassForWidth(a3) == 1;
  }
}

- (void)showColumn:(int64_t)a3
{
  v48[1] = *MEMORY[0x1E4F143B8];
  unint64_t v6 = [(UISplitViewControllerPanelImpl *)self style];
  if (v6 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v37 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v38 = _UISplitViewControllerStyleDescription(v6);
    [v37 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 2021, @"Incorrect code path for UISplitViewControllerStyle %@", v38 object file lineNumber description];
  }
  if (a3 == 3)
  {
    uint64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 2022, @"Can't show %@ column", @"Compact" object file lineNumber description];

    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = a3 == 1;
    if (v6 != 2 && a3 == 1) {
      return;
    }
  }
  if (v6 != 2
    || ([(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20], uint64_t v8 = objc_claimAutoreleasedReturnValue(), v8, a3)|| v8)
  {
    *(void *)&self->_flags |= 0x400000000uLL;
    if (![(UISplitViewControllerPanelImpl *)self _isCollapsed])
    {
      if (a3 == 2)
      {
        [(UISplitViewControllerPanelImpl *)self _revealSecondaryColumnIfNecessary];
      }
      else
      {
        uint64_t v20 = [(UISplitViewControllerPanelImpl *)self displayMode];
        if ((_UISplitViewControllerColumnIsVisibleForDisplayMode([(UISplitViewControllerPanelImpl *)self style], a3, v20) & 1) == 0)
        {
          BOOL v21 = v6 != 2 && a3 == 0;
          uint64_t v22 = 4;
          if (v21) {
            uint64_t v22 = 2;
          }
          if (v7) {
            uint64_t v23 = 2;
          }
          else {
            uint64_t v23 = v22;
          }
          [(UISplitViewControllerPanelImpl *)self _transitionFromDisplayMode:v20 toDisplayMode:v23];
        }
      }
      goto LABEL_18;
    }
    if (v6 == 2)
    {
      char v9 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
      BOOL v10 = v9 == 0;
    }
    else
    {
      BOOL v10 = 0;
    }
    perColumnViewControllers = self->_perColumnViewControllers;
    double v12 = [NSNumber numberWithInteger:v10];
    uint64_t v13 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:v12];
    double v14 = [v13 navigationController];

    unint64_t v15 = [v14 viewControllers];
    uint64_t v16 = [v15 count];
    double v17 = [v14 topViewController];
    int64_t v18 = [(UISplitViewControllerPanelImpl *)self _columnForViewController:v17];

    if (v18 == a3) {
      goto LABEL_16;
    }
    if (a3 != 2)
    {
      if (a3 == 1)
      {
        if (v18 == 2)
        {
          unint64_t v24 = self->_perColumnViewControllers;
          goto LABEL_51;
        }
        if (!v18)
        {
          uint64_t v32 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
          char v33 = [v32 navigationController];
          v48[0] = v33;
          id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];

          uint64_t v34 = v16 + 1;
          goto LABEL_55;
        }
      }
      else if (!a3)
      {
        unint64_t v24 = self->_perColumnViewControllers;
        if (v6 == 2)
        {
          id v25 = [(NSMutableDictionary *)v24 objectForKeyedSubscript:&unk_1ED3F3A50];
          uint64_t v26 = [v25 navigationController];
          goto LABEL_52;
        }
LABEL_51:
        id v25 = [(NSMutableDictionary *)v24 objectForKeyedSubscript:&unk_1ED3F3A08];
        uint64_t v26 = [v25 navigationControllerWrapper];
        if (!v26)
        {
          char v35 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
          __int16 v36 = [v35 navigationController];
          uint64_t v34 = [v15 indexOfObject:v36];

          goto LABEL_54;
        }
LABEL_52:
        uint64_t v34 = [v15 indexOfObject:v26];
LABEL_54:

        id v19 = 0;
LABEL_55:
        if (v34)
        {
          if (v34 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = __45__UISplitViewControllerPanelImpl_showColumn___block_invoke;
            v41[3] = &unk_1E52E9D28;
            v41[4] = self;
            uint64_t v44 = v34;
            uint64_t v45 = v16;
            id v42 = v14;
            id v19 = v19;
            id v43 = v19;
            [v42 _executeSplitViewControllerActions:v41];
          }
        }
        goto LABEL_17;
      }
LABEL_16:
      id v19 = 0;
LABEL_17:

LABEL_18:
      *(void *)&self->_flags &= ~0x400000000uLL;
      return;
    }
    BOOL v27 = self->_perColumnViewControllers;
    if (v6 != 2 || v18)
    {
      double v28 = [(NSMutableDictionary *)v27 objectForKeyedSubscript:&unk_1ED3F3A08];
      double v29 = [v28 navigationControllerWrapper];
      CGRect v30 = v29;
      if (!v29)
      {
        double v17 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
        CGRect v30 = [v17 navigationController];
      }
      double v46 = v30;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
      if (v29) {
        goto LABEL_49;
      }
    }
    else
    {
      double v28 = [(NSMutableDictionary *)v27 objectForKeyedSubscript:&unk_1ED3F3A50];
      double v29 = [v28 navigationController];
      v47[0] = v29;
      double v17 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
      CGRect v30 = [v17 navigationControllerWrapper];
      id v31 = v30;
      if (!v30)
      {
        int v40 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
        id v31 = [v40 navigationController];
      }
      v47[1] = v31;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
      if (!v30)
      {
      }
    }

LABEL_49:
    uint64_t v34 = [v19 count] + v16;
    goto LABEL_55;
  }
}

- (void)_handleFocusMovementDidFail:(id)a3
{
  if (qword_1EB260170 != -1) {
    dispatch_once(&qword_1EB260170, &__block_literal_global_1405);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t preferredDisplayMode = self->_preferredDisplayMode;
  id v10 = v4;
  if (preferredDisplayMode)
  {
    [v4 encodeInteger:preferredDisplayMode forKey:@"UISplitViewControllerPreferredDisplayMode"];
    id v4 = v10;
  }
  int64_t preferredSplitBehavior = self->_preferredSplitBehavior;
  if (preferredSplitBehavior)
  {
    [v10 encodeInteger:preferredSplitBehavior forKey:@"UISplitViewControllerPreferredSplitBehavior"];
    id v4 = v10;
  }
  if (self->_preferredPrimaryColumnWidthFraction != -3.40282347e38)
  {
    objc_msgSend(v10, "encodeDouble:forKey:", @"UISplitViewControllerPreferredPrimaryColumnWidthFraction");
    id v4 = v10;
  }
  if (self->_preferredPrimaryColumnWidth != -3.40282347e38)
  {
    objc_msgSend(v10, "encodeDouble:forKey:", @"UISplitViewControllerPreferredPrimaryColumnWidth");
    id v4 = v10;
  }
  if (self->_maximumPrimaryColumnWidth != -3.40282347e38)
  {
    objc_msgSend(v10, "encodeDouble:forKey:", @"UISplitViewControllerMaximumPrimaryColumnWidth");
    id v4 = v10;
  }
  if (self->_minimumPrimaryColumnWidth != -3.40282347e38)
  {
    objc_msgSend(v10, "encodeDouble:forKey:", @"UISplitViewControllerMinimumPrimaryColumnWidth");
    id v4 = v10;
  }
  if (self->_preferredSupplementaryColumnWidthFraction != -3.40282347e38)
  {
    objc_msgSend(v10, "encodeDouble:forKey:", @"UISplitViewControllerPreferredSupplementaryColumnWidthFraction");
    id v4 = v10;
  }
  if (self->_preferredSupplementaryColumnWidth != -3.40282347e38)
  {
    objc_msgSend(v10, "encodeDouble:forKey:", @"UISplitViewControllerPreferredSupplementaryColumnWidth");
    id v4 = v10;
  }
  if (self->_maximumSupplementaryColumnWidth != -3.40282347e38)
  {
    objc_msgSend(v10, "encodeDouble:forKey:", @"UISplitViewControllerMaximumSupplementaryColumnWidth");
    id v4 = v10;
  }
  if (self->_minimumSupplementaryColumnWidth != -3.40282347e38)
  {
    objc_msgSend(v10, "encodeDouble:forKey:", @"UISplitViewControllerMinimumSupplementaryColumnWidth");
    id v4 = v10;
  }
  [v4 encodeInteger:self->_primaryEdge forKey:@"UISplitViewControllerPrimaryEdge"];
  [v10 encodeBool:self->_presentsWithGesture forKey:@"UISplitViewControllerPresentsWithGesture"];
  [v10 encodeBool:(*(void *)&self->_flags >> 26) & 1 forKey:@"UISplitViewControllerShowsSecondaryOnlyButton"];
  [v10 encodeBool:(*(void *)&self->_flags >> 13) & 1 forKey:@"UISplitViewControllerUsesDeviceOverlayPreferences"];
  [v10 encodeBool:(*(void *)&self->_flags >> 12) & 1 forKey:@"UISplitViewControllerUsesExtraWidePrimaryColumn"];
  objc_msgSend(v10, "encodeInteger:forKey:", -[UIPanelController style](self->_panelController, "style"), @"UISplitViewControllerStyle");
  int64_t primaryBackgroundStyle = self->_primaryBackgroundStyle;
  if (primaryBackgroundStyle) {
    [v10 encodeInteger:primaryBackgroundStyle forKey:@"UISplitViewControllerPrimaryBackgroundStyle"];
  }
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    uint64_t v8 = [(UISplitViewControllerPanelImpl *)self viewControllerForColumn:3];
    if (v8)
    {
      char v9 = (void *)v8;
      [v10 encodeObject:v8 forKey:@"UISplitViewControllerCompactColumnVC"];
    }
  }
}

- (BOOL)_isExpanding
{
  uint64_t v2 = [(UISplitViewControllerPanelImpl *)self panelController];
  BOOL v3 = [v2 collapsedState] == 3;

  return v3;
}

- (id)_displayModeButtonItem
{
  return self->_unspecifiedStyleDisplayModeButtonItem;
}

- (id)_unspecifiedCompositionDisplayModeButtonItem
{
  return self->_unspecifiedStyleDisplayModeButtonItem;
}

- (id)displayModeButtonItem
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![(UISplitViewControllerPanelImpl *)self style])
  {
    BOOL v3 = self->_unspecifiedStyleDisplayModeButtonItem;
    if (!self->_unspecifiedStyleDisplayModeButtonItem)
    {
      id v4 = [(UIBarButtonItem *)[UISplitViewControllerDisplayModeBarButtonItem alloc] initWithImage:0 landscapeImagePhone:0 style:0 target:self action:sel__triggerDisplayModeAction_];
      unspecifiedStyleDisplayModeButtonItem = self->_unspecifiedStyleDisplayModeButtonItem;
      self->_unspecifiedStyleDisplayModeButtonItem = v4;

      [(UISplitViewControllerDisplayModeBarButtonItem *)self->_unspecifiedStyleDisplayModeButtonItem _setImpl:self];
      unint64_t v6 = self->_unspecifiedStyleDisplayModeButtonItem;

      BOOL v3 = v6;
    }
    if (v3) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
  if (os_variant_has_internal_diagnostics())
  {
    char v9 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    id v10 = _UISplitViewControllerStyleDescription([(UISplitViewControllerPanelImpl *)self style]);
    int v13 = 138412290;
    double v14 = v10;
    _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "displayModeButtonItem is internally managed and not exposed for %@ style. Returning an empty, disconnected UIBarButtonItem to fulfill the non-null contract.", (uint8_t *)&v13, 0xCu);
  }
  else
  {
    uint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &displayModeButtonItem___s_category) + 8);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    char v9 = v8;
    id v10 = _UISplitViewControllerStyleDescription([(UISplitViewControllerPanelImpl *)self style]);
    int v13 = 138412290;
    double v14 = v10;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "displayModeButtonItem is internally managed and not exposed for %@ style. Returning an empty, disconnected UIBarButtonItem to fulfill the non-null contract.", (uint8_t *)&v13, 0xCu);
  }

LABEL_10:
LABEL_11:
  BOOL v3 = self->_unspecifiedStyleDisplayModeButtonItem;
  if (v3)
  {
LABEL_5:
    BOOL v7 = v3;
    goto LABEL_13;
  }
LABEL_12:
  BOOL v7 = objc_alloc_init(UIBarButtonItem);
LABEL_13:
  unint64_t v11 = v7;

  return v11;
}

- (void)setPreferredPrimaryColumnWidthFraction:(double)a3
{
  if (self->_preferredPrimaryColumnWidthFraction != a3)
  {
    self->_preferredPrimaryColumnWidthFraction = a3;
    [(UISplitViewControllerPanelImpl *)self _primaryColumnWidthAffectingPropertyDidChange];
  }
}

- (void)showViewController:(id)a3 sender:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = [(UISplitViewControllerPanelImpl *)self _childContainingSender:v8];
    if (v9 == v7)
    {
LABEL_42:

      goto LABEL_43;
    }
    p_svc = &self->_svc;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    int v56 = [(UISplitViewControllerPanelImpl *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      int64_t v12 = [(UISplitViewControllerPanelImpl *)self style];
      if (v12)
      {
        unint64_t v13 = v12;
        double v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &qword_1EB260090) + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = v14;
          uint64_t v16 = NSStringFromSelector(sel_splitViewController_showViewController_sender_);
          double v17 = _UISplitViewControllerStyleDescription(v13);
          *(_DWORD *)long long buf = 138543618;
          char v60 = v16;
          __int16 v61 = 2114;
          BOOL v62 = v17;
          _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", buf, 0x16u);
        }
      }
      else if ([v56 splitViewController:WeakRetained showViewController:v7 sender:v8])
      {
        goto LABEL_41;
      }
    }
    int64_t v18 = [(UISplitViewControllerPanelImpl *)self panelController];
    int v19 = [v18 isCollapsed];

    int64_t v20 = [(UISplitViewControllerPanelImpl *)self style];
    if (v20)
    {
      int64_t v21 = v20;
      int64_t v22 = [(UISplitViewControllerPanelImpl *)self _columnForViewController:v7];
      if (v22 == 999)
      {
        int64_t v23 = [(UISplitViewControllerPanelImpl *)self _columnForViewController:v9];
        if (v23 == 1)
        {
          uint64_t v24 = 2;
          goto LABEL_29;
        }
        if (!v23)
        {
          if (v21 == 1) {
            uint64_t v24 = 2;
          }
          else {
            uint64_t v24 = 1;
          }
          goto LABEL_29;
        }
      }
      else
      {
        uint64_t v24 = v22;
        if (v22 == 3) {
          int v32 = v19;
        }
        else {
          int v32 = 1;
        }
        if (v32 == 1)
        {
LABEL_29:
          if ((*((unsigned char *)&self->_flags + 3) & 8) != 0)
          {
            id v54 = (void *)MEMORY[0x1E4F1CA00];
            id v55 = WeakRetained;
            uint64_t v42 = *MEMORY[0x1E4F1C3C8];
            id v43 = NSStringFromSelector(a2);
            id v44 = objc_loadWeakRetained((id *)&self->_svc);
            uint64_t v45 = [v44 delegate];
            uint64_t v46 = v42;
            id WeakRetained = v55;
            [v54 raise:v46, @"%@ disallowed underneath delegate callback from %@ to %@", v43, v44, v45 format];
          }
          [(UISplitViewControllerPanelImpl *)self updatePanelControllerForViewControllerChangeInColumn:v24 alwaysAnimate:1];
          if (v19) {
            goto LABEL_41;
          }
          if (v24 == 2)
          {
            [(UISplitViewControllerPanelImpl *)self _revealSecondaryColumnIfNecessary];
            goto LABEL_41;
          }
          uint64_t v47 = [(UISplitViewControllerPanelImpl *)self displayMode];
          if ((_UISplitViewControllerColumnIsVisibleForDisplayMode([(UISplitViewControllerPanelImpl *)self style], v24, v47) & 1) == 0)
          {
            uint64_t v48 = [(UISplitViewControllerPanelImpl *)self _nextTargetDisplayModeForDisplayMode:v47 showMoreIfPossible:1];
            if ((_UISplitViewControllerColumnIsVisibleForDisplayMode([(UISplitViewControllerPanelImpl *)self style], v24, v48) & 1) == 0)uint64_t v48 = [(UISplitViewControllerPanelImpl *)self _nextTargetDisplayModeForDisplayMode:v48 showMoreIfPossible:1]; {
            if (_UISplitViewControllerColumnIsVisibleForDisplayMode([(UISplitViewControllerPanelImpl *)self style], v24, v48))
            }
            {
              [(UISplitViewControllerPanelImpl *)self _transitionFromDisplayMode:v47 toDisplayMode:v48];
              goto LABEL_41;
            }
            uint64_t v39 = WeakRetained;
            if (os_variant_has_internal_diagnostics())
            {
              char v52 = __UIFaultDebugAssertLog();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
              {
                id v53 = _UISplitViewControllerColumnDescription(v24);
                *(_DWORD *)long long buf = 138412290;
                char v60 = v53;
                _os_log_fault_impl(&dword_1853B0000, v52, OS_LOG_TYPE_FAULT, "UIKit error: Can't find a display mode where %@ column is visible", buf, 0xCu);
              }
              goto LABEL_41;
            }
            int v51 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260098) + 8);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              __int16 v38 = v51;
              int v40 = _UISplitViewControllerColumnDescription(v24);
              *(_DWORD *)long long buf = 138412290;
              char v60 = v40;
              _os_log_impl(&dword_1853B0000, v38, OS_LOG_TYPE_ERROR, "UIKit error: Can't find a display mode where %@ column is visible", buf, 0xCu);
LABEL_26:

              id WeakRetained = v39;
            }
          }
LABEL_41:

          goto LABEL_42;
        }
      }
      char v33 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &qword_1EB2600A0) + 8);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = v33;
        char v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v37 = id v36 = WeakRetained;
        *(_DWORD *)long long buf = 138543618;
        char v60 = v37;
        __int16 v61 = 2050;
        BOOL v62 = v36;
        _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "Unexpected request to show compact column when UISplitViewController is not collapsed. Using a default presentation. <%{public}@: %{public}p>", buf, 0x16u);

        id WeakRetained = v36;
      }
    }
    else if ((v19 & 1) == 0)
    {
      id v25 = WeakRetained;
      id v26 = objc_loadWeakRetained((id *)&self->_svc);
      BOOL v27 = [v26 viewControllers];

      id v28 = objc_loadWeakRetained((id *)p_svc);
      id v29 = [v28 masterViewController];

      if (v29 == v9)
      {
        v58[0] = v7;
        CGRect v30 = [v27 objectAtIndexedSubscript:1];
        v58[1] = v30;
        id v31 = v58;
      }
      else
      {
        CGRect v30 = [v27 objectAtIndexedSubscript:0];
        v57[0] = v30;
        v57[1] = v7;
        id v31 = v57;
      }
      uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];

      id v50 = objc_loadWeakRetained((id *)p_svc);
      [v50 setViewControllers:v49];

      id WeakRetained = v25;
      goto LABEL_41;
    }
    if (!+[UIView areAnimationsEnabled])
    {
      [WeakRetained presentViewController:v7 animated:0 completion:0];
      goto LABEL_41;
    }
    __int16 v38 = objc_loadWeakRetained((id *)p_svc);
    [v38 view];
    int v40 = v39 = WeakRetained;
    int v41 = [v40 window];
    [v39 presentViewController:v7 animated:v41 != 0 completion:0];

    goto LABEL_26;
  }
LABEL_43:
}

- (void)_unspecifiedShowDetailViewController:(id)a3 onTargetVC:(id)a4 sender:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(UISplitViewControllerPanelImpl *)self panelController];
  char v12 = [v11 isCollapsed];

  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)p_svc);
  uint64_t v15 = WeakRetained;
  if ((v12 & 1) == 0)
  {
    uint64_t v16 = [WeakRetained masterViewController];

    if (v16)
    {
      id v26 = v16;
      id v27 = v8;
      double v17 = (void *)MEMORY[0x1E4F1C978];
      int64_t v18 = &v26;
      uint64_t v19 = 2;
    }
    else
    {
      id v25 = v8;
      double v17 = (void *)MEMORY[0x1E4F1C978];
      int64_t v18 = &v25;
      uint64_t v19 = 1;
    }
    int64_t v23 = objc_msgSend(v17, "arrayWithObjects:count:", v18, v19, v25, v26, v27, v28);
    id v24 = objc_loadWeakRetained((id *)p_svc);
    [v24 setViewControllers:v23];

    goto LABEL_11;
  }
  [WeakRetained _willShowCollapsedDetailViewController:v8 inTargetController:v9];

  if (![(id)objc_opt_class() doesOverrideViewControllerMethod:sel_showViewController_sender_])
  {
    uint64_t v16 = objc_loadWeakRetained((id *)p_svc);
    if (+[UIView areAnimationsEnabled])
    {
      id v20 = objc_loadWeakRetained((id *)p_svc);
      int64_t v21 = [v20 view];
      int64_t v22 = [v21 window];
      [v16 presentViewController:v8 animated:v22 != 0 completion:0];
    }
    else
    {
      [v16 presentViewController:v8 animated:0 completion:0];
    }
LABEL_11:

    goto LABEL_12;
  }
  [v9 showViewController:v8 sender:v10];
LABEL_12:
}

- (void)_revealSecondaryColumnIfNecessary
{
  BOOL v3 = [(UISplitViewControllerPanelImpl *)self currentState];
  unint64_t v4 = [(UISplitViewControllerPanelImpl *)self _displayModeForState:v3];

  if (_UISplitViewControllerColumnIsHiddenOrDimmedForDisplayMode([(UISplitViewControllerPanelImpl *)self style], 2, v4))
  {
    uint64_t v5 = 2;
    if (v4 != 6) {
      uint64_t v5 = v4;
    }
    if (v4 == 5) {
      uint64_t v5 = 1;
    }
    if (v4 == 3) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v5;
    }
    [(UISplitViewControllerPanelImpl *)self _transitionFromDisplayMode:v4 toDisplayMode:v6];
  }
}

- (void)showDetailViewController:(id)a3 sender:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    id v9 = [WeakRetained detailViewController];
    int64_t v10 = [(UISplitViewControllerPanelImpl *)self style];
    unint64_t v11 = [(UISplitViewControllerPanelImpl *)self panelController];
    int v12 = [v11 isCollapsed];

    unint64_t v13 = [v9 _existingView];
    double v14 = [v13 window];

    if (!v14 || v9 == v7)
    {
      if (v10) {
        int v15 = v12;
      }
      else {
        int v15 = 0;
      }
      if (v15 == 1
        && (-[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1ED3F3A38), uint64_t v16 = objc_claimAutoreleasedReturnValue(), [v16 viewController], v17 = objc_claimAutoreleasedReturnValue(), v16, v17))
      {
        id v18 = v17;

        id v9 = v18;
      }
      else
      {
        id v18 = [WeakRetained masterViewController];
      }

      id v9 = v18;
    }
    uint64_t v19 = v7;
    if (v9 == v7) {
      goto LABEL_78;
    }
    id v72 = v8;
    double v71 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector())
    {
      int64_t v20 = [(UISplitViewControllerPanelImpl *)self style];
      if (v20)
      {
        unint64_t v21 = v20;
        int64_t v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &showDetailViewController_sender____s_category)+ 8);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          int64_t v23 = v22;
          id v24 = NSStringFromSelector(sel_splitViewController_showDetailViewController_sender_);
          id v25 = _UISplitViewControllerStyleDescription(v21);
          *(_DWORD *)long long buf = 138543618;
          BOOL v81 = v24;
          __int16 v82 = 2114;
          int v83 = v25;
          _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", buf, 0x16u);
        }
      }
      else if ([v71 splitViewController:WeakRetained showDetailViewController:v7 sender:v8])
      {
        goto LABEL_77;
      }
    }
    if (v10)
    {
      id v8 = v72;
      if ((v12 & 1) == 0)
      {
        if ([(UISplitViewControllerPanelImpl *)self _columnForViewController:v7] == 2) {
          [(UISplitViewControllerPanelImpl *)self updatePanelControllerForViewControllerChangeInColumn:2];
        }
        else {
          [(UISplitViewControllerPanelImpl *)self setViewController:v7 forColumn:2];
        }
        [(UISplitViewControllerPanelImpl *)self _revealSecondaryColumnIfNecessary];
        goto LABEL_77;
      }
      unint64_t v26 = [(UISplitViewControllerPanelImpl *)self _columnForViewController:v9];
      if ([(UISplitViewControllerPanelImpl *)self style] == 2)
      {
        id v27 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
        uint64_t v28 = v27 == 0;
      }
      else
      {
        uint64_t v28 = 0;
      }
      BOOL v70 = v26 == v28;
      if (v26 != v28 && (v26 & 0xFFFFFFFFFFFFFFFELL) != 2)
      {
        id v29 = [MEMORY[0x1E4F28B00] currentHandler];
        CGRect v30 = _UISplitViewControllerColumnDescription(v26);
        [v29 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 1503, @"Unexpected target column, %@, for pushing new detail vc, %@, onto UISplitViewController, %@", v30, v7, WeakRetained object file lineNumber description];
      }
      if (v26)
      {
        if (v26 != 2) {
          goto LABEL_38;
        }
        p_perColumnViewControllers = &self->_perColumnViewControllers;
        perColumnViewControllers = self->_perColumnViewControllers;
        char v33 = &unk_1ED3F3A08;
      }
      else
      {
        p_perColumnViewControllers = &self->_perColumnViewControllers;
        perColumnViewControllers = self->_perColumnViewControllers;
        char v33 = &unk_1ED3F3A20;
      }
      uint64_t v34 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:v33];
      id v35 = [v34 navigationControllerWrapper];

      if (v9 == v35)
      {
        id v36 = [(NSMutableDictionary *)*p_perColumnViewControllers objectForKeyedSubscript:v33];
        uint64_t v37 = [v36 navigationController];

        id v9 = (id)v37;
      }
      id v8 = v72;
LABEL_38:
      if ([v9 _isNavigationController]) {
        __int16 v38 = v9;
      }
      else {
        __int16 v38 = 0;
      }
      id v39 = v38;
      if (!v39)
      {
        if (+[UIView areAnimationsEnabled])
        {
          id v47 = objc_loadWeakRetained((id *)&self->_svc);
          uint64_t v48 = [v47 view];
          uint64_t v49 = [v48 window];
          [WeakRetained presentViewController:v7 animated:v49 != 0 completion:0];
        }
        else
        {
          [WeakRetained presentViewController:v7 animated:0 completion:0];
        }
LABEL_76:

        goto LABEL_77;
      }
      if ([v7 _isNavigationController]) {
        [v39 _setAllowNestedNavigationControllers:1];
      }
      if (v26 || v10 != 2)
      {
        BOOL v50 = v26 == 1;
        if (v26 >= 2)
        {
          BOOL v51 = v70;
          if (v26 == 2)
          {
            int v69 = 1;
            goto LABEL_62;
          }
LABEL_61:
          [(UISplitViewControllerPanelImpl *)self sendWillShowColumn:2];
          int v69 = 0;
LABEL_62:
          id v54 = v7;
          id v55 = v54;
          if (v51)
          {
            int v56 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
            int v57 = [v56 navigationController];
            __int16 v58 = [v57 _existingView];
            BOOL v59 = [v58 window];

            id v8 = v72;
            id v55 = v54;
            if (!v59)
            {
              [(UISplitViewControllerPanelImpl *)self setViewController:v54 forColumn:2];
              char v60 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
              __int16 v61 = [v60 navigationControllerWrapper];
              BOOL v62 = v61;
              if (v61)
              {
                id v55 = v61;
                uint64_t v63 = v54;
              }
              else
              {
                uint64_t v63 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
                id v55 = [v63 navigationController];
              }
              if ([v55 _isNavigationController]) {
                [v39 _setAllowNestedNavigationControllers:1];
              }
              id v8 = v72;
              if (!v55) {
                id v55 = v54;
              }
            }
          }
          id v64 = [v39 topViewController];

          if (v64 != v55)
          {
            v74[0] = MEMORY[0x1E4F143A8];
            v74[1] = 3221225472;
            v74[2] = __66__UISplitViewControllerPanelImpl_showDetailViewController_sender___block_invoke_3;
            v74[3] = &unk_1E52DCB30;
            id v75 = v9;
            id v76 = v55;
            id v77 = v8;
            [v39 _executeSplitViewControllerActions:v74];
          }
          if (v69)
          {
            v65 = [_UISplitViewControllerColumnContents alloc];
            BOOL v66 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
            id v67 = [v66 navigationControllerWrapper];
            BOOL v68 = [(_UISplitViewControllerColumnContents *)v65 initWithViewController:v54 navigationController:v39 navigationControllerWrapper:v67];

            id v8 = v72;
            [(NSMutableDictionary *)self->_perColumnViewControllers setObject:v68 forKey:&unk_1ED3F3A08];
          }
          goto LABEL_76;
        }
        BOOL v51 = v70;
      }
      else
      {
        int v40 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
        int v41 = [v40 navigationController];

        uint64_t v42 = [v39 topViewController];

        if (v42 == v41)
        {
          BOOL v50 = 1;
          BOOL v51 = v70;
        }
        else
        {
          id v43 = [v39 viewControllers];
          int v44 = [v43 containsObject:v41];

          if (v44)
          {
            uint64_t v45 = v79;
            v79[0] = MEMORY[0x1E4F143A8];
            v79[1] = 3221225472;
            uint64_t v46 = __66__UISplitViewControllerPanelImpl_showDetailViewController_sender___block_invoke;
          }
          else
          {
            uint64_t v45 = v78;
            v78[0] = MEMORY[0x1E4F143A8];
            v78[1] = 3221225472;
            uint64_t v46 = __66__UISplitViewControllerPanelImpl_showDetailViewController_sender___block_invoke_2;
          }
          BOOL v51 = v70;
          v45[2] = v46;
          v45[3] = &unk_1E52D9F98;
          id v52 = v39;
          v45[4] = v52;
          v45[5] = v41;
          id v53 = v41;
          [v52 _executeSplitViewControllerActions:v45];

          BOOL v50 = 0;
        }
      }
      [(UISplitViewControllerPanelImpl *)self sendWillHideColumn:v50];
      goto LABEL_61;
    }
    id v8 = v72;
    [(UISplitViewControllerPanelImpl *)self _unspecifiedShowDetailViewController:v7 onTargetVC:v9 sender:v72];
LABEL_77:

    uint64_t v19 = v9;
LABEL_78:
  }
}

id __66__UISplitViewControllerPanelImpl_showDetailViewController_sender___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) popToViewController:*(void *)(a1 + 40) animated:0];
}

uint64_t __66__UISplitViewControllerPanelImpl_showDetailViewController_sender___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 40) animated:0];
}

uint64_t __66__UISplitViewControllerPanelImpl_showDetailViewController_sender___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) showViewController:*(void *)(a1 + 40) sender:*(void *)(a1 + 48)];
}

void __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 16));
  uint64_t v4 = [v2 _separateViewControllersAfterAndIncludingViewController:v3 forSplitViewController:WeakRetained];
  uint64_t v5 = *(void *)(a1[7] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), 0, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

id __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_4(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) popToViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

void __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_6(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  v4[0] = *(void *)(a1 + 40);
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 setViewControllers:v3 animated:*(unsigned __int8 *)(a1 + 48)];
}

void __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_7(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 16));
  uint64_t v4 = [v2 _separateViewControllersAfterAndIncludingViewController:v3 forSplitViewController:WeakRetained];
  uint64_t v5 = *(void *)(a1[7] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __62__UISplitViewControllerPanelImpl_setViewController_forColumn___block_invoke_245(uint64_t a1)
{
  return [*(id *)(a1 + 32) setViewControllers:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (BOOL)_allowClientAnimationCoordination
{
  return 1;
}

- (void)hideColumn:(int64_t)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int64_t v6 = [(UISplitViewControllerPanelImpl *)self style];
  if ((unint64_t)(v6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v37 = _UISplitViewControllerStyleDescription(v6);
    [v36 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 1968, @"Incorrect code path for UISplitViewControllerStyle %@", v37 object file lineNumber description];
  }
  if (a3 == 1)
  {
    if (v6 != 2) {
      return;
    }
  }
  else
  {
    if (a3 != 3)
    {
      BOOL v7 = a3 == 0;
      if (!a3 && v6 == 2)
      {
        long long v8 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

        if (!v8) {
          return;
        }
        BOOL v7 = 1;
      }
      goto LABEL_11;
    }
    __int16 v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 1969, @"Can't hide %@ column", @"Compact" object file lineNumber description];
  }
  BOOL v7 = 0;
LABEL_11:
  *(void *)&self->_flags |= 0x400000000uLL;
  BOOL v9 = [(UISplitViewControllerPanelImpl *)self _isCollapsed];
  int64_t v10 = [(UIPanelController *)self->_panelController collapsedState];
  int64_t v11 = v10;
  if (v9 || v10 == 1)
  {
    if (v6 == 2)
    {
      int64_t v22 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
      uint64_t v23 = v22 == 0;
    }
    else
    {
      uint64_t v23 = 0;
    }
    perColumnViewControllers = self->_perColumnViewControllers;
    id v25 = [NSNumber numberWithInteger:v23];
    unint64_t v26 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:v25];
    id v27 = [v26 navigationController];

    uint64_t v28 = [v27 topViewController];
    int64_t v29 = [(UISplitViewControllerPanelImpl *)self _columnForViewController:v28];

    if (v23 != a3 && v29 == a3)
    {
      if ((*((unsigned char *)&self->_flags + 3) & 0x10) != 0)
      {
        char v33 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &qword_1EB2600B8) + 8);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = v33;
          id v35 = _UISplitViewControllerColumnDescription(a3);
          *(_DWORD *)long long buf = 138543362;
          id v43 = v35;
          _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "Hiding %{public}@ column underneath -splitViewController:topColumnForProposedTopColumn: is ignored. The delegate method implementation should return the desired top column instead.", buf, 0xCu);
        }
      }
      else
      {
        if (v11 == 1)
        {
          CGRect v30 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &qword_1EB2600C0) + 8);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            id v31 = v30;
            int v32 = _UISplitViewControllerColumnDescription(a3);
            *(_DWORD *)long long buf = 138543362;
            id v43 = v32;
            _os_log_impl(&dword_1853B0000, v31, OS_LOG_TYPE_ERROR, "Hiding %{public}@ column before UISplitViewController has finished collapsing can result in inconsistent state. This is a client bug.", buf, 0xCu);
          }
        }
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __45__UISplitViewControllerPanelImpl_hideColumn___block_invoke;
        v39[3] = &unk_1E52D9F98;
        id v40 = v27;
        int v41 = self;
        [v40 _executeSplitViewControllerActions:v39];
      }
    }
  }
  else if (a3 != 2)
  {
    uint64_t v12 = [(UISplitViewControllerPanelImpl *)self displayMode];
    int IsVisibleForDisplayMode = _UISplitViewControllerColumnIsVisibleForDisplayMode(v6, a3, v12);
    uint64_t v14 = 1;
    if (v6 == 2 && v7) {
      uint64_t v14 = 2;
    }
    if (IsVisibleForDisplayMode) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = v12;
    }
    if ((*((unsigned char *)&self->_flags + 3) & 0x20) != 0 && v12 != v15)
    {
      uint64_t v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &qword_1EB2600C8) + 8);
      uint64_t v15 = v12;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        double v17 = v16;
        id v18 = _UISplitViewControllerColumnDescription(a3);
        *(_DWORD *)long long buf = 138543362;
        id v43 = v18;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Hiding %{public}@ column underneath -splitViewController:displayModeForExpandingToProposedDisplayMode: is ignored. The delegate method implementation should return the desired displayMode instead.", buf, 0xCu);

        uint64_t v15 = v12;
      }
    }
    if ([(UIPanelController *)self->_panelController collapsedState] == 3 && v12 != v15)
    {
      uint64_t v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &qword_1EB2600D0) + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int64_t v20 = v19;
        unint64_t v21 = _UISplitViewControllerColumnDescription(a3);
        *(_DWORD *)long long buf = 138543362;
        id v43 = v21;
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Hiding %{public}@ column before UISplitViewController has finished expanding can result in inconsistent state. This is a client bug.", buf, 0xCu);
      }
    }
    if (v12 != v15) {
      [(UISplitViewControllerPanelImpl *)self _transitionFromDisplayMode:v12 toDisplayMode:v15];
    }
  }
  *(void *)&self->_flags &= ~0x400000000uLL;
}

void __45__UISplitViewControllerPanelImpl_hideColumn___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (+[UIView areAnimationsEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    uint64_t v3 = [WeakRetained view];
    uint64_t v4 = [v3 window];
    id v5 = (id)[v2 popViewControllerAnimated:v4 != 0];
  }
  else
  {
    id v6 = (id)[v2 popViewControllerAnimated:0];
  }
}

- (void)setPreferredSupplementaryColumnWidthFraction:(double)a3
{
  double preferredSupplementaryColumnWidthFraction = self->_preferredSupplementaryColumnWidthFraction;
  if (preferredSupplementaryColumnWidthFraction != a3)
  {
    if (a3 != -3.40282347e38 && (a3 < 0.0 || a3 > 1.0))
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported %@, %g, for supplementary column. Value must be %@", @"minimum or maximum width value", *(void *)&a3, @"UISplitViewControllerAutomaticDimension or between 0 and 1, inclusive" format];
      double preferredSupplementaryColumnWidthFraction = self->_preferredSupplementaryColumnWidthFraction;
    }
    self->_double preferredSupplementaryColumnWidthFraction = a3;
    if (!dyld_program_sdk_at_least() || preferredSupplementaryColumnWidthFraction != a3)
    {
      [(UISplitViewControllerPanelImpl *)self _supplementaryOrPrimaryColumnWidthAffectingPropertyDidChange];
    }
  }
}

- (float)gutterWidth
{
  uint64_t v3 = [(UISplitViewControllerPanelImpl *)self panelController];
  uint64_t v4 = [v3 configuration];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v6 = [WeakRetained traitCollection];
  [v6 displayScale];
  if (v7 == 0.0)
  {
    long long v8 = +[UIScreen mainScreen];
    [v8 scale];
    double v10 = v9;
  }
  else
  {
    double v10 = v7;
  }

  if ([(UISplitViewControllerPanelImpl *)self _isPrimaryLeading]) {
    [v4 leadingBorderWidthForScale:v10];
  }
  else {
    [v4 trailingBorderWidthForScale:v10];
  }
  float v12 = v11;

  return v12;
}

- (BOOL)hidesMasterViewInPortrait
{
  return 1;
}

- (void)setHidesMasterViewInPortrait:(BOOL)a3
{
  int64_t v5 = [(UISplitViewControllerPanelImpl *)self style];
  if (v5)
  {
    unint64_t v9 = v5;
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    double v11 = _UISplitViewControllerStyleDescription(v9);
    [v10 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 2267, @"Incorrect code path for UISplitViewControllerStyle %@", v11 object file lineNumber description];
  }
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)p_svc);
  id v12 = [WeakRetained delegate];

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v8 = objc_loadWeakRetained((id *)p_svc);
    [v8 loadViewIfNeeded];
  }
}

- (NSString)_displayModeButtonItemTitle
{
  return self->_displayModeButtonItemTitle;
}

- (id)_primaryDimmingView
{
  [(UISplitViewControllerPanelImpl *)self _updateDimmingView];
  return [(UISplitViewControllerPanelImpl *)self _dimmingView];
}

- (BOOL)prefersOverlayInRegularWidthPhone
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (void)setUsesDeviceOverlayPreferences:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)usesDeviceOverlayPreferences
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (BOOL)_usesExtraWidePrimaryColumn
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (BOOL)_isRotating
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UISplitViewControllerPanelImpl.m" lineNumber:2377 description:@"Should not be called in this UISplitViewController impl"];

  return 0;
}

- (CGSize)_contentSizeForChildViewController:(id)a3 inPopoverController:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"UISplitViewControllerPanelImpl.m" lineNumber:2387 description:@"Should not be called in this UISplitViewController impl"];

  double v7 = *MEMORY[0x1E4F1DB30];
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)_popoverController:(id)a3 willChangeToVisible:(BOOL)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"UISplitViewControllerPanelImpl.m" lineNumber:2393 description:@"Should not be called in this UISplitViewController impl"];
}

- (void)_popoverController:(id)a3 didChangeFromVisible:(BOOL)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"UISplitViewControllerPanelImpl.m" lineNumber:2398 description:@"Should not be called in this UISplitViewController impl"];
}

- (void)_willShowCollapsedDetailViewController:(id)a3 inTargetController:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  double v7 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v7 setPreservedDetailController:v6];

  LODWORD(v7) = [v6 _isNavigationController];
  if (v7
    && [(id)objc_opt_class() doesOverrideViewControllerMethod:sel_showViewController_sender_])
  {
    [v8 _setAllowNestedNavigationControllers:1];
  }
}

- (void)_willBeginSnapshotSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v3 = [WeakRetained _existingView];

  uint64_t v4 = WeakRetained;
  if (v3)
  {
    int64_t v5 = [WeakRetained traitCollection];
    suspendedTraitCollection = self->_suspendedTraitCollection;
    self->_suspendedTraitCollection = v5;

    double v7 = [WeakRetained view];
    [v7 bounds];
    self->_suspendedSize.double width = v8;
    self->_suspendedSize.double height = v9;

    double v10 = [(UISplitViewControllerPanelImpl *)self panelController];
    double v11 = [v10 currentState];
    id v12 = [v11 stateRequest];
    suspendedStateRequest = self->_suspendedStateRequest;
    self->_suspendedStateRequest = v12;

    if (([WeakRetained _isCollapsed] & 1) == 0)
    {
      uint64_t v14 = [(UISplitViewControllerPanelImpl *)self panelController];
      [v14 _storeSuspendedConfiguration];
    }
    int v15 = [WeakRetained _isCollapsed];
    int64_t v16 = 1;
    if (v15) {
      int64_t v16 = 2;
    }
    self->_int64_t suspendedState = v16;
    double v17 = [WeakRetained _firstResponder];
    id v18 = [v17 _window];
    uint64_t v19 = [v18 windowScene];
    int64_t v20 = [v19 keyboardSceneDelegate];

    suspendedFirstResponder = [v17 _window];
    if (suspendedFirstResponder && [v17 _requiresKeyboardWhenFirstResponder])
    {
      char v22 = [v20 _isPreservedRestorableResponder:v17];

      if (v22)
      {
LABEL_11:

        uint64_t v4 = WeakRetained;
        goto LABEL_12;
      }
      uint64_t v23 = v17;
      suspendedFirstResponder = self->_suspendedFirstResponder;
      self->_suspendedFirstResponder = v23;
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)_didEndSnapshotSession
{
  suspendedTraitCollection = self->_suspendedTraitCollection;
  self->_suspendedTraitCollection = 0;

  self->_suspendedSize = (CGSize)*MEMORY[0x1E4F1DB30];
  suspendedStateRequest = self->_suspendedStateRequest;
  self->_suspendedStateRequest = 0;

  self->_int64_t suspendedState = 0;
  int64_t v5 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v5 _clearSuspendedConfiguration];

  if (self->_suspendedFirstResponder)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    uint64_t v7 = [WeakRetained _window];
    if (v7)
    {
      CGFloat v8 = (void *)v7;
      id v9 = objc_loadWeakRetained((id *)&self->_svc);
      double v10 = [v9 view];
      int v11 = [v10 _containsResponder:self->_suspendedFirstResponder];

      if (v11) {
        [(UIResponder *)self->_suspendedFirstResponder becomeFirstResponder];
      }
    }
    else
    {
    }
  }
  suspendedFirstResponder = self->_suspendedFirstResponder;
  self->_suspendedFirstResponder = 0;
}

- (BOOL)_isAnimating
{
  return [(UIPanelController *)self->_panelController isAnimating];
}

- (double)_primaryDividerPosition
{
  uint64_t v3 = [(UISplitViewControllerPanelImpl *)self panelController];
  uint64_t v4 = [v3 currentState];

  double v5 = -1.0;
  if (v4 && ([v4 isCollapsed] & 1) == 0)
  {
    if ([(UISplitViewControllerPanelImpl *)self _isPrimaryLeading])
    {
      [v4 leadingWidth];
      double v7 = v6;
      if ([(UISplitViewControllerPanelImpl *)self style]) {
        [v4 leadingOffscreenWidth];
      }
      else {
        [v4 leadingDragOffset];
      }
    }
    else
    {
      [v4 trailingWidth];
      double v7 = v9;
      if ([(UISplitViewControllerPanelImpl *)self style]) {
        [v4 trailingOffscreenWidth];
      }
      else {
        [v4 trailingDragOffset];
      }
    }
    double v10 = v7 - v8;
    if (v10 <= 0.0) {
      double v5 = -1.0;
    }
    else {
      double v5 = v10;
    }
  }

  return v5;
}

- (double)_supplementaryDividerPosition
{
  uint64_t v3 = [(UISplitViewControllerPanelImpl *)self panelController];
  uint64_t v4 = [v3 currentState];

  double v5 = -1.0;
  if (v4 && ([v4 isCollapsed] & 1) == 0)
  {
    BOOL v6 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
    [(UISplitViewControllerPanelImpl *)self gutterWidth];
    double v8 = v7;
    if (v6)
    {
      [v4 leadingWidth];
      double v10 = v9;
      [v4 leadingOffscreenWidth];
    }
    else
    {
      [v4 trailingWidth];
      double v10 = v12;
      [v4 trailingOffscreenWidth];
    }
    double v13 = v10 - v11 + v8;
    [v4 supplementaryWidth];
    double v15 = v14 + v13;
    [v4 supplementaryOffscreenWidth];
    double v17 = v15 - v16;
    if (v17 <= 0.0) {
      double v5 = -1.0;
    }
    else {
      double v5 = v17;
    }
  }

  return v5;
}

- (int64_t)_greatestAllowedAutohidingDisplayModeInSize:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [(UISplitViewControllerPanelImpl *)self style];
  if (v7 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    id v25 = _UISplitViewControllerStyleDescription(v7);
    [v24 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 2563, @"Incorrect code path for UISplitViewControllerStyle %@", v25 object file lineNumber description];
  }
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  char v10 = _UISplitViewControllerAutoHidesColumns(WeakRetained);

  if ((v10 & 1) == 0)
  {
    unint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"UISplitViewControllerPanelImpl.m" lineNumber:2563 description:@"Method restricted to autohiding context for UISplitViewController"];
  }
  if ([(UISplitViewControllerPanelImpl *)self _isSecondaryColumnCompactInTotalWidth:width withPrimaryColumnWidth:0.0 supplementaryColumnWidth:0.0])
  {
    if (_UIGetUISplitViewControllerChamoisResizeLogging())
    {
      double v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("ChamoisResize", &qword_1EB2600D8) + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        double v12 = v11;
        id v13 = objc_loadWeakRetained((id *)p_svc);
        *(_DWORD *)long long buf = 138412546;
        id v34 = v13;
        __int16 v35 = 2048;
        double v36 = width;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%@: Using SecondaryOnly as greatest allowed autohiding display mode in overly narrow width, %g", buf, 0x16u);
      }
    }
    return 1;
  }
  else
  {
    id v15 = objc_loadWeakRetained((id *)&self->_svc);
    int v16 = _UISplitViewControllerAutoRevealsFullSidebar(v15);
    uint64_t v14 = 2;
    if (v7 == 2 && v16)
    {
      double v17 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
      if (v17) {
        uint64_t v14 = 4;
      }
      else {
        uint64_t v14 = 2;
      }
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    uint64_t v28 = __78__UISplitViewControllerPanelImpl__greatestAllowedAutohidingDisplayModeInSize___block_invoke;
    int64_t v29 = &unk_1E52E9B28;
    CGRect v30 = self;
    double v31 = width;
    CGFloat v32 = height;
    for (uint64_t i = __78__UISplitViewControllerPanelImpl__greatestAllowedAutohidingDisplayModeInSize___block_invoke((uint64_t)v27, v14); i != v14; uint64_t i = v28((uint64_t)v27, i))
      uint64_t v14 = i;
    if (_UIGetUISplitViewControllerChamoisResizeLogging())
    {
      uint64_t v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("ChamoisResize", &qword_1EB2600E0) + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int64_t v20 = v19;
        id v21 = objc_loadWeakRetained((id *)p_svc);
        char v22 = _UISplitViewControllerDisplayModeDescription(v14);
        *(_DWORD *)long long buf = 138412802;
        id v34 = v21;
        __int16 v35 = 2112;
        double v36 = *(double *)&v22;
        __int16 v37 = 2048;
        double v38 = width;
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "%@: Using %@ as greatest allowed autohiding display mode in width %g", buf, 0x20u);
      }
    }
  }
  return v14;
}

uint64_t __78__UISplitViewControllerPanelImpl__greatestAllowedAutohidingDisplayModeInSize___block_invoke(uint64_t a1, uint64_t a2)
{
  double v7 = 0.0;
  double v8 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", &v8, &v7, a2, 1, 0, 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  int v4 = [*(id *)(a1 + 32) _isSecondaryColumnCompactInTotalWidth:*(double *)(a1 + 40) withPrimaryColumnWidth:v8 supplementaryColumnWidth:v7];
  if (a2 == 4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  if (v4) {
    return v5;
  }
  else {
    return a2;
  }
}

- (BOOL)inExpandingToProposedDisplayModeCallback
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 5) & 1;
}

- (void)updatePanelControllerForViewControllerChangeInColumn:(int64_t)a3
{
}

- (void)updatePanelControllerForViewControllerChangeInColumn:(int64_t)a3 alwaysAnimate:(BOOL)a4
{
}

void __131__UISplitViewControllerPanelImpl_updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack___block_invoke(void *a1)
{
  uint64_t v5 = (void *)a1[4];
  id v16 = [*(id *)(a1[5] + 8) objectForKeyedSubscript:&unk_1ED3F3A08];
  uint64_t v6 = [v16 navigationControllerWrapper];
  double v7 = (void *)v6;
  if (v6)
  {
    int v8 = 0;
    double v9 = (void *)v6;
  }
  else
  {
    v1 = [*(id *)(a1[5] + 8) objectForKeyedSubscript:&unk_1ED3F3A08];
    uint64_t v10 = [v1 navigationController];
    id v2 = (void *)v10;
    if (v10)
    {
      int v8 = 0;
      double v9 = (void *)v10;
    }
    else
    {
      uint64_t v3 = [*(id *)(a1[5] + 8) objectForKeyedSubscript:&unk_1ED3F3A08];
      double v9 = [v3 viewController];
      int v8 = 1;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 16));
  double v12 = [v5 _separateViewControllersAfterAndIncludingViewController:v9 forSplitViewController:WeakRetained];
  uint64_t v13 = [v12 firstObject];
  uint64_t v14 = *(void *)(a1[6] + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  if (v8)
  {
  }
  if (!v7)
  {
  }
}

uint64_t __131__UISplitViewControllerPanelImpl_updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 40) animated:0];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "pushViewController:animated:");
  }
  return result;
}

uint64_t __131__UISplitViewControllerPanelImpl_updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = +[UIView _isInAnimationBlockWithAnimationsEnabled]|| *(unsigned char *)(a1 + 48) != 0;
  return [v2 pushViewController:v3 animated:v4];
}

uint64_t __131__UISplitViewControllerPanelImpl_updatePanelControllerForViewControllerChangeInColumn_alwaysAnimate_shouldUpdateCollapsedNavStack___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = +[UIView _isInAnimationBlockWithAnimationsEnabled]|| *(unsigned char *)(a1 + 48) != 0;
  return [v2 setViewControllers:v3 animated:v4];
}

- (void)toggleMasterVisible:(id)a3
{
  id v4 = a3;
  if (dyld_program_sdk_at_least()) {
    [(UISplitViewControllerPanelImpl *)self _triggerDisplayModeAction:v4];
  }
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v9 = [(UIPanelController *)self->_panelController supportsColumnStyle];
  uint64_t v10 = [(UIPanelController *)self->_panelController currentState];
  if ([v10 isCollapsed]) {
    goto LABEL_2;
  }
  double v13 = 0.0;
  if (v9)
  {
    uint64_t v14 = [(UISplitViewControllerPanelImpl *)self panelController];
    id v15 = [v14 configuration];
    [v15 rubberBandExtension];
    double v13 = v16;
  }
  double v17 = [(UISplitViewControllerPanelImpl *)self panelController];
  id v18 = [v17 leadingViewController];

  if (v18 == v7)
  {
    [v10 leadingWidth];
    double v26 = v25;
    if (v25 <= 0.0)
    {
      id v27 = [(UISplitViewControllerPanelImpl *)self panelController];
      uint64_t v28 = [v27 possibleStates];
      int64_t v29 = v28;
      int v30 = 1;
LABEL_16:
      double v26 = minNonzeroPrimaryWidthInStates(v28, v30);
    }
LABEL_17:
    double width = v13 + v26;
    goto LABEL_18;
  }
  uint64_t v19 = [(UISplitViewControllerPanelImpl *)self panelController];
  id v20 = [v19 trailingViewController];

  if (v20 == v7)
  {
    [v10 trailingWidth];
    double v26 = v31;
    if (v31 <= 0.0)
    {
      id v27 = [(UISplitViewControllerPanelImpl *)self panelController];
      uint64_t v28 = [v27 possibleStates];
      int64_t v29 = v28;
      int v30 = 0;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v9
    && ([(UIPanelController *)self->_panelController supplementaryViewController],
        id v21 = (id)objc_claimAutoreleasedReturnValue(),
        v21,
        v21 == v7))
  {
    [v10 supplementaryWidth];
    double MatchingState = v39;
    if (v39 <= 0.0)
    {
      int v41 = [(UISplitViewControllerPanelImpl *)self panelController];
      uint64_t v42 = [v41 possibleStates];

      LODWORD(v41) = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
      double v43 = minNonzeroPrimaryWidthInStates(v42, (int)v41);
      double MatchingState = minNonzeroSupplementaryWidthInStateWithPrimaryWidthGetMatchingState(v42, (int)v41, 0, v43);
    }
    uint64_t v44 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

    double v45 = -0.0;
    if (!v44) {
      double v45 = v13;
    }
    double width = MatchingState + v45;
  }
  else
  {
    uint64_t v22 = [(UIPanelController *)self->_panelController mainViewController];
    if ((id)v22 == v7)
    {
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = [(UIPanelController *)self->_panelController preservedDetailController];

      if (v24 != v7)
      {
LABEL_2:
        objc_msgSend(WeakRetained, "_super_sizeForChildContentContainer:withParentContainerSize:", v7, width, height);
        double width = v11;
        double height = v12;
        goto LABEL_18;
      }
    }
    id v34 = [WeakRetained traitCollection];
    [v34 displayScale];
    if (v35 == 0.0)
    {
      double v36 = +[UIScreen mainScreen];
      [v36 scale];
      double v38 = v37;
    }
    else
    {
      double v38 = v35;
    }

    if (([v10 leadingOverlapsMain] & 1) == 0)
    {
      [v10 leadingWidth];
      if (v46 > 0.0)
      {
        [v10 leadingWidth];
        double v48 = width - v47;
        uint64_t v49 = [v10 configuration];
        [v49 leadingBorderWidthForScale:v38];
        double width = v48 - v50;
      }
    }
    if (([v10 trailingOverlapsMain] & 1) == 0)
    {
      [v10 trailingWidth];
      if (v51 > 0.0)
      {
        [v10 trailingWidth];
        double v53 = width - v52;
        id v54 = [v10 configuration];
        [v54 trailingBorderWidthForScale:v38];
        double width = v53 - v55;
      }
    }
    if (([v10 supplementaryOverlapsMain] & 1) == 0)
    {
      [v10 supplementaryWidth];
      if (v56 > 0.0)
      {
        [v10 supplementaryWidth];
        double v58 = width - v57;
        BOOL v59 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
        char v60 = [v10 configuration];
        __int16 v61 = v60;
        if (v59) {
          [v60 leadingBorderWidthForScale:v38];
        }
        else {
          [v60 trailingBorderWidthForScale:v38];
        }
        double v63 = v62;

        double width = v58 - v63;
      }
    }
  }
LABEL_18:

  double v32 = width;
  double v33 = height;
  result.double height = v33;
  result.double width = v32;
  return result;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v10 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v11 = [WeakRetained _existingView];
  double v12 = &xmmword_186B92000;
  if (v11)
  {
    double v13 = (void *)v11;
    uint64_t v14 = [WeakRetained traitCollection];
    uint64_t v15 = [v14 horizontalSizeClass];
    uint64_t v16 = [v7 horizontalSizeClass];

    BOOL v17 = v15 == v16;
    double v12 = &xmmword_186B92000;
    if (!v17)
    {
      objc_storeStrong((id *)&self->_transitioningToTraitCollection, a3);
      id v18 = [WeakRetained _window];
      uint64_t v19 = [v18 firstResponder];

      uint64_t v20 = [WeakRetained detailViewController];
      id v21 = (void *)v20;
      if (v20) {
        uint64_t v22 = (void *)v20;
      }
      else {
        uint64_t v22 = WeakRetained;
      }
      id v23 = v22;

      if (![v23 _containsResponder:v19]) {
        goto LABEL_13;
      }
      if (objc_opt_respondsToSelector())
      {
        int64_t v24 = [(UISplitViewControllerPanelImpl *)self style];
        if (v24)
        {
          unint64_t v25 = v24;
          double v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &willTransitionToTraitCollection_withTransitionCoordinator____s_category)+ 8);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            id v27 = v26;
            uint64_t v28 = NSStringFromSelector(sel__splitViewControllerShouldRestoreResponderAfterTraitCollectionTransition_);
            int64_t v29 = _UISplitViewControllerStyleDescription(v25);
            *(_DWORD *)long long buf = 138543618;
            char v60 = v28;
            __int16 v61 = 2114;
            double v62 = v29;
            _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", buf, 0x16u);
          }
        }
        else if (![v10 _splitViewControllerShouldRestoreResponderAfterTraitCollectionTransition:WeakRetained])
        {
LABEL_13:
          v56[0] = MEMORY[0x1E4F143A8];
          double v12 = &xmmword_186B92000;
          v56[1] = 3221225472;
          v56[2] = __92__UISplitViewControllerPanelImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
          v56[3] = &unk_1E52E7BF8;
          v56[4] = self;
          id v57 = v7;
          id v58 = WeakRetained;
          [v8 animateAlongsideTransition:0 completion:v56];

          goto LABEL_14;
        }
      }
      objc_storeStrong((id *)&self->_postTransitionResponder, v19);
      *(void *)&self->_flags &= 0xFFFFFFFFFFFFF3FFLL;
      int v30 = [WeakRetained _window];
      [v30 _setIsSettingFirstResponder:1];

      goto LABEL_13;
    }
  }
LABEL_14:
  if (dyld_program_sdk_at_least())
  {
    if ([(UISplitViewControllerPanelImpl *)self style])
    {
      if (self->_suspendedState == 2)
      {
        double v31 = [(UISplitViewControllerPanelImpl *)self panelController];
        double v32 = [v31 collapsedViewController];

        if (v32)
        {
          int64_t v33 = [(UISplitViewControllerPanelImpl *)self style];
          unint64_t v34 = v33;
          if ((unint64_t)(v33 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            double v35 = [MEMORY[0x1E4F28B00] currentHandler];
            double v51 = _UISplitViewControllerStyleDescription(v34);
            [v35 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 3329, @"Incorrect code path for UISplitViewControllerStyle %@", v51 object file lineNumber description];

            BOOL v36 = 0;
          }
          else
          {
            if (v33 != 2)
            {
              BOOL v36 = 0;
LABEL_23:
              perColumnViewControllers = self->_perColumnViewControllers;
              double v38 = [NSNumber numberWithInteger:v36];
              double v39 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:v38];
              id v40 = [v39 navigationController];

              int v41 = [(UISplitViewControllerPanelImpl *)self panelController];
              uint64_t v42 = [v41 collapsedViewController];

              if (v42 != v40)
              {
LABEL_32:

                goto LABEL_33;
              }
              double v43 = [v40 _nestedTopViewController];
              uint64_t v44 = [(UISplitViewControllerPanelImpl *)self viewControllerForColumn:0];

              if (v43 == v44)
              {
                int64_t v47 = 3;
              }
              else
              {
                double v45 = [(UISplitViewControllerPanelImpl *)self viewControllerForColumn:1];

                if (v43 == v45)
                {
                  int64_t v47 = 5;
                }
                else
                {
                  double v46 = [(UISplitViewControllerPanelImpl *)self viewControllerForColumn:2];

                  if (v43 != v46)
                  {
LABEL_31:

                    goto LABEL_32;
                  }
                  int64_t v47 = 4;
                }
              }
              self->_int64_t suspendedState = v47;
              goto LABEL_31;
            }
            double v35 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
            BOOL v36 = v35 == 0;
          }

          goto LABEL_23;
        }
      }
    }
  }
LABEL_33:
  double v48 = [(UISplitViewControllerPanelImpl *)self panelController];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = *((void *)v12 + 137);
  v53[2] = __92__UISplitViewControllerPanelImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_2;
  v53[3] = &unk_1E52DCB30;
  v53[4] = self;
  id v54 = v7;
  id v55 = v8;
  id v49 = v8;
  id v50 = v7;
  [v48 willTransitionToTraitCollection:v50 withTransitionCoordinator:v49 superBlock:v53];
}

void __92__UISplitViewControllerPanelImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(id *a1)
{
  id v2 = a1[4];
  uint64_t v3 = (void *)v2[18];
  v2[18] = 0;

  *((_DWORD *)a1[4] + 38) = 0;
  if ([a1[5] horizontalSizeClass] != 1)
  {
    id v4 = [a1[4] panelController];
    [v4 setPreservedDetailController:0];
  }
  uint64_t v5 = a1[4];
  uint64_t v6 = (void *)v5[29];
  if (v6)
  {
    if ((*((unsigned char *)v5 + 289) & 4) == 0)
    {
      char v7 = objc_msgSend(a1[6], "_containsResponder:");
      id v8 = a1[4];
      if (v7)
      {
        BOOL v9 = (void *)v8[29];
        if ((*((unsigned char *)v8 + 289) & 8) != 0)
        {
          [v9 becomeFirstResponder];
          id v10 = 0;
        }
        else
        {
          id v10 = v9;
          uint64_t v11 = [a1[6] _window];
          [v11 _setFirstResponder:*((void *)a1[4] + 29)];
        }
        id v36 = 0;
LABEL_13:
        double v12 = a1[4];
        double v13 = (void *)v12[29];
        v12[29] = 0;

        *((void *)a1[4] + 36) &= ~0x400uLL;
        *((void *)a1[4] + 36) &= ~0x800uLL;
        if (v36)
        {
          [v36 _finishResignFirstResponder];
          uint64_t v14 = [v36 _window];
          if (!v14)
          {
            id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 2);
            double v26 = [WeakRetained _window];
            id v27 = [v26 windowScene];
            uint64_t v28 = [v27 keyboardSceneDelegate];
            id v29 = [v28 responder];

            if (v29 != v36) {
              goto LABEL_21;
            }
            id v32 = objc_loadWeakRetained((id *)a1[4] + 2);
            int64_t v33 = [v32 _window];
            unint64_t v34 = [v33 windowScene];
            uint64_t v14 = [v34 keyboardSceneDelegate];

            uint64_t v35 = [v14 automaticAppearanceInternalEnabled];
            [v14 setAutomaticAppearanceInternalEnabled:1];
            [v14 _reloadInputViewsForResponder:0];
            [v14 setAutomaticAppearanceInternalEnabled:v35];
          }
        }
        else
        {
          if (!v10) {
            goto LABEL_21;
          }
          uint64_t v15 = [v10 _window];
          if (!v15) {
            goto LABEL_21;
          }
          uint64_t v16 = (void *)v15;
          id v17 = objc_loadWeakRetained((id *)a1[4] + 2);
          id v18 = [v17 _window];
          uint64_t v19 = [v18 windowScene];
          uint64_t v20 = [v19 keyboardSceneDelegate];
          id v21 = [v20 responder];

          if (v21)
          {
LABEL_21:
            id v30 = objc_loadWeakRetained((id *)a1[4] + 2);
            double v31 = [v30 _window];
            [v31 _setIsSettingFirstResponder:0];

            return;
          }
          uint64_t v14 = objc_loadWeakRetained((id *)a1[4] + 2);
          uint64_t v22 = [v14 _window];
          id v23 = [v22 windowScene];
          int64_t v24 = [v23 keyboardSceneDelegate];
          [v24 _reloadInputViewsForResponder:v10];
        }
        goto LABEL_21;
      }
      uint64_t v6 = (void *)v8[29];
    }
    id v36 = v6;
    id v10 = 0;
    goto LABEL_13;
  }
}

void __92__UISplitViewControllerPanelImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  objc_msgSend(WeakRetained, "_super_willTransitionToTraitCollection:withTransitionCoordinator:", a1[5], a1[6]);
}

- (int64_t)_svcOrientation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v3 = [WeakRetained _window];
  id v4 = [v3 windowScene];
  int64_t v5 = [v4 interfaceOrientation];

  return v5;
}

- (int64_t)_svcViewWindowOrientation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v3 = [WeakRetained view];
  id v4 = [v3 window];
  int64_t v5 = [v4 windowScene];
  int64_t v6 = [v5 interfaceOrientation];

  return v6;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int64_t v9 = [(UISplitViewControllerPanelImpl *)self _svcOrientation];
  int64_t v10 = v9;
  unint64_t v11 = v9 - 1;
  switch(v9)
  {
    case 1:
      double v12 = 0.0;
      break;
    case 3:
      double v12 = 1.57079633;
      break;
    case 4:
      double v12 = -1.57079633;
      break;
    default:
      double v12 = 3.14159265;
      if (v9 != 2) {
        double v12 = 0.0;
      }
      break;
  }
  CGAffineTransformMakeRotation(&t1, v12);
  if (v7) {
    [v7 targetTransform];
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  CGAffineTransformConcat(&v43, &t1, &t2);
  uint64_t v13 = 0;
  float64x2_t v31 = vrndaq_f64(*(float64x2_t *)&v43.c);
  float64x2_t v32 = vrndaq_f64(*(float64x2_t *)&v43.a);
  float64x2_t v30 = vrndaq_f64(*(float64x2_t *)&v43.tx);
  while (1)
  {
    *(float64x2_t *)&v46.a = v32;
    *(float64x2_t *)&v46.c = v31;
    CGFloat v14 = 3.14159265;
    *(float64x2_t *)&v46.tx = v30;
    if (v13 <= 2) {
      CGFloat v14 = dbl_186B94608[v13];
    }
    CGAffineTransformMakeRotation(&v44, v14);
    *(float64x2_t *)&v44.a = vrndaq_f64(*(float64x2_t *)&v44.a);
    *(float64x2_t *)&v44.c = vrndaq_f64(*(float64x2_t *)&v44.c);
    *(float64x2_t *)&v44.tx = vrndaq_f64(*(float64x2_t *)&v44.tx);
    CGAffineTransform v45 = v44;
    if (CGAffineTransformEqualToTransform(&v46, &v45)) {
      break;
    }
    if (++v13 == 4)
    {
      int64_t v15 = 0;
      goto LABEL_19;
    }
  }
  int64_t v15 = qword_186B945E8[v13];
LABEL_19:
  if (self->_transitioningToTraitCollection) {
    goto LABEL_29;
  }
  uint64_t v16 = [WeakRetained _existingView];
  [v16 bounds];
  if (width != v18 || height != v17) {
    goto LABEL_28;
  }
  if (v11 > 1)
  {
    if ((unint64_t)(v10 - 3) < 2)
    {

      if ((unint64_t)(v15 - 3) <= 1) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
LABEL_28:

    goto LABEL_29;
  }

  if ((unint64_t)(v15 - 1) < 2) {
    goto LABEL_30;
  }
LABEL_29:
  if (_os_feature_enabled_impl())
  {
LABEL_30:
    objc_msgSend(WeakRetained, "_super_viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height, *(_OWORD *)&v30, *(_OWORD *)&v31);
    goto LABEL_55;
  }
  int64_t v33 = v15;
  uint64_t v19 = [WeakRetained traitCollection];
  id v20 = objc_loadWeakRetained((id *)&self->_svc);
  id v21 = [v20 _existingView];
  uint64_t v22 = [v21 window];
  id v23 = [v22 windowScene];
  int64_t v24 = [v23 _effectiveUISettings];
  char v25 = [v24 inLiveResize];

  if ((v25 & 1) == 0
    && [v19 userInterfaceIdiom] == 1
    && [(UITraitCollection *)self->_transitioningToTraitCollection horizontalSizeClass] != UIUserInterfaceSizeClassCompact)
  {
    if ([(UISplitViewControllerPanelImpl *)self style])
    {
      if ([(UISplitViewControllerPanelImpl *)self userGeneratedDisplayMode])
      {
        int64_t v27 = [(UISplitViewControllerPanelImpl *)self userGeneratedDisplayMode];
        if (v27 != [(UISplitViewControllerPanelImpl *)self preferredDisplayMode]) {
          [(UISplitViewControllerPanelImpl *)self setUserGeneratedDisplayMode:0];
        }
      }
    }
    else if ([WeakRetained preferredDisplayMode] != 2)
    {
      [(UISplitViewControllerPanelImpl *)self _setPrimaryHidingState:0];
    }
  }
  if (!objc_msgSend(v19, "userInterfaceIdiom", *(_OWORD *)&v30, *(_OWORD *)&v31)
    && [(UISplitViewControllerPanelImpl *)self _iPhoneShouldUseOverlayInCurrentEnvironment]&& (*(unsigned char *)&self->_transitioningFlags & 1) != 0)
  {
    if ([(UISplitViewControllerPanelImpl *)self style])
    {
      if ((*(unsigned char *)&self->_transitioningFlags & 2) != 0) {
        uint64_t v26 = 3;
      }
      else {
        uint64_t v26 = 1;
      }
      [(UISplitViewControllerPanelImpl *)self setUserGeneratedDisplayMode:v26];
    }
    else
    {
      if ((*(unsigned char *)&self->_transitioningFlags & 2) != 0) {
        uint64_t v28 = 2;
      }
      else {
        uint64_t v28 = 1;
      }
      [(UISplitViewControllerPanelImpl *)self _setPrimaryHidingState:v28];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    void v39[4] = self;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __85__UISplitViewControllerPanelImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    void v40[3] = &unk_1E52DA598;
    v40[4] = self;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __85__UISplitViewControllerPanelImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v39[3] = &unk_1E52DA598;
    [v7 _animateAlongsideTransitionInView:0 systemAnimation:1 systemCompletion:1 animation:v40 completion:v39];
  }
  *(void *)&self->_flags |= 0x100uLL;
  self->_transitioningToSize.double width = width;
  self->_transitioningToSize.double height = height;
  self->_transitioningToOrientation = v33;
  id v29 = [(UISplitViewControllerPanelImpl *)self panelController];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __85__UISplitViewControllerPanelImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v34[3] = &unk_1E52E05A8;
  id v35 = WeakRetained;
  double v37 = width;
  double v38 = height;
  id v36 = v7;
  objc_msgSend(v29, "viewWillTransitionToSize:withTransitionCoordinator:superBlock:", v36, v34, width, height);

  *(void *)&self->_flags &= ~0x100uLL;
  self->_transitioningToSize = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_transitioningToOrientation = 0;

LABEL_55:
}

uint64_t __85__UISplitViewControllerPanelImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pushOverrideOfReportedDisplayMode:*(void *)(*(void *)(a1 + 32) + 96)];
}

uint64_t __85__UISplitViewControllerPanelImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _popOverrideOfReportedDisplayMode];
}

uint64_t __85__UISplitViewControllerPanelImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_super_viewWillTransitionToSize:withTransitionCoordinator:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v5 preferredContentSizeDidChangeForChildContentContainer:v4];
}

- (id)_orderedPreferredFocusedViewControllers
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UISplitViewControllerPanelImpl *)self viewControllers];
  if (!dyld_program_sdk_at_least() || ![v3 count])
  {
    id v6 = v3;
    goto LABEL_10;
  }
  if (![(UISplitViewControllerPanelImpl *)self style])
  {
    id v8 = objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    int64_t v9 = [v3 firstObject];
    id v6 = [v8 arrayByAddingObject:v9];

    goto LABEL_32;
  }
  if ([(UISplitViewControllerPanelImpl *)self isCollapsed])
  {
    id WeakRetained = [(UISplitViewControllerPanelImpl *)self viewControllerForColumn:3];
    if (WeakRetained
      || ([(UIPanelController *)self->_panelController collapsedViewController],
          (id WeakRetained = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v17[0] = WeakRetained;
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        int64_t v15 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)uint64_t v16 = 0;
          _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "Unable to get collapsedViewController while in collapsed state.", v16, 2u);
        }
      }
      else
      {
        CGFloat v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_orderedPreferredFocusedViewControllers___s_category)+ 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v16 = 0;
          _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Unable to get collapsedViewController while in collapsed state.", v16, 2u);
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      uint64_t v5 = [WeakRetained viewControllers];
    }
    id v6 = (id)v5;

    goto LABEL_10;
  }
  id v6 = [MEMORY[0x1E4F1CA48] array];
  if (![(UIPanelController *)self->_panelController isAnimating])
  {
    if ((_UISplitViewControllerColumnIsHiddenOrDimmedForDisplayMode([(UISplitViewControllerPanelImpl *)self style], 2, [(UISplitViewControllerPanelImpl *)self displayMode]) & 1) == 0)
    {
      double v12 = [(UISplitViewControllerPanelImpl *)self viewControllerForColumn:2];
      if (v12) {
        [v6 addObject:v12];
      }
    }
    if ((_UISplitViewControllerColumnIsHiddenOrDimmedForDisplayMode([(UISplitViewControllerPanelImpl *)self style], 0, [(UISplitViewControllerPanelImpl *)self displayMode]) & 1) == 0)
    {
      uint64_t v13 = [(UISplitViewControllerPanelImpl *)self viewControllerForColumn:0];
      if (v13) {
        [v6 addObject:v13];
      }
    }
    if (_UISplitViewControllerColumnIsHiddenOrDimmedForDisplayMode([(UISplitViewControllerPanelImpl *)self style], 1, [(UISplitViewControllerPanelImpl *)self displayMode]))goto LABEL_10; {
    id v8 = [(UISplitViewControllerPanelImpl *)self viewControllerForColumn:1];
    }
    if (v8) {
      goto LABEL_31;
    }
LABEL_32:

    goto LABEL_10;
  }
  if ([(UIPanelController *)self->_panelController isTrailingViewControllerVisibleAfterAnimation])
  {
    int64_t v10 = [(UIPanelController *)self->_panelController trailingViewController];
    [v6 addObject:v10];
  }
  if ([(UIPanelController *)self->_panelController isLeadingViewControllerVisibleAfterAnimation])
  {
    unint64_t v11 = [(UIPanelController *)self->_panelController leadingViewController];
    [v6 addObject:v11];
  }
  if ([(UIPanelController *)self->_panelController isSupplementaryViewControllerVisibleAfterAnimation])
  {
    id v8 = [(UIPanelController *)self->_panelController supplementaryViewController];
LABEL_31:
    [v6 addObject:v8];
    goto LABEL_32;
  }
LABEL_10:

  return v6;
}

- (id)preferredFocusedView
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UISplitViewControllerPanelImpl *)self _orderedPreferredFocusedViewControllers];
  int64_t v4 = [(UISplitViewControllerPanelImpl *)self _lastFocusedChildViewControllerColumn];
  if (v4 == 999) {
    goto LABEL_14;
  }
  unint64_t v5 = v4;
  if (![(UISplitViewControllerPanelImpl *)self style])
  {
    id v7 = [(UISplitViewControllerPanelImpl *)self viewControllers];
    if (v5 >= [v7 count])
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [v7 objectAtIndexedSubscript:v5];
    }

    if (!v6) {
      goto LABEL_13;
    }
LABEL_9:
    if ([v3 containsObject:v6])
    {
      id v8 = [v6 preferredFocusedView];

      if (v8 && (-[UIView _containsPreferredFocusableView](v8) & 1) != 0) {
        goto LABEL_27;
      }
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  id v6 = -[UISplitViewControllerPanelImpl _topLevelViewControllerForColumn:]((uint64_t)self, v5);
  if (v6) {
    goto LABEL_9;
  }
LABEL_13:

LABEL_14:
  id v8 = 0;
LABEL_15:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id WeakRetained = v3;
  uint64_t v10 = [WeakRetained countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
LABEL_17:
    uint64_t v13 = 0;
    CGFloat v14 = v8;
    while (1)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(WeakRetained);
      }
      id v8 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "preferredFocusedView", (void)v16);

      if (v8)
      {
        if (-[UIView _containsPreferredFocusableView](v8)) {
          break;
        }
      }
      ++v13;
      CGFloat v14 = v8;
      if (v11 == v13)
      {
        uint64_t v11 = [WeakRetained countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          goto LABEL_17;
        }
        goto LABEL_24;
      }
    }
  }
  else
  {
LABEL_24:

    if (v8) {
      goto LABEL_27;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    id v8 = objc_msgSend(WeakRetained, "_super_preferredFocusedView");
  }

LABEL_27:
  return v8;
}

- (id)_topLevelViewControllerForColumn:(uint64_t)a1
{
  if (a1)
  {
    int64_t v4 = *(void **)(a1 + 8);
    unint64_t v5 = [NSNumber numberWithInteger:a2];
    id v6 = [v4 objectForKeyedSubscript:v5];
    id v7 = [v6 navigationControllerWrapper];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      uint64_t v10 = *(void **)(a1 + 8);
      uint64_t v11 = [NSNumber numberWithInteger:a2];
      uint64_t v12 = [v10 objectForKeyedSubscript:v11];
      uint64_t v13 = [v12 navigationController];
      CGFloat v14 = v13;
      if (v13)
      {
        id v9 = v13;
      }
      else
      {
        int64_t v15 = *(void **)(a1 + 8);
        long long v16 = [NSNumber numberWithInteger:a2];
        long long v17 = [v15 objectForKeyedSubscript:v16];
        id v9 = [v17 viewController];
      }
    }
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)preferredFocusEnvironments
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UISplitViewControllerPanelImpl *)self _orderedPreferredFocusedViewControllers];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v5 = [(UISplitViewControllerPanelImpl *)self _lastFocusedChildViewControllerColumn];
  if (v5 != 999)
  {
    unint64_t v6 = v5;
    if ([(UISplitViewControllerPanelImpl *)self style])
    {
      id v7 = -[UISplitViewControllerPanelImpl _topLevelViewControllerForColumn:]((uint64_t)self, v6);
      if (!v7)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      id v8 = [(UISplitViewControllerPanelImpl *)self viewControllers];
      if (v6 >= [v8 count])
      {
        id v7 = 0;
      }
      else
      {
        id v7 = [v8 objectAtIndexedSubscript:v6];
      }

      if (!v7) {
        goto LABEL_11;
      }
    }
    if ([v3 containsObject:v7]) {
      [v4 addObject:v7];
    }
    goto LABEL_11;
  }
LABEL_12:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v14, (void)v21) & 1) == 0) {
          [v4 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)p_svc);
  long long v17 = objc_msgSend(WeakRetained, "_super_preferredFocusEnvironments");
  [v4 addObjectsFromArray:v17];

  id v18 = objc_loadWeakRetained((id *)p_svc);
  long long v19 = _UIFocusEnvironmentCombinedPreferredFocusEnvironments(v18, v4, [v18 _subclassPreferredFocusedViewPrioritizationType]);

  return v19;
}

- (id)_overridingPreferredFocusEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v4 = objc_msgSend(WeakRetained, "_super_overridingPreferredFocusEnvironment");

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    unint64_t v6 = [(UISplitViewControllerPanelImpl *)self _orderedPreferredFocusedViewControllers];
    if ([v6 count] == 1)
    {
      id v5 = [v6 firstObject];
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  p_svc = &self->_svc;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_svc);
  char v6 = objc_msgSend(WeakRetained, "_super_shouldUpdateFocusInContext:", v4);

  return v6;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v5 = objc_msgSend(WeakRetained, "childViewControllers", 0);

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    int v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v9 &= [*(id *)(*((void *)&v12 + 1) + 8 * i) shouldAutorotateToInterfaceOrientation:a3];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int64_t v3 = objc_msgSend(WeakRetained, "_super_preferredInterfaceOrientationForPresentation");

  return v3;
}

- (void)unloadViewForced:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int64_t v3 = [(UISplitViewControllerPanelImpl *)self panelController];
  id v4 = [v3 allViewControllers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) unloadViewIfReloadable];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v21 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_super_didUpdateFocusInContext:", v21);

  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    uint64_t v5 = [v21 nextFocusedView];

    if (!v5) {
      goto LABEL_13;
    }
    uint64_t v6 = [v21 nextFocusedView];
    self->_lastFocusedChildViewControllerColumn = [(UISplitViewControllerPanelImpl *)self _columnForView:v6 getIsContent:0];
  }
  else
  {
    uint64_t v6 = [(UISplitViewControllerPanelImpl *)self viewControllers];
    uint64_t v7 = [v21 nextFocusedView];
    uint64_t v8 = [v7 _viewControllerForAncestor];

    if (v8)
    {
      while (1)
      {
        int64_t v9 = [v6 indexOfObject:v8];
        if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        long long v10 = [v8 parentViewController];
        long long v11 = v10;
        if (v10)
        {
          id v12 = v10;
        }
        else
        {
          id v12 = [v8 presentingViewController];
        }
        id v13 = v12;

        uint64_t v8 = v13;
        if (!v13) {
          goto LABEL_12;
        }
      }
      self->_lastFocusedChildViewControllerColumn = v9;
    }
  }
LABEL_12:

LABEL_13:
  id v14 = objc_loadWeakRetained((id *)&self->_svc);
  long long v15 = [v14 view];
  uint64_t v16 = [v15 effectiveUserInterfaceLayoutDirection];

  uint64_t v17 = [v21 _focusMovement];
  if ([v17 _inputType] == 4)
  {
    if (v16) {
      uint64_t v18 = 8;
    }
    else {
      uint64_t v18 = 4;
    }
    uint64_t v19 = [v21 focusHeading];

    id v20 = v21;
    if (v19 == v18) {
      *(void *)&self->_flags |= 0x80000000000uLL;
    }
  }
  else
  {

    id v20 = v21;
  }
}

- (id)_multitaskingDragExclusionRects
{
  id v2 = [(UISplitViewControllerPanelImpl *)self panelController];
  int64_t v3 = [v2 gatherMultitaskingDragExclusionRectsFromVisibleColumns];

  return v3;
}

- (BOOL)_hasPreferredInterfaceOrientationForPresentation
{
  if (dyld_program_sdk_at_least())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    id v4 = [WeakRetained delegate];
    char v5 = objc_opt_respondsToSelector();
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (CGRect)_frameForChildContentContainer:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  char v5 = [(UISplitViewControllerPanelImpl *)self panelController];
  id WeakRetained = [v5 allViewControllers];

  uint64_t v7 = [WeakRetained countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(WeakRetained);
        }
        if (*(id *)(*((void *)&v24 + 1) + 8 * v10) == v4)
        {
          long long v11 = [v4 view];
          [v11 frame];
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [WeakRetained countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  long long v11 = [WeakRetained view];
  [v11 bounds];
LABEL_11:
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;

  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)_shouldPersistViewWhenCoding
{
  return 0;
}

- (BOOL)_optsOutOfPopoverControllerHierarchyCheck
{
  return 0;
}

- (UIEdgeInsets)_tvOSColumnStyleExtraInsetsForChildViewController:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)_unspecifiedStyleChildViewControllersToSendViewWillTransitionToSize
{
  if (self->_lastNotifiedIsCollapsed)
  {
    double v3 = [MEMORY[0x1E4F1CA48] array];
    double v4 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];
    if (v4) {
      [v3 addObject:v4];
    }
    double v5 = [(UISplitViewControllerPanelImpl *)self panelController];
    uint64_t v6 = [v5 mainViewController];
    if (v6)
    {
      id WeakRetained = (void *)v6;
    }
    else
    {
      uint64_t v8 = [(UISplitViewControllerPanelImpl *)self panelController];
      id WeakRetained = [v8 preservedDetailController];

      if (!WeakRetained) {
        goto LABEL_10;
      }
    }
    [v3 addObject:WeakRetained];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    double v3 = objc_msgSend(WeakRetained, "_super_childViewControllersToSendViewWillTransitionToSize");
  }

LABEL_10:
  return v3;
}

- (id)_childViewControllersToSendViewWillTransitionToSize
{
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    if (self->_lastNotifiedIsCollapsed
      && (-[NSMutableDictionary objectForKeyedSubscript:](self->_perColumnViewControllers, "objectForKeyedSubscript:", &unk_1ED3F3A38), double v3 = objc_claimAutoreleasedReturnValue(), [v3 viewController], v4 = objc_claimAutoreleasedReturnValue(), v4, v3, !v4))
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      double v12 = __85__UISplitViewControllerPanelImpl__childViewControllersToSendViewWillTransitionToSize__block_invoke;
      double v13 = &unk_1E52E6608;
      double v14 = self;
      id v8 = v7;
      id v15 = v8;
      __85__UISplitViewControllerPanelImpl__childViewControllersToSendViewWillTransitionToSize__block_invoke((uint64_t)v11, 0);
      v12((uint64_t)v11, 1);
      v12((uint64_t)v11, 2);
      uint64_t v9 = v15;
      id v6 = v8;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(WeakRetained, "_super_childViewControllersToSendViewWillTransitionToSize");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v6 = [(UISplitViewControllerPanelImpl *)self _unspecifiedStyleChildViewControllersToSendViewWillTransitionToSize];
  }
  return v6;
}

void __85__UISplitViewControllerPanelImpl__childViewControllersToSendViewWillTransitionToSize__block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = *(void **)(*(void *)(a1 + 32) + 8);
  double v4 = [NSNumber numberWithInteger:a2];
  id v7 = [v3 objectForKeyedSubscript:v4];

  double v5 = v7;
  if (v7)
  {
    id v6 = [v7 navigationControllerWrapper];
    if (v6
      || ([v7 navigationController], (id v6 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([v7 viewController], id v6 = objc_claimAutoreleasedReturnValue(), v5 = v7, v6))
    {
      [*(id *)(a1 + 40) addObject:v6];

      double v5 = v7;
    }
  }
}

- (BOOL)_handlesCounterRotationForPresentation
{
  return 0;
}

- (id)_primaryContentResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  double v3 = [WeakRetained detailViewController];

  return v3;
}

- (void)_setAllowsDimmedSecondaryAsDeepestUnambiguousResponder:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)_allowsDimmedSecondaryAsDeepestUnambiguousResponder
{
  return *((unsigned char *)&self->_flags + 3) & 1;
}

- (void)_setIgnoresSheetContext:(BOOL)a3
{
  if (((((*(void *)&self->_flags & 0x2000000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v3 = 0x2000000;
    if (!a3) {
      uint64_t v3 = 0;
    }
    self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v3);
    [(UIPanelController *)self->_panelController setNeedsUpdate];
  }
}

- (BOOL)_ignoresSheetContext
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 1) & 1;
}

- (id)_deepestActionResponder
{
  uint64_t v3 = [(UISplitViewControllerPanelImpl *)self style];
  double v4 = [(UIPanelController *)self->_panelController currentState];
  uint64_t v5 = [v4 _collapsedState];
  if (!v3)
  {
    id v8 = [(UISplitViewControllerPanelImpl *)self viewControllers];
    uint64_t v9 = [v8 lastObject];

    if ([v9 _hasDeepestActionResponder])
    {
LABEL_26:
      double v14 = [v9 _deepestActionResponder];
      goto LABEL_29;
    }
    if (![(UISplitViewControllerPanelImpl *)self isCollapsed])
    {
      uint64_t v10 = [(UISplitViewControllerPanelImpl *)self viewControllers];
      id WeakRetained = [v10 firstObject];

      if (WeakRetained != v9 && ([WeakRetained _hasDeepestActionResponder] & 1) != 0)
      {
        uint64_t v12 = [WeakRetained _deepestActionResponder];
        goto LABEL_28;
      }
    }
LABEL_24:
    uint64_t v9 = 0;
    goto LABEL_25;
  }
  if (v5 != 2)
  {
    if (!v5)
    {
      int64_t v6 = [(UISplitViewControllerPanelImpl *)self _displayModeForState:v4];
      if (*((unsigned char *)&self->_flags + 3))
      {
        uint64_t VisibleColumnForResponderAfterColumn = 2;
        if (_UISplitViewControllerColumnIsVisibleForDisplayMode(v3, 2, v6)) {
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t VisibleColumnForResponderAfterColumn = 2;
        if (!_UISplitViewControllerColumnIsHiddenOrDimmedForDisplayMode(v3, 2, v6))
        {
LABEL_15:
          double v13 = 0;
          while (([v13 _hasDeepestActionResponder] & 1) == 0)
          {
            uint64_t v9 = -[UISplitViewControllerPanelImpl _topLevelViewControllerForColumn:]((uint64_t)self, VisibleColumnForResponderAfterColumn);

            if (([v9 _hasDeepestActionResponder] & 1) == 0) {
              uint64_t VisibleColumnForResponderAfterColumn = _nextVisibleColumnForResponderAfterColumn(VisibleColumnForResponderAfterColumn, v3, v6);
            }
            double v13 = v9;
            if (VisibleColumnForResponderAfterColumn == 999) {
              goto LABEL_25;
            }
          }
          uint64_t v9 = v13;
          goto LABEL_25;
        }
      }
      uint64_t VisibleColumnForResponderAfterColumn = _nextVisibleColumnForResponderAfterColumn(2, v3, v6);
      if (VisibleColumnForResponderAfterColumn != 999) {
        goto LABEL_15;
      }
    }
    goto LABEL_24;
  }
  uint64_t v9 = [(UIPanelController *)self->_panelController collapsedViewController];
LABEL_25:
  if ([v9 _hasDeepestActionResponder]) {
    goto LABEL_26;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v12 = objc_msgSend(WeakRetained, "_super_deepestActionResponder");
LABEL_28:
  double v14 = (void *)v12;

LABEL_29:
  return v14;
}

- (id)_nextVisibleViewControllerForResponderAfterChildViewController:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(UISplitViewControllerPanelImpl *)self style];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 2;
    -[UISplitViewControllerPanelImpl _topLevelViewControllerForColumn:]((uint64_t)self, 2);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v4)
    {
      uint64_t v7 = 1;
      -[UISplitViewControllerPanelImpl _topLevelViewControllerForColumn:]((uint64_t)self, 1);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 != v4)
      {
        -[UISplitViewControllerPanelImpl _topLevelViewControllerForColumn:]((uint64_t)self, 0);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4) {
          uint64_t v7 = 0;
        }
        else {
          uint64_t v7 = 999;
        }
      }
    }
    long long v11 = [(UIPanelController *)self->_panelController currentState];
    uint64_t VisibleColumnForResponderAfterColumn = _nextVisibleColumnForResponderAfterColumn(v7, v6, [(UISplitViewControllerPanelImpl *)self _displayModeForState:v11]);
    if (VisibleColumnForResponderAfterColumn == 999)
    {
      double v13 = 0;
    }
    else
    {
      double v13 = -[UISplitViewControllerPanelImpl _topLevelViewControllerForColumn:]((uint64_t)self, VisibleColumnForResponderAfterColumn);
    }
  }
  else if (![(UISplitViewControllerPanelImpl *)self isCollapsed] {
         && ([(UISplitViewControllerPanelImpl *)self detailViewController],
  }
             id v14 = (id)objc_claimAutoreleasedReturnValue(),
             v14,
             v14 == v4))
  {
    double v13 = [(UISplitViewControllerPanelImpl *)self masterViewController];
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (NSString)description
{
  v15.receiver = self;
  v15.super_class = (Class)UISplitViewControllerPanelImpl;
  uint64_t v3 = [(UISplitViewControllerPanelImpl *)&v15 description];
  id v4 = (void *)[v3 mutableCopy];

  if (os_variant_has_internal_diagnostics())
  {
    unint64_t v6 = [(UISplitViewControllerPanelImpl *)self style];
    uint64_t v7 = _UISplitViewControllerStyleDescription(v6);
    [v4 appendFormat:@" style=%@", v7];

    if (v6)
    {
      objc_msgSend(v4, "appendFormat:", @" columns=%p", self->_perColumnViewControllers);
      unint64_t preferredDisplayMode = self->_preferredDisplayMode;
      if (preferredDisplayMode)
      {
        id v9 = _UISplitViewControllerDisplayModeDescription(preferredDisplayMode);
        [v4 appendFormat:@" preferredDisplayMode=%@", v9];
      }
      unint64_t v10 = [(UISplitViewControllerPanelImpl *)self userGeneratedDisplayMode];
      if (v10)
      {
        long long v11 = _UISplitViewControllerDisplayModeDescription(v10);
        [v4 appendFormat:@" userGeneratedDisplayMode=%@", v11];

        if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
          [v4 appendString:@"[strict]"];
        }
      }
      unint64_t preferredSplitBehavior = self->_preferredSplitBehavior;
      if (preferredSplitBehavior)
      {
        double v13 = _UISplitViewControllerSplitBehaviorDescription(preferredSplitBehavior);
        [v4 appendFormat:@" preferredSplitBehavior=%@", v13];
      }
    }
    if (self->_preferredPrimaryColumnWidth != -3.40282347e38) {
      objc_msgSend(v4, "appendFormat:", @" prefPrimaryColWidth=%g", *(void *)&self->_preferredPrimaryColumnWidth);
    }
    if (self->_preferredPrimaryColumnWidthFraction != -3.40282347e38) {
      objc_msgSend(v4, "appendFormat:", @" prefPrimaryColWidthFraction=%g", *(void *)&self->_preferredPrimaryColumnWidthFraction);
    }
    if (self->_minimumPrimaryColumnWidth != -3.40282347e38) {
      objc_msgSend(v4, "appendFormat:", @" minPrimaryColWidth=%g", *(void *)&self->_minimumPrimaryColumnWidth);
    }
    if (self->_maximumPrimaryColumnWidth != -3.40282347e38) {
      objc_msgSend(v4, "appendFormat:", @" maxPrimaryColWidth=%g", *(void *)&self->_maximumPrimaryColumnWidth);
    }
    if (v6)
    {
      if (self->_preferredSupplementaryColumnWidthFraction != -3.40282347e38) {
        objc_msgSend(v4, "appendFormat:", @" prefSupplementaryColWidthFraction=%g", *(void *)&self->_preferredSupplementaryColumnWidthFraction);
      }
      if (self->_preferredSupplementaryColumnWidth != -3.40282347e38) {
        objc_msgSend(v4, "appendFormat:", @" prefSupplementaryColWidth=%g", *(void *)&self->_preferredSupplementaryColumnWidth);
      }
      if (self->_minimumSupplementaryColumnWidth != -3.40282347e38) {
        objc_msgSend(v4, "appendFormat:", @" minSupplementaryColWidth=%g", *(void *)&self->_minimumSupplementaryColumnWidth);
      }
      if (self->_maximumSupplementaryColumnWidth != -3.40282347e38) {
        objc_msgSend(v4, "appendFormat:", @" maxSupplementaryColWidth=%g", *(void *)&self->_maximumSupplementaryColumnWidth);
      }
    }
    if (![(UISplitViewControllerPanelImpl *)self presentsWithGesture]) {
      [v4 appendString:@" presentsWithGesture=NO"];
    }
    if ([(UISplitViewControllerPanelImpl *)self primaryEdge] == 1) {
      [v4 appendString:@" primaryEdge=Trailing"];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v4, "appendFormat:", @" svc=%p", WeakRetained);

    objc_msgSend(v4, "appendFormat:", @" panelController=%p", self->_panelController);
  }
  return (NSString *)v4;
}

- (id)_allContainedViewControllers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v3 = [WeakRetained viewControllers];

  return v3;
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  unint64_t v6 = [WeakRetained viewControllers];

  _UISaveReferencedChildViewControllers(v6, 0);
  objc_msgSend(v4, "encodeInteger:forKey:", -[UISplitViewControllerPanelImpl _svcOrientation](self, "_svcOrientation"), @"SplitViewInterfaceOrientation");
  id v7 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v7, "displayMode"), @"SplitViewControllerDisplayMode");

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v14 = [v13 _restorationIdentifierPath];

        if (!v14)
        {
          if (_UIStateRestorationDebugLogEnabled()) {
            NSLog(&cfstr_SViewControlle.isa, "-[UISplitViewControllerPanelImpl encodeRestorableStateWithCoder:]", v13, (void)v15);
          }
          [(id)UIApp ignoreSnapshotOnNextApplicationLaunch];
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(UISplitViewControllerPanelImpl *)self _svcOrientation];
  unint64_t v6 = +[UIDevice currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  id v8 = [v4 decodeObjectForKey:@"UIApplicationStateRestorationUserInterfaceIdiom"];
  if (v7 == (int)[v8 intValue])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    [WeakRetained displayMode];

    if (v7 == 1) {
      int v10 = [v4 decodeBoolForKey:@"SplitViewControllerShowingMasterView"];
    }
    else {
      int v10 = 0;
    }
    if ([v4 containsValueForKey:@"SplitViewControllerDisplayMode"]
      && [v4 containsValueForKey:@"SplitViewInterfaceOrientation"])
    {
      if ([v4 decodeIntegerForKey:@"SplitViewInterfaceOrientation"] != v5) {
        goto LABEL_31;
      }
      uint64_t v16 = [v4 decodeIntegerForKey:@"SplitViewControllerDisplayMode"];
      goto LABEL_27;
    }
    if ((unint64_t)(v5 - 1) < 2) {
      int v17 = v10;
    }
    else {
      int v17 = 0;
    }
    if (v17 == 1)
    {
      uint64_t v16 = 3;
LABEL_27:
      id v18 = objc_loadWeakRetained((id *)&self->_svc);
      uint64_t v19 = [v18 displayMode];

      if (v16 != v19)
      {
        id v20 = objc_loadWeakRetained((id *)&self->_svc);
        double v21 = [v20 _existingView];
        double v22 = [v21 window];

        if (v22)
        {
          [(UISplitViewControllerPanelImpl *)self _changeToDisplayMode:v16 fromPreferredDisplayMode:[(UISplitViewControllerPanelImpl *)self preferredDisplayMode]];
        }
        else
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __65__UISplitViewControllerPanelImpl_decodeRestorableStateWithCoder___block_invoke;
          block[3] = &unk_1E52D9CD0;
          block[4] = self;
          block[5] = v16;
          dispatch_async(MEMORY[0x1E4F14428], block);
        }
      }
    }
  }
  else
  {
    if (v7) {
      uint64_t v11 = @"Unspecified";
    }
    else {
      uint64_t v11 = @"iPhone";
    }
    if (v7 == 1) {
      uint64_t v11 = @"iPad";
    }
    uint64_t v12 = v11;
    uint64_t v13 = [v8 integerValue];
    if (v13) {
      id v14 = @"Unspecified";
    }
    else {
      id v14 = @"iPhone";
    }
    if (v13 == 1) {
      id v14 = @"iPad";
    }
    long long v15 = v14;
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SSkippingCheck.isa, "-[UISplitViewControllerPanelImpl decodeRestorableStateWithCoder:]", v12, v15);
    }
  }
LABEL_31:
}

void __65__UISplitViewControllerPanelImpl_decodeRestorableStateWithCoder___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = [WeakRetained _existingView];
  id v4 = [v3 window];

  if (v4)
  {
    unint64_t v6 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v7 = [v6 preferredDisplayMode];
    [v6 _changeToDisplayMode:v5 fromPreferredDisplayMode:v7];
  }
}

- (id)_effectiveActivityItemsConfiguration
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v5 = objc_msgSend(WeakRetained, "_super_effectiveActivityItemsConfiguration");

  if (!v5)
  {
    if (!dyld_program_sdk_at_least())
    {
      uint64_t v5 = 0;
      goto LABEL_13;
    }
    id v6 = objc_loadWeakRetained((id *)p_svc);
    uint64_t v7 = [v6 style];

    unint64_t v8 = v7 - 1;
    uint64_t v9 = objc_loadWeakRetained((id *)p_svc);
    int v10 = v9;
    if (v8 > 1)
    {
      uint64_t v11 = [v9 viewControllers];
      long long v15 = [v11 lastObject];
    }
    else
    {
      uint64_t v11 = [v9 viewControllerForColumn:2];

      id v12 = objc_loadWeakRetained((id *)p_svc);
      int v13 = [v12 _isCollapsed];

      if (!v13)
      {
LABEL_12:
        uint64_t v5 = [v11 _effectiveActivityItemsConfiguration];

        goto LABEL_13;
      }
      id v14 = [(UISplitViewControllerPanelImpl *)self panelController];
      int v10 = [v14 collapsedViewController];

      if (!v10 || ((v10[94] >> 1) & 3u) - 1 > 1)
      {
LABEL_11:

        goto LABEL_12;
      }
      long long v15 = v10;
      int v10 = v15;
    }
    id v16 = v15;

    uint64_t v11 = v16;
    goto LABEL_11;
  }
LABEL_13:
  return v5;
}

- (UISlidingBarConfiguration)configuration
{
  id v2 = [(UISplitViewControllerPanelImpl *)self panelController];
  uint64_t v3 = [v2 configuration];

  return (UISlidingBarConfiguration *)v3;
}

- (UISlidingBarState)currentState
{
  id v2 = [(UISplitViewControllerPanelImpl *)self panelController];
  uint64_t v3 = [v2 currentState];

  return (UISlidingBarState *)v3;
}

- (NSArray)possibleStates
{
  id v2 = [(UISplitViewControllerPanelImpl *)self panelController];
  uint64_t v3 = [v2 possibleStates];

  return (NSArray *)v3;
}

- (UISlidingBarStateRequest)stateRequest
{
  id v2 = [(UISplitViewControllerPanelImpl *)self panelController];
  uint64_t v3 = [v2 stateRequest];

  return (UISlidingBarStateRequest *)v3;
}

- (void)setStateRequest:(id)a3
{
  *(void *)&self->_flags |= 1uLL;
  id v4 = a3;
  id v5 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v5 setStateRequest:v4];
}

- (void)animateToRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v5 animateToRequest:v4];
}

- (void)_updateSplitBehaviorOverridesForTransitionFromDisplayMode:(uint64_t)a1 toDisplayMode:(uint64_t)a2 shouldResizeIfNecessary:(uint64_t)a3
{
  if (a1)
  {
    uint64_t v6 = [(id)a1 style];
    if ((unint64_t)(v6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      unint64_t v15 = v6;
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      int v17 = _UISplitViewControllerStyleDescription(v15);
      [v16 handleFailureInMethod:sel__updateSplitBehaviorOverridesForTransitionFromDisplayMode_toDisplayMode_shouldResizeIfNecessary_, a1, @"UISplitViewControllerPanelImpl.m", 5019, @"Incorrect code path for UISplitViewControllerStyle %@", v17 object file lineNumber description];
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    int v8 = _UISplitViewControllerAutoHidesColumns(WeakRetained);

    if (v8)
    {
      if ([(id)a1 _isCollapsed])
      {
        if (os_variant_has_internal_diagnostics())
        {
          id v18 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "shouldn't be transitioning display modes in collapsed UISVC", buf, 2u);
          }
        }
        else
        {
          uint64_t v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateSplitBehaviorOverridesForTransitionFromDisplayMode_toDisplayMode_shouldResizeIfNecessary____s_category)+ 8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "shouldn't be transitioning display modes in collapsed UISVC", buf, 2u);
          }
        }
LABEL_20:
        *(void *)(a1 + 288) &= 0xFFFFFFFFFFF3FFFFLL;
        return;
      }
      if (a2 == 1)
      {
        if (a3 == 2)
        {
LABEL_14:
          int v10 = [*(id *)(a1 + 424) view];
          [v10 bounds];
          double v12 = v11;
          double v14 = v13;

          double v19 = 0.0;
          *(void *)long long buf = 0;
          objc_msgSend((id)a1, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", buf, &v19, a3, 1, 0, 0, v12, v14);
          if ([(id)a1 _isSecondaryColumnCompactInTotalWidth:v12 withPrimaryColumnWidth:*(double *)buf supplementaryColumnWidth:v19])
          {
            *(void *)(a1 + 288) = *(void *)(a1 + 288) & 0xFFFFFFFFFFF3FFFFLL | 0x80000;
            if (a3 == 4)
            {
              objc_msgSend((id)a1, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", buf, &v19, 2, 1, 0, 0, v12, v14);
              if (([(id)a1 _isSecondaryColumnCompactInTotalWidth:v12 withPrimaryColumnWidth:*(double *)buf supplementaryColumnWidth:v19] & 1) == 0)*(void *)(a1 + 288) |= 0xC0000uLL; {
            }
              }
            [(id)a1 allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:a3];
          }
          return;
        }
      }
      else if (a2 != 2)
      {
        goto LABEL_19;
      }
      if (a3 == 4) {
        goto LABEL_14;
      }
LABEL_19:
      if ((unint64_t)(a3 - 1) > 1) {
        return;
      }
      goto LABEL_20;
    }
  }
}

- (void)_transitionFromDisplayMode:(int64_t)a3 toDisplayMode:(int64_t)a4
{
}

- (void)_transitionFromDisplayMode:(int64_t)a3 toDisplayMode:(int64_t)a4 updateSplitBehaviorOverrides:(BOOL)a5 userGenerated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  unint64_t v12 = [(UISplitViewControllerPanelImpl *)self style];
  if (v12 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v37 = [MEMORY[0x1E4F28B00] currentHandler];
    double v38 = _UISplitViewControllerStyleDescription(v12);
    [v37 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 5081, @"Incorrect code path for UISplitViewControllerStyle %@", v38 object file lineNumber description];
  }
  if (a3 != a4)
  {
    if (v7) {
      -[UISplitViewControllerPanelImpl _updateSplitBehaviorOverridesForTransitionFromDisplayMode:toDisplayMode:shouldResizeIfNecessary:]((uint64_t)self, a3, a4);
    }
    int64_t v13 = [(UISplitViewControllerPanelImpl *)self allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:a4];
    if (v13 != a3)
    {
      int64_t v14 = v13;
      if (v6) {
        [(UISplitViewControllerPanelImpl *)self setUserGeneratedDisplayMode:v13];
      }
      int v46 = 0;
      [(UISplitViewControllerPanelImpl *)self _getPrimaryShown:(char *)&v46 + 3 supplementaryShown:(char *)&v46 + 2 shouldUseOverlay:(char *)&v46 + 1 dimMainIfNecessary:&v46 forDisplayMode:v14];
      char v15 = BYTE1(v46);
      if (v14 == 1 && !BYTE1(v46))
      {
        char v45 = 0;
        [(UISplitViewControllerPanelImpl *)self _getPrimaryShown:0 supplementaryShown:0 shouldUseOverlay:&v45 dimMainIfNecessary:0 forDisplayMode:a3];
        char v15 = v45;
        BYTE1(v46) = v45;
      }
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __118__UISplitViewControllerPanelImpl__transitionFromDisplayMode_toDisplayMode_updateSplitBehaviorOverrides_userGenerated___block_invoke;
      void v40[3] = &unk_1E52E7FF0;
      v40[4] = self;
      char v41 = HIBYTE(v46);
      char v42 = BYTE2(v46);
      char v43 = v15;
      char v44 = v46;
      +[UIView performWithoutAnimation:v40];
      int v16 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
      int v17 = [(UISplitViewControllerPanelImpl *)self panelController];
      id v18 = [v17 uncachedPossibleStates];

      double v19 = [(UISplitViewControllerPanelImpl *)self panelController];
      id v20 = [v19 currentState];
      double v21 = [v20 stateRequest];

      [v21 setUserInitiated:v6];
      if (HIBYTE(v46))
      {
        double v22 = minNonzeroPrimaryWidthInStates(v18, v16);
        if (v16)
        {
          [v21 setLeadingWidth:v22];
          if (!BYTE2(v46)) {
            goto LABEL_24;
          }
          goto LABEL_18;
        }
        [v21 setTrailingWidth:v22];
        if (BYTE2(v46)) {
          goto LABEL_20;
        }
      }
      else
      {
        [v21 setLeadingWidth:0.0];
        [v21 setTrailingWidth:0.0];
        if (BYTE2(v46))
        {
          if (v16)
          {
LABEL_18:
            [v21 leadingWidth];
LABEL_21:
            id v39 = 0;
            double MatchingState = minNonzeroSupplementaryWidthInStateWithPrimaryWidthGetMatchingState(v18, v16, &v39, v23);
            id v25 = v39;
            long long v26 = v25;
            if (v25)
            {
              [v25 mainWidth];
              objc_msgSend(v21, "setMainWidth:");
            }
            [v21 setSupplementaryWidth:MatchingState];

LABEL_25:
            if ([(UISplitViewControllerPanelImpl *)self _alwaysHideSidebarToggleButton])
            {
              goto LABEL_26;
            }
            if (v12 == 2
              && (p_perColumnViewControllers = &self->_perColumnViewControllers,
                  [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20], uint64_t v29 = objc_claimAutoreleasedReturnValue(), v29, v29))
            {
              float64x2_t v30 = &unk_1ED3F3A50;
            }
            else
            {
              if (BYTE1(v46))
              {
                long long v27 = 0;
                goto LABEL_34;
              }
              p_perColumnViewControllers = &self->_perColumnViewControllers;
              float64x2_t v30 = &unk_1ED3F3A08;
            }
            float64x2_t v31 = [(NSMutableDictionary *)*p_perColumnViewControllers objectForKeyedSubscript:v30];
            float64x2_t v32 = [v31 navigationController];
            long long v27 = [v32 navigationBar];

LABEL_34:
            if (![v27 _hasBackButton]
              || ![(UIBarButtonItem *)self->_sidebarToggleButtonItem _actsAsFakeBackButton])
            {
              goto LABEL_37;
            }

LABEL_26:
            long long v27 = 0;
LABEL_37:
            int64_t v33 = [(UISplitViewControllerPanelImpl *)self panelController];
            [v33 setNavigationBarForContentLayoutGuideAnimation:v27];

            BOOL v34 = [(UISplitViewControllerPanelImpl *)self _allowClientAnimationCoordination];
            id v35 = [(UISplitViewControllerPanelImpl *)self panelController];
            [v35 setAnimationRequestShouldCoordinate:v34];

            id v36 = [(UISplitViewControllerPanelImpl *)self panelController];
            [v36 animateToRequest:v21];

            return;
          }
LABEL_20:
          [v21 trailingWidth];
          goto LABEL_21;
        }
      }
LABEL_24:
      [v21 setSupplementaryWidth:0.0];
      goto LABEL_25;
    }
  }
}

uint64_t __118__UISplitViewControllerPanelImpl__transitionFromDisplayMode_toDisplayMode_updateSplitBehaviorOverrides_userGenerated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPanelConfigurationWithIsPrimaryShown:*(unsigned __int8 *)(a1 + 40) isSupplementaryShown:*(unsigned __int8 *)(a1 + 41) shouldUseOverlay:*(unsigned __int8 *)(a1 + 42) dimMainIfNecessary:*(unsigned __int8 *)(a1 + 43)];
}

- (CGSize)_screenSize
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v4 = [WeakRetained _window];

  id v5 = objc_loadWeakRetained((id *)p_svc);
  BOOL v6 = [v5 _screen];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v7 = v4;
  }
  else {
    BOOL v7 = v6;
  }
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (double)_defaultMaximumPrimaryColumnWidthForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    BOOL v6 = [(UISplitViewControllerPanelImpl *)self styleProvider];
    objc_msgSend(v6, "defaultMaximumWidthForColumn:withSize:splitBehavior:", 0, -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior"), width, height);
    double v8 = v7;

    return v8;
  }
  else
  {
    [(UISplitViewControllerPanelImpl *)self _screenSize];
    if (v10 >= v11) {
      double v12 = v10;
    }
    else {
      double v12 = v11;
    }
    unint64_t v13 = [(UISplitViewControllerPanelImpl *)self _svcOrientation] - 3;
    BOOL v14 = v12 <= 1112.0;
    if (v12 > 1210.0) {
      BOOL v14 = 1;
    }
    if (v14) {
      BOOL v15 = v12 > 1210.0;
    }
    else {
      BOOL v15 = v13 < 2;
    }
    if (v15) {
      double v16 = 375.0;
    }
    else {
      double v16 = 320.0;
    }
    if (dyld_program_sdk_at_least())
    {
      if (v13 <= 1)
      {
        if (width <= v12 * 0.5)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
          uint64_t v25 = [WeakRetained displayMode];

          if (v25 == 2) {
            return 320.0;
          }
          else {
            return 375.0;
          }
        }
        else if (width <= v12 - v16)
        {
          if (v12 <= 1210.0) {
            return 320.0;
          }
          else {
            return 375.0;
          }
        }
        else
        {
          id v17 = objc_loadWeakRetained((id *)&self->_svc);
          int v18 = [v17 _usesExtraWidePrimaryColumn];

          double v19 = 414.0;
          if (!v15) {
            double v19 = 375.0;
          }
          if (v18) {
            return v19;
          }
        }
      }
    }
    else
    {
      id v20 = objc_loadWeakRetained((id *)&self->_svc);
      uint64_t v21 = [v20 preferredDisplayMode];

      if (v21 == 2)
      {
        double v22 = round(width * 0.38);
        if (width <= v12 * 0.5)
        {
          return v22;
        }
        else if (width > v12 - v16 && v13 < 0xFFFFFFFFFFFFFFFELL)
        {
          return v22;
        }
      }
    }
    return v16;
  }
}

- (double)_defaultMaximumSupplementaryColumnWidthForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int64_t v7 = [(UISplitViewControllerPanelImpl *)self style];
  if ((unint64_t)(v7 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v12 = v7;
    unint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v14 = _UISplitViewControllerStyleDescription(v12);
    [v13 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 5316, @"Incorrect code path for UISplitViewControllerStyle %@", v14 object file lineNumber description];
  }
  double v8 = [(UISplitViewControllerPanelImpl *)self styleProvider];
  objc_msgSend(v8, "defaultMaximumWidthForColumn:withSize:splitBehavior:", 1, -[UISplitViewControllerPanelImpl splitBehavior](self, "splitBehavior"), width, height);
  double v10 = v9;

  return v10;
}

- (double)_primaryColumnWidthForSize:(CGSize)a3 shouldUseOverlay:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  -[UISplitViewControllerPanelImpl _primaryColumnWidthForSize:isCompact:shouldUseOverlay:](self, "_primaryColumnWidthForSize:isCompact:shouldUseOverlay:", [WeakRetained _horizontalSizeClass] == 1, v4, width, height);
  double v10 = v9;

  return v10;
}

- (void)getPrimaryColumnWidth:(double *)a3 supplementaryColumnWidth:(double *)a4 forSize:(CGSize)a5 displayMode:(int64_t)a6 shouldUseOverlay:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a5.height;
  double width = a5.width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  -[UISplitViewControllerPanelImpl getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:isCompact:shouldUseOverlay:](self, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:isCompact:shouldUseOverlay:", a3, a4, a6, [WeakRetained _horizontalSizeClass] == 1, v7, width, height);
}

- (double)_primaryColumnWidthForSize:(CGSize)a3 isCompact:(BOOL)a4 shouldUseOverlay:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.height;
  double width = a3.width;
  int64_t v11 = [(UISplitViewControllerPanelImpl *)self style];
  if (v11)
  {
    unint64_t v49 = v11;
    id v50 = [MEMORY[0x1E4F28B00] currentHandler];
    double v51 = _UISplitViewControllerStyleDescription(v49);
    [v50 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 5352, @"Incorrect code path for UISplitViewControllerStyle %@", v51 object file lineNumber description];

    if (a4) {
      return width;
    }
  }
  else if (a4)
  {
    return width;
  }
  if (!dyld_program_sdk_at_least()) {
    return 320.0;
  }
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  [WeakRetained preferredPrimaryColumnWidthFraction];
  BOOL v15 = v14 != -3.40282347e38;

  id v16 = objc_loadWeakRetained((id *)&self->_svc);
  [v16 _preferredPrimaryColumnWidth];
  double v18 = v17;

  int v19 = v18 != -3.40282347e38 || v15;
  id v20 = +[UIDevice currentDevice];
  uint64_t v21 = [v20 userInterfaceIdiom];

  if ((v21 & 0xFFFFFFFFFFFFFFFBLL) != 1 || !dyld_program_sdk_at_least())
  {
    if ([(UISplitViewControllerPanelImpl *)self _currentInterfaceIdiom]
      || ((dyld_program_sdk_at_least() ^ 1 | v19) & 1) != 0)
    {
      if (height <= 1210.0 && width <= 1210.0) {
        double v23 = 320.0;
      }
      else {
        double v23 = 375.0;
      }
      if (v18 == -3.40282347e38)
      {
        if (v19)
        {
          id v29 = objc_loadWeakRetained((id *)&self->_svc);
          [v29 preferredPrimaryColumnWidthFraction];
          double v31 = v30;
        }
        else
        {
          double v31 = 0.4;
        }
        double width = ceil(width * v31);
        goto LABEL_37;
      }
      id v24 = objc_loadWeakRetained((id *)&self->_svc);
      uint64_t v25 = v24;
      goto LABEL_23;
    }
    if (v5) {
      double v23 = 375.0;
    }
    else {
      double v23 = 320.0;
    }
LABEL_31:
    id v32 = objc_loadWeakRetained((id *)&self->_svc);
    int64_t v33 = [v32 viewIfLoaded];
    [v33 safeAreaInsets];
    double v35 = v34;
    double v37 = v36;

    if ([(UISplitViewControllerPanelImpl *)self _layoutPrimaryOnRight]) {
      double v38 = v37;
    }
    else {
      double v38 = v35;
    }
    double width = v23 + v38;
    double v23 = v23 + v38;
    goto LABEL_37;
  }
  -[UISplitViewControllerPanelImpl _defaultMaximumPrimaryColumnWidthForSize:](self, "_defaultMaximumPrimaryColumnWidthForSize:", width, height);
  double v23 = v22;
  if (!v19)
  {
    double width = v22;
    if (!dyld_program_sdk_at_least()) {
      goto LABEL_37;
    }
    goto LABEL_31;
  }
  id v24 = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v25 = v24;
  if (v18 != -3.40282347e38)
  {
LABEL_23:
    [v24 _preferredPrimaryColumnWidth];
    double width = v28;
    goto LABEL_24;
  }
  [v24 preferredPrimaryColumnWidthFraction];
  double width = ceil(width * v26);
LABEL_24:

LABEL_37:
  id v39 = objc_loadWeakRetained((id *)p_svc);
  [v39 minimumPrimaryColumnWidth];
  if (v40 == -3.40282347e38)
  {
    double v43 = 0.0;
  }
  else
  {
    id v41 = objc_loadWeakRetained((id *)p_svc);
    [v41 minimumPrimaryColumnWidth];
    double v43 = v42;
  }
  if (v43 >= width) {
    double width = v43;
  }
  id v44 = objc_loadWeakRetained((id *)p_svc);
  [v44 maximumPrimaryColumnWidth];
  if (v45 != -3.40282347e38)
  {
    id v46 = objc_loadWeakRetained((id *)p_svc);
    [v46 maximumPrimaryColumnWidth];
    double v23 = v47;
  }
  if (v23 < width) {
    return v23;
  }
  return width;
}

- (void)getPrimaryColumnWidth:(double *)a3 supplementaryColumnWidth:(double *)a4 forSize:(CGSize)a5 displayMode:(int64_t)a6 isCompact:(BOOL)a7 shouldUseOverlay:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  double height = a5.height;
  double width = a5.width;
  int64_t v16 = [(UISplitViewControllerPanelImpl *)self splitBehavior];
  -[UISplitViewControllerPanelImpl getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:](self, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:splitBehavior:isCompact:shouldUseOverlay:", a3, a4, a6, v16, v9, v8, width, height);
}

- (void)getPrimaryColumnWidth:(double *)a3 supplementaryColumnWidth:(double *)a4 forSize:(CGSize)a5 displayMode:(int64_t)a6 splitBehavior:(int64_t)a7 isCompact:(BOOL)a8 shouldUseOverlay:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  double height = a5.height;
  CGFloat width = a5.width;
  unint64_t v19 = [(UISplitViewControllerPanelImpl *)self style];
  if (v19 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    int v78 = [MEMORY[0x1E4F28B00] currentHandler];
    _UISplitViewControllerStyleDescription(v19);
    id v85 = (id)objc_claimAutoreleasedReturnValue();
    [v78 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 5444, @"Incorrect code path for UISplitViewControllerStyle %@", v85 object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v84 = [WeakRetained viewIfLoaded];

  [v84 safeAreaInsets];
  double v22 = v21;
  double v24 = v23;
  if ([(UISplitViewControllerPanelImpl *)self _layoutPrimaryOnRight]) {
    double v22 = v24;
  }
  if (v84)
  {
    [v84 bounds];
    double v25 = CGRectGetWidth(v87);
    if (v10) {
      goto LABEL_7;
    }
  }
  else
  {
    double v25 = 736.0;
    if (v10)
    {
LABEL_7:
      double v26 = 0.0;
      if (v19 == 2) {
        double v26 = width;
      }
      goto LABEL_111;
    }
  }
  BOOL v79 = v9;
  __int16 v82 = a4;
  BOOL v28 = a6 == 6 || (a6 & 0xFFFFFFFFFFFFFFFELL) == 4;
  int v29 = v19 != 2 || v28;
  [(UISplitViewControllerPanelImpl *)self preferredPrimaryColumnWidth];
  double v31 = v30;
  BOOL v32 = v30 == -3.40282347e38;
  [(UISplitViewControllerPanelImpl *)self preferredPrimaryColumnWidthFraction];
  double v34 = v33;
  [(UISplitViewControllerPanelImpl *)self preferredSupplementaryColumnWidth];
  double v36 = v35;
  BOOL v37 = v35 == -3.40282347e38;
  [(UISplitViewControllerPanelImpl *)self preferredSupplementaryColumnWidthFraction];
  double v39 = v38;
  BOOL v40 = v34 == -3.40282347e38 && v32;
  BOOL v41 = v38 == -3.40282347e38 && v37;
  int64_t v42 = [(UISplitViewControllerPanelImpl *)self _currentInterfaceIdiom];
  double v43 = [(UISplitViewControllerPanelImpl *)self styleProvider];
  objc_msgSend(v43, "defaultMaximumWidthForColumn:withSize:splitBehavior:", 0, a7, width, height);
  double v83 = v44;

  double v45 = [(UISplitViewControllerPanelImpl *)self styleProvider];
  objc_msgSend(v45, "defaultMaximumWidthForColumn:withSize:splitBehavior:", 1, a7, width, height);
  double v47 = v46;

  if (v19 == 2 || !v29)
  {
    double v49 = v25 - v22;
    if (v19 == 2) {
      char v50 = v29;
    }
    else {
      char v50 = 1;
    }
    if (v50)
    {
      if (!v42)
      {
        double v48 = 320.0;
        if (v49 + -320.0 + -375.0 <= 50.0) {
          double v36 = 320.0;
        }
        else {
          double v36 = 375.0;
        }
        double v80 = 320.0;
        double v81 = v36;
        goto LABEL_68;
      }
      double v51 = ceil(width * v34);
      if (v34 == -3.40282347e38) {
        double v51 = v83;
      }
      if (v31 == -3.40282347e38) {
        double v52 = v51;
      }
      else {
        double v52 = v31;
      }
      double v80 = v52;
      double v81 = v47;
      if (v41)
      {
        double v36 = v47;
LABEL_67:
        double v48 = v83;
        goto LABEL_68;
      }
    }
    else
    {
      if (!v42)
      {
        if (v49 + -320.0 + -375.0 <= 50.0) {
          double v36 = 320.0;
        }
        else {
          double v36 = 375.0;
        }
        double v80 = 0.0;
        double v81 = v36;
        goto LABEL_67;
      }
      double v81 = v47;
      if (v41)
      {
        if (v40)
        {
          double v36 = v47;
        }
        else
        {
          double v77 = ceil(width * v34);
          if (v31 == -3.40282347e38) {
            double v36 = v77;
          }
          else {
            double v36 = v31;
          }
        }
        double v48 = v83;
        double v80 = 0.0;
        goto LABEL_68;
      }
      double v80 = 0.0;
    }
    double v54 = ceil(width * v39);
    if (v36 == -3.40282347e38) {
      double v36 = v54;
    }
    goto LABEL_67;
  }
  double v81 = v47;
  if (!v42 && ![(UISplitViewControllerPanelImpl *)self _usesExtraWidePrimaryColumn])
  {
    if (v79) {
      double v48 = 375.0;
    }
    else {
      double v48 = 320.0;
    }
    double v36 = 0.0;
    goto LABEL_55;
  }
  double v36 = 0.0;
  if (!v40)
  {
    double v53 = ceil(width * v34);
    if (v31 != -3.40282347e38) {
      double v53 = v31;
    }
    double v80 = v53;
    goto LABEL_67;
  }
  double v48 = v83;
LABEL_55:
  double v80 = v48;
LABEL_68:
  id v55 = objc_loadWeakRetained((id *)&self->_svc);
  double v56 = [v55 viewIfLoaded];
  [v56 safeAreaInsets];
  double v58 = v57;
  double v60 = v59;

  if ([(UISplitViewControllerPanelImpl *)self _layoutPrimaryOnRight]) {
    double v61 = v60;
  }
  else {
    double v61 = v58;
  }
  if (v19 == 2) {
    int v62 = v29;
  }
  else {
    int v62 = 1;
  }
  if (v62) {
    double v63 = -0.0;
  }
  else {
    double v63 = v61;
  }
  double v64 = v36 + v63;
  [(UISplitViewControllerPanelImpl *)self minimumPrimaryColumnWidth];
  double v66 = v65;
  [(UISplitViewControllerPanelImpl *)self minimumSupplementaryColumnWidth];
  if (v67 == -3.40282347e38) {
    double v67 = 0.0;
  }
  if (v67 < v64 || v19 != 2) {
    double v69 = v64;
  }
  else {
    double v69 = v67;
  }
  [(UISplitViewControllerPanelImpl *)self maximumPrimaryColumnWidth];
  double v71 = v70;
  [(UISplitViewControllerPanelImpl *)self maximumSupplementaryColumnWidth];
  if (v26 == -3.40282347e38) {
    double v26 = v81;
  }
  if (v26 >= v69) {
    double v26 = v69;
  }
  if (v19 != 2) {
    double v26 = v69;
  }
  if (v29) {
    double v72 = v61;
  }
  else {
    double v72 = -0.0;
  }
  double v73 = v80 + v72;
  if (v66 == -3.40282347e38) {
    double v74 = 0.0;
  }
  else {
    double v74 = v66;
  }
  if (v74 < v73) {
    double v74 = v73;
  }
  if (v29) {
    double v75 = v74;
  }
  else {
    double v75 = v73;
  }
  if (v71 == -3.40282347e38) {
    double v76 = v48;
  }
  else {
    double v76 = v71;
  }
  if (v76 < v75) {
    double v74 = v76;
  }
  if (v29) {
    CGFloat width = v74;
  }
  else {
    CGFloat width = v73;
  }
  a4 = v82;
LABEL_111:
  if (a3) {
    *a3 = width;
  }
  if (a4) {
    *a4 = v26;
  }
}

- (id)_hiddenColumnsInCurrentEnvironmentWithConcreteDisplayMode:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = [(UISplitViewControllerPanelImpl *)self style];
  if (v6 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    double v14 = _UISplitViewControllerStyleDescription(v6);
    [v13 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 5700, @"Incorrect code path for UISplitViewControllerStyle %@", v14 object file lineNumber description];
  }
  id v7 = (id)MEMORY[0x1E4F1CBF0];
  if ((unint64_t)(a3 - 4) >= 3)
  {
    if ((unint64_t)(a3 - 2) < 2)
    {
      BOOL v8 = &unk_1ED3EF878;
      if (v6 != 2) {
        BOOL v8 = (void *)MEMORY[0x1E4F1CBF0];
      }
LABEL_11:
      id v7 = v8;
      goto LABEL_18;
    }
    if (a3 == 1)
    {
      BOOL v8 = &unk_1ED3EF860;
      if (v6 == 2) {
        BOOL v8 = &unk_1ED3EF848;
      }
      goto LABEL_11;
    }
    if (os_variant_has_internal_diagnostics())
    {
      BOOL v10 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        goto LABEL_16;
      }
      int64_t v11 = _UISplitViewControllerDisplayModeDescription(a3);
      *(_DWORD *)long long buf = 138412290;
      int64_t v16 = v11;
      _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Unrecognized UISplitViewControllerDisplayMode, %@, for determining hidden columns", buf, 0xCu);
    }
    else
    {
      BOOL v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_hiddenColumnsInCurrentEnvironmentWithConcreteDisplayMode____s_category)+ 8);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_17:
        id v7 = 0;
        goto LABEL_18;
      }
      BOOL v10 = v9;
      int64_t v11 = _UISplitViewControllerDisplayModeDescription(a3);
      *(_DWORD *)long long buf = 138412290;
      int64_t v16 = v11;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Unrecognized UISplitViewControllerDisplayMode, %@, for determining hidden columns", buf, 0xCu);
    }

LABEL_16:
    goto LABEL_17;
  }
LABEL_18:
  return v7;
}

- (void)_getPrimaryShown:(BOOL *)a3 shouldUseOverlay:(BOOL *)a4
{
  int64_t v8 = [(UISplitViewControllerPanelImpl *)self style];
  if (v8)
  {
    unint64_t v17 = v8;
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v19 = _UISplitViewControllerStyleDescription(v17);
    [v18 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 5737, @"Incorrect code path for UISplitViewControllerStyle %@", v19 object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v10 = [WeakRetained traitCollection];
  uint64_t v11 = [v10 userInterfaceIdiom];

  id v12 = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v13 = [v12 preferredDisplayMode];

  switch(v13)
  {
    case 1:
      if (v11 == 1) {
        goto LABEL_16;
      }
      if (v11) {
        goto LABEL_13;
      }
      goto LABEL_14;
    case 2:
LABEL_13:
      LOBYTE(v11) = 0;
      goto LABEL_16;
    case 3:
      LOBYTE(v11) = 1;
      goto LABEL_16;
  }
  if (!v11)
  {
LABEL_14:
    BOOL v14 = [(UISplitViewControllerPanelImpl *)self _iPhoneShouldUseOverlayInCurrentEnvironment];
    goto LABEL_15;
  }
  if (v11 != 1) {
    goto LABEL_13;
  }
  BOOL v14 = [(UISplitViewControllerPanelImpl *)self _iPadShouldUseOverlayInCurrentEnvironment];
LABEL_15:
  LOBYTE(v11) = v14;
LABEL_16:
  int64_t v15 = [(UISplitViewControllerPanelImpl *)self _primaryHidingState];
  if (v15 != 2)
  {
    if (v15)
    {
      char v16 = 0;
      if (!a3) {
        goto LABEL_24;
      }
    }
    else
    {
      char v16 = v11 ^ 1;
      if (!a3) {
        goto LABEL_24;
      }
    }
LABEL_23:
    *a3 = v16;
    goto LABEL_24;
  }
  char v16 = 1;
  if (a3) {
    goto LABEL_23;
  }
LABEL_24:
  if (a4) {
    *a4 = v11;
  }
}

- (void)_getPrimaryShown:(BOOL *)a3 supplementaryShown:(BOOL *)a4 shouldUseOverlay:(BOOL *)a5 dimMainIfNecessary:(BOOL *)a6 forDisplayMode:(int64_t)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v14 = [(UISplitViewControllerPanelImpl *)self style];
  BOOL v15 = v14 == 2;
  if (v14 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v26 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v27 = _UISplitViewControllerStyleDescription(v14);
    [v26 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 5801, @"Incorrect code path for UISplitViewControllerStyle %@", v27 object file lineNumber description];
  }
  if ((unint64_t)(a7 - 4) < 3)
  {
    BOOL v15 = 1;
    BOOL v16 = 1;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if ((unint64_t)(a7 - 2) < 2)
  {
    BOOL v16 = v14 != 2;
    if (!a3) {
      goto LABEL_9;
    }
LABEL_8:
    *a3 = v16;
    goto LABEL_9;
  }
  if (a7 != 1)
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v24 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        goto LABEL_40;
      }
      double v25 = _UISplitViewControllerDisplayModeDescription(a7);
      *(_DWORD *)long long buf = 138412290;
      int v29 = v25;
      _os_log_fault_impl(&dword_1853B0000, v24, OS_LOG_TYPE_FAULT, "unknown display mode: %@", buf, 0xCu);
    }
    else
    {
      double v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_getPrimaryShown_supplementaryShown_shouldUseOverlay_dimMainIfNecessary_forDisplayMode____s_category)+ 8);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_41;
      }
      double v24 = v23;
      double v25 = _UISplitViewControllerDisplayModeDescription(a7);
      *(_DWORD *)long long buf = 138412290;
      int v29 = v25;
      _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "unknown display mode: %@", buf, 0xCu);
    }

LABEL_40:
  }
LABEL_41:
  BOOL v15 = 0;
  BOOL v16 = 0;
  if (a3) {
    goto LABEL_8;
  }
LABEL_9:
  if (a4) {
    *a4 = v15;
  }
  int64_t v17 = [(UISplitViewControllerPanelImpl *)self splitBehavior];
  if ([(UISplitViewControllerPanelImpl *)self presentsWithGesture]
    || ![(UISplitViewControllerPanelImpl *)self _visibleToggleButtonRequiresPresentsWithGesture])
  {
    BOOL v19 = a7 == 3 || v17 == 2;
    BOOL v20 = v17 == 3;
  }
  else
  {
    BOOL v19 = a7 == 3 || a7 == 5;
    BOOL v20 = a7 == 6;
  }
  BOOL v22 = v20;
  if (a5) {
    *a5 = v19;
  }
  if (a6) {
    *a6 = v22;
  }
}

- (void)_getPrimaryShown:(BOOL *)a3 supplementaryShown:(BOOL *)a4 shouldUseOverlay:(BOOL *)a5 dimMainIfNecessary:(BOOL *)a6
{
  int64_t v12 = [(UISplitViewControllerPanelImpl *)self style];
  if ((unint64_t)(v12 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v14 = v12;
    BOOL v15 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v16 = _UISplitViewControllerStyleDescription(v14);
    [v15 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 5851, @"Incorrect code path for UISplitViewControllerStyle %@", v16 object file lineNumber description];
  }
  int64_t v13 = [(UISplitViewControllerPanelImpl *)self _concreteDisplayModeForCurrentEnvironment];
  [(UISplitViewControllerPanelImpl *)self _getPrimaryShown:a3 supplementaryShown:a4 shouldUseOverlay:a5 dimMainIfNecessary:a6 forDisplayMode:v13];
}

- (int64_t)validDisplayModeWithAllColumns
{
  int64_t v4 = [(UISplitViewControllerPanelImpl *)self style];
  unint64_t v5 = v4;
  if ((unint64_t)(v4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v10 = _UISplitViewControllerStyleDescription(v5);
    [v9 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 5857, @"Incorrect code path for UISplitViewControllerStyle %@", v10 object file lineNumber description];
  }
  else if (v4 == 2)
  {
    unint64_t v6 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

    if (v6)
    {
      id v7 = self;
      uint64_t v8 = 4;
      goto LABEL_7;
    }
  }
  id v7 = self;
  uint64_t v8 = 2;
LABEL_7:
  return [(UISplitViewControllerPanelImpl *)v7 allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:v8];
}

- (double)panelController:(id)a3 expectedWidthForColumnForViewController:(id)a4
{
  id v5 = a4;
  double v23 = 0.0;
  double v6 = 0.0;
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    unint64_t v7 = [(UISplitViewControllerPanelImpl *)self _columnForViewController:v5];
    if (v7 <= 1)
    {
      unint64_t v8 = v7;
      int64_t v9 = [(UISplitViewControllerPanelImpl *)self validDisplayModeWithAllColumns];
      unsigned __int8 v22 = 0;
      [(UISplitViewControllerPanelImpl *)self _getPrimaryShown:0 supplementaryShown:0 shouldUseOverlay:&v22 dimMainIfNecessary:0 forDisplayMode:v9];
      BOOL v10 = v8 == 0;
      if (v8) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = &v23;
      }
      if (v10) {
        int64_t v12 = 0;
      }
      else {
        int64_t v12 = &v23;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      unint64_t v14 = [WeakRetained view];
      [v14 bounds];
      double v16 = v15;
      double v18 = v17;
      id v19 = objc_loadWeakRetained((id *)&self->_svc);
      BOOL v20 = [v19 _horizontalSizeClass] == 1;
      -[UISplitViewControllerPanelImpl getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:isCompact:shouldUseOverlay:](self, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:isCompact:shouldUseOverlay:", v11, v12, v9, v20, v22, v16, v18);

      double v6 = v23;
    }
  }

  return v6;
}

- (id)_newBarContentAnimationClippingView
{
  id v2 = objc_alloc_init(UIView);
  [(UIView *)v2 setClipsToBounds:1];
  return v2;
}

UISlidingBarStateRequest *__60__UISplitViewControllerPanelImpl_panelControllerWillUpdate___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 208))
  {
    unint64_t v7 = *(void **)(v6 + 144);
    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      id v8 = [*(id *)(a1 + 40) traitCollection];
    }
    id v9 = v8;
    uint64_t v10 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v10 + 289))
    {
      double v13 = *(double *)(v10 + 160);
      double v15 = *(double *)(v10 + 168);
    }
    else
    {
      uint64_t v11 = [*(id *)(a1 + 40) _existingView];
      [v11 bounds];
      double v13 = v12;
      double v15 = v14;

      uint64_t v10 = *(void *)(a1 + 32);
    }
    if ([v9 isEqual:*(void *)(v10 + 184)])
    {
      uint64_t v16 = *(void *)(a1 + 32);
      if (v13 == *(double *)(v16 + 192) && v15 == *(double *)(v16 + 200))
      {
        if (a3)
        {
          *a3 = 1;
          uint64_t v16 = *(void *)(a1 + 32);
        }
        double v18 = (UISlidingBarStateRequest *)*(id *)(v16 + 208);
        goto LABEL_62;
      }
    }
  }
  if (a3) {
    *a3 = 0;
  }
  double v18 = objc_alloc_init(UISlidingBarStateRequest);
  [(UISlidingBarStateRequest *)v18 setUserInitiated:0];
  if (*(unsigned char *)(a1 + 48) || *(unsigned char *)(a1 + 49) || *(unsigned char *)(a1 + 50) || *(unsigned char *)(a1 + 51))
  {
    int v19 = [*(id *)(a1 + 32) _isPrimaryLeading];
    if (*(unsigned char *)(a1 + 48) || *(unsigned char *)(a1 + 50))
    {
      BOOL v20 = *(unsigned char **)(a1 + 32);
      double v21 = 0.0;
      if ((v20[288] & 1) != 0 && !*(unsigned char *)(a1 + 52))
      {
        unsigned __int8 v22 = [v20 panelController];
        double v23 = [v22 currentState];

        if (v19) {
          [v23 leadingWidth];
        }
        else {
          [v23 trailingWidth];
        }
        double v25 = v24;
        if (v24 > 0.0 || (double v25 = *(double *)(*(void *)(a1 + 32) + 296), v25 > 0.0))
        {
          if (v25 <= 0.0)
          {
            double v21 = v25;
          }
          else
          {
            double v26 = objc_alloc_init(UISlidingBarStateRequest);
            long long v27 = v26;
            if (v19)
            {
              [(UISlidingBarStateRequest *)v26 setLeadingWidth:v25];
              BOOL v28 = [(UISlidingBarStateRequest *)v27 _closestState:v5];
              [v28 leadingWidth];
            }
            else
            {
              [(UISlidingBarStateRequest *)v26 setTrailingWidth:v25];
              BOOL v28 = [(UISlidingBarStateRequest *)v27 _closestState:v5];
              [v28 trailingWidth];
            }
            double v21 = v29;
          }
        }
      }
      double v30 = minNonzeroPrimaryWidthInStates(v5, v19);
      if (v21 >= v30) {
        double v30 = v21;
      }
      if (v19)
      {
        if (*(unsigned char *)(a1 + 48))
        {
          [(UISlidingBarStateRequest *)v18 setLeadingWidth:v30];
        }
        else if (*(unsigned char *)(a1 + 52))
        {
          [(UISlidingBarStateRequest *)v18 setLeadingOffscreenWidth:v30];
        }
      }
      else if (*(unsigned char *)(a1 + 48))
      {
        [(UISlidingBarStateRequest *)v18 setTrailingWidth:v30];
      }
      else if (*(unsigned char *)(a1 + 52))
      {
        [(UISlidingBarStateRequest *)v18 setTrailingOffscreenWidth:v30];
      }
    }
    if (*(unsigned char *)(a1 + 49) || *(unsigned char *)(a1 + 51))
    {
      if (v19)
      {
        [(UISlidingBarStateRequest *)v18 leadingWidth];
        double v32 = v31;
        [(UISlidingBarStateRequest *)v18 leadingOffscreenWidth];
      }
      else
      {
        [(UISlidingBarStateRequest *)v18 trailingWidth];
        double v32 = v34;
        [(UISlidingBarStateRequest *)v18 trailingOffscreenWidth];
      }
      if (v32 >= v33) {
        double v33 = v32;
      }
      id v37 = 0;
      double MatchingState = minNonzeroSupplementaryWidthInStateWithPrimaryWidthGetMatchingState(v5, v19, &v37, v33);
      id v9 = v37;
      if (!*(unsigned char *)(a1 + 49)
        || ([(UISlidingBarStateRequest *)v18 setSupplementaryWidth:MatchingState],
            *(unsigned char *)(a1 + 52))
        && !*(unsigned char *)(a1 + 51))
      {
        [(UISlidingBarStateRequest *)v18 setSupplementaryOffscreenWidth:MatchingState];
      }
      [v9 mainWidth];
      -[UISlidingBarStateRequest setMainWidth:](v18, "setMainWidth:");
LABEL_62:
    }
  }

  return v18;
}

- (void)callDeprecatedWillHideDelegateCallbackIfNecessary
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int64_t v4 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v5 = [(UISplitViewControllerPanelImpl *)self style];
    if (v5)
    {
      unint64_t v6 = v5;
      unint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &callDeprecatedWillHideDelegateCallbackIfNecessary___s_category)+ 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = v7;
        id v9 = NSStringFromSelector(sel_splitViewController_willHideViewController_withBarButtonItem_forPopoverController_);
        uint64_t v10 = _UISplitViewControllerStyleDescription(v6);
        int v18 = 138543618;
        int v19 = v9;
        __int16 v20 = 2114;
        double v21 = v10;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v18, 0x16u);
      }
    }
    else
    {
      uint64_t v11 = [(UISplitViewControllerPanelImpl *)self displayModeButtonItem];
      double v12 = [v11 title];
      double v13 = (void *)[v12 copy];

      double v14 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];
      double v15 = [(UISplitViewControllerPanelImpl *)self displayModeButtonItem];
      [v4 splitViewController:WeakRetained willHideViewController:v14 withBarButtonItem:v15 forPopoverController:0];

      uint64_t v16 = [(UISplitViewControllerPanelImpl *)self displayModeButtonItem];
      double v17 = [v16 title];

      if (v13 != v17 && ([v13 isEqualToString:v17] & 1) == 0) {
        [(UISplitViewControllerPanelImpl *)self _setDisplayModeButtonItemTitle:v17];
      }
    }
  }
}

- (void)callDeprecatedWillShowDelegateCallbackIfNecessary
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int64_t v4 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v5 = [(UISplitViewControllerPanelImpl *)self style];
    if (v5)
    {
      unint64_t v6 = v5;
      unint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &callDeprecatedWillShowDelegateCallbackIfNecessary___s_category)+ 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = v7;
        id v9 = NSStringFromSelector(sel_splitViewController_willShowViewController_invalidatingBarButtonItem_);
        uint64_t v10 = _UISplitViewControllerStyleDescription(v6);
        int v13 = 138543618;
        double v14 = v9;
        __int16 v15 = 2114;
        uint64_t v16 = v10;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      uint64_t v11 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];
      double v12 = [(UISplitViewControllerPanelImpl *)self displayModeButtonItem];
      [v4 splitViewController:WeakRetained willShowViewController:v11 invalidatingBarButtonItem:v12];
    }
  }
}

- (int64_t)_lastSettledDisplayMode
{
  return self->_lastSettledDisplayMode;
}

- (id)primaryViewControllerForExpandingPanelController:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int64_t v5 = [WeakRetained delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_5:
    double v12 = 0;
    goto LABEL_6;
  }
  int64_t v6 = [(UISplitViewControllerPanelImpl *)self style];
  if (v6)
  {
    unint64_t v7 = v6;
    id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &primaryViewControllerForExpandingPanelController____s_category)+ 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = v8;
      uint64_t v10 = NSStringFromSelector(sel_primaryViewControllerForExpandingSplitViewController_);
      uint64_t v11 = _UISplitViewControllerStyleDescription(v7);
      int v14 = 138543618;
      __int16 v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_5;
  }
  double v12 = [v5 primaryViewControllerForExpandingSplitViewController:WeakRetained];
LABEL_6:

  return v12;
}

- (id)panelController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![(UISplitViewControllerPanelImpl *)self style])
  {
    id v16 = [(UISplitViewControllerPanelImpl *)self panelController:v7 unspecifiedStyleSeparateSecondaryViewControllerFromPrimaryViewController:v8];
    goto LABEL_29;
  }
  id v40 = v7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v10 = [WeakRetained delegate];

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  double v47 = __107__UISplitViewControllerPanelImpl_panelController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke;
  double v48 = &unk_1E52E9BE8;
  id v11 = v10;
  id v49 = v11;
  char v50 = self;
  __107__UISplitViewControllerPanelImpl_panelController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke((uint64_t)v46, sel__splitViewControllerIsPrimaryVisible_);
  v47((uint64_t)v46, sel_splitViewController_separateSecondaryViewControllerFromPrimaryViewController_);
  char v12 = objc_opt_respondsToSelector();
  if (v12 & 1) != 0 || (objc_opt_respondsToSelector())
  {
    int64_t v13 = [(UISplitViewControllerPanelImpl *)self _concreteDisplayModeForCurrentEnvironment];
    int64_t v45 = v13;
    *(void *)&self->_flags |= 0x28000000uLL;
    id v14 = objc_loadWeakRetained((id *)&self->_svc);
    if (v12)
    {
      uint64_t v15 = [v11 splitViewController:v14 displayModeForExpandingToProposedDisplayMode:v13];
      int64_t v45 = v15;
    }
    else
    {
      [v11 splitViewController:v14 willExpandToProposedDisplayMode:&v45];

      uint64_t v15 = v45;
    }
    *(void *)&self->_flags &= 0xFFFFFFFFD7FFFFFFLL;
    if (v15 != v13)
    {
      if (v15)
      {
        [(UISplitViewControllerPanelImpl *)self setUserGeneratedDisplayMode:v15];
        BOOL v17 = [(UISplitViewControllerPanelImpl *)self presentsWithGesture];
        $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
        uint64_t v19 = 64;
        if (v17 | (*(unint64_t *)&flags >> 20) & 1) {
          uint64_t v19 = 0;
        }
        self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(v19 | *(void *)&flags & 0xFFFFFFFFFFFFFFBFLL);
      }
    }
  }
  __int16 v20 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
  double v21 = [v20 navigationControllerWrapper];
  uint64_t v22 = v21;
  id v39 = v8;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    long long v27 = [v20 navigationController];
    if (v27)
    {
      id v24 = v27;
      double v25 = [v24 _outermostNavigationController];
      double v26 = v24;
      goto LABEL_18;
    }
    id v23 = [v20 viewController];
  }
  id v24 = v23;
  double v25 = [v23 navigationController];
  double v26 = 0;
LABEL_18:
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __107__UISplitViewControllerPanelImpl_panelController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke_448;
  v41[3] = &unk_1E52DCB30;
  id v28 = v25;
  id v42 = v28;
  id v29 = v24;
  id v43 = v29;
  double v44 = self;
  [v28 _executeSplitViewControllerActions:v41];
  if (v29
    && -[UISplitViewControllerPanelImpl _columnForViewController:forceExpandedResult:]((id *)&self->super.isa, v29, 1) != 2)
  {
    double v38 = [MEMORY[0x1E4F28B00] currentHandler];
    id v35 = objc_loadWeakRetained((id *)&self->_svc);
    unint64_t v36 = -[UISplitViewControllerPanelImpl _columnForViewController:forceExpandedResult:]((id *)&self->super.isa, v29, 1);
    id v37 = _UISplitViewControllerColumnDescription(v36);
    [v38 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 6607, @"Unexpected view controller change when expanding %@. Found %@ in %@ column instead of in secondary column. _perColumnViewControllers are %@", v35, v29, v37, self->_perColumnViewControllers object file lineNumber description];
  }
  if (![v22 _isTabBarController]) {
    goto LABEL_27;
  }
  double v30 = [v22 selectedViewController];
  uint64_t v31 = [v20 navigationController];
  if (v30 == (void *)v31)
  {

    goto LABEL_26;
  }
  double v32 = (void *)v31;
  double v33 = [v20 viewController];

  if (v30 == v33)
  {
LABEL_26:

LABEL_27:
    [(UISplitViewControllerPanelImpl *)self updatePanelControllerForViewControllerChangeInColumn:2];
    goto LABEL_28;
  }
  [(UISplitViewControllerPanelImpl *)self setViewController:v22 forColumn:2];

LABEL_28:
  id v16 = v29;

  id v8 = v39;
  id v7 = v40;
LABEL_29:

  return v16;
}

void __107__UISplitViewControllerPanelImpl_panelController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [*(id *)(a1 + 40) style];
    if (v4)
    {
      unint64_t v5 = v4;
      int64_t v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &kSplitViewControllerInterfaceOrientationKey_block_invoke_2___s_category)+ 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = v6;
        id v8 = NSStringFromSelector(a2);
        id v9 = _UISplitViewControllerStyleDescription(v5);
        int v10 = 138543618;
        id v11 = v8;
        __int16 v12 = 2114;
        int64_t v13 = v9;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

void __107__UISplitViewControllerPanelImpl_panelController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke_448(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 16));
  id v3 = (id)[v1 _separateViewControllersAfterAndIncludingViewController:v2 forSplitViewController:WeakRetained];
}

- (id)panelController:(id)a3 separateSupplementaryViewControllerFromPrimaryViewController:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (uint64_t (*)(uint64_t, uint64_t))a4;
  if ([(UISplitViewControllerPanelImpl *)self style] == 2
    && ([(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20], id v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    int v10 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
    id v11 = [v10 viewController];

    __int16 v12 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
    int64_t v13 = [v12 navigationController];

    if (v11 != v8 && v13 != v8)
    {
      uint64_t v14 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A38];
      uint64_t v15 = [v14 viewController];

      if (v15 != v8)
      {
        if (os_variant_has_internal_diagnostics())
        {
          id v39 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
          {
            id v40 = NSStringFromSelector(a2);
            *(_DWORD *)long long buf = 138413058;
            *(void *)&uint8_t buf[4] = v8;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v40;
            *(_WORD *)&buf[22] = 2112;
            double v56 = v11;
            LOWORD(v57) = 2112;
            *(void *)((char *)&v57 + 2) = v13;
            _os_log_fault_impl(&dword_1853B0000, v39, OS_LOG_TYPE_FAULT, "Ignoring unexpected UIViewController, %@, passed to %@. Expected %@ or %@. This is an internal UISplitViewController problem.", buf, 0x2Au);
          }
        }
        else
        {
          id v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260138) + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            BOOL v17 = v16;
            uint64_t v18 = NSStringFromSelector(a2);
            *(_DWORD *)long long buf = 138413058;
            *(void *)&uint8_t buf[4] = v8;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v18;
            *(_WORD *)&buf[22] = 2112;
            double v56 = v11;
            LOWORD(v57) = 2112;
            *(void *)((char *)&v57 + 2) = v13;
            _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Ignoring unexpected UIViewController, %@, passed to %@. Expected %@ or %@. This is an internal UISplitViewController problem.", buf, 0x2Au);
          }
        }
      }
    }
    if (!v13)
    {
      uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      [v31 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 6631, @"Lost track of navigation controller for %@ column when expanding %@", @"Primary", WeakRetained object file lineNumber description];
    }
    uint64_t v19 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
    __int16 v20 = [v19 viewController];

    double v21 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
    uint64_t v22 = [v21 navigationController];

    if (!v22)
    {
      double v33 = [MEMORY[0x1E4F28B00] currentHandler];
      id v34 = objc_loadWeakRetained((id *)&self->_svc);
      [v33 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 6634, @"Lost track of navigation controller for %@ column when expanding %@", @"Supplementary", v34 object file lineNumber description];
    }
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    double v56 = __Block_byref_object_copy__60;
    *(void *)&long long v57 = __Block_byref_object_dispose__60;
    *((void *)&v57 + 1) = 0;
    uint64_t v43 = MEMORY[0x1E4F143A8];
    uint64_t v44 = 3221225472;
    int64_t v45 = __111__UISplitViewControllerPanelImpl_panelController_separateSupplementaryViewControllerFromPrimaryViewController___block_invoke;
    double v46 = &unk_1E52E9B00;
    char v50 = buf;
    id v23 = v13;
    double v47 = v23;
    id v24 = v22;
    id v48 = v24;
    id v49 = self;
    [v23 _executeSplitViewControllerActions:&v43];
    uint64_t v25 = *(void *)(*(void *)&buf[8] + 40);
    if (!v25)
    {
      double v26 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
      uint64_t v27 = [v26 navigationController];
      id v28 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v27;

      uint64_t v25 = *(void *)(*(void *)&buf[8] + 40);
    }
    if ([(UISplitViewControllerPanelImpl *)self _columnForViewController:v25] != 1)
    {
      id v35 = [MEMORY[0x1E4F28B00] currentHandler];
      id v36 = objc_loadWeakRetained((id *)&self->_svc);
      [v35 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 6645, @"Unexpected view controller change in %@ column for expanding %@", @"Supplementary", v36, v43, v44, v45, v46, v47 object file lineNumber description];
    }
    [(UISplitViewControllerPanelImpl *)self updatePanelControllerForViewControllerChangeInColumn:1];
    if (*(id *)(*(void *)&buf[8] + 40) != v24)
    {
      if (os_variant_has_internal_diagnostics())
      {
        BOOL v41 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        {
          uint64_t v42 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)double v51 = 138412546;
          id v52 = v24;
          __int16 v53 = 2112;
          uint64_t v54 = v42;
          _os_log_fault_impl(&dword_1853B0000, v41, OS_LOG_TYPE_FAULT, "Unexpected vc popped when separating supplementary view controller. expected %@; popped %@",
            v51,
            0x16u);
        }
      }
      else
      {
        id v37 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260140) + 8);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          uint64_t v38 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)double v51 = 138412546;
          id v52 = v24;
          __int16 v53 = 2112;
          uint64_t v54 = v38;
          _os_log_impl(&dword_1853B0000, v37, OS_LOG_TYPE_ERROR, "Unexpected vc popped when separating supplementary view controller. expected %@; popped %@",
            v51,
            0x16u);
        }
      }
    }
    id v29 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

void __111__UISplitViewControllerPanelImpl_panelController_separateSupplementaryViewControllerFromPrimaryViewController___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 16));
  uint64_t v4 = [v2 _separateViewControllersAfterAndIncludingViewController:v3 forSplitViewController:WeakRetained];
  uint64_t v5 = [v4 firstObject];
  uint64_t v6 = *(void *)(a1[7] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)panelController:(id)a3 unspecifiedStyleSeparateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(UISplitViewControllerPanelImpl *)self _stopTransitionsInViewController:v5];
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v8 = [WeakRetained delegate];
  *(unsigned char *)&self->_$9BB867E6ECA1797B07F6783540CA8F02 transitioningFlags = *(unsigned char *)&self->_transitioningFlags & 0xFE | objc_opt_respondsToSelector() & 1;

  if (*(unsigned char *)&self->_transitioningFlags)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_svc);
    int v10 = [v9 delegate];
    id v11 = objc_loadWeakRetained((id *)&self->_svc);
    if ([v10 _splitViewControllerIsPrimaryVisible:v11]) {
      char v12 = 2;
    }
    else {
      char v12 = 0;
    }
    *(unsigned char *)&self->_$9BB867E6ECA1797B07F6783540CA8F02 transitioningFlags = *(unsigned char *)&self->_transitioningFlags & 0xFD | v12;
  }
  else
  {
    *(unsigned char *)&self->_transitioningFlags &= ~2u;
  }
  id v13 = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v14 = [v13 delegate];
  if (self->_suspendedState == 2
    && ($9BB867E6ECA1797B07F6783540CA8F02 transitioningFlags = self->_transitioningFlags, (*(unsigned char *)&transitioningFlags & 1) != 0))
  {
    int v16 = (*(unsigned int *)&transitioningFlags >> 1) & 1;
    int v17 = 1;
  }
  else
  {
    int v16 = 0;
    int v17 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v19 = 0;
LABEL_16:
    id v22 = objc_loadWeakRetained((id *)&self->_svc);
    double v21 = [v5 separateSecondaryViewControllerForSplitViewController:v22];

    goto LABEL_17;
  }
  id v18 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v19 = [v18 splitViewController:v13 separateSecondaryViewControllerFromPrimaryViewController:v5];

  if (!v19) {
    goto LABEL_16;
  }
  id v20 = [v19 parentViewController];

  double v21 = v19;
  if (v20 == v5) {
    goto LABEL_16;
  }
LABEL_17:
  if (self->_suspendedState == 2)
  {
    BOOL v23 = v21 == 0;
    if (v17) {
      BOOL v23 = v16;
    }
    BOOL v24 = !v23;
    int64_t v25 = 3;
    if (v24) {
      int64_t v25 = 4;
    }
    self->_int64_t suspendedState = v25;
  }
  if (v21) {
    goto LABEL_26;
  }
  double v26 = [(UISplitViewControllerPanelImpl *)self panelController];
  double v21 = [v26 preservedDetailController];

  if (v21
    || ([(UISplitViewControllerPanelImpl *)self panelController],
        uint64_t v27 = objc_claimAutoreleasedReturnValue(),
        [v27 mainViewController],
        double v21 = objc_claimAutoreleasedReturnValue(),
        v27,
        v21))
  {
LABEL_26:
    id v35 = v5;
    id v36 = v21;
    id v28 = (void *)MEMORY[0x1E4F1C978];
    id v29 = &v35;
    uint64_t v30 = 2;
  }
  else
  {
    id v34 = v5;
    id v28 = (void *)MEMORY[0x1E4F1C978];
    id v29 = &v34;
    uint64_t v30 = 1;
  }
  uint64_t v31 = objc_msgSend(v28, "arrayWithObjects:count:", v29, v30, v34, v35, v36, v37);
  id v32 = objc_loadWeakRetained((id *)p_svc);
  [v32 setViewControllers:v31];

  return v21;
}

- (void)panelControllerDidExpand:(id)a3
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v12 = [WeakRetained delegate];

  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
    id v7 = [v6 navigationController];

    id v8 = [v7 topViewController];
    id v9 = [v8 navigationItem];
    int v10 = [v9 _searchControllerIfAllowed];

    [v10 _updateHasPendingSuggestionMenuRefreshFlagForReason:3];
    *(void *)&self->_flags |= 0x40000000uLL;
  }
  if (objc_opt_respondsToSelector())
  {
    id v11 = objc_loadWeakRetained((id *)p_svc);
    [v12 splitViewControllerDidExpand:v11];
  }
}

- (CGSize)_predictedDetailSizeForPredictedEndState:(id)a3
{
  id v4 = a3;
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v7 = [WeakRetained view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  BOOL v12 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
  if (v12)
  {
    if ([v4 leadingOverlapsMain]) {
      goto LABEL_10;
    }
    [v4 leadingWidth];
  }
  else
  {
    if ([v4 trailingOverlapsMain]) {
      goto LABEL_10;
    }
    [v4 trailingWidth];
  }
  double v14 = v13;
  uint64_t v15 = [(UISplitViewControllerPanelImpl *)self panelController];
  int v16 = [v15 configuration];

  id v17 = objc_loadWeakRetained((id *)p_svc);
  id v18 = [v17 view];
  uint64_t v19 = [v18 window];
  id v20 = [v19 screen];
  [v20 scale];
  double v22 = v21;

  if (v12) {
    [v16 leadingBorderWidthForScale:v22];
  }
  else {
    [v16 trailingBorderWidthForScale:v22];
  }
  double v9 = v9 - (v14 + v23);

LABEL_10:
  double v24 = v9;
  double v25 = v11;
  result.double height = v25;
  result.CGFloat width = v24;
  return result;
}

- (id)panelController:(id)a3 willBeginAnimatedTransitionToStateRequest:(id)a4 predictedEndState:(id)a5 predictedDuration:(double)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v12 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v13 = [(UISplitViewControllerPanelImpl *)self style];
    if (v13)
    {
      unint64_t v14 = v13;
      uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &qword_1EB260148) + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = v15;
        id v17 = NSStringFromSelector(sel__splitViewController_willBeginAnimatedTransitionToStateRequest_);
        id v18 = _UISplitViewControllerStyleDescription(v14);
        int v33 = 138543618;
        id v34 = v17;
        __int16 v35 = 2114;
        id v36 = v18;
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v33, 0x16u);
      }
    }
    else
    {
      [v12 _splitViewController:WeakRetained willBeginAnimatedTransitionToStateRequest:v9];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    int64_t v19 = [(UISplitViewControllerPanelImpl *)self style];
    if (v19)
    {
      unint64_t v20 = v19;
      double v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &qword_1EB260150) + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        double v22 = v21;
        double v23 = NSStringFromSelector(sel__splitViewController_willBeginAnimatedTransitionToStateRequest_predictedDetailSize_predictedDuration_);
        double v24 = _UISplitViewControllerStyleDescription(v20);
        int v33 = 138543618;
        id v34 = v23;
        __int16 v35 = 2114;
        id v36 = v24;
        _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v33, 0x16u);
      }
    }
    else
    {
      [(UISplitViewControllerPanelImpl *)self _predictedDetailSizeForPredictedEndState:v10];
      double v26 = v25;
      double v28 = v27;
      id v29 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v12, "_splitViewController:willBeginAnimatedTransitionToStateRequest:predictedDetailSize:predictedDuration:", v29, v9, v26, v28, a6);
    }
  }
  self->_int64_t animatingToDisplayMode = [(UISplitViewControllerPanelImpl *)self _displayModeForState:v10];
  if (objc_opt_respondsToSelector())
  {
    id v30 = objc_loadWeakRetained((id *)&self->_svc);
    uint64_t v31 = objc_msgSend(v12, "_splitViewController:animationControllerForTransitionFromDisplayMode:toDisplayMode:", v30, -[UISplitViewControllerPanelImpl displayMode](self, "displayMode"), -[UISplitViewControllerPanelImpl _displayModeForState:](self, "_displayModeForState:", v10));
  }
  else
  {
    uint64_t v31 = 0;
  }

  return v31;
}

- (void)panelController:(id)a3 animateTransitionToStateRequest:(id)a4 predictedEndState:(id)a5 predictedDuration:(double)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v12 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v13 = [(UISplitViewControllerPanelImpl *)self style];
    if (v13)
    {
      unint64_t v14 = v13;
      uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &panelController_animateTransitionToStateRequest_predictedEndState_predictedDuration____s_category)+ 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = v15;
        id v17 = NSStringFromSelector(sel__splitViewController_animateTransitionToStateRequest_detailSize_duration_);
        id v18 = _UISplitViewControllerStyleDescription(v14);
        int v21 = 138543618;
        double v22 = v17;
        __int16 v23 = 2114;
        double v24 = v18;
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v21, 0x16u);
      }
    }
    else
    {
      [(UISplitViewControllerPanelImpl *)self _predictedDetailSizeForPredictedEndState:v9];
      objc_msgSend(v12, "_splitViewController:animateTransitionToStateRequest:detailSize:duration:", WeakRetained, v8);
    }
  }
  id v19 = objc_loadWeakRetained((id *)p_svc);
  [v19 setNeedsStatusBarAppearanceUpdate];

  id v20 = objc_loadWeakRetained((id *)p_svc);
  [v20 setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
}

- (void)panelController:(id)a3 didEndAnimatedTransitionToStateRequest:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v7 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v8 = [(UISplitViewControllerPanelImpl *)self style];
    if (v8)
    {
      unint64_t v9 = v8;
      id v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISplitViewController", &panelController_didEndAnimatedTransitionToStateRequest____s_category)+ 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        double v11 = v10;
        BOOL v12 = NSStringFromSelector(sel__splitViewController_didEndAnimatedTransitionToStateRequest_);
        int64_t v13 = _UISplitViewControllerStyleDescription(v9);
        int v14 = 138543618;
        uint64_t v15 = v12;
        __int16 v16 = 2114;
        id v17 = v13;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Skipping delegate callback, %{public}@. Unsupported for UISplitViewController style %{public}@", (uint8_t *)&v14, 0x16u);
      }
    }
    else
    {
      [v7 _splitViewController:WeakRetained didEndAnimatedTransitionToStateRequest:v5];
    }
  }
  self->_int64_t animatingToDisplayMode = 0;
}

- (void)panelController:(id)a3 willBeginAnimationToPrimarySize:(CGSize)a4 supplementarySize:(CGSize)a5 secondarySize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double v8 = a5.height;
  double v9 = a5.width;
  double v10 = a4.height;
  double v11 = a4.width;
  unint64_t v14 = [(UISplitViewControllerPanelImpl *)self style];
  if (v14 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v54 = [MEMORY[0x1E4F28B00] currentHandler];
    id v55 = _UISplitViewControllerStyleDescription(v14);
    [v54 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 6903, @"Incorrect code path for UISplitViewControllerStyle %@", v55 object file lineNumber description];
  }
  uint64_t v15 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
  __int16 v16 = [v15 navigationControllerWrapper];
  id v17 = v16;
  if (v16)
  {
    id v56 = v16;
  }
  else
  {
    uint64_t v18 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
    id v19 = [v18 navigationController];
    id v20 = v19;
    if (v19)
    {
      id v56 = v19;
    }
    else
    {
      int v21 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
      id v56 = [v21 viewController];
    }
  }

  double v22 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
  __int16 v23 = [v22 navigationController];
  double v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    double v26 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
    id v25 = [v26 viewController];
  }
  double v27 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
  double v28 = [v27 navigationControllerWrapper];
  id v29 = v28;
  if (v28)
  {
    id v30 = v28;
  }
  else
  {
    uint64_t v31 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
    id v32 = [v31 navigationController];
    int v33 = v32;
    if (v32)
    {
      id v30 = v32;
    }
    else
    {
      id v34 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A08];
      id v30 = [v34 viewController];
    }
  }

  __int16 v35 = [(UISplitViewControllerPanelImpl *)self transitionCoordinator];
  id v36 = v35;
  if (v35)
  {
    id v37 = v35;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    id v37 = [WeakRetained _definiteTransitionCoordinator];
  }
  id v39 = [v56 _existingView];
  [v39 bounds];
  double v41 = v40;
  double v43 = v42;

  if (v11 != v41 || v10 != v43) {
    objc_msgSend(v56, "viewWillTransitionToSize:withTransitionCoordinator:", v37, v11, v10);
  }
  if (v14 == 2)
  {
    uint64_t v44 = [v25 _existingView];
    [v44 bounds];
    double v46 = v45;
    double v48 = v47;

    if (v9 != v46 || v8 != v48) {
      objc_msgSend(v25, "viewWillTransitionToSize:withTransitionCoordinator:", v37, v9, v8);
    }
  }
  id v49 = [v30 _existingView];
  [v49 bounds];
  double v51 = v50;
  double v53 = v52;

  if (width != v51 || height != v53) {
    objc_msgSend(v30, "viewWillTransitionToSize:withTransitionCoordinator:", v37, width, height);
  }
}

- (void)panelController:(id)a3 adjustLeadingViewController:(id)a4 forKeyboardInfo:(id)a5
{
  id v7 = a4;
  id v6 = a5;
  if (objc_opt_respondsToSelector()) {
    [v7 _adjustNonOverlayScrollViewsForKeyboardInfo:v6];
  }
}

- (void)panelController:(id)a3 adjustTrailingViewController:(id)a4 forKeyboardInfo:(id)a5
{
  id v7 = a4;
  id v6 = a5;
  if (objc_opt_respondsToSelector()) {
    [v7 _adjustNonOverlayScrollViewsForKeyboardInfo:v6];
  }
}

- (BOOL)_wantsSideBarImageForOneOverSecondary
{
  int64_t v4 = [(UISplitViewControllerPanelImpl *)self style];
  unint64_t v5 = v4;
  if ((unint64_t)(v4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    double v9 = _UISplitViewControllerStyleDescription(v5);
    [v8 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 6947, @"Incorrect code path for UISplitViewControllerStyle %@", v9 object file lineNumber description];
  }
  else if (v4 == 2)
  {
    id v6 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
    if (v6)
    {
      char v7 = 0;
LABEL_12:

      return v7;
    }
  }
  if ((*((unsigned char *)&self->_flags + 2) & 2) != 0
    && (sidebarToggleButtonItem = self->_sidebarToggleButtonItem) != 0
    && ![(UIBarButtonItem *)sidebarToggleButtonItem isHidden])
  {
    BOOL v12 = [(UIBarButtonItem *)self->_sidebarToggleButtonItem image];
    int64_t v13 = [(UISplitViewControllerPanelImpl *)self _sidebarToggleSymbolImage];
    char v7 = [v12 isEqual:v13];
  }
  else
  {
    char v7 = 0;
  }
  if (v5 == 2)
  {
    id v6 = 0;
    goto LABEL_12;
  }
  return v7;
}

- (BOOL)_unspecifiedStyleGestureRecognizerShouldBegin:(id)a3
{
  id v5 = a3;
  int64_t v6 = [(UISplitViewControllerPanelImpl *)self style];
  if (v6)
  {
    unint64_t v23 = v6;
    double v24 = [MEMORY[0x1E4F28B00] currentHandler];
    id v25 = _UISplitViewControllerStyleDescription(v23);
    [v24 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 6997, @"Incorrect code path for UISplitViewControllerStyle %@", v25 object file lineNumber description];
  }
  id v7 = [(UISplitViewControllerPanelImpl *)self _presentationGestureRecognizer];

  if (v7 == v5)
  {
    id WeakRetained = [v5 view];
    if ([(UISplitViewControllerPanelImpl *)self _isPrimaryShown])
    {
      [v5 locationInView:WeakRetained];
      double v11 = objc_msgSend(WeakRetained, "hitTest:withEvent:", 0);
      if (!v11)
      {
        LOBYTE(v9) = 0;
LABEL_27:

        goto LABEL_28;
      }
      BOOL v12 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];
      int64_t v13 = [v12 view];
      int v9 = [v11 isDescendantOfView:v13] ^ 1;
    }
    else
    {
      [v5 translationInView:WeakRetained];
      double v15 = v14;
      BOOL v16 = [(UISplitViewControllerPanelImpl *)self _layoutPrimaryOnRight];
      if (v16) {
        uint64_t v17 = 8;
      }
      else {
        uint64_t v17 = 2;
      }
      if (v16) {
        BOOL v18 = v15 < 0.0;
      }
      else {
        BOOL v18 = v15 > 0.0;
      }
      if (!v18)
      {
        LOBYTE(v9) = 0;
        goto LABEL_28;
      }
      [v5 locationInView:WeakRetained];
      double v11 = objc_msgSend(WeakRetained, "hitTest:withEvent:", 0);
      uint64_t v19 = [v11 _scroller];
      if (!v19)
      {
        LOBYTE(v9) = 1;
        goto LABEL_27;
      }
      BOOL v12 = (void *)v19;
      while (([v12 isDecelerating] & 1) == 0
           && ([v12 _currentlyAbuttedContentEdges] & v17) != 0)
      {
        id v20 = [v12 superview];
        uint64_t v21 = [v20 _scroller];

        BOOL v12 = (void *)v21;
        if (!v21)
        {
          LOBYTE(v9) = 1;
          goto LABEL_26;
        }
      }
      LOBYTE(v9) = 0;
    }
LABEL_26:

    goto LABEL_27;
  }
  id v8 = [(UISplitViewControllerPanelImpl *)self _menuGestureRecognizer];

  if (v8 == v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    LOBYTE(v9) = [WeakRetained displayMode] == 1;
LABEL_28:

    goto LABEL_29;
  }
  LOBYTE(v9) = 0;
LABEL_29:

  return v9;
}

- (BOOL)_configurationPermitsFluidOpenGestureWithPrimaryShown:(BOOL)a3 supplementaryShown:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v8 = [(UISplitViewControllerPanelImpl *)self style];
  if (v8 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    int64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    double v14 = _UISplitViewControllerStyleDescription(v8);
    [v13 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 7039, @"Incorrect code path for UISplitViewControllerStyle %@", v14 object file lineNumber description];

    if (a3) {
      goto LABEL_4;
    }
  }
  else if (a3)
  {
    goto LABEL_4;
  }
  if (!v4) {
    return 1;
  }
LABEL_4:
  if (v8 == 2)
  {
    int v9 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

    if (v9) {
      return 1;
    }
  }
  if ([(UISplitViewControllerPanelImpl *)self splitBehavior] == 2) {
    return 1;
  }
  if ((*((unsigned char *)&self->_flags + 2) & 2) == 0) {
    return 0;
  }
  int64_t v11 = [(UISplitViewControllerPanelImpl *)self userGeneratedDisplayMode];
  return v11 == 3 || v11 == 5;
}

- (BOOL)_configurationPermitsFluidCloseGestureWithPrimaryShown:(BOOL)a3 supplementaryShown:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unint64_t v8 = [(UISplitViewControllerPanelImpl *)self style];
  if (v8 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v13 = _UISplitViewControllerStyleDescription(v8);
    [v12 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 7052, @"Incorrect code path for UISplitViewControllerStyle %@", v13 object file lineNumber description];

    if (!v5) {
      goto LABEL_4;
    }
  }
  else if (!v5)
  {
    goto LABEL_4;
  }
  if (v4) {
    return 1;
  }
LABEL_4:
  if (!v5 && !v4) {
    return 0;
  }
  if (v8 == 2)
  {
    [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
  }
  if ([(UISplitViewControllerPanelImpl *)self splitBehavior] == 2) {
    return 1;
  }
  if ((*((unsigned char *)&self->_flags + 2) & 2) == 0) {
    return 0;
  }
  int64_t v10 = [(UISplitViewControllerPanelImpl *)self userGeneratedDisplayMode];
  return v10 == 3 || v10 == 5;
}

- (int64_t)_columnForView:(id)a3 getIsContent:(BOOL *)a4
{
  int64_t v6 = [a3 _viewControllerForAncestor];
  if (v6)
  {
    int64_t v7 = [(UISplitViewControllerPanelImpl *)self _columnForViewController:v6];
    int64_t v8 = v7;
    if (a4 && v7 != 999)
    {
      perColumnViewControllers = self->_perColumnViewControllers;
      int64_t v10 = [NSNumber numberWithInteger:v7];
      int64_t v11 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:v10];
      BOOL v12 = [v11 navigationController];
      if (v6 == v12)
      {
        BOOL v17 = 0;
      }
      else
      {
        int64_t v13 = self->_perColumnViewControllers;
        double v14 = [NSNumber numberWithInteger:v8];
        double v15 = [(NSMutableDictionary *)v13 objectForKeyedSubscript:v14];
        BOOL v16 = [v15 navigationControllerWrapper];
        BOOL v17 = v6 != v16;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int64_t v8 = 999;
  }
  if (a4)
  {
    BOOL v17 = 0;
LABEL_11:
    *a4 = v17;
  }

  return v8;
}

- (BOOL)_fluidGestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if (![(UISplitViewControllerPanelImpl *)self _isCollapsed])
  {
    id v5 = [(UISplitViewControllerPanelImpl *)self _fluidOpenSidebarPresentationGestureRecognizer];

    if (v5 == v4)
    {
      BOOL v7 = 1;
      goto LABEL_15;
    }
    id v6 = [(UISplitViewControllerPanelImpl *)self _fluidSidebarPresentationGestureRecognizer];

    if (v6 == v4)
    {
      id v8 = v4;
      int v9 = [v8 view];
      [v8 translationInView:v9];
      if (v10 == 0.0) {
        goto LABEL_13;
      }
      double v12 = v10;
      if (fabs(v10) <= fabs(v11)) {
        goto LABEL_13;
      }
      unint64_t v13 = [(UISplitViewControllerPanelImpl *)self _effectivePrimaryRectEdge];
      if (v13 == 2) {
        BOOL v14 = v12 < 0.0;
      }
      else {
        BOOL v14 = v12 > 0.0;
      }
      BOOL v15 = [(UISplitViewControllerPanelImpl *)self _isPrimaryShown];
      BOOL v16 = [(UISplitViewControllerPanelImpl *)self panelController];
      BOOL v17 = [v16 currentState];
      uint64_t v18 = [v17 isSupplementaryVisible];

      if (v14)
      {
        if (![(UISplitViewControllerPanelImpl *)self _configurationPermitsFluidCloseGestureWithPrimaryShown:v15 supplementaryShown:v18])
        {
LABEL_13:
          LODWORD(v18) = 0;
LABEL_14:

          BOOL v7 = v18 != 0;
          goto LABEL_15;
        }
      }
      else if (![(UISplitViewControllerPanelImpl *)self _configurationPermitsFluidOpenGestureWithPrimaryShown:v15 supplementaryShown:v18])
      {
        goto LABEL_13;
      }
      id v20 = [v8 _activeEventOfType:10];

      if (v20)
      {
        LODWORD(v18) = 1;
      }
      else
      {
        [v8 locationInView:v9];
        uint64_t v21 = objc_msgSend(v9, "hitTest:withEvent:", 0);
        char v39 = 0;
        int64_t v22 = [(UISplitViewControllerPanelImpl *)self _columnForView:v21 getIsContent:&v39];
        if (!v39) {
          goto LABEL_22;
        }
        if ((*((unsigned char *)&self->_flags + 5) & 1) == 0) {
          goto LABEL_23;
        }
        int64_t v23 = v22;
        [(UISplitViewControllerPanelImpl *)self _columnStyleDelegate];
        v24 = id v32 = v21;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
        LODWORD(v23) = [v24 _splitViewController:WeakRetained allowInteractivePresentationGesture:v8 inContentsOfColumn:v23];

        uint64_t v21 = v32;
        if (v23)
        {
LABEL_22:
          LODWORD(v18) = ![(UISplitViewControllerPanelImpl *)self _scrollViewPreventsGestureForHitView:v21];
        }
        else
        {
LABEL_23:
          if (v13 == 2) {
            uint64_t v26 = 8;
          }
          else {
            uint64_t v26 = 2;
          }
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          id v34 = __69__UISplitViewControllerPanelImpl__fluidGestureRecognizerShouldBegin___block_invoke;
          __int16 v35 = &unk_1E52E9C10;
          id v36 = self;
          id v37 = v8;
          uint64_t v38 = v26;
          if (v18) {
            LODWORD(v18) = __69__UISplitViewControllerPanelImpl__fluidGestureRecognizerShouldBegin___block_invoke((uint64_t)v33, 1);
          }
          if (v18) {
            BOOL v27 = 0;
          }
          else {
            BOOL v27 = v15;
          }
          if (v27) {
            LODWORD(v18) = ((uint64_t (*)(void *, void))v34)(v33, 0);
          }
        }
        if ((*((unsigned char *)&self->_flags + 5) & 2) != 0)
        {
          double v28 = [(UISplitViewControllerPanelImpl *)self _columnStyleDelegate];
          id v29 = objc_loadWeakRetained((id *)&self->_svc);
          if (v18) {
            uint64_t v30 = 1;
          }
          else {
            uint64_t v30 = 2;
          }
          uint64_t v31 = [v28 _splitViewController:v29 overrideProposedPermission:v30 forInteractivePresentationGesture:v8 inView:v21];

          if (v31) {
            LODWORD(v18) = v31 == 1;
          }
        }
      }
      goto LABEL_14;
    }
  }
  BOOL v7 = 0;
LABEL_15:

  return v7;
}

BOOL __69__UISplitViewControllerPanelImpl__fluidGestureRecognizerShouldBegin___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = [NSNumber numberWithInteger:a2];
  id v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = [v5 viewController];
  BOOL v7 = [v6 view];

  [*(id *)(a1 + 40) locationInView:v7];
  double v9 = v8;
  [v7 bounds];
  if (*(void *)(a1 + 48) == 2) {
    double MinX = CGRectGetMinX(*(CGRect *)&v10);
  }
  else {
    double MinX = CGRectGetMaxX(*(CGRect *)&v10);
  }
  BOOL v15 = v9 <= MinX + 22.0 && v9 >= MinX + -22.0;

  return v15;
}

- (BOOL)_allowMoveToSecondaryOnlyGetIsInForcedOverlayFromGestureOrRestrictedWidth:(BOOL *)a3
{
  $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0 && (*(void *)&flags & 0xC0000) != 0x80000)
  {
LABEL_5:
    int64_t v10 = [(UISplitViewControllerPanelImpl *)self defaultDisplayModeForSplitBehavior:[(UISplitViewControllerPanelImpl *)self splitBehavior]];
    BOOL v7 = 0;
    BOOL result = v10 == 1;
LABEL_6:
    if (!a3) {
      return result;
    }
    goto LABEL_7;
  }
  int64_t v6 = [(UISplitViewControllerPanelImpl *)self userGeneratedDisplayMode];
  BOOL v7 = 1;
  if (v6 != 3)
  {
    int64_t v8 = v6;
    BOOL result = 1;
    if (v8 == 5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL result = 1;
  if (!a3) {
    return result;
  }
LABEL_7:
  *a3 = v7;
  return result;
}

- (BOOL)_scrollViewPreventsGestureForHitView:(id)a3
{
  uint64_t v4 = [a3 _scroller];
  if (!v4) {
    return 0;
  }
  id v5 = (void *)v4;
  while (([v5 isDecelerating] & 1) == 0)
  {
    uint64_t v6 = [v5 _currentlyAbuttedContentEdges];
    uint64_t v7 = [(UISplitViewControllerPanelImpl *)self _layoutPrimaryOnRight] ? 8 : 2;
    if ((v7 & v6) == 0) {
      break;
    }
    int64_t v8 = [v5 superview];
    uint64_t v9 = [v8 _scroller];

    id v5 = (void *)v9;
    if (!v9)
    {
      BOOL v10 = 0;
      goto LABEL_11;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if (![(UISplitViewControllerPanelImpl *)self style])
  {
    BOOL v7 = [(UISplitViewControllerPanelImpl *)self _unspecifiedStyleGestureRecognizerShouldBegin:v4];
    goto LABEL_7;
  }
  id v5 = [(UISplitViewControllerPanelImpl *)self _menuGestureRecognizer];

  if (v5 == v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    BOOL v8 = [WeakRetained displayMode] == 1;

    goto LABEL_25;
  }
  id v6 = [(UISplitViewControllerPanelImpl *)self _sidebarArrowButtonRecognizer];

  if (v6 == v4)
  {
    BOOL v8 = 1;
    goto LABEL_25;
  }
  if (![(UISplitViewControllerPanelImpl *)self _shouldUseFluidSidebarGestures])
  {
    id v10 = [(UISplitViewControllerPanelImpl *)self _presentationGestureRecognizer];

    if (v10 != v4)
    {
      BOOL v8 = 0;
      goto LABEL_25;
    }
    double v11 = [v4 view];
    [v4 translationInView:v11];
    if (v12 == 0.0) {
      goto LABEL_23;
    }
    double v14 = v12;
    if (fabs(v12) <= fabs(v13)) {
      goto LABEL_23;
    }
    if ([(UISplitViewControllerPanelImpl *)self _layoutPrimaryOnRight]) {
      BOOL v15 = v14 >= 0.0;
    }
    else {
      BOOL v15 = v14 <= 0.0;
    }
    BOOL v16 = [(UISplitViewControllerPanelImpl *)self _isPrimaryShown];
    BOOL v17 = [(UISplitViewControllerPanelImpl *)self panelController];
    uint64_t v18 = [v17 currentState];
    int v19 = [v18 isSupplementaryVisible];

    int v20 = 0;
    if (!v15 && !v16)
    {
      [v4 locationInView:v11];
      uint64_t v21 = objc_msgSend(v11, "hitTest:withEvent:", 0);
      int v20 = ![(UISplitViewControllerPanelImpl *)self _scrollViewPreventsGestureForHitView:v21];
    }
    if ((v15 & (v16 | v19)) != 1) {
      goto LABEL_24;
    }
    if ([(UISplitViewControllerPanelImpl *)self _allowMoveToSecondaryOnlyGetIsInForcedOverlayFromGestureOrRestrictedWidth:0]|| (v16 & v19) != 0)
    {
      if (v19)
      {
        int64_t v23 = [(UISplitViewControllerPanelImpl *)self panelController];
        double v24 = [v23 supplementaryViewController];
        id v25 = [v24 view];
      }
      else
      {
        int64_t v23 = [(UISplitViewControllerPanelImpl *)self _currentPrimaryChildViewController];
        id v25 = [v23 view];
      }

      if (v25)
      {
        [v4 locationInView:v11];
        uint64_t v26 = objc_msgSend(v11, "hitTest:withEvent:", 0);
        BOOL v27 = v26;
        if (v26) {
          int v20 = [v26 isDescendantOfView:v25] ^ 1;
        }
        else {
          int v20 = 0;
        }
      }
      else
      {
        int v20 = 1;
      }
    }
    else
    {
LABEL_23:
      int v20 = 0;
    }
LABEL_24:

    BOOL v8 = v20 != 0;
    goto LABEL_25;
  }
  BOOL v7 = [(UISplitViewControllerPanelImpl *)self _fluidGestureRecognizerShouldBegin:v4];
LABEL_7:
  BOOL v8 = v7;
LABEL_25:

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UISplitViewControllerPanelImpl *)self _shouldUseFluidSidebarGestures])
  {
    uint64_t v8 = [(UISplitViewControllerPanelImpl *)self _fluidOpenSidebarPresentationGestureRecognizer];
    if ((id)v8 == v6)
    {
    }
    else
    {
      uint64_t v9 = (void *)v8;
      id v10 = [(UISplitViewControllerPanelImpl *)self _fluidSidebarPresentationGestureRecognizer];

      if (!v10) {
        goto LABEL_6;
      }
    }
LABEL_8:
    int v12 = [v7 _isPointerTouch] ^ 1;
    goto LABEL_9;
  }
  id v11 = [(UISplitViewControllerPanelImpl *)self _presentationGestureRecognizer];

  if (v11 == v6) {
    goto LABEL_8;
  }
LABEL_6:
  LOBYTE(v12) = 1;
LABEL_9:

  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UISplitViewControllerPanelImpl *)self _shouldUseFluidSidebarGestures])
  {
    id v8 = [(UISplitViewControllerPanelImpl *)self _fluidSidebarPresentationGestureRecognizer];
    uint64_t v9 = [(UISplitViewControllerPanelImpl *)self _fluidOpenSidebarPresentationGestureRecognizer];
    id v10 = (void *)v9;
    if (v8 != v6 || (id)v9 == v7)
    {
      BOOL v11 = 0;
      if ((id)v9 != v6 || v8 == v7)
      {
LABEL_25:

        goto LABEL_26;
      }
    }
    char v12 = [v7 _isGestureType:8];

    if (v12) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v13 = [(UISplitViewControllerPanelImpl *)self _presentationGestureRecognizer];
    if ((id)v13 != v6)
    {
      id v8 = (id)v13;
      goto LABEL_12;
    }
    int v14 = [v7 _isGestureType:8];

    if (v14)
    {
LABEL_7:
      id v8 = v7;
      if ([v8 _failsPastHysteresisWithoutMinTouches])
      {
        if ((unint64_t)[v8 minimumNumberOfTouches] < 2)
        {
          BOOL v11 = 1;
LABEL_26:

          goto LABEL_27;
        }
      }
      else
      {
        id v15 = v6;
        id v16 = v8;
        NSUInteger v17 = [v15 minimumNumberOfTouches];
        uint64_t v18 = [v15 maximumNumberOfTouches];
        uint64_t v19 = [v15 minimumNumberOfTouches];

        NSUInteger v20 = v18 - v19 + 1;
        NSUInteger v21 = [v16 minimumNumberOfTouches];
        uint64_t v22 = [v16 maximumNumberOfTouches];
        uint64_t v23 = [v16 minimumNumberOfTouches];

        v33.length = v22 - v23 + 1;
        v32.id location = v17;
        v32.length = v20;
        v33.id location = v21;
        if (NSIntersectionRange(v32, v33).length)
        {
          BOOL v11 = 1;
          id v8 = v16;
          goto LABEL_26;
        }
      }
      if ([(UISplitViewControllerPanelImpl *)self _shouldUseFluidSidebarGestures])
      {
        if ([(UISplitViewControllerPanelImpl *)self _isPrimaryShown])
        {
          uint64_t v24 = 0;
        }
        else
        {
          id v25 = [(UISplitViewControllerPanelImpl *)self panelController];
          uint64_t v26 = [v25 currentState];
          if ([v26 isSupplementaryVisible]) {
            uint64_t v24 = 1;
          }
          else {
            uint64_t v24 = 2;
          }
        }
        perColumnViewControllers = self->_perColumnViewControllers;
        id v10 = [NSNumber numberWithInteger:v24];
        double v28 = [(NSMutableDictionary *)perColumnViewControllers objectForKeyedSubscript:v10];
        id v29 = [v28 navigationController];
        id v30 = [v29 _screenEdgePanGestureRecognizer];
        BOOL v11 = v30 == v8;

        goto LABEL_25;
      }
LABEL_12:
      BOOL v11 = 0;
      goto LABEL_26;
    }
  }
  BOOL v11 = 0;
LABEL_27:

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 name];
  int v9 = [v8 isEqualToString:@"com.apple.UIKit.UIWindowDraggingPan"];

  if ([(UISplitViewControllerPanelImpl *)self _shouldUseFluidSidebarGestures])
  {
    id v10 = [(UISplitViewControllerPanelImpl *)self _fluidSidebarPresentationGestureRecognizer];
    id v11 = [(UISplitViewControllerPanelImpl *)self _fluidOpenSidebarPresentationGestureRecognizer];
    id v12 = v11;
    if (v10 != v6 && v11 != v6)
    {

LABEL_6:
      char v14 = 0;
      goto LABEL_7;
    }
    char v16 = [v7 _isGestureType:10];
    if ((v16 & 1) == 0 && v12 != v7 && v10 != v7)
    {
      int v17 = [v7 _isGestureType:8];
      int v18 = v17;
      if (v10 == v6) {
        int v19 = v17;
      }
      else {
        int v19 = 0;
      }
      int v20 = v19 & v9;

      if (v20 == 1)
      {

        char v14 = 1;
        goto LABEL_7;
      }

      if (!v18) {
        goto LABEL_6;
      }
LABEL_25:
      id v32 = v7;
      NSRange v33 = [v6 _activeEventOfType:10];

      if (v33)
      {
        if (([v32 allowedScrollTypesMask] & 2) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ([v32 view],
                id v34 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                char isKindOfClass = objc_opt_isKindOfClass(),
                v34,
                (isKindOfClass & 1) != 0))
          {
            id v36 = [v32 view];
            char v14 = [v36 _canScrollX];
          }
          else
          {
            char v14 = 1;
          }
          goto LABEL_34;
        }
      }
      else if ([v32 _failsPastHysteresisWithoutMinTouches])
      {
        char v14 = (unint64_t)[v32 minimumNumberOfTouches] > 1;
LABEL_34:

        goto LABEL_7;
      }
      char v14 = 0;
      goto LABEL_34;
    }

    if ((v16 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
  id v13 = [(UISplitViewControllerPanelImpl *)self _presentationGestureRecognizer];

  if (v13 != v6) {
    goto LABEL_6;
  }
  if ([v7 _isGestureType:10])
  {
LABEL_21:
    uint64_t v22 = [v6 view];
    uint64_t v23 = [v7 view];
    objc_msgSend(v22, "convertPoint:toView:", v23, 10.0, 10.0);
    double v25 = v24;

    uint64_t v26 = [v6 view];
    BOOL v27 = [v7 view];
    objc_msgSend(v26, "convertPoint:toView:", v27, 20.0, 10.0);
    double v29 = v28;

    char v30 = [v7 direction];
    BOOL v31 = v25 - v29 < 0.0;
    if (v25 - v29 > 0.0) {
      BOOL v31 = 1;
    }
    char v14 = v30 & v31;
    goto LABEL_7;
  }
  int v21 = [v7 _isGestureType:8];
  char v14 = v21 & v9;
  if ((v21 & v9 & 1) == 0 && v21) {
    goto LABEL_25;
  }
LABEL_7:

  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [(UISplitViewControllerPanelImpl *)self _sidebarArrowButtonRecognizer];

  return v6 == v5;
}

- (void)sendWillHideColumn:(int64_t)a3
{
  $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
  if ((*(void *)&flags & 0x600000000) == 0x200000000)
  {
    self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x8000000);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    $692BA5F601ABB544448C4E0A48A865F8 v6 = self->_flags;
    id v7 = [(UISplitViewControllerPanelImpl *)self _columnStyleDelegate];
    id v8 = v7;
    if ((*(void *)&v6 & 0x800000000) != 0) {
      [v7 _splitViewController:WeakRetained willHideColumn:a3];
    }
    else {
      [v7 splitViewController:WeakRetained willHideColumn:a3];
    }

    *(void *)&self->_flags &= ~0x8000000uLL;
  }
}

- (void)_unspecifiedStylePresentationGestureRecognizerChanged:(id)a3
{
  id v20 = a3;
  int64_t v5 = [(UISplitViewControllerPanelImpl *)self style];
  if (v5)
  {
    unint64_t v16 = v5;
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    int v18 = _UISplitViewControllerStyleDescription(v16);
    [v17 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 7593, @"Incorrect code path for UISplitViewControllerStyle %@", v18 object file lineNumber description];
  }
  uint64_t v6 = [v20 state];
  if ((unint64_t)(v6 - 3) >= 2)
  {
    if ((unint64_t)(v6 - 1) > 1) {
      goto LABEL_9;
    }
    id v7 = [v20 view];
    [v20 velocityInView:v7];
    if (*(double *)v8.i64 == 0.0)
    {
      self->_presentationGestureDirection = 0.0;
LABEL_7:

      goto LABEL_9;
    }
    v9.i64[0] = 1.0;
    v10.f64[0] = NAN;
    v10.f64[1] = NAN;
    v9.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v10), v9, v8).i64[0];
    if (*(double *)v9.i64 == 0.0 || *(double *)v9.i64 == self->_presentationGestureDirection)
    {
      *(void *)&self->_presentationGestureDirection = v9.i64[0];
      if (*(double *)v9.i64 == 0.0) {
        goto LABEL_7;
      }
    }
    else
    {
      double v19 = *(double *)v9.i64;
      objc_msgSend(v20, "setTranslation:inView:", v7, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      self->_presentationGestureDirection = v19;
    }
    BOOL v12 = [(UISplitViewControllerPanelImpl *)self _isPrimaryShown];
    BOOL v13 = [(UISplitViewControllerPanelImpl *)self _layoutPrimaryOnRight];
    double v14 = 1.0;
    if (v13) {
      double v14 = -1.0;
    }
    if (((v12 ^ (self->_presentationGestureDirection != v14)) & 1) == 0)
    {
      [v20 translationInView:v7];
      if (fabs(v15) >= 40.0) {
        [(UISplitViewControllerPanelImpl *)self _unspecifiedStyleSetPrimaryShownFromGesture:!v12];
      }
    }
    goto LABEL_7;
  }
  self->_presentationGestureDirection = 0.0;
LABEL_9:
}

- (void)_notifyFluidPresentationGestureWillBegin
{
  uint64_t v3 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v3 setPresentationGestureActive:1];

  $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
  if ((*(void *)&flags & 0x1000000000) != 0)
  {
    self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x8000000);
    int64_t v5 = [(UISplitViewControllerPanelImpl *)self _columnStyleDelegate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    [v5 splitViewControllerInteractivePresentationGestureWillBegin:WeakRetained];
  }
  else
  {
    if ((*(void *)&flags & 0x2000000000) == 0) {
      return;
    }
    self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x8000000);
    int64_t v5 = [(UISplitViewControllerPanelImpl *)self _columnStyleDelegate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    [v5 _splitViewControllerInteractiveSidebarGestureWillBegin:WeakRetained];
  }

  *(void *)&self->_flags &= ~0x8000000uLL;
}

- (void)_notifyFluidPresentationGestureDidEnd
{
  uint64_t v3 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v3 setPresentationGestureActive:0];

  $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
  if ((*(void *)&flags & 0x4000000000) != 0)
  {
    self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x8000000);
    int64_t v5 = [(UISplitViewControllerPanelImpl *)self _columnStyleDelegate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    [v5 splitViewControllerInteractivePresentationGestureDidEnd:WeakRetained];
  }
  else
  {
    if ((*(void *)&flags & 0x8000000000) == 0) {
      return;
    }
    self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(unint64_t *)&flags | 0x8000000);
    int64_t v5 = [(UISplitViewControllerPanelImpl *)self _columnStyleDelegate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    [v5 _splitViewControllerInteractiveSidebarGestureDidEnd:WeakRetained];
  }

  *(void *)&self->_flags &= ~0x8000000uLL;
}

- (void)_fluidPresentationGestureRecognizerChanged:(id)a3
{
  id v78 = a3;
  unint64_t v79 = [(UISplitViewControllerPanelImpl *)self style];
  if (v79 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v76 = [MEMORY[0x1E4F28B00] currentHandler];
    double v77 = _UISplitViewControllerStyleDescription(v79);
    [v76 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 7663, @"Incorrect code path for UISplitViewControllerStyle %@", v77 object file lineNumber description];
  }
  [(NSMutableArray *)self->_hyperpoints removeAllObjects];
  double v80 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v6 = [WeakRetained view];
  [v6 bounds];
  double MaxX = CGRectGetMaxX(v94);

  BOOL v8 = [(UISplitViewControllerPanelImpl *)self _layoutPrimaryOnRight];
  if (v8) {
    double v9 = MaxX;
  }
  else {
    double v9 = 0.0;
  }
  BOOL v10 = [(UISplitViewControllerPanelImpl *)self _allowMoveToSecondaryOnlyGetIsInForcedOverlayFromGestureOrRestrictedWidth:0];
  if (v10 || [(UISplitViewControllerPanelImpl *)self displayMode] == 1)
  {
    id v11 = [[_UIHyperpoint alloc] initWithDimensions:1];
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke;
    v93[3] = &__block_descriptor_40_e9_v16__0_d8l;
    *(double *)&v93[4] = v9;
    [(_UIHyperpoint *)v11 _mutateValue:v93];
    [(NSMutableArray *)self->_hyperpoints addObject:v11];
    [v80 addObject:&unk_1ED3F3A68];
    if (!v10)
    {
      *(void *)&self->_flags |= 0x20000uLL;
      [(UISplitViewControllerPanelImpl *)self setUserGeneratedDisplayMode:3];
    }
  }
  if (v8) {
    double v12 = -1.0;
  }
  else {
    double v12 = 1.0;
  }
  int v13 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
  double v14 = [(UISplitViewControllerPanelImpl *)self panelController];
  double v15 = [v14 possibleStates];
  double v16 = minNonzeroPrimaryWidthInStates(v15, v13);

  if (v79 == 2)
  {
    int v18 = [(UISplitViewControllerPanelImpl *)self panelController];
    double v19 = [v18 possibleStates];
    double v9 = v9 + v12 * minNonzeroSupplementaryWidthInStateWithPrimaryWidthGetMatchingState(v19, v13, 0, v16);

    id v20 = [[_UIHyperpoint alloc] initWithDimensions:1];
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_506;
    v92[3] = &__block_descriptor_40_e9_v16__0_d8l;
    *(double *)&v92[4] = v9;
    [(_UIHyperpoint *)v20 _mutateValue:v92];
    [(NSMutableArray *)self->_hyperpoints addObject:v20];
    int v21 = [NSNumber numberWithUnsignedInteger:1];
    [v80 addObject:v21];

    uint64_t v22 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

    if (!v22) {
      goto LABEL_19;
    }
    uint64_t v17 = 2;
  }
  else
  {
    uint64_t v17 = 1;
  }
  uint64_t v23 = [[_UIHyperpoint alloc] initWithDimensions:1];
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_2;
  v91[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v91[4] = v12 * v16 + v9;
  [(_UIHyperpoint *)v23 _mutateValue:v91];
  [(NSMutableArray *)self->_hyperpoints addObject:v23];
  double v24 = [NSNumber numberWithUnsignedInteger:v17];
  [v80 addObject:v24];

LABEL_19:
  [(_UIHyperregionUnion *)self->_regionUnion _setRegions:self->_hyperpoints];
  hyperpoints = self->_hyperpoints;
  if (v8)
  {
    uint64_t v26 = [(NSMutableArray *)hyperpoints lastObject];
    [(NSMutableArray *)self->_hyperpoints firstObject];
  }
  else
  {
    uint64_t v26 = [(NSMutableArray *)hyperpoints firstObject];
    [(NSMutableArray *)self->_hyperpoints lastObject];
  BOOL v27 = };
  hyperrectangle = self->_hyperrectangle;
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_3;
  v89[3] = &unk_1E52DB3A0;
  id v29 = v26;
  id v90 = v29;
  [(_UIHyperrectangle *)hyperrectangle _mutateMinimumPoint:v89];
  char v30 = self->_hyperrectangle;
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_4;
  v87[3] = &unk_1E52DB3A0;
  id v31 = v27;
  id v88 = v31;
  [(_UIHyperrectangle *)v30 _mutateMaximumPoint:v87];
  id v32 = objc_loadWeakRetained((id *)&self->_svc);
  if (_UISplitViewControllerAutoHidesColumns(v32))
  {
    int64_t v33 = [(UISplitViewControllerPanelImpl *)self splitBehavior];

    if (v33 == 1)
    {
      id v34 = [v80 lastObject];
      uint64_t v35 = [v34 integerValue];

      uint64_t v36 = [(UISplitViewControllerPanelImpl *)self displayMode];
      uint64_t v37 = 1;
      if (v35 == 1) {
        uint64_t v37 = 2;
      }
      if (v35 == 2) {
        uint64_t v38 = 4;
      }
      else {
        uint64_t v38 = v37;
      }
      -[UISplitViewControllerPanelImpl _updateSplitBehaviorOverridesForTransitionFromDisplayMode:toDisplayMode:shouldResizeIfNecessary:]((uint64_t)self, v36, v38);
    }
  }
  else
  {
  }
  uint64_t v39 = [v78 state];
  if ((unint64_t)(v39 - 3) < 2)
  {
    _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, _fluidPresentationGestureRecognizerChanged__updateRequest, 0x10002Eu);
    [(UISplitViewControllerPanelImpl *)self _notifyFluidPresentationGestureDidEnd];
    [(_UIHyperInteractor *)self->_interactor _commitTranslation];
    unint64_t v55 = [(_UIHyperregionUnion *)self->_regionUnion _regionIndexForClosestPoint:0 toPoint:[(_UIHyperInteractor *)self->_interactor _projectedPoint]];
    double v56 = *[(_UIHyperInteractor *)self->_interactor _constrainedVelocity];
    long long v57 = [(NSMutableArray *)self->_hyperpoints objectAtIndexedSubscript:v55];
    double v58 = *(double *)[v57 _value];
    double v59 = v58 - *[(_UIHyperInteractor *)self->_interactor _constrainedPoint];

    [(_UIHyperInteractor *)self->_interactor _setRegion:self->_regionUnion];
    if (v59 == 0.0 || v56 == 0.0) {
      double v61 = 0.0;
    }
    else {
      double v61 = v56 / v59;
    }
    int v62 = [(UISplitViewControllerPanelImpl *)self panelController];
    double v63 = [v62 interactiveStateRequest];
    [v63 rubberBandInset];
    double v65 = v64;

    if (v61 > 22.5 && v65 == 0.0) {
      double v67 = 22.5;
    }
    else {
      double v67 = v61;
    }
    BOOL v68 = [v80 objectAtIndexedSubscript:v55];
    uint64_t v69 = [v68 integerValue];

    [(UISplitViewControllerPanelImpl *)self _setNumberOfSidebarColumnsVisibleFromGesture:v69 withVelocity:v67];
    double v70 = [(UISplitViewControllerPanelImpl *)self panelController];
    LOBYTE(v69) = [v70 isAnimating];

    if ((v69 & 1) == 0)
    {
      BOOL v71 = [(UISplitViewControllerPanelImpl *)self _alwaysHideSidebarToggleButton];
      if (v79 == 2 && !v71)
      {
        double v72 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

        if (v72)
        {
          double v73 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
          double v74 = [v73 navigationController];
          double v75 = [v74 navigationBar];

          [v75 _endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange];
          [v75 _setShouldFadeStaticNavBarButton:0];
        }
      }
      uint64_t v54 = [(UISplitViewControllerPanelImpl *)self panelController];
      [v54 setNavigationBarForContentLayoutGuideAnimation:0];
      goto LABEL_66;
    }
  }
  else
  {
    if (v39 == 2)
    {
LABEL_45:
      interactor = self->_interactor;
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_6;
      v83[3] = &unk_1E52DB3A0;
      id v50 = v78;
      id v84 = v50;
      [(_UIHyperInteractor *)interactor _mutateTranslation:v83];
      double v51 = self->_interactor;
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_7;
      v81[3] = &unk_1E52DB3A0;
      id v82 = v50;
      [(_UIHyperInteractor *)v51 _mutateVelocity:v81];
      double v52 = [(_UIHyperInteractor *)self->_interactor _constrainedPoint];
      double v53 = *v52;
      if (v8) {
        double v53 = MaxX - *v52;
      }
      [(UISplitViewControllerPanelImpl *)self _setInteractiveSidebarWidth:v53];

      uint64_t v54 = v84;
LABEL_66:

      goto LABEL_67;
    }
    if (v39 == 1)
    {
      _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, _fluidPresentationGestureRecognizerChanged__updateRequest, 0x10002Eu);
      [(UISplitViewControllerPanelImpl *)self _notifyFluidPresentationGestureWillBegin];
      [(_UIHyperInteractor *)self->_interactor _setRegion:self->_hyperrectangle];
      double v40 = [(UISplitViewControllerPanelImpl *)self panelController];
      [v40 stopAnimations];

      BOOL v41 = [(UISplitViewControllerPanelImpl *)self _alwaysHideSidebarToggleButton];
      if (v79 == 2 && !v41)
      {
        double v42 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

        if (v42)
        {
          double v43 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
          uint64_t v44 = [v43 navigationController];
          double v45 = [v44 navigationBar];

          double v46 = [v45 _staticNavBarButtonItem];

          if (!v46) {
            [(UISplitViewControllerPanelImpl *)self _updateDisplayModeButtonItemForDisplayMode:[(UISplitViewControllerPanelImpl *)self allowedDisplayModeForCurrentSplitBehaviorGivenDisplayMode:3]];
          }
          if (![(UIBarButtonItem *)self->_sidebarToggleButtonItem isHidden]
            || [(_UIFloatableBarButtonItem *)self->_sidebarToggleButtonItem _isFloatable]
            || [(UISplitViewControllerPanelImpl *)self displayMode] == 6)
          {
            objc_msgSend(v45, "_setShouldFadeStaticNavBarButton:", -[_UIFloatableBarButtonItem _isFloatable](self->_sidebarToggleButtonItem, "_isFloatable") ^ 1);
            double v47 = [(UISplitViewControllerPanelImpl *)self panelController];
            [v47 setNavigationBarForContentLayoutGuideAnimation:v45];
          }
        }
      }
      double v48 = self->_interactor;
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_5;
      v85[3] = &unk_1E52E9C38;
      v85[4] = self;
      BOOL v86 = !v8;
      *(double *)&v85[5] = v16;
      *(double *)&v85[6] = MaxX;
      [(_UIHyperInteractor *)v48 _mutateUnconstrainedPoint:v85];
      goto LABEL_45;
    }
  }
LABEL_67:
}

double __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke(uint64_t a1, double *a2)
{
  double result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

double __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_506(uint64_t a1, double *a2)
{
  double result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

double __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_2(uint64_t a1, double *a2)
{
  double result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

double __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = (double *)[*(id *)(a1 + 32) _value];
  double result = *v3;
  *a2 = *(void *)v3;
  return result;
}

double __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = (double *)[*(id *)(a1 + 32) _value];
  double result = *v3;
  *a2 = *(void *)v3;
  return result;
}

void __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) panelController];
  int64_t v5 = [v4 interactiveStateRequest];

  if ([*(id *)(a1 + 32) _isPrimaryLeading]) {
    [v5 leadingWidth];
  }
  else {
    [v5 trailingWidth];
  }
  double v7 = v6;
  double v8 = 0.0;
  if (v6 > 0.0)
  {
    double v9 = *(double *)(a1 + 40);
    BOOL v10 = v9 < v7;
    double v11 = v9 - v7;
    if (v10) {
      double v8 = 0.0;
    }
    else {
      double v8 = v11;
    }
  }
  [v5 supplementaryWidth];
  double v13 = v7 + v12 - v8;
  double v14 = v13;
  if (!*(unsigned char *)(a1 + 56)) {
    double v14 = *(double *)(a1 + 48) - v13;
  }
  [*(id *)(*(void *)(a1 + 32) + 272) _getUnconstrainedPoint:a2 forConstrainedPoint:&v14];
}

uint64_t __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t result = [*(id *)(a1 + 32) translationInView:0];
  *a2 = v4;
  return result;
}

uint64_t __77__UISplitViewControllerPanelImpl__fluidPresentationGestureRecognizerChanged___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t result = [*(id *)(a1 + 32) velocityInView:0];
  *a2 = v4;
  return result;
}

- (void)_presentationGestureRecognizerChanged:(id)a3
{
  id v26 = a3;
  if (![(UISplitViewControllerPanelImpl *)self style])
  {
    [(UISplitViewControllerPanelImpl *)self _unspecifiedStylePresentationGestureRecognizerChanged:v26];
    goto LABEL_11;
  }
  if (![(UISplitViewControllerPanelImpl *)self _shouldUseFluidSidebarGestures])
  {
    uint64_t v4 = [v26 state];
    if ((unint64_t)(v4 - 3) < 2)
    {
      *(void *)&self->_flags &= 0xFFFFFFFFFFFE7FFFLL;
      self->_double presentationGestureDirection = 0.0;
      goto LABEL_11;
    }
    BOOL v5 = (unint64_t)(v4 - 1) > 1;
    double v6 = v26;
    if (v5) {
      goto LABEL_12;
    }
    double v7 = [v26 view];
    [v26 velocityInView:v7];
    if (*(double *)v8.i64 == 0.0)
    {
      self->_double presentationGestureDirection = 0.0;
LABEL_9:

      goto LABEL_11;
    }
    v9.i64[0] = 1.0;
    v10.f64[0] = NAN;
    v10.f64[1] = NAN;
    v9.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v10), v9, v8).i64[0];
    if (*(double *)v9.i64 == 0.0 || *(double *)v9.i64 == self->_presentationGestureDirection)
    {
      *(void *)&self->_double presentationGestureDirection = v9.i64[0];
      if (*(double *)v9.i64 == 0.0) {
        goto LABEL_9;
      }
    }
    else
    {
      double v25 = *(double *)v9.i64;
      objc_msgSend(v26, "setTranslation:inView:", v7, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      self->_double presentationGestureDirection = v25;
    }
    BOOL v12 = [(UISplitViewControllerPanelImpl *)self _isPrimaryShown];
    BOOL v13 = [(UIPanelController *)self->_panelController supportsColumnStyle];
    if (v13)
    {
      double v14 = [(UIPanelController *)self->_panelController currentState];
      int v15 = [v14 isSupplementaryVisible];
    }
    else
    {
      int v15 = 0;
    }
    BOOL v16 = [(UISplitViewControllerPanelImpl *)self _layoutPrimaryOnRight];
    double v17 = 1.0;
    if (v16) {
      double v17 = -1.0;
    }
    double presentationGestureDirection = self->_presentationGestureDirection;
    uint64_t v19 = v17 == presentationGestureDirection;
    if (v17 == presentationGestureDirection && v12) {
      uint64_t v19 = v13 & (v15 ^ 1u);
    }
    if (v17 == presentationGestureDirection) {
      int v21 = 0;
    }
    else {
      int v21 = v12 | v15;
    }
    if ((v19 | v21) != 1) {
      goto LABEL_9;
    }
    [v26 translationInView:v7];
    if (fabs(v22) < 40.0) {
      goto LABEL_9;
    }
    if (v13)
    {
      $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
      if ((*(void *)&flags & 0x18000) != 0) {
        goto LABEL_9;
      }
      if ((v19 ^ 1 | v15) != 1)
      {
        uint64_t v24 = 0x8000;
        goto LABEL_42;
      }
      if ((v21 & v12) == 1)
      {
        uint64_t v24 = 0x10000;
LABEL_42:
        self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(v24 | *(void *)&flags);
      }
    }
    [(UISplitViewControllerPanelImpl *)self _setPrimaryShownFromGesture:v19 hideAll:0];
    goto LABEL_9;
  }
  [(UISplitViewControllerPanelImpl *)self _fluidPresentationGestureRecognizerChanged:v26];
LABEL_11:
  double v6 = v26;
LABEL_12:
}

- (void)_setInteractiveSidebarWidth:(double)a3
{
  unint64_t v6 = [(UISplitViewControllerPanelImpl *)self style];
  if (v6 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v29 = [MEMORY[0x1E4F28B00] currentHandler];
    char v30 = _UISplitViewControllerStyleDescription(v6);
    [v29 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 7924, @"Incorrect code path for UISplitViewControllerStyle %@", v30 object file lineNumber description];
  }
  double v7 = [(UISplitViewControllerPanelImpl *)self panelController];
  int8x16_t v8 = [v7 currentState];
  int8x16_t v9 = [v8 stateRequest];

  int v10 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
  double v11 = [(UISplitViewControllerPanelImpl *)self panelController];
  BOOL v12 = [v11 possibleStates];

  double v13 = minNonzeroPrimaryWidthInStates(v12, v10);
  double v14 = v13;
  if (v6 == 2)
  {
    id v31 = 0;
    double MatchingState = minNonzeroSupplementaryWidthInStateWithPrimaryWidthGetMatchingState(v12, v10, &v31, v13);
    id v16 = v31;
    if (v14 + MatchingState <= a3) {
      double v17 = v14 + MatchingState;
    }
    else {
      double v17 = a3;
    }
    double v18 = a3 - (v14 + MatchingState);
    if (v17 >= MatchingState) {
      double v19 = MatchingState;
    }
    else {
      double v19 = v17;
    }
    [v9 setSupplementaryWidth:v19];
    id v20 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
    double v21 = 0.0;
    if (v20)
    {
      [v9 supplementaryWidth];
      double v21 = v17 - v22;
    }
    double v23 = fmax(v18, 0.0);
  }
  else
  {
    id v16 = 0;
    if (v13 <= a3) {
      double v21 = v13;
    }
    else {
      double v21 = a3;
    }
    double v23 = fmax(a3 - v13, 0.0);
  }
  if (!v10)
  {
    [v9 setTrailingWidth:v21];
    if (!v16) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  [v9 setLeadingWidth:v21];
  if (v16)
  {
LABEL_21:
    [v16 mainWidth];
    objc_msgSend(v9, "setMainWidth:");
  }
LABEL_22:
  [v9 setRubberBandInset:v23];
  uint64_t v24 = [(UISplitViewControllerPanelImpl *)self panelController];
  double v25 = [v24 currentState];
  id v26 = [v25 stateRequest];
  char v27 = [v9 isEqual:v26];

  if ((v27 & 1) == 0)
  {
    double v28 = [(UISplitViewControllerPanelImpl *)self panelController];
    [v28 setInteractiveStateRequest:v9];
  }
}

- (void)_unspecifiedStyleSetPrimaryShownFromGesture:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v6 = [(UISplitViewControllerPanelImpl *)self style];
  if (v6)
  {
    unint64_t v17 = v6;
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    double v19 = _UISplitViewControllerStyleDescription(v17);
    [v18 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 7967, @"Incorrect code path for UISplitViewControllerStyle %@", v19 object file lineNumber description];
  }
  double v7 = [(UISplitViewControllerPanelImpl *)self panelController];
  int8x16_t v8 = [v7 currentState];
  id v20 = [v8 stateRequest];

  BOOL v9 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
  int v10 = v9;
  if (v3)
  {
    double v11 = [(UISplitViewControllerPanelImpl *)self panelController];
    BOOL v12 = [v11 possibleStates];
    double v13 = minNonzeroPrimaryWidthInStates(v12, v10);

    double v14 = v20;
    if (v13 <= 0.0) {
      goto LABEL_13;
    }
    double v15 = v13;
    if (!v10) {
      goto LABEL_11;
    }
  }
  else
  {
    double v15 = 0.0;
    if (!v9)
    {
      double v14 = v20;
LABEL_11:
      [v14 setTrailingWidth:v15];
      goto LABEL_12;
    }
    double v14 = v20;
  }
  [v14 setLeadingWidth:v15];
LABEL_12:
  id v16 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v16 animateToRequest:v20];

  double v14 = v20;
LABEL_13:
}

- (void)_setNumberOfSidebarColumnsVisibleFromGesture:(unint64_t)a3 withVelocity:(double)a4
{
  unint64_t v8 = [(UISplitViewControllerPanelImpl *)self style];
  if (v8 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    char v27 = _UISplitViewControllerStyleDescription(v8);
    [v26 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 7997, @"Incorrect code path for UISplitViewControllerStyle %@", v27 object file lineNumber description];
  }
  BOOL v9 = [(UISplitViewControllerPanelImpl *)self panelController];
  int v10 = [v9 currentState];

  double v11 = [v10 stateRequest];
  int v12 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
  double v13 = [(UISplitViewControllerPanelImpl *)self panelController];
  double v14 = [v13 possibleStates];
  double v15 = minNonzeroPrimaryWidthInStates(v14, v12);

  if (v8 == 2)
  {
    if (a3 <= 1) {
      double v15 = 0.0;
    }
    id v16 = [(UISplitViewControllerPanelImpl *)self panelController];
    unint64_t v17 = [v16 possibleStates];
    id v28 = 0;
    double MatchingState = minNonzeroSupplementaryWidthInStateWithPrimaryWidthGetMatchingState(v17, v12, &v28, v15);
    id v19 = v28;

    if (a3) {
      double v20 = MatchingState;
    }
    else {
      double v20 = 0.0;
    }
    [v11 setSupplementaryWidth:v20];
  }
  else
  {
    id v19 = 0;
    if (!a3) {
      double v15 = 0.0;
    }
  }
  if (!v12)
  {
    [v11 setTrailingWidth:v15];
    if (!v19) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  [v11 setLeadingWidth:v15];
  if (v19)
  {
LABEL_16:
    [v19 mainWidth];
    objc_msgSend(v11, "setMainWidth:");
  }
LABEL_17:
  BOOL v21 = [(UISplitViewControllerPanelImpl *)self _allowClientAnimationCoordination];
  double v22 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v22 setAnimationRequestShouldCoordinate:v21];

  double v23 = [(UISplitViewControllerPanelImpl *)self panelController];
  objc_msgSend(v23, "animateToRequest:forceOverlay:withVelocity:", v11, -[UISplitViewControllerPanelImpl _gestureIsForcingOverlay](self, "_gestureIsForcingOverlay"), a4);

  if (a3 == 1)
  {
    $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
    if ((~*(_DWORD *)&self->_flags & 0xC0000) == 0)
    {
      p_$692BA5F601ABB544448C4E0A48A865F8 flags = &self->_flags;
      goto LABEL_22;
    }
  }
  else if (!a3)
  {
    p_$692BA5F601ABB544448C4E0A48A865F8 flags = &self->_flags;
    $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
LABEL_22:
    *p_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&flags & 0xFFFFFFFFFFF3FFFFLL);
  }
}

- (void)_setPrimaryShownFromGesture:(BOOL)a3 hideAll:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unint64_t v8 = [(UISplitViewControllerPanelImpl *)self style];
  if (v8 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v32 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v33 = _UISplitViewControllerStyleDescription(v8);
    [v32 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 8049, @"Incorrect code path for UISplitViewControllerStyle %@", v33 object file lineNumber description];
  }
  BOOL v9 = [(UISplitViewControllerPanelImpl *)self panelController];
  int v10 = [v9 currentState];

  double v11 = [v10 stateRequest];
  [v11 leadingWidth];
  if (v12 == 0.0 && ([v11 trailingWidth], v13 == 0.0))
  {
    [v11 supplementaryWidth];
    BOOL v15 = v14 == 0.0;
  }
  else
  {
    BOOL v15 = 0;
  }
  int v16 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
  if (!v5)
  {
    unsigned __int8 v34 = 0;
    BOOL v20 = [(UISplitViewControllerPanelImpl *)self _allowMoveToSecondaryOnlyGetIsInForcedOverlayFromGestureOrRestrictedWidth:&v34];
    int v21 = 0;
    if (v8 == 2)
    {
      if ([v10 isSupplementaryVisible])
      {
        if (v16) {
          int v22 = [v10 isLeadingVisible];
        }
        else {
          int v22 = [v10 isTrailingVisible];
        }
        int v21 = v22 ^ 1;
        if (!v20)
        {
LABEL_33:
          [v11 supplementaryWidth];
          if (v30 > 0.0)
          {
LABEL_34:
            if (v16)
            {
              [v11 setLeadingWidth:0.0];
              goto LABEL_37;
            }
LABEL_36:
            [v11 setTrailingWidth:0.0];
          }
LABEL_37:
          id v31 = [(UISplitViewControllerPanelImpl *)self panelController];
          [v31 animateToRequest:v11 forceOverlay:v34];

          *(void *)&self->_flags &= 0xFFFFFFFFFFF3FFFFLL;
          goto LABEL_38;
        }
LABEL_25:
        if ((v4 | v21) != 1) {
          goto LABEL_34;
        }
        [v11 setSupplementaryWidth:0.0];
        if (v4)
        {
          [v11 setLeadingWidth:0.0];
          goto LABEL_36;
        }
        goto LABEL_37;
      }
      int v21 = 0;
    }
    if (!v20) {
      goto LABEL_33;
    }
    goto LABEL_25;
  }
  if (v8 == 2 && ([v10 isSupplementaryVisible] & 1) == 0)
  {
    double v23 = [(UISplitViewControllerPanelImpl *)self panelController];
    uint64_t v24 = [v23 possibleStates];
    objc_msgSend(v11, "setSupplementaryWidth:", minNonzeroSupplementaryWidthInStateWithPrimaryWidthGetMatchingState(v24, v16, 0, 0.0));

LABEL_19:
    if (v15) {
      goto LABEL_20;
    }
LABEL_29:
    *(void *)&self->_flags &= ~0x20000uLL;
    goto LABEL_30;
  }
  unint64_t v17 = [(UISplitViewControllerPanelImpl *)self panelController];
  double v18 = [v17 possibleStates];
  double v19 = minNonzeroPrimaryWidthInStates(v18, v16);

  if (v19 <= 0.0) {
    goto LABEL_19;
  }
  if (!v16)
  {
    [v11 setTrailingWidth:v19];
    if (v15) {
      goto LABEL_20;
    }
    goto LABEL_29;
  }
  [v11 setLeadingWidth:v19];
  if (!v15) {
    goto LABEL_29;
  }
LABEL_20:
  [v11 supplementaryWidth];
  if (v25 != 0.0) {
    goto LABEL_29;
  }
  [v11 leadingWidth];
  double v27 = v26;
  [v11 trailingWidth];
  if (v27 + v28 <= 0.0) {
    goto LABEL_29;
  }
  *(void *)&self->_flags |= 0x20000uLL;
  [(UISplitViewControllerPanelImpl *)self setUserGeneratedDisplayMode:3];
LABEL_30:
  id v29 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v29 animateToRequest:v11 forceOverlay:(*(void *)&self->_flags >> 17) & 1];

LABEL_38:
}

- (void)dimmingViewWasTapped:(id)a3
{
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    BOOL v4 = [(UISplitViewControllerPanelImpl *)self _shouldUseFluidSidebarGestures];
    int64_t v5 = [(UISplitViewControllerPanelImpl *)self splitBehavior];
    if (v4)
    {
      BOOL v6 = v5 == 3;
      int64_t v7 = [(UISplitViewControllerPanelImpl *)self style];
      if (![(UISplitViewControllerPanelImpl *)self _alwaysHideSidebarToggleButton]
        && v7 == 2)
      {
        unint64_t v8 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

        if (v8)
        {
          BOOL v9 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A50];
          int v10 = [v9 navigationController];
          double v11 = [v10 navigationBar];

          if (![(UIBarButtonItem *)self->_sidebarToggleButtonItem isHidden]
            || [(_UIFloatableBarButtonItem *)self->_sidebarToggleButtonItem _isFloatable]
            || [(UISplitViewControllerPanelImpl *)self displayMode] == 6)
          {
            double v12 = [(UISplitViewControllerPanelImpl *)self panelController];
            [v12 setNavigationBarForContentLayoutGuideAnimation:v11];

            objc_msgSend(v11, "_setShouldFadeStaticNavBarButton:", -[_UIFloatableBarButtonItem _isFloatable](self->_sidebarToggleButtonItem, "_isFloatable") ^ 1);
          }
        }
      }
      BOOL v13 = [(UISplitViewControllerPanelImpl *)self _allowClientAnimationCoordination];
      double v14 = [(UISplitViewControllerPanelImpl *)self panelController];
      [v14 setAnimationRequestShouldCoordinate:v13];

      [(UISplitViewControllerPanelImpl *)self _setNumberOfSidebarColumnsVisibleFromGesture:v6 withVelocity:0.0];
    }
    else
    {
      [(UISplitViewControllerPanelImpl *)self _setPrimaryShownFromGesture:0 hideAll:v5 != 3];
    }
  }
  else
  {
    [(UISplitViewControllerPanelImpl *)self _unspecifiedStyleSetPrimaryShownFromGesture:0];
  }
}

- (BOOL)_allowsFocusBehindDimmingView
{
  return 0;
}

- (int64_t)_effectiveTargetDisplayMode
{
  int64_t v4 = [(UISplitViewControllerPanelImpl *)self style];
  if (v4)
  {
    unint64_t v9 = v4;
    int v10 = [MEMORY[0x1E4F28B00] currentHandler];
    double v11 = _UISplitViewControllerStyleDescription(v9);
    [v10 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 8161, @"Incorrect code path for UISplitViewControllerStyle %@", v11 object file lineNumber description];
  }
  int64_t v5 = [(UISplitViewControllerPanelImpl *)self panelController];
  BOOL v6 = [v5 currentState];
  int64_t v7 = [(UISplitViewControllerPanelImpl *)self _displayModeForState:v6];

  return [(UISplitViewControllerPanelImpl *)self _effectiveTargetDisplayModeForDisplayMode:v7];
}

- (int64_t)_nextTargetDisplayModeForDisplayMode:(int64_t)a3 showMoreIfPossible:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v8 = [(UISplitViewControllerPanelImpl *)self style];
  if (v8 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    int v21 = [MEMORY[0x1E4F28B00] currentHandler];
    int v22 = _UISplitViewControllerStyleDescription(v8);
    [v21 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 8169, @"Incorrect code path for UISplitViewControllerStyle %@", v22 object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int v10 = [WeakRetained traitCollection];
  uint64_t v11 = [v10 horizontalSizeClass];

  if (v11 == 1)
  {
LABEL_4:
    a3 = 0;
  }
  else if (a3)
  {
    int64_t v12 = [(UISplitViewControllerPanelImpl *)self splitBehavior];
    int64_t v13 = v12;
    switch(a3)
    {
      case 1:
        if (v12 == 2) {
          a3 = 3;
        }
        else {
          a3 = 2;
        }
        break;
      case 2:
        if (v12 == 2) {
          a3 = 3;
        }
        else {
          a3 = 1;
        }
        if (v8 != 2 || v12 == 2) {
          break;
        }
        double v14 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
        int64_t v15 = 4;
        if (v13 == 3) {
          int64_t v15 = 6;
        }
        if (v14 != 0 && v4) {
          a3 = v15;
        }
        else {
          a3 = 1;
        }
        goto LABEL_30;
      case 3:
        if (v12 == 2) {
          a3 = 1;
        }
        else {
          a3 = 3;
        }
        if (v8 != 2 || v12 != 2) {
          break;
        }
        double v14 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
        int64_t v16 = 5;
        if (!v4) {
          int64_t v16 = 1;
        }
        if (v14) {
          a3 = v16;
        }
        else {
          a3 = 1;
        }
LABEL_30:

        break;
      case 4:
        int64_t v17 = 2;
        int64_t v18 = 5;
        if (v12 == 3) {
          int64_t v18 = 6;
        }
        BOOL v19 = v12 == 1;
        goto LABEL_40;
      case 5:
        int64_t v17 = 3;
        int64_t v18 = 4;
        if (v12 == 3) {
          int64_t v18 = 6;
        }
        BOOL v19 = v12 == 2;
        goto LABEL_40;
      case 6:
        int64_t v17 = 2;
        int64_t v18 = 4;
        if (v12 != 1) {
          int64_t v18 = 5;
        }
        BOOL v19 = v12 == 3;
LABEL_40:
        if (v19) {
          a3 = v17;
        }
        else {
          a3 = v18;
        }
        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
    double v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"UISplitViewControllerPanelImpl.m" lineNumber:8181 description:@"Unexpected use of UISplitViewControllerDisplayModeAutomatic. This is a UIKit issue."];

    [(UISplitViewControllerPanelImpl *)self splitBehavior];
  }

  return a3;
}

- (int64_t)_effectiveTargetDisplayModeForDisplayMode:(int64_t)a3
{
  int64_t v6 = [(UISplitViewControllerPanelImpl *)self style];
  if (v6)
  {
    unint64_t v20 = v6;
    int v21 = [MEMORY[0x1E4F28B00] currentHandler];
    int v22 = _UISplitViewControllerStyleDescription(v20);
    [v21 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 8268, @"Incorrect code path for UISplitViewControllerStyle %@", v22 object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  unint64_t v8 = [WeakRetained traitCollection];
  uint64_t v9 = [v8 horizontalSizeClass];

  if (v9 != 1 && self->_unspecifiedStyleDisplayModeButtonItem)
  {
    int v10 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector())
    {
      [(UISplitViewControllerPanelImpl *)self _pushOverrideOfReportedDisplayMode:a3];
      int64_t v11 = [v10 targetDisplayModeForActionInSplitViewController:WeakRetained];
      [(UISplitViewControllerPanelImpl *)self _popOverrideOfReportedDisplayMode];
      if (v11) {
        goto LABEL_36;
      }
    }
    id v12 = objc_loadWeakRetained((id *)&self->_svc);
    int64_t v13 = [v12 traitCollection];
    uint64_t v14 = [v13 userInterfaceIdiom];

    int64_t v11 = [WeakRetained preferredDisplayMode];
    if (a3 == 3)
    {
      BOOL v15 = 1;
    }
    else if (a3 == 1 && v14 == 1)
    {
      BOOL v15 = [(UISplitViewControllerPanelImpl *)self _iPadShouldUseOverlayInCurrentEnvironment];
    }
    else
    {
      BOOL v15 = 0;
      if (a3 == 1 && !v14) {
        BOOL v15 = [(UISplitViewControllerPanelImpl *)self _iPhoneShouldUseOverlayInCurrentEnvironment];
      }
    }
    unint64_t v16 = a3 & 0xFFFFFFFFFFFFFFFELL;
    if (v11)
    {
      if (v16 == 2)
      {
        int64_t v11 = 1;
LABEL_36:

        goto LABEL_37;
      }
      if (v11 != 1) {
        goto LABEL_36;
      }
      int64_t v11 = v14 == 1 ? 3 : 2;
      if (v14) {
        goto LABEL_36;
      }
      BOOL v17 = ![(UISplitViewControllerPanelImpl *)self _iPhoneShouldUseOverlayInCurrentEnvironment];
      uint64_t v18 = 2;
LABEL_28:
      if (v17) {
        int64_t v11 = v18;
      }
      else {
        int64_t v11 = v18 + 1;
      }
      goto LABEL_36;
    }
    if (v14 == 1)
    {
      if (!v15)
      {
        int64_t v11 = 2 * (v16 != 2);
        goto LABEL_36;
      }
    }
    else if (!v15)
    {
      BOOL v17 = v16 == 2;
      uint64_t v18 = 1;
      goto LABEL_28;
    }
    if (v16 == 2) {
      int64_t v11 = 1;
    }
    else {
      int64_t v11 = 3;
    }
    goto LABEL_36;
  }
  int64_t v11 = 0;
LABEL_37:

  return v11;
}

uint64_t __78__UISplitViewControllerPanelImpl__unspecifiedStyleUpdateDisplayModeButtonItem__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) _setShowsBackButtonIndicator:*(unsigned __int8 *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 24) setImage:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) setTitle:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 24) setHidden:*(unsigned __int8 *)(a1 + 57)];
  if (*(unsigned char *)(a1 + 56)) {
    BOOL v2 = +[UIDragInteraction isEnabledByDefault];
  }
  else {
    BOOL v2 = 0;
  }
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v3 setSpringLoaded:v2];
}

- (id)_enterFullScreenSymbolImage
{
  BOOL v2 = +[UIImage systemImageNamed:@"arrow.up.left.and.arrow.down.right"];
  BOOL v3 = [v2 imageFlippedForRightToLeftLayoutDirection];

  return v3;
}

- (id)_leaveFullScreenSymbolImage
{
  BOOL v2 = +[UIImage systemImageNamed:@"arrow.down.right.and.arrow.up.left"];
  BOOL v3 = [v2 imageFlippedForRightToLeftLayoutDirection];

  return v3;
}

- (id)_fullScreenSymbolImageForDisplayMode:(int64_t)a3
{
  if (!a3) {
    a3 = [(UISplitViewControllerPanelImpl *)self _concreteDisplayModeForCurrentEnvironment];
  }
  if (a3 == 1) {
    [(UISplitViewControllerPanelImpl *)self _leaveFullScreenSymbolImage];
  }
  else {
  BOOL v4 = [(UISplitViewControllerPanelImpl *)self _enterFullScreenSymbolImage];
  }
  return v4;
}

- (id)_sidebarChevronSymbolImage
{
  if ([(UISplitViewControllerPanelImpl *)self _isPrimaryLeading]) {
    BOOL v2 = @"chevron.backward";
  }
  else {
    BOOL v2 = @"chevron.forward";
  }
  return +[UIImage systemImageNamed:v2];
}

- (void)_setVisibleToggleButtonRequiresPresentsWithGesture:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (a3) {
    uint64_t v3 = 0;
  }
  self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (void)_setForceDisplayModeBarButtonHidden:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(UISplitViewControllerPanelImpl *)self _isDisplayModeBarButtonVisible];
  uint64_t v6 = 0x200000;
  if (!v3) {
    uint64_t v6 = 0;
  }
  self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v6);
  if (v3)
  {
    int v7 = 0;
    int v8 = 1;
  }
  else
  {
    int v8 = ![(UISplitViewControllerPanelImpl *)self _alwaysHideSidebarToggleButton];
    int v7 = (*((unsigned char *)&self->_flags + 2) & 0x20) == 0;
  }
  if (v5 != v7 && v8)
  {
    [(UISplitViewControllerPanelImpl *)self _updateDisplayModeButtonItem];
    [(UISplitViewControllerPanelImpl *)self _invalidateAllowsTriggeringSidebarKeyCommandAction];
  }
}

uint64_t __77__UISplitViewControllerPanelImpl__updateDisplayModeButtonItemForDisplayMode___block_invoke_2(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(result + 32) == a2)
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)_unspecifiedStyleTriggerDisplayModeAction:(id)a3
{
  int v4 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
  int64_t v5 = [(UISplitViewControllerPanelImpl *)self _effectiveTargetDisplayMode];
  if ((unint64_t)(v5 - 2) >= 2)
  {
    if (v5 != 1) {
      return;
    }
    int64_t v11 = [(UISplitViewControllerPanelImpl *)self panelController];
    id v12 = [v11 currentState];
    id v14 = [v12 stateRequest];

    if (v4) {
      [v14 setLeadingWidth:0.0];
    }
    else {
      [v14 setTrailingWidth:0.0];
    }
    uint64_t v9 = [(UISplitViewControllerPanelImpl *)self panelController];
    [v9 animateToRequest:v14];
  }
  else
  {
    [(UISplitViewControllerPanelImpl *)self _setPanelConfigurationWithIsPrimaryShown:1 shouldUseOverlay:v5 == 3];
    uint64_t v6 = [(UISplitViewControllerPanelImpl *)self panelController];
    id v14 = [v6 uncachedPossibleStates];

    int v7 = [(UISplitViewControllerPanelImpl *)self panelController];
    int v8 = [v7 currentState];
    uint64_t v9 = [v8 stateRequest];

    double v10 = minNonzeroPrimaryWidthInStates(v14, v4);
    if (v4) {
      [v9 setLeadingWidth:v10];
    }
    else {
      [v9 setTrailingWidth:v10];
    }
    int64_t v13 = [(UISplitViewControllerPanelImpl *)self panelController];
    [v13 animateToRequest:v9];
  }
}

- (void)_validateTriggerSidebarKeyCommand:(id)a3
{
  $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
  id v4 = a3;
  if ((*(_DWORD *)&flags & 0x800000) != 0) {
    int64_t v5 = @"Hide Sidebar";
  }
  else {
    int64_t v5 = @"Show Sidebar";
  }
  _UINSLocalizedStringWithDefaultValue(v5, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setTitle:v6];
}

- (BOOL)_allowsTriggeringSidebarKeyCommandAction
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (void)_triggerSidebarKeyCommandAction:(id)a3
{
  unint64_t v5 = [(UISplitViewControllerPanelImpl *)self style];
  if (v5 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    double v10 = _UISplitViewControllerStyleDescription(v5);
    [v9 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 8931, @"Incorrect code path for UISplitViewControllerStyle %@", v10 object file lineNumber description];
  }
  if (![(UISplitViewControllerPanelImpl *)self _isCollapsedOrCollapsing])
  {
    unint64_t v6 = [(UISplitViewControllerPanelImpl *)self displayMode];
    if (v5 == 2)
    {
      int v7 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

      if (v7)
      {
        int64_t v8 = 1;
        if (v6 > 6)
        {
LABEL_9:
          [(UISplitViewControllerPanelImpl *)self _transitionFromDisplayMode:v6 toDisplayMode:v8];
          return;
        }
        if (((1 << v6) & 0x56) == 0)
        {
          if (v6 != 3) {
            goto LABEL_9;
          }
          if ((*((unsigned char *)&self->_flags + 2) & 2) != 0) {
            -[UISplitViewControllerPanelImpl setUserGeneratedDisplayMode:](self, "setUserGeneratedDisplayMode:", 2, 1);
          }
        }
      }
    }
    int64_t v8 = [(UISplitViewControllerPanelImpl *)self _nextTargetDisplayModeForDisplayMode:v6 showMoreIfPossible:1];
    goto LABEL_9;
  }
}

- (void)_triggerSecondaryOnlyShortcutAction:(id)a3
{
  int64_t v4 = [(UISplitViewControllerPanelImpl *)self displayMode];
  if (v4 == 1) {
    int64_t v5 = [(UISplitViewControllerPanelImpl *)self _nextTargetDisplayModeForDisplayMode:1 showMoreIfPossible:1];
  }
  else {
    int64_t v5 = 1;
  }
  [(UISplitViewControllerPanelImpl *)self _transitionFromDisplayMode:v4 toDisplayMode:v5 updateSplitBehaviorOverrides:0 userGenerated:1];
}

- (void)_triggerDisplayModeAction:(id)a3
{
  id v8 = a3;
  if ([(UISplitViewControllerPanelImpl *)self style])
  {
    int64_t v4 = [(UISplitViewControllerPanelImpl *)self displayMode];
    int64_t v5 = [(UISplitViewControllerPanelImpl *)self _nextTargetDisplayModeForDisplayMode:v4 showMoreIfPossible:1];
    BOOL v6 = [(UISplitViewControllerPanelImpl *)self _allowClientAnimationCoordination];
    int v7 = [(UISplitViewControllerPanelImpl *)self panelController];
    [v7 setAnimationRequestShouldCoordinate:v6];

    if (qword_1EB260170 != -1) {
      dispatch_once(&qword_1EB260170, &__block_literal_global_1405);
    }
    [(UISplitViewControllerPanelImpl *)self _transitionFromDisplayMode:v4 toDisplayMode:v5];
  }
  else
  {
    [(UISplitViewControllerPanelImpl *)self _unspecifiedStyleTriggerDisplayModeAction:v8];
  }
}

- (void)_displayModeBarButtonItemWasUsedForFirstTime:(id)a3
{
  id v3 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v3 setNeedsUpdate];
}

- (id)_childContainingSender:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    int64_t v5 = [(UISplitViewControllerPanelImpl *)self panelController];
    BOOL v6 = [v5 allViewControllers];

    id v7 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v4 _isMemberOfViewControllerHierarchy:v10])
          {
            id v7 = v10;
            goto LABEL_13;
          }
        }
        id v7 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_pushOverrideOfReportedDisplayMode:(int64_t)a3
{
  overrideReportedDisplayModeStack = self->_overrideReportedDisplayModeStack;
  if (!overrideReportedDisplayModeStack)
  {
    BOOL v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = self->_overrideReportedDisplayModeStack;
    self->_overrideReportedDisplayModeStack = v6;

    overrideReportedDisplayModeStack = self->_overrideReportedDisplayModeStack;
  }
  id v8 = [NSNumber numberWithInteger:a3];
  [(NSMutableArray *)overrideReportedDisplayModeStack addObject:v8];
}

- (void)_popOverrideOfReportedDisplayMode
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v4 = [(NSMutableArray *)self->_overrideReportedDisplayModeStack count];
  if (has_internal_diagnostics)
  {
    if (!v4)
    {
      int64_t v5 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "UISVCPanelImpl _popOverrideOfReportedDisplayMode: stack is empty, can't pop", buf, 2u);
      }
    }
  }
  else if (!v4)
  {
    BOOL v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_popOverrideOfReportedDisplayMode___s_category) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "UISVCPanelImpl _popOverrideOfReportedDisplayMode: stack is empty, can't pop", v7, 2u);
    }
  }
  [(NSMutableArray *)self->_overrideReportedDisplayModeStack removeLastObject];
}

- (int64_t)_primaryHidingState
{
  return (*(void *)&self->_flags >> 1) & 3;
}

- (BOOL)_iPadShouldUseOverlayInCurrentEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if ((*(void *)&self->_flags & 0x100) != 0)
  {
    int64_t transitioningToOrientation = self->_transitioningToOrientation;
    goto LABEL_3;
  }
  int64_t transitioningToOrientation = [(UISplitViewControllerPanelImpl *)self _svcViewWindowOrientation];
  if ((*(void *)&self->_flags & 0x100) != 0)
  {
LABEL_3:
    double width = self->_transitioningToSize.width;
    goto LABEL_6;
  }
  BOOL v6 = [WeakRetained view];
  [v6 bounds];
  double width = v7;

LABEL_6:
  int64_t v8 = [(UISplitViewControllerPanelImpl *)self _fullScreenStateForOrientation:transitioningToOrientation viewWidth:width];
  BOOL v9 = (unint64_t)(transitioningToOrientation - 1) < 2;
  if (v8 == 2) {
    BOOL v9 = 0;
  }
  BOOL v10 = v8 == 1 || v9;

  return v10;
}

- (BOOL)_iPhoneShouldUseOverlayInCurrentEnvironment
{
  BOOL v3 = [(UISplitViewControllerPanelImpl *)self usesDeviceOverlayPreferences]
    && [(UISplitViewControllerPanelImpl *)self prefersOverlayInRegularWidthPhone]
    || +[UISplitViewController _automaticDisplayModeOnPhoneUsesOverlayInLandscapeDefaultValue];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v5 = ([WeakRetained presentsWithGesture] & 1) != 0
    || [(UISplitViewControllerDisplayModeBarButtonItem *)self->_unspecifiedStyleDisplayModeButtonItem _hasBeenUsed];

  return v3 && v5;
}

- (int64_t)_currentInterfaceIdiom
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v3 = [WeakRetained traitCollection];
  int64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != -1) {
    return v4;
  }
  BOOL v6 = +[UIDevice currentDevice];
  int64_t v7 = [v6 userInterfaceIdiom];

  return v7;
}

- (int64_t)_fullScreenStateForOrientation:(int64_t)a3 viewWidth:(double)a4
{
  int64_t v7 = +[UIDevice currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 != 1) {
    return 0;
  }
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int64_t v11 = [WeakRetained _screen];

  id v12 = objc_loadWeakRetained((id *)p_svc);
  long long v13 = [v12 _window];
  long long v14 = [v13 _windowHostingScene];
  char v15 = [v14 _sceneSessionRoleIsCarPlayOrNonInteractiveExternal];

  if ((v15 & 1) != 0 || ([v11 _boundsForInterfaceOrientation:a3], v16 <= a4))
  {
    int64_t v18 = 0;
  }
  else
  {
    double v20 = fmax(v16, v17);
    unint64_t v21 = a3 - 5;
    double v22 = v16 * 0.5;
    if (v20 <= 1210.0 || v21 < 0xFFFFFFFFFFFFFFFELL || (v16 * 0.3 < a4 ? (BOOL v23 = v22 < a4) : (BOOL v23 = 1), v23))
    {
      if (v21 > 0xFFFFFFFFFFFFFFFDLL && v22 < a4 && v20 <= 1112.0 && v20 <= 1210.0) {
        int64_t v18 = 1;
      }
      else {
        int64_t v18 = 2;
      }
    }
    else
    {
      int64_t v18 = 1;
    }
  }

  return v18;
}

- (BOOL)_setPanelConfigurationWithIsPrimaryShown:(BOOL)a3 isSupplementaryShown:(BOOL)a4 shouldUseOverlay:(BOOL)a5 dimMainIfNecessary:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  v62[1] = *MEMORY[0x1E4F143B8];
  int64_t v12 = [(UISplitViewControllerPanelImpl *)self style];
  if ((unint64_t)(v12 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v53 = v12;
    uint64_t v54 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v55 = _UISplitViewControllerStyleDescription(v53);
    [v54 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 9272, @"Incorrect code path for UISplitViewControllerStyle %@", v55 object file lineNumber description];
  }
  int v13 = v9 || v8;
  int v14 = v9 && v8;
  uint64_t v15 = 2;
  if (v9 && v8) {
    uint64_t v15 = 4;
  }
  uint64_t v16 = 2;
  if (v14) {
    uint64_t v16 = 6;
  }
  if (v6) {
    uint64_t v15 = v16;
  }
  BOOL v34 = v14 == 0;
  uint64_t v17 = 3;
  if (!v34) {
    uint64_t v17 = 5;
  }
  if (!v7) {
    uint64_t v17 = v15;
  }
  if (v13 == 1) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 1;
  }
  double v59 = 0.0;
  double v60 = 0.0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  double v20 = [WeakRetained _existingView];
  BOOL v57 = v7;
  BOOL v58 = v8;
  if (!v20)
  {
    BOOL v27 = v6;

LABEL_22:
    double v28 = (void *)MEMORY[0x1E4F1CBF0];
    double v56 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_23;
  }

  if (!v13)
  {
    BOOL v27 = v6;
    goto LABEL_22;
  }
  if (*((unsigned char *)&self->_flags + 1))
  {
    double width = self->_transitioningToSize.width;
    double height = self->_transitioningToSize.height;
  }
  else
  {
    id v21 = objc_loadWeakRetained((id *)&self->_svc);
    double v22 = [v21 view];
    [v22 bounds];
    double width = v23;
    double height = v25;
  }
  -[UISplitViewControllerPanelImpl getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:shouldUseOverlay:](self, "getPrimaryColumnWidth:supplementaryColumnWidth:forSize:displayMode:shouldUseOverlay:", &v60, &v59, v18, v7, width, height);
  if (v60 <= 0.0)
  {
    double v28 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v39 = [NSNumber numberWithDouble:v60];
    v62[0] = v39;
    double v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
  }
  BOOL v27 = v6;
  if (v59 <= 0.0)
  {
    double v56 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    double v40 = [NSNumber numberWithDouble:v59];
    double v61 = v40;
    double v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
  }
LABEL_23:
  int64_t v29 = [(UISplitViewControllerPanelImpl *)self _nextTargetDisplayModeForDisplayMode:v18 showMoreIfPossible:0];
  double v30 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v30 configuration];
  v32 = unint64_t v31 = v18;

  unint64_t v33 = v31;
  if (v29) {
    BOOL v34 = v29 == v31;
  }
  else {
    BOOL v34 = 1;
  }
  BOOL v35 = !v34;
  int v36 = !v34 || v57;
  int v37 = !v9 | v36;
  BOOL v38 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
  if (!v9 || !v58)
  {
    if (!v9)
    {
      if (v38) {
        [v32 leadingWidths];
      }
      else {
      uint64_t v41 = [v32 trailingWidths];
      }

      double v28 = (void *)v41;
    }
    if (!v58)
    {
      uint64_t v42 = [v32 supplementaryWidths];

      double v56 = (void *)v42;
    }
  }
  [(_UIHyperConstantExtender *)self->_extender _maximumDistance];
  objc_msgSend(v32, "setRubberBandExtension:");
  [v32 setSupplementaryEdge:self->_primaryEdge];
  [v32 setLeadingMayBeHidden:v37 & v38];
  [v32 setTrailingMayBeHidden:v37 & !v38];
  BOOL v43 = v33 < 4 && v35;
  unsigned int v44 = v43 || v57;
  if (v58) {
    uint64_t v45 = v44;
  }
  else {
    uint64_t v45 = 1;
  }
  [v32 setSupplementaryMayBeHidden:v45];
  double v46 = 0.0;
  if (v57) {
    double v46 = 1.0;
  }
  [v32 setMinimumMainWidthFraction:v46];
  if (v38) {
    double v47 = v28;
  }
  else {
    double v47 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (v38) {
    double v48 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else {
    double v48 = v28;
  }
  [v32 setLeadingWidths:v47];
  [v32 setTrailingWidths:v48];
  [v32 setSupplementaryWidths:v56];
  [v32 setAllowTotalWidthGreaterThanParent:!v57 & v27];
  BOOL v49 = v57 && [(UISplitViewControllerPanelImpl *)self userGeneratedDisplayMode] == 3;
  [v32 setForceOverlay:v49];
  BOOL v50 = ([v32 forceOverlay] & 1) != 0
     || [(UISplitViewControllerPanelImpl *)self splitBehavior] != 1;
  [v32 setShouldFadeStaticNavBarButton:v50];
  double v51 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v51 setConfiguration:v32];

  return v35;
}

- (BOOL)_setPanelConfigurationWithIsPrimaryShown:(BOOL)a3 shouldUseOverlay:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v39[1] = *MEMORY[0x1E4F143B8];
  int64_t v8 = [(UISplitViewControllerPanelImpl *)self style];
  if (v8)
  {
    unint64_t v36 = v8;
    int v37 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v38 = _UISplitViewControllerStyleDescription(v36);
    [v37 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 9337, @"Incorrect code path for UISplitViewControllerStyle %@", v38 object file lineNumber description];
  }
  BOOL v9 = (void *)MEMORY[0x1E4F1CBF0];
  BOOL v10 = (void *)MEMORY[0x1E4F1CBF0];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    int64_t v12 = [WeakRetained _existingView];

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_svc);
      int v14 = [v13 view];
      [v14 bounds];
      -[UISplitViewControllerPanelImpl _primaryColumnWidthForSize:shouldUseOverlay:](self, "_primaryColumnWidthForSize:shouldUseOverlay:", v4, v15, v16);
      double v18 = v17;

      BOOL v19 = [NSNumber numberWithDouble:v18];
      v39[0] = v19;
      BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    }
    else
    {
      BOOL v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  uint64_t v20 = 2;
  if (v4)
  {
    uint64_t v20 = 3;
    double v21 = 1.0;
  }
  else
  {
    double v21 = 0.0;
  }
  if (v5) {
    uint64_t v22 = v20;
  }
  else {
    uint64_t v22 = 1;
  }
  int64_t v23 = [(UISplitViewControllerPanelImpl *)self _effectiveTargetDisplayModeForDisplayMode:v22];
  uint64_t v24 = [(UISplitViewControllerPanelImpl *)self panelController];
  double v25 = [v24 configuration];
  double v26 = (void *)[v25 copy];

  if (v23) {
    BOOL v27 = v23 == v22;
  }
  else {
    BOOL v27 = 1;
  }
  BOOL v28 = !v27;
  int v29 = !v27 || v4;
  int v30 = !v5 | v29;
  BOOL v31 = [(UISplitViewControllerPanelImpl *)self _isPrimaryLeading];
  [v26 setLeadingMayBeHidden:v30 & v31];
  [v26 setTrailingMayBeHidden:v30 & !v31];
  [v26 setMinimumMainWidthFraction:v21];
  if (v31) {
    id v32 = v10;
  }
  else {
    id v32 = v9;
  }
  if (v31) {
    unint64_t v33 = v9;
  }
  else {
    unint64_t v33 = v10;
  }
  [v26 setLeadingWidths:v32];
  [v26 setTrailingWidths:v33];
  BOOL v34 = [(UISplitViewControllerPanelImpl *)self panelController];
  [v34 setConfiguration:v26];

  return v28;
}

- (void)_stopTransitionsInViewController:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 _stopTransitionsImmediately];
  BOOL v5 = [v4 childViewControllers];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(UISplitViewControllerPanelImpl *)self _stopTransitionsInViewController:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_tabBarControllerDidChangeSelection:(id)a3
{
  id v4 = a3;
  if (-[UISplitViewControllerPanelImpl _columnForViewController:](self, "_columnForViewController:") == 2) {
    [(UISplitViewControllerPanelImpl *)self setViewController:v4 forColumn:2];
  }
}

- (BOOL)_navigationControllerShouldNotAdjustTransitioningSizeForChildContainer:(id)a3
{
  return (unint64_t)[(UISplitViewControllerPanelImpl *)self _columnForMonitoredNavigationController:a3] < 3;
}

void __116__UISplitViewControllerPanelImpl__updateDisplayModeButtonItemAndResetForCanceledAnimationWithTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isCancelled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _updateDisplayModeButtonItem];
  }
}

- (id)_navigationController:(id)a3 navigationBarAdditionalActionsForBackButtonMenu:(id)a4
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(UISplitViewControllerPanelImpl *)self style];
  if (v7 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    BOOL v31 = [MEMORY[0x1E4F28B00] currentHandler];
    id v32 = _UISplitViewControllerStyleDescription(v7);
    [v31 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 9584, @"Incorrect code path for UISplitViewControllerStyle %@", v32 object file lineNumber description];
  }
  uint64_t v8 = [(UISplitViewControllerPanelImpl *)self panelController];
  if ([v8 collapsedState])
  {

LABEL_18:
    double v17 = 0;
    goto LABEL_19;
  }
  BOOL v9 = [(UIBarButtonItem *)self->_sidebarToggleButtonItem _actsAsFakeBackButton];

  if (!v9) {
    goto LABEL_18;
  }
  int64_t v10 = [(UISplitViewControllerPanelImpl *)self _columnForMonitoredNavigationController:v6];
  int64_t v11 = [(UISplitViewControllerPanelImpl *)self splitBehavior];
  int64_t v12 = [(UISplitViewControllerPanelImpl *)self displayMode];
  int64_t v13 = v12;
  if (v10 != 2 || v12 != 1 || v11 != 2)
  {
    double v17 = 0;
    if (v7 != 2 || v10 != 1) {
      goto LABEL_19;
    }
    double v18 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
    if (!v18) {
      goto LABEL_18;
    }
    if (v13 == 3)
    {
    }
    else
    {

      double v17 = 0;
      if (v13 != 2 || v11 != 3) {
        goto LABEL_19;
      }
    }
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  BOOL v34 = __104__UISplitViewControllerPanelImpl__navigationController_navigationBarAdditionalActionsForBackButtonMenu___block_invoke;
  BOOL v35 = &unk_1E52E9D00;
  unint64_t v36 = self;
  if (v7 != 2)
  {
    if (v10 == 2)
    {
      int v14 = __104__UISplitViewControllerPanelImpl__navigationController_navigationBarAdditionalActionsForBackButtonMenu___block_invoke;
LABEL_12:
      uint64_t v15 = v14((uint64_t)v33, 0);
      double v16 = 0;
LABEL_32:
      BOOL v24 = v15 != 0;
      BOOL v25 = v16 != 0;
      goto LABEL_33;
    }
    goto LABEL_30;
  }
  uint64_t v22 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

  if (!v22)
  {
    if (v10 == 2)
    {
      int64_t v23 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];

      int v14 = v34;
      if (v23) {
        goto LABEL_12;
      }
      double v16 = v34((uint64_t)v33, 1uLL);
LABEL_31:
      uint64_t v15 = 0;
      goto LABEL_32;
    }
LABEL_30:
    double v16 = 0;
    goto LABEL_31;
  }
  if (v10 == 2)
  {
    double v16 = v34((uint64_t)v33, 1uLL);
  }
  else
  {
    double v16 = 0;
  }
  uint64_t v30 = v34((uint64_t)v33, 0);
  uint64_t v15 = (void *)v30;
  BOOL v24 = v30 != 0;
  BOOL v25 = v16 != 0;
  if (v30 && v16)
  {
    v38[0] = v16;
    v38[1] = v30;
    BOOL v27 = (void *)MEMORY[0x1E4F1C978];
    BOOL v28 = (void **)v38;
    uint64_t v29 = 2;
LABEL_43:
    double v17 = [v27 arrayWithObjects:v28 count:v29];
    goto LABEL_44;
  }
LABEL_33:
  if (v24 || v25)
  {
    if (v25) {
      double v26 = v16;
    }
    else {
      double v26 = v15;
    }
    int v37 = v26;
    BOOL v27 = (void *)MEMORY[0x1E4F1C978];
    BOOL v28 = &v37;
    uint64_t v29 = 1;
    goto LABEL_43;
  }
  double v17 = 0;
LABEL_44:

LABEL_19:
  if (v17) {
    BOOL v19 = v17;
  }
  else {
    BOOL v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v20 = v19;

  return v20;
}

id __104__UISplitViewControllerPanelImpl__navigationController_navigationBarAdditionalActionsForBackButtonMenu___block_invoke(uint64_t a1, unint64_t a2)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  BOOL v5 = [NSNumber numberWithInteger:a2];
  id v6 = [v4 objectForKeyedSubscript:v5];
  unint64_t v7 = [v6 viewController];
  uint64_t v8 = [v7 navigationItem];
  BOOL v9 = [v8 _backButtonTitleAllowingGenericTitles:0];

  if ([v9 length])
  {
    int64_t v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v11 = [v9 stringByTrimmingCharactersInSet:v10];

    BOOL v9 = (void *)v11;
  }
  if ([v9 length])
  {
    int64_t v12 = NSString;
    int64_t v13 = _UISplitViewControllerColumnDescription(a2);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    uint64_t v15 = [v12 stringWithFormat:@"Show%@<UISplitViewController:%p>", v13, WeakRetained];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __104__UISplitViewControllerPanelImpl__navigationController_navigationBarAdditionalActionsForBackButtonMenu___block_invoke_2;
    v18[3] = &unk_1E52E9CD8;
    v18[4] = *(void *)(a1 + 32);
    v18[5] = a2;
    double v16 = +[UIAction actionWithTitle:v9 image:0 identifier:v15 handler:v18];
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

uint64_t __104__UISplitViewControllerPanelImpl__navigationController_navigationBarAdditionalActionsForBackButtonMenu___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) showColumn:*(void *)(a1 + 40)];
}

- (void)_allowingMutationsInDelegateCallback:(id)a3
{
  $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
  self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&flags & 0xFFFFFFFFF7FFFFFFLL);
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | (((*(unint64_t *)&flags >> 27) & 1) << 27));
}

- (BOOL)_hasDoubleSideBar
{
  int64_t v4 = [(UISplitViewControllerPanelImpl *)self style];
  unint64_t v5 = v4;
  if ((unint64_t)(v4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v9 = _UISplitViewControllerStyleDescription(v5);
    [v6 handleFailureInMethod:a2, self, @"UISplitViewControllerPanelImpl.m", 9649, @"Incorrect code path for UISplitViewControllerStyle %@", v9 object file lineNumber description];

    BOOL v7 = 0;
  }
  else
  {
    if (v4 != 2) {
      return 0;
    }
    id v6 = [(NSMutableDictionary *)self->_perColumnViewControllers objectForKeyedSubscript:&unk_1ED3F3A20];
    BOOL v7 = v6 != 0;
  }

  return v7;
}

- (UISplitViewController)splitViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  return (UISplitViewController *)WeakRetained;
}

- (void)_setPrimaryOffscreenGestureMode:(int64_t)a3
{
  self->__primaryOffscreenGestureMode = a3;
}

- (id)_primaryViewControllerFocusPromiseItem
{
  return 0;
}

- (void)_handleArrowPress:(id)a3
{
  id v7 = a3;
  id v4 = [(UISplitViewControllerPanelImpl *)self _sidebarArrowButtonRecognizer];

  unint64_t v5 = v7;
  if (v4 == v7)
  {
    BOOL v6 = [v7 state] == 3;
    unint64_t v5 = v7;
    if (v6 || (BOOL v6 = [v7 state] == 4, v5 = v7, v6)) {
      *(void *)&self->_flags &= ~0x80000000000uLL;
    }
  }
}

- (int64_t)primaryBackgroundStyle
{
  return self->_primaryBackgroundStyle;
}

- (BOOL)_shouldShowNSToolbarSidebarToggle
{
  if ([(UISplitViewControllerPanelImpl *)self style]) {
    return ![(UISplitViewControllerPanelImpl *)self _alwaysHideSidebarToggleButton];
  }
  else {
    return 1;
  }
}

- (void)setSupplementaryColumnAdoptsPrimaryBackgroundStyle:(BOOL)a3
{
  $692BA5F601ABB544448C4E0A48A865F8 flags = self->_flags;
  if (((((*(void *)&flags & 0x40000000000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v5 = 0x40000000000;
    if (!a3) {
      uint64_t v5 = 0;
    }
    self->_$692BA5F601ABB544448C4E0A48A865F8 flags = ($692BA5F601ABB544448C4E0A48A865F8)(*(void *)&flags & 0xFFFFFBFFFFFFFFFFLL | v5);
    [(UISplitViewControllerPanelImpl *)self _updateConfigurationBackgroundStyle];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    [WeakRetained _updateTraitsIfNecessary];
  }
}

- (BOOL)supplementaryColumnAdoptsPrimaryBackgroundStyle
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 2) & 1;
}

- (BOOL)_wantsFloatingSidebar
{
  BOOL v2 = [(UISplitViewControllerPanelImpl *)self panelController];
  char v3 = [v2 wantsFloatingSidebar];

  return v3;
}

- (int64_t)_primaryOffscreenGestureMode
{
  return self->__primaryOffscreenGestureMode;
}

- (double)preferredPrimaryColumnWidthFraction
{
  return self->_preferredPrimaryColumnWidthFraction;
}

- (double)preferredSupplementaryColumnWidth
{
  return self->_preferredSupplementaryColumnWidth;
}

- (double)preferredSupplementaryColumnWidthFraction
{
  return self->_preferredSupplementaryColumnWidthFraction;
}

- (double)minimumSupplementaryColumnWidth
{
  return self->_minimumSupplementaryColumnWidth;
}

- (double)maximumSupplementaryColumnWidth
{
  return self->_maximumSupplementaryColumnWidth;
}

- (UIImage)_fullScreenButtonImage
{
  return self->__fullScreenButtonImage;
}

- (void)_setFullScreenButtonImage:(id)a3
{
}

- (UITapGestureRecognizer)_menuGestureRecognizer
{
  return self->_menuGestureRecognizer;
}

- (int64_t)_lastFocusedChildViewControllerColumn
{
  return self->_lastFocusedChildViewControllerColumn;
}

- (UIFocusContainerGuide)_masterFocusContainerGuide
{
  return self->_masterFocusContainerGuide;
}

- (UIFocusContainerGuide)_detailFocusContainerGuide
{
  return self->_detailFocusContainerGuide;
}

- (UILongPressGestureRecognizer)_sidebarArrowButtonRecognizer
{
  return self->_sidebarArrowButtonRecognizer;
}

- (void)setTabBarHostedView:(id)a3
{
}

@end