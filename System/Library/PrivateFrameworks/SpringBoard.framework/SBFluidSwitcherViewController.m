@interface SBFluidSwitcherViewController
+ (id)_largeGridSizeClassesForIconZoom;
+ (id)_mediumGridSizeClassesForIconZoom;
- (BOOL)_allowsTitleItemsForAppLayout:(id)a3;
- (BOOL)_appLayoutRequiresLegacyRotationSupport:(id)a3;
- (BOOL)_appLayoutWantsToBeKeptInViewHierarchy:(id)a3;
- (BOOL)_areContinuousExposeStripsUnoccluded;
- (BOOL)_controlsHomeScreenContents;
- (BOOL)_controlsWallpaper;
- (BOOL)_hitTestedToTopAffordance:(CGPoint)a3 window:(id)a4 forLeafAppLayout:(id)a5;
- (BOOL)_isAppLayoutBlurred:(id)a3;
- (BOOL)_isLayoutStateSwitcher:(id)a3 allowTransitions:(BOOL)a4;
- (BOOL)_isPerformingMatchMoveToIconView;
- (BOOL)_isSwitcherForegroundActive;
- (BOOL)_removeVisibleItemContainerForAppLayout:(id)a3;
- (BOOL)_shouldInterruptPresentationAndDismiss;
- (BOOL)_shouldItemContainersUseDarkLabels;
- (BOOL)_shouldLogSwitcherModifierEvent:(id)a3;
- (BOOL)_supportsKillingForAppLayout:(id)a3;
- (BOOL)anyDisplayItemForAppLayoutOverlapsFloatingDock:(id)a3;
- (BOOL)anyHighlightedAppLayoutsForContinuousExposeIdentifier:(id)a3;
- (BOOL)appLayoutContainsAnUnoccludedMaximizedDisplayItem:(id)a3;
- (BOOL)appLayoutContainsAnUnoccludedMaximizedDisplayItem:(id)a3 ignoreOcclusion:(BOOL)a4 displayItem:(id *)a5;
- (BOOL)appLayoutContainsOnlyResizableApps:(id)a3;
- (BOOL)areLiveContentOverlayUpdatesSuspended;
- (BOOL)canInterruptActiveTransition;
- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4;
- (BOOL)canSelectContainer:(id)a3 numberOfTaps:(int64_t)a4;
- (BOOL)displayItemIsClassic:(id)a3;
- (BOOL)displayItemSupportsCenterRole:(id)a3;
- (BOOL)displayItemSupportsMedusa:(id)a3;
- (BOOL)displayItemSupportsMultipleWindowsIndicator:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)hasHomeButton;
- (BOOL)historianModifier:(id)a3 shouldRecordEvent:(id)a4;
- (BOOL)hitTestedToFloatingElement:(CGPoint)a3 window:(id)a4 ofItemContainer:(id)a5;
- (BOOL)hitTestedToTopAffordance:(CGPoint)a3 window:(id)a4 ofItemContainer:(id)a5;
- (BOOL)homeScreenHasModalLibraryOpenInForeground;
- (BOOL)homeScreenHasOpenFolder;
- (BOOL)homeScreenHasOpenFolderInLocation:(id)a3;
- (BOOL)homeScreenHasWidgetCenterOrLibraryOpen;
- (BOOL)isAppLayoutMostRecentRepresentationOfDisplayItems:(id)a3;
- (BOOL)isAppLayoutVisibleInSwitcherBounds:(id)a3;
- (BOOL)isAssistantKeyboardVisible;
- (BOOL)isAsyncRenderingDisabled;
- (BOOL)isChamoisWindowingUIEnabled;
- (BOOL)isDevicePad;
- (BOOL)isDisplayEmbedded;
- (BOOL)isEdgeProtectedForHomeGestureAtEdgeLocation:(double)a3 edge:(unint64_t)a4;
- (BOOL)isEphemeralSwitcher;
- (BOOL)isFloatingDockFullyPresented;
- (BOOL)isFloatingDockGesturePossible;
- (BOOL)isFloatingDockSupported;
- (BOOL)isIconForIconZoomingView:(id)a3 displayedInLocations:(id)a4;
- (BOOL)isInMedusaCapableSpace;
- (BOOL)isJindoEnabled;
- (BOOL)isLayoutRoleContentReady:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLocationInSafeArea:(CGPoint)a3;
- (BOOL)isMedusaCapable;
- (BOOL)isMedusaHostedKeyboardVisible;
- (BOOL)isPartiallyOffscreenWindowsEnabled;
- (BOOL)isRTLEnabled;
- (BOOL)isShieldingApplicationWithBundleIdentifier:(id)a3;
- (BOOL)isShowingModifierTimeline;
- (BOOL)isShowingSpotlightOrTodayView;
- (BOOL)isSoftwareKeyboardVisible;
- (BOOL)isSplitViewSupported;
- (BOOL)isStatusBarHiddenForAppLayout:(id)a3;
- (BOOL)isStudyLogEnabled;
- (BOOL)isSystemApertureTransitionTargetForSceneIdentifier:(id)a3 bundleIdentifier:(id)a4 isPortrait:(BOOL)a5;
- (BOOL)isSystemAssistantExperienceEnabled;
- (BOOL)isSystemAssistantExperiencePersistentSiriEnabled;
- (BOOL)isUserInteractionEnabled;
- (BOOL)isWindowVisible;
- (BOOL)itemContainerForAppLayoutOverlapsFloatingDock:(id)a3;
- (BOOL)prefersDockHidden;
- (BOOL)prefersStripHidden;
- (BOOL)prefersStripHiddenAndDisabled;
- (BOOL)requireStripContentsInViewHierarchy;
- (BOOL)shouldAcceleratedHomeButtonPressBegin;
- (BOOL)shouldAddAppLayoutToFront:(id)a3 forTransitionWithContext:(id)a4 transitionCompleted:(BOOL)a5;
- (BOOL)shouldAnimateInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldMatchMoveIconZoomingView:(id)a3;
- (BOOL)shouldMorphToPIPForTransitionContext:(id)a3;
- (BOOL)shouldRubberbandFullScreenHomeGrabberView;
- (BOOL)snapshotView:(id)a3 shouldShowAppClipOverlayForLayout:(id)a4;
- (BOOL)switcherShelfViewController:(id)a3 hitTestedToTopAffordance:(CGPoint)a4 window:(id)a5;
- (BOOL)underlayAccessoryViewShouldBeginPointerInteraction:(id)a3;
- (BSAnimationSettings)defaultTransitionAnimationSettings;
- (BSInvalidatable)wallpaperRequireAssertion;
- (CGAffineTransform)transformForCardUnderSheetForBoundsSize:(SEL)a3;
- (CGPoint)_scrollView:(id)a3 adjustedOffsetForOffset:(CGPoint)a4 translation:(CGPoint)a5 startPoint:(CGPoint)a6 locationInView:(CGPoint)a7 horizontalVelocity:(double *)a8 verticalVelocity:(double *)a9;
- (CGPoint)gestureHandlingModifier:(id)a3 averageVelocityOverDuration:(double)a4;
- (CGPoint)morphToPIPTargetCenter;
- (CGPoint)scrollViewContentOffset;
- (CGPoint)scrollableQueryModifier:(id)a3 contentOffsetVelocityConsideringNextContentOffset:(CGPoint)a4;
- (CGPoint)scrollableQueryModifier:(id)a3 convertScrollViewPointToContainerViewCoordinateSpace:(CGPoint)a4;
- (CGRect)_frameForCenterItemInInterfaceOrientation:(int64_t)a3 centerConfiguration:(int64_t)a4;
- (CGRect)_frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4;
- (CGRect)_frameForItemWithRole:(int64_t)a3 inMainAppLayout:(id)a4 interfaceOrientation:(int64_t)a5;
- (CGRect)_iconImageFrameForIconView:(id)a3;
- (CGRect)completedTransitionFrameForAppLayout:(id)a3;
- (CGRect)containerViewBounds;
- (CGRect)containerViewBoundsForHomeGrabberView:(id)a3;
- (CGRect)frameForPageViewOfContainer:(id)a3 fullyPresented:(BOOL)a4;
- (CGRect)homeScreenIconFrameForAppLayout:(id)a3;
- (CGRect)iconImageFrameForAppLayout:(id)a3;
- (CGRect)layoutFrameForItemWithRole:(int64_t)a3 inAppLayout:(id)a4 interfaceOrientation:(int64_t)a5 forSnapshotView:(id)a6;
- (CGRect)morphToPIPClippingFrame;
- (CGRect)overlayAccessoryViewFrameForIconOverlayView:(id)a3 fullPresented:(BOOL)a4;
- (CGRect)preferredFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 bounds:(CGRect)a5 interfaceOrientation:(int64_t)a6;
- (CGRect)scaledFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (CGRect)shelfItemFrameForAppLayout:(id)a3 inShelf:(id)a4;
- (CGRect)switcherShelfViewController:(id)a3 frameForCenterItemWithConfiguration:(int64_t)a4 interfaceOrientation:(int64_t)a5;
- (CGRect)switcherShelfViewController:(id)a3 frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a4 floatingConfiguration:(int64_t)a5;
- (CGRect)switcherShelfViewController:(id)a3 frameForItemWithRole:(int64_t)a4 inMainAppLayout:(id)a5 interfaceOrientation:(int64_t)a6;
- (CGRect)systemApertureDefaultFrame;
- (CGSize)sizeForAppLayout:(id)a3 fromProvider:(id)a4;
- (CGSize)snapshotSizeForItemWithRole:(int64_t)a3 inAppLayout:(id)a4 interfaceOrientation:(int64_t)a5 inImageCache:(id)a6;
- (NSArray)appLayouts;
- (NSMutableArray)hiddenRecycledItemContainers;
- (NSMutableDictionary)animatableProperties;
- (NSMutableDictionary)externalDropletZoomUpTokens;
- (NSMutableDictionary)hiddenAppLayoutAssertionsForShelves;
- (NSMutableDictionary)hiddenIconViewContainers;
- (NSMutableDictionary)hiddenIconViews;
- (NSMutableDictionary)liveContentOverlays;
- (NSMutableDictionary)visibleItemContainerBackdropViews;
- (NSMutableDictionary)visibleItemContainers;
- (NSMutableDictionary)visibleOverlayAccessoryViews;
- (NSMutableDictionary)visibleShelves;
- (NSMutableDictionary)visibleUnderlayAccessoryViews;
- (NSMutableSet)focusedItemBackdropsBeingRemoved;
- (NSMutableSet)visibleShelvesHostedInContentView;
- (NSString)description;
- (SBAppSwitcherScrollView)scrollView;
- (SBBestAppSuggestion)bestAppSuggestion;
- (SBFHomeGrabberSettings)homeGrabberSettings;
- (SBFloatingDockBehaviorAssertion)inAppFloatingDockBehaviorAssertion;
- (SBFloatingDockBehaviorAssertion)switcherFloatingDockBehaviorAssertion;
- (SBFloatingDockBehaviorAssertion)transientOverlayFloatingDockBehaviorAssertion;
- (SBFloatingDockWindowLevelAssertion)switcherFloatingDockWindowLevelAssertion;
- (SBFloatingDockWindowLevelAssertion)transientOverlayFloatingDockWindowLevelAssertion;
- (SBFluidSwitcherButton)plusButton;
- (SBFluidSwitcherContentView)contentView;
- (SBFluidSwitcherLayoutContext)layoutContext;
- (SBFluidSwitcherTitledButton)reopenClosedWindowsButton;
- (SBFluidSwitcherViewController)init;
- (SBFluidSwitcherViewController)initWithCoder:(id)a3;
- (SBFluidSwitcherViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBFluidSwitcherViewController)initWithRootModifier:(id)a3 liveContentOverlayCoordinator:(id)a4 dataSource:(id)a5 delegate:(id)a6 debugName:(id)a7;
- (SBIconView)bounceIconView;
- (SBScrollSwitcherModifierEvent)currentScrollEvent;
- (SBSwitcherContentViewControllerDataSource)dataSource;
- (SBSwitcherContentViewControllerDelegate)delegate;
- (SBSwitcherModifier)reduceMotionModifier;
- (SBSwitcherModifier)rootModifier;
- (SBViewMorphAnimator)pipViewMorphAnimator;
- (UILabel)modifierStackDebugLabel;
- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (UIScrollView)switcherScrollView;
- (char)activityModeForAppLayout:(id)a3;
- (char)jetsamModeForAppLayout:(id)a3;
- (double)_delayForTransitionWithContext:(id)a3 animated:(BOOL)a4;
- (double)contentAspectRatio;
- (double)contentPageViewScaleForAppLayout:(id)a3;
- (double)continuousExposeStripProgress;
- (double)cornerRadiusForAppLayout:(id)a3;
- (double)currentStatusBarHeightOfContainer:(id)a3;
- (double)displayCornerRadius;
- (double)floatingDockHeight;
- (double)floatingDockPresentedHeight;
- (double)floatingDockViewTopMargin;
- (double)floatingDockWindowLevel;
- (double)homeScreenIconCornerRadiusForAppLayout:(id)a3;
- (double)homeScreenIconScaleForAppLayout:(id)a3;
- (double)homeScreenWindowLevel;
- (double)iconCornerRadiusForAppLayout:(id)a3;
- (double)iconScaleForAppLayout:(id)a3;
- (double)keyboardHeight;
- (double)minimumHomeScreenScale;
- (double)morphToPIPClippingCornerRadius;
- (double)morphToPIPSourceAlpha;
- (double)morphToPIPTargetScale;
- (double)presentationValueForAnimatableProperty:(id)a3;
- (double)scaleForAppLayout:(id)a3;
- (double)scaleForDownscaledSnapshotsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 inImageCache:(id)a5;
- (double)screenScale;
- (double)separatorViewWidth;
- (double)shelfItemCornerRadiusForAppLayout:(id)a3 inShelf:(id)a4;
- (double)shelfItemScaleForAppLayout:(id)a3 inShelf:(id)a4;
- (double)shelfPresentedHeight;
- (double)snapshotScaleForSceneHandle:(id)a3;
- (double)splitViewInnerCornerRadius;
- (double)statusBarHeight;
- (double)switcherWindowLevel;
- (double)windowLevelForModifierTimelineController:(id)a3;
- (id)_activeTransientOverlayPresentedAppLayout;
- (id)_adjustedAppLayoutForItemContainerAtLocation:(CGPoint)a3 environment:(int64_t)a4;
- (id)_adjustedGestureEventForGestureEvent:(id)a3 fromGestureManager:(id)a4;
- (id)_animatablePropertyWithNotifications:(id)a3 progressEventType:(Class)a4;
- (id)_appLayoutForWorkspaceTransientOverlay:(id)a3;
- (id)_appLayoutFromLayoutElement:(id)a3;
- (id)_applicationForDisplayItem:(id)a3;
- (id)_centerWindowActivationAnimationContextForKey:(id)a3;
- (id)_convertWindowDragEvent:(id)a3 fromSwitcherContentViewController:(id)a4;
- (id)_createWorkspaceTransientOverlayForAppLayout:(id)a3;
- (id)_dequeueOverlayAccessoryViewFromReusePool;
- (id)_dequeueUnderlayAccessoryViewFromReusePool;
- (id)_firstZOrderedSubviewViewAtLocation:(CGPoint)a3;
- (id)_floatingDockController;
- (id)_floatingDockIconLocationForTransitionSource:(int64_t)a3;
- (id)_gestureManager;
- (id)_homeScreenAppearanceController;
- (id)_iconForWorkspaceEntity:(id)a3;
- (id)_iconLocationsForActivationSource:(int64_t)a3;
- (id)_iconManager;
- (id)_iconViewForDisplayItem:(id)a3 isVisible:(BOOL *)a4;
- (id)_iconZoomContextProvider;
- (id)_itemContainerAtLocation:(CGPoint)a3 environment:(int64_t)a4;
- (id)_itemContainerAtLocation:(CGPoint)a3 ignoringDraggedItem:(id)a4 environment:(int64_t)a5;
- (id)_itemContainerForAppLayoutIfExists:(id)a3;
- (id)_itemContainerNearestLocation:(CGPoint)a3 environment:(int64_t)a4 prioritizeForegroundedItemContainers:(BOOL)a5;
- (id)_keyboardFocusableLiveAppLayoutsMatchingFocusedApp:(BOOL)a3 foundAtIndex:(int64_t *)a4;
- (id)_leafAppLayoutForItemContainerAtLocation:(CGPoint)a3 environment:(int64_t)a4;
- (id)_leafAppLayoutInLiveContentOverlaysWithLayoutRole:(int64_t)a3;
- (id)_leafAppLayoutsInAppLayout:(id)a3 intersectingHomeGrabber:(id)a4;
- (id)_liveContentOverlayForHandlingHardwareButtonEvents;
- (id)_orderedViewsForLayoutElement:(id)a3 excludeSwitcherHostedShelves:(BOOL)a4;
- (id)_proposedAppLayoutForWindowDrag;
- (id)_sbWindowScene;
- (id)_sceneDeactivationPredicateMatchingAppLayouts:(id)a3;
- (id)_searchPresenter;
- (id)_spaceContainingAppLayout:(id)a3;
- (id)_spacesWithVisibleHomeAffordances;
- (id)_switcherDropRegionContextForDraggingLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atLocation:(CGPoint)a5;
- (id)_transitionEventForTransitionWithContext:(id)a3 identifier:(id)a4 phase:(unint64_t)a5 animated:(BOOL)a6;
- (id)_unadjustedAppLayouts;
- (id)_unadjustedLeafAppLayouts;
- (id)_webClipIdentifierForAppClipBundleIdentifier:(id)a3 sceneIdentifier:(id)a4;
- (id)_workspaceEntityForBundleIdentifier:(id)a3 inTransitionContext:(id)a4;
- (id)activatingDisplayItemForAppLayout:(id)a3;
- (id)adjustedAppLayoutForLeafAppLayout:(id)a3;
- (id)animationControllerForTransitionRequest:(id)a3;
- (id)appLayoutAtLocation:(CGPoint)a3 withDraggedItem:(id)a4 environment:(int64_t)a5;
- (id)appLayoutByBringingItemToFront:(id)a3 inAppLayout:(id)a4;
- (id)appLayoutContainingAppLayout:(id)a3;
- (id)appLayoutForLeafAppLayout:(id)a3;
- (id)appLayoutOnStage;
- (id)appLayoutsContainedWithinAppLayout:(id)a3;
- (id)appLayoutsForContinuousExposeIdentifier:(id)a3;
- (id)appLayoutsForSwitcherShelfViewController:(id)a3;
- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3;
- (id)beginHidingAppLayout:(id)a3 forReason:(id)a4;
- (id)bezelEffectsLayoutElement;
- (id)chamoisLayoutAttributes;
- (id)continuousExposeIdentifiersInStrip;
- (id)continuousExposeIdentifiersInSwitcher;
- (id)continuousExposeStripTongueBackdropCaptureLayoutElement;
- (id)currentVelocityValueForVisibleAppLayout:(id)a3 key:(id)a4;
- (id)defaultFocusItem;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)displayIdentityForImageCache:(id)a3;
- (id)displayIdentityForSnapshotView:(id)a3;
- (id)displayItemLayoutAttributesCalculator;
- (id)draggingAppLayoutsForWindowDrag;
- (id)entityRemovalSettings;
- (id)foregroundAppLayouts;
- (id)genericSwitcherAccessoryLayoutElement;
- (id)homeGestureSettings;
- (id)homeGrabberViewForAppLayout:(id)a3;
- (id)homeScreenIconGridSizeClassForAppLayout:(id)a3;
- (id)homeScreenIconLocationForAppLayout:(id)a3;
- (id)iconForAppLayout:(id)a3;
- (id)iconForDisplayItem:(id)a3;
- (id)iconGridSizeClassForAppLayout:(id)a3;
- (id)iconLocationForAppLayout:(id)a3;
- (id)iconViewForAppLayout:(id)a3;
- (id)iconZoomingViewContainerForIconZoomingView:(id)a3;
- (id)itemContainerToResizeUsingPointer;
- (id)keyboardFocusedAppLayout;
- (id)layoutRestrictionInfoForItem:(id)a3;
- (id)leadingStatusBarStyleRequest;
- (id)leafAppLayoutForKeyboardFocusedScene;
- (id)liveContentOverlayForAppLayout:(id)a3;
- (id)liveOverlayForSceneHandle:(id)a3;
- (id)liveOverlayForSceneIdentifier:(id)a3;
- (id)liveOverlayForSceneIdentityToken:(id)a3;
- (id)liveScenesIdentityTokens;
- (id)matchingIconZoomingViewForIconZoomingView:(id)a3;
- (id)medusaSettings;
- (id)proposedAppLayoutsForWindowDrag;
- (id)sceneHandleProviderForImageCache:(id)a3;
- (id)sceneHandleProviderForSnapshotView:(id)a3;
- (id)shelfFocusedDisplayItems;
- (id)siriSettings;
- (id)slideOverTongueLayoutElement;
- (id)snapshotCache;
- (id)sourceLeafAppLayoutForCenterItem:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)switcherBackdropLayoutElement;
- (id)switcherDimmingViewLayoutElement;
- (id)switcherSettings;
- (id)switcherShelfViewController:(id)a3 liveViewForAppLayout:(id)a4;
- (id)switcherShelfViewController:(id)a3 transitionEventForContext:(id)a4 identifier:(id)a5 phase:(unint64_t)a6 animated:(BOOL)a7;
- (id)trailingStatusBarStyleRequest;
- (id)viewControllerForTransientOverlayAppLayout:(id)a3 fromProvider:(id)a4;
- (int64_t)_bestSupportedHomeAffordanceOrientationForOrientation:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)contentOrientation;
- (int64_t)displayOrdinal;
- (int64_t)homeAffordanceOrientationIfMismatchedFromCurrentLayoutState;
- (int64_t)homeScreenInterfaceOrientation;
- (int64_t)nextDisplayItemInteractionTimeForSwitcherShelfViewController:(id)a3;
- (int64_t)numberOfHiddenAppLayoutsForBundleIdentifier:(id)a3;
- (int64_t)numberOfVisibleAppLayoutsForBundleIdentifier:(id)a3;
- (int64_t)numberOfVisibleCards;
- (int64_t)orientationForSnapshotOfAppLayout:(id)a3 inImageCache:(id)a4;
- (int64_t)userInterfaceStyle;
- (unint64_t)_itemContainerFooterStyle;
- (unint64_t)_windowManagementStyle;
- (unint64_t)appLayoutsGenerationCount;
- (unint64_t)assistantModality;
- (unint64_t)assistantPresentationState;
- (unint64_t)bounceIconGenerationCount;
- (unint64_t)continuousExposeIdentifiersGenerationCount;
- (unint64_t)newAppLayoutsGenCount;
- (unint64_t)newContinuousExposeIdentifiersGenerationCount;
- (unint64_t)numberOfRowsInGridSwitcher;
- (unint64_t)supportedContentInterfaceOrientationsForItem:(id)a3;
- (unint64_t)supportedSizingPoliciesForItem:(id)a3 inAppLayout:(id)a4;
- (void)SBC2GroupCompletionAnimationDidBegin:(id)a3;
- (void)SBC2GroupCompletionAnimationDidComplete:(id)a3 finished:(BOOL)a4 retargeted:(BOOL)a5;
- (void)_acquireKeyboardSuppressionAssertionForMode:(id)a3;
- (void)_addVisibleItemContainerForAppLayout:(id)a3 reusingItemContainerIfExists:(id)a4;
- (void)_applyOcclusionStateToLiveContentOverlay:(id)a3 forLayoutRole:(int64_t)a4 inAppLayout:(id)a5;
- (void)_applyRootContentViewBlurRadiusWithCompletion:(id)a3;
- (void)_applyRootContentViewClippingAndBlurWithCompletion:(id)a3;
- (void)_applyRootContentViewClippingWithCompletion:(id)a3;
- (void)_applyStyleToAppLayout:(id)a3 roleMask:(unint64_t)a4 completion:(id)a5;
- (void)_applyStyleToLiveContentOverlay:(id)a3 forItemContainer:(id)a4 atIndex:(unint64_t)a5;
- (void)_applyStyleToVisibleItemContainersWithCompletion:(id)a3;
- (void)_applyTouchBehaviorToLiveContentOverlay:(id)a3 forAppLayout:(id)a4;
- (void)_beginRequiringItemContainerShadowPathDisplayLinkForLeafAppLayout:(id)a3 killing:(BOOL)a4;
- (void)_blurItemContainer:(id)a3 blurParameters:(id)a4 withAnimationUpdateMode:(int64_t)a5;
- (void)_cancelInProcessAnimationsWithOptions:(unint64_t)a3;
- (void)_cancelWindowMorphingAnimation;
- (void)_configureApplicationAndTransientOverlayDockBehaviorAssertionsForContext:(id)a3;
- (void)_configureTransitionRequestForGestureBegin:(id)a3;
- (void)_containerScrolledEnoughToClipSwitcherIconView:(id)a3;
- (void)_dispatchEventAndHandleAction:(id)a3;
- (void)_enqueueOverlayAccessoryViewInReusePool:(id)a3;
- (void)_enqueueUnderlayAccessoryViewInReusePool:(id)a3;
- (void)_ensureSubviewOrdering;
- (void)_ensureSubviewOrderingInsideSpace:(id)a3;
- (void)_folderExpansionAnimationWillBegin:(id)a3;
- (void)_handleDismissTapGesture:(id)a3;
- (void)_handleEventResponse:(id)a3;
- (void)_handleKeyboardFrameWillChange:(id)a3;
- (void)_handlePlusButtonTapped:(id)a3;
- (void)_iconControllerOverlayVisibilityDidChange:(id)a3;
- (void)_keyboardDidUIPosition:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_layoutAppLayout:(id)a3 roleMask:(unint64_t)a4 completion:(id)a5;
- (void)_layoutContinuousExposeStripTongueAnimated:(BOOL)a3 completion:(id)a4;
- (void)_layoutSlideoverTonguesWithCompletion:(id)a3;
- (void)_layoutVisibleItemsWithCompletion:(id)a3;
- (void)_layoutVisibleShelvesWithCompletion:(id)a3;
- (void)_makeAppLayoutVisibleForTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_medusaHostedKeyboardWillHideNotification:(id)a3;
- (void)_medusaHostedKeyboardWillShowNotification:(id)a3;
- (void)_navigateFromFocusedAppWindowSceneToNextSceneFromStripInForwardDirection:(BOOL)a3 withReachableAppLayouts:(id)a4;
- (void)_navigateFromFocusedAppWindowSceneToNextSceneInForwardDirection:(BOOL)a3 matchFocusedApp:(BOOL)a4;
- (void)_noteItemContainerDidUpdateContentClippingWithMode:(int64_t)a3;
- (void)_noteSwitcherDropAnimationCompletedWithContext:(id)a3;
- (void)_performActionForPreludeAnimationTokenActionResponse:(id)a3;
- (void)_performBlurItemContainerResponse:(id)a3;
- (void)_performCancelSystemGesturesResponse:(id)a3;
- (void)_performContentViewScaleAnimationForDosido;
- (void)_performCrossfadeIfNeededWithCompletion:(id)a3;
- (void)_performDeferredInitialization;
- (void)_performEventResponse:(id)a3;
- (void)_performInvalidateContinuousExposeIdentifiersResponse:(id)a3;
- (void)_performInvalidateItemContainerBackdropResponse:(id)a3;
- (void)_performInvalidateRootContentViewClippingAndBlurResponse:(id)a3;
- (void)_performInvalidateSnapshotCacheResponse:(id)a3;
- (void)_performModifierCompletionResponse:(id)a3;
- (void)_performModifierDismissSiriResponse:(id)a3;
- (void)_performModifierEmitSBEventResponse:(id)a3;
- (void)_performModifierEmitStudyLogResponse:(id)a3;
- (void)_performModifierHapticResponse:(id)a3;
- (void)_performModifierIconOverlayVisibilityUpdateResponse:(id)a3;
- (void)_performModifierIconViewVisibilityUpdateResponse:(id)a3;
- (void)_performModifierInjectVelocityResponse:(id)a3;
- (void)_performModifierMatchMoveToDropletResponse:(id)a3;
- (void)_performModifierMatchMoveToIconViewResponse:(id)a3;
- (void)_performModifierNotifyIconWillZoomDownResponse:(id)a3;
- (void)_performModifierPerformTransitionResponse:(id)a3;
- (void)_performModifierReachabilityResponse:(id)a3;
- (void)_performModifierScrollToAppLayoutResponse:(id)a3;
- (void)_performModifierTimerEventResponse:(id)a3;
- (void)_performModifierUpdateLayoutResponse:(id)a3;
- (void)_performNewWindowSwitcherResponse:(id)a3;
- (void)_performPresentContinuousExposeStripEdgeProtectGrabberResponse:(id)a3;
- (void)_performRelinquishSystemApertureElementSuppressionResponse:(id)a3;
- (void)_performRequestSystemApertureElementSuppressionResponse:(id)a3;
- (void)_performSetInterfaceOrientationFromUserResizingResponse:(id)a3;
- (void)_performSwitcherDropWithContext:(id)a3 mutationBlock:(id)a4;
- (void)_performSystemApertureBounceResponse:(id)a3;
- (void)_performSystemApertureStretchResponse:(id)a3;
- (void)_performUpdateContinuousExposeStripsPresentationResponse:(id)a3;
- (void)_performUpdateDragPlatterBlurResponse:(id)a3;
- (void)_performWithFixedUpdateMode:(int64_t)a3 usingBlock:(id)a4;
- (void)_prepareForCrossfadeIfNeeded;
- (void)_rebuildCachedAdjustedAppLayouts;
- (void)_reduceMotionStatusDidChange:(id)a3;
- (void)_removeCenterWindowAnimationContextWithKey:(id)a3;
- (void)_removeSearchPresenterObservation;
- (void)_resetItemContainerShadowPathDisplayLink;
- (void)_rotateHomeAffordancesFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4;
- (void)_sceneUpdateDidChange:(id)a3;
- (void)_scrollToAppLayout:(id)a3 animated:(BOOL)a4 alignment:(int64_t)a5 completion:(id)a6;
- (void)_setCenterWindowActivationContext:(id)a3 forKey:(id)a4;
- (void)_setUpSearchPresenterObservation;
- (void)_setupContentAndTransientViews;
- (void)_setupLiveContentOverlayForAppLayout:(id)a3 itemContainer:(id)a4 overlay:(id)a5;
- (void)_setupMorphAnimatorIfNeededForEntity:(id)a3 pipCoordinator:(id)a4 appLayout:(id)a5 appLayoutBoundingBox:(CGRect)a6 uniqueID:(id)a7 direction:(int64_t)a8 gestureInitiated:(BOOL)a9;
- (void)_setupPIPMorphingIfNeededForTransitionContext:(id)a3 response:(id)a4;
- (void)_shadowPathDisplayLinkDidUpdate:(id)a3;
- (void)_stopRequiringItemContainerShadowPathDisplayLinkForLeafAppLayout:(id)a3 killing:(BOOL)a4;
- (void)_temporarilyHideMatchMovedZoomDownAnimationViewAnimated:(BOOL)a3;
- (void)_toggleFloatingAppVisibility;
- (void)_unblurItemContainer:(id)a3 blurParameters:(id)a4 withAnimationUpdateMode:(int64_t)a5;
- (void)_updateAnimatableProperties;
- (void)_updateAppExposeAccessoryButtonsExtendedTouchRegions;
- (void)_updateAppStatusBarAndHomeGrabberVisibilityAnimated:(BOOL)a3;
- (void)_updateAsyncRenderingAndResizesHostedContext;
- (void)_updateAsynchronousSurfaceRetentionAssertion;
- (void)_updateAutoHideForGrabberAffordancesInAppLayout:(id)a3 withResetDelay:(double)a4 unhideDelay:(double)a5;
- (void)_updateAutoHideForItemContainer:(id)a3 appLayout:(id)a4;
- (void)_updateBezelEffectsPortal;
- (void)_updateBounceIcon;
- (void)_updateChamoisDefaultsObserverIfNeeded;
- (void)_updateContentViewPassesTouchesThrough;
- (void)_updateContentViewSublayerTransform;
- (void)_updateContinuousExposeIdentifiersTransitioningFromAppLayout:(id)a3 toAppLayout:(id)a4 animated:(BOOL)a5;
- (void)_updateContinuousExposeStripTonguePresence;
- (void)_updateContinuousExposeStripsCaptureOnlyBackdropLayer;
- (void)_updateCornerRadiiiAndMaximizedState;
- (void)_updateEdgeProtectAndAutoHideForHomeAffordancesInAppLayout:(id)a3 withResetDelay:(double)a4 unhideDelay:(double)a5;
- (void)_updateFloatingDockBehaviorAssertion;
- (void)_updateFloatingDockWindowLevelAssertion;
- (void)_updateForegroundAppLayoutsList;
- (void)_updateForegroundAppLayoutsWithNewLayoutState:(id)a3;
- (void)_updateHiddenAppLayoutsInShelves;
- (void)_updateHitTestBlockingView;
- (void)_updateHomeScreenBackdropType;
- (void)_updateHomeScreenContentRequirement;
- (void)_updateHomeScreenPointerInteractions;
- (void)_updateImplicitModifierStackInvalidatables;
- (void)_updateItemContainerBackdropPresenceForIndex:(unint64_t)a3 scale:(double)a4 rotation:(double)a5 cornerRadius:(double)a6 animationAttributes:(id)a7 completion:(id)a8;
- (void)_updateKeyboardSuppressionAssertion;
- (void)_updateLayoutFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4;
- (void)_updateLayoutWithCompletion:(id)a3;
- (void)_updateModifierStackDebugLabel;
- (void)_updateModifierStackDebugLabelPresence;
- (void)_updateModifierTimelinePresence;
- (void)_updateOverlaysTopAffordanceContextMenu;
- (void)_updatePlusButtonPresence;
- (void)_updatePlusButtonStyleWithMode:(int64_t)a3 completion:(id)a4;
- (void)_updateReopenClosedWindowsButtonPresence;
- (void)_updateReopenClosedWindowsButtonText;
- (void)_updateReopenClosedWindowsButtonWithMode:(int64_t)a3 completion:(id)a4;
- (void)_updateResignActiveAssertions;
- (void)_updateScrollViewScrollEnabled;
- (void)_updateScrollViewSizeAndSpacing;
- (void)_updateShadowPathDisplayLink;
- (void)_updateShadowPathForIndex:(unint64_t)a3;
- (void)_updateSlideOverTonguePresence;
- (void)_updateSnapshotCache;
- (void)_updateSnapshotCacheReloadingForActiveInterfaceOrientationChange;
- (void)_updateSoftwareKeyboardVisibleWithKeyboardShowing:(BOOL)a3;
- (void)_updateSpringBoardStatusBarVisibility;
- (void)_updateStatusBarAndHomeGrabberVisibilityForAppLayout:(id)a3 animated:(BOOL)a4;
- (void)_updateStyleWithCompletion:(id)a3;
- (void)_updateSuppressingHomeAffordanceBounce;
- (void)_updateSwitcherBackdropType;
- (void)_updateSwitcherBackdropViewPresence;
- (void)_updateSwitcherDimmingViewPresence;
- (void)_updateSystemApertureShadowAssertion;
- (void)_updateTitleItemsLabelColor;
- (void)_updateTitleItemsUserInterfaceStyle;
- (void)_updateTitlePresenceForAdjustedAppLayout:(id)a3;
- (void)_updateVisibleAccessoryViews;
- (void)_updateVisibleAdjustedAppLayouts;
- (void)_updateVisibleHomeAffordanceViews;
- (void)_updateVisibleItems;
- (void)_updateVisibleItemsAccessoryViewsLayoutAndStyleWithCompletion:(id)a3;
- (void)_updateVisibleOverlayAndUnderlayViews;
- (void)_updateVisibleShelves;
- (void)_updateWallpaperStyle;
- (void)_updateWantsEnhancedWindowingEnabledState;
- (void)acquiredViewController:(id)a3 forTransientOverlayAppLayout:(id)a4;
- (void)addLiveContentOverlay:(id)a3 forAppLayout:(id)a4 animated:(BOOL)a5;
- (void)animatorWasCanceled:(id)a3;
- (void)assistantDidAppear:(id)a3;
- (void)assistantDidChangePresentation:(id)a3;
- (void)assistantDidDisappear:(id)a3;
- (void)assistantWillAppear:(id)a3;
- (void)assistantWillDisappear:(id)a3;
- (void)associateCenterWindowInteractionIdentifier:(id)a3 withSceneIdentifier:(id)a4;
- (void)cleanUpAfterCompletingCenterWindowAnimationWithAction:(id)a3;
- (void)cleanUpAfterCoordinatedLayoutStateTransitionWithContext:(id)a3;
- (void)clickReceivedForHomeGrabberView:(id)a3;
- (void)clientWithSceneIdentifier:(id)a3 suppressPreferredPointerLockStatusUpdated:(BOOL)a4;
- (void)container:(id)a3 didBecomeFocused:(BOOL)a4;
- (void)containerDidEndAnimatingHighlight:(id)a3 scale:(double)a4;
- (void)containerDidEndSwipingToKill:(id)a3;
- (void)containerSelectionStateChanged:(id)a3 toState:(int64_t)a4 hover:(BOOL)a5 pencilHover:(BOOL)a6;
- (void)containerWillBeginAnimatingHighlight:(id)a3 scale:(double)a4 isTracking:(BOOL)a5;
- (void)containerWillBeginSwipingToKill:(id)a3;
- (void)continuousExposeStripTongueViewTapped:(id)a3;
- (void)dealloc;
- (void)didSelectContainer:(id)a3 modifierFlags:(int64_t)a4;
- (void)dismissContinuousExposeStripEdgeProtectTongue;
- (void)dismissSlideOverEdgeProtectTongueOnEdge:(unint64_t)a3;
- (void)eventSource:(id)a3 userTouchedApplication:(id)a4;
- (void)gestureHandlingModifierRequestsUpdate:(id)a3;
- (void)handleClickDownToBringItemContainerForward:(id)a3;
- (void)handleContinuousExposeHoverGesture:(id)a3;
- (void)handleEventResponse:(id)a3;
- (void)handleFluidSwitcherGestureManager:(id)a3 didBeginGesture:(id)a4;
- (void)handleFluidSwitcherGestureManager:(id)a3 didEndGesture:(id)a4;
- (void)handleFluidSwitcherGestureManager:(id)a3 didUpdateGesture:(id)a4;
- (void)handleReopenClosedWindowsButtonTapped:(id)a3;
- (void)handleTapToBringItemContainerForward:(id)a3;
- (void)hideSourceViewForAnimator:(id)a3;
- (void)historianModifier:(id)a3 didRecordEntry:(id)a4;
- (void)invalidate;
- (void)killContainer:(id)a3 forReason:(int64_t)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4;
- (void)liveContentOverlayDidUpdateHomeAffordanceEdgeProtectOrAutoHide:(id)a3;
- (void)liveContentOverlayDidUpdateHomeAffordanceSupportedOrientations:(id)a3;
- (void)loadView;
- (void)moveExistingLiveContentOverlay:(id)a3 forAppLayout:(id)a4 toAppLayout:(id)a5;
- (void)noteAppLayoutsDidChange;
- (void)noteIconZoomingViewWillZoomDown:(id)a3;
- (void)noteKeyboardFocusDidChangeToSceneID:(id)a3;
- (void)noteModelDidMutateForInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4 willAnimate:(BOOL)a5;
- (void)noteWindowManagementStyleDidChange;
- (void)overlayAccessoryView:(id)a3 didSelectHeaderForRole:(int64_t)a4;
- (void)overlayAccessoryView:(id)a3 didUpdateShowingIconOverlay:(BOOL)a4;
- (void)performAnimatedInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4 completion:(id)a5;
- (void)performKeyboardShortcutAction:(int64_t)a3;
- (void)performTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)pointerBeganResizingItemContainer:(id)a3;
- (void)pointerDidMoveToFromWindowScene:(id)a3 toWindowScene:(id)a4;
- (void)pointerEndedResizingItemContainer:(id)a3;
- (void)prepareAnimatedInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4;
- (void)prepareForCoordinatedLayoutStateTransitionWithContext:(id)a3;
- (void)prepareForIncomingCenterWindowAnimationWithAction:(id)a3;
- (void)presentContinuousExposeStripEdgeProtectTongue;
- (void)presentSlideOverEdgeProtectTongueOnEdge:(unint64_t)a3;
- (void)relinquishTransientOverlayViewController:(id)a3;
- (void)removeLayoutRole:(int64_t)a3 inSpace:(id)a4 mutationBlock:(id)a5 reason:(int64_t)a6;
- (void)removeLiveContentOverlayForAppLayout:(id)a3 animated:(BOOL)a4;
- (void)sceneLayoutTransitionWillStartWithTransitionContext:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrolling:(id)a3;
- (void)scrollViewDidScroll:(id)a3 withContext:(id *)a4;
- (void)scrollViewKillingProgressUpdated:(double)a3 translation:(CGPoint)a4 isDragging:(BOOL)a5 decelerationTargetProgress:(double)a6 forContainer:(id)a7;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)searchGesture:(id)a3 startedShowing:(BOOL)a4;
- (void)searchPresenterWillPresentSearch:(id)a3 animated:(BOOL)a4;
- (void)setAnimatableProperties:(id)a3;
- (void)setAsyncRenderingDisabled:(BOOL)a3;
- (void)setBestAppSuggestion:(id)a3;
- (void)setBounceIconGenerationCount:(unint64_t)a3;
- (void)setBounceIconView:(id)a3;
- (void)setContentOrientation:(int64_t)a3;
- (void)setContentView:(id)a3;
- (void)setCurrentScrollEvent:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExternalDropletZoomUpTokens:(id)a3;
- (void)setFocusedItemBackdropsBeingRemoved:(id)a3;
- (void)setHiddenAppLayoutAssertionsForShelves:(id)a3;
- (void)setHiddenIconViewContainers:(id)a3;
- (void)setHiddenIconViews:(id)a3;
- (void)setHiddenRecycledItemContainers:(id)a3;
- (void)setHomeGrabberSettings:(id)a3;
- (void)setInAppFloatingDockBehaviorAssertion:(id)a3;
- (void)setLayoutContext:(id)a3;
- (void)setLiveContentOverlayUpdatesSuspended:(BOOL)a3;
- (void)setModifierStackDebugLabel:(id)a3;
- (void)setPipViewMorphAnimator:(id)a3;
- (void)setPlusButton:(id)a3;
- (void)setReduceMotionModifier:(id)a3;
- (void)setReopenClosedWindowsButton:(id)a3;
- (void)setRootModifier:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setShelfFocusedDisplayItems:(id)a3;
- (void)setShowModifierTimeline:(BOOL)a3;
- (void)setSwitcherFloatingDockBehaviorAssertion:(id)a3;
- (void)setSwitcherFloatingDockWindowLevelAssertion:(id)a3;
- (void)setTransientOverlayFloatingDockBehaviorAssertion:(id)a3;
- (void)setTransientOverlayFloatingDockWindowLevelAssertion:(id)a3;
- (void)setVisibleItemContainerBackdropViews:(id)a3;
- (void)setVisibleItemContainers:(id)a3;
- (void)setVisibleOverlayAccessoryViews:(id)a3;
- (void)setVisibleShelves:(id)a3;
- (void)setVisibleShelvesHostedInContentView:(id)a3;
- (void)setVisibleUnderlayAccessoryViews:(id)a3;
- (void)setWallpaperRequireAssertion:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
- (void)slideOverTongueViewTapped:(id)a3;
- (void)startTrackingHiddenIconZoomViewIfNeeded:(id)a3;
- (void)stopTrackingHiddenIconZoomViewIfNeeded:(id)a3;
- (void)tapReceivedForGrabberTongueAtEdge:(unint64_t)a3;
- (void)temporarilyHideMatchMovedZoomDownAnimationViewForIconView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)underlayAccessoryView:(id)a3 didSelectHeaderForRole:(int64_t)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)willBeginGestureWithType:(int64_t)a3 identifier:(id)a4;
- (void)zStackActivationStateUpdated;
@end

@implementation SBFluidSwitcherViewController

uint64_t __72__SBFluidSwitcherViewController__performWithFixedUpdateMode_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__SBFluidSwitcherViewController__updateVisibleOverlayAndUnderlayViews__block_invoke_7(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "_layoutAppLayout:roleMask:completion:", v7, 0, 0, (void)v10);
        [*(id *)(a1 + 40) _applyStyleToAppLayout:v7 roleMask:0 completion:0];
        v8 = [*(id *)(*(void *)(a1 + 40) + 1840) objectForKey:v7];
        v9 = [*(id *)(*(void *)(a1 + 40) + 1848) objectForKey:v7];
        [v8 layoutIfNeeded];
        [v9 layoutIfNeeded];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

uint64_t __70__SBFluidSwitcherViewController__performModifierUpdateLayoutResponse___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__SBFluidSwitcherViewController__performModifierUpdateLayoutResponse___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if ((v2 & 2) != 0)
  {
    [*(id *)(a1 + 32) _updateVisibleItems];
    uint64_t v2 = *(void *)(a1 + 48);
  }
  if ((v2 & 4) != 0)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      uint64_t v5 = (*(void (**)(uint64_t, __CFString *))(v3 + 16))(v3, @"update layout action");
      [v4 _updateLayoutWithCompletion:v5];
    }
    else
    {
      [*(id *)(a1 + 32) _updateLayoutWithCompletion:0];
    }
  }
  if ((*(unsigned char *)(a1 + 48) & 8) != 0)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      v8 = (*(void (**)(uint64_t, __CFString *))(v6 + 16))(v6, @"update style action");
      [v7 _updateStyleWithCompletion:v8];
    }
    else
    {
      [*(id *)(a1 + 32) _updateStyleWithCompletion:0];
    }
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if ((v9 & 0x10) != 0)
  {
    [*(id *)(a1 + 32) _updateVisibleAccessoryViews];
    if ((*(void *)(a1 + 48) & 0x20) == 0) {
      return;
    }
  }
  else if ((v9 & 0x20) == 0)
  {
    return;
  }
  id v10 = [*(id *)(a1 + 32) view];
  [v10 setNeedsLayout];
}

uint64_t __62__SBFluidSwitcherViewController_appLayoutContainingAppLayout___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isOrContainsAppLayout:*(void *)(a1 + 32)];
}

- (void)SBC2GroupCompletionAnimationDidBegin:(id)a3
{
  if (a3) {
    -[NSPointerArray addPointer:](self->_outstandingAnimations, "addPointer:");
  }
}

void __76__SBFluidSwitcherViewController__applyStyleToAppLayout_roleMask_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) itemForLayoutRole:a2];

  if (v4)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(unsigned char *)(v5 + 24))
    {
      BOOL v6 = SBLayoutRoleMaskContainsRole(*(void *)(a1 + 48), a2);
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    else
    {
      BOOL v6 = 0;
    }
    *(unsigned char *)(v5 + 24) = v6;
  }
}

void __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) itemForLayoutRole:a2];

  if (v4)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(unsigned char *)(v5 + 24))
    {
      BOOL v6 = SBLayoutRoleMaskContainsRole(*(void *)(a1 + 48), a2);
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    else
    {
      BOOL v6 = 0;
    }
    *(unsigned char *)(v5 + 24) = v6;
  }
}

- (id)chamoisLayoutAttributes
{
  uint64_t v3 = [(SBFluidSwitcherViewController *)self switcherSettings];
  uint64_t v4 = [v3 chamoisSettings];
  uint64_t v5 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  int64_t v6 = [(SBFluidSwitcherViewController *)self switcherInterfaceOrientation];
  [(SBFluidSwitcherViewController *)self floatingDockHeight];
  uint64_t v7 = objc_msgSend(v4, "layoutAttributesForWindowScene:interfaceOrientation:requiresFullScreen:floatingDockHeight:", v5, v6, 0);

  return v7;
}

- (double)floatingDockHeight
{
  uint64_t v2 = [(SBFluidSwitcherViewController *)self _floatingDockController];
  [v2 floatingDockHeight];
  double v4 = v3;

  return v4;
}

- (id)_floatingDockController
{
  uint64_t v2 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  double v3 = [v2 floatingDockController];

  return v3;
}

- (double)screenScale
{
  uint64_t v2 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  double v3 = [v2 screen];

  if (v3)
  {
    [v3 scale];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (NSArray)appLayouts
{
  return self->_cachedAdjustedAppLayouts;
}

- (BOOL)isChamoisWindowingUIEnabled
{
  return [(SBFluidSwitcherViewController *)self _windowManagementStyle] == 2;
}

- (unint64_t)_windowManagementStyle
{
  double v3 = [(SBFluidSwitcherViewController *)self dataSource];
  double v4 = v3;
  if ((*((unsigned char *)&self->_dataSourceRespondsTo + 3) & 2) != 0) {
    unint64_t v5 = [v3 windowManagementStyleForSwitcherContentController:self];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)_sbWindowScene
{
  double v3 = [(SBFluidSwitcherViewController *)self dataSource];
  double v4 = [v3 windowSceneForSwitcherContentController:self];

  return v4;
}

- (SBSwitcherContentViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SBSwitcherContentViewControllerDataSource *)WeakRetained;
}

- (void)SBC2GroupCompletionAnimationDidComplete:(id)a3 finished:(BOOL)a4 retargeted:(BOOL)a5
{
  id v7 = a3;
  if (v7 && [(NSPointerArray *)self->_outstandingAnimations count])
  {
    uint64_t v6 = 0;
    while ([(NSPointerArray *)self->_outstandingAnimations pointerAtIndex:v6] != v7)
    {
      if (++v6 >= [(NSPointerArray *)self->_outstandingAnimations count]) {
        goto LABEL_9;
      }
    }
    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSPointerArray *)self->_outstandingAnimations removePointerAtIndex:v6];
    }
  }
LABEL_9:
}

- (CGRect)containerViewBounds
{
  uint64_t v2 = [(SBFluidSwitcherViewController *)self view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)appLayoutsContainedWithinAppLayout:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(SBFluidSwitcherViewController *)self appLayouts];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v12[0] = v4;
    double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    double v8 = [(SBFluidSwitcherViewController *)self appLayouts];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__SBFluidSwitcherViewController_appLayoutsContainedWithinAppLayout___block_invoke;
    v10[3] = &unk_1E6AF4B60;
    id v11 = v4;
    double v7 = objc_msgSend(v8, "bs_filter:", v10);
  }
  return v7;
}

void __76__SBFluidSwitcherViewController__applyStyleToAppLayout_roleMask_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  v88 = a2;
  uint64_t v97 = a1;
  double v3 = [*(id *)(a1 + 32) appLayouts];
  uint64_t v4 = [v3 indexOfObject:*(void *)(v97 + 40)];

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(*(void *)(v97 + 32) + 1944) shadowOffsetForIndex:v4];
    uint64_t v84 = v5;
    [*(id *)(*(void *)(v97 + 32) + 1944) wallpaperOverlayAlphaForIndex:v4];
    uint64_t v7 = v6;
    [*(id *)(*(void *)(v97 + 32) + 1944) lighteningAlphaForIndex:v4];
    uint64_t v9 = v8;
    char v83 = [*(id *)(*(void *)(v97 + 32) + 1944) shouldUseBrightMaterialForIndex:v4];
    uint64_t v96 = v4;
    char v82 = [*(id *)(*(void *)(v97 + 32) + 1944) shouldUseBackgroundWallpaperTreatmentForIndex:v4];
    char v81 = [*(id *)(*(void *)(v97 + 32) + 1944) isItemContainerPointerInteractionEnabled];
    double v10 = [*(id *)(v97 + 32) chamoisLayoutAttributes];
    [v10 stageInterItemSpacing];
    uint64_t v12 = v11;

    if ([MEMORY[0x1E4F42B08] isInHardwareKeyboardMode])
    {
      uint64_t v13 = v97;
      unsigned int v77 = [*(id *)(*(void *)(v97 + 32) + 1944) isFocusEnabledForAppLayout:*(void *)(v97 + 40)];
      uint64_t v14 = v4;
    }
    else
    {
      unsigned int v77 = 0;
      uint64_t v14 = v4;
      uint64_t v13 = v97;
    }
    unsigned int v79 = [*(id *)(*(void *)(v13 + 32) + 1944) clipsToUnobscuredMarginAtIndex:v14];
    [*(id *)(*(void *)(v13 + 32) + 1944) visibleMarginForItemContainerAtIndex:v14];
    double v16 = v15;
    unsigned int v78 = [*(id *)(*(void *)(v13 + 32) + 1944) shouldScaleOverlayToFillBoundsAtIndex:v14];
    [*(id *)(*(void *)(v13 + 32) + 1944) titleAndIconOpacityForIndex:v14];
    double v75 = v17;
    char v73 = [*(id *)(*(void *)(v13 + 32) + 1944) isResizeGrabberVisibleForAppLayout:*(void *)(v13 + 40)];
    uint64_t v74 = [*(id *)(*(void *)(v13 + 32) + 1944) headerStyleForIndex:v14];
    unsigned int v69 = [*(id *)(*(void *)(v13 + 32) + 1944) wantsSpaceAccessoryViewPointerInteractionsForAppLayout:*(void *)(v13 + 40)];
    [*(id *)(*(void *)(v13 + 32) + 1944) spaceAccessoryViewIconHitTestOutsetForAppLayout:*(void *)(v13 + 40)];
    double v68 = v18;
    int v85 = [*(id *)(*(void *)(v13 + 32) + 1944) shouldAccessoryDrawShadowForAppLayout:*(void *)(v13 + 40)];
    [*(id *)(*(void *)(v13 + 32) + 1944) backgroundOpacityForIndex:v14];
    uint64_t v72 = v19;
    [*(id *)(*(void *)(v13 + 32) + 1944) titleOpacityForIndex:v14];
    uint64_t v71 = v20;
    unsigned int v80 = [*(id *)(*(void *)(v13 + 32) + 1944) isIndexRubberbandableForSwipeToKill:v14];
    v76 = [*(id *)(*(void *)(v13 + 32) + 1944) animationAttributesForLayoutElement:*(void *)(v13 + 40)];
    uint64_t v86 = [v76 opacityUpdateMode];
    if (!v86) {
      uint64_t v86 = [v76 updateMode];
    }
    uint64_t v21 = [v76 titleAndIconOpacityUpdateMode];
    if (!v21) {
      uint64_t v21 = [v76 updateMode];
    }
    uint64_t v70 = v21;
    v22 = [v76 opacitySettings];
    v23 = v22;
    if (v22)
    {
      id v87 = v22;
    }
    else
    {
      id v87 = [v76 layoutSettings];
    }

    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    id obj = [*(id *)(v97 + 40) leafAppLayouts];
    uint64_t v95 = [obj countByEnumeratingWithState:&v141 objects:v145 count:16];
    if (v95)
    {
      uint64_t v94 = *(void *)v142;
      do
      {
        for (uint64_t i = 0; i != v95; ++i)
        {
          if (*(void *)v142 != v94) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v141 + 1) + 8 * i);
          v26 = *(void **)(v97 + 40);
          v27 = [v25 allItems];
          v28 = [v27 firstObject];
          uint64_t v29 = [v26 layoutRoleForItem:v28];

          if (SBLayoutRoleMaskContainsRole(*(void *)(v97 + 48), v29))
          {
            v30 = [*(id *)(v97 + 32) _itemContainerForAppLayoutIfExists:v25];
            uint64_t v31 = [*(id *)(*(void *)(v97 + 32) + 1944) tintStyleForLayoutRole:v29 inAppLayout:*(void *)(v97 + 40)];
            uint64_t v93 = [*(id *)(*(void *)(v97 + 32) + 1944) shadowStyleForLayoutRole:v29 inAppLayout:*(void *)(v97 + 40)];
            [*(id *)(*(void *)(v97 + 32) + 1944) opacityForLayoutRole:v29 inAppLayout:*(void *)(v97 + 40) atIndex:v96];
            uint64_t v33 = v32;
            uint64_t v34 = 0;
            if ((v85 & 1) == 0)
            {
              [*(id *)(*(void *)(v97 + 32) + 1944) shadowOpacityForLayoutRole:v29 atIndex:v96];
              uint64_t v34 = v35;
            }
            [*(id *)(*(void *)(v97 + 32) + 1944) dimmingAlphaForLayoutRole:v29 inAppLayout:*(void *)(v97 + 40)];
            uint64_t v37 = v36;
            unsigned int v92 = [*(id *)(*(void *)(v97 + 32) + 1944) isLayoutRoleSelectable:v29 inAppLayout:*(void *)(v97 + 40)];
            unsigned int v90 = [*(id *)(*(void *)(v97 + 32) + 1944) shouldSuppressHighlightEffectForLayoutRole:v29 inAppLayout:*(void *)(v97 + 40)];
            char v38 = [*(id *)(*(void *)(v97 + 32) + 1944) shouldAllowContentViewTouchesForLayoutRole:v29 inAppLayout:*(void *)(v97 + 40)];
            if ([*(id *)(v97 + 32) _supportsKillingForAppLayout:*(void *)(v97 + 40)]) {
              unsigned int v91 = [*(id *)(*(void *)(v97 + 32) + 1944) isLayoutRoleKillable:v29 inAppLayout:*(void *)(v97 + 40) atIndex:v96];
            }
            else {
              unsigned int v91 = 0;
            }
            uint64_t v39 = [*(id *)(*(void *)(v97 + 32) + 1944) isLayoutRoleEligibleForContentDragSpringLoading:v29 inAppLayout:*(void *)(v97 + 40)];
            uint64_t v40 = [*(id *)(*(void *)(v97 + 32) + 1944) activeCornersForTouchResizeForLayoutRole:v29 inAppLayout:*(void *)(v97 + 40)];
            if ([*(id *)(v97 + 32) _isSwitcherForegroundActive]) {
              char v41 = [*(id *)(*(void *)(v97 + 32) + 1944) isItemResizingAllowedForLayoutRole:v29 inAppLayout:*(void *)(v97 + 40)];
            }
            else {
              char v41 = 0;
            }
            uint64_t v42 = [*(id *)(*(void *)(v97 + 32) + 1944) touchBehaviorForLayoutRole:v29 inAppLayout:*(void *)(v97 + 40)];
            uint64_t v43 = v31;
            v44 = (void *)MEMORY[0x1E4F42FF0];
            v122[0] = MEMORY[0x1E4F143A8];
            v122[1] = 3221225472;
            v122[2] = __76__SBFluidSwitcherViewController__applyStyleToAppLayout_roleMask_completion___block_invoke_2;
            v122[3] = &unk_1E6AFA7C0;
            v122[4] = *(void *)(v97 + 32);
            v122[5] = v25;
            id v123 = v30;
            uint64_t v124 = v96;
            char v136 = v38;
            char v137 = v83;
            uint64_t v125 = v33;
            uint64_t v126 = v34;
            uint64_t v127 = v84;
            uint64_t v128 = v37;
            uint64_t v129 = v43;
            char v138 = v82;
            uint64_t v130 = v9;
            uint64_t v131 = v7;
            char v139 = v81;
            uint64_t v132 = v12;
            uint64_t v133 = v93;
            uint64_t v134 = v40;
            char v140 = v41;
            uint64_t v135 = v42;
            v45 = (void (*)(void *, __CFString *))v88[2];
            id v46 = v30;
            v47 = v45(v88, @"style");
            objc_msgSend(v44, "sb_animateWithSettings:mode:animations:completion:", v87, v86, v122, v47);

            [v46 setKillAxis:0];
            [v46 setKillable:v91];
            [v46 setRubberbandable:v80];
            [v46 setSelectable:v92];
            [v46 setSuppressesHighlightEffect:v90];
            [v46 setClipsToUnobscuredMargin:v79];
            [v46 setUnobscuredMargin:v16];
            [v46 setShouldScaleOverlayToFillBounds:v78];
            [v46 setEligibleForContentDragSpringLoading:v39];
            if (v29 == 1) {
              uint64_t v48 = v77;
            }
            else {
              uint64_t v48 = 0;
            }
            [v46 setFocusable:v48];
          }
        }
        uint64_t v95 = [obj countByEnumeratingWithState:&v141 objects:v145 count:16];
      }
      while (v95);
    }

    uint64_t v118 = 0;
    v119 = &v118;
    uint64_t v120 = 0x2020000000;
    char v121 = 1;
    v114[0] = MEMORY[0x1E4F143A8];
    v114[1] = 3221225472;
    v114[2] = __76__SBFluidSwitcherViewController__applyStyleToAppLayout_roleMask_completion___block_invoke_3;
    v114[3] = &unk_1E6AFA4C8;
    id v115 = *(id *)(v97 + 40);
    v116 = &v118;
    uint64_t v117 = *(void *)(v97 + 48);
    SBLayoutRoleEnumerateValidRoles(v114);
    if (!*(void *)(v97 + 48) || *((unsigned char *)v119 + 24))
    {
      v49 = [*(id *)(*(void *)(v97 + 32) + 1840) objectForKey:*(void *)(v97 + 40)];
      v50 = [*(id *)(*(void *)(v97 + 32) + 1848) objectForKey:*(void *)(v97 + 40)];
      uint64_t v51 = 0;
      if (v85)
      {
        [*(id *)(*(void *)(v97 + 32) + 1944) shadowOpacityForLayoutRole:1 atIndex:v96];
        uint64_t v51 = v52;
      }
      uint64_t v53 = [*(id *)(*(void *)(v97 + 32) + 1944) shadowStyleForLayoutRole:1 inAppLayout:*(void *)(v97 + 40)];
      [*(id *)(*(void *)(v97 + 32) + 1944) opacityForLayoutRole:1 inAppLayout:*(void *)(v97 + 40) atIndex:v96];
      uint64_t v55 = v54;
      v56 = (void *)MEMORY[0x1E4F42FF0];
      v103[0] = MEMORY[0x1E4F143A8];
      v103[1] = 3221225472;
      v103[2] = __76__SBFluidSwitcherViewController__applyStyleToAppLayout_roleMask_completion___block_invoke_4;
      v103[3] = &unk_1E6AFA7E8;
      id v57 = v49;
      id v104 = v57;
      uint64_t v108 = v55;
      id v58 = *(id *)(v97 + 40);
      uint64_t v59 = *(void *)(v97 + 32);
      id v105 = v58;
      uint64_t v106 = v59;
      id v60 = v50;
      id v107 = v60;
      uint64_t v109 = v72;
      uint64_t v110 = v84;
      uint64_t v111 = v51;
      uint64_t v112 = v53;
      char v113 = v73;
      v61 = ((void (*)(void *, __CFString *))v88[2])(v88, @"accessory style");
      objc_msgSend(v56, "sb_animateWithSettings:mode:animations:completion:", v87, v86, v103, v61);

      v62 = (void *)MEMORY[0x1E4F42FF0];
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __76__SBFluidSwitcherViewController__applyStyleToAppLayout_roleMask_completion___block_invoke_5;
      v98[3] = &unk_1E6AF7748;
      id v63 = v57;
      id v99 = v63;
      uint64_t v101 = v71;
      id v64 = v60;
      id v100 = v64;
      double v102 = v75;
      v65 = ((void (*)(void *, __CFString *))v88[2])(v88, @"accessory title opacity");
      objc_msgSend(v62, "sb_animateWithSettings:mode:animations:completion:", v87, v70, v98, v65);

      [v63 setDrawsFooter:v74 == 1];
      [v63 setWantsPointerInteractions:v69];
      [v63 setIconHitTestOutset:v68];
      v66 = ((void (*)(void *, __CFString *))v88[2])(v88, @"header opacity");
      double v67 = 0.0;
      if (!v74) {
        double v67 = v75;
      }
      [v64 setHeaderOpacity:v86 updateMode:v87 settings:v66 completion:v67];

      if (v85) {
        [*(id *)(v97 + 32) _updateShadowPathForIndex:v96];
      }
    }
    _Block_object_dispose(&v118, 8);
  }
}

uint64_t __52__SBFluidSwitcherViewController__updateVisibleItems__block_invoke_6(id *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v9 = [a1[5] _itemContainerForAppLayoutIfExists:v8];

        if (!v9)
        {
          id v10 = a1[6];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __52__SBFluidSwitcherViewController__updateVisibleItems__block_invoke_7;
          v25[3] = &unk_1E6AF4B60;
          v25[4] = v8;
          uint64_t v11 = objc_msgSend(v10, "bs_firstObjectPassingTest:", v25);
          if (v11)
          {
            uint64_t v12 = [*((id *)a1[5] + 229) objectForKey:v11];
          }
          else
          {
            uint64_t v12 = 0;
          }
          [a1[5] _addVisibleItemContainerForAppLayout:v8 reusingItemContainerIfExists:v12];

          char v5 = 1;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v4);

    if (v5) {
      [a1[5] _ensureSubviewOrdering];
    }
  }
  else
  {
  }
  if ([a1[6] count] || objc_msgSend(a1[4], "count"))
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = a1[7];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * j);
          uint64_t v19 = objc_msgSend(a1[5], "_itemContainerForAppLayoutIfExists:", v18, (void)v21);
          objc_msgSend(v19, "setVisible:", objc_msgSend(a1[5], "isAppLayoutVisibleInSwitcherBounds:", v18));
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v30 count:16];
      }
      while (v15);
    }
  }
  objc_msgSend(a1[5], "_updateVisibleAdjustedAppLayouts", (void)v21);
  return [a1[5] _updateVisibleOverlayAndUnderlayViews];
}

- (id)_itemContainerForAppLayoutIfExists:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_visibleItemContainers objectForKey:a3];
}

- (void)_updateVisibleAdjustedAppLayouts
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (NSSet *)objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_visibleItemContainers allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        if (v9) {
          [(NSSet *)v3 addObject:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  visibleAdjustedAppLayouts = self->_visibleAdjustedAppLayouts;
  self->_visibleAdjustedAppLayouts = v3;
}

- (void)_updateVisibleOverlayAndUnderlayViews
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  uint64_t v107 = 0;
  uint64_t v108 = &v107;
  uint64_t v109 = 0x3032000000;
  uint64_t v110 = __Block_byref_object_copy__14;
  uint64_t v111 = __Block_byref_object_dispose__14;
  id v112 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews allKeys];
  uint64_t v3 = [(NSSet *)self->_visibleAdjustedAppLayouts allObjects];
  uint64_t v103 = 0;
  id v104 = &v103;
  uint64_t v105 = 0x2020000000;
  char v106 = 0;
  v102[0] = MEMORY[0x1E4F143A8];
  v102[1] = 3221225472;
  v102[2] = __70__SBFluidSwitcherViewController__updateVisibleOverlayAndUnderlayViews__block_invoke;
  v102[3] = &unk_1E6AFA680;
  v102[4] = self;
  v102[5] = &v107;
  v102[6] = &v103;
  id v64 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v102);
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id obj = (id)v108[5];
  uint64_t v4 = [obj countByEnumeratingWithState:&v98 objects:v120 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v99;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v99 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v98 + 1) + 8 * i);
        if (([v3 containsObject:v7] & 1) == 0)
        {
          v97[0] = MEMORY[0x1E4F143A8];
          v97[1] = 3221225472;
          v97[2] = __70__SBFluidSwitcherViewController__updateVisibleOverlayAndUnderlayViews__block_invoke_2;
          v97[3] = &unk_1E6AF4B60;
          v97[4] = v7;
          uint64_t v8 = objc_msgSend(v3, "bs_firstObjectPassingTest:", v97);
          uint64_t v9 = (void *)v8;
          if (v8)
          {
            rootModifier = self->_rootModifier;
            uint64_t v119 = v8;
            long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v119 count:1];
            long long v12 = [(SBSwitcherModifier *)rootModifier preferredAppLayoutToReuseAccessoryForAppLayout:v7 fromAppLayouts:v11];

            if (v12) {
              ((void (**)(void, uint64_t, void *))v64)[2](v64, v7, v12);
            }
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v98 objects:v120 count:16];
    }
    while (v4);
  }

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v13 = v3;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v93 objects:v118 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v94;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v94 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v93 + 1) + 8 * j);
        if (([(id)v108[5] containsObject:v17] & 1) == 0)
        {
          uint64_t v18 = (void *)v108[5];
          v92[0] = MEMORY[0x1E4F143A8];
          v92[1] = 3221225472;
          v92[2] = __70__SBFluidSwitcherViewController__updateVisibleOverlayAndUnderlayViews__block_invoke_3;
          v92[3] = &unk_1E6AF4B60;
          v92[4] = v17;
          uint64_t v19 = objc_msgSend(v18, "bs_filter:", v92);
          uint64_t v20 = [(SBSwitcherModifier *)self->_rootModifier preferredAppLayoutToReuseAccessoryForAppLayout:v17 fromAppLayouts:v19];
          if (v20) {
            ((void (**)(void, void *, uint64_t))v64)[2](v64, v20, v17);
          }
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v93 objects:v118 count:16];
    }
    while (v14);
  }

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v21 = (id)v108[5];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v88 objects:v117 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v89;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v89 != v23) {
          objc_enumerationMutation(v21);
        }
        uint64_t v25 = *(void *)(*((void *)&v88 + 1) + 8 * k);
        if (([v13 containsObject:v25] & 1) == 0)
        {
          v87[0] = MEMORY[0x1E4F143A8];
          v87[1] = 3221225472;
          v87[2] = __70__SBFluidSwitcherViewController__updateVisibleOverlayAndUnderlayViews__block_invoke_4;
          v87[3] = &unk_1E6AF4B60;
          v87[4] = v25;
          long long v26 = objc_msgSend(v13, "bs_filter:", v87);
          long long v27 = [(SBSwitcherModifier *)self->_rootModifier preferredAppLayoutToReuseAccessoryForAppLayout:v25 fromAppLayouts:v26];
          if (v27) {
            ((void (**)(void, uint64_t, void *))v64)[2](v64, v25, v27);
          }
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v88 objects:v117 count:16];
    }
    while (v22);
  }

  long long v28 = (void *)v108[5];
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __70__SBFluidSwitcherViewController__updateVisibleOverlayAndUnderlayViews__block_invoke_5;
  v85[3] = &unk_1E6AF4B60;
  id v29 = v13;
  id v86 = v29;
  v30 = objc_msgSend(v28, "bs_filter:", v85);
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __70__SBFluidSwitcherViewController__updateVisibleOverlayAndUnderlayViews__block_invoke_6;
  v84[3] = &unk_1E6AFA6A8;
  v84[4] = &v107;
  uint64_t v53 = v29;
  uint64_t v54 = objc_msgSend(v29, "bs_filter:", v84);
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v55 = v30;
  uint64_t v57 = [v55 countByEnumeratingWithState:&v80 objects:v116 count:16];
  if (v57)
  {
    uint64_t v56 = *(void *)v81;
    do
    {
      for (uint64_t m = 0; m != v57; ++m)
      {
        if (*(void *)v81 != v56) {
          objc_enumerationMutation(v55);
        }
        uint64_t v31 = *(void **)(*((void *)&v80 + 1) + 8 * m);
        uint64_t v32 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews objectForKey:v31];
        [v32 _removeAllRetargetableAnimations:1];
        [v32 setHidden:1];
        [(SBFluidSwitcherViewController *)self _enqueueOverlayAccessoryViewInReusePool:v32];
        [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews removeObjectForKey:v31];
        uint64_t v59 = v32;
        uint64_t v33 = [(NSMutableDictionary *)self->_visibleUnderlayAccessoryViews objectForKey:v31];
        [v33 _removeAllRetargetableAnimations:1];
        [v33 setHidden:1];
        [(SBFluidSwitcherViewController *)self _enqueueUnderlayAccessoryViewInReusePool:v33];
        [(NSMutableDictionary *)self->_visibleUnderlayAccessoryViews removeObjectForKey:v31];
        id v58 = v33;
        id obja = [(NSMutableDictionary *)self->_appLayoutToTitleItemController objectForKey:v31];
        if (obja)
        {
          [obja invalidate];
          [(NSMutableDictionary *)self->_appLayoutToTitleItemController removeObjectForKey:v31];
        }
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        uint64_t v34 = [v31 leafAppLayouts];
        uint64_t v35 = [v34 countByEnumeratingWithState:&v76 objects:v115 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v77;
          do
          {
            for (uint64_t n = 0; n != v35; ++n)
            {
              if (*(void *)v77 != v36) {
                objc_enumerationMutation(v34);
              }
              char v38 = [(NSMutableDictionary *)self->_visibleItemContainers objectForKey:*(void *)(*((void *)&v76 + 1) + 8 * n)];
              uint64_t v39 = [v38 contentView];
              char v40 = objc_opt_respondsToSelector();

              if (v40)
              {
                char v41 = [v38 contentView];
                [v41 setShowingIconOverlayView:0];
              }
            }
            uint64_t v35 = [v34 countByEnumeratingWithState:&v76 objects:v115 count:16];
          }
          while (v35);
        }
      }
      uint64_t v57 = [v55 countByEnumeratingWithState:&v80 objects:v116 count:16];
    }
    while (v57);
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id objb = v54;
  uint64_t v42 = [objb countByEnumeratingWithState:&v72 objects:v114 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v73;
    do
    {
      for (iuint64_t i = 0; ii != v42; ++ii)
      {
        if (*(void *)v73 != v43) {
          objc_enumerationMutation(objb);
        }
        uint64_t v45 = *(void *)(*((void *)&v72 + 1) + 8 * ii);
        id v46 = [(SBFluidSwitcherViewController *)self _dequeueOverlayAccessoryViewFromReusePool];
        [(SBFluidSwitcherContentView *)self->_contentView addSubview:v46];
        [(SBFluidSwitcherContentView *)self->_contentView bringSubviewToFront:v46];
        [v46 setHidden:0];
        [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews setObject:v46 forKey:v45];
        v47 = [(SBFluidSwitcherViewController *)self _dequeueUnderlayAccessoryViewFromReusePool];
        [(SBFluidSwitcherContentView *)self->_contentView addSubview:v47];
        [(SBFluidSwitcherContentView *)self->_contentView sendSubviewToBack:v47];
        [v47 setHidden:0];
        [(NSMutableDictionary *)self->_visibleUnderlayAccessoryViews setObject:v47 forKey:v45];
      }
      uint64_t v42 = [objb countByEnumeratingWithState:&v72 objects:v114 count:16];
    }
    while (v42);
  }

  if ([v55 count] || objc_msgSend(objb, "count") || *((unsigned char *)v104 + 24)) {
    [(SBFluidSwitcherViewController *)self _ensureSubviewOrdering];
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v48 = v53;
  uint64_t v49 = [v48 countByEnumeratingWithState:&v68 objects:v113 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v69;
    do
    {
      for (juint64_t j = 0; jj != v49; ++jj)
      {
        if (*(void *)v69 != v50) {
          objc_enumerationMutation(v48);
        }
        [(SBFluidSwitcherViewController *)self _updateTitlePresenceForAdjustedAppLayout:*(void *)(*((void *)&v68 + 1) + 8 * jj)];
      }
      uint64_t v49 = [v48 countByEnumeratingWithState:&v68 objects:v113 count:16];
    }
    while (v49);
  }

  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __70__SBFluidSwitcherViewController__updateVisibleOverlayAndUnderlayViews__block_invoke_7;
  v65[3] = &unk_1E6AF5290;
  id v52 = objb;
  id v66 = v52;
  double v67 = self;
  [(SBFluidSwitcherViewController *)self _performWithFixedUpdateMode:1 usingBlock:v65];

  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v107, 8);
}

- (void)_applyStyleToLiveContentOverlay:(id)a3 forItemContainer:(id)a4 atIndex:(unint64_t)a5
{
  rootModifier = self->_rootModifier;
  id v7 = a3;
  objc_msgSend(v7, "setUsesBrightSceneViewBackgroundMaterial:", -[SBSwitcherModifier shouldUseBrightMaterialForIndex:](rootModifier, "shouldUseBrightMaterialForIndex:", a5));
}

void __69__SBFluidSwitcherViewController__updateCornerRadiiiAndMaximizedState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [v6 allItems];
  uint64_t v8 = [v7 firstObject];

  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 1304) objectForKey:v6];

  id v10 = *(void **)(a1 + 32);
  id v21 = 0;
  int v11 = [v10 appLayoutContainsAnUnoccludedMaximizedDisplayItem:v9 ignoreOcclusion:1 displayItem:&v21];
  id v12 = v21;
  id v13 = v12;
  if (v11) {
    uint64_t v14 = [v12 isEqual:v8];
  }
  else {
    uint64_t v14 = 0;
  }
  [v5 setMaximized:v14];
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v15 = [*(id *)(a1 + 32) chamoisLayoutAttributes];
    [v15 stageCornerRadii];
    double v17 = v16;

    double v18 = v17;
    double v19 = v17;
    double v20 = v17;
  }
  else
  {
    double v17 = *MEMORY[0x1E4F43C68];
    double v18 = *(double *)(MEMORY[0x1E4F43C68] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F43C68] + 16);
    double v20 = *(double *)(MEMORY[0x1E4F43C68] + 24);
  }
  objc_msgSend(v5, "setCornerRadii:", v17, v18, v19, v20);
}

- (BOOL)appLayoutContainsAnUnoccludedMaximizedDisplayItem:(id)a3 ignoreOcclusion:(BOOL)a4 displayItem:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unint64_t v9 = [(SBFluidSwitcherViewController *)self _windowManagementStyle];
  if (v9 == 2)
  {
    uint64_t v14 = [(SBFluidSwitcherViewController *)self chamoisLayoutAttributes];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = [v8 allItems];
    uint64_t v15 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      BOOL v43 = v6;
      uint64_t v42 = a5;
      uint64_t v45 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v47 != v45) {
            objc_enumerationMutation(obj);
          }
          double v18 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          id v19 = v8;
          double v20 = objc_msgSend(v8, "layoutAttributesForItem:", v18, v42);
          BOOL IsOccluded = SBDisplayItemLayoutAttributesOcclusionStateIsOccluded([v20 occlusionState]);
          uint64_t v22 = [v20 sizingPolicy];
          [(SBFluidSwitcherViewController *)self containerViewBounds];
          double v24 = v23;
          double v26 = v25;
          double v28 = v27;
          double v30 = v29;
          [v14 defaultWindowSize];
          double v32 = v31;
          double v34 = v33;
          [v14 screenEdgePadding];
          objc_msgSend(v20, "sizeInBounds:defaultSize:screenEdgePadding:", v24, v26, v28, v30, v32, v34, v35);
          int v36 = BSSizeEqualToSize();
          BOOL v37 = [(SBFluidSwitcherViewController *)self _areContinuousExposeStripsUnoccluded];
          if (v22 == 2) {
            int v38 = 1;
          }
          else {
            int v38 = v36;
          }
          if (IsOccluded || v37)
          {
            if (v43 & v38)
            {
LABEL_32:
              id v11 = v18;

              BOOL v12 = 1;
              a5 = v42;
              id v8 = v19;
              goto LABEL_34;
            }
          }
          else if (v38)
          {
            goto LABEL_32;
          }

          id v8 = v19;
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      id v11 = 0;
      BOOL v12 = 0;
      a5 = v42;
    }
    else
    {
      id v11 = 0;
      BOOL v12 = 0;
    }
LABEL_34:

    goto LABEL_35;
  }
  if (v9 == 1)
  {
    if ([v8 environment] != 1)
    {
LABEL_30:
      id v11 = 0;
      BOOL v12 = 0;
      if (!a5) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
    uint64_t v14 = [v8 itemForLayoutRole:1];
    if (!v14) {
      goto LABEL_29;
    }
    uint64_t v39 = [v8 itemForLayoutRole:2];
    if (v39
      || ([v8 itemForLayoutRole:3], (uint64_t v39 = objc_claimAutoreleasedReturnValue()) != 0))
    {

LABEL_29:
      BOOL v12 = 0;
      id v11 = 0;
      goto LABEL_35;
    }
    char v41 = [v8 itemForLayoutRole:4];

    if (v41) {
      goto LABEL_29;
    }
    id v11 = v14;
    BOOL v12 = 1;
LABEL_35:

    if (!a5) {
      goto LABEL_37;
    }
LABEL_36:
    *a5 = v11;
    goto LABEL_37;
  }
  if (v9) {
    goto LABEL_30;
  }
  id v10 = [v8 itemForLayoutRole:1];
  id v11 = v10;
  BOOL v12 = v10 != 0;
  if (v10) {
    id v13 = v10;
  }

  if (a5) {
    goto LABEL_36;
  }
LABEL_37:

  return v12;
}

- (id)medusaSettings
{
  return +[SBMedusaDomain rootSettings];
}

- (BOOL)_supportsKillingForAppLayout:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  BOOL v6 = WeakRetained;
  if ((*((unsigned char *)&self->_dataSourceRespondsTo + 2) & 0x10) != 0) {
    char v7 = [WeakRetained switcherContentController:self supportsKillingOfAppLayout:v4];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)_isSwitcherForegroundActive
{
  id v2 = [(SBFluidSwitcherViewController *)self _gestureManager];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 isSwitcherForegroundActive];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)_gestureManager
{
  uint64_t v3 = [(SBFluidSwitcherViewController *)self dataSource];
  char v4 = v3;
  if (*(unsigned char *)&self->_dataSourceRespondsTo)
  {
    id v5 = [v3 switcherGestureManagerForSwitcherContentController:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_dequeueUnderlayAccessoryViewFromReusePool
{
  uint64_t v3 = [(NSMutableSet *)self->_underlayAccessoryViewsReusePool anyObject];
  if (v3)
  {
    char v4 = (SBFluidSwitcherSpaceUnderlayAccessoryView *)v3;
    [(NSMutableSet *)self->_underlayAccessoryViewsReusePool removeObject:v3];
  }
  else
  {
    id v5 = [SBFluidSwitcherSpaceUnderlayAccessoryView alloc];
    BOOL v6 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
    char v7 = [v6 systemPointerInteractionManager];
    char v4 = [(SBFluidSwitcherSpaceUnderlayAccessoryView *)v5 initWithDelegate:self systemPointerInteractionManager:v7];
  }
  return v4;
}

- (id)_dequeueOverlayAccessoryViewFromReusePool
{
  uint64_t v3 = [(NSMutableSet *)self->_overlayAccessoryViewsReusePool anyObject];
  if (v3)
  {
    char v4 = (SBFluidSwitcherSpaceOverlayAccessoryView *)v3;
    [(NSMutableSet *)self->_overlayAccessoryViewsReusePool removeObject:v3];
  }
  else
  {
    char v4 = [[SBFluidSwitcherSpaceOverlayAccessoryView alloc] initWithDelegate:self];
  }
  return v4;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (CGPoint)scrollViewContentOffset
{
  id v2 = [(SBFluidSwitcherViewController *)self scrollView];
  [v2 contentOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (SBAppSwitcherScrollView)scrollView
{
  return self->_scrollView;
}

- (void)_applyRootContentViewBlurRadiusWithCompletion:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SBSwitcherModifier *)self->_rootModifier rootContentViewBlurRadius];
  uint64_t v6 = v5;
  double v7 = [(SBSwitcherModifier *)self->_rootModifier animationAttributesForLayoutElement:self->_contentView];
  double v8 = [(SBFluidSwitcherViewController *)self switcherSettings];
  unint64_t v9 = [v8 animationSettings];

  id v10 = [v7 layoutSettings];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v9 layoutSettings];
  }
  id v13 = v12;

  unint64_t v14 = [v7 layoutUpdateMode];
  if (v14 <= 1) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = v14;
  }
  int IsZero = BSFloatIsZero();
  double v17 = [(SBFluidSwitcherContentView *)self->_contentView layer];
  double v18 = [v17 filters];
  id v19 = v18;
  if (!IsZero)
  {
    id v21 = [v18 firstObject];

    double v31 = v9;
    if (v21)
    {
      uint64_t v22 = [v21 type];
      double v23 = (void *)*MEMORY[0x1E4F3A0D0];

      if (v22 == v23)
      {
        id v27 = v21;
        [v27 setName:@"gaussianBlur"];
        double v24 = v27;
        goto LABEL_18;
      }
    }
    else
    {
      double v23 = (void *)*MEMORY[0x1E4F3A0D0];
    }
    double v24 = objc_msgSend(MEMORY[0x1E4F39BC0], "filterWithType:", v23, v9);
    [v24 setName:@"gaussianBlur"];
    [v24 setValue:&unk_1F3348AD8 forKey:@"inputRadius"];
    double v25 = [(SBFluidSwitcherContentView *)self->_contentView layer];
    v37[0] = v24;
    double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    [v25 setFilters:v26];

    id v27 = 0;
LABEL_18:
    double v28 = [(SBFluidSwitcherContentView *)self->_contentView layer];
    double v29 = [(SBFluidSwitcherViewController *)self traitCollection];
    [v29 displayScale];
    objc_msgSend(v28, "setRasterizationScale:");

    double v30 = [(SBFluidSwitcherContentView *)self->_contentView layer];
    [v30 setShouldRasterize:1];

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __79__SBFluidSwitcherViewController__applyRootContentViewBlurRadiusWithCompletion___block_invoke_3;
    v33[3] = &unk_1E6AF4A70;
    v33[4] = self;
    v33[5] = v6;
    objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", v13, v15, v33, v4);

    unint64_t v9 = v32;
    goto LABEL_19;
  }

  if (v19)
  {
    double v20 = (void *)MEMORY[0x1E4F42FF0];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __79__SBFluidSwitcherViewController__applyRootContentViewBlurRadiusWithCompletion___block_invoke;
    v36[3] = &unk_1E6AF4A70;
    v36[4] = self;
    v36[5] = v6;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __79__SBFluidSwitcherViewController__applyRootContentViewBlurRadiusWithCompletion___block_invoke_2;
    v34[3] = &unk_1E6AFA340;
    v34[4] = self;
    id v35 = v4;
    objc_msgSend(v20, "sb_animateWithSettings:mode:animations:completion:", v13, v15, v36, v34);
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
LABEL_19:
}

void __61__SBFluidSwitcherViewController__updateLayoutWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  double v3 = a2;
  id v4 = [*(id *)(a1 + 32) view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = [*(id *)(*(void *)(a1 + 32) + 1944) animationAttributesForLayoutElement:*(void *)(*(void *)(a1 + 32) + 1424)];
  unint64_t v14 = [v13 layoutSettings];
  uint64_t v15 = [v13 layoutUpdateMode];
  if (!v15) {
    uint64_t v15 = [v13 updateMode];
  }
  uint64_t v16 = *(void **)(*(void *)(a1 + 32) + 1816);
  UIRectGetCenter();
  objc_msgSend(v16, "setCenter:");
  double v17 = *(void **)(*(void *)(a1 + 32) + 1816);
  SBRectWithSize();
  objc_msgSend(v17, "setBounds:");
  double v18 = *(void **)(a1 + 32);
  id v19 = v3[2](v3, @"root-content-view");
  [v18 _applyRootContentViewClippingAndBlurWithCompletion:v19];

  uint64_t v20 = *(void *)(a1 + 32);
  id v21 = (id *)MEMORY[0x1E4F43630];
  if (*(void *)(v20 + 1928))
  {
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      v51.origin.x = v6;
      v51.origin.y = v8;
      v51.size.width = v10;
      v51.size.height = v12;
      CGRectGetMaxX(v51);
    }
    uint64_t v22 = *(void **)(*(void *)(a1 + 32) + 1928);
    UIRectGetCenter();
    objc_msgSend(v22, "setCenter:");
    double v23 = *(void **)(*(void *)(a1 + 32) + 1928);
    SBRectWithSize();
    objc_msgSend(v23, "setBounds:");
    uint64_t v20 = *(void *)(a1 + 32);
  }
  if (*(void *)(v20 + 1936))
  {
    [*(id *)(v20 + 1928) frame];
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1936), "sizeThatFits:", v10, v12);
    uint64_t v32 = [*v21 userInterfaceLayoutDirection];
    uint64_t v33 = v25;
    uint64_t v34 = v27;
    uint64_t v35 = v29;
    uint64_t v36 = v31;
    if (v32 == 1) {
      CGRectGetMinX(*(CGRect *)&v33);
    }
    else {
      CGRectGetMaxX(*(CGRect *)&v33);
    }
    BOOL v37 = *(void **)(*(void *)(a1 + 32) + 1936);
    UIRectGetCenter();
    objc_msgSend(v37, "setCenter:");
    int v38 = *(void **)(*(void *)(a1 + 32) + 1936);
    SBRectWithSize();
    objc_msgSend(v38, "setBounds:");
    uint64_t v20 = *(void *)(a1 + 32);
  }
  uint64_t v39 = *(void **)(v20 + 1712);
  if (v39)
  {
    objc_msgSend(v39, "setBounds:", v6, v8, v10, v12);
    char v40 = *(void **)(*(void *)(a1 + 32) + 1712);
    UIRectGetCenter();
    objc_msgSend(v40, "setCenter:");
    uint64_t v20 = *(void *)(a1 + 32);
  }
  char v41 = v3[2](v3, @"shelves");
  [(id)v20 _layoutVisibleShelvesWithCompletion:v41];

  uint64_t v42 = (void *)MEMORY[0x1E4F42FF0];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __61__SBFluidSwitcherViewController__updateLayoutWithCompletion___block_invoke_2;
  v50[3] = &unk_1E6AF4AC0;
  v50[4] = *(void *)(a1 + 32);
  BOOL v43 = v3[2](v3, @"content view transform");
  objc_msgSend(v42, "sb_animateWithSettings:mode:animations:completion:", v14, v15, v50, v43);

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1192), "setFrame:", v6, v8, v10, v12);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1808), "setFrame:", v6, v8, v10, v12);
  [*(id *)(a1 + 32) _updateScrollViewSizeAndSpacing];
  v44 = *(void **)(a1 + 32);
  uint64_t v45 = v3[2](v3, @"layout visible items");
  [v44 _layoutVisibleItemsWithCompletion:v45];

  long long v46 = *(void **)(a1 + 32);
  long long v47 = v3[2](v3, @"layout slideover tongues");
  [v46 _layoutSlideoverTonguesWithCompletion:v47];

  long long v48 = *(void **)(a1 + 32);
  long long v49 = v3[2](v3, @"layout continuous expose strip tongue");
  [v48 _layoutContinuousExposeStripTongueAnimated:1 completion:v49];
}

- (void)_layoutVisibleShelvesWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v22 = (void (**)(id, uint64_t, void))a3;
  id v4 = [(NSMutableDictionary *)self->_visibleShelves allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        double v10 = [(SBSwitcherModifier *)self->_rootModifier visibleShelves];
        if ([v10 containsObject:v9])
        {
          double v11 = [(NSMutableDictionary *)self->_visibleShelves objectForKey:v9];
          [(SBSwitcherModifier *)self->_rootModifier frameForShelf:v9];
          double v13 = v12;
          double v15 = v14;
          double v17 = v16;
          double v19 = v18;
          uint64_t v20 = [v11 view];
          objc_msgSend(v20, "sb_setBoundsAndPositionFromFrame:", v13, v15, v17, v19);

          id v21 = [v11 view];
          [v21 layoutIfNeeded];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  if (v22) {
    v22[2](v22, 1, 0);
  }
}

- (void)_layoutSlideoverTonguesWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_slideOverTongue)
  {
    uint64_t v6 = [(SBSwitcherModifier *)self->_rootModifier slideOverTongueState];
    uint64_t v7 = [(SBSwitcherModifier *)self->_rootModifier slideOverTongueDirection];
    double v8 = [(SBSwitcherModifier *)self->_rootModifier appLayoutToAttachSlideOverTongue];
    uint64_t v9 = [(SBSwitcherModifier *)self->_rootModifier animationAttributesForLayoutElement:self->_slideOverTongueLayoutElement];
    [(SBFluidSwitcherViewController *)self containerViewBounds];
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v18 = [v9 updateMode];
    unint64_t v19 = [(SBSlideOverTongueView *)self->_slideOverTongue direction];
    if (v8) {
      BOOL v20 = 1;
    }
    else {
      BOOL v20 = v7 == v19;
    }
    if (!v20) {
      uint64_t v18 = 2;
    }
    id v21 = (void *)MEMORY[0x1E4F42FF0];
    uint64_t v22 = [v9 layoutSettings];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __71__SBFluidSwitcherViewController__layoutSlideoverTonguesWithCompletion___block_invoke;
    v24[3] = &unk_1E6AFA318;
    id v25 = v8;
    long long v26 = self;
    uint64_t v27 = v7;
    uint64_t v28 = v11;
    uint64_t v29 = v13;
    uint64_t v30 = v15;
    uint64_t v31 = v17;
    id v23 = v8;
    objc_msgSend(v21, "sb_animateWithSettings:mode:animations:completion:", v22, v18, v24, v5);

    [(SBSlideOverTongueView *)self->_slideOverTongue setDirection:v7 state:v6 animated:1];
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

- (void)_layoutContinuousExposeStripTongueAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v20 = v6;
  if (self->_continuousExposeStripTongue)
  {
    uint64_t v7 = [(SBSwitcherModifier *)self->_rootModifier continuousExposeStripTongueAttributes];
    uint64_t v9 = v8;
    [(SBFluidSwitcherViewController *)self containerViewBounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    -[SBContinuousExposeStripTongueView setBounds:](self->_continuousExposeStripTongue, "setBounds:");
    continuousExposeStripTongue = self->_continuousExposeStripTongue;
    UIRectGetCenter();
    -[SBContinuousExposeStripTongueView setCenter:](continuousExposeStripTongue, "setCenter:");
    -[_UIBackdropView setBounds:](self->_continuousExposeStripTongueCaptureOnlyBackdropView, "setBounds:", v11, v13, v15, v17);
    continuousExposeStripTongueCaptureOnlyBackdropView = self->_continuousExposeStripTongueCaptureOnlyBackdropView;
    UIRectGetCenter();
    -[_UIBackdropView setCenter:](continuousExposeStripTongueCaptureOnlyBackdropView, "setCenter:");
    -[SBContinuousExposeStripTongueView setAttributes:animated:](self->_continuousExposeStripTongue, "setAttributes:animated:", v7, v9, v4);
    id v6 = v20;
  }
  if (v6)
  {
    (*((void (**)(id, uint64_t, void))v6 + 2))(v20, 1, 0);
    id v6 = v20;
  }
}

- (void)_updateScrollViewSizeAndSpacing
{
  [(SBFluidSwitcherViewController *)self _updateScrollViewScrollEnabled];
  double v3 = [(SBSwitcherModifier *)self->_rootModifier scrollViewAttributes];
  BOOL v4 = v3;
  if (v3)
  {
    scrollView = self->_scrollView;
    double v12 = v3;
    [v3 contentSize];
    -[SBAppSwitcherScrollView setContentSize:](scrollView, "setContentSize:");
    uint64_t v6 = [v12 scrollViewPagingEnabled];
    [(SBAppSwitcherScrollView *)self->_scrollView setPagingEnabled:v6];
    if (v6)
    {
      uint64_t v7 = self->_scrollView;
      [v12 interpageSpacingForPaging];
      -[SBAppSwitcherScrollView _setInterpageSpacing:](v7, "_setInterpageSpacing:");
      uint64_t v8 = self->_scrollView;
      [v12 pagingOrigin];
      -[SBAppSwitcherScrollView _setPagingOrigin:](v8, "_setPagingOrigin:");
    }
    [v12 decelerationRate];
    double v10 = v9;
    [(SBAppSwitcherScrollView *)self->_scrollView setAlwaysBounceHorizontal:1];
    [(SBAppSwitcherScrollView *)self->_scrollView setAlwaysBounceVertical:0];
    [(SBAppSwitcherScrollView *)self->_scrollView horizontalScrollDecelerationFactor];
    char v11 = BSFloatEqualToFloat();
    BOOL v4 = v12;
    if ((v11 & 1) == 0)
    {
      [(SBAppSwitcherScrollView *)self->_scrollView setHorizontalScrollDecelerationFactor:v10];
      BOOL v4 = v12;
    }
  }
}

- (void)_layoutVisibleItemsWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__SBFluidSwitcherViewController__layoutVisibleItemsWithCompletion___block_invoke;
  v3[3] = &unk_1E6AFA2F0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E4FA5E48], "perform:finalCompletion:options:delegate:", v3, a3, 0);
}

- (void)_applyRootContentViewClippingWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t, void))a3;
  [(SBSwitcherModifier *)self->_rootModifier rootContentViewMaskRect];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v13 = [(SBSwitcherModifier *)self->_rootModifier animationAttributesForLayoutElement:self->_contentView];
  double v14 = [(SBFluidSwitcherViewController *)self switcherSettings];
  double v15 = [v14 animationSettings];

  double v16 = [v13 clippingSettings];
  double v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [v15 layoutSettings];
  }
  unint64_t v19 = v18;

  unint64_t v20 = [v13 clippingUpdateMode];
  if (v20 <= 1) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = v20;
  }
  v27.origin.x = v6;
  v27.origin.y = v8;
  v27.size.width = v10;
  v27.size.height = v12;
  BOOL IsNull = CGRectIsNull(v27);
  rootDestOutClippingView = self->_rootDestOutClippingView;
  if (IsNull)
  {
    [(UIView *)rootDestOutClippingView removeFromSuperview];
    long long v24 = self->_rootDestOutClippingView;
    self->_rootDestOutClippingView = 0;
  }
  else
  {
    if (!rootDestOutClippingView)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __77__SBFluidSwitcherViewController__applyRootContentViewClippingWithCompletion___block_invoke;
      v26[3] = &unk_1E6AF8568;
      v26[4] = self;
      *(CGFloat *)&v26[5] = v6;
      *(CGFloat *)&v26[6] = v8;
      *(CGFloat *)&v26[7] = v10;
      *(CGFloat *)&v26[8] = v12;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v26];
      rootDestOutClippingView = self->_rootDestOutClippingView;
    }
    [(UIView *)rootDestOutClippingView frame];
    v29.origin.x = v6;
    v29.origin.y = v8;
    v29.size.width = v10;
    v29.size.height = v12;
    if (!CGRectEqualToRect(v28, v29))
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __77__SBFluidSwitcherViewController__applyRootContentViewClippingWithCompletion___block_invoke_2;
      v25[3] = &unk_1E6AF8568;
      v25[4] = self;
      *(CGFloat *)&void v25[5] = v6;
      *(CGFloat *)&v25[6] = v8;
      *(CGFloat *)&v25[7] = v10;
      *(CGFloat *)&v25[8] = v12;
      objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", v19, v21, v25, v4);
      goto LABEL_15;
    }
  }
  if (v4) {
    v4[2](v4, 1, 0);
  }
LABEL_15:
}

- (id)switcherSettings
{
  return self->_settings;
}

- (BOOL)hasHomeButton
{
  return SBFEffectiveHomeButtonType() != 2;
}

void __60__SBFluidSwitcherViewController__updateStyleWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  uint64_t v111 = a2;
  uint64_t v112 = a1;
  double v3 = *(void **)(a1 + 32);
  a1 += 32;
  BOOL v4 = (void *)v3[243];
  double v5 = [v3 genericSwitcherAccessoryLayoutElement];
  uint64_t v107 = [v4 animationAttributesForLayoutElement:v5];

  uint64_t v109 = [v107 updateMode];
  [*(id *)a1 _updateWallpaperStyle];
  [*(id *)a1 _updateHomeScreenContentRequirement];
  [*(id *)a1 _updateHomeScreenBackdropType];
  [*(id *)a1 _updateSwitcherBackdropType];
  id v6 = *(id *)a1;
  double v7 = v111[2](v111, @"apply style to visible item containers");
  [v6 _applyStyleToVisibleItemContainersWithCompletion:v7];

  id v8 = *(id *)a1;
  double v9 = v111[2](v111, @"plusButtonAlpha");
  [v8 _updatePlusButtonStyleWithMode:v109 completion:v9];

  id v10 = *(id *)a1;
  double v11 = v111[2](v111, @"repenClosedWindowsButtonAlpha");
  [v10 _updateReopenClosedWindowsButtonWithMode:v109 completion:v11];

  [*(id *)a1 _updateContentViewPassesTouchesThrough];
  [*(id *)a1 _updateSystemApertureShadowAssertion];
  CGFloat v12 = *(id **)a1;
  if (*(void *)(*(void *)a1 + 1408))
  {
    [v12[243] switcherDimmingAlpha];
    uint64_t v14 = v13;
    objc_msgSend(*(id *)(*(void *)(v112 + 32) + 1408), "bs_setHitTestingDisabled:", BSFloatIsZero());
    double v15 = *(void **)(v112 + 32);
    double v16 = (void *)v15[243];
    double v17 = [v15 switcherDimmingViewLayoutElement];
    id v18 = [v16 animationAttributesForLayoutElement:v17];

    uint64_t v19 = [v18 updateMode];
    unint64_t v20 = [v18 opacitySettings];
    uint64_t v21 = v20;
    if (v20)
    {
      id v22 = v20;
    }
    else
    {
      id v23 = [*(id *)(*(void *)(v112 + 32) + 1072) animationSettings];
      id v22 = [v23 opacitySettings];
    }
    long long v24 = (void *)MEMORY[0x1E4F42FF0];
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __60__SBFluidSwitcherViewController__updateStyleWithCompletion___block_invoke_2;
    v126[3] = &unk_1E6AF4A70;
    v126[4] = *(void *)(v112 + 32);
    v126[5] = v14;
    id v25 = v111[2](v111, @"switcherDimmingAlpha");
    objc_msgSend(v24, "sb_animateWithSettings:mode:animations:completion:", v22, v19, v126, v25);

    CGFloat v12 = *(id **)(v112 + 32);
  }
  if (v12[174])
  {
    [v12[243] switcherBackdropBlurProgress];
    double v27 = v26;
    objc_msgSend(*(id *)(*(void *)(v112 + 32) + 1392), "bs_setHitTestingDisabled:", BSFloatIsZero());
    CGRect v28 = *(void **)(*(void *)(v112 + 32) + 1944);
    CGRect v29 = [*(id *)(v112 + 32) switcherBackdropLayoutElement];
    uint64_t v30 = [v28 animationAttributesForLayoutElement:v29];

    uint64_t v31 = [v30 updateMode];
    uint64_t v32 = *(void **)(*(void *)(v112 + 32) + 1392);
    uint64_t v33 = v111[2](v111, @"switcherBackdropBlurProgress");
    [v32 setBlurProgress:v31 behaviorMode:v33 completion:v27];

    CGFloat v12 = *(id **)(v112 + 32);
  }
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  objc_msgSend(v12[237], "allKeys", v107);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [obj countByEnumeratingWithState:&v122 objects:v127 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v123;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v123 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = *(void *)(*((void *)&v122 + 1) + 8 * i);
        int v38 = [*(id *)(*(void *)(v112 + 32) + 1896) objectForKey:v37];
        uint64_t v121 = 0;
        long long v119 = 0u;
        long long v120 = 0u;
        locatiouint64_t n = 0u;
        uint64_t v39 = *(void *)(v112 + 32);
        char v40 = *(void **)(v39 + 1944);
        if (v40)
        {
          [v40 presentationAttributesForShelf:v37];
          double v41 = *((double *)&location + 1);
          double v43 = *((double *)&v119 + 1);
          double v44 = *(double *)&v119;
          double v42 = *(double *)&v120;
          uint64_t v39 = *(void *)(v112 + 32);
        }
        else
        {
          double v42 = 0.0;
          double v43 = 0.0;
          double v44 = 0.0;
          double v41 = 0.0;
        }
        uint64_t v45 = *(void **)(v39 + 1816);
        long long v46 = [v38 view];
        objc_msgSend(v45, "convertRect:toView:", v46, v41, v44, v43, v42);
        double v48 = v47;
        double v50 = v49;
        double v52 = v51;
        double v54 = v53;

        id v55 = v111[2](v111, @"shelf presentation");
        objc_msgSend(v38, "setPresented:withTargetFrame:style:completion:", (_BYTE)location != 0, *((void *)&v120 + 1), v55, v48, v50, v52, v54);
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v122 objects:v127 count:16];
    }
    while (v34);
  }

  [*(id *)(*(void *)(v112 + 32) + 1944) shelfBackgroundBlurOpacity];
  uint64_t v57 = v56;
  [*(id *)(*(void *)(v112 + 32) + 1944) shelfBackgroundBlurFrame];
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;
  double v65 = v64;
  id v66 = [*(id *)(*(void *)(v112 + 32) + 1944) animationAttributesForLayoutElement:*(void *)(*(void *)(v112 + 32) + 1424)];
  int v67 = BSFloatGreaterThanFloat();
  long long v68 = *(void **)(v112 + 32);
  if (v67 && !v68[184])
  {
    long long v69 = -[SBShelfBackgroundView initWithFrame:]([SBShelfBackgroundView alloc], "initWithFrame:", v59, v61, v63, v65);
    uint64_t v70 = *(void *)(v112 + 32);
    long long v71 = *(void **)(v70 + 1472);
    *(void *)(v70 + 1472) = v69;

    [*(id *)(*(void *)(v112 + 32) + 1472) setWeighting:0.0];
    [*(id *)(*(void *)(v112 + 32) + 1816) addSubview:*(void *)(*(void *)(v112 + 32) + 1472)];
    long long v68 = *(void **)(v112 + 32);
  }
  if (v68[184])
  {
    objc_initWeak((id *)&location, v68);
    uint64_t v72 = [v66 layoutUpdateMode];
    if (!v72) {
      uint64_t v72 = [v66 updateMode];
    }
    long long v73 = (void *)MEMORY[0x1E4F42FF0];
    long long v74 = [v66 layoutSettings];
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __60__SBFluidSwitcherViewController__updateStyleWithCompletion___block_invoke_3;
    v117[3] = &unk_1E6AF8568;
    *(double *)&v117[5] = v59;
    *(double *)&v117[6] = v61;
    *(double *)&v117[7] = v63;
    *(double *)&v117[8] = v65;
    v117[4] = *(void *)(v112 + 32);
    long long v75 = v111[2](v111, @"shelfBackgroundFrame");
    objc_msgSend(v73, "sb_animateWithSettings:mode:animations:completion:", v74, v72, v117, v75);

    long long v76 = *(void **)(v112 + 32);
    long long v77 = (void *)v76[184];
    [v76 containerViewBounds];
    objc_msgSend(v77, "convertRect:fromView:", *(void *)(*(void *)(v112 + 32) + 1816));
    objc_msgSend(*(id *)(*(void *)(v112 + 32) + 1472), "setExtendedBlurRect:");
    long long v78 = v111[2](v111, @"shelfBackgroundOpacity");
    long long v79 = [v66 opacitySettings];
    long long v80 = v79;
    if (v79)
    {
      id v81 = v79;
    }
    else
    {
      id v81 = [v66 layoutSettings];
    }
    long long v82 = v81;

    uint64_t v83 = [v66 opacityUpdateMode];
    if (!v83) {
      uint64_t v83 = [v66 updateMode];
    }
    uint64_t v84 = (void *)MEMORY[0x1E4F42FF0];
    v116[0] = MEMORY[0x1E4F143A8];
    v116[1] = 3221225472;
    v116[2] = __60__SBFluidSwitcherViewController__updateStyleWithCompletion___block_invoke_4;
    v116[3] = &unk_1E6AF4A70;
    v116[4] = *(void *)(v112 + 32);
    v116[5] = v57;
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __60__SBFluidSwitcherViewController__updateStyleWithCompletion___block_invoke_5;
    v113[3] = &unk_1E6AFA798;
    objc_copyWeak(&v115, (id *)&location);
    id v85 = v78;
    id v114 = v85;
    objc_msgSend(v84, "sb_animateWithSettings:mode:animations:completion:", v82, v83, v116, v113);

    objc_destroyWeak(&v115);
    objc_destroyWeak((id *)&location);
    long long v68 = *(void **)(v112 + 32);
  }
  id v86 = [v68 delegate];
  id v87 = v86;
  long long v88 = *(_DWORD **)(v112 + 32);
  int v89 = v88[244];
  if ((v89 & 8) != 0)
  {
    objc_msgSend(v86, "updateWindowVisibilityForSwitcherContentController:");
    long long v88 = *(_DWORD **)(v112 + 32);
    int v89 = v88[244];
  }
  if ((v89 & 4) != 0)
  {
    objc_msgSend(v87, "updateUserInteractionEnabledForSwitcherContentController:");
    long long v88 = *(_DWORD **)(v112 + 32);
  }
  if ([v88 _controlsHomeScreenContents])
  {
    uint64_t v90 = *(void *)(v112 + 32);
    int v91 = *(_DWORD *)(v90 + 976);
    if ((v91 & 0x800) != 0)
    {
      [*(id *)(v90 + 1944) wallpaperScale];
      objc_msgSend(v87, "switcherContentController:setWallpaperScale:withAnimationMode:completion:", v90, v109, 0);
      uint64_t v90 = *(void *)(v112 + 32);
      int v91 = *(_DWORD *)(v90 + 976);
    }
    if ((v91 & 0x10) != 0)
    {
      [*(id *)(v90 + 1944) homeScreenScale];
      double v93 = v92;
      long long v94 = v111[2](v111, @"homeScreenScale");
      [v87 switcherContentController:v90 setHomeScreenScale:v109 withAnimationMode:v94 completion:v93];

      uint64_t v90 = *(void *)(v112 + 32);
      int v91 = *(_DWORD *)(v90 + 976);
    }
    if ((v91 & 0x20) != 0)
    {
      [*(id *)(v90 + 1944) homeScreenAlpha];
      double v96 = v95;
      uint64_t v97 = v111[2](v111, @"homeScreenAlpha");
      [v87 switcherContentController:v90 setHomeScreenAlpha:v109 withAnimationMode:v97 completion:v96];

      uint64_t v90 = *(void *)(v112 + 32);
      int v91 = *(_DWORD *)(v90 + 976);
    }
    if ((v91 & 0x40) != 0)
    {
      [*(id *)(v90 + 1944) homeScreenDimmingAlpha];
      double v99 = v98;
      long long v100 = v111[2](v111, @"homeScreenDimmingAlpha");
      [v87 switcherContentController:v90 setHomeScreenDimmingAlpha:v109 withAnimationMode:v100 completion:v99];

      uint64_t v90 = *(void *)(v112 + 32);
      int v91 = *(_DWORD *)(v90 + 976);
    }
    if ((v91 & 0x80) != 0)
    {
      [*(id *)(v90 + 1944) homeScreenBackdropBlurProgress];
      double v102 = v101;
      uint64_t v103 = v111[2](v111, @"homeScreenBackdropBlurProgress");
      [v87 switcherContentController:v90 setHomeScreenBackdropBlurProgress:v109 withAnimationMode:v103 completion:v102];

      uint64_t v90 = *(void *)(v112 + 32);
      int v91 = *(_DWORD *)(v90 + 976);
    }
    if ((v91 & 0x200) != 0)
    {
      if ([(id)v90 isChamoisWindowingUIEnabled]) {
        SBContinuousExposeHomeScreenBackdropMaterialRecipeName();
      }
      else {
      id v104 = SBHomeScreenBackdropMaterialRecipeName();
      }
      uint64_t v105 = *(void *)(v112 + 32);
      char v106 = v111[2](v111, @"homeScreenBackdropBlurMaterialRecipeName");
      [v87 switcherContentController:v105 setHomeScreenBackdropBlurMaterialRecipeName:v104 withAnimationMode:v109 completion:v106];
    }
  }
}

- (void)_updateSystemApertureShadowAssertion
{
  int v3 = [(SBSwitcherModifier *)self->_rootModifier systemApertureRequiresHeavyShadowForTransition];
  systemApertureShadowAssertiouint64_t n = self->_systemApertureShadowAssertion;
  if (v3)
  {
    if (systemApertureShadowAssertion) {
      return;
    }
    id v8 = [(id)SBApp systemApertureControllerForMainDisplay];
    double v5 = [v8 requireHeavyShadowAssertionForTransition];
    id v6 = self->_systemApertureShadowAssertion;
    self->_systemApertureShadowAssertiouint64_t n = v5;

    double v7 = (SAInvalidatable *)v8;
  }
  else
  {
    if (!systemApertureShadowAssertion) {
      return;
    }
    [(SAInvalidatable *)systemApertureShadowAssertion invalidateWithReason:@"No Modifier Requires Shadow"];
    double v7 = self->_systemApertureShadowAssertion;
    self->_systemApertureShadowAssertiouint64_t n = 0;
  }
}

- (void)_updateReopenClosedWindowsButtonWithMode:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  if (self->_reopenClosedWindowsButton)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __85__SBFluidSwitcherViewController__updateReopenClosedWindowsButtonWithMode_completion___block_invoke;
    v8[3] = &unk_1E6AFAA50;
    v8[4] = self;
    v8[5] = a3;
    [MEMORY[0x1E4FA5E48] perform:v8 finalCompletion:v6 options:0 delegate:self];
    [(SBFluidSwitcherViewController *)self _updateAppExposeAccessoryButtonsExtendedTouchRegions];
  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
  }
}

- (void)_updatePlusButtonStyleWithMode:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  if (self->_plusButton)
  {
    id v8 = [(SBSwitcherModifier *)self->_rootModifier animationAttributesForLayoutElement:self->_genericAccessoryLayoutElement];
    double v9 = [v8 opacitySettings];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__SBFluidSwitcherViewController__updatePlusButtonStyleWithMode_completion___block_invoke;
    v10[3] = &unk_1E6AF4AC0;
    void v10[4] = self;
    objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", v9, a3, v10, v7);
    [(SBFluidSwitcherViewController *)self _updateAppExposeAccessoryButtonsExtendedTouchRegions];
  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
  }
}

- (void)_updateSwitcherBackdropType
{
  int64_t v3 = [(SBSwitcherModifier *)self->_rootModifier switcherBackdropBlurType];
  if (v3 == 3)
  {
    if ([(SBAppSwitcherSettings *)self->_settings shouldSimplifyForOptions:16]) {
      int64_t v3 = 2;
    }
    else {
      int64_t v3 = 3;
    }
  }
  if (self->_currentSwitcherBackdropBlurType != v3)
  {
    self->_currentSwitcherBackdropBlurType = v3;
    fluidSwitcherAssertionReasouint64_t n = self->_fluidSwitcherAssertionReason;
    if (v3 == 1)
    {
      backdropView = self->_backdropView;
      [(SBHomeScreenBackdropViewBase *)backdropView endRequiringLiveBackdropViewForReason:fluidSwitcherAssertionReason];
    }
    else
    {
      id v6 = self->_backdropView;
      [(SBHomeScreenBackdropViewBase *)v6 beginRequiringLiveBackdropViewForReason:fluidSwitcherAssertionReason];
    }
  }
}

- (void)_updateHomeScreenContentRequirement
{
  if ([(SBFluidSwitcherViewController *)self _controlsHomeScreenContents])
  {
    int v3 = [(SBSwitcherModifier *)self->_rootModifier isHomeScreenContentRequired];
    if (self->_currentHomeScreenContentRequired != v3)
    {
      BOOL v4 = v3;
      double v5 = [(SBFluidSwitcherViewController *)self _homeScreenAppearanceController];
      id v6 = v5;
      fluidSwitcherAssertionReasouint64_t n = self->_fluidSwitcherAssertionReason;
      if (v4) {
        [v5 beginRequiringContentForReason:fluidSwitcherAssertionReason options:2];
      }
      else {
        [v5 endRequiringContentForReason:fluidSwitcherAssertionReason];
      }

      self->_currentHomeScreenContentRequired = v4;
    }
  }
}

- (void)_updateHomeScreenBackdropType
{
  if ([(SBFluidSwitcherViewController *)self _controlsHomeScreenContents])
  {
    int64_t v3 = [(SBSwitcherModifier *)self->_rootModifier homeScreenBackdropBlurType];
    if (v3 == 3)
    {
      if ([(SBAppSwitcherSettings *)self->_settings shouldSimplifyForOptions:16]) {
        int64_t v3 = 2;
      }
      else {
        int64_t v3 = 3;
      }
    }
    if (self->_currentHomeScreenBackdropBlurType != v3)
    {
      id v4 = [(SBFluidSwitcherViewController *)self delegate];
      if (*((unsigned char *)&self->_delegateRespondsTo + 1)) {
        [v4 switcherContentController:self setHomeScreenBackdropBlurType:v3];
      }
      self->_currentHomeScreenBackdropBlurType = v3;
      [(SBFluidSwitcherViewController *)self _updateTitleItemsLabelColor];
    }
  }
}

- (id)genericSwitcherAccessoryLayoutElement
{
  return self->_genericAccessoryLayoutElement;
}

- (void)_applyStyleToVisibleItemContainersWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __82__SBFluidSwitcherViewController__applyStyleToVisibleItemContainersWithCompletion___block_invoke;
  v3[3] = &unk_1E6AFA2F0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E4FA5E48], "perform:finalCompletion:options:delegate:", v3, a3, 0);
}

- (void)_updateScrollViewScrollEnabled
{
  uint64_t v3 = [(SBSwitcherModifier *)self->_rootModifier isScrollEnabled];
  [(SBAppSwitcherScrollView *)self->_scrollView setScrollEnabled:v3];
  [(SBFluidSwitcherViewController *)self _updateContentViewPassesTouchesThrough];
  if ((v3 & 1) == 0)
  {
    scrollView = self->_scrollView;
    [(SBAppSwitcherScrollView *)scrollView _stopScrollingAndZoomingAnimations];
  }
}

- (void)_updateContentViewPassesTouchesThrough
{
  if ([(SBSwitcherModifier *)self->_rootModifier isScrollEnabled]) {
    int v3 = [(SBSwitcherModifier *)self->_rootModifier shouldScrollViewBlockTouches];
  }
  else {
    int v3 = 0;
  }
  int v4 = [(SBSwitcherModifier *)self->_rootModifier wantsSwitcherDimmingView];
  if (v4) {
    int v4 = [(SBSwitcherModifier *)self->_rootModifier switcherDimmingViewBlocksTouches];
  }
  if ((v3 | v4)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [(SBSwitcherModifier *)self->_rootModifier switcherHitTestsAsOpaque] ^ 1;
  }
  [(SBFluidSwitcherContentView *)self->_contentView setPassesTouchesThrough:v5];
  id v6 = [(SBFluidSwitcherContentView *)self->_contentView layer];
  [v6 setHitTestsAsOpaque:v5 ^ 1];
}

- (void)_applyRootContentViewClippingAndBlurWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __84__SBFluidSwitcherViewController__applyRootContentViewClippingAndBlurWithCompletion___block_invoke;
  v3[3] = &unk_1E6AFA2F0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E4FA5E48], "perform:finalCompletion:options:delegate:", v3, a3, 0);
}

- (void)_updateWallpaperStyle
{
  if ([(SBFluidSwitcherViewController *)self _controlsWallpaper])
  {
    int v3 = [(SBSwitcherModifier *)self->_rootModifier isWallpaperRequiredForSwitcher];
    if (self->_currentWallpaperRequiredForSwitcher != v3)
    {
      BOOL v4 = v3;
      uint64_t v5 = [(SBFluidSwitcherViewController *)self wallpaperRequireAssertion];
      [v5 invalidate];

      if (v4)
      {
        id v6 = +[SBWallpaperController sharedInstance];
        double v7 = [v6 requireWallpaperWithReason:self->_fluidSwitcherAssertionReason];
        [(SBFluidSwitcherViewController *)self setWallpaperRequireAssertion:v7];
      }
      else
      {
        [(SBFluidSwitcherViewController *)self setWallpaperRequireAssertion:0];
      }
      self->_currentWallpaperRequiredForSwitcher = v4;
    }
    uint64_t v8 = [(SBSwitcherModifier *)self->_rootModifier wallpaperStyle];
    if (self->_currentWallpaperStyle != v8)
    {
      int64_t v9 = v8;
      id v10 = [(SBFluidSwitcherViewController *)self delegate];
      if ((*((unsigned char *)&self->_delegateRespondsTo + 1) & 0x10) != 0)
      {
        id v11 = v10;
        [v10 switcherContentController:self setWallpaperStyle:v9];
        id v10 = v11;
      }
      self->_currentWallpaperStyle = v9;
    }
  }
}

- (void)setWallpaperRequireAssertion:(id)a3
{
}

- (BSInvalidatable)wallpaperRequireAssertion
{
  return self->_wallpaperRequireAssertion;
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_17(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMeshTransform:*(void *)(a1 + 40)];
}

uint64_t __72__SBFluidSwitcherViewController__appLayoutWantsToBeKeptInViewHierarchy___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isOrContainsAppLayout:a2];
}

- (int64_t)displayOrdinal
{
  id v2 = [(SBFluidSwitcherLayoutContext *)self->_layoutContext layoutState];
  int64_t v3 = [v2 displayOrdinal];

  return v3;
}

void __52__SBFluidSwitcherViewController__updateVisibleItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_appLayoutWantsToBeKeptInViewHierarchy:")) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (BOOL)homeScreenHasOpenFolder
{
  id v2 = [(SBFluidSwitcherViewController *)self _iconManager];
  char v3 = [v2 hasOpenFolder];

  return v3;
}

- (id)_iconManager
{
  id v2 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  char v3 = [v2 homeScreenController];
  BOOL v4 = [v3 iconManager];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    double v7 = +[SBIconController sharedInstance];
    id v6 = [v7 iconManager];
  }
  return v6;
}

- (id)activatingDisplayItemForAppLayout:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBFluidSwitcherViewController *)self layoutContext];
  id v6 = [v5 activeTransitionContext];

  double v7 = [v6 layoutState];
  uint64_t v8 = [v7 appLayout];
  int v9 = [v8 isEqual:v4];

  if (v9)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v10 = [v6 entities];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v39;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v38 + 1) + 8 * v14);
        double v16 = [v15 objectForActivationSetting:46];
        int v17 = [v15 BOOLForActivationSetting:54];
        if (v17) {
          int v17 = [v15 BOOLForActivationSetting:27];
        }
        if (v16 || v17 != 0) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
          if (v12) {
            goto LABEL_4;
          }
          goto LABEL_16;
        }
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v19 = [v4 allItems];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v31 = v10;
        uint64_t v32 = v6;
        id v33 = v4;
        uint64_t v22 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v35 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v24 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            id v25 = [v15 applicationSceneEntity];
            double v26 = [v25 sceneHandle];
            double v27 = [v26 sceneIdentifier];

            CGRect v28 = [v24 uniqueIdentifier];
            LODWORD(v25) = [v27 isEqualToString:v28];

            if (v25)
            {
              id v29 = v24;

              goto LABEL_27;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v21) {
            continue;
          }
          break;
        }
        id v29 = 0;
LABEL_27:
        id v6 = v32;
        id v4 = v33;
        id v10 = v31;
      }
      else
      {
        id v29 = 0;
      }

      if (v29) {
        goto LABEL_31;
      }
    }
    else
    {
LABEL_16:
    }
  }
  id v29 = [v4 itemForLayoutRole:1];
LABEL_31:

  return v29;
}

- (id)_iconViewForDisplayItem:(id)a3 isVisible:(BOOL *)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  double v7 = [v6 homeScreenController];
  uint64_t v8 = [v7 iconManager];
  int v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    uint64_t v11 = +[SBIconController sharedInstance];
    id v10 = [v11 iconManager];
  }
  uint64_t v12 = [(SBFluidSwitcherViewController *)self layoutContext];
  uint64_t v13 = [v12 activeTransitionContext];
  uint64_t v14 = [v5 bundleIdentifier];
  double v15 = [(SBFluidSwitcherViewController *)self _workspaceEntityForBundleIdentifier:v14 inTransitionContext:v13];
  if (![v5 type])
  {
    uint64_t v20 = [(SBFluidSwitcherViewController *)self _iconForWorkspaceEntity:v15];
    if (v20) {
      goto LABEL_11;
    }
LABEL_8:
    id v21 = 0;
    goto LABEL_48;
  }
  uint64_t v16 = [v5 type];
  int v17 = [v10 iconModel];
  id v18 = v17;
  if (v16 == 5)
  {
    uint64_t v19 = [v5 webClipIdentifier];
    uint64_t v20 = [v18 leafIconForIdentifier:v19];
  }
  else
  {
    uint64_t v20 = [v17 leafIconForIdentifier:v14];
  }

  if (!v20) {
    goto LABEL_8;
  }
LABEL_11:
  double v58 = v12;
  double v59 = v20;
  id v55 = v5;
  uint64_t v56 = v13;
  double v53 = v14;
  if (v15)
  {
    if ([v15 isApplicationSceneEntity])
    {
      uint64_t v22 = [v15 sceneHandle];
      uint64_t v23 = [v22 lastActivationSource];
    }
    else
    {
      uint64_t v23 = 0;
    }
    if ([v15 BOOLForActivationSetting:26]) {
      char IsVisible = 1;
    }
    else {
      char IsVisible = SBSpotlightIsVisible();
    }
    char v26 = [v15 BOOLForActivationSetting:28];
    char v24 = (IsVisible | v26 | [v15 BOOLForActivationSetting:27]) ^ 1;
  }
  else
  {
    uint64_t v23 = 0;
    char v24 = 1;
  }
  [(SBFluidSwitcherViewController *)self _iconLocationsForActivationSource:v23];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = [v27 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v61;
    while (2)
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v61 != v30) {
          objc_enumerationMutation(v27);
        }
        if (SBIconLocationGroupContainsLocation())
        {

          goto LABEL_30;
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v60 objects:v64 count:16];
      if (v29) {
        continue;
      }
      break;
    }
  }

  uint64_t v32 = [v58 layoutState];
  [v32 unlockedEnvironmentMode];

LABEL_30:
  id v33 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  id v54 = v10;
  if (([v33 isMainDisplayWindowScene] & 1) != 0
    || [v33 isContinuityDisplayWindowScene])
  {
    long long v34 = SBIconViewQueryingBestIconViewForIcon();
  }
  else
  {
    long long v35 = [v33 floatingDockController];
    long long v36 = [v35 floatingDockViewController];
    if ([v36 isPresentingLibrary])
    {
      long long v37 = [v33 modalLibraryController];
      long long v38 = [v37 libraryViewController];
      long long v34 = [v38 firstIconViewForIcon:v59];
    }
    else
    {
      long long v34 = [v35 firstIconViewForIcon:v59];
    }
  }
  long long v39 = [v34 window];
  if (v34) {
    char v40 = v39 != 0;
  }
  else {
    char v40 = v24;
  }
  long long v41 = [v33 floatingDockController];
  double v42 = [v41 viewController];
  double v43 = [v42 view];
  uint64_t v44 = [v43 window];

  if (v39 == v44)
  {
    uint64_t v45 = [v58 transitioningFromLayoutState];
    uint64_t v46 = [v45 interfaceOrientation];

    double v47 = [v58 transitioningToLayoutState];
    uint64_t v48 = [v47 interfaceOrientation];

    if (v46 != v48) {
      char v40 = 0;
    }
  }
  double v49 = [v34 icon];
  double v50 = [v49 applicationBundleID];

  if (v50)
  {
    double v51 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v50];
    v40 &= ~[v51 isHidden];
  }
  id v10 = v54;
  if (a4) {
    *a4 = v40;
  }
  id v21 = v34;

  id v5 = v55;
  uint64_t v13 = v56;
  uint64_t v12 = v58;
  uint64_t v20 = v59;
  uint64_t v14 = v53;
LABEL_48:

  return v21;
}

- (BOOL)_appLayoutWantsToBeKeptInViewHierarchy:(id)a3
{
  id v4 = a3;
  if (([v4 type] & 0xFFFFFFFFFFFFFFFELL) == 2
    && ([(SBFluidSwitcherViewController *)self layoutContext],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 layoutState],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 unlockedEnvironmentMode],
        v6,
        v5,
        v7 == 2))
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v9 = [(SBFluidSwitcherViewController *)self layoutContext];
    id v10 = [(id)v9 layoutState];
    uint64_t v11 = [v10 appLayout];
    char v12 = [v11 isOrContainsAppLayout:v4];

    uint64_t v13 = [(NSMutableDictionary *)self->_liveContentOverlays allKeys];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__SBFluidSwitcherViewController__appLayoutWantsToBeKeptInViewHierarchy___block_invoke;
    v15[3] = &unk_1E6AF4B60;
    id v16 = v4;
    LOBYTE(v9) = objc_msgSend(v13, "bs_containsObjectPassingTest:", v15);

    char v8 = v12 | v9;
  }

  return v8;
}

- (SBFluidSwitcherLayoutContext)layoutContext
{
  return self->_layoutContext;
}

- (id)_workspaceEntityForBundleIdentifier:(id)a3 inTransitionContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 applicationSceneEntityForBundleID:v5];
  if (!v7)
  {
    uint64_t v7 = [v6 previousApplicationSceneEntityForBundleID:v5];
    if (!v7)
    {
      char v8 = +[SBApplicationController sharedInstance];
      uint64_t v9 = [v8 applicationWithBundleIdentifier:v5];

      uint64_t v7 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:v9];
      if (!v7)
      {
        uint64_t v7 = [v6 appClipPlaceholderEntityForBundleID:v5];
        if (!v7)
        {
          uint64_t v7 = [v6 previousAppClipPlaceholderEntityForBundleID:v5];
        }
      }
    }
  }

  return v7;
}

- (id)_iconLocationsForActivationSource:(int64_t)a3
{
  char v3 = 0;
  v18[1] = *MEMORY[0x1E4F143B8];
  if (a3 <= 37)
  {
    if (a3 == 1)
    {
      uint64_t v6 = *MEMORY[0x1E4FA6698];
      v9[0] = *MEMORY[0x1E4FA66D0];
      v9[1] = v6;
      v9[2] = *MEMORY[0x1E4FA6688];
      id v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = (__CFString **)v9;
      uint64_t v7 = 3;
    }
    else
    {
      if (a3 == 24)
      {
        uint64_t v16 = *MEMORY[0x1E4FA6690];
        id v4 = (void *)MEMORY[0x1E4F1C978];
        id v5 = (__CFString **)&v16;
      }
      else
      {
        if (a3 != 25) {
          goto LABEL_18;
        }
        int v17 = @"SBIconLocationFloatingDockSuggestions";
        id v4 = (void *)MEMORY[0x1E4F1C978];
        id v5 = &v17;
      }
LABEL_16:
      uint64_t v7 = 1;
    }
    char v3 = [v4 arrayWithObjects:v5 count:v7];
  }
  else
  {
    switch(a3)
    {
      case '&':
        uint64_t v12 = *MEMORY[0x1E4FA6650];
        id v4 = (void *)MEMORY[0x1E4F1C978];
        id v5 = (__CFString **)&v12;
        goto LABEL_16;
      case '\'':
        uint64_t v11 = *MEMORY[0x1E4FA6680];
        id v4 = (void *)MEMORY[0x1E4F1C978];
        id v5 = (__CFString **)&v11;
        goto LABEL_16;
      case '(':
        uint64_t v13 = *MEMORY[0x1E4FA6660];
        id v4 = (void *)MEMORY[0x1E4F1C978];
        id v5 = (__CFString **)&v13;
        goto LABEL_16;
      case ')':
        uint64_t v14 = *MEMORY[0x1E4FA6668];
        id v4 = (void *)MEMORY[0x1E4F1C978];
        id v5 = (__CFString **)&v14;
        goto LABEL_16;
      case '*':
        uint64_t v15 = *MEMORY[0x1E4FA6670];
        id v4 = (void *)MEMORY[0x1E4F1C978];
        id v5 = (__CFString **)&v15;
        goto LABEL_16;
      case '.':
        uint64_t v10 = *MEMORY[0x1E4FA66D8];
        id v4 = (void *)MEMORY[0x1E4F1C978];
        id v5 = (__CFString **)&v10;
        goto LABEL_16;
      case '/':
        v18[0] = *MEMORY[0x1E4F4B780];
        id v4 = (void *)MEMORY[0x1E4F1C978];
        id v5 = (__CFString **)v18;
        goto LABEL_16;
      default:
        break;
    }
  }
LABEL_18:
  return v3;
}

- (id)_iconForWorkspaceEntity:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  uint64_t v6 = [v5 homeScreenController];
  uint64_t v7 = [v6 iconManager];
  char v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = +[SBIconController sharedInstance];
    id v9 = [v10 iconManager];
  }
  uint64_t v11 = [v9 iconModel];
  uint64_t v12 = [v4 objectForActivationSetting:46];
  if (!v12)
  {
    if (![v4 isDeviceApplicationSceneEntity]) {
      goto LABEL_30;
    }
    uint64_t v13 = [v4 deviceApplicationSceneEntity];
    uint64_t v14 = [v13 sceneHandle];

    uint64_t v12 = [v14 lastActivationIconLeafIdentifier];

    if (!v12)
    {
LABEL_30:
      if ([v4 isApplicationSceneEntity])
      {
        uint64_t v15 = [v4 applicationSceneEntity];
        uint64_t v16 = [v15 application];
        int v17 = [v16 info];
        int v18 = [v17 isAppClip];

        if (!v18)
        {
          uint64_t v12 = [v16 iconIdentifier];
          goto LABEL_14;
        }
        uint64_t v19 = [v16 bundleIdentifier];
        uint64_t v20 = [v15 sceneHandle];
        id v21 = [v20 sceneIdentifier];
        uint64_t v12 = [(SBFluidSwitcherViewController *)self _webClipIdentifierForAppClipBundleIdentifier:v19 sceneIdentifier:v21];

LABEL_12:
LABEL_14:

        goto LABEL_16;
      }
      if ([v4 isAppClipPlaceholderEntity])
      {
        uint64_t v15 = [v4 appClipPlaceholderEntity];
        uint64_t v16 = [v15 bundleIdentifier];
        uint64_t v19 = [v15 futureSceneIdentifier];
        uint64_t v12 = [(SBFluidSwitcherViewController *)self _webClipIdentifierForAppClipBundleIdentifier:v16 sceneIdentifier:v19];
        goto LABEL_12;
      }
      uint64_t v12 = 0;
    }
  }
LABEL_16:
  uint64_t v22 = [v11 leafIconForIdentifier:v12];
  uint64_t v23 = +[SBAppSwitcherDomain rootSettings];
  char v24 = [v23 animationSettings];

  id v25 = [v22 gridSizeClass];
  if (!v25) {
    goto LABEL_25;
  }
  char v26 = [(id)objc_opt_class() _mediumGridSizeClassesForIconZoom];
  if ([v26 containsGridSizeClass:v25])
  {
    int v27 = [v24 allowIconZoomFromMediumWidgets];

    if (!v27)
    {
LABEL_23:
      uint64_t v28 = v22;
      uint64_t v22 = 0;
      goto LABEL_24;
    }
  }
  else
  {
  }
  uint64_t v28 = [(id)objc_opt_class() _largeGridSizeClassesForIconZoom];
  if ([v28 containsGridSizeClass:v25])
  {
    char v29 = [v24 allowIconZoomFromLargeWidgets];

    if (v29) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }
LABEL_24:

LABEL_25:
  return v22;
}

+ (id)_mediumGridSizeClassesForIconZoom
{
  if (_mediumGridSizeClassesForIconZoom_onceToken != -1) {
    dispatch_once(&_mediumGridSizeClassesForIconZoom_onceToken, &__block_literal_global_222);
  }
  id v2 = (void *)_mediumGridSizeClassesForIconZoom_gridSizeClasses;
  return v2;
}

+ (id)_largeGridSizeClassesForIconZoom
{
  if (_largeGridSizeClassesForIconZoom_onceToken != -1) {
    dispatch_once(&_largeGridSizeClassesForIconZoom_onceToken, &__block_literal_global_12_1);
  }
  id v2 = (void *)_largeGridSizeClassesForIconZoom_gridSizeClasses;
  return v2;
}

- (void)_updateVisibleItems
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  char v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [MEMORY[0x1E4F1CA80] set];
  id v5 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v6 = [(SBSwitcherModifier *)self->_rootModifier visibleAppLayouts];
  uint64_t v7 = [v5 setWithSet:v6];

  char v8 = [(SBFluidSwitcherViewController *)self appLayouts];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __52__SBFluidSwitcherViewController__updateVisibleItems__block_invoke;
  v65[3] = &unk_1E6AFA1E0;
  void v65[4] = self;
  id v9 = v7;
  id v66 = v9;
  [v8 enumerateObjectsUsingBlock:v65];

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v62 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        if (([(NSCountedSet *)self->_requestedHiddenAppLayouts containsObject:v15] & 1) == 0)
        {
          uint64_t v16 = [v15 leafAppLayouts];
          [v3 addObjectsFromArray:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v12);
  }

  int v17 = [(SBFluidSwitcherLayoutContext *)self->_layoutContext activeTransitionContext];
  BOOL v18 = v17 != 0;

  visibleItemContainers = self->_visibleItemContainers;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __52__SBFluidSwitcherViewController__updateVisibleItems__block_invoke_2;
  v56[3] = &unk_1E6AFA630;
  id v20 = v3;
  id v57 = v20;
  double v58 = self;
  BOOL v60 = v18;
  id v39 = v4;
  id v59 = v39;
  [(NSMutableDictionary *)visibleItemContainers enumerateKeysAndObjectsUsingBlock:v56];
  [(NSMutableDictionary *)self->_visibleItemContainers allKeys];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [obj countByEnumeratingWithState:&v52 objects:v68 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v53 != v23) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v52 + 1) + 8 * j);
        char v26 = [(SBFluidSwitcherLayoutContext *)self->_layoutContext activeGesture];
        int v27 = [v26 selectedAppLayout];

        if (![(NSArray *)self->_cachedAdjustedLeafAppLayouts containsObject:v25]
          && ([v20 containsObject:v25] & 1) == 0
          && v27 != v25)
        {
          [v39 addObject:v25];
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v52 objects:v68 count:16];
    }
    while (v22);
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v40 = v39;
  uint64_t v28 = [v40 countByEnumeratingWithState:&v48 objects:v67 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v49 != v30) {
          objc_enumerationMutation(v40);
        }
        uint64_t v32 = *(void *)(*((void *)&v48 + 1) + 8 * k);
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __52__SBFluidSwitcherViewController__updateVisibleItems__block_invoke_5;
        v47[3] = &unk_1E6AF4B60;
        v47[4] = v32;
        id v33 = objc_msgSend(v20, "bs_firstObjectPassingTest:", v47);
        if (!v33
          || ([(NSMutableDictionary *)self->_visibleItemContainers objectForKey:v33],
              long long v34 = objc_claimAutoreleasedReturnValue(),
              v34,
              v34))
        {
          [(SBFluidSwitcherViewController *)self _removeVisibleItemContainerForAppLayout:v32];
        }
      }
      uint64_t v29 = [v40 countByEnumeratingWithState:&v48 objects:v67 count:16];
    }
    while (v29);
  }

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __52__SBFluidSwitcherViewController__updateVisibleItems__block_invoke_6;
  v42[3] = &unk_1E6AF59B8;
  id v35 = v20;
  id v43 = v35;
  uint64_t v44 = self;
  id v36 = v40;
  id v45 = v36;
  id v37 = obj;
  id v46 = v37;
  long long v38 = (void (**)(void))MEMORY[0x1D948C7A0](v42);
  if ([MEMORY[0x1E4F42FF0] _isInRetargetableAnimationBlock])
  {
    [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v38];
  }
  else if ([MEMORY[0x1E4F42FF0] _isInAnimationBlock])
  {
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v38];
  }
  else
  {
    v38[2](v38);
  }
  kdebug_trace();
}

- (void)_updateSlideOverTonguePresence
{
  int v3 = [(SBSwitcherModifier *)self->_rootModifier wantsSlideOverTongue];
  id v4 = [(SBFluidSwitcherLayoutContext *)self->_layoutContext activeTransitionContext];

  if (v3)
  {
    if (!self->_slideOverTongue)
    {
      id v5 = objc_alloc_init(SBSlideOverTongueView);
      slideOverTongue = self->_slideOverTongue;
      self->_slideOverTongue = v5;

      [(SBSlideOverTongueView *)self->_slideOverTongue setDelegate:self];
      [(SBFluidSwitcherContentView *)self->_contentView addSubview:self->_slideOverTongue];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __63__SBFluidSwitcherViewController__updateSlideOverTonguePresence__block_invoke;
      v13[3] = &unk_1E6AF4AC0;
      v13[4] = self;
      [(SBFluidSwitcherViewController *)self _performWithFixedUpdateMode:2 usingBlock:v13];
      uint64_t v7 = [[SBSwitcherAccessoryLayoutElement alloc] initWithType:4];
      slideOverTongueLayoutElement = self->_slideOverTongueLayoutElement;
      self->_slideOverTongueLayoutElement = v7;
    }
  }
  else
  {
    id v9 = self->_slideOverTongue;
    if (v9) {
      BOOL v10 = v4 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      [(SBSlideOverTongueView *)v9 removeFromSuperview];
      uint64_t v11 = self->_slideOverTongue;
      self->_slideOverTongue = 0;

      uint64_t v12 = self->_slideOverTongueLayoutElement;
      self->_slideOverTongueLayoutElement = 0;
    }
  }
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_14(uint64_t a1)
{
  [*(id *)(a1 + 32) setShouldUseWallpaperGradientTreatment:*(unsigned __int8 *)(a1 + 56)];
  id v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  return objc_msgSend(v2, "setWallpaperGradientAttributes:", v3, v4);
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_31(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) keyboardHeight];
  return objc_msgSend(v1, "setKeyboardHeight:");
}

- (double)keyboardHeight
{
  return CGRectGetHeight(self->_currentKeyboardFrame);
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentCornerRadii:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (NSMutableDictionary)visibleShelves
{
  return self->_visibleShelves;
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_13(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t __66__SBFluidSwitcherViewController__updateVisibleHomeAffordanceViews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 switcherLayoutElementType]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 1944) isHomeAffordanceSupportedForAppLayout:v3];
  }

  return v4;
}

- (SBFHomeGrabberSettings)homeGrabberSettings
{
  return self->_homeGrabberSettings;
}

uint64_t __76__SBFluidSwitcherViewController__applyStyleToAppLayout_roleMask_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 64)];
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) shelfFocusedDisplayItems];
  objc_msgSend(v2, "setDrawsFocusIndicator:", objc_msgSend(v3, "containsAnyItemFromSet:", v4));

  [*(id *)(a1 + 56) setAlpha:*(double *)(a1 + 64)];
  [*(id *)(a1 + 56) setBackgroundOpacity:*(double *)(a1 + 72)];
  [*(id *)(a1 + 56) setShadowOffset:*(double *)(a1 + 80)];
  [*(id *)(a1 + 56) setShadowAlpha:*(double *)(a1 + 88)];
  [*(id *)(a1 + 56) setShadowStyle:*(void *)(a1 + 96)];
  id v5 = *(void **)(a1 + 56);
  double v6 = 1.0;
  if (!*(unsigned char *)(a1 + 104)) {
    double v6 = 0.0;
  }
  return [v5 setResizeGrabberOpacity:v6];
}

- (id)shelfFocusedDisplayItems
{
  shelfFocusedDisplayItems = self->_shelfFocusedDisplayItems;
  if (shelfFocusedDisplayItems)
  {
    id v3 = shelfFocusedDisplayItems;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CAD0] set];
  }
  return v3;
}

void __76__SBFluidSwitcherViewController__applyStyleToAppLayout_roleMask_completion___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 1880) objectForKey:*(void *)(a1 + 40)];
  if (v5)
  {
    [*(id *)(a1 + 32) _applyStyleToLiveContentOverlay:v5 forItemContainer:*(void *)(a1 + 48) atIndex:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) _applyTouchBehaviorToLiveContentOverlay:v5 forAppLayout:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 48) setContentViewBlocksTouches:*(unsigned char *)(a1 + 152) == 0];
  id v2 = [*(id *)(a1 + 48) contentView];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 48) contentView];
    [v4 setShouldUseBrightMaterial:*(unsigned __int8 *)(a1 + 153)];
  }
  [*(id *)(a1 + 48) setAlpha:*(double *)(a1 + 64)];
  [*(id *)(a1 + 48) setShadowAlpha:*(double *)(a1 + 72)];
  [*(id *)(a1 + 48) setShadowOffset:*(double *)(a1 + 80)];
  [*(id *)(a1 + 48) setDimmingAlpha:*(double *)(a1 + 88)];
  [*(id *)(a1 + 48) setTintStyle:*(void *)(a1 + 96)];
  [*(id *)(a1 + 48) setLighteningAlpha:*(double *)(a1 + 104)];
  [*(id *)(a1 + 48) setShouldUseBackgroundWallpaperTreatment:*(unsigned __int8 *)(a1 + 154)];
  [*(id *)(a1 + 48) setWallpaperOverlayAlpha:*(double *)(a1 + 112)];
  [*(id *)(a1 + 48) setPointerInteractionEnabled:*(unsigned __int8 *)(a1 + 155)];
  [*(id *)(a1 + 48) setPointerInteractionHitTestPadding:*(double *)(a1 + 120)];
  [*(id *)(a1 + 48) setShadowStyle:*(void *)(a1 + 128)];
  [*(id *)(a1 + 48) setAllowedTouchResizeCorners:*(void *)(a1 + 136)];
  [*(id *)(a1 + 48) setResizingAllowed:*(unsigned __int8 *)(a1 + 156)];
  [*(id *)(a1 + 48) setOccludedInContinuousExposeStage:*(void *)(a1 + 144) != 2];
}

- (void)_applyTouchBehaviorToLiveContentOverlay:(id)a3 forAppLayout:(id)a4
{
  leafAppLayoutsToAdjustedAppLayouts = self->_leafAppLayoutsToAdjustedAppLayouts;
  id v7 = a4;
  id v8 = a3;
  id v10 = [(NSDictionary *)leafAppLayoutsToAdjustedAppLayouts objectForKey:v7];
  id v9 = [v7 itemForLayoutRole:1];

  objc_msgSend(v8, "setTouchBehavior:", -[SBSwitcherModifier touchBehaviorForLayoutRole:inAppLayout:](self->_rootModifier, "touchBehaviorForLayoutRole:inAppLayout:", objc_msgSend(v10, "layoutRoleForItem:", v9), v10));
}

- (int64_t)_bestSupportedHomeAffordanceOrientationForOrientation:(int64_t)a3 inAppLayout:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v6 = objc_msgSend(a4, "leafAppLayouts", 0);
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
        uint64_t v11 = [(NSMutableDictionary *)self->_liveContentOverlays objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = [v11 bestHomeAffordanceOrientationForOrientation:a3];
          if (v12 != a3)
          {
            int64_t v13 = v12;

            a3 = v13;
            goto LABEL_12;
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
LABEL_12:

  return a3;
}

- (BOOL)homeScreenHasWidgetCenterOrLibraryOpen
{
  char v3 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  uint64_t v4 = [v3 homeScreenController];
  id v5 = [(SBFluidSwitcherViewController *)self _iconManager];
  if (!v4)
  {
    uint64_t v8 = +[SBIconController sharedInstance];
    char v9 = [v8 isModalAppLibrarySupported];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    char v7 = [v5 isMainDisplayLibraryViewVisible];
    goto LABEL_6;
  }
  if (![v4 isModalAppLibrarySupported]) {
    goto LABEL_5;
  }
LABEL_3:
  double v6 = [v3 modalLibraryController];
  char v7 = [v6 isPresentingLibrary];

LABEL_6:
  char v10 = [v5 isOverlayTodayViewVisible] | v7;

  return v10;
}

- (void)_updateFloatingDockBehaviorAssertion
{
  if (+[SBFloatingDockController isFloatingDockSupported])
  {
    if ([(SBSwitcherModifier *)self->_rootModifier wantsDockBehaviorAssertion]&& ![(SBFluidSwitcherViewController *)self _shouldInterruptPresentationAndDismiss])
    {
      uint64_t v4 = [(SBSwitcherModifier *)self->_rootModifier dockUpdateMode];
      id v5 = [(SBFluidSwitcherViewController *)self switcherFloatingDockBehaviorAssertion];

      if (!v5)
      {
        [(SBSwitcherModifier *)self->_rootModifier dockProgress];
        double v7 = v6;
        uint64_t v8 = [SBFloatingDockBehaviorAssertion alloc];
        char v9 = [(SBFluidSwitcherViewController *)self _floatingDockController];
        char v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v10);
        uint64_t v12 = [(SBFloatingDockBehaviorAssertion *)v8 initWithFloatingDockController:v9 visibleProgress:v4 > 2 animated:0 gesturePossible:9 atLevel:v11 reason:0 withCompletion:v7];
        [(SBFluidSwitcherViewController *)self setSwitcherFloatingDockBehaviorAssertion:v12];
      }
      [(SBSwitcherModifier *)self->_rootModifier dockProgress];
      double v14 = v13;
      id v15 = [(SBFluidSwitcherViewController *)self switcherFloatingDockBehaviorAssertion];
      [v15 modifyProgress:v4 == 5 interactive:0 completion:v14];
    }
    else
    {
      char v3 = [(SBFluidSwitcherViewController *)self switcherFloatingDockBehaviorAssertion];
      [v3 invalidate];

      [(SBFluidSwitcherViewController *)self setSwitcherFloatingDockBehaviorAssertion:0];
    }
  }
}

- (void)_configureApplicationAndTransientOverlayDockBehaviorAssertionsForContext:(id)a3
{
  id v4 = a3;
  if (+[SBFloatingDockController isFloatingDockSupported])
  {
    id v5 = [(SBFluidSwitcherViewController *)self _floatingDockController];
    int v6 = [(SBSwitcherModifier *)self->_rootModifier shouldConfigureInAppDockHiddenAssertion];
    double v7 = [(SBFluidSwitcherViewController *)self inAppFloatingDockBehaviorAssertion];

    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      uint64_t v11 = [[SBFloatingDockBehaviorAssertion alloc] initWithFloatingDockController:v5 visibleProgress:1 animated:1 gesturePossible:9 atLevel:@"in app" reason:0 withCompletion:0.0];
      [(SBFluidSwitcherViewController *)self setInAppFloatingDockBehaviorAssertion:v11];
    }
    else
    {
      if (v7) {
        char v9 = v6;
      }
      else {
        char v9 = 1;
      }
      if ((v9 & 1) == 0)
      {
        char v10 = [(SBFluidSwitcherViewController *)self inAppFloatingDockBehaviorAssertion];
        [v10 invalidate];

        [(SBFluidSwitcherViewController *)self setInAppFloatingDockBehaviorAssertion:0];
      }
    }
    uint64_t v12 = [v4 request];
    double v13 = [v12 transientOverlayContext];

    double v14 = [v13 transientOverlay];
    id v15 = [(SBFluidSwitcherViewController *)self _appLayoutForWorkspaceTransientOverlay:v14];
    if (v15 && ![v13 transitionType]
      || ([(SBFluidSwitcherViewController *)self _activeTransientOverlayPresentedAppLayout], long long v16 = objc_claimAutoreleasedReturnValue(), v16, v16))
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __106__SBFluidSwitcherViewController__configureApplicationAndTransientOverlayDockBehaviorAssertionsForContext___block_invoke;
      v28[3] = &unk_1E6AF5290;
      v28[4] = self;
      long long v17 = v5;
      uint64_t v29 = v17;
      uint64_t v18 = MEMORY[0x1D948C7A0](v28);
      uint64_t v19 = (void *)v18;
      if (self->_transientOverlayFloatingDockBehaviorAssertion)
      {
        (*(void (**)(uint64_t))(v18 + 16))(v18);
      }
      else
      {
        uint64_t v22 = [SBFloatingDockBehaviorAssertion alloc];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __106__SBFluidSwitcherViewController__configureApplicationAndTransientOverlayDockBehaviorAssertionsForContext___block_invoke_2;
        v25[3] = &unk_1E6AFA2A0;
        v25[4] = self;
        id v26 = v4;
        id v27 = v19;
        uint64_t v23 = [(SBFloatingDockBehaviorAssertion *)v22 initWithFloatingDockController:v17 visibleProgress:1 animated:1 gesturePossible:6 atLevel:@"transient overlay" reason:v25 withCompletion:0.0];
        transientOverlayFloatingDockBehaviorAssertiouint64_t n = self->_transientOverlayFloatingDockBehaviorAssertion;
        self->_transientOverlayFloatingDockBehaviorAssertiouint64_t n = v23;
      }
      transientOverlayFloatingDockWindowLevelAssertiouint64_t n = v29;
    }
    else
    {
      [(SBFloatingDockBehaviorAssertion *)self->_transientOverlayFloatingDockBehaviorAssertion invalidate];
      uint64_t v20 = self->_transientOverlayFloatingDockBehaviorAssertion;
      self->_transientOverlayFloatingDockBehaviorAssertiouint64_t n = 0;

      [(SBFloatingDockWindowLevelAssertion *)self->_transientOverlayFloatingDockWindowLevelAssertion invalidate];
      transientOverlayFloatingDockWindowLevelAssertiouint64_t n = self->_transientOverlayFloatingDockWindowLevelAssertion;
      self->_transientOverlayFloatingDockWindowLevelAssertiouint64_t n = 0;
    }
  }
}

- (void)_applyOcclusionStateToLiveContentOverlay:(id)a3 forLayoutRole:(int64_t)a4 inAppLayout:(id)a5
{
  rootModifier = self->_rootModifier;
  id v8 = a3;
  objc_msgSend(v8, "setOccluded:", -[SBSwitcherModifier isLayoutRoleOccluded:inAppLayout:](rootModifier, "isLayoutRoleOccluded:inAppLayout:", a4, a5));
}

- (BOOL)_shouldLogSwitcherModifierEvent:(id)a3
{
  id v3 = a3;
  if (![v3 isGestureEvent])
  {
    if ([v3 isTransitionEvent])
    {
      char IsZero = [v3 isAnimated];
    }
    else
    {
      if ([v3 type] != 12)
      {
        if ([v3 type] == 19 || objc_msgSend(v3, "type") == 32)
        {
          BOOL v5 = 0;
          goto LABEL_16;
        }
        BOOL v4 = [v3 type] == 28;
        goto LABEL_3;
      }
      [v3 progress];
      if (BSFloatGreaterThanOrEqualToFloat())
      {
        BOOL v5 = 1;
        goto LABEL_16;
      }
      char IsZero = BSFloatIsZero();
    }
    BOOL v5 = IsZero;
    goto LABEL_16;
  }
  BOOL v4 = [v3 phase] == 2;
LABEL_3:
  BOOL v5 = !v4;
LABEL_16:

  return v5;
}

- (void)_performWithFixedUpdateMode:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  double v7 = [[SBFixedLayoutModeSwitcherModifier alloc] initWithUpdateMode:a3];
  rootModifier = self->_rootModifier;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__SBFluidSwitcherViewController__performWithFixedUpdateMode_usingBlock___block_invoke;
  v10[3] = &unk_1E6AF5300;
  id v11 = v6;
  id v9 = v6;
  [(SBChainableModifier *)rootModifier performTransactionWithTemporaryChildModifier:v7 usingBlock:v10];
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_26(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v2, "setAnchorPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));

  id v3 = *(void **)(a1 + 32);
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:");
  BOOL v4 = [*(id *)(a1 + 40) layer];
  objc_msgSend(v4, "setAnchorPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));

  BOOL v5 = *(void **)(a1 + 40);
  UIRectGetCenter();
  return objc_msgSend(v5, "setCenter:");
}

void __84__SBFluidSwitcherViewController__applyRootContentViewClippingAndBlurWithCompletion___block_invoke(uint64_t a1, void (**a2)(id, __CFString *))
{
  id v3 = *(void **)(a1 + 32);
  BOOL v5 = a2 + 2;
  BOOL v4 = (void (*)(void))a2[2];
  id v6 = a2;
  double v7 = v4();
  [v3 _applyRootContentViewClippingWithCompletion:v7];

  id v8 = *(void **)(a1 + 32);
  (*v5)(v6, @"content-view-blur-radius");
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v8 _applyRootContentViewBlurRadiusWithCompletion:v9];
}

- (void)_updateVisibleHomeAffordanceViews
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBFluidSwitcherViewController *)self _spacesWithVisibleHomeAffordances];
  BOOL v4 = [(SBSwitcherModifier *)self->_rootModifier visibleHomeAffordanceLayoutElements];
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __66__SBFluidSwitcherViewController__updateVisibleHomeAffordanceViews__block_invoke;
  v92[3] = &unk_1E6AFA720;
  v92[4] = self;
  BOOL v5 = objc_msgSend(v4, "bs_filter:", v92);

  id v6 = (void *)[v3 mutableCopy];
  [v6 minusSet:v5];
  long long v68 = v5;
  uint64_t v72 = (void *)[v5 mutableCopy];
  [v72 minusSet:v3];
  long long v69 = v3;
  uint64_t v70 = (void *)[v3 mutableCopy];
  [v70 minusSet:v6];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v88 objects:v102 count:16];
  id v8 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v89 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v88 + 1) + 8 * i);
        if (![v12 switcherLayoutElementType])
        {
          id v13 = v12;
          double v14 = [*(id *)((char *)&self->super.super.super.isa + v8[24]) objectForKey:v13];
          if (v14)
          {
            id v15 = [(SBFluidSwitcherLayoutContext *)self->_layoutContext activeTransitionContext];

            if (v15)
            {
              long long v16 = [v14 homeGrabberView];
              long long v17 = [v16 grabberView];

              if (([v17 isHidden] & 1) == 0)
              {
                uint64_t v18 = [(SBFHomeGrabberSettings *)self->_homeGrabberSettings hideForHomeGestureOwnershipAnimationSettings];
                uint64_t v19 = [v18 BSAnimationSettings];

                [v17 setHidden:1 forReason:@"FluidSwitcherHomeGrabberHideReason" withAnimationSettings:v19];
              }

              id v8 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
            }
            else
            {
              [v14 setHomeGrabberView:0];
            }
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v88 objects:v102 count:16];
    }
    while (v9);
  }

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v20 = v72;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v84 objects:v101 count:16];
  long long v71 = v20;
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v85;
    double v24 = *MEMORY[0x1E4F1DB28];
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v73 = *(void *)v85;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v85 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v29 = *(void **)(*((void *)&v84 + 1) + 8 * j);
        if (![v29 switcherLayoutElementType])
        {
          id v30 = v29;
          uint64_t v31 = [*(id *)((char *)&self->super.super.super.isa + v8[24]) objectForKey:v30];
          if (v31)
          {
            if ([v30 environment] == 2)
            {
              uint64_t v32 = [(SBAppSwitcherSettings *)self->_settings floatingSwitcherSettings];
              id v33 = [v32 homeAffordanceSettings];
            }
            else
            {
              id v33 = 0;
            }
            long long v34 = -[SBHomeGrabberRotationView initWithFrame:settings:useRotationWrapperViews:]([SBHomeGrabberRotationView alloc], "initWithFrame:settings:useRotationWrapperViews:", v33, 0, v24, v25, v26, v27);
            [(SBHomeGrabberRotationView *)v34 setOrientation:[(SBFluidSwitcherViewController *)self _bestSupportedHomeAffordanceOrientationForOrientation:self->_contentOrientation inAppLayout:v30]];
            [(SBHomeGrabberRotationView *)v34 setUserInteractionEnabled:0];
            [v31 setHomeGrabberView:v34];
            id v35 = [(SBHomeGrabberRotationView *)v34 grabberView];
            [v35 setHidden:1 forReason:@"FluidSwitcherHomeGrabberHideReason" withAnimationSettings:0];

            id v36 = [(SBFHomeGrabberSettings *)self->_homeGrabberSettings unhideAnimationSettings];
            id v37 = [v36 BSAnimationSettings];

            long long v38 = [(SBHomeGrabberRotationView *)v34 grabberView];
            [v38 setHidden:0 forReason:@"FluidSwitcherHomeGrabberHideReason" withAnimationSettings:v37];

            id v8 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
            id v20 = v71;
            uint64_t v23 = v73;
          }
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v84 objects:v101 count:16];
    }
    while (v22);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v39 = v70;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v80 objects:v100 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v81;
    double v43 = *MEMORY[0x1E4F1DB28];
    double v44 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v45 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v46 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    id v74 = v39;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v81 != v42) {
          objc_enumerationMutation(v39);
        }
        long long v48 = *(void **)(*((void *)&v80 + 1) + 8 * k);
        if (![v48 switcherLayoutElementType])
        {
          id v49 = v48;
          uint64_t v50 = v8[24];
          long long v51 = [*(id *)((char *)&self->super.super.super.isa + v50) objectForKey:v49];
          if (v51)
          {
            if ([v49 environment] == 2)
            {
              long long v52 = [(SBAppSwitcherSettings *)self->_settings floatingSwitcherSettings];
              long long v53 = [v52 homeAffordanceSettings];
            }
            else
            {
              long long v53 = 0;
            }
            uint64_t v56 = [v51 homeGrabberView];
            id v57 = [v56 grabberView];

            if (v57)
            {
              if ([v57 isHidden])
              {
                double v58 = [(SBFHomeGrabberSettings *)self->_homeGrabberSettings unhideAnimationSettings];
                id v59 = [v58 BSAnimationSettings];

                [v57 setHidden:0 forReason:@"FluidSwitcherHomeGrabberHideReason" withAnimationSettings:v59];
                goto LABEL_46;
              }
            }
            else
            {
              id v59 = -[SBHomeGrabberRotationView initWithFrame:settings:useRotationWrapperViews:]([SBHomeGrabberRotationView alloc], "initWithFrame:settings:useRotationWrapperViews:", v53, 0, v43, v44, v45, v46);
              [(SBHomeGrabberRotationView *)v59 setUserInteractionEnabled:0];
              [v51 setHomeGrabberView:v59];
LABEL_46:

              id v8 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
            }

            id v39 = v74;
          }
          else
          {
            long long v53 = SBLogAppSwitcher();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              debugName = self->_debugName;
              uint64_t v55 = [*(id *)((char *)&self->super.super.super.isa + v50) count];
              *(_DWORD *)buf = 138543874;
              double v95 = debugName;
              id v39 = v74;
              __int16 v96 = 2114;
              id v97 = v49;
              __int16 v98 = 2048;
              uint64_t v99 = v55;
              _os_log_error_impl(&dword_1D85BA000, v53, OS_LOG_TYPE_ERROR, "[%{public}@] Didn't find overlayAccessoryView for home affordance to leave (layoutElement: %{public}@) in _visibleOverlayAccessoryViews (count=%lu)", buf, 0x20u);
            }
          }

          continue;
        }
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v80 objects:v100 count:16];
    }
    while (v41);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v60 = v68;
  uint64_t v61 = [v60 countByEnumeratingWithState:&v76 objects:v93 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v77;
    do
    {
      for (uint64_t m = 0; m != v62; ++m)
      {
        if (*(void *)v77 != v63) {
          objc_enumerationMutation(v60);
        }
        uint64_t v65 = *(void **)(*((void *)&v76 + 1) + 8 * m);
        if (![v65 switcherLayoutElementType]) {
          [(SBFluidSwitcherViewController *)self _updateEdgeProtectAndAutoHideForHomeAffordancesInAppLayout:v65 withResetDelay:0.0 unhideDelay:0.0];
        }
      }
      uint64_t v62 = [v60 countByEnumeratingWithState:&v76 objects:v93 count:16];
    }
    while (v62);
  }

  [(SBFluidSwitcherViewController *)self _updateSuppressingHomeAffordanceBounce];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v67 = WeakRetained;
  if ((*((unsigned char *)&self->_delegateRespondsTo + 3) & 0x10) != 0) {
    [WeakRetained switcherContentControllerDidUpdateVisibleHomeAffordances:self];
  }
}

- (id)_spacesWithVisibleHomeAffordances
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v4 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews allKeys];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__SBFluidSwitcherViewController__spacesWithVisibleHomeAffordances__block_invoke;
  v8[3] = &unk_1E6AF4B60;
  v8[4] = self;
  BOOL v5 = objc_msgSend(v4, "bs_filter:", v8);
  id v6 = [v3 setWithArray:v5];

  return v6;
}

- (void)_dispatchEventAndHandleAction:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  kdebug_trace();
  if (!v5)
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 9265, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  BOOL hasAnyUnadjustedAppLayoutsInDuality = self->_hasAnyUnadjustedAppLayoutsInDuality;
  uint64_t v7 = qword_1EA8BF6F8;
  if (self->_hasAnyUnadjustedAppLayoutsInDuality) {
    qword_1EA8BF6F8 = (uint64_t)"note: dispatching switcher event with duality app layouts";
  }
  BOOL v8 = [(SBFluidSwitcherViewController *)self _shouldLogSwitcherModifierEvent:v5];
  if (v8)
  {
    uint64_t v9 = SBLogAppSwitcher();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      debugName = self->_debugName;
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = debugName;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] dispatch event:\n%{public}@", buf, 0x16u);
    }
  }
  id v11 = [(SBChainableModifier *)self->_rootModifier handleEvent:v5];
  if (v11) {
    BOOL v12 = v8;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    id v13 = SBLogAppSwitcher();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = self->_debugName;
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] handle response:\n%{public}@", buf, 0x16u);
    }
  }
  uint64_t v15 = objc_opt_class();
  id v16 = v5;
  if (v15)
  {
    if (objc_opt_isKindOfClass()) {
      long long v17 = v16;
    }
    else {
      long long v17 = 0;
    }
  }
  else
  {
    long long v17 = 0;
  }
  id v18 = v17;

  uint64_t v19 = [v18 zoomFromHardwareButtonPreludeTokenWrapper];

  LODWORD(v18) = [v19 isTokenAvailable];
  if (v18)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v32 = 0;
    char v30 = 0;
    if (!v11) {
      goto LABEL_26;
    }
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __63__SBFluidSwitcherViewController__dispatchEventAndHandleAction___block_invoke;
    v29[3] = &unk_1E6AFAAF0;
    v29[4] = buf;
    id v20 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v29);
    ((void (**)(void, void *, char *))v20)[2](v20, v11, &v30);
    if (!v30) {
      [v11 enumerateResponseTreeUsingBlock:v20];
    }

    if (!*(unsigned char *)(*(void *)&buf[8] + 24))
    {
LABEL_26:
      uint64_t v21 = SBLogCameraCaptureLaunchAnimation();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[SBFluidSwitcherViewController _dispatchEventAndHandleAction:](v21);
      }

      uint64_t v22 = objc_opt_class();
      id v23 = v16;
      if (v22)
      {
        if (objc_opt_isKindOfClass()) {
          double v24 = v23;
        }
        else {
          double v24 = 0;
        }
      }
      else
      {
        double v24 = 0;
      }
      id v25 = v24;

      double v26 = [v25 zoomFromHardwareButtonPreludeTokenWrapper];
      double v27 = [v26 consumeToken];

      [v27 cancel];
    }
    _Block_object_dispose(buf, 8);
  }
  [(SBFluidSwitcherViewController *)self _updateAnimatableProperties];
  if (v11) {
    [(SBFluidSwitcherViewController *)self _handleEventResponse:v11];
  }
  [(SBFluidSwitcherViewController *)self _updateImplicitModifierStackInvalidatables];
  if (hasAnyUnadjustedAppLayoutsInDuality) {
    qword_1EA8BF6F8 = v7;
  }
  kdebug_trace();
}

- (void)_updateImplicitModifierStackInvalidatables
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBFluidSwitcherViewController *)self viewIfLoaded];

  if (v3)
  {
    [(SBFluidSwitcherViewController *)self _updateAppStatusBarAndHomeGrabberVisibilityAnimated:1];
    [(SBFluidSwitcherViewController *)self _updateSpringBoardStatusBarVisibility];
    [(SBFluidSwitcherViewController *)self _updateAsynchronousSurfaceRetentionAssertion];
    [(SBFluidSwitcherViewController *)self _updateAsyncRenderingAndResizesHostedContext];
    [(SBFluidSwitcherViewController *)self _updateResignActiveAssertions];
    [(SBFluidSwitcherViewController *)self _updateKeyboardSuppressionAssertion];
    [(SBFluidSwitcherViewController *)self _updateFloatingDockBehaviorAssertion];
    [(SBFluidSwitcherViewController *)self _updateFloatingDockWindowLevelAssertion];
    [(SBFluidSwitcherViewController *)self _ensureSubviewOrdering];
    [(SBFluidSwitcherViewController *)self _updatePlusButtonPresence];
    [(SBFluidSwitcherViewController *)self _updateReopenClosedWindowsButtonPresence];
    [(SBFluidSwitcherViewController *)self _updateSwitcherDimmingViewPresence];
    [(SBFluidSwitcherViewController *)self _updateSwitcherBackdropViewPresence];
    [(SBFluidSwitcherViewController *)self _updateSlideOverTonguePresence];
    [(SBFluidSwitcherViewController *)self _updateBezelEffectsPortal];
    [(SBFluidSwitcherViewController *)self _updateSnapshotCache];
    [(SBFluidSwitcherViewController *)self _updateHomeScreenPointerInteractions];
    [(SBFluidSwitcherViewController *)self _updateHiddenAppLayoutsInShelves];
    [(SBFluidSwitcherViewController *)self _updateBounceIcon];
    [(SBFluidSwitcherViewController *)self _configureApplicationAndTransientOverlayDockBehaviorAssertionsForContext:0];
    [(SBFluidSwitcherViewController *)self _updateForegroundAppLayoutsList];
    [(SBFluidSwitcherViewController *)self _updateContinuousExposeStripsCaptureOnlyBackdropLayer];
    [(SBFluidSwitcherViewController *)self _updateWantsEnhancedWindowingEnabledState];
    [(SBFluidSwitcherViewController *)self _updateContinuousExposeStripTonguePresence];
    [(SBFluidSwitcherViewController *)self _updateCornerRadiiiAndMaximizedState];
    [(SBFluidSwitcherViewController *)self _updateHitTestBlockingView];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id obj = [(NSMutableDictionary *)self->_liveContentOverlays allKeys];
    uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(obj);
          }
          BOOL v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v9 = [(NSMutableDictionary *)self->_liveContentOverlays objectForKey:v8];
          uint64_t v10 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v8];
          id v11 = [v8 allItems];
          BOOL v12 = [v11 firstObject];
          uint64_t v13 = [v10 layoutRoleForItem:v12];

          objc_msgSend(v9, "setMatchMovedToScene:", -[SBSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](self->_rootModifier, "isLayoutRoleMatchMovedToScene:inAppLayout:", v13, v10));
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }
  }
}

- (void)_updateWantsEnhancedWindowingEnabledState
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBFluidSwitcherViewController *)self isChamoisWindowingUIEnabled];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_liveContentOverlays allValues];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setWantsEnhancedWindowingEnabled:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updateCornerRadiiiAndMaximizedState
{
  BOOL v3 = [(SBFluidSwitcherViewController *)self isChamoisWindowingUIEnabled];
  liveContentOverlays = self->_liveContentOverlays;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__SBFluidSwitcherViewController__updateCornerRadiiiAndMaximizedState__block_invoke;
  v5[3] = &unk_1E6AFAAA0;
  v5[4] = self;
  BOOL v6 = v3;
  [(NSMutableDictionary *)liveContentOverlays enumerateKeysAndObjectsUsingBlock:v5];
}

- (void)_updateAsyncRenderingAndResizesHostedContext
{
  uint64_t v7 = [a2 succinctDescription];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1D85BA000, a4, OS_LOG_TYPE_ERROR, "Shouldn't want both asyncRendering and resizesHostedContext for %@", a1, 0xCu);
}

- (id)draggingAppLayoutsForWindowDrag
{
  BOOL v3 = [(SBFluidSwitcherViewController *)self dataSource];
  uint64_t v4 = v3;
  if ((*((unsigned char *)&self->_dataSourceRespondsTo + 3) & 4) != 0) {
    [v3 draggingAppLayoutsForWindowDragForSwitcherContentController:self];
  }
  else {
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v5;
}

- (void)_ensureSubviewOrdering
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  [(SBSwitcherModifier *)self->_rootModifier topMostLayoutElements];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v31 = v49 = 0u;
  uint64_t v4 = [v31 reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v47 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v10 = [(SBFluidSwitcherViewController *)self _orderedViewsForLayoutElement:v9 excludeSwitcherHostedShelves:0];
        long long v11 = [v10 reverseObjectEnumerator];

        uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v43 != v14) {
                objc_enumerationMutation(v11);
              }
              [v3 addObject:*(void *)(*((void *)&v42 + 1) + 8 * j)];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v52 count:16];
          }
          while (v13);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v6);
  }

  if ((BSEqualArrays() & 1) == 0)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v16 = v3;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v51 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v39;
      do
      {
        for (uint64_t k = 0; k != v18; ++k)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v16);
          }
          [(SBFluidSwitcherContentView *)self->_contentView bringSubviewToFront:*(void *)(*((void *)&v38 + 1) + 8 * k)];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v51 count:16];
      }
      while (v18);
    }

    objc_storeStrong((id *)&self->_cachedOrderedAllLayoutElementViews, v3);
  }
  visibleItemContainerBackdropViews = self->_visibleItemContainerBackdropViews;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __55__SBFluidSwitcherViewController__ensureSubviewOrdering__block_invoke;
  void v37[3] = &unk_1E6AFA608;
  v37[4] = self;
  [(NSMutableDictionary *)visibleItemContainerBackdropViews bs_each:v37];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [(NSMutableDictionary *)self->_centerWindowActivationAnimationContexts allValues];
  uint64_t v22 = [obj countByEnumeratingWithState:&v33 objects:v50 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(obj);
        }
        double v26 = *(void **)(*((void *)&v33 + 1) + 8 * m);
        contentView = self->_contentView;
        uint64_t v28 = [v26 contentPortalContainer];
        [(SBFluidSwitcherContentView *)contentView sendSubviewToBack:v28];

        uint64_t v29 = self->_contentView;
        char v30 = [v26 deparentingPortal];
        [(SBFluidSwitcherContentView *)v29 bringSubviewToFront:v30];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v33 objects:v50 count:16];
    }
    while (v23);
  }

  if (self->_plusButton) {
    -[SBFluidSwitcherContentView bringSubviewToFront:](self->_contentView, "bringSubviewToFront:");
  }
  if (self->_reopenClosedWindowsButton) {
    -[SBFluidSwitcherContentView bringSubviewToFront:](self->_contentView, "bringSubviewToFront:");
  }
  if (self->_shelfBackgroundView) {
    -[SBFluidSwitcherContentView sendSubviewToBack:](self->_contentView, "sendSubviewToBack:");
  }
  if (self->_bounceIconView) {
    -[SBFluidSwitcherContentView bringSubviewToFront:](self->_contentView, "bringSubviewToFront:");
  }
  if (self->_continuousExposeStripCaptureAndBlurHomeScreenBackdropView) {
    -[SBFluidSwitcherContentView sendSubviewToBack:](self->_contentView, "sendSubviewToBack:");
  }
  if (self->_continuousExposeStripTongue) {
    -[SBFluidSwitcherContentView bringSubviewToFront:](self->_contentView, "bringSubviewToFront:");
  }
  if (self->_rootDestOutClippingView) {
    -[SBFluidSwitcherContentView bringSubviewToFront:](self->_contentView, "bringSubviewToFront:");
  }
}

- (void)_updateResignActiveAssertions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBSwitcherModifier *)self->_rootModifier appLayoutsToResignActive];
  if ((BSEqualDictionaries() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastAppLayoutsToResignActive, v3);
    uint64_t v4 = objc_opt_new();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__SBFluidSwitcherViewController__updateResignActiveAssertions__block_invoke;
    v17[3] = &unk_1E6AFAAC8;
    v17[4] = self;
    uint64_t v5 = v4;
    uint64_t v18 = v5;
    [v3 enumerateKeysAndObjectsWithOptions:0 usingBlock:v17];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = self->_resignActiveAssertions;
    uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10++), "relinquish", (void)v13);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v8);
    }

    resignActiveAssertions = self->_resignActiveAssertions;
    self->_resignActiveAssertions = v5;
    uint64_t v12 = v5;
  }
}

- (void)_updateHiddenAppLayoutsInShelves
{
  id v2 = self;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [(NSMutableDictionary *)self->_visibleShelves allKeys];
  uint64_t v29 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v47;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v47 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v46 + 1) + 8 * v3);
        uint64_t v5 = [(NSMutableDictionary *)v2->_hiddenAppLayoutAssertionsForShelves objectForKey:v4];
        if (!v5)
        {
          uint64_t v5 = objc_opt_new();
          hiddenAppLayoutAssertionsForShelves = v2->_hiddenAppLayoutAssertionsForShelves;
          if (!hiddenAppLayoutAssertionsForShelves)
          {
            uint64_t v7 = objc_opt_new();
            uint64_t v8 = v2->_hiddenAppLayoutAssertionsForShelves;
            v2->_hiddenAppLayoutAssertionsForShelves = (NSMutableDictionary *)v7;

            hiddenAppLayoutAssertionsForShelves = v2->_hiddenAppLayoutAssertionsForShelves;
          }
          [(NSMutableDictionary *)hiddenAppLayoutAssertionsForShelves setObject:v5 forKey:v4];
        }
        uint64_t v31 = v3;
        uint64_t v9 = [v5 allKeys];
        uint64_t v10 = v2;
        long long v11 = [(SBSwitcherModifier *)v2->_rootModifier hiddenAppLayoutsInShelf:v4];
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __65__SBFluidSwitcherViewController__updateHiddenAppLayoutsInShelves__block_invoke;
        v44[3] = &unk_1E6AF4B60;
        id v32 = v11;
        id v45 = v32;
        uint64_t v12 = objc_msgSend(v9, "bs_filter:", v44);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v33 = v12;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v51 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v41 != v15) {
                objc_enumerationMutation(v33);
              }
              uint64_t v17 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              uint64_t v18 = [v5 objectForKey:v17];
              [v5 removeObjectForKey:v17];
              [v18 invalidate];
            }
            uint64_t v14 = [v33 countByEnumeratingWithState:&v40 objects:v51 count:16];
          }
          while (v14);
        }
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __65__SBFluidSwitcherViewController__updateHiddenAppLayoutsInShelves__block_invoke_2;
        v38[3] = &unk_1E6AF4B60;
        id v30 = v9;
        id v39 = v30;
        uint64_t v19 = objc_msgSend(v32, "bs_filter:", v38);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v50 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v35;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v35 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v34 + 1) + 8 * j);
              id v25 = [(NSMutableDictionary *)v10->_visibleShelves objectForKey:v4];
              double v26 = [v25 beginHidingAppLayout:v24 forReason:@"switcher"];

              if (v26) {
                [v5 setObject:v26 forKey:v24];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v50 count:16];
          }
          while (v21);
        }
        id v2 = v10;
        if (![(NSMutableDictionary *)v10->_hiddenAppLayoutAssertionsForShelves count]) {
          [(NSMutableDictionary *)v10->_hiddenAppLayoutAssertionsForShelves removeObjectForKey:v4];
        }

        uint64_t v3 = v31 + 1;
      }
      while (v31 + 1 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v29);
  }
}

- (void)_updateAnimatableProperties
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableDictionary *)self->_animatableProperties allKeys];
  uint64_t v4 = [(SBSwitcherModifier *)self->_rootModifier animatablePropertyIdentifiers];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __60__SBFluidSwitcherViewController__updateAnimatableProperties__block_invoke;
  v61[3] = &unk_1E6AF4A20;
  id v36 = v3;
  id v62 = v36;
  uint64_t v5 = objc_msgSend(v4, "bs_filter:", v61);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __60__SBFluidSwitcherViewController__updateAnimatableProperties__block_invoke_2;
  v59[3] = &unk_1E6AF4A20;
  id v35 = v4;
  id v60 = v35;
  objc_msgSend(v36, "bs_filter:", v59);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v56 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v10 = [(NSMutableDictionary *)self->_animatableProperties objectForKey:v9];
        [v10 invalidate];
        [(NSMutableDictionary *)self->_animatableProperties removeObjectForKey:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v55 objects:v67 count:16];
    }
    while (v6);
  }

  long long v40 = objc_opt_new();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v38 = v5;
  uint64_t v11 = [v38 countByEnumeratingWithState:&v51 objects:v66 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(v38);
        }
        uint64_t v14 = *(void *)(*((void *)&v51 + 1) + 8 * j);
        id v15 = objc_alloc_init(MEMORY[0x1E4F43000]);
        [(SBSwitcherModifier *)self->_rootModifier modelValueForAnimatableProperty:v14 currentValue:1 creating:0.0];
        objc_msgSend(v15, "setValue:");
        animatableProperties = self->_animatableProperties;
        if (!animatableProperties)
        {
          uint64_t v17 = (NSMutableDictionary *)objc_opt_new();
          uint64_t v18 = self->_animatableProperties;
          self->_animatableProperties = v17;

          animatableProperties = self->_animatableProperties;
        }
        uint64_t v64 = v14;
        id v65 = v15;
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        [(NSMutableDictionary *)animatableProperties addEntriesFromDictionary:v19];

        [v40 addObject:v15];
      }
      uint64_t v11 = [v38 countByEnumeratingWithState:&v51 objects:v66 count:16];
    }
    while (v11);
  }

  if ([v40 count])
  {
    objc_initWeak(&location, self);
    uint64_t v20 = (void *)MEMORY[0x1E4F42FF0];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __60__SBFluidSwitcherViewController__updateAnimatableProperties__block_invoke_3;
    v48[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v49, &location);
    [v20 _createTransformerWithInputAnimatableProperties:v40 presentationValueChangedCallback:v48];
    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v37 = [(NSMutableDictionary *)self->_animatableProperties allKeys];
  uint64_t v21 = [v37 countByEnumeratingWithState:&v44 objects:v63 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v45;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(v37);
        }
        uint64_t v24 = *(void *)(*((void *)&v44 + 1) + 8 * k);
        if ([(SBSwitcherModifier *)self->_rootModifier shouldUpdateAnimatableProperty:v24])
        {
          id v25 = [(NSMutableDictionary *)self->_animatableProperties valueForKey:v24];
          rootModifier = self->_rootModifier;
          [v25 value];
          -[SBSwitcherModifier modelValueForAnimatableProperty:currentValue:creating:](rootModifier, "modelValueForAnimatableProperty:currentValue:creating:", v24, 0);
          uint64_t v28 = v27;
          [v25 value];
          if ((BSFloatEqualToFloat() & 1) == 0)
          {
            uint64_t v29 = [(SBSwitcherModifier *)self->_rootModifier updateModeForAnimatableProperty:v24];
            id v30 = [(SBSwitcherModifier *)self->_rootModifier settingsForAnimatableProperty:v24];
            activeTransitionSubcompletionGenerator = (void (**)(id, void))self->_activeTransitionSubcompletionGenerator;
            if (activeTransitionSubcompletionGenerator)
            {
              id v32 = activeTransitionSubcompletionGenerator[2](activeTransitionSubcompletionGenerator, v24);
              id v33 = (void *)MEMORY[0x1D948C7A0]();
            }
            else
            {
              id v33 = 0;
            }
            long long v34 = (void *)MEMORY[0x1E4F42FF0];
            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = __60__SBFluidSwitcherViewController__updateAnimatableProperties__block_invoke_4;
            v41[3] = &unk_1E6AF4A70;
            id v42 = v25;
            uint64_t v43 = v28;
            objc_msgSend(v34, "sb_animateWithSettings:mode:animations:completion:", v30, v29, v41, v33);
          }
        }
      }
      uint64_t v21 = [v37 countByEnumeratingWithState:&v44 objects:v63 count:16];
    }
    while (v21);
  }
}

- (void)_updateKeyboardSuppressionAssertion
{
  id obj = [(SBSwitcherModifier *)self->_rootModifier keyboardSuppressionMode];
  if (!-[SBSwitcherKeyboardSuppressionMode isEqual:](self->_lastKeyboardSuppressionMode, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_lastKeyboardSuppressionMode, obj);
    id v3 = +[SBSwitcherKeyboardSuppressionMode suppressionModeNone];

    if (obj == v3)
    {
      uint64_t v4 = +[SBKeyboardSuppressionManager sharedInstance];
      [v4 stopSuppressingKeyboardWithReason:self->_fluidSwitcherAssertionReason];
    }
    else
    {
      [(SBFluidSwitcherViewController *)self _acquireKeyboardSuppressionAssertionForMode:obj];
    }
  }
}

- (void)_updateSpringBoardStatusBarVisibility
{
  id v3 = [(SBFluidSwitcherViewController *)self delegate];
  if (*((unsigned char *)&self->_delegateRespondsTo + 2))
  {
    id v6 = v3;
    uint64_t v4 = [(SBSwitcherModifier *)self->_rootModifier isContainerStatusBarVisible] ^ 1;
    uint64_t v5 = [(SBSwitcherModifier *)self->_rootModifier hiddenContainerStatusBarParts];
    [(SBSwitcherModifier *)self->_rootModifier containerStatusBarAnimationDuration];
    objc_msgSend(v6, "switcherContentController:setContainerStatusBarHidden:partsHidden:animationDuration:", self, v4, v5);
    id v3 = v6;
  }
}

- (void)_updateSnapshotCache
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBSwitcherModifier *)self->_rootModifier appLayoutsToCacheSnapshots];
  uint64_t v4 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v39 + 1) + 8 * i) leafAppLayouts];
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v7);
  }

  id v11 = v4;
  [(SBAppSwitcherSnapshotImageCache *)self->_snapshotCache setCachableAppLayouts:v11];
  uint64_t v12 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    uint64_t v14 = [(SBSwitcherModifier *)self->_rootModifier appLayoutsToCacheFullsizeSnapshots];
    id v15 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = [*(id *)(*((void *)&v35 + 1) + 8 * j) leafAppLayouts];
          [v15 addObjectsFromArray:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v18);
    }

    id v22 = v15;
    uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v22];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v24 = [(NSMutableDictionary *)self->_liveContentOverlays allKeys];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v32;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v31 + 1) + 8 * k);
          id v30 = [(SBFluidSwitcherViewController *)self _itemContainerForAppLayoutIfExists:v29];
          [v30 contentAlpha];
          if (BSFloatIsZero()) {
            [v23 removeObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v26);
    }
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F1CBF0];
  }
  [(SBAppSwitcherSnapshotImageCache *)self->_snapshotCache setFullSizeCachableAppLayouts:v23];
}

- (void)_updatePlusButtonPresence
{
  id v3 = [(SBSwitcherModifier *)self->_rootModifier appExposeAccessoryButtonsBundleIdentifier];
  uint64_t v4 = v3;
  id v16 = v3;
  if (v3 && (v5 = [v3 isEqualToString:@"com.apple.InCallService"], uint64_t v4 = v16, (v5 & 1) == 0))
  {
    if (self->_plusButton) {
      goto LABEL_8;
    }
    uint64_t v8 = [MEMORY[0x1E4F42A80] systemImageNamed:@"plus"];
    uint64_t v9 = [MEMORY[0x1E4F42A98] configurationWithPointSize:6 weight:14.1];
    uint64_t v10 = [v8 imageWithConfiguration:v9];

    id v11 = [MEMORY[0x1E4F428B8] blackColor];
    uint64_t v7 = [v10 imageWithTintColor:v11 renderingMode:1];

    uint64_t v12 = [SBFluidSwitcherButton alloc];
    uint64_t v13 = -[SBFluidSwitcherButton initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    plusButtouint64_t n = self->_plusButton;
    self->_plusButtouint64_t n = v13;

    [(SBFluidSwitcherButton *)self->_plusButton setAlpha:0.0];
    [(SBFluidSwitcherButton *)self->_plusButton setBackdropGroupName:@"AppExposeAccessoryButtonsMaterialGroupName"];
    [(SBFluidSwitcherButton *)self->_plusButton setImage:v7];
    [(SBFluidSwitcherButton *)self->_plusButton setAccessibilityIdentifier:@"switcher-plus-button"];
    [(SBFluidSwitcherButton *)self->_plusButton addTarget:self action:sel__handlePlusButtonTapped_ forControlEvents:64];
    [(SBFluidSwitcherContentView *)self->_contentView addSubview:self->_plusButton];
    id v15 = [(SBFluidSwitcherViewController *)self view];
    [v15 setNeedsLayout];
  }
  else
  {
    uint64_t v6 = self->_plusButton;
    if (!v6) {
      goto LABEL_8;
    }
    [(SBFluidSwitcherButton *)v6 removeFromSuperview];
    uint64_t v7 = self->_plusButton;
    self->_plusButtouint64_t n = 0;
  }

  uint64_t v4 = v16;
LABEL_8:
}

- (void)_updateReopenClosedWindowsButtonPresence
{
  id v3 = [(SBSwitcherModifier *)self->_rootModifier appExposeAccessoryButtonsBundleIdentifier];

  reopenClosedWindowsButtouint64_t n = self->_reopenClosedWindowsButton;
  if (v3)
  {
    if (reopenClosedWindowsButton) {
      return;
    }
    char v5 = objc_alloc_init(SBFluidSwitcherTitledButton);
    uint64_t v6 = self->_reopenClosedWindowsButton;
    self->_reopenClosedWindowsButtouint64_t n = v5;

    [(SBFluidSwitcherTitledButton *)self->_reopenClosedWindowsButton setAlpha:0.0];
    [(SBFluidSwitcherButton *)self->_reopenClosedWindowsButton setBackdropGroupName:@"AppExposeAccessoryButtonsMaterialGroupName"];
    [(SBFluidSwitcherTitledButton *)self->_reopenClosedWindowsButton addTarget:self action:sel_handleReopenClosedWindowsButtonTapped_ forControlEvents:64];
    [(SBFluidSwitcherContentView *)self->_contentView addSubview:self->_reopenClosedWindowsButton];
    [(SBFluidSwitcherViewController *)self _updateReopenClosedWindowsButtonText];
    uint64_t v8 = [(SBFluidSwitcherViewController *)self view];
    [(SBFluidSwitcherTitledButton *)v8 setNeedsLayout];
    uint64_t v7 = v8;
  }
  else
  {
    if (!reopenClosedWindowsButton) {
      return;
    }
    [(SBFluidSwitcherTitledButton *)reopenClosedWindowsButton removeFromSuperview];
    uint64_t v7 = self->_reopenClosedWindowsButton;
    self->_reopenClosedWindowsButtouint64_t n = 0;
  }
}

- (void)_updateHomeScreenPointerInteractions
{
  id v3 = [(SBFluidSwitcherViewController *)self delegate];
  if ([(SBFluidSwitcherViewController *)self _controlsHomeScreenContents]
    && (*((unsigned char *)&self->_delegateRespondsTo + 2) & 2) != 0)
  {
    objc_msgSend(v3, "switcherContentController:setPointerInteractionsEnabled:", self, -[SBSwitcherModifier wantsHomeScreenPointerInteractions](self->_rootModifier, "wantsHomeScreenPointerInteractions"));
  }
}

- (SBSwitcherContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSwitcherContentViewControllerDelegate *)WeakRetained;
}

- (BOOL)_controlsHomeScreenContents
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v4 = WeakRetained;
  if ((*((unsigned char *)&self->_delegateRespondsTo + 2) & 8) != 0) {
    char v5 = [WeakRetained switcherContentControllerControlsHomeScreenContents:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)_updateHitTestBlockingView
{
  hitTestBlockerView = self->_hitTestBlockerView;
  uint64_t v3 = [(SBSwitcherModifier *)self->_rootModifier isHitTestBlockingViewVisible] ^ 1;
  [(UIView *)hitTestBlockerView setHidden:v3];
}

- (void)_updateContinuousExposeStripTonguePresence
{
  uint64_t v4 = [(SBSwitcherModifier *)self->_rootModifier continuousExposeStripTongueAttributes];
  continuousExposeStripTongue = self->_continuousExposeStripTongue;
  if (v4 == 2)
  {
    if (continuousExposeStripTongue) {
      return;
    }
    uint64_t v6 = v3;
    uint64_t v7 = objc_alloc_init(SBContinuousExposeStripTongueView);
    uint64_t v8 = self->_continuousExposeStripTongue;
    self->_continuousExposeStripTongue = v7;

    [(SBContinuousExposeStripTongueView *)self->_continuousExposeStripTongue setDelegate:self];
    [(SBFluidSwitcherContentView *)self->_contentView addSubview:self->_continuousExposeStripTongue];
    uint64_t v9 = (_UIBackdropView *)[objc_alloc(MEMORY[0x1E4F430A8]) initWithPrivateStyle:-2];
    continuousExposeStripTongueCaptureOnlyBackdropView = self->_continuousExposeStripTongueCaptureOnlyBackdropView;
    self->_continuousExposeStripTongueCaptureOnlyBackdropView = v9;

    id v11 = [(_UIBackdropView *)self->_continuousExposeStripTongueCaptureOnlyBackdropView inputSettings];
    [v11 setBlurRadius:0.0];

    uint64_t v12 = [(_UIBackdropView *)self->_continuousExposeStripTongueCaptureOnlyBackdropView inputSettings];
    [v12 setScale:1.0];

    uint64_t v13 = [(_UIBackdropView *)self->_continuousExposeStripTongueCaptureOnlyBackdropView inputSettings];
    [v13 setBackdropVisible:1];

    [(_UIBackdropView *)self->_continuousExposeStripTongueCaptureOnlyBackdropView setGroupName:@"SBContinuousExposeStripTongueBackdropName"];
    uint64_t v14 = objc_opt_class();
    id v15 = [(_UIBackdropView *)self->_continuousExposeStripTongueCaptureOnlyBackdropView effectView];
    id v16 = [v15 layer];
    SBSafeCast(v14, v16);
    uint64_t v25 = (SBSwitcherAccessoryLayoutElement *)objc_claimAutoreleasedReturnValue();

    [(SBSwitcherAccessoryLayoutElement *)v25 setCaptureOnly:0];
    [(SBFluidSwitcherContentView *)self->_contentView addSubview:self->_continuousExposeStripTongueCaptureOnlyBackdropView];
    uint64_t v17 = [[SBSwitcherAccessoryLayoutElement alloc] initWithType:6];
    continuousExposeStripTongueBackdropCaptureLayoutElement = self->_continuousExposeStripTongueBackdropCaptureLayoutElement;
    self->_continuousExposeStripTongueBackdropCaptureLayoutElement = v17;

    [(SBFluidSwitcherViewController *)self _ensureSubviewOrdering];
    [(SBFluidSwitcherViewController *)self _layoutContinuousExposeStripTongueAnimated:0 completion:0];
    uint64_t v19 = self->_continuousExposeStripTongue;
    uint64_t v20 = SBSwitcherContinuousExposeStripTongueAttributesMake(1, v6);
    -[SBContinuousExposeStripTongueView setAttributes:animated:](v19, "setAttributes:animated:", v20, v21, 0);
    -[SBContinuousExposeStripTongueView setAttributes:animated:](self->_continuousExposeStripTongue, "setAttributes:animated:", 2, v6, 1);
    id v22 = v25;
  }
  else
  {
    if (!continuousExposeStripTongue
      || [(SBContinuousExposeStripTongueView *)continuousExposeStripTongue isAnimating])
    {
      return;
    }
    [(SBContinuousExposeStripTongueView *)self->_continuousExposeStripTongue removeFromSuperview];
    uint64_t v23 = self->_continuousExposeStripTongue;
    self->_continuousExposeStripTongue = 0;

    [(_UIBackdropView *)self->_continuousExposeStripTongueCaptureOnlyBackdropView removeFromSuperview];
    uint64_t v24 = self->_continuousExposeStripTongueCaptureOnlyBackdropView;
    self->_continuousExposeStripTongueCaptureOnlyBackdropView = 0;

    id v22 = self->_continuousExposeStripTongueBackdropCaptureLayoutElement;
    self->_continuousExposeStripTongueBackdropCaptureLayoutElement = 0;
  }
}

- (void)_updateBounceIcon
{
  unint64_t v3 = [(SBSwitcherModifier *)self->_rootModifier bounceIconGenerationCountForCurrentCount:self->_bounceIconGenerationCount];
  if (v3 != self->_bounceIconGenerationCount)
  {
    uint64_t v4 = (void *)v3;
    self->_bounceIconGenerationCount = v3;
    bounceIconView = self->_bounceIconView;
    if (bounceIconView)
    {
      [(SBIconView *)bounceIconView removeFromSuperview];
      uint64_t v6 = self->_bounceIconView;
      self->_bounceIconView = 0;
    }
    uint64_t v7 = [(SBSwitcherModifier *)self->_rootModifier bounceIconBundleIdentifier];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [(SBFluidSwitcherViewController *)self _iconManager];
      uint64_t v10 = [v9 iconModel];
      id v11 = [v10 leafIconForIdentifier:v8];
      [(SBSwitcherModifier *)self->_rootModifier bounceIconInitialFrame];
      CGFloat x = v36.origin.x;
      CGFloat y = v36.origin.y;
      double width = v36.size.width;
      double height = v36.size.height;
      if (!CGRectIsNull(v36))
      {
        id v16 = (SBIconView *)[objc_alloc(MEMORY[0x1E4FA6430]) initWithConfigurationOptions:6];
        uint64_t v17 = self->_bounceIconView;
        self->_bounceIconView = v16;

        [(SBIconView *)self->_bounceIconView setLocation:*MEMORY[0x1E4FA66D0]];
        uint64_t v18 = self->_bounceIconView;
        uint64_t v19 = [v9 listLayoutProvider];
        [(SBIconView *)v18 setListLayoutProvider:v19];

        [(SBIconView *)self->_bounceIconView setDelegate:v9];
        [(SBIconView *)self->_bounceIconView setIcon:v11];
        [(SBIconView *)self->_bounceIconView setEnabled:0];
        -[SBIconView setBounds:](self->_bounceIconView, "setBounds:", 0.0, 0.0, width, height);
        uint64_t v20 = self->_bounceIconView;
        UIRectGetCenter();
        double v22 = v21;
        [(SBFluidSwitcherContentView *)self->_contentView bounds];
        -[SBIconView setCenter:](v20, "setCenter:", v22, height + v23);
        [(SBFluidSwitcherContentView *)self->_contentView addSubview:self->_bounceIconView];
        uint64_t v24 = [(SBFluidSwitcherViewController *)self medusaSettings];
        uint64_t v25 = [v24 switcherShelfBounceIconSettings];

        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __50__SBFluidSwitcherViewController__updateBounceIcon__block_invoke;
        v35[3] = &unk_1E6AF8568;
        v35[4] = self;
        *(CGFloat *)&v35[5] = x;
        *(CGFloat *)&v35[6] = y;
        *(double *)&v35[7] = width;
        *(double *)&v35[8] = height;
        objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", v25, 3, v35, 0);
        objc_initWeak(&location, self);
        uint64_t v26 = [(SBFluidSwitcherViewController *)self medusaSettings];
        [v26 switcherShelfGenieIconBounceDelay];
        double v28 = v27;

        dispatch_time_t v29 = dispatch_time(0, (uint64_t)(v28 * 1000000000.0));
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __50__SBFluidSwitcherViewController__updateBounceIcon__block_invoke_2;
        block[3] = &unk_1E6AFAA78;
        objc_copyWeak(v33, &location);
        v33[1] = v4;
        id v32 = v25;
        v33[2] = *(id *)&x;
        v33[3] = *(id *)&y;
        v33[4] = *(id *)&width;
        v33[5] = *(id *)&height;
        id v30 = v25;
        dispatch_after(v29, MEMORY[0x1E4F14428], block);

        objc_destroyWeak(v33);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)_updateAsynchronousSurfaceRetentionAssertion
{
  uint64_t v3 = [(SBSwitcherModifier *)self->_rootModifier wantsAsynchronousSurfaceRetentionAssertion];
  uint64_t v4 = [(SBFluidSwitcherViewController *)self delegate];
  if ((*((unsigned char *)&self->_delegateRespondsTo + 2) & 0x10) != 0)
  {
    id v5 = v4;
    [v4 switcherContentController:self setCacheAsynchronousRenderingSurfaces:v3];
    uint64_t v4 = v5;
  }
}

- (void)_updateAppStatusBarAndHomeGrabberVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(SBFluidSwitcherViewController *)self appLayouts];
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
        [(SBFluidSwitcherViewController *)self _updateStatusBarAndHomeGrabberVisibilityForAppLayout:*(void *)(*((void *)&v10 + 1) + 8 * v9++) animated:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_updateSwitcherDimmingViewPresence
{
  int v3 = [(SBSwitcherModifier *)self->_rootModifier wantsSwitcherDimmingView];
  dimmingView = self->_dimmingView;
  if (v3)
  {
    if (dimmingView) {
      return;
    }
    id v5 = objc_alloc(MEMORY[0x1E4F42FF0]);
    uint64_t v6 = [(SBFluidSwitcherViewController *)self view];
    [v6 bounds];
    uint64_t v7 = (UIView *)objc_msgSend(v5, "initWithFrame:");
    uint64_t v8 = self->_dimmingView;
    self->_dimmingView = v7;

    uint64_t v9 = self->_dimmingView;
    long long v10 = [MEMORY[0x1E4F428B8] blackColor];
    [(UIView *)v9 setBackgroundColor:v10];

    [(UIView *)self->_dimmingView setAlpha:0.0];
    [(UIView *)self->_dimmingView setAutoresizingMask:18];
    [(SBFluidSwitcherContentView *)self->_contentView addSubview:self->_dimmingView];
    long long v11 = [[SBSwitcherAccessoryLayoutElement alloc] initWithType:2];
    dimmingViewLayoutElement = self->_dimmingViewLayoutElement;
    self->_dimmingViewLayoutElement = v11;
  }
  else
  {
    if (!dimmingView) {
      return;
    }
    [(UIView *)dimmingView removeFromSuperview];
    long long v13 = self->_dimmingView;
    self->_dimmingView = 0;

    dimmingViewLayoutElement = self->_dimmingViewLayoutElement;
    self->_dimmingViewLayoutElement = 0;
  }
}

- (void)_updateForegroundAppLayoutsList
{
  if (SBFIsMoreForegroundAppsAvailable())
  {
    int v3 = [(SBSwitcherModifier *)self->_rootModifier foregroundAppLayouts];
    foregroundingAppLayouts = self->_foregroundingAppLayouts;
    self->_foregroundingAppLayouts = v3;
  }
}

- (id)_orderedViewsForLayoutElement:(id)a3 excludeSwitcherHostedShelves:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = 0;
  switch([v6 switcherLayoutElementType])
  {
    case 0:
      id v8 = v6;
      uint64_t v7 = objc_opt_new();
      uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __92__SBFluidSwitcherViewController__orderedViewsForLayoutElement_excludeSwitcherHostedShelves___block_invoke;
      v51[3] = &unk_1E6AFA810;
      id v52 = v8;
      long long v53 = self;
      id v10 = v9;
      id v54 = v10;
      id v41 = v52;
      [v52 enumerate:v51];
      id v40 = v6;
      if (v4)
      {
        long long v11 = objc_opt_new();
      }
      else
      {
        id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
        visibleShelvesHostedInContentView = self->_visibleShelvesHostedInContentView;
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __92__SBFluidSwitcherViewController__orderedViewsForLayoutElement_excludeSwitcherHostedShelves___block_invoke_2;
        v50[3] = &unk_1E6AFA838;
        v50[4] = self;
        uint64_t v18 = [(NSMutableSet *)visibleShelvesHostedInContentView bs_map:v50];
        uint64_t v19 = [v18 allObjects];
        long long v11 = (void *)[v16 initWithArray:v19];
      }
      long long v39 = self;
      uint64_t v20 = [(SBSwitcherModifier *)self->_rootModifier topMostLayoutRolesForAppLayout:v41];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v62 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v47 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            uint64_t v26 = [v10 objectForKey:v25];
            if (v26)
            {
              [v7 addObject:v26];
              [v10 removeObjectForKey:v25];
              uint64_t v27 = [v25 integerValue];
              uint64_t v28 = [v41 environment];
              BOOL v29 = v27 == 4 || v28 == 3;
              if (v29 && [v11 count])
              {
                [v7 addObjectsFromArray:v11];
                [v11 removeAllObjects];
              }
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v46 objects:v62 count:16];
        }
        while (v22);
      }
      if ([v10 count])
      {
        id v30 = [v10 allValues];
        [v7 addObjectsFromArray:v30];
      }
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v31 = v11;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v42 objects:v61 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v43 != v34) {
              objc_enumerationMutation(v31);
            }
            [v7 insertObject:*(void *)(*((void *)&v42 + 1) + 8 * j) atIndex:0];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v42 objects:v61 count:16];
        }
        while (v33);
      }

      CGRect v36 = [(NSMutableDictionary *)v39->_visibleOverlayAccessoryViews objectForKey:v41];
      if (v36) {
        [v7 insertObject:v36 atIndex:0];
      }
      long long v37 = [(NSMutableDictionary *)v39->_visibleUnderlayAccessoryViews objectForKey:v41];
      if (v37) {
        [v7 addObject:v37];
      }

      id v6 = v40;
      goto LABEL_50;
    case 2:
      if (!self->_dimmingView) {
        goto LABEL_17;
      }
      dimmingView = self->_dimmingView;
      long long v12 = (void *)MEMORY[0x1E4F1C978];
      p_dimmingView = &dimmingView;
      goto LABEL_16;
    case 3:
      if (!self->_backdropView) {
        goto LABEL_17;
      }
      backdropView = self->_backdropView;
      long long v12 = (void *)MEMORY[0x1E4F1C978];
      p_dimmingView = (UIView **)&backdropView;
      goto LABEL_16;
    case 4:
      if (!self->_slideOverTongue) {
        goto LABEL_17;
      }
      slideOverTongue = self->_slideOverTongue;
      long long v12 = (void *)MEMORY[0x1E4F1C978];
      p_dimmingView = (UIView **)&slideOverTongue;
      goto LABEL_16;
    case 6:
      if (!self->_continuousExposeStripTongueCaptureOnlyBackdropView) {
        goto LABEL_17;
      }
      continuousExposeStripTongueCaptureOnlyBackdropView = self->_continuousExposeStripTongueCaptureOnlyBackdropView;
      long long v12 = (void *)MEMORY[0x1E4F1C978];
      p_dimmingView = (UIView **)&continuousExposeStripTongueCaptureOnlyBackdropView;
      goto LABEL_16;
    case 7:
      uint64_t v14 = [(NSMutableDictionary *)self->_visibleShelves objectForKey:v6];
      uint64_t v15 = [v14 viewIfLoaded];

      if (v15)
      {
        long long v56 = v15;
        uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
      }
      else
      {
        uint64_t v7 = 0;
      }

      goto LABEL_50;
    case 8:
      if (self->_bezelEffectsPortalView)
      {
        bezelEffectsPortalView = self->_bezelEffectsPortalView;
        long long v12 = (void *)MEMORY[0x1E4F1C978];
        p_dimmingView = (UIView **)&bezelEffectsPortalView;
LABEL_16:
        uint64_t v7 = [v12 arrayWithObjects:p_dimmingView count:1];
      }
      else
      {
LABEL_17:
        uint64_t v7 = 0;
      }
LABEL_50:

      return v7;
    default:
      goto LABEL_50;
  }
}

- (BOOL)prefersStripHidden
{
  return self->_chamoisDefaultsObserver_prefersStripsHidden;
}

- (BOOL)prefersDockHidden
{
  return self->_chamoisDefaultsObserver_prefersDockHidden;
}

- (BOOL)isRTLEnabled
{
  return [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
}

- (id)displayItemLayoutAttributesCalculator
{
  return self->_displayItemLayoutAttributesCalculator;
}

- (double)displayCornerRadius
{
  id v2 = [(SBFluidSwitcherViewController *)self _screen];
  if ([v2 _isEmbeddedScreen])
  {
    double v3 = SBScreenDisplayCornerRadius();
  }
  else
  {
    BOOL v4 = [v2 traitCollection];
    [v4 displayCornerRadius];
    double v3 = v5;
  }
  return v3;
}

- (BOOL)_controlsWallpaper
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v4 = WeakRetained;
  if ((*((unsigned char *)&self->_delegateRespondsTo + 1) & 4) != 0) {
    char v5 = [WeakRetained switcherContentControllerControlsWallpaper:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

void __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v648 = *MEMORY[0x1E4F143B8];
  v448 = a2;
  uint64_t v468 = a1;
  double v3 = [*(id *)(a1 + 32) appLayouts];
  uint64_t v4 = [v3 indexOfObject:*(void *)(v468 + 40)];

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(*(void *)(v468 + 32) + 1944) anchorPointForIndex:v4];
    double v424 = v5;
    double v423 = v6;
    [*(id *)(*(void *)(v468 + 32) + 1944) frameForIndex:v4];
    double v421 = v7;
    double v420 = v8;
    double v10 = v9;
    double v12 = v11;
    [*(id *)(*(void *)(v468 + 32) + 1944) scaleForIndex:v4];
    double v14 = v13;
    [*(id *)(*(void *)(v468 + 32) + 1944) rotationAngleForIndex:v4];
    double v391 = v15;
    [*(id *)(*(void *)(v468 + 32) + 1944) cornerRadiiForIndex:v4];
    double v398 = v17;
    double v399 = v16;
    double v396 = v19;
    double v397 = v18;
    [*(id *)(*(void *)(v468 + 32) + 1944) minimumTranslationToKillIndex:v4];
    uint64_t v385 = v20;
    double v426 = v14;
    [*(id *)(*(void *)(v468 + 32) + 1944) contentPageViewScaleForAppLayout:*(void *)(v468 + 40) withScale:v14];
    double v392 = v21;
    unsigned int v387 = [*(id *)(*(void *)(v468 + 32) + 1944) shouldScaleOverlayToFillBoundsAtIndex:v4];
    unsigned int v379 = [*(id *)(*(void *)(v468 + 32) + 1944) shouldScaleContentToFillBoundsAtIndex:v4];
    uint64_t v22 = *(void **)(*(void *)(v468 + 32) + 1944);
    double v458 = v10;
    double v457 = v12;
    SBRectWithSize();
    objc_msgSend(v22, "clippingFrameForIndex:withBounds:", v4);
    uint64_t v375 = v24;
    uint64_t v376 = v23;
    uint64_t v373 = v26;
    uint64_t v374 = v25;
    unsigned int v405 = [*(id *)(*(void *)(v468 + 32) + 1944) clipsToBoundsAtIndex:v4];
    uint64_t v393 = [*(id *)(*(void *)(v468 + 32) + 1944) maskedCornersForIndex:v4];
    [*(id *)(*(void *)(v468 + 32) + 1944) perspectiveAngleForAppLayout:*(void *)(v468 + 40)];
    uint64_t v384 = v27;
    uint64_t v441 = v4;
    id v406 = [*(id *)(*(void *)(v468 + 32) + 1944) meshTransformForIndex:v4];
    long long v28 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v636.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v636.m13 = v28;
    long long v29 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v636.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v636.m23 = v29;
    long long v30 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v636.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v636.m43 = v30;
    long long v31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v636.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v636.m33 = v31;
    uint64_t v32 = [*(id *)(v468 + 32) _bestSupportedHomeAffordanceOrientationForOrientation:*(void *)(*(void *)(v468 + 32) + 1800) inAppLayout:*(void *)(v468 + 40)];
    uint64_t v33 = *(void *)(v468 + 32);
    if (v32 != *(void *)(v33 + 1800))
    {
      SBFAngleForRotationFromInterfaceOrientationToInterfaceOrientation();
      CATransform3DMakeRotation(&v636, v34, 0.0, 0.0, 1.0);
      uint64_t v33 = *(void *)(v468 + 32);
    }
    long long v35 = [*(id *)(v33 + 1944) resizeGrabberLayoutAttributesForAppLayout:*(void *)(v468 + 40)];
    CGRect v36 = [v35 leafAppLayout];
    long long v37 = [*(id *)(*(void *)(v468 + 32) + 1304) objectForKey:v36];
    if (v37)
    {
      long long v38 = [v36 itemForLayoutRole:1];
      uint64_t v39 = [v37 layoutRoleForItem:v38];

      id v40 = *(void **)(*(void *)(v468 + 32) + 1944);
      SBRectWithSize();
      objc_msgSend(v40, "frameForLayoutRole:inAppLayout:withBounds:", v39, v37);
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      CGFloat v48 = v47;
      [*(id *)(v468 + 32) separatorViewWidth];
      double v377 = v49;
      if ([v35 edge] == 2)
      {
        v649.origin.CGFloat x = v42;
        v649.origin.CGFloat y = v44;
        v649.size.double width = v46;
        v649.size.double height = v48;
        double MaxX = CGRectGetMinX(v649) - v377;
      }
      else
      {
        v650.origin.CGFloat x = v42;
        v650.origin.CGFloat y = v44;
        v650.size.double width = v46;
        v650.size.double height = v48;
        double MaxX = CGRectGetMaxX(v650);
      }
      v651.origin.CGFloat x = v42;
      v651.origin.CGFloat y = v44;
      v651.size.double width = v46;
      v651.size.double height = v48;
      CGFloat MinY = CGRectGetMinY(v651);
      v652.origin.CGFloat x = v42;
      v652.origin.CGFloat y = v44;
      v652.size.double width = v46;
      v652.size.double height = v48;
      CGFloat Height = CGRectGetHeight(v652);
    }
    else
    {
      CGFloat MinY = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double MaxX = *MEMORY[0x1E4F1DB28];
      double v377 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat Height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }

    uint64_t v366 = [*(id *)(*(void *)(v468 + 32) + 1944) footerViewIconAlignmentForAppLayout:*(void *)(v468 + 40)];
    [*(id *)(*(void *)(v468 + 32) + 1944) contentViewOffsetForAccessoriesOfAppLayout:*(void *)(v468 + 40)];
    uint64_t v368 = v51;
    uint64_t v369 = v50;
    uint64_t v367 = [*(id *)(*(void *)(v468 + 32) + 1944) multipleWindowsIndicatorLayoutRoleMaskForAppLayout:*(void *)(v468 + 40)];
    char v386 = [*(id *)(*(void *)(v468 + 32) + 1944) shouldUseWallpaperGradientTreatment];
    [*(id *)(*(void *)(v468 + 32) + 1944) wallpaperGradientAttributesForIndex:v441];
    double v390 = v52;
    double v404 = v53;
    unsigned int v446 = [*(id *)(*(void *)(v468 + 32) + 1944) shouldPerformRotationAnimationForOrientationChange];
    v436 = [*(id *)(*(void *)(v468 + 32) + 1944) animationAttributesForLayoutElement:*(void *)(v468 + 40)];
    uint64_t v54 = [v436 updateMode];
    uint64_t v55 = [v436 layoutUpdateMode];
    if (v55) {
      uint64_t v56 = v55;
    }
    else {
      uint64_t v56 = v54;
    }
    uint64_t v388 = v56;
    uint64_t v57 = [v436 positionUpdateMode];
    if (v57) {
      uint64_t v58 = v57;
    }
    else {
      uint64_t v58 = v54;
    }
    uint64_t v422 = v58;
    uint64_t v59 = [v436 scaleUpdateMode];
    if (v59) {
      uint64_t v60 = v59;
    }
    else {
      uint64_t v60 = v54;
    }
    uint64_t v407 = v60;
    uint64_t v61 = [v436 cornerRadiusUpdateMode];
    if (v61) {
      uint64_t v62 = v61;
    }
    else {
      uint64_t v62 = v54;
    }
    uint64_t v389 = v62;
    uint64_t v63 = [v436 clippingUpdateMode];
    if (v63) {
      uint64_t v64 = v63;
    }
    else {
      uint64_t v64 = v54;
    }
    uint64_t v380 = v64;
    uint64_t v382 = [v436 meshUpdateMode];
    if (!v382) {
      uint64_t v382 = [v436 updateMode];
    }
    v400 = [v436 layoutSettings];
    uint64_t v65 = [v436 positionSettings];
    id v66 = (void *)v65;
    int v67 = v400;
    if (v65) {
      int v67 = (void *)v65;
    }
    id v402 = v67;

    uint64_t v68 = [v436 scaleSettings];
    long long v69 = (void *)v68;
    uint64_t v70 = v400;
    if (v68) {
      uint64_t v70 = (void *)v68;
    }
    id v394 = v70;

    uint64_t v71 = [v436 cornerRadiusSettings];
    uint64_t v72 = (void *)v71;
    uint64_t v73 = v400;
    if (v71) {
      uint64_t v73 = (void *)v71;
    }
    id v395 = v73;

    uint64_t v74 = [v436 clippingSettings];
    long long v75 = (void *)v74;
    long long v76 = v400;
    if (v74) {
      long long v76 = (void *)v74;
    }
    id v381 = v76;

    if (kKeyboardHeightIncludingAccessory_block_invoke_onceToken != -1) {
      dispatch_once(&kKeyboardHeightIncludingAccessory_block_invoke_onceToken, &__block_literal_global_561);
    }
    long long v634 = 0u;
    long long v635 = 0u;
    long long v632 = 0u;
    long long v633 = 0u;
    id obj = [*(id *)(v468 + 40) leafAppLayouts];
    uint64_t v425 = [obj countByEnumeratingWithState:&v632 objects:v647 count:16];
    if (v425)
    {
      uint64_t v419 = *(void *)v633;
      v455 = (void (**)(id, __CFString *))(v448 + 16);
      double v383 = v421 + (0.5 - v424) * v458;
      double v378 = v390 - v404;
      do
      {
        uint64_t v77 = 0;
        do
        {
          if (*(void *)v633 != v419)
          {
            uint64_t v78 = v77;
            objc_enumerationMutation(obj);
            uint64_t v77 = v78;
          }
          uint64_t v444 = v77;
          long long v79 = *(void **)(v468 + 40);
          v456 = *(void **)(*((void *)&v632 + 1) + 8 * v77);
          long long v80 = [v456 allItems];
          long long v81 = [v80 firstObject];
          uint64_t v82 = [v79 layoutRoleForItem:v81];

          if (SBLayoutRoleMaskContainsRole(*(void *)(v468 + 48), v82))
          {
            v465 = [*(id *)(v468 + 32) _itemContainerForAppLayoutIfExists:v456];
            int v459 = [*(id *)(*(void *)(v468 + 32) + 1944) shouldPinLayoutRolesToSpace:v441];
            if (v459) {
              int v461 = [*(id *)(*(void *)(v468 + 32) + 1944) shouldUseAnchorPointToPinLayoutRolesToSpace:v441];
            }
            else {
              int v461 = 0;
            }
            long long v83 = *(void **)(*(void *)(v468 + 32) + 1944);
            uint64_t v84 = *(void *)(v468 + 40);
            SBRectWithSize();
            objc_msgSend(v83, "frameForLayoutRole:inAppLayout:withBounds:", v82, v84);
            double v447 = v85;
            double v445 = v86;
            double rect = v87;
            double v89 = v88;
            [*(id *)(*(void *)(v468 + 32) + 1944) scaleForLayoutRole:v82 inAppLayout:*(void *)(v468 + 40)];
            double v91 = v90;
            double v92 = *(void **)(*(void *)(v468 + 32) + 1944);
            uint64_t v93 = *(void *)(v468 + 40);
            SBRectWithSize();
            objc_msgSend(v92, "clippingFrameForLayoutRole:inAppLayout:atIndex:withBounds:", v82, v93, v441);
            CGFloat v418 = v94;
            CGFloat v417 = v95;
            CGFloat v416 = v96;
            CGFloat rect2 = v97;
            double v98 = 0.5 - v423;
            double v99 = 0.5 - v424;
            double v449 = v423;
            double v451 = v424;
            if (v461)
            {
              double v451 = -(v447 - v458 * v424) / v89;
              double v99 = 0.5 - v451;
              double v449 = -(v445 - v457 * v423) / rect;
              double v98 = 0.5 - v449;
            }
            int v100 = [*(id *)(v468 + 32) isChamoisWindowingUIEnabled];
            double v101 = v420 + (0.5 - v423) * v457 + v445 - v98 * rect;
            if (v100)
            {
              double v442 = v383 + v447 - v99 * v89 + (1.0 - v91) * (v89 * v99) * v426;
              double v101 = v101 + (1.0 - v91) * (rect * v98) * v426;
            }
            else
            {
              double v442 = v383 + v447 - v99 * v89;
            }
            double v443 = v101;
            double v433 = v426 * v91;
            double v102 = 0.0;
            double v434 = 0.0;
            int v103 = v459 & (v461 ^ 1);
            if (v103)
            {
              int v104 = [*(id *)(v468 + 32) isChamoisWindowingUIEnabled];
              double v105 = v426;
              if (!v104) {
                double v105 = v426 * v91;
              }
              double v106 = 1.0 - v105;
              double v434 = v89 * (-(v447 - v458 * v424) / v89 - v451) * v106;
              double v102 = rect * (-(v445 - v457 * v423) / rect - v449) * v106;
            }
            double v414 = v102;
            uint64_t v107 = [v465 layer];
            [v107 anchorPoint];
            BOOL v110 = v109 == v449 && v108 == v451;

            uint64_t v435 = v422;
            if (!v110 && v422 == 4)
            {
              uint64_t v111 = [v465 layer];
              uint64_t v112 = [v111 presentationModifiers];

              int v113 = objc_msgSend(v112, "bs_containsObjectPassingTest:", &__block_literal_global_564);
              uint64_t v114 = 4;
              if (v113) {
                uint64_t v114 = 5;
              }
              uint64_t v435 = v114;
            }
            id v115 = [v465 layer];
            v116 = [v115 presentationModifiers];

            int v117 = objc_msgSend(v116, "bs_containsObjectPassingTest:", &__block_literal_global_569);
            long long v630 = 0u;
            long long v631 = 0u;
            long long v628 = 0u;
            long long v629 = 0u;
            long long v626 = 0u;
            long long v627 = 0u;
            long long v624 = 0u;
            long long v625 = 0u;
            uint64_t v118 = [v465 layer];
            long long v119 = v118;
            if (v118)
            {
              [v118 transform];
            }
            else
            {
              long long v630 = 0u;
              long long v631 = 0u;
              long long v628 = 0u;
              long long v629 = 0u;
              long long v626 = 0u;
              long long v627 = 0u;
              long long v624 = 0u;
              long long v625 = 0u;
            }

            uint64_t v120 = v407;
            if (((v103 ^ 1 | v117) & 1) == 0)
            {
              int v121 = BSFloatEqualToFloat();
              uint64_t v120 = v407;
              if (v121)
              {
                int v122 = BSFloatEqualToFloat();
                uint64_t v120 = v407;
                if (v122)
                {
                  int v123 = BSFloatEqualToFloat();
                  uint64_t v120 = v435;
                  if (v123) {
                    uint64_t v120 = v407;
                  }
                }
              }
            }
            uint64_t v413 = v120;

            if ((v461 | v446) == 1)
            {
              long long v124 = [v465 layer];
              [v124 anchorPoint];
              if (BSFloatEqualToFloat())
              {
                long long v125 = [v465 layer];
                [v125 anchorPoint];
                char v126 = BSFloatEqualToFloat();

                if (v126) {
                  goto LABEL_121;
                }
              }
              else
              {
              }
              v453 = [v465 layer];
              [v453 position];
              double v128 = v127;
              double v130 = v129;
              [v453 bounds];
              double v132 = v131;
              double v134 = v133;
              [v453 anchorPoint];
              double v136 = v135;
              double v138 = v137;
              long long v630 = 0u;
              long long v631 = 0u;
              long long v628 = 0u;
              long long v629 = 0u;
              long long v626 = 0u;
              long long v627 = 0u;
              long long v624 = 0u;
              long long v625 = 0u;
              char v139 = v453;
              if (v453)
              {
                [v453 transform];
                char v139 = v453;
              }
              long long v622 = 0u;
              long long v623 = 0u;
              long long v620 = 0u;
              long long v621 = 0u;
              char v140 = [v139 presentationModifiers];
              uint64_t v141 = [v140 countByEnumeratingWithState:&v620 objects:v646 count:16];
              if (v141)
              {
                uint64_t v142 = *(void *)v621;
                do
                {
                  for (uint64_t i = 0; i != v141; ++i)
                  {
                    if (*(void *)v621 != v142) {
                      objc_enumerationMutation(v140);
                    }
                    long long v144 = *(void **)(*((void *)&v620 + 1) + 8 * i);
                    v145 = [v144 keyPath];
                    int v146 = [v145 isEqual:@"position"];

                    if (v146)
                    {
                      v147 = [v144 value];
                      [v147 CGPointValue];
                      double v128 = v148;
                      double v130 = v149;
                    }
                    else
                    {
                      v150 = [v144 keyPath];
                      int v151 = [v150 isEqual:@"bounds"];

                      if (v151)
                      {
                        v147 = [v144 value];
                        [v147 CGRectValue];
                        double v132 = v152;
                        double v134 = v153;
                      }
                      else
                      {
                        v154 = [v144 keyPath];
                        int v155 = [v154 isEqual:@"anchorPoint"];

                        if (v155)
                        {
                          v147 = [v144 value];
                          [v147 CGPointValue];
                          double v136 = v156;
                          double v138 = v157;
                        }
                        else
                        {
                          v158 = [v144 keyPath];
                          int v159 = [v158 isEqual:@"transform"];

                          if (!v159) {
                            continue;
                          }
                          v160 = [v144 value];
                          v147 = v160;
                          if (v160)
                          {
                            [v160 CATransform3DValue];
                          }
                          else
                          {
                            long long v644 = 0u;
                            long long v645 = 0u;
                            long long v642 = 0u;
                            long long v643 = 0u;
                            long long v640 = 0u;
                            long long v641 = 0u;
                            long long v638 = 0u;
                            long long v639 = 0u;
                          }
                          long long v628 = v642;
                          long long v629 = v643;
                          long long v630 = v644;
                          long long v631 = v645;
                          long long v624 = v638;
                          long long v625 = v639;
                          long long v626 = v640;
                          long long v627 = v641;
                        }
                      }
                    }
                  }
                  uint64_t v141 = [v140 countByEnumeratingWithState:&v620 objects:v646 count:16];
                }
                while (v141);
              }

              double v161 = *(double *)&v630;
              double v162 = *(double *)&v624;
              double v163 = *((double *)&v626 + 1);
              double v164 = 0.0;
              if (!v461) {
                double v164 = *(double *)&v630;
              }
              double v437 = v164;
              if ((unint64_t)(v435 - 3) > 0xFFFFFFFFFFFFFFFDLL)
              {
                uint64_t v173 = 2;
              }
              else
              {
                double v429 = *(double *)&v624;
                double v431 = *((double *)&v626 + 1);
                long long v618 = 0u;
                long long v619 = 0u;
                long long v616 = 0u;
                long long v617 = 0u;
                id v439 = [v453 presentationModifiers];
                uint64_t v165 = [v439 countByEnumeratingWithState:&v616 objects:v637 count:16];
                if (v165)
                {
                  uint64_t v166 = *(void *)v617;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v165; ++j)
                    {
                      if (*(void *)v617 != v166) {
                        objc_enumerationMutation(v439);
                      }
                      v168 = *(void **)(*((void *)&v616 + 1) + 8 * j);
                      v169 = [v168 keyPath];
                      if ([v169 isEqualToString:@"position"]) {
                        goto LABEL_113;
                      }
                      v170 = [v168 keyPath];
                      if ([v170 isEqualToString:@"bounds"])
                      {

LABEL_113:
LABEL_114:
                        uint64_t v173 = v435;
                        goto LABEL_115;
                      }
                      v171 = [v168 keyPath];
                      char v172 = [v171 isEqualToString:@"transform"];

                      if (v172) {
                        goto LABEL_114;
                      }
                    }
                    uint64_t v165 = [v439 countByEnumeratingWithState:&v616 objects:v637 count:16];
                    uint64_t v173 = 2;
                    if (v165) {
                      continue;
                    }
                    break;
                  }
                }
                else
                {
                  uint64_t v173 = 2;
                }
LABEL_115:

                int v174 = v459;
                if (v173 == v435) {
                  int v174 = 1;
                }
                if (!v174) {
                  uint64_t v173 = v435;
                }
                double v163 = v431;
                double v162 = v429;
              }
              double v175 = v134 * v163;
              double v176 = v130 - v175 * v138;
              double v177 = v161 + v128 - v132 * v162 * v136 + v451 * (v132 * v162);
              double v178 = v176 + v449 * v175;
              v179 = (void *)MEMORY[0x1E4F42FF0];
              v608[0] = MEMORY[0x1E4F143A8];
              v608[1] = 3221225472;
              v608[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_5;
              v608[3] = &unk_1E6AFA318;
              id v180 = v465;
              double v611 = v451;
              double v612 = v449;
              double v613 = v177;
              double v614 = v178;
              double v615 = v437;
              uint64_t v181 = *(void *)(v468 + 32);
              id v609 = v180;
              uint64_t v610 = v181;
              objc_msgSend(v179, "sb_animateWithSettings:mode:animations:completion:", v402, v173, v608, 0);
            }
LABEL_121:
            objc_msgSend(*(id *)(*(void *)(v468 + 32) + 1944), "cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:", v82, *(void *)(v468 + 40), v399, v398, v397, v396);
            uint64_t v432 = v182;
            uint64_t v430 = v183;
            uint64_t v428 = v184;
            uint64_t v427 = v185;
            uint64_t v411 = [*(id *)(*(void *)(v468 + 32) + 1944) maskedCornersForLayoutRole:v82 inAppLayout:*(void *)(v468 + 40) withMaskedCorners:v393];
            unsigned int v186 = [*(id *)(*(void *)(v468 + 32) + 1944) isLayoutRoleBlurred:v82 inAppLayout:*(void *)(v468 + 40)];
            uint64_t v187 = [*(id *)(*(void *)(v468 + 32) + 1944) blurTargetPreferenceForLayoutRole:v82 inAppLayout:*(void *)(v468 + 40)];
            unsigned int v412 = [*(id *)(*(void *)(v468 + 32) + 1944) canLayoutRoleParticipateInSwitcherDragAndDrop:v82 appLayout:*(void *)(v468 + 40)];
            uint64_t v188 = [*(id *)(*(void *)(v468 + 32) + 1944) isLayoutRoleDraggable:v82 inAppLayout:*(void *)(v468 + 40)];
            unsigned int v403 = [*(id *)(*(void *)(v468 + 32) + 1944) shouldUseNonuniformSnapshotScalingForLayoutRole:v82 inAppLayout:*(void *)(v468 + 40)];
            [*(id *)(*(void *)(v468 + 32) + 1944) blurDelayForLayoutRole:v82 inAppLayout:*(void *)(v468 + 40)];
            double v190 = v189;
            [*(id *)(*(void *)(v468 + 32) + 1944) blurViewIconScaleForIndex:v441];
            double v192 = v191;
            [*(id *)(*(void *)(v468 + 32) + 1944) contentViewOffsetForLayoutRole:v82 inAppLayout:*(void *)(v468 + 40)];
            uint64_t v410 = v193;
            uint64_t v409 = v194;
            double v195 = 0.5;
            if ([*(id *)(*(void *)(v468 + 32) + 1944) shouldTetherItemsAndAccessoriesInAppLayout:*(void *)(v468 + 40)])double v195 = (v458 * 0.5 - v447) / v89; {
            v607[0] = MEMORY[0x1E4F143A8];
            }
            v607[1] = 3221225472;
            v607[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_8;
            v607[3] = &unk_1E6AF4AC0;
            v607[4] = *(void *)(v468 + 32);
            id v440 = (id)MEMORY[0x1D948C7A0](v607);
            v606[0] = MEMORY[0x1E4F143A8];
            v606[1] = 3221225472;
            v606[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_9;
            v606[3] = &unk_1E6AF4AC0;
            v606[4] = *(void *)(v468 + 32);
            v438 = (void *)MEMORY[0x1D948C7A0](v606);
            v460 = [*(id *)(*(void *)(v468 + 32) + 1880) objectForKey:v456];
            if (v460) {
              unsigned int v196 = v186;
            }
            else {
              unsigned int v196 = 0;
            }
            if (v187 == 1) {
              uint64_t v197 = 0;
            }
            else {
              uint64_t v197 = v196;
            }
            [v465 bounds];
            if (v89 == v200 && (double v198 = rect, rect == v199))
            {
              v408 = 0;
            }
            else
            {
              v201 = objc_msgSend(*(id *)(*(void *)(v468 + 32) + 1944), "resizeProgressNotificationsForLayoutRole:inAppLayout:", v82, *(void *)(v468 + 40), v198);
              if ([v201 count])
              {
                v202 = *(void **)(v468 + 32);
                v203 = self;
                v408 = [v202 _animatablePropertyWithNotifications:v201 progressEventType:v203];
              }
              else
              {
                v408 = 0;
              }
            }
            objc_msgSend(v465, "center", v198);
            double v205 = v204;
            double v207 = v206;
            UIRectGetCenter();
            if (v205 == v209 && v207 == v208)
            {
              v210 = 0;
            }
            else
            {
              v211 = [*(id *)(*(void *)(v468 + 32) + 1944) repositionProgressNotificationsForLayoutRole:v82 inAppLayout:*(void *)(v468 + 40)];
              if ([v211 count])
              {
                v212 = *(void **)(v468 + 32);
                v213 = self;
                v210 = [v212 _animatablePropertyWithNotifications:v211 progressEventType:v213];
              }
              else
              {
                v210 = 0;
              }
            }
            if (v446) {
              uint64_t v214 = [*(id *)(v468 + 32) _appLayoutRequiresLegacyRotationSupport:*(void *)(v468 + 40)];
            }
            else {
              uint64_t v214 = 0;
            }
            [v465 setShouldScaleOverlayToFillBounds:v387];
            [v465 setPositionAnimationsBeginFromModelState:v446];
            [v465 setTransformAnimationsAreLegacyCounterRotations:v214];
            v454 = [v465 contentView];
            if (objc_opt_respondsToSelector()) {
              [v454 setShouldStretchToBounds:v379];
            }
            if (objc_opt_respondsToSelector()) {
              [v454 setUsesNonuniformScaling:v403];
            }
            [v465 setDraggable:v188];
            [v465 setSupportsSwitcherDragAndDrop:v412];
            if (v460)
            {
              [v460 setLiveContentBlurEnabled:v197 duration:v440 blurDelay:v438 iconViewScale:0.25 began:v190 completion:v192];
              [*(id *)(v468 + 32) _applyOcclusionStateToLiveContentOverlay:v460 forLayoutRole:v82 inAppLayout:*(void *)(v468 + 40)];
            }
            [v465 setBlurred:v186 & (v197 ^ 1) duration:v440 blurDelay:v438 iconViewScale:0.25 began:v190 completion:v192];
            uint64_t v215 = [*(id *)(*(void *)(v468 + 32) + 1944) shouldAllowGroupOpacityForAppLayout:*(void *)(v468 + 40)];
            v216 = [v465 layer];
            [v216 setAllowsGroupOpacity:v215];

            v217 = (*((void (**)(char *, __CFString *))v448 + 2))(v448, @"center");
            uint64_t v218 = MEMORY[0x1E4F143A8];
            v219 = (void *)MEMORY[0x1E4F42FF0];
            v595[0] = MEMORY[0x1E4F143A8];
            v595[1] = 3221225472;
            v595[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_10;
            v595[3] = &unk_1E6AFA3B0;
            char v604 = v461;
            char v605 = v446;
            id v220 = v465;
            id v596 = v220;
            double v598 = v451;
            double v599 = v449;
            double v600 = v442;
            double v601 = v443;
            double v602 = v89;
            double v603 = rect;
            id v597 = v210;
            v592[0] = v218;
            v592[1] = 3221225472;
            v592[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_11;
            v592[3] = &unk_1E6AFA340;
            id v450 = v597;
            id v593 = v450;
            id v452 = v217;
            id v594 = v452;
            objc_msgSend(v219, "sb_animateWithSettings:mode:animations:completion:", v402, v435, v595, v592);
            [v220 setMaskedCorners:v411];
            v221 = (*((void (**)(char *, __CFString *))v448 + 2))(v448, @"corner radius");
            uint64_t v222 = MEMORY[0x1E4F143A8];
            v223 = (void *)MEMORY[0x1E4F42FF0];
            v586[0] = MEMORY[0x1E4F143A8];
            v586[1] = 3221225472;
            v586[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_12;
            v586[3] = &unk_1E6AF8568;
            id v224 = v220;
            id v587 = v224;
            uint64_t v588 = v432;
            uint64_t v589 = v430;
            uint64_t v590 = v428;
            uint64_t v591 = v427;
            v584[0] = v222;
            v584[1] = 3221225472;
            v584[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_13;
            v584[3] = &unk_1E6AFA3D8;
            id v462 = v221;
            id v585 = v462;
            objc_msgSend(v223, "sb_animateWithSettings:mode:animations:completion:", v395, v389, v586, v584);
            v225 = [*(id *)(v468 + 40) leafAppLayouts];
            LODWORD(v223) = (unint64_t)[v225 count] > 1;

            double v226 = v390;
            double v227 = v404;
            if (v223)
            {
              v653.origin.CGFloat x = v447;
              v653.origin.CGFloat y = v445;
              v653.size.double width = v89;
              v653.size.double height = rect;
              double MinX = CGRectGetMinX(v653);
              v654.origin.CGFloat x = v421;
              v654.origin.CGFloat y = v420;
              v654.size.double width = v458;
              v654.size.double height = v457;
              double Width = CGRectGetWidth(v654);
              v655.origin.CGFloat x = v447;
              v655.origin.CGFloat y = v445;
              v655.size.double width = v89;
              v655.size.double height = rect;
              double v230 = CGRectGetMaxX(v655);
              v656.origin.CGFloat x = v421;
              v656.origin.CGFloat y = v420;
              v656.size.double width = v458;
              v656.size.double height = v457;
              double v227 = v404 + v378 * MinX / Width;
              double v226 = v404 + v378 * v230 / CGRectGetWidth(v656);
            }
            uint64_t v231 = [v436 opacityUpdateMode];
            if (!v231) {
              uint64_t v231 = [v436 updateMode];
            }
            v232 = [v436 opacitySettings];
            v233 = v232;
            if (v232)
            {
              id v466 = v232;
            }
            else
            {
              id v466 = [v436 layoutSettings];
            }
            v234 = (void *)MEMORY[0x1E4F42FF0];
            v579[0] = MEMORY[0x1E4F143A8];
            v579[1] = 3221225472;
            v579[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_14;
            v579[3] = &unk_1E6AFA400;
            id v235 = v224;
            id v580 = v235;
            char v583 = v386;
            double v581 = v226;
            double v582 = v227;
            v236 = (*((void (**)(char *, __CFString *))v448 + 2))(v448, @"wallpaperGradientAttributes");
            objc_msgSend(v234, "sb_animateWithSettings:mode:animations:completion:", v466, v231, v579, v236);

            if (![*(id *)(v468 + 32) isJindoEnabled]) {
              goto LABEL_179;
            }
            v237 = [v235 layer];
            v238 = [v237 valueForKey:@"meshTransform"];
            if (v238) {
              BOOL v239 = 1;
            }
            else {
              BOOL v239 = v406 == 0;
            }
            int v240 = !v239;

            v241 = [v235 layer];
            v242 = [v241 presentationModifiers];
            int v243 = objc_msgSend(v242, "bs_containsObjectPassingTest:", &__block_literal_global_602);

            if ((v240 | v243) == 1)
            {
              v244 = [*(id *)(*(void *)(v468 + 32) + 1944) identityMeshTransformForIndex:v441];
              if (!v240)
              {
LABEL_168:
                if (v406) {
                  int v245 = 0;
                }
                else {
                  int v245 = v243;
                }
                if (v245 == 1) {
                  id v406 = v244;
                }
LABEL_175:
                v247 = [v436 meshSettings];
                v248 = v247;
                if (v247)
                {
                  id v249 = v247;
                }
                else
                {
                  id v249 = [v436 layoutSettings];
                }
                v250 = (void *)MEMORY[0x1E4F42FF0];
                v573[0] = MEMORY[0x1E4F143A8];
                v573[1] = 3221225472;
                v573[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_17;
                v573[3] = &unk_1E6AF5290;
                id v574 = v235;
                id v406 = v406;
                id v575 = v406;
                v251 = (*((void (**)(char *, __CFString *))v448 + 2))(v448, @"mesh transform");
                objc_msgSend(v250, "sb_animateWithSettings:mode:animations:completion:", v249, v382, v573, v251);

LABEL_179:
                v554[0] = MEMORY[0x1E4F143A8];
                v554[1] = 3221225472;
                v554[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_18;
                v554[3] = &unk_1E6AFA450;
                v252 = v448;
                v558 = v252;
                id v555 = v400;
                uint64_t v559 = v388;
                id v253 = v235;
                id v556 = v253;
                double v560 = v442;
                double v561 = v443;
                double v562 = v89;
                double v563 = rect;
                double v564 = v195;
                uint64_t v565 = 0x3FE0000000000000;
                uint64_t v566 = v410;
                uint64_t v567 = v409;
                double v568 = v421;
                double v569 = v420;
                double v570 = v458;
                double v571 = v457;
                uint64_t v572 = v385;
                id recta = v408;
                id v557 = recta;
                uint64_t v254 = MEMORY[0x1D948C7A0](v554);
                v255 = (void *)v254;
                if (v214) {
                  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v254];
                }
                else {
                  (*(void (**)(uint64_t))(v254 + 16))(v254);
                }
                int v256 = [v253 isContentClippingEnabled];
                if (v256)
                {
                  [v253 contentClippingFrame];
                  v658.origin.CGFloat x = v418;
                  v658.origin.CGFloat y = v417;
                  v658.size.double width = v416;
                  v658.size.double height = rect2;
                  BOOL v257 = !CGRectEqualToRect(v657, v658);
                }
                else
                {
                  BOOL v257 = 0;
                }
                if ((v405 ^ v256 | v257) == 1)
                {
                  [v253 setContentClippingEnabled:v405];
                  v258 = (*v455)(v252, @"clipping");
                  uint64_t v259 = MEMORY[0x1E4F143A8];
                  v260 = (void *)MEMORY[0x1E4F42FF0];
                  v544[0] = MEMORY[0x1E4F143A8];
                  v544[1] = 3221225472;
                  v544[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_21;
                  v544[3] = &unk_1E6AFA478;
                  id v545 = v253;
                  CGFloat v546 = v418;
                  CGFloat v547 = v417;
                  CGFloat v548 = v416;
                  CGFloat v549 = rect2;
                  uint64_t v550 = v432;
                  uint64_t v551 = v430;
                  uint64_t v552 = v428;
                  uint64_t v553 = v427;
                  v541[0] = v259;
                  v541[1] = 3221225472;
                  v541[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_22;
                  v541[3] = &unk_1E6AF5268;
                  v541[4] = *(void *)(v468 + 32);
                  uint64_t v543 = v380;
                  id v261 = v258;
                  id v542 = v261;
                  objc_msgSend(v260, "sb_animateWithSettings:mode:animations:completion:", v381, v380, v544, v541);
                }
                v262 = (void *)MEMORY[0x1E4F42FF0];
                v531[0] = MEMORY[0x1E4F143A8];
                v531[1] = 3221225472;
                v531[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_23;
                v531[3] = &unk_1E6AFA4A0;
                id v263 = v253;
                id v532 = v263;
                double v534 = v433;
                double v535 = v434;
                double v536 = v414;
                uint64_t v537 = v384;
                double v538 = v391;
                double v539 = v392;
                double v540 = v192;
                id v264 = v460;
                id v533 = v264;
                v265 = (*v455)(v252, @"transform and content page view scale");
                objc_msgSend(v262, "sb_animateWithSettings:mode:animations:completion:", v394, v413, v531, v265);

                if ([*(id *)(*(void *)(v468 + 32) + 1072) shouldRedactWindowContents])
                {
                  v266 = [*(id *)(v468 + 32) appLayoutContainingAppLayout:v456];
                  v267 = [v456 allItems];
                  v268 = [v267 firstObject];
                  uint64_t v269 = [v266 layoutRoleForItem:v268];

                  if (v269 == 1)
                  {
                    uint64_t v270 = [MEMORY[0x1E4F428B8] systemBlueColor];
                  }
                  else if (v269 == 2)
                  {
                    uint64_t v270 = [MEMORY[0x1E4F428B8] systemGreenColor];
                  }
                  else if (v269 == 5)
                  {
                    uint64_t v270 = [MEMORY[0x1E4F428B8] systemRedColor];
                  }
                  else
                  {
                    if (v269 == 6) {
                      [MEMORY[0x1E4F428B8] systemPurpleColor];
                    }
                    else {
                    uint64_t v270 = [MEMORY[0x1E4F428B8] blackColor];
                    }
                  }
                  v282 = (void *)v270;
                  v283 = [v263 contentView];
                  v284 = [v283 layer];
                  id v285 = v282;
                  objc_msgSend(v284, "setBorderColor:", objc_msgSend(v285, "CGColor"));

                  v286 = [v263 contentView];
                  v287 = [v286 layer];
                  v288 = (id *)(v468 + 32);
                  v289 = [*(id *)(v468 + 32) view];
                  [v289 bounds];
                  double v291 = v290;

                  v292 = [*(id *)(v468 + 32) view];
                  [v292 bounds];
                  double v294 = v293;

                  if (v291 >= v294) {
                    double v295 = v291;
                  }
                  else {
                    double v295 = v294;
                  }
                  [v287 setBorderWidth:v295];

                  v296 = [v263 contentOverlay];
                  objc_msgSend(v296, "bs_setHitTestingDisabled:", 1);

                  v297 = [v263 contentOverlay];
                  v298 = [v297 layer];
                  id v280 = v285;
                  objc_msgSend(v298, "setBorderColor:", objc_msgSend(v280, "CGColor"));

                  v281 = [v263 contentOverlay];
                  v299 = [v281 layer];
                  v300 = [*v288 view];
                  [v300 bounds];
                  double v302 = v301;

                  v303 = [*v288 view];
                  [v303 bounds];
                  double v305 = v304;

                  if (v302 >= v305) {
                    double v306 = v302;
                  }
                  else {
                    double v306 = v305;
                  }
                  [v299 setBorderWidth:v306];
                }
                else
                {
                  v271 = [v263 contentView];
                  v272 = [v271 layer];
                  id v273 = [MEMORY[0x1E4F428B8] clearColor];
                  objc_msgSend(v272, "setBorderColor:", objc_msgSend(v273, "CGColor"));

                  v274 = [v263 contentView];
                  v275 = [v274 layer];
                  [v275 setBorderWidth:0.0];

                  v276 = [v263 contentOverlay];
                  objc_msgSend(v276, "bs_setHitTestingDisabled:", 0);

                  v277 = [v263 contentOverlay];
                  v278 = [v277 layer];
                  id v279 = [MEMORY[0x1E4F428B8] clearColor];
                  objc_msgSend(v278, "setBorderColor:", objc_msgSend(v279, "CGColor"));

                  id v280 = [v263 contentOverlay];
                  v281 = [v280 layer];
                  [v281 setBorderWidth:0.0];
                }

                goto LABEL_207;
              }
            }
            else
            {
              v244 = 0;
              if (!v240) {
                goto LABEL_168;
              }
            }
            v246 = (void *)MEMORY[0x1E4F42FF0];
            v576[0] = MEMORY[0x1E4F143A8];
            v576[1] = 3221225472;
            v576[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_16;
            v576[3] = &unk_1E6AF5290;
            id v577 = v235;
            id v578 = v244;
            [v246 performWithoutAnimation:v576];

            goto LABEL_175;
          }
LABEL_207:
          uint64_t v77 = v444 + 1;
        }
        while (v444 + 1 != v425);
        uint64_t v425 = [obj countByEnumeratingWithState:&v632 objects:v647 count:16];
      }
      while (v425);
    }

    *(void *)&long long v624 = 0;
    *((void *)&v624 + 1) = &v624;
    *(void *)&long long v625 = 0x2020000000;
    BYTE8(v625) = 1;
    v527[0] = MEMORY[0x1E4F143A8];
    v527[1] = 3221225472;
    v527[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_24;
    v527[3] = &unk_1E6AFA4C8;
    id v528 = *(id *)(v468 + 40);
    v529 = &v624;
    uint64_t v530 = *(void *)(v468 + 48);
    SBLayoutRoleEnumerateValidRoles(v527);
    if (!*(void *)(v468 + 48) || *(unsigned char *)(*((void *)&v624 + 1) + 24))
    {
      v307 = [*(id *)(*(void *)(v468 + 32) + 1840) objectForKey:*(void *)(v468 + 40)];
      v308 = [*(id *)(*(void *)(v468 + 32) + 1848) objectForKey:*(void *)(v468 + 40)];
      v309 = [*(id *)(*(void *)(v468 + 32) + 1008) objectForKey:*(void *)(v468 + 40)];
      v310 = [v307 layer];
      [v310 anchorPoint];
      BOOL v312 = v311 == v424;
      if (v313 != v423) {
        BOOL v312 = 0;
      }
      char v314 = v422 != 4 || v312;

      if ((v314 & 1) == 0)
      {
        v315 = [v307 layer];
        v316 = [v315 presentationModifiers];

        int v317 = objc_msgSend(v316, "bs_containsObjectPassingTest:", &__block_literal_global_626);
        uint64_t v318 = 4;
        if (v317) {
          uint64_t v318 = 5;
        }
        uint64_t v422 = v318;
      }
      uint64_t v319 = v468;
      objc_msgSend(*(id *)(*(void *)(v468 + 32) + 1944), "adjustedSpaceAccessoryViewFrame:forAppLayout:", *(void *)(v468 + 40), v421, v420, v458, v457);
      uint64_t v321 = v320;
      uint64_t v323 = v322;
      uint64_t v325 = v324;
      uint64_t v327 = v326;
      objc_msgSend(*(id *)(*(void *)(v319 + 32) + 1944), "adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:", *(void *)(v319 + 40), v424, v423);
      uint64_t v329 = v328;
      uint64_t v331 = v330;
      [*(id *)(*(void *)(v319 + 32) + 1944) adjustedSpaceAccessoryViewScale:*(void *)(v319 + 40) forAppLayout:v426];
      double v467 = v332;
      if ((BSFloatIsZero() & 1) == 0) {
        double v392 = v392 * (v467 / v426);
      }
      v333 = (void *)MEMORY[0x1E4F42FF0];
      v518[0] = MEMORY[0x1E4F143A8];
      v518[1] = 3221225472;
      v518[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_26;
      v518[3] = &unk_1E6AFA4F0;
      id v334 = v307;
      id v519 = v334;
      uint64_t v521 = v329;
      uint64_t v522 = v331;
      uint64_t v523 = v321;
      uint64_t v524 = v323;
      uint64_t v525 = v325;
      uint64_t v526 = v327;
      id v335 = v308;
      id v520 = v335;
      v336 = (*((void (**)(char *, __CFString *))v448 + 2))(v448, @"accessory center");
      objc_msgSend(v333, "sb_animateWithSettings:mode:animations:completion:", v402, v422, v518, v336);

      [v335 setMaskedCorners:v393];
      [v334 setMaskedCorners:v393];
      v337 = (void *)MEMORY[0x1E4F42FF0];
      v511[0] = MEMORY[0x1E4F143A8];
      v511[1] = 3221225472;
      v511[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_27;
      v511[3] = &unk_1E6AF6D10;
      double v514 = v399;
      double v515 = v398;
      double v516 = v397;
      double v517 = v396;
      id v338 = v335;
      id v512 = v338;
      id v339 = v334;
      id v513 = v339;
      v340 = (*((void (**)(char *, __CFString *))v448 + 2))(v448, @"accessory corner radius");
      objc_msgSend(v337, "sb_animateWithSettings:mode:animations:completion:", v395, v389, v511, v340);

      v341 = (void *)MEMORY[0x1E4F42FF0];
      v496[0] = MEMORY[0x1E4F143A8];
      v496[1] = 3221225472;
      v496[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_28;
      v496[3] = &unk_1E6AFA518;
      id v342 = v309;
      id v497 = v342;
      uint64_t v500 = v367;
      id v343 = v339;
      id v498 = v343;
      uint64_t v501 = v321;
      uint64_t v502 = v323;
      uint64_t v503 = v325;
      uint64_t v504 = v327;
      uint64_t v505 = v369;
      uint64_t v506 = v368;
      id v344 = v338;
      id v499 = v344;
      double v507 = MaxX;
      CGFloat v508 = MinY;
      double v509 = v377;
      CGFloat v510 = Height;
      v345 = (*((void (**)(char *, __CFString *))v448 + 2))(v448, @"accessory bounds");
      objc_msgSend(v341, "sb_animateWithSettings:mode:animations:completion:", v400, v388, v496, v345);

      [v343 setContentClippingEnabled:v405];
      [v344 setContentClippingEnabled:v405];
      v346 = (void *)MEMORY[0x1E4F42FF0];
      v485[0] = MEMORY[0x1E4F143A8];
      v485[1] = 3221225472;
      v485[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_29;
      v485[3] = &unk_1E6AFA540;
      id v347 = v343;
      id v486 = v347;
      uint64_t v488 = v376;
      uint64_t v489 = v375;
      uint64_t v490 = v374;
      uint64_t v491 = v373;
      double v492 = v399;
      double v493 = v398;
      double v494 = v397;
      double v495 = v396;
      id v348 = v344;
      id v487 = v348;
      v349 = (*((void (**)(char *, __CFString *))v448 + 2))(v448, @"accessory clipping");
      objc_msgSend(v346, "sb_animateWithSettings:mode:animations:completion:", v381, v380, v485, v349);

      v350 = (void *)MEMORY[0x1E4F42FF0];
      v472[0] = MEMORY[0x1E4F143A8];
      v472[1] = 3221225472;
      v472[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_30;
      v472[3] = &unk_1E6AFA568;
      id v351 = v347;
      double v476 = v467;
      double v477 = v391;
      uint64_t v478 = v366;
      uint64_t v352 = *(void *)(v468 + 32);
      id v473 = v351;
      uint64_t v474 = v352;
      CATransform3D v479 = v636;
      uint64_t v480 = v321;
      uint64_t v481 = v323;
      uint64_t v482 = v325;
      uint64_t v483 = v327;
      double v484 = v392;
      id v353 = v348;
      id v475 = v353;
      v354 = (*((void (**)(char *, __CFString *))v448 + 2))(v448, @"accessory transform and content page view scale");
      objc_msgSend(v350, "sb_animateWithSettings:mode:animations:completion:", v394, v407, v472, v354);

      v355 = (void *)MEMORY[0x1E4F42FF0];
      uint64_t v356 = kKeyboardHeightIncludingAccessory_block_invoke_keyboardHeightSettings;
      v469[0] = MEMORY[0x1E4F143A8];
      v469[1] = 3221225472;
      v469[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_31;
      v469[3] = &unk_1E6AF5290;
      id v357 = v353;
      uint64_t v358 = *(void *)(v468 + 32);
      id v470 = v357;
      uint64_t v471 = v358;
      v359 = (*((void (**)(char *, __CFString *))v448 + 2))(v448, @"accessory keyboard height");
      objc_msgSend(v355, "sb_animateWithSettings:mode:animations:completion:", v356, 3, v469, v359);

      double v360 = v399;
      *(double *)&long long v638 = v399;
      *((double *)&v638 + 1) = v396;
      uint64_t v361 = 8;
      *(double *)&long long v639 = v398;
      *((double *)&v639 + 1) = v397;
      do
      {
        if (v360 < *(double *)((char *)&v638 + v361)) {
          double v360 = *(double *)((char *)&v638 + v361);
        }
        v361 += 8;
      }
      while (v361 != 32);
      v362 = [*(id *)(v468 + 32) appLayouts];
      uint64_t v363 = [v362 indexOfObject:*(void *)(v468 + 40)];

      if (v363 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v364 = *(void **)(v468 + 32);
        v365 = (*((void (**)(char *, __CFString *))v448 + 2))(v448, @"item container backdrop");
        [v364 _updateItemContainerBackdropPresenceForIndex:v441 scale:v436 rotation:v365 cornerRadius:v467 animationAttributes:v391 completion:v360];
      }
    }

    _Block_object_dispose(&v624, 8);
  }
}

- (void)_updateStatusBarAndHomeGrabberVisibilityForAppLayout:(id)a3 animated:(BOOL)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v33 = a3;
  id obj = [v33 leafAppLayouts];
  uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v39;
    long long v28 = v35;
    double v8 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
    uint64_t v29 = *(void *)v39;
    do
    {
      uint64_t v9 = 0;
      uint64_t v31 = v6;
      do
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
        double v11 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v8[48]), "objectForKey:", v10, v28);
        if (v11)
        {
          double v12 = [(SBFluidSwitcherViewController *)self appLayouts];
          uint64_t v13 = [v12 indexOfObject:v33];

          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          {
            double v14 = [(SBFluidSwitcherViewController *)self dataSource];
            double v15 = v14;
            if ((*((unsigned char *)&self->_dataSourceRespondsTo + 1) & 0x40) != 0) {
              unsigned int v16 = [v14 isInAppStatusBarRequestedHiddenForSwitcherContentController:self];
            }
            else {
              unsigned int v16 = 0;
            }
            double v17 = [v10 allItems];
            double v18 = [v17 firstObject];
            uint64_t v19 = [v33 layoutRoleForItem:v18];

            LODWORD(v13) = [(SBSwitcherModifier *)self->_rootModifier isContentStatusBarVisibleForIndex:v13] ^ 1;
            char v20 = [(SBSwitcherModifier *)self->_rootModifier hiddenContentStatusBarPartsForLayoutRole:v19 inAppLayout:v33];
            if ((v20 & 0xA) != 0) {
              int v21 = 1;
            }
            else {
              int v21 = v13;
            }
            if ((v20 & 4) != 0)
            {
              int v21 = v13;
              uint64_t v13 = 1;
            }
            else
            {
              uint64_t v13 = v13;
            }
            uint64_t v22 = v21 | v16;
            uint64_t v23 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
            uint64_t v24 = v23;
            if (v22) {
              [v23 statusBarFadeOutSettings];
            }
            else {
            uint64_t v25 = [v23 statusBarFadeInSettings];
            }
            uint64_t v7 = v29;

            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v35[0] = __95__SBFluidSwitcherViewController__updateStatusBarAndHomeGrabberVisibilityForAppLayout_animated___block_invoke;
            v35[1] = &unk_1E6AFA940;
            BOOL v37 = a4;
            id v36 = v25;
            id v26 = v25;
            uint64_t v27 = (void *)MEMORY[0x1D948C7A0](v34);
            [v11 setStatusBarHidden:v22 nubViewHidden:v13 animator:v27];

            uint64_t v6 = v31;
            double v8 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
          }
        }

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v6);
  }
}

- (void)_updateContinuousExposeStripsCaptureOnlyBackdropLayer
{
  int v3 = [(SBSwitcherModifier *)self->_rootModifier shouldUseWallpaperGradientTreatment];
  continuousExposeStripCaptureAndBlurHomeScreenBackdropView = self->_continuousExposeStripCaptureAndBlurHomeScreenBackdropView;
  if (v3)
  {
    if (continuousExposeStripCaptureAndBlurHomeScreenBackdropView) {
      return;
    }
    uint64_t v5 = (_UIBackdropView *)[objc_alloc(MEMORY[0x1E4F430A8]) initWithPrivateStyle:-2];
    uint64_t v6 = self->_continuousExposeStripCaptureAndBlurHomeScreenBackdropView;
    self->_continuousExposeStripCaptureAndBlurHomeScreenBackdropView = v5;

    uint64_t v13 = [(_UIBackdropView *)self->_continuousExposeStripCaptureAndBlurHomeScreenBackdropView inputSettings];
    [(_UIBackdropView *)v13 setScale:0.1];
    [(_UIBackdropView *)v13 setBlurRadius:50.0];
    [(_UIBackdropView *)v13 setBackdropVisible:1];
    [(_UIBackdropView *)self->_continuousExposeStripCaptureAndBlurHomeScreenBackdropView setGroupName:@"AppSwitcherWallpaperGradient"];
    uint64_t v7 = objc_opt_class();
    double v8 = [(_UIBackdropView *)self->_continuousExposeStripCaptureAndBlurHomeScreenBackdropView effectView];
    uint64_t v9 = [v8 layer];
    double v10 = SBSafeCast(v7, v9);

    [v10 setCaptureOnly:1];
    [(SBFluidSwitcherContentView *)self->_contentView addSubview:self->_continuousExposeStripCaptureAndBlurHomeScreenBackdropView];
    [(SBFluidSwitcherViewController *)self _ensureSubviewOrdering];
    double v11 = [(SBFluidSwitcherViewController *)self view];
    [v11 setNeedsLayout];

    double v12 = v13;
  }
  else
  {
    if (!continuousExposeStripCaptureAndBlurHomeScreenBackdropView) {
      return;
    }
    [(_UIBackdropView *)continuousExposeStripCaptureAndBlurHomeScreenBackdropView removeFromSuperview];
    double v12 = self->_continuousExposeStripCaptureAndBlurHomeScreenBackdropView;
    self->_continuousExposeStripCaptureAndBlurHomeScreenBackdropView = 0;
  }
}

void __92__SBFluidSwitcherViewController__orderedViewsForLayoutElement_excludeSwitcherHostedShelves___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "leafAppLayoutForItem:");
  if (v4)
  {
    double v8 = v4;
    uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 1832) objectForKey:v4];
    if (v5)
    {
      uint64_t v6 = *(void **)(a1 + 48);
      uint64_t v7 = [NSNumber numberWithInteger:a2];
      [v6 setObject:v5 forKey:v7];
    }
    uint64_t v4 = v8;
  }
}

- (double)separatorViewWidth
{
  return 10.0;
}

void __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_18(uint64_t a1)
{
  id v2 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  int v3 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v4 = *(void *)(a1 + 64);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_19;
  v13[3] = &unk_1E6AFA428;
  uint64_t v5 = *(void *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 88);
  long long v16 = *(_OWORD *)(a1 + 72);
  long long v17 = v6;
  long long v7 = *(_OWORD *)(a1 + 120);
  long long v18 = *(_OWORD *)(a1 + 104);
  long long v19 = v7;
  long long v8 = *(_OWORD *)(a1 + 152);
  long long v20 = *(_OWORD *)(a1 + 136);
  long long v21 = v8;
  uint64_t v22 = *(void *)(a1 + 168);
  id v15 = *(id *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_20;
  v10[3] = &unk_1E6AFA340;
  id v11 = *(id *)(a1 + 48);
  id v12 = v2;
  id v9 = v2;
  objc_msgSend(v3, "sb_animateWithSettings:mode:animations:completion:", v5, v4, v13, v10);
}

- (BOOL)isJindoEnabled
{
  BOOL v2 = 1;
  uint64_t v3 = SBFEffectiveArtworkSubtype();
  if (v3 > 2795)
  {
    if (v3 != 2796 && v3 != 2868) {
      return 0;
    }
  }
  else if (v3 != 2556 && v3 != 2622)
  {
    return 0;
  }
  return v2;
}

uint64_t __76__SBFluidSwitcherViewController__applyStyleToAppLayout_roleMask_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setTitleOpacity:*(double *)(a1 + 48)];
  [*(id *)(a1 + 40) setTitleOpacity:*(double *)(a1 + 48)];
  BOOL v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 56);
  return [v2 setTitleAndIconOpacity:v3];
}

uint64_t __70__SBFluidSwitcherViewController__updateVisibleOverlayAndUnderlayViews__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_19(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  SBRectWithSize();
  objc_msgSend(v2, "setBounds:");
  objc_msgSend(*(id *)(a1 + 32), "setPageViewAnchorPoint:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "setPageViewOffset:", *(double *)(a1 + 96), *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 32), "setSizeForContainingSpace:", *(double *)(a1 + 128), *(double *)(a1 + 136));
  [*(id *)(a1 + 32) setMinimumTranslationForKillingContainer:*(double *)(a1 + 144)];
  [*(id *)(a1 + 32) layoutIfNeeded];
  double v3 = *(void **)(a1 + 40);
  return [v3 setValue:1.0];
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_28(uint64_t a1)
{
  [*(id *)(a1 + 32) setMultiWindowIndicatorRoleMask:*(void *)(a1 + 56)];
  BOOL v2 = *(void **)(a1 + 40);
  SBRectWithSize();
  objc_msgSend(v2, "setBounds:");
  objc_msgSend(*(id *)(a1 + 40), "setContentViewOffset:", *(double *)(a1 + 96), *(double *)(a1 + 104));
  [*(id *)(a1 + 40) layoutIfNeeded];
  double v3 = *(void **)(a1 + 48);
  SBRectWithSize();
  objc_msgSend(v3, "setBounds:");
  objc_msgSend(*(id *)(a1 + 48), "setContentViewOffset:", *(double *)(a1 + 96), *(double *)(a1 + 104));
  uint64_t v4 = *(void **)(a1 + 48);
  SBRectWithSize();
  objc_msgSend(v4, "setResizeGrabberBounds:");
  uint64_t v5 = *(void **)(a1 + 48);
  UIRectGetCenter();
  objc_msgSend(v5, "setResizeGrabberCenter:");
  long long v6 = *(void **)(a1 + 48);
  return [v6 layoutIfNeeded];
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_29(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setContentClippingFrame:cornerRadii:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  [*(id *)(a1 + 32) layoutIfNeeded];
  objc_msgSend(*(id *)(a1 + 40), "setContentClippingFrame:cornerRadii:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  BOOL v2 = *(void **)(a1 + 40);
  return [v2 layoutIfNeeded];
}

- (void)_updateSuppressingHomeAffordanceBounce
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (__sb__runningInSpringBoard())
  {
    BOOL v3 = SBFEffectiveDeviceClass() == 2 && self->_isKeyboardShowing;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v3 = [v4 userInterfaceIdiom] == 1 && self->_isKeyboardShowing;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(SBFluidSwitcherViewController *)self _spacesWithVisibleHomeAffordances];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        id v11 = [v10 homeGrabberView];
        id v12 = [v11 grabberView];
        [v12 setSuppressesBounce:v3];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_23(uint64_t a1)
{
  BOOL v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    uint64_t v4 = [*(id *)(a1 + 32) layer];
    uint64_t v5 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    [v4 setValue:v5 forKeyPath:@"transform.scale"];

    uint64_t v6 = [*(id *)(a1 + 32) layer];
    uint64_t v7 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
    [v6 setValue:v7 forKeyPath:@"transform.translation.x"];

    uint64_t v8 = [*(id *)(a1 + 32) layer];
    id v9 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
    [v8 setValue:v9 forKeyPath:@"transform.translation.y"];

    double v10 = [*(id *)(a1 + 32) layer];
    id v11 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
    [v10 setValue:v11 forKeyPath:@"transform.rotation.y"];

    id v12 = [*(id *)(a1 + 32) layer];
    long long v13 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
    [v12 setValue:v13 forKeyPath:@"transform.rotation.z"];
  }
  else
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v23.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v23.m33 = v14;
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v23.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v23.m43 = v15;
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v23.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v23.m13 = v16;
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v23.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v23.m23 = v17;
    CGFloat v18 = *(double *)(a1 + 48);
    *(_OWORD *)&v22.m31 = *(_OWORD *)&v23.m31;
    *(_OWORD *)&v22.m33 = v14;
    *(_OWORD *)&v22.m41 = *(_OWORD *)&v23.m41;
    *(_OWORD *)&v22.m43 = v15;
    *(_OWORD *)&v22.m11 = *(_OWORD *)&v23.m11;
    *(_OWORD *)&v22.m13 = v16;
    *(_OWORD *)&v22.m21 = *(_OWORD *)&v23.m21;
    *(_OWORD *)&v22.m23 = v17;
    CATransform3DScale(&v23, &v22, v18, v18, 1.0);
    CGFloat v19 = *(double *)(a1 + 80);
    CATransform3D v21 = v23;
    CATransform3DRotate(&v22, &v21, v19, 0.0, 0.0, 1.0);
    CATransform3D v23 = v22;
    [*(id *)(a1 + 32) setTransform3D:&v22];
  }
  [*(id *)(a1 + 32) setContentPageViewScale:*(double *)(a1 + 88)];
  [*(id *)(a1 + 32) setBlurViewIconScale:*(double *)(a1 + 96)];
  return [*(id *)(a1 + 40) setBlurViewIconScale:*(double *)(a1 + 96)];
}

BOOL __66__SBFluidSwitcherViewController__spacesWithVisibleHomeAffordances__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 1840) objectForKey:a2];
  uint64_t v3 = [v2 homeGrabberView];
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_30(uint64_t a1)
{
  BOOL v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    BOOL v4 = [*(id *)(a1 + 32) layer];
    uint64_t v5 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
    [v4 setValue:v5 forKeyPath:@"transform.scale"];

    uint64_t v6 = [*(id *)(a1 + 32) layer];
    uint64_t v7 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
    [v6 setValue:v7 forKeyPath:@"transform.rotation.z"];
  }
  else
  {
    memset(&v26, 0, sizeof(v26));
    CATransform3DMakeScale(&v25, *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 56), 1.0);
    CATransform3DRotate(&v26, &v25, *(CGFloat *)(a1 + 64), 0.0, 0.0, 1.0);
    uint64_t v8 = *(void **)(a1 + 32);
    CATransform3D v24 = v26;
    [v8 setTransform3D:&v24];
  }
  [*(id *)(a1 + 32) setIconAlignment:*(void *)(a1 + 72)];
  [*(id *)(a1 + 32) setUniqueIconsOnly:1];
  objc_msgSend(*(id *)(a1 + 32), "setFooterStyle:", objc_msgSend(*(id *)(a1 + 40), "_itemContainerFooterStyle"));
  id v9 = [*(id *)(a1 + 32) homeGrabberView];
  long long v10 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)&v26.m31 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)&v26.m33 = v10;
  long long v11 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)&v26.m41 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)&v26.m43 = v11;
  long long v12 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)&v26.m11 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v26.m13 = v12;
  long long v13 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)&v26.m21 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)&v26.m23 = v13;
  [v9 setTransform3D:&v26];

  long long v14 = [*(id *)(a1 + 32) homeGrabberView];
  SBRectWithSize();
  objc_msgSend(v14, "setFrame:");

  [*(id *)(a1 + 32) setContentScale:*(double *)(a1 + 240)];
  [*(id *)(a1 + 32) layoutIfNeeded];
  long long v15 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    long long v17 = [*(id *)(a1 + 48) layer];
    CGFloat v18 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
    [v17 setValue:v18 forKeyPath:@"transform.scale"];

    CGFloat v19 = [*(id *)(a1 + 48) layer];
    long long v20 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
    [v19 setValue:v20 forKeyPath:@"transform.rotation.z"];
  }
  else
  {
    memset(&v26, 0, sizeof(v26));
    CATransform3DMakeScale(&v23, *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 56), 1.0);
    CATransform3DRotate(&v26, &v23, *(CGFloat *)(a1 + 64), 0.0, 0.0, 1.0);
    CATransform3D v21 = *(void **)(a1 + 48);
    CATransform3D v24 = v26;
    [v21 setTransform3D:&v24];
  }
  [*(id *)(a1 + 48) setContentScale:*(double *)(a1 + 240)];
  return [*(id *)(a1 + 48) layoutIfNeeded];
}

- (id)homeGrabberViewForAppLayout:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews objectForKey:a3];
  BOOL v4 = [v3 homeGrabberView];
  uint64_t v5 = [v4 grabberView];

  return v5;
}

- (unint64_t)_itemContainerFooterStyle
{
  if (![(SBFluidSwitcherViewController *)self isChamoisWindowingUIEnabled]) {
    return 0;
  }
  [(SBFluidSwitcherViewController *)self containerViewBounds];
  if (BSFloatGreaterThanFloat()) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)isDevicePad
{
  BOOL v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (id)animationControllerForTransitionRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [SBFluidSwitcherAnimationController alloc];
  uint64_t v6 = [(SBFluidSwitcherViewController *)self defaultTransitionAnimationSettings];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__SBFluidSwitcherViewController_animationControllerForTransitionRequest___block_invoke;
  void v9[3] = &unk_1E6AF9F40;
  objc_copyWeak(&v10, &location);
  uint64_t v7 = [(SBFluidSwitcherAnimationController *)v5 initWithWorkspaceTransitionRequest:v4 animationSettings:v6 animationBlock:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

- (BSAnimationSettings)defaultTransitionAnimationSettings
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FA5F08]);
  [v2 setDefaultCriticallyDampedValues];
  [v2 dampingRatio];
  [v2 response];
  convertDampingRatioAndResponseToTensionAndFriction();
  uint64_t v3 = [MEMORY[0x1E4F4F840] settingsWithMass:1.0 stiffness:0.0 damping:0.0];

  return (BSAnimationSettings *)v3;
}

uint64_t __70__SBFluidSwitcherViewController__updateVisibleOverlayAndUnderlayViews__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) containsObject:a2] ^ 1;
}

void __62__SBFluidSwitcherViewController__updateResignActiveAssertions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = +[SBSceneManagerCoordinator sharedInstance];
  uint64_t v8 = [v7 sceneDeactivationManager];
  uint64_t v9 = [v6 integerValue];

  id v11 = (id)[v8 newAssertionWithReason:v9];
  id v10 = [*(id *)(a1 + 32) _sceneDeactivationPredicateMatchingAppLayouts:v5];

  [v11 acquireWithPredicate:v10 transitionContext:0];
  [*(id *)(a1 + 40) addObject:v11];
}

- (id)_sceneDeactivationPredicateMatchingAppLayouts:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__SBFluidSwitcherViewController__sceneDeactivationPredicateMatchingAppLayouts___block_invoke;
  v7[3] = &unk_1E6AF9A10;
  id v8 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1D948C7A0](v7);

  return v5;
}

- (id)liveOverlayForSceneHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_liveContentOverlays allValues];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__SBFluidSwitcherViewController_liveOverlayForSceneHandle___block_invoke;
  void v9[3] = &unk_1E6AFA028;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);

  return v7;
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBFluidSwitcherViewController;
  [(SBFluidSwitcherViewController *)&v4 viewDidLayoutSubviews];
  [(BSInvalidatable *)self->_applicationRestrictionUpdatePendingAssertion invalidate];
  applicationRestrictionUpdatePendingAssertiouint64_t n = self->_applicationRestrictionUpdatePendingAssertion;
  self->_applicationRestrictionUpdatePendingAssertiouint64_t n = 0;
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_20(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_11(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_updateFloatingDockWindowLevelAssertion
{
  if ([(SBSwitcherModifier *)self->_rootModifier wantsDockWindowLevelAssertion])
  {
    uint64_t v3 = [(SBSwitcherModifier *)self->_rootModifier dockWindowLevelPriority];
    [(SBSwitcherModifier *)self->_rootModifier dockWindowLevel];
    double v5 = v4;
    long long v14 = self->_switcherFloatingDockWindowLevelAssertion;
    if (!v14
      || [(SBFloatingDockWindowLevelAssertion *)v14 priority] != v3
      || ([(SBFloatingDockWindowLevelAssertion *)v14 level], id v6 = v14, v7 != v5))
    {
      id v8 = [(SBFluidSwitcherViewController *)self _floatingDockController];
      uint64_t v9 = [SBFloatingDockWindowLevelAssertion alloc];
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      long long v12 = [(SBFloatingDockWindowLevelAssertion *)v9 initWithFloatingDockController:v8 priority:v3 level:v11 reason:v5];
      switcherFloatingDockWindowLevelAssertiouint64_t n = self->_switcherFloatingDockWindowLevelAssertion;
      self->_switcherFloatingDockWindowLevelAssertiouint64_t n = v12;

      [(SBFloatingDockWindowLevelAssertion *)v14 invalidate];
      id v6 = v14;
    }
  }
  else
  {
    [(SBFloatingDockWindowLevelAssertion *)self->_switcherFloatingDockWindowLevelAssertion invalidate];
    id v6 = self->_switcherFloatingDockWindowLevelAssertion;
    self->_switcherFloatingDockWindowLevelAssertiouint64_t n = 0;
  }
}

- (void)_updateBezelEffectsPortal
{
  int v3 = [(SBSwitcherModifier *)self->_rootModifier wantsBezelEffectsLayoutElement];
  double v4 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  double v5 = [v4 hardwareButtonBezelEffectsCoordinator];

  if (v3 && ([v5 dropletLaunchPortalSourceView], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v7 = (void *)v6;
    bezelEffectsPortalView = self->_bezelEffectsPortalView;
    if (!bezelEffectsPortalView)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __58__SBFluidSwitcherViewController__updateBezelEffectsPortal__block_invoke;
      v19[3] = &unk_1E6AF5290;
      v19[4] = self;
      id v20 = v7;
      [(SBFluidSwitcherViewController *)self _performWithFixedUpdateMode:2 usingBlock:v19];

      bezelEffectsPortalView = self->_bezelEffectsPortalView;
    }
    [(_UIPortalView *)bezelEffectsPortalView setSourceView:v7];
    if (!self->_bezelEffectsPortalObserverToken)
    {
      objc_initWeak(&location, self);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __58__SBFluidSwitcherViewController__updateBezelEffectsPortal__block_invoke_2;
      v16[3] = &unk_1E6AFA988;
      objc_copyWeak(&v17, &location);
      uint64_t v9 = [v5 observePortalSourceWithHandler:v16];
      bezelEffectsPortalObserverTokeuint64_t n = self->_bezelEffectsPortalObserverToken;
      self->_bezelEffectsPortalObserverTokeuint64_t n = v9;

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    if (!self->_bezelEffectsLayoutElement)
    {
      id v11 = [[SBSwitcherAccessoryLayoutElement alloc] initWithType:8];
      bezelEffectsLayoutElement = self->_bezelEffectsLayoutElement;
      self->_bezelEffectsLayoutElement = v11;
    }
  }
  else
  {
    [(BSInvalidatable *)self->_bezelEffectsPortalObserverToken invalidate];
    long long v13 = self->_bezelEffectsPortalObserverToken;
    self->_bezelEffectsPortalObserverTokeuint64_t n = 0;

    [(_UIPortalView *)self->_bezelEffectsPortalView removeFromSuperview];
    long long v14 = self->_bezelEffectsPortalView;
    self->_bezelEffectsPortalView = 0;

    long long v15 = self->_bezelEffectsLayoutElement;
    self->_bezelEffectsLayoutElement = 0;

    double v7 = 0;
  }
}

- (void)_updateSwitcherBackdropViewPresence
{
  int v3 = (objc_class *)objc_opt_class();
  int v4 = [(SBSwitcherModifier *)self->_rootModifier wantsSwitcherBackdropBlur];
  char v5 = v4;
  if (v4)
  {
    BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
    p_backdropView = (id *)&self->_backdropView;
    if (!self->_backdropView)
    {
      if (!IsReduceTransparencyEnabled)
      {
LABEL_4:
        id v8 = [SBHomeScreenBackdropView alloc];
        [(SBFluidSwitcherContentView *)self->_contentView bounds];
        uint64_t v9 = -[SBHomeScreenBackdropView initWithFrame:materialRecipe:scaleAdjustment:](v8, "initWithFrame:materialRecipe:scaleAdjustment:", 8, &__block_literal_global_817);
LABEL_11:
        id v13 = *p_backdropView;
        id *p_backdropView = (id)v9;

        [*p_backdropView setAutoresizingMask:18];
        [(SBFluidSwitcherContentView *)self->_contentView addSubview:*p_backdropView];
        long long v14 = [[SBSwitcherAccessoryLayoutElement alloc] initWithType:3];
        backdropLayoutElement = self->_backdropLayoutElement;
        self->_backdropLayoutElement = v14;

        [(SBFluidSwitcherViewController *)self _ensureSubviewOrdering];
        return;
      }
LABEL_10:
      id v12 = [v3 alloc];
      [(SBFluidSwitcherContentView *)self->_contentView bounds];
      uint64_t v9 = objc_msgSend(v12, "initWithFrame:");
      goto LABEL_11;
    }
  }
  else
  {
    p_backdropView = (id *)&self->_backdropView;
    if (!self->_backdropView) {
      return;
    }
    BOOL IsReduceTransparencyEnabled = 0;
  }
  char v10 = [(id)objc_opt_class() isEqual:v3];
  if (IsReduceTransparencyEnabled && (v10 & 1) == 0)
  {
    [*p_backdropView removeFromSuperview];
    id v11 = *p_backdropView;
    id *p_backdropView = 0;

    if (!IsReduceTransparencyEnabled) {
      goto LABEL_4;
    }
    goto LABEL_10;
  }
  if ((v5 & 1) == 0)
  {
    [*p_backdropView removeFromSuperview];
    id v16 = *p_backdropView;
    id *p_backdropView = 0;

    id v17 = self->_backdropLayoutElement;
    self->_backdropLayoutElement = 0;
  }
}

- (unint64_t)assistantPresentationState
{
  return self->_assistantPresentationState;
}

- (BOOL)isSystemAssistantExperienceEnabled
{
  id v2 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  int v3 = [v2 assistantController];
  char v4 = [v3 isSystemAssistantExperienceEnabled];

  return v4;
}

- (BOOL)isAssistantKeyboardVisible
{
  id v2 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  int v3 = [v2 assistantController];
  char v4 = [v3 presentationContext];

  LOBYTE(v2) = [v4 isKeyboardVisible];
  return (char)v2;
}

- (unint64_t)assistantModality
{
  id v2 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  int v3 = [v2 assistantController];
  char v4 = [v3 presentationContext];

  uint64_t v5 = [v4 modality];
  if ((unint64_t)(v5 - 1) >= 3) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = v5;
  }

  return v6;
}

uint64_t __73__SBFluidSwitcherViewController_animationControllerForTransitionRequest___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __99__SBFluidSwitcherViewController__addVisibleItemContainerForAppLayout_reusingItemContainerIfExists___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  int v3 = [*(id *)(a1 + 40) allItems];
  char v4 = [v3 firstObject];
  uint64_t v5 = [v2 layoutRoleForItem:v4];

  [*(id *)(a1 + 48) _layoutAppLayout:*(void *)(a1 + 32) roleMask:SBLayoutRoleMaskForRole(v5) completion:0];
  unint64_t v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = SBLayoutRoleMaskForRole(v5);
  return [v6 _applyStyleToAppLayout:v7 roleMask:v8 completion:0];
}

void __82__SBFluidSwitcherViewController__applyStyleToVisibleItemContainersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v32 = a2;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 1296);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v41 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v9 = *(void **)(a1 + 32);
        uint64_t v10 = SBLayoutRoleMaskAll();
        id v11 = v32[2](v32, @"style app layout");
        [v9 _applyStyleToAppLayout:v8 roleMask:v10 completion:v11];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v5);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 1832) allKeys];
  uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v37;
    uint64_t v27 = (char *)(v32 + 2);
    long long v28 = v34;
    long long v15 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * j);
        CGFloat v18 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + v15[60]), "objectForKey:", v17, v27, v28);
        if (!v18)
        {
          CGFloat v19 = [*(id *)(*(void *)(a1 + 32) + 1944) animationAttributesForLayoutElement:v17];
          uint64_t v31 = [v19 updateMode];
          long long v30 = [v19 opacitySettings];
          id v20 = [*(id *)(*(void *)(a1 + 32) + 1832) objectForKey:v17];
          CATransform3D v21 = (void *)MEMORY[0x1E4F42FF0];
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v34[0] = __82__SBFluidSwitcherViewController__applyStyleToVisibleItemContainersWithCompletion___block_invoke_2;
          v34[1] = &unk_1E6AF4AC0;
          id v35 = v20;
          uint64_t v22 = a1;
          uint64_t v23 = v14;
          CATransform3D v24 = v32[2];
          id v25 = v20;
          CATransform3D v26 = v24(v32, @"non model opacity leaf opacity");
          objc_msgSend(v21, "sb_animateWithSettings:mode:animations:completion:", v30, v31, v33, v26);

          uint64_t v14 = v23;
          a1 = v22;

          long long v15 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v13);
  }
}

void __67__SBFluidSwitcherViewController__layoutVisibleItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 1296);
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        uint64_t v9 = *(void **)(a1 + 32);
        uint64_t v10 = SBLayoutRoleMaskAll();
        id v11 = v3[2](v3, @"layout app layout");
        [v9 _layoutAppLayout:v8 roleMask:v10 completion:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)_applyStyleToAppLayout:(id)a3 roleMask:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x1E4FA5E48];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__SBFluidSwitcherViewController__applyStyleToAppLayout_roleMask_completion___block_invoke;
  v11[3] = &unk_1E6AFA590;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  id v10 = v8;
  [v9 perform:v11 finalCompletion:a5 options:0 delegate:self];
}

- (void)_layoutAppLayout:(id)a3 roleMask:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x1E4FA5E48];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke;
  v11[3] = &unk_1E6AFA590;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  id v10 = v8;
  [v9 perform:v11 finalCompletion:a5 options:0 delegate:self];
}

void __95__SBFluidSwitcherViewController__updateVisibleItemsAccessoryViewsLayoutAndStyleWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v8 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v5 = v3[2](v3, @"update layout");
    [v4 _updateLayoutWithCompletion:v5];
  }
  else
  {
    [v4 _updateLayoutWithCompletion:0];
  }
  uint64_t v6 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 41))
  {
    uint64_t v7 = v8[2](v8, @"update style");
    [v6 _updateStyleWithCompletion:v7];
  }
  else
  {
    [*(id *)(a1 + 32) _updateStyleWithCompletion:0];
  }
}

- (void)_updateLayoutWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__SBFluidSwitcherViewController__updateLayoutWithCompletion___block_invoke;
  v3[3] = &unk_1E6AFA2F0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E4FA5E48], "perform:finalCompletion:options:delegate:", v3, a3, 0);
}

- (void)_updateStyleWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__SBFluidSwitcherViewController__updateStyleWithCompletion___block_invoke;
  v3[3] = &unk_1E6AFA2F0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E4FA5E48], "perform:finalCompletion:options:delegate:", v3, a3, 0);
}

- (void)liveContentOverlayDidUpdateHomeAffordanceEdgeProtectOrAutoHide:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = self->_liveContentOverlays;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
      id v11 = -[NSMutableDictionary objectForKey:](self->_liveContentOverlays, "objectForKey:", v10, (void)v19);
      char v12 = [v11 isEqual:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    unint64_t v13 = v10;

    if (!v13) {
      goto LABEL_12;
    }
    long long v14 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v13];
    [(SBFHomeGrabberSettings *)self->_homeGrabberSettings autoHideTimeOnAppRequest];
    double v16 = v15;
    [(SBFHomeGrabberSettings *)self->_homeGrabberSettings delayForUnhideOnAppRequest];
    double v18 = v17;
    [(SBFluidSwitcherViewController *)self _updateEdgeProtectAndAutoHideForHomeAffordancesInAppLayout:v14 withResetDelay:v16 unhideDelay:v17];
    [(SBFluidSwitcherViewController *)self _updateAutoHideForGrabberAffordancesInAppLayout:v14 withResetDelay:v16 unhideDelay:v18];
  }
  else
  {
LABEL_9:

LABEL_12:
    unint64_t v13 = SBLogAppSwitcher();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SBFluidSwitcherViewController liveContentOverlayDidUpdateHomeAffordanceEdgeProtectOrAutoHide:]((id *)&self->_liveContentOverlays);
    }
  }
}

- (void)_updateEdgeProtectAndAutoHideForHomeAffordancesInAppLayout:(id)a3 withResetDelay:(double)a4 unhideDelay:(double)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews objectForKey:v8];
  id v10 = [v9 homeGrabberView];
  id v11 = [v10 grabberView];

  if (v11)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    char v12 = [(SBFluidSwitcherViewController *)self _leafAppLayoutsInAppLayout:v8 intersectingHomeGrabber:v11];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      long long v21 = v11;
      int v15 = 0;
      int v16 = 0;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v12);
          }
          uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v16 |= -[SBSwitcherLiveContentOverlayCoordinating wantsEdgeProtectForHomeGestureForAppLayout:](self->_liveContentOverlayCoordinator, "wantsEdgeProtectForHomeGestureForAppLayout:", v19, v21);
          v15 |= [(SBSwitcherLiveContentOverlayCoordinating *)self->_liveContentOverlayCoordinator wantsHomeAffordanceAutoHideForAppLayout:v19];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);

      id v11 = v21;
      [v21 setEdgeProtectEnabled:v16 & 1];
      if (!(v16 & 1 | ((v15 & 1) == 0)))
      {
        [v21 turnOnAutoHideWithInitialDelay:a4];
        goto LABEL_16;
      }
    }
    else
    {

      [v11 setEdgeProtectEnabled:0];
    }
    [v11 turnOffAutoHideWithDelay:a5];
    goto LABEL_16;
  }
  long long v20 = SBLogAppSwitcher();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[SBFluidSwitcherViewController _updateEdgeProtectAndAutoHideForHomeAffordancesInAppLayout:withResetDelay:unhideDelay:]();
  }

LABEL_16:
}

- (id)_leafAppLayoutsInAppLayout:(id)a3 intersectingHomeGrabber:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v36 = [MEMORY[0x1E4F1CA80] set];
  id v33 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews objectForKey:v6];
  [v33 bounds];
  objc_msgSend(v7, "grabberFrameForBounds:");
  CGFloat v34 = v7;
  -[SBFluidSwitcherContentView convertRect:fromView:](self->_contentView, "convertRect:fromView:", v7);
  CGFloat v39 = v9;
  CGFloat v40 = v8;
  CGFloat v37 = v11;
  CGFloat v38 = v10;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v35 = v6;
  char v12 = [v6 leafAppLayouts];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        double v18 = [(NSMutableDictionary *)self->_visibleItemContainers objectForKey:v17];
        contentView = self->_contentView;
        [v18 bounds];
        -[SBFluidSwitcherContentView convertRect:fromView:](contentView, "convertRect:fromView:", v18);
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        v49.origin.CGFloat x = v40;
        v49.origin.CGFloat y = v39;
        v49.size.double width = v38;
        v49.size.double height = v37;
        double MinX = CGRectGetMinX(v49);
        v50.origin.CGFloat x = v40;
        v50.origin.CGFloat y = v39;
        v50.size.double width = v38;
        v50.size.double height = v37;
        double MaxX = CGRectGetMaxX(v50);
        v51.origin.CGFloat x = v21;
        v51.origin.CGFloat y = v23;
        v51.size.double width = v25;
        v51.size.double height = v27;
        double v29 = CGRectGetMinX(v51);
        v52.origin.CGFloat x = v21;
        v52.origin.CGFloat y = v23;
        v52.size.double width = v25;
        v52.size.double height = v27;
        double v30 = CGRectGetMaxX(v52);
        if (MinX >= v29) {
          BOOL v31 = v30 > MinX;
        }
        else {
          BOOL v31 = MaxX > v29;
        }
        if (v31) {
          [v36 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v14);
  }

  return v36;
}

- (BOOL)displayItemIsClassic:(id)a3
{
  id v3 = [(SBFluidSwitcherViewController *)self _applicationForDisplayItem:a3];
  char v4 = [v3 isClassic];

  return v4;
}

- (BOOL)displayItemSupportsMultipleWindowsIndicator:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFluidSwitcherViewController *)self _applicationForDisplayItem:v4];
  id v6 = [v5 info];
  uint64_t v7 = [v4 type];

  if (v7 || ![v6 supportsMultiwindow]) {
    LOBYTE(v8) = 0;
  }
  else {
    int v8 = [v6 hasHiddenTag] ^ 1;
  }

  return v8;
}

- (id)_applicationForDisplayItem:(id)a3
{
  id v3 = a3;
  id v4 = +[SBApplicationController sharedInstance];
  uint64_t v5 = [v4 applicationForDisplayItem:v3];

  return v5;
}

- (void)_setupLiveContentOverlayForAppLayout:(id)a3 itemContainer:(id)a4 overlay:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  [v9 setDelegate:self];
  [(SBFluidSwitcherViewController *)self _updateStatusBarAndHomeGrabberVisibilityForAppLayout:v13 animated:1];
  double v10 = [(SBFluidSwitcherViewController *)self appLayouts];
  uint64_t v11 = [v10 indexOfObject:v13];

  if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
    [(SBFluidSwitcherViewController *)self _applyStyleToLiveContentOverlay:v9 forItemContainer:v8 atIndex:v11];
  }
  [(SBFluidSwitcherViewController *)self _updateAutoHideForItemContainer:v8 appLayout:v13];
  [(SBFluidSwitcherViewController *)self _applyTouchBehaviorToLiveContentOverlay:v9 forAppLayout:v13];
  [(SBFluidSwitcherViewController *)self _updateAsyncRenderingAndResizesHostedContext];
  [(SBFluidSwitcherViewController *)self _updateWantsEnhancedWindowingEnabledState];
  [(SBFluidSwitcherViewController *)self _updateCornerRadiiiAndMaximizedState];
  char v12 = +[SBBlurItemContainerParameters defaultCrossblurBlurParameters];
  [(SBFluidSwitcherViewController *)self _unblurItemContainer:v8 blurParameters:v12 withAnimationUpdateMode:2];
}

- (void)_updateAutoHideForGrabberAffordancesInAppLayout:(id)a3 withResetDelay:(double)a4 unhideDelay:(double)a5
{
  id v6 = a3;
  id v7 = [(SBFluidSwitcherViewController *)self _itemContainerForAppLayoutIfExists:v6];
  [(SBFluidSwitcherViewController *)self _updateAutoHideForItemContainer:v7 appLayout:v6];
}

- (void)_updateAutoHideForItemContainer:(id)a3 appLayout:(id)a4
{
  liveContentOverlayCoordinator = self->_liveContentOverlayCoordinator;
  id v6 = a3;
  uint64_t v7 = [(SBSwitcherLiveContentOverlayCoordinating *)liveContentOverlayCoordinator wantsHomeAffordanceAutoHideForAppLayout:a4];
  id v8 = [v6 affordancePresenceController];

  [v8 setAutoHideAffordance:v7];
}

- (void)_unblurItemContainer:(id)a3 blurParameters:(id)a4 withAnimationUpdateMode:(int64_t)a5
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1E4F42FF0];
  double v10 = [a4 blurAnimationSettings];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__SBFluidSwitcherViewController__unblurItemContainer_blurParameters_withAnimationUpdateMode___block_invoke;
  v15[3] = &unk_1E6AF4AC0;
  id v16 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __93__SBFluidSwitcherViewController__unblurItemContainer_blurParameters_withAnimationUpdateMode___block_invoke_2;
  v12[3] = &unk_1E6AFA190;
  id v13 = v16;
  uint64_t v14 = self;
  id v11 = v16;
  objc_msgSend(v9, "sb_animateWithSettings:mode:animations:completion:", v10, a5, v15, v12);
}

- (void)_sceneUpdateDidChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"SceneIdentifierKey"];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_cachedAdjustedLeafAppLayouts;
  id v7 = (id)[(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        if (objc_msgSend(v10, "containsItemWithUniqueIdentifier:", v5, (void)v12))
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v11 = [[SBSceneReadySwitcherModifierEvent alloc] initWithAppLayout:v7];
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v11];
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_27(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v2 = *(double *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 72);
  for (uint64_t i = 8; i != 32; i += 8)
  {
    if (v2 < *(double *)&v6[i]) {
      double v2 = *(double *)&v6[i];
    }
  }
  [*(id *)(a1 + 32) setCornerRadius:v2];
  id v4 = *(void **)(a1 + 40);
  return [v4 setCornerRadius:v2];
}

- (CGRect)layoutFrameForItemWithRole:(int64_t)a3 inAppLayout:(id)a4 interfaceOrientation:(int64_t)a5 forSnapshotView:(id)a6
{
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (a4 && a3)
  {
    id v11 = objc_msgSend(a4, "leafAppLayoutForRole:");
    long long v12 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v11];
    if (v12)
    {
      long long v13 = [(SBFluidSwitcherViewController *)self appLayouts];
      uint64_t v14 = [v13 indexOfObject:v12];

      [(SBSwitcherModifier *)self->_rootModifier frameForIndex:v14];
      long long v15 = [v11 itemForLayoutRole:1];
      uint64_t v16 = [v12 layoutRoleForItem:v15];

      rootModifier = self->_rootModifier;
      SBRectWithSize();
      -[SBSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](rootModifier, "frameForLayoutRole:inAppLayout:withBounds:", v16, v12);
      double v8 = v18;
      double v9 = v19;
      double v6 = *MEMORY[0x1E4F1DAD8];
      double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
  }
  double v20 = v6;
  double v21 = v7;
  double v22 = v8;
  double v23 = v9;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (BOOL)snapshotView:(id)a3 shouldShowAppClipOverlayForLayout:(id)a4
{
  id v4 = [(NSMutableDictionary *)self->_liveContentOverlays objectForKey:a4];
  BOOL v5 = v4 == 0;

  return v5;
}

- (double)currentStatusBarHeightOfContainer:(id)a3
{
  id v4 = [a3 appLayout];
  if (v4)
  {
    BOOL v5 = [(NSMutableDictionary *)self->_liveContentOverlays objectForKey:v4];
    [v5 currentStatusBarHeight];
    double v7 = v6;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F43D08];
  }

  return v7;
}

- (CGRect)overlayAccessoryViewFrameForIconOverlayView:(id)a3 fullPresented:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = v6;
  if (v4)
  {
    double v8 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews allKeysForObject:v6];
    double v9 = [v8 firstObject];

    leafAppLayoutsToAdjustedAppLayouts = self->_leafAppLayoutsToAdjustedAppLayouts;
    id v11 = [v9 anyLeafAppLayout];
    long long v12 = [(NSDictionary *)leafAppLayoutsToAdjustedAppLayouts objectForKey:v11];

    [(SBFluidSwitcherViewController *)self containerViewBounds];
    if (v12)
    {
      long long v13 = [(SBFluidSwitcherViewController *)self appLayouts];
      uint64_t v14 = [v13 indexOfObject:v12];

      [(SBSwitcherModifier *)self->_rootModifier frameForIndex:v14];
      -[SBSwitcherModifier fullyPresentedFrameForIndex:frame:](self->_rootModifier, "fullyPresentedFrameForIndex:frame:", v14);
    }
    else
    {
      double v23 = SBLogAppSwitcher();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        double v24 = [v7 debugDescription];
        CGFloat v25 = [v9 debugDescription];
        int v34 = 138412546;
        id v35 = v24;
        __int16 v36 = 2112;
        CGFloat v37 = v25;
        _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "adjustedAppLayout is null for overlay accessory view:%@ for appLayout:%@", (uint8_t *)&v34, 0x16u);
      }
    }
    SBRectWithSize();
    double v16 = v26;
    double v18 = v27;
    double v20 = v28;
    double v22 = v29;
  }
  else
  {
    [v6 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
  }

  double v30 = v16;
  double v31 = v18;
  double v32 = v20;
  double v33 = v22;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (CGRect)frameForPageViewOfContainer:(id)a3 fullyPresented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(NSMutableDictionary *)self->_visibleItemContainers allValues];
  int v8 = [v7 containsObject:v6];

  if (v4 && v8)
  {
    double v9 = [v6 appLayout];
    double v10 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v9];
    if (v10)
    {
      id v11 = [(SBFluidSwitcherViewController *)self appLayouts];
      uint64_t v12 = [v11 indexOfObject:v10];

      [(SBSwitcherModifier *)self->_rootModifier frameForIndex:v12];
      -[SBSwitcherModifier fullyPresentedFrameForIndex:frame:](self->_rootModifier, "fullyPresentedFrameForIndex:frame:", v12);
      long long v13 = [v9 allItems];
      uint64_t v14 = [v13 firstObject];
      uint64_t v15 = [v10 layoutRoleForItem:v14];

      rootModifier = self->_rootModifier;
      SBRectWithSize();
      -[SBSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](rootModifier, "frameForLayoutRole:inAppLayout:withBounds:", v15, v10);
    }
    else
    {
      [v6 bounds];
    }
  }
  else
  {
    [v6 bounds];
  }
  SBRectWithSize();
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (BOOL)isAppLayoutVisibleInSwitcherBounds:(id)a3
{
  visibleItemContainers = self->_visibleItemContainers;
  BOOL v5 = [a3 anyLeafAppLayout];
  id v6 = [(NSMutableDictionary *)visibleItemContainers objectForKey:v5];

  if (v6)
  {
    [(SBFluidSwitcherViewController *)self switcherViewBounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [v6 frame];
    v22.origin.CGFloat x = v15;
    v22.origin.CGFloat y = v16;
    v22.size.double width = v17;
    v22.size.double height = v18;
    v21.origin.CGFloat x = v8;
    v21.origin.CGFloat y = v10;
    v21.size.double width = v12;
    v21.size.double height = v14;
    BOOL v19 = CGRectIntersectsRect(v21, v22);
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (CGRect)_iconImageFrameForIconView:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
    id v6 = [v5 homeScreenController];
    double v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = +[SBUIController sharedInstance];
    }
    double v13 = v8;

    CGFloat v14 = [v13 homeScreenScalingView];
    CGFloat v15 = v14;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
    if (v14) {
      [v14 transform];
    }
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v32 = *MEMORY[0x1E4F1DAB8];
    long long v33 = v16;
    long long v34 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v15 setTransform:&v32];
    CGFloat v17 = [(SBFluidSwitcherViewController *)self view];
    [v4 iconImageFrame];
    objc_msgSend(v17, "convertRect:fromView:", v4);

    [v4 iconImageFrame];
    CGFloat v18 = [(SBFluidSwitcherViewController *)self view];
    SBRectWithSize();
    objc_msgSend(v18, "convertRect:fromView:", v4);
    double v20 = v19;
    double v22 = v21;

    [v4 iconContentScale];
    CGFloat v24 = v23;

    CGAffineTransformMakeScale(&v31, v24, v24);
    double v11 = v22 * v31.c + v31.a * v20;
    double v12 = v22 * v31.d + v31.b * v20;
    UIRectGetCenter();
    double v9 = v25 - v12 * 0.5;
    double v10 = v26 - v11 * 0.5;
    long long v32 = v35;
    long long v33 = v36;
    long long v34 = v37;
    [v15 setTransform:&v32];
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB20];
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v27 = v10;
  double v28 = v9;
  double v29 = v11;
  double v30 = v12;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

uint64_t __61__SBFluidSwitcherViewController__updateLayoutWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1944) contentViewScale];
  double v2 = *(void **)(*(void *)(a1 + 32) + 1816);
  CGAffineTransformMakeScale(&v5, v3, v3);
  return [v2 setTransform:&v5];
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 toLayoutState];
  double v9 = [v7 applicationTransitionContext];
  double v10 = [v8 elements];
  uint64_t v11 = [v10 count];

  if (v11) {
    [(SBSwitcherLiveContentOverlayCoordinating *)self->_liveContentOverlayCoordinator layoutStateTransitionCoordinator:v6 transitionDidBeginWithTransitionContext:v7];
  }
  [(UIView *)self->_hitTestBlockerView setHidden:1];
  [(SBFluidSwitcherViewController *)self _configureApplicationAndTransientOverlayDockBehaviorAssertionsForContext:v9];
  double v12 = [(SBFluidSwitcherViewController *)self delegate];
  double v13 = v12;
  if ((*((unsigned char *)&self->_delegateRespondsTo + 2) & 4) != 0
    && [v12 switcherContentController:self shouldResignActiveForStartOfTransition:v7]
    && !self->_transitionBeginResignActiveAssertion)
  {
    CGFloat v14 = +[SBSceneManagerCoordinator sharedInstance];
    CGFloat v15 = [v14 sceneDeactivationManager];
    long long v16 = (UIApplicationSceneDeactivationAssertion *)[v15 newAssertionWithReason:5];
    transitionBeginResignActiveAssertiouint64_t n = self->_transitionBeginResignActiveAssertion;
    self->_transitionBeginResignActiveAssertiouint64_t n = v16;

    CGFloat v18 = self->_transitionBeginResignActiveAssertion;
    double v19 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
    double v20 = [v19 _fbsDisplayIdentity];
    [(UIApplicationSceneDeactivationAssertion *)v18 sb_acquireForDisplayIdentity:v20];
  }
  [(SBFluidSwitcherContentView *)self->_contentView setNeedsFocusUpdate];
  [(SBFluidSwitcherContentView *)self->_contentView updateFocusIfNeeded];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v21 = [(NSMutableDictionary *)self->_visibleShelves allValues];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v25++) layoutStateTransitionCoordinator:v6 transitionDidBeginWithTransitionContext:v7];
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v23);
  }
}

- (void)setContentOrientation:(int64_t)a3
{
  if (self->_contentOrientation != a3)
  {
    self->_contentOrientatiouint64_t n = a3;
    -[SBFluidSwitcherViewController _updateLayoutFromInterfaceOrientation:toInterfaceOrientation:](self, "_updateLayoutFromInterfaceOrientation:toInterfaceOrientation:");
  }
}

uint64_t __79__SBFluidSwitcherViewController__sceneDeactivationPredicateMatchingAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        double v9 = objc_msgSend(v3, "identifier", (void)v11);
        LOBYTE(v8) = [v8 containsItemWithUniqueIdentifier:v9];

        if (v8)
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)isWindowVisible
{
  return [(SBSwitcherModifier *)self->_rootModifier isSwitcherWindowVisible];
}

- (BOOL)isUserInteractionEnabled
{
  return [(SBSwitcherModifier *)self->_rootModifier isSwitcherWindowUserInteractionEnabled];
}

- (void)performTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke;
  v22[3] = &unk_1E6AF69D0;
  v22[4] = self;
  id v11 = v9;
  id v23 = v11;
  BOOL v25 = v6;
  id v12 = v10;
  id v24 = v12;
  long long v13 = (void (**)(void))MEMORY[0x1D948C7A0](v22);
  [(SBFluidSwitcherViewController *)self _delayForTransitionWithContext:v11 animated:v6];
  double v15 = v14;
  if (BSFloatIsZero())
  {
    v13[2](v13);
  }
  else
  {
    objc_storeStrong((id *)&self->_pendingTransitionContext, a3);
    objc_initWeak(&location, self);
    dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_11;
    v17[3] = &unk_1E6AF6A20;
    objc_copyWeak(&v20, &location);
    id v18 = v11;
    double v19 = v13;
    dispatch_after(v16, MEMORY[0x1E4F14428], v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1136);
  *(void *)(v2 + 1136) = 0;

  id v4 = [MEMORY[0x1E4F29128] UUID];
  [*(id *)(*(void *)(a1 + 32) + 1824) willBeginTransitioningToLayoutStateWithContext:*(void *)(a1 + 40)];
  uint64_t v5 = [*(id *)(a1 + 40) previousLayoutState];
  BOOL v6 = (void *)[v5 interfaceOrientation];

  id v7 = [*(id *)(a1 + 40) layoutState];
  id v8 = (void *)[v7 interfaceOrientation];

  if (*(unsigned char *)(a1 + 56))
  {
    id v9 = [*(id *)(a1 + 32) _transitionEventForTransitionWithContext:*(void *)(a1 + 40) identifier:v4 phase:1 animated:1];
    [*(id *)(a1 + 32) _dispatchEventAndHandleAction:v9];
    if (v6 != v8)
    {
      uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 1944) shouldPerformRotationAnimationForOrientationChange];
      id v11 = *(void **)(a1 + 32);
      id v12 = (void *)v11[125];
      long long v13 = [v11 view];
      [v12 willRotateFromInterfaceOrientation:v6 toInterfaceOrientation:v8 alongsideContainerView:v13 animated:v10];
    }
    double v14 = *(id **)(a1 + 32);
    if (v14[136])
    {
      [v14[136] relinquish];
      uint64_t v15 = *(void *)(a1 + 32);
      dispatch_time_t v16 = *(void **)(v15 + 1088);
      *(void *)(v15 + 1088) = 0;

      double v14 = *(id **)(a1 + 32);
    }
    if ([v14 isReduceMotionEnabled]
      && [*(id *)(*(void *)(a1 + 32) + 1944) shouldPerformCrossfadeForReduceMotion])
    {
      [*(id *)(a1 + 32) _prepareForCrossfadeIfNeeded];
    }
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v18 = *(void **)(a1 + 32);
  CGFloat v17 = *(void **)(a1 + 40);
  uint64_t v19 = *(unsigned __int8 *)(a1 + 56);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_2;
  v21[3] = &unk_1E6AFA118;
  v21[4] = v18;
  id v22 = v17;
  char v26 = *(unsigned char *)(a1 + 56);
  id v20 = v4;
  id v23 = v20;
  objc_copyWeak(v25, &location);
  v25[1] = v6;
  v25[2] = v8;
  id v24 = *(id *)(a1 + 48);
  [v18 _makeAppLayoutVisibleForTransitionWithContext:v22 animated:v19 completion:v21];

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

- (void)_makeAppLayoutVisibleForTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v20 = a3;
  id v8 = (void (**)(id, uint64_t))a5;
  if (!v6) {
    goto LABEL_7;
  }
  if (SBReduceMotion()) {
    goto LABEL_7;
  }
  id v9 = [(SBFluidSwitcherViewController *)self chamoisLayoutAttributes];
  char v10 = [v9 isAdditiveModelEnabled];

  if (v10) {
    goto LABEL_7;
  }
  id v11 = [(SBSwitcherModifier *)self->_rootModifier appLayoutToScrollToBeforeTransitioning];
  if (!v11
    || ([(SBSwitcherModifier *)self->_rootModifier visibleAppLayouts],
        id v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 containsObject:v11],
        v12,
        v13))
  {

LABEL_7:
    v8[2](v8, 1);
    goto LABEL_8;
  }
  double v14 = [(SBFluidSwitcherViewController *)self appLayouts];
  uint64_t v15 = [v14 indexOfObject:v11];

  [(SBSwitcherModifier *)self->_rootModifier contentOffsetForIndex:v15 alignment:2];
  double v17 = v16;
  double v19 = v18;

  -[BSUIScrollView setContentOffset:animated:completion:](self->_scrollView, "setContentOffset:animated:completion:", 1, v8, v17, v19);
LABEL_8:
}

void __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) layoutContext];
  id v3 = [v2 activeTransitionContext];
  id v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FA5E48];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_3;
    v15[3] = &unk_1E6AFA078;
    id v6 = *(id *)(a1 + 40);
    char v19 = *(unsigned char *)(a1 + 88);
    uint64_t v7 = *(void *)(a1 + 32);
    id v16 = v6;
    uint64_t v17 = v7;
    id v18 = *(id *)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_8;
    v8[3] = &unk_1E6AFA0F0;
    objc_copyWeak(&v12, (id *)(a1 + 64));
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    char v14 = *(unsigned char *)(a1 + 88);
    long long v13 = *(_OWORD *)(a1 + 72);
    id v11 = *(id *)(a1 + 56);
    objc_msgSend(v5, "perform:finalCompletion:options:delegate:", v15, v8, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1944), "shouldFireTransitionCompletionInDefaultRunLoopMode"), *(void *)(a1 + 32));

    objc_destroyWeak(&v12);
  }
}

- (double)_delayForTransitionWithContext:(id)a3 animated:(BOOL)a4
{
  double v4 = 0.0;
  if (a4)
  {
    uint64_t v5 = [a3 previousApplicationSceneEntityForLayoutRole:1];
    id v6 = [v5 objectForDeactivationSetting:2];
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      double v4 = v8;
    }
  }
  return v4;
}

void __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v7 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_6;
  }
  id v8 = WeakRetained[165];
  WeakRetained[165] = 0;

  id v9 = objc_loadWeakRetained(v7 + 223);
  if (!v9) {
    goto LABEL_6;
  }
  id v10 = v9;
  id v11 = objc_loadWeakRetained(v7 + 222);

  if (v11)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_9;
    v24[3] = &unk_1E6AFA0A0;
    id v12 = v7;
    BOOL v25 = v12;
    id v26 = *(id *)(a1 + 32);
    id v27 = *(id *)(a1 + 40);
    char v30 = *(unsigned char *)(a1 + 80);
    long long v29 = *(_OWORD *)(a1 + 64);
    id v28 = *(id *)(a1 + 48);
    long long v13 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v24);
    char v14 = [v12 pipViewMorphAnimator];
    uint64_t v15 = [v14 uuid];
    id v16 = [*(id *)(a1 + 32) request];
    uint64_t v17 = [v16 uniqueID];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_10;
      v20[3] = &unk_1E6AFA0C8;
      double v21 = v13;
      char v22 = a2;
      char v23 = a3;
      [v14 noteSourceAnimationsDidEnd:15 finished:1 continueBlock:v20];
    }
    else
    {
      v13[2](v13, a2, a3);
    }
  }
  else
  {
LABEL_6:
    uint64_t v19 = *(void *)(a1 + 48);
    if (v19) {
      (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, a2);
    }
  }
}

void __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_9(uint64_t a1, uint64_t a2)
{
  id v22 = [*(id *)(a1 + 32) pipViewMorphAnimator];
  double v4 = [v22 uuid];
  uint64_t v5 = [*(id *)(a1 + 40) request];
  id v6 = [v5 uniqueID];
  int v7 = [v4 isEqual:v6];

  if (v7) {
    [*(id *)(a1 + 32) setPipViewMorphAnimator:0];
  }
  [*(id *)(a1 + 32) _resetItemContainerShadowPathDisplayLink];
  id v8 = [*(id *)(a1 + 32) layoutContext];
  id v9 = [v8 activeTransitionContext];
  id v10 = *(void **)(a1 + 40);

  if (v9 == v10)
  {
    id v11 = [*(id *)(a1 + 32) layoutContext];
    [v11 didEndTransitioningToLayoutStateWithContext:*(void *)(a1 + 40)];

    id v12 = [*(id *)(a1 + 32) _transitionEventForTransitionWithContext:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48) phase:3 animated:*(unsigned __int8 *)(a1 + 80)];
    [*(id *)(a1 + 32) _dispatchEventAndHandleAction:v12];
    long long v13 = *(void **)(a1 + 32);
    char v14 = (void *)v13[203];
    if (v14)
    {
      v13[203] = 0;
      id v15 = v14;

      id v16 = *(void **)(a1 + 32);
      uint64_t v17 = [v15 interactionIdentifier];
      [v16 _removeCenterWindowAnimationContextWithKey:v17];

      int v18 = [*(id *)(a1 + 32) view];
      [v18 setNeedsLayout];

      [MEMORY[0x1E4F39CF8] flush];
      uint64_t v19 = [MEMORY[0x1E4F4F678] response];
      [v15 sendResponse:v19];
    }
    else
    {
      id v20 = 0;
      uint64_t v19 = [v13 view];

      [v19 setNeedsLayout];
    }
  }
  if (*(void *)(a1 + 64) != *(void *)(a1 + 72)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "didRotateFromInterfaceOrientation:toInterfaceOrientation:");
  }
  uint64_t v21 = *(void *)(a1 + 56);
  if (v21) {
    (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v21, a2);
  }
}

- (SBViewMorphAnimator)pipViewMorphAnimator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipViewMorphAnimator);
  return (SBViewMorphAnimator *)WeakRetained;
}

void __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = [*(id *)(a1 + 32) request];
  char v5 = *(unsigned char *)(a1 + 56);
  if (v5) {
    char v5 = [*(id *)(*(void *)(a1 + 40) + 1944) transactionCompletionOptions] != 0;
  }
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_4;
  v47[3] = &unk_1E6AFA050;
  char v49 = v5;
  id v36 = v3;
  id v48 = v36;
  uint64_t v6 = MEMORY[0x1D948C7A0](v47);
  if (*(unsigned char *)(a1 + 56) && [v4 source] == 55)
  {
    uint64_t v7 = (*(void (**)(uint64_t, __CFString *))(v6 + 16))(v6, @"morph from in app view");
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void **)(v8 + 1616);
    *(void *)(v8 + 1616) = v7;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 40) + 1896) allValues];
  uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(obj);
        }
        char v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v16 = *(unsigned __int8 *)(a1 + 56);
        uint64_t v17 = (*(void (**)(uint64_t, __CFString *))(v6 + 16))(v6, @"shelf transition");
        [v14 performTransitionWithContext:v15 animated:v16 completion:v17];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v11);
  }

  int v18 = (void (**)(void, void))v6;
  uint64_t v19 = MEMORY[0x1D948C7A0](v6);
  uint64_t v20 = *(void *)(a1 + 40);
  uint64_t v21 = *(void **)(v20 + 1320);
  *(void *)(v20 + 1320) = v19;

  id v22 = [*(id *)(a1 + 40) _transitionEventForTransitionWithContext:*(void *)(a1 + 32) identifier:*(void *)(a1 + 48) phase:2 animated:*(unsigned __int8 *)(a1 + 56)];
  [*(id *)(a1 + 40) _dispatchEventAndHandleAction:v22];
  [*(id *)(a1 + 40) _configureApplicationAndTransientOverlayDockBehaviorAssertionsForContext:*(void *)(a1 + 32)];
  uint64_t v23 = [*(id *)(a1 + 40) contentOrientation];
  id v24 = [*(id *)(a1 + 32) layoutState];
  uint64_t v25 = [v24 interfaceOrientation];

  if (v23 == v25
    || ![*(id *)(*(void *)(a1 + 40) + 1944) shouldPerformRotationAnimationForOrientationChange])
  {
    long long v32 = *(void **)(a1 + 40);
    id v26 = v4;
    if (v32[148])
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_7;
      v38[3] = &unk_1E6AF6828;
      void v38[4] = v32;
      CGFloat v39 = v18;
      [v32 _performWithFixedUpdateMode:2 usingBlock:v38];
    }
    else
    {
      long long v33 = ((void (**)(void, __CFString *))v18)[2](v18, @"update visible items accessory views layout and style");
      [v32 _updateVisibleItemsAccessoryViewsLayoutAndStyleWithCompletion:v33];
    }
  }
  else
  {
    id v26 = v4;
    id v27 = [v4 applicationContext];
    id v28 = [v27 animationSettings];

    long long v29 = ((void (**)(void, __CFString *))v18)[2](v18, @"rotation animation");
    char v30 = (void *)MEMORY[0x1E4F4F898];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_5;
    v42[3] = &unk_1E6AF4A70;
    void v42[4] = *(void *)(a1 + 40);
    v42[5] = v25;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_6;
    v40[3] = &unk_1E6AF5A50;
    id v41 = v29;
    id v31 = v29;
    [v30 animateWithSettings:v28 options:4 actions:v42 completion:v40];
  }
  long long v34 = *(void **)(a1 + 40);
  long long v35 = ((void (**)(void, __CFString *))v18)[2](v18, @"perform crossfade if needed");
  [v34 _performCrossfadeIfNeededWithCompletion:v35];
}

- (id)_transitionEventForTransitionWithContext:(id)a3 identifier:(id)a4 phase:(unint64_t)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [(SBFluidSwitcherViewController *)self dataSource];
  long long v13 = [v12 switcherContentController:self transitionEventForContext:v11 identifier:v10 phase:a5 animated:v6];

  return v13;
}

id __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v2 = (void *)MEMORY[0x1D948C7A0]();
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (void)_updateVisibleItemsAccessoryViewsLayoutAndStyleWithCompletion:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  [(SBFluidSwitcherViewController *)self _updateVisibleItems];
  [(SBFluidSwitcherViewController *)self _updateVisibleAccessoryViews];
  char v5 = [(SBSwitcherModifier *)self->_rootModifier transactionCompletionOptions];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __95__SBFluidSwitcherViewController__updateVisibleItemsAccessoryViewsLayoutAndStyleWithCompletion___block_invoke;
  v6[3] = &unk_1E6AFA2C8;
  v6[4] = self;
  BOOL v7 = (v5 & 2) != 0;
  BOOL v8 = (v5 & 4) != 0;
  [MEMORY[0x1E4FA5E48] perform:v6 finalCompletion:v4 options:0 delegate:self];

  kdebug_trace();
}

- (void)_updateVisibleShelves
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    char v5 = [(SBSwitcherModifier *)self->_rootModifier visibleShelves];
    BOOL v6 = [(NSMutableDictionary *)self->_visibleShelves allKeys];
    v107[0] = MEMORY[0x1E4F143A8];
    v107[1] = 3221225472;
    v107[2] = __54__SBFluidSwitcherViewController__updateVisibleShelves__block_invoke;
    v107[3] = &unk_1E6AFA748;
    id v7 = v5;
    id v108 = v7;
    double v109 = self;
    uint64_t v70 = objc_msgSend(v6, "bs_filter:", v107);

    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id obj = v7;
    uint64_t v75 = [obj countByEnumeratingWithState:&v103 objects:v115 count:16];
    if (v75)
    {
      id v73 = *(id *)v104;
      double v8 = *MEMORY[0x1E4F1DB28];
      double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      do
      {
        for (uint64_t i = 0; i != v75; ++i)
        {
          if (*(id *)v104 != v73) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v103 + 1) + 8 * i);
          uint64_t v14 = [(SBSwitcherModifier *)self->_rootModifier containerLeafAppLayoutForShelf:v13];
          uint64_t v15 = [(NSMutableDictionary *)self->_visibleShelves objectForKey:v13];
          if (!v15)
          {
            uint64_t v16 = [[SBSwitcherShelfViewController alloc] initWithShelf:v13 dataSource:self delegate:self];
            visibleShelves = self->_visibleShelves;
            uint64_t v113 = v13;
            uint64_t v114 = v16;
            int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
            [(NSMutableDictionary *)visibleShelves addEntriesFromDictionary:v18];

            uint64_t v102 = 0;
            long long v100 = 0u;
            long long v101 = 0u;
            long long v99 = 0u;
            rootModifier = self->_rootModifier;
            if (rootModifier)
            {
              [(SBSwitcherModifier *)rootModifier presentationAttributesForShelf:v13];
              uint64_t v20 = v102;
            }
            else
            {
              uint64_t v20 = 0;
            }
            [(SBSwitcherShelfViewController *)v16 setContentOptions:v20];
            [(SBFluidSwitcherViewController *)self addChildViewController:v16];
            [(SBSwitcherShelfViewController *)v16 beginAppearanceTransition:1 animated:0];
            if (v14)
            {
              uint64_t v21 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v14];
              id v22 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews objectForKey:v21];
              [v22 setShelfViewController:v16];
            }
            else
            {
              contentView = self->_contentView;
              uint64_t v21 = [(SBSwitcherShelfViewController *)v16 view];
              [(SBFluidSwitcherContentView *)contentView addSubview:v21];
            }

            [(SBSwitcherShelfViewController *)v16 endAppearanceTransition];
            [(SBSwitcherShelfViewController *)v16 didMoveToParentViewController:self];
            v97[0] = MEMORY[0x1E4F143A8];
            v97[1] = 3221225472;
            v97[2] = __54__SBFluidSwitcherViewController__updateVisibleShelves__block_invoke_2;
            v97[3] = &unk_1E6AF5290;
            v97[4] = self;
            uint64_t v15 = v16;
            double v98 = v15;
            [(SBFluidSwitcherViewController *)self _performWithFixedUpdateMode:1 usingBlock:v97];
            id v24 = [(SBFluidSwitcherLayoutContext *)self->_layoutContext activeTransitionContext];

            if (v24)
            {
              layoutStateTransitionCoordinator = self->_layoutStateTransitionCoordinator;
              id v26 = [(SBLayoutStateTransitionCoordinator *)layoutStateTransitionCoordinator transitionContext];
              [(SBSwitcherShelfViewController *)v15 layoutStateTransitionCoordinator:layoutStateTransitionCoordinator transitionDidBeginWithTransitionContext:v26];
            }
          }
          long long v79 = (void *)v14;
          if (v14)
          {
            id v27 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v14];
            id v28 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews objectForKey:v27];

            long long v29 = [(SBSwitcherShelfViewController *)v15 view];
            uint64_t v77 = v29;
            if ([(NSMutableSet *)self->_visibleShelvesHostedInContentView containsObject:v13])
            {
              [v29 removeFromSuperview];
              [v28 setShelfViewController:v15];
              [(NSMutableSet *)self->_visibleShelvesHostedInContentView removeObject:v13];
            }
            else
            {
              long long v33 = [v28 shelfViewController];

              if (v33 != v15)
              {
                long long v34 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews allValues];
                v93[0] = MEMORY[0x1E4F143A8];
                v93[1] = 3221225472;
                v93[2] = __54__SBFluidSwitcherViewController__updateVisibleShelves__block_invoke_4;
                v93[3] = &unk_1E6AFA770;
                long long v35 = v15;
                double v94 = v35;
                id v36 = objc_msgSend(v34, "bs_firstObjectPassingTest:", v93);

                [v36 setShelfViewController:0];
                [v28 setShelfViewController:v35];
              }
            }
          }
          else
          {
            char v30 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews allValues];
            v95[0] = MEMORY[0x1E4F143A8];
            v95[1] = 3221225472;
            v95[2] = __54__SBFluidSwitcherViewController__updateVisibleShelves__block_invoke_3;
            v95[3] = &unk_1E6AFA770;
            id v31 = v15;
            double v96 = v31;
            id v28 = objc_msgSend(v30, "bs_firstObjectPassingTest:", v95);

            uint64_t v32 = [(SBSwitcherShelfViewController *)v31 view];
            uint64_t v77 = (void *)v32;
            if (([(NSMutableSet *)self->_visibleShelvesHostedInContentView containsObject:v13] & 1) == 0)
            {
              [v28 setShelfViewController:0];
              [(SBFluidSwitcherContentView *)self->_contentView addSubview:v32];
              [(NSMutableSet *)self->_visibleShelvesHostedInContentView addObject:v13];
            }
          }
          long long v37 = [(SBSwitcherModifier *)self->_rootModifier focusedAppLayoutForShelf:v13];
          uint64_t v38 = (void *)MEMORY[0x1E4F1CAD0];
          CGFloat v39 = [v37 allItems];
          CGFloat v40 = [v38 setWithArray:v39];
          [(SBSwitcherShelfViewController *)v15 setFocusedDisplayItems:v40];

          id v41 = [(SBSwitcherModifier *)self->_rootModifier ignoredDisplayItemsForShelf:v13];
          [(SBSwitcherShelfViewController *)v15 setIgnoredDisplayItems:v41];
          long long v42 = [(SBSwitcherModifier *)self->_rootModifier homeAffordanceLayoutElementToPortalIntoShelf:v13];
          long long v43 = v42;
          if (v42 && ![v42 switcherLayoutElementType])
          {
            long long v44 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews objectForKey:v43];
            long long v45 = [v44 homeGrabberView];
            long long v46 = -[SBPortalView initWithFrame:]([SBPortalView alloc], "initWithFrame:", v8, v9, v10, v11);
            [(SBPortalView *)v46 setSourceView:v45];
            [(SBPortalView *)v46 setHidesSourceView:1];
            [(SBPortalView *)v46 setMatchesPosition:1];
            [(SBPortalView *)v46 setMatchesTransform:1];
            [(SBPortalView *)v46 setMatchesAlpha:1];
            [(SBSwitcherShelfViewController *)v15 setHomeAffordancePortalView:v46];
          }
          else
          {
            [(SBSwitcherShelfViewController *)v15 setHomeAffordancePortalView:0];
          }
        }
        uint64_t v75 = [obj countByEnumeratingWithState:&v103 objects:v115 count:16];
      }
      while (v75);
    }

    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v74 = v70;
    uint64_t v78 = [v74 countByEnumeratingWithState:&v89 objects:v112 count:16];
    if (v78)
    {
      uint64_t v47 = *(void *)v90;
      id v48 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
      uint64_t v71 = *(void *)v90;
      do
      {
        for (uint64_t j = 0; j != v78; ++j)
        {
          if (*(void *)v90 != v47) {
            objc_enumerationMutation(v74);
          }
          uint64_t v50 = *(void *)(*((void *)&v89 + 1) + 8 * j);
          uint64_t v51 = v48[134];
          CGRect v52 = [*(id *)((char *)&self->super.super.super.isa + v51) objectForKey:v50];
          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          long long v80 = v52;
          double v53 = [v52 allValues];
          uint64_t v54 = [v53 countByEnumeratingWithState:&v85 objects:v111 count:16];
          if (v54)
          {
            uint64_t v55 = v54;
            uint64_t v56 = *(void *)v86;
            do
            {
              for (uint64_t k = 0; k != v55; ++k)
              {
                if (*(void *)v86 != v56) {
                  objc_enumerationMutation(v53);
                }
                [*(id *)(*((void *)&v85 + 1) + 8 * k) invalidate];
              }
              uint64_t v55 = [v53 countByEnumeratingWithState:&v85 objects:v111 count:16];
            }
            while (v55);
          }

          [*(id *)((char *)&self->super.super.super.isa + v51) removeObjectForKey:v50];
          uint64_t v58 = [(NSMutableDictionary *)self->_visibleShelves objectForKey:v50];
          uint64_t v59 = v58;
          if (v58)
          {
            [v58 setHomeAffordancePortalView:0];
            [v59 willMoveToParentViewController:0];
            [v59 beginAppearanceTransition:0 animated:0];
            uint64_t v60 = [v59 view];
            uint64_t v61 = [v60 superview];
            uint64_t v62 = self->_contentView;

            if (v61 == v62)
            {
              [v60 removeFromSuperview];
            }
            else
            {
              long long v76 = v60;
              long long v83 = 0u;
              long long v84 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              uint64_t v63 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews allValues];
              uint64_t v64 = [v63 countByEnumeratingWithState:&v81 objects:v110 count:16];
              if (v64)
              {
                uint64_t v65 = v64;
                uint64_t v66 = *(void *)v82;
                while (2)
                {
                  for (uint64_t m = 0; m != v65; ++m)
                  {
                    if (*(void *)v82 != v66) {
                      objc_enumerationMutation(v63);
                    }
                    uint64_t v68 = *(void **)(*((void *)&v81 + 1) + 8 * m);
                    long long v69 = [v68 shelfViewController];

                    if (v69 == v59)
                    {
                      [v68 setShelfViewController:0];
                      goto LABEL_54;
                    }
                  }
                  uint64_t v65 = [v63 countByEnumeratingWithState:&v81 objects:v110 count:16];
                  if (v65) {
                    continue;
                  }
                  break;
                }
              }
LABEL_54:

              uint64_t v47 = v71;
              id v48 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
              uint64_t v60 = v76;
            }
            [v59 endAppearanceTransition];
            [v59 removeFromParentViewController];
          }
          [(NSMutableSet *)self->_visibleShelvesHostedInContentView removeObject:v50];
        }
        uint64_t v78 = [v74 countByEnumeratingWithState:&v89 objects:v112 count:16];
      }
      while (v78);
    }

    [(NSMutableDictionary *)self->_visibleShelves removeObjectsForKeys:v74];
    [(SBFluidSwitcherViewController *)self _ensureSubviewOrdering];
  }
}

- (void)_updateVisibleAccessoryViews
{
  [(SBFluidSwitcherViewController *)self _updateVisibleHomeAffordanceViews];
  [(SBFluidSwitcherViewController *)self _updateVisibleShelves];
}

- (void)_performCrossfadeIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  crossfadeSnapshotView = self->_crossfadeSnapshotView;
  if (crossfadeSnapshotView)
  {
    id v7 = crossfadeSnapshotView;
    double v8 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
    double v9 = (void *)MEMORY[0x1E4F42FF0];
    [v8 reduceMotionCrossfadeDuration];
    double v11 = v10;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__SBFluidSwitcherViewController__performCrossfadeIfNeededWithCompletion___block_invoke;
    v17[3] = &unk_1E6AF4AC0;
    int v18 = v7;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__SBFluidSwitcherViewController__performCrossfadeIfNeededWithCompletion___block_invoke_2;
    v13[3] = &unk_1E6AFA2A0;
    uint64_t v14 = v18;
    uint64_t v15 = self;
    id v16 = v5;
    uint64_t v12 = v18;
    [v9 animateWithDuration:v17 animations:v13 completion:v11];
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

- (void)noteAppLayoutsDidChange
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(SBFluidSwitcherViewController *)self _unadjustedAppLayouts];
  id v3 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    LOBYTE(v6) = 0;
    uint64_t v7 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        if (v6)
        {
          LOBYTE(v6) = 1;
          goto LABEL_23;
        }
        double v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        double v10 = [v9 allItems];
        uint64_t v6 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v6)
        {
          uint64_t v11 = *(void *)v27;
          while (2)
          {
            for (uint64_t j = 0; j != v6; ++j)
            {
              if (*(void *)v27 != v11) {
                objc_enumerationMutation(v10);
              }
              uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              if ([v13 type] != 3)
              {
                uint64_t v14 = [v13 uniqueIdentifier];
                [v3 addObject:v14];
                unint64_t v15 = [v3 countForObject:v14];

                if (v15 > 1)
                {
                  LOBYTE(v6) = 1;
                  goto LABEL_18;
                }
              }
            }
            uint64_t v6 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v6) {
              continue;
            }
            break;
          }
        }
LABEL_18:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
LABEL_23:

  self->_BOOL hasAnyUnadjustedAppLayoutsInDuality = v6;
  [(SBFluidSwitcherViewController *)self _rebuildCachedAdjustedAppLayouts];
  id v16 = [(SBFluidSwitcherViewController *)self view];
  [v16 setNeedsLayout];

  uint64_t v17 = self->_applicationRestrictionUpdatePendingAssertion;
  int v18 = [(SBFluidSwitcherViewController *)self view];
  uint64_t v19 = [v18 window];

  if (v19)
  {
    uint64_t v20 = +[SBApplicationController sharedInstance];
    uint64_t v21 = [v20 _applicationRestrictionMonitoringServer];
    id v22 = [v21 acquireApplicationRestrictionUpdatePendingAssertionForReason:@"Outstanding layout work for switcher"];
    applicationRestrictionUpdatePendingAssertiouint64_t n = self->_applicationRestrictionUpdatePendingAssertion;
    self->_applicationRestrictionUpdatePendingAssertiouint64_t n = v22;
  }
  [(BSInvalidatable *)v17 invalidate];
}

- (void)_rebuildCachedAdjustedAppLayouts
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBFluidSwitcherViewController *)self _unadjustedAppLayouts];
  id obj = [(SBSwitcherModifier *)self->_rootModifier adjustedAppLayoutsForAppLayouts:v3];
  long long v32 = self;
  if (!-[NSArray isEqualToArray:](self->_cachedAdjustedAppLayouts, "isEqualToArray:"))
  {
    long long v30 = v3;
    objc_storeStrong((id *)&self->_cachedAdjustedAppLayouts, obj);
    self->_appLayoutsGenerationCount = [(SBFluidSwitcherViewController *)self newAppLayoutsGenCount];
    appLayoutsForContinuousExposeIdentifiers = self->_appLayoutsForContinuousExposeIdentifiers;
    self->_appLayoutsForContinuousExposeIdentifiers = 0;

    uint64_t v5 = objc_opt_new();
    uint64_t v6 = objc_opt_new();
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v33 = self->_cachedAdjustedAppLayouts;
    uint64_t v7 = [(NSArray *)v33 countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v34 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v48 != v34) {
            objc_enumerationMutation(v33);
          }
          double v10 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v11 = [v10 leafAppLayouts];
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v53 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v44;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v44 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 8 * j);
                [v6 setObject:v10 forKey:v16];
                [v5 addObject:v16];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v53 count:16];
            }
            while (v13);
          }
        }
        uint64_t v8 = [(NSArray *)v33 countByEnumeratingWithState:&v47 objects:v54 count:16];
      }
      while (v8);
    }

    objc_storeStrong((id *)&v32->_cachedAdjustedLeafAppLayouts, v5);
    objc_storeStrong((id *)&v32->_leafAppLayoutsToAdjustedAppLayouts, v6);
    [(SBFluidSwitcherViewController *)v32 _updateVisibleAdjustedAppLayouts];
    [(SBFluidSwitcherViewController *)v32 _updateResignActiveAssertions];
    if ([(SBSwitcherKeyboardSuppressionMode *)v32->_lastKeyboardSuppressionMode suppressesSwitcherScenesOnly])
    {
      [(SBFluidSwitcherViewController *)v32 _acquireKeyboardSuppressionAssertionForMode:v32->_lastKeyboardSuppressionMode];
    }

    id v3 = v30;
  }
  uint64_t v17 = (NSDictionary *)objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v18 = v3;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v39 + 1) + 8 * k);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v24 = [v23 leafAppLayouts];
        uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v51 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v36;
          do
          {
            for (uint64_t m = 0; m != v26; ++m)
            {
              if (*(void *)v36 != v27) {
                objc_enumerationMutation(v24);
              }
              [(NSDictionary *)v17 setObject:v23 forKey:*(void *)(*((void *)&v35 + 1) + 8 * m)];
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v35 objects:v51 count:16];
          }
          while (v26);
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v20);
  }

  leafAppLayoutsToRecencyAppLayouts = v32->_leafAppLayoutsToRecencyAppLayouts;
  v32->_leafAppLayoutsToRecencyAppLayouts = v17;

  if ([(SBFluidSwitcherViewController *)v32 isChamoisWindowingUIEnabled]) {
    [(SBFluidSwitcherViewController *)v32 _updateContinuousExposeIdentifiersTransitioningFromAppLayout:0 toAppLayout:0 animated:0];
  }
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFluidSwitcherViewController *)self _unadjustedAppLayouts];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__SBFluidSwitcherViewController_appLayoutContainingAppLayout___block_invoke;
  v11[3] = &unk_1E6AF4B60;
  id v12 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v11);
  uint64_t v8 = v7;
  if (!v7) {
    uint64_t v7 = v6;
  }
  id v9 = v7;

  return v9;
}

- (id)_unadjustedAppLayouts
{
  id v3 = [(SBFluidSwitcherViewController *)self dataSource];
  id v4 = [v3 appLayoutsForSwitcherContentController:self];

  return v4;
}

- (void)_resetItemContainerShadowPathDisplayLink
{
  id v3 = SBLogAppSwitcher();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Destroying shadow path display link", v7, 2u);
  }

  shadowPathDisplayLinkRequiringReasons = self->_shadowPathDisplayLinkRequiringReasons;
  self->_shadowPathDisplayLinkRequiringReasons = 0;

  shadowPathDisplayLinuint64_t k = self->_shadowPathDisplayLink;
  if (shadowPathDisplayLink)
  {
    [(CADisplayLink *)shadowPathDisplayLink invalidate];
    id v6 = self->_shadowPathDisplayLink;
    self->_shadowPathDisplayLinuint64_t k = 0;
  }
}

- (unint64_t)newAppLayoutsGenCount
{
  unint64_t v2 = self->_appLayoutsGenerationCount + 1;
  self->_appLayoutsGenerationCount = v2;
  return v2;
}

uint64_t __104__SBFluidSwitcherViewController_shouldAddAppLayoutToFront_forTransitionWithContext_transitionCompleted___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_10(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 96) && !*(unsigned char *)(a1 + 97))
  {
    unint64_t v2 = [*(id *)(a1 + 32) layer];
    objc_msgSend(v2, "setAnchorPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  id v3 = *(void **)(a1 + 32);
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:");
  id v4 = *(void **)(a1 + 40);
  return [v4 setValue:1.0];
}

- (void)_updateItemContainerBackdropPresenceForIndex:(unint64_t)a3 scale:(double)a4 rotation:(double)a5 cornerRadius:(double)a6 animationAttributes:(id)a7 completion:(id)a8
{
  id v14 = a7;
  id v54 = a8;
  int v15 = [(SBSwitcherModifier *)self->_rootModifier shouldShowBackdropViewAtIndex:a3];
  uint64_t v81 = 0;
  long long v82 = &v81;
  uint64_t v83 = 0x3032000000;
  long long v84 = __Block_byref_object_copy__14;
  long long v85 = __Block_byref_object_dispose__14;
  visibleItemContainerBackdropViews = self->_visibleItemContainerBackdropViews;
  uint64_t v17 = [NSNumber numberWithUnsignedInteger:a3];
  id v86 = [(NSMutableDictionary *)visibleItemContainerBackdropViews objectForKey:v17];

  id v18 = [(SBFluidSwitcherViewController *)self appLayouts];
  uint64_t v19 = [v18 objectAtIndex:a3];

  uint64_t v20 = [(SBFluidSwitcherViewController *)self keyboardFocusedAppLayout];
  CGRect v52 = (void *)v20;
  if (v20) {
    BOOL v21 = v20 == v19;
  }
  else {
    BOOL v21 = 0;
  }
  int v22 = v21;
  if (v21) {
    int v23 = v15;
  }
  else {
    int v23 = 0;
  }
  if (v23 == 1)
  {
    int v24 = [(SBSwitcherModifier *)self->_rootModifier isFocusEnabledForAppLayout:v19];
    if (!v24) {
      goto LABEL_15;
    }
  }
  else
  {
    int v24 = v15 & ~v22;
    if (!v24)
    {
LABEL_15:
      int v25 = 0;
      goto LABEL_16;
    }
  }
  if (v82[5]) {
    goto LABEL_15;
  }
  uint64_t v41 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:101];
  long long v42 = (void *)v82[5];
  v82[5] = v41;

  objc_msgSend((id)v82[5], "bs_setHitTestingDisabled:", 1);
  memset(&v80, 0, sizeof(v80));
  CGAffineTransformMakeScale(&v80, a4, a4);
  CGAffineTransform v78 = v80;
  CGAffineTransformRotate(&v79, &v78, a5);
  CGAffineTransform v80 = v79;
  [(id)v82[5] setTransform:&v79];
  long long v43 = [(id)v82[5] layer];
  [v43 setCornerCurve:*MEMORY[0x1E4F39EA8]];

  long long v44 = [(id)v82[5] layer];
  [v44 setCornerRadius:a6];

  [(SBFluidSwitcherContentView *)self->_contentView addSubview:v82[5]];
  long long v45 = self->_visibleItemContainerBackdropViews;
  uint64_t v46 = v82[5];
  long long v47 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)v45 setObject:v46 forKey:v47];

  [(SBFluidSwitcherViewController *)self _ensureSubviewOrdering];
  int v25 = 1;
LABEL_16:
  uint64_t v26 = [v14 layoutUpdateMode];
  if (!v26) {
    uint64_t v26 = [v14 updateMode];
  }
  uint64_t v27 = [v14 positionUpdateMode];
  if (!v27) {
    uint64_t v27 = [v14 updateMode];
  }
  double v53 = [v14 layoutSettings];
  long long v28 = [v14 positionSettings];
  if ((v22 & 1) != 0
    || [(NSMutableSet *)self->_focusedItemBackdropsBeingRemoved containsObject:v82[5]])
  {
    uint64_t v27 = 1;
  }
  long long v29 = -[NSMutableDictionary objectForKey:](self->_visibleUnderlayAccessoryViews, "objectForKey:", v19, v19);
  long long v30 = v29;
  if (v24)
  {
    [v29 bounds];
    CGFloat x = v87.origin.x;
    CGFloat y = v87.origin.y;
    CGFloat width = v87.size.width;
    CGFloat height = v87.size.height;
    double v35 = CGRectGetWidth(v87);
    v88.origin.CGFloat x = x;
    v88.origin.CGFloat y = y;
    v88.size.CGFloat width = width;
    v88.size.CGFloat height = height;
    CGFloat v36 = CGRectGetHeight(v88);
    memset(&v80, 0, sizeof(v80));
    CGAffineTransformMakeScale(&v80, (14.0 / a4 + v35) / v35 * a4, (14.0 / a4 + v36) / v36 * a4);
    CGAffineTransform v78 = v80;
    CGAffineTransformRotate(&v79, &v78, a5);
    CGAffineTransform v80 = v79;
    if (v25) {
      uint64_t v37 = 1;
    }
    else {
      uint64_t v37 = v27;
    }
    long long v38 = (void *)MEMORY[0x1E4F42FF0];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __137__SBFluidSwitcherViewController__updateItemContainerBackdropPresenceForIndex_scale_rotation_cornerRadius_animationAttributes_completion___block_invoke;
    v71[3] = &unk_1E6AFA9B0;
    id v73 = &v81;
    id v72 = v30;
    CGFloat v74 = x;
    CGFloat v75 = y;
    CGFloat v76 = width;
    CGFloat v77 = height;
    objc_msgSend(v38, "sb_animateWithSettings:mode:animations:completion:", v28, v37, v71, 0);
    long long v39 = (void *)MEMORY[0x1E4F42FF0];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    CGAffineTransform v69 = v80;
    v68[2] = __137__SBFluidSwitcherViewController__updateItemContainerBackdropPresenceForIndex_scale_rotation_cornerRadius_animationAttributes_completion___block_invoke_2;
    v68[3] = &unk_1E6AFA9D8;
    v68[4] = &v81;
    double v70 = a6 + 14.0;
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __137__SBFluidSwitcherViewController__updateItemContainerBackdropPresenceForIndex_scale_rotation_cornerRadius_animationAttributes_completion___block_invoke_3;
    v66[3] = &unk_1E6AFA3D8;
    id v67 = v54;
    objc_msgSend(v39, "sb_animateWithSettings:mode:animations:completion:", v53, v26, v68, v66);

    long long v40 = v72;
    goto LABEL_35;
  }
  if (v82[5])
  {
    if (v22)
    {
      -[NSMutableSet addObject:](self->_focusedItemBackdropsBeingRemoved, "addObject:");
    }
    else
    {
      long long v48 = (void *)MEMORY[0x1E4F42FF0];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __137__SBFluidSwitcherViewController__updateItemContainerBackdropPresenceForIndex_scale_rotation_cornerRadius_animationAttributes_completion___block_invoke_4;
      v63[3] = &unk_1E6AF4B88;
      uint64_t v65 = &v81;
      id v64 = v29;
      objc_msgSend(v48, "sb_animateWithSettings:mode:animations:completion:", v28, v27, v63, 0);
    }
    [(id)v82[5] alpha];
    if (v49 != 0.0)
    {
      memset(&v80, 0, sizeof(v80));
      CGAffineTransformMakeScale(&v80, a4, a4);
      CGAffineTransform v78 = v80;
      CGAffineTransformRotate(&v79, &v78, a5);
      CGAffineTransform v80 = v79;
      long long v50 = (void *)MEMORY[0x1E4F42FF0];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __137__SBFluidSwitcherViewController__updateItemContainerBackdropPresenceForIndex_scale_rotation_cornerRadius_animationAttributes_completion___block_invoke_5;
      v59[3] = &unk_1E6AFAA00;
      void v59[4] = &v81;
      char v62 = v22;
      CGAffineTransform v60 = v79;
      double v61 = a6;
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __137__SBFluidSwitcherViewController__updateItemContainerBackdropPresenceForIndex_scale_rotation_cornerRadius_animationAttributes_completion___block_invoke_6;
      v55[3] = &unk_1E6AFAA28;
      v55[4] = self;
      uint64_t v57 = &v81;
      unint64_t v58 = a3;
      id v56 = v54;
      objc_msgSend(v50, "sb_animateWithSettings:mode:animations:completion:", v53, v26, v59, v55);
      long long v40 = v56;
LABEL_35:

      goto LABEL_38;
    }
  }
  if (v54) {
    (*((void (**)(id, uint64_t, void))v54 + 2))(v54, 1, 0);
  }
LABEL_38:

  _Block_object_dispose(&v81, 8);
}

- (id)keyboardFocusedAppLayout
{
  uint64_t v3 = objc_opt_class();
  id v4 = [MEMORY[0x1E4F42A28] focusSystemForEnvironment:self->_contentView];
  uint64_t v5 = [v4 focusedItem];
  id v6 = SBSafeCast(v3, v5);

  if (v6)
  {
    uint64_t v7 = [v6 appLayout];
    uint64_t v8 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)shouldAddAppLayoutToFront:(id)a3 forTransitionWithContext:(id)a4 transitionCompleted:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = [(SBFluidSwitcherViewController *)self draggingAppLayoutsForWindowDrag];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __104__SBFluidSwitcherViewController_shouldAddAppLayoutToFront_forTransitionWithContext_transitionCompleted___block_invoke;
  v23[3] = &unk_1E6AF9F18;
  v23[4] = self;
  uint64_t v11 = objc_msgSend(v10, "bs_compactMap:", v23);

  id v12 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  uint64_t v13 = [v12 recentAppLayouts];

  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __104__SBFluidSwitcherViewController_shouldAddAppLayoutToFront_forTransitionWithContext_transitionCompleted___block_invoke_2;
  BOOL v21 = &unk_1E6AF4B60;
  id v22 = v11;
  id v14 = v11;
  int v15 = objc_msgSend(v13, "bs_filter:", &v18);
  uint64_t v16 = [(SBFluidSwitcherViewController *)self layoutContext];
  LOBYTE(v5) = [v16 shouldAddAppLayoutToFront:v9 forTransitionWithContext:v8 recentAppLayouts:v15 transitionCompleted:v5];

  return v5;
}

- (void)_performEventResponse:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 9412, @"Invalid parameter not satisfying: %@", @"response" object file lineNumber description];
  }
  switch([v5 type])
  {
    case 1:
      [(SBFluidSwitcherViewController *)self _performModifierPerformTransitionResponse:v5];
      break;
    case 2:
      [(SBFluidSwitcherViewController *)self _performModifierCompletionResponse:v5];
      break;
    case 3:
      [(SBFluidSwitcherViewController *)self _performModifierHapticResponse:v5];
      break;
    case 4:
      [(SBFluidSwitcherViewController *)self _performModifierReachabilityResponse:v5];
      break;
    case 5:
      id v6 = [(SBFluidSwitcherViewController *)self _floatingDockController];
      [v6 presentFloatingDockIfDismissedAnimated:1 completionHandler:0];
      goto LABEL_28;
    case 6:
      id v6 = +[SBUIController sharedInstance];
      uint64_t v7 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
      [v6 handleHomeButtonSinglePressUpForWindowScene:v7];

      goto LABEL_28;
    case 7:
      [(SBFluidSwitcherViewController *)self _performModifierInjectVelocityResponse:v5];
      break;
    case 8:
      [(SBFluidSwitcherViewController *)self _performModifierEmitStudyLogResponse:v5];
      break;
    case 9:
      [(SBFluidSwitcherViewController *)self _performModifierEmitSBEventResponse:v5];
      break;
    case 10:
      [(SBFluidSwitcherViewController *)self _performModifierUpdateLayoutResponse:v5];
      break;
    case 11:
      [(SBFluidSwitcherViewController *)self _performModifierScrollToAppLayoutResponse:v5];
      break;
    case 12:
      [(SBFluidSwitcherViewController *)self _performModifierIconOverlayVisibilityUpdateResponse:v5];
      break;
    case 13:
      [(SBFluidSwitcherViewController *)self _performModifierIconViewVisibilityUpdateResponse:v5];
      break;
    case 14:
      [(SBFluidSwitcherViewController *)self _performModifierNotifyIconWillZoomDownResponse:v5];
      break;
    case 15:
      [(SBFluidSwitcherViewController *)self _performModifierMatchMoveToIconViewResponse:v5];
      break;
    case 17:
      [(SBFluidSwitcherViewController *)self _performModifierTimerEventResponse:v5];
      break;
    case 18:
      [(SBFluidSwitcherViewController *)self _performModifierInvalidateAdjustedAppLayoutsResponse:v5];
      break;
    case 19:
      [(SBFluidSwitcherViewController *)self _performModifierDosidoScaleAnimationResponse:v5];
      break;
    case 20:
      [(SBFluidSwitcherViewController *)self _performBlurItemContainerResponse:v5];
      break;
    case 21:
      [(SBFluidSwitcherViewController *)self _performNewWindowSwitcherResponse:v5];
      break;
    case 22:
      [(SBFluidSwitcherViewController *)self _performModifierInvalidateReopenButtonTextResponse:v5];
      break;
    case 23:
      [(SBFluidSwitcherViewController *)self _performModifierDismissSiriResponse:v5];
      break;
    case 24:
      -[SBFluidSwitcherViewController _cancelInProcessAnimationsWithOptions:](self, "_cancelInProcessAnimationsWithOptions:", [v5 options]);
      break;
    case 25:
      id v6 = [(SBFluidSwitcherLayoutContext *)self->_layoutContext activeTransitionContext];
      [(SBFluidSwitcherViewController *)self _setupPIPMorphingIfNeededForTransitionContext:v6 response:v5];
LABEL_28:

      break;
    case 26:
      [(SBFluidSwitcherViewController *)self _performFolderSnapshotRequestResponse:v5];
      break;
    case 29:
      [(SBFluidSwitcherViewController *)self _performInvalidateSnapshotCacheResponse:v5];
      break;
    case 30:
      [(SBFluidSwitcherViewController *)self _performInvalidateItemContainerBackdropResponse:v5];
      break;
    case 32:
      [(SBFluidSwitcherViewController *)self _performUpdateDragPlatterBlurResponse:v5];
      break;
    case 33:
      [(SBFluidSwitcherViewController *)self _performUpdateContinuousExposeStripsPresentationResponse:v5];
      break;
    case 34:
      [(SBFluidSwitcherViewController *)self _performInvalidateContinuousExposeIdentifiersResponse:v5];
      break;
    case 35:
      [(SBFluidSwitcherViewController *)self _performRequestSystemApertureElementSuppressionResponse:v5];
      break;
    case 36:
      [(SBFluidSwitcherViewController *)self _performRelinquishSystemApertureElementSuppressionResponse:v5];
      break;
    case 37:
      [(SBFluidSwitcherViewController *)self _performSystemApertureBounceResponse:v5];
      break;
    case 38:
      [(SBFluidSwitcherViewController *)self _performSystemApertureStretchResponse:v5];
      break;
    case 39:
      [(SBFluidSwitcherViewController *)self _performSetInterfaceOrientationFromUserResizingResponse:v5];
      break;
    case 40:
      [(SBFluidSwitcherViewController *)self _performPresentContinuousExposeStripEdgeProtectGrabberResponse:v5];
      break;
    case 41:
      [(SBFluidSwitcherViewController *)self _performInvalidateRootContentViewClippingAndBlurResponse:v5];
      break;
    case 42:
      [(SBFluidSwitcherViewController *)self _performActionForPreludeAnimationTokenActionResponse:v5];
      break;
    case 44:
      [(SBFluidSwitcherViewController *)self _performModifierMatchMoveToDropletResponse:v5];
      break;
    case 45:
      [(SBFluidSwitcherViewController *)self _performCancelSystemGesturesResponse:v5];
      break;
    case 46:
      [(SBFluidSwitcherViewController *)self _performCancelWindowMorphingResponse:v5];
      break;
    default:
      break;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__SBFluidSwitcherViewController__performEventResponse___block_invoke;
  void v9[3] = &unk_1E6AFAB18;
  void v9[4] = self;
  [v5 enumerateChildResponsesUsingBlock:v9];
}

- (void)_handleEventResponse:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 9390, @"Invalid parameter not satisfying: %@", @"response" object file lineNumber description];
  }
  if ([v5 isValid])
  {
    [v5 delay];
    if (BSFloatIsZero())
    {
      [(SBFluidSwitcherViewController *)self _performEventResponse:v5];
    }
    else
    {
      [v5 delay];
      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__SBFluidSwitcherViewController__handleEventResponse___block_invoke;
      block[3] = &unk_1E6AF5290;
      id v13 = v5;
      id v14 = self;
      dispatch_after(v10, MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    id v6 = SBLogAppSwitcher();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      debugName = self->_debugName;
      id v8 = [v5 description];
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = debugName;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "[Fluid Switcher - %@] Skipping the following action because it's no longer valid: %@", buf, 0x16u);
    }
  }
}

uint64_t __55__SBFluidSwitcherViewController__performEventResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleEventResponse:a2];
}

- (void)_performModifierTimerEventResponse:(id)a3
{
  id v4 = a3;
  id v5 = [SBTimerSwitcherModifierEvent alloc];
  id v6 = [v4 reason];

  uint64_t v7 = [(SBTimerSwitcherModifierEvent *)v5 initWithReason:v6];
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v7];
}

- (void)_performModifierIconOverlayVisibilityUpdateResponse:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 appLayout];
  uint64_t v7 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews objectForKey:v6];
  if ([v5 isVisible])
  {
    id v23 = v5;
    if (!v7)
    {
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 9734, @"Trying to add an icon overlay but the item container for this app layout doesn't exist: %@", 0 object file lineNumber description];
    }
    id v8 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
    double v9 = [v6 anyLeafAppLayout];
    uint64_t v10 = [v8 iconZoomingViewForAppLayout:v9];

    uint64_t v11 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
    id v22 = (void *)v10;
    BOOL v21 = [v11 matchingIconZoomingViewForIconZoomingView:v10];

    id v12 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = [v6 leafAppLayouts];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [(NSMutableDictionary *)self->_visibleItemContainers objectForKey:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          uint64_t v19 = [v18 _pageView];
          [v12 addObject:v19];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v15);
    }

    [v7 configureOverlayForIconZoomWithView:v21 crossfadeViews:v12];
    id v5 = v23;
  }
  else
  {
    [v7 removeIconOverlay];
  }
}

- (void)_performModifierIconViewVisibilityUpdateResponse:(id)a3
{
  id v4 = a3;
  id v5 = [v4 appLayout];
  id v6 = [v4 animationSettings];
  if (v6) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 2;
  }
  id v8 = [(NSMutableDictionary *)self->_hiddenIconViews objectForKey:v5];
  if ([v4 isVisible])
  {
    double v9 = [(NSMutableDictionary *)self->_hiddenIconViewContainers objectForKey:v5];
    uint64_t v10 = (void *)MEMORY[0x1E4F42FF0];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __82__SBFluidSwitcherViewController__performModifierIconViewVisibilityUpdateResponse___block_invoke;
    id v25[3] = &unk_1E6AF4E00;
    id v26 = v8;
    long long v27 = self;
    id v28 = v9;
    id v11 = v9;
    objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v6, v7, v25, 0);
    [(NSMutableDictionary *)self->_hiddenIconViews removeObjectForKey:v5];
    [(NSMutableDictionary *)self->_hiddenIconViewContainers removeObjectForKey:v5];
  }
  else
  {
    if (v8) {
      goto LABEL_8;
    }
    uint64_t v20 = v7;
    id v12 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
    id v11 = [v12 iconZoomingViewForAppLayout:v5];

    id v13 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
    uint64_t v14 = [v4 excludedIconLocations];
    int v15 = [v13 isIconForIconZoomingView:v11 displayedInLocations:v14];

    if (!v15)
    {
      if (!v11) {
        goto LABEL_8;
      }
      [(NSMutableDictionary *)self->_hiddenIconViews setObject:v11 forKey:v5];
      uint64_t v16 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
      __int16 v17 = [v16 iconZoomingViewContainerForIconZoomingView:v11];

      if (v17) {
        [(NSMutableDictionary *)self->_hiddenIconViewContainers setObject:v17 forKey:v5];
      }
      uint64_t v18 = (void *)MEMORY[0x1E4F42FF0];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __82__SBFluidSwitcherViewController__performModifierIconViewVisibilityUpdateResponse___block_invoke_2;
      v21[3] = &unk_1E6AF4E00;
      id v22 = v11;
      id v23 = v17;
      long long v24 = self;
      id v19 = v17;
      id v11 = v11;
      objc_msgSend(v18, "sb_animateWithSettings:mode:animations:completion:", v6, v20, v21, 0);
    }
  }

LABEL_8:
}

- (id)_iconZoomContextProvider
{
  uint64_t v3 = [(SBFluidSwitcherViewController *)self dataSource];
  id v4 = v3;
  if ((*(unsigned char *)&self->_dataSourceRespondsTo & 2) != 0)
  {
    id v5 = [v3 switcherIconZoomContextProviderForSwitcherContentController:self];
  }
  else
  {
    id v5 = self;
  }
  id v6 = v5;

  return v6;
}

- (CGRect)homeScreenIconFrameForAppLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
  [v5 iconFrameForAppLayout:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)iconImageFrameForAppLayout:(id)a3
{
  char v18 = 1;
  id v4 = [(SBFluidSwitcherViewController *)self activatingDisplayItemForAppLayout:a3];
  id v5 = [(SBFluidSwitcherViewController *)self _iconViewForDisplayItem:v4 isVisible:&v18];

  if (v18)
  {
    [(SBFluidSwitcherViewController *)self _iconImageFrameForIconView:v5];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB20];
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (id)iconViewForAppLayout:(id)a3
{
  id v4 = [(SBFluidSwitcherViewController *)self activatingDisplayItemForAppLayout:a3];
  id v5 = [(SBFluidSwitcherViewController *)self _iconViewForDisplayItem:v4 isVisible:0];

  return v5;
}

- (id)matchingIconZoomingViewForIconZoomingView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      double v7 = v6;
    }
    else {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    double v9 = [(SBFluidSwitcherViewController *)self dataSource];
    double v10 = v9;
    if ((*(unsigned char *)&self->_dataSourceRespondsTo & 0x80) != 0)
    {
      double v11 = [v9 matchingIconViewForIconView:v8];
    }
    else
    {
      double v11 = 0;
    }
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (BOOL)isIconForIconZoomingView:(id)a3 displayedInLocations:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      double v10 = v9;
    }
    else {
      double v10 = 0;
    }
  }
  else
  {
    double v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    double v12 = [(SBFluidSwitcherViewController *)self _iconManager];
    double v13 = [v11 icon];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v7;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v14);
          }
          if (objc_msgSend(v12, "isDisplayingIcon:inLocation:", v13, *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19))
          {
            LOBYTE(v15) = 1;
            goto LABEL_17;
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (void)_performModifierUpdateLayoutResponse:(id)a3
{
  id activeTransitionSubcompletionGenerator = self->_activeTransitionSubcompletionGenerator;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1D948C7A0](activeTransitionSubcompletionGenerator);
  uint64_t v7 = [v5 options];
  uint64_t v8 = [v5 updateMode];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__SBFluidSwitcherViewController__performModifierUpdateLayoutResponse___block_invoke;
  v14[3] = &unk_1E6AF76F8;
  uint64_t v16 = v7;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  double v10 = (void (**)(void))MEMORY[0x1D948C7A0](v14);
  id v11 = v10;
  if (v8)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __70__SBFluidSwitcherViewController__performModifierUpdateLayoutResponse___block_invoke_2;
    v12[3] = &unk_1E6AF5300;
    double v13 = v10;
    [(SBFluidSwitcherViewController *)self _performWithFixedUpdateMode:v8 usingBlock:v12];
  }
  else
  {
    v10[2](v10);
  }
}

- (void)overlayAccessoryView:(id)a3 didUpdateShowingIconOverlay:(BOOL)a4
{
  BOOL v17 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews allKeysForObject:a3];
  id v6 = [v5 firstObject];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v16 = v6;
  uint64_t v7 = [v6 leafAppLayouts];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = [(NSMutableDictionary *)self->_visibleItemContainers objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * v11)];
        double v13 = [v12 contentView];
        char v14 = objc_opt_respondsToSelector();

        if (v14)
        {
          id v15 = [v12 contentView];
          [v15 setShowingIconOverlayView:v17];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

- (int64_t)homeScreenInterfaceOrientation
{
  uint64_t v3 = [(SBFluidSwitcherViewController *)self dataSource];
  id v4 = v3;
  if ((*((unsigned char *)&self->_dataSourceRespondsTo + 1) & 4) != 0) {
    int64_t v5 = [v3 homeScreenInterfaceOrientationForContentController:self];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)noteKeyboardFocusDidChangeToSceneID:(id)a3
{
}

- (void)_cancelInProcessAnimationsWithOptions:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if ((a3 & 2) != 0)
  {
    int64_t v5 = [(SBFluidSwitcherViewController *)self _homeScreenAppearanceController];
    [v5 cancelInProcessAnimations];

    id v6 = +[SBWallpaperController sharedInstance];
    [v6 cancelInProcessAnimations];
  }
  if (v3)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v7 = [(NSMutableDictionary *)self->_visibleItemContainers allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v41;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * v11++) _removeAllRetargetableAnimations:1];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v9);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    double v12 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews allValues];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v37;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v36 + 1) + 8 * v16++) _removeAllRetargetableAnimations:1];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v14);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    BOOL v17 = [(NSMutableDictionary *)self->_visibleUnderlayAccessoryViews allValues];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v45 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * v21++) _removeAllRetargetableAnimations:1];
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v45 count:16];
      }
      while (v19);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v22 = [(NSMutableDictionary *)self->_externalDropletZoomUpTokens allValues];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v44 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v29;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v29 != v25) {
            objc_enumerationMutation(v22);
          }
          long long v27 = [*(id *)(*((void *)&v28 + 1) + 8 * v26) animatingDroplet];
          [v27 _removeAllRetargetableAnimations:1];

          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v44 count:16];
      }
      while (v24);
    }
  }
}

- (id)_homeScreenAppearanceController
{
  unint64_t v2 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  char v3 = [v2 homeScreenController];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[SBUIController sharedInstance];
  }
  id v6 = v5;

  return v6;
}

- (int64_t)numberOfVisibleAppLayoutsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFluidSwitcherViewController *)self dataSource];
  id v6 = v5;
  $0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = self->_dataSourceRespondsTo;
  if ((*(_WORD *)&dataSourceRespondsTo & 0x8000) != 0)
  {
    uint64_t v11 = [v5 switcherContentController:self visibleAppLayoutsForBundleIdentifier:v4];
    uint64_t v8 = [v11 count];

    if ((*(_DWORD *)&self->_dataSourceRespondsTo & 0x10000) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(_DWORD *)&dataSourceRespondsTo & 0x10000) != 0)
    {
LABEL_3:
      uint64_t v9 = [v6 switcherContentController:self visibleDisplayItemsForBundleIdentifier:v4];
      int64_t v10 = [v9 count];

      goto LABEL_6;
    }
  }
  int64_t v10 = 0;
LABEL_6:
  if (v8 < v10) {
    int64_t v10 = v8;
  }

  return v10;
}

void __82__SBFluidSwitcherViewController__performModifierIconViewVisibilityUpdateResponse___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIconContentHidden:0];
  unint64_t v2 = [*(id *)(a1 + 40) _iconZoomContextProvider];
  [v2 stopTrackingHiddenIconZoomViewIfNeeded:*(void *)(a1 + 32)];

  id v3 = [*(id *)(a1 + 40) _iconZoomContextProvider];
  [v3 stopTrackingHiddenIconZoomViewIfNeeded:*(void *)(a1 + 48)];
}

- (void)stopTrackingHiddenIconZoomViewIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v8 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v8;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  [v7 removeObserver:self];
}

void __82__SBFluidSwitcherViewController__performModifierIconViewVisibilityUpdateResponse___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setIconContentHidden:1];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) _iconZoomContextProvider];
  id v5 = v3;
  uint64_t v4 = 40;
  if (!v2) {
    uint64_t v4 = 32;
  }
  [v3 startTrackingHiddenIconZoomViewIfNeeded:*(void *)(a1 + v4)];
}

- (void)startTrackingHiddenIconZoomViewIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v8 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v8;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  [v7 addObserver:self];
}

- (void)_updateTitlePresenceForAdjustedAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_visibleUnderlayAccessoryViews objectForKey:v4];
  id v6 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews objectForKey:v4];
  BOOL v7 = [(SBFluidSwitcherViewController *)self _allowsTitleItemsForAppLayout:v4];
  id v8 = [(NSMutableDictionary *)self->_appLayoutToTitleItemController objectForKey:v4];
  BOOL v9 = [(SBFluidSwitcherViewController *)self isChamoisWindowingUIEnabled];
  if (!v8)
  {
    if (v7) {
      goto LABEL_5;
    }
    uint64_t v21 = [v6 titleItems];
    if (v21)
    {
    }
    else
    {
      long long v22 = [v5 titleItems];

      if (!v22) {
        goto LABEL_17;
      }
    }
LABEL_16:
    [v5 setTitleItems:0 animated:0];
    [v6 setTitleItems:0 animated:0];
    goto LABEL_17;
  }
  if (!(v7 & (v9 ^ [v8 isChamoisWindowingEnabled])))
  {
    if (v7) {
      goto LABEL_17;
    }
    [v8 invalidate];
    [(NSMutableDictionary *)self->_appLayoutToTitleItemController removeObjectForKey:v4];
    goto LABEL_16;
  }
  [v8 invalidate];
  [v5 setTitleItems:0 animated:0];
  [v6 setTitleItems:0 animated:0];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  void v35[2] = __74__SBFluidSwitcherViewController__updateTitlePresenceForAdjustedAppLayout___block_invoke;
  v35[3] = &unk_1E6AF59B8;
  v35[4] = self;
  id v36 = v4;
  id v37 = v5;
  id v38 = v6;
  [(SBFluidSwitcherViewController *)self _performWithFixedUpdateMode:2 usingBlock:v35];

LABEL_5:
  uint64_t v24 = v6;
  uint64_t v25 = v5;
  if (__sb__runningInSpringBoard())
  {
    BOOL v10 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v10 = [v11 userInterfaceIdiom] == 1;
  }
  BOOL v23 = [(SBFluidSwitcherViewController *)self _shouldItemContainersUseDarkLabels];
  double v12 = [(SBFluidSwitcherViewController *)self traitCollection];
  uint64_t v13 = [v12 userInterfaceStyle];

  uint64_t v14 = [SBFluidSwitcherSpaceTitleItemController alloc];
  sceneManager = self->_sceneManager;
  uint64_t v16 = [(SBSceneManager *)sceneManager displayIdentity];
  BOOL v17 = [(SBFluidSwitcherSpaceTitleItemController *)v14 initWithAppLayout:v4 applicationSceneHandleProvider:sceneManager displayIdentity:v16 showCanvasTitles:v10 isChamoisWindowingEnabled:v9];

  appLayoutToTitleItemController = self->_appLayoutToTitleItemController;
  if (!appLayoutToTitleItemController)
  {
    uint64_t v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v20 = self->_appLayoutToTitleItemController;
    self->_appLayoutToTitleItemController = v19;

    appLayoutToTitleItemController = self->_appLayoutToTitleItemController;
  }
  [(NSMutableDictionary *)appLayoutToTitleItemController setObject:v17 forKey:v4];
  objc_initWeak(&location, self);
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  [(SBFluidSwitcherSpaceTitleItemController *)v17 setUseDarkLabels:v23];
  id v6 = v24;
  uint64_t v5 = v25;
  [(SBFluidSwitcherSpaceTitleItemController *)v17 setUserInterfaceStyle:v13];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __74__SBFluidSwitcherViewController__updateTitlePresenceForAdjustedAppLayout___block_invoke_2;
  v26[3] = &unk_1E6AFA658;
  objc_copyWeak(&v29, &location);
  id v27 = v4;
  long long v28 = &v30;
  [(SBFluidSwitcherSpaceTitleItemController *)v17 setUpdateHandler:v26];
  *((unsigned char *)v31 + 24) = 0;

  objc_destroyWeak(&v29);
  _Block_object_dispose(&v30, 8);
  objc_destroyWeak(&location);

LABEL_17:
}

- (BOOL)_allowsTitleItemsForAppLayout:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = WeakRetained;
  if ((*((unsigned char *)&self->_dataSourceRespondsTo + 2) & 8) != 0) {
    char v7 = [WeakRetained switcherContentController:self supportsTitleItemsForAppLayout:v4];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)_updateTitleItemsLabelColor
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBFluidSwitcherViewController *)self _shouldItemContainersUseDarkLabels];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(NSMutableDictionary *)self->_appLayoutToTitleItemController allValues];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setUseDarkLabels:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)_shouldItemContainersUseDarkLabels
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v4 = WeakRetained;
  BOOL v5 = (*((unsigned char *)&self->_dataSourceRespondsTo + 1) & 8) != 0
    && [WeakRetained backdropInterfaceStyleForContentController:self] == 1;

  return v5;
}

void __74__SBFluidSwitcherViewController__updateTitlePresenceForAdjustedAppLayout___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained[231] objectForKey:*(void *)(a1 + 32)];
    uint64_t v7 = [v5[230] objectForKey:*(void *)(a1 + 32)];
    unsigned int v8 = [v5[162] containsObject:*(void *)(a1 + 32)];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v8;
    }
    if (v6) {
      [v6 setTitleItems:v10 animated:v9];
    }
    if (v7) {
      [v7 setTitleItems:v10 animated:v9];
    }
  }
}

- (id)iconZoomingViewContainerForIconZoomingView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    uint64_t v9 = [v8 location];
    if ([v9 isEqualToString:*MEMORY[0x1E4F4B780]])
    {
      id v10 = [(SBFluidSwitcherViewController *)self _iconManager];
      long long v11 = [v10 appPredictionsIconViewDisplayingIconView:v8 options:1];
    }
    else
    {
      long long v11 = 0;
    }
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

void __73__SBFluidSwitcherViewController_animationControllerForTransitionRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v10 = [v7 applicationContext];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__SBFluidSwitcherViewController_animationControllerForTransitionRequest___block_invoke_2;
    v11[3] = &unk_1E6AF5A50;
    id v12 = v8;
    [WeakRetained performTransitionWithContext:v10 animated:1 completion:v11];
  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
}

- (void)_acquireKeyboardSuppressionAssertionForMode:(id)a3
{
  id v20 = a3;
  id v5 = +[SBSwitcherKeyboardSuppressionMode suppressionModeNone];

  if (v5 == v20)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherViewController.m" lineNumber:9043 description:@"We shouldn't be acquiring a keyboard suppression if the mode is None."];
  }
  id v6 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  id v7 = [v6 medusaHostedKeyboardWindowController];
  char v8 = [v7 isUsingMedusaHostedKeyboardWindow];

  uint64_t v9 = [(SBFluidSwitcherViewController *)self layoutContext];
  id v10 = [v9 layoutState];
  long long v11 = [v10 elements];
  if ((unint64_t)[v11 count] > 1)
  {

LABEL_10:
    if ([v20 suppressesSwitcherScenesOnly])
    {
      uint64_t v16 = [v20 appLayouts];
      BOOL v17 = [(SBFluidSwitcherViewController *)self _sceneDeactivationPredicateMatchingAppLayouts:v16];
    }
    else
    {
      BOOL v17 = 0;
    }
    uint64_t v18 = +[SBKeyboardSuppressionManager sharedInstance];
    [v18 startSuppressingKeyboardWithReason:self->_fluidSwitcherAssertionReason predicate:v17 displayIdentity:0];

    goto LABEL_14;
  }
  id v12 = [(SBFluidSwitcherViewController *)self layoutContext];
  uint64_t v13 = [v12 transitioningFromLayoutState];
  uint64_t v14 = [v13 elements];
  unint64_t v15 = [v14 count];

  if (v15 > 1) {
    char v8 = 1;
  }

  if (v8 & 1) != 0 || ([v20 applyAssertionEvenIfAppIsHostingTheKeyboard]) {
    goto LABEL_10;
  }
LABEL_14:
}

- (void)viewWillLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)SBFluidSwitcherViewController;
  [(SBFluidSwitcherViewController *)&v7 viewWillLayoutSubviews];
  BOOL hasAnyUnadjustedAppLayoutsInDuality = self->_hasAnyUnadjustedAppLayoutsInDuality;
  uint64_t v4 = qword_1EA8BF6F8;
  if (self->_hasAnyUnadjustedAppLayoutsInDuality) {
    qword_1EA8BF6F8 = (uint64_t)"note: performing implicit switcher layout with duality app layouts";
  }
  if (!self->_hasDispatchedInitialSetupEvent)
  {
    id v5 = [(SBFluidSwitcherViewController *)self view];
    [(SBInitialSetupSwitcherModifierEvent *)v5 bounds];
    if (!CGRectIsEmpty(v8))
    {
      contentOrientatiouint64_t n = self->_contentOrientation;

      if (!contentOrientation) {
        goto LABEL_8;
      }
      self->_hasDispatchedInitialSetupEvent = 1;
      id v5 = objc_alloc_init(SBInitialSetupSwitcherModifierEvent);
      [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v5];
    }
  }
LABEL_8:
  [(SBFluidSwitcherViewController *)self _updateVisibleItemsAccessoryViewsLayoutAndStyleWithCompletion:0];
  if (hasAnyUnadjustedAppLayoutsInDuality) {
    qword_1EA8BF6F8 = v4;
  }
}

uint64_t __59__SBFluidSwitcherViewController_liveOverlayForSceneHandle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 overlaySceneHandle];
  uint64_t v3 = BSEqualObjects();

  return v3;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector()) {
    [(SBSwitcherLiveContentOverlayCoordinating *)self->_liveContentOverlayCoordinator layoutStateTransitionCoordinator:v6 transitionWillEndWithTransitionContext:v7];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  CGRect v8 = [(NSMutableDictionary *)self->_visibleShelves allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) layoutStateTransitionCoordinator:v6 transitionWillEndWithTransitionContext:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (id)sceneHandleProviderForSnapshotView:(id)a3
{
  uint64_t v3 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  uint64_t v4 = [v3 sceneManager];

  return v4;
}

- (id)displayIdentityForSnapshotView:(id)a3
{
  uint64_t v3 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  uint64_t v4 = [v3 sceneManager];
  id v5 = [v4 displayIdentity];

  return v5;
}

void __93__SBFluidSwitcherViewController__unblurItemContainer_blurParameters_withAnimationUpdateMode___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) layer];
  [v2 setFilters:0];

  uint64_t v3 = [*(id *)(a1 + 32) layer];
  uint64_t v4 = [*(id *)(a1 + 40) traitCollection];
  [v4 displayScale];
  objc_msgSend(v3, "setRasterizationScale:");

  id v5 = [*(id *)(a1 + 32) layer];
  [v5 setShouldRasterize:0];
}

void __95__SBFluidSwitcherViewController__updateStatusBarAndHomeGrabberVisibilityForAppLayout_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (*(unsigned char *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", *(void *)(a1 + 32), 3, v6, v5);
  }
  else
  {
    if (v6) {
      v6[2](v6);
    }
    if (v5) {
      v5[2](v5, 1, 0);
    }
  }
}

- (void)addLiveContentOverlay:(id)a3 forAppLayout:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v26 = a3;
  id v9 = a4;
  id v10 = [(NSMutableDictionary *)self->_liveContentOverlays objectForKey:v9];

  if (v10 != v26)
  {
    int v11 = [(SBAppSwitcherSettings *)self->_settings shouldRedactWindowContents];
    uint64_t v12 = [(NSMutableDictionary *)self->_liveContentOverlays objectForKey:v9];
    if (v12)
    {
      id v20 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v21 = (objc_class *)objc_opt_class();
      long long v22 = NSStringFromClass(v21);
      [v20 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 2720, @"The appLayout %@ already has an overlay <%@:%p>", v9, v22, v12 object file lineNumber description];
    }
    int v13 = v5 & ~v11;
    long long v14 = [(NSMutableDictionary *)self->_liveContentOverlays allValues];
    int v15 = [v14 containsObject:v26];

    if (v15)
    {
      BOOL v23 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      [v23 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 2721, @"The overlay <%@:%p> for %@ is already active for another app layout", v25, v26, v9 object file lineNumber description];
    }
    long long v16 = [(SBFluidSwitcherViewController *)self visibleItemContainers];
    BOOL v17 = [v16 objectForKey:v9];

    uint64_t v18 = v13 & ~[v17 contentViewHasSceneOverlay];
    uint64_t v19 = [v26 contentOverlayView];
    [v17 setContentOverlay:v19 animated:v18];

    [(NSMutableDictionary *)self->_liveContentOverlays setObject:v26 forKey:v9];
    [(SBFluidSwitcherViewController *)self _setupLiveContentOverlayForAppLayout:v9 itemContainer:v17 overlay:v26];
  }
}

- (NSMutableDictionary)visibleItemContainers
{
  return self->_visibleItemContainers;
}

- (void)_addVisibleItemContainerForAppLayout:(id)a3 reusingItemContainerIfExists:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(SBSwitcherLiveContentOverlayCoordinating *)self->_liveContentOverlayCoordinator appLayoutWillBecomeVisible:v6];
  CGRect v8 = [(NSMutableArray *)self->_hiddenRecycledItemContainers _sb_peek];
  if (v8
    && [(SBFluidSwitcherPageContentViewProvider *)self->_pageContentViewProvider isSuitableForRecycledItemContainer:v6])
  {

    if (!v7)
    {
      id v9 = [(NSMutableArray *)self->_hiddenRecycledItemContainers _sb_dequeue];
LABEL_9:
      [v9 setActive:1];
      [v9 setAppLayout:v6];
      [v9 setHidden:0];
      goto LABEL_11;
    }
LABEL_6:
    liveContentOverlayCoordinator = self->_liveContentOverlayCoordinator;
    int v11 = [v7 appLayout];
    [(SBSwitcherLiveContentOverlayCoordinating *)liveContentOverlayCoordinator itemContainerForAppLayout:v11 willBeReusedForAppLayout:v6];

    if ([(NSMutableArray *)self->_hiddenRecycledItemContainers containsObject:v7]) {
      [(NSMutableArray *)self->_hiddenRecycledItemContainers removeObject:v7];
    }
    id v9 = v7;
    visibleItemContainers = self->_visibleItemContainers;
    int v13 = [(NSMutableDictionary *)visibleItemContainers allKeysForObject:v9];
    [(NSMutableDictionary *)visibleItemContainers removeObjectsForKeys:v13];

    goto LABEL_9;
  }

  if (v7) {
    goto LABEL_6;
  }
  [(SBFluidSwitcherPageContentViewProvider *)self->_pageContentViewProvider isSuitableForRecycledItemContainer:v6];
  id v14 = objc_alloc((Class)objc_opt_class());
  [(SBFluidSwitcherContentView *)self->_contentView bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  BOOL v23 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  id v9 = (id)objc_msgSend(v14, "initWithFrame:appLayout:delegate:active:windowScene:", v6, self, 1, v23, v16, v18, v20, v22);

  uint64_t v24 = [(SBFluidSwitcherPageContentViewProvider *)self->_pageContentViewProvider pageContentViewForAppLayout:v6 setActive:1];
  [v9 setContentView:v24];

  [(SBFluidSwitcherContentView *)self->_contentView addSubview:v9];
LABEL_11:
  uint64_t v46 = v7;
  uint64_t v25 = [(NSMutableDictionary *)self->_liveContentOverlays objectForKey:v6];
  id v26 = v25;
  if (v25)
  {
    id v27 = [v25 contentOverlayView];
    [v9 setContentOverlay:v27 animated:0];

    long long v28 = [v6 itemForLayoutRole:1];
    id v29 = [v28 uniqueIdentifier];

    if (v29)
    {
      uint64_t v30 = [(SBFluidSwitcherViewController *)self _centerWindowActivationAnimationContextForKey:v29];
      long long v31 = v30;
      if (v30)
      {
        uint64_t v32 = [v30 contentPortalContainer];
        id v33 = objc_alloc(MEMORY[0x1E4F43298]);
        [v32 bounds];
        long long v34 = objc_msgSend(v33, "initWithFrame:");
        long long v35 = [v26 contentOverlayView];
        [v34 setSourceView:v35];

        [v34 setHidesSourceView:1];
        [v34 setAllowsHitTesting:1];
        [v34 setName:@"com.apple.SpringBoard.centerWindowContentPortal"];
        [v32 addSubview:v34];
      }
    }
    if ([v26 isAsyncRenderingEnabled]) {
      [v26 disableAsynchronousRenderingForNextCommit];
    }
    [(SBFluidSwitcherViewController *)self _setupLiveContentOverlayForAppLayout:v6 itemContainer:v9 overlay:v26];
  }
  long long v45 = v26;
  [(NSMutableDictionary *)self->_visibleItemContainers setObject:v9 forKey:v6];
  id v36 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v6];
  [v36 leafAppLayouts];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v38 = [v37 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v52;
    while (2)
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v52 != v40) {
          objc_enumerationMutation(v37);
        }
        long long v42 = [(NSMutableDictionary *)self->_visibleItemContainers objectForKey:*(void *)(*((void *)&v51 + 1) + 8 * i)];

        if (!v42)
        {

          goto LABEL_29;
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v39) {
        continue;
      }
      break;
    }
  }

  [(SBFluidSwitcherViewController *)self _ensureSubviewOrderingInsideSpace:v36];
LABEL_29:
  if (!v46)
  {
    long long v43 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v6];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __99__SBFluidSwitcherViewController__addVisibleItemContainerForAppLayout_reusingItemContainerIfExists___block_invoke;
    v47[3] = &unk_1E6AF4E00;
    id v48 = v43;
    id v49 = v6;
    long long v50 = self;
    id v44 = v43;
    [(SBFluidSwitcherViewController *)self _performWithFixedUpdateMode:1 usingBlock:v47];
    [v9 layoutIfNeeded];
  }
}

- (void)_ensureSubviewOrderingInsideSpace:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 leafAppLayouts];
  id v6 = [(SBFluidSwitcherContentView *)self->_contentView subviews];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  id v9 = v7;
  if (!v8)
  {
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v10 = v8;
  uint64_t v11 = *(void *)v26;
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(v7);
      }
      id v14 = [(NSMutableDictionary *)self->_visibleItemContainers objectForKey:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      if (v14)
      {
        unint64_t v15 = [v6 indexOfObject:v14];
        if (v15 < v12) {
          unint64_t v12 = v15;
        }
      }
    }
    uint64_t v10 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  }
  while (v10);

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v16 = [(SBFluidSwitcherViewController *)self _orderedViewsForLayoutElement:v4 excludeSwitcherHostedShelves:1];
    id v9 = [v16 reverseObjectEnumerator];

    uint64_t v17 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v9);
          }
          [(SBFluidSwitcherContentView *)self->_contentView insertSubview:*(void *)(*((void *)&v21 + 1) + 8 * j) atIndex:v12 + j];
        }
        uint64_t v18 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        v12 += j;
      }
      while (v18);
    }
    goto LABEL_19;
  }
LABEL_20:
}

- (id)_centerWindowActivationAnimationContextForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_centerWindowActivationAnimationContexts objectForKey:a3];
}

- (void)_medusaHostedKeyboardWillHideNotification:(id)a3
{
  if (self->_isMedusaHostedKeyboardVisible)
  {
    self->_isMedusaHostedKeyboardVisible = 0;
    [(SBFluidSwitcherViewController *)self _configureApplicationAndTransientOverlayDockBehaviorAssertionsForContext:0];
    id v4 = [(SBFluidSwitcherViewController *)self view];
    [v4 setNeedsLayout];
  }
}

void __52__SBFluidSwitcherViewController__updateVisibleItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__SBFluidSwitcherViewController__updateVisibleItems__block_invoke_3;
    v15[3] = &unk_1E6AF4B60;
    id v5 = v3;
    id v16 = v5;
    id v6 = objc_msgSend(v4, "bs_firstObjectPassingTest:", v15);
    id v7 = *(void **)(*(void *)(a1 + 40) + 1280);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    unint64_t v12 = __52__SBFluidSwitcherViewController__updateVisibleItems__block_invoke_4;
    int v13 = &unk_1E6AF4B60;
    id v8 = v5;
    id v14 = v8;
    int v9 = objc_msgSend(v7, "bs_containsObjectPassingTest:", &v10);
    if (!*(unsigned char *)(a1 + 56) || v6 || v9) {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v8, v10, v11, v12, v13);
    }
  }
}

void __54__SBFluidSwitcherViewController__handleEventResponse___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isValid])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
    [v2 _performEventResponse:v3];
  }
  else
  {
    id v4 = SBLogAppSwitcher();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 1328);
      id v6 = [*(id *)(a1 + 32) description];
      int v7 = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "[Fluid Switcher - %@] Skipping the following action because it's no longer valid: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

void __93__SBFluidSwitcherViewController__unblurItemContainer_blurParameters_withAnimationUpdateMode___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) layer];
  [v1 setValue:&unk_1F3348AD8 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (void)zStackActivationStateUpdated
{
  id v2 = [(SBFluidSwitcherViewController *)self view];
  [v2 setNeedsLayout];
}

- (BOOL)itemContainerForAppLayoutOverlapsFloatingDock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
  char v6 = [v5 anyDisplayItemForAppLayoutOverlapsFloatingDock:v4];

  return v6;
}

- (double)homeScreenIconScaleForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
  [v5 iconScaleForAppLayout:v4];
  double v7 = v6;

  return v7;
}

- (double)iconScaleForAppLayout:(id)a3
{
  uint64_t v3 = [(SBFluidSwitcherViewController *)self iconViewForAppLayout:a3];
  id v4 = v3;
  if (v3)
  {
    [v3 iconContentScale];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.0;
  }

  return v6;
}

- (id)homeScreenIconLocationForAppLayout:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
  double v6 = [v5 iconLocationForAppLayout:v4];

  return v6;
}

- (id)iconLocationForAppLayout:(id)a3
{
  id v5 = (id)*MEMORY[0x1E4FA66C8];
  double v6 = [(SBFluidSwitcherViewController *)self iconViewForAppLayout:a3];
  double v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 location];

    id v5 = (id)v8;
  }

  return v5;
}

- (double)homeScreenIconCornerRadiusForAppLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
  [v5 iconCornerRadiusForAppLayout:v4];
  double v7 = v6;

  return v7;
}

- (double)iconCornerRadiusForAppLayout:(id)a3
{
  uint64_t v3 = [(SBFluidSwitcherViewController *)self iconViewForAppLayout:a3];
  id v4 = v3;
  if (v3)
  {
    [v3 iconImageInfo];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (BOOL)anyDisplayItemForAppLayoutOverlapsFloatingDock:(id)a3
{
  id v4 = a3;
  if (+[SBFloatingDockController isFloatingDockSupported])
  {
    double v5 = [(SBFluidSwitcherViewController *)self _floatingDockController];
    if ([v5 isFloatingDockPresented])
    {
      visibleItemContainers = self->_visibleItemContainers;
      double v7 = [v4 anyLeafAppLayout];
      uint64_t v8 = [(NSMutableDictionary *)visibleItemContainers objectForKey:v7];

      if (v8)
      {
        [v5 floatingDockScreenPresentationFrame];
        CGFloat v10 = v9;
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        uint64_t v17 = [v8 window];
        uint64_t v18 = [v8 window];
        uint64_t v19 = [v8 superview];
        double v20 = [v8 layer];
        long long v21 = [v20 presentationLayer];
        [v21 frame];
        objc_msgSend(v19, "convertRect:toCoordinateSpace:", v17);
        objc_msgSend(v18, "_convertRectToSceneReferenceSpace:");
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        CGFloat v29 = v28;

        v32.origin.CGFloat x = v10;
        v32.origin.CGFloat y = v12;
        v32.size.CGFloat width = v14;
        v32.size.CGFloat height = v16;
        v33.origin.CGFloat x = v23;
        v33.origin.CGFloat y = v25;
        v33.size.CGFloat width = v27;
        v33.size.CGFloat height = v29;
        BOOL v30 = CGRectIntersectsRect(v32, v33);
      }
      else
      {
        BOOL v30 = 0;
      }
    }
    else
    {
      BOOL v30 = 0;
    }
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  pendingTransitionContext = self->_pendingTransitionContext;
  self->_pendingTransitionContext = 0;

  char v9 = [v7 isInterrupted];
  CGFloat v10 = [v7 applicationTransitionContext];
  if ((v9 & 1) == 0)
  {
    double v11 = [(SBFluidSwitcherLayoutContext *)self->_layoutContext activeGesture];

    if (!v11)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained)
      {
        id v13 = objc_loadWeakRetained((id *)&self->_dataSource);

        if (v13)
        {
          if ((*((unsigned char *)&self->_delegateRespondsTo + 3) & 2) == 0
            || ([WeakRetained switcherContentController:self shouldSkipNonAnimatedLayoutPassAfterTransition:v10] & 1) == 0)
          {
            [(SBFluidSwitcherViewController *)self performTransitionWithContext:v10 animated:0 completion:0];
          }
        }
      }
    }
    if (!self->_activeTransitionSubcompletionGenerator)
    {
      CGFloat v14 = [(SBFluidSwitcherViewController *)self layoutContext];
      [v14 didEndTransitioningToLayoutStateWithContext:v10];
    }
    [(SBFluidSwitcherViewController *)self _configureApplicationAndTransientOverlayDockBehaviorAssertionsForContext:v10];
    transitionBeginResignActiveAssertiouint64_t n = self->_transitionBeginResignActiveAssertion;
    if (transitionBeginResignActiveAssertion)
    {
      [(UIApplicationSceneDeactivationAssertion *)transitionBeginResignActiveAssertion relinquish];
      CGFloat v16 = self->_transitionBeginResignActiveAssertion;
      self->_transitionBeginResignActiveAssertiouint64_t n = 0;
    }
    if ([(NSPointerArray *)self->_outstandingAnimations count])
    {
      unint64_t v18 = 0;
      *(void *)&long long v17 = 138412546;
      long long v29 = v17;
      do
      {
        uint64_t v19 = -[NSPointerArray pointerAtIndex:](self->_outstandingAnimations, "pointerAtIndex:", v18, v29);
        double v20 = SBLogAppSwitcher();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          debugName = self->_debugName;
          *(_DWORD *)buf = v29;
          id v36 = debugName;
          __int16 v37 = 2112;
          uint64_t v38 = v19;
          _os_log_error_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_ERROR, "[Fluid Switcher - %@] Layout state transition settled with outstanding animation: %@", buf, 0x16u);
        }

        [(NSPointerArray *)self->_outstandingAnimations removePointerAtIndex:v18];
        ++v18;
      }
      while (v18 < [(NSPointerArray *)self->_outstandingAnimations count]);
    }
  }
  [(SBSwitcherLiveContentOverlayCoordinating *)self->_liveContentOverlayCoordinator layoutStateTransitionCoordinator:v6 transitionDidEndWithTransitionContext:v7];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  double v22 = [(NSMutableDictionary *)self->_visibleShelves allValues];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v31;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * v26++) layoutStateTransitionCoordinator:v6 transitionDidEndWithTransitionContext:v7];
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v24);
  }

  CGFloat v27 = [(SBFluidSwitcherViewController *)self delegate];
  double v28 = v27;
  if ((*((unsigned char *)&self->_delegateRespondsTo + 2) & 0x80) != 0) {
    [v27 switcherContentController:self layoutStateTransitionDidEndWithTransitionContext:v7];
  }
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 keyPath];
  uint64_t v3 = [v2 isEqualToString:@"transform"];

  return v3;
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = [a2 keyPath];
  uint64_t v3 = [v2 isEqualToString:@"meshTransform"];

  return v3;
}

- (double)minimumHomeScreenScale
{
  uint64_t v3 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
  [v3 homeScreenScaleForMode:1];
  double v5 = v4;

  double v6 = fmin(v5, 1.0);
  id v7 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
  [v7 homeScreenScaleForMode:2];
  double v9 = v8;

  if (v6 > v9) {
    double v6 = v9;
  }
  CGFloat v10 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
  [v10 homeScreenScaleForMode:3];
  double v12 = v11;

  if (v6 <= v12) {
    return v6;
  }
  else {
    return v12;
  }
}

void __77__SBFluidSwitcherViewController__performModifierMatchMoveToIconViewResponse___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

- (void)_performModifierMatchMoveToIconViewResponse:(id)a3
{
  v80[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 appLayout];
  if ([v4 isActive])
  {
    double v6 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
    id v7 = [v6 iconZoomingViewForAppLayout:v5];

    double v8 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
    int v9 = [v8 shouldMatchMoveIconZoomingView:v7];

    if (v9)
    {
      [v4 iconFrame];
      CGFloat x = v81.origin.x;
      CGFloat y = v81.origin.y;
      CGFloat width = v81.size.width;
      CGFloat height = v81.size.height;
      if (CGRectEqualToRect(v81, *MEMORY[0x1E4F1DB28])
        || (v82.origin.CGFloat x = x, v82.origin.y = y, v82.size.width = width, v82.size.height = height, CGRectIsNull(v82)))
      {
        CGFloat v14 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
        [v14 iconFrameForAppLayout:v5];
      }
      double v15 = [v7 window];
      UIRectGetCenter();
      double v17 = v16;
      double v19 = v18;
      double v20 = [(SBFluidSwitcherViewController *)self view];
      objc_msgSend(v20, "convertPoint:toView:", v15, v17, v19);
      double v22 = v21;
      double v24 = v23;

      if ([v7 iconImageSizeMatchesBoundsSize]) {
        [v7 bounds];
      }
      else {
        [v7 iconImageFrame];
      }
      UIRectGetCenter();
      double v28 = v27;
      double v30 = v29;
      [v15 bounds];
      double v32 = v28 + v31 * 0.5 - v22;
      double v34 = v30 + v33 * 0.5 - v24;
      long long v35 = [(SBFluidSwitcherViewController *)self _iconManager];
      id v36 = [(SBFluidSwitcherViewController *)self _homeScreenAppearanceController];
      CGAffineTransform v69 = [v36 window];
      if (v15 == v69 && [v35 hasOpenFolder])
      {
        uint64_t v68 = v36;
        __int16 v37 = [v36 homeScreenScalingView];
        uint64_t v38 = [v37 layer];
        uint64_t v39 = [v38 presentationLayer];
        uint64_t v40 = [v39 valueForKeyPath:@"transform.scale.x"];
        [v40 doubleValue];
        double v42 = v41;

        memset(&v75, 0, sizeof(v75));
        long long v43 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v74.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v74.c = v43;
        *(_OWORD *)&v74.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        CGAffineTransformScale(&v75, &v74, 1.0 / v42, 1.0 / v42);
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __77__SBFluidSwitcherViewController__performModifierMatchMoveToIconViewResponse___block_invoke;
        v72[3] = &unk_1E6AFAB40;
        v72[4] = self;
        CGAffineTransform v73 = v75;
        [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v72];
        id v44 = (void *)MEMORY[0x1E4F42FF0];
        long long v45 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
        uint64_t v46 = [v45 homeScreenScaleSettings];
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __77__SBFluidSwitcherViewController__performModifierMatchMoveToIconViewResponse___block_invoke_2;
        v71[3] = &unk_1E6AF4AC0;
        void v71[4] = self;
        objc_msgSend(v44, "sb_animateWithSettings:mode:animations:completion:", v46, 3, v71, 0);

        [v15 bounds];
        double v48 = v47;
        double v50 = v49;
        if ([(SBFluidSwitcherViewController *)self switcherInterfaceOrientation] != 1
          && [(SBFluidSwitcherViewController *)self switcherInterfaceOrientation] != 4
          && [(SBFluidSwitcherViewController *)self switcherInterfaceOrientation] != 3)
        {
          [(SBFluidSwitcherViewController *)self switcherInterfaceOrientation];
        }
        double v57 = v48 * 0.5;
        double v58 = v50 * 0.5;
        if ([(SBFluidSwitcherViewController *)self homeScreenInterfaceOrientation] != 1
          && [(SBFluidSwitcherViewController *)self homeScreenInterfaceOrientation] != 4
          && [(SBFluidSwitcherViewController *)self homeScreenInterfaceOrientation] != 3)
        {
          [(SBFluidSwitcherViewController *)self homeScreenInterfaceOrientation];
        }
        double v59 = v32 - v57;
        double v60 = v34 + v58;
        double v61 = v32 + v57;
        double v62 = v34 - v58;
        if (BSFloatEqualToFloat())
        {
          id v67 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v61, v62);
          v80[0] = v67;
          uint64_t v66 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v61, v60);
          v80[1] = v66;
          uint64_t v63 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v59, v60);
          v80[2] = v63;
          id v64 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v59, v62);
          v80[3] = v64;
          uint64_t v65 = v80;
          id v36 = v68;
        }
        else
        {
          id v36 = v68;
          if (BSFloatEqualToFloat())
          {
            id v67 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v61, v60);
            v79[0] = v67;
            uint64_t v66 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v59, v60);
            v79[1] = v66;
            uint64_t v63 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v59, v62);
            v79[2] = v63;
            id v64 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v61, v62);
            v79[3] = v64;
            uint64_t v65 = v79;
          }
          else if (BSFloatEqualToFloat())
          {
            id v67 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v59, v60);
            v78[0] = v67;
            uint64_t v66 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v59, v62);
            v78[1] = v66;
            uint64_t v63 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v61, v62);
            v78[2] = v63;
            id v64 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v61, v60);
            v78[3] = v64;
            uint64_t v65 = v78;
          }
          else
          {
            id v67 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v59, v62);
            v77[0] = v67;
            uint64_t v66 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v61, v62);
            v77[1] = v66;
            uint64_t v63 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v61, v60);
            v77[2] = v63;
            id v64 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v59, v60);
            v77[3] = v64;
            uint64_t v65 = v77;
          }
        }
        long long v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:4];
      }
      else
      {
        long long v51 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v32, v34);
        CGFloat v76 = v51;
        long long v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
      }
      id v53 = objc_alloc_init(MEMORY[0x1E4F39C00]);
      long long v54 = [v7 layer];
      [v53 setSourceLayer:v54];

      [v53 setSourcePoints:v52];
      [v53 setDuration:INFINITY];
      [v53 setFillMode:*MEMORY[0x1E4F39FA0]];
      [v53 setRemovedOnCompletion:0];
      uint64_t v55 = [(SBFluidSwitcherViewController *)self view];
      uint64_t v56 = [v55 layer];
      [v56 addAnimation:v53 forKey:@"MatchMoveToIconViewAnimation"];
    }
  }
  else
  {
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __77__SBFluidSwitcherViewController__performModifierMatchMoveToIconViewResponse___block_invoke_3;
    v70[3] = &unk_1E6AF4AC0;
    v70[4] = self;
    [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v70];
    uint64_t v25 = [(SBFluidSwitcherViewController *)self view];
    uint64_t v26 = [v25 layer];
    [v26 removeAnimationForKey:@"MatchMoveToIconViewAnimation"];
  }
}

- (SBFluidSwitcherViewController)initWithRootModifier:(id)a3 liveContentOverlayCoordinator:(id)a4 dataSource:(id)a5 delegate:(id)a6 debugName:(id)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v119 = [MEMORY[0x1E4F28B00] currentHandler];
    [v119 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 630, @"Invalid parameter not satisfying: %@", @"rootModifier" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  uint64_t v120 = [MEMORY[0x1E4F28B00] currentHandler];
  [v120 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 631, @"Invalid parameter not satisfying: %@", @"liveContentOverlayCoordinator" object file lineNumber description];

LABEL_3:
  v126.receiver = self;
  v126.super_class = (Class)SBFluidSwitcherViewController;
  double v19 = [(SBFluidSwitcherViewController *)&v126 initWithNibName:0 bundle:0];
  double v20 = v19;
  if (v19)
  {
    id v123 = v14;
    [(SBFluidSwitcherViewController *)v19 setDelegate:v17];
    id v122 = v16;
    [(SBFluidSwitcherViewController *)v20 setDataSource:v16];
    uint64_t v21 = [v18 copy];
    debugName = v20->_debugName;
    v20->_debugName = (NSString *)v21;

    double v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    visibleItemContainers = v20->_visibleItemContainers;
    v20->_visibleItemContainers = v23;

    uint64_t v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    visibleOverlayAccessoryViews = v20->_visibleOverlayAccessoryViews;
    v20->_visibleOverlayAccessoryViews = v25;

    double v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    visibleUnderlayAccessoryViews = v20->_visibleUnderlayAccessoryViews;
    v20->_visibleUnderlayAccessoryViews = v27;

    double v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    externalDropletZoomUpTokens = v20->_externalDropletZoomUpTokens;
    v20->_externalDropletZoomUpTokens = v29;

    double v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    visibleItemContainerBackdropViews = v20->_visibleItemContainerBackdropViews;
    v20->_visibleItemContainerBackdropViews = v31;

    double v33 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    focusedItemBackdropsBeingRemoved = v20->_focusedItemBackdropsBeingRemoved;
    v20->_focusedItemBackdropsBeingRemoved = v33;

    long long v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    hiddenRecycledItemContainers = v20->_hiddenRecycledItemContainers;
    v20->_hiddenRecycledItemContainers = v35;

    __int16 v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    visibleShelves = v20->_visibleShelves;
    v20->_visibleShelves = v37;

    uint64_t v39 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    visibleShelvesHostedInContentView = v20->_visibleShelvesHostedInContentView;
    v20->_visibleShelvesHostedInContentView = v39;

    double v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    hiddenIconViews = v20->_hiddenIconViews;
    v20->_hiddenIconViews = v41;

    long long v43 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    hiddenIconViewContainers = v20->_hiddenIconViewContainers;
    v20->_hiddenIconViewContainers = v43;

    continuousExposeIdentifiersInSwitcher = v20->_continuousExposeIdentifiersInSwitcher;
    uint64_t v46 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v20->_continuousExposeIdentifiersInSwitcher = (NSArray *)MEMORY[0x1E4F1CBF0];

    continuousExposeIdentifiersInStrip = v20->_continuousExposeIdentifiersInStrip;
    v20->_continuousExposeIdentifiersInStrip = v46;

    uint64_t v48 = [MEMORY[0x1E4F1CA80] set];
    systemApertureContentSuppressionAssertionsForGesture = v20->_systemApertureContentSuppressionAssertionsForGesture;
    v20->_systemApertureContentSuppressionAssertionsForGesture = (NSMutableSet *)v48;

    double v50 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    systemApertureContentSuppressionAssertionsByInvalidationUUID = v20->_systemApertureContentSuppressionAssertionsByInvalidationUUID;
    v20->_systemApertureContentSuppressionAssertionsByInvalidationUUID = v50;

    long long v52 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    systemApertureGlobalSuppressionAssertionsByInvalidationUUID = v20->_systemApertureGlobalSuppressionAssertionsByInvalidationUUID;
    v20->_systemApertureGlobalSuppressionAssertionsByInvalidationUUID = v52;

    long long v54 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    systemApertureKeyLineAssertionsByInvalidationUUID = v20->_systemApertureKeyLineAssertionsByInvalidationUUID;
    v20->_systemApertureKeyLineAssertionsByInvalidationUUID = v54;

    uint64_t v56 = [MEMORY[0x1E4F28F50] pointerArrayWithOptions:256];
    outstandingAnimations = v20->_outstandingAnimations;
    v20->_outstandingAnimations = (NSPointerArray *)v56;

    CGSize v58 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v20->_currentKeyboardFrame.origiuint64_t n = (CGPoint)*MEMORY[0x1E4F1DB28];
    v20->_currentKeyboardFrame.size = v58;
    double v59 = objc_alloc_init(SBDisplayItemLayoutAttributesCalculator);
    displayItemLayoutAttributesCalculator = v20->_displayItemLayoutAttributesCalculator;
    v20->_displayItemLayoutAttributesCalculator = v59;

    double v61 = +[SBDefaults localDefaults];
    uint64_t v62 = [v61 appSwitcherDefaults];
    defaults = v20->_defaults;
    v20->_defaults = (SBAppSwitcherDefaults *)v62;

    uint64_t v64 = +[SBAppSwitcherDomain rootSettings];
    settings = v20->_settings;
    v20->_settings = (SBAppSwitcherSettings *)v64;

    [(PTSettings *)v20->_settings addKeyPathObserver:v20];
    uint64_t v66 = [(SBAppSwitcherSettings *)v20->_settings chamoisSettings];
    [v66 addKeyObserver:v20];

    int v121 = +[SBHomeGestureDomain rootSettings];
    [v121 addKeyObserver:v20];
    id v67 = +[SBMedusaDomain rootSettings];
    [v67 addKeyObserver:v20];
    uint64_t v68 = [MEMORY[0x1E4FA5F28] rootSettings];
    homeGrabberSettings = v20->_homeGrabberSettings;
    v20->_homeGrabberSettings = (SBFHomeGrabberSettings *)v68;

    [(SBFHomeGrabberSettings *)v20->_homeGrabberSettings addKeyObserver:v20];
    objc_storeStrong((id *)&v20->_rootModifier, a3);
    [v15 setDelegate:v20];
    objc_storeStrong((id *)&v20->_liveContentOverlayCoordinator, a4);
    uint64_t v70 = [MEMORY[0x1E4F1CA60] dictionary];
    liveContentOverlays = v20->_liveContentOverlays;
    v20->_liveContentOverlays = (NSMutableDictionary *)v70;

    id v72 = [MEMORY[0x1E4F941F8] recipeWithTitle:@"Toggle Modifier Timeline" toggleAction:&__block_literal_global_48];
    +[PTDomain registerTestRecipe:v72];

    v20->_currentWallpaperRequiredForSwitcher = 0;
    v20->_currentWallpaperStyle = 1;
    v20->_currentHomeScreenContentRequired = 0;
    v20->_currentHomeScreenBackdropBlurType = 1;
    v20->_currentSwitcherBackdropBlurType = 1;
    uint64_t v73 = +[SBSwitcherKeyboardSuppressionMode suppressionModeNone];
    lastKeyboardSuppressionMode = v20->_lastKeyboardSuppressionMode;
    v20->_lastKeyboardSuppressionMode = (SBSwitcherKeyboardSuppressionMode *)v73;

    CGAffineTransform v75 = [[SBSwitcherAccessoryLayoutElement alloc] initWithType:1];
    genericAccessoryLayoutElement = v20->_genericAccessoryLayoutElement;
    v20->_genericAccessoryLayoutElement = v75;

    id v77 = [NSString alloc];
    CGAffineTransform v78 = (objc_class *)objc_opt_class();
    CGAffineTransform v79 = NSStringFromClass(v78);
    uint64_t v80 = [v77 initWithFormat:@"%@-%p-%@", v79, v20, v20->_debugName];
    fluidSwitcherAssertionReasouint64_t n = v20->_fluidSwitcherAssertionReason;
    v20->_fluidSwitcherAssertionReasouint64_t n = (NSString *)v80;

    id v82 = objc_alloc(MEMORY[0x1E4F42C10]);
    uint64_t v83 = (void *)MEMORY[0x1E4F43268];
    long long v84 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F3349800];
    long long v85 = [v83 privateConfigurationForTypes:v84];
    uint64_t v86 = [v82 initWithConfiguration:v85];
    emptySwitcherFeedbackGenerator = v20->_emptySwitcherFeedbackGenerator;
    v20->_emptySwitcherFeedbackGenerator = (UINotificationFeedbackGenerator *)v86;

    id v88 = objc_alloc(MEMORY[0x1E4F42C10]);
    long long v89 = (void *)MEMORY[0x1E4F43268];
    long long v90 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F3349818];
    long long v91 = [v89 privateConfigurationForTypes:v90];
    uint64_t v92 = [v88 initWithConfiguration:v91];
    flyInFeedbackGenerator = v20->_flyInFeedbackGenerator;
    v20->_flyInFeedbackGenerator = (UINotificationFeedbackGenerator *)v92;

    id v94 = objc_alloc(MEMORY[0x1E4F42C10]);
    double v95 = (void *)MEMORY[0x1E4F43268];
    double v96 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F3349830];
    double v97 = [v95 privateConfigurationForTypes:v96];
    uint64_t v98 = [v94 initWithConfiguration:v97];
    reduceMotionFeedbackGenerator = v20->_reduceMotionFeedbackGenerator;
    v20->_reduceMotionFeedbackGenerator = (UINotificationFeedbackGenerator *)v98;

    [(SBFluidSwitcherViewController *)v20 setDefinesPresentationContext:1];
    long long v100 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v100 addObserver:v20 selector:sel__reduceMotionStatusDidChange_ name:*MEMORY[0x1E4F43478] object:0];

    long long v101 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v101 addObserver:v20 selector:sel__backgroundContrastDidChange_ name:*MEMORY[0x1E4F43480] object:0];

    uint64_t v102 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v102 addObserver:v20 selector:sel__folderExpansionAnimationWillBegin_ name:*MEMORY[0x1E4FA6728] object:0];

    long long v103 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v103 addObserver:v20 selector:sel__containerScrolledEnoughToClipSwitcherIconView_ name:*MEMORY[0x1E4FA65F8] object:0];

    long long v104 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v104 addObserver:v20 selector:sel__iconControllerOverlayVisibilityDidChange_ name:SBIconControllerOverlayVisibilityDidChangeNotification object:0];

    long long v105 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v105 addObserver:v20 selector:sel__iconControllerDidReconfigureChildControllers_ name:SBIconControllerDidReconfigureChildControllersNotification object:0];

    long long v106 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v106 addObserver:v20 selector:sel__sceneUpdateDidChange_ name:@"SBApplicationSceneHandleProgressNotification" object:0];

    uint64_t v107 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v107 addObserver:v20 selector:sel__handleKeyboardFrameWillChange_ name:*MEMORY[0x1E4F43B70] object:0];

    id v108 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v108 addObserver:v20 selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4F43B88] object:0];

    double v109 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v109 addObserver:v20 selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4F43B80] object:0];

    BOOL v110 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v110 addObserver:v20 selector:sel__keyboardDidUIPosition_ name:@"UIKeyboardDidChangeUIPosition" object:0];

    uint64_t v111 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v111 addObserver:v20 selector:sel__medusaHostedKeyboardWillShowNotification_ name:@"SBMedusaHostedKeyboardWindowWillShowNotification" object:0];

    uint64_t v112 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v112 addObserver:v20 selector:sel__medusaHostedKeyboardWillHideNotification_ name:@"SBMedusaHostedKeyboardWindowWillHideNotification" object:0];

    uint64_t v113 = +[SBAppInteractionEventSourceManager sharedInstance];
    [v113 addObserver:v20];

    objc_initWeak(&location, v20);
    id v114 = MEMORY[0x1E4F14428];
    id v115 = [NSString stringWithFormat:@"SpringBoard - FluidSwitcher - %@", v20->_debugName];
    objc_copyWeak(&v124, &location);
    uint64_t v116 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureInvalidatable = v20->_stateCaptureInvalidatable;
    v20->_stateCaptureInvalidatable = (BSInvalidatable *)v116;

    objc_destroyWeak(&v124);
    objc_destroyWeak(&location);

    id v16 = v122;
    id v14 = v123;
  }

  return v20;
}

void __114__SBFluidSwitcherViewController_initWithRootModifier_liveContentOverlayCoordinator_dataSource_delegate_debugName___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[SBAppSwitcherDomain rootSettings];
  [v3 setShowMainModifierTimeline:a2];
}

id __114__SBFluidSwitcherViewController_initWithRootModifier_liveContentOverlayCoordinator_dataSource_delegate_debugName___block_invoke_151(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = NSString;
    uint64_t v4 = *((void *)WeakRetained + 243);
    uint64_t v5 = *((void *)WeakRetained + 229);
    double v6 = [*((id *)WeakRetained + 171) allObjects];
    id v7 = [v3 stringWithFormat:@"rootModifier:\n%@\n\nvisibleItemContainers:\n%@\n\noutstandingAnimations:\n%@\n\nvisibleOverlayAccessoryViews:\n%@\n\nleafAppLayoutsToAdjustedAppLayouts:\n%@", v4, v5, v6, v2[230], v2[163]];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (SBFluidSwitcherViewController)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = NSStringFromSelector(sel_initWithRootModifier_liveContentOverlayCoordinator_dataSource_delegate_debugName_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBFluidSwitcherViewController.m", 738, @"%s is unavailable; use %@ instead",
    "-[SBFluidSwitcherViewController init]",
    v5);

  return 0;
}

- (SBFluidSwitcherViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  double v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v7 = NSStringFromSelector(sel_initWithRootModifier_liveContentOverlayCoordinator_dataSource_delegate_debugName_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBFluidSwitcherViewController.m", 743, @"%s is unavailable; use %@ instead",
    "-[SBFluidSwitcherViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (SBFluidSwitcherViewController)initWithCoder:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  double v6 = NSStringFromSelector(sel_initWithRootModifier_liveContentOverlayCoordinator_dataSource_delegate_debugName_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBFluidSwitcherViewController.m", 748, @"%s is unavailable; use %@ instead",
    "-[SBFluidSwitcherViewController initWithCoder:]",
    v6);

  return 0;
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  double v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  int v9 = v5;
  __int16 v10 = 2114;
  double v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"SBFluidSwitcherViewController.m";
  __int16 v16 = 1024;
  int v17 = 753;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)loadView
{
  id v3 = objc_alloc_init(SBFluidSwitcherTouchPassThroughView);
  [(SBFluidSwitcherViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherViewController;
  [(SBFluidSwitcherViewController *)&v3 viewDidLoad];
  [(SBFluidSwitcherViewController *)self _performDeferredInitialization];
  [(SBFluidSwitcherViewController *)self _setupContentAndTransientViews];
  [(SBFluidSwitcherViewController *)self _updateImplicitModifierStackInvalidatables];
  [(SBFluidSwitcherViewController *)self _updateChamoisDefaultsObserverIfNeeded];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherViewController;
  id v4 = a3;
  [(SBFluidSwitcherViewController *)&v8 traitCollectionDidChange:v4];
  uint64_t v5 = [(SBFluidSwitcherViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  uint64_t v7 = [v4 userInterfaceStyle];
  if (v6 != v7)
  {
    [(SBAppSwitcherSnapshotImageCache *)self->_snapshotCache reloadSnapshotsForInterfaceStyleChange:v6];
    [(SBFluidSwitcherViewController *)self _updateTitleItemsLabelColor];
    [(SBFluidSwitcherViewController *)self _updateTitleItemsUserInterfaceStyle];
  }
}

- (void)_performDeferredInitialization
{
  id v26 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  objc_super v3 = [v26 sceneManager];
  sceneManager = self->_sceneManager;
  self->_sceneManager = v3;

  uint64_t v5 = [v26 layoutStateTransitionCoordinator];
  layoutStateTransitionCoordinator = self->_layoutStateTransitionCoordinator;
  self->_layoutStateTransitionCoordinator = v5;

  uint64_t v7 = [SBFluidSwitcherLayoutContext alloc];
  objc_super v8 = [v26 layoutStateProvider];
  int v9 = [v8 layoutState];
  __int16 v10 = [(SBFluidSwitcherLayoutContext *)v7 initWithLayoutState:v9];
  layoutContext = self->_layoutContext;
  self->_layoutContext = v10;

  __int16 v12 = [(SBFluidSwitcherViewController *)self _iconManager];
  uint64_t v13 = [v12 searchGesture];
  [v13 addObserver:self];

  [(SBFluidSwitcherViewController *)self _setUpSearchPresenterObservation];
  __int16 v14 = [v26 systemPointerInteractionManager];
  [v14 addObserver:self];

  id v15 = [v26 assistantController];
  [v15 addObserver:self];
  int v16 = [v15 isVisible];
  unint64_t v17 = 3;
  if (!v16) {
    unint64_t v17 = 0;
  }
  self->_assistantPresentationState = v17;
  __int16 v18 = [[SBAppSwitcherSnapshotImageCache alloc] initWithDelegate:self];
  snapshotCache = self->_snapshotCache;
  self->_snapshotCache = v18;

  [(SBAppSwitcherSnapshotImageCache *)self->_snapshotCache setDebugName:self->_debugName];
  uint64_t v20 = self->_snapshotCache;
  uint64_t v21 = [(SBFluidSwitcherViewController *)self traitCollection];
  -[SBAppSwitcherSnapshotImageCache reloadSnapshotsForInterfaceStyleChange:](v20, "reloadSnapshotsForInterfaceStyleChange:", [v21 userInterfaceStyle]);

  [(SBFluidSwitcherViewController *)self _updateSnapshotCacheReloadingForActiveInterfaceOrientationChange];
  double v22 = objc_alloc_init(SBAppSwitcherSnapshotLockoutViewControllerProvider);
  lockoutVCProvider = self->_lockoutVCProvider;
  self->_lockoutVCProvider = v22;

  double v24 = [[SBFluidSwitcherPageContentViewProvider alloc] initWithDelegate:self snapshotCache:self->_snapshotCache lockoutViewProvider:self->_lockoutVCProvider];
  pageContentViewProvider = self->_pageContentViewProvider;
  self->_pageContentViewProvider = v24;

  [(SBChainableModifier *)self->_rootModifier setDelegate:self];
  [(SBFluidSwitcherViewController *)self _rebuildCachedAdjustedAppLayouts];
}

- (void)_setupContentAndTransientViews
{
  objc_super v3 = [(SBFluidSwitcherViewController *)self view];
  id v4 = [MEMORY[0x1E4F428B8] clearColor];
  [v3 setBackgroundColor:v4];

  uint64_t v5 = [SBAppSwitcherScrollView alloc];
  uint64_t v6 = [(SBFluidSwitcherViewController *)self view];
  [v6 bounds];
  uint64_t v7 = -[BSUIScrollView initWithFrame:](v5, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v7;

  [(BSUIScrollView *)self->_scrollView setDelegate:self];
  [(SBAppSwitcherScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(SBAppSwitcherScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  int v9 = self->_scrollView;
  __int16 v10 = [MEMORY[0x1E4F428B8] clearColor];
  [(SBAppSwitcherScrollView *)v9 setBackgroundColor:v10];

  [(SBAppSwitcherScrollView *)self->_scrollView setClipsToBounds:0];
  [(SBAppSwitcherScrollView *)self->_scrollView setZoomEnabled:0];
  [(SBAppSwitcherScrollView *)self->_scrollView setTracksImmediatelyWhileDecelerating:0];
  [(SBAppSwitcherScrollView *)self->_scrollView _setAutomaticContentOffsetAdjustmentEnabled:0];
  [(SBAppSwitcherScrollView *)self->_scrollView _setSupportsPointerDragScrolling:1];
  [(SBAppSwitcherScrollView *)self->_scrollView bs_setHitTestingDisabled:1];
  CAFrameRateRange v34 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  _setupContentAndTransientViews_updateRequest = 0;
  *(_DWORD *)algn_1EBE2630C = v34.minimum;
  dword_1EBE26310 = v34.preferred;
  unk_1EBE26314 = v34.maximum;
  v33[0] = &_setupContentAndTransientViews_updateRequest;
  v33[1] = 1114132;
  [(SBAppSwitcherScrollView *)self->_scrollView _setUpdateRequestRecord:v33];
  double v11 = [(SBFluidSwitcherViewController *)self view];
  [v11 addSubview:self->_scrollView];

  __int16 v12 = [SBFluidSwitcherContentView alloc];
  uint64_t v13 = [(SBFluidSwitcherViewController *)self view];
  [v13 bounds];
  __int16 v14 = -[SBFluidSwitcherContentView initWithFrame:](v12, "initWithFrame:");
  contentView = self->_contentView;
  self->_contentView = v14;

  int v16 = self->_contentView;
  unint64_t v17 = [NSString stringWithFormat:@"%@%p", @"AppSwitcherItemContainerFocus-", self];
  [(SBFluidSwitcherContentView *)v16 setFocusGroupIdentifier:v17];

  [(SBFluidSwitcherContentView *)self->_contentView setDelegate:self];
  __int16 v18 = [(SBFluidSwitcherViewController *)self view];
  [v18 addSubview:self->_contentView];

  [(SBFluidSwitcherViewController *)self _updateContentViewSublayerTransform];
  uint64_t v19 = [(SBFluidSwitcherContentView *)self->_contentView layer];
  [v19 setSortsSublayers:0];

  uint64_t v20 = [(SBAppSwitcherScrollView *)self->_scrollView panGestureRecognizer];
  borrowableScrollViewPanGestureRecognizer = self->_borrowableScrollViewPanGestureRecognizer;
  self->_borrowableScrollViewPanGestureRecognizer = v20;

  [(SBFluidSwitcherContentView *)self->_contentView addGestureRecognizer:self->_borrowableScrollViewPanGestureRecognizer];
  double v22 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleDismissTapGesture_];
  dismissTapGestureRecognizer = self->_dismissTapGestureRecognizer;
  self->_dismissTapGestureRecognizer = v22;

  [(UITapGestureRecognizer *)self->_dismissTapGestureRecognizer setDelegate:self];
  [(SBFluidSwitcherContentView *)self->_contentView addGestureRecognizer:self->_dismissTapGestureRecognizer];
  id v24 = objc_alloc(MEMORY[0x1E4F42FF0]);
  uint64_t v25 = [(SBFluidSwitcherViewController *)self view];
  [v25 bounds];
  id v26 = (UIView *)objc_msgSend(v24, "initWithFrame:");
  hitTestBlockerView = self->_hitTestBlockerView;
  self->_hitTestBlockerView = v26;

  double v28 = self->_hitTestBlockerView;
  double v29 = [MEMORY[0x1E4F428B8] clearColor];
  [(UIView *)v28 setBackgroundColor:v29];

  double v30 = [(UIView *)self->_hitTestBlockerView layer];
  [v30 setHitTestsAsOpaque:1];

  double v31 = [(UIView *)self->_hitTestBlockerView layer];
  [v31 setAllowsHitTesting:1];

  [(UIView *)self->_hitTestBlockerView setHidden:1];
  double v32 = [(SBFluidSwitcherViewController *)self view];
  [v32 addSubview:self->_hitTestBlockerView];
}

- (void)_updateContentViewSublayerTransform
{
  uint64_t v3 = MEMORY[0x1E4F39B10];
  if ([(SBFluidSwitcherViewController *)self isChamoisWindowingUIEnabled])
  {
    id v4 = [(SBFluidSwitcherViewController *)self chamoisLayoutAttributes];
    [v4 containerPerspective];
    double v6 = -1.0 / v5;
  }
  else
  {
    double v6 = *(double *)(v3 + 88);
  }
  uint64_t v7 = [(SBFluidSwitcherContentView *)self->_contentView layer];
  long long v8 = *(_OWORD *)(v3 + 48);
  v11[2] = *(_OWORD *)(v3 + 32);
  v11[3] = v8;
  void v11[4] = *(_OWORD *)(v3 + 64);
  uint64_t v12 = *(void *)(v3 + 80);
  long long v9 = *(_OWORD *)(v3 + 16);
  v11[0] = *(_OWORD *)v3;
  v11[1] = v9;
  double v13 = v6;
  long long v10 = *(_OWORD *)(v3 + 112);
  long long v14 = *(_OWORD *)(v3 + 96);
  long long v15 = v10;
  [v7 setSublayerTransform:v11];
}

- (NSString)description
{
  return (NSString *)[(SBFluidSwitcherViewController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(SBFluidSwitcherViewController *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBFluidSwitcherViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFluidSwitcherViewController *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__SBFluidSwitcherViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  void v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  double v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __71__SBFluidSwitcherViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 1328) withName:@"debugName"];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) view];
  id v4 = [v3 window];
  id v5 = (id)[v2 appendObject:v4 withName:@"window"];

  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) view];
  id v8 = (id)[v6 appendObject:v7 withName:@"view"];

  long long v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) scrollView];
  id v11 = (id)[v9 appendObject:v10 withName:@"scrollView"];

  uint64_t v12 = *(void **)(a1 + 32);
  double v13 = [*(id *)(a1 + 40) contentView];
  id v14 = (id)[v12 appendObject:v13 withName:@"contentView"];

  long long v15 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) _appearState];
  int v16 = SBFStringForAppearState();
  id v17 = (id)[v15 appendObject:v16 withName:@"appearState"];

  [*(id *)(a1 + 32) appendDictionarySection:*(void *)(*(void *)(a1 + 40) + 1880) withName:@"liveContentOverlays" skipIfEmpty:0];
  __int16 v18 = *(void **)(a1 + 32);
  uint64_t v19 = [*(id *)(a1 + 40) visibleItemContainers];
  [v18 appendDictionarySection:v19 withName:@"visibleItemContainers" skipIfEmpty:0];

  uint64_t v20 = *(void **)(a1 + 32);
  uint64_t v21 = [*(id *)(a1 + 40) _spacesWithVisibleHomeAffordances];
  double v22 = [v21 allObjects];
  [v20 appendArraySection:v22 withName:@"visibleHomeGrabberLayoutElements" skipIfEmpty:0];

  double v23 = *(void **)(a1 + 32);
  id v24 = [*(id *)(a1 + 40) visibleShelves];
  [v23 appendDictionarySection:v24 withName:@"visibleShelves" skipIfEmpty:0];

  id v25 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 1960) withName:@"hiddenIconViews"];
  id v26 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 1968) withName:@"hiddenIconViewContainers"];
  double v27 = *(void **)(a1 + 32);
  double v28 = [*(id *)(*(void *)(a1 + 40) + 1944) descriptionWithMultilinePrefix:@"\t"];
  id v29 = (id)[v27 appendObject:v28 withName:@"rootModifier"];

  double v30 = *(void **)(a1 + 32);
  double v31 = [*(id *)(a1 + 40) appLayouts];
  [v30 appendArraySection:v31 withName:@"appLayouts" skipIfEmpty:0];

  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 1824) withName:@"layoutContext"];
}

uint64_t __68__SBFluidSwitcherViewController_appLayoutsContainedWithinAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isOrContainsAppLayout:a2];
}

- (BOOL)appLayoutContainsOnlyResizableApps:(id)a3
{
  id v3 = a3;
  id v4 = +[SBApplicationController sharedInstance];
  char v5 = [v4 _appLayoutContainsOnlyResizableApps:v3];

  return v5;
}

- (BOOL)appLayoutContainsAnUnoccludedMaximizedDisplayItem:(id)a3
{
  return [(SBFluidSwitcherViewController *)self appLayoutContainsAnUnoccludedMaximizedDisplayItem:a3 ignoreOcclusion:0 displayItem:0];
}

- (BOOL)isShieldingApplicationWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[SBApplicationController sharedInstanceIfExists];
  char v5 = [v4 applicationWithBundleIdentifier:v3];

  id v6 = [v5 appProtectionAssistant];
  LOBYTE(v3) = [v6 shouldShield];

  return (char)v3;
}

- (unint64_t)supportedSizingPoliciesForItem:(id)a3 inAppLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SBApplicationController sharedInstance];
  long long v9 = [v6 bundleIdentifier];
  id v10 = [v8 applicationWithBundleIdentifier:v9];

  if (v10)
  {
    id v11 = [v7 layoutAttributesForItem:v6];
    unint64_t v12 = [(SBFluidSwitcherViewController *)self _windowManagementStyle];
    double v13 = [(SBSceneManager *)self->_sceneManager displayIdentity];
    unint64_t v14 = objc_msgSend(v10, "supportedSizingPoliciesForSwitcherWindowManagementStyle:displayIdentity:contentOrientation:containerOrientation:", v12, v13, objc_msgSend(v11, "contentOrientation"), -[SBFluidSwitcherViewController switcherInterfaceOrientation](self, "switcherInterfaceOrientation"));
  }
  else
  {
    unint64_t v14 = 4;
  }

  return v14;
}

- (unint64_t)supportedContentInterfaceOrientationsForItem:(id)a3
{
  id v4 = a3;
  char v5 = [(SBFluidSwitcherViewController *)self dataSource];
  id v6 = [v5 switcherContentController:self deviceApplicationSceneHandleForDisplayItem:v4];

  unint64_t v7 = [v6 supportedInterfaceOrientations];
  return v7;
}

- (unint64_t)appLayoutsGenerationCount
{
  return self->_appLayoutsGenerationCount;
}

- (unint64_t)continuousExposeIdentifiersGenerationCount
{
  return self->_continuousExposeIdentifiersGenerationCount;
}

- (unint64_t)newContinuousExposeIdentifiersGenerationCount
{
  unint64_t v2 = self->_continuousExposeIdentifiersGenerationCount + 1;
  self->_continuousExposeIdentifiersGenerationCount = v2;
  return v2;
}

- (double)splitViewInnerCornerRadius
{
  [(SBFluidSwitcherViewController *)self displayCornerRadius];
  if (BSFloatIsZero()) {
    return 0.0;
  }
  id v4 = [(SBFluidSwitcherViewController *)self medusaSettings];
  [v4 cornerRadiusForInnerCorners];
  double v6 = v5;

  return v6;
}

- (unint64_t)numberOfRowsInGridSwitcher
{
  return 2;
}

- (id)switcherDimmingViewLayoutElement
{
  return self->_dimmingViewLayoutElement;
}

- (id)switcherBackdropLayoutElement
{
  return self->_backdropLayoutElement;
}

- (id)slideOverTongueLayoutElement
{
  return self->_slideOverTongueLayoutElement;
}

- (id)bezelEffectsLayoutElement
{
  return self->_bezelEffectsLayoutElement;
}

- (id)continuousExposeStripTongueBackdropCaptureLayoutElement
{
  return self->_continuousExposeStripTongueBackdropCaptureLayoutElement;
}

- (double)statusBarHeight
{
  if (statusBarHeight_onceToken != -1) {
    dispatch_once(&statusBarHeight_onceToken, &__block_literal_global_239);
  }
  return *(double *)&statusBarHeight___statusBarHeight;
}

uint64_t __48__SBFluidSwitcherViewController_statusBarHeight__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F42E28] heightForStyle:0 orientation:1];
  statusBarHeight___statusBarCGFloat Height = v1;
  return result;
}

- (double)floatingDockPresentedHeight
{
  if (![(SBFluidSwitcherViewController *)self isFloatingDockFullyPresented]) {
    return 0.0;
  }
  [(SBFluidSwitcherViewController *)self floatingDockHeight];
  return result;
}

- (double)floatingDockViewTopMargin
{
  unint64_t v2 = [(SBFluidSwitcherViewController *)self _floatingDockController];
  [v2 floatingDockViewTopMargin];
  double v4 = v3;

  return v4;
}

- (BOOL)isFloatingDockFullyPresented
{
  unint64_t v2 = [(SBFluidSwitcherViewController *)self _floatingDockController];
  char v3 = [v2 isFloatingDockFullyPresented];

  return v3;
}

- (BOOL)isFloatingDockGesturePossible
{
  unint64_t v2 = [(SBFluidSwitcherViewController *)self _floatingDockController];
  char v3 = [v2 isGesturePossible];

  return v3;
}

- (double)shelfPresentedHeight
{
  char v3 = [(NSMutableDictionary *)self->_visibleShelves allValues];
  double v4 = [v3 firstObject];

  double v5 = 0.0;
  if (v4 && [v4 presented])
  {
    double v6 = [v4 view];
    [v6 frame];
    double v8 = v7;
    [(SBFluidSwitcherViewController *)self floatingDockPresentedHeight];
    double v5 = v8 - v9;
  }
  return v5;
}

- (double)continuousExposeStripProgress
{
  double result = 1.0;
  if ((self->_continuousExposeStripsPresentationOptions & 1) == 0) {
    return 0.0;
  }
  return result;
}

- (BOOL)requireStripContentsInViewHierarchy
{
  return 0;
}

- (BOOL)homeScreenHasOpenFolderInLocation:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFluidSwitcherViewController *)self _iconManager];
  char v6 = [v5 hasOpenFolderInLocation:v4];

  return v6;
}

- (BOOL)homeScreenHasModalLibraryOpenInForeground
{
  unint64_t v2 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  char v3 = [v2 modalLibraryController];
  char v4 = [v3 isPresentingLibraryInForeground];

  return v4;
}

- (BOOL)isShowingSpotlightOrTodayView
{
  unint64_t v2 = [(SBFluidSwitcherViewController *)self _iconManager];
  char v3 = [v2 isShowingSpotlightOrLeadingCustomView];

  return v3;
}

- (BOOL)isLayoutRoleContentReady:(int64_t)a3 inAppLayout:(id)a4
{
  double v5 = [a4 leafAppLayoutForRole:a3];
  char v6 = [(NSMutableDictionary *)self->_liveContentOverlays objectForKey:v5];
  double v7 = v6;
  if (v6) {
    int v8 = [v6 isContentUpdating] ^ 1;
  }
  else {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (id)currentVelocityValueForVisibleAppLayout:(id)a3 key:(id)a4
{
  visibleItemContainers = self->_visibleItemContainers;
  id v6 = a4;
  double v7 = [a3 anyLeafAppLayout];
  int v8 = [(NSMutableDictionary *)visibleItemContainers objectForKey:v7];

  double v9 = [v8 _velocityForKey:v6];

  return v9;
}

- (id)homeGestureSettings
{
  if ((*(unsigned char *)&self->_dataSourceRespondsTo & 4) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    unint64_t v2 = [WeakRetained homeGestureSettingsForSwitcherContentController:self];
  }
  else
  {
    unint64_t v2 = +[SBHomeGestureDomain rootSettings];
  }
  return v2;
}

- (id)entityRemovalSettings
{
  unint64_t v2 = +[SBSystemAnimationDomain rootSettings];
  char v3 = [v2 entityRemovalAnimationSettings];

  return v3;
}

- (id)siriSettings
{
  return (id)[MEMORY[0x1E4FA5FE0] rootSettings];
}

- (id)layoutRestrictionInfoForItem:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFluidSwitcherViewController *)self displayItemLayoutAttributesCalculator];
  id v6 = [v5 layoutRestrictionInfoForItem:v4];

  return v6;
}

- (int64_t)numberOfVisibleCards
{
  unint64_t v2 = [(SBFluidSwitcherViewController *)self visibleItemContainers];
  int64_t v3 = [v2 count];

  return v3;
}

- (int64_t)numberOfHiddenAppLayoutsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFluidSwitcherViewController *)self dataSource];
  id v6 = v5;
  if ((*((unsigned char *)&self->_dataSourceRespondsTo + 2) & 2) != 0)
  {
    int v8 = [v5 switcherContentController:self hiddenAppLayoutsForBundleIdentifier:v4];
    int64_t v7 = [v8 count];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)continuousExposeIdentifiersInSwitcher
{
  return self->_continuousExposeIdentifiersInSwitcher;
}

- (id)continuousExposeIdentifiersInStrip
{
  return self->_continuousExposeIdentifiersInStrip;
}

- (id)appLayoutsForContinuousExposeIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_appLayoutsForContinuousExposeIdentifiers objectForKey:v4];
  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    int64_t v7 = [(SBFluidSwitcherViewController *)self _unadjustedAppLayouts];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          unint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          double v13 = [v12 continuousExposeIdentifier];
          int v14 = [v13 isEqualToString:v4];

          if (v14) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v9);
    }

    if (self->_appLayoutsForContinuousExposeIdentifiers) {
      appLayoutsForContinuousExposeIdentifiers = self->_appLayoutsForContinuousExposeIdentifiers;
    }
    else {
      appLayoutsForContinuousExposeIdentifiers = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
    id v25 = v4;
    id v26 = v6;
    int v16 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = v6;
    id v17 = [v16 dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    __int16 v18 = [(NSDictionary *)appLayoutsForContinuousExposeIdentifiers bs_dictionaryByAddingEntriesFromDictionary:v17];
    uint64_t v19 = self->_appLayoutsForContinuousExposeIdentifiers;
    self->_appLayoutsForContinuousExposeIdentifiers = v18;
  }
  return v5;
}

- (BOOL)anyHighlightedAppLayoutsForContinuousExposeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_visibleItemContainers allValues];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__SBFluidSwitcherViewController_anyHighlightedAppLayoutsForContinuousExposeIdentifier___block_invoke;
  void v9[3] = &unk_1E6AF4EF8;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "bs_containsObjectPassingTest:", v9);

  return v7;
}

uint64_t __87__SBFluidSwitcherViewController_anyHighlightedAppLayoutsForContinuousExposeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isHighlightedFromCursorHover])
  {
    id v4 = [v3 appLayout];
    id v5 = [v4 continuousExposeIdentifier];
    uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isFloatingDockSupported
{
  return +[SBFloatingDockController isFloatingDockSupported];
}

- (BOOL)isStudyLogEnabled
{
  unint64_t v2 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  char v3 = [v2 isEnabled];

  return v3;
}

- (BOOL)isMedusaCapable
{
  unint64_t v2 = +[SBWorkspace mainWorkspace];
  char v3 = [v2 isMedusaCapable];

  return v3;
}

- (BOOL)isSplitViewSupported
{
  return [(SBFluidSwitcherViewController *)self _windowManagementStyle] != 0;
}

- (BOOL)isInMedusaCapableSpace
{
  unint64_t v2 = [(SBFluidSwitcherViewController *)self layoutContext];
  char v3 = [v2 layoutState];

  id v4 = [v3 elementWithRole:1];
  id v5 = v4;
  if (v4) {
    char v6 = [v4 supportsLayoutRole:2];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)prefersStripHiddenAndDisabled
{
  int v2 = [(SBFluidSwitcherViewController *)self prefersStripHidden];
  if (v2)
  {
    LOBYTE(v2) = SBFIsChamoisStripDisabledWhenHiddenAvailable();
  }
  return v2;
}

- (BOOL)isSoftwareKeyboardVisible
{
  return self->_isSoftwareKeyboardVisible;
}

- (BOOL)isMedusaHostedKeyboardVisible
{
  return self->_isMedusaHostedKeyboardVisible;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)homeScreenIconGridSizeClassForAppLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
  char v6 = [v5 iconGridSizeClassForAppLayout:v4];

  return v6;
}

- (CGRect)shelfItemFrameForAppLayout:(id)a3 inShelf:(id)a4
{
  id v6 = a3;
  char v7 = [(NSMutableDictionary *)self->_visibleShelves objectForKey:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 itemFrameForAppLayout:v6];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    id v17 = [v8 view];
    objc_msgSend(v17, "convertRect:toView:", self->_contentView, v10, v12, v14, v16);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
  }
  else
  {
    double v19 = *MEMORY[0x1E4F1DB28];
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (double)shelfItemScaleForAppLayout:(id)a3 inShelf:(id)a4
{
  id v6 = a3;
  char v7 = [(NSMutableDictionary *)self->_visibleShelves objectForKey:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 itemScaleForAppLayout:v6];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (double)shelfItemCornerRadiusForAppLayout:(id)a3 inShelf:(id)a4
{
  id v6 = a3;
  char v7 = [(NSMutableDictionary *)self->_visibleShelves objectForKey:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 itemCornerRadiusForAppLayout:v6];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (CGRect)preferredFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 bounds:(CGRect)a5 interfaceOrientation:(int64_t)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a4;
  if ([v13 environment] != 3 && objc_msgSend(v13, "environment") != 2)
  {
    [(SBFluidSwitcherViewController *)self _frameForItemWithRole:a3 inMainAppLayout:v13 interfaceOrientation:a6];
    CGFloat width = v14;
    CGFloat height = v15;
    double x = x + v16;
    double y = y + v17;
  }

  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (double)switcherWindowLevel
{
  return *MEMORY[0x1E4F43F20] + 5.0;
}

- (double)floatingDockWindowLevel
{
  return *MEMORY[0x1E4F43F20] + 5.0 + 20.0;
}

- (double)homeScreenWindowLevel
{
  return *MEMORY[0x1E4F43F20] + -2.0;
}

- (void)setPipViewMorphAnimator:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipViewMorphAnimator);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_pipViewMorphAnimator, obj);
    [obj setDelegate:self];
    [obj addObserver:self];
  }
}

- (double)morphToPIPSourceAlpha
{
  return 1.0;
}

- (CGRect)morphToPIPClippingFrame
{
  int v2 = [(SBFluidSwitcherViewController *)self pipViewMorphAnimator];
  char v3 = v2;
  if (v2)
  {
    [v2 sourceClippingFrame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB20];
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (double)morphToPIPClippingCornerRadius
{
  int v2 = [(SBFluidSwitcherViewController *)self pipViewMorphAnimator];
  [v2 sourceClippingCornerRadius];
  double v4 = v3;

  return v4;
}

- (CGPoint)morphToPIPTargetCenter
{
  int v2 = [(SBFluidSwitcherViewController *)self pipViewMorphAnimator];
  double v3 = v2;
  if (v2)
  {
    [v2 sourceFinalCenter];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (double)morphToPIPTargetScale
{
  int v2 = [(SBFluidSwitcherViewController *)self pipViewMorphAnimator];
  double v3 = v2;
  if (v2)
  {
    [v2 sourceFinalScale];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (BOOL)isSystemApertureTransitionTargetForSceneIdentifier:(id)a3 bundleIdentifier:(id)a4 isPortrait:(BOOL)a5
{
  if (!a4) {
    return 0;
  }
  double v7 = (void *)SBApp;
  id v8 = a4;
  id v9 = a3;
  double v10 = [v7 systemApertureControllerForMainDisplay];
  char v11 = [v10 isTransitionTargetForSceneIdentifier:v9 bundleIdentifier:v8];

  BOOL v12 = v11 & a5;
  return v12;
}

- (CGRect)systemApertureDefaultFrame
{
  double v3 = [(id)SBApp systemApertureControllerForMainDisplay];
  double v4 = [(SBFluidSwitcherViewController *)self view];
  [v3 defaultIslandFrameInCoordinateSpace:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGPoint)scrollableQueryModifier:(id)a3 contentOffsetVelocityConsideringNextContentOffset:(CGPoint)a4
{
  -[SBAppSwitcherScrollView contentOffsetVelocityConsideringNextContentOffset:](self->_scrollView, "contentOffsetVelocityConsideringNextContentOffset:", a3, a4.x, a4.y);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)scrollableQueryModifier:(id)a3 convertScrollViewPointToContainerViewCoordinateSpace:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  scrollView = self->_scrollView;
  double v7 = [(SBFluidSwitcherViewController *)self view];
  -[SBAppSwitcherScrollView convertPoint:toView:](scrollView, "convertPoint:toView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (CGAffineTransform)transformForCardUnderSheetForBoundsSize:(SEL)a3
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v8 = MEMORY[0x1E4F1DAB8];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v8 + 32);
  double v10 = [(SBFluidSwitcherViewController *)self delegate];
  double v11 = v10;
  if (*((unsigned char *)&self->_delegateRespondsTo + 3))
  {
    if (v10)
    {
      objc_msgSend(v10, "switcherContentController:transformForCardUnderSheetForBoundsSize:", self, width, height);
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v13 = 0u;
    }
    *(_OWORD *)&retstr->a = v13;
    *(_OWORD *)&retstr->c = v14;
    *(_OWORD *)&retstr->tdouble x = v15;
  }

  return result;
}

- (id)leafAppLayoutForKeyboardFocusedScene
{
  return (id)[(SBSwitcherLiveContentOverlayCoordinating *)self->_liveContentOverlayCoordinator appLayoutForKeyboardFocusedScene];
}

- (int64_t)userInterfaceStyle
{
  int v2 = [(SBFluidSwitcherViewController *)self traitCollection];
  int64_t v3 = [v2 userInterfaceStyle];

  return v3;
}

- (double)presentationValueForAnimatableProperty:(id)a3
{
  int64_t v3 = [(NSMutableDictionary *)self->_animatableProperties valueForKey:a3];
  double v4 = v3;
  if (v3)
  {
    [v3 presentationValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (id)foregroundAppLayouts
{
  return self->_foregroundingAppLayouts;
}

- (char)jetsamModeForAppLayout:(id)a3
{
  return [(SBSwitcherModifier *)self->_rootModifier jetsamModeForAppLayout:a3];
}

- (char)activityModeForAppLayout:(id)a3
{
  return [(SBSwitcherModifier *)self->_rootModifier activityModeForAppLayout:a3];
}

- (void)sceneLayoutTransitionWillStartWithTransitionContext:(id)a3
{
  id v4 = [a3 layoutState];
  [(SBFluidSwitcherViewController *)self _updateForegroundAppLayoutsWithNewLayoutState:v4];
}

- (BOOL)isDisplayEmbedded
{
  int64_t v3 = [(SBFluidSwitcherViewController *)self dataSource];
  id v4 = v3;
  if (*((unsigned char *)&self->_dataSourceRespondsTo + 3)) {
    char v5 = [v3 isDisplayEmbeddedForSwitcherContentController:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (id)appLayoutByBringingItemToFront:(id)a3 inAppLayout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  long long v9 = v8;
  if (!v7 || ([v8 containsItem:v7] & 1) == 0)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  double v10 = [(SBFluidSwitcherViewController *)self dataSource];
  uint64_t v11 = [v10 nextDisplayItemInteractionTimeForSwitcherContentController:self];

  double v12 = [v9 layoutAttributesForItem:v7];
  long long v13 = [v12 attributesByModifyingLastInteractionTime:v11];

  long long v14 = [v9 appLayoutByModifyingLayoutAttributes:v13 forItem:v7];

  return v14;
}

- (id)appLayoutOnStage
{
  return 0;
}

- (id)proposedAppLayoutsForWindowDrag
{
  int64_t v3 = [(SBFluidSwitcherViewController *)self dataSource];
  id v4 = v3;
  if ((*((unsigned char *)&self->_dataSourceRespondsTo + 3) & 8) != 0) {
    [v3 proposedAppLayoutsForWindowDragForSwitcherContentController:self];
  }
  else {
  char v5 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v5;
}

- (BOOL)isSystemAssistantExperiencePersistentSiriEnabled
{
  int v2 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  int64_t v3 = [v2 assistantController];
  char v4 = [v3 isSystemAssistantExperiencePersistentSiriEnabled];

  return v4;
}

- (BOOL)isPartiallyOffscreenWindowsEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isEphemeralSwitcher
{
  if ((*((unsigned char *)&self->_dataSourceRespondsTo + 3) & 0x10) == 0) {
    return 0;
  }
  int64_t v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  LOBYTE(v3) = [WeakRetained isSwitcherContentControllerEphemeral:v3];

  return (char)v3;
}

- (void)handleFluidSwitcherGestureManager:(id)a3 didBeginGesture:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  long long v9 = [(SBFluidSwitcherViewController *)self _gestureManager];
  if (!v8)
  {
    double v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 1762, @"Invalid parameter not satisfying: %@", @"gesture != nil" object file lineNumber description];
  }
  if (([v7 isEqual:v9] & 1) == 0)
  {
    double v10 = [v8 gestureEvent];
    char v11 = [v10 isWindowDragGestureEvent];

    if ((v11 & 1) == 0)
    {
      double v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 1763, @"Invalid parameter not satisfying: %@", @"[gestureManager isEqual:ourGestureManager] || [[gesture gestureEvent] isWindowDragGestureEvent]" object file lineNumber description];
    }
  }
  long long v13 = [(SBFluidSwitcherViewController *)self layoutContext];
  long long v14 = [v13 activeGesture];

  if (v14)
  {
    double v27 = [MEMORY[0x1E4F28B00] currentHandler];
    debugName = self->_debugName;
    double v24 = SBStringForFluidSwitcherGestureType([v8 type]);
    double v25 = [v13 activeGesture];
    double v26 = SBStringForFluidSwitcherGestureType([v25 type]);
    [v27 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 1766, @"[%@] Only one gesture at a time. Can't begin %@ while %@ is still active", debugName, v24, v26 object file lineNumber description];
  }
  long long v15 = [(SBFluidSwitcherViewController *)self delegate];
  double v16 = [v8 selectedAppLayout];
  double v17 = [(SBFluidSwitcherViewController *)self _spaceContainingAppLayout:v16];

  if (v17)
  {
    double v18 = [(SBFluidSwitcherViewController *)self layoutContext];
    if objc_msgSend(v18, "shouldAddAppLayoutToFront:whenBeginningGestureOfType:layoutContext:", v17, objc_msgSend(v8, "type"), v18)&& (*(unsigned char *)&self->_delegateRespondsTo)
    {
      [v15 switcherContentController:self bringAppLayoutToFront:v17];
    }
  }
  if (![(NSMutableSet *)self->_systemApertureContentSuppressionAssertionsForGesture count])
  {
    double v19 = [v8 selectedAppLayout];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __83__SBFluidSwitcherViewController_handleFluidSwitcherGestureManager_didBeginGesture___block_invoke;
    v28[3] = &unk_1E6AF9EF0;
    v28[4] = self;
    [v19 enumerate:v28];
  }
  [(SBFluidSwitcherViewController *)self _cancelWindowMorphingAnimation];
  [v13 setActiveGesture:v8];
  double v20 = [v8 gestureEvent];
  double v21 = [(SBFluidSwitcherViewController *)self _adjustedGestureEventForGestureEvent:v20 fromGestureManager:v7];
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v21];
  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
}

void __83__SBFluidSwitcherViewController_handleFluidSwitcherGestureManager_didBeginGesture___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if (![v8 type])
  {
    char v4 = [*(id *)(a1 + 32) _gestureManager];
    char v5 = [v8 bundleIdentifier];
    double v6 = [v8 uniqueIdentifier];
    id v7 = [v4 acquireSystemApertureSuppressionAssertionForBundleIdentifier:v5 sceneIdentifier:v6];

    if (v7) {
      [*(id *)(*(void *)(a1 + 32) + 1560) addObject:v7];
    }
  }
}

- (void)handleFluidSwitcherGestureManager:(id)a3 didUpdateGesture:(id)a4
{
  id v19 = a3;
  id v7 = a4;
  id v8 = [(SBFluidSwitcherViewController *)self _gestureManager];
  if (!v7)
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 1811, @"Invalid parameter not satisfying: %@", @"gesture != nil" object file lineNumber description];
  }
  long long v9 = [(SBFluidSwitcherViewController *)self layoutContext];
  double v10 = [v9 activeGesture];
  char v11 = [v7 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 1812, @"Invalid parameter not satisfying: %@", @"[gesture isEqual:[[self layoutContext] activeGesture]]" object file lineNumber description];
  }
  if (([v19 isEqual:v8] & 1) == 0)
  {
    double v12 = [v7 gestureEvent];
    char v13 = [v12 isWindowDragGestureEvent];

    if ((v13 & 1) == 0)
    {
      long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 1813, @"Invalid parameter not satisfying: %@", @"[gestureManager isEqual:ourGestureManager] || [[gesture gestureEvent] isWindowDragGestureEvent]" object file lineNumber description];
    }
  }
  long long v15 = [v7 gestureEvent];
  double v16 = [(SBFluidSwitcherViewController *)self _adjustedGestureEventForGestureEvent:v15 fromGestureManager:v19];
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v16];
}

- (void)handleFluidSwitcherGestureManager:(id)a3 didEndGesture:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v9 = [(SBFluidSwitcherViewController *)self _gestureManager];
  if (!v8)
  {
    double v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 1824, @"Invalid parameter not satisfying: %@", @"gesture != nil" object file lineNumber description];
  }
  double v10 = [(SBFluidSwitcherViewController *)self layoutContext];
  char v11 = [v10 activeGesture];
  char v12 = [v8 isEqual:v11];

  if ((v12 & 1) == 0)
  {
    double v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 1825, @"Invalid parameter not satisfying: %@", @"[gesture isEqual:[[self layoutContext] activeGesture]]" object file lineNumber description];
  }
  if (([v7 isEqual:v9] & 1) == 0)
  {
    char v13 = [v8 gestureEvent];
    char v14 = [v13 isWindowDragGestureEvent];

    if ((v14 & 1) == 0)
    {
      long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 1826, @"Invalid parameter not satisfying: %@", @"[gestureManager isEqual:ourGestureManager] || [[gesture gestureEvent] isWindowDragGestureEvent]" object file lineNumber description];
    }
  }
  double v16 = [(SBFluidSwitcherViewController *)self layoutContext];
  [v16 setActiveGesture:0];

  [(UIView *)self->_hitTestBlockerView setHidden:1];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  double v17 = self->_systemApertureContentSuppressionAssertionsForGesture;
  uint64_t v18 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * v21++) invalidate];
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v19);
  }

  [(NSMutableSet *)self->_systemApertureContentSuppressionAssertionsForGesture removeAllObjects];
  double v22 = [v8 gestureEvent];
  double v23 = [(SBFluidSwitcherViewController *)self _adjustedGestureEventForGestureEvent:v22 fromGestureManager:v7];
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v23];
  double v24 = [(SBFluidSwitcherViewController *)self delegate];
  double v25 = [v8 selectedAppLayout];
  double v26 = [(SBFluidSwitcherViewController *)self _spaceContainingAppLayout:v25];

  if (v26)
  {
    double v27 = [(SBFluidSwitcherViewController *)self layoutContext];
    if objc_msgSend(v27, "shouldAddAppLayoutToFront:whenEndingGestureOfType:layoutContext:", v26, objc_msgSend(v8, "type"), v27)&& (*(unsigned char *)&self->_delegateRespondsTo)
    {
      [v24 switcherContentController:self bringAppLayoutToFront:v26];
    }
  }
}

- (id)_spaceContainingAppLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_leafAppLayoutsToRecencyAppLayouts objectForKey:v4];
  if (!v5)
  {
    double v6 = [(SBFluidSwitcherViewController *)self _unadjustedAppLayouts];
    int v7 = [v6 containsObject:v4];

    if (v7) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }

  return v5;
}

- (void)handleTapToBringItemContainerForward:(id)a3
{
  contentView = self->_contentView;
  id v5 = a3;
  [v5 locationInView:contentView];
  -[SBFluidSwitcherViewController _itemContainerAtLocation:environment:](self, "_itemContainerAtLocation:environment:", 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 modifierFlags];

  [(SBFluidSwitcherViewController *)self didSelectContainer:v7 modifierFlags:v6];
}

- (void)handleClickDownToBringItemContainerForward:(id)a3
{
  id v9 = a3;
  [v9 locationInView:self->_contentView];
  id v4 = -[SBFluidSwitcherViewController _itemContainerAtLocation:environment:](self, "_itemContainerAtLocation:environment:", 0);
  id v5 = [(SBFluidSwitcherLayoutContext *)self->_layoutContext layoutState];
  uint64_t v6 = [v5 appLayout];
  id v7 = [v4 appLayout];
  int v8 = [v6 containsAnyItemFromAppLayout:v7];

  if (v8) {
    -[SBFluidSwitcherViewController didSelectContainer:modifierFlags:](self, "didSelectContainer:modifierFlags:", v4, [v9 modifierFlags]);
  }
}

- (void)handleContinuousExposeHoverGesture:(id)a3
{
  id v15 = a3;
  int v4 = [(SBSwitcherModifier *)self->_rootModifier wantsContinuousExposeHoverGesture];
  id v5 = v15;
  if (v4)
  {
    contentView = self->_contentView;
    id v7 = [v15 view];
    [v15 locationInView:v7];
    -[SBFluidSwitcherContentView convertPoint:fromView:](contentView, "convertPoint:fromView:", 0);
    double v9 = v8;
    double v11 = v10;

    uint64_t v12 = [v15 state];
    if ((unint64_t)(v12 - 1) > 3) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = qword_1D8FD0C88[v12 - 1];
    }
    char v14 = -[SBHoverSwitcherModifierEvent initWithPhase:position:]([SBHoverSwitcherModifierEvent alloc], "initWithPhase:position:", v13, v9, v11);
    [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v14];

    id v5 = v15;
  }
}

- (void)historianModifier:(id)a3 didRecordEntry:(id)a4
{
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherViewController.m" lineNumber:1909 description:@"Root modifier should be SBHistorianSwitcherModifier"];
  }
  [(SBFluidSwitcherModifierTimelineController *)self->_modifierTimelineController addEntry:v7];
}

- (BOOL)historianModifier:(id)a3 shouldRecordEvent:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(SBFluidSwitcherViewController *)self isShowingModifierTimeline]
    && [(SBFluidSwitcherViewController *)self _shouldLogSwitcherModifierEvent:v5]
    && [(SBFluidSwitcherModifierTimelineController *)self->_modifierTimelineController wantsEvent:v5];

  return v6;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);
    if (objc_opt_respondsToSelector()) {
      int v5 = 2;
    }
    else {
      int v5 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFFFFFD | v5);
    if (objc_opt_respondsToSelector()) {
      int v6 = 4;
    }
    else {
      int v6 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFFFFFB | v6);
    if (objc_opt_respondsToSelector()) {
      int v7 = 8;
    }
    else {
      int v7 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFFFFF7 | v7);
    if (objc_opt_respondsToSelector()) {
      int v8 = 16;
    }
    else {
      int v8 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFFFFEF | v8);
    if (objc_opt_respondsToSelector()) {
      int v9 = 32;
    }
    else {
      int v9 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFFFFDF | v9);
    if (objc_opt_respondsToSelector()) {
      int v10 = 64;
    }
    else {
      int v10 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFFFFBF | v10);
    if (objc_opt_respondsToSelector()) {
      int v11 = 128;
    }
    else {
      int v11 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFFFF7F | v11);
    if (objc_opt_respondsToSelector()) {
      int v12 = 256;
    }
    else {
      int v12 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFFFEFF | v12);
    if (objc_opt_respondsToSelector()) {
      int v13 = 512;
    }
    else {
      int v13 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFFFDFF | v13);
    if (objc_opt_respondsToSelector()) {
      int v14 = 1024;
    }
    else {
      int v14 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFFFBFF | v14);
    if (objc_opt_respondsToSelector()) {
      int v15 = 2048;
    }
    else {
      int v15 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFFF7FF | v15);
    if (objc_opt_respondsToSelector()) {
      int v16 = 4096;
    }
    else {
      int v16 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFFEFFF | v16);
    if (objc_opt_respondsToSelector()) {
      int v17 = 0x2000;
    }
    else {
      int v17 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFFDFFF | v17);
    if (objc_opt_respondsToSelector()) {
      int v18 = 0x4000;
    }
    else {
      int v18 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFFBFFF | v18);
    if (objc_opt_respondsToSelector()) {
      int v19 = 0x8000;
    }
    else {
      int v19 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFF7FFF | v19);
    if (objc_opt_respondsToSelector()) {
      int v20 = 0x10000;
    }
    else {
      int v20 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFEFFFF | v20);
    if (objc_opt_respondsToSelector()) {
      int v21 = 0x20000;
    }
    else {
      int v21 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFDFFFF | v21);
    if (objc_opt_respondsToSelector()) {
      int v22 = 0x40000;
    }
    else {
      int v22 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFFBFFFF | v22);
    if (objc_opt_respondsToSelector()) {
      int v23 = 0x80000;
    }
    else {
      int v23 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFF7FFFF | v23);
    if (objc_opt_respondsToSelector()) {
      int v24 = 0x100000;
    }
    else {
      int v24 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFEFFFFF | v24);
    if (objc_opt_respondsToSelector()) {
      int v25 = 0x200000;
    }
    else {
      int v25 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFDFFFFF | v25);
    if (objc_opt_respondsToSelector()) {
      int v26 = 0x400000;
    }
    else {
      int v26 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFFBFFFFF | v26);
    if (objc_opt_respondsToSelector()) {
      int v27 = 0x800000;
    }
    else {
      int v27 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFF7FFFFF | v27);
    if (objc_opt_respondsToSelector()) {
      int v28 = 0x1000000;
    }
    else {
      int v28 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFEFFFFFF | v28);
    if (objc_opt_respondsToSelector()) {
      int v29 = 0x2000000;
    }
    else {
      int v29 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFDFFFFFF | v29);
    if (objc_opt_respondsToSelector()) {
      int v30 = 0x4000000;
    }
    else {
      int v30 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xFBFFFFFF | v30);
    if (objc_opt_respondsToSelector()) {
      int v31 = 0x8000000;
    }
    else {
      int v31 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xF7FFFFFF | v31);
    if (objc_opt_respondsToSelector()) {
      int v32 = 0x10000000;
    }
    else {
      int v32 = 0;
    }
    self->_delegateRespondsTo = ($7EE821BD319585819EBA76872E177884)(*(_DWORD *)&self->_delegateRespondsTo & 0xEFFFFFFF | v32);
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);
    if (objc_opt_respondsToSelector()) {
      int v5 = 2;
    }
    else {
      int v5 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFFFFFD | v5);
    if (objc_opt_respondsToSelector()) {
      int v6 = 4;
    }
    else {
      int v6 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFFFFFB | v6);
    if (objc_opt_respondsToSelector()) {
      int v7 = 8;
    }
    else {
      int v7 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFFFFF7 | v7);
    if (objc_opt_respondsToSelector()) {
      int v8 = 16;
    }
    else {
      int v8 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFFFFEF | v8);
    if (objc_opt_respondsToSelector()) {
      int v9 = 32;
    }
    else {
      int v9 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFFFFDF | v9);
    if (objc_opt_respondsToSelector()) {
      int v10 = 64;
    }
    else {
      int v10 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFFFFBF | v10);
    if (objc_opt_respondsToSelector()) {
      int v11 = 128;
    }
    else {
      int v11 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFFFF7F | v11);
    if (objc_opt_respondsToSelector()) {
      int v12 = 256;
    }
    else {
      int v12 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFFFEFF | v12);
    if (objc_opt_respondsToSelector()) {
      int v13 = 512;
    }
    else {
      int v13 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFFFDFF | v13);
    if (objc_opt_respondsToSelector()) {
      int v14 = 1024;
    }
    else {
      int v14 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFFFBFF | v14);
    if (objc_opt_respondsToSelector()) {
      int v15 = 2048;
    }
    else {
      int v15 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFFF7FF | v15);
    if (objc_opt_respondsToSelector()) {
      int v16 = 4096;
    }
    else {
      int v16 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFFEFFF | v16);
    if (objc_opt_respondsToSelector()) {
      int v17 = 0x2000;
    }
    else {
      int v17 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFFDFFF | v17);
    if (objc_opt_respondsToSelector()) {
      int v18 = 0x4000;
    }
    else {
      int v18 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFFBFFF | v18);
    if (objc_opt_respondsToSelector()) {
      int v19 = 0x8000;
    }
    else {
      int v19 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFF7FFF | v19);
    if (objc_opt_respondsToSelector()) {
      int v20 = 0x10000;
    }
    else {
      int v20 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFEFFFF | v20);
    if (objc_opt_respondsToSelector()) {
      int v21 = 0x20000;
    }
    else {
      int v21 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFDFFFF | v21);
    if (objc_opt_respondsToSelector()) {
      int v22 = 0x40000;
    }
    else {
      int v22 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFFBFFFF | v22);
    if (objc_opt_respondsToSelector()) {
      int v23 = 0x80000;
    }
    else {
      int v23 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFF7FFFF | v23);
    if (objc_opt_respondsToSelector()) {
      int v24 = 0x100000;
    }
    else {
      int v24 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFEFFFFF | v24);
    if (objc_opt_respondsToSelector()) {
      int v25 = 0x200000;
    }
    else {
      int v25 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFDFFFFF | v25);
    if (objc_opt_respondsToSelector()) {
      int v26 = 0x400000;
    }
    else {
      int v26 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFFBFFFFF | v26);
    if (objc_opt_respondsToSelector()) {
      int v27 = 0x800000;
    }
    else {
      int v27 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFF7FFFFF | v27);
    if (objc_opt_respondsToSelector()) {
      int v28 = 0x1000000;
    }
    else {
      int v28 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFEFFFFFF | v28);
    if (objc_opt_respondsToSelector()) {
      int v29 = 0x2000000;
    }
    else {
      int v29 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFDFFFFFF | v29);
    if (objc_opt_respondsToSelector()) {
      int v30 = 0x4000000;
    }
    else {
      int v30 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xFBFFFFFF | v30);
    if (objc_opt_respondsToSelector()) {
      int v31 = 0x8000000;
    }
    else {
      int v31 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xF7FFFFFF | v31);
    if (objc_opt_respondsToSelector()) {
      int v32 = 0x10000000;
    }
    else {
      int v32 = 0;
    }
    self->_$0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = ($0ADF0CA18E1B7C2644544823916302BC)(*(_DWORD *)&self->_dataSourceRespondsTo & 0xEFFFFFFF | v32);
    [(SBFluidSwitcherViewController *)self _rebuildCachedAdjustedAppLayouts];
    [(SBFluidSwitcherViewController *)self _updateSnapshotCacheReloadingForActiveInterfaceOrientationChange];
  }
}

- (void)setAsyncRenderingDisabled:(BOOL)a3
{
  if (self->_asyncRenderingDisabled != a3)
  {
    self->_asyncRenderingDisabled = a3;
    [(SBFluidSwitcherViewController *)self _updateAsyncRenderingAndResizesHostedContext];
  }
}

- (double)snapshotScaleForSceneHandle:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    int v6 = [v4 displayItemRepresentation];
    int v7 = [(SBFluidSwitcherViewController *)self _unadjustedAppLayouts];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61__SBFluidSwitcherViewController_snapshotScaleForSceneHandle___block_invoke;
    v19[3] = &unk_1E6AF4B60;
    id v8 = v6;
    id v20 = v8;
    int v9 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v19);

    uint64_t v10 = [v9 layoutRoleForItem:v8];
    if (v9)
    {
      uint64_t v11 = v10;
    }
    else
    {
      if ([v5 layoutRole] == 3) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 1;
      }
      int v14 = SBAppLayoutGenericAppLayoutWithConfiguration(1);
      int v9 = [v14 appLayoutByModifyingEnvironment:v13];

      uint64_t v11 = 1;
    }
    [(SBSwitcherModifier *)self->_rootModifier snapshotScaleForLayoutRole:v11 inAppLayout:v9];
    double v12 = v15;
    int v16 = [v5 application];
    int v17 = [v16 classicAppPhoneAppRunningOnPad];

    if (v17) {
      double v12 = v12 + v12;
    }
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

uint64_t __61__SBFluidSwitcherViewController_snapshotScaleForSceneHandle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(a1 + 32)];
}

- (void)acquiredViewController:(id)a3 forTransientOverlayAppLayout:(id)a4
{
}

- (void)relinquishTransientOverlayViewController:(id)a3
{
}

id __104__SBFluidSwitcherViewController_shouldAddAppLayoutToFront_forTransitionWithContext_transitionCompleted___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 preferredDisplayOrdinal];
  if (v4 == [*(id *)(a1 + 32) displayOrdinal])
  {
    int v5 = 0;
  }
  else
  {
    int v5 = objc_msgSend(v3, "appLayoutByModifyingPreferredDisplayOrdinal:", objc_msgSend(*(id *)(a1 + 32), "displayOrdinal"));
  }

  return v5;
}

- (double)contentAspectRatio
{
  int v2 = [(SBFluidSwitcherViewController *)self viewIfLoaded];
  [v2 bounds];
  if (v2) {
    double v5 = v3 / v4;
  }
  else {
    double v5 = 0.0;
  }

  return v5;
}

- (BOOL)shouldAcceleratedHomeButtonPressBegin
{
  return [(SBSwitcherModifier *)self->_rootModifier shouldAcceleratedHomeButtonPressBegin];
}

- (BOOL)shouldRubberbandFullScreenHomeGrabberView
{
  return [(SBSwitcherModifier *)self->_rootModifier shouldRubberbandFullScreenHomeGrabberView];
}

- (BOOL)isStatusBarHiddenForAppLayout:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFluidSwitcherViewController *)self appLayouts];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return [(SBSwitcherModifier *)self->_rootModifier isContentStatusBarVisibleForIndex:v6] ^ 1;
  }
}

- (id)leadingStatusBarStyleRequest
{
  if ([(NSMutableDictionary *)self->_liveContentOverlays count])
  {
    id v4 = [(SBFluidSwitcherViewController *)self _leafAppLayoutInLiveContentOverlaysWithLayoutRole:1];
    if (!v4)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherViewController.m" lineNumber:2138 description:@"We should have found a leading leaf app layout by this point."];
    }
    double v5 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
    uint64_t v6 = [v5 statusBarManager];
    int v7 = [v6 assertionManager];

    id v8 = [(NSMutableDictionary *)self->_liveContentOverlays objectForKey:v4];
    uint64_t v9 = [v8 leadingStatusBarStyle];
    uint64_t v10 = [v8 backgroundActivitiesToSuppress];
    [v7 effectiveStatusBarStyleForRequestedStyle:v9 styleOverridesToSuppress:STUIStyleOverridesForBackgroundActivityIdentifiers()];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FA9970]) initWithResolvedStyle:_UIStatusBarResolvedStyleFromStyle() foregroundColor:0];
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)trailingStatusBarStyleRequest
{
  if ([(NSMutableDictionary *)self->_liveContentOverlays count])
  {
    id v4 = [(SBFluidSwitcherViewController *)self _leafAppLayoutInLiveContentOverlaysWithLayoutRole:2];
    if (!v4)
    {
      id v4 = [(SBFluidSwitcherViewController *)self _leafAppLayoutInLiveContentOverlaysWithLayoutRole:1];
      if (!v4)
      {
        int v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherViewController.m" lineNumber:2160 description:@"We should have found a trailing leaf app layout by this point."];

        id v4 = 0;
      }
    }
    double v5 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
    uint64_t v6 = [v5 statusBarManager];
    int v7 = [v6 assertionManager];

    id v8 = [(NSMutableDictionary *)self->_liveContentOverlays objectForKey:v4];
    uint64_t v9 = [v8 trailingStatusBarStyle];
    uint64_t v10 = [v8 backgroundActivitiesToSuppress];
    uint64_t v11 = [v7 effectiveStatusBarStyleForRequestedStyle:v9 styleOverridesToSuppress:STUIStyleOverridesForBackgroundActivityIdentifiers()];
    double v12 = (void *)[objc_alloc(MEMORY[0x1E4FA9970]) initWithResolvedStyle:_SBStatusBarStyleFromLegacyStyle(v11) foregroundColor:0];
  }
  else
  {
    double v12 = 0;
  }
  return v12;
}

- (id)_leafAppLayoutInLiveContentOverlaysWithLayoutRole:(int64_t)a3
{
  id v4 = self;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_liveContentOverlays count] == 1)
  {
    double v5 = [(NSMutableDictionary *)v4->_liveContentOverlays allKeys];
    uint64_t v6 = [v5 firstObject];
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = [(NSMutableDictionary *)v4->_liveContentOverlays allKeys];
    uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      int64_t v23 = a3;
LABEL_5:
      uint64_t v10 = 0;
      uint64_t v24 = v8;
      while (1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
        uint64_t v11 = [(NSDictionary *)v4->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v6];
        double v12 = v11;
        if (v11)
        {
          uint64_t v13 = [v11 leafAppLayoutForRole:a3];

          if (v13 == v6)
          {
            id v20 = v6;
LABEL_17:

            goto LABEL_18;
          }
        }
        else
        {
          int v14 = v4;
          double v15 = [(SBFluidSwitcherViewController *)v4 _sbWindowScene];
          int v16 = [v15 layoutStateProvider];
          int v17 = [v16 layoutState];
          int v18 = [v17 appLayout];

          a3 = v23;
          int v19 = [v18 leafAppLayoutForRole:v23];

          if (v19 == v6)
          {
            id v21 = v6;

            goto LABEL_17;
          }

          id v4 = v14;
          uint64_t v8 = v24;
        }

        if (v8 == ++v10)
        {
          uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v8) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
    uint64_t v6 = 0;
LABEL_18:
  }
  return v6;
}

- (void)handleEventResponse:(id)a3
{
  if (a3) {
    -[SBFluidSwitcherViewController _handleEventResponse:](self, "_handleEventResponse:");
  }
}

- (id)iconForAppLayout:(id)a3
{
  double v3 = [(SBFluidSwitcherViewController *)self iconViewForAppLayout:a3];
  id v4 = [v3 icon];

  return v4;
}

- (id)liveContentOverlayForAppLayout:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_liveContentOverlays objectForKey:a3];
}

- (void)clickReceivedForHomeGrabberView:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v5 = [(SBFluidSwitcherViewController *)self _spacesWithVisibleHomeAffordances];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        id v11 = [(SBFluidSwitcherViewController *)self homeGrabberViewForAppLayout:v10];

        if (v11 == v4)
        {
          uint64_t v12 = [v10 environment];
          if (v12 == 2)
          {
            uint64_t v13 = [(SBFluidSwitcherViewController *)self layoutContext];
            int v14 = [v13 layoutState];

            uint64_t v15 = [v14 floatingConfiguration];
            uint64_t v16 = 4;
            if (v15 != 2) {
              uint64_t v16 = v15;
            }
            if (v15 == 1) {
              uint64_t v17 = 3;
            }
            else {
              uint64_t v17 = v16;
            }
            int v18 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
            [(SBSwitcherTransitionRequest *)v18 setFloatingConfiguration:v17];
            int v19 = [(SBFluidSwitcherViewController *)self delegate];
            [v19 switcherContentController:self performTransitionWithRequest:v18 gestureInitiated:0];
          }
          else if (v12 == 1)
          {
            SBWorkspaceSuspendActiveDisplay();
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v20 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v7 = v20;
    }
    while (v20);
  }
}

- (void)tapReceivedForGrabberTongueAtEdge:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v8 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    double v5 = [(SBFluidSwitcherViewController *)self appLayouts];
    uint64_t v6 = [v5 firstObject];
    [(SBSwitcherTransitionRequest *)v8 setAppLayout:v6];

    [(SBSwitcherTransitionRequest *)v8 setFloatingConfiguration:1];
    [(SBSwitcherTransitionRequest *)v8 setPreferredInterfaceOrientation:[(SBFluidSwitcherViewController *)self switcherInterfaceOrientation]];
    uint64_t v7 = [(SBFluidSwitcherViewController *)self delegate];
    [v7 switcherContentController:self performTransitionWithRequest:v8 gestureInitiated:0];
  }
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SBFluidSwitcherViewController *)self rootModifier];
  int v8 = [v7 canPerformKeyboardShortcutAction:a3 forBundleIdentifier:v6];

  id v9 = v6;
  uint64_t v10 = [(SBSwitcherLiveContentOverlayCoordinating *)self->_liveContentOverlayCoordinator appLayoutForKeyboardFocusedScene];
  id v11 = v10;
  BOOL v12 = v9 != 0;
  uint64_t v13 = v9;
  if (v9) {
    goto LABEL_3;
  }
  int v14 = [v10 allItems];
  uint64_t v15 = [v14 firstObject];
  uint64_t v13 = [v15 bundleIdentifier];

  if (v13)
  {
LABEL_3:
    uint64_t v16 = +[SBApplicationController sharedInstanceIfExists];
    uint64_t v17 = [v16 applicationWithBundleIdentifier:v13];
  }
  else
  {
    uint64_t v17 = 0;
  }
  unint64_t v18 = [(SBFluidSwitcherViewController *)self _windowManagementStyle];
  int v19 = [(SBSceneManager *)self->_sceneManager displayIdentity];
  int v20 = [v17 supportsMultiWindowLayoutsForSwitcherWindowManagementStyle:v18 displayIdentity:v19];

  switch(a3)
  {
    case 3:
      if (v17)
      {
        uint64_t v32 = [(SBFluidSwitcherViewController *)self numberOfVisibleAppLayoutsForBundleIdentifier:v13];
        if (!v8) {
          goto LABEL_62;
        }
      }
      else
      {
        uint64_t v32 = 0;
        if (!v8) {
          goto LABEL_62;
        }
      }
      long long v45 = [v17 info];
      char v46 = [v45 supportsMultiwindow];
      if (v32 > 0) {
        char v34 = v46;
      }
      else {
        char v34 = 0;
      }

      goto LABEL_69;
    case 4:
    case 5:
      BOOL v22 = [(SBFluidSwitcherViewController *)self isChamoisWindowingUIEnabled];
      if (v22
        || ([v17 info],
            int v19 = objc_claimAutoreleasedReturnValue(),
            [v19 supportsMultiwindow]))
      {
        long long v23 = [(SBFluidSwitcherViewController *)self _keyboardFocusableLiveAppLayoutsMatchingFocusedApp:1 foundAtIndex:0];
        long long v24 = v23;
        if (v22)
        {
          long long v54 = v23;
          uint64_t v55 = [v23 count];
          if (v11)
          {
            int v25 = [v11 allItems];
            uint64_t v26 = [v25 firstObject];
            long long v52 = [v26 bundleIdentifier];

            v58[0] = MEMORY[0x1E4F143A8];
            v58[1] = 3221225472;
            v58[2] = __86__SBFluidSwitcherViewController_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_2;
            v58[3] = &unk_1E6AF4B60;
            id v27 = v52;
            long long v28 = v24;
            id v29 = v27;
            id v59 = v27;
            LODWORD(v25) = objc_msgSend(v28, "bs_containsObjectPassingTest:", v58);

            if (!v25)
            {
              int v30 = 0;
              goto LABEL_65;
            }
          }
          else
          {
            double v47 = [v24 firstObject];
            id v53 = [v47 allItems];
            uint64_t v48 = [v53 firstObject];
            id v29 = [v48 bundleIdentifier];
          }
          double v49 = [(SBSwitcherModifier *)self->_rootModifier inactiveAppLayoutsReachableByKeyboardShortcut];
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __86__SBFluidSwitcherViewController_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_3;
          v56[3] = &unk_1E6AF4B60;
          id v29 = v29;
          id v57 = v29;
          int v30 = objc_msgSend(v49, "bs_filter:", v56);

LABEL_65:
          BOOL v40 = [v30 count] != 0;

          long long v24 = v54;
          unint64_t v39 = v55;
          if (!v8) {
            goto LABEL_49;
          }
          goto LABEL_46;
        }
      }
      else
      {
        long long v24 = 0;
      }

      unint64_t v39 = [v24 count];
      BOOL v40 = 0;
      if (!v8) {
        goto LABEL_49;
      }
LABEL_46:
      int v8 = v39 > 1 || v40;
      goto LABEL_49;
    case 6:
      if (!v8) {
        goto LABEL_62;
      }
      long long v33 = [(SBFluidSwitcherViewController *)self appLayouts];
      char v34 = objc_msgSend(v33, "bs_containsObjectPassingTest:", &__block_literal_global_404);
      goto LABEL_55;
    case 7:
    case 8:
    case 13:
    case 14:
      goto LABEL_5;
    case 11:
      if (!v9 && v11)
      {
        if (([v11 environment] & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          BOOL v12 = 1;
        }
        else
        {
          double v50 = [(NSDictionary *)self->_leafAppLayoutsToRecencyAppLayouts objectForKey:v11];
          BOOL v12 = [v50 configuration] != 1;
        }
      }
      char v34 = v8 & v12;
      goto LABEL_69;
    case 12:
      if (v8) {
        int v8 = [v11 environment] == 1;
      }
LABEL_5:
      if (v17) {
        int v21 = v8;
      }
      else {
        int v21 = 0;
      }
      int v8 = v21 & v20;
      goto LABEL_50;
    case 15:
    case 16:
      if (v17) {
        int v31 = v8;
      }
      else {
        int v31 = 0;
      }
      if (v31 == 1)
      {
        long long v24 = [(SBFluidSwitcherViewController *)self _keyboardFocusableLiveAppLayoutsMatchingFocusedApp:0 foundAtIndex:0];
        int v8 = (unint64_t)[v24 count] > 1;
LABEL_49:
      }
      else
      {
        int v8 = 0;
      }
      goto LABEL_50;
    case 17:
      if (!v8) {
        goto LABEL_62;
      }
      int v8 = ![(SBFluidSwitcherViewController *)self appLayoutContainsAnUnoccludedMaximizedDisplayItem:v11];
      goto LABEL_52;
    case 18:
      if (v17) {
        char v35 = v8;
      }
      else {
        char v35 = 0;
      }
      char v34 = v35 & v20;
      goto LABEL_69;
    case 20:
      if (v17) {
        int v36 = v8;
      }
      else {
        int v36 = 0;
      }
      if (v36 == 1)
      {
        __int16 v37 = [(id)SBApp windowSceneManager];
        uint64_t v38 = [v37 connectedWindowScenes];
        int v8 = (unint64_t)[v38 count] > 1;

        goto LABEL_52;
      }
LABEL_62:
      char v34 = 0;
      goto LABEL_69;
    default:
LABEL_50:
      if ((unint64_t)a3 > 0x14)
      {
        char v34 = v8;
      }
      else
      {
        uint64_t v41 = 1 << a3;
        char v34 = v8;
        if ((v41 & 0x1A1180) != 0)
        {
LABEL_52:
          char v34 = 0;
          if (!v9 && v8)
          {
            double v42 = (void *)MEMORY[0x1E4F42A28];
            long long v33 = [(SBFluidSwitcherViewController *)self view];
            long long v43 = [v42 focusSystemForEnvironment:v33];
            id v44 = [v43 focusedItem];
            objc_opt_class();
            char v34 = objc_opt_isKindOfClass() ^ 1;

LABEL_55:
          }
        }
      }
LABEL_69:

      return v34 & 1;
  }
}

BOOL __86__SBFluidSwitcherViewController_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 environment] == 2;
}

uint64_t __86__SBFluidSwitcherViewController_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 containsItemWithBundleIdentifier:*(void *)(a1 + 32)];
}

uint64_t __86__SBFluidSwitcherViewController_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 containsItemWithBundleIdentifier:*(void *)(a1 + 32)];
}

- (void)performKeyboardShortcutAction:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      uint64_t v7 = [(SBSwitcherLiveContentOverlayCoordinating *)self->_liveContentOverlayCoordinator appLayoutForKeyboardFocusedScene];
      int v8 = v7;
      if (v7)
      {
        id v9 = [v7 allItems];
        uint64_t v10 = [v9 firstObject];
        id v11 = [v10 bundleIdentifier];

        uint64_t v26 = 0;
        id v27 = &v26;
        uint64_t v28 = 0x2020000000;
        char v29 = 0;
        BOOL v12 = [(NSMutableDictionary *)self->_visibleShelves allKeys];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __63__SBFluidSwitcherViewController_performKeyboardShortcutAction___block_invoke;
        v21[3] = &unk_1E6AF9F88;
        id v13 = v11;
        id v22 = v13;
        long long v23 = self;
        long long v24 = &v26;
        uint64_t v25 = 3;
        [v12 enumerateObjectsUsingBlock:v21];

        if (!*((unsigned char *)v27 + 24))
        {
          int v14 = [(SBFluidSwitcherViewController *)self layoutContext];
          uint64_t v15 = [v14 layoutState];

          uint64_t v16 = [v15 bundleIDShowingAppExpose];
          if (v16)
          {
            if ([v13 isEqualToString:v16])
            {

              id v13 = 0;
            }
          }
          uint64_t v17 = +[SBWorkspace mainWorkspace];
          unint64_t v18 = [(UIViewController *)self _fbsDisplayConfiguration];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __63__SBFluidSwitcherViewController_performKeyboardShortcutAction___block_invoke_2;
          v19[3] = &unk_1E6AF57E8;
          id v13 = v13;
          id v20 = v13;
          [v17 requestTransitionWithOptions:0 displayConfiguration:v18 builder:v19];
        }
        _Block_object_dispose(&v26, 8);
      }
      break;
    case 4:
    case 5:
      BOOL v5 = a3 == 4;
      uint64_t v6 = 1;
      goto LABEL_7;
    case 6:
      [(SBFluidSwitcherViewController *)self _toggleFloatingAppVisibility];
      break;
    case 7:
    case 8:
    case 11:
    case 12:
    case 13:
    case 14:
    case 17:
    case 18:
    case 19:
    case 20:
      liveContentOverlayCoordinator = self->_liveContentOverlayCoordinator;
      -[SBSwitcherLiveContentOverlayCoordinating performSwitcherKeyboardShortcutAction:](liveContentOverlayCoordinator, "performSwitcherKeyboardShortcutAction:");
      break;
    case 15:
    case 16:
      BOOL v5 = a3 == 15;
      uint64_t v6 = 0;
LABEL_7:
      [(SBFluidSwitcherViewController *)self _navigateFromFocusedAppWindowSceneToNextSceneInForwardDirection:v5 matchFocusedApp:v6];
      break;
    default:
      return;
  }
}

void __63__SBFluidSwitcherViewController_performKeyboardShortcutAction___block_invoke(void *a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 bundleIdentifier];
  int v4 = [v3 isEqualToString:a1[4]];

  if (v4)
  {
    BOOL v5 = [*(id *)(a1[5] + 1896) objectForKey:v6];
    [v5 performKeyboardShortcutAction:a1[7]];

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void __63__SBFluidSwitcherViewController_performKeyboardShortcutAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:51];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__SBFluidSwitcherViewController_performKeyboardShortcutAction___block_invoke_3;
  v4[3] = &unk_1E6AF57C0;
  id v5 = *(id *)(a1 + 32);
  [v3 modifyApplicationContext:v4];
}

void __63__SBFluidSwitcherViewController_performKeyboardShortcutAction___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setRequestedAppExposeBundleID:v2];
  [v3 setRequestedUnlockedEnvironmentMode:3];
}

- (id)_keyboardFocusableLiveAppLayoutsMatchingFocusedApp:(BOOL)a3 foundAtIndex:(int64_t *)a4
{
  BOOL v5 = a3;
  BOOL v7 = [(SBFluidSwitcherViewController *)self isChamoisWindowingUIEnabled];
  int v8 = [(SBSwitcherLiveContentOverlayCoordinating *)self->_liveContentOverlayCoordinator appLayoutForKeyboardFocusedScene];
  id v9 = [(SBSwitcherModifier *)self->_rootModifier activeLeafAppLayoutsReachableByKeyboardShortcut];
  uint64_t v10 = v9;
  if (!v7)
  {
    BOOL v12 = [(SBSwitcherModifier *)self->_rootModifier appLayoutsToResignActive];
    id v11 = [v12 allValues];
LABEL_7:

    goto LABEL_8;
  }
  id v11 = 0;
  if (v5 && !v8)
  {
    if (![v9 count])
    {
      id v11 = 0;
      int v8 = 0;
      goto LABEL_8;
    }
    BOOL v12 = [(SBFluidSwitcherViewController *)self layoutContext];
    id v13 = [v12 layoutState];
    int v14 = [v13 appLayout];
    uint64_t v15 = [v14 zOrderedLeafAppLayouts];
    int v8 = [v15 firstObject];

    id v11 = 0;
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v16 = [v8 allItems];
  uint64_t v17 = [v16 firstObject];
  unint64_t v18 = [v17 bundleIdentifier];

  LOBYTE(v16) = objc_msgSend(v10, "bs_containsObjectPassingTest:", &__block_literal_global_410);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __97__SBFluidSwitcherViewController__keyboardFocusableLiveAppLayoutsMatchingFocusedApp_foundAtIndex___block_invoke_2;
  v23[3] = &unk_1E6AF9FD8;
  BOOL v26 = v5;
  id v24 = v18;
  id v19 = v11;
  id v25 = v19;
  char v27 = (char)v16;
  id v20 = v18;
  int v21 = objc_msgSend(v10, "bs_compactMap:", v23);

  if (a4 && v8) {
    *a4 = [v21 indexOfObject:v8];
  }

  return v21;
}

BOOL __97__SBFluidSwitcherViewController__keyboardFocusableLiveAppLayoutsMatchingFocusedApp_foundAtIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 environment] == 3;
}

id __97__SBFluidSwitcherViewController__keyboardFocusableLiveAppLayoutsMatchingFocusedApp_foundAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v5 = [v3 allItems];
    id v6 = [v5 firstObject];
    BOOL v7 = [v6 bundleIdentifier];
    int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

    if (!v8) {
      goto LABEL_7;
    }
  }
  id v9 = *(void **)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__SBFluidSwitcherViewController__keyboardFocusableLiveAppLayoutsMatchingFocusedApp_foundAtIndex___block_invoke_3;
  v13[3] = &unk_1E6AF9FB0;
  id v10 = v4;
  id v14 = v10;
  LOBYTE(v9) = objc_msgSend(v9, "bs_containsObjectPassingTest:", v13);

  if ((v9 & 1) != 0
    || *(unsigned char *)(a1 + 49) && ([v10 environment] & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
LABEL_7:
    id v11 = 0;
  }
  else
  {
    id v11 = v10;
  }

  return v11;
}

uint64_t __97__SBFluidSwitcherViewController__keyboardFocusableLiveAppLayoutsMatchingFocusedApp_foundAtIndex___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 containsObject:*(void *)(a1 + 32)];
}

- (void)_navigateFromFocusedAppWindowSceneToNextSceneInForwardDirection:(BOOL)a3 matchFocusedApp:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
  BOOL v7 = [(SBFluidSwitcherViewController *)self _keyboardFocusableLiveAppLayoutsMatchingFocusedApp:a4 foundAtIndex:&v30];
  int v8 = 0;
  if ([(SBFluidSwitcherViewController *)self isChamoisWindowingUIEnabled] && v4)
  {
    uint64_t v9 = v30;
    if (v30 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = 0;
      uint64_t v30 = 0;
    }
    id v10 = [v7 objectAtIndex:v9];
    id v11 = [v10 allItems];
    BOOL v12 = [v11 firstObject];
    id v13 = [v12 bundleIdentifier];

    id v14 = [(SBSwitcherModifier *)self->_rootModifier inactiveAppLayoutsReachableByKeyboardShortcut];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    char v27 = __113__SBFluidSwitcherViewController__navigateFromFocusedAppWindowSceneToNextSceneInForwardDirection_matchFocusedApp___block_invoke;
    uint64_t v28 = &unk_1E6AF4B60;
    id v29 = v13;
    id v15 = v13;
    int v8 = objc_msgSend(v14, "bs_filter:", &v25);
  }
  uint64_t v16 = v30;
  if (v30 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5)
    {
      if (v16 == [v7 count] - 1)
      {
        char v17 = 0;
        goto LABEL_14;
      }
      uint64_t v16 = v30;
    }
    if (v16) {
      char v17 = 1;
    }
    else {
      char v17 = v5;
    }
LABEL_14:
    if (!objc_msgSend(v8, "count", v25, v26, v27, v28) || (v17 & 1) != 0)
    {
      if ((unint64_t)[v7 count] >= 2)
      {
        if (v5)
        {
          unint64_t v18 = v30 + 1;
          unint64_t v19 = v18 % [v7 count];
        }
        else if (v30 <= 0)
        {
          unint64_t v19 = [v7 count] - 1;
        }
        else
        {
          unint64_t v19 = v30 - 1;
        }
        id v20 = [v7 objectAtIndex:v19];
        int v21 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v20];
        id v22 = [v20 itemForLayoutRole:1];
        uint64_t v23 = [v21 layoutRoleForItem:v22];

        id v24 = [[SBTapAppLayoutSwitcherModifierEvent alloc] initWithAppLayout:v21 layoutRole:v23 modifierFlags:0 source:1];
        [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v24];
      }
    }
    else
    {
      [(SBFluidSwitcherViewController *)self _navigateFromFocusedAppWindowSceneToNextSceneFromStripInForwardDirection:v5 withReachableAppLayouts:v8];
    }
  }
}

uint64_t __113__SBFluidSwitcherViewController__navigateFromFocusedAppWindowSceneToNextSceneInForwardDirection_matchFocusedApp___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItemWithBundleIdentifier:*(void *)(a1 + 32)];
}

- (void)_navigateFromFocusedAppWindowSceneToNextSceneFromStripInForwardDirection:(BOOL)a3 withReachableAppLayouts:(id)a4
{
  id v6 = (void *)[a4 mutableCopy];
  BOOL v7 = [(SBFluidSwitcherLayoutContext *)self->_layoutContext layoutState];
  int v8 = [v7 appLayout];

  uint64_t v9 = [v8 continuousExposeIdentifier];
  id v10 = self->_continuousExposeIdentifiersInSwitcher;
  id v11 = [(SBFluidSwitcherViewController *)self appLayoutsForContinuousExposeIdentifier:v9];
  uint64_t v12 = [v11 indexOfObject:v8];
  uint64_t v13 = [(NSArray *)v10 indexOfObject:v9];
  uint64_t v26 = v10;
  char v27 = (void *)v9;
  BOOL v25 = a3;
  if (v13)
  {
    id v14 = [(NSArray *)v10 objectAtIndex:v13 - 1];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __130__SBFluidSwitcherViewController__navigateFromFocusedAppWindowSceneToNextSceneFromStripInForwardDirection_withReachableAppLayouts___block_invoke;
    v28[3] = &unk_1E6AFA000;
    id v29 = v14;
    id v15 = v14;
    uint64_t v16 = [v6 indexOfObjectWithOptions:2 passingTest:v28];
    if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = v16 + 1;
    }

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if (!v12) {
      goto LABEL_12;
    }
  }
  for (uint64_t i = 0; i != v12; ++i)
  {
    if (v17 < (unint64_t)[v6 count])
    {
      unint64_t v19 = [v6 objectAtIndex:v17];
      id v20 = [v11 objectAtIndex:i];
      unsigned int v21 = [v19 isEqual:v20];

      v17 += v21;
    }
  }
LABEL_12:
  [v6 insertObject:v8 atIndex:v17];
  if (v25)
  {
    unint64_t v22 = (v17 + 1) % (unint64_t)[v6 count];
  }
  else if (v17 <= 0)
  {
    unint64_t v22 = [v6 count] - 1;
  }
  else
  {
    unint64_t v22 = v17 - 1;
  }
  uint64_t v23 = [v6 objectAtIndex:v22];
  id v24 = [[SBTapAppLayoutSwitcherModifierEvent alloc] initWithAppLayout:v23 layoutRole:1 modifierFlags:0 source:1];
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v24];
}

uint64_t __130__SBFluidSwitcherViewController__navigateFromFocusedAppWindowSceneToNextSceneFromStripInForwardDirection_withReachableAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 continuousExposeIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_toggleFloatingAppVisibility
{
  id v3 = [(SBFluidSwitcherViewController *)self layoutContext];
  id v12 = [v3 layoutState];

  uint64_t v4 = [v12 floatingConfiguration];
  BOOL v5 = [v12 elementWithRole:3];

  if (!v5)
  {
    id v10 = [(SBFluidSwitcherViewController *)self appLayouts];
    id v11 = objc_msgSend(v10, "bs_firstObjectPassingTest:", &__block_literal_global_415);

    if (v11)
    {
      int v8 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      [(SBSwitcherTransitionRequest *)v8 setAppLayout:v11];
      [(SBSwitcherTransitionRequest *)v8 setAppLayoutEnvironment:2];
    }
    else
    {
      int v8 = 0;
    }

    if (!v8) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v6 = 4;
  if (v4 != 2) {
    uint64_t v6 = v4;
  }
  if (v4 == 1) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = v6;
  }
  int v8 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
  [(SBSwitcherTransitionRequest *)v8 setFloatingConfiguration:v7];
  if (v8)
  {
LABEL_8:
    uint64_t v9 = [(SBFluidSwitcherViewController *)self delegate];
    [v9 switcherContentController:self performTransitionWithRequest:v8 gestureInitiated:0];
  }
LABEL_9:
}

BOOL __61__SBFluidSwitcherViewController__toggleFloatingAppVisibility__block_invoke(uint64_t a1, void *a2)
{
  return [a2 environment] == 2;
}

- (void)invalidate
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  [(SBFluidSwitcherViewController *)self _cancelInProcessAnimationsWithOptions:3];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v3 = [(NSMutableDictionary *)self->_externalDropletZoomUpTokens allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v44 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v43 + 1) + 8 * i) invalidate];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_externalDropletZoomUpTokens removeAllObjects];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  int v8 = [(NSMutableDictionary *)self->_hiddenIconViews allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        [v13 setIconContentHidden:0];
        id v14 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
        [v14 stopTrackingHiddenIconZoomViewIfNeeded:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v10);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v15 = [(NSMutableDictionary *)self->_hiddenIconViewContainers allValues];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v35 + 1) + 8 * k);
        unsigned int v21 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
        [v21 stopTrackingHiddenIconZoomViewIfNeeded:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v17);
  }

  [(NSMutableDictionary *)self->_hiddenIconViews removeAllObjects];
  [(NSMutableDictionary *)self->_hiddenIconViewContainers removeAllObjects];
  [(SBFluidSwitcherViewController *)self _removeSearchPresenterObservation];
  unint64_t v22 = +[SBAppInteractionEventSourceManager sharedInstance];
  [v22 removeObserver:self];

  uint64_t v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v23 removeObserver:self];

  [(SBFluidSwitcherPageContentViewProvider *)self->_pageContentViewProvider setDelegate:0];
  [(BSUIScrollView *)self->_scrollView setDelegate:0];
  id v24 = [(SBFluidSwitcherViewController *)self _iconManager];
  BOOL v25 = [v24 searchGesture];
  [v25 removeObserver:self];

  [(SBAppSwitcherSnapshotImageCache *)self->_snapshotCache setDelegate:0];
  snapshotCache = self->_snapshotCache;
  self->_snapshotCache = 0;

  [(SBSwitcherLiveContentOverlayCoordinating *)self->_liveContentOverlayCoordinator invalidate];
  liveContentOverlayCoordinator = self->_liveContentOverlayCoordinator;
  self->_liveContentOverlayCoordinator = 0;

  [(BSInvalidatable *)self->_stateCaptureInvalidatable invalidate];
  stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
  self->_stateCaptureInvalidatable = 0;

  [(BSDefaultObserver *)self->_chamoisDefaultsObserver invalidate];
  chamoisDefaultsObserver = self->_chamoisDefaultsObserver;
  self->_chamoisDefaultsObserver = 0;

  [(BSInvalidatable *)self->_wallpaperRequireAssertion invalidate];
  wallpaperRequireAssertiouint64_t n = self->_wallpaperRequireAssertion;
  self->_wallpaperRequireAssertiouint64_t n = 0;

  [(BSInvalidatable *)self->_bezelEffectsPortalObserverToken invalidate];
  bezelEffectsPortalObserverTokeuint64_t n = self->_bezelEffectsPortalObserverToken;
  self->_bezelEffectsPortalObserverTokeuint64_t n = 0;

  uint64_t v32 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  long long v33 = [v32 systemPointerInteractionManager];
  [v33 removeObserver:self];

  char v34 = [v32 assistantController];
  [v34 removeObserver:self];

  self->_isInvalidated = 1;
}

- (void)removeLiveContentOverlayForAppLayout:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  settings = self->_settings;
  id v7 = a3;
  uint64_t v8 = v4 & ~[(SBAppSwitcherSettings *)settings shouldRedactWindowContents];
  uint64_t v9 = [(SBFluidSwitcherViewController *)self visibleItemContainers];
  id v12 = [v9 objectForKey:v7];

  [v12 setContentOverlay:0 animated:v8];
  uint64_t v10 = [v7 itemForLayoutRole:1];
  uint64_t v11 = [v10 uniqueIdentifier];

  [(SBFluidSwitcherViewController *)self _removeCenterWindowAnimationContextWithKey:v11];
  [(NSMutableDictionary *)self->_liveContentOverlays removeObjectForKey:v7];
}

- (void)moveExistingLiveContentOverlay:(id)a3 forAppLayout:(id)a4 toAppLayout:(id)a5
{
  id v22 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(NSMutableDictionary *)self->_liveContentOverlays objectForKey:v10];
  if (v11)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = NSStringFromClass(v17);
    [v16 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 2750, @"The appLayout %@ already has an overlay <%@:%p>", v10, v18, v11 object file lineNumber description];
  }
  id v12 = [(NSMutableDictionary *)self->_liveContentOverlays objectForKey:v9];

  if (v12 != v22)
  {
    unint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v20 = (objc_class *)objc_opt_class();
    unsigned int v21 = NSStringFromClass(v20);
    [v19 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 2751, @"Asked to move an existing overlay <%@:%p> for %@ that doesn't match / exist.", v21, v22, v9 object file lineNumber description];
  }
  [(NSMutableDictionary *)self->_liveContentOverlays removeObjectForKey:v9];
  [(NSMutableDictionary *)self->_liveContentOverlays setObject:v22 forKey:v10];
  uint64_t v13 = [(SBFluidSwitcherViewController *)self visibleItemContainers];
  id v14 = [v13 objectForKey:v10];

  if (v14)
  {
    id v15 = [v22 contentOverlayView];
    [v14 setContentOverlay:v15 animated:0];

    [(SBFluidSwitcherViewController *)self _setupLiveContentOverlayForAppLayout:v10 itemContainer:v14 overlay:v22];
  }
}

- (BOOL)areLiveContentOverlayUpdatesSuspended
{
  return [(SBSwitcherLiveContentOverlayCoordinating *)self->_liveContentOverlayCoordinator areLiveContentOverlayUpdatesSuspended];
}

- (void)setLiveContentOverlayUpdatesSuspended:(BOOL)a3
{
}

- (void)liveContentOverlayDidUpdateHomeAffordanceSupportedOrientations:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBFluidSwitcherViewController *)self view];
  [v5 setNeedsLayout];

  id v22 = v4;
  [(NSMutableDictionary *)self->_liveContentOverlays allKeysForObject:v4];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    id v9 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
    id v10 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
    uint64_t v23 = self;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        id v12 = [*(id *)((char *)&self->super.super.super.isa + v9[96]) objectForKey:*(void *)(*((void *)&v25 + 1) + 8 * v11)];
        uint64_t v13 = [*(id *)((char *)&self->super.super.super.isa + v10[24]) objectForKey:v12];
        id v14 = [v13 homeGrabberView];
        if (v14)
        {
          int64_t v15 = [(SBFluidSwitcherViewController *)self _bestSupportedHomeAffordanceOrientationForOrientation:self->_contentOrientation inAppLayout:v12];
          uint64_t v16 = [v14 orientation];
          if (v16 != v15)
          {
            +[SBAnimationUtilities animationSettingsForRotationFromInterfaceOrientation:v16 toInterfaceOrientation:v15];
            uint64_t v17 = v7;
            uint64_t v18 = v8;
            unint64_t v19 = v10;
            v21 = uint64_t v20 = v9;
            [v14 setOrientation:v15 animated:1 rotationSettings:v21];

            id v9 = v20;
            id v10 = v19;
            uint64_t v8 = v18;
            uint64_t v7 = v17;
            self = v23;
            [v13 setNeedsLayout];
          }
        }

        ++v11;
      }
      while (v7 != v11);
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }
}

- (id)liveOverlayForSceneIdentityToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_liveContentOverlays allValues];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__SBFluidSwitcherViewController_liveOverlayForSceneIdentityToken___block_invoke;
  void v9[3] = &unk_1E6AFA028;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __66__SBFluidSwitcherViewController_liveOverlayForSceneIdentityToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 overlaySceneHandle];
  id v3 = [v2 sceneIfExists];
  id v4 = [v3 identityToken];
  uint64_t v5 = BSEqualObjects();

  return v5;
}

- (id)liveOverlayForSceneIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_liveContentOverlays allValues];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__SBFluidSwitcherViewController_liveOverlayForSceneIdentifier___block_invoke;
  void v9[3] = &unk_1E6AFA028;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __63__SBFluidSwitcherViewController_liveOverlayForSceneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 overlaySceneHandle];
  id v3 = [v2 sceneIdentifier];
  uint64_t v4 = BSEqualObjects();

  return v4;
}

- (UIScrollView)switcherScrollView
{
  return (UIScrollView *)self->_scrollView;
}

- (id)defaultFocusItem
{
  id v3 = [(SBFluidSwitcherViewController *)self layoutContext];
  uint64_t v4 = [v3 activeTransitionContext];
  uint64_t v5 = [(SBFluidSwitcherViewController *)self layoutContext];
  id v6 = v5;
  if (v4) {
    [v5 transitioningToLayoutState];
  }
  else {
  uint64_t v7 = [v5 layoutState];
  }

  uint64_t v8 = [v7 elementWithRole:1];

  if (v8)
  {
    visibleItemContainers = self->_visibleItemContainers;
    id v10 = [v7 appLayout];
    uint64_t v11 = [v10 leafAppLayoutForRole:1];
    id v12 = [(NSMutableDictionary *)visibleItemContainers objectForKey:v11];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)handleHomeButtonPress
{
  uint64_t v2 = [(SBFluidSwitcherViewController *)self _liveContentOverlayForHandlingHardwareButtonEvents];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 handleHomeButtonPress];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)handleHomeButtonDoublePress
{
  uint64_t v2 = [(SBFluidSwitcherViewController *)self _liveContentOverlayForHandlingHardwareButtonEvents];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 handleHomeButtonDoublePress];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)handleHomeButtonLongPress
{
  uint64_t v2 = [(SBFluidSwitcherViewController *)self _liveContentOverlayForHandlingHardwareButtonEvents];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 handleHomeButtonLongPress];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)handleLockButtonPress
{
  uint64_t v2 = [(SBFluidSwitcherViewController *)self _liveContentOverlayForHandlingHardwareButtonEvents];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 handleLockButtonPress];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)handleVoiceCommandButtonPress
{
  uint64_t v2 = [(SBFluidSwitcherViewController *)self _liveContentOverlayForHandlingHardwareButtonEvents];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 handleVoiceCommandButtonPress];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)handleVolumeUpButtonPress
{
  uint64_t v2 = [(SBFluidSwitcherViewController *)self _liveContentOverlayForHandlingHardwareButtonEvents];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 handleVolumeUpButtonPress];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)handleVolumeDownButtonPress
{
  uint64_t v2 = [(SBFluidSwitcherViewController *)self _liveContentOverlayForHandlingHardwareButtonEvents];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 handleVolumeDownButtonPress];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(SBFluidSwitcherViewController *)self _liveContentOverlayForHandlingHardwareButtonEvents];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 handleHeadsetButtonPress:v3];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)_liveContentOverlayForHandlingHardwareButtonEvents
{
  BOOL v3 = [(SBSwitcherModifier *)self->_rootModifier appLayoutForReceivingHardwareButtonEvents];
  uint64_t v4 = v3;
  if (v3)
  {
    liveContentOverlays = self->_liveContentOverlays;
    id v6 = [v3 anyLeafAppLayout];
    uint64_t v7 = [(NSMutableDictionary *)liveContentOverlays objectForKey:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_updateForegroundAppLayoutsWithNewLayoutState:(id)a3
{
  id v4 = a3;
  id v8 = [v4 appLayout];
  char v5 = [v4 floatingAppLayout];

  id v6 = objc_opt_new();
  if (v8) {
    [v6 addObject:v8];
  }
  if (v5) {
    [v6 addObject:v5];
  }
  uint64_t v7 = [[SBPrepareForSceneUpdateSwitcherModifierEvent alloc] initWithLiveAppLayouts:v6];
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v7];
}

- (void)_updateLayoutFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
  [(SBSwitcherLiveContentOverlayCoordinating *)self->_liveContentOverlayCoordinator setContainerOrientation:a4];
  if (([(SBSwitcherModifier *)self->_rootModifier shouldPerformRotationAnimationForOrientationChange] & 1) == 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __94__SBFluidSwitcherViewController__updateLayoutFromInterfaceOrientation_toInterfaceOrientation___block_invoke;
    v7[3] = &unk_1E6AF4AC0;
    void v7[4] = self;
    [(SBFluidSwitcherViewController *)self _performWithFixedUpdateMode:2 usingBlock:v7];
  }
  [(SBFluidSwitcherViewController *)self _rotateHomeAffordancesFromInterfaceOrientation:a3 toInterfaceOrientation:a4];
}

uint64_t __94__SBFluidSwitcherViewController__updateLayoutFromInterfaceOrientation_toInterfaceOrientation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVisibleItemsAccessoryViewsLayoutAndStyleWithCompletion:0];
}

- (BOOL)canInterruptActiveTransition
{
  return [(SBSwitcherModifier *)self->_rootModifier shouldPerformRotationAnimationForOrientationChange] ^ 1;
}

void __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  BOOL v3 = *(unsigned char **)(a1 + 32);
  id v4 = v2;
  if ((v3[977] & 0x20) != 0)
  {
    objc_msgSend(v2, "switcherContentController:setInterfaceOrientation:");
    BOOL v3 = *(unsigned char **)(a1 + 32);
  }
  [v3 _updateVisibleItemsAccessoryViewsLayoutAndStyleWithCompletion:0];
}

uint64_t __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _updateVisibleItemsAccessoryViewsLayoutAndStyleWithCompletion:v2];
}

uint64_t __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

void __82__SBFluidSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained[142] == *(void *)(a1 + 32))
  {
    BOOL v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

- (void)_performContentViewScaleAnimationForDosido
{
  BOOL v3 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
  id v4 = [v3 dosidoScaleDownSettings];
  char v5 = [v3 dosidoScaleUpSettings];
  [v3 dosidoScale];
  double v7 = v6;
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeScale(&v31, v6, v6);
  memset(&v30, 0, sizeof(v30));
  CGAffineTransformMakeScale(&v30, 1.0 / v7, 1.0 / v7);
  [v3 dosidoScaleUpDelay];
  double v9 = v8;
  id v10 = (void *)MEMORY[0x1E4F42FF0];
  [v4 settlingDuration];
  double v12 = v11;
  [v4 dampingRatio];
  double v14 = v13;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __75__SBFluidSwitcherViewController__performContentViewScaleAnimationForDosido__block_invoke;
  id v25[3] = &unk_1E6AFA168;
  id v26 = v4;
  long long v27 = self;
  CGAffineTransform v28 = v31;
  CGAffineTransform v29 = v30;
  id v15 = v4;
  [v10 animateWithDuration:0 delay:v25 usingSpringWithDamping:0 initialSpringVelocity:v12 options:0.0 animations:v14 completion:0.0];
  uint64_t v16 = (void *)MEMORY[0x1E4F42FF0];
  [v5 settlingDuration];
  double v18 = v17;
  [v5 dampingRatio];
  double v20 = v19;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__SBFluidSwitcherViewController__performContentViewScaleAnimationForDosido__block_invoke_3;
  v22[3] = &unk_1E6AF5290;
  id v23 = v5;
  id v24 = self;
  id v21 = v5;
  [v16 animateWithDuration:0 delay:v22 usingSpringWithDamping:0 initialSpringVelocity:v18 options:v9 animations:v20 completion:0.0];
}

void __75__SBFluidSwitcherViewController__performContentViewScaleAnimationForDosido__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) preferredFrameRateRange];
  BOOL v3 = (void *)MEMORY[0x1E4F42FF0];
  [v2 frameRateRange];
  unsigned int v5 = v4;
  int v7 = v6;
  int v9 = v8;
  uint64_t v10 = [v2 highFrameRateReason];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 64);
  long long v16 = *(_OWORD *)(a1 + 48);
  long long v17 = v11;
  long long v12 = *(_OWORD *)(a1 + 96);
  long long v18 = *(_OWORD *)(a1 + 80);
  long long v19 = v12;
  long long v13 = *(_OWORD *)(a1 + 128);
  long long v20 = *(_OWORD *)(a1 + 112);
  long long v21 = v13;
  v15[2] = __75__SBFluidSwitcherViewController__performContentViewScaleAnimationForDosido__block_invoke_2;
  v15[3] = &unk_1E6AFA140;
  void v15[4] = *(void *)(a1 + 40);
  LODWORD(v13) = v7;
  LODWORD(v14) = v9;
  objc_msgSend(v3, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", v10, v15, COERCE_DOUBLE(__PAIR64__(DWORD1(v20), v5)), *(double *)&v13, v14);
}

uint64_t __75__SBFluidSwitcherViewController__performContentViewScaleAnimationForDosido__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 1816);
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 40);
  long long v8 = v3;
  long long v9 = *(_OWORD *)(a1 + 72);
  [v2 setTransform:&v7];
  unsigned int v4 = *(void **)(*(void *)(a1 + 32) + 1408);
  long long v5 = *(_OWORD *)(a1 + 104);
  long long v7 = *(_OWORD *)(a1 + 88);
  long long v8 = v5;
  long long v9 = *(_OWORD *)(a1 + 120);
  return [v4 setTransform:&v7];
}

void __75__SBFluidSwitcherViewController__performContentViewScaleAnimationForDosido__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) preferredFrameRateRange];
  long long v3 = (void *)MEMORY[0x1E4F42FF0];
  [v2 frameRateRange];
  int v5 = v4;
  int v7 = v6;
  int v9 = v8;
  uint64_t v10 = [v2 highFrameRateReason];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__SBFluidSwitcherViewController__performContentViewScaleAnimationForDosido__block_invoke_4;
  v13[3] = &unk_1E6AF4AC0;
  void v13[4] = *(void *)(a1 + 40);
  LODWORD(v11) = v7;
  LODWORD(v12) = v9;
  objc_msgSend(v3, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", v10, v13, COERCE_DOUBLE((unint64_t)v5), v11, v12);
}

uint64_t __75__SBFluidSwitcherViewController__performContentViewScaleAnimationForDosido__block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 1816);
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v8 = *MEMORY[0x1E4F1DAB8];
  long long v6 = v8;
  long long v9 = v7;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v5 = v10;
  [v2 setTransform:&v8];
  long long v3 = *(void **)(*(void *)(a1 + 32) + 1408);
  long long v8 = v6;
  long long v9 = v7;
  long long v10 = v5;
  return [v3 setTransform:&v8];
}

- (void)_blurItemContainer:(id)a3 blurParameters:(id)a4 withAnimationUpdateMode:(int64_t)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!UIAccessibilityIsReduceTransparencyEnabled())
  {
    long long v9 = [v7 layer];
    long long v10 = [v9 filters];
    uint64_t v11 = [v10 count];

    if (!v11)
    {
      double v12 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
      [v12 setName:@"gaussianBlur"];
      long long v13 = SBStringForBlurItemContainerQuality([v8 inputIntermediateBitDepth]);
      [v12 setValue:v13 forKey:@"inputIntermediateBitDepth"];

      double v14 = SBStringForBlurItemContainerQuality([v8 inputQuality]);
      [v12 setValue:v14 forKey:@"inputQuality"];

      [v12 setValue:&unk_1F3348AD8 forKey:@"inputRadius"];
      id v15 = [v7 layer];
      v24[0] = v12;
      long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      [v15 setFilters:v16];
    }
    if ([v8 shouldRasterize])
    {
      long long v17 = [v7 layer];
      [v8 rasterizationScale];
      objc_msgSend(v17, "setRasterizationScale:");

      long long v18 = [v7 layer];
      [v18 setShouldRasterize:1];
    }
    long long v19 = (void *)MEMORY[0x1E4F42FF0];
    long long v20 = [v8 blurAnimationSettings];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __91__SBFluidSwitcherViewController__blurItemContainer_blurParameters_withAnimationUpdateMode___block_invoke;
    v21[3] = &unk_1E6AF5290;
    id v22 = v7;
    id v23 = v8;
    objc_msgSend(v19, "sb_animateWithSettings:mode:animations:completion:", v20, a5, v21, 0);
  }
}

void __91__SBFluidSwitcherViewController__blurItemContainer_blurParameters_withAnimationUpdateMode___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) layer];
  id v2 = NSNumber;
  [*(id *)(a1 + 40) blurRadius];
  long long v3 = objc_msgSend(v2, "numberWithDouble:");
  [v4 setValue:v3 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (BOOL)_isPerformingMatchMoveToIconView
{
  id v2 = [(SBFluidSwitcherViewController *)self view];
  long long v3 = [v2 layer];
  id v4 = [v3 animationKeys];
  char v5 = [v4 containsObject:@"MatchMoveToIconViewAnimation"];

  return v5;
}

- (void)_temporarilyHideMatchMovedZoomDownAnimationViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([(SBFluidSwitcherViewController *)self _isPerformingMatchMoveToIconView])
  {
    if (v3) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 2;
    }
    long long v6 = (void *)MEMORY[0x1E4F42FF0];
    id v7 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
    id v8 = [v7 switcherFadeOutSettings];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    void v34[2] = __89__SBFluidSwitcherViewController__temporarilyHideMatchMovedZoomDownAnimationViewAnimated___block_invoke;
    v34[3] = &unk_1E6AF4AC0;
    v34[4] = self;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    void v33[2] = __89__SBFluidSwitcherViewController__temporarilyHideMatchMovedZoomDownAnimationViewAnimated___block_invoke_2;
    v33[3] = &unk_1E6AFA1B8;
    v33[4] = self;
    objc_msgSend(v6, "sb_animateWithSettings:mode:animations:completion:", v8, v5, v34, v33);

    long long v9 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
    long long v10 = [v9 iconFadeInSettings];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v11 = [(NSMutableDictionary *)self->_hiddenIconViews allValues];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __89__SBFluidSwitcherViewController__temporarilyHideMatchMovedZoomDownAnimationViewAnimated___block_invoke_3;
          v28[3] = &unk_1E6AF5290;
          void v28[4] = v16;
          void v28[5] = self;
          objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", v10, v5, v28, 0);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v36 count:16];
      }
      while (v13);
    }

    [(NSMutableDictionary *)self->_hiddenIconViews removeAllObjects];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v17 = [(NSMutableDictionary *)self->_hiddenIconViewContainers allValues];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v35 count:16];
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
          id v23 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
          [v23 stopTrackingHiddenIconZoomViewIfNeeded:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v35 count:16];
      }
      while (v19);
    }

    [(NSMutableDictionary *)self->_hiddenIconViewContainers removeAllObjects];
  }
}

void __89__SBFluidSwitcherViewController__temporarilyHideMatchMovedZoomDownAnimationViewAnimated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

void __89__SBFluidSwitcherViewController__temporarilyHideMatchMovedZoomDownAnimationViewAnimated___block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((a3 & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    BOOL v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1840), "allValues", 0);
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
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) removeIconOverlay];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

void __89__SBFluidSwitcherViewController__temporarilyHideMatchMovedZoomDownAnimationViewAnimated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setIconContentHidden:0];
  id v2 = [*(id *)(a1 + 40) _iconZoomContextProvider];
  [v2 stopTrackingHiddenIconZoomViewIfNeeded:*(void *)(a1 + 32)];
}

- (void)_folderExpansionAnimationWillBegin:(id)a3
{
}

- (void)_containerScrolledEnoughToClipSwitcherIconView:(id)a3
{
}

- (void)_iconControllerOverlayVisibilityDidChange:(id)a3
{
}

- (void)_setUpSearchPresenterObservation
{
  id v3 = [(SBFluidSwitcherViewController *)self _searchPresenter];
  [v3 addSearchPresenterObserver:self];
}

- (void)_removeSearchPresenterObservation
{
  id v3 = [(SBFluidSwitcherViewController *)self _searchPresenter];
  [v3 removeSearchPresenterObserver:self];
}

- (void)searchPresenterWillPresentSearch:(id)a3 animated:(BOOL)a4
{
}

- (void)searchGesture:(id)a3 startedShowing:(BOOL)a4
{
  if (a4) {
    [(SBFluidSwitcherViewController *)self _temporarilyHideMatchMovedZoomDownAnimationViewAnimated:0];
  }
}

- (void)animatorWasCanceled:(id)a3
{
  if (![a3 direction])
  {
    uint64_t v4 = objc_alloc_init(SBMorphToPIPChangedSwitcherModifierEvent);
    [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v4];
  }
}

- (void)hideSourceViewForAnimator:(id)a3
{
  p_pipViewMorphAnimator = &self->_pipViewMorphAnimator;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pipViewMorphAnimator);

  if (WeakRetained == v5)
  {
    uint64_t v7 = objc_alloc_init(SBMorphToPIPChangedSwitcherModifierEvent);
    [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v7];
  }
}

- (BOOL)shouldAnimateInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(SBFluidSwitcherViewController *)self appLayouts];
  uint64_t v9 = [v8 count];

  if (v9) {
    unint64_t v10 = v9 - 1;
  }
  else {
    unint64_t v10 = 0;
  }
  if ([v6 count])
  {
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = [v6 objectAtIndex:v11];
      uint64_t v13 = [v7 objectAtIndex:v11];
      unint64_t v14 = [v13 unsignedIntegerValue];

      if (v10 >= v14) {
        unint64_t v15 = v14;
      }
      else {
        unint64_t v15 = v10;
      }
      int v16 = [(SBSwitcherModifier *)self->_rootModifier shouldAnimateInsertionOrRemovalOfAppLayout:v12 atIndex:v15];

      if (v16) {
        break;
      }
      ++v11;
    }
    while (v11 < [v6 count]);
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (void)prepareAnimatedInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__SBFluidSwitcherViewController_prepareAnimatedInsertionOfAppLayouts_atIndexes___block_invoke;
  v8[3] = &unk_1E6AFA1E0;
  id v9 = v6;
  unint64_t v10 = self;
  id v7 = v6;
  [a3 enumerateObjectsUsingBlock:v8];
}

void __80__SBFluidSwitcherViewController_prepareAnimatedInsertionOfAppLayouts_atIndexes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectAtIndex:a3];
  uint64_t v8 = [v7 unsignedIntegerValue];

  id v9 = [[SBInsertionSwitcherModifierEvent alloc] initWithAppLayout:v6 intoIndex:v8 phase:1];
  [*(id *)(a1 + 40) _dispatchEventAndHandleAction:v9];
}

- (void)noteModelDidMutateForInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4 willAnimate:(BOOL)a5
{
  id v8 = a4;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __98__SBFluidSwitcherViewController_noteModelDidMutateForInsertionOfAppLayouts_atIndexes_willAnimate___block_invoke;
  uint64_t v13 = &unk_1E6AFA1E0;
  id v9 = v8;
  id v14 = v9;
  unint64_t v15 = self;
  [a3 enumerateObjectsUsingBlock:&v10];
  if (!a5)
  {
    [(SBFluidSwitcherViewController *)self _updateVisibleItems];
    [(SBFluidSwitcherViewController *)self _updateVisibleAccessoryViews];
  }
}

void __98__SBFluidSwitcherViewController_noteModelDidMutateForInsertionOfAppLayouts_atIndexes_willAnimate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectAtIndex:a3];
  uint64_t v8 = [v7 unsignedIntegerValue];

  id v9 = [[SBInsertionSwitcherModifierEvent alloc] initWithAppLayout:v6 intoIndex:v8 phase:2];
  [*(id *)(a1 + 40) _dispatchEventAndHandleAction:v9];
}

- (void)performAnimatedInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(SBFluidSwitcherViewController *)self _updateVisibleItems];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__SBFluidSwitcherViewController_performAnimatedInsertionOfAppLayouts_atIndexes_completion___block_invoke;
  v20[3] = &unk_1E6AFA1E0;
  id v11 = v9;
  id v21 = v11;
  uint64_t v22 = self;
  [v8 enumerateObjectsUsingBlock:v20];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__SBFluidSwitcherViewController_performAnimatedInsertionOfAppLayouts_atIndexes_completion___block_invoke_2;
  v15[3] = &unk_1E6AFA208;
  id v16 = v8;
  id v17 = v11;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v11;
  id v14 = v8;
  [(SBFluidSwitcherViewController *)self _updateVisibleItemsAccessoryViewsLayoutAndStyleWithCompletion:v15];
}

void __91__SBFluidSwitcherViewController_performAnimatedInsertionOfAppLayouts_atIndexes_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectAtIndex:a3];
  uint64_t v8 = [v7 unsignedIntegerValue];

  id v9 = [[SBInsertionSwitcherModifierEvent alloc] initWithAppLayout:v6 intoIndex:v8 phase:3];
  [*(id *)(a1 + 40) _dispatchEventAndHandleAction:v9];
}

void __91__SBFluidSwitcherViewController_performAnimatedInsertionOfAppLayouts_atIndexes_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__SBFluidSwitcherViewController_performAnimatedInsertionOfAppLayouts_atIndexes_completion___block_invoke_3;
  v10[3] = &unk_1E6AFA1E0;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v11 = v7;
  uint64_t v12 = v8;
  [v6 enumerateObjectsUsingBlock:v10];
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v9, a2, a3);
  }
}

void __91__SBFluidSwitcherViewController_performAnimatedInsertionOfAppLayouts_atIndexes_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectAtIndex:a3];
  uint64_t v8 = [v7 unsignedIntegerValue];

  uint64_t v9 = [[SBInsertionSwitcherModifierEvent alloc] initWithAppLayout:v6 intoIndex:v8 phase:4];
  [*(id *)(a1 + 40) _dispatchEventAndHandleAction:v9];
}

- (void)_performSwitcherDropWithContext:(id)a3 mutationBlock:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = a3;
  uint64_t v9 = [[SBCardDropSwitcherModifierEvent alloc] initWithPhase:1 context:v7];
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v9];
  v6[2](v6);

  uint64_t v8 = [[SBCardDropSwitcherModifierEvent alloc] initWithPhase:2 context:v7];
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v8];
}

- (void)_noteSwitcherDropAnimationCompletedWithContext:(id)a3
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[SBCardDropSwitcherModifierEvent alloc] initWithPhase:3 context:v4];
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v5];
  id v6 = [v4 draggingLeafAppLayout];
  id v7 = [v6 itemForLayoutRole:1];
  uint64_t v8 = [v7 bundleIdentifier];

  uint64_t v9 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v10 = *MEMORY[0x1E4FA7678];
  v23[0] = v8;
  uint64_t v11 = *MEMORY[0x1E4FA7688];
  v22[0] = v10;
  v22[1] = v11;
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "currentDropRegion"));
  v23[1] = v12;
  v22[2] = *MEMORY[0x1E4FA7670];
  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "currentDropAction"));
  v23[2] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
  unint64_t v15 = [v9 dictionaryWithDictionary:v14];

  id v16 = [v4 intersectingLeafAppLayout];

  id v17 = [v16 itemForLayoutRole:1];
  uint64_t v18 = [v17 bundleIdentifier];

  if (v18) {
    [v15 setObject:v18 forKey:*MEMORY[0x1E4FA7680]];
  }
  id v19 = (void *)MEMORY[0x1E4FA5E78];
  id v20 = v15;
  id v21 = [v19 sharedInstance];
  [v21 emitEvent:50 withPayload:v20];
}

- (void)removeLayoutRole:(int64_t)a3 inSpace:(id)a4 mutationBlock:(id)a5 reason:(int64_t)a6
{
  id v10 = a4;
  uint64_t v11 = (void (**)(void))a5;
  uint64_t v12 = [v10 leafAppLayoutForRole:a3];
  id v13 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v12];
  if (v13
    && ([(SBFluidSwitcherViewController *)self appLayouts],
        id v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 indexOfObject:v13],
        v14,
        [(SBSwitcherModifier *)self->_rootModifier shouldAnimateInsertionOrRemovalOfAppLayout:v13 atIndex:v15]))
  {
    id v16 = [v12 allItems];
    id v17 = [v16 firstObject];
    uint64_t v18 = (void *)[v13 layoutRoleForItem:v17];

    uint64_t v22 = [[SBRemovalSwitcherModifierEvent alloc] initWithLayoutRole:v18 inAppLayout:v13 reason:a6 phase:1];
    -[SBFluidSwitcherViewController _dispatchEventAndHandleAction:](self, "_dispatchEventAndHandleAction:");
    v11[2](v11);
    id v21 = [[SBRemovalSwitcherModifierEvent alloc] initWithLayoutRole:v18 inAppLayout:v13 reason:a6 phase:2];
    -[SBFluidSwitcherViewController _dispatchEventAndHandleAction:](self, "_dispatchEventAndHandleAction:");
    objc_initWeak(location, self);
    id v19 = (void *)MEMORY[0x1E4FA5E48];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __79__SBFluidSwitcherViewController_removeLayoutRole_inSpace_mutationBlock_reason___block_invoke;
    v27[3] = &unk_1E6AFA230;
    v27[4] = self;
    id v20 = v12;
    id v28 = v20;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __79__SBFluidSwitcherViewController_removeLayoutRole_inSpace_mutationBlock_reason___block_invoke_3;
    v23[3] = &unk_1E6AFA258;
    objc_copyWeak(v26, location);
    v26[1] = v18;
    id v24 = v13;
    v26[2] = (id)a6;
    id v25 = v20;
    [v19 perform:v27 finalCompletion:v23 options:0 delegate:self];

    objc_destroyWeak(v26);
    objc_destroyWeak(location);
  }
  else
  {
    v11[2](v11);
    [(SBFluidSwitcherPageContentViewProvider *)self->_pageContentViewProvider purgePageContentViewForAppLayout:v12];
  }
}

void __79__SBFluidSwitcherViewController_removeLayoutRole_inSpace_mutationBlock_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1832) objectForKey:*(void *)(a1 + 40)];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F42FF0];
    id v6 = [*(id *)(*(void *)(a1 + 32) + 1072) animationSettings];
    id v7 = [v6 opacitySettings];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__SBFluidSwitcherViewController_removeLayoutRole_inSpace_mutationBlock_reason___block_invoke_2;
    v11[3] = &unk_1E6AF4AC0;
    id v12 = v4;
    uint64_t v8 = v3[2](v3, @"fade item container");
    objc_msgSend(v5, "sb_animateWithSettings:mode:animations:completion:", v7, 3, v11, v8);
  }
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = v3[2](v3, @"update visible items accessory views layout and style");
  [v9 _updateVisibleItemsAccessoryViewsLayoutAndStyleWithCompletion:v10];
}

uint64_t __79__SBFluidSwitcherViewController_removeLayoutRole_inSpace_mutationBlock_reason___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __79__SBFluidSwitcherViewController_removeLayoutRole_inSpace_mutationBlock_reason___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = [[SBRemovalSwitcherModifierEvent alloc] initWithLayoutRole:*(void *)(a1 + 56) inAppLayout:*(void *)(a1 + 32) reason:*(void *)(a1 + 64) phase:3];
    [WeakRetained _dispatchEventAndHandleAction:v2];
    [WeakRetained[130] purgePageContentViewForAppLayout:*(void *)(a1 + 40)];
  }
}

- (void)noteWindowManagementStyleDidChange
{
  id v3 = objc_alloc_init(SBUpdateWindowingModeSwitcherModifierEvent);
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v3];

  [(SBFluidSwitcherViewController *)self _updateContentViewSublayerTransform];
  [(SBFluidSwitcherViewController *)self _updateChamoisDefaultsObserverIfNeeded];
}

- (id)liveScenesIdentityTokens
{
  id v2 = [(NSMutableDictionary *)self->_liveContentOverlays allValues];
  id v3 = objc_msgSend(v2, "bs_mapNoNulls:", &__block_literal_global_504);

  if ([v3 count]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

uint64_t __57__SBFluidSwitcherViewController_liveScenesIdentityTokens__block_invoke(uint64_t a1, void *a2)
{
  return [a2 liveSceneIdentityToken];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherViewController;
  [(SBFluidSwitcherViewController *)&v5 viewDidDisappear:a3];
  [(BSInvalidatable *)self->_applicationRestrictionUpdatePendingAssertion invalidate];
  applicationRestrictionUpdatePendingAssertiouint64_t n = self->_applicationRestrictionUpdatePendingAssertion;
  self->_applicationRestrictionUpdatePendingAssertiouint64_t n = 0;
}

void __106__SBFluidSwitcherViewController__configureApplicationAndTransientOverlayDockBehaviorAssertionsForContext___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 2008))
  {
    id v2 = [SBFloatingDockWindowLevelAssertion alloc];
    uint64_t v3 = [(SBFloatingDockWindowLevelAssertion *)v2 initWithFloatingDockController:*(void *)(a1 + 40) priority:1 level:@"TransientOverlay" reason:*MEMORY[0x1E4F43CF8] + 15.0 + -0.1];
    uint64_t v4 = *(void *)(a1 + 32);
    objc_super v5 = *(void **)(v4 + 2008);
    *(void *)(v4 + 2008) = v3;
  }
}

void __106__SBFluidSwitcherViewController__configureApplicationAndTransientOverlayDockBehaviorAssertionsForContext___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _activeTransientOverlayPresentedAppLayout];
  if (v2)
  {
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) layoutContext];
    objc_super v5 = [v4 activeTransitionContext];
    id v6 = *(void **)(a1 + 40);

    if (v5 != v6) {
      return;
    }
  }
  uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  v3();
}

void __71__SBFluidSwitcherViewController__layoutSlideoverTonguesWithCompletion___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", objc_msgSend(*(id *)(a1 + 40), "switcherInterfaceOrientation"), 2);
    double v15 = v14;
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1432), "setBounds:", 0.0, 0.0);
    uint64_t v16 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    uint64_t v17 = *(void *)(a1 + 48);
    if (v16 == 1)
    {
      if (v17 != 1)
      {
LABEL_6:
        double v18 = v15 * 0.5 + *(double *)(a1 + 72);
LABEL_9:
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1432), "setCenter:", v18, *(double *)(a1 + 80) * 0.5);
        id v13 = *(void **)(*(void *)(a1 + 40) + 1432);
        long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        long long v20 = *MEMORY[0x1E4F1DAB8];
        long long v21 = v19;
        long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        id v12 = (CGAffineTransform *)&v20;
        goto LABEL_10;
      }
    }
    else if (v17 == 1)
    {
      goto LABEL_6;
    }
    double v18 = v15 * -0.5;
    goto LABEL_9;
  }
  id v2 = [*(id *)(a1 + 40) appLayouts];
  uint64_t v3 = [v2 indexOfObject:*(void *)(a1 + 32)];

  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return;
  }
  [*(id *)(*(void *)(a1 + 40) + 1944) frameForIndex:v3];
  double v5 = v4;
  double v7 = v6;
  [*(id *)(*(void *)(a1 + 40) + 1944) scaleForIndex:v3];
  CGFloat v9 = v8;
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1432), "setBounds:", 0.0, 0.0, v5, v7);
  id v10 = *(void **)(*(void *)(a1 + 40) + 1432);
  UIRectGetCenter();
  objc_msgSend(v10, "setCenter:");
  uint64_t v11 = *(void **)(*(void *)(a1 + 40) + 1432);
  CGAffineTransformMakeScale(&v23, v9, v9);
  id v12 = &v23;
  id v13 = v11;
LABEL_10:
  objc_msgSend(v13, "setTransform:", v12, v20, v21, v22);
}

uint64_t __77__SBFluidSwitcherViewController__applyRootContentViewClippingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 1600);
  *(void *)(v3 + 1600) = v2;

  double v5 = *(void **)(*(void *)(a1 + 32) + 1600);
  double v6 = [MEMORY[0x1E4F428B8] blackColor];
  [v5 setBackgroundColor:v6];

  double v7 = [*(id *)(*(void *)(a1 + 32) + 1600) layer];
  [v7 setCompositingFilter:*MEMORY[0x1E4F3A098]];

  uint64_t v8 = *(void *)(a1 + 32);
  CGFloat v9 = *(void **)(v8 + 1816);
  uint64_t v10 = *(void *)(v8 + 1600);
  return [v9 addSubview:v10];
}

uint64_t __77__SBFluidSwitcherViewController__applyRootContentViewClippingWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1600), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __79__SBFluidSwitcherViewController__applyRootContentViewBlurRadiusWithCompletion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 1816) layer];
  uint64_t v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v3 setValue:v2 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

uint64_t __79__SBFluidSwitcherViewController__applyRootContentViewBlurRadiusWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 1816) layer];
    [v3 setFilters:0];

    double v4 = [*(id *)(*(void *)(a1 + 32) + 1816) layer];
    double v5 = [*(id *)(a1 + 32) traitCollection];
    [v5 displayScale];
    objc_msgSend(v4, "setRasterizationScale:");

    double v6 = [*(id *)(*(void *)(a1 + 32) + 1816) layer];
    [v6 setShouldRasterize:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

void __79__SBFluidSwitcherViewController__applyRootContentViewBlurRadiusWithCompletion___block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 1816) layer];
  uint64_t v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v3 setValue:v2 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_2()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  id v1 = (void *)kKeyboardHeightIncludingAccessory_block_invoke_keyboardHeightSettings;
  kKeyboardHeightIncludingAccessory_block_invoke_keyboardHeightSettings = v0;

  [(id)kKeyboardHeightIncludingAccessory_block_invoke_keyboardHeightSettings setResponse:0.25];
  [(id)kKeyboardHeightIncludingAccessory_block_invoke_keyboardHeightSettings setDampingRatio:1.0];
  uint64_t v2 = (void *)kKeyboardHeightIncludingAccessory_block_invoke_keyboardHeightSettings;
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return objc_msgSend(v2, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 keyPath];
  uint64_t v3 = [v2 isEqualToString:@"position"];

  return v3;
}

void __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_5(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_6;
  v7[3] = &unk_1E6AFA388;
  id v8 = *(id *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 64);
  long long v9 = *(_OWORD *)(a1 + 48);
  long long v10 = v2;
  uint64_t v11 = *(void *)(a1 + 80);
  uint64_t v3 = (void (**)(void))MEMORY[0x1D948C7A0](v7);
  if ([*(id *)(*(void *)(a1 + 40) + 1944) shouldPerformRotationAnimationForOrientationChange])
  {
    double v4 = (void *)MEMORY[0x1E4F42FF0];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_7;
    v5[3] = &unk_1E6AF5300;
    double v6 = v3;
    [v4 performWithoutAnimation:v5];
  }
  else
  {
    v3[2](v3);
  }
}

void __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_6(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v2, "setAnchorPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v4 = [*(id *)(a1 + 32) layer];
  uint64_t v3 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
  [v4 setValue:v3 forKey:@"transform.translation.x"];
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_8(uint64_t a1)
{
  long long v2 = [[SBBlurProgressSwitcherModifierEvent alloc] initWithProgress:0.0];
  [*(id *)(a1 + 32) _dispatchEventAndHandleAction:v2];
}

void __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_9(uint64_t a1)
{
  long long v2 = [[SBBlurProgressSwitcherModifierEvent alloc] initWithProgress:1.0];
  [*(id *)(a1 + 32) _dispatchEventAndHandleAction:v2];
}

void __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_16(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  [v2 setValue:*(void *)(a1 + 40) forKey:@"meshTransform"];
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_21(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setContentClippingFrame:cornerRadii:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  id v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_22(uint64_t a1)
{
  [*(id *)(a1 + 32) _noteItemContainerDidUpdateContentClippingWithMode:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __70__SBFluidSwitcherViewController__layoutAppLayout_roleMask_completion___block_invoke_25(uint64_t a1, void *a2)
{
  id v2 = [a2 keyPath];
  uint64_t v3 = [v2 isEqualToString:@"position"];

  return v3;
}

- (void)_noteItemContainerDidUpdateContentClippingWithMode:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipViewMorphAnimator);
  uint64_t v4 = [WeakRetained direction];
  CAFrameRateRange v5 = WeakRetained;
  if (WeakRetained) {
    BOOL v6 = a3 == 3;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6 && v4 == 0)
  {
    [WeakRetained noteSourceAnimationsDidEnd:4 finished:1 continueBlock:0];
    CAFrameRateRange v5 = WeakRetained;
  }
}

- (id)_animatablePropertyWithNotifications:(id)a3 progressEventType:(Class)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (void *)[v6 mutableCopy];
  id v8 = objc_alloc_init(MEMORY[0x1E4F43000]);
  [v8 setValue:0.0];
  objc_initWeak(&location, v8);
  long long v9 = (void *)MEMORY[0x1E4F42FF0];
  v20[0] = v8;
  long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__SBFluidSwitcherViewController__animatablePropertyWithNotifications_progressEventType___block_invoke;
  v15[3] = &unk_1E6AFA5B8;
  objc_copyWeak(v18, &location);
  id v11 = v7;
  v18[1] = a4;
  id v16 = v11;
  uint64_t v17 = self;
  [v9 _createTransformerWithInputAnimatableProperties:v10 presentationValueChangedCallback:v15];

  if ([v11 containsObject:&unk_1F3348AD8])
  {
    id v12 = (void *)[[a4 alloc] initWithProgress:0.0];
    [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v12];
    [v11 removeObject:&unk_1F3348AD8];
  }
  id v13 = v8;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  return v13;
}

void __88__SBFluidSwitcherViewController__animatablePropertyWithNotifications_progressEventType___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = [WeakRetained isInvalidated];
    long long v20 = v3;
    [v3 presentationValue];
    double v6 = v5;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      long long v10 = 0;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          [v13 floatValue];
          if (((BSFloatLessThanOrEqualToFloat() ^ 1 | v4) & 1) == 0)
          {
            double v14 = (void *)[objc_alloc(*(Class *)(a1 + 56)) initWithProgress:v6];
            [*(id *)(a1 + 40) _dispatchEventAndHandleAction:v14];
            if (!v10) {
              long long v10 = objc_opt_new();
            }
            [v10 addObject:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }
    else
    {
      long long v10 = 0;
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(a1 + 32) removeObject:*(void *)(*((void *)&v21 + 1) + 8 * j)];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v17);
    }

    uint64_t v3 = v20;
  }
}

void __55__SBFluidSwitcherViewController__ensureSubviewOrdering__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [v5 integerValue];
  uint64_t v8 = [*(id *)(a1 + 32) appLayouts];
  unint64_t v9 = [v8 count];

  if (v7 < v9)
  {
    long long v10 = [*(id *)(a1 + 32) appLayouts];
    uint64_t v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v5, "integerValue"));

    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = -1;
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x3032000000;
    long long v24 = __Block_byref_object_copy__14;
    long long v25 = __Block_byref_object_dispose__14;
    id v26 = 0;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __55__SBFluidSwitcherViewController__ensureSubviewOrdering__block_invoke_650;
    uint64_t v16 = &unk_1E6AFA5E0;
    uint64_t v17 = *(void *)(a1 + 32);
    id v12 = v11;
    id v18 = v12;
    long long v19 = v27;
    long long v20 = &v21;
    [v12 enumerate:&v13];
    if (v22[5]) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1816), "insertSubview:belowSubview:", v6, v13, v14, v15, v16, v17);
    }

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(v27, 8);
  }
}

void __55__SBFluidSwitcherViewController__ensureSubviewOrdering__block_invoke_650(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1832);
  int v4 = [*(id *)(a1 + 40) leafAppLayoutForRole:a2];
  id obj = [v3 objectForKey:v4];

  id v5 = [*(id *)(*(void *)(a1 + 32) + 1816) subviews];
  unint64_t v6 = [v5 indexOfObject:obj];

  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v6 < *(void *)(v7 + 24))
  {
    *(void *)(v7 + 24) = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), obj);
  }
}

uint64_t __52__SBFluidSwitcherViewController__updateVisibleItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  int v4 = [v2 itemForLayoutRole:1];
  uint64_t v5 = [v3 containsItem:v4];

  return v5;
}

uint64_t __52__SBFluidSwitcherViewController__updateVisibleItems__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 isOrContainsAppLayout:*(void *)(a1 + 32)];
}

uint64_t __52__SBFluidSwitcherViewController__updateVisibleItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  int v4 = [v2 itemForLayoutRole:1];
  uint64_t v5 = [v3 containsItem:v4];

  return v5;
}

uint64_t __52__SBFluidSwitcherViewController__updateVisibleItems__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  int v4 = [v2 itemForLayoutRole:1];
  uint64_t v5 = [v3 containsItem:v4];

  return v5;
}

- (void)_prepareForCrossfadeIfNeeded
{
  if (SBReduceMotion())
  {
    [(UIView *)self->_crossfadeSnapshotView removeFromSuperview];
    id v3 = [(SBFluidSwitcherViewController *)self view];
    int v4 = [v3 window];
    SBCreateMainScreenSnapshotBelowWindowWithOrientation(v4, 1, 0, 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v5 = (UIView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v10];
    crossfadeSnapshotView = self->_crossfadeSnapshotView;
    self->_crossfadeSnapshotView = v5;
    uint64_t v7 = v5;

    uint64_t v8 = [(SBFluidSwitcherViewController *)self view];
    unint64_t v9 = [v8 window];
    [v9 addSubview:self->_crossfadeSnapshotView];
  }
}

uint64_t __73__SBFluidSwitcherViewController__performCrossfadeIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __73__SBFluidSwitcherViewController__performCrossfadeIfNeededWithCompletion___block_invoke_2(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2 == *(void **)(a1[5] + 1184))
  {
    [v2 removeFromSuperview];
    uint64_t v3 = a1[5];
    int v4 = *(void **)(v3 + 1184);
    *(void *)(v3 + 1184) = 0;
  }
  uint64_t result = a1[6];
  if (result)
  {
    unint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

uint64_t __74__SBFluidSwitcherViewController__updateTitlePresenceForAdjustedAppLayout___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutAppLayout:*(void *)(a1 + 40) roleMask:0 completion:0];
  [*(id *)(a1 + 32) _applyStyleToAppLayout:*(void *)(a1 + 40) roleMask:0 completion:0];
  [*(id *)(a1 + 48) layoutIfNeeded];
  id v2 = *(void **)(a1 + 56);
  return [v2 layoutIfNeeded];
}

- (BOOL)_removeVisibleItemContainerForAppLayout:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(SBFluidSwitcherViewController *)self _itemContainerForAppLayoutIfExists:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 setVisible:0];
    [v7 setActive:0];
    [v7 _removeAllRetargetableAnimations:1];
    uint64_t v8 = +[SBBlurItemContainerParameters defaultCrossblurBlurParameters];
    [(SBFluidSwitcherViewController *)self _unblurItemContainer:v7 blurParameters:v8 withAnimationUpdateMode:1];

    id v9 = v7;
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      [v9 setHidden:1];
      [(NSMutableDictionary *)self->_visibleItemContainers removeObjectForKey:v5];
      [v9 prepareForReuse];
      if ([(NSMutableArray *)self->_hiddenRecycledItemContainers containsObject:v9])
      {
        id v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherViewController.m" lineNumber:5305 description:@"This item container is already in the reuse queue."];
      }
      [(NSMutableArray *)self->_hiddenRecycledItemContainers _sb_enqueue:v9];
    }
    else
    {
      [v9 removeFromSuperview];
      [(NSMutableDictionary *)self->_visibleItemContainers removeObjectForKey:v5];
    }
    [(SBSwitcherLiveContentOverlayCoordinating *)self->_liveContentOverlayCoordinator appLayoutDidBecomeHidden:v5];
  }

  return v7 != 0;
}

void __70__SBFluidSwitcherViewController__updateVisibleOverlayAndUnderlayViews__block_invoke(void *a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = *(void **)(a1[4] + 1840);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKey:v14];
  uint64_t v8 = [*(id *)(a1[4] + 1848) objectForKey:v14];
  [*(id *)(a1[4] + 1840) removeObjectForKey:v14];
  [*(id *)(a1[4] + 1848) removeObjectForKey:v14];
  id v9 = [*(id *)(a1[4] + 1008) objectForKey:v14];
  char v10 = v9;
  if (v9)
  {
    [v9 invalidate];
    [*(id *)(a1[4] + 1008) removeObjectForKey:v14];
  }
  [*(id *)(a1[4] + 1840) setObject:v7 forKey:v6];
  [*(id *)(a1[4] + 1848) setObject:v8 forKey:v6];

  uint64_t v11 = [*(id *)(a1[4] + 1840) allKeys];
  uint64_t v12 = *(void *)(a1[5] + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
}

uint64_t __70__SBFluidSwitcherViewController__updateVisibleOverlayAndUnderlayViews__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 containsAllItemsFromAppLayout:*(void *)(a1 + 32)]) {
    uint64_t v4 = [*(id *)(a1 + 32) containsAllItemsFromAppLayout:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __70__SBFluidSwitcherViewController__updateVisibleOverlayAndUnderlayViews__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsAllItemsFromAppLayout:a2];
}

uint64_t __70__SBFluidSwitcherViewController__updateVisibleOverlayAndUnderlayViews__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsAllItemsFromAppLayout:a2];
}

- (id)beginHidingAppLayout:(id)a3 forReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x1E4F4F838]);
  id v9 = [MEMORY[0x1E4F29128] UUID];
  char v10 = [v9 UUIDString];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__SBFluidSwitcherViewController_beginHidingAppLayout_forReason___block_invoke;
  v17[3] = &unk_1E6AFA6D0;
  objc_copyWeak(&v19, &location);
  id v11 = v6;
  id v18 = v11;
  uint64_t v12 = (void *)[v8 initWithIdentifier:v10 forReason:v7 invalidationBlock:v17];

  requestedHiddenAppLayouts = self->_requestedHiddenAppLayouts;
  if (!requestedHiddenAppLayouts)
  {
    id v14 = (NSCountedSet *)[objc_alloc(MEMORY[0x1E4F28BD0]) initWithCapacity:1];
    id v15 = self->_requestedHiddenAppLayouts;
    self->_requestedHiddenAppLayouts = v14;

    requestedHiddenAppLayouts = self->_requestedHiddenAppLayouts;
  }
  [(NSCountedSet *)requestedHiddenAppLayouts addObject:v11];
  [(SBFluidSwitcherViewController *)self _updateVisibleItems];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v12;
}

void __64__SBFluidSwitcherViewController_beginHidingAppLayout_forReason___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[160] removeObject:*(void *)(a1 + 32)];
    [v3 _updateVisibleItems];
    id WeakRetained = v3;
  }
}

- (CGRect)completedTransitionFrameForAppLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFluidSwitcherViewController *)self appLayouts];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    uint64_t v19 = 0;
    long long v20 = (double *)&v19;
    uint64_t v21 = 0x4010000000;
    long long v22 = &unk_1D90ED3C6;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = [(SBSwitcherModifier *)self->_rootModifier animatablePropertyIdentifiers];
    uint64_t v12 = [[SBOverridePresentationValueSwitcherModifier alloc] initWithAnimatablePropertyKeys:v11 presentationValue:1.0];
    rootModifier = self->_rootModifier;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    id v18[2] = __70__SBFluidSwitcherViewController_completedTransitionFrameForAppLayout___block_invoke;
    v18[3] = &unk_1E6AF6358;
    v18[4] = self;
    v18[5] = &v19;
    v18[6] = v6;
    [(SBChainableModifier *)rootModifier performTransactionWithTemporaryChildModifier:v12 usingBlock:v18];
    double v7 = v20[4];
    double v8 = v20[5];
    double v9 = v20[6];
    double v10 = v20[7];

    _Block_object_dispose(&v19, 8);
  }

  double v14 = v7;
  double v15 = v8;
  double v16 = v9;
  double v17 = v10;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

uint64_t __70__SBFluidSwitcherViewController_completedTransitionFrameForAppLayout___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 1944) frameForIndex:a1[6]];
  id v3 = *(void **)(a1[5] + 8);
  v3[4] = v4;
  void v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (CGRect)scaledFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SBFluidSwitcherViewController *)self appLayouts];
  uint64_t v8 = [v7 indexOfObject:v6];

  [(SBSwitcherModifier *)self->_rootModifier scaledFrameForLayoutRole:a3 inAppLayout:v6 atIndex:v8];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (double)scaleForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFluidSwitcherViewController *)self appLayouts];
  uint64_t v6 = [v5 indexOfObject:v4];

  double v7 = 0.0;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = 0;
    double v14 = (double *)&v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    uint64_t v8 = [(SBSwitcherModifier *)self->_rootModifier animatablePropertyIdentifiers];
    double v9 = [[SBOverridePresentationValueSwitcherModifier alloc] initWithAnimatablePropertyKeys:v8 presentationValue:1.0];
    rootModifier = self->_rootModifier;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __51__SBFluidSwitcherViewController_scaleForAppLayout___block_invoke;
    v12[3] = &unk_1E6AF6358;
    void v12[4] = self;
    v12[5] = &v13;
    v12[6] = v6;
    [(SBChainableModifier *)rootModifier performTransactionWithTemporaryChildModifier:v9 usingBlock:v12];
    double v7 = v14[3];

    _Block_object_dispose(&v13, 8);
  }

  return v7;
}

uint64_t __51__SBFluidSwitcherViewController_scaleForAppLayout___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 1944) scaleForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (double)contentPageViewScaleForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v5 = [(SBSwitcherModifier *)self->_rootModifier animatablePropertyIdentifiers];
  uint64_t v6 = [[SBOverridePresentationValueSwitcherModifier alloc] initWithAnimatablePropertyKeys:v5 presentationValue:1.0];
  rootModifier = self->_rootModifier;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__SBFluidSwitcherViewController_contentPageViewScaleForAppLayout___block_invoke;
  v11[3] = &unk_1E6AFA6F8;
  void v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  uint64_t v13 = &v14;
  [(SBChainableModifier *)rootModifier performTransactionWithTemporaryChildModifier:v6 usingBlock:v11];
  double v9 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __66__SBFluidSwitcherViewController_contentPageViewScaleForAppLayout___block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) appLayouts];
  uint64_t v2 = [v10 count];
  if (!v2) {
    goto LABEL_12;
  }
  unint64_t v3 = v2;
  uint64_t v4 = 0;
  uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    uint64_t v6 = [v10 objectAtIndex:v4];
    if ([*(id *)(a1 + 40) isOrContainsAppLayout:v6]) {
      break;
    }
    int v7 = [v6 isOrContainsAppLayout:*(void *)(a1 + 40)];
    if (v7) {
      uint64_t v5 = v4;
    }

    if (++v4 >= v3 || v7) {
      goto LABEL_11;
    }
  }

  uint64_t v5 = v4;
LABEL_11:
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    [*(id *)(*(void *)(a1 + 32) + 1944) scaleForIndex:v5];
  }
  else {
LABEL_12:
  }
    double v8 = 1.0;
  [*(id *)(*(void *)(a1 + 32) + 1944) contentPageViewScaleForAppLayout:*(void *)(a1 + 40) withScale:v8];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
}

- (double)cornerRadiusForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFluidSwitcherViewController *)self appLayouts];
  uint64_t v6 = [v5 indexOfObject:v4];

  double v7 = 0.0;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = 0;
    uint64_t v14 = (double *)&v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    double v8 = [(SBSwitcherModifier *)self->_rootModifier animatablePropertyIdentifiers];
    uint64_t v9 = [[SBOverridePresentationValueSwitcherModifier alloc] initWithAnimatablePropertyKeys:v8 presentationValue:1.0];
    rootModifier = self->_rootModifier;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __58__SBFluidSwitcherViewController_cornerRadiusForAppLayout___block_invoke;
    v12[3] = &unk_1E6AF6358;
    void v12[4] = self;
    v12[5] = &v13;
    v12[6] = v6;
    [(SBChainableModifier *)rootModifier performTransactionWithTemporaryChildModifier:v9 usingBlock:v12];
    double v7 = v14[3];

    _Block_object_dispose(&v13, 8);
  }

  return v7;
}

uint64_t __58__SBFluidSwitcherViewController_cornerRadiusForAppLayout___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 1944) cornerRadiiForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  double v7 = [(SBFluidSwitcherViewController *)self appLayouts];
  uint64_t v8 = [v7 indexOfObject:v6];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v9 = *MEMORY[0x1E4F43C68];
    double v10 = *(double *)(MEMORY[0x1E4F43C68] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F43C68] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F43C68] + 24);
  }
  else
  {
    [(SBSwitcherModifier *)self->_rootModifier cornerRadiiForIndex:v8];
    -[SBSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](self->_rootModifier, "cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:", a3, v6);
    double v9 = v13;
    double v10 = v14;
    double v11 = v15;
    double v12 = v16;
  }

  double v17 = v9;
  double v18 = v10;
  double v19 = v11;
  double v20 = v12;
  result.topRight = v20;
  result.bottomRight = v19;
  result.bottomLeft = v18;
  result.topLeft = v17;
  return result;
}

- (void)_enqueueOverlayAccessoryViewInReusePool:(id)a3
{
  id v7 = a3;
  [v7 prepareForReuse];
  overlayAccessoryViewsReusePool = self->_overlayAccessoryViewsReusePool;
  if (overlayAccessoryViewsReusePool)
  {
    [(NSMutableSet *)overlayAccessoryViewsReusePool addObject:v7];
  }
  else
  {
    uint64_t v5 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v7, 0);
    id v6 = self->_overlayAccessoryViewsReusePool;
    self->_overlayAccessoryViewsReusePool = v5;
  }
}

- (void)_enqueueUnderlayAccessoryViewInReusePool:(id)a3
{
  id v7 = a3;
  [v7 prepareForReuse];
  underlayAccessoryViewsReusePool = self->_underlayAccessoryViewsReusePool;
  if (underlayAccessoryViewsReusePool)
  {
    [(NSMutableSet *)underlayAccessoryViewsReusePool addObject:v7];
  }
  else
  {
    uint64_t v5 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v7, 0);
    id v6 = self->_underlayAccessoryViewsReusePool;
    self->_underlayAccessoryViewsReusePool = v5;
  }
}

- (void)_rotateHomeAffordancesFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = self->_visibleAdjustedAppLayouts;
  uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (-[SBFluidSwitcherViewController _bestSupportedHomeAffordanceOrientationForOrientation:inAppLayout:](self, "_bestSupportedHomeAffordanceOrientationForOrientation:inAppLayout:", a4, v12, (void)v16) == a4)
        {
          double v13 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews objectForKey:v12];
          double v14 = [v13 homeGrabberView];
          double v15 = +[SBAnimationUtilities animationSettingsForRotationFromInterfaceOrientation:a3 toInterfaceOrientation:a4];
          [v14 setOrientation:a4 animated:1 rotationSettings:v15];
        }
      }
      uint64_t v9 = [(NSSet *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

uint64_t __54__SBFluidSwitcherViewController__updateVisibleShelves__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 1896) objectForKey:v3];
    uint64_t v4 = [v5 isPresentingOrDismissing] ^ 1;
  }
  return v4;
}

uint64_t __54__SBFluidSwitcherViewController__updateVisibleShelves__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutVisibleShelvesWithCompletion:0];
  objc_msgSend(*(id *)(a1 + 40), "setContentOrientation:", objc_msgSend(*(id *)(a1 + 32), "contentOrientation"));
  uint64_t v2 = [*(id *)(a1 + 40) view];
  [v2 layoutIfNeeded];

  id v3 = *(void **)(a1 + 32);
  return [v3 _ensureSubviewOrdering];
}

BOOL __54__SBFluidSwitcherViewController__updateVisibleShelves__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 shelfViewController];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

BOOL __54__SBFluidSwitcherViewController__updateVisibleShelves__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 shelfViewController];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)_appLayoutFromLayoutElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 switcherLayoutElementType])
    {
      id v6 = SBLogAppSwitcher();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SBFluidSwitcherViewController _appLayoutFromLayoutElement:]((uint64_t)self, v5);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v5;
        goto LABEL_12;
      }
      uint64_t v8 = SBLogAppSwitcher();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SBFluidSwitcherViewController _appLayoutFromLayoutElement:]();
      }
    }
  }
  id v7 = 0;
LABEL_12:

  return v7;
}

- (CGRect)containerViewBoundsForHomeGrabberView:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v5 = [(SBFluidSwitcherViewController *)self _spacesWithVisibleHomeAffordances];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v11 = [(SBFluidSwitcherViewController *)self homeGrabberViewForAppLayout:v10];

        if (v11 == v4)
        {
          uint64_t v12 = [v10 environment];
          if (!(!v14 & v13))
          {
            switch(v12)
            {
              case 0:
              case 3:
                double v15 = *MEMORY[0x1E4F1DB20];
                double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
                double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
                double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
                break;
              case 1:
                [(SBFluidSwitcherViewController *)self containerViewBounds];
                double v15 = v19;
                double v16 = v20;
                double v17 = v21;
                double v18 = v22;
                break;
              case 2:
                int64_t v23 = [(SBFluidSwitcherViewController *)self contentOrientation];
                long long v24 = [(SBFluidSwitcherViewController *)self layoutContext];
                long long v25 = [v24 layoutState];

                -[SBFluidSwitcherViewController floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", v23, [v25 floatingConfiguration]);
                double v17 = v26;
                double v18 = v27;
                double v15 = *MEMORY[0x1E4F1DAD8];
                double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);

                break;
              default:
                JUMPOUT(0);
            }

            goto LABEL_17;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  double v15 = *MEMORY[0x1E4F1DB20];
  double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_17:

  double v28 = v15;
  double v29 = v16;
  double v30 = v17;
  double v31 = v18;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (BOOL)isEdgeProtectedForHomeGestureAtEdgeLocation:(double)a3 edge:(unint64_t)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(SBFluidSwitcherViewController *)self dataSource];
  char v8 = [v7 switcherContentControllerIsKeyboardHomeAffordanceAssertionCurrentlyBeingTaken:self];

  if (v8) {
    return 0;
  }
  [(SBFluidSwitcherViewController *)self containerViewBounds];
  CGFloat v49 = v11;
  CGFloat v50 = v10;
  CGFloat rect = v12;
  CGFloat v14 = v13;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  double v15 = self->_visibleItemContainers;
  uint64_t v16 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v52;
    unint64_t v19 = a4 - 1;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v52 != v18) {
          objc_enumerationMutation(v15);
        }
        double v21 = *(void **)(*((void *)&v51 + 1) + 8 * v20);
        double v22 = [(NSMutableDictionary *)self->_visibleItemContainers objectForKey:v21];
        if (([v22 isOccludedInContinuousExposeStage] & 1) == 0)
        {
          [v22 frame];
          CGFloat v27 = v23;
          CGFloat v28 = v24;
          CGFloat v29 = v25;
          CGFloat v30 = v26;
          switch(v19)
          {
            case 0uLL:
              double MinY = CGRectGetMinY(*(CGRect *)&v23);
              v57.origin.double y = v49;
              v57.origin.double x = v50;
              v57.size.double width = rect;
              v57.size.double height = v14;
              double v32 = CGRectGetMinY(v57);
              v58.origin.double x = v27;
              v58.origin.double y = v28;
              v58.size.double width = v29;
              v58.size.double height = v30;
              if (CGRectGetMinX(v58) > a3) {
                goto LABEL_9;
              }
              BOOL v33 = MinY <= v32;
              goto LABEL_16;
            case 1uLL:
              double MinX = CGRectGetMinX(*(CGRect *)&v23);
              v62.origin.double y = v49;
              v62.origin.double x = v50;
              v62.size.double width = rect;
              v62.size.double height = v14;
              double v38 = CGRectGetMinX(v62);
              v63.origin.double x = v27;
              v63.origin.double y = v28;
              v63.size.double width = v29;
              v63.size.double height = v30;
              if (CGRectGetMinY(v63) > a3) {
                goto LABEL_9;
              }
              BOOL v33 = MinX <= v38;
              goto LABEL_21;
            case 3uLL:
              double MaxY = CGRectGetMaxY(*(CGRect *)&v23);
              v59.origin.double y = v49;
              v59.origin.double x = v50;
              v59.size.double width = rect;
              v59.size.double height = v14;
              double v35 = CGRectGetMaxY(v59);
              v60.origin.double x = v27;
              v60.origin.double y = v28;
              v60.size.double width = v29;
              v60.size.double height = v30;
              if (CGRectGetMinX(v60) > a3) {
                goto LABEL_9;
              }
              BOOL v33 = MaxY >= v35;
LABEL_16:
              v61.origin.double x = v27;
              v61.origin.double y = v28;
              v61.size.double width = v29;
              v61.size.double height = v30;
              double MaxX = CGRectGetMaxX(v61);
              break;
            case 7uLL:
              double v39 = CGRectGetMaxX(*(CGRect *)&v23);
              v64.origin.double y = v49;
              v64.origin.double x = v50;
              v64.size.double width = rect;
              v64.size.double height = v14;
              double v40 = CGRectGetMaxX(v64);
              v65.origin.double x = v27;
              v65.origin.double y = v28;
              v65.size.double width = v29;
              v65.size.double height = v30;
              if (CGRectGetMinY(v65) > a3) {
                goto LABEL_9;
              }
              BOOL v33 = v39 >= v40;
LABEL_21:
              v66.origin.double x = v27;
              v66.origin.double y = v28;
              v66.size.double width = v29;
              v66.size.double height = v30;
              double MaxX = CGRectGetMaxY(v66);
              break;
            default:
              goto LABEL_9;
          }
          if (v33 && MaxX >= a3)
          {
            id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
            long long v43 = WeakRetained;
            if ((*((unsigned char *)&self->_dataSourceRespondsTo + 2) & 0x80) != 0)
            {
              long long v45 = [v21 itemForLayoutRole:1];
              long long v46 = [v43 switcherContentController:self deviceApplicationSceneHandleForDisplayItem:v45];

              char v9 = [v46 isEdgeProtectEnabledForHomeGesture];
              goto LABEL_31;
            }
          }
        }
LABEL_9:

        ++v20;
      }
      while (v17 != v20);
      uint64_t v44 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v51 objects:v55 count:16];
      uint64_t v17 = v44;
    }
    while (v44);
  }
  char v9 = 0;
LABEL_31:

  return v9;
}

- (int64_t)homeAffordanceOrientationIfMismatchedFromCurrentLayoutState
{
  id v3 = [(SBFluidSwitcherLayoutContext *)self->_layoutContext activeTransitionContext];

  if (v3) {
    return 0;
  }
  uint64_t v5 = [(SBFluidSwitcherLayoutContext *)self->_layoutContext layoutState];
  visibleOverlayAccessoryViews = self->_visibleOverlayAccessoryViews;
  uint64_t v7 = [v5 appLayout];
  char v8 = [(NSMutableDictionary *)visibleOverlayAccessoryViews objectForKey:v7];

  if (v8)
  {
    uint64_t v9 = [v5 interfaceOrientation];
    double v10 = [v8 homeGrabberView];
    uint64_t v11 = [v10 orientation];

    if (v11 == v9 || v11 == 0) {
      int64_t v4 = 0;
    }
    else {
      int64_t v4 = v11;
    }
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)_keyboardWillShow:(id)a3
{
  id v4 = a3;
  if (!self->_keyboardUIPosition)
  {
    id v6 = v4;
    BOOL isKeyboardShowing = 1;
    if (!self->_isKeyboardShowing)
    {
      self->_BOOL isKeyboardShowing = 1;
      [(SBFluidSwitcherViewController *)self _updateSuppressingHomeAffordanceBounce];
      BOOL isKeyboardShowing = self->_isKeyboardShowing;
    }
    [(SBFluidSwitcherViewController *)self _updateSoftwareKeyboardVisibleWithKeyboardShowing:isKeyboardShowing];
    id v4 = v6;
  }
}

- (void)_keyboardWillHide:(id)a3
{
  id v4 = a3;
  if (!self->_keyboardUIPosition)
  {
    id v6 = v4;
    if (self->_isKeyboardShowing)
    {
      self->_BOOL isKeyboardShowing = 0;
      [(SBFluidSwitcherViewController *)self _updateSuppressingHomeAffordanceBounce];
      BOOL isKeyboardShowing = self->_isKeyboardShowing;
    }
    else
    {
      BOOL isKeyboardShowing = 0;
    }
    [(SBFluidSwitcherViewController *)self _updateSoftwareKeyboardVisibleWithKeyboardShowing:isKeyboardShowing];
    id v4 = v6;
  }
}

- (void)_keyboardDidUIPosition:(id)a3
{
  id v4 = [a3 object];
  self->_keyboardUIPositiouint64_t n = [v4 integerValue];

  BOOL v5 = self->_keyboardUIPosition == 3;
  [(SBFluidSwitcherViewController *)self _updateSoftwareKeyboardVisibleWithKeyboardShowing:v5];
}

- (void)_updateSoftwareKeyboardVisibleWithKeyboardShowing:(BOOL)a3
{
  BOOL v3 = a3;
  int isSoftwareKeyboardVisible = self->_isSoftwareKeyboardVisible;
  id v6 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  char v7 = [v6 isExternalDisplayWindowScene];

  if (v7)
  {
    int v8 = 0;
  }
  else
  {
    keyboardUIPositiouint64_t n = self->_keyboardUIPosition;
    BOOL v10 = keyboardUIPosition == 0;
    if (keyboardUIPosition) {
      int v8 = v3;
    }
    else {
      int v8 = 0;
    }
    if (v10 && v3) {
      int v8 = [MEMORY[0x1E4F42B08] isInHardwareKeyboardMode] ^ 1;
    }
  }
  self->_int isSoftwareKeyboardVisible = v8;
  if (isSoftwareKeyboardVisible != v8)
  {
    [(SBFluidSwitcherViewController *)self _configureApplicationAndTransientOverlayDockBehaviorAssertionsForContext:0];
    id v12 = [(SBFluidSwitcherViewController *)self view];
    [v12 setNeedsLayout];
  }
}

- (void)_medusaHostedKeyboardWillShowNotification:(id)a3
{
  if (!self->_isMedusaHostedKeyboardVisible)
  {
    self->_isMedusaHostedKeyboardVisible = 1;
    [(SBFluidSwitcherViewController *)self _configureApplicationAndTransientOverlayDockBehaviorAssertionsForContext:0];
    id v4 = [(SBFluidSwitcherViewController *)self view];
    [v4 setNeedsLayout];
  }
}

- (void)_handleKeyboardFrameWillChange:(id)a3
{
  id v23 = [a3 userInfo];
  id v4 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F43AF0]];
  [v4 rectValue];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  double v13 = [(SBFluidSwitcherViewController *)self _screen];
  [v13 bounds];
  v27.origin.CGFloat x = v14;
  v27.origin.CGFloat y = v15;
  v27.size.CGFloat width = v16;
  v27.size.CGFloat height = v17;
  v25.origin.CGFloat x = v6;
  v25.origin.CGFloat y = v8;
  v25.size.CGFloat width = v10;
  v25.size.CGFloat height = v12;
  CGRect v26 = CGRectIntersection(v25, v27);
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  if (!CGRectEqualToRect(self->_currentKeyboardFrame, v26))
  {
    self->_currentKeyboardFrame.origin.CGFloat x = x;
    self->_currentKeyboardFrame.origin.CGFloat y = y;
    self->_currentKeyboardFrame.size.CGFloat width = width;
    self->_currentKeyboardFrame.size.CGFloat height = height;
    double v22 = [(SBFluidSwitcherViewController *)self view];
    [v22 setNeedsLayout];
  }
}

uint64_t __60__SBFluidSwitcherViewController__updateStyleWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1408) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __60__SBFluidSwitcherViewController__updateStyleWithCompletion___block_invoke_3(uint64_t a1)
{
  SBRectWithSize();
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  UIRectGetCenter();
  double v11 = v10;
  double v13 = v12;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1472), "setBounds:", v3, v5, v7, v9);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1472), "setCenter:", v11, v13);
  [*(id *)(*(void *)(a1 + 32) + 1472) setNeedsLayout];
  CGFloat v14 = *(void **)(*(void *)(a1 + 32) + 1472);
  return [v14 layoutIfNeeded];
}

uint64_t __60__SBFluidSwitcherViewController__updateStyleWithCompletion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1472) setWeighting:*(double *)(a1 + 40)];
}

void __60__SBFluidSwitcherViewController__updateStyleWithCompletion___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  double v7 = WeakRetained;
  double v12 = WeakRetained;
  if (WeakRetained)
  {
    if ((a3 & 1) == 0)
    {
      id v8 = WeakRetained[184];
      if (v8)
      {
        [v8 alpha];
        int IsZero = BSFloatIsZero();
        double v7 = v12;
        if (IsZero)
        {
          [v12[184] removeFromSuperview];
          id v10 = v12[184];
          v12[184] = 0;

          double v7 = v12;
        }
      }
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, a2, a3);
    double v7 = v12;
  }
}

uint64_t __82__SBFluidSwitcherViewController__applyStyleToVisibleItemContainersWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (void)presentSlideOverEdgeProtectTongueOnEdge:(unint64_t)a3
{
  double v4 = [[SBSlideOverEdgeProtectTongueSwitcherModifierEvent alloc] initWithTonguePresented:1 edge:a3];
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v4];
}

- (void)dismissSlideOverEdgeProtectTongueOnEdge:(unint64_t)a3
{
  double v4 = [[SBSlideOverEdgeProtectTongueSwitcherModifierEvent alloc] initWithTonguePresented:0 edge:a3];
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v4];
}

- (void)presentContinuousExposeStripEdgeProtectTongue
{
  double v3 = [[SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent alloc] initWithTonguePresented:1];
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v3];
}

- (void)dismissContinuousExposeStripEdgeProtectTongue
{
  double v3 = [[SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent alloc] initWithTonguePresented:0];
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v3];
}

- (void)willBeginGestureWithType:(int64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  double v7 = [[SBGestureSwitcherModifierEvent alloc] initWithGestureID:v6 selectedAppLayout:0 gestureType:a3 phase:0];

  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v7];
}

- (void)_setCenterWindowActivationContext:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  centerWindowActivationAnimationContexts = self->_centerWindowActivationAnimationContexts;
  if (!centerWindowActivationAnimationContexts)
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    double v9 = self->_centerWindowActivationAnimationContexts;
    self->_centerWindowActivationAnimationContexts = v8;

    centerWindowActivationAnimationContexts = self->_centerWindowActivationAnimationContexts;
  }
  [(NSMutableDictionary *)centerWindowActivationAnimationContexts setObject:v10 forKey:v6];
}

- (void)_removeCenterWindowAnimationContextWithKey:(id)a3
{
  double v4 = [(SBFluidSwitcherViewController *)self _centerWindowActivationAnimationContextForKey:a3];
  if (v4)
  {
    id v8 = v4;
    double v5 = [v4 contentPortalContainer];
    [v5 removeFromSuperview];

    id v6 = [v8 deparentingPortal];
    [v6 removeFromSuperview];

    double v7 = [(NSMutableDictionary *)self->_centerWindowActivationAnimationContexts allKeysForObject:v8];
    [(NSMutableDictionary *)self->_centerWindowActivationAnimationContexts removeObjectsForKeys:v7];

    double v4 = v8;
  }
}

- (void)prepareForIncomingCenterWindowAnimationWithAction:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = NSString;
  id v6 = [v4 sourceAppBundleIdentifier];
  CGAffineTransform v79 = v4;
  double v7 = [v4 sourceSceneIdentifier];
  id v8 = [v5 stringWithFormat:@"sceneID:%@-%@", v6, v7];

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  CGAffineTransform v78 = self;
  double v9 = [(SBSwitcherModifier *)self->_rootModifier visibleAppLayouts];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v90 objects:v97 count:16];
  if (!v10)
  {

    double v22 = 0;
LABEL_26:
    id v23 = v79;
LABEL_27:
    double v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v94 = *MEMORY[0x1E4F28568];
    double v95 = @"Center window activation denied in current configuration.";
    long long v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
    uint64_t v37 = [v35 errorWithDomain:@"SBWindowActivationScenePrewarmError" code:-1 userInfo:v36];

    double v38 = [MEMORY[0x1E4F4F678] responseForError:v37];

    goto LABEL_28;
  }
  uint64_t v11 = v10;
  long long v85 = 0;
  uint64_t v82 = 0;
  uint64_t v83 = *(void *)v91;
  id obj = v9;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v91 != v83) {
        objc_enumerationMutation(obj);
      }
      double v13 = *(void **)(*((void *)&v90 + 1) + 8 * i);
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      CGFloat v14 = [v13 allItems];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v86 objects:v96 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v87;
        while (2)
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v87 != v17) {
              objc_enumerationMutation(v14);
            }
            unint64_t v19 = *(void **)(*((void *)&v86 + 1) + 8 * j);
            uint64_t v20 = [v19 uniqueIdentifier];
            if ([v20 isEqualToString:v8])
            {
              id v21 = v13;

              uint64_t v82 = [v21 layoutRoleForItem:v19];
              long long v85 = v21;
              goto LABEL_16;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v86 objects:v96 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v90 objects:v97 count:16];
  }
  while (v11);

  double v22 = v85;
  if (!v85) {
    goto LABEL_26;
  }
  id v23 = v79;
  if ([v85 environment] == 2) {
    goto LABEL_27;
  }
  double v24 = [(SBFluidSwitcherViewController *)v78 contentView];
  uint64_t v25 = [v79 sourceLayerContextId];
  uint64_t v26 = [v79 morphContainerRenderId];
  id v27 = objc_alloc(MEMORY[0x1E4F43298]);
  [v24 bounds];
  CGFloat v28 = objc_msgSend(v27, "initWithFrame:");
  CGFloat v29 = [v28 portalLayer];
  [v29 setSourceContextId:v25];

  CGFloat v30 = [v28 portalLayer];
  [v30 setSourceLayerRenderId:v26];

  double v31 = [v28 portalLayer];
  uint64_t v32 = 1;
  [v31 setAllowsGroupOpacity:1];

  [v28 setName:@"com.apple.SpringBoard.centerWindowDeparentingPortal"];
  [v28 setAllowsHitTesting:1];
  [v28 setMatchesPosition:1];
  [v28 setMatchesTransform:1];
  [v24 addSubview:v28];
  BOOL v33 = objc_opt_new();
  [v33 setSourceContextId:v25];
  objc_msgSend(v33, "setSourceLayerRenderId:", objc_msgSend(v79, "deparentingPortalAlphaSourceLayerRenderId"));
  [v33 setKeyPath:@"opacity"];
  [v33 setDuration:INFINITY];
  [v33 setRemovedOnCompletion:0];
  long long v34 = [v28 layer];
  [v34 addAnimation:v33 forKey:@"CenterWindowDeparenting.opacityMatchProperty"];

  if (![(SBFluidSwitcherViewController *)v78 isChamoisWindowingUIEnabled])
  {
    if ([v79 requestCenterSlot])
    {
      if ([v79 requestFullscreen]) {
        uint64_t v32 = 2;
      }
      else {
        uint64_t v32 = 1;
      }
    }
    else
    {
      uint64_t v32 = 1;
    }
  }
  [(SBFluidSwitcherViewController *)v78 _frameForCenterItemInInterfaceOrientation:[(SBFluidSwitcherViewController *)v78 switcherInterfaceOrientation] centerConfiguration:SBMainDisplayLayoutStateCenterConfigurationFromAppLayoutCenterConfiguration(v32)];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  long long v84 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v39, v41, v43, v45);
  [v24 insertSubview:v84 atIndex:0];
  double v47 = [(SBFluidSwitcherViewController *)v78 _sbWindowScene];
  [v47 screen];
  v49 = uint64_t v48 = v24;
  CGFloat v50 = [v49 fixedCoordinateSpace];
  uint64_t v51 = +[SBSceneLayoutCoordinateSpace coordinateSpaceForInterfaceOrientation:1 withReferenceCoordinateSpace:v50 inOrientation:1];

  [(SBFluidSwitcherViewController *)v78 containerViewBounds];
  double v22 = v85;
  -[SBFluidSwitcherViewController preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](v78, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", v82, v85, [(SBFluidSwitcherViewController *)v78 switcherInterfaceOrientation], v52, v53, v54, v55);
  uint64_t v56 = v48;
  id obja = v48;
  id v77 = (void *)v51;
  objc_msgSend(v48, "convertRect:toCoordinateSpace:", v51);
  CGRect v57 = +[SBSceneLayoutCoordinateSpace coordinateSpaceForFrame:withinCoordinateSpace:](SBSceneLayoutCoordinateSpace, "coordinateSpaceForFrame:withinCoordinateSpace:", v51);
  objc_msgSend(v56, "convertRect:toCoordinateSpace:", v57, v40, v42, v44, v46);
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;
  double v65 = v64;
  rootModifier = v78->_rootModifier;
  [(SBFluidSwitcherViewController *)v78 displayCornerRadius];
  SBRectCornerRadiiForRadius();
  -[SBSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](rootModifier, "cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:", 4, v85);
  double v68 = v67;
  double v70 = v69;
  double v72 = v71;
  double v74 = v73;
  CGAffineTransform v75 = objc_opt_new();
  [v75 setContentPortalContainer:v84];
  [v75 setDeparentingPortal:v28];
  id v23 = v79;
  CGFloat v76 = [v79 interactionIdentifier];
  [(SBFluidSwitcherViewController *)v78 _setCenterWindowActivationContext:v75 forKey:v76];

  double v38 = objc_msgSend(MEMORY[0x1E4F433D8], "responseWithSceneContainer:expectedSceneFrame:cornerRadii:", v84, v59, v61, v63, v65, v68, v70, v72, v74);

  if (!v38) {
    goto LABEL_27;
  }
LABEL_28:
  [v23 sendResponse:v38];
}

- (void)cleanUpAfterCompletingCenterWindowAnimationWithAction:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (self->_centerWindowInAppMorphCompletion)
  {
    objc_storeStrong((id *)&self->_pendingCenterWindowCleanupAction, a3);
    (*((void (**)(void))self->_centerWindowInAppMorphCompletion + 2))();
    centerWindowInAppMorphCompletiouint64_t n = self->_centerWindowInAppMorphCompletion;
    self->_centerWindowInAppMorphCompletiouint64_t n = 0;
  }
  else
  {
    double v7 = [v5 interactionIdentifier];
    [(SBFluidSwitcherViewController *)self _removeCenterWindowAnimationContextWithKey:v7];

    centerWindowInAppMorphCompletiouint64_t n = [MEMORY[0x1E4F4F678] response];
    [v8 sendResponse:centerWindowInAppMorphCompletion];
  }
}

- (void)associateCenterWindowInteractionIdentifier:(id)a3 withSceneIdentifier:(id)a4
{
  id v7 = a4;
  id v6 = [(SBFluidSwitcherViewController *)self _centerWindowActivationAnimationContextForKey:a3];
  if (v6) {
    [(SBFluidSwitcherViewController *)self _setCenterWindowActivationContext:v6 forKey:v7];
  }
}

- (id)_switcherDropRegionContextForDraggingLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atLocation:(CGPoint)a5
{
  return (id)-[SBSwitcherModifier switcherDropRegionContextForDraggingLayoutRole:inAppLayout:atLocation:](self->_rootModifier, "switcherDropRegionContextForDraggingLayoutRole:inAppLayout:atLocation:", a3, a4, a5.x, a5.y);
}

id __92__SBFluidSwitcherViewController__orderedViewsForLayoutElement_excludeSwitcherHostedShelves___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v2 = [*(id *)(*(void *)(a1 + 32) + 1896) objectForKey:a2];
  double v3 = [v2 view];

  return v3;
}

- (void)scrollViewDidScroll:(id)a3 withContext:(id *)a4
{
  int64_t var0 = a4->var0;
  currentScrollEvent = self->_currentScrollEvent;
  if (currentScrollEvent)
  {
    id v8 = a3;
    double v9 = [(SBChainableModifierEvent *)currentScrollEvent unhandledCopy];
  }
  else
  {
    id v10 = a3;
    uint64_t v11 = [SBScrollSwitcherModifierEvent alloc];
    [v10 contentOffset];
    double v9 = -[SBScrollSwitcherModifierEvent initWithContentOffset:phase:userInitiated:](v11, "initWithContentOffset:phase:userInitiated:", 0, var0 == 3);
  }
  double v12 = self->_currentScrollEvent;
  self->_currentScrollEvent = v9;

  double v13 = self->_currentScrollEvent;
  [a3 contentOffset];
  double v15 = v14;
  double v17 = v16;

  -[SBScrollSwitcherModifierEvent setContentOffset:](v13, "setContentOffset:", v15, v17);
  [(SBScrollSwitcherModifierEvent *)self->_currentScrollEvent setPhase:0];
  [(SBScrollSwitcherModifierEvent *)self->_currentScrollEvent setUserInitiated:var0 == 3];
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:self->_currentScrollEvent];
  [MEMORY[0x1E4F39CF8] setLowLatency:0];
  id v18 = [(SBFluidSwitcherViewController *)self view];
  [v18 setNeedsLayout];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  -[SBSwitcherModifier restingOffsetForScrollOffset:velocity:](self->_rootModifier, "restingOffsetForScrollOffset:velocity:", a3, a5->x, a5->y, a4.x, a4.y);
  a5->CGFloat x = v6;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
}

- (void)scrollViewDidEndScrolling:(id)a3
{
  currentScrollEvent = self->_currentScrollEvent;
  if (currentScrollEvent)
  {
    id v5 = a3;
    CGFloat v6 = [(SBChainableModifierEvent *)currentScrollEvent unhandledCopy];
    id v7 = self->_currentScrollEvent;
    self->_currentScrollEvent = v6;

    id v8 = self->_currentScrollEvent;
    [v5 contentOffset];
    double v10 = v9;
    double v12 = v11;

    -[SBScrollSwitcherModifierEvent setContentOffset:](v8, "setContentOffset:", v10, v12);
    [(SBScrollSwitcherModifierEvent *)self->_currentScrollEvent setPhase:1];
    [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:self->_currentScrollEvent];
    double v13 = self->_currentScrollEvent;
    self->_currentScrollEvent = 0;
  }
}

- (CGPoint)_scrollView:(id)a3 adjustedOffsetForOffset:(CGPoint)a4 translation:(CGPoint)a5 startPoint:(CGPoint)a6 locationInView:(CGPoint)a7 horizontalVelocity:(double *)a8 verticalVelocity:(double *)a9
{
  -[SBSwitcherModifier adjustedOffsetForOffset:translation:startPoint:locationInView:horizontalVelocity:verticalVelocity:](self->_rootModifier, "adjustedOffsetForOffset:translation:startPoint:locationInView:horizontalVelocity:verticalVelocity:", a8, a9, a4.x, a4.y, a5.x, a5.y, a6.x, a6.y, a7.x, a7.y);
  result.CGFloat y = v10;
  result.CGFloat x = v9;
  return result;
}

- (CGSize)sizeForAppLayout:(id)a3 fromProvider:(id)a4
{
  [(SBFluidSwitcherContentView *)self->_contentView bounds];
  double v5 = v4;
  double v7 = v6;
  result.CGFloat height = v7;
  result.CGFloat width = v5;
  return result;
}

- (id)viewControllerForTransientOverlayAppLayout:(id)a3 fromProvider:(id)a4
{
  id v5 = a3;
  double v6 = [(SBFluidSwitcherViewController *)self dataSource];
  double v7 = v6;
  if ((*(unsigned char *)&self->_dataSourceRespondsTo & 0x20) != 0)
  {
    id v8 = [v6 viewControllerForTransientOverlayAppLayout:v5];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (int64_t)orientationForSnapshotOfAppLayout:(id)a3 inImageCache:(id)a4
{
  uint64_t v5 = -[SBSwitcherModifier preferredSnapshotOrientationForAppLayout:](self->_rootModifier, "preferredSnapshotOrientationForAppLayout:", a3, a4);
  if (v5 == 2)
  {
    return [(SBFluidSwitcherViewController *)self switcherInterfaceOrientation];
  }
  else if (v5 == 1)
  {
    double v6 = [(SBFluidSwitcherViewController *)self dataSource];
    int64_t v7 = [v6 activeInterfaceOrientationForSwitcherContentController:self];

    return v7;
  }
  else
  {
    return 0;
  }
}

- (double)scaleForDownscaledSnapshotsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 inImageCache:(id)a5
{
  -[SBSwitcherModifier snapshotScaleForLayoutRole:inAppLayout:](self->_rootModifier, "snapshotScaleForLayoutRole:inAppLayout:", a3, a4, a5);
  return result;
}

- (CGSize)snapshotSizeForItemWithRole:(int64_t)a3 inAppLayout:(id)a4 interfaceOrientation:(int64_t)a5 inImageCache:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if (a3 == 4 && [v10 environment] == 1 || objc_msgSend(v10, "environment") == 3)
  {
    -[SBFluidSwitcherViewController _frameForCenterItemInInterfaceOrientation:centerConfiguration:](self, "_frameForCenterItemInInterfaceOrientation:centerConfiguration:", a5, SBMainDisplayLayoutStateCenterConfigurationFromAppLayoutCenterConfiguration([v10 centerConfiguration]));
  }
  else if ([v10 environment] == 1)
  {
    double v12 = [v10 leafAppLayoutForRole:a3];
    double v13 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v12];
    if (v13)
    {
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x4010000000;
      id v26[3] = &unk_1D90ED3C6;
      long long v27 = 0u;
      long long v28 = 0u;
      double v14 = [[SBOverrideInterfaceOrientationSwitcherModifier alloc] initWithInterfaceOrientation:a5];
      rootModifier = self->_rootModifier;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __107__SBFluidSwitcherViewController_snapshotSizeForItemWithRole_inAppLayout_interfaceOrientation_inImageCache___block_invoke;
      void v22[3] = &unk_1E6AFA860;
      void v22[4] = self;
      id v23 = v13;
      id v24 = v12;
      uint64_t v25 = v26;
      [(SBChainableModifier *)rootModifier performTransactionWithTemporaryChildModifier:v14 usingBlock:v22];

      _Block_object_dispose(v26, 8);
    }
  }
  else if ([v10 environment] == 2)
  {
    [(SBFluidSwitcherViewController *)self _frameForFloatingAppLayoutInInterfaceOrientation:a5 floatingConfiguration:2];
  }
  _UIWindowConvertRectFromOrientationToOrientation();
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.CGFloat height = v21;
  result.CGFloat width = v20;
  return result;
}

uint64_t __107__SBFluidSwitcherViewController_snapshotSizeForItemWithRole_inAppLayout_interfaceOrientation_inImageCache___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) appLayouts];
  uint64_t v3 = [v2 indexOfObject:*(void *)(a1 + 40)];

  [*(id *)(*(void *)(a1 + 32) + 1944) frameForIndex:v3];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1944), "fullyPresentedFrameForIndex:frame:", v3);
  double v4 = *(void **)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 48) allItems];
  double v6 = [v5 firstObject];
  uint64_t v7 = [v4 layoutRoleForItem:v6];

  uint64_t v8 = *(void *)(a1 + 40);
  double v9 = *(void **)(*(void *)(a1 + 32) + 1944);
  SBRectWithSize();
  uint64_t result = objc_msgSend(v9, "frameForLayoutRole:inAppLayout:withBounds:", v7, v8);
  id v11 = *(void **)(*(void *)(a1 + 56) + 8);
  void v11[4] = v12;
  void v11[5] = v13;
  v11[6] = v14;
  v11[7] = v15;
  return result;
}

- (id)sceneHandleProviderForImageCache:(id)a3
{
  uint64_t v3 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  double v4 = [v3 sceneManager];

  return v4;
}

- (id)displayIdentityForImageCache:(id)a3
{
  uint64_t v3 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  double v4 = [v3 sceneManager];
  uint64_t v5 = [v4 displayIdentity];

  return v5;
}

- (void)underlayAccessoryView:(id)a3 didSelectHeaderForRole:(int64_t)a4
{
  double v6 = [(NSMutableDictionary *)self->_visibleUnderlayAccessoryViews allKeysForObject:a3];
  uint64_t v7 = [v6 firstObject];

  uint64_t v8 = [(NSMutableDictionary *)self->_appLayoutToTitleItemController objectForKey:v7];
  if (SBLayoutRoleMaskContainsRole([v8 multiWindowIndicatorRoleMask], a4))
  {
    double v9 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
    id v10 = [v9 _fbsDisplayConfiguration];

    id v11 = [v7 itemForLayoutRole:a4];
    uint64_t v12 = [v11 bundleIdentifier];

    uint64_t v13 = +[SBMainWorkspace sharedInstance];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__SBFluidSwitcherViewController_underlayAccessoryView_didSelectHeaderForRole___block_invoke;
    v16[3] = &unk_1E6AF57E8;
    id v17 = v12;
    id v14 = v12;
    [v13 requestTransitionWithOptions:0 displayConfiguration:v10 builder:v16 validator:0];
  }
  else
  {
    uint64_t v15 = [[SBTapAppLayoutSwitcherModifierEvent alloc] initWithAppLayout:v7 layoutRole:a4 modifierFlags:0];
    [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v15];
  }
}

void __78__SBFluidSwitcherViewController_underlayAccessoryView_didSelectHeaderForRole___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:3];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__SBFluidSwitcherViewController_underlayAccessoryView_didSelectHeaderForRole___block_invoke_2;
  v4[3] = &unk_1E6AF57C0;
  id v5 = *(id *)(a1 + 32);
  [v3 modifyApplicationContext:v4];
}

uint64_t __78__SBFluidSwitcherViewController_underlayAccessoryView_didSelectHeaderForRole___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setRequestedAppExposeBundleID:*(void *)(a1 + 32)];
}

- (BOOL)underlayAccessoryViewShouldBeginPointerInteraction:(id)a3
{
  double v4 = [(NSMutableDictionary *)self->_visibleUnderlayAccessoryViews allKeysForObject:a3];
  id v5 = [v4 firstObject];

  double v6 = [(SBFluidSwitcherLayoutContext *)self->_layoutContext activeGesture];
  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v8 = [v5 itemForLayoutRole:4];
    BOOL v7 = v8 == 0;
  }
  return v7;
}

- (void)overlayAccessoryView:(id)a3 didSelectHeaderForRole:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews allKeysForObject:v6];
  uint64_t v8 = [v7 firstObject];

  if (v8)
  {
    if ([(SBFluidSwitcherViewController *)self isChamoisWindowingUIEnabled]) {
      double v9 = [[SBTapAppLayoutHeaderSwitcherModifierEvent alloc] initWithAppLayout:v8 layoutRole:a4];
    }
    else {
      double v9 = [[SBTapAppLayoutSwitcherModifierEvent alloc] initWithAppLayout:v8 layoutRole:a4 modifierFlags:0];
    }
    id v11 = v9;
    [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v9];
  }
  else
  {
    id v10 = SBLogAppSwitcher();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBFluidSwitcherViewController overlayAccessoryView:didSelectHeaderForRole:](v6);
    }
  }
}

- (id)appLayoutsForSwitcherShelfViewController:(id)a3
{
  double v4 = [a3 shelf];
  id v5 = [v4 bundleIdentifier];

  id v6 = [(SBFluidSwitcherViewController *)self draggingAppLayoutsForWindowDrag];
  BOOL v7 = [(SBFluidSwitcherViewController *)self _unadjustedAppLayouts];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __74__SBFluidSwitcherViewController_appLayoutsForSwitcherShelfViewController___block_invoke;
  v12[3] = &unk_1E6AFA888;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = objc_msgSend(v7, "bs_filter:", v12);

  return v10;
}

uint64_t __74__SBFluidSwitcherViewController_appLayoutsForSwitcherShelfViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 containsItemWithBundleIdentifier:*(void *)(a1 + 32)]) {
    uint64_t v4 = [*(id *)(a1 + 40) containsObject:v3] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (int64_t)nextDisplayItemInteractionTimeForSwitcherShelfViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  int64_t v5 = [WeakRetained nextDisplayItemInteractionTimeForSwitcherContentController:self];

  return v5;
}

- (CGRect)switcherShelfViewController:(id)a3 frameForItemWithRole:(int64_t)a4 inMainAppLayout:(id)a5 interfaceOrientation:(int64_t)a6
{
  [(SBFluidSwitcherViewController *)self _frameForItemWithRole:a4 inMainAppLayout:a5 interfaceOrientation:a6];
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (CGRect)switcherShelfViewController:(id)a3 frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a4 floatingConfiguration:(int64_t)a5
{
  [(SBFluidSwitcherViewController *)self _frameForFloatingAppLayoutInInterfaceOrientation:a4 floatingConfiguration:a5];
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (CGRect)switcherShelfViewController:(id)a3 frameForCenterItemWithConfiguration:(int64_t)a4 interfaceOrientation:(int64_t)a5
{
  [(SBFluidSwitcherViewController *)self _frameForCenterItemInInterfaceOrientation:a5 centerConfiguration:a4];
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (id)switcherShelfViewController:(id)a3 transitionEventForContext:(id)a4 identifier:(id)a5 phase:(unint64_t)a6 animated:(BOOL)a7
{
  return [(SBFluidSwitcherViewController *)self _transitionEventForTransitionWithContext:a4 identifier:a5 phase:a6 animated:a7];
}

- (id)switcherShelfViewController:(id)a3 liveViewForAppLayout:(id)a4
{
  liveContentOverlays = self->_liveContentOverlays;
  double v5 = objc_msgSend(a4, "anyLeafAppLayout", a3);
  double v6 = [(NSMutableDictionary *)liveContentOverlays objectForKey:v5];

  if (objc_opt_respondsToSelector()) {
    double v7 = (void *)[v6 newPortaledLiveContentOverlayView];
  }
  else {
    double v7 = 0;
  }

  return v7;
}

- (BOOL)switcherShelfViewController:(id)a3 hitTestedToTopAffordance:(CGPoint)a4 window:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(SBFluidSwitcherViewController *)self layoutContext];
  uint64_t v12 = [v11 layoutState];

  id v13 = [v10 shelf];

  if (![v13 displayMode])
  {
    uint64_t v14 = [v12 appLayout];
    goto LABEL_7;
  }
  if ([v13 displayMode] == 1 && objc_msgSend(v13, "layoutRole") == 3)
  {
    uint64_t v14 = [v12 floatingAppLayout];
LABEL_7:
    double v16 = (void *)v14;
    goto LABEL_8;
  }
  uint64_t v15 = [v12 appLayout];
  double v16 = objc_msgSend(v15, "leafAppLayoutForRole:", objc_msgSend(v13, "layoutRole"));

LABEL_8:
  id v17 = [v16 anyLeafAppLayout];
  BOOL v18 = -[SBFluidSwitcherViewController _hitTestedToTopAffordance:window:forLeafAppLayout:](self, "_hitTestedToTopAffordance:window:forLeafAppLayout:", v9, v17, x, y);

  return v18;
}

- (void)pointerBeganResizingItemContainer:(id)a3
{
}

- (void)pointerEndedResizingItemContainer:(id)a3
{
  uint64_t v4 = (SBFluidSwitcherItemContainer *)a3;
  if (self->_itemContainerToResizeUsingPointer == v4)
  {
    self->_itemContainerToResizeUsingPointer = 0;
    double v5 = v4;

    uint64_t v4 = v5;
  }
}

- (void)killContainer:(id)a3 forReason:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v5 = [a3 appLayout];
  double v6 = [(SBFluidSwitcherViewController *)self delegate];
  double v7 = [(NSDictionary *)self->_leafAppLayoutsToRecencyAppLayouts objectForKey:v5];
  if ([v7 isCenterOverFull])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v8 = [v7 allItems];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          [v6 switcherContentController:self deletedDisplayItem:*(void *)(*((void *)&v15 + 1) + 8 * i) inAppLayout:v7 forReason:1];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    double v8 = [v5 itemForLayoutRole:1];
    [v6 switcherContentController:self deletedDisplayItem:v8 inAppLayout:v7 forReason:1];
    uint64_t v13 = [v7 layoutRoleForItem:v8];
    if (SBLayoutRoleIsValidForSplitView(v13))
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__SBFluidSwitcherViewController_killContainer_forReason___block_invoke;
      v14[3] = &unk_1E6AFA8B0;
      v14[4] = self;
      void v14[5] = v13;
      [v7 enumerate:v14];
    }
  }
}

void __57__SBFluidSwitcherViewController_killContainer_forReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 != a2)
  {
    id v8 = v5;
    BOOL IsValidForSplitView = SBLayoutRoleIsValidForSplitView(v6);
    id v5 = v8;
    if (IsValidForSplitView)
    {
      [*(id *)(*(void *)(a1 + 32) + 1048) reloadSnapshotForDisplayItem:v8];
      id v5 = v8;
    }
  }
}

- (BOOL)canSelectContainer:(id)a3 numberOfTaps:(int64_t)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  BOOL v7 = 1;
  char v15 = 1;
  if (a4 <= 1)
  {
    [(SBAppSwitcherScrollView *)self->_scrollView contentOffsetVelocity];
    if (fabs(v8) > 0.3) {
      *((unsigned char *)v13 + 24) = 0;
    }
    visibleItemContainers = self->_visibleItemContainers;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__SBFluidSwitcherViewController_canSelectContainer_numberOfTaps___block_invoke;
    v11[3] = &unk_1E6AFA8D8;
    void v11[4] = &v12;
    [(NSMutableDictionary *)visibleItemContainers enumerateKeysAndObjectsUsingBlock:v11];
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __65__SBFluidSwitcherViewController_canSelectContainer_numberOfTaps___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  [a3 killingProgress];
  uint64_t result = BSFloatIsZero();
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (void)containerSelectionStateChanged:(id)a3 toState:(int64_t)a4 hover:(BOOL)a5 pencilHover:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  int64_t v11 = a4 - 1;
  if (unint64_t)(a4 - 1) <= 4 && ((0x1Du >> v11))
  {
    uint64_t v12 = qword_1D8FD0CA8[v11];
    id v19 = v10;
    uint64_t v13 = [v10 appLayout];
    id v14 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v13];
    if (!v14) {
      id v14 = v13;
    }
    char v15 = [v13 allItems];
    long long v16 = [v15 firstObject];
    uint64_t v17 = [v14 layoutRoleForItem:v16];

    long long v18 = [[SBHighlightSwitcherModifierEvent alloc] initWithLayoutRole:v17 inAppLayout:v14 phase:v12 hover:v7 pencilHover:v6];
    [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v18];

    id v10 = v19;
  }
}

- (id)itemContainerToResizeUsingPointer
{
  return self->_itemContainerToResizeUsingPointer;
}

- (void)clientWithSceneIdentifier:(id)a3 suppressPreferredPointerLockStatusUpdated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(SBFluidSwitcherViewController *)self liveOverlayForSceneIdentifier:a3];
  BOOL v7 = [(NSMutableDictionary *)self->_liveContentOverlays allKeysForObject:v6];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [(SBFluidSwitcherViewController *)self _itemContainerForAppLayoutIfExists:*(void *)(*((void *)&v14 + 1) + 8 * v11)];
        uint64_t v13 = v12;
        if (v12) {
          [v12 setPreferredPointerLockStatusSuppressed:v4];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)didSelectContainer:(id)a3 modifierFlags:(int64_t)a4
{
  BOOL v6 = [a3 appLayout];
  if (v6)
  {
    id v16 = v6;
    BOOL v7 = [v6 itemForLayoutRole:1];
    uint64_t v8 = [v7 uniqueIdentifier];
    if (v8)
    {
      uint64_t v9 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
      uint64_t v10 = [v9 lockedPointerManager];
      uint64_t v11 = [v7 uniqueIdentifier];
      [v10 clientWithSceneIdentifier:v11 suppressPreferredLockStatus:0];
    }
    uint64_t v12 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v16];
    BOOL v13 = [(SBFluidSwitcherViewController *)self isChamoisWindowingUIEnabled];
    if ((a4 & 0x20000) != 0
      && v13
      && [(SBSwitcherModifier *)self->_rootModifier canSelectLeafWithModifierKeysInAppLayout:v12])
    {
      id v14 = v16;

      uint64_t v12 = v14;
    }
    long long v15 = -[SBTapAppLayoutSwitcherModifierEvent initWithAppLayout:layoutRole:modifierFlags:]([SBTapAppLayoutSwitcherModifierEvent alloc], "initWithAppLayout:layoutRole:modifierFlags:", v12, [v12 layoutRoleForItem:v7], a4);
    [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v15];

    BOOL v6 = v16;
  }
}

- (void)containerWillBeginSwipingToKill:(id)a3
{
  id v5 = [a3 appLayout];
  BOOL v4 = -[NSDictionary objectForKey:](self->_leafAppLayoutsToAdjustedAppLayouts, "objectForKey:");
  if (([(SBSwitcherModifier *)self->_rootModifier shouldTetherItemsAndAccessoriesInAppLayout:v4] & 1) == 0)[(SBFluidSwitcherViewController *)self _beginRequiringItemContainerShadowPathDisplayLinkForLeafAppLayout:v5 killing:1]; {
}
  }

- (void)containerDidEndSwipingToKill:(id)a3
{
  id v4 = [a3 appLayout];
  [(SBFluidSwitcherViewController *)self _stopRequiringItemContainerShadowPathDisplayLinkForLeafAppLayout:v4 killing:1];
}

- (void)scrollViewKillingProgressUpdated:(double)a3 translation:(CGPoint)a4 isDragging:(BOOL)a5 decelerationTargetProgress:(double)a6 forContainer:(id)a7
{
  BOOL v8 = a5;
  double y = a4.y;
  double x = a4.x;
  id v18 = [a7 appLayout];
  BOOL v13 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v18];
  id v14 = [v18 allItems];
  long long v15 = [v14 firstObject];
  uint64_t v16 = [v13 layoutRoleForItem:v15];

  long long v17 = -[SBSwipeToKillSwitcherModifierEvent initWithLayoutRole:inAppLayout:progress:translation:]([SBSwipeToKillSwitcherModifierEvent alloc], "initWithLayoutRole:inAppLayout:progress:translation:", v16, v13, a3, x, y);
  [(SBSwipeToKillSwitcherModifierEvent *)v17 setDragging:v8];
  [(SBSwipeToKillSwitcherModifierEvent *)v17 setDecelerationTargetProgress:a6];
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v17];
}

- (void)containerWillBeginAnimatingHighlight:(id)a3 scale:(double)a4 isTracking:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v8 = [a3 appLayout];
  uint64_t v9 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v8];
  if (([(SBSwitcherModifier *)self->_rootModifier shouldTetherItemsAndAccessoriesInAppLayout:v9] & 1) == 0)[(SBFluidSwitcherViewController *)self _beginRequiringItemContainerShadowPathDisplayLinkForLeafAppLayout:v8 killing:0]; {
  if ([(SBSwitcherModifier *)self->_rootModifier shouldTetherItemsAndAccessoriesInAppLayout:v9])
  }
  {
    long long v17 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews objectForKey:v9];
    [v17 setContentViewScale:a4];
    uint64_t v16 = [(NSMutableDictionary *)self->_visibleUnderlayAccessoryViews objectForKey:v9];
    [v16 setContentViewScale:a4];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = [v9 leafAppLayouts];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          if (*(void **)(*((void *)&v18 + 1) + 8 * v14) != v8)
          {
            long long v15 = -[NSMutableDictionary objectForKey:](self->_visibleItemContainers, "objectForKey:");
            [v15 setLifted:v5];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
}

- (void)containerDidEndAnimatingHighlight:(id)a3 scale:(double)a4
{
  objc_msgSend(a3, "appLayout", a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SBFluidSwitcherViewController *)self _stopRequiringItemContainerShadowPathDisplayLinkForLeafAppLayout:v5 killing:0];
}

- (BOOL)isLocationInSafeArea:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v5 = [(SBFluidSwitcherViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v5 safeAreaInsets];
  CGFloat v15 = v9 + v14;
  CGFloat v18 = v11 - (v16 + v17);
  v23.size.CGFloat height = v13 - (v14 + v19);
  v23.origin.CGFloat x = v7 + v16;
  v23.origin.CGFloat y = v15;
  v23.size.CGFloat width = v18;
  v22.CGFloat x = x;
  v22.CGFloat y = y;
  BOOL v20 = CGRectContainsPoint(v23, v22);

  return v20;
}

- (void)container:(id)a3 didBecomeFocused:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = [a3 appLayout];
  if (v6)
  {
    double v10 = v6;
    uint64_t v7 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKeyedSubscript:v6];
    double v6 = v10;
    if (v7)
    {
      double v8 = (void *)v7;
      double v9 = [[SBUpdateFocusedAppLayoutSwitcherModifierEvent alloc] initWithAppLayout:v7 focused:v4];
      [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v9];

      double v6 = v10;
    }
  }
}

- (BOOL)isAppLayoutMostRecentRepresentationOfDisplayItems:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 7455, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
  }
  double v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = [v5 allItems];
  double v8 = [v6 setWithArray:v7];

  double v9 = [(SBFluidSwitcherViewController *)self _unadjustedAppLayouts];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__SBFluidSwitcherViewController_isAppLayoutMostRecentRepresentationOfDisplayItems___block_invoke;
  v15[3] = &unk_1E6AF4B60;
  id v16 = v8;
  id v10 = v8;
  double v11 = objc_msgSend(v9, "bs_firstObjectPassingTest:", v15);

  if (v11) {
    char v12 = [v11 isOrContainsAppLayout:v5];
  }
  else {
    char v12 = 1;
  }

  return v12;
}

uint64_t __83__SBFluidSwitcherViewController_isAppLayoutMostRecentRepresentationOfDisplayItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsAnyItemFromSet:*(void *)(a1 + 32)];
}

- (BOOL)displayItemSupportsMedusa:(id)a3
{
  id v3 = [(SBFluidSwitcherViewController *)self _applicationForDisplayItem:a3];
  char v4 = [v3 isMedusaCapable];

  return v4;
}

- (BOOL)displayItemSupportsCenterRole:(id)a3
{
  id v4 = a3;
  if ([(SBFluidSwitcherViewController *)self isChamoisWindowingUIEnabled])
  {
    char v5 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v7 = WeakRetained;
    if ((*((unsigned char *)&self->_dataSourceRespondsTo + 2) & 0x20) != 0) {
      char v5 = [WeakRetained switcherContentController:self displayItemSupportsCenterRole:v4];
    }
    else {
      char v5 = 0;
    }
  }
  return v5;
}

- (BOOL)hitTestedToTopAffordance:(CGPoint)a3 window:(id)a4 ofItemContainer:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = [a5 appLayout];
  LOBYTE(self) = -[SBFluidSwitcherViewController _hitTestedToTopAffordance:window:forLeafAppLayout:](self, "_hitTestedToTopAffordance:window:forLeafAppLayout:", v9, v10, x, y);

  return (char)self;
}

- (BOOL)hitTestedToFloatingElement:(CGPoint)a3 window:(id)a4 ofItemContainer:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [v7 screen];
  id v9 = [v8 fixedCoordinateSpace];

  objc_msgSend(v7, "convertPoint:toCoordinateSpace:", v9, x, y);
  double v11 = v10;
  double v13 = v12;
  double v14 = [v7 _sbWindowScene];

  CGFloat v15 = [v14 floatingDockController];
  char v16 = objc_msgSend(v15, "containsPoint:fromCoordinateSpace:", v9, v11, v13);

  double v17 = [v14 pictureInPictureManager];
  char v18 = objc_msgSend(v17, "isPointWithinAnyPictureInPictureContent:", v11, v13);

  double v19 = [(id)SBApp bannerManager];
  char v20 = objc_msgSend(v19, "pointInsideBanner:inWindowScene:", v14, v11, v13);

  return v16 | v18 | v20;
}

- (void)prepareForCoordinatedLayoutStateTransitionWithContext:(id)a3
{
}

- (void)cleanUpAfterCoordinatedLayoutStateTransitionWithContext:(id)a3
{
}

- (void)gestureHandlingModifierRequestsUpdate:(id)a3
{
  id v6 = [(SBFluidSwitcherViewController *)self _gestureManager];
  id v4 = [(SBFluidSwitcherViewController *)self layoutContext];
  char v5 = [v4 activeGesture];
  [(SBFluidSwitcherViewController *)self handleFluidSwitcherGestureManager:v6 didUpdateGesture:v5];
}

- (CGPoint)gestureHandlingModifier:(id)a3 averageVelocityOverDuration:(double)a4
{
  char v5 = [(SBFluidSwitcherViewController *)self layoutContext];
  id v6 = [v5 activeGesture];
  id v7 = [v6 gestureEvent];

  [v7 averageTouchVelocityOverTimeDuration:a4];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  double v11 = (SBFHomeGrabberSettings *)a3;
  char v5 = +[SBHomeGestureDomain rootSettings];
  id v6 = +[SBMedusaDomain rootSettings];
  if (v5 == v11)
  {
    double v10 = SBHomeGestureSettingsChangedSwitcherModifierEvent;
    goto LABEL_8;
  }
  if (v6 == v11 || self->_homeGrabberSettings == v11)
  {
    double v10 = SBMedusaSettingsChangedSwitcherModifierEvent;
LABEL_8:
    id v9 = objc_alloc_init(v10);
    [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v9];
    goto LABEL_9;
  }
  id v7 = [(SBAppSwitcherSettings *)self->_settings chamoisSettings];

  if (v7 != v11) {
    goto LABEL_10;
  }
  [(SBFluidSwitcherViewController *)self _updateContentViewSublayerTransform];
  double v8 = [(SBFluidSwitcherViewController *)self view];
  [v8 setNeedsLayout];

  id v9 = [(SBFluidSwitcherViewController *)self view];
  [v9 layoutIfNeeded];
LABEL_9:

LABEL_10:
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  if (self->_settings == a3)
  {
    char v5 = objc_alloc_init(SBSwitcherSettingsChangedSwitcherModifierEvent);
    [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v5];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__SBFluidSwitcherViewController_settings_changedValueForKeyPath___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __65__SBFluidSwitcherViewController_settings_changedValueForKeyPath___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewIfLoaded];
  [v1 setNeedsLayout];
}

- (void)_scrollToAppLayout:(id)a3 animated:(BOOL)a4 alignment:(int64_t)a5 completion:(id)a6
{
  BOOL v7 = a4;
  double v13 = (void (**)(id, uint64_t))a6;
  id v10 = a3;
  double v11 = [(SBFluidSwitcherViewController *)self appLayouts];
  uint64_t v12 = [v11 indexOfObject:v10];

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v13) {
      v13[2](v13, 1);
    }
  }
  else
  {
    [(SBFluidSwitcherViewController *)self _updateScrollViewSizeAndSpacing];
    [(SBSwitcherModifier *)self->_rootModifier contentOffsetForIndex:v12 alignment:a5];
    -[BSUIScrollView setContentOffset:animated:completion:](self->_scrollView, "setContentOffset:animated:completion:", v7, v13);
  }
}

- (id)_createWorkspaceTransientOverlayForAppLayout:(id)a3
{
  id v4 = a3;
  char v5 = [(SBFluidSwitcherViewController *)self dataSource];
  id v6 = v5;
  if ((*(unsigned char *)&self->_dataSourceRespondsTo & 0x40) != 0)
  {
    BOOL v7 = [v5 createWorkspaceTransientOverlayForAppLayout:v4];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_configureTransitionRequestForGestureBegin:(id)a3
{
  id v4 = a3;
  char v5 = [(SBFluidSwitcherViewController *)self _activeTransientOverlayPresentedAppLayout];
  if (v5
    && ([(SBFluidSwitcherViewController *)self _createWorkspaceTransientOverlayForAppLayout:v5], (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__SBFluidSwitcherViewController__configureTransitionRequestForGestureBegin___block_invoke;
    v8[3] = &unk_1E6AF8040;
    id v9 = v6;
    id v7 = v6;
    [v4 modifyTransientOverlayContext:v8];
  }
  else
  {
    [v4 setTransientOverlayContext:0];
  }
}

void __76__SBFluidSwitcherViewController__configureTransitionRequestForGestureBegin___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTransitionType:1];
  [v3 setTransientOverlay:*(void *)(a1 + 32)];
}

- (id)appLayoutAtLocation:(CGPoint)a3 withDraggedItem:(id)a4 environment:(int64_t)a5
{
  id v6 = -[SBFluidSwitcherViewController _itemContainerAtLocation:ignoringDraggedItem:environment:](self, "_itemContainerAtLocation:ignoringDraggedItem:environment:", a4, a5, a3.x, a3.y);
  leafAppLayoutsToAdjustedAppLayouts = self->_leafAppLayoutsToAdjustedAppLayouts;
  double v8 = [v6 appLayout];
  id v9 = [(NSDictionary *)leafAppLayoutsToAdjustedAppLayouts objectForKey:v8];

  return v9;
}

- (id)_itemContainerAtLocation:(CGPoint)a3 ignoringDraggedItem:(id)a4 environment:(int64_t)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  [(SBFluidSwitcherViewController *)self _unadjustedLeafAppLayouts];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v26 = v27 = self;
  id v10 = [(SBFluidSwitcherContentView *)self->_contentView subviews];
  double v11 = [v10 reverseObjectEnumerator];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        char v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v17 = objc_opt_class();
        char v18 = SBSafeCast(v17, v16);
        double v19 = v18;
        if (v18)
        {
          if (!v9
            || ([v18 appLayout],
                char v20 = objc_claimAutoreleasedReturnValue(),
                char v21 = [v20 containsItem:v9],
                v20,
                (v21 & 1) == 0))
          {
            CGPoint v22 = [v19 appLayout];
            CGRect v23 = v22;
            if ((!a5 || [v22 environment] == a5)
              && ([v19 isDeceleratingTowardsKillZone] & 1) == 0)
            {
              -[SBFluidSwitcherContentView convertPoint:toView:](v27->_contentView, "convertPoint:toView:", v19, x, y);
              if (objc_msgSend(v19, "pointInside:withEvent:", 0))
              {
                if (([v26 containsObject:v23] & 1) != 0
                  || [(SBFluidSwitcherViewController *)v27 isChamoisWindowingUIEnabled]
                  && [(NSArray *)v27->_cachedAdjustedLeafAppLayouts containsObject:v23])
                {
                  id v24 = v19;

                  goto LABEL_21;
                }
              }
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  id v24 = 0;
LABEL_21:

  return v24;
}

- (id)_itemContainerAtLocation:(CGPoint)a3 environment:(int64_t)a4
{
  return -[SBFluidSwitcherViewController _itemContainerAtLocation:ignoringDraggedItem:environment:](self, "_itemContainerAtLocation:ignoringDraggedItem:environment:", 0, a4, a3.x, a3.y);
}

- (id)_itemContainerNearestLocation:(CGPoint)a3 environment:(int64_t)a4 prioritizeForegroundedItemContainers:(BOOL)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = [(NSMutableDictionary *)self->_visibleItemContainers allValues];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __112__SBFluidSwitcherViewController__itemContainerNearestLocation_environment_prioritizeForegroundedItemContainers___block_invoke;
  v15[3] = &__block_descriptor_41_e38_B16__0__SBFluidSwitcherItemContainer_8l;
  void v15[4] = a4;
  BOOL v16 = a5;
  id v10 = objc_msgSend(v9, "bs_filter:", v15);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __112__SBFluidSwitcherViewController__itemContainerNearestLocation_environment_prioritizeForegroundedItemContainers___block_invoke_2;
  v14[3] = &__block_descriptor_48_e71_q24__0__SBFluidSwitcherItemContainer_8__SBFluidSwitcherItemContainer_16l;
  *(CGFloat *)&v14[4] = x;
  *(CGFloat *)&void v14[5] = y;
  double v11 = [v10 sortedArrayUsingComparator:v14];
  uint64_t v12 = [v11 firstObject];

  return v12;
}

BOOL __112__SBFluidSwitcherViewController__itemContainerNearestLocation_environment_prioritizeForegroundedItemContainers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 appLayout];
  uint64_t v5 = [v4 environment];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5 == v6 || v6 == 0)
  {
    if ([v3 isOccludedInContinuousExposeStage]) {
      BOOL v8 = *(unsigned char *)(a1 + 40) == 0;
    }
    else {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __112__SBFluidSwitcherViewController__itemContainerNearestLocation_environment_prioritizeForegroundedItemContainers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  [v6 frame];
  double v8 = v7;
  [v6 frame];
  hypot(v8 - *(double *)(a1 + 32), v9 + v10 - *(double *)(a1 + 40));
  [v6 frame];
  double v13 = v11 + v12;
  [v6 frame];
  hypot(v13 - *(double *)(a1 + 32), v14 + v15 - *(double *)(a1 + 40));
  [v6 frame];
  double v17 = v16;
  [v6 frame];
  hypot(v17 - *(double *)(a1 + 32), v18 - *(double *)(a1 + 40));
  [v6 frame];
  double v21 = v19 + v20;
  [v6 frame];
  double v23 = v22;

  hypot(v21 - *(double *)(a1 + 32), v23 - *(double *)(a1 + 40));
  [v5 frame];
  double v25 = v24;
  [v5 frame];
  hypot(v25 - *(double *)(a1 + 32), v26 + v27 - *(double *)(a1 + 40));
  [v5 frame];
  double v30 = v28 + v29;
  [v5 frame];
  hypot(v30 - *(double *)(a1 + 32), v31 + v32 - *(double *)(a1 + 40));
  [v5 frame];
  double v34 = v33;
  [v5 frame];
  hypot(v34 - *(double *)(a1 + 32), v35 - *(double *)(a1 + 40));
  [v5 frame];
  double v38 = v36 + v37;
  [v5 frame];
  double v40 = v39;

  hypot(v38 - *(double *)(a1 + 32), v40 - *(double *)(a1 + 40));
  if (BSFloatGreaterThanFloat()) {
    return 1;
  }
  else {
    return BSFloatLessThanFloat() << 63 >> 63;
  }
}

- (id)appLayoutForLeafAppLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_leafAppLayoutsToRecencyAppLayouts objectForKey:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(SBFluidSwitcherViewController *)self adjustedAppLayoutForLeafAppLayout:v4];
  }
  double v8 = v7;

  return v8;
}

- (id)adjustedAppLayoutForLeafAppLayout:(id)a3
{
  return [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:a3];
}

- (id)_leafAppLayoutForItemContainerAtLocation:(CGPoint)a3 environment:(int64_t)a4
{
  id v4 = -[SBFluidSwitcherViewController _itemContainerAtLocation:environment:](self, "_itemContainerAtLocation:environment:", a4, a3.x, a3.y);
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 appLayout];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_adjustedAppLayoutForItemContainerAtLocation:(CGPoint)a3 environment:(int64_t)a4
{
  id v5 = -[SBFluidSwitcherViewController _leafAppLayoutForItemContainerAtLocation:environment:](self, "_leafAppLayoutForItemContainerAtLocation:environment:", a4, a3.x, a3.y);
  if (v5)
  {
    id v6 = [(NSDictionary *)self->_leafAppLayoutsToAdjustedAppLayouts objectForKey:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_appLayoutForWorkspaceTransientOverlay:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFluidSwitcherViewController *)self dataSource];
  id v6 = v5;
  if ((*(unsigned char *)&self->_dataSourceRespondsTo & 0x10) != 0)
  {
    id v7 = [v5 appLayoutForWorkspaceTransientOverlay:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_isAppLayoutBlurred:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBFluidSwitcherViewController *)self appLayouts];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v7 = 0;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v8 = objc_msgSend(v4, "leafAppLayouts", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) allItems];
          double v14 = [v13 firstObject];
          uint64_t v15 = [v4 layoutRoleForItem:v14];

          if ([(SBSwitcherModifier *)self->_rootModifier isLayoutRoleBlurred:v15 inAppLayout:v4])
          {
            BOOL v7 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v7 = 0;
LABEL_13:
  }
  return v7;
}

- (id)_proposedAppLayoutForWindowDrag
{
  return (id)[(SBSwitcherModifier *)self->_rootModifier proposedAppLayoutForWindowDrag];
}

- (BOOL)_areContinuousExposeStripsUnoccluded
{
  return [(SBSwitcherModifier *)self->_rootModifier isContinuousExposeStripVisible];
}

- (BOOL)_appLayoutRequiresLegacyRotationSupport:(id)a3
{
  liveContentOverlays = self->_liveContentOverlays;
  id v4 = [a3 anyLeafAppLayout];
  id v5 = [(NSMutableDictionary *)liveContentOverlays objectForKey:v4];

  if (v5) {
    char v6 = [v5 requiresLegacyRotationSupport];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

uint64_t __60__SBFluidSwitcherViewController__updateAnimatableProperties__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __60__SBFluidSwitcherViewController__updateAnimatableProperties__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

void __60__SBFluidSwitcherViewController__updateAnimatableProperties__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = objc_alloc_init(SBAnimatablePropertyChangedSwitcherModifierEvent);
    [WeakRetained _dispatchEventAndHandleAction:v1];
  }
}

uint64_t __60__SBFluidSwitcherViewController__updateAnimatableProperties__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:*(double *)(a1 + 40)];
}

- (void)_beginRequiringItemContainerShadowPathDisplayLinkForLeafAppLayout:(id)a3 killing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    uint64_t v9 = @"highlighting";
    if (v4) {
      uint64_t v9 = @"killing";
    }
    uint64_t v10 = [NSString stringWithFormat:@"%@ %p", v9, v6];
    uint64_t v11 = SBLogAppSwitcher();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v16 = v10;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Begin requiring shadow path display link for reason: %@", buf, 0xCu);
    }

    shadowPathDisplayLinkRequiringReasons = self->_shadowPathDisplayLinkRequiringReasons;
    if (!shadowPathDisplayLinkRequiringReasons)
    {
      double v13 = (NSCountedSet *)objc_opt_new();
      double v14 = self->_shadowPathDisplayLinkRequiringReasons;
      self->_shadowPathDisplayLinkRequiringReasons = v13;

      shadowPathDisplayLinkRequiringReasons = self->_shadowPathDisplayLinkRequiringReasons;
    }
    [(NSCountedSet *)shadowPathDisplayLinkRequiringReasons addObject:v10];
    [(SBFluidSwitcherViewController *)self _updateShadowPathDisplayLink];
  }
}

- (void)_stopRequiringItemContainerShadowPathDisplayLinkForLeafAppLayout:(id)a3 killing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    uint64_t v9 = @"highlighting";
    if (v4) {
      uint64_t v9 = @"killing";
    }
    uint64_t v10 = [NSString stringWithFormat:@"%@ %p", v9, v6];
    uint64_t v11 = SBLogAppSwitcher();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v13 = v10;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "End requiring shadow path display link for reason: %@", buf, 0xCu);
    }

    [(NSCountedSet *)self->_shadowPathDisplayLinkRequiringReasons removeObject:v10];
    [(SBFluidSwitcherViewController *)self _updateShadowPathDisplayLink];
  }
}

- (void)_updateShadowPathDisplayLink
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(NSCountedSet *)self->_shadowPathDisplayLinkRequiringReasons count] && !self->_shadowPathDisplayLink)
  {
    uint64_t v11 = SBLogAppSwitcher();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Creating shadow path display link", buf, 2u);
    }

    double v12 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__shadowPathDisplayLinkDidUpdate_];
    shadowPathDisplayLinuint64_t k = self->_shadowPathDisplayLink;
    self->_shadowPathDisplayLinuint64_t k = v12;
    goto LABEL_18;
  }
  if (![(NSCountedSet *)self->_shadowPathDisplayLinkRequiringReasons count] && self->_shadowPathDisplayLink)
  {
    [(SBFluidSwitcherViewController *)self _resetItemContainerShadowPathDisplayLink];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    shadowPathDisplayLinuint64_t k = [(NSMutableDictionary *)self->_visibleUnderlayAccessoryViews allKeys];
    uint64_t v4 = [shadowPathDisplayLink countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(shadowPathDisplayLink);
          }
          uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v9 = [(SBFluidSwitcherViewController *)self appLayouts];
          uint64_t v10 = [v9 indexOfObject:v8];

          if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
            [(SBFluidSwitcherViewController *)self _updateShadowPathForIndex:v10];
          }
        }
        uint64_t v5 = [shadowPathDisplayLink countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v5);
    }
LABEL_18:
  }
}

- (void)_shadowPathDisplayLinkDidUpdate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_visibleUnderlayAccessoryViews allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        uint64_t v10 = [(SBFluidSwitcherViewController *)self appLayouts];
        uint64_t v11 = [v10 indexOfObject:v9];

        if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
          [(SBFluidSwitcherViewController *)self _updateShadowPathForIndex:v11];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_updateShadowPathForIndex:(unint64_t)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(SBFluidSwitcherViewController *)self appLayouts];
  unint64_t v37 = a3;
  uint64_t v6 = [v5 objectAtIndex:a3];

  double v35 = [(NSMutableDictionary *)self->_visibleUnderlayAccessoryViews objectForKey:v6];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [v6 leafAppLayouts];
  uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v39;
    double v11 = *MEMORY[0x1E4F1DAD8];
    double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        long long v15 = [(NSMutableDictionary *)self->_visibleItemContainers objectForKey:v14];
        if (v15)
        {
          long long v16 = [v14 itemForLayoutRole:1];
          uint64_t v17 = [v6 layoutRoleForItem:v16];

          [v15 effectivePageViewPresentationFrame];
          double v19 = v18;
          double v21 = v20;
          double v23 = v22;
          double v25 = v24;
          if ([(SBSwitcherModifier *)self->_rootModifier shouldTetherItemsAndAccessoriesInAppLayout:v6])
          {
            double v21 = v12;
            double v19 = v11;
          }
          [(SBSwitcherModifier *)self->_rootModifier frameForIndex:v37];
          rootModifier = self->_rootModifier;
          SBRectWithSize();
          -[SBSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](rootModifier, "frameForLayoutRole:inAppLayout:withBounds:", v17, v6);
          double v28 = v19 + v27;
          double v30 = v21 + v29;
          [v15 effectivePageViewPresentationCornerRadius];
          if (v17 == 1) {
            uint64_t v32 = 5;
          }
          else {
            uint64_t v32 = 10;
          }
          double v33 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v32, v28, v30, v23, v25, v31, v31);
          double v34 = v33;
          if (v9) {
            [v9 appendPath:v33];
          }
          else {
            id v9 = v33;
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  [v35 setShadowPath:v9];
}

- (id)snapshotCache
{
  return self->_snapshotCache;
}

- (void)setShelfFocusedDisplayItems:(id)a3
{
  id v7 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    uint64_t v4 = (NSSet *)[v7 copy];
    shelfFocusedDisplayItems = self->_shelfFocusedDisplayItems;
    self->_shelfFocusedDisplayItems = v4;

    uint64_t v6 = objc_alloc_init(SBShelfFocusedDisplayItemsChangedEvent);
    [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v6];
  }
}

double __68__SBFluidSwitcherViewController__updateSwitcherBackdropViewPresence__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v1 = objc_msgSend(v0, "sbf_animatedBlurRadiusGraphicsQuality");

  double result = 0.3;
  if (v1 >= 41) {
    return 0.5;
  }
  return result;
}

uint64_t __63__SBFluidSwitcherViewController__updateSlideOverTonguePresence__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutSlideoverTonguesWithCompletion:0];
  double v2 = *(void **)(a1 + 32);
  return [v2 _ensureSubviewOrdering];
}

uint64_t __58__SBFluidSwitcherViewController__updateBezelEffectsPortal__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F43298]) initWithSourceView:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 1448);
  *(void *)(v3 + 1448) = v2;

  [*(id *)(*(void *)(a1 + 32) + 1448) setMatchesPosition:1];
  [*(id *)(*(void *)(a1 + 32) + 1448) setMatchesAlpha:1];
  [*(id *)(*(void *)(a1 + 32) + 1448) setMatchesTransform:1];
  [*(id *)(*(void *)(a1 + 32) + 1448) setAllowsBackdropGroups:1];
  [*(id *)(*(void *)(a1 + 32) + 1448) setHidesSourceView:1];
  [*(id *)(*(void *)(a1 + 32) + 1448) setAllowsHitTesting:1];
  [*(id *)(*(void *)(a1 + 32) + 1816) addSubview:*(void *)(*(void *)(a1 + 32) + 1448)];
  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 _ensureSubviewOrdering];
}

void __58__SBFluidSwitcherViewController__updateBezelEffectsPortal__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateBezelEffectsPortal];
}

uint64_t __137__SBFluidSwitcherViewController__updateItemContainerBackdropPresenceForIndex_scale_rotation_cornerRadius_animationAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  [*(id *)(a1 + 32) frame];
  UIRectGetCenter();
  objc_msgSend(v2, "setCenter:");
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  return objc_msgSend(v3, "setBounds:", v4, v5, v6, v7);
}

void __137__SBFluidSwitcherViewController__updateItemContainerBackdropPresenceForIndex_scale_rotation_cornerRadius_animationAttributes_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setAlpha:0.8];
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  long long v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  [v2 setTransform:v5];
  double v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) layer];
  [v4 setCornerRadius:*(double *)(a1 + 88)];
}

uint64_t __137__SBFluidSwitcherViewController__updateItemContainerBackdropPresenceForIndex_scale_rotation_cornerRadius_animationAttributes_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __137__SBFluidSwitcherViewController__updateItemContainerBackdropPresenceForIndex_scale_rotation_cornerRadius_animationAttributes_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  [*(id *)(a1 + 32) frame];
  UIRectGetCenter();
  return objc_msgSend(v1, "setCenter:");
}

void __137__SBFluidSwitcherViewController__updateItemContainerBackdropPresenceForIndex_scale_rotation_cornerRadius_animationAttributes_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setAlpha:0.0];
  if (!*(unsigned char *)(a1 + 96))
  {
    uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    long long v3 = *(_OWORD *)(a1 + 56);
    v5[0] = *(_OWORD *)(a1 + 40);
    v5[1] = v3;
    v5[2] = *(_OWORD *)(a1 + 72);
    [v2 setTransform:v5];
    double v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) layer];
    [v4 setCornerRadius:*(double *)(a1 + 88)];
  }
}

uint64_t __137__SBFluidSwitcherViewController__updateItemContainerBackdropPresenceForIndex_scale_rotation_cornerRadius_animationAttributes_completion___block_invoke_6(void *a1, uint64_t a2, char a3)
{
  [*(id *)(a1[4] + 1872) removeObject:*(void *)(*(void *)(a1[6] + 8) + 40)];
  if ((a3 & 1) == 0)
  {
    double v5 = *(void **)(a1[4] + 1864);
    double v6 = [NSNumber numberWithUnsignedInteger:a1[7]];
    [v5 removeObjectForKey:v6];

    [*(id *)(*(void *)(a1[6] + 8) + 40) setHidden:1];
    [*(id *)(*(void *)(a1[6] + 8) + 40) removeFromSuperview];
    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
  uint64_t result = a1[5];
  if (result)
  {
    uint64_t v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

- (void)_updateSnapshotCacheReloadingForActiveInterfaceOrientationChange
{
  long long v3 = [(SBFluidSwitcherViewController *)self dataSource];
  if (v3 && (*((unsigned char *)&self->_dataSourceRespondsTo + 2) & 4) != 0)
  {
    id v4 = v3;
    -[SBAppSwitcherSnapshotImageCache setReloadsSnapshotsForActiveInterfaceOrientationChange:](self->_snapshotCache, "setReloadsSnapshotsForActiveInterfaceOrientationChange:", [v3 switcherContentControllerReloadsSnapshotsForActiveInterfaceOrientationChange:self]);
    long long v3 = v4;
  }
}

- (CGRect)_frameForItemWithRole:(int64_t)a3 inMainAppLayout:(id)a4 interfaceOrientation:(int64_t)a5
{
  id v8 = a4;
  id v9 = [(SBFluidSwitcherViewController *)self dataSource];
  [v9 switcherContentController:self frameForItemWithRole:a3 inMainAppLayout:v8 interfaceOrientation:a5];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGRect)_frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4
{
  uint64_t v7 = [(SBFluidSwitcherViewController *)self dataSource];
  id v8 = v7;
  if (*((unsigned char *)&self->_dataSourceRespondsTo + 1))
  {
    [v7 switcherContentController:self frameForFloatingAppLayoutInInterfaceOrientation:a3 floatingConfiguration:a4];
    double v9 = v13;
    double v10 = v14;
    double v11 = v15;
    double v12 = v16;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB20];
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v17 = v9;
  double v18 = v10;
  double v19 = v11;
  double v20 = v12;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (CGRect)_frameForCenterItemInInterfaceOrientation:(int64_t)a3 centerConfiguration:(int64_t)a4
{
  uint64_t v7 = [(SBFluidSwitcherViewController *)self dataSource];
  id v8 = v7;
  if ((*((unsigned char *)&self->_dataSourceRespondsTo + 1) & 2) != 0)
  {
    [v7 switcherContentController:self frameForCenterItemWithConfiguration:a4 interfaceOrientation:a3];
    double v9 = v13;
    double v10 = v14;
    double v11 = v15;
    double v12 = v16;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v17 = v9;
  double v18 = v10;
  double v19 = v11;
  double v20 = v12;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (id)_unadjustedLeafAppLayouts
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(SBFluidSwitcherViewController *)self _unadjustedAppLayouts];
  long long v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "leafAppLayouts", (void)v11);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_updateContinuousExposeIdentifiersTransitioningFromAppLayout:(id)a3 toAppLayout:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v24 = a3;
  id v8 = a4;
  if ([(SBFluidSwitcherViewController *)self isChamoisWindowingUIEnabled])
  {
    continuousExposeIdentifiersInSwitcher = self->_continuousExposeIdentifiersInSwitcher;
    double v10 = (NSArray *)MEMORY[0x1E4F1CBF0];
    if (!continuousExposeIdentifiersInSwitcher) {
      continuousExposeIdentifiersInSwitcher = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    long long v11 = continuousExposeIdentifiersInSwitcher;
    continuousExposeIdentifiersInStrip = self->_continuousExposeIdentifiersInStrip;
    if (!continuousExposeIdentifiersInStrip) {
      continuousExposeIdentifiersInStrip = v10;
    }
    long long v13 = continuousExposeIdentifiersInStrip;
    long long v14 = [(SBSwitcherModifier *)self->_rootModifier adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:v13];
    double v15 = self->_continuousExposeIdentifiersInStrip;
    self->_continuousExposeIdentifiersInStrip = v14;

    uint64_t v16 = [(SBSwitcherModifier *)self->_rootModifier adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:v11 identifiersInStrip:self->_continuousExposeIdentifiersInStrip];
    double v17 = self->_continuousExposeIdentifiersInSwitcher;
    self->_continuousExposeIdentifiersInSwitcher = v16;

    [(SBFluidSwitcherViewController *)self newContinuousExposeIdentifiersGenerationCount];
    appLayoutsForContinuousExposeIdentifiers = self->_appLayoutsForContinuousExposeIdentifiers;
    self->_appLayoutsForContinuousExposeIdentifiers = 0;

    double v19 = [SBContinuousExposeIdentifiersChangedModifierEvent alloc];
    double v20 = [(SBFluidSwitcherLayoutContext *)self->_layoutContext activeGesture];
    if (v20)
    {
      double v21 = [(SBContinuousExposeIdentifiersChangedModifierEvent *)v19 initWithPreviousContinuousExposeIdentifiersInSwitcher:v11 previousContinuousExposeIdentifiersInStrip:v13 transitioningFromAppLayout:v24 transitioningToAppLayout:v8 animated:v5 gestureInitiated:1];
    }
    else
    {
      double v22 = [(SBFluidSwitcherLayoutContext *)self->_layoutContext activeTransitionContext];
      double v23 = [v22 request];
      double v21 = -[SBContinuousExposeIdentifiersChangedModifierEvent initWithPreviousContinuousExposeIdentifiersInSwitcher:previousContinuousExposeIdentifiersInStrip:transitioningFromAppLayout:transitioningToAppLayout:animated:gestureInitiated:](v19, "initWithPreviousContinuousExposeIdentifiersInSwitcher:previousContinuousExposeIdentifiersInStrip:transitioningFromAppLayout:transitioningToAppLayout:animated:gestureInitiated:", v11, v13, v24, v8, v5, [v23 source] == 11);
    }
    [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v21];
  }
}

- (void)_updateReopenClosedWindowsButtonText
{
  if (self->_reopenClosedWindowsButton)
  {
    long long v3 = [(SBSwitcherModifier *)self->_rootModifier appExposeAccessoryButtonsBundleIdentifier];
    if (v3)
    {
      double v9 = v3;
      int64_t v4 = [(SBFluidSwitcherViewController *)self numberOfHiddenAppLayoutsForBundleIdentifier:v3];
      BOOL v5 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v6 = v5;
      if (v4 == 1) {
        uint64_t v7 = @"REOPEN_CLOSED_WINDOW";
      }
      else {
        uint64_t v7 = @"REOPEN_CLOSED_WINDOWS";
      }
      id v8 = [v5 localizedStringForKey:v7 value:&stru_1F3084718 table:@"SpringBoard"];

      [(SBFluidSwitcherTitledButton *)self->_reopenClosedWindowsButton setTitle:v8];
      long long v3 = v9;
    }
  }
}

- (void)_updateAppExposeAccessoryButtonsExtendedTouchRegions
{
  reopenClosedWindowsButtouint64_t n = self->_reopenClosedWindowsButton;
  double v4 = 17.0;
  double v5 = 17.0;
  if (reopenClosedWindowsButton)
  {
    [(SBFluidSwitcherTitledButton *)reopenClosedWindowsButton alpha];
    if (BSFloatIsZero()) {
      double v5 = 17.0;
    }
    else {
      double v5 = 8.0;
    }
  }
  plusButtouint64_t n = self->_plusButton;
  uint64_t v7 = (id *)MEMORY[0x1E4F43630];
  if (plusButton)
  {
    [(SBFluidSwitcherButton *)plusButton alpha];
    double v4 = BSFloatIsZero() ? 17.0 : 8.0;
    if (self->_plusButton)
    {
      uint64_t v8 = [*v7 userInterfaceLayoutDirection];
      if (v8 == 1) {
        double v9 = v5;
      }
      else {
        double v9 = 17.0;
      }
      if (v8 == 1) {
        double v10 = 17.0;
      }
      else {
        double v10 = v5;
      }
      -[SBFluidSwitcherButton setExtendedEdgeInsets:](self->_plusButton, "setExtendedEdgeInsets:", -17.0, -v10, -17.0, -v9);
    }
  }
  if (self->_reopenClosedWindowsButton)
  {
    uint64_t v11 = [*v7 userInterfaceLayoutDirection];
    double v12 = 17.0;
    if (v11 == 1) {
      double v13 = v4;
    }
    else {
      double v13 = 17.0;
    }
    if (v11 != 1) {
      double v12 = v4;
    }
    long long v14 = self->_reopenClosedWindowsButton;
    double v15 = -v13;
    -[SBFluidSwitcherButton setExtendedEdgeInsets:](v14, "setExtendedEdgeInsets:", -17.0, v15, -17.0, -v12);
  }
}

uint64_t __75__SBFluidSwitcherViewController__updatePlusButtonStyleWithMode_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1928), "setButtonStyle:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1944), "plusButtonStyle"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1928), "setOverrideUserInterfaceStyle:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1944), "appExposeAccessoryButtonsOverrideUserInterfaceStyle"));
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(void **)(v2 + 1928);
  [*(id *)(v2 + 1944) plusButtonAlpha];
  return objc_msgSend(v3, "setAlpha:");
}

void __85__SBFluidSwitcherViewController__updateReopenClosedWindowsButtonWithMode_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 1944);
  uint64_t v5 = *(void *)(v3 + 1424);
  uint64_t v6 = a2;
  uint64_t v7 = [v4 animationAttributesForLayoutElement:v5];
  uint64_t v8 = [v7 opacitySettings];

  double v9 = (void *)MEMORY[0x1E4F42FF0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __85__SBFluidSwitcherViewController__updateReopenClosedWindowsButtonWithMode_completion___block_invoke_2;
  v21[3] = &unk_1E6AF4AC0;
  uint64_t v10 = *(void *)(a1 + 40);
  void v21[4] = *(void *)(a1 + 32);
  uint64_t v11 = v6[2](v6, @"reopen alpha");
  objc_msgSend(v9, "sb_animateWithSettings:mode:animations:completion:", v8, v10, v21, v11);

  [*(id *)(*(void *)(a1 + 32) + 1944) reopenClosedWindowsButtonScale];
  uint64_t v13 = v12;
  long long v14 = (void *)MEMORY[0x1E4F42FF0];
  double v15 = [*(id *)(a1 + 32) switcherSettings];
  uint64_t v16 = [v15 animationSettings];
  double v17 = [v16 reopenButtonScaleSettings];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __85__SBFluidSwitcherViewController__updateReopenClosedWindowsButtonWithMode_completion___block_invoke_3;
  v20[3] = &unk_1E6AF4A70;
  uint64_t v18 = *(void *)(a1 + 40);
  void v20[4] = *(void *)(a1 + 32);
  v20[5] = v13;
  double v19 = v6[2](v6, @"reopen button scale");

  objc_msgSend(v14, "sb_animateWithSettings:mode:animations:completion:", v17, v18, v20, v19);
}

uint64_t __85__SBFluidSwitcherViewController__updateReopenClosedWindowsButtonWithMode_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1936), "setOverrideUserInterfaceStyle:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1944), "appExposeAccessoryButtonsOverrideUserInterfaceStyle"));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1936);
  [*(id *)(v2 + 1944) reopenClosedWindowsButtonAlpha];
  return objc_msgSend(v3, "setAlpha:");
}

uint64_t __85__SBFluidSwitcherViewController__updateReopenClosedWindowsButtonWithMode_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 1936);
  CGAffineTransformMakeScale(&v3, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  return [v1 setTransform:&v3];
}

- (void)_updateTitleItemsUserInterfaceStyle
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CGAffineTransform v3 = [(SBFluidSwitcherViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_appLayoutToTitleItemController allValues];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setUserInterfaceStyle:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_handlePlusButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((*((unsigned char *)&self->_delegateRespondsTo + 1) & 0x80) != 0)
  {
    id v6 = WeakRetained;
    uint64_t v5 = [(SBSwitcherModifier *)self->_rootModifier appExposeAccessoryButtonsBundleIdentifier];
    [v6 switcherContentController:self requestNewWindowForBundleIdentifier:v5];

    id WeakRetained = v6;
  }
}

- (void)handleReopenClosedWindowsButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v5 = WeakRetained;
  if ((*((unsigned char *)&self->_delegateRespondsTo + 2) & 0x40) != 0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__SBFluidSwitcherViewController_handleReopenClosedWindowsButtonTapped___block_invoke;
    v10[3] = &unk_1E6AF5290;
    id v11 = WeakRetained;
    long long v12 = self;
    id v6 = (void (**)(void))MEMORY[0x1D948C7A0](v10);
    uint64_t v7 = [(SBSwitcherModifier *)self->_rootModifier appLayoutToScrollToBeforeReopeningClosedWindows];
    if (v7)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __71__SBFluidSwitcherViewController_handleReopenClosedWindowsButtonTapped___block_invoke_2;
      v8[3] = &unk_1E6AF5A50;
      uint64_t v9 = v6;
      [(SBFluidSwitcherViewController *)self _scrollToAppLayout:v7 animated:1 alignment:0 completion:v8];
    }
    else
    {
      v6[2](v6);
    }
  }
}

void __71__SBFluidSwitcherViewController_handleReopenClosedWindowsButtonTapped___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(v2 + 1944) appExposeAccessoryButtonsBundleIdentifier];
  [v1 switcherContentController:v2 reopenHiddenAppLayoutsWithBundleIdentifier:v3];
}

uint64_t __71__SBFluidSwitcherViewController_handleReopenClosedWindowsButtonTapped___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__SBFluidSwitcherViewController__updateHiddenAppLayoutsInShelves__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __65__SBFluidSwitcherViewController__updateHiddenAppLayoutsInShelves__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __50__SBFluidSwitcherViewController__updateBounceIcon__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 2056);
  UIRectGetCenter();
  double v4 = v3;
  [*(id *)(*(void *)(a1 + 32) + 1816) bounds];
  double v6 = v5 + *(double *)(a1 + 64) * -0.5 + -20.0;
  return objc_msgSend(v2, "setCenter:", v4, v6);
}

void __50__SBFluidSwitcherViewController__updateBounceIcon__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = WeakRetained;
  if (WeakRetained && WeakRetained[258] == *(void *)(a1 + 48))
  {
    double v4 = (void *)MEMORY[0x1E4F42FF0];
    uint64_t v5 = *(void *)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __50__SBFluidSwitcherViewController__updateBounceIcon__block_invoke_3;
    v12[3] = &unk_1E6AF8568;
    long long v13 = WeakRetained;
    long long v6 = *(_OWORD *)(a1 + 72);
    long long v14 = *(_OWORD *)(a1 + 56);
    long long v15 = v6;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__SBFluidSwitcherViewController__updateBounceIcon__block_invoke_4;
    void v9[3] = &unk_1E6AF50E8;
    uint64_t v7 = v13;
    uint64_t v8 = *(void *)(a1 + 48);
    id v10 = v7;
    uint64_t v11 = v8;
    objc_msgSend(v4, "sb_animateWithSettings:mode:animations:completion:", v5, 3, v12, v9);
  }
}

uint64_t __50__SBFluidSwitcherViewController__updateBounceIcon__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 2056);
  UIRectGetCenter();
  double v4 = v3;
  [*(id *)(*(void *)(a1 + 32) + 1816) bounds];
  double v6 = *(double *)(a1 + 64) + v5;
  return objc_msgSend(v2, "setCenter:", v4, v6);
}

void __50__SBFluidSwitcherViewController__updateBounceIcon__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 && *(void *)(v1 + 2064) == *(void *)(a1 + 40))
  {
    [*(id *)(v1 + 2056) removeFromSuperview];
    uint64_t v3 = *(void *)(a1 + 32);
    double v4 = *(void **)(v3 + 2056);
    *(void *)(v3 + 2056) = 0;
  }
}

- (id)_activeTransientOverlayPresentedAppLayout
{
  uint64_t v3 = [(SBFluidSwitcherViewController *)self dataSource];
  double v4 = v3;
  if ((*(unsigned char *)&self->_dataSourceRespondsTo & 8) != 0)
  {
    double v5 = [v3 activeTransientOverlayPresentedAppLayoutForSwitcherContentController:self];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (BOOL)_isLayoutStateSwitcher:(id)a3 allowTransitions:(BOOL)a4
{
  uint64_t v6 = [a3 unlockedEnvironmentMode];
  BOOL v7 = v6 == 2;
  if (v6 == 2 && !a4)
  {
    uint64_t v8 = [(SBFluidSwitcherLayoutContext *)self->_layoutContext activeTransitionContext];
    BOOL v7 = v8 == 0;
  }
  return v7;
}

- (void)_handleDismissTapGesture:(id)a3
{
  if ([a3 state] == 3)
  {
    double v4 = objc_alloc_init(SBTapOutsideToDismissSwitcherModifierEvent);
    [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v4];
  }
}

- (BOOL)_shouldInterruptPresentationAndDismiss
{
  uint64_t v2 = [(SBFluidSwitcherViewController *)self appLayouts];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)_setupMorphAnimatorIfNeededForEntity:(id)a3 pipCoordinator:(id)a4 appLayout:(id)a5 appLayoutBoundingBox:(CGRect)a6 uniqueID:(id)a7 direction:(int64_t)a8 gestureInitiated:(BOOL)a9
{
  BOOL v9 = a9;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a7;
  double v22 = [v20 allItems];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __152__SBFluidSwitcherViewController__setupMorphAnimatorIfNeededForEntity_pipCoordinator_appLayout_appLayoutBoundingBox_uniqueID_direction_gestureInitiated___block_invoke;
  v57[3] = &unk_1E6AF4B38;
  id v23 = v18;
  id v58 = v23;
  id v24 = objc_msgSend(v22, "bs_firstObjectPassingTest:", v57);

  double v25 = [v20 leafAppLayoutForItem:v24];
  double v26 = [(SBFluidSwitcherViewController *)self visibleItemContainers];
  double v27 = [v26 objectForKey:v25];

  if (v27)
  {
    BOOL v52 = v9;
    id v55 = v21;
    double v28 = [v23 application];
    double v29 = [v28 processState];
    uint64_t v30 = [v29 pid];

    double v31 = [(SBFluidSwitcherViewController *)self pipViewMorphAnimator];

    id v53 = v19;
    if (v31 || !v30)
    {
      double v34 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 9183, @"Morph animator already running for switcher view controller, can't assign new one." object file lineNumber description];
    }
    else
    {
      uint64_t v32 = [v23 objectForActivationSetting:58];
      uint64_t v33 = [v32 integerValue];

      double v34 = [v19 controllerForType:v33];
      uint64_t v35 = objc_opt_class();
      id v36 = v23;
      if (v35)
      {
        if (objc_opt_isKindOfClass()) {
          unint64_t v37 = v36;
        }
        else {
          unint64_t v37 = 0;
        }
      }
      else
      {
        unint64_t v37 = 0;
      }
      id v38 = v37;

      CGFloat v50 = v38;
      long long v39 = [v38 sceneHandle];
      uint64_t v40 = [v39 persistenceIdentifier];

      uint64_t v51 = (void *)v40;
      uint64_t v41 = [v34 pictureInPictureMorphAnimatorControllerForProcessIdentifier:v30 scenePersistenceIdentifier:v40];
      double v42 = (void *)v41;
      if (a8)
      {
        if (!v41)
        {
          uint64_t v48 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBFluidSwitcherViewController.m", 9157, @"An SBPIPMorphAnimatorController for pid %ui was not found.", v30);
        }
        [v42 setAppLayout:v20];
        objc_msgSend(v42, "setLayoutRole:", objc_msgSend(v20, "layoutRoleForItem:", v24));
        objc_msgSend(v42, "setAppLayoutBoundingBox:", x, y, width, height);
      }
      else
      {
        if (v41)
        {
          CGFloat v49 = [MEMORY[0x1E4F28B00] currentHandler];
          [v49 handleFailureInMethod:a2, self, @"SBFluidSwitcherViewController.m", 9151, @"An SBPIPMorphAnimatorController for pid %ui is already running, can't create new one.", v30 object file lineNumber description];
        }
        [(SBFluidSwitcherViewController *)self _updateFloatingDockBehaviorAssertion];
        uint64_t v43 = objc_msgSend(v34, "createAndRegisterPictureInPictureMorphAnimatorControllerWithTargetProcessIdentifier:uuid:scenePersistenceIdentifier:appLayout:layoutRole:appLayoutBoundingBox:gestureInitiated:direction:", v30, v55, v51, v20, objc_msgSend(v20, "layoutRoleForItem:", v24), v52, x, y, width, height, 0);

        double v42 = (void *)v43;
      }
      double v44 = [v42 viewMorphAnimator];
      [(SBFluidSwitcherViewController *)self setPipViewMorphAnimator:v44];
      if (a8)
      {
        objc_msgSend(v44, "setFromOrientation:", -[SBFluidSwitcherViewController homeScreenInterfaceOrientation](self, "homeScreenInterfaceOrientation"));
        int64_t v45 = [(SBFluidSwitcherViewController *)self switcherInterfaceOrientation];
      }
      else
      {
        objc_msgSend(v44, "setFromOrientation:", -[SBFluidSwitcherViewController switcherInterfaceOrientation](self, "switcherInterfaceOrientation"));
        int64_t v45 = [(SBFluidSwitcherViewController *)self homeScreenInterfaceOrientation];
      }
      [v44 setToOrientation:v45];
      [v44 setAutomaticallyStartSourceAnimations:0];
      double v46 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews objectForKey:v20];
      [v44 setSourceView:v46];
      if (a8)
      {
        double v47 = [v44 targetView];

        if (v47) {
          [v44 startTargetAnimations:1];
        }
      }
      [v44 noteSourceAnimationsWillStart:15];
    }
    id v19 = v53;
    id v21 = v55;
  }
}

uint64_t __152__SBFluidSwitcherViewController__setupMorphAnimatorIfNeededForEntity_pipCoordinator_appLayout_appLayoutBoundingBox_uniqueID_direction_gestureInitiated___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 uniqueIdentifier];
  double v4 = [*(id *)(a1 + 32) sceneHandle];
  double v5 = [v4 sceneIdentifier];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

- (void)_setupPIPMorphingIfNeededForTransitionContext:(id)a3 response:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 request];
  BOOL v9 = [v8 uniqueID];
  id v10 = [(SBFluidSwitcherViewController *)self dataSource];
  uint64_t v11 = [v8 source];
  $0ADF0CA18E1B7C2644544823916302BC dataSourceRespondsTo = self->_dataSourceRespondsTo;
  if ((*(_WORD *)&dataSourceRespondsTo & 0x1000) != 0)
  {
    int v13 = [v10 switcherContentController:self shouldMorphToPIPForTransitionContext:v6];
    char v14 = v13;
    if ((*((unsigned char *)&self->_dataSourceRespondsTo + 1) & 0x20) != 0)
    {
      int v15 = [v10 switcherContentController:self shouldMorphFromPIPForTransitionContext:v6];
      if ((v14 & 1) == 0)
      {
        if (!v15) {
          goto LABEL_31;
        }
        goto LABEL_17;
      }
    }
    else if (!v13)
    {
      goto LABEL_31;
    }
    uint64_t v16 = [v8 transientOverlayContext];
    uint64_t v40 = v16;
    if (v16 && (double v17 = v16, [v16 transitionType] == 1))
    {
      id v18 = [v17 transientOverlay];
      uint64_t v19 = [(SBFluidSwitcherViewController *)self _appLayoutForWorkspaceTransientOverlay:v18];
    }
    else
    {
      id v18 = [v6 previousLayoutState];
      uint64_t v19 = [v18 appLayout];
    }
    id v20 = (void *)v19;

    id v47 = 0;
    BOOL v21 = +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:v8 foundEntity:&v47 transitionStyle:0];
    id v22 = v47;
    id v23 = v22;
    if (v21 && v22)
    {
      BOOL v37 = v11 == 11;
      id v24 = [v8 workspace];
      double v25 = [v24 pipCoordinator];
      long long v39 = v7;
      [v7 appLayoutBoundingBox];
      double v26 = self;
      double v27 = v9;
      -[SBFluidSwitcherViewController _setupMorphAnimatorIfNeededForEntity:pipCoordinator:appLayout:appLayoutBoundingBox:uniqueID:direction:gestureInitiated:](v26, "_setupMorphAnimatorIfNeededForEntity:pipCoordinator:appLayout:appLayoutBoundingBox:uniqueID:direction:gestureInitiated:", v23, v25, v20, v9, 0, v37);

      double v28 = v40;
LABEL_28:

      id v7 = v39;
      BOOL v9 = v27;
    }
    else
    {
      double v28 = v40;
    }

LABEL_30:
    goto LABEL_31;
  }
  if ((*(_WORD *)&dataSourceRespondsTo & 0x2000) != 0
    && ([v10 switcherContentController:self shouldMorphFromPIPForTransitionContext:v6] & 1) != 0)
  {
LABEL_17:
    uint64_t v41 = v11;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v20 = [v6 applicationSceneEntities];
    uint64_t v29 = [v20 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      long long v39 = v7;
      uint64_t v31 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v44 != v31) {
            objc_enumerationMutation(v20);
          }
          uint64_t v33 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if ([v33 BOOLForActivationSetting:57])
          {
            BOOL v38 = v41 == 11;
            double v34 = [v6 layoutState];
            uint64_t v42 = [v34 appLayout];

            id v23 = [v8 workspace];
            id v24 = [v23 pipCoordinator];
            [v39 appLayoutBoundingBox];
            uint64_t v35 = self;
            id v36 = v33;
            double v28 = (void *)v42;
            double v27 = v9;
            -[SBFluidSwitcherViewController _setupMorphAnimatorIfNeededForEntity:pipCoordinator:appLayout:appLayoutBoundingBox:uniqueID:direction:gestureInitiated:](v35, "_setupMorphAnimatorIfNeededForEntity:pipCoordinator:appLayout:appLayoutBoundingBox:uniqueID:direction:gestureInitiated:", v36, v24, v42, v9, 1, v38);
            goto LABEL_28;
          }
        }
        uint64_t v30 = [v20 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v30) {
          continue;
        }
        break;
      }
      id v7 = v39;
    }
    goto LABEL_30;
  }
LABEL_31:
}

void __63__SBFluidSwitcherViewController__dispatchEventAndHandleAction___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = objc_opt_class();
  id v10 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v10;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v8 type];
  if (v9 == 43)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)_performModifierPerformTransitionResponse:(id)a3
{
  id v4 = a3;
  id v7 = [(SBFluidSwitcherViewController *)self delegate];
  id v5 = [v4 transitionRequest];
  uint64_t v6 = [v4 isGestureInitiated];

  [v7 switcherContentController:self performTransitionWithRequest:v5 gestureInitiated:v6];
}

- (void)_performModifierCompletionResponse:(id)a3
{
  id v4 = [(SBFluidSwitcherViewController *)self layoutContext];
  id v5 = [v4 activeGesture];

  if (v5)
  {
    uint64_t v6 = [(SBFluidSwitcherViewController *)self delegate];
    id v7 = v6;
    if ((*((unsigned char *)&self->_delegateRespondsTo + 2) & 0x20) != 0) {
      [v6 cancelActiveGestureForSwitcherContentController:self];
    }
  }
  else
  {
    id v8 = SBLogAppSwitcher();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SBSwitcherModifierEventResponseTypeRequestCompletion response ignored. Can only be performed when there is an active gesture!", v9, 2u);
    }
  }
}

- (void)_performModifierReachabilityResponse:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  if (v3) {
    [v3 reachabilityActivationContext];
  }
  v6[2] = v10;
  v6[3] = v11;
  v6[4] = v12;
  uint64_t v7 = v13;
  v6[0] = v8;
  v6[1] = v9;
  if (SBReachabilityGestureShouldActivate((uint64_t)v6))
  {
    id v5 = +[SBReachabilityManager sharedInstance];
    if (([v5 reachabilityModeActive] & 1) == 0) {
      [v5 toggleReachability];
    }
  }
}

- (void)_performModifierHapticResponse:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 hapticType];
  uint64_t v7 = [v5 phase];
  if (v6)
  {
    if (v6 == 2)
    {
      long long v8 = self->_reduceMotionFeedbackGenerator;
      uint64_t v9 = 1010;
    }
    else if (v6 == 1)
    {
      long long v8 = self->_emptySwitcherFeedbackGenerator;
      uint64_t v9 = 1013;
    }
    else
    {
      long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBFluidSwitcherViewController.m", 9597, @"Unknown haptic type %d", objc_msgSend(v5, "hapticType"));

      long long v8 = 0;
      uint64_t v9 = 0;
    }
  }
  else
  {
    long long v8 = self->_flyInFeedbackGenerator;
    uint64_t v9 = 1012;
  }
  if (v7 == 2)
  {
    [(UINotificationFeedbackGenerator *)v8 deactivate];
    goto LABEL_20;
  }
  if (v7 != 1)
  {
    if (!v7) {
      [(UINotificationFeedbackGenerator *)v8 activateWithCompletionBlock:0];
    }
    goto LABEL_20;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_15:
      [(UINotificationFeedbackGenerator *)v8 _privateNotificationOccurred:v9];
      goto LABEL_20;
    }
  }
  else
  {
    long long v11 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12 != 1) {
      goto LABEL_15;
    }
  }
  uint64_t v13 = [v5 hidEventSenderID];
  char v14 = SBLogAppSwitcher();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v16 = v9;
    __int16 v17 = 2048;
    uint64_t v18 = v13;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Firing switcher haptic for type %ld, senderID %llu", buf, 0x16u);
  }

  -[UINotificationFeedbackGenerator _privateNotificationOccurred:atLocation:senderID:](v8, "_privateNotificationOccurred:atLocation:senderID:", v9, v13, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
LABEL_20:
}

- (void)_performModifierInjectVelocityResponse:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 appLayout];
  id v20 = [v4 key];
  uint64_t v6 = [v4 velocity];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v5 leafAppLayouts];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = [(SBFluidSwitcherViewController *)self visibleItemContainers];
        char v14 = [v13 objectForKey:v12];

        if (v14)
        {
          int v15 = [v4 key];
          [v14 _setVelocity:v6 forKey:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  uint64_t v16 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews objectForKey:v5];
  __int16 v17 = v16;
  if (v16) {
    [v16 _setVelocity:v6 forKey:v20];
  }
  uint64_t v18 = [(NSMutableDictionary *)self->_visibleUnderlayAccessoryViews objectForKey:v5];
  uint64_t v19 = v18;
  if (v18) {
    [v18 _setVelocity:v6 forKey:v20];
  }
}

- (void)_performModifierEmitStudyLogResponse:(id)a3
{
  v64[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 name];
  uint64_t v6 = [v4 payload];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v6];
  uint64_t v8 = [(SBFluidSwitcherViewController *)self layoutContext];
  uint64_t v9 = [v8 activeGesture];

  if ([v5 isEqualToString:@"[SBDeckSwitcherPanGestureWorkspaceTransresponse _beginWithGesture:]"])
  {
    uint64_t v10 = [(SBFluidSwitcherViewController *)self layoutContext];
    long long v11 = [v10 layoutState];
    uint64_t v12 = [v11 unlockedEnvironmentMode];

    uint64_t v13 = [(SBFluidSwitcherViewController *)self scrollView];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    id v58 = v9;
    long long v22 = [v9 studyLogData];
    [v7 addEntriesFromDictionary:v22];

    long long v23 = [NSNumber numberWithInteger:v12];
    [v7 setObject:v23 forKeyedSubscript:@"unlockedEnvironmentMode"];

    v63[0] = @"x";
    long long v24 = [NSNumber numberWithDouble:v15];
    v64[0] = v24;
    v63[1] = @"y";
    uint64_t v25 = [NSNumber numberWithDouble:v17];
    v64[1] = v25;
    v63[2] = @"width";
    uint64_t v26 = [NSNumber numberWithDouble:v19];
    v64[2] = v26;
    v63[3] = @"height";
    double v27 = [NSNumber numberWithDouble:v21];
    v64[3] = v27;
    double v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:4];
    [v7 setObject:v28 forKeyedSubscript:@"switcherScrollViewBounds"];
    uint64_t v29 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v7];

    uint64_t v6 = (void *)v25;
LABEL_8:

    uint64_t v6 = (void *)v29;
    uint64_t v9 = v58;
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"[SBDeckSwitcherPanGestureWorkspaceTransresponse _finishWithGesture:]"])
  {
    uint64_t v30 = [(SBFluidSwitcherViewController *)self layoutContext];
    uint64_t v31 = [v30 activeTransitionContext];
    uint64_t v32 = [v31 request];
    long long v24 = [v32 transientOverlayContext];

    uint64_t v33 = [(SBFluidSwitcherViewController *)self layoutContext];
    double v34 = [v33 layoutState];
    uint64_t v56 = [v34 unlockedEnvironmentMode];

    uint64_t v35 = [(SBFluidSwitcherViewController *)self view];
    [v35 bounds];
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;

    id v58 = v9;
    long long v44 = [v9 studyLogData];
    [v7 addEntriesFromDictionary:v44];

    if (v24) {
      long long v45 = &unk_1F3349848;
    }
    else {
      long long v45 = &unk_1F3349860;
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v45, @"transientOverlayContext", v56);
    long long v46 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v24, "transitionType"));
    [v7 setObject:v46 forKeyedSubscript:@"transientOverlayContextTransitionType"];

    id v47 = objc_msgSend(NSNumber, "numberWithInteger:", -[SBFluidSwitcherViewController switcherInterfaceOrientation](self, "switcherInterfaceOrientation"));
    [v7 setObject:v47 forKeyedSubscript:@"orientation"];

    v61[0] = @"x";
    uint64_t v48 = [NSNumber numberWithDouble:v37];
    v62[0] = v48;
    v61[1] = @"y";
    uint64_t v49 = [NSNumber numberWithDouble:v39];
    v62[1] = v49;
    v61[2] = @"width";
    CGFloat v50 = [NSNumber numberWithDouble:v41];
    v62[2] = v50;
    v61[3] = @"height";
    uint64_t v51 = [NSNumber numberWithDouble:v43];
    v62[3] = v51;
    BOOL v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:4];
    [v7 setObject:v52 forKeyedSubscript:@"bounds"];

    id v53 = [NSNumber numberWithInteger:v57];
    [v7 setObject:v53 forKeyedSubscript:@"unlockedEnvironmentMode"];

    uint64_t v29 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v7];
    goto LABEL_8;
  }
LABEL_9:
  double v54 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  double v59 = v5;
  double v60 = v6;
  id v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
  [v54 log:v55];
}

- (void)_performModifierEmitSBEventResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 eventType];
  id v6 = [v3 payload];

  id v5 = [MEMORY[0x1E4FA5E78] sharedInstance];
  [v5 emitEvent:v4 withPayload:v6];
}

- (void)_performModifierScrollToAppLayoutResponse:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [v5 appLayout];
  if (v4) {
    -[SBFluidSwitcherViewController _scrollToAppLayout:animated:alignment:completion:](self, "_scrollToAppLayout:animated:alignment:completion:", v4, [v5 animated], objc_msgSend(v5, "alignment"), 0);
  }
}

- (void)_performModifierNotifyIconWillZoomDownResponse:(id)a3
{
  hiddenIconViews = self->_hiddenIconViews;
  id v5 = [a3 appLayout];
  id v7 = [(NSMutableDictionary *)hiddenIconViews objectForKey:v5];

  if (v7)
  {
    id v6 = [(SBFluidSwitcherViewController *)self _iconZoomContextProvider];
    [v6 noteIconZoomingViewWillZoomDown:v7];
  }
}

uint64_t __77__SBFluidSwitcherViewController__performModifierMatchMoveToIconViewResponse___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 1816);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

uint64_t __77__SBFluidSwitcherViewController__performModifierMatchMoveToIconViewResponse___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 1816);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

- (void)_performModifierMatchMoveToDropletResponse:(id)a3
{
  v64[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 appLayout];
  if (![v5 isActive])
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v49 = v6;
    long long v11 = [v6 leafAppLayouts];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v52 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = [(NSMutableDictionary *)self->_visibleItemContainers objectForKey:*(void *)(*((void *)&v51 + 1) + 8 * i)];
          double v17 = v16;
          if (v16)
          {
            double v18 = [v16 layer];
            [v18 removeAnimationForKey:@"MatchMoveToDropletAnimation"];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v51 objects:v59 count:16];
      }
      while (v13);
    }

    id v6 = v49;
    double v19 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews objectForKey:v49];
    double v20 = v19;
    if (v19)
    {
      double v21 = [v19 layer];
      [v21 removeAnimationForKey:@"MatchMoveToDropletAnimation"];
    }
    long long v22 = [(NSMutableDictionary *)self->_visibleUnderlayAccessoryViews objectForKey:v49];
    long long v23 = v22;
    if (!v22) {
      goto LABEL_46;
    }
    id v9 = [v22 layer];
    [v9 removeAnimationForKey:@"MatchMoveToDropletAnimation"];
LABEL_45:

LABEL_46:
    goto LABEL_47;
  }
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_externalDropletZoomUpTokens objectForKey:v6];
    if (v7)
    {
      id v47 = v7;
      uint64_t v8 = [v7 animatingDroplet];
      if (!v8)
      {
        long long v44 = [MEMORY[0x1E4F28B00] currentHandler];
      }
      id v9 = objc_alloc_init(MEMORY[0x1E4F39C00]);
      uint64_t v10 = [v8 layer];
      [v9 setSourceLayer:v10];

      [v9 setDuration:INFINITY];
      [v9 setFillMode:*MEMORY[0x1E4F39FA0]];
      [v9 setRemovedOnCompletion:0];
      if ([(SBFluidSwitcherViewController *)self switcherInterfaceOrientation] != 1
        && [(SBFluidSwitcherViewController *)self switcherInterfaceOrientation] != 4
        && [(SBFluidSwitcherViewController *)self switcherInterfaceOrientation] != 3)
      {
        [(SBFluidSwitcherViewController *)self switcherInterfaceOrientation];
      }
      id v48 = v5;
      long long v46 = v8;
      if (BSFloatEqualToFloat())
      {
        long long v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 1.0);
        v64[0] = v24;
        uint64_t v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 0.0);
        v64[1] = v25;
        uint64_t v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 1.0, 0.0);
        v64[2] = v26;
        double v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 1.0, 1.0);
        v64[3] = v27;
        double v28 = v64;
      }
      else if (BSFloatEqualToFloat())
      {
        long long v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 1.0, 1.0);
        v63[0] = v24;
        uint64_t v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 1.0);
        v63[1] = v25;
        uint64_t v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 0.0);
        v63[2] = v26;
        double v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 1.0, 0.0);
        v63[3] = v27;
        double v28 = v63;
      }
      else if (BSFloatEqualToFloat())
      {
        long long v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 1.0, 0.0);
        v62[0] = v24;
        uint64_t v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 1.0, 1.0);
        v62[1] = v25;
        uint64_t v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 1.0);
        v62[2] = v26;
        double v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 0.0);
        v62[3] = v27;
        double v28 = v62;
      }
      else
      {
        long long v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 0.0);
        v61[0] = v24;
        uint64_t v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 1.0, 0.0);
        v61[1] = v25;
        uint64_t v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 1.0, 1.0);
        v61[2] = v26;
        double v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 1.0);
        v61[3] = v27;
        double v28 = v61;
      }
      uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];

      long long v45 = (void *)v29;
      [v9 setSourcePoints:v29];
      [v9 setUsesNormalizedCoordinates:1];
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      CGFloat v50 = v6;
      uint64_t v30 = [v6 leafAppLayouts];
      uint64_t v31 = [v30 countByEnumeratingWithState:&v55 objects:v60 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v56;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v56 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = [(NSMutableDictionary *)self->_visibleItemContainers objectForKey:*(void *)(*((void *)&v55 + 1) + 8 * j)];
            double v36 = v35;
            if (v35)
            {
              double v37 = [v35 layer];
              [v37 addAnimation:v9 forKey:@"MatchMoveToDropletAnimation"];
            }
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v55 objects:v60 count:16];
        }
        while (v32);
      }

      id v6 = v50;
      double v38 = [(NSMutableDictionary *)self->_visibleOverlayAccessoryViews objectForKey:v50];
      double v39 = v38;
      if (v38)
      {
        double v40 = [v38 layer];
        [v40 addAnimation:v9 forKey:@"MatchMoveToDropletAnimation"];
      }
      double v41 = [(NSMutableDictionary *)self->_visibleUnderlayAccessoryViews objectForKey:v50];
      double v42 = v41;
      double v20 = v47;
      id v5 = v48;
      long long v23 = v46;
      if (v41)
      {
        double v43 = [v41 layer];
        [v43 addAnimation:v9 forKey:@"MatchMoveToDropletAnimation"];
      }
      goto LABEL_45;
    }
  }
LABEL_47:
}

- (void)_performBlurItemContainerResponse:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = objc_msgSend(v4, "appLayout", 0);
  id v6 = [v5 leafAppLayouts];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [(NSMutableDictionary *)self->_visibleItemContainers objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if (v11)
        {
          uint64_t v12 = [v4 blurParameters];
          int v13 = [v4 shouldBlur];
          uint64_t v14 = [v4 animationUpdateMode];
          if (v13) {
            [(SBFluidSwitcherViewController *)self _blurItemContainer:v11 blurParameters:v12 withAnimationUpdateMode:v14];
          }
          else {
            [(SBFluidSwitcherViewController *)self _unblurItemContainer:v11 blurParameters:v12 withAnimationUpdateMode:v14];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)_performNewWindowSwitcherResponse:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((*((unsigned char *)&self->_delegateRespondsTo + 1) & 0x80) != 0)
  {
    id v5 = [v6 bundleIdentifier];
    [WeakRetained switcherContentController:self requestNewWindowForBundleIdentifier:v5];
  }
}

- (void)_performModifierDismissSiriResponse:(id)a3
{
  id v4 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  id v3 = [v4 assistantController];
  [v3 dismissAssistantViewIfNecessary];
}

- (void)_performInvalidateSnapshotCacheResponse:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 displayItems];
  if (!v4)
  {
    id v5 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = [(SBAppSwitcherSnapshotImageCache *)self->_snapshotCache cachableAppLayouts];
    uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v11 = [v10 leafAppLayouts];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v28;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v28 != v14) {
                  objc_enumerationMutation(v11);
                }
                long long v16 = [*(id *)(*((void *)&v27 + 1) + 8 * j) allItems];
                [v5 addObjectsFromArray:v16];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
            }
            while (v13);
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v7);
    }

    id v4 = [v5 allObjects];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v17 = v4;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        [(SBAppSwitcherSnapshotImageCache *)self->_snapshotCache reloadSnapshotForDisplayItem:*(void *)(*((void *)&v23 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v19);
  }
}

- (void)_performInvalidateItemContainerBackdropResponse:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v4 = [(SBFluidSwitcherViewController *)self appLayouts];
  unint64_t v5 = [v4 count];

  uint64_t v6 = [(SBSwitcherModifier *)self->_rootModifier animationAttributesForLayoutElement:self->_genericAccessoryLayoutElement];
  uint64_t v13 = [v6 layoutSettings];

  uint64_t v12 = [v11 updateMode];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(NSMutableDictionary *)self->_visibleItemContainerBackdropViews allKeys];
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        v17[0] = 0;
        v17[1] = v17;
        v17[2] = 0x3032000000;
        v17[3] = __Block_byref_object_copy__14;
        void v17[4] = __Block_byref_object_dispose__14;
        id v18 = [(NSMutableDictionary *)self->_visibleItemContainerBackdropViews objectForKey:v10];
        if ([v10 integerValue] >= v5)
        {
          [(NSMutableDictionary *)self->_visibleItemContainerBackdropViews removeObjectForKey:v10];
          void v15[4] = v17;
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __81__SBFluidSwitcherViewController__performInvalidateItemContainerBackdropResponse___block_invoke;
          v16[3] = &unk_1E6AF56B0;
          void v16[4] = v17;
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __81__SBFluidSwitcherViewController__performInvalidateItemContainerBackdropResponse___block_invoke_2;
          v15[3] = &unk_1E6AFAB68;
          objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", v13, v12, v16, v15);
        }
        _Block_object_dispose(v17, 8);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

uint64_t __81__SBFluidSwitcherViewController__performInvalidateItemContainerBackdropResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setAlpha:0.0];
}

void __81__SBFluidSwitcherViewController__performInvalidateItemContainerBackdropResponse___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setHidden:1];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeFromSuperview];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)_performUpdateDragPlatterBlurResponse:(id)a3
{
  id v3 = +[SBWorkspace mainWorkspace];
  id v4 = [v3 currentTransaction];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v9 = v7;

  uint64_t v8 = v9;
  if (v9)
  {
    [v9 blurReadinessDidChange];
    uint64_t v8 = v9;
  }
}

- (void)_performRequestSystemApertureElementSuppressionResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  id v6 = [v4 appLayout];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  long long v21 = __89__SBFluidSwitcherViewController__performRequestSystemApertureElementSuppressionResponse___block_invoke;
  long long v22 = &unk_1E6AF4F20;
  long long v23 = self;
  id v7 = v5;
  id v24 = v7;
  [v6 enumerate:&v19];

  systemApertureContentSuppressionAssertionsByInvalidationUUID = self->_systemApertureContentSuppressionAssertionsByInvalidationUUID;
  id v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithSet:", v7, v19, v20, v21, v22, v23);
  uint64_t v10 = [v4 invalidationIdentifier];
  [(NSMutableDictionary *)systemApertureContentSuppressionAssertionsByInvalidationUUID setObject:v9 forKey:v10];

  if ([v4 wantsGlobalSuppression])
  {
    id v11 = [(id)SBApp systemApertureControllerForMainDisplay];
    uint64_t v12 = [v11 restrictSystemApertureToInertWithReason:@"Switcher"];

    systemApertureGlobalSuppressionAssertionsByInvalidationUUID = self->_systemApertureGlobalSuppressionAssertionsByInvalidationUUID;
    uint64_t v14 = [v4 invalidationIdentifier];
    [(NSMutableDictionary *)systemApertureGlobalSuppressionAssertionsByInvalidationUUID setObject:v12 forKey:v14];
  }
  if ([v4 wantsKeyLineEnabled])
  {
    long long v15 = [(id)SBApp systemApertureControllerForMainDisplay];
    long long v16 = [v15 requireKeyLineAssertionForTransition];

    systemApertureKeyLineAssertionsByInvalidationUUID = self->_systemApertureKeyLineAssertionsByInvalidationUUID;
    id v18 = [v4 invalidationIdentifier];
    [(NSMutableDictionary *)systemApertureKeyLineAssertionsByInvalidationUUID setObject:v16 forKey:v18];
  }
}

void __89__SBFluidSwitcherViewController__performRequestSystemApertureElementSuppressionResponse___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if (![v8 type])
  {
    id v4 = [*(id *)(a1 + 32) _gestureManager];
    uint64_t v5 = [v8 bundleIdentifier];
    id v6 = [v8 uniqueIdentifier];
    id v7 = [v4 acquireSystemApertureSuppressionAssertionForBundleIdentifier:v5 sceneIdentifier:v6];

    if (v7) {
      [*(id *)(a1 + 40) addObject:v7];
    }
  }
}

- (void)_performRelinquishSystemApertureElementSuppressionResponse:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 invalidationIdentifier];
  uint64_t v5 = [(NSMutableDictionary *)self->_systemApertureContentSuppressionAssertionsByInvalidationUUID objectForKey:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v9++) invalidate];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  [(NSMutableDictionary *)self->_systemApertureContentSuppressionAssertionsByInvalidationUUID removeObjectForKey:v4];
  uint64_t v10 = [(NSMutableDictionary *)self->_systemApertureGlobalSuppressionAssertionsByInvalidationUUID objectForKey:v4];
  [v10 invalidateWithReason:@"Switcher"];
  [(NSMutableDictionary *)self->_systemApertureGlobalSuppressionAssertionsByInvalidationUUID removeObjectForKey:v4];
  id v11 = [(NSMutableDictionary *)self->_systemApertureKeyLineAssertionsByInvalidationUUID objectForKey:v4];
  [v11 invalidateWithReason:@"Switcher"];
  [(NSMutableDictionary *)self->_systemApertureKeyLineAssertionsByInvalidationUUID removeObjectForKey:v4];
}

- (void)_performSystemApertureBounceResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 appLayout];
  uint64_t v6 = [(SBFluidSwitcherViewController *)self currentVelocityValueForVisibleAppLayout:v5 key:@"position"];

  uint64_t v20 = v6;
  if (v6)
  {
    objc_msgSend(v6, "CGPointValue", v6);
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DAD8];
    double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  id v11 = objc_msgSend(v4, "suppressionIdentifierToInvalidate", v20);
  long long v12 = [(NSMutableDictionary *)self->_systemApertureContentSuppressionAssertionsByInvalidationUUID objectForKey:v11];
  long long v13 = [(NSMutableDictionary *)self->_systemApertureGlobalSuppressionAssertionsByInvalidationUUID objectForKey:v11];
  long long v14 = [(NSMutableDictionary *)self->_systemApertureKeyLineAssertionsByInvalidationUUID objectForKey:v11];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__SBFluidSwitcherViewController__performSystemApertureBounceResponse___block_invoke;
  void v22[3] = &unk_1E6AF4E00;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  id v18 = (void *)MEMORY[0x1D948C7A0](v22);
  [(NSMutableDictionary *)self->_systemApertureContentSuppressionAssertionsByInvalidationUUID removeObjectForKey:v11];
  [(NSMutableDictionary *)self->_systemApertureGlobalSuppressionAssertionsByInvalidationUUID removeObjectForKey:v11];
  [(NSMutableDictionary *)self->_systemApertureKeyLineAssertionsByInvalidationUUID removeObjectForKey:v11];
  uint64_t v19 = [(id)SBApp systemApertureControllerForMainDisplay];
  objc_msgSend(v19, "animateTransitionAcceptanceBounceWithVelocityVector:triggeredBlock:", v18, v8, v10);
}

uint64_t __70__SBFluidSwitcherViewController__performSystemApertureBounceResponse___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "invalidate", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [a1[5] invalidateWithReason:@"Switcher"];
  return [a1[6] invalidateWithReason:@"Switcher"];
}

- (void)_performSystemApertureStretchResponse:(id)a3
{
  objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animateTransitionEjectionStretchWithVelocityVector:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)_performUpdateContinuousExposeStripsPresentationResponse:(id)a3
{
  unint64_t continuousExposeStripsPresentationOptions = self->_continuousExposeStripsPresentationOptions;
  id v5 = a3;
  unint64_t v6 = [v5 presentationOptions] | continuousExposeStripsPresentationOptions;
  self->_unint64_t continuousExposeStripsPresentationOptions = v6;
  uint64_t v7 = [v5 dismissalOptions];

  self->_unint64_t continuousExposeStripsPresentationOptions = v6 & ~v7;
}

- (void)_performInvalidateContinuousExposeIdentifiersResponse:(id)a3
{
  id v4 = a3;
  id v7 = [v4 transitioningFromAppLayout];
  id v5 = [v4 transitioningToAppLayout];
  uint64_t v6 = [v4 animated];

  [(SBFluidSwitcherViewController *)self _updateContinuousExposeIdentifiersTransitioningFromAppLayout:v7 toAppLayout:v5 animated:v6];
}

- (void)_performSetInterfaceOrientationFromUserResizingResponse:(id)a3
{
  id v4 = a3;
  id v8 = [v4 displayItem];
  uint64_t v5 = [v4 desiredOrientation];

  if (v8 && v5)
  {
    uint64_t v6 = [(SBFluidSwitcherViewController *)self delegate];
    id v7 = v6;
    if ((*((unsigned char *)&self->_delegateRespondsTo + 1) & 0x40) != 0) {
      [v6 switcherContentController:self setInterfaceOrientationFromUserResizing:v5 forDisplayItem:v8];
    }
  }
}

- (void)_performPresentContinuousExposeStripEdgeProtectGrabberResponse:(id)a3
{
  id v4 = a3;
  id v6 = [(SBFluidSwitcherViewController *)self delegate];
  int v5 = [v4 isInitialPresentation];

  if (v5) {
    [v6 presentContinuousExposeStripRevealGrabberTongueImmediatelyForSwitcherContentController:self];
  }
  else {
    [v6 tickleContinuousExposeStripRevealGrabberTongueIfVisibleForSwitcherContentController:self];
  }
}

- (void)_performInvalidateRootContentViewClippingAndBlurResponse:(id)a3
{
}

- (void)_performActionForPreludeAnimationTokenActionResponse:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 preludeToken];
  id v7 = [v5 zoomUpToken];
  id v8 = [v5 appLayout];
  uint64_t v9 = [v5 action];

  if (v9 == 1)
  {
    if (v6)
    {
      [v6 cancel];
      uint64_t v19 = SBLogCameraCaptureLaunchAnimation();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        id v23 = v6;
        _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "Switcher-Modifier: Still have prelude token when transition ends; canceling: %@",
          (uint8_t *)&v22,
          0xCu);
      }
    }
    [(NSMutableDictionary *)self->_externalDropletZoomUpTokens removeObjectForKey:v8];
    uint64_t v20 = [[SBMatchMoveToDropletSwitcherEventResponse alloc] initWithAppLayout:v8 active:0];
    [(SBFluidSwitcherViewController *)self _performModifierMatchMoveToDropletResponse:v20];

    [v7 invalidate];
  }
  else if (!v9)
  {
    long long v10 = [v6 associatedBezelEffectsCoordinator];
    long long v11 = [v10 commandeerDropletAnimationWithToken:v6];
    long long v12 = [(SBFluidSwitcherViewController *)self view];
    uint64_t v13 = [v12 window];

    if (!v13)
    {
      long long v14 = [(SBFluidSwitcherViewController *)self delegate];
      [v14 updateWindowVisibilityForSwitcherContentController:self];

      id v15 = [(SBFluidSwitcherViewController *)self view];
      uint64_t v13 = [v15 window];
    }
    [v13 windowLevel];
    [v11 setRequestedDropletWindowLevel:v16 + -1.0];
    id v17 = [v11 animatingDroplet];
    if (!v17)
    {
      id v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherViewController.m" lineNumber:10183 description:@"No Droplet to Commandeer"];
    }
    [(NSMutableDictionary *)self->_externalDropletZoomUpTokens setObject:v11 forKey:v8];
    id v18 = [[SBHardwareButtonDropletAnimationEvent alloc] initWithPreludeToken:0 zoomUpToken:v11];
    [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v18];
  }
}

- (void)_performCancelSystemGesturesResponse:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  id v6 = [v5 systemGestureManager];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = objc_msgSend(v4, "systemGestureTypes", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * v11) unsignedIntegerValue];
        uint64_t v13 = (objc_class *)objc_opt_class();
        long long v14 = NSStringFromClass(v13);
        [v6 cancelGestureRecognizerOfType:v12 reason:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)_cancelWindowMorphingAnimation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  centerWindowInAppMorphCompletiouint64_t n = (void (**)(id, uint64_t, void))self->_centerWindowInAppMorphCompletion;
  if (centerWindowInAppMorphCompletion)
  {
    centerWindowInAppMorphCompletion[2](centerWindowInAppMorphCompletion, 1, 0);
    id v4 = self->_centerWindowInAppMorphCompletion;
    self->_centerWindowInAppMorphCompletiouint64_t n = 0;

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = [(NSMutableDictionary *)self->_centerWindowActivationAnimationContexts allKeys];
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
          [(SBFluidSwitcherViewController *)self _removeCenterWindowAnimationContextWithKey:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_updateModifierStackDebugLabelPresence
{
  BOOL v3 = [(SBAppSwitcherSettings *)self->_settings showModifierDebugLabel];
  modifierStackDebugLabel = self->_modifierStackDebugLabel;
  if (modifierStackDebugLabel) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !v3;
  }
  if (v5)
  {
    if (!modifierStackDebugLabel) {
      LOBYTE(v3) = 1;
    }
    if (!v3)
    {
      [(UILabel *)modifierStackDebugLabel removeFromSuperview];
      long long v17 = self->_modifierStackDebugLabel;
      self->_modifierStackDebugLabel = 0;
    }
  }
  else
  {
    uint64_t v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    uint64_t v7 = self->_modifierStackDebugLabel;
    self->_modifierStackDebugLabel = v6;

    uint64_t v8 = self->_modifierStackDebugLabel;
    uint64_t v9 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.8];
    [(UILabel *)v8 setBackgroundColor:v9];

    long long v10 = self->_modifierStackDebugLabel;
    long long v11 = [MEMORY[0x1E4F42A30] systemFontOfSize:12.0];
    [(UILabel *)v10 setFont:v11];

    long long v12 = self->_modifierStackDebugLabel;
    long long v13 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UILabel *)v12 setTextColor:v13];

    [(UILabel *)self->_modifierStackDebugLabel setTextAlignment:0];
    [(UILabel *)self->_modifierStackDebugLabel setNumberOfLines:0];
    long long v14 = [(UILabel *)self->_modifierStackDebugLabel layer];
    [v14 setCornerRadius:19.0];

    uint64_t v15 = [(UILabel *)self->_modifierStackDebugLabel layer];
    [v15 setCornerCurve:*MEMORY[0x1E4F39EA8]];

    [(UILabel *)self->_modifierStackDebugLabel setClipsToBounds:1];
    [(UILabel *)self->_modifierStackDebugLabel bs_setHitTestingDisabled:1];
    long long v16 = [(SBFluidSwitcherViewController *)self view];
    [v16 addSubview:self->_modifierStackDebugLabel];

    [(SBFluidSwitcherViewController *)self _updateModifierStackDebugLabel];
  }
}

- (BOOL)isShowingModifierTimeline
{
  return self->_isShowingModifierTimeline;
}

- (void)setShowModifierTimeline:(BOOL)a3
{
  if (self->_isShowingModifierTimeline != a3)
  {
    self->_isShowingModifierTimeline = a3;
    [(SBFluidSwitcherViewController *)self _updateModifierTimelinePresence];
  }
}

- (void)_updateModifierTimelinePresence
{
  p_rootModifier = &self->_rootModifier;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || !self->_isShowingModifierTimeline)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || self->_isShowingModifierTimeline) {
      return;
    }
    id obj = *p_rootModifier;
    uint64_t v7 = [(SBHistorianSwitcherModifier *)obj rootModifier];
    uint64_t v8 = *p_rootModifier;
    *p_rootModifier = (SBSwitcherModifier *)v7;

    modifierTimelineController = self->_modifierTimelineController;
    if (modifierTimelineController)
    {
      [(SBFluidSwitcherModifierTimelineController *)modifierTimelineController setVisible:0];
      long long v10 = self->_modifierTimelineController;
      self->_modifierTimelineController = 0;
    }
  }
  else
  {
    id obj = [[SBHistorianSwitcherModifier alloc] initWithRootModifier:*p_rootModifier];
    id v4 = [(SBChainableModifier *)*p_rootModifier delegate];
    [(SBHistorianSwitcherModifier *)obj setDelegate:v4];

    [(SBHistorianSwitcherModifier *)obj setHistorianDelegate:self];
    objc_storeStrong((id *)p_rootModifier, obj);
    if (!self->_modifierTimelineController)
    {
      BOOL v5 = [[SBFluidSwitcherModifierTimelineController alloc] initWithDelegate:self];
      uint64_t v6 = self->_modifierTimelineController;
      self->_modifierTimelineController = v5;

      [(SBFluidSwitcherModifierTimelineController *)self->_modifierTimelineController setVisible:1];
    }
  }
}

- (void)_updateModifierStackDebugLabel
{
  id v7 = [(SBSwitcherModifier *)self->_rootModifier stackDescription];
  BOOL v3 = [(UILabel *)self->_modifierStackDebugLabel text];
  char v4 = [v3 isEqualToString:v7];

  if ((v4 & 1) == 0)
  {
    [(UILabel *)self->_modifierStackDebugLabel setText:v7];
    -[UILabel sizeThatFits:](self->_modifierStackDebugLabel, "sizeThatFits:", 400.0, 400.0);
    -[UILabel setFrame:](self->_modifierStackDebugLabel, "setFrame:", 5.0, 25.0, v5 + 20.0, v6 + 20.0);
  }
}

- (BOOL)_hitTestedToTopAffordance:(CGPoint)a3 window:(id)a4 forLeafAppLayout:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  if (a5)
  {
    long long v10 = [(NSMutableDictionary *)self->_liveContentOverlays objectForKey:a5];
    if (objc_opt_respondsToSelector()) {
      char v11 = objc_msgSend(v10, "hitTestedToTopAffordance:window:", v9, x, y);
    }
    else {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)_adjustedGestureEventForGestureEvent:(id)a3 fromGestureManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isWindowDragGestureEvent])
  {
    uint64_t v8 = [v7 contentViewController];
    id v9 = [(SBFluidSwitcherViewController *)self _convertWindowDragEvent:v6 fromSwitcherContentViewController:v8];
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

- (id)_convertWindowDragEvent:(id)a3 fromSwitcherContentViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      char v11 = v10;
    }
    else {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }
  id v12 = v11;

  long long v13 = self;
  if (!v12)
  {
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:v13 file:@"SBFluidSwitcherViewController.m" lineNumber:10320 description:@"switcherContentViewController must be a UIViewController"];
  }
  if ([(SBFluidSwitcherViewController *)v13 isEqual:v12])
  {
    long long v14 = (SBWindowDragSwitcherModifierEvent *)v7;
  }
  else
  {
    long long v29 = [v12 _sbWindowScene];
    long long v28 = [(SBFluidSwitcherViewController *)v13 _sbWindowScene];
    [v7 locationInContainerView];
    objc_msgSend(v29, "convertPoint:toNeighboringDisplayWindowScene:", v28);
    double v16 = v15;
    double v18 = v17;
    uint64_t v19 = [v29 switcherController];
    long long v27 = [v28 switcherController];
    uint64_t v20 = [v19 switcherCoordinator];
    id v21 = [v7 selectedAppLayout];
    int v22 = [v20 convertAppLayout:v21 fromSwitcherController:v19 toSwitcherController:v27];

    id v23 = [SBWindowDragSwitcherModifierEvent alloc];
    uint64_t v24 = [v7 gestureID];
    long long v14 = -[SBGestureSwitcherModifierEvent initWithGestureID:selectedAppLayout:gestureType:phase:](v23, "initWithGestureID:selectedAppLayout:gestureType:phase:", v24, v22, [v7 gestureType], objc_msgSend(v7, "phase"));

    -[SBGestureSwitcherModifierEvent setLocationInContainerView:](v14, "setLocationInContainerView:", v16, v18);
    -[SBWindowDragSwitcherModifierEvent setDraggingFromContinuousExposeStrips:](v14, "setDraggingFromContinuousExposeStrips:", [v7 isDraggingFromContinuousExposeStrips]);
    [v7 locationInSelectedDisplayItem];
    -[SBWindowDragSwitcherModifierEvent setLocationInSelectedDisplayItem:](v14, "setLocationInSelectedDisplayItem:");
    [v7 sizeOfSelectedDisplayItem];
    -[SBWindowDragSwitcherModifierEvent setSizeOfSelectedDisplayItem:](v14, "setSizeOfSelectedDisplayItem:");
  }
  return v14;
}

- (void)_updateOverlaysTopAffordanceContextMenu
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(NSMutableDictionary *)self->_liveContentOverlays allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 updateTopAffordanceContextMenu];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)_searchPresenter
{
  id v2 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  uint64_t v3 = [v2 homeScreenController];

  uint64_t v4 = [v3 searchPresenter];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = +[SBIconController sharedInstance];
    id v6 = [v7 searchPresenter];
  }
  return v6;
}

- (void)_updateChamoisDefaultsObserverIfNeeded
{
  void v24[4] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(SBFluidSwitcherViewController *)self _windowManagementStyle];
  chamoisDefaultsObserver = self->_chamoisDefaultsObserver;
  if (v3 != 2 || chamoisDefaultsObserver)
  {
    if (v3 != 2 && chamoisDefaultsObserver)
    {
      [(BSDefaultObserver *)chamoisDefaultsObserver invalidate];
      double v16 = self->_chamoisDefaultsObserver;
      self->_chamoisDefaultsObserver = 0;
    }
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v5 = [NSString stringWithUTF8String:"chamoisHideStrips"];
    v24[0] = v5;
    id v6 = [NSString stringWithUTF8String:"chamoisHideDock"];
    v24[1] = v6;
    id v7 = [NSString stringWithUTF8String:"chamoisHideStripsExternal"];
    void v24[2] = v7;
    long long v8 = [NSString stringWithUTF8String:"chamoisHideDockExternal"];
    v24[3] = v8;
    long long v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];

    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __71__SBFluidSwitcherViewController__updateChamoisDefaultsObserverIfNeeded__block_invoke;
    uint64_t v20 = &unk_1E6AF5AF0;
    objc_copyWeak(&v22, &location);
    id v21 = self;
    long long v10 = (void (**)(void))MEMORY[0x1D948C7A0](&v17);
    defaults = self->_defaults;
    uint64_t v12 = MEMORY[0x1E4F14428];
    id v13 = MEMORY[0x1E4F14428];
    -[SBAppSwitcherDefaults observeDefaults:onQueue:withBlock:](defaults, "observeDefaults:onQueue:withBlock:", v9, v12, v10, v17, v18, v19, v20);
    long long v14 = (BSDefaultObserver *)objc_claimAutoreleasedReturnValue();
    double v15 = self->_chamoisDefaultsObserver;
    self->_chamoisDefaultsObserver = v14;

    v10[2](v10);
    objc_destroyWeak(&v22);

    objc_destroyWeak(&location);
  }
}

void __71__SBFluidSwitcherViewController__updateChamoisDefaultsObserverIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained _sbWindowScene];
    int v5 = [v4 isExtendedDisplayWindowScene];

    id v6 = (void *)*((void *)v3 + 133);
    if (v5)
    {
      int v7 = [v6 chamoisHideStripsExternal];
      int v8 = [*((id *)v3 + 133) chamoisHideDockExternal];
    }
    else
    {
      int v7 = [v6 chamoisHideStrips];
      int v8 = [*((id *)v3 + 133) chamoisHideDock];
    }
    if (v3[1360] != v7 || v3[1361] != v8)
    {
      v3[1360] = v7;
      v3[1361] = v8;
      if (v7 && SBFIsChamoisStripDisabledWhenHiddenAvailable()) {
        *(void *)(*(void *)(a1 + 32) + 1688) &= ~1uLL;
      }
      long long v9 = [v3 viewIfLoaded];

      if (v9)
      {
        long long v10 = v3;
        BSRunLoopPerformRelativeToCACommit();
      }
    }
  }
}

void __71__SBFluidSwitcherViewController__updateChamoisDefaultsObserverIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v4 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
  [(SBSwitcherTransitionRequest *)v4 setSource:65];
  id v2 = *(void **)(a1 + 32);
  unint64_t v3 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v4 gestureInitiated:0];
  [v2 _handleEventResponse:v3];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_dismissTapGestureRecognizer == a3)
  {
    [a4 locationInView:self->_contentView];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    long long v10 = -[SBFluidSwitcherViewController _firstZOrderedSubviewViewAtLocation:](self, "_firstZOrderedSubviewViewAtLocation:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v11 = 0;
      BOOL v12 = v10 == 0;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      char v11 = isKindOfClass ^ 1;
      BOOL v12 = v10 == 0;
      if (v10 && (isKindOfClass & 1) == 0)
      {
        long long v14 = SBLogAppSwitcher();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          debugName = self->_debugName;
          v26.double x = v7;
          v26.double y = v9;
          double v16 = NSStringFromPoint(v26);
          int v19 = 138543874;
          uint64_t v20 = debugName;
          __int16 v21 = 2114;
          id v22 = v16;
          __int16 v23 = 2114;
          id v24 = (id)objc_opt_class();
          id v17 = v24;
          _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dismissing switcher for touch at location %{public}@ on view of class: %{public}@", (uint8_t *)&v19, 0x20u);
        }
        BOOL v12 = 0;
      }
    }
    char v4 = v12 | v11;
  }
  else
  {
    char v4 = 1;
  }
  return v4 & 1;
}

- (id)_firstZOrderedSubviewViewAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v6 = [(SBFluidSwitcherContentView *)self->_contentView subviews];
  CGFloat v7 = [v6 reverseObjectEnumerator];

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
        BOOL v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        -[SBFluidSwitcherContentView convertPoint:toView:](self->_contentView, "convertPoint:toView:", v12, x, y);
        id v13 = objc_msgSend(v12, "hitTest:withEvent:", 0);

        if (v13)
        {
          id v14 = v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (void)slideOverTongueViewTapped:(id)a3
{
  if (self->_slideOverTongue == a3)
  {
    char v4 = objc_alloc_init(SBTapSlideOverTongueSwitcherModifierEvent);
    [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v4];
  }
}

- (void)continuousExposeStripTongueViewTapped:(id)a3
{
  unint64_t continuousExposeStripsPresentationOptions = self->_continuousExposeStripsPresentationOptions;
  if ((continuousExposeStripsPresentationOptions & 1) == 0)
  {
    self->_unint64_t continuousExposeStripsPresentationOptions = continuousExposeStripsPresentationOptions | 1;
    int v5 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:3];
    [(SBFluidSwitcherViewController *)self _handleEventResponse:v5];
    [(SBFluidSwitcherViewController *)self dismissContinuousExposeStripEdgeProtectTongue];
  }
}

- (void)eventSource:(id)a3 userTouchedApplication:(id)a4
{
  if (self->_continuousExposeStripsPresentationOptions)
  {
    self->_unint64_t continuousExposeStripsPresentationOptions = 0;
    int v5 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:12 updateMode:3];
    [(SBFluidSwitcherViewController *)self _handleEventResponse:v5];
  }
}

- (void)pointerDidMoveToFromWindowScene:(id)a3 toWindowScene:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  if (v6 && v14 && v7)
  {
    if (v7 == v14)
    {
      uint64_t v8 = [(id)SBApp externalDisplayService];
      uint64_t v9 = [v6 _fbsDisplayIdentity];
      uint64_t v10 = [v14 _fbsDisplayIdentity];
      char v11 = [v8 preferredArrangementOfDisplay:v9 relativeTo:v10];
      uint64_t v12 = 1;
    }
    else
    {
      if (v7 != v6) {
        goto LABEL_10;
      }
      uint64_t v8 = [(id)SBApp externalDisplayService];
      uint64_t v9 = [v14 _fbsDisplayIdentity];
      uint64_t v10 = [v6 _fbsDisplayIdentity];
      char v11 = [v8 preferredArrangementOfDisplay:v9 relativeTo:v10];
      uint64_t v12 = 0;
    }

    id v13 = -[SBPointerCrossedDisplayBoundarySwitcherModifierEvent initWithDirection:edge:]([SBPointerCrossedDisplayBoundarySwitcherModifierEvent alloc], "initWithDirection:edge:", v12, [v11 edge]);
    if (v13)
    {
      [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v13];
    }
  }
LABEL_10:
}

- (void)assistantWillAppear:(id)a3
{
  self->_assistantPresentationState = 2;
  char v4 = objc_alloc_init(SBAssistantPresentationChangedSwitcherModifierEvent);
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v4];
}

- (void)assistantDidAppear:(id)a3
{
  self->_assistantPresentationState = 3;
  char v4 = objc_alloc_init(SBAssistantPresentationChangedSwitcherModifierEvent);
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v4];
}

- (void)assistantWillDisappear:(id)a3
{
  self->_assistantPresentationState = 1;
  char v4 = objc_alloc_init(SBAssistantPresentationChangedSwitcherModifierEvent);
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v4];
}

- (void)assistantDidDisappear:(id)a3
{
  self->_assistantPresentationState = 0;
  char v4 = objc_alloc_init(SBAssistantPresentationChangedSwitcherModifierEvent);
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v4];
}

- (void)assistantDidChangePresentation:(id)a3
{
  char v4 = objc_alloc_init(SBAssistantPresentationChangedSwitcherModifierEvent);
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v4];
}

- (BOOL)shouldMatchMoveIconZoomingView:(id)a3
{
  char v4 = [a3 window];
  int v5 = [(SBFluidSwitcherViewController *)self _floatingDockController];
  id v6 = [v5 floatingDockWindow];
  id v7 = [(SBFluidSwitcherViewController *)self _homeScreenAppearanceController];
  uint64_t v8 = [v7 window];
  BOOL v10 = v4 == v8 || v4 == v6;

  return v10;
}

- (id)iconGridSizeClassForAppLayout:(id)a3
{
  id v5 = (id)*MEMORY[0x1E4FA6518];
  id v6 = [(SBFluidSwitcherViewController *)self iconViewForAppLayout:a3];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 icon];
    uint64_t v9 = [v8 gridSizeClass];

    id v5 = (id)v9;
  }

  return v5;
}

- (void)noteIconZoomingViewWillZoomDown:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v9 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v9;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [(SBFluidSwitcherViewController *)self _iconManager];
  [v8 noteIconViewWillZoomDown:v7];
}

- (void)temporarilyHideMatchMovedZoomDownAnimationViewForIconView:(id)a3
{
  id v7 = a3;
  id v4 = [(NSMutableDictionary *)self->_hiddenIconViews allValues];
  if ([v4 containsObject:v7])
  {
  }
  else
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_hiddenIconViewContainers allValues];
    int v6 = [v5 containsObject:v7];

    if (!v6) {
      goto LABEL_5;
    }
  }
  [(SBFluidSwitcherViewController *)self _temporarilyHideMatchMovedZoomDownAnimationViewAnimated:0];
LABEL_5:
}

- (double)windowLevelForModifierTimelineController:(id)a3
{
  unint64_t v3 = [(SBFluidSwitcherViewController *)self view];
  id v4 = [v3 window];
  [v4 windowLevel];
  double v6 = v5 + *MEMORY[0x1E4F43F20] + 5.0 + 5.0 - (*MEMORY[0x1E4F43F20] + 5.0);

  return v6;
}

- (void)_reduceMotionStatusDidChange:(id)a3
{
  id v4 = objc_alloc_init(SBReduceMotionChangedSwitcherModifierEvent);
  [(SBFluidSwitcherViewController *)self _dispatchEventAndHandleAction:v4];
  [(SBFluidSwitcherViewController *)self _updateSwitcherBackdropViewPresence];
}

- (id)sourceLeafAppLayoutForCenterItem:(id)a3
{
  id v4 = a3;
  double v5 = +[SBApplicationController sharedInstance];
  double v6 = [v5 applicationForDisplayItem:v4];

  id v7 = [v6 _dataStore];
  uint64_t v8 = [v4 uniqueIdentifier];
  id v9 = [v7 sceneStoreForIdentifier:v8 creatingIfNecessary:0];

  BOOL v10 = [v9 objectForKey:@"sourceSceneIdentifier"];
  if (!v10
    || ([v4 uniqueIdentifier],
        char v11 = objc_claimAutoreleasedReturnValue(),
        [v10 objectForKey:v11],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v12))
  {
    id v14 = 0;
LABEL_9:
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__14;
  double v36 = __Block_byref_object_dispose__14;
  id v37 = 0;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy__14;
  long long v30 = __Block_byref_object_dispose__14;
  id v31 = 0;
  id v13 = [(SBFluidSwitcherViewController *)self appLayouts];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __66__SBFluidSwitcherViewController_sourceLeafAppLayoutForCenterItem___block_invoke;
  uint64_t v21 = &unk_1E6AFABB8;
  id v22 = v4;
  id v14 = v12;
  id v23 = v14;
  id v24 = &v32;
  uint64_t v25 = &v26;
  [v13 enumerateObjectsUsingBlock:&v18];

  if (v33[5] && (double v15 = (void *)v27[5]) != 0)
  {
    uint64_t v12 = objc_msgSend(v15, "leafAppLayoutForItem:", v18, v19, v20, v21, v22);
    int v16 = 0;
  }
  else
  {
    int v16 = 1;
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  if (v16) {
    goto LABEL_9;
  }
LABEL_10:

  return v12;
}

void __66__SBFluidSwitcherViewController_sourceLeafAppLayoutForCenterItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__SBFluidSwitcherViewController_sourceLeafAppLayoutForCenterItem___block_invoke_2;
  v8[3] = &unk_1E6AFAB90;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  long long v12 = *(_OWORD *)(a1 + 48);
  id v7 = v6;
  id v11 = v7;
  [v7 enumerate:v8];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    *a4 = 1;
  }
}

void __66__SBFluidSwitcherViewController_sourceLeafAppLayoutForCenterItem___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) type];
  if (v7 == [v10 type])
  {
    uint64_t v8 = [v10 uniqueIdentifier];
    int v9 = [v8 hasSuffix:*(void *)(a1 + 40)];

    if (v9)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 48));
      *a4 = 1;
    }
  }
}

- (SBBestAppSuggestion)bestAppSuggestion
{
  return self->_bestAppSuggestion;
}

- (void)setBestAppSuggestion:(id)a3
{
}

- (BOOL)isAsyncRenderingDisabled
{
  return self->_asyncRenderingDisabled;
}

- (void)setScrollView:(id)a3
{
}

- (SBFluidSwitcherContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (void)setLayoutContext:(id)a3
{
}

- (void)setVisibleItemContainers:(id)a3
{
}

- (NSMutableDictionary)visibleOverlayAccessoryViews
{
  return self->_visibleOverlayAccessoryViews;
}

- (void)setVisibleOverlayAccessoryViews:(id)a3
{
}

- (NSMutableDictionary)visibleUnderlayAccessoryViews
{
  return self->_visibleUnderlayAccessoryViews;
}

- (void)setVisibleUnderlayAccessoryViews:(id)a3
{
}

- (NSMutableDictionary)externalDropletZoomUpTokens
{
  return self->_externalDropletZoomUpTokens;
}

- (void)setExternalDropletZoomUpTokens:(id)a3
{
}

- (NSMutableDictionary)visibleItemContainerBackdropViews
{
  return self->_visibleItemContainerBackdropViews;
}

- (void)setVisibleItemContainerBackdropViews:(id)a3
{
}

- (NSMutableSet)focusedItemBackdropsBeingRemoved
{
  return self->_focusedItemBackdropsBeingRemoved;
}

- (void)setFocusedItemBackdropsBeingRemoved:(id)a3
{
}

- (NSMutableDictionary)liveContentOverlays
{
  return self->_liveContentOverlays;
}

- (NSMutableArray)hiddenRecycledItemContainers
{
  return self->_hiddenRecycledItemContainers;
}

- (void)setHiddenRecycledItemContainers:(id)a3
{
}

- (void)setVisibleShelves:(id)a3
{
}

- (NSMutableSet)visibleShelvesHostedInContentView
{
  return self->_visibleShelvesHostedInContentView;
}

- (void)setVisibleShelvesHostedInContentView:(id)a3
{
}

- (NSMutableDictionary)hiddenAppLayoutAssertionsForShelves
{
  return self->_hiddenAppLayoutAssertionsForShelves;
}

- (void)setHiddenAppLayoutAssertionsForShelves:(id)a3
{
}

- (SBScrollSwitcherModifierEvent)currentScrollEvent
{
  return self->_currentScrollEvent;
}

- (void)setCurrentScrollEvent:(id)a3
{
}

- (SBFluidSwitcherButton)plusButton
{
  return self->_plusButton;
}

- (void)setPlusButton:(id)a3
{
}

- (SBFluidSwitcherTitledButton)reopenClosedWindowsButton
{
  return self->_reopenClosedWindowsButton;
}

- (void)setReopenClosedWindowsButton:(id)a3
{
}

- (SBSwitcherModifier)rootModifier
{
  return self->_rootModifier;
}

- (void)setRootModifier:(id)a3
{
}

- (SBSwitcherModifier)reduceMotionModifier
{
  return self->_reduceMotionModifier;
}

- (void)setReduceMotionModifier:(id)a3
{
}

- (NSMutableDictionary)hiddenIconViews
{
  return self->_hiddenIconViews;
}

- (void)setHiddenIconViews:(id)a3
{
}

- (NSMutableDictionary)hiddenIconViewContainers
{
  return self->_hiddenIconViewContainers;
}

- (void)setHiddenIconViewContainers:(id)a3
{
}

- (SBFloatingDockBehaviorAssertion)inAppFloatingDockBehaviorAssertion
{
  return self->_inAppFloatingDockBehaviorAssertion;
}

- (void)setInAppFloatingDockBehaviorAssertion:(id)a3
{
}

- (SBFloatingDockBehaviorAssertion)transientOverlayFloatingDockBehaviorAssertion
{
  return self->_transientOverlayFloatingDockBehaviorAssertion;
}

- (void)setTransientOverlayFloatingDockBehaviorAssertion:(id)a3
{
}

- (SBFloatingDockBehaviorAssertion)switcherFloatingDockBehaviorAssertion
{
  return self->_switcherFloatingDockBehaviorAssertion;
}

- (void)setSwitcherFloatingDockBehaviorAssertion:(id)a3
{
}

- (SBFloatingDockWindowLevelAssertion)switcherFloatingDockWindowLevelAssertion
{
  return self->_switcherFloatingDockWindowLevelAssertion;
}

- (void)setSwitcherFloatingDockWindowLevelAssertion:(id)a3
{
}

- (SBFloatingDockWindowLevelAssertion)transientOverlayFloatingDockWindowLevelAssertion
{
  return self->_transientOverlayFloatingDockWindowLevelAssertion;
}

- (void)setTransientOverlayFloatingDockWindowLevelAssertion:(id)a3
{
}

- (void)setHomeGrabberSettings:(id)a3
{
}

- (UILabel)modifierStackDebugLabel
{
  return self->_modifierStackDebugLabel;
}

- (void)setModifierStackDebugLabel:(id)a3
{
}

- (NSMutableDictionary)animatableProperties
{
  return self->_animatableProperties;
}

- (void)setAnimatableProperties:(id)a3
{
}

- (SBIconView)bounceIconView
{
  return self->_bounceIconView;
}

- (void)setBounceIconView:(id)a3
{
}

- (unint64_t)bounceIconGenerationCount
{
  return self->_bounceIconGenerationCount;
}

- (void)setBounceIconGenerationCount:(unint64_t)a3
{
  self->_bounceIconGenerationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bounceIconView, 0);
  objc_storeStrong((id *)&self->_animatableProperties, 0);
  objc_storeStrong((id *)&self->_wallpaperRequireAssertion, 0);
  objc_storeStrong((id *)&self->_modifierStackDebugLabel, 0);
  objc_destroyWeak((id *)&self->_pipViewMorphAnimator);
  objc_storeStrong((id *)&self->_homeGrabberSettings, 0);
  objc_storeStrong((id *)&self->_transientOverlayFloatingDockWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_switcherFloatingDockWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_switcherFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_transientOverlayFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_inAppFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_hiddenIconViewContainers, 0);
  objc_storeStrong((id *)&self->_hiddenIconViews, 0);
  objc_storeStrong((id *)&self->_reduceMotionModifier, 0);
  objc_storeStrong((id *)&self->_rootModifier, 0);
  objc_storeStrong((id *)&self->_reopenClosedWindowsButton, 0);
  objc_storeStrong((id *)&self->_plusButton, 0);
  objc_storeStrong((id *)&self->_currentScrollEvent, 0);
  objc_storeStrong((id *)&self->_hiddenAppLayoutAssertionsForShelves, 0);
  objc_storeStrong((id *)&self->_visibleShelvesHostedInContentView, 0);
  objc_storeStrong((id *)&self->_visibleShelves, 0);
  objc_storeStrong((id *)&self->_hiddenRecycledItemContainers, 0);
  objc_storeStrong((id *)&self->_liveContentOverlays, 0);
  objc_storeStrong((id *)&self->_focusedItemBackdropsBeingRemoved, 0);
  objc_storeStrong((id *)&self->_visibleItemContainerBackdropViews, 0);
  objc_storeStrong((id *)&self->_externalDropletZoomUpTokens, 0);
  objc_storeStrong((id *)&self->_visibleUnderlayAccessoryViews, 0);
  objc_storeStrong((id *)&self->_visibleOverlayAccessoryViews, 0);
  objc_storeStrong((id *)&self->_visibleItemContainers, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_bestAppSuggestion, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationRestrictionUpdatePendingAssertion, 0);
  objc_storeStrong((id *)&self->_continuousExposeStripTongue, 0);
  objc_storeStrong((id *)&self->_continuousExposeStripTongueBackdropCaptureLayoutElement, 0);
  objc_storeStrong((id *)&self->_continuousExposeStripTongueCaptureOnlyBackdropView, 0);
  objc_storeStrong((id *)&self->_continuousExposeStripCaptureAndBlurHomeScreenBackdropView, 0);
  objc_storeStrong((id *)&self->_displayItemLayoutAttributesCalculator, 0);
  objc_storeStrong((id *)&self->_itemContainerToResizeUsingPointer, 0);
  objc_storeStrong((id *)&self->_appLayoutsForContinuousExposeIdentifiers, 0);
  objc_storeStrong((id *)&self->_continuousExposeIdentifiersInStrip, 0);
  objc_storeStrong((id *)&self->_continuousExposeIdentifiersInSwitcher, 0);
  objc_storeStrong((id *)&self->_foregroundingAppLayouts, 0);
  objc_storeStrong((id *)&self->_cachedOrderedAllLayoutElementViews, 0);
  objc_storeStrong((id *)&self->_shadowPathDisplayLink, 0);
  objc_storeStrong((id *)&self->_shadowPathDisplayLinkRequiringReasons, 0);
  objc_storeStrong((id *)&self->_pendingCenterWindowCleanupAction, 0);
  objc_storeStrong(&self->_centerWindowInAppMorphCompletion, 0);
  objc_storeStrong((id *)&self->_centerWindowActivationAnimationContexts, 0);
  objc_storeStrong((id *)&self->_rootDestOutClippingView, 0);
  objc_storeStrong((id *)&self->_systemApertureShadowAssertion, 0);
  objc_storeStrong((id *)&self->_systemApertureKeyLineAssertionsByInvalidationUUID, 0);
  objc_storeStrong((id *)&self->_systemApertureGlobalSuppressionAssertionsByInvalidationUUID, 0);
  objc_storeStrong((id *)&self->_systemApertureContentSuppressionAssertionsByInvalidationUUID, 0);
  objc_storeStrong((id *)&self->_systemApertureContentSuppressionAssertionsForGesture, 0);
  objc_storeStrong((id *)&self->_underlayAccessoryViewsReusePool, 0);
  objc_storeStrong((id *)&self->_overlayAccessoryViewsReusePool, 0);
  objc_storeStrong((id *)&self->_shelfFocusedDisplayItems, 0);
  objc_storeStrong((id *)&self->_shelfBackgroundView, 0);
  objc_storeStrong((id *)&self->_bezelEffectsPortalObserverToken, 0);
  objc_storeStrong((id *)&self->_bezelEffectsLayoutElement, 0);
  objc_storeStrong((id *)&self->_bezelEffectsPortalView, 0);
  objc_storeStrong((id *)&self->_slideOverTongueLayoutElement, 0);
  objc_storeStrong((id *)&self->_slideOverTongue, 0);
  objc_storeStrong((id *)&self->_genericAccessoryLayoutElement, 0);
  objc_storeStrong((id *)&self->_dimmingViewLayoutElement, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_backdropLayoutElement, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_stashedContentView, 0);
  objc_storeStrong((id *)&self->_borrowableScrollViewPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_outstandingAnimations, 0);
  objc_storeStrong((id *)&self->_chamoisDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong(&self->_activeTransitionSubcompletionGenerator, 0);
  objc_storeStrong((id *)&self->_leafAppLayoutsToRecencyAppLayouts, 0);
  objc_storeStrong((id *)&self->_leafAppLayoutsToAdjustedAppLayouts, 0);
  objc_storeStrong((id *)&self->_visibleAdjustedAppLayouts, 0);
  objc_storeStrong((id *)&self->_requestedHiddenAppLayouts, 0);
  objc_storeStrong((id *)&self->_cachedAdjustedLeafAppLayouts, 0);
  objc_storeStrong((id *)&self->_cachedAdjustedAppLayouts, 0);
  objc_storeStrong((id *)&self->_modifierTimelineController, 0);
  objc_storeStrong((id *)&self->_hitTestBlockerView, 0);
  objc_storeStrong((id *)&self->_crossfadeSnapshotView, 0);
  objc_storeStrong((id *)&self->_dismissTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_reduceMotionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_flyInFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_emptySwitcherFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_pendingTransitionContext, 0);
  objc_storeStrong((id *)&self->_fluidSwitcherAssertionReason, 0);
  objc_storeStrong((id *)&self->_lastKeyboardSuppressionMode, 0);
  objc_storeStrong((id *)&self->_lastAppLayoutsToResignActive, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertions, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_transitionBeginResignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_sheetMetricsCache, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_lockoutVCProvider, 0);
  objc_storeStrong((id *)&self->_snapshotCache, 0);
  objc_storeStrong((id *)&self->_pageContentViewProvider, 0);
  objc_storeStrong((id *)&self->_appLayoutToTitleItemController, 0);
  objc_storeStrong((id *)&self->_liveContentOverlayCoordinator, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_layoutStateTransitionCoordinator, 0);
}

- (BOOL)shouldMorphToPIPForTransitionContext:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFluidSwitcherViewController *)self dataSource];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 switcherContentController:self shouldMorphToPIPForTransitionContext:v4];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (id)_webClipIdentifierForAppClipBundleIdentifier:(id)a3 sceneIdentifier:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4F628D8];
  id v6 = a4;
  uint64_t v7 = [v5 storeForApplication:a3];
  uint64_t v8 = [v7 sceneStoreForIdentifier:v6 creatingIfNecessary:0];

  int v9 = [v8 objectForKey:@"appClipIdentifier"];

  return v9;
}

void __74__SBFluidSwitcherViewController_Common___mediumGridSizeClassesForIconZoom__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4FA6288]);
  uint64_t v1 = [v0 initWithGridSizeClass:*MEMORY[0x1E4FA6530]];
  id v2 = (void *)_mediumGridSizeClassesForIconZoom_gridSizeClasses;
  _mediumGridSizeClassesForIconZoom_gridSizeClasses = v1;
}

void __73__SBFluidSwitcherViewController_Common___largeGridSizeClassesForIconZoom__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4FA6288]);
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FA6528], *MEMORY[0x1E4FA6538], *MEMORY[0x1E4FA6520], 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 initWithGridSizeClasses:v3];
  id v2 = (void *)_largeGridSizeClassesForIconZoom_gridSizeClasses;
  _largeGridSizeClassesForIconZoom_gridSizeClasses = v1;
}

- (id)_floatingDockIconLocationForTransitionSource:(int64_t)a3
{
  if (a3 == 24)
  {
    id v3 = (void **)MEMORY[0x1E4FA6690];
  }
  else if (a3 == 25)
  {
    id v3 = (void **)&SBIconLocationFloatingDockSuggestions;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherViewController+Common.m" lineNumber:142 description:@"_floatingDockIconLocationForTransitionRequestSource: source must be a transition request from the dock"];

    id v3 = (void **)MEMORY[0x1E4FA66C8];
  }
  uint64_t v7 = *v3;
  return v7;
}

- (id)iconForDisplayItem:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFluidSwitcherViewController *)self _sbWindowScene];
  id v6 = [v5 homeScreenController];
  uint64_t v7 = [v6 iconManager];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = +[SBIconController sharedInstance];
    id v9 = [v10 iconManager];
  }
  id v11 = [(SBFluidSwitcherViewController *)self layoutContext];
  long long v12 = [v4 bundleIdentifier];
  if ([v4 type])
  {
    uint64_t v13 = [v4 type];
    id v14 = [v9 iconModel];
    double v15 = v14;
    if (v13 == 5)
    {
      int v16 = [v4 webClipIdentifier];
      long long v17 = [v15 leafIconForIdentifier:v16];

      goto LABEL_10;
    }
    uint64_t v19 = [v14 leafIconForIdentifier:v12];
  }
  else
  {
    uint64_t v18 = [v11 activeTransitionContext];
    double v15 = [(SBFluidSwitcherViewController *)self _workspaceEntityForBundleIdentifier:v12 inTransitionContext:v18];

    uint64_t v19 = [(SBFluidSwitcherViewController *)self _iconForWorkspaceEntity:v15];
  }
  long long v17 = (void *)v19;
LABEL_10:

  return v17;
}

- (void)liveContentOverlayDidUpdateHomeAffordanceEdgeProtectOrAutoHide:(id *)a1 .cold.1(id *a1)
{
  [*a1 count];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x16u);
}

- (void)_updateEdgeProtectAndAutoHideForHomeAffordancesInAppLayout:withResetDelay:unhideDelay:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_ERROR, "Didn't find grabberView for %@", v1, 0xCu);
}

- (void)_appLayoutFromLayoutElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_ERROR, "Unexpected class for SBSwitcherLayoutElementTypeAppLayout: %@", v1, 0xCu);
}

- (void)_appLayoutFromLayoutElement:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  [a2 switcherLayoutElementType];
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x20u);
}

- (void)overlayAccessoryView:(void *)a1 didSelectHeaderForRole:.cold.1(void *a1)
{
  uint64_t v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0xCu);
}

- (void)_dispatchEventAndHandleAction:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Failed to handle prelude animation token in Switcher transition event; canceling",
    v1,
    2u);
}

@end