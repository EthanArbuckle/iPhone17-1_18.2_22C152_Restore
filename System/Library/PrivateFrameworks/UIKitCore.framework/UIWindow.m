@interface UIWindow
+ (BOOL)_allWindowsKeepContextInBackground;
+ (BOOL)_isSecure;
+ (BOOL)_isSystemWindow;
+ (BOOL)_needsPassthroughInteraction;
+ (BOOL)_prefersStatusBarHiddenInWindow:(id)a3 animationProvider:(id *)a4;
+ (BOOL)_prefersStatusBarHiddenInWindow:(id)a3 targetOrientation:(int64_t)a4 animationProvider:(id *)a5;
+ (BOOL)_shouldSoftAssertOnSetScreen;
+ (BOOL)_temporary_shouldSizeWindowsAutomaticallyPlistOverrideSet;
+ (BOOL)_transformLayerRotationsAreEnabled;
+ (BOOL)shouldRestrictViewsForSplashboard;
+ (Class)layerClass;
+ (NSArray)restrictedSplashboardClasses;
+ (id)_applicationKeyWindow;
+ (id)_externalKeyWindow;
+ (id)_findWindowForControllingOverallAppearance;
+ (id)_findWindowForControllingOverallAppearanceInWindowScene:(id)a3;
+ (id)_findWithDisplayPoint:(CGPoint)a3;
+ (id)_globalHitTestForLocation:(CGPoint)a3 sceneLocationZ:(double)a4 inWindowServerHitTestWindow:(id)a5 withEvent:(id)a6;
+ (id)_hitTestToPoint:(CGPoint)a3 scenePointZ:(double)a4 forEvent:(id)a5 windowServerHitTestWindow:(id)a6;
+ (id)_synchronizedDrawingFence;
+ (id)_topVisibleWindowPassingTest:(id)a3;
+ (id)_windowWithContextId:(unsigned int)a3;
+ (id)allWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4;
+ (id)allWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4 forScreen:(id)a5;
+ (int64_t)_preferredStatusBarStyleInWindow:(id)a3 resolvedStyle:(int64_t *)a4 withPartStyles:(id *)a5 animationProvider:(id *)a6;
+ (uint64_t)_checkPreCommitHandlersAfterCAFlush;
+ (unsigned)_synchronizeDrawingAcrossProcesses;
+ (void)_enumerateWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4 allowMutation:(BOOL)a5 withBlock:(id)a6;
+ (void)_executeDeferredOrientationUpdates;
+ (void)_noteStatusBarHeightChanged:(double)a3 oldHeight:(double)a4;
+ (void)_setAllWindowsKeepContextInBackground:(BOOL)a3;
+ (void)_synchronizeDrawing;
+ (void)_synchronizeDrawingAcrossProcessesOverPort:(unsigned int)a3;
+ (void)_synchronizeDrawingAcrossProcessesOverPort:(unsigned int)a3 withPreCommitHandler:(id)a4;
+ (void)_synchronizeDrawingWithCAFence:(id)a3 preCommitHandler:(id)a4;
+ (void)_synchronizeDrawingWithFence:(id)a3;
+ (void)_synchronizeDrawingWithFence:(id)a3 preCommitHandler:(id)a4;
+ (void)_synchronizeDrawingWithPreCommitHandler:(id)a3;
+ (void)_unregisterChargedView:(id)a3;
+ (void)adjustFocusForAccessibilityIfNeeded:(id)a3;
+ (void)adjustForAccessibilityIfNeeded:(id)a3;
+ (void)createIOSurfaceFromDisplayConfiguration:(id)a3;
+ (void)createIOSurfaceFromScreen:(id)a3;
+ (void)createIOSurfaceOnScreen:(id)a3 withContextIds:(const unsigned int *)a4 count:(unint64_t)a5 frame:(CGRect)a6 baseTransform:(CGAffineTransform *)a7;
+ (void)createIOSurfaceOnScreen:(id)a3 withContextIds:(const unsigned int *)a4 count:(unint64_t)a5 frame:(CGRect)a6 usePurpleGfx:(BOOL)a7 outTransform:(CGAffineTransform *)a8;
+ (void)createIOSurfaceWithContextIds:(const unsigned int *)a3 count:(unint64_t)a4 frame:(CGRect)a5;
+ (void)createIOSurfaceWithContextIds:(const unsigned int *)a3 count:(unint64_t)a4 frame:(CGRect)a5 outTransform:(CGAffineTransform *)a6;
+ (void)createIOSurfaceWithContextIds:(const unsigned int *)a3 count:(unint64_t)a4 frame:(CGRect)a5 usePurpleGfx:(BOOL)a6 outTransform:(CGAffineTransform *)a7;
+ (void)createScreenIOSurface;
+ (void)initialize;
+ (void)setRestrictedSplashboardClasses:(id)a3;
+ (void)setShouldRestrictViewsForSplashboard:(BOOL)a3;
- ($015CE332057EA49C37F0282AEB389482)_bindingDescription;
- ($0AC6E346AE4835514AAA8AC86D8F4844)__sizeClassPair;
- (BOOL)__hostViewUnderlapsStatusBar;
- (BOOL)__isKindOfUIWindow;
- (BOOL)__isLandmarkView;
- (BOOL)_allowsLinkPreviewInteractionInViewServices;
- (BOOL)_allowsOcclusionDetectionOverride;
- (BOOL)_alwaysGetsContexts;
- (BOOL)_appearsInLoupe;
- (BOOL)_automaticContainerBackgroundIsGlass;
- (BOOL)_becomeFirstResponderWhenPossible;
- (BOOL)_cachedTraitCollectionIsValid;
- (BOOL)_canActAsKeyWindowForScreen:(id)a3;
- (BOOL)_canAffectStatusBarAppearance;
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_canBecomeLayoutEngineDelegate;
- (BOOL)_canDisableMirroring;
- (BOOL)_canIgnoreInteractionEvents;
- (BOOL)_canPromoteFromKeyWindowStack;
- (BOOL)_constrainsHoverEventHitTesting;
- (BOOL)_containedGestureRecognizersShouldRespectGestureServerInstructions;
- (BOOL)_containedInAbsoluteResponderChain;
- (BOOL)_definesDynamicTintColor;
- (BOOL)_disableAutomaticKeyboardBehavior;
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)_extendsScreenSceneLifetime;
- (BOOL)_focusEventRecognizer:(id)a3 didRecognizeFocusMovementRequest:(id)a4;
- (BOOL)_guardSizeTransitionFromAnimations;
- (BOOL)_hasAmbiguousLayout;
- (BOOL)_hasContext;
- (BOOL)_hasSystemGestureGate;
- (BOOL)_ignoresHitTest;
- (BOOL)_includeInDefaultImageSnapshot;
- (BOOL)_isAlwaysKeyboardWindow;
- (BOOL)_isApplicationKeyWindow;
- (BOOL)_isConstrainedByScreenJail;
- (BOOL)_isExternallyPlaced;
- (BOOL)_isHostedInAnotherProcess;
- (BOOL)_isHostingPortalViews;
- (BOOL)_isInAWindow;
- (BOOL)_isLoweringAnchoringConstraints;
- (BOOL)_isRemoteInputHostWindow;
- (BOOL)_isRemoteKeyboardWindow;
- (BOOL)_isResigningFirstResponderFromHost;
- (BOOL)_isSceneSized;
- (BOOL)_isScrollingEnabledForView:(id)a3;
- (BOOL)_isSecure;
- (BOOL)_isSettingFirstResponder;
- (BOOL)_isStatusBarWindow;
- (BOOL)_isSystemGestureWindow;
- (BOOL)_isTextEffectsWindow;
- (BOOL)_isTextEffectsWindowHosting;
- (BOOL)_isTextEffectsWindowNotificationOwner;
- (BOOL)_isTransparentFocusRegion;
- (BOOL)_isVisible;
- (BOOL)_isWindowServerHostingManaged;
- (BOOL)_needsShakesWhenInactive;
- (BOOL)_prefersFocusContainment;
- (BOOL)_requiresKeyboardPresentationFence;
- (BOOL)_resizeWindowFrameToSceneBoundsIfNecessary;
- (BOOL)_reversesLinearFocusWrapping;
- (BOOL)_shouldAdjustSizeClassesAndResizeWindow;
- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3 checkForDismissal:(BOOL)a4 isRotationDisabled:(BOOL *)a5;
- (BOOL)_shouldControlAutorotation;
- (BOOL)_shouldCreateContextAsSecure;
- (BOOL)_shouldDelayTouchForSystemGestures:(id)a3;
- (BOOL)_shouldDisableTransformLayerScalingForSnapshotting;
- (BOOL)_shouldForceTraitPropagationThroughHierarchy;
- (BOOL)_shouldInstallRootPresentationController;
- (BOOL)_shouldPrepareScreenForWindow;
- (BOOL)_shouldPropagateTraitCollectionChanges;
- (BOOL)_shouldRecognizeEventsInFocusEventRecognizer:(id)a3;
- (BOOL)_shouldResizeWithScene;
- (BOOL)_shouldTextEffectsWindowBeHostedForView:(id)a3;
- (BOOL)_shouldUseRemoteContext;
- (BOOL)_supportsBecomeFirstResponderWhenPossible;
- (BOOL)_suppressFirstResponderWhenUserInteractionDisabled;
- (BOOL)_systemGestureRecognitionIsPossible;
- (BOOL)_touchesInsideShouldHideCalloutBarForViewHierarchy:(id)a3;
- (BOOL)_transformLayerIncludesScreenRotation;
- (BOOL)_updatesSafeAreaInsetsOnRead;
- (BOOL)_usesLegacySupportedOrientationChecks;
- (BOOL)_usesWindowServerHitTesting;
- (BOOL)_wantsFocusEngine;
- (BOOL)_wantsResponderWithoutKeyboard;
- (BOOL)_windowCanDynamicallySpecifySupportedInterfaceOrientations;
- (BOOL)_windowControlsStatusBarOrientation;
- (BOOL)_windowOwnsInterfaceOrientation;
- (BOOL)_windowOwnsInterfaceOrientationTransform;
- (BOOL)autorotates;
- (BOOL)becomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canResizeToFitContent;
- (BOOL)hasAmbiguousLayout;
- (BOOL)inhibitManualTransform;
- (BOOL)inhibitSetupOrientation;
- (BOOL)inhibitTextEffectsRotation;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)isInterfaceAutorotationDisabled;
- (BOOL)isInternalWindow;
- (BOOL)isKeyWindow;
- (BOOL)isRotating;
- (BOOL)isTrackingKeyboard;
- (BOOL)isTransparentFocusItem;
- (BOOL)isUsingOnePartRotationAnimation;
- (BOOL)keepContextInBackground;
- (BOOL)moveKeyboardLayoutGuideOverEdge:(unint64_t)a3 layoutViews:(BOOL)a4;
- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5;
- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3;
- (BOOL)resizesToFullScreen;
- (CAContext)_boundContext;
- (CGAffineTransform)_viewTransformForInterfaceOrientation:(SEL)a3;
- (CGPoint)_constrainTouchLocationToScene:(CGPoint)a3;
- (CGPoint)_convertOffset:(CGPoint)a3 fromWindow:(id)a4;
- (CGPoint)_convertOffset:(CGPoint)a3 toWindow:(id)a4;
- (CGPoint)_convertOffsetFromSceneReferenceSpace:(CGPoint)a3;
- (CGPoint)_convertOffsetToSceneReferenceSpace:(CGPoint)a3;
- (CGPoint)_convertPointFromSceneReferenceSpace:(CGPoint)a3;
- (CGPoint)_convertPointToSceneReferenceSpace:(CGPoint)a3;
- (CGPoint)_transformDisplayToWindowCoordinates:(CGPoint)a3;
- (CGPoint)convertDeviceToWindow:(CGPoint)a3;
- (CGPoint)convertPoint:(CGPoint)point fromWindow:(UIWindow *)window;
- (CGPoint)convertPoint:(CGPoint)point toWindow:(UIWindow *)window;
- (CGPoint)convertWindowToDevice:(CGPoint)a3;
- (CGPoint)warpPoint:(CGPoint)a3;
- (CGRect)_convertRectFromSceneReferenceSpace:(CGRect)a3;
- (CGRect)_convertRectToSceneReferenceSpace:(CGRect)a3;
- (CGRect)_referenceFrameFromSceneUsingScreenBounds:(BOOL)a3;
- (CGRect)_sceneBounds;
- (CGRect)_sceneBoundsInWindowOrientation;
- (CGRect)_sceneReferenceBounds;
- (CGRect)_usableBounds;
- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4;
- (CGRect)convertRect:(CGRect)rect fromWindow:(UIWindow *)window;
- (CGRect)convertRect:(CGRect)rect toWindow:(UIWindow *)window;
- (Class)_intelligenceBaseClass;
- (FBSSceneLayer)_associatingSceneLayer;
- (NSArray)_rootViewConstraints;
- (NSArray)_windowInternalConstraints;
- (NSMutableArray)_currentKeyboardTrackingLayoutGuides;
- (UIActivityItemsConfigurationReading)_activityItemsConfigurationForScene;
- (UIEdgeInsets)_normalizedSafeAreaInsets;
- (UIEdgeInsets)_overlayInsets;
- (UIEdgeInsets)_sceneSafeAreaInsetsIncludingStatusBar:(BOOL)a3;
- (UIEdgeInsets)safeAreaInsets;
- (UIFocusItem)_rememberedFocusedItem;
- (UIKeyboardLayoutGuide)_primaryKeyboardTrackingGuide;
- (UILayoutGuide)safeAreaAspectFitLayoutGuide;
- (UIResponder)_focusResponder;
- (UIResponder)_lastFirstResponder;
- (UIResponder)_lastNextResponder;
- (UIScreen)screen;
- (UIViewController)_delegateViewController;
- (UIViewController)rootViewController;
- (UIWindow)init;
- (UIWindow)initWithCoder:(id)a3;
- (UIWindow)initWithContentRect:(CGRect)a3;
- (UIWindow)initWithFrame:(CGRect)a3;
- (UIWindow)initWithWindowScene:(UIWindowScene *)windowScene;
- (UIWindowLevel)windowLevel;
- (UIWindowScene)windowScene;
- (_UIContextBinder)_contextBinder;
- (_UIFocusEventRecognizer)_focusEventRecognizer;
- (_UIForcedOrientationTransactionToken)_orientationTransactionToken;
- (_UIRootPresentationController)_rootPresentationController;
- (_UITraitEnvironmentInternal)_overrideParentTraitEnvironment;
- (_UIViewControllerNullAnimationTransitionCoordinator)_traitCollectionChangeTransitionCoordinator;
- (_UIWindowAnimationController)_animationController;
- (_UIWindowOrientationUpdate)_deferredOrientationUpdate;
- (double)_adjustedWindowLevelFromLevel:(double)a3;
- (double)_classicOffset;
- (double)_rotationDuration;
- (double)_systemReferenceAngle;
- (double)_touchSloppinessFactor;
- (double)insetForDismissedKeyboardGuide;
- (double)keyboardLayoutGuideScrollViewOffset;
- (double)level;
- (id)__clientsForRotationCallbacks;
- (id)_accessibilityHUDContainerViewForView:(id)a3;
- (id)_acquireOrientationLockAssertionWithReason:(void *)a1;
- (id)_adjustWindowOrientationForTransitionWithSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4 reason:(id)a5;
- (id)_appearanceContainer;
- (id)_bindingLayer;
- (id)_boundingPath;
- (id)_centerExpressionInContainer:(id)a3 vertical:(BOOL)a4 contentInsetScale:(double)a5 engine:(id)a6;
- (id)_clientsForRotation;
- (id)_contextOptionsWithInitialOptions:(id)a3;
- (id)_createForcedOrientationTransactionTokenWithSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4 forImmediateCommit:(BOOL)a5 reason:(id)a6;
- (id)_debugName;
- (id)_deepestActionResponder;
- (id)_descendantWithAmbiguousLayout;
- (id)_eventRoutingScene;
- (id)_exclusiveTouchView;
- (id)_fbsScene;
- (id)_firstResponder;
- (id)_focusMovementSystemForFocusEventRecognizer:(id)a3;
- (id)_focusedView;
- (id)_hitTestLocation:(CGPoint)a3 sceneLocationZ:(double)a4 inScene:(id)a5 withWindowServerHitTestWindow:(id)a6 event:(id)a7;
- (id)_hostingHandle;
- (id)_hostingWindow;
- (id)_initWithFrame:(CGRect)a3 attached:(BOOL)a4;
- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4;
- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 attached:(BOOL)a5;
- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 displayConfiguration:(id)a5;
- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 scene:(id)a5 attached:(BOOL)a6;
- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 windowScene:(id)a5;
- (id)_initWithOrientation:(int64_t)a3;
- (id)_interfaceOrientationMapResolver;
- (id)_keyboardSceneSettings;
- (id)_lastFirstResponderInteractionState;
- (id)_layerForCoordinateSpaceConversion;
- (id)_layoutEngineCreateIfNecessary;
- (id)_layoutEngineIfAvailable;
- (id)_normalInheritedTintColor;
- (id)_obtainKeyboardLayoutGuideTransitionAssertionForReason:(id)a3;
- (id)_orientationDebugDescription;
- (id)_orientationDebugDescriptionBuilderWithMultilinePrefix:(id)a3;
- (id)_orientationDebugDescriptionWithMultilinePrefix:(id)a3;
- (id)_overrideTargetWindowForPathIndex:(unint64_t)a3 forEvent:(id)a4 windowServerHitTestWindow:(id)a5;
- (id)_overridingPreferredFocusEnvironment;
- (id)_parentGestureRecognizerContainer;
- (id)_parentTraitEnvironment;
- (id)_redundantConstraints;
- (id)_registeredScrollToTopViews;
- (id)_remoteContentParent;
- (id)_responderForKeyEvents;
- (id)_roleHint;
- (id)_rootForKeyResponderCycle;
- (id)_rootViewConstraintsUpdateIfNecessaryForView:(id)a3;
- (id)_rotationViewControllers;
- (id)_shouldPreventRotationHook;
- (id)_subtreeMonitorsForView:(id)a3;
- (id)_targetForStolenStatusBarTouchesAtPoint:(CGPoint)a3 withEvent:(id)a4 excludingWindow:(id)a5;
- (id)_targetWindowForPathIndex:(int64_t)a3 atPoint:(CGPoint)a4 scenePointZ:(double)a5 forEvent:(id)a6 windowServerHitTestWindow:(id)a7;
- (id)_touchData;
- (id)_traitCollectionForSize:(CGSize)a3 parentCollection:(id)a4;
- (id)_traitCollectionForSize:(CGSize)a3 parentCollection:(id)a4 traitOverrideApplicator:(id)a5;
- (id)_traitCollectionWhenRotated;
- (id)_uiWindowSceneFromFBSScene:(id)a3;
- (id)_uiib_candidateRedundantConstraints;
- (id)_undoManagerForValidatingUndoRedoCommands;
- (id)_windowHostingScene;
- (id)_windowHostingSceneTraitCollection;
- (id)_windowParentTraitCollection;
- (id)contentView;
- (id)firstResponder;
- (id)nextResponder;
- (id)parentFocusEnvironment;
- (id)preferredFocusEnvironments;
- (id)preferredFocusedView;
- (id)representation;
- (id)restorationIdentifier;
- (id)traitCollection;
- (id)undoManager;
- (int)bitsPerComponent;
- (int64_t)_fromWindowOrientation;
- (int64_t)_initialGuessInterfaceOrientation;
- (int64_t)_interfaceOrientationForSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4;
- (int64_t)_orientationForClassicPresentation;
- (int64_t)_orientationForRootTransform;
- (int64_t)_orientationForSceneTransform;
- (int64_t)_orientationForViewTransform;
- (int64_t)_orientationInSceneSpace;
- (int64_t)_overriddenInterfaceOrientation;
- (int64_t)_preferredInterfaceOrientationForRootViewController;
- (int64_t)_sceneClientOrientation;
- (int64_t)_sceneOrientation;
- (int64_t)_subclassPreferredFocusedViewPrioritizationType;
- (int64_t)_toWindowOrientation;
- (int64_t)_windowInterfaceOrientation;
- (int64_t)interfaceOrientation;
- (uint64_t)_cancelEnqueuedDeferredOrientationUpdateIfNeeded;
- (unint64_t)_edgeForTouch:(id)a3;
- (unint64_t)_edgesForSystemGesturesTouchDelay;
- (unint64_t)_expectedWindowInternalConstraintsCount;
- (unint64_t)_supportedInterfaceOrientationsConsultingApp:(BOOL)a3;
- (unint64_t)_supportedInterfaceOrientationsForRootViewController;
- (unint64_t)_systemReferenceAngleMode;
- (unsigned)_contextId;
- (void)__setHostViewUnderlapsStatusBar:(BOOL)a3;
- (void)__setWindowHostingScene:(uint64_t)a1;
- (void)_addRotationViewController:(id)a3;
- (void)_addWindowLevelChangedObserver:(id)a3;
- (void)_adjustFramePositionIfNecessary;
- (void)_adjustSizeClassesAndResizeWindowToFrame:(CGRect)a3;
- (void)_autolayout_windowDidChangeBoundsFrom:(CGRect)a3;
- (void)_autolayout_windowDidChangeCenterFrom:(CGPoint)a3;
- (void)_cleanupOrientationTransactionIfNecessary;
- (void)_clearPendingKeyboardChanges;
- (void)_clearSizeClassesForStateRestoration;
- (void)_commonInit;
- (void)_commonInitAttachedWindow:(BOOL)a3 debugName:(id)a4 scene:(id)a5;
- (void)_commonInitDebugName:(id)a3 uiScene:(id)a4;
- (void)_configurePassthroughInteractionIfNeeded;
- (void)_configureRootLayer:(id)a3 sceneTransformLayer:(id)a4 transformLayer:(id)a5;
- (void)_constraints_subviewWillChangeSuperview:(id)a3;
- (void)_createOtherSystemGateGestureRecognizersIfNeeded;
- (void)_createSystemGestureGateGestureRecognizerIfNeeded;
- (void)_didBecomeApplicationKeyWindowWithOldApplicationKeyWindow:(void *)a1;
- (void)_didCreateRootPresentationController;
- (void)_didMoveFromScene:(id)a3 toScene:(id)a4;
- (void)_didMoveFromScreen:(id)a3 toScreen:(id)a4;
- (void)_didSnapshot;
- (void)_didUpdateFocusInContext:(id)a3;
- (void)_dismissAccessibilityHUD;
- (void)_executeDeferredOrientationUpdate;
- (void)_fadeCalloutBarIfNeededForTouchInView:(id)a3;
- (void)_finishedFirstHalfRotation:(id)a3 finished:(BOOL)a4 context:(id)a5;
- (void)_finishedFullRotation:(BOOL)a3 context:(id)a4 skipNotification:(BOOL)a5;
- (void)_finishedFullRotation:(id)a3 finished:(id)a4 context:(id)a5;
- (void)_forceTwoPartRotationAnimation:(BOOL)a3;
- (void)_forwardFocusMovementAction:(id)a3;
- (void)_handleDeviceOrientationChange:(id)a3;
- (void)_handleSBActiveInterfaceOrientationChange:(id)a3;
- (void)_initializeLayoutEngine;
- (void)_initializeLayoutEngineDiscardingOldIfNeeded:(BOOL)a3;
- (void)_insertLiveResizeSnapshot:(id *)a1;
- (void)_installFocusEventRecognizer;
- (void)_installFocusIfNeededForFocusSystemSceneComponent:(id)a3;
- (void)_internal_setRotatableViewOrientation:(uint64_t)a3 updateStatusBar:(uint64_t)a4 duration:(double)a5 force:;
- (void)_invalidateDeferredOrientationUpdate;
- (void)_invalidateWindowInternalConstraints;
- (void)_legacySetRotatableViewOrientation:(int64_t)a3 duration:(double)a4;
- (void)_legacySetRotatableViewOrientation:(int64_t)a3 duration:(double)a4 force:(BOOL)a5;
- (void)_legacySetRotatableViewOrientation:(int64_t)a3 updateStatusBar:(BOOL)a4 duration:(double)a5 force:(BOOL)a6;
- (void)_mainQueue_makeKeyAndVisible;
- (void)_makeExternalKeyWindow;
- (void)_makeKeyWindowIgnoringOldKeyWindow:(char)a3 transferringScenes:;
- (void)_matchDeviceOrientation;
- (void)_moveWithEvent:(id)a3;
- (void)_noteOverlayInsetsDidChange;
- (void)_notifyRotatableViewOrientation:(int64_t)a3 duration:(double)a4;
- (void)_orderFrontWithoutMakingKey;
- (void)_parentWillTransitionToTraitCollection:(id)a3;
- (void)_performTouchContinuationWithOverrideHitTestedView:(id)a3;
- (void)_populateInitialTraitCollection:(id)a3;
- (void)_positionHeaderView:(id)a3 andFooterView:(id)a4 outsideContentViewForInterfaceOrientation:(int64_t)a5;
- (void)_prepareHierarchyForWindowHostingSceneRemoval;
- (void)_propagateTraitCollectionChangedForStateRestorationWithTransitionCoordinator:(id)a3;
- (void)_registerChargedView:(id)a3;
- (void)_registerScrollToTopView:(id)a3;
- (void)_registerSubtreeMonitor:(id)a3;
- (void)_removeAllViewControllersFromWindowHierarchyFromDealloc:(BOOL)a3;
- (void)_removeFocusEventRecognizer;
- (void)_removeFocusIfNeededForFocusSystemSceneComponent:(id)a3;
- (void)_removeLiveResizeSnapshot:(uint64_t)a1;
- (void)_removeRotationViewController:(id)a3;
- (void)_removeWindowLevelChangedObserver:(id)a3;
- (void)_resetFocusEventRecognizer;
- (void)_resignApplicationKeyWindowStatus;
- (void)_resizeWindowToFullScreenIfNecessary;
- (void)_restoreFirstResponder;
- (void)_retryHandleStatusBarChangeIfNecessary;
- (void)_rotateToBounds:(CGRect)a3 withAnimator:(id)a4 transitionContext:(id)a5;
- (void)_rotateWindowToOrientation:(int64_t)a3 updateStatusBar:(BOOL)a4 duration:(double)a5 skipCallbacks:(BOOL)a6;
- (void)_sceneBoundsDidChange;
- (void)_sceneSettingsSafeAreaInsetsDidChange;
- (void)_scrollToTopViewsUnderScreenPointIfNecessary:(CGPoint)a3 resultHandler:(id)a4;
- (void)_sendButtonsForEvent:(id)a3;
- (void)_sendTouchesForEvent:(id)a3;
- (void)_setAnimationController:(id)a3;
- (void)_setBoundContext:(id)a3;
- (void)_setContainedGestureRecognizersShouldRespectGestureServerInstructions:(BOOL)a3;
- (void)_setContextBinder:(id)a3;
- (void)_setDeferredOrientationUpdate:(id)a3;
- (void)_setDelegateViewController:(id)a3;
- (void)_setExclusiveTouchView:(id)a3;
- (void)_setFBSScene:(void *)a1;
- (void)_setFirstResponder:(id)a3;
- (void)_setFromWindowOrientation:(int64_t)a3;
- (void)_setHidden:(BOOL)a3 forced:(BOOL)a4;
- (void)_setInterfaceOrientationMapResolver:(id)a3;
- (void)_setIsLoweringAnchoringConstraints:(BOOL)a3;
- (void)_setIsResigningFirstResponderFromHost:(BOOL)a3;
- (void)_setIsSettingFirstResponder:(BOOL)a3;
- (void)_setLastFirstResponder:(id)a3;
- (void)_setLastFirstResponderInteractionState:(id)a3;
- (void)_setLastNextResponder:(id)a3;
- (void)_setNeedsBoundingPathUpdate;
- (void)_setOrientationTransactionToken:(id)a3;
- (void)_setOverrideParentTraitEnvironment:(id)a3;
- (void)_setRememberedFocusedItem:(id)a3;
- (void)_setRoleHint:(id)a3;
- (void)_setRootPresentationController:(id)a3;
- (void)_setRootViewConstraints:(id)a3;
- (void)_setRotatableClient:(id)a3 toOrientation:(int64_t)a4 updateStatusBar:(BOOL)a5 duration:(double)a6 force:(BOOL)a7 isRotating:(BOOL)a8;
- (void)_setRotatableViewOrientation:(int64_t)a3 duration:(double)a4 force:(BOOL)a5;
- (void)_setScene:(id)a3;
- (void)_setSecure:(BOOL)a3;
- (void)_setShouldDisableTransformLayerScalingForSnapshotting:(BOOL)a3;
- (void)_setShouldPreventRotationHook:(id)a3;
- (void)_setStateRestorationVerticalSizeClass:(int64_t)a3 horizontalSizeClass:(int64_t)a4;
- (void)_setSystemGestureRecognitionIsPossible:(BOOL)a3 andTouchesAreCancelled:(BOOL)a4;
- (void)_setToWindowOrientation:(int64_t)a3;
- (void)_setTraitCollectionChangeTransitionCoordinator:(id)a3;
- (void)_setWantsResponderWithoutKeyboard:(BOOL)a3;
- (void)_setWindowControlsStatusBarOrientation:(BOOL)a3;
- (void)_setWindowHostingScene:(id)a3;
- (void)_setWindowInterfaceOrientation:(int64_t)a3;
- (void)_setWindowInternalConstraints:(id)a3;
- (void)_showAccessibilityHUDItem:(id)a3 forView:(id)a4;
- (void)_slideHeaderView:(id)a3 andFooterView:(id)a4 offScreen:(BOOL)a5 forInterfaceOrientation:(int64_t)a6;
- (void)_switchToLayoutEngine:(id)a3;
- (void)_tintColorDidChange;
- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3;
- (void)_traitOverridesWillChange:(id)a3 withApplicator:(id)a4;
- (void)_transformLayerShouldMaskToBounds:(BOOL)a3;
- (void)_unregisterChargedView:(id)a3;
- (void)_unregisterScrollToTopView:(id)a3;
- (void)_unregisterSubtreeMonitor:(id)a3;
- (void)_updateAutorotationResponse:(BOOL)a3;
- (void)_updateConstraintsIfNeededWithViewForVariableChangeNotifications:(id)a3;
- (void)_updateInterfaceOrientationFromActiveInterfaceOrientation;
- (void)_updateInterfaceOrientationFromActiveInterfaceOrientation:(BOOL)a3;
- (void)_updateInterfaceOrientationFromActiveInterfaceOrientationIfRotationEnabled:(BOOL)a3;
- (void)_updateInterfaceOrientationFromDeviceOrientation;
- (void)_updateInterfaceOrientationFromDeviceOrientation:(BOOL)a3;
- (void)_updateInterfaceOrientationFromDeviceOrientationIfRotationEnabled:(BOOL)a3;
- (void)_updateIsSceneSizedFlag;
- (void)_updateLayerOrderingAndSetLayerHidden:(BOOL)a3;
- (void)_updateLayerOrderingAndSetLayerHidden:(BOOL)a3 actionBlock:(id)a4;
- (void)_updateOrientationPreferencesAnimated:(BOOL)a3;
- (void)_updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight;
- (void)_updateSystemConstraints;
- (void)_updateToInterfaceOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)_updateToInterfaceOrientation:(int64_t)viewOrientation duration:(double)a4 force:(BOOL)a5;
- (void)_updateToNotificationProvidedInterfaceOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)_updateTransformLayer;
- (void)_updateWindowEngineHostConstraintsWithSizing:(BOOL)a3;
- (void)_updateWindowTraits;
- (void)_updateWindowTraitsAndNotify:(BOOL)a3;
- (void)_willChangeToSize:(CGSize)a3 orientation:(int64_t)a4 screen:(id)a5 withTransitionCoordinator:(id)a6;
- (void)_willSnapshot;
- (void)_willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
- (void)_willUpdateFocusInContext:(id)a3;
- (void)_windowInternalConstraints_centerDidChange;
- (void)_windowInternalConstraints_sizeDidChange;
- (void)_writeLayerTreeToPath:(id)a3;
- (void)addKeyboardLayoutGuideIfNeeded:(id)a3;
- (void)addRootViewControllerViewIfPossible;
- (void)awakeFromNib;
- (void)beginDisablingInterfaceAutorotation;
- (void)cancelOrientationTransaction:(id)a3;
- (void)commitOrientationTransaction:(id)a3 animated:(BOOL)a4;
- (void)createIOSurface;
- (void)createIOSurfaceWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)endDisablingInterfaceAutorotation;
- (void)endDisablingInterfaceAutorotationAnimated:(BOOL)a3;
- (void)exerciseAmbiguityInLayout;
- (void)handleStatusBarChangeFromHeight:(double)a3 toHeight:(double)a4;
- (void)keyboardDidHide;
- (void)layoutViewsForTrackedGuides;
- (void)makeKeyAndOrderFront:(id)a3;
- (void)makeKeyAndVisible;
- (void)makeKeyWindow;
- (void)matchDeviceOrientation:(id)a3;
- (void)orderFront:(id)a3;
- (void)orderOut:(id)a3;
- (void)redo:(id)a3;
- (void)removeKeyboardLayoutGuideIfNeeded:(id)a3;
- (void)sendEvent:(UIEvent *)event;
- (void)setAutorotates:(BOOL)a3;
- (void)setAutorotates:(BOOL)a3 forceUpdateInterfaceOrientation:(BOOL)a4;
- (void)setBecomeKeyOnOrderFront:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCanResizeToFitContent:(BOOL)canResizeToFitContent;
- (void)setCenter:(CGPoint)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setKeepContextInBackground:(BOOL)a3;
- (void)setResizesToFullScreen:(BOOL)a3;
- (void)setRestorationIdentifier:(id)a3;
- (void)setRootViewController:(UIViewController *)rootViewController;
- (void)setScreen:(UIScreen *)screen;
- (void)setWindowLevel:(UIWindowLevel)windowLevel;
- (void)setWindowScene:(UIWindowScene *)windowScene;
- (void)set_currentKeyboardTrackingLayoutGuides:(id)a3;
- (void)setupForOrientation:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)undo:(id)a3;
- (void)updateGuideForKeyboardPlacement:(id)a3;
@end

@implementation UIWindow

+ (BOOL)_transformLayerRotationsAreEnabled
{
  return dyld_program_sdk_at_least();
}

- (id)_parentGestureRecognizerContainer
{
  return 0;
}

- (UIWindowScene)windowScene
{
  if ((*((unsigned char *)&self->_windowFlags + 4) & 8) != 0) {
    return (UIWindowScene *)self->_windowHostingScene;
  }
  else {
    return (UIWindowScene *)0;
  }
}

- (UIScreen)screen
{
  v2 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _screen];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[UIScreen mainScreen];
  }
  v5 = v4;

  return (UIScreen *)v5;
}

- (id)_normalInheritedTintColor
{
  v3 = [(UIView *)self _interactionTintColor];

  if (v3)
  {
    id v4 = [(UIView *)self _interactionTintColor];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)_cachedTraitCollectionIsValid
{
  return 1;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_definesDynamicTintColor
{
  v3 = [(UIView *)self _interactionTintColor];

  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIWindow;
    return [(UIView *)&v7 _definesDynamicTintColor];
  }
  else
  {
    v5 = +[UIView _defaultInteractionTintColorForIdiom:](UIView, "_defaultInteractionTintColorForIdiom:", objc_msgSend(-[UIWindow _screen](self, "_screen"), "_userInterfaceIdiom"));
    uint64_t v6 = [v5 _isDynamic];

    return v6;
  }
}

- (BOOL)_shouldForceTraitPropagationThroughHierarchy
{
  return 0;
}

- (id)_layoutEngineIfAvailable
{
  if (qword_1EB25A5D8 != -1) {
    dispatch_once(&qword_1EB25A5D8, &__block_literal_global_56_8);
  }
  if (byte_1EB25A5AA)
  {
    return [(UIWindow *)self _layoutEngineCreateIfNecessary];
  }
  else
  {
    return [(UIView *)self _layoutEngine];
  }
}

- (id)_subtreeMonitorsForView:(id)a3
{
  id v4 = a3;
  subtreeMonitors = self->_subtreeMonitors;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__UIWindow__subtreeMonitorsForView___block_invoke;
  v9[3] = &unk_1E5303A18;
  id v10 = v4;
  id v6 = v4;
  objc_super v7 = [(NSMutableSet *)subtreeMonitors objectsPassingTest:v9];

  return v7;
}

void __59__UIWindow__rotateToBounds_withAnimator_transitionContext___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    BOOL v2 = +[UIWindow _transformLayerRotationsAreEnabled];
    v3 = *(void **)(a1 + 32);
    if (v2)
    {
      v3[72] |= 0x400uLL;
      return;
    }
    id v11 = [v3 rootViewController];
    [v11 window:*(void *)(a1 + 32) setupWithInterfaceOrientation:*(void *)(a1 + 64)];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) rootViewController];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) _transitionCoordinator];
    objc_msgSend(v4, "_window:viewWillTransitionToSize:withTransitionCoordinator:", v5, v6, *(double *)(a1 + 48), *(double *)(a1 + 56));

    *(void *)(*(void *)(a1 + 32) + 576) |= 0x400uLL;
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
    id v10 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, @"UIWindowNewOrientationUserInfoKey", 0);
    [v11 postNotificationName:@"UIWindowWillRotateNotification" object:v7 userInfo:v10];
  }
}

- (void)_tintColorDidChange
{
  if ((*((unsigned char *)&self->_windowFlags + 4) & 0x40) == 0) {
    [(UIWindow *)self _updateWindowTraits];
  }
  v3.receiver = self;
  v3.super_class = (Class)UIWindow;
  [(UIView *)&v3 _tintColorDidChange];
}

- (id)_layoutEngineCreateIfNecessary
{
  id result = [(UIView *)self _layoutEngine];
  if (!result)
  {
    [(UIWindow *)self _initializeLayoutEngine];
    return [(UIView *)self _layoutEngine];
  }
  return result;
}

- (BOOL)_canBecomeLayoutEngineDelegate
{
  return 1;
}

- (BOOL)_alwaysGetsContexts
{
  return ![(UIWindow *)self _isWindowServerHostingManaged];
}

- (UIWindowLevel)windowLevel
{
  return self->_windowLevel;
}

uint64_t __68__UIWindow__findWindowForControllingOverallAppearanceInWindowScene___block_invoke(uint64_t a1, void *a2, char a3, char a4)
{
  id v6 = a2;
  uint64_t v7 = v6[72];
  uint64_t v8 = v6[12];
  uint64_t v9 = 0;
  if ([v6 _canAffectStatusBarAppearance])
  {
    if ((v7 & 0x40000000) != 0) {
      char v10 = 0;
    }
    else {
      char v10 = a3;
    }
    if ((v8 & 0x400) != 0) {
      char v11 = 0;
    }
    else {
      char v11 = a4;
    }
    if ((v10 & 1) == 0 && (v11 & 1) == 0) {
      uint64_t v9 = [v6 _isHostedInAnotherProcess] ^ 1;
    }
  }

  return v9;
}

uint64_t __68__UIWindow__findWindowForControllingOverallAppearanceInWindowScene___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_canAffectStatusBarAppearance
{
  return ![(UIWindow *)self isInternalWindow];
}

- (BOOL)isInternalWindow
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 0;
  }
  objc_super v3 = [MEMORY[0x1E4F28B50] bundleForClass:v2];
  id v4 = _UIKitBundle();
  char v5 = [v3 isEqual:v4];

  return v5;
}

- (UIEdgeInsets)_sceneSafeAreaInsetsIncludingStatusBar:(BOOL)a3
{
  if (!self->_windowHostingScene)
  {
    double v13 = 0.0;
    double v11 = 0.0;
    double v9 = 0.0;
    double v7 = 0.0;
    goto LABEL_11;
  }
  BOOL v3 = a3;
  int64_t v5 = -[UIWindow _interfaceOrientationForSceneSafeAreaInsetsIncludingStatusBar:](self, "_interfaceOrientationForSceneSafeAreaInsetsIncludingStatusBar:");
  [(_UISceneUIWindowHosting *)self->_windowHostingScene _safeAreaInsetsForInterfaceOrientation:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  if (![(UIWindow *)self _isHostedInAnotherProcess])
  {
    v14 = [(UIWindow *)self traitCollection];
    if ([v14 userInterfaceIdiom] != 3)
    {
      v15 = [(UIWindow *)self windowScene];
      if (v5 == [v15 interfaceOrientation])
      {
        char v16 = [(id)UIApp _isStatusBarEffectivelyHiddenForContentOverlayInsetsForWindow:self];

        if (v3 && (v16 & 1) == 0)
        {
          v17 = __UIStatusBarManagerForWindow(self);
          [v17 statusBarHeight];
          double v19 = v18;

          double v7 = fmax(v7, v19);
        }
        goto LABEL_11;
      }
    }
  }
LABEL_11:
  double v20 = v7;
  double v21 = v9;
  double v22 = v11;
  double v23 = v13;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (BOOL)_isHostedInAnotherProcess
{
  return ![(UIWindow *)self _isWindowServerHostingManaged];
}

- (BOOL)_isWindowServerHostingManaged
{
  return [(id)UIApp _isWindowServerHostingManaged];
}

- (int64_t)_orientationForViewTransform
{
  return self->_viewOrientation;
}

+ (BOOL)_prefersStatusBarHiddenInWindow:(id)a3 targetOrientation:(int64_t)a4 animationProvider:(id *)a5
{
  id v7 = a3;
  double v8 = v7;
  if (!a4)
  {
LABEL_6:
    if (![(id)UIApp _viewControllerBasedStatusBarAppearance])
    {
      LOBYTE(v16) = [(id)UIApp _isStatusBarHiddenForOrientation:a4];
      goto LABEL_16;
    }
    v17 = [v8 rootViewController];
    double v18 = [v17 _effectiveStatusBarHiddenViewController];

    if (v18)
    {
      LOBYTE(v16) = [v18 _preferredStatusBarVisibility] == 1;
      if (!a5)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v19 = v18;
    }
    else
    {
      char v16 = [v8 _rootPresentationController];

      if (!v16) {
        goto LABEL_15;
      }
      double v20 = [v8 _rootPresentationController];
      LOBYTE(v16) = [v20 _preferredStatusBarVisibility] == 1;

      if (!a5) {
        goto LABEL_15;
      }
      id v19 = [v8 _rootPresentationController];
    }
    *a5 = v19;
    goto LABEL_15;
  }
  double v9 = [v7 windowScene];
  uint64_t v10 = [v9 statusBarManager];
  if (!v10)
  {

    goto LABEL_6;
  }
  double v11 = (void *)v10;
  double v12 = [v8 windowScene];
  double v13 = [v12 statusBarManager];
  [v13 defaultStatusBarHeightInOrientation:a4];
  double v15 = v14;

  if (v15 != 0.0) {
    goto LABEL_6;
  }
  LOBYTE(v16) = 1;
LABEL_16:

  return (char)v16;
}

- (_UIRootPresentationController)_rootPresentationController
{
  return self->_rootPresentationController;
}

- (id)traitCollection
{
  if (!self->_traitCollection && (*(void *)&self->super._viewFlags & 0x1000) == 0)
  {
    if (dyld_program_sdk_at_least())
    {
      +[UITraitCollection _fallbackTraitCollection]();
      BOOL v3 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
      traitCollection = self->_traitCollection;
      self->_traitCollection = v3;

      _UITraitEnvironmentGeneratedTraitCollection((uint64_t)self, (unint64_t)self->_traitCollection);
    }
    else
    {
      [(UIWindow *)self _updateWindowTraitsAndNotify:0];
    }
  }
  int64_t v5 = self->_traitCollection;
  return v5;
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

+ (BOOL)_prefersStatusBarHiddenInWindow:(id)a3 animationProvider:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 windowScene];
  LOBYTE(a4) = objc_msgSend(a1, "_prefersStatusBarHiddenInWindow:targetOrientation:animationProvider:", v6, objc_msgSend(v7, "interfaceOrientation"), a4);

  return (char)a4;
}

void __76__UIWindow_allWindowsIncludingInternalWindows_onlyVisibleWindows_forScreen___block_invoke(uint64_t a1, void *a2)
{
  if (!*(void *)(a1 + 32)
    || ([a2 screen],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int64_t v5 = *(void **)(a1 + 32),
        v4,
        v4 == v5))
  {
    id v6 = *(void **)(a1 + 40);
    [v6 addObject:a2];
  }
}

uint64_t __68__UIWindow__findWindowForControllingOverallAppearanceInWindowScene___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)_windowInterfaceOrientation
{
  int v3 = [(id)objc_opt_class() _transformLayerRotationsAreEnabled];
  if (self->_viewOrientation <= 1uLL) {
    int64_t viewOrientation = 1;
  }
  else {
    int64_t viewOrientation = self->_viewOrientation;
  }
  if (v3) {
    return self->_viewOrientation;
  }
  else {
    return viewOrientation;
  }
}

void __39__UIWindow__noteOverlayInsetsDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = [(id)UIApp delegate];
    char v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) == 0
      || ([(id)UIApp delegate],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v4 window],
          id v5 = (id)objc_claimAutoreleasedReturnValue(),
          v4,
          !v5))
    {
      id v5 = +[UIWindow _applicationKeyWindow];
    }
    if (v5 == WeakRetained)
    {
      id v6 = [WeakRetained _windowHostingScene];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __39__UIWindow__noteOverlayInsetsDidChange__block_invoke_2;
      v7[3] = &unk_1E52DAE80;
      v7[4] = WeakRetained;
      [v6 _updateUIClientSettingsWithBlock:v7];
    }
  }
}

- (BOOL)isRotating
{
  return (*((unsigned __int8 *)&self->_windowFlags + 1) >> 2) & 1;
}

- (id)parentFocusEnvironment
{
  uint64_t v2 = [(UIWindow *)self windowScene];
  char v3 = [v2 _focusSystemSceneComponent];
  id v4 = [v3 focusSystem];

  return v4;
}

- (id)_eventRoutingScene
{
  if ([(_UISceneUIWindowHosting *)self->_windowHostingScene _allowsEventUIWindowRouting])windowHostingScene = self->_windowHostingScene; {
  else
  }
    windowHostingScene = 0;
  return windowHostingScene;
}

- (BOOL)_hasContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (id)_appearanceContainer
{
  uint64_t v2 = [(UIWindow *)self screen];
  [v2 _userInterfaceIdiom];
  BOOL v3 = (objc_class *)_UIAppearanceContainerForUserInterfaceIdiom();

  id v4 = objc_alloc_init(v3);
  return v4;
}

- (void)setBecomeKeyOnOrderFront:(BOOL)a3
{
  uint64_t v3 = 64;
  if (a3) {
    uint64_t v3 = 0;
  }
  self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&self->_windowFlags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (void)orderFront:(id)a3
{
  [(UIWindow *)self setHidden:0];
  if ((*(unsigned char *)&self->_windowFlags & 0x40) == 0)
  {
    [(UIWindow *)self makeKeyWindow];
  }
}

+ (uint64_t)_checkPreCommitHandlersAfterCAFlush
{
  self;
  if (!byte_1EB259DB5)
  {
    uint64_t result = [(id)qword_1EB259E80 count];
    if (result) {
      goto LABEL_7;
    }
    if (!byte_1EB259DB5) {
      return result;
    }
  }
  uint64_t result = [MEMORY[0x1E4F39CF8] currentState];
  if ((result & 3) == 0)
  {
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    [(id)qword_1EB259E80 count];
    [MEMORY[0x1E4F39CF8] currentState];
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_7:
    _os_crash();
    __break(1u);
  }
  return result;
}

- (CGPoint)_convertPointToSceneReferenceSpace:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _coordinateSpace];
  -[UIView convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v6, x, y);
  double v8 = v7;
  double v10 = v9;

  [(UIWindow *)self _sceneReferenceBounds];
  double v12 = v11;
  double v14 = v13;
  double v15 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _effectiveSettings];
  uint64_t v16 = [v15 interfaceOrientation];
  if (+[UIWindow _transformLayerRotationsAreEnabled])
  {
    if (v16 == 2)
    {
      double v17 = v12 - v8;
      double v8 = v14 - v10;
    }
    else if (v16 == 3)
    {
      double v17 = v12 - v10;
    }
    else
    {
      if (v16 == 4) {
        double v17 = v10;
      }
      else {
        double v17 = v8;
      }
      if (v16 == 4) {
        double v8 = v14 - v8;
      }
      else {
        double v8 = v10;
      }
    }
  }
  else
  {
    double v17 = v8;
    double v8 = v10;
  }

  double v18 = v17;
  double v19 = v8;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  if ((*((unsigned char *)&self->_windowFlags + 4) & 4) == 0
    && [(UIWindow *)self _updatesSafeAreaInsetsOnRead])
  {
    *(void *)&self->_windowFlags |= 0x400000000uLL;
    [(UIWindow *)self _normalizedSafeAreaInsets];
    -[UIView setSafeAreaInsets:](self, "setSafeAreaInsets:");
    *(void *)&self->_windowFlags &= ~0x400000000uLL;
  }
  v7.receiver = self;
  v7.super_class = (Class)UIWindow;
  [(UIView *)&v7 safeAreaInsets];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)_updatesSafeAreaInsetsOnRead
{
  return 1;
}

- (UIEdgeInsets)_normalizedSafeAreaInsets
{
  [(UIWindow *)self _sceneSafeAreaInsetsIncludingStatusBar:dyld_program_sdk_at_least()];
  double v6 = v3;
  double v48 = v7;
  double v49 = v4;
  double v8 = v5;
  if (v7 == 0.0 && v3 == 0.0 && v5 == 0.0 && v4 == 0.0)
  {
    double v9 = [(UIWindow *)self screen];
    [v9 overscanCompensationInsets];
    double v6 = v10;
    double v48 = v11;
    double v49 = v12;
    double v8 = v13;
  }
  double v47 = v8;
  [(UIWindow *)self _sceneReferenceBounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat Width = v20;
  CGFloat v22 = *MEMORY[0x1E4F1DAD8];
  CGFloat v23 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if ((unint64_t)([(UIWindow *)self interfaceOrientation] - 3) <= 1)
  {
    v50.origin.CGFloat x = v15;
    v50.origin.CGFloat y = v17;
    v50.size.width = v19;
    v50.size.height = Width;
    double v24 = v23;
    double v25 = v22;
    CGFloat Height = CGRectGetHeight(v50);
    v51.origin.CGFloat x = v15;
    v51.origin.CGFloat y = v17;
    v51.size.width = v19;
    v51.size.height = Width;
    CGFloat Width = CGRectGetWidth(v51);
    CGFloat v19 = Height;
    CGFloat v22 = v25;
    CGFloat v23 = v24;
  }
  [(UIView *)self frame];
  v62.origin.CGFloat x = v27;
  v62.origin.CGFloat y = v28;
  v62.size.width = v29;
  v62.size.height = v30;
  v52.origin.CGFloat x = v22;
  v52.origin.CGFloat y = v23;
  v52.size.width = v19;
  v52.size.height = Width;
  if (CGRectContainsRect(v52, v62))
  {
    [(UIView *)self frame];
    CGFloat v31 = v22;
    CGFloat v44 = v53.size.width;
    double v45 = v6;
    CGFloat v43 = v53.size.height;
    CGFloat x = v53.origin.x;
    CGFloat y = v53.origin.y;
    CGFloat v34 = v53.size.width;
    double MinY = CGRectGetMinY(v53);
    v54.origin.CGFloat x = v31;
    v54.origin.CGFloat y = v23;
    v54.size.width = v19;
    v54.size.height = Width;
    double v46 = fmax(v45 - fmax(MinY - CGRectGetMinY(v54), 0.0), 0.0);
    v55.origin.CGFloat x = x;
    v55.origin.CGFloat y = y;
    v55.size.width = v34;
    v55.size.height = v43;
    double MinX = CGRectGetMinX(v55);
    v56.origin.CGFloat x = v31;
    v56.origin.CGFloat y = v23;
    v56.size.width = v19;
    v56.size.height = Width;
    double v48 = fmax(v48 - fmax(MinX - CGRectGetMinX(v56), 0.0), 0.0);
    v57.origin.CGFloat x = v31;
    v57.origin.CGFloat y = v23;
    v57.size.width = v19;
    v57.size.height = Width;
    double MaxY = CGRectGetMaxY(v57);
    v58.origin.CGFloat x = x;
    v58.origin.CGFloat y = y;
    v58.size.width = v44;
    v58.size.height = v43;
    double v49 = fmax(v49 - fmax(MaxY - CGRectGetMaxY(v58), 0.0), 0.0);
    v59.origin.CGFloat x = v31;
    v59.origin.CGFloat y = v23;
    v59.size.width = v19;
    v59.size.height = Width;
    double MaxX = CGRectGetMaxX(v59);
    v60.origin.CGFloat x = x;
    v60.origin.CGFloat y = y;
    double v6 = v46;
    v60.size.width = v44;
    v60.size.height = v43;
    double v39 = fmax(v47 - fmax(MaxX - CGRectGetMaxX(v60), 0.0), 0.0);
  }
  else
  {
    double v39 = v47;
  }
  double v40 = v6;
  double v41 = v48;
  double v42 = v49;
  result.right = v39;
  result.bottom = v42;
  result.left = v41;
  result.top = v40;
  return result;
}

- (int64_t)interfaceOrientation
{
  if (self->_viewOrientation) {
    return self->_viewOrientation;
  }
  double v3 = [(UIWindow *)self _windowHostingScene];
  int64_t v4 = [v3 _interfaceOrientation];

  return v4;
}

- (CGRect)_sceneReferenceBounds
{
  if (self->_windowHostingScene)
  {
    [(_UISceneUIWindowHosting *)self->_windowHostingScene _referenceBounds];
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v10 = [(UIWindow *)self screen];
    [v10 _unjailedReferenceBounds];
    double v3 = v11;
    double v5 = v12;
    double v7 = v13;
    double v9 = v14;
  }
  double v15 = v3;
  double v16 = v5;
  double v17 = v7;
  double v18 = v9;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

uint64_t __36__UIWindow__subtreeMonitorsForView___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _monitorsView:*(void *)(a1 + 32)];
}

- (void)_updateConstraintsIfNeededWithViewForVariableChangeNotifications:(id)a3
{
  if ((~*(void *)&self->super._viewFlags & 0x300000000000) != 0)
  {
    [(UIWindow *)self _layoutEngineCreateIfNecessary];
    v5.receiver = self;
    v5.super_class = (Class)UIWindow;
    [(UIView *)&v5 _updateConstraintsIfNeededWithViewForVariableChangeNotifications:a3];
  }
}

- (id)_responderForKeyEvents
{
  double v3 = [(UIView *)self _focusBehavior];
  int v4 = [v3 syncsFocusAndResponder];

  if (v4)
  {
    objc_super v5 = [(UIView *)self _focusSystem];
    double v6 = [v5 _preferredFirstResponder];

    double v7 = [(UIWindow *)v6 _responderWindow];

    if (v7 == self)
    {
      if (v6) {
        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  if (!_AXSFullKeyboardAccessEnabled()
    || _AXSFullKeyboardAccessPassthroughModeEnabled()
    || ([(UIWindow *)self _focusResponder],
        (double v6 = (UIWindow *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v8 = [(UIWindow *)self firstResponder];
    double v6 = [v8 _responderForEditing];

    if (!v6)
    {
      double v9 = [(UIWindow *)self _deepestActionResponder];
      double v6 = [v9 _responderForEditing];

      if (!v6) {
        double v6 = self;
      }
    }
  }
LABEL_12:
  return v6;
}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  return 0;
}

- (BOOL)_containedInAbsoluteResponderChain
{
  return 1;
}

- (void)_setFirstResponder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (UIResponder *)a3;
  double v6 = self->_firstResponder;
  if (v6 != v5)
  {
    +[UIView _setIsResponderAncestorOfFirstResponder:startingAtFirstResponder:]((uint64_t)UIView, 0, v6);
    if (_IsKindOfUIView((uint64_t)v6)) {
      v6[4].super.isa = (Class)((unint64_t)v6[4].super.isa & ~0x8000uLL);
    }
    objc_storeStrong((id *)&self->_firstResponder, a3);
    if (_IsKindOfUIView((uint64_t)v5)) {
      v5[4].super.isa = (Class)((unint64_t)v5[4].super.isa | 0x8000);
    }
    +[UIView _setIsResponderAncestorOfFirstResponder:startingAtFirstResponder:]((uint64_t)UIView, 1, v5);
    long long v17 = xmmword_1E5303908;
    v16[0] = [NSNumber numberWithInt:*((_DWORD *)&self->_windowFlags + 1) & 1];
    double v7 = v5;
    v16[1] = v7;
    if (v7) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v17 count:v8];
    double v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"UIWindowFirstResponderDidChangeNotification" object:self userInfo:v9];

    double v11 = [(UIWindow *)self _windowHostingScene];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __31__UIWindow__setFirstResponder___block_invoke;
    v14[3] = &unk_1E52DAE80;
    double v15 = v7;
    [v11 _updateUIClientSettingsWithBlock:v14];

    for (uint64_t i = 1; i != -1; --i)
    for (uint64_t j = 8; j != -8; j -= 8)
  }
}

- (id)_firstResponder
{
  return self->_firstResponder;
}

- (id)undoManager
{
  undoManager = self->_undoManager;
  if (!undoManager)
  {
    int v4 = (NSUndoManager *)objc_alloc_init(MEMORY[0x1E4F29140]);
    objc_super v5 = self->_undoManager;
    self->_undoManager = v4;

    undoManager = self->_undoManager;
  }
  return undoManager;
}

- (BOOL)_wantsResponderWithoutKeyboard
{
  return self->_wantsResponderWithoutKeyboard;
}

- (void)_populateInitialTraitCollection:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v4 = (UITraitCollection *)a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  traitCollection = self->_traitCollection;
  if (has_internal_diagnostics)
  {
    if (traitCollection)
    {
      double v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v13 = self;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Window was already initialized: %@", buf, 0xCu);
      }
    }
  }
  else if (traitCollection)
  {
    double v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_populateInitialTraitCollection____s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v13 = self;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Window was already initialized: %@", buf, 0xCu);
    }
  }
  double v7 = self->_traitCollection;
  self->_traitCollection = v4;
  uint64_t v8 = v4;

  v11.receiver = self;
  v11.super_class = (Class)UIWindow;
  [(UIView *)&v11 _populateInitialTraitCollection:v8];
}

- (id)_boundingPath
{
  [(UIView *)self transform3D];
  BOOL v3 = CATransform3DIsIdentity(&v12);
  v11.receiver = self;
  v11.super_class = (Class)UIWindow;
  int v4 = [(UIView *)&v11 _boundingPath];
  if (!v4 || ((*((unsigned char *)&self->_windowFlags + 4) & 2) == 0 ? (BOOL v5 = v3) : (BOOL v5 = 0), !v5))
  {
    if (v3)
    {
      double v6 = [(UIWindow *)self screen];
      double v7 = [v6 _boundingPathUtilities];
      uint64_t v8 = [v7 boundingPathForWindow:self];

      *(void *)&self->_windowFlags &= ~0x200000000uLL;
      int v4 = v6;
    }
    else
    {
      double v9 = [_UIRectangularBoundingPath alloc];
      [(UIView *)self bounds];
      uint64_t v8 = -[_UIRectangularBoundingPath initWithCoordinateSpace:boundingRect:](v9, "initWithCoordinateSpace:boundingRect:", self);
    }

    [(UIView *)self _setBoundingPath:v8];
    int v4 = (void *)v8;
  }
  return v4;
}

- (id)_exclusiveTouchView
{
  return self->_exclusiveTouchView;
}

- (BOOL)__isLandmarkView
{
  return 1;
}

- (BOOL)__isKindOfUIWindow
{
  return 1;
}

- (unint64_t)_supportedInterfaceOrientationsForRootViewController
{
  return [(UIWindow *)self _supportedInterfaceOrientationsConsultingApp:0];
}

- (BOOL)_isTextEffectsWindow
{
  return 0;
}

- (id)_fbsScene
{
  if (a1)
  {
    a1 = [a1[100] _FBSScene];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)_windowCanDynamicallySpecifySupportedInterfaceOrientations
{
  if ([(UIWindow *)self _windowOwnsInterfaceOrientation]) {
    return 1;
  }
  int v4 = [(UIWindow *)self windowScene];
  char v5 = [v4 _canDynamicallySpecifySupportedInterfaceOrientations];

  return v5;
}

- (BOOL)_windowOwnsInterfaceOrientationTransform
{
  if ([(UIWindow *)self _windowOwnsInterfaceOrientation]
    || ([(UIWindow *)self _orientationTransactionToken],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 state],
        v3,
        (unint64_t)(v4 - 1) < 2))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    windowHostingScene = self->_windowHostingScene;
    if (windowHostingScene
      && [(_UISceneUIWindowHosting *)windowHostingScene _canDynamicallySpecifySupportedInterfaceOrientations])
    {
      uint64_t v8 = +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:self->_windowHostingScene];
      double v9 = v8;
      if (v8) {
        BOOL v10 = v8 == self;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10) {
        LOBYTE(v5) = 0;
      }
      else {
        int v5 = [(UIWindow *)self isEqual:v8] ^ 1;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (_UIForcedOrientationTransactionToken)_orientationTransactionToken
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__orientationTransactionToken);
  return (_UIForcedOrientationTransactionToken *)WeakRetained;
}

- (CGRect)_sceneBounds
{
  BOOL v3 = [(UIWindow *)self _windowHostingScene];
  if (!v3
    || self->_viewOrientation && [(UIWindow *)self _windowOwnsInterfaceOrientation])
  {
    [(UIWindow *)self _sceneReferenceBounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(UIWindow *)self _sceneReferenceBounds];
    double v14 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(self->_viewOrientation, v5, v7, v9, v11, v12, v13);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    double v21 = [v3 _coordinateSpace];
    [v21 bounds];
    double v14 = v22;
    double v16 = v23;
    double v18 = v24;
    double v20 = v25;
  }
  double v26 = v14;
  double v27 = v16;
  double v28 = v18;
  double v29 = v20;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (id)_windowHostingScene
{
  return self->_windowHostingScene;
}

+ (id)_findWindowForControllingOverallAppearanceInWindowScene:(id)a3
{
  id v3 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__UIWindow__findWindowForControllingOverallAppearanceInWindowScene___block_invoke_2;
  v8[3] = &__block_descriptor_40_e18_B16__0__UIWindow_8lu32l8;
  v8[4] = &__block_literal_global_565_0;
  double v4 = [v3 _topVisibleWindowPassingTest:v8];
  if (!v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__UIWindow__findWindowForControllingOverallAppearanceInWindowScene___block_invoke_3;
    v7[3] = &__block_descriptor_40_e18_B16__0__UIWindow_8lu32l8;
    v7[4] = &__block_literal_global_565_0;
    double v4 = [v3 _topVisibleWindowPassingTest:v7];
    if (!v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __68__UIWindow__findWindowForControllingOverallAppearanceInWindowScene___block_invoke_4;
      v6[3] = &__block_descriptor_40_e18_B16__0__UIWindow_8lu32l8;
      v6[4] = &__block_literal_global_565_0;
      double v4 = [v3 _topVisibleWindowPassingTest:v6];
    }
  }

  return v4;
}

- (CGPoint)_convertPointFromSceneReferenceSpace:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIWindow *)self _sceneReferenceBounds];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _effectiveSettings];
  uint64_t v11 = [v10 interfaceOrientation];
  BOOL v12 = +[UIWindow _transformLayerRotationsAreEnabled];
  double v13 = v7 - x;
  double v14 = v9 - y;
  if (v11 == 4) {
    double v15 = v9 - y;
  }
  else {
    double v15 = x;
  }
  if (v11 == 4) {
    double v16 = x;
  }
  else {
    double v16 = y;
  }
  if (v11 == 3)
  {
    double v15 = y;
    double v16 = v7 - x;
  }
  if (v11 != 2)
  {
    double v13 = v15;
    double v14 = v16;
  }
  if (v12)
  {
    double x = v13;
    double y = v14;
  }

  double v17 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _coordinateSpace];
  -[UIView convertPoint:fromCoordinateSpace:](self, "convertPoint:fromCoordinateSpace:", v17, x, y);
  double v19 = v18;
  double v21 = v20;

  double v22 = v19;
  double v23 = v21;
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4 && a4 != self)
  {
    double v10 = self;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [a4 _window];

      if (v11 == self)
      {
        v45.receiver = self;
        v45.super_class = (Class)UIWindow;
        -[UIView convertRect:fromCoordinateSpace:](&v45, sel_convertRect_fromCoordinateSpace_, a4, x, y, width, height);
        double x = v12;
        double y = v13;
        double width = v14;
        double height = v15;
        goto LABEL_12;
      }
    }
    else
    {
    }
    windowHostingScene = self->_windowHostingScene;
    objc_msgSend((id)-[_UISceneUIWindowHosting _coordinateSpace](windowHostingScene, "_coordinateSpace"), "convertRect:fromCoordinateSpace:", a4, x, y, width, height);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v25 = [(_UISceneUIWindowHosting *)windowHostingScene _settingsScene];
    double v26 = [v25 _FBSScene];
    if (v26)
    {
    }
    else
    {
      double v27 = [(_UISceneUIWindowHosting *)windowHostingScene _FBSScene];

      if (v27) {
        goto LABEL_11;
      }
      [(UIWindow *)self _sceneReferenceBounds];
      double v39 = v38;
      double v41 = v40;
      double v25 = [(_UISceneUIWindowHosting *)windowHostingScene _effectiveSettings];
      double v18 = _UIWindowConvertRectFromOrientationToOrientation([v25 interfaceOrientation], self->_viewOrientation, v18, v20, v22, v24, v39, v41);
      double v20 = v42;
      double v22 = v43;
      double v24 = v44;
    }

LABEL_11:
    double v28 = [(UIView *)self layer];
    double v29 = [(UIWindow *)self _layerForCoordinateSpaceConversion];
    objc_msgSend(v28, "convertRect:fromLayer:", v29, v18, v20, v22, v24);
    double x = v30;
    double y = v31;
    double width = v32;
    double height = v33;
  }
LABEL_12:
  double v34 = x;
  double v35 = y;
  double v36 = width;
  double v37 = height;
  result.size.double height = v37;
  result.size.double width = v36;
  result.origin.double y = v35;
  result.origin.double x = v34;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4 && a4 != self)
  {
    double v10 = self;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [a4 _window];

      if (v11 == self)
      {
        v43.receiver = self;
        v43.super_class = (Class)UIWindow;
        -[UIView convertRect:toCoordinateSpace:](&v43, sel_convertRect_toCoordinateSpace_, a4, x, y, width, height);
LABEL_12:
        double x = v12;
        double y = v13;
        double width = v14;
        double height = v15;
        goto LABEL_13;
      }
    }
    else
    {
    }
    windowHostingScene = self->_windowHostingScene;
    id v17 = (id)[(_UISceneUIWindowHosting *)windowHostingScene _coordinateSpace];
    double v18 = [(UIView *)self layer];
    double v19 = [(UIWindow *)self _layerForCoordinateSpaceConversion];
    objc_msgSend(v18, "convertRect:toLayer:", v19, x, y, width, height);
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    double v28 = [(_UISceneUIWindowHosting *)windowHostingScene _settingsScene];
    double v29 = [v28 _FBSScene];
    if (v29)
    {
    }
    else
    {
      double v30 = [(_UISceneUIWindowHosting *)windowHostingScene _FBSScene];

      if (v30) {
        goto LABEL_11;
      }
      [(UIWindow *)self _sceneReferenceBounds];
      double v36 = v35;
      double v38 = v37;
      int64_t viewOrientation = self->_viewOrientation;
      double v28 = [(_UISceneUIWindowHosting *)windowHostingScene _effectiveSettings];
      double v21 = _UIWindowConvertRectFromOrientationToOrientation(viewOrientation, [v28 interfaceOrientation], v21, v23, v25, v27, v36, v38);
      double v23 = v40;
      double v25 = v41;
      double v27 = v42;
    }

LABEL_11:
    objc_msgSend(v17, "convertRect:toCoordinateSpace:", a4, v21, v23, v25, v27);
    goto LABEL_12;
  }
LABEL_13:
  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (BOOL)_windowOwnsInterfaceOrientation
{
  double v2 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _FBSScene];
  id v3 = v2;
  if (v2 && ([v2 uiCanReceiveDeviceOrientationEvents] & 1) == 0)
  {
    double v5 = [v3 uiSettings];
    BOOL v4 = [v5 interfaceOrientationMode] == 100;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (id)_layerForCoordinateSpaceConversion
{
  return 0;
}

- (CGPoint)_constrainTouchLocationToScene:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = -[UIWindow _fbsScene]((id *)&self->super.super.super.isa);
  double v7 = [(UIWindow *)self screen];
  double v8 = [v7 fixedCoordinateSpace];
  if (v6)
  {
    double v9 = [v6 settings];
    [v9 frame];
  }
  else
  {
    double v9 = [(UIWindow *)self screen];
    [v9 _referenceBounds];
  }
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;

  -[UIView convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v8, x, y);
  double v19 = v18;
  double v21 = v20;
  double v22 = fmax(v14, fmin(v18, nextafter(v14 + v16, -1.79769313e308)));
  double v23 = fmax(v15, fmin(v21, nextafter(v15 + v17, -1.79769313e308)));
  double v24 = vabdd_f64(v23, v21);
  if (vabdd_f64(v22, v19) >= 0.00000011920929 || v24 >= 0.00000011920929)
  {
    UIFloorToViewScale(self);
    double v22 = v26;
    UIFloorToViewScale(self);
    double v23 = v27;
  }
  -[UIView convertPoint:fromCoordinateSpace:](self, "convertPoint:fromCoordinateSpace:", v8, v22, v23);
  double v29 = v28;
  double v31 = v30;

  double v32 = v29;
  double v33 = v31;
  result.double y = v33;
  result.double x = v32;
  return result;
}

- (id)_overrideTargetWindowForPathIndex:(unint64_t)a3 forEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  return 0;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 0;
}

+ (void)_executeDeferredOrientationUpdates
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v0 = [self allWindowsIncludingInternalWindows:0 onlyVisibleWindows:1];
  long long v5 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v1 = [v0 countByEnumeratingWithState:&v5 objects:v9 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v6;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v6 != v3) {
          objc_enumerationMutation(v0);
        }
        [*(id *)(*((void *)&v5 + 1) + 8 * v4++) _executeDeferredOrientationUpdate];
      }
      while (v2 != v4);
      uint64_t v2 = [v0 countByEnumeratingWithState:&v5 objects:v9 count:16];
    }
    while (v2);
  }
}

+ (id)allWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4 forScreen:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  double v17 = __76__UIWindow_allWindowsIncludingInternalWindows_onlyVisibleWindows_forScreen___block_invoke;
  double v18 = &unk_1E53039C8;
  id v19 = v8;
  id v10 = v9;
  id v20 = v10;
  id v11 = v8;
  [a1 _enumerateWindowsIncludingInternalWindows:v6 onlyVisibleWindows:v5 allowMutation:0 withBlock:&v15];
  objc_msgSend(v10, "sortUsingFunction:context:", _UIWindowCompareWindowsUsingLevel, 0, v15, v16, v17, v18);
  double v12 = v20;
  id v13 = v10;

  return v13;
}

+ (void)_enumerateWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4 allowMutation:(BOOL)a5 withBlock:(id)a6
{
}

+ (id)allWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4
{
  return (id)[a1 allWindowsIncludingInternalWindows:a3 onlyVisibleWindows:a4 forScreen:0];
}

- (CGRect)_referenceFrameFromSceneUsingScreenBounds:(BOOL)a3
{
  if (([(id)UIApp _appAdoptsUISceneLifecycle] & 1) == 0)
  {
    double v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"UIWindow.m" lineNumber:7685 description:@"Incorrect code path when app does not use UIScene lifecycle API"];
  }
  BOOL v6 = [(UIWindow *)self windowScene];
  objc_msgSend(v6, "_referenceBoundsForOrientation:", objc_msgSend(v6, "interfaceOrientation"));
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = 0.0;
  if (!a3)
  {
    uint64_t v16 = __UIStatusBarManagerForWindow(self);
    [v16 defaultStatusBarHeightInOrientation:1];
    double v15 = v17;
  }
  double v18 = [(UIWindow *)self screen];
  if ([v18 _userInterfaceIdiom] == 3
    && +[UIScreen _shouldDisableJail])
  {
    +[UIStatusBar_Base heightForStyle:400 orientation:1 inWindow:self];
    double v14 = v14 - v19;
  }
  else if (v15 > 0.0)
  {
    id v20 = __UIStatusBarManagerForWindow(self);
    char v21 = [v20 isStatusBarHidden];

    if ((v21 & 1) == 0)
    {
      double v22 = [(UIWindow *)self _windowHostingScene];
      int v23 = [v22 _sceneSessionRoleIsCarPlayOrNonInteractiveExternal];

      double v24 = 0.0;
      if (!v23) {
        double v24 = v15;
      }
      double v14 = v14 - v24;
      double v25 = -0.0;
      if (!v23) {
        double v25 = v15;
      }
      double v10 = v10 + v25;
    }
  }
  if ([v18 overscanCompensation] == 2 && _UIDeviceNativeUserInterfaceIdiom() != 2)
  {
    [v18 overscanCompensationInsets];
    double v8 = v8 + v26;
    double v10 = v10 + v27;
    double v12 = v12 - (v26 + v28);
    double v14 = v14 - (v27 + v29);
  }

  double v30 = v8;
  double v31 = v10;
  double v32 = v12;
  double v33 = v14;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (void)_willChangeToSize:(CGSize)a3 orientation:(int64_t)a4 screen:(id)a5 withTransitionCoordinator:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v15 = a6;
  if ([(UIWindow *)self _shouldPropagateTraitCollectionChanges]
    && ((*(unsigned char *)&self->_windowFlags & 0x20) != 0 || (dyld_program_sdk_at_least() & 1) == 0))
  {
    BOOL v10 = +[UIWindow _transformLayerRotationsAreEnabled];
    int v11 = (unint64_t)(a4 - 1) < 2 || v10;
    if (v11) {
      double v12 = width;
    }
    else {
      double v12 = height;
    }
    if (!v11) {
      double height = width;
    }
    double v13 = -[UIWindow _windowParentTraitCollection]((id *)&self->super.super.super.isa);
    double v14 = -[UIWindow _traitCollectionForSize:parentCollection:](self, "_traitCollectionForSize:parentCollection:", v13, v12, height);

    [(UIWindow *)self _willTransitionToTraitCollection:v14 withTransitionCoordinator:v15];
  }
  [(UIWindow *)self _setNeedsBoundingPathUpdate];
}

- (void)_updateWindowTraitsAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*(unsigned char *)&self->_windowFlags & 0x20) != 0 || (dyld_program_sdk_at_least() & 1) == 0)
  {
    BOOL v5 = self->_traitCollection;
    BOOL v6 = -[UIWindow _windowParentTraitCollection]((id *)&self->super.super.super.isa);
    double v7 = -[UIWindow _traitCollectionForSize:parentCollection:](self, "_traitCollectionForSize:parentCollection:", v6, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

    objc_storeStrong((id *)&self->_traitCollection, v7);
    _UITraitEnvironmentGeneratedTraitCollection((uint64_t)self, (unint64_t)v7);
    if (v3)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      _UICreateTraitCollectionChangeDescription((uint64_t)v5, v7, (uint64_t)&v11);
      if (!BYTE8(v14))
      {
        _UIViewInvalidateTraitCollectionAndSchedulePropagation((uint64_t)self, 0);
        [(UIView *)self _traitCollectionDidChangeInternal:&v11];
        -[UIView _invalidateTraitCollectionAndSchedulePropagationForSubviews](self);
        int v8 = [*((id *)&v11 + 1) hasDifferentColorAppearanceComparedToTraitCollection:(void)v11];
        uint64_t v9 = 0x4000000000;
        if (!v8) {
          uint64_t v9 = 0;
        }
        self->_windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&self->_windowFlags & 0xFFFFFFBFFFFFFFFFLL | v9);
        [(UIWindow *)self _traitCollectionDidChangeOnSubtreeInternal:&v11];
        *(void *)&self->_windowFlags &= ~0x4000000000uLL;
        [(_UIViewControllerNullAnimationTransitionCoordinator *)self->_traitCollectionChangeTransitionCoordinator _runAlongsideAnimations];
        [(UIWindow *)self _setTraitCollectionChangeTransitionCoordinator:0];
        destinationTraitCollection = self->_destinationTraitCollection;
        self->_destinationTraitCollection = 0;
      }
      if ((void)v12) {
    }
      }
  }
}

- (id)_windowParentTraitCollection
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 101);
    BOOL v3 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v4 = [WeakRetained traitCollection];
      if (!v4)
      {
        BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
        [v5 handleFailureInMethod:sel__windowParentTraitCollection, a1, @"UIWindow.m", 6347, @"UIKit internal inconsistency: overrideParentTraitEnvironment returned a nil traitCollection: %@", v3 object file lineNumber description];

        uint64_t v4 = 0;
      }
    }
    else
    {
      uint64_t v4 = [a1 _windowHostingSceneTraitCollection];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)_windowHostingSceneTraitCollection
{
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _traitCollection];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (id)_traitCollectionForSize:(CGSize)a3 parentCollection:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__UIWindow__traitCollectionForSize_parentCollection___block_invoke;
  v6[3] = &unk_1E53038B0;
  v6[4] = self;
  uint64_t v4 = -[UIWindow _traitCollectionForSize:parentCollection:traitOverrideApplicator:](self, "_traitCollectionForSize:parentCollection:traitOverrideApplicator:", a4, v6, a3.width, a3.height);
  return v4;
}

- (void)_setNeedsBoundingPathUpdate
{
  if (![(UIWindow *)self _isHostedInAnotherProcess]) {
    *(void *)&self->_windowFlags |= 0x200000000uLL;
  }
}

- (void)_updateWindowTraits
{
  if ([(UIWindow *)self _shouldPropagateTraitCollectionChanges])
  {
    [(UIWindow *)self _updateWindowTraitsAndNotify:1];
  }
}

- (BOOL)_shouldPropagateTraitCollectionChanges
{
  return 1;
}

- (id)_traitCollectionForSize:(CGSize)a3 parentCollection:(id)a4 traitOverrideApplicator:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v10 = a4;
  id v11 = a5;
  TraitCollectionTSD = GetTraitCollectionTSD();
  char v13 = TraitCollectionTSD[9];
  TraitCollectionTSD[9] = 1;
  p_viewFlags = &self->super._viewFlags;
  uint64_t v15 = *(void *)((char *)&self->super._viewFlags + 20);
  *(void *)((char *)&self->super._viewFlags + 20) = v15 | 0x80000000;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [(UIView *)self bounds];
    double height = v17;
    double v19 = v18;
    int64_t v20 = [(UIWindow *)self interfaceOrientation];
    BOOL v21 = +[UIWindow _transformLayerRotationsAreEnabled];
    int v22 = (unint64_t)(v20 - 1) < 2 || v21;
    double width = v22 ? height : v19;
    if (v22) {
      double height = v19;
    }
  }
  int v56 = v15;
  if (v10)
  {
    int v23 = (UITraitCollection *)v10;
    goto LABEL_22;
  }
  if (dyld_program_sdk_at_least())
  {
    traitCollection = self->_traitCollection;
    if (traitCollection)
    {
      int v23 = traitCollection;
      goto LABEL_22;
    }
    if (dyld_program_sdk_at_least())
    {
      double v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2 object:self file:@"UIWindow.m" lineNumber:6405 description:@"Trait collection is being accessed too early"];
    }
  }
  +[UITraitCollection _emptyTraitCollection]();
  int v23 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
LABEL_22:
  double v26 = v23;
  int64_t horizontalSizeClassStateRestorationOverride = self->_horizontalSizeClassStateRestorationOverride;
  if (!horizontalSizeClassStateRestorationOverride) {
    int64_t horizontalSizeClassStateRestorationOverride = _UIUserInterfaceSizeClassForWidth(width);
  }
  int64_t verticalSizeClassStateRestorationOverride = self->_verticalSizeClassStateRestorationOverride;
  if (!verticalSizeClassStateRestorationOverride) {
    int64_t verticalSizeClassStateRestorationOverride = _UIUserInterfaceSizeClassForHeight(height);
  }
  char v57 = v13;
  CGRect v59 = v26;
  if ([(id)UIApp _effectiveUserInterfaceStyle])
  {
    uint64_t v29 = 0;
  }
  else
  {
    double v30 = [(UIWindow *)self windowScene];
    double v31 = [v30 traitCollection];

    double v32 = [(UIWindow *)self _windowHostingScene];
    double v33 = [v32 _effectiveUISettings];

    double v34 = v31;
    if (v31 || (double v34 = v33) != 0) {
      uint64_t v29 = [v34 userInterfaceStyle];
    }
    else {
      uint64_t v29 = 0;
    }
  }
  double v35 = +[UIDevice currentDevice];
  uint64_t v36 = [v35 userInterfaceIdiom];

  CGRect v58 = (void (**)(void, void))v11;
  if ((v36 & 0xFFFFFFFFFFFFFFFBLL) == 1
    && ([(id)UIApp _isSpringBoard] & 1) == 0
    && dyld_program_sdk_at_least())
  {
    uint64_t v37 = v29;
    double v38 = [(UIWindow *)self screen];
    double v39 = [v38 coordinateSpace];

    uint64_t v40 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _coordinateSpace];
    double v41 = (void *)v40;
    uint64_t v42 = -1;
    if (v39 && v40)
    {
      [v39 bounds];
      double v44 = v43;
      double v46 = v45;
      [v41 bounds];
      objc_msgSend(v41, "convertRect:toCoordinateSpace:", v39);
      uint64_t v42 = v48 < v46 || v47 < v44;
    }
  }
  else
  {
    uint64_t v37 = v29;
    uint64_t v42 = -1;
  }
  unint64_t v49 = v56 & 0x80000000;
  if ([v10 userInterfaceIdiom] == 3)
  {
    CGRect v50 = [(UIWindow *)self windowScene];
    CGRect v51 = [v50 _effectiveUISettings];

    if (v51) {
      uint64_t v52 = [v51 accessibilityContrast];
    }
    else {
      uint64_t v52 = -1;
    }
  }
  else
  {
    uint64_t v52 = -1;
  }
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __77__UIWindow__traitCollectionForSize_parentCollection_traitOverrideApplicator___block_invoke;
  v60[3] = &unk_1E53038D8;
  v60[6] = verticalSizeClassStateRestorationOverride;
  v60[7] = v37;
  v60[8] = v42;
  v60[9] = v52;
  char v61 = v49 >> 31;
  v60[4] = self;
  v60[5] = horizontalSizeClassStateRestorationOverride;
  CGRect v53 = -[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](v59, (uint64_t)v60);
  if (v58)
  {
    uint64_t v54 = ((void (**)(void, void *))v58)[2](v58, v53);

    CGRect v53 = (void *)v54;
  }
  *(void *)((char *)p_viewFlags + 20) = *(void *)((char *)p_viewFlags + 20) & 0xFFFFFFFF7FFFFFFFLL | v49;
  *((unsigned char *)GetTraitCollectionTSD() + 9) = v57;

  return v53;
}

id __53__UIWindow__traitCollectionForSize_parentCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  -[UIView _traitOverridesIfExist](*(_DWORD **)(a1 + 32));
  uint64_t v4 = (void **)objc_claimAutoreleasedReturnValue();
  BOOL v5 = v4;
  if (v4)
  {
    -[_UITraitOverrides _traitCollectionByApplyingOverridesToTraitCollection:](v4, v3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v3;
  }
  double v7 = v6;

  return v7;
}

uint64_t __57__UIWindow__supportedInterfaceOrientationsConsultingApp___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v4 = objc_msgSend(v3, "__supportedInterfaceOrientations");
  }
  else {
    uint64_t v4 = [v3 supportedInterfaceOrientations];
  }
  uint64_t v5 = v4;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Orientation", &_UIInternalPreference_ShowTouchesForAllProcesses_block_invoke_4___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    int v8 = *(id *)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void **)(a1 + 40);
      if (v9)
      {
        id v10 = NSString;
        id v11 = v9;
        long long v12 = (objc_class *)objc_opt_class();
        char v13 = NSStringFromClass(v12);
        long long v14 = [v10 stringWithFormat:@"<%@: %p>", v13, v11];
      }
      else
      {
        long long v14 = @"(nil)";
      }
      uint64_t v15 = v14;
      uint64_t v16 = *(void **)(a1 + 32);
      if (v16)
      {
        double v17 = NSString;
        id v18 = v16;
        double v19 = (objc_class *)objc_opt_class();
        int64_t v20 = NSStringFromClass(v19);
        BOOL v21 = [v17 stringWithFormat:@"<%@: %p>", v20, v18];
      }
      else
      {
        BOOL v21 = @"(nil)";
      }
      int v22 = v21;
      int v23 = v21;
      double v24 = BSInterfaceOrientationMaskDescription();
      double v25 = NSStringFromBOOL();
      *(_DWORD *)buf = 138413058;
      double v27 = v15;
      __int16 v28 = 2112;
      uint64_t v29 = v22;
      __int16 v30 = 2112;
      double v31 = v24;
      __int16 v32 = 2112;
      double v33 = v25;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "%@: Rotation view controller (%@) provided supported orientations: %@; consultedApplication=%@",
        buf,
        0x2Au);
    }
  }
  return v5;
}

- (UIEdgeInsets)_overlayInsets
{
  rootViewController = self->_rootViewController;
  if (rootViewController)
  {
    uint64_t v4 = [(UIViewController *)rootViewController _existingView];
    uint64_t v5 = [v4 window];

    id v6 = self->_rootViewController;
    float64x2_t v7 = 0uLL;
    if (v5 == self)
    {
      if (v6)
      {
        [(UIViewController *)v6 _cumulativeOverlayInsetsInView:self];
        float64x2_t v10 = 0uLL;
        float64x2_t v11 = 0uLL;
        float64x2_t v7 = 0uLL;
        float64x2_t v12 = 0uLL;
        id v6 = self->_rootViewController;
      }
      else
      {
        float64x2_t v12 = 0uLL;
        float64x2_t v10 = 0uLL;
        float64x2_t v11 = 0uLL;
      }
      float64x2_t v26 = v11;
      float64x2_t v27 = v10;
      float64x2_t v28 = v12;
      float64x2_t v29 = v7;
    }
    else
    {
      float64x2_t v28 = 0uLL;
      float64x2_t v29 = 0uLL;
      float64x2_t v26 = 0uLL;
      float64x2_t v27 = 0uLL;
    }
    char v13 = v6;
    long long v14 = [(UIViewController *)v13 presentedViewController];

    if (v14)
    {
      do
      {
        uint64_t v15 = v13;
        char v13 = [(UIViewController *)v13 presentedViewController];

        uint64_t v16 = [(UIViewController *)v13 _existingPresentationControllerImmediate:0 effective:1];
        unint64_t v17 = [v16 presentationStyle];
        if (v17 <= 5 && ((1 << v17) & 0x23) != 0)
        {
          float64x2_t v19 = 0uLL;
          if (v13)
          {
            [(UIViewController *)v13 _cumulativeOverlayInsetsInView:self];
            float64x2_t v21 = 0u;
            float64x2_t v20 = 0u;
            float64x2_t v19 = 0u;
            float64x2_t v22 = 0u;
          }
          else
          {
            float64x2_t v22 = 0uLL;
            float64x2_t v21 = 0uLL;
            float64x2_t v20 = 0uLL;
          }
          float64x2_t v26 = vmaxnmq_f64(v26, v20);
          float64x2_t v27 = vmaxnmq_f64(v27, v21);
          float64x2_t v28 = vaddq_f64(v28, v22);
          float64x2_t v29 = vaddq_f64(v29, v19);
        }

        int v23 = [(UIViewController *)v13 presentedViewController];
      }
      while (v23);
    }

    float64x2_t v9 = vmaxnmq_f64(vaddq_f64(v28, v26), (float64x2_t)0);
    float64x2_t v8 = vmaxnmq_f64(vaddq_f64(v29, v27), (float64x2_t)0);
  }
  else
  {
    float64x2_t v8 = 0uLL;
    float64x2_t v9 = 0uLL;
  }
  double v24 = v8.f64[1];
  double v25 = v9.f64[1];
  result.bottom = v9.f64[0];
  result.top = v8.f64[0];
  result.right = v25;
  result.left = v24;
  return result;
}

void __22__UIWindow_initialize__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_adjustForAccessibilityIfNeeded_ name:@"UIApplicationDidBecomeActiveNotification" object:0];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_adjustForAccessibilityIfNeeded_ name:@"UIAccessibilityDarkerSystemColorsStatusDidChangeNotification" object:0];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_adjustForAccessibilityIfNeeded_ name:@"UIAccessibilitySingleSystemColorChangedNotification" object:0];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_adjustForAccessibilityIfNeeded_ name:@"UIAccessibilityInvertColorsChanged" object:0];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_adjustFocusForAccessibilityIfNeeded_ name:@"UIAccessibilityFullKeyboardAccessStatusDidChangeNotification" object:0];
}

- (id)_roleHint
{
  return self->_roleHint;
}

BOOL __75__UIWindow__hitTestToPoint_scenePointZ_forEvent_windowServerHitTestWindow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _ignoresHitTest])
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = objc_msgSend(v3, "_hitTestLocation:sceneLocationZ:inScene:withWindowServerHitTestWindow:event:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- ($015CE332057EA49C37F0282AEB389482)_bindingDescription
{
  id v6 = [(UIWindow *)self screen];
  retstr->var0 = (id)[v6 displayIdentity];
  retstr->var1 = 0;
  retstr->var2 = [(UIWindow *)self _ignoresHitTest];
  retstr->var3 = [(UIWindow *)self _shouldCreateContextAsSecure];
  retstr->var4 = [(UIWindow *)self _shouldUseRemoteContext];
  retstr->var5 = [(UIWindow *)self _alwaysGetsContexts];
  retstr->var6 = [(UIWindow *)self _isWindowServerHostingManaged];
  retstr->var7 = [(UIWindow *)self keepContextInBackground];
  retstr->var8 = [(UIWindow *)self _isHostingPortalViews];
  retstr->var9 = [(UIWindow *)self _allowsOcclusionDetectionOverride];

  return result;
}

- (BOOL)_ignoresHitTest
{
  return 0;
}

- (BOOL)keepContextInBackground
{
  return *((unsigned char *)&self->_windowFlags + 3) & 1;
}

- (BOOL)_shouldUseRemoteContext
{
  BOOL result = UIApp;
  if (UIApp) {
    return [(id)objc_opt_class() rendersLocally] ^ 1;
  }
  return result;
}

- (BOOL)_shouldCreateContextAsSecure
{
  if (*((unsigned char *)&self->_windowFlags + 3) & 0x20) != 0 || ([(id)objc_opt_class() _isSecure])
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    int v2 = [(id)objc_opt_class() _isSystemWindow];
    if (v2)
    {
      id v3 = (void *)UIApp;
      LOBYTE(v2) = [v3 _areSystemWindowsSecure];
    }
  }
  return v2;
}

- (BOOL)_isHostingPortalViews
{
  return 0;
}

- (BOOL)_allowsOcclusionDetectionOverride
{
  return 0;
}

+ (BOOL)_isSecure
{
  return 0;
}

+ (BOOL)_isSystemWindow
{
  return 0;
}

- (id)_hitTestLocation:(CGPoint)a3 sceneLocationZ:(double)a4 inScene:(id)a5 withWindowServerHitTestWindow:(id)a6 event:(id)a7
{
  double y = a3.y;
  double x = a3.x;
  id v12 = a7;
  id v13 = a6;
  long long v14 = [(UIView *)self _hitTest:v12 withEvent:v13 windowServerHitTestWindow:_UIConvertScenePoint3DToWindow(a5, self, x, y)];

  return v14;
}

- (void)_setHidden:(BOOL)a3 forced:(BOOL)a4
{
  BOOL v4 = a3;
  $B5B0456088C508EDB812873BE14D7A88 windowFlags = self->_windowFlags;
  if ((*(_DWORD *)&windowFlags & 0x2000000) != 0)
  {
    self->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&windowFlags & 0xFFFFFFFFFDFFFFFFLL);
    int v8 = 1;
    if (a3) {
      goto LABEL_5;
    }
LABEL_9:
    uint64_t v23 = 0;
    double v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __30__UIWindow__setHidden_forced___block_invoke;
    v22[3] = &unk_1E52E3210;
    v22[4] = self;
    v22[5] = &v23;
    [(UIWindow *)self _updateLayerOrderingAndSetLayerHidden:0 actionBlock:v22];
    if (*((unsigned char *)v24 + 24))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);

      if (WeakRetained)
      {
        float64x2_t v10 = [(UIWindow *)self _deferredOrientationUpdate];

        if (!v10) {
          -[UIWindow _updateToInterfaceOrientation:duration:force:](self, "_updateToInterfaceOrientation:duration:force:", [(id)UIApp _statusBarOrientationForWindow:self], 1, 0.0);
        }
      }
    }
    if (v8)
    {
      [(UIWindow *)self _updateWindowTraits];
      _UIViewRecursivelyApplyBlockToSubtreesWithMotionEffects(self, &__block_literal_global_1188);
      _UIPencilEventRequestBarrelFocusIfAbleForWindow(self, 1);
      float64x2_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 postNotificationName:@"UIWindowDidBecomeVisibleNotification" object:self];
    }
    id v12 = [(UIWindow *)self _windowHostingScene];
    id v13 = [v12 _eventDeferringManager];

    long long v14 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
    -[_UIEventDeferringManager fallbackLocalDeferringTargetWindowIfPermittedForEnvironment:](v13, v14);
    uint64_t v15 = (UIWindow *)objc_claimAutoreleasedReturnValue();

    uint64_t v16 = [(UIWindow *)self screen];
    char v17 = [v16 _isMainLikeScreen];
    if (v15 == self) {
      char v18 = v17;
    }
    else {
      char v18 = 1;
    }

    if (v18)
    {
      if (![(UIView *)self _shouldInformFocusAboutBecomingVisible])
      {
LABEL_23:

        _Block_object_dispose(&v23, 8);
        return;
      }
      float64x2_t v19 = [(UIView *)self _focusSystem];
      [v19 _focusEnvironmentDidAppear:self];
    }
    else
    {
      float64x2_t v19 = [(UIView *)self _focusSystem];
      [v19 setNeedsFocusUpdate];
    }

    goto LABEL_23;
  }
  BOOL v7 = a4;
  int v8 = [(UIView *)self isHidden] ^ a3;
  *(void *)&self->_windowFlags &= ~0x2000000uLL;
  if ((v8 & 1) == 0 && !v7) {
    return;
  }
  if (!v4) {
    goto LABEL_9;
  }
LABEL_5:
  [(UIWindow *)self _updateLayerOrderingAndSetLayerHidden:1];
  if ((UIWindow *)qword_1EB259DD0 == self)
  {
    qword_1EB259DD0 = 0;
    if (!v8) {
      return;
    }
  }
  else if (!v8)
  {
    return;
  }
  _UIViewRecursivelyApplyBlockToSubtreesWithMotionEffects(self, &__block_literal_global_1184_0);
  float64x2_t v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v20 postNotificationName:@"UIWindowDidBecomeHiddenNotification" object:self];

  id v21 = [(UIView *)self _focusSystem];
  [v21 _focusEnvironmentWillDisappear:self];
}

- (void)setHidden:(BOOL)a3
{
}

- (void)setupForOrientation:(int64_t)a3
{
  if (![(UIWindow *)self inhibitSetupOrientation])
  {
    uint64_t v5 = [(UIWindow *)self screen];
    id v6 = +[UIScreen mainScreen];

    if (v5 == v6)
    {
      BOOL v7 = [(UIWindow *)self screen];
      [v7 _referenceBounds];
      double v9 = v8;
      double v11 = v10;

      long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v30.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v30.c = v12;
      *(_OWORD *)&v30.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(UIView *)self setTransform:&v30];
      if ((unint64_t)(a3 - 1) < 2)
      {
        double v13 = v9;
        double v14 = v11;
      }
      else
      {
        if ((unint64_t)(a3 - 3) > 1) {
          goto LABEL_8;
        }
        double v13 = v11;
        double v14 = v9;
      }
      -[UIWindow setBounds:](self, "setBounds:", 0.0, 0.0, v13, v14);
LABEL_8:
      [(UIView *)self bounds];
      double v16 = v15 * 0.5;
      [(UIView *)self bounds];
      -[UIWindow setCenter:](self, "setCenter:", v16, v17 * 0.5);
      if ([(UIWindow *)self _isHostedInAnotherProcess]
        && ![(UIWindow *)self _isTextEffectsWindowHosting]
        || [(UIWindow *)self inhibitManualTransform]
        || ![(UIWindow *)self _windowOwnsInterfaceOrientation])
      {
        goto LABEL_28;
      }
      [(UIView *)self center];
      CGFloat v19 = -v18;
      [(UIView *)self center];
      CGAffineTransformMakeTranslation(&v30, v19, -v20);
      switch(a3)
      {
        case 1:
          double v21 = 0.0;
          break;
        case 3:
          double v21 = 1.57079633;
          break;
        case 4:
          double v21 = -1.57079633;
          break;
        default:
          double v21 = 3.14159265;
          if (a3 != 2) {
            double v21 = 0.0;
          }
          break;
      }
      CGAffineTransform v28 = v30;
      CGAffineTransformRotate(&v29, &v28, v21);
      CGAffineTransform v30 = v29;
      [(UIView *)self center];
      CGFloat v23 = v22;
      [(UIView *)self center];
      CGAffineTransform v28 = v30;
      CGAffineTransformTranslate(&v29, &v28, v23, v24);
      CGAffineTransform v30 = v29;
      switch(a3)
      {
        case 4:
          double v25 = -v11;
          CGAffineTransform v28 = v30;
          double v26 = 0.0;
          break;
        case 3:
          double v26 = -v9;
          CGAffineTransform v28 = v30;
          double v25 = 0.0;
          break;
        case 2:
          double v25 = -v9;
          double v26 = -v11;
          CGAffineTransform v28 = v30;
          break;
        default:
LABEL_27:
          v27[0] = vrndaq_f64(*(float64x2_t *)&v30.a);
          v27[1] = vrndaq_f64(*(float64x2_t *)&v30.c);
          v27[2] = vrndaq_f64(*(float64x2_t *)&v30.tx);
          [(UIView *)self setTransform:v27];
LABEL_28:
          self->_int64_t viewOrientation = a3;
          return;
      }
      CGAffineTransformTranslate(&v29, &v28, v25, v26);
      CGAffineTransform v30 = v29;
      goto LABEL_27;
    }
  }
}

- (BOOL)inhibitTextEffectsRotation
{
  if ([(UIWindow *)self inhibitSetupOrientation]) {
    return 1;
  }
  return [(UIWindow *)self inhibitManualTransform];
}

- (BOOL)inhibitSetupOrientation
{
  int v2 = [(UIWindow *)self rootViewController];
  char v3 = [v2 shouldAutorotate];

  return v3;
}

+ (void)_synchronizeDrawingWithFence:(id)a3 preCommitHandler:(id)a4
{
  id v6 = (void *)UIApp;
  id v7 = a4;
  id v8 = a3;
  [v6 _trackSystemAnimationFence:v8];
  id v9 = [v8 CAFenceHandle];

  [a1 _synchronizeDrawingWithCAFence:v9 preCommitHandler:v7];
}

+ (void)_synchronizeDrawingWithCAFence:(id)a3 preCommitHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (pthread_main_np() != 1)
  {
    double v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:a1 file:@"UIWindow.m" lineNumber:5793 description:@"fencing must be performed on the main thread"];
  }
  if ([v7 isUsable])
  {
    if (__caCommitState == 1)
    {
      if (os_variant_has_internal_diagnostics())
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Fence", &qword_1EB259E88);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          double v10 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "if we're snapshotting then just ignore fence requests - we'll synchronize anyway so that'll have to be close enough", buf, 2u);
          }
        }
      }
      goto LABEL_23;
    }
    [(id)UIApp _beginFenceTaskIfNecessary];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v11 = __windowsWithContexts();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v38 count:16];
    if (!v12)
    {
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v13 = v12;
    char v14 = 0;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v11);
        }
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*((void *)&v27 + 1) + 8 * i) + 464));
        int v18 = [WeakRetained addFence:v7];

        if (v18) {
          char v14 = 1;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v38 count:16];
    }
    while (v13);

    if (v14)
    {
      if (!v8) {
        goto LABEL_28;
      }
      goto LABEL_24;
    }
    if (os_variant_has_internal_diagnostics())
    {
      CGFloat v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Fence", &qword_1EB259E90) + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        double v20 = (void *)MEMORY[0x1E4F39CF8];
        double v11 = v19;
        int v21 = [v20 currentPhase];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v21;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "failed to register fence : current transaction phase %i", buf, 8u);
        goto LABEL_22;
      }
    }
  }
LABEL_23:
  if (!v8) {
    goto LABEL_31;
  }
LABEL_24:
  double v22 = (void *)[v8 copy];
  if (qword_1EB259E80)
  {
    [(id)qword_1EB259E80 addObject:v22];
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA48] arrayWithObject:v22];
    CGFloat v24 = (void *)qword_1EB259E80;
    qword_1EB259E80 = v23;
  }
LABEL_28:
  if (!byte_1EB259DB5)
  {
    byte_1EB259DB5 = [MEMORY[0x1E4F39CF8] addCommitHandler:&__block_literal_global_471_0 forPhase:3];
    if ((byte_1EB259DB5 & 1) == 0)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      *(_OWORD *)buf = 0u;
      os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      int v26 = [MEMORY[0x1E4F39CF8] currentPhase];
      int v31 = 67109120;
      int v32 = v26;
      _os_log_send_and_compose_impl();
      _os_crash_msg();
      __break(1u);
    }
    [MEMORY[0x1E4F39CF8] activate];
  }
LABEL_31:
}

void __77__UIWindow__traitCollectionForSize_parentCollection_traitOverrideApplicator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  long long v35 = a2;
  uint64_t v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v6 = v35[2]();
    uint64_t v7 = [v6 horizontalSizeClass];
    uint64_t v8 = *(void *)(a1 + 40);

    if (v7 != v8)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      double v10 = v5[2](v5);
      [v10 setHorizontalSizeClass:v9];
    }
  }
  if (*(void *)(a1 + 48))
  {
    double v11 = v35[2]();
    uint64_t v12 = [v11 verticalSizeClass];
    uint64_t v13 = *(void *)(a1 + 48);

    if (v12 != v13)
    {
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = v5[2](v5);
      [v15 setVerticalSizeClass:v14];
    }
  }
  if (*(void *)(a1 + 56))
  {
    double v16 = v35[2]();
    uint64_t v17 = [v16 userInterfaceStyle];
    uint64_t v18 = *(void *)(a1 + 56);

    if (v17 != v18)
    {
      uint64_t v19 = *(void *)(a1 + 56);
      double v20 = v5[2](v5);
      [v20 setUserInterfaceStyle:v19];
    }
  }
  if (*(void *)(a1 + 64) != -1)
  {
    int v21 = v35[2]();
    uint64_t v22 = [v21 userInterfaceLevel];
    uint64_t v23 = *(void *)(a1 + 64);

    if (v22 != v23)
    {
      uint64_t v24 = *(void *)(a1 + 64);
      double v25 = v5[2](v5);
      [v25 setUserInterfaceLevel:v24];
    }
  }
  if (*(void *)(a1 + 72) != -1)
  {
    int v26 = v35[2]();
    uint64_t v27 = [v26 accessibilityContrast];
    uint64_t v28 = *(void *)(a1 + 72);

    if (v27 != v28)
    {
      uint64_t v29 = *(void *)(a1 + 72);
      long long v30 = v5[2](v5);
      [v30 setAccessibilityContrast:v29];
    }
  }
  if (!*(unsigned char *)(a1 + 80))
  {
    int v31 = -[UIView __tintColor](*(void **)(a1 + 32));
    if (v31)
    {
      int v32 = v35[2]();
      double v33 = [v32 _tintColor];

      if (v33 != v31)
      {
        long long v34 = v5[2](v5);
        [v34 _setTintColor:v31];
      }
    }
  }
}

+ (id)_windowWithContextId:(unsigned int)a3
{
  char v3 = [MEMORY[0x1E4F39B58] contextWithId:*(void *)&a3];
  BOOL v4 = _UIWindowFromRootLayer((id)[v3 layer]);

  return v4;
}

- (void)_registerSubtreeMonitor:(id)a3
{
  id v4 = a3;
  subtreeMonitors = self->_subtreeMonitors;
  id v8 = v4;
  if (!subtreeMonitors)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = self->_subtreeMonitors;
    self->_subtreeMonitors = v6;

    id v4 = v8;
    subtreeMonitors = self->_subtreeMonitors;
  }
  [(NSMutableSet *)subtreeMonitors addObject:v4];
}

- (void)_didBecomeApplicationKeyWindowWithOldApplicationKeyWindow:(void *)a1
{
  id v25 = a2;
  if (a1)
  {
    char v3 = [a1 firstResponder];

    if (v3)
    {
      id v4 = [a1 firstResponder];
      [v4 _windowBecameKey];
    }
    else
    {
      [a1 becomeFirstResponder];
      uint64_t v5 = [a1 windowScene];
      id v4 = [v5 keyboardSceneDelegate];

      if (dyld_program_sdk_at_least())
      {
        id v6 = [a1 firstResponder];
        if (v6)
        {
        }
        else
        {
          uint64_t v7 = [a1 screen];
          id v8 = [v25 windowScene];
          uint64_t v9 = [v8 screen];

          if (v7 == v9) {
            [v4 _reloadInputViewsForResponder:0];
          }
        }
      }
    }

    double v10 = [a1 windowScene];
    double v11 = [v10 _focusSystemSceneComponent];
    uint64_t v12 = [v11 focusSystem];
    [v12 setNeedsFocusUpdate];

    uint64_t v13 = [v25 _windowHostingScene];
    uint64_t v14 = [a1 _windowHostingScene];
    LODWORD(v12) = [v13 isEqual:v14];

    if (v12)
    {
      if ([a1 _windowOwnsInterfaceOrientation])
      {
        int v15 = [(id)UIApp isFrontBoard];
        if (v15)
        {
          uint64_t v16 = [v25 _overriddenInterfaceOrientation];
          uint64_t v17 = [a1 _overriddenInterfaceOrientation];
          uint64_t v18 = v17;
        }
        else
        {
          uint64_t v16 = [v25 interfaceOrientation];
          uint64_t v18 = [a1 _overriddenInterfaceOrientation];
          uint64_t v17 = [a1 interfaceOrientation];
        }
        if (v16 == v17)
        {
          if (v18) {
            int v24 = v15;
          }
          else {
            int v24 = 0;
          }
          if (v24 == 1) {
            [a1 _notifyRotatableViewOrientation:v18 duration:0.0];
          }
          goto LABEL_24;
        }
        uint64_t v22 = [a1 rootViewController];
        uint64_t v23 = [v22 interfaceOrientation];
      }
      else
      {
        uint64_t v19 = [a1 _windowInterfaceOrientation];
        double v20 = [a1 _windowHostingScene];
        uint64_t v21 = [v20 _interfaceOrientation];

        if (v19 == v21) {
          goto LABEL_24;
        }
        uint64_t v22 = [a1 _windowHostingScene];
        uint64_t v23 = [v22 _interfaceOrientation];
      }
      -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:]((id *)a1, v23, 1, 1, 0.0);
    }
  }
LABEL_24:
}

- (id)firstResponder
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  firstResponder = self->_firstResponder;
  if (isKindOfClass)
  {
    uint64_t v5 = [(UIResponder *)firstResponder textField];
  }
  else
  {
    uint64_t v5 = firstResponder;
  }
  return v5;
}

- (void)_setIsSettingFirstResponder:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&self->_windowFlags & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)_isSettingFirstResponder
{
  return (*((unsigned __int8 *)&self->_windowFlags + 3) >> 2) & 1;
}

- (BOOL)_suppressFirstResponderWhenUserInteractionDisabled
{
  return 0;
}

- (int64_t)_overriddenInterfaceOrientation
{
  uint64_t v3 = [(UIWindow *)self rootViewController];
  int64_t v4 = [v3 _overrideInterfaceOrientationMechanics];

  if (v4) {
    return v4;
  }
  return [(UIWindow *)self interfaceOrientation];
}

- (BOOL)becomeFirstResponder
{
  uint64_t v3 = [(UIWindow *)self rootViewController];
  char v4 = [v3 becomeFirstResponder];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIWindow;
  return [(UIView *)&v6 becomeFirstResponder];
}

- (BOOL)_supportsBecomeFirstResponderWhenPossible
{
  return 0;
}

- (void)_removeWindowLevelChangedObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    [(NSHashTable *)self->_windowLevelObservers removeObject:v4];
    NSUInteger v5 = [(NSHashTable *)self->_windowLevelObservers count];
    id v4 = v7;
    if (!v5)
    {
      windowLevelObservers = self->_windowLevelObservers;
      self->_windowLevelObservers = 0;

      id v4 = v7;
    }
  }
}

- (void)makeKeyAndVisible
{
  if ((dyld_program_sdk_at_least() & 1) != 0 || pthread_main_np() == 1)
  {
    [(UIWindow *)self _mainQueue_makeKeyAndVisible];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__UIWindow_makeKeyAndVisible__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)_mainQueue_makeKeyAndVisible
{
  if ([(UIView *)self isHidden]) {
    [(UIWindow *)self _orderFrontWithoutMakingKey];
  }
  else {
    [(UIWindow *)self _updateLayerOrderingAndSetLayerHidden:0];
  }
  uint64_t v3 = +[_UIKeyWindowEvaluator sharedEvaluator];
  -[_UIKeyWindowEvaluator applicationKeyWindow](v3);
  id v4 = (UIWindow *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
  {
    [(UIWindow *)self makeKeyWindow];
  }
}

- (void)_orderFrontWithoutMakingKey
{
}

- (void)makeKeyWindow
{
}

- (BOOL)autorotates
{
  return *((unsigned char *)&self->_windowFlags + 1) & 1;
}

- (BOOL)_isVisible
{
  return ![(UIView *)self isHidden];
}

- (CGPoint)convertPoint:(CGPoint)point toWindow:(UIWindow *)window
{
  double y = point.y;
  double x = point.x;
  if (window)
  {
    -[UIView convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:");
  }
  else
  {
    uint64_t v9 = [(UIView *)self layer];
    objc_msgSend(v9, "convertPoint:toLayer:", self->_transformLayer, x, y);
    double v11 = v10;
    double v13 = v12;

    double v7 = v11;
    double v8 = v13;
  }
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)point fromWindow:(UIWindow *)window
{
  double y = point.y;
  double x = point.x;
  if (window)
  {
    -[UIView convertPoint:fromCoordinateSpace:](self, "convertPoint:fromCoordinateSpace:");
  }
  else
  {
    uint64_t v9 = [(UIView *)self layer];
    objc_msgSend(v9, "convertPoint:fromLayer:", self->_transformLayer, x, y);
    double v11 = v10;
    double v13 = v12;

    double v7 = v11;
    double v8 = v13;
  }
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (BOOL)_shouldDelayTouchForSystemGestures:(id)a3
{
  id v4 = a3;
  BOOL v8 = (unint64_t)([v4 _edgeType] - 1) <= 3
    && (+[UIPeripheralHost sharedInstance],
        NSUInteger v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 _isCoordinatingWithSystemGestures],
        v5,
        (v6 & 1) == 0)
    && (unint64_t v7 = [(UIWindow *)self _edgesForSystemGesturesTouchDelay]) != 0
    && ([(UIWindow *)self _edgeForTouch:v4] & v7) != 0;

  return v8;
}

- (BOOL)isKeyWindow
{
  if (qword_1EB259DC0 != -1) {
    dispatch_once(&qword_1EB259DC0, &__block_literal_global_455);
  }
  if (_MergedGlobals_162)
  {
    uint64_t v3 = [(UIWindow *)self windowScene];
    -[UIWindowScene _keyWindow](v3);
    id v4 = (UIWindow *)objc_claimAutoreleasedReturnValue();
    BOOL v5 = v4 == self;

    return v5;
  }
  else
  {
    return [(UIWindow *)self _isApplicationKeyWindow];
  }
}

- (void)_makeKeyWindowIgnoringOldKeyWindow:(char)a3 transferringScenes:
{
  if (!a1) {
    return;
  }
  char v6 = (void *)a1[100];
  if (!v6
    || ([v6 session],
        unint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 role],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:@"UIWindowSceneSessionRoleCarPlay"],
        v8,
        v7,
        !v9))
  {
    int v11 = 0;
    if (a3) {
      goto LABEL_11;
    }
LABEL_10:
    if ([a1 _isApplicationKeyWindow]) {
      return;
    }
    goto LABEL_11;
  }
  int v10 = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow, @"AllowCarPlayScenesToCallMakeKeyWindow", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
  if (byte_1E8FD4EE4) {
    int v11 = v10;
  }
  else {
    int v11 = 1;
  }
  if ((a3 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_11:
  if ((([a1 canBecomeKeyWindow] ^ 1 | v11) & 1) == 0)
  {
    double v12 = [a1 windowScene];
    -[UIWindowScene _pushKeyWindow:ignoringOldKeyWindow:](v12, a1, a2);
  }
}

- (BOOL)_isApplicationKeyWindow
{
  uint64_t v3 = +[_UIKeyWindowEvaluator sharedEvaluator];
  -[_UIKeyWindowEvaluator applicationKeyWindow](v3);
  id v4 = (UIWindow *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v4 == self;

  return (char)self;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

+ (BOOL)_allWindowsKeepContextInBackground
{
  return __allWindowsKeepContextInBackground;
}

- (_UIContextBinder)_contextBinder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextBinder);
  return (_UIContextBinder *)WeakRetained;
}

- (CAContext)_boundContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);
  return (CAContext *)WeakRetained;
}

- (void)_setContextBinder:(id)a3
{
}

- (void)_setBoundContext:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UIWindow *)self _contextId];
  objc_storeWeak((id *)&self->_layerContext, v4);

  char v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v10 = v6;
  if (v4)
  {
    [v6 postNotificationName:_UIWindowDidAttachContextNotification object:self];
  }
  else
  {
    unint64_t v7 = _UIWindowDidDetachContextNotification;
    int v11 = @"contextId";
    BOOL v8 = [NSNumber numberWithUnsignedInt:v5];
    v12[0] = v8;
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v10 postNotificationName:v7 object:self userInfo:v9];
  }
}

- (id)_contextOptionsWithInitialOptions:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  [(UIWindow *)self _configureContextOptions:v4];
  return v4;
}

- (id)_bindingLayer
{
  rootLayer = self->_rootLayer;
  if (!rootLayer)
  {
    rootLayer = self->_sceneTransformLayer;
    if (!rootLayer) {
      rootLayer = self->_transformLayer;
    }
  }
  return rootLayer;
}

- (void)_createOtherSystemGateGestureRecognizersIfNeeded
{
  if (+[_UIHomeAffordanceGateGestureRecognizer isAvailable]()
    && !self->_systemGestureGateForHomeAffordance
    && ![(UIWindow *)self _isSystemGestureWindow])
  {
    uint64_t v3 = (_UIHomeAffordanceGateGestureRecognizer *)objc_opt_new();
    systemGestureGateForHomeAffordance = self->_systemGestureGateForHomeAffordance;
    self->_systemGestureGateForHomeAffordance = v3;

    [(UIView *)self addGestureRecognizer:self->_systemGestureGateForHomeAffordance];
  }
  if (_UIApplicationSupportsGlobalEdgeSwipeTouches() && !self->_systemGateForGESTouches)
  {
    uint64_t v5 = [[_UIGESGateGestureRecognizer alloc] initWithTarget:0 action:0];
    systemGateForGESTouches = self->_systemGateForGESTouches;
    self->_systemGateForGESTouches = v5;

    [(UIView *)self addGestureRecognizer:self->_systemGateForGESTouches];
    unint64_t v7 = (void *)UIApp;
    [v7 _setApplicationWantsGESEvents:1];
  }
}

- (BOOL)isTrackingKeyboard
{
  if (self->_primaryKeyboardTrackingGuide)
  {
    currentKeyboardTrackingLayoutGuides = self->_currentKeyboardTrackingLayoutGuides;
    if (currentKeyboardTrackingLayoutGuides) {
      LOBYTE(currentKeyboardTrackingLayoutGuides) = [(NSMutableArray *)currentKeyboardTrackingLayoutGuides count] != 0;
    }
  }
  else
  {
    LOBYTE(currentKeyboardTrackingLayoutGuides) = 0;
  }
  return (char)currentKeyboardTrackingLayoutGuides;
}

uint64_t __59__UIWindow__rotateToBounds_withAnimator_transitionContext___block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 576) &= ~0x400uLL;
  return result;
}

- (void)endDisablingInterfaceAutorotationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(UIWindow *)self _windowCanDynamicallySpecifySupportedInterfaceOrientations])
  {
    $B5B0456088C508EDB812873BE14D7A88 windowFlags = self->_windowFlags;
    if ((*(_WORD *)&windowFlags & 0xF000) != 0)
    {
      self->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&windowFlags & 0xFFFFFFFFFFFF0FFFLL | ((((unint64_t)(*(_DWORD *)&windowFlags + 61440) >> 12) & 0xF) << 12));
    }
    else
    {
      char v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("AutoRotation", endDisablingInterfaceAutorotationAnimated____s_category)+ 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v7 = v6;
        BOOL v8 = (objc_class *)objc_opt_class();
        int v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = "-[UIWindow endDisablingInterfaceAutorotationAnimated:]";
        __int16 v20 = 2112;
        uint64_t v21 = v9;
        __int16 v22 = 2048;
        uint64_t v23 = self;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "%s called on <%@: %p> without matching -beginDisablingInterfaceAutorotation. Ignoring.", buf, 0x20u);
      }
    }
    if (![(UIWindow *)self isInterfaceAutorotationDisabled])
    {
      id v10 = [(UIWindow *)self windowScene];
      int v11 = [v10 _canDynamicallySpecifySupportedInterfaceOrientations];

      if (v11)
      {
        [(UIWindow *)self _updateOrientationPreferencesAnimated:v3];
      }
      else if (*((unsigned char *)&self->_windowFlags + 2))
      {
        id v12 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        double v13 = [NSNumber numberWithBool:v3];
        uint64_t v14 = objc_msgSend(v12, "initWithObjectsAndKeys:", v13, @"UIDeviceOrientationRotateAnimatedUserInfoKey", 0);

        int v15 = (void *)MEMORY[0x1E4F28EA0];
        uint64_t v16 = +[UIDevice currentDevice];
        uint64_t v17 = [v15 notificationWithName:@"UIDeviceOrientationDidChangeNotification" object:v16 userInfo:v14];

        [(UIWindow *)self performSelector:sel__handleDeviceOrientationChange_ withObject:v17 afterDelay:0.0];
      }
      *(void *)&self->_windowFlags &= ~0x10000uLL;
    }
  }
}

- (BOOL)_isRemoteKeyboardWindow
{
  return 0;
}

- (id)_touchData
{
  id touchData = self->_touchData;
  if (!touchData)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = self->_touchData;
    self->_id touchData = v4;

    id touchData = self->_touchData;
  }
  return touchData;
}

- (void)_noteOverlayInsetsDidChange
{
  if ([(UIWindow *)self allowsWeakReference]) {
    BOOL v3 = self;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;
  id v5 = v4;
  if (v4 && !v4->_notedOverlayInsetChange)
  {
    v4->_notedOverlayInsetChange = 1;
    objc_initWeak(&location, v4);
    char v6 = (void *)UIApp;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__UIWindow__noteOverlayInsetsDidChange__block_invoke;
    v7[3] = &unk_1E52DC308;
    objc_copyWeak(&v8, &location);
    [v6 _performBlockAfterCATransactionCommits:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

+ (id)_applicationKeyWindow
{
  int v2 = +[_UIKeyWindowEvaluator sharedEvaluator];
  BOOL v3 = -[_UIKeyWindowEvaluator applicationKeyWindow](v2);

  return v3;
}

void __78__UIWindow__rotateWindowToOrientation_updateStatusBar_duration_skipCallbacks___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 496) = *(void *)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__UIWindow__rotateWindowToOrientation_updateStatusBar_duration_skipCallbacks___block_invoke_2;
  v11[3] = &unk_1E52E4728;
  long long v12 = *(_OWORD *)(a1 + 32);
  int v2 = _Block_copy(v11);
  BOOL v3 = v2;
  if (*(unsigned char *)(a1 + 64) && *(void *)(*(void *)(a1 + 32) + 864) != *(void *)(a1 + 48))
  {
    id v4 = [[UIStatusBarOrientationAnimationParameters alloc] initWithDefaultParameters];
    [(UIStatusBarOrientationAnimationParameters *)v4 setOrientationAnimation:2];
    [(UIStatusBarAnimationParameters *)v4 setDuration:*(double *)(a1 + 56)];
    id v5 = (void *)UIApp;
    uint64_t v6 = *(void *)(a1 + 48);
    unint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = v7[108];
    int v9 = [v7 windowScene];
    [v5 setStatusBarOrientation:v6 fromOrientation:v8 windowScene:v9 animationParameters:v4 updateBlock:v3];
  }
  else
  {
    (*((void (**)(void *))v2 + 2))(v2);
  }
  *(void *)(*(void *)(a1 + 32) + 576) = *(void *)(*(void *)(a1 + 32) + 576) & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)*(unsigned __int8 *)(a1 + 65) << 30);
  if (*(unsigned char *)(a1 + 65)) {
    [*(id *)(a1 + 32) _resizeWindowFrameToSceneBoundsIfNecessary];
  }
  if (*(unsigned char *)(a1 + 66))
  {
    id v10 = [*(id *)(a1 + 32) rootViewController];
    [v10 window:*(void *)(a1 + 32) setupWithInterfaceOrientation:*(void *)(a1 + 48)];
  }
}

uint64_t __78__UIWindow__rotateWindowToOrientation_updateStatusBar_duration_skipCallbacks___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateTransformLayer];
  int v2 = *(void **)(a1 + 32);
  BOOL v3 = *(double **)(*(void *)(a1 + 40) + 8);
  double v4 = v3[4];
  double v5 = v3[5];
  double v6 = v3[6];
  double v7 = v3[7];
  return objc_msgSend(v2, "setFrame:", v4, v5, v6, v7);
}

- (void)_sceneBoundsDidChange
{
  if ([(id)objc_opt_class() _transformLayerRotationsAreEnabled])
  {
    [(UIWindow *)self _setNeedsBoundingPathUpdate];
    [(UIWindow *)self _updateTransformLayer];
    if (![(UIWindow *)self _resizeWindowFrameToSceneBoundsIfNecessary]) {
      [(UIWindow *)self _updateIsSceneSizedFlag];
    }
    BOOL v3 = -[UIWindow _fbsScene]((id *)&self->super.super.super.isa);
    uint64_t v18 = 0;
    long long v5 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v4 = 64;
    uint64_t v19 = v3;
    uint64_t v20 = 0;
    -[UIView _notifyGeometryObserversWithChangeInfo:]((uint64_t)self, &v4);
    [(UIWindow *)self _cleanupOrientationTransactionIfNecessary];
    [(UIWindow *)self _retryHandleStatusBarChangeIfNecessary];
  }
}

- (void)_updateTransformLayer
{
  uint64_t v3 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _screen];
  rootLayer = self->_rootLayer;
  id v19 = (id)v3;
  if (rootLayer)
  {
    if (v3)
    {
      [(CALayer *)rootLayer rasterizationScale];
      double v6 = v5;
      [v19 scale];
      if (v6 != v7)
      {
        long long v8 = self->_rootLayer;
        [v19 scale];
        -[CALayer setRasterizationScale:](v8, "setRasterizationScale:");
      }
    }
  }
  else
  {
    long long v9 = objc_alloc_init(UIWindowLayer);
    long long v10 = self->_rootLayer;
    self->_rootLayer = &v9->super;

    long long v11 = +[_UIWindowTransformLayer layer];
    sceneTransformLayer = self->_sceneTransformLayer;
    self->_sceneTransformLayer = v11;

    long long v13 = +[_UIWindowTransformLayer layer];
    transformLayer = self->_transformLayer;
    self->_transformLayer = v13;

    self->_rootLayer[1].super.isa = (Class)self;
    self->_sceneTransformLayer[1].super.isa = (Class)self;
    self->_transformLayer[1].super.isa = (Class)self;
    if (v19)
    {
      long long v15 = self->_rootLayer;
      [v19 scale];
      -[CALayer setRasterizationScale:](v15, "setRasterizationScale:");
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);
    [WeakRetained setLayer:self->_rootLayer];

    [(CALayer *)self->_rootLayer addSublayer:self->_sceneTransformLayer];
    [(CALayer *)self->_sceneTransformLayer addSublayer:self->_transformLayer];
    long long v17 = self->_transformLayer;
    uint64_t v18 = [(UIView *)self layer];
    [(CALayer *)v17 addSublayer:v18];
  }
  [(UIWindow *)self _configureRootLayer:self->_rootLayer sceneTransformLayer:self->_sceneTransformLayer transformLayer:self->_transformLayer];
}

- (void)addRootViewControllerViewIfPossible
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  [(UIWindow *)self _resizeWindowToFullScreenIfNecessary];
  if ([(UIWindow *)self _shouldInstallRootPresentationController])
  {
    uint64_t v3 = [(UIWindow *)self _rootPresentationController];
    char v4 = [v3 presented];

    if ((v4 & 1) == 0)
    {
      double v5 = [(UIWindow *)self rootViewController];
      double v6 = [v5 view];
      double v7 = [v6 superview];

      if (v7)
      {
        long long v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Window", &qword_1EB259DF0) + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Manually adding the rootViewController's view to the view hierarchy is no longer supported. Please allow UIWindow to add the rootViewController's view to the view hierarchy itself.", buf, 2u);
        }
      }
      long long v9 = [(UIWindow *)self windowScene];
      [v9 _installLocalSheetPresentationControllerForWindow:self];

      long long v10 = [[UIViewControllerBuiltinTransitionViewAnimator alloc] initWithTransition:0];
      long long v11 = [(UIWindow *)self _rootPresentationController];
      [v11 _presentWithAnimationController:v10 inWindow:self interactionController:0 animated:0 handoffData:0];

      if (-[UIViewController _tryBecomeRootViewControllerInWindow:]((uint64_t)self->_rootViewController, self))[(UIViewController *)self->_rootViewController setNeedsFocusUpdate]; {
    }
      }
LABEL_30:
    [(UIWindow *)self _resizeWindowFrameToSceneBoundsIfNecessary];
    rootViewController = self->_rootViewController;
    if (rootViewController) {
      -[UIViewController _invalidatePreferences:excluding:](rootViewController, -1, 128);
    }
    int v31 = [(UIWindow *)self windowScene];
    unint64_t v32 = [v31 interfaceOrientation];

    if (v32)
    {
      double v33 = [(UIWindow *)self windowScene];
      if ([v33 _canDynamicallySpecifySupportedInterfaceOrientations])
      {
        BOOL v34 = self->_rootViewController == 0;

        if (!v34)
        {
          long long v35 = [(UIViewController *)self->_rootViewController _viewControllerForSupportedInterfaceOrientations];
          [v35 _ignoreAppSupportedOrientations];
          unint64_t v36 = [(UIWindow *)self _supportedInterfaceOrientationsConsultingApp:1];
          if (v32 > 4 || (unint64_t v37 = v36, (v36 & qword_186B9BC08[v32 - 1]) != 0))
          {
            [(UIWindow *)self _updateOrientationPreferencesAnimated:0];
          }
          else
          {
            unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Orientation", &qword_1EB259DF8);
            if (*(unsigned char *)CategoryCachedImpl)
            {
              CGRect v62 = *(id *)(CategoryCachedImpl + 8);
              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
              {
                v63 = NSString;
                v64 = self;
                v65 = (objc_class *)objc_opt_class();
                v66 = NSStringFromClass(v65);
                v67 = [v63 stringWithFormat:@"<%@: %p>", v66, v64];

                id v78 = v67;
                v68 = self->_rootViewController;
                if (v68)
                {
                  v69 = NSString;
                  v70 = v68;
                  v71 = (objc_class *)objc_opt_class();
                  v72 = NSStringFromClass(v71);
                  v73 = [v69 stringWithFormat:@"<%@: %p>", v72, v70];
                }
                else
                {
                  v73 = @"(nil)";
                }
                v74 = v73;
                BSInterfaceOrientationDescription();
                v75 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
                v76 = BSInterfaceOrientationMaskDescription();
                *(_DWORD *)buf = 138413058;
                *(void *)&uint8_t buf[4] = v78;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v73;
                *(_WORD *)&buf[22] = 2112;
                v81 = v75;
                LOWORD(v82) = 2112;
                *(void *)((char *)&v82 + 2) = v76;
                _os_log_impl(&dword_1853B0000, v62, OS_LOG_TYPE_ERROR, "%@: Adding root vc %@ that does not support the scene's current orientation (%@). Root vc supported orientations: %@. We will force a transaction", buf, 0x2Au);
              }
            }
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&uint8_t buf[16] = 0x3032000000;
            v81 = __Block_byref_object_copy__166;
            *(void *)&long long v82 = __Block_byref_object_dispose__166;
            *((void *)&v82 + 1) = 0;
            uint64_t v39 = NSString;
            uint64_t v40 = self->_rootViewController;
            if (v40)
            {
              double v41 = NSString;
              uint64_t v42 = (objc_class *)objc_opt_class();
              double v43 = NSStringFromClass(v42);
              double v44 = [v41 stringWithFormat:@"<%@: %p>", v43, v40];
            }
            else
            {
              double v44 = @"(nil)";
            }

            double v45 = [v39 stringWithFormat:@"Root View Controller Setup: %@", v44];

            uint64_t v46 = [(UIWindow *)self _createForcedOrientationTransactionTokenWithSupportedOrientations:v37 preferredOrientation:0 forImmediateCommit:1 reason:v45];
            double v47 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v46;

            double v48 = *(void **)(*(void *)&buf[8] + 40);
            v79[0] = MEMORY[0x1E4F143A8];
            v79[1] = 3221225472;
            v79[2] = __47__UIWindow_addRootViewControllerViewIfPossible__block_invoke;
            v79[3] = &unk_1E52D9900;
            v79[4] = buf;
            [v48 commitAnimated:0 completionBlock:v79];

            _Block_object_dispose(buf, 8);
          }
        }
      }
      else
      {
      }
    }
    return;
  }
  long long v12 = [(UIViewController *)self->_rootViewController view];
  if (!v12
    || ([(UIViewController *)self->_rootViewController view],
        long long v13 = objc_claimAutoreleasedReturnValue(),
        [v13 superview],
        long long v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v12,
        v14))
  {
LABEL_27:
    uint64_t v28 = [(UIViewController *)self->_rootViewController view];
    uint64_t v29 = [v28 superview];

    if (v29 == self
      && -[UIViewController _tryBecomeRootViewControllerInWindow:]((uint64_t)self->_rootViewController, self))
    {
      [(UIViewController *)self->_rootViewController setNeedsFocusUpdate];
    }
    goto LABEL_30;
  }
  id v77 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _FBSScene];
  if ([(id)UIApp isFrontBoard]) {
    goto LABEL_16;
  }
  long long v15 = [(UIWindow *)self screen];
  if (![v15 _isMainScreen]) {
    goto LABEL_15;
  }
  id v16 = [(id)UIApp _mainScene];
  if (v77 != v16)
  {

LABEL_15:
LABEL_16:
    [(UIView *)self bounds];
    goto LABEL_17;
  }
  [(UIWindow *)self _sceneBounds];
  CGFloat v50 = v49;
  CGFloat v52 = v51;
  CGFloat v54 = v53;
  CGFloat v56 = v55;
  [(UIView *)self frame];
  v86.origin.double x = v57;
  v86.origin.double y = v58;
  v86.size.double width = v59;
  v86.size.double height = v60;
  v85.origin.double x = v50;
  v85.origin.double y = v52;
  v85.size.double width = v54;
  v85.size.double height = v56;
  BOOL v61 = CGRectEqualToRect(v85, v86);

  if (!v61) {
    goto LABEL_16;
  }
  [(UIViewController *)self->_rootViewController _defaultInitialViewFrame];
LABEL_17:
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  double v24 = v20;
  id v25 = [(UIViewController *)self->_rootViewController view];
  objc_msgSend(v25, "setFrame:", v21, v22, v23, v24);

  if ((-[UIViewController _isPresentingInWindow:](self->_rootViewController, self) & 1) == 0)
  {
    int v26 = [(UIViewController *)self->_rootViewController view];
    [(UIView *)self addSubview:v26];
    if ([v26 translatesAutoresizingMaskIntoConstraints])
    {
      if (!+[UIWindow _transformLayerRotationsAreEnabled])
      {
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v27 = [(UIViewController *)self->_rootViewController view];
      [v27 setAutoresizingMask:18];
    }
    else
    {
      uint64_t v27 = [(UIWindow *)self _rootViewConstraintsUpdateIfNecessaryForView:v26];
      [(UIView *)self addConstraints:v27];
    }

    goto LABEL_26;
  }
}

- (BOOL)_resizeWindowFrameToSceneBoundsIfNecessary
{
  int v3 = [(id)objc_opt_class() _transformLayerRotationsAreEnabled];
  if (v3)
  {
    int v3 = [(UIWindow *)self _shouldResizeWithScene];
    if (v3)
    {
      if ((*((unsigned char *)&self->_windowFlags + 3) & 0x40) == 0) {
        goto LABEL_6;
      }
      if ([(UIWindow *)self _isHostedInAnotherProcess]) {
        goto LABEL_6;
      }
      [(UIWindow *)self _sceneBoundsInWindowOrientation];
      double v5 = v4;
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      [(UIView *)self frame];
      v18.origin.double x = v12;
      v18.origin.double y = v13;
      v18.size.double width = v14;
      v18.size.double height = v15;
      v17.origin.double x = v5;
      v17.origin.double y = v7;
      v17.size.double width = v9;
      v17.size.double height = v11;
      if (CGRectEqualToRect(v17, v18))
      {
LABEL_6:
        LOBYTE(v3) = 0;
      }
      else
      {
        -[UIWindow _adjustSizeClassesAndResizeWindowToFrame:](self, "_adjustSizeClassesAndResizeWindowToFrame:", v5, v7, v9, v11);
        LOBYTE(v3) = 1;
      }
    }
  }
  return v3;
}

- (void)_updateIsSceneSizedFlag
{
  [(UIView *)self frame];
  double v4 = v3;
  double v6 = v5;
  [(UIWindow *)self _sceneBoundsInWindowOrientation];
  BOOL v9 = v8 == v6 && v7 == v4;
  uint64_t v10 = 0x40000000;
  if (!v9) {
    uint64_t v10 = 0;
  }
  self->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(v10 | *(void *)&self->_windowFlags & 0xFFFFFFFFBFFFFFFFLL);
}

- (void)_configureRootLayer:(id)a3 sceneTransformLayer:(id)a4 transformLayer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _FBSScene];
  CGFloat v12 = [v11 settings];
  uint64_t v13 = [v12 interfaceOrientation];

  int64_t v14 = [(UIWindow *)self _orientationForRootTransform];
  self->_previousSceneOrientationForCounterRotation = 0;
  if ((unint64_t)(v13 - 1) >= 4) {
    int64_t v15 = 1;
  }
  else {
    int64_t v15 = v13;
  }
  self->_sceneOrientation = v15;
  id v16 = [v11 clientSettings];
  if ([v16 isUISubclass])
  {
    CGRect v17 = [(UIWindow *)self windowScene];
    char v18 = [v17 _windowsIgnoreSceneClientOrientation];

    if (v18)
    {
      uint64_t v19 = 1;
      goto LABEL_10;
    }
    id v16 = [v11 uiClientSettings];
    uint64_t v19 = [v16 interfaceOrientation];
  }
  else
  {
    uint64_t v19 = 1;
  }

LABEL_10:
  if ((unint64_t)(v19 - 1) >= 4) {
    int64_t v20 = 1;
  }
  else {
    int64_t v20 = v19;
  }
  self->_sceneClientOrientation = v20;
  if (![(UIWindow *)self _windowOwnsInterfaceOrientationTransform]
    || ![(UIWindow *)self _windowOwnsInterfaceOrientation])
  {
    [(UIWindow *)self _sceneBounds];
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    double v29 = v35 + v39 * 0.5;
    double v30 = v37 + v41 * 0.5;
    long long v63 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v70.a = *MEMORY[0x1E4F1DAB8];
    long long v65 = *(_OWORD *)&v70.a;
    *(_OWORD *)&v70.c = v63;
    *(_OWORD *)&v70.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v61 = *(_OWORD *)&v70.tx;
    [v8 setAffineTransform:&v70];
    objc_msgSend(v8, "setBounds:", v36, v38, v40, v42);
    objc_msgSend(v8, "setPosition:", v29, v30);
    *(_OWORD *)&v70.a = v65;
    *(_OWORD *)&v70.c = v63;
    *(_OWORD *)&v70.tdouble x = v61;
    [v9 setAffineTransform:&v70];
    objc_msgSend(v9, "setBounds:", v36, v38, v40, v42);
    objc_msgSend(v9, "setPosition:", v29, v30);
    uint64_t v43 = [(UIWindow *)self _orientationForRootTransform];
    int64_t v44 = [(UIWindow *)self _orientationForViewTransform];
    if (v44
      && v43
      && (uint64_t v45 = v44,
          [(UIWindow *)self _windowOwnsInterfaceOrientationTransform]))
    {
      self->_previousSceneOrientationForCounterRotation = v14;
      double v46 = 0.0;
      double v47 = 0.0;
      if (v45 != 1)
      {
        if (v45 == 3)
        {
          double v47 = 1.57079633;
        }
        else if (v45 == 4)
        {
          double v47 = -1.57079633;
        }
        else
        {
          double v47 = 3.14159265;
          if (v45 != 2) {
            double v47 = 0.0;
          }
        }
      }
      if (v43 != 1)
      {
        if (v43 == 3)
        {
          double v46 = 1.57079633;
        }
        else if (v43 == 4)
        {
          double v46 = -1.57079633;
        }
        else
        {
          double v46 = 3.14159265;
          if (v43 != 2) {
            double v46 = 0.0;
          }
        }
      }
      CGAffineTransformMakeRotation(&v67, v47 - v46);
      *(float64x2_t *)&v67.a = vrndaq_f64(*(float64x2_t *)&v67.a);
      *(float64x2_t *)&v67.c = vrndaq_f64(*(float64x2_t *)&v67.c);
      *(float64x2_t *)&v67.tdouble x = vrndaq_f64(*(float64x2_t *)&v67.tx);
      CGAffineTransform v70 = v67;
      [v10 setAffineTransform:&v70];
      double v49 = _UIConvertRectFromOrientationToOrientation(v43, v45, v36, v38, v40, v42, v40, v42);
      double v48 = v10;
    }
    else
    {
      *(_OWORD *)&v70.a = v65;
      *(_OWORD *)&v70.c = v63;
      *(_OWORD *)&v70.tdouble x = v61;
      [v10 setAffineTransform:&v70];
      double v48 = v10;
      double v49 = v36;
      double v50 = v38;
      double v51 = v40;
      double v52 = v42;
    }
    objc_msgSend(v48, "setBounds:", v49, v50, v51, v52);
    goto LABEL_59;
  }
  [(UIWindow *)self _sceneReferenceBounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v29 = v21 + v25 * 0.5;
  double v30 = v23 + v27 * 0.5;
  uint64_t v31 = [(UIWindow *)self _orientationForViewTransform];
  int64_t v32 = [(UIWindow *)self _orientationForRootTransform];
  uint64_t v33 = [(UIWindow *)self _orientationForSceneTransform];
  switch(v32)
  {
    case 1:
      double v34 = 0.0;
      break;
    case 3:
      double v34 = 1.57079633;
      break;
    case 4:
      double v34 = -1.57079633;
      break;
    default:
      double v34 = 3.14159265;
      if (v32 != 2) {
        double v34 = 0.0;
      }
      break;
  }
  CGAffineTransformMakeRotation(&v71, -v34);
  *(float64x2_t *)&v71.a = vrndaq_f64(*(float64x2_t *)&v71.a);
  *(float64x2_t *)&v71.c = vrndaq_f64(*(float64x2_t *)&v71.c);
  *(float64x2_t *)&v71.tdouble x = vrndaq_f64(*(float64x2_t *)&v71.tx);
  CGAffineTransform v70 = v71;
  [v8 setAffineTransform:&v70];
  objc_msgSend(v8, "setBounds:", v22, v24, v26, v28);
  double v53 = v28 - v30;
  if (v32 == 4) {
    double v54 = v28 - v30;
  }
  else {
    double v54 = v29;
  }
  if (v32 == 4) {
    double v55 = v29;
  }
  else {
    double v55 = v30;
  }
  if (v32 == 3)
  {
    double v54 = v30;
    double v55 = v26 - v29;
  }
  if (v32 == 2)
  {
    double v54 = v26 - v29;
    double v55 = v28 - v30;
  }
  objc_msgSend(v8, "setPosition:", v54, v55);
  if (![(id)objc_opt_class() _transformLayerRotationsAreEnabled])
  {
    long long v66 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v70.a = *MEMORY[0x1E4F1DAB8];
    long long v64 = *(_OWORD *)&v70.a;
    *(_OWORD *)&v70.c = v66;
    *(_OWORD *)&v70.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v62 = *(_OWORD *)&v70.tx;
    [v9 setAffineTransform:&v70];
    objc_msgSend(v9, "setBounds:", v22, v24, v26, v28);
    *(_OWORD *)&v70.a = v64;
    *(_OWORD *)&v70.c = v66;
    *(_OWORD *)&v70.tdouble x = v62;
    [v10 setAffineTransform:&v70];
    objc_msgSend(v10, "setBounds:", v22, v24, v26, v28);
    [(UIWindow *)self _sceneReferenceBounds];
    -[UIWindow setFrame:](self, "setFrame:");
    objc_msgSend(v9, "setPosition:", v29, v30);
LABEL_59:
    CGFloat v58 = v10;
    double v59 = v29;
    double v60 = v30;
    goto LABEL_60;
  }
  memset(&v70, 0, sizeof(v70));
  [(UIWindow *)self _viewTransformForInterfaceOrientation:v33];
  CGAffineTransform v69 = v70;
  [v9 setAffineTransform:&v69];
  objc_msgSend(v9, "setBounds:", _UIWindowConvertRectFromOrientationToOrientation(1, v33, v22, v24, v26, v28, v26, v28));
  double v56 = 0.0;
  double v57 = 0.0;
  if (v31 != 1)
  {
    if (v31 == 3)
    {
      double v57 = 1.57079633;
    }
    else if (v31 == 4)
    {
      double v57 = -1.57079633;
    }
    else
    {
      double v57 = 3.14159265;
      if (v31 != 2) {
        double v57 = 0.0;
      }
    }
  }
  if (v33 != 1)
  {
    if (v33 == 3)
    {
      double v56 = 1.57079633;
    }
    else if (v33 == 4)
    {
      double v56 = -1.57079633;
    }
    else
    {
      double v56 = 3.14159265;
      if (v33 != 2) {
        double v56 = 0.0;
      }
    }
  }
  CGAffineTransformMakeRotation(&v68, v57 - v56);
  *(float64x2_t *)&v68.a = vrndaq_f64(*(float64x2_t *)&v68.a);
  *(float64x2_t *)&v68.c = vrndaq_f64(*(float64x2_t *)&v68.c);
  *(float64x2_t *)&v68.tdouble x = vrndaq_f64(*(float64x2_t *)&v68.tx);
  CGAffineTransform v69 = v68;
  [v10 setAffineTransform:&v69];
  objc_msgSend(v10, "setBounds:", _UIWindowConvertRectFromOrientationToOrientation(1, v31, v22, v24, v26, v28, v26, v28));
  objc_msgSend(v9, "setPosition:", v29, v30);
  if (v33 == 2)
  {
    double v53 = v26 - v29;
    double v29 = v28 - v30;
  }
  else if (v33 == 3)
  {
    double v53 = v30;
    double v29 = v26 - v29;
  }
  else if (v33 != 4)
  {
    double v53 = v29;
    double v29 = v30;
  }
  CGFloat v58 = v10;
  double v59 = v53;
  double v60 = v29;
LABEL_60:
  objc_msgSend(v58, "setPosition:", v59, v60);
}

- (CGRect)_sceneBoundsInWindowOrientation
{
  [(UIWindow *)self _sceneBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(UIWindow *)self _orientationForRootTransform];
  int64_t v12 = [(UIWindow *)self _orientationForViewTransform];
  if (v11)
  {
    uint64_t v13 = v12;
    if (v12)
    {
      if (![(UIWindow *)self _windowOwnsInterfaceOrientation]
        && [(UIWindow *)self _windowOwnsInterfaceOrientationTransform])
      {
        double v4 = _UIConvertRectFromOrientationToOrientation(v11, v13, v4, v6, v8, v10, v8, v10);
        double v6 = v14;
        double v8 = v15;
        double v10 = v16;
      }
    }
  }
  double v17 = v4;
  double v18 = v6;
  double v19 = v8;
  double v20 = v10;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (int64_t)_orientationForRootTransform
{
  return self->_sceneOrientation;
}

- (BOOL)_shouldResizeWithScene
{
  return 1;
}

- (UIViewController)_delegateViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
  return (UIViewController *)WeakRetained;
}

- (void)_resizeWindowToFullScreenIfNecessary
{
  if ([(UIWindow *)self resizesToFullScreen])
  {
    $B5B0456088C508EDB812873BE14D7A88 windowFlags = self->_windowFlags;
    if ((*(_DWORD *)&windowFlags & 0x8000000) == 0)
    {
      self->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(unint64_t *)&windowFlags | 0x8000000);
      [(UIWindow *)self _sceneBounds];
      -[UIWindow setFrame:](self, "setFrame:");
    }
  }
}

- (BOOL)resizesToFullScreen
{
  return *((unsigned __int8 *)&self->_windowFlags + 2) >> 7;
}

- (BOOL)_shouldInstallRootPresentationController
{
  int v3 = dyld_program_sdk_at_least();
  if (v3)
  {
    if (([(id)UIApp _isSpringBoard] & 1) != 0
      || [(UIWindow *)self _preventsRootPresentationController])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_InstallsRootPresentation, @"InstallsRootPresentation", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      if (byte_1EB257844) {
        LOBYTE(v3) = 1;
      }
    }
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double v30 = a3.size.height;
  double v4 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(UIView *)self layer];
  double v9 = [(UIView *)self layer];
  double v10 = [v9 superlayer];
  objc_msgSend(v8, "convertRect:fromLayer:", v10, x, y, v4, height);
  double v12 = v11;
  double v14 = v13;

  int64_t v15 = [(UIWindow *)self interfaceOrientation];
  double v16 = [(UIWindow *)self screen];
  -[UIWindow _willChangeToSize:orientation:screen:withTransitionCoordinator:](self, "_willChangeToSize:orientation:screen:withTransitionCoordinator:", v15, v16, 0, v12, v14);

  [(UIView *)self bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  [(UIView *)self center];
  double v26 = v25;
  double v28 = v27;
  v31.receiver = self;
  v31.super_class = (Class)UIWindow;
  -[UIView setFrame:](&v31, sel_setFrame_, x, y, width, v30);
  [(UIWindow *)self _updateIsSceneSizedFlag];
  -[UIWindow _autolayout_windowDidChangeBoundsFrom:](self, "_autolayout_windowDidChangeBoundsFrom:", v18, v20, v22, v24);
  -[UIWindow _autolayout_windowDidChangeCenterFrom:](self, "_autolayout_windowDidChangeCenterFrom:", v26, v28);
  [(UIWindow *)self _updateWindowTraitsAndNotify:1];
}

- (void)_autolayout_windowDidChangeCenterFrom:(CGPoint)a3
{
  if ((*(void *)&self->super._viewFlags & 0x400000000000000) != 0)
  {
    double y = a3.y;
    double x = a3.x;
    [(UIView *)self center];
    if (v7 != x || v6 != y)
    {
      [(UIWindow *)self _windowInternalConstraints_centerDidChange];
    }
  }
}

- (void)_autolayout_windowDidChangeBoundsFrom:(CGRect)a3
{
  if ((*(void *)&self->super._viewFlags & 0x400000000000000) != 0)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    [(UIView *)self bounds];
    if (v7 != width || v6 != height)
    {
      [(UIWindow *)self _windowInternalConstraints_sizeDidChange];
    }
  }
}

- (void)_retryHandleStatusBarChangeIfNecessary
{
  int v3 = __UIStatusBarManagerForWindow(self);
  [v3 statusBarHeight];
  double v5 = v4;

  if (v5 != self->_lastPropagatedStatusBarHeight)
  {
    -[UIWindow handleStatusBarChangeFromHeight:toHeight:](self, "handleStatusBarChangeFromHeight:toHeight:");
  }
}

- (void)_cleanupOrientationTransactionIfNecessary
{
  if ((*((unsigned char *)&self->_windowFlags + 4) & 0x80) != 0)
  {
    int v3 = [(UIWindow *)self _orientationTransactionToken];
    uint64_t v4 = [v3 state];

    if (v4 == 2)
    {
      *(void *)&self->_windowFlags &= ~0x8000000000uLL;
      double v5 = [(UIWindow *)self _orientationTransactionToken];
      [v5 didCommitOrientation];

      [(UIWindow *)self _setOrientationTransactionToken:0];
      *(void *)&self->_windowFlags |= 0x400000000uLL;
      double v6 = [(UIWindow *)self windowScene];
      double v7 = [v6 statusBarManager];
      [v7 updateStatusBarAppearance];

      *(void *)&self->_windowFlags &= ~0x400000000uLL;
      int64_t viewOrientation = self->_viewOrientation;
      [(UIWindow *)self _notifyRotatableViewOrientation:viewOrientation duration:0.0];
    }
  }
}

- (int64_t)_preferredInterfaceOrientationForRootViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained _viewControllerForSupportedInterfaceOrientations];
    double v5 = [v4 presentedViewController];
    int v6 = [v5 isBeingDismissed];

    if (v6)
    {
      double v7 = [v4 presentedViewController];
      uint64_t v8 = [v7 modalPresentationStyle];

      if (v8) {
        goto LABEL_11;
      }
    }
    else
    {
      if (([v4 isBeingPresented] & 1) == 0)
      {
        double v9 = [v4 presentingViewController];

        if (!v9)
        {

          goto LABEL_12;
        }
      }
      uint64_t v10 = [v4 modalPresentationStyle];

      if (v10) {
        goto LABEL_11;
      }
    }
    if ([v4 _hasPreferredInterfaceOrientationForPresentation])
    {
      double v9 = (void *)[v4 preferredInterfaceOrientationForPresentation];
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    double v9 = 0;
    goto LABEL_12;
  }
  double v9 = 0;
LABEL_13:

  return (int64_t)v9;
}

- (unint64_t)_supportedInterfaceOrientationsConsultingApp:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
  int v6 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_16;
  }
  double v7 = [WeakRetained _viewControllerForSupportedInterfaceOrientations];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __57__UIWindow__supportedInterfaceOrientationsConsultingApp___block_invoke;
  v20[3] = &unk_1E53036F8;
  BOOL v23 = v3;
  id v21 = v7;
  double v22 = self;
  id v8 = v7;
  unint64_t OrientationMask = _UISafelyGetOrientationMask(v20);

  if (!OrientationMask)
  {
LABEL_16:
    unint64_t OrientationMask = v3 ? -[UIApplication _defaultSupportedInterfaceOrientations](UIApp) : 30;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Orientation", _supportedInterfaceOrientationsConsultingApp____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      double v12 = *(id *)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        if (self)
        {
          double v13 = NSString;
          double v14 = self;
          int64_t v15 = (objc_class *)objc_opt_class();
          double v16 = NSStringFromClass(v15);
          double v17 = [v13 stringWithFormat:@"<%@: %p>", v16, v14];
        }
        else
        {
          double v17 = @"(nil)";
        }
        double v18 = v17;
        double v19 = BSInterfaceOrientationMaskDescription();
        *(_DWORD *)buf = 138412546;
        double v25 = v17;
        __int16 v26 = 2112;
        double v27 = v19;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%@: Using default supported orientations: %@", buf, 0x16u);
      }
    }
  }

  return OrientationMask;
}

- (void)_updateOrientationPreferencesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UIWindow *)self windowScene];
  int v6 = [v5 _canDynamicallySpecifySupportedInterfaceOrientations];

  if (v6)
  {
    if ([(UIWindow *)self isInterfaceAutorotationDisabled])
    {
      *(void *)&self->_windowFlags |= 0x10000uLL;
    }
    else
    {
      unint64_t v7 = [(UIWindow *)self _supportedInterfaceOrientationsConsultingApp:1];
      int64_t v8 = [(UIWindow *)self _preferredInterfaceOrientationForRootViewController];
      if (((1 << v8) & ~v7) != 0) {
        int64_t v9 = 0;
      }
      else {
        int64_t v9 = v8;
      }
      if (v8) {
        int64_t v10 = v9;
      }
      else {
        int64_t v10 = 0;
      }
      id v12 = [(UIWindow *)self windowScene];
      double v11 = [v12 _systemAppearanceManager];
      [v11 window:self didUpdateSupportedOrientations:v7 preferredOrientation:v10 prefersAnimation:v3];
    }
  }
}

- (BOOL)isInterfaceAutorotationDisabled
{
  unsigned __int8 v3 = -[UIScene _systemShellOwnsInterfaceOrientation](self->_windowHostingScene);
  uint64_t v4 = *(void *)&self->_windowFlags & 0xF000;
  if (v3)
  {
    LOBYTE(v5) = v4 != 0;
  }
  else if (v4)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    [(_UISceneUIWindowHosting *)self->_windowHostingScene _referenceBounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    double v14 = [(UIWindow *)self screen];
    int64_t v15 = [v14 fixedCoordinateSpace];
    [v15 bounds];
    v22.origin.double x = v16;
    v22.origin.double y = v17;
    v22.size.double width = v18;
    v22.size.double height = v19;
    v21.origin.double x = v7;
    v21.origin.double y = v9;
    v21.size.double width = v11;
    v21.size.double height = v13;
    BOOL v5 = !CGRectEqualToRect(v21, v22);
  }
  return v5;
}

- (void)handleStatusBarChangeFromHeight:(double)a3 toHeight:(double)a4
{
  [(UIView *)self frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if (v9 == 0.0 || (dyld_program_sdk_at_least() & 1) != 0)
  {
    int64_t v15 = [(UIWindow *)self windowScene];
    if (![v15 interfaceOrientation]
      || (uint64_t v16 = [v15 interfaceOrientation],
          v16 == [(UIWindow *)self interfaceOrientation]))
    {
      CGFloat v17 = [v15 _coordinateSpace];
      [v17 bounds];
      v41.origin.double x = v8;
      v41.origin.double y = v10;
      v41.size.double width = v12;
      v41.size.double height = v14;
      BOOL v18 = CGRectEqualToRect(v40, v41);

      if (v18)
      {
        id WeakRetained = (UIViewController *)objc_loadWeakRetained((id *)&self->_delegateViewController);
        self->_lastPropagatedStatusBarCGFloat Height = a4;
        if (WeakRetained)
        {
          if (objc_opt_respondsToSelector())
          {
            if (WeakRetained == self->_rootViewController) {
              [(UIViewController *)WeakRetained window:self statusBarWillChangeFromHeight:a3 toHeight:a4];
            }
          }
          else if (objc_opt_respondsToSelector())
          {
            [(UIView *)self bounds];
            double v24 = v23;
            double v26 = v25 + 0.0;
            double v28 = v27 + a3;
            double v30 = v29 - (a3 + 0.0);
            [(UIView *)self bounds];
            -[UIViewController window:willAnimateFromContentFrame:toContentFrame:](WeakRetained, "window:willAnimateFromContentFrame:toContentFrame:", self, v26, v28, v24, v30, v31 + 0.0, v32 + a4, v34, v33 - (a4 + 0.0));
          }
        }
      }
    }
  }
  else
  {
    double v20 = __UIStatusBarManagerForWindow(self);
    [v20 statusBarHeight];
    double v22 = v21;

    -[UIWindow setFrame:](self, "setFrame:", v8, v10 + v22 - v10, v12, v14 - (v22 - v10));
  }
  if (dyld_program_sdk_at_least())
  {
    if ([(UIViewController *)self->_rootViewController isViewLoaded])
    {
      uint64_t v35 = [(UIViewController *)self->_rootViewController view];
      if (v35)
      {
        double v36 = (void *)v35;
        double v37 = [(UIViewController *)self->_rootViewController view];
        char v38 = [v37 translatesAutoresizingMaskIntoConstraints];

        if ((v38 & 1) == 0)
        {
          [(UIView *)self _setNeedsUpdateConstraints];
          [(UIView *)self layoutIfNeeded];
        }
      }
    }
  }
}

- (CGAffineTransform)_viewTransformForInterfaceOrientation:(SEL)a3
{
  switch(a4)
  {
    case 1:
      double v5 = 0.0;
      break;
    case 3:
      double v5 = 1.57079633;
      break;
    case 4:
      double v5 = -1.57079633;
      break;
    default:
      double v5 = 3.14159265;
      if (a4 != 2) {
        double v5 = 0.0;
      }
      break;
  }
  CGRect result = CGAffineTransformMakeRotation(&v8, v5);
  float64x2_t v7 = vrndaq_f64(*(float64x2_t *)&v8.c);
  *(float64x2_t *)&v8.a = vrndaq_f64(*(float64x2_t *)&v8.a);
  *(float64x2_t *)&v8.tdouble x = vrndaq_f64(*(float64x2_t *)&v8.tx);
  *(_OWORD *)&retstr->a = *(_OWORD *)&v8.a;
  *(float64x2_t *)&retstr->c = v7;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v8.tx;
  return result;
}

- (int64_t)_orientationForSceneTransform
{
  return self->_sceneClientOrientation;
}

+ (void)initialize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__UIWindow_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_once != -1) {
    dispatch_once(&initialize_once, block);
  }
}

- (BOOL)_systemGestureRecognitionIsPossible
{
  return *((unsigned char *)self + 656) & 1;
}

- (id)nextResponder
{
  if (self->_windowHostingScene) {
    return self->_windowHostingScene;
  }
  else {
    return (id)UIApp;
  }
}

- (id)_keyboardSceneSettings
{
  unsigned __int8 v3 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  if ([v3 snapshotting])
  {
    uint64_t v4 = [(UIWindow *)self windowScene];
    [v4 _effectiveSettings];
  }
  else
  {
    uint64_t v4 = -[UIWindow _fbsScene]((id *)&self->super.super.super.isa);
    [v4 settings];
  double v5 = };

  return v5;
}

- (BOOL)_disableAutomaticKeyboardUI
{
  return 0;
}

- (double)level
{
  return self->_windowLevel;
}

- (BOOL)_appearsInLoupe
{
  return 1;
}

- (BOOL)_shouldControlAutorotation
{
  BOOL v3 = [(UIWindow *)self _canAffectStatusBarAppearance];
  if (v3)
  {
    LOBYTE(v3) = [(UIWindow *)self _appearsInLoupe];
  }
  return v3;
}

- (void)_didMoveFromScene:(id)a3 toScene:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 == v7) {
    goto LABEL_20;
  }
  CGAffineTransform v8 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(UIWindow *)self _updateAutorotationResponse:1];
    v24[0] = self;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [v7 _computeMetricsForWindows:v10 animated:0];

    [(UIViewController *)self->_rootViewController _updateContentOverlayInsetsForSelfAndChildren];
  }
  double v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"_UIWindowDidMoveToSceneNotification" object:self userInfo:0];

  if (v6)
  {
    double v12 = [v6 _screen];
    double v13 = [v7 _screen];
    [(UIWindow *)self _didMoveFromScreen:v12 toScreen:v13];
  }
  if (![(UIView *)self isHidden]) {
    [(UIWindow *)self _updateLayerOrderingAndSetLayerHidden:0];
  }
  double v14 = [v6 _focusSystemSceneComponent];
  int64_t v15 = [v14 activeSceneObserver];
  [v15 stopMonitoringContextChangesForWindow:self];

  uint64_t v16 = [v7 _focusSystemSceneComponent];
  CGFloat v17 = [v16 activeSceneObserver];
  [v17 beginMonitoringContextChangesForWindow:self];

  if (self->_focusEventRecognizer) {
    goto LABEL_9;
  }
  double v21 = [v7 _focusSystemSceneComponent];
  double v22 = [v21 focusSystem];

  if (v22)
  {
    [(UIWindow *)self _installFocusEventRecognizer];
  }
  else if (self->_focusEventRecognizer)
  {
LABEL_9:
    BOOL v18 = [v7 _focusSystemSceneComponent];
    CGFloat v19 = [v18 focusSystem];

    if (v19)
    {
      focusEventRecognizer = self->_focusEventRecognizer;
      if (focusEventRecognizer) {
        [(_UIFocusEventRecognizer *)focusEventRecognizer reset];
      }
    }
    else
    {
      [(UIWindow *)self _removeFocusEventRecognizer];
    }
  }
  if (v6 && self->_passthroughScrollInteraction)
  {
    -[UIView removeInteraction:](self, "removeInteraction:");
    passthroughScrollInteraction = self->_passthroughScrollInteraction;
    self->_passthroughScrollInteraction = 0;
  }
  if (v7) {
    -[UIWindow _configurePassthroughInteractionIfNeeded]((id *)&self->super.super.super.isa);
  }
LABEL_20:
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIWindow;
  [(UIView *)&v10 traitCollectionDidChange:v4];
  double v5 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _focusSystemSceneComponent];
  id v6 = [v5 focusSystem];

  if (v6)
  {
    id v7 = [(UIWindow *)self traitCollection];
    uint64_t v8 = [v7 userInterfaceIdiom];
    uint64_t v9 = [v4 userInterfaceIdiom];

    if (v8 != v9 || !self->_focusEventRecognizer)
    {
      [(UIWindow *)self _removeFocusEventRecognizer];
      [(UIWindow *)self _installFocusEventRecognizer];
    }
  }
  else
  {
    [(UIWindow *)self _removeFocusEventRecognizer];
  }
  -[UIWindow _configurePassthroughInteractionIfNeeded]((id *)&self->super.super.super.isa);
}

- (void)_configurePassthroughInteractionIfNeeded
{
  if (!a1) {
    return;
  }
  if (([(id)objc_opt_class() _needsPassthroughInteraction] & 1) == 0)
  {
    if (!a1[90]) {
      return;
    }
LABEL_14:
    objc_msgSend(a1, "removeInteraction:");
    id v7 = a1[90];
    a1[90] = 0;

    return;
  }
  int v2 = [a1 windowScene];
  int v3 = [v2 _supportsPassthroughInteractions];

  id v4 = a1[90];
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    uint64_t v8 = objc_alloc_init(_UIPassthroughScrollInteraction);
    id v9 = a1[90];
    a1[90] = v8;

    [a1[90] setDelegate:a1];
    [a1[90] setConfiguredForInactiveInteractionEventsOnly:1];
    id v10 = a1[90];
    [a1 addInteraction:v10];
    return;
  }
  if (v4) {
    char v6 = v3;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    goto LABEL_14;
  }
}

+ (BOOL)_needsPassthroughInteraction
{
  return 1;
}

- (void)_removeFocusEventRecognizer
{
  [(_UIFocusEventRecognizer *)self->_focusEventRecognizer reset];
  focusEventRecognizer = self->_focusEventRecognizer;
  self->_focusEventRecognizer = 0;
}

- (void)_setDelegateViewController:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);

  BOOL v5 = obj;
  if (!obj || WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegateViewController, obj);
    if (objc_opt_respondsToSelector()) {
      int v6 = [obj isInWillRotateCallback] ^ 1;
    }
    else {
      int v6 = 1;
    }
    BOOL v7 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0 && v6)
    {
      if (dyld_program_sdk_at_least()
        && [(UIView *)self isHidden]
        && ([(UIWindow *)self rootViewController],
            uint64_t v8 = objc_claimAutoreleasedReturnValue(),
            int v9 = [v8 isViewLoaded],
            v8,
            !v9))
      {
        id v10 = [(UIWindow *)self rootViewController];
        double v11 = [v10 _window];
      }
      else
      {
        id v10 = [obj rotatingContentViewForWindow:self];
        double v11 = [v10 superview];
      }
      BOOL v7 = v11 == self;
    }
    double v12 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _screen];
    double v13 = v12;
    if (v12 && [v12 _userInterfaceIdiom] == 3)
    {
      double v14 = self;
      BOOL v15 = 0;
      BOOL v16 = 0;
    }
    else
    {
      BOOL v15 = obj != 0;
      double v14 = self;
      BOOL v16 = v7;
    }
    [(UIWindow *)v14 setAutorotates:v15 forceUpdateInterfaceOrientation:v16];

    BOOL v5 = obj;
  }
}

- (void)setAutorotates:(BOOL)a3 forceUpdateInterfaceOrientation:(BOOL)a4
{
  if (((((*(void *)&self->_windowFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    uint64_t v7 = 256;
    if (!a3) {
      uint64_t v7 = 0;
    }
    self->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&self->_windowFlags & 0xFFFFFFFFFFFFFEFFLL | v7);
    uint64_t v8 = +[UIDevice currentDevice];
    int v9 = v8;
    if (v5) {
      [v8 beginGeneratingDeviceOrientationNotifications];
    }
    else {
      [v8 endGeneratingDeviceOrientationNotifications];
    }

    [(UIWindow *)self _updateAutorotationResponse:v4];
  }
}

- (void)_updateAutorotationResponse:(BOOL)a3
{
  BOOL v3 = a3;
  $B5B0456088C508EDB812873BE14D7A88 windowFlags = self->_windowFlags;
  if ((*(_WORD *)&windowFlags & 0x100) != 0)
  {
    if ([(id)UIApp isFrontBoard])
    {
      int v6 = 1;
    }
    else
    {
      uint64_t v7 = [(UIWindow *)self windowScene];
      int v6 = [v7 _canReceiveDeviceOrientationEvents];
    }
  }
  else
  {
    int v6 = 0;
  }
  id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  if ((*(_WORD *)&windowFlags & 0x200) != 0 || !v6)
  {
    if ((*(_WORD *)&windowFlags & 0x200) != 0) {
      char v12 = v6;
    }
    else {
      char v12 = 1;
    }
    if ((v12 & 1) == 0)
    {
      *(void *)&self->_windowFlags &= ~0x200uLL;
      [v13 removeObserver:self name:@"UIDeviceOrientationDidChangeNotification" object:0];
      [v13 removeObserver:self name:@"UIApplicationDidChangeStatusBarOrientationNotification" object:0];
      if ([(id)UIApp _isSpringBoard]) {
        [v13 removeObserver:self name:@"_UIAppActiveInterfaceOrientationDidChangeNotification" object:0];
      }
    }
  }
  else
  {
    *(void *)&self->_windowFlags |= 0x200uLL;
    [v13 addObserver:self selector:sel__handleDeviceOrientationChange_ name:@"UIDeviceOrientationDidChangeNotification" object:0];
    [v13 addObserver:self selector:sel__handleStatusBarOrientationChange_ name:@"UIApplicationDidChangeStatusBarOrientationNotification" object:0];
    if ([(id)UIApp _isSpringBoard]) {
      [v13 addObserver:self selector:sel__handleSBActiveInterfaceOrientationChange_ name:@"_UIAppActiveInterfaceOrientationDidChangeNotification" object:0];
    }
    if (v3)
    {
      uint64_t v8 = [(id)UIApp _currentExpectedInterfaceOrientation];
      if ((unint64_t)(v8 - 1) >= 4) {
        uint64_t v8 = [(id)UIApp _statusBarOrientationForWindow:self];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
      uint64_t v10 = [WeakRetained _preferredInterfaceOrientationGivenCurrentOrientation:v8];

      int64_t viewOrientation = self->_viewOrientation;
      if (!viewOrientation && v10 != 1)
      {
        [(UIWindow *)self _updateToInterfaceOrientation:v10 duration:1 force:0.0];
LABEL_24:
        -[UIViewController _recursiveUpdateContentOverlayInsetsFromParentIfNecessary](self->_rootViewController);
        goto LABEL_25;
      }
      [(UIWindow *)self _updateToInterfaceOrientation:v10 duration:1 force:0.0];
      if (viewOrientation && viewOrientation != v10) {
        goto LABEL_24;
      }
    }
  }
LABEL_25:
}

void __57__UIWindow__updateToInterfaceOrientation_duration_force___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = [WeakRetained _deferredOrientationUpdate];
    int v9 = [v7 _windowHostingScene];
    -[_UIWindowOrientationUpdate synchronizeDrawingWithFencesOnScene:]((uint64_t)v8, v9);

    if ((v7[62] != (id)a2 || a2 && *(unsigned char *)(a1 + 56))
      && [v7 _shouldAutorotateToInterfaceOrientation:a2])
    {
      -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:](v7, a2, 1, *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40));
    }
    else
    {
      id v10 = objc_loadWeakRetained(v7 + 55);
      double v11 = v10;
      if (v10 && ([v10 _isViewControllerInWindowHierarchy] & 1) == 0) {
        -[UIViewController _updateLastKnownInterfaceOrientationOnPresentionStack:]((uint64_t)v11, a2);
      }
    }
    if (!v7[62])
    {
      char v12 = [v7 rootViewController];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __57__UIWindow__updateToInterfaceOrientation_duration_force___block_invoke_2;
      v18[3] = &unk_1E52E0000;
      v18[4] = v7;
      v18[5] = a2;
      -[UIViewController __withSupportedInterfaceOrientation:apply:](v12, a2, v18);
    }
    if ([v7 _windowControlsStatusBarOrientation])
    {
      if (([v7 _isStatusBarWindow] & 1) == 0)
      {
        id v13 = [v7 _windowHostingScene];
        char v14 = [v13 _sceneSessionRoleIsCarPlayOrNonInteractiveExternal];

        if ((v14 & 1) == 0)
        {
          id v15 = *(id *)(a1 + 48);
          if (v7[62] != v15 || v15 == 0) {
            id v17 = v7[62];
          }
          else {
            id v17 = a3;
          }
          [(id)UIApp _setExpectedViewOrientation:v17];
        }
      }
    }
  }
}

- (BOOL)_windowControlsStatusBarOrientation
{
  return (*((unsigned __int8 *)&self->_windowFlags + 3) >> 4) & 1;
}

- (void)_internal_setRotatableViewOrientation:(uint64_t)a3 updateStatusBar:(uint64_t)a4 duration:(double)a5 force:
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 55);
    if (WeakRetained)
    {
      [a1 _setRotatableClient:WeakRetained toOrientation:a2 updateStatusBar:a3 duration:a4 force:1 isRotating:a5];
      -[UIViewController _updateLastKnownInterfaceOrientationOnPresentionStack:]((uint64_t)WeakRetained, a2);
    }
    [a1 _notifyRotatableViewOrientation:a2 duration:a5];
  }
}

- (void)_notifyRotatableViewOrientation:(int64_t)a3 duration:(double)a4
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v11[0] = @"_UIWindowContentWillRotateOrientationUserInfoKey";
  uint64_t v8 = [NSNumber numberWithInteger:a3];
  v11[1] = @"_UIWindowContentWillRotateDurationUserInfoKey";
  v12[0] = v8;
  int v9 = [NSNumber numberWithDouble:a4];
  v12[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v7 postNotificationName:@"_UIWindowContentWillRotateNotification" object:self userInfo:v10];
}

- (void)_setRotatableClient:(id)a3 toOrientation:(int64_t)a4 updateStatusBar:(BOOL)a5 duration:(double)a6 force:(BOOL)a7 isRotating:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v11 = a5;
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
  BOOL v16 = WeakRetained == v14 && v8;

  v74 = self;
  int64_t viewOrientation = self->_viewOrientation;
  if (dyld_program_sdk_at_least())
  {
    id v17 = [(UIWindow *)self rootViewController];
    int v18 = [v17 isViewLoaded] ^ 1;
  }
  else
  {
    int v18 = 0;
  }
  if (v9) {
    int v19 = 1;
  }
  else {
    int v19 = [(id)UIApp _hasApplicationCalledLaunchDelegate] ^ 1 | v18;
  }
  unsigned int v70 = v19;
  if (v11) {
    uint64_t v20 = [(id)UIApp _statusBarOrientationFollowsWindow:v74];
  }
  else {
    uint64_t v20 = 0;
  }
  if (![(id)objc_opt_class() _transformLayerRotationsAreEnabled] || !v16)
  {
    if (v16)
    {
      double v22 = [(UIWindow *)v74 _clientsForRotation];
      id v23 = [(UIWindow *)v74 __clientsForRotationCallbacks];
    }
    else
    {
      id v23 = [MEMORY[0x1E4F1C978] arrayWithObject:v14];
      double v22 = v23;
    }
    CGAffineTransform v71 = v23;
    if ([v22 count] == 1)
    {
      double v24 = [v22 lastObject];
      char v25 = objc_opt_respondsToSelector();

      if (v25)
      {
        double v26 = [v22 lastObject];
        int64_t viewOrientation = [v26 _lastKnownInterfaceOrientation];
      }
    }
    if (!v16 && (v20 & 1) == 0 && !v9) {
      goto LABEL_91;
    }
    if (viewOrientation != a4 || v9)
    {
      char v64 = v20;
      BOOL v65 = v16;
      CGAffineTransform v67 = v14;
      int v63 = +[UIView _degreesToRotateFromInterfaceOrientation:viewOrientation toInterfaceOrientation:a4];
      double v27 = 0.0;
      if ((v70 & 1) == 0)
      {
        +[UIView _durationForRotationFromInterfaceOrientation:viewOrientation toInterfaceOrientation:a4 withBaseDuration:a6];
        double v27 = v28;
      }
      v72 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v22, "count"));
      double v29 = v74;
      int v73 = (*(void *)&v74->_windowFlags & 0x20000) == 0;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      long long v66 = v22;
      id v30 = v22;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v110 objects:v116 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v111;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v111 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(void **)(*((void *)&v110 + 1) + 8 * i);
            int64_t v36 = a4;
            double v37 = [[UIClientRotationContext alloc] initWithClient:v35 toOrientation:a4 duration:v29 andWindow:v27];
            char v38 = [(UIClientRotationContext *)v37 contentView];

            if (v38)
            {
              if (objc_opt_respondsToSelector())
              {
                double v29 = v74;
                v73 &= [v35 shouldWindowUseOnePartInterfaceRotationAnimation:v74];
              }
              else
              {
                int v73 = 0;
                double v29 = v74;
              }
              [v72 addObject:v37];
            }
            else
            {
              double v29 = v74;
            }

            a4 = v36;
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v110 objects:v116 count:16];
        }
        while (v32);
      }

      if ((v73 & 1) != 0 || (NSLog(&cfstr_TwoStageRotati.isa), v65) && (unint64_t)[v72 count] < 2)
      {
        id v14 = v67;
        if ([v72 count])
        {
          int64_t v69 = a4;
          [(UIWindow *)v29 beginDisablingInterfaceAutorotation];
          if (v65)
          {
            uint64_t v39 = 2048;
            if ((v73 & 1) == 0) {
              uint64_t v39 = 0;
            }
            v29->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&v29->_windowFlags & 0xFFFFFFFFFFFFF7FFLL | v39);
          }
          long long v108 = 0u;
          long long v109 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          id v40 = v72;
          uint64_t v41 = [v40 countByEnumeratingWithState:&v106 objects:v115 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v107;
            do
            {
              for (uint64_t j = 0; j != v42; ++j)
              {
                if (*(void *)v107 != v43) {
                  objc_enumerationMutation(v40);
                }
                uint64_t v45 = *(void **)(*((void *)&v106 + 1) + 8 * j);
                double v46 = [v45 rotatingClient];
                int v47 = [v71 containsObject:v46];
                uint64_t v48 = 1;
                if (v47 && (v70 & 1) == 0)
                {
                  if (objc_opt_respondsToSelector())
                  {
                    [v46 window:v29 willRotateToInterfaceOrientation:v69 duration:v27];
                    uint64_t v48 = 0;
                  }
                  else
                  {
                    uint64_t v48 = 1;
                  }
                }
                [v45 setSkipClientRotationCallbacks:v48];
              }
              uint64_t v42 = [v40 countByEnumeratingWithState:&v106 objects:v115 count:16];
            }
            while (v42);
          }

          int64_t v49 = v69;
          if (((!v65 | v70) & 1) == 0)
          {
            double v50 = [MEMORY[0x1E4F28EB8] defaultCenter];
            double v51 = (void *)MEMORY[0x1E4F1C9E8];
            double v52 = [NSNumber numberWithInt:v69];
            double v53 = objc_msgSend(v51, "dictionaryWithObjectsAndKeys:", v52, @"UIWindowNewOrientationUserInfoKey", 0);
            [v50 postNotificationName:@"UIWindowWillRotateNotification" object:v74 userInfo:v53];

            double v29 = v74;
          }
          *(void *)&v29->_windowFlags |= 0x400uLL;
          if (v73)
          {
            if (v27 > 0.0)
            {
              long long v92 = 0u;
              long long v93 = 0u;
              long long v90 = 0u;
              long long v91 = 0u;
              id v54 = v40;
              uint64_t v55 = [v54 countByEnumeratingWithState:&v90 objects:v114 count:16];
              if (v55)
              {
                uint64_t v56 = v55;
                uint64_t v57 = *(void *)v91;
                do
                {
                  for (uint64_t k = 0; k != v56; ++k)
                  {
                    if (*(void *)v91 != v57) {
                      objc_enumerationMutation(v54);
                    }
                    double v59 = *(void **)(*((void *)&v90 + 1) + 8 * k);
                    double v60 = [v59 rotatingClient];
                    int v61 = [v71 containsObject:v60];

                    double v29 = v74;
                    if (v61) {
                      [v59 setupRotationOrderingKeyboardInAfterRotation:(*(void *)&v74->_windowFlags >> 18) & 1];
                    }
                  }
                  uint64_t v56 = [v54 countByEnumeratingWithState:&v90 objects:v114 count:16];
                }
                while (v56);
              }

              int64_t v49 = v69;
            }
            v89[0] = MEMORY[0x1E4F143A8];
            v89[1] = 3221225472;
            v89[2] = __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_4;
            v89[3] = &__block_descriptor_40_e24_v24__0___v___8___v__B_16l;
            *(double *)&v89[4] = v27;
            v79[0] = MEMORY[0x1E4F143A8];
            v79[1] = 3221225472;
            v79[2] = __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_5;
            v79[3] = &unk_1E5303860;
            int64_t v83 = v49;
            id v80 = v40;
            BOOL v85 = v27 > 0.0;
            id v81 = v71;
            long long v82 = v29;
            char v86 = v64;
            double v84 = v27;
            char v87 = v70;
            BOOL v88 = v65;
            v75[0] = MEMORY[0x1E4F143A8];
            v75[1] = 3221225472;
            v75[2] = __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_7;
            v75[3] = &unk_1E52DF248;
            v75[4] = v29;
            id v76 = v80;
            BOOL v77 = v27 > 0.0;
            char v78 = v70;
            +[UIView conditionallyAnimate:v27 > 0.0 withAnimation:v89 layout:v79 completion:v75];

            id v62 = v80;
            id v14 = v67;
          }
          else
          {
            id v62 = [v40 lastObject];
            v105[0] = MEMORY[0x1E4F143A8];
            v105[1] = 3221225472;
            v105[2] = __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke;
            v105[3] = &__block_descriptor_40_e24_v24__0___v___8___v__B_16l;
            *(double *)&v105[4] = v27;
            v96[0] = MEMORY[0x1E4F143A8];
            v96[1] = 3221225472;
            v96[2] = __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_2;
            v96[3] = &unk_1E5303838;
            BOOL v104 = v27 > 0.0;
            id v97 = v40;
            id v14 = v67;
            int64_t v100 = viewOrientation;
            int v103 = v63;
            id v98 = v67;
            v99 = v29;
            int64_t v101 = v69;
            double v102 = v27;
            v94[0] = MEMORY[0x1E4F143A8];
            v94[1] = 3221225472;
            v94[2] = __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_3;
            v94[3] = &unk_1E52DA660;
            v94[4] = v29;
            id v95 = v97;
            +[UIView conditionallyAnimate:v27 > 0.0 withAnimation:v105 layout:v96 completion:v94];
          }
          double v22 = v66;

          goto LABEL_91;
        }
      }
      else
      {
        NSLog(&cfstr_UsingTwoStageR.isa);
        id v14 = v67;
      }
    }
    else if ([(id)UIApp _statusBarOrientationForWindow:v74] != a4)
    {
      v74->_int64_t viewOrientation = a4;
      if (objc_msgSend((id)UIApp, "_statusBarOrientationFollowsWindow:")) {
        [(id)UIApp setStatusBarOrientation:a4 animation:2 duration:0.0];
      }
    }
LABEL_91:

    goto LABEL_92;
  }
  if (viewOrientation == a4 && !v9)
  {
    if ([(id)UIApp _statusBarOrientationForWindow:v74] != a4)
    {
      v74->_int64_t viewOrientation = a4;
      if ([(id)UIApp _statusBarOrientationFollowsWindow:v74]) {
        [(id)UIApp setStatusBarOrientation:a4 animation:2 duration:0.0];
      }
    }
  }
  else
  {
    [(UIWindow *)v74 _rotateWindowToOrientation:a4 updateStatusBar:v20 duration:v70 skipCallbacks:a6];
  }
LABEL_92:
}

void __59__UIWindow__rotateToBounds_withAnimator_transitionContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v18 = a2;
  if (!*(unsigned char *)(a1 + 40))
  {
    uint64_t v3 = *(unsigned int *)(*(void *)(a1 + 32) + 864);
    BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v7 = [NSNumber numberWithInt:v3];
    BOOL v8 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, @"UIWindowOldOrientationUserInfoKey", 0);
    [v4 postNotificationName:@"UIWindowDidRotateNotification" object:v5 userInfo:v8];
  }
  *(void *)(*(void *)(a1 + 32) + 864) = *(void *)(*(void *)(a1 + 32) + 856);
  if (*(unsigned char *)(a1 + 41)) {
    [*(id *)(a1 + 32) endDisablingInterfaceAutorotation];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    if ([(id)v9 _windowOwnsInterfaceOrientation]) {
      goto LABEL_12;
    }
    if ((*(unsigned char *)(v9 + 580) & 0x20) != 0) {
      goto LABEL_12;
    }
    uint64_t v10 = [(id)v9 _deferredOrientationUpdate];
    if (!v10) {
      goto LABEL_12;
    }
    BOOL v11 = (void *)v10;
    char v12 = [(id)v9 _deferredOrientationUpdate];
    uint64_t v13 = v12 ? v12[2] : 0;
    uint64_t v14 = *(void *)(v9 + 864);

    if (v13 == v14)
    {
LABEL_12:
      id v15 = [(id)v9 _deferredOrientationUpdate];

      if (v15)
      {
        -[UIWindow _cancelEnqueuedDeferredOrientationUpdateIfNeeded](v9);
        BOOL v16 = [(id)v9 _deferredOrientationUpdate];
        id v17 = [(id)v9 _windowHostingScene];
        -[_UIWindowOrientationUpdate synchronizeDrawingWithFencesOnScene:]((uint64_t)v16, v17);

        [(id)v9 _setDeferredOrientationUpdate:0];
      }
    }
    else
    {
      *(void *)(v9 + 576) |= 0x2000000000uLL;
      [(id)v9 performSelector:sel__executeDeferredOrientationUpdate withObject:0 afterDelay:0.0];
    }
  }
}

- (_UIWindowOrientationUpdate)_deferredOrientationUpdate
{
  return self->_deferredOrientationUpdate;
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3 checkForDismissal:(BOOL)a4 isRotationDisabled:(BOOL *)a5
{
  BOOL v6 = a4;
  if (a5) {
    *a5 = 0;
  }
  if (![(UIWindow *)self _windowOwnsInterfaceOrientation]) {
    return 1;
  }
  uint64_t v9 = [(UIWindow *)self _shouldPreventRotationHook];
  if (v9
    && (uint64_t v10 = (void *)v9,
        [(UIWindow *)self _shouldPreventRotationHook],
        BOOL v11 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
        int v12 = v11[2](),
        v11,
        v10,
        v12))
  {
    BOOL v13 = 0;
    if (a5) {
      *a5 = 1;
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
    id v15 = [WeakRetained _viewControllerForSupportedInterfaceOrientationsWithDismissCheck:v6];

    if (!v15)
    {
      id v15 = [(UIWindow *)self rootViewController];
    }
    BOOL v16 = [v15 _viewControllersWhoseOrientationsMustCoincide];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__UIWindow__shouldAutorotateToInterfaceOrientation_checkForDismissal_isRotationDisabled___block_invoke;
    aBlock[3] = &__block_descriptor_40_e29_B24__0__UIViewController_8q16l;
    aBlock[4] = a5;
    id v17 = _Block_copy(aBlock);
    id v18 = v17;
    if (v16) {
      char v19 = +[UIViewController _allViewControllersInArray:v16 allowAutorotationToInterfaceOrientation:a3 predicate:v17];
    }
    else {
      char v19 = (*((uint64_t (**)(void *, void *, int64_t))v17 + 2))(v17, v15, a3);
    }
    BOOL v13 = v19;
  }
  return v13;
}

- (void)_setDeferredOrientationUpdate:(id)a3
{
}

- (BOOL)_isStatusBarWindow
{
  return 0;
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  BOOL v5 = +[UIWindow _transformLayerRotationsAreEnabled];
  return [(UIWindow *)self _shouldAutorotateToInterfaceOrientation:a3 checkForDismissal:v5 isRotationDisabled:0];
}

- (void)_updateToInterfaceOrientation:(int64_t)a3 animated:(BOOL)a4
{
  double v6 = 0.0;
  if (a4) {
    [(UIWindow *)self _rotationDuration];
  }
  [(UIWindow *)self _updateToInterfaceOrientation:a3 duration:0 force:v6];
}

- (BOOL)_requiresKeyboardPresentationFence
{
  return ![(UIWindow *)self isUsingOnePartRotationAnimation];
}

- (BOOL)isUsingOnePartRotationAnimation
{
  return (*((unsigned __int8 *)&self->_windowFlags + 1) >> 3) & 1;
}

- (void)_updateLayerOrderingAndSetLayerHidden:(BOOL)a3 actionBlock:(id)a4
{
  BOOL v4 = a3;
  id v14 = a4;
  double v6 = [(UIView *)self layer];
  int v7 = [v6 isHidden] ^ v4;

  BOOL v8 = [(UIView *)self layer];
  [v8 setHidden:v4];

  if ((v7 & 1) != 0
    || ([(_UISceneUIWindowHosting *)self->_windowHostingScene _windowIsFront:self] & 1) == 0)
  {
    [(_UISceneUIWindowHosting *)self->_windowHostingScene _windowUpdatedVisibility:self];
  }
  else
  {
    [(_UISceneUIWindowHosting *)self->_windowHostingScene _windowUpdatedProperties:self];
  }
  uint64_t v9 = v14;
  if (v14)
  {
    (*((void (**)(id))v14 + 2))(v14);
    uint64_t v9 = v14;
  }
  if (v7)
  {
    uint64_t v10 = [(UIWindow *)self windowScene];
    BOOL v11 = [v10 statusBarManager];
    [v11 updateStatusBarAppearance];

    int v12 = [(UIWindow *)self windowScene];
    BOOL v13 = [v12 _systemAppearanceManager];
    [v13 updateUserInterfaceStyle];

    uint64_t v9 = v14;
  }
}

+ (int64_t)_preferredStatusBarStyleInWindow:(id)a3 resolvedStyle:(int64_t *)a4 withPartStyles:(id *)a5 animationProvider:(id *)a6
{
  v66[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = [v9 windowScene];
  BOOL v11 = [v10 _effectiveUISettings];
  int v12 = [v11 forcedStatusBarStyle];

  if (v12)
  {
    BOOL v13 = [v10 _effectiveUISettings];
    id v14 = [v13 forcedStatusBarStyle];
    int64_t v15 = [v14 integerValue];

    uint64_t v16 = 2 * (v15 == 3);
    BOOL v17 = v15 == 1;
    goto LABEL_18;
  }
  if ([(id)UIApp _viewControllerBasedStatusBarAppearance])
  {
    id v18 = [v9 rootViewController];
    char v19 = [v18 _effectiveStatusBarStyleViewController];

    uint64_t v20 = [v9 _rootPresentationController];
    double v21 = v20;
    if (!v19)
    {
      if (v20)
      {
        int64_t v15 = [v20 preferredStatusBarStyle];
        id v36 = v21;
        double v37 = [v36 traitCollection];
        uint64_t v38 = [v37 userInterfaceIdiom];

        if (v38 == 3)
        {
          if (dyld_program_sdk_at_least())
          {
            uint64_t v39 = [v36 traitCollection];
            uint64_t v40 = [v39 userInterfaceStyle];

            uint64_t v41 = 3;
            if (v40 == 2) {
              uint64_t v41 = 1;
            }
            if (v40) {
              BOOL v42 = v15 == 0;
            }
            else {
              BOOL v42 = 0;
            }
          }
          else
          {
            BOOL v42 = v15 == 0;
            uint64_t v41 = 3;
          }
          if (v42) {
            int64_t v15 = v41;
          }
        }

        uint64_t v57 = [v36 preferredStatusBarStyle];
        if (v57 == 1) {
          uint64_t v58 = 1;
        }
        else {
          uint64_t v58 = 2 * (v57 == 3);
        }
        int64_t v34 = _resolvePreferredInternalStatusBarStyleFromClientWithTraitEnvironment(v58, v36);
        if (a6)
        {
          *a6 = [v9 _rootPresentationController];
        }
      }
      else
      {
        int64_t v34 = 0;
        int64_t v15 = 0;
      }
LABEL_63:

      if (!a4) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    uint64_t v22 = [v19 preferredStatusBarStyle];
    id v23 = v19;
    id v64 = v23;
    if (!v22)
    {
      double v24 = v23;
      char v25 = [v23 _parentTraitEnvironment];
      if (v25)
      {
LABEL_9:

        id v23 = v24;
      }
      else
      {
        while (1)
        {
          double v26 = [v23 parentViewController];

          if (!v26) {
            break;
          }
          double v24 = [v23 parentViewController];

          char v25 = [v24 _parentTraitEnvironment];
          id v23 = v24;
          if (v25) {
            goto LABEL_9;
          }
        }
      }
    }
    int v61 = a6;
    int v63 = v19;
    id v27 = v23;
    double v28 = [v27 traitCollection];
    uint64_t v29 = [v28 userInterfaceIdiom];

    int64_t v15 = v22;
    if (v29 == 3)
    {
      if (dyld_program_sdk_at_least())
      {
        id v30 = [v27 traitCollection];
        uint64_t v31 = [v30 userInterfaceStyle];

        uint64_t v32 = 3;
        if (v31 == 2) {
          uint64_t v32 = 1;
        }
        if (v31) {
          BOOL v33 = v22 == 0;
        }
        else {
          BOOL v33 = 0;
        }
      }
      else
      {
        BOOL v33 = v22 == 0;
        uint64_t v32 = 3;
      }
      if (v33) {
        int64_t v15 = v32;
      }
      else {
        int64_t v15 = v22;
      }
    }
    id v62 = v21;

    if (v22 == 1) {
      uint64_t v43 = 1;
    }
    else {
      uint64_t v43 = 2 * (v22 == 3);
    }
    int64_t v34 = _resolvePreferredInternalStatusBarStyleFromClientWithTraitEnvironment(v43, v27);
    if (!a5)
    {
      double v21 = v62;
      char v19 = v63;
LABEL_60:
      if (v61) {
        *int v61 = v64;
      }

      goto LABEL_63;
    }
    int64_t v44 = _viewControllerIfStatusBarPartStyleProviding(v64);
    id v59 = v27;
    double v60 = v44;
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = [v44 preferredLeadingStatusBarStyle];
      if (v43 == v46) {
        uint64_t v47 = 4;
      }
      else {
        uint64_t v47 = _resolvePreferredInternalStatusBarStyleFromClientWithTraitEnvironment(v46, v45);
      }
      uint64_t v49 = [v45 preferredTrailingStatusBarStyle];
      if (v43 == v49) {
        uint64_t v50 = 4;
      }
      else {
        uint64_t v50 = _resolvePreferredInternalStatusBarStyleFromClientWithTraitEnvironment(v49, v45);
      }
      uint64_t v51 = [v45 preferredCenterStatusBarStyle];
      if (v43 == v51) {
        uint64_t v52 = 4;
      }
      else {
        uint64_t v52 = _resolvePreferredInternalStatusBarStyleFromClientWithTraitEnvironment(v51, v45);
      }
      uint64_t v48 = v50;
      if (v47 == 4)
      {
        uint64_t v53 = v52;
LABEL_59:
        v65[0] = @"leadingPartIdentifier";
        id v54 = [NSNumber numberWithInteger:v47];
        v66[0] = v54;
        v65[1] = @"trailingPartIdentifier";
        uint64_t v55 = [NSNumber numberWithInteger:v48];
        v66[1] = v55;
        v65[2] = @"centerPartIdentifier";
        uint64_t v56 = [NSNumber numberWithInteger:v53];
        v66[2] = v56;
        *a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:3];

        double v21 = v62;
        char v19 = v63;
        id v27 = v59;
        goto LABEL_60;
      }
      uint64_t v53 = v52;
      if (v47 != v48 || v47 != v52) {
        goto LABEL_59;
      }
      int64_t v15 = _UIStatusBarStyleFromResolvedStyle(v47);
      uint64_t v48 = 4;
      int64_t v34 = v47;
      uint64_t v47 = 4;
    }
    else
    {
      uint64_t v47 = 4;
      uint64_t v48 = 4;
    }
    uint64_t v53 = 4;
    goto LABEL_59;
  }
  int64_t v15 = [(id)UIApp statusBarStyle];
  uint64_t v16 = 2 * (v15 == 3);
  BOOL v17 = v15 == 1;
LABEL_18:
  if (v17) {
    int64_t v34 = 1;
  }
  else {
    int64_t v34 = v16;
  }
  if (a4) {
LABEL_22:
  }
    *a4 = v34;
LABEL_23:

  return v15;
}

uint64_t __30__UIWindow__setHidden_forced___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 440));
  if (WeakRetained) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = *(void *)(*(void *)(a1 + 32) + 560) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;

  BOOL v4 = *(void **)(a1 + 32);
  return [v4 addRootViewControllerViewIfPossible];
}

- (double)_touchSloppinessFactor
{
  int v2 = [(UIWindow *)self screen];
  double v3 = 1.0;
  if ([v2 _userInterfaceIdiom] == 3)
  {
    if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_UIExternalTouchSloppinessFactor, @"UIExternalTouchSloppinessFactor", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v3 = 2.0; {
    else
    }
      double v3 = *(double *)&qword_1E8FD53E0;
  }

  return v3;
}

- (int64_t)_sceneOrientation
{
  return self->_sceneOrientation;
}

- (BOOL)_needsShakesWhenInactive
{
  return 0;
}

- (void)sendEvent:(UIEvent *)event
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  BOOL v4 = event;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("EventDispatch", &qword_1EB259E50);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v79 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      id v80 = v79;
      uint64_t v81 = [(UIEvent *)v4 type];
      uint64_t v82 = [(UIEvent *)v4 subtype];
      int64_t v83 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 134219010;
      uint64_t v122 = v81;
      __int16 v123 = 2048;
      uint64_t v124 = v82;
      __int16 v125 = 2082;
      Name = class_getName(v83);
      __int16 v127 = 2048;
      v128 = self;
      __int16 v129 = 1026;
      unsigned int v130 = [(UIWindow *)self _contextId];
      _os_log_impl(&dword_1853B0000, v80, OS_LOG_TYPE_DEFAULT, "Sending UIEvent type: %li; subtype: %li; to window: <%{public}s: %p>; contextId: 0x%{public}X",
        buf,
        0x30u);
    }
  }
  double v6 = (void *)_UISetCurrentFallbackEnvironment(self);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v89 = v4;
    int v7 = self;
    char v8 = _UIInternalPreferenceUsesDefault(&_MergedGlobals_161, @"ShowTouches", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    if (byte_1EB25784C) {
      char v9 = v8;
    }
    else {
      char v9 = 1;
    }
    int v10 = _UIInternalPreferenceUsesDefault(&dword_1EB257850, @"ShowTouchesForAllProcesses", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    BOOL v11 = byte_1EB257854 != 0;
    if (qword_1EB259EE0 != -1) {
      dispatch_once(&qword_1EB259EE0, &__block_literal_global_1508);
    }
    double v84 = v6;
    BOOL v85 = v4;
    if (v9)
    {
      if (!qword_1EB259ED8)
      {
LABEL_67:

        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        obuint64_t j = [(UIEvent *)v89 _viewsForWindow:v7];
        uint64_t v62 = [obj countByEnumeratingWithState:&v93 objects:v116 count:16];
        if (v62)
        {
          uint64_t v63 = v62;
          uint64_t v64 = *(void *)v94;
          do
          {
            for (uint64_t i = 0; i != v63; ++i)
            {
              if (*(void *)v94 != v64) {
                objc_enumerationMutation(obj);
              }
              long long v66 = *(void **)(*((void *)&v93 + 1) + 8 * i);
              CGAffineTransform v67 = [(UIEvent *)v89 _touchesForView:v66 withPhase:0];
              uint64_t v68 = [v67 count];

              if (v68)
              {
                [(UIWindow *)v7 _fadeCalloutBarIfNeededForTouchInView:v66];
                id v69 = v66;
                if (v69)
                {
                  id v70 = v69;
                  do
                  {
                    CGAffineTransform v71 = [v70 layer];
                    v72 = [v71 animationKeys];
                    v90[0] = MEMORY[0x1E4F143A8];
                    v90[1] = 3221225472;
                    v90[2] = __22__UIWindow_sendEvent___block_invoke;
                    v90[3] = &unk_1E52E57D8;
                    id v91 = v70;
                    id v92 = v71;
                    id v73 = v71;
                    id v74 = v70;
                    [v72 enumerateObjectsUsingBlock:v90];

                    id v70 = [v74 superview];
                  }
                  while (v70);
                }
              }
            }
            uint64_t v63 = [obj countByEnumeratingWithState:&v93 objects:v116 count:16];
          }
          while (v63);
        }

        v75 = [(id)UIApp _gestureEnvironment];
        -[UIGestureEnvironment _updateForEvent:window:]((uint64_t)v75, v89, (uint64_t)v7);

        [(UIWindow *)v7 _sendTouchesForEvent:v89];
        [(UIEvent *)v89 timestamp];
        v7->_lastTouchTimestamp = v76;

        double v6 = v84;
        BOOL v4 = v85;
        goto LABEL_89;
      }
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id v12 = (id)qword_1EB259ED8;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v117 objects:buf count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v118;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v118 != v15) {
              objc_enumerationMutation(v12);
            }
            [*(id *)(*((void *)&v117 + 1) + 8 * j) removeFromSuperview];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v117 objects:buf count:16];
        }
        while (v14);
      }

      BOOL v17 = (void *)qword_1EB259EC8;
      qword_1EB259EC8 = 0;

      id v18 = (void *)qword_1EB259ED0;
      qword_1EB259ED0 = 0;

      char v19 = (void *)qword_1EB259ED8;
      qword_1EB259ED8 = 0;
LABEL_66:

      goto LABEL_67;
    }
    int v21 = v11 & ~v10;
    if (!byte_1EB259DB9) {
      int v21 = 1;
    }
    if (v21 != 1) {
      goto LABEL_67;
    }
    uint64_t v22 = (id *)&unk_1EB259000;
    if (!qword_1EB259EC8)
    {
      uint64_t v23 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      double v24 = (void *)qword_1EB259EC8;
      qword_1EB259EC8 = v23;

      uint64_t v25 = [MEMORY[0x1E4F1CA80] set];
      double v26 = (void *)qword_1EB259ED0;
      qword_1EB259ED0 = v25;

      uint64_t v27 = [MEMORY[0x1E4F1CA80] set];
      double v28 = (void *)qword_1EB259ED8;
      qword_1EB259ED8 = v27;
    }
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    char v19 = [(UIEvent *)v89 allTouches];
    uint64_t v29 = [v19 countByEnumeratingWithState:&v110 objects:buf count:16];
    if (!v29) {
      goto LABEL_66;
    }
    uint64_t v30 = v29;
    uint64_t v88 = *(void *)v111;
    char v86 = v19;
LABEL_28:
    uint64_t v31 = 0;
    while (1)
    {
      if (*(void *)v111 != v88) {
        objc_enumerationMutation(v19);
      }
      uint64_t v32 = *(void **)(*((void *)&v110 + 1) + 8 * v31);
      uint64_t v33 = [v32 phase];
      [v32 force];
      double v35 = v34;
      double v36 = v34 * 0.6 + 0.4;
      if (v35 <= 0.0) {
        double v37 = 1.0;
      }
      else {
        double v37 = v36;
      }
      if ([v32 type] == 2) {
        double v37 = v35 * 0.4 / 4.2 + 0.2;
      }
      memset(&v109, 0, sizeof(v109));
      CGAffineTransformMakeScale(&v109, v37, v37);
      [v32 locationInView:v7];
      double v39 = v38;
      double v41 = v40;
      if (v33)
      {
        BOOL v42 = [v22[473] objectForKey:v32];
        if (v42)
        {
          uint64_t v43 = v42;
          if ((unint64_t)(v33 - 3) > 1)
          {
            CGAffineTransform v97 = v109;
            [(UIView *)v42 setTransform:&v97];
            -[UIView setCenter:](v43, "setCenter:", v39, v41);
            uint64_t v48 = [(UIView *)v43 superview];

            if (v48 == v7) {
              [(UIView *)v7 bringSubviewToFront:v43];
            }
            else {
              [(UIView *)v7 addSubview:v43];
            }
          }
          else
          {
            v104[0] = MEMORY[0x1E4F143A8];
            v104[1] = 3221225472;
            v104[2] = ____updateTouchVisualisation_block_invoke_2;
            v104[3] = &unk_1E52D9F70;
            v105 = v42;
            v102[0] = MEMORY[0x1E4F143A8];
            v102[1] = 3221225472;
            v102[2] = ____updateTouchVisualisation_block_invoke_3;
            v102[3] = &unk_1E52DC3A0;
            uint64_t v43 = v105;
            int v103 = v43;
            +[UIView animateWithDuration:4 delay:v104 options:v102 animations:0.12 completion:0.0];
            [(id)qword_1EB259ED8 removeObject:v43];
            [(id)qword_1EB259EC8 removeObjectForKey:v32];
            id v44 = [(id)qword_1EB259EC8 objectEnumerator];
            uint64_t v45 = [v44 nextObject];
            if (v45)
            {

              goto LABEL_41;
            }
            uint64_t v49 = [(id)qword_1EB259ED8 count];

            if (v49)
            {
              long long v100 = 0u;
              long long v101 = 0u;
              long long v98 = 0u;
              long long v99 = 0u;
              id v44 = (id)qword_1EB259ED8;
              uint64_t v50 = [v44 countByEnumeratingWithState:&v98 objects:&v117 count:16];
              if (v50)
              {
                uint64_t v51 = v50;
                uint64_t v52 = *(void *)v99;
                do
                {
                  for (uint64_t k = 0; k != v51; ++k)
                  {
                    if (*(void *)v99 != v52) {
                      objc_enumerationMutation(v44);
                    }
                    id v54 = *(void **)(*((void *)&v98 + 1) + 8 * k);
                    [v54 removeFromSuperview];
                    [(id)qword_1EB259ED0 addObject:v54];
                  }
                  uint64_t v51 = [v44 countByEnumeratingWithState:&v98 objects:&v117 count:16];
                }
                while (v51);
                uint64_t v22 = (id *)&unk_1EB259000;
                char v19 = v86;
              }
LABEL_41:
            }
          }
LABEL_63:
        }
      }
      else
      {
        NSClassFromString(&cfstr_Uirootwindow.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v46 = [(id)qword_1EB259ED0 anyObject];
          if (v46)
          {
            uint64_t v47 = (_UITouchVisualizationView *)v46;
            [(id)qword_1EB259ED0 removeObject:v46];
          }
          else
          {
            uint64_t v55 = [_UITouchVisualizationView alloc];
            v132.size.double width = 0.0;
            v132.size.double height = 0.0;
            v132.origin.double x = v39;
            v132.origin.double y = v41;
            CGRect v133 = CGRectInset(v132, -22.0, -22.0);
            uint64_t v47 = -[UIView initWithFrame:](v55, "initWithFrame:", v133.origin.x, v133.origin.y, v133.size.width, v133.size.height);
            [(UIView *)v47 setUserInteractionEnabled:0];
            uint64_t v56 = [(UIView *)v47 layer];
            [v56 setAllowsHitTesting:0];
            [v56 setBorderWidth:2.0];
            [v56 setCornerRadius:22.0];
          }
          if ([v32 type] == 2)
          {
            uint64_t v57 = +[UIColor colorWithHue:0.95 saturation:0.46 brightness:0.99 alpha:0.4];
            [(UIView *)v47 setBackgroundColor:v57];

            +[UIColor colorWithHue:0.95 saturation:0.46 brightness:0.5 alpha:0.8];
          }
          else
          {
            uint64_t v58 = +[UIColor colorWithWhite:1.0 alpha:0.6];
            [(UIView *)v47 setBackgroundColor:v58];

            +[UIColor colorWithWhite:0.0 alpha:0.6];
          }
          id v59 = objc_claimAutoreleasedReturnValue();
          uint64_t v60 = [v59 CGColor];
          int v61 = [(UIView *)v47 layer];
          [v61 setBorderColor:v60];

          CGAffineTransformMakeScale(&v115, 0.001, 0.001);
          CGAffineTransform v114 = v115;
          [(UIView *)v47 setTransform:&v114];
          [(UIView *)v47 setAlpha:0.0];
          -[UIView setCenter:](v47, "setCenter:", v39, v41);
          [(UIView *)v7 addSubview:v47];
          [(id)qword_1EB259EC8 setObject:v47 forKey:v32];
          [(id)qword_1EB259ED8 addObject:v47];
          v106[0] = MEMORY[0x1E4F143A8];
          v106[1] = 3221225472;
          v106[2] = ____updateTouchVisualisation_block_invoke_1523;
          v106[3] = &unk_1E52E7948;
          long long v107 = v47;
          CGAffineTransform v108 = v109;
          uint64_t v43 = v47;
          +[UIView animateWithDuration:v106 animations:0.12];

          char v19 = v86;
          goto LABEL_63;
        }
      }
      if (++v31 == v30)
      {
        uint64_t v30 = [v19 countByEnumeratingWithState:&v110 objects:buf count:16];
        if (!v30) {
          goto LABEL_66;
        }
        goto LABEL_28;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(UIView *)self isUserInteractionEnabled])
    {
      uint64_t v20 = [(id)UIApp _gestureEnvironment];
      -[UIGestureEnvironment _updateForEvent:window:]((uint64_t)v20, v4, (uint64_t)self);

      [(UIWindow *)self _sendButtonsForEvent:v4];
    }
    goto LABEL_89;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v77 = [(UIWindow *)self _focusResponder];
    [(UIEvent *)v4 _sendEventToResponder:v77];
LABEL_88:

    goto LABEL_89;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_87:
    BOOL v77 = [(id)UIApp _gestureEnvironment];
    -[UIGestureEnvironment _updateForEvent:window:]((uint64_t)v77, v4, (uint64_t)self);
    goto LABEL_88;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UIEvent *)v4 setNeedsUpdateForWindow:self];
    goto LABEL_87;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_87;
  }
  char v78 = [(UIWindow *)self firstResponder];
  if (!v78)
  {
    char v78 = [(UIWindow *)self _deepestActionResponder];
  }
  [(UIEvent *)v4 _sendEventToResponder:v78];

LABEL_89:
  _UIRestorePreviousFallbackEnvironment(v6);
}

- (void)_sendTouchesForEvent:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259E00);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    CGAffineTransform v67 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v67, OS_LOG_TYPE_ERROR, "UIWindow sendEvent:", buf, 2u);
    }
  }
  double v6 = (id *)&UIApp;
  int v7 = [(id)UIApp _responderBasedEventDeliverer];
  char v8 = [v4 _respondersForWindow:self];
  unint64_t v9 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259E08);
  if (*(unsigned char *)v9)
  {
    uint64_t v68 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v83 = v8;
      _os_log_impl(&dword_1853B0000, v68, OS_LOG_TYPE_ERROR, "\tviews: %@", buf, 0xCu);
    }
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v77 objects:v88 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v78;
    *(void *)&long long v12 = 134218498;
    long long v69 = v12;
    id v70 = v7;
    uint64_t v72 = *(void *)v78;
    do
    {
      uint64_t v15 = 0;
      uint64_t v71 = v13;
      do
      {
        if (*(void *)v78 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v77 + 1) + 8 * v15);
        if (v7)
        {
          [v7 deliverTouchesEvent:v4 toResponder:*(void *)(*((void *)&v77 + 1) + 8 * v15)];
        }
        else
        {
          BOOL v17 = [v4 _touchesForResponder:*(void *)(*((void *)&v77 + 1) + 8 * v15) withPhase:0];
          unint64_t v18 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259E10);
          if (*(unsigned char *)v18)
          {
            double v38 = *(NSObject **)(v18 + 8);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              double v39 = v38;
              int v40 = [v17 count];
              *(_DWORD *)buf = 67109120;
              LODWORD(v83) = v40;
              _os_log_impl(&dword_1853B0000, v39, OS_LOG_TYPE_ERROR, "\t\tBegan touch count: %d", buf, 8u);
            }
          }
          if (objc_msgSend(v17, "count", v69))
          {
            unint64_t v19 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259E18);
            if (*(unsigned char *)v19)
            {
              uint64_t v50 = *(NSObject **)(v19 + 8);
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              {
                uint64_t v51 = v50;
                uint64_t v52 = (objc_class *)objc_opt_class();
                uint64_t v53 = NSStringFromClass(v52);
                *(_DWORD *)buf = v69;
                int64_t v83 = v16;
                __int16 v84 = 2112;
                BOOL v85 = v53;
                __int16 v86 = 2112;
                char v87 = v17;
                _os_log_impl(&dword_1853B0000, v51, OS_LOG_TYPE_ERROR, "\t\tCalling touchesBegan:withEvent: on view: %p (%@) with touches: %@", buf, 0x20u);

                uint64_t v13 = v71;
              }
            }
            [v16 touchesBegan:v17 withEvent:v4];
            [*v6 _registerEstimatedTouches:v17 event:v4 forTouchable:v16];
          }
          uint64_t v20 = [v4 _touchesForResponder:v16 withPhase:1];

          unint64_t v21 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259E20);
          if (*(unsigned char *)v21)
          {
            double v41 = *(NSObject **)(v21 + 8);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              BOOL v42 = v41;
              int v43 = [v20 count];
              *(_DWORD *)buf = 67109120;
              LODWORD(v83) = v43;
              _os_log_impl(&dword_1853B0000, v42, OS_LOG_TYPE_ERROR, "\t\tMoved touch count: %d", buf, 8u);
            }
          }
          if ([v20 count])
          {
            unint64_t v22 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259E28);
            if (*(unsigned char *)v22)
            {
              id v54 = *(NSObject **)(v22 + 8);
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              {
                uint64_t v55 = v54;
                uint64_t v56 = (objc_class *)objc_opt_class();
                uint64_t v57 = NSStringFromClass(v56);
                *(_DWORD *)buf = v69;
                int64_t v83 = v16;
                __int16 v84 = 2112;
                BOOL v85 = v57;
                __int16 v86 = 2112;
                char v87 = v20;
                _os_log_impl(&dword_1853B0000, v55, OS_LOG_TYPE_ERROR, "\t\tCalling touchesMoved:withEvent: on view: %p (%@) with touches: %@", buf, 0x20u);

                uint64_t v13 = v71;
              }
            }
            [v16 touchesMoved:v20 withEvent:v4];
            [*v6 _registerEstimatedTouches:v20 event:v4 forTouchable:v16];
            [v16 _completeForwardingTouches:v20 phase:1 event:v4];
          }
          uint64_t v23 = [v4 _touchesForResponder:v16 withPhase:3];

          unint64_t v24 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259E30);
          if (*(unsigned char *)v24)
          {
            id v44 = *(NSObject **)(v24 + 8);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              uint64_t v45 = v44;
              int v46 = [v23 count];
              *(_DWORD *)buf = 67109120;
              LODWORD(v83) = v46;
              _os_log_impl(&dword_1853B0000, v45, OS_LOG_TYPE_ERROR, "\t\tEnded touch count: %d", buf, 8u);
            }
          }
          if ([v23 count])
          {
            id v25 = v10;
            double v26 = v6;
            unint64_t v27 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259E38);
            if (*(unsigned char *)v27)
            {
              uint64_t v58 = *(NSObject **)(v27 + 8);
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                id v59 = v58;
                uint64_t v60 = (objc_class *)objc_opt_class();
                int v61 = NSStringFromClass(v60);
                *(_DWORD *)buf = v69;
                int64_t v83 = v16;
                __int16 v84 = 2112;
                BOOL v85 = v61;
                __int16 v86 = 2112;
                char v87 = v23;
                _os_log_impl(&dword_1853B0000, v59, OS_LOG_TYPE_ERROR, "\t\tCalling touchesEnded:withEvent: on view: %p (%@) with touches: %@", buf, 0x20u);
              }
            }
            long long v75 = 0u;
            long long v76 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            id v28 = v23;
            uint64_t v29 = [v28 countByEnumeratingWithState:&v73 objects:v81 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v74;
              do
              {
                for (uint64_t i = 0; i != v30; ++i)
                {
                  if (*(void *)v74 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  uint64_t v33 = *(void *)(*((void *)&v73 + 1) + 8 * i);
                  if (v33)
                  {
                    __int16 v34 = *(_WORD *)(v33 + 236);
                    if ((v34 & 8) == 0) {
                      *(_WORD *)(v33 + 236) = v34 | 8;
                    }
                  }
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v73 objects:v81 count:16];
              }
              while (v30);
            }

            [v16 touchesEnded:v28 withEvent:v4];
            double v6 = v26;
            [*v26 _registerEstimatedTouches:v28 event:v4 forTouchable:v16];
            [v16 _completeForwardingTouches:v28 phase:3 event:v4];
            id v10 = v25;
            int v7 = v70;
            uint64_t v13 = v71;
          }
          double v35 = [v4 _touchesForResponder:v16 withPhase:4];

          unint64_t v36 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259E40);
          if (*(unsigned char *)v36)
          {
            uint64_t v47 = *(NSObject **)(v36 + 8);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              uint64_t v48 = v47;
              int v49 = [v35 count];
              *(_DWORD *)buf = 67109120;
              LODWORD(v83) = v49;
              _os_log_impl(&dword_1853B0000, v48, OS_LOG_TYPE_ERROR, "\t\tCanceled touch count: %d", buf, 8u);
            }
          }
          if ([v35 count])
          {
            unint64_t v37 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB259E48);
            if (*(unsigned char *)v37)
            {
              uint64_t v62 = *(NSObject **)(v37 + 8);
              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
              {
                uint64_t v63 = v62;
                uint64_t v64 = (objc_class *)objc_opt_class();
                BOOL v65 = NSStringFromClass(v64);
                *(_DWORD *)buf = v69;
                int64_t v83 = v16;
                __int16 v84 = 2112;
                BOOL v85 = v65;
                __int16 v86 = 2112;
                char v87 = v35;
                _os_log_impl(&dword_1853B0000, v63, OS_LOG_TYPE_ERROR, "\t\tCalling touchesCancelled on view: %p (%@) with touches: %@", buf, 0x20u);

                uint64_t v13 = v71;
              }
            }
            [v16 touchesCancelled:v35 withEvent:v4];
            [*v6 _registerEstimatedTouches:v35 event:v4 forTouchable:v16];
            [v16 _completeForwardingTouches:v35 phase:4 event:v4];
          }

          uint64_t v14 = v72;
        }
        ++v15;
      }
      while (v15 != v13);
      uint64_t v66 = [v10 countByEnumeratingWithState:&v77 objects:v88 count:16];
      uint64_t v13 = v66;
    }
    while (v66);
  }
}

- (unsigned)_contextId
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);
  unsigned int v3 = [WeakRetained contextId];

  return v3;
}

- (BOOL)_isSystemGestureWindow
{
  return 0;
}

- (CGRect)convertRect:(CGRect)rect fromWindow:(UIWindow *)window
{
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  if (window)
  {
    -[UIWindow convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    BOOL v17 = [(UIView *)self layer];
    objc_msgSend(v17, "convertRect:fromLayer:", self->_transformLayer, x, y, width, height);
    double v10 = v18;
    double v12 = v19;
    double v14 = v20;
    double v16 = v21;
  }
  double v22 = v10;
  double v23 = v12;
  double v24 = v14;
  double v25 = v16;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

+ (id)_externalKeyWindow
{
  return (id)qword_1EB259DD0;
}

- (void)_rotateWindowToOrientation:(int64_t)a3 updateStatusBar:(BOOL)a4 duration:(double)a5 skipCallbacks:(BOOL)a6
{
  BOOL v6 = a6;
  unint64_t v10 = *(void *)&self->_windowFlags & 0x40000000;
  if (a4) {
    uint64_t v11 = [(id)UIApp _statusBarOrientationFollowsWindow:self];
  }
  else {
    uint64_t v11 = 0;
  }
  BOOL v12 = [(UIWindow *)self _windowOwnsInterfaceOrientation];
  if (v10) {
    int v13 = v12;
  }
  else {
    int v13 = 1;
  }
  uint64_t v76 = 0;
  long long v77 = &v76;
  uint64_t v78 = 0x4010000000;
  long long v79 = &unk_186D7DBA7;
  long long v80 = 0u;
  long long v81 = 0u;
  char v14 = [(id)UIApp _hasApplicationCalledLaunchDelegate];
  int64_t viewOrientation = self->_viewOrientation;
  if (viewOrientation) {
    char v16 = 1;
  }
  else {
    char v16 = v14;
  }
  if ((v16 & 1) == 0)
  {
    double v41 = [(UIWindow *)self _windowHostingScene];
    uint64_t v42 = [v41 _interfaceOrientation];

    if (v42 != a3) {
      goto LABEL_12;
    }
LABEL_17:
    [(UIView *)self frame];
    int v43 = v77;
    v77[4] = v44;
    v43[5] = v45;
    v43[6] = v46;
    v43[7] = v47;
    [(UIView *)self bounds];
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;
    goto LABEL_20;
  }
  if (!viewOrientation) {
    goto LABEL_17;
  }
LABEL_12:
  if (v13)
  {
    if (!self->_viewOrientation)
    {
      BOOL v17 = [(UIWindow *)self screen];
      self->_int64_t viewOrientation = [v17 _interfaceOrientation];
    }
    [(UIView *)self bounds];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v26 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _coordinateSpace];
    -[UIWindow convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v26, v19, v21, v23, v25);
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;

    [(_UISceneUIWindowHosting *)self->_windowHostingScene _referenceBounds];
    double v37 = _UIWindowConvertRectFromOrientationToOrientation([(UIWindow *)self _orientationInSceneSpace], a3, v28, v30, v32, v34, v35, v36);
  }
  else
  {
    [(UIWindow *)self _sceneReferenceBounds];
    double v57 = v56;
    double v59 = v58;
    double v61 = v60;
    double v63 = v62;
    [(UIWindow *)self _sceneReferenceBounds];
    double v37 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(a3, v57, v59, v61, v63, v64, v65);
  }
  double v49 = v37;
  double v51 = v38;
  double v53 = v39;
  double v55 = v40;
  uint64_t v66 = (double *)v77;
  *((double *)v77 + 4) = v37;
  v66[5] = v38;
  v66[6] = v39;
  v66[7] = v40;
LABEL_20:
  self->_fromWindowOrientation = self->_viewOrientation;
  self->_toWindowOrientation = a3;
  double v67 = 0.0;
  if (!v6)
  {
    +[UIView _durationForRotationFromInterfaceOrientation:self->_fromWindowOrientation toInterfaceOrientation:a3 withBaseDuration:a5];
    double v67 = v68;
  }
  long long v69 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
  id v70 = +[_UIWindowAnimationController animationControllerWithWindow:self];
  [(_UIViewControllerTransitionContext *)v69 _setDuration:v67];
  [v70 setDuration:v67];
  [v70 setSkipCallbacks:v6];
  [v70 setUpdateStatusBarIfNecessary:v11];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __78__UIWindow__rotateWindowToOrientation_updateStatusBar_duration_skipCallbacks___block_invoke;
  v72[3] = &unk_1E5303810;
  v72[4] = self;
  v72[5] = &v76;
  v72[6] = a3;
  char v73 = v11;
  *(double *)&v72[7] = v67;
  char v74 = v10 >> 30;
  BOOL v75 = v6;
  [v70 setAnimations:v72];
  [(_UIViewControllerTransitionContext *)v69 _setIsAnimated:v67 > 0.0];
  [(_UIViewControllerTransitionContext *)v69 _setRotating:1];
  uint64_t v71 = [(UIWindow *)self rootViewController];
  [(_UIViewControllerOneToOneTransitionContext *)v69 _setFromViewController:v71];

  [(_UIViewControllerOneToOneTransitionContext *)v69 _setToViewController:0];
  [(_UIViewControllerTransitionContext *)v69 _setContainerView:self];
  [(UIView *)self frame];
  -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](v69, "_setFromStartFrame:");
  -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v69, "_setToEndFrame:", v49, v51, v53, v55);
  [(UIView *)self frame];
  -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v69, "_setToStartFrame:");
  -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](v69, "_setFromEndFrame:", v49, v51, v53, v55);
  [(_UIViewControllerTransitionContext *)v69 _setAnimator:v70];
  -[UIWindow _rotateToBounds:withAnimator:transitionContext:](self, "_rotateToBounds:withAnimator:transitionContext:", v70, v69, v49, v51, v53, v55);

  _Block_object_dispose(&v76, 8);
}

- (void)_updateToInterfaceOrientation:(int64_t)viewOrientation duration:(double)a4 force:(BOOL)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  double v9 = [(UIWindow *)self _orientationTransactionToken];
  uint64_t v10 = [v9 state];

  if (v10 == 1)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("OrientationTransaction", &_updateToInterfaceOrientation_duration_force____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      double v31 = *(id *)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        if (self)
        {
          double v32 = NSString;
          double v33 = self;
          double v34 = (objc_class *)objc_opt_class();
          double v35 = NSStringFromClass(v34);
          double v36 = [v32 stringWithFormat:@"<%@: %p>", v35, v33];
        }
        else
        {
          double v36 = @"(nil)";
        }
        double v37 = v36;
        double v38 = BSInterfaceOrientationDescription();
        double v39 = BSInterfaceOrientationDescription();
        [(UIWindow *)self _orientationTransactionToken];
        *(_DWORD *)id location = 138413058;
        *(void *)&location[4] = v36;
        __int16 v61 = 2112;
        double v62 = v38;
        __int16 v63 = 2112;
        double v64 = v39;
        v66 = __int16 v65 = 2112;
        double v40 = (void *)v66;
        _os_log_impl(&dword_1853B0000, v31, OS_LOG_TYPE_ERROR, "%@: _updateToInterfaceOrientation called while a forced orientation transaction is active. Overriding the requested orientation to preserve the forced orientation. requested=%@; forced=%@; token=%@",
          location,
          0x2Au);
      }
    }
    int64_t viewOrientation = self->_viewOrientation;
    a5 = 1;
  }
  if ((*((unsigned char *)&self->_windowFlags + 4) & 0x20) != 0)
  {
    -[UIWindow _cancelEnqueuedDeferredOrientationUpdateIfNeeded]((uint64_t)self);
    BOOL v12 = [(UIWindow *)self _deferredOrientationUpdate];
    int v13 = [(UIWindow *)self _windowHostingScene];
    -[_UIWindowOrientationUpdate synchronizeDrawingWithFencesOnScene:]((uint64_t)v12, v13);

    [(UIWindow *)self _setDeferredOrientationUpdate:0];
  }
  char v14 = (void *)self->_viewOrientation;
  int64_t v15 = viewOrientation;
  if (self->_rootViewController)
  {
    int64_t v15 = viewOrientation;
    if ([(UIWindow *)self _windowOwnsInterfaceOrientation])
    {
      -[UIViewController viewControllerForRotation](self->_rootViewController);
      char v16 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      BOOL v17 = v16 == self->_rootViewController;

      int64_t v15 = viewOrientation;
      if (v17) {
        int64_t v15 = [(UIViewController *)self->_rootViewController _preferredInterfaceOrientationGivenCurrentOrientation:viewOrientation];
      }
    }
  }
  objc_initWeak((id *)location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__UIWindow__updateToInterfaceOrientation_duration_force___block_invoke;
  aBlock[3] = &unk_1E53037E8;
  objc_copyWeak(v58, (id *)location);
  BOOL v59 = a5;
  v58[1] = *(id *)&a4;
  v58[2] = v14;
  double v18 = _Block_copy(aBlock);
  if (!UIApp
    || ([(id)UIApp _hasApplicationCalledLaunchDelegate] & 1) != 0
    || ([(id)UIApp _hasNormalRestorationCompleted] & 1) != 0)
  {
    double v19 = [(UIWindow *)self _windowHostingScene];
    int v20 = [v19 _shouldDeferInitialWindowUpdateBeforeConnectionAndTrackIfNeeded:self];

    if (v20)
    {
      double v21 = [(UIWindow *)self _deferredOrientationUpdate];
      BOOL v22 = v21 == 0;

      if (v22)
      {
        double v23 = -[_UIWindowOrientationUpdate initWithOrientation:transitionAnimationSettings:updateBlock:]([_UIWindowOrientationUpdate alloc], v15, 0, v18);
        [(UIWindow *)self _setDeferredOrientationUpdate:v23];
LABEL_30:
      }
    }
    else
    {
      if ([(id)UIApp _hasApplicationCalledLaunchDelegate]
        && [(id)UIApp _hasNormalRestorationCompleted]
        && self->_viewOrientation
        && ![(UIWindow *)self _windowOwnsInterfaceOrientation]
        && [(UIWindow *)self isRotating])
      {
        double v24 = +[UIView _currentAnimationSettings];
        double v25 = -[_UIWindowOrientationUpdate initWithOrientation:transitionAnimationSettings:updateBlock:]([_UIWindowOrientationUpdate alloc], v15, v24, v18);
        double v26 = [(id)UIApp _systemAnimationFenceCreatingIfNecessary:0];
        if (v26) {
          -[_UIWindowOrientationUpdate trackFence:]((uint64_t)v25, v26);
        }
        -[_UIWindowOrientationUpdate trackFence:]((uint64_t)v25, v26);
        double v27 = [(UIWindow *)self _deferredOrientationUpdate];

        if (v27)
        {
          double v28 = [(UIWindow *)self _deferredOrientationUpdate];
          -[_UIWindowOrientationUpdate transferFencesToUpdate:]((uint64_t)v28, v25);
        }
        [(UIWindow *)self _setDeferredOrientationUpdate:v25];
      }
      else
      {
        (*((void (**)(void *, int64_t, int64_t))v18 + 2))(v18, v15, viewOrientation);
      }
      long long v54 = 0u;
      long long v55 = 0u;
      long long v53 = 0u;
      long long v52 = 0u;
      long long v51 = 0u;
      long long v50 = 0u;
      long long v49 = 0u;
      long long v48 = 0u;
      long long v47 = 0u;
      long long v46 = 0u;
      long long v45 = 0u;
      long long v44 = 0u;
      long long v43 = 0u;
      long long v42 = 0u;
      uint64_t v41 = 4096;
      uint64_t v56 = 0;
      *(void *)&long long v54 = v14;
      -[UIView _notifyGeometryObserversWithChangeInfo:]((uint64_t)self, &v41);
    }
  }
  else
  {
    double v29 = [(UIWindow *)self _deferredOrientationUpdate];
    BOOL v30 = v29 == 0;

    if (v30)
    {
      double v23 = -[_UIWindowOrientationUpdate initWithOrientation:transitionAnimationSettings:updateBlock:]([_UIWindowOrientationUpdate alloc], v15, 0, v18);
      [(UIWindow *)self _setDeferredOrientationUpdate:v23];
      [(id)UIApp _setExpectedViewOrientation:viewOrientation];
      goto LABEL_30;
    }
  }

  objc_destroyWeak(v58);
  objc_destroyWeak((id *)location);
}

- (void)_rotateToBounds:(CGRect)a3 withAnimator:(id)a4 transitionContext:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  id v9 = a5;
  id v10 = a4;
  char v11 = [v10 skipCallbacks];
  int64_t v12 = [(UIWindow *)self _toWindowOrientation];
  int v13 = [(UIWindow *)self windowScene];
  unsigned __int8 v14 = -[UIScene _systemShellOwnsInterfaceOrientation](v13);

  if ((v14 & 1) == 0) {
    [(UIWindow *)self beginDisablingInterfaceAutorotation];
  }
  kdebug_trace();
  int64_t v15 = [(UIWindow *)self screen];
  char v16 = [v9 _transitionCoordinator];
  -[UIWindow _willChangeToSize:orientation:screen:withTransitionCoordinator:](self, "_willChangeToSize:orientation:screen:withTransitionCoordinator:", v12, v15, v16, width, height);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__UIWindow__rotateToBounds_withAnimator_transitionContext___block_invoke;
  aBlock[3] = &unk_1E5303768;
  char v28 = v11;
  void aBlock[4] = self;
  double v25 = width;
  double v26 = height;
  id v17 = v9;
  id v24 = v17;
  int64_t v27 = v12;
  double v18 = (void (**)(void))_Block_copy(aBlock);
  if ([(UIWindow *)self _guardSizeTransitionFromAnimations]) {
    +[UIView performWithoutAnimation:v18];
  }
  else {
    v18[2](v18);
  }
  kdebug_trace();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __59__UIWindow__rotateToBounds_withAnimator_transitionContext___block_invoke_2;
  v22[3] = &unk_1E52EA9D8;
  v22[4] = self;
  [v17 _setCompletionHandler:v22];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__UIWindow__rotateToBounds_withAnimator_transitionContext___block_invoke_3;
  v19[3] = &unk_1E5303790;
  v19[4] = self;
  char v20 = v11;
  char v21 = v14 ^ 1;
  [v17 _setDidCompleteHandler:v19];
  [v10 animateTransition:v17];
}

- (int64_t)_toWindowOrientation
{
  return self->_toWindowOrientation;
}

- (BOOL)_guardSizeTransitionFromAnimations
{
  int v2 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _FBSScene];
  LOBYTE(v3) = 0;
  if (([(id)UIApp _isSpringBoard] & 1) == 0 && v2) {
    int v3 = [v2 uiCanReceiveDeviceOrientationEvents] ^ 1;
  }

  return v3;
}

- (void)_setAnimationController:(id)a3
{
}

- (void)_initializeLayoutEngine
{
}

- (BOOL)_isRemoteInputHostWindow
{
  return 0;
}

- (void)_registerScrollToTopView:(id)a3
{
  id v7 = a3;
  if (qword_1EB259DE8)
  {
    id v4 = CFDictionaryGetValue((CFDictionaryRef)qword_1EB259DE8, self);
    if (v4) {
      goto LABEL_6;
    }
  }
  else
  {
    qword_1EB259DE8 = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  }
  id v4 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1EB259DE8, self, v4);
LABEL_6:
  BOOL v5 = [v4 allObjects];
  uint64_t v6 = [v5 indexOfObject:v7];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    [v4 addPointer:v7];
  }
}

- (void)_unregisterScrollToTopView:(id)a3
{
  id v4 = a3;
  if (qword_1EB259DE8)
  {
    id v9 = v4;
    BOOL v5 = CFDictionaryGetValue((CFDictionaryRef)qword_1EB259DE8, self);
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = [v5 allObjects];
      uint64_t v8 = [v7 indexOfObject:v9];

      if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
        [v6 removePointerAtIndex:v8];
      }
    }

    id v4 = v9;
  }
}

+ (void)_synchronizeDrawing
{
}

+ (void)_synchronizeDrawingWithPreCommitHandler:(id)a3
{
  id v6 = a3;
  id v4 = [(id)UIApp _cachedSystemAnimationFenceCreatingIfNecessary:0];
  if (v4)
  {
    [a1 _synchronizeDrawingWithFence:v4 preCommitHandler:v6];
  }
  else if (v6)
  {
    BOOL v5 = (void *)[MEMORY[0x1E4F39BB8] newFenceFromDefaultServer];
    [a1 _synchronizeDrawingWithCAFence:v5 preCommitHandler:v6];
    [v5 invalidate];
  }
  else
  {
    [MEMORY[0x1E4F39CF8] batch];
  }
}

- (id)_remoteContentParent
{
  int v3 = [(UIWindow *)self _windowHostingScene];
  id v4 = [v3 _childRemoteContentRegistry];

  if (v4)
  {
    id v5 = v3;
LABEL_5:
    id v7 = v5;
    id v9 = v5;
    goto LABEL_6;
  }
  id v6 = [(UIWindow *)self _windowHostingScene];
  id v7 = [v6 _settingsScene];

  uint64_t v8 = [v7 _childRemoteContentRegistry];

  if (v8)
  {
    id v5 = v7;
    goto LABEL_5;
  }
  char v11 = [(UIWindow *)self windowScene];
  -[UIWindowScene _keyWindow](v11);
  int64_t v12 = (UIWindow *)objc_claimAutoreleasedReturnValue();

  if (!v12 || v12 == self || ![(UIWindow *)v12 _isHostedInAnotherProcess])
  {
    if ([(UIWindow *)self _isRemoteKeyboardWindow]
      && +[_UIRemoteKeyboards wantsUnassociatedWindowSceneForKeyboardWindow])
    {
      int v13 = +[UIWindow _applicationKeyWindow];
      if (v13 != self)
      {
        unsigned __int8 v14 = v13;
        id v9 = [(UIWindow *)v13 _remoteContentParent];

        goto LABEL_19;
      }
    }
    id v9 = 0;
    goto LABEL_19;
  }
  id v9 = [(UIWindow *)v12 _remoteContentParent];
LABEL_19:

LABEL_6:
  return v9;
}

- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)UIWindow;
  -[UIView _traitCollectionDidChangeOnSubtreeInternal:](&v16, sel__traitCollectionDidChangeOnSubtreeInternal_);
  uint64_t v5 = [a3->var1 userInterfaceStyle];
  if (v5 != [a3->var0 userInterfaceStyle])
  {
    id v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v7 = [(UIWindow *)self screen];
    uint64_t v8 = [v7 _userInterfaceIdiom];

    if (v8 == 3)
    {
      id v9 = [(UIWindow *)self windowScene];
      uint64_t v10 = [v9 keyboardSceneDelegate];

      id v6 = (void *)v10;
    }
    uint64_t v11 = [v6 responder];
    if (v11)
    {
      int64_t v12 = (void *)v11;
      int v13 = [v6 responder];
      unsigned __int8 v14 = [v13 _responderWindow];

      if (v14 == self)
      {
        int64_t v15 = [(UIWindow *)self rootViewController];
        [v15 _updateTraitsIfNecessary];

        [v6 traitCollectionDidChange];
      }
    }
  }
}

+ (BOOL)shouldRestrictViewsForSplashboard
{
  return _shouldRestrictViewsForSplashboard;
}

void __39__UIWindow__noteOverlayInsetsDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _overlayInsets];
  objc_msgSend(v4, "setPrimaryWindowOverlayInsets:");

  *(unsigned char *)(*(void *)(a1 + 32) + 432) = 0;
}

void __31__UIWindow__setFirstResponder___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  int v3 = *(void **)(a1 + 32);
  if (v3) {
    uint64_t v4 = [v3 editingInteractionConfiguration];
  }
  else {
    uint64_t v4 = 1;
  }
  [v5 setEditingInteractionConfiguration:v4];
}

- (double)_rotationDuration
{
  if (dyld_program_sdk_at_least()) {
    int v3 = [(id)UIApp _hasApplicationCalledLaunchDelegate] ^ 1;
  }
  else {
    int v3 = 0;
  }
  BOOL v4 = (([(id)UIApp _appAdoptsUICanvasLifecycle] & 1) != 0
     || [(id)UIApp _appAdoptsUISceneLifecycle])
    && (unint64_t)[(_UISceneUIWindowHosting *)self->_windowHostingScene activationState] > 1;
  if ((v3 | v4)) {
    return 0.0;
  }
  id v6 = (void *)UIApp;
  [v6 windowRotationDuration];
  return result;
}

- (void)_traitOverridesWillChange:(id)a3 withApplicator:(id)a4
{
  id v7 = a4;
  if ([(UIWindow *)self _shouldPropagateTraitCollectionChanges])
  {
    id v5 = -[UIWindow _windowParentTraitCollection]((id *)&self->super.super.super.isa);
    id v6 = -[UIWindow _traitCollectionForSize:parentCollection:traitOverrideApplicator:](self, "_traitCollectionForSize:parentCollection:traitOverrideApplicator:", v5, v7, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

    [(UIWindow *)self _willTransitionToTraitCollection:v6 withTransitionCoordinator:0];
  }
}

- (void)_parentWillTransitionToTraitCollection:(id)a3
{
  id v5 = a3;
  if ([(UIWindow *)self _shouldPropagateTraitCollectionChanges])
  {
    BOOL v4 = -[UIWindow _traitCollectionForSize:parentCollection:](self, "_traitCollectionForSize:parentCollection:", v5, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [(UIWindow *)self _willTransitionToTraitCollection:v4 withTransitionCoordinator:0];
  }
}

- (void)_willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  objc_super v16 = (UITraitCollection *)a3;
  id v6 = (_UIViewControllerNullAnimationTransitionCoordinator *)a4;
  id v7 = [(UIWindow *)self traitCollection];
  if (v7 == v16)
  {
    int v9 = 1;
  }
  else
  {
    uint64_t v8 = [(UIWindow *)self traitCollection];
    int v9 = [v8 isEqual:v16];
  }
  destinationTraitCollection = self->_destinationTraitCollection;
  if (destinationTraitCollection != v16
    && ((v9 | -[UITraitCollection isEqual:](destinationTraitCollection, "isEqual:")) & 1) == 0)
  {
    if (!v6)
    {
      uint64_t v11 = objc_alloc_init(_UIViewControllerNullAnimationTransitionCoordinator);
      [(UIWindow *)self _setTraitCollectionChangeTransitionCoordinator:v11];

      id v6 = self->_traitCollectionChangeTransitionCoordinator;
      [(_UIViewControllerNullAnimationTransitionCoordinator *)self->_traitCollectionChangeTransitionCoordinator setContainerView:self];
    }
    int64_t v12 = (UITraitCollection *)[(UITraitCollection *)v16 copy];
    int v13 = self->_destinationTraitCollection;
    self->_destinationTraitCollection = v12;

    if ([(UIWindow *)self _shouldInstallRootPresentationController])
    {
      [(UIWindow *)self _rootPresentationController];
    }
    else
    {
      unsigned __int8 v14 = [(UIWindow *)self rootViewController];
      [v14 _parent:self willTransitionToTraitCollection:self->_destinationTraitCollection withTransitionCoordinator:v6];

      [(UIWindow *)self rootViewController];
    int64_t v15 = };
    [v15 _window:self willTransitionToTraitCollection:self->_destinationTraitCollection withTransitionCoordinator:v6];
  }
}

- (void)_setTraitCollectionChangeTransitionCoordinator:(id)a3
{
  id v5 = (_UIViewControllerNullAnimationTransitionCoordinator *)a3;
  p_traitCollectionChangeTransitionCoordinator = &self->_traitCollectionChangeTransitionCoordinator;
  if (*p_traitCollectionChangeTransitionCoordinator != v5)
  {
    id v7 = v5;
    [(_UIViewControllerNullAnimationTransitionCoordinator *)*p_traitCollectionChangeTransitionCoordinator _runAlongsideCompletionsAfterCommit];
    objc_storeStrong((id *)p_traitCollectionChangeTransitionCoordinator, a3);
    id v5 = v7;
  }
}

- (void)beginDisablingInterfaceAutorotation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(UIWindow *)self _windowCanDynamicallySpecifySupportedInterfaceOrientations])
  {
    if ((*((unsigned char *)&self->_windowFlags + 1) & 0xF0) == 0)
    {
      int v3 = [(UIWindow *)self windowScene];
      int v4 = [v3 _canDynamicallySpecifySupportedInterfaceOrientations];

      if (v4)
      {
        id v5 = [(UIWindow *)self windowScene];
        unint64_t v6 = [v5 interfaceOrientation];

        id v7 = [(UIWindow *)self windowScene];
        uint64_t v8 = [v7 _systemAppearanceManager];
        int v9 = v8;
        if (v6 > 4) {
          uint64_t v10 = 0;
        }
        else {
          uint64_t v10 = qword_186B9BC28[v6];
        }
        [v8 window:self didUpdateSupportedOrientations:v10 preferredOrientation:0 prefersAnimation:0];
      }
    }
    if ((~*(_DWORD *)&self->_windowFlags & 0xF000) != 0)
    {
      self->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&self->_windowFlags & 0xFFFFFFFFFFFF0FFFLL | ((((unint64_t)(*(void *)&self->_windowFlags + 4096) >> 12) & 0xF) << 12));
    }
    else
    {
      uint64_t v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("AutoRotation", &beginDisablingInterfaceAutorotation___s_category)+ 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v12 = v11;
        int v13 = (objc_class *)objc_opt_class();
        unsigned __int8 v14 = NSStringFromClass(v13);
        int v15 = 136315650;
        objc_super v16 = "-[UIWindow beginDisablingInterfaceAutorotation]";
        __int16 v17 = 2112;
        double v18 = v14;
        __int16 v19 = 2048;
        char v20 = self;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "%s overflow on <%@: %p>. Ignoring.", (uint8_t *)&v15, 0x20u);
      }
    }
  }
}

- (void)_setSystemGestureRecognitionIsPossible:(BOOL)a3 andTouchesAreCancelled:(BOOL)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  char v4 = *((unsigned char *)self + 656);
  if (((((v4 & 1) == 0) ^ a3) & 1) == 0)
  {
    BOOL v5 = a4;
    *((unsigned char *)self + 656) = v4 & 0xFE | a3;
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = @"_UIWindowSystemGestureCancellingTouchesUserInfoKey";
    uint64_t v8 = [NSNumber numberWithBool:v5];
    v11[0] = v8;
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v7 postNotificationName:@"_UIWindowSystemGestureStateChangedNotification" object:self userInfo:v9];
  }
}

- (void)setRootViewController:(UIViewController *)rootViewController
{
  BOOL v5 = rootViewController;
  p_rootViewController = &self->_rootViewController;
  if (self->_rootViewController != v5)
  {
    __int16 v17 = v5;
    uint64_t v7 = [(UIViewController *)v5 _preferredInterfaceOrientationGivenCurrentOrientation:[(UIWindow *)self _initialGuessInterfaceOrientation]];
    uint64_t v8 = [(UIViewController *)v17 _existingView];
    if (v8) {
      uint64_t v9 = [(UIViewController *)v17 _lastKnownInterfaceOrientation];
    }
    else {
      uint64_t v9 = 0;
    }

    [(UIWindow *)self _removeAllViewControllersFromWindowHierarchyFromDealloc:0];
    uint64_t v10 = *p_rootViewController;
    id v11 = self;
    if (*p_rootViewController) {
      objc_storeWeak((id *)&(*p_rootViewController)->_windowOfRootViewController, 0);
    }
    int64_t v12 = [(UIWindow *)self screen];
    uint64_t v13 = [v12 _userInterfaceIdiom];
    unsigned __int8 v14 = [(UIWindow *)self screen];
    [(UIViewController *)v17 __willChangeToIdiom:v13 onScreen:v14];

    objc_storeStrong((id *)&self->_rootViewController, rootViewController);
    if (*p_rootViewController) {
      objc_storeWeak((id *)&(*p_rootViewController)->_windowOfRootViewController, self);
    }
    if ([(UIWindow *)self _shouldInstallRootPresentationController])
    {
      int v15 = [[_UIRootPresentationController alloc] initWithPresentedViewController:v17 presentingWindow:self];
      [(UIWindow *)self _setRootPresentationController:v15];

      [(UIWindow *)self _didCreateRootPresentationController];
    }
    if ([(UIView *)self isHidden])
    {
      if (dyld_program_sdk_at_least()) {
        -[UIViewController _tryBecomeRootViewControllerInWindow:]((uint64_t)*p_rootViewController, self);
      }
    }
    else
    {
      [(UIWindow *)self addRootViewControllerViewIfPossible];
    }
    if (v7 != v9)
    {
      objc_super v16 = [(UIWindow *)self _orientationTransactionToken];

      if (!v16) {
        [(UIWindow *)self _updateToInterfaceOrientation:v7 duration:1 force:0.0];
      }
    }
    [(UIResponder *)self _didChangeDeepestActionResponder];
    BOOL v5 = v17;
  }
}

- (void)_removeAllViewControllersFromWindowHierarchyFromDealloc:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least())
  {
    if (v3)
    {
      BOOL v5 = [(UIWindow *)self rootViewController];
      [v5 _prepareForWindowDealloc];
    }
    else
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __68__UIWindow__removeAllViewControllersFromWindowHierarchyFromDealloc___block_invoke;
      _OWORD v27[3] = &unk_1E52D9F70;
      v27[4] = self;
      +[UIViewController _performWithoutDeferringTransitions:v27];
    }
  }
  unint64_t v6 = [(UIWindow *)self _rootPresentationController];

  if (v6)
  {
    uint64_t v7 = [(UIWindow *)self _rootPresentationController];
    int v8 = [v7 presented];

    if (v8)
    {
      if (v3)
      {
        uint64_t v9 = [(UIWindow *)self _rootPresentationController];
        [v9 _prepareForWindowDeallocRecursively:0];
      }
      else
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __68__UIWindow__removeAllViewControllersFromWindowHierarchyFromDealloc___block_invoke_2;
        v26[3] = &unk_1E52D9F70;
        v26[4] = self;
        +[UIViewController _performWithoutDeferringTransitions:v26];
      }
    }
    [(UIWindow *)self _setRootPresentationController:0];
  }
  else if ([(UIViewController *)self->_rootViewController isViewLoaded])
  {
    uint64_t v10 = [(UIViewController *)self->_rootViewController view];
    id v11 = [v10 superview];

    if (v11 == self)
    {
      int64_t v12 = [(UIViewController *)self->_rootViewController view];
      [v12 removeFromSuperview];
    }
  }
  id WeakRetained = (UIViewController *)objc_loadWeakRetained((id *)&self->_delegateViewController);
  rootViewController = self->_rootViewController;

  if (WeakRetained == rootViewController) {
    [(UIWindow *)self _setDelegateViewController:0];
  }
  int v15 = [(UIView *)self subviews];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        char v20 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v21 = +[UIViewController viewControllerForView:v20];
        if (v21)
        {
        }
        else
        {
          NSClassFromString(&cfstr_Uidimmingview.isa);
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        [v20 removeFromSuperview];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v17);
  }
}

void __68__UIWindow__removeAllViewControllersFromWindowHierarchyFromDealloc___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) rootViewController];
  [v1 dismissViewControllerAnimated:0 completion:0];
}

- (int64_t)_initialGuessInterfaceOrientation
{
  if ([(id)UIApp _frontMostAppInterfaceOrientationIsSignificant])
  {
    BOOL v3 = (void *)UIApp;
    return [v3 _carefulChoiceOrientationForWindow:self];
  }
  else
  {
    windowHostingScene = self->_windowHostingScene;
    return [(_UISceneUIWindowHosting *)windowHostingScene _interfaceOrientation];
  }
}

- (void)_setRootPresentationController:(id)a3
{
}

- (void)_didCreateRootPresentationController
{
  id v2 = [(UIWindow *)self _rootPresentationController];
  [v2 _setWantsFullScreen:1];
}

void __68__UIWindow__removeAllViewControllersFromWindowHierarchyFromDealloc___block_invoke_2(uint64_t a1)
{
  BOOL v3 = [[UIViewControllerBuiltinTransitionViewAnimator alloc] initWithTransition:0];
  id v2 = [*(id *)(a1 + 32) _rootPresentationController];
  [v2 _dismissWithAnimationController:v3 interactionController:0 animated:0 handoffData:0];
}

- (BOOL)_isAlwaysKeyboardWindow
{
  return 0;
}

- (id)_debugName
{
  id v2 = (void *)[(NSString *)self->_debugName copy];
  return v2;
}

- (void)_restoreFirstResponder
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_lastFirstResponder = &self->_lastFirstResponder;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastFirstResponder);

  if (WeakRetained)
  {
    id v5 = [(UIWindow *)self firstResponder];
    id v6 = objc_loadWeakRetained((id *)&self->_lastNextResponder);

    if (v5 == v6)
    {
      id v11 = objc_loadWeakRetained((id *)p_lastFirstResponder);
      +[UIResponder _callBecomeFirstResponder:v11 withIntent:2];

      id v12 = objc_loadWeakRetained((id *)p_lastFirstResponder);
      LOBYTE(v11) = objc_opt_respondsToSelector();

      if (v11)
      {
        id v13 = objc_loadWeakRetained((id *)p_lastFirstResponder);
        [v13 setInteractionState:self->_lastFirstResponderInteractionState];
      }
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("FirstResponderRestoration", &qword_1EB259EA8);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        uint64_t v16 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = v16;
          id v18 = objc_loadWeakRetained((id *)p_lastFirstResponder);
          int v19 = 138412290;
          id v20 = v18;
          _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Restoring the previous firstResponder: %@", (uint8_t *)&v19, 0xCu);
        }
      }
    }
    else
    {
      unint64_t v7 = __UILogGetCategoryCachedImpl("FirstResponderRestoration", &qword_1EB259EB0);
      if (*(unsigned char *)v7)
      {
        int v8 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v19) = 0;
          uint64_t v9 = "Not restoring the previous firstResponder since the _lastNextResponder and current firstResponder differ";
LABEL_9:
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v19, 2u);
        }
      }
    }
  }
  else
  {
    unint64_t v10 = __UILogGetCategoryCachedImpl("FirstResponderRestoration", &qword_1EB259EB8);
    if (*(unsigned char *)v10)
    {
      int v8 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19) = 0;
        uint64_t v9 = "Can't restore firstResponder since _lastFirstResponder is nil";
        goto LABEL_9;
      }
    }
  }
  objc_storeWeak((id *)p_lastFirstResponder, 0);
  id lastFirstResponderInteractionState = self->_lastFirstResponderInteractionState;
  self->_id lastFirstResponderInteractionState = 0;

  objc_storeWeak((id *)&self->_lastNextResponder, 0);
}

- (void)_setExclusiveTouchView:(id)a3
{
  id v5 = (UIView *)a3;
  if (self->_exclusiveTouchView != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_exclusiveTouchView, a3);
    id v5 = v6;
  }
}

- (CGPoint)warpPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!qword_1EB259DE0) {
    goto LABEL_72;
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)qword_1EB259DE0, self);
  if (!Value) {
    goto LABEL_72;
  }
  CFArrayRef v7 = Value;
  if (!CFArrayGetCount(Value)) {
    goto LABEL_72;
  }
  [(UIWindow *)self _chargeMultiplicationFactor];
  double v9 = v8;
  uint64_t Count = CFArrayGetCount(v7);
  if (!Count) {
    goto LABEL_72;
  }
  CFIndex v11 = 0;
  id v12 = 0;
  double v65 = v9 * 40.0;
  double v13 = *MEMORY[0x1E4F1DB30];
  double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v60 = -(v9 * 15.0);
  double v61 = v9 * 15.0;
  double v66 = y;
  double v67 = x;
  double v62 = v9;
  double v63 = v14;
  double v64 = *MEMORY[0x1E4F1DB30];
  while (1)
  {
    int v15 = v12;
    id v12 = CFArrayGetValueAtIndex(v7, v11);

    if (![v12 _isChargeEnabled]) {
      goto LABEL_70;
    }
    if (!-[UIView _isAlphaHittableAndHasAlphaHittableAncestors]((uint64_t)v12)) {
      goto LABEL_70;
    }
    if ([v12 isHiddenOrHasHiddenAncestor]) {
      goto LABEL_70;
    }
    [v12 bounds];
    if (v17 == v13 && v16 == v14) {
      goto LABEL_70;
    }
    id v18 = objc_msgSend(v12, "superview", *(void *)&v60);
    [v12 frame];
    objc_msgSend(v18, "convertRect:toView:", 0);
    double v20 = v19;
    double v22 = v21;
    double width = v23;
    double height = v25;

    [v12 charge];
    double v28 = v9 * v27;
    if (v28 <= 0.0)
    {
      double v31 = 500.0;
    }
    else
    {
      double v29 = width <= height ? width : height;
      CGFloat v30 = v28 * (v29 * 0.5);
      v70.origin.double x = v20;
      v70.origin.double y = v22;
      v70.size.double width = width;
      v70.size.double height = height;
      CGRect v71 = CGRectInset(v70, v30, v30);
      double v20 = v71.origin.x;
      double v22 = v71.origin.y;
      double width = v71.size.width;
      double height = v71.size.height;
      double v31 = 350.0;
    }
    v72.origin.double x = v20;
    v72.origin.double y = v22;
    v72.size.double width = width;
    v72.size.double height = height;
    v69.double x = x;
    v69.double y = y;
    if (CGRectContainsPoint(v72, v69)) {
      break;
    }
    double v32 = v28 * v31;
    UIDistanceBetweenPointAndRect(x, y, v20, v22, width, height);
    if (v32 <= 0.0 || v33 <= 2.0)
    {
      double v35 = fabs(v33);
      if (v32 < 0.0 && v35 >= 2.22044605e-16 && v33 < v65)
      {
LABEL_32:
        float v38 = v33;
        double v39 = v32 / v38;
        double v40 = fabs(v39);
        double v41 = v60;
        if (v39 >= 0.0) {
          double v41 = v61;
        }
        if (v40 <= v61) {
          double v42 = v39;
        }
        else {
          double v42 = v41;
        }
        double v43 = height + v22;
        if (y <= height + v22)
        {
          double v45 = 0.0;
          double v9 = v62;
          if (y <= v22)
          {
            double v44 = width + v20;
            if (x <= v20)
            {
              double v43 = v22;
              goto LABEL_47;
            }
            double v45 = 1.0;
            double v43 = v22;
            if (x >= v44)
            {
LABEL_47:
              double v46 = y - v43;
              if (x <= v20) {
                double v44 = v20;
              }
              float v47 = v46 / (x - v44);
              double v45 = atanf(fabsf(v47)) / 1.57079633;
            }
          }
        }
        else
        {
          double v44 = width + v20;
          if (x <= v20)
          {
            double v9 = v62;
            goto LABEL_47;
          }
          double v45 = 1.0;
          double v9 = v62;
          if (x >= v44) {
            goto LABEL_47;
          }
        }
        double v48 = v42 * (1.0 - v45);
        double v49 = v42 * v45;
        double v50 = width * 0.5 + v20;
        double v51 = height * 0.5 + v22;
        if (v48 >= v50 - v67) {
          double v52 = v48;
        }
        else {
          double v52 = v50 - v67;
        }
        double v53 = fmin(v52, 0.0);
        double v54 = -v48;
        if (v50 - v67 <= v54) {
          double v54 = v50 - v67;
        }
        if (v54 < 0.0) {
          double v54 = 0.0;
        }
        if (x >= v50) {
          double v54 = v53;
        }
        if (v49 >= v51 - v66) {
          double v55 = v49;
        }
        else {
          double v55 = v51 - v66;
        }
        double v56 = fmin(v55, 0.0);
        double v57 = -v49;
        if (v51 - v66 <= v57) {
          double v57 = v51 - v66;
        }
        if (v57 < 0.0) {
          double v57 = 0.0;
        }
        if (y >= v51) {
          double v57 = v56;
        }
        double v66 = v66 + v57;
        double v67 = v67 + v54;
        goto LABEL_69;
      }
    }
    else if (v33 < v65)
    {
      goto LABEL_32;
    }
    double v9 = v62;
LABEL_69:
    double v14 = v63;
    double v13 = v64;
LABEL_70:
    if (Count == ++v11) {
      goto LABEL_71;
    }
  }
  double v66 = y;
  double v67 = x;
LABEL_71:

  double y = v66;
  double x = v67;
LABEL_72:
  double v58 = x;
  double v59 = y;
  result.double y = v59;
  result.double x = v58;
  return result;
}

- (id)_initWithOrientation:(int64_t)a3
{
  self->_int64_t viewOrientation = a3;
  v4.receiver = self;
  v4.super_class = (Class)UIWindow;
  return [(UIView *)&v4 init];
}

- (UIWindow)initWithFrame:(CGRect)a3
{
  return (UIWindow *)-[UIWindow _initWithFrame:attached:](self, "_initWithFrame:attached:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 attached:(BOOL)a5
{
  return -[UIWindow _initWithFrame:debugName:scene:attached:](self, "_initWithFrame:debugName:scene:attached:", a4, 0, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_initWithFrame:(CGRect)a3 attached:(BOOL)a4
{
  return -[UIWindow _initWithFrame:debugName:attached:](self, "_initWithFrame:debugName:attached:", 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_unregisterSubtreeMonitor:(id)a3
{
  [(NSMutableSet *)self->_subtreeMonitors removeObject:a3];
  if (![(NSMutableSet *)self->_subtreeMonitors count])
  {
    subtreeMonitors = self->_subtreeMonitors;
    self->_subtreeMonitors = 0;
  }
}

- (UIWindow)initWithContentRect:(CGRect)a3
{
  BOOL v3 = -[UIWindow initWithFrame:](self, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = [(UIWindow *)v3 windowScene];

    if (v5) {
      [(UIWindow *)v4 _adjustFramePositionIfNecessary];
    }
    else {
      *(void *)&v4->_windowFlags |= 0x1000000000uLL;
    }
  }
  return v4;
}

- (void)_adjustFramePositionIfNecessary
{
  objc_super v4 = [(UIWindow *)self windowScene];
  id v26 = v4;
  if (!v4)
  {
    double v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"UIWindow.m" lineNumber:1396 description:@"Expected non-nil windowScene"];

    objc_super v4 = 0;
  }
  id v5 = [v4 statusBarManager];
  [v5 statusBarHeight];
  double v7 = v6;

  [(UIView *)self frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [v26 screen];
  [v16 bounds];
  double v19 = v18 - v7;
  if (v9 >= 0.0) {
    double v20 = v9;
  }
  else {
    double v20 = 0.0;
  }
  if (v11 >= v7) {
    double v21 = v11;
  }
  else {
    double v21 = v7;
  }
  if (v13 + v20 <= v17 + 0.0) {
    double v22 = v20;
  }
  else {
    double v22 = v17 + 0.0 - v13;
  }
  double v23 = v7 + v19;
  if (v15 + v21 <= v23) {
    double v24 = v21;
  }
  else {
    double v24 = v23 - v15;
  }
  -[UIWindow setFrame:](self, "setFrame:", v22, v24, v13, v15);
}

- (void)setWindowLevel:(UIWindowLevel)windowLevel
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(UIWindow *)self _adjustedWindowLevelFromLevel:windowLevel];
  double v5 = self->_windowLevel;
  if (v5 != v4)
  {
    double v6 = v4;
    self->_windowLevel = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);

    if (WeakRetained)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_layerContext);
      *(float *)&double v9 = v6;
      [v8 setLevel:v9];

      if (![(UIView *)self isHidden])
      {
        [(UIWindow *)self _updateLayerOrderingAndSetLayerHidden:0];
        double v10 = [(UIWindow *)self windowScene];
        [v10 _updateVisibleWindowOrderWithTest:0];
      }
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v11 = (void *)[(NSHashTable *)self->_windowLevelObservers copy];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v15++) window:self changedFromLevel:v5 toLevel:self->_windowLevel];
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
}

- (double)_adjustedWindowLevelFromLevel:(double)a3
{
  double v5 = [(UIWindow *)self windowScene];
  double v6 = v5;
  double v7 = a3;
  if (v5)
  {
    [v5 _adjustedLevelForWindow:self preferredLevel:a3];
    double v7 = v8;
  }
  if (dyld_program_sdk_at_least()
    && (_UIApplicationIsSystemApplication() & 1) == 0
    && ([(id)UIApp _isSpringBoard] & 1) == 0
    && !_AXSProcessDrawsAssistiveUI())
  {
    double v7 = fmin(fmax(a3, -10000000.0), 10000000.0);
  }

  return v7;
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 scene:(id)a5 attached:(BOOL)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a5;
  id v13 = a4;
  _ensureDebugName(self, v13);
  uint64_t v14 = [(UIWindow *)self _uiWindowSceneFromFBSScene:v12];

  id v15 = -[UIWindow _initWithFrame:debugName:windowScene:](self, "_initWithFrame:debugName:windowScene:", v13, v14, x, y, width, height);
  return v15;
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 windowScene:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (v12)
  {
    uint64_t v14 = (void *)_UISetCurrentFallbackEnvironment(v12);
    v20.receiver = self;
    v20.super_class = (Class)UIWindow;
    id v15 = -[UIView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
    _UIRestorePreviousFallbackEnvironment(v14);
    if (!v15) {
      goto LABEL_9;
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)UIWindow;
    id v15 = -[UIView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
    if (!v15) {
      goto LABEL_9;
    }
  }
  long long v16 = [(UIView *)v15 layer];
  [v16 setHidden:1];

  if (v13)
  {
    [(UIWindow *)v15 _commonInitDebugName:v11 uiScene:v13];
  }
  else
  {
    long long v17 = [(UIWindow *)v15 _uiWindowSceneFromFBSScene:0];
    [(UIWindow *)v15 _commonInitDebugName:v11 uiScene:v17];
  }
  [(UIWindow *)v15 _updateLayerOrderingAndSetLayerHidden:1];
  *(void *)&v15->_windowFlags |= 0x20uLL;
LABEL_9:

  return v15;
}

- (void)_updateLayerOrderingAndSetLayerHidden:(BOOL)a3
{
}

- (void)_commonInitDebugName:(id)a3 uiScene:(id)a4
{
  id v44 = a4;
  _ensureDebugName(self, a3);
  int v7 = [(id)objc_opt_class() _isSecure];
  uint64_t v8 = 0x20000000;
  if (!v7) {
    uint64_t v8 = 0;
  }
  self->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&self->_windowFlags & 0xFFFFFFFFDFFFFFFFLL | v8);
  if (!self->_traitCollection && dyld_program_sdk_at_least())
  {
    double v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2 object:self file:@"UIWindow.m" lineNumber:1187 description:@"UIWindow was improperly initialized without calling into a designated initializer on UIView"];
  }
  [v44 _attachWindow:self];
  double v9 = [(UIView *)self layer];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v11 = [(UIView *)self layer];
    void v11[4] = self;
  }
  if ((*((unsigned char *)&self->_windowFlags + 3) & 0x40) == 0)
  {
    id v12 = [v44 screen];
    [v12 bounds];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    [(UIView *)self frame];
    v48.origin.double x = v21;
    v48.origin.double y = v22;
    v48.size.double width = v23;
    v48.size.double height = v24;
    v46.origin.double x = v14;
    v46.origin.double y = v16;
    v46.size.double width = v18;
    v46.size.double height = v20;
    if (CGRectEqualToRect(v46, v48)) {
      uint64_t v25 = 0x40000000;
    }
    else {
      uint64_t v25 = 0;
    }
    self->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&self->_windowFlags & 0xFFFFFFFFBFFFFFFFLL | v25);

    id v26 = +[UIScreen mainScreen];
    [v26 bounds];
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    [(UIView *)self frame];
    v49.origin.double x = v35;
    v49.origin.double y = v36;
    v49.size.double width = v37;
    v49.size.double height = v38;
    v47.origin.double x = v28;
    v47.origin.double y = v30;
    v47.size.double width = v32;
    v47.size.double height = v34;
    BOOL v39 = CGRectEqualToRect(v47, v49);
    $B5B0456088C508EDB812873BE14D7A88 windowFlags = self->_windowFlags;
    if (v39 | (*(unint64_t *)&windowFlags >> 30) & 1) {
      uint64_t v41 = 0x40000000;
    }
    else {
      uint64_t v41 = 0;
    }
    self->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(v41 | *(void *)&windowFlags & 0xFFFFFFFFBFFFFFFFLL);
  }
  int64_t v42 = [v44 interfaceOrientation];
  if (-[UIScene _systemShellOwnsInterfaceOrientation](v44) && v42) {
    self->_int64_t viewOrientation = v42;
  }
  [(UIWindow *)self _updateTransformLayer];
  [(UIWindow *)self _sceneBoundsDidChange];
  [(UIWindow *)self _createSystemGestureGateGestureRecognizerIfNeeded];
  [(UIWindow *)self _createOtherSystemGateGestureRecognizersIfNeeded];
  *(void *)&self->_windowFlags |= 0x10000000uLL;
  *(void *)((char *)&self->super._viewFlags + 20) &= ~0x2000000000uLL;
}

- (void)_createSystemGestureGateGestureRecognizerIfNeeded
{
  if (!self->_systemGestureGateForGestures)
  {
    BOOL v3 = [[_UISystemGestureGateGestureRecognizer alloc] initWithWindow:self type:1];
    systemGestureGateForGestures = self->_systemGestureGateForGestures;
    self->_systemGestureGateForGestures = v3;

    double v5 = [[_UISystemGestureGateGestureRecognizer alloc] initWithWindow:self type:0];
    systemGestureGateForTouches = self->_systemGestureGateForTouches;
    self->_systemGestureGateForTouches = v5;

    [(UIView *)self addGestureRecognizer:self->_systemGestureGateForGestures];
    int v7 = self->_systemGestureGateForTouches;
    [(UIView *)self addGestureRecognizer:v7];
  }
}

- (void)__setWindowHostingScene:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && *(id *)(a1 + 800) != v3)
  {
    *(void *)(a1 + 800) = v3;
    id v6 = v3;
    objc_opt_class();
    BOOL v4 = (objc_opt_isKindOfClass() & 1) == 0;
    id v3 = v6;
    uint64_t v5 = 0x800000000;
    if (v4) {
      uint64_t v5 = 0;
    }
    *(void *)(a1 + 576) = *(void *)(a1 + 576) & 0xFFFFFFF7FFFFFFFFLL | v5;
  }
}

- (UIWindow)initWithWindowScene:(UIWindowScene *)windowScene
{
  BOOL v4 = windowScene;
  uint64_t v5 = [(UIWindowScene *)v4 coordinateSpace];
  [v5 bounds];
  id v6 = -[UIWindow _initWithFrame:debugName:windowScene:](self, "_initWithFrame:debugName:windowScene:", 0, v4);

  return v6;
}

- (id)_uiWindowSceneFromFBSScene:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[UIScene _sceneForFBSScene:v5];
    if (v6) {
      goto LABEL_27;
    }
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = v7;
    double v9 = @"Attempting to on-demand create a UIScene instance without previously informing UIKit of the backing FBSScene. This is a fatal error outside system apps.";
    SEL v10 = a2;
    id v11 = self;
    uint64_t v12 = 1282;
LABEL_4:
    [v7 handleFailureInMethod:v10 object:v11 file:@"UIWindow.m" lineNumber:v12 description:v9];
LABEL_26:

    goto LABEL_27;
  }
  if ([(id)UIApp isFrontBoard]
    && ([(id)UIApp disablesFrontBoardImplicitWindowScenes] & 1) == 0)
  {
    if ([(UIWindow *)self _isWindowServerHostingManaged])
    {
      double v19 = [(UIWindow *)self screen];
      uint64_t v8 = [v19 displayConfiguration];

      CGFloat v20 = [(id)UIApp _newSceneForWindow:self oldDisplay:v8 newDisplay:v8];
      if (v20)
      {
        id v6 = +[UIScene _sceneForFBSScene:v20];
      }
      else
      {
        CGFloat v21 = +[UIScreen mainScreen];
        id v6 = +[UIWindowScene _unassociatedWindowSceneForScreen:v21 create:1];
      }
      goto LABEL_26;
    }
    goto LABEL_24;
  }
  if ([(id)objc_opt_class() _isSystemUIService])
  {
    double v13 = +[UIScene _scenesIncludingInternal:1];
    id v6 = [v13 firstObject];

    if (v6) {
      goto LABEL_27;
    }
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = v7;
    double v9 = @"SystemUIService creating windows without first creating a scene. They should know better. Aborting.";
    SEL v10 = a2;
    id v11 = self;
    uint64_t v12 = 1294;
    goto LABEL_4;
  }
  if (![(UIWindow *)self _wantsSceneAssociation]
    || ![(UIWindow *)self _isWindowServerHostingManaged])
  {
    goto LABEL_24;
  }
  if (!UIApp)
  {
    if (![(UIWindow *)self _alwaysGetsContexts]) {
      goto LABEL_30;
    }
LABEL_24:
    uint64_t v8 = +[UIScreen mainScreen];
    uint64_t v18 = +[UIWindowScene _unassociatedWindowSceneForScreen:v8 create:1];
    goto LABEL_25;
  }
  CGFloat v14 = +[_UIApplicationConfigurationLoader sharedLoader];
  double v15 = [v14 applicationInitializationContext];
  CGFloat v16 = [v15 defaultSceneToken];

  if (([(id)UIApp _appAdoptsUISceneLifecycle] & 1) == 0)
  {
    if (!v16)
    {
      uint64_t v8 = [(UIWindow *)self screen];
      uint64_t v18 = +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:v8];
      goto LABEL_25;
    }
    double v17 = [(id)UIApp _defaultSceneIfExists];
    id v6 = +[UIScene _sceneForFBSScene:v17];

    if (v6) {
      goto LABEL_27;
    }
    if ((_UIApplicationIsExtension() & 1) == 0)
    {
      uint64_t v8 = [(UIWindow *)self screen];
      uint64_t v18 = +[UIWindowScene _placeholderWindowSceneForScreen:v8 create:1];
LABEL_25:
      id v6 = (void *)v18;
      goto LABEL_26;
    }
  }
LABEL_30:
  id v6 = 0;
LABEL_27:

  return v6;
}

- (void)_setWindowControlsStatusBarOrientation:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&self->_windowFlags & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (void)_addWindowLevelChangedObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    windowLevelObservers = self->_windowLevelObservers;
    id v8 = v4;
    if (!windowLevelObservers)
    {
      id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      int v7 = self->_windowLevelObservers;
      self->_windowLevelObservers = v6;

      windowLevelObservers = self->_windowLevelObservers;
    }
    [(NSHashTable *)windowLevelObservers addObject:v8];
    id v4 = v8;
  }
}

- (id)_rotationViewControllers
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
  id v5 = objc_msgSend(v3, "arrayWithObjects:", WeakRetained, 0);

  if ([(NSMutableArray *)self->_rotationViewControllers count])
  {
    uint64_t v6 = [v5 arrayByAddingObjectsFromArray:self->_rotationViewControllers];

    id v5 = (void *)v6;
  }
  return v5;
}

- (void)_initializeLayoutEngineDiscardingOldIfNeeded:(BOOL)a3
{
  if (a3 || ![(UIView *)self _layoutEngine])
  {
    [(UIView *)self setAutoresizingMask:18];
    id v4 = objc_alloc_init(MEMORY[0x1E4F5B250]);
    [v4 setEngineScalingCoefficients:-[UIView _preferredLayoutEngineToUserScalingCoefficients](self)];
    if (qword_1EB25A5E8 != -1) {
      dispatch_once(&qword_1EB25A5E8, &__block_literal_global_61_2);
    }
    if (byte_1EB25A5AB) {
      [+[UIDevice currentDevice] _playSystemSound:1150];
    }
    [v4 setDelegate:self];
    [(UIWindow *)self _switchToLayoutEngine:v4];

    if ((*(void *)&self->super._viewFlags & 0x200000000000) == 0)
    {
      [(UIView *)self setNeedsLayout];
    }
  }
}

- (void)_switchToLayoutEngine:(id)a3
{
  [(UIWindow *)self _invalidateWindowInternalConstraints];
  v5.receiver = self;
  v5.super_class = (Class)UIWindow;
  [(UIView *)&v5 _switchToLayoutEngine:a3];
}

- (id)_rootViewConstraintsUpdateIfNecessaryForView:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 superview];

  if (v6 != self)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"UIWindow.m" lineNumber:2373 description:@"Trying to create rootViewConstraints for a view that isn't a subview of the window"];
  }
  int v7 = [(UIWindow *)self _rootViewConstraints];
  if (!v7) {
    goto LABEL_8;
  }
  id v8 = v7;
  double v9 = [v7 lastObject];
  SEL v10 = v9;
  if (v9) {
    double v9 = objc_msgSend((id)objc_msgSend(v9, "firstItem"), "_referenceView");
  }
  id v11 = v9;

  if (v11 != v5)
  {
    [(UIWindow *)self _setRootViewConstraints:0];

LABEL_8:
    uint64_t v12 = (void *)MEMORY[0x1E4F1C978];
    double v13 = [MEMORY[0x1E4F5B268] constraintWithItem:v5 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
    CGFloat v14 = [MEMORY[0x1E4F5B268] constraintWithItem:v5 attribute:1 relatedBy:0 toItem:self attribute:1 multiplier:1.0 constant:0.0];
    double v15 = [MEMORY[0x1E4F5B268] constraintWithItem:v5 attribute:4 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:0.0];
    CGFloat v16 = [MEMORY[0x1E4F5B268] constraintWithItem:v5 attribute:2 relatedBy:0 toItem:self attribute:2 multiplier:1.0 constant:0.0];
    id v8 = objc_msgSend(v12, "arrayWithObjects:", v13, v14, v15, v16, 0);

    [(UIWindow *)self _setRootViewConstraints:v8];
  }
  [(UIWindow *)self _updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight];

  return v8;
}

- (void)_updateSystemConstraints
{
  [(UIWindow *)self _updateWindowEngineHostConstraintsWithSizing:(*(void *)&self->super._viewFlags & 0x20000000000000) == 0];
  [(UIWindow *)self _updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight];
  v3.receiver = self;
  v3.super_class = (Class)UIWindow;
  [(UIView *)&v3 _updateSystemConstraints];
}

- (void)_updateWindowEngineHostConstraintsWithSizing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = [(UIWindow *)self _windowInternalConstraints];
  if (!v5)
  {
    if ((dyld_program_sdk_at_least() & 1) != 0
      || self && [(UIView *)self _forceLayoutEngineSolutionInRationalEdges])
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
      int v7 = +[_UIWindowAnchoringConstraint constraintWithItem:self attribute:32 relatedBy:0 constant:0.0];
      double v8 = 0.0;
      double v9 = self;
      uint64_t v10 = 33;
    }
    else
    {
      [(UIView *)self center];
      double v12 = v11;
      uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
      int v7 = +[_UIWindowAnchoringConstraint constraintWithItem:attribute:relatedBy:constant:](_UIWindowAnchoringConstraint, "constraintWithItem:attribute:relatedBy:constant:", self, 34, 0);
      double v9 = self;
      uint64_t v10 = 35;
      double v8 = v12;
    }
    id v5 = (NSArray *)objc_msgSend(v6, "arrayWithObjects:", v7, +[_UIWindowAnchoringConstraint constraintWithItem:attribute:relatedBy:constant:](_UIWindowAnchoringConstraint, "constraintWithItem:attribute:relatedBy:constant:", v9, v10, 0, v8), 0);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v13 = [(NSArray *)v5 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v42 != v15) {
            objc_enumerationMutation(v5);
          }
          double v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          if (v17) {
            v17[10] = self;
          }
          -[UIView _layoutEngine_didAddLayoutConstraint:roundingAdjustment:mutuallyExclusiveConstraints:](self, v17, 0, 0.0);
        }
        uint64_t v14 = [(NSArray *)v5 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v14);
    }
    [(UIWindow *)self _setWindowInternalConstraints:v5];
  }
  if ([(NSArray *)v5 count] == 4 && !v3)
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", -[NSArray objectAtIndex:](v5, "objectAtIndex:", 2), -[NSArray objectAtIndex:](v5, "objectAtIndex:", 3), 0);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v18);
          }
          -[UIView _layoutEngine_willRemoveLayoutConstraint:](self, *(void **)(*((void *)&v37 + 1) + 8 * j));
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v20);
    }
    id v5 = (NSArray *)[(NSArray *)v5 arrayByExcludingObjectsInArray:v18];
    [(UIWindow *)self _setWindowInternalConstraints:v5];
  }
  if ([(NSArray *)v5 count] == 2 && v3)
  {
    [(UIView *)self bounds];
    double v24 = v23;
    uint64_t v25 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v27 = [MEMORY[0x1E4F5B238] constraintWithItem:self attribute:7 relatedBy:0 constant:v26];
    CGFloat v28 = objc_msgSend(v25, "arrayWithObjects:", v27, objc_msgSend(MEMORY[0x1E4F5B238], "constraintWithItem:attribute:relatedBy:constant:", self, 8, 0, v24), 0);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v34;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v34 != v31) {
            objc_enumerationMutation(v28);
          }
          -[UIView _layoutEngine_didAddLayoutConstraint:roundingAdjustment:mutuallyExclusiveConstraints:](self, *(void **)(*((void *)&v33 + 1) + 8 * k), 0, 0.0);
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v30);
    }
    [(UIWindow *)self _setWindowInternalConstraints:[(NSArray *)v5 arrayByAddingObjectsFromArray:v28]];
  }
}

- (void)_setWindowInternalConstraints:(id)a3
{
}

- (void)_invalidateWindowInternalConstraints
{
  BOOL v3 = [(UIWindow *)self _windowInternalConstraints];
  if (v3)
  {
    [(UIView *)self removeConstraints:v3];
    [(UIWindow *)self _setWindowInternalConstraints:0];
    [(UIView *)self _setNeedsUpdateConstraints];
  }
}

- (NSArray)_windowInternalConstraints
{
  return self->_windowInternalConstraints;
}

- (void)_setRootViewConstraints:(id)a3
{
}

- (NSArray)_rootViewConstraints
{
  return self->_rootViewConstraints;
}

- (void)_updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v3 = self->_rootViewConstraints;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "setConstant:", 0.0, (void)v22);
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [(id)UIApp _statusBarOrientationForWindow:self];
  double v9 = __UIStatusBarManagerForWindow(self);
  [v9 defaultStatusBarHeightInOrientation:v8];
  double v11 = v10;

  double v12 = __UIStatusBarManagerForWindow(self);
  [v12 defaultStatusBarHeightInOrientation:1];
  double v14 = v13;

  switch(v8)
  {
    case 1:
      rootViewConstraints = self->_rootViewConstraints;
      uint64_t v16 = 0;
      goto LABEL_14;
    case 2:
      double v17 = self->_rootViewConstraints;
      uint64_t v18 = 2;
      goto LABEL_12;
    case 3:
      double v17 = self->_rootViewConstraints;
      uint64_t v18 = 3;
LABEL_12:
      uint64_t v19 = -[NSArray objectAtIndex:](v17, "objectAtIndex:", v18, (void)v22);
      uint64_t v20 = v19;
      double v21 = v14 - v11;
      goto LABEL_15;
    case 4:
      rootViewConstraints = self->_rootViewConstraints;
      uint64_t v16 = 1;
LABEL_14:
      uint64_t v19 = -[NSArray objectAtIndex:](rootViewConstraints, "objectAtIndex:", v16, (void)v22);
      uint64_t v20 = v19;
      double v21 = v11 - v14;
LABEL_15:
      if (v11 == 0.0) {
        double v21 = 0.0;
      }
      [v19 setConstant:v21];

      break;
    default:
      return;
  }
}

- (void)_executeDeferredOrientationUpdate
{
  -[UIWindow _cancelEnqueuedDeferredOrientationUpdateIfNeeded]((uint64_t)self);
  BOOL v3 = [(UIWindow *)self _deferredOrientationUpdate];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void (**)(void, void, void))v3[4];
    if (v5)
    {
      uint64_t v6 = v3[3];
      if (v6)
      {
        int v7 = (void *)MEMORY[0x1E4F4F680];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        void v11[2] = __45__UIWindow__executeDeferredOrientationUpdate__block_invoke;
        v11[3] = &unk_1E52DC3A0;
        double v12 = v3;
        [v7 tryAnimatingWithSettings:v6 actions:v11 completion:0];
      }
      else
      {
        uint64_t v8 = v3[2];
        double v9 = (void *)UIApp;
        double v10 = v5;
        v5[2](v10, v8, [v9 _expectedViewOrientation]);
      }
      [(UIWindow *)self _setDeferredOrientationUpdate:0];
    }
  }
}

- (void)_invalidateDeferredOrientationUpdate
{
  if (result)
  {
    id v1 = result;
    id v2 = [result _deferredOrientationUpdate];
    -[_UIWindowOrientationUpdate invalidateFences]((uint64_t)v2);

    -[UIWindow _cancelEnqueuedDeferredOrientationUpdateIfNeeded]((uint64_t)v1);
    return (void *)[v1 _setDeferredOrientationUpdate:0];
  }
  return result;
}

- (uint64_t)_cancelEnqueuedDeferredOrientationUpdateIfNeeded
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(unsigned char *)(result + 580) & 0x20) != 0)
    {
      CGPoint result = [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:result selector:sel__executeDeferredOrientationUpdate object:0];
      *(void *)(v1 + 576) &= ~0x2000000000uLL;
    }
  }
  return result;
}

- (UIWindow)init
{
  if (dyld_program_sdk_at_least())
  {
    BOOL v3 = -[UIWindow _initWithOrientation:](self, "_initWithOrientation:", [(id)UIApp _carefulChoiceOrientation]);
    uint64_t v4 = (UIWindow *)v3;
    if (v3)
    {
      v3[72] &= ~0x20uLL;
      *(void *)((char *)v3 + 116) &= ~0x2000000000uLL;
      uint64_t v5 = +[UIColor _windowBackgroundColor];
      [(UIView *)v4 setBackgroundColor:v5];

      [(UIWindow *)v4 setResizesToFullScreen:1];
      [(UIWindow *)v4 _resizeWindowToFullScreenIfNecessary];
      *(void *)&v4->_windowFlags |= 0x20uLL;
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIWindow;
    uint64_t v4 = [(UIView *)&v8 init];
  }
  uint64_t v6 = v4;

  return v6;
}

- (void)setResizesToFullScreen:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&self->_windowFlags & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (id)_targetWindowForPathIndex:(int64_t)a3 atPoint:(CGPoint)a4 scenePointZ:(double)a5 forEvent:(id)a6 windowServerHitTestWindow:(id)a7
{
  double y = a4.y;
  double x = a4.x;
  id v13 = a6;
  id v14 = a7;
  if (a3 == -1) {
    goto LABEL_3;
  }
  uint64_t v15 = [(id)UIApp _mainEventEnvironment];
  CFDictionaryRef v16 = (const __CFDictionary *)-[UIEventEnvironment _touchMapForWindow:]((uint64_t)v15, self);
  double v17 = CFDictionaryGetValue(v16, (const void *)a3);

  uint64_t v18 = [v17 window];

  if (!v18)
  {
LABEL_3:
    uint64_t v18 = +[UIWindow _hitTestToPoint:scenePointZ:forEvent:windowServerHitTestWindow:](UIWindow, "_hitTestToPoint:scenePointZ:forEvent:windowServerHitTestWindow:", v13, v14, x, y, a5);
  }

  return v18;
}

+ (id)_hitTestToPoint:(CGPoint)a3 scenePointZ:(double)a4 forEvent:(id)a5 windowServerHitTestWindow:(id)a6
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v10 = a5;
  double v11 = (id *)a6;
  double v12 = -[UIWindow _fbsScene](v11);
  id v13 = [v11 _windowHostingScene];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__UIWindow__hitTestToPoint_scenePointZ_forEvent_windowServerHitTestWindow___block_invoke;
  v19[3] = &unk_1E5303960;
  CGFloat v23 = x;
  CGFloat v24 = y;
  double v25 = a4;
  id v20 = v12;
  double v21 = v11;
  id v22 = v10;
  id v14 = v10;
  uint64_t v15 = v11;
  id v16 = v12;
  double v17 = [v13 _topVisibleWindowEnumeratingAsCopy:1 passingTest:v19];

  return v17;
}

- (void)_resignApplicationKeyWindowStatus
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v1 = a1;
    id v2 = +[_UIEditMenuSceneComponent sceneComponentForView:v1];
    [v2 dismissCurrentMenu];

    uint64_t v3 = [v1 firstResponder];
    [v3 _windowResignedKey];

    uint64_t v4 = [v1 _focusSystem];
    if ([v4 _focusedItemIsContainedInEnvironment:v1 includeSelf:1])
    {
      uint64_t v5 = [v4 focusedItem];
      [v1 _setRememberedFocusedItem:v5];
    }
    if (([v1 _windowOwnsInterfaceOrientation] & 1) == 0
      && [v1 _windowOwnsInterfaceOrientationTransform]
      && ([v1 isHidden] & 1) == 0)
    {
      uint64_t v6 = [v1 windowScene];
      v8[0] = v1;
      int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
      [v6 _computeMetricsForWindows:v7 animated:0];
    }
  }
}

- (void)_fadeCalloutBarIfNeededForTouchInView:(id)a3
{
  id v9 = a3;
  uint64_t v4 = +[UICalloutBar activeCalloutBar];
  if ([v4 visible]
    && [(UIWindow *)self _touchesInsideShouldHideCalloutBarForViewHierarchy:v9])
  {
    id v5 = [(UIWindow *)self _firstResponder];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v5 textInputView], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v7 = (void *)v6;
      objc_super v8 = v9;
      if ((id)v6 == v9) {
        goto LABEL_12;
      }
    }
    else
    {
      int v7 = 0;
      objc_super v8 = 0;
      if (v5 == v9)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ([v9 isDescendantOfView:v5] & 1) == 0) {
      [v4 fade];
    }
    objc_super v8 = v7;
    goto LABEL_12;
  }
LABEL_13:
}

+ (void)adjustForAccessibilityIfNeeded:(id)a3
{
  uint64_t v4 = [a3 name];
  int v5 = [v4 isEqualToString:@"UIAccessibilityInvertColorsChanged"];

  if (v5) {
    uint64_t v6 = 12;
  }
  else {
    uint64_t v6 = 4;
  }
  int v7 = _AXSUseSingleSystemColor() | byte_1EB259DB2;
  BOOL v8 = v7 != 0;
  if (v7) {
    byte_1EB259DB2 = _AXSUseSingleSystemColor() != 0;
  }
  int v9 = _AXDarkenSystemColors() != 0;
  if (byte_1EB259DB1 != v9)
  {
    byte_1EB259DB1 = v9;
    BOOL v8 = 1;
  }
  int v10 = _AXSInvertColorsEnabled() != 0;
  if (byte_1EB259DB3 != v10)
  {
    byte_1EB259DB3 = v10;
    goto LABEL_12;
  }
  if (v8)
  {
LABEL_12:
    double v11 = [a1 allWindowsIncludingInternalWindows:0 onlyVisibleWindows:0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __43__UIWindow_adjustForAccessibilityIfNeeded___block_invoke;
    void v12[3] = &__block_descriptor_40_e25_v32__0__UIWindow_8Q16_B24l;
    v12[4] = v6;
    [v11 enumerateObjectsUsingBlock:v12];
  }
}

void __22__UIWindow_sendEvent___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  BOOL CanBeConsideredFinished = _UIViewLayerAnimationCanBeConsideredFinished(*(void **)(a1 + 32), v9);
  uint64_t v4 = v9;
  if (CanBeConsideredFinished)
  {
    int v5 = [*(id *)(a1 + 40) animationForKey:v9];
    uint64_t v6 = [v5 delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      BOOL v8 = [v5 delegate];
      [v8 _acceptEarlyAnimationCutoff:v5];
    }
    uint64_t v4 = v9;
  }
}

- (int64_t)_fromWindowOrientation
{
  return self->_fromWindowOrientation;
}

- (void)setWindowScene:(UIWindowScene *)windowScene
{
  if (windowScene && (*(void *)&self->_windowFlags & 0x1000000000) != 0)
  {
    windowHostingScene = self->_windowHostingScene;
    uint64_t v6 = windowScene;
    char v7 = (void *)_UISetCurrentFallbackEnvironment(self);
    [(UIWindow *)self _setWindowHostingScene:v6];

    _UIRestorePreviousFallbackEnvironment(v7);
    if (windowHostingScene != (_UISceneUIWindowHosting *)windowScene)
    {
      *(void *)&self->_windowFlags &= ~0x1000000000uLL;
      [(UIWindow *)self _adjustFramePositionIfNecessary];
    }
  }
  else
  {
    BOOL v8 = windowScene;
    id v9 = (void *)_UISetCurrentFallbackEnvironment(self);
    [(UIWindow *)self _setWindowHostingScene:v8];

    _UIRestorePreviousFallbackEnvironment(v9);
  }
}

- (void)_setWindowHostingScene:(id)a3
{
  id v5 = a3;
  if (v5 || !self->_windowHostingScene)
  {
    if (v5)
    {
      uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v4 postNotificationName:@"_UIWindowWillMoveToSceneNotification" object:self userInfo:0];
    }
  }
  else
  {
    [(UIWindow *)self _prepareHierarchyForWindowHostingSceneRemoval];
    [(_UISceneUIWindowHosting *)self->_windowHostingScene _detachWindow:self];
  }
  [v5 _attachWindow:self];
}

- (void)_adjustSizeClassesAndResizeWindowToFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v8 = [(UIWindow *)self rootViewController];
  [(UIView *)self frame];
  v34.origin.double x = v9;
  v34.origin.double y = v10;
  v34.size.double width = v11;
  v34.size.double height = v12;
  v33.origin.double x = x;
  v33.origin.double y = y;
  v33.size.double width = width;
  v33.size.double height = height;
  if (!CGRectEqualToRect(v33, v34)
    && [(UIWindow *)self _shouldAdjustSizeClassesAndResizeWindow]
    && +[UIWindow _transformLayerRotationsAreEnabled])
  {
    kdebug_trace();
    id v13 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
    [(_UIViewControllerTransitionContext *)v13 _setIsAnimated:1];
    [(_UIViewControllerOneToOneTransitionContext *)v13 _setFromViewController:v8];
    [(_UIViewControllerOneToOneTransitionContext *)v13 _setToViewController:v8];
    [(_UIViewControllerTransitionContext *)v13 _setContainerView:self];
    [(UIView *)self frame];
    -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](v13, "_setFromStartFrame:");
    -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v13, "_setToEndFrame:", x, y, width, height);
    [(UIView *)self frame];
    -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v13, "_setToStartFrame:");
    -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](v13, "_setFromEndFrame:", x, y, width, height);
    [(_UIViewControllerTransitionContext *)v13 _setCompletionCurve:7];
    id v14 = +[_UIWindowAnimationController animationControllerWithWindow:self];
    [(_UIViewControllerTransitionContext *)v13 _setIsAnimated:+[UIView _isInAnimationBlock]];
    [(_UIViewControllerTransitionContext *)v13 _setAnimator:v14];
    [(_UIViewControllerTransitionContext *)v13 _setCompletionCurve:5];
    [(UIView *)self frame];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    CGFloat v23 = __53__UIWindow__adjustSizeClassesAndResizeWindowToFrame___block_invoke;
    CGFloat v24 = &unk_1E53037B8;
    double v25 = self;
    BOOL v17 = v16 != height || v15 != width;
    double v28 = x;
    double v29 = y;
    double v30 = width;
    double v31 = height;
    uint64_t v18 = v13;
    double v26 = v18;
    BOOL v32 = v17;
    id v27 = v8;
    uint64_t v19 = (void (**)(void))_Block_copy(&v21);
    if ([(UIWindow *)self _guardSizeTransitionFromAnimations])
    {
      +[UIView performWithoutAnimation:v19];
    }
    else
    {
      v19[2](v19);
    }
    id v20 = [(_UIViewControllerTransitionContext *)v18 _animator];
    [v20 animateTransition:v18];

    kdebug_trace();
  }
}

- (BOOL)_shouldAdjustSizeClassesAndResizeWindow
{
  id v2 = [(UIWindow *)self rootViewController];
  char v3 = [v2 isViewLoaded];

  return v3;
}

- (Class)_intelligenceBaseClass
{
  sub_1858E6954();
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

- (UIActivityItemsConfigurationReading)_activityItemsConfigurationForScene
{
  uint64_t v2 = [(UIWindow *)self _focusResponder];
  if (!v2)
  {
LABEL_11:
    CGFloat v12 = 0;
    goto LABEL_12;
  }
  char v3 = (void *)v2;
  while (1)
  {
    uint64_t v4 = [v3 nextResponder];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v11 = v4;
      goto LABEL_10;
    }
    id v5 = v3;
    uint64_t v6 = [v5 presentingViewController];
    if (!v6 || (char v7 = (void *)v6, v8 = [v5 modalPresentationStyle], v7, v8 == 5) || !v8)
    {
      uint64_t v9 = [v5 _effectiveActivityItemsConfiguration];
      if (v9) {
        break;
      }
    }
    id v10 = v4;

LABEL_10:
    char v3 = v4;
    if (!v4) {
      goto LABEL_11;
    }
  }
  CGFloat v12 = (void *)v9;

LABEL_12:
  return (UIActivityItemsConfigurationReading *)v12;
}

- (UIKeyboardLayoutGuide)_primaryKeyboardTrackingGuide
{
  v30[4] = *MEMORY[0x1E4F143B8];
  primaryKeyboardTrackingGuide = self->_primaryKeyboardTrackingGuide;
  if (!primaryKeyboardTrackingGuide)
  {
    uint64_t v4 = objc_alloc_init(UIKeyboardLayoutGuide);
    id v5 = self->_primaryKeyboardTrackingGuide;
    self->_primaryKeyboardTrackingGuide = v4;

    [(UIView *)self addLayoutGuide:self->_primaryKeyboardTrackingGuide];
    [(UILayoutGuide *)self->_primaryKeyboardTrackingGuide _setLockedToOwningView:1];
    [(UILayoutGuide *)self->_primaryKeyboardTrackingGuide _setAllowsNegativeDimensions:1];
    [(UILayoutGuide *)self->_primaryKeyboardTrackingGuide setIdentifier:@"UIWindow_KeyboardLayoutGuide"];
    [(UIKeyboardLayoutGuide *)self->_primaryKeyboardTrackingGuide setWindowGuide:1];
    primaryKeyboardTrackingGuide = self->_primaryKeyboardTrackingGuide;
  }
  uint64_t v6 = [(UILayoutGuide *)primaryKeyboardTrackingGuide _systemConstraints];
  unint64_t v7 = [v6 count];

  if (v7 <= 3)
  {
    uint64_t v8 = self->_primaryKeyboardTrackingGuide;
    uint64_t v9 = self;
    id v10 = [(UILayoutGuide *)v8 widthAnchor];
    [(UIView *)v9 bounds];
    CGFloat v12 = [v10 constraintEqualToConstant:v11];

    [v12 setIdentifier:@"UIKeyboardLayoutGuide-width"];
    id v13 = [(UILayoutGuide *)self->_primaryKeyboardTrackingGuide leftAnchor];
    id v14 = [(UIView *)v9 leftAnchor];
    double v15 = [v13 constraintEqualToAnchor:v14];

    [v15 setIdentifier:@"UIKeyboardLayoutGuide-leftOffset"];
    double v16 = [(UIView *)v9 bottomAnchor];
    BOOL v17 = [(UILayoutGuide *)self->_primaryKeyboardTrackingGuide bottomAnchor];
    uint64_t v18 = [v16 constraintEqualToAnchor:v17];

    [v18 setIdentifier:@"UIKeyboardLayoutGuide-bottomOffset"];
    uint64_t v19 = [(UILayoutGuide *)self->_primaryKeyboardTrackingGuide heightAnchor];
    [(UIWindow *)v9 insetForDismissedKeyboardGuide];
    id v20 = objc_msgSend(v19, "constraintEqualToConstant:");

    [v20 setIdentifier:@"UIKeyboardLayoutGuide-height"];
    uint64_t v21 = self->_primaryKeyboardTrackingGuide;

    v30[0] = v12;
    v30[1] = v15;
    v30[2] = v18;
    v30[3] = v20;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
    [(UILayoutGuide *)v21 _setSystemConstraints:v22];
  }
  CGFloat v23 = [(UILayoutGuide *)self->_primaryKeyboardTrackingGuide _systemConstraints];
  CGFloat v24 = [v23 firstObject];
  char v25 = [v24 isActive];

  if ((v25 & 1) == 0)
  {
    double v26 = (void *)MEMORY[0x1E4F5B268];
    id v27 = [(UILayoutGuide *)self->_primaryKeyboardTrackingGuide _systemConstraints];
    [v26 activateConstraints:v27];
  }
  double v28 = self->_primaryKeyboardTrackingGuide;
  return v28;
}

- (void)addKeyboardLayoutGuideIfNeeded:(id)a3
{
  id v4 = a3;
  currentKeyboardTrackingLayoutGuides = self->_currentKeyboardTrackingLayoutGuides;
  id v10 = v4;
  if (!currentKeyboardTrackingLayoutGuides)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v7 = self->_currentKeyboardTrackingLayoutGuides;
    self->_currentKeyboardTrackingLayoutGuides = v6;

    id v4 = v10;
    currentKeyboardTrackingLayoutGuides = self->_currentKeyboardTrackingLayoutGuides;
  }
  if (([(NSMutableArray *)currentKeyboardTrackingLayoutGuides containsObject:v4] & 1) == 0)
  {
    uint64_t v8 = [(UIWindow *)self _primaryKeyboardTrackingGuide];
    [v10 setConstrainedToWindowGuide:1];
    [v10 constrainToReference:v8];
    [(UITrackingLayoutGuide *)self->_primaryKeyboardTrackingGuide trackConstraintsFromViewBasedGuide:v10];
    [(UIKeyboardLayoutGuide *)self->_primaryKeyboardTrackingGuide inheritOptionsFromGuide:v10];
    [(NSMutableArray *)self->_currentKeyboardTrackingLayoutGuides addObject:v10];
    uint64_t v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    [v9 refreshKeyboardLayoutGuide];
  }
}

- (void)removeKeyboardLayoutGuideIfNeeded:(id)a3
{
  id v11 = a3;
  if (-[NSMutableArray containsObject:](self->_currentKeyboardTrackingLayoutGuides, "containsObject:"))
  {
    [(UITrackingLayoutGuide *)self->_primaryKeyboardTrackingGuide removeTrackedConstraintsFromViewBasedGuide:v11];
    id v4 = [v11 _systemConstraints];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F5B268];
      unint64_t v7 = [v11 _systemConstraints];
      [v6 deactivateConstraints:v7];
    }
    [(NSMutableArray *)self->_currentKeyboardTrackingLayoutGuides removeObject:v11];
  }
  if ([v11 isEqual:self->_primaryKeyboardTrackingGuide]
    && ![(NSMutableArray *)self->_currentKeyboardTrackingLayoutGuides count])
  {
    [(UITrackingLayoutGuide *)self->_primaryKeyboardTrackingGuide removeAllTrackedConstraints];
    uint64_t v8 = (void *)MEMORY[0x1E4F5B268];
    uint64_t v9 = [(UILayoutGuide *)self->_primaryKeyboardTrackingGuide _systemConstraints];
    [v8 deactivateConstraints:v9];

    [(UILayoutGuide *)self->_primaryKeyboardTrackingGuide _setLockedToOwningView:0];
    [(UIView *)self removeLayoutGuide:self->_primaryKeyboardTrackingGuide];
    primaryKeyboardTrackingGuide = self->_primaryKeyboardTrackingGuide;
    self->_primaryKeyboardTrackingGuide = 0;
  }
}

- (double)keyboardLayoutGuideScrollViewOffset
{
  if (![(UIWindow *)self isTrackingKeyboard]) {
    return 0.0;
  }
  primaryKeyboardTrackingGuide = self->_primaryKeyboardTrackingGuide;
  [(UIKeyboardLayoutGuide *)primaryKeyboardTrackingGuide keyboardDismissPadding];
  return result;
}

- (BOOL)moveKeyboardLayoutGuideOverEdge:(unint64_t)a3 layoutViews:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(UIWindow *)self isTrackingKeyboard])
  {
    primaryKeyboardTrackingGuide = self->_primaryKeyboardTrackingGuide;
    if (a3)
    {
      BOOL v8 = [(UIKeyboardLayoutGuide *)primaryKeyboardTrackingGuide moveGuideOffscreenAtEdge:a3];
      BOOL v9 = v8;
      if (v8 && v4) {
        [(UIWindow *)self layoutViewsForTrackedGuides];
      }
      if (v9) {
        return 1;
      }
    }
    else
    {
      [(UIKeyboardLayoutGuide *)primaryKeyboardTrackingGuide resetGuideForCancelledDismissInteraction];
    }
  }
  return 0;
}

- (id)_obtainKeyboardLayoutGuideTransitionAssertionForReason:(id)a3
{
  id v4 = a3;
  if ([(UIWindow *)self isTrackingKeyboard])
  {
    uint64_t v5 = [(UIKeyboardLayoutGuide *)self->_primaryKeyboardTrackingGuide _obtainTransitionAssertionForReason:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)updateGuideForKeyboardPlacement:(id)a3
{
  id v6 = a3;
  if ([v6 isVisible])
  {
    if ([v6 isFloating])
    {
      uint64_t v4 = 3;
    }
    else if ([v6 isCompactAssistantView])
    {
      uint64_t v4 = 6;
    }
    else if ([v6 isFloatingAssistantView])
    {
      uint64_t v4 = 5;
    }
    else if ([v6 isUndocked])
    {
      uint64_t v4 = 4;
    }
    else if ([v6 showsInputOrAssistantViews])
    {
      uint64_t v4 = 2;
    }
    else
    {
      uint64_t v4 = 1;
    }
    uint64_t v5 = [(UIWindow *)self _primaryKeyboardTrackingGuide];
    [v5 setCurrentKeyboardVisualState:v4];
  }
}

- (void)layoutViewsForTrackedGuides
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = self->_currentKeyboardTrackingLayoutGuides;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        unint64_t v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "owningView", (void)v8);
        [v7 layoutIfNeeded];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (double)insetForDismissedKeyboardGuide
{
  double v3 = 0.0;
  if ([(UIWindow *)self isTrackingKeyboard]
    && ![(UIKeyboardLayoutGuide *)self->_primaryKeyboardTrackingGuide ignoresSafeArea])
  {
    [(UIWindow *)self safeAreaInsets];
    return v4;
  }
  return v3;
}

- (UILayoutGuide)safeAreaAspectFitLayoutGuide
{
  objc_getAssociatedObject(self, &_UIWindowSafeAreaAspectFitLayoutGuideID);
  double v3 = (_UIWindowSafeAreaAspectFitLayoutGuide *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    double v3 = objc_alloc_init(_UIWindowSafeAreaAspectFitLayoutGuide);
    [(UIView *)self addLayoutGuide:v3];
    [(UILayoutGuide *)v3 _setLockedToOwningView:1];
    [(UILayoutGuide *)v3 setIdentifier:@"UIWindowSafeAreaAspectFitLayoutGuide"];
    objc_setAssociatedObject(self, &_UIWindowSafeAreaAspectFitLayoutGuideID, v3, (void *)1);
  }
  return (UILayoutGuide *)v3;
}

void __43__UIWindow_adjustForAccessibilityIfNeeded___block_invoke(uint64_t a1, void *a2)
{
}

+ (void)adjustFocusForAccessibilityIfNeeded:(id)a3
{
  double v3 = [a1 allWindowsIncludingInternalWindows:0 onlyVisibleWindows:0];
  int v4 = _AXSFullKeyboardAccessEnabled();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__UIWindow_adjustFocusForAccessibilityIfNeeded___block_invoke;
  v5[3] = &__block_descriptor_33_e25_v32__0__UIWindow_8Q16_B24l;
  BOOL v6 = v4 != 0;
  [v3 enumerateObjectsUsingBlock:v5];
}

void __48__UIWindow_adjustFocusForAccessibilityIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  double v3 = [v5 screen];
  char v4 = [v3 _isCarScreen];

  if ((v4 & 1) == 0 && *(unsigned char *)(a1 + 32)) {
    [v5 _installFocusEventRecognizer];
  }
}

- (void)_setScene:(id)a3
{
}

- (void)_setFBSScene:(void *)a1
{
  id v3 = a2;
  char v4 = v3;
  if (a1)
  {
    BOOL v17 = v3;
    if (!v3)
    {
      BOOL v6 = [a1 screen];
      unint64_t v7 = +[UIWindowScene _placeholderWindowSceneForScreen:v6 create:0];
      long long v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        long long v10 = +[UIScreen mainScreen];
        id v9 = +[UIWindowScene _unassociatedWindowSceneForScreen:v10 create:1];
      }
      [v9 _attachWindow:a1];

LABEL_12:
      [a1 _updateTransformLayer];
      char v4 = v17;
      goto LABEL_13;
    }
    id v5 = +[UIScene _sceneForFBSScene:v3];
    if (!v5)
    {
      if ([(id)UIApp _appAdoptsUISceneLifecycle])
      {
        id v5 = 0;
      }
      else
      {
        long long v11 = [v17 uiSettings];
        CGFloat v12 = [v11 displayIdentity];
        uint64_t v13 = +[UIScreen _screenWithFBSDisplayIdentity:v12];
        id v5 = +[UIWindowScene _placeholderWindowSceneForScreen:v13 create:1];
      }
    }
    [v5 _attachWindow:a1];

    uint64_t v14 = a1[52];
    double v15 = [v17 settings];
    uint64_t v16 = [v15 interfaceOrientation];

    char v4 = v17;
    if (v14 != v16) {
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (FBSSceneLayer)_associatingSceneLayer
{
  return (FBSSceneLayer *)[(_UISceneUIWindowHosting *)self->_windowHostingScene _fbsSceneLayerForWindow:self];
}

- (void)_commonInitAttachedWindow:(BOOL)a3 debugName:(id)a4 scene:(id)a5
{
  id v7 = a4;
  id v8 = [(UIWindow *)self _uiWindowSceneFromFBSScene:a5];
  [(UIWindow *)self _commonInitDebugName:v7 uiScene:v8];
}

+ (BOOL)_temporary_shouldSizeWindowsAutomaticallyPlistOverrideSet
{
  if (qword_1EB259DD8 != -1) {
    dispatch_once(&qword_1EB259DD8, &__block_literal_global_295_0);
  }
  return byte_1EB259DB4;
}

void __69__UIWindow__temporary_shouldSizeWindowsAutomaticallyPlistOverrideSet__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 infoDictionary];
  char v4 = [v1 objectForKeyedSubscript:@"NSWindowAutomaticSizing"];

  uint64_t v2 = v4;
  if (v4)
  {
    char v3 = [v4 BOOLValue];
    uint64_t v2 = v4;
  }
  else
  {
    char v3 = 0;
  }
  byte_1EB259DB4 = v3;
}

- (void)_commonInit
{
  id v3 = [(UIWindow *)self _uiWindowSceneFromFBSScene:0];
  [(UIWindow *)self _commonInitDebugName:0 uiScene:v3];
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4
{
  return -[UIWindow _initWithFrame:debugName:attached:](self, "_initWithFrame:debugName:attached:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_initWithFrame:(CGRect)a3 debugName:(id)a4 displayConfiguration:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  id v12 = a4;
  _ensureDebugName(self, v12);
  uint64_t v13 = [(id)UIApp _mainSceneForDisplay:v11];

  uint64_t v14 = +[UIScene _sceneForFBSScene:v13];

  id v15 = -[UIWindow _initWithFrame:debugName:windowScene:](self, "_initWithFrame:debugName:windowScene:", v12, v14, x, y, width, height);
  return v15;
}

- (UIWindow)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIWindow;
  id v5 = [(UIView *)&v13 initWithCoder:v4];
  BOOL v6 = v5;
  if (v5)
  {
    [(UIWindow *)v5 _commonInit];
    uint64_t v7 = [(UIView *)v6 isHidden];
    uint64_t v8 = 0x2000000;
    if (v7) {
      uint64_t v8 = 0;
    }
    v6->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&v6->_windowFlags & 0xFFFFFFFFFDFFFFFFLL | v8);
    [(UIWindow *)v6 setHidden:v7];
    *(void *)&v6->_windowFlags &= ~0x2000000uLL;
    int v9 = [v4 decodeBoolForKey:@"UIResizesToFullScreen"];
    uint64_t v10 = 0x800000;
    if (!v9) {
      uint64_t v10 = 0;
    }
    v6->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&v6->_windowFlags & 0xFFFFFFFFFF7FFFFFLL | v10);
    id v11 = [v4 decodeObjectForKey:@"UIRootViewController"];
    if (v11) {
      [(UIWindow *)v6 setRootViewController:v11];
    }
    *(void *)&v6->_windowFlags |= 0x20uLL;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIWindow;
  [(UIView *)&v6 encodeWithCoder:v4];
  if ((*((unsigned char *)&self->_windowFlags + 2) & 0x80) != 0) {
    [v4 encodeBool:1 forKey:@"UIResizesToFullScreen"];
  }
  rootViewController = self->_rootViewController;
  if (rootViewController) {
    [v4 encodeConditionalObject:rootViewController forKey:@"UIRootViewController"];
  }
}

- (void)awakeFromNib
{
  v5.receiver = self;
  v5.super_class = (Class)UIWindow;
  [&v5 awakeFromNib];
  if (!self->_viewOrientation)
  {
    id v3 = (void *)UIApp;
    id v4 = [(UIView *)self window];
    self->_int64_t viewOrientation = [v3 _safeInterfaceOrientationForWindowIfExists:v4];
  }
  [(UIWindow *)self _resizeWindowToFullScreenIfNecessary];
}

- (void)dealloc
{
  v36[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x18C108260](self, a2);
  id v4 = [(UIView *)self layer];
  objc_super v6 = v4;
  if (v4 && ([v4 isHidden] & 1) == 0)
  {
    uint64_t v7 = [(UIView *)self _focusSystem];
    [v7 _focusEnvironmentWillDisappear:self];
  }
  windowHostingScene = self->_windowHostingScene;
  if (windowHostingScene
    && ([(_UISceneUIWindowHosting *)windowHostingScene _hasInvalidated] & 1) == 0)
  {
    int v9 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _eventDeferringManager];
    -[_UIEventDeferringManager removeEventDeferringRulesIfNeededForDeallocatingWindow:](v9, self);

    [(UIWindow *)self _prepareHierarchyForWindowHostingSceneRemoval];
  }
  [(UIView *)self _prepareDescendantsForWindowDealloc];
  *(void *)&self->_windowFlags &= ~0x200000000uLL;
  -[UIView _layoutConstraintCleanup]((id *)&self->super.super.super.isa);
  if (dyld_program_sdk_at_least()) {
    [(UIWindow *)self _removeAllViewControllersFromWindowHierarchyFromDealloc:1];
  }
  rootViewConstraints = self->_rootViewConstraints;
  self->_rootViewConstraints = 0;

  [(UIWindow *)self _setWindowInternalConstraints:0];
  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v36[0] = @"UIDeviceOrientationDidChangeNotification";
  v36[1] = @"UIApplicationDidChangeStatusBarOrientationNotification";
  v36[2] = @"_UIAppActiveInterfaceOrientationDidChangeNotification";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  -[NSNotificationCenter _uiRemoveObserver:names:](v11, self, v12);

  [(UIWindow *)self _updateLayerOrderingAndSetLayerHidden:1];
  objc_super v13 = [(UIWindow *)self firstResponder];
  [v13 resignFirstResponder];

  [(UIWindow *)self _setDelegateViewController:0];
  +[UIWindowController windowWillBeDeallocated:self];
  ClearSpecialViews(self, (CFMutableDictionaryRef *)&qword_1EB259DE0);
  ClearSpecialViews(self, (CFMutableDictionaryRef *)&qword_1EB259DE8);
  uint64_t v14 = [(UIWindow *)self windowScene];
  id v15 = (id *)v14;
  if (v14)
  {
    uint64_t v16 = (UIWindow *)*(id *)(v14 + 344);

    if (v16 == self) {
      -[UIWindowScene _keyWindowWillDeallocate:](v15, self);
    }
  }
  if ((UIWindow *)qword_1EB259DD0 == self) {
    qword_1EB259DD0 = 0;
  }
  id touchData = self->_touchData;
  self->_id touchData = 0;

  undoManager = self->_undoManager;
  self->_undoManager = 0;

  rotationViewControllers = self->_rotationViewControllers;
  self->_rotationViewControllers = 0;

  firstResponder = self->_firstResponder;
  self->_firstResponder = 0;

  subtreeMonitors = self->_subtreeMonitors;
  self->_subtreeMonitors = 0;

  rootViewController = self->_rootViewController;
  self->_rootViewController = 0;

  systemGestureGateForGestures = self->_systemGestureGateForGestures;
  self->_systemGestureGateForGestures = 0;

  systemGestureGateForTouches = self->_systemGestureGateForTouches;
  self->_systemGestureGateForTouches = 0;

  systemGateForGESTouches = self->_systemGateForGESTouches;
  self->_systemGateForGESTouches = 0;

  traitCollection = self->_traitCollection;
  self->_traitCollection = 0;

  destinationTraitCollection = self->_destinationTraitCollection;
  self->_destinationTraitCollection = 0;

  [(UIWindow *)self _setTraitCollectionChangeTransitionCoordinator:0];
  debugName = self->_debugName;
  self->_debugName = 0;

  focusEventRecognizer = self->_focusEventRecognizer;
  self->_focusEventRecognizer = 0;

  double v30 = [v15 _focusSystemSceneComponent];
  double v31 = [v30 activeSceneObserver];
  [v31 stopMonitoringContextChangesForWindow:self];

  [(_UISceneUIWindowHosting *)self->_windowHostingScene _detachWindow:self];
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (UIWindow *)v6[4] == self) {
      v6[4] = 0;
    }
  }
  rootLayer = self->_rootLayer;
  if (rootLayer && (UIWindow *)rootLayer[1].super.isa == self) {
    rootLayer[1].super.isa = 0;
  }
  sceneTransformLayer = self->_sceneTransformLayer;
  if (sceneTransformLayer && (UIWindow *)sceneTransformLayer[1].super.isa == self) {
    sceneTransformLayer[1].super.isa = 0;
  }
  transformLayer = self->_transformLayer;
  if (transformLayer && (UIWindow *)transformLayer[1].super.isa == self) {
    transformLayer[1].super.isa = 0;
  }

  v35.receiver = self;
  v35.super_class = (Class)UIWindow;
  [(UIView *)&v35 dealloc];
}

- (void)setContentView:(id)a3
{
  id v8 = a3;
  id v4 = [(UIView *)self subviews];
  if ([v4 count])
  {
    id v5 = [v4 objectAtIndex:0];
  }
  else
  {
    id v5 = 0;
  }
  if (v5 != v8)
  {
    [v5 removeFromSuperview];
    [(UIView *)self bounds];
    objc_msgSend(v8, "setSize:", v6, v7);
    [(UIView *)self addSubview:v8];
    [v8 setAutoresizingMask:18];
  }
}

- (id)representation
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)_setShouldDisableTransformLayerScalingForSnapshotting:(BOOL)a3
{
  if (self->_shouldDisableTransformLayerScalingForSnapshotting != a3)
  {
    self->_shouldDisableTransformLayerScalingForSnapshotting = a3;
    [(UIWindow *)self _updateTransformLayer];
  }
}

- (void)_transformLayerShouldMaskToBounds:(BOOL)a3
{
}

- (BOOL)_isConstrainedByScreenJail
{
  if (_isConstrainedByScreenJail_once != -1) {
    dispatch_once(&_isConstrainedByScreenJail_once, &__block_literal_global_329_2);
  }
  return 1;
}

void __38__UIWindow__isConstrainedByScreenJail__block_invoke()
{
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("Window", &_UIInternalPreference_FakeMainScreen_block_invoke_3___s_category)+ 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "The value returned from this method is no longer trustworthy. Please contact the UIKit team to discuss your needs with this method.", v1, 2u);
  }
}

- (int64_t)_orientationForClassicPresentation
{
  return self->_sceneOrientation;
}

- (BOOL)_transformLayerIncludesScreenRotation
{
  return 0;
}

- (void)_prepareHierarchyForWindowHostingSceneRemoval
{
  uint64_t v2 = self;
  if (v2)
  {
    p_isa = (id *)&v2->super.super.super.isa;
    id v3 = [(_UISceneUIWindowHosting *)v2->_windowHostingScene _focusSystemSceneComponent];
    [p_isa _removeFocusIfNeededForFocusSystemSceneComponent:v3];

    [p_isa _prepareForWindowHostingSceneRemoval];
    [(UIView *)p_isa _prepareDescendantsForWindowHostingSceneRemoval];
    if (UIApp)
    {
      -[UIEventEnvironment _enqueueClearEventsOfRetainedWindow:](*(void **)(*(void *)(UIApp + 160) + 8), p_isa);
      id v5 = (void *)UIApp;
    }
    else
    {
      id v5 = 0;
    }
    objc_msgSend((id)objc_msgSend(v5, "_touchesEventForWindow:", p_isa), "_invalidateGestureRecognizerForWindowCache");
    -[_UIPencilEvent unregisterAllInteractionsForWindow:]((uint64_t)(id)[(id)UIApp _pencilEventForWindow:p_isa], p_isa);
    double v6 = [p_isa[100] _existingPhysicalButtonInteractionArbiter];
    -[_UIPhysicalButtonInteractionArbiter _unregisterAllPhysicalButtonInteractionsForDetachingWindow:]((uint64_t)v6, (uint64_t)p_isa);
    double v7 = [p_isa[100] _existingHomeAffordanceSceneNotifier];
    [v7 cleanupForDetachingWindow:p_isa];
    -[UIWindow _cancelEnqueuedDeferredOrientationUpdateIfNeeded]((uint64_t)p_isa);
    -[UIWindow _invalidateDeferredOrientationUpdate](p_isa);
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"_UIWindowWillMoveToNilSceneNotification" object:p_isa userInfo:0];

    uint64_t v2 = (UIWindow *)p_isa;
  }
}

- (void)_insertLiveResizeSnapshot:(id *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    id v5 = a1[89];
    if (v5)
    {
      double v6 = [v5 superview];

      if (v6 != a1)
      {
        double v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Window", &_insertLiveResizeSnapshot____s_category) + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          id v8 = a1[89];
          int v9 = v7;
          uint64_t v10 = [v8 superview];
          int v12 = 138412546;
          objc_super v13 = a1;
          __int16 v14 = 2112;
          id v15 = v10;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "A live resize snapshot was removed from its owning window %@ and is now a subview of %@.", (uint8_t *)&v12, 0x16u);
        }
        id v11 = a1[89];
        a1[89] = 0;
      }
    }
    if (a1[89]) {
      objc_msgSend(a1, "insertSubview:belowSubview:", v4);
    }
    else {
      [a1 addSubview:v4];
    }
    objc_storeStrong(a1 + 89, a2);
  }
}

- (void)_removeLiveResizeSnapshot:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = v3;
    if (*(id *)(a1 + 712) == v3)
    {
      *(void *)(a1 + 712) = 0;
    }
    [v4 removeFromSuperview];
    id v3 = v4;
  }
}

+ (void)_setAllWindowsKeepContextInBackground:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  __allWindowsKeepContextInBackground = 1;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1, 0);
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) _setKeepContextAssociationInBackground:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void __47__UIWindow_addRootViewControllerViewIfPossible__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)makeKeyAndOrderFront:(id)a3
{
  [(UIWindow *)self setHidden:0];
  [(UIWindow *)self makeKeyWindow];
}

- (void)orderOut:(id)a3
{
}

- (CGRect)_usableBounds
{
  [(UIWindow *)self _usableSceneBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIWindow *)self _sceneSafeAreaInsetsIncludingStatusBar:1];
  -[UIWindow convertRect:fromWindow:](self, "convertRect:fromWindow:", 0, v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  [(UIView *)self bounds];
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v31 = v16;
  uint64_t v32 = v18;
  uint64_t v33 = v20;
  uint64_t v34 = v22;
  return CGRectIntersection(*(CGRect *)&v31, *(CGRect *)&v24);
}

- (void)_sceneSettingsSafeAreaInsetsDidChange
{
  [(UIWindow *)self _normalizedSafeAreaInsets];
  -[UIView _setSafeAreaInsets:updateSubviewsDuringNextLayoutPass:]((double *)self, 0, v3, v4, v5, v6);
  -[UIView _recursiveEagerlyUpdateSafeAreaInsetsUntilViewController](self);
  id v7 = [(UIWindow *)self rootViewController];
  [v7 _sceneSettingsSafeAreaInsetsDidChangeForWindow:self];
}

- (id)_targetForStolenStatusBarTouchesAtPoint:(CGPoint)a3 withEvent:(id)a4 excludingWindow:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  double v10 = (UIWindow *)a5;
  -[UIWindow convertPoint:toWindow:](self, "convertPoint:toWindow:", 0, x, y);
  [(UIWindow *)self convertPoint:0 fromWindow:_UIAdjustedLocationForScreenTouchLocation(self, v11)];
  double v13 = v12;
  double v15 = v14;

  if (v10 == self)
  {
    id v17 = 0;
  }
  else
  {
    uint64_t v16 = -[UIView hitTest:withEvent:](self, "hitTest:withEvent:", v9, v13, v15);
    objc_msgSend(v16, "convertPoint:fromView:", self, v13, v15);
    if (objc_msgSend(v16, "_canHandleStatusBarTouchAtLocation:")) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }
  }
  return v17;
}

- (BOOL)_isScrollingEnabledForView:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    char v4 = [v3 isScrollEnabled];
  }
  else
  {
    NSLog(&cfstr_ViewRegistered.isa, v3);
    char v4 = 0;
  }

  return v4;
}

- (void)_scrollToTopViewsUnderScreenPointIfNecessary:(CGPoint)a3 resultHandler:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (qword_1EB259DE8)
  {
    id v45 = v7;
    CGRect v47 = self;
    [(UIWindow *)v47 _registeredScrollToTopViews];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v69 objects:v74 count:16];
    if (v9)
    {
      CGRect v46 = 0;
      uint64_t v10 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v70 != v10) {
            objc_enumerationMutation(v8);
          }
          double v12 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          double v13 = +[UIViewController _viewControllerForFullScreenPresentationFromView:v12];
          double v14 = [v13 activePresentationController];
          if (v14)
          {
            while (1)
            {
              double v15 = [v13 activePresentationController];
              char v16 = [v15 _shouldPresentedViewControllerServeAsBaseForScrollToTop];

              if (v16) {
                break;
              }
              id v17 = [v13 presentingViewController];

              double v14 = [v17 activePresentationController];
              double v13 = v17;
              if (!v14) {
                goto LABEL_12;
              }
            }
          }
          id v17 = v13;
LABEL_12:
          uint64_t v18 = [v12 _viewControllerForAncestor];
          if (v18)
          {
            while (v18 != v17)
            {
              uint64_t v19 = [v18 parentViewController];
              uint64_t v20 = v19;
              if (v19)
              {
                id v21 = v19;
              }
              else
              {
                id v21 = [v18 presentingViewController];
              }
              id v22 = v21;

              uint64_t v18 = v22;
              if (!v22) {
                goto LABEL_23;
              }
            }
            if (v46)
            {
              [v46 addObject:v12];
            }
            else
            {
              CGRect v46 = [MEMORY[0x1E4F1CA48] arrayWithObject:v12];
            }
          }
LABEL_23:
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v69 objects:v74 count:16];
      }
      while (v9);
    }
    else
    {
      CGRect v46 = 0;
    }

    if ([v46 count])
    {
      id v23 = v46;

      id v8 = v23;
    }
    uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
    -[UIWindow convertPoint:fromWindow:](v47, "convertPoint:fromWindow:", 0, x, y);
    double v26 = v25;
    double v28 = v27;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v29 = v8;
    int v30 = 0;
    uint64_t v31 = [v29 countByEnumeratingWithState:&v65 objects:v73 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v66;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v66 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void **)(*((void *)&v65 + 1) + 8 * j);
          if (-[UIView _isInVisibleHierarchy]((uint64_t)v34))
          {
            if ([(UIWindow *)v47 _isScrollingEnabledForView:v34])
            {
              objc_msgSend(v34, "convertPoint:fromView:", 0, v26, v28);
              double v36 = v35;
              [v34 bounds];
              ++v30;
              if (v37 <= v36)
              {
                [v34 bounds];
                if (v38 + v39 >= v36) {
                  [v24 addObject:v34];
                }
              }
            }
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v65 objects:v73 count:16];
      }
      while (v31);
    }

    long long v40 = +[UIDevice currentDevice];
    uint64_t v41 = [v40 userInterfaceIdiom];

    if ((v41 & 0xFFFFFFFFFFFFFFFBLL) == 1 || v30 == 1 || dyld_program_sdk_at_least())
    {
      if (v30 >= 2)
      {
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __71__UIWindow__scrollToTopViewsUnderScreenPointIfNecessary_resultHandler___block_invoke;
        v64[3] = &unk_1E53036A8;
        v64[4] = v47;
        [v24 sortUsingComparator:v64];
      }
      long long v42 = [v24 objectEnumerator];
      v62[0] = 0;
      v62[1] = v62;
      v62[2] = 0x3032000000;
      v62[3] = __Block_byref_object_copy__166;
      v62[4] = __Block_byref_object_dispose__166;
      id v63 = 0;
      uint64_t v56 = 0;
      double v57 = (id *)&v56;
      uint64_t v58 = 0x3042000000;
      double v59 = __Block_byref_object_copy__369;
      double v60 = __Block_byref_object_dispose__370;
      id v61 = 0;
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __71__UIWindow__scrollToTopViewsUnderScreenPointIfNecessary_resultHandler___block_invoke_371;
      v48[3] = &unk_1E53036D0;
      double v52 = v62;
      id v51 = v45;
      id v43 = v42;
      id v49 = v43;
      double v54 = x;
      double v55 = y;
      double v50 = v47;
      double v53 = &v56;
      long long v44 = (void (**)(void, void))[v48 copy];
      objc_storeWeak(v57 + 5, v44);
      v44[2](v44, 0);

      _Block_object_dispose(&v56, 8);
      objc_destroyWeak(&v61);
      _Block_object_dispose(v62, 8);
    }
    id v7 = v45;
  }
}

uint64_t __71__UIWindow__scrollToTopViewsUnderScreenPointIfNecessary_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v7 superview];
  [v7 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  objc_msgSend(v8, "convertRect:toView:", *(void *)(a1 + 32), v10, v12, v14, v16);
  objc_msgSend(v5, "convertRect:toWindow:", 0);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = *(void **)(a1 + 32);
  double v26 = [v6 superview];
  [v6 frame];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  objc_msgSend(v26, "convertRect:toView:", *(void *)(a1 + 32), v28, v30, v32, v34);
  objc_msgSend(v25, "convertRect:toWindow:", 0);
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;

  if (+[UIWindow _transformLayerRotationsAreEnabled])
  {
    BOOL v43 = v20 < v38;
  }
  else
  {
    uint64_t v44 = [(id)UIApp _statusBarOrientationForWindow:*(void *)(a1 + 32)];
    BOOL v43 = v18 < v36;
    BOOL v45 = v18 + v22 > v36 + v40;
    BOOL v46 = v20 < v38;
    if (v44 == 2) {
      BOOL v46 = v20 + v24 > v38 + v42;
    }
    if (v44 != 3) {
      BOOL v45 = v46;
    }
    if (v44 != 4) {
      BOOL v43 = v45;
    }
  }
  if (v43) {
    return -1;
  }
  else {
    return 1;
  }
}

void __71__UIWindow__scrollToTopViewsUnderScreenPointIfNecessary_resultHandler___block_invoke_371(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) window];
    [v3 _fadeCalloutBarIfNeededForTouchInView:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    uint64_t v4 = *(void *)(a1 + 48);
    if (!v4) {
      return;
    }
    double v5 = *(void (**)(void))(v4 + 16);
LABEL_11:
    v5();
    return;
  }
  uint64_t v6 = [*(id *)(a1 + 32) nextObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  double v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v9)
  {
    uint64_t v13 = *(void *)(a1 + 48);
    if (!v13) {
      return;
    }
    double v5 = *(void (**)(void))(v13 + 16);
    goto LABEL_11;
  }
  double v10 = [v9 window];
  double v11 = *(void **)(a1 + 40);

  if (v10 == v11)
  {
    double v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
    objc_msgSend(v12, "_scrollToTopFromTouchAtScreenLocation:resultHandler:", WeakRetained, *(double *)(a1 + 72), *(double *)(a1 + 80));
  }
}

- (BOOL)_touchesInsideShouldHideCalloutBarForViewHierarchy:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = v3;
    do
    {
      int v5 = [v4 _touchesInsideShouldHideCalloutBar];
      if (!v5) {
        break;
      }
      uint64_t v6 = [v4 superview];

      uint64_t v4 = (void *)v6;
    }
    while (v6);
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)_canIgnoreInteractionEvents
{
  return 1;
}

- (void)_sendButtonsForEvent:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(id)UIApp _responderBasedEventDeliverer];
  uint64_t v6 = [v4 _respondersForWindow:self];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    double v24 = v6;
    double v25 = v5;
    uint64_t v23 = *(void *)v32;
    do
    {
      uint64_t v10 = 0;
      uint64_t v26 = v8;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
        if (v5)
        {
          [v5 deliverPressesEvent:v4 toResponder:*(void *)(*((void *)&v31 + 1) + 8 * v10)];
        }
        else
        {
          double v12 = +[_UIResponderIntegrityProtection rip];
          uint64_t v13 = [v4 _pressesForResponder:v11 withPhase:0];
          if ([v13 count])
          {
            [v12 startDeliveringPresses:v13 inPhase:0 withEvent:v4];
            [v11 pressesBegan:v13 withEvent:v4];
            [v12 finishedDeliveringPresses];
          }
          double v14 = objc_msgSend(v4, "_pressesForResponder:withPhase:", v11, 1, v23, v24, v25);

          if ([v14 count])
          {
            [v12 startDeliveringPresses:v14 inPhase:1 withEvent:v4];
            [v11 pressesChanged:v14 withEvent:v4];
            [v12 finishedDeliveringPresses];
          }
          double v15 = [v4 _pressesForResponder:v11 withPhase:3];

          if ([v15 count])
          {
            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            id v16 = v15;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v28;
              do
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v28 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  double v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                  if (([v21 sentPressesEnded] & 1) == 0) {
                    [v21 setSentPressesEnded:1];
                  }
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
              }
              while (v18);
            }

            [v12 startDeliveringPresses:v16 inPhase:3 withEvent:v4];
            [v11 pressesEnded:v16 withEvent:v4];
            [v11 _completeForwardingTouches:v16 phase:3 event:v4];
            [v12 finishedDeliveringPresses];
            uint64_t v6 = v24;
            int v5 = v25;
            uint64_t v9 = v23;
            uint64_t v8 = v26;
          }
          double v22 = [v4 _pressesForResponder:v11 withPhase:4];

          if ([v22 count])
          {
            [v12 startDeliveringPresses:v22 inPhase:4 withEvent:v4];
            [v11 pressesCancelled:v22 withEvent:v4];
            [v11 _completeForwardingTouches:v22 phase:4 event:v4];
            [v12 finishedDeliveringPresses];
          }
        }
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }
}

- (CGRect)convertRect:(CGRect)rect toWindow:(UIWindow *)window
{
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  if (window)
  {
    -[UIWindow convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    uint64_t v17 = [(UIView *)self layer];
    objc_msgSend(v17, "convertRect:toLayer:", self->_transformLayer, x, y, width, height);
    double v10 = v18;
    double v12 = v19;
    double v14 = v20;
    double v16 = v21;
  }
  double v22 = v10;
  double v23 = v12;
  double v24 = v14;
  double v25 = v16;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (CGPoint)_convertOffset:(CGPoint)a3 toWindow:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[UIWindow convertPoint:toWindow:](self, "convertPoint:toWindow:", v7, x, y);
  double v9 = v8;
  double v11 = v10;
  -[UIWindow convertPoint:toWindow:](self, "convertPoint:toWindow:", v7, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v13 = v12;
  double v15 = v14;

  double v16 = v9 - v13;
  double v17 = v11 - v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)_convertOffset:(CGPoint)a3 fromWindow:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[UIWindow convertPoint:fromWindow:](self, "convertPoint:fromWindow:", v7, x, y);
  double v9 = v8;
  double v11 = v10;
  -[UIWindow convertPoint:fromWindow:](self, "convertPoint:fromWindow:", v7, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v13 = v12;
  double v15 = v14;

  double v16 = v9 - v13;
  double v17 = v11 - v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)_convertOffsetToSceneReferenceSpace:(CGPoint)a3
{
  -[UIWindow _convertPointToSceneReferenceSpace:](self, "_convertPointToSceneReferenceSpace:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  -[UIWindow _convertPointToSceneReferenceSpace:](self, "_convertPointToSceneReferenceSpace:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v9 = v5 - v8;
  double v11 = v7 - v10;
  result.double y = v11;
  result.double x = v9;
  return result;
}

- (CGPoint)_convertOffsetFromSceneReferenceSpace:(CGPoint)a3
{
  -[UIWindow _convertPointFromSceneReferenceSpace:](self, "_convertPointFromSceneReferenceSpace:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  -[UIWindow _convertPointFromSceneReferenceSpace:](self, "_convertPointFromSceneReferenceSpace:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v9 = v5 - v8;
  double v11 = v7 - v10;
  result.double y = v11;
  result.double x = v9;
  return result;
}

- (id)_rootForKeyResponderCycle
{
  id v3 = [(UIWindow *)self rootViewController];
  double v4 = [v3 view];

  if (v4)
  {
    double v5 = [(UIWindow *)self rootViewController];
    double v6 = [v5 view];
    double v7 = [v6 _rootForKeyResponderCycle];
  }
  else
  {
    double v7 = self;
  }
  return v7;
}

- (CGPoint)convertWindowToDevice:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self frameOrigin];
  double v6 = x + v5;
  double v8 = y + v7;
  result.double y = v8;
  result.double x = v6;
  return result;
}

- (CGPoint)convertDeviceToWindow:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self frameOrigin];
  double v6 = x - v5;
  double v8 = y - v7;
  result.double y = v8;
  result.double x = v6;
  return result;
}

- (BOOL)_canPromoteFromKeyWindowStack
{
  return 1;
}

- (void)_slideHeaderView:(id)a3 andFooterView:(id)a4 offScreen:(BOOL)a5 forInterfaceOrientation:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  [v10 center];
  double v37 = v12;
  double v38 = v13;
  [v11 center];
  double v15 = v14;
  double v17 = v16;
  [v10 bounds];
  double v19 = v18;
  [v11 bounds];
  double v21 = v20;
  double v22 = [(UIWindow *)self windowScene];
  double v23 = [v22 statusBarManager];
  [v23 statusBarFrame];
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;

  if (v10) {
    [v10 transform];
  }
  else {
    memset(&v39, 0, sizeof(v39));
  }
  v40.origin.double x = v25;
  v40.origin.double y = v27;
  v40.size.double width = v29;
  v40.size.double height = v31;
  CGRect v41 = CGRectApplyAffineTransform(v40, &v39);
  double v32 = v19 + v41.size.height;
  double v33 = v37;
  switch(a6)
  {
    case 1:
      if (v7) {
        double v32 = -v32;
      }
      double v34 = v38 + v32;
      double v35 = -v21;
      if (v7) {
        double v35 = v21;
      }
      goto LABEL_15;
    case 2:
      if (!v7) {
        double v32 = -v32;
      }
      double v34 = v38 + v32;
      double v35 = -v21;
      if (!v7) {
        double v35 = v21;
      }
LABEL_15:
      double v17 = v17 + v35;
      break;
    case 3:
      if (!v7) {
        double v32 = -v32;
      }
      double v33 = v37 + v32;
      double v36 = -v21;
      if (!v7) {
        double v36 = v21;
      }
      goto LABEL_24;
    case 4:
      if (v7) {
        double v32 = -v32;
      }
      double v33 = v37 + v32;
      double v36 = -v21;
      if (v7) {
        double v36 = v21;
      }
LABEL_24:
      double v15 = v15 + v36;
      double v34 = v38;
      break;
    default:
      double v33 = v37;
      double v34 = v38;
      break;
  }
  objc_msgSend(v10, "setCenter:", v33, v34);
  objc_msgSend(v11, "setCenter:", v15, v17);
}

- (void)_positionHeaderView:(id)a3 andFooterView:(id)a4 outsideContentViewForInterfaceOrientation:(int64_t)a5
{
  id v36 = a4;
  id v7 = a3;
  double v8 = [v7 superview];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v35 = v15;

  double v16 = [v36 superview];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  [v7 bounds];
  double v26 = v25;
  [v36 bounds];
  double v27 = v26 * 0.5;
  double v29 = v28 * 0.5;
  switch(a5)
  {
    case 1:
      double v30 = v10 + v14 * 0.5;
      double v31 = v12 - v27;
      double v32 = v18 + v22 * 0.5;
      double v33 = v20 + v24 + v29;
      break;
    case 2:
      double v30 = v10 + v14 * 0.5;
      double v31 = v12 + v35 + v27;
      double v32 = v18 + v22 * 0.5;
      double v33 = v20 - v29;
      break;
    case 3:
      double v30 = v10 + v14 + v27;
      double v34 = 0.5;
      double v31 = v12 + v35 * 0.5;
      double v32 = v18 - v29;
      goto LABEL_7;
    case 4:
      double v30 = v10 - v27;
      double v34 = 0.5;
      double v31 = v12 + v35 * 0.5;
      double v32 = v18 + v22 + v29;
LABEL_7:
      double v33 = v20 + v24 * v34;
      break;
    default:
      double v30 = *MEMORY[0x1E4F1DAD8];
      double v31 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v32 = *MEMORY[0x1E4F1DAD8];
      double v33 = v31;
      break;
  }
  objc_msgSend(v7, "setPosition:", v30, v31, *(void *)&v35);

  objc_msgSend(v36, "setPosition:", v32, v33);
}

- (id)_clientsForRotation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIWindow *)self _rotationViewControllers];
  double v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
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
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(v10, "shouldWindowUseOnePartInterfaceRotationAnimation:", self, (void)v13))
        {
          double v11 = [v10 _viewControllerForRotation];
          [v4 addObject:v11];
        }
        else
        {
          objc_msgSend(v4, "addObject:", v10, (void)v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)__clientsForRotationCallbacks
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v19 = WeakRetained;
    double v4 = [WeakRetained _viewControllersForRotationCallbacks];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = self->_rotationViewControllers;
    uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v27;
      do
      {
        uint64_t v8 = 0;
        uint64_t v20 = v6;
        do
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(obj);
          }
          double v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
          if (([v4 containsObject:v9] & 1) == 0)
          {
            double v10 = [v9 _viewControllersForRotationCallbacks];
            double v11 = [MEMORY[0x1E4F28E60] indexSet];
            long long v22 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id v12 = v10;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = 0;
              uint64_t v16 = *(void *)v23;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v23 != v16) {
                    objc_enumerationMutation(v12);
                  }
                  if ([v4 indexOfObjectIdenticalTo:*(void *)(*((void *)&v22 + 1) + 8 * i)] != 0x7FFFFFFFFFFFFFFFLL) {
                    [v11 addIndex:v15 + i];
                  }
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
                v15 += i;
              }
              while (v14);
            }

            if ([v11 count]) {
              [v12 removeObjectsAtIndexes:v11];
            }
            uint64_t v6 = v20;
            if ([v12 count]) {
              [v4 addObjectsFromArray:v12];
            }
          }
          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v6);
    }

    id WeakRetained = v19;
  }
  else
  {
    double v4 = [(UIWindow *)self _clientsForRotation];
  }

  return v4;
}

- (void)_addRotationViewController:(id)a3
{
  rotationViewControllers = self->_rotationViewControllers;
  if (rotationViewControllers)
  {
    double v9 = (NSMutableArray *)a3;
    [(NSMutableArray *)rotationViewControllers addObject:v9];
    double v4 = v9;
  }
  else
  {
    uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v7 = a3;
    uint64_t v8 = (NSMutableArray *)objc_msgSend([v6 alloc], "initWithObjects:", v7, 0);

    double v4 = self->_rotationViewControllers;
    self->_rotationViewControllers = v8;
  }
}

- (void)_removeRotationViewController:(id)a3
{
}

- (void)_clearPendingKeyboardChanges
{
  *(void *)&self->_windowFlags &= ~0x40000uLL;
}

- (id)_adjustWindowOrientationForTransitionWithSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4 reason:(id)a5
{
  return [(UIWindow *)self _createForcedOrientationTransactionTokenWithSupportedOrientations:a3 preferredOrientation:a4 forImmediateCommit:0 reason:a5];
}

- (id)_createForcedOrientationTransactionTokenWithSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4 forImmediateCommit:(BOOL)a5 reason:(id)a6
{
  BOOL v6 = a5;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  double v10 = (__CFString *)a6;
  double v11 = [(UIWindow *)self windowScene];
  int v12 = [v11 _canDynamicallySpecifySupportedInterfaceOrientations];

  if (!v12)
  {
    long long v27 = 0;
    goto LABEL_19;
  }
  uint64_t v13 = [(UIWindow *)self _orientationTransactionToken];
  uint64_t v14 = v13;
  if (v13)
  {
    uint64_t v15 = [(__CFString *)v13 state];
    unint64_t v16 = [(UIWindow *)self _windowInterfaceOrientation];
    double v17 = [(UIWindow *)self windowScene];
    unint64_t v18 = [v17 interfaceOrientation];

    if (v15 != 1 && v16 == v18)
    {
LABEL_5:
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("OrientationTransaction", &qword_1EB259E68);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        CGRect v41 = *(id *)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          if (self)
          {
            double v42 = NSString;
            BOOL v43 = self;
            uint64_t v44 = (objc_class *)objc_opt_class();
            BOOL v45 = NSStringFromClass(v44);
            BOOL v46 = [v42 stringWithFormat:@"<%@: %p>", v45, v43];
          }
          else
          {
            BOOL v46 = @"(nil)";
          }
          *(_DWORD *)buf = 138412546;
          id v61 = v46;
          __int16 v62 = 2112;
          id v63 = v14;
          _os_log_impl(&dword_1853B0000, v41, OS_LOG_TYPE_ERROR, "%@: Cleaning up previous orientation transaction: %@", buf, 0x16u);
        }
      }
      [(UIWindow *)self _cleanupOrientationTransactionIfNecessary];
      goto LABEL_7;
    }
    if (os_variant_has_internal_diagnostics())
    {
      double v37 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        goto LABEL_29;
      }
      _UIInterfaceOrientationDebugDescription(v16);
      double v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CGAffineTransform v39 = _UIInterfaceOrientationDebugDescription(v18);
      *(_DWORD *)buf = 138413058;
      id v61 = v10;
      __int16 v62 = 2112;
      id v63 = v38;
      __int16 v64 = 2112;
      long long v65 = v39;
      __int16 v66 = 2112;
      long long v67 = v14;
      _os_log_fault_impl(&dword_1853B0000, v37, OS_LOG_TYPE_FAULT, "A new orientation transaction token is being requested while a valid one already exists. reason=%@; windowOrient"
        "ation=%@; sceneOrientation=%@; existingTransaction=%@",
        buf,
        0x2Au);
    }
    else
    {
      id v36 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB259E58) + 8);
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
      double v37 = v36;
      _UIInterfaceOrientationDebugDescription(v16);
      double v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CGAffineTransform v39 = _UIInterfaceOrientationDebugDescription(v18);
      *(_DWORD *)buf = 138413058;
      id v61 = v10;
      __int16 v62 = 2112;
      id v63 = v38;
      __int16 v64 = 2112;
      long long v65 = v39;
      __int16 v66 = 2112;
      long long v67 = v14;
      _os_log_impl(&dword_1853B0000, v37, OS_LOG_TYPE_ERROR, "A new orientation transaction token is being requested while a valid one already exists. reason=%@; windowOrient"
        "ation=%@; sceneOrientation=%@; existingTransaction=%@",
        buf,
        0x2Au);
    }

LABEL_29:
LABEL_30:
    if (v15 == 1)
    {
      unint64_t v40 = __UILogGetCategoryCachedImpl("OrientationTransaction", &qword_1EB259E60);
      if (*(unsigned char *)v40)
      {
        double v52 = *(id *)(v40 + 8);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          if (self)
          {
            double v53 = NSString;
            double v54 = self;
            double v55 = (objc_class *)objc_opt_class();
            uint64_t v56 = NSStringFromClass(v55);
            double v57 = [v53 stringWithFormat:@"<%@: %p>", v56, v54];
          }
          else
          {
            double v57 = @"(nil)";
          }
          *(_DWORD *)buf = 138412546;
          id v61 = v57;
          __int16 v62 = 2112;
          id v63 = v14;
          _os_log_impl(&dword_1853B0000, v52, OS_LOG_TYPE_ERROR, "%@: Cancelling previous orientation transaction because a new one was requested: %@", buf, 0x16u);
        }
      }
      [(__CFString *)v14 cancel];
      goto LABEL_7;
    }
    goto LABEL_5;
  }
LABEL_7:
  int64_t v20 = [(UIWindow *)self _windowInterfaceOrientation];
  if ([(UIWindow *)self isInterfaceAutorotationDisabled])
  {
    unint64_t v21 = __UILogGetCategoryCachedImpl("OrientationTransaction", &qword_1EB259E70);
    if (*(unsigned char *)v21)
    {
      long long v22 = *(id *)(v21 + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        if (self)
        {
          long long v23 = NSString;
          long long v24 = self;
          long long v25 = (objc_class *)objc_opt_class();
          uint64_t v58 = NSStringFromClass(v25);
          long long v26 = [v23 stringWithFormat:@"<%@: %p>", v58, v24];
        }
        else
        {
          long long v26 = @"(nil)";
        }
        double v59 = v26;
        _UIInterfaceOrientationDebugDescription(v20);
        id v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        id v61 = v26;
        __int16 v62 = 2112;
        id v63 = v51;
        _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "%@: Window autorotation is already disabled. Will use the current window orientation (%@) as the target orientation.", buf, 0x16u);
      }
    }
  }
  else
  {
    [(UIWindow *)self _executeDeferredOrientationUpdate];
    int64_t v20 = [(UIWindow *)self _interfaceOrientationForSupportedOrientations:a3 preferredOrientation:a4];
  }
  long long v27 = [[_UIForcedOrientationTransactionToken alloc] initWithOriginalOrientation:[(UIWindow *)self _windowInterfaceOrientation] handler:self reason:v10 disablingInterfaceAutorotation:!v6];

  [(UIWindow *)self _setOrientationTransactionToken:v27];
  if (!v6) {
    [(UIWindow *)self beginDisablingInterfaceAutorotation];
  }
  if (v20 != [(UIWindow *)self _windowInterfaceOrientation]) {
    -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:]((id *)&self->super.super.super.isa, v20, 1, 1, 0.0);
  }
  unint64_t v28 = __UILogGetCategoryCachedImpl("OrientationTransaction", &qword_1EB259E78);
  if (*(unsigned char *)v28)
  {
    double v30 = *(id *)(v28 + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        double v31 = NSString;
        uint64_t v32 = self;
        double v33 = (objc_class *)objc_opt_class();
        double v34 = NSStringFromClass(v33);
        double v35 = [v31 stringWithFormat:@"<%@: %p>", v34, v32];
      }
      else
      {
        double v35 = @"(nil)";
      }
      CGRect v47 = v35;
      uint64_t v48 = _UIInterfaceOrientationDebugDescription(v20);
      _UIInterfaceOrientationDebugDescription(a4);
      id v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
      double v50 = _UIInterfaceOrientationMaskDebugDescription(a3);
      *(_DWORD *)buf = 138413314;
      id v61 = v35;
      __int16 v62 = 2112;
      id v63 = v10;
      __int16 v64 = 2112;
      long long v65 = v48;
      __int16 v66 = 2112;
      long long v67 = v49;
      __int16 v68 = 2112;
      long long v69 = v50;
      _os_log_impl(&dword_1853B0000, v30, OS_LOG_TYPE_ERROR, "%@: Orientation transaction issued for reason: %@. targetOrientation=%@; preferredOrientation=%@; supportedOrientations=[%@].",
        buf,
        0x34u);
    }
  }
LABEL_19:

  return v27;
}

- (void)commitOrientationTransaction:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = [(UIWindow *)self _orientationTransactionToken];

  if (v8 != v7)
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = [(UIWindow *)self _orientationTransactionToken];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIWindow.m", 4301, @"Unexpected orientation transaction token. Expected: %@; Received: %@",
      v13,
      v7);
  }
  if ([v7 disablesInterfaceAutorotation]) {
    [(UIWindow *)self endDisablingInterfaceAutorotationAnimated:v4];
  }
  else {
    [(UIWindow *)self _updateOrientationPreferencesAnimated:v4];
  }
  *(void *)&self->_windowFlags |= 0x8000000000uLL;
  double v9 = [(UIWindow *)self _orientationTransactionToken];
  objc_initWeak(&location, self);
  dispatch_time_t v10 = dispatch_time(0, 50000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__UIWindow_commitOrientationTransaction_animated___block_invoke;
  block[3] = &unk_1E52D9960;
  objc_copyWeak(&v16, &location);
  id v15 = v9;
  id v11 = v9;
  dispatch_after(v10, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __50__UIWindow_commitOrientationTransaction_animated___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained _orientationTransactionToken];
  BOOL v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("OrientationTransaction", &_UIInternalPreference_ShowTouchesForAllProcesses_block_invoke_5___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      BOOL v6 = *(id *)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = WeakRetained;
        uint64_t v14 = v7;
        if (v7)
        {
          id v8 = NSString;
          id v9 = v7;
          dispatch_time_t v10 = (objc_class *)objc_opt_class();
          id v11 = NSStringFromClass(v10);
          int v12 = [v8 stringWithFormat:@"<%@: %p>", v11, v9];
        }
        else
        {
          int v12 = @"(nil)";
        }

        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        id v16 = v12;
        __int16 v17 = 2112;
        uint64_t v18 = v13;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "%@: Commit of orientation transaction timed-out. Proceeding with cleanup. token=%@", buf, 0x16u);
      }
    }
    [WeakRetained _cleanupOrientationTransactionIfNecessary];
  }
}

- (void)cancelOrientationTransaction:(id)a3
{
  id v8 = a3;
  id v5 = [(UIWindow *)self _orientationTransactionToken];

  if (v5 != v8)
  {
    BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [(UIWindow *)self _orientationTransactionToken];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIWindow.m", 4331, @"Unexpected orientation transaction token. Expected: %@; Received: %@",
      v7,
      v8);
  }
  [(UIWindow *)self _setOrientationTransactionToken:0];
  if ([v8 disablesInterfaceAutorotation]) {
    [(UIWindow *)self endDisablingInterfaceAutorotationAnimated:0];
  }
  else {
    [(UIWindow *)self _updateOrientationPreferencesAnimated:0];
  }
  -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:]((id *)&self->super.super.super.isa, [v8 originalInterfaceOrientation], 1, 1, 0.0);
}

- (id)_interfaceOrientationMapResolver
{
  return self->_interfaceOrientationMapResolver;
}

- (void)_setInterfaceOrientationMapResolver:(id)a3
{
}

- (int64_t)_interfaceOrientationForSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4
{
  id v7 = [(UIWindow *)self _interfaceOrientationMapResolver];

  if (v7)
  {
    id v8 = [(UIWindow *)self _interfaceOrientationMapResolver];
    uint64_t v9 = [v8 interfaceOrientationForSupportedOrientations:a3 preferredOrientation:a4];
LABEL_5:
    int64_t v11 = v9;

    return v11;
  }
  dispatch_time_t v10 = [(UIWindow *)self windowScene];

  if (v10)
  {
    id v8 = [(UIWindow *)self windowScene];
    uint64_t v9 = [v8 _interfaceOrientationForSupportedOrientations:a3 preferredOrientation:a4];
    goto LABEL_5;
  }
  uint64_t v13 = (void *)UIApp;
  int64_t v14 = [(UIWindow *)self _windowInterfaceOrientation];
  return [v13 _fallbackInterfaceOrientationForSupportedOrientations:a3 preferredOrientation:a4 currentOrientation:v14];
}

- (id)_acquireOrientationLockAssertionWithReason:(void *)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    BOOL v4 = NSString;
    id v5 = a1;
    BOOL v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = [v4 stringWithFormat:@"<%@: %p>", v7, v5];

    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Orientation", &_acquireOrientationLockAssertionWithReason____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v19 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id location = 138412546;
        *(void *)&location[4] = v8;
        __int16 v24 = 2112;
        id v25 = v3;
        _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "%@: Issuing orientation lock assertion for reason: %@", location, 0x16u);
      }
    }
    [v5 beginDisablingInterfaceAutorotation];
    objc_initWeak((id *)location, v5);
    dispatch_time_t v10 = [_UIDeallocInvalidatable alloc];
    id v11 = v5;
    int v12 = NSString;
    uint64_t v13 = (objc_class *)objc_opt_class();
    int64_t v14 = NSStringFromClass(v13);
    id v15 = [v12 stringWithFormat:@"<%@: %p>", v14, v11];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __55__UIWindow__acquireOrientationLockAssertionWithReason___block_invoke;
    v20[3] = &unk_1E5303720;
    id v16 = v8;
    id v21 = v16;
    objc_copyWeak(&v22, (id *)location);
    id v17 = -[_UIDeallocInvalidatable initWithIdentifier:faultForDeallocInvalidation:invalidationBlock:](v10, v15, 0, v20);
    objc_destroyWeak(&v22);

    objc_destroyWeak((id *)location);
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

void __55__UIWindow__acquireOrientationLockAssertionWithReason___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Orientation", _UIInternalPreference_ShowTouchesForAllProcesses_block_invoke_6___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    BOOL v4 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "%@: Invalidating orientation lock assertion.", (uint8_t *)&v6, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained endDisablingInterfaceAutorotation];
}

BOOL __89__UIWindow__shouldAutorotateToInterfaceOrientation_checkForDismissal_isRotationDisabled___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  int v6 = [v5 shouldAutorotate];
  uint64_t v7 = *(unsigned char **)(a1 + 32);
  if (v7 && (v6 & 1) == 0) {
    *uint64_t v7 = 1;
  }
  if (v6) {
    BOOL v8 = -[UIViewController __withSupportedInterfaceOrientation:apply:](v5, a3, 0);
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

void __45__UIWindow__executeDeferredOrientationUpdate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void (***)(void, void, void))(v1 + 32);
    uint64_t v3 = *(void *)(v1 + 16);
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
  }
  BOOL v4 = (void *)UIApp;
  id v5 = v2;
  ((void (**)(id, uint64_t, uint64_t))v2)[2](v5, v3, [v4 _expectedViewOrientation]);
}

uint64_t __53__UIWindow__adjustSizeClassesAndResizeWindowToFrame___block_invoke(uint64_t a1)
{
  kdebug_trace();
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 interfaceOrientation];
  BOOL v4 = [*(id *)(a1 + 32) screen];
  id v5 = [*(id *)(a1 + 40) _transitionCoordinator];
  objc_msgSend(v2, "_willChangeToSize:orientation:screen:withTransitionCoordinator:", v3, v4, v5, *(double *)(a1 + 72), *(double *)(a1 + 80));

  int v6 = [*(id *)(a1 + 40) _transitionCoordinator];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __53__UIWindow__adjustSizeClassesAndResizeWindowToFrame___block_invoke_2;
  v11[3] = &unk_1E52DA598;
  void v11[4] = *(void *)(a1 + 32);
  [v6 animateAlongsideTransition:v11 completion:0];

  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [*(id *)(a1 + 40) _transitionCoordinator];
    objc_msgSend(v7, "_window:viewWillTransitionToSize:withTransitionCoordinator:", v8, v9, *(double *)(a1 + 72), *(double *)(a1 + 80));
  }
  return kdebug_trace();
}

uint64_t __53__UIWindow__adjustSizeClassesAndResizeWindowToFrame___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutBelowIfNeeded];
}

- (void)_handleDeviceOrientationChange:(id)a3
{
  if (a3)
  {
    BOOL v4 = [a3 userInfo];
    id v5 = [v4 objectForKey:@"UIDeviceOrientationRotateAnimatedUserInfoKey"];
    uint64_t v6 = [v5 BOOLValue];
  }
  else
  {
    uint64_t v6 = 1;
  }
  [(UIWindow *)self _updateInterfaceOrientationFromDeviceOrientationIfRotationEnabled:v6];
}

- (void)_handleSBActiveInterfaceOrientationChange:(id)a3
{
  if (a3)
  {
    BOOL v4 = [a3 userInfo];
    id v5 = [v4 objectForKey:@"_UIAppActiveInterfaceOrientationRotateAnimatedUserInfoKey"];
    uint64_t v6 = [v5 BOOLValue];
  }
  else
  {
    uint64_t v6 = 1;
  }
  [(UIWindow *)self _updateInterfaceOrientationFromActiveInterfaceOrientationIfRotationEnabled:v6];
}

uint64_t __57__UIWindow__updateToInterfaceOrientation_duration_force___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    *(void *)(*(void *)(result + 32) + 496) = *(void *)(result + 40);
    CGPoint result = [*(id *)(result + 32) _isHostedInAnotherProcess];
    if ((result & 1) == 0)
    {
      uint64_t v3 = *(void **)(v2 + 32);
      return [v3 _updateTransformLayer];
    }
  }
  return result;
}

- (void)_updateInterfaceOrientationFromDeviceOrientation
{
}

- (void)_updateInterfaceOrientationFromDeviceOrientationIfRotationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIWindow *)self isInterfaceAutorotationDisabled])
  {
    *(void *)&self->_windowFlags |= 0x10000uLL;
  }
  else
  {
    [(UIWindow *)self _updateInterfaceOrientationFromDeviceOrientation:v3];
  }
}

- (void)_updateInterfaceOrientationFromDeviceOrientation:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIWindow *)self _windowOwnsInterfaceOrientation])
  {
    id v5 = +[UIDevice currentDevice];
    uint64_t v6 = [v5 orientation];

    if ((unint64_t)(v6 - 1) <= 3)
    {
      [(UIWindow *)self _updateToNotificationProvidedInterfaceOrientation:v6 animated:v3];
    }
  }
  else
  {
    [(UIWindow *)self _updateOrientationPreferencesAnimated:v3];
  }
}

- (void)_updateToNotificationProvidedInterfaceOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_viewOrientation == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
    if (WeakRetained)
    {
      if ([(id)objc_opt_class() _transformLayerRotationsAreEnabled])
      {
        if (([WeakRetained _isViewControllerInWindowHierarchy] & 1) == 0) {
          -[UIViewController _updateLastKnownInterfaceOrientationOnPresentionStack:]((uint64_t)WeakRetained, a3);
        }
      }
      else
      {
        id v8 = WeakRetained;
        uint64_t v9 = (uint64_t)v8;
        if (a3 == 2) {
          double v10 = 3.14159265;
        }
        else {
          double v10 = 0.0;
        }
        id v11 = v8;
        do
        {
          uint64_t v12 = [v11 presentedViewController];
          if (!v12) {
            break;
          }
          uint64_t v13 = (void *)v12;
          uint64_t v14 = [v11 _lastKnownInterfaceOrientation];
          int64_t viewOrientation = self->_viewOrientation;

          if (v14 == viewOrientation) {
            break;
          }
          if ([v11 modalPresentationStyle] != 16
            && [v11 modalPresentationStyle] != 2
            && [v11 modalPresentationStyle] != 4
            && [v11 _isViewControllerInWindowHierarchy]
            && -[UIViewController __withSupportedInterfaceOrientation:apply:](v11, a3, 0))
          {
            id v16 = [v11 presentedViewController];
            int v17 = [v16 _isViewControllerInWindowHierarchy];

            uint64_t v18 = [v11 _lastKnownInterfaceOrientation];
            if (v17) {
              [v11 window:self willRotateToInterfaceOrientation:a3 duration:0.0];
            }
            memset(&v23, 0, sizeof(v23));
            if (a3 == 1)
            {
              CGFloat v19 = 0.0;
            }
            else if (a3 == 3)
            {
              CGFloat v19 = 1.57079633;
            }
            else
            {
              CGFloat v19 = v10;
              if (a3 == 4) {
                CGFloat v19 = -1.57079633;
              }
            }
            CGAffineTransformMakeRotation(&v23, v19);
            *(float64x2_t *)&v23.a = vrndaq_f64(*(float64x2_t *)&v23.a);
            *(float64x2_t *)&v23.c = vrndaq_f64(*(float64x2_t *)&v23.c);
            *(float64x2_t *)&v23.tdouble x = vrndaq_f64(*(float64x2_t *)&v23.tx);
            int64_t v20 = [v11 rotatingContentViewForWindow:self];
            CGAffineTransform v22 = v23;
            [v20 setTransform:&v22];
            [v11 _centerForOrientation:a3];
            objc_msgSend(v20, "setCenter:");
            [v11 _boundsForOrientation:a3];
            objc_msgSend(v20, "setBounds:");
            if (v17)
            {
              [v11 window:self willAnimateRotationToInterfaceOrientation:a3 duration:0.0];
              [v11 window:self didRotateFromInterfaceOrientation:v18];
            }
          }
          uint64_t v21 = [v11 presentedViewController];

          id v11 = (void *)v21;
        }
        while (v21);
        -[UIViewController _updateLastKnownInterfaceOrientationOnPresentionStack:](v9, a3);
      }
      if ([(UIWindow *)self _windowControlsStatusBarOrientation]) {
        [(id)UIApp _setExpectedViewOrientation:self->_viewOrientation];
      }
    }
  }
  else
  {
    double v7 = 0.0;
    if (a4) {
      [(UIWindow *)self _rotationDuration];
    }
    [(UIWindow *)self _updateToInterfaceOrientation:a3 duration:0 force:v7];
  }
}

- (void)endDisablingInterfaceAutorotation
{
}

- (void)setAutorotates:(BOOL)a3
{
}

- (void)_forceTwoPartRotationAnimation:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&self->_windowFlags & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (void)_setRotatableViewOrientation:(int64_t)a3 duration:(double)a4 force:(BOOL)a5
{
}

- (void)_legacySetRotatableViewOrientation:(int64_t)a3 duration:(double)a4
{
}

- (void)_legacySetRotatableViewOrientation:(int64_t)a3 duration:(double)a4 force:(BOOL)a5
{
}

- (void)_legacySetRotatableViewOrientation:(int64_t)a3 updateStatusBar:(BOOL)a4 duration:(double)a5 force:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  if ([(UIWindow *)self _windowOwnsInterfaceOrientation])
  {
    -[UIWindow _internal_setRotatableViewOrientation:updateStatusBar:duration:force:]((id *)&self->super.super.super.isa, a3, v8, v6, a5);
  }
  else if (os_variant_has_internal_diagnostics())
  {
    uint64_t v12 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF UIKIT: Cannot set the orientation of a window that does not own its interface orientation.", buf, 2u);
    }
  }
  else
  {
    id v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_legacySetRotatableViewOrientation_updateStatusBar_duration_force____s_category)+ 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Cannot set the orientation of a window that does not own its interface orientation.", v13, 2u);
    }
  }
}

- (int64_t)_orientationInSceneSpace
{
  uint64_t v3 = [(UIWindow *)self windowScene];
  BOOL v4 = [v3 _cachedInterfaceOrientation];
  id v5 = [(UIWindow *)self windowScene];
  BOOL v6 = v5;
  if (v4)
  {
    double v7 = [v5 _cachedInterfaceOrientation];
    uint64_t v8 = [v7 integerValue];
  }
  else
  {
    double v7 = [v5 _effectiveSettings];
    uint64_t v8 = [v7 interfaceOrientation];
  }
  int64_t v9 = v8;

  return v9;
}

uint64_t __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:0x10000 delay:a2 options:a3 animations:*(double *)(a1 + 32) * 0.5 completion:0.0];
}

uint64_t __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 84))
  {
    uint64_t v2 = [*(id *)(a1 + 32) lastObject];
    [v2 slideHeaderViewAndFooterViewOffScreen:1 forInterfaceOrientation:*(void *)(a1 + 56)];
    uint64_t v3 = *(void *)(a1 + 56);
    switch(v3)
    {
      case 1:
        double v4 = 0.0;
        break;
      case 3:
        double v4 = 90.0;
        break;
      case 4:
        double v4 = -90.0;
        break;
      default:
        double v4 = 180.0;
        if (v3 != 2) {
          double v4 = 0.0;
        }
        break;
    }
    double v5 = v4 + (double)*(int *)(a1 + 80) * 0.5;
    BOOL v6 = [v2 contentView];
    CGAffineTransformMakeRotation(&v8, v5 * 0.0174532925);
    [v6 setTransform:&v8];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    return [*(id *)(a1 + 40) window:*(void *)(a1 + 48) willAnimateFirstHalfOfRotationToInterfaceOrientation:*(void *)(a1 + 64) duration:*(double *)(a1 + 72) * 0.5];
  }
  return result;
}

uint64_t __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _finishedFirstHalfRotation:a2 context:*(void *)(a1 + 40)];
}

uint64_t __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:4 delay:a2 options:a3 animations:*(double *)(a1 + 32) completion:0.0];
}

void __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_5(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  switch(v2)
  {
    case 1:
      double v3 = 0.0;
      break;
    case 3:
      double v3 = 1.57079633;
      break;
    case 4:
      double v3 = -1.57079633;
      break;
    default:
      double v3 = 3.14159265;
      if (v2 != 2) {
        double v3 = 0.0;
      }
      break;
  }
  memset(&v59, 0, sizeof(v59));
  CGAffineTransformMakeRotation(&v59, v3);
  *(float64x2_t *)&v59.a = vrndaq_f64(*(float64x2_t *)&v59.a);
  *(float64x2_t *)&v59.c = vrndaq_f64(*(float64x2_t *)&v59.c);
  *(float64x2_t *)&v59.tdouble x = vrndaq_f64(*(float64x2_t *)&v59.tx);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v56 != v7) {
          objc_enumerationMutation(v4);
        }
        int64_t v9 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if (*(unsigned char *)(a1 + 72)
          && (double v10 = *(void **)(a1 + 40),
              [*(id *)(*((void *)&v55 + 1) + 8 * i) rotatingClient],
              id v11 = objc_claimAutoreleasedReturnValue(),
              LODWORD(v10) = [v10 containsObject:v11],
              v11,
              !v10))
        {
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_6;
          v52[3] = &unk_1E52E7948;
          v52[4] = v9;
          CGAffineTransform v53 = v59;
          +[UIView performWithoutAnimation:v52];
        }
        else
        {
          uint64_t v12 = *(void **)(a1 + 48);
          if ((dyld_program_sdk_at_least() & 1) != 0
            || v12 && [v12 _forceLayoutEngineSolutionInRationalEdges])
          {
            CGAffineTransform v54 = v59;
            if (!CGAffineTransformIsIdentity(&v54))
            {
              uint64_t v13 = [v9 contentView];
              [v13 _setHostsLayoutEngine:1];
            }
          }
          uint64_t v14 = [v9 contentView];
          CGAffineTransform v54 = v59;
          [v14 setTransform:&v54];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v6);
  }

  *(void *)(*(void *)(a1 + 48) + 496) = *(void *)(a1 + 56);
  uint64_t v15 = [(id)UIApp _statusBarOrientationForWindow:*(void *)(a1 + 48)];
  uint64_t v16 = v15;
  if (*(unsigned char *)(a1 + 73) && *(void *)(a1 + 56) != v15)
  {
    int v17 = [[UIStatusBarOrientationAnimationParameters alloc] initWithDefaultParameters];
    [(UIStatusBarOrientationAnimationParameters *)v17 setOrientationAnimation:2];
    [(UIStatusBarAnimationParameters *)v17 setDuration:*(double *)(a1 + 64)];
    uint64_t v18 = (void *)UIApp;
    uint64_t v19 = *(void *)(a1 + 56);
    int64_t v20 = [*(id *)(a1 + 48) windowScene];
    [v18 setStatusBarOrientation:v19 fromOrientation:v16 windowScene:v20 animationParameters:v17 updateBlock:0];
  }
  uint64_t v43 = v16;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v21 = *(id *)(a1 + 32);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v49 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = [*(id *)(*((void *)&v48 + 1) + 8 * j) rotatingClient];
        int v27 = [*(id *)(a1 + 40) containsObject:v26];
        if (*(unsigned char *)(a1 + 74)) {
          BOOL v28 = 1;
        }
        else {
          BOOL v28 = v27 == 0;
        }
        if (v28 || (objc_opt_respondsToSelector() & 1) == 0)
        {
          if (objc_opt_respondsToSelector()) {
            [v26 window:*(void *)(a1 + 48) setupWithInterfaceOrientation:*(void *)(a1 + 56)];
          }
        }
        else
        {
          [v26 window:*(void *)(a1 + 48) willAnimateRotationToInterfaceOrientation:*(void *)(a1 + 56) duration:*(double *)(a1 + 64)];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v23);
  }

  if (*(unsigned char *)(a1 + 75) && !*(unsigned char *)(a1 + 74))
  {
    long long v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v30 = *(void *)(a1 + 48);
    double v31 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v32 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
    double v33 = objc_msgSend(v31, "dictionaryWithObjectsAndKeys:", v32, @"UIWindowNewOrientationUserInfoKey", 0);
    [v29 postNotificationName:@"UIWindowWillAnimateRotationNotification" object:v30 userInfo:v33];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v34 = *(id *)(a1 + 32);
    uint64_t v35 = [v34 countByEnumeratingWithState:&v44 objects:v60 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v45;
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v45 != v37) {
            objc_enumerationMutation(v34);
          }
          CGAffineTransform v39 = *(void **)(*((void *)&v44 + 1) + 8 * k);
          unint64_t v40 = *(void **)(a1 + 40);
          CGRect v41 = [v39 rotatingClient];
          LODWORD(v40) = [v40 containsObject:v41];

          if (v40) {
            [v39 rotateSnapshots];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v44 objects:v60 count:16];
      }
      while (v36);
    }
  }
  if (*(void *)(a1 + 56) != v43)
  {
    double v42 = [*(id *)(a1 + 48) windowScene];
    [v42 _updateClientSettingsToInterfaceOrientation:*(void *)(a1 + 56) withAnimationDuration:*(double *)(a1 + 64)];
  }
}

void __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) contentView];
  long long v3 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v3;
  v4[2] = *(_OWORD *)(a1 + 72);
  [v2 setTransform:v4];
}

uint64_t __88__UIWindow__setRotatableClient_toOrientation_updateStatusBar_duration_force_isRotating___block_invoke_7(uint64_t a1, uint64_t a2)
{
  long long v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = *(unsigned __int8 *)(a1 + 49) != 0;
  }
  return [v3 _finishedFullRotation:a2 context:*(void *)(a1 + 40) skipNotification:v4];
}

- (void)_finishedFirstHalfRotation:(id)a3 finished:(BOOL)a4 context:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [v6 lastObject];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "window:didAnimateFirstHalfOfRotationToInterfaceOrientation:", self, objc_msgSend(v7, "toOrientation"));
  }
  memset(&v27, 0, sizeof(v27));
  uint64_t v9 = [v7 toOrientation];
  double v10 = 0.0;
  if (v9 != 1)
  {
    if (objc_msgSend(v7, "toOrientation", 0.0) == 4)
    {
      double v10 = -1.57079633;
    }
    else if ([v7 toOrientation] == 3)
    {
      double v10 = 1.57079633;
    }
    else
    {
      uint64_t v11 = [v7 toOrientation];
      double v10 = 3.14159265;
      if (v11 != 2) {
        double v10 = 0.0;
      }
    }
  }
  CGAffineTransformMakeRotation(&v27, v10);
  *(float64x2_t *)&v27.a = vrndaq_f64(*(float64x2_t *)&v27.a);
  *(float64x2_t *)&v27.c = vrndaq_f64(*(float64x2_t *)&v27.c);
  *(float64x2_t *)&v27.tdouble x = vrndaq_f64(*(float64x2_t *)&v27.tx);
  [v7 duration];
  double v13 = v12;
  if (v12 > 0.0) {
    [v7 finishFirstHalfRotation];
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __56__UIWindow__finishedFirstHalfRotation_finished_context___block_invoke;
  v25[3] = &unk_1E52E92B0;
  id v26 = v7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__UIWindow__finishedFirstHalfRotation_finished_context___block_invoke_2;
  v19[3] = &unk_1E5303888;
  BOOL v24 = v13 > 0.0;
  id v20 = v26;
  id v21 = self;
  id v22 = WeakRetained;
  CGAffineTransform v23 = v27;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__UIWindow__finishedFirstHalfRotation_finished_context___block_invoke_3;
  v17[3] = &unk_1E52DA660;
  v17[4] = self;
  id v18 = v6;
  id v14 = v26;
  id v15 = WeakRetained;
  id v16 = v6;
  +[UIView conditionallyAnimate:v13 > 0.0 withAnimation:v25 layout:v19 completion:v17];
}

void __56__UIWindow__finishedFirstHalfRotation_finished_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v7 = a2;
  [v4 duration];
  +[UIView animateWithDuration:0x20000 delay:v7 options:v5 animations:v6 * 0.5 completion:0.0];
}

void __56__UIWindow__finishedFirstHalfRotation_finished_context___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 104)) {
    objc_msgSend(*(id *)(a1 + 32), "slideHeaderViewAndFooterViewOffScreen:forInterfaceOrientation:", 0, objc_msgSend(*(id *)(a1 + 32), "toOrientation"));
  }
  *(void *)(*(void *)(a1 + 40) + 496) = [*(id *)(a1 + 32) toOrientation];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v2 = *(void **)(a1 + 48);
    uint64_t v4 = [*(id *)(a1 + 32) fromOrientation];
    [*(id *)(a1 + 32) duration];
    [v2 window:v3 willAnimateSecondHalfOfRotationFromInterfaceOrientation:v4 duration:v5 * 0.5];
  }
  double v6 = [*(id *)(a1 + 32) contentView];
  long long v7 = *(_OWORD *)(a1 + 72);
  v8[0] = *(_OWORD *)(a1 + 56);
  v8[1] = v7;
  void v8[2] = *(_OWORD *)(a1 + 88);
  [v6 setTransform:v8];
}

uint64_t __56__UIWindow__finishedFirstHalfRotation_finished_context___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _finishedFullRotation:a2 context:*(void *)(a1 + 40)];
}

- (void)_finishedFullRotation:(BOOL)a3 context:(id)a4 skipNotification:(BOOL)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (([v11 skipClientRotationCallbacks] & 1) == 0) {
          [v11 finishFullRotateUsingOnePartAnimation:(*(void *)&self->_windowFlags >> 11) & 1];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v8);
  }
  *(void *)&self->_windowFlags &= 0xFFFFFFFFFFFFF3FFLL;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        int v17 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        if (([v17 skipClientRotationCallbacks] & 1) == 0)
        {
          id v18 = [v17 rotatingClient];
          char v19 = objc_opt_respondsToSelector();

          if (v19)
          {
            id v20 = [v17 rotatingClient];
            objc_msgSend(v20, "window:didRotateFromInterfaceOrientation:", self, objc_msgSend(v17, "fromOrientation"));
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v14);
  }

  if ((unint64_t)[v12 count] > 1
    || ([v12 lastObject],
        id v21 = (id)objc_claimAutoreleasedReturnValue(),
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateViewController),
        BOOL v23 = v21 == WeakRetained,
        WeakRetained,
        v21,
        !v23))
  {
    if (!a5)
    {
      BOOL v24 = [v12 lastObject];
      id v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v26 = (void *)MEMORY[0x1E4F1C9E8];
      CGAffineTransform v27 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v24, "fromOrientation"));
      BOOL v28 = objc_msgSend(v26, "dictionaryWithObjectsAndKeys:", v27, @"UIWindowOldOrientationUserInfoKey", 0);
      [v25 postNotificationName:@"UIWindowDidRotateNotification" object:self userInfo:v28];
    }
  }
  [(UIWindow *)self endDisablingInterfaceAutorotation];
}

- (void)_finishedFullRotation:(id)a3 finished:(id)a4 context:(id)a5
{
  [(UIWindow *)self _finishedFullRotation:a4 != 0 context:a5 skipNotification:0];
}

- (void)_setWindowInterfaceOrientation:(int64_t)a3
{
  self->_int64_t viewOrientation = a3;
}

+ (unsigned)_synchronizeDrawingAcrossProcesses
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[UIScene _synchronizedDrawingFence];
  uint64_t v3 = [v2 CAFenceHandle];
  unsigned int v4 = [v3 copyPort];

  if (v4 - 1 <= 0xFFFFFFFD)
  {
    if (os_variant_has_internal_diagnostics())
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Fence", &_synchronizeDrawingAcrossProcesses___s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        uint64_t v7 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = (void *)MEMORY[0x1E4F29060];
          uint64_t v9 = v7;
          double v10 = [v8 callStackSymbols];
          v11[0] = 67109378;
          v11[1] = v4;
          __int16 v12 = 2114;
          uint64_t v13 = v10;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "returning a raw fence port (%x) from deprecated UIWindow SPI %{public}@", (uint8_t *)v11, 0x12u);
        }
      }
    }
  }
  [v2 invalidate];

  return v4;
}

+ (void)_synchronizeDrawingAcrossProcessesOverPort:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Fence", &_synchronizeDrawingAcrossProcessesOverPort____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v9 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        double v10 = (void *)MEMORY[0x1E4F29060];
        uint64_t v11 = v9;
        __int16 v12 = [v10 callStackSymbols];
        v13[0] = 67109378;
        v13[1] = a3;
        __int16 v14 = 2114;
        uint64_t v15 = v12;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "fencing on port (%x) using deprecated UIWindow SPI %{public}@", (uint8_t *)v13, 0x12u);
      }
    }
  }
  double v5 = (void *)MEMORY[0x1E4F39BB8];
  if (BSMachSendRightRetain()) {
    uint64_t v6 = a3;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [v5 handleForPort:v6 fenceId:0];
  [a1 _synchronizeDrawingWithCAFence:v7 preCommitHandler:0];
  [v7 invalidate];
}

+ (void)_synchronizeDrawingAcrossProcessesOverPort:(unsigned int)a3 withPreCommitHandler:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F39BB8];
  id v7 = a4;
  if (BSMachSendRightRetain()) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = [v6 handleForPort:v8 fenceId:0];
  [a1 _synchronizeDrawingWithCAFence:v9 preCommitHandler:v7];

  [v9 invalidate];
}

+ (id)_synchronizedDrawingFence
{
  return +[UIScene _synchronizedDrawingFence];
}

+ (void)_synchronizeDrawingWithFence:(id)a3
{
}

- (BOOL)_hasSystemGestureGate
{
  return self->_systemGestureGateForGestures && self->_systemGestureGateForTouches != 0;
}

- (unint64_t)_edgeForTouch:(id)a3
{
  id v4 = a3;
  double v5 = [v4 window];
  [v4 locationInView:0];
  objc_msgSend(v5, "convertPoint:toWindow:", 0);
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  double v10 = [(UIWindow *)self screen];
  [v10 bounds];
  unint64_t v15 = UIRectEdgeRegionForLocation(v11, v12, v13, v14, v7, v9, 30.0);

  if (!+[UIWindow _transformLayerRotationsAreEnabled])
  {
    uint64_t v16 = [v4 window];
    int v17 = [v16 windowScene];
    uint64_t v18 = [v17 interfaceOrientation];
    uint64_t v19 = 90;
    uint64_t v20 = -90;
    uint64_t v21 = 180;
    if (v18 != 2) {
      uint64_t v21 = 0;
    }
    if (v18 != 4) {
      uint64_t v20 = v21;
    }
    if (v18 != 3) {
      uint64_t v19 = v20;
    }
    if (v18 == 1) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = v19;
    }
    unint64_t v15 = _rotatedEdgesGivenOrientationInDegrees(v15, v22);
  }
  return v15;
}

- (int)bitsPerComponent
{
  return 8;
}

- (void)setDelegate:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Window", &setDelegate____s_category_0) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412546;
      CGFloat v7 = self;
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "-[UIWindow setDelegate:] no longer supports non-UIViewControllers. The delegate should always be the window's rootViewController. Window: %@, delegate: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    [(UIWindow *)self _setDelegateViewController:v4];
  }
}

- (BOOL)_shouldPrepareScreenForWindow
{
  return 1;
}

+ (BOOL)_shouldSoftAssertOnSetScreen
{
  return 1;
}

- (void)setScreen:(UIScreen *)screen
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  double v5 = screen;
  if ([(id)objc_opt_class() _shouldSoftAssertOnSetScreen]
    && [(id)UIApp _appAdoptsUISceneLifecycle])
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v26 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        long long v29 = "-[UIWindow setScreen:]";
        _os_log_fault_impl(&dword_1853B0000, v26, OS_LOG_TYPE_FAULT, "Error in UIKit client: %s should not be called if the client adopts UIScene lifecycle. Call -[UIWindow setWindowScene:] instead.", buf, 0xCu);
      }
    }
    else
    {
      BOOL v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setScreen____s_category) + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        long long v29 = "-[UIWindow setScreen:]";
        _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "Error in UIKit client: %s should not be called if the client adopts UIScene lifecycle. Call -[UIWindow setWindowScene:] instead.", buf, 0xCu);
      }
    }
  }
  int v6 = [(UIWindow *)self screen];
  CGFloat v7 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _FBSScene];
  __int16 v8 = v7;
  if (v6 != v5) {
    goto LABEL_5;
  }
  id v9 = [v7 settings];
  uint64_t v10 = [v9 displayIdentity];
  CGFloat v11 = [(UIScreen *)v5 displayIdentity];
  char v12 = [v10 isEqual:v11];

  if ((v12 & 1) == 0)
  {
LABEL_5:
    if (v5)
    {
      CGFloat v13 = v5;
    }
    else
    {
      CGFloat v13 = +[UIScreen mainScreen];
    }
    CGFloat v14 = v13;
    unint64_t v15 = v6;
    if (![(UIWindow *)self _wantsSceneAssociation]) {
      goto LABEL_21;
    }
    if (![(UIWindow *)self _isWindowServerHostingManaged])
    {
LABEL_23:
      [(UIWindow *)self _didMoveFromScreen:v15 toScreen:v5];

      goto LABEL_24;
    }
    if (![(id)UIApp isFrontBoard]
      || ([(id)UIApp disablesFrontBoardImplicitWindowScenes] & 1) != 0)
    {
      uint64_t v16 = [(UIScreen *)v14 displayIdentity];
      if (!v16)
      {
        id v25 = [MEMORY[0x1E4F28B00] currentHandler];
        [v25 handleFailureInMethod:a2, self, @"UIWindow.m", 6168, @"Attempting to attach a window (%@) to a screen with a nil FBSDisplayIdentity", self object file lineNumber description];
      }
      if (([(id)UIApp _appAdoptsUISceneLifecycle] & 1) != 0
        || ![(UIWindow *)self _isWindowServerHostingManaged])
      {
        int v17 = 0;
      }
      else
      {
        int v17 = __UIApplicationFirstSceneMatchingDisplayIdentityAssertingUISceneLifecycle(v16, 1);
      }
      -[UIWindow _setFBSScene:](self, v17);

      goto LABEL_22;
    }
    if (!v8) {
      goto LABEL_21;
    }
    uint64_t v18 = [v8 settings];
    uint64_t v19 = [v18 displayConfiguration];
    uint64_t v20 = [(UIScreen *)v14 displayConfiguration];
    char v27 = [v19 isEqual:v20];

    if ((v27 & 1) == 0)
    {
      uint64_t v21 = (void *)UIApp;
      uint64_t v16 = [(UIScreen *)v15 displayConfiguration];
      uint64_t v22 = [(UIScreen *)v14 displayConfiguration];
      BOOL v23 = [v21 _newSceneForWindow:self oldDisplay:v16 newDisplay:v22];
      -[UIWindow _setFBSScene:](self, v23);
    }
    else
    {
LABEL_21:
      uint64_t v16 = +[UIWindowScene _unassociatedWindowSceneForScreen:v14 create:1];
      [v16 _attachWindow:self];
    }
LABEL_22:

    goto LABEL_23;
  }
LABEL_24:
}

- (void)_didMoveFromScreen:(id)a3 toScreen:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  CGFloat v7 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _FBSScene];
  if (v29 != v6) {
    goto LABEL_3;
  }
  __int16 v8 = [v7 settings];
  id v9 = [v8 displayIdentity];
  uint64_t v10 = [v29 displayIdentity];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
LABEL_3:
    if (v6)
    {
      id v12 = v6;
    }
    else
    {
      id v12 = +[UIScreen mainScreen];
    }
    CGFloat v13 = v12;
    [(UIWindow *)self _sceneBounds];
    -[UIWindow _willChangeToSize:orientation:screen:withTransitionCoordinator:](self, "_willChangeToSize:orientation:screen:withTransitionCoordinator:", [(UIWindow *)self interfaceOrientation], v13, 0, v14, v15);
    uint64_t v16 = [(UIWindow *)self rootViewController];
    objc_msgSend(v16, "__willChangeToIdiom:onScreen:", objc_msgSend(v6, "_userInterfaceIdiom"), v6);

    -[UIView _willChangeToIdiomOnScreen:traverseHierarchy:](self, v6, 1);
    if ([(UIWindow *)self _shouldPrepareScreenForWindow]) {
      [v13 _prepareForWindow];
    }
    BOOL v17 = [(UIWindow *)self _isHostedInAnotherProcess];
    uint64_t v18 = [(_UISceneUIWindowHosting *)self->_windowHostingScene session];
    uint64_t v19 = [v18 role];
    int v20 = [v19 isEqualToString:@"UIWindowSceneSessionRoleExternalDisplayNonInteractive"];

    if (!v17 && v20)
    {
      [v13 bounds];
      -[UIWindow setFrame:](self, "setFrame:");
      *(void *)&self->_windowFlags |= 0x40000000uLL;
    }
    [(UIWindow *)self _sceneBoundsDidChange];
    if (!-[UIView isHidden](self, "isHidden") && ([(id)UIApp _appAdoptsUISceneLifecycle] & 1) == 0) {
      [(UIWindow *)self _updateLayerOrderingAndSetLayerHidden:0];
    }
    [v29 scale];
    double v22 = v21;
    [v6 scale];
    if (v22 != v23)
    {
      BOOL v24 = [(UIView *)self _layoutEngine];

      if (v24) {
        -[UIView _rebuildLayoutFromScratch](self);
      }
    }
    id v25 = [(UIWindow *)self _windowHostingScene];
    int v26 = [v25 _sceneSessionRoleIsCarPlayOrNonInteractiveExternal];

    if (v26) {
      _UIViewRecursivelyApplyBlockToSubtreesWithMotionEffects(self, &__block_literal_global_1184_0);
    }
    else {
      -[UIView _recursivelyConsiderResumingMotionEffects](self);
    }
    [(UIWindow *)self _updateWindowTraitsAndNotify:1];
    -[UIView _didChangeFromIdiomOnScreen:traverseHierarchy:](self, v29, 1);
    char v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    BOOL v28 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v6, @"UIWindowNewScreenUserInfoKey", 0);
    [v27 postNotificationName:@"UIWindowDidMoveToScreenNotification" object:self userInfo:v28];

    _UIPencilEventRequestBarrelFocusIfAbleForWindow(self, 1);
    if ([v6 _userInterfaceIdiom] == 3) {
      [(UIWindow *)self setAutorotates:0 forceUpdateInterfaceOrientation:0];
    }
  }
}

- (void)_setOverrideParentTraitEnvironment:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrideParentTraitEnvironment);
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      [WeakRetained _unregisterAuxiliaryChildEnvironmentForTraitInvalidations:self];
    }
    objc_storeWeak((id *)&self->_overrideParentTraitEnvironment, obj);
    if (obj) {
      [obj _registerAuxiliaryChildEnvironmentForTraitInvalidations:self];
    }
    [(UIWindow *)self _invalidateAuxiliaryChildTraits];
  }
}

- (id)_parentTraitEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrideParentTraitEnvironment);
  id v4 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = self->_windowHostingScene;
  }
  id v5 = WeakRetained;

  return v5;
}

- (id)_traitCollectionWhenRotated
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  int64_t v7 = [(UIWindow *)self interfaceOrientation];
  BOOL v8 = +[UIWindow _transformLayerRotationsAreEnabled];
  int v9 = (unint64_t)(v7 - 1) < 2 || v8;
  if (v9) {
    double v10 = v6;
  }
  else {
    double v10 = v4;
  }
  if (!v9) {
    double v4 = v6;
  }
  char v11 = -[UIWindow _windowParentTraitCollection]((id *)&self->super.super.super.isa);
  id v12 = -[UIWindow _traitCollectionForSize:parentCollection:](self, "_traitCollectionForSize:parentCollection:", v11, v10, v4);

  return v12;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)__sizeClassPair
{
  uint64_t v2 = [(UIWindow *)self traitCollection];
  uint64_t v3 = [v2 horizontalSizeClass];
  uint64_t v4 = [v2 verticalSizeClass];

  int64_t v5 = v3;
  int64_t v6 = v4;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (void)_propagateTraitCollectionChangedForStateRestorationWithTransitionCoordinator:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[UIWindow _windowParentTraitCollection]((id *)&self->super.super.super.isa);
  int64_t v6 = -[UIWindow _traitCollectionForSize:parentCollection:](self, "_traitCollectionForSize:parentCollection:", v5, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  [(UIWindow *)self _willTransitionToTraitCollection:v6 withTransitionCoordinator:v4];

  [(UIWindow *)self _updateWindowTraitsAndNotify:1];
}

- (void)_setStateRestorationVerticalSizeClass:(int64_t)a3 horizontalSizeClass:(int64_t)a4
{
  self->_int64_t verticalSizeClassStateRestorationOverride = a3;
  self->_int64_t horizontalSizeClassStateRestorationOverride = a4;
  if (dyld_program_sdk_at_least())
  {
    int64_t v5 = objc_alloc_init(_UIViewControllerNullAnimationTransitionCoordinator);
    [(_UIViewControllerNullAnimationTransitionCoordinator *)v5 setContainerView:self];
    [(UIWindow *)self _propagateTraitCollectionChangedForStateRestorationWithTransitionCoordinator:v5];
    if (v5)
    {
      [(_UIViewControllerNullAnimationTransitionCoordinator *)v5 _runAlongsideAnimations];
      [(_UIViewControllerNullAnimationTransitionCoordinator *)v5 _runAlongsideCompletions];
    }
  }
  else
  {
    [(UIWindow *)self _propagateTraitCollectionChangedForStateRestorationWithTransitionCoordinator:0];
  }
}

- (void)_clearSizeClassesForStateRestoration
{
  self->_int64_t verticalSizeClassStateRestorationOverride = 0;
  self->_int64_t horizontalSizeClassStateRestorationOverride = 0;
  [(UIWindow *)self _propagateTraitCollectionChangedForStateRestorationWithTransitionCoordinator:0];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v8 = [(UIWindow *)self interfaceOrientation];
  int v9 = [(UIWindow *)self screen];
  -[UIWindow _willChangeToSize:orientation:screen:withTransitionCoordinator:](self, "_willChangeToSize:orientation:screen:withTransitionCoordinator:", v8, v9, 0, width, height);

  [(UIView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18.receiver = self;
  v18.super_class = (Class)UIWindow;
  -[UIView setBounds:](&v18, sel_setBounds_, x, y, width, height);
  [(UIWindow *)self _updateIsSceneSizedFlag];
  -[UIWindow _autolayout_windowDidChangeBoundsFrom:](self, "_autolayout_windowDidChangeBoundsFrom:", v11, v13, v15, v17);
  [(UIWindow *)self _updateWindowTraitsAndNotify:1];
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self center];
  double v7 = v6;
  double v9 = v8;
  v10.receiver = self;
  v10.super_class = (Class)UIWindow;
  -[UIView setCenter:](&v10, sel_setCenter_, x, y);
  -[UIWindow _autolayout_windowDidChangeCenterFrom:](self, "_autolayout_windowDidChangeCenterFrom:", v7, v9);
}

- (void)_makeExternalKeyWindow
{
  qword_1EB259DD0 = (uint64_t)self;
}

uint64_t __29__UIWindow_makeKeyAndVisible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_makeKeyAndVisible");
}

- (id)contentView
{
  uint64_t v2 = [(UIView *)self subviews];
  if ([v2 count])
  {
    uint64_t v3 = [v2 objectAtIndex:0];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_registerChargedView:(id)a3
{
  id v4 = a3;
  int64_t v5 = self;
  id value = v4;
  if (qword_1EB259DE0)
  {
    Mutable = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_1EB259DE0, v5);
    if (Mutable) {
      goto LABEL_6;
    }
  }
  else
  {
    qword_1EB259DE0 = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  }
  Mutable = CFArrayCreateMutable(0, 0, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1EB259DE0, v5, Mutable);
  CFRelease(Mutable);
LABEL_6:
  v9.length = CFArrayGetCount((CFArrayRef)Mutable);
  v9.id location = 0;
  if (!CFArrayContainsValue((CFArrayRef)Mutable, v9, value)) {
    CFArrayAppendValue((CFMutableArrayRef)Mutable, value);
  }
}

- (void)_unregisterChargedView:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = (const __CFDictionary *)qword_1EB259DE0;
  double v6 = self;
  id value = v4;
  if (v5)
  {
    CFArrayRef v7 = (const __CFArray *)CFDictionaryGetValue(v5, v6);
    if (v7)
    {
      CFArrayRef v8 = v7;
      v12.length = CFArrayGetCount(v7);
      v12.id location = 0;
      FirstIndexOfCFArrayRef Value = CFArrayGetFirstIndexOfValue(v8, v12, value);
      if (FirstIndexOfValue != -1) {
        CFArrayRemoveValueAtIndex(v8, FirstIndexOfValue);
      }
    }
  }
}

+ (void)_unregisterChargedView:(id)a3
{
  id v3 = a3;
  CFDictionaryRef v4 = (const __CFDictionary *)qword_1EB259DE0;
  id value = v3;
  if (!v4) {
    goto LABEL_13;
  }
  CFIndex Count = CFDictionaryGetCount(v4);
  uint64_t v6 = Count;
  CFArrayRef v7 = (const void **)qword_1EB259EF0;
  if (Count > qword_1EB259EE8)
  {
    qword_1EB259EE8 = Count;
    CFArrayRef v7 = (const void **)malloc_type_realloc((void *)qword_1EB259EF0, 8 * Count, 0xC0040B8AA526DuLL);
    qword_1EB259EF0 = (uint64_t)v7;
  }
  CFDictionaryGetKeysAndValues(v4, 0, v7);
  if (v6 < 1)
  {
LABEL_13:

    goto LABEL_14;
  }
  char v8 = 0;
  for (uint64_t i = 0; i != v6; ++i)
  {
    CFArrayRef v10 = *(const __CFArray **)(qword_1EB259EF0 + 8 * i);
    v16.length = CFArrayGetCount(v10);
    v16.id location = 0;
    FirstIndexOfCFArrayRef Value = CFArrayGetFirstIndexOfValue(v10, v16, value);
    if (FirstIndexOfValue != -1)
    {
      for (CFIndex j = FirstIndexOfValue; j != -1; CFIndex j = CFArrayGetFirstIndexOfValue(v10, v17, value))
      {
        CFArrayRemoveValueAtIndex(v10, j);
        v17.length = CFArrayGetCount(v10);
        v17.id location = 0;
      }
      char v8 = 1;
    }
  }

  double v13 = value;
  if (v8)
  {
    NSLog(&cfstr_ChargedViewPWa.isa, value);
LABEL_14:
    double v13 = value;
  }
}

- (id)_registeredScrollToTopViews
{
  if (qword_1EB259DE8)
  {
    uint64_t v2 = CFDictionaryGetValue((CFDictionaryRef)qword_1EB259DE8, self);
    [v2 compact];
    id v3 = [v2 allObjects];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)_setIsResigningFirstResponderFromHost:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&self->_windowFlags & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)_isResigningFirstResponderFromHost
{
  return *((unsigned char *)&self->_windowFlags + 4) & 1;
}

- (BOOL)_becomeFirstResponderWhenPossible
{
  return 0;
}

- (id)_deepestActionResponder
{
  uint64_t v3 = [(UIWindow *)self rootViewController];
  if ([v3 _hasDeepestActionResponder])
  {
    CFDictionaryRef v4 = [(UIWindow *)self rootViewController];
    CFDictionaryRef v5 = [v4 _deepestActionResponder];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIWindow;
    CFDictionaryRef v5 = [(UIResponder *)&v7 _deepestActionResponder];
  }

  return v5;
}

- (id)_undoManagerForValidatingUndoRedoCommands
{
  uint64_t v3 = [(UIWindow *)self firstResponder];
  CFDictionaryRef v4 = [v3 undoManager];
  CFDictionaryRef v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIWindow;
    id v6 = [(UIResponder *)&v9 _undoManagerForValidatingUndoRedoCommands];
  }
  objc_super v7 = v6;

  return v7;
}

- (void)undo:(id)a3
{
  id v4 = [(UIWindow *)self firstResponder];
  uint64_t v3 = [v4 undoManager];
  [v3 undo];
}

- (void)redo:(id)a3
{
  id v4 = [(UIWindow *)self firstResponder];
  uint64_t v3 = [v4 undoManager];
  [v3 redo];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_undo_ == a3)
  {
    char v8 = [(UIWindow *)self firstResponder];
    objc_super v9 = [v8 undoManager];
    char v10 = [v9 canUndo];
LABEL_6:
    BOOL v7 = v10;

    goto LABEL_7;
  }
  if (sel_redo_ == a3)
  {
    char v8 = [(UIWindow *)self firstResponder];
    objc_super v9 = [v8 undoManager];
    char v10 = [v9 canRedo];
    goto LABEL_6;
  }
  v12.receiver = self;
  v12.super_class = (Class)UIWindow;
  BOOL v7 = [(UIView *)&v12 canPerformAction:a3 withSender:v6];
LABEL_7:

  return v7;
}

+ (void)_noteStatusBarHeightChanged:(double)a3 oldHeight:(double)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = +[UIScene _scenesIncludingInternal:1];
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
        double v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        objc_super v12 = objc_msgSend(v11, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0, 0);
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
              CFRange v17 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              if (([v17 _isStatusBarWindow] & 1) == 0) {
                [v17 handleStatusBarChangeFromHeight:a4 toHeight:a3];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }
}

+ (void)createIOSurfaceWithContextIds:(const unsigned int *)a3 count:(unint64_t)a4 frame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  objc_super v12 = +[UIScreen mainScreen];
  uint64_t v13 = objc_msgSend(a1, "createIOSurfaceOnScreen:withContextIds:count:frame:usePurpleGfx:outTransform:", v12, a3, a4, 0, 0, x, y, width, height);

  return v13;
}

+ (void)createIOSurfaceWithContextIds:(const unsigned int *)a3 count:(unint64_t)a4 frame:(CGRect)a5 outTransform:(CGAffineTransform *)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v14 = +[UIScreen mainScreen];
  uint64_t v15 = objc_msgSend(a1, "createIOSurfaceOnScreen:withContextIds:count:frame:usePurpleGfx:outTransform:", v14, a3, a4, 0, a6, x, y, width, height);

  return v15;
}

+ (void)createIOSurfaceWithContextIds:(const unsigned int *)a3 count:(unint64_t)a4 frame:(CGRect)a5 usePurpleGfx:(BOOL)a6 outTransform:(CGAffineTransform *)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v15 = +[UIScreen mainScreen];
  CFRange v16 = objc_msgSend(a1, "createIOSurfaceOnScreen:withContextIds:count:frame:usePurpleGfx:outTransform:", v15, a3, a4, 0, a7, x, y, width, height);

  return v16;
}

+ (void)createIOSurfaceOnScreen:(id)a3 withContextIds:(const unsigned int *)a4 count:(unint64_t)a5 frame:(CGRect)a6 usePurpleGfx:(BOOL)a7 outTransform:(CGAffineTransform *)a8
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v16 = a3;
  [v16 scale];
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeScale(&v23, v17, v17);
  CGAffineTransform v22 = v23;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGRect v25 = CGRectApplyAffineTransform(v24, &v22);
  if (a8)
  {
    uint64_t v18 = MEMORY[0x1E4F1DAB8];
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&a8->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&a8->c = v19;
    *(_OWORD *)&a8->tCGFloat x = *(_OWORD *)(v18 + 32);
  }
  CGAffineTransform v22 = v23;
  long long v20 = objc_msgSend(a1, "createIOSurfaceOnScreen:withContextIds:count:frame:baseTransform:", v16, a4, a5, &v22, v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);

  return v20;
}

+ (void)createIOSurfaceOnScreen:(id)a3 withContextIds:(const unsigned int *)a4 count:(unint64_t)a5 frame:(CGRect)a6 baseTransform:(CGAffineTransform *)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  v45[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  memset(&v41, 0, sizeof(v41));
  long long v15 = *(_OWORD *)&a7->c;
  *(_OWORD *)&m.a = *(_OWORD *)&a7->a;
  *(_OWORD *)&m.c = v15;
  *(_OWORD *)&m.tdouble x = *(_OWORD *)&a7->tx;
  CATransform3DMakeAffineTransform(&v41, &m);
  id v16 = _UIRenderingBufferCreate(0, width, height);
  CGFloat v17 = v16;
  if (v16)
  {
    long long v37 = v16;
    double v38 = v14;
    uint64_t v18 = objc_opt_new();
    unint64_t v19 = 0x1E4F1C000uLL;
    if (a5)
    {
      uint64_t v20 = *MEMORY[0x1E4F3A4E0];
      uint64_t v21 = *MEMORY[0x1E4F3A588];
      do
      {
        v44[0] = v20;
        unsigned int v22 = *a4++;
        CGAffineTransform v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v22, v37, v38);
        v44[1] = v21;
        v45[0] = v23;
        CATransform3D v39 = v41;
        CGRect v24 = [MEMORY[0x1E4F29238] valueWithBytes:&v39 objCType:"{CATransform3D=dddddddddddddddd}"];
        v45[1] = v24;
        [*(id *)(v19 + 2536) dictionaryWithObjects:v45 forKeys:v44 count:2];
        v26 = unint64_t v25 = v19;
        [v18 addObject:v26];

        unint64_t v19 = v25;
        --a5;
      }
      while (a5);
    }
    uint64_t v27 = *MEMORY[0x1E4F3A550];
    uint64_t v28 = *MEMORY[0x1E4F3A4F0];
    v42[0] = *MEMORY[0x1E4F3A538];
    v42[1] = v28;
    CGFloat v17 = v37;
    id v14 = v38;
    v43[0] = v27;
    v43[1] = v37;
    v42[2] = *MEMORY[0x1E4F3A4F8];
    id v29 = objc_msgSend(v38, "_name", v37, v38);
    v43[2] = v29;
    v42[3] = *MEMORY[0x1E4F3A568];
    float v30 = x;
    long long v31 = [NSNumber numberWithLong:llroundf(v30)];
    v43[3] = v31;
    v42[4] = *MEMORY[0x1E4F3A570];
    float v32 = y;
    long long v33 = [NSNumber numberWithLong:llroundf(v32)];
    v42[5] = *MEMORY[0x1E4F3A4E8];
    v43[4] = v33;
    v43[5] = v18;
    long long v34 = [*(id *)(v19 + 2536) dictionaryWithObjects:v43 forKeys:v42 count:6];
    long long v35 = -[UIScreen _appendSnapshotDisplaySystemIdentifierToOptionsIfNeeded:](v14, v34);

    CARenderServerSnapshot();
  }

  return v17;
}

+ (void)createScreenIOSurface
{
  uint64_t v2 = +[UIScreen mainScreen];
  uint64_t v3 = +[UIWindow createIOSurfaceFromScreen:v2];

  return v3;
}

+ (void)createIOSurfaceFromDisplayConfiguration:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = [v4 identity];
  id v6 = +[UIScreen _screenWithFBSDisplayIdentity:v5];
  uint64_t v7 = v6;
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = [[UIScreen alloc] initWithDisplayConfiguration:v4];
  }
  uint64_t v9 = v8;

  [(UIScreen *)v9 _updateDisplayConfiguration:v4];
  char v10 = (void *)[a1 createIOSurfaceFromScreen:v9];

  return v10;
}

+ (void)createIOSurfaceFromScreen:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 _scale];
  v8[0] = @"src-screen";
  v8[1] = @"dst-scale";
  v9[0] = v3;
  id v4 = objc_msgSend(NSNumber, "numberWithDouble:");
  v9[1] = v4;
  CFDictionaryRef v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  id v6 = (void *)_UIRenderDisplay(v5, &__block_literal_global_554);
  return v6;
}

__IOSurface *__38__UIWindow_createIOSurfaceFromScreen___block_invoke(double a1, double a2, uint64_t a3, void *a4)
{
  return _UIRenderingBufferCreate(a4, a1, a2);
}

- (void)createIOSurfaceWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);
  int v8 = [WeakRetained contextId];

  int v12 = v8;
  uint64_t v9 = +[UIScreen mainScreen];
  char v10 = +[UIWindow createIOSurfaceOnScreen:withContextIds:count:frame:usePurpleGfx:outTransform:](UIWindow, "createIOSurfaceOnScreen:withContextIds:count:frame:usePurpleGfx:outTransform:", v9, &v12, 1, 0, 0, x, y, width, height);

  return v10;
}

- (void)createIOSurface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);
  id v4 = [WeakRetained layer];

  if (v4)
  {
    [v4 frame];
    CFDictionaryRef v5 = -[UIWindow createIOSurfaceWithFrame:](self, "createIOSurfaceWithFrame:");
  }
  else
  {
    CFDictionaryRef v5 = 0;
  }

  return v5;
}

- (int64_t)_sceneClientOrientation
{
  return self->_sceneClientOrientation;
}

- (CGRect)_convertRectFromSceneReferenceSpace:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIWindow *)self _sceneReferenceBounds];
  double v9 = v8;
  double v11 = v10;
  int v12 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _effectiveSettings];
  double v13 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace([v12 interfaceOrientation], x, y, width, height, v9, v11);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  uint64_t v20 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _coordinateSpace];
  -[UIWindow convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", v20, v13, v15, v17, v19);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  double v29 = v22;
  double v30 = v24;
  double v31 = v26;
  double v32 = v28;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (CGRect)_convertRectToSceneReferenceSpace:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _coordinateSpace];
  -[UIWindow convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v8, x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  [(UIWindow *)self _sceneReferenceBounds];
  double v18 = v17;
  double v20 = v19;
  double v21 = [(_UISceneUIWindowHosting *)self->_windowHostingScene _effectiveSettings];
  double v22 = _UIWindowConvertRectFromSceneSpaceToSceneReferenceSpace([v21 interfaceOrientation], v10, v12, v14, v16, v18, v20);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  double v29 = v22;
  double v30 = v24;
  double v31 = v26;
  double v32 = v28;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

+ (id)_topVisibleWindowPassingTest:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = (unsigned int (**)(id, void *))a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    double v8 = 0;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        double v11 = v7;
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v7 = [*(id *)(*((void *)&v17 + 1) + 8 * i) _topVisibleWindowPassingTest:v3];

        if (v7)
        {
          if (!v8 || ([v7 windowLevel], double v13 = v12, objc_msgSend(v8, "windowLevel"), v13 > v14))
          {
            if (!v3 || v3[2](v3, v7))
            {
              id v15 = v7;

              double v8 = v15;
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    double v8 = 0;
  }

  return v8;
}

+ (id)_globalHitTestForLocation:(CGPoint)a3 sceneLocationZ:(double)a4 inWindowServerHitTestWindow:(id)a5 withEvent:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  double v11 = (id *)a5;
  id v12 = a6;
  double v13 = -[UIWindow _fbsScene](v11);
  if (![v11 _usesWindowServerHitTesting]
    || (objc_msgSend(v11, "_hitTestLocation:sceneLocationZ:inScene:withWindowServerHitTestWindow:event:", v13, v11, v12, x, y, a4), (double v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v15 = objc_msgSend(a1, "_hitTestToPoint:scenePointZ:forEvent:windowServerHitTestWindow:", v12, v11, x, y, a4);
    double v16 = v15;
    if (v15)
    {
      double v14 = objc_msgSend(v15, "_hitTestLocation:sceneLocationZ:inScene:withWindowServerHitTestWindow:event:", v13, v11, v12, x, y, a4);
    }
    else
    {
      double v14 = 0;
    }
  }
  return v14;
}

- (BOOL)_isInAWindow
{
  return 1;
}

- (BOOL)_automaticContainerBackgroundIsGlass
{
  return 0;
}

- (BOOL)_extendsScreenSceneLifetime
{
  return ![(UIWindow *)self isInternalWindow];
}

- (BOOL)_canDisableMirroring
{
  return 1;
}

- (BOOL)_includeInDefaultImageSnapshot
{
  return ![(UIWindow *)self isInternalWindow];
}

- (void)_willSnapshot
{
}

- (void)_didSnapshot
{
}

- (BOOL)_isExternallyPlaced
{
  return 0;
}

+ (id)_findWindowForControllingOverallAppearance
{
  id v3 = [(id)UIApp _mainScene];
  id v4 = +[UIScene _sceneForFBSScene:v3];

  if (v4)
  {
    uint64_t v5 = [a1 _findWindowForControllingOverallAppearanceInWindowScene:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __68__UIWindow__findWindowForControllingOverallAppearanceInWindowScene___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_isSceneSized
{
  return (*((unsigned __int8 *)&self->_windowFlags + 3) >> 6) & 1;
}

+ (id)_findWithDisplayPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = +[UIScreen mainScreen];
  [v6 scale];
  double v8 = v7;
  [v6 _rotation];
  double v10 = v9;
  [v6 _unjailedReferenceBoundsInPixels];
  double v12 = _UIScreenConvertFromCAScreen(x, y, v8, v10, v11);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __34__UIWindow__findWithDisplayPoint___block_invoke;
  v17[3] = &unk_1E53039F0;
  id v18 = v6;
  double v19 = v12;
  uint64_t v20 = v13;
  id v14 = v6;
  id v15 = [a1 _topVisibleWindowPassingTest:v17];

  return v15;
}

BOOL __34__UIWindow__findWithDisplayPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 screen];
  uint64_t v5 = *(void **)(a1 + 32);
  BOOL v6 = 0;
  if (([v3 _ignoresHitTest] & 1) == 0 && v4 == v5)
  {
    double v7 = objc_msgSend(v3, "_hitTestLocation:sceneLocationZ:inScene:withWindowServerHitTestWindow:event:", 0, 0, 0, *(double *)(a1 + 40), *(double *)(a1 + 48), 0.0);
    BOOL v6 = v7 != 0;
  }
  return v6;
}

- (CGPoint)_transformDisplayToWindowCoordinates:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(UIWindow *)self screen];
  [v6 scale];
  double v8 = v7;
  [v6 _rotation];
  double v10 = v9;
  [v6 _unjailedReferenceBoundsInPixels];
  double v12 = _UIScreenConvertFromCAScreen(x, y, v8, v10, v11);
  double v14 = _UIConvertScenePoint3DToWindow(0, self, v12, v13);
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (void)setKeepContextInBackground:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&self->_windowFlags & 0xFFFFFFFFFEFFFFFFLL | v3);
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);

    if (!WeakRetained)
    {
      +[UIWindowScene _updateVisibleSceneAndWindowOrderWithTest:0];
    }
  }
}

- (void)_writeLayerTreeToPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIView *)self layer];
  BOOL v6 = [v5 context];
  id v9 = [v6 layer];

  double v7 = (unsigned char *)MEMORY[0x1E4F39AE8];
  *MEMORY[0x1E4F39AD0] = @"public.png";
  *double v7 = 1;
  *MEMORY[0x1E4F39AF8] = 1;
  id v8 = v4;
  [v8 fileSystemRepresentation];

  CAEncodeLayerTreeToFile();
}

- (void)_moveWithEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIView *)self _focusSystem];

  if (v5)
  {
    BOOL v6 = [(UIWindow *)self _focusEventRecognizer];
    [v6 _moveWithEvent:v4];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIWindow;
    [(UIResponder *)&v7 _moveWithEvent:v4];
  }
}

- (BOOL)_canActAsKeyWindowForScreen:(id)a3
{
  return 1;
}

- (void)_setSecure:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = 0x20000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  self->_$B5B0456088C508EDB812873BE14D7A88 windowFlags = ($B5B0456088C508EDB812873BE14D7A88)(*(void *)&self->_windowFlags & 0xFFFFFFFFDFFFFFFFLL | v4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);
  [WeakRetained setSecure:v3];
}

- (BOOL)_isSecure
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerContext);
  char v3 = [WeakRetained isSecure];

  return v3;
}

- (id)_accessibilityHUDContainerViewForView:(id)a3
{
  uint64_t v4 = (UIWindow *)a3;
  [(UIView *)self bounds];
  objc_super v7 = v4;
  if (v4 != self)
  {
    double v8 = v5;
    double v9 = v6;
    objc_super v7 = v4;
    while (1)
    {
      [(UIView *)v7 bounds];
      if (v10 == v8 && v11 == v9) {
        break;
      }
      if (v10 == v9 && v11 == v8) {
        break;
      }
      double v14 = [(UIView *)v7 superview];

      objc_super v7 = v14;
      if (v14 == self)
      {
        objc_super v7 = self;
        break;
      }
    }
  }

  return v7;
}

- (void)_showAccessibilityHUDItem:(id)a3 forView:(id)a4
{
  id v34 = a4;
  accessibilityHUD = self->_accessibilityHUD;
  id v7 = a3;
  if (accessibilityHUD)
  {
    [(UIAccessibilityHUDView *)accessibilityHUD setItem:v7];
  }
  else
  {
    double v8 = [[UIAccessibilityHUDView alloc] initWithHUDItem:v7];

    double v9 = self->_accessibilityHUD;
    self->_accessibilityHUD = v8;

    id v7 = [(UIWindow *)self _accessibilityHUDContainerViewForView:v34];
    double v10 = self->_accessibilityHUD;
    [v7 bounds];
    -[UIAccessibilityHUDView sizeThatFits:](v10, "sizeThatFits:", v11, v12);
    double v14 = v13;
    double v16 = v15;
    [v7 bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v25 = [(UIWindow *)self screen];
    [v25 scale];
    double v27 = UIRectCenteredIntegralRectScale(0.0, 0.0, v14, v16, v18, v20, v22, v24, v26);
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;

    -[UIView setFrame:](self->_accessibilityHUD, "setFrame:", v27, v29, v31, v33);
    [v7 addSubview:self->_accessibilityHUD];
    [(UIAccessibilityHUDView *)self->_accessibilityHUD showAnimated:1 completion:0];
  }
}

- (void)_dismissAccessibilityHUD
{
  char v3 = self->_accessibilityHUD;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__UIWindow__dismissAccessibilityHUD__block_invoke;
  v6[3] = &unk_1E52D9F70;
  id v7 = v3;
  uint64_t v4 = v3;
  [(UIAccessibilityHUDView *)v4 dismissAnimated:1 completion:v6];
  accessibilityHUD = self->_accessibilityHUD;
  self->_accessibilityHUD = 0;
}

uint64_t __36__UIWindow__dismissAccessibilityHUD__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (unint64_t)_systemReferenceAngleMode
{
  uint64_t v2 = [(UIWindow *)self _windowHostingScene];
  char v3 = [v2 _effectiveUISettings];
  unint64_t v4 = [v3 hostReferenceAngleMode];

  return v4;
}

- (double)_systemReferenceAngle
{
  uint64_t v2 = [(UIWindow *)self _windowHostingScene];
  char v3 = [v2 _effectiveUISettings];
  [v3 angleFromHostReferenceUprightDirection];
  double v5 = v4;

  return v5;
}

- (id)_focusedView
{
  char v3 = [(UIView *)self _focusSystem];
  double v4 = [v3 _focusedView];

  double v5 = [v4 window];

  if (v5 == self) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_reversesLinearFocusWrapping
{
  return 0;
}

- (BOOL)_wantsFocusEngine
{
  if (![(id)objc_opt_class() _isSystemWindow]
    || (BOOL v3 = [(UIWindow *)self _isTextEffectsWindow]))
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)_installFocusEventRecognizer
{
  if ([(UIWindow *)self _supportsFocus]
    && !self->_focusEventRecognizer
    && [(UIWindow *)self allowsWeakReference])
  {
    BOOL v3 = [[_UIFocusEventRecognizer alloc] initWithOwningView:self];
    [(_UIFocusEventRecognizer *)v3 setDelegate:self];
    focusEventRecognizer = self->_focusEventRecognizer;
    self->_focusEventRecognizer = v3;
  }
}

- (void)_resetFocusEventRecognizer
{
}

- (void)_removeFocusIfNeededForFocusSystemSceneComponent:(id)a3
{
  double v4 = [a3 activeSceneObserver];
  [v4 stopMonitoringContextChangesForWindow:self];

  [(UIWindow *)self _removeFocusEventRecognizer];
}

- (void)_installFocusIfNeededForFocusSystemSceneComponent:(id)a3
{
  id v7 = a3;
  double v4 = [v7 activeSceneObserver];
  [v4 beginMonitoringContextChangesForWindow:self];

  focusEventRecognizer = self->_focusEventRecognizer;
  if (focusEventRecognizer) {
    goto LABEL_2;
  }
  id v6 = [v7 focusSystem];

  if (v6)
  {
    [(UIWindow *)self _installFocusEventRecognizer];
  }
  else
  {
    focusEventRecognizer = self->_focusEventRecognizer;
    if (focusEventRecognizer) {
LABEL_2:
    }
      [(_UIFocusEventRecognizer *)focusEventRecognizer reset];
  }
}

- (UIResponder)_focusResponder
{
  BOOL v3 = [(UIView *)self _focusSystem];
  id v4 = [v3 _preferredFirstResponder];
  double v5 = [v4 _responderWindow];

  if (v5 == self)
  {
    if (v4) {
      goto LABEL_39;
    }
  }
  else
  {
  }
  id v4 = [(UIWindow *)self firstResponder];
  if (v4) {
    goto LABEL_39;
  }
  id v6 = [v3 _deepestPreferredFocusEnvironment];
  id v7 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  double v8 = _UIFirstResponderCandidateForEnvironment(v6);
  if (v8 && ![(UIResponder *)self _containsResponder:v8])
  {

LABEL_8:
    double v8 = 0;
  }
  double v9 = [(UIWindow *)self _deepestActionResponder];
  double v10 = v9;
  if (v8)
  {
    if (v9)
    {
      double v11 = _UIResponderModallyPresentedViewControllerContainingResponder(v8);
      double v12 = _UIResponderModallyPresentedViewControllerContainingResponder(v10);
      if (v11 != v12)
      {
        id v4 = v10;
LABEL_37:

        goto LABEL_38;
      }
      uint64_t v14 = _UITreeFirstCommonAncestor(v8, v10, sel_nextResponder);
      double v15 = (void *)v14;
      if ((void *)v14 == v8)
      {
        id v17 = v10;
      }
      else
      {
        if ((void *)v14 != v10)
        {
          if (objc_opt_respondsToSelector())
          {
            double v16 = [v8 _viewControllerForAncestor];
          }
          else
          {
            double v16 = 0;
          }
          if (objc_opt_respondsToSelector())
          {
            double v18 = [v10 _viewControllerForAncestor];
          }
          else
          {
            double v18 = 0;
          }
          double v24 = v18;
          uint64_t v19 = _UITreeFirstCommonAncestor(v16, v18, sel_parentViewController);
          double v20 = (void *)v19;
          if ((void *)v19 != v16 || v19 == 0) {
            double v22 = v8;
          }
          else {
            double v22 = v10;
          }
          id v4 = v22;

          goto LABEL_36;
        }
        id v17 = v8;
      }
      id v4 = v17;
LABEL_36:

      goto LABEL_37;
    }
    id v13 = v8;
  }
  else
  {
    id v13 = v9;
  }
  id v4 = v13;
LABEL_38:

LABEL_39:
  return (UIResponder *)v4;
}

- (BOOL)_shouldRecognizeEventsInFocusEventRecognizer:(id)a3
{
  BOOL v3 = self;
  id v4 = [(UIWindow *)self screen];
  double v5 = [v4 _preferredFocusedWindow];
  LOBYTE(v3) = v5 == v3;

  return (char)v3;
}

- (id)_focusMovementSystemForFocusEventRecognizer:(id)a3
{
  BOOL v3 = [(UIView *)self _focusSystem];
  id v4 = [v3 _preferredFirstResponderFocusSystem];

  return v4;
}

- (BOOL)_focusEventRecognizer:(id)a3 didRecognizeFocusMovementRequest:(id)a4
{
  id v4 = a4;
  double v5 = [v4 focusSystem];
  char v6 = [v5 _performFocusMovement:v4];

  return v6;
}

- (void)_forwardFocusMovementAction:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UIWindow.m", 8749, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];
  }
  if ([(UIWindow *)self _isHostedInAnotherProcess])
  {
    double v5 = [(UIWindow *)self rootViewController];
    if (objc_opt_respondsToSelector()) {
      [v5 _forwardFocusMovementAction:v8];
    }
  }
  else
  {
    double v5 = -[UIWindow _fbsScene]((id *)&self->super.super.super.isa);
    char v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
    [v5 sendActions:v6];
  }
}

- (BOOL)_isTransparentFocusRegion
{
  return 1;
}

- (void)_willUpdateFocusInContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIWindow;
  [(UIView *)&v5 _willUpdateFocusInContext:a3];
  id v4 = [(UIWindow *)self _focusEventRecognizer];
  [v4 _resetMotionEffects];
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 nextFocusedItem];
  BOOL IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(self, v5);

  if (IsAncestorOfEnvironment) {
    [(UIWindow *)self _setRememberedFocusedItem:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)UIWindow;
  [(UIView *)&v7 _didUpdateFocusInContext:v4];
}

- (BOOL)_prefersFocusContainment
{
  uint64_t v2 = [(UIView *)self _focusBehavior];
  char v3 = [v2 supportsMultipleWindows] ^ 1;

  return v3;
}

- (id)preferredFocusedView
{
  char v3 = [(UIWindow *)self _rememberedFocusedItem];
  if (_IsKindOfUIView((uint64_t)v3))
  {
    id v4 = v3;
  }
  else
  {
    objc_super v5 = [(UIWindow *)self rootViewController];
    char v6 = [v5 preferredFocusedView];
    objc_super v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)UIWindow;
      id v8 = [(UIView *)&v10 preferredFocusedView];
    }
    id v4 = v8;
  }
  return v4;
}

- (int64_t)_subclassPreferredFocusedViewPrioritizationType
{
  if (!qword_1EB259E98)
  {
    qword_1EB259E98 = +[UIWindow instanceMethodForSelector:sel_preferredFocusedView];
    qword_1EB259EA0 = +[UIWindow instanceMethodForSelector:sel_preferredFocusEnvironments];
  }
  uint64_t v3 = [(UIWindow *)self methodForSelector:sel_preferredFocusedView];
  uint64_t v4 = [(UIWindow *)self methodForSelector:sel_preferredFocusEnvironments];
  if (v3) {
    BOOL v5 = v3 == qword_1EB259E98;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0;
  }
  if (v4) {
    BOOL v7 = v4 == qword_1EB259EA0;
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
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIWindow *)self rootViewController];
  uint64_t v4 = (void *)v3;
  if (v3)
  {
    v8[0] = v3;
    BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  char v6 = _UIFocusEnvironmentCombinedPreferredFocusEnvironments(self, v5, [(UIWindow *)self _subclassPreferredFocusedViewPrioritizationType]);

  return v6;
}

- (id)_overridingPreferredFocusEnvironment
{
  uint64_t v3 = [(UIWindow *)self _rememberedFocusedItem];
  if (!v3)
  {
    id v5 = 0;
    goto LABEL_13;
  }
  uint64_t v4 = [(UIWindow *)self rootViewController];
  if (v4)
  {
    if (dyld_program_sdk_at_least())
    {
      if ([v4 _canRestoreFocusAfterTransitionToItem:v3]) {
        goto LABEL_11;
      }
    }
    else if ([v4 restoresFocusAfterTransition])
    {
LABEL_11:
      id v5 = v3;
      goto LABEL_12;
    }
  }
  else if (_UIFocusEnvironmentIsAncestorOfEnvironment(self, v3) && _UIFocusItemIsFocusedOrFocusable(v3))
  {
    goto LABEL_11;
  }
  [(UIWindow *)self _setRememberedFocusedItem:0];
  id v5 = 0;
LABEL_12:

LABEL_13:
  return v5;
}

- (BOOL)isTransparentFocusItem
{
  uint64_t v3 = [(UIView *)self _focusBehavior];
  int v4 = [v3 supportsMultipleWindows];

  if (v4)
  {
    return _UIViewIsTransparentFocusItem(self);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIWindow;
    return [(UIView *)&v6 isTransparentFocusItem];
  }
}

- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  return objc_msgSend(a5, "_isInteractionBehaviorInactive", a3, a4.x, a4.y);
}

- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3
{
  return 1;
}

- (id)restorationIdentifier
{
  v7.receiver = self;
  v7.super_class = (Class)UIWindow;
  uint64_t v3 = [(UIResponder *)&v7 restorationIdentifier];
  if (!v3)
  {
    if ((*((unsigned char *)&self->_windowFlags + 3) & 0x80) != 0 || !dyld_program_sdk_at_least())
    {
      uint64_t v3 = 0;
    }
    else
    {
      int v4 = [(UIWindow *)self rootViewController];
      id v5 = [v4 restorationIdentifier];

      if (v5)
      {
        uint64_t v3 = [@"_UIWindow+" stringByAppendingString:v5];
      }
      else
      {
        uint64_t v3 = 0;
      }
    }
  }
  return v3;
}

- (void)setRestorationIdentifier:(id)a3
{
  id v4 = a3;
  if (dyld_program_sdk_at_least()) {
    *(void *)&self->_windowFlags |= 0x80000000uLL;
  }
  v5.receiver = self;
  v5.super_class = (Class)UIWindow;
  [(UIResponder *)&v5 setRestorationIdentifier:v4];
}

- (void)_setRoleHint:(id)a3
{
}

- (_UIViewControllerNullAnimationTransitionCoordinator)_traitCollectionChangeTransitionCoordinator
{
  return self->_traitCollectionChangeTransitionCoordinator;
}

- (NSMutableArray)_currentKeyboardTrackingLayoutGuides
{
  return self->_currentKeyboardTrackingLayoutGuides;
}

- (void)set_currentKeyboardTrackingLayoutGuides:(id)a3
{
}

- (BOOL)_shouldDisableTransformLayerScalingForSnapshotting
{
  return self->_shouldDisableTransformLayerScalingForSnapshotting;
}

- (_UITraitEnvironmentInternal)_overrideParentTraitEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrideParentTraitEnvironment);
  return (_UITraitEnvironmentInternal *)WeakRetained;
}

- (UIResponder)_lastFirstResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastFirstResponder);
  return (UIResponder *)WeakRetained;
}

- (void)_setLastFirstResponder:(id)a3
{
}

- (id)_lastFirstResponderInteractionState
{
  return self->_lastFirstResponderInteractionState;
}

- (void)_setLastFirstResponderInteractionState:(id)a3
{
}

- (UIResponder)_lastNextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastNextResponder);
  return (UIResponder *)WeakRetained;
}

- (void)_setLastNextResponder:(id)a3
{
}

- (void)_setWantsResponderWithoutKeyboard:(BOOL)a3
{
  self->_wantsResponderWithoutKeyboard = a3;
}

- (BOOL)canResizeToFitContent
{
  return self->_canResizeToFitContent;
}

- (void)setCanResizeToFitContent:(BOOL)canResizeToFitContent
{
  self->_canResizeToFitContent = canResizeToFitContent;
}

- (UIFocusItem)_rememberedFocusedItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rememberedFocusedItem);
  return (UIFocusItem *)WeakRetained;
}

- (void)_setRememberedFocusedItem:(id)a3
{
}

- (void)_setOrientationTransactionToken:(id)a3
{
}

- (BOOL)_usesLegacySupportedOrientationChecks
{
  return self->__usesLegacySupportedOrientationChecks;
}

- (void)_setToWindowOrientation:(int64_t)a3
{
  self->_toWindowOrientation = a3;
}

- (void)_setFromWindowOrientation:(int64_t)a3
{
  self->_fromWindowOrientation = a3;
}

- (_UIWindowAnimationController)_animationController
{
  return self->__animationController;
}

- (id)_shouldPreventRotationHook
{
  return self->__shouldPreventRotationHook;
}

- (void)_setShouldPreventRotationHook:(id)a3
{
}

- (BOOL)__hostViewUnderlapsStatusBar
{
  return self->___hostViewUnderlapsStatusBar;
}

- (void)__setHostViewUnderlapsStatusBar:(BOOL)a3
{
  self->___hostViewUnderlapsStatusBar = a3;
}

- (_UIFocusEventRecognizer)_focusEventRecognizer
{
  return self->_focusEventRecognizer;
}

- (BOOL)_containedGestureRecognizersShouldRespectGestureServerInstructions
{
  return self->__containedGestureRecognizersShouldRespectGestureServerInstructions;
}

- (void)_setContainedGestureRecognizersShouldRespectGestureServerInstructions:(BOOL)a3
{
  self->__containedGestureRecognizersShouldRespectGestureServerInstructions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusEventRecognizer, 0);
  objc_storeStrong(&self->__shouldPreventRotationHook, 0);
  objc_storeStrong((id *)&self->__animationController, 0);
  objc_destroyWeak((id *)&self->__orientationTransactionToken);
  objc_destroyWeak((id *)&self->_rememberedFocusedItem);
  objc_destroyWeak((id *)&self->_lastNextResponder);
  objc_storeStrong(&self->_lastFirstResponderInteractionState, 0);
  objc_destroyWeak((id *)&self->_lastFirstResponder);
  objc_destroyWeak((id *)&self->_overrideParentTraitEnvironment);
  objc_storeStrong((id *)&self->_currentKeyboardTrackingLayoutGuides, 0);
  objc_storeStrong((id *)&self->_primaryKeyboardTrackingGuide, 0);
  objc_storeStrong((id *)&self->_rootViewConstraints, 0);
  objc_storeStrong((id *)&self->_windowInternalConstraints, 0);
  objc_storeStrong((id *)&self->_deferredOrientationUpdate, 0);
  objc_storeStrong((id *)&self->_traitCollectionChangeTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_rootPresentationController, 0);
  objc_storeStrong((id *)&self->_passthroughScrollInteraction, 0);
  objc_storeStrong((id *)&self->_lowestLiveResizeSnapshot, 0);
  objc_storeStrong((id *)&self->_interfaceOrientationMapResolver, 0);
  objc_storeStrong((id *)&self->_roleHint, 0);
  objc_storeStrong((id *)&self->_windowLevelObservers, 0);
  objc_storeStrong((id *)&self->_accessibilityHUD, 0);
  objc_storeStrong((id *)&self->_destinationTraitCollection, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_systemGestureGateForHomeAffordance, 0);
  objc_storeStrong((id *)&self->_systemGateForGESTouches, 0);
  objc_storeStrong((id *)&self->_systemGestureGateForTouches, 0);
  objc_storeStrong((id *)&self->_systemGestureGateForGestures, 0);
  objc_storeStrong(&self->_windowController, 0);
  objc_storeStrong((id *)&self->_subtreeMonitors, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_rotationViewControllers, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_transformLayer, 0);
  objc_storeStrong((id *)&self->_sceneTransformLayer, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_exclusiveTouchView, 0);
  objc_storeStrong(&self->_touchData, 0);
  objc_storeStrong((id *)&self->_firstResponder, 0);
  objc_destroyWeak((id *)&self->_contextBinder);
  objc_destroyWeak((id *)&self->_layerContext);
  objc_destroyWeak((id *)&self->_delegateViewController);
  objc_storeStrong((id *)&self->_debugName, 0);
}

+ (void)setShouldRestrictViewsForSplashboard:(BOOL)a3
{
  _shouldRestrictViewsForSplashboard = a3;
}

+ (NSArray)restrictedSplashboardClasses
{
  uint64_t v2 = (void *)_restrictedSplashboardClasses;
  if (!_restrictedSplashboardClasses)
  {
    _restrictedSplashboardClasses = MEMORY[0x1E4F1CBF0];
    uint64_t v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v2;
}

+ (void)setRestrictedSplashboardClasses:(id)a3
{
}

- (void)_updateInterfaceOrientationFromActiveInterfaceOrientation
{
}

- (void)_updateInterfaceOrientationFromActiveInterfaceOrientationIfRotationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIWindow *)self isInterfaceAutorotationDisabled])
  {
    *(void *)&self->_windowFlags |= 0x10000uLL;
  }
  else
  {
    [(UIWindow *)self _updateInterfaceOrientationFromActiveInterfaceOrientation:v3];
  }
}

- (void)_updateInterfaceOrientationFromActiveInterfaceOrientation:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIWindow *)self _windowOwnsInterfaceOrientation])
  {
    uint64_t v5 = [(id)UIApp activeInterfaceOrientation];
    if (v5)
    {
      [(UIWindow *)self _updateToNotificationProvidedInterfaceOrientation:v5 animated:v3];
    }
  }
}

- (void)_performTouchContinuationWithOverrideHitTestedView:(id)a3
{
  BOOL v3 = (void *)UIApp;
  id v4 = a3;
  id v5 = [v3 _gestureEnvironment];
  -[UIGestureEnvironment _performTouchContinuationWithOverrideHitTestedView:]((uint64_t)v5, v4);
}

- (BOOL)_constrainsHoverEventHitTesting
{
  return 0;
}

- (unint64_t)_edgesForSystemGesturesTouchDelay
{
  BOOL v3 = [(UIWindow *)self screen];
  int v4 = [v3 _isEmbeddedScreen];

  if (!v4) {
    return 0;
  }
  id v5 = +[UIDevice currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1 || !+[UIDevice _hasHomeButton])
  {
    unint64_t v9 = 15;
  }
  else
  {
    objc_super v7 = [(UIWindow *)self traitCollection];
    uint64_t v8 = [v7 forceTouchCapability];

    if (v8 == 2)
    {
      if ([(id)UIApp userInterfaceLayoutDirection]) {
        unint64_t v9 = 13;
      }
      else {
        unint64_t v9 = 7;
      }
    }
    else
    {
      unint64_t v9 = 5;
    }
  }
  objc_super v10 = [(UIWindow *)self windowScene];
  double v11 = [v10 _systemAppearanceManager];

  if (v11) {
    v9 &= ~[v11 screenEdgesDeferringSystemGestures];
  }

  return v9;
}

- (id)_orientationDebugDescriptionBuilderWithMultilinePrefix:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  uint64_t v6 = [v4 builderWithObject:self];
  [v6 setActiveMultilinePrefix:v5];

  id v7 = (id)objc_msgSend(v6, "ui_appendInterfaceOrientation:withName:", -[UIWindow interfaceOrientation](self, "interfaceOrientation"), @"orientation");
  uint64_t v8 = [v6 activeMultilinePrefix];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __94__UIWindow_UIKitOrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke;
  void v12[3] = &unk_1E52D9F98;
  id v9 = v6;
  id v13 = v9;
  uint64_t v14 = self;
  [v9 appendBodySectionWithName:0 multilinePrefix:v8 block:v12];

  id v10 = v9;
  return v10;
}

void __94__UIWindow_UIKitOrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isHidden"), @"hidden");
  BOOL v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) frame];
  id v4 = (id)objc_msgSend(v3, "appendRect:withName:", @"frame");
  id v5 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) bounds];
  id v6 = (id)objc_msgSend(v5, "appendRect:withName:", @"bounds");
  id v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "_windowOwnsInterfaceOrientation"), @"ownsOrientation");
  id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "_windowOwnsInterfaceOrientationTransform"), @"ownsOrientationTransform");
  id v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isInterfaceAutorotationDisabled"), @"autorotationDisabled");
  id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:", objc_msgSend(*(id *)(a1 + 40), "_windowInterfaceOrientation"), @"windowInterfaceOrientation");
  id v11 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:", objc_msgSend(*(id *)(a1 + 40), "_orientationForRootTransform"), @"rootTransformOrientation");
  double v12 = *(void **)(a1 + 32);
  id v13 = *(void **)(*(void *)(a1 + 40) + 544);
  if (v13) {
    [v13 affineTransform];
  }
  else {
    memset(v26, 0, sizeof(v26));
  }
  id v14 = (id)objc_msgSend(v12, "ui_appendTransform:withName:skipIfIdentity:", v26, @"rootTransform", 1);
  id v15 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:", objc_msgSend(*(id *)(a1 + 40), "_orientationForViewTransform"), @"viewTransformOrientation");
  double v16 = *(void **)(a1 + 32);
  id v17 = *(void **)(*(void *)(a1 + 40) + 536);
  if (v17) {
    [v17 affineTransform];
  }
  else {
    memset(v25, 0, sizeof(v25));
  }
  id v18 = (id)objc_msgSend(v16, "ui_appendTransform:withName:skipIfIdentity:", v25, @"viewTransform", 1);
  id v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isInterfaceAutorotationDisabled"), @"autorotationDisabled");
  double v20 = *(void **)(a1 + 32);
  double v21 = [*(id *)(a1 + 40) _orientationTransactionToken];
  id v22 = (id)[v20 appendObject:v21 withName:@"orientationTransaction" skipIfNil:1];

  double v23 = [*(id *)(a1 + 40) _delegateViewController];
  double v24 = [v23 _viewControllerForSupportedInterfaceOrientations];

  objc_msgSend(*(id *)(a1 + 32), "ui_appendOrientationDebugDescription:withName:skipIfNil:", v24, @"orientationVC", 1);
}

- (id)_orientationDebugDescriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(UIWindow *)self _orientationDebugDescriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)_orientationDebugDescription
{
  return [(UIWindow *)self _orientationDebugDescriptionWithMultilinePrefix:0];
}

- (BOOL)inhibitManualTransform
{
  id v2 = [(UIWindow *)self rootViewController];
  if ([v2 shouldAutorotate]) {
    char v3 = [(id)objc_opt_class() _transformLayerRotationsAreEnabled];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)keyboardDidHide
{
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIKeyboardDidHideNotification" object:0];

  [(UIWindow *)self _matchDeviceOrientation];
}

- (void)matchDeviceOrientation:(id)a3
{
  id v4 = +[UIPeripheralHost sharedInstance];
  int v5 = [v4 _shouldDelayRotationForWindow:self];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel_keyboardDidHide name:@"UIKeyboardDidHideNotification" object:0];
  }
  else
  {
    [(UIWindow *)self _matchDeviceOrientation];
  }
}

- (double)_classicOffset
{
  char v3 = +[UIScreen mainScreen];
  [v3 _unjailedReferenceBounds];
  double v5 = v4;
  double v7 = v6;

  id v8 = [(UIWindow *)self screen];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  double result = 0.0;
  if (v5 / v7 < v10 / v12) {
    return (v7 - v12 * (v5 / v10)) * 0.5;
  }
  return result;
}

- (id)_hostingWindow
{
  return 0;
}

- (BOOL)_shouldTextEffectsWindowBeHostedForView:(id)a3
{
  return 0;
}

- (BOOL)_isTextEffectsWindowHosting
{
  BOOL v3 = [(UIWindow *)self _isTextEffectsWindow];
  if (v3)
  {
    double v4 = [(UIWindow *)self windowScene];
    double v5 = +[UITextEffectsHostingInfo hostingInfoForWindowScene:v4];
    char v6 = [v5 useHostedInstance];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)_isTextEffectsWindowNotificationOwner
{
  BOOL v3 = [(UIWindow *)self _isTextEffectsWindow];
  if (v3)
  {
    double v4 = [(UIWindow *)self windowScene];
    double v5 = +[UITextEffectsHostingInfo hostingInfoForWindowScene:v4];
    char v6 = [v5 useHostedInstance];

    if ((v6 & 1) == 0)
    {
      if ([(id)UIApp _isSpringBoard])
      {
        LOBYTE(v3) = 1;
        return v3;
      }
      if (([(UIWindow *)self isForViewService] & 1) == 0)
      {
        double v7 = [(UIWindow *)self windowScene];
        char v8 = [v7 _isKeyWindowScene];

        LOBYTE(v3) = v8;
        return v3;
      }
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_matchDeviceOrientation
{
  int64_t v3 = [(UIView *)self _keyboardOrientation];
  [(UIWindow *)self setupForOrientation:v3];
}

- (id)_hostingHandle
{
  uint64_t v3 = [(UIWindow *)self _contextId];
  transformLayer = self->_transformLayer;
  if (transformLayer)
  {
    [(CALayer *)transformLayer affineTransform];
    transformLayer = self->_transformLayer;
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
  }
  [(CALayer *)transformLayer frame];
  double v5 = +[_UIHostedWindowHostingHandle hostedWindowHostingHandleWithContextID:rootLayerTransform:rootLayerFrame:](_UIHostedWindowHostingHandle, "hostedWindowHostingHandleWithContextID:rootLayerTransform:rootLayerFrame:", v3, &v7);
  return v5;
}

- (BOOL)_allowsLinkPreviewInteractionInViewServices
{
  return 1;
}

- (id)_centerExpressionInContainer:(id)a3 vertical:(BOOL)a4 contentInsetScale:(double)a5 engine:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if ([(UIWindow *)self _isLoweringAnchoringConstraints])
  {
    double v12 = (void *)[objc_alloc(MEMORY[0x1E4F5B258]) initWithEngine:v11];
    [(UIView *)self _addCenterExpressionToExpression:v12 isVertical:v8];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)UIWindow;
    double v12 = [(UIView *)&v14 _centerExpressionInContainer:v10 vertical:v8 contentInsetScale:v11 engine:a5];
  }

  return v12;
}

- (void)_setIsLoweringAnchoringConstraints:(BOOL)a3
{
  if (a3)
  {
    id v4 = [NSNumber numberWithBool:1];
    objc_setAssociatedObject(self, &_UIWindowIsLoweringAnchoringConstraints, v4, (void *)1);
  }
  else
  {
    objc_setAssociatedObject(self, &_UIWindowIsLoweringAnchoringConstraints, 0, 0);
  }
}

- (BOOL)_isLoweringAnchoringConstraints
{
  id v2 = objc_getAssociatedObject(self, &_UIWindowIsLoweringAnchoringConstraints);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)_uiib_candidateRedundantConstraints
{
  id v2 = [(UIWindow *)self _layoutEngineCreateIfNecessary];
  return (id)[v2 candidateRedundantConstraints];
}

- (id)_redundantConstraints
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(UIWindow *)self _uiib_candidateRedundantConstraints];
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
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "_nsib_isRedundant")) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)_descendantWithAmbiguousLayout
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(UIView *)self _allSubviews];
  id result = (id)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)v8;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v8 != v5) {
        objc_enumerationMutation(v2);
      }
      id result = (id)[*(id *)(*((void *)&v7 + 1) + 8 * v6) _descendantWithAmbiguousLayout];
      if (result) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id result = (id)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
        id v4 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (BOOL)hasAmbiguousLayout
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIWindow *)self _hasAmbiguousLayout];
  if (v3)
  {
    id v4 = [(UIWindow *)self _descendantWithAmbiguousLayout];
    uint64_t v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutConstraints", &hasAmbiguousLayout___s_category) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      uint64_t v8 = [v4 _autolayoutTraceRecursively:0];
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Window has a view with an ambiguous layout. See \"Auto Layout Guide: Ambiguous Layouts\" for help debugging. Displaying synopsis from invoking -[UIView _autolayoutTrace] to provide additional detail.\n%@", (uint8_t *)&v7, 0xCu);
    }
  }
  return v3;
}

- (BOOL)_hasAmbiguousLayout
{
  return [(UIWindow *)self _descendantWithAmbiguousLayout] != 0;
}

- (void)exerciseAmbiguityInLayout
{
  BOOL v3 = [(UIWindow *)self _descendantWithAmbiguousLayout];
  if (v3 == self)
  {
    v4.receiver = self;
    v4.super_class = (Class)UIWindow;
    [(UIView *)&v4 exerciseAmbiguityInLayout];
  }
  else
  {
    [(UIWindow *)v3 exerciseAmbiguityInLayout];
  }
}

- (unint64_t)_expectedWindowInternalConstraintsCount
{
  if ((*(void *)&self->super._viewFlags & 0x20000000000000) != 0) {
    return 2;
  }
  else {
    return 4;
  }
}

- (void)_windowInternalConstraints_sizeDidChange
{
  if ((*(void *)&self->super._viewFlags & 0x20000000000000) == 0)
  {
    BOOL v3 = [(UIWindow *)self _windowInternalConstraints];
    uint64_t v4 = [(NSArray *)v3 count];
    if (v4 == [(UIWindow *)self _expectedWindowInternalConstraintsCount])
    {
      [(UIView *)self bounds];
      double v6 = v5;
      objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 2), "setConstant:", v7);
      id v8 = [(NSArray *)v3 objectAtIndex:3];
      [v8 setConstant:v6];
    }
    else
    {
      [(UIWindow *)self _invalidateWindowInternalConstraints];
    }
  }
}

- (void)_windowInternalConstraints_centerDidChange
{
  BOOL v3 = [(UIWindow *)self _windowInternalConstraints];
  uint64_t v4 = [(NSArray *)v3 count];
  if (v4 == [(UIWindow *)self _expectedWindowInternalConstraintsCount])
  {
    if ((dyld_program_sdk_at_least() & 1) == 0
      && (!self
       || ![(UIView *)self _forceLayoutEngineSolutionInRationalEdges]))
    {
      [(UIView *)self center];
      double v6 = v5;
      objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0), "setConstant:", v7);
      id v8 = [(NSArray *)v3 objectAtIndex:1];
      [v8 setConstant:v6];
    }
  }
  else
  {
    [(UIWindow *)self _invalidateWindowInternalConstraints];
  }
}

- (void)_constraints_subviewWillChangeSuperview:(id)a3
{
  [(UIWindow *)self _setRootViewConstraints:0];
  v5.receiver = self;
  v5.super_class = (Class)UIWindow;
  [(UIView *)&v5 _constraints_subviewWillChangeSuperview:a3];
}

@end