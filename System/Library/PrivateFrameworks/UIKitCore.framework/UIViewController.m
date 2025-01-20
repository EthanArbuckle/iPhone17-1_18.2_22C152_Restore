@interface UIViewController
+ (BOOL)_allViewControllersInArray:(id)a3 allowAutorotationToInterfaceOrientation:(int64_t)a4 predicate:(id)a5;
+ (BOOL)_directlySetsContentOverlayInsetsForChildren;
+ (BOOL)_doesOverrideLegacyShouldAutorotateMethod;
+ (BOOL)_initializedByViewServices;
+ (BOOL)_isSecureForRemoteViewService;
+ (BOOL)_isViewSizeFullScreen:(id)a3 inWindow:(id)a4;
+ (BOOL)_isViewSizeFullScreen:(id)a3 inWindow:(id)a4 ignoreInWindowCheck:(BOOL)a5;
+ (BOOL)_preventsAppearanceProxyCustomization;
+ (BOOL)_shouldAnimateTransitions;
+ (BOOL)_shouldDeferTransitions;
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (BOOL)_shouldSendLegacyMethodsFromViewWillTransitionToSize;
+ (BOOL)_shouldUseLegacyUnwindDestinationSearch;
+ (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing;
+ (BOOL)doesOverridePreferredInterfaceOrientationForPresentation;
+ (BOOL)doesOverrideViewControllerMethod:(SEL)a3;
+ (BOOL)doesOverrideViewControllerMethod:(SEL)a3 inBaseClass:(Class)a4;
+ (CGSize)defaultFormSheetSize;
+ (CGSize)defaultFormSheetSizeForScreenSize:(CGSize)a3;
+ (double)_boundsWidthWithMinimumHorizontalContentMarginForView:(id)a3 preservingContentWidth:(double)a4;
+ (double)_horizontalContentMarginForView:(id)a3;
+ (double)_horizontalContentMarginForView:(id)a3 ofWidth:(double)a4;
+ (double)_slimHorizontalContentMarginForTraitCollection:(id)a3;
+ (double)durationForTransition:(int)a3;
+ (id)XPCInterface;
+ (id)_allDescriptions;
+ (id)_exportedInterface;
+ (id)_printHierarchy;
+ (id)_remoteViewControllerInterface;
+ (id)_safeAreaInsetsTrace;
+ (id)_traitCollectionWithParentTraitCollection:(id)a3 overrideTraitCollection:(id)a4;
+ (id)_viewControllerForFullScreenPresentationFromView:(id)a3;
+ (id)_whitelistOfSubclassableViewControllersMarkedSafe;
+ (id)viewControllerForView:(id)a3;
+ (int)_keyboardDirectionForTransition:(int)a3;
+ (void)_performWithoutDeferringTransitions:(id)a3;
+ (void)_performWithoutDeferringTransitionsAllowingAnimation:(void *)a3 actions:;
+ (void)_scheduleTransition:(id)a3;
+ (void)_sendPrepareForTapGesture:(uint64_t)a1;
+ (void)_setShouldDeferTransitions:(BOOL)a3;
+ (void)_traverseViewControllerHierarchyWithDelayedRelease:(id)a3;
+ (void)_withDisabledAppearanceTransitions:(BOOL)a3 forDescendantsOf:(id)a4 visibleOnly:(BOOL)a5 perform:(id)a6;
+ (void)_withDisabledAppearanceTransitionsForVisibleDescendantsOf:(id)a3 perform:(id)a4;
+ (void)attemptRotationToDeviceOrientation;
+ (void)initialize;
+ (void)removeViewControllerForView:(id)a3;
+ (void)setViewController:(id)a3 forView:(id)a4;
- ($0AC6E346AE4835514AAA8AC86D8F4844)__sizeClassPair;
- ($0AC6E346AE4835514AAA8AC86D8F4844)_presentationSizeClassPair;
- ($109F14CB9CD3811A6C59613AC76ACC48)_cumulativeOverlayInsetsInView:(SEL)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)_hostAuditToken;
- (BOOL)__isKindOfUIViewController;
- (BOOL)__knownPresentationWithoutPresentationControllerInstance;
- (BOOL)__withSupportedInterfaceOrientation:(void *)a3 apply:;
- (BOOL)_allowNestedNavigationControllers;
- (BOOL)_allowsAutorotation;
- (BOOL)_allowsFreezeLayoutForOrientationChangeOnDismissal;
- (BOOL)_allowsSkippingLayout;
- (BOOL)_allowsStylingSheetsAsCards;
- (BOOL)_allowsUserInteractionWhenPreviewedInContextMenu;
- (BOOL)_ancestorViewControllerIsInPopover;
- (BOOL)_canBecomeFirstResponder;
- (BOOL)_canPerformUnwindSegueAction:(SEL)a3 fromViewController:(id)a4 sender:(id)a5;
- (BOOL)_canReloadView;
- (BOOL)_canResignIfContainsFirstResponder;
- (BOOL)_canRestoreFocusAfterTransitionToItem:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_containsFirstResponder;
- (BOOL)_defersToPresentingViewControllerForSupportedInterfaceOrientations;
- (BOOL)_displaysFullScreen;
- (BOOL)_formSheetObeysContentContainerSize;
- (BOOL)_forwardAppearanceMethods;
- (BOOL)_forwardRotationMethods;
- (BOOL)_freezeLayoutForOrientationChangeOnDismissal;
- (BOOL)_hackFor11408026_beginAppearanceTransition:(BOOL)a3 animated:(BOOL)a4;
- (BOOL)_hackFor11408026_endAppearanceTransition;
- (BOOL)_handlesCounterRotationForPresentation;
- (BOOL)_hasAppeared;
- (BOOL)_hasDeepestActionResponder;
- (BOOL)_hasDeepestPresentedActionResponderOrBlock:(id)a3;
- (BOOL)_hasPreferredInterfaceOrientationForPresentation;
- (BOOL)_ignoreAppSupportedOrientations;
- (BOOL)_ignoresWrapperViewForContentOverlayInsets;
- (BOOL)_isContainmentChanging;
- (BOOL)_isDelayingPresentation;
- (BOOL)_isDetachedFromWindowRootViewControllerHierarchy;
- (BOOL)_isDimmingBackground;
- (BOOL)_isHostedRootViewController;
- (BOOL)_isInContextOfPresentationControllerOfClass:(Class)a3 effective:(BOOL)a4;
- (BOOL)_isInCustomTransition;
- (BOOL)_isInPopoverPresentation;
- (BOOL)_isInSheetPresentation;
- (BOOL)_isInViewControllerThatHandlesKeyboardAvoidance;
- (BOOL)_isInterfaceAutorotationDisabled;
- (BOOL)_isMemberOfViewControllerHierarchy:(id)a3;
- (BOOL)_isModalSheet;
- (BOOL)_isNavigationController;
- (BOOL)_isNestedNavigationController;
- (BOOL)_isPresentationContextByDefault;
- (BOOL)_isPresentedFormSheet;
- (BOOL)_isRootViewController;
- (BOOL)_isSearchController;
- (BOOL)_isSplitViewController;
- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3;
- (BOOL)_isTVSearchControllerContainer;
- (BOOL)_isTabBarController;
- (BOOL)_isViewController;
- (BOOL)_isViewControllerForObservableScrollViewAmbiguous;
- (BOOL)_isViewControllerInWindowHierarchy;
- (BOOL)_mayForwardPresentationsToPresentedViewController;
- (BOOL)_monitorsSystemLayoutFittingSize;
- (BOOL)_navControllerIsLayingOutTopViewController;
- (BOOL)_nextResponderIgnoresWindowIfRootVC;
- (BOOL)_optsOutOfPopoverControllerHierarchyCheck;
- (BOOL)_overrideUseCustomPresentation;
- (BOOL)_providesCustomBasePresentationInsets;
- (BOOL)_reallyWantsFullScreenLayout;
- (BOOL)_shouldAbortAdaptationFromTraitCollection:(id)a3 toTraitCollection:(id)a4 withTransitionCoordinator:(id)a5;
- (BOOL)_shouldAttemptToPreserveInputViewsForResponder:(id)a3;
- (BOOL)_shouldAutoPinInputViewsForModalFormSheet;
- (BOOL)_shouldChildViewControllerUseFullScreenLayout:(id)a3;
- (BOOL)_shouldForceLayoutForHostedAnimation;
- (BOOL)_shouldForwardSystemLayoutFittingSizeChanges;
- (BOOL)_shouldFreezeUnderlapsStatusBar;
- (BOOL)_shouldIgnoreChildFocusRegions;
- (BOOL)_shouldLoadInputAccessoryViewsOnAppearance;
- (BOOL)_shouldLoadViewDuringRestoration:(id)a3;
- (BOOL)_shouldOverlayTabBar;
- (BOOL)_shouldPersistViewWhenCoding;
- (BOOL)_shouldPresentViewController:(id)a3 withPresentationController:(id)a4;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)_shouldTrackAppearStateChange;
- (BOOL)_shouldUseFullScreenLayoutInWindow:(id)a3 parentViewController:(id)a4;
- (BOOL)_shouldUseOnePartRotation;
- (BOOL)_suppressesBottomBar;
- (BOOL)_transitioningOutWithoutDisappearing;
- (BOOL)_transitionsChildViewControllers;
- (BOOL)_tvTabBarShouldAutohide;
- (BOOL)_tvTabBarShouldOverlap;
- (BOOL)_useCustomDimmingView;
- (BOOL)_useSheetRotation;
- (BOOL)_usesSharedView;
- (BOOL)_viewControllerIgnoresClippedGlyphPathFrame;
- (BOOL)_viewControllerUnderlapsStatusBar;
- (BOOL)_viewControllerWasSelected;
- (BOOL)_viewHostsLayoutEngine;
- (BOOL)_viewHostsLayoutEngineAllowsTAMIC_NO;
- (BOOL)_wantsContentClippedToSafeAreaInSidebarContext;
- (BOOL)_willPreemptRunningPresentationTransition;
- (BOOL)_willPreemptRunningTransitionForDismissal;
- (BOOL)_wrapsNavigationController:(id *)a3;
- (BOOL)appearanceTransitionsAreDisabled;
- (BOOL)automaticallyAdjustsScrollViewInsets;
- (BOOL)autoresizesArchivedViewToFullSize;
- (BOOL)canHandleSnapbackIdentifier:(id)a3 animated:(BOOL)a4;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController sender:(id)sender;
- (BOOL)containmentSupport;
- (BOOL)definesPresentationContext;
- (BOOL)disablesAutomaticKeyboardDismissal;
- (BOOL)extendedLayoutIncludesOpaqueBars;
- (BOOL)hidesBottomBarWhenPushed;
- (BOOL)ignoresParentMargins;
- (BOOL)inExplicitAppearanceTransition;
- (BOOL)isBeingDismissed;
- (BOOL)isBeingPresented;
- (BOOL)isEditing;
- (BOOL)isFinishingModalTransition;
- (BOOL)isInAnimatedVCTransition;
- (BOOL)isInWillRotateCallback;
- (BOOL)isModalInPopover;
- (BOOL)isMovingFromParentViewController;
- (BOOL)isMovingToParentViewController;
- (BOOL)isPerformingModalTransition;
- (BOOL)isSettingAppearState;
- (BOOL)isSheet;
- (BOOL)isViewLoaded;
- (BOOL)modalPresentationCapturesStatusBarAppearance;
- (BOOL)needsDidMoveCleanup;
- (BOOL)performsActionsWhilePresentingModally;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersPointerLocked;
- (BOOL)prefersStatusBarHidden;
- (BOOL)providesPresentationContextTransitionStyle;
- (BOOL)restoresFocusAfterTransition;
- (BOOL)searchBarHidNavBar;
- (BOOL)sendClientToHostAction:(id)a3;
- (BOOL)shouldAutorotate;
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation;
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)shouldWindowUseOnePartInterfaceRotationAnimation:(id)a3;
- (BOOL)transitionViewShouldUseViewControllerCallbacks;
- (BOOL)useLayoutToLayoutNavigationTransitions;
- (BOOL)viewRespectsSystemMinimumLayoutMargins;
- (CGPoint)_centerForOrientation:(int64_t)a3;
- (CGRect)_boundsForOrientation:(int64_t)a3;
- (CGRect)_defaultInitialViewFrame;
- (CGRect)_embeddedViewFrame;
- (CGRect)_viewFrameInWindowForContentOverlayInsetsCalculation;
- (CGSize)_formSheetSizeForWindowWithSize:(CGSize)a3 screenSize:(CGSize)a4;
- (CGSize)_resolvedPreferredContentSize;
- (CGSize)_systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (CGSize)contentSizeForViewInPopoverView;
- (CGSize)formSheetSize;
- (CGSize)preferredContentSize;
- (NSArray)_preferredContentSizes;
- (NSArray)allowedChildViewControllersForUnwindingFromSource:(UIStoryboardUnwindSegueSource *)source;
- (NSArray)childViewControllers;
- (NSArray)preferredFocusEnvironments;
- (NSArray)previewActionItems;
- (NSArray)storyboardCommitSegueTemplates;
- (NSArray)storyboardPreviewSegueTemplates;
- (NSArray)storyboardPreviewingRegistrants;
- (NSArray)storyboardSegueTemplates;
- (NSArray)toolbarItems;
- (NSBundle)nibBundle;
- (NSDictionary)_previousFittingSizeInfo;
- (NSDirectionalEdgeInsets)systemMinimumLayoutMargins;
- (NSExtensionContext)extensionContext;
- (NSLayoutConstraint)_bottomBarInsetGuideConstraint;
- (NSLayoutConstraint)_topBarInsetGuideConstraint;
- (NSMapTable)_effectiveContentScrollViews;
- (NSMutableArray)mutableChildViewControllers;
- (NSMutableDictionary)_observableScrollViews;
- (NSString)_effectiveInteractionActivityTrackingBaseName;
- (NSString)focusGroupIdentifier;
- (NSString)interactionActivityTrackingBaseName;
- (NSString)nibName;
- (NSString)title;
- (SEL)_customSelectorToCreateChildViewControllerAtIndex:(int64_t)a3;
- (UIBarButtonItem)editButtonItem;
- (UIContainerBackgroundStyle)preferredContainerBackgroundStyle;
- (UIContentUnavailableConfigurationState)_bridgedContentUnavailableConfigurationState;
- (UIDropShadowView)dropShadowView;
- (UIEdgeInsets)_avoidanceInsets;
- (UIEdgeInsets)_contentOverlayInsets;
- (UIEdgeInsets)_customBasePresentationInsetsForView:(id)a3;
- (UIEdgeInsets)_devicePeripheryInsets;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIEdgeInsets)_minimumLayoutMarginsForView;
- (UIEdgeInsets)_navigationControllerContentInsetAdjustment;
- (UIEdgeInsets)_overlayInsetsAdjustment;
- (UIEdgeInsets)_viewSafeAreaInsetsFromScene;
- (UIEdgeInsets)additionalSafeAreaInsets;
- (UIFocusEnvironment)parentFocusEnvironment;
- (UIFocusItem)_presentingFocusedItem;
- (UIFocusItemContainer)focusItemContainer;
- (UIFocusSystem)_focusSystem;
- (UIInterfaceOrientation)interfaceOrientation;
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation;
- (UIInterfaceOrientationMask)supportedInterfaceOrientations;
- (UIModalPresentationStyle)modalPresentationStyle;
- (UIModalTransitionStyle)modalTransitionStyle;
- (UIMultiColumnViewController)_multiColumnViewController;
- (UINavigationContentAdjustments)navigationInsetAdjustment;
- (UINavigationController)navigationController;
- (UINavigationItem)_navigationItemCreatingDefaultIfNotSet;
- (UINavigationItem)navigationItem;
- (UIPopoverPresentationController)popoverPresentationController;
- (UIPresentationController)_originalPresentationController;
- (UIPresentationController)_presentationController;
- (UIPresentationController)_temporaryPresentationController;
- (UIPresentationController)activePresentationController;
- (UIPresentationController)presentationController;
- (UIRectEdge)edgesForExtendedLayout;
- (UIRectEdge)preferredScreenEdgesDeferringSystemGestures;
- (UIScrollView)_internalContentScrollView;
- (UIScrollView)contentScrollViewForEdge:(NSDirectionalRectEdge)edge;
- (UISearchDisplayController)searchDisplayController;
- (UISheetPresentationController)sheetPresentationController;
- (UISplitViewController)splitViewController;
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation;
- (UIStatusBarHideAnimationParameters)_preferredStatusBarHideAnimationParameters;
- (UIStatusBarStyle)preferredStatusBarStyle;
- (UIStatusBarStyleAnimationParameters)_preferredStatusBarStyleAnimationParameters;
- (UIStoryboard)storyboard;
- (UIStoryboardSegue)_segueResponsibleForModalPresentation;
- (UIStoryboardSegue)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier;
- (UITab)tab;
- (UITabBarItem)tabBarItem;
- (UITraitCollection)_lastNotifiedTraitCollection;
- (UITraitCollection)overrideTraitCollection;
- (UITraitCollection)overrideTraitCollectionForChildViewController:(UIViewController *)childViewController;
- (UITraitCollection)traitCollection;
- (UITransitionView)customTransitioningView;
- (UIUserInterfaceStyle)overrideUserInterfaceStyle;
- (UIUserInterfaceStyle)preferredUserInterfaceStyle;
- (UIView)_embeddedView;
- (UIView)_embeddingView;
- (UIView)_showcaseView;
- (UIView)preferredFocusedItem;
- (UIView)preferredFocusedView;
- (UIView)rotatingFooterView;
- (UIView)rotatingHeaderView;
- (UIView)savedHeaderSuperview;
- (UIView)view;
- (UIViewController)_childControllerToIgnoreWhileLookingForTransitionCoordinator;
- (UIViewController)_departingParentViewController;
- (UIViewController)_modalSourceViewController;
- (UIViewController)_parentModalViewController;
- (UIViewController)_presentedStatusBarViewController;
- (UIViewController)_presentedUserInterfaceStyleViewController;
- (UIViewController)_sourceViewControllerIfPresentedViaPopoverSegue;
- (UIViewController)childModalViewController;
- (UIViewController)childViewControllerContainingSegueSource:(UIStoryboardUnwindSegueSource *)source;
- (UIViewController)childViewControllerForHomeIndicatorAutoHidden;
- (UIViewController)childViewControllerForPointerLock;
- (UIViewController)childViewControllerForPreferredContainerBackgroundStyle;
- (UIViewController)childViewControllerForScreenEdgesDeferringSystemGestures;
- (UIViewController)childViewControllerForStatusBarHidden;
- (UIViewController)childViewControllerForStatusBarStyle;
- (UIViewController)childViewControllerForUserInterfaceStyle;
- (UIViewController)init;
- (UIViewController)initWithCoder:(NSCoder *)coder;
- (UIViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (UIViewController)parentModalViewController;
- (UIViewController)parentViewController;
- (UIViewController)presentedViewController;
- (UIViewController)presentingViewController;
- (UIViewController)separateSecondaryViewControllerForSplitViewController:(UISplitViewController *)splitViewController;
- (UIViewController)targetViewControllerForAction:(SEL)action sender:(id)sender;
- (UIViewController)viewControllerForUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender;
- (UIViewControllerTransition)preferredTransition;
- (UIViewControllerTransitioningDelegate)_overrideTransitioningDelegate;
- (UIWindow)_expectedWindow;
- (UIWindow)_window;
- _appearingOrAppearedChildModalViewController;
- (_UIActionSheetPresentationController)actionSheetPresentationController;
- (_UIContentUnavailableWrapperView)_contentUnavailableWrapperView;
- (_UIFocusPlatformBehavior)_focusBehavior;
- (_UIFocusSystemSceneComponent)_focusSystemSceneComponent;
- (_UITabElement)_resolvedTab;
- (_UITabElement)_uip_tabElement;
- (_UIViewControllerContentViewEmbedding)_embeddedDelegate;
- (_UIViewControllerTabElementObserver)_tabElementChangeObserver;
- (_UIViewControllerTransition)_preferredTransition;
- (char)_descriptionForPrintingHierarchyIncludingInsets:(float64x2_t *)a1;
- (double)_canvasSystemMinimumMargin;
- (double)_contentMargin;
- (double)_contentMarginForChildViewController:(id)a3;
- (double)_leftContentMargin;
- (double)_navigationControllerContentOffsetAdjustment;
- (double)_rightContentMargin;
- (double)_statusBarHeightAdjustmentForCurrentOrientation;
- (double)_statusBarHeightForCurrentInterfaceOrientation;
- (double)_topBarHeight;
- (double)customNavigationInteractiveTransitionDuration;
- (double)customNavigationInteractiveTransitionPercentComplete;
- (double)durationForTransition:(int)a3;
- (id)__potentialOverridingFocusEnvironments;
- (id)_activityContinuationSuitableToBecomeCurrent;
- (id)_adaptedPresentationControllerForTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
- (id)_ancestorViewControllerOfClass:(uint64_t)a3 allowModalParent:;
- (id)_animatorForOperation:(int64_t)a3 fromViewController:(id)a4 toViewController:(id)a5;
- (id)_appearanceContainer;
- (id)_appearanceGuideClass;
- (id)_backdropBarGroupName;
- (id)_backgroundColorForModalFormSheet;
- (id)_childViewControllerForAlwaysOnTimelines;
- (id)_childViewControllerForExclusiveCollectionPhysicalButtonConfigurations;
- (id)_childViewControllerForMultitaskingDragExclusionRects;
- (id)_childViewControllerForWhitePointAdaptivityStyle;
- (id)_childViewControllersForAlwaysOnTimelines;
- (id)_compatibilityTraitOverridesFromParentViewControllerCreateIfNecessary:(void *)a1;
- (id)_completionBlock;
- (id)_containingTabBarController;
- (id)_contentOrObservableScrollViewForEdge:(unint64_t)a3;
- (id)_contentOrObservableScrollViewInContainerForEdge:(void *)a1;
- (id)_contentScrollView;
- (id)_contentUnavailableConfiguration;
- (id)_contentUnavailableConfigurationState;
- (id)_customAnimatorForDismissedController:(void *)a1;
- (id)_customAnimatorForPresentedController:(void *)a3 presentingController:(void *)a4 sourceController:;
- (id)_customChildViewControllerSelectorsNames;
- (id)_customInteractionControllerForDismissal:(void *)a1;
- (id)_customInteractionControllerForPresentation:(void *)a1;
- (id)_customPresentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)_decodeRestorableStateAndReturnContinuationWithCoder:(id)a3;
- (id)_deepestActionResponder;
- (id)_deepestPresentedActionResponderOrBlock:(id)a3;
- (id)_defaultAnimationController;
- (id)_defaultContentScrollViewForEdge:(unint64_t)a3;
- (id)_definiteTransitionCoordinator;
- (id)_description;
- (id)_descriptionWithChildren:(int)a3;
- (id)_destinationForUnwindingFromSource:(id)a3 visitedViewControllers:(id)a4;
- (id)_effectiveControllersForAlwaysOnTimelines;
- (id)_effectiveExclusiveCollectionPhysicalButtonConfigurationViewController;
- (id)_effectiveHomeIndicatorAutoHiddenViewController;
- (id)_effectivePointerLockViewController;
- (id)_effectiveScreenEdgesDeferringSystemGesturesViewController;
- (id)_effectiveStatusBarHiddenViewController;
- (id)_effectiveStatusBarStyleViewController;
- (id)_effectiveUserInterfaceStyleViewController;
- (id)_effectiveViewControllerForMultitaskingDragExclusionRects;
- (id)_effectiveWhitePointAdaptivityStyleViewController;
- (id)_existingNavigationItem;
- (id)_existingPresentationControllerImmediate:(BOOL)a3 effective:(BOOL)a4;
- (id)_existingPresentationControllerImmediate:(BOOL)a3 effective:(BOOL)a4 includesRoot:(BOOL)a5;
- (id)_existingPresentationControllerImmediate:(char)a3 effective:(int)a4 includesRoot:(char)a5 prefersRoot:;
- (id)_existingTabBarItem;
- (id)_existingView;
- (id)_extensionContextUUID;
- (id)_fallbackTabElementCreateIfNeeded:(BOOL)a3;
- (id)_firstResponder;
- (id)_focusFallbackScroller;
- (id)_hostApplicationBundleIdentifier;
- (id)_hostedWindowScene;
- (id)_hostingNavigationBar;
- (id)_independentContainedScrollViewIntermediateToDescendantViewController:(id)a3;
- (id)_keyCommands;
- (id)_keyboardSceneDelegate;
- (id)_lastNavigationItems;
- (id)_modalPresenter:(void *)a1;
- (id)_modalPresenterForPresentationController:(uint64_t)a1;
- (id)_modalPreservedFirstResponder;
- (id)_moreListTitle;
- (id)_multitaskingDragExclusionRects;
- (id)_navigationBarForDragAffordance;
- (id)_nearestFullScreenAncestorViewController;
- (id)_nextResponderUsingTargetActionStrategyFromChildViewController:(id)a3 didTraverseToParentViewController:(BOOL *)a4;
- (id)_nextResponderUsingTraversalStrategy:(unint64_t)a3;
- (id)_nextViewController;
- (id)_nextViewControllerForUnwindSegueSearch;
- (id)_nonModalAncestorViewController;
- (id)_nonModalAncestorViewControllerStopAtIsPresentationContext:(BOOL)a3;
- (id)_nonPresentationAppearanceContainer;
- (id)_orientationDebugDescription;
- (id)_orientationDebugDescriptionBuilderWithMultilinePrefix:(id)a3;
- (id)_orientationDebugDescriptionWithMultilinePrefix:(id)a3;
- (id)_overrideTraitCollectionToPassDuringTraitChangeToChildViewController:(id)a3;
- (id)_overridingPreferredFocusEnvironment;
- (id)_parentContentContainer;
- (id)_parentTraitEnvironment;
- (id)_parentViewController;
- (id)_popoverController;
- (id)_presentationControllerClassName;
- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)_previousRootViewController;
- (id)_primaryViewControllerForAutorotationBelowWindow:(void *)a1;
- (id)_printHierarchy;
- (id)_registerForTraitTokenChanges:(id)a3 withHandler:(id)a4;
- (id)_registerForTraitTokenChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5;
- (id)_remoteViewControllerProxy;
- (id)_remoteViewControllerProxyWithErrorHandler:(id)a3;
- (id)_resolveContentScrollViewForEdge:(uint64_t)a1;
- (id)_restorationClassName;
- (id)_retrievePresentingFocusedItemOrRemoveIfNotFocusable;
- (id)_rootAncestorViewController;
- (id)_rootAncestorViewControllerInWindow:(void *)a1;
- (id)_safeAreaInsetsTrace;
- (id)_safePrimaryViewControllerForAutorotationBelowWindow:(id)a3;
- (id)_safeViewControllerForRotationWithDismissCheck:(BOOL)a3;
- (id)_safeViewControllerForSupportedInterfaceOrientationsWithDismissCheck:(BOOL)a3;
- (id)_safeWindowForAutorotationBelowWindow:(id)a3;
- (id)_screen;
- (id)_shim_contentScrollView;
- (id)_splitViewControllerEnforcingClass:(BOOL)a3;
- (id)_tabBarControllerEnforcingClass:(BOOL)a3;
- (id)_timelinesForDateInterval:(id)a3;
- (id)_traitCollectionByApplyingLocalOverridesToTraitCollection:(uint64_t)a1;
- (id)_traitCollectionByApplyingOverridesFromParentViewControllerToTraitCollection:(void *)a1;
- (id)_traitCollectionForChildEnvironment:(id)a3;
- (id)_traitOverridesForChildViewController:(id)a3;
- (id)_traitTrace;
- (id)_traitTrace:(id)a3;
- (id)_transitionCoordinator;
- (id)_uiCollectionView;
- (id)_ui_observationTrackingDictionary;
- (id)_userActionDescription;
- (id)_viewContainerForContainerWindowPortalInteraction;
- (id)_viewControllerForDismissal;
- (id)_viewControllerForObservableScrollView;
- (id)_viewControllerForRotation;
- (id)_viewControllerForRotationWithDismissCheck:(void *)a1;
- (id)_viewControllerForSupportedInterfaceOrientations;
- (id)_viewControllerForSupportedInterfaceOrientationsWithDismissCheck:(BOOL)a3;
- (id)_viewControllersForRotationCallbacks;
- (id)_viewControllersWhoseOrientationsMustCoincide;
- (id)_viewForContentInPopover;
- (id)_viewsWithDisabledInteractionGivenTransitionContext:(id)a3;
- (id)_visibleView;
- (id)_visualStyleOfContainingAlertController;
- (id)_windowForAutorotationBelowWindow:(void *)a1;
- (id)_zoomTransitionController;
- (id)afterAppearanceBlock;
- (id)bottomLayoutGuide;
- (id)contentUnavailableConfiguration;
- (id)currentAction;
- (id)defaultPNGName;
- (id)invalidate;
- (id)keyCommands;
- (id)leadingPreviewAction;
- (id)moreListImage;
- (id)moreListSelectedImage;
- (id)moreListTableCell;
- (id)nextResponder;
- (id)previewActions;
- (id)previewMenuItems;
- (id)registerForPreviewingWithDelegate:(id)delegate sourceView:(UIView *)sourceView;
- (id)registerForTraitChanges:(id)a3 withAction:(SEL)a4;
- (id)registerForTraitChanges:(id)a3 withHandler:(id)a4;
- (id)registerForTraitChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5;
- (id)restorationClass;
- (id)rotatingFooterViewForWindow:(id)a3;
- (id)rotatingHeaderViewForWindow:(id)a3;
- (id)safeAreaLayoutGuide;
- (id)storyboardIdentifier;
- (id)topLayoutGuide;
- (id)trailingPreviewAction;
- (id)traitOverrides;
- (id)transitioningDelegate;
- (id)viewControllerForRotation;
- (int)_appearState;
- (int)_hostProcessIdentifier;
- (int)_preferredStatusBarVisibility;
- (int64_t)_horizontalSizeClass;
- (int64_t)_imagePickerStatusBarStyle;
- (int64_t)_lastKnownInterfaceOrientation;
- (int64_t)_overrideHorizontalSizeClass;
- (int64_t)_overrideInterfaceOrientationMechanics;
- (int64_t)_overrideUserInterfaceRenderingMode;
- (int64_t)_preferredInterfaceOrientationGivenCurrentOrientation:(int64_t)a3;
- (int64_t)_preferredModalPresentationStyle;
- (int64_t)_preferredWhitePointAdaptivityStyle;
- (int64_t)_rotatingFromInterfaceOrientation;
- (int64_t)_rotatingToInterfaceOrientation;
- (int64_t)_verticalSizeClass;
- (uint64_t)_defaultSupportedInterfaceOrientations;
- (uint64_t)_defaultViewControllerStatusBarVisibilityBehavior;
- (uint64_t)_didSelfOrAncestorBeginAppearanceTransition;
- (uint64_t)_doesSelfOrAncestorPassPredicate:(uint64_t)a1;
- (uint64_t)_endAppearanceTransition:(uint64_t)a1;
- (uint64_t)_getViewControllerToInheritInsetsFrom:(void *)a3 viaImmediateChild:;
- (uint64_t)_isPresentingInWindow:(void *)a1;
- (uint64_t)_needsAutomaticContentUnavailableConfigurationUpdates;
- (uint64_t)_preferredInterfaceOrientationForPresentationInWindow:(uint64_t)a3 fromInterfaceOrientation:;
- (uint64_t)_presentedViewControllerStateIsValidForSourcingSupportedOrientations:(void *)a1;
- (uint64_t)_requiredNotificationsForRemoteServices;
- (uint64_t)_shouldRequestViewControllerForObservableScrollViewFromPresentedViewController;
- (uint64_t)_shouldSkipContentOverlayInsetsUpdate;
- (uint64_t)_transitionForModalTransitionStyle:(int)a3 appearing:;
- (uint64_t)_tryBecomeRootViewControllerInWindow:(uint64_t)a1;
- (uint64_t)_useViewBasedTopAndBottomLayoutGuides;
- (unint64_t)__supportedInterfaceOrientations;
- (unint64_t)__updateContentOverlayInsetsWithOurRect:(void *)a3 inBoundsOfAncestorViewController:(CGFloat)x viaImmediateChildOfAncestor:(CGFloat)y;
- (unint64_t)_isDeallocInitiated;
- (unint64_t)childViewControllersCount;
- (void)__prepareForDisconnectionWithCompletionHandler:(id)a3;
- (void)__setParentViewController:(void *)a1;
- (void)__viewDidAppear:(BOOL)a3;
- (void)__viewDidDisappear:(uint64_t)a1;
- (void)__viewIsAppearing:(char)a3 skipWindowCheck:;
- (void)__viewWillAppear:(BOOL)a3;
- (void)__viewWillDisappear:(uint64_t)a1;
- (void)__willChangeToIdiom:(int64_t)a3 onScreen:(id)a4;
- (void)_addChildModalViewController:(id *)a1;
- (void)_addChildViewController:(id)a3;
- (void)_addChildViewController:(id)a3 notifyWillMove:(BOOL)a4;
- (void)_addChildViewController:(id)a3 performHierarchyCheck:(BOOL)a4 notifyWillMove:(BOOL)a5;
- (void)_addCurlUpTapGestureRecognizerWithRevealedHeight:(void *)a1;
- (void)_addDescendantsToArray:(uint64_t)a3 visibleOnly:;
- (void)_appendNavigationItemsToNavigationController:(uint64_t)a3 transition:;
- (void)_applyCompatibilityTraitOverridesForOverrideTraitCollection:(void *)a1;
- (void)_applyContentUnavailableConfiguration:(void *)a1;
- (void)_attachTab:(uint64_t)a1;
- (void)_beginAppearanceTransitionToViewController:(id)a3 animated:(BOOL)a4;
- (void)_beginDelayingPresentation;
- (void)_beginDelayingPresentation:(double)a3 cancellationHandler:(id)a4;
- (void)_beginDisablingInterfaceAutorotation;
- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3;
- (void)_cancelDelayedPresentation:(BOOL)a3;
- (void)_childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter:(id)a3;
- (void)_cleanupPresentation;
- (void)_clearCachedPopoverContentSize;
- (void)_clearRecordedContentScrollView;
- (void)_collectExistingTraitCollectionsForTraitTracking:(id)a3;
- (void)_contentScrollViewHeuristic;
- (void)_didCancelDismissTransition:(id)a3;
- (void)_didCancelPresentTransition:(id)a3;
- (void)_didEndCounterRotationForPresentation;
- (void)_didEnterAlwaysOn;
- (void)_didExitAlwaysOn;
- (void)_didFinishDismissTransition;
- (void)_didFinishPresentTransition;
- (void)_didResignContentViewControllerOfPopover:(id)a3;
- (void)_didRotateFromInterfaceOrientation;
- (void)_didRotateFromInterfaceOrientation:(int64_t)a3 forwardToChildControllers:(BOOL)a4 skipSelf:(BOOL)a5;
- (void)_didUpdateFocusInContext:(id)a3;
- (void)_dismissAccessibilityHUD;
- (void)_dismissViewControllerWithTransition:(int)a3 from:(id)a4 completion:(id)a5;
- (void)_doCommonSetup;
- (void)_eagerlyUpdateSafeAreaInsetsToViewDescendant:(id)a3;
- (void)_embedContentViewInView:(id)a3 withContentFrame:(CGRect)a4 delegate:(id)a5;
- (void)_endAppearanceTransitionToViewController:(id)a3;
- (void)_endDelayingPresentation;
- (void)_endDisablingInterfaceAutorotation;
- (void)_enumerateAncestorViewControllersUntilStop:(BOOL *)a3 usingBlock:(id)a4;
- (void)_enumerateVisibleChildControllers:(void *)a1 includePresentedChildren:(int)a2 usingBlock:(void *)a3;
- (void)_executeAfterAppearanceBlock;
- (void)_executeContentUnavailableConfigurationUpdate;
- (void)_executeViewIsAppearingBlock:(uint64_t)a1;
- (void)_handleTapToDismissModalCurl:(id)a3;
- (void)_inferLayoutGuidesFromSubviews;
- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4;
- (void)_invalidateBehaviorPreferences;
- (void)_invalidateChildContentOverlayInsetsWithOldInsets:(double)a3;
- (void)_invalidatePreferences:(__int16)a3 excluding:;
- (void)_invalidateViewConstraints;
- (void)_invalidateViewLayout;
- (void)_isWaitingForDelayedPresentation;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_legacyModalPresentTransitionDidComplete;
- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5;
- (void)_objc_initiateDealloc;
- (void)_observeScrollView:(id)a3 temporaryCoordinatingReplacementDidChange:(id)a4;
- (void)_parent:(id)a3 willTransitionToTraitCollection:(id)a4 withTransitionCoordinator:(id)a5;
- (void)_performAtViewIsAppearing:(uint64_t)a1;
- (void)_performContentScrollViewUpdatesNotifyingObservers;
- (void)_performContentUnavailableConfigurationStateUpdate;
- (void)_performCoordinatedPresentOrDismiss:(uint64_t)a3 animated:;
- (void)_populateArchivedChildViewControllers:(id)a3;
- (void)_populateInitialTraitCollection;
- (void)_prepareForNavigationTransition:(BOOL)a3;
- (void)_prepareForTapGesture:(id)a3;
- (void)_prepareForWindowDealloc;
- (void)_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_presentViewController:(id)a3 modalSourceViewController:(id)a4 presentationController:(id)a5 animationController:(id)a6 interactionController:(id)a7 handoffData:(id)a8 completion:(id)a9;
- (void)_presentViewController:(id)a3 withAnimationController:(id)a4 completion:(id)a5;
- (void)_presentViewControllerForStateRestoration:(id)a3 animated:(BOOL)a4;
- (void)_presentingViewControllerDidChange:(id)a3;
- (void)_presentingViewControllerWillChange:(id)a3;
- (void)_primitiveSetNavigationControllerContentInsetAdjustment:(UIEdgeInsets)a3;
- (void)_primitiveSetNavigationControllerContentOffsetAdjustment:(double)a3;
- (void)_recordContentScrollView;
- (void)_recordTraitUsage:(unint64_t)a3 insideMethod:(const char *)a4 withInvalidationAction:;
- (void)_recursiveUpdateContentOverlayInsetsFromParentIfNecessary;
- (void)_registerAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3;
- (void)_removeChildModalViewController:(id *)a1;
- (void)_removeChildViewController:(id)a3;
- (void)_removeNavigationItemsFromNavigationController:(uint64_t)a3 transition:;
- (void)_replaceViewControllerInPresentationHierarchy:(id)a3;
- (void)_restoreInputViewsForPresentation;
- (void)_sceneSettingsSafeAreaInsetsDidChangeForWindow:(id)a3;
- (void)_sendViewDidLoadWithAppearanceProxyObjectTaggingEnabled;
- (void)_sendViewWillTransitionToSizeToPresentationController:(double)a3 withTransitionCoordinator:(double)a4;
- (void)_setAllowsAutorotation:(BOOL)a3;
- (void)_setAvoidanceInsetsNeedsUpdate;
- (void)_setChildControllerToIgnoreWhileLookingForTransitionCoordinator:(id)a3;
- (void)_setContentMargin:(double)a3;
- (void)_setContentOverlayInsets:(UIEdgeInsets)a3;
- (void)_setContentOverlayInsets:(UIEdgeInsets)a3 andLeftMargin:(double)a4 rightMargin:(double)a5;
- (void)_setCustomChildViewControllerSelectorsNames:(id)a3;
- (void)_setEmbeddedDelegate:(id)a3;
- (void)_setEmbeddedView:(id)a3;
- (void)_setEmbeddedViewFrame:(CGRect)a3;
- (void)_setEmbeddingView:(id)a3;
- (void)_setExistingNavigationItem:(id)a3;
- (void)_setExistingTabBarItem:(id)a3;
- (void)_setExpectedWindow:(id)a3;
- (void)_setExtensionContextUUID:(id)a3;
- (void)_setFormSheetSize:(CGSize)a3;
- (void)_setFreezeLayoutForOrientationChangeOnDismissal:(BOOL)a3;
- (void)_setHostApplicationBundleIdentifier:(id)a3;
- (void)_setHostAuditToken:(id *)a3;
- (void)_setHostProcessIdentifier:(int)a3;
- (void)_setIgnoreAppSupportedOrientations:(BOOL)a3;
- (void)_setIgnoresWrapperViewForContentOverlayInsets:(BOOL)a3;
- (void)_setInCustomTransition:(BOOL)a3;
- (void)_setInterfaceOrientationOnModalRecursively:(void *)a1;
- (void)_setInternalContentScrollView:(id)a3;
- (void)_setKeyCommands:(id)a3;
- (void)_setLastNotifiedTraitCollection:(id)a3;
- (void)_setLeftContentMargin:(double)a3;
- (void)_setMayForwardPresentationsToPresentedViewController:(BOOL)a3;
- (void)_setModalPresentationStyle:(int64_t)a3;
- (void)_setModalSourceViewController:(id)a3;
- (void)_setNavigationControllerContentInsetAdjustment:(UIEdgeInsets)a3;
- (void)_setNavigationControllerContentOffsetAdjustment:(double)a3;
- (void)_setNeedsNonDeferredFocusUpdate;
- (void)_setNeedsResolutionOfPhysicalButtonConfigurations;
- (void)_setNeedsStatusBarAppearanceUpdateWithAnimationParameters:(id)a3;
- (void)_setNeedsUpdateContentUnavailableConfiguration;
- (void)_setNeedsUpdateOfMultitaskingDragExclusionRects;
- (void)_setOriginalPresentationController:(id)a3;
- (void)_setOverrideHorizontalSizeClass:(int64_t)a3;
- (void)_setOverrideTransitioningDelegate:(id)a3;
- (void)_setOverrideUseCustomPresentation:(BOOL)a3;
- (void)_setOverrideUserInterfaceRenderingMode:(int64_t)a3;
- (void)_setPopoverController:(id)a3;
- (void)_setPreferredTransition:(id)a3;
- (void)_setPresentationController:(id)a3;
- (void)_setPresentationSizeClassPair:(id)a3;
- (void)_setPresentedStatusBarViewController:(id)a3;
- (void)_setPresentedStatusBarViewController:(id)a3 shouldJoinAnimationsInProgress:(BOOL)a4;
- (void)_setPresentedUserInterfaceStyleViewController:(id)a3;
- (void)_setPresentingFocusedItem:(id)a3;
- (void)_setPreviousFittingSizeInfo:(id)a3;
- (void)_setRemoteViewControllerProxy:(id)a3;
- (void)_setRightContentMargin:(double)a3;
- (void)_setSearchDisplayController:(int)a3 retain:;
- (void)_setSearchDisplayControllerUnretained:(id)a3;
- (void)_setSecurityModeForViewsLayer;
- (void)_setSegueResponsibleForModalPresentation:(id)a3;
- (void)_setShouldFreezeUnderlapsStatusBar:(BOOL)a3;
- (void)_setSourceViewControllerIfPresentedViaPopoverSegue:(id)a3;
- (void)_setStoryboard:(id)a3;
- (void)_setSuppressesBottomBar:(BOOL)a3;
- (void)_setTabElementChangeObserver:(id)a3;
- (void)_setTemporaryPresentationController:(id)a3;
- (void)_setTraitStorageList:(id)a3;
- (void)_setUpLayoutGuideConstraintIfNecessaryAtTop:(uint64_t)a1;
- (void)_setUsesSharedView:(BOOL)a3;
- (void)_setViewAppearState:(uint64_t)a3 isAnimating:;
- (void)_setViewHostsLayoutEngine:(BOOL)a3;
- (void)_showAccessibilityHUDItem:(id)a3;
- (void)_showViewController:(id)a3 withAction:(SEL)a4 sender:(id)a5;
- (void)_supportedInterfaceOrientationsDidChange;
- (void)_systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3 childViewController:(id)a4;
- (void)_timelinesForDateInterval:(id)a3 completion:(id)a4;
- (void)_toggleEditing:(id)a3;
- (void)_traitCollectionDidChange:(id)a3;
- (void)_transitionToNavigationViewController:(id)a3 withWrapper:(id)a4;
- (void)_transitionToViewController:(id)a3 whilePerforming:(id)a4 completion:(id)a5;
- (void)_traverseViewControllerHierarchyFromLevel:(int64_t)a3 withBlock:(id)a4;
- (void)_ui_setObservationTrackingDictionary:(id)a3;
- (void)_uip_setTabElement:(id)a3;
- (void)_unembedContentView;
- (void)_unembedContentViewSettingDelegate:(id)a3;
- (void)_unloadHierarchyInputAccessoryViewIfNecessary;
- (void)_unregisterAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3;
- (void)_unsafeParentWillTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
- (void)_updateChildContentMargins;
- (void)_updateContentOverlayInsetsForSelfAndChildren;
- (void)_updateContentOverlayInsetsFromParentForNavigationTransitionWithFinalRectInParent:(CGRect)a3;
- (void)_updateContentOverlayInsetsFromParentIfNecessary;
- (void)_updateContentUnavailableConfigurationWithObservationTracking;
- (void)_updateControlledViewsToFrame:(CGRect)a3;
- (void)_updateInterfaceOrientationAnimated:(BOOL)a3;
- (void)_updateLastKnownInterfaceOrientationOnPresentionStack:(uint64_t)a1;
- (void)_updateLayoutForStatusBarAndInterfaceOrientation;
- (void)_updateSystemAppearanceWithRecursionBlock:(void *)a3 action:;
- (void)_updateTabBarLayout;
- (void)_updateToolbarItemsFromViewController:(id)a3 animated:(BOOL)a4;
- (void)_updateTraitsIfNecessary;
- (void)_updateTraitsIfNecessarySchedulingPropagation:(uint64_t)a1;
- (void)_updateViewConstraintsWithObservationTracking;
- (void)_updateViewSafeAreaInsetsAndEagerlyUpdateContentScrollView:(double *)a1;
- (void)_updateWithFrameSpecifier:(id)a3;
- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4;
- (void)_viewDidLayoutSubviewsWithObservationTracking;
- (void)_viewSubtreeDidGainScrollView:(id)a3 enclosingViewController:(id)a4;
- (void)_viewWillLayoutSubviewsWithObservationTracking;
- (void)_willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4 forwardToChildControllers:(BOOL)a5 skipSelf:(BOOL)a6;
- (void)_willBeginCounterRotationForPresentation;
- (void)_willEnterAlwaysOn;
- (void)_willExitAlwaysOn;
- (void)_willRotateToInterfaceOrientation;
- (void)_willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4 forwardToChildControllers:(BOOL)a5 skipSelf:(BOOL)a6;
- (void)_window:(id)a3 viewWillTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5;
- (void)_window:(id)a3 willTransitionToTraitCollection:(id)a4 withTransitionCoordinator:(id)a5;
- (void)_windowControllerTransitionDidCancel;
- (void)addChildViewController:(UIViewController *)childController;
- (void)addKeyCommand:(UIKeyCommand *)keyCommand;
- (void)applicationDidResume;
- (void)applicationWantsViewsToDisappear;
- (void)applicationWillSuspend;
- (void)autoresizeArchivedView;
- (void)awakeFromNib;
- (void)beginAppearanceTransition:(BOOL)isAppearing animated:(BOOL)animated;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)cancelBeginAppearanceTransition;
- (void)dealloc;
- (void)didMoveToParentViewController:(UIViewController *)parent;
- (void)dismissModalViewControllerAnimated:(BOOL)animated;
- (void)dismissModalViewControllerWithTransition:(int)a3;
- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void *)completion;
- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4;
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(id)a3;
- (void)endAppearanceTransition;
- (void)forceUnloadView;
- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4;
- (void)loadView;
- (void)loadViewIfRequired;
- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender;
- (void)popoverPresentationController:(void *)a1;
- (void)presentModalViewController:(UIViewController *)modalViewController animated:(BOOL)animated;
- (void)presentModalViewController:(id)a3 withTransition:(int)a4;
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void *)completion;
- (void)presentViewController:(id)a3 withTransition:(int)a4 completion:(id)a5;
- (void)registerPreviewSourceView:(id)a3 previewingDelegate:(id)a4;
- (void)removeChildViewController:(id)a3;
- (void)removeChildViewController:(id)a3 notifyDidMove:(BOOL)a4;
- (void)removeFromParentViewController;
- (void)removeKeyCommand:(UIKeyCommand *)keyCommand;
- (void)setAdditionalSafeAreaInsets:(UIEdgeInsets)additionalSafeAreaInsets;
- (void)setAfterAppearanceBlock:(id)a3;
- (void)setAppearanceTransitionsAreDisabled:(BOOL)a3;
- (void)setAutomaticallyAdjustsScrollViewInsets:(BOOL)automaticallyAdjustsScrollViewInsets;
- (void)setAutoresizesArchivedViewToFullSize:(BOOL)a3;
- (void)setContainmentSupport:(BOOL)a3;
- (void)setContentScrollView:(UIScrollView *)scrollView forEdge:(NSDirectionalRectEdge)edge;
- (void)setContentSizeForViewInPopover:(CGSize)contentSizeForViewInPopover;
- (void)setContentUnavailableConfiguration:(id)contentUnavailableConfiguration;
- (void)setCustomNavigationInteractiveTransitionDuration:(double)a3;
- (void)setCustomNavigationInteractiveTransitionPercentComplete:(double)a3;
- (void)setCustomTransitioningView:(id)a3;
- (void)setDefinesPresentationContext:(BOOL)definesPresentationContext;
- (void)setDropShadowView:(id)a3;
- (void)setEdgesForExtendedLayout:(UIRectEdge)edgesForExtendedLayout;
- (void)setEditing:(BOOL)editing;
- (void)setEditing:(BOOL)editing animated:(BOOL)animated;
- (void)setExtendedLayoutIncludesOpaqueBars:(BOOL)extendedLayoutIncludesOpaqueBars;
- (void)setFinishingModalTransition:(BOOL)a3;
- (void)setFocusGroupIdentifier:(NSString *)focusGroupIdentifier;
- (void)setFormSheetSize:(CGSize)a3;
- (void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed;
- (void)setIgnoresParentMargins:(BOOL)a3;
- (void)setInAnimatedVCTransition:(BOOL)a3;
- (void)setInWillRotateCallback:(BOOL)a3;
- (void)setInteractionActivityTrackingBaseName:(NSString *)interactionActivityTrackingBaseName;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setModalInPopover:(BOOL)modalInPopover;
- (void)setModalPresentationCapturesStatusBarAppearance:(BOOL)modalPresentationCapturesStatusBarAppearance;
- (void)setModalPresentationStyle:(UIModalPresentationStyle)modalPresentationStyle;
- (void)setModalTransitionStyle:(UIModalTransitionStyle)modalTransitionStyle;
- (void)setMutableChildViewControllers:(id)a3;
- (void)setNavigationInsetAdjustment:(id)a3;
- (void)setNeedsDidMoveCleanup:(BOOL)a3;
- (void)setNeedsFocusUpdate;
- (void)setNeedsStatusBarAppearanceUpdate;
- (void)setNeedsUpdateOfHomeIndicatorAutoHidden;
- (void)setNeedsUpdateOfPrefersPointerLocked;
- (void)setNeedsUpdateOfScreenEdgesDeferringSystemGestures;
- (void)setNeedsUpdateOfSupportedInterfaceOrientations;
- (void)setNeedsUserInterfaceAppearanceUpdate;
- (void)setNeedsWhitePointAdaptivityStyleUpdate;
- (void)setNibBundle:(id)a3;
- (void)setNibName:(id)a3;
- (void)setOverrideTraitCollection:(UITraitCollection *)collection forChildViewController:(UIViewController *)childViewController;
- (void)setOverrideTraitCollection:(id)a3;
- (void)setOverrideUserInterfaceStyle:(UIUserInterfaceStyle)overrideUserInterfaceStyle;
- (void)setParentModalViewController:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setPerformingModalTransition:(BOOL)a3;
- (void)setPreferredContentSize:(CGSize)preferredContentSize;
- (void)setPreferredFocusedItem:(id)a3;
- (void)setPreferredTransition:(id)a3;
- (void)setProvidesPresentationContextTransitionStyle:(BOOL)providesPresentationContextTransitionStyle;
- (void)setRestorationClass:(id)restorationClass;
- (void)setRestoresFocusAfterTransition:(BOOL)restoresFocusAfterTransition;
- (void)setSearchBarHidNavBar:(BOOL)a3;
- (void)setSearchDisplayController:(id)a3;
- (void)setShouldForceNonAnimatedTransition:(BOOL)a3;
- (void)setStoryboardIdentifier:(id)a3;
- (void)setTabBarItem:(UITabBarItem *)tabBarItem;
- (void)setTitle:(NSString *)title;
- (void)setToolbarItems:(NSArray *)toolbarItems;
- (void)setToolbarItems:(NSArray *)toolbarItems animated:(BOOL)animated;
- (void)setTransitioningDelegate:(id)transitioningDelegate;
- (void)setUserActivity:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setView:(UIView *)view;
- (void)setViewRespectsSystemMinimumLayoutMargins:(BOOL)viewRespectsSystemMinimumLayoutMargins;
- (void)setWantsFullScreenLayout:(BOOL)wantsFullScreenLayout;
- (void)set_contentUnavailableWrapperView:(id)a3;
- (void)set_departingParentViewController:(id)a3;
- (void)set_nextResponderIgnoresWindowIfRootVC:(BOOL)a3;
- (void)showDetailViewController:(UIViewController *)vc sender:(id)sender;
- (void)showViewController:(UIViewController *)vc sender:(id)sender;
- (void)transitionFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void *)animations completion:(void *)completion;
- (void)unloadViewForced:(BOOL)a3;
- (void)unloadViewIfReloadable;
- (void)unregisterForTraitChanges:(id)a3;
- (void)unregisterPreviewSourceView:(id)a3;
- (void)unregisterPreviewing:(id)a3;
- (void)updateFocusIfNeeded;
- (void)updateTraitsIfNeeded;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewDidDisappear:(BOOL)animated;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (void)viewWillMoveToWindow:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(UIViewController *)parent;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
- (void)window:(id)a3 didAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a4;
- (void)window:(id)a3 didRotateFromInterfaceOrientation:(int64_t)a4;
- (void)window:(id)a3 didRotateFromInterfaceOrientation:(int64_t)a4 oldSize:(CGSize)a5;
- (void)window:(id)a3 resizeFromOrientation:(int64_t)a4;
- (void)window:(id)a3 setupWithInterfaceOrientation:(int64_t)a4;
- (void)window:(id)a3 statusBarWillChangeFromHeight:(double)a4 toHeight:(double)a5;
- (void)window:(id)a3 willAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a4 duration:(double)a5;
- (void)window:(id)a3 willAnimateFromContentFrame:(CGRect)a4 toContentFrame:(CGRect)a5;
- (void)window:(id)a3 willAnimateRotationToInterfaceOrientation:(int64_t)a4 duration:(double)a5;
- (void)window:(id)a3 willAnimateRotationToInterfaceOrientation:(int64_t)a4 duration:(double)a5 newSize:(CGSize)a6;
- (void)window:(id)a3 willAnimateSecondHalfOfRotationFromInterfaceOrientation:(int64_t)a4 duration:(double)a5;
- (void)window:(id)a3 willRotateToInterfaceOrientation:(int64_t)a4 duration:(double)a5;
- (void)window:(id)a3 willRotateToInterfaceOrientation:(int64_t)a4 duration:(double)a5 newSize:(CGSize)a6;
@end

@implementation UIViewController

- (BOOL)viewRespectsSystemMinimumLayoutMargins
{
  return (*(void *)&self->_viewControllerFlags >> 51) & 1;
}

void __78__UIViewController__presentViewController_withAnimationController_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setHorizontalSizeClass:v3];
  [v4 setVerticalSizeClass:*(void *)(a1 + 40)];
}

- (BOOL)inExplicitAppearanceTransition
{
  return self->_explicitAppearanceTransitionLevel > 0;
}

- (BOOL)_canResignIfContainsFirstResponder
{
  return 0;
}

- (void)_contentScrollViewHeuristic
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [(id)a1 _existingView];
    if (v2)
    {
      uint64_t v3 = *(void **)(a1 + 312);
      if (v3 && ([v3 isDescendantOfView:v2] & 1) == 0) {
        [(id)a1 _clearRecordedContentScrollView];
      }
      id v4 = *(id *)(a1 + 312);
      if (v4) {
        goto LABEL_48;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = v2;
LABEL_48:

        goto LABEL_49;
      }
      v5 = [(id)a1 navigationController];
      v6 = [v5 navigationBar];
      unint64_t v7 = [v6 barStyle];
      v8 = [v2 _screen];
      if (_UIBarStyleWithTintColorIsTranslucentOnScreen(v7, 0, v8))
      {

LABEL_12:
        v12 = v2;
        while (2)
        {
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v13 = [v12 subviews];
            uint64_t v14 = [v13 count];

            if (v14)
            {
              if ([v12 _canHostViewControllerContentScrollView])
              {
                v15 = [v12 subviews];

                long long v44 = 0u;
                long long v45 = 0u;
                long long v42 = 0u;
                long long v43 = 0u;
                id v16 = v15;
                uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
                if (v17)
                {
                  uint64_t v18 = v17;
                  uint64_t v19 = *(void *)v43;
LABEL_18:
                  uint64_t v20 = 0;
                  while (1)
                  {
                    if (*(void *)v43 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    v21 = *(void **)(*((void *)&v42 + 1) + 8 * v20);
                    if (!-[UIViewController _useViewBasedTopAndBottomLayoutGuides](a1)
                      || v21 != *(void **)(a1 + 544) && v21 != *(void **)(a1 + 552))
                    {
                      break;
                    }
                    if (v18 == ++v20)
                    {
                      uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
                      if (v18) {
                        goto LABEL_18;
                      }
                      goto LABEL_52;
                    }
                  }
                  v12 = v21;

                  if (v12) {
                    continue;
                  }
                  break;
                }
LABEL_52:
              }
              else
              {
                id v16 = v12;
              }

              v12 = 0;
            }
          }
          break;
        }
        if (objc_opt_isKindOfClass()) {
          id v4 = v12;
        }
        else {
          id v4 = 0;
        }

        goto LABEL_48;
      }
      v9 = [(id)a1 navigationController];
      v10 = [v9 navigationBar];
      uint64_t v11 = [v10 barStyle];

      if (v11 == 4) {
        goto LABEL_12;
      }
      if ((v2[12] & 0x800000000000000) != 0)
      {
        v22 = [v2 subviews];
        uint64_t v23 = [v22 count];

        if (v23 == 1)
        {
          v24 = [v2 subviews];
          v25 = [v24 objectAtIndexedSubscript:0];

          id v4 = 0;
          if ((v25[12] & 0x20000000000000) != 0)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0
              && ([v2 _layoutEngine],
                  v26 = objc_claimAutoreleasedReturnValue(),
                  v26,
                  v26))
            {
              -[UIView _updateConstraintsAtEngineLevelIfNeededWithViewForVariableChangeNotifications:](v2, v2);
              objc_msgSend(v25, "_nsis_origin");
              double v28 = v27;
              double v30 = v29;
              objc_msgSend(v25, "_nsis_bounds");
              double v32 = v31;
              double v34 = v33;
              objc_msgSend(v2, "_nsis_bounds");
              if (v36 == v34
                && v35 == v32
                && v30 == *(double *)(MEMORY[0x1E4F1DAD8] + 8)
                && v28 == *MEMORY[0x1E4F1DAD8])
              {
                v40 = v25;
              }
              else
              {
                v40 = 0;
              }
              id v4 = v40;
            }
            else
            {
              id v4 = 0;
            }
          }

          goto LABEL_48;
        }
      }
    }
    id v4 = 0;
    goto LABEL_48;
  }
  id v4 = 0;
LABEL_49:
  return v4;
}

- (id)_ancestorViewControllerOfClass:(uint64_t)a3 allowModalParent:
{
  if (a1)
  {
    id v6 = *(id *)(a1 + 104);
    id v7 = v6;
    if (a3 && !v6) {
      id v7 = *(id *)(a1 + 120);
    }
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
    }
    else
    {
      -[UIViewController _ancestorViewControllerOfClass:allowModalParent:](v7, a2, a3);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (uint64_t)_useViewBasedTopAndBottomLayoutGuides
{
  if (result)
  {
    v1 = (void *)result;
    if ((*(void *)(result + 376) & 0x100000000000) == 0 && (dyld_program_sdk_at_least() & 1) == 0) {
      v1[47] |= 0x100000000000uLL;
    }
    int v2 = dyld_program_sdk_at_least();
    unint64_t v3 = v1[47];
    if (v2 && (v3 & 0x200000000000) == 0 && (v1[68] || v1[69]))
    {
      uint64_t v4 = objc_opt_class();
      v5 = (void *)v1[68];
      if (v5) {
        int v6 = [v5 isMemberOfClass:v4];
      }
      else {
        int v6 = 1;
      }
      id v7 = (void *)v1[69];
      if (v7) {
        int v8 = [v7 isMemberOfClass:v4];
      }
      else {
        int v8 = 1;
      }
      if ((v6 & v8 & 1) == 0)
      {
        uint64_t v9 = *MEMORY[0x1E4F1C3C8];
        if ((v6 | v8))
        {
          if (v6) {
            [MEMORY[0x1E4F1CA00] raise:v9, @"Unexpected class for bottomLayoutGuide. This is an application bug. bottomlayoutGuide = %@", v1[69], v10 format];
          }
          else {
            [MEMORY[0x1E4F1CA00] raise:v9, @"Unexpected class for topLayoutGuide. This is an application bug. topLayoutGuide = %@", v1[68], v10 format];
          }
        }
        else
        {
          [MEMORY[0x1E4F1CA00] raise:v9, @"Unexpected class for topLayoutGuide and bottomLayoutGuide. This is an application bug. topLayoutGuide = %@, bottomlayoutGuide = %@", v1[68], v1[69] format];
        }
      }
      unint64_t v3 = v1[47] | 0x200000000000;
      v1[47] = v3;
    }
    return (v3 >> 44) & 1;
  }
  return result;
}

- (UINavigationController)navigationController
{
  uint64_t v3 = objc_opt_class();
  return (UINavigationController *)-[UIViewController _ancestorViewControllerOfClass:allowModalParent:]((uint64_t)self, v3, 0);
}

- (id)_contentOrObservableScrollViewForEdge:(unint64_t)a3
{
  if (self)
  {
    -[UIViewController _resolveContentScrollViewForEdge:]((uint64_t)self, a3);
    self = (UIViewController *)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = vars8;
  }
  return self;
}

- (id)_resolveContentScrollViewForEdge:(uint64_t)a1
{
  if (a2 != 1 && a2 != 4)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:sel__resolveContentScrollViewForEdge_, a1, @"UIViewController.m", 5324, @"Invalid parameter not satisfying: %@", @"edge == NSDirectionalRectEdgeTop || edge == NSDirectionalRectEdgeBottom" object file lineNumber description];
  }
  v5 = *(void **)(a1 + 592);
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [(id)a1 _defaultContentScrollViewForEdge:a2];
  }
  id v7 = v6;
  int v8 = [v6 _temporaryCoordinatingReplacement];

  if (v8)
  {
    uint64_t v9 = [v7 _temporaryCoordinatingReplacement];

    id v7 = (void *)v9;
  }
  uint64_t v10 = [*(id *)(a1 + 600) objectForKey:&unk_1ED3F3A80];
  uint64_t v11 = [*(id *)(a1 + 600) objectForKey:&unk_1ED3F3A98];
  v12 = (void *)v11;
  BOOL v14 = a2 == 1 && v10 != v7;
  BOOL v16 = a2 == 4 && v11 != (void)v7;
  if (!v14 && !v16) {
    goto LABEL_40;
  }
  uint64_t v17 = *(void **)(a1 + 600);
  if (v7)
  {
    if (!v17)
    {
      uint64_t v18 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
      uint64_t v19 = *(void **)(a1 + 600);
      *(void *)(a1 + 600) = v18;

      uint64_t v17 = *(void **)(a1 + 600);
    }
    uint64_t v20 = [NSNumber numberWithUnsignedInteger:a2];
    [v17 setObject:v7 forKey:v20];
  }
  else
  {
    v21 = [NSNumber numberWithUnsignedInteger:a2];
    [v17 removeObjectForKey:v21];

    if ([*(id *)(a1 + 600) count]) {
      goto LABEL_29;
    }
    uint64_t v20 = *(void **)(a1 + 600);
    *(void *)(a1 + 600) = 0;
  }

LABEL_29:
  if ([(id)objc_opt_class() doesOverrideViewControllerMethod:sel__observableScrollViewDidChangeFrom_forViewController_edges_])goto LABEL_40; {
  if (v14)
  }
  {
    if (v12 != v7) {
      [v7 _addScrollViewScrollObserver:a1];
    }
    v22 = v10;
    if (v10 == v12) {
      goto LABEL_40;
    }
LABEL_39:
    [v22 _removeScrollViewScrollObserver:a1];
    goto LABEL_40;
  }
  if (v16)
  {
    if (v10 != v7) {
      [v7 _addScrollViewScrollObserver:a1];
    }
    v22 = v12;
    if (v12 != v10) {
      goto LABEL_39;
    }
  }
LABEL_40:

  return v7;
}

- (id)_defaultContentScrollViewForEdge:(unint64_t)a3
{
  if (_UIBarsApplyChromelessEverywhere()) {
    goto LABEL_6;
  }
  if (qword_1EB25BB30 != -1) {
    dispatch_once(&qword_1EB25BB30, &__block_literal_global_142);
  }
  if (_MergedGlobals_136)
  {
LABEL_6:
    if (a3 != 1 && a3 != 4)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"UIViewController.m" lineNumber:1596 description:@"NSDirectionalRectEdgeTop and NSDirectionalRectEdgeBottom are the only valid parameters for this internal method"];
    }
    if ((*(void *)&self->_viewControllerFlags & 0x200000000000000) != 0)
    {
      id v7 = [(UIViewController *)self _contentScrollView];
    }
    else
    {
      id v7 = [(UIViewController *)self contentScrollViewForEdge:a3];
      if (!v7)
      {
        if ((*(void *)&self->_viewControllerFlags & 0x400000000000000) != 0)
        {
          id v7 = 0;
        }
        else
        {
          id v7 = -[UIViewController _contentScrollViewHeuristic]((uint64_t)self);
        }
      }
    }
  }
  else
  {
    id v7 = [(UIViewController *)self _shim_contentScrollView];
  }
  return v7;
}

- (UIScrollView)contentScrollViewForEdge:(NSDirectionalRectEdge)edge
{
  v5 = (uint64_t *)MEMORY[0x1E4F1C3C8];
  if (edge != 1 && edge != 4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid edge argument for -contentScrollViewForEdge:. Only values of NSDirectionalRectEdgeTop or NSDirectionalRectEdgeBottom are accepted."];
  }
  if (self)
  {
    uint64_t v6 = 0;
    id v7 = 0;
    uint64_t v16 = *v5;
    char v8 = 1;
    char v9 = 1;
    do
    {
      char v10 = v8;
      if ((qword_186B94240[v6] & edge) != 0)
      {
        observableScrollViews = self->_observableScrollViews;
        v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
        v13 = [(NSMutableDictionary *)observableScrollViews objectForKey:v12];

        if (v9)
        {
          id v14 = v13;

          id v7 = v14;
        }
        else if (v7 != v13)
        {
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v16, @"Multiple scroll views found for edges: %ld", edge);
        }

        char v9 = 0;
      }
      char v8 = 0;
      uint64_t v6 = 1;
    }
    while ((v10 & 1) != 0);
  }
  else
  {
    id v7 = 0;
  }
  return (UIScrollView *)v7;
}

- (UINavigationItem)navigationItem
{
  uint64_t v3 = [(UIViewController *)self searchDisplayController];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [(UIViewController *)self searchDisplayController],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 displaysSearchBarInNavigationBar],
        v5,
        v4,
        v6))
  {
    id v7 = [(UIViewController *)self searchDisplayController];
    char v8 = [v7 navigationItem];
  }
  else
  {
    char v8 = [(UIViewController *)self _navigationItemCreatingDefaultIfNotSet];
  }
  return (UINavigationItem *)v8;
}

- (UISearchDisplayController)searchDisplayController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchDisplayController);
  return (UISearchDisplayController *)WeakRetained;
}

- (UINavigationItem)_navigationItemCreatingDefaultIfNotSet
{
  navigationItem = self->_navigationItem;
  if (!navigationItem)
  {
    v5 = [(UIViewController *)self title];
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v6 = +[UIViewController instanceMethodForSelector:sel_title];
        uint64_t v7 = [(UIViewController *)self methodForSelector:sel_title];
        char v8 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = objc_opt_class();
        if (v6 == v7) {
          [v8 handleFailureInMethod:a2, self, @"UIViewController.m", 15032, @"ViewController class %@ returned a value of class %@ from -title, that is not a subclass of NSString. This is likely a memory error.", v9, v10, v14 object file lineNumber description];
        }
        else {
          [v8 handleFailureInMethod:a2, self, @"UIViewController.m", 15030, @"ViewController class %@ overrode -title and returned a value of class %@, that is not a subclass of NSString. This is an illegal override. overrideImplementation=%p", v9, v10, v7 object file lineNumber description];
        }
      }
    }
    uint64_t v11 = [[UINavigationItem alloc] initWithTitle:v5];
    v12 = self->_navigationItem;
    self->_navigationItem = v11;

    navigationItem = self->_navigationItem;
  }
  return navigationItem;
}

- (void)_collectExistingTraitCollectionsForTraitTracking:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  v5 = v4;
  if (self->_frozenTraitCollection)
  {
    v4[2](v4);
    uint64_t v4 = v5;
  }
  if (self->_lastNotifiedTraitCollection)
  {
    v4[2](v5);
    uint64_t v4 = v5;
  }
}

- (void)_performContentUnavailableConfigurationStateUpdate
{
  if (a1)
  {
    __int16 v2 = *(_WORD *)(a1 + 384);
    if ((v2 & 0x10) != 0)
    {
      *(void *)(a1 + 376) = *(void *)(a1 + 376);
      *(_WORD *)(a1 + 384) = v2 & 0xFFEF;
      if (_UIObservationTrackingEnabled())
      {
        [(id)a1 _updateContentUnavailableConfigurationWithObservationTracking];
      }
      else
      {
        -[UIViewController _executeContentUnavailableConfigurationUpdate]((void *)a1);
      }
    }
  }
}

- (unint64_t)__updateContentOverlayInsetsWithOurRect:(void *)a3 inBoundsOfAncestorViewController:(CGFloat)x viaImmediateChildOfAncestor:(CGFloat)y
{
  id v13 = a2;
  id v14 = a3;
  if (a1)
  {
    v15 = [(id)a1 _existingView];
    uint64_t v16 = [v13 _existingView];
    uint64_t v17 = [v16 window];
    uint64_t v18 = [v15 window];

    if (v17 != v18)
    {
      a1 = 0;
      goto LABEL_13;
    }
    uint64_t v19 = [(id)a1 _existingPresentationControllerImmediate:1 effective:1];
    uint64_t v20 = [(id)a1 _existingView];
    v21 = [v13 _existingView];
    if (v19)
    {
      v157[0] = 0.0;
      [v19 _baseContentInsetsWithLeftMargin:v157 rightMargin:0];
      [(id)a1 _setContentMargin:v157[0]];
    }
    else
    {
      v22 = [(id)a1 parentViewController];
      [v22 _contentMarginForChildViewController:a1];
      objc_msgSend((id)a1, "_setContentMargin:");
    }
    if ([(id)objc_opt_class() _directlySetsContentOverlayInsetsForChildren]) {
      goto LABEL_11;
    }
    uint64_t v23 = [v20 window];
    if (!v23) {
      goto LABEL_11;
    }
    v24 = (void *)v23;
    v25 = [v21 window];

    if (!v25
      || ([v20 _window],
          v26 = objc_claimAutoreleasedReturnValue(),
          [v21 _window],
          double v27 = objc_claimAutoreleasedReturnValue(),
          v27,
          v26,
          v26 != v27))
    {
LABEL_11:
      a1 = 0;
LABEL_12:

      goto LABEL_13;
    }
    char v156 = 0;
    [v13 _edgeInsetsForChildViewController:v14 insetsAreAbsolute:&v156];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    if (v156)
    {
      v157[0] = 0.0;
      double v155 = 0.0;
      [v13 _marginInfoForChild:v14 leftMargin:v157 rightMargin:&v155];
      if (v157[0] == -1.79769313e308)
      {
        objc_msgSend((id)a1, "_viewSafeAreaInsetsFromScene", v157[0]);
        double v38 = fmax(v37, 0.0);
      }
      else
      {
        double v38 = v32;
        double v32 = v157[0];
      }
      v157[0] = v32;
      if (v155 == -1.79769313e308)
      {
        objc_msgSend((id)a1, "_viewSafeAreaInsetsFromScene", v155);
        double v51 = fmax(v50, 0.0);
      }
      else
      {
        double v51 = v36;
        double v36 = v155;
      }
      double v155 = v36;
      [(id)a1 additionalSafeAreaInsets];
      objc_msgSend((id)a1, "_setContentOverlayInsets:andLeftMargin:rightMargin:", fmax(v30 + v52, 0.0), fmax(v38 + v53, 0.0), fmax(v34 + v54, 0.0), fmax(v51 + v55, 0.0), v157[0], v155);
      a1 = 1;
      goto LABEL_12;
    }
    [(id)a1 additionalSafeAreaInsets];
    double v40 = v30 + v39;
    double v42 = v32 + v41;
    double v138 = v34 + v43;
    double v45 = v36 + v44;
    [v21 bounds];
    CGFloat v133 = v48;
    CGFloat v134 = v49;
    rect.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
    if (v46 == *MEMORY[0x1E4F1DAD8] && v47 == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
    {
      rect.origin.x = v46;
    }
    else
    {
      CGFloat v56 = -v46;
      CGFloat v57 = -v47;
      v158.origin.x = x;
      v158.origin.y = y;
      double v58 = v42;
      double v59 = v45;
      double v60 = v40;
      double v61 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      v158.size.width = width;
      v158.size.height = height;
      CGRect v159 = CGRectOffset(v158, v56, v57);
      x = v159.origin.x;
      y = v159.origin.y;
      width = v159.size.width;
      double v47 = v61;
      double v40 = v60;
      double v45 = v59;
      double v42 = v58;
      height = v159.size.height;
    }
    CGFloat v132 = v47;
    double v135 = fmax(v40, 0.0);
    double v136 = fmax(v138, 0.0);
    double v137 = fmax(v42, 0.0);
    double v139 = fmax(v45, 0.0);
    if (qword_1EB25BB40 != -1) {
      dispatch_once(&qword_1EB25BB40, &__block_literal_global_170);
    }
    int v62 = byte_1EB25BB24;
    *(void *)&rect.origin.y = MEMORY[0x1E4F143A8];
    *(void *)&rect.size.width = 3221225472;
    *(void *)&rect.size.height = __121__UIViewController___updateContentOverlayInsetsWithOurRect_inBoundsOfAncestorViewController_viaImmediateChildOfAncestor___block_invoke;
    v141 = &unk_1E52E9EB8;
    id v142 = v19;
    unint64_t v143 = a1;
    id v130 = v20;
    id v144 = v130;
    id v63 = v13;
    id v145 = v63;
    char v154 = v62;
    CGFloat v146 = x;
    CGFloat v147 = y;
    CGFloat v148 = width;
    CGFloat v149 = height;
    CGFloat v150 = rect.origin.x;
    CGFloat v151 = v132;
    CGFloat v152 = v133;
    CGFloat v153 = v134;
    v131 = _Block_copy(&rect.origin.y);
    v64 = [v21 _screen];
    [v64 scale];
    double v66 = -0.5 / v65;
    if (v66 == 0.0) {
      double v67 = 1.0;
    }
    else {
      double v67 = v66;
    }

    v160.origin.x = rect.origin.x;
    v160.origin.y = v132;
    v160.size.width = v133;
    v160.size.height = v134;
    CGRect v161 = CGRectInset(v160, v67, v67);
    CGFloat v68 = v161.origin.x;
    CGFloat v69 = v161.origin.y;
    CGFloat v70 = v161.size.width;
    CGFloat v71 = v161.size.height;
    double v72 = fmin(v136, *(double *)(a1 + 896));
    double v73 = fmin(v139, *(double *)(a1 + 904));
    BOOL v74 = fmin(v137, *(double *)(a1 + 888)) == v137;
    if (fmin(v135, *(double *)(a1 + 880)) != v135) {
      BOOL v74 = 0;
    }
    if (v73 != v139) {
      BOOL v74 = 0;
    }
    BOOL v75 = v72 == v136 && v74;
    CGFloat v76 = v70;
    CGFloat v77 = v71;
    v188.origin.x = x;
    v188.origin.y = y;
    v188.size.width = width;
    v188.size.height = height;
    BOOL v78 = CGRectIntersectsRect(v161, v188);
    if (!v62 && !v78)
    {
      if (!v75)
      {
        v90 = v131;
        (*((void (**)(void *, void, double, double, double, double))v131 + 2))(v131, 0, v135, v137, v136, v139);
        a1 = 1;
LABEL_89:

        goto LABEL_12;
      }
      a1 = 0;
LABEL_88:
      v90 = v131;
      goto LABEL_89;
    }
    double v121 = *(double *)(a1 + 880);
    double v122 = *(double *)(a1 + 888);
    unint64_t v125 = *(void *)(a1 + 896);
    unint64_t v128 = *(void *)(a1 + 904);
    [v63 _contentOverlayInsets];
    double v124 = v79;
    double v118 = v80;
    double v119 = v81;
    double v120 = v82;
    v162.origin.x = v68;
    v162.origin.y = v69;
    v162.size.width = v70;
    v162.size.height = v71;
    v189.origin.x = x;
    v189.origin.y = y;
    v189.size.width = width;
    v189.size.height = height;
    BOOL v123 = v75;
    if (CGRectContainsRect(v162, v189))
    {
      BOOL v83 = 1;
      int v84 = 1;
      BOOL v85 = 1;
      BOOL v86 = 1;
      double v87 = v121;
      double v88 = v122;
      double v89 = v124;
    }
    else
    {
      v163.origin.x = x;
      v163.origin.y = y;
      v163.size.width = width;
      v163.size.height = height;
      double MinY = CGRectGetMinY(v163);
      v164.origin.x = v68;
      v164.origin.y = v69;
      v164.size.width = v70;
      v164.size.height = v71;
      if (MinY <= CGRectGetMinY(v164))
      {
        BOOL v109 = 0;
      }
      else
      {
        v165.origin.x = x;
        v165.origin.y = y;
        v165.size.width = width;
        v165.size.height = height;
        double v111 = CGRectGetMinY(v165);
        v166.origin.x = v68;
        v166.origin.y = v69;
        v166.size.width = v70;
        v166.size.height = v71;
        BOOL v109 = v111 < CGRectGetMaxY(v166);
      }
      v167.origin.x = x;
      v167.origin.y = y;
      v167.size.width = width;
      v167.size.height = height;
      double MinX = CGRectGetMinX(v167);
      v168.origin.x = v68;
      v168.origin.y = v69;
      v168.size.width = v70;
      v168.size.height = v71;
      if (MinX <= CGRectGetMinX(v168))
      {
        BOOL v85 = 0;
      }
      else
      {
        v169.origin.x = x;
        v169.origin.y = y;
        v169.size.width = width;
        v169.size.height = height;
        double v113 = CGRectGetMinX(v169);
        v170.origin.x = v68;
        v170.origin.y = v69;
        v170.size.width = v70;
        v170.size.height = v71;
        BOOL v85 = v113 < CGRectGetMaxX(v170);
      }
      v171.origin.x = x;
      v171.origin.y = y;
      v171.size.width = width;
      v171.size.height = height;
      double MaxY = CGRectGetMaxY(v171);
      v172.origin.x = v68;
      v172.origin.y = v69;
      v172.size.width = v70;
      v172.size.height = v71;
      if (MaxY <= CGRectGetMinY(v172))
      {
        BOOL v83 = 0;
      }
      else
      {
        v173.origin.x = x;
        v173.origin.y = y;
        v173.size.width = width;
        v173.size.height = height;
        double v115 = CGRectGetMaxY(v173);
        v174.origin.x = v68;
        v174.origin.y = v69;
        v174.size.width = v70;
        v174.size.height = v71;
        BOOL v83 = v115 < CGRectGetMaxY(v174);
      }
      v175.origin.x = x;
      v175.origin.y = y;
      v175.size.width = width;
      v175.size.height = height;
      double MaxX = CGRectGetMaxX(v175);
      v176.origin.x = v68;
      v176.origin.y = v69;
      v176.size.width = v70;
      v176.size.height = v71;
      if (MaxX <= CGRectGetMinX(v176))
      {
        BOOL v86 = 0;
      }
      else
      {
        v177.origin.x = x;
        v177.origin.y = y;
        v177.size.width = width;
        v177.size.height = height;
        double v117 = CGRectGetMaxX(v177);
        v178.origin.x = v68;
        v178.origin.y = v69;
        v178.size.width = v70;
        v178.size.height = v71;
        BOOL v86 = v117 < CGRectGetMaxX(v178);
      }
      double v87 = v121;
      double v88 = v122;
      double v89 = v124;
      int v84 = v109;
    }
    int v91 = v84 & v83;
    if (v62) {
      int v92 = 1;
    }
    else {
      int v92 = v91;
    }
    unsigned int v93 = v85 && v86;
    if (v62) {
      uint64_t v94 = 1;
    }
    else {
      uint64_t v94 = v93;
    }
    v95 = [v63 _independentContainedScrollViewIntermediateToDescendantViewController:a1];
    v98 = v95;
    if (v95 && ([v95 isDescendantOfView:v130] & 1) == 0)
    {
      char v99 = [v98 _edgesPropagatingSafeAreaInsetsToSubviews];
      v96.n128_u64[0] = v125;
      v97.n128_u64[0] = v128;
      if ((v99 & 5) == 0)
      {
        v96.n128_f64[0] = v136;
        double v87 = v135;
        int v92 = 0;
      }
      if ((v99 & 0xA) != 0)
      {
        uint64_t v94 = v94;
      }
      else
      {
        v97.n128_f64[0] = v139;
        double v88 = v137;
        uint64_t v94 = 0;
      }
    }
    else
    {
      v96.n128_u64[0] = v125;
      v97.n128_u64[0] = v128;
    }
    a1 = !v123 | v92 | v94;
    if (a1 != 1)
    {
LABEL_87:

      goto LABEL_88;
    }
    if (!v123)
    {
      double v88 = v137;
      v97.n128_f64[0] = v139;
      double v87 = v135;
      v96.n128_f64[0] = v136;
    }
    if (v92)
    {
      unint64_t v129 = v97.n128_u64[0];
      v179.origin.x = x;
      v179.origin.y = y;
      v179.size.width = width;
      v179.size.height = height;
      double v100 = fmax(v89, 0.0) - CGRectGetMinY(v179);
      v180.origin.x = rect.origin.x;
      v180.origin.y = v132;
      v180.size.width = v133;
      v180.size.height = v134;
      double v101 = fmax(v120, 0.0) - CGRectGetMaxY(v180);
      v181.origin.x = x;
      v181.origin.y = y;
      v181.size.width = width;
      v181.size.height = height;
      double v102 = v101 + CGRectGetMaxY(v181);
      if (v62)
      {
        double v87 = v135 + fmax(fmin(v100, v124), 0.0);
        v96.n128_f64[0] = v136 + fmax(fmin(v102, v120), 0.0);
        v103 = (void (**)(void *, uint64_t, double, double, __n128, __n128))v131;
        v97.n128_u64[0] = v129;
        if ((v94 & 1) == 0) {
          goto LABEL_86;
        }
        goto LABEL_81;
      }
      double v87 = v135 + fmax(v100, 0.0);
      v96.n128_f64[0] = v136 + fmax(v102, 0.0);
      v103 = (void (**)(void *, uint64_t, double, double, __n128, __n128))v131;
      v97.n128_u64[0] = v129;
      if (v94) {
        goto LABEL_84;
      }
    }
    else
    {
      if (v94)
      {
        v103 = (void (**)(void *, uint64_t, double, double, __n128, __n128))v131;
        if (v62)
        {
LABEL_81:
          unint64_t v126 = v96.n128_u64[0];
          v182.origin.x = x;
          v182.origin.y = y;
          v182.size.width = width;
          v182.size.height = height;
          double v88 = v137 + fmax(fmin(fmax(v118, 0.0) - CGRectGetMinX(v182), v118), 0.0);
          v183.origin.x = rect.origin.x;
          v183.origin.y = v132;
          v183.size.width = v133;
          v183.size.height = v134;
          double v104 = fmax(v119, 0.0) - CGRectGetMaxX(v183);
          v184.origin.x = x;
          v184.origin.y = y;
          v184.size.width = width;
          v184.size.height = height;
          CGFloat v105 = CGRectGetMaxX(v184);
          v96.n128_u64[0] = v126;
          double v106 = fmax(fmin(v104 + v105, v119), 0.0);
LABEL_85:
          v97.n128_f64[0] = v139 + v106;
          goto LABEL_86;
        }
LABEL_84:
        unint64_t v127 = v96.n128_u64[0];
        v185.origin.x = x;
        v185.origin.y = y;
        v185.size.width = width;
        v185.size.height = height;
        double v88 = v137 + fmax(fmax(v118, 0.0) - CGRectGetMinX(v185), 0.0);
        v186.origin.x = rect.origin.x;
        v186.origin.y = v132;
        v186.size.width = v133;
        v186.size.height = v134;
        double v107 = fmax(v119, 0.0) - CGRectGetMaxX(v186);
        v187.origin.x = x;
        v187.origin.y = y;
        v187.size.width = width;
        v187.size.height = height;
        CGFloat v108 = CGRectGetMaxX(v187);
        v96.n128_u64[0] = v127;
        double v106 = fmax(v107 + v108, 0.0);
        goto LABEL_85;
      }
      v103 = (void (**)(void *, uint64_t, double, double, __n128, __n128))v131;
    }
LABEL_86:
    v103[2](v103, v94, v87, v88, v96, v97);
    goto LABEL_87;
  }
LABEL_13:

  return a1;
}

- (void)_updateContentOverlayInsetsFromParentIfNecessary
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least()
    && (-[UIViewController _shouldSkipContentOverlayInsetsUpdate](self) & 1) == 0)
  {
    p_contentOverlayInsets = &self->_contentOverlayInsets;
    double top = self->_contentOverlayInsets.top;
    double left = self->_contentOverlayInsets.left;
    double bottom = self->_contentOverlayInsets.bottom;
    double right = self->_contentOverlayInsets.right;
    if (!byte_1EB25BB21)
    {
      if (qword_1EB25BC10 != -1) {
        dispatch_once(&qword_1EB25BC10, &__block_literal_global_2546);
      }
      if (!byte_1EB25BB29) {
        goto LABEL_12;
      }
    }
    if ((*(void *)&self->_viewControllerFlags & 0x20000000000000) == 0
      && ([(UIView *)self->_view superview], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0)
      && (uint64_t v9 = (void *)v8,
          BOOL v10 = [(UIViewController *)self _isDetachedFromWindowRootViewControllerHierarchy], v9, v10))
    {
      if (-[UIViewController _shouldSkipContentOverlayInsetsUpdate](self))
      {
        id v11 = 0;
        id v12 = 0;
LABEL_22:

        return;
      }
      uint64_t v20 = [(UIView *)self->_view superview];
      if (!v20)
      {
        CGFloat v77 = [MEMORY[0x1E4F28B00] currentHandler];
        [v77 handleFailureInMethod:sel___updateContentOverlayInsetsDirectlyFromSuperview, self, @"UIViewController.m", 1652, @"Can't update contentOverlayInsets directly from superview because _view.superview is unexpectedly nil. self = %@, _view = %@", self, self->_view object file lineNumber description];
      }
      view = self->_view;
      [(UIView *)view frame];
      double v54 = -[UIView _safeAreaInsetsForFrame:inSuperview:ignoreViewController:]((uint64_t)view, v20, 1, v50, v51, v52, v53);
      double v56 = v55;
      double v58 = v57;
      double v60 = v59;
      [(UIViewController *)self additionalSafeAreaInsets];
      double v82 = v54 + v61;
      double v63 = v56 + v62;
      double v65 = v58 + v64;
      double v67 = v60 + v66;
      CGFloat v68 = 0.0;
      if ([(UIViewController *)self ignoresParentMargins])
      {
        [(id)objc_opt_class() _horizontalContentMarginForView:self->_view];
        CGFloat v68 = v69;
      }
      double v70 = p_contentOverlayInsets->top;
      double v71 = self->_contentOverlayInsets.bottom;
      double v72 = self->_contentOverlayInsets.right;
      if (self->_contentOverlayInsets.left != v63 || v70 != v82 || v72 != v67 || v71 != v65)
      {
        CGFloat v76 = [(UIView *)self->_view window];
        [v76 _noteOverlayInsetsDidChange];
      }
      [(UIView *)self->_view _shouldReverseLayoutDirection];
      float64x2_t v80 = *(float64x2_t *)&self->_systemMinimumLayoutMargins.bottom;
      float64x2_t v81 = *(float64x2_t *)&self->_systemMinimumLayoutMargins.top;
      self->_systemMinimumLayoutMargins.double top = 0.0;
      self->_systemMinimumLayoutMargins.leading = v68;
      self->_systemMinimumLayoutMargins.double bottom = 0.0;
      self->_systemMinimumLayoutMargins.trailing = v68;
      if ((*(void *)&self->_viewControllerFlags & 0x20000000000000) != 0)
      {
        if (os_variant_has_internal_diagnostics())
        {
          double v79 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = self;
            _os_log_fault_impl(&dword_1853B0000, v79, OS_LOG_TYPE_FAULT, "Unexpectedly trying to update contentOverlayInsets directly from superview for UIViewController subclass that overrides -_setContentOverlayInsets. self = %@", buf, 0xCu);
          }
        }
        else
        {
          BOOL v78 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25BB50) + 8);
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = self;
            _os_log_impl(&dword_1853B0000, v78, OS_LOG_TYPE_ERROR, "Unexpectedly trying to update contentOverlayInsets directly from superview for UIViewController subclass that overrides -_setContentOverlayInsets. self = %@", buf, 0xCu);
          }
        }
      }
      p_contentOverlayInsets->double top = v82;
      self->_contentOverlayInsets.double left = v63;
      self->_contentOverlayInsets.double bottom = v65;
      self->_contentOverlayInsets.double right = v67;
      -[UIViewController _updateViewSafeAreaInsetsAndEagerlyUpdateContentScrollView:]((double *)self);
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v81, *(float64x2_t *)&self->_systemMinimumLayoutMargins.top), (int32x4_t)vceqq_f64(v80, *(float64x2_t *)&self->_systemMinimumLayoutMargins.bottom))), 0xFuLL))) & 1) == 0)[(UIView *)self->_view _updateInferredLayoutMargins]; {
      id v11 = 0;
      }
      id v12 = 0;
    }
    else
    {
LABEL_12:
      id v83 = 0;
      id v84 = 0;
      int v13 = -[UIViewController _getViewControllerToInheritInsetsFrom:viaImmediateChild:]((id *)&self->super.super.isa, &v84, &v83);
      id v12 = v84;
      id v11 = v83;
      if (v13)
      {
        if (![v12 isViewLoaded]) {
          goto LABEL_22;
        }
        id v14 = [(UIViewController *)self view];
        if ([v14 _ignoresLayerTransformForSafeAreaInsets]) {
          [v14 _frameIgnoringLayerTransform];
        }
        else {
          [v14 frame];
        }
        double v38 = v15;
        double v39 = v16;
        double v40 = v17;
        double v41 = v18;
        if ((*(void *)&self->_viewControllerFlags & 0x10000000000000) == 0)
        {
          double v42 = [v12 view];
          double v43 = [v14 superview];
          objc_msgSend(v42, "convertRect:fromView:", v43, v38, v39, v40, v41);
          double v38 = v44;
          double v39 = v45;
          double v40 = v46;
          double v41 = v47;
        }
        char v48 = -[UIViewController __updateContentOverlayInsetsWithOurRect:inBoundsOfAncestorViewController:viaImmediateChildOfAncestor:]((unint64_t)self, v12, v11, v38, v39, v40, v41);

        if ((v48 & 1) == 0) {
          goto LABEL_22;
        }
        goto LABEL_21;
      }
      uint64_t v19 = [(UIViewController *)self _existingPresentationControllerImmediate:0 effective:1];
      uint64_t v20 = v19;
      double v85 = 0.0;
      *(void *)buf = 0;
      if (v19)
      {
        [v19 _baseContentInsetsWithLeftMargin:buf rightMargin:&v85];
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
      }
      else
      {
        double v29 = [(UIViewController *)self _existingView];
        double v30 = [(UIViewController *)self _window];
        double v22 = _UIPresentationControllerBaseContentInsetsForControllersAndViewInWindow(0, self, v29, v30, buf, &v85);
        double v24 = v31;
        double v26 = v32;
        double v28 = v33;
      }
      [(UIViewController *)self additionalSafeAreaInsets];
      -[UIViewController _setContentOverlayInsets:andLeftMargin:rightMargin:](self, "_setContentOverlayInsets:andLeftMargin:rightMargin:", v22 + v34, v24 + v35, v26 + v36, v28 + v37, *(double *)buf, v85);
      [(UIViewController *)self _setContentMargin:*(double *)buf];
    }

LABEL_21:
    -[UIViewController _invalidateChildContentOverlayInsetsWithOldInsets:]((double *)self, top, left, bottom, right);
    goto LABEL_22;
  }
}

- (NSArray)childViewControllers
{
  if ([(NSMutableArray *)self->_childViewControllers count]) {
    uint64_t v3 = (void *)[(NSMutableArray *)self->_childViewControllers copy];
  }
  else {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v3;
}

- (int)_appearState
{
  return (*(_DWORD *)&self->_viewControllerFlags >> 1) & 3;
}

void __78__UIViewController__traitCollectionByApplyingLocalOverridesToTraitCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v37 = a2;
  v5 = a3;
  uint64_t v6 = v37[2]();
  uint64_t v7 = [v6 userInterfaceStyle];

  if (_UIIsPrivateMainBundle())
  {
    uint64_t v8 = [*(id *)(a1 + 32) preferredUserInterfaceStyle];
    if (v8)
    {
      uint64_t v9 = v8;
      if (v7 != v8)
      {
        BOOL v10 = v5[2](v5);
        [v10 setUserInterfaceStyle:v9];

        uint64_t v7 = v9;
      }
    }
  }
  uint64_t v11 = [*(id *)(a1 + 32) overrideUserInterfaceStyle];
  if (v11)
  {
    uint64_t v12 = v11;
    if (v7 != v11)
    {
      int v13 = v5[2](v5);
      [v13 setUserInterfaceStyle:v12];
    }
  }
  uint64_t v14 = [*(id *)(a1 + 32) _overrideHorizontalSizeClass];
  if (v14)
  {
    uint64_t v15 = v14;
    double v16 = v37[2]();
    uint64_t v17 = [v16 horizontalSizeClass];

    if (v17 != v15)
    {
      double v18 = v5[2](v5);
      [v18 setHorizontalSizeClass:v15];
    }
  }
  uint64_t v19 = [*(id *)(a1 + 32) _existingView];
  uint64_t v20 = [v19 superview];

  if (v20)
  {
    double v21 = [v20 traitCollection];
    uint64_t v22 = [v21 _vibrancy];

    if (v22 != -1)
    {
      double v23 = v37[2]();
      uint64_t v24 = [v23 _valueForNSIntegerTraitToken:0x1ED3F5C40];

      if (v22 > v24)
      {
        double v25 = v5[2](v5);
        [v25 _setNSIntegerValue:v22 forTraitToken:0x1ED3F5C40];
      }
    }
  }
  uint64_t v26 = [*(id *)(a1 + 32) _overrideUserInterfaceRenderingMode];
  if (v26)
  {
    uint64_t v27 = v26;
    double v28 = v37[2]();
    uint64_t v29 = [v28 _valueForNSIntegerTraitToken:0x1ED3F5C58];

    if (v29 != v27)
    {
      double v30 = v5[2](v5);
      [v30 _setNSIntegerValue:v27 forTraitToken:0x1ED3F5C58];
    }
  }
  double v31 = v37[2]();
  double v32 = self;
  double v33 = [v31 objectForTrait:v32];

  if (qword_1EB25BC18 != -1) {
    dispatch_once(&qword_1EB25BC18, &__block_literal_global_2559);
  }
  if ((byte_1EB25BB2A & 1) == 0 && !v33)
  {
    double v34 = [*(id *)(a1 + 32) _backdropBarGroupName];
    if (v34)
    {
      double v35 = v5[2](v5);
      double v36 = self;
      [v35 setObject:v34 forTrait:v36];
    }
  }
}

- (UIWindow)_window
{
  if ([(UIViewController *)self isViewLoaded])
  {
    uint64_t v3 = [(UIViewController *)self view];
    id WeakRetained = [v3 window];

    if (WeakRetained) {
      goto LABEL_14;
    }
  }
  -[UIViewController _rootAncestorViewControllerInWindow:](self, 1);
  v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  if ([(UIViewController *)v5 isViewLoaded])
  {
    uint64_t v6 = [(UIViewController *)v5 view];
    id WeakRetained = [v6 window];

    if (!v5) {
      goto LABEL_9;
    }
LABEL_7:
    if (!WeakRetained) {
      id WeakRetained = objc_loadWeakRetained((id *)&v5->_windowOfRootViewController);
    }
    goto LABEL_9;
  }
  id WeakRetained = 0;
  if (v5) {
    goto LABEL_7;
  }
LABEL_9:
  if (!WeakRetained)
  {
    if (v5 == self)
    {
      id WeakRetained = 0;
    }
    else
    {
      id WeakRetained = [(UIViewController *)v5 _window];
    }
  }

LABEL_14:
  return (UIWindow *)WeakRetained;
}

- (id)_existingView
{
  return self->_view;
}

- (UIView)view
{
  [(UIViewController *)self loadViewIfRequired];
  return (UIView *)[(UIViewController *)self _existingView];
}

- (void)loadViewIfRequired
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!self->_view)
  {
    if ((*((_WORD *)&self->_viewControllerFlags + 4) & 0x80) == 0)
    {
      uint64_t v3 = self->_lastNotifiedTraitCollection;
      if (dyld_program_sdk_at_least() && v3)
      {
        uint64_t v4 = v3;
        v5 = (void *)_UISetCurrentFallbackEnvironment(v4);
        [(UIViewController *)self loadView];
        _UIRestorePreviousFallbackEnvironment(v5);
      }
      else
      {
        if (!v3 && dyld_program_sdk_at_least())
        {
          UIViewControllerMissingInitialTraitCollection(self);
          uint64_t v6 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
          lastNotifiedTraitCollection = self->_lastNotifiedTraitCollection;
          self->_lastNotifiedTraitCollection = v6;
        }
        [(UIViewController *)self loadView];
      }

      -[UIViewController _setUpLayoutGuideConstraintIfNecessaryAtTop:]((uint64_t)self, 1);
      -[UIViewController _setUpLayoutGuideConstraintIfNecessaryAtTop:]((uint64_t)self, 0);
      uint64_t v8 = [(UIViewController *)self _window];
      uint64_t v9 = [v8 screen];

      if (v9 && [(UIViewController *)self isViewLoaded])
      {
        BOOL v10 = [(UIViewController *)self _contentOrObservableScrollViewForEdge:1];
        objc_msgSend(v10, "_willChangeToIdiom:onScreen:", objc_msgSend(v9, "_userInterfaceIdiom"), v9);
        uint64_t v11 = [(UIViewController *)self _contentOrObservableScrollViewForEdge:4];
        if (v11 != v10) {
          objc_msgSend(v11, "_willChangeToIdiom:onScreen:", objc_msgSend(v9, "_userInterfaceIdiom"), v9);
        }
      }
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      uint64_t v12 = [(UIViewController *)self storyboardSegueTemplates];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v46 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            if ([v17 performOnViewLoad]) {
              id v18 = (id)[v17 perform:self];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
        }
        while (v14);
      }

      if ([(NSArray *)self->_storyboardPreviewingRegistrants count])
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v19 = self->_storyboardPreviewingRegistrants;
        uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v42;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v42 != v22) {
                objc_enumerationMutation(v19);
              }
              objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * j), "registerForPreviewing", (void)v41);
            }
            uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v41 objects:v50 count:16];
          }
          while (v21);
        }
      }
      if ([(NSArray *)self->_storyboardCommitSegueTemplates count])
      {
        uint64_t v24 = [(NSArray *)self->_storyboardSegueTemplates arrayByAddingObjectsFromArray:self->_storyboardCommitSegueTemplates];
        storyboardSegueTemplates = self->_storyboardSegueTemplates;
        self->_storyboardSegueTemplates = v24;
      }
      if (dyld_program_sdk_at_least())
      {
        if ([(UIView *)self->_view translatesAutoresizingMaskIntoConstraints])
        {
          [(UIView *)self->_view _setHostsLayoutEngine:1];
        }
      }
      -[UIViewController _sendViewDidLoadWithAppearanceProxyObjectTaggingEnabled](self);
      uint64_t v26 = [(UIViewController *)self searchDisplayController];
      if (!v26) {
        goto LABEL_47;
      }
      uint64_t v27 = (void *)v26;
      double v28 = [(UIViewController *)self searchDisplayController];
      if ([v28 displaysSearchBarInNavigationBar])
      {
        uint64_t v29 = [(UIViewController *)self navigationController];
        double v30 = [v29 navigationBar];
        double v31 = [v30 topItem];
        double v32 = [(UIViewController *)self searchDisplayController];
        double v33 = [v32 navigationItem];

        if (v31 == v33)
        {
LABEL_47:

          return;
        }
        double v34 = [(UIViewController *)self navigationController];
        uint64_t v27 = [v34 navigationBar];

        double v35 = [v27 items];
        uint64_t v36 = [v35 indexOfObject:self->_navigationItem];

        if (v36 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_46:

          goto LABEL_47;
        }
        [v27 setLocked:0];
        double v37 = [v27 items];
        double v28 = (void *)[v37 mutableCopy];

        uint64_t v38 = [v28 indexOfObject:self->_navigationItem];
        double v39 = [(UIViewController *)self searchDisplayController];
        double v40 = [v39 navigationItem];
        [v28 replaceObjectAtIndex:v38 withObject:v40];

        [v27 setItems:v28 animated:0];
        [v27 setLocked:1];
        [v27 setNeedsDisplay];
      }

      goto LABEL_46;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__UIViewController_loadViewIfRequired__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    if (loadViewIfRequired_once != -1) {
      dispatch_once(&loadViewIfRequired_once, block);
    }
  }
}

- (BOOL)isViewLoaded
{
  return self->_view != 0;
}

- (int64_t)_overrideUserInterfaceRenderingMode
{
  return ((unint64_t)*((unsigned __int16 *)&self->_viewControllerFlags + 4) >> 2) & 3;
}

- (UIUserInterfaceStyle)overrideUserInterfaceStyle
{
  return *(void *)&self->_viewControllerFlags >> 62;
}

- (int64_t)_overrideHorizontalSizeClass
{
  return *((_WORD *)&self->_viewControllerFlags + 4) & 3;
}

- (UIUserInterfaceStyle)preferredUserInterfaceStyle
{
  return 0;
}

- (id)_existingNavigationItem
{
  return self->_navigationItem;
}

- (id)_backdropBarGroupName
{
  return 0;
}

- (uint64_t)_getViewControllerToInheritInsetsFrom:(void *)a3 viaImmediateChild:
{
  if (!a1) {
    return 0;
  }
  id v6 = a1[13];
  uint64_t v7 = v6;
  if (v6)
  {
    if (a2) {
      *a2 = v6;
    }
    if (a3) {
      *a3 = a1;
    }
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v9 = [a1 _existingPresentationControllerImmediate:0 effective:1];
    if (v9)
    {
      BOOL v10 = v9;
      uint64_t v11 = [v9 presentingViewController];
      uint64_t v8 = -[UIViewController _getViewControllerToInheritInsetsFrom:viaImmediateChild:](v11, a2, a3);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }

  return v8;
}

- (UIEdgeInsets)_contentOverlayInsets
{
  double top = self->_contentOverlayInsets.top;
  double left = self->_contentOverlayInsets.left;
  double bottom = self->_contentOverlayInsets.bottom;
  double right = self->_contentOverlayInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_setContentMargin:(double)a3
{
  if ([(UIViewController *)self ignoresParentMargins])
  {
    v5 = [(UIViewController *)self _existingView];
    id v6 = objc_opt_class();
    uint64_t v7 = v6;
    if (v5)
    {
      [v6 _horizontalContentMarginForView:v5];
      a3 = v8;
    }
    else
    {
      uint64_t v9 = [(UIViewController *)self traitCollection];
      [v7 _slimHorizontalContentMarginForTraitCollection:v9];
      a3 = v10;
    }
  }
  if (vabdd_f64(self->_contentMargin, a3) > 2.22044605e-16)
  {
    self->_contentMargin = a3;
    [(UIViewController *)self _updateChildContentMargins];
  }
}

- (BOOL)ignoresParentMargins
{
  return self->_ignoresParentMargins;
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  double top = self->_additionalSafeAreaInsets.top;
  double left = self->_additionalSafeAreaInsets.left;
  double bottom = self->_additionalSafeAreaInsets.bottom;
  double right = self->_additionalSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_invalidateChildContentOverlayInsetsWithOldInsets:(double)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    double v10 = [a1 _existingView];
    [v10 _setViewDelegateContentOverlayInsetsAreClean:1];

    BOOL v11 = a3 == a1[111] && a2 == a1[110];
    BOOL v12 = v11 && a5 == a1[113];
    if (!v12 || a4 != a1[112])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v14 = objc_msgSend(a1, "childViewControllers", 0);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v21 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = [*(id *)(*((void *)&v20 + 1) + 8 * i) _existingView];
            [v19 _setViewDelegateContentOverlayInsetsAreClean:0];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v16);
      }
    }
  }
}

- (double)_contentMarginForChildViewController:(id)a3
{
  return self->_contentMargin;
}

- (BOOL)_isDetachedFromWindowRootViewControllerHierarchy
{
  if (-[UIViewController _getViewControllerToInheritInsetsFrom:viaImmediateChild:]((id *)&self->super.super.isa, 0, 0))return 0; {
  uint64_t v3 = [(UIViewController *)self _window];
  }
  uint64_t v4 = [v3 rootViewController];

  if (v4 == self) {
    return 0;
  }
  v5 = [(UIViewController *)self _existingPresentationControllerImmediate:1 effective:1];

  return v5 == 0;
}

- (id)_independentContainedScrollViewIntermediateToDescendantViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 1;
  id v6 = [(UIViewController *)self _contentOrObservableScrollViewForEdge:1];
  if (v6
    || (uint64_t v5 = 4,
        [(UIViewController *)self _contentOrObservableScrollViewForEdge:4],
        (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = [v4 _existingView];
    if ([v7 isDescendantOfView:v6])
    {
      double v8 = [v4 _contentOrObservableScrollViewForEdge:v5];

      if (v8 != v6) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    id v6 = 0;
  }
LABEL_8:

  return v6;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  *a4 = 0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  result.double right = v7;
  result.double bottom = v6;
  result.double left = v5;
  result.double top = v4;
  return result;
}

- (NSArray)storyboardSegueTemplates
{
  return self->_storyboardSegueTemplates;
}

- (void)_recordTraitUsage:(unint64_t)a3 insideMethod:(const char *)a4 withInvalidationAction:
{
  if (a1)
  {
    if (!a1[53] && _UITraitTokenSetCount(a2))
    {
      double v8 = objc_alloc_init(_UITraitChangeRegistry);
      uint64_t v9 = (void *)a1[53];
      a1[53] = v8;
    }
    uint64_t v10 = a1[53];
    -[_UITraitChangeRegistry recordTraitUsage:forTraitEnvironment:insideMethod:withInvalidationAction:](v10, a2, a1, a3, a4);
  }
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3 andLeftMargin:(double)a4 rightMargin:(double)a5
{
  CGFloat right = a3.right;
  double bottom = a3.bottom;
  CGFloat left = a3.left;
  double top = a3.top;
  BOOL v12 = [(UIViewController *)self _existingView];
  uint64_t v52 = v12;
  if (v12)
  {
    UIRoundToViewScale(v12);
    double top = v13;
    UIRoundToViewScale(v52);
    CGFloat left = v14;
    UIRoundToViewScale(v52);
    double bottom = v15;
    UIRoundToViewScale(v52);
    CGFloat right = v16;
  }
  float64x2_t v18 = *(float64x2_t *)&self->_contentOverlayInsets.top;
  float64x2_t v17 = *(float64x2_t *)&self->_contentOverlayInsets.bottom;
  BOOL v21 = left == self->_contentOverlayInsets.left
     && top == v18.f64[0]
     && right == self->_contentOverlayInsets.right
     && bottom == v17.f64[0];
  if (!v21
    || self->_leftContentMargin != a4
    || self->_rightContentMargin != a5
    || ((view = self->_view) == 0
      ? (float64x2_t v24 = 0uLL, v25 = 0uLL)
      : (p_safeAreaInsets = (float64x2_t *)&view->_safeAreaInsets, float64x2_t v24 = *p_safeAreaInsets, v25 = p_safeAreaInsets[1]),
        (vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v24, v18), (int32x4_t)vceqq_f64(v25, v17)))), 0xFuLL))) & 1) != 0))
  {
    if (a4 == -1.79769313e308)
    {
      [(UIViewController *)self _viewSafeAreaInsetsFromScene];
      double v27 = fmax(v26, 0.0);
    }
    else
    {
      double v27 = left;
      CGFloat left = a4;
    }
    if (a5 == -1.79769313e308)
    {
      [(UIViewController *)self _viewSafeAreaInsetsFromScene];
      double v29 = fmax(v28, 0.0);
    }
    else
    {
      double v29 = right;
      CGFloat right = a5;
    }
    BOOL v30 = [(UIViewController *)self ignoresParentMargins];
    if (v52)
    {
      if (v30)
      {
        [(id)objc_opt_class() _horizontalContentMarginForView:v52];
        CGFloat right = v31;
        CGFloat left = v31;
      }
      else
      {
        UIRoundToViewScale(v52);
        CGFloat left = v35;
        UIRoundToViewScale(v52);
        CGFloat right = v36;
      }
      double v37 = self->_contentOverlayInsets.top;
      if (self->_contentOverlayInsets.left == v27
        && v37 == top
        && self->_contentOverlayInsets.right == v29
        && self->_contentOverlayInsets.bottom == bottom)
      {
LABEL_43:
        -[UIViewController _setContentOverlayInsets:](self, "_setContentOverlayInsets:", top, v27, bottom, v29);
        [v52 _setViewDelegateContentOverlayInsetsAreClean:1];
        self->_double leftContentMargin = left;
        self->_double rightContentMargin = right;
        [(NSLayoutConstraint *)self->_topBarInsetGuideConstraint setConstant:top];
        [(NSLayoutConstraint *)self->_bottomBarInsetGuideConstraint setConstant:bottom];
        float64x2_t v50 = *(float64x2_t *)&self->_systemMinimumLayoutMargins.bottom;
        float64x2_t v51 = *(float64x2_t *)&self->_systemMinimumLayoutMargins.top;
        int v41 = [v52 _shouldReverseLayoutDirection];
        if (v41) {
          uint64_t v42 = 528;
        }
        else {
          uint64_t v42 = 520;
        }
        if (v41) {
          uint64_t v43 = 520;
        }
        else {
          uint64_t v43 = 528;
        }
        CGFloat v44 = *(double *)((char *)&self->super.super.isa + v43);
        CGFloat v45 = *(double *)((char *)&self->super.super.isa + v42);
        self->_systemMinimumLayoutMargins.double top = 0.0;
        self->_systemMinimumLayoutMargins.leading = v45;
        self->_systemMinimumLayoutMargins.double bottom = 0.0;
        self->_systemMinimumLayoutMargins.trailing = v44;
        -[UIViewController _updateViewSafeAreaInsetsAndEagerlyUpdateContentScrollView:]((double *)self);
        if ([(UIViewController *)self viewRespectsSystemMinimumLayoutMargins]
          && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v51, *(float64x2_t *)&self->_systemMinimumLayoutMargins.top), (int32x4_t)vceqq_f64(v50, *(float64x2_t *)&self->_systemMinimumLayoutMargins.bottom))), 0xFuLL))) & 1) == 0)
        {
          [v52 _updateInferredLayoutMargins];
        }
        goto LABEL_52;
      }
      double v33 = objc_msgSend(v52, "window", v37);
      [v33 _noteOverlayInsetsDidChange];
    }
    else
    {
      if (!v30) {
        goto LABEL_43;
      }
      double v32 = objc_opt_class();
      double v33 = [(UIViewController *)self traitCollection];
      [v32 _slimHorizontalContentMarginForTraitCollection:v33];
      CGFloat right = v34;
      CGFloat left = v34;
    }

    goto LABEL_43;
  }
LABEL_52:
  long long v46 = v52;
  if (v52)
  {
    char v47 = dyld_program_sdk_at_least();
    long long v46 = v52;
    if ((v47 & 1) == 0)
    {
      double leftContentMargin = self->_leftContentMargin;
      double rightContentMargin = self->_rightContentMargin;
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v52, "_setDefaultLayoutMargins:", 0.0, leftContentMargin, 0.0, rightContentMargin);
      }
      else {
        objc_msgSend(v52, "setLayoutMargins:", 0.0, leftContentMargin, 0.0, rightContentMargin);
      }
      long long v46 = v52;
    }
  }
}

- (id)_effectiveStatusBarHiddenViewController
{
  uint64_t v3 = [(UIViewController *)self _presentedStatusBarViewController];
  double v4 = [v3 _effectiveStatusBarHiddenViewController];

  if (v4)
  {
    double v5 = v4;
    double v6 = v5;
  }
  else
  {
    double v7 = [(UIViewController *)self _existingPresentationControllerImmediate:0 effective:1 includesRoot:1];
    double v8 = v7;
    if (!v7
      || ([v7 _shouldPresentedViewControllerControlStatusBarAppearance] & 1) != 0
      || ([v8 presentedViewController],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 modalPresentationCapturesStatusBarAppearance],
          v9,
          v10))
    {
      BOOL v11 = [(UIViewController *)self childViewControllerForStatusBarHidden];
      BOOL v12 = [v11 _effectiveStatusBarHiddenViewController];

      if (v12)
      {
        double v5 = v12;
        double v6 = v5;
      }
      else
      {
        double v6 = self;
        double v5 = 0;
      }
    }
    else
    {
      double v5 = 0;
      double v6 = 0;
    }
  }
  return v6;
}

- (UIViewController)_presentedStatusBarViewController
{
  return self->_presentedStatusBarViewController;
}

- (void)_updateTraitsIfNecessarySchedulingPropagation:(uint64_t)a1
{
  if (a1)
  {
    double v4 = [(id)a1 _parentModalViewController];
    double v5 = [v4 _presentationController];
    [v5 _updateTraitsIfNecessary];

    double v6 = [(id)a1 _parentModalViewController];
    double v7 = [v6 _originalPresentationController];
    [v7 _updateTraitsIfNecessary];

    double v8 = [(id)a1 _temporaryPresentationController];
    [v8 _updateTraitsIfNecessary];

    obuint64_t j = [(id)a1 traitCollection];
    id v9 = *(id *)(a1 + 496);
    if (v9 != obj && ([obj isEqual:v9] & 1) == 0)
    {
      objc_storeStrong((id *)(a1 + 496), obj);
      int v10 = (void *)_UISetCurrentFallbackEnvironment((void *)a1);
      BOOL v11 = +[UITraitCollection _currentTraitCollectionIfExists]();
      +[UITraitCollection setCurrentTraitCollection:obj];
      [(id)a1 _traitCollectionDidChange:v9];
      +[UITraitCollection setCurrentTraitCollection:v11];
      _UIRestorePreviousFallbackEnvironment(v10);
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12) {
        _UIViewInvalidateTraitCollectionAndSchedulePropagation(v12, a2);
      }
    }
  }
}

- (UITraitCollection)traitCollection
{
  frozenTraitCollection = self->_frozenTraitCollection;
  if (frozenTraitCollection)
  {
    uint64_t v3 = frozenTraitCollection;
    goto LABEL_11;
  }
  TraitCollectionTSD = GetTraitCollectionTSD();
  char v6 = TraitCollectionTSD[9];
  TraitCollectionTSD[9] = 1;
  double v7 = [(UIViewController *)self _parentTraitEnvironment];
  double v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 _traitCollectionForChildEnvironment:self];
  }
  else
  {
    if (dyld_program_sdk_at_least())
    {
      int v10 = self->_lastNotifiedTraitCollection;
      if (!v10)
      {
        UIViewControllerMissingInitialTraitCollection(self);
        int v10 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_lastNotifiedTraitCollection, v10);
      }
      goto LABEL_10;
    }
    uint64_t v9 = +[UITraitCollection _defaultTraitCollection]();
  }
  int v10 = (UITraitCollection *)v9;
LABEL_10:
  BOOL v11 = -[UIViewController _traitCollectionByApplyingOverridesFromParentViewControllerToTraitCollection:](self, v10);

  -[UIViewController _traitCollectionByApplyingLocalOverridesToTraitCollection:]((uint64_t)self, v11);
  uint64_t v3 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();

  *((unsigned char *)GetTraitCollectionTSD() + 9) = v6;
  _UITraitEnvironmentGeneratedTraitCollection((uint64_t)self, (unint64_t)v3);

LABEL_11:
  return v3;
}

- (id)_traitCollectionByApplyingOverridesFromParentViewControllerToTraitCollection:(void *)a1
{
  id v3 = a2;
  double v4 = v3;
  if (a1)
  {
    id v5 = v3;
    char v6 = [a1 parentViewController];
    double v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [a1 _departingParentViewController];
    }
    uint64_t v9 = v8;

    int v10 = [v9 _traitOverridesForChildViewController:a1];
    if (!v10) {
      goto LABEL_14;
    }
    BOOL v11 = +[UITraitCollection _emptyTraitCollection]();
    id v12 = v10;
    id v13 = v11;
    if (v12 == v13)
    {
    }
    else
    {
      double v14 = v13;
      if (v13)
      {
        char v15 = [v12 isEqual:v13];

        if (v15) {
          goto LABEL_14;
        }
      }
      else
      {
      }
      -[UITraitCollection _traitCollectionByApplyingOverrides:defaultValueOverrides:](v5, (uint64_t)v12, 0);
      id v12 = v5;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_14:
    goto LABEL_15;
  }
  id v5 = 0;
LABEL_15:

  return v5;
}

- (id)_traitCollectionByApplyingLocalOverridesToTraitCollection:(uint64_t)a1
{
  if (a1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__UIViewController__traitCollectionByApplyingLocalOverridesToTraitCollection___block_invoke;
    v7[3] = &unk_1E52E9F30;
    v7[4] = a1;
    id v3 = -[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](a2, (uint64_t)v7);
    double v4 = *(void ***)(a1 + 416);
    if (v4)
    {
      uint64_t v5 = -[_UITraitOverrides _traitCollectionByApplyingOverridesToTraitCollection:](v4, v3);

      id v3 = (void *)v5;
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)_rootAncestorViewControllerInWindow:(void *)a1
{
  if (a1)
  {
    id v3 = [a1 _nonModalAncestorViewController];
    double v4 = v3;
    if (v3)
    {
      uint64_t v5 = v3;
      do
      {
        if (a2 && ([v5 _isRootViewController] & 1) != 0) {
          break;
        }
        char v6 = [v5 _parentModalViewController];

        if (!v6) {
          break;
        }
        uint64_t v7 = [v5 _parentModalViewController];

        uint64_t v5 = (void *)v7;
      }
      while (v7);
    }
    else
    {
      uint64_t v5 = 0;
    }
    uint64_t v8 = [v5 parentViewController];
    if (v8 && (uint64_t v9 = (void *)v8, v10 = dyld_program_sdk_at_least(), v9, (v10 & 1) != 0))
    {
      id v11 = [v5 _rootAncestorViewController];
    }
    else
    {
      id v11 = v5;
    }
    id v12 = v11;
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

- (id)_existingPresentationControllerImmediate:(char)a3 effective:(int)a4 includesRoot:(char)a5 prefersRoot:
{
  id v5 = a1;
  if (a1)
  {
    if (a2) {
      [a1 _parentModalViewController];
    }
    else {
    char v10 = [a1 presentingViewController];
    }
    if (v10)
    {
      if (!a4 || ![v5 _isRootViewController] || (a5 & 1) == 0)
      {
        if (a3) {
          [v10 _presentationController];
        }
        else {
        id v5 = [v10 _originalPresentationController];
        }
        goto LABEL_21;
      }
      if (!a2) {
        goto LABEL_20;
      }
    }
    else if (!a2 || (a4 & 1) == 0)
    {
      if (!a4) {
        goto LABEL_16;
      }
      goto LABEL_20;
    }
    id v11 = [v5 parentViewController];

    if (v11)
    {
LABEL_16:
      id v5 = 0;
LABEL_21:

      goto LABEL_22;
    }
LABEL_20:
    id v12 = [v5 _window];
    id v5 = [v12 _rootPresentationController];

    goto LABEL_21;
  }
LABEL_22:
  return v5;
}

- (UIViewController)parentViewController
{
  return self->_parentViewController;
}

- (UIViewController)presentingViewController
{
  id v3 = self->_parentModalViewController;
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIViewController *)self->_parentViewController presentingViewController];
  }
  char v6 = v5;

  return v6;
}

- (UIViewController)_parentModalViewController
{
  return self->_parentModalViewController;
}

- (id)_nonModalAncestorViewControllerStopAtIsPresentationContext:(BOOL)a3
{
  BOOL v3 = a3;
  parentViewController = self;
  if (!a3) {
    parentViewController = self->_parentViewController;
  }
  char v6 = parentViewController;
  if (v6)
  {
    uint64_t v7 = v6;
    while (1)
    {
      uint64_t v8 = v7->_parentViewController;
      if (!v8) {
        break;
      }
      uint64_t v9 = v8;
      if (v3)
      {
        BOOL v10 = [(UIViewController *)v7 definesPresentationContext];

        if (v10) {
          break;
        }
      }
      else
      {
      }
      id v11 = v7->_parentViewController;

      uint64_t v7 = v11;
      if (!v11) {
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    uint64_t v7 = self;
  }
  return v7;
}

- (id)_nonModalAncestorViewController
{
  return [(UIViewController *)self _nonModalAncestorViewControllerStopAtIsPresentationContext:0];
}

- (BOOL)_isRootViewController
{
  return (*(void *)&self->_viewControllerFlags >> 8) & 1;
}

- (UIViewController)_departingParentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__departingParentViewController);
  return (UIViewController *)WeakRetained;
}

- (id)_traitOverridesForChildViewController:(id)a3
{
  return 0;
}

- (uint64_t)_shouldSkipContentOverlayInsetsUpdate
{
  uint64_t v1 = (uint64_t)a1;
  if (a1)
  {
    __int16 v2 = [a1 _existingPresentationControllerImmediate:0 effective:1 includesRoot:1];
    char v3 = 0;
    if (([(id)objc_opt_class() _wantsContentOverlayInsetsUpdatesWhileDismissing] & 1) == 0) {
      char v3 = [v2 _wantsContentOverlayInsetsUpdatesWhileDismissing] ^ 1;
    }
    int v4 = [(id)v1 _appearState];
    if (!v4 || v4 == 3 && (v3 & 1) != 0 || ([(id)v1 _transitioningOutWithoutDisappearing] & 1) != 0)
    {
      uint64_t v1 = 1;
LABEL_22:

      return v1;
    }
    id v5 = [(id)v1 _existingView];
    char v6 = v5;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
    if (v5) {
      [v5 transform];
    }
    if (_UIViewDirtiesDelegateContentInsetsForGeometryChange())
    {
      uint64_t v7 = [(id)v1 _existingPresentationControllerImmediate:0 effective:1];
      if (v7
        || ([(id)v1 presentedViewController], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        v9[0] = v10;
        v9[1] = v11;
        v9[2] = v12;
        if (_transformIsSupportedForSimpleContainment((double *)v9))
        {
LABEL_20:
          uint64_t v1 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
    }
    if (v6)
    {
      uint64_t v1 = 1;
      if (*((double *)&v10 + 1) != *(double *)(MEMORY[0x1E4F1DAB8] + 8)
        || *(double *)&v11 != *(double *)(MEMORY[0x1E4F1DAB8] + 16)
        || fabs(*(double *)&v10) != *MEMORY[0x1E4F1DAB8]
        || fabs(*((double *)&v11 + 1)) != *(double *)(MEMORY[0x1E4F1DAB8] + 24))
      {
        goto LABEL_21;
      }
    }
    goto LABEL_20;
  }
  return v1;
}

- (id)_parentTraitEnvironment
{
  int v3 = _UIViewControllersInheritTraitsFromViewHierarchy();
  char v4 = v3;
  if (v3)
  {
    if (!self) {
      goto LABEL_12;
    }
    if (qword_1EB25BB68 != -1) {
      dispatch_once(&qword_1EB25BB68, &__block_literal_global_446);
    }
    if (!byte_1EB25BB26)
    {
LABEL_12:
      uint64_t v9 = [(UIViewController *)self _existingPresentationControllerImmediate:1 effective:1 includesRoot:1];
      long long v10 = [v9 presentedViewController];

      if (v10 == self)
      {
        id v13 = v9;
      }
      else
      {
        id v11 = [(UIView *)self->_view superview];
        if (v11)
        {
          id v12 = v11;
          while (([v12 _canBeParentTraitEnvironment] & 1) == 0)
          {
            id v12 = (id)[v12 superview];
            if (!v12) {
              goto LABEL_17;
            }
          }
          id v13 = v12;
        }
        else
        {
LABEL_17:
          if (v4)
          {
            uint64_t v8 = 0;
LABEL_23:

            goto LABEL_24;
          }
          id v13 = [(UIViewController *)self _window];
        }
      }
      uint64_t v8 = v13;
      goto LABEL_23;
    }
    id v5 = [(UIViewController *)self _existingView];
    char v6 = v5;
    if (!v5 || ([v5 window], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
    {

      goto LABEL_12;
    }
  }
  uint64_t v8 = [(UIViewController *)self parentViewController];
  if (!v8)
  {
    uint64_t v8 = [(UIViewController *)self _departingParentViewController];
    if (!v8) {
      goto LABEL_12;
    }
  }
LABEL_24:
  return v8;
}

- (id)_existingPresentationControllerImmediate:(BOOL)a3 effective:(BOOL)a4 includesRoot:(BOOL)a5
{
  return -[UIViewController _existingPresentationControllerImmediate:effective:includesRoot:prefersRoot:](self, a3, a4, a5, 1);
}

- (UIViewController)presentedViewController
{
  int v3 = [(UIViewController *)self childModalViewController];
  if (!v3)
  {
    int v3 = [(UIViewController *)self->_parentViewController presentedViewController];
  }
  return (UIViewController *)v3;
}

- (UIViewController)childModalViewController
{
  int v3 = -[UIViewController _appearingOrAppearedChildModalViewController]((uint64_t)self);
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(NSMutableArray *)self->_childModalViewControllers lastObject];
  }
  char v6 = v5;

  return (UIViewController *)v6;
}

- _appearingOrAppearedChildModalViewController
{
  id v1;
  _DWORD *v2;
  uint64_t v3;
  void *i;
  _DWORD *v5;
  long long v7;
  long long v8;
  long long v9;
  long long v10;
  unsigned char v11[128];
  uint64_t v12;
  uint64_t vars8;

  id v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v9 = 0u;
    long long v10 = 0u;
    uint64_t v7 = 0u;
    uint64_t v8 = 0u;
    uint64_t v1 = *(id *)(a1 + 112);
    __int16 v2 = (_DWORD *)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v2)
    {
      int v3 = *(void *)v8;
      while (2)
      {
        for (uint64_t i = 0; i != v2; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v8 != v3) {
            objc_enumerationMutation(v1);
          }
          id v5 = *(_DWORD **)(*((void *)&v7 + 1) + 8 * i);
          if (v5 && ((v5[94] >> 1) & 3u) - 1 < 2)
          {
            __int16 v2 = v5;
            goto LABEL_13;
          }
        }
        __int16 v2 = (_DWORD *)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (v2) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    __int16 v2 = 0;
  }
  return v2;
}

- (id)_existingPresentationControllerImmediate:(BOOL)a3 effective:(BOOL)a4
{
  return [(UIViewController *)self _existingPresentationControllerImmediate:a3 effective:a4 includesRoot:0];
}

+ (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing
{
  return 0;
}

- (BOOL)_transitioningOutWithoutDisappearing
{
  return 0;
}

- (UIPresentationController)_temporaryPresentationController
{
  return self->_temporaryPresentationController;
}

- (int)_preferredStatusBarVisibility
{
  if ([(id)objc_opt_class() doesOverrideViewControllerMethod:sel_prefersStatusBarHidden])
  {
    if ([(UIViewController *)self prefersStatusBarHidden]) {
      return 1;
    }
    else {
      return 2;
    }
  }
  else
  {
    return -[UIViewController _defaultViewControllerStatusBarVisibilityBehavior]((uint64_t)self);
  }
}

- (uint64_t)_defaultViewControllerStatusBarVisibilityBehavior
{
  uint64_t v1 = a1;
  if (a1)
  {
    if ([(id)UIApp _wantsCompactStatusBarHiding])
    {
      __int16 v2 = [(id)v1 traitCollection];
      if ([v2 verticalSizeClass] == 1) {
        uint64_t v1 = 1;
      }
      else {
        uint64_t v1 = 2;
      }
    }
    else
    {
      return 2;
    }
  }
  return v1;
}

- (UIViewController)childViewControllerForStatusBarHidden
{
  return 0;
}

- (UIEdgeInsets)_minimumLayoutMarginsForView
{
  BOOL v3 = [(UIViewController *)self viewRespectsSystemMinimumLayoutMargins];
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if (v3) {
    [(UIViewController *)self systemMinimumLayoutMargins];
  }
  result.CGFloat right = v5;
  result.double bottom = v4;
  result.CGFloat left = v6;
  result.double top = v7;
  return result;
}

- (NSDirectionalEdgeInsets)systemMinimumLayoutMargins
{
  double top = self->_systemMinimumLayoutMargins.top;
  double leading = self->_systemMinimumLayoutMargins.leading;
  double bottom = self->_systemMinimumLayoutMargins.bottom;
  double trailing = self->_systemMinimumLayoutMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (NSMutableArray)mutableChildViewControllers
{
  return self->_childViewControllers;
}

- (BOOL)_isNestedNavigationController
{
  return 0;
}

- (BOOL)_isInPopoverPresentation
{
  uint64_t v3 = objc_opt_class();
  return [(UIViewController *)self _isInContextOfPresentationControllerOfClass:v3 effective:1];
}

- (BOOL)_isInContextOfPresentationControllerOfClass:(Class)a3 effective:(BOOL)a4
{
  uint64_t v5 = [(UIViewController *)self presentingViewController];
  if (v5)
  {
    double v6 = (void *)v5;
    while (1)
    {
      if (a4) {
        [v6 _presentationController];
      }
      else {
      double v7 = [v6 _originalPresentationController];
      }
      LOBYTE(v8) = objc_opt_isKindOfClass();
      if ((v8 & 1) != 0 || [v7 shouldPresentInFullscreen]) {
        break;
      }
      uint64_t v8 = [v6 presentingViewController];

      double v6 = (void *)v8;
      if (!v8) {
        return v8 & 1;
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8 & 1;
}

- (id)_tabBarControllerEnforcingClass:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v6 = [(UIViewController *)self tabBarController];
  if (!v6)
  {
    dyld_program_sdk_at_least();
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (dyld_program_sdk_at_least())
  {
    if (isKindOfClass) {
      goto LABEL_7;
    }
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UIViewController.m", 14988, @"-tabBarController must return an instance of a UITabBarController subclass. %@ returned %@, which is not a kind of UITabBarController.", self, v6 object file lineNumber description];
  }
  else
  {
    if (isKindOfClass) {
      goto LABEL_7;
    }
    long long v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_tabBarControllerEnforcingClass____s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = self;
      __int16 v13 = 2112;
      double v14 = v6;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "-tabBarController must return an instance of a UITabBarController subclass. %@ returned %@, which is not a kind of UITabBarController.", buf, 0x16u);
    }
  }
  if (v3)
  {

    double v6 = 0;
  }
LABEL_7:
  return v6;
}

- (BOOL)_isNavigationController
{
  return 0;
}

- (BOOL)_monitorsSystemLayoutFittingSize
{
  return (*(void *)&self->_viewControllerFlags >> 42) & 1;
}

uint64_t __47__UIViewController__setPresentationController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setAppearanceIsInvalid:1];
}

+ (id)viewControllerForView:(id)a3
{
  return -[UIView __viewDelegate]((id *)a3);
}

- (id)_appearanceGuideClass
{
  return 0;
}

- (id)_appearanceContainer
{
  BOOL v3 = [(UIViewController *)self _parentModalViewController];
  double v4 = [v3 _presentationController];

  if (v4)
  {
    uint64_t v5 = [(UIViewController *)self _parentModalViewController];
    double v6 = [v5 _presentationController];
  }
  else
  {
    double v6 = [(UIViewController *)self _nonPresentationAppearanceContainer];
  }
  return v6;
}

- (id)_nonPresentationAppearanceContainer
{
  BOOL v3 = [(UIViewController *)self _existingView];
  double v4 = [v3 superview];

  if (dyld_program_sdk_at_least() && !v4)
  {
    double v4 = [(UIViewController *)self _window];
  }
  return v4;
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 0;
}

- (UIPresentationController)activePresentationController
{
  return (UIPresentationController *)[(UIViewController *)self _existingPresentationControllerImmediate:0 effective:1];
}

uint64_t __121__UIViewController___updateContentOverlayInsetsWithOurRect_inBoundsOfAncestorViewController_viaImmediateChildOfAncestor___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  double v33 = 0.0;
  double v34 = 0.0;
  if (!a2)
  {
    uint64_t v13 = *(void *)(a1 + 40);
    double v14 = *(double *)(v13 + 520);
    double v34 = v14;
    double v15 = *(double *)(v13 + 528);
LABEL_12:
    double v33 = v15;
    return objc_msgSend(*(id *)(a1 + 40), "_setContentOverlayInsets:andLeftMargin:rightMargin:", a3, a4, a5, a6, v14, v15, *(void *)&v33, *(void *)&v34);
  }
  if (!*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 56) _leftContentMargin];
    double v17 = v16;
    [*(id *)(a1 + 56) _rightContentMargin];
    double v19 = v18;
    int v20 = *(unsigned __int8 *)(a1 + 128);
    double v21 = fmax(v17, 0.0) - CGRectGetMinX(*(CGRect *)(a1 + 64));
    double v22 = fmax(v19, 0.0);
    if (v20)
    {
      double v14 = fmax(fmin(v21, v17), 0.0);
      double v34 = v14;
      double v23 = v22 - CGRectGetMaxX(*(CGRect *)(a1 + 96));
      double v24 = fmin(v23 + CGRectGetMaxX(*(CGRect *)(a1 + 64)), v19);
    }
    else
    {
      double v14 = fmax(v21, 0.0);
      double v34 = v14;
      double v31 = v22 - CGRectGetMaxX(*(CGRect *)(a1 + 96));
      double v24 = v31 + CGRectGetMaxX(*(CGRect *)(a1 + 64));
    }
    double v15 = fmax(v24, 0.0);
    goto LABEL_12;
  }
  id v11 = [*(id *)(a1 + 40) _existingPresentationControllerImmediate:0 effective:1];
  id v12 = v11;
  if (v11)
  {
    [v11 _baseContentInsetsWithLeftMargin:&v34 rightMargin:&v33];
  }
  else
  {
    uint64_t v25 = *(void *)(a1 + 48);
    double v26 = [*(id *)(a1 + 40) _window];
    +[UIPresentationController _statusBarOverlapAndMarginInfoForView:v25 inWindow:v26];
    double v28 = v27;
    double v30 = v29;

    double v33 = v30;
    double v34 = v28;
  }

  double v15 = v33;
  double v14 = v34;
  return objc_msgSend(*(id *)(a1 + 40), "_setContentOverlayInsets:andLeftMargin:rightMargin:", a3, a4, a5, a6, v14, v15, *(void *)&v33, *(void *)&v34);
}

- (double)_rightContentMargin
{
  return self->_rightContentMargin;
}

- (double)_leftContentMargin
{
  return self->_leftContentMargin;
}

- (NSDictionary)_previousFittingSizeInfo
{
  return (NSDictionary *)objc_getAssociatedObject(self, &_UIViewControllerFittingSizeInfo);
}

- (id)_parentContentContainer
{
  BOOL v3 = [(UIViewController *)self _parentModalViewController];
  double v4 = [v3 _presentationController];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(UIViewController *)self parentViewController];
  }
  double v7 = v6;

  return v7;
}

- (_UIFocusPlatformBehavior)_focusBehavior
{
  __int16 v2 = [(UIViewController *)self _focusSystem];
  BOOL v3 = [v2 behavior];

  return (_UIFocusPlatformBehavior *)v3;
}

- (BOOL)_isHostedRootViewController
{
  return 0;
}

- (id)nextResponder
{
  int v3 = _UIResponderCrossSceneResponderChainEnabled();
  double v4 = [(UIResponder *)self _nextResponderOverride];
  uint64_t v5 = v4;
  if (v3)
  {
    if (!v4)
    {
      id v6 = [(UIViewController *)self _existingView];
      double v7 = [(UIViewController *)self _window];
      uint64_t v8 = v7;
      if (self->_nextResponderIgnoresWindowIfRootVC
        || ([v7 rootViewController],
            uint64_t v9 = (UIViewController *)objc_claimAutoreleasedReturnValue(),
            v9,
            v9 != self))
      {
        long long v10 = [(UIViewController *)self parentModalViewController];
        if (v10 && ![(UIViewController *)self isBeingDismissed])
        {
          id v12 = v10;
        }
        else
        {
          id v11 = [v6 _window];

          if (v11) {
            [v6 superview];
          }
          else {
          id v12 = [(UIViewController *)self parentViewController];
          }
        }
        uint64_t v13 = v12;

        goto LABEL_53;
      }
      double v33 = v8;
LABEL_51:
      uint64_t v13 = v33;
      goto LABEL_53;
    }
LABEL_11:
    uint64_t v13 = v4;
    goto LABEL_54;
  }
  if (v4) {
    goto LABEL_11;
  }
  parentModalViewController = self->_parentModalViewController;
  id v15 = [(UIViewController *)self childModalViewController];
  if (v15)
  {
    double v16 = [(UIViewController *)self _popoverController];
    if (dyld_program_sdk_at_least())
    {
      BOOL v17 = 1;
    }
    else
    {
      double v18 = [v16 contentViewController];
      BOOL v17 = v18 != self;
    }
  }
  else
  {
    BOOL v17 = 0;
  }
  if (parentModalViewController) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = !v17;
  }
  if (v19)
  {
    uint64_t v8 = 0;
    id v6 = 0;
LABEL_27:
    if (v17)
    {
      double v22 = [v15 _existingView];
      double v23 = v22;
      if (!v8 || ([v22 isDescendantOfView:v6] & 1) == 0)
      {
        double v24 = self;
        uint64_t v25 = [(UIViewController *)v24 childModalViewController];
        double v40 = v23;
        if (v25)
        {
          double v26 = (void *)v25;
          double v27 = 0;
          double v28 = 0;
          double v29 = v24;
          do
          {
            double v30 = [v26 _existingView];
            double v31 = [v30 window];

            if (v31)
            {
              double v32 = v26;

              double v28 = v32;
            }
            double v24 = v26;

            double v26 = [(UIViewController *)v24 childModalViewController];

            double v27 = v31;
            double v29 = v24;
          }
          while (v26);
        }
        else
        {
          double v28 = 0;
          double v31 = 0;
        }
        if (v28) {
          double v34 = v28;
        }
        else {
          double v34 = v24;
        }
        double v35 = v34;

        double v36 = [(UIViewController *)v35 _existingView];
        double v37 = [v36 window];

        if (v37)
        {
          uint64_t v38 = [(UIViewController *)v35 view];
          uint64_t v13 = [v38 superview];

          goto LABEL_53;
        }

        double v23 = v40;
      }
    }
    if (![(UIViewController *)self isViewLoaded])
    {
      uint64_t v13 = 0;
      goto LABEL_53;
    }
    double v33 = [(UIView *)self->_view superview];
    goto LABEL_51;
  }
  id v6 = [(UIViewController *)self _existingView];
  uint64_t v8 = [v6 window];
  if (!parentModalViewController) {
    goto LABEL_27;
  }
  int v20 = [(UIViewController *)parentModalViewController _existingView];
  double v21 = [v20 window];
  if (v21 && ([v6 isDescendantOfView:v20] & 1) != 0)
  {

    goto LABEL_27;
  }
  uint64_t v13 = parentModalViewController;

LABEL_53:
LABEL_54:

  return v13;
}

- (BOOL)_containsFirstResponder
{
  if ([(UIResponder *)self isFirstResponder]
    || [(UIView *)self->_view _isAncestorOfFirstResponder])
  {
    return 1;
  }
  double v4 = [(UINavigationItem *)self->_navigationItem titleView];
  char v5 = [v4 _isAncestorOfFirstResponder];

  return v5;
}

- (void)_traitCollectionDidChange:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(UIViewController *)self traitCollection];
  uint64_t v43 = 0;
  memset(v42, 0, sizeof(v42));
  if (v4)
  {
    [(UITraitCollection *)(uint64_t)v4 _createTraitTokenSetForChangesFromTraitCollection:(uint64_t)v42];
  }
  else
  {
    id v6 = +[UITraitCollection _emptyTraitCollection]();
    [(UITraitCollection *)(uint64_t)v6 _createTraitTokenSetForChangesFromTraitCollection:(uint64_t)v42];
  }
  if ((*(void *)&self->_viewControllerFlags & 0x2000000000000000) != 0
    && _UIShouldApplyTraitStorageRecordsForTraitChanges((uint64_t)v42))
  {
    [self _applyTraitStorageRecordsForTraitCollection:v5];
  }
  if ([v4 verticalSizeClass] == 1 && objc_msgSend(v5, "verticalSizeClass") == 2)
  {
    double v7 = [(UIViewController *)self _window];
    uint64_t v8 = [v7 rootViewController];

    if (v8 == self) {
      goto LABEL_26;
    }
    uint64_t v9 = [(UIViewController *)v8 _effectiveStatusBarHiddenViewController];
    if (v9 == self)
    {
      long long v10 = [(UIViewController *)v8 traitCollection];
      uint64_t v11 = [v10 verticalSizeClass];

      if (v11 != 2) {
        goto LABEL_26;
      }
      id v12 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v13 = self;
      while (1)
      {
        id v41 = 0;
        -[UIViewController _getViewControllerToInheritInsetsFrom:viaImmediateChild:]((id *)&v13->super.super.isa, &v41, 0);
        double v14 = (UIViewController *)v41;

        if (!v14) {
          break;
        }
        [v12 addObject:v14];

        uint64_t v13 = v14;
        if (v14 == v8)
        {
          double v14 = v8;
          break;
        }
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v9 = v12;
      uint64_t v17 = [(UIViewController *)v9 countByEnumeratingWithState:&v37 objects:v49 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v38;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(v9);
            }
            objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v20++), "_updateContentOverlayInsetsFromParentIfNecessary", (void)v37);
          }
          while (v18 != v20);
          uint64_t v18 = [(UIViewController *)v9 countByEnumeratingWithState:&v37 objects:v49 count:16];
        }
        while (v18);
      }
    }
LABEL_26:

    id v21 = v4;
    id v22 = v5;
    if (!self) {
      goto LABEL_36;
    }
    goto LABEL_27;
  }
  id v15 = v4;
  id v16 = v5;
LABEL_27:
  uint64_t v23 = objc_msgSend(v5, "userInterfaceStyle", (void)v37);
  if (v23 != [v4 userInterfaceStyle]
    && [(UIViewController *)self preferredStatusBarStyle] == UIStatusBarStyleDefault)
  {
    double v24 = [(UIView *)self->_view window];
    uint64_t v25 = [v24 rootViewController];
    double v26 = [v25 _effectiveStatusBarStyleViewController];

    if (v26 == self) {
      goto LABEL_33;
    }
  }
  uint64_t v27 = [v5 verticalSizeClass];
  if (v27 != [v4 verticalSizeClass])
  {
    if ([(id)UIApp _wantsCompactStatusBarHiding])
    {
      double v28 = [(UIView *)self->_view window];
      double v29 = [v28 rootViewController];
      double v30 = [v29 _effectiveStatusBarHiddenViewController];

      if (v30 == self)
      {
LABEL_33:
        if (pthread_main_np() == 1)
        {
          [(UIViewController *)self setNeedsStatusBarAppearanceUpdate];
        }
        else
        {
          *(void *)block = MEMORY[0x1E4F143A8];
          *(void *)&block[8] = 3221225472;
          *(void *)&block[16] = __105__UIViewController__invalidateStatusBarAppearanceIfNeededForChangeFromTraitCollection_toTraitCollection___block_invoke;
          CGFloat v45 = &unk_1E52D9F70;
          *(void *)long long v46 = self;
          dispatch_async(MEMORY[0x1E4F14428], block);
        }
      }
    }
  }
LABEL_36:

  if ((!_UITraitUsageTrackingEnabled() || (dyld_program_sdk_at_least() & 1) == 0)
    && -[UIViewController _needsAutomaticContentUnavailableConfigurationUpdates]((uint64_t)self))
  {
    [(UIViewController *)self setNeedsUpdateContentUnavailableConfiguration];
  }
  if (v4) {
    -[_UITraitChangeRegistry traitsDidChange:forTraitEnvironment:withPreviousTraitCollection:]((uint64_t)self->_traitChangeRegistry, (uint64_t *)v42, self, v4);
  }
  if (*(void *)&v42[0]) {

  }
  double v31 = self;
  BOOL v32 = _UIShouldLogTraitCollectionChangeForInstanceAndMethod(v31, (uint64_t)self, (uint64_t)sel_traitCollectionDidChange_);

  if (v32)
  {
    double v33 = *(NSObject **)(__UILogGetCategoryCachedImpl("TraitCollectionChange", &_traitCollectionDidChange____s_category)
                       + 8);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      double v34 = v33;
      double v35 = NSStringFromSelector(sel_traitCollectionDidChange_);
      double v36 = +[UITraitCollection _descriptionForChangeFromTraitCollection:v4 toTraitCollection:v5];
      *(_DWORD *)block = 138413314;
      *(void *)&block[4] = v35;
      *(_WORD *)&block[12] = 2112;
      *(void *)&block[14] = self;
      *(_WORD *)&block[22] = 2112;
      CGFloat v45 = v36;
      *(_WORD *)long long v46 = 2112;
      *(void *)&v46[2] = v4;
      __int16 v47 = 2112;
      long long v48 = v5;
      _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "Sending -%@ to %@\n\t► trait changes: %@\n\t► previous: %@\n\t► current: %@", block, 0x34u);
    }
  }
  -[UIViewController traitCollectionDidChange:](self, "traitCollectionDidChange:", v4, (void)v37);
}

- (void)loadView
{
  uint64_t v3 = [(UIViewController *)self nibName];
  if (v3
    && (id v4 = (void *)v3,
        [(UIViewController *)self nibBundle],
        char v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = [(UIViewController *)self nibName];
    double v7 = [(UIViewController *)self nibBundle];
    uint64_t v27 = v6;
    id v8 = v7;
    if (self)
    {
      uint64_t v9 = [(UIViewController *)self storyboard];
      if (v9
        && (long long v10 = (void *)v9,
            [(UIViewController *)self storyboard],
            uint64_t v11 = objc_claimAutoreleasedReturnValue(),
            int v12 = [v11 containsNibNamed:v27],
            v11,
            v10,
            v12))
      {
        uint64_t v13 = [(UIViewController *)self storyboard];
        double v14 = (UINib *)[v13 nibForStoryboardNibNamed:v27];
      }
      else
      {
        double v14 = [[UINib alloc] initWithNibName:v27 directory:0 bundle:v8];
      }
      externalObjectsTableForViewLoading = self->_externalObjectsTableForViewLoading;
      if (externalObjectsTableForViewLoading)
      {
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:externalObjectsTableForViewLoading forKey:@"UINibExternalObjects"];
      }
      else
      {
        uint64_t v17 = 0;
      }
      uint64_t v18 = [(UINib *)v14 instantiateWithOwner:self options:v17];
      if (!self->_view)
      {
        uint64_t v19 = NSString;
        self;
        uint64_t v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
        id v21 = NSStringFromClass(v20);
        id v22 = NSStringFromSelector(sel__loadViewFromNibNamed_bundle_);
        uint64_t v23 = [v19 stringWithFormat:@"-[%@ %@]", v21, v22];

        uint64_t v24 = [v18 count];
        if (v24) {
          uint64_t v25 = @"%@ loaded the \"%@\" nib but the view outlet was not set.";
        }
        else {
          uint64_t v25 = @"%@ was unable to load a nib named \"%@\"";
        }
        double v26 = (void *)MEMORY[0x1E4F1C3C8];
        if (v24) {
          double v26 = (void *)MEMORY[0x1E4F1C3B8];
        }
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v26, v25, v23, v27);
      }
      -[UIViewController autoresizeArchivedView](self);
    }
  }
  else
  {
    id v15 = [UIView alloc];
    [(UIViewController *)self _defaultInitialViewFrame];
    uint64_t v27 = -[UIView initWithFrame:](v15, "initWithFrame:");
    [(UIView *)v27 setAutoresizingMask:18];
    [(UIViewController *)self setView:v27];
  }
}

- (void)setView:(UIView *)view
{
  char v5 = view;
  p_view = &self->_view;
  if (self->_view != v5)
  {
    double v54 = v5;
    BOOL v7 = [(UIView *)v5 _cachedTraitCollectionIsValid];
    -[UIView __viewDelegate]((id *)&(*p_view)->super.super.isa);
    id v8 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (*p_view)
    {
      uint64_t v9 = (*p_view)->_viewDelegate;

      if (v9 == self) {
        -[UIView __setViewDelegate:](*p_view, 0);
      }
      *(void *)&(*p_view)->_viewFlags &= ~0x80000000uLL;
      modalPreservedFirstResponder = self->_modalPreservedFirstResponder;
      self->_modalPreservedFirstResponder = 0;

      uint64_t v11 = (id *)*p_view;
    }
    else
    {
      uint64_t v11 = 0;
    }
    int v12 = [v11 superview];
    if (v12 && (!v54 || ![(UIView *)*p_view isDescendantOfView:v54]))
    {
      if (v8 == self) {
        [(UIView *)*p_view removeFromSuperview];
      }
      if (v54)
      {
        [(UIView *)*p_view frame];
        -[UIView setFrame:](v54, "setFrame:");
        [v12 addSubview:v54];
      }
    }
    uint64_t v13 = *p_view;
    objc_storeStrong((id *)&self->_view, view);
    [(UIView *)*p_view _setViewDelegateContentOverlayInsetsAreClean:0];
    if (*p_view)
    {
      [(id)objc_opt_class() setViewController:self forView:*p_view];
      *(void *)&(*p_view)->_viewFlags |= 0x80000000uLL;
    }
    if (v7 && (dyld_program_sdk_at_least() & 1) == 0)
    {
      if (!*p_view) {
        goto LABEL_29;
      }
      _UIViewInvalidateTraitCollectionAndSchedulePropagation((uint64_t)*p_view, 1);
    }
    double v14 = (id *)*p_view;
    if (self->_viewHostsLayoutEngine)
    {
      if (!v14) {
        goto LABEL_29;
      }
      int v15 = [v14 translatesAutoresizingMaskIntoConstraints];
      double v14 = (id *)*p_view;
      if (v15)
      {
        [v14 _setHostsLayoutEngine:1];
        double v14 = (id *)*p_view;
      }
    }
    if (v14)
    {
      uint64_t v16 = [(UIViewController *)self _embeddingView];
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        uint64_t v18 = [(UIViewController *)self _embeddingView];

        if (v18 != v54)
        {
          uint64_t v19 = [(UIViewController *)self _embeddingView];
          [(UIViewController *)self _embeddedViewFrame];
          double v21 = v20;
          double v23 = v22;
          double v25 = v24;
          double v27 = v26;
          double v28 = [(UIViewController *)self _embeddedDelegate];
          -[UIViewController _embedContentViewInView:withContentFrame:delegate:](self, "_embedContentViewInView:withContentFrame:delegate:", v19, v28, v21, v23, v25, v27);

          goto LABEL_31;
        }
      }
      if (*p_view) {
        goto LABEL_31;
      }
    }
LABEL_29:
    double v29 = [(UIViewController *)self _embeddedView];

    if (v29)
    {
      [(UIViewController *)self _setEmbeddedView:0];
      [(UIViewController *)self _setEmbeddedDelegate:0];
    }
LABEL_31:
    -[UIViewController _inferLayoutGuidesFromSubviews]((uint64_t)self);
    if (!self->_topBarInsetGuideConstraint && !self->_bottomBarInsetGuideConstraint)
    {
LABEL_53:
      if (self->_contentUnavailableWrapperView) {
        [(UIViewController *)self setNeedsUpdateContentUnavailableConfiguration];
      }
      [(UIView *)v13 _updateInferredLayoutMargins];
      [(UIView *)*p_view _updateInferredLayoutMargins];
      if (!dyld_program_sdk_at_least()) {
        goto LABEL_61;
      }
      int v43 = _UIViewSetLayerNameDescriptionEnabled();
      CGFloat v44 = [(UIView *)*p_view layer];
      CGFloat v45 = v44;
      if (v43)
      {
        long long v46 = [(UIView *)*p_view layer];
        __int16 v47 = [v46 name];
        long long v48 = (objc_class *)objc_opt_class();
        double v49 = NSStringFromClass(v48);
        uint64_t v50 = [v47 stringByAppendingFormat:@", VC:%@", v49];
        [v45 setName:v50];
      }
      else
      {
        float64x2_t v51 = [v44 name];

        if (v51)
        {
LABEL_61:
          [(UIViewController *)self _setSecurityModeForViewsLayer];

          char v5 = v54;
          goto LABEL_62;
        }
        CGFloat v45 = [(UIView *)*p_view layer];
        uint64_t v52 = NSString;
        CGFloat v53 = (objc_class *)objc_opt_class();
        long long v46 = NSStringFromClass(v53);
        __int16 v47 = [v52 stringWithFormat:@"VC:%@", v46];
        [v45 setName:v47];
      }

      goto LABEL_61;
    }
    double v30 = [(UIViewController *)self _embeddedView];
    double v31 = v30;
    if (!v30) {
      double v31 = (id *)*p_view;
    }
    BOOL v32 = v31;

    topBarInsetGuideConstraint = self->_topBarInsetGuideConstraint;
    if (topBarInsetGuideConstraint)
    {
      double v34 = [(NSLayoutConstraint *)self->_topBarInsetGuideConstraint container];
      if (v34 != v32)
      {

LABEL_44:
        if (self->_topBarInsetGuideConstraint || self->_bottomBarInsetGuideConstraint)
        {
          int v37 = -[UIViewController _useViewBasedTopAndBottomLayoutGuides]((uint64_t)self);
          topLayoutGuide = self->_topLayoutGuide;
          if (v37)
          {
            [(UILayoutSupport *)topLayoutGuide removeFromSuperview];
            [(UILayoutSupport *)self->_bottomLayoutGuide removeFromSuperview];
          }
          else
          {
            _removeLayoutGuide(topLayoutGuide);
            _removeLayoutGuide(self->_bottomLayoutGuide);
          }
          long long v39 = self->_topLayoutGuide;
          self->_topLayoutGuide = 0;

          bottomLayoutGuide = self->_bottomLayoutGuide;
          self->_bottomLayoutGuide = 0;

          id v41 = self->_topBarInsetGuideConstraint;
          self->_topBarInsetGuideConstraint = 0;

          bottomBarInsetGuideConstraint = self->_bottomBarInsetGuideConstraint;
          self->_bottomBarInsetGuideConstraint = 0;

          if (dyld_program_sdk_at_least()) {
            *(void *)&self->_viewControllerFlags &= 0xFFFFCFFFFFFFFFFFLL;
          }
        }
        goto LABEL_52;
      }
      double v35 = self->_bottomBarInsetGuideConstraint;
      if (v35)
      {
LABEL_41:
        double v36 = [(NSLayoutConstraint *)v35 container];

        if (topBarInsetGuideConstraint) {
        if (v36 == v32)
        }
          goto LABEL_52;
        goto LABEL_44;
      }
    }
    else
    {
      double v35 = self->_bottomBarInsetGuideConstraint;
      if (v35) {
        goto LABEL_41;
      }
    }
LABEL_52:

    goto LABEL_53;
  }
LABEL_62:
}

- (UIView)_embeddingView
{
  return self->__embeddingView;
}

+ (void)setViewController:(id)a3 forView:(id)a4
{
}

- (void)_setSecurityModeForViewsLayer
{
  id v5 = [(UIView *)self->_view layer];
  if ([(id)UIApp _supportedOnLockScreen])
  {
    BOOL v3 = [(UIViewController *)self _canShowWhileLocked];
    id v4 = (void *)MEMORY[0x1E4F3A440];
    if (!v3) {
      id v4 = (void *)MEMORY[0x1E4F3A438];
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F3A438];
  }
  [v5 setSecurityMode:*v4];
}

- (CGRect)_defaultInitialViewFrame
{
  __int16 v2 = [(UIViewController *)self _window];
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    uint64_t v11 = [v2 _windowHostingScene];
    if ((v11
       || ([(id)UIApp _defaultUISceneOrMainScreenPlaceholderIfExists],
           (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
      && [v11 _hostsWindows])
    {
      int v12 = [v11 _coordinateSpace];
      [v12 bounds];
      if (v2) {
        uint64_t v13 = v2;
      }
      else {
        uint64_t v13 = v12;
      }
      objc_msgSend(v12, "convertRect:toCoordinateSpace:", v13);
    }
    else
    {
      if (v2) {
        [v2 screen];
      }
      else {
      int v12 = +[UIScreen mainScreen];
      }
      [v12 bounds];
    }
    double v4 = v14;
    double v6 = v15;
    double v8 = v16;
    double v10 = v17;

    goto LABEL_17;
  }
  if (!v2)
  {
    uint64_t v11 = +[UIScreen mainScreen];
    [v11 bounds];
    double v4 = v18;
    double v6 = v19;
    double v8 = v20;
    double v10 = v21;
LABEL_17:

    goto LABEL_18;
  }
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
LABEL_18:

  double v22 = v4;
  double v23 = v6;
  double v24 = v8;
  double v25 = v10;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (NSString)nibName
{
  if (!self->_nibName)
  {
    uint64_t v3 = objc_opt_class();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = objc_opt_class();
    }
    if (([(id)objc_opt_class() doesOverrideViewControllerMethod:sel_loadView inBaseClass:v3] & 1) == 0)
    {
      double v4 = (objc_class *)objc_opt_class();
      double v5 = NSStringFromClass(v4);
      double v6 = [(UIViewController *)self nibBundle];
      id v7 = v5;
      id v8 = v6;
      self;
      if ([v7 hasPrefix:@"UI"])
      {
        id v9 = 0;
LABEL_16:

        [(UIViewController *)self setNibName:v9];
        goto LABEL_17;
      }
      double v10 = [v8 pathForResource:v7 ofType:@"nib"];

      if (v10)
      {
        id v9 = v7;
        goto LABEL_16;
      }
      uint64_t v11 = _UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_2(v7);
      if (v11
        && ([v8 pathForResource:v11 ofType:@"nib"],
            int v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            v12))
      {
        id v9 = v11;
      }
      else
      {
        uint64_t v13 = [v7 rangeOfString:@"." options:4];
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v14 = v13;
          if (v13 != [v7 length] - 1)
          {
            double v17 = [v7 substringFromIndex:v14 + 1];
            double v18 = [v8 pathForResource:v17 ofType:@"nib"];

            if (v18)
            {
              id v9 = v17;
              goto LABEL_15;
            }
            _UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_2(v17);
            id v9 = (id)objc_claimAutoreleasedReturnValue();
            double v19 = [v8 pathForResource:v9 ofType:@"nib"];

            if (v19)
            {

              goto LABEL_15;
            }
          }
        }
        id v9 = 0;
      }
LABEL_15:

      goto LABEL_16;
    }
  }
LABEL_17:
  nibName = self->_nibName;
  return nibName;
}

- (NSBundle)nibBundle
{
  nibBundle = self->_nibBundle;
  if (!nibBundle)
  {
    double v4 = [MEMORY[0x1E4F28B50] mainBundle];
    [(UIViewController *)self setNibBundle:v4];

    nibBundle = self->_nibBundle;
  }
  return nibBundle;
}

- (void)setNibName:(id)a3
{
}

- (void)setNibBundle:(id)a3
{
}

- (UIStoryboard)storyboard
{
  return self->_storyboard;
}

- (id)registerForTraitChanges:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  id v8 = [(UIViewController *)self _registerForTraitTokenChanges:v7 withHandler:v6];

  return v8;
}

- (id)_registerForTraitTokenChanges:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  traitChangeRegistry = self->_traitChangeRegistry;
  if (!traitChangeRegistry)
  {
    id v9 = objc_alloc_init(_UITraitChangeRegistry);
    double v10 = self->_traitChangeRegistry;
    self->_traitChangeRegistry = v9;

    traitChangeRegistry = self->_traitChangeRegistry;
  }
  uint64_t v11 = -[_UITraitChangeRegistry registerForTraitTokenChanges:withHandler:]((uint64_t)traitChangeRegistry, v6, v7);

  return v11;
}

- (UIRectEdge)edgesForExtendedLayout
{
  return self->_edgesForExtendedLayout;
}

- (BOOL)extendedLayoutIncludesOpaqueBars
{
  if ([(UIViewController *)self _ancestorViewControllerIsInPopover]) {
    LOBYTE(v3) = 0;
  }
  else {
    return (*(void *)&self->_viewControllerFlags >> 37) & 1;
  }
  return v3;
}

- (BOOL)_ancestorViewControllerIsInPopover
{
  __int16 v2 = [(UIViewController *)self _rootAncestorViewController];
  BOOL v3 = [v2 _popoverController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (UISplitViewController)splitViewController
{
  BOOL v3 = [(UIViewController *)self _popoverController];
  BOOL v4 = v3;
  if (v3)
  {
    double v5 = [v3 _splitParentController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  uint64_t v6 = objc_opt_class();
  double v5 = -[UIViewController _ancestorViewControllerOfClass:allowModalParent:]((uint64_t)self, v6, 0);
LABEL_5:

  return (UISplitViewController *)v5;
}

- (id)_popoverController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popoverController);
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    goto LABEL_7;
  }
  uint64_t v6 = self->_parentViewController;
  if (v6)
  {
    id v7 = v6;
    goto LABEL_5;
  }
  id v9 = self->_parentModalViewController;
  if (v9)
  {
    id v7 = v9;
    if ([(UIViewController *)self modalPresentationStyle] != UIModalPresentationCurrentContext
      && [(UIViewController *)self modalPresentationStyle] != UIModalPresentationOverCurrentContext
      && [(UIViewController *)self modalPresentationStyle] != 18)
    {
      id v5 = 0;
      goto LABEL_6;
    }
LABEL_5:
    id v5 = [(UIViewController *)v7 _popoverController];
LABEL_6:

    goto LABEL_7;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (id)_rootAncestorViewController
{
  return -[UIViewController _rootAncestorViewControllerInWindow:](self, 0);
}

- (void)_setNavigationControllerContentInsetAdjustment:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v24 = [(UIViewController *)self _contentOrObservableScrollViewForEdge:1];
  id v8 = [(UIViewController *)self navigationInsetAdjustment];
  [v8 insetAdjustment];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  BOOL v19 = v12 == left && v10 == top && v16 == right && v14 == bottom;
  if (!v19 && [v24 _compatibleContentInsetAdjustmentBehavior] == 101)
  {
    double v20 = [(UIViewController *)self navigationInsetAdjustment];
    objc_msgSend(v20, "setInsetAdjustment:", top, left, bottom, right);

    double v21 = [v24 _viewControllerForAncestor];
    double v22 = v21;
    if (!v21 || v21 == self)
    {
      if (v24)
      {
        _UIScrollViewAdjustForOverlayInsetsChangeIfNecessary(v24, 1, top, left, bottom, right, v10, v12, v14, v16);
        double v23 = [(UIViewController *)self navigationInsetAdjustment];
        [v23 setAdjustedScrollView:v24];
      }
    }
    else
    {
      -[UIViewController _setNavigationControllerContentInsetAdjustment:](v21, "_setNavigationControllerContentInsetAdjustment:", top, left, bottom, right);
    }
  }
}

- (UIEdgeInsets)_navigationControllerContentInsetAdjustment
{
  __int16 v2 = [(UIViewController *)self navigationInsetAdjustment];
  [v2 insetAdjustment];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.double right = v14;
  result.double bottom = v13;
  result.double left = v12;
  result.double top = v11;
  return result;
}

- (UINavigationContentAdjustments)navigationInsetAdjustment
{
  navigationInsetAdjustment = self->_navigationInsetAdjustment;
  if (!navigationInsetAdjustment)
  {
    double v4 = objc_alloc_init(UINavigationContentAdjustments);
    double v5 = self->_navigationInsetAdjustment;
    self->_navigationInsetAdjustment = v4;

    navigationInsetAdjustment = self->_navigationInsetAdjustment;
  }
  return navigationInsetAdjustment;
}

+ (double)_horizontalContentMarginForView:(id)a3 ofWidth:(double)a4
{
  id v6 = a3;
  double v7 = [v6 _viewControllerForAncestor];
  [v7 _canvasSystemMinimumMargin];
  if (v8 == 0.0)
  {
    double v9 = [v7 _window];
    [v9 safeAreaInsets];
    BOOL v11 = v10 > 0.0;
    if (v12 <= 0.0) {
      BOOL v11 = 0;
    }
    if (v9) {
      BOOL v13 = v11;
    }
    else {
      BOOL v13 = 0;
    }
    if (_UIScreenReferenceBoundsSizeForType(0x1BuLL) >= a4 || (double v14 = 20.0, v13))
    {
      double v15 = [v6 traitCollection];
      [a1 _slimHorizontalContentMarginForTraitCollection:v15];
      double v14 = v16;
    }
  }
  else
  {
    double v14 = v8;
  }

  return v14;
}

- (double)_canvasSystemMinimumMargin
{
  __int16 v2 = [(UIViewController *)self _window];
  double v3 = [v2 _windowHostingScene];
  [v3 _systemMinimumMargin];
  double v5 = v4;

  return v5;
}

- (void)_updateSystemAppearanceWithRecursionBlock:(void *)a3 action:
{
  double v12 = a2;
  double v5 = a3;
  if (a1)
  {
    id v6 = *(id *)(a1 + 120);
    if (v6)
    {
      double v7 = (void (*)(void))v12[2];
    }
    else
    {
      if (!*(void *)(a1 + 104))
      {
        double v8 = [(id)a1 _window];
        double v9 = [v8 _windowHostingScene];

        double v10 = +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:v9];
        BOOL v11 = [v10 rootViewController];

        if (v11 == (void *)a1) {
          v5[2](v5, v9);
        }

        goto LABEL_7;
      }
      double v7 = (void (*)(void))v12[2];
    }
    v7();
LABEL_7:
  }
}

uint64_t __53__UIViewController_setNeedsStatusBarAppearanceUpdate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setNeedsStatusBarAppearanceUpdate];
}

uint64_t __70__UIViewController_setNeedsUpdateOfScreenEdgesDeferringSystemGestures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
}

uint64_t __59__UIViewController_setNeedsUpdateOfHomeIndicatorAutoHidden__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setNeedsUpdateOfHomeIndicatorAutoHidden];
}

uint64_t __59__UIViewController_setNeedsWhitePointAdaptivityStyleUpdate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setNeedsWhitePointAdaptivityStyleUpdate];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v5 = a4;
  id v7 = a3;
  double v8 = v7;
  BOOL v9 = v7 == 0;
  *(void *)&self->_unint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFBFFFFFFFFFFFFFLL | ((unint64_t)(v7 != 0) << 54);
  if (!v7)
  {
    double v17 = [(UIViewController *)self _existingView];
    [v17 frame];
    self->_lastForwardedTransitionSize.width = v18;
    self->_lastForwardedTransitionSize.height = v19;

    if (!v5) {
      goto LABEL_68;
    }
LABEL_20:
    if ([(UIViewController *)self isPerformingModalTransition]) {
      goto LABEL_68;
    }
    double v20 = [(UIViewController *)self->_parentModalViewController presentedViewController];
    if (v20 == self)
    {

      goto LABEL_68;
    }
    double v21 = v20;
    double v22 = [(UIViewController *)self parentViewController];
    if (v22)
    {
      if (v8
        || ([(UIViewController *)self parentViewController],
            double v67 = objc_claimAutoreleasedReturnValue(),
            [v67 _appearState] != 2))
      {
        double v25 = [(UIViewController *)self parentViewController];
        double v4 = v25;
        if (v25
          && [v25 isSettingAppearState]
          && ([v4 containmentSupport] & 1) != 0)
        {
          int v26 = 0;
          goto LABEL_43;
        }
        int v23 = 1;
      }
      else
      {
        int v23 = 0;
        BOOL v9 = 1;
      }
    }
    else
    {
      BOOL v9 = 0;
      int v23 = 0;
    }
    double v27 = [(UIViewController *)self _popoverController];
    if (([v27 _manuallyHandlesContentViewControllerAppearanceCalls] & 1) != 0
      || (*(void *)&self->_viewControllerFlags & 0x8000000) != 0)
    {

      int v26 = 0;
      if (!v23)
      {
LABEL_38:
        if (v9) {

        }
        if ((v26 & 1) == 0) {
          goto LABEL_68;
        }
        goto LABEL_46;
      }
    }
    else
    {
      int v26 = -[UIViewController _didSelfOrAncestorBeginAppearanceTransition]((uint64_t *)self) ^ 1;

      if ((v23 & 1) == 0) {
        goto LABEL_38;
      }
    }
LABEL_43:

    if (v9) {
    if (!v26)
    }
      goto LABEL_68;
LABEL_46:
    unint64_t viewControllerFlags = (unint64_t)self->_viewControllerFlags;
    uint64_t v29 = viewControllerFlags & 0x400000;
    uint64_t v30 = (viewControllerFlags >> 22) & 1;
    BOOL v31 = +[UIApplication _isCertainCheckpointInAppLaunchReached];
    if (v8)
    {
      if (v31)
      {
        objc_initWeak(location, self);
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __64__UIViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke;
        v75[3] = &unk_1E52E7E68;
        BOOL v32 = &v76;
        objc_copyWeak(&v76, location);
        char v77 = v30;
        [(UIViewController *)self setAfterAppearanceBlock:v75];
        double v33 = _Block_copy(self->_afterAppearance);
        +[UIView _currentAnimationDuration];
        if (v34 <= 0.0)
        {
          [(id)UIApp _addAfterCACommitBlockForViewController:self];
          goto LABEL_66;
        }
        +[UIView _currentAnimationDuration];
        dispatch_time_t v36 = dispatch_time(0, (uint64_t)(v35 * 1000000000.0));
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __64__UIViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke_2;
        block[3] = &unk_1E52DA160;
        block[4] = self;
        id v74 = v33;
        dispatch_after(v36, MEMORY[0x1E4F14428], block);
        int v37 = v74;
LABEL_61:

LABEL_66:
        objc_destroyWeak(v32);
        objc_destroyWeak(location);
        goto LABEL_67;
      }
      [(UIViewController *)self __viewDidAppear:v29 != 0];
    }
    else
    {
      if (v31)
      {
        objc_initWeak(location, self);
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __64__UIViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke_3;
        v70[3] = &unk_1E52E7E68;
        BOOL v32 = &v71;
        objc_copyWeak(&v71, location);
        char v72 = v30;
        [(UIViewController *)self setAfterAppearanceBlock:v70];
        double v33 = _Block_copy(self->_afterAppearance);
        +[UIView _currentAnimationDuration];
        if (v64 <= 0.0)
        {
          [(id)UIApp _addAfterCACommitBlockForViewController:self];
          goto LABEL_66;
        }
        +[UIView _currentAnimationDuration];
        dispatch_time_t v66 = dispatch_time(0, (uint64_t)(v65 * 1000000000.0));
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = __64__UIViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke_4;
        v68[3] = &unk_1E52DA160;
        v68[4] = self;
        id v69 = v33;
        dispatch_after(v66, MEMORY[0x1E4F14428], v68);
        int v37 = v69;
        goto LABEL_61;
      }
      -[UIViewController __viewDidDisappear:]((uint64_t)self, v29 != 0);
    }
LABEL_67:
    *(void *)&self->_viewControllerFlags &= ~0x400000uLL;
    goto LABEL_68;
  }
  double v10 = [v7 screen];
  uint64_t v11 = [v10 _userInterfaceIdiom];

  if (v11 == 3 && ![(UIViewController *)self _isInCustomTransition])
  {
    id v24 = [(UIViewController *)self->_parentModalViewController presentedViewController];
    if (v24 == self)
    {
      long long v38 = +[UIDevice currentDevice];
      uint64_t v39 = [v38 userInterfaceIdiom];

      if ((v39 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        int v40 = [(UIViewController *)self _isModalSheet];
LABEL_53:
        id v41 = objc_opt_class();
        uint64_t v42 = [(UIViewController *)self view];
        int v43 = [v41 _isViewSizeFullScreen:v42 inWindow:v8 ignoreInWindowCheck:1];

        double v4 = [(UIViewController *)self parentViewController];

        if (!v4 && v40 != v43)
        {
          CGFloat v44 = [(UIViewController *)self view];
          [v44 frame];
          double v46 = v45;
          double v48 = v47;
          double v49 = [(UIViewController *)self view];
          double v4 = [v49 superview];
          [v4 bounds];
          double v51 = v50;
          double v53 = v52;

          if (v46 != v51 || v48 != v53)
          {
            double v54 = [(UIViewController *)self view];
            double v55 = [v54 superview];
            [v55 bounds];
            double v57 = v56;
            double v59 = v58;
            double v61 = v60;
            double v63 = v62;
            double v4 = [(UIViewController *)self view];
            objc_msgSend(v4, "setFrame:", v57, v59, v61, v63);
          }
        }
        goto LABEL_4;
      }
    }
    else
    {
    }
    int v40 = 1;
    goto LABEL_53;
  }
LABEL_4:
  if (![(UIViewController *)self _isInCustomTransition])
  {
    [(UIViewController *)self _updateLayoutForStatusBarAndInterfaceOrientation];
    double v12 = [(UIViewController *)self _popoverController];

    BOOL v13 = !_UIAppUseModernRotationAndPresentationBehaviors();
    if (v12) {
      int v14 = 0;
    }
    else {
      int v14 = v13;
    }
    if (!v13 && !v12) {
      int v14 = ![(UIViewController *)self _isInPopoverPresentation];
    }
    int64_t v15 = [(UIViewController *)self _lastKnownInterfaceOrientation];
    if (v14 && (unint64_t)(v15 - 5) <= 0xFFFFFFFFFFFFFFFBLL) {
      -[UIViewController setInterfaceOrientation:](self, "setInterfaceOrientation:", [v8 interfaceOrientation]);
    }
  }
  [(UIViewController *)self setNeedsFocusUpdate];
  view = self->_view;
  if (!view || ![(CALayer *)view->_layer needsLayout]) {
    -[UIViewController __viewIsAppearing:skipWindowCheck:]((uint64_t)self, (*(void *)&self->_viewControllerFlags >> 22) & 1, 1);
  }
  if (v5) {
    goto LABEL_20;
  }
LABEL_68:
}

- (void)_updateLayoutForStatusBarAndInterfaceOrientation
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  double v3 = [(UIViewController *)self _existingView];

  if (!v3) {
    return;
  }
  double v4 = [(UIViewController *)self _window];
  BOOL v5 = [(UIViewController *)self _existingView];
  [v5 frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  if ([v4 _isHostedInAnotherProcess])
  {
    [v4 frame];
  }
  else
  {
    if (![(id)UIApp _appAdoptsUISceneLifecycle])
    {
      double v22 = [(UIViewController *)self _screen];
      int v23 = [v4 windowScene];
      uint64_t v24 = [v23 interfaceOrientation];
      double v25 = __UIStatusBarManagerForWindow(v4);
      [v25 defaultStatusBarHeightInOrientation:1];
      double v27 = v26;

      [v22 _applicationFrameForInterfaceOrientation:v24 usingStatusbarHeight:1 ignoreStatusBar:v27];
      CGFloat v18 = v28;
      CGFloat v19 = v29;
      CGFloat v20 = v30;
      CGFloat v21 = v31;

      goto LABEL_8;
    }
    [v4 _referenceFrameFromSceneUsingScreenBounds:1];
  }
  CGFloat v18 = v14;
  CGFloat v19 = v15;
  CGFloat v20 = v16;
  CGFloat v21 = v17;
LABEL_8:
  if ([(id)objc_opt_class() _directlySetsContentOverlayInsetsForChildren])
  {
    BOOL v32 = [(UIViewController *)self _viewControllerUnderlapsStatusBar];
    double v33 = 0.0;
    if (v32) {
      [(UIViewController *)self _statusBarHeightAdjustmentForCurrentOrientation];
    }
    -[UIViewController _setContentOverlayInsets:andLeftMargin:rightMargin:](self, "_setContentOverlayInsets:andLeftMargin:rightMargin:", v33, 0.0, 0.0, 0.0, -1.79769313e308, -1.79769313e308);
  }
  else
  {
    [(UIViewController *)self _updateContentOverlayInsetsForSelfAndChildren];
  }
  v59.origin.x = v7;
  v59.origin.y = v9;
  v59.size.width = v11;
  v59.size.height = v13;
  v62.origin.x = v18;
  v62.origin.y = v19;
  v62.size.width = v20;
  v62.size.height = v21;
  if (CGRectEqualToRect(v59, v62)) {
    goto LABEL_15;
  }
  double v34 = [(UIViewController *)self _screen];
  [v34 bounds];
  v63.origin.x = v35;
  v63.origin.y = v36;
  v63.size.width = v37;
  v63.size.height = v38;
  v60.origin.x = v7;
  v60.origin.y = v9;
  v60.size.width = v11;
  v60.size.height = v13;
  BOOL v39 = CGRectEqualToRect(v60, v63);

  if (v39)
  {
LABEL_15:
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    int v40 = [(UIViewController *)self mutableChildViewControllers];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v54 != v43) {
            objc_enumerationMutation(v40);
          }
          double v45 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          double v46 = [v45 _existingView];

          if (v46)
          {
            if (dyld_program_sdk_at_least()) {
              goto LABEL_23;
            }
            double v47 = [v45 _existingView];
            [v47 frame];
            v64.origin.x = v48;
            v64.origin.y = v49;
            v64.size.width = v50;
            v64.size.height = v51;
            v61.origin.x = v7;
            v61.origin.y = v9;
            v61.size.width = v11;
            v61.size.height = v13;
            BOOL v52 = CGRectEqualToRect(v61, v64);

            if (v52) {
LABEL_23:
            }
              [v45 _updateLayoutForStatusBarAndInterfaceOrientation];
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v42);
    }
  }
}

+ (BOOL)_directlySetsContentOverlayInsetsForChildren
{
  return 0;
}

- (id)_screen
{
  view = self->_view;
  if (view) {
    [(UIView *)view _screen];
  }
  else {
  double v3 = +[UIScreen mainScreen];
  }
  return v3;
}

- (void)setNeedsFocusUpdate
{
  id v3 = [(UIViewController *)self _focusSystem];
  [v3 requestFocusUpdateToEnvironment:self];
}

- (UIFocusSystem)_focusSystem
{
  return +[UIFocusSystem focusSystemForEnvironment:self];
}

- (void)_updateContentOverlayInsetsForSelfAndChildren
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least())
  {
    [(UIViewController *)self _updateContentOverlayInsetsFromParentIfNecessary];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = self->_childViewControllers;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "_updateContentOverlayInsetsFromParentIfNecessary", (void)v8);
        }
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
  else if ([(UIViewController *)self _viewControllerUnderlapsStatusBar])
  {
    [(UIViewController *)self _statusBarHeightAdjustmentForCurrentOrientation];
    -[UIViewController _setContentOverlayInsets:andLeftMargin:rightMargin:](self, "_setContentOverlayInsets:andLeftMargin:rightMargin:");
  }
}

- (void)_eagerlyUpdateSafeAreaInsetsToViewDescendant:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UIViewController *)self _existingView];
  int v6 = [v4 isDescendantOfView:v5];

  if (v6)
  {
    CGFloat v7 = [MEMORY[0x1E4F1CA48] array];
    long long v8 = [(UIViewController *)self view];
    id v9 = v4;
    long long v10 = v9;
    while (v10 && v10 != v8)
    {
      long long v11 = v10;
      [v7 insertObject:v10 atIndex:0];
      long long v10 = [v10 superview];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          double v17 = *(id **)(*((void *)&v19 + 1) + 8 * i);
          -[UIView __viewDelegate](v17);
          CGFloat v18 = (double *)objc_claimAutoreleasedReturnValue();
          -[UIViewController _updateViewSafeAreaInsetsAndEagerlyUpdateContentScrollView:](v18);
          objc_msgSend(v17, "_updateSafeAreaInsets", (void)v19);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }
  }
}

- (void)_updateViewSafeAreaInsetsAndEagerlyUpdateContentScrollView:(double *)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  __int16 v2 = [a1 view];
  char v3 = [v2 _safeAreaInsetsFrozen];

  if (v3) {
    return;
  }
  double v4 = a1[110];
  double v5 = a1[111];
  double v6 = a1[112];
  double v7 = a1[113];
  long long v8 = [a1 view];
  objc_msgSend(v8, "setSafeAreaInsets:", v4, v5, v6, v7);

  id v9 = a1;
  long long v10 = [v9 parentViewController];
  if (v10)
  {
    long long v11 = [v9 navigationController];

    if (v11 == v10) {
      goto LABEL_24;
    }
    id v12 = [v9 navigationController];
    uint64_t v13 = [v12 _nestedTopViewController];
    uint64_t v14 = [v13 navigationItem];
    uint64_t v15 = [v14 _searchControllerIfAllowed];

    if (v15)
    {
      unint64_t v16 = ((unint64_t)v15[263] >> 5) & 3;
      if (!v16)
      {
        int v17 = dyld_program_sdk_at_least();
        unint64_t v16 = 2;
        if (!v17) {
          unint64_t v16 = 3;
        }
      }
      if (v16 == 2) {
        long long v11 = v15;
      }

      if (v10 == v11)
      {
LABEL_24:
        uint64_t v26 = 0;
        CGFloat v18 = 0;
        char v27 = 1;
        while (1)
        {
          char v28 = v27;
          uint64_t v29 = [v9 _contentOrObservableScrollViewForEdge:qword_186B94240[v26]];
          double v30 = (void *)v29;
          if (v29 && v18 == 0) {
            break;
          }
          if (v29) {
            goto LABEL_32;
          }
LABEL_40:

          char v27 = 0;
          uint64_t v26 = 1;
          if ((v28 & 1) == 0) {
            goto LABEL_13;
          }
        }
        CGFloat v18 = [MEMORY[0x1E4F1CA48] array];
LABEL_32:
        if (([v18 containsObject:v30] & 1) == 0) {
          [v18 addObject:v30];
        }
        BOOL v32 = [v30 _viewControllerForAncestor];
        double v33 = v32;
        if (v32 == v9
          || ([v32 navigationController],
              double v34 = objc_claimAutoreleasedReturnValue(),
              [v9 navigationController],
              CGFloat v35 = objc_claimAutoreleasedReturnValue(),
              v35,
              v34,
              v34 == v35))
        {
          if (v33) {
            uint64_t v36 = [v33 automaticallyAdjustsScrollViewInsets];
          }
          else {
            uint64_t v36 = 0;
          }
          [v30 _setApplyVerticalSafeAreaInsetsToNonscrollingContent:v36];
        }

        goto LABEL_40;
      }
    }
  }
  CGFloat v18 = 0;
LABEL_13:

  if (v18)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v38 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          double v25 = objc_msgSend(v9, "view", (void)v37);
          -[UIView _eagerlyUpdateSafeAreaInsetsToDescendant:](v25, v24);
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v21);
    }
  }
}

- (BOOL)automaticallyAdjustsScrollViewInsets
{
  return (*(void *)&self->_viewControllerFlags >> 38) & 1;
}

- (id)_contentOrObservableScrollViewInContainerForEdge:(void *)a1
{
  if (a1)
  {
    if (([a1 _isNavigationController] & 1) == 0 && (objc_msgSend(a1, "_isSplitViewController") & 1) == 0)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v10 = NSStringFromSelector(sel__contentOrObservableScrollViewInContainerForEdge_);
      [v9 handleFailureInMethod:sel__contentOrObservableScrollViewInContainerForEdge_, a1, @"UIViewController.m", 1563, @"%@ supported only for UISplitViewController and UINavigationController at this time. self = %@", v10, a1 object file lineNumber description];
    }
    if (_UIViewControllerContainersShouldForwardContentScrollView_onceToken != -1) {
      dispatch_once(&_UIViewControllerContainersShouldForwardContentScrollView_onceToken, &__block_literal_global_2551);
    }
    if (_UIViewControllerContainersShouldForwardContentScrollView_shouldForward)
    {
      double v4 = [a1 contentScrollViewForEdge:a2];
      if (!v4)
      {
        double v5 = [a1 _viewControllerForObservableScrollView];
        double v6 = v5;
        if (!v5 || v5 == a1)
        {
          uint64_t v7 = -[UIViewController _resolveContentScrollViewForEdge:]((uint64_t)a1, a2);
        }
        else
        {
          uint64_t v7 = [v5 _contentOrObservableScrollViewForEdge:a2];
        }
        double v4 = (void *)v7;
      }
    }
    else
    {
      double v4 = -[UIViewController _resolveContentScrollViewForEdge:]((uint64_t)a1, a2);
    }
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

- (NSLayoutConstraint)_bottomBarInsetGuideConstraint
{
  return self->_bottomBarInsetGuideConstraint;
}

- (int64_t)_lastKnownInterfaceOrientation
{
  char v3 = [(UIViewController *)self _popoverController];

  if (v3) {
    return 0;
  }
  else {
    return self->_lastKnownInterfaceOrientation;
  }
}

- (NSLayoutConstraint)_topBarInsetGuideConstraint
{
  return self->_topBarInsetGuideConstraint;
}

- (BOOL)_isInCustomTransition
{
  return (*(void *)&self->_viewControllerFlags >> 34) & 1;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 3)
  {
    v5[6] = v3;
    v5[7] = v4;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__UIViewController_setInterfaceOrientation___block_invoke;
    v5[3] = &unk_1E52E0000;
    v5[4] = self;
    v5[5] = a3;
    -[UIViewController __withSupportedInterfaceOrientation:apply:](self, a3, v5);
  }
}

- (BOOL)__withSupportedInterfaceOrientation:(void *)a3 apply:
{
  double v5 = a3;
  if (a1)
  {
    char v6 = objc_msgSend(a1, "__supportedInterfaceOrientations");
    switch(a2)
    {
      case 0:
        uint64_t v7 = v6 & 1;
        uint64_t v8 = 1;
        break;
      case 1:
        uint64_t v7 = v6 & 2;
        uint64_t v8 = 2;
        break;
      case 2:
        uint64_t v7 = v6 & 4;
        uint64_t v8 = 4;
        break;
      case 3:
        uint64_t v7 = v6 & 8;
        uint64_t v8 = 8;
        break;
      case 4:
        uint64_t v7 = v6 & 0x10;
        uint64_t v8 = 16;
        break;
      default:
        uint64_t v7 = 0;
        uint64_t v8 = 0;
        break;
    }
    BOOL v9 = v7 == v8;
    if (v5) {
      v5[2](v5, v7 == v8);
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __44__UIViewController_setInterfaceOrientation___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(result + 32);
    if (v2) {
      *(void *)(v2 + 264) = *(void *)(result + 40);
    }
  }
  return result;
}

- (BOOL)isSettingAppearState
{
  return (*(void *)&self->_viewControllerFlags >> 21) & 1;
}

- (uint64_t)_defaultSupportedInterfaceOrientations
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    if ([(id)result modalPresentationStyle] == 16
      || [v1 modalPresentationStyle] == 2
      || [v1 modalPresentationStyle] == 1)
    {
      return 30;
    }
    else
    {
      uint64_t v2 = +[UIDevice currentDevice];
      uint64_t v3 = [v2 userInterfaceIdiom];

      if (v3)
      {
        uint64_t v4 = +[UIDevice currentDevice];
        uint64_t v5 = [v4 userInterfaceIdiom];

        if (v5 == 1) {
          return 30;
        }
        else {
          return 2;
        }
      }
      else
      {
        return 26;
      }
    }
  }
  return result;
}

- (unint64_t)__supportedInterfaceOrientations
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIViewController *)self _window];
  if (![v3 _windowCanDynamicallySpecifySupportedInterfaceOrientations])
  {
    unint64_t v5 = 30;
    goto LABEL_47;
  }
  BOOL v4 = [(UIViewController *)self modalPresentationStyle] == 16
    || [(UIViewController *)self modalPresentationStyle] == UIModalPresentationFormSheet
    || [(UIViewController *)self modalPresentationStyle] == UIModalPresentationPageSheet;
  if ([(UIViewController *)self _ignoreAppSupportedOrientations])
  {
    uint64_t v6 = 30;
  }
  else
  {
    uint64_t v7 = (void *)UIApp;
    uint64_t v8 = [(UIViewController *)self _window];
    uint64_t v9 = [v7 _supportedInterfaceOrientationsForWindow:v8];
    if (v9) {
      uint64_t v6 = v9;
    }
    else {
      uint64_t v6 = 30;
    }
  }
  long long v10 = [(UIViewController *)self presentingViewController];
  long long v11 = [v10 _originalPresentationController];
  id v12 = [(UIViewController *)self presentingViewController];
  uint64_t v13 = [v12 _presentationController];

  uint64_t v14 = [(UIViewController *)self presentingViewController];
  uint64_t v15 = v14;
  if (v14) {
    char v16 = v4;
  }
  else {
    char v16 = 1;
  }
  if ((v16 & 1) != 0 || v11 == v13)
  {
    char v23 = (v14 == 0) ^ v16;

    if (v23) {
      goto LABEL_22;
    }
LABEL_24:
    uint64_t v24 = self;
    goto LABEL_25;
  }
  int v17 = [(UIViewController *)self presentingViewController];
  if (!v17)
  {

    goto LABEL_24;
  }
  CGFloat v18 = v17;
  id v19 = [v17 _window];
  uint64_t v20 = [v19 traitCollection];
  uint64_t v21 = [v19 _traitCollectionWhenRotated];
  char v22 = [v18[96] _shouldAdaptFromTraitCollection:v20 toTraitCollection:v21];

  if ((v22 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_22:
  uint64_t v24 = [(UIViewController *)self presentingViewController];
LABEL_25:
  double v25 = v24;
  uint64_t v26 = [(UIViewController *)v24 supportedInterfaceOrientations];
  if (![(UIViewController *)v25 _overrideInterfaceOrientationMechanics])
  {
    char v27 = [(UIViewController *)v25 _viewControllersWhoseOrientationsMustCoincide];
    char v28 = v27;
    if (v27)
    {
      uint64_t v36 = v6;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v29 = [v27 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v38;
        uint64_t v32 = v26;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v38 != v31) {
              objc_enumerationMutation(v28);
            }
            v32 &= [*(id *)(*((void *)&v37 + 1) + 8 * i) supportedInterfaceOrientations];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v30);
      }
      else
      {
        uint64_t v32 = v26;
      }
      if (v32) {
        uint64_t v26 = v32;
      }
      uint64_t v6 = v36;
    }
  }
  BOOL v34 = v26 == 0;
  unint64_t v5 = v26 & v6;
  if (v5) {
    BOOL v34 = 1;
  }
  if (!v34
    && !v4
    && [(UIViewController *)self shouldAutorotate]
    && ([(id)UIApp _isSpringBoard] & 1) == 0)
  {
    [MEMORY[0x1E4F1CA00] raise:@"UIApplicationInvalidInterfaceOrientation", @"Supported orientations has no common orientation with the application, and [%@ shouldAutorotate] is returning YES", objc_opt_class() format];
  }

LABEL_47:
  return v5;
}

+ (CGSize)defaultFormSheetSize
{
  uint64_t v2 = +[_UIPresentationControllerDefaultVisualStyleProvider sharedInstance];
  uint64_t v3 = [v2 defaultSheetMetrics];
  BOOL v4 = +[UIScreen mainScreen];
  [v4 bounds];
  objc_msgSend(v3, "defaultFormSheetSizeForScreenSize:", v5, v6);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UIModalPresentationStyle)modalPresentationStyle
{
  UIModalPresentationStyle modalPresentationStyle = self->_modalPresentationStyle;
  if (modalPresentationStyle == UIModalPresentationAutomatic)
  {
    UIModalPresentationStyle modalPresentationStyle = [(UIViewController *)self _preferredModalPresentationStyle];
    if (modalPresentationStyle == UIModalPresentationAutomatic)
    {
      BOOL v4 = [(UIViewController *)self preferredTransition];
      double v5 = v4;
      if (!v4
        || (UIModalPresentationStyle modalPresentationStyle = [v4 _preferredModalPresentationStyle],
            modalPresentationStyle == UIModalPresentationAutomatic))
      {
        double v6 = +[_UIPresentationControllerDefaultVisualStyleProvider sharedInstance];
        UIModalPresentationStyle modalPresentationStyle = [v6 defaultConcretePresentationStyleForViewController:self];
      }
    }
  }
  return modalPresentationStyle;
}

- (UIViewControllerTransition)preferredTransition
{
  return self->_preferredTransition;
}

- (int64_t)_preferredModalPresentationStyle
{
  return -2;
}

- (BOOL)_ignoreAppSupportedOrientations
{
  return self->_ignoreAppSupportedOrientations;
}

- (int64_t)_overrideInterfaceOrientationMechanics
{
  return 0;
}

- (id)_viewControllersWhoseOrientationsMustCoincide
{
  uint64_t v3 = [(UIViewController *)self presentingViewController];
  BOOL v4 = [v3 _presentationController];
  UIModalPresentationStyle v5 = [(UIViewController *)self modalPresentationStyle];
  if (v3)
  {
    UIModalPresentationStyle v6 = v5;
    BOOL v7 = [v4 state] == 1 || objc_msgSend(v4, "state") == 2;
    if (v6 == 17 || v6 == UIModalPresentationOverFullScreen) {
      goto LABEL_13;
    }
    if (v6) {
      goto LABEL_12;
    }
    double v9 = [v3 _existingView];
    double v10 = [v9 window];
    if (!v10) {
      BOOL v7 = 1;
    }

    if (!v7)
    {
LABEL_13:
      double v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:self];
    }
    else
    {
LABEL_12:
      double v11 = [MEMORY[0x1E4F1CA48] array];
    }
    double v12 = v11;
    double v8 = _viewControllersWhoseOrientationsMustCoincide(self, v11);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
  if (![(UIViewController *)self _defersToPresentingViewControllerForSupportedInterfaceOrientations])
  {
LABEL_5:
    return -[UIViewController _defaultSupportedInterfaceOrientations]((uint64_t)self);
  }
  __int16 v3 = *((_WORD *)&self->_viewControllerFlags + 4);
  if ((v3 & 0x20) == 0)
  {
    BOOL v4 = [(UIViewController *)self presentingViewController];
    if (v4)
    {
      UIModalPresentationStyle v5 = v4;
      p_unint64_t viewControllerFlags = &self->_viewControllerFlags;
      *((_WORD *)&self->_viewControllerFlags + 4) |= 0x20u;
      UIInterfaceOrientationMask v7 = [v4 supportedInterfaceOrientations];
      *((_WORD *)p_viewControllerFlags + 4) &= ~0x20u;

      return v7;
    }
    goto LABEL_5;
  }
  *(void *)&self->_unint64_t viewControllerFlags = self->_viewControllerFlags;
  *((_WORD *)&self->_viewControllerFlags + 4) = v3 & 0xFFDF;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Orientation", supportedInterfaceOrientations___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    double v10 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "supportedInterfaceOrientations was invoked recursively. Will return the default supported interface orientations", v11, 2u);
    }
  }
  return -[UIViewController _defaultSupportedInterfaceOrientations]((uint64_t)self);
}

- (BOOL)_defersToPresentingViewControllerForSupportedInterfaceOrientations
{
  return 0;
}

+ (double)_horizontalContentMarginForView:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_class();
  [v3 bounds];
  [v4 _horizontalContentMarginForView:v3 ofWidth:v5];
  double v7 = v6;

  return v7;
}

- (BOOL)__isKindOfUIViewController
{
  return 1;
}

- (void)_updateControlledViewsToFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(UIViewController *)self view];
  objc_msgSend(v7, "setFrame:", x, y, width, height);
}

- (void)removeChildViewController:(id)a3 notifyDidMove:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(NSMutableArray *)self->_childViewControllers removeObjectIdenticalTo:v6];
  [(UIViewController *)self _removeChildViewController:v6];
  [(UIResponder *)self _didChangeDeepestActionResponder];
  id v7 = [(UIViewController *)self _splitViewControllerEnforcingClass:1];
  [v7 _viewControllerChildViewControllersDidChange:self];

  if (v4) {
    [v6 didMoveToParentViewController:0];
  }
  if ((dyld_program_sdk_at_least() & 1) == 0
    && [(UIViewController *)self allowsWeakReference])
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__UIViewController_removeChildViewController_notifyDidMove___block_invoke;
    v8[3] = &unk_1E52DC308;
    objc_copyWeak(&v9, &location);
    dispatch_async(MEMORY[0x1E4F14428], v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_addChildViewController:(id)a3 performHierarchyCheck:(BOOL)a4 notifyWillMove:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v20 = v8;
  if (!v6) {
    goto LABEL_8;
  }
  id v9 = [v8 parentViewController];
  if (!v9)
  {
    char v16 = [v20 _existingView];
    int v17 = [v16 window];

    if (!v17) {
      goto LABEL_4;
    }
    CGFloat v18 = [v20 _existingView];
    id v19 = [v18 superview];
    id v9 = [v19 _viewControllerForAncestor];

    if (v9 && v9 != self) {
      [MEMORY[0x1E4F1CA00] raise:@"UIViewControllerHierarchyInconsistency", @"child view controller:%@ should have parent view controller:%@ but requested parent is:%@", v20, v9, self format];
    }
  }

LABEL_4:
  if (dyld_program_sdk_at_least())
  {
    id v10 = [(UIViewController *)self presentedViewController];

    if (v20)
    {
      if (v10 == v20) {
        [MEMORY[0x1E4F1CA00] raise:@"UIViewControllerHierarchyInconsistency", @"trying to add child view controller that is already presented: %@", v20 format];
      }
    }
  }
LABEL_8:
  double v11 = [(UIViewController *)self _window];
  double v12 = [v11 screen];

  objc_msgSend(v20, "__willChangeToIdiom:onScreen:", objc_msgSend(v12, "_userInterfaceIdiom"), v12);
  uint64_t v13 = [v20 parentViewController];

  if (v13)
  {
    [v20 willMoveToParentViewController:0];
    [v20 removeFromParentViewController];
  }
  [(UIViewController *)self _addChildViewController:v20];
  [(NSMutableArray *)self->_childViewControllers addObject:v20];
  [(UIResponder *)self _didChangeDeepestActionResponder];
  if (v5) {
    [v20 willMoveToParentViewController:self];
  }
  if (dyld_program_sdk_at_least())
  {
    uint64_t v14 = [(UIViewController *)self navigationController];
    [v14 _viewControllerSubtreeDidGainViewController:self];
  }
  uint64_t v15 = [(UIViewController *)self _splitViewControllerEnforcingClass:1];
  [v15 _viewControllerChildViewControllersDidChange:self];
}

- (id)_splitViewControllerEnforcingClass:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(UIViewController *)self splitViewController];
  if (!v6)
  {
    dyld_program_sdk_at_least();
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (dyld_program_sdk_at_least())
  {
    if (isKindOfClass) {
      goto LABEL_7;
    }
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UIViewController.m", 15000, @"-splitViewController must return an instance of a UISplitViewController subclass. %@ returned %@, which is not a kind of UISplitViewController.", self, v6 object file lineNumber description];
  }
  else
  {
    if (isKindOfClass) {
      goto LABEL_7;
    }
    id v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_splitViewControllerEnforcingClass____s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      double v12 = self;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "-splitViewController must return an instance of a UISplitViewController subclass. %@ returned %@, which is not a kind of UISplitViewController.", buf, 0x16u);
    }
  }
  if (v3)
  {

    BOOL v6 = 0;
  }
LABEL_7:
  return v6;
}

- (void)__willChangeToIdiom:(int64_t)a3 onScreen:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    id v7 = [(UIViewController *)self _window];
    id v8 = [v7 screen];

    if (!v8 || [v8 _userInterfaceIdiom] != a3)
    {
      [(UIViewController *)self _willChangeToIdiom:a3 onScreen:v6];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v9 = [(UIViewController *)self childViewControllers];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
            objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "__willChangeToIdiom:onScreen:", a3, v6);
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v11);
      }
    }
  }
}

- (void)willMoveToParentViewController:(UIViewController *)parent
{
  if (![(UIViewController *)self appearanceTransitionsAreDisabled]) {
    *(void *)&self->_viewControllerFlags |= 0x2000000uLL;
  }
  id v4 = [(UIViewController *)self _existingView];
  [v4 _setViewDelegateContentOverlayInsetsAreClean:0];
}

- (BOOL)appearanceTransitionsAreDisabled
{
  return (*(void *)&self->_viewControllerFlags >> 27) & 1;
}

- (void)_addChildViewController:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (v4 && (*((void *)v4 + 47) & 0x100) != 0)
  {
    BOOL v5 = [v4 _existingView];
    id v6 = [v5 window];

    if (v6) {
      [MEMORY[0x1E4F1CA00] raise:@"UIViewControllerHierarchyInconsistency", @"adding a root view controller %@ as a child of view controller:%@", v10, self format];
    }
    id v4 = v10;
    *((void *)v10 + 47) &= ~0x100uLL;
  }
  if (!self->_childViewControllers)
  {
    id v7 = (NSMutableArray *)objc_opt_new();
    childViewControllers = self->_childViewControllers;
    self->_childViewControllers = v7;

    id v4 = v10;
  }
  if (v4)
  {
    __int16 v9 = *((_WORD *)v4 + 192);
    *((_WORD *)v4 + 192) = v9 | 0x100;
    [v10 setParentViewController:self];
    id v4 = v10;
    *((_WORD *)v10 + 192) = *((_WORD *)v10 + 192) & 0xFEFF | v9 & 0x100;
  }
}

- (void)setParentViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if ((*((_WORD *)&self->_viewControllerFlags + 4) & 0x100) != 0)
  {
    id v8 = self;
    __int16 v9 = v5;
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __44__UIViewController_setParentViewController___block_invoke;
    uint64_t v13 = &unk_1E52D9F98;
    long long v14 = self;
    id v6 = v4;
    id v15 = v6;
    if (qword_1EB25BB98 != -1) {
      dispatch_once(&qword_1EB25BB98, &v10);
    }

    if (v6)
    {
      objc_getAssociatedObject(v6, &unk_1EB25BB27);
      id v7 = (id *)objc_claimAutoreleasedReturnValue();
      if (v7
        || (id v7 = (id *)-[_UIUnsafeUnretainedCleanupHelper initWithParent:deallocationHandler:]([_UIUnsafeUnretainedCleanupHelper alloc], (uint64_t)v6, &__block_literal_global_574), objc_setAssociatedObject(v6, &unk_1EB25BB27, v7, (void *)1), v7))
      {
        objc_msgSend(v7[3], "addObject:", self, v10, v11, v12, v13, v14);
      }
    }
    id v8 = self;
    __int16 v9 = v6;
  }
  -[UIViewController __setParentViewController:](v8, v9);
}

- (void)__setParentViewController:(void *)a1
{
  id v3 = a2;
  if (a1 && (id)a1[13] != v3)
  {
    a1[13] = v3;
    id v8 = v3;
    id v4 = v3;
    if (_UIViewControllersInheritTraitsFromViewHierarchy())
    {
      if (v4
        && ([v4 overrideTraitCollectionForChildViewController:a1],
            (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v6 = v5;
        -[UIViewController _applyCompatibilityTraitOverridesForOverrideTraitCollection:](a1, v5);
      }
      else
      {
        id v6 = -[UIViewController _compatibilityTraitOverridesFromParentViewControllerCreateIfNecessary:](a1, 0);
        if (v6)
        {
          id v7 = +[UITraitCollection _emptyTraitCollection]();
          -[_UITraitOverrides _replaceOverrideTraitCollection:]((uint64_t)v6, v7);
        }
      }
    }
    id v3 = v8;
  }
}

- (id)_compatibilityTraitOverridesFromParentViewControllerCreateIfNecessary:(void *)a1
{
  if (a2 && !a1[52])
  {
    id v3 = -[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], a1);
    id v4 = (void *)a1[52];
    a1[52] = v3;
  }
  BOOL v5 = -[_UITraitOverrides _overridesAppliedBefore]((void *)a1[52]);
  id v6 = -[_UITraitOverrides _overridesAppliedAfter](v5);

  return v6;
}

- (UITraitCollection)overrideTraitCollectionForChildViewController:(UIViewController *)childViewController
{
  return (UITraitCollection *)[(NSMapTable *)self->_overrideTraitCollectionsForChildren objectForKey:childViewController];
}

- (BOOL)_isViewControllerForObservableScrollViewAmbiguous
{
  return 0;
}

- (UIEdgeInsets)_overlayInsetsAdjustment
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (CGRect)_viewFrameInWindowForContentOverlayInsetsCalculation
{
  double v3 = [(UIViewController *)self _existingView];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v54 = v3;
  id v8 = [v3 window];
  if (!v8) {
    goto LABEL_24;
  }
  __int16 v9 = self;
  if (!v9) {
    goto LABEL_24;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  uint64_t v12 = v9;
  do
  {
    uint64_t v13 = [(UIViewController *)v12 _existingPresentationControllerImmediate:0 effective:1 includesRoot:1];
    long long v14 = [v13 _viewToIgnoreLayerTransformForViewFrameInWindowContentOverlayInsetsCalculation];
    uint64_t v15 = [v13 containerView];
    long long v16 = (void *)v15;
    if (v15) {
      long long v17 = (void *)v15;
    }
    else {
      long long v17 = v8;
    }
    if (v14) {
      long long v17 = v14;
    }
    id v18 = v17;
    if (v12 != v10)
    {
      uint64_t v19 = v11;
      double v20 = v4;
      double v21 = v5;
      double v22 = v6;
      double v23 = v7;
      goto LABEL_16;
    }
    if (!-[UIViewController _ignoresWrapperViewForContentOverlayInsets](v10, "_ignoresWrapperViewForContentOverlayInsets")|| ([v54 superview], id v24 = (id)objc_claimAutoreleasedReturnValue(), v24, v24 == v18))
    {
      [v54 bounds];
      uint64_t v19 = v54;
LABEL_16:
      objc_msgSend(v19, "convertRect:toView:", v18, v20, v21, v22, v23);
      double v4 = v30;
      double v5 = v31;
      double v6 = v32;
      double v7 = v33;
      if (!v14) {
        goto LABEL_18;
      }
LABEL_17:
      [v14 _frameIgnoringLayerTransform];
      double v35 = v4 + v34;
      double v37 = v5 + v36;
      long long v38 = [v14 superview];
      objc_msgSend(v38, "convertRect:toView:", v16, v35, v37, v6, v7);
      double v4 = v39;
      double v5 = v40;
      double v6 = v41;
      double v7 = v42;

      goto LABEL_18;
    }
    long long v53 = [v54 superview];
    double v25 = [v53 superview];
    [v54 frame];
    objc_msgSend(v25, "convertRect:toView:", v18);
    double v4 = v26;
    double v5 = v27;
    double v6 = v28;
    double v7 = v29;

    if (v14) {
      goto LABEL_17;
    }
LABEL_18:
    if ([v13 _isPresentedInFullScreen])
    {
      uint64_t v43 = 0;
    }
    else
    {
      uint64_t v43 = [(UIViewController *)v12 presentingViewController];
    }

    id v44 = v16;
    uint64_t v12 = (UIViewController *)v43;
    uint64_t v11 = v44;
  }
  while (v43);
  if (v16)
  {
    objc_msgSend(v44, "convertRect:toView:", v8, v4, v5, v6, v7);
    double v4 = v45;
    double v5 = v46;
    double v6 = v47;
    double v7 = v48;
  }
LABEL_24:

  double v49 = v4;
  double v50 = v5;
  double v51 = v6;
  double v52 = v7;
  result.size.double height = v52;
  result.size.double width = v51;
  result.origin.double y = v50;
  result.origin.double x = v49;
  return result;
}

- (BOOL)_ignoresWrapperViewForContentOverlayInsets
{
  return (*(void *)&self->_viewControllerFlags >> 52) & 1;
}

- (id)_containingTabBarController
{
  if (a1)
  {
    uint64_t v2 = (uint64_t)a1;
    uint64_t v3 = objc_opt_class();
    a1 = -[UIViewController _ancestorViewControllerOfClass:allowModalParent:](v2, v3, 0);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (UIMultiColumnViewController)_multiColumnViewController
{
  uint64_t v3 = objc_opt_class();
  return (UIMultiColumnViewController *)-[UIViewController _ancestorViewControllerOfClass:allowModalParent:]((uint64_t)self, v3, 0);
}

- ($109F14CB9CD3811A6C59613AC76ACC48)_cumulativeOverlayInsetsInView:(SEL)a3
{
  _UIViewControllerAccumulateSafeAreaInsetsIncludingChildrenIntoParentView(&retstr->var0.top, self, a4);
  return result;
}

- (void)_removeChildViewController:(id)a3
{
  double v7 = (id *)a3;
  -[UIViewController _parentViewController](v7);
  double v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  double v5 = v7;
  if (v7 && v4 == self)
  {
    __int16 v6 = *((_WORD *)v7 + 192);
    *((_WORD *)v7 + 192) = v6 | 0x100;
    [v7 setParentViewController:0];
    double v5 = v7;
    *((_WORD *)v7 + 192) = (_WORD)v7[48] & 0xFEFF | v6 & 0x100;
  }
}

- (id)_parentViewController
{
  if (a1)
  {
    a1 = (id *)a1[13];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)removeFromParentViewController
{
  parentViewController = self->_parentViewController;
  if (parentViewController) {
    [(UIViewController *)parentViewController removeChildViewController:self];
  }
}

- (void)removeChildViewController:(id)a3
{
}

- (void)setEdgesForExtendedLayout:(UIRectEdge)edgesForExtendedLayout
{
  self->_edgesForExtendedLayout = edgesForExtendedLayout;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIViewController;
  [(UIViewController *)&v11 setValue:a3 forKey:v7];
  if (dyld_program_sdk_at_least()
    && (([v7 isEqualToString:@"topLayoutGuide"] & 1) != 0
     || [v7 isEqualToString:@"bottomLayoutGuide"]))
  {
    id v8 = NSString;
    __int16 v9 = NSStringFromSelector(a2);
    uint64_t v10 = [v8 stringWithFormat:@"%@ is a readonly property. Do not use -%@ to set it. This is an application bug.", v7, v9];

    NSLog(&stru_1ED0F89C0.isa, v10);
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@", v10 format];
  }
}

- (double)_contentMargin
{
  return self->_contentMargin;
}

- (BOOL)_freezeLayoutForOrientationChangeOnDismissal
{
  LODWORD(v3) = [(UIViewController *)self _allowsFreezeLayoutForOrientationChangeOnDismissal];
  if (v3) {
    return (*(void *)&self->_viewControllerFlags >> 50) & 1;
  }
  return v3;
}

- (BOOL)_allowsFreezeLayoutForOrientationChangeOnDismissal
{
  return 0;
}

void __52__UIViewController__setViewAppearState_isAnimating___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__UIViewController__setViewAppearState_isAnimating___block_invoke_2;
  v12[3] = &__block_descriptor_41_e26_v16__0__UIViewController_8l;
  v12[4] = *(void *)(a1 + 40);
  char v13 = *(unsigned char *)(a1 + 48);
  double v4 = (void (**)(void *, id))_Block_copy(v12);
  double v5 = [v3 _existingView];
  LODWORD(a1) = [v5 isDescendantOfView:*(void *)(a1 + 32)];

  if (a1)
  {
    v4[2](v4, v3);
  }
  else
  {
    __int16 v6 = [v3 _existingView];
    id v7 = [v6 window];
    if (v7 || ([v3 isPerformingModalTransition] & 1) != 0)
    {
    }
    else
    {
      uint64_t v8 = [v3 childModalViewController];
      if (v8)
      {
        __int16 v9 = (void *)v8;
        uint64_t v10 = [v3 childModalViewController];
        uint64_t v11 = [v10 modalPresentationStyle];

        if (v11 != 3) {
          goto LABEL_7;
        }
        __int16 v6 = [v3 childModalViewController];
        v4[2](v4, v6);
      }
    }
  }
LABEL_7:
}

void __52__UIViewController__setViewAppearState_isAnimating___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  int v3 = [v7 _appearState];
  int v4 = *(_DWORD *)(a1 + 32);
  if (v3 != v4)
  {
    if (v7)
    {
      v7[47] = v7[47] & 0xFFFFFFFFFFFFFFF9 | (2 * (*(_DWORD *)(a1 + 32) & 3u));
      int v4 = *(_DWORD *)(a1 + 32);
    }
    if ((v3 - 1) >= 2 && v4 == 1)
    {
      double v5 = [v7 _existingView];
      __int16 v6 = v5;
      if (v5 && ([v5 _viewDelegateContentOverlayInsetsAreClean] & 1) == 0) {
        [v7 _updateContentOverlayInsetsForSelfAndChildren];
      }
    }
  }
  -[UIViewController _setViewAppearState:isAnimating:](v7, *(unsigned int *)(a1 + 36), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)prefersStatusBarHidden
{
  if ([(id)objc_opt_class() doesOverrideViewControllerMethod:sel__preferredStatusBarVisibility])int v3 = -[UIViewController _preferredStatusBarVisibility](self, "_preferredStatusBarVisibility"); {
  else
  }
    int v3 = -[UIViewController _defaultViewControllerStatusBarVisibilityBehavior]((uint64_t)self);
  return v3 == 1;
}

- (UIViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  __int16 v6 = nibNameOrNil;
  id v7 = nibBundleOrNil;
  v14.receiver = self;
  v14.super_class = (Class)UIViewController;
  uint64_t v8 = [(UIViewController *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [(NSString *)v6 copy];
    nibName = v8->_nibName;
    v8->_nibName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_nibBundle, nibBundleOrNil);
    -[UIViewController _populateInitialTraitCollection]((uint64_t)v8);
    -[UIViewController _doCommonSetup]((uint64_t)v8);
    v8->_edgesForExtendedLayout = 15;
    *(void *)&v8->_viewControllerFlags |= 0x4000000000uLL;
    [(UIViewController *)v8 setDefinesPresentationContext:[(UIViewController *)v8 _isPresentationContextByDefault]];
    *(void *)&v8->_viewControllerFlags |= 0x8000000000000uLL;
    v8->_modalTransitionStyle = _UIViewControllerDefaultModalTransitionStyle(v8);
    int v11 = dyld_program_sdk_at_least();
    uint64_t v12 = -2;
    if (!v11) {
      uint64_t v12 = 0;
    }
    v8->_UIModalPresentationStyle modalPresentationStyle = v12;
  }
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    CFAutorelease(v8);
  }

  return v8;
}

- (void)setDefinesPresentationContext:(BOOL)definesPresentationContext
{
  uint64_t v3 = 0x40000;
  if (!definesPresentationContext) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_unint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (void)_populateInitialTraitCollection
{
  if (dyld_program_sdk_at_least())
  {
    uint64_t v2 = +[UITraitCollection _fallbackTraitCollection]();
    uint64_t v3 = *(void **)(a1 + 496);
    *(void *)(a1 + 496) = v2;
  }
}

- (BOOL)_isPresentationContextByDefault
{
  return 0;
}

- (BOOL)_allowsSkippingLayout
{
  if ([(id)objc_opt_class() doesOverrideViewControllerMethod:sel_viewWillLayoutSubviews]) {
    return 0;
  }
  else {
    return [(id)objc_opt_class() doesOverrideViewControllerMethod:sel_viewDidLayoutSubviews] ^ 1;
  }
}

- (void)_setViewAppearState:(uint64_t)a3 isAnimating:
{
  if (!a1) {
    return;
  }
  if ((*(void *)(a1 + 376) & 0x8000000) != 0) {
    goto LABEL_53;
  }
  __int16 v6 = [(id)a1 _existingView];
  id v7 = [v6 window];
  if (v7 || ([(id)a1 isPerformingModalTransition] & 1) != 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  uint64_t v31 = [(id)a1 childModalViewController];
  if (!v31) {
    goto LABEL_6;
  }
  double v32 = (void *)v31;
  double v33 = [(id)a1 childModalViewController];
  uint64_t v34 = [v33 modalPresentationStyle];

  if (v34 != 3)
  {
LABEL_7:
    unsigned int v8 = *(_DWORD *)(a1 + 376);
    int v9 = [(id)a1 _forwardAppearanceMethods];
    if (v9)
    {
      uint64_t v10 = [(id)a1 _existingView];
    }
    else
    {
      uint64_t v10 = 0;
    }
    if (a2 == 1)
    {
      id v53 = v10;
      *(void *)(a1 + 376) = *(void *)(a1 + 376) & 0xFFFFFFFFFFDFFFF9 | 0x200002;
      int v11 = (void *)_UISetCurrentFallbackEnvironment((void *)a1);
      if ((a3 & 1) != 0 && -[UIViewController _shouldTrackAppearStateChange]((void *)a1))
      {
        uint64_t v12 = [MEMORY[0x1E4F28F80] processInfo];
        char v13 = [(id)a1 _effectiveInteractionActivityTrackingBaseName];
        [v13 stringByAppendingString:@"-Appearing"];
        v15 = unsigned int v14 = v8;
        uint64_t v16 = [v12 beginActivityWithOptions:0x200000000000 reason:v15];
        long long v17 = *(void **)(a1 + 256);
        *(void *)(a1 + 256) = v16;

        unsigned int v8 = v14;
      }
      else
      {
        uint64_t v12 = *(void **)(a1 + 256);
        *(void *)(a1 + 256) = 0;
      }

      [(id)a1 viewWillAppear:a3];
      double v25 = [(id)a1 _embeddedDelegate];

      if (v25)
      {
        double v26 = [(id)a1 _embeddedDelegate];
        [v26 viewController:a1 viewWillAppear:a3];
      }
      *(void *)(a1 + 376) |= 0x80000000000000uLL;
      double v27 = *(void **)(a1 + 504);
      if (!v27
        || ([v27 presentedViewController],
            double v28 = objc_claimAutoreleasedReturnValue(),
            int v29 = [v28 _hasAppeared],
            v28,
            !v29))
      {
        uint64_t v10 = v53;
        goto LABEL_44;
      }
      double v30 = [*(id *)(a1 + 504) containerView];
      [v30 setNeedsLayout];
      uint64_t v10 = v53;
    }
    else
    {
      -[UIViewController __viewIsAppearing:skipWindowCheck:](a1, a3, 1);
      *(void *)(a1 + 376) = *(void *)(a1 + 376) & 0xFFFFFFFFFFFFFFF9 | (2 * (a2 & 3)) | 0x200000;
      int v11 = (void *)_UISetCurrentFallbackEnvironment((void *)a1);
      if (a2)
      {
        if (a2 == 2)
        {
          if (*(void *)(a1 + 256))
          {
            long long v38 = [MEMORY[0x1E4F28F80] processInfo];
            [v38 endActivity:*(void *)(a1 + 256)];

            double v39 = *(void **)(a1 + 256);
            *(void *)(a1 + 256) = 0;
          }
          [(id)a1 viewDidAppear:a3];
          double v40 = [(id)a1 _embeddedDelegate];

          if (!v40) {
            goto LABEL_44;
          }
          double v30 = [(id)a1 _embeddedDelegate];
          [v30 viewController:a1 viewDidAppear:a3];
        }
        else
        {
          if (a2 != 3) {
            goto LABEL_44;
          }
          if (a3 && -[UIViewController _shouldTrackAppearStateChange]((void *)a1))
          {
            id v18 = [MEMORY[0x1E4F28F80] processInfo];
            uint64_t v19 = [(id)a1 _effectiveInteractionActivityTrackingBaseName];
            [v19 stringByAppendingString:@"-Disappearing"];
            id v54 = v11;
            double v20 = v10;
            v22 = unsigned int v21 = v8;
            uint64_t v23 = [v18 beginActivityWithOptions:0x200000000000 reason:v22];
            id v24 = *(void **)(a1 + 256);
            *(void *)(a1 + 256) = v23;

            unsigned int v8 = v21;
            uint64_t v10 = v20;
            int v11 = v54;
          }
          else
          {
            id v18 = *(void **)(a1 + 256);
            *(void *)(a1 + 256) = 0;
          }

          [(id)a1 viewWillDisappear:a3];
          double v41 = [(id)a1 _embeddedDelegate];

          if (!v41) {
            goto LABEL_44;
          }
          double v30 = [(id)a1 _embeddedDelegate];
          [v30 viewController:a1 viewWillDisappear:a3];
        }
      }
      else
      {
        if (*(void *)(a1 + 256))
        {
          double v35 = [MEMORY[0x1E4F28F80] processInfo];
          [v35 endActivity:*(void *)(a1 + 256)];

          double v36 = *(void **)(a1 + 256);
          *(void *)(a1 + 256) = 0;
        }
        [(id)a1 viewDidDisappear:a3];
        double v37 = [(id)a1 _embeddedDelegate];

        if (!v37) {
          goto LABEL_44;
        }
        double v30 = [(id)a1 _embeddedDelegate];
        [v30 viewController:a1 viewDidDisappear:a3];
      }
    }

LABEL_44:
    _UIRestorePreviousFallbackEnvironment(v11);
    uint64_t v42 = *(void *)(a1 + 376);
    *(void *)(a1 + 376) = v42 & 0xFFFFFFFFFFDFFFFFLL;
    if ((a2 & 0xFFFFFFFD) == 0 && (v42 & 0x10000000) != 0)
    {
      uint64_t v43 = [(id)a1 parentViewController];
      [(id)a1 didMoveToParentViewController:v43];
    }
    if (v9)
    {
      if ([(id)a1 childViewControllersCount])
      {
        id v44 = [(id)a1 childViewControllers];
      }
      else
      {
        id v44 = 0;
      }
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __52__UIViewController__setViewAppearState_isAnimating___block_invoke;
      v56[3] = &unk_1E52E9FA0;
      int v58 = (v8 >> 1) & 3;
      int v59 = a2;
      char v60 = a3;
      id v57 = v10;
      [v44 enumerateObjectsUsingBlock:v56];
    }
LABEL_53:
    double v45 = *(void **)(a1 + 32);
    if (v45)
    {
      uint64_t v46 = v45[12];
      if ((v46 & 0x400000000000000) != 0)
      {
        if (a2 != 3 && a2)
        {
          if ((*(void *)(a1 + 376) & 0x100000000) != 0)
          {
            [v45 _setNeedsUpdateConstraints];
            *(void *)(a1 + 376) &= ~0x100000000uLL;
          }
        }
        else
        {
          if ((v46 & 0x100000000000) == 0)
          {
            double v47 = [v45 _constraintsExceptingSubviewAutoresizingConstraints];
            uint64_t v48 = [v47 count];

            if (v48) {
              *(void *)(a1 + 376) |= 0x100000000uLL;
            }
          }
          if ((dyld_program_sdk_at_least() & 1) == 0)
          {
            double v49 = [(id)a1 navigationController];
            if (([v49 needsDeferredTransition] & 1) == 0)
            {
              uint64_t v50 = [v49 view];
              if (v50)
              {
                if ((*(void *)(v50 + 96) & 0x60000000000000) == 0)
                {
                  uint64_t v51 = *(void *)(v50 + 104);
                  int v52 = *(_DWORD *)(v50 + 112);
                  *(void *)(v50 + 96) |= 0x40000000000000uLL;
                  *(void *)(v50 + 104) = v51;
                  *(_DWORD *)(v50 + 112) = v52;
                }
              }
            }
          }
        }
      }
    }
    return;
  }
  id v55 = [(id)a1 childModalViewController];
  -[UIViewController _setViewAppearState:isAnimating:](v55, a2, a3);
}

- (_UIViewControllerContentViewEmbedding)_embeddedDelegate
{
  return self->__embeddedDelegate;
}

- (void)__viewIsAppearing:(char)a3 skipWindowCheck:
{
  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 376);
    __int16 v6 = *(_WORD *)(a1 + 384);
    if (v5 & 0x80000000000000) == 0 || (a3)
    {
      if ((v5 & 0x80000000000000) == 0) {
        return;
      }
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) window];

      if (!v7) {
        return;
      }
      uint64_t v5 = *(void *)(a1 + 376);
      __int16 v6 = *(_WORD *)(a1 + 384);
    }
    *(void *)(a1 + 376) = v5 & 0xFF7FFFFFFFFFFFFFLL;
    *(_WORD *)(a1 + 384) = v6;
    if ((v5 & 0x8000000) == 0)
    {
      unsigned int v8 = (void *)_UISetCurrentFallbackEnvironment((void *)a1);
      unint64_t v9 = *(void *)(a1 + 376);
      if (dyld_program_sdk_at_least()) {
        *(void *)(a1 + 376) |= 0x100000000000000uLL;
      }
      -[UIViewController _executeViewIsAppearingBlock:](a1, a2);
      [(id)a1 viewIsAppearing:a2];
      *(void *)(a1 + 376) = *(void *)(a1 + 376) & 0xFEFFFFFFFFFFFFFFLL | ((HIBYTE(v9) & 1) << 56);
      _UIRestorePreviousFallbackEnvironment(v8);
    }
  }
}

- (BOOL)_forwardAppearanceMethods
{
  if ([(id)objc_opt_class() doesOverrideViewControllerMethod:sel_shouldAutomaticallyForwardAppearanceMethods])
  {
    return [(UIViewController *)self shouldAutomaticallyForwardAppearanceMethods];
  }
  else
  {
    return [(UIViewController *)self automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers];
  }
}

- (BOOL)containmentSupport
{
  return (*(void *)&self->_viewControllerFlags >> 20) & 1;
}

- (unint64_t)childViewControllersCount
{
  return [(NSMutableArray *)self->_childViewControllers count];
}

- (BOOL)isPerformingModalTransition
{
  return (*(void *)&self->_viewControllerFlags >> 4) & 1;
}

- (void)_doCommonSetup
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void **)(a1 + 112);
  *(void *)(a1 + 112) = v2;

  if (([(id)objc_opt_class() doesOverrideViewControllerMethod:sel_systemLayoutFittingSizeDidChangeForChildContentContainer_] & 1) != 0|| objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_systemLayoutFittingSizeDidChangeForChildViewController_))
  {
    *(void *)(a1 + 376) |= 0x40000000000uLL;
  }
  if ([(id)objc_opt_class() doesOverrideViewControllerMethod:sel_contentScrollView]) {
    *(void *)(a1 + 376) |= 0x200000000000000uLL;
  }
  if ([(id)objc_opt_class() doesOverrideViewControllerMethod:sel__setContentOverlayInsets_])*(void *)(a1 + 376) |= 0x20000000000000uLL; {
  int v4 = [(id)objc_opt_class() doesOverrideViewControllerMethod:sel_contentScrollViewForEdge_];
  }
  uint64_t v5 = (uint64_t *)(a1 + 376);
  __int16 v6 = *(_WORD *)(a1 + 384);
  uint64_t v7 = *(void *)(a1 + 376);
  if (v4) {
    uint64_t v7 = *v5 | 0x400000000000000;
  }
  uint64_t *v5 = v7 & 0x3FFFFFFFFFFFFFFFLL;
  *(_WORD *)(a1 + 384) = v6 & 0xFFF0;
  [(id)a1 _setAllowsAutorotation:1];
  [(id)objc_opt_class() defaultFormSheetSize];
  objc_msgSend((id)a1, "_setFormSheetSize:");
  *(void *)(a1 + 376) |= 0x100000uLL;
  unsigned int v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  if (pthread_main_np() == 1 && ([(id)UIApp _isHandlingMemoryWarning] & 1) == 0)
  {
    [(id)qword_1EB25BB38 addObject:a1];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__UIViewController__doCommonSetup__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = a1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if (qword_1EB25BB60 != -1) {
    dispatch_once(&qword_1EB25BB60, &__block_literal_global_297);
  }
  [v8 addObserver:a1 selector:sel_applicationWillSuspend name:@"UIApplicationSuspendedNotification" object:UIApp];
  [v8 addObserver:a1 selector:sel_applicationDidResume name:@"UIApplicationResumedNotification" object:UIApp];
  [v8 addObserver:a1 selector:sel_applicationWantsViewsToDisappear name:@"UIApplicationWantsViewsToDisappearNotification" object:UIApp];
  [v8 addObserver:a1 selector:sel_accessibilityLargeTextDidChange name:@"UIAccessibilityLargeTextChangedNotification" object:UIApp];
  -[UIViewController _inferLayoutGuidesFromSubviews](a1);
  -[UIViewController _setUpLayoutGuideConstraintIfNecessaryAtTop:](a1, 1);
  -[UIViewController _setUpLayoutGuideConstraintIfNecessaryAtTop:](a1, 0);
  __int16 v9 = *(_WORD *)(a1 + 384) & 0xFFDF;
  *(void *)(a1 + 376) &= 0xFFFFFE7FFFFFFFFFLL;
  *(_WORD *)(a1 + 384) = v9;
  if (-[UIViewController _needsAutomaticContentUnavailableConfigurationUpdates](a1)) {
    *(_WORD *)(a1 + 384) |= 0x10u;
  }
}

+ (BOOL)doesOverrideViewControllerMethod:(SEL)a3 inBaseClass:(Class)a4
{
  IMP MethodImplementation = class_getMethodImplementation((Class)a1, a3);
  return MethodImplementation != class_getMethodImplementation(a4, a3);
}

+ (BOOL)doesOverrideViewControllerMethod:(SEL)a3
{
  uint64_t v5 = objc_opt_class();
  return [a1 doesOverrideViewControllerMethod:a3 inBaseClass:v5];
}

- (void)_setUpLayoutGuideConstraintIfNecessaryAtTop:(uint64_t)a1
{
  v29[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = 12;
    if (a2) {
      uint64_t v4 = 11;
    }
    id v5 = *(id *)(a1 + OBJC_IVAR___UIViewController__lastNotifiedTraitCollection[v4]);
    __int16 v6 = v5;
    if (*(void *)(a1 + 32)) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      goto LABEL_32;
    }
    if (a2) {
      uint64_t v8 = 6;
    }
    else {
      uint64_t v8 = 7;
    }
    id v9 = *(id *)(a1 + OBJC_IVAR___UIViewController__lastNotifiedTraitCollection[v8]);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = [v9 container];
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        char v13 = [v10 container];
        unsigned int v14 = *(void **)(a1 + 32);

        if (v13 != v14)
        {
          double v27 = [MEMORY[0x1E4F28B00] currentHandler];
          [v27 handleFailureInMethod:sel__setUpLayoutGuideConstraintIfNecessaryAtTop_ object:a1 file:@"UIViewController.m" lineNumber:2728 description:@"Unexpected: The view changed out from under the guide constraint"];
        }
LABEL_31:

LABEL_32:
        return;
      }
      uint64_t v15 = @"bottom";
      if (a2) {
        uint64_t v15 = @"top";
      }
      NSLog(&cfstr_TheLayoutGuide.isa, v15);
      uint64_t v16 = OBJC_IVAR___UIViewController__lastNotifiedTraitCollection[v8];
      long long v17 = *(void **)(a1 + v16);
      *(void *)(a1 + v16) = 0;
    }
    uint64_t v28 = v8 * 4;
    int v18 = -[UIViewController _useViewBasedTopAndBottomLayoutGuides](a1);
    uint64_t v19 = objc_msgSend(v6, "nsli_superitem");
    double v20 = *(void **)(a1 + 32);

    if (v19 != v20)
    {
      unsigned int v21 = *(void **)(a1 + 32);
      if (v18)
      {
        [v21 addSubview:v6];
      }
      else
      {
        [v21 addLayoutGuide:v6];
        [v6 _setLockedToOwningView:1];
      }
    }
    if (a2) {
      uint64_t v22 = 3;
    }
    else {
      uint64_t v22 = 4;
    }
    uint64_t v23 = +[_UILayoutSupportConstraint constraintWithItem:v6 attribute:v22 relatedBy:0 toItem:*(void *)(a1 + 32) attribute:v22 multiplier:1.0 constant:0.0];
    uint64_t v10 = +[_UILayoutSupportConstraint constraintWithItem:v6 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    id v24 = *(void **)(a1 + 32);
    v29[0] = v10;
    v29[1] = v23;
    double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    [v24 addConstraints:v25];

    double v26 = (double *)(a1 + 880);
    if (!a2) {
      double v26 = (double *)(a1 + 896);
    }
    [v10 setConstant:*v26];
    objc_storeStrong((id *)(a1 + *(int *)((char *)OBJC_IVAR___UIViewController__lastNotifiedTraitCollection + v28)), v10);
    if (v18) {
      objc_msgSend(*(id *)(a1 + 32), "_is_layout");
    }

    goto LABEL_31;
  }
}

- (void)_inferLayoutGuidesFromSubviews
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obuint64_t j = [*(id *)(a1 + 32) layoutGuides];
    uint64_t v2 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v37 != v4) {
            objc_enumerationMutation(obj);
          }
          __int16 v6 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            BOOL v7 = v6;
          }
          else {
            BOOL v7 = 0;
          }
          id v8 = v7;
          id v9 = [v8 identifier];
          char v10 = [v9 isEqualToString:@"_UIViewControllerTop"];
          uint64_t v11 = &OBJC_IVAR___UIViewController__topLayoutGuide;
          if ((v10 & 1) != 0
            || (int v12 = [v9 isEqualToString:@"_UIViewControllerBottom"],
                uint64_t v11 = &OBJC_IVAR___UIViewController__bottomLayoutGuide,
                v12))
          {
            uint64_t v13 = *v11;
            id v14 = v8;
            id v8 = *(id *)(a1 + v13);
            *(void *)(a1 + v13) = v14;
          }
          else
          {
            id v14 = 0;
          }

          uint64_t v15 = [v14 _constraintsToRemoveAtRuntime];
          if ([v15 count])
          {
            [MEMORY[0x1E4F5B268] deactivateConstraints:v15];
            [v14 _setConstraintsToRemoveAtRuntime:0];
          }
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v3);
    }

    if (!*(void *)(a1 + 544) && !*(void *)(a1 + 552))
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id obja = [*(id *)(a1 + 32) subviews];
      uint64_t v16 = [obja countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v33 != v18) {
              objc_enumerationMutation(obja);
            }
            double v20 = *(void **)(*((void *)&v32 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v21 = v20;
              uint64_t v22 = [v21 _archivedIdentifier];
              char v23 = [v22 isEqualToString:@"_UIViewControllerTop"];

              id v24 = &OBJC_IVAR___UIViewController__topLayoutGuide;
              if ((v23 & 1) != 0
                || ([v21 _archivedIdentifier],
                    double v25 = objc_claimAutoreleasedReturnValue(),
                    int v26 = [v25 isEqualToString:@"_UIViewControllerBottom"],
                    v25,
                    id v24 = &OBJC_IVAR___UIViewController__bottomLayoutGuide,
                    v26))
              {
                objc_storeStrong((id *)(a1 + *v24), v20);
                *(void *)(a1 + 376) |= 0x100000000000uLL;
                double v27 = [v21 _constraintsToRemoveAtRuntime];

                if (v27)
                {
                  uint64_t v28 = *(void **)(a1 + 32);
                  int v29 = [v21 _constraintsToRemoveAtRuntime];
                  [v28 removeConstraints:v29];

                  [v21 _setConstraintsToRemoveAtRuntime:0];
                }
              }
            }
          }
          uint64_t v17 = [obja countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v17);
      }
    }
  }
}

- (void)_setFormSheetSize:(CGSize)a3
{
  self->_formSheetSize = a3;
}

- (void)_setAllowsAutorotation:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_unint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (uint64_t)_needsAutomaticContentUnavailableConfigurationUpdates
{
  if (result)
  {
    if (*(void *)(result + 608)
      || ([(id)objc_opt_class() doesOverrideViewControllerMethod:sel__bridgedUpdateContentUnavailableConfigurationUsingState_] & 1) != 0|| (objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_updateContentUnavailableConfigurationUsingState_) & 1) != 0)
    {
      return 1;
    }
    else
    {
      uint64_t v1 = objc_opt_class();
      return [v1 doesOverrideViewControllerMethod:sel__updateContentUnavailableConfigurationUsingState_];
    }
  }
  return result;
}

- (void)_executeViewIsAppearingBlock:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = _Block_copy(*(const void **)(a1 + 320));
    if (v4)
    {
      id v5 = (void (**)(void, void, void))v4;
      do
      {
        __int16 v6 = *(void **)(a1 + 320);
        *(void *)(a1 + 320) = 0;

        v5[2](v5, a1, a2);
        BOOL v7 = _Block_copy(*(const void **)(a1 + 320));

        id v5 = (void (**)(void, void, void))v7;
      }
      while (v7);
    }
  }
}

- (void)viewWillAppear:(BOOL)animated
{
  if ((*(void *)&self->_viewControllerFlags & 6) != 2)
  {
    UIViewControllerAlertForAppearanceCallbackMisuse(@"-viewWillAppear:", self);
    *(void *)&self->_unint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFF7FFFFFFFFFFFF9 | 0x80000000000002;
  }
}

- (void)viewDidAppear:(BOOL)animated
{
  if ((*(void *)&self->_viewControllerFlags & 6) != 4)
  {
    BOOL v3 = animated;
    UIViewControllerAlertForAppearanceCallbackMisuse(@"-viewDidAppear:", self);
    -[UIViewController __viewIsAppearing:skipWindowCheck:]((uint64_t)self, v3, 1);
    *(void *)&self->_unint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFFFFFFFF9 | 4;
  }
}

- (void)viewDidDisappear:(BOOL)animated
{
  if ((*(void *)&self->_viewControllerFlags & 6) != 0)
  {
    UIViewControllerAlertForAppearanceCallbackMisuse(@"-viewDidDisappear:", self);
    *(void *)&self->_viewControllerFlags &= 0xFFFFFFFFFFFFFFF9;
  }
}

- (void)viewWillDisappear:(BOOL)animated
{
  if ((~*(_DWORD *)&self->_viewControllerFlags & 6) != 0)
  {
    UIViewControllerAlertForAppearanceCallbackMisuse(@"-viewWillDisappear:", self);
    *(void *)&self->_viewControllerFlags |= 6uLL;
  }
}

- (uint64_t)_doesSelfOrAncestorPassPredicate:(uint64_t)a1
{
  BOOL v3 = a2;
  if (a1)
  {
    uint64_t v4 = [(id)a1 parentViewController];
    if (v3[2](v3, a1))
    {
      a1 = 1;
    }
    else if (v4)
    {
      a1 = -[UIViewController _doesSelfOrAncestorPassPredicate:](v4, v3);
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (BOOL)isFinishingModalTransition
{
  return (*(void *)&self->_viewControllerFlags >> 17) & 1;
}

uint64_t __32__UIViewController_awakeFromNib__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(void *)(a2 + 376) >> 8) & 1;
}

- (BOOL)_viewControllerWasSelected
{
  return 0;
}

- (NSString)_effectiveInteractionActivityTrackingBaseName
{
  BOOL v3 = [(UIViewController *)self interactionActivityTrackingBaseName];
  if (!v3)
  {
    if (([(UIViewController *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      __int16 v6 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v6);
      goto LABEL_6;
    }
    uint64_t v4 = [(UIViewController *)self nibName];

    if (v4)
    {
      uint64_t v5 = [(UIViewController *)self nibName];
LABEL_6:
      BOOL v3 = (void *)v5;
      goto LABEL_8;
    }
    BOOL v7 = [(UIViewController *)self view];
    BOOL v3 = [v7 accessibilityIdentifier];
  }
LABEL_8:
  return (NSString *)v3;
}

- (NSString)interactionActivityTrackingBaseName
{
  return self->_interactionActivityTrackingBaseName;
}

- (BOOL)_shouldTrackAppearStateChange
{
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_EnableViewControllerInteractionActivityTracking, @"EnableViewControllerInteractionActivityTracking", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& !byte_1EB2570C4)
  {
    return 0;
  }
  BOOL v3 = [a1 parentViewController];
  uint64_t v4 = v3;
  if (v3 && ([v3 isSettingAppearState] & 1) != 0)
  {
    BOOL v2 = 0;
  }
  else
  {
    uint64_t v5 = [a1 _effectiveInteractionActivityTrackingBaseName];
    BOOL v2 = v5 != 0;
  }
  return v2;
}

- (void)__viewWillDisappear:(uint64_t)a1
{
  if (a1)
  {
    if ((~*(_DWORD *)(a1 + 376) & 6) != 0)
    {
      __int16 v3 = *(_WORD *)(a1 + 384);
      *(void *)(a1 + 376) &= ~0x4000000uLL;
      *(_WORD *)(a1 + 384) = v3;
      -[UIViewController _setViewAppearState:isAnimating:](a1, 3, a2);
      -[UIViewController _unloadHierarchyInputAccessoryViewIfNecessary]((void *)a1);
    }
    else
    {
      *(void *)(a1 + 336) = 0;
    }
  }
}

id __42__UIViewController__transitionCoordinator__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 _setChildControllerToIgnoreWhileLookingForTransitionCoordinator:v2];
  uint64_t v4 = [v3 _transitionCoordinator];
  [v3 _setChildControllerToIgnoreWhileLookingForTransitionCoordinator:0];

  return v4;
}

- (void)_setChildControllerToIgnoreWhileLookingForTransitionCoordinator:(id)a3
{
}

- (id)_transitionCoordinator
{
  BOOL v3 = _UIAppUseModernRotationAndPresentationBehaviors();
  if (v3)
  {
    uint64_t v4 = __42__UIViewController__transitionCoordinator__block_invoke(v3, self);
    if (v4)
    {
      uint64_t v5 = v4;
      __int16 v6 = v5;
      goto LABEL_29;
    }
    uint64_t v32 = 0;
    long long v33 = &v32;
    uint64_t v34 = 0x2050000000;
    uint64_t v35 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__UIViewController__transitionCoordinator__block_invoke_2;
    aBlock[3] = &unk_1E52EA0D0;
    aBlock[4] = self;
    id v30 = &__block_literal_global_676;
    uint64_t v31 = &v32;
    BOOL v7 = (void (**)(void *, UIViewController *))_Block_copy(aBlock);
    v33[3] = (uint64_t)v7;
    id v8 = v7[2](v7, self);
    if (v8)
    {
      uint64_t v5 = v8;

      _Block_object_dispose(&v32, 8);
      __int16 v6 = v5;
      goto LABEL_29;
    }

    _Block_object_dispose(&v32, 8);
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __42__UIViewController__transitionCoordinator__block_invoke_3;
  v28[3] = &unk_1E52EA0F8;
  v28[4] = self;
  id v9 = (void (**)(void *, void *))_Block_copy(v28);
  char v10 = [(UIViewController *)self parentViewController];

  if (v10)
  {
    uint64_t v11 = [(UIViewController *)self parentViewController];
    int v12 = v9[2](v9, v11);

    if (v12)
    {
      uint64_t v13 = v12;
LABEL_27:
      uint64_t v5 = v13;
      __int16 v6 = v13;
      goto LABEL_28;
    }
  }
  id v14 = [(UIViewController *)self presentingViewController];

  if (!v14)
  {
    if (_UIAppUseModernRotationAndPresentationBehaviors())
    {
LABEL_13:
      self = 0;
LABEL_26:
      uint64_t v13 = self;
      goto LABEL_27;
    }
    uint64_t v16 = [(UIViewController *)self _existingView];
    uint64_t v17 = [v16 window];

    if (!v17)
    {
      uint64_t v18 = [(UIViewController *)self presentedViewController];

      if (v18)
      {
        uint64_t v19 = [(UIViewController *)self presentedViewController];
      }
      else
      {
        double v20 = [(UIViewController *)self presentingViewController];

        if (!v20) {
          goto LABEL_13;
        }
        uint64_t v19 = [(UIViewController *)self presentingViewController];
      }
      id v21 = v19;
      uint64_t v22 = [v19 _existingView];
      uint64_t v17 = [v22 window];

      if (!v17) {
        goto LABEL_13;
      }
    }
    char v23 = +[UIWindowController windowControllerForWindow:v17];
    id v24 = v23;
    if (self)
    {
      double v25 = [v23 _transitionController];
      if (v25)
      {
        int v26 = +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:v25];
        self = [v26 _transitionCoordinator];
      }
      else
      {
        self = 0;
      }
    }
    goto LABEL_26;
  }
  uint64_t v15 = [(UIViewController *)self presentingViewController];
  __int16 v6 = v9[2](v9, v15);

  uint64_t v5 = 0;
LABEL_28:

LABEL_29:
  return v6;
}

id __42__UIViewController__transitionCoordinator__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 childModalViewController];

  if (!v4
    || ((*(void (**)(void))(*(void *)(a1 + 40) + 16))(), (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    __int16 v6 = objc_msgSend(v3, "childViewControllers", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          int v12 = [*(id *)(a1 + 32) _childControllerToIgnoreWhileLookingForTransitionCoordinator];

          if (v11 != v12)
          {
            uint64_t v13 = (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 16))();
            if (v13)
            {
              uint64_t v5 = (void *)v13;
              goto LABEL_14;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    uint64_t v5 = 0;
LABEL_14:
  }
  return v5;
}

- (UIViewController)_childControllerToIgnoreWhileLookingForTransitionCoordinator
{
  return self->__childControllerToIgnoreWhileLookingForTransitionCoordinator;
}

id __42__UIViewController__transitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = v2;
    do
    {
      uint64_t v5 = [v4 _presentationController];
      __int16 v6 = [v5 _transitionCoordinator];

      if (v6) {
        break;
      }
      __int16 v6 = [v4 presentedViewController];

      uint64_t v4 = v6;
    }
    while (v6);
  }
  else
  {
    uint64_t v4 = 0;
    __int16 v6 = 0;
  }

  return v6;
}

- (uint64_t)_shouldRequestViewControllerForObservableScrollViewFromPresentedViewController
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [a1 _presentationController];
  id v2 = v1;
  if (!v1 || ([v1 dismissing] & 1) != 0 || (objc_msgSend(v2, "dismissed") & 1) != 0) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 _presentedViewControllerProvidesContentScrollView];
  }

  return v3;
}

- (UIPresentationController)_presentationController
{
  return self->_presentationController;
}

- (void)applicationDidResume
{
  uint64_t viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  *(void *)&self->_uint64_t viewControllerFlags = viewControllerFlags & 0xFFFFFFFFFFFFFDFFLL;
  if ((viewControllerFlags & 0x100) != 0) {
    [(UIViewController *)self _updateLayoutForStatusBarAndInterfaceOrientation];
  }
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  id v4 = a3;
  if ((_UIViewControllersInheritTraitsFromViewHierarchy() & 1) != 0
    || (childViewControllers = self->_childViewControllers) == 0
    || [(NSMutableArray *)childViewControllers indexOfObjectIdenticalTo:v4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    __int16 v6 = [(UIViewController *)self traitCollection];
  }
  else
  {
    uint64_t v8 = [(UIViewController *)self overrideTraitCollectionForChildViewController:v4];
    uint64_t v9 = objc_opt_class();
    char v10 = [(UIViewController *)self traitCollection];
    __int16 v6 = [v9 _traitCollectionWithParentTraitCollection:v10 overrideTraitCollection:v8];
  }
  return v6;
}

- (id)_firstResponder
{
  if (![(UIViewController *)self isViewLoaded]
    || ([(UIViewController *)self view],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 _firstResponder],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    v6.receiver = self;
    v6.super_class = (Class)UIViewController;
    id v4 = [(UIResponder *)&v6 _firstResponder];
  }
  return v4;
}

- (BOOL)_canBecomeFirstResponder
{
  if ((~*(_DWORD *)&self->_viewControllerFlags & 6) == 0)
  {
    uint64_t v3 = [(UIResponder *)self _responderWindow];
    int v4 = [v3 _isHostedInAnotherProcess];

    if (!v4) {
      return 0;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)UIViewController;
  return [(UIResponder *)&v6 _canBecomeFirstResponder];
}

- (void)_uip_setTabElement:(id)a3
{
  long long v16 = (_UITabElement *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tab);

  if (WeakRetained)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"UIViewController.m" lineNumber:14729 description:@"Cannot use UITabElement SPI if the view controller already has a tab owner."];
  }
  tabElement = self->_tabElement;
  uint64_t v8 = v16;
  if (tabElement != v16)
  {
    uint64_t v9 = tabElement;
    if (v16)
    {
      char v10 = [(_UITabElement *)v16 _viewController];

      if (v10 != self)
      {
        uint64_t v11 = [(_UITabElement *)v16 _viewController];
        objc_msgSend(v11, "_uip_setTabElement:", 0);
      }
      [(_UITabElement *)v16 _setViewController:self];
    }
    objc_storeStrong((id *)&self->_tabElement, a3);
    int v12 = [(UIViewController *)self parentViewController];
    [v12 updateTabBarItemForViewController:self];

    if (v9) {
      [(_UITabElement *)v9 _setViewController:0];
    }
    uint64_t v13 = [(UIViewController *)self _tabElementChangeObserver];
    id v14 = v13;
    if (v13) {
      [v13 _viewController:self tabElementDidChange:v16 previousElement:v9];
    }

    uint64_t v8 = v16;
  }
}

- (_UIViewControllerTabElementObserver)_tabElementChangeObserver
{
  return (_UIViewControllerTabElementObserver *)objc_getAssociatedObject(self, &_UIViewControllerTabElementChangeObserver);
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  self->_contentOverlayInsets = a3;
}

+ (void)initialize
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    _class_setCustomDeallocInitiation();
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = (void *)qword_1EB25BB38;
    qword_1EB25BB38 = v6;
  }
  else
  {
    uint64_t v3 = self;
    [v3 instanceMethodForSelector:sel_traitCollection];
    uint64_t v4 = dyld_image_header_containing_address();
    [a1 instanceMethodForSelector:sel_traitCollection];
    uint64_t v5 = dyld_image_header_containing_address();

    if (v4 != v5)
    {
      uint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("TraitCollection", &qword_1EB25BB58) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = v8;
        char v10 = NSStringFromClass((Class)a1);
        int v11 = 138412290;
        int v12 = v10;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Class %@ overrides the -traitCollection getter, which is not supported. If you're trying to override traits, you must use the appropriate API.", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)setToolbarItems:(NSArray *)toolbarItems
{
}

- (NSArray)toolbarItems
{
  return self->_toolbarItems;
}

- (void)_setAvoidanceInsetsNeedsUpdate
{
  id v3 = [(UIViewController *)self _existingView];
  id v2 = [v3 window];
  [v2 _noteOverlayInsetsDidChange];
}

- (uint64_t)_tryBecomeRootViewControllerInWindow:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 _delegateViewController];
    if (v5 || ([(id)a1 _popoverController], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      uint64_t v7 = [(id)a1 _existingView];
      uint64_t v8 = [v7 superview];
      uint64_t v9 = [v8 _viewControllerForAncestor];

      if (!v9)
      {
        *(void *)(a1 + 376) |= 0x100uLL;
        [v4 _setDelegateViewController:a1];
        a1 = 1;
        goto LABEL_6;
      }
    }
    a1 = 0;
  }
LABEL_6:

  return a1;
}

- (id)_viewControllerForSupportedInterfaceOrientationsWithDismissCheck:(BOOL)a3
{
  parentViewController = self->_parentViewController;
  if (parentViewController)
  {
    uint64_t v5 = [(UIViewController *)parentViewController _viewControllerForSupportedInterfaceOrientations];
LABEL_3:
    uint64_t v6 = v5;
    goto LABEL_35;
  }
  BOOL v7 = a3;
  uint64_t v8 = [(UIViewController *)self _existingView];
  uint64_t v9 = [v8 window];

  if (!v9)
  {
    if (v7
      && ([(UIViewController *)self childModalViewController],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = -[UIViewController _presentedViewControllerStateIsValidForSourcingSupportedOrientations:](self, v13),
          v13,
          (v14 & 1) == 0))
    {
      -[UIViewController _nearestFullScreenAncestorViewController](self);
      uint64_t v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v15 = [(UIViewController *)self childModalViewController];

      if (v15)
      {
        char v10 = [(UIViewController *)self childModalViewController];
        uint64_t v6 = [v10 _viewControllerForSupportedInterfaceOrientationsWithDismissCheck:v7];
        goto LABEL_34;
      }
      uint64_t v5 = self;
    }
    goto LABEL_3;
  }
  uint64_t v6 = self;
  char v10 = [(UIViewController *)v6 presentedViewController];
  if (!v10) {
    goto LABEL_34;
  }
  int v11 = v6;
  while (!v7
       || -[UIViewController _presentedViewControllerStateIsValidForSourcingSupportedOrientations:](v11, v10))
  {
    int v12 = v10;

    char v10 = [(UIViewController *)v12 presentedViewController];

    int v11 = v12;
    if (!v10) {
      goto LABEL_16;
    }
  }
  int v12 = v11;
LABEL_16:
  if (v12 == v6) {
    goto LABEL_34;
  }
  while (1)
  {
    long long v16 = v12;
    unint64_t v17 = [(UIViewController *)v16 modalPresentationStyle];
    int v18 = dyld_program_sdk_at_least();
    if (v17 == 4) {
      LOBYTE(v19) = 1;
    }
    else {
      unsigned int v19 = (v17 < 0x12) & (0x20021u >> v17);
    }
    char v20 = v18 ? v19 : (v17 < 0x12) & (0x20021u >> v17);
    char v21 = dyld_program_sdk_at_least();
    if (v20 & 1) != 0 || (v21) {
      break;
    }
    uint64_t v22 = [(UIViewController *)v16 _existingPresentationControllerImmediate:1 effective:0];
    if (v22)
    {
      char v23 = v22;
      uint64_t v24 = [v22 presentationStyle];

      if (v24 == 20) {
        goto LABEL_33;
      }
    }
    else
    {
    }
LABEL_31:
    int v12 = [(UIViewController *)v16 presentingViewController];

    if (v12 == v6) {
      goto LABEL_34;
    }
  }

  if ((v20 & 1) == 0) {
    goto LABEL_31;
  }
LABEL_33:
  uint64_t v6 = v16;
LABEL_34:

LABEL_35:
  return v6;
}

- (id)_viewControllerForSupportedInterfaceOrientations
{
  BOOL v3 = _UIAppUseModernRotationAndPresentationBehaviors();
  return [(UIViewController *)self _viewControllerForSupportedInterfaceOrientationsWithDismissCheck:v3];
}

- (BOOL)isBeingPresented
{
  uint64_t viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  if ((~*(_DWORD *)&self->_viewControllerFlags & 0x1800000) == 0) {
    return 1;
  }
  return (viewControllerFlags & 0x100000000200000) != 0
      && (viewControllerFlags & 0x800000) != 0
      && ((viewControllerFlags >> 1) & 3) - 1 < 2;
}

- (uint64_t)_presentedViewControllerStateIsValidForSourcingSupportedOrientations:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (_UIAppUseModernRotationAndPresentationBehaviors())
    {
      uint64_t v4 = [a1 _presentationController];
      uint64_t v5 = v4;
      if (v4
        && ([v4 presentedViewController],
            id v6 = (id)objc_claimAutoreleasedReturnValue(),
            v6,
            v6 == v3)
        && (([v3 transitionCoordinator],
             BOOL v7 = objc_claimAutoreleasedReturnValue(),
             int v8 = [v7 isCancelled],
             v7,
             ![v5 presenting])
         || (v8 & 1) == 0))
      {
        uint64_t v9 = [v5 dismissing] ^ 1 | v8;
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v10 = [a1 currentAction];
      uint64_t v5 = (void *)v10;
      if (v10 && *(__CFString **)(v10 + 8) == @"DismissModal")
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v10 + 40));
        uint64_t v9 = WeakRetained != v3;
      }
      else
      {
        uint64_t v9 = 1;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)window:(id)a3 setupWithInterfaceOrientation:(int64_t)a4
{
  id v12 = a3;
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    int64_t v6 = [(UIViewController *)self _lastKnownInterfaceOrientation];
    if (self) {
      self->_lastKnownInterfaceOrientation = a4;
    }
    BOOL v7 = -[UIViewController viewControllerForRotation](self);
    if ([v7 _useSheetRotation])
    {
      uint64_t viewControllerFlags = (uint64_t)self->_viewControllerFlags;

      id v9 = v12;
      if ((viewControllerFlags & 0x100) == 0)
      {
        [(UIViewController *)self window:v12 resizeFromOrientation:v6];
        goto LABEL_9;
      }
    }
    else
    {

      id v9 = v12;
    }
    uint64_t v10 = [(UIViewController *)self rotatingContentViewForWindow:v9];
    [(UIViewController *)self _centerForOrientation:a4];
    objc_msgSend(v10, "setCenter:");
    [(UIViewController *)self _boundsForOrientation:a4];
    objc_msgSend(v10, "setBounds:");
    int v11 = [v10 layer];
    [v11 layoutIfNeeded];
  }
LABEL_9:
}

- (id)_nearestFullScreenAncestorViewController
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = [a1 presentingViewController];
    if (v2)
    {
      if ([v1 modalPresentationStyle])
      {
        -[UIViewController _nearestFullScreenAncestorViewController](v2);
        id v3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v3 = v1;
      }
      uint64_t v1 = v3;
    }
    else
    {
      uint64_t v4 = v1;
      uint64_t v5 = -[UIViewController _parentViewController](v4);

      if (v5)
      {
        do
        {
          uint64_t v1 = -[UIViewController _parentViewController](v4);

          int64_t v6 = -[UIViewController _parentViewController]((id *)v1);

          uint64_t v4 = (id *)v1;
        }
        while (v6);
      }
      else
      {
        uint64_t v1 = v4;
      }
    }
  }
  return v1;
}

- (BOOL)isBeingDismissed
{
  uint64_t viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  if ((viewControllerFlags & 0x1800000) == 0x800000) {
    return 1;
  }
  return (viewControllerFlags & 0x100000000200000) != 0
      && (viewControllerFlags & 0x800000) != 0
      && ((viewControllerFlags >> 1) & 3) - 3 < 0xFFFFFFFE;
}

- (uint64_t)_isPresentingInWindow:(void *)a1
{
  id v3 = a2;
  if (a1 && ([a1 presentedViewController], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v5 = (void *)v4;
    while (1)
    {
      if ([v5 isViewLoaded])
      {
        int64_t v6 = [v5 view];
        id v7 = [v6 window];

        if (v7 == v3) {
          break;
        }
      }
      uint64_t v8 = [v5 presentedViewController];

      uint64_t v5 = (void *)v8;
      if (!v8) {
        goto LABEL_10;
      }
    }
    uint64_t v8 = 1;
LABEL_10:
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)setTabBarItem:(UITabBarItem *)tabBarItem
{
  uint64_t v5 = tabBarItem;
  if (self->_tabBarItem != v5)
  {
    id v12 = v5;
    objc_storeStrong((id *)&self->_tabBarItem, tabBarItem);
    int64_t v6 = [(UIViewController *)self parentViewController];
    [v6 updateTabBarItemForViewController:self];

    if (dyld_program_sdk_at_least()
      && ([(UIViewController *)self tab], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      uint64_t v8 = [(UIViewController *)self tab];
    }
    else
    {
      id v9 = [(UIViewController *)self _uip_tabElement];

      if (!v9)
      {
        int v11 = [(UIViewController *)self _fallbackTabElementCreateIfNeeded:0];
        uint64_t v10 = v11;
        if (v11) {
          [v11 _reloadTabBarItem];
        }
        goto LABEL_8;
      }
      uint64_t v8 = [(UIViewController *)self _uip_tabElement];
    }
    uint64_t v10 = v8;
    [v8 _updateLinkedTabBarItem];
LABEL_8:

    uint64_t v5 = v12;
  }
}

- (_UITabElement)_resolvedTab
{
  id v3 = [(UIViewController *)self _uip_tabElement];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIViewController *)self _fallbackTabElementCreateIfNeeded:1];
  }
  int64_t v6 = v5;

  return (_UITabElement *)v6;
}

- (_UITabElement)_uip_tabElement
{
  return self->_tabElement;
}

- (UITabBarItem)tabBarItem
{
  tabBarItem = self->_tabBarItem;
  if (!tabBarItem)
  {
    uint64_t v4 = [UITabBarItem alloc];
    id v5 = [(UIViewController *)self title];
    int64_t v6 = [(UITabBarItem *)v4 initWithTitle:v5 image:0 tag:0];
    id v7 = self->_tabBarItem;
    self->_tabBarItem = v6;

    tabBarItem = self->_tabBarItem;
  }
  return tabBarItem;
}

- (id)_fallbackTabElementCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  objc_getAssociatedObject(self, &_UIViewControllerFallbackTabElement);
  id v5 = (_UITabBarItemBridgedElement *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6)
  {
    id v5 = [[_UITabBarItemBridgedElement alloc] initWithViewController:self];
    objc_setAssociatedObject(self, &_UIViewControllerFallbackTabElement, v5, (void *)1);
  }
  return v5;
}

- (id)_windowForAutorotationBelowWindow:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    [v3 level];
    uint64_t v6 = v5;
    id v7 = [a1 _window];
    uint64_t v8 = [v7 _windowHostingScene];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__UIViewController__windowForAutorotationBelowWindow___block_invoke;
    v10[3] = &unk_1E52EA198;
    id v11 = v4;
    uint64_t v12 = v6;
    a1 = [v8 _topVisibleWindowPassingTest:v10];
  }
  return a1;
}

uint64_t __54__UIViewController__windowForAutorotationBelowWindow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 32) && ([v3 level], v5 > *(double *)(a1 + 40))) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = [v4 _shouldControlAutorotation];
  }

  return v6;
}

- (BOOL)isInWillRotateCallback
{
  return (*(void *)&self->_viewControllerFlags >> 16) & 1;
}

- (void)_updateLastKnownInterfaceOrientationOnPresentionStack:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = [(id)a1 _window];
    char v5 = [v4 _windowOwnsInterfaceOrientation];

    if (v5)
    {
      if (([(id)a1 _isPresentedFormSheet] & 1) == 0
        && [(id)a1 shouldAutorotate])
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __74__UIViewController__updateLastKnownInterfaceOrientationOnPresentionStack___block_invoke;
        v15[3] = &unk_1E52E0000;
        v15[4] = a1;
        v15[5] = a2;
        -[UIViewController __withSupportedInterfaceOrientation:apply:]((void *)a1, a2, v15);
      }
    }
    else
    {
      *(void *)(a1 + 264) = a2;
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = *(id *)(a1 + 112);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          -[UIViewController _updateLastKnownInterfaceOrientationOnPresentionStack:](*(void *)(*((void *)&v11 + 1) + 8 * v10++), a2);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

void __59__UIViewController_setNeedsWhitePointAdaptivityStyleUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v2 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v4 = [v5 _systemAppearanceManager];
    [v4 updateWhitePointAdaptivityStyle];
  }
}

- (id)_effectiveWhitePointAdaptivityStyleViewController
{
  id v3 = [(UIViewController *)self _presentedStatusBarViewController];
  uint64_t v4 = [v3 _effectiveWhitePointAdaptivityStyleViewController];

  if (!v4)
  {
    id v5 = [(UIViewController *)self childViewControllerForWhitePointAdaptivityStyle];
    uint64_t v4 = [v5 _effectiveWhitePointAdaptivityStyleViewController];

    if (!v4) {
      uint64_t v4 = self;
    }
  }
  return v4;
}

- (int64_t)_preferredWhitePointAdaptivityStyle
{
  id v2 = (void *)UIApp;
  id v3 = [(UIViewController *)self _window];
  int64_t v4 = [v2 _normativeWhitePointAdaptivityStyleForWindow:v3];

  return v4;
}

- (id)_childViewControllerForWhitePointAdaptivityStyle
{
  return 0;
}

void __53__UIViewController_setNeedsStatusBarAppearanceUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v2 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int64_t v4 = [v5 statusBarManager];
    [v4 updateStatusBarAppearanceWithAnimationParameters:_CurrentStatusBarAppearanceUpdateAnimationParameters];
  }
}

- (id)_effectiveStatusBarStyleViewController
{
  id v3 = [(UIViewController *)self _presentedStatusBarViewController];
  int64_t v4 = [v3 _effectiveStatusBarStyleViewController];

  if (v4)
  {
    id v5 = v4;
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = [(UIViewController *)self _existingPresentationControllerImmediate:0 effective:1 includesRoot:1];
    uint64_t v8 = v7;
    if (!v7
      || ([v7 _shouldPresentedViewControllerControlStatusBarAppearance] & 1) != 0
      || ([v8 presentedViewController],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 modalPresentationCapturesStatusBarAppearance],
          v9,
          v10))
    {
      long long v11 = [(UIViewController *)self childViewControllerForStatusBarStyle];
      long long v12 = [v11 _effectiveStatusBarStyleViewController];

      if (v12)
      {
        id v5 = v12;
        id v6 = v5;
      }
      else
      {
        id v6 = self;
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
      id v6 = 0;
    }
  }
  return v6;
}

void __59__UIViewController_setNeedsUpdateOfHomeIndicatorAutoHidden__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v2 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int64_t v4 = [v5 _systemAppearanceManager];
    [v4 updateHomeIndicatorAutoHidden];
  }
}

void __70__UIViewController_setNeedsUpdateOfScreenEdgesDeferringSystemGestures__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v2 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int64_t v4 = [v5 _systemAppearanceManager];
    [v4 updateScreenEdgesDeferringSystemGestures];
  }
}

- (id)_effectiveHomeIndicatorAutoHiddenViewController
{
  id v3 = [(UIViewController *)self _presentedStatusBarViewController];
  int64_t v4 = [v3 _effectiveHomeIndicatorAutoHiddenViewController];

  if (!v4)
  {
    id v5 = [(UIViewController *)self childViewControllerForHomeIndicatorAutoHidden];
    int64_t v4 = [v5 _effectiveHomeIndicatorAutoHiddenViewController];

    if (!v4) {
      int64_t v4 = self;
    }
  }
  return v4;
}

- (id)_effectiveScreenEdgesDeferringSystemGesturesViewController
{
  id v3 = [(UIViewController *)self _presentedStatusBarViewController];
  int64_t v4 = [v3 _effectiveScreenEdgesDeferringSystemGesturesViewController];

  if (!v4)
  {
    id v5 = [(UIViewController *)self childViewControllerForScreenEdgesDeferringSystemGestures];
    int64_t v4 = [v5 _effectiveScreenEdgesDeferringSystemGesturesViewController];

    if (!v4) {
      int64_t v4 = self;
    }
  }
  return v4;
}

- (UIViewController)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return 0;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return 0;
}

- (UIViewController)childViewControllerForHomeIndicatorAutoHidden
{
  return 0;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 0;
}

- (UIRectEdge)preferredScreenEdgesDeferringSystemGestures
{
  return 0;
}

- (BOOL)modalPresentationCapturesStatusBarAppearance
{
  return self->_modalPresentationCapturesStatusBarAppearance;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
  return 0;
}

- (UIStatusBarStyleAnimationParameters)_preferredStatusBarStyleAnimationParameters
{
  return 0;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (UIStatusBarHideAnimationParameters)_preferredStatusBarHideAnimationParameters
{
  return 0;
}

- (BOOL)_navControllerIsLayingOutTopViewController
{
  id v2 = [(UIViewController *)self navigationController];
  char v3 = [v2 _isLayingOutTopViewController];

  return v3;
}

- (void)_unloadHierarchyInputAccessoryViewIfNecessary
{
  if (a1)
  {
    -[UIViewController _keyboardSceneDelegate](a1);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v2 = [MEMORY[0x1E4F29238] valueWithPointer:a1];
    [v3 _endPersistingInputAccessoryViewWithId:v2];
  }
}

- (id)_keyboardSceneDelegate
{
  if (a1)
  {
    uint64_t v1 = [a1 _window];
    id v2 = [v1 windowScene];
    id v3 = [v2 keyboardSceneDelegate];

    if (!v3)
    {
      id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

void __27__UIViewController_dealloc__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 _clearPreservedInputViewsWithRestorableResponder:v3];
  id v5 = [MEMORY[0x1E4F29238] valueWithPointer:*(void *)(a1 + 32)];
  [v4 _clearPreservedInputViewsWithId:v5 clearKeyboard:0];

  id v6 = [MEMORY[0x1E4F29238] valueWithPointer:*(void *)(a1 + 32)];
  [v4 _endPersistingInputAccessoryViewWithId:v6];
}

- (void)updateTraitsIfNeeded
{
  if (self->_view) {
    [(UIView *)self->_view updateTraitsIfNeeded];
  }
  else {
    -[UIViewController _updateTraitsIfNecessarySchedulingPropagation:]((uint64_t)self, 0);
  }
}

- (void)addKeyCommand:(UIKeyCommand *)keyCommand
{
  v10[1] = *MEMORY[0x1E4F143B8];
  addedKeyCommands = self->_addedKeyCommands;
  if (addedKeyCommands)
  {
    id v6 = [(NSArray *)addedKeyCommands arrayByAddingObject:keyCommand];
  }
  else
  {
    v10[0] = keyCommand;
    uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v8 = keyCommand;
    id v6 = [v7 arrayWithObjects:v10 count:1];
  }
  uint64_t v9 = self->_addedKeyCommands;
  self->_addedKeyCommands = v6;
}

- (BOOL)useLayoutToLayoutNavigationTransitions
{
  return 0;
}

- (void)setTitle:(NSString *)title
{
  id v4 = title;
  if (self->_title != v4)
  {
    long long v11 = v4;
    id v5 = (NSString *)[(NSString *)v4 copy];
    id v6 = self->_title;
    self->_title = v5;

    uint64_t v7 = [(UIViewController *)self _existingNavigationItem];
    [v7 setTitle:v11];

    if (!dyld_program_sdk_at_least()
      || ([(UIViewController *)self tab], uint64_t v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
    {
      uint64_t v9 = [(UIViewController *)self _existingTabBarItem];
      [v9 setTitle:v11];
    }
    int v10 = [(UIViewController *)self parentViewController];
    [v10 updateTitleForViewController:self];

    id v4 = v11;
  }
}

- (id)_registerForTraitTokenChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v8 = a3;
  uint64_t v9 = (UIViewController *)a4;
  traitChangeRegistrdouble y = self->_traitChangeRegistry;
  if (!traitChangeRegistry)
  {
    long long v11 = objc_alloc_init(_UITraitChangeRegistry);
    long long v12 = self->_traitChangeRegistry;
    self->_traitChangeRegistrdouble y = v11;

    traitChangeRegistrdouble y = self->_traitChangeRegistry;
  }
  long long v13 = -[_UITraitChangeRegistry registerForTraitTokenChanges:withTarget:action:targetIsSender:]((uint64_t)traitChangeRegistry, v8, v9, a5, v9 == self);

  return v13;
}

- (NSString)title
{
  id v2 = (void *)[(NSString *)self->_title copy];
  return (NSString *)v2;
}

- (void)_setNeedsResolutionOfPhysicalButtonConfigurations
{
  if (a1)
  {
    uint64_t v1 = [a1 _existingView];
    id v4 = [v1 window];

    id v2 = [v4 _eventRoutingScene];
    uint64_t v3 = [v2 _existingPhysicalButtonInteractionArbiter];

    if (v3) {
      -[_UIPhysicalButtonInteractionArbiter _setNeedsResolutionOfPhysicalButtonConfigurationsInWindow:forReason:]((uint64_t)v3, v4, 1uLL);
    }
  }
}

- (id)_existingTabBarItem
{
  return self->_tabBarItem;
}

+ (BOOL)_shouldDeferTransitions
{
  return _ShouldDeferTransitions;
}

- (id)_uiCollectionView
{
  return 0;
}

- (UITab)tab
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tab);
  return (UITab *)WeakRetained;
}

- (BOOL)_usesSharedView
{
  return (*(void *)&self->_viewControllerFlags >> 36) & 1;
}

- (BOOL)hidesBottomBarWhenPushed
{
  return (*(void *)&self->_viewControllerFlags >> 5) & 1;
}

- (BOOL)_suppressesBottomBar
{
  return (*(void *)&self->_viewControllerFlags >> 29) & 1;
}

- (void)endAppearanceTransition
{
}

- (void)setFinishingModalTransition:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (void)setPerformingModalTransition:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (void)viewWillMoveToWindow:(id)a3
{
  id v18 = a3;
  BOOL v4 = [(UIViewController *)self isPerformingModalTransition];
  id v5 = v18;
  if (v4) {
    goto LABEL_24;
  }
  id v6 = [(UIViewController *)self->_parentModalViewController presentedViewController];

  if (v6 != self)
  {
    uint64_t v7 = [(UIViewController *)self parentViewController];
    int v8 = [(UIViewController *)self _appearState];
    if (v18)
    {
      uint64_t v9 = [v7 _existingView];
      id v10 = [v9 window];
      if (v10 == v18
        && -[UIViewController _didSelfOrAncestorBeginAppearanceTransition]((uint64_t *)v7)
        && !self->_explicitAppearanceTransitionLevel)
      {
        long long v16 = [(UIViewController *)self parentViewController];
        BOOL v11 = [v16 _appearState] == 1 && v8 == 0;
      }
      else
      {
        BOOL v11 = 0;
      }

      if (!v7) {
        goto LABEL_14;
      }
    }
    else
    {
      BOOL v11 = 0;
      if (!v7) {
        goto LABEL_14;
      }
    }
    if ([v7 _appearState] != 2
      && [v7 isSettingAppearState]
      && ([v7 containmentSupport] & 1) != 0)
    {
LABEL_20:

      goto LABEL_21;
    }
LABEL_14:
    long long v12 = [(UIViewController *)self _popoverController];
    if (([v12 _manuallyHandlesContentViewControllerAppearanceCalls] & 1) != 0
      || (*(void *)&self->_viewControllerFlags & 0x8000000) != 0)
    {
    }
    else
    {
      int v13 = -[UIViewController _didSelfOrAncestorBeginAppearanceTransition]((uint64_t *)self) ^ 1 | v11;

      if (v13 == 1)
      {
        unint64_t viewControllerFlags = (unint64_t)self->_viewControllerFlags;
        if (v18) {
          [(UIViewController *)self __viewWillAppear:(viewControllerFlags >> 22) & 1];
        }
        else {
          -[UIViewController __viewWillDisappear:]((uint64_t)self, (viewControllerFlags >> 22) & 1);
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  id v5 = v18;
  if (!v18)
  {
    BOOL v15 = [(UIViewController *)self _isRootViewController];
    id v5 = 0;
    if (v15) {
      *(void *)&self->_viewControllerFlags &= ~0x100uLL;
    }
  }
LABEL_24:
}

- (uint64_t)_didSelfOrAncestorBeginAppearanceTransition
{
  if (!a1) {
    return 0;
  }
  if (a1[42] > 0) {
    return 1;
  }
  uint64_t v2 = [a1 parentViewController];
  uint64_t v3 = (void *)v2;
  if (v2) {
    uint64_t v1 = -[UIViewController _didSelfOrAncestorBeginAppearanceTransition](v2);
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

- (void)__viewWillAppear:(BOOL)a3
{
  if ((*(void *)&self->_viewControllerFlags & 6) == 2)
  {
    self->_explicitAppearanceTransitionLevel = 0;
  }
  else
  {
    BOOL v4 = a3;
    __int16 v5 = *((_WORD *)&self->_viewControllerFlags + 4);
    *(void *)&self->_viewControllerFlags |= 0x4000000uLL;
    *((_WORD *)&self->_viewControllerFlags + 4) = v5;
    [(UIViewController *)self loadViewIfRequired];
    -[UIViewController _setViewAppearState:isAnimating:]((uint64_t)self, 1, v4);
    if ([(UIViewController *)self _shouldLoadInputAccessoryViewsOnAppearance])
    {
      uint64_t v13 = 0;
      long long v14 = (id *)&v13;
      uint64_t v15 = 0x3032000000;
      long long v16 = __Block_byref_object_copy__61;
      uint64_t v17 = __Block_byref_object_dispose__61;
      id v18 = 0;
      if ([(UIResponder *)self _ownsInputAccessoryView])
      {
        objc_storeStrong(v14 + 5, self);
      }
      else
      {
        id v6 = [_UIViewBlockVisitor alloc];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __63__UIViewController__loadHierarchyInputAccessoryViewIfNecessary__block_invoke;
        v12[3] = &unk_1E52EA018;
        v12[4] = self;
        void v12[5] = &v13;
        uint64_t v7 = [(_UIViewBlockVisitor *)v6 initWithTraversalDirection:2 visitorBlock:v12];
        int v8 = [(UIViewController *)self view];
        [v8 _receiveVisitor:v7];
      }
      if (v14[5])
      {
        uint64_t v9 = -[UIViewController _keyboardSceneDelegate](self);
        id v10 = v14[5];
        BOOL v11 = [MEMORY[0x1E4F29238] valueWithPointer:self];
        [v9 _beginPersistingInputAccessoryViewForResponder:v10 withId:v11];
      }
      _Block_object_dispose(&v13, 8);
    }
  }
}

- (BOOL)_shouldLoadInputAccessoryViewsOnAppearance
{
  return 0;
}

- (void)_setExpectedWindow:(id)a3
{
}

- (void)setAppearanceTransitionsAreDisabled:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_unint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (double)durationForTransition:(int)a3
{
  +[UITransitionView defaultDurationForTransition:*(void *)&a3];
  return result;
}

- (void)_presentingViewControllerDidChange:(id)a3
{
  *(void *)&self->_viewControllerFlags &= ~0x800000uLL;
}

- (id)_modalPreservedFirstResponder
{
  if (a1)
  {
    a1 = (id *)a1[17];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setTransitioningDelegate:(id)transitioningDelegate
{
  obuint64_t j = transitioningDelegate;
  dyld_program_sdk_at_least();
  objc_storeWeak((id *)&self->_transitioningDelegate, obj);
}

- (void)setModalTransitionStyle:(UIModalTransitionStyle)modalTransitionStyle
{
  self->_modalTransitionStyle = modalTransitionStyle;
}

- (void)setModalPresentationStyle:(UIModalPresentationStyle)modalPresentationStyle
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_modalPresentationStyle != modalPresentationStyle)
  {
    self->_UIModalPresentationStyle modalPresentationStyle = modalPresentationStyle;
    if (self->_temporaryPresentationController)
    {
      if (os_variant_has_internal_diagnostics())
      {
        id v6 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          int v8 = 138412290;
          uint64_t v9 = self;
          _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Setting modalPresentationStyle once presentationController has been accessed will have no effect until %@ is presented, dismissed, and presented again.", (uint8_t *)&v8, 0xCu);
        }
      }
      else
      {
        BOOL v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25BBA0) + 8);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          int v8 = 138412290;
          uint64_t v9 = self;
          _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Setting modalPresentationStyle once presentationController has been accessed will have no effect until %@ is presented, dismissed, and presented again.", (uint8_t *)&v8, 0xCu);
        }
      }
    }
    if (self->_parentModalViewController)
    {
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v7 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          int v8 = 138412290;
          uint64_t v9 = self;
          _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Setting modalPresentationStyle once %@ has been presented will have no effect until it is dismissed and presented again.", (uint8_t *)&v8, 0xCu);
        }
      }
      else
      {
        __int16 v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25BBA8) + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          int v8 = 138412290;
          uint64_t v9 = self;
          _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Setting modalPresentationStyle once %@ has been presented will have no effect until it is dismissed and presented again.", (uint8_t *)&v8, 0xCu);
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewControllerForPreferredContainerBackgroundStyle, 0);
  objc_destroyWeak((id *)&self->__departingParentViewController);
  objc_destroyWeak((id *)&self->_preferredFocusedItem);
  objc_storeStrong((id *)&self->_temporaryPresentationController, 0);
  objc_storeStrong((id *)&self->_originalPresentationController, 0);
  objc_storeStrong((id *)&self->__embeddingView, 0);
  objc_storeStrong((id *)&self->__embeddedView, 0);
  objc_storeStrong((id *)&self->_storyboardPreviewingRegistrants, 0);
  objc_storeStrong((id *)&self->_storyboardCommitSegueTemplates, 0);
  objc_storeStrong((id *)&self->_storyboardPreviewSegueTemplates, 0);
  objc_storeStrong((id *)&self->_navigationInsetAdjustment, 0);
  objc_destroyWeak((id *)&self->_presentingFocusedItem);
  objc_storeStrong((id *)&self->__childControllerToIgnoreWhileLookingForTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_preferredTransition, 0);
  objc_storeStrong((id *)&self->_spiTransition, 0);
  objc_storeStrong((id *)&self->_presentedUserInterfaceStyleViewController, 0);
  objc_storeStrong((id *)&self->_presentedStatusBarViewController, 0);
  objc_storeStrong((id *)&self->_expectedWindow, 0);
  objc_storeStrong((id *)&self->_segueResponsibleForModalPresentation, 0);
  objc_storeStrong((id *)&self->_storyboardSegueTemplates, 0);
  objc_storeStrong((id *)&self->_contentUnavailableWrapperView, 0);
  objc_storeStrong((id *)&self->_effectiveContentScrollViews, 0);
  objc_storeStrong((id *)&self->_internalContentScrollView, 0);
  objc_storeStrong((id *)&self->_observableScrollViews, 0);
  objc_storeStrong((id *)&self->_interactionActivityTrackingBaseName, 0);
  objc_storeStrong((id *)&self->_bottomBarInsetGuideConstraint, 0);
  objc_storeStrong((id *)&self->_topBarInsetGuideConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLayoutGuide, 0);
  objc_storeStrong((id *)&self->_topLayoutGuide, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_lastNotifiedTraitCollection, 0);
  objc_storeStrong((id *)&self->_customTransitioningView, 0);
  objc_storeStrong((id *)&self->_childViewControllers, 0);
  objc_storeStrong((id *)&self->_accessibilityHUD, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistry, 0);
  objc_storeStrong((id *)&self->_traitOverrides, 0);
  objc_storeStrong((id *)&self->_frozenTraitCollection, 0);
  objc_destroyWeak((id *)&self->_transitioningDelegate);
  objc_storeStrong((id *)&self->_storyboardIdentifier, 0);
  objc_storeStrong((id *)&self->_previewSourceViews, 0);
  objc_storeStrong((id *)&self->_overrideTraitCollectionsForChildren, 0);
  objc_storeStrong((id *)&self->_addedKeyCommands, 0);
  objc_storeStrong((id *)&self->_interfaceBuilderKeyCommands, 0);
  objc_storeStrong(&self->_afterAppearance, 0);
  objc_storeStrong(&self->_atViewIsAppearing, 0);
  objc_storeStrong((id *)&self->_recordedContentScrollView, 0);
  objc_destroyWeak((id *)&self->_popoverController);
  objc_storeStrong((id *)&self->_appearStateActivityToken, 0);
  objc_storeStrong((id *)&self->_strongSearchDisplayController, 0);
  objc_destroyWeak((id *)&self->_searchDisplayController);
  objc_destroyWeak((id *)&self->_windowOfRootViewController);
  objc_storeStrong((id *)&self->_editButtonItem, 0);
  objc_storeStrong((id *)&self->_savedFooterSuperview, 0);
  objc_storeStrong((id *)&self->_savedHeaderSuperview, 0);
  objc_storeStrong((id *)&self->_topLevelObjectsToKeepAliveFromStoryboard, 0);
  objc_storeStrong((id *)&self->_externalObjectsTableForViewLoading, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
  objc_storeStrong((id *)&self->_currentAction, 0);
  objc_storeStrong(&self->_dropShadowView, 0);
  objc_storeStrong(&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_modalPreservedFirstResponder, 0);
  objc_destroyWeak((id *)&self->_previousRootViewController);
  objc_storeStrong((id *)&self->_childModalViewControllers, 0);
  objc_storeStrong((id *)&self->_nibBundle, 0);
  objc_storeStrong((id *)&self->_nibName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_toolbarItems, 0);
  objc_storeStrong((id *)&self->_navigationItem, 0);
  objc_storeStrong((id *)&self->_tabElement, 0);
  objc_destroyWeak((id *)&self->_tab);
  objc_storeStrong((id *)&self->_tabBarItem, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_overrideTransitioningDelegate, 0);
}

- (id)_contentScrollView
{
  if ((~*(void *)&self->_viewControllerFlags & 0x1200000000000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v4 = [(UIViewController *)self contentScrollView];
  uint64_t v2 = (void *)v4;
  uint64_t viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  if ((viewControllerFlags & 0x200000000000000) != 0 && (viewControllerFlags & 0x800000000000000) == 0)
  {
    if (v4)
    {
      __int16 v6 = *((_WORD *)&self->_viewControllerFlags + 4);
      *(void *)&self->_uint64_t viewControllerFlags = viewControllerFlags | 0x800000000000000;
      *((_WORD *)&self->_viewControllerFlags + 4) = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        *(void *)&self->_viewControllerFlags |= 0x1000000000000000uLL;

LABEL_2:
        uint64_t v2 = 0;
      }
    }
  }
  return v2;
}

- (void)setDropShadowView:(id)a3
{
}

- (id)_backgroundColorForModalFormSheet
{
  return +[UIDimmingView defaultDimmingColor];
}

- (id)_effectiveControllersForAlwaysOnTimelines
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIViewController *)self presentedViewController];
  uint64_t v4 = [v3 _effectiveControllersForAlwaysOnTimelines];

  if (!v4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend((id)-[UIViewController performSelector:](self, "performSelector:", sel_puic_childViewControllerForAlwaysOnTimelines), "_effectiveControllersForAlwaysOnTimelines"), (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      __int16 v5 = [(UIViewController *)self _childViewControllersForAlwaysOnTimelines];
      __int16 v6 = [MEMORY[0x1E4F1CA48] array];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __85__UIViewController__UIAlwaysOnEnvironment___effectiveControllersForAlwaysOnTimelines__block_invoke;
      _OWORD v9[3] = &unk_1E52DC4C0;
      id v7 = v6;
      id v10 = v7;
      [v5 enumerateObjectsUsingBlock:v9];
      uint64_t v4 = [v7 count] ? objc_msgSend(v7, "copy") : 0;

      if (!v4)
      {
        v11[0] = self;
        uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      }
    }
  }
  return v4;
}

- (id)_childViewControllersForAlwaysOnTimelines
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(UIViewController *)self _childViewControllerForAlwaysOnTimelines];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_childViewControllerForAlwaysOnTimelines
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(UIViewController *)self performSelector:sel_puic_childViewControllerForAlwaysOnTimelines];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

uint64_t __62__UIViewController_presentViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)disablesAutomaticKeyboardDismissal
{
  if ([(UIViewController *)self modalPresentationStyle] != 16
    && [(UIViewController *)self modalPresentationStyle] != UIModalPresentationFormSheet)
  {
    return 0;
  }
  return [(UIViewController *)self _shouldAutoPinInputViewsForModalFormSheet];
}

- (BOOL)_shouldAutoPinInputViewsForModalFormSheet
{
  return 1;
}

- (void)_didFinishPresentTransition
{
  id v11 = [(UIViewController *)self presentedViewController];
  if (v11)
  {
    currentAction = self->_currentAction;
    if (currentAction)
    {
      if (currentAction->_transition == 13)
      {
        double curlUpRevealedHeight = currentAction->_curlUpRevealedHeight;
        double v12 = curlUpRevealedHeight;
        __int16 v5 = v11;
        if (curlUpRevealedHeight == 0.0)
        {
          __int16 v6 = [v11 view];
          [v6 bounds];
          _UIViewCurlUpTransitionToTime(&v12, v7, v8);

          __int16 v5 = v11;
          double curlUpRevealedHeight = v12;
        }
        -[UIViewController _addCurlUpTapGestureRecognizerWithRevealedHeight:](v5, curlUpRevealedHeight);
      }
    }
  }
  *(void *)&self->_viewControllerFlags &= ~0x400000uLL;
  uint64_t v9 = self->_currentAction;
  self->_currentAction = 0;

  id v10 = [(UIViewController *)self _rootAncestorViewController];
  [v10 setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (void)_viewSubtreeDidGainScrollView:(id)a3 enclosingViewController:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id v7 = [(UIViewController *)self _contentOrObservableScrollViewForEdge:1];

  if (self)
  {
    if (v7 == v23)
    {
      [(UIViewController *)self _navigationControllerContentInsetAdjustment];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      long long v16 = [(UIViewController *)self navigationInsetAdjustment];
      uint64_t v17 = [v16 adjustedScrollView];
      id v18 = [(UIViewController *)self _contentOrObservableScrollViewForEdge:1];

      if (v17 != v18)
      {
        unsigned int v19 = [(UIViewController *)self navigationInsetAdjustment];
        objc_msgSend(v19, "setInsetAdjustment:", 0.0, 0.0, 0.0, 0.0);

        -[UIViewController _setNavigationControllerContentInsetAdjustment:](self, "_setNavigationControllerContentInsetAdjustment:", v9, v11, v13, v15);
      }
    }
  }
  char v20 = [(UIViewController *)self parentViewController];
  char v21 = v20;
  if (v20)
  {
    [v20 _viewSubtreeDidGainScrollView:v23 enclosingViewController:v6];
  }
  else
  {
    uint64_t v22 = [(UIViewController *)self presentingViewController];
    [v22 _viewSubtreeDidGainScrollView:v23 enclosingViewController:v6];
  }
}

- (id)_viewControllerForObservableScrollView
{
  if (-[UIViewController _shouldRequestViewControllerForObservableScrollViewFromPresentedViewController](self))
  {
    uint64_t v3 = [(UIViewController *)self presentedViewController];
    uint64_t v4 = [v3 _viewControllerForObservableScrollView];
  }
  else
  {
    uint64_t v4 = self;
  }
  return v4;
}

uint64_t __88__UIViewController__setPresentedStatusBarViewController_shouldJoinAnimationsInProgress___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(result + 32);
  if (v1)
  {
    [*(id *)(result + 32) setNeedsStatusBarAppearanceUpdate];
    [v1 _setNeedsUserInterfaceAppearanceUpdate];
    return [v1 setNeedsWhitePointAdaptivityStyleUpdate];
  }
  return result;
}

- (void)_updateTabBarLayout
{
  uint64_t v3 = objc_opt_class();
  -[UIViewController _ancestorViewControllerOfClass:allowModalParent:]((uint64_t)self, v3, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 _updateTabBarLayout];
}

- (id)_definiteTransitionCoordinator
{
  uint64_t v3 = [(UIViewController *)self transitionCoordinator];
  if (!v3)
  {
    id v4 = [_UIViewControllerImmediateAnimationTransitionCoordinator alloc];
    __int16 v5 = [(UIViewController *)self _existingView];
    uint64_t v3 = [(_UIViewControllerImmediateAnimationTransitionCoordinator *)v4 initWithContainerView:v5];
  }
  return v3;
}

- (void)_invalidateBehaviorPreferences
{
  if (a1)
  {
    [a1 setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
    [a1 setNeedsUpdateOfHomeIndicatorAutoHidden];
    [a1 setNeedsUpdateOfPrefersPointerLocked];
    [a1 _setNeedsUpdateOfMultitaskingDragExclusionRects];
    [a1 setNeedsUpdateOfSupportedInterfaceOrientations];
    -[UIViewController _setNeedsResolutionOfPhysicalButtonConfigurations](a1);
  }
}

- (void)_invalidatePreferences:(__int16)a3 excluding:
{
  if (a1)
  {
    if ((a2 & 1) != 0 && (a3 & 1) == 0) {
      [a1 setNeedsStatusBarAppearanceUpdate];
    }
    if ((a2 & 2) != 0 && (a3 & 2) == 0) {
      [a1 _setNeedsUserInterfaceAppearanceUpdate];
    }
    if ((a2 & 4) != 0 && (a3 & 4) == 0) {
      [a1 setNeedsWhitePointAdaptivityStyleUpdate];
    }
    if ((a2 & 8) != 0 && (a3 & 8) == 0) {
      [a1 setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
    }
    if ((a2 & 0x10) != 0 && (a3 & 0x10) == 0) {
      [a1 setNeedsUpdateOfHomeIndicatorAutoHidden];
    }
    if ((a2 & 0x20) != 0 && (a3 & 0x20) == 0) {
      [a1 setNeedsUpdateOfPrefersPointerLocked];
    }
    if ((a2 & 0x40) != 0 && (a3 & 0x40) == 0) {
      [a1 _setNeedsUpdateOfMultitaskingDragExclusionRects];
    }
    if ((a2 & 0x80) != 0 && (a3 & 0x80) == 0) {
      [a1 setNeedsUpdateOfSupportedInterfaceOrientations];
    }
    if ((a2 & 0x200) != 0 && (a3 & 0x200) == 0)
    {
      -[UIViewController _setNeedsResolutionOfPhysicalButtonConfigurations](a1);
    }
  }
}

- (void)setNeedsStatusBarAppearanceUpdate
{
}

- (void)setNeedsUpdateOfScreenEdgesDeferringSystemGestures
{
}

- (void)setNeedsUpdateOfHomeIndicatorAutoHidden
{
}

- (void)setNeedsWhitePointAdaptivityStyleUpdate
{
}

- (void)_setNeedsUpdateOfMultitaskingDragExclusionRects
{
  uint64_t v3 = [(UIViewController *)self _window];
  id v4 = [v3 screen];
  uint64_t v5 = [v4 _userInterfaceIdiom];

  if (v5 == 1)
  {
    -[UIViewController _updateSystemAppearanceWithRecursionBlock:action:]((uint64_t)self, &__block_literal_global_916, &__block_literal_global_918_0);
  }
}

- (void)setNeedsUpdateOfPrefersPointerLocked
{
  uint64_t v3 = [(UIViewController *)self _window];
  id v4 = [v3 _windowHostingScene];
  int IsAvailableForScene = _UIPointerLockStateIsAvailableForScene(v4);

  if (IsAvailableForScene)
  {
    -[UIViewController _updateSystemAppearanceWithRecursionBlock:action:]((uint64_t)self, &__block_literal_global_912_0, &__block_literal_global_914_0);
  }
}

- (void)setNeedsUpdateOfSupportedInterfaceOrientations
{
  id v2 = [(UIViewController *)self _window];
  objc_msgSend(v2, "_updateOrientationPreferencesAnimated:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
}

- (double)_statusBarHeightForCurrentInterfaceOrientation
{
  id v2 = [(UIViewController *)self _existingView];
  uint64_t v3 = [v2 window];

  double v4 = 0.0;
  if (v3 && (unint64_t)([(id)UIApp _sceneInterfaceOrientationFromWindow:v3] - 1) <= 3)
  {
    uint64_t v5 = __UIStatusBarManagerForWindow(v3);
    [v5 statusBarHeight];
    double v4 = v6;
  }
  return v4;
}

- (void)_executeAfterAppearanceBlock
{
  if (self->_afterAppearance)
  {
    *(void *)&self->_viewControllerFlags |= 0x40000000uLL;
    uint64_t v3 = [(UIViewController *)self afterAppearanceBlock];
    v3[2]();

    [(UIViewController *)self setAfterAppearanceBlock:0];
    *(void *)&self->_viewControllerFlags &= ~0x40000000uLL;
  }
}

- (void)setAfterAppearanceBlock:(id)a3
{
  if (self->_afterAppearance != a3)
  {
    double v4 = _Block_copy(a3);
    id afterAppearance = self->_afterAppearance;
    self->_id afterAppearance = v4;
  }
}

- (id)afterAppearanceBlock
{
  id v2 = _Block_copy(self->_afterAppearance);
  return v2;
}

- (UIViewController)parentModalViewController
{
  return self->_parentModalViewController;
}

void __64__UIViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[UIViewController __viewDidDisappear:]((uint64_t)WeakRetained, *(unsigned __int8 *)(a1 + 40));
}

- (void)setEditing:(BOOL)editing
{
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)preferredContentSize
{
  p_preferredContentSize = &self->_preferredContentSize;
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  if (width == preferredContentSize.width && height == preferredContentSize.height) {
    return;
  }
  BOOL v8 = height != 0.0 && width != 0.0;
  p_preferredContentSize->double width = preferredContentSize.width;
  self->_preferredContentSize.double height = preferredContentSize.height;
  if ([(UIViewController *)self isViewLoaded])
  {
    double v9 = [(UIViewController *)self _existingView];
    double v10 = +[_UIPopoverView popoverViewContainingView:v9];

    if (v10)
    {
      double v11 = [(UIViewController *)self _popoverController];
      double v12 = v11;
      if (v11)
      {
        id v30 = v11;
        char v13 = [v11 _embedsInView];
        double v12 = v30;
        if ((v13 & 1) == 0)
        {
          unsigned int v19 = [v30 contentViewController];
          char v20 = [v19 presentedViewController];

          char v21 = [v30 contentViewController];
          uint64_t v22 = v21;
          if (v20)
          {
            id v23 = [v21 presentedViewController];
            [v23 preferredContentSize];
            double v25 = v24;
            double v27 = v26;
          }
          else
          {
            [v21 preferredContentSize];
            double v25 = v28;
            double v27 = v29;
          }

          if (v27 == 0.0 || v25 == 0.0)
          {
            double v25 = p_preferredContentSize->width;
            double v27 = p_preferredContentSize->height;
          }
          objc_msgSend(v30, "setPopoverContentSize:animated:", v8, v25, v27);
          goto LABEL_24;
        }
      }
    }
  }
  -[UIViewController _existingPresentationControllerImmediate:effective:includesRoot:prefersRoot:](self, 1, 1, 1, 0);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  double v14 = [v30 _childPresentationController];
  double v15 = v14;
  if (!v14 || ([v14 shouldPresentInFullscreen] & 1) != 0)
  {
    long long v16 = v30;
    if (!v30)
    {
      uint64_t v17 = [(UIViewController *)self parentViewController];
      id v18 = v17;
      if (v17)
      {
        [v17 _preferredContentSizeDidChangeForChildViewController:self];
        [v18 preferredContentSizeDidChangeForChildContentContainer:self];
      }

      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (([v15 shouldRemovePresentersView] & 1) == 0)
  {
    long long v16 = v15;
LABEL_22:
    [v16 preferredContentSizeDidChangeForChildContentContainer:self];
  }
LABEL_23:

LABEL_24:
}

- (BOOL)_canShowWhileLocked
{
  id v2 = +[UIViewController _whitelistOfSubclassableViewControllersMarkedSafe];
  char v3 = [v2 containsObject:objc_opt_class()];

  return v3;
}

+ (id)_whitelistOfSubclassableViewControllersMarkedSafe
{
  if (qword_1EB25BC00 != -1) {
    dispatch_once(&qword_1EB25BC00, &__block_literal_global_920_0);
  }
  id v2 = (void *)qword_1EB25BBF8;
  return v2;
}

- (void)setAdditionalSafeAreaInsets:(UIEdgeInsets)additionalSafeAreaInsets
{
  if (additionalSafeAreaInsets.left != self->_additionalSafeAreaInsets.left
    || additionalSafeAreaInsets.top != self->_additionalSafeAreaInsets.top
    || additionalSafeAreaInsets.right != self->_additionalSafeAreaInsets.right
    || additionalSafeAreaInsets.bottom != self->_additionalSafeAreaInsets.bottom)
  {
    self->_additionalSafeAreaInsets = additionalSafeAreaInsets;
    [(UIViewController *)self _updateContentOverlayInsetsForSelfAndChildren];
  }
}

- (void)_updateToolbarItemsFromViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(UIViewController *)self parentViewController];
  [v7 _updateToolbarItemsFromViewController:v6 animated:v4];
}

- (void)setToolbarItems:(NSArray *)toolbarItems animated:(BOOL)animated
{
  BOOL v4 = animated;
  id v7 = toolbarItems;
  if (self->_toolbarItems != v7)
  {
    double v9 = v7;
    objc_storeStrong((id *)&self->_toolbarItems, toolbarItems);
    BOOL v8 = [(UIViewController *)self parentViewController];
    [v8 _updateToolbarItemsFromViewController:self animated:v4];

    id v7 = v9;
  }
}

- (void)_objc_initiateDealloc
{
  if (self) {
    *((_WORD *)&self->_viewControllerFlags + 4) |= 0x80u;
  }
  _UIDeallocOnMainThread(self);
}

- (void)_appendNavigationItemsToNavigationController:(uint64_t)a3 transition:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    int v6 = [a1 _isNestedNavigationController];
    uint64_t v7 = a3;
    if (v6)
    {
      BOOL v8 = [a1 navigationItem];
      double v9 = [a1 topViewController];
      double v10 = [v9 navigationItem];
      if (v8 == v10) {
        uint64_t v7 = a3;
      }
      else {
        uint64_t v7 = 0;
      }
    }
    id v11 = v5;
    double v12 = v11;
    if ([v11 _isNestedNavigationController])
    {
      char v13 = v11;
      do
      {
        double v12 = [v13 navigationController];

        char v13 = v12;
      }
      while (([v12 _isNestedNavigationController] & 1) != 0);
    }
    if ([v11 _isNestedNavigationController])
    {
      double v14 = [v11 navigationBar];
      double v15 = [a1 navigationItem];
      [v14 _pushNestedNavigationItem:v15];

      if ([v14 _itemStackCount] == 1)
      {
        long long v16 = [v12 navigationBar];
        uint64_t v17 = [a1 navigationItem];
        [v16 _addItem:v17 withEffectiveDelegate:v12 transition:v7];

        if (!v6) {
          goto LABEL_37;
        }
        goto LABEL_17;
      }
    }
    id v18 = [a1 navigationItem];
    unsigned int v19 = [v18 _stackEntry];
    char v20 = [v12 navigationBar];
    [v20 _addItem:v18 withEffectiveDelegate:v11 transition:v7];

    if (!v6)
    {

LABEL_37:
      goto LABEL_38;
    }
    char v21 = [v18 _stackEntry];
    [v21 updateStateFromCounterpart:v19];

LABEL_17:
    uint64_t v22 = [a1 _lastNavigationItems];
    if ([v22 count])
    {
      id v39 = v5;
      id v23 = objc_opt_new();
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v24 = v22;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v45 != v27) {
              objc_enumerationMutation(v24);
            }
            double v29 = [*(id *)(*((void *)&v44 + 1) + 8 * i) _stackEntry];
            if (v29) {
              [v23 addObject:v29];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v49 count:16];
        }
        while (v26);
      }

      id v30 = [v12 navigationBar];
      [v30 _addItems:v24 withEffectiveDelegate:a1 transition:a3];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v31 = v23;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v40 objects:v48 count:16];
      id v5 = v39;
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v41 != v34) {
              objc_enumerationMutation(v31);
            }
            long long v36 = *(void **)(*((void *)&v40 + 1) + 8 * j);
            long long v37 = [v36 item];
            long long v38 = [v37 _stackEntry];
            [v38 updateStateFromCounterpart:v36];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v40 objects:v48 count:16];
        }
        while (v33);
      }
    }
    goto LABEL_37;
  }
LABEL_38:
}

- (void)setUserActivity:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIViewController;
  [(UIResponder *)&v14 setUserActivity:v4];
  if (v4)
  {
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    double v10 = __58__UIViewController_ActivityContinuation__setUserActivity___block_invoke;
    id v11 = &unk_1E52DB270;
    double v12 = self;
    id v13 = v4;
    id v5 = (void (**)(void *, void))_Block_copy(&v8);
    int v6 = [(UIViewController *)self transitionCoordinator];

    if (v6)
    {
      uint64_t v7 = [(UIViewController *)self transitionCoordinator];
      [v7 animateAlongsideTransition:0 completion:v5];
    }
    else
    {
      v5[2](v5, 0);
    }
  }
}

void __58__UIViewController_ActivityContinuation__setUserActivity___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _existingView];
  char v3 = [v2 window];

  if (v3)
  {
    if (_UIStateRestorationDebugLogEnabled())
    {
      id v4 = *(void **)(a1 + 40);
      id v5 = [v4 title];
      NSLog(&cfstr_SCallingBecome.isa, "-[UIViewController(ActivityContinuation) setUserActivity:]_block_invoke", v4, v5);
    }
    int v6 = *(void **)(a1 + 40);
    [v6 becomeCurrent];
  }
}

- (id)_contentUnavailableConfiguration
{
  id v2 = [(UIViewController *)self contentUnavailableConfiguration];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)_isInViewControllerThatHandlesKeyboardAvoidance
{
  id v3 = [(UIViewController *)self _existingPresentationControllerImmediate:0 effective:1];
  id v4 = [(UIViewController *)self _popoverController];
  if (v4)
  {
  }
  else if (([v3 _handlesKeyboardAvoidance] & 1) == 0)
  {
    int v6 = [(UIViewController *)self _multiColumnViewController];

    BOOL v5 = v6 != 0;
    goto LABEL_6;
  }
  BOOL v5 = 1;
LABEL_6:

  return v5;
}

- (void)_executeContentUnavailableConfigurationUpdate
{
  if (a1)
  {
    id v2 = [a1 contentUnavailableConfigurationState];
    memset(__src, 0, sizeof(__src));
    _UIBeginTrackingTraitUsage(a1, 0, __src);
    id v3 = [a1 contentUnavailableConfiguration];
    id v4 = [v3 updatedConfigurationForState:v2];

    -[UIViewController _applyContentUnavailableConfiguration:](a1, v4);
    [a1 updateContentUnavailableConfigurationUsingState:v2];
    [a1 _updateContentUnavailableConfigurationUsingState:v2];
    [a1 _bridgedUpdateContentUnavailableConfigurationUsingState:v2];
    memcpy(v6, __src, sizeof(v6));
    BOOL v5 = (char *)GetTraitCollectionTSD() + 16;
    memcpy(__dst, v5, sizeof(__dst));
    memcpy(v5, v6, 0x160uLL);
    -[UIViewController _recordTraitUsage:insideMethod:withInvalidationAction:](a1, (uint64_t)&__dst[136], [a1 methodForSelector:sel_updateContentUnavailableConfigurationUsingState_], sel_setNeedsUpdateContentUnavailableConfiguration);
    _UITraitUsageTrackingResultDestroy((uint64_t)__dst);
  }
}

- (void)setContentUnavailableConfiguration:(id)contentUnavailableConfiguration
{
  id v4 = contentUnavailableConfiguration;
  BOOL v5 = [(UIViewController *)self contentUnavailableConfigurationState];
  id v6 = [v4 updatedConfigurationForState:v5];

  -[UIViewController _applyContentUnavailableConfiguration:](self, v6);
}

- (void)_applyContentUnavailableConfiguration:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 _contentUnavailableWrapperView];
    BOOL v5 = (_UIContentUnavailableWrapperView *)v4;
    if (v3 && !v4)
    {
      BOOL v5 = [[_UIContentUnavailableWrapperView alloc] initWithViewController:a1];
      objc_msgSend(a1, "set_contentUnavailableWrapperView:", v5);
    }
    if (v5)
    {
      id v6 = [(UIView *)v5 superview];
      uint64_t v7 = [a1 view];

      if (v6 != v7)
      {
        uint64_t v8 = [a1 view];
        uint64_t v9 = (void *)v8;
        if (v8) {
          -[UIView _backing_addPrivateSubview:positioned:relativeTo:](v8, v5, -1, 0);
        }
      }
    }
    id v10 = [(_UIContentUnavailableWrapperView *)v5 configuration];
    id v11 = v3;
    double v12 = v11;
    if (v10 != v11)
    {
      if (v3 && v10)
      {
        char v13 = [v10 isEqual:v11];

        if (v13) {
          goto LABEL_21;
        }
      }
      else
      {
      }
      [(_UIContentUnavailableWrapperView *)v5 setConfiguration:v12];
      if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
      {
        objc_initWeak(&location, a1);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __58__UIViewController__applyContentUnavailableConfiguration___block_invoke;
        v15[3] = &unk_1E52DF3F0;
        objc_copyWeak(&v18, &location);
        long long v16 = v5;
        id v17 = v10;
        +[UIView _addCompletionWithPosition:v15];

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      else
      {
        objc_super v14 = [(_UIContentUnavailableWrapperView *)v5 configuration];

        if (!v14)
        {
          [(UIView *)v5 removeFromSuperview];
          objc_msgSend(a1, "set_contentUnavailableWrapperView:", 0);
        }
      }
      goto LABEL_21;
    }

LABEL_21:
  }
}

- (_UIContentUnavailableWrapperView)_contentUnavailableWrapperView
{
  return self->_contentUnavailableWrapperView;
}

- (id)contentUnavailableConfiguration
{
  return [(_UIContentUnavailableWrapperView *)self->_contentUnavailableWrapperView configuration];
}

- (void)set_contentUnavailableWrapperView:(id)a3
{
}

- (UIViewController)initWithCoder:(NSCoder *)coder
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = coder;
  v100.receiver = self;
  v100.super_class = (Class)UIViewController;
  BOOL v5 = [(UIViewController *)&v100 init];
  uint64_t v6 = (uint64_t)v5;
  if (!v5) {
    goto LABEL_74;
  }
  -[UIViewController _populateInitialTraitCollection]((uint64_t)v5);
  [(NSCoder *)v4 _initializeClassSwapperWithCurrentDecodingViewControllerIfNeeded:v6];
  if ([(id)v6 _shouldPersistViewWhenCoding])
  {
    uint64_t v7 = [(NSCoder *)v4 decodeObjectForKey:@"UIView"];
    uint64_t v8 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v7;

    if (*(void *)(v6 + 32))
    {
      [(id)objc_opt_class() setViewController:v6 forView:*(void *)(v6 + 32)];
      *(void *)(*(void *)(v6 + 32) + 96) |= 0x80000000uLL;
      *(void *)(v6 + 376) |= 0x80uLL;
    }
  }
  uint64_t v9 = [(NSCoder *)v4 decodeObjectForKey:@"UITitle"];
  uint64_t v10 = [v9 copy];
  id v11 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v10;

  uint64_t v12 = [(NSCoder *)v4 decodeObjectForKey:@"UITabBarItem"];
  char v13 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v12;

  uint64_t v14 = [(NSCoder *)v4 decodeObjectForKey:@"UINavigationItem"];
  double v15 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v14;

  *(void *)(v6 + 104) = [(NSCoder *)v4 decodeObjectForKey:@"UIParentViewController"];
  BOOL v16 = [(NSCoder *)v4 decodeBoolForKey:@"UIWantsFullScreenLayout"];
  uint64_t v17 = 64;
  if (v16) {
    uint64_t v17 = 1088;
  }
  *(void *)(v6 + 376) = *(void *)(v6 + 376) & 0xFFFFFFFFFFFFFBFFLL | v17;
  if ([(NSCoder *)v4 containsValueForKey:@"UIAutoresizesArchivedViewToFullSize"])
  {
    BOOL v18 = [(NSCoder *)v4 decodeBoolForKey:@"UIAutoresizesArchivedViewToFullSize"];
    uint64_t v19 = 64;
    if (!v18) {
      uint64_t v19 = 0;
    }
    *(void *)(v6 + 376) = *(void *)(v6 + 376) & 0xFFFFFFFFFFFFFFBFLL | v19;
  }
  -[UIViewController autoresizeArchivedView]((void *)v6);
  char v20 = [(NSCoder *)v4 decodeObjectForKey:@"UIStoryboardSegueTemplates"];
  uint64_t v21 = [v20 copy];
  uint64_t v22 = *(void **)(v6 + 616);
  *(void *)(v6 + 616) = v21;

  id v23 = [(NSCoder *)v4 decodeObjectForKey:@"UIStoryboardPreviewSegueTemplates"];
  uint64_t v24 = [v23 copy];
  uint64_t v25 = *(void **)(v6 + 720);
  *(void *)(v6 + 720) = v24;

  uint64_t v26 = [(NSCoder *)v4 decodeObjectForKey:@"UIStoryboardCommitSegueTemplates"];
  uint64_t v27 = [v26 copy];
  double v28 = *(void **)(v6 + 728);
  *(void *)(v6 + 728) = v27;

  double v29 = [(NSCoder *)v4 decodeObjectForKey:@"UIStoryboardPreviewingRegistrants"];
  uint64_t v30 = [v29 copy];
  id v31 = *(void **)(v6 + 736);
  *(void *)(v6 + 736) = v30;

  uint64_t v32 = [(NSCoder *)v4 decodeObjectForKey:@"UIExternalObjectsTableForViewLoading"];
  CFMutableDictionaryRef v33 = CFDictionaryCreateWithNonRetainedValuesFromNSDictionary(v32);
  uint64_t v34 = *(void **)(v6 + 176);
  *(void *)(v6 + 176) = v33;

  uint64_t v35 = [(NSCoder *)v4 decodeObjectForKey:@"UITopLevelObjectsToKeepAliveFromStoryboard"];
  uint64_t v36 = [v35 copy];
  long long v37 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v36;

  long long v38 = [(NSCoder *)v4 decodeObjectForKey:@"UINibName"];
  uint64_t v39 = [v38 copy];
  long long v40 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v39;

  if ([(NSCoder *)v4 containsValueForKey:@"UINibBundleIdentifier"])
  {
    long long v41 = (void *)MEMORY[0x1E4F28B50];
    long long v42 = [(NSCoder *)v4 decodeObjectForKey:@"UINibBundleIdentifier"];
    uint64_t v43 = [v41 bundleWithIdentifier:v42];
    long long v44 = *(void **)(v6 + 96);
    *(void *)(v6 + 96) = v43;

LABEL_15:
    goto LABEL_16;
  }
  if ([*(id *)(v6 + 88) length])
  {
    uint64_t v45 = UIResourceBundleForNIBBeingDecodedWithCoder(v4);
    long long v42 = *(void **)(v6 + 96);
    *(void *)(v6 + 96) = v45;
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v46 = [(NSCoder *)v4 decodeObjectForKey:@"UIToolbarItems"];
  long long v47 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v46;

  uint64_t v48 = [(NSCoder *)v4 decodeObjectForKey:@"UIChildViewControllerSelectors"];
  [(id)v6 _setCustomChildViewControllerSelectorsNames:v48];

  double v49 = [(NSCoder *)v4 _decodeObjectsAndTrackChildViewControllerIndexWithParent:v6 forKey:@"UIChildViewControllers"];
  if (v49)
  {
    uint64_t v50 = objc_opt_new();
    uint64_t v51 = *(void **)(v6 + 464);
    *(void *)(v6 + 464) = v50;

    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v52 = v49;
    uint64_t v53 = [v52 countByEnumeratingWithState:&v96 objects:v101 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v97;
      do
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v97 != v55) {
            objc_enumerationMutation(v52);
          }
          objc_msgSend(*(id *)(v6 + 464), "addObject:", *(void *)(*((void *)&v96 + 1) + 8 * i), (void)v96);
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v96 objects:v101 count:16];
      }
      while (v54);
    }
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UIDefinesPresentationContext", (void)v96]) {
    int v57 = [(NSCoder *)v4 decodeBoolForKey:@"UIDefinesPresentationContext"];
  }
  else {
    int v57 = [(id)v6 _isPresentationContextByDefault];
  }
  uint64_t v58 = 0x40000;
  if (!v57) {
    uint64_t v58 = 0;
  }
  *(void *)(v6 + 376) = *(void *)(v6 + 376) & 0xFFFFFFFFFFFBFFFFLL | v58;
  BOOL v59 = [(NSCoder *)v4 decodeBoolForKey:@"UIProvidesPresentationContextTransitionStyle"];
  uint64_t v60 = 0x80000;
  if (!v59) {
    uint64_t v60 = 0;
  }
  *(void *)(v6 + 376) = *(void *)(v6 + 376) & 0xFFFFFFFFFFF7FFFFLL | v60;
  BOOL v61 = [(NSCoder *)v4 containsValueForKey:@"UIRestoresFocusAfterTransition"];
  uint64_t v62 = 0;
  if (v61)
  {
    BOOL v63 = [(NSCoder *)v4 decodeBoolForKey:@"UIRestoresFocusAfterTransition"];
    uint64_t v62 = 0x400000000000;
    if (v63) {
      uint64_t v62 = 0x800000000000;
    }
  }
  *(void *)(v6 + 376) = *(void *)(v6 + 376) & 0xFFFF3FFFFFFFFFFFLL | v62;
  if ([(NSCoder *)v4 containsValueForKey:@"UIModalTransitionStyle"]) {
    uint64_t v64 = [(NSCoder *)v4 decodeIntegerForKey:@"UIModalTransitionStyle"];
  }
  else {
    uint64_t v64 = _UIViewControllerDefaultModalTransitionStyle((void *)v6);
  }
  *(void *)(v6 + 240) = v64;
  if ([(NSCoder *)v4 containsValueForKey:@"UIModalPresentationStyle"])
  {
    uint64_t v65 = [(NSCoder *)v4 decodeIntegerForKey:@"UIModalPresentationStyle"];
  }
  else if (dyld_program_sdk_at_least())
  {
    uint64_t v65 = -2;
  }
  else
  {
    uint64_t v65 = 0;
  }
  *(void *)(v6 + 248) = v65;
  BOOL v66 = [(NSCoder *)v4 decodeBoolForKey:@"UIHidesBottomBarWhenPushed"];
  uint64_t v67 = 32;
  if (!v66) {
    uint64_t v67 = 0;
  }
  *(void *)(v6 + 376) = *(void *)(v6 + 376) & 0xFFFFFFFFFFFFFFDFLL | v67;
  if ([(NSCoder *)v4 containsValueForKey:@"UIContentSizeForViewInPopover"])
  {
    [(NSCoder *)v4 decodeCGSizeForKey:@"UIContentSizeForViewInPopover"];
    *(void *)(v6 + 280) = v68;
    *(void *)(v6 + 288) = v69;
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UIPreferredContentSize"])
  {
    [(NSCoder *)v4 decodeCGSizeForKey:@"UIPreferredContentSize"];
    *(void *)(v6 + 816) = v70;
    *(void *)(v6 + 824) = v71;
  }
  char v72 = [(NSCoder *)v4 decodeObjectForKey:@"UIRestorationIdentifier"];
  if (v72) {
    [(id)v6 setRestorationIdentifier:v72];
  }
  double v73 = [(NSCoder *)v4 decodeObjectForKey:@"UIStoryboardIdentifier"];
  if (v73) {
    objc_storeStrong((id *)(v6 + 392), v73);
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UIKeyCommands"])
  {
    uint64_t v74 = [(NSCoder *)v4 decodeObjectForKey:@"UIKeyCommands"];
    BOOL v75 = *(void **)(v6 + 344);
    *(void *)(v6 + 344) = v74;
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UIAddedKeyCommands"])
  {
    uint64_t v76 = [(NSCoder *)v4 decodeObjectForKey:@"UIAddedKeyCommands"];
    char v77 = *(void **)(v6 + 352);
    *(void *)(v6 + 352) = v76;
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UIKeyEdgesForExtendedLayout"]) {
    uint64_t v78 = [(NSCoder *)v4 decodeIntegerForKey:@"UIKeyEdgesForExtendedLayout"];
  }
  else {
    uint64_t v78 = 15;
  }
  *(void *)(v6 + 688) = v78;
  if ([(NSCoder *)v4 containsValueForKey:@"UIKeyExtendedLayoutIncludesOpaqueBars"]) {
    *(void *)(v6 + 376) = *(void *)(v6 + 376) & 0xFFFFFFDFFFFFFFFFLL | (([(NSCoder *)v4 decodeIntegerForKey:@"UIKeyExtendedLayoutIncludesOpaqueBars"] & 1) << 37);
  }
  if ([(NSCoder *)v4 containsValueForKey:@"UIKeyAutomaticallyAdjustsScrollViewInsets"])
  {
    char v79 = [(NSCoder *)v4 decodeIntegerForKey:@"UIKeyAutomaticallyAdjustsScrollViewInsets"];
    __int16 v80 = *(_WORD *)(v6 + 384);
    unint64_t v81 = *(void *)(v6 + 376) & 0xFFFFFFBFFFFFFFFFLL | ((unint64_t)(v79 & 1) << 38);
  }
  else
  {
    __int16 v80 = *(_WORD *)(v6 + 384);
    unint64_t v81 = *(void *)(v6 + 376) | 0x4000000000;
  }
  double v82 = (void *)(v6 + 376);
  *(void *)(v6 + 376) = v81;
  *(_WORD *)(v6 + 384) = v80;
  if ([(NSCoder *)v4 containsValueForKey:@"UIViewControllerViewRespectsSystemMinimumLayoutMargins"])
  {
    BOOL v83 = [(NSCoder *)v4 decodeBoolForKey:@"UIViewControllerViewRespectsSystemMinimumLayoutMargins"];
    __int16 v84 = *(_WORD *)(v6 + 384);
    uint64_t v85 = 0x8000000000000;
    if (!v83) {
      uint64_t v85 = 0;
    }
    unint64_t v86 = *v82 & 0xFFF7FFFFFFFFFFFFLL | v85;
  }
  else
  {
    __int16 v84 = *(_WORD *)(v6 + 384);
    unint64_t v86 = *v82 | 0x8000000000000;
  }
  *(void *)(v6 + 376) = v86;
  *(_WORD *)(v6 + 384) = v84;
  uint64_t v87 = [(NSCoder *)v4 decodeObjectForKey:@"UIViewControllerTopLayoutGuide"];
  double v88 = *(void **)(v6 + 544);
  *(void *)(v6 + 544) = v87;

  uint64_t v89 = [(NSCoder *)v4 decodeObjectForKey:@"UIViewControllerBottomLayoutGuide"];
  v90 = *(void **)(v6 + 552);
  *(void *)(v6 + 552) = v89;

  if (*(void *)(v6 + 544) || *(void *)(v6 + 552)) {
    *(void *)(v6 + 376) |= 0x100000000000uLL;
  }
  uint64_t v91 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIViewControllerInteractionActivityTrackingBaseName"];
  int v92 = *(void **)(v6 + 576);
  *(void *)(v6 + 576) = v91;

  uint64_t v93 = [(NSCoder *)v4 decodeObjectForKey:@"UIViewControllerObservableScrollViews"];
  uint64_t v94 = *(void **)(v6 + 584);
  *(void *)(v6 + 584) = v93;

  -[UIViewController _doCommonSetup](v6);
LABEL_74:

  return (UIViewController *)v6;
}

- (void)autoresizeArchivedView
{
  if ([a1 autoresizesArchivedViewToFullSize]
    && [a1 isViewLoaded])
  {
    id v2 = [a1 _existingView];
    [a1 _defaultInitialViewFrame];
    objc_msgSend(v2, "setFrame:");
  }
}

- (BOOL)autoresizesArchivedViewToFullSize
{
  return (*(void *)&self->_viewControllerFlags >> 6) & 1;
}

- (void)_setCustomChildViewControllerSelectorsNames:(id)a3
{
  id v4 = (id)[a3 copy];
  objc_setAssociatedObject(self, &_UIViewControllerCustomChildViewControllerSelectorsNamesKey, v4, (void *)1);
}

- (BOOL)_shouldPersistViewWhenCoding
{
  return 1;
}

- (SEL)_customSelectorToCreateChildViewControllerAtIndex:(int64_t)a3
{
  BOOL v5 = [(UIViewController *)self _customChildViewControllerSelectorsNames];
  uint64_t v6 = [v5 objectAtIndex:a3];
  uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  if ([v6 isEqual:v7])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = [(UIViewController *)self _customChildViewControllerSelectorsNames];
    uint64_t v8 = [v9 objectAtIndex:a3];
  }
  if (v8) {
    uint64_t v10 = NSSelectorFromString(v8);
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_customChildViewControllerSelectorsNames
{
  return objc_getAssociatedObject(self, &_UIViewControllerCustomChildViewControllerSelectorsNamesKey);
}

- (BOOL)_isTabBarController
{
  return 0;
}

- (BOOL)_wrapsNavigationController:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(UIViewController *)self _isNavigationController])
  {
    BOOL v5 = self;
  }
  else
  {
    uint64_t v6 = [(UIViewController *)self childViewControllers];
    BOOL v5 = (UIViewController *)[v6 count];

    if (v5)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v7 = [(UIViewController *)self childViewControllers];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v14;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v7);
            }
            id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            if ([v11 _isNavigationController])
            {
              BOOL v5 = v11;
              LOBYTE(v8) = 1;
              goto LABEL_17;
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
      BOOL v5 = 0;
LABEL_17:

      if (a3) {
        goto LABEL_14;
      }
      goto LABEL_15;
    }
  }
  LOBYTE(v8) = 0;
  if (a3) {
LABEL_14:
  }
    *a3 = v5;
LABEL_15:

  return v8;
}

- (void)setOverrideTraitCollection:(UITraitCollection *)collection forChildViewController:(UIViewController *)childViewController
{
  long long v15 = collection;
  uint64_t v6 = childViewController;
  if (v6)
  {
    uint64_t v7 = objc_alloc_init(_UIViewControllerNullAnimationTransitionCoordinator);
    uint64_t v8 = [(UIViewController *)self _existingView];
    [(_UIViewControllerNullAnimationTransitionCoordinator *)v7 setContainerView:v8];

    if ((_UIViewControllersInheritTraitsFromViewHierarchy() & 1) == 0)
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = [(UIViewController *)self traitCollection];
      id v11 = [v9 _traitCollectionWithParentTraitCollection:v10 overrideTraitCollection:v15];

      [(UIViewController *)v6 _parent:self willTransitionToTraitCollection:v11 withTransitionCoordinator:v7];
    }
    overrideTraitCollectionsForChildren = self->_overrideTraitCollectionsForChildren;
    if (!overrideTraitCollectionsForChildren)
    {
      long long v13 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      long long v14 = self->_overrideTraitCollectionsForChildren;
      self->_overrideTraitCollectionsForChildren = v13;

      overrideTraitCollectionsForChildren = self->_overrideTraitCollectionsForChildren;
    }
    if (v15) {
      [(NSMapTable *)overrideTraitCollectionsForChildren setObject:v15 forKey:v6];
    }
    else {
      [(NSMapTable *)overrideTraitCollectionsForChildren removeObjectForKey:v6];
    }
    -[UIViewController _applyCompatibilityTraitOverridesForOverrideTraitCollection:](v6, v15);
    [(UIViewController *)v6 _updateTraitsIfNecessary];
    [(_UIViewControllerNullAnimationTransitionCoordinator *)v7 _runAlongsideAnimations];
    [(_UIViewControllerNullAnimationTransitionCoordinator *)v7 _runAlongsideCompletionsAfterCommit];
  }
}

- (void)_updateTraitsIfNecessary
{
}

- (void)_applyCompatibilityTraitOverridesForOverrideTraitCollection:(void *)a1
{
  id v4 = a2;
  if (_UIViewControllersInheritTraitsFromViewHierarchy())
  {
    id v3 = -[UIViewController _compatibilityTraitOverridesFromParentViewControllerCreateIfNecessary:](a1, 1);
    -[_UITraitOverrides _replaceOverrideTraitCollection:]((uint64_t)v3, v4);
  }
}

- (void)addChildViewController:(UIViewController *)childController
{
}

- (void)didMoveToParentViewController:(UIViewController *)parent
{
  BOOL v5 = parent;
  if (v5)
  {
    if ([(UIViewController *)self _appearState] == 1)
    {
LABEL_3:
      unint64_t v4 = *(void *)&self->_viewControllerFlags | 0x10000000;
      goto LABEL_6;
    }
  }
  else
  {
    [(UIResponder *)self _clearOverrideNextResponder];
    if ([(UIViewController *)self _appearState] == 3) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFEDFFFFFFLL;
LABEL_6:
  *(void *)&self->_uint64_t viewControllerFlags = v4;
}

- (void)_setViewHostsLayoutEngine:(BOOL)a3
{
  self->_viewHostsLayoutEngine = a3;
  if (a3)
  {
    view = self->_view;
    if (view)
    {
      if ([(UIView *)view translatesAutoresizingMaskIntoConstraints])
      {
        BOOL v5 = self->_view;
        [(UIView *)v5 _setHostsLayoutEngine:1];
      }
    }
  }
}

- (void)_setLastNotifiedTraitCollection:(id)a3
{
}

- (void)setContainmentSupport:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (void)_sendViewDidLoadWithAppearanceProxyObjectTaggingEnabled
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = (void *)_UISetCurrentFallbackEnvironment(result);
    if (__isObjectTaggingEnabled == 1)
    {
      __isObjectTaggingEnabled = 0;
      [v1 viewDidLoad];
      __isObjectTaggingEnabled = 1;
    }
    else
    {
      [v1 viewDidLoad];
    }
    return (void *)_UIRestorePreviousFallbackEnvironment(v2);
  }
  return result;
}

- (void)_updateChildContentMargins
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_childViewControllers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "_setContentMargin:", self->_contentMargin, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
  uint64_t viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  if (((((viewControllerFlags & 8) == 0) ^ editing) & 1) == 0)
  {
    uint64_t v7 = 8;
    if (!editing) {
      uint64_t v7 = 0;
    }
    *((_WORD *)&self->_viewControllerFlags + 4) = *((_WORD *)&self->_viewControllerFlags + 4);
    *(void *)&self->_uint64_t viewControllerFlags = viewControllerFlags & 0xFFFFFFFFFFFFFFF7 | v7;
    long long v8 = [UIBarButtonItem alloc];
    if (editing)
    {
      long long v9 = _UINSLocalizedStringWithDefaultValue(@"Done", @"Done");
      long long v10 = v8;
      long long v11 = v9;
      uint64_t v12 = 2;
    }
    else
    {
      long long v9 = _UINSLocalizedStringWithDefaultValue(@"Edit", @"Edit");
      long long v10 = v8;
      long long v11 = v9;
      uint64_t v12 = 0;
    }
    uint64_t v13 = [(UIBarButtonItem *)v10 initWithTitle:v11 style:v12 target:0 action:0];

    [(UIBarButtonItem *)self->_editButtonItem _setItemVariation:v13];
  }
}

- (BOOL)isEditing
{
  return (*(void *)&self->_viewControllerFlags >> 3) & 1;
}

- (id)_hostingNavigationBar
{
  if ([(NSMutableArray *)self->_childViewControllers count] == 1)
  {
    uint64_t v3 = [(NSMutableArray *)self->_childViewControllers firstObject];
    uint64_t v4 = [v3 _hostingNavigationBar];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

+ (void)_scheduleTransition:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (_ShouldDeferTransitions)
  {
    uint64_t v5 = dyld_program_sdk_at_least() ^ 1;
    uint64_t v6 = _UIMainBundleIdentifier();
    if (_UIUpdateCycleEnabled()
      && ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_DisableDelayedScheduleTransition, @"DisableDelayedScheduleTransition", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1EB2570AC)&& [&unk_1ED3EF908 containsObject:v6])
    {
      dispatch_time_t v7 = dispatch_time(0, 50000000);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __40__UIViewController__scheduleTransition___block_invoke;
      v8[3] = &unk_1E52E7D78;
      char v10 = v5;
      id v9 = v4;
      dispatch_after(v7, MEMORY[0x1E4F14428], v8);
    }
    else
    {
      [(id)UIApp _performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming:v5 block:v4];
    }
  }
  else
  {
    (*((void (**)(id))v3 + 2))(v3);
  }
}

- (void)setNeedsDidMoveCleanup:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (void)_setNavigationControllerContentOffsetAdjustment:(double)a3
{
  if (self->_navigationControllerContentOffsetAdjustment != a3)
  {
    uint64_t v5 = [(UIViewController *)self _contentOrObservableScrollViewForEdge:1];
    if (v5)
    {
      id v6 = v5;
      [v5 contentOffset];
      objc_msgSend(v6, "setContentOffset:");
      uint64_t v5 = v6;
    }
    self->_navigationControllerContentOffsetAdjustment = a3;
  }
}

void __64__UIViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__viewDidAppear:", *(unsigned __int8 *)(a1 + 40));
}

- (uint64_t)_endAppearanceTransition:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    if ((*(void *)(a1 + 376) & 0x8000000) != 0)
    {
LABEL_6:
      a1 = 0;
      goto LABEL_14;
    }
    uint64_t v4 = [(id)a1 isInAnimatedVCTransition];
    uint64_t v5 = *(void *)(a1 + 336);
    *(void *)(a1 + 336) = v5 - 1;
    if (v5 <= 0)
    {
      NSLog(&cfstr_UnbalancedCall.isa, a1);
      *(void *)(a1 + 336) = 0;
    }
    else if (v5 != 1 && ([(id)a1 _forwardAppearanceMethods] & 1) != 0)
    {
      goto LABEL_6;
    }
    [(id)a1 setInAnimatedVCTransition:0];
    if ((*(void *)(a1 + 376) & 0x4000000) != 0)
    {
      objc_msgSend((id)a1, "__viewDidAppear:", v4);
      if (!v3)
      {
LABEL_13:
        a1 = 1;
        goto LABEL_14;
      }
    }
    else
    {
      -[UIViewController __viewDidDisappear:](a1, v4);
      if (!v3) {
        goto LABEL_13;
      }
    }
    v3[2](v3);
    goto LABEL_13;
  }
LABEL_14:

  return a1;
}

- (BOOL)isInAnimatedVCTransition
{
  return (*(void *)&self->_viewControllerFlags >> 22) & 1;
}

- (void)__viewDidAppear:(BOOL)a3
{
  uint64_t viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  if ((viewControllerFlags & 6) == 4)
  {
    self->_explicitAppearanceTransitionLevel = 0;
  }
  else
  {
    BOOL v5 = a3;
    if ((viewControllerFlags & 0x40000000) == 0 && self->_afterAppearance) {
      [(UIViewController *)self setAfterAppearanceBlock:0];
    }
    if (self->_explicitAppearanceTransitionLevel >= 1) {
      self->_explicitAppearanceTransitionLevel = 0;
    }
    *(void *)&self->_viewControllerFlags |= 0x4000000uLL;
    -[UIViewController _setViewAppearState:isAnimating:]((uint64_t)self, 2, v5);
    [(UIViewController *)self _setAvoidanceInsetsNeedsUpdate];
  }
}

- (void)beginAppearanceTransition:(BOOL)isAppearing animated:(BOOL)animated
{
  if ((*(void *)&self->_viewControllerFlags & 0x8000000) == 0)
  {
    BOOL v4 = animated;
    BOOL v5 = isAppearing;
    int64_t explicitAppearanceTransitionLevel = self->_explicitAppearanceTransitionLevel;
    self->_int64_t explicitAppearanceTransitionLevel = explicitAppearanceTransitionLevel + 1;
    uint64_t viewControllerFlags = (uint64_t)self->_viewControllerFlags;
    if (explicitAppearanceTransitionLevel < 1)
    {
      __int16 v9 = *((_WORD *)&self->_viewControllerFlags + 4);
    }
    else
    {
      if ((((*(void *)&self->_viewControllerFlags & 0x4000000) == 0) ^ isAppearing)) {
        return;
      }
      self->_int64_t explicitAppearanceTransitionLevel = 1;
      uint64_t viewControllerFlags = (uint64_t)self->_viewControllerFlags;
      __int16 v9 = *((_WORD *)&self->_viewControllerFlags + 4);
    }
    uint64_t v10 = 0x4000000;
    if (!isAppearing) {
      uint64_t v10 = 0;
    }
    *((_WORD *)&self->_viewControllerFlags + 4) = v9;
    *(void *)&self->_uint64_t viewControllerFlags = viewControllerFlags & 0xFFFFFFFFFBFFFFFFLL | v10;
    [(UIViewController *)self setInAnimatedVCTransition:animated];
    if (v5)
    {
      [(UIViewController *)self __viewWillAppear:v4];
    }
    else
    {
      -[UIViewController __viewWillDisappear:]((uint64_t)self, v4);
    }
  }
}

- (void)setInAnimatedVCTransition:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (void)__viewDidDisappear:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 376);
    if ((v3 & 6) != 0)
    {
      __int16 v5 = *(_WORD *)(a1 + 384);
      unint64_t v6 = v3 & 0xFFFFFFFFFBFFFFFFLL;
      *(void *)(a1 + 376) = v6;
      *(_WORD *)(a1 + 384) = v5;
      if (*(uint64_t *)(a1 + 336) >= 1)
      {
        *(void *)(a1 + 336) = 0;
        unint64_t v6 = *(void *)(a1 + 376);
      }
      if ((v6 & 0x40000000) == 0)
      {
        if (*(void *)(a1 + 328)) {
          [(id)a1 setAfterAppearanceBlock:0];
        }
      }
      -[UIViewController _setViewAppearState:isAnimating:](a1, 0, a2);
      -[UIViewController _unloadHierarchyInputAccessoryViewIfNecessary]((void *)a1);
      *(void *)(a1 + 376) &= ~0x10000000000uLL;
    }
    else
    {
      *(void *)(a1 + 336) = 0;
    }
  }
}

- (NSExtensionContext)extensionContext
{
  uint64_t v3 = [(UIViewController *)self _extensionContextUUID];
  BOOL v4 = self;
  BOOL v5 = v3 == 0;
  if (v4 && !v3)
  {
    do
    {
      unint64_t v6 = v4->_parentViewController;
      dispatch_time_t v7 = v6;
      if (v6)
      {
        long long v8 = v4;
        BOOL v4 = v6;
      }
      else
      {
        __int16 v9 = [(UIViewController *)v4 _parentModalViewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        long long v11 = v9;
        long long v8 = v11;
        if (isKindOfClass)
        {
          uint64_t v12 = [(UIViewController *)v11 localViewController];

          BOOL v4 = v8;
        }
        else
        {
          uint64_t v12 = (uint64_t)v11;
        }

        BOOL v4 = (UIViewController *)v12;
      }

      uint64_t v13 = [(UIViewController *)v4 _extensionContextUUID];
      BOOL v5 = v13 == 0;
      if (v13) {
        BOOL v14 = 1;
      }
      else {
        BOOL v14 = v4 == 0;
      }
    }
    while (!v14);
    uint64_t v3 = (void *)v13;
  }
  if (v5)
  {
    long long v15 = 0;
  }
  else
  {
    long long v16 = [MEMORY[0x1E4F292B0] _sharedExtensionContextVendor];
    long long v15 = [v16 _extensionContextForUUID:v3];
  }
  return (NSExtensionContext *)v15;
}

- (id)_extensionContextUUID
{
  return objc_getAssociatedObject(self, &kExtensionContextUUIDKey);
}

+ (void)_performWithoutDeferringTransitionsAllowingAnimation:(void *)a3 actions:
{
  unint64_t v6 = a3;
  self;
  if (dyld_program_sdk_at_least())
  {
    BOOL v4 = +[UIViewController _shouldDeferTransitions];
    self;
    char v5 = _ShouldAnimateImmediateTransitions;
    +[UIViewController _setShouldDeferTransitions:0];
    self;
    _ShouldAnimateImmediateTransitions = a2;
    v6[2]();
    self;
    _ShouldAnimateImmediateTransitions = v5;
    +[UIViewController _setShouldDeferTransitions:v4];
  }
  else
  {
    v6[2]();
  }
}

+ (void)_setShouldDeferTransitions:(BOOL)a3
{
  _ShouldDeferTransitions = a3;
}

+ (void)_performWithoutDeferringTransitions:(id)a3
{
}

- (int64_t)_preferredInterfaceOrientationGivenCurrentOrientation:(int64_t)a3
{
  if (!self) {
    return 0;
  }
  char v5 = [(UIViewController *)self _window];
  char v6 = [v5 _windowOwnsInterfaceOrientation];

  if (v6)
  {
    unint64_t v40 = [(UIViewController *)self __supportedInterfaceOrientations];
    if ((v40 & (1 << a3)) == 0)
    {
      dispatch_time_t v7 = +[UIDevice currentDevice];
      a3 = [v7 orientation];

      long long v8 = [(UIViewController *)self _existingView];
      __int16 v9 = [v8 window];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __92__UIViewController__preferredInterfaceOrientationGivenStatusBarAndDeviceOrientationAndMask___block_invoke;
      aBlock[3] = &__block_descriptor_40_e8_B16__0q8l;
      aBlock[4] = &v40;
      uint64_t v10 = _Block_copy(aBlock);
      long long v11 = (uint64_t (**)(void, void))v10;
      if ((unint64_t)(a3 - 1) > 3
        || ((*((uint64_t (**)(void *, int64_t))v10 + 2))(v10, a3) & 1) == 0)
      {
        uint64_t v12 = objc_msgSend(v9, "windowScene", v40);
        int v13 = v11[2](v11, [v12 interfaceOrientation]);

        if (v13)
        {
          BOOL v14 = [v9 windowScene];
          a3 = [v14 interfaceOrientation];
        }
        else
        {
          a3 = 0;
        }
      }
    }
    char v20 = [(UIViewController *)self _existingView];
    uint64_t v21 = [v20 window];

    BOOL v22 = [(UIViewController *)self modalPresentationStyle] == 16
       || [(UIViewController *)self modalPresentationStyle] == UIModalPresentationFormSheet
       || [(UIViewController *)self modalPresentationStyle] == UIModalPresentationPageSheet;
    uint64_t v23 = [(UIViewController *)self presentingViewController];
    if (!v23) {
      goto LABEL_20;
    }
    uint64_t v24 = (void *)v23;
    uint64_t v25 = [(UIViewController *)self presentingViewController];
    uint64_t v26 = [v25 _popoverController];
    if (v26
      || !v22
      && [(UIViewController *)self modalPresentationStyle] != 17
      && [(UIViewController *)self modalPresentationStyle] != UIModalPresentationOverFullScreen)
    {

      goto LABEL_20;
    }
    if (v21)
    {
      uint64_t v32 = [v21 rootViewController];
      CFMutableDictionaryRef v33 = [(UIViewController *)self _rootAncestorViewController];

      if (v32 != v33) {
        goto LABEL_20;
      }
    }
    else
    {
    }
    uint64_t v39 = [(UIViewController *)self presentingViewController];
    a3 = [v39 interfaceOrientation];

    if (v22)
    {
LABEL_38:

      return a3;
    }
LABEL_20:
    uint64_t v27 = [(UIViewController *)self childModalViewController];
    if (!v27) {
      goto LABEL_22;
    }
    double v28 = (void *)v27;
    double v29 = [(UIViewController *)self _existingView];
    uint64_t v30 = [v29 window];

    if (!v30)
    {
      int64_t v34 = [(UIViewController *)self _lastKnownInterfaceOrientation];
      if ((unint64_t)(v34 - 1) < 4) {
        a3 = v34;
      }
    }
    else
    {
LABEL_22:
      if ((unint64_t)(a3 - 1) >= 4)
      {
        BOOL v31 = [(UIViewController *)self _ignoreAppSupportedOrientations];
        if (v21) {
          a3 = 0;
        }
        else {
          a3 = v31;
        }
      }
    }
    unint64_t v35 = v40;
    uint64_t v36 = [(UIViewController *)self _window];
    long long v37 = v36;
    if (v36) {
      int64_t v38 = [v36 _interfaceOrientationForSupportedOrientations:v35 preferredOrientation:a3];
    }
    else {
      int64_t v38 = [(id)UIApp _fallbackInterfaceOrientationForSupportedOrientations:v35 preferredOrientation:a3 currentOrientation:0];
    }
    a3 = v38;

    goto LABEL_38;
  }
  if ((unint64_t)(a3 - 1) >= 4)
  {
    long long v15 = +[UIDevice currentDevice];
    a3 = [v15 orientation];

    if ((unint64_t)(a3 - 1) >= 4)
    {
      long long v16 = [(UIViewController *)self _window];
      uint64_t v17 = [v16 windowScene];
      int64_t v18 = [v17 interfaceOrientation];

      return v18;
    }
  }
  return a3;
}

- (void)_setOverrideUserInterfaceRenderingMode:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
  {
    dispatch_time_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIViewController.m", 4406, @"Attempt to set invalid _UIUserInterfaceRenderingMode value to overrideUserInterfaceRenderingMode: %ld", a3);
  }
  int64_t v5 = [(UIViewController *)self _overrideUserInterfaceRenderingMode];
  *((_WORD *)&self->_viewControllerFlags + 4) = *((_WORD *)&self->_viewControllerFlags + 4) & 0xFFF3 | (4 * (a3 & 3));
  if ([(UIViewController *)self _overrideUserInterfaceRenderingMode] != v5)
  {
    [(UIViewController *)self _updateTraitsIfNecessary];
  }
}

- (BOOL)_shouldAttemptToPreserveInputViewsForResponder:(id)a3
{
  id v4 = a3;
  if (v4 && [(UIResponder *)self _containsResponder:v4])
  {
    int64_t v5 = [v4 _window];
    char v6 = [v5 screen];

    dispatch_time_t v7 = +[UIKeyboardMotionSupport supportForScreen:v6];
    long long v8 = v7;
    BOOL v9 = !v7 || ([v7 isFinishingDismissTransition] & 1) == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_providesCustomBasePresentationInsets
{
  return 0;
}

- (UIEdgeInsets)_viewSafeAreaInsetsFromScene
{
  uint64_t v3 = [(UIViewController *)self _existingView];
  id v4 = [v3 window];
  [v4 _managedSafeAreaInsets];
  double v62 = v8;
  if ((*((_WORD *)&self->_viewControllerFlags + 4) & 0x40) != 0)
  {
    uint64_t v39 = [(UIViewController *)self _lastKnownInterfaceOrientation];
    if (!v39) {
      uint64_t v39 = [v4 interfaceOrientation];
    }
    unint64_t v40 = [v4 windowScene];
    [v40 _safeAreaInsetsForInterfaceOrientation:v39];
    double v9 = v41;
    double v10 = v42;
    double v11 = v43;
    double v62 = v44;

    if (v4) {
      goto LABEL_3;
    }
LABEL_13:
    uint64_t v45 = +[UIScreen mainScreen];
    [v45 overscanCompensationInsets];
    double v35 = v46;
    double v37 = v47;
    double v34 = v48;
    double v38 = v49;

    goto LABEL_14;
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  if (!v4) {
    goto LABEL_13;
  }
LABEL_3:
  double v56 = v9;
  double v57 = v10;
  double v59 = v11;
  [(UIViewController *)self _viewFrameInWindowForContentOverlayInsetsCalculation];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  [v4 bounds];
  CGFloat x = v64.origin.x;
  CGFloat y = v64.origin.y;
  CGFloat width = v64.size.width;
  CGFloat height = v64.size.height;
  CGRectGetMinY(v64);
  UIRoundToViewScale(v3);
  double v60 = v24;
  CGFloat v55 = x;
  v65.origin.CGFloat x = x;
  CGFloat v25 = y;
  v65.origin.CGFloat y = y;
  v65.size.CGFloat width = width;
  CGFloat v54 = height;
  v65.size.CGFloat height = height;
  CGRectGetMaxY(v65);
  UIRoundToViewScale(v3);
  double v27 = v26;
  v66.origin.CGFloat x = v13;
  v66.origin.CGFloat y = v15;
  v66.size.CGFloat width = v17;
  v66.size.CGFloat height = v19;
  CGRectGetMinY(v66);
  UIRoundToViewScale(v3);
  double v29 = v28;
  v67.origin.CGFloat x = v13;
  v67.origin.CGFloat y = v15;
  CGFloat rect = v17;
  v67.size.CGFloat width = v17;
  v67.size.CGFloat height = v19;
  CGRectGetMaxY(v67);
  UIRoundToViewScale(v3);
  if (v29 >= v60 && v30 <= v27 || !dyld_program_sdk_at_least()) {
    goto LABEL_9;
  }
  if (qword_1EB25BB40 != -1) {
    dispatch_once(&qword_1EB25BB40, &__block_literal_global_170);
  }
  if (!byte_1EB25BB24)
  {
    double v38 = 0.0;
    double v34 = 0.0;
    double v37 = 0.0;
    double v35 = 0.0;
  }
  else
  {
LABEL_9:
    v68.origin.CGFloat x = v13;
    v68.origin.CGFloat y = v15;
    v68.size.CGFloat width = v17;
    v68.size.CGFloat height = v19;
    double MinY = CGRectGetMinY(v68);
    v69.origin.CGFloat x = v55;
    v69.origin.CGFloat y = v25;
    v69.size.CGFloat width = width;
    v69.size.CGFloat height = v54;
    double v61 = fmax(v56 - fmax(MinY - CGRectGetMinY(v69), 0.0), 0.0);
    v70.origin.CGFloat x = v13;
    v70.origin.CGFloat y = v15;
    v70.size.CGFloat width = v17;
    v70.size.CGFloat height = v19;
    double MinX = CGRectGetMinX(v70);
    v71.origin.CGFloat x = v55;
    v71.origin.CGFloat y = v25;
    v71.size.CGFloat width = width;
    v71.size.CGFloat height = v54;
    double v58 = fmax(v57 - fmax(MinX - CGRectGetMinX(v71), 0.0), 0.0);
    v72.origin.CGFloat x = v55;
    v72.origin.CGFloat y = v25;
    v72.size.CGFloat width = width;
    v72.size.CGFloat height = v54;
    double MaxY = CGRectGetMaxY(v72);
    v73.origin.CGFloat x = v13;
    v73.origin.CGFloat y = v15;
    v73.size.CGFloat width = v17;
    v73.size.CGFloat height = v19;
    double v34 = fmax(v59 - fmax(MaxY - CGRectGetMaxY(v73), 0.0), 0.0);
    v74.origin.CGFloat x = v55;
    v74.origin.CGFloat y = v25;
    v74.size.CGFloat width = width;
    v74.size.CGFloat height = v54;
    double v35 = v61;
    double MaxX = CGRectGetMaxX(v74);
    v75.origin.CGFloat x = v13;
    v75.origin.CGFloat y = v15;
    v75.size.CGFloat width = rect;
    v75.size.CGFloat height = v19;
    double v37 = v58;
    double v38 = fmax(v62 - fmax(MaxX - CGRectGetMaxX(v75), 0.0), 0.0);
  }
LABEL_14:

  double v50 = v35;
  double v51 = v37;
  double v52 = v34;
  double v53 = v38;
  result.double right = v53;
  result.double bottom = v52;
  result.double left = v51;
  result.double top = v50;
  return result;
}

- (void)setModalInPopover:(BOOL)modalInPopover
{
  uint64_t v4 = 0x8000;
  if (!modalInPopover) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFFFFF7FFFLL | v4;
  id v8 = [(UIViewController *)self _popoverController];
  if (v8) {
    [v8 _containedViewControllerModalStateChanged];
  }
  double v5 = [(UIViewController *)self popoverPresentationController];
  double v6 = [v5 presentedViewController];

  if (v6 == self)
  {
    double v7 = [(UIViewController *)self popoverPresentationController];
    [v7 _containedViewControllerModalStateChanged];
  }
}

- (UIPopoverPresentationController)popoverPresentationController
{
  return (UIPopoverPresentationController *)-[UIViewController popoverPresentationController:](self, 1);
}

- (void)dealloc
{
  void v75[4] = *MEMORY[0x1E4F143B8];
  if (!self || (*((_WORD *)&self->_viewControllerFlags + 4) & 0x80) == 0)
  {
    double v47 = [MEMORY[0x1E4F28B00] currentHandler];
    double v48 = (objc_class *)objc_opt_class();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIViewController.m", 3272, @"Application circumvented Objective-C runtime dealloc initiation for <%s> object.", class_getName(v48));
  }
  SEL v51 = a2;
  context = (void *)MEMORY[0x18C108260]();
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v75[0] = @"UIApplicationSuspendedNotification";
  v75[1] = @"UIApplicationResumedNotification";
  v75[2] = @"UIApplicationWantsViewsToDisappearNotification";
  v75[3] = @"UIAccessibilityLargeTextChangedNotification";
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:4];
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  double v6 = self->_previewSourceViews;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v68 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v67 + 1) + 8 * i) unregister];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v67 objects:v74 count:16];
    }
    while (v8);
  }

  int v11 = -[UIViewController _useViewBasedTopAndBottomLayoutGuides]((uint64_t)self);
  topLayoutGuide = self->_topLayoutGuide;
  if (v11)
  {
    [(UILayoutSupport *)topLayoutGuide removeFromSuperview];
    [(UILayoutSupport *)self->_bottomLayoutGuide removeFromSuperview];
  }
  else
  {
    _removeLayoutGuide(topLayoutGuide);
    _removeLayoutGuide(self->_bottomLayoutGuide);
  }
  CGFloat v13 = self->_topLayoutGuide;
  self->_topLayoutGuide = 0;

  bottomLayoutGuide = self->_bottomLayoutGuide;
  self->_bottomLayoutGuide = 0;

  [(id)qword_1EB25BB38 removeObject:self];
  -[UIView __viewDelegate]((id *)&self->_view->super.super.isa);
  CGFloat v15 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  if (v15 == self) {
    -[UIView __setViewDelegate:](&self->_view->super.super.isa, 0);
  }
  view = self->_view;
  if (view)
  {
    *(void *)&view->_viewFlags &= ~0x80000000uLL;
    view = self->_view;
  }
  self->_view = 0;

  if (dyld_program_sdk_at_least())
  {
    embeddedView = self->__embeddedView;
    self->__embeddedView = 0;
  }
  else
  {
    objc_storeWeak((id *)&self->_transitioningDelegate, 0);
  }
  title = self->_title;
  self->_title = 0;

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  CGFloat v19 = self->_childViewControllers;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v64;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v64 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v63 + 1) + 8 * v23);
        if (*(void *)(v24 + 104))
        {
          if (os_variant_has_internal_diagnostics() && *(UIViewController **)(v24 + 104) != self)
          {
            double v50 = [MEMORY[0x1E4F28B00] currentHandler];
            CGFloat v25 = (objc_class *)objc_opt_class();
            double v49 = NSStringFromClass(v25);
            [v50 handleFailureInMethod:v51, self, @"UIViewController.m", 3326, @"Child VC has a different parent VC than self <%@: %p>: %@, parent: %@", v49, self, v24, *(void *)(v24 + 104) object file lineNumber description];
          }
          *(void *)(v24 + 104) = 0;
        }
        ++v23;
      }
      while (v21 != v23);
      uint64_t v26 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v63 objects:v73 count:16];
      uint64_t v21 = v26;
    }
    while (v26);
  }

  double v27 = self->_childViewControllers;
  childViewControllers = self->_childViewControllers;
  self->_childViewControllers = 0;

  parentViewController = self->_parentViewController;
  if (parentViewController)
  {
    [(UIViewController *)parentViewController removeChildViewController:self];
    self->_parentViewController = 0;
  }
  parentModalViewController = self->_parentModalViewController;
  if (parentModalViewController)
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v60 = 0u;
    long long v59 = 0u;
    BOOL v31 = parentModalViewController->_childModalViewControllers;
    uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v59 objects:v72 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v60 != v34) {
            objc_enumerationMutation(v31);
          }
          [*(id *)(*((void *)&v59 + 1) + 8 * j) setParentModalViewController:0];
        }
        uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v59 objects:v72 count:16];
      }
      while (v33);
    }

    self->_parentModalViewController = 0;
  }
  presentedStatusBarViewController = self->_presentedStatusBarViewController;
  self->_presentedStatusBarViewController = 0;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  double v37 = self->_childModalViewControllers;
  uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v55 objects:v71 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v56;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v56 != v40) {
          objc_enumerationMutation(v37);
        }
        [*(id *)(*((void *)&v55 + 1) + 8 * k) setParentModalViewController:0];
      }
      uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v55 objects:v71 count:16];
    }
    while (v39);
  }

  currentAction = self->_currentAction;
  self->_currentAction = 0;

  editButtonItem = self->_editButtonItem;
  self->_editButtonItem = 0;

  navigationItem = self->_navigationItem;
  self->_navigationItem = 0;

  overrideTraitCollectionsForChildren = self->_overrideTraitCollectionsForChildren;
  self->_overrideTraitCollectionsForChildren = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchDisplayController);
  [WeakRetained _clearViewController];

  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __27__UIViewController_dealloc__block_invoke;
  v54[3] = &unk_1E52E9EE0;
  v54[4] = self;
  +[UIKeyboardSceneDelegate performOnControllers:v54];
  [(UIViewController *)self _setExtensionContextUUID:0];

  v53.receiver = self;
  v53.super_class = (Class)UIViewController;
  [(UIResponder *)&v53 dealloc];
}

- (void)_setExtensionContextUUID:(id)a3
{
}

- (id)_effectiveExclusiveCollectionPhysicalButtonConfigurationViewController
{
  uint64_t v3 = [(UIViewController *)self _presentedStatusBarViewController];
  uint64_t v4 = [v3 _existingView];
  if (v4) {
    double v5 = v3;
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [v6 _existingPresentationControllerImmediate:0 effective:1];
    uint64_t v8 = [v7 presentationStyle];
    if (v8 == 7 || v8 == 20) {
      double v10 = 0;
    }
    else {
      double v10 = v6;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }
  double v12 = [v11 _effectiveExclusiveCollectionPhysicalButtonConfigurationViewController];
  CGFloat v13 = [(UIViewController *)v12 _existingView];
  if (v13) {
    double v14 = v12;
  }
  else {
    double v14 = 0;
  }
  CGFloat v15 = v14;

  if (!v15)
  {
    double v16 = [(UIViewController *)self _childViewControllerForExclusiveCollectionPhysicalButtonConfigurations];
    double v12 = [v16 _effectiveExclusiveCollectionPhysicalButtonConfigurationViewController];

    CGFloat v17 = [(UIViewController *)v12 _existingView];
    double v18 = v17 ? v12 : 0;
    CGFloat v19 = v18;

    if (!v19) {
      double v12 = self;
    }
  }

  return v12;
}

- (id)_childViewControllerForExclusiveCollectionPhysicalButtonConfigurations
{
  return 0;
}

- (void)_setPreferredTransition:(id)a3
{
  p_spiTransition = &self->_spiTransition;
  objc_storeStrong((id *)&self->_spiTransition, a3);
  id v6 = a3;
  id v7 = [(_UIViewControllerTransition *)*p_spiTransition _apiTransition];

  [(UIViewController *)self setPreferredTransition:v7];
}

- (void)setPreferredTransition:(id)a3
{
  double v5 = (UIViewControllerTransition *)a3;
  preferredTransition = self->_preferredTransition;
  if (preferredTransition != v5)
  {
    id v7 = v5;
    [(UIViewControllerTransition *)preferredTransition _wasAssignedToViewController:0];
    objc_storeStrong((id *)&self->_preferredTransition, a3);
    [(UIViewControllerTransition *)self->_preferredTransition _wasAssignedToViewController:self];
    double v5 = v7;
  }
}

- (id)_zoomTransitionController
{
  uint64_t v3 = objc_getAssociatedObject(self, &_UIViewControllerZoomTransitionControllerKey);
  if (!v3)
  {
    uint64_t v3 = objc_opt_new();
    objc_setAssociatedObject(self, &_UIViewControllerZoomTransitionControllerKey, v3, (void *)1);
  }
  return v3;
}

- (void)_observeScrollView:(id)a3 temporaryCoordinatingReplacementDidChange:(id)a4
{
  if (self->_effectiveContentScrollViews) {
    -[UIViewController _performContentScrollViewUpdatesNotifyingObservers]((uint64_t)self);
  }
}

- (void)_setInternalContentScrollView:(id)a3
{
  double v5 = (UIScrollView *)a3;
  if (self->_internalContentScrollView != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_internalContentScrollView, a3);
    -[UIViewController _performContentScrollViewUpdatesNotifyingObservers]((uint64_t)self);
    double v5 = v6;
  }
}

- (void)setContentScrollView:(UIScrollView *)scrollView forEdge:(NSDirectionalRectEdge)edge
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = scrollView;
  id v7 = v6;
  NSDirectionalRectEdge v8 = edge & 5;
  if ((edge & 5) != 0)
  {
    uint64_t v9 = v6;
    double v10 = v9;
    if (self)
    {
      if (v9 && !self->_observableScrollViews)
      {
        id v11 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
        observableScrollViews = self->_observableScrollViews;
        self->_observableScrollViews = v11;
      }
      *(void *)double v14 = MEMORY[0x1E4F143A8];
      *(void *)&v14[8] = 3221225472;
      *(void *)&v14[16] = __50__UIViewController__setContentScrollView_forEdge___block_invoke;
      CGFloat v15 = &unk_1E52E9F58;
      NSDirectionalRectEdge v18 = v8;
      double v16 = v10;
      CGFloat v17 = self;
      __50__UIViewController__setContentScrollView_forEdge___block_invoke(v14, 1);
      (*(void (**)(unsigned char *, uint64_t))&v14[16])(v14, 4);
      -[UIViewController _performContentScrollViewUpdatesNotifyingObservers]((uint64_t)self);
    }
  }
  else
  {
    CGFloat v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("ContentScrollView", &setContentScrollView_forEdge____s_category)
                       + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)double v14 = 138412546;
      *(void *)&v14[4] = v7;
      *(_WORD *)&v14[12] = 2048;
      *(void *)&v14[14] = edge;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "setting contentScrollView, %@, ignored for edge value, %ld, not containing NSDirectionalRectEdgeTop or NSDirectionalRectEdgeBottom", v14, 0x16u);
    }
  }
}

void __50__UIViewController__setContentScrollView_forEdge___block_invoke(void *a1, uint64_t a2)
{
  if ((a2 & ~a1[6]) == 0)
  {
    uint64_t v2 = a1[4];
    uint64_t v3 = *(void **)(a1[5] + 584);
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:a2];
    id v5 = (id)v4;
    if (v2) {
      [v3 setObject:v2 forKey:v4];
    }
    else {
      [v3 removeObjectForKey:v4];
    }
  }
}

- (void)_performContentScrollViewUpdatesNotifyingObservers
{
  if (!a1) {
    return;
  }
  id v23 = [*(id *)(a1 + 600) objectForKey:&unk_1ED3F3A80];
  id v2 = [*(id *)(a1 + 600) objectForKey:&unk_1ED3F3A98];
  -[UIViewController _resolveContentScrollViewForEdge:](a1, 1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController _resolveContentScrollViewForEdge:](a1, 4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(id)a1 presentingViewController];
  id v6 = [v5 navigationController];
  id v7 = [v6 _outermostNavigationController];
  NSDirectionalRectEdge v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    double v10 = [(id)a1 navigationController];
    id v9 = [v10 _outermostNavigationController];
  }
  id v11 = [0 presentingViewController];
  double v12 = -[UIViewController _containingTabBarController](v11);
  CGFloat v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    uint64_t v22 = v4;
    CGFloat v15 = -[UIViewController _containingTabBarController](v9);
    double v16 = v15;
    if (v15)
    {
      id v14 = v15;
    }
    else
    {
      CGFloat v17 = -[UIViewController _containingTabBarController](v5);
      NSDirectionalRectEdge v18 = v17;
      if (v17)
      {
        id v19 = v17;
      }
      else
      {
        -[UIViewController _containingTabBarController]((void *)a1);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v14 = v19;
    }
    id v4 = v22;
  }

  if (v23 != v3 && v2 != v4)
  {
    if (v23 != v2)
    {
      objc_msgSend(v9, "_observableScrollViewDidChangeFrom:forViewController:edges:");
LABEL_22:
      objc_msgSend(v9, "_observableScrollViewDidChangeFrom:forViewController:edges:", v2, a1, 4, v22);
      uint64_t v20 = v14;
      goto LABEL_23;
    }
    objc_msgSend(v9, "_observableScrollViewDidChangeFrom:forViewController:edges:");
    uint64_t v20 = v14;
LABEL_23:
    objc_msgSend(v20, "_observableScrollViewDidChangeFrom:forViewController:edges:", v22);
    goto LABEL_24;
  }
  if (v23 != v3)
  {
    uint64_t v20 = v9;
    goto LABEL_23;
  }
  if (v2 != v4) {
    goto LABEL_22;
  }
LABEL_24:
  if (((*(_DWORD *)(a1 + 376) >> 1) & 3u) - 1 <= 1) {
    -[UIViewController _updateViewSafeAreaInsetsAndEagerlyUpdateContentScrollView:]((double *)a1);
  }
  uint64_t v21 = *(void **)(a1 + 608);
  if (v21) {
    [v21 reconfigureContentScrollView];
  }
}

- (BOOL)_hasAppeared
{
  return (*(void *)&self->_viewControllerFlags & 6) == 4;
}

- (void)_setStoryboard:(id)a3
{
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (v6) {
    [v6 targetTransform];
  }
  else {
    memset(&v48, 0, sizeof(v48));
  }
  IsIdentitCGFloat y = CGAffineTransformIsIdentity(&v48);
  if (!IsIdentity)
  {
    id v9 = [(UIViewController *)self _existingView];
    uint64_t v10 = [v9 window];
    if (v10)
    {
      id v11 = (void *)v10;
      int v12 = [(id)objc_opt_class() _shouldSendLegacyMethodsFromViewWillTransitionToSize];

      if (!v12) {
        goto LABEL_12;
      }
      [v7 transitionDuration];
      double v14 = v13;
      CGFloat v15 = [v7 containerView];
      double v16 = [v15 window];
      CGFloat v17 = v16;
      if (v16)
      {
        id v9 = v16;
        NSDirectionalRectEdge v18 = self;
      }
      else
      {
        NSDirectionalRectEdge v18 = self;
        id v19 = [(UIViewController *)self _existingView];
        id v9 = [v19 window];
      }
      uint64_t v20 = [v9 _toWindowOrientation];
      uint64_t v21 = [v9 _fromWindowOrientation];
      [(UIViewController *)v18 willRotateToInterfaceOrientation:v20 duration:v14];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __71__UIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
      v47[3] = &unk_1E52E9AD8;
      v47[4] = v18;
      v47[5] = v20;
      *(double *)&v47[6] = v14;
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __71__UIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
      v46[3] = &unk_1E52EA170;
      v46[4] = v18;
      v46[5] = v21;
      [v7 animateAlongsideTransition:v47 completion:v46];
    }
  }
LABEL_12:
  uint64_t v22 = self;
  if ([(id)objc_opt_class() _shouldForwardViewWillTransitionToSize])
  {
    id v23 = v7;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v24 = [(UIViewController *)self _childViewControllersToSendViewWillTransitionToSize];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      int v27 = !IsIdentity;
      uint64_t v28 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v43 != v28) {
            objc_enumerationMutation(v24);
          }
          uint64_t v30 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          if ((*(void *)(v30 + 376) & 0x40000000000000) != 0)
          {
            uint64_t v33 = [*(id *)(*((void *)&v42 + 1) + 8 * i) _existingView];
            [v33 frame];
            double v32 = v34;
            double v31 = v35;

            uint64_t v22 = self;
          }
          else
          {
            double v32 = *(double *)(v30 + 440);
            double v31 = *(double *)(v30 + 448);
          }
          -[UIViewController sizeForChildContentContainer:withParentContainerSize:](v22, "sizeForChildContentContainer:withParentContainerSize:", v30, width, height);
          BOOL v38 = v32 != v36;
          if (v31 != v37) {
            BOOL v38 = 1;
          }
          if ((v38 | v27) == 1)
          {
            double v39 = v36;
            double v40 = v37;
            objc_msgSend((id)v30, "viewWillTransitionToSize:withTransitionCoordinator:", v23);
            *(double *)(v30 + 440) = v39;
            *(double *)(v30 + 448) = v40;
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v42 objects:v49 count:16];
      }
      while (v26);
    }

    id v7 = v23;
    [(UIViewController *)v22 _sendViewWillTransitionToSizeToPresentationController:width withTransitionCoordinator:height];
  }
}

- (void)_sendViewWillTransitionToSizeToPresentationController:(double)a3 withTransitionCoordinator:(double)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (a1)
  {
    NSDirectionalRectEdge v8 = [a1 _presentationController];
    id v9 = v8;
    if (v8)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __100__UIViewController__sendViewWillTransitionToSizeToPresentationController_withTransitionCoordinator___block_invoke;
      v31[3] = &unk_1E52E9D28;
      v31[4] = a1;
      id v32 = v8;
      double v34 = a3;
      double v35 = a4;
      id v33 = v7;
      +[UIViewController _performWithoutDeferringTransitions:v31];
    }
    uint64_t v26 = v9;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v10 = [a1 childViewControllers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * v14);
          if (([(id)objc_opt_class() _shouldForwardViewWillTransitionToSize] & 1) == 0)
          {
            if ((*(void *)(v15 + 376) & 0x40000000000000) != 0)
            {
              NSDirectionalRectEdge v18 = [(id)v15 _existingView];
              [v18 frame];
              double v16 = v19;
              double v17 = v20;
            }
            else
            {
              double v16 = *(double *)(v15 + 440);
              double v17 = *(double *)(v15 + 448);
            }
            objc_msgSend(a1, "sizeForChildContentContainer:withParentContainerSize:", v15, a3, a4);
            double v23 = v22;
            double v24 = v21;
            if (v16 != v22 || v17 != v21) {
              goto LABEL_22;
            }
            if (v7) {
              [v7 targetTransform];
            }
            else {
              memset(&v36, 0, sizeof(v36));
            }
            if (!CGAffineTransformIsIdentity(&v36))
            {
LABEL_22:
              [(UIViewController *)v15 _sendViewWillTransitionToSizeToPresentationController:v23 withTransitionCoordinator:v24];
              *(double *)(v15 + 440) = v23;
              *(double *)(v15 + 448) = v24;
            }
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v12);
    }
  }
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  sub_1857D83B8(a3, (uint64_t)v5);
  id v3 = (void *)v5[0];
  id v4 = (id)v5[4];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (UIContentUnavailableConfigurationState)_bridgedContentUnavailableConfigurationState
{
  id v2 = self;
  sub_1857D83B8([(UIViewController *)v2 _contentUnavailableConfigurationState], (uint64_t)v8);

  id v3 = (void *)v8[0];
  id v7 = (void *)v8[4];
  sub_1857D8950();
  id v5 = v4;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return (UIContentUnavailableConfigurationState *)v5;
}

- (id)_contentUnavailableConfigurationState
{
  id v3 = [UIContentUnavailableConfigurationState alloc];
  id v4 = [(UIViewController *)self traitCollection];
  id v5 = [(UIContentUnavailableConfigurationState *)v3 initWithTraitCollection:v4];

  id v6 = [(UIViewController *)self navigationItem];
  id v7 = [v6 searchController];
  NSDirectionalRectEdge v8 = [v7 searchBar];
  id v9 = [v8 text];
  [(UIContentUnavailableConfigurationState *)v5 setSearchText:v9];

  return v5;
}

uint64_t __34__UIViewController__doCommonSetup__block_invoke_2()
{
  uint64_t result = dyld_program_sdk_at_least();
  if ((result & 1) == 0)
  {
    objc_opt_class();
    return _class_setCustomDeallocInitiation();
  }
  return result;
}

void __70__UIViewController__forceParentViewControllerAsParentTraitEnvironment__block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EB25BB26 = [v0 isEqualToString:@"com.apple.mobilecal"];
}

- (UIViewController)init
{
  return [(UIViewController *)self initWithNibName:0 bundle:0];
}

- (void)updateViewConstraints
{
  int v3 = _UIObservationTrackingEnabled();
  view = self->_view;
  if (v3)
  {
    [(UIView *)view _updateConstraintsWithObservationTracking];
  }
  else
  {
    [(UIView *)view updateConstraints];
  }
}

- (void)_setIgnoreAppSupportedOrientations:(BOOL)a3
{
  self->_ignoreAppSupportedOrientations = a3;
}

- (void)removeKeyCommand:(UIKeyCommand *)keyCommand
{
  uint64_t v10 = keyCommand;
  addedKeyCommands = self->_addedKeyCommands;
  if (addedKeyCommands)
  {
    unint64_t v5 = [(NSArray *)addedKeyCommands count];
    id v6 = [(NSArray *)self->_addedKeyCommands ui_arrayByRemovingLastObjectEqualTo:v10];
    if ([(NSArray *)v6 count] < v5)
    {
      id v7 = self->_addedKeyCommands;
      self->_addedKeyCommands = v6;
      goto LABEL_8;
    }
  }
  p_interfaceBuilderKeyCommands = (id *)&self->_interfaceBuilderKeyCommands;
  if (!*p_interfaceBuilderKeyCommands) {
    goto LABEL_9;
  }
  unint64_t v9 = [*p_interfaceBuilderKeyCommands count];
  id v7 = objc_msgSend(*p_interfaceBuilderKeyCommands, "ui_arrayByRemovingLastObjectEqualTo:", v10);
  if ([v7 count] < v9) {
    objc_storeStrong(p_interfaceBuilderKeyCommands, v7);
  }
LABEL_8:

LABEL_9:
}

- (id)_visibleView
{
  id v2 = -[UIViewController viewControllerForRotation](self);
  int v3 = [v2 dropShadowView];
  if (v3) {
    [v2 dropShadowView];
  }
  else {
  id v4 = [v2 view];
  }

  return v4;
}

- (UIDropShadowView)dropShadowView
{
  return (UIDropShadowView *)self->_dropShadowView;
}

- (id)viewControllerForRotation
{
  if (a1)
  {
    id v1 = a1;
    id v2 = (void *)MEMORY[0x18C108260]();
    int v3 = [v1 _window];
    id v4 = [v3 _rotationViewControllers];

    if (([v1 isPerformingModalTransition] & 1) == 0)
    {
      uint64_t v5 = [v1 childModalViewController];
      if (v5)
      {
        id v6 = (void *)v5;
        id v7 = [v1 childModalViewController];
        char v8 = [v4 containsObject:v7];

        if ((v8 & 1) == 0)
        {
          unint64_t v9 = [v1 childModalViewController];
          uint64_t v10 = -[UIViewController viewControllerForRotation]();

          id v1 = (id)v10;
        }
      }
    }
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

- (id)registerForTraitChanges:(id)a3 withAction:(SEL)a4
{
  id v6 = +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  id v7 = [(UIViewController *)self _registerForTraitTokenChanges:v6 withTarget:self action:a4];

  return v7;
}

- (void)window:(id)a3 statusBarWillChangeFromHeight:(double)a4 toHeight:(double)a5
{
  id v36 = a3;
  id v6 = [(UIViewController *)self _viewControllerForRotation];
  uint64_t v7 = [v6 _existingView];
  if (v7)
  {
    char v8 = (void *)v7;
    while (1)
    {
      id v9 = v36;
      id v10 = v6;
      uint64_t v11 = v10;
      if (self) {
        break;
      }
LABEL_17:

      id v6 = _nextWindowSizedViewController(v11);

      uint64_t v35 = [v6 _existingView];

      char v8 = (void *)v35;
      if (!v35) {
        goto LABEL_18;
      }
    }
    uint64_t v12 = [v10 _existingView];
    uint64_t v13 = [v11 _existingPresentationControllerImmediate:0 effective:1];
    uint64_t v14 = [v13 containerView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = 0;
    }
    else
    {
      if (!v14 || ![v12 isDescendantOfView:v14]) {
        goto LABEL_10;
      }
      id v15 = v14;
      uint64_t v14 = v12;
      uint64_t v12 = v15;
    }

    uint64_t v14 = v15;
LABEL_10:
    uint64_t v16 = [v12 window];
    if (v16)
    {
      double v17 = (void *)v16;
      NSDirectionalRectEdge v18 = [v9 screen];
      int v19 = [v18 _isEmbeddedScreen];

      if (v19)
      {
        [v9 frame];
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        long long v28 = [v9 screen];
        [v28 bounds];
        v39.origin.CGFloat x = v29;
        v39.origin.CGFloat y = v30;
        v39.size.double width = v31;
        v39.size.double height = v32;
        v38.origin.CGFloat x = v21;
        v38.origin.CGFloat y = v23;
        v38.size.double width = v25;
        v38.size.double height = v27;
        BOOL v33 = CGRectEqualToRect(v38, v39);

        if (v33)
        {
          double v34 = [v9 windowScene];
          [v34 interfaceOrientation];
        }
        if (([v11 _freezeLayoutForOrientationChangeOnDismissal] & 1) == 0) {
          [v11 _updateLayoutForStatusBarAndInterfaceOrientation];
        }
      }
    }

    goto LABEL_17;
  }
LABEL_18:
}

- (id)_safeViewControllerForRotationWithDismissCheck:(BOOL)a3
{
  uint64_t v5 = -[UIViewController _viewControllerForRotationWithDismissCheck:](self, a3);
  id v6 = objc_msgSend(v5, "__autorotationSanityCheckObjectFromSource:selector:", self, a2);

  return v6;
}

- (id)_viewControllerForRotationWithDismissCheck:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    id v4 = [a1 _existingView];
    uint64_t v5 = [v4 window];

    if (v5)
    {
      id v2 = v2;
    }
    else
    {
      id v6 = [v2 presentedViewController];
      if (a2
        && (-[UIViewController _presentedViewControllerStateIsValidForSourcingSupportedOrientations:](v2, v6) & 1) == 0)
      {
        -[UIViewController _nearestFullScreenAncestorViewController](v2);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else if (v6)
      {
        -[UIViewController _viewControllerForRotationWithDismissCheck:](v6, a2);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v7 = v2;
      }
      id v2 = v7;
    }
  }
  return v2;
}

- (BOOL)shouldAutorotate
{
  if (dyld_program_sdk_at_least() && [(UIViewController *)self isViewLoaded])
  {
    int v3 = [(UIViewController *)self view];
    id v4 = [v3 window];

    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = [(UIViewController *)self _window];
    if (!v4)
    {
LABEL_8:
      BOOL v7 = (*(void *)&self->_viewControllerFlags >> 12) & 1;
      goto LABEL_9;
    }
  }
  uint64_t v5 = [v4 screen];
  id v6 = +[UIScreen mainScreen];

  if (v5 == v6) {
    goto LABEL_8;
  }
  LOBYTE(v7) = 0;
LABEL_9:

  return v7;
}

- (id)_safePrimaryViewControllerForAutorotationBelowWindow:(id)a3
{
  uint64_t v5 = -[UIViewController _primaryViewControllerForAutorotationBelowWindow:](self, a3);
  id v6 = objc_msgSend(v5, "__autorotationSanityCheckObjectFromSource:selector:", self, a2);

  return v6;
}

- (id)_primaryViewControllerForAutorotationBelowWindow:(void *)a1
{
  if (a1)
  {
    id v2 = -[UIViewController _windowForAutorotationBelowWindow:](a1, a2);
    int v3 = v2;
    if (v2)
    {
      id v4 = [v2 rootViewController];
      uint64_t v5 = [v4 _viewControllerForSupportedInterfaceOrientationsWithDismissCheck:1];

      id v6 = [v5 _existingPresentationControllerImmediate:0 effective:0];
      char v7 = [v6 _shouldKeepCurrentFirstResponder];

      if ((v7 & 1) == 0)
      {
        uint64_t v8 = [v5 presentingViewController];
        id v9 = (void *)v8;
        if (v8) {
          id v10 = (void *)v8;
        }
        else {
          id v10 = v5;
        }
        id v11 = v10;

        uint64_t v5 = v11;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)_safeWindowForAutorotationBelowWindow:(id)a3
{
  uint64_t v5 = -[UIViewController _windowForAutorotationBelowWindow:](self, a3);
  id v6 = objc_msgSend(v5, "__autorotationSanityCheckObjectFromSource:selector:", self, a2);

  return v6;
}

- (id)_viewControllerForRotation
{
  BOOL v3 = _UIAppUseModernRotationAndPresentationBehaviors();
  return -[UIViewController _viewControllerForRotationWithDismissCheck:](self, v3);
}

- (void)_setNeedsUpdateContentUnavailableConfiguration
{
  *((_WORD *)&self->_viewControllerFlags + 4) |= 0x10u;
  if ([(UIViewController *)self isViewLoaded])
  {
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      -[UIViewController _performContentUnavailableConfigurationStateUpdate]((uint64_t)self);
    }
    else
    {
      id v3 = [(UIViewController *)self view];
      [v3 setNeedsLayout];
    }
  }
}

- (void)awakeFromNib
{
  v4.receiver = self;
  v4.super_class = (Class)UIViewController;
  [&v4 awakeFromNib];
  if ((*(void *)&self->_viewControllerFlags & 0x80) != 0) {
    char v3 = 0;
  }
  else {
    char v3 = -[UIViewController _doesSelfOrAncestorPassPredicate:]((uint64_t)self, &__block_literal_global_420);
  }
  if ([(UIViewController *)self isViewLoaded])
  {
    if ((v3 & 1) == 0) {
      -[UIViewController _sendViewDidLoadWithAppearanceProxyObjectTaggingEnabled](self);
    }
  }
}

void __69__UIViewController__whitelistOfSubclassableViewControllersMarkedSafe__block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  id v10 = (void *)qword_1EB25BBF8;
  qword_1EB25BBF8 = v9;
}

- (UIBarButtonItem)editButtonItem
{
  editButtonItem = self->_editButtonItem;
  if (!editButtonItem)
  {
    if ((*(void *)&self->_viewControllerFlags & 8) != 0) {
      uint64_t v4 = @"Done";
    }
    else {
      uint64_t v4 = @"Edit";
    }
    uint64_t v5 = _UINSLocalizedStringWithDefaultValue(v4, v4);
    if ((*(void *)&self->_viewControllerFlags & 8) != 0) {
      uint64_t v6 = @"Edit";
    }
    else {
      uint64_t v6 = @"Done";
    }
    uint64_t v7 = _UINSLocalizedStringWithDefaultValue(v6, v6);
    uint64_t v8 = (*(void *)&self->_viewControllerFlags >> 2) & 2;
    uint64_t v9 = [[UIBarButtonItem alloc] initWithTitle:v5 style:v8 target:self action:sel__toggleEditing_];
    id v10 = self->_editButtonItem;
    self->_editButtonItem = v9;

    id v11 = [[UIBarButtonItem alloc] initWithTitle:v7 style:v8 ^ 2 target:0 action:0];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", self->_editButtonItem, v11, 0);
    [(UIBarButtonItem *)self->_editButtonItem _setPossibleItemVariations:v12];

    editButtonItem = self->_editButtonItem;
  }
  return editButtonItem;
}

uint64_t __157__UIViewController__presentViewController_modalSourceViewController_presentationController_animationController_interactionController_handoffData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    [*(id *)(a1 + 32) _setPresentedStatusBarViewController:0];
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 _setPresentedUserInterfaceStyleViewController:0];
  }
  return result;
}

uint64_t __88__UIViewController__setPresentedStatusBarViewController_shouldJoinAnimationsInProgress___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    if (v4)
    {
      [v4 setNeedsStatusBarAppearanceUpdate];
      [v4 _setNeedsUserInterfaceAppearanceUpdate];
      return [v4 setNeedsWhitePointAdaptivityStyleUpdate];
    }
  }
  return result;
}

- (id)storyboardIdentifier
{
  uint64_t v2 = self->_storyboardIdentifier;
  return v2;
}

- (void)setStoryboardIdentifier:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  if (self->_storyboardIdentifier != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_storyboardIdentifier, a3);
    uint64_t v5 = v6;
  }
}

- (void)applicationWillSuspend
{
  *(void *)&self->_viewControllerFlags |= 0x200uLL;
}

- (void)_attachTab:(uint64_t)a1
{
  obuint64_t j = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

    uint64_t v4 = obj;
    if (obj && WeakRetained)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel__attachTab_ object:a1 file:@"UIViewController.m" lineNumber:14801 description:@"Cannot reuse the same view controller for multiple UITab instances"];

      uint64_t v4 = obj;
    }
    objc_storeWeak((id *)(a1 + 48), v4);
  }
}

+ (CGSize)defaultFormSheetSizeForScreenSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = +[_UIPresentationControllerDefaultVisualStyleProvider sharedInstance];
  uint64_t v6 = [v5 defaultSheetMetrics];
  objc_msgSend(v6, "defaultFormSheetSizeForScreenSize:", width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (id)transitioningDelegate
{
  uint64_t v3 = [(UIViewController *)self _overrideTransitioningDelegate];
  uint64_t v4 = v3;
  if (v3) {
    id WeakRetained = v3;
  }
  else {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_transitioningDelegate);
  }
  uint64_t v6 = WeakRetained;

  return v6;
}

- (void)_endDelayingPresentation
{
  if ([(UIViewController *)self _isDelayingPresentation])
  {
    objc_getAssociatedObject(self, &unk_1EB25BB23);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (![v12 decrementRequestCount])
    {
      uint64_t v3 = self;
      if (v12)
      {
        uint64_t v4 = *((void *)v12 + 6);
        if (v4)
        {
          dispatch_source_cancel(v4);
          uint64_t v5 = (id *)v12;
          if (!*((unsigned char *)v12 + 8))
          {
            uint64_t v6 = [v12 delayingController];
            double v7 = (objc_class *)objc_opt_class();
            double v8 = objc_msgSend(NSString, "stringWithFormat:", @"Finishing delayed presentation of <%s: %p>", class_getName(v7), v6);
            double v9 = [v12 windowSceneIgnoringEvents];
            [v9 _endIgnoringInteractionEventsForReason:v8];

            [v12 setWindowSceneIgnoringEvents:0];
            uint64_t v5 = (id *)v12;
          }
          id v10 = v5[3];
          double v11 = [v10 target];
          objc_setAssociatedObject(v11, &unk_1EB25BB22, 0, (void *)1);

          objc_setAssociatedObject(v3, &unk_1EB25BB23, 0, (void *)1);
          [v10 invoke];
        }
        else
        {
          objc_setAssociatedObject(v3, &unk_1EB25BB23, 0, (void *)1);
        }
      }
    }
  }
}

- (void)_presentViewController:(id)a3 modalSourceViewController:(id)a4 presentationController:(id)a5 animationController:(id)a6 interactionController:(id)a7 handoffData:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (![(UIViewController *)self _shouldPresentViewController:v15 withPresentationController:v17])goto LABEL_40; {
  id v64 = v19;
  }
  uint64_t v22 = objc_opt_class();
  id v63 = v18;
  if (v22 == objc_opt_class())
  {
    uint64_t v23 = [v18 transition];
    BOOL v24 = v23 != 0;
  }
  else
  {
    uint64_t v23 = 0;
    BOOL v24 = 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGFloat v25 = self;
  }
  else
  {
    CGFloat v25 = [(UIViewController *)self _splitViewControllerEnforcingClass:1];
  }
  id v65 = v20;
  long long v60 = v25;
  [(UIViewController *)v25 _descendantWillPresentViewController:v15 modalSourceViewController:v16 presentationController:v17 animated:v24];
  double v26 = [[UIViewControllerAction alloc] initWithViewController:v15 name:@"PresentModal" transition:v23];
  currentAction = self->_currentAction;
  self->_currentAction = v26;

  long long v28 = [(UIViewController *)self currentAction];
  CGFloat v30 = v28;
  if (v28) {
    objc_setProperty_nonatomic_copy(v28, v29, v21, 24);
  }

  [v15 _setModalSourceViewController:v16];
  CGFloat v31 = [(UIViewController *)self view];
  CGFloat v32 = +[_UIEditMenuSceneComponent sceneComponentForView:v31];
  [v32 dismissCurrentMenu];

  uint64_t v33 = 16;
  if (v24) {
    uint64_t v33 = 4194320;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFFFBFFFFFLL | v33;
  uint64_t v34 = [(UIViewController *)self view];
  obuint64_t j = [(id)v34 firstResponder];

  -[UIViewController _addChildModalViewController:]((id *)&self->super.super.isa, v15);
  [v15 _presentingViewControllerWillChange:self];
  objc_getClass("UIActivityViewController");
  LODWORD(v34) = objc_opt_isKindOfClass();
  objc_opt_class();
  int v35 = v34 & (objc_opt_isKindOfClass() ^ 1);
  id v18 = v63;
  int v59 = v35;
  if ([v17 _shouldPreserveFirstResponder] & 1) != 0 || (v35)
  {
    id v36 = [(UIViewController *)self view];
    double v37 = [v36 firstResponder];
    modalPreservedFirstResponder = self->_modalPreservedFirstResponder;
    self->_modalPreservedFirstResponder = v37;

    id v19 = v64;
    if (!self->_modalPreservedFirstResponder) {
      objc_storeStrong((id *)&self->_modalPreservedFirstResponder, obj);
    }
  }
  else
  {
    id v19 = v64;
  }
  id v20 = v65;
  CGRect v39 = off_1E52D4000;
  if (self->_modalPreservedFirstResponder)
  {
    id v57 = v21;
    id v58 = v16;
    double v40 = -[UIViewController _keyboardSceneDelegate](self);
    double v41 = [(UIViewController *)self view];
    long long v42 = [v41 window];
    long long v43 = [v40 responder];
    long long v44 = [v43 _responderWindow];
    if (v42 == v44)
    {
      int v46 = 1;
    }
    else
    {
      long long v45 = [v40 responder];
      if (v45) {
        int v46 = [v17 _preserveResponderAcrossWindows];
      }
      else {
        int v46 = 0;
      }

      id v20 = v65;
    }

    double v47 = [v40 responder];
    if ([v47 _shouldRestorationInputViewsOnlyWhenKeepingFirstResponder])
    {
      int v48 = [v17 _shouldKeepCurrentFirstResponder];

      int v49 = v48 & v46;
      id v20 = v65;
      id v21 = v57;
      id v16 = v58;
      id v18 = v63;
      if (v49 != 1) {
        goto LABEL_34;
      }
    }
    else
    {

      id v21 = v57;
      id v16 = v58;
      id v18 = v63;
      if ((v46 & 1) == 0) {
        goto LABEL_34;
      }
    }
    if (([v17 _shouldKeepCurrentFirstResponder] | v59))
    {
      uint64_t v50 = [MEMORY[0x1E4F29238] valueWithPointer:self];
      objc_msgSend(v40, "_preserveInputViewsWithId:animated:", v50, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
    }
    else
    {
      if (dyld_program_sdk_at_least() && !dyld_program_sdk_at_least()) {
        goto LABEL_34;
      }
      uint64_t v50 = [MEMORY[0x1E4F29238] valueWithPointer:self];
      [v40 _preserveInputViewsWithId:v50];
    }

LABEL_34:
    id v19 = v64;
    CGRect v39 = off_1E52D4000;
  }
  [(UIViewController *)self _setPresentationController:v17];
  [v15 _presentingViewControllerIsChanging:self];
  SEL v51 = [v17 presentingViewController];

  if (v51 != self)
  {
    long long v55 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v56 = [v17 presentingViewController];
    [v55 handleFailureInMethod:a2, self, @"UIViewController.m", 9187, @"Attempt to present %@, which has a presentingViewController of %@, expected %@", v17, v56, self object file lineNumber description];

    id v20 = v65;
  }
  double v52 = [(UIViewController *)self _window];
  objc_msgSend(v17, "_presentWithAnimationController:inWindow:interactionController:animated:handoffData:", v18, v52, v19, -[__objc2_class areAnimationsEnabled](v39[422], "areAnimationsEnabled"), v20);

  objc_super v53 = [(UIViewController *)self transitionCoordinator];
  [(UIViewController *)self _setPresentedStatusBarViewController:v15];
  [(UIViewController *)self _setPresentedUserInterfaceStyleViewController:v15];
  if (v53)
  {
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __157__UIViewController__presentViewController_modalSourceViewController_presentationController_animationController_interactionController_handoffData_completion___block_invoke;
    v66[3] = &unk_1E52DA598;
    v66[4] = self;
    [v53 animateAlongsideTransition:0 completion:v66];
  }
  CGFloat v54 = [v17 _parentPresentationController];
  [v54 _containedViewControllerModalStateChanged];

LABEL_40:
}

+ (int)_keyboardDirectionForTransition:(int)a3
{
  int result = 4;
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      return 5;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 10:
    case 11:
      return 0;
    case 8:
    case 9:
    case 12:
      goto LABEL_2;
    default:
      if (a3 != 18) {
        return 0;
      }
LABEL_2:
      double v8 = +[UIDevice currentDevice];
      uint64_t v9 = [v8 userInterfaceIdiom];

      if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        return 0;
      }
      else {
        return 3;
      }
  }
}

- (void)_presentingViewControllerWillChange:(id)a3
{
  uint64_t viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  unint64_t v4 = viewControllerFlags & 0xFFFFFFFFFE7FFFFFLL | 0x800000;
  uint64_t v5 = viewControllerFlags | 0x1800000;
  if (!a3) {
    uint64_t v5 = v4;
  }
  *(void *)&self->_uint64_t viewControllerFlags = v5;
}

- (BOOL)_shouldPresentViewController:(id)a3 withPresentationController:(id)a4
{
  return 1;
}

- (void)_setPresentedUserInterfaceStyleViewController:(id)a3
{
  uint64_t v5 = (UIViewController *)a3;
  if (self->_presentedUserInterfaceStyleViewController != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_presentedUserInterfaceStyleViewController, a3);
    [(UIViewController *)self _setNeedsUserInterfaceAppearanceUpdate];
    uint64_t v5 = v6;
  }
}

- (void)_setPresentedStatusBarViewController:(id)a3 shouldJoinAnimationsInProgress:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (UIViewController *)a3;
  if (self->_presentedStatusBarViewController != v7)
  {
    objc_storeStrong((id *)&self->_presentedStatusBarViewController, a3);
    if (!v4) {
      goto LABEL_4;
    }
    double v8 = [(UIViewController *)self _definiteTransitionCoordinator];
    void v10[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __88__UIViewController__setPresentedStatusBarViewController_shouldJoinAnimationsInProgress___block_invoke;
    v11[3] = &unk_1E52DA598;
    v11[4] = self;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __88__UIViewController__setPresentedStatusBarViewController_shouldJoinAnimationsInProgress___block_invoke_2;
    v10[3] = &unk_1E52DA598;
    char v9 = [v8 animateAlongsideTransition:v11 completion:v10];

    if ((v9 & 1) == 0)
    {
LABEL_4:
      [(UIViewController *)self setNeedsStatusBarAppearanceUpdate];
      [(UIViewController *)self _setNeedsUserInterfaceAppearanceUpdate];
      [(UIViewController *)self setNeedsWhitePointAdaptivityStyleUpdate];
    }
    -[UIViewController _invalidateBehaviorPreferences](self);
  }
}

- (void)_setPresentedStatusBarViewController:(id)a3
{
}

- (void)_setPresentationController:(id)a3
{
  uint64_t v5 = (UIPresentationController *)a3;
  p_presentationController = &self->_presentationController;
  if (self->_presentationController != v5)
  {
    double v11 = v5;
    objc_storeStrong((id *)&self->_presentationController, a3);
    double v7 = [(UIViewController *)self childModalViewController];
    double v8 = v7;
    if (*p_presentationController) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      id v10 = [v7 view];
      _UIViewTopDownSubtreeTraversal((uint64_t)v10, &__block_literal_global_808, 0);
    }
    uint64_t v5 = v11;
  }
}

- (void)_setModalSourceViewController:(id)a3
{
  self->_modalSourceViewController = (UIViewController *)a3;
}

- (id)_completionBlock
{
  if (self->_currentAction)
  {
    uint64_t v2 = [(UIViewController *)self currentAction];
    uint64_t v3 = (void *)v2;
    if (v2) {
      BOOL v4 = *(void **)(v2 + 24);
    }
    else {
      BOOL v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)_presentViewController:(id)a3 withAnimationController:(id)a4 completion:(id)a5
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  SEL v138 = a2;
  BOOL v9 = a3;
  id location = v9;
  double v136 = (UIViewControllerBuiltinTransitionViewAnimator *)a4;
  id v10 = a5;
  double v11 = [(UIViewController *)self _focusSystem];
  id v12 = [v11 focusedItem];

  if (v12) {
    [(UIViewController *)self _rememberPresentingFocusedItem:v12];
  }
  uint64_t v13 = +[_UIStatistics previewInteractionTapCount];
  [v13 incrementValueBy:1];

  uint64_t v14 = +[_UIStatistics previewInteractionTapCount];
  [v14 setSampleRate:0.0];

  [v9 _viewControllerPresentationDidInitiate];
  unint64_t v15 = [v9 modalPresentationStyle];
  if (os_variant_has_internal_diagnostics())
  {
    if (v15 == -2)
    {
      objc_super v100 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = -2;
        _os_log_fault_impl(&dword_1853B0000, v100, OS_LOG_TYPE_FAULT, "Effective modal presentation style should never return automatic! It returned %lu.", buf, 0xCu);
      }
    }
  }
  else if (v15 == -2)
  {
    double v101 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25BBB0) + 8);
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = -2;
      _os_log_impl(&dword_1853B0000, v101, OS_LOG_TYPE_ERROR, "Effective modal presentation style should never return automatic! It returned %lu.", buf, 0xCu);
    }
  }
  if (-[UIViewController _isWaitingForDelayedPresentation](self))
  {
    objc_getAssociatedObject(self, &unk_1EB25BB22);
    id v16 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    NSLog(&cfstr_AttemptToPrese_0.isa, v9, self, v16);
    goto LABEL_111;
  }
  if (_UIAppUseModernRotationAndPresentationBehaviors()
    || (+[UIDevice currentDevice],
        id v17 = objc_claimAutoreleasedReturnValue(),
        uint64_t v18 = [v17 userInterfaceIdiom],
        v17,
        (v18 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      id v19 = +[UIScreen mainScreen];
      char v20 = [v19 _wantsWideContentMargins];

      if ((v20 & 1) == 0)
      {
        id v21 = +[UIDevice currentDevice];
        uint64_t v22 = [v21 userInterfaceIdiom];

        if ((v22 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        {
          uint64_t v23 = [(UIViewController *)self traitCollection];
          BOOL v24 = v23;
          if (v15 <= 0x10 && ((1 << v15) & 0x10006) != 0 && [v23 horizontalSizeClass] == 1) {
            [v9 setModalPresentationStyle:0];
          }
        }
      }
    }
  }
  else if (v15 <= 0x10 && ((1 << v15) & 0x10006) != 0)
  {
    [v9 setModalPresentationStyle:0];
  }
  if (!v9)
  {
    long long v45 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v46 = *MEMORY[0x1E4F1C3C8];
    [NSString stringWithFormat:@"Application tried to present a nil modal view controller on target %@.", self];
    goto LABEL_131;
  }
  id v16 = self->_parentViewController;
  uint64_t v25 = [(UIViewController *)v16 presentedViewController];
  if (v25)
  {
    double v26 = (void *)v25;
    UIModalTransitionStyle v27 = [(UIViewController *)self modalTransitionStyle];

    if (v27 == UIModalTransitionStylePartialCurl)
    {
      long long v45 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v46 = *MEMORY[0x1E4F1C3C8];
      [NSString stringWithFormat:@"Application tried to present a nested modal view controller while curled %@.", self];
      goto LABEL_131;
    }
  }
  long long v28 = [(UIViewController *)self _popoverController];
  if (v28 || v15)
  {
    uint64_t v30 = [v9 modalTransitionStyle];

    if (v30 == 3)
    {
LABEL_42:
      long long v45 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v46 = *MEMORY[0x1E4F1C3C8];
      [NSString stringWithFormat:@"Application tried to present UIModalTransitionStylePartialCurl to or from non-fullscreen view controller %@.", self];
      double v111 = LABEL_131:;
      v112 = v45;
LABEL_132:
      id v110 = [v112 exceptionWithName:v46 reason:v111 userInfo:0];

LABEL_133:
      objc_exception_throw(v110);
    }
  }
  else
  {
    CGFloat v29 = [(UIViewController *)v16 presentedViewController];
    if (v29 == self && [(UIViewController *)self modalPresentationStyle])
    {
      uint64_t v44 = [v9 modalTransitionStyle];

      if (v44 == 3) {
        goto LABEL_42;
      }
    }
    else
    {
    }
  }
  if (!dyld_program_sdk_at_least()
    || (-[UIViewController popoverPresentationController:](v9, 0),
        (CGFloat v31 = objc_claimAutoreleasedReturnValue()) == 0)
    || (CGFloat v32 = v31, v33 = [v31 _isShimmingPopoverControllerPresentation], v32, !v33))
  {
    uint64_t v34 = [v9 parentViewController];

    if (v34)
    {
      CGFloat v105 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v106 = *MEMORY[0x1E4F1C3C8];
      double v107 = NSString;
      CGFloat v108 = [v9 parentViewController];
      [v107 stringWithFormat:@"Application tried to present modally a view controller %@ that has a parent view controller %@.", v9, v108];
      goto LABEL_128;
    }
    [v9 _popoverController];
    if (objc_claimAutoreleasedReturnValue())
    {
      long long v45 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v46 = *MEMORY[0x1E4F1C3C8];
      [NSString stringWithFormat:@"Application tried to present modally a view controller %@ that is presented with deprecated UIPopoverController.", v9];
      goto LABEL_131;
    }
    if ([v9 _isDelayingPresentation])
    {
      objc_msgSend(v9, "__viewControllerWillBePresented:", 1);
      v132[0] = MEMORY[0x1E4F143A8];
      v132[1] = 3221225472;
      v132[2] = __78__UIViewController__presentViewController_withAnimationController_completion___block_invoke_725;
      v132[3] = &unk_1E52EA088;
      v132[4] = self;
      -[UIViewController _enumerateVisibleChildControllers:includePresentedChildren:usingBlock:](v9, 1, v132);
      *(void *)buf = self;
      int v35 = (void *)MEMORY[0x1E4F1CA18];
      id v36 = [(UIViewController *)self methodSignatureForSelector:a2];
      double v37 = [v35 invocationWithMethodSignature:v36];

      [v37 setArgument:buf atIndex:0];
      [v37 setTarget:self];
      [v37 setArgument:&v138 atIndex:1];
      [v37 setArgument:&location atIndex:2];
      [v37 setArgument:&v136 atIndex:3];
      id v131 = _Block_copy(v10);
      [v37 setArgument:&v131 atIndex:4];
      [v37 retainArguments];
      CGRect v38 = objc_getAssociatedObject(location, &unk_1EB25BB23);
      CGRect v39 = [(UIViewController *)self _window];
      double v40 = [v39 windowScene];
      [v38 setWindowSceneIgnoringEvents:v40];

      [v38 setPresentInvocation:v37];
      objc_setAssociatedObject(self, &unk_1EB25BB22, location, (void *)1);
      -[_UIDelayedPresentationContext beginDelayedPresentation]((uint64_t)v38);

      goto LABEL_111;
    }
    objc_msgSend(v9, "__viewControllerWillBePresented:", 0);
    double v41 = [v9 _temporaryPresentationController];
    long long v42 = v41;
    if (v41)
    {
      long long v43 = v41;
      [v9 _setTemporaryPresentationController:0];
      goto LABEL_50;
    }
    if (v15 == 4 || [v9 _requiresCustomPresentationController])
    {
      long long v43 = [v9 _customPresentationControllerForPresentedController:v9 presentingController:0 sourceController:self];
      if (v43) {
        goto LABEL_50;
      }
      long long v43 = [[UIPresentationController alloc] initWithPresentedViewController:v9 presentingViewController:0];
    }
    else
    {
      double v47 = +[_UIPresentationControllerDefaultVisualStyleProvider sharedInstance];
      int v48 = [(UIViewController *)self traitCollection];
      objc_msgSend(v47, "presentationControllerForPresentedViewController:inIdiom:", v9, objc_msgSend(v48, "userInterfaceIdiom"));
      long long v43 = (UIPresentationController *)objc_claimAutoreleasedReturnValue();

      long long v42 = 0;
    }
    if (!v43)
    {
      [MEMORY[0x1E4F28B00] currentHandler];
      v103 = uint64_t v102 = v42;
      [v103 handleFailureInMethod:a2 object:self file:@"UIViewController.m" lineNumber:9532 description:@"The specified modal presentation style doesn't have a corresponding presentation controller."];

      long long v42 = v102;
      long long v43 = 0;
    }
LABEL_50:
    -[UIViewController _modalPresenterForPresentationController:]((uint64_t)self, v43);
    int v49 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    if ([(UIPresentationController *)v43 _shouldConvertToScene])
    {
      [location _setTemporaryPresentationController:v43];
      [(UIPresentationController *)v43 _convertToSceneFromPresentingViewController:v49];
LABEL_110:

      goto LABEL_111;
    }
    unint64_t v129 = v42;
    [(UIPresentationController *)v43 _setSourceViewController:self];
    unint64_t v127 = v49;
    [(UIPresentationController *)v43 _setPresentingViewController:v49];
    uint64_t v50 = [(UIPresentationController *)v43 __sizeClassPair];
    uint64_t v52 = v51;
    objc_super v53 = [(UIPresentationController *)v43 presentingViewController];
    CGFloat v54 = [v53 traitCollection];
    v130[0] = MEMORY[0x1E4F143A8];
    v130[1] = 3221225472;
    v130[2] = __78__UIViewController__presentViewController_withAnimationController_completion___block_invoke_2;
    v130[3] = &__block_descriptor_48_e27_v16__0___UIMutableTraits__8l;
    uint64_t v118 = v52;
    uint64_t v119 = v50;
    v130[4] = v50;
    v130[5] = v52;
    uint64_t v55 = [v54 traitCollectionByModifyingTraits:v130];

    unint64_t v125 = (void *)v55;
    long long v56 = [(UIPresentationController *)v43 _presentationControllerForTraitCollection:v55];
    id v126 = v10;
    if (v56 == v43)
    {
      id v58 = 0;
    }
    else
    {
      id v57 = [(UIPresentationController *)v43 traitCollection];
      id v58 = [(UIPresentationController *)v43 _presentedViewControllerForPresentationController:v56 traitCollection:v57];

      if (v58)
      {
        [(UIPresentationController *)v56 _setPresentedViewController:v58];
        objc_storeStrong(&location, v58);
      }
    }
    int v59 = v127;
    unint64_t v128 = v58;
    long long v60 = v59;
    id v122 = location;
    if (location == v59)
    {
      double v113 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v46 = *MEMORY[0x1E4F1C3C8];
      double v111 = [NSString stringWithFormat:@"Application tried to present modal view controller on itself. Presenting controller is %@.", v59];
      v112 = v113;
      goto LABEL_132;
    }
    self;
    if ((fluidPresentationTransitionsEnabled & 1) == 0)
    {
      long long v61 = [(UIViewController *)v60 currentAction];

      if (v61)
      {
        long long v62 = *(NSObject **)(__UILogGetCategoryCachedImpl("Presentation", &qword_1EB25BBC0) + 8);
        int v49 = v60;
        id v10 = v126;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v122;
          __int16 v140 = 2112;
          v141 = v49;
          __int16 v142 = 2112;
          unint64_t v143 = self;
          id v63 = "Attempt to present %@ on %@ (from %@) while a presentation is in progress.";
LABEL_66:
          _os_log_impl(&dword_1853B0000, v62, OS_LOG_TYPE_ERROR, v63, buf, 0x20u);
          goto LABEL_109;
        }
        goto LABEL_109;
      }
    }
    double v124 = v56;
    id v64 = [(UIViewController *)v60 view];
    id v65 = [v64 window];

    if (!v65)
    {
      long long v62 = *(NSObject **)(__UILogGetCategoryCachedImpl("Presentation", &qword_1EB25BBC8) + 8);
      int v49 = v60;
      id v10 = v126;
      long long v56 = v124;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v122;
        __int16 v140 = 2112;
        v141 = v49;
        __int16 v142 = 2112;
        unint64_t v143 = self;
        id v63 = "Attempt to present %@ on %@ (from %@) whose view is not in the window hierarchy.";
        goto LABEL_66;
      }
LABEL_109:

      long long v42 = v129;
      goto LABEL_110;
    }
    self;
    int v49 = v60;
    if (fluidPresentationTransitionsEnabled) {
      -[UIViewController _appearingOrAppearedChildModalViewController]((uint64_t)v60);
    }
    else {
    long long v66 = [(UIViewController *)v60 childModalViewController];
    }

    long long v56 = v124;
    if (v66)
    {
      long long v67 = *(NSObject **)(__UILogGetCategoryCachedImpl("Presentation", &qword_1EB25BBD0) + 8);
      id v10 = v126;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        long long v68 = v67;
        long long v69 = [(UIViewController *)v49 childModalViewController];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v122;
        __int16 v140 = 2112;
        v141 = v49;
        __int16 v142 = 2112;
        unint64_t v143 = self;
        __int16 v144 = 2112;
        id v145 = v69;
        _os_log_impl(&dword_1853B0000, v68, OS_LOG_TYPE_ERROR, "Attempt to present %@ on %@ (from %@) which is already presenting %@.", buf, 0x2Au);
      }
      goto LABEL_109;
    }
    long long v70 = [(UIViewController *)self _rootAncestorViewController];
    CGRect v71 = [(UIViewController *)self _existingView];
    CGRect v72 = [v71 window];
    uint64_t v73 = [v72 rootViewController];
    if (v70 == (void *)v73)
    {
    }
    else
    {
      CGRect v74 = (void *)v73;
      BOOL v116 = [(UIViewController *)self _ancestorViewControllerIsInPopover];

      int v49 = v60;
      CGRect v75 = v122;
      if (v116)
      {
LABEL_78:
        char v77 = [(UIViewController *)v49 _presentationController];
        uint64_t v78 = [v77 _transitionContext];

        char v79 = [v78 _animator];
        double v115 = v79;
        if (objc_opt_respondsToSelector())
        {
          id v10 = v126;
          if ([v79 shouldPreemptWithContext:v78])
          {
            double v117 = [v79 preemptWithContext:v78];
          }
          else
          {
            double v117 = 0;
          }
        }
        else
        {
          double v117 = 0;
          id v10 = v126;
        }
        BOOL v123 = v78;
        __int16 v80 = [v75 _parentModalViewController];

        if (!v80)
        {
          [(UIViewController *)v49 _setOriginalPresentationController:v43];
          -[UIViewController _setPresentationSizeClassPair:](v49, "_setPresentationSizeClassPair:", v119, v118);
          unint64_t v81 = [(UIViewController *)v49 view];
          double v82 = [v81 superview];
          objc_opt_class();
          int isKindOfClass = objc_opt_isKindOfClass();

          int v83 = ![(UIViewController *)v49 definesPresentationContext];
          if (v15 == 3) {
            int v84 = v83;
          }
          else {
            int v84 = 1;
          }
          uint64_t v85 = (UIViewController *)location;
          id v86 = [location _overrideTransitioningDelegate];
          if (!v86)
          {
            if (+[UIViewController _shouldAnimateTransitions])
            {
              goto LABEL_91;
            }
            uint64_t v87 = [(UIViewController *)v85 _defaultAnimationController];
            id v86 = v136;
            double v136 = v87;
          }

LABEL_91:
          double v88 = v136;
          if (!v136)
          {
            if ([(UIPresentationController *)v124 _forcesPreferredAnimationControllers])
            {
              double v88 = [(UIPresentationController *)v124 _preferredAnimationControllerForPresentation];
              double v136 = v88;
            }
            else
            {
              double v88 = 0;
            }
          }
          if ((v84 | isKindOfClass))
          {
            BOOL v89 = 0;
            v90 = v85;
          }
          else
          {
            BOOL v89 = [(UIViewController *)v49 providesPresentationContextTransitionStyle];
            if (v89) {
              v90 = v49;
            }
            else {
              v90 = v85;
            }
          }
          uint64_t v91 = v90;
          double v121 = v91;
          if (!v88)
          {
            long long v97 = v91;
            -[UIViewController _customAnimatorForPresentedController:presentingController:sourceController:](v91, v85, v49, self);
            long long v98 = (UIViewControllerBuiltinTransitionViewAnimator *)objc_claimAutoreleasedReturnValue();
            double v136 = v98;
            if (v98)
            {
              double v88 = v98;
              int v92 = -[UIViewController _customInteractionControllerForPresentation:](v97, v98);
              if (v92) {
                goto LABEL_102;
              }
            }
            else
            {
              double v88 = [(UIPresentationController *)v124 _preferredAnimationControllerForPresentation];
              double v136 = v88;
              if (!v88)
              {
                if (v89) {
                  long long v99 = v49;
                }
                else {
                  long long v99 = v85;
                }
                double v88 = -[UIViewControllerBuiltinTransitionViewAnimator initWithTransition:]([UIViewControllerBuiltinTransitionViewAnimator alloc], "initWithTransition:", -[UIViewController _transitionForModalTransitionStyle:appearing:]((uint64_t)self, [(UIViewController *)v99 modalTransitionStyle], 1));
                double v136 = v88;
              }
            }
          }
          int v92 = [(UIPresentationController *)v124 _preferredInteractionControllerForPresentation:v88];
          double v88 = v136;
          uint64_t v85 = (UIViewController *)location;
LABEL_102:
          [(UIViewController *)self _preparePresentationControllerForPresenting:v124];
          uint64_t v93 = v88;
          long long v56 = v124;
          [(UIViewController *)v49 _presentViewController:v85 modalSourceViewController:self presentationController:v124 animationController:v93 interactionController:v92 handoffData:v117 completion:v10];
          uint64_t v94 = [(UIPresentationController *)v124 presentingViewController];
          v95 = [v94 _transitionCoordinator];

          if (v124 == v43) {
            uint64_t v96 = -1;
          }
          else {
            uint64_t v96 = [(UIPresentationController *)v124 presentationStyle];
          }
          [(UIPresentationController *)v43 _sendDelegateWillPresentWithAdaptiveStyle:v96 transitionCoordinator:v95];

          goto LABEL_109;
        }
        CGFloat v105 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v106 = *MEMORY[0x1E4F1C3C8];
        v114 = NSString;
        CGFloat v108 = [v75 _parentModalViewController];
        [v114 stringWithFormat:@"Application tried to present modally a view controller %@ that is already being presented by %@.", v75, v108];
        BOOL v109 = LABEL_128:;
        id v110 = [v105 exceptionWithName:v106 reason:v109 userInfo:0];

        goto LABEL_133;
      }
      if (!os_variant_has_internal_diagnostics())
      {
        uint64_t v76 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25BBD8) + 8);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v122;
          __int16 v140 = 2112;
          v141 = self;
          __int16 v142 = 2112;
          unint64_t v143 = self;
          _os_log_impl(&dword_1853B0000, v76, OS_LOG_TYPE_ERROR, "Presenting view controller %@ from detached view controller %@ is not supported, and may result in incorrect safe area insets and a corrupt root presentation. Make sure %@ is in the view controller hierarchy before presenting from it. Will become a hard exception in a future release.", buf, 0x20u);
        }
        goto LABEL_78;
      }
      double v104 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v122;
        __int16 v140 = 2112;
        v141 = self;
        __int16 v142 = 2112;
        unint64_t v143 = self;
        _os_log_fault_impl(&dword_1853B0000, v104, OS_LOG_TYPE_FAULT, "Presenting view controller %@ from detached view controller %@ is not supported, and may result in incorrect safe area insets and a corrupt root presentation. Make sure %@ is in the view controller hierarchy before presenting from it. Will become a hard exception in a future release.", buf, 0x20u);
      }
    }
    int v49 = v60;
    CGRect v75 = v122;
    goto LABEL_78;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__UIViewController__presentViewController_withAnimationController_completion___block_invoke;
  block[3] = &unk_1E52D9F98;
  CGFloat v134 = v9;
  double v135 = self;
  if (qword_1EB25BBB8 != -1) {
    dispatch_once(&qword_1EB25BBB8, block);
  }

LABEL_111:
}

- (void)popoverPresentationController:(void *)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    BOOL v4 = [a1 presentingViewController];
    id v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 _originalPresentationController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v8 = [v5 _originalPresentationController];
LABEL_15:
        uint64_t v2 = (void *)v8;
LABEL_17:

        goto LABEL_18;
      }
    }
    else if (a2)
    {
      if (!v2[97])
      {
        uint64_t v9 = [v2 modalPresentationStyle];
        if (v9 == 100 || v9 == 7)
        {
          if ([v2 _requiresCustomPresentationController])
          {
            uint64_t v10 = [v2 _customPresentationControllerForPresentedController:v2 presentingController:0 sourceController:v2];
          }
          else
          {
            [v2 modalPresentationStyle];
            uint64_t v10 = [objc_alloc((Class)objc_opt_class()) initWithPresentedViewController:v2 presentingViewController:0];
          }
          double v11 = (void *)v10;
          [v2 _setTemporaryPresentationController:v10];
        }
      }
      id v12 = [v2 _temporaryPresentationController];
      objc_opt_class();
      char v13 = objc_opt_isKindOfClass();

      if (v13)
      {
        uint64_t v8 = [v2 _temporaryPresentationController];
        goto LABEL_15;
      }
    }
    uint64_t v2 = 0;
    goto LABEL_17;
  }
LABEL_18:
  return v2;
}

- (UIPresentationController)presentationController
{
  uint64_t v3 = [(UIViewController *)self _parentModalViewController];

  if (v3)
  {
    BOOL v4 = [(UIViewController *)self _parentModalViewController];
    id v5 = [v4 _originalPresentationController];
  }
  else
  {
    if (!self->_temporaryPresentationController)
    {
      if ([(UIViewController *)self modalPresentationStyle] == UIModalPresentationCustom
        || [(UIViewController *)self _requiresCustomPresentationController])
      {
        uint64_t v6 = [(UIViewController *)self _customPresentationControllerForPresentedController:self presentingController:0 sourceController:self];
      }
      else
      {
        double v7 = +[_UIPresentationControllerDefaultVisualStyleProvider sharedInstance];
        uint64_t v6 = [v7 presentationControllerForPresentedViewController:self];
      }
      [(UIViewController *)self _setTemporaryPresentationController:v6];
    }
    id v5 = [(UIViewController *)self _temporaryPresentationController];
  }
  return (UIPresentationController *)v5;
}

- (UISheetPresentationController)sheetPresentationController
{
  uint64_t v3 = [(UIViewController *)self presentingViewController];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 _originalPresentationController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v7 = [v4 _originalPresentationController];
LABEL_17:
      unint64_t v15 = (void *)v7;
      goto LABEL_19;
    }
  }
  else
  {
    UIModalPresentationStyle v8 = [(UIViewController *)self modalPresentationStyle];
    if (self->_temporaryPresentationController) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = (unint64_t)v8 > 0x10;
    }
    if (!v9 && ((1 << v8) & 0x10006) != 0)
    {
      if ([(UIViewController *)self _requiresCustomPresentationController])
      {
        uint64_t v11 = [(UIViewController *)self _customPresentationControllerForPresentedController:self presentingController:0 sourceController:self];
      }
      else
      {
        uint64_t v11 = [objc_alloc((Class)objc_opt_class()) initWithPresentedViewController:self presentingViewController:0];
      }
      id v12 = (void *)v11;
      [(UIViewController *)self _setTemporaryPresentationController:v11];
    }
    char v13 = [(UIViewController *)self _temporaryPresentationController];
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    if (v14)
    {
      uint64_t v7 = [(UIViewController *)self _temporaryPresentationController];
      goto LABEL_17;
    }
  }
  unint64_t v15 = 0;
LABEL_19:

  return (UISheetPresentationController *)v15;
}

- (UIPresentationController)_originalPresentationController
{
  return self->_originalPresentationController;
}

- (id)currentAction
{
  return self->_currentAction;
}

- (void)_setTemporaryPresentationController:(id)a3
{
  id v5 = a3;
  p_temporaryPresentationController = (id *)&self->_temporaryPresentationController;
  id v7 = *p_temporaryPresentationController;
  id v8 = v5;
  if (*p_temporaryPresentationController != v5)
  {
    if (v7) {
      [v7 _setPresentedViewControllerStoredWeakly:0];
    }
    objc_storeStrong(p_temporaryPresentationController, a3);
    if (*p_temporaryPresentationController && dyld_program_sdk_at_least()) {
      [*p_temporaryPresentationController _setPresentedViewControllerStoredWeakly:1];
    }
  }
}

- (UIViewControllerTransitioningDelegate)_overrideTransitioningDelegate
{
  return self->_overrideTransitioningDelegate;
}

- (BOOL)_isDelayingPresentation
{
  uint64_t v2 = objc_getAssociatedObject(self, &unk_1EB25BB23);
  BOOL v3 = [v2 requestCount] != 0;

  return v3;
}

- (BOOL)_overrideUseCustomPresentation
{
  return self->overrideUseCustomPresentation;
}

void __63__UIViewController__presentViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _defaultAnimationController];
  [*(id *)(a1 + 40) _presentViewController:*(void *)(a1 + 32) withAnimationController:v2 completion:*(void *)(a1 + 48)];
}

- (id)_defaultAnimationController
{
  id v2 = [[UIViewControllerBuiltinTransitionViewAnimator alloc] initWithTransition:0];
  return v2;
}

- (UIModalTransitionStyle)modalTransitionStyle
{
  return self->_modalTransitionStyle;
}

- (BOOL)definesPresentationContext
{
  return (*(void *)&self->_viewControllerFlags >> 18) & 1;
}

- (void)_setPresentationSizeClassPair:(id)a3
{
  self->_presentationSizeClassPair = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
}

- (void)_setOriginalPresentationController:(id)a3
{
}

- (id)_modalPresenterForPresentationController:(uint64_t)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (a1)
  {
    id v5 = [v3 _initialPresentationViewControllerForViewController:a1];
    objc_msgSend(v5, "_nonModalAncestorViewControllerStopAtIsPresentationContext:", objc_msgSend(v4, "_shouldRespectDefinesPresentationContext"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if ([v4 shouldPresentInFullscreen])
    {
      id v7 = v6;
      id v8 = v7;
      if (v7)
      {
        uint64_t v9 = [v7 _parentModalViewController];
        uint64_t v10 = v8;
        if (v9)
        {
          uint64_t v11 = v8;
          do
          {
            uint64_t v10 = (void *)v9;

            uint64_t v9 = [v10 _parentModalViewController];
            uint64_t v11 = v10;
          }
          while (v9);
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
      uint64_t v12 = -[UIViewController _parentViewController]((id *)v10);
      if (v12)
      {
        char v13 = (void *)v12;
        char v14 = -[UIViewController _modalPresenterForPresentationController:](v12, v4);

LABEL_17:
        goto LABEL_18;
      }
    }
    uint64_t v10 = -[UIViewController _appearingOrAppearedChildModalViewController]((uint64_t)v6);
    while ([v6 _mayForwardPresentationsToPresentedViewController] && v10)
    {
      unint64_t v15 = v6;
      id v6 = v10;

      uint64_t v10 = -[UIViewController _appearingOrAppearedChildModalViewController]((uint64_t)v6);
    }
    id v8 = v6;
    char v14 = v8;
    goto LABEL_17;
  }
  char v14 = 0;
LABEL_18:

  return v14;
}

- (BOOL)_mayForwardPresentationsToPresentedViewController
{
  return (*(void *)&self->_viewControllerFlags >> 35) & 1;
}

- (void)_isWaitingForDelayedPresentation
{
  if (result)
  {
    uint64_t v1 = objc_getAssociatedObject(result, &unk_1EB25BB22);
    uint64_t v2 = [v1 _isDelayingPresentation];

    return (void *)v2;
  }
  return result;
}

- (void)_addChildModalViewController:(id *)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    if (a1[14])
    {
LABEL_10:
      uint64_t v9 = [a1 _window];
      uint64_t v10 = [v9 screen];

      objc_msgSend(v3, "__willChangeToIdiom:onScreen:", objc_msgSend(v10, "_userInterfaceIdiom"), v10);
      [a1[14] addObject:v3];
      [v3 setParentModalViewController:a1];
      [a1 _didChangeDeepestActionResponder];

      goto LABEL_11;
    }
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = [NSString stringWithUTF8String:"-[UIViewController _addChildModalViewController:]"];
      [v4 handleFailureInFunction:v5, @"UIViewController.m", 8123, @"UIViewController was not initialized before use. This is a serious bug, likely caused by accessing properties or methods on the view controller before calling a UIViewController initializer. View controller: %@", a1 file lineNumber description];
    }
    else
    {
      if (!os_variant_has_internal_diagnostics())
      {
        id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_addChildModalViewController____s_category) + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v12 = a1;
          _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "UIViewController was not initialized before use. This is a serious bug, likely caused by accessing properties or methods on the view controller before calling a UIViewController initializer. View controller: %@ Ensure you're calling a designated initializer of UIViewController. This will become an assert in a future version.", buf, 0xCu);
        }
        goto LABEL_9;
      }
      BOOL v4 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = a1;
        _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "UIViewController was not initialized before use. This is a serious bug, likely caused by accessing properties or methods on the view controller before calling a UIViewController initializer. View controller: %@ Ensure you're calling a designated initializer of UIViewController. This will become an assert in a future version.", buf, 0xCu);
      }
    }

LABEL_9:
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = a1[14];
    a1[14] = v7;

    goto LABEL_10;
  }
LABEL_11:
}

- (void)setParentModalViewController:(id)a3
{
  self->_parentModalViewController = (UIViewController *)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)__sizeClassPair
{
  uint64_t v2 = [(UIViewController *)self traitCollection];
  uint64_t v3 = [v2 horizontalSizeClass];
  uint64_t v4 = [v2 verticalSizeClass];

  int64_t v5 = v3;
  int64_t v6 = v4;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

+ (BOOL)_shouldAnimateTransitions
{
  if ([a1 _shouldDeferTransitions]) {
    return 1;
  }
  self;
  return _ShouldAnimateImmediateTransitions != 0;
}

- (void)_setIgnoresWrapperViewForContentOverlayInsets:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (void)setNeedsUserInterfaceAppearanceUpdate
{
  if (_UIIsPrivateMainBundle())
  {
    [(UIViewController *)self _updateTraitsIfNecessary];
  }
}

+ (double)_boundsWidthWithMinimumHorizontalContentMarginForView:(id)a3 preservingContentWidth:(double)a4
{
  id v5 = a3;
  int64_t v6 = objc_opt_class();
  id v7 = [v5 traitCollection];
  [v6 _slimHorizontalContentMarginForTraitCollection:v7];
  double v9 = v8 + v8 + a4;

  [(id)objc_opt_class() _horizontalContentMarginForView:v5 ofWidth:v9];
  double v11 = v10;

  return v11 + v11 + a4;
}

+ (double)_slimHorizontalContentMarginForTraitCollection:(id)a3
{
  return 16.0;
}

- (id)_activityContinuationSuitableToBecomeCurrent
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIViewController *)self childModalViewController];
  uint64_t v4 = v3;
  if (!v3
    || ([v3 _activityContinuationSuitableToBecomeCurrent],
        (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int64_t v6 = [(UIViewController *)self _additionalViewControllersToCheckForUserActivity];
    id v7 = v6;
    if (v6 && [v6 count])
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = v7;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "_activityContinuationSuitableToBecomeCurrent", (void)v16);
            if (v12)
            {
              id v5 = (void *)v12;

              goto LABEL_18;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
    uint64_t v13 = [(UIViewController *)self _existingView];
    char v14 = [v13 window];

    if (v14)
    {
      id v5 = [(UIResponder *)self userActivity];
    }
    else
    {
      id v5 = 0;
    }
  }
LABEL_18:

  return v5;
}

- (char)_descriptionForPrintingHierarchyIncludingInsets:(float64x2_t *)a1
{
  uint64_t v2 = (char *)a1;
  if (a1)
  {
    if (a2 && ((LODWORD(a1[23].f64[1]) >> 1) & 3) - 1 <= 1)
    {
      int v3 = vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(a1[57]), (int32x4_t)vceqzq_f64(a1[58]))))) & 1;
      int v4 = 1;
    }
    else
    {
      int v4 = 0;
      int v3 = 0;
    }
    id v5 = (void *)MEMORY[0x1E4F28E78];
    uint64_t v6 = objc_opt_class();
    id v7 = [&unk_1ED3EF8F0 objectAtIndexedSubscript:(*((void *)v2 + 47) >> 1) & 3];
    if (v3)
    {
      uint64_t v8 = NSString;
      double v26 = NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)(v2 + 912));
      [v8 stringWithFormat:@" minimum margins = %@,", v26];
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v9 = &stru_1ED0E84C0;
    }
    id v10 = [v2 _existingView];
    if (v10)
    {
      uint64_t v27 = v6;
      double v11 = v5;
      int v12 = v4;
      uint64_t v13 = (void *)MEMORY[0x1E4F28E78];
      char v14 = NSString;
      unint64_t v15 = (objc_class *)objc_opt_class();
      long long v16 = NSStringFromClass(v15);
      long long v17 = [v14 stringWithFormat:@"<%@: %p>", v16, v10];

      long long v18 = [v13 stringWithString:v17];

      long long v19 = [v10 window];

      if (v19)
      {
        if (v12)
        {
          [v10 safeAreaInsets];
          if (v23 != 0.0 || v20 != 0.0 || v22 != 0.0 || v21 != 0.0)
          {
            [v10 safeAreaInsets];
            BOOL v24 = NSStringFromUIEdgeInsets(v29);
            [(__CFString *)v18 appendFormat:@" safeAreaInsets = %@", v24];
          }
        }
      }
      else
      {
        [(__CFString *)v18 appendString:@" not in the window"];
      }
      id v5 = v11;
      uint64_t v6 = v27;
    }
    else
    {
      long long v18 = @"(view not loaded)";
    }

    uint64_t v2 = [v5 stringWithFormat:@"<%@ %p>, state: %@,%@ view: %@", v6, v2, v7, v9, v18];

    if (v3)
    {
    }
  }
  return v2;
}

- (id)traitOverrides
{
  traitOverrides = self->_traitOverrides;
  if (!traitOverrides)
  {
    int v4 = (_UITraitOverrides *)-[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], self);
    id v5 = self->_traitOverrides;
    self->_traitOverrides = v4;

    traitOverrides = self->_traitOverrides;
  }
  return traitOverrides;
}

- (id)registerForTraitChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  uint64_t v9 = +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  id v10 = [(UIViewController *)self _registerForTraitTokenChanges:v9 withTarget:v8 action:a5];

  return v10;
}

- (_UIViewControllerTransition)_preferredTransition
{
  return self->_spiTransition;
}

- (void)_performAtViewIsAppearing:(uint64_t)a1
{
  id v3 = a2;
  int v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:sel__performAtViewIsAppearing_, a1, @"UIViewController.m", 6793, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];
    }
    id v5 = _Block_copy(*(const void **)(a1 + 320));
    uint64_t v6 = v5;
    if (v5)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __46__UIViewController__performAtViewIsAppearing___block_invoke;
      aBlock[3] = &unk_1E52E9FC8;
      id v13 = v5;
      id v14 = v4;
      id v7 = _Block_copy(aBlock);
      id v8 = *(void **)(a1 + 320);
      *(void *)(a1 + 320) = v7;
    }
    else
    {
      uint64_t v9 = _Block_copy(v4);
      id v10 = *(void **)(a1 + 320);
      *(void *)(a1 + 320) = v9;
    }
  }
}

- (void)setExtendedLayoutIncludesOpaqueBars:(BOOL)extendedLayoutIncludesOpaqueBars
{
  uint64_t v3 = 0x2000000000;
  if (!extendedLayoutIncludesOpaqueBars) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (void)setOverrideUserInterfaceStyle:(UIUserInterfaceStyle)overrideUserInterfaceStyle
{
  if (pthread_main_np() == 1)
  {
    if ((unint64_t)overrideUserInterfaceStyle >= 4)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIViewController.m", 4373, @"Attempt to set invalid UIUserInterfaceStyle value to overrideUserInterfaceStyle: %ld", overrideUserInterfaceStyle);
    }
    UIUserInterfaceStyle v6 = [(UIViewController *)self overrideUserInterfaceStyle];
    *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0x3FFFFFFFFFFFFFFFLL | ((unint64_t)overrideUserInterfaceStyle << 62);
    if ([(UIViewController *)self overrideUserInterfaceStyle] != v6)
    {
      [(UIViewController *)self _updateTraitsIfNecessary];
    }
  }
  else
  {
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"UIViewController.m" lineNumber:4365 description:@"BUG IN CLIENT OF UIKIT: Attempting to set an overrideUserInterfaceStyle from a background thread. Modifying a view controller from a background thread is not supported."];
    }
    else if (os_variant_has_internal_diagnostics())
    {
      id v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF UIKIT: Attempting to set an overrideUserInterfaceStyle from a background thread. Modifying a view controller from a background thread is not supported.  This will become an assert in a future version.", buf, 2u);
      }
    }
    else
    {
      id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setOverrideUserInterfaceStyle____s_category) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Attempting to set an overrideUserInterfaceStyle from a background thread. Modifying a view controller from a background thread is not supported.  This will become an assert in a future version.", buf, 2u);
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__UIViewController_setOverrideUserInterfaceStyle___block_invoke;
    block[3] = &unk_1E52D9CD0;
    void block[4] = self;
    void block[5] = overrideUserInterfaceStyle;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)setViewRespectsSystemMinimumLayoutMargins:(BOOL)viewRespectsSystemMinimumLayoutMargins
{
  BOOL v3 = viewRespectsSystemMinimumLayoutMargins;
  if ([(UIViewController *)self viewRespectsSystemMinimumLayoutMargins] != viewRespectsSystemMinimumLayoutMargins)
  {
    uint64_t v5 = 0x8000000000000;
    if (!v3) {
      uint64_t v5 = 0;
    }
    *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFF7FFFFFFFFFFFFLL | v5;
    id v6 = [(UIViewController *)self _existingView];
    [v6 _updateInferredLayoutMargins];
  }
}

- (int64_t)_rotatingToInterfaceOrientation
{
  uint64_t v2 = [(UIViewController *)self _existingView];
  BOOL v3 = [v2 window];

  if (v3)
  {
    uint64_t v4 = [v3 _fromWindowOrientation];
    uint64_t v5 = [v3 _toWindowOrientation];
    if (v4 == v5) {
      int64_t v6 = 0;
    }
    else {
      int64_t v6 = v5;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed
{
  uint64_t v3 = 32;
  if (!hidesBottomBarWhenPushed) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (void)setAutomaticallyAdjustsScrollViewInsets:(BOOL)automaticallyAdjustsScrollViewInsets
{
  uint64_t v3 = 0x4000000000;
  if (!automaticallyAdjustsScrollViewInsets) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (void)_setMayForwardPresentationsToPresentedViewController:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (UIInterfaceOrientation)interfaceOrientation
{
  if (!self) {
    return 0;
  }
  uint64_t v3 = [(UIViewController *)self _popoverController];

  if (!v3)
  {
    uint64_t v5 = self;
    int64_t v6 = v5->_parentViewController;
    if (v6)
    {
      id v7 = v6;
      do
      {
        p_isa = v7;

        id v7 = (UIViewController *)p_isa[13];
        uint64_t v5 = (UIViewController *)p_isa;
      }
      while (v7);
    }
    else
    {
      p_isa = (id *)&v5->super.super.isa;
    }
    uint64_t v9 = [p_isa _existingView];
    id v10 = [v9 window];

    double v11 = [v10 rootViewController];
    int v12 = [p_isa _rootAncestorViewController];

    if (v11 == v12)
    {
      UIInterfaceOrientation v4 = [p_isa _lastKnownInterfaceOrientation];
      if (!v10) {
        goto LABEL_20;
      }
    }
    else
    {
      if (v10 && [v10 _windowInterfaceOrientation])
      {
        UIInterfaceOrientation v4 = [v10 _windowInterfaceOrientation];
      }
      else
      {
        id v13 = [(id)UIApp _defaultUISceneOrMainScreenPlaceholderIfExists];
        UIInterfaceOrientation v4 = [v13 interfaceOrientation];
      }
      if ((unint64_t)v4 <= UIInterfaceOrientationPortrait) {
        UIInterfaceOrientation v4 = UIInterfaceOrientationPortrait;
      }
      if (!v10) {
        goto LABEL_20;
      }
    }
    uint64_t v14 = [p_isa _lastKnownInterfaceOrientation];
    unint64_t v15 = [v10 windowScene];
    uint64_t v16 = [v15 interfaceOrientation];

    if (v14 == v16)
    {
LABEL_21:

      return v4;
    }
LABEL_20:
    UIInterfaceOrientation v4 = [p_isa _preferredInterfaceOrientationGivenCurrentOrientation:v4];
    goto LABEL_21;
  }
  return 1;
}

- (void)setRestoresFocusAfterTransition:(BOOL)restoresFocusAfterTransition
{
  uint64_t v3 = 0x400000000000;
  if (restoresFocusAfterTransition) {
    uint64_t v3 = 0x800000000000;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFF3FFFFFFFFFFFLL | v3;
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void *)completion
{
  BOOL v6 = flag;
  id v8 = viewControllerToPresent;
  uint64_t v9 = completion;
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__UIViewController_presentViewController_animated_completion___block_invoke_2;
    v14[3] = &unk_1E52D9FE8;
    id v10 = &v15;
    unint64_t v15 = v9;
    id v11 = v9;
    [(UIViewController *)self _presentViewController:v8 animated:v6 completion:v14];
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__UIViewController_presentViewController_animated_completion___block_invoke;
    aBlock[3] = &unk_1E52DA138;
    BOOL v19 = v6;
    id v10 = (id *)v17;
    v17[0] = v8;
    v17[1] = self;
    id v18 = v9;
    id v12 = v9;
    id v13 = _Block_copy(aBlock);
    -[UIViewController _performCoordinatedPresentOrDismiss:animated:]((id *)&self->super.super.isa, v13, v6);
  }
}

- (void)_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__UIViewController__presentViewController_animated_completion___block_invoke;
  aBlock[3] = &unk_1E52DA138;
  BOOL v22 = v6;
  id v10 = v8;
  id v19 = v10;
  double v20 = self;
  id v11 = v9;
  id v21 = v11;
  id v12 = _Block_copy(aBlock);
  BOOL v13 = [(UIViewController *)self _willPreemptRunningPresentationTransition];
  uint64_t v14 = (void *)_UISetCurrentFallbackEnvironment(self);
  if (v13)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__UIViewController__presentViewController_animated_completion___block_invoke_3;
    v15[3] = &unk_1E52E3538;
    void v15[4] = self;
    id v16 = v12;
    BOOL v17 = v6;
    +[UIView _performWithFluidPresentationTransitionsEnabled:]((uint64_t)UIView, v15);
  }
  else
  {
    -[UIViewController _performCoordinatedPresentOrDismiss:animated:]((id *)&self->super.super.isa, v12, v6);
  }
  _UIRestorePreviousFallbackEnvironment(v14);
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void *)completion
{
  BOOL v4 = flag;
  id v6 = completion;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__UIViewController_dismissViewControllerAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E52E3538;
  void aBlock[4] = self;
  BOOL v14 = v4;
  id v7 = v6;
  id v13 = v7;
  id v8 = _Block_copy(aBlock);
  if ([(UIViewController *)self _willPreemptRunningTransitionForDismissal])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__UIViewController_dismissViewControllerAnimated_completion___block_invoke_2;
    _OWORD v9[3] = &unk_1E52E3538;
    void v9[4] = self;
    id v10 = v8;
    BOOL v11 = v4;
    +[UIView _performWithFluidPresentationTransitionsEnabled:]((uint64_t)UIView, v9);
  }
  else
  {
    -[UIViewController _performCoordinatedPresentOrDismiss:animated:]((id *)&self->super.super.isa, v8, v4);
  }
}

- (void)_performCoordinatedPresentOrDismiss:(uint64_t)a3 animated:
{
  uint64_t v5 = a2;
  id v6 = v5;
  if (a1 && v5)
  {
    uint64_t v7 = [a1 _transitionCoordinator];
    if (v7)
    {
      id v8 = (void *)v7;
      if (![a1[63] _requiresDeferralToCoordinateWithNavigationTransitionAnimated:a3])
      {
        uint64_t v9 = [v8 presentationStyle];
        if (dyld_program_sdk_at_least() && v9 == -1)
        {
          +[UIViewController _performWithoutDeferringTransitionsAllowingAnimation:actions:]((uint64_t)UIViewController, a3, v6);
LABEL_19:

          goto LABEL_20;
        }
        if ((a3 & 1) == 0 && v9 == -1)
        {
          +[UIViewController _performWithoutDeferringTransitions:v6];
          goto LABEL_19;
        }
LABEL_16:
        self;
        if (fluidPresentationTransitionsEnabled == 1)
        {
          v6[2](v6);
        }
        else
        {
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __65__UIViewController__performCoordinatedPresentOrDismiss_animated___block_invoke;
          v14[3] = &unk_1E52DA110;
          unint64_t v15 = v6;
          [v8 animateAlongsideTransition:0 completion:v14];
        }
        goto LABEL_19;
      }
LABEL_15:
      dyld_program_sdk_at_least();
      goto LABEL_16;
    }
    id v10 = [a1 presentedViewController];
    if (v10)
    {
      BOOL v11 = [a1 presentedViewController];
      id v12 = [v11 presentingViewController];
    }
    else
    {
      id v12 = [a1 presentingViewController];
    }

    id v13 = [v12 _presentationController];
    id v8 = [v13 _adaptiveTransitionCoordinator];

    if (v8) {
      goto LABEL_15;
    }
    if (a3 & 1) != 0 || (dyld_program_sdk_at_least()) {
      v6[2](v6);
    }
    else {
      +[UIViewController _performWithoutDeferringTransitions:v6];
    }
  }
LABEL_20:
}

uint64_t __61__UIViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v1 = 9;
  }
  else {
    uint64_t v1 = 0;
  }
  return [*(id *)(a1 + 32) dismissViewControllerWithTransition:v1 completion:*(void *)(a1 + 40)];
}

- (BOOL)_willPreemptRunningTransitionForDismissal
{
  uint64_t v2 = -[UIViewController _viewControllerForDismissal](self);
  uint64_t v3 = [v2 presentedViewController];
  char v4 = [v3 isBeingDismissed];

  if (v4)
  {
    char v5 = 0;
  }
  else
  {
    id v6 = [v2 _presentationController];
    uint64_t v7 = [v6 _transitionContext];

    id v8 = [v7 _animator];
    if (objc_opt_respondsToSelector()) {
      char v5 = [v8 prefersPreemptionEnabledForPresentations];
    }
    else {
      char v5 = 0;
    }
  }
  return v5;
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__UIViewController_dismissViewControllerWithTransition_completion___block_invoke;
  aBlock[3] = &unk_1E52DA040;
  id v7 = v6;
  id v64 = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  self;
  if (fluidPresentationTransitionsEnabled)
  {
    if (!self)
    {
      uint64_t v9 = 0;
      char v10 = 1;
      goto LABEL_21;
    }
LABEL_8:
    id v12 = objc_getAssociatedObject(self, &unk_1EB25BB23);
    id v13 = v12;
    if (v12 && [v12 requestCount])
    {
      uint64_t v9 = self;
      goto LABEL_15;
    }
    objc_getAssociatedObject(self, &unk_1EB25BB22);
    BOOL v14 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = v14;
    if (v14)
    {
      unint64_t v15 = objc_getAssociatedObject(v14, &unk_1EB25BB23);

      if (v15 && [v15 requestCount])
      {
        id v13 = v15;
LABEL_15:

        [(UIViewController *)v9 _cancelDelayedPresentation:0];
        char v10 = 0;
        if (v9 == self)
        {
          id v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Presentation", &qword_1EB25BBE8) + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v66 = self;
            _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, "Not dismissing %@ because our presentation was delayed, and we were never presented.", buf, 0xCu);
          }
          v8[2](v8);
          uint64_t v9 = self;
          goto LABEL_103;
        }
LABEL_21:
        if (_UIAppUseModernRotationAndPresentationBehaviors())
        {
          BOOL v17 = [(UIViewController *)self _presentationController];
          char v18 = [v17 _presentingOrPresented];

          if (v18)
          {
            self;
            if (fluidPresentationTransitionsEnabled == 1
              && ((currentAction = self->_currentAction) == 0 ? (name = 0) : (name = currentAction->_name),
                  [(NSString *)name isEqualToString:@"DismissModal"]))
            {
              id v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("Presentation", &qword_1EB25BBF0) + 8);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                long long v66 = self;
                _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "Warning: Attempt to dismiss from view controller %@ while a dismiss is in proress!", buf, 0xCu);
              }
              v8[2](v8);
            }
            else
            {
              long long v62 = v8;
              uint64_t v30 = [(UIViewController *)self childModalViewController];
              uint64_t v31 = [(UIViewController *)v30 presentedViewController];
              if (v31)
              {
                CGFloat v32 = (UIViewController *)v31;
                do
                {
                  if (v30 == v32) {
                    [MEMORY[0x1E4F1CA00] raise:@"UIViewControllerHierarchyInconsistency", @"presentedViewController for controller is itself on dismiss for: %@", v32 format];
                  }
                  int v33 = v32;

                  CGFloat v32 = [(UIViewController *)v33 presentedViewController];

                  uint64_t v30 = v33;
                }
                while (v32);
              }
              else
              {
                int v33 = v30;
              }
              uint64_t v52 = [(UIViewController *)v33 presentingViewController];
              objc_super v53 = [(UIViewController *)self _presentationController];
              CGFloat v54 = [v53 _childPresentationController];

              if (v54 && ([v54 shouldPresentInFullscreen] & 1) == 0)
              {
                uint64_t v55 = [(UIViewController *)self _presentationController];
                [v55 _coverWithSnapshot];
              }
              if (!v52 || v52 == self)
              {
                id v57 = v33;
              }
              else
              {
                do
                {
                  long long v56 = [(UIViewController *)v52 _presentationController];
                  if (([v56 dismissing] & 1) == 0) {
                    [(UIViewController *)v52 _dismissViewControllerWithTransition:v4 from:v33 completion:0];
                  }
                  id v57 = v52;

                  uint64_t v52 = [(UIViewController *)v57 presentingViewController];

                  if (!v52) {
                    break;
                  }
                  int v33 = v57;
                }
                while (v52 != self);
              }
              if (v4)
              {
                id v8 = v62;
                if ([(UIViewController *)self definesPresentationContext]
                  && [(UIViewController *)self providesPresentationContextTransitionStyle])
                {
                  LODWORD(v4) = -[UIViewController _transitionForModalTransitionStyle:appearing:]((uint64_t)self, [(UIViewController *)self modalTransitionStyle], 0);
                }
              }
              else
              {
                id v8 = v62;
              }
              if ((*(void *)&v57->_viewControllerFlags & 0x200000000) != 0) {
                uint64_t v58 = 0;
              }
              else {
                uint64_t v58 = v4;
              }
              [(UIViewController *)self _dismissViewControllerWithTransition:v58 from:v57 completion:v7];
            }
          }
          else
          {
            long long v28 = -[UIViewController _viewControllerForDismissal](self);
            UIEdgeInsets v29 = v28;
            if (v28)
            {
              [v28 dismissViewControllerWithTransition:v4 completion:v7];
            }
            else
            {
              uint64_t v50 = [(UIViewController *)self _temporaryPresentationController];

              if (v50)
              {
                uint64_t v51 = [(UIViewController *)self _temporaryPresentationController];
                [v51 _closeScene];
                [(UIViewController *)self _setTemporaryPresentationController:0];
              }
              v8[2](v8);
            }
          }
          goto LABEL_103;
        }
        [(id)UIApp _deactivateReachability];
        id v22 = v7;
        if (v10)
        {
LABEL_77:

LABEL_103:
          goto LABEL_104;
        }
        double v23 = [(UIViewController *)self childModalViewController];
        if (!v23)
        {
          uint64_t v34 = [(UIViewController *)self presentedViewController];
          int v35 = v34;
          if (!v34
            || ([(UIViewController *)v34 presentingViewController],
                (id v36 = (UIViewController *)objc_claimAutoreleasedReturnValue()) == 0))
          {
            id v36 = [(UIViewController *)self presentingViewController];
          }
          [(UIViewController *)v36 dismissViewControllerWithTransition:v4 completion:v22];
          self = v36;
          goto LABEL_76;
        }
        BOOL v24 = v23;
        id v59 = v22;
        long long v61 = v8;
        uint64_t v25 = [(UIViewController *)v23 presentedViewController];
        if (v25)
        {
          double v26 = (UIViewController *)v25;
          do
          {
            if (v24 == v26) {
              [MEMORY[0x1E4F1CA00] raise:@"UIViewControllerHierarchyInconsistency", @"presentedViewController for controller is itself on dismiss for: %@", v26 format];
            }
            uint64_t v27 = v26;

            [(UIViewController *)v27 _presentingViewControllerWillChange:0];
            double v26 = [(UIViewController *)v27 presentedViewController];

            BOOL v24 = v27;
          }
          while (v26);
        }
        else
        {
          uint64_t v27 = v24;
        }
        id v60 = v7;
        [(UIViewController *)v27 _presentingViewControllerWillChange:0];
        double v37 = [(UIViewController *)v27 presentingViewController];
        uint64_t v38 = [(UIViewController *)v27 modalPresentationStyle];
        CGRect v39 = [(UIViewController *)v27 view];
        double v40 = [v39 window];

        if (v37 == self)
        {
          int v35 = 0;
          if (v4)
          {
LABEL_67:
            id v7 = v60;
            id v8 = v61;
            if ([(UIViewController *)self definesPresentationContext]
              && [(UIViewController *)self providesPresentationContextTransitionStyle])
            {
              LODWORD(v4) = -[UIViewController _transitionForModalTransitionStyle:appearing:]((uint64_t)self, [(UIViewController *)self modalTransitionStyle], 0);
            }
            goto LABEL_72;
          }
        }
        else
        {
          int v35 = 0;
          do
          {
            double v41 = [(UIViewController *)v37 view];
            long long v42 = [v41 window];

            if (v42)
            {
              [(UIViewController *)v37 _dismissViewControllerWithTransition:0 from:v27 completion:0];
              double v37 = v37;

              long long v43 = [(UIViewController *)v37 presentingViewController];
              uint64_t v27 = v37;
            }
            else
            {
              [(UIViewController *)v37 _presentingViewControllerWillChange:0];
              uint64_t v44 = [(UIViewController *)v37 presentingViewController];

              if (v38 == 3) {
                [(UIViewController *)v27 setModalPresentationStyle:[(UIViewController *)v37 modalPresentationStyle]];
              }
              if (v37)
              {
                long long v45 = [(UIViewController *)v37 childModalViewController];
                [v45 _setModalSourceViewController:0];
                [v45 _setSegueResponsibleForModalPresentation:0];
                uint64_t v46 = [(UIViewController *)v37 childModalViewController];
                -[UIViewController _removeChildModalViewController:]((id *)&v37->super.super.isa, v46);

                *(void *)&v37->_viewControllerFlags &= 0xFFFFFFFFFFBFFFEFLL;
                double v47 = v37->_currentAction;
                v37->_currentAction = 0;
              }
              if ([(UIViewController *)v37 _isModalSheet]
                || [(UIViewController *)v37 modalPresentationStyle] == UIModalPresentationOverFullScreen
                || [(UIViewController *)v37 modalPresentationStyle] == 17
                || [(UIViewController *)v37 modalPresentationStyle] == UIModalPresentationCustom)
              {
                [v40 _removeRotationViewController:v37];
              }
              int v48 = [v44 childModalViewController];
              -[UIViewController _removeChildModalViewController:]((id *)v44, v48);

              -[UIViewController _addChildModalViewController:]((id *)v44, v27);
              [(UIViewController *)v37 _presentingViewControllerDidChange:0];
              int v35 = v44;
              long long v43 = v35;
            }

            double v37 = v43;
          }
          while (v43 != self);
          if (v4) {
            goto LABEL_67;
          }
        }
        id v7 = v60;
        id v8 = v61;
LABEL_72:
        if ((*(void *)&v27->_viewControllerFlags & 0x200000000) != 0) {
          uint64_t v49 = 0;
        }
        else {
          uint64_t v49 = v4;
        }
        [(UIViewController *)self _dismissViewControllerWithTransition:v49 from:v27 completion:v59];

        id v22 = v59;
LABEL_76:

        goto LABEL_77;
      }
    }
    else
    {
      unint64_t v15 = v13;
    }

    uint64_t v9 = 0;
    char v10 = 0;
    goto LABEL_21;
  }
  if (!self->_currentAction) {
    goto LABEL_8;
  }
  BOOL v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Presentation", &qword_1EB25BBE0) + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v66 = self;
    _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "Warning: Attempt to dismiss from view controller %@ while a presentation or dismiss is in progress!", buf, 0xCu);
  }
  v8[2](v8);
LABEL_104:
}

- (id)_viewControllerForDismissal
{
  if (a1)
  {
    uint64_t v2 = [a1 _presentationController];
    char v3 = [v2 _presentingOrPresented];

    if (v3)
    {
      id v4 = a1;
    }
    else
    {
      char v5 = [a1 presentedViewController];
      id v6 = [v5 _existingPresentationControllerImmediate:1 effective:1];
      int v7 = [v6 _presentingOrPresented];

      if (!v7 || ([v5 presentingViewController], (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
        id v4 = [a1 presentingViewController];
      }
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

uint64_t __67__UIViewController_dismissViewControllerWithTransition_completion___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    $0AC6E346AE4835514AAA8AC86D8F4844 result = dyld_program_sdk_at_least();
    if (result)
    {
      uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
      return v2();
    }
  }
  return result;
}

void __63__UIViewController__presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56)
    || (uint64_t v2 = *(void *)(a1 + 32)) != 0 && (*(void *)(v2 + 376) & 0x200000000) != 0
    || !+[UIViewController _shouldAnimateTransitions])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__UIViewController__presentViewController_animated_completion___block_invoke_2;
    v7[3] = &unk_1E52E3298;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    char v5 = *(void **)(a1 + 48);
    id v8 = v3;
    uint64_t v9 = v4;
    id v10 = v5;
    +[UIView performWithoutAnimation:v7];
  }
  else
  {
    [*(id *)(a1 + 40) _presentViewController:*(void *)(a1 + 32) withAnimationController:0 completion:*(void *)(a1 + 48)];
  }
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"_UIInternalViewControllerPresentationWillBeginNotification" object:*(void *)(a1 + 32)];
}

- (BOOL)_willPreemptRunningPresentationTransition
{
  uint64_t v2 = [(UIViewController *)self _nonModalAncestorViewControllerStopAtIsPresentationContext:0];
  id v3 = [v2 _presentationController];
  uint64_t v4 = [v3 _transitionContext];

  char v5 = [v4 _animator];
  char v6 = 0;
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 prefersPreemptionEnabledForPresentations];
  }

  return v6;
}

- (void)setFocusGroupIdentifier:(NSString *)focusGroupIdentifier
{
  uint64_t v3 = 0x2000000000000;
  if (!focusGroupIdentifier) {
    uint64_t v3 = 0x1000000000000;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFCFFFFFFFFFFFFLL | v3;
  objc_setAssociatedObject(self, &FocusGroupIdentifierKey, focusGroupIdentifier, (void *)1);
}

- (void)_beginDelayingPresentation:(double)a3 cancellationHandler:(id)a4
{
  id v8 = a4;
  objc_getAssociatedObject(self, &unk_1EB25BB23);
  char v6 = (_UIDelayedPresentationContext *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    int v7 = v6;
    [(_UIDelayedPresentationContext *)v6 incrementRequestCount];
  }
  else
  {
    int v7 = [[_UIDelayedPresentationContext alloc] initWithTimeout:v8 cancellationHandler:a3];
    objc_setAssociatedObject(self, &unk_1EB25BB23, v7, (void *)1);
  }
}

- (void)_setUsesSharedView:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (id)_userActionDescription
{
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
    _addUserActionDescription(a1, v2);
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4
{
  uint64_t v6 = sub_186A1DF8C();
  uint64_t v7 = *(void *)(v6 - 8);
  double v8 = MEMORY[0x1F4188790](v6);
  id v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, double))(v7 + 104))(v10, *MEMORY[0x1E4FB0B68], v6, v8);
  id v11 = a4;
  id v12 = self;
  sub_186A1DA6C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)_updateViewConstraintsWithObservationTracking
{
  uint64_t v2 = self;
  sub_185A8A114();
}

- (void)_viewWillLayoutSubviewsWithObservationTracking
{
  uint64_t v2 = self;
  sub_185A8A6B8();
}

- (void)_viewDidLayoutSubviewsWithObservationTracking
{
  uint64_t v2 = self;
  sub_185A8AC5C();
}

- (void)_updateContentUnavailableConfigurationWithObservationTracking
{
  uint64_t v2 = self;
  sub_185A8B200();
}

- (id)_visualStyleOfContainingAlertController
{
  uint64_t v2 = [(UIViewController *)self parentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 _visualStyle];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_nextResponderUsingTraversalStrategy:(unint64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v6 = [(UIViewController *)self parentViewController];
    uint64_t v7 = v6;
    if (v6)
    {
      char v15 = 0;
      char v5 = [v6 _nextResponderUsingTargetActionStrategyFromChildViewController:self didTraverseToParentViewController:&v15];
      if (v15)
      {
        uint64_t v8 = [v7 presentedViewController];
        if (v8)
        {
          uint64_t v9 = (void *)v8;
          char v10 = [v7 performsActionsWhilePresentingModally];

          if ((v10 & 1) == 0)
          {
            uint64_t v11 = __84__UIViewController_UIResponderChainTraversal___nextResponderUsingTraversalStrategy___block_invoke(v7);

            char v5 = (void *)v11;
          }
        }
      }
    }
    else
    {
      char v5 = __84__UIViewController_UIResponderChainTraversal___nextResponderUsingTraversalStrategy___block_invoke(self);
    }
  }
  else if (a3)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIResponder+UIResponderChainTraversal.m", 246, @"Invalid call to %s with strategy: %u", "-[UIViewController(UIResponderChainTraversal) _nextResponderUsingTraversalStrategy:]", a3);

    char v5 = 0;
  }
  else
  {
    char v5 = [(UIViewController *)self nextResponder];
  }
  return v5;
}

id __84__UIViewController_UIResponderChainTraversal___nextResponderUsingTraversalStrategy___block_invoke(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 presentingViewController];
  if (v2)
  {
    while (1)
    {
      uint64_t v3 = v2;
      if ([v2 performsActionsWhilePresentingModally]) {
        break;
      }

      uint64_t v2 = [v3 presentingViewController];
      id v1 = v3;
      if (!v2)
      {
        id v1 = v3;
        uint64_t v3 = 0;
        break;
      }
    }
  }
  uint64_t v4 = [v1 nextResponder];

  return v4;
}

- (BOOL)_hasDeepestActionResponder
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__UIViewController_UIResponderChainTraversal___hasDeepestActionResponder__block_invoke;
  v3[3] = &unk_1E52DA6B0;
  v3[4] = self;
  return [(UIViewController *)self _hasDeepestPresentedActionResponderOrBlock:v3];
}

BOOL __73__UIViewController_UIResponderChainTraversal___hasDeepestActionResponder__block_invoke(uint64_t a1)
{
  id v1 = *(_DWORD **)(a1 + 32);
  if (!v1 || ((v1[94] >> 1) & 3u) - 1 > 1) {
    return 0;
  }
  uint64_t v2 = [v1 _existingView];
  uint64_t v3 = [v2 window];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_hasDeepestPresentedActionResponderOrBlock:(id)a3
{
  BOOL v4 = (uint64_t (**)(void))a3;
  if (dyld_program_sdk_at_least()
    && ([(UIViewController *)self presentedViewController],
        char v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 _hasDeepestActionResponder],
        v5,
        (v6 & 1) != 0))
  {
    char v7 = 1;
  }
  else
  {
    char v7 = v4[2](v4);
  }

  return v7;
}

- (id)_deepestActionResponder
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__UIViewController_UIResponderChainTraversal___deepestActionResponder__block_invoke;
  v4[3] = &unk_1E52E6838;
  v4[4] = self;
  uint64_t v2 = [(UIViewController *)self _deepestPresentedActionResponderOrBlock:v4];
  return v2;
}

id __70__UIViewController_UIResponderChainTraversal___deepestActionResponder__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) mutableChildViewControllers];
  if ([v2 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v3 = [v2 reverseObjectEnumerator];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(_DWORD **)(*((void *)&v16 + 1) + 8 * i);
          if (v8
            && ((v8[94] >> 1) & 3u) - 1 <= 1
            && ([*(id *)(*((void *)&v16 + 1) + 8 * i) _hasDeepestActionResponder] & 1) != 0)
          {
            id v12 = v8;
            goto LABEL_19;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
  }
  uint64_t v9 = *(_DWORD **)(a1 + 32);
  if (v9
    && ((v9[94] >> 1) & 3u) - 1 <= 1
    && ([v9 _existingView],
        char v10 = objc_claimAutoreleasedReturnValue(),
        [v10 window],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        uint64_t v9 = *(_DWORD **)(a1 + 32),
        v11))
  {
    id v12 = [v9 _existingView];
    uint64_t v3 = v12;
LABEL_19:
    uint64_t v13 = [v12 _deepestActionResponder];
  }
  else
  {
    v15.receiver = v9;
    v15.super_class = (Class)UIViewController;
    uint64_t v13 = objc_msgSendSuper2(&v15, sel__deepestActionResponder);
  }

  return v13;
}

- (id)_deepestPresentedActionResponderOrBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = [(UIViewController *)self presentedViewController];
  int v6 = [v5 _hasDeepestActionResponder];

  if (v6)
  {
    char v7 = [(UIViewController *)self presentedViewController];
    uint64_t v8 = [v7 _deepestActionResponder];
  }
  else
  {
    uint64_t v8 = v4[2](v4);
  }

  return v8;
}

- (id)_nextResponderUsingTargetActionStrategyFromChildViewController:(id)a3 didTraverseToParentViewController:(BOOL *)a4
{
  if (a4) {
    *a4 = 1;
  }
  return (id)[a3 nextResponder];
}

- (_UIActionSheetPresentationController)actionSheetPresentationController
{
  uint64_t v2 = [(UIViewController *)self popoverPresentationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v2 setCanOverlapSourceViewRect:1];
    id v3 = v2;
  }
  else
  {
    id v3 = 0;
  }

  return (_UIActionSheetPresentationController *)v3;
}

- (BOOL)_displaysFullScreen
{
  return 0;
}

- (int64_t)_imagePickerStatusBarStyle
{
  return 1;
}

- (CGSize)_resolvedPreferredContentSize
{
  [(UIViewController *)self preferredContentSize];
  double v5 = v4;
  double v6 = v3;
  if (v4 <= 0.0 || v3 <= 0.0)
  {
    [(UIViewController *)self contentSizeForViewInPopover];
    if (v8 <= 0.0 || v8 == 1100.0 || v7 <= 0.0)
    {
      uint64_t v9 = [(UIViewController *)self parentViewController];

      if (v9)
      {
        char v10 = [(UIViewController *)self parentViewController];
        [v10 _resolvedPreferredContentSize];
        double v5 = v11;
        double v6 = v12;
      }
      else
      {
        if (v5 <= 0.0) {
          double v5 = 320.0;
        }
        if (v6 <= 0.0) {
          double v6 = 480.0;
        }
      }
    }
    else
    {
      double v6 = v8;
      double v5 = v7;
    }
  }
  double v13 = v5;
  double v14 = v6;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)_ui_setObservationTrackingDictionary:(id)a3
{
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFFFFFFFFELL | (a3 != 0);
  v3.receiver = self;
  v3.super_class = (Class)UIViewController;
  [&v3 _ui_setObservationTrackingDictionary:a3];
}

- (id)_ui_observationTrackingDictionary
{
  if (*(void *)&self->_viewControllerFlags)
  {
    v4.receiver = self;
    v4.super_class = (Class)UIViewController;
    uint64_t v2 = [&v4 _ui_observationTrackingDictionary];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (id)_presentationControllerClassName
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)_primitiveSetNavigationControllerContentInsetAdjustment:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v7 = [(UIViewController *)self navigationInsetAdjustment];
  objc_msgSend(v7, "setInsetAdjustment:", top, left, bottom, right);
}

- (void)_primitiveSetNavigationControllerContentOffsetAdjustment:(double)a3
{
  self->_navigationControllerContentOffsetAdjustment = a3;
}

- (void)_prepareForNavigationTransition:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v5 = self->_view;
  double v6 = v5;
  if (v5)
  {
    id v7 = [(UIView *)v5 window];

    if (v7)
    {
      -[UIView _updateTraitsIfNeededWithBehavior:]((uint64_t)v6, 0);
      if (v3) {
        -[UIViewController __viewIsAppearing:skipWindowCheck:]((uint64_t)self, (*(void *)&self->_viewControllerFlags >> 22) & 1, 1);
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      double v8 = [(UIViewController *)self childViewControllers];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            double v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
            if ([(UIViewController *)self _isNestedNavigationController])
            {
              double v14 = [(UIViewController *)self topViewController];
              BOOL v15 = v14 == v13;
            }
            else
            {
              BOOL v15 = 0;
            }
            [v13 _prepareForNavigationTransition:v15];
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }
    }
  }
}

- (void)_updateContentOverlayInsetsFromParentForNavigationTransitionWithFinalRectInParent:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v9 = -[UIViewController _parentViewController]((id *)&self->super.super.isa);
  id v15 = v9;
  if (!v9)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"UIViewController.m" lineNumber:1318 description:@"Unexpected transition state"];

    uint64_t v9 = 0;
  }
  double top = self->_contentOverlayInsets.top;
  double left = self->_contentOverlayInsets.left;
  double bottom = self->_contentOverlayInsets.bottom;
  double right = self->_contentOverlayInsets.right;
  if (-[UIViewController __updateContentOverlayInsetsWithOurRect:inBoundsOfAncestorViewController:viaImmediateChildOfAncestor:]((unint64_t)self, v9, self, x, y, width, height))-[UIViewController _invalidateChildContentOverlayInsetsWithOldInsets:]((double *)self, top, left, bottom, right); {
}
  }

- (UIEdgeInsets)_customBasePresentationInsetsForView:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.double right = v6;
  result.double bottom = v5;
  result.double left = v4;
  result.double top = v3;
  return result;
}

- (id)_shim_contentScrollView
{
  if (_UIBarsApplyChromelessEverywhere()) {
    goto LABEL_8;
  }
  if (qword_1EB25BB30 != -1) {
    dispatch_once(&qword_1EB25BB30, &__block_literal_global_142);
  }
  if (_MergedGlobals_136)
  {
LABEL_8:
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"UIViewController.m" lineNumber:1534 description:@"Unexpected code path for compatibility code only"];
  }
  return [(UIViewController *)self contentScrollView];
}

- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5
{
  *a4 = -1.79769313e308;
  *a5 = -1.79769313e308;
}

- (UIEdgeInsets)_avoidanceInsets
{
  double top = self->_contentOverlayInsets.top;
  double bottom = self->_contentOverlayInsets.bottom;
  double v4 = 0.0;
  double v5 = 0.0;
  result.double right = v5;
  result.double bottom = bottom;
  result.double left = v4;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)_devicePeripheryInsets
{
  uint64_t v2 = [(UIViewController *)self view];
  double v3 = [v2 _screen];
  [v3 _peripheryInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.double right = v15;
  result.double bottom = v14;
  result.double left = v13;
  result.double top = v12;
  return result;
}

- (id)safeAreaLayoutGuide
{
  uint64_t v2 = [(UIViewController *)self view];
  double v3 = [v2 safeAreaLayoutGuide];

  return v3;
}

- (id)topLayoutGuide
{
  if (!self->_topLayoutGuide)
  {
    double v3 = [(UIViewController *)self _existingView];

    if (v3)
    {
      if (-[UIViewController _useViewBasedTopAndBottomLayoutGuides]((uint64_t)self))
      {
        double v4 = +[_UILayoutGuide _verticalLayoutGuide];
        topLayoutGuide = self->_topLayoutGuide;
        self->_topLayoutGuide = v4;
      }
      else
      {
        double v6 = +[_UILayoutSpacer _verticalLayoutSpacer];
        double v7 = self->_topLayoutGuide;
        self->_topLayoutGuide = v6;

        [(UILayoutSupport *)self->_topLayoutGuide setIdentifier:@"UIVC-topLayoutGuide"];
      }
      -[UIViewController _setUpLayoutGuideConstraintIfNecessaryAtTop:]((uint64_t)self, 1);
    }
    else if ((topLayoutGuide_didLog & 1) == 0)
    {
      topLayoutGuide_didLog = 1;
      NSLog(&cfstr_SGuideNotAvail.isa, "-[UIViewController topLayoutGuide]");
    }
  }
  double v8 = self->_topLayoutGuide;
  return v8;
}

- (id)bottomLayoutGuide
{
  if (!self->_bottomLayoutGuide)
  {
    double v3 = [(UIViewController *)self _existingView];

    if (v3)
    {
      if (-[UIViewController _useViewBasedTopAndBottomLayoutGuides]((uint64_t)self))
      {
        double v4 = +[_UILayoutGuide _verticalLayoutGuide];
        bottomLayoutGuide = self->_bottomLayoutGuide;
        self->_bottomLayoutGuide = v4;
      }
      else
      {
        double v6 = +[_UILayoutSpacer _verticalLayoutSpacer];
        double v7 = self->_bottomLayoutGuide;
        self->_bottomLayoutGuide = v6;

        [(UILayoutSupport *)self->_bottomLayoutGuide setIdentifier:@"UIVC-bottomLayoutGuide"];
      }
      -[UIViewController _setUpLayoutGuideConstraintIfNecessaryAtTop:]((uint64_t)self, 0);
    }
    else if ((bottomLayoutGuide_didLog & 1) == 0)
    {
      bottomLayoutGuide_didLog = 1;
      NSLog(&cfstr_SGuideNotAvail.isa, "-[UIViewController bottomLayoutGuide]");
    }
  }
  double v8 = self->_bottomLayoutGuide;
  return v8;
}

- (void)_setPreviousFittingSizeInfo:(id)a3
{
}

+ (BOOL)doesOverridePreferredInterfaceOrientationForPresentation
{
  uint64_t v3 = objc_opt_class();
  return [a1 doesOverrideViewControllerMethod:sel_preferredInterfaceOrientationForPresentation inBaseClass:v3];
}

- (BOOL)_hasPreferredInterfaceOrientationForPresentation
{
  uint64_t v2 = objc_opt_class();
  return [v2 doesOverridePreferredInterfaceOrientationForPresentation];
}

- (BOOL)_formSheetObeysContentContainerSize
{
  return 0;
}

- (CGSize)formSheetSize
{
  double width = self->_formSheetSize.width;
  double height = self->_formSheetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)_formSheetSizeForWindowWithSize:(CGSize)a3 screenSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  double v9 = +[_UIPresentationControllerDefaultVisualStyleProvider sharedInstance];
  double v10 = [v9 defaultSheetMetrics];
  objc_msgSend(v10, "formSheetSizeForViewController:windowSize:screenSize:", self, v7, v6, width, height);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)setFormSheetSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(UIViewController *)self _existingView];
  if (v6
    && (double v7 = (void *)v6,
        [(UIViewController *)self _existingView],
        double v8 = objc_claimAutoreleasedReturnValue(),
        [v8 window],
        id v24 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v24))
  {
    double v9 = [v24 screen];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v14 = [(UIViewController *)self _screen];
    [v14 bounds];
    double v11 = v15;
    double v13 = v16;

    id v24 = +[UIWindow _applicationKeyWindow];
  }
  if (dyld_program_sdk_at_least())
  {
    double v17 = v13;
    double v18 = v11;
    if (v24)
    {
      objc_msgSend(v24, "bounds", v11, v13);
      double v18 = v19;
      double v17 = v20;
    }
    -[UIViewController _formSheetSizeForWindowWithSize:screenSize:](self, "_formSheetSizeForWindowWithSize:screenSize:", v18, v17, v11, v13);
    double height = v21;
    self->_formSheetSize.double width = v22;
    double v23 = v24;
    goto LABEL_14;
  }
  double v23 = v24;
  if (width > 0.0 && height > 0.0 && width <= v11 && height <= v13)
  {
    self->_formSheetSize.double width = width;
LABEL_14:
    self->_formSheetSize.double height = height;
  }
}

- (void)setContentSizeForViewInPopover:(CGSize)contentSizeForViewInPopover
{
  double height = self->_contentSizeForViewInPopover.height;
  if (self->_contentSizeForViewInPopover.width != contentSizeForViewInPopover.width
    || height != contentSizeForViewInPopover.height)
  {
    self->_contentSizeForViewInPopover = contentSizeForViewInPopover;
    if ([(UIViewController *)self isViewLoaded])
    {
      uint64_t v6 = [(UIViewController *)self _existingView];
      double v7 = +[_UIPopoverView popoverViewContainingView:v6];

      if (v7)
      {
        double v8 = [(UIViewController *)self _popoverController];
        double v9 = v8;
        if (v8)
        {
          CGFloat v22 = v8;
          char v10 = [v8 _embedsInView];
          double v9 = v22;
          if ((v10 & 1) == 0)
          {
            double v11 = [v22 contentViewController];
            double v12 = [v11 presentedViewController];

            double v13 = [v22 contentViewController];
            double v14 = v13;
            if (v12)
            {
              double v15 = [v13 presentedViewController];
              [v15 contentSizeForViewInPopover];
              double v17 = v16;
              double v19 = v18;
            }
            else
            {
              [v13 contentSizeForViewInPopover];
              double v17 = v20;
              double v19 = v21;
            }

            objc_msgSend(v22, "setPopoverContentSize:animated:", height != 1100.0, v17, v19);
            double v9 = v22;
          }
        }
      }
    }
  }
}

- (CGSize)contentSizeForViewInPopoverView
{
  double width = self->_contentSizeForViewInPopover.width;
  double height = self->_contentSizeForViewInPopover.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSArray)_preferredContentSizes
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)_systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3 childViewController:(id)a4
{
  id v7 = a4;
  [(UIViewController *)self systemLayoutFittingSizeDidChangeForChildContentContainer:a3];
  uint64_t v6 = v7;
  if (v7)
  {
    [(UIViewController *)self systemLayoutFittingSizeDidChangeForChildViewController:v7];
    uint64_t v6 = v7;
  }
}

- (CGSize)_systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = [(UIViewController *)self view];
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (BOOL)isModalInPopover
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = self->_childModalViewControllers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "isModalInPopover", (void)v10))
        {

          LOBYTE(v8) = 1;
          return v8;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  return (*(void *)&self->_viewControllerFlags >> 15) & 1;
}

- (id)_viewForContentInPopover
{
  uint64_t v3 = [(UIViewController *)self childModalViewController];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [(UIViewController *)self childModalViewController],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isModalInPresentation],
        v5,
        v4,
        v6))
  {
    uint64_t v7 = [(UIViewController *)self childModalViewController];
    BOOL v8 = [v7 _viewForContentInPopover];
  }
  else
  {
    BOOL v8 = [(UIViewController *)self view];
  }
  return v8;
}

- (void)_didResignContentViewControllerOfPopover:(id)a3
{
  id v4 = a3;
  id v5 = [(UIViewController *)self _popoverController];

  if (v5 == v4)
  {
    [(UIViewController *)self _setPopoverController:0];
  }
}

- (void)_setInCustomTransition:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)_viewHostsLayoutEngine
{
  return self->_viewHostsLayoutEngine;
}

- (BOOL)_viewHostsLayoutEngineAllowsTAMIC_NO
{
  return 0;
}

uint64_t __34__UIViewController__doCommonSetup__block_invoke(uint64_t a1)
{
  return [(id)qword_1EB25BB38 addObject:*(void *)(a1 + 32)];
}

- (void)_populateArchivedChildViewControllers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_childViewControllers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_msgSend(v4, "addObject:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v38 = a3;
  if (self->_view && [(UIViewController *)self _shouldPersistViewWhenCoding]) {
    [v38 encodeObject:self->_view forKey:@"UIView"];
  }
  title = self->_title;
  if (title) {
    [v38 encodeObject:title forKey:@"UITitle"];
  }
  tabBarItem = self->_tabBarItem;
  if (tabBarItem) {
    [v38 encodeObject:tabBarItem forKey:@"UITabBarItem"];
  }
  navigationItem = self->_navigationItem;
  if (navigationItem) {
    [v38 encodeObject:navigationItem forKey:@"UINavigationItem"];
  }
  externalObjectsTableForViewLoading = self->_externalObjectsTableForViewLoading;
  if (externalObjectsTableForViewLoading) {
    [v38 encodeObject:externalObjectsTableForViewLoading forKey:@"UIExternalObjectsTableForViewLoading"];
  }
  topLevelObjectsToKeepAliveFromStoryboard = self->_topLevelObjectsToKeepAliveFromStoryboard;
  if (topLevelObjectsToKeepAliveFromStoryboard) {
    [v38 encodeObject:topLevelObjectsToKeepAliveFromStoryboard forKey:@"UITopLevelObjectsToKeepAliveFromStoryboard"];
  }
  nibName = self->_nibName;
  if (nibName) {
    [v38 encodeObject:nibName forKey:@"UINibName"];
  }
  nibBundle = self->_nibBundle;
  if (nibBundle)
  {
    long long v11 = [(NSBundle *)nibBundle bundleIdentifier];
    [v38 encodeObject:v11 forKey:@"UINibBundleIdentifier"];
  }
  parentViewController = self->_parentViewController;
  if (parentViewController) {
    [v38 encodeConditionalObject:parentViewController forKey:@"UIParentViewController"];
  }
  uint64_t viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  if ((viewControllerFlags & 0x40) == 0)
  {
    [v38 encodeBool:0 forKey:@"UIAutoresizesArchivedViewToFullSize"];
    uint64_t viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  }
  if ((viewControllerFlags & 0x400) != 0) {
    [v38 encodeBool:1 forKey:@"UIWantsFullScreenLayout"];
  }
  if ([(NSArray *)self->_toolbarItems count]) {
    [v38 encodeObject:self->_toolbarItems forKey:@"UIToolbarItems"];
  }
  if ([(NSMutableArray *)self->_childViewControllers count])
  {
    double v14 = [(UIViewController *)self _customChildViewControllerSelectorsNames];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      double v16 = [(UIViewController *)self _customChildViewControllerSelectorsNames];
      [v38 encodeObject:v16 forKey:@"UIChildViewControllerSelectors"];
    }
    double v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSMutableArray count](self->_childViewControllers, "count"));
    [(UIViewController *)self _populateArchivedChildViewControllers:v17];
    if ([v17 count])
    {
      double v18 = UIArrayByKeepingObjectsInSet(self->_childViewControllers, v17);
      [v38 encodeObject:v18 forKey:@"UIChildViewControllers"];
    }
  }
  uint64_t v19 = (uint64_t)self->_viewControllerFlags;
  if ((([(UIViewController *)self _isPresentationContextByDefault] ^ ((v19 & 0x40000) == 0)) & 1) == 0) {
    [v38 encodeBool:(*(void *)&self->_viewControllerFlags >> 18) & 1 forKey:@"UIDefinesPresentationContext"];
  }
  uint64_t v20 = (uint64_t)self->_viewControllerFlags;
  if ((v20 & 0x80000) != 0)
  {
    [v38 encodeBool:1 forKey:@"UIProvidesPresentationContextTransitionStyle"];
    uint64_t v20 = (uint64_t)self->_viewControllerFlags;
  }
  if ((v20 & 0xC00000000000) != 0) {
    objc_msgSend(v38, "encodeBool:forKey:", -[UIViewController restoresFocusAfterTransition](self, "restoresFocusAfterTransition"), @"UIRestoresFocusAfterTransition");
  }
  int64_t modalTransitionStyle = self->_modalTransitionStyle;
  if (modalTransitionStyle != _UIViewControllerDefaultModalTransitionStyle(self)) {
    [v38 encodeInteger:self->_modalTransitionStyle forKey:@"UIModalTransitionStyle"];
  }
  int64_t modalPresentationStyle = self->_modalPresentationStyle;
  int v23 = dyld_program_sdk_at_least();
  uint64_t v24 = -2;
  if (!v23) {
    uint64_t v24 = 0;
  }
  if (modalPresentationStyle != v24) {
    [v38 encodeInteger:self->_modalPresentationStyle forKey:@"UIModalPresentationStyle"];
  }
  if ((*(void *)&self->_viewControllerFlags & 0x20) != 0) {
    [v38 encodeBool:1 forKey:@"UIHidesBottomBarWhenPushed"];
  }
  if (self->_contentSizeForViewInPopover.width != 320.0 || self->_contentSizeForViewInPopover.height != 1100.0) {
    objc_msgSend(v38, "encodeCGSize:forKey:", @"UIContentSizeForViewInPopover");
  }
  if (self->_preferredContentSize.width != *MEMORY[0x1E4F1DB30]
    || self->_preferredContentSize.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    objc_msgSend(v38, "encodeCGSize:forKey:", @"UIPreferredContentSize");
  }
  uint64_t v25 = [(UIResponder *)self restorationIdentifier];

  if (v25)
  {
    double v26 = [(UIResponder *)self restorationIdentifier];
    [v38 encodeObject:v26 forKey:@"UIRestorationIdentifier"];
  }
  storyboardIdentifier = self->_storyboardIdentifier;
  if (storyboardIdentifier) {
    [v38 encodeObject:storyboardIdentifier forKey:@"UIStoryboardIdentifier"];
  }
  interfaceBuilderKeyCommands = self->_interfaceBuilderKeyCommands;
  if (interfaceBuilderKeyCommands) {
    [v38 encodeObject:interfaceBuilderKeyCommands forKey:@"UIKeyCommands"];
  }
  addedKeyCommands = self->_addedKeyCommands;
  if (addedKeyCommands) {
    [v38 encodeObject:addedKeyCommands forKey:@"UIAddedKeyCommands"];
  }
  unint64_t edgesForExtendedLayout = self->_edgesForExtendedLayout;
  if (edgesForExtendedLayout != 15) {
    [v38 encodeInteger:edgesForExtendedLayout forKey:@"UIKeyEdgesForExtendedLayout"];
  }
  p_uint64_t viewControllerFlags = &self->_viewControllerFlags;
  uint64_t v32 = (uint64_t)self->_viewControllerFlags;
  if ((v32 & 0x2000000000) != 0)
  {
    [v38 encodeInteger:1 forKey:@"UIKeyExtendedLayoutIncludesOpaqueBars"];
    uint64_t v32 = *(void *)p_viewControllerFlags;
    if ((*(void *)p_viewControllerFlags & 0x4000000000) == 0)
    {
LABEL_64:
      if ((v32 & 0x8000000000000) != 0) {
        goto LABEL_66;
      }
      goto LABEL_65;
    }
  }
  else if ((v32 & 0x4000000000) == 0)
  {
    goto LABEL_64;
  }
  [v38 encodeInteger:1 forKey:@"UIKeyAutomaticallyAdjustsScrollViewInsets"];
  if ((*(void *)&self->_viewControllerFlags & 0x8000000000000) == 0) {
LABEL_65:
  }
    [v38 encodeBool:0 forKey:@"UIViewControllerViewRespectsSystemMinimumLayoutMargins"];
LABEL_66:
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    topLayoutGuide = self->_topLayoutGuide;
    if (topLayoutGuide) {
      [v38 encodeObject:topLayoutGuide forKey:@"UIViewControllerTopLayoutGuide"];
    }
    bottomLayoutGuide = self->_bottomLayoutGuide;
    if (bottomLayoutGuide) {
      [v38 encodeObject:bottomLayoutGuide forKey:@"UIViewControllerBottomLayoutGuide"];
    }
  }
  observableScrollViews = self->_observableScrollViews;
  if (observableScrollViews) {
    [v38 encodeObject:observableScrollViews forKey:@"UIViewControllerObservableScrollViews"];
  }
  interactionActivityTrackingBaseName = self->_interactionActivityTrackingBaseName;
  double v37 = v38;
  if (interactionActivityTrackingBaseName)
  {
    [v38 encodeObject:interactionActivityTrackingBaseName forKey:@"UIViewControllerInteractionActivityTrackingBaseName"];
    double v37 = v38;
  }
}

- (unint64_t)_isDeallocInitiated
{
  if (result) {
    return ((unint64_t)*(unsigned __int16 *)(result + 384) >> 7) & 1;
  }
  return result;
}

- (BOOL)_isViewController
{
  return 1;
}

- (void)_setTraitStorageList:(id)a3
{
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xDFFFFFFFFFFFFFFFLL | ((unint64_t)(a3 != 0) << 61);
  v3.receiver = self;
  v3.super_class = (Class)UIViewController;
  -[NSObject _setTraitStorageList:](&v3, sel__setTraitStorageList_);
}

- (void)_parent:(id)a3 willTransitionToTraitCollection:(id)a4 withTransitionCoordinator:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (UITraitCollection *)a4;
  id v10 = a5;
  id v11 = [(UIViewController *)self _parentTraitEnvironment];

  if (v11 != v8)
  {
    if (!_UIViewControllersInheritTraitsFromViewHierarchy())
    {
LABEL_5:
      uint64_t v15 = v9;
      goto LABEL_14;
    }
    uint64_t v12 = [(UIViewController *)self parentViewController];
    if ((id)v12 == v8)
    {
    }
    else
    {
      long long v13 = (void *)v12;
      id v14 = [(UIViewController *)self _departingParentViewController];

      if (v14 != v8) {
        goto LABEL_5;
      }
    }
  }
  frozenTraitCollection = self->_frozenTraitCollection;
  if (frozenTraitCollection)
  {
    double v17 = frozenTraitCollection;
  }
  else
  {
    -[UIViewController _traitCollectionByApplyingLocalOverridesToTraitCollection:]((uint64_t)self, v9);
    double v17 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v15 = v17;

  double v18 = [(UIViewController *)self traitCollection];
  uint64_t v19 = v18;
  if (v15 != v18 && ![(UITraitCollection *)v18 isEqual:v15])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __86__UIViewController__parent_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
    v20[3] = &unk_1E52DD450;
    v20[4] = self;
    double v21 = v19;
    CGFloat v22 = v15;
    id v23 = v10;
    +[UIViewController _performWithoutDeferringTransitions:v20];
  }
LABEL_14:
}

uint64_t __86__UIViewController__parent_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  BOOL v3 = _UIShouldLogTraitCollectionChangeForInstanceAndMethod(v2, a1[4], (uint64_t)sel_willTransitionToTraitCollection_withTransitionCoordinator_);

  if (v3)
  {
    id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("TraitCollectionChange", &_UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke___s_category)+ 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = v5;
      uint64_t v7 = NSStringFromSelector(sel_willTransitionToTraitCollection_withTransitionCoordinator_);
      uint64_t v8 = a1[4];
      uint64_t v9 = +[UITraitCollection _descriptionForChangeFromTraitCollection:a1[5] toTraitCollection:a1[6]];
      uint64_t v10 = a1[5];
      uint64_t v11 = a1[6];
      int v12 = 138413314;
      long long v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      double v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Sending -%@ to %@\n\t► trait changes: %@\n\t► current: %@\n\t► new: %@", (uint8_t *)&v12, 0x34u);
    }
  }
  return [(id)a1[4] willTransitionToTraitCollection:a1[6] withTransitionCoordinator:a1[7]];
}

- (void)_unsafeParentWillTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIViewController *)self _parentTraitEnvironment];
  [(UIViewController *)self _parent:v8 willTransitionToTraitCollection:v7 withTransitionCoordinator:v6];
}

- (void)_window:(id)a3 willTransitionToTraitCollection:(id)a4 withTransitionCoordinator:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [(UIViewController *)self childViewControllers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v15++) _window:v8 willTransitionToTraitCollection:v9 withTransitionCoordinator:v10];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  __int16 v16 = [(UIViewController *)self _presentationController];
  [v16 _window:v8 willTransitionToTraitCollection:v9 withTransitionCoordinator:v10];
}

- (id)_overrideTraitCollectionToPassDuringTraitChangeToChildViewController:(id)a3
{
  return 0;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v6 = a4;
  if ([(id)UIApp _wantsCompactStatusBarHiding])
  {
    uint64_t v7 = [v48 verticalSizeClass];
    id v8 = [(UIViewController *)self traitCollection];
    uint64_t v9 = [v8 verticalSizeClass];

    if (v7 != v9)
    {
      if (v6) {
        [v6 targetTransform];
      }
      else {
        memset(&v58, 0, sizeof(v58));
      }
      if (!CGAffineTransformIsIdentity(&v58)
        && ([(UIViewController *)self _window],
            id v10 = objc_claimAutoreleasedReturnValue(),
            [v10 rootViewController],
            uint64_t v11 = (UIViewController *)objc_claimAutoreleasedReturnValue(),
            v11,
            v10,
            v11 == self))
      {
        uint64_t v27 = [(UIViewController *)self _existingView];
        long long v28 = [v27 window];
        uint64_t v13 = [v28 windowScene];

        if (v13)
        {
          uint64_t v12 = [v13 statusBarManager];
          [v12 defaultStatusBarHeight];
          double v30 = v29;
          uint64_t v31 = [v13 _effectiveUISettings];
          [v31 peripheryInsets];
          double v33 = v32;

          if (v30 > v33)
          {
            char v14 = [v12 isStatusBarHidden];
            char v15 = 1;
            goto LABEL_10;
          }
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      else
      {
        uint64_t v12 = 0;
        uint64_t v13 = 0;
      }
      char v14 = 0;
      char v15 = 0;
LABEL_10:
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __78__UIViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
      v53[3] = &unk_1E52E9F08;
      char v56 = v15;
      char v57 = v14;
      v53[4] = self;
      id v54 = v12;
      id v55 = v13;
      id v16 = v13;
      id v17 = v12;
      [v6 animateAlongsideTransition:v53 completion:0];
      -[UIViewController _invalidateBehaviorPreferences](self);
    }
  }
  if (self && ((*(_DWORD *)&self->_viewControllerFlags >> 1) & 3u) - 1 <= 1)
  {
    long long v18 = [(UIViewController *)self navigationItem];
    long long v19 = [v18 _searchControllerIfAllowed];
    if (v19)
    {
      long long v20 = [v18 _navigationBar];
      uint64_t v21 = [v20 topItem];

      if (v21 == v18)
      {
        int v22 = [v18 _hasInlineSearchBar];
        int v23 = [v18 _hasInlineSearchBarForTraits:v48];
        if (v22 != v23)
        {
          int v24 = v23;
          uint64_t v25 = [v19 delegate];
          if (objc_opt_respondsToSelector())
          {
            if (v24) {
              uint64_t v26 = 1;
            }
            else {
              uint64_t v26 = 2;
            }
            [v25 searchController:v19 willChangeToSearchBarPlacement:v26];
          }
          else if (objc_opt_respondsToSelector())
          {
            if (v24) {
              uint64_t v34 = 1;
            }
            else {
              uint64_t v34 = 2;
            }
            objc_msgSend(v25, "_dci_searchController:willChangeToSearchBarPlacement:", v19, v34);
          }
        }
      }
    }
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  int v35 = [(UIViewController *)self childViewControllers];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v50 != v38) {
          objc_enumerationMutation(v35);
        }
        double v40 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if (_UIViewControllersInheritTraitsFromViewHierarchy())
        {
          double v41 = 0;
        }
        else
        {
          double v41 = [(UIViewController *)self overrideTraitCollectionForChildViewController:v40];
        }
        long long v42 = [(UIViewController *)self _overrideTraitCollectionToPassDuringTraitChangeToChildViewController:v40];
        long long v43 = v42;
        if (v41 && v42)
        {
          -[UITraitCollection _traitCollectionByApplyingOverrides:defaultValueOverrides:](v42, (uint64_t)v41, 0);
          id v44 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!v42) {
            goto LABEL_45;
          }
          id v44 = v42;
        }
        id v45 = v44;

        double v41 = v45;
LABEL_45:
        uint64_t v46 = [(id)objc_opt_class() _traitCollectionWithParentTraitCollection:v48 overrideTraitCollection:v41];
        [v40 _parent:self willTransitionToTraitCollection:v46 withTransitionCoordinator:v6];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v37);
  }

  double v47 = [(UIViewController *)self _presentationController];
  [v47 _parent:self willTransitionToTraitCollection:v48 withTransitionCoordinator:v6];
}

void __78__UIViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
    [v4 _setNeedsUserInterfaceAppearanceUpdate];
    [v4 setNeedsWhitePointAdaptivityStyleUpdate];
  }
  if (*(unsigned char *)(a1 + 56))
  {
    int v5 = *(unsigned __int8 *)(a1 + 57);
    if (v5 != [*(id *)(a1 + 40) isStatusBarHidden])
    {
      id v6 = [*(id *)(a1 + 32) _existingView];
      uint64_t v7 = [v6 window];

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v8 = objc_msgSend(*(id *)(a1 + 48), "_visibleWindows", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(unsigned char **)(*((void *)&v21 + 1) + 8 * i);
            if (v13 != v7)
            {
              if ([*(id *)(*((void *)&v21 + 1) + 8 * i) _canAffectStatusBarAppearance])
              {
                if ((v13[579] & 0x40) != 0 && ([v13 _isHostedInAnotherProcess] & 1) == 0)
                {
                  char v14 = [v13 rootViewController];
                  char v15 = [v14 _existingView];

                  if (v15)
                  {
                    id v16 = [v13 rootViewController];
                    id v17 = [v16 _existingView];
                    [v17 _setViewDelegateContentOverlayInsetsAreClean:0];

                    long long v18 = [v13 rootViewController];
                    long long v19 = [v18 presentedViewController];
                    long long v20 = [v19 _existingView];
                    [v20 _setViewDelegateContentOverlayInsetsAreClean:0];
                  }
                }
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v10);
      }
    }
  }
}

- (id)_traitTrace:(id)a3
{
  return _UITraitTraceForTraitEnvironmentAndQueryString(self, a3);
}

- (id)_traitTrace
{
  return [(UIViewController *)self _traitTrace:0];
}

+ (id)_traitCollectionWithParentTraitCollection:(id)a3 overrideTraitCollection:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && a4)
  {
    -[UITraitCollection _traitCollectionByApplyingOverrides:defaultValueOverrides:](v5, (uint64_t)a4, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v5;
  }
  id v8 = v7;

  return v8;
}

uint64_t __105__UIViewController__invalidateStatusBarAppearanceIfNeededForChangeFromTraitCollection_toTraitCollection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

- (void)_invalidateViewConstraints
{
}

- (void)_invalidateViewLayout
{
}

- (void)unregisterForTraitChanges:(id)a3
{
}

- (void)_registerAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3
{
  id v4 = a3;
  traitChangeRegistrCGFloat y = self->_traitChangeRegistry;
  id v8 = v4;
  if (!traitChangeRegistry)
  {
    id v6 = objc_alloc_init(_UITraitChangeRegistry);
    id v7 = self->_traitChangeRegistry;
    self->_traitChangeRegistrCGFloat y = v6;

    id v4 = v8;
    traitChangeRegistrCGFloat y = self->_traitChangeRegistry;
  }
  -[_UITraitChangeRegistry registerAuxiliaryChildEnvironmentForTraitInvalidations:]((uint64_t)traitChangeRegistry, v4);
}

- (void)_unregisterAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3
{
}

- (void)setOverrideTraitCollection:(id)a3
{
  id v4 = a3;
  traitOverrides = self->_traitOverrides;
  id v8 = v4;
  if (v4)
  {
    if (!traitOverrides)
    {
      id v6 = (_UITraitOverrides *)-[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], self);
      id v7 = self->_traitOverrides;
      self->_traitOverrides = v6;

      traitOverrides = self->_traitOverrides;
    }
  }
  else if (!traitOverrides)
  {
    goto LABEL_6;
  }
  -[_UITraitOverrides _replaceOverrideTraitCollection:]((uint64_t)traitOverrides, v8);
  id v4 = v8;
LABEL_6:
}

- (UITraitCollection)overrideTraitCollection
{
  return (UITraitCollection *)-[UIBarButtonItemGroup _items]((id *)&self->_traitOverrides->super.isa);
}

uint64_t __50__UIViewController_setOverrideUserInterfaceStyle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOverrideUserInterfaceStyle:*(void *)(a1 + 40)];
}

- (void)_setOverrideHorizontalSizeClass:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIViewController.m", 4389, @"Attempt to set invalid UIUserInterfaceSizeClass value to overrideHorizontalSizeClass: %ld", a3);
  }
  int64_t v5 = [(UIViewController *)self _overrideHorizontalSizeClass];
  *((_WORD *)&self->_viewControllerFlags + 4) = *((_WORD *)&self->_viewControllerFlags + 4) & 0xFFFC | a3 & 3;
  if ([(UIViewController *)self _overrideHorizontalSizeClass] != v5)
  {
    [(UIViewController *)self _updateTraitsIfNecessary];
  }
}

- (UIViewController)childViewControllerForUserInterfaceStyle
{
  return 0;
}

- (id)_effectiveUserInterfaceStyleViewController
{
  id v3 = [(UIViewController *)self _presentedUserInterfaceStyleViewController];
  id v4 = [v3 _effectiveUserInterfaceStyleViewController];

  if (!v4)
  {
    id v4 = [0 _effectiveUserInterfaceStyleViewController];
    if (!v4) {
      id v4 = self;
    }
  }
  return v4;
}

- (double)_statusBarHeightAdjustmentForCurrentOrientation
{
  uint64_t v2 = [(UIViewController *)self _existingView];
  id v3 = [v2 window];

  double v4 = 0.0;
  if (v3)
  {
    int64_t v5 = +[UIDevice currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    uint64_t v7 = [v3 _windowInterfaceOrientation];
    if (!v7) {
      uint64_t v7 = [(id)UIApp _sceneInterfaceOrientationFromWindow:v3];
    }
    if ((unint64_t)(v7 - 1) <= 3)
    {
      id v8 = __UIStatusBarManagerForWindow(v3);
      int v9 = [v8 isStatusBarHidden];

      if (!v9
        || !v6
        && !+[UIDevice _hasHomeButton]
        && !+[UIApplication _isClassic])
      {
        +[UIStatusBar _viewControllerAdjustmentForOrientation:v7 inWindow:v3];
        double v4 = v10;
      }
    }
  }

  return v4;
}

- (void)forceUnloadView
{
}

- (void)unloadViewIfReloadable
{
}

- (void)unloadViewForced:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIViewController *)self isViewLoaded]
    && ([(UIViewController *)self _canReloadView] || v3))
  {
    [(UIViewController *)self viewWillUnload];
    [(UIViewController *)self setView:0];
    modalPreservedFirstResponder = self->_modalPreservedFirstResponder;
    self->_modalPreservedFirstResponder = 0;

    if ((*(void *)&self->_viewControllerFlags & 0x2000) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_searchDisplayController);
      uint64_t v7 = [WeakRetained hidNavigationBar];

      [(UIViewController *)self setSearchBarHidNavBar:v7];
      [(UIViewController *)self setSearchDisplayController:0];
    }
    [(UIViewController *)self viewDidUnload];
    if ([(UIViewController *)self isViewLoaded])
    {
      uint64_t v8 = objc_opt_class();
      NSLog(&cfstr_Implementation_0.isa, v8);
    }
  }
}

void __38__UIViewController_loadViewIfRequired__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_4___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Attempting to load the view of a view controller while it is deallocating is not allowed and may result in undefined behavior (%@)", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)_isTVSearchControllerContainer
{
  return 0;
}

- (void)_recordContentScrollView
{
  [(UIViewController *)self _clearRecordedContentScrollView];
  uint64_t v3 = [(UIViewController *)self _contentOrObservableScrollViewForEdge:1];
  if (v3)
  {
    obuint64_t j = v3;
    id v4 = [(UIViewController *)self view];

    uint64_t v3 = obj;
    if (obj != v4)
    {
      objc_storeStrong((id *)&self->_recordedContentScrollView, obj);
      uint64_t v3 = obj;
    }
  }
}

- (void)_clearRecordedContentScrollView
{
  recordedContentScrollView = self->_recordedContentScrollView;
  self->_recordedContentScrollView = 0;
}

- (BOOL)_isSearchController
{
  return 0;
}

- (void)_setExistingNavigationItem:(id)a3
{
  uint64_t v5 = (UINavigationItem *)a3;
  if (self->_navigationItem != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_navigationItem, a3);
    uint64_t v5 = v6;
  }
}

- (void)_setExistingTabBarItem:(id)a3
{
  uint64_t v5 = (UITabBarItem *)a3;
  if (self->_tabBarItem != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_tabBarItem, a3);
    uint64_t v5 = v6;
  }
}

- (void)window:(id)a3 willAnimateFromContentFrame:(CGRect)a4 toContentFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGFloat v9 = a4.size.height;
  CGFloat v10 = a4.size.width;
  CGFloat v11 = a4.origin.y;
  CGFloat v12 = a4.origin.x;
  id v15 = [(UIViewController *)self _visibleView];
  [v15 frame];
  v18.origin.double x = v12;
  v18.origin.double y = v11;
  v18.size.double width = v10;
  v18.size.double height = v9;
  if (CGRectEqualToRect(v17, v18)) {
    objc_msgSend(v15, "setFrame:", x, y, width, height);
  }
  char v14 = -[UIViewController viewControllerForRotation](self);
  [v14 _updateLayoutForStatusBarAndInterfaceOrientation];
}

- (void)_sceneSettingsSafeAreaInsetsDidChangeForWindow:(id)a3
{
  uint64_t v3 = [(UIViewController *)self _viewControllerForRotation];
  uint64_t v4 = [v3 _existingView];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    do
    {
      -[UIViewController _recursiveUpdateContentOverlayInsetsFromParentIfNecessary](v3);
      uint64_t v8 = _nextWindowSizedViewController(v3);

      uint64_t v6 = [v8 _existingView];

      uint64_t v7 = v8;
      uint64_t v5 = (void *)v6;
      uint64_t v3 = v8;
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = v3;
  }
}

- (void)_recursiveUpdateContentOverlayInsetsFromParentIfNecessary
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 _updateContentOverlayInsetsFromParentIfNecessary];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    uint64_t v2 = objc_msgSend(a1, "mutableChildViewControllers", 0);
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
          -[UIViewController _recursiveUpdateContentOverlayInsetsFromParentIfNecessary](*(void *)(*((void *)&v7 + 1)
                                                                                                  + 8 * v6++));
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

- (void)_setFreezeLayoutForOrientationChangeOnDismissal:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIViewController *)self _allowsFreezeLayoutForOrientationChangeOnDismissal])
  {
    uint64_t v5 = 0x4000000000000;
    if (!v3) {
      uint64_t v5 = 0;
    }
    *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFBFFFFFFFFFFFFLL | v5;
  }
}

- (void)setAutoresizesArchivedViewToFullSize:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = identifier;
  id v7 = sender;
  long long v20 = v6;
  if (!self)
  {

    goto LABEL_17;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v8 = [(UIViewController *)self storyboardSegueTemplates];
  id v9 = (id)[v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = [v12 identifier];
        int v14 = [v13 isEqualToString:v20];

        if (v14)
        {
          id v9 = v12;
          goto LABEL_12;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if (!v9)
  {
LABEL_17:
    id v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    CGRect v18 = [NSString stringWithFormat:@"Receiver (%@) has no segue with identifier '%@'", self, v20];
    id v19 = [v16 exceptionWithName:v17 reason:v18 userInfo:0];

    objc_exception_throw(v19);
  }
  id v15 = (id)[v9 _perform:v7];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
  return 1;
}

+ (BOOL)_shouldUseLegacyUnwindDestinationSearch
{
  if (qword_1EB25BB90 != -1) {
    dispatch_once(&qword_1EB25BB90, &__block_literal_global_549);
  }
  if (!dyld_program_sdk_at_least()) {
    return 1;
  }
  if ((id)qword_1EB25BB80 == a1 || qword_1EB25BB88 == (void)a1) {
    return 0;
  }
  uint64_t v5 = (void *)[a1 superclass];
  if ([a1 doesOverrideViewControllerMethod:qword_1EB25BB70 inBaseClass:v5]
    && ![a1 doesOverrideViewControllerMethod:qword_1EB25BB78 inBaseClass:v5])
  {
    return 1;
  }
  return [v5 _shouldUseLegacyUnwindDestinationSearch];
}

uint64_t __59__UIViewController__shouldUseLegacyUnwindDestinationSearch__block_invoke()
{
  qword_1EB25BB70 = (uint64_t)sel_viewControllerForUnwindSegueAction_fromViewController_withSender_;
  qword_1EB25BB78 = (uint64_t)sel_allowedChildViewControllersForUnwindingFromSource_;
  qword_1EB25BB80 = objc_opt_class();
  uint64_t result = objc_opt_class();
  qword_1EB25BB88 = result;
  return result;
}

- (id)_destinationForUnwindingFromSource:(id)a3 visitedViewControllers:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(id)objc_opt_class() _shouldUseLegacyUnwindDestinationSearch])
  {
    uint64_t v8 = [v6 unwindAction];
    id v9 = [v6 sourceViewController];
    uint64_t v10 = [v6 sender];
    CGFloat v11 = [(UIViewController *)self viewControllerForUnwindSegueAction:v8 fromViewController:v9 withSender:v10];
  }
  else
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    int v13 = [v7 containsObject:self];
    if (has_internal_diagnostics)
    {
      if (v13)
      {
        uint64_t v26 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v34 = self;
          _os_log_fault_impl(&dword_1853B0000, v26, OS_LOG_TYPE_FAULT, "Should not have recursed into %@ since it was already visited", buf, 0xCu);
        }
      }
    }
    else if (v13)
    {
      uint64_t v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_destinationForUnwindingFromSource_visitedViewControllers____s_category)+ 8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = self;
        _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "Should not have recursed into %@ since it was already visited", buf, 0xCu);
      }
    }
    [v7 addObject:self];
    int v14 = [(UIViewController *)self childModalViewController];
    if (!v14
      || ([v7 containsObject:v14] & 1) != 0
      || ([v14 _destinationForUnwindingFromSource:v6 visitedViewControllers:v7],
          (CGFloat v11 = (UIViewController *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v15 = -[UIViewController allowedChildViewControllersForUnwindingFromSource:](self, "allowedChildViewControllersForUnwindingFromSource:", v6, 0);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v15);
            }
            long long v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if (([v7 containsObject:v20] & 1) == 0)
            {
              uint64_t v21 = [v20 _destinationForUnwindingFromSource:v6 visitedViewControllers:v7];
              if (v21)
              {
                CGFloat v11 = (UIViewController *)v21;
                goto LABEL_22;
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      uint64_t v22 = [v6 unwindAction];
      id v15 = [v6 sourceViewController];
      long long v23 = [v6 sender];
      if ([(UIViewController *)self _canPerformUnwindSegueAction:v22 fromViewController:v15 sender:v23])
      {
        long long v24 = self;
      }
      else
      {
        long long v24 = 0;
      }
      CGFloat v11 = v24;

LABEL_22:
    }
  }
  return v11;
}

- (NSArray)allowedChildViewControllersForUnwindingFromSource:(UIStoryboardUnwindSegueSource *)source
{
  uint64_t v4 = source;
  uint64_t v5 = objc_opt_new();
  id v6 = [(UIViewController *)self childViewControllerContainingSegueSource:v4];

  childViewControllers = self->_childViewControllers;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__UIViewController_allowedChildViewControllersForUnwindingFromSource___block_invoke;
  v13[3] = &unk_1E52E8DB8;
  id v14 = v6;
  id v8 = v5;
  id v15 = v8;
  id v9 = v6;
  [(NSMutableArray *)childViewControllers enumerateObjectsUsingBlock:v13];
  uint64_t v10 = v15;
  CGFloat v11 = (NSArray *)v8;

  return v11;
}

uint64_t __70__UIViewController_allowedChildViewControllersForUnwindingFromSource___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32) != a2) {
    return [*(id *)(result + 40) addObject:a2];
  }
  return result;
}

- (UIViewController)childViewControllerContainingSegueSource:(UIStoryboardUnwindSegueSource *)source
{
  return (UIViewController *)[(UIStoryboardUnwindSegueSource *)source _childContainingUnwindSourceForViewController:self];
}

- (UIViewController)viewControllerForUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = fromViewController;
  id v9 = sender;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [(UIViewController *)self childViewControllers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
      if ([v15 _canPerformUnwindSegueAction:action fromViewController:v8 sender:v9]) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v16 = v15;

    if (v16) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_9:
  }
  if ([(UIViewController *)self _canPerformUnwindSegueAction:action fromViewController:v8 sender:v9])
  {
    uint64_t v16 = self;
  }
  else
  {
    uint64_t v16 = 0;
  }
LABEL_14:

  return v16;
}

- (BOOL)_canPerformUnwindSegueAction:(SEL)a3 fromViewController:(id)a4 sender:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  if ([(id)objc_opt_class() doesOverrideViewControllerMethod:sel_canPerformUnwindSegueAction_fromViewController_sender_])BOOL v10 = -[UIViewController canPerformUnwindSegueAction:fromViewController:sender:](self, "canPerformUnwindSegueAction:fromViewController:sender:", a3, v9, v8); {
  else
  }
    BOOL v10 = [(UIViewController *)self canPerformUnwindSegueAction:a3 fromViewController:v9 withSender:v8];
  BOOL v11 = v10;

  return v11;
}

- (BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController sender:(id)sender
{
  if (fromViewController == self) {
    char v5 = 0;
  }
  else {
    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

- (UIStoryboardSegue)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier
{
  id v8 = identifier;
  id v9 = fromViewController;
  BOOL v10 = toViewController;
  BOOL v11 = _UIFirstPopoverSeguePresentedControllerInUnwindingResponderChain(v9, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__UIViewController_segueForUnwindingToViewController_fromViewController_identifier___block_invoke;
  v15[3] = &unk_1E52D9F98;
  id v16 = v11;
  uint64_t v17 = self;
  id v12 = v11;
  uint64_t v13 = +[UIStoryboardSegue segueWithIdentifier:v8 source:v9 destination:v10 performHandler:v15];

  return (UIStoryboardSegue *)v13;
}

void __84__UIViewController_segueForUnwindingToViewController_fromViewController_identifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [v2 _popoverController];
    [v3 dismissPopoverAnimated:1];
  }
  uint64_t v4 = [*(id *)(a1 + 40) presentedViewController];

  if (v4)
  {
    id v6 = [*(id *)(a1 + 40) presentedViewController];
    char v5 = [v6 presentingViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_enumerateAncestorViewControllersUntilStop:(BOOL *)a3 usingBlock:(id)a4
{
  id v8 = (void (**)(id, UIViewController *, BOOL *))a4;
  id v6 = [(UIViewController *)self parentViewController];
  id v7 = v6;
  if (v6) {
    [v6 _enumerateAncestorViewControllersUntilStop:a3 usingBlock:v8];
  }
  if (!*a3) {
    v8[2](v8, self, a3);
  }
}

- (void)_enumerateVisibleChildControllers:(void *)a1 includePresentedChildren:(int)a2 usingBlock:(void *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  char v5 = a3;
  if (a1)
  {
    unsigned __int8 v23 = 0;
    id v6 = [a1 _existingView];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = [a1 childViewControllers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (!v8) {
      goto LABEL_26;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v19 + 1) + 8 * v11);
        uint64_t v13 = v12;
        if (a2)
        {
          uint64_t v14 = [v12 childModalViewController];

          if (v14)
          {
            uint64_t v15 = [v13 childModalViewController];
            if (v15)
            {
              id v16 = (void *)v15;
              do
              {
                id v17 = v16;

                id v16 = [v17 childModalViewController];

                uint64_t v13 = v17;
              }
              while (v16);
            }
            else
            {
              id v17 = v13;
            }
            if ([v17 modalPresentationStyle] != 3 && objc_msgSend(v17, "modalPresentationStyle") != 15)
            {
              uint64_t v13 = 0;
              goto LABEL_22;
            }
            uint64_t v13 = v17;
          }
        }
        if (!v13) {
          goto LABEL_23;
        }
        id v17 = [v13 _existingView];
        if ([v17 isDescendantOfView:v6] && (objc_msgSend(v17, "isHidden") & 1) == 0) {
          v5[2](v5, v13, &v23);
        }
LABEL_22:

LABEL_23:
        int v18 = v23;

        if (v18) {
          goto LABEL_26;
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (!v9)
      {
LABEL_26:

        break;
      }
    }
  }
}

- (void)_addChildViewController:(id)a3 notifyWillMove:(BOOL)a4
{
}

void __60__UIViewController_removeChildViewController_notifyDidMove___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsUpdateOfSupportedInterfaceOrientations];
}

void __44__UIViewController_setParentViewController___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewController", &_UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_5___s_category)+ 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138412546;
      uint64_t v6 = v3;
      __int16 v7 = 2112;
      uint64_t v8 = v4;
      _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Deprecated -setParentViewController: SPI called on UIViewController, which is dangerous and causes undefined behavior. This setter does not properly establish the bidirectional parent-child relationship; use the -addChildVie"
        "wController: and -removeFromParentViewController APIs to manage view controller containment. Make a symbolic bre"
        "akpoint at -[UIViewController setParentViewController:] to catch this in the debugger. Child: %@; Parent: %@",
        (uint8_t *)&v5,
        0x16u);
    }
  }
}

void __44__UIViewController_setParentViewController___block_invoke_571(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * v8);
        if (*(void *)(v9 + 104) == a2)
        {
          if (!os_variant_has_internal_diagnostics())
          {
LABEL_8:
            *(void *)(v9 + 104) = 0;
            goto LABEL_9;
          }
          if (os_variant_has_internal_diagnostics())
          {
            uint64_t v11 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
            {
              uint64_t v13 = (objc_class *)objc_opt_class();
              id v16 = NSStringFromClass(v13);
              *(_DWORD *)buf = 138412802;
              long long v22 = v16;
              __int16 v23 = 2048;
              uint64_t v24 = a2;
              __int16 v25 = 2112;
              uint64_t v26 = v9;
              _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF UIKIT: Parent view controller <%@: %p> is deallocating with one or more children still referencing it, due to use of deprecated -[UIViewController setParentViewController:] SPI in client code. Please stop calling this deprecated SPI. Child with stale reference: %@", buf, 0x20u);
            }
          }
          else
          {
            uint64_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_6___s_category)+ 8);
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              goto LABEL_8;
            }
            uint64_t v11 = v10;
            id v12 = (objc_class *)objc_opt_class();
            uint64_t v15 = NSStringFromClass(v12);
            *(_DWORD *)buf = 138412802;
            long long v22 = v15;
            __int16 v23 = 2048;
            uint64_t v24 = a2;
            __int16 v25 = 2112;
            uint64_t v26 = v9;
            _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Parent view controller <%@: %p> is deallocating with one or more children still referencing it, due to use of deprecated -[UIViewController setParentViewController:] SPI in client code. Please stop calling this deprecated SPI. Child with stale reference: %@", buf, 0x20u);
          }
          goto LABEL_8;
        }
LABEL_9:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v14 = [v4 countByEnumeratingWithState:&v17 objects:v27 count:16];
      uint64_t v6 = v14;
    }
    while (v14);
  }
}

- (void)setMutableChildViewControllers:(id)a3
{
}

- (BOOL)_transitionsChildViewControllers
{
  return 1;
}

- (BOOL)_allowsUserInteractionWhenPreviewedInContextMenu
{
  return 0;
}

- (id)_viewsWithDisabledInteractionGivenTransitionContext:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v5 = self->_childViewControllers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v12 = [v11 _existingView];
        int v13 = [v12 _isInAWindow];

        if (v13)
        {
          uint64_t v14 = [v11 _viewsWithDisabledInteractionGivenTransitionContext:v4];
          id v15 = v8;
          id v16 = v14;
          long long v17 = v16;
          if (v15)
          {
            [v15 addObjectsFromArray:v16];
            long long v17 = v15;
          }
          id v8 = v17;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v18 = self->_childModalViewControllers;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        __int16 v23 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        uint64_t v24 = objc_msgSend(v23, "_existingView", (void)v31);
        int v25 = [v24 _isInAWindow];

        if (v25)
        {
          uint64_t v26 = [v23 _viewsWithDisabledInteractionGivenTransitionContext:v4];
          id v27 = v8;
          id v28 = v26;
          long long v29 = v28;
          if (v27)
          {
            [v27 addObjectsFromArray:v28];
            long long v29 = v27;
          }
          id v8 = v29;
        }
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v20);
  }

  return v8;
}

- (id)_modalPresenter:(void *)a1
{
  BOOL v5 = 0;
  if (a2 <= 14)
  {
    if (a2 != 3 && a2 != 6) {
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v2 = objc_msgSend(a1, "_popoverController", 0);
    BOOL v5 = v2 == 0;
    goto LABEL_9;
  }
  if (a2 == 18) {
    goto LABEL_8;
  }
  if (a2 == 15)
  {
    id v6 = a1;
    goto LABEL_24;
  }
LABEL_9:
  uint64_t v7 = [a1 _nonModalAncestorViewControllerStopAtIsPresentationContext:v5];
  if ((unint64_t)a2 > 0x12) {
    goto LABEL_22;
  }
  if (((1 << a2) & 0x10007) == 0)
  {
    if (((1 << a2) & 0x40048) == 0) {
      goto LABEL_22;
    }

    if (a2 != 16) {
      goto LABEL_22;
    }
  }
  id v8 = v7;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = [v8 _parentModalViewController];
    if (v10)
    {
      do
      {
        uint64_t v11 = (void *)v10;

        uint64_t v10 = [v11 _parentModalViewController];
        uint64_t v9 = v11;
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = v9;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = -[UIViewController _parentViewController]((id *)v11);
  if (!v12)
  {

LABEL_22:
    id v6 = v7;
    goto LABEL_23;
  }
  int v13 = (void *)v12;
  -[UIViewController _modalPresenter:](v12, a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
LABEL_24:
  return v6;
}

- (id)_previousRootViewController
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 16);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (BOOL)_shouldOverlayTabBar
{
  if ([(NSMutableArray *)self->_childViewControllers count] != 1) {
    return 0;
  }
  uint64_t v3 = [(NSMutableArray *)self->_childViewControllers firstObject];
  char v4 = [v3 _shouldOverlayTabBar];

  return v4;
}

- (BOOL)_forwardRotationMethods
{
  if ([(id)objc_opt_class() doesOverrideViewControllerMethod:sel_shouldAutomaticallyForwardRotationMethods])
  {
    return [(UIViewController *)self shouldAutomaticallyForwardRotationMethods];
  }
  else
  {
    return [(UIViewController *)self automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers];
  }
}

void __46__UIViewController__performAtViewIsAppearing___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
  id v7 = a2;
  v6(v5, v7, a3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_addDescendantsToArray:(uint64_t)a3 visibleOnly:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = [a1 _existingView];
    id v7 = v6;
    if (v6)
    {
      if (!a3
        || ([v6 isHidden] & 1) == 0
        && ([v7 window], id v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
      {
        [v5 addObject:a1];
      }
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v9 = objc_msgSend(a1, "mutableChildViewControllers", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            id v15 = [v14 _existingView];
            int v16 = [v15 isDescendantOfView:v7];

            if (v16) {
              -[UIViewController _addDescendantsToArray:visibleOnly:](v14, v5, a3);
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v11);
      }
    }
  }
}

+ (void)_withDisabledAppearanceTransitionsForVisibleDescendantsOf:(id)a3 perform:(id)a4
{
}

+ (void)_withDisabledAppearanceTransitions:(BOOL)a3 forDescendantsOf:(id)a4 visibleOnly:(BOOL)a5 perform:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a6;
  uint64_t v11 = v10;
  if (!v8)
  {
    id v13 = 0;
    if (!v10) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v12 addObject:v9];
  -[UIViewController _addDescendantsToArray:visibleOnly:](v9, v12, v7);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * v17++) setAppearanceTransitionsAreDisabled:1];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v15);
  }

  if (v11) {
LABEL_12:
  }
    v11[2](v11);
LABEL_13:
  if (v8)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v18 = v13;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v24;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v22++), "setAppearanceTransitionsAreDisabled:", 0, (void)v23);
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v20);
    }
  }
}

- (BOOL)needsDidMoveCleanup
{
  return (*(void *)&self->_viewControllerFlags >> 28) & 1;
}

- (void)_beginAppearanceTransitionToViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_msgSend(a3, "beginAppearanceTransition:animated:", 1);
  [(UIViewController *)self beginAppearanceTransition:0 animated:v4];
}

- (void)_endAppearanceTransitionToViewController:(id)a3
{
  id v4 = a3;
  [(UIViewController *)self endAppearanceTransition];
  [v4 endAppearanceTransition];
}

- (uint64_t)_requiredNotificationsForRemoteServices
{
  if (a1)
  {
    uint64_t v1 = [a1 parentViewController];
    -[UIViewController _requiredNotificationsForRemoteServices]();
    objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

uint64_t __64__UIViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 328) == *(void *)(result + 40)) {
    return objc_msgSend((id)UIApp, "_addAfterCACommitBlockForViewController:");
  }
  return result;
}

uint64_t __64__UIViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke_4(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 328) == *(void *)(result + 40)) {
    return objc_msgSend((id)UIApp, "_addAfterCACommitBlockForViewController:");
  }
  return result;
}

+ (void)removeViewControllerForView:(id)a3
{
  id v4 = (id *)a3;
  uint64_t v3 = -[UIView __viewDelegate](v4);

  if (v3) {
    -[UIView __setViewDelegate:](v4, 0);
  }
}

- (id)_description
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  if (self)
  {
    id v4 = NSString;
    id v5 = self;
    id v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    BOOL v8 = [v4 stringWithFormat:@"<%@: %p>", v7, v5];
  }
  else
  {
    BOOL v8 = @"(nil)";
  }
  id v9 = [v3 stringWithString:v8];

  if ([(UIViewController *)self isViewLoaded])
  {
    uint64_t v10 = [(UIViewController *)self view];
    uint64_t v11 = [(UIViewController *)self view];
    [v11 frame];
    id v12 = NSStringFromCGRect(v15);
    [v9 appendFormat:@" view:%@ frame:%@", v10, v12];
  }
  else
  {
    [v9 appendString:@" (view not loaded)"];
  }
  if ((*(void *)&self->_viewControllerFlags & 0x100) != 0) {
    [v9 appendString:@" ***Root***"];
  }
  [v9 appendString:@"\n"];
  return v9;
}

- (void)_traverseViewControllerHierarchyFromLevel:(int64_t)a3 withBlock:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *, uint64_t, int64_t))a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  BOOL v7 = self->_childViewControllers;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v6[2](v6, v12, 1, a3 + 1);
        [v12 _traverseViewControllerHierarchyFromLevel:a3 + 1 withBlock:v6];
        v6[2](v6, v12, 0, a3 + 1);
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = self->_childModalViewControllers;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    int64_t v17 = a3 + 1;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void **)(*((void *)&v20 + 1) + 8 * j);
        v6[2](v6, v19, 1, v17);
        objc_msgSend(v19, "_traverseViewControllerHierarchyFromLevel:withBlock:", v17, v6, (void)v20);
        v6[2](v6, v19, 0, v17);
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }
}

+ (void)_traverseViewControllerHierarchyWithDelayedRelease:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [(id)qword_1EB25BB38 setRepresentation];
  id v5 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (!v11 || !v11[13] && !v11[15])
        {
          if (([*(id *)(*((void *)&v22 + 1) + 8 * i) _isRootViewController] & 1) != 0
            || [v11 isViewLoaded])
          {
            (*((void (**)(id, void *, uint64_t, void))v3 + 2))(v3, v11, 1, 0);
            [v11 _traverseViewControllerHierarchyFromLevel:0 withBlock:v3];
            (*((void (**)(id, void *, void, void))v3 + 2))(v3, v11, 0, 0);
          }
          else
          {
            [v5 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        int64_t v17 = *(void **)(*((void *)&v18 + 1) + 8 * j);
        (*((void (**)(id, void *, uint64_t, void))v3 + 2))(v3, v17, 1, 0);
        objc_msgSend(v17, "_traverseViewControllerHierarchyFromLevel:withBlock:", 0, v3, (void)v18);
        (*((void (**)(id, void *, void, void))v3 + 2))(v3, v17, 0, 0);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
}

- (id)_descriptionWithChildren:(int)a3
{
  id v5 = [MEMORY[0x1E4F28E78] string];
  if (a3 >= 1)
  {
    int v6 = a3;
    do
    {
      [v5 appendString:@"    "];
      --v6;
    }
    while (v6);
  }
  uint64_t v7 = [(UIViewController *)self _description];
  [v5 appendFormat:@"%@", v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __45__UIViewController__descriptionWithChildren___block_invoke;
  v10[3] = &unk_1E52E9FF0;
  id v8 = v5;
  id v11 = v8;
  [(UIViewController *)self _traverseViewControllerHierarchyFromLevel:a3 + 1 withBlock:v10];

  return v8;
}

void __45__UIViewController__descriptionWithChildren___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a2;
  if (a3)
  {
    id v15 = v7;
    if (a4 < 1)
    {
      id v8 = 0;
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28E78] string];
      do
      {
        [v8 appendString:@"    "];
        --a4;
      }
      while (a4);
      [*(id *)(a1 + 32) appendString:v8];
      id v7 = v15;
    }
    uint64_t v9 = [v7 presentingViewController];
    if (v9)
    {
      uint64_t v10 = [v15 parentViewController];

      if (!v10)
      {
        id v11 = *(void **)(a1 + 32);
        id v12 = [v9 description];
        [v11 appendFormat:@"Modally presented (presenter =%@) :\n", v12];

        if (v8) {
          [*(id *)(a1 + 32) appendString:v8];
        }
      }
    }
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = [v15 _description];
    [v13 appendString:v14];

    id v7 = v15;
  }
}

+ (id)_allDescriptions
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __36__UIViewController__allDescriptions__block_invoke;
  v6[3] = &unk_1E52E9FF0;
  id v4 = v3;
  id v7 = v4;
  [a1 _traverseViewControllerHierarchy:v6];

  return v4;
}

void __36__UIViewController__allDescriptions__block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a2;
  if (a3)
  {
    id v15 = v7;
    if (a4 < 1)
    {
      id v8 = 0;
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28E78] string];
      do
      {
        [v8 appendString:@"    "];
        --a4;
      }
      while (a4);
      [*(id *)(a1 + 32) appendString:v8];
      id v7 = v15;
    }
    uint64_t v9 = [v7 presentingViewController];
    if (v9)
    {
      uint64_t v10 = [v15 parentViewController];

      if (!v10)
      {
        id v11 = *(void **)(a1 + 32);
        id v12 = [v9 description];
        [v11 appendFormat:@"Modally presented (presenter =%@) :\n", v12];

        if (v8) {
          [*(id *)(a1 + 32) appendString:v8];
        }
      }
    }
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = [v15 _description];
    [v13 appendString:v14];

    id v7 = v15;
  }
}

+ (id)_printHierarchy
{
  uint64_t v2 = +[UIWindow _applicationKeyWindow];
  id v3 = [v2 rootViewController];
  id v4 = [v3 _printHierarchy];

  return v4;
}

+ (id)_safeAreaInsetsTrace
{
  uint64_t v2 = +[UIWindow _applicationKeyWindow];
  id v3 = [v2 rootViewController];
  id v4 = [v3 _safeAreaInsetsTrace];

  return v4;
}

- (id)_printHierarchy
{
  return recursiveDescription(self, 0);
}

- (id)_safeAreaInsetsTrace
{
  return recursiveDescription(self, 1);
}

uint64_t __63__UIViewController__loadHierarchyInputAccessoryViewIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = -[UIView __viewDelegate](v4);
  int v6 = (void *)v5;
  if (!v5 || v5 == *(void *)(a1 + 32))
  {
    if (![v4 _ownsInputAccessoryView])
    {
      uint64_t v7 = 1;
      goto LABEL_7;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)_canReloadView
{
  if ((*(void *)&self->_viewControllerFlags & 0x80) != 0) {
    return 0;
  }
  if ([(id)objc_opt_class() doesOverrideViewControllerMethod:sel_loadView]) {
    return 1;
  }
  id v4 = [(UIViewController *)self nibName];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)applicationWantsViewsToDisappear
{
  if (self)
  {
    if ([(UIViewController *)self isViewLoaded])
    {
      BOOL v3 = [(UIViewController *)self view];
      id v4 = [v3 window];
      BOOL v5 = v4 != 0;
    }
    else
    {
      BOOL v5 = 0;
    }
    if (self->_parentViewController)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_popoverController);
      int v7 = [WeakRetained isPopoverVisible];
    }
    else
    {
      int v7 = 1;
    }
    if ((v5 & v7) == 1)
    {
      -[UIViewController __viewWillDisappear:]((uint64_t)self, 0);
      -[UIViewController __viewDidDisappear:]((uint64_t)self, 0);
    }
  }
}

+ (BOOL)_isViewSizeFullScreen:(id)a3 inWindow:(id)a4 ignoreInWindowCheck:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  [v7 bounds];
  double v12 = v11;
  double v14 = v13;
  if (v8)
  {
    double v15 = v9;
    double v16 = v10;
    int64_t v17 = [v7 window];

    if (v17)
    {
      objc_msgSend(v7, "convertRect:toView:", v8, v15, v16, v12, v14);
      objc_msgSend(v8, "convertRect:toWindow:", 0);
      double v12 = v18;
      double v14 = v19;
    }
  }
  long long v20 = [v8 windowScene];
  long long v21 = [v20 coordinateSpace];
  long long v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    long long v24 = +[UIScreen mainScreen];
    id v23 = [v24 coordinateSpace];
  }
  [v23 bounds];
  double v26 = v25;
  double v28 = v27;
  BOOL v29 = v14 == v27 && v12 == v25;
  if (v29 || a5)
  {
    if (v29)
    {
      BOOL v31 = 1;
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v30 = [v7 window];

    if (v30)
    {
      BOOL v31 = 0;
      goto LABEL_19;
    }
  }
  BOOL v31 = v12 == v28 && v14 == v26;
LABEL_19:

  return v31;
}

- (BOOL)_shouldForceLayoutForHostedAnimation
{
  return 1;
}

- (BOOL)__knownPresentationWithoutPresentationControllerInstance
{
  parentModalViewController = self->_parentModalViewController;
  if (parentModalViewController) {
    LOBYTE(parentModalViewController) = [(UIViewController *)parentModalViewController __knownPresentationWithoutPresentationControllerInstance];
  }
  return (char)parentModalViewController;
}

- (BOOL)_viewControllerUnderlapsStatusBar
{
  if ([(UIViewController *)self __knownPresentationWithoutPresentationControllerInstance])
  {
    goto LABEL_12;
  }
  BOOL v3 = [(UIViewController *)self presentingViewController];
  if (v3)
  {
    id v4 = [(UIViewController *)self presentingViewController];
    uint64_t v5 = [v4 _presentationController];
  }
  else
  {
    uint64_t v6 = [(UIViewController *)self _parentModalViewController];
    if (!v6)
    {
      long long v66 = [(UIViewController *)self _temporaryPresentationController];
      if (v66)
      {
        id v7 = [(UIViewController *)self presentationController];
      }
      else
      {
        id v7 = 0;
      }

      id v4 = 0;
      goto LABEL_7;
    }
    id v4 = (void *)v6;
    uint64_t v5 = [(UIViewController *)self presentationController];
  }
  id v7 = (void *)v5;
LABEL_7:

  id WeakRetained = objc_loadWeakRetained((id *)&self->_popoverController);
  double v9 = WeakRetained;
  if (WeakRetained && [WeakRetained _popoverControllerStyle] != 1
    || v7 && ![v7 _presentationPotentiallyUnderlapsStatusBar])
  {

    LOBYTE(v43) = 0;
    return v43;
  }

LABEL_12:
  unint64_t viewControllerFlags = (unint64_t)self->_viewControllerFlags;
  if ((viewControllerFlags & 0x10000000000) == 0)
  {
    double v11 = [(UIViewController *)self _existingView];
    double v12 = [v11 window];
    double v13 = v12;
    if (!v12)
    {
      LOBYTE(v43) = 0;
LABEL_61:

      return v43;
    }
    _UIAppStatusBarHeightForWindow(v12);
    uint64_t v14 = 0;
    if (v15 == 0.0)
    {
      double v16 = __UIStatusBarManagerForWindow(v13);
      char v17 = [v16 isStatusBarHidden];

      if ((v17 & 1) == 0)
      {
        _UIAppStatusBarDefaultHeight();
        uint64_t v14 = v18;
      }
    }
    uint64_t v19 = [v13 _windowInterfaceOrientation];
    if (!v19) {
      uint64_t v19 = [(id)UIApp _sceneInterfaceOrientationFromWindow:v13];
    }
    uint64_t v74 = 0;
    CGRect v75 = &v74;
    uint64_t v76 = 0x2020000000;
    char v77 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__UIViewController__viewControllerUnderlapsStatusBar__block_invoke;
    aBlock[3] = &unk_1E52EA040;
    aBlock[6] = v14;
    void aBlock[4] = &v74;
    void aBlock[5] = v19;
    long long v20 = (uint64_t (**)(void *, void *, double, double, double, double, double, double))_Block_copy(aBlock);
    if (!v11)
    {
      int v28 = 0;
LABEL_54:
      __int16 v67 = *((_WORD *)&self->_viewControllerFlags + 4);
      unint64_t v69 = (unint64_t)self->_viewControllerFlags;
      if (*((unsigned char *)v75 + 24)) {
        LODWORD(v43) = (v69 >> 39) & 1;
      }
      else {
        LODWORD(v43) = v28;
      }
      uint64_t v70 = 0x8000000000;
      if (!v43) {
        uint64_t v70 = 0;
      }
      unint64_t v68 = v70 | v69 & 0xFFFFFF7FFFFFFFFFLL;
      goto LABEL_60;
    }
    long long v21 = [v13 _windowHostingScene];
    char v22 = [v21 _sceneSessionRoleIsCarPlayOrNonInteractiveExternal];

    if (v22)
    {
      id v23 = self;
      long long v24 = 0;
      do
      {
        double v25 = [(UIViewController *)v23 _expectedWindow];
        double v26 = [(UIViewController *)v23 _existingView];

        double v27 = [(UIViewController *)v23 parentViewController];

        if (!v27) {
          break;
        }
        id v23 = v27;
        long long v24 = v26;
      }
      while (!v25);

      int v28 = 0;
      if (!v25 || !v26) {
        goto LABEL_53;
      }
      [v26 transform];
      if (CGAffineTransformIsIdentity(&v72))
      {
        [v11 bounds];
        objc_msgSend(v26, "convertRect:fromView:", v11);
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        [v26 frame];
        double v38 = v37;
        double v40 = v39;
        [v11 bounds];
        int v28 = v20[2](v20, v25, v30 + v38, v32 + v40, v34, v36, v41, v42);
LABEL_53:

        goto LABEL_54;
      }
    }
    else
    {
      if ([v13 _isHostedInAnotherProcess])
      {
        id v44 = [(UIViewController *)self _window];
        char v45 = objc_msgSend(v44, "__hostViewUnderlapsStatusBar");

        if ((v45 & 1) == 0)
        {
          LOBYTE(v43) = 0;
          __int16 v67 = *((_WORD *)&self->_viewControllerFlags + 4);
          unint64_t v68 = *(void *)&self->_viewControllerFlags & 0xFFFFFF7FFFFFFFFFLL;
LABEL_60:
          *(void *)&self->_unint64_t viewControllerFlags = v68;
          *((_WORD *)&self->_viewControllerFlags + 4) = v67;

          _Block_object_dispose(&v74, 8);
          goto LABEL_61;
        }
      }
      [v11 bounds];
      objc_msgSend(v11, "convertRect:toView:", 0);
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      double v53 = v52;
      [v11 bounds];
      int v28 = v20[2](v20, v13, v47, v49, v51, v53, v54, v55);
      double v25 = [(UIViewController *)self _viewControllerForRotation];
      uint64_t v56 = [v25 _existingView];
      double v26 = (void *)v56;
      if (v56) {
        char v57 = v28;
      }
      else {
        char v57 = 1;
      }
      if ((v57 & 1) != 0 || (void *)v56 == v11) {
        goto LABEL_53;
      }
      if (![v11 isDescendantOfView:v56])
      {
        int v28 = 0;
        goto LABEL_53;
      }
      [v11 bounds];
      objc_msgSend(v11, "convertRect:toView:", v26);
      double v59 = v58;
      double v61 = v60;
      double v63 = v62;
      [v11 bounds];
      if (vabdd_f64(v64, v61) < 0.01 && vabdd_f64(v65, v63) < 0.01
        || vabdd_f64(v64, v63) < 0.01 && vabdd_f64(v65, v61) < 0.01)
      {
        int v28 = v59 < 0.0 || fabs(v59) < 0.01;
        goto LABEL_53;
      }
    }
    int v28 = 0;
    *((unsigned char *)v75 + 24) = 1;
    goto LABEL_53;
  }
  return (viewControllerFlags >> 39) & 1;
}

BOOL __53__UIViewController__viewControllerUnderlapsStatusBar__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  id v15 = a2;
  if ((vabdd_f64(a7, a5) >= 0.01 || vabdd_f64(a8, a6) >= 0.01)
    && (vabdd_f64(a7, a6) >= 0.01 || vabdd_f64(a8, a5) >= 0.01))
  {
    BOOL v26 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else if ([(id)objc_opt_class() _transformLayerRotationsAreEnabled])
  {
    double v16 = [v15 layer];
    char v17 = [v16 superlayer];
    [v16 bounds];
    double v19 = v18;
    unint64_t v20 = *(void *)(a1 + 40) - 3;
    [v17 bounds];
    if (v20 >= 2) {
      double v23 = v22;
    }
    else {
      double v23 = v21;
    }
    _UIAppStatusBarDefaultHeight();
    double v25 = v24;
    if (![v15 _isHostedInAnotherProcess]
      || !v17
      || v19 == v23
      || vabdd_f64(v23, v19) == 0.0 - v25)
    {
      double v31 = *(double *)(a1 + 48);
      BOOL v26 = a4 < v31 || vabdd_f64(a4, v31) < 0.01;
    }
    else
    {
      BOOL v26 = 0;
    }
  }
  else
  {
    [v15 bounds];
    switch(*(void *)(a1 + 40))
    {
      case 1:
        double v29 = *(double *)(a1 + 48);
        if (a4 < v29) {
          goto LABEL_28;
        }
        double v30 = vabdd_f64(a4, v29);
        goto LABEL_31;
      case 2:
        double v32 = *(double *)(a1 + 48);
        if (a4 + a6 > v28 - v32) {
          goto LABEL_28;
        }
        double v33 = a4 + a6 - v28;
        goto LABEL_26;
      case 3:
        double v32 = *(double *)(a1 + 48);
        if (a3 + a5 > v27 - v32) {
          goto LABEL_28;
        }
        double v33 = a3 + a5 - v27;
LABEL_26:
        double v30 = vabdd_f64(v33, v32);
        goto LABEL_31;
      case 4:
        double v34 = *(double *)(a1 + 48);
        if (a3 >= v34)
        {
          double v30 = vabdd_f64(a3, v34);
LABEL_31:
          BOOL v26 = v30 < 0.01;
        }
        else
        {
LABEL_28:
          BOOL v26 = 1;
        }
        break;
      default:
        BOOL v26 = 0;
        break;
    }
  }

  return v26;
}

- (BOOL)_shouldFreezeUnderlapsStatusBar
{
  return (*(void *)&self->_viewControllerFlags & 0x20000000000) == 0;
}

- (void)_setShouldFreezeUnderlapsStatusBar:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_unint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFDFFFFFFFFFFLL | v3;
}

+ (BOOL)_isViewSizeFullScreen:(id)a3 inWindow:(id)a4
{
  return [a1 _isViewSizeFullScreen:a3 inWindow:a4 ignoreInWindowCheck:1];
}

- (BOOL)_shouldChildViewControllerUseFullScreenLayout:(id)a3
{
  int v4 = [a3 wantsFullScreenLayout];
  LOBYTE(v5) = 0;
  if (self && v4)
  {
    uint64_t v6 = self->_parentViewController;
    id v7 = [(UIViewController *)self _existingView];
    id v8 = [v7 window];

    if ([v8 isRotating])
    {
      BOOL v5 = (*(void *)&self->_viewControllerFlags >> 11) & 1;
    }
    else
    {
      LODWORD(v5) = [(UIViewController *)self _shouldUseFullScreenLayoutInWindow:v8 parentViewController:v6];
      uint64_t v9 = 2048;
      if (!v5) {
        uint64_t v9 = 0;
      }
      *(void *)&self->_unint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFFFFFF7FFLL | v9;
    }
  }
  return v5;
}

- (BOOL)_shouldUseFullScreenLayoutInWindow:(id)a3 parentViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(UIViewController *)self wantsFullScreenLayout]
    || v6
    && ([v6 _windowHostingScene],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 _sceneSessionRoleIsCarPlayOrNonInteractiveExternal],
        v8,
        (v9 & 1) != 0))
  {
    char v10 = 0;
  }
  else if (v7)
  {
    char v10 = [v7 _shouldChildViewControllerUseFullScreenLayout:self];
  }
  else
  {
    double v11 = [(UIViewController *)self _existingView];
    if (v11) {
      char v10 = [(id)objc_opt_class() _isViewSizeFullScreen:v11 inWindow:v6];
    }
    else {
      char v10 = 1;
    }
  }
  return v10;
}

- (BOOL)_reallyWantsFullScreenLayout
{
  return (*(void *)&self->_viewControllerFlags >> 10) & 1;
}

- (void)setWantsFullScreenLayout:(BOOL)wantsFullScreenLayout
{
  uint64_t viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  if (((((viewControllerFlags & 0x400) == 0) ^ wantsFullScreenLayout) & 1) == 0)
  {
    uint64_t v5 = 1024;
    if (!wantsFullScreenLayout) {
      uint64_t v5 = 0;
    }
    *((_WORD *)&self->_viewControllerFlags + 4) = *((_WORD *)&self->_viewControllerFlags + 4);
    *(void *)&self->_uint64_t viewControllerFlags = viewControllerFlags & 0xFFFFFFFFFFFFFBFFLL | v5;
    char v9 = [(UIViewController *)self _existingView];
    id v6 = [v9 window];
    id v7 = [v6 rootViewController];
    if (v7 == self && (v9[12] & 0x400000000000000) != 0)
    {
      char v8 = [v9 translatesAutoresizingMaskIntoConstraints];

      if ((v8 & 1) == 0) {
        [v6 _setNeedsUpdateConstraints];
      }
    }
    else
    {
    }
  }
}

- (BOOL)_viewControllerIgnoresClippedGlyphPathFrame
{
  if ([(UIViewController *)self isBeingDismissed]) {
    return 1;
  }
  return [(UIViewController *)self isBeingPresented];
}

- (void)setShouldForceNonAnimatedTransition:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (void)_removeChildModalViewController:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [a1[14] indexOfObjectIdenticalTo:v3];
    id v3 = v6;
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v5 = v4;
      [v6 setParentModalViewController:0];
      [a1[14] removeObjectAtIndex:v5];
      [a1 _didChangeDeepestActionResponder];
      id v3 = v6;
    }
  }
}

- (void)_prepareForWindowDealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(UIPresentationController *)self->_presentationController _prepareForWindowDeallocRecursively:1];
  presentationController = self->_presentationController;
  self->_presentationController = 0;

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = self->_childModalViewControllers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setParentModalViewController:", 0, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_childModalViewControllers removeAllObjects];
}

- (BOOL)isSheet
{
  return 0;
}

- (void)_setModalPresentationStyle:(int64_t)a3
{
  if ([(id)UIApp _isSpringBoard]) {
    self->_int64_t modalPresentationStyle = a3;
  }
}

- (BOOL)_optsOutOfPopoverControllerHierarchyCheck
{
  return 0;
}

- (void)_setPopoverController:(id)a3
{
}

BOOL __92__UIViewController__preferredInterfaceOrientationGivenStatusBarAndDeviceOrientationAndMask___block_invoke(uint64_t a1, char a2)
{
  return (**(void **)(a1 + 32) & (1 << a2)) != 0;
}

- (BOOL)_isDimmingBackground
{
  if ([self->_dimmingView displayed]) {
    return 1;
  }
  parentViewController = self->_parentViewController;
  return [(UIViewController *)parentViewController _isDimmingBackground];
}

- (BOOL)_useCustomDimmingView
{
  return 0;
}

- (void)_keyboardWillShow:(id)a3
{
  uint64_t v4 = [(UIViewController *)self _visibleView];
  uint64_t v5 = [v4 window];
  uint64_t v6 = +[UIScreen mainScreen];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v44 = v11;
  double v13 = v12;

  uint64_t v14 = -[UIViewController _keyboardSceneDelegate](self);
  [v14 visibleFrameInView:0];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  double v23 = 0.0;
  if ([(UIViewController *)self interfaceOrientation] != UIInterfaceOrientationPortrait)
  {
    if ([(UIViewController *)self interfaceOrientation] == UIInterfaceOrientationLandscapeLeft)
    {
      double v23 = -1.57079637;
    }
    else if ([(UIViewController *)self interfaceOrientation] == UIInterfaceOrientationLandscapeRight)
    {
      double v23 = 1.57079637;
    }
    else if ([(UIViewController *)self interfaceOrientation] == UIInterfaceOrientationPortraitUpsideDown)
    {
      double v23 = 3.14159274;
    }
    else
    {
      double v23 = 0.0;
    }
  }
  +[UIScreen transformToRotateScreen:v23];
  v55.origin.double x = v16;
  v55.origin.double y = v18;
  v55.size.double width = v20;
  v55.size.double height = v22;
  CGRect v56 = CGRectApplyAffineTransform(v55, &v54);
  double y = v56.origin.y;
  if (objc_msgSend(v5, "_isHostedInAnotherProcess", v56.origin.x))
  {
    [v5 bounds];
    double v25 = v57.origin.y;
    CGFloat MidX = CGRectGetMidX(v57);
    [v4 bounds];
    v27.f64[0] = MidX;
    v27.f64[1] = v25 + v26 * 0.5;
    float64x2_t v46 = v27;
  }
  else
  {
    double v47 = v8 + v44 * 0.5;
    double v28 = __UIStatusBarManagerForWindow(v5);
    [v28 defaultStatusBarHeightInOrientation:1];
    double v30 = v29;

    [v4 bounds];
    double v43 = v10 + v13 * 0.5 - v47 + v30 + CGRectGetHeight(v58) * 0.5;
    +[UIScreen transformForScreenOriginRotation:v23];
    float64x2_t v46 = vaddq_f64(v53, vaddq_f64(vmulq_n_f64(v51, v47), vmulq_n_f64(v52, v43)));
  }
  if ((unint64_t)([(UIViewController *)self interfaceOrientation] - 3) <= 1
    && (([v5 _isHostedInAnotherProcess] & 1) != 0 || y < v44))
  {
    double v31 = [(UIViewController *)self presentingViewController];
    int v32 = [v31 isPerformingModalTransition];

    if (v32)
    {
      double v33 = [v4 superview];
      [v33 bounds];
      double v35 = v34 * 0.5;
      [(UIViewController *)self formSheetSize];
      double v37 = v36 * 0.5;
      double v38 = __UIStatusBarManagerForWindow(v5);
      [v38 defaultStatusBarHeightInOrientation:1];
      double v40 = v39;

      double v41 = [v4 layer];
      objc_msgSend(v41, "setPosition:", v35, v37 + v40);
    }
    else
    {
      if ([v5 isRotating]) {
        uint64_t v42 = 4;
      }
      else {
        uint64_t v42 = 0;
      }
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __38__UIViewController__keyboardWillShow___block_invoke;
      v48[3] = &unk_1E52DD178;
      id v49 = v4;
      float64x2_t v50 = v46;
      +[UIView animateWithDuration:v42 delay:v48 options:0 animations:0.25 completion:0.0];
      double v33 = v49;
    }
  }
}

void __38__UIViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) superview];
  objc_msgSend(v2, "convertPoint:fromView:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:");
}

- (void)_keyboardWillHide:(id)a3
{
  UIInterfaceOrientation v4 = [(UIViewController *)self interfaceOrientation];
  if ((unint64_t)(v4 - 3) <= 1)
  {
    UIInterfaceOrientation v5 = v4;
    uint64_t v6 = [(UIViewController *)self _visibleView];
    double v7 = [v6 window];
    if ([v7 _isHostedInAnotherProcess])
    {
      [v7 bounds];
      CGFloat x = v47.origin.x;
      CGFloat y = v47.origin.y;
      CGFloat width = v47.size.width;
      CGFloat height = v47.size.height;
      double MidX = CGRectGetMidX(v47);
      v48.origin.CGFloat x = x;
      v48.origin.CGFloat y = y;
      v48.size.CGFloat width = width;
      v48.size.CGFloat height = height;
      double MidY = CGRectGetMidY(v48);
    }
    else
    {
      uint64_t v14 = +[UIScreen mainScreen];
      [v14 bounds];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;

      double v39 = v16 + v20 * 0.5;
      double v23 = __UIStatusBarManagerForWindow(v7);
      [v23 defaultStatusBarHeightInOrientation:v5];
      double v25 = v24;

      UIInterfaceOrientation v26 = [(UIViewController *)self interfaceOrientation];
      double v27 = 0.0;
      if (v26 != UIInterfaceOrientationPortrait)
      {
        if ([(UIViewController *)self interfaceOrientation] == UIInterfaceOrientationLandscapeLeft)
        {
          double v27 = -1.57079633;
        }
        else if ([(UIViewController *)self interfaceOrientation] == UIInterfaceOrientationLandscapeRight)
        {
          double v27 = 1.57079633;
        }
        else
        {
          UIInterfaceOrientation v28 = [(UIViewController *)self interfaceOrientation];
          double v27 = 3.14159265;
          if (v28 != UIInterfaceOrientationPortraitUpsideDown) {
            double v27 = 0.0;
          }
        }
      }
      +[UIScreen transformForScreenOriginRotation:v27];
      objc_msgSend(v7, "convertPoint:fromView:", 0, vaddq_f64(v46, vaddq_f64(vmulq_n_f64(v44, v39), vmulq_n_f64(v45, v18 + v22 * 0.5 + v25 * 0.5))));
      double MidX = v29;
      double MidY = v30;
    }
    double v31 = [v6 superview];
    objc_msgSend(v31, "convertPoint:fromView:", 0, MidX, MidY);
    uint64_t v33 = v32;
    uint64_t v35 = v34;

    int v36 = [v7 isRotating];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __38__UIViewController__keyboardWillHide___block_invoke;
    v40[3] = &unk_1E52DD178;
    id v41 = v6;
    if (v36) {
      uint64_t v37 = 4;
    }
    else {
      uint64_t v37 = 0;
    }
    uint64_t v42 = v33;
    uint64_t v43 = v35;
    id v38 = v6;
    +[UIView animateWithDuration:v37 delay:v40 options:0 animations:0.25 completion:0.0];
  }
}

uint64_t __38__UIViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)_isPresentedFormSheet
{
  if (self->_parentModalViewController
    && ([(UIViewController *)self modalPresentationStyle] == 16
     || [(UIViewController *)self modalPresentationStyle] == UIModalPresentationFormSheet
     || self->_parentModalViewController
     && [(UIViewController *)self modalPresentationStyle] == UIModalPresentationCurrentContext
     && [(UIViewController *)self->_parentModalViewController _isPresentedFormSheet]))
  {
    LOBYTE(parentViewController) = 1;
  }
  else
  {
    parentViewController = self->_parentViewController;
    if (parentViewController)
    {
      LOBYTE(parentViewController) = [(UIViewController *)parentViewController _isPresentedFormSheet];
    }
  }
  return (char)parentViewController;
}

- (BOOL)_isInSheetPresentation
{
  if (!self->_parentModalViewController) {
    goto LABEL_9;
  }
  if ([(UIViewController *)self modalPresentationStyle] == 16
    || [(UIViewController *)self modalPresentationStyle] == UIModalPresentationFormSheet)
  {
    LOBYTE(parentModalViewController) = 1;
    return (char)parentModalViewController;
  }
  parentModalViewController = [(UIViewController *)self modalPresentationStyle];
  if (parentModalViewController == (UIViewController *)1) {
    return (char)parentModalViewController;
  }
  if (self->_parentModalViewController
    && [(UIViewController *)self modalPresentationStyle] == UIModalPresentationCurrentContext)
  {
    parentModalViewController = self->_parentModalViewController;
  }
  else
  {
LABEL_9:
    parentModalViewController = self->_parentViewController;
    if (!parentModalViewController) {
      return (char)parentModalViewController;
    }
  }
  LOBYTE(parentModalViewController) = [(UIViewController *)parentModalViewController _isInSheetPresentation];
  return (char)parentModalViewController;
}

- (BOOL)_isModalSheet
{
  return [(UIViewController *)self modalPresentationStyle] == 16
      || [(UIViewController *)self modalPresentationStyle] == UIModalPresentationFormSheet
      || [(UIViewController *)self modalPresentationStyle] == UIModalPresentationPageSheet;
}

- (BOOL)_useSheetRotation
{
  return self->_dropShadowView
      || [(UIViewController *)self modalPresentationStyle] == 16
      || [(UIViewController *)self modalPresentationStyle] == UIModalPresentationCustom;
}

- (uint64_t)_transitionForModalTransitionStyle:(int)a3 appearing:
{
  if (result)
  {
    if (_AXSReduceMotionReduceSlideTransitionsEnabled())
    {
      return 6;
    }
    else
    {
      uint64_t result = 6;
      switch(a2)
      {
        case 1:
          BOOL v7 = a3 == 0;
          unsigned int v8 = 10;
          goto LABEL_9;
        case 2:
          return result;
        case 3:
          BOOL v5 = a3 == 0;
          unsigned int v6 = 13;
          goto LABEL_19;
        case 10:
          BOOL v7 = a3 == 0;
          unsigned int v8 = 8;
LABEL_9:
          if (v7) {
            return v8;
          }
          else {
            return v8 + 1;
          }
        case 11:
          BOOL v9 = a3 == 0;
          unsigned int v10 = 7;
          unsigned int v11 = 3;
          goto LABEL_15;
        case 12:
          BOOL v5 = a3 == 0;
          unsigned int v6 = 16;
          goto LABEL_19;
        case 13:
          BOOL v9 = a3 == 0;
          unsigned int v10 = 12;
          unsigned int v11 = 18;
LABEL_15:
          if (v9) {
            return v10;
          }
          else {
            return v11;
          }
        case 14:
          BOOL v5 = a3 == 0;
          unsigned int v6 = 19;
          goto LABEL_19;
        case 15:
          return 2;
        case 16:
          return 1;
        default:
          BOOL v5 = a3 == 0;
          unsigned int v6 = 8;
LABEL_19:
          if (v5) {
            uint64_t result = v6 + 1;
          }
          else {
            uint64_t result = v6;
          }
          break;
      }
    }
  }
  return result;
}

- (void)_childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __107__UIViewController__childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter___block_invoke;
  v6[3] = &unk_1E52EA088;
  id v7 = v4;
  id v5 = v4;
  -[UIViewController _enumerateVisibleChildControllers:includePresentedChildren:usingBlock:](self, 1, v6);
}

uint64_t __107__UIViewController__childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter:*(void *)(a1 + 32)];
}

- (void)_cancelDelayedPresentation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_getAssociatedObject(self, &unk_1EB25BB23);
  if (v5)
  {
    id v20 = v5;
    unsigned int v6 = [v5 invocationTarget];
    objc_setAssociatedObject(v6, &unk_1EB25BB22, 0, (void *)1);
    objc_setAssociatedObject(self, &unk_1EB25BB23, 0, (void *)1);
    BOOL v7 = *((void *)v20 + 4) == 0;
    unsigned int v8 = *((id *)v20 + 6);
    if (v8)
    {
      BOOL v9 = v8;
      dispatch_source_cancel(v8);
    }
    id v10 = v20;
    if (!*((unsigned char *)v20 + 8))
    {
      unsigned int v11 = [v20 delayingController];
      double v12 = (objc_class *)objc_opt_class();
      double v13 = objc_msgSend(NSString, "stringWithFormat:", @"Cancelling delayed presentation of <%s: %p>", class_getName(v12), v11);
      uint64_t v14 = [v20 windowSceneIgnoringEvents];
      [v14 _endIgnoringInteractionEventsForReason:v13];

      [v20 setWindowSceneIgnoringEvents:0];
      id v10 = v20;
    }
    uint64_t v15 = *((void *)v10 + 4);
    if (v15)
    {
      int v16 = (*(uint64_t (**)(uint64_t, BOOL))(v15 + 16))(v15, v3);
      id v10 = v20;
      BOOL v7 = v16;
    }
    if (!v7 || !v3)
    {
      id v19 = 0;
    }
    else
    {
      id v18 = *((id *)v10 + 3);
      id v10 = v20;
      id v19 = v18;
    }
    [v10 setPresentInvocation:0];
    [v20 setCancellationHandler:0];
    if (v19) {
      [v19 invoke];
    }

    id v5 = v20;
  }
}

- (void)_beginDelayingPresentation
{
}

- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return 0;
}

- (id)_customPresentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 _overrideTransitioningDelegate];
  if (v11)
  {
    double v12 = (void *)v11;
    double v13 = [v8 _overrideTransitioningDelegate];
    NSClassFromString(&cfstr_Uialertcontrol_10.isa);
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_4;
    }
  }
  uint64_t v15 = [(UIViewController *)self _presentationControllerForPresentedController:v8 presentingController:v9 sourceController:v10];
  if (!v15)
  {
LABEL_4:
    int v16 = [(UIViewController *)self transitioningDelegate];
    if (v16 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v15 = [v16 presentationControllerForPresentedViewController:v8 presentingViewController:v9 sourceViewController:v10];
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  return v15;
}

- (id)_customAnimatorForPresentedController:(void *)a3 presentingController:(void *)a4 sourceController:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = [v7 preferredTransition];
    if (v10)
    {
      uint64_t v11 = [v8 traitCollection];
      double v12 = [v10 _transitionControllerForViewController:v7 traits:v11 isAppearing:1];

      if (v12) {
        goto LABEL_12;
      }
    }
    double v13 = [a1 transitioningDelegate];
    if (v13)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v14 = [v13 animationControllerForPresentedController:v7 presentingController:v8 sourceController:v9];
LABEL_9:
        double v12 = (void *)v14;
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v14 = [v13 animatorForPresentedController:v7 presentingController:v8 sourceController:v9];
        goto LABEL_9;
      }
    }
    double v12 = 0;
    goto LABEL_11;
  }
  double v12 = 0;
LABEL_13:

  return v12;
}

- (id)_customInteractionControllerForPresentation:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (objc_opt_respondsToSelector())
    {
      id v4 = [v3 _interactionController];
    }
    else
    {
      id v5 = [a1 transitioningDelegate];
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v4 = [v5 interactionControllerForPresentation:v3];
      }
      else
      {
        id v4 = 0;
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_customAnimatorForDismissedController:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 preferredTransition];
    if (v5)
    {
      unsigned int v6 = [v4 traitCollection];
      id v7 = [v5 _transitionControllerForViewController:v4 traits:v6 isAppearing:0];

      if (v7) {
        goto LABEL_12;
      }
    }
    id v8 = [a1 transitioningDelegate];
    if (v8)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v9 = [v8 animationControllerForDismissedController:v4];
LABEL_9:
        id v7 = (void *)v9;
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v9 = [v8 animatorForDismissedController:v4];
        goto LABEL_9;
      }
    }
    id v7 = 0;
    goto LABEL_11;
  }
  id v7 = 0;
LABEL_13:

  return v7;
}

- (id)_customInteractionControllerForDismissal:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (objc_opt_respondsToSelector())
    {
      id v4 = [v3 _interactionController];
    }
    else
    {
      id v5 = [a1 transitioningDelegate];
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v4 = [v5 interactionControllerForDismissal:v3];
      }
      else
      {
        id v4 = 0;
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __40__UIViewController__scheduleTransition___block_invoke(uint64_t a1)
{
  return [(id)UIApp _performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming:*(unsigned __int8 *)(a1 + 40) block:*(void *)(a1 + 32)];
}

- (void)_transitionToViewController:(id)a3 whilePerforming:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v93 = a5;
  id v10 = [(UIViewController *)self view];
  uint64_t v11 = [v10 window];
  double v12 = [v11 rootViewController];

  double v13 = [v12 view];
  uint64_t v14 = [v13 window];
  uint64_t v15 = [v14 snapshotViewAfterScreenUpdates:0];

  int v16 = [(UIViewController *)self _existingPresentationControllerImmediate:1 effective:1];
  uint64_t v94 = v16;
  if (v16) {
    [v16 presentedView];
  }
  else {
  double v17 = [(UIViewController *)self view];
  }
  id v18 = [v17 snapshotViewAfterScreenUpdates:0];

  v95 = v12;
  id v19 = [v12 view];
  id v20 = [v19 window];

  [v20 addSubview:v15];
  double v21 = [(UIViewController *)self view];
  [v21 frame];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v30 = [(UIViewController *)self view];
  double v31 = [v30 superview];
  objc_msgSend(v20, "convertRect:fromView:", v31, v23, v25, v27, v29);
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  objc_msgSend(v18, "setFrame:", v33, v35, v37, v39);
  [v15 addSubview:v18];
  [v20 addSubview:v18];
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __75__UIViewController__transitionToViewController_whilePerforming_completion___block_invoke;
  v109[3] = &unk_1E52DA040;
  id v92 = v9;
  id v110 = v92;
  +[UIView performWithoutAnimation:v109];
  double v40 = [v8 parentViewController];
  id v41 = [v40 view];

  if (v41)
  {
    id v42 = v41;
  }
  else
  {
    id v42 = [v8 view];
  }
  uint64_t v43 = v42;
  float64x2_t v44 = objc_msgSend(v8, "view", 3221225472);
  [v44 bounds];
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  float64x2_t v53 = [v8 view];
  objc_msgSend(v43, "convertRect:fromView:", v53, v46, v48, v50, v52);
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;

  double v62 = objc_msgSend(v43, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, v55, v57, v59, v61, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v62, "setFrame:", v33, v35, v37, v39);
  [v20 addSubview:v62];
  double v63 = [v8 view];
  [v63 frame];
  double v65 = v64;
  double v67 = v66;
  double v69 = v68;
  double v71 = v70;
  CGAffineTransform v72 = [v8 view];
  uint64_t v73 = [v72 superview];
  objc_msgSend(v20, "convertRect:fromView:", v73, v65, v67, v69, v71);
  uint64_t v75 = v74;
  uint64_t v77 = v76;
  uint64_t v79 = v78;
  uint64_t v81 = v80;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = v91;
  aBlock[2] = __75__UIViewController__transitionToViewController_whilePerforming_completion___block_invoke_3;
  aBlock[3] = &unk_1E52E6160;
  id v82 = v18;
  id v102 = v82;
  uint64_t v105 = v75;
  uint64_t v106 = v77;
  uint64_t v107 = v79;
  uint64_t v108 = v81;
  id v83 = v62;
  id v103 = v83;
  id v84 = v15;
  id v104 = v84;
  uint64_t v85 = _Block_copy(aBlock);
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = v91;
  v96[2] = __75__UIViewController__transitionToViewController_whilePerforming_completion___block_invoke_4;
  v96[3] = &unk_1E52EA120;
  id v86 = v84;
  id v97 = v86;
  id v87 = v82;
  id v98 = v87;
  id v88 = v83;
  id v99 = v88;
  id v89 = v93;
  id v100 = v89;
  v90 = _Block_copy(v96);
  if (_AXSReduceMotionEnabled()) {
    +[UIView animateKeyframesWithDuration:0 delay:v85 options:v90 animations:0.2 completion:0.0];
  }
  else {
    +[UIView _animateUsingDefaultDampedSpringWithDelay:0 initialSpringVelocity:v85 options:v90 animations:0.0 completion:60.0];
  }
}

void __75__UIViewController__transitionToViewController_whilePerforming_completion___block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __75__UIViewController__transitionToViewController_whilePerforming_completion___block_invoke_2;
  v1[3] = &unk_1E52DA040;
  id v2 = *(id *)(a1 + 32);
  +[UIViewController _performWithoutDeferringTransitions:v1];
}

uint64_t __75__UIViewController__transitionToViewController_whilePerforming_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__UIViewController__transitionToViewController_whilePerforming_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 48);
  return [v2 setAlpha:0.0];
}

uint64_t __75__UIViewController__transitionToViewController_whilePerforming_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 48) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_transitionToNavigationViewController:(id)a3 withWrapper:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v47 = (void (**)(void))a4;
  id v42 = self;
  double v46 = [(UIViewController *)self _existingPresentationControllerImmediate:1 effective:1];
  id v7 = [v46 _viewsParticipatingInNavigationControllerTransition];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v60 != v11) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        v64[0] = @"view";
        v64[1] = @"frame";
        v65[0] = v13;
        uint64_t v14 = (void *)MEMORY[0x1E4F29238];
        uint64_t v15 = [v6 view];
        [v13 frame];
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        double v24 = [v13 superview];
        objc_msgSend(v15, "convertRect:fromView:", v24, v17, v19, v21, v23);
        double v25 = objc_msgSend(v14, "valueWithCGRect:");
        v65[1] = v25;
        double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
        [v8 addObject:v26];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
    }
    while (v10);
  }

  double v45 = [v46 _animatorForContainmentTransition];
  double v27 = [[_UISimpleTransitioningDelegate alloc] initWithAnimator:v45];
  [(_UISimpleTransitioningDelegate *)v27 _setSuppressCrossFadeNavigationBarAnimation:1];
  double v28 = [v6 delegate];
  [v6 setDelegate:v27];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __70__UIViewController__transitionToNavigationViewController_withWrapper___block_invoke;
  v58[3] = &unk_1E52D9F70;
  v58[4] = v42;
  +[UIViewController _performWithoutDeferringTransitions:v58];
  float64x2_t v44 = v27;
  if (v47)
  {
    v47[2]();
    double v29 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v29 = v42;
  }
  uint64_t v43 = v29;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v30 = v8;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v55 != v33) {
          objc_enumerationMutation(v30);
        }
        double v35 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        double v36 = [v35 objectForKeyedSubscript:@"view"];
        double v37 = [v35 objectForKeyedSubscript:@"frame"];
        [v37 CGRectValue];
        objc_msgSend(v36, "setFrame:");

        double v38 = [v6 view];
        double v39 = [v35 objectForKeyedSubscript:@"view"];
        [v38 addSubview:v39];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v32);
  }

  [v6 pushViewController:v43 animated:1];
  id v40 = self;
  id v41 = [v6 transitionCoordinator];
  if (v41)
  {
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __70__UIViewController__transitionToNavigationViewController_withWrapper___block_invoke_2;
    v49[3] = &unk_1E52E8E00;
    id v50 = v6;
    id v51 = v28;
    double v52 = v44;
    id v53 = v30;
    [v41 animateAlongsideTransition:0 completion:v49];
  }
}

uint64_t __70__UIViewController__transitionToNavigationViewController_withWrapper___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:0 completion:0];
}

void __70__UIViewController__transitionToNavigationViewController_withWrapper___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  id v2 = self;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 56);
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
        id v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "objectForKeyedSubscript:", @"view", (void)v9);
        [v8 removeFromSuperview];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)_shouldAbortAdaptationFromTraitCollection:(id)a3 toTraitCollection:(id)a4 withTransitionCoordinator:(id)a5
{
  return 0;
}

- (id)_adaptedPresentationControllerForTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_originalPresentationController)
  {
    id v8 = [(UIViewController *)self presentedViewController];
    if ([v8 isBeingDismissed]) {
      goto LABEL_5;
    }
    uint64_t v9 = [v6 horizontalSizeClass];
    uint64_t v10 = [v6 verticalSizeClass];
    originalPresentationController = self->_originalPresentationController;
    long long v12 = [(UIViewController *)self traitCollection];
    LODWORD(originalPresentationController) = [(UIPresentationController *)originalPresentationController _shouldAdaptFromTraitCollection:v12 toTraitCollection:v6];

    if (!originalPresentationController
      || ([(UIViewController *)self traitCollection],
          double v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v8 _shouldAbortAdaptationFromTraitCollection:v13 toTraitCollection:v6 withTransitionCoordinator:v7], v13, (v14 & 1) != 0))
    {
LABEL_5:
      uint64_t v15 = 0;
    }
    else
    {
      double v17 = [(UIPresentationController *)self->_originalPresentationController _presentationControllerForTraitCollection:v6];
      double v18 = [(UIViewController *)self _presentationController];
      if (v17 == v18)
      {
        uint64_t v15 = 0;
      }
      else
      {
        [(UIViewController *)self _setPresentedStatusBarViewController:0];
        [(UIViewController *)self _setPresentedUserInterfaceStyleViewController:0];
        [(UIPresentationController *)v17 _setAdaptiveTransitionCoordinator:v7];
        double v19 = [v7 _mainContext];
        [(UIPresentationController *)v17 _setAdaptiveTransitionContext:v19];

        double v20 = self->_originalPresentationController;
        if (v17 == v20)
        {
          double v21 = [(UIPresentationController *)v17 presentedViewController];
          double v24 = self->_originalPresentationController;
          uint64_t v23 = -1;
        }
        else
        {
          double v21 = [(UIPresentationController *)v20 _presentedViewControllerForPresentationController:v17 traitCollection:v6];
          double v22 = self->_originalPresentationController;
          uint64_t v23 = [(UIPresentationController *)v17 presentationStyle];
          double v24 = v22;
        }
        [(UIPresentationController *)v24 _sendDelegateWillPresentWithAdaptiveStyle:v23 transitionCoordinator:v7];
        [(UIPresentationController *)v17 _setPresentedViewController:v21];
        double v25 = [(UIPresentationController *)v18 presentingViewController];
        [(UIPresentationController *)v17 _setPresentingViewController:v25];

        [(UIPresentationController *)v18 _transitionToPresentationController:v17 withTransitionCoordinator:v7];
        if (v21 != v8) {
          [v21 _replaceViewControllerInPresentationHierarchy:v8];
        }
        [(UIViewController *)self _setPresentationController:v17];
        -[UIViewController _setPresentationSizeClassPair:](self, "_setPresentationSizeClassPair:", v9, v10);
        [(UIViewController *)self _setPresentedStatusBarViewController:v21];
        [(UIViewController *)self _setPresentedUserInterfaceStyleViewController:v21];
        uint64_t v15 = v17;
      }
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)_replaceViewControllerInPresentationHierarchy:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 parentModalViewController];
  -[UIViewController _removeChildModalViewController:](v4, v12);
  -[UIViewController _addChildModalViewController:](v4, self);
  uint64_t v5 = [v12 _existingPresentationControllerImmediate:1 effective:1];
  id v6 = [v5 _childPresentationController];

  if (v6)
  {
    id v7 = [v12 _presentationController];
    [(UIViewController *)self _setPresentationController:v7];

    [v12 _setPresentationController:0];
    id v8 = [v12 _originalPresentationController];
    [(UIViewController *)self _setOriginalPresentationController:v8];

    [v12 _setOriginalPresentationController:0];
    uint64_t v9 = [v12 _presentationSizeClassPair];
    -[UIViewController _setPresentationSizeClassPair:](self, "_setPresentationSizeClassPair:", v9, v10);
    [v6 _setPresentingViewController:self];
    long long v11 = [v6 presentedViewController];
    -[UIViewController _removeChildModalViewController:]((id *)v12, v11);
    -[UIViewController _addChildModalViewController:]((id *)&self->super.super.isa, v11);
  }
}

- (BOOL)_wantsContentClippedToSafeAreaInSidebarContext
{
  return 1;
}

- (void)presentViewController:(id)a3 withTransition:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    long long v11 = (id *)v8;
    v194[0] = v11;
    unsigned int v193 = v6;
    id v12 = v9;
    if (!self)
    {
LABEL_182:

      goto LABEL_183;
    }
    v192 = sel__windowControllerBasedPresentViewController_withTransition_completion_;
    if (-[UIViewController _isWaitingForDelayedPresentation](self))
    {
      double v13 = objc_getAssociatedObject(self, &unk_1EB25BB22);
      NSLog(&cfstr_AttemptToPrese_0.isa, v11, self, v13);

      goto LABEL_182;
    }
    if (dyld_program_sdk_at_least()) {
      goto LABEL_14;
    }
    char v14 = +[UIDevice currentDevice];
    uint64_t v15 = [v14 userInterfaceIdiom];

    if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1
      || ([(id)UIApp _isSpringBoard] & 1) != 0
      || (+[UIApplication displayIdentifier],
          double v16 = objc_claimAutoreleasedReturnValue(),
          char v17 = [@"com.apple.facetime" isEqualToString:v16],
          v16,
          (v17 & 1) != 0))
    {
LABEL_14:
      if (!dyld_program_sdk_at_least()) {
        goto LABEL_19;
      }
      double v18 = +[UIDevice currentDevice];
      uint64_t v19 = [v18 userInterfaceIdiom];

      if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1
        || [v11 modalPresentationStyle] != 16
        && [v11 modalPresentationStyle] != 2
        && [v11 modalPresentationStyle] != 1)
      {
        goto LABEL_19;
      }
    }
    else if ([v11 modalPresentationStyle] == 17 || objc_msgSend(v11, "modalPresentationStyle") == 4)
    {
      goto LABEL_19;
    }
    [v11 setModalPresentationStyle:0];
LABEL_19:
    if (v11)
    {
      double v20 = 0;
    }
    else
    {
      double v20 = [NSString stringWithFormat:@"Application tried to present a nil modal view controller on target %@.", self];
    }
    CGRect v169 = self->_parentViewController;
    uint64_t v21 = [(UIViewController *)v169 presentedViewController];
    if (v21)
    {
      double v22 = (void *)v21;
      UIModalTransitionStyle v23 = [(UIViewController *)self modalTransitionStyle];

      if (v23 == UIModalTransitionStylePartialCurl)
      {
        uint64_t v24 = [NSString stringWithFormat:@"Application tried to present a nested modal view controller while curled %@.", self];

        double v20 = (UIViewController *)v24;
      }
    }
    double v25 = [(UIViewController *)self _popoverController];
    if (v25 || [v11 modalPresentationStyle])
    {
      uint64_t v26 = [v11 modalTransitionStyle];

      unint64_t v27 = 0x1E4F29000uLL;
      if (v26 != 3)
      {
LABEL_30:
        if ([v11 modalPresentationStyle] == 3)
        {
          uint64_t v30 = [(UIViewController *)self _popoverController];
          if (v30)
          {
            uint64_t v31 = (void *)v30;
            uint64_t v32 = [v11 modalTransitionStyle];

            if (v32)
            {
              unint64_t v27 = 0x1E4F29000uLL;
              uint64_t v33 = [NSString stringWithFormat:@"Application tried to present inside popover with transition style other than UIModalTransitionStyleCoverVertical %@.", self];

              double v20 = (UIViewController *)v33;
            }
            else
            {
              unint64_t v27 = 0x1E4F29000uLL;
            }
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!dyld_program_sdk_at_least())
          {
            double v34 = @"Application tried to present a split view controller %@.";
            goto LABEL_44;
          }
          if ([v11 modalPresentationStyle]
            && [v11 modalPresentationStyle] != 17
            && [v11 modalPresentationStyle] != 4)
          {
            double v34 = @"Application tried to present a split view controller with a modal presentation style other than full screen or custom %@.";
LABEL_44:
            uint64_t v35 = objc_msgSend(*(id *)(v27 + 24), "stringWithFormat:", v34, self);

            double v20 = (UIViewController *)v35;
          }
        }
        double v36 = [v11 parentViewController];
        if (v36
          || ([v11 _parentModalViewController], (double v36 = objc_claimAutoreleasedReturnValue()) != 0))
        {
        }
        else
        {
          long long v61 = [v11 _popoverController];

          if (!v61)
          {
LABEL_49:
            if (v20)
            {
              id v154 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
              objc_exception_throw(v154);
            }
            id v170 = v12;
            if ([v11 _isDelayingPresentation])
            {
              objc_msgSend(v11, "__viewControllerWillBePresented:", 1);
              uint64_t v184 = MEMORY[0x1E4F143A8];
              uint64_t v185 = 3221225472;
              CGRect v186 = __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke;
              CGRect v187 = &unk_1E52EA088;
              CGRect v188 = self;
              -[UIViewController _enumerateVisibleChildControllers:includePresentedChildren:usingBlock:](self, 1, &v184);
              CGRect v174 = self;
              double v38 = (void *)MEMORY[0x1E4F1CA18];
              double v39 = [(UIViewController *)self methodSignatureForSelector:sel__windowControllerBasedPresentViewController_withTransition_completion_];
              id v40 = [v38 invocationWithMethodSignature:v39];

              [v40 setArgument:&v174 atIndex:0];
              [v40 setTarget:self];
              [v40 setArgument:&v192 atIndex:1];
              [v40 setArgument:v194 atIndex:2];
              [v40 setArgument:&v193 atIndex:3];
              newValue[0] = _Block_copy(v12);
              [v40 setArgument:newValue atIndex:4];
              [v40 retainArguments];
              id v41 = objc_getAssociatedObject(v194[0], &unk_1EB25BB23);
              id v42 = [(UIViewController *)self _window];
              uint64_t v43 = [v42 windowScene];
              [v41 setWindowSceneIgnoringEvents:v43];

              id v12 = v170;
              [v41 setPresentInvocation:v40];
              objc_setAssociatedObject(self, &unk_1EB25BB22, v194[0], (void *)1);
              -[_UIDelayedPresentationContext beginDelayedPresentation]((uint64_t)v41);

LABEL_181:
              goto LABEL_182;
            }
            id v167 = v8;
            objc_msgSend(v11, "__viewControllerWillBePresented:", 0);
            float64x2_t v44 = [(UIViewController *)self view];
            double v45 = +[_UIEditMenuSceneComponent sceneComponentForView:v44];
            [v45 dismissCurrentMenu];

            uint64_t v46 = [v11 modalPresentationStyle];
            -[UIViewController _modalPresenter:](self, v46);
            double v47 = (id *)objc_claimAutoreleasedReturnValue();
            if (v47 == v11)
            {
              double v155 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v156 = *MEMORY[0x1E4F1C3C8];
              v157 = [NSString stringWithFormat:@"Application tried to present modal view controller on itself. Presenting controller is %@.", v11];
              id v158 = [v155 exceptionWithName:v156 reason:v157 userInfo:0];

              objc_exception_throw(v158);
            }
            double v48 = v47;
            double v49 = [v47 view];
            id v50 = [v49 superview];
            objc_opt_class();
            int isKindOfClass = objc_opt_isKindOfClass();

            int v52 = [v48 definesPresentationContext];
            if (v46 == 3) {
              int v53 = v52;
            }
            else {
              int v53 = 0;
            }
            char v161 = isKindOfClass;
            int v54 = v53 & (isKindOfClass ^ 1);
            int v164 = v54;
            if (v6)
            {
              if (v54)
              {
                int v55 = [v48 providesPresentationContextTransitionStyle];
                if (v55) {
                  long long v56 = v48;
                }
                else {
                  long long v56 = v11;
                }
              }
              else
              {
                int v55 = 0;
                long long v56 = v11;
              }
              long long v59 = v56;
              -[UIViewController _customAnimatorForPresentedController:presentingController:sourceController:](v59, v11, v48, self);
              long long v60 = (UIViewControllerBuiltinTransitionViewAnimator *)objc_claimAutoreleasedReturnValue();
              BOOL v58 = v60 != 0;
              if (v60)
              {
                CGRect v168 = -[UIViewController _customInteractionControllerForPresentation:](v59, v60);
                long long v57 = v60;
              }
              else
              {
                if (v55) {
                  uint64_t v6 = -[UIViewController _transitionForModalTransitionStyle:appearing:]((uint64_t)self, [v48 modalTransitionStyle], 1);
                }
                unsigned int v193 = v6;
                long long v57 = [[UIViewControllerBuiltinTransitionViewAnimator alloc] initWithTransition:v6];
                CGRect v168 = 0;
              }

              BOOL v62 = v46 != 4;
              if (!v6) {
                BOOL v62 = 1;
              }
              if (!v62) {
                uint64_t v46 = 4;
              }
              if (v60 || v62)
              {
                BOOL v162 = v6 == 0;
              }
              else
              {
                NSLog(&cfstr_WarningUimodal.isa, self, v11);
                BOOL v162 = 0;
                BOOL v58 = 0;
                uint64_t v46 = 0;
              }
              id v12 = v170;
            }
            else
            {
              long long v57 = 0;
              CGRect v168 = 0;
              BOOL v58 = 0;
              BOOL v162 = 1;
            }
            [v11 _setModalSourceViewController:self];
            double v63 = [v48 childModalViewController];
            id v166 = v9;
            char v160 = v58;
            if (v63 || v48[20])
            {
              BOOL v64 = 0;
            }
            else
            {
              double v101 = [v48 view];
              id v102 = [v101 superview];
              BOOL v64 = v102 != 0;
            }
            double v65 = [v48 view];
            double v66 = [v65 window];

            if (!v64 || !v66)
            {
              if (v48[20])
              {
                NSLog(&cfstr_WarningAttempt_0.isa, v11, v48);
                id v8 = v167;
              }
              else
              {
                id v98 = [v48 view];
                id v99 = [v98 superview];

                id v8 = v167;
                if (v99)
                {
                  id v100 = [v48 childModalViewController];
                  NSLog(&cfstr_WarningAttempt_2.isa, v11, v48, v100);
                }
                else
                {
                  NSLog(&cfstr_WarningAttempt_1.isa, v11, v48);
                }
              }
              id v9 = v166;
LABEL_180:

              goto LABEL_181;
            }
            CGRect v159 = v57;
            uint64_t v67 = [v48 _rootAncestorViewController];
            double v68 = [v48 _existingView];
            double v69 = [v68 window];
            uint64_t v70 = [v69 rootViewController];
            if (v67 == (void *)v70)
            {

              uint64_t v73 = v170;
            }
            else
            {
              double v71 = (void *)v70;
              char v72 = [v48 _ancestorViewControllerIsInPopover];

              uint64_t v73 = v170;
              if (v72) {
                goto LABEL_91;
              }
              uint64_t v67 = [NSString stringWithFormat:@"Presenting view controllers on detached view controllers is discouraged %@.", v48];
              NSLog(&stru_1ED0F89C0.isa, v67);
            }

LABEL_91:
            uint64_t v74 = [[UIViewControllerAction alloc] initWithViewController:v11 name:@"PresentModal" transition:v6];
            id v75 = v48[20];
            v48[20] = v74;

            uint64_t v76 = [v48 currentAction];
            newValue[0] = (id)MEMORY[0x1E4F143A8];
            newValue[1] = (id)3221225472;
            newValue[2] = __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_2;
            newValue[3] = &unk_1E52D9FE8;
            id v191 = v73;
            if (v76) {
              objc_setProperty_nonatomic_copy(v76, v77, newValue, 24);
            }

            uint64_t v78 = 4194320;
            if (v162) {
              uint64_t v78 = 16;
            }
            v48[47] = (id)((unint64_t)v48[47] & 0xFFFFFFFFFFBFFFFFLL | v78);
            uint64_t v79 = [v48 view];
            uint64_t v80 = [v79 firstResponder];

            -[UIViewController _addChildModalViewController:](v48, v11);
            [v11 _presentingViewControllerWillChange:v48];
            uint64_t v81 = [v48 view];
            uint64_t v82 = [v81 firstResponder];
            id v83 = v48[17];
            v48[17] = (id)v82;

            if (!v48[17]) {
              objc_storeStrong(v48 + 17, v80);
            }
            CGRect v163 = v80;
            id v84 = [v48 view];
            uint64_t v85 = [v84 window];
            id v86 = -[UIViewController _keyboardSceneDelegate](self);
            id v87 = [v86 responder];
            id v88 = [v87 _window];

            if (v85 == v88)
            {
              id v89 = -[UIViewController _keyboardSceneDelegate](self);
              v90 = [MEMORY[0x1E4F29238] valueWithPointer:v48];
              [v89 _preserveInputViewsWithId:v90 animated:1];
            }
            if (v46 == 15 || v46 == 3) && (v161)
            {
              uint64_t v46 = 0;
            }
            else if (v46 == 15)
            {
              uint64_t v46 = 3;
            }
            id v12 = v170;
            if (v164) {
              [v11 setDefinesPresentationContext:1];
            }
            if (v46 == 16 || v46 == 2)
            {
              uint64_t v91 = [MEMORY[0x1E4F28EB8] defaultCenter];
              id v92 = [v48 childModalViewController];
              id v93 = [v48 _screen];
              [v91 addObserver:v92 selector:sel__keyboardWillShow_ name:@"UIKeyboardPrivateWillShowNotification" object:v93];

              uint64_t v94 = [v48 childModalViewController];
              v95 = [v48 _screen];
              id v12 = v170;
              [v91 addObserver:v94 selector:sel__keyboardWillHide_ name:@"UIKeyboardPrivateWillHideNotification" object:v95];
            }
            if ([v11 _isModalSheet])
            {
              uint64_t v96 = [v11 view];
              id v97 = v96;
              if (v46 == 16)
              {
                [v96 setAutoresizingMask:45];
              }
              else
              {
                id v103 = objc_alloc_init(UIDropShadowView);
                [(UIDropShadowView *)v103 setContentView:v97];
                if (v46 == 2) {
                  uint64_t v104 = 45;
                }
                else {
                  uint64_t v104 = 21;
                }
                [(UIView *)v103 setAutoresizingMask:v104];
                [v11 setDropShadowView:v103];
              }
            }
            uint64_t v105 = [v48 view];
            uint64_t v106 = [v105 window];

            CGRect v165 = [v48 _popoverController];
            uint64_t v107 = [v48 modalPresentationStyle];
            if ((unint64_t)(v46 - 1) >= 2)
            {
              if (v46 == 4)
              {
LABEL_143:
                double v121 = [v48 view];
                id v122 = [v121 superview];

                BOOL v123 = [UITransitionView alloc];
                [v122 bounds];
                uint64_t v124 = -[UITransitionView initWithFrame:](v123, "initWithFrame:");
                id v125 = v48[61];
                v48[61] = (id)v124;

                id v126 = v48[61];
                unint64_t v127 = [v48 view];
                [v122 insertSubview:v126 aboveSubview:v127];

                id v12 = v170;
                id v128 = v48[61];
                unint64_t v129 = [v48 view];
                [v128 addSubview:v129];

LABEL_144:
                id v130 = +[UIDevice currentDevice];
                uint64_t v131 = [v130 userInterfaceIdiom];

                if (v46 != 3 || (v131 & 0xFFFFFFFFFFFFFFFBLL) != 1 || v107 == 16 || v107 == 2 || v107 == 1 || !v165)
                {
                  CGFloat v133 = +[UIWindowController windowControllerForWindow:v106];
                  [v133 setPresenting:1];
                  long long v57 = v159;
                  if (v159) {
                    char v134 = v160;
                  }
                  else {
                    char v134 = 1;
                  }
                  if ((v134 & 1) == 0) {
                    [(UIViewControllerBuiltinTransitionViewAnimator *)v159 setDelegate:v133];
                  }
                  [v133 _setTransitionController:v159];
                  [v133 _setInteractionController:v168];
                  uint64_t v135 = v193;
                  double v136 = (id *)v194[0];
                  uint64_t v184 = MEMORY[0x1E4F143A8];
                  uint64_t v185 = 3221225472;
                  CGRect v186 = __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_3;
                  CGRect v187 = &unk_1E52D9F98;
                  CGRect v188 = v48;
                  long long v11 = v136;
                  CGRect v189 = v11;
                  [v133 _transition:v135 fromViewController:v188 toViewController:v11 target:v188 didFinish:1 animation:&v184];

                  BOOL v132 = 0;
                  id v9 = v166;
                  id v12 = v170;
                }
                else
                {
                  if (v11)
                  {
                    v11[47] = (id)((unint64_t)v11[47] & 0xFFFFFFFFFFFFBFFFLL | (v11[47] >> 1) & 0x4000);
                    [v11 setModalInPresentation:1];
                  }
                  [v165 _modalTransition:v6 fromViewController:v48 toViewController:v11 target:v48 didFinish:1];
                  id v9 = v166;
                  long long v57 = v159;
                  BOOL v132 = v6 == 13;
                }
                if (!_UIAppUseModernRotationAndPresentationBehaviors()
                  && (([v11 _isModalSheet] & 1) != 0 || v46 == 17 || v46 == 4))
                {
                  double v137 = [v48 view];
                  [v137 window];
                  v139 = id v138 = v9;
                  [v139 _addRotationViewController:v11];

                  id v9 = v138;
                }
                if ([v11 _isModalSheet])
                {
                  __int16 v140 = [v11 view];
                  [v140 setTintAdjustmentMode:1];

                  v141 = [v48 transitionCoordinator];

                  __int16 v142 = [v48 presentingViewController];

                  if (v141)
                  {
                    BOOL v143 = v132;
                    __int16 v144 = [v48 transitionCoordinator];
                    id v145 = [v48 view];
                    v180[0] = MEMORY[0x1E4F143A8];
                    v180[1] = 3221225472;
                    if (v142)
                    {
                      CGRect v181 = __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_6;
                      CGRect v182 = &unk_1E52DA598;
                      uint64_t v146 = v48;
                      CGRect v183 = v146;
                      CGRect v174 = (UIViewController *)MEMORY[0x1E4F143A8];
                      uint64_t v175 = 3221225472;
                      CGFloat v147 = __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_7;
                    }
                    else
                    {
                      CGRect v181 = __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_4;
                      CGRect v182 = &unk_1E52DA598;
                      uint64_t v146 = v48;
                      CGRect v183 = v146;
                      CGRect v174 = (UIViewController *)MEMORY[0x1E4F143A8];
                      uint64_t v175 = 3221225472;
                      CGFloat v147 = __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_5;
                    }
                    CGRect v176 = v147;
                    CGRect v177 = &unk_1E52DB270;
                    CGRect v178 = v146;
                    CGRect v179 = v11;
                    [v144 animateAlongsideTransitionInView:v145 animation:v180 completion:&v174];

                    CGFloat v149 = v183;
                    long long v57 = v159;
                    BOOL v132 = v143;
                  }
                  else
                  {
                    CGFloat v148 = [v48 view];
                    CGFloat v149 = v148;
                    if (v142)
                    {
                      [v148 setTintAdjustmentMode:0];
                    }
                    else
                    {
                      CGFloat v153 = [v148 window];
                      [v153 _beginOcclusion:v48];
                    }
                  }

                  id v12 = v170;
                }
                if (v132)
                {
                  double v173 = 40.0;
                  CGFloat v150 = [v11 view];
                  [v150 bounds];
                  _UIViewCurlUpTransitionToTime(&v173, v151, v152);

                  -[UIViewController _addCurlUpTapGestureRecognizerWithRevealedHeight:](v11, v173);
                }
                if (v46 == 16 || v46 == 2)
                {
                  if ([v11 disablesAutomaticKeyboardDismissal]) {
                    [v11 _beginPinningInputViews];
                  }
                }

                id v8 = v167;
                goto LABEL_180;
              }
              if (v46 != 16) {
                goto LABEL_144;
              }
            }
            if (([v48[15] _isDimmingBackground] & 1) == 0
              && ([v11 _useCustomDimmingView] & 1) == 0)
            {
              uint64_t v108 = [UIDimmingView alloc];
              [v106 bounds];
              uint64_t v109 = -[UIDimmingView initWithFrame:](v108, "initWithFrame:");
              id v110 = v48[18];
              v48[18] = (id)v109;

              [v48[18] setAutoresizingMask:18];
              [v48[18] setIgnoresTouches:1];
              double v111 = [v11 _backgroundColorForModalFormSheet];
              [v48[18] setDimmingColor:v111];

              [v48[18] setSuppressesBackdrops:1];
              if (v46 == 3)
              {
                v112 = [v48 view];
                double v113 = [v112 superview];

                if (v113 == v106)
                {
                  v114 = v112;
                }
                else
                {
                  do
                  {
                    v114 = [v112 superview];

                    double v115 = [v114 superview];

                    v112 = v114;
                  }
                  while (v115 != v106);
                }
                [v106 insertSubview:v48[18] below:v114];

                id v12 = v170;
              }
              else
              {
                [v106 addSubview:v48[18]];
              }
              [(id)objc_opt_class() durationForTransition:v6];
              double v118 = v117;
              id v119 = v48[18];
              double v120 = 0.0;
              if (v6 == 6) {
                double v120 = v117 * UIAnimationDragCoefficient();
              }
              [v119 display:1 withAnimationDuration:v118 afterDelay:v120];
            }
            if (v46 != 4) {
              goto LABEL_144;
            }
            goto LABEL_143;
          }
        }
        uint64_t v37 = [*(id *)(v27 + 24) stringWithFormat:@"Application tried to present modally an active controller %@.", self];

        double v20 = (UIViewController *)v37;
        goto LABEL_49;
      }
    }
    else
    {
      double v29 = [(UIViewController *)v169 presentedViewController];
      if (v29 != self)
      {
        unint64_t v27 = 0x1E4F29000;
        goto LABEL_29;
      }
      unint64_t v27 = 0x1E4F29000;
      if ([(UIViewController *)self modalPresentationStyle] == UIModalPresentationFullScreen)
      {
        double v29 = self;
        goto LABEL_29;
      }
      uint64_t v116 = [v11 modalTransitionStyle];

      if (v116 != 3) {
        goto LABEL_30;
      }
    }
    uint64_t v28 = [*(id *)(v27 + 24) stringWithFormat:@"Application tried to present UIModalTransitionStylePartialCurl to or from non-fullscreen view controller %@.", self];
    double v29 = v20;
    double v20 = (UIViewController *)v28;
LABEL_29:

    goto LABEL_30;
  }
  uint64_t v10 = [[UIViewControllerBuiltinTransitionViewAnimator alloc] initWithTransition:v6];
  v171[0] = MEMORY[0x1E4F143A8];
  v171[1] = 3221225472;
  v171[2] = __68__UIViewController_presentViewController_withTransition_completion___block_invoke;
  v171[3] = &unk_1E52D9FE8;
  id v172 = v9;
  [(UIViewController *)self _presentViewController:v8 withAnimationController:v10 completion:v171];

LABEL_183:
}

uint64_t __68__UIViewController_presentViewController_withTransition_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __78__UIViewController__presentViewController_withAnimationController_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_7___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Application tried to represent an active popover presentation %@ from %@.", (uint8_t *)&v5, 0x16u);
  }
}

uint64_t __78__UIViewController__presentViewController_withAnimationController_completion___block_invoke_725(uint64_t a1, void *a2)
{
  return [a2 _childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter:*(void *)(a1 + 32)];
}

uint64_t __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter:*(void *)(a1 + 32)];
}

uint64_t __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _setPresentedStatusBarViewController:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _setPresentedUserInterfaceStyleViewController:v3];
}

void __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) view];
  id v2 = [v3 window];
  [v2 _beginOcclusion:*(void *)(a1 + 32)];
}

void __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_5(uint64_t a1, void *a2)
{
  if ([a2 isCancelled])
  {
    id v3 = [*(id *)(a1 + 32) view];
    uint64_t v4 = [v3 window];
    [v4 _endOcclusion:*(void *)(a1 + 32)];

    id v5 = [*(id *)(a1 + 40) view];
    [v5 setTintAdjustmentMode:0];
  }
}

void __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_6(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setTintAdjustmentMode:0];
}

void __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_7(uint64_t a1, void *a2)
{
  if ([a2 isCancelled])
  {
    id v3 = [*(id *)(a1 + 32) view];
    [v3 setTintAdjustmentMode:1];

    id v4 = [*(id *)(a1 + 40) view];
    [v4 setTintAdjustmentMode:0];
  }
}

- (void)_addCurlUpTapGestureRecognizerWithRevealedHeight:(void *)a1
{
  if (a1)
  {
    if ([a1 isViewLoaded])
    {
      id v4 = [a1 view];
      uint64_t v10 = [v4 gestureRecognizers];

      unint64_t v5 = 0;
      while (v5 < [(_UIDismissCurlUpTapGestureRecognizer *)v10 count])
      {
        uint64_t v6 = [(_UIDismissCurlUpTapGestureRecognizer *)v10 objectAtIndex:v5];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        ++v5;
        if (isKindOfClass) {
          goto LABEL_9;
        }
      }
    }
    uint64_t v10 = [(UITapGestureRecognizer *)[_UIDismissCurlUpTapGestureRecognizer alloc] initWithTarget:a1 action:sel__handleTapToDismissModalCurl_];
    *(float *)&double v8 = a2;
    [(_UIDismissCurlUpTapGestureRecognizer *)v10 _setCurlUpDY:v8];
    uint64_t v9 = [a1 view];
    [v9 addGestureRecognizer:v10];

LABEL_9:
  }
}

- (void)presentModalViewController:(id)a3 withTransition:(int)a4
{
}

void __63__UIViewController__presentViewController_animated_completion___block_invoke_3(uint64_t a1)
{
}

uint64_t __62__UIViewController_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) && (id v2 = *(void **)(a1 + 32)) != 0 && (v2[47] & 0x200000000) == 0) {
    uint64_t v3 = -[UIViewController _transitionForModalTransitionStyle:appearing:](*(void *)(a1 + 40), [v2 modalTransitionStyle], 1);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  return [v4 presentViewController:v5 withTransition:v3 completion:v6];
}

uint64_t __65__UIViewController__performCoordinatedPresentOrDismiss_animated___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentModalViewController:(UIViewController *)modalViewController animated:(BOOL)animated
{
}

- (void)_windowControllerTransitionDidCancel
{
  id v3 = [(UIViewController *)self childModalViewController];
  -[UIViewController _removeChildModalViewController:]((id *)&self->super.super.isa, v3);
}

- (void)dismissModalViewControllerWithTransition:(int)a3
{
}

- (void)_dismissViewControllerWithTransition:(int)a3 from:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  double v8 = (UIViewController *)a4;
  id v9 = a5;
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    uint64_t v15 = v8;
    id v16 = v9;
    if (!self) {
      goto LABEL_114;
    }
    uint64_t v17 = [(UIViewController *)v15 modalPresentationStyle];
    BOOL v18 = [(UIViewController *)v15 _isModalSheet];
    if (!v15) {
      goto LABEL_114;
    }
    id v103 = v8;
    BOOL v19 = v18;
    double v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v21 = [(UIViewController *)self _screen];
    [v20 removeObserver:v15 name:@"UIKeyboardPrivateWillShowNotification" object:v21];

    double v22 = [(UIViewController *)self _screen];
    id v102 = v20;
    [v20 removeObserver:v15 name:@"UIKeyboardPrivateWillHideNotification" object:v22];

    BOOL v99 = v19;
    if (v19 || v17 == 17 || v17 == 4)
    {
      UIModalTransitionStyle v23 = [(UIViewController *)v15 view];
      uint64_t v24 = [v23 window];
      [v24 _removeRotationViewController:v15];
    }
    double v25 = [(UIViewController *)v15 view];
    uint64_t v26 = [v25 superview];
    uint64_t v105 = v25;
    unint64_t v27 = [v25 window];
    uint64_t v28 = +[UIWindowController windowControllerForWindow:v27];
    double v29 = [v28 transitionView];

    if (v26 == v29)
    {
      NSLog(&cfstr_AttemptToDismi_1.isa, self, v15);
      long long v56 = v102;
      double v8 = v103;
LABEL_113:

LABEL_114:
      goto LABEL_115;
    }
    if ((v17 == 16 || v17 == 2)
      && [(UIViewController *)v15 disablesAutomaticKeyboardDismissal])
    {
      [(UIResponder *)v15 _endPinningInputViews];
    }
    BOOL v30 = [(UIViewController *)self definesPresentationContext];
    if (v6)
    {
      if (v6 != 9
        || (v17 == 3 ? (BOOL v31 = v30) : (BOOL v31 = 0),
            v31
         && [(UIViewController *)self providesPresentationContextTransitionStyle]))
      {
        id v32 = v16;
        id v33 = v9;
        char v34 = 1;
        uint64_t v35 = self;
      }
      else
      {
        id v32 = v16;
        id v33 = v9;
        char v34 = 0;
        uint64_t v35 = v15;
      }
      long long v59 = v35;
      -[UIViewController _customAnimatorForDismissedController:](v59, v15);
      long long v60 = (UIViewControllerBuiltinTransitionViewAnimator *)objc_claimAutoreleasedReturnValue();
      BOOL v98 = v60 != 0;
      if (v60)
      {
        long long v57 = v60;
        double v101 = -[UIViewController _customInteractionControllerForDismissal:](v59, v60);

        BOOL v58 = v6 != 0;
        if (v58 && v17 == 4) {
          uint64_t v17 = 4;
        }
LABEL_61:
        id v9 = v33;
LABEL_62:
        id v16 = v32;
        if (v17 == 1 && v6 == 12)
        {
          if (UIKeyboardAutomaticIsOffScreen())
          {
            uint64_t v17 = 1;
            uint64_t v6 = 12;
            BOOL v58 = 1;
          }
          else
          {
            memset(&buf, 0, sizeof(buf));
            int64_t v62 = [(UIViewController *)self _lastKnownInterfaceOrientation];
            double v63 = 0.0;
            if (v62 != 1)
            {
              if ([(UIViewController *)self _lastKnownInterfaceOrientation] == 4)
              {
                double v63 = -1.57079633;
              }
              else if ([(UIViewController *)self _lastKnownInterfaceOrientation] == 3)
              {
                double v63 = 1.57079633;
              }
              else
              {
                int64_t v64 = [(UIViewController *)self _lastKnownInterfaceOrientation];
                double v63 = 3.14159265;
                if (v64 != 2) {
                  double v63 = 0.0;
                }
              }
            }
            +[UIScreen transformToRotateScreen:v63];
            double v65 = [(UIViewController *)v15 _visibleView];
            [v65 frame];
            CGAffineTransform v114 = buf;
            CGRect v119 = CGRectApplyAffineTransform(v118, &v114);
            CGFloat x = v119.origin.x;
            CGFloat y = v119.origin.y;
            CGFloat width = v119.size.width;
            double height = v119.size.height;

            +[UIKeyboard sizeForInterfaceOrientation:[(UIViewController *)self _lastKnownInterfaceOrientation]];
            CGFloat v71 = height - (v70 + -10.0);
            BOOL v72 = +[UIView areAnimationsEnabled];
            +[UIView setAnimationsEnabled:0];
            CGAffineTransform newValue = buf;
            CGAffineTransformInvert(&v114, &newValue);
            v120.origin.CGFloat x = x;
            v120.origin.CGFloat y = y;
            v120.size.CGFloat width = width;
            v120.size.double height = v71;
            CGRect v121 = CGRectApplyAffineTransform(v120, &v114);
            double v73 = v121.origin.x;
            double v74 = v121.origin.y;
            double v75 = v121.size.width;
            double v76 = v121.size.height;
            uint64_t v77 = [(UIViewController *)v15 _visibleView];
            objc_msgSend(v77, "setFrame:", v73, v74, v75, v76);

            +[UIView setAnimationsEnabled:v72];
            uint64_t v17 = 1;
            uint64_t v6 = 12;
            BOOL v58 = 1;
            id v16 = v32;
          }
        }
        goto LABEL_83;
      }
      if ((v34 & 1) == 0) {
        uint64_t v6 = -[UIViewController _transitionForModalTransitionStyle:appearing:]((uint64_t)self, [(UIViewController *)v15 modalTransitionStyle], 0);
      }
      long long v57 = [[UIViewControllerBuiltinTransitionViewAnimator alloc] initWithTransition:v6];

      double v101 = 0;
      BOOL v58 = v6 != 0;
      if (v17 != 4) {
        goto LABEL_61;
      }
      id v9 = v33;
      if (!v6) {
        goto LABEL_62;
      }
      NSLog(&cfstr_WarningUimodal_0.isa, v15, self);
      uint64_t v17 = 0;
      BOOL v98 = 0;
      double v101 = 0;
      BOOL v58 = 1;
      id v16 = v32;
    }
    else
    {
      BOOL v98 = 0;
      double v101 = 0;
      long long v57 = 0;
      BOOL v58 = 0;
    }
LABEL_83:
    id v100 = v57;
    uint64_t v78 = [[UIViewControllerAction alloc] initWithViewController:v15 name:@"DismissModal" transition:v6];
    currentAction = self->_currentAction;
    self->_currentAction = v78;

    uint64_t v80 = [(UIViewController *)self currentAction];
    *(void *)&newValue.a = MEMORY[0x1E4F143A8];
    *(void *)&newValue.b = 3221225472;
    *(void *)&newValue.c = __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke;
    *(void *)&newValue.d = &unk_1E52D9FE8;
    *(void *)&newValue.tCGFloat x = v16;
    if (v80) {
      objc_setProperty_nonatomic_copy(v80, v81, &newValue, 24);
    }

    uint64_t v82 = 16;
    if (v58) {
      uint64_t v82 = 4194320;
    }
    *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFFFBFFFFFLL | v82;
    [(id)objc_opt_class() durationForTransition:v6];
    if (v6 == 6) {
      double v83 = 0.0;
    }
    objc_msgSend(self->_dimmingView, "display:withAnimationDuration:afterDelay:", 0, v83);
    id dimmingView = self->_dimmingView;
    self->_id dimmingView = 0;

    uint64_t v85 = [(UIViewController *)v15 view];
    id v86 = [v85 window];
    id v87 = +[UIWindowController windowControllerForWindow:v86];

    id v88 = [(UIViewController *)self _popoverController];
    id v89 = +[UIDevice currentDevice];
    uint64_t v90 = [v89 userInterfaceIdiom];

    if (v17 != 3
      || (v90 & 0xFFFFFFFFFFFFFFFBLL) != 1
      || [(UIViewController *)self modalPresentationStyle] == 16
      || [(UIViewController *)self modalPresentationStyle] == UIModalPresentationFormSheet
      || [(UIViewController *)self modalPresentationStyle] == UIModalPresentationPageSheet
      || !v88)
    {
      *(void *)&buf.a = MEMORY[0x1E4F143A8];
      *(void *)&buf.b = 3221225472;
      *(void *)&buf.c = __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_2;
      *(void *)&buf.d = &unk_1E52DC3D0;
      BOOL v116 = v99;
      *(void *)&buf.tCGFloat x = self;
      uint64_t v91 = v15;
      *(void *)&buf.tCGFloat y = v91;
      id v92 = (void (**)(void))_Block_copy(&buf);
      if (v87)
      {
        if (v100) {
          char v93 = v98;
        }
        else {
          char v93 = 1;
        }
        if ((v93 & 1) == 0) {
          [(UIViewControllerBuiltinTransitionViewAnimator *)v100 setDelegate:v87];
        }
        [v87 _setTransitionController:v100];
        [v87 _setInteractionController:v101];
        v112[0] = MEMORY[0x1E4F143A8];
        v112[1] = 3221225472;
        v112[2] = __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_7;
        v112[3] = &unk_1E52D9F70;
        v112[4] = self;
        [v87 _transition:v6 fromViewController:v91 toViewController:self target:self didFinish:2 animation:v112];
        v92[2](v92);
        double v8 = v103;
      }
      else
      {
        [(UIViewController *)self _didFinishDismissTransition];
        double v8 = v103;
      }
    }
    else
    {
      [v88 _modalTransition:v6 fromViewController:v15 toViewController:self target:self didFinish:2];
      [(UIViewController *)v15 setModalInPresentation:(*(void *)&v15->_viewControllerFlags >> 14) & 1];
      *(void *)&v15->_viewControllerFlags &= ~0x4000uLL;
      double v8 = v103;
    }
    long long v56 = v102;
    v15->_lastKnownInterfaceOrientation = 0;
    if (!v6)
    {
      uint64_t v94 = [(UIViewController *)self view];
      [v94 _clearAnimationFilters];
    }
    if (self->_modalPreservedFirstResponder)
    {
      if (-[UIResponder _containsResponder:](self, "_containsResponder:")
        && [(UIResponder *)self->_modalPreservedFirstResponder _canBecomeFirstResponderWhenPossible])
      {
        v95 = -[UIViewController _keyboardSceneDelegate](self);
        uint64_t v96 = [MEMORY[0x1E4F29238] valueWithPointer:self];
        [v95 _restoreInputViewsWithId:v96 animated:1];

        [(UIResponder *)self->_modalPreservedFirstResponder _clearBecomeFirstResponderWhenCapable];
      }
      modalPreservedFirstResponder = self->_modalPreservedFirstResponder;
      self->_modalPreservedFirstResponder = 0;
    }
    goto LABEL_113;
  }
  uint64_t v10 = [(UIViewController *)self _presentationController];

  if (v10)
  {
    long long v11 = [(UIViewController *)self _presentationController];
    id v12 = [v11 _transitionContext];

    double v13 = [v12 _animator];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v13 shouldPreemptWithContext:v12])
    {
      char v14 = [v13 preemptWithContext:v12];
    }
    else
    {
      char v14 = 0;
    }
    [(UIViewController *)v8 _presentingViewControllerWillChange:0];
    double v36 = [(UIViewController *)v8 _overrideTransitioningDelegate];
    if (v36)
    {
    }
    else if (!v6 {
           || !+[UIViewController _shouldAnimateTransitions])
    }
    {
      id v40 = [[UIViewControllerBuiltinTransitionViewAnimator alloc] initWithTransition:0];
      if (v40)
      {
LABEL_36:
        uint64_t v104 = v13;
        id v42 = v8;
        uint64_t v106 = v12;
        if ([(UIViewController *)self definesPresentationContext])
        {
          uint64_t v43 = [(UIViewController *)self _presentationController];
          int v44 = [v43 _shouldRespectDefinesPresentationContext];

          BOOL v45 = v6 == 0;
          if (v6) {
            BOOL v46 = v6 != 9;
          }
          else {
            BOOL v46 = 0;
          }
          if (!v46 && v44) {
            BOOL v46 = [(UIViewController *)self providesPresentationContextTransitionStyle];
          }
        }
        else
        {
          BOOL v45 = v6 == 0;
          if (v6) {
            BOOL v46 = v6 != 9;
          }
          else {
            BOOL v46 = 0;
          }
        }
        if (v46) {
          double v47 = self;
        }
        else {
          double v47 = v42;
        }
        double v48 = v47;
        double v49 = v48;
        if (!v40)
        {
          -[UIViewController _customAnimatorForDismissedController:](v48, v42);
          int v55 = (UIViewControllerBuiltinTransitionViewAnimator *)objc_claimAutoreleasedReturnValue();
          if (v55)
          {
            id v40 = v55;
            id v51 = -[UIViewController _customInteractionControllerForDismissal:](v49, v55);
            if (v51) {
              goto LABEL_51;
            }
          }
          else
          {
            long long v61 = [(UIViewController *)self _presentationController];
            id v40 = [v61 _preferredAnimationControllerForDismissal];

            if (!v40)
            {
              if (!v45 && !v46) {
                uint64_t v6 = -[UIViewController _transitionForModalTransitionStyle:appearing:]((uint64_t)self, [(UIViewController *)v42 modalTransitionStyle], 0);
              }
              id v40 = [[UIViewControllerBuiltinTransitionViewAnimator alloc] initWithTransition:v6];
            }
          }
        }
        id v50 = [(UIViewController *)self _presentationController];
        id v51 = [v50 _preferredInteractionControllerForDismissal:v40];

LABEL_51:
        v107[0] = MEMORY[0x1E4F143A8];
        v107[1] = 3221225472;
        v107[2] = __73__UIViewController__dismissViewControllerWithTransition_from_completion___block_invoke;
        v107[3] = &unk_1E52E8FE8;
        v107[4] = self;
        uint64_t v108 = v40;
        id v109 = v51;
        id v110 = v14;
        id v111 = v9;
        id v52 = v14;
        id v53 = v51;
        int v54 = v40;
        +[UIView _conditionallyPerformWithoutAnimation:v6 == 0 layout:v107];

        double v8 = v42;
        goto LABEL_115;
      }
    }
    uint64_t v37 = [(UIViewController *)self _presentationController];
    int v38 = [v37 _forcesPreferredAnimationControllers];

    if (v38)
    {
      double v39 = [(UIViewController *)self _presentationController];
      id v40 = [v39 _preferredAnimationControllerForDismissal];
    }
    else
    {
      id v40 = 0;
    }
    goto LABEL_36;
  }
  id v41 = *(NSObject **)(__UILogGetCategoryCachedImpl("Presentation", &_dismissViewControllerWithTransition_from_completion____s_category)+ 8);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.a) = 138412290;
    *(void *)((char *)&buf.a + 4) = self;
    _os_log_impl(&dword_1853B0000, v41, OS_LOG_TYPE_DEFAULT, "Cannot dismiss %@ because there is no _presentationController.", (uint8_t *)&buf, 0xCu);
  }
LABEL_115:
}

void __73__UIViewController__dismissViewControllerWithTransition_from_completion___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v1 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 48);
  id v3 = *(void **)(a1 + 56);
  id v4 = *(void **)(a1 + 64);
  id v5 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v29 = v4;
  if (v1)
  {
    uint64_t v8 = objc_opt_class();
    if (v8 == objc_opt_class())
    {
      uint64_t v9 = [v5 transition];
      BOOL v10 = v9 != 0;
    }
    else
    {
      uint64_t v9 = 0;
      BOOL v10 = 1;
    }
    long long v11 = [v1 _presentationController];
    id v12 = [v11 presentedViewController];
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v14 = v1[20];
    uint64_t v15 = v7;
    if (has_internal_diagnostics)
    {
      if (v14)
      {
        unint64_t v27 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v12;
          _os_log_fault_impl(&dword_1853B0000, v27, OS_LOG_TYPE_FAULT, "Failed to complete already running transition on %@.", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    else if (v14)
    {
      uint64_t v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_dismissViewControllerWithAnimationController_interactionController_handoffData_completion____s_category)+ 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "Failed to complete already running transition on %@.", (uint8_t *)&buf, 0xCu);
      }
    }
    id v16 = [[UIViewControllerAction alloc] initWithViewController:v12 name:@"DismissModal" transition:v9];
    uint64_t v17 = (void *)v1[20];
    v1[20] = v16;

    BOOL v18 = [v1 currentAction];
    newValue[0] = MEMORY[0x1E4F143A8];
    newValue[1] = 3221225472;
    newValue[2] = __111__UIViewController__dismissViewControllerWithAnimationController_interactionController_handoffData_completion___block_invoke;
    newValue[3] = &unk_1E52D9FE8;
    id v34 = v29;
    if (v18) {
      objc_setProperty_nonatomic_copy(v18, v19, newValue, 24);
    }

    uint64_t v20 = 16;
    if (v10) {
      uint64_t v20 = 4194320;
    }
    v1[47] = v1[47] & 0xFFFFFFFFFFBFFFFFLL | v20;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    double v36 = __111__UIViewController__dismissViewControllerWithAnimationController_interactionController_handoffData_completion___block_invoke_2;
    uint64_t v37 = &unk_1E52EA148;
    id v21 = v11;
    id v38 = v21;
    double v39 = v1;
    uint64_t v43 = sel__dismissViewControllerWithAnimationController_interactionController_handoffData_completion_;
    id v40 = v5;
    id v41 = v6;
    id v7 = v15;
    id v42 = v15;
    +[UIView _conditionallyPerformWithoutAnimation:!v10 layout:&buf];
    double v22 = [v1 _tabBarControllerEnforcingClass:1];
    [v22 _viewControllerDidBeginDismissal:v1];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __111__UIViewController__dismissViewControllerWithAnimationController_interactionController_handoffData_completion___block_invoke_3;
    aBlock[3] = &unk_1E52DB270;
    UIModalTransitionStyle v23 = v12;
    id v31 = v23;
    id v32 = v1;
    uint64_t v24 = (void (**)(void *, void *))_Block_copy(aBlock);
    double v25 = [v1 _definiteTransitionCoordinator];
    v24[2](v24, v25);
    if ((dyld_program_sdk_at_least() & 1) != 0
      || [(id)objc_opt_class() instancesRespondToSelector:sel_notifyWhenInteractionChangesUsingBlock_])
    {
      [v25 notifyWhenInteractionChangesUsingBlock:v24];
    }
    if (v23) {
      v23[33] = 0;
    }
    if (!v9)
    {
      uint64_t v26 = [v1 view];
      [v26 _clearAnimationFilters];
    }
  }
}

uint64_t __111__UIViewController__dismissViewControllerWithAnimationController_interactionController_handoffData_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __111__UIViewController__dismissViewControllerWithAnimationController_interactionController_handoffData_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  id v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = *(void *)(a1 + 72);
    double v13 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v14 = [v13 presentingViewController];
    [v10 handleFailureInMethod:v11, v12, @"UIViewController.m", 10726, @"Attempt to dismiss %@, which has a presentingViewController of %@, expected %@", v13, v14, *(void *)(a1 + 40) object file lineNumber description];
  }
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = +[UIView areAnimationsEnabled];
  uint64_t v8 = *(void *)(a1 + 64);
  return [v4 _dismissWithAnimationController:v5 interactionController:v6 animated:v7 handoffData:v8];
}

void __111__UIViewController__dismissViewControllerWithAnimationController_interactionController_handoffData_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (([v6 isCancelled] & 1) != 0 || objc_msgSend(v6, "isInteractive")) {
    id v3 = *(void **)(a1 + 32);
  }
  else {
    id v3 = 0;
  }
  id v4 = *(void **)(a1 + 40);
  id v5 = v3;
  [v4 _setPresentedStatusBarViewController:v5 shouldJoinAnimationsInProgress:dyld_program_sdk_at_least() ^ 1];
  [*(id *)(a1 + 40) _setPresentedUserInterfaceStyleViewController:v5];
}

- (void)_restoreInputViewsForPresentation
{
  if (!self->_modalPreservedFirstResponder) {
    return;
  }
  id v3 = -[UIViewController _keyboardSceneDelegate](self);
  id v4 = [MEMORY[0x1E4F29238] valueWithPointer:self];
  [v3 _restoreInputAccessoryViewOverrideWithId:v4];

  if ([(UIResponder *)self _containsResponder:self->_modalPreservedFirstResponder])
  {
    BOOL v5 = +[UIView areAnimationsEnabled];
    id v6 = [(UIViewController *)self presentedViewController];
    objc_getClass("UIActivityViewController");
    if (objc_opt_isKindOfClass())
    {
      BOOL v7 = [v6 _existingPresentationControllerImmediate:1 effective:0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v8 = [v6 _existingPresentationControllerImmediate:1 effective:1];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        BOOL v7 = -[UIViewController _keyboardSceneDelegate](self);
        [v7 popAnimationStyle];
        goto LABEL_7;
      }
    }
LABEL_8:
    BOOL v10 = -[UIViewController _keyboardSceneDelegate](self);
    uint64_t v11 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v10 _restoreInputViewsWithId:v11 animated:v5];

    [(UIResponder *)self->_modalPreservedFirstResponder _clearBecomeFirstResponderWhenCapable];
  }
  modalPreservedFirstResponder = self->_modalPreservedFirstResponder;
  self->_modalPreservedFirstResponder = 0;
}

uint64_t __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) transitionCoordinator];

    id v3 = [*(id *)(a1 + 32) presentingViewController];

    id v4 = *(void **)(a1 + 32);
    if (v2)
    {
      BOOL v5 = [v4 transitionCoordinator];
      id v6 = [*(id *)(a1 + 32) view];
      if (v3)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_5;
        v14[3] = &unk_1E52DA598;
        uint64_t v15 = *(void *)(a1 + 32);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_6;
        v12[3] = &unk_1E52DB270;
        v12[4] = v15;
        id v13 = *(id *)(a1 + 40);
        [v5 animateAlongsideTransitionInView:v6 animation:v14 completion:v12];

        BOOL v7 = v13;
      }
      else
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_3;
        v18[3] = &unk_1E52DA598;
        uint64_t v19 = *(void *)(a1 + 32);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_4;
        v16[3] = &unk_1E52DB270;
        v16[4] = v19;
        id v17 = *(id *)(a1 + 40);
        [v5 animateAlongsideTransitionInView:v6 animation:v18 completion:v16];

        BOOL v7 = v17;
      }
    }
    else
    {
      uint64_t v8 = [v4 view];
      uint64_t v9 = v8;
      if (v3)
      {
        [v8 setTintAdjustmentMode:1];
      }
      else
      {
        BOOL v10 = [v8 window];
        [v10 _endOcclusion:*(void *)(a1 + 32)];
      }
      id v11 = [*(id *)(a1 + 40) view];
      [v11 setTintAdjustmentMode:0];
    }
  }
}

void __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) view];
  id v2 = [v3 window];
  [v2 _endOcclusion:*(void *)(a1 + 32)];
}

void __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_4(uint64_t a1, void *a2)
{
  if ([a2 isCancelled])
  {
    id v4 = [*(id *)(a1 + 32) view];
    id v3 = [v4 window];
    [v3 _beginOcclusion:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) view];
    [v4 setTintAdjustmentMode:0];
  }
}

void __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setTintAdjustmentMode:1];
}

void __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_6(uint64_t a1, void *a2)
{
  int v3 = [a2 isCancelled];
  uint64_t v4 = 40;
  if (v3) {
    uint64_t v4 = 32;
  }
  id v5 = [*(id *)(a1 + v4) view];
  [v5 setTintAdjustmentMode:0];
}

uint64_t __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) _setPresentedStatusBarViewController:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 _setPresentedUserInterfaceStyleViewController:0];
}

- (void)dismissModalViewControllerAnimated:(BOOL)animated
{
  if (animated) {
    uint64_t v3 = 9;
  }
  else {
    uint64_t v3 = 0;
  }
  [(UIViewController *)self dismissViewControllerWithTransition:v3 completion:0];
}

void __61__UIViewController_dismissViewControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__UIViewController_dismissViewControllerAnimated_completion___block_invoke_3;
  v3[3] = &unk_1E52E3538;
  id v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  char v5 = *(unsigned char *)(a1 + 48);
  +[UIViewController _performWithoutDeferringTransitionsAllowingAnimation:actions:]((uint64_t)UIViewController, 1, v3);
}

void __61__UIViewController_dismissViewControllerAnimated_completion___block_invoke_3(uint64_t a1)
{
}

- (BOOL)transitionViewShouldUseViewControllerCallbacks
{
  return 0;
}

- (void)_didCancelPresentTransition:(id)a3
{
  id v8 = a3;
  if ([v8 _isPresentation] && !_UIAppUseModernRotationAndPresentationBehaviors())
  {
    id v4 = [v8 fromViewController];
    char v5 = [v4 customTransitioningView];
    id v6 = [v5 superview];
    BOOL v7 = [v4 view];
    [v6 insertSubview:v7 aboveSubview:v5];

    [v5 removeFromSuperview];
  }
  [(UIViewController *)self _restoreInputViewsForPresentation];
  *(void *)&self->_viewControllerFlags &= 0xFFFFFFFFFFBFFFEFLL;
  [(UIViewController *)self _cleanupPresentation];
}

- (void)_legacyModalPresentTransitionDidComplete
{
  if ((*(void *)&self->_viewControllerFlags & 0x200) == 0)
  {
    uint64_t v3 = [(UIViewController *)self currentAction];
    if (v3) {
      BOOL v4 = v3[4] != 0;
    }
    else {
      BOOL v4 = 0;
    }

    [(UIViewController *)self viewDidDisappear:v4];
    char v5 = [(UIViewController *)self childModalViewController];
    [v5 viewDidAppear:v4];
  }
  [(UIViewController *)self _didFinishPresentTransition];
}

- (void)_didFinishDismissTransition
{
  id v13 = [(UIViewController *)self childModalViewController];
  if (!_UIAppUseModernRotationAndPresentationBehaviors() && [v13 _isModalSheet])
  {
    uint64_t v3 = [v13 dropShadowView];
    if (v3) {
      [v13 setDropShadowView:0];
    }
  }
  uint64_t v4 = [(UIViewController *)self customTransitioningView];
  if (v4)
  {
    char v5 = (void *)v4;
    BOOL v6 = _UIAppUseModernRotationAndPresentationBehaviors();

    if (!v6)
    {
      BOOL v7 = [(UIViewController *)self customTransitioningView];
      id v8 = [v7 superview];

      uint64_t v9 = [(UIViewController *)self view];
      BOOL v10 = [(UIViewController *)self customTransitioningView];
      [v8 insertSubview:v9 aboveSubview:v10];

      id v11 = [(UIViewController *)self customTransitioningView];
      [v11 removeFromSuperview];

      [(UIViewController *)self setCustomTransitioningView:0];
    }
  }
  [v13 _setModalSourceViewController:0];
  [v13 _setSegueResponsibleForModalPresentation:0];
  *(void *)&self->_viewControllerFlags &= 0xFFFFFFFFFFBFFFEFLL;
  [(UIViewController *)self _cleanupPresentation];
  uint64_t v12 = [(UIViewController *)self _popoverController];
  [v12 _containedViewControllerModalStateChanged];
}

- (void)_cleanupPresentation
{
  id v5 = [(UIViewController *)self childModalViewController];
  -[UIViewController _removeChildModalViewController:]((id *)&self->super.super.isa, v5);
  currentAction = self->_currentAction;
  self->_currentAction = 0;

  uint64_t v4 = [(UIViewController *)self _rootAncestorViewController];
  [v4 setNeedsUpdateOfSupportedInterfaceOrientations];

  [(UIViewController *)self _setPresentationController:0];
  [(UIViewController *)self _setOriginalPresentationController:0];
}

- (void)_didCancelDismissTransition:(id)a3
{
  *(void *)&self->_viewControllerFlags &= 0xFFFFFFFFFFBFFFEFLL;
  currentAction = self->_currentAction;
  self->_currentAction = 0;
}

- (void)_clearCachedPopoverContentSize
{
  -[UIViewController popoverPresentationController:](self, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _clearCachedPopoverContentSize];
}

- (BOOL)providesPresentationContextTransitionStyle
{
  return (*(void *)&self->_viewControllerFlags >> 19) & 1;
}

- (void)setProvidesPresentationContextTransitionStyle:(BOOL)providesPresentationContextTransitionStyle
{
  uint64_t v3 = 0x80000;
  if (!providesPresentationContextTransitionStyle) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFFFF7FFFFLL | v3;
}

+ (id)_viewControllerForFullScreenPresentationFromView:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"UIViewController.m", 11331, @"Invalid parameter not satisfying: %@", @"view" object file lineNumber description];
  }
  BOOL v6 = [v5 _viewControllerForAncestor];
  BOOL v7 = [v6 _popoverController];
  id v8 = [v7 contentViewController];

  uint64_t v9 = [v5 _window];
  BOOL v10 = v9;
  if (v8 || ([v9 rootViewController], (id v8 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v11 = [v8 presentedViewController];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      do
      {
        id v13 = v12;

        uint64_t v12 = [v13 presentedViewController];

        id v8 = v13;
      }
      while (v12);
    }
    else
    {
      id v13 = v8;
    }
    uint64_t v14 = [v13 _existingView];
    uint64_t v15 = [v14 window];

    if (v15 == v10)
    {
      id v8 = v13;
    }
    else
    {
      NSLog(&cfstr_SWindowIsNotEq.isa, v5, v13);
      id v8 = 0;
    }
  }
  return v8;
}

- (void)_handleTapToDismissModalCurl:(id)a3
{
  id v6 = a3;
  if ([v6 state] == 3)
  {
    uint64_t v4 = [(UIViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];

    id v5 = [v6 view];
    [v5 removeGestureRecognizer:v6];
  }
}

+ (double)durationForTransition:(int)a3
{
  +[UITransitionView defaultDurationForTransition:*(void *)&a3];
  return result;
}

- (void)_showViewController:(id)a3 withAction:(SEL)a4 sender:(id)a5
{
  id v12 = a3;
  id v8 = (UIViewController *)a5;
  uint64_t v9 = [(UIViewController *)self targetViewControllerForAction:a4 sender:v8];
  if (v9)
  {
    BOOL v10 = (void *)v9;
    if (v8) {
      self = v8;
    }
    if (dyld_program_sdk_at_least()) {
      objc_msgSend(v10, a4, v12, self);
    }
    else {
      objc_msgSend(v10, sel_performSelector_withObject_withObject_, a4, v12, self);
    }
  }
  else
  {
    uint64_t v11 = [(UIViewController *)self view];
    BOOL v10 = +[UIViewController _viewControllerForFullScreenPresentationFromView:v11];

    if (!v10) {
      goto LABEL_10;
    }
    objc_msgSend(v10, "presentViewController:animated:completion:", v12, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
  }

LABEL_10:
}

- (void)showViewController:(UIViewController *)vc sender:(id)sender
{
}

- (void)showDetailViewController:(UIViewController *)vc sender:(id)sender
{
}

- (id)_nextViewController
{
  uint64_t v3 = -[UIViewController _parentViewController]((id *)&self->super.super.isa);
  if (!v3)
  {
    uint64_t v4 = [(UIViewController *)self _popoverController];
    uint64_t v3 = [v4 _managingSplitViewController];
  }
  return v3;
}

- (UIViewController)targetViewControllerForAction:(SEL)action sender:(id)sender
{
  id v6 = sender;
  if ([(UIViewController *)self canPerformAction:action withSender:v6]
    && [(id)objc_opt_class() doesOverrideViewControllerMethod:action])
  {
    BOOL v7 = self;
  }
  else
  {
    id v8 = [(UIViewController *)self _nextViewController];
    BOOL v7 = [v8 targetViewControllerForAction:action sender:v6];
  }
  return v7;
}

+ (BOOL)_shouldSendLegacyMethodsFromViewWillTransitionToSize
{
  return [a1 doesOverrideViewControllerMethod:sel_viewWillTransitionToSize_withTransitionCoordinator_] ^ 1;
}

uint64_t __71__UIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) willAnimateRotationToInterfaceOrientation:*(void *)(a1 + 40) duration:*(double *)(a1 + 48)];
}

uint64_t __71__UIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didRotateFromInterfaceOrientation:*(void *)(a1 + 40)];
}

uint64_t __100__UIViewController__sendViewWillTransitionToSizeToPresentationController_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _shouldFreezeUnderlapsStatusBar];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    unint64_t v4 = *(void *)(v3 + 376);
    *(void *)(v3 + 376) = v4 | 0x10000000000;
    uint64_t v5 = (v4 >> 40) & 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 40), "viewWillTransitionToSize:withTransitionCoordinator:", *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  if (v2) {
    *(void *)(*(void *)(a1 + 32) + 376) = *(void *)(*(void *)(a1 + 32) + 376) & 0xFFFFFEFFFFFFFFFFLL | ((unint64_t)(v5 & 1) << 40);
  }
  return result;
}

- (id)registerForPreviewingWithDelegate:(id)delegate sourceView:(UIView *)sourceView
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = delegate;
  BOOL v7 = sourceView;
  previewSourceViews = self->_previewSourceViews;
  if (!previewSourceViews)
  {
    uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v10 = self->_previewSourceViews;
    self->_previewSourceViews = v9;

    previewSourceViews = self->_previewSourceViews;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = previewSourceViews;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v16, "sourceView", (void)v20);
        id v17 = (UIView *)objc_claimAutoreleasedReturnValue();

        if (v17 == v7)
        {
          id v18 = v16;

          goto LABEL_13;
        }
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  _UIPreviewingContextForViewController(self, v7);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  [v18 setDelegate:v6];
  [(NSMutableArray *)self->_previewSourceViews addObject:v18];
LABEL_13:

  return v18;
}

- (void)unregisterPreviewing:(id)a3
{
  id v4 = a3;
  [v4 unregister];
  [(NSMutableArray *)self->_previewSourceViews removeObject:v4];
}

- (void)registerPreviewSourceView:(id)a3 previewingDelegate:(id)a4
{
  id v4 = [(UIViewController *)self registerForPreviewingWithDelegate:a4 sourceView:a3];
}

- (void)unregisterPreviewSourceView:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_previewSourceViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      objc_msgSend(v10, "sourceView", (void)v13);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    uint64_t v12 = v10;

    if (!v12) {
      goto LABEL_13;
    }
    [(UIViewController *)self unregisterPreviewing:v12];
    uint64_t v5 = v12;
  }
LABEL_12:

LABEL_13:
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel__prepareForTapGesture_ == a3) {
    return [(NSMutableArray *)self->_previewSourceViews count] != 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)UIViewController;
  return -[UIResponder canPerformAction:withSender:](&v5, sel_canPerformAction_withSender_);
}

+ (void)_sendPrepareForTapGesture:(uint64_t)a1
{
  id v6 = a2;
  self;
  id v2 = [v6 _viewControllerForAncestor];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
    do
    {
      if ([v4 canPerformAction:sel__prepareForTapGesture_ withSender:v6]) {
        break;
      }
      uint64_t v5 = [v4 _nextViewController];

      id v4 = (void *)v5;
    }
    while (v5);
  }
  else
  {
    id v4 = 0;
  }
  [v4 _prepareForTapGesture:v6];
}

- (void)_prepareForTapGesture:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_previewSourceViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        BOOL v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "sourceView", (void)v13);
        int v11 = [v4 isDescendantOfView:v10];

        if (v11)
        {
          uint64_t v12 = +[_UIStatistics previewInteractionTapCount];
          [v12 setSampleRate:1.0];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)previewActions
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (NSArray)previewActionItems
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [(UIViewController *)self previewMenuItems];
  if ([v2 count])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v18 = v2;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v10 = [v9 _subitems];
          if (v10
            && (int v11 = (void *)v10,
                [v9 _subitems],
                uint64_t v12 = objc_claimAutoreleasedReturnValue(),
                uint64_t v13 = [v12 count],
                v12,
                v11,
                v13))
          {
            uint64_t v14 = +[UIPreviewActionGroup _actionGroupWithPreviewMenuItemWithSubactions:v9];
          }
          else
          {
            uint64_t v14 = +[UIPreviewAction _actionWithPreviewMenuItem:v9];
          }
          long long v15 = (void *)v14;
          if (v14) {
            [v3 addObject:v14];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }

    long long v16 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

    id v2 = v18;
  }
  else
  {
    long long v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v16;
}

- (id)leadingPreviewAction
{
  return 0;
}

- (id)trailingPreviewAction
{
  return 0;
}

- (id)previewMenuItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(UIViewController *)self previewActions];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
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
        uint64_t v9 = +[UIPreviewMenuItem itemWithViewControllerPreviewAction:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return v10;
}

- (id)_viewControllersForRotationCallbacks
{
  parentViewController = self->_parentViewController;
  if (parentViewController)
  {
    id v4 = [(UIViewController *)parentViewController _viewControllersForRotationCallbacks];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = self;
    uint64_t v6 = [(UIViewController *)v5 presentedViewController];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      do
      {
        uint64_t v8 = v7;

        uint64_t v7 = [(UIViewController *)v8 presentedViewController];

        uint64_t v5 = v8;
      }
      while (v7);
    }
    else
    {
      uint64_t v8 = v5;
    }
    uint64_t v9 = [(UIViewController *)v8 modalPresentationStyle];
    [v4 addObject:v8];
    if (v9)
    {
      uint64_t v10 = [(UIViewController *)v8 presentingViewController];
      uint64_t v11 = [v10 modalPresentationStyle];
      if (v10)
      {
        while (1)
        {
          uint64_t v12 = v9;
          uint64_t v9 = v11;
          long long v13 = [v10 _existingView];
          long long v14 = [v13 window];

          if (v14)
          {
            if (v9 != v12 || (unint64_t)(v12 - 1) >= 2)
            {
              [v4 addObject:v10];
              if (!v9) {
                break;
              }
            }
          }
          long long v15 = [v10 presentingViewController];

          uint64_t v11 = [v15 modalPresentationStyle];
          uint64_t v10 = v15;
          if (!v15) {
            goto LABEL_17;
          }
        }
      }
    }
LABEL_17:
  }
  return v4;
}

- (void)_beginDisablingInterfaceAutorotation
{
  id v3 = [(UIViewController *)self view];
  id v2 = [v3 window];
  [v2 beginDisablingInterfaceAutorotation];
}

- (void)_endDisablingInterfaceAutorotation
{
  id v3 = [(UIViewController *)self view];
  id v2 = [v3 window];
  [v2 endDisablingInterfaceAutorotation];
}

- (BOOL)_isInterfaceAutorotationDisabled
{
  id v2 = [(UIViewController *)self view];
  id v3 = [v2 window];
  char v4 = [v3 isInterfaceAutorotationDisabled];

  return v4;
}

- (void)_updateInterfaceOrientationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(UIViewController *)self _window];
  uint64_t v6 = [v5 windowScene];
  unsigned __int8 v7 = -[UIScene _systemShellOwnsInterfaceOrientation](v6);

  if (v7)
  {
    if (v3)
    {
      [(UIViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __56__UIViewController__updateInterfaceOrientationAnimated___block_invoke;
      v11[3] = &unk_1E52D9F70;
      v11[4] = self;
      +[UIView performWithoutAnimation:v11];
    }
  }
  else
  {
    int64_t v8 = [(UIViewController *)self _preferredInterfaceOrientationGivenCurrentOrientation:[(UIViewController *)self interfaceOrientation]];
    id v10 = [(UIViewController *)self view];
    uint64_t v9 = [v10 window];
    [v9 _updateToInterfaceOrientation:v8 animated:v3];
  }
}

uint64_t __56__UIViewController__updateInterfaceOrientationAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (BOOL)_allowsAutorotation
{
  return (*(void *)&self->_viewControllerFlags >> 12) & 1;
}

+ (BOOL)_doesOverrideLegacyShouldAutorotateMethod
{
  return [a1 doesOverrideViewControllerMethod:sel_shouldAutorotateToInterfaceOrientation_];
}

+ (void)attemptRotationToDeviceOrientation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (pthread_main_np() == 1)
  {
    id v2 = +[UIScreen mainScreen];
    BOOL v3 = +[UIWindow allWindowsIncludingInternalWindows:0 onlyVisibleWindows:1 forScreen:v2];

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "_updateInterfaceOrientationFromDeviceOrientationIfRotationEnabled:", 1, (void)v10);
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    uint64_t v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Orientation", &attemptRotationToDeviceOrientation___s_category) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: +[UIViewController attemptRotationToDeviceOrientation] should not be called on a background thread.", buf, 2u);
    }
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_834);
  }
}

uint64_t __54__UIViewController_attemptRotationToDeviceOrientation__block_invoke()
{
  return +[UIViewController attemptRotationToDeviceOrientation];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
  id v2 = [(UIViewController *)self _window];
  BOOL v3 = v2;
  if (v2)
  {
    UIInterfaceOrientation v4 = [v2 _windowInterfaceOrientation];
    if (v4 == UIInterfaceOrientationUnknown) {
      UIInterfaceOrientation v4 = [(id)UIApp _sceneInterfaceOrientationFromWindow:v3];
    }
  }
  else
  {
    UIInterfaceOrientation v4 = UIInterfaceOrientationPortrait;
  }

  return v4;
}

- (uint64_t)_preferredInterfaceOrientationForPresentationInWindow:(uint64_t)a3 fromInterfaceOrientation:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (!a1)
  {
    a3 = 0;
    goto LABEL_17;
  }
  if ([v5 _windowCanDynamicallySpecifySupportedInterfaceOrientations])
  {
    if ([a1 _hasPreferredInterfaceOrientationForPresentation]
      && _UIViewControllerIsBeingPresentedOrDismissesFullscreen(a1))
    {
      unint64_t v7 = [a1 preferredInterfaceOrientationForPresentation];
      uint64_t v8 = [a1 supportedInterfaceOrientations];
      if (v7 > 4 || (unint64_t v9 = v8, (v8 & qword_186B94978[v7]) != 0))
      {
        a3 = v7;
        goto LABEL_17;
      }
      long long v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Orientation", &_preferredInterfaceOrientationForPresentationInWindow_fromInterfaceOrientation____s_category)+ 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        long long v11 = v10;
        long long v12 = _UIInterfaceOrientationDebugDescription(v7);
        long long v13 = _UIInterfaceOrientationMaskDebugDescription(v9);
        int v19 = 138412546;
        long long v20 = v12;
        __int16 v21 = 2112;
        long long v22 = v13;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "preferredInterfaceOrientationForPresentation '%@' must match a supported interface orientation: '%@'!", (uint8_t *)&v19, 0x16u);
      }
    }
    if (([v6 isInterfaceAutorotationDisabled] & 1) == 0)
    {
      if ([a1 shouldAutorotate])
      {
        int v14 = [(id)UIApp _hasApplicationCalledLaunchDelegate];
        long long v15 = [v6 windowScene];
        a3 = [v15 interfaceOrientation];

        uint64_t v16 = +[UIDevice currentDevice];
        uint64_t v17 = [v16 orientation];

        if ((unint64_t)(v17 - 1) <= 3 && (!v14 || ([a1 _isModalSheet] & 1) == 0)) {
          a3 = v17;
        }
      }
    }
    a3 = [a1 _preferredInterfaceOrientationGivenCurrentOrientation:a3];
  }
LABEL_17:

  return a3;
}

+ (BOOL)_allViewControllersInArray:(id)a3 allowAutorotationToInterfaceOrientation:(int64_t)a4 predicate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __97__UIViewController__allViewControllersInArray_allowAutorotationToInterfaceOrientation_predicate___block_invoke;
  v11[3] = &unk_1E52EA1C0;
  id v9 = v8;
  long long v13 = &v15;
  int64_t v14 = a4;
  id v12 = v9;
  [v7 enumerateObjectsUsingBlock:v11];
  LOBYTE(a4) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a4;
}

uint64_t __97__UIViewController__allViewControllersInArray_allowAutorotationToInterfaceOrientation_predicate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  if (![(id)objc_opt_class() _doesOverrideLegacyShouldAutorotateMethod]) {
    return a3 == 1;
  }
  return [(UIViewController *)self shouldAutorotateToInterfaceOrientation:a3];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
  if ([(id)objc_opt_class() _doesOverrideLegacyShouldAutorotateMethod])
  {
    LOBYTE(v5) = toInterfaceOrientation == UIInterfaceOrientationPortrait;
  }
  else
  {
    BOOL v5 = [(UIViewController *)self _allowsAutorotation];
    if (v5)
    {
      LOBYTE(v5) = [(UIViewController *)self _isSupportedInterfaceOrientation:toInterfaceOrientation];
    }
  }
  return v5;
}

- (id)rotatingHeaderViewForWindow:(id)a3
{
  BOOL v3 = -[UIViewController viewControllerForRotation](self);
  UIInterfaceOrientation v4 = [v3 rotatingHeaderView];

  return v4;
}

- (UIView)rotatingHeaderView
{
  id v2 = [(UIViewController *)self searchDisplayController];
  BOOL v3 = [v2 searchBar];

  return (UIView *)v3;
}

- (id)rotatingFooterViewForWindow:(id)a3
{
  BOOL v3 = -[UIViewController viewControllerForRotation](self);
  UIInterfaceOrientation v4 = [v3 rotatingFooterView];

  return v4;
}

- (UIView)rotatingFooterView
{
  return 0;
}

- (void)_setInterfaceOrientationOnModalRecursively:(void *)a1
{
  if (a1)
  {
    [a1 setInterfaceOrientation:a2];
    UIInterfaceOrientation v4 = [a1 view];
    BOOL v5 = [v4 window];
    uint64_t v6 = [a1 childModalViewController];
    id v7 = [v6 view];
    id v8 = [v7 window];

    if (v5 == v8)
    {
      id v9 = [a1 childModalViewController];
      -[UIViewController _setInterfaceOrientationOnModalRecursively:](v9, a2);
    }
  }
}

uint64_t __74__UIViewController__updateLastKnownInterfaceOrientationOnPresentionStack___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(result + 32);
    if (v2) {
      *(void *)(v2 + 264) = *(void *)(result + 40);
    }
  }
  return result;
}

- (BOOL)_isViewControllerInWindowHierarchy
{
  uint64_t v2 = [(UIViewController *)self _existingView];
  BOOL v3 = v2;
  if (v2)
  {
    UIInterfaceOrientation v4 = [v2 window];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (CGPoint)_centerForOrientation:(int64_t)a3
{
  UIInterfaceOrientation v4 = [(UIViewController *)self _window];
  if (!v4)
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v28 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v28, OS_LOG_TYPE_FAULT, "self.window should be non-nil", buf, 2u);
      }
    }
    else
    {
      unint64_t v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_centerForOrientation____s_category) + 8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v29 = 0;
        _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "self.window should be non-nil", v29, 2u);
      }
    }
  }
  _UIAppStatusBarHeightForWindow(v4);
  double v6 = v5;
  if ([(id)UIApp _appAdoptsUISceneLifecycle])
  {
    [v4 _referenceFrameFromSceneUsingScreenBounds:v6 != 0.0];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    if (v4) {
      uint64_t v15 = [(id)UIApp _sceneInterfaceOrientationFromWindow:v4];
    }
    else {
      uint64_t v15 = 0;
    }
    BOOL v16 = v6 != 0.0;
    uint64_t v17 = [(UIViewController *)self _screen];
    char v18 = __UIStatusBarManagerForWindow(v4);
    [v18 defaultStatusBarHeightInOrientation:1];
    double v20 = v19;

    [v17 _applicationFrameForInterfaceOrientation:v15 usingStatusbarHeight:v16 ignoreStatusBar:v20];
    double v8 = v21;
    double v10 = v22;
    double v12 = v23;
    double v14 = v24;
  }
  double v25 = v8 + v12 * 0.5;
  double v26 = v10 + v14 * 0.5;
  result.CGFloat y = v26;
  result.CGFloat x = v25;
  return result;
}

- (CGRect)_boundsForOrientation:(int64_t)a3
{
  double v5 = [(UIViewController *)self _window];
  if (!v5)
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v33 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v33, OS_LOG_TYPE_FAULT, "self.window should be non-nil", buf, 2u);
      }
    }
    else
    {
      id v32 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_boundsForOrientation____s_category) + 8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v34[0] = 0;
        _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_ERROR, "self.window should be non-nil", (uint8_t *)v34, 2u);
      }
    }
  }
  double v6 = [(UIViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  _UIAppStatusBarHeightForWindow(v5);
  double v12 = v11;
  if ([(id)UIApp _appAdoptsUISceneLifecycle])
  {
    [v5 _referenceFrameFromSceneUsingScreenBounds:v12 != 0.0];
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    if (v5) {
      uint64_t v17 = [(id)UIApp _sceneInterfaceOrientationFromWindow:v5];
    }
    else {
      uint64_t v17 = 0;
    }
    BOOL v18 = v12 != 0.0;
    double v19 = [(UIViewController *)self _screen];
    double v20 = __UIStatusBarManagerForWindow(v5);
    [v20 defaultStatusBarHeightInOrientation:1];
    double v22 = v21;

    [v19 _applicationFrameForInterfaceOrientation:v17 usingStatusbarHeight:v18 ignoreStatusBar:v22];
    double v14 = v23;
    double v16 = v24;
  }
  BOOL v25 = _UIAppUseModernRotationAndPresentationBehaviors();
  if ((unint64_t)(a3 - 3) >= 2) {
    double v26 = v16;
  }
  else {
    double v26 = v14;
  }
  if ((unint64_t)(a3 - 3) >= 2) {
    double v27 = v14;
  }
  else {
    double v27 = v16;
  }
  if (!v25)
  {
    double v16 = v26;
    double v14 = v27;
  }

  double v28 = v8;
  double v29 = v10;
  double v30 = v14;
  double v31 = v16;
  result.size.double height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (void)setInWillRotateCallback:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (void)_willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4 forwardToChildControllers:(BOOL)a5 skipSelf:(BOOL)a6
{
  if ([(UIViewController *)self _shouldFreezeUnderlapsStatusBar]) {
    *(void *)&self->_viewControllerFlags |= 0x10000000000uLL;
  }
  if (!a6)
  {
    [(UIViewController *)self setInWillRotateCallback:1];
    [(UIViewController *)self willRotateToInterfaceOrientation:a3 duration:a4];
  }
  double v11 = self;
  if ([(UIViewController *)v11 childViewControllersCount]
    && ([(UIViewController *)v11 _existingView], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v13 = (void *)v12;
    double v14 = [(UIViewController *)v11 _existingView];
    char v15 = [v14 isHidden];

    if ((v15 & 1) == 0)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __98__UIViewController__willRotateToInterfaceOrientation_duration_forwardToChildControllers_skipSelf___block_invoke;
      v16[3] = &__block_descriptor_49_e30_v24__0__UIViewController_8_B16l;
      v16[4] = a3;
      *(double *)&void v16[5] = a4;
      BOOL v17 = a5;
      -[UIViewController _enumerateVisibleChildControllers:includePresentedChildren:usingBlock:](v11, 1, v16);
    }
  }
  else
  {
  }
  if (!a6) {
    [(UIViewController *)v11 setInWillRotateCallback:0];
  }
}

void __98__UIViewController__willRotateToInterfaceOrientation_duration_forwardToChildControllers_skipSelf___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(double *)(a1 + 40);
  id v5 = a2;
  objc_msgSend(v5, "_willRotateToInterfaceOrientation:duration:forwardToChildControllers:skipSelf:", v3, objc_msgSend(v5, "_forwardRotationMethods"), *(unsigned char *)(a1 + 48) == 0, v4);
}

- (void)_willRotateToInterfaceOrientation
{
  if (a1)
  {
    if ([a1 _shouldFreezeUnderlapsStatusBar]) {
      a1[47] |= 0x10000000000uLL;
    }
    double v6 = a1;
    if ([v6 childViewControllersCount]
      && ([v6 _existingView], (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v3 = (void *)v2;
      double v4 = [v6 _existingView];
      char v5 = [v4 isHidden];

      if ((v5 & 1) == 0)
      {
        -[UIViewController _enumerateVisibleChildControllers:includePresentedChildren:usingBlock:](v6, 0, &__block_literal_global_865);
      }
    }
    else
    {
    }
  }
}

void __53__UIViewController__willRotateToInterfaceOrientation__block_invoke(uint64_t a1, void *a2)
{
}

- (void)window:(id)a3 willRotateToInterfaceOrientation:(int64_t)a4 duration:(double)a5 newSize:(CGSize)a6
{
  objc_msgSend((id)UIApp, "setIgnoresInteractionEvents:", 1, a4, a5, a6.width, a6.height);
  -[UIViewController _willRotateToInterfaceOrientation](self);
}

- (void)window:(id)a3 willRotateToInterfaceOrientation:(int64_t)a4 duration:(double)a5
{
  id v8 = a3;
  [(id)UIApp setIgnoresInteractionEvents:1];
  if (a5 > 0.0 && ([v8 isUsingOnePartRotationAnimation] & 1) == 0)
  {
    double v9 = [(UIViewController *)self rotatingFooterViewForWindow:v8];
    id v10 = [v9 superview];
    savedFooterSuperview = self->_savedFooterSuperview;
    self->_savedFooterSuperview = 0;

    if (v10 != v8)
    {
      objc_storeStrong((id *)&self->_savedFooterSuperview, v10);
      [v9 center];
      objc_msgSend(v8, "convertPoint:fromView:", v10);
      objc_msgSend(v9, "setCenter:");
      uint64_t v12 = [(UIViewController *)self rotatingContentViewForWindow:v8];
      double v13 = v12;
      if (v12)
      {
        [v12 transform];
      }
      else
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v25 = 0u;
      }
      v24[0] = v25;
      v24[1] = v26;
      v24[2] = v27;
      [v9 setTransform:v24];

      [v8 addSubview:v9];
    }
    double v14 = [(UIViewController *)self rotatingHeaderViewForWindow:v8];
    id v15 = [v14 superview];
    savedHeaderSuperview = self->_savedHeaderSuperview;
    self->_savedHeaderSuperview = 0;

    if (v15 != v8)
    {
      objc_storeStrong((id *)&self->_savedHeaderSuperview, v15);
      [v14 center];
      objc_msgSend(v8, "convertPoint:fromView:", v15);
      objc_msgSend(v14, "setCenter:");
      BOOL v17 = [(UIViewController *)self rotatingContentViewForWindow:v8];
      BOOL v18 = v17;
      if (v17)
      {
        [v17 transform];
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v21 = 0u;
      }
      v20[0] = v21;
      v20[1] = v22;
      v20[2] = v23;
      [v14 setTransform:v20];

      [v8 addSubview:v14];
    }
  }
  double v19 = -[UIViewController viewControllerForRotation](self);
  objc_msgSend(v19, "_willRotateToInterfaceOrientation:duration:forwardToChildControllers:skipSelf:", a4, objc_msgSend(v19, "_forwardRotationMethods"), 0, a5);
}

- (BOOL)shouldWindowUseOnePartInterfaceRotationAnimation:(id)a3
{
  uint64_t v3 = -[UIViewController viewControllerForRotation](self);
  char v4 = [v3 _shouldUseOnePartRotation];

  return v4;
}

- (BOOL)_shouldUseOnePartRotation
{
  char v2 = [(id)objc_opt_class() doesOverrideViewControllerMethod:sel_willAnimateRotationToInterfaceOrientation_duration_];
  if ([(id)objc_opt_class() doesOverrideViewControllerMethod:sel_willAnimateFirstHalfOfRotationToInterfaceOrientation_duration_])LOBYTE(v3) = 0; {
  else
  }
    int v3 = [(id)objc_opt_class() doesOverrideViewControllerMethod:sel_willAnimateSecondHalfOfRotationFromInterfaceOrientation_duration_] ^ 1;
  return v3 | v2;
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  id v5 = [(UIViewController *)self _viewControllerForRotation];
  [v5 _getRotationContentSettings:a3];
}

- (void)window:(id)a3 resizeFromOrientation:(int64_t)a4
{
  id v6 = a3;
  float v7 = 0.0;
  float v8 = 0.0;
  if ([v6 interfaceOrientation] != 1)
  {
    if ([v6 interfaceOrientation] == 4)
    {
      float v8 = -1.5708;
    }
    else if ([v6 interfaceOrientation] == 3)
    {
      float v8 = 1.5708;
    }
    else if ([v6 interfaceOrientation] == 2)
    {
      float v8 = 3.1416;
    }
    else
    {
      float v8 = 0.0;
    }
  }
  if (a4 != 1)
  {
    switch(a4)
    {
      case 3:
        float v7 = 1.5708;
        break;
      case 4:
        float v7 = -1.5708;
        break;
      case 2:
        float v7 = 3.1416;
        break;
      default:
        float v7 = 0.0;
        break;
    }
  }
  double v9 = [(UIViewController *)self rotatingContentViewForWindow:v6];
  unsigned int v10 = [v9 autoresizingMask];
  double v11 = [(UIViewController *)self _screen];
  [v11 bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  double v20 = (float)-v7;
  +[UIScreen transformForScreenOriginRotation:v20];
  v58.origin.CGFloat x = v13;
  v58.origin.CGFloat y = v15;
  v58.size.double width = v17;
  v58.size.double height = v19;
  CGRect v59 = CGRectApplyAffineTransform(v58, &v57);
  double width = v59.size.width;
  double height = v59.size.height;
  +[UIScreen transformForScreenOriginRotation:](UIScreen, "transformForScreenOriginRotation:", (float)-v8, v59.origin.y);
  v60.origin.CGFloat x = v13;
  v60.origin.CGFloat y = v15;
  v60.size.double width = v17;
  v60.size.double height = v19;
  CGRect v61 = CGRectApplyAffineTransform(v60, &v56);
  double v23 = v61.size.width;
  double v24 = v61.size.height;
  objc_msgSend(v9, "center", v61.origin.x, v61.origin.y);
  double v26 = v25;
  double v28 = v27;
  +[UIScreen transformForScreenOriginRotation:v20];
  double v29 = v54 + v26 * v50 + v28 * v52;
  double v30 = v55 + v26 * v51 + v28 * v53;
  *(float *)&double v29 = v29;
  float v49 = *(float *)&v29;
  [v9 bounds];
  double v32 = v31;
  float v34 = v33;
  float v48 = v34;
  float v35 = width;
  float v36 = v23;
  adjustOffsetAndDimension(&v49, &v48, v10 & 7, v35, v36);
  float v37 = v30;
  float v38 = v32;
  float v46 = v38;
  float v47 = v37;
  float v39 = height;
  float v40 = v24;
  adjustOffsetAndDimension(&v47, &v46, (v10 >> 3) & 7, v39, v40);
  double v42 = v49;
  double v41 = v47;
  +[UIScreen transformForScreenOriginRotation:v8];
  objc_msgSend(v9, "setCenter:", vaddq_f64(v45, vaddq_f64(vmulq_n_f64(v43, v42), vmulq_n_f64(v44, v41))));
  objc_msgSend(v9, "setBounds:", 0.0, 0.0, v48, v46);
}

- (void)_willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4 forwardToChildControllers:(BOOL)a5 skipSelf:(BOOL)a6
{
  if (!a6) {
    [(UIViewController *)self willAnimateRotationToInterfaceOrientation:a3 duration:a4];
  }
  double v14 = self;
  if ([(UIViewController *)v14 childViewControllersCount]
    && ([(UIViewController *)v14 _existingView], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v11 = (void *)v10;
    double v12 = [(UIViewController *)v14 _existingView];
    char v13 = [v12 isHidden];

    if ((v13 & 1) == 0)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __107__UIViewController__willAnimateRotationToInterfaceOrientation_duration_forwardToChildControllers_skipSelf___block_invoke;
      v15[3] = &__block_descriptor_49_e30_v24__0__UIViewController_8_B16l;
      void v15[4] = a3;
      *(double *)&void v15[5] = a4;
      BOOL v16 = a5;
      -[UIViewController _enumerateVisibleChildControllers:includePresentedChildren:usingBlock:](v14, 1, v15);
    }
  }
  else
  {
  }
}

void __107__UIViewController__willAnimateRotationToInterfaceOrientation_duration_forwardToChildControllers_skipSelf___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(double *)(a1 + 40);
  id v5 = a2;
  objc_msgSend(v5, "_willAnimateRotationToInterfaceOrientation:duration:forwardToChildControllers:skipSelf:", v3, objc_msgSend(v5, "_forwardRotationMethods"), *(unsigned char *)(a1 + 48) == 0, v4);
}

- (void)window:(id)a3 willAnimateRotationToInterfaceOrientation:(int64_t)a4 duration:(double)a5 newSize:(CGSize)a6
{
  if (self) {
    self->_lastKnownInterfaceOrientation = a4;
  }
  id v8 = a3;
  -[UIViewController _updateLastKnownInterfaceOrientationOnPresentionStack:]((uint64_t)self, a4);
  double v9 = [(UIViewController *)self rotatingContentViewForWindow:v8];
  memset(v20, 0, sizeof(v20));
  [(UIViewController *)self getRotationContentSettings:v20 forWindow:v8];

  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  CGFloat v17 = __86__UIViewController_window_willAnimateRotationToInterfaceOrientation_duration_newSize___block_invoke;
  double v18 = &unk_1E52D9F70;
  id v10 = v9;
  id v19 = v10;
  double v11 = _Block_copy(&v15);
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled]&& (!LOBYTE(v20[0]) || BYTE3(v20[0])))
  {
    unsigned __int8 v12 = BYTE4(v20[0]);
    unint64_t v13 = (unint64_t)BYTE4(v20[0]) << 11;
    if (dyld_program_sdk_at_least()) {
      unint64_t v14 = ((unint64_t)v12 << 11) | 4;
    }
    else {
      unint64_t v14 = v13;
    }
    +[UIView animateWithDuration:v14 delay:v11 options:0 animations:0.0 completion:0.0];
  }
  else
  {
    +[UIView performWithoutAnimation:v11];
  }
}

void __86__UIViewController_window_willAnimateRotationToInterfaceOrientation_duration_newSize___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) layer];
  [v1 layoutIfNeeded];
}

- (void)window:(id)a3 willAnimateRotationToInterfaceOrientation:(int64_t)a4 duration:(double)a5
{
  id v8 = a3;
  id dropShadowView = self->_dropShadowView;
  if (dropShadowView)
  {
    [dropShadowView bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  int64_t v18 = [(UIViewController *)self _lastKnownInterfaceOrientation];
  self->_lastKnownInterfaceOrientation = a4;
  id v19 = [(UIViewController *)self rotatingContentViewForWindow:v8];
  double v20 = -[UIViewController viewControllerForRotation](self);
  if ([v20 _useSheetRotation])
  {
    uint64_t viewControllerFlags = (uint64_t)self->_viewControllerFlags;

    if ((viewControllerFlags & 0x100) == 0)
    {
      [(UIViewController *)self window:v8 resizeFromOrientation:v18];
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (v19
    && (v19[12] & 0x400000000000000) != 0
    && ([v19 translatesAutoresizingMaskIntoConstraints] & 1) == 0)
  {
    [v8 _setNeedsUpdateConstraints];
  }
  else
  {
    [(UIViewController *)self _centerForOrientation:a4];
    objc_msgSend(v19, "setCenter:");
    [(UIViewController *)self _boundsForOrientation:a4];
    objc_msgSend(v19, "setBounds:");
  }
LABEL_12:
  memset(v36, 0, sizeof(v36));
  [(UIViewController *)self getRotationContentSettings:v36 forWindow:v8];
  BOOL v22 = +[UIView areAnimationsEnabled];
  if (LOBYTE(v36[0])) {
    BOOL v23 = BYTE3(v36[0]) == 0;
  }
  else {
    BOOL v23 = 0;
  }
  BOOL v24 = !v23 && v22;
  +[UIView setAnimationsEnabled:v24];
  double v25 = [v19 layer];
  [v25 layoutIfNeeded];

  +[UIView setAnimationsEnabled:v22];
  double v26 = -[UIViewController viewControllerForRotation](self);
  objc_msgSend(v26, "_willAnimateRotationToInterfaceOrientation:duration:forwardToChildControllers:skipSelf:", a4, objc_msgSend(v26, "_forwardRotationMethods"), 0, a5);
  id v27 = self->_dropShadowView;
  if (v27)
  {
    [v27 bounds];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
  }
  else
  {
    double v29 = *MEMORY[0x1E4F1DB28];
    double v31 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v35 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  objc_msgSend(v27, "willBeginRotationWithOriginalBounds:newBounds:", v11, v13, v15, v17, v29, v31, v33, v35);
}

- (void)window:(id)a3 willAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a4 duration:(double)a5
{
  if (a5 > 0.0)
  {
    id v8 = [(UIViewController *)self rotatingContentViewForWindow:a3];
    [v8 center];
    double v10 = v9;
    double v12 = v11;
    [(UIViewController *)self _centerForOrientation:a4];
    objc_msgSend(v8, "setCenter:", v10 + (v13 - v10) * 0.5, v12 + (v14 - v12) * 0.5);
    [v8 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [(UIViewController *)self _boundsForOrientation:a4];
    objc_msgSend(v8, "setBounds:", v16 + (v23 - v16) * 0.5, v18 + (v24 - v18) * 0.5, v20 + (v25 - v20) * 0.5, v22 + (v26 - v22) * 0.5);
    [v8 layoutIfNeeded];
  }
  -[UIViewController viewControllerForRotation](self);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  [v27 willAnimateFirstHalfOfRotationToInterfaceOrientation:a4 duration:a5];
}

- (void)window:(id)a3 didAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a4
{
  -[UIViewController viewControllerForRotation](self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 didAnimateFirstHalfOfRotationToInterfaceOrientation:a4];
}

- (void)window:(id)a3 willAnimateSecondHalfOfRotationFromInterfaceOrientation:(int64_t)a4 duration:(double)a5
{
  id v8 = a3;
  uint64_t v9 = [v8 interfaceOrientation];
  -[UIViewController _setInterfaceOrientationOnModalRecursively:](self, v9);
  id v11 = [(UIViewController *)self rotatingContentViewForWindow:v8];

  [(UIViewController *)self _centerForOrientation:v9];
  objc_msgSend(v11, "setCenter:");
  [(UIViewController *)self _boundsForOrientation:v9];
  objc_msgSend(v11, "setBounds:");
  [v11 layoutIfNeeded];
  double v10 = -[UIViewController viewControllerForRotation](self);
  [v10 willAnimateSecondHalfOfRotationFromInterfaceOrientation:a4 duration:a5];
}

- (void)_didRotateFromInterfaceOrientation:(int64_t)a3 forwardToChildControllers:(BOOL)a4 skipSelf:(BOOL)a5
{
  *(void *)&self->_viewControllerFlags &= ~0x10000000000uLL;
  if (!a5) {
    [(UIViewController *)self didRotateFromInterfaceOrientation:a3];
  }
  double v12 = self;
  if ([(UIViewController *)v12 childViewControllersCount]
    && ([(UIViewController *)v12 _existingView], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v9 = (void *)v8;
    double v10 = [(UIViewController *)v12 _existingView];
    char v11 = [v10 isHidden];

    if ((v11 & 1) == 0)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __90__UIViewController__didRotateFromInterfaceOrientation_forwardToChildControllers_skipSelf___block_invoke;
      v13[3] = &__block_descriptor_41_e30_v24__0__UIViewController_8_B16l;
      void v13[4] = a3;
      BOOL v14 = a4;
      -[UIViewController _enumerateVisibleChildControllers:includePresentedChildren:usingBlock:](v12, 1, v13);
    }
  }
  else
  {
  }
}

void __90__UIViewController__didRotateFromInterfaceOrientation_forwardToChildControllers_skipSelf___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "_didRotateFromInterfaceOrientation:forwardToChildControllers:skipSelf:", v3, objc_msgSend(v4, "_forwardRotationMethods"), *(unsigned char *)(a1 + 40) == 0);
}

- (void)_didRotateFromInterfaceOrientation
{
  if (a1)
  {
    a1[47] &= ~0x10000000000uLL;
    id v5 = a1;
    if ([v5 childViewControllersCount]
      && ([v5 _existingView], (uint64_t v1 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      char v2 = (void *)v1;
      uint64_t v3 = [v5 _existingView];
      char v4 = [v3 isHidden];

      if ((v4 & 1) == 0)
      {
        -[UIViewController _enumerateVisibleChildControllers:includePresentedChildren:usingBlock:](v5, 0, &__block_literal_global_874);
      }
    }
    else
    {
    }
  }
}

void __54__UIViewController__didRotateFromInterfaceOrientation__block_invoke(uint64_t a1, void *a2)
{
}

- (void)window:(id)a3 didRotateFromInterfaceOrientation:(int64_t)a4 oldSize:(CGSize)a5
{
  id v6 = [(UIViewController *)self view];
  [v6 setNeedsDisplay];

  [(id)UIApp setIgnoresInteractionEvents:0];
  -[UIViewController _didRotateFromInterfaceOrientation](self);
}

- (void)window:(id)a3 didRotateFromInterfaceOrientation:(int64_t)a4
{
  id v6 = a3;
  [self->_dropShadowView didFinishRotation];
  float v7 = [(UIViewController *)self rotatingFooterViewForWindow:v6];
  uint64_t v8 = [v7 superview];
  uint64_t v9 = (void *)v8;
  savedFooterSuperview = self->_savedFooterSuperview;
  if (savedFooterSuperview) {
    BOOL v11 = v8 == (void)savedFooterSuperview;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    [v7 center];
    objc_msgSend(v9, "convertPoint:toView:", self->_savedFooterSuperview);
    objc_msgSend(v7, "setCenter:");
    if (v9)
    {
      [v9 transform];
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v26 = 0u;
    }
    v25[0] = v26;
    v25[1] = v27;
    v25[2] = v28;
    [v7 setTransform:v25];
    [(UIView *)self->_savedFooterSuperview addSubview:v7];
    double v12 = self->_savedFooterSuperview;
    self->_savedFooterSuperview = 0;

    [v7 layoutIfNeeded];
  }
  double v13 = [(UIViewController *)self rotatingHeaderViewForWindow:v6];
  uint64_t v14 = [v13 superview];
  double v15 = (void *)v14;
  savedHeaderSuperview = self->_savedHeaderSuperview;
  if (savedHeaderSuperview) {
    BOOL v17 = v14 == (void)savedHeaderSuperview;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    [v13 center];
    objc_msgSend(v15, "convertPoint:toView:", self->_savedHeaderSuperview);
    objc_msgSend(v13, "setCenter:");
    if (v15)
    {
      [v15 transform];
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v22 = 0u;
    }
    v21[0] = v22;
    v21[1] = v23;
    v21[2] = v24;
    [v13 setTransform:v21];
    [(UIView *)self->_savedHeaderSuperview addSubview:v13];
    double v18 = self->_savedHeaderSuperview;
    self->_savedHeaderSuperview = 0;

    [v13 layoutIfNeeded];
  }
  double v19 = [(UIViewController *)self view];
  [v19 setNeedsDisplay];

  [(id)UIApp setIgnoresInteractionEvents:0];
  double v20 = -[UIViewController viewControllerForRotation](self);
  objc_msgSend(v20, "_didRotateFromInterfaceOrientation:forwardToChildControllers:skipSelf:", a4, objc_msgSend(v20, "_forwardRotationMethods"), 0);
}

- (BOOL)_handlesCounterRotationForPresentation
{
  return 0;
}

- (void)_willBeginCounterRotationForPresentation
{
  *((_WORD *)&self->_viewControllerFlags + 4) |= 0x40u;
  if ([(UIViewController *)self _handlesCounterRotationForPresentation])
  {
    uint64_t v3 = [(UIViewController *)self traitCollection];
    frozenTraitCollection = self->_frozenTraitCollection;
    self->_frozenTraitCollection = v3;
  }
}

- (void)_didEndCounterRotationForPresentation
{
  *((_WORD *)&self->_viewControllerFlags + 4) &= ~0x40u;
  if ([(UIViewController *)self _handlesCounterRotationForPresentation])
  {
    uint64_t v3 = [(UIViewController *)self traitCollection];
    char v4 = [(UIViewController *)self _parentTraitEnvironment];
    id v5 = [v4 _traitCollectionForChildEnvironment:self];
    id v6 = -[UIViewController _traitCollectionByApplyingOverridesFromParentViewControllerToTraitCollection:](self, v5);

    float v7 = -[UIViewController _traitCollectionByApplyingLocalOverridesToTraitCollection:]((uint64_t)self, v6);

    if (v7 != v3 && ([v3 isEqual:v7] & 1) == 0)
    {
      uint64_t v8 = objc_alloc_init(_UIViewControllerNullAnimationTransitionCoordinator);
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      double v13 = __57__UIViewController__didEndCounterRotationForPresentation__block_invoke;
      uint64_t v14 = &unk_1E52DD450;
      double v15 = self;
      id v16 = v3;
      id v17 = v7;
      double v18 = v8;
      uint64_t v9 = v8;
      +[UIViewController _performWithoutDeferringTransitions:&v11];
      [(_UIViewControllerNullAnimationTransitionCoordinator *)v9 _runAlongsideAnimations];
      [(_UIViewControllerNullAnimationTransitionCoordinator *)v9 _runAlongsideCompletionsAfterCommit];
    }
    frozenTraitCollection = self->_frozenTraitCollection;
    self->_frozenTraitCollection = 0;

    [(UIViewController *)self _updateTraitsIfNecessary];
  }
}

uint64_t __57__UIViewController__didEndCounterRotationForPresentation__block_invoke(uint64_t *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  char v2 = self;
  BOOL v3 = _UIShouldLogTraitCollectionChangeForInstanceAndMethod(v2, a1[4], (uint64_t)sel_willTransitionToTraitCollection_withTransitionCoordinator_);

  if (v3)
  {
    id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("TraitCollectionChange", &_UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_8___s_category)+ 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      float v7 = NSStringFromSelector(sel_willTransitionToTraitCollection_withTransitionCoordinator_);
      uint64_t v8 = a1[4];
      uint64_t v9 = +[UITraitCollection _descriptionForChangeFromTraitCollection:a1[5] toTraitCollection:a1[6]];
      uint64_t v10 = a1[5];
      uint64_t v11 = a1[6];
      int v12 = 138413314;
      double v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Sending -%@ to %@\n\t► trait changes: %@\n\t► current: %@\n\t► new: %@", (uint8_t *)&v12, 0x34u);
    }
  }
  return [(id)a1[4] willTransitionToTraitCollection:a1[6] withTransitionCoordinator:a1[7]];
}

void __58__UIViewController__applyContentUnavailableConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v6 = [WeakRetained _contentUnavailableWrapperView];
    float v7 = *(void **)(a1 + 32);

    id WeakRetained = v9;
    if (v6 == v7)
    {
      if (a3) {
        [*(id *)(a1 + 32) setConfiguration:*(void *)(a1 + 40)];
      }
      uint64_t v8 = [*(id *)(a1 + 32) configuration];

      id WeakRetained = v9;
      if (!v8)
      {
        [*(id *)(a1 + 32) removeFromSuperview];
        objc_msgSend(v9, "set_contentUnavailableWrapperView:", 0);
        id WeakRetained = v9;
      }
    }
  }
}

- (void)_setNeedsStatusBarAppearanceUpdateWithAnimationParameters:(id)a3
{
  id v4 = a3;
  id v5 = (id)_CurrentStatusBarAppearanceUpdateAnimationParameters;
  id v6 = (void *)_CurrentStatusBarAppearanceUpdateAnimationParameters;
  _CurrentStatusBarAppearanceUpdateAnimationParameters = (uint64_t)v4;
  id v8 = v4;

  [(UIViewController *)self setNeedsStatusBarAppearanceUpdate];
  float v7 = (void *)_CurrentStatusBarAppearanceUpdateAnimationParameters;
  _CurrentStatusBarAppearanceUpdateAnimationParameters = (uint64_t)v5;
}

- (BOOL)sendClientToHostAction:(id)a3
{
  id v4 = a3;
  id v5 = [(UIViewController *)self _window];
  id v6 = [v5 windowScene];
  float v7 = [v6 _FBSScene];

  if (v7)
  {
    self = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    [v7 sendActions:self];
    char v8 = 1;
  }
  else
  {
    id v9 = [v5 rootViewController];
    if (v9 == self)
    {
      char v8 = 0;
    }
    else
    {
      uint64_t v10 = v9;
      char v8 = [(UIViewController *)v9 sendClientToHostAction:v4];
      self = v10;
    }
  }

  return v8;
}

- (BOOL)prefersPointerLocked
{
  return 0;
}

- (id)_effectivePointerLockViewController
{
  BOOL v3 = [(UIViewController *)self _window];
  id v4 = [v3 _windowHostingScene];
  int IsAvailableForScene = _UIPointerLockStateIsAvailableForScene(v4);

  if (IsAvailableForScene)
  {
    id v6 = [(UIViewController *)self _presentedStatusBarViewController];
    float v7 = [v6 _effectivePointerLockViewController];

    if (!v7)
    {
      char v8 = [(UIViewController *)self childViewControllerForPointerLock];
      float v7 = [v8 _effectivePointerLockViewController];

      if (!v7) {
        float v7 = self;
      }
    }
  }
  else
  {
    float v7 = 0;
  }
  return v7;
}

uint64_t __56__UIViewController_setNeedsUpdateOfPrefersPointerLocked__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setNeedsUpdateOfPrefersPointerLocked];
}

void __56__UIViewController_setNeedsUpdateOfPrefersPointerLocked__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  char v2 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v4 = [v5 pointerLockState];
    [v4 _preferredPointerLockStatusUpdated];
  }
}

- (UIViewController)childViewControllerForPointerLock
{
  return 0;
}

- (id)_multitaskingDragExclusionRects
{
  return (id)MEMORY[0x1E4F1CBF0];
}

uint64_t __67__UIViewController__setNeedsUpdateOfMultitaskingDragExclusionRects__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setNeedsUpdateOfMultitaskingDragExclusionRects];
}

void __67__UIViewController__setNeedsUpdateOfMultitaskingDragExclusionRects__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 _systemAppearanceManager];
  [v2 updateMultitaskingDragExclusionRects];
}

- (id)_effectiveViewControllerForMultitaskingDragExclusionRects
{
  BOOL v3 = [(UIViewController *)self _presentedStatusBarViewController];
  id v4 = [v3 _effectiveViewControllerForMultitaskingDragExclusionRects];

  if (!v4)
  {
    id v5 = [(UIViewController *)self _childViewControllerForMultitaskingDragExclusionRects];
    id v4 = [v5 _effectiveViewControllerForMultitaskingDragExclusionRects];

    if (!v4) {
      id v4 = self;
    }
  }
  return v4;
}

- (id)_childViewControllerForMultitaskingDragExclusionRects
{
  return 0;
}

- (id)defaultPNGName
{
  return 0;
}

- (void)_setSearchDisplayController:(int)a3 retain:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_17;
  }
  obuint64_t j = v5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 224));

  id v5 = obj;
  uint64_t v7 = *(void *)(a1 + 376);
  if (WeakRetained == obj)
  {
    if ((v7 & 0x2000) != 0 || !a3)
    {
      if (v7 & 0x2000) == 0 || (a3) {
        goto LABEL_14;
      }
      uint64_t v10 = *(void **)(a1 + 232);
      *(void *)(a1 + 232) = 0;
    }
    else
    {
      id v11 = objc_loadWeakRetained((id *)(a1 + 224));
      uint64_t v10 = *(void **)(a1 + 232);
      *(void *)(a1 + 232) = v11;
    }
  }
  else
  {
    if ((v7 & 0x2000) != 0)
    {
      char v8 = *(void **)(a1 + 232);
      *(void *)(a1 + 232) = 0;
    }
    objc_storeWeak((id *)(a1 + 224), obj);
    id v5 = obj;
    if (!a3) {
      goto LABEL_14;
    }
    id v9 = obj;
    uint64_t v10 = *(void **)(a1 + 232);
    *(void *)(a1 + 232) = v9;
  }

  id v5 = obj;
LABEL_14:
  uint64_t v12 = 0x2000;
  if (!a3) {
    uint64_t v12 = 0;
  }
  *(void *)(a1 + 376) = *(void *)(a1 + 376) & 0xFFFFFFFFFFFFDFFFLL | v12;
LABEL_17:
}

- (void)setSearchDisplayController:(id)a3
{
}

- (void)_setSearchDisplayControllerUnretained:(id)a3
{
}

- (BOOL)searchBarHidNavBar
{
  id v2 = [(UIViewController *)self navigationController];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 searchBarHidNavBar];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setSearchBarHidNavBar:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = [(UIViewController *)self navigationController];
  if (v4)
  {
    id v5 = v4;
    [v4 setSearchBarHidNavBar:v3];
    char v4 = v5;
  }
}

- (id)_lastNavigationItems
{
  return 0;
}

- (void)_removeNavigationItemsFromNavigationController:(uint64_t)a3 transition:
{
  id v5 = a2;
  if (a1)
  {
    id v15 = v5;
    if ([v5 _isNestedNavigationController])
    {
      id v6 = [v15 bottomViewController];
      BOOL v7 = v6 == a1;
    }
    else
    {
      BOOL v7 = 0;
    }
    id v8 = v15;
    id v9 = v8;
    if ([v8 _isNestedNavigationController])
    {
      uint64_t v10 = v8;
      do
      {
        id v9 = [v10 navigationController];

        uint64_t v10 = v9;
      }
      while (([v9 _isNestedNavigationController] & 1) != 0);
    }
    id v11 = [a1 navigationItem];
    if ([v8 _isNestedNavigationController])
    {
      uint64_t v12 = [v8 navigationBar];
      [v12 _popNestedNavigationItem];
    }
    double v13 = [v9 navigationBar];
    [v13 _setItemsUpToItem:v11 transition:a3];

    if (v7)
    {
      __int16 v14 = [v8 navigationBar];
      [v14 _redisplayItems];
    }
    id v5 = v15;
  }
}

- (BOOL)isMovingToParentViewController
{
  if ((*(void *)&self->_viewControllerFlags & 0x100000000200000) == 0
    || (*(void *)&self->_viewControllerFlags & 0x2000000) == 0)
  {
    return 0;
  }
  if (!dyld_program_sdk_at_least()) {
    return ((*(_DWORD *)&self->_viewControllerFlags >> 1) & 3u) - 1 < 2;
  }
  id v6 = [(UIViewController *)self presentedViewController];

  if (!v6) {
    return ((*(_DWORD *)&self->_viewControllerFlags >> 1) & 3u) - 1 < 2;
  }
  BOOL result = 0;
  *(void *)&self->_viewControllerFlags &= ~0x2000000uLL;
  return result;
}

- (BOOL)isMovingFromParentViewController
{
  if ((*(void *)&self->_viewControllerFlags & 0x100000000200000) == 0
    || (*(void *)&self->_viewControllerFlags & 0x2000000) == 0)
  {
    return 0;
  }
  if (!dyld_program_sdk_at_least()) {
    return ((*(_DWORD *)&self->_viewControllerFlags >> 1) & 3u) - 3 < 0xFFFFFFFE;
  }
  id v6 = [(UIViewController *)self presentedViewController];

  if (!v6) {
    return ((*(_DWORD *)&self->_viewControllerFlags >> 1) & 3u) - 3 < 0xFFFFFFFE;
  }
  BOOL result = 0;
  *(void *)&self->_viewControllerFlags &= ~0x2000000uLL;
  return result;
}

- (id)keyCommands
{
  interfaceBuilderKeyCommands = self->_interfaceBuilderKeyCommands;
  addedKeyCommands = self->_addedKeyCommands;
  if (interfaceBuilderKeyCommands)
  {
    if (addedKeyCommands)
    {
      -[NSArray arrayByAddingObjectsFromArray:](interfaceBuilderKeyCommands, "arrayByAddingObjectsFromArray:");
      id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = interfaceBuilderKeyCommands;
    }
  }
  else
  {
    id v5 = addedKeyCommands;
  }
  return v5;
}

- (id)_keyCommands
{
  BOOL v3 = [(UIViewController *)self keyCommands];
  char v4 = v3;
  interfaceBuilderKeyCommands = self->_interfaceBuilderKeyCommands;
  if (interfaceBuilderKeyCommands)
  {
    if (v3)
    {
      id v6 = [(NSArray *)v3 lastObject];
      BOOL v7 = [(NSArray *)self->_interfaceBuilderKeyCommands lastObject];

      if (v6 != v7)
      {
        uint64_t v8 = [(NSArray *)self->_interfaceBuilderKeyCommands arrayByAddingObjectsFromArray:v4];

        char v4 = (NSArray *)v8;
      }
    }
    else
    {
      char v4 = interfaceBuilderKeyCommands;
    }
  }
  return v4;
}

- (void)_setKeyCommands:(id)a3
{
}

- (BOOL)_allowNestedNavigationControllers
{
  return 0;
}

- (int64_t)_horizontalSizeClass
{
  id v2 = [(UIViewController *)self traitCollection];
  int64_t v3 = [v2 horizontalSizeClass];

  return v3;
}

- (int64_t)_verticalSizeClass
{
  id v2 = [(UIViewController *)self traitCollection];
  int64_t v3 = [v2 verticalSizeClass];

  return v3;
}

- (BOOL)_isMemberOfViewControllerHierarchy:(id)a3
{
  char v4 = (UIViewController *)a3;
  if (self == v4)
  {
    BOOL i = 1;
  }
  else
  {
    uint64_t v5 = [(UIViewController *)self parentViewController];
    id v6 = (UIViewController *)v5;
    for (BOOL i = v5 != 0; v6 != v4 && v6; BOOL i = v6 != 0)
    {
      uint64_t v8 = v6;
      id v6 = [(UIViewController *)v6 parentViewController];
    }
  }

  return i;
}

- (id)_focusFallbackScroller
{
  return 0;
}

- (BOOL)restoresFocusAfterTransition
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (*(void *)&self->_viewControllerFlags >> 46) & 3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v11 = __48__UIViewController_restoresFocusAfterTransition__block_invoke;
  uint64_t v12 = &unk_1E52DA6B0;
  double v13 = self;
  char v4 = v10;
  if (v3 == 2)
  {
    char v6 = 1;
  }
  else if (v3 == 1)
  {
    char v6 = 0;
  }
  else if (v3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v15 = v3;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Found an invalid tri state of %tu. This is an indication of corrupted memory.", buf, 0xCu);
      }
    }
    else
    {
      BOOL v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UITriStateToBool___s_category_0) + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v15 = v3;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Found an invalid tri state of %tu. This is an indication of corrupted memory.", buf, 0xCu);
      }
    }
    char v6 = v11((uint64_t)v4);
  }
  else
  {
    uint64_t v5 = [(UIViewController *)self _focusBehavior];
    char v6 = [v5 viewControllerPresentationRestoresLastFocusedItem];
  }
  return v6;
}

uint64_t __48__UIViewController_restoresFocusAfterTransition__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _focusBehavior];
  uint64_t v2 = [v1 viewControllerPresentationRestoresLastFocusedItem];

  return v2;
}

- (BOOL)_canRestoreFocusAfterTransitionToItem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UIViewController.m", 14355, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__UIViewController__canRestoreFocusAfterTransitionToItem___block_invoke;
  _OWORD v9[3] = &unk_1E52EA288;
  void v9[4] = self;
  void v9[5] = &v14;
  v9[6] = &v10;
  _UIFocusEnvironmentEnumerateAncestorEnvironments(v5, v9);
  if (*((unsigned char *)v15 + 24) && *((unsigned char *)v11 + 24)) {
    char IsFocusedOrFocusable = _UIFocusItemIsFocusedOrFocusable(v5);
  }
  else {
    char IsFocusedOrFocusable = 0;
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return IsFocusedOrFocusable;
}

void __58__UIViewController__canRestoreFocusAfterTransitionToItem___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v6 restoresFocusAfterTransition]
    || _IsKindOfUIView((uint64_t)v6)
    && (([v6 isHidden] & 1) != 0 || (objc_msgSend(v6, "alpha"), v5 == 0.0)))
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    *a3 = 1;
  }
  if ((id)a1[4] == v6)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (id)__potentialOverridingFocusEnvironments
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  char v4 = [(UIViewController *)self presentedViewController];
  double v5 = [v4 activePresentationController];

  if ([v5 presented])
  {
    id v6 = [v5 presentedViewController];
    [v3 addObject:v6];
  }
  BOOL v7 = [(UIViewController *)self _childViewControllersEligibleForOverridingPreferredFocusEnvironments];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v13 = [v12 _existingView];
        uint64_t v14 = [v13 _window];

        if (v14) {
          [v3 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v3;
}

- (id)_overridingPreferredFocusEnvironment
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  char v13 = __Block_byref_object_copy__61;
  uint64_t v14 = __Block_byref_object_dispose__61;
  id v15 = 0;
  v16[0] = self;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__UIViewController__overridingPreferredFocusEnvironment__block_invoke;
  _OWORD v9[3] = &unk_1E52EA2B0;
  void v9[4] = self;
  void v9[5] = &v10;
  _UITreeBreadthFirstTraversal(v3, sel___potentialOverridingFocusEnvironments, v9);

  char v4 = (void *)v11[5];
  if (!v4)
  {
    uint64_t v5 = -[UIViewController _retrievePresentingFocusedItemOrRemoveIfNotFocusable](self);
    id v6 = (void *)v11[5];
    void v11[5] = v5;

    char v4 = (void *)v11[5];
  }
  id v7 = v4;
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __56__UIViewController__overridingPreferredFocusEnvironment__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [v5 presentedViewController];
  id v7 = [v6 activePresentationController];

  if ([v7 presented])
  {
    if (([v7 _isPresentedInFullScreen] & 1) != 0
      || ([v7 presentingViewController],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = *(void **)(a1 + 32),
          v8,
          v8 == v9))
    {
      if (([v7 _allowsFocusInPresentingViewController] & 1) == 0)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
        *a3 = 1;
      }
    }
  }
  else
  {
    uint64_t v10 = -[UIViewController _retrievePresentingFocusedItemOrRemoveIfNotFocusable](v5);
    if (v10)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v10);
      *a3 = 1;
    }
  }
  return 1;
}

- (id)_retrievePresentingFocusedItemOrRemoveIfNotFocusable
{
  id v1 = a1;
  if (a1)
  {
    id v2 = [a1 _presentingFocusedItem];
    uint64_t v3 = [v1 _existingView];
    char v4 = [v3 _window];

    if (!v4 || !v2) {
      goto LABEL_20;
    }
    id v5 = [v1 presentedViewController];
    id v6 = [v5 activePresentationController];

    id v7 = [v1 _focusSystem];
    uint64_t v8 = [v7 focusedItem];

    if (v6)
    {
      if (v8)
      {
        if ([v6 _allowsFocusInPresentingViewController])
        {
          if (_UIFocusEnvironmentIsAncestorOfEnvironment(v1, v8))
          {
            uint64_t v9 = [v6 presentedViewController];
            BOOL IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(v9, v8);

            if (!IsAncestorOfEnvironment)
            {
              [v1 _setPresentingFocusedItem:v8];

              id v1 = 0;
              goto LABEL_21;
            }
          }
        }
      }
    }
    id v2 = v2;
    if (dyld_program_sdk_at_least())
    {
      char v11 = [v1 _canRestoreFocusAfterTransitionToItem:v2];

      if (v11) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    if ([v1 restoresFocusAfterTransition])
    {
      uint64_t v12 = [v1 view];
      if (_UIFocusEnvironmentIsAncestorOfEnvironment(v12, v2))
      {
        char IsFocusedOrFocusable = _UIFocusItemIsFocusedOrFocusable(v2);

        if (IsFocusedOrFocusable) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
LABEL_18:

    [v1 _setPresentingFocusedItem:0];
    id v2 = 0;
LABEL_19:

LABEL_20:
    id v2 = v2;
    id v1 = v2;
LABEL_21:
  }
  return v1;
}

- (NSString)focusGroupIdentifier
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *(_DWORD *)((char *)&self->_viewControllerFlags + 6) & 3;
  if (v3 == 2)
  {
    char v4 = objc_getAssociatedObject(self, &FocusGroupIdentifierKey);
  }
  else
  {
    if (v3 != 1)
    {
      if (!v3)
      {
        char v4 = [(UIViewController *)self _systemDefaultFocusGroupIdentifier];
        goto LABEL_10;
      }
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v8 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          int v9 = *(_DWORD *)((char *)&self->_viewControllerFlags + 6) & 3;
          int v10 = 67109120;
          int v11 = v9;
          _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Unknown case for _viewControllerFlags.hasFocusGroupIdentifier (%d).", (uint8_t *)&v10, 8u);
        }
      }
      else
      {
        id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &focusGroupIdentifier___s_category) + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          int v6 = *(_DWORD *)((char *)&self->_viewControllerFlags + 6) & 3;
          int v10 = 67109120;
          int v11 = v6;
          _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Unknown case for _viewControllerFlags.hasFocusGroupIdentifier (%d).", (uint8_t *)&v10, 8u);
        }
      }
    }
    char v4 = 0;
  }
LABEL_10:
  return (NSString *)v4;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  int v3 = [(UIViewController *)self _existingView];
  id v4 = [v3 superview];

  if ((_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_LinkCheckViewControllerParentFocusEnvironment, @"LinkCheckViewControllerParentFocusEnvironment", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger) & 1) == 0&& qword_1EB2570B8)
  {
    if (qword_1EB2570B8 > 0) {
      goto LABEL_13;
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    goto LABEL_13;
  }
  if (!v4)
  {
    id v5 = [(UIViewController *)self parentViewController];
    uint64_t v6 = [v5 _existingView];
    id v7 = (void *)v6;
    uint64_t v8 = v6 ? (void *)v6 : v5;
    id v4 = v8;

    if (!v4)
    {
      int v9 = [(UIViewController *)self presentingViewController];
      uint64_t v10 = [v9 _existingView];
      int v11 = (void *)v10;
      if (v10) {
        uint64_t v12 = (void *)v10;
      }
      else {
        uint64_t v12 = v9;
      }
      id v4 = v12;
    }
  }
LABEL_13:
  return (UIFocusEnvironment *)v4;
}

- (UIFocusItemContainer)focusItemContainer
{
  id v2 = [(UIViewController *)self _existingView];
  int v3 = [v2 superview];

  return (UIFocusItemContainer *)v3;
}

- (void)setPreferredFocusedItem:(id)a3
{
  objc_storeWeak((id *)&self->_preferredFocusedItem, a3);
  [(UIViewController *)self setNeedsFocusUpdate];
}

- (UIView)preferredFocusedView
{
  int v3 = [(UIViewController *)self preferredFocusedItem];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIViewController *)self _existingView];
  }
  uint64_t v6 = v5;

  return (UIView *)v6;
}

- (NSArray)preferredFocusEnvironments
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(UIViewController *)self preferredFocusedView];
  int v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (void)updateFocusIfNeeded
{
  id v2 = [(UIViewController *)self _focusSystem];
  [v2 updateFocusIfNeeded];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v10 = a3;
  id v5 = [(UIViewController *)self view];
  uint64_t v6 = [v10 nextFocusedItem];
  if (_UIFocusEnvironmentIsAncestorOfEnvironment(v5, v6))
  {
    id v7 = [(UIViewController *)self _presentationController];

    if (!v7) {
      [(UIViewController *)self _setPresentingFocusedItem:0];
    }
  }
  else
  {
  }
  uint64_t v8 = +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:v10];
  if (!v8)
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"UIViewController.m" lineNumber:14590 description:@"Received call to _didUpdateFocusInContext: outside of a focus update."];
  }
  [(UIViewController *)self didUpdateFocusInContext:v10 withAnimationCoordinator:v8];
}

- (void)_setNeedsNonDeferredFocusUpdate
{
  id v4 = [[_UIFocusUpdateRequest alloc] initWithEnvironment:self];
  [(_UIFocusUpdateRequest *)v4 setAllowsDeferral:0];
  int v3 = [(UIViewController *)self _focusSystem];
  [v3 _requestFocusUpdate:v4];
}

- (BOOL)_shouldIgnoreChildFocusRegions
{
  int v3 = [(UIViewController *)self _focusBehavior];
  char v4 = [v3 supportsViewTransparency];

  if (v4)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    uint64_t v5 = [(UIViewController *)self presentedViewController];

    if (v5)
    {
      uint64_t v5 = [(UIViewController *)self presentedViewController];
      uint64_t v6 = [(id)v5 popoverPresentationController];
      int v7 = [v6 _allowsFocusInPresentingViewController];

      LODWORD(v5) = v7 ^ 1;
    }
    uint64_t v8 = [(UIViewController *)self presentingViewController];
    int v9 = [v8 _presentationController];

    if (v9) {
      LODWORD(v5) = [v9 presented] ^ 1 | v5;
    }
  }
  return v5;
}

- (_UIFocusSystemSceneComponent)_focusSystemSceneComponent
{
  return (_UIFocusSystemSceneComponent *)+[_UIFocusSystemSceneComponent sceneComponentForEnvironment:self];
}

- (UIView)_showcaseView
{
  NSClassFromString(&cfstr_Qlpreviewcontr.isa);
  if (objc_opt_isKindOfClass())
  {
    int v3 = [(UIViewController *)self childViewControllers];
    char v4 = [v3 firstObject];
    uint64_t v5 = [v4 childViewControllers];
    uint64_t v6 = [v5 firstObject];
    int v7 = [v6 view];
  }
  else
  {
    int v7 = 0;
  }
  return (UIView *)v7;
}

- (double)customNavigationInteractiveTransitionDuration
{
  return self->_customNavigationInteractiveTransitionDuration;
}

- (void)setCustomNavigationInteractiveTransitionDuration:(double)a3
{
  self->_customNavigationInteractiveTransitionDuration = a3;
}

- (double)customNavigationInteractiveTransitionPercentComplete
{
  return self->_customNavigationInteractiveTransitionPercentComplete;
}

- (void)setCustomNavigationInteractiveTransitionPercentComplete:(double)a3
{
  self->_customNavigationInteractiveTransitionPercentComplete = a3;
}

- (UITransitionView)customTransitioningView
{
  return self->_customTransitioningView;
}

- (void)setCustomTransitioningView:(id)a3
{
}

- (UITraitCollection)_lastNotifiedTraitCollection
{
  return self->_lastNotifiedTraitCollection;
}

- (double)_navigationControllerContentOffsetAdjustment
{
  return self->_navigationControllerContentOffsetAdjustment;
}

- (void)_setLeftContentMargin:(double)a3
{
  self->_double leftContentMargin = a3;
}

- (void)_setRightContentMargin:(double)a3
{
  self->_double rightContentMargin = a3;
}

- (void)setInteractionActivityTrackingBaseName:(NSString *)interactionActivityTrackingBaseName
{
}

- (BOOL)_nextResponderIgnoresWindowIfRootVC
{
  return self->_nextResponderIgnoresWindowIfRootVC;
}

- (void)set_nextResponderIgnoresWindowIfRootVC:(BOOL)a3
{
  self->_nextResponderIgnoresWindowIfRootVC = a3;
}

- (UIView)savedHeaderSuperview
{
  return self->_savedHeaderSuperview;
}

- (NSMutableDictionary)_observableScrollViews
{
  return self->_observableScrollViews;
}

- (UIScrollView)_internalContentScrollView
{
  return self->_internalContentScrollView;
}

- (NSMapTable)_effectiveContentScrollViews
{
  return self->_effectiveContentScrollViews;
}

- (UIStoryboardSegue)_segueResponsibleForModalPresentation
{
  return self->_segueResponsibleForModalPresentation;
}

- (void)_setSegueResponsibleForModalPresentation:(id)a3
{
}

- (UIViewController)_sourceViewControllerIfPresentedViaPopoverSegue
{
  return self->_sourceViewControllerIfPresentedViaPopoverSegue;
}

- (void)_setSourceViewControllerIfPresentedViaPopoverSegue:(id)a3
{
  self->_sourceViewControllerIfPresentedViaPopoverSegue = (UIViewController *)a3;
}

- (UIViewController)_modalSourceViewController
{
  return self->_modalSourceViewController;
}

- (UIWindow)_expectedWindow
{
  return self->_expectedWindow;
}

- (void)_setOverrideUseCustomPresentation:(BOOL)a3
{
  self->overrideUseCustomPresentation = a3;
}

- (UIViewController)_presentedUserInterfaceStyleViewController
{
  return self->_presentedUserInterfaceStyleViewController;
}

- (void)setModalPresentationCapturesStatusBarAppearance:(BOOL)modalPresentationCapturesStatusBarAppearance
{
  self->_modalPresentationCapturesStatusBarAppearance = modalPresentationCapturesStatusBarAppearance;
}

- (UIFocusItem)_presentingFocusedItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingFocusedItem);
  return (UIFocusItem *)WeakRetained;
}

- (void)_setPresentingFocusedItem:(id)a3
{
}

- (void)setNavigationInsetAdjustment:(id)a3
{
}

- (NSArray)storyboardPreviewSegueTemplates
{
  return self->_storyboardPreviewSegueTemplates;
}

- (NSArray)storyboardCommitSegueTemplates
{
  return self->_storyboardCommitSegueTemplates;
}

- (NSArray)storyboardPreviewingRegistrants
{
  return self->_storyboardPreviewingRegistrants;
}

- (UIView)_embeddedView
{
  return self->__embeddedView;
}

- (void)_setEmbeddedView:(id)a3
{
}

- (void)_setEmbeddingView:(id)a3
{
}

- (CGRect)_embeddedViewFrame
{
  double x = self->__embeddedViewFrame.origin.x;
  double y = self->__embeddedViewFrame.origin.y;
  double width = self->__embeddedViewFrame.size.width;
  double height = self->__embeddedViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setEmbeddedViewFrame:(CGRect)a3
{
  self->__embeddedViewFrame = a3;
}

- (void)_setEmbeddedDelegate:(id)a3
{
  self->__embeddedDelegate = (_UIViewControllerContentViewEmbedding *)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_presentationSizeClassPair
{
  p_presentationSizeClassPair = &self->_presentationSizeClassPair;
  int64_t width = self->_presentationSizeClassPair.width;
  int64_t height = p_presentationSizeClassPair->height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (UIView)preferredFocusedItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredFocusedItem);
  return (UIView *)WeakRetained;
}

- (void)setIgnoresParentMargins:(BOOL)a3
{
  self->_ignoresParentMargins = a3;
}

- (void)set_departingParentViewController:(id)a3
{
}

- (UIContainerBackgroundStyle)preferredContainerBackgroundStyle
{
  return self->_preferredContainerBackgroundStyle;
}

- (UIViewController)childViewControllerForPreferredContainerBackgroundStyle
{
  return self->_childViewControllerForPreferredContainerBackgroundStyle;
}

- (BOOL)performsActionsWhilePresentingModally
{
  if (qword_1EB25BC08 != -1) {
    dispatch_once(&qword_1EB25BC08, &__block_literal_global_2259);
  }
  return byte_1EB25BB28;
}

void __76__UIViewController_UIPerformsActions__performsActionsWhilePresentingModally__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 infoDictionary];
  char v4 = [v1 objectForKey:@"UIViewControllerPerformsActionsWhilePresentingModally"];

  id v2 = v4;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v3 = [v4 BOOLValue];
    }
    else {
      char v3 = 1;
    }
    id v2 = v4;
  }
  else
  {
    char v3 = 1;
  }
  byte_1EB25BB28 = v3;
}

- (void)_setTabElementChangeObserver:(id)a3
{
}

- (id)_moreListTitle
{
  return 0;
}

- (BOOL)_tvTabBarShouldOverlap
{
  return 1;
}

- (BOOL)_tvTabBarShouldAutohide
{
  uint64_t v3 = [(UIViewController *)self tabBarController];
  if (!v3) {
    return 0;
  }
  char v4 = (void *)v3;
  uint64_t v5 = [(UIViewController *)self tabBarController];
  uint64_t v6 = [v5 tabBar];

  if (!v6) {
    return 0;
  }
  int v7 = [(UIViewController *)self tabBarController];
  uint64_t v8 = [v7 tabBar];
  BOOL v9 = [v8 _displayStyle] == 0;

  return v9;
}

- (id)moreListImage
{
  return 0;
}

- (id)moreListSelectedImage
{
  return 0;
}

- (id)moreListTableCell
{
  return 0;
}

- (UIViewController)separateSecondaryViewControllerForSplitViewController:(UISplitViewController *)splitViewController
{
  return 0;
}

- (void)_toggleEditing:(id)a3
{
  uint64_t v4 = [(UIViewController *)self isEditing] ^ 1;
  [(UIViewController *)self setEditing:v4 animated:1];
}

- (BOOL)canHandleSnapbackIdentifier:(id)a3 animated:(BOOL)a4
{
  return 0;
}

- (void)_setSuppressesBottomBar:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t viewControllerFlags = *(void *)&self->_viewControllerFlags & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (double)_topBarHeight
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = [(UIViewController *)self view];
  uint64_t v4 = [v3 subviews];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  double v6 = 0.0;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v10 origin];
          double v12 = v11;
          [(UIViewController *)self _statusBarHeightForCurrentInterfaceOrientation];
          if (v12 == v13)
          {
            [v10 size];
            double v15 = v14;
            [(UIViewController *)self _statusBarHeightForCurrentInterfaceOrientation];
            double v6 = v15 + v16;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (void)transitionFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void *)animations completion:(void *)completion
{
  float v36 = fromViewController;
  double v15 = toViewController;
  double v16 = completion;
  long long v17 = animations;
  BOOL v18 = [(UIViewController *)self _forwardAppearanceMethods];
  unint64_t v19 = 0x1E4F1C000;
  long long v20 = (void *)MEMORY[0x1E4F1C3C8];
  if (!v18)
  {
    long long v21 = NSString;
    self;
    uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v22);
    v24 = UIViewAnimationOptions v23 = options;
    double v25 = NSStringFromSelector(a2);
    long long v26 = [v21 stringWithFormat:@"-[%@ %@]", v24, v25];

    long long v20 = (void *)MEMORY[0x1E4F1C3C8];
    options = v23;
    unint64_t v19 = 0x1E4F1C000uLL;

    [MEMORY[0x1E4F1CA00] raise:*v20, @"Parent view controller is using legacy containment in call to %@", v26 format];
  }
  long long v27 = [(UIViewController *)v15 parentViewController];
  if (v27 == self)
  {
    long long v28 = [(UIViewController *)v36 parentViewController];

    if (v28 == self) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  double v29 = NSString;
  self;
  double v30 = (objc_class *)objc_claimAutoreleasedReturnValue();
  double v31 = NSStringFromClass(v30);
  double v32 = NSStringFromSelector(a2);
  double v33 = [v29 stringWithFormat:@"-[%@ %@]", v31, v32];

  [*(id *)(v19 + 2560) raise:*v20, @"Children view controllers %@ and %@ must have a common parent view controller when calling %@", v36, v15, v33 format];
LABEL_7:
  double v34 = [(UIViewController *)v36 view];
  double v35 = [(UIViewController *)v15 view];
  +[UIView _transitionFromView:toView:duration:options:animations:completion:](duration, (uint64_t)UIView, v34, v35, options, v17, v16);
}

- (BOOL)_hackFor11408026_beginAppearanceTransition:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  int64_t explicitAppearanceTransitionLevel = self->_explicitAppearanceTransitionLevel;
  self->_int64_t explicitAppearanceTransitionLevel = explicitAppearanceTransitionLevel + 1;
  if (explicitAppearanceTransitionLevel >= 1)
  {
    if ((((*(void *)&self->_viewControllerFlags & 0x4000000) == 0) ^ a3)) {
      return 0;
    }
    self->_int64_t explicitAppearanceTransitionLevel = 1;
  }
  uint64_t viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  if ((viewControllerFlags & 0x8000000) != 0) {
    return 0;
  }
  uint64_t v9 = 0x4000000;
  if (!a3) {
    uint64_t v9 = 0;
  }
  *((_WORD *)&self->_viewControllerFlags + 4) = *((_WORD *)&self->_viewControllerFlags + 4);
  *(void *)&self->_uint64_t viewControllerFlags = viewControllerFlags & 0xFFFFFFFFFBFFFFFFLL | v9;
  [(UIViewController *)self setInAnimatedVCTransition:a4];
  if (v5) {
    [(UIViewController *)self __viewWillAppear:v4];
  }
  else {
    -[UIViewController __viewWillDisappear:]((uint64_t)self, v4);
  }
  return 1;
}

- (BOOL)_hackFor11408026_endAppearanceTransition
{
  return -[UIViewController _endAppearanceTransition:]((uint64_t)self, 0);
}

- (void)cancelBeginAppearanceTransition
{
  uint64_t v3 = [(UIViewController *)self isInAnimatedVCTransition];
  self->_int64_t explicitAppearanceTransitionLevel = 0;
  *(void *)&self->_viewControllerFlags &= ~0x4000000uLL;
  [(UIViewController *)self setAfterAppearanceBlock:0];
  [(UIViewController *)self setInAnimatedVCTransition:0];
  int v4 = (*(_DWORD *)&self->_viewControllerFlags >> 1) & 3;
  if (v4 == 3)
  {
    [(UIViewController *)self __viewWillAppear:v3];
    [(UIViewController *)self __viewDidAppear:v3];
  }
  else if (v4 == 1)
  {
    -[UIViewController __viewWillDisappear:]((uint64_t)self, v3);
    -[UIViewController __viewDidDisappear:]((uint64_t)self, v3);
  }
}

- (BOOL)_isContainmentChanging
{
  return (*(void *)&self->_viewControllerFlags >> 25) & 1;
}

- (id)_restorationClassName
{
  return objc_getAssociatedObject(self, &kViewControllerRestorationClassKey);
}

- (id)restorationClass
{
  id v2 = [(UIViewController *)self _restorationClassName];
  uint64_t v3 = v2;
  if (v2) {
    id v2 = (NSString *)NSClassFromString(v2);
  }
  int v4 = v2;

  return v4;
}

- (void)setRestorationClass:(id)restorationClass
{
  NSStringFromClass((Class)restorationClass);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &kViewControllerRestorationClassKey, v4, (void *)1);
}

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v18.receiver = self;
  v18.super_class = (Class)UIViewController;
  [(UIResponder *)&v18 encodeRestorableStateWithCoder:v4];
  BOOL v5 = [(UIViewController *)self childModalViewController];
  double v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 _restorationIdentifierPath];
    uint64_t v8 = [v6 _existingPresentationControllerImmediate:1 effective:1];
    uint64_t v9 = v8;
    if (v7 && v8 && [v8 _shouldSavePresentedViewControllerForStateRestoration])
    {
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SPresentedView.isa, "-[UIViewController(StateRestoration) encodeRestorableStateWithCoder:]", v7, v6);
      }
      id v10 = [v6 presentationController];
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SPresentationc.isa, "-[UIViewController(StateRestoration) encodeRestorableStateWithCoder:]", v10);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v10 delegate],
            double v11 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v11,
            (isKindOfClass & 1) != 0))
      {
        if (_UIStateRestorationDebugLogEnabled()) {
          NSLog(&cfstr_SPresentationI.isa, "-[UIViewController(StateRestoration) encodeRestorableStateWithCoder:]");
        }
      }
      else
      {
        [(NSCoder *)v4 encodeObject:v6 forKey:@"kPresentedViewControllerKey"];
      }
    }
    else
    {
      double v13 = [v6 _existingView];
      double v14 = [v13 window];

      if (v14)
      {
        if (_UIStateRestorationDebugLogEnabled()) {
          NSLog(&cfstr_SPresentedView_0.isa, "-[UIViewController(StateRestoration) encodeRestorableStateWithCoder:]", v6);
        }
        [(id)UIApp ignoreSnapshotOnNextApplicationLaunch];
      }
    }
  }
  double v15 = [(UIViewController *)self storyboard];
  if (v15)
  {
    double v16 = [[_UIStoryboardProxy alloc] initWithStoryboard:v15];
    [(NSCoder *)v4 encodeObject:v16 forKey:@"UIStateRestorationViewControllerStoryboard"];
    long long v17 = [(UIViewController *)self storyboardIdentifier];
    if (v17) {
      [(NSCoder *)v4 encodeObject:v17 forKey:@"UIStateRestorationViewControllerStoryboardIdentifier"];
    }
  }
}

- (void)_presentViewControllerForStateRestoration:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popoverController);
  if (WeakRetained) {
    int v8 = 1;
  }
  else {
    int v8 = [v6 _isDelayingPresentation];
  }
  int v9 = v8 | v4;

  if (v9)
  {
    [(UIViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __89__UIViewController_StateRestoration___presentViewControllerForStateRestoration_animated___block_invoke;
    v10[3] = &unk_1E52D9F98;
    void v10[4] = self;
    id v11 = v6;
    +[UIViewController _performWithoutDeferringTransitions:v10];
  }
}

void __89__UIViewController_StateRestoration___presentViewControllerForStateRestoration_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:0 completion:0];
  id v4 = [*(id *)(a1 + 32) _window];
  id v2 = [v4 windowScene];
  uint64_t v3 = [v2 statusBarManager];
  [v3 updateStatusBarAppearance];
}

- (id)_decodeRestorableStateAndReturnContinuationWithCoder:(id)a3
{
  id v4 = a3;
  [(UIResponder *)self decodeRestorableStateWithCoder:v4];
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPresentedViewControllerKey"];

  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SDecodedPresen.isa, "-[UIViewController(StateRestoration) _decodeRestorableStateAndReturnContinuationWithCoder:]", v5);
  }
  if (v5)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__UIViewController_StateRestoration___decodeRestorableStateAndReturnContinuationWithCoder___block_invoke;
    aBlock[3] = &unk_1E52D9F98;
    id v10 = v5;
    id v11 = self;
    id v6 = _Block_copy(aBlock);
    uint64_t v7 = _Block_copy(v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __91__UIViewController_StateRestoration___decodeRestorableStateAndReturnContinuationWithCoder___block_invoke(uint64_t a1)
{
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SCompletionFor.isa, "-[UIViewController(StateRestoration) _decodeRestorableStateAndReturnContinuationWithCoder:]_block_invoke", *(void *)(a1 + 32));
  }
  uint64_t v2 = [*(id *)(a1 + 40) _existingView];
  if (v2
    && (uint64_t v3 = (void *)v2,
        [*(id *)(a1 + 40) _existingView],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 window],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v5))
  {
    char v6 = [v5 isHidden];
    uint64_t v7 = [v5 traitCollection];
    uint64_t v8 = [(id)UIApp _sceneInterfaceOrientationFromWindow:v5];
    if ([v7 horizontalSizeClass] == 2 && (unint64_t)(v8 - 5) >= 0xFFFFFFFFFFFFFFFELL)
    {
      if ([*(id *)(a1 + 32) modalPresentationStyle] != 3)
      {
        char v9 = [*(id *)(a1 + 32) modalPresentationStyle] == 6 ? 1 : v6;
        if ((v9 & 1) == 0)
        {
LABEL_19:
          if ([*(id *)(a1 + 32) modalPresentationStyle] == 3
            || [*(id *)(a1 + 32) modalPresentationStyle] == 6)
          {
            [v5 setNeedsLayout];
            [v5 layoutIfNeeded];
          }
          [*(id *)(a1 + 40) _presentViewControllerForStateRestoration:*(void *)(a1 + 32) animated:0];
          goto LABEL_17;
        }
      }
    }
    else if ((v6 & 1) == 0)
    {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v7 = [0 traitCollection];
    [v7 horizontalSizeClass];
    BOOL v5 = 0;
  }
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SWarningStateR.isa, "-[UIViewController(StateRestoration) _decodeRestorableStateAndReturnContinuationWithCoder:]_block_invoke", *(void *)(a1 + 40), *(void *)(a1 + 32));
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__UIViewController_StateRestoration___decodeRestorableStateAndReturnContinuationWithCoder___block_invoke_2;
  block[3] = &unk_1E52D9F98;
  int8x16_t v11 = *(int8x16_t *)(a1 + 32);
  id v10 = (id)v11.i64[0];
  int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
  dispatch_async(MEMORY[0x1E4F14428], block);

LABEL_17:
}

void __91__UIViewController_StateRestoration___decodeRestorableStateAndReturnContinuationWithCoder___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) transitionCoordinator];

  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 transitionCoordinator];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __91__UIViewController_StateRestoration___decodeRestorableStateAndReturnContinuationWithCoder___block_invoke_3;
    v7[3] = &unk_1E52DB270;
    BOOL v5 = *(void **)(a1 + 40);
    void v7[4] = *(void *)(a1 + 32);
    id v8 = v5;
    [v4 animateAlongsideTransition:0 completion:v7];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    [v3 _presentViewControllerForStateRestoration:v6 animated:1];
  }
}

uint64_t __91__UIViewController_StateRestoration___decodeRestorableStateAndReturnContinuationWithCoder___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentViewControllerForStateRestoration:*(void *)(a1 + 40) animated:1];
}

- (BOOL)_shouldLoadViewDuringRestoration:(id)a3
{
  return 1;
}

- (void)_unembedContentViewSettingDelegate:(id)a3
{
  id v4 = a3;
  [(UIViewController *)self _setEmbeddingView:0];
  [(UIViewController *)self _setEmbeddedDelegate:v4];

  BOOL v5 = [(UIViewController *)self _embeddedView];

  if (v5)
  {
    id v16 = [(UIViewController *)self view];
    [v16 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(UIViewController *)self _embeddedView];
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    double v15 = [(UIViewController *)self _embeddedView];
    [(UIViewController *)self setView:v15];

    [(UIViewController *)self _setEmbeddedView:0];
  }
}

- (void)_embedContentViewInView:(id)a3 withContentFrame:(CGRect)a4 delegate:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v22 = a3;
  id v11 = a5;
  [(UIViewController *)self _setEmbeddedDelegate:v11];
  -[UIViewController _setEmbeddedViewFrame:](self, "_setEmbeddedViewFrame:", x, y, width, height);
  if ([(UIViewController *)self isViewLoaded])
  {
    if (v22)
    {
      double v12 = [(UIViewController *)self _embeddedView];
      if (v12) {
        [(UIViewController *)self _embeddedView];
      }
      else {
      double v13 = [(UIViewController *)self view];
      }

      double v14 = [(UIViewController *)self view];
      [v14 frame];
      objc_msgSend(v22, "setFrame:");

      double v15 = [(UIViewController *)self view];
      id v16 = [v15 superview];
      long long v17 = [(UIViewController *)self view];
      [v16 insertSubview:v22 belowSubview:v17];

      [v22 addSubview:v13];
      v24.origin.double x = x;
      v24.origin.double y = y;
      v24.size.double width = width;
      v24.size.double height = height;
      if (CGRectIsEmpty(v24))
      {
        [v22 frame];
        double x = v18;
        double y = v19;
        double width = v20;
        double height = v21;
      }
      objc_msgSend(v13, "setFrame:", x, y, width, height);
      [(UIViewController *)self _setEmbeddedView:v13];
      [(UIViewController *)self setView:v22];
      [(UIViewController *)self _setEmbeddingView:0];
    }
    else
    {
      [(UIViewController *)self _unembedContentViewSettingDelegate:v11];
    }
  }
  else
  {
    [(UIViewController *)self _setEmbeddedView:0];
    [(UIViewController *)self _setEmbeddingView:v22];
  }
}

- (void)_unembedContentView
{
}

- (id)_animatorForOperation:(int64_t)a3 fromViewController:(id)a4 toViewController:(id)a5
{
  return 0;
}

- (void)_setOverrideTransitioningDelegate:(id)a3
{
  id v6 = a3;
  id v5 = [(UIViewController *)self _overrideTransitioningDelegate];

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_overrideTransitioningDelegate, a3);
    [(UIViewController *)self _setTemporaryPresentationController:0];
  }
}

- (int64_t)_rotatingFromInterfaceOrientation
{
  uint64_t v2 = [(UIViewController *)self _existingView];
  uint64_t v3 = [v2 window];

  if (v3)
  {
    int64_t v4 = [v3 _fromWindowOrientation];
    if (v4 == [v3 _toWindowOrientation]) {
      int64_t v4 = 0;
    }
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)_window:(id)a3 viewWillTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (v10) {
    [v10 targetTransform];
  }
  else {
    memset(&v44, 0, sizeof(v44));
  }
  if (CGAffineTransformIsIdentity(&v44))
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __104__UIViewController_AdaptiveSizing_Internal___window_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v40[3] = &unk_1E52E05A8;
    void v40[4] = self;
    double v42 = width;
    double v43 = height;
    id v41 = v11;
    +[UIViewController _performWithoutDeferringTransitions:v40];
  }
  else
  {
    [v11 transitionDuration];
    double v13 = v12;
    uint64_t v14 = [v9 _toWindowOrientation];
    uint64_t v15 = [v9 _fromWindowOrientation];
    id v16 = [[UIClientRotationContext alloc] initWithClient:self toOrientation:v14 duration:v9 andWindow:v13];
    long long v17 = [(UIViewController *)self view];
    [v17 frame];
    uint64_t v19 = v18;
    uint64_t v21 = v20;

    -[UIViewController window:willRotateToInterfaceOrientation:duration:newSize:](self, "window:willRotateToInterfaceOrientation:duration:newSize:", v9, v14, v13, width, height);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __104__UIViewController_AdaptiveSizing_Internal___window_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v33[3] = &unk_1E52EA2D8;
    v33[4] = self;
    id v34 = v9;
    uint64_t v36 = v14;
    double v37 = v13;
    double v38 = width;
    double v39 = height;
    double v35 = v16;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __104__UIViewController_AdaptiveSizing_Internal___window_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
    v27[3] = &unk_1E52EA300;
    v27[4] = self;
    double v29 = v35;
    uint64_t v30 = v15;
    uint64_t v31 = v19;
    uint64_t v32 = v21;
    id v28 = v34;
    id v22 = v35;
    [v11 animateAlongsideTransition:v33 completion:v27];
    [(UIViewController *)self setInWillRotateCallback:1];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __104__UIViewController_AdaptiveSizing_Internal___window_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
    v23[3] = &unk_1E52E05A8;
    v23[4] = self;
    double v25 = width;
    double v26 = height;
    id v24 = v11;
    +[UIViewController _performWithoutDeferringTransitions:v23];
    [(UIClientRotationContext *)v22 setupRotationOrderingKeyboardInAfterRotation:0];
    [(UIViewController *)self setInWillRotateCallback:0];
  }
  if (([(id)objc_opt_class() _shouldForwardViewWillTransitionToSize] & 1) == 0) {
    [(UIViewController *)self _sendViewWillTransitionToSizeToPresentationController:width withTransitionCoordinator:height];
  }
}

uint64_t __104__UIViewController_AdaptiveSizing_Internal___window_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "viewWillTransitionToSize:withTransitionCoordinator:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __104__UIViewController_AdaptiveSizing_Internal___window_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "window:willAnimateRotationToInterfaceOrientation:duration:newSize:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v2 = *(void **)(a1 + 48);
  return [v2 rotateSnapshots];
}

uint64_t __104__UIViewController_AdaptiveSizing_Internal___window_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "window:didRotateFromInterfaceOrientation:oldSize:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  uint64_t v2 = *(void **)(a1 + 48);
  return [v2 finishFullRotateUsingOnePartAnimation:1];
}

uint64_t __104__UIViewController_AdaptiveSizing_Internal___window_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "viewWillTransitionToSize:withTransitionCoordinator:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (id)_navigationBarForDragAffordance
{
  return 0;
}

- (BOOL)_isSplitViewController
{
  return 0;
}

- (void)_showAccessibilityHUDItem:(id)a3
{
  id v28 = a3;
  accessibilityHUD = self->_accessibilityHUD;
  if (accessibilityHUD)
  {
    id v5 = [(UIAccessibilityHUDView *)accessibilityHUD item];
    char v6 = [v28 isEqual:v5];

    double v7 = v28;
    if (v6) {
      goto LABEL_10;
    }
    [(UIAccessibilityHUDView *)self->_accessibilityHUD setItem:v28];
    double v8 = +[UIAccessibilityHUDPositionManager sharedInstance];
    id v9 = self->_accessibilityHUD;
    id v10 = [(UIViewController *)self view];
    [v8 adjustViewPropertiesForHUD:v9 withReferenceView:v10];
  }
  else
  {
    id v11 = [[UIAccessibilityHUDView alloc] initWithHUDItem:v28];
    double v12 = self->_accessibilityHUD;
    self->_accessibilityHUD = v11;

    double v13 = [(UIViewController *)self view];
    double v8 = [v13 window];

    uint64_t v14 = [(UIViewController *)self view];
    uint64_t v15 = [v14 window];
    char v16 = [v15 _isHostedInAnotherProcess];

    if ((v16 & 1) == 0)
    {
      long long v17 = +[UIAccessibilityHUDWindow sharedWindow];

      if (!v17)
      {
        uint64_t v18 = [(UIViewController *)self view];
        uint64_t v19 = [v18 window];
        uint64_t v20 = [v19 windowScene];
        +[UIAccessibilityHUDWindow createSharedWindowWithScene:v20];
      }
      uint64_t v21 = +[UIAccessibilityHUDWindow sharedWindow];

      double v8 = (void *)v21;
    }
    [v8 setHidden:0];
    [v8 addSubview:self->_accessibilityHUD];
    id v22 = +[UIAccessibilityHUDPositionManager sharedInstance];
    UIViewAnimationOptions v23 = self->_accessibilityHUD;
    id v24 = [(UIViewController *)self view];
    [v22 adjustViewPropertiesForHUD:v23 withReferenceView:v24];

    double v25 = +[UIAccessibilityHUDPositionManager sharedInstance];
    double v26 = self->_accessibilityHUD;
    long long v27 = [(UIViewController *)self view];
    [v25 beginManagingPositionOfHUD:v26 withReferenceView:v27];

    [(UIAccessibilityHUDView *)self->_accessibilityHUD showAnimated:1 completion:0];
  }

  double v7 = v28;
LABEL_10:
}

- (void)_dismissAccessibilityHUD
{
  uint64_t v3 = [(UIView *)self->_accessibilityHUD window];
  int64_t v4 = self->_accessibilityHUD;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __62__UIViewController_AccessibilityHUD___dismissAccessibilityHUD__block_invoke;
  id v11 = &unk_1E52D9F98;
  double v12 = v4;
  id v13 = v3;
  id v5 = v3;
  char v6 = v4;
  [(UIAccessibilityHUDView *)v6 dismissAnimated:1 completion:&v8];
  accessibilityHUD = self->_accessibilityHUD;
  self->_accessibilityHUD = 0;

  +[UIAccessibilityHUDWindow removeSharedWindow];
}

void __62__UIViewController_AccessibilityHUD___dismissAccessibilityHUD__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[UIAccessibilityHUDPositionManager sharedInstance];
  [v2 stopManagingPositionOfHUD:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t v3 = *(void **)(a1 + 40);
  int64_t v4 = +[UIAccessibilityHUDWindow sharedWindow];

  if (v3 == v4)
  {
    id v5 = *(void **)(a1 + 40);
    [v5 setHidden:1];
  }
}

- (id)_orientationDebugDescriptionBuilderWithMultilinePrefix:(id)a3
{
  int64_t v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  char v6 = [v4 builderWithObject:self];
  [v6 setActiveMultilinePrefix:v5];

  double v7 = [v6 activeMultilinePrefix];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __97__UIViewController_OrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E52D9F98;
  id v8 = v6;
  id v12 = v8;
  id v13 = self;
  [v8 appendBodySectionWithName:0 multilinePrefix:v7 block:v11];

  id v9 = v8;
  return v9;
}

id __97__UIViewController_OrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "_ignoreAppSupportedOrientations"), @"ignoresAppSupportedOrientations", 1);
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientationMask:withName:", objc_msgSend(*(id *)(a1 + 40), "supportedInterfaceOrientations"), @"providedSupportedOrientations");
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientationMask:withName:", objc_msgSend(*(id *)(a1 + 40), "__supportedInterfaceOrientations"), @"resolvedSupportedOrientations");
  uint64_t IsBeingPresentedOrDismissesFullscreen = _UIViewControllerIsBeingPresentedOrDismissesFullscreen(*(void **)(a1 + 40));
  id result = (id)[*(id *)(a1 + 32) appendBool:IsBeingPresentedOrDismissesFullscreen withName:@"canPreferOrientation"];
  if (IsBeingPresentedOrDismissesFullscreen) {
    return (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:skipIfUnknown:", objc_msgSend(*(id *)(a1 + 40), "preferredInterfaceOrientationForPresentation"), @"preferred", 1);
  }
  return result;
}

- (id)_orientationDebugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(UIViewController *)self _orientationDebugDescriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)_orientationDebugDescription
{
  return [(UIViewController *)self _orientationDebugDescriptionWithMultilinePrefix:0];
}

+ (BOOL)_initializedByViewServices
{
  return 1;
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = [a3 _UUID];
  [(UIViewController *)self _setExtensionContextUUID:v4];
}

- (id)_safeViewControllerForSupportedInterfaceOrientationsWithDismissCheck:(BOOL)a3
{
  id v5 = [(UIViewController *)self _viewControllerForSupportedInterfaceOrientationsWithDismissCheck:a3];
  char v6 = objc_msgSend(v5, "__autorotationSanityCheckObjectFromSource:selector:", self, a2);

  return v6;
}

void __85__UIViewController__UIAlwaysOnEnvironment___effectiveControllersForAlwaysOnTimelines__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 _effectiveControllersForAlwaysOnTimelines];
  [v2 addObjectsFromArray:v3];
}

- (id)_timelinesForDateInterval:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(UIViewController *)self performSelector:sel_puic_timelinesForDateInterval_ withObject:v4];
  }
  else
  {
    char v6 = [MEMORY[0x1E4F4F4B0] emptyTimelineWithIdentifier:@"UIAlwaysOnFallbackTimelineIdentifier"];
    v8[0] = v6;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  return v5;
}

- (void)_timelinesForDateInterval:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = [(UIViewController *)self _timelinesForDateInterval:a3];
  (*((void (**)(id, id))a4 + 2))(v7, v8);
}

- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4
{
  char v6 = (void (**)(void))a4;
  [(UIViewController *)self _updateWithFrameSpecifier:a3];
  v6[2]();
}

- (void)_updateWithFrameSpecifier:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(UIViewController *)self performSelector:sel_puic_updateWithFrameSpecifier_ withObject:v4];
  }
}

- (void)_willEnterAlwaysOn
{
  id v2 = [(UIViewController *)self _childViewControllersForAlwaysOnTimelines];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_287];
}

uint64_t __62__UIViewController__UIAlwaysOnEnvironment___willEnterAlwaysOn__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _willEnterAlwaysOn];
}

- (void)_didEnterAlwaysOn
{
  id v2 = [(UIViewController *)self _childViewControllersForAlwaysOnTimelines];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_45_1];
}

uint64_t __61__UIViewController__UIAlwaysOnEnvironment___didEnterAlwaysOn__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _didEnterAlwaysOn];
}

- (void)_willExitAlwaysOn
{
  id v2 = [(UIViewController *)self _childViewControllersForAlwaysOnTimelines];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_47_1];
}

uint64_t __61__UIViewController__UIAlwaysOnEnvironment___willExitAlwaysOn__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _willExitAlwaysOn];
}

- (void)_didExitAlwaysOn
{
  id v2 = [(UIViewController *)self _childViewControllersForAlwaysOnTimelines];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_49_1];
}

uint64_t __60__UIViewController__UIAlwaysOnEnvironment___didExitAlwaysOn__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _didExitAlwaysOn];
}

- (id)_viewContainerForContainerWindowPortalInteraction
{
  return 0;
}

- (id)_nextViewControllerForUnwindSegueSearch
{
  id v3 = [(UIViewController *)self _sourceViewControllerIfPresentedViaPopoverSegue];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    char v6 = [(UIViewController *)self _modalSourceViewController];
    id v7 = v6;
    if (v6)
    {
      id v5 = v6;
    }
    else
    {
      id v8 = [(UIViewController *)self parentModalViewController];
      id v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = [(UIViewController *)self parentViewController];
      }
      id v5 = v10;
    }
  }

  return v5;
}

- (id)_hostedWindowScene
{
  id v2 = [(UIViewController *)self view];
  id v3 = [v2 _window];
  id v4 = [v3 _windowHostingScene];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_allowsStylingSheetsAsCards
{
  return 0;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 1;
}

- (BOOL)_shouldForwardSystemLayoutFittingSizeChanges
{
  return 0;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 0;
}

- (void)_supportedInterfaceOrientationsDidChange
{
  id v2 = [(UIViewController *)self _rootAncestorViewController];
  [v2 setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (id)_hostApplicationBundleIdentifier
{
  return objc_getAssociatedObject(self, &__hostApplicationBundleIdentifierKey);
}

- (id)_remoteViewControllerProxy
{
  return objc_getAssociatedObject(self, &__remoteViewControllerProxyKey);
}

- (id)_remoteViewControllerProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(UIViewController *)self _remoteViewControllerProxy];
  char v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

+ (id)_remoteViewControllerInterface
{
  return 0;
}

+ (id)_exportedInterface
{
  return 0;
}

- (int)_hostProcessIdentifier
{
  id v2 = objc_getAssociatedObject(self, &__hostProcessIdentifierKey);
  int v3 = [v2 intValue];

  return v3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)_hostAuditToken
{
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  objc_getAssociatedObject(self, &__hostAuditTokenKey);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!strcmp((const char *)[v5 objCType], "{?=[8I]}")) {
    [v5 getValue:retstr];
  }

  return result;
}

- (id)invalidate
{
  id v2 = +[_UIAsyncInvocation invocationWithBlock:&__block_literal_global_622];
  int v3 = [v2 invoke];

  return v3;
}

uint64_t __52__UIViewController_ViewService_Internal__invalidate__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)_setHostApplicationBundleIdentifier:(id)a3
{
}

- (void)_setRemoteViewControllerProxy:(id)a3
{
}

- (void)_setHostProcessIdentifier:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  objc_setAssociatedObject(self, &__hostProcessIdentifierKey, v4, (void *)0x301);
}

- (void)_setHostAuditToken:(id *)a3
{
  [MEMORY[0x1E4F29238] valueWithBytes:a3 objCType:"{?=[8I]}"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &__hostAuditTokenKey, v4, (void *)0x301);
}

+ (id)XPCInterface
{
  if (qword_1EB264E38 != -1) {
    dispatch_once(&qword_1EB264E38, &__block_literal_global_26_8);
  }
  [(id)qword_1EB264E30 lock];
  int v3 = objc_getAssociatedObject(a1, &_MergedGlobals_1305);
  if (!v3)
  {
    id v4 = [a1 _exportedInterface];
    id v5 = [a1 _remoteViewControllerInterface];
    int v3 = +[_UIViewServiceViewControllerDeputyXPCInterface interfaceWithExportedInterface:v4 remoteViewControllerInterface:v5];

    objc_setAssociatedObject(a1, &_MergedGlobals_1305, v3, (void *)0x301);
  }
  [(id)qword_1EB264E30 unlock];
  return v3;
}

void __54__UIViewController_ViewService_Internal__XPCInterface__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  id v1 = (void *)qword_1EB264E30;
  qword_1EB264E30 = (uint64_t)v0;
}

- (void)__prepareForDisconnectionWithCompletionHandler:(id)a3
{
}

@end