@interface UIApplication
+ (BOOL)_isBackgroundStyleTransparent:(int64_t)a3;
+ (BOOL)_isCertainCheckpointInAppLaunchReached;
+ (BOOL)_isClassic;
+ (BOOL)_isRunningWithFixedMainThreadPriority;
+ (BOOL)_isSystemUIService;
+ (BOOL)_isUIKitSystemProcess;
+ (BOOL)_shouldBigify;
+ (BOOL)_wantsApplicationBehaviorAsExtension;
+ (BOOL)isRunningEventPump;
+ (BOOL)isRunningInStoreDemoMode;
+ (BOOL)registerAsSystemApp;
+ (BOOL)rendersLocally;
+ (BOOL)shouldBackgroundMainThreadOnSuspendedLaunch;
+ (BOOL)shouldMakeUIForDefaultPNG;
+ (Class)_statusBarClass;
+ (Class)_statusBarManagerClass;
+ (Class)_statusBarWindowClass;
+ (UIApplication)sharedApplication;
+ (id)_accessibilitySettingsBundle;
+ (id)_applicationNameForMenus;
+ (id)_defaultContentSizeCategory;
+ (id)_sanitizeBundleString:(id)a3;
+ (id)_stringForBackgroundStyle:(int64_t)a3;
+ (id)_stringsForStatusBarStyleOverrides:(unint64_t)a3;
+ (id)_systemAnimationFenceExemptQueue;
+ (id)_systemUIServiceClientSettings;
+ (id)_systemUIServiceIdentifier;
+ (id)displayManagerObserver;
+ (id)stringForInterfaceOrientation:(int64_t)a3;
+ (id)stringForStatusBarStyle:(int64_t)a3;
+ (id)stringForStatusBarStyleOverrides:(unint64_t)a3;
+ (int64_t)_backgroundStyleForString:(id)a3;
+ (int64_t)_classicMode;
+ (int64_t)_debugUserInterfaceStyleOverride;
+ (int64_t)interfaceOrientationForString:(id)a3;
+ (int64_t)runningInStoreDemoModeFProgramNumber;
+ (int64_t)statusBarStyleForString:(id)a3;
+ (unint64_t)_statusBarStyleOverridesForArray:(id)a3;
+ (void)_accessibilityLoadSettingsLoaderIfNeeded;
+ (void)_attemptRequestingSystemUIServiceSceneWithRetry;
+ (void)_requestSystemUIServiceSceneWithCompletion:(id)a3;
+ (void)_setDebugUserInterfaceStyleOverride:(int64_t)a3;
+ (void)_startStatusBarServerIfNecessary;
+ (void)_updateAccessibilitySettingsLoader;
+ (void)registerObjectForStateRestoration:(id)object restorationIdentifier:(NSString *)restorationIdentifier;
- (BOOL)_UIApplicationLegacyVoipAllowed;
- (BOOL)_accessibilityApplicationIsSystemWideServer;
- (BOOL)_accessibilityCaptureSimulatorEvent:(__GSEvent *)a3;
- (BOOL)_alwaysHitTestsForMainScreen;
- (BOOL)_appAdoptsUICanvasLifecycle;
- (BOOL)_appAdoptsUISceneLifecycle;
- (BOOL)_appSupportsMultipleScenes;
- (BOOL)_appSupportsSceneItemProviders;
- (BOOL)_applicationWantsGESEvents;
- (BOOL)_areKeyboardHUDsEnabled;
- (BOOL)_areSystemWindowsSecure;
- (BOOL)_canAnimateDragCancelInApp;
- (BOOL)_canOpenURL:(id)a3 publicURLsOnly:(BOOL)a4;
- (BOOL)_canReceiveDeviceOrientationEvents;
- (BOOL)_didEatCurrentTouchForWindow:(id)a3;
- (BOOL)_disableBecomeFirstResponder;
- (BOOL)_disableLayoutAwareShortcuts;
- (BOOL)_doRestorationIfNecessary;
- (BOOL)_eatCurrentTouchForWindow:(id)a3 ifPredicate:(id)a4;
- (BOOL)_executableWasLinkedWithUIKit;
- (BOOL)_fakingRequiresHighResolution;
- (BOOL)_frontMostAppInterfaceOrientationIsSignificant;
- (BOOL)_handleDelegateCallbacksWithOptions:(id)a3 isSuspended:(BOOL)a4 restoreState:(BOOL)a5;
- (BOOL)_handleHIDEventBypassingUIEvent:(const __IOHIDEvent *)a3;
- (BOOL)_handleKeyCommandForKeyboardEvent:(id)a3 allowsRepeat:(BOOL)a4;
- (BOOL)_handlePhysicalButtonEvent:(id)a3;
- (BOOL)_hasApplicationCalledLaunchDelegate;
- (BOOL)_hasCalledRunWithMainScene;
- (BOOL)_hasKeyCommandForKeyboardEvent:(id)a3;
- (BOOL)_hasNormalRestorationCompleted;
- (BOOL)_hasRemoteControlEventObservers;
- (BOOL)_hasStoryboard;
- (BOOL)_hostsSystemStatusBar;
- (BOOL)_isActivated;
- (BOOL)_isActivatedIgnoringReason:(int)a3;
- (BOOL)_isActivatedIgnoringReasons:(unsigned int)a3;
- (BOOL)_isActivatedIgnoringReasons:(unsigned int)a3 withNewReason:(int)a4;
- (BOOL)_isActivating;
- (BOOL)_isAutorotationDisabledForAppWindows;
- (BOOL)_isClassic;
- (BOOL)_isDisplayingActivityContinuationUI;
- (BOOL)_isGlobeKeyShortcutHUDEnabled;
- (BOOL)_isHandlingMemoryWarning;
- (BOOL)_isIdleModeVisualEffectsEnabled;
- (BOOL)_isInteractionEvent:(__GSEvent *)a3;
- (BOOL)_isLaunchedSuspended;
- (BOOL)_isNormalRestorationInProgress;
- (BOOL)_isOrientationVerticallyCompact:(int64_t)a3;
- (BOOL)_isResigningActive;
- (BOOL)_isRestorationExtended;
- (BOOL)_isSensitiveUIEnabled;
- (BOOL)_isSpringBoardShowingAnAlert;
- (BOOL)_isStatusBarEffectivelyHiddenForContentOverlayInsetsForWindow:(id)a3;
- (BOOL)_isStatusBarForcedHiddenForOrientation:(int64_t)a3;
- (BOOL)_isStatusBarHiddenForOrientation:(int64_t)a3;
- (BOOL)_isSupportedOrientation:(int64_t)a3;
- (BOOL)_isTerminating;
- (BOOL)_isTrackingAnyTouch;
- (BOOL)_isWindowServerHostingManaged;
- (BOOL)_needsShakesWhenInactive;
- (BOOL)_openURL:(id)a3;
- (BOOL)_overridesDynamicCaret;
- (BOOL)_performKeyCommandInvocation:(id)a3 allowsRepeat:(BOOL)a4;
- (BOOL)_prepareButtonEvent:(id)a3 type:(int64_t)a4 phase:(int64_t)a5 timestamp:(double)a6 contextID:(unsigned int)a7;
- (BOOL)_prepareButtonEvent:(id)a3 type:(int64_t)a4 phase:(int64_t)a5 timestamp:(double)a6 force:(double)a7 clickCount:(unint64_t)a8 longClick:(BOOL)a9 contextID:(unsigned int)a10;
- (BOOL)_prepareButtonEvent:(id)a3 type:(int64_t)a4 phase:(int64_t)a5 timestamp:(double)a6 force:(double)a7 contextID:(unsigned int)a8;
- (BOOL)_prepareButtonEvent:(id)a3 withPressInfo:(id)a4;
- (BOOL)_requiresHighResolution;
- (BOOL)_rotationDisabledDuringTouch;
- (BOOL)_saveSnapshotWithName:(id)a3;
- (BOOL)_sceneSettingsIncludeSafeAreaInsets;
- (BOOL)_shakeToUndoEnabledForWindow:(id)a3;
- (BOOL)_shouldAllowContentTextContextExtraction;
- (BOOL)_shouldAllowKeyboardArbiter;
- (BOOL)_shouldAttemptOpenURL:(id)a3;
- (BOOL)_shouldCreateStatusBarAtLaunch;
- (BOOL)_shouldForceClassicMode;
- (BOOL)_shouldHandleTestURL:(id)a3;
- (BOOL)_shouldIgnoreHeadsetClicks;
- (BOOL)_shouldOptOutOfRTL;
- (BOOL)_shouldShowAlertForUndoManager:(id)a3;
- (BOOL)_shouldUpdateSerializableKeyCommandsForResponder:(id)a3;
- (BOOL)_statusBarOrientationFollowsWindow:(id)a3;
- (BOOL)_supportedOnLockScreen;
- (BOOL)_supportsAlwaysOnDisplay;
- (BOOL)_supportsBacklightEnvironment;
- (BOOL)_supportsCompactStatusBarHiding;
- (BOOL)_supportsHomeAffordanceObservation;
- (BOOL)_supportsIndirectInputEvents;
- (BOOL)_supportsMenuActions;
- (BOOL)_supportsOpenCommand;
- (BOOL)_supportsPrintCommand;
- (BOOL)_supportsShakesWhenNotActive;
- (BOOL)_systemShellAllowsInteractionTrackingKeyboardFocusUpdateForWindow:(id)a3;
- (BOOL)_taskSuspendingUnsupported;
- (BOOL)_updateDefaultImage;
- (BOOL)_usesEmoji;
- (BOOL)_viewControllerBasedStatusBarAppearance;
- (BOOL)_viewServiceIgnoresSceneForLegacyInterfaceOrientation:(id)a3;
- (BOOL)_wantsCompactStatusBarHiding;
- (BOOL)activityContinuationManager:(id)a3 continueUserActivity:(id)a4;
- (BOOL)activityContinuationManager:(id)a3 willContinueUserActivityWithType:(id)a4;
- (BOOL)activityContinuationManagerHandleErrorsByConfiguringProgressUI:(id)a3;
- (BOOL)applicationSupportsShakeToEdit;
- (BOOL)becomeFirstResponder;
- (BOOL)canOpenURL:(NSURL *)url;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)disablesFrontBoardImplicitWindowScenes;
- (BOOL)handleDoubleHeightStatusBarTapWithStyleOverride:(unint64_t)a3;
- (BOOL)handleEvent:(__GSEvent *)a3;
- (BOOL)handleEvent:(__GSEvent *)a3 withNewEvent:(id)a4;
- (BOOL)handleStatusBarHoverActionForRegion:(int64_t)a3;
- (BOOL)handleTestURL:(id)a3;
- (BOOL)ignoresInteractionEvents;
- (BOOL)isFrontBoard;
- (BOOL)isHandlingOpenShortCut;
- (BOOL)isHandlingURL;
- (BOOL)isIdleTimerDisabled;
- (BOOL)isIgnoringInteractionEvents;
- (BOOL)isLaunchTest:(id)a3;
- (BOOL)isLocked;
- (BOOL)isNetworkActivityIndicatorVisible;
- (BOOL)isPPTAvailable;
- (BOOL)isPasscodeRequiredToUnlock;
- (BOOL)isProtectedDataAvailable;
- (BOOL)isProximitySensingEnabled;
- (BOOL)isRegisteredForRemoteNotifications;
- (BOOL)isRunningInTaskSwitcher;
- (BOOL)isRunningQuitTest;
- (BOOL)isRunningSuspendTest;
- (BOOL)isRunningTest;
- (BOOL)isRunningTest:(id)a3;
- (BOOL)isStatusBarHidden;
- (BOOL)isSuspended;
- (BOOL)isSuspendedEventsOnly;
- (BOOL)isSuspendedUnderLock;
- (BOOL)launchApplicationWithIdentifier:(id)a3 suspended:(BOOL)a4;
- (BOOL)launchedToTest;
- (BOOL)removeDefaultImage:(id)a3 forScreen:(id)a4;
- (BOOL)reportApplicationSuspended;
- (BOOL)rotateIfNeeded:(int64_t)a3;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (BOOL)sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event;
- (BOOL)setKeepAliveTimeout:(NSTimeInterval)timeout handler:(void *)keepAliveHandler;
- (BOOL)shouldFenceStatusBarRotation;
- (BOOL)shouldInvokeRepeatedAction:(id)a3 forPhase:(unint64_t)a4;
- (BOOL)shouldLaunchSafe;
- (BOOL)shouldRecordExtendedLaunchTime;
- (BOOL)supportsAlternateIcons;
- (BOOL)supportsMultipleScenes;
- (BOOL)systemIsAnimatingApplicationLifecycleEvent;
- (BOOL)usesBackgroundNetwork;
- (CGRect)statusBarFrame;
- (CGRect)statusBarFrameForOrientation:(int64_t)a3;
- (Class)_accessibilityBundlePrincipalClass;
- (NSArray)scheduledLocalNotifications;
- (NSArray)shortcutItems;
- (NSArray)windows;
- (NSInteger)applicationIconBadgeNumber;
- (NSSet)_canvases;
- (NSSet)_openRepresentations;
- (NSSet)connectedScenes;
- (NSSet)openSessions;
- (NSString)_alternateIconName;
- (NSTimeInterval)statusBarOrientationAnimationDuration;
- (SBSApplicationShortcutService)shortcutService;
- (UIApplication)init;
- (UIApplicationState)applicationState;
- (UIBackgroundRefreshStatus)backgroundRefreshStatus;
- (UIBackgroundTaskIdentifier)beginBackgroundTaskWithExpirationHandler:(void *)handler;
- (UIBackgroundTaskIdentifier)beginBackgroundTaskWithName:(NSString *)taskName expirationHandler:(void *)handler;
- (UIContentSizeCategory)preferredContentSizeCategory;
- (UIFenceProviding)_fenceProvider;
- (UIInterfaceOrientation)statusBarOrientation;
- (UIRemoteNotificationType)enabledRemoteNotificationTypes;
- (UIStatusBarStyle)statusBarStyle;
- (UIUserInterfaceLayoutDirection)userInterfaceLayoutDirection;
- (UIUserNotificationSettings)currentUserNotificationSettings;
- (UIWindow)keyWindow;
- (_UIResponderChainFixerUpper)_responderBasedEventDeliverer;
- (__CFMessagePort)_purplePPTServerPort;
- (__CFRunLoop)_eventFetchRunLoop;
- (__GSKeyboard)GSKeyboardForHWLayout:(id)a3 forceRebuild:(BOOL)a4;
- (__GSKeyboard)GSKeyboardForHWLayout:(id)a3 forceRebuild:(BOOL)a4 createIfNeeded:(BOOL)a5;
- (__GSKeyboard)GSKeyboardForHWLayout:(id)a3 senderID:(unint64_t)a4 forceRebuild:(BOOL)a5 createIfNeeded:(BOOL)a6;
- (__GSKeyboard)_hardwareKeyboard;
- (__GSKeyboard)_hardwareKeyboard:(BOOL)a3;
- (__GSKeyboard)_hardwareKeyboardForPhysicalKeyboardEvent:(id)a3 createIfNeeded:(BOOL)a4;
- (double)_execOrResumeTime;
- (double)_initialTouchTimestampForWindow:(id)a3;
- (double)_launchTime;
- (double)defaultImageSnapshotExpiration;
- (double)statusBarHeight;
- (double)statusBarHeightForOrientation:(int64_t)a3;
- (double)statusBarHeightForOrientation:(int64_t)a3 ignoreHidden:(BOOL)a4;
- (double)windowRotationDuration;
- (float)backlightLevel;
- (id)__queuedOrientationChange;
- (id)_backgroundModes;
- (id)_cachedSystemAnimationFenceCreatingIfNecessary:(BOOL)a3;
- (id)_connectUISceneFromFBSScene:(id)a3 transitionContext:(id)a4;
- (id)_createSnapshotContextForScene:(id)a3 withName:(id)a4 performLayoutWithSettings:(id)a5;
- (id)_createSnapshotContextForSceneRemoval:(id)a3 withName:(id)a4;
- (id)_currentFrameCountForTestDisplay;
- (id)_currentHardwareKeyboardLayoutName;
- (id)_currentOpenApplicationEndpointForEnvironment:(id)a3;
- (id)_currentTests;
- (id)_defaultSceneIfExists;
- (id)_defaultTopNavBarTintColor;
- (id)_defaultUISceneOrMainScreenPlaceholderIfExists;
- (id)_defaultUIWindowHostingUISceneOrMainScreenPlaceholderIfExists;
- (id)_discardedSceneSessionIdentifiersSinceLastRunWithContext:(id)a3 knownSessions:(id)a4;
- (id)_dragEvents;
- (id)_dynamicButtonEventForWindow:(id)a3;
- (id)_event;
- (id)_exclusiveTouchWindows;
- (id)_extendLaunchTest;
- (id)_findPrintTarget:(id)a3;
- (id)_findUISceneForLegacyInterfaceOrientation;
- (id)_findWindowForControllingOverallAppearance;
- (id)_findWindowForControllingOverallAppearanceInWindowScene:(id)a3;
- (id)_firstCommitBlock;
- (id)_firstEligibleResponderForPress:(id)a3;
- (id)_forceStageObservable;
- (id)_gameControllerEventForWindow:(id)a3;
- (id)_gestureDelayedEventComponentDispatcher;
- (id)_gestureEnvironment;
- (id)_getActivityContinuationManager;
- (id)_hoverEventForWindow:(id)a3;
- (id)_hoverEventForWindowSpringBoardOnly:(id)a3;
- (id)_idleModeController;
- (id)_implicitStatusBarAnimationParametersWithClass:(Class)a3;
- (id)_implicitStatusBarHiddenAnimationParametersWithViewController:(id)a3 animation:(int64_t)a4;
- (id)_implicitStatusBarStyleAnimationParametersWithViewController:(id)a3;
- (id)_infoPlistCanvasDefinitions;
- (id)_infoPlistSceneConfigurations;
- (id)_keyCommandForKeyboardEvent:(id)a3;
- (id)_keyCommandInvocationForKeyboardEvent:(id)a3;
- (id)_keyCommands;
- (id)_keyDownDictionary;
- (id)_keyWindowForScreen:(id)a3;
- (id)_launchTestName;
- (id)_localCachesDirectory;
- (id)_localizedApplicationName;
- (id)_mainEventEnvironment;
- (id)_mainScene;
- (id)_mainSceneForDisplay:(id)a3;
- (id)_mainStoryboardName;
- (id)_motionEvent;
- (id)_motionKeyWindow;
- (id)_moveEventForWindow:(id)a3;
- (id)_newDefaultStoryboardWindow;
- (id)_newSceneForWindow:(id)a3 oldDisplay:(id)a4 newDisplay:(id)a5;
- (id)_openSessionForPersistentIdentifier:(id)a3;
- (id)_openSessionsIncludingInternal:(BOOL)a3;
- (id)_pencilEventForWindow:(id)a3;
- (id)_physicalKeyboardEventForWindow:(id)a3;
- (id)_preferredContentSizeCategory:(unint64_t)a3;
- (id)_preferredDefaultSceneSessionRole;
- (id)_pressInfoForPhysicalKeyboardEvent:(id)a3;
- (id)_pressesEventForWindow:(id)a3;
- (id)_remoteControlEvent;
- (id)_removePrivateOptionsFromOptions:(id)a3;
- (id)_responderForKeyEvents;
- (id)_rootViewControllers;
- (id)_sceneHostingWorkspaceController;
- (id)_scrollEventForWindow:(id)a3;
- (id)_showServiceForText:(id)a3 selectedTextRange:(_NSRange)a4 type:(int64_t)a5 fromRect:(CGRect)a6 inView:(id)a7;
- (id)_showServiceForText:(id)a3 type:(int64_t)a4 fromRect:(CGRect)a5 inView:(id)a6;
- (id)_showServiceForType:(int64_t)a3 withContext:(id)a4;
- (id)_statusBarWindow;
- (id)_statusBarWindowIfExistsForScene:(id)a3;
- (id)_storyboardInitialMenu;
- (id)_systemAnimationFenceCreatingIfNecessary:(BOOL)a3;
- (id)_systemAnimationFenceExemptQueue;
- (id)_systemNavigationAction;
- (id)_topMostViewController:(uint64_t)a1;
- (id)_touchesEvent;
- (id)_touchesEventForWindow:(id)a3;
- (id)_transformEventForWindow:(id)a3;
- (id)_unswizzledTargetInChainForAction:(SEL)a3 sender:(id)a4;
- (id)_urlWithSettingsPrivateURLSchemeIfNeeded:(id)a3;
- (id)_wheelEventForWindow:(id)a3;
- (id)_windowForSystemAppButtonEventsForScreen:(id)a3;
- (id)_workspace;
- (id)activityContinuationManagerUserCancelledError:(id)a3;
- (id)delegate;
- (id)getKeyboardDevicePropertiesForSenderID:(unint64_t)a3 shouldUpdate:(BOOL)a4;
- (id)getKeyboardDevicePropertiesForSenderID:(unint64_t)a3 shouldUpdate:(BOOL)a4 usingSyntheticEvent:(BOOL)a5;
- (id)idleTimerDisabledReasons;
- (id)keyCommands;
- (id)nameOfDefaultImageToUpdateAtSuspension;
- (id)nextResponder;
- (id)repeatedAction:(id)a3 willInvokeWithObject:(id)a4 forPhase:(unint64_t)a5;
- (id)resultsForTest:(id)a3;
- (id)statusBar;
- (id)statusBarSystemNavigationAction:(id)a3;
- (id)statusBarWindow;
- (id)statusBarWithWindow:(id)a3;
- (id)subTest:(id)a3 ForTest:(id)a4 withMetrics:(id)a5;
- (id)textInputMode;
- (id)userCachesDirectory;
- (id)userHomeDirectory;
- (id)userInfoDictionaryForRunLoopMode:(id)a3 requester:(id)a4;
- (id)userLibraryDirectory;
- (int)_loadMainInterfaceFile;
- (int)_loadMainNibFileNamed:(id)a3 bundle:(id)a4;
- (int)_loadMainStoryboardFileNamed:(id)a3 bundle:(id)a4;
- (int64_t)_availableTextServices;
- (int64_t)_carefulChoiceOrientation;
- (int64_t)_carefulChoiceOrientationForWindow:(id)a3;
- (int64_t)_classicMode;
- (int64_t)_currentExpectedInterfaceOrientation;
- (int64_t)_defaultSceneInterfaceOrientationReturningUnknownForNilScene:(BOOL)a3;
- (int64_t)_expectedViewOrientation;
- (int64_t)_fallbackInterfaceOrientationForSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4 currentOrientation:(int64_t)a5;
- (int64_t)_normativeWhitePointAdaptivityStyleForWindow:(id)a3;
- (int64_t)_pressTypeForKeyboardEvent:(id)a3 isTextual:(BOOL *)a4;
- (int64_t)_pureEffectiveUserInterfaceStyle;
- (int64_t)_safeInterfaceOrientationForNoWindow;
- (int64_t)_safeInterfaceOrientationForWindowIfExists:(id)a3;
- (int64_t)_safeInterfaceOrientationForWindowIfExists:(id)a3 expectNonNilWindow:(BOOL)a4;
- (int64_t)_sceneInterfaceOrientationFromWindow:(id)a3;
- (int64_t)_statusBarOrientationForWindow:(id)a3;
- (int64_t)_systemUserInterfaceStyle;
- (int64_t)_testOrientation:(id)a3 options:(id)a4;
- (int64_t)activeInterfaceOrientation;
- (int64_t)defaultStatusForCategory:(int64_t)a3 error:(id *)a4;
- (int64_t)overriddenRequestedStyleFromStyle:(int64_t)a3;
- (int64_t)pureUserInterfaceLayoutDirection;
- (int64_t)statusBar:(id)a3 styleForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5;
- (uint64_t)_defaultSupportedInterfaceOrientations;
- (uint64_t)_internalHandleHIDEventBypassingUIEvent:(uint64_t)result;
- (unint64_t)_beginBackgroundTaskWithExpirationHandler:(id)a3;
- (unint64_t)_beginBackgroundTaskWithName:(id)a3 expirationHandler:(id)a4;
- (unint64_t)_restorationArchiveProtectionClass;
- (unint64_t)_supportedInterfaceOrientationsForWindow:(id)a3;
- (unint64_t)blockInteractionEventsCount;
- (unint64_t)statusBar:(id)a3 effectiveStyleOverridesForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5;
- (unsigned)_currentHardwareKeyboardType;
- (unsigned)_frontmostApplicationPort;
- (void)__completeAndRunAsPlugin;
- (void)__forceEndIgnoringInteractionEvents;
- (void)__setQueuedOrientationChange:(id)a3;
- (void)_accessibilityInit;
- (void)_accessibilitySetUpQuickSpeak;
- (void)_addAfterCACommitBlockForViewController:(id)a3;
- (void)_addDocument:(id)a3 forUserActivity:(id)a4;
- (void)_addResponder:(id)a3 forUserActivity:(id)a4;
- (void)_alertItemStateChanged;
- (void)_appendSessionToSessionSet:(id)a3 save:(BOOL)a4;
- (void)_applicationDidEnterBackground;
- (void)_applicationHandleIntentForwardingAction:(id)a3;
- (void)_applicationHandleLinkConnectionAction:(id)a3;
- (void)_applicationHandleSiriTask:(id)a3;
- (void)_applicationHandleWatchKitRequest:(id)a3;
- (void)_applicationOpenURL:(id)a3 payload:(id)a4;
- (void)_applicationOpenURLAction:(id)a3 payload:(id)a4 origin:(id)a5;
- (void)_applicationShouldRequestHealthAuthorization;
- (void)_beginFenceTaskIfNecessary;
- (void)_beginShowingNetworkActivityIndicator;
- (void)_beginSnapshotSessionForScene:(id)a3 withSnapshotBlock:(id)a4;
- (void)_callInitializationDelegatesWithActions:(id)a3 forCanvas:(id)a4 payload:(id)a5 fromOriginatingProcess:(id)a6;
- (void)_cancelAllEventsOfType:(int64_t)a3 onEventRoutingScene:(id)a4;
- (void)_cancelAllInputs;
- (void)_cancelAllInputsOnEventRoutingScene:(id)a3;
- (void)_cancelAllTouches;
- (void)_cancelGestureRecognizers:(id)a3;
- (void)_cancelGestureRecognizersForView:(id)a3;
- (void)_cancelPressesIfNeededForViewRemovedFromResponderChain:(id)a3;
- (void)_cancelPressesWithType:(int64_t)a3 forPressesEvent:(id)a4;
- (void)_cancelTouchesIfNeededForViewRemovedFromResponderChain:(id)a3;
- (void)_cancelTouchesOrPresses:(id)a3 withEvent:(id)a4;
- (void)_cancelTouchesOrPresses:(id)a3 withEvent:(id)a4 includingGestures:(BOOL)a5 notificationBlock:(id)a6;
- (void)_cancelUnfinishedPhysicalKeyboardPresses;
- (void)_cancelUnfinishedPhysicalKeyboardPressesForUIWindowEventRoutingScene:(id)a3;
- (void)_cancelUnfinishedPressesForEvent:(id)a3;
- (void)_cancelUnfinishedTouchesForEvent:(id)a3;
- (void)_cancelViewProcessingOfTouchesOrPresses:(id)a3 withEvent:(id)a4 sendingCancelToViewsOfTouchesOrPresses:(id)a5;
- (void)_checkActivityContinuationAndBecomeCurrentIfNeeded;
- (void)_checkBackgroundRefreshAPIAdoption;
- (void)_clearSystemNavigationAction;
- (void)_closeCanvasDefinition:(id)a3 withOptions:(id)a4 errorHandler:(id)a5;
- (void)_compellApplicationLaunchToCompleteUnconditionally;
- (void)_configureLaunchOptions:(id)a3;
- (void)_configureSnapshotContext:(id)a3 forScreen:(id)a4 scene:(id)a5;
- (void)_createStatusBarIfNeededWithOrientation:(int64_t)a3 forWindowScene:(id)a4;
- (void)_createStatusBarWithRequestedStyle:(int64_t)a3 orientation:(int64_t)a4 hidden:(BOOL)a5;
- (void)_createStatusBarWithRequestedStyle:(int64_t)a3 orientation:(int64_t)a4 hidden:(BOOL)a5 forWindowScene:(id)a6;
- (void)_deactivateForReason:(int)a3;
- (void)_deactivateForReason:(int)a3 notify:(BOOL)a4;
- (void)_deactivateReachability;
- (void)_deliverRemainingKeyUpEvents;
- (void)_deviceOrientationDidChange:(unsigned char *)a1;
- (void)_discardSceneSessions:(id)a3;
- (void)_discardSceneSessionsWithPersistentIdentifiers:(id)a3 skippingPersistenceDeletion:(BOOL)a4;
- (void)_eatCurrentTouchForWindow:(id)a3;
- (void)_endBackgroundTask:(unint64_t)a3;
- (void)_endShowingNetworkActivityIndicator;
- (void)_enqueueHIDEvent:(__IOHIDEvent *)a3;
- (void)_executeNextResizeSubTest;
- (void)_executeResizeTest;
- (void)_fetchInfoPlistFlags;
- (void)_findBestActivityToMakeCurrent:(id)a3;
- (void)_finishButtonEvent:(id)a3;
- (void)_fixupBackgroundHitTestWindow;
- (void)_forceEndIgnoringInteractionEvents;
- (void)_handleApplicationShortcutAction:(id)a3 onWindowScene:(id)a4;
- (void)_handleDaemonApplicationActivationWithScene:(id)a3 completion:(id)a4;
- (void)_handleDeviceOrientationChangedEvent:(__GSEvent *)a3;
- (void)_handleGameControllerEvent:(id)a3;
- (void)_handleHIDEvent:(__IOHIDEvent *)a3;
- (void)_handleHeadsetButtonClick;
- (void)_handleHeadsetButtonDoubleClick;
- (void)_handleHeadsetButtonTripleClick;
- (void)_handleKeyHIDEvent:(__IOHIDEvent *)a3 usingSyntheticEvent:(BOOL)a4;
- (void)_handleKeyUIEvent:(id)a3;
- (void)_handleKeyboardPressEvent:(id)a3;
- (void)_handleLocalizationDelegateCallbacks;
- (void)_handleNonLaunchSpecificActions:(id)a3 forScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6;
- (void)_handleScreenshot;
- (void)_handleSuspensionActions;
- (void)_handleTaskCompletionAndTerminate:(id)a3;
- (void)_handleUnicodeEvent:(__IOHIDEvent *)a3;
- (void)_handleUserDefaultsDidChange:(id)a3;
- (void)_hardwareKeyboardAvailabilityChanged:(id)a3;
- (void)_headsetButtonDown:(__IOHIDEvent *)a3;
- (void)_headsetButtonUp:(__IOHIDEvent *)a3;
- (void)_hideNetworkActivityIndicator;
- (void)_immediatelyUpdateSerializableKeyCommandsForResponder:(id)a3;
- (void)_initiateLaunchActionsBackgrounded:(BOOL)a3 firstActivation:(BOOL)a4;
- (void)_leak;
- (void)_maybeEffectiveUserInterfaceStyleChanged;
- (void)_noteAnimationFinished:(id)a3;
- (void)_noteAnimationStarted:(id)a3;
- (void)_notifyDidChangeStatusBarFrame:(CGRect)a3;
- (void)_notifyWillChangeStatusBarFrame:(CGRect)a3;
- (void)_observeDebugOrTestUserInterfaceStyleChanged;
- (void)_openCanvasDefinition:(id)a3 withUserActivity:(id)a4 options:(id)a5 errorHandler:(id)a6;
- (void)_openURL:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)_openURL:(id)a3 options:(id)a4 openApplicationEndpoint:(id)a5 completionHandler:(id)a6;
- (void)_openURL:(id)a3 originatingView:(id)a4 completionHandler:(id)a5;
- (void)_openURL:(id)a3 originatingView:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)_performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming:(BOOL)a3 block:(id)a4;
- (void)_performBlockAfterCATransactionCommitSynchronizes:(id)a3;
- (void)_performBlockAfterCATransactionCommits:(id)a3;
- (void)_performMemoryWarning;
- (void)_performRefreshForUIScene:(id)a3 disposeAfter:(BOOL)a4 completion:(id)a5;
- (void)_performSnapshotsWithAction:(id)a3 forScene:(id)a4 completion:(id)a5;
- (void)_performWithUICACommitStateSnapshotting:(id)a3;
- (void)_pipStateDidChange;
- (void)_popRunLoopMode:(id)a3 requester:(id)a4 reason:(id)a5;
- (void)_postSimpleRemoteNotificationForAction:(int64_t)a3 andContext:(int64_t)a4 trackID:(id)a5;
- (void)_presentEditAlertController:(id)a3;
- (void)_purgeSharedInstances;
- (void)_pushRunLoopMode:(id)a3 requester:(id)a4 reason:(id)a5;
- (void)_receivedMemoryNotification;
- (void)_registerBSActionHandler:(id)a3;
- (void)_registerDefaultApplicationLevelBSActionHandlers;
- (void)_registerEstimatedTouches:(id)a3 event:(id)a4 forTouchable:(id)a5;
- (void)_registerForAlertItemStateChangeNotification;
- (void)_registerForBackgroundRefreshStatusChangedNotification;
- (void)_registerForHangTracerEnabledStateChangedNotification;
- (void)_registerForKeyBagLockStatusNotification;
- (void)_registerForKeyboardLayoutChangedNotification;
- (void)_registerForKeyboardPrefChangedNotification;
- (void)_registerForLanguageChangedNotification;
- (void)_registerForLocaleChangedNotification;
- (void)_registerForLocaleWillChangeNotification;
- (void)_registerForNameLayerTreeNotification;
- (void)_registerForRemoteNotificationTypes:(unint64_t)a3;
- (void)_registerForSignificantTimeChangeNotification;
- (void)_registerForUserDefaultsChanges;
- (void)_registerInternalBSActionHandler:(id)a3;
- (void)_reloadKeyboardArbiterState;
- (void)_removeDocument:(id)a3 forUserActivity:(id)a4;
- (void)_removeHIDEventObserver;
- (void)_removeHIDGameControllerEventObserver;
- (void)_removeResponder:(id)a3 forUserActivity:(id)a4;
- (void)_removeSessionFromSessionSet:(id)a3;
- (void)_reportMainSceneUpdateFinished:(id)a3;
- (void)_reportMainSceneUpdateFinishedPossiblyDeferredPortions;
- (void)_reportResults:(id)a3;
- (void)_requestDeviceUnlockWithCompletion:(id)a3;
- (void)_requestSceneActivationWithConfiguration:(id)a3 animated:(BOOL)a4 sender:(id)a5 errorHandler:(id)a6;
- (void)_requestSceneSessionActivationWithConfiguration:(id)a3 errorHandler:(id)a4;
- (void)_resendHoverEventForWindow:(id)a3;
- (void)_resetGSKeyboardModifierStateIfNecessary:(__IOHIDEvent *)a3;
- (void)_restoreApplicationPreservationStateWithSessionIdentifier:(id)a3 beginHandler:(id)a4 completionHandler:(id)a5;
- (void)_run;
- (void)_runSubTestForKeyboardBringupWithName:(id)a3 withShowKeyboardBlock:(id)a4 withHideKeyboardBlock:(id)a5 withExtraResultsBlock:(id)a6 withCleanupBlock:(id)a7;
- (void)_runSubTestForKeyboardDismissalWithName:(id)a3 withHideKeyboardBlock:(id)a4 withExtraResultsBlock:(id)a5 withCleanupBlock:(id)a6;
- (void)_runSubTestForKeyboardMergeWithName:(id)a3 withExtraResultsBlock:(id)a4 withCleanupBlock:(id)a5;
- (void)_runSubTestForKeyboardSplitWithName:(id)a3 withShowKeyboardBlock:(id)a4 withExtraResultsBlock:(id)a5 withCleanupBlock:(id)a6;
- (void)_runWithDaemonScene:(id)a3 completion:(id)a4;
- (void)_runWithMainScene:(id)a3 transitionContext:(id)a4 completion:(id)a5;
- (void)_saveApplicationPreservationState:(id)a3 viewController:(id)a4 sessionIdentifier:(id)a5 beginHandler:(id)a6 completionHandler:(id)a7;
- (void)_saveApplicationPreservationStateIfSupported;
- (void)_saveRestorationUserActivityStateForScene:(id)a3;
- (void)_scheduleLocalNotification:(id)a3;
- (void)_scheduleSceneEventResponseForScene:(id)a3 withResponseBlock:(id)a4;
- (void)_scrollsToTopInitiatorView:(id)a3 touchesEnded:(id)a4 withEvent:(id)a5;
- (void)_sendButtonEventWithPressInfo:(id)a3;
- (void)_sendButtonEventWithType:(int64_t)a3 phase:(int64_t)a4 timestamp:(double)a5;
- (void)_sendButtonEventWithType:(int64_t)a3 phase:(int64_t)a4 timestamp:(double)a5 contextID:(unsigned int)a6;
- (void)_sendDictionaryToPPT:(id)a3;
- (void)_sendEventToGameControllerObserver:(__IOHIDEvent *)a3;
- (void)_sendHeadsetOriginatedMediaRemoteCommand:(unsigned int)a3;
- (void)_sendMoveEventWithDirection:(int64_t)a3 heading:(unint64_t)a4 fromEvent:(id)a5;
- (void)_sendMoveEventWithPressesEvent:(id)a3;
- (void)_sendWillEnterForegroundCallbacks;
- (void)_setAlternateIconName:(id)a3 completionHandler:(id)a4;
- (void)_setAlwaysHitTestsForMainScreen:(BOOL)a3;
- (void)_setAmbiguousControlCenterActivationMargin:(double)a3;
- (void)_setApplicationBackdropStyle:(int64_t)a3;
- (void)_setApplicationIsOpaque:(BOOL)a3;
- (void)_setApplicationWantsGESEvents:(BOOL)a3;
- (void)_setBackgroundStyle:(int64_t)a3;
- (void)_setCachedSystemAnimationFence:(uint64_t)a1;
- (void)_setCompatibilityModeOnSettings:(id)a3;
- (void)_setDisableBecomeFirstResponder:(BOOL)a3;
- (void)_setExpectedViewOrientation:(int64_t)a3;
- (void)_setForcedUserInterfaceLayoutDirection:(int64_t)a3;
- (void)_setHIDEventObserver:(id)a3 onQueue:(id)a4;
- (void)_setHIDGameControllerEventObserver:(id)a3 onQueue:(id)a4;
- (void)_setHandlingURL:(BOOL)a3 url:(id)a4;
- (void)_setIdleModeVisualEffectsEnabled:(BOOL)a3;
- (void)_setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4;
- (void)_setIgnoreHeadsetClicks:(BOOL)a3;
- (void)_setIsDisplayingActivityContinuationUI:(BOOL)a3;
- (void)_setOptOutOfRTL:(BOOL)a3;
- (void)_setReachabilitySupported:(BOOL)a3;
- (void)_setRestorationExtended:(BOOL)a3;
- (void)_setRotationDisabledDuringTouch:(BOOL)a3;
- (void)_setSaveStateRestorationArchiveWithFileProtectionCompleteUntilFirstUserAuthentication;
- (void)_setShouldFixMainThreadPriority:(BOOL)a3;
- (void)_setStatusBarOrientation:(int64_t)a3;
- (void)_setStatusBarOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)_setStatusBarWindow:(id)a3 forScene:(id)a4;
- (void)_setSystemNavigationAction:(id)a3;
- (void)_setSystemUserInterfaceStyle:(int64_t)a3;
- (void)_setSystemWindowsSecure:(BOOL)a3;
- (void)_setUserDefaultsSyncEnabled:(BOOL)a3;
- (void)_setupMotionFeedbackGenerator;
- (void)_setupStatusBarWithRequestedStyle:(int64_t)a3 orientation:(int64_t)a4 hidden:(BOOL)a5;
- (void)_showEditAlertViewWithUndoManager:(id)a3 window:(id)a4;
- (void)_startHangTracer;
- (void)_statusBarWindow:(id)a3 didMoveFromScene:(id)a4 toScene:(id)a5;
- (void)_stopDeactivatingForReason:(int)a3;
- (void)_stopHangTracer;
- (void)_synchronizeSystemAnimationFencesWithSpinCleanUpBlock:(id)a3;
- (void)_teardownMotionEventBehavior;
- (void)_terminateWithStatus:(int)a3;
- (void)_trackSystemAnimationFence:(id)a3;
- (void)_unregisterForLanguageChangedNotification;
- (void)_unregisterForLocaleChangedNotification;
- (void)_unregisterForSignificantTimeChangeNotification;
- (void)_unregisterForTimeChangedNotification;
- (void)_unregisterForUserDefaultsChanges;
- (void)_updateAccessibilityItunesSettings;
- (void)_updateAppPriorityForSuspendedState;
- (void)_updateApplicationAccessibility;
- (void)_updateEffectiveUserInterfaceStyleAfterChange:(id)a3;
- (void)_updateHangTracer;
- (void)_updateIdleModeStatus;
- (void)_updateLargeTextNotification;
- (void)_updateOrientation;
- (void)_updateSerializableKeyCommandsForResponder:(id)a3;
- (void)_updateSnapshotAndStateRestorationWithAction:(id)a3 windowScene:(id)a4;
- (void)_updateSnapshotForBackgroundApplication:(BOOL)a3;
- (void)_updateStateRestorationArchiveForBackgroundEvent:(id)a3 saveState:(BOOL)a4 exitIfCouldNotRestoreState:(BOOL)a5 updateSnapshot:(BOOL)a6 windowScene:(id)a7;
- (void)_wakeTimerFired;
- (void)_wheelChangedWithEvent:(id)a3;
- (void)_windowDidBecomeApplicationKey:(id)a3;
- (void)_windowDidResignApplicationKey:(id)a3;
- (void)activateSceneSessionForRequest:(UISceneSessionActivationRequest *)request errorHandler:(void *)errorHandler;
- (void)activityContinuationManager:(id)a3 configureProgressUIWithError:(id)a4;
- (void)activityContinuationManager:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)activityContinuationManager:(id)a3 didUpdateUserActivity:(id)a4;
- (void)activityContinuationManager:(id)a3 displayProgressUI:(id)a4 dismissalHandler:(id)a5;
- (void)activityContinuationManager:(id)a3 hideProgressUIWithCompletion:(id)a4;
- (void)addStatusBarItem:(int)a3;
- (void)addStatusBarItem:(int)a3 removeOnExit:(BOOL)a4;
- (void)addWebClipToHomeScreen:(id)a3;
- (void)applicationSuspend;
- (void)beginIgnoringInteractionEvents;
- (void)beginReceivingRemoteControlEvents;
- (void)buildMenuWithBuilder:(id)a3;
- (void)cancelAllLocalNotifications;
- (void)cancelLocalNotification:(UILocalNotification *)notification;
- (void)checkForUIEventSessionActionAnalytics:(id)a3 forWindow:(id)a4;
- (void)clearHardwareKeyboardState;
- (void)clearKeepAliveTimeout;
- (void)completeStateRestoration;
- (void)dealloc;
- (void)didDismissMiniAlert;
- (void)didReceiveMemoryWarning;
- (void)emitPPTEndTracePointForSubTestName:(id)a3 identifier:(unint64_t)a4;
- (void)emitPPTEndTracePointForTestName:(id)a3 identifier:(unint64_t)a4;
- (void)emitPPTStartTracePointForSubTestName:(id)a3 identifier:(unint64_t)a4 testIdentifier:(unint64_t)a5;
- (void)emitPPTStartTracePointForTestName:(id)a3 identifier:(unint64_t)a4;
- (void)endIgnoringInteractionEvents;
- (void)endReceivingRemoteControlEvents;
- (void)extendStateRestoration;
- (void)failedTest:(id)a3;
- (void)failedTest:(id)a3 withFailure:(id)a4;
- (void)failedTest:(id)a3 withFailure:(id)a4 withResults:(id)a5;
- (void)failedTest:(id)a3 withResults:(id)a4;
- (void)finishedIPTest:(id)a3;
- (void)finishedIPTest:(id)a3 extraResults:(id)a4;
- (void)finishedIPTest:(id)a3 extraResults:(id)a4 withTeardownBlock:(id)a5;
- (void)finishedIPTest:(id)a3 waitForCommit:(BOOL)a4 extraResults:(id)a5 withTeardownBlock:(id)a6;
- (void)finishedSubTest:(id)a3 forTest:(id)a4;
- (void)finishedSubTest:(id)a3 forTest:(id)a4 waitForCommit:(BOOL)a5;
- (void)finishedTest:(id)a3;
- (void)finishedTest:(id)a3 extraResults:(id)a4;
- (void)finishedTest:(id)a3 extraResults:(id)a4 waitForNotification:(id)a5;
- (void)finishedTest:(id)a3 extraResults:(id)a4 waitForNotification:(id)a5 withTeardownBlock:(id)a6;
- (void)finishedTest:(id)a3 extraResults:(id)a4 withTeardownBlock:(id)a5;
- (void)finishedTest:(id)a3 waitForCommit:(BOOL)a4 extraResults:(id)a5;
- (void)finishedTest:(id)a3 waitForCommit:(BOOL)a4 extraResults:(id)a5 withTeardownBlock:(id)a6;
- (void)handleKeyEvent:(__GSEvent *)a3;
- (void)handleKeyHIDEvent:(__IOHIDEvent *)a3;
- (void)handleKeyUIEvent:(id)a3;
- (void)ignoreSnapshotOnNextApplicationLaunch;
- (void)installCACommitCompletionBlock:(id)a3;
- (void)installNotificationObserverForNotificationName:(id)a3 forOneNotification:(BOOL)a4 usingBlock:(id)a5;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)motionBegan:(int64_t)a3 withEvent:(id)a4;
- (void)motionEnded:(int64_t)a3 withEvent:(id)a4;
- (void)noteActiveInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithSettings:(id)a4 fromOrientation:(int64_t)a5;
- (void)noteActiveInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithSettings:(id)a4 fromOrientation:(int64_t)a5 screen:(id)a6;
- (void)noteActiveInterfaceOrientationWillChangeToOrientation:(int64_t)a3;
- (void)noteActiveInterfaceOrientationWillChangeToOrientation:(int64_t)a3 screen:(id)a4;
- (void)openURL:(id)a3 withCompletionHandler:(id)a4;
- (void)orderFrontCharacterPalette:(id)a3;
- (void)popRunLoopMode:(id)a3;
- (void)popRunLoopMode:(id)a3 requester:(id)a4;
- (void)prepareForDefaultImageSnapshotForScreen:(id)a3;
- (void)prepareSnapshotsWithAction:(id)a3 forScene:(id)a4 completion:(id)a5;
- (void)presentLocalNotificationNow:(UILocalNotification *)notification;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)pushRegistry:(id)a3 didInvalidatePushTokenForType:(id)a4 error:(id)a5;
- (void)pushRegistry:(id)a3 didReceiveIncomingPushWithPayload:(id)a4 forType:(id)a5 withCompletionHandler:(id)a6;
- (void)pushRegistry:(id)a3 didUpdatePushCredentials:(id)a4 forType:(id)a5;
- (void)pushRunLoopMode:(id)a3;
- (void)pushRunLoopMode:(id)a3 requester:(id)a4;
- (void)registerForRemoteNotificationTypes:(UIRemoteNotificationType)types;
- (void)registerForRemoteNotifications;
- (void)registerUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings;
- (void)removeApplicationPreservationStateWithSessionIdentifier:(id)a3;
- (void)removeStatusBarItem:(int)a3;
- (void)requestSceneSessionActivation:(UISceneSession *)sceneSession userActivity:(NSUserActivity *)userActivity options:(UISceneActivationRequestOptions *)options errorHandler:(void *)errorHandler;
- (void)requestSceneSessionDestruction:(UISceneSession *)sceneSession options:(UISceneDestructionRequestOptions *)options errorHandler:(void *)errorHandler;
- (void)requestSceneSessionRefresh:(UISceneSession *)sceneSession;
- (void)restoreApplicationPreservationStateWithSessionIdentifier:(id)a3 viewController:(id)a4 beginHandler:(id)a5 completionHandler:(id)a6;
- (void)rotateIfNeeded:(int64_t)a3 before:(id)a4 after:(id)a5;
- (void)rotateIfNeeded:(int64_t)a3 completion:(id)a4;
- (void)runTest:(id)a3 forAnimation:(id)a4;
- (void)runTest:(id)a3 startingBeforeAnimation:(id)a4 stoppingAfterAnimation:(id)a5;
- (void)runTestForKeyboardBringupAndDismissalWithName:(id)a3 withShowKeyboardBlock:(id)a4 withHideKeyboardBlock:(id)a5 withExtraResultsBlock:(id)a6 withCleanupBlock:(id)a7;
- (void)runTestForKeyboardRotationWithName:(id)a3 fromOrientation:(int64_t)a4 withShowKeyboardBlock:(id)a5 withExtraResultsBlock:(id)a6 withCleanupBlock:(id)a7;
- (void)runTestForKeyboardSplitAndMergeWithName:(id)a3 withShowKeyboardBlock:(id)a4 withExtraResultsBlock:(id)a5 withCleanupBlock:(id)a6;
- (void)saveApplicationPreservationStateWithSessionIdentifier:(id)a3 viewController:(id)a4 beginHandler:(id)a5 completionHandler:(id)a6;
- (void)scheduleLocalNotification:(UILocalNotification *)notification;
- (void)sendEvent:(UIEvent *)event;
- (void)setAlternateIconName:(NSString *)alternateIconName completionHandler:(void *)completionHandler;
- (void)setApplicationBadgeString:(id)a3;
- (void)setApplicationIconBadgeNumber:(NSInteger)applicationIconBadgeNumber;
- (void)setApplicationSupportsShakeToEdit:(BOOL)applicationSupportsShakeToEdit;
- (void)setBacklightLevel:(float)a3;
- (void)setCapsLockDelayOverride:(double)a3;
- (void)setDelegate:(id)delegate;
- (void)setDoubleHeightPrefixText:(id)a3;
- (void)setDoubleHeightStatusText:(id)a3;
- (void)setDoubleHeightStatusText:(id)a3 forStyle:(int64_t)a4;
- (void)setExpectsFaceContact:(BOOL)a3;
- (void)setExpectsFaceContact:(BOOL)a3 inLandscape:(BOOL)a4;
- (void)setGlowAnimationEnabled:(BOOL)a3 forStyle:(int64_t)a4;
- (void)setHardwareKeyboardLayoutName:(id)a3;
- (void)setHardwareKeyboardLayoutName:(id)a3 forceRebuild:(BOOL)a4;
- (void)setIdleTimerDisabled:(BOOL)idleTimerDisabled;
- (void)setIgnoresInteractionEvents:(BOOL)a3;
- (void)setMinimumBackgroundFetchInterval:(NSTimeInterval)minimumBackgroundFetchInterval;
- (void)setProximityEventsEnabled:(BOOL)a3;
- (void)setProximitySensingEnabled:(BOOL)proximitySensingEnabled;
- (void)setReceivesMemoryWarnings:(BOOL)a3;
- (void)setScheduledLocalNotifications:(NSArray *)scheduledLocalNotifications;
- (void)setShortcutItems:(NSArray *)shortcutItems;
- (void)setShortcutService:(id)a3;
- (void)setStatusBarHidden:(BOOL)a3 animationParameters:(id)a4;
- (void)setStatusBarHidden:(BOOL)a3 animationParameters:(id)a4 changeApplicationFlag:(BOOL)a5;
- (void)setStatusBarHidden:(BOOL)a3 duration:(double)a4;
- (void)setStatusBarHidden:(BOOL)a3 duration:(double)a4 changeApplicationFlag:(BOOL)a5;
- (void)setStatusBarHidden:(BOOL)hidden animated:(BOOL)animated;
- (void)setStatusBarHidden:(BOOL)hidden withAnimation:(UIStatusBarAnimation)animation;
- (void)setStatusBarHidden:(BOOL)statusBarHidden;
- (void)setStatusBarOrientation:(UIInterfaceOrientation)interfaceOrientation animated:(BOOL)animated;
- (void)setStatusBarOrientation:(UIInterfaceOrientation)statusBarOrientation;
- (void)setStatusBarOrientation:(int64_t)a3 animation:(int)a4 duration:(double)a5;
- (void)setStatusBarOrientation:(int64_t)a3 animationParameters:(id)a4;
- (void)setStatusBarOrientation:(int64_t)a3 fromOrientation:(int64_t)a4 windowScene:(id)a5 animationParameters:(id)a6 updateBlock:(id)a7;
- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle;
- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle animated:(BOOL)animated;
- (void)setStatusBarStyle:(int64_t)a3 animation:(int)a4;
- (void)setStatusBarStyle:(int64_t)a3 animation:(int)a4 startTime:(double)a5 duration:(double)a6 curve:(int64_t)a7;
- (void)setStatusBarStyle:(int64_t)a3 animationParameters:(id)a4;
- (void)setStatusBarStyle:(int64_t)a3 duration:(double)a4;
- (void)setSystemVolumeHUDEnabled:(BOOL)a3;
- (void)setSystemVolumeHUDEnabled:(BOOL)a3 forAudioCategory:(id)a4;
- (void)setUsesBackgroundNetwork:(BOOL)a3;
- (void)setWantsLockEvents:(BOOL)a3;
- (void)setWantsVolumeButtonEvents:(BOOL)a3;
- (void)set_shouldAllowContentTextContextExtraction:(BOOL)a3;
- (void)setupRepeatActionWithinvocationDelay:(double)a3 reset:(BOOL)a4 andRepeat:(BOOL)a5;
- (void)showHelp:(id)a3;
- (void)showKeyboardUsingBlock:(id)a3 withCompletionBlock:(id)a4;
- (void)showNetworkPromptsIfNecessary:(BOOL)a3;
- (void)significantTimeChange;
- (void)startCHUDRecording:(id)a3;
- (void)startDictation:(id)a3;
- (void)startLeaking;
- (void)startedAnimationTest:(id)a3;
- (void)startedIPTest:(id)a3;
- (void)startedSubTest:(id)a3 forTest:(id)a4;
- (void)startedSubTest:(id)a3 forTest:(id)a4 withMetrics:(id)a5;
- (void)startedTest:(id)a3;
- (void)statusBar:(id)a3 didAnimateFromHeight:(double)a4 toHeight:(double)a5 animation:(int)a6;
- (void)statusBar:(id)a3 willAnimateFromHeight:(double)a4 toHeight:(double)a5 duration:(double)a6 animation:(int)a7;
- (void)stopAndReportResultsForTest:(id)a3 extraResults:(id)a4 waitForNotification:(id)a5 withTeardownBlock:(id)a6;
- (void)stopCHUDRecording;
- (void)stopLeaking;
- (void)suspend;
- (void)suspendReturningToLastApp:(BOOL)a3;
- (void)terminateWithSuccess;
- (void)unregisterForRemoteNotifications;
- (void)updateSuspendedSettings:(id)a3;
- (void)willDisplayMiniAlert;
- (void)workspace:(id)a3 didCreateScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6;
- (void)workspace:(id)a3 didReceiveActions:(id)a4;
- (void)workspace:(id)a3 willDestroyScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6;
- (void)workspaceShouldExit:(id)a3 withTransitionContext:(id)a4;
@end

@implementation UIApplication

- (int64_t)pureUserInterfaceLayoutDirection
{
  p_applicationFlags = &self->_applicationFlags;
  unint64_t v3 = *((void *)&self->_applicationFlags + 1);
  if ((v3 & 0x400000) == 0)
  {
    uint64_t v4 = [off_1E52D2DD0 defaultWritingDirectionForLanguage:0];
    uint64_t v5 = 0x400000;
    if (v4 == 1) {
      uint64_t v5 = 12582912;
    }
    unint64_t v3 = v5 | *((void *)p_applicationFlags + 1) & 0xFFFFFFFFFC3FFFFFLL;
    *((void *)p_applicationFlags + 1) = v3;
  }
  return (v3 >> 23) & 7;
}

+ (UIApplication)sharedApplication
{
  return (UIApplication *)(id)UIApp;
}

- (UIContentSizeCategory)preferredContentSizeCategory
{
  v2 = +[UIContentSizeCategoryPreference system];
  unint64_t v3 = [v2 preferredContentSizeCategory];

  return (UIContentSizeCategory)v3;
}

- (UIUserInterfaceLayoutDirection)userInterfaceLayoutDirection
{
  if (+[UIView _enableLegacyRTL]) {
    return 0;
  }
  return [(UIApplication *)self pureUserInterfaceLayoutDirection];
}

- (BOOL)_isWindowServerHostingManaged
{
  return 1;
}

- (BOOL)_viewControllerBasedStatusBarAppearance
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 12) >> 3) & 1;
}

- (BOOL)_sceneSettingsIncludeSafeAreaInsets
{
  return ![(UIApplication *)self isFrontBoard];
}

- (BOOL)_isStatusBarEffectivelyHiddenForContentOverlayInsetsForWindow:(id)a3
{
  id v4 = a3;
  if ([(UIApplication *)self _isSpringBoard]
    && ([(UIApplication *)self statusBar],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 alpha],
        double v7 = v6,
        v5,
        v7 == 0.0))
  {
    char v8 = 1;
  }
  else
  {
    v9 = [v4 rootViewController];
    if (v9)
    {
      char v8 = +[UIWindow _prefersStatusBarHiddenInWindow:v4 animationProvider:0];
    }
    else
    {
      v10 = __UIStatusBarManagerForWindow(v4);
      char v8 = [v10 isStatusBarHidden];
    }
  }

  return v8;
}

- (BOOL)isFrontBoard
{
  return 0;
}

- (BOOL)_wantsCompactStatusBarHiding
{
  BOOL v3 = [(UIApplication *)self _supportsCompactStatusBarHiding];
  if (v3) {
    LOBYTE(v3) = *((unsigned char *)&self->_applicationFlags + 3) & 1;
  }
  return v3;
}

- (BOOL)_supportsCompactStatusBarHiding
{
  return dyld_program_sdk_at_least();
}

- (id)statusBar
{
  return [(UIApplication *)self statusBarWithWindow:0];
}

- (void)_setReachabilitySupported:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIApplication *)self _mainScene];
  id v4 = +[UIScene _sceneForFBSScene:v5];
  [v4 _setReachabilitySupported:v3 forReason:@"UIApplication _setReachabilitySupported (deprecated)"];
}

- (void)_setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(NSMutableSet *)self->_idleTimerDisabledReasons removeObject:v6];
  if (v4) {
    [(NSMutableSet *)self->_idleTimerDisabledReasons addObject:v6];
  }
  BOOL v7 = [(NSMutableSet *)self->_idleTimerDisabledReasons count] != 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v8 = +[UIScene _scenesIncludingInternal:1];
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
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __49__UIApplication__setIdleTimerDisabled_forReason___block_invoke;
        v14[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
        BOOL v15 = v7;
        [v13 _updateUIClientSettingsWithBlock:v14];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (id)delegate
{
  return self->_delegate;
}

- (BOOL)_appSupportsMultipleScenes
{
  return *((unsigned char *)&self->_applicationFlags + 14) & 1;
}

- (BOOL)_isActivating
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 4) >> 1) & 1;
}

+ (BOOL)shouldMakeUIForDefaultPNG
{
  return _MergedGlobals_143;
}

- (id)_gestureDelayedEventComponentDispatcher
{
  return self->__gestureDelayedEventComponentDispatcher;
}

- (id)_gestureEnvironment
{
  return self->__gestureEnvironment;
}

uint64_t __60__UIApplication__updateSerializableKeyCommandsForResponder___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 184) &= ~0x8000000000000uLL;
  return [(id)UIApp _immediatelyUpdateSerializableKeyCommandsForResponder:0];
}

uint64_t __57__UIApplication__addAfterCACommitBlockForViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeAfterAppearanceBlock];
}

+ (BOOL)_isClassic
{
  return [a1 _classicMode] != 0;
}

+ (int64_t)_classicMode
{
  return 0;
}

- (BOOL)_supportedOnLockScreen
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 14) >> 1) & 1;
}

- (BOOL)_appAdoptsUISceneLifecycle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__UIApplication__appAdoptsUISceneLifecycle__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  if (qword_1EB25B578 != -1) {
    dispatch_once(&qword_1EB25B578, block);
  }
  return ((*((unsigned char *)&self->_applicationFlags + 8) & 3) != 0) | byte_1EB25B4DD & 1;
}

- (UIBackgroundTaskIdentifier)beginBackgroundTaskWithName:(NSString *)taskName expirationHandler:(void *)handler
{
  return _UIApplicationBeginBackgroundTaskWithExpirationHandler(handler, taskName);
}

- (BOOL)_didEatCurrentTouchForWindow:(id)a3
{
  -[UIEventEnvironment _currentTouchForWindow:]((uint64_t)self->_eventDispatcher->_mainEnvironment, a3);
  BOOL v3 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    BOOL v4 = v3[264] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

void __72__UIApplication_SessionAndConfigurationInternal___discardSceneSessions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _removeSessionFromSessionSet:v3];
  if ([v3 _isInternal]) {
    [*(id *)(a1 + 40) removeObject:v3];
  }
}

uint64_t __81__UIApplication_SessionAndConfigurationInternal___openSessionsIncludingInternal___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isInternal] ^ 1;
}

- (void)_removeSessionFromSessionSet:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
    if (qword_1EB25BA00 != -1) {
      dispatch_once(&qword_1EB25BA00, &__block_literal_global_4054);
    }
    [(id)qword_1EB25B9F8 removeObject:v5];
    BOOL v4 = v5;
  }
}

- (void)_handleUserDefaultsDidChange:(id)a3
{
  id v5 = a3;
  if (pthread_main_np())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v5;
    }
    else
    {

      id v4 = 0;
    }
    id v5 = v4;
    [(UIApplication *)self userDefaultsDidChange:v4];
  }
  else
  {
    [(UIApplication *)self performSelectorOnMainThread:sel__handleUserDefaultsDidChange_ withObject:v5 waitUntilDone:0];
  }
}

- (NSSet)connectedScenes
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = +[UIScene _scenesIncludingInternal:0];
  id v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (BOOL)_isCertainCheckpointInAppLaunchReached
{
  return byte_1EB25B4E2;
}

- (BOOL)isSuspendedEventsOnly
{
  v2 = +[_UISceneLifecycleMultiplexer sharedInstance];
  char v3 = [v2 suspendedEventsOnly];

  return v3;
}

- (unint64_t)_supportedInterfaceOrientationsForWindow:(id)a3
{
  id v4 = a3;
  if (self->_delegate && (*((unsigned char *)&self->_applicationFlags + 7) & 8) != 0)
  {
    id v5 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v6 = __58__UIApplication__supportedInterfaceOrientationsForWindow___block_invoke;
  }
  else
  {
    id v5 = v10;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    id v6 = __58__UIApplication__supportedInterfaceOrientationsForWindow___block_invoke_2;
  }
  v5[2] = v6;
  v5[3] = &unk_1E5302778;
  v5[4] = self;
  id v7 = v4;
  v5[5] = v7;
  unint64_t OrientationMask = _UISafelyGetOrientationMask(v5);

  if (!_UIDeviceNativeUserInterfaceIdiom() && !+[UIDevice _hasHomeButton]) {
    OrientationMask &= 0x1Au;
  }

  return OrientationMask;
}

- (int64_t)_pureEffectiveUserInterfaceStyle
{
  if (qword_1EB25B8D0 != -1) {
    dispatch_once(&qword_1EB25B8D0, &__block_literal_global_3645);
  }
  int64_t result = qword_1EB25B8C8;
  if (!qword_1EB25B8C8)
  {
    int64_t result = +[UIApplication _debugUserInterfaceStyleOverride];
    if (!result)
    {
      [(UIApplication *)self _observeDebugOrTestUserInterfaceStyleChanged];
      if (qword_1EB25B8E8 != -1) {
        dispatch_once(&qword_1EB25B8E8, &__block_literal_global_3666);
      }
      if (!byte_1EB25B50B) {
        return self->_systemUserInterfaceStyle;
      }
      id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      int64_t v5 = [v4 integerForKey:@"OverrideUserInterfaceStyle"];

      int64_t result = v5;
      if (!v5)
      {
        id v6 = _UIKitUserDefaults();
        int64_t v7 = [v6 integerForKey:@"OverrideUserInterfaceStyle"];

        int64_t result = v7;
        if (!v7) {
          return self->_systemUserInterfaceStyle;
        }
      }
    }
  }
  return result;
}

- (void)_observeDebugOrTestUserInterfaceStyleChanged
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__UIApplication__observeDebugOrTestUserInterfaceStyleChanged__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  if (_observeDebugOrTestUserInterfaceStyleChanged_onceToken != -1) {
    dispatch_once(&_observeDebugOrTestUserInterfaceStyleChanged_onceToken, block);
  }
}

+ (int64_t)_debugUserInterfaceStyleOverride
{
  return sDebugUserInterfaceStyleOverride;
}

- (uint64_t)_defaultSupportedInterfaceOrientations
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = +[UIDevice currentDevice];
    uint64_t v3 = [v2 userInterfaceIdiom];

    if ([*(id *)(v1 + 232) supportedInterfaceOrientations])
    {
      id v4 = *(void **)(v1 + 232);
      return [v4 supportedInterfaceOrientations];
    }
    else if (v3 == 1)
    {
      return 30;
    }
    else if (v3 {
           || (+[UIScreen mainScreen],
    }
               int64_t v5 = objc_claimAutoreleasedReturnValue(),
               int v6 = [v5 _wantsWideContentMargins],
               v5,
               v6))
    {
      int64_t v7 = +[UIScreen mainScreen];
      int v8 = [v7 _wantsWideContentMargins];

      if (v8) {
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
  return result;
}

uint64_t __58__UIApplication__supportedInterfaceOrientationsForWindow___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) supportedInterfaceOrientationsForWindow:*(void *)(a1 + 40)];
}

- (BOOL)isSuspended
{
  v2 = +[_UISceneLifecycleMultiplexer sharedInstance];
  BOOL v3 = [v2 applicationState] == 2;

  return v3;
}

- (UIApplicationState)applicationState
{
  v2 = +[_UISceneLifecycleMultiplexer sharedInstance];
  UIApplicationState v3 = [v2 applicationState];

  return v3;
}

uint64_t __58__UIApplication__supportedInterfaceOrientationsForWindow___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) application:*(void *)(a1 + 32) supportedInterfaceOrientationsForWindow:*(void *)(a1 + 40)];
}

- (void)_updateSerializableKeyCommandsForResponder:(id)a3
{
  if ([(UIApplication *)self _supportsMenuActions])
  {
    uint64_t v4 = *((void *)&self->_applicationFlags + 1);
    if ((v4 & 0x8000000000000) == 0)
    {
      *(void *)&self->_applicationFlags = self->_applicationFlags;
      *((void *)&self->_applicationFlags + 1) = v4 | 0x8000000000000;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __60__UIApplication__updateSerializableKeyCommandsForResponder___block_invoke;
      v5[3] = &unk_1E52D9F70;
      v5[4] = self;
      [(id)UIApp _performBlockAfterCATransactionCommits:v5];
    }
  }
}

- (BOOL)_supportsMenuActions
{
  return 1;
}

- (id)statusBarWithWindow:(id)a3
{
  id v4 = a3;
  int64_t v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 interfaceOrientation];
  }
  else {
    uint64_t v6 = 0;
  }
  int64_t v7 = [v5 windowScene];
  [(UIApplication *)self _createStatusBarIfNeededWithOrientation:v6 forWindowScene:v7];

  int v8 = self->_statusBar;
  return v8;
}

- (void)_createStatusBarIfNeededWithOrientation:(int64_t)a3 forWindowScene:(id)a4
{
  id v6 = a4;
  if (!self->_statusBar)
  {
    id v8 = v6;
    BOOL v7 = [(UIApplication *)self _hostsSystemStatusBar];
    id v6 = v8;
    if (v7)
    {
      if (!a3) {
        a3 = [(UIApplication *)self _safeInterfaceOrientationForNoWindow];
      }
      if ((*((unsigned char *)&self->_applicationFlags + 14) & 0x10) != 0) {
        [(UIApplication *)self _createStatusBarWithRequestedStyle:0 orientation:a3 hidden:0];
      }
      else {
        [(UIApplication *)self _createStatusBarWithRequestedStyle:0 orientation:a3 hidden:0 forWindowScene:v8];
      }
      id v6 = v8;
    }
  }
}

- (BOOL)_isHandlingMemoryWarning
{
  return *((unsigned __int8 *)&self->_applicationFlags + 11) >> 7;
}

- (id)_findUISceneForLegacyInterfaceOrientation
{
  if (qword_1EB25B928 != -1) {
    dispatch_once(&qword_1EB25B928, &__block_literal_global_3747);
  }
  if (byte_1EB25B50D)
  {
    UIApplicationState v3 = +[UIScreen mainScreen];
    id v4 = +[UIWindowScene _unassociatedWindowSceneForScreen:v3 create:0];
LABEL_5:
    int64_t v5 = v4;
    goto LABEL_6;
  }
  UIApplicationState v3 = [(UIApplication *)self _defaultUISceneOrMainScreenPlaceholderIfExists];
  if (v3 && [(id)objc_opt_class() _hostsWindows])
  {
    id v4 = v3;
    UIApplicationState v3 = v4;
    goto LABEL_5;
  }
  BOOL v7 = +[UIScreen mainScreen];
  int64_t v5 = +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:v7];

  if (!v5)
  {
    if (qword_1EB25B5B8 != -1) {
      dispatch_once(&qword_1EB25B5B8, &__block_literal_global_1234);
    }
    if (byte_1EB25B4E3) {
      goto LABEL_19;
    }
    if (qword_1EB25B5C8 != -1) {
      dispatch_once(&qword_1EB25B5C8, &__block_literal_global_1247_0);
    }
    if (byte_1EB25B4E4)
    {
LABEL_19:
      id v8 = +[UIScreen mainScreen];
      int64_t v5 = +[UIWindowScene _unassociatedWindowSceneForScreen:v8 create:0];
    }
    else
    {
      int64_t v5 = 0;
    }
  }
LABEL_6:

  return v5;
}

- (id)_defaultUISceneOrMainScreenPlaceholderIfExists
{
  v2 = [(UIApplication *)self _defaultSceneIfExists];
  UIApplicationState v3 = +[UIScene _sceneForFBSScene:v2];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = +[UIScreen mainScreen];
    id v5 = +[UIWindowScene _placeholderWindowSceneForScreen:v6 create:0];
  }
  return v5;
}

- (id)_defaultSceneIfExists
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__164;
  BOOL v15 = __Block_byref_object_dispose__164;
  id v16 = 0;
  v2 = +[_UIApplicationConfigurationLoader sharedLoader];
  UIApplicationState v3 = [v2 applicationInitializationContext];
  id v4 = [v3 defaultSceneToken];

  if (v4)
  {
    id v5 = (void *)qword_1EB25B580;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38__UIApplication__defaultSceneIfExists__block_invoke;
    v8[3] = &unk_1E5302BA0;
    id v9 = v4;
    uint64_t v10 = &v11;
    [v5 enumerateObjectsUsingBlock:v8];
  }
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

+ (BOOL)rendersLocally
{
  return 0;
}

- (BOOL)_shouldAllowKeyboardArbiter
{
  if ([(id)objc_opt_class() _isSystemUIService]) {
    LOBYTE(v3) = 0;
  }
  else {
    return *((unsigned __int8 *)&self->_applicationFlags + 3) >> 7;
  }
  return v3;
}

+ (BOOL)_isSystemUIService
{
  return 0;
}

- (void)_trackSystemAnimationFence:(id)a3
{
  id v10 = a3;
  id v5 = [(UIApplication *)self _fenceProvider];
  int v6 = [v5 trackSystemAnimationFence:v10];

  BOOL v7 = v10;
  if (v6)
  {
    if (pthread_main_np() != 1)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"UIApplication.m" lineNumber:2476 description:@"Call must be made on main thread"];
    }
    BOOL v7 = v10;
    if (!self->_cachedSystemAnimationFence)
    {
      id v8 = (void *)[v10 copy];
      -[UIApplication _setCachedSystemAnimationFence:]((uint64_t)self, v8);

      [(UIApplication *)self _beginFenceTaskIfNecessary];
      BOOL v7 = v10;
    }
  }
}

- (UIFenceProviding)_fenceProvider
{
  return (UIFenceProviding *)+[_UISimpleFenceProvider sharedInstance];
}

- (void)_beginFenceTaskIfNecessary
{
  if (pthread_main_np() != 1)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"UIApplication.m" lineNumber:2422 description:@"Call must be made on main thread"];
  }
  if (!self->_fenceTask)
  {
    id v4 = (_UIFenceTask *)objc_opt_new();
    fenceTask = self->_fenceTask;
    self->_fenceTask = v4;

    int v6 = v4;
    [MEMORY[0x1E4F39CF8] activate];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __43__UIApplication__beginFenceTaskIfNecessary__block_invoke;
    v14[3] = &unk_1E52D9CD0;
    void v14[4] = self;
    v14[5] = a2;
    if (([MEMORY[0x1E4F39CF8] addCommitHandler:v14 forPhase:2] & 1) == 0)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"UIApplication.m" lineNumber:2430 description:@"failed to schedule clearing the fence task"];
    }
    BOOL v7 = (void *)MEMORY[0x1E4F39CF8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __43__UIApplication__beginFenceTaskIfNecessary__block_invoke_2;
    v12[3] = &unk_1E52D9F70;
    id v8 = v6;
    uint64_t v13 = v8;
    if (([v7 addCommitHandler:v12 forPhase:5] & 1) == 0)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"UIApplication.m" lineNumber:2435 description:@"failed to schedule invalidating the fence task"];
    }
  }
}

uint64_t __34__UIApplication__firstCommitBlock__block_invoke_2(uint64_t a1)
{
  _UIApplicationDrainManagedAutoreleasePool();
  [MEMORY[0x1E4F39CF8] flush];
  v2 = *(void **)(a1 + 32);
  return _cleanUpAfterCAFlushAndRunDeferredBlocks(v2, 1);
}

- (BOOL)_supportsIndirectInputEvents
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__UIApplication__supportsIndirectInputEvents__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  if (qword_1EB25B7A8 != -1) {
    dispatch_once(&qword_1EB25B7A8, block);
  }
  return byte_1EB25B4FE;
}

- (void)_cancelGestureRecognizersForView:(id)a3
{
  gestureEnvironment = self->__gestureEnvironment;
  id v4 = [a3 gestureRecognizers];
  -[UIGestureEnvironment _cancelGestureRecognizers:]((uint64_t)gestureEnvironment, v4);
}

- (void)_endBackgroundTask:(unint64_t)a3
{
  if ((_UIApplicationEndBackgroundTask((const void *)a3) & 1) == 0)
  {
    p_applicationFlags = &self->_applicationFlags;
    uint64_t v5 = *((void *)&self->_applicationFlags + 1);
    if ((v5 & 0x4000000000000) != 0)
    {
      uint64_t v6 = *(void *)p_applicationFlags;
      *(void *)p_applicationFlags = *(void *)p_applicationFlags;
      *((void *)&self->_applicationFlags + 1) = v5 & 0xFFFBFFFFFFFFFFFFLL;
      if ((v6 & 0x3FFFF) != 0)
      {
        _logApplicationLifecycleMemoryMetricApplicationWillBeSuspended();
      }
    }
  }
}

- (BOOL)_disableBecomeFirstResponder
{
  return *((unsigned __int8 *)&self->_applicationFlags + 13) >> 7;
}

- (BOOL)_supportsAlwaysOnDisplay
{
  return [(_UIApplicationInfoParser *)self->_appInfo supportsAlwaysOnDisplay];
}

- (BOOL)_supportsBacklightEnvironment
{
  return [(_UIApplicationInfoParser *)self->_appInfo supportsBacklightEnvironment];
}

- (void)_deactivateForReason:(int)a3 notify:(BOOL)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (a3 != -1)
  {
    uint64_t v4 = *(void *)&a3;
    if (a3 == 8)
    {
      uint64_t v11 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      BOOL v7 = [v11 scene];

      uint64_t v12 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      [v12 setSuppressingKeyboard:1 forScene:v7];

      uint64_t v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B548) + 8);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        return;
      }
      id v8 = v13;
      v14 = _UIApplicationDeactivationReasonLoggableDescription(8);
      BOOL v15 = _UIApplicationDeactivationReasonMaskLoggableDescription(*(_DWORD *)&self->_applicationFlags & 0x3FFFF);
      *(_DWORD *)buf = 138543618;
      v41 = v14;
      __int16 v42 = 2114;
      v43 = v15;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "Acting on addition of deactivation reason: %{public}@; deactivation reasons: %{public}@",
        buf,
        0x16u);

LABEL_12:
      goto LABEL_13;
    }
    if (a3 == 30)
    {
      uint64_t v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B540) + 8);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      BOOL v7 = v6;
      id v8 = _UIApplicationDeactivationReasonLoggableDescription(30);
      id v9 = _UIApplicationDeactivationReasonMaskLoggableDescription(*(_DWORD *)&self->_applicationFlags & 0x3FFFF);
      *(_DWORD *)buf = 138543618;
      v41 = v8;
      __int16 v42 = 2114;
      v43 = v9;
      id v10 = "Ignoring deactivation reason: %{public}@; deactivation reasons: %{public}@";
LABEL_11:
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, v10, buf, 0x16u);

      goto LABEL_12;
    }
    uint64_t applicationFlags = (uint64_t)self->_applicationFlags;
    int v17 = 1 << a3;
    if (((1 << a3) & applicationFlags & 0x3FFFF) != 0)
    {
      long long v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B550) + 8);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      BOOL v7 = v18;
      id v8 = _UIApplicationDeactivationReasonLoggableDescription(v4);
      id v9 = _UIApplicationDeactivationReasonMaskLoggableDescription(*(_DWORD *)&self->_applicationFlags & 0x3FFFF);
      *(_DWORD *)buf = 138543618;
      v41 = v8;
      __int16 v42 = 2114;
      v43 = v9;
      id v10 = "Ignoring already applied deactivation reason: %{public}@; deactivation reasons: %{public}@";
      goto LABEL_11;
    }
    BOOL v19 = a4;
    int v20 = 0;
    uint64_t v21 = *((void *)&self->_applicationFlags + 1);
    switch(a3)
    {
      case 0:
      case 5:
        *(void *)&self->_uint64_t applicationFlags = applicationFlags | 0x100000000;
        *((void *)&self->_applicationFlags + 1) = v21;
        if (a3 != 4) {
          goto LABEL_21;
        }
        goto LABEL_17;
      case 3:
        *(void *)&self->_uint64_t applicationFlags = applicationFlags;
        *((void *)&self->_applicationFlags + 1) = v21 & 0xFFFFFBFFFFFFFFFFLL;
        [(UIApplication *)self _deliverRemainingKeyUpEvents];
        goto LABEL_21;
      case 4:
LABEL_17:
        systemNavigationAction = self->_systemNavigationAction;
        if (systemNavigationAction && ([(UISystemNavigationAction *)systemNavigationAction isValid] & 1) == 0) {
          [(UIApplication *)self _setSystemNavigationAction:0];
        }
LABEL_21:
        int v20 = 0;
        break;
      case 11:
        [(UIApplication *)self _deliverRemainingKeyUpEvents];
        int v20 = 1;
        break;
      default:
        break;
    }
    uint64_t v23 = *(_DWORD *)&self->_applicationFlags & 0x3FFFF | v17;
    v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B558) + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = _UIApplicationDeactivationReasonLoggableDescription(v4);
      v27 = _UIApplicationDeactivationReasonMaskLoggableDescription(*(_DWORD *)&self->_applicationFlags & 0x3FFFF);
      _UIApplicationDeactivationReasonMaskLoggableDescription(v23);
      int v39 = v23;
      v29 = int v28 = v20;
      int v30 = *((_DWORD *)&self->_applicationFlags + 1) & 1;
      *(_DWORD *)buf = 138544130;
      v41 = v26;
      __int16 v42 = 2114;
      v43 = v27;
      __int16 v44 = 2114;
      v45 = v29;
      __int16 v46 = 1024;
      int v47 = v30;
      _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_DEFAULT, "Deactivation reason added: %{public}@; deactivation reasons: %{public}@ -> %{public}@; animating application lif"
        "ecycle event: %d",
        buf,
        0x26u);

      int v20 = v28;
      LODWORD(v23) = v39;
    }
    uint64_t v31 = (uint64_t)self->_applicationFlags;
    if ((*(_DWORD *)&self->_applicationFlags & 0x3FFFF) != v23 && v19)
    {
      v33 = (void *)MEMORY[0x1E4F1C9E8];
      v34 = [NSNumber numberWithInt:v4];
      v35 = [v33 dictionaryWithObject:v34 forKey:@"_UIApplicationDeactivationReasonUserInfoKey"];

      v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v36 postNotificationName:@"_UIApplicationWillAddDeactivationReasonNotification" object:self userInfo:v35];

      uint64_t v31 = (uint64_t)self->_applicationFlags;
    }
    if ((v31 & 0x3FFFF) != 0 || !v19)
    {
      if ((v31 & 0x100000000) != 0) {
        goto LABEL_43;
      }
    }
    else
    {
      kdebug_trace();
      byte_1EB25B4DC = 0;
      [(UIApplication *)self _updateHangTracer];
      [(UIApplicationDelegate *)self->_delegate methodForSelector:sel_applicationWillResignActive_];
      entr_act_modify();
      if (self->_delegate
        && (*((unsigned char *)&self->_applicationFlags + 6) & 0x20) != 0
        && ([(id)UIApp _appAdoptsUICanvasLifecycle] & 1) == 0
        && ([(id)UIApp _appAdoptsUISceneLifecycle] & 1) == 0)
      {
        *((void *)&self->_applicationFlags + 1) |= 0x200000000000uLL;
        [(UIApplicationDelegate *)self->_delegate applicationWillResignActive:self];
        *((void *)&self->_applicationFlags + 1) &= ~0x200000000000uLL;
      }
      v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v38 postNotificationName:@"UIApplicationWillResignActiveNotification" object:self userInfo:0];

      [(UIApplication *)self _deliverRemainingKeyUpEvents];
      [(UIApplication *)self _cancelAllPressesForTVOnly];
      entr_act_modify();
      entr_act_end();
      _UIAnalyticsGatherMultitouchForegroundAnalytics(0);
      kdebug_trace();
      if ((*(void *)&self->_applicationFlags & 0x100000000) != 0)
      {
LABEL_43:
        BSSetMainThreadPriorityFixedForUI();
        if (v20)
        {
LABEL_44:
          if (!+[_UIViewServiceSessionManager hasActiveSessions](_UIViewServiceSessionManager, "hasActiveSessions"))+[UIView _beginSuspendingMotionEffectsForReason:@"_UIMotionEffectEngineSuspensionReasonBackgrounded"]; {
        }
          }
LABEL_46:
        *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFFFFFFFFFC0000 | v23 & 0x3FFFF;
        return;
      }
    }
    if (v20) {
      goto LABEL_44;
    }
    goto LABEL_46;
  }
}

- (void)_stopDeactivatingForReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a3 <= 12)
  {
    if (a3 == -1) {
      return;
    }
    if (a3 == 8)
    {
      uint64_t v5 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      [v5 setSuppressingKeyboard:0 forScene:0];

      uint64_t v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B568) + 8);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      BOOL v7 = v6;
      id v8 = _UIApplicationDeactivationReasonLoggableDescription(8);
      id v9 = _UIApplicationDeactivationReasonMaskLoggableDescription(*(_DWORD *)&self->_applicationFlags & 0x3FFFF);
      *(_DWORD *)buf = 138543618;
      int v39 = v8;
      __int16 v40 = 2114;
      v41 = v9;
      id v10 = "Acting on removal of deactivation reason: %{public}@; deactivation reasons: %{public}@";
LABEL_10:
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, v10, buf, 0x16u);

      return;
    }
LABEL_13:
    uint64_t applicationFlags = (uint64_t)self->_applicationFlags;
    uint64_t v13 = *((void *)&self->_applicationFlags + 1);
    goto LABEL_14;
  }
  if (a3 != 13)
  {
    if (a3 == 30)
    {
      uint64_t v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B560) + 8);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      BOOL v7 = v11;
      id v8 = _UIApplicationDeactivationReasonLoggableDescription(30);
      id v9 = _UIApplicationDeactivationReasonMaskLoggableDescription(*(_DWORD *)&self->_applicationFlags & 0x3FFFF);
      *(_DWORD *)buf = 138543618;
      int v39 = v8;
      __int16 v40 = 2114;
      v41 = v9;
      id v10 = "Ignoring removal of deactivation reason: %{public}@; deactivation reasons: %{public}@";
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  uint64_t applicationFlags = (uint64_t)self->_applicationFlags;
  if ((applicationFlags & 0x2000) == 0) {
    return;
  }
  uint64_t v13 = *((void *)&self->_applicationFlags + 1);
LABEL_14:
  p_uint64_t applicationFlags = &self->_applicationFlags;
  int v15 = applicationFlags & 0x3FFFF;
  int v16 = applicationFlags & ~(1 << a3);
  if ((v16 & 0x21) != 0) {
    unint64_t v17 = applicationFlags & 0xFFFFFFFFFFFC0000 | v16 & 0x3FFFF;
  }
  else {
    unint64_t v17 = applicationFlags & 0xFFFFFFFEFFFC0000 | v16 & 0x3FFFFLL;
  }
  *(void *)p_uint64_t applicationFlags = v17;
  *((void *)&self->_applicationFlags + 1) = v13;
  long long v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B570) + 8);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v19 = v18;
    int v20 = _UIApplicationDeactivationReasonLoggableDescription(v3);
    uint64_t v21 = _UIApplicationDeactivationReasonMaskLoggableDescription(applicationFlags & 0x3FFFF);
    v22 = _UIApplicationDeactivationReasonMaskLoggableDescription(*(_DWORD *)p_applicationFlags & 0x3FFFF);
    int v23 = *((_DWORD *)p_applicationFlags + 1) & 1;
    *(_DWORD *)buf = 138544130;
    int v39 = v20;
    __int16 v40 = 2114;
    v41 = v21;
    __int16 v42 = 2114;
    v43 = v22;
    __int16 v44 = 1024;
    int v45 = v23;
    _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEFAULT, "Deactivation reason removed: %{public}@; deactivation reasons: %{public}@ -> %{public}@; animating application lif"
      "ecycle event: %d",
      buf,
      0x26u);
  }
  if (![(UIApplication *)self isFrontBoard])
  {
    v24 = [(UIApplication *)self __queuedOrientationChange];

    if (v24)
    {
      v25 = [(UIApplication *)self __queuedOrientationChange];
      v25[2]();

      [(UIApplication *)self __setQueuedOrientationChange:0];
    }
    else if ([(UIApplication *)self _canReceiveDeviceOrientationEvents])
    {
      v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v27 = +[UIDevice currentDevice];
      int v28 = objc_msgSend(NSNumber, "numberWithInt:", -[UIApplication isSuspended](self, "isSuspended", @"UIDeviceOrientationRotateAnimatedUserInfoKey") ^ 1);
      v37 = v28;
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      [v26 postNotificationName:@"UIDeviceOrientationDidChangeNotification" object:v27 userInfo:v29];
    }
  }
  uint64_t v30 = (uint64_t)self->_applicationFlags;
  if ((*(_DWORD *)&self->_applicationFlags & 0x3FFFF) != v15)
  {
    uint64_t v31 = (void *)MEMORY[0x1E4F1C9E8];
    v32 = [NSNumber numberWithInt:v3];
    v33 = [v31 dictionaryWithObject:v32 forKey:@"_UIApplicationDeactivationReasonUserInfoKey"];

    v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 postNotificationName:@"_UIApplicationDidRemoveDeactivationReasonNotification" object:self userInfo:v33];

    uint64_t v30 = (uint64_t)self->_applicationFlags;
  }
  if (v15 && (v30 & 0x3FFFF) == 0)
  {
    kdebug_trace();
    byte_1EB25B4DC = 1;
    [(UIApplication *)self _updateHangTracer];
    entr_act_begin();
    [(UIApplicationDelegate *)self->_delegate methodForSelector:sel_applicationDidBecomeActive_];
    entr_act_modify();
    _UIAnalyticsGatherMultitouchForegroundAnalytics(1);
    if (self->_delegate
      && (*((unsigned char *)&self->_applicationFlags + 6) & 0x10) != 0
      && ([(id)UIApp _appAdoptsUICanvasLifecycle] & 1) == 0
      && ([(id)UIApp _appAdoptsUISceneLifecycle] & 1) == 0)
    {
      [(UIApplicationDelegate *)self->_delegate applicationDidBecomeActive:self];
    }
    v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v35 postNotificationName:@"UIApplicationDidBecomeActiveNotification" object:self userInfo:0];

    *((void *)&self->_applicationFlags + 1) &= ~0x40000000000uLL;
    kdebug_trace();
    uint64_t v30 = (uint64_t)self->_applicationFlags;
  }
  if (((v30 ^ applicationFlags) & 0x100000000) != 0 && ![(UIApplication *)self isSuspended]) {
    BSSetMainThreadPriorityFixedForUI();
  }
  if (v3 == 11) {
    +[UIView _endSuspendingMotionEffectsForReason:@"_UIMotionEffectEngineSuspensionReasonBackgrounded"];
  }
}

- (id)__queuedOrientationChange
{
  return self->___queuedOrientationChange;
}

- (BOOL)_canReceiveDeviceOrientationEvents
{
  v2 = [(UIApplication *)self _mainScene];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 uiCanReceiveDeviceOrientationEvents];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)_mainScene
{
  return _UIApplicationMainSceneForDisplayIdentity(0);
}

- (void)_updateHangTracer
{
  if (__hangTracerIsTaskedOn && byte_1EB25B4DC == 1 && (byte_1EB25B4F9 & 1) == 0) {
    int v2 = ![(UIApplication *)self isSuspended];
  }
  else {
    int v2 = 0;
  }
  if (byte_1EB25B4FA != v2)
  {
    if (v2)
    {
      if (qword_1EB25B6C8)
      {
        HTResumeHangTracing();
      }
      else
      {
        qword_1EB25B6C8 = HTHangEventCreate();
        if (!qword_1EB25B6C8) {
          return;
        }
        HTHangEventAddUserActionCaptureCallback();
        qword_1EB25B6D0 = (uint64_t)CFRunLoopObserverCreate(0, 0x20uLL, 1u, 0x7FFFFFFFLL, (CFRunLoopObserverCallBack)__trackRunLoopTimes, 0);
        Main = CFRunLoopGetMain();
        CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D410];
        CFRunLoopAddObserver(Main, (CFRunLoopObserverRef)qword_1EB25B6D0, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
        qword_1EB25B6D8 = (uint64_t)CFRunLoopObserverCreate(0, 0x46uLL, 1u, 0xFFFFFFFF80000000, (CFRunLoopObserverCallBack)__trackRunLoopTimes, 0);
        uint64_t v5 = CFRunLoopGetMain();
        CFRunLoopAddObserver(v5, (CFRunLoopObserverRef)qword_1EB25B6D8, v4);
      }
    }
    else if (qword_1EB25B6C8)
    {
      HTSuspendHangTracing();
    }
    byte_1EB25B4FA = v2;
  }
}

- (BOOL)_supportsPrintCommand
{
  int v2 = [(_UIApplicationInfoParser *)self->_appInfo supportsPrintCommand];
  if (v2)
  {
    LOBYTE(v2) = dyld_program_sdk_at_least();
  }
  return v2;
}

- (BOOL)_supportsOpenCommand
{
  if (qword_1EB25B838 != -1) {
    dispatch_once(&qword_1EB25B838, &__block_literal_global_2263);
  }
  return byte_1EB25B502;
}

+ (id)_defaultContentSizeCategory
{
  return @"UICTContentSizeCategoryL";
}

- (BOOL)_fakingRequiresHighResolution
{
  appInfo = self->_appInfo;
  return !appInfo || [(_UIApplicationInfoParser *)appInfo fakingRequiresHighResolution];
}

- (void)_cancelViewProcessingOfTouchesOrPresses:(id)a3 withEvent:(id)a4 sendingCancelToViewsOfTouchesOrPresses:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__UIApplication__cancelViewProcessingOfTouchesOrPresses_withEvent_sendingCancelToViewsOfTouchesOrPresses___block_invoke;
  v12[3] = &unk_1E5302BF0;
  id v13 = v9;
  id v14 = v8;
  id v10 = v8;
  id v11 = v9;
  [(UIApplication *)self _cancelTouchesOrPresses:a3 withEvent:v10 includingGestures:0 notificationBlock:v12];
}

- (void)_cancelPressesIfNeededForViewRemovedFromResponderChain:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (id)[v4 window];
  id v6 = (id)[(id)UIApp _pressesEventForWindow:v5];
  if (v6)
  {
    id v16 = v6;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    BOOL v7 = [v6 allPresses];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = 0;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v14 = [v13 responder];
          while (v14 != v4)
          {
            uint64_t v15 = [v14 nextResponder];

            id v14 = (id)v15;
            if (!v15) {
              goto LABEL_14;
            }
          }
          if (!v10) {
            id v10 = objc_opt_new();
          }
          [v10 addObject:v13];

LABEL_14:
          ;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
    else
    {
      id v10 = 0;
    }

    [(UIApplication *)self _cancelTouchesOrPresses:v10 withEvent:v16];
  }
}

- (void)_cancelTouchesOrPresses:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__UIApplication__cancelTouchesOrPresses_withEvent___block_invoke;
  v8[3] = &unk_1E5302BF0;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(UIApplication *)self _cancelTouchesOrPresses:a3 withEvent:v7 includingGestures:1 notificationBlock:v8];
}

- (void)_cancelTouchesOrPresses:(id)a3 withEvent:(id)a4 includingGestures:(BOOL)a5 notificationBlock:(id)a6
{
  BOOL v7 = a5;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(void, NSMapTable *))a6;
  if ([v9 count])
  {
    __int16 v44 = v11;
    v54 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v43 = v9;
    obuint64_t j = v9;
    uint64_t v12 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v68;
      BOOL v48 = v7;
      uint64_t v46 = *(void *)v68;
      do
      {
        uint64_t v15 = 0;
        uint64_t v50 = v13;
        do
        {
          if (*(void *)v68 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v67 + 1) + 8 * v15);
          long long v17 = objc_msgSend(v16, "_eventComponentPhaseForValue:", 4, v43);
          [v16 _setEventComponentPhase:v17];

          long long v18 = [v16 _responder];

          if (v18)
          {
            long long v19 = [v16 _responder];
            long long v20 = [(NSMapTable *)v54 objectForKey:v19];

            if (!v20)
            {
              long long v20 = objc_opt_new();
              uint64_t v21 = [v16 _responder];
              [(NSMapTable *)v54 setObject:v20 forKey:v21];
            }
            [v20 addObject:v16];
          }
          if (v7)
          {
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            uint64_t v22 = [v16 gestureRecognizers];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v63 objects:v73 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v64;
              do
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v64 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v27 = *(void *)(*((void *)&v63 + 1) + 8 * i);
                  int v28 = [(NSMapTable *)v54 objectForKey:v27];
                  if (!v28)
                  {
                    int v28 = objc_opt_new();
                    [(NSMapTable *)v54 setObject:v28 forKey:v27];
                  }
                  [v28 addObject:v16];
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v63 objects:v73 count:16];
              }
              while (v24);
            }

            BOOL v7 = v48;
            uint64_t v14 = v46;
            uint64_t v13 = v50;
          }
          ++v15;
        }
        while (v15 != v13);
        uint64_t v13 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
      }
      while (v13);
    }

    v44[2](v44, v54);
    v29 = [obj anyObject];
    uint64_t v30 = [v29 _eventComponentType];

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    NSAllMapTableKeys(v54);
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v49 = [v45 countByEnumeratingWithState:&v59 objects:v72 count:16];
    if (v49)
    {
      uint64_t v47 = *(void *)v60;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v60 != v47) {
            objc_enumerationMutation(v45);
          }
          uint64_t v51 = v31;
          v32 = *(void **)(*((void *)&v59 + 1) + 8 * v31);
          v33 = -[NSMapTable objectForKey:](v54, "objectForKey:", v32, v43);
          objc_opt_class();
          id obja = v32;
          char isKindOfClass = objc_opt_isKindOfClass();
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v35 = v33;
          uint64_t v36 = [v35 countByEnumeratingWithState:&v55 objects:v71 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v56;
            do
            {
              for (uint64_t j = 0; j != v37; ++j)
              {
                if (*(void *)v56 != v38) {
                  objc_enumerationMutation(v35);
                }
                __int16 v40 = *(void **)(*((void *)&v55 + 1) + 8 * j);
                if (isKindOfClass)
                {
                  if (v30 == 1)
                  {
                    [obja ignorePress:*(void *)(*((void *)&v55 + 1) + 8 * j) forEvent:v10];
                  }
                  else if (!v30)
                  {
                    [obja ignoreTouch:*(void *)(*((void *)&v55 + 1) + 8 * j) forEvent:v10];
                  }
                }
                v41 = [v40 gestureRecognizers];
                uint64_t v42 = [v41 count];

                if (v42)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v10 _clearViewForTouch:v40];
                  }
                  else {
                    [v40 _setResponder:0];
                  }
                }
                else if (v30 == 1)
                {
                  [v10 _removePress:v40];
                }
                else if (!v30)
                {
                  [v10 _removeTouch:v40];
                }
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v55 objects:v71 count:16];
            }
            while (v37);
          }

          uint64_t v31 = v51 + 1;
        }
        while (v51 + 1 != v49);
        uint64_t v49 = [v45 countByEnumeratingWithState:&v59 objects:v72 count:16];
      }
      while (v49);
    }

    id v9 = v43;
    uint64_t v11 = v44;
  }
}

- (id)_pressesEventForWindow:(id)a3
{
  return -[UIEventEnvironment _pressesEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

void __106__UIApplication__cancelViewProcessingOfTouchesOrPresses_withEvent_sendingCancelToViewsOfTouchesOrPresses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  NSAllMapTableKeys(v3);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = [(NSMapTable *)v3 objectForKey:v8];
        id v10 = v9;
        if (v9)
        {
          id v11 = v9;
        }
        else
        {
          id v11 = [MEMORY[0x1E4F1CAD0] set];
        }
        uint64_t v12 = v11;

        uint64_t v13 = [MEMORY[0x1E4F1CA80] setWithSet:v12];
        [v13 intersectSet:*(void *)(a1 + 32)];
        if ([v13 count] && objc_msgSend(v8, "__isKindOfUIResponder"))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = +[_UIResponderIntegrityProtection rip];
            [v14 startDeliveringPresses:v12 inPhase:4 withEvent:*(void *)(a1 + 40)];
            [v8 pressesCancelled:v12 withEvent:*(void *)(a1 + 40)];
            [v14 finishedDeliveringPresses];
          }
          else
          {
            [v8 touchesCancelled:v12 withEvent:*(void *)(a1 + 40)];
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
}

- (void)_setupStatusBarWithRequestedStyle:(int64_t)a3 orientation:(int64_t)a4 hidden:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v8 = [(UIApplication *)self _isStatusBarHiddenForOrientation:a4];
  uint64_t v9 = 0x800000;
  if (!v8 && !v5) {
    uint64_t v9 = 0;
  }
  *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFFFFFFFF7FFFFFLL | v9;
  if ([(UIApplication *)self _shouldCreateStatusBarAtLaunch])
  {
    [(UIApplication *)self _createStatusBarIfNeededWithOrientation:a4 forWindowScene:0];
  }
}

- (BOOL)_isStatusBarHiddenForOrientation:(int64_t)a3
{
  if ([(UIApplication *)self _isStatusBarForcedHiddenForOrientation:a3]) {
    LOBYTE(v4) = 1;
  }
  else {
    return *((unsigned __int8 *)&self->_applicationFlags + 2) >> 7;
  }
  return v4;
}

- (BOOL)_isStatusBarForcedHiddenForOrientation:(int64_t)a3
{
  BOOL v5 = [(UIApplication *)self _wantsCompactStatusBarHiding];
  if (v5)
  {
    LOBYTE(v5) = [(UIApplication *)self _isOrientationVerticallyCompact:a3];
  }
  return v5;
}

- (BOOL)_shouldCreateStatusBarAtLaunch
{
  return (dyld_program_sdk_at_least() & 1) == 0 && NSClassFromString(&cfstr_Fprsessionmana.isa) != 0;
}

void __45__UIApplication__isSpringBoardShowingAnAlert__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v6 = [v12 settings];
  BOOL v7 = [v6 displayIdentity];
  if (([v7 isMainDisplay] & 1) == 0) {
    goto LABEL_6;
  }
  BOOL v8 = [v12 settings];
  if (([v8 isUISubclass] & 1) == 0)
  {

LABEL_6:
    id v11 = v12;
    goto LABEL_7;
  }
  uint64_t v9 = [v12 uiSettings];
  __int16 v10 = [v9 deactivationReasons];

  id v11 = v12;
  if ((v10 & 0x2000) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
LABEL_7:
}

- (void)workspace:(id)a3 didCreateScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  kdebug_trace();
  [(id)qword_1EB25B580 addObject:v9];
  id v12 = [v9 settings];
  uint64_t v13 = [v12 displayConfiguration];

  if (v13) {
    +[UIScreen _FBSDisplayConfigurationConnected:andNotify:](UIScreen, "_FBSDisplayConfigurationConnected:andNotify:", v13, [(id)UIApp _hasCalledRunWithMainScene]);
  }
  uint64_t v14 = [v9 settings];
  int v15 = [v14 isUISubclass];

  long long v16 = [v9 settings];
  long long v17 = [v16 displayIdentity];
  long long v18 = +[UIScreen _screenWithFBSDisplayIdentity:v17];

  long long v19 = [(UIApplication *)self _connectUISceneFromFBSScene:v9 transitionContext:v10];
  if (v15)
  {
    if (v10 && ([v10 isUISubclass] & 1) == 0)
    {
      uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"UIApplication.m", 4335, @"transitionContext is of an unexpected class : %@", v10 object file lineNumber description];
    }
    long long v20 = [v9 delegate];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __75__UIApplication_workspace_didCreateScene_withTransitionContext_completion___block_invoke;
    v26[3] = &unk_1E52EFED0;
    uint64_t v21 = &v27;
    id v27 = v11;
    [v20 scene:v9 didUpdateWithDiff:0 transitionContext:v10 completion:v26];

    goto LABEL_10;
  }
  if ([(id)qword_1EB25B580 count] == 1)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __75__UIApplication_workspace_didCreateScene_withTransitionContext_completion___block_invoke_2;
    v24[3] = &unk_1E52DA040;
    uint64_t v21 = &v25;
    id v25 = v11;
    [(UIApplication *)self _handleDaemonApplicationActivationWithScene:v9 completion:v24];
LABEL_10:
  }
  kdebug_trace();
}

- (BOOL)_isOrientationVerticallyCompact:(int64_t)a3
{
  BOOL v4 = +[UIScreen mainScreen];
  BOOL v5 = [v4 _defaultTraitCollectionForInterfaceOrientation:a3];

  LOBYTE(v4) = [v5 verticalSizeClass] == 1;
  return (char)v4;
}

- (id)_preferredContentSizeCategory:(unint64_t)a3
{
  char v3 = a3;
  BOOL v4 = [(UIApplication *)self preferredContentSizeCategory];
  BOOL v5 = v4;
  if ((v3 & 1) != 0 && UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    uint64_t v6 = @"UICTContentSizeCategoryXXXL";

    BOOL v5 = v6;
  }
  if ((v3 & 2) != 0)
  {
    if (qword_1EB25B9C8 != -1) {
      dispatch_once(&qword_1EB25B9C8, &__block_literal_global_3844);
    }
    if ([(id)qword_1EB25B9D0 containsObject:v5])
    {
      uint64_t v7 = [(id)objc_opt_class() _defaultContentSizeCategory];

      BOOL v5 = (void *)v7;
    }
  }
  return v5;
}

- (BOOL)_hasCalledRunWithMainScene
{
  return byte_1EB25B4E1;
}

- (id)_workspace
{
  return (id)qword_1EB25B590;
}

- (void)_scheduleSceneEventResponseForScene:(id)a3 withResponseBlock:(id)a4
{
  if (a4) {
    [(id)qword_1EB25B598 enqueuePostSynchronizeResponse:a4];
  }
}

- (void)_performBlockAfterCATransactionCommits:(id)a3
{
}

- (void)_performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming:(BOOL)a3 block:(id)a4
{
  id v7 = a4;
  if (dyld_program_sdk_at_least() && pthread_main_np() != 1)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"UIApplication.m" lineNumber:3383 description:@"Call must be made on main thread"];

    if (a3) {
      goto LABEL_4;
    }
  }
  else if (a3)
  {
LABEL_4:
    [MEMORY[0x1E4F39CF8] activate];
    postCommitActions = self->_postCommitActions;
    id v9 = +[_UIAfterCACommitBlock blockWithBlock:v7];
    [(NSMutableArray *)postCommitActions addObject:v9];

    goto LABEL_9;
  }
  if (pthread_main_np() == 1)
  {
    [(id)qword_1EB25B5B0 enqueuePostCommitBlock:v7];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__UIApplication__performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming_block___block_invoke;
    block[3] = &unk_1E52DA040;
    id v12 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
LABEL_9:
}

- (UIWindow)keyWindow
{
  return (UIWindow *)+[UIWindow _applicationKeyWindow];
}

- (id)nextResponder
{
  if ((*((unsigned char *)&self->_applicationFlags + 10) & 0x10) != 0)
  {
    int v2 = self->_delegate;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UIApplication;
    int v2 = [(UIResponder *)&v4 nextResponder];
  }
  return v2;
}

- (void)_runWithMainScene:(id)a3 transitionContext:(id)a4 completion:(id)a5
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v56 = a4;
  kdebug_trace();
  BOOL v8 = [v7 uiSettings];
  id v9 = [v7 uiClientSettings];
  uint64_t v10 = [v9 statusBarHidden];
  uint64_t v11 = [v9 statusBarStyle];
  uint64_t v12 = [v9 interfaceOrientation];
  uint64_t v50 = [v8 deviceOrientation];
  if (v8) {
    int v13 = [v8 isForeground] ^ 1;
  }
  else {
    LOBYTE(v13) = 0;
  }
  int64_t v52 = v12;
  v53 = v9;
  char v51 = v13;
  if (qword_1EB25B5B8 != -1) {
    dispatch_once(&qword_1EB25B5B8, &__block_literal_global_1234);
  }
  int v14 = byte_1EB25B4E3;
  uint64_t state64 = 0;
  kdebug_trace();
  [(UIApplication *)self _reloadKeyboardArbiterState];
  kdebug_trace();
  long long v55 = v8;
  if (!v14)
  {
    if (qword_1EB25B5C8 != -1) {
      dispatch_once(&qword_1EB25B5C8, &__block_literal_global_1247_0);
    }
    if (byte_1EB25B4E4)
    {
      +[_UIViewServiceSessionManager startViewServiceSessionManagerAsPlugin:0];
      int v15 = _UIMainBundleIdentifier();
      _UIViewServiceConnectionNotificationName(v15, v16);
      id v17 = objc_claimAutoreleasedReturnValue();
      long long v18 = (const char *)[v17 UTF8String];

      int out_token = 0;
      notify_register_check(v18, &out_token);
      notify_get_state(out_token, &state64);
      notify_cancel(out_token);
      long long v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B6E0) + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        if (state64) {
          long long v20 = @"YES";
        }
        else {
          long long v20 = @"NO";
        }
        *(_DWORD *)buf = 138543362;
        v72 = v20;
        _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEFAULT, "Launching as view service: %{public}@", buf, 0xCu);
      }
      BOOL v8 = v55;
    }
  }
  BSSetMainThreadPriorityFixedForUI();
  if (v8)
  {
    uint64_t v21 = +[UIScreen mainScreen];
    objc_msgSend(v21, "_setUserInterfaceStyleIfNecessary:firstTimeOnly:", objc_msgSend(v8, "userInterfaceStyle"), 1);
  }
  unint64_t v22 = [(_UIApplicationInfoParser *)self->_appInfo interfaceOrientation];
  if (v7)
  {
    uint64_t v23 = [v7 settings];
    uint64_t v24 = [v23 interfaceOrientation];
  }
  else if (v22 <= 1)
  {
    uint64_t v24 = 1;
  }
  else
  {
    uint64_t v24 = v22;
  }
  if ((unint64_t)(v24 - 1) >= 4) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = v24;
  }
  if (!v8 || ([v8 statusBarDisabled] & 1) == 0) {
    [(UIApplication *)self _setupStatusBarWithRequestedStyle:v11 orientation:v25 hidden:v10];
  }
  v26 = +[UIScreen mainScreen];
  [v26 _setInterfaceOrientation:v25];

  [(UIApplication *)self setReceivesMemoryWarnings:1];
  +[UIResponder _startDeferredTrackingObjectsWithIdentifiers];
  if (![(UIApplication *)self _appAdoptsUISceneLifecycle]) {
    [(UIApplication *)self _loadMainInterfaceFile];
  }
  if ((_UIIsPrivateMainBundle() & 1) == 0) {
    [(UIApplication *)self _checkBackgroundRefreshAPIAdoption];
  }
  if ([(UIApplication *)self _isSpringBoardShowingAnAlert]) {
    [(UIApplication *)self _deactivateForReason:13 notify:0];
  }
  id v27 = [v56 actions];
  v54 = v7;
  int v28 = +[UIScene _sceneForFBSScene:v7];
  v29 = [v56 payload];
  uint64_t v30 = [v56 originatingProcess];
  [(UIApplication *)self _callInitializationDelegatesWithActions:v27 forCanvas:v28 payload:v29 fromOriginatingProcess:v30];

  +[UIResponder _cleanupAllStateRestorationTables];
  uint64_t v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v32 = +[UIScreen mainScreen];
  uint64_t v69 = 0x1ED160180;
  v33 = [NSNumber numberWithInteger:v25];
  long long v70 = v33;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
  [v31 postNotificationName:0x1ED160160 object:v32 userInfo:v34];

  [(UIApplication *)self _stopDeactivatingForReason:10];
  if (![(UIApplication *)self isSuspended])
  {
    long long v65 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v62 = 0u;
    id v35 = +[UIWindow allWindowsIncludingInternalWindows:0 onlyVisibleWindows:1];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v63 != v38) {
            objc_enumerationMutation(v35);
          }
          __int16 v40 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          v41 = [v40 _delegateViewController];
          if (v41)
          {
          }
          else if (([v40 _isTextEffectsWindow] & 1) == 0)
          {
            if (!dyld_program_sdk_at_least()
              || [(UIApplication *)self _isSpringBoard]
              || ([(id)objc_opt_class() registerAsSystemApp] & 1) != 0)
            {
              uint64_t v42 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B6E8) + 8);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1853B0000, v42, OS_LOG_TYPE_ERROR, "Application windows are expected to have a root view controller at the end of application launch", buf, 2u);
              }
            }
            else
            {
              id v43 = [MEMORY[0x1E4F28B00] currentHandler];
              [v43 handleFailureInMethod:a2 object:self file:@"UIApplication.m" lineNumber:4919 description:@"Application windows are expected to have a root view controller at the end of application launch"];
            }
          }
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v37);
    }
  }
  [(UIApplication *)self _fixupBackgroundHitTestWindow];
  unint64_t applicationFlags = (unint64_t)self->_applicationFlags;
  if (!((applicationFlags >> 19) & 1 | v51 & 1))
  {
    uint64_t v45 = *((void *)&self->_applicationFlags + 1);
    *(void *)&self->_unint64_t applicationFlags = applicationFlags | 0x80000;
    *((void *)&self->_applicationFlags + 1) = v45;
  }
  uint64_t v46 = +[UIDevice currentDevice];
  int64_t v47 = v52;
  if ([(UIApplication *)self isFrontBoard])
  {
    objc_msgSend(v46, "setOrientation:animated:", -[UIApplication activeInterfaceOrientation](self, "activeInterfaceOrientation"), 0);
  }
  else
  {
    if ((unint64_t)(v52 - 1) < 4
      || (int64_t v47 = +[UIDevice currentDeviceOrientationAllowingAmbiguous:1], (unint64_t)(v47 - 1) <= 3))
    {
      if (([v46 isGeneratingDeviceOrientationNotifications] & 1) == 0) {
        *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFF1FFFFLL | (v47 << 17);
      }
      [v46 setOrientation:v47 animated:0];
    }
    if (v50 && v50 != v47)
    {
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __64__UIApplication__runWithMainScene_transitionContext_completion___block_invoke;
      v59[3] = &unk_1E52D9CD0;
      id v60 = v46;
      uint64_t v61 = v50;
      [(UIApplication *)self _performBlockAfterCATransactionCommits:v59];
    }
  }
  if (_MergedGlobals_143)
  {
    dispatch_time_t v48 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__UIApplication__runWithMainScene_transitionContext_completion___block_invoke_2;
    block[3] = &unk_1E52D9F70;
    void block[4] = self;
    dispatch_after(v48, MEMORY[0x1E4F14428], block);
  }
  if (UIDebuggingOverlayIsEnabled()) {
    +[UIDebuggingInformationOverlay prepareDebuggingOverlay];
  }
  uint64_t v49 = +[_UISceneLifecycleMultiplexer sharedInstance];
  [v49 noteApplicationLaunchCompleted];

  kdebug_trace();
}

- (BOOL)_statusBarOrientationFollowsWindow:(id)a3
{
  id v3 = a3;
  if ([v3 _windowControlsStatusBarOrientation])
  {
    objc_super v4 = [v3 _windowHostingScene];
    BOOL v5 = v4;
    if (v4 && ![v4 _affectsScreenOrientation])
    {
      BOOL v8 = 0;
    }
    else
    {
      uint64_t v6 = [v3 _screen];
      id v7 = +[UIScreen mainScreen];
      BOOL v8 = v6 == v7;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_viewServiceIgnoresSceneForLegacyInterfaceOrientation:(id)a3
{
  if (qword_1EB25B5C8 != -1) {
    dispatch_once(&qword_1EB25B5C8, &__block_literal_global_1247_0);
  }
  BOOL v5 = 0;
  if (a3 && byte_1EB25B4E4)
  {
    uint64_t v6 = [(UIApplication *)self _defaultSceneIfExists];
    id v7 = +[UIScene _sceneForFBSScene:v6];
    if ([v7 _hostsWindows]) {
      BOOL v8 = v7;
    }
    else {
      BOOL v8 = 0;
    }
    id v9 = v8;
    if (v9) {
      BOOL v10 = v9 == a3;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      if (qword_1EB25B928 != -1)
      {
        id v12 = v9;
        dispatch_once(&qword_1EB25B928, &__block_literal_global_3747);
        id v9 = v12;
      }
      BOOL v5 = byte_1EB25B50D != 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  return v5;
}

- (void)_setExpectedViewOrientation:(int64_t)a3
{
  self->__expectedViewOrientation = a3;
}

- (int64_t)_statusBarOrientationForWindow:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4) {
    [v4 windowScene];
  }
  else {
  uint64_t v6 = [(UIApplication *)self _findUISceneForLegacyInterfaceOrientation];
  }
  id v7 = v6;
  if (v6
    && ([v6 _screen],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 _isEmbeddedScreen],
        v8,
        v9))
  {
    int64_t v10 = [v7 _interfaceOrientation];
  }
  else
  {
    int64_t v10 = 1;
  }

  return v10;
}

- (void)setReceivesMemoryWarnings:(BOOL)a3
{
  BOOL v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__UIApplication_setReceivesMemoryWarnings___block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = self;
  if (qword_1EB25B7A0 != -1) {
    dispatch_once(&qword_1EB25B7A0, block);
  }
  if (((((*(void *)&self->_applicationFlags & 0x20000000) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v5 = *((void *)&self->_applicationFlags + 1);
    uint64_t v6 = 0x20000000;
    if (!v3) {
      uint64_t v6 = 0;
    }
    *(void *)&self->_unint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFFFFFFDFFFFFFFLL | v6;
    *((void *)&self->_applicationFlags + 1) = v5;
    if (v3) {
      dispatch_resume((dispatch_object_t)qword_1EB25B798);
    }
    else {
      dispatch_suspend((dispatch_object_t)qword_1EB25B798);
    }
  }
}

- (int64_t)_normativeWhitePointAdaptivityStyleForWindow:(id)a3
{
  return [(_UIApplicationInfoParser *)self->_appInfo whitePointAdaptivityStyle];
}

- (UIStatusBarStyle)statusBarStyle
{
  return self->_statusBarRequestedStyle;
}

- (UIBackgroundRefreshStatus)backgroundRefreshStatus
{
  UIBackgroundRefreshStatus result = _cachedBackgroundRefreshStatus;
  if (_cachedBackgroundRefreshStatus == -1)
  {
    BOOL v3 = [MEMORY[0x1E4F74230] sharedConnection];
    int v4 = [v3 isAutomaticAppUpdatesAllowed];

    if (v4)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F1CB18]);
      uint64_t v6 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.apple.mt"];
      id v7 = (void *)[v5 initWithSuiteName:v6];

      [v7 synchronize];
      BOOL v8 = [v7 objectForKey:@"KeepAppsUpToDateAppList"];
      int v9 = _UIMainBundleIdentifier();
      int64_t v10 = [v8 objectForKeyedSubscript:v9];

      if (v10)
      {
        int v11 = [v10 BOOLValue];
        uint64_t v12 = 1;
        if (v11) {
          uint64_t v12 = 2;
        }
      }
      else
      {
        uint64_t v12 = 2;
      }
      _cachedBackgroundRefreshStatus = v12;

      return _cachedBackgroundRefreshStatus;
    }
    else
    {
      UIBackgroundRefreshStatus result = UIBackgroundRefreshStatusDenied;
      _cachedBackgroundRefreshStatus = 1;
    }
  }
  return result;
}

- (id)_touchesEventForWindow:(id)a3
{
  return -[UIEventEnvironment _touchesEventForWindow:]((uint64_t)self->_eventDispatcher->_mainEnvironment, a3);
}

- (BOOL)_applicationWantsGESEvents
{
  return self->_applicationWantsGESEvents;
}

- (uint64_t)_internalHandleHIDEventBypassingUIEvent:(uint64_t)result
{
  if (result)
  {
    BOOL v3 = (void *)result;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__UIApplication__internalHandleHIDEventBypassingUIEvent___block_invoke;
    block[3] = &unk_1E52D9F70;
    void block[4] = result;
    if (qword_1EB25B7E8 != -1) {
      dispatch_once(&qword_1EB25B7E8, block);
    }
    if (byte_1EB25B4FF) {
      return [v3 _handleHIDEventBypassingUIEvent:a2];
    }
    else {
      return 0;
    }
  }
  return result;
}

- (BOOL)systemIsAnimatingApplicationLifecycleEvent
{
  return *((unsigned char *)&self->_applicationFlags + 4) & 1;
}

- (BOOL)isIgnoringInteractionEvents
{
  return (*((unsigned char *)&self->_applicationFlags + 3) & 0x1E) != 0;
}

void __75__UIApplication_workspace_didCreateScene_withTransitionContext_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F62B10]);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (BOOL)_isActivated
{
  return (*(_DWORD *)&self->_applicationFlags & 0x3FFFF) == 0;
}

- (BOOL)_supportsShakesWhenNotActive
{
  return 0;
}

- (BOOL)_needsShakesWhenInactive
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1, 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) _needsShakesWhenInactive])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)sendEvent:(UIEvent *)event
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = event;
  +[UIEventAttributionView _attemptAuthenticationWithEvent:]((uint64_t)UIEventAttributionView, v4);
  if ([(UIApplication *)self handleEvent:[(UIEvent *)v4 _gsEvent] withNewEvent:v4])
  {
    _UIAnalyticsGatherMultitouchAnalytics(v4);
    id v5 = [(UIEvent *)v4 _dispatchWindows];
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("EventDispatch", &sendEvent____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      int v14 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = v14;
        *(_DWORD *)buf = 134218496;
        uint64_t v22 = [(UIEvent *)v4 type];
        __int16 v23 = 2048;
        uint64_t v24 = [(UIEvent *)v4 subtype];
        __int16 v25 = 2048;
        uint64_t v26 = [v5 count];
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "Sending UIEvent type: %li; subtype: %li; to windows: %lu",
          buf,
          0x20u);
      }
    }
    [(UIEvent *)v4 _isTouchRoutingPolicyBased];
    [(UIEvent *)v4 _isPhysicalKeyEvent];
    [v5 count];
    [(UIEvent *)v4 subtype];
    [(UIEvent *)v4 type];
    [(UIEvent *)v4 timestamp];
    _UIMachTimeForMediaTime(v7);
    kdebug_trace();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_msgSend(v13, "sendEvent:", v4, (void)v16);
          [(UIApplication *)self checkForUIEventSessionActionAnalytics:v4 forWindow:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

- (_UIResponderChainFixerUpper)_responderBasedEventDeliverer
{
  if (qword_1EB25B7F0 != -1) {
    dispatch_once(&qword_1EB25B7F0, &__block_literal_global_2065);
  }
  responderBasedEventDeliverer = self->_responderBasedEventDeliverer;
  if (responderBasedEventDeliverer) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = byte_1EB25B500 == 0;
  }
  if (!v4)
  {
    id v5 = (_UIResponderChainFixerUpper *)objc_opt_new();
    uint64_t v6 = self->_responderBasedEventDeliverer;
    self->_responderBasedEventDeliverer = v5;

    responderBasedEventDeliverer = self->_responderBasedEventDeliverer;
  }
  return responderBasedEventDeliverer;
}

- (BOOL)handleEvent:(__GSEvent *)a3 withNewEvent:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if (self)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__UIApplication__internalHandlePressesEvent___block_invoke;
      block[3] = &unk_1E52D9F70;
      void block[4] = self;
      if (qword_1EB25B7E0 != -1) {
        dispatch_once(&qword_1EB25B7E0, block);
      }
      BOOL v8 = [(UIApplication *)self _handlePressesEvent:v7];
    }
    else
    {
      BOOL v8 = 0;
    }

    goto LABEL_14;
  }
  if (![v6 _gsEvent]) {
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_9;
  }
  uint64_t Type = GSEventGetType();
  uint64_t GSEventRecord = _GSEventGetGSEventRecord();
  if ((*(void *)&self->_applicationFlags & 0x80000000) == 0 && Type != 2000)
  {
    NSLog(&cfstr_Kgseventapplic.isa, Type);
    goto LABEL_13;
  }
  if ((int)Type <= 1099)
  {
    if ((int)Type <= 22)
    {
      if ((Type - 10) < 2 || Type == 12 || Type == 14) {
        [(UIApplication *)self handleKeyEvent:a3];
      }
      goto LABEL_9;
    }
    if ((int)Type > 59)
    {
      if (Type == 60)
      {
        if ((*((void *)&self->_applicationFlags + 1) & 8) == 0)
        {
          CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
          v33 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          [v33 synchronize];
        }
        v34 = (void *)[[NSString alloc] _initWithUTF8String:GSEventRecord + 88 maxLength:*(unsigned int *)(GSEventRecord + 72)];
        [(UIApplication *)self _handleUserDefaultsDidChange:v34];
      }
      else
      {
        if (Type != 1014) {
          goto LABEL_9;
        }
        [(id)UIApp lockDevice:a3];
      }
    }
    else
    {
      if (Type == 23)
      {
        GSEventAccelerometerAxisX();
        float v23 = v22;
        GSEventAccelerometerAxisY();
        float v25 = v24;
        GSEventAccelerometerAxisZ();
        float v27 = v26;
        int v28 = +[UIAccelerometer sharedAccelerometer];
        GSEventGetTimestamp();
        [v28 _acceleratedInX:v23 y:v25 z:v27 timestamp:v29];

        *(float *)&double v30 = v23;
        *(float *)&double v31 = v25;
        *(float *)&double v32 = v27;
        [(id)UIApp acceleratedInX:v30 Y:v31 Z:v32];
        goto LABEL_9;
      }
      if (Type != 50)
      {
LABEL_9:
        BOOL v8 = 1;
        goto LABEL_14;
      }
      [(UIApplication *)self _handleDeviceOrientationChangedEvent:a3];
    }
LABEL_13:
    BOOL v8 = 0;
    goto LABEL_14;
  }
  BOOL v8 = 0;
  switch((int)Type)
  {
    case 2004:
      BSSetMainThreadPriorityFixedForUI();
      *(void *)&self->_applicationFlags &= ~0x100000000uLL;
      [(UIApplication *)self applicationDidEndResumeAnimation];
      int v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 postNotificationName:@"UIApplicationDidEndResumeAnimationNotification" object:self userInfo:0];

      [(UIApplication *)self _updateOrientation];
      goto LABEL_13;
    case 2005:
      byte_1EB25B4DC = 0;
      [(UIApplication *)self _updateHangTracer];
      BSSetMainThreadPriorityFixedForUI();
      *(void *)&self->_applicationFlags |= 0x100000000uLL;
      [(UIApplication *)self applicationDidBeginSuspendAnimation];
      int v14 = (void *)MEMORY[0x1E4F1C9E8];
      int v15 = [NSNumber numberWithInt:GSEventGetSubType()];
      long long v16 = [v14 dictionaryWithObject:v15 forKey:@"Reason"];

      long long v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v17 postNotificationName:@"UIApplicationWillBeginSuspendAnimationNotification" object:self userInfo:v16];

      goto LABEL_13;
    case 2006:
    case 2007:
    case 2008:
    case 2009:
    case 2011:
    case 2012:
    case 2013:
      goto LABEL_9;
    case 2010:
      break;
    case 2014:
      Subuint64_t Type = GSEventGetSubType();
      if (SubType >= 4)
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Received a resign active event with reason %d, which is not supported", GSEventGetSubType() format];
        uint64_t v19 = 0xFFFFFFFFLL;
      }
      else
      {
        uint64_t v19 = dword_186B9BAD0[SubType];
      }
      [(UIApplication *)self _deactivateForReason:v19];
      goto LABEL_13;
    case 2015:
      unsigned int v20 = GSEventGetSubType();
      if (v20 >= 4)
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Received a resume active event with reason %d, which is not supported", GSEventGetSubType() format];
        uint64_t v21 = 0xFFFFFFFFLL;
      }
      else
      {
        uint64_t v21 = dword_186B9BAD0[v20];
      }
      [(UIApplication *)self _stopDeactivatingForReason:v21];
      goto LABEL_13;
    default:
      if (Type == 1100)
      {
        [(id)UIApp vibrateForDuration:MEMORY[0x58]];
      }
      else if (Type == 1103)
      {
        LODWORD(v11) = MEMORY[0x58];
        [(id)UIApp setBacklightLevel:v11];
      }
      goto LABEL_9;
  }
LABEL_14:

  return v8;
}

- (void)checkForUIEventSessionActionAnalytics:(id)a3 forWindow:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(UIApplication *)self isFrontBoard])
  {
    uint64_t v8 = *((void *)&self->_applicationFlags + 1);
    if ((v8 & 0x4000000000) == 0 && (v8 & 0x18000000000) != 0x8000000000)
    {
      if (self->_needToFlushUIEventSessionActionAnalytics)
      {
        uint64_t v9 = +[UIEventSessionActionAnalytics sharedInstance];
        [v9 writeAnalytics];
      }
      self->_needToFlushUIEventSessionActionAnalytics = 0;
      goto LABEL_43;
    }
    self->_needToFlushUIEventSessionActionAnalytics = 1;
  }
  uint64_t v10 = objc_opt_class();
  if (v10 == objc_opt_class() && _UIEventHIDGetDescendantPointerEvent([v6 _hidEvent]))
  {
    double v11 = [v6 allTouches];
    [v11 count];

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v12 = [v6 allTouches];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v65 objects:v71 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v66 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(double **)(*((void *)&v65 + 1) + 8 * i);
          long long v18 = +[UIEventSessionActionAnalytics sharedInstance];
          double v19 = -[UITouch _locationInWindow:](v17, v7);
          double v21 = v20;
          [v7 bounds];
          objc_msgSend(v18, "didPointerHover:withLocationInWindow:withWindowBounds:", v6, v19, v21, v22, v23, v24, v25);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v65 objects:v71 count:16];
      }
      while (v14);
    }
  }
  uint64_t v26 = objc_opt_class();
  if (v26 == objc_opt_class())
  {
    if (_UIEventHIDGetDescendantPointerEvent([v6 _hidEvent]))
    {
      float v27 = [v6 allTouches];
      [v27 count];

      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      int v28 = [v6 allTouches];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v61 objects:v70 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v62;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v62 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(double **)(*((void *)&v61 + 1) + 8 * j);
            if ([v33 phase] == 3)
            {
              v34 = +[UIEventSessionActionAnalytics sharedInstance];
              double v35 = -[UITouch _locationInWindow:](v33, v7);
              double v37 = v36;
              [v7 bounds];
              objc_msgSend(v34, "didPointerClick:withLocationInWindow:withWindowBounds:", v6, v35, v37, v38, v39, v40, v41);
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v61 objects:v70 count:16];
        }
        while (v30);
      }
    }
    else
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      uint64_t v42 = objc_msgSend(v6, "allTouches", 0);
      int v28 = [v42 allObjects];

      uint64_t v43 = [v28 countByEnumeratingWithState:&v57 objects:v69 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v58;
        do
        {
          for (uint64_t k = 0; k != v44; ++k)
          {
            if (*(void *)v58 != v45) {
              objc_enumerationMutation(v28);
            }
            int64_t v47 = *(double **)(*((void *)&v57 + 1) + 8 * k);
            if (![v47 phase]
              || [v47 phase] == 1
              || [v47 phase] == 3
              || [v47 phase] == 4)
            {
              uint64_t v48 = [v6 _trackpadFingerDownCount];
              uint64_t v49 = +[UIEventSessionActionAnalytics sharedInstance];
              double v50 = -[UITouch _locationInWindow:](v47, v7);
              double v52 = v51;
              [v7 bounds];
              objc_msgSend(v49, "didTouch:withLocationInWindow:withWindowBounds:withTrackpadFingerDownCount:", v47, v48, v50, v52, v53, v54, v55, v56);
            }
          }
          uint64_t v44 = [v28 countByEnumeratingWithState:&v57 objects:v69 count:16];
        }
        while (v44);
      }
    }
  }
LABEL_43:
}

- (BOOL)_rotationDisabledDuringTouch
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 9) >> 5) & 1;
}

- (id)_mainEventEnvironment
{
  eventDispatcher = self->_eventDispatcher;
  if (eventDispatcher) {
    return eventDispatcher->_mainEnvironment;
  }
  else {
    return 0;
  }
}

- (void)_registerEstimatedTouches:(id)a3 event:(id)a4 forTouchable:(id)a5
{
}

- (void)_deactivateReachability
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  id v2 = (void (*)(void))getSBSUIAppDeactivateReachabilitySymbolLoc_ptr;
  uint64_t v9 = getSBSUIAppDeactivateReachabilitySymbolLoc_ptr;
  if (!getSBSUIAppDeactivateReachabilitySymbolLoc_ptr)
  {
    uint64_t v3 = SpringBoardServicesLibrary_1();
    v7[3] = (uint64_t)dlsym(v3, "SBSUIAppDeactivateReachability");
    getSBSUIAppDeactivateReachabilitySymbolLoc_ptr = (_UNKNOWN *)v7[3];
    id v2 = (void (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v2)
  {
    v2();
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = [NSString stringWithUTF8String:"void softlink_SBSUIAppDeactivateReachability(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"UIApplication.m", 482, @"%s", dlerror());

    __break(1u);
  }
}

- (BOOL)supportsMultipleScenes
{
  if (qword_1EB25B840 != -1) {
    dispatch_once(&qword_1EB25B840, &__block_literal_global_2277);
  }
  if (!byte_1EB25B503) {
    return 0;
  }
  appInfo = self->_appInfo;
  return [(_UIApplicationInfoParser *)appInfo supportsMultiwindow];
}

- (BOOL)_supportsHomeAffordanceObservation
{
  return 1;
}

- (NSSet)openSessions
{
  return (NSSet *)[(UIApplication *)self _openSessionsIncludingInternal:0];
}

- (void)_windowDidResignApplicationKey:(id)a3
{
  id v4 = [a3 object];
  [(UIApplication *)self _updateSerializableKeyCommandsForResponder:v4];
}

- (void)_immediatelyUpdateSerializableKeyCommandsForResponder:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(UIApplication *)self _shouldUpdateSerializableKeyCommandsForResponder:a3])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = [(UIApplication *)self _responderForKeyEvents];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __71__UIApplication__immediatelyUpdateSerializableKeyCommandsForResponder___block_invoke;
    v26[3] = &unk_1E52F3880;
    id v6 = v4;
    id v27 = v6;
    [v5 _enumerateKeyCommandsInChainWithOptions:36 usingBlock:v26];

    id v7 = [MEMORY[0x1E4F4F2A0] sharedInstance];
    double v21 = [v7 transactionAssertionWithReason:@"Updating UIKeyCommands"];

    [(NSMutableArray *)self->_keyCommandRegistrationAssertions makeObjectsPerformSelector:sel_invalidate];
    [(NSMutableArray *)self->_keyCommandRegistrationAssertions removeAllObjects];
    uint64_t v8 = (void *)MEMORY[0x1E4F4F290];
    uint64_t v9 = +[UIWindow _applicationKeyWindow];
    uint64_t v10 = objc_msgSend(v8, "tokenForIdentifierOfCAContext:", objc_msgSend(v9, "_contextId"));

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v15);
          id v17 = objc_alloc_init(MEMORY[0x1E4F4F380]);
          [v17 setDeferringEnvironment:v16];
          [v17 setDeferringToken:v10];
          long long v18 = [v11 objectForKeyedSubscript:v16];
          [v17 setKeyCommands:v18];

          double v19 = [MEMORY[0x1E4F4F2A0] sharedInstance];
          double v20 = [v19 registerKeyCommands:v17];

          [(NSMutableArray *)self->_keyCommandRegistrationAssertions addObject:v20];
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v13);
    }

    [v21 invalidate];
  }
}

- (BOOL)_shouldUpdateSerializableKeyCommandsForResponder:(id)a3
{
  id v4 = a3;
  id v5 = +[UIDevice currentDevice];
  int v6 = [v5 _isHardwareKeyboardAvailable];

  if (v6)
  {
    if (v4)
    {
      id v7 = [(UIApplication *)self _responderForKeyEvents];
      char v8 = [v4 _containsResponder:v7];
    }
    else
    {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)_keyWindowForScreen:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__UIApplication__keyWindowForScreen___block_invoke;
  aBlock[3] = &unk_1E52E0620;
  id v5 = v4;
  id v19 = v5;
  int v6 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __37__UIApplication__keyWindowForScreen___block_invoke_2;
  v16[3] = &unk_1E52E0620;
  id v7 = v5;
  id v17 = v7;
  char v8 = _Block_copy(v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__UIApplication__keyWindowForScreen___block_invoke_3;
  v14[3] = &unk_1E52E0620;
  id v9 = v7;
  id v15 = v9;
  uint64_t v10 = _Block_copy(v14);
  id v11 = +[UIWindow _externalKeyWindow];
  if ((v6[2](v6, v11) & 1) == 0)
  {
    uint64_t v12 = [(UIApplication *)self keyWindow];

    if (v6[2](v6, v12))
    {
      id v11 = v12;
    }
    else
    {
      id v11 = +[UIWindow _topVisibleWindowPassingTest:v8];

      if (!v11)
      {
        id v11 = +[UIWindow _topVisibleWindowPassingTest:v10];
      }
    }
  }

  return v11;
}

uint64_t __37__UIApplication__keyWindowForScreen___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 screen];
  id v4 = v3;
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    uint64_t v6 = v3 == v5;
  }
  else {
    uint64_t v6 = [v3 _isMainScreen];
  }

  return v6;
}

- (void)_windowDidBecomeApplicationKey:(id)a3
{
  id v4 = [a3 object];
  [(UIApplication *)self _updateSerializableKeyCommandsForResponder:v4];
}

- (BOOL)_hasApplicationCalledLaunchDelegate
{
  return (*((unsigned char *)&self->_applicationFlags + 2) & 0x18) != 0;
}

- (BOOL)_hasNormalRestorationCompleted
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 11) >> 4) & 1;
}

- (int64_t)_safeInterfaceOrientationForWindowIfExists:(id)a3
{
  return [(UIApplication *)self _safeInterfaceOrientationForWindowIfExists:a3 expectNonNilWindow:1];
}

- (BOOL)_systemShellAllowsInteractionTrackingKeyboardFocusUpdateForWindow:(id)a3
{
  if (!+[_UIRemoteKeyboards enabled]
    || ![(id)UIApp isFrontBoard])
  {
    return 1;
  }
  if (qword_1EB25B638 != -1) {
    dispatch_once(&qword_1EB25B638, &__block_literal_global_1295_1);
  }
  return byte_1EB25B4F0 == 0;
}

void __38__UIApplication__defaultSceneIfExists__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 identityToken];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (BOOL)isSuspendedUnderLock
{
  id v2 = +[_UISceneLifecycleMultiplexer sharedInstance];
  char v3 = [v2 suspendedUnderLock];

  return v3;
}

+ (BOOL)isRunningInStoreDemoMode
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (id)textInputMode
{
  id v2 = +[UIKeyboardInputModeController sharedInputModeController];
  BOOL v3 = [v2 currentPublicInputMode];

  return v3;
}

+ (void)_startStatusBarServerIfNecessary
{
  if ([a1 runStatusBarServer])
  {
    +[UIStatusBarServer runServer];
  }
}

- (void)setIdleTimerDisabled:(BOOL)idleTimerDisabled
{
  uint64_t v3 = 0x1000000000;
  if (!idleTimerDisabled) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_unint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFFFFEFFFFFFFFFLL | v3;
  -[UIApplication _setIdleTimerDisabled:forReason:](self, "_setIdleTimerDisabled:forReason:");
}

- (BOOL)handleTestURL:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _pptLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v4;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Received PPT test URL: %@", buf, 0xCu);
  }

  uint64_t v6 = [v4 path];
  id v7 = v6;
  if (v6)
  {
    if ([v6 hasPrefix:@"/"])
    {
      uint64_t v8 = [v7 substringFromIndex:1];
    }
    else
    {
      uint64_t v8 = (uint64_t)v7;
    }
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    double v32 = (void *)v8;
    [v10 setObject:v8 forKey:@"testName"];
    id v11 = [v4 query];
    id v9 = [v11 componentsSeparatedByString:@";"];

    uint64_t v12 = [v9 count];
    if (v12)
    {
      uint64_t v30 = self;
      uint64_t v31 = v7;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      do
      {
        id v15 = v14;
        uint64_t v16 = [v9 objectAtIndex:v13];
        uint64_t v14 = [v16 componentsSeparatedByString:@"!!!"];

        if ([v14 count] == 2)
        {
          id v17 = [v14 objectAtIndex:1];
          long long v18 = [v17 stringByRemovingPercentEncoding];
          id v19 = [v14 objectAtIndex:0];
          double v20 = [v19 stringByRemovingPercentEncoding];
          [v10 setObject:v18 forKey:v20];
        }
        ++v13;
      }
      while (v12 != v13);

      id v7 = v31;
      self = v30;
    }
    double v21 = [v10 objectForKey:@"SampleWithCHUD"];
    byte_1EB2645FA = [v21 isEqualToString:@"YES"];

    long long v22 = [v10 objectForKey:@"CheckForLeaks"];
    byte_1EB2645FB = [v22 isEqualToString:@"YES"];

    long long v23 = [v10 objectForKey:@"TargetsAuxiliaryDisplay"];
    byte_1EB2645F9 = [v23 isEqualToString:@"YES"];

    uint64_t v24 = [v10 objectForKey:@"aggregate"];
    long long v25 = (void *)qword_1EB264618;
    qword_1EB264618 = v24;

    int64_t v26 = [(UIApplication *)self _testOrientation:v32 options:v10];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __53__UIApplication_UIApplicationTesting__handleTestURL___block_invoke;
    v33[3] = &unk_1E52DAF68;
    v33[4] = self;
    id v34 = v32;
    id v35 = v10;
    id v27 = v10;
    id v28 = v32;
    [(UIApplication *)self rotateIfNeeded:v26 completion:v33];
  }
  else
  {
    id v9 = _pptLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v4;
      _os_log_error_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Malformed test URL (no testName): %@", buf, 0xCu);
    }
  }

  return v7 != 0;
}

uint64_t __97__UIApplication_UIApplicationTesting__finishedTest_waitForCommit_extraResults_withTeardownBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:*(void *)(a1 + 40) extraResults:*(void *)(a1 + 48) waitForNotification:0 withTeardownBlock:*(void *)(a1 + 56)];
}

- (id)_systemAnimationFenceCreatingIfNecessary:(BOOL)a3
{
  uint64_t v3 = [(UIApplication *)self _cachedSystemAnimationFenceCreatingIfNecessary:a3];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)_cachedSystemAnimationFenceCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if (pthread_main_np() != 1)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UIApplication.m" lineNumber:2485 description:@"Call must be made on main thread"];
  }
  cachedSystemAnimationFence = self->_cachedSystemAnimationFence;
  if (cachedSystemAnimationFence) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = !v3;
  }
  if (!v7)
  {
    uint64_t v8 = (void *)MEMORY[0x18C108260]();
    id v9 = [(UIApplication *)self _fenceProvider];
    uint64_t v10 = [v9 requestSystemAnimationFence];
    -[UIApplication _setCachedSystemAnimationFence:]((uint64_t)self, v10);

    [(UIApplication *)self _beginFenceTaskIfNecessary];
    cachedSystemAnimationFence = self->_cachedSystemAnimationFence;
  }
  return cachedSystemAnimationFence;
}

- (void)_setCachedSystemAnimationFence:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    if (!v4 || *(void *)(a1 + 320))
    {
      [*(id *)(a1 + 320) invalidate];
      objc_storeStrong((id *)(a1 + 320), a2);
    }
    else
    {
      objc_storeStrong((id *)(a1 + 320), a2);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __48__UIApplication__setCachedSystemAnimationFence___block_invoke;
      v5[3] = &unk_1E52D9CD0;
      v5[4] = a1;
      void v5[5] = sel__setCachedSystemAnimationFence_;
      [MEMORY[0x1E4F39CF8] addCommitHandler:v5 forPhase:2];
    }
  }
}

- (void)_addAfterCACommitBlockForViewController:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)qword_1EB25B5B0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__UIApplication__addAfterCACommitBlockForViewController___block_invoke;
    v6[3] = &unk_1E52D9F70;
    id v7 = v3;
    [v5 enqueuePostCommitBlock:v6];
  }
}

- (int64_t)_sceneInterfaceOrientationFromWindow:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"UIApplication.m", 6843, @"Invalid parameter not satisfying: %@", @"window" object file lineNumber description];
  }
  uint64_t v6 = [v5 _windowHostingScene];
  id v7 = v6;
  if (v6) {
    uint64_t v8 = [v6 _interfaceOrientation];
  }
  else {
    uint64_t v8 = [(UIApplication *)self _defaultSceneInterfaceOrientationReturningUnknownForNilScene:1];
  }
  int64_t v9 = v8;

  return v9;
}

- (int64_t)_safeInterfaceOrientationForWindowIfExists:(id)a3 expectNonNilWindow:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [a3 windowScene];
  if (v6) {
    goto LABEL_7;
  }
  if (!v4
    || (_UIInternalPreferenceUsesDefault(&_UIInternalPreference_RaiseWithNilSceneForInterfaceOrientation, @"RaiseWithNilSceneForInterfaceOrientation", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1E8FD53D4)
  {
    uint64_t v6 = [(UIApplication *)self _findUISceneForLegacyInterfaceOrientation];
    if (!v6) {
      return 1;
    }
LABEL_7:
    int64_t v7 = [v6 _interfaceOrientation];

    return v7;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Asking for the interface orientation without a window scene or window."];
  return 1;
}

- (double)statusBarHeightForOrientation:(int64_t)a3 ignoreHidden:(BOOL)a4
{
  uint64_t v6 = _UIStatusBarManagerForNoWindow();
  int64_t v7 = v6;
  if (a4 || (double v8 = 0.0, ([v6 isStatusBarHidden] & 1) == 0))
  {
    [v7 defaultStatusBarHeightInOrientation:a3];
    double v8 = v9;
  }

  return v8;
}

- (id)_defaultUIWindowHostingUISceneOrMainScreenPlaceholderIfExists
{
  if ([(UIApplication *)self _appAdoptsUISceneLifecycle])
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIApplication.m" lineNumber:10533 description:@"Apps which adopt the UIScene based lifecycle cannot safely infer an interface orientation without a visual context!"];
  }
  BOOL v4 = [(UIApplication *)self _defaultUISceneOrMainScreenPlaceholderIfExists];
  id v5 = v4;
  if (v4 && [v4 _hostsWindows]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (double)statusBarHeightForOrientation:(int64_t)a3
{
  [(UIApplication *)self statusBarHeightForOrientation:a3 ignoreHidden:0];
  return result;
}

- (void)beginIgnoringInteractionEvents
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t applicationFlags = (uint64_t)self->_applicationFlags;
  unsigned int v3 = (applicationFlags >> 25) & 0xF;
  if (v3 == 15)
  {
    BOOL v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B528) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      id v11 = "-[UIApplication beginIgnoringInteractionEvents]";
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "%s overflow. Ignoring.", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = *((void *)&self->_applicationFlags + 1);
    *(void *)&self->_uint64_t applicationFlags = applicationFlags & 0xFFFFFFFFE1FFFFFFLL | (applicationFlags + 0x2000000) & 0x1E000000;
    *((void *)&self->_applicationFlags + 1) = v6;
    int64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B520) + 8);
    if (os_signpost_enabled(v7))
    {
      int v10 = 67109120;
      LODWORD(v11) = v3;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v3 + 49354, "IgnoringInteractionEvents", "level=%u", (uint8_t *)&v10, 8u);
    }
    if (!v3)
    {
      double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 postNotificationName:@"_UIApplicationDidBeginIgnoringInteractionEventsNotification" object:self];

      double v9 = +[UIKeyboardImpl activeInstance];
      [v9 cancelAllKeyEvents];
    }
  }
}

- (void)setIgnoresInteractionEvents:(BOOL)a3
{
  if (a3) {
    [(UIApplication *)self beginIgnoringInteractionEvents];
  }
  else {
    [(UIApplication *)self endIgnoringInteractionEvents];
  }
}

- (void)endIgnoringInteractionEvents
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t applicationFlags = (uint64_t)self->_applicationFlags;
  if ((applicationFlags & 0x1E000000) != 0)
  {
    uint64_t v3 = *((void *)&self->_applicationFlags + 1);
    unsigned int v4 = ((applicationFlags >> 25) - 1) & 0xF;
    *(void *)&self->_uint64_t applicationFlags = applicationFlags & 0xFFFFFFFFE1FFFFFFLL | (v4 << 25);
    *((void *)&self->_applicationFlags + 1) = v3;
    if ((((applicationFlags >> 25) - 1) & 0xF) == 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 postNotificationName:@"_UIApplicationDidEndIgnoringInteractionEventsNotification" object:self];
    }
    int64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B530) + 8);
    if (os_signpost_enabled(v7))
    {
      int v9 = 67109120;
      LODWORD(v10) = v4;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v7, OS_SIGNPOST_INTERVAL_END, v4 + 49354, "IgnoringInteractionEvents", "level=%u", (uint8_t *)&v9, 8u);
    }
  }
  else
  {
    double v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B538) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      int v10 = "-[UIApplication endIgnoringInteractionEvents]";
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "%s called without matching -beginIgnoringInteractionEvents. Ignoring.", (uint8_t *)&v9, 0xCu);
    }
  }
}

+ (id)_stringForBackgroundStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 0;
  }
  else {
    return off_1E5303190[a3];
  }
}

- (BOOL)_shouldHandleTestURL:(id)a3
{
  uint64_t v3 = [a3 scheme];
  unsigned int v4 = v3;
  if (v3 && ![v3 compare:@"test" options:1])
  {
    uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v5 = [v6 BOOLForKey:@"UIHandleTestURLScheme"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (int64_t)interfaceOrientationForString:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([v3 compare:@"UIInterfaceOrientationPortraitUpsideDown" options:1])
    {
      if ([v3 compare:@"UIInterfaceOrientationLandscapeLeft" options:1])
      {
        if ([v3 compare:@"UIInterfaceOrientationLandscapeRight" options:1]) {
          int64_t v4 = 1;
        }
        else {
          int64_t v4 = 3;
        }
      }
      else
      {
        int64_t v4 = 4;
      }
    }
    else
    {
      int64_t v4 = 2;
    }
  }
  else
  {
    int64_t v4 = 1;
  }

  return v4;
}

+ (int64_t)statusBarStyleForString:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([v3 compare:@"UIStatusBarStyleGray" options:1]
      && [v3 compare:@"UIStatusBarStyleDefault" options:1])
    {
      int64_t v4 = 1;
      if ([v3 compare:@"UIStatusBarStyleLightContent" options:1])
      {
        if ([v3 compare:@"UIStatusBarStyleDarkContent" options:1])
        {
          int64_t v4 = 1;
          if ([v3 compare:@"UIStatusBarStyleTransparentBlack" options:1])
          {
            int64_t v4 = 1;
            if ([v3 compare:@"UIStatusBarStyleBlackTranslucent" options:1])
            {
              if ([v3 compare:@"UIStatusBarStyleOpaqueBlack" options:1]
                && [v3 compare:@"UIStatusBarStyleBlackOpaque" options:1])
              {
                if ([v3 compare:@"UIStatusBarStyleBlackOpaqueWithOutCorners" options:1])
                {
                  if ([v3 compare:@"UIStatusBarStyleExternal" options:1])
                  {
                    if ([v3 compare:@"UIStatusBarStyleExternalCompass" options:1]) {
                      int64_t v4 = -1;
                    }
                    else {
                      int64_t v4 = 405;
                    }
                  }
                  else
                  {
                    int64_t v4 = 400;
                  }
                }
                else
                {
                  int64_t v4 = 51;
                }
              }
              else
              {
                int64_t v4 = 2;
              }
            }
          }
        }
        else
        {
          int64_t v4 = 3;
        }
      }
    }
    else
    {
      int64_t v4 = 0;
    }
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

+ (unint64_t)_statusBarStyleOverridesForArray:(id)a3
{
  v21[41] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v20[0] = @"UIStatusBarStyleOverrideInCall";
  v20[1] = @"UIStatusBarStyleOverrideInWorkout";
  v21[0] = &unk_1ED3F5CD0;
  v21[1] = &unk_1ED3F5CE8;
  v20[2] = @"UIStatusBarStyleOverrideRecording";
  v20[3] = @"UIStatusBarStyleOverrideTethering";
  v21[2] = &unk_1ED3F5D00;
  v21[3] = &unk_1ED3F5D18;
  v20[4] = @"UIStatusBarStyleOverrideInVideoConference";
  v20[5] = @"UIStatusBarStyleOverrideScreenSharing";
  v21[4] = &unk_1ED3F5D30;
  v21[5] = &unk_1ED3F5D48;
  v20[6] = @"UIStatusBarStyleOverrideNavigationTeal";
  v20[7] = @"UIStatusBarStyleOverrideNavigationBlue";
  v21[6] = &unk_1ED3F5D60;
  v21[7] = &unk_1ED3F5D78;
  v20[8] = @"UIStatusBarStyleOverrideAssistantEyesFree";
  v20[9] = @"UIStatusBarStyleOverrideVideoOut";
  v21[8] = &unk_1ED3F5D90;
  v21[9] = &unk_1ED3F5DA8;
  v20[10] = @"UIStatusBarStyleOverrideHearingAidRecording";
  v20[11] = @"UIStatusBarStyleOverrideBackgroundLocation";
  v21[10] = &unk_1ED3F5DC0;
  v21[11] = &unk_1ED3F5DD8;
  v20[12] = @"UIStatusBarStyleOverrideNearbyInteractions";
  v20[13] = @"UIStatusBarStyleOverrideCarPlay";
  v21[12] = &unk_1ED3F5DF0;
  v21[13] = &unk_1ED3F5E08;
  v20[14] = @"UIStatusBarStyleOverrideAutoAirPlayReady";
  v20[15] = @"UIStatusBarStyleOverrideAutoAirPlayPlaying";
  v21[14] = &unk_1ED3F5E20;
  v21[15] = &unk_1ED3F5E38;
  v20[16] = @"UIStatusBarStyleOverrideSysdiagnose";
  v20[17] = @"UIStatusBarStyleOverrideScreenSharingServer";
  v21[16] = &unk_1ED3F5E50;
  v21[17] = &unk_1ED3F5E68;
  v20[18] = @"UIStatusBarStyleOverrideScreenReplayRecording";
  v20[19] = @"UIStatusBarStyleOverrideDiagnostics";
  v21[18] = &unk_1ED3F5E80;
  v21[19] = &unk_1ED3F5E98;
  v20[20] = @"UIStatusBarStyleOverrideLoggingCapture";
  v20[21] = @"UIStatusBarStyleOverrideSOS";
  v21[20] = &unk_1ED3F5EB0;
  v21[21] = &unk_1ED3F5EC8;
  v20[22] = @"UIStatusBarStyleOverrideDeveloperTools";
  v20[23] = @"UIStatusBarStyleOverrideAirPrint";
  v21[22] = &unk_1ED3F5EE0;
  v21[23] = &unk_1ED3F5EF8;
  v20[24] = @"UIStatusBarStyleOverrideWebRTCCapture";
  v20[25] = @"UIStatusBarStyleOverrideWebRTCAudioCapture";
  v21[24] = &unk_1ED3F5F10;
  v21[25] = &unk_1ED3F5F28;
  v20[26] = @"UIStatusBarStyleOverrideFullScreenWebRTCCapture";
  v20[27] = @"UIStatusBarStyleOverrideFullScreenWebRTCAudioCapture";
  v21[26] = &unk_1ED3F5F40;
  v21[27] = &unk_1ED3F5F58;
  v20[28] = @"UIStatusBarStyleOverrideCallRinging";
  v20[29] = @"UIStatusBarStyleOverrideVideoConferenceRinging";
  v21[28] = &unk_1ED3F5F70;
  v21[29] = &unk_1ED3F5F88;
  v20[30] = @"UIStatusBarStyleOverrideStewie";
  v20[31] = @"UIStatusBarStyleOverrideStewieDisconnected";
  v21[30] = &unk_1ED3F5FA0;
  v21[31] = &unk_1ED3F5FB8;
  v20[32] = @"UIStatusBarStyleOverrideSharePlay";
  v20[33] = @"UIStatusBarStyleOverrideSharePlayScreenSharing";
  v21[32] = &unk_1ED3F5FD0;
  v21[33] = &unk_1ED3F5FE8;
  v20[34] = @"UIStatusBarStyleOverrideSharePlayInactive";
  v20[35] = @"UIStatusBarStyleOverridePlaygrounds";
  v21[34] = &unk_1ED3F6000;
  v21[35] = &unk_1ED3F6018;
  v20[36] = @"UIStatusBarStyleOverrideActivePushToTalkCall";
  v20[37] = @"UIStatusBarStyleOverrideIdlePushToTalkCall";
  v21[36] = &unk_1ED3F6030;
  v21[37] = &unk_1ED3F6048;
  v20[38] = @"UIStatusBarStyleOverrideCallHandoff";
  v20[39] = @"UIStatusBarStyleOverrideVideoConferenceHandoff";
  v21[38] = &unk_1ED3F6060;
  v21[39] = &unk_1ED3F6078;
  v20[40] = @"UIStatusBarStyleOverridesAll";
  v21[40] = &unk_1ED3F6090;
  int64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:41];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      unint64_t v8 = 0;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = objc_msgSend(v4, "objectForKey:", v11, (void)v15);
            if (v12)
            {
              uint64_t v13 = v12;
              v8 |= [v12 unsignedIntegerValue];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

+ (int64_t)_backgroundStyleForString:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v4 = 1;
    if ([v3 compare:@"UIBackgroundStyleTransparent" options:1])
    {
      if ([v3 compare:@"UIBackgroundStyleUltraLightBlur" options:1])
      {
        if ([v3 compare:@"UIBackgroundStyleLightBlur" options:1])
        {
          if ([v3 compare:@"UIBackgroundStyleMediumBlur" options:1])
          {
            if ([v3 compare:@"UIBackgroundStyleDarkBlur" options:1])
            {
              if ([v3 compare:@"UIBackgroundStyleDarkTranslucent" options:1]) {
                int64_t v4 = 0;
              }
              else {
                int64_t v4 = 5;
              }
            }
            else
            {
              int64_t v4 = 4;
            }
          }
          else
          {
            int64_t v4 = 6;
          }
        }
        else
        {
          int64_t v4 = 3;
        }
      }
      else
      {
        int64_t v4 = 2;
      }
    }
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

uint64_t __86__UIApplication_SessionAndConfigurationInternal___openSessionForPersistentIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 persistentIdentifier];
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  *a3 = v6;
  return v6;
}

- (BOOL)launchedToTest
{
  return __IsRunningTests;
}

- (unint64_t)_beginBackgroundTaskWithName:(id)a3 expirationHandler:(id)a4
{
  return _UIApplicationBeginBackgroundTaskWithExpirationHandler(a4, a3);
}

- (void)_appendSessionToSessionSet:(id)a3 save:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4) {
    +[_UICanvasUserActivityManager _updatePersistedSceneSession:v5];
  }
  if (qword_1EB25BA00 != -1) {
    dispatch_once(&qword_1EB25BA00, &__block_literal_global_4054);
  }
  objc_msgSend((id)qword_1EB25B9F8, "addObject:");
}

- (void)activityContinuationManager:(id)a3 didUpdateUserActivity:(id)a4
{
  id v5 = a4;
  if (objc_opt_respondsToSelector()) {
    [(UIApplicationDelegate *)self->_delegate application:self didUpdateUserActivity:v5];
  }
}

- (void)_addResponder:(id)a3 forUserActivity:(id)a4
{
}

- (id)_getActivityContinuationManager
{
  return self->_activityContinuationManager;
}

- (BOOL)_shouldOptOutOfRTL
{
  return self->optOutOfRTL;
}

- (void)_reportMainSceneUpdateFinished:(id)a3
{
  id v5 = a3;
  [(UIStatusBar *)self->_statusBar forceUpdateDoubleHeightStatus];
  [(UIApplication *)self _reportMainSceneUpdateFinishedPossiblyDeferredPortions];
  BOOL v4 = v5;
  if (v5)
  {
    [(id)qword_1EB25B598 enqueuePostSynchronizeResponse:v5];
    BOOL v4 = v5;
  }
}

- (void)emitPPTEndTracePointForTestName:(id)a3 identifier:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = _pptLogHandle();
  uint64_t v7 = _pptLogHandle();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v6, OS_SIGNPOST_INTERVAL_END, v8, "MainTest", "", v12, 2u);
  }

  id v9 = v5;
  size_t v10 = strlen((const char *)[v9 UTF8String]);
  Buffer = createBuffer(v9, 12 * ((v10 + 11) / 0xC));
  [v9 length];

  kdebug_trace();
  free(Buffer);
}

- (void)finishedSubTest:(id)a3 forTest:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [(UIApplication *)self subTest:v6 ForTest:a4 withMetrics:0];
    if (v7)
    {
      os_signpost_id_t v8 = [(UIApplication *)self _currentFrameCountForTestDisplay];
      [v7 stopWithFrameCount:v8];

      v12[0] = @"pptSubTestTracepointIdentifier";
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      size_t v10 = [v7 getObjectForKey:v9];
      uint64_t v11 = [v10 unsignedLongValue];

      [(UIApplication *)self emitPPTEndTracePointForSubTestName:v6 identifier:v11];
    }
  }
}

- (void)startedSubTest:(id)a3 forTest:(id)a4 withMetrics:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    size_t v10 = [(UIApplication *)self subTest:v8 ForTest:v9 withMetrics:a5];
    if (v10)
    {
      uint64_t v11 = [(UIApplication *)self _currentFrameCountForTestDisplay];
      [v10 startWithFrameCount:v11];

      uint64_t v12 = NSString;
      uint64_t v13 = [v10 startTime];
      uint64_t v14 = [v12 stringWithFormat:@"%@:%@:%@", v9, v8, v13];
      uint64_t v15 = [v14 hash];

      long long v16 = [NSNumber numberWithUnsignedInteger:v15];
      v21[0] = @"pptSubTestTracepointIdentifier";
      long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      [v10 setObject:v16 forKey:v17];

      long long v18 = [(id)qword_1EB264600 objectForKey:v9];
      id v19 = [v18 objectForKey:@"pptTestTracepointIdentifier"];
      uint64_t v20 = [v19 unsignedLongValue];

      if (!v20) {
        uint64_t v20 = [v9 hash];
      }
      [(UIApplication *)self emitPPTStartTracePointForSubTestName:v8 identifier:v15 testIdentifier:v20];
    }
  }
}

- (id)subTest:(id)a3 ForTest:(id)a4 withMetrics:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (a4)
  {
    id v9 = [(id)qword_1EB264600 objectForKey:a4];
    size_t v10 = [v9 objectForKey:@"SubTests"];

    if (v10)
    {
      uint64_t v11 = [v10 objectForKey:v7];
      if (!v11)
      {
        uint64_t v11 = [[UISubTest alloc] initWithName:v7 metrics:v8];
        [v10 setObject:v11 forKey:v7];
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v12 = _pptLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_error_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Cannot get subtest for a nil testName. (subTestName: %@)", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_currentFrameCountForTestDisplay
{
  if (byte_1EB2645F9
    && (+[UIScreen _screens](),
        id v2 = objc_claimAutoreleasedReturnValue(),
        unint64_t v3 = [v2 count],
        v2,
        v3 >= 2))
  {
    BOOL v4 = NSNumber;
    unsigned int DirtyFrameCountByIndex = CARenderServerGetDirtyFrameCountByIndex();
  }
  else
  {
    BOOL v4 = NSNumber;
    unsigned int DirtyFrameCountByIndex = CARenderServerGetDirtyFrameCount();
  }
  id v6 = [v4 numberWithUnsignedLong:DirtyFrameCountByIndex];
  return v6;
}

- (void)emitPPTEndTracePointForSubTestName:(id)a3 identifier:(unint64_t)a4
{
  id v5 = _pptLogHandle();
  id v6 = _pptLogHandle();
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v5, OS_SIGNPOST_INTERVAL_END, v7, "SubTest", "", v8, 2u);
  }

  kdebug_trace();
}

- (void)emitPPTStartTracePointForSubTestName:(id)a3 identifier:(unint64_t)a4 testIdentifier:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_signpost_id_t v7 = _pptLogHandle();
  id v8 = _pptLogHandle();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 138543362;
    id v18 = v6;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SubTest", "%{public, name=subTestName}@  isAnimation=YES ", (uint8_t *)&v17, 0xCu);
  }

  id v10 = v6;
  size_t v11 = strlen((const char *)[v10 UTF8String]);
  unint64_t v12 = 3 * ((v11 + 11) / 0xC);
  size_t v13 = 12 * ((v11 + 11) / 0xC);
  Buffer = createBuffer(v10, v13);
  [v10 length];
  kdebug_trace();
  if (v13 >= 4)
  {
    unint64_t v15 = 0;
    unint64_t v16 = v12 & 0x3FFFFFFFFFFFFFFFLL;
    do
    {
      kdebug_trace();
      v15 += 3;
    }
    while (v15 < v16);
  }
  else if (!Buffer)
  {
    goto LABEL_10;
  }
  free(Buffer);
LABEL_10:
}

- (void)stopAndReportResultsForTest:(id)a3 extraResults:(id)a4 waitForNotification:(id)a5 withTeardownBlock:(id)a6
{
  uint64_t v169 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v144 = a5;
  v146 = (void (**)(void))a6;
  v143 = v10;
  if (v10) {
    id v11 = (id)[v10 mutableCopy];
  }
  else {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  unint64_t v12 = v11;
  size_t v13 = [(id)qword_1EB264600 objectForKey:v9];
  int v14 = v13;
  if (v13)
  {
    unint64_t v15 = [v13 objectForKey:@"pptTestTracepointIdentifier"];
    uint64_t v16 = [v15 unsignedLongValue];

    if (!v16) {
      uint64_t v16 = [v9 hash];
    }
    BOOL v17 = [(UIApplication *)self isLaunchTest:v9];
    [v9 rangeOfString:@"resume"];
    if (v18) {
      int v19 = 1;
    }
    else {
      int v19 = v17;
    }
    int v134 = v19;
    [v9 rangeOfString:@"quit"];
    uint64_t v137 = v20;
    double v21 = [(UIApplication *)self _extendLaunchTest];
    if (v21) {
      BOOL v22 = v17;
    }
    else {
      BOOL v22 = 0;
    }

    if ([(id)qword_1EB264608 containsObject:v9])
    {
      [(UIApplication *)self finishedSubTest:@"duration" forTest:v9];
      [(id)qword_1EB264608 removeObject:v9];
    }
    [(UIApplication *)self emitPPTEndTracePointForTestName:v9 identifier:v16];
    long long v23 = [NSNumber numberWithUnsignedInteger:v16];
    [v12 setObject:v23 forKey:@"pptTestTracepointIdentifier"];

    uint64_t v24 = @"endTimeIntervalSinceReferenceDate";
    if (v17) {
      uint64_t v24 = @"launchTimeIntervalSinceReferenceDate";
    }
    v139 = v24;
    v142 = objc_msgSend(v14, "objectForKey:");
    v141 = [v14 objectForKey:@"startTimeIntervalSinceReferenceDate"];
    v140 = [v14 objectForKey:@"extendedLaunchTimeIntervalSinceReferenceDate"];
    [v141 doubleValue];
    double v26 = v25;
    [v142 doubleValue];
    if (v27 == 0.0) {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    }
    else {
      [v142 doubleValue];
    }
    double v30 = v28;
    [v140 doubleValue];
    double v32 = v31;
    v33 = [v14 objectForKey:@"execOrResumeTimeIntervalSinceReferenceDate"];
    v145 = v33;
    if (v33)
    {
      [v33 doubleValue];
      double v35 = v34;
    }
    else
    {
      double v35 = 0.0;
    }
    memset(&stats, 0, sizeof(stats));
    malloc_zone_statistics(0, &stats);
    uint64_t blocks_in_use = (int)stats.blocks_in_use;
    int size_in_use = stats.size_in_use;
    if (byte_1EB2645FA) {
      [(UIApplication *)self stopCHUDRecording];
    }
    if (v9) {
      [v12 setObject:v9 forKey:@"testName"];
    }
    double v37 = v30 - v26;
    uint64_t v38 = _pptLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      stats.uint64_t blocks_in_use = 138413058;
      *(void *)(&stats.blocks_in_use + 1) = v9;
      WORD2(stats.size_in_use) = 2048;
      *(double *)((char *)&stats.size_in_use + 6) = v26;
      HIWORD(stats.max_size_in_use) = 2048;
      *(double *)&stats.int size_allocated = v30;
      *(_WORD *)v158 = 2048;
      *(double *)&v158[2] = v30 - v26;
      _os_log_impl(&dword_1853B0000, v38, OS_LOG_TYPE_DEFAULT, "PPT finishedTest: %@ (start: %f, end: %f, delta: %f)", (uint8_t *)&stats, 0x2Au);
    }

    if (v37 == 0.0)
    {
      double v39 = [NSNumber numberWithBool:1];
      [v12 setObject:v39 forKey:@"failed"];

      [(UIApplication *)self _reportResults:v12];
    }
    else
    {
      double v40 = [NSNumber numberWithInt:getpid()];
      [v12 setObject:v40 forKey:@"pid"];

      double v41 = [v12 objectForKey:@"time"];
      BOOL v42 = v41 == 0;

      if (v42)
      {
        uint64_t v43 = [NSNumber numberWithDouble:v30 - v26];
        [v12 setObject:v43 forKey:@"time"];
      }
      if (v22)
      {
        uint64_t v44 = [v12 objectForKey:@"extendedLaunchTime"];
        BOOL v45 = v44 == 0;

        double v46 = v32 - v26;
        if (v45)
        {
          int64_t v47 = [NSNumber numberWithDouble:v46];
          [v12 setObject:v47 forKey:@"extendedLaunchTime"];
        }
        uint64_t v48 = [(UIApplication *)self _extendLaunchTest];
        uint64_t v49 = [v12 objectForKey:v48];
        BOOL v50 = v49 == 0;

        if (v50)
        {
          double v51 = [NSNumber numberWithDouble:v46 - v37];
          double v52 = [(UIApplication *)self _extendLaunchTest];
          [v12 setObject:v51 forKey:v52];
        }
      }
      if (v145)
      {
        double v53 = [NSNumber numberWithDouble:v30 - v35];
        [v12 setObject:v53 forKey:@"execOrResumeTime"];
      }
      if (qword_1EB264618)
      {
        [v12 setObject:qword_1EB264618 forKey:@"aggregate"];
        double v54 = (void *)qword_1EB264618;
        qword_1EB264618 = 0;
      }
      BOOL v131 = v137 != 0;
      double v55 = [v14 objectForKey:@"heapBytes"];
      int v56 = [v55 intValue];

      long long v57 = [NSNumber numberWithLong:size_in_use - v56];
      [v12 setObject:v57 forKey:@"heapBytesDelta"];

      [v12 setObject:@"bytes" forKey:@"heapBytesDeltaUnits"];
      long long v58 = [v14 objectForKey:@"heapNodes"];
      int v59 = [v58 intValue];

      long long v60 = [NSNumber numberWithLong:blocks_in_use - v59];
      [v12 setObject:v60 forKey:@"heapNodesDelta"];

      [v12 setObject:@"nodes" forKey:@"heapNodesDeltaUnits"];
      uint64_t v61 = CAGetCurrentImageBytes();
      long long v62 = [v14 objectForKey:@"imageBytes"];
      unsigned int v63 = [v62 unsignedIntValue];

      uint64_t v64 = CAGetMaximumImageBytes();
      long long v65 = [NSNumber numberWithUnsignedLong:v61 - v63];
      [v12 setObject:v65 forKey:@"imageBytesDelta"];

      [v12 setObject:@"bytes" forKey:@"imageBytesDeltaUnits"];
      long long v66 = [NSNumber numberWithUnsignedLong:v64];
      [v12 setObject:v66 forKey:@"maxImageBytes"];

      [v12 setObject:@"bytes" forKey:@"maxImageBytesUnits"];
      uint64_t v154 = 0;
      memset(v153, 0, sizeof(v153));
      long long v67 = [v14 objectForKey:@"startStats"];
      [v67 getBytes:v153 length:88];

      if (v17) {
        long long v68 = 0;
      }
      else {
        long long v68 = (int32x4_t *)v153;
      }
      GetProcStatistics((uint64_t)&stats, v68);
      signed int v132 = stats.blocks_in_use;
      int v130 = *(&stats.blocks_in_use + 1);
      int v129 = stats.size_in_use;
      int size_in_use_high = HIDWORD(stats.size_in_use);
      max_int size_in_use = stats.max_size_in_use;
      int max_size_in_use_high = HIDWORD(stats.max_size_in_use);
      int size_allocated = stats.size_allocated;
      int size_allocated_high = HIDWORD(stats.size_allocated);
      long long v69 = *(_OWORD *)&v158[4];
      int v70 = v159;
      int v71 = v160;
      int v72 = v161;
      int v138 = v162;
      int v73 = v163;
      int v74 = v164;
      int v133 = v165;
      int v136 = v166;
      uint64_t v75 = [NSNumber numberWithUnsignedLong:*(void *)&v158[4]];
      [v12 setObject:v75 forKey:@"virtualSize"];

      [v12 setObject:@"bytes" forKey:@"virtualSizeUnits"];
      v76 = [NSNumber numberWithUnsignedLong:*((void *)&v69 + 1)];
      [v12 setObject:v76 forKey:@"maximumRSS"];

      [v12 setObject:@"bytes" forKey:@"maximumRSSUnits"];
      v77 = [NSNumber numberWithDouble:(double)v71 / 1000.0 + (double)(1000 * v70)];
      [v12 setObject:v77 forKey:@"userCpuSeconds"];

      [v12 setObject:@"ms" forKey:@"userCpuSecondsUnits"];
      v78 = [NSNumber numberWithDouble:(double)v74 / 1000.0 + (double)(1000 * v73)];
      [v12 setObject:v78 forKey:@"userCpuSecondsMainThread"];

      [v12 setObject:@"ms" forKey:@"userCpuSecondsMainThreadUnits"];
      v79 = [NSNumber numberWithDouble:(double)v138 / 1000.0 + (double)(1000 * v72)];
      [v12 setObject:v79 forKey:@"systemCpuSeconds"];

      [v12 setObject:@"ms" forKey:@"systemCpuSecondsUnits"];
      v80 = [NSNumber numberWithDouble:(double)v136 / 1000.0 + (double)(1000 * v133)];
      [v12 setObject:v80 forKey:@"systemCpuSecondsMainThread"];

      [v12 setObject:@"ms" forKey:@"systemCpuSecondsMainThreadUnits"];
      v81 = [NSNumber numberWithUnsignedLong:v132];
      [v12 setObject:v81 forKey:@"pageFaults"];

      [v12 setObject:@"pages" forKey:@"pageFaultsUnits"];
      v82 = [NSNumber numberWithUnsignedLong:v130];
      [v12 setObject:v82 forKey:@"pageIns"];

      [v12 setObject:@"pages" forKey:@"pageInsUnits"];
      v83 = [NSNumber numberWithUnsignedLong:v129];
      [v12 setObject:v83 forKey:@"cowFaults"];

      [v12 setObject:@"pages" forKey:@"cowFaultsUnits"];
      v84 = [NSNumber numberWithUnsignedLong:size_in_use_high];
      [v12 setObject:v84 forKey:@"machMessagesSent"];

      [v12 setObject:@"messages" forKey:@"machMessagesSentUnits"];
      v85 = [NSNumber numberWithUnsignedLong:max_size_in_use];
      [v12 setObject:v85 forKey:@"machMessagesReceived"];

      [v12 setObject:@"messages" forKey:@"machMessagesReceivedUnits"];
      v86 = [NSNumber numberWithUnsignedLong:max_size_in_use_high];
      [v12 setObject:v86 forKey:@"machSystemCalls"];

      [v12 setObject:@"syscalls" forKey:@"machSystemCallsUnits"];
      v87 = [NSNumber numberWithUnsignedLong:size_allocated];
      [v12 setObject:v87 forKey:@"bsdSystemCalls"];

      [v12 setObject:@"syscalls" forKey:@"bsdSystemCallsUnits"];
      v88 = [NSNumber numberWithUnsignedLong:size_allocated_high];
      [v12 setObject:v88 forKey:@"contextSwitches"];

      [v12 setObject:@"csw" forKey:@"contextSwitchesUnits"];
      [v12 removeObjectForKey:@"startStats"];
      if (((v134 | v131) & 1) == 0)
      {
        v89 = [(UIApplication *)self _currentFrameCountForTestDisplay];
        int v90 = [v89 intValue];
        v91 = [v14 objectForKey:@"startingFrameCount"];
        int v92 = [v91 intValue];

        if (v37 > 0.1)
        {
          int v93 = v90 - v92;
          if (v90 - v92 >= 1)
          {
            double v94 = (double)v93;
            double v95 = (double)v93 / v37;
            *(float *)&double v95 = v95;
            v96 = [NSNumber numberWithFloat:v95];
            [v12 setObject:v96 forKey:@"fps"];

            [v12 setObject:@"fps" forKey:@"fpsUnits"];
            double v97 = v37 * 1000.0 / v94;
            *(float *)&double v97 = v97;
            v98 = [NSNumber numberWithFloat:v97];
            [v12 setObject:v98 forKey:@"mspf"];

            [v12 setObject:@"mspf" forKey:@"mspfUnits"];
          }
        }
        v99 = [v14 objectForKey:@"SubTests"];
        if (v99)
        {
          v151[0] = MEMORY[0x1E4F143A8];
          v151[1] = 3221225472;
          v151[2] = __118__UIApplication_UIApplicationTesting__stopAndReportResultsForTest_extraResults_waitForNotification_withTeardownBlock___block_invoke;
          v151[3] = &unk_1E53096B8;
          id v152 = v12;
          [v99 enumerateKeysAndObjectsUsingBlock:v151];
        }
      }
      if (byte_1EB2645FB)
      {
        id v100 = v9;
        uint64_t __buf = 0;
        int v155 = 0;
        pipe(v167);
        pid_t v101 = fork();
        if (!v101)
        {
          uint64_t v108 = getppid();
          close(v167[0]);
          v109 = [MEMORY[0x1E4F1CA58] data];
          snprintf(__str, 0x50uLL, "leaks %d 2>/dev/null", v108);
          v110 = popen(__str, "r");
          if (!v110)
          {
            write(v167[1], &__buf, 4uLL);
            write(v167[1], (char *)&__buf + 4, 4uLL);
            _exit(1);
          }
          size_t v111 = fread(&stats, 1uLL, 0x200uLL, v110);
          if (v111)
          {
            size_t v112 = v111;
            do
            {
              [v109 appendBytes:&stats length:v112];
              size_t v112 = fread(&stats, 1uLL, 0x200uLL, v110);
            }
            while (v112);
          }
          pclose(v110);
          v113 = (void *)[[NSString alloc] initWithData:v109 encoding:1];
          v114 = [v113 componentsSeparatedByString:@"\n"];
          v115 = v114;
          if (v114 && [v114 count] && (objc_msgSend(v115, "count") & 0xFFFFFFFELL) != 0)
          {
            v119 = [v115 objectAtIndex:1];
            v120 = [v119 componentsSeparatedByString:@" "];

            v121 = [v120 objectAtIndex:2];
            LODWORD(__buf) = [v121 intValue];

            v122 = [v120 objectAtIndex:5];
            HIDWORD(__buf) = [v122 intValue];
          }
          v116 = [MEMORY[0x1E4F28B50] mainBundle];
          v117 = [v116 executablePath];
          uint64_t v118 = [v117 lastPathComponent];

          if (__buf)
          {
            v123 = [NSString stringWithFormat:@"/tmp/%@.%d.%@leaks.txt", v118, v108, v100];
            if ([v113 writeToFile:v123 atomically:1 encoding:4 error:0]) {
              NSLog(&cfstr_LeaksDataWrite.isa, v123);
            }
            else {
              NSLog(&cfstr_CouldnTWriteLe.isa, v123);
            }
          }
          else
          {
            NSLog(&cfstr_NoLeaksFoundFo.isa, v118);
          }
          write(v167[1], &__buf, 4uLL);
          write(v167[1], (char *)&__buf + 4, 4uLL);
          _exit(0);
        }
        close(v167[1]);
        read(v167[0], &__buf, 4uLL);
        read(v167[0], (char *)&__buf + 4, 4uLL);
        close(v167[0]);
        waitpid(v101, &v155, 0);

        uint64_t v102 = HIDWORD(__buf);
        v103 = [NSNumber numberWithUnsignedInt:__buf];
        [v12 setObject:v103 forKey:@"totalLeaks"];

        [v12 setObject:@"nodes" forKey:@"totalLeaksUnits"];
        v104 = [NSNumber numberWithUnsignedInt:v102];
        [v12 setObject:v104 forKey:@"totalLeakedBytes"];

        [v12 setObject:@"bytes" forKey:@"totalLeakedBytesUnits"];
      }
      if (v9) {
        [(id)qword_1EB264600 removeObjectForKey:v9];
      }
      if (v146) {
        v146[2]();
      }
      if (qword_1EB264610 || [v9 isEqualToString:@"launch suspended"])
      {
        [(UIApplication *)self _reportResults:v12];
      }
      else if (v144)
      {
        *(void *)&stats.uint64_t blocks_in_use = 0;
        stats.int size_in_use = (size_t)&stats;
        stats.max_int size_in_use = 0x3032000000;
        stats.int size_allocated = (size_t)__Block_byref_object_copy__199;
        *(void *)v158 = __Block_byref_object_dispose__199;
        *(void *)&v158[8] = 0;
        v105 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v148[0] = MEMORY[0x1E4F143A8];
        v148[1] = 3221225472;
        v148[2] = __118__UIApplication_UIApplicationTesting__stopAndReportResultsForTest_extraResults_waitForNotification_withTeardownBlock___block_invoke_392;
        v148[3] = &unk_1E53096E0;
        v148[4] = self;
        id v149 = v12;
        p_malloc_statistics_t stats = &stats;
        uint64_t v106 = [v105 addObserverForName:v144 object:0 queue:0 usingBlock:v148];
        v107 = *(void **)(stats.size_in_use + 40);
        *(void *)(stats.size_in_use + 40) = v106;

        _Block_object_dispose(&stats, 8);
      }
      else
      {
        [(UIApplication *)self performSelector:sel__reportResults_ withObject:v12 afterDelay:0.0];
      }
    }
  }
  else
  {
    uint64_t v29 = [NSNumber numberWithBool:1];
    [v12 setObject:v29 forKey:@"failed"];

    [(UIApplication *)self _reportResults:v12];
  }
}

- (void)finishedTest:(id)a3 extraResults:(id)a4 waitForNotification:(id)a5 withTeardownBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = [(UIApplication *)self isLaunchTest:v10];
  unint64_t v15 = [(UIApplication *)self _extendLaunchTest];

  if (v14)
  {
    if (v15)
    {
      __extendedLaunchTestIsMarkedAsFinished = 1;
      if (!__basicLaunchTestIsMarkedAsFinished) {
        goto LABEL_29;
      }
    }
  }
  if (__IsRunningTests
    || (*((unsigned char *)&self->_applicationFlags + 4) & 2) == 0
    && ([(UIApplication *)self _extendLaunchTest],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        !v18))
  {
LABEL_5:
    if ((*((unsigned char *)&self->_applicationFlags + 4) & 2) != 0
      || ([(UIApplication *)self _extendLaunchTest],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          v16))
    {
      if (*(double *)&__ExecOrResumeTime == 0.0)
      {
        if (os_variant_has_internal_content())
        {
          double v35 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB264678) + 8);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            double v36 = "Unable to track resume time or/and signal end of extended launch as __ExecOrResumeTime is 0";
            goto LABEL_52;
          }
        }
      }
      else
      {
        if (__wasResumed)
        {
          BOOL v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("AppLifecycle", &qword_1EB264668) + 8);
          if (os_signpost_enabled(v17))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1853B0000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AppResume", " enableTelemetry=YES ", buf, 2u);
          }
          goto LABEL_19;
        }
        if (v10 && [(UIApplication *)self isRunningTest]) {
          int v28 = [v10 isEqualToString:@"launch"];
        }
        else {
          int v28 = 1;
        }
        if (*(double *)&__LaunchTime != 0.0)
        {
          if (v28)
          {
            double v34 = [(UIApplication *)self _extendLaunchTest];

            if (v34)
            {
              [(UIApplication *)self startedSubTest:@"extended-launch-responsive" forTest:v10];
              id v44 = v10;
              alm_app_extended_launch_end_with_details();
            }
            alm_legacy_app_regular_or_extended_launch_end();
          }
          goto LABEL_19;
        }
        if (v28)
        {
          if (os_variant_has_internal_content())
          {
            double v35 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB264670) + 8);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              double v36 = "Unable to signal end of extended launch as __LaunchTime is 0";
LABEL_52:
              _os_log_impl(&dword_1853B0000, v35, OS_LOG_TYPE_ERROR, v36, buf, 2u);
            }
          }
        }
      }
    }
LABEL_19:
    if (v10 && [(UIApplication *)self isRunningTest])
    {
      if (v14)
      {
        BOOL v22 = [(UIApplication *)self _extendLaunchTest];

        if (v22)
        {
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          double v24 = v23;
          double v25 = [(UIApplication *)self _extendLaunchTest];
          [(UIApplication *)self finishedSubTest:v25 forTest:v10];

          double v26 = [(id)qword_1EB264600 objectForKey:v10];
          double v27 = [NSNumber numberWithDouble:v24];
          [v26 setObject:v27 forKey:@"extendedLaunchTimeIntervalSinceReferenceDate"];
        }
        id v40 = v10;
        id v41 = v11;
        id v42 = v12;
        id v43 = v13;
        alm_execute_when_measurement_complete();
      }
      else
      {
        [(UIApplication *)self stopAndReportResultsForTest:v10 extraResults:v11 waitForNotification:v12 withTeardownBlock:v13];
      }
    }
    goto LABEL_29;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  if (*(double *)&__LaunchTime == 0.0)
  {
    if (os_variant_has_internal_content())
    {
      uint64_t v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB264658) + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        double v21 = "Unable to track launch/resume time as __LaunchTime is 0";
LABEL_17:
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
        goto LABEL_29;
      }
    }
    goto LABEL_29;
  }
  double v29 = v19 - *(double *)&__LaunchTime;
  if (__wasResumed)
  {
    double v30 = NSString;
    double v31 = +[UIApplication displayIdentifier];
    [v30 stringWithFormat:@"appResumeTime.%@", v31];
    double v32 = LABEL_32:;

    ADClientPushValueForDistributionKey();
    v33 = [NSString stringWithFormat:@"%@.%3.1f", v32, *(void *)&v29];

    ADClientAddValueForScalarKey();
    goto LABEL_5;
  }
  if (![(id)UIApp applicationState])
  {
    uint64_t v38 = NSString;
    double v31 = +[UIApplication displayIdentifier];
    [v38 stringWithFormat:@"appLaunchTime.%@", v31];
    goto LABEL_32;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  if (*(double *)&__ExecOrResumeTime != 0.0)
  {
    double v29 = v37 - *(double *)&__ExecOrResumeTime;
    double v39 = NSString;
    double v31 = +[UIApplication displayIdentifier];
    [v39 stringWithFormat:@"appLaunchSuspendedTime.%@", v31];
    goto LABEL_32;
  }
  if (os_variant_has_internal_content())
  {
    uint64_t v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB264660) + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      double v21 = "Unable to track suspended time as __ExecOrResumeTime is 0";
      goto LABEL_17;
    }
  }
LABEL_29:
}

- (BOOL)isRunningTest
{
  return [(id)qword_1EB264600 count] != 0;
}

- (id)_extendLaunchTest
{
  return 0;
}

- (void)startedTest:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = _pptLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      buf.uint64_t blocks_in_use = 138412290;
      *(void *)(&buf.blocks_in_use + 1) = v4;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "PPT startedTest: %@", (uint8_t *)&buf, 0xCu);
    }

    BOOL v6 = [(UIApplication *)self isLaunchTest:v4];
    [v4 rangeOfString:@"resume"];
    BOOL v8 = v7 != 0;
    [v4 rangeOfString:@"quit"];
    uint64_t v10 = v9;
    if (!qword_1EB264600)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v12 = (void *)qword_1EB264600;
      qword_1EB264600 = (uint64_t)v11;
    }
    if (byte_1EB2645FA) {
      [(UIApplication *)self startCHUDRecording:v4];
    }
    id v13 = [(id)qword_1EB264600 objectForKey:v4];

    if (v13)
    {
      BOOL v14 = [NSString stringWithFormat:@"Requested to start an already started test: %@", v4];
      unint64_t v15 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      int v16 = [v15 BOOLForKey:@"UIApplicationTestStartIsStrict"];

      if (v16) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@", v14 format];
      }
      else {
        NSLog(&stru_1ED0F89C0.isa, v14);
      }
    }
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(id)qword_1EB264600 setObject:v17 forKey:v4];
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v19 = [(id)qword_1EB264600 objectForKey:v4];
    [v19 setObject:v18 forKey:@"SubTests"];

    if (v6)
    {
      BOOL v8 = 1;
    }
    else
    {
      uint64_t v40 = 0;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v37 = 0u;
      memset(&buf, 0, sizeof(buf));
      GetProcStatistics((uint64_t)&buf, 0);
      uint64_t v20 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&buf length:88];
      [v17 setObject:v20 forKey:@"startStats"];
    }
    memset(&buf, 0, sizeof(buf));
    malloc_zone_statistics(0, &buf);
    uint64_t blocks_in_use = buf.blocks_in_use;
    BOOL v22 = [NSNumber numberWithInt:LODWORD(buf.size_in_use)];
    [v17 setObject:v22 forKey:@"heapBytes"];

    double v23 = [NSNumber numberWithInt:blocks_in_use];
    [v17 setObject:v23 forKey:@"heapNodes"];

    double v24 = [NSNumber numberWithUnsignedLong:CAGetCurrentImageBytes()];
    [v17 setObject:v24 forKey:@"imageBytes"];

    if (!v8 && !v10)
    {
      double v25 = [(UIApplication *)self _currentFrameCountForTestDisplay];
      [v17 setObject:v25 forKey:@"startingFrameCount"];
    }
    double v26 = NSNumber;
    if (v8) {
      double v27 = *(double *)&__LaunchTime;
    }
    else {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    }
    int v28 = [v26 numberWithDouble:v27];
    [v17 setObject:v28 forKey:@"startTimeIntervalSinceReferenceDate"];

    if (v8)
    {
      uint64_t v29 = __ExecOrResumeTime;
      if (*(double *)&__ExecOrResumeTime == 0.0) {
        uint64_t v29 = __LaunchTime;
      }
      double v30 = [NSNumber numberWithDouble:*(double *)&v29];
      [v17 setObject:v30 forKey:@"execOrResumeTimeIntervalSinceReferenceDate"];
    }
    else
    {
      double v31 = NSString;
      double v32 = [v17 objectForKey:@"startTimeIntervalSinceReferenceDate"];
      v33 = [v31 stringWithFormat:@"%@:%@", v4, v32];
      uint64_t v34 = [v33 hash];

      double v35 = [NSNumber numberWithUnsignedInteger:v34];
      [v17 setObject:v35 forKey:@"pptTestTracepointIdentifier"];

      [(UIApplication *)self emitPPTStartTracePointForTestName:v4 identifier:v34];
    }
  }
}

- (BOOL)isLaunchTest:(id)a3
{
  id v3 = a3;
  [v3 rangeOfString:@"widget-launch"];
  if (v4)
  {
    BOOL v5 = 0;
  }
  else
  {
    [v3 rangeOfString:@"launch"];
    BOOL v5 = v6 != 0;
  }

  return v5;
}

void __71__UIApplication__reportMainSceneUpdateFinishedPossiblyDeferredPortions__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 _launchTestName];
  [v1 finishedSubTest:@"launch-responsive" forTest:v2];
}

- (void)_reportMainSceneUpdateFinishedPossiblyDeferredPortions
{
  kdebug_trace();
  id v3 = [(id)UIApp _currentTests];
  uint64_t v4 = [v3 objectForKey:qword_1EB25B518];

  if (v4) {
    BOOL v5 = __wasResumed == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    uint64_t v6 = NSNumber;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [v4 setObject:v7 forKey:@"launchTimeIntervalSinceReferenceDate"];
  }
  BOOL v8 = [(UIApplication *)self _extendLaunchTest];
  if (v8) {
    BOOL v9 = __wasResumed == 0;
  }
  else {
    BOOL v9 = 0;
  }
  int v10 = v9;

  if (!__wasResumed)
  {
    id v11 = [(UIApplication *)self _launchTestName];
    [(UIApplication *)self startedSubTest:@"launch-responsive" forTest:v11];

    alm_app_did_present_with_metrics_payload();
  }
  id v12 = getenv("ActivePrewarm");
  if (v12) {
    BOOL v13 = *v12 == 49;
  }
  else {
    BOOL v13 = 0;
  }
  getpid();
  memorystatus_control();
  if (v13) {
    setenv("ActivePrewarm", "0", 1);
  }
  alm_app_did_activate();
  if (!v10) {
    goto LABEL_22;
  }
  BOOL v14 = [(UIApplication *)self _extendLaunchTest];
  unint64_t v15 = [(UIApplication *)self _launchTestName];
  [(UIApplication *)self startedSubTest:v14 forTest:v15];

  __basicLaunchTestIsMarkedAsFinished = 1;
  if (__extendedLaunchTestIsMarkedAsFinished) {
LABEL_22:
  }
    [(id)UIApp finishedTest:qword_1EB25B518 extraResults:0];
  *(void *)(UIApp + 176) &= ~0x200000000uLL;
  _UIApplicationEndLaunchBackgroundTask();
}

- (id)_launchTestName
{
  if (__IsRunningTests) {
    id v2 = (__CFString *)(id)qword_1EB25B518;
  }
  else {
    id v2 = @"launch";
  }
  return v2;
}

- (void)startedSubTest:(id)a3 forTest:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:", @"time", @"fps", 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(UIApplication *)self startedSubTest:v8 forTest:v7 withMetrics:v9];
}

- (id)_currentTests
{
  return (id)qword_1EB264600;
}

- (void)finishedTest:(id)a3 extraResults:(id)a4
{
}

uint64_t __49__UIApplication__setIdleTimerDisabled_forReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIdleTimerDisabled:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __60__UIApplication__setAmbiguousControlCenterActivationMargin___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setControlCenterAmbiguousActivationMargin:*(double *)(a1 + 32)];
}

- (double)windowRotationDuration
{
  id v2 = +[UIDevice currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return dbl_186B9BAC0[(v3 & 0xFFFFFFFFFFFFFFFBLL) == 1];
}

- (void)_restoreApplicationPreservationStateWithSessionIdentifier:(id)a3 beginHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v111 = a3;
  id v107 = a4;
  uint64_t v106 = (void (**)(void))a5;
  if (![(UIApplication *)self _appAdoptsUISceneLifecycle])
  {
    id v8 = __UIStatusBarManagerForWindow(0);
    uint64_t v9 = [v8 isStatusBarHidden];

    [(UIApplication *)self setStatusBarHidden:v9];
  }
  v109 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v10 = _restorationPath(v111);
  id v126 = 0;
  id v112 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v10 options:0 error:&v126];
  id v110 = (id)v10;
  id v11 = v126;
  if (v11)
  {
    id v12 = v11;
    BOOL v13 = [v11 domain];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4F281F8]];

    if (v14)
    {
      if ([v12 code] != 260)
      {
        unint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("ApplicationStateRestoration", &qword_1EB25B8A8) + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.tv_sec) = 138543362;
          *(__darwin_time_t *)((char *)&buf.tv_sec + 4) = (__darwin_time_t)v12;
          _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "Error reading archived restorable state: %{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
      if ([v12 code] == 257)
      {
        int v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("ApplicationStateRestoration", &qword_1EB25B8B0) + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.tv_sec) = 0;
          _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Unable to read state restoration file. Probably the device is locked.", (uint8_t *)&buf, 2u);
        }
        *((void *)&self->_applicationFlags + 1) |= 0x100000000uLL;
        buf.tv_sec = 0;
        buf.tv_nsec = 0;
        clock_gettime(_CLOCK_MONOTONIC_RAW_APPROX, &buf);
        self->_couldNotRestoreStateWhenLockedTime = buf.tv_sec;
      }
    }
    goto LABEL_178;
  }
  byte_1EB25B505 = 1;
  delegate = self->_delegate;
  uint64_t v102 = self;
  id v112 = v112;
  id v18 = delegate;
  id v110 = v110;
  id v113 = v111;
  id v100 = (uint64_t (**)(id, id))v107;
  v103 = v18;
  char v108 = objc_opt_respondsToSelector();
  id v114 = -[UIStateRestorationKeyedUnarchiver initForReadingWithData:defaultValues:requiresSecureCoding:]([UIStateRestorationKeyedUnarchiver alloc], "initForReadingWithData:defaultValues:requiresSecureCoding:", v112, 0);
  uint64_t v19 = [v114 decodeIntForKey:@"kUIStateRestorationArchiveMajorVersionKey"];
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SStateRestorat.isa, "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v19, [v114 decodeIntForKey:@"kUIStateRestorationArchiveMinorVersionKey"], 2, 1);
  }
  if (v19 != 2)
  {
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SMajorVersionM.isa, "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v19, 2);
    }
    goto LABEL_23;
  }
  if (v113)
  {
    if (!v100)
    {
LABEL_25:
      if (_UIStateRestorationDebugLogEnabled())
      {
        double v21 = @"NO";
        if (v108) {
          double v21 = @"YES";
        }
        NSLog(&cfstr_SApplicationSu.isa, "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v21);
      }
      v105 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
      v99 = [v114 decodeObjectOfClass:objc_opt_class() forKey:@"UIApplicationStateRestorationUserInterfaceIdiom"];
      if (v99)
      {
        [v105 setObject:v99 forKey:@"UIApplicationStateRestorationUserInterfaceIdiom"];
        int v22 = [v99 intValue];
        double v23 = +[UIDevice currentDevice];
        LOBYTE(v22) = [v23 userInterfaceIdiom] == v22;

        if ((v22 & 1) == 0)
        {
          LOBYTE(buf.tv_sec) = 0;
          double v24 = _getRestorationInProgressDictionary(v113, 0, (BOOL *)&buf);
          if (LOBYTE(buf.tv_sec))
          {
            double v25 = [NSNumber numberWithInteger:1];
            [v24 setObject:v25 forKey:@"kRestorationTriesLeft"];

            if ((_updateRestorationInProgressFile(0, v24) & 1) == 0) {
              NSLog(&cfstr_WarningUnableT_2.isa);
            }
          }
        }
      }
      double v97 = [v114 decodeObjectOfClass:objc_opt_class() forKey:@"UIApplicationStateRestorationBundleVersion"];
      if (v97) {
        [v105 setObject:v97 forKey:@"UIApplicationStateRestorationBundleVersion"];
      }
      v96 = [v114 decodeObjectOfClass:objc_opt_class() forKey:@"UIApplicationStateRestorationTimestamp"];
      if (v96) {
        [v105 setObject:v96 forKey:@"UIApplicationStateRestorationTimestamp"];
      }
      double v95 = [v114 decodeObjectOfClass:objc_opt_class() forKey:@"UIApplicationStateRestorationSystemVersion"];
      if (v95) {
        [v105 setObject:v95 forKey:@"UIApplicationStateRestorationSystemVersion"];
      }
      +[UIResponder _updateStateRestorationIdentifierMap];
      id v104 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([(UIApplication *)v102 _appAdoptsUISceneLifecycle])
      {
        id v115 = (id)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        double v26 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v27 = objc_opt_class();
        int v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
        id v115 = [v114 decodeObjectOfClasses:v28 forKey:@"kRootRestorationIdentifiersKey"];
      }
      uint64_t v29 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v30 = objc_opt_class();
      double v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
      pid_t v101 = [v114 decodeObjectOfClasses:v31 forKey:@"kViewControllerRestorationClassMapKey"];

      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SRootRestorati.isa, "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v115);
      }
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SRestorationCl.isa, "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v101);
      }
      if ([(UIApplication *)v102 _appAdoptsUISceneLifecycle])
      {
        id v98 = (id)MEMORY[0x1E4F1CC08];
      }
      else
      {
        double v32 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v33 = objc_opt_class();
        uint64_t v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
        id v98 = [v114 decodeObjectOfClasses:v34 forKey:@"WindowIdentifierToSizeClassMapKey"];
      }
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SWindowSizeCla.isa, "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v98);
      }
      if (v98)
      {
        id v122 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v133 = 0u;
        long long v134 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        double v35 = +[UIWindow allWindowsIncludingInternalWindows:0 onlyVisibleWindows:0];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v131 objects:v140 count:16];
        if (v36)
        {
          uint64_t v37 = *(void *)v132;
          do
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v132 != v37) {
                objc_enumerationMutation(v35);
              }
              long long v39 = *(void **)(*((void *)&v131 + 1) + 8 * i);
              uint64_t v40 = [v39 restorationIdentifier];

              if (v40)
              {
                uint64_t v41 = [v39 restorationIdentifier];
                [v122 setObject:v39 forKey:v41];
              }
            }
            uint64_t v36 = [v35 countByEnumeratingWithState:&v131 objects:v140 count:16];
          }
          while (v36);
        }

        if ([v122 count])
        {
          long long v129 = 0u;
          long long v130 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          obuint64_t j = v98;
          uint64_t v42 = [obj countByEnumeratingWithState:&v127 objects:v139 count:16];
          if (v42)
          {
            id v120 = 0;
            uint64_t v116 = *(void *)v128;
            do
            {
              uint64_t v118 = v42;
              for (uint64_t j = 0; j != v118; ++j)
              {
                if (*(void *)v128 != v116) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v44 = *(void *)(*((void *)&v127 + 1) + 8 * j);
                BOOL v45 = [obj objectForKey:v44];
                double v46 = [v122 objectForKey:v44];
                if (v46)
                {
                  int64_t v47 = [v45 objectForKey:@"VerticalSizeClassStringKey"];
                  uint64_t v48 = [v45 objectForKey:@"HorizontalSizeClassStringKey"];
                  id v49 = v46;
                  id v50 = v48;
                  id v124 = v47;
                  double v51 = [v49 traitCollection];
                  uint64_t v52 = _sizeClassFromString(v124);

                  uint64_t v53 = _sizeClassFromString(v50);
                  if ((v52 != [v51 verticalSizeClass] || v53 != objc_msgSend(v51, "horizontalSizeClass"))
                    && _UIStateRestorationDebugLogEnabled())
                  {
                    NSLog(&cfstr_STraitCollecti.isa, "void _updateWindowSizeClassOverrides(UIWindow *__strong, NSString *__strong, NSString *__strong)", v49);
                  }
                  [v49 _setStateRestorationVerticalSizeClass:v52 horizontalSizeClass:v53];
                  double v54 = [v49 traitCollection];
                  if (_UIStateRestorationDebugLogEnabled())
                  {
                    uint64_t v55 = [v51 horizontalSizeClass];
                    int v56 = @"UIUserInterfaceSizeClassUnspecified";
                    if (v55 == 2) {
                      int v56 = @"UIUserInterfaceSizeClassRegular";
                    }
                    if (v55 == 1) {
                      int v56 = @"UIUserInterfaceSizeClassCompact";
                    }
                    long long v57 = v56;
                    uint64_t v58 = [v51 verticalSizeClass];
                    int v59 = @"UIUserInterfaceSizeClassUnspecified";
                    if (v58 == 2) {
                      int v59 = @"UIUserInterfaceSizeClassRegular";
                    }
                    if (v58 == 1) {
                      int v59 = @"UIUserInterfaceSizeClassCompact";
                    }
                    long long v60 = v59;
                    uint64_t v61 = [v54 horizontalSizeClass];
                    long long v62 = @"UIUserInterfaceSizeClassUnspecified";
                    if (v61 == 2) {
                      long long v62 = @"UIUserInterfaceSizeClassRegular";
                    }
                    if (v61 == 1) {
                      long long v62 = @"UIUserInterfaceSizeClassCompact";
                    }
                    unsigned int v63 = v62;
                    uint64_t v64 = [v54 verticalSizeClass];
                    long long v65 = @"UIUserInterfaceSizeClassUnspecified";
                    if (v64 == 2) {
                      long long v65 = @"UIUserInterfaceSizeClassRegular";
                    }
                    if (v64 == 1) {
                      long long v65 = @"UIUserInterfaceSizeClassCompact";
                    }
                    NSLog(&cfstr_SSetWindowSize.isa, "void _updateWindowSizeClassOverrides(UIWindow *__strong, NSString *__strong, NSString *__strong)", v49, v57, v60, v63, v65);
                  }
                  if (!v120) {
                    id v120 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  }
                  if (_UIStateRestorationDebugLogEnabled()) {
                    NSLog(&cfstr_SAddingWindowT.isa, "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v49);
                  }
                  [v120 addObject:v49];
                }
              }
              uint64_t v42 = [obj countByEnumeratingWithState:&v127 objects:v139 count:16];
            }
            while (v42);
          }
          else
          {
            id v120 = 0;
          }
        }
        else
        {
          id v120 = 0;
        }
      }
      else
      {
        id v120 = 0;
      }
      if (![v115 count])
      {
LABEL_174:
        +[UIResponder _prepareForSecondPassStateRestoration];
        buf.tv_sec = MEMORY[0x1E4F143A8];
        buf.tv_nsec = 3221225472;
        v142 = ___restoreState_block_invoke_3966;
        v143 = &unk_1E5303008;
        id v89 = v104;
        id v144 = v89;
        id v90 = v105;
        id v145 = v90;
        char v151 = v108 & 1;
        id v146 = v113;
        v147 = v103;
        v148 = v102;
        id v91 = v114;
        id v149 = v91;
        id v92 = v120;
        id v150 = v92;
        +[UIView performWithoutAnimation:&buf];
        +[UIResponder _finishStateRestoration];
        [v91 finishDecoding];

        goto LABEL_175;
      }
      uint64_t v66 = 0;
      while (1)
      {
        long long v67 = [v115 objectAtIndex:v66];
        id v68 = [v67 componentsSeparatedByString:@"/"];
        long long v69 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v68, "count"));
        long long v137 = 0u;
        long long v138 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        id v70 = v68;
        uint64_t v71 = [v70 countByEnumeratingWithState:&v135 objects:&buf count:16];
        if (v71)
        {
          uint64_t v72 = *(void *)v136;
          do
          {
            for (uint64_t k = 0; k != v71; ++k)
            {
              if (*(void *)v136 != v72) {
                objc_enumerationMutation(v70);
              }
              int v74 = *(void **)(*((void *)&v135 + 1) + 8 * k);
              if (([v74 hasPrefix:@":["] & 1) == 0) {
                [v69 addObject:v74];
              }
            }
            uint64_t v71 = [v70 countByEnumeratingWithState:&v135 objects:&buf count:16];
          }
          while (v71);
        }

        uint64_t v75 = [v114 decodeObjectOfClass:objc_opt_class() forKey:v67];
        if (!v75)
        {
          if (_UIStateRestorationDebugLogEnabled()) {
            NSLog(&cfstr_SWarningNoStat.isa, "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v67);
          }
          goto LABEL_170;
        }
        id v125 = [[UIStateRestorationKeyedUnarchiver alloc] initForReadingWithData:v75 defaultValues:v105 requiresSecureCoding:v108 & 1];
        int v123 = [v125 decodeBoolForKey:@"kObjectIsViewControllerKey"];
        if (v113)
        {
          v76 = +[UIResponder objectWithRestorationIdentifierPath:v67];
          if (v76)
          {
            BOOL v77 = 0;
            goto LABEL_158;
          }
        }
        v78 = [v101 objectForKey:v67];
        if (v78)
        {
          if (_UIStateRestorationDebugLogEnabled()) {
            NSLog(&cfstr_SRestorationCl_0.isa, "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v67, v78);
          }
          Class v79 = NSClassFromString(v78);
          int v80 = _UIStateRestorationDebugLogEnabled();
          if (v79)
          {
            if (v80) {
              NSLog(&cfstr_SFoundRestorat.isa, "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v79);
            }
            if (!v123)
            {
              if ([(objc_class *)v79 conformsToProtocol:&unk_1ED701360])
              {
                uint64_t v81 = [(objc_class *)v79 objectWithRestorationIdentifierPath:v69 coder:v125];
                goto LABEL_137;
              }
              NSLog(&cfstr_WarningRestora_0.isa, v79);
              goto LABEL_146;
            }
            if ([(objc_class *)v79 conformsToProtocol:&unk_1ED701300])
            {
              uint64_t v81 = [(objc_class *)v79 viewControllerWithRestorationIdentifierPath:v69 coder:v125];
LABEL_137:
              v76 = (void *)v81;
LABEL_156:
              BOOL v77 = 1;
              goto LABEL_157;
            }
            NSLog(&cfstr_WarningRestora.isa, v79);
          }
          else if (v80)
          {
            NSLog(&cfstr_SNoRestoration_0.isa, "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)");
          }
        }
        char v82 = v123 ^ 1;
        if (v113) {
          char v82 = 1;
        }
        if ((v82 & 1) == 0)
        {
          if (objc_opt_respondsToSelector())
          {
            v76 = [(UIApplicationDelegate *)v103 application:v102 viewControllerWithRestorationIdentifierPath:v69 coder:v125];
            if (v76)
            {

              BOOL v77 = 1;
              goto LABEL_158;
            }
          }
          goto LABEL_148;
        }
LABEL_146:
        if (v113)
        {
          v76 = 0;
          goto LABEL_149;
        }
LABEL_148:
        v76 = +[UIResponder objectWithRestorationIdentifierPath:v67];
LABEL_149:
        BOOL v77 = v76 == 0;
        int v83 = v123;
        if (v76) {
          int v83 = 0;
        }
        if (v83 == 1)
        {
          id v117 = v69;
          id v84 = v125;
          v119 = [v84 decodeObjectOfClass:objc_opt_class() forKey:@"UIStateRestorationViewControllerStoryboard"];
          uint64_t v85 = [v84 decodeObjectOfClass:objc_opt_class() forKey:@"UIStateRestorationViewControllerStoryboardIdentifier"];
          v86 = (void *)v85;
          v76 = 0;
          if (v119 && v85)
          {
            v76 = [v119 instantiateViewControllerWithIdentifier:v85];
          }

          goto LABEL_156;
        }
LABEL_157:

        if (!v76)
        {
          if (_UIStateRestorationDebugLogEnabled()) {
            NSLog(&cfstr_SCouldnTGetObj.isa, "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v66, v67);
          }
          goto LABEL_169;
        }
LABEL_158:
        if (_UIStateRestorationDebugLogEnabled()) {
          NSLog(&cfstr_SObjectInRootS_0.isa, "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v66, v67, v76);
        }
        if (v123)
        {
          id v87 = v76;
          [v125 decodeBoolForKey:@"kViewControllerViewWasLoadedKey"];
          if ([v87 _shouldLoadViewDuringRestoration:v125])
          {
            [v87 view];
          }
          else if (_UIStateRestorationDebugLogEnabled())
          {
            NSLog(&cfstr_SSpecialCasePa.isa, "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)", v67);
          }
        }
        if (v77) {
          +[UIResponder _setRestoredIdentifierPathForObject:v76 identifierPath:v67];
        }
        +[UIResponder _updateStateRestorationIdentifierMap];
        v88 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v67, v76, v125, 0);
        [v104 addObject:v88];

LABEL_169:
LABEL_170:

        if ([v115 count] <= (unint64_t)++v66) {
          goto LABEL_174;
        }
      }
    }
    char v20 = v100[2](v100, v114);
  }
  else
  {
    if ((*((unsigned char *)&v102->_applicationFlags + 7) & 4) == 0) {
      goto LABEL_25;
    }
    if (objc_opt_respondsToSelector())
    {
      char v20 = [(UIApplicationDelegate *)v103 application:UIApp shouldRestoreSecureApplicationState:v114];
    }
    else
    {
      if (qword_1EB25B9E0 != -1) {
        dispatch_once(&qword_1EB25B9E0, &__block_literal_global_3906);
      }
      char v20 = [(UIApplicationDelegate *)v103 application:UIApp shouldRestoreApplicationState:v114];
    }
  }
  if (v20) {
    goto LABEL_25;
  }
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SApplicationHa_0.isa, "void _restoreState(UIApplication *__strong, NSData *__strong, NSObject<UIApplicationDelegate> *__strong, NSURL *__strong, NSString *__strong, __strong UIStateRestorationRestoreStateBeginHandler)");
  }
LABEL_23:
  _deleteRestorationArchive(v113);
  [v114 finishDecoding];
LABEL_175:

  byte_1EB25B505 = 0;
  if (v106) {
    v106[2]();
  }
  id v12 = 0;
LABEL_178:
  if (_UIStateRestorationDebugLogEnabled())
  {
    int v93 = [MEMORY[0x1E4F1C9C8] date];
    [v93 timeIntervalSinceDate:v109];
    NSLog(&cfstr_RestoredRestor.isa, v94);
  }
}

- (void)setStatusBarHidden:(BOOL)hidden withAnimation:(UIStatusBarAnimation)animation
{
  BOOL v4 = hidden;
  if (animation)
  {
    id v7 = [[UIStatusBarHideAnimationParameters alloc] initWithDefaultParameters];
    if (animation == UIStatusBarAnimationSlide) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    uint64_t v9 = v7;
    [(UIStatusBarHideAnimationParameters *)v7 setHideAnimation:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(UIApplication *)self setStatusBarHidden:v4 animationParameters:v9];
}

- (void)setStatusBarHidden:(BOOL)a3 animationParameters:(id)a4 changeApplicationFlag:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  if (![(UIApplication *)self _viewControllerBasedStatusBarAppearance])
  {
    if (v5)
    {
      uint64_t applicationFlags = (uint64_t)self->_applicationFlags;
      if (((((applicationFlags & 0x800000) == 0) ^ v6) & 1) == 0)
      {
        uint64_t v10 = *((void *)&self->_applicationFlags + 1);
        unint64_t v11 = applicationFlags & 0xFFFFFFFFFE7FFFFFLL;
        uint64_t v12 = 25165824;
        if (!v6) {
          uint64_t v12 = 0;
        }
        *(void *)&self->_uint64_t applicationFlags = v11 | v12;
        *((void *)&self->_applicationFlags + 1) = v10;
      }
    }
    BOOL v13 = +[UIScene _scenesIncludingInternal:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__UIApplication_setStatusBarHidden_animationParameters_changeApplicationFlag___block_invoke;
    v14[3] = &unk_1E5302750;
    id v15 = v8;
    [v13 enumerateObjectsUsingBlock:v14];
  }
}

- (void)setStatusBarHidden:(BOOL)a3 animationParameters:(id)a4
{
}

- (void)setStatusBarHidden:(BOOL)statusBarHidden
{
}

- (BOOL)_frontMostAppInterfaceOrientationIsSignificant
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 13) >> 4) & 1;
}

void __43__UIApplication__beginFenceTaskIfNecessary__block_invoke(uint64_t a1)
{
  if (pthread_main_np() != 1)
  {
    BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"UIApplication.m" lineNumber:2427 description:@"Call must be made on main thread"];
  }
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 312);
  *(void *)(v2 + 312) = 0;
}

uint64_t __53__UIApplication_UIApplicationTesting__handleTestURL___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) runTest:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) startedTest:*(void *)(a1 + 40)];
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 failedTest:v4 withFailure:@"TestNotHandled"];
  }
  return result;
}

- (void)_run
{
  uint64_t v3 = (void *)MEMORY[0x18C108260](self, a2);
  kdebug_trace();
  _kUIAccessibilityStartedWithInitialization = 1;
  [(id)UIApp _accessibilityInit];
  _kUIAccessibilityStartedWithInitialization = 0;
  kdebug_trace();
  XCTTargetBootstrap();
  [(UIApplication *)self _registerForUserDefaultsChanges];
  [(UIApplication *)self _registerForSignificantTimeChangeNotification];
  [(UIApplication *)self _registerForLanguageChangedNotification];
  [(UIApplication *)self _registerForLocaleWillChangeNotification];
  [(UIApplication *)self _registerForLocaleChangedNotification];
  [(UIApplication *)self _registerForAlertItemStateChangeNotification];
  [(UIApplication *)self _registerForKeyBagLockStatusNotification];
  [(UIApplication *)self _registerForNameLayerTreeNotification];
  [(UIApplication *)self _registerForBackgroundRefreshStatusChangedNotification];
  [(UIApplication *)self _registerForHangTracerEnabledStateChangedNotification];
  [(UIApplication *)self _registerForKeyboardLayoutChangedNotification];
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  context.version = 0;
  context.info = self;
  memset(&context.retain, 0, 24);
  if (!qword_1EB25B900)
  {
    BOOL v5 = Current;
    qword_1EB25B900 = (uint64_t)CFRunLoopObserverCreate(0, 0xA0uLL, 1u, 1999000, (CFRunLoopObserverCallBack)_beforeCACommitHandler, &context);
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D410];
    CFRunLoopAddObserver(v5, (CFRunLoopObserverRef)qword_1EB25B900, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    qword_1EB25B908 = (uint64_t)CFRunLoopObserverCreate(0, 0xA0uLL, 1u, 2001000, (CFRunLoopObserverCallBack)_afterCACommitHandler, &context);
    CFRunLoopAddObserver(v5, (CFRunLoopObserverRef)qword_1EB25B908, v6);
  }
  _UIApplicationInstallAutoreleasePoolsIfNecessaryForMode((const __CFString *)*MEMORY[0x1E4F1D418]);
  byte_1EB25B4E2 = 1;
  eventDispatcher = self->_eventDispatcher;
  Main = CFRunLoopGetMain();
  -[UIEventDispatcher _installEventRunLoopSources:]((uint64_t)eventDispatcher, Main);
  BOOL v9 = [(_UIApplicationInfoParser *)self->_appInfo supportsMultiwindow];
  uint64_t v10 = 0x1000000000000;
  if (!v9) {
    uint64_t v10 = 0;
  }
  *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFEFFFFFFFFFFFFLL | v10;
  BOOL v11 = [(_UIApplicationInfoParser *)self->_appInfo supportedOnLockScreen];
  uint64_t v12 = 0x2000000000000;
  if (!v11) {
    uint64_t v12 = 0;
  }
  *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFDFFFFFFFFFFFFLL | v12;
  if (([(id)objc_opt_class() registerAsSystemApp] & 1) != 0
    || [(UIApplication *)self isFrontBoard])
  {
    self->_eventDispatcher->_mainEnvironment->_isSystemApplication = 1;
    if (![(UIApplication *)self disablesFrontBoardImplicitWindowScenes])
    {
      byte_1EB25B4E1 = 1;
      _requestHardwareEventsIfNeeded();
      BOOL v13 = +[FBSSceneTransitionContext transitionContext];
      [(UIApplication *)self _runWithMainScene:0 transitionContext:v13 completion:0];
    }
  }
  if ((byte_1EB25B4E1 & 1) == 0)
  {
    int v14 = [(id)objc_opt_class() _isSystemUIService];
    id v15 = objc_opt_class();
    if (v14)
    {
      [v15 _attemptRequestingSystemUIServiceSceneWithRetry];
    }
    else
    {
      int v16 = _UIApplicationWantsExtensionBehavior(v15);
      byte_1EB25B4E1 = 1;
      if (v16)
      {
        [(UIApplication *)self __completeAndRunAsPlugin];
      }
      else
      {
        id v17 = +[_UISceneLifecycleMultiplexer sharedInstance];
        char v18 = [v17 lifecycleWantsUnnecessaryDelayForSceneDelivery];

        if ((v18 & 1) == 0) {
          [(UIApplication *)self _compellApplicationLaunchToCompleteUnconditionally];
        }
      }
    }
  }
  kdebug_trace();
  GSEventRun();
}

- (BOOL)_isSpringBoardShowingAnAlert
{
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__UIApplication__isSpringBoardShowingAnAlert__block_invoke;
  v7[3] = &unk_1E53026C0;
  v7[4] = &v8;
  [(id)qword_1EB25B580 enumerateObjectsUsingBlock:v7];
  if (*((unsigned char *)v9 + 24))
  {
    BOOL v2 = 1;
  }
  else
  {
    if (byte_1EB25B4DF
      || (uint32_t v3 = notify_register_check("com.apple.springboard.showingAlertItem", &dword_1EB25B510),
          byte_1EB25B4DF = v3 == 0,
          !v3))
    {
      checuint64_t k = 0;
      notify_check(dword_1EB25B510, &check);
      if (check)
      {
        uint64_t state64 = 0;
        notify_get_state(dword_1EB25B510, &state64);
        byte_1EB25B4DE = state64 != 0;
      }
    }
    BOOL v2 = byte_1EB25B4DE != 0;
    *((unsigned char *)v9 + 24) = byte_1EB25B4DE != 0;
  }
  _Block_object_dispose(&v8, 8);
  return v2;
}

- (void)_deactivateForReason:(int)a3
{
}

- (void)_checkActivityContinuationAndBecomeCurrentIfNeeded
{
  if ([(UIActivityContinuationManager *)self->_activityContinuationManager activityContinuationsAreBeingTracked])
  {
    BOOL v2 = MEMORY[0x1E4F14428];
    dispatch_async(v2, &__block_literal_global_1405_0);
  }
}

+ (BOOL)registerAsSystemApp
{
  return byte_1EB25B4DA;
}

- (void)setDelegate:(id)delegate
{
  uint64_t v4 = (UIApplicationDelegate *)delegate;
  if (!v4 || self->_delegate != v4)
  {
    uint64_t v58 = v4;
    objc_setAssociatedObject(self, &unk_1EB25B4DB, 0, (void *)1);
    self->_delegate = v58;
    char v5 = objc_opt_respondsToSelector();
    uint64_t v6 = 0x10000000000;
    if ((v5 & 1) == 0) {
      uint64_t v6 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFFFEFFFFFFFFFFLL | v6;
    char v7 = objc_opt_respondsToSelector();
    uint64_t v8 = 0x20000000000;
    if ((v7 & 1) == 0) {
      uint64_t v8 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFFFDFFFFFFFFFFLL | v8;
    char v9 = objc_opt_respondsToSelector();
    uint64_t v10 = 0x40000000000;
    if ((v9 & 1) == 0) {
      uint64_t v10 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFFFBFFFFFFFFFFLL | v10;
    char v11 = objc_opt_respondsToSelector();
    uint64_t v12 = 0x80000000000;
    if ((v11 & 1) == 0) {
      uint64_t v12 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFFF7FFFFFFFFFFLL | v12;
    char v13 = objc_opt_respondsToSelector();
    uint64_t v14 = 0x100000000000;
    if ((v13 & 1) == 0) {
      uint64_t v14 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFFEFFFFFFFFFFFLL | v14;
    char v15 = objc_opt_respondsToSelector();
    uint64_t v16 = 0x200000000000;
    if ((v15 & 1) == 0) {
      uint64_t v16 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFFDFFFFFFFFFFFLL | v16;
    char v17 = objc_opt_respondsToSelector();
    uint64_t v18 = 0x400000000000;
    if ((v17 & 1) == 0) {
      uint64_t v18 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFFBFFFFFFFFFFFLL | v18;
    char v19 = objc_opt_respondsToSelector();
    uint64_t v20 = 0x800000000000;
    if ((v19 & 1) == 0) {
      uint64_t v20 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFF7FFFFFFFFFFFLL | v20;
    char v21 = objc_opt_respondsToSelector();
    uint64_t v22 = 0x1000000000000;
    if ((v21 & 1) == 0) {
      uint64_t v22 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFEFFFFFFFFFFFFLL | v22;
    char v23 = objc_opt_respondsToSelector();
    uint64_t v24 = 0x2000000000000;
    if ((v23 & 1) == 0) {
      uint64_t v24 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFDFFFFFFFFFFFFLL | v24;
    char v25 = objc_opt_respondsToSelector();
    uint64_t v26 = 0x4000000000000;
    if ((v25 & 1) == 0) {
      uint64_t v26 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFBFFFFFFFFFFFFLL | v26;
    char v27 = objc_opt_respondsToSelector();
    uint64_t v28 = 0x8000000000000;
    if ((v27 & 1) == 0) {
      uint64_t v28 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFF7FFFFFFFFFFFFLL | v28;
    char v29 = objc_opt_respondsToSelector();
    uint64_t v30 = 0x10000000000000;
    if ((v29 & 1) == 0) {
      uint64_t v30 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFEFFFFFFFFFFFFFLL | v30;
    char v31 = objc_opt_respondsToSelector();
    uint64_t v32 = 0x20000000000000;
    if ((v31 & 1) == 0) {
      uint64_t v32 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFDFFFFFFFFFFFFFLL | v32;
    char v33 = objc_opt_respondsToSelector();
    uint64_t v34 = 0x40000000000000;
    if ((v33 & 1) == 0) {
      uint64_t v34 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFBFFFFFFFFFFFFFLL | v34;
    char v35 = objc_opt_respondsToSelector();
    uint64_t v36 = 0x80000000000000;
    if ((v35 & 1) == 0) {
      uint64_t v36 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFF7FFFFFFFFFFFFFLL | v36;
    char v37 = objc_opt_respondsToSelector();
    uint64_t v38 = 0x100000000000000;
    if ((v37 & 1) == 0) {
      uint64_t v38 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFEFFFFFFFFFFFFFFLL | v38;
    char v39 = objc_opt_respondsToSelector();
    uint64_t v40 = 0x200000000000000;
    if ((v39 & 1) == 0) {
      uint64_t v40 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFDFFFFFFFFFFFFFFLL | v40;
    char v41 = objc_opt_respondsToSelector();
    uint64_t v42 = 0x2000000000000000;
    if ((v41 & 1) == 0) {
      uint64_t v42 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xDFFFFFFFFFFFFFFFLL | v42;
    char v43 = objc_opt_respondsToSelector();
    uint64_t v44 = 0x4000000000000000;
    if ((v43 & 1) == 0) {
      uint64_t v44 = 0;
    }
    *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xBFFFFFFFFFFFFFFFLL | v44;
    if (![(UIApplicationDelegate *)v58 __isKindOfUIResponder]
      || (_IsKindOfUIView((uint64_t)v58) & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      BOOL v45 = 0;
    }
    else
    {
      objc_opt_class();
      BOOL v45 = (objc_opt_isKindOfClass() & 1) == 0;
    }
    *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFEFFFFFLL | ((unint64_t)v45 << 20);
    char v46 = objc_opt_respondsToSelector();
    uint64_t v47 = 0x200000;
    if ((v46 & 1) == 0) {
      uint64_t v47 = 0;
    }
    *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFDFFFFFLL | v47;
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      char v48 = 1;
    }
    else if (objc_opt_respondsToSelector())
    {
      char v48 = objc_opt_respondsToSelector() & 1;
    }
    else
    {
      char v48 = 0;
    }
    p_uint64_t applicationFlags = &self->_applicationFlags;
    *(void *)p_uint64_t applicationFlags = *(void *)p_applicationFlags & 0xFBFFFFFFFFFFFFFFLL | ((unint64_t)(v48 & 1) << 58);
    char v50 = objc_opt_respondsToSelector();
    uint64_t v51 = 0x800000000000000;
    if ((v50 & 1) == 0) {
      uint64_t v51 = 0;
    }
    *(void *)p_uint64_t applicationFlags = *(void *)p_applicationFlags & 0xF7FFFFFFFFFFFFFFLL | v51;
    char v52 = objc_opt_respondsToSelector();
    uint64_t v53 = 0x1000000000000000;
    if ((v52 & 1) == 0) {
      uint64_t v53 = 0;
    }
    *(void *)p_uint64_t applicationFlags = *(void *)p_applicationFlags & 0xEFFFFFFFFFFFFFFFLL | v53;
    char v54 = objc_opt_respondsToSelector();
    unint64_t v55 = 0x8000000000000000;
    if ((v54 & 1) == 0) {
      unint64_t v55 = 0;
    }
    *(void *)p_uint64_t applicationFlags = v55 & 0x8000000000000000 | *(void *)p_applicationFlags & 0x7FFFFFFFFFFFFFFFLL;
    *((void *)p_applicationFlags + 1) = *((void *)p_applicationFlags + 1) & 0xFFFFFFFFFFFFFFFELL | ((objc_opt_respondsToSelector() & 1) != 0);
    char v56 = objc_opt_respondsToSelector();
    uint64_t v57 = 2;
    if ((v56 & 1) == 0) {
      uint64_t v57 = 0;
    }
    *((void *)p_applicationFlags + 1) = *((void *)p_applicationFlags + 1) & 0xFFFFFFFFFFFFFFFDLL | v57;
    uint64_t v4 = v58;
  }
}

+ (id)_systemAnimationFenceExemptQueue
{
  if (qword_1EB25B5A0 != -1) {
    dispatch_once(&qword_1EB25B5A0, &__block_literal_global_1156_0);
  }
  BOOL v2 = (void *)qword_1EB25B5A8;
  return v2;
}

- (id)_systemAnimationFenceExemptQueue
{
  return +[UIApplication _systemAnimationFenceExemptQueue];
}

void __34__UIApplication__firstCommitBlock__block_invoke(uint64_t a1)
{
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  uint32_t v3 = (const void *)*MEMORY[0x1E4F1D410];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__UIApplication__firstCommitBlock__block_invoke_2;
  block[3] = &unk_1E52D9F70;
  void block[4] = *(void *)(a1 + 32);
  CFRunLoopPerformBlock(Current, v3, block);
}

- (void)_findBestActivityToMakeCurrent:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)&self->_applicationFlags + 2) & 8) != 0
    && [(UIActivityContinuationManager *)self->_activityContinuationManager activityContinuationsAreBeingTracked])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__UIApplication__findBestActivityToMakeCurrent___block_invoke;
    block[3] = &unk_1E52D9F70;
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)_accessibilityInit
{
  v31[28] = *MEMORY[0x1E4F143B8];
  if (!AXDisallowsUIBasedAccessibilityFeatures())
  {
    [(UIApplication *)self performSelector:sel__accessibilitySetUpQuickSpeak withObject:0 afterDelay:1.5];
    if (_AXSAccessibilityEnabled()) {
      [(id)objc_opt_class() _updateAccessibilitySettingsLoader];
    }
    [(UIApplication *)self _updateApplicationAccessibility];
    [(UIApplication *)self _updateLargeTextNotification];
    if ((_accessibilityInit_AccessibilityWasInitialized & 1) == 0)
    {
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)_accessibilityStatusChanged, (CFStringRef)*MEMORY[0x1E4FB8FC8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_axPrefEnabledChange, (CFStringRef)*MEMORY[0x1E4FB91A8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v5 = *MEMORY[0x1E4FB9210];
      v31[0] = *MEMORY[0x1E4FB9388];
      v31[1] = v5;
      uint64_t v6 = *MEMORY[0x1E4FB91D8];
      v31[2] = *MEMORY[0x1E4FB90F8];
      v31[3] = v6;
      uint64_t v7 = *MEMORY[0x1E4FB9158];
      v31[4] = *MEMORY[0x1E4FB9128];
      v31[5] = v7;
      uint64_t v8 = *MEMORY[0x1E4FB9290];
      v31[6] = *MEMORY[0x1E4FB9118];
      v31[7] = v8;
      uint64_t v9 = *MEMORY[0x1E4FB90A0];
      v31[8] = *MEMORY[0x1E4FB9108];
      v31[9] = v9;
      uint64_t v10 = *MEMORY[0x1E4FB92F8];
      v31[10] = *MEMORY[0x1E4FB9258];
      v31[11] = v10;
      uint64_t v11 = *MEMORY[0x1E4FB9088];
      v31[12] = *MEMORY[0x1E4FB92B8];
      v31[13] = v11;
      uint64_t v12 = *MEMORY[0x1E4FB9288];
      v31[14] = *MEMORY[0x1E4FB9110];
      v31[15] = v12;
      uint64_t v13 = *MEMORY[0x1E4FB91D0];
      v31[16] = *MEMORY[0x1E4FB92A0];
      v31[17] = v13;
      uint64_t v14 = *MEMORY[0x1E4FB92A8];
      v31[18] = *MEMORY[0x1E4FB90E0];
      v31[19] = v14;
      uint64_t v15 = *MEMORY[0x1E4FB9360];
      v31[20] = *MEMORY[0x1E4FB9358];
      v31[21] = v15;
      uint64_t v16 = *MEMORY[0x1E4FB9138];
      v31[22] = *MEMORY[0x1E4FB9130];
      v31[23] = v16;
      uint64_t v17 = *MEMORY[0x1E4FB9140];
      v31[24] = *MEMORY[0x1E4FB91B0];
      v31[25] = v17;
      uint64_t v18 = *MEMORY[0x1E4FB90E8];
      v31[26] = *MEMORY[0x1E4FB9070];
      v31[27] = v18;
      char v19 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:28];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v27;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v27 != v22) {
              objc_enumerationMutation(v19);
            }
            CFStringRef v24 = *(const __CFString **)(*((void *)&v26 + 1) + 8 * v23);
            char v25 = CFNotificationCenterGetLocalCenter();
            CFNotificationCenterAddObserver(v25, self, (CFNotificationCallback)_axPrefEnabledChange, v24, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
            ++v23;
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v21);
      }
      if ([(UIApplication *)self _accessibilityApplicationIsSystemWideServer])
      {
        [(UIApplication *)self _updateAccessibilityItunesSettings];
      }
    }
    _accessibilityInit_AccessibilityWasInitialized = 1;
  }
}

- (void)_updateLargeTextNotification
{
  if (_updateLargeTextNotification_onceToken != -1) {
    dispatch_once(&_updateLargeTextNotification_onceToken, &__block_literal_global_0);
  }
}

- (void)_updateApplicationAccessibility
{
  int v3 = _kUIAccessibilityEnabled;
  int v4 = _AXSApplicationAccessibilityEnabled() != 0;
  _kUIAccessibilityEnabled = v4;
  if (v3 != v4)
  {
    uint64_t v5 = [(UIApplication *)self _accessibilityBundlePrincipalClass];
    if (_kUIAccessibilityEnabled)
    {
      if (_updateApplicationAccessibility_StartedAccessibilityServer)
      {
        [(objc_class *)v5 _accessibilityReenabled];
      }
      else
      {
        [(objc_class *)v5 _accessibilityStartServer];
        _updateApplicationAccessibility_StartedAccessibilityServer = 1;
      }
    }
    else
    {
      [(objc_class *)v5 _accessibilityStopServer];
    }
  }
}

- (BOOL)_accessibilityApplicationIsSystemWideServer
{
  id v2 = _UIMainBundleIdentifier();
  return [v2 isEqualToString:@"com.apple.springboard"];
}

- (void)_registerForUserDefaultsChanges
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleUserDefaultsDidChange_ name:*MEMORY[0x1E4F28AC8] object:0];
}

- (void)_registerForSignificantTimeChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v3 = (const void *)UIApp;
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_significantTimeChange, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_registerForNameLayerTreeNotification
{
  id v2 = objc_msgSend(NSString, "stringWithFormat:", @"NameLayerTree-%i", getpid());
  id v3 = v2;
  if (v2)
  {
    int out_token = 0;
    int v4 = (const char *)[v2 UTF8String];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __54__UIApplication__registerForNameLayerTreeNotification__block_invoke_2;
    handler[3] = &unk_1E52FD220;
    id v8 = &__block_literal_global_1464_1;
    notify_register_dispatch(v4, &out_token, MEMORY[0x1E4F14428], handler);
  }
  int out_token = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__UIApplication__registerForNameLayerTreeNotification__block_invoke_3;
  v5[3] = &unk_1E52FD220;
  id v6 = &__block_literal_global_1464_1;
  notify_register_dispatch("NameLayerTree", &out_token, MEMORY[0x1E4F14428], v5);
}

- (void)_registerForLanguageChangedNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v3 = (const void *)UIApp;
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_languageChanged, @"com.apple.language.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_registerForKeyboardLayoutChangedNotification
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v2 = [MEMORY[0x1E4F28F08] mainQueue];
  id v3 = (id)[v4 addObserverForName:@"UITextInputCurrentKeyboardLayoutDidChangeNotification" object:0 queue:v2 usingBlock:&__block_literal_global_1889];
}

- (void)_registerForKeyBagLockStatusNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v3 = (const void *)UIApp;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F78158];
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_keybagLockStatusChanged, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_registerForHangTracerEnabledStateChangedNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F655F0];
  uint64_t v5 = [MEMORY[0x1E4F28F08] mainQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__UIApplication__registerForHangTracerEnabledStateChangedNotification__block_invoke;
  v7[3] = &unk_1E5302AF0;
  v7[4] = self;
  id v6 = (id)[v3 addObserverForName:v4 object:0 queue:v5 usingBlock:v7];
}

- (void)_registerForBackgroundRefreshStatusChangedNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_backgroundRefreshStatusDidChange, @"kKeepAppsUpToDateEnabledChangedNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)_registerForAlertItemStateChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v3 = (const void *)UIApp;
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_alertItemStateChanged, @"com.apple.springboard.showingAlertItem", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (id)_firstCommitBlock
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__UIApplication__firstCommitBlock__block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  void aBlock[4] = self;
  id v2 = _Block_copy(aBlock);
  return v2;
}

- (void)_registerForLocaleWillChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v3 = (const void *)UIApp;
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_localeWillChange, @"AppleTimePreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_registerForLocaleChangedNotification
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  id v3 = (const void *)UIApp;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D200];
  CFNotificationCenterAddObserver(LocalCenter, v3, (CFNotificationCallback)_localeChanged, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_sendWillEnterForegroundCallbacks
{
  kdebug_trace();
  [(UIApplicationDelegate *)self->_delegate methodForSelector:sel_applicationWillEnterForeground_];
  entr_act_modify();
  if ((*((unsigned char *)&self->_applicationFlags + 6) & 0x80) != 0
    && ([(id)UIApp _appAdoptsUICanvasLifecycle] & 1) == 0
    && ([(id)UIApp _appAdoptsUISceneLifecycle] & 1) == 0)
  {
    [(UIApplicationDelegate *)self->_delegate applicationWillEnterForeground:self];
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"UIApplicationWillEnterForegroundNotification" object:self userInfo:0];

  *((void *)&self->_applicationFlags + 1) &= ~0x4000000000000uLL;
  entr_act_end();
  kdebug_trace();
}

- (CGRect)statusBarFrame
{
  id v2 = _UIStatusBarManagerForNoWindow();
  [v2 statusBarFrame];
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

void __48__UIApplication__setCachedSystemAnimationFence___block_invoke(uint64_t a1)
{
  if (pthread_main_np() != 1)
  {
    double v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"UIApplication.m" lineNumber:2467 description:@"Call must be made on main thread"];
  }
  [*(id *)(*(void *)(a1 + 32) + 320) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 320);
  *(void *)(v2 + 320) = 0;
}

uint64_t __103__UIApplication_UIApplicationTesting__finishedTest_extraResults_waitForNotification_withTeardownBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedSubTest:@"extended-launch-responsive" forTest:*(void *)(a1 + 40)];
}

- (id)_connectUISceneFromFBSScene:(id)a3 transitionContext:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v39 = a4;
  double v7 = [v6 specification];
  double v8 = [v7 uiSceneSessionRole];

  int v9 = [v8 isEqualToString:@"UIWindowSceneSessionRoleApplication"];
  int v10 = [v8 isEqualToString:@"UIWindowSceneSessionRoleExternalDisplayNonInteractive"];
  double v11 = [v6 specification];
  int v12 = [v11 isUIKitManaged];

  double v13 = [v6 specification];
  int v14 = [v13 isInternal];

  uint64_t v15 = [v6 specification];
  int v36 = [v15 allowsConfigurationByAppDelegate];

  if (v12 && v14 && v9 | v10)
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v34 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        goto LABEL_29;
      }
      char v35 = [v6 specification];
      *(_DWORD *)timespec buf = 138412546;
      char v41 = v35;
      __int16 v42 = 2112;
      char v43 = v8;
      _os_log_fault_impl(&dword_1853B0000, v34, OS_LOG_TYPE_FAULT, "Invalid scene specification. Internal scenes must also have a distinct UISceneSessionRole: specification: %@; role: %@",
        buf,
        0x16u);
    }
    else
    {
      char v33 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_connectUISceneFromFBSScene_transitionContext____s_category)+ 8);
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        goto LABEL_4;
      }
      uint64_t v34 = v33;
      char v35 = [v6 specification];
      *(_DWORD *)timespec buf = 138412546;
      char v41 = v35;
      __int16 v42 = 2112;
      char v43 = v8;
      _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "Invalid scene specification. Internal scenes must also have a distinct UISceneSessionRole: specification: %@; role: %@",
        buf,
        0x16u);
    }

LABEL_29:
  }
LABEL_4:
  uint64_t v16 = +[UIScene _persistenceIdentifierForScene:v6];
  uint64_t v17 = [(UIApplication *)self _openSessionForPersistentIdentifier:v16];
  uint64_t v18 = v17;
  int v37 = v14;
  if (v17)
  {
    if ([v17 _configurationNeedsReevalulation])
    {
      char v19 = [[UISceneConfiguration alloc] initWithName:0 sessionRole:v8];
      [v18 _updateConfiguration:v19];

      char v20 = 1;
    }
    else
    {
      char v20 = 0;
    }
    id v21 = v18;
  }
  else
  {
    id v21 = [[UISceneSession alloc] _initWithPersistentIdentifier:v16 sessionRole:v8 configurationName:0];
    char v20 = 0;
  }
  uint64_t v38 = self;
  if ([(id)UIApp _appAdoptsUISceneLifecycle])
  {
    uint64_t v22 = [v6 specification];
    uint64_t v23 = [v39 actions];
    CFStringRef v24 = +[UIScene _connectionOptionsForScene:v6 withSpecification:v22 transitionContext:v39 actions:v23 sceneSession:v21];

    char v25 = [v24 unprocessedActions];
    [v39 setActions:v25];
  }
  else
  {
    CFStringRef v24 = 0;
  }
  long long v26 = [UISceneConnectionOptions alloc];
  long long v27 = [v6 specification];
  id v28 = [(UISceneConnectionOptions *)v26 _initWithConnectionOptionsContext:v24 fbsScene:v6 specification:v27];

  char v29 = v20 ^ 1;
  if (!v18) {
    char v29 = 0;
  }
  if ((v29 & 1) == 0)
  {
    if ((v37 | v36 ^ 1) & 1) == 0 && (*((unsigned char *)&v38->_applicationFlags + 8))
    {
      uint64_t v30 = [(UIApplicationDelegate *)v38->_delegate application:v38 configurationForConnectingSceneSession:v21 options:v28];
      if (v30) {
        [v21 _updateConfiguration:v30];
      }
    }
    -[UIApplication _appendSessionToSessionSet:save:](v38, "_appendSessionToSessionSet:save:", v21, [v6 isPersistable]);
  }
  char v31 = +[UIScene _sceneForFBSScene:v6 create:1 withSession:v21 connectionOptions:v28];

  return v31;
}

- (id)_openSessionForPersistentIdentifier:(id)a3
{
  id v3 = a3;
  if (qword_1EB25BA00 != -1) {
    dispatch_once(&qword_1EB25BA00, &__block_literal_global_4054);
  }
  double v4 = (void *)qword_1EB25B9F8;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__UIApplication_SessionAndConfigurationInternal___openSessionForPersistentIdentifier___block_invoke;
  v10[3] = &unk_1E5302C40;
  id v11 = v3;
  id v5 = v3;
  id v6 = v4;
  double v7 = [v6 objectsPassingTest:v10];
  double v8 = [v7 anyObject];

  return v8;
}

- (UIInterfaceOrientation)statusBarOrientation
{
  if (dyld_program_sdk_at_least())
  {
    return [(UIApplication *)self _safeInterfaceOrientationForNoWindow];
  }
  else
  {
    double v4 = [(UIApplication *)self _findUISceneForLegacyInterfaceOrientation];
    id v5 = v4;
    if (v4)
    {
      if (![v4 _canDynamicallySpecifySupportedInterfaceOrientations]
        || ([v5 _effectiveUIClientSettings],
            id v6 = objc_claimAutoreleasedReturnValue(),
            UIInterfaceOrientation v7 = [v6 interfaceOrientation],
            v6,
            v7 == UIInterfaceOrientationUnknown))
      {
        UIInterfaceOrientation v7 = [v5 _interfaceOrientation];
      }
    }
    else
    {
      UIInterfaceOrientation v7 = UIInterfaceOrientationUnknown;
    }
    if ((unint64_t)v7 <= UIInterfaceOrientationPortrait) {
      UIInterfaceOrientation v7 = UIInterfaceOrientationPortrait;
    }

    return v7;
  }
}

+ (BOOL)_isUIKitSystemProcess
{
  return 0;
}

- (void)_setAmbiguousControlCenterActivationMargin:(double)a3
{
  double v4 = [(UIApplication *)self _mainScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__UIApplication__setAmbiguousControlCenterActivationMargin___block_invoke;
  v5[3] = &__block_descriptor_40_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  *(double *)&void v5[4] = a3;
  [v4 updateUIClientSettingsWithBlock:v5];
}

- (BOOL)shouldRecordExtendedLaunchTime
{
  return 1;
}

- (BOOL)shouldLaunchSafe
{
  return byte_1EB25B4D9;
}

- (void)_reloadKeyboardArbiterState
{
  id v2 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  [v2 checkState];
}

void __41__UIApplication__applicationNameForMenus__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = (void *)qword_1EB25B7C8;
  id v34 = (id)v2;
  if (v2) {
    BOOL v4 = qword_1EB25B7C8 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v6 = [v5 countryCode];
    int v7 = [v6 isEqualToString:@"cn"];

    if (v7)
    {
      double v8 = [v34 objectForInfoDictionaryKey:@"CFBundleName#CH"];
      uint64_t v9 = [v8 copyWithZone:0];
      int v10 = (void *)qword_1EB25B7C8;
      qword_1EB25B7C8 = v9;

      uint64_t v11 = [*(id *)(a1 + 32) _sanitizeBundleString:qword_1EB25B7C8];
      int v12 = (void *)qword_1EB25B7C8;
      qword_1EB25B7C8 = v11;
    }
    id v3 = (void *)qword_1EB25B7C8;
    if (!qword_1EB25B7C8)
    {
      double v13 = [v34 objectForInfoDictionaryKey:*MEMORY[0x1E4F1CC48]];
      uint64_t v14 = [v13 copyWithZone:0];
      uint64_t v15 = (void *)qword_1EB25B7C8;
      qword_1EB25B7C8 = v14;

      uint64_t v16 = [*(id *)(a1 + 32) _sanitizeBundleString:qword_1EB25B7C8];
      uint64_t v17 = (void *)qword_1EB25B7C8;
      qword_1EB25B7C8 = v16;

      id v3 = (void *)qword_1EB25B7C8;
      if (!qword_1EB25B7C8)
      {
        uint64_t v18 = [v34 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D008]];
        uint64_t v19 = [v18 copyWithZone:0];
        char v20 = (void *)qword_1EB25B7C8;
        qword_1EB25B7C8 = v19;

        uint64_t v21 = [*(id *)(a1 + 32) _sanitizeBundleString:qword_1EB25B7C8];
        uint64_t v22 = (void *)qword_1EB25B7C8;
        qword_1EB25B7C8 = v21;

        id v3 = (void *)qword_1EB25B7C8;
        if (!qword_1EB25B7C8)
        {
          uint64_t v23 = [v34 objectForInfoDictionaryKey:*MEMORY[0x1E4F1CFF0]];
          uint64_t v24 = [v23 copyWithZone:0];
          char v25 = (void *)qword_1EB25B7C8;
          qword_1EB25B7C8 = v24;

          uint64_t v26 = [*(id *)(a1 + 32) _sanitizeBundleString:qword_1EB25B7C8];
          long long v27 = (void *)qword_1EB25B7C8;
          qword_1EB25B7C8 = v26;

          id v3 = (void *)qword_1EB25B7C8;
          if (!qword_1EB25B7C8)
          {
            id v28 = [v34 objectForInfoDictionaryKey:@"NSExecutable"];
            uint64_t v29 = [v28 copyWithZone:0];
            uint64_t v30 = (void *)qword_1EB25B7C8;
            qword_1EB25B7C8 = v29;

            uint64_t v31 = [*(id *)(a1 + 32) _sanitizeBundleString:qword_1EB25B7C8];
            uint64_t v32 = (void *)qword_1EB25B7C8;
            qword_1EB25B7C8 = v31;

            id v3 = (void *)qword_1EB25B7C8;
          }
        }
      }
    }
  }
  if (![v3 length])
  {
    char v33 = (void *)qword_1EB25B7C8;
    qword_1EB25B7C8 = @"<unknown>";
  }
}

+ (id)_sanitizeBundleString:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v5 = [v3 stringByTrimmingCharactersInSet:v4];

    if ([v5 length]) {
      goto LABEL_5;
    }
  }
  id v5 = 0;
LABEL_5:

  return v5;
}

uint64_t __45__UIApplication__supportsIndirectInputEvents__block_invoke(uint64_t a1)
{
  uint64_t result = _UIApplicationSupportsIndirectInputEventsGivenInfo(*(void **)(*(void *)(a1 + 32) + 232));
  byte_1EB25B4FE = result;
  return result;
}

- (UIApplication)init
{
  v44.receiver = self;
  v44.super_class = (Class)UIApplication;
  id v3 = [(UIApplication *)&v44 init];
  BOOL v4 = v3;
  if (v3)
  {
    if ((UIApplication *)UIApp != v3)
    {
      char v43 = [MEMORY[0x1E4F28B00] currentHandler];
      [v43 handleFailureInMethod:a2 object:v4 file:@"UIApplication.m" lineNumber:1564 description:@"There can only be one UIApplication instance."];
    }
    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    keyCommandRegistrationAssertions = v4->_keyCommandRegistrationAssertions;
    v4->_keyCommandRegistrationAssertions = v5;

    int v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    keyUpKeyCommandMap = v4->_keyUpKeyCommandMap;
    v4->_keyUpKeyCommandMap = v7;

    uint64_t v9 = objc_alloc_init(_UIKeyboardHIDEventOrderedDescriptorSet);
    physicalKeycodeSet = v4->_physicalKeycodeSet;
    v4->_physicalKeycodeSet = v9;

    *((void *)&v4->_applicationFlags + 1) = *((void *)&v4->_applicationFlags + 1) & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)(NSVersionOfLinkTimeLibrary("UIKit") == -1) << 16);
    uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    postCommitActions = v4->_postCommitActions;
    v4->_postCommitActions = v11;

    double v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    idleTimerDisabledReasons = v4->_idleTimerDisabledReasons;
    v4->_idleTimerDisabledReasons = v13;

    *(void *)&v4->_applicationFlags |= 0x1000000uLL;
    uint64_t v15 = _UIKitPreferencesOnce();
    __jetsamDisabled = [v15 _BOOLForKey:@"JetsamDisabled"];

    uint64_t v16 = objc_alloc_init(UIGestureEnvironment);
    gestureEnvironment = v4->__gestureEnvironment;
    v4->__gestureEnvironment = v16;

    uint64_t v18 = objc_alloc_init(UIGestureDelayedEventComponentDispatcher);
    gestureDelayedEventComponentDispatcher = v4->__gestureDelayedEventComponentDispatcher;
    v4->__gestureDelayedEventComponentDispatcher = v18;

    char v20 = [[UIEventDispatcher alloc] initWithApplication:v4];
    eventDispatcher = v4->_eventDispatcher;
    v4->_eventDispatcher = v20;

    [(UIApplication *)v4 setApplicationSupportsShakeToEdit:1];
    uint64_t v22 = [[UIActivityContinuationManager alloc] initWithApplicationContext:v4];
    activityContinuationManager = v4->_activityContinuationManager;
    v4->_activityContinuationManager = v22;

    uint64_t v24 = +[_UIApplicationInfoParser mainBundleInfoParser];
    appInfo = v4->_appInfo;
    v4->_appInfo = (_UIApplicationInfoParser *)v24;

    [(UIApplication *)v4 _supportsIndirectInputEvents];
    [(UIApplication *)v4 _deactivateForReason:10 notify:0];
    [(UIApplication *)v4 _fetchInfoPlistFlags];
    [(UIApplication *)v4 _setIdleModeVisualEffectsEnabled:(byte_1EB257814 != 0) & ~_UIInternalPreferenceUsesDefault(&_MergedGlobals_142, @"AssumeApplicationSupportsIdleMode", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool)];
    uint64_t v26 = (void *)MEMORY[0x1E4F62898];
    long long v27 = [MEMORY[0x1E4F629E0] serviceName];
    uint64_t v28 = [v26 monitorForService:v27];
    endpointMonitor = v4->_endpointMonitor;
    v4->_endpointMonitor = (BSServiceConnectionEndpointMonitor *)v28;

    [(BSServiceConnectionEndpointMonitor *)v4->_endpointMonitor activate];
    uint64_t v30 = (objc_class *)objc_opt_class();
    IMP MethodImplementation = class_getMethodImplementation(v30, sel_interfaceOrientation);
    uint64_t v32 = (objc_class *)objc_opt_class();
    *((void *)&v4->_applicationFlags + 1) = *((void *)&v4->_applicationFlags + 1) & 0xFFFFF7FFFFFFFFFFLL | ((unint64_t)(MethodImplementation != class_getMethodImplementation(v32, sel_interfaceOrientation)) << 43);
    char v33 = (objc_class *)objc_opt_class();
    IMP v34 = class_getMethodImplementation(v33, sel__frontMostAppOrientation);
    char v35 = (objc_class *)objc_opt_class();
    *((void *)&v4->_applicationFlags + 1) = *((void *)&v4->_applicationFlags + 1) & 0xFFFFEFFFFFFFFFFFLL | ((unint64_t)(v34 != class_getMethodImplementation(v35, sel__frontMostAppOrientation)) << 44);
    int v36 = (objc_class *)objc_opt_class();
    IMP v37 = class_getMethodImplementation(v36, sel__createStatusBarWithRequestedStyle_orientation_hidden_);
    uint64_t v38 = (objc_class *)objc_opt_class();
    *((void *)&v4->_applicationFlags + 1) = *((void *)&v4->_applicationFlags + 1) & 0xFFEFFFFFFFFFFFFFLL | ((unint64_t)(v37 != class_getMethodImplementation(v38, sel__createStatusBarWithRequestedStyle_orientation_hidden_)) << 52);
    uint64_t v39 = [objc_alloc(MEMORY[0x1E4FB3398]) initForCurrentApplication];
    appState = v4->_appState;
    v4->_appState = (UISApplicationState *)v39;

    char v41 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v41 addObserver:v4 selector:sel__hardwareKeyboardAvailabilityChanged_ name:@"_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification" object:0];
    [v41 addObserver:v4 selector:sel__windowDidBecomeApplicationKey_ name:@"_UIWindowDidBecomeApplicationKeyNotification" object:0];
    [v41 addObserver:v4 selector:sel__windowDidResignApplicationKey_ name:@"_UIWindowDidResignApplicationKeyNotification" object:0];
    v4->__shouldAllowContentTextContextExtraction = 1;
    [(UIApplication *)v4 _registerDefaultApplicationLevelBSActionHandlers];
  }
  _UIUpdateCycleDebugOverlaySetup();
  if (os_variant_has_internal_diagnostics()
    && (_UIInternalPreferenceUsesDefault(&dword_1EB257818, @"VisualizeUIViews", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1EB25781C)
  {
    +[UIView _setupViewVisualization]();
  }
  return v4;
}

- (void)setApplicationSupportsShakeToEdit:(BOOL)applicationSupportsShakeToEdit
{
  uint64_t v3 = 2048;
  if (!applicationSupportsShakeToEdit) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (void)_setOptOutOfRTL:(BOOL)a3
{
  self->optOutOfRTL = a3;
}

- (void)_setIdleModeVisualEffectsEnabled:(BOOL)a3
{
  uint64_t v4 = 4;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFFFFFFBLL | v4;
  id v5 = [(UIApplication *)self _mainScene];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__UIApplication__setIdleModeVisualEffectsEnabled___block_invoke;
  v6[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  BOOL v7 = a3;
  [v5 updateUIClientSettingsWithBlock:v6];
}

- (void)_registerDefaultApplicationLevelBSActionHandlers
{
  uint64_t v3 = objc_alloc_init(_UIOpenURLApplicationBSActionHandler);
  [(UIApplication *)self _registerInternalBSActionHandler:v3];
}

- (void)_registerInternalBSActionHandler:(id)a3
{
  id v4 = a3;
  internalApplicationBSActionHandlers = self->_internalApplicationBSActionHandlers;
  id v8 = v4;
  if (!internalApplicationBSActionHandlers)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v7 = self->_internalApplicationBSActionHandlers;
    self->_internalApplicationBSActionHandlers = v6;

    id v4 = v8;
    internalApplicationBSActionHandlers = self->_internalApplicationBSActionHandlers;
  }
  [(NSMutableArray *)internalApplicationBSActionHandlers addObject:v4];
}

- (void)_fetchInfoPlistFlags
{
  if (qword_1EB25B5C8 != -1) {
    dispatch_once(&qword_1EB25B5C8, &__block_literal_global_1247_0);
  }
  if (byte_1EB25B4E4)
  {
    uint64_t v3 = (void *)xpc_copy_bootstrap();
    id v4 = v3;
    if (v3) {
      xpc_dictionary_apply(v3, &__block_literal_global_1835);
    }
  }
  +[UIApplication _isClassic];
  self->_statusBarRequestedStyle = [(_UIApplicationInfoParser *)self->_appInfo requestedStatusBarStyle];
  BOOL v5 = [(_UIApplicationInfoParser *)self->_appInfo statusBarHidden];
  p_uint64_t applicationFlags = &self->_applicationFlags;
  uint64_t v7 = 0x800000;
  if (!v5) {
    uint64_t v7 = 0;
  }
  *(void *)p_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFFFFFFFF7FFFFFLL | v7;
  BOOL v8 = [(_UIApplicationInfoParser *)self->_appInfo statusBarHiddenWhenVerticallyCompact];
  uint64_t v9 = 0x1000000;
  if (!v8) {
    uint64_t v9 = 0;
  }
  *(void *)p_uint64_t applicationFlags = *(void *)p_applicationFlags & 0xFFFFFFFFFEFFFFFFLL | v9;
  BOOL v10 = [(_UIApplicationInfoParser *)self->_appInfo isExitsOnSuspend];
  unint64_t v11 = 0x4000;
  if (!v10) {
    unint64_t v11 = 0;
  }
  *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFFF3FFFLL | (((v11 >> 14) & 1) << 15) | v11;
  BOOL v12 = [(_UIApplicationInfoParser *)self->_appInfo systemWindowsSecure];
  uint64_t v13 = 0x2000000000;
  if (!v12) {
    uint64_t v13 = 0;
  }
  *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFFFFDFFFFFFFFFLL | v13;
  unint64_t v14 = [(_UIApplicationInfoParser *)self->_appInfo viewControllerBasedStatusBarAppearance];
  if (v14 == 1)
  {
    uint64_t applicationFlags = *(void *)p_applicationFlags;
    uint64_t v16 = *((void *)&self->_applicationFlags + 1);
  }
  else
  {
    if (v14 || [(UIApplication *)self _isSpringBoard])
    {
      uint64_t v15 = 0;
      uint64_t applicationFlags = (uint64_t)self->_applicationFlags;
      uint64_t v16 = *((void *)&self->_applicationFlags + 1);
      goto LABEL_23;
    }
    uint64_t v18 = objc_opt_class();
    char v19 = _UIApplicationWantsExtensionBehavior(v18);
    uint64_t applicationFlags = (uint64_t)self->_applicationFlags;
    uint64_t v16 = *((void *)&self->_applicationFlags + 1);
    if (v19)
    {
      uint64_t v15 = 0;
      goto LABEL_23;
    }
  }
  uint64_t v15 = 0x800000000;
LABEL_23:
  *(void *)&self->_uint64_t applicationFlags = applicationFlags;
  *((void *)&self->_applicationFlags + 1) = v16 & 0xFFFFFFF7FFFFFFFFLL | v15;
  [(UIApplication *)self _setAlwaysHitTestsForMainScreen:+[UIApplication _isBackgroundStyleTransparent:[(_UIApplicationInfoParser *)self->_appInfo backgroundStyle]]];
  BOOL v20 = [(_UIApplicationInfoParser *)self->_appInfo optOutOfRTL];
  [(UIApplication *)self _setOptOutOfRTL:v20];
}

- (void)_fixupBackgroundHitTestWindow
{
  BOOL v3 = [(UIApplication *)self _alwaysHitTestsForMainScreen];
  backgroundHitTestWindow = self->_backgroundHitTestWindow;
  if (v3)
  {
    if (!backgroundHitTestWindow)
    {
      BOOL v5 = [_UIBackgroundHitTestWindow alloc];
      id v6 = +[UIScreen mainScreen];
      [v6 _referenceBounds];
      uint64_t v7 = -[UIWindow initWithFrame:](v5, "initWithFrame:");
      BOOL v8 = self->_backgroundHitTestWindow;
      self->_backgroundHitTestWindow = v7;

      uint64_t v9 = [(UIView *)self->_backgroundHitTestWindow layer];
      [v9 setHitTestsAsOpaque:1];

      [(UIWindow *)self->_backgroundHitTestWindow setWindowLevel:-1.0];
      BOOL v10 = self->_backgroundHitTestWindow;
      [(UIWindow *)v10 setHidden:0];
    }
  }
  else
  {
    self->_backgroundHitTestWindow = 0;
  }
}

- (void)_setAlwaysHitTestsForMainScreen:(BOOL)a3
{
  if ([(UIApplication *)self _alwaysHitTestsForMainScreen] != a3)
  {
    self->_alwaysHitTestsForMainScreen = a3;
    BOOL v5 = [(UIApplication *)self _mainScene];

    if (v5)
    {
      [(UIApplication *)self _fixupBackgroundHitTestWindow];
    }
  }
}

- (BOOL)_alwaysHitTestsForMainScreen
{
  return self->_alwaysHitTestsForMainScreen;
}

+ (BOOL)_isBackgroundStyleTransparent:(int64_t)a3
{
  return a3 != 0;
}

+ (id)stringForStatusBarStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id result = @"UIStatusBarStyleDefault";
      break;
    case 1:
      id result = @"UIStatusBarStyleLightContent";
      break;
    case 2:
      id result = @"UIStatusBarStyleOpaqueBlack";
      break;
    case 3:
      id result = @"UIStatusBarStyleDarkContent";
      break;
    default:
      if (a3 == 306) {
        id result = @"UIStatusBarStyleNewUILockScreen";
      }
      else {
        id result = 0;
      }
      break;
  }
  return result;
}

void __76__UIApplication_UIKitApplicationAccessibility___updateLargeTextNotification__block_invoke()
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFStringRef v1 = (const __CFString *)*MEMORY[0x1E4FB9238];
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_preferredFontSizeChange, v1, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_configureLaunchOptions:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v14 = v3;
    id v4 = [MEMORY[0x1E4F28F80] processInfo];
    BOOL v5 = [v4 environment];

    id v6 = [v5 objectForKey:@"__PPT_ForTesting"];

    if (!v6) {
      __IsRunningTests = [v14 forTesting];
    }
    uint64_t v7 = [v5 objectForKey:@"__PPT_SignpostID"];

    if (!v7) {
      __ActivationSignpostID = [v14 signpostID];
    }
    BOOL v8 = [v5 objectForKey:@"__PPT_LaunchMetricsPayload"];

    if (!v8)
    {
      uint64_t v9 = [v14 launchMetricsPayload];
      BOOL v10 = (void *)__ActivationMetricsPayload;
      __ActivationMetricsPayload = v9;
    }
    unint64_t v11 = [v5 objectForKey:@"__PPT_LaunchTime"];

    if (!v11)
    {
      [v14 userLaunchEventTime];
      __LaunchTime = v12;
      [v14 execTime];
      __ExecOrResumeTime = v13;
    }
    byte_1EB25B4D9 = [v14 safeMode];

    id v3 = v14;
  }
}

- (void)setWantsVolumeButtonEvents:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  id v4 = (void (*)(BOOL))getSBSUIAppSetWantsVolumeButtonEventsSymbolLoc_ptr;
  unint64_t v11 = getSBSUIAppSetWantsVolumeButtonEventsSymbolLoc_ptr;
  if (!getSBSUIAppSetWantsVolumeButtonEventsSymbolLoc_ptr)
  {
    BOOL v5 = SpringBoardServicesLibrary_1();
    v9[3] = (uint64_t)dlsym(v5, "SBSUIAppSetWantsVolumeButtonEvents");
    getSBSUIAppSetWantsVolumeButtonEventsSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    id v4 = (void (*)(BOOL))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v4)
  {
    v4(v3);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"void softlink_SBSUIAppSetWantsVolumeButtonEvents(BOOL)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"UIApplication.m", 484, @"%s", dlerror());

    __break(1u);
  }
}

- (void)setShortcutItems:(NSArray *)shortcutItems
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = shortcutItems;
  BOOL v5 = [(UIApplication *)self shortcutService];

  if (!v5)
  {
    id v6 = objc_alloc_init((Class)getSBSApplicationShortcutServiceClass());
    [(UIApplication *)self setShortcutService:v6];
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = v4;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "sbsShortcutItem", (void)v15);
        if (v13) {
          [v7 addObject:v13];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  id v14 = [(UIApplication *)self shortcutService];
  [v14 updateDynamicApplicationShortcutItems:v7 forBundleIdentifier:0];
}

- (SBSApplicationShortcutService)shortcutService
{
  return self->_shortcutService;
}

- (NSArray)shortcutItems
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIApplication *)self shortcutService];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)getSBSApplicationShortcutServiceClass());
    [(UIApplication *)self setShortcutService:v4];
  }
  BOOL v5 = [(UIApplication *)self shortcutService];
  id v6 = [v5 applicationShortcutItemsOfTypes:2 forBundleIdentifier:0];

  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = objc_msgSend(v6, "dynamicApplicationShortcutItems", 0);
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
        uint64_t v13 = [[UIApplicationShortcutItem alloc] initWithSBSApplicationShortcutItem:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return (NSArray *)v7;
}

- (void)_reportResults:(id)a3
{
  id v23 = a3;
  [(UIApplication *)self _sendDictionaryToPPT:v23];
  uint64_t v4 = [v23 objectForKey:@"testName"];
  BOOL v5 = (void *)v4;
  id v6 = &stru_1ED0E84C0;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  uint64_t v7 = v6;

  uint64_t v8 = getenv("PPT_SERIALIZE_RESULTS");
  if (v8 && !strcmp(v8, "1"))
  {
    if (!_reportResults____dateFormatter)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      uint64_t v10 = (void *)_reportResults____dateFormatter;
      _reportResults____dateFormatter = (uint64_t)v9;

      [(id)_reportResults____dateFormatter setDateFormat:@"yyyy-MM-dd-HHmmss"];
    }
    uint64_t v11 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v12 = [v11 executablePath];
    uint64_t v13 = [v12 lastPathComponent];

    id v14 = NSString;
    long long v15 = (void *)_reportResults____dateFormatter;
    long long v16 = [MEMORY[0x1E4F1C9C8] date];
    long long v17 = [v15 stringFromDate:v16];
    long long v18 = [v14 stringWithFormat:@"%@-%@-%@.plist", v13, v7, v17];

    char v19 = NSTemporaryDirectory();
    uint64_t v20 = [v19 stringByAppendingPathComponent:v18];

    [v23 writeToFile:v20 atomically:1];
    NSLog(&cfstr_WroteTestResul.isa, v20);
  }
  uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v7, @"testName", v23, @"testResults", 0);
  [v21 postNotificationName:@"UIApplicationTestingTestFinishedNotification" object:self userInfo:v22];
}

- (void)_sendDictionaryToPPT:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(UIApplication *)self _purplePPTServerPort];
  if (v5)
  {
    id v6 = v5;
    id v17 = 0;
    CFDataRef v7 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v17];
    id v8 = v17;
    id v9 = v8;
    if (v7) {
      goto LABEL_6;
    }
    uint64_t v10 = @"UIKit failed to generate the result payload";
    if (v8)
    {
      uint64_t v11 = NSString;
      uint64_t v12 = [v8 localizedDescription];
      [v11 stringWithFormat:@"%@. Serialization Error=%@", @"UIKit failed to generate the result payload", v12];
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v10, @"payloadGenerationError", 0);
    CFDataRef v7 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v13 format:200 options:0 error:0];

    if (v7)
    {
LABEL_6:
      SInt32 v14 = CFMessagePortSendRequest(v6, 0, v7, 0.0, 0.0, 0, 0);
      long long v15 = _pptLogHandle();
      long long v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)timespec buf = 67109120;
          SInt32 v19 = v14;
          _os_log_error_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Error sending test results to PPT. (CFMessagePortSendRequest error: %d)", buf, 8u);
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)timespec buf = 0;
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, "Sent test results to PPT.", buf, 2u);
      }
    }
  }
}

- (__CFMessagePort)_purplePPTServerPort
{
  if (_purplePPTServerPort_purplePPTServerPort)
  {
    int IsValid = CFMessagePortIsValid((CFMessagePortRef)_purplePPTServerPort_purplePPTServerPort);
    id result = (__CFMessagePort *)_purplePPTServerPort_purplePPTServerPort;
    if (IsValid) {
      return result;
    }
    if (_purplePPTServerPort_purplePPTServerPort) {
      CFRelease((CFTypeRef)_purplePPTServerPort_purplePPTServerPort);
    }
  }
  id result = CFMessagePortCreateRemote((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"PurplePPTServer");
  _purplePPTServerPort_purplePPTServerPort = (uint64_t)result;
  if (!result)
  {
    id v4 = _pptLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_error_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Error creating the CFMessagePort needed to communicate with PPT.", v5, 2u);
    }

    return (__CFMessagePort *)_purplePPTServerPort_purplePPTServerPort;
  }
  return result;
}

- (void)setShortcutService:(id)a3
{
}

- (void)_synchronizeSystemAnimationFencesWithSpinCleanUpBlock:(id)a3
{
  id v5 = a3;
  if (pthread_main_np() != 1)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UIApplication.m" lineNumber:3211 description:@"Call must be made on main thread"];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__UIApplication__synchronizeSystemAnimationFencesWithSpinCleanUpBlock___block_invoke;
  aBlock[3] = &unk_1E52EDA60;
  id v6 = v5;
  void aBlock[4] = self;
  id v16 = v6;
  CFDataRef v7 = (void (**)(void *, void))_Block_copy(aBlock);
  int v8 = __caCommitState;
  id v9 = [(UIApplication *)self _fenceProvider];
  uint64_t v10 = v9;
  if (v8 == 1)
  {
    int v11 = [v9 isTrackingAnySystemAnimationFence];

    if (v11)
    {
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Fence", &_synchronizeSystemAnimationFencesWithSpinCleanUpBlock____s_category)+ 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)SInt32 v14 = 0;
          _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, " *|synchronize-skip|* a fence was started inside of a snapshot block - skipping the workspace synchronize because it may dequeue messages from the fenceExemptQueue and snapshots expect that not to happen", v14, 2u);
        }
      }
    }
    v7[2](v7, 0);
  }
  else
  {
    [v9 synchronizeSystemAnimationFencesWithCleanUpBlock:v7];
  }
}

void __71__UIApplication__synchronizeSystemAnimationFencesWithSpinCleanUpBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  [*(id *)(*(void *)(a1 + 32) + 320) invalidate];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 320);
  *(void *)(v3 + 320) = 0;
}

- (int64_t)_defaultSceneInterfaceOrientationReturningUnknownForNilScene:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIApplication *)self _appAdoptsUISceneLifecycle]) {
    return !v3;
  }
  id v4 = [(id)UIApp _defaultUISceneOrMainScreenPlaceholderIfExists];
  id v5 = [v4 _hostsWindows] ? v4 : 0;
  id v6 = v5;

  if (!v6) {
    return !v3;
  }
  int64_t v7 = [v6 _interfaceOrientation];

  return v7;
}

void __49__UIApplication__systemAnimationFenceExemptQueue__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F62AC8];
  v4[0] = *MEMORY[0x1E4F1D410];
  CFStringRef v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 queueWithMainRunLoopModes:v1];
  BOOL v3 = (void *)qword_1EB25B5A8;
  qword_1EB25B5A8 = v2;
}

- (void)finishedTest:(id)a3 waitForCommit:(BOOL)a4 extraResults:(id)a5 withTeardownBlock:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __97__UIApplication_UIApplicationTesting__finishedTest_waitForCommit_extraResults_withTeardownBlock___block_invoke;
    v13[3] = &unk_1E52DC7E8;
    v13[4] = self;
    id v14 = v10;
    id v15 = v11;
    id v16 = v12;
    [(UIApplication *)self installCACommitCompletionBlock:v13];
  }
  else
  {
    [(UIApplication *)self finishedTest:v10 extraResults:v11 waitForNotification:0 withTeardownBlock:v12];
  }
}

- (void)installCACommitCompletionBlock:(id)a3
{
  context.version = 0;
  context.info = _Block_copy(a3);
  memset(&context.retain, 0, 24);
  CFRunLoopObserverRef v3 = CFRunLoopObserverCreate(0, 0x20uLL, 0, 2000001, (CFRunLoopObserverCallBack)__UIRunLoopObserverTrampoline, &context);
  if (v3)
  {
    id v4 = v3;
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    CFRunLoopAddObserver(Current, v4, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    info = v4;
  }
  else
  {
    info = context.info;
  }
  CFRelease(info);
}

- (void)finishedTest:(id)a3 waitForCommit:(BOOL)a4 extraResults:(id)a5
{
}

- (id)_discardedSceneSessionIdentifiersSinceLastRunWithContext:(id)a3 knownSessions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = [v5 persistedSceneIdentifiers];

  if (v7)
  {
    BOOL v8 = (void *)MEMORY[0x1E4F1CA80];
    id v9 = [v6 allKeys];
    id v10 = (void *)[v9 copy];
    id v11 = [v8 setWithArray:v10];

    id v12 = [v5 persistedSceneIdentifiers];
    uint64_t v13 = (void *)[v12 copy];

    [v11 minusSet:v13];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }

  return v11;
}

- (void)_discardSceneSessionsWithPersistentIdentifiers:(id)a3 skippingPersistenceDeletion:(BOOL)a4
{
  id v9 = a3;
  uint64_t v6 = [v9 count];
  int64_t v7 = v9;
  if (v6)
  {
    BOOL v8 = objc_msgSend(v9, "bs_map:", &__block_literal_global_3622);
    [(UIApplication *)self _discardSceneSessions:v8];
    if (!a4) {
      +[_UICanvasUserActivityManager _deleteSceneSessionsWithPersistentIdentifiers:v9];
    }

    int64_t v7 = v9;
  }
}

- (void)_discardSceneSessions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [MEMORY[0x1E4F1CA80] setWithSet:v4];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __72__UIApplication_SessionAndConfigurationInternal___discardSceneSessions___block_invoke;
    id v10 = &unk_1E5302EE0;
    id v11 = self;
    id v6 = v5;
    id v12 = v6;
    [v4 enumerateObjectsUsingBlock:&v7];
    if ((*((unsigned char *)&self->_applicationFlags + 8) & 2) != 0 && objc_msgSend(v6, "count", v7, v8, v9, v10, v11)) {
      [(UIApplicationDelegate *)self->_delegate application:self didDiscardSceneSessions:v6];
    }
  }
}

- (void)_compellApplicationLaunchToCompleteUnconditionally
{
  id v2 = +[_UISceneLifecycleMultiplexer sharedInstance];
  [v2 completeApplicationLaunchWithFBSScene:0 transitionContext:0];
}

- (UIBackgroundTaskIdentifier)beginBackgroundTaskWithExpirationHandler:(void *)handler
{
  return _UIApplicationBeginBackgroundTaskWithExpirationHandler(handler, 0);
}

- (BOOL)isRunningTest:(id)a3
{
  if (!a3) {
    return 0;
  }
  CFRunLoopObserverRef v3 = objc_msgSend((id)qword_1EB264600, "objectForKey:");
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __43__UIApplication__appAdoptsUISceneLifecycle__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 count];
  if (result)
  {
    byte_1EB25B4DD = 1;
    *a4 = 1;
  }
  return result;
}

+ (Class)_statusBarManagerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_isClassic
{
  return +[UIApplication _isClassic];
}

- (void)finishedTest:(id)a3
{
}

- (id)_hoverEventForWindow:(id)a3
{
  return -[UIEventEnvironment _hoverEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (int)_loadMainInterfaceFile
{
  CFRunLoopObserverRef v3 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v4 = [v3 infoDictionary];
  id v5 = [v4 objectForKey:@"NSMainNibFile"];

  id v6 = [(UIApplication *)self _mainStoryboardName];
  uint64_t v7 = [v5 length];
  BOOL v8 = [(UIApplication *)self _hasStoryboard];
  BOOL v9 = v8;
  if (v7) {
    BOOL v10 = !v8;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    NSLog(&cfstr_NsmainnibfileA.isa);
    if (!v9) {
      goto LABEL_9;
    }
LABEL_7:
    int v11 = [(UIApplication *)self _loadMainStoryboardFileNamed:v6 bundle:v3];
    goto LABEL_11;
  }
  if (v8) {
    goto LABEL_7;
  }
LABEL_9:
  if (!v7)
  {
    int v12 = 2;
    goto LABEL_13;
  }
  int v11 = [(UIApplication *)self _loadMainNibFileNamed:v5 bundle:v3];
LABEL_11:
  int v12 = v11;
LABEL_13:

  return v12;
}

- (void)_callInitializationDelegatesWithActions:(id)a3 forCanvas:(id)a4 payload:(id)a5 fromOriginatingProcess:(id)a6
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v86 = a3;
  id v83 = a4;
  id v9 = a5;
  id v88 = a6;
  BOOL v10 = [MEMORY[0x1E4F1CA80] set];
  int v11 = [MEMORY[0x1E4F1CA80] setWithSet:v86];
  [v11 unionSet:self->_actionsPendingInitialization];
  actionsPendingInitialization = self->_actionsPendingInitialization;
  self->_actionsPendingInitialization = 0;

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  obuint64_t j = v11;
  uint64_t v13 = [obj countByEnumeratingWithState:&v113 objects:v119 count:16];
  if (v13)
  {
    id v96 = 0;
    double v97 = 0;
    id v92 = 0;
    id v93 = 0;
    id v90 = 0;
    id v91 = 0;
    id v94 = 0;
    double v95 = 0;
    id v98 = 0;
    v99 = 0;
    id v100 = 0;
    id v14 = 0;
    uint64_t v15 = *(void *)v114;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v114 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v113 + 1) + 8 * i);
        uint64_t v18 = [v17 UIActionType];
        switch(v18)
        {
          case 1:
            if (v14) {
              goto LABEL_29;
            }
            id v14 = v17;
            continue;
          case 2:
          case 4:
          case 7:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 15:
          case 18:
          case 19:
          case 20:
          case 21:
          case 22:
          case 24:
          case 25:
            goto LABEL_29;
          case 3:
            if (v94) {
              goto LABEL_29;
            }
            id v94 = v17;
            break;
          case 5:
            uint64_t v21 = [v17 sessionIdentifier];

            [v10 addObject:v17];
            double v97 = (void *)v21;
            continue;
          case 6:
            if (v92) {
              goto LABEL_29;
            }
            id v23 = [v9 objectForKey:@"UIApplicationLaunchOptionsSourceApplicationKey"];
            if (!v23)
            {
              id v23 = [v88 bundleIdentifier];
            }
            id v92 = [(UIActivityContinuationManager *)self->_activityContinuationManager activityContinuationDictionaryWithAction:v17 sourceApplication:v23 originatingProcess:v88];

            break;
          case 8:
            id v20 = v17;

            id v100 = v20;
            continue;
          case 14:
            id v22 = v17;

            id v98 = v22;
            continue;
          case 16:
            id v19 = v17;

            v99 = v19;
            continue;
          case 17:
            if (v93) {
              goto LABEL_29;
            }
            id v93 = v17;
            break;
          case 23:
            if (v95) {
              goto LABEL_29;
            }
            double v95 = [v17 shareMetadata];
            break;
          case 26:
            [v10 addObject:v17];
            if (!v96)
            {
              if ([v17 isDefaultAction]) {
                id v96 = v17;
              }
              else {
                id v96 = 0;
              }
            }
            continue;
          case 27:
            if (v91) {
              goto LABEL_29;
            }
            id v91 = v17;
            break;
          default:
            if (v18 == 43 && !v90) {
              id v90 = v17;
            }
            else {
LABEL_29:
            }
              [v10 addObject:v17];
            break;
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v113 objects:v119 count:16];
    }
    while (v13);

    uint64_t v24 = v14;
    if (v14) {
      goto LABEL_48;
    }
  }
  else
  {

    v99 = 0;
    id v100 = 0;
    double v97 = 0;
    id v98 = 0;
    id v94 = 0;
    double v95 = 0;
    id v96 = 0;
    id v90 = 0;
    id v91 = 0;
    id v92 = 0;
    id v93 = 0;
  }
  char v25 = [v9 objectForKey:@"UIApplicationLaunchOptionsURLKey"];
  if (!v25
    || (uint64_t v26 = [UIOpenURLAction alloc],
        [MEMORY[0x1E4F1CB10] URLWithString:v25 encodingInvalidCharacters:0],
        long long v27 = objc_claimAutoreleasedReturnValue(),
        uint64_t v28 = [(UISOpenURLAction *)v26 initWithURL:v27],
        v27,
        v25,
        !v28))
  {
    char v82 = 0;
    char v30 = 1;
    goto LABEL_50;
  }
  uint64_t v24 = (void *)v28;
LABEL_48:
  char v82 = v24;
  uint64_t v29 = [v24 url];
  -[UIApplication _setHandlingURL:url:](self, "_setHandlingURL:url:", [v29 isInternalUIKitURL] ^ 1, v29);

  char v30 = 0;
LABEL_50:
  uint64_t v107 = 0;
  char v108 = &v107;
  uint64_t v109 = 0x3032000000;
  id v110 = __Block_byref_object_copy__164;
  id v111 = __Block_byref_object_dispose__164;
  id v112 = 0;
  char v80 = v30;
  if ((v30 & 1) == 0 && (*((unsigned char *)&self->_applicationFlags + 4) & 8) == 0)
  {
    uint64_t v31 = (void *)MEMORY[0x1E4F1CA60];
    id v32 = v82;
    char v33 = [v31 dictionaryWithDictionary:v9];
    [v33 removeObjectForKey:@"UIApplicationLaunchOptionsURLKey"];
    IMP v34 = [v32 url];

    char v35 = [v34 searchResultIdentifier];
    if (v35)
    {
      [v33 setValue:v35 forKey:@"UIApplicationLaunchOptionsSearchResultIdentifierKey"];
      int v36 = [v34 searchResultDomain];
      if (v36) {
        [v33 setValue:v36 forKey:@"UIApplicationLaunchOptionsSearchResultDomainKey"];
      }
    }
    else
    {
      [v33 setValue:v34 forKey:@"UIApplicationLaunchOptionsURLKey"];
    }

    IMP v37 = (void *)v108[5];
    v108[5] = (uint64_t)v33;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__UIApplication__callInitializationDelegatesWithActions_forCanvas_payload_fromOriginatingProcess___block_invoke;
  aBlock[3] = &unk_1E52DE488;
  void aBlock[4] = &v107;
  uint64_t v38 = (void (**)(void *, void *, __CFString *))_Block_copy(aBlock);
  if (v96)
  {
    if ([v96 isLocal])
    {
      uint64_t v39 = [v96 response];
      uint64_t v40 = (void (**)(uint64_t, void *))UNNotificationToUILocalNotification;
      char v41 = [v39 notification];
      __int16 v42 = v40[2]((uint64_t)v40, v41);

      v38[2](v38, v42, @"UIApplicationLaunchOptionsLocalNotificationKey");
    }
    else
    {
      if (![v96 isRemote]) {
        goto LABEL_64;
      }
      uint64_t v39 = [v96 response];
      char v43 = [v39 notification];
      objc_super v44 = [v43 request];
      BOOL v45 = [v44 content];
      __int16 v42 = [v45 userInfo];

      v38[2](v38, v42, @"UIApplicationLaunchOptionsRemoteNotificationKey");
    }
  }
LABEL_64:
  v38[2](v38, v92, @"UIApplicationLaunchOptionsUserActivityDictionaryKey");
  char v46 = [v94 payload];
  v38[2](v38, v46, @"UIApplicationLaunchOptionsRemoteNotificationKey");

  uint64_t v47 = [v100 payload];
  v38[2](v38, v47, @"UIApplicationLaunchOptionsSiriTaskKey");

  v38[2](v38, v97, @"UIApplicationLaunchOptionsURLSessionKey");
  v38[2](v38, v95, @"UIApplicationLaunchOptionsCloudKitShareMetadataKey");
  char v48 = [v93 uiShortcutItem];
  v38[2](v38, v48, @"UIApplicationLaunchOptionsShortcutItemKey");

  uint64_t v85 = [v9 objectForKey:@"UIApplicationLaunchOptionsEventAttributionKey"];
  id v49 = [[UIEventAttribution alloc] initWithUISClickAttribution:v85];
  v38[2](v38, v49, @"UIApplicationLaunchOptionsEventAttributionKey");

  v118[0] = @"UIApplicationLaunchOptionsSourceApplicationKey";
  v118[1] = @"UIApplicationLaunchOptionsNewsstandDownloadsKey";
  v118[2] = @"UIApplicationLaunchOptionsBluetoothCentralsKey";
  v118[3] = @"UIApplicationLaunchOptionsBluetoothPeripheralsKey";
  v118[4] = @"UIApplicationLaunchOptionsDeletedFamilyContentKey";
  v118[5] = @"UIApplicationLaunchOptionsBrowserReuseTabKey";
  v118[6] = @"UIApplicationLaunchOptionsAppLinkOpenStrategyChangedKey";
  v118[7] = @"_UIApplicationLaunchOptionsOpenAsDownload";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:8];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v50 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v51 = [v50 countByEnumeratingWithState:&v102 objects:v117 count:16];
  if (v51)
  {
    uint64_t v52 = *(void *)v103;
    do
    {
      for (uint64_t j = 0; j != v51; ++j)
      {
        if (*(void *)v103 != v52) {
          objc_enumerationMutation(v50);
        }
        char v54 = *(__CFString **)(*((void *)&v102 + 1) + 8 * j);
        unint64_t v55 = [v9 objectForKey:v54];
        v38[2](v38, v55, v54);
      }
      uint64_t v51 = [v50 countByEnumeratingWithState:&v102 objects:v117 count:16];
    }
    while (v51);
  }

  char v56 = [v9 objectForKey:@"CLLaunchOptionsLocation"];

  if (v56)
  {
    uint64_t v57 = (void *)v108[5];
    if (v57)
    {
      [v57 removeObjectForKey:@"CLLaunchOptionsLocation"];
    }
    else
    {
      uint64_t v58 = [MEMORY[0x1E4F1CA60] dictionary];
      int v59 = (void *)v108[5];
      v108[5] = v58;
    }
    long long v60 = (void *)v108[5];
    uint64_t v61 = [NSNumber numberWithBool:1];
    [v60 setValue:v61 forKey:@"UIApplicationLaunchOptionsLocationKey"];
  }
  long long v62 = +[FBSSceneTransitionContext transitionContext];
  [v62 setActions:v86];
  [v62 setPayload:v9];
  [v62 setOriginatingProcess:v88];
  [(UIApplication *)self registerPlatformSpecificLaunchOptions:v38 transitionContext:v62];
  uint64_t applicationFlags = (uint64_t)self->_applicationFlags;
  int v64 = [(id)objc_opt_class() _isSystemUIService];
  BOOL v84 = [(UIApplication *)self isSuspended];
  unsigned int v81 = v64 ^ 1;
  if ((applicationFlags & 0x180000) != 0)
  {
    int v79 = 0;
    int v87 = 1;
    if ((applicationFlags & 0x80000) != 0) {
      goto LABEL_97;
    }
    goto LABEL_89;
  }
  if (v84)
  {
    if (objc_opt_respondsToSelector())
    {
      kdebug_trace();
      [(UIApplicationDelegate *)self->_delegate application:self didFinishLaunchingSuspendedWithOptions:v108[5]];
      kdebug_trace();
      int v87 = 1;
      uint64_t v65 = 1310720;
      int v79 = 1;
LABEL_84:
      uint64_t v66 = *((void *)&self->_applicationFlags + 1);
      *(void *)&self->_applicationFlags |= v65;
      *((void *)&self->_applicationFlags + 1) = v66;
      goto LABEL_89;
    }
    if (objc_opt_respondsToSelector())
    {
      [(UIApplication *)self performSelector:sel_applicationDidFinishLaunchingSuspended_ withObject:self];
      int v79 = 0;
      int v87 = 1;
      uint64_t v65 = 1310720;
      goto LABEL_84;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    int v87 = [(UIApplication *)self _handleDelegateCallbacksWithOptions:v108[5] isSuspended:v84 restoreState:v81];
    unsigned int v81 = 0;
    int v79 = 1;
    goto LABEL_89;
  }
  if (objc_opt_respondsToSelector())
  {
    int v87 = [(UIApplication *)self _handleDelegateCallbacksWithOptions:v108[5] isSuspended:v84 restoreState:v81];
    unsigned int v81 = 0;
    int v79 = 0;
    goto LABEL_89;
  }
  if (objc_opt_respondsToSelector())
  {
    if (![(UIApplication *)self _hasStoryboard]) {
      *((void *)&self->_applicationFlags + 1) |= 0x10000000uLL;
    }
    int v87 = [(UIApplication *)self application:self didFinishLaunchingWithOptions:v108[5]];
    if (v84) {
      [(UIApplication *)self applicationWillSuspend];
    }
    int v79 = 0;
LABEL_170:
    uint64_t v65 = 0x80000;
    goto LABEL_84;
  }
  if (objc_opt_respondsToSelector())
  {
    if (![(UIApplication *)self _hasStoryboard]) {
      *((void *)&self->_applicationFlags + 1) |= 0x10000000uLL;
    }
    -[UIApplication performSelector:withObject:](self, "performSelector:withObject:", sel_applicationDidFinishLaunching_);
    if (v84) {
      [(UIApplication *)self applicationWillSuspend];
    }
    int v79 = 0;
    int v87 = 1;
    goto LABEL_170;
  }
  int v79 = 0;
  int v87 = 1;
LABEL_89:
  if ([(UIApplication *)self _hasStoryboard])
  {
    if (objc_opt_respondsToSelector())
    {
      long long v67 = [(UIApplicationDelegate *)self->_delegate window];
      int v68 = [v67 isHidden];

      if (v68)
      {
        *(void *)&self->_applicationFlags &= ~0x80000uLL;
        long long v69 = [(UIApplicationDelegate *)self->_delegate window];
        [v69 makeKeyAndVisible];

        *(void *)&self->_applicationFlags |= 0x80000uLL;
      }
    }
  }
  if (v81 && [(UIApplication *)self _doRestorationIfNecessary]) {
    _decrementRestorationMarkerCount(self, 0);
  }
  id v70 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v70 postNotificationName:@"UIApplicationDidFinishLaunchingNotification" object:self userInfo:v108[5]];

  -[UIEventFetcher setEventFetcherSink:]((uint64_t)self->_eventFetcher, self->_eventDispatcher);
LABEL_97:
  +[UIWindow _executeDeferredOrientationUpdates]();
  if (v84)
  {
    uint64_t v71 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v71 postNotificationName:@"UIApplicationSuspendedNotification" object:self userInfo:0];
  }
  if ((v80 & 1) == 0)
  {
    if (v87)
    {
      id v72 = v88;
      if (!v72)
      {
        id v72 = [v82 workspaceOriginatingProcess];
      }
      [(UIApplication *)self _applicationOpenURLAction:v82 payload:v9 origin:v72];
    }
    [(UIApplication *)self _setHandlingURL:0 url:0];
  }
  if (v100)
  {
    int v73 = [v100 payload];
    [(UIApplication *)self _applicationHandleSiriTask:v73];
  }
  if (v98) {
    [(UIApplication *)self _applicationHandleWatchKitRequest:v98];
  }
  if (v91) {
    [(UIApplication *)self _applicationHandleIntentForwardingAction:v91];
  }
  if (v90) {
    [(UIApplication *)self _applicationHandleLinkConnectionAction:v90];
  }
  if (v99) {
    [(UIApplication *)self _setSystemNavigationAction:v99];
  }
  if (v92)
  {
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SCheckingToSee.isa, "-[UIApplication _callInitializationDelegatesWithActions:forCanvas:payload:fromOriginatingProcess:]");
    }
    if (v87)
    {
      [(UIActivityContinuationManager *)self->_activityContinuationManager handleActivityContinuation:v92 isSuspended:v84];
    }
    else if (_UIStateRestorationDebugLogEnabled())
    {
      NSLog(&cfstr_SApplicationDe.isa, "-[UIApplication _callInitializationDelegatesWithActions:forCanvas:payload:fromOriginatingProcess:]");
    }
  }
  if (v96)
  {
    int v74 = [MEMORY[0x1E4F44680] currentNotificationCenter];
    uint64_t v75 = [v74 delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if (![v96 isLocal])
      {
        if (![v96 isRemote]) {
          goto LABEL_132;
        }
        if (!v79 || (objc_opt_respondsToSelector() & 1) != 0)
        {
          if ([v96 canSendResponse]) {
            [v96 sendResponse:0];
          }
          goto LABEL_132;
        }
        goto LABEL_126;
      }
      if (v79) {
LABEL_126:
      }
        [v10 removeObject:v96];
    }
LABEL_132:
  }
  if (v94)
  {
    if (v79 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      if ([v94 canSendResponse])
      {
        v78 = [MEMORY[0x1E4FB33F0] responseWithResult:1];
        [v94 sendResponse:v78];
      }
    }
    else
    {
      [v10 addObject:v94];
    }
  }
  if (v93) {
    int v76 = v87;
  }
  else {
    int v76 = 0;
  }
  if (v76 == 1) {
    [(UIApplication *)self _handleApplicationShortcutAction:v93 onWindowScene:v83];
  }
  if (v95) {
    int v77 = v87;
  }
  else {
    int v77 = 0;
  }
  if (v77 == 1)
  {
    NSLog(&cfstr_SHandlingCloud.isa, "-[UIApplication _callInitializationDelegatesWithActions:forCanvas:payload:fromOriginatingProcess:]", v95);
    if (objc_opt_respondsToSelector())
    {
      [(UIApplicationDelegate *)self->_delegate application:self userDidAcceptCloudKitShareWithMetadata:v95];
    }
    else if (objc_opt_respondsToSelector())
    {
      [(UIApplicationDelegate *)self->_delegate application:self userAcceptedCloudKitShareWithMetadata:v95];
    }
  }
  [(UIApplication *)self _handleNonLaunchSpecificActions:v10 forScene:0 withTransitionContext:0 completion:0];
  if (([(id)UIApp _appAdoptsUICanvasLifecycle] & 1) == 0
    && ([(id)UIApp _appAdoptsUISceneLifecycle] & 1) == 0)
  {
    [(UIApplication *)self _checkActivityContinuationAndBecomeCurrentIfNeeded];
  }

  _Block_object_dispose(&v107, 8);
}

void __98__UIApplication__callInitializationDelegatesWithActions_forCanvas_payload_fromOriginatingProcess___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v6 setValue:v10 forKey:v5];
  }
}

- (BOOL)_appAdoptsUICanvasLifecycle
{
  return *((unsigned __int8 *)&self->_applicationFlags + 7) >> 7;
}

- (BOOL)_hasStoryboard
{
  id v2 = [(UIApplication *)self _mainStoryboardName];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)_mainStoryboardName
{
  mainStoryboardName = self->_mainStoryboardName;
  if (!mainStoryboardName)
  {
    BOOL v4 = [MEMORY[0x1E4F28B50] mainBundle];
    id v5 = [v4 infoDictionary];
    id v6 = [v5 objectForKey:@"UIMainStoryboardFile"];
    uint64_t v7 = (NSString *)[v6 copy];
    uint64_t v8 = self->_mainStoryboardName;
    self->_mainStoryboardName = v7;

    mainStoryboardName = self->_mainStoryboardName;
  }
  return mainStoryboardName;
}

- (void)_handleNonLaunchSpecificActions:(id)a3 forScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6
{
  uint64_t v247 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v173 = v10;
  int v12 = +[UIScene _sceneForFBSScene:v10];
  v176 = v11;
  v174 = [v11 originatingProcess];
  if (self->_internalApplicationBSActionHandlers && [v9 count])
  {
    long long v238 = 0u;
    long long v237 = 0u;
    long long v236 = 0u;
    long long v235 = 0u;
    uint64_t v13 = self->_internalApplicationBSActionHandlers;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v235 objects:v246 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v236;
LABEL_5:
      uint64_t v17 = 0;
      uint64_t v18 = v9;
      while (1)
      {
        if (*(void *)v236 != v16) {
          objc_enumerationMutation(v13);
        }
        id v9 = [*(id *)(*((void *)&v235 + 1) + 8 * v17) _respondToApplicationActions:v18 fromTransitionContext:v176];

        if (![v9 count]) {
          break;
        }
        ++v17;
        uint64_t v18 = v9;
        if (v15 == v17)
        {
          uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v235 objects:v246 count:16];
          if (v15) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
  }
  id v172 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v231 = 0u;
  long long v232 = 0u;
  long long v233 = 0u;
  long long v234 = 0u;
  id v19 = v9;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v231 objects:v245 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v232;
    v175 = v12;
    v185 = self;
    id v177 = v19;
    uint64_t v191 = *(void *)v232;
    while (1)
    {
      uint64_t v23 = 0;
      uint64_t v190 = v21;
      while (2)
      {
        if (*(void *)v232 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v231 + 1) + 8 * v23);
        switch([v24 UIActionType])
        {
          case 2:
            if (objc_opt_respondsToSelector())
            {
              delegate = self->_delegate;
              v229[0] = MEMORY[0x1E4F143A8];
              v229[1] = 3221225472;
              v229[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke;
              v229[3] = &unk_1E5302C18;
              v229[4] = v24;
              v229[5] = self;
              id v230 = v12;
              uint64_t v26 = _UIAutologgingBackgroundFetchBlock(@"Warning: Application delegate received call to -application:performFetchWithCompletionHandler: but the completion handler was never called.", v229);
              [(UIApplicationDelegate *)delegate application:self performFetchWithCompletionHandler:v26];
            }
            else if ([v24 canSendResponse])
            {
              int v36 = [MEMORY[0x1E4FB33F0] responseWithResult:1];
              [v24 sendResponse:v36];
              goto LABEL_76;
            }
            goto LABEL_180;
          case 3:
            id v37 = v24;
            if (!self->_applicationPushRegistry) {
              [(UIApplication *)self registerForRemoteNotifications];
            }
            uint64_t v38 = [MEMORY[0x1E4F39AB8] sharedInstance];
            uint64_t v39 = [v37 payload];
            v226[0] = MEMORY[0x1E4F143A8];
            v226[1] = 3221225472;
            v226[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_4;
            v226[3] = &unk_1E52DCB30;
            v226[4] = self;
            id v227 = v37;
            id v228 = v12;
            id v40 = v37;
            [v38 remoteUserNotificationPayloadReceived:v39 completionHandler:v226];

            char v41 = v227;
            goto LABEL_83;
          case 4:
            id v40 = v24;
            if (objc_opt_respondsToSelector())
            {
              [(id)UIApp applicationState];
              [(UIApplicationDelegate *)self->_delegate methodForSelector:sel_application_handleActionWithIdentifier_forRemoteNotification_completionHandler_];
              entr_act_modify();
              __int16 v42 = self->_delegate;
              char v43 = [v40 action];
              objc_super v44 = [v40 payload];
              BOOL v45 = [v40 userResponse];
              v223[0] = MEMORY[0x1E4F143A8];
              v223[1] = 3221225472;
              v223[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_7;
              v223[3] = &unk_1E52DCB30;
              v223[4] = self;
              id v224 = v40;
              id v225 = v12;
              char v46 = _UIAutologgingVoidBlock(@"Warning: Application delegate received call to -application:handleActionWithIdentifier:forRemoteNotification:withResponseInfo:completionHandler: but the completion handler was never called.", v223);
              [(UIApplicationDelegate *)v42 application:self handleActionWithIdentifier:v43 forRemoteNotification:v44 withResponseInfo:v45 completionHandler:v46];

              id v19 = v177;
              uint64_t v21 = v190;

              uint64_t v22 = v191;
              char v41 = v224;
LABEL_83:

              goto LABEL_84;
            }
            if (objc_opt_respondsToSelector())
            {
              unsigned int v81 = self->_delegate;
              char v82 = [v40 action];
              id v83 = [v40 payload];
              v220[0] = MEMORY[0x1E4F143A8];
              v220[1] = 3221225472;
              v220[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_8;
              v220[3] = &unk_1E52DCB30;
              v220[4] = self;
              id v221 = v40;
              id v222 = v12;
              BOOL v84 = _UIAutologgingVoidBlock(@"Warning: Application delegate received call to -application:handleActionWithIdentifier:forRemoteNotification:completionHandler: but the completion handler was never called.", v220);
              [(UIApplicationDelegate *)v81 application:self handleActionWithIdentifier:v82 forRemoteNotification:v83 completionHandler:v84];

              uint64_t v21 = v190;
              uint64_t v22 = v191;

              char v41 = v221;
              goto LABEL_83;
            }
            if ([v40 canSendResponse]) {
              [v40 sendResponse:0];
            }
LABEL_84:

LABEL_180:
            if (++v23 != v21) {
              continue;
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v231 objects:v245 count:16];
            if (!v21) {
              goto LABEL_182;
            }
            break;
          case 5:
            uint64_t v47 = [v24 sessionIdentifier];
            if (objc_opt_respondsToSelector())
            {
              char v48 = self->_delegate;
              v217[0] = MEMORY[0x1E4F143A8];
              v217[1] = 3221225472;
              v217[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_9;
              v217[3] = &unk_1E52DD450;
              v217[4] = self;
              v217[5] = v24;
              id v49 = v47;
              id v218 = v49;
              id v219 = v12;
              id v50 = _UIAutologgingVoidBlock(@"Warning: Application delegate received call to -application:handleEventsForBackgroundURLSession:completionHandler: but the completion handler was never called.", v217);
              [(UIApplicationDelegate *)v48 application:self handleEventsForBackgroundURLSession:v49 completionHandler:v50];

              uint64_t v22 = v191;
              [MEMORY[0x1E4F18DC0] _sendPendingCallbacksForSessionIdentifier:v49];
            }
            else
            {
              if ([v24 canSendResponse])
              {
                uint64_t v85 = [MEMORY[0x1E4F4F678] response];
                [v24 sendResponse:v85];
              }
              [MEMORY[0x1E4F18DC0] _releaseProcessAssertionForSessionIdentifier:v47];
              [MEMORY[0x1E4F18DC0] _sendPendingCallbacksForSessionIdentifier:v47];
            }

            uint64_t v21 = v190;
            goto LABEL_180;
          case 6:
            uint64_t v51 = [v176 payload];
            uint64_t v52 = [v51 objectForKey:@"UIApplicationLaunchOptionsSourceApplicationKey"];

            if (!v52)
            {
              uint64_t v52 = [v174 bundleIdentifier];
            }
            uint64_t v53 = [(UIActivityContinuationManager *)self->_activityContinuationManager activityContinuationDictionaryWithAction:v24 sourceApplication:v52 originatingProcess:v174];
            if (v53)
            {
              [(UIActivityContinuationManager *)self->_activityContinuationManager handleActivityContinuation:v53 isSuspended:[(UIApplication *)self isSuspended]];
            }
            else if (_UIStateRestorationDebugLogEnabled())
            {
              NSLog(&cfstr_SActionUiactio.isa, "-[UIApplication _handleNonLaunchSpecificActions:forScene:withTransitionContext:completion:]", v24);
            }

            goto LABEL_117;
          case 8:
            id v40 = [v24 payload];
            [(UIApplication *)self _applicationHandleSiriTask:v40];
            goto LABEL_84;
          case 11:
            [(UIApplication *)self _applicationDidEnterBackground];
            goto LABEL_180;
          case 14:
            [(UIApplication *)self _applicationHandleWatchKitRequest:v24];
            goto LABEL_180;
          case 16:
            [(UIApplication *)self _setSystemNavigationAction:v24];
            goto LABEL_180;
          case 17:
            [(UIApplication *)self _handleApplicationShortcutAction:v24 onWindowScene:v12];
            goto LABEL_180;
          case 18:
            [(UIApplication *)self _handleScreenshot];
            goto LABEL_180;
          case 19:
            [(UIApplication *)self _applicationShouldRequestHealthAuthorization];
            goto LABEL_180;
          case 23:
            uint64_t v54 = [v24 shareMetadata];
            id v40 = (id)v54;
            if (v54)
            {
              NSLog(&cfstr_SHandlingCloud.isa, "-[UIApplication _handleNonLaunchSpecificActions:forScene:withTransitionContext:completion:]", v54);
              if (objc_opt_respondsToSelector())
              {
                [(UIApplicationDelegate *)self->_delegate application:self userDidAcceptCloudKitShareWithMetadata:v40];
              }
              else if (objc_opt_respondsToSelector())
              {
                [(UIApplicationDelegate *)self->_delegate application:self userAcceptedCloudKitShareWithMetadata:v40];
              }
            }
            goto LABEL_84;
          case 25:
            id v27 = v24;
            uint64_t v28 = [v27 notification];
            uint64_t v29 = [MEMORY[0x1E4F44680] currentNotificationCenter];
            char v30 = [v29 delegate];
            if (objc_opt_respondsToSelector())
            {
              v216[0] = MEMORY[0x1E4F143A8];
              v216[1] = 3221225472;
              v216[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_12;
              v216[3] = &unk_1E52EBCD8;
              v216[4] = v27;
              [v30 userNotificationCenter:v29 willPresentNotification:v28 withCompletionHandler:v216];
              goto LABEL_130;
            }
            if ([v27 isLocal]
              && [v27 isDeliverable]
              && (objc_opt_respondsToSelector() & 1) != 0)
            {
              char v80 = (*((void (**)(uint64_t, void *))UNNotificationToUILocalNotification + 2))((uint64_t)UNNotificationToUILocalNotification, v28);
              [(UIApplicationDelegate *)self->_delegate application:self didReceiveLocalNotification:v80];
LABEL_107:
              if ([v27 canSendResponse])
              {
                double v95 = +[UIWillPresentNotificationActionResponse responseWithOptions:0];
                [v27 sendResponse:v95];
              }
              id v19 = v177;
              goto LABEL_130;
            }
            if ([v27 isRemote]
              && [v27 isDeliverable]
              && (objc_opt_respondsToSelector() & 1) != 0)
            {
              id v90 = [v28 request];
              id v91 = [v90 content];
              char v80 = [v91 userInfo];

              self = v185;
              [(UIApplicationDelegate *)v185->_delegate application:v185 didReceiveRemoteNotification:v80 fetchCompletionHandler:&__block_literal_global_1974];
              goto LABEL_107;
            }
            if ([v27 isRemote]
              && [v27 isDeliverable]
              && (objc_opt_respondsToSelector() & 1) != 0)
            {
              id v93 = [v28 request];
              id v94 = [v93 content];
              char v80 = [v94 userInfo];

              self = v185;
              [(UIApplicationDelegate *)v185->_delegate application:v185 didReceiveRemoteNotification:v80];
              goto LABEL_107;
            }
            self = v185;
            if ([v27 canSendResponse])
            {
              int v123 = +[UIWillPresentNotificationActionResponse responseWithOptions:0];
              [v27 sendResponse:v123];
            }
LABEL_130:

LABEL_131:
            goto LABEL_179;
          case 26:
            int v55 = dyld_program_sdk_at_least();
            char v56 = (void *)MEMORY[0x1E4F1CC08];
            if (!v55) {
              char v56 = 0;
            }
            id v57 = v56;
            id v58 = v24;
            int v59 = [v58 response];
            long long v60 = [MEMORY[0x1E4F44680] currentNotificationCenter];
            uint64_t v61 = [v60 delegate];
            if (objc_opt_respondsToSelector())
            {
              v214[0] = MEMORY[0x1E4F143A8];
              v214[1] = 3221225472;
              v214[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_14;
              v214[3] = &unk_1E52DCB30;
              v214[4] = self;
              v214[5] = v58;
              id v215 = v12;
              _UIAutologgingVoidBlock(@"Warning: UNUserNotificationCenter delegate received call to -userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler: but the completion handler was never called.", v214);
              v63 = id v62 = v57;
              [v61 userNotificationCenter:v60 didReceiveNotificationResponse:v59 withCompletionHandler:v63];

              id v57 = v62;
              int v12 = v175;
              int v64 = v215;
LABEL_52:

              goto LABEL_178;
            }
            if ([v58 isLocal]
              && [v58 isDefaultAction]
              && (objc_opt_respondsToSelector() & 1) != 0)
            {
              id v86 = v57;
              int v87 = (void (**)(uint64_t, void *))UNNotificationToUILocalNotification;
              id v88 = [v59 notification];
              id v89 = v87[2]((uint64_t)v87, v88);

              id v19 = v177;
              self = v185;
              [(UIApplicationDelegate *)v185->_delegate application:v185 didReceiveLocalNotification:v89];

              id v57 = v86;
              goto LABEL_178;
            }
            if ([v58 isLocal]
              && ([v58 isDefaultAction] & 1) == 0
              && (objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_opt_class();
              id v186 = v57;
              if ((objc_opt_isKindOfClass() & 1) != 0
                && ([v59 userText], (uint64_t v92 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                v243 = @"UIUserNotificationActionResponseTypedTextKey";
                uint64_t v169 = (void *)v92;
                uint64_t v244 = v92;
                id v167 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v244 forKeys:&v243 count:1];
              }
              else
              {
                id v167 = v57;
                uint64_t v169 = 0;
              }
              v143 = (void (**)(uint64_t, void *))UNNotificationToUILocalNotification;
              id v144 = [v59 notification];
              v170 = v143[2]((uint64_t)v143, v144);

              v183 = v185->_delegate;
              self = v185;
              id v145 = [v59 actionIdentifier];
              v212[0] = MEMORY[0x1E4F143A8];
              v212[1] = 3221225472;
              v212[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_15;
              v212[3] = &unk_1E52DCB30;
              v212[4] = v185;
              v212[5] = v58;
              id v213 = v12;
              id v146 = _UIAutologgingVoidBlock(@"Warning: Application delegate received call to -application:handleActionWithIdentifier:forLocalNotification:withResponseInfo:completionHandler: but the completion handler was never called.", v212);
              [(UIApplicationDelegate *)v183 application:v185 handleActionWithIdentifier:v145 forLocalNotification:v170 withResponseInfo:v167 completionHandler:v146];

LABEL_176:
              id v19 = v177;
              goto LABEL_177;
            }
            if ([v58 isLocal]
              && ([v58 isDefaultAction] & 1) == 0
              && (objc_opt_respondsToSelector() & 1) != 0)
            {
              id v187 = v57;
              id v96 = (void (**)(uint64_t, void *))UNNotificationToUILocalNotification;
              double v97 = [v59 notification];
              id v98 = v96[2]((uint64_t)v96, v97);

              v179 = v185->_delegate;
              self = v185;
              v99 = [v59 actionIdentifier];
              v210[0] = MEMORY[0x1E4F143A8];
              v210[1] = 3221225472;
              v210[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_16;
              v210[3] = &unk_1E52DCB30;
              v210[4] = v185;
              v210[5] = v58;
              id v211 = v12;
              id v100 = _UIAutologgingVoidBlock(@"Warning: Application delegate received call to -application:handleActionWithIdentifier:forLocalNotification:completionHandler: but the completion handler was never called.", v210);
              [(UIApplicationDelegate *)v179 application:v185 handleActionWithIdentifier:v99 forLocalNotification:v98 completionHandler:v100];

              id v57 = v187;
              id v19 = v177;

              goto LABEL_178;
            }
            if ([v58 isRemote]
              && [v58 isDefaultAction]
              && (objc_opt_respondsToSelector() & 1) != 0)
            {
              v180 = [v59 notification];
              id v124 = [v180 request];
              id v125 = [v124 content];
              [v125 userInfo];
              id v126 = v186 = v57;

              id v19 = v177;
              self = v185;
              [(UIApplicationDelegate *)v185->_delegate application:v185 didReceiveRemoteNotification:v126 fetchCompletionHandler:&__block_literal_global_1992_0];
              goto LABEL_144;
            }
            if ([v58 isRemote]
              && [v58 isDefaultAction]
              && (objc_opt_respondsToSelector() & 1) != 0)
            {
              v181 = [v59 notification];
              long long v127 = [v181 request];
              long long v128 = [v127 content];
              [v128 userInfo];
              id v126 = v186 = v57;

              id v19 = v177;
              self = v185;
              [(UIApplicationDelegate *)v185->_delegate application:v185 didReceiveRemoteNotification:v126];
LABEL_144:

LABEL_177:
              id v57 = v186;
              goto LABEL_178;
            }
            if ([v58 isRemote]
              && ([v58 isDefaultAction] & 1) == 0
              && (objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_opt_class();
              id v186 = v57;
              if ((objc_opt_isKindOfClass() & 1) != 0
                && ([v59 userText], (uint64_t v129 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                v241 = @"UIUserNotificationActionResponseTypedTextKey";
                uint64_t v169 = (void *)v129;
                uint64_t v242 = v129;
                id v168 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v242 forKeys:&v241 count:1];
              }
              else
              {
                id v168 = v57;
                uint64_t v169 = 0;
              }
              v147 = [v59 notification];
              v148 = [v147 request];
              id v149 = [v148 content];
              v184 = [v149 userInfo];

              id v150 = v185->_delegate;
              self = v185;
              v171 = [v59 actionIdentifier];
              v208[0] = MEMORY[0x1E4F143A8];
              v208[1] = 3221225472;
              v208[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_18;
              v208[3] = &unk_1E52DCB30;
              v208[4] = v185;
              v208[5] = v58;
              id v209 = v12;
              char v151 = _UIAutologgingVoidBlock(@"Warning: Application delegate received call to -application:handleActionWithIdentifier:forRemoteNotification:withResponseInfo:completionHandler: but the completion handler was never called.", v208);
              [(UIApplicationDelegate *)v150 application:v185 handleActionWithIdentifier:v171 forRemoteNotification:v184 withResponseInfo:v168 completionHandler:v151];

              goto LABEL_176;
            }
            if ([v58 isRemote]
              && ([v58 isDefaultAction] & 1) == 0
              && (objc_opt_respondsToSelector() & 1) != 0)
            {
              [v59 notification];
              long long v130 = v189 = v57;
              long long v131 = [v130 request];
              long long v132 = [v131 content];
              uint64_t v182 = [v132 userInfo];

              long long v133 = v185->_delegate;
              self = v185;
              long long v134 = [v59 actionIdentifier];
              v206[0] = MEMORY[0x1E4F143A8];
              v206[1] = 3221225472;
              v206[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_19;
              v206[3] = &unk_1E52DCB30;
              v206[4] = v185;
              v206[5] = v58;
              id v207 = v12;
              long long v135 = _UIAutologgingVoidBlock(@"Warning: Application delegate received call to -application:handleActionWithIdentifier:forRemoteNotification:completionHandler: but the completion handler was never called.", v206);
              long long v136 = v133;
              id v57 = v189;
              [(UIApplicationDelegate *)v136 application:v185 handleActionWithIdentifier:v134 forRemoteNotification:v182 completionHandler:v135];

              id v19 = v177;
              int v64 = (void *)v182;
              goto LABEL_52;
            }
            self = v185;
            if ([v58 canSendResponse]) {
              [v58 sendResponse:0];
            }
LABEL_178:

LABEL_179:
            uint64_t v21 = v190;
            uint64_t v22 = v191;
            goto LABEL_180;
          case 27:
            [(UIApplication *)self _applicationHandleIntentForwardingAction:v24];
            goto LABEL_180;
          case 31:
            [v24 fulfillRequest];
            goto LABEL_180;
          case 32:
            id v65 = v24;
            id v27 = [v65 notification];
            uint64_t v28 = [MEMORY[0x1E4F44680] currentNotificationCenter];
            uint64_t v66 = [v28 delegate];
            char v67 = objc_opt_respondsToSelector();

            if (v67) {
              [v66 userNotificationCenter:v28 openSettingsForNotification:v27];
            }

            goto LABEL_131;
          case 33:
            id v31 = v24;
            id v32 = [v12 _bannerManager];
            char v33 = [v31 bannerContent];
            IMP v34 = [v32 bannerWithContent:v33];

            if ([v31 tappable])
            {
              v204[0] = MEMORY[0x1E4F143A8];
              v204[1] = 3221225472;
              v204[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_20;
              v204[3] = &unk_1E52D9F70;
              id v205 = v31;
              [v34 addTapHandler:v204];
            }
            v202[0] = MEMORY[0x1E4F143A8];
            v202[1] = 3221225472;
            v202[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_21;
            v202[3] = &unk_1E52D9F70;
            id v203 = v34;
            id v35 = v34;
            [v31 setInvalidationHandler:v202];
            objc_setAssociatedObject(v35, "action", v31, (void *)1);
            [v35 present];

            goto LABEL_67;
          case 34:
            id v68 = v24;
            long long v69 = [(UIApplication *)self _openSessionsIncludingInternal:1];
            v200[0] = MEMORY[0x1E4F143A8];
            v200[1] = 3221225472;
            v200[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_23;
            v200[3] = &unk_1E5302C40;
            id v70 = v68;
            id v201 = v70;
            uint64_t v71 = [v69 objectsPassingTest:v200];

            v178 = v71;
            id v72 = [v71 anyObject];
            int v73 = v72;
            if (v72)
            {
              id v74 = v72;
            }
            else
            {
              pid_t v101 = [UISceneSession alloc];
              long long v102 = [v70 persistentIdentifier];
              id v74 = [(UISceneSession *)v101 _initWithPersistentIdentifier:v102 sessionRole:@"UIWindowSceneSessionRoleApplication" configurationName:0];
            }
            v188 = v70;
            if ([v74 _configurationNeedsReevalulation])
            {
              [(UIApplication *)self _removeSessionFromSessionSet:v74];
              long long v103 = [UISceneSession alloc];
              long long v104 = [v70 persistentIdentifier];
              uint64_t v105 = [(UISceneSession *)v103 _initWithPersistentIdentifier:v104 sessionRole:@"UIWindowSceneSessionRoleApplication" configurationName:0];

              id v74 = (id)v105;
            }
            p_uint64_t applicationFlags = &self->_applicationFlags;
            uint64_t v107 = *((void *)&self->_applicationFlags + 1);
            if (!(*(void *)&self->_applicationFlags & 0x8000000000000000 | v107 & 1))
            {
              v119 = 0;
              int v12 = v175;
              uint64_t v120 = v188;
              goto LABEL_166;
            }
            char v108 = objc_opt_new();
            uint64_t v109 = (void *)MEMORY[0x1E4F1CAD0];
            id v110 = [v188 action];
            id v111 = [v109 setWithObject:v110];
            id v112 = [[UISceneSession alloc] _init];
            long long v113 = +[UIScene _connectionOptionsForScene:0 withSpecification:v108 transitionContext:0 actions:v111 sceneSession:v112];

            long long v114 = [UISceneConnectionOptions alloc];
            long long v115 = objc_opt_new();
            id v116 = [(UISceneConnectionOptions *)v114 _initWithConnectionOptionsContext:v113 fbsScene:0 specification:v115];

            if (v107)
            {
              self = v185;
              if ((*((void *)p_applicationFlags + 1) & 1) == 0)
              {
LABEL_139:
                v119 = 0;
                int v12 = v175;
                uint64_t v120 = v188;
                goto LABEL_165;
              }
              long long v137 = [(UIApplication *)v185 _openSessionsIncludingInternal:1];
              if ([v137 containsObject:0])
              {
                int v138 = [v74 _configurationNeedsReevalulation];

                int v12 = v175;
                uint64_t v120 = v188;
                if (!v138)
                {
                  v119 = 0;
                  goto LABEL_165;
                }
              }
              else
              {

                int v12 = v175;
                uint64_t v120 = v188;
              }
              id v122 = [(UIApplicationDelegate *)v185->_delegate application:v185 configurationForConnectingSceneSession:v74 options:v116];
              [v74 _updateConfiguration:v122];
              v119 = 0;
              goto LABEL_164;
            }
            self = v185;
            if ((*(void *)p_applicationFlags & 0x8000000000000000) == 0) {
              goto LABEL_139;
            }
            id v117 = v185->_delegate;
            uint64_t v118 = [v113 launchOptionsDictionary];
            v119 = [(UIApplicationDelegate *)v117 _application:v185 willCreateCanvasWithDefinition:v74 withOptions:v118];

            int v12 = v175;
            uint64_t v120 = v188;
            if (v119)
            {
              v121 = [v119 persistentIdentifier];

              if (!v121)
              {
                id v122 = [MEMORY[0x1E4F28B00] currentHandler];
                [v122 handleFailureInMethod:a2, v185, @"UIApplication.m", 11910, @"Client must return a canvas definition with the proposed or another, already existing, persistentIdentifier" object file lineNumber description];
LABEL_164:
              }
            }
LABEL_165:

LABEL_166:
            if (v119) {
              v139 = v119;
            }
            else {
              v139 = v74;
            }
            id v140 = v139;
            -[UIApplication _appendSessionToSessionSet:save:](self, "_appendSessionToSessionSet:save:", v140, [v173 isPersistable]);
            if ([v120 canSendResponse])
            {
              v141 = [v140 persistentIdentifier];
              v142 = +[UISceneProposalActionResponse responseWithPersistentIdentifier:v141];
              [v120 sendResponse:v142];
            }
            id v19 = v177;
            goto LABEL_179;
          case 35:
            id v40 = v24;
            int v79 = [v40 persistedIdentifiers];
            if (v79) {
              [(id)UIApp _discardSceneSessionsWithPersistentIdentifiers:v79 skippingPersistenceDeletion:0];
            }

            goto LABEL_84;
          case 36:
            int v36 = [v12 statusBarManager];
            [v36 handleTapAction:v24];
LABEL_76:

            goto LABEL_180;
          case 37:
            [(UIApplication *)self _wakeTimerFired];
            goto LABEL_180;
          case 39:
            long long v198 = 0u;
            long long v199 = 0u;
            long long v196 = 0u;
            long long v197 = 0u;
            id v31 = [(UIApplication *)self windows];
            uint64_t v75 = [v31 countByEnumeratingWithState:&v196 objects:v240 count:16];
            if (v75)
            {
              uint64_t v76 = v75;
              uint64_t v77 = *(void *)v197;
              do
              {
                for (uint64_t i = 0; i != v76; ++i)
                {
                  if (*(void *)v197 != v77) {
                    objc_enumerationMutation(v31);
                  }
                  [*(id *)(*((void *)&v196 + 1) + 8 * i) _resetFocusEventRecognizer];
                }
                uint64_t v76 = [v31 countByEnumeratingWithState:&v196 objects:v240 count:16];
              }
              while (v76);
            }
LABEL_67:

LABEL_117:
            uint64_t v22 = v191;
            goto LABEL_180;
          case 43:
            [(UIApplication *)self _applicationHandleLinkConnectionAction:v24];
            goto LABEL_180;
          case 46:
            [v24 _handleActionForWindowScene:v12];
            goto LABEL_180;
          default:
            [v172 addObject:v24];
            goto LABEL_180;
        }
        break;
      }
    }
  }
LABEL_182:

  id v152 = v172;
  v153 = v152;
  if (self->_applicationBSActionHandlers)
  {
    v153 = v152;
    if ([v152 count])
    {
      long long v194 = 0u;
      long long v195 = 0u;
      long long v192 = 0u;
      long long v193 = 0u;
      uint64_t v154 = self->_applicationBSActionHandlers;
      uint64_t v155 = [(NSMutableArray *)v154 countByEnumeratingWithState:&v192 objects:v239 count:16];
      v153 = v152;
      if (v155)
      {
        uint64_t v156 = v155;
        uint64_t v157 = *(void *)v193;
        v153 = v152;
LABEL_186:
        uint64_t v158 = 0;
        int v159 = v153;
        while (1)
        {
          if (*(void *)v193 != v157) {
            objc_enumerationMutation(v154);
          }
          v153 = [*(id *)(*((void *)&v192 + 1) + 8 * v158) _respondToApplicationActions:v159 fromTransitionContext:v176];

          if (![v153 count]) {
            break;
          }
          ++v158;
          int v159 = v153;
          if (v156 == v158)
          {
            uint64_t v156 = [(NSMutableArray *)v154 countByEnumeratingWithState:&v192 objects:v239 count:16];
            if (v156) {
              goto LABEL_186;
            }
            break;
          }
        }
      }
    }
  }
  if ([v153 count]) {
    [(UIApplication *)self _handlePlatformSpecificActions:v153 forScene:v173 withTransitionContext:v176];
  }
  uint64_t v160 = *((void *)&self->_applicationFlags + 1);
  int v161 = [v176 shouldTakeKeyboardFocus];
  unint64_t v162 = *((void *)&self->_applicationFlags + 1);
  int v163 = v161 | (v162 >> 42) & 1;
  uint64_t v164 = 0x40000000000;
  if (!v163) {
    uint64_t v164 = 0;
  }
  *((void *)&self->_applicationFlags + 1) = v164 | v162 & 0xFFFFFBFFFFFFFFFFLL;
  if ((v160 & 0x40000000000) == 0 && v163)
  {
    int v165 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    [v165 restorePreservedInputViewsIfNecessary];
  }
}

- (BOOL)_handleDelegateCallbacksWithOptions:(id)a3 isSuspended:(BOOL)a4 restoreState:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  +[_UIAppearance _setInvalidatesViewsOnAppearanceChange:1];
  id v9 = +[_UISystemReferenceAngleMultiplexer sharedMultiplexer];
  if (!v5) {
    *((void *)&self->_applicationFlags + 1) |= 0x10000000uLL;
  }
  char v10 = objc_opt_respondsToSelector();
  if ((v10 & 1) == 0)
  {
    int v11 = 1;
    if (!v5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  kdebug_trace();
  int v11 = [(UIApplicationDelegate *)self->_delegate application:self willFinishLaunchingWithOptions:v8];
  kdebug_trace();
  if (v5) {
LABEL_7:
  }
    BOOL v5 = [(UIApplication *)self _doRestorationIfNecessary];
LABEL_8:
  if (objc_opt_respondsToSelector())
  {
    kdebug_trace();
    v11 &= [(UIApplicationDelegate *)self->_delegate application:self didFinishLaunchingWithOptions:v8];
    kdebug_trace();
LABEL_13:
    *(void *)&self->_applicationFlags |= 0x80000uLL;
    int v12 = 1;
    goto LABEL_15;
  }
  if (objc_opt_respondsToSelector())
  {
    kdebug_trace();
    [(UIApplicationDelegate *)self->_delegate applicationDidFinishLaunching:self];
    kdebug_trace();
    if (v6) {
      [(UIApplication *)self applicationWillSuspend];
    }
    goto LABEL_13;
  }
  int v12 = 0;
LABEL_15:
  [(UIApplication *)self _handleLocalizationDelegateCallbacks];
  if (v10) {
    *(void *)&self->_applicationFlags |= 0x80000uLL;
  }
  if (v5) {
    _decrementRestorationMarkerCount(self, 0);
  }
  uint64_t v13 = +[UIWindow _applicationKeyWindow];

  if (v13 && [(UIApplication *)self isFrontBoard])
  {
    uint64_t v14 = +[UIKeyboardInputModeController sharedInputModeController];
    [v14 setShouldRunContinuousDiscovery:1];

    uint64_t v15 = +[UIKeyboardInputModeController sharedInputModeController];
    id v16 = (id)[v15 currentInputMode];

    uint64_t v17 = +[UIDevice currentDevice];
    uint64_t v18 = [v17 userInterfaceIdiom];

    if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      id v19 = [MEMORY[0x1E4F62940] sharedMonitorForDisplayType:0];
      displayLayoutMonitor = self->_displayLayoutMonitor;
      self->_displayLayoutMonitor = v19;

      [(FBSDisplayLayoutMonitor *)self->_displayLayoutMonitor addObserver:self];
    }
    uint64_t v21 = sem_open("keyboard-flush.boot", 0);
    if (v21 != (sem_t *)-1
      || (+[UIKeyboardImpl purgeImageCache],
          uint64_t v21 = sem_open("keyboard-flush.boot", 512, 256, 0),
          v21 != (sem_t *)-1))
    {
      sem_close(v21);
    }
  }
  [(UIApplication *)self _updateSerializableKeyCommandsForResponder:self];
  +[_UIAppearance _setInvalidatesViewsOnAppearanceChange:0];
  if (v12) {
    _UIApplicationWaitForBackgroundAssertionsToFlush();
  }

  return v11;
}

- (BOOL)_doRestorationIfNecessary
{
  p_uint64_t applicationFlags = &self->_applicationFlags;
  if ((*((unsigned char *)&self->_applicationFlags + 7) & 4) == 0) {
    goto LABEL_5;
  }
  uint64_t RestorationRetryCountAndUpdateIfNecessary = _getRestorationRetryCountAndUpdateIfNecessary(0);
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"UIStateRestorationDeveloperMode", (CFStringRef)*MEMORY[0x1E4F1D3D8], 0);
  if (RestorationRetryCountAndUpdateIfNecessary <= 0 && !AppBooleanValue)
  {
    _deleteRestorationArchive(0);
LABEL_5:
    BOOL v6 = 0;
    goto LABEL_10;
  }
  if (RestorationRetryCountAndUpdateIfNecessary <= 0 && _UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SDeveloperMode.isa, "-[UIApplication(StateRestoration) _doRestorationIfNecessary]");
  }
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id v8 = &self->_applicationFlags;
  *((void *)&self->_applicationFlags + 1) |= 0x8000000uLL;
  _incrementRestorationMarkerCount(v7, 0, 1);
  objc_sync_exit(v7);

  [(UIApplication *)v7 _restoreApplicationPreservationStateWithSessionIdentifier:0 beginHandler:0 completionHandler:0];
  id v9 = v7;
  objc_sync_enter(v9);
  *((void *)v8 + 1) &= ~0x8000000uLL;
  objc_sync_exit(v9);

  BOOL v6 = 1;
LABEL_10:
  *((void *)p_applicationFlags + 1) |= 0x10000000uLL;
  +[UIWindow _executeDeferredOrientationUpdates]();
  char v10 = +[UIScene _scenesIncludingInternal:1];
  [v10 enumerateObjectsUsingBlock:&__block_literal_global_3452];

  return v6;
}

- (void)_handleLocalizationDelegateCallbacks
{
  char v3 = dyld_program_sdk_at_least();
  if (objc_opt_respondsToSelector()) {
    char v3 = [(UIApplicationDelegate *)self->_delegate applicationShouldAutomaticallyLocalizeKeyCommands:self];
  }
  sAllowLocalizationOfApplicationShortcuts = v3;
}

- (int64_t)_expectedViewOrientation
{
  return self->__expectedViewOrientation;
}

- (int)_loadMainStoryboardFileNamed:(id)a3 bundle:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[UIStoryboard storyboardWithName:v6 bundle:a4];
  id v8 = v7;
  if (v7)
  {
    if (!self->_storyboardInitialMenu)
    {
      id v9 = [v7 _instantiateInitialMenu];
      id storyboardInitialMenu = self->_storyboardInitialMenu;
      self->_id storyboardInitialMenu = v9;
    }
    uint64_t v11 = [v8 instantiateInitialViewController];
    if (v11)
    {
      int v12 = (void *)v11;
      if (self->_delegate)
      {
        if (objc_opt_respondsToSelector())
        {
          id v13 = [(UIApplicationDelegate *)self->_delegate window];
          if (v13) {
            goto LABEL_22;
          }
        }
        if (objc_opt_respondsToSelector())
        {
          id v13 = [(UIApplication *)self _newDefaultStoryboardWindow];
          [(UIApplicationDelegate *)self->_delegate setWindow:v13];
LABEL_22:
          objc_msgSend(v13, "setRootViewController:", v12, *(void *)v20);

          int v16 = 1;
          goto LABEL_23;
        }
        uint64_t v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B6F0) + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v20 = 0;
          uint64_t v18 = "The app delegate must implement the window property if it wants to use a main storyboard file.";
          goto LABEL_20;
        }
      }
      else
      {
        uint64_t v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B6F8) + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v20 = 0;
          uint64_t v18 = "There is no app delegate set. An app delegate class must be specified to use a main storyboard file.";
LABEL_20:
          _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, v18, v20, 2u);
        }
      }
      id v13 = 0;
      goto LABEL_22;
    }
    uint64_t v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B700) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v20 = 138412290;
      *(void *)&v20[4] = v6;
      uint64_t v15 = "Failed to instantiate the default view controller for UIMainStoryboardFile '%@' - perhaps the designated ent"
            "ry point is not set?";
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B708) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v20 = 138412290;
      *(void *)&v20[4] = v6;
      uint64_t v15 = "Failed to load UIMainStoryboardFile %@.";
LABEL_14:
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, v15, v20, 0xCu);
    }
  }
  int v16 = 2;
LABEL_23:

  return v16;
}

- (int64_t)_testOrientation:(id)a3 options:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 valueForKey:@"orientation"];
  id v8 = v7;
  if (v7)
  {
    if ([v7 isEqualToString:@"Portrait"])
    {
LABEL_3:
      int64_t v9 = 1;
      goto LABEL_11;
    }
    if (([v8 isEqualToString:@"Landscape"] & 1) != 0
      || ([v8 isEqualToString:@"LandscapeRight"] & 1) != 0)
    {
      goto LABEL_10;
    }
    if ([v8 isEqualToString:@"LandscapeLeft"])
    {
      int64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"PortraitUpsideDown"])
    {
      int64_t v9 = 2;
    }
    else
    {
      if (![v8 isEqualToString:@"current"])
      {
        NSLog(&cfstr_UnsupportedVal.isa, v8);
        goto LABEL_3;
      }
      int64_t v9 = [(id)UIApp _safeInterfaceOrientationForNoWindow];
    }
  }
  else
  {
    if ([v6 rangeOfString:@"Landscape"] != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_10:
      int64_t v9 = 3;
      goto LABEL_11;
    }
    if ([v6 isEqualToString:@"resize"]) {
      int64_t v9 = 3;
    }
    else {
      int64_t v9 = 1;
    }
  }
LABEL_11:
  if (![(UIApplication *)self _isSupportedOrientation:v9])
  {
    do
    {
      if (v9 <= 3) {
        ++v9;
      }
      else {
        int64_t v9 = 1;
      }
    }
    while (![(UIApplication *)self _isSupportedOrientation:v9]);
  }

  return v9;
}

- (int64_t)_safeInterfaceOrientationForNoWindow
{
  return [(UIApplication *)self _safeInterfaceOrientationForWindowIfExists:0 expectNonNilWindow:0];
}

- (BOOL)_isSupportedOrientation:(int64_t)a3
{
  char v4 = [(id)UIApp supportedInterfaceOrientationsForWindow:0];
  switch(a3)
  {
    case 0:
      uint64_t v5 = v4 & 1;
      uint64_t v6 = 1;
      break;
    case 1:
      uint64_t v5 = v4 & 2;
      uint64_t v6 = 2;
      break;
    case 2:
      uint64_t v5 = v4 & 4;
      uint64_t v6 = 4;
      break;
    case 3:
      uint64_t v5 = v4 & 8;
      uint64_t v6 = 8;
      break;
    case 4:
      uint64_t v5 = v4 & 0x10;
      uint64_t v6 = 16;
      break;
    default:
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      break;
  }
  return v5 == v6;
}

- (int64_t)_carefulChoiceOrientation
{
  if ((*((unsigned char *)&self->_applicationFlags + 13) & 8) != 0) {
    return [(UIApplication *)self _safeInterfaceOrientationForNoWindow];
  }
  else {
    return [(UIApplication *)self _frontMostAppOrientation];
  }
}

- (id)_newDefaultStoryboardWindow
{
  if (dyld_program_sdk_at_least())
  {
    return objc_alloc_init(UIWindow);
  }
  else
  {
    char v3 = [UIWindow alloc];
    id v4 = -[UIWindow _initWithOrientation:](v3, "_initWithOrientation:", [(id)UIApp _safeInterfaceOrientationForNoWindow]);
    [v4 setResizesToFullScreen:1];
    [v4 _resizeWindowToFullScreenIfNecessary];
    return v4;
  }
}

void __43__UIApplication__appAdoptsUISceneLifecycle__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 232) sceneConfigurations];
  [v1 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_453];
}

- (id)_infoPlistSceneConfigurations
{
  return [(_UIApplicationInfoParser *)self->_appInfo sceneConfigurations];
}

- (id)_infoPlistCanvasDefinitions
{
  return [(_UIApplicationInfoParser *)self->_appInfo canvasDefinitions];
}

void __61__UIApplication__observeDebugOrTestUserInterfaceStyleChanged__block_invoke(uint64_t a1)
{
  if (os_variant_has_internal_diagnostics())
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 addObserver:*(void *)(a1 + 32) selector:sel__maybeEffectiveUserInterfaceStyleChanged name:@"_UIDebugOrTestUserInterfaceStyleChangedNotification" object:0];
  }
}

- (void)setMinimumBackgroundFetchInterval:(NSTimeInterval)minimumBackgroundFetchInterval
{
}

- (id)_findWindowForControllingOverallAppearanceInWindowScene:(id)a3
{
  return +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:a3];
}

- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle
{
}

- (void)_initiateLaunchActionsBackgrounded:(BOOL)a3 firstActivation:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v6 = @"launch";
    if (a3) {
      uint64_t v6 = @"launch suspended";
    }
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = @"resume";
  }
  id v8 = (void *)qword_1EB25B518;
  qword_1EB25B518 = (uint64_t)v7;

  if (__IsRunningTests) {
    [(id)UIApp startedTest:qword_1EB25B518];
  }
  __wasResumed = !a4;
  if (!a4)
  {
    getpid();
    int v9 = memorystatus_control();
    char v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("AppLifecycle", &qword_1EB25B7D8) + 8);
    if (os_signpost_enabled(v10))
    {
      v11[0] = 67240448;
      v11[1] = v9;
      __int16 v12 = 1026;
      int v13 = !v5;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AppResume", " enableTelemetry=YES WasFrozen=%{signpost.telemetry:number1,public,name=WasFrozen}i IsForeground=%{signpost.telemetry:number2,public,name=IsForeground}i", (uint8_t *)v11, 0xEu);
    }
  }
}

void __43__UIApplication_setReceivesMemoryWarnings___block_invoke(uint64_t a1)
{
  dispatch_source_t v2 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 6uLL, MEMORY[0x1E4F14428]);
  char v3 = (void *)qword_1EB25B798;
  qword_1EB25B798 = (uint64_t)v2;

  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __43__UIApplication_setReceivesMemoryWarnings___block_invoke_2;
  handler[3] = &unk_1E52D9F70;
  void handler[4] = *(void *)(a1 + 32);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1EB25B798, handler);
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 179) & 0x20) != 0) {
    dispatch_resume((dispatch_object_t)qword_1EB25B798);
  }
}

- (void)_deliverRemainingKeyUpEvents
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v3 = (id *)[(_UIKeyboardHIDEventOrderedDescriptorSet *)self->_physicalKeycodeSet copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = -[_UIKeyboardHIDEventOrderedDescriptorSet events](v3);
  BOOL v5 = objc_msgSend(v4, "reverseObjectEnumerator", 0);

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        char v10 = *(const void **)(*((void *)&v11 + 1) + 8 * i);
        CFRetain(v10);
        mach_absolute_time();
        IOHIDEventSetTimeStamp();
        IOHIDEventSetIntegerValue();
        [(UIApplication *)self _handleKeyHIDEvent:v10 usingSyntheticEvent:1];
        CFRelease(v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  -[_UIKeyboardHIDEventOrderedDescriptorSet removeAllEvents](&self->_physicalKeycodeSet->super.isa);
}

- (void)setApplicationIconBadgeNumber:(NSInteger)applicationIconBadgeNumber
{
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    BOOL v5 = [(UIApplication *)self currentUserNotificationSettings];
    char v6 = [v5 types];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = +[UIUserNotificationSettings settingsForTypes:7 categories:0];
      [(UIApplication *)self registerUserNotificationSettings:v7];
    }
  }
  id v9 = [MEMORY[0x1E4F44680] currentNotificationCenter];
  uint64_t v8 = [NSNumber numberWithInteger:applicationIconBadgeNumber];
  [v9 setBadgeNumber:v8 withCompletionHandler:0];
}

void __60__UIApplication_StateRestoration___doRestorationIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 statusBarManager];
  [v2 updateStatusBarAppearance];
}

- (void)_saveRestorationUserActivityStateForScene:(id)a3
{
  id v5 = a3;
  char v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    +[_UICanvasUserActivityManager _saveRestorationStateForScene:v5];
  }
}

- (id)_openSessionsIncludingInternal:(BOOL)a3
{
  if (a3)
  {
    if (qword_1EB25BA00 != -1) {
      dispatch_once(&qword_1EB25BA00, &__block_literal_global_4054);
    }
    char v3 = (void *)[(id)qword_1EB25B9F8 copy];
  }
  else
  {
    if (qword_1EB25BA00 != -1) {
      dispatch_once(&qword_1EB25BA00, &__block_literal_global_4054);
    }
    id v4 = [(id)qword_1EB25B9F8 objectsPassingTest:&__block_literal_global_3619];
    char v3 = (void *)[v4 copy];
  }
  return v3;
}

- (BOOL)isStatusBarHidden
{
  id v2 = [(UIApplication *)self _mainScene];
  char v3 = +[UIScene _sceneForFBSScene:v2];

  id v4 = [v3 statusBarManager];
  char v5 = [v4 isStatusBarHidden];

  return v5;
}

void __63__UIApplication_pushRegistry_didUpdatePushCredentials_forType___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v2 = *(void **)(a1 + 40);
    id v4 = *(void **)(v3 + 24);
    id v5 = [v2 token];
    [v4 application:v3 didRegisterForRemoteNotificationsWithDeviceToken:v5];
  }
}

uint64_t __125__UIApplication_SessionAndConfigurationInternal___discardSceneSessionsWithPersistentIdentifiers_skippingPersistenceDeletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 persistentIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)_isResigningActive
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 13) >> 5) & 1;
}

- (void)_stopHangTracer
{
  byte_1EB25B4F9 = 1;
  [(UIApplication *)self _updateHangTracer];
}

uint64_t __103__UIApplication_UIApplicationTesting__finishedTest_extraResults_waitForNotification_withTeardownBlock___block_invoke_360(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopAndReportResultsForTest:*(void *)(a1 + 40) extraResults:*(void *)(a1 + 48) waitForNotification:*(void *)(a1 + 56) withTeardownBlock:*(void *)(a1 + 64)];
}

- (void)pushRegistry:(id)a3 didInvalidatePushTokenForType:(id)a4 error:(id)a5
{
  id v7 = a5;
  if ([a4 isEqualToString:*MEMORY[0x1E4F39AC8]])
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    long long v13 = __66__UIApplication_pushRegistry_didInvalidatePushTokenForType_error___block_invoke;
    long long v14 = &unk_1E52D9F98;
    uint64_t v15 = self;
    id v16 = v7;
    dispatch_async(MEMORY[0x1E4F14428], &v11);
    applicationPushRegistry = self->_applicationPushRegistry;
    id v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "set", v11, v12, v13, v14, v15);
    [(PKPushRegistry *)applicationPushRegistry setDesiredPushTypes:v9];

    [(PKPushRegistry *)self->_applicationPushRegistry setDelegate:0];
    char v10 = self->_applicationPushRegistry;
    self->_applicationPushRegistry = 0;
  }
}

- (void)registerForRemoteNotifications
{
  applicationPushRegistry = self->_applicationPushRegistry;
  if (!applicationPushRegistry)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F39AB0]);
    id v5 = (PKPushRegistry *)[v4 initWithQueue:MEMORY[0x1E4F14428]];
    [(PKPushRegistry *)v5 setDelegate:self];
    char v6 = self->_applicationPushRegistry;
    self->_applicationPushRegistry = v5;

    applicationPushRegistry = self->_applicationPushRegistry;
  }
  uint64_t v7 = *MEMORY[0x1E4F39AC8];
  uint64_t v8 = [(PKPushRegistry *)applicationPushRegistry pushTokenForType:*MEMORY[0x1E4F39AC8]];
  id v9 = v8;
  if (v8)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __47__UIApplication_registerForRemoteNotifications__block_invoke;
    v12[3] = &unk_1E52D9F98;
    void v12[4] = self;
    id v13 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
  else
  {
    char v10 = self->_applicationPushRegistry;
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
    [(PKPushRegistry *)v10 setDesiredPushTypes:v11];
  }
}

- (BOOL)isIdleTimerDisabled
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 4) >> 4) & 1;
}

id __125__UIApplication_SessionAndConfigurationInternal___discardSceneSessionsWithPersistentIdentifiers_skippingPersistenceDeletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (qword_1EB25BA00 != -1) {
    dispatch_once(&qword_1EB25BA00, &__block_literal_global_4054);
  }
  uint64_t v3 = (void *)qword_1EB25B9F8;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __125__UIApplication_SessionAndConfigurationInternal___discardSceneSessionsWithPersistentIdentifiers_skippingPersistenceDeletion___block_invoke_2;
  v10[3] = &unk_1E5302EB8;
  id v4 = v2;
  id v11 = v4;
  id v5 = objc_msgSend(v3, "bs_filter:", v10);
  char v6 = [v5 anyObject];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = +[_UICanvasUserActivityManager _fetchSceneSessionWithPersistentIdentifier:v4];
  }
  uint64_t v8 = v7;

  return v8;
}

uint64_t __43__UIApplication__beginFenceTaskIfNecessary__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (BOOL)isProtectedDataAvailable
{
  return MKBGetDeviceLockState() != 1;
}

- (void)pushRegistry:(id)a3 didUpdatePushCredentials:(id)a4 forType:(id)a5
{
  id v7 = a4;
  if ([a5 isEqualToString:*MEMORY[0x1E4F39AC8]])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__UIApplication_pushRegistry_didUpdatePushCredentials_forType___block_invoke;
    v8[3] = &unk_1E52D9F98;
    void v8[4] = self;
    id v9 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

- (void)_setUserDefaultsSyncEnabled:(BOOL)a3
{
  uint64_t v3 = 8;
  if (a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (void)_setRotationDisabledDuringTouch:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (void)_accessibilitySetUpQuickSpeak
{
  if ((_accessibilitySetUpQuickSpeak_QuickSpeakDidRegister & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_accessibilityQuickSpeakStatusChanged, (CFStringRef)*MEMORY[0x1E4FB9258], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    _accessibilitySetUpQuickSpeak_QuickSpeakDidRegister = 1;
  }
  if (_AXSQuickSpeakEnabled())
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithPath:", objc_msgSend((id)AXAccessibilityBundlesDirectory(), "stringByAppendingPathComponent:", @"QuickSpeak.bundle"));
    if (v4)
    {
      id v5 = v4;
      if (([v4 isLoaded] & 1) == 0)
      {
        [v5 load];
        char v6 = (void *)[v5 principalClass];
        [v6 initialize];
      }
    }
  }
}

void __37__UIApplication__supportsOpenCommand__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 infoDictionary];
  id v3 = [v1 objectForKey:*MEMORY[0x1E4F1CC50]];

  if (dyld_program_sdk_at_least()) {
    BOOL v2 = [v3 count] != 0;
  }
  else {
    BOOL v2 = 0;
  }
  byte_1EB25B502 = v2;
}

uint64_t __66__UIApplication_pushRegistry_didInvalidatePushTokenForType_error___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 24);
    return objc_msgSend(v3, "application:didFailToRegisterForRemoteNotificationsWithError:");
  }
  return result;
}

- (void)setStatusBarStyle:(int64_t)a3 animationParameters:(id)a4
{
  id v6 = a4;
  if (![(UIApplication *)self _viewControllerBasedStatusBarAppearance])
  {
    self->_statusBarRequestedStyle = a3;
    id v7 = +[UIScene _scenesIncludingInternal:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__UIApplication_setStatusBarStyle_animationParameters___block_invoke;
    v8[3] = &unk_1E5302750;
    id v9 = v6;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

- (id)userCachesDirectory
{
  BOOL v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v3 = [v2 objectAtIndex:0];

  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v4, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v3, 0);

  return v3;
}

- (BOOL)_isNormalRestorationInProgress
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 11) >> 3) & 1;
}

+ (id)_applicationNameForMenus
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__UIApplication__applicationNameForMenus__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (qword_1EB25B7C0 != -1) {
    dispatch_once(&qword_1EB25B7C0, block);
  }
  BOOL v2 = (void *)qword_1EB25B7C8;
  return v2;
}

- (BOOL)sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event
{
  id v8 = target;
  if (!target) {
    id v8 = [(UIApplication *)self _unswizzledTargetInChainForAction:action sender:sender];
  }
  if (dyld_program_sdk_at_least()) {
    objc_msgSend(v8, action, sender, event);
  }
  else {
    objc_msgSend(v8, sel_performSelector_withObject_withObject_, action, sender, event);
  }
  return v8 != 0;
}

- (id)_unswizzledTargetInChainForAction:(SEL)a3 sender:(id)a4
{
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [v6 window];
  }
  else {
  id v7 = +[UIWindow _applicationKeyWindow];
  }
  id v8 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v10 = [(UIApplication *)self _responderForKeyEvents];
    if (v10) {
      goto LABEL_15;
    }
  }
  id v11 = [v7 _focusBehavior];
  int v12 = [v11 syncsFocusAndResponder];

  if (!v12) {
    goto LABEL_10;
  }
  id v13 = [v7 _focusSystem];
  char v10 = [v13 _preferredFirstResponder];

  long long v14 = [v10 _responderWindow];

  if (v14 != v7)
  {

    goto LABEL_10;
  }
  if (v10)
  {
LABEL_15:
    _UIResponderTargetForAction(v10, a3, v6);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
LABEL_10:
  if (_AXSFullKeyboardAccessEnabled())
  {
    if (!_AXSFullKeyboardAccessPassthroughModeEnabled())
    {
      char v10 = [v7 _focusResponder];
      if (v10) {
        goto LABEL_15;
      }
    }
  }
  uint64_t v15 = [v7 firstResponder];
  char v10 = [v15 _responderForEditing];

  if (v10) {
    goto LABEL_15;
  }
  id v16 = v6;
  char v10 = v16;
  if (v16) {
    goto LABEL_15;
  }
LABEL_16:
  id v17 = v16;

  return v17;
}

void __67__UIApplication__checkActivityContinuationAndBecomeCurrentIfNeeded__block_invoke()
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v0 = +[UIWindow allWindowsIncludingInternalWindows:0 onlyVisibleWindows:1];
  id v1 = [v0 reverseObjectEnumerator];

  uint64_t v2 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = 0;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v1);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
        id v8 = [v7 windowScene];
        uint64_t v9 = [v8 activationState];

        if (!v9 && (!v4 || [v7 isKeyWindow]))
        {
          char v10 = [v7 rootViewController];
          uint64_t v11 = [v10 _activityContinuationSuitableToBecomeCurrent];

          if (v11)
          {
            if ([v7 isKeyWindow])
            {

              id v4 = (void *)v11;
              goto LABEL_19;
            }
            id v4 = (void *)v11;
          }
          else
          {
            id v4 = 0;
          }
        }
        ++v6;
      }
      while (v3 != v6);
      uint64_t v12 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v3 = v12;
    }
    while (v12);

    if (!v4) {
      return;
    }
LABEL_19:
    if (_UIStateRestorationDebugLogEnabled())
    {
      id v13 = [v4 title];
      long long v14 = [v4 _uniqueIdentifier];
      NSLog(&cfstr_SFoundActivity.isa, "-[UIApplication _checkActivityContinuationAndBecomeCurrentIfNeeded]_block_invoke", v4, v13, v14);
    }
    [v4 becomeCurrent];
  }
  else
  {
    id v4 = v1;
  }
}

- (id)_topMostViewController:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  id v5 = 0;
  if (a1 && v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v4 topViewController];
      if (v6) {
        goto LABEL_7;
      }
    }
    id v7 = [v4 presentedViewController];

    if (v7)
    {
      uint64_t v6 = [v4 presentedViewController];
LABEL_7:
      id v8 = (void *)v6;
      -[UIApplication _topMostViewController:](a1, v6);
      id v5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    id v5 = v4;
  }
LABEL_9:

  return v5;
}

- (BOOL)_accessibilityCaptureSimulatorEvent:(__GSEvent *)a3
{
  return 0;
}

+ (id)_accessibilitySettingsBundle
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithPath:", objc_msgSend((id)AXAccessibilityBundlesDirectory(), "stringByAppendingPathComponent:", @"AccessibilitySettingsLoader.bundle"));
  id v3 = v2;
  if (v2)
  {
    if (([v2 isLoaded] & 1) == 0 && (objc_msgSend(v3, "loadAndReturnError:", 0) & 1) == 0)
    {
      id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Accessibility", &_accessibilitySettingsBundle___s_category) + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "Could not load AccessibilitySettingsLoader bundle", v6, 2u);
      }
    }
  }
  return v3;
}

- (void)_updateAccessibilityItunesSettings
{
  if ([(UIApplication *)self _accessibilityApplicationIsSystemWideServer])
  {
    uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_accessibilitySettingsBundle"), "principalClass");
    if (objc_opt_respondsToSelector())
    {
      [v2 performSelector:sel_updateITunesSettings withObject:0];
    }
  }
}

+ (void)_updateAccessibilitySettingsLoader
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(a1, "_accessibilitySettingsBundle"), "principalClass");
  if (objc_opt_respondsToSelector()) {
    [v2 performSelector:sel_update withObject:0];
  }
  _HasLoadedAccessibilitySettingsLoader = 1;
}

- (Class)_accessibilityBundlePrincipalClass
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (objc_class *)objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithPath:", objc_msgSend((id)objc_msgSend((id)AXAccessibilityBundlesDirectory(), "stringByAppendingPathComponent:", @"UIKit"), "stringByAppendingPathExtension:", @"axbundle"));
  uint64_t v9 = 0;
  if (![(objc_class *)v2 loadAndReturnError:&v9])
  {
    id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Accessibility", &qword_1EB25ED00) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)timespec buf = 138412546;
      uint64_t v11 = v2;
      __int16 v12 = 2112;
      id v13 = v9;
      id v5 = "Could not load accessibility bundle: %@ %@";
      uint64_t v6 = v7;
      goto LABEL_7;
    }
    return 0;
  }
  id v3 = (objc_class *)[(objc_class *)v2 principalClass];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Accessibility", &_MergedGlobals_923) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)timespec buf = 138412546;
      uint64_t v11 = v3;
      __int16 v12 = 2112;
      id v13 = v2;
      id v5 = "Principal class %@ did not respond to _accessibilityStartServer %@";
      uint64_t v6 = v4;
LABEL_7:
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, v5, buf, 0x16u);
      return 0;
    }
    return 0;
  }
  return v3;
}

+ (void)_accessibilityLoadSettingsLoaderIfNeeded
{
  if (pthread_main_np() == 1 && (_HasLoadedAccessibilitySettingsLoader & 1) == 0)
  {
    [a1 _updateAccessibilitySettingsLoader];
  }
}

- (BOOL)_canAnimateDragCancelInApp
{
  if (![(id)UIApp applicationState]) {
    return 1;
  }
  return _UIApplicationIsExtension();
}

- (void)_setShouldFixMainThreadPriority:(BOOL)a3
{
  __shouldFixMainThreadPriority = a3;
  BSSetMainThreadPriorityFixedForUI();
}

- (void)dealloc
{
  v11[4] = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_keyCommandRegistrationAssertions makeObjectsPerformSelector:sel_invalidate];
  keyCommandRegistrationAssertions = self->_keyCommandRegistrationAssertions;
  self->_keyCommandRegistrationAssertions = 0;

  [(UIRepeatedAction *)self->_keyRepeatAction invalidate];
  keyRepeatAction = self->_keyRepeatAction;
  self->_keyRepeatAction = 0;

  [(FBSOrientationObserver *)self->_orientationObserver invalidate];
  orientationObserver = self->_orientationObserver;
  self->_orientationObserver = 0;

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v11[0] = *MEMORY[0x1E4FB9128];
  v11[1] = @"_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification";
  _DWORD v11[2] = @"_UIWindowDidBecomeApplicationKeyNotification";
  v11[3] = @"_UIWindowDidResignApplicationKeyNotification";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  -[NSNotificationCenter _uiRemoveObserver:names:](v6, self, v7);

  if ((*((unsigned char *)&self->_applicationFlags + 13) & 2) != 0)
  {
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = getPGPictureInPictureProxyPictureInPictureActiveChangedNotification();
    [v8 removeObserver:self name:v9 object:0];
  }
  [(SBSApplicationShortcutService *)self->_shortcutService invalidate];
  v10.receiver = self;
  v10.super_class = (Class)UIApplication;
  [(UIResponder *)&v10 dealloc];
}

+ (int64_t)runningInStoreDemoModeFProgramNumber
{
  int64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0))
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"FProgramNumber", @"com.apple.demo-settings", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      return AppIntegerValue;
    }
  }
  return v2;
}

- (BOOL)disablesFrontBoardImplicitWindowScenes
{
  return 0;
}

- (void)_forceEndIgnoringInteractionEvents
{
  if (qword_1EB25B5B8 != -1) {
    dispatch_once(&qword_1EB25B5B8, &__block_literal_global_1234);
  }
  if (byte_1EB25B4E3) {
    goto LABEL_7;
  }
  if (qword_1EB25B5C8 != -1) {
    dispatch_once(&qword_1EB25B5C8, &__block_literal_global_1247_0);
  }
  if (byte_1EB25B4E4)
  {
LABEL_7:
    -[UIApplication __forceEndIgnoringInteractionEvents]((uint64_t)self);
  }
}

- (void)__forceEndIgnoringInteractionEvents
{
  if (a1)
  {
    *(void *)(a1 + 176) &= 0xFFFFFFFFE1FFFFFFLL;
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"_UIApplicationDidEndIgnoringInteractionEventsNotification" object:a1];
  }
}

- (id)idleTimerDisabledReasons
{
  return self->_idleTimerDisabledReasons;
}

- (BOOL)_appSupportsSceneItemProviders
{
  return [(_UIApplicationInfoParser *)self->_appInfo supportsSceneItemProviders];
}

- (BOOL)_isActivatedIgnoringReasons:(unsigned int)a3
{
  return (*(_DWORD *)&self->_applicationFlags & ~a3 & 0x3FFFF) == 0;
}

- (BOOL)_isActivatedIgnoringReasons:(unsigned int)a3 withNewReason:(int)a4
{
  return ((*(_DWORD *)&self->_applicationFlags & 0x3FFFF | (1 << a4)) & ~a3) == 0;
}

- (BOOL)_isActivatedIgnoringReason:(int)a3
{
  return (*(_DWORD *)&self->_applicationFlags & ~(1 << a3) & 0x3FFFF) == 0;
}

- (BOOL)_isRestorationExtended
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 11) >> 3) & 1;
}

- (void)_setRestorationExtended:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFFFFFFFBFFFFFFLL | v3;
}

+ (id)_systemUIServiceClientSettings
{
  return (id)[MEMORY[0x1E4F62A38] settings];
}

+ (id)_systemUIServiceIdentifier
{
  return 0;
}

- (id)_mainSceneForDisplay:(id)a3
{
  uint64_t v3 = [a3 identity];
  id v4 = _UIApplicationMainSceneForDisplayIdentity(v3);

  return v4;
}

- (id)_newSceneForWindow:(id)a3 oldDisplay:(id)a4 newDisplay:(id)a5
{
  return 0;
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v8 = (FBSDisplayLayoutMonitor *)a3;
  id v54 = a4;
  id v9 = a5;
  uint64_t v53 = v8;
  if (self->_displayLayoutMonitor != v8) {
    goto LABEL_48;
  }
  id v50 = v9;
  uint64_t v51 = self;
  unint64_t v52 = *((void *)&self->_applicationFlags + 1);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = [v54 elements];
  uint64_t v60 = [obj countByEnumeratingWithState:&v64 objects:v77 count:16];
  if (!v60)
  {
    char v55 = 0;
    uint64_t v61 = 0;
    goto LABEL_41;
  }
  uint64_t v61 = 0;
  char v55 = 0;
  uint64_t v10 = (v52 >> 39) & 3;
  uint64_t v59 = *(void *)v65;
  uint64_t v58 = *MEMORY[0x1E4F625B8];
  uint64_t v57 = *MEMORY[0x1E4F625A8];
  while (2)
  {
    for (uint64_t i = 0; i != v60; ++i)
    {
      if (*(void *)v65 != v59) {
        objc_enumerationMutation(obj);
      }
      __int16 v12 = *(void **)(*((void *)&v64 + 1) + 8 * i);
      id v13 = [v12 identifier];
      uint64_t v14 = _UIMainBundleIdentifier();
      int v15 = [v13 hasPrefix:v14];

      long long v16 = [v12 identifier];
      uint64_t v73 = 0;
      id v74 = &v73;
      uint64_t v75 = 0x2020000000;
      long long v17 = (void *)qword_1EB25B8F0;
      uint64_t v76 = qword_1EB25B8F0;
      if (!qword_1EB25B8F0)
      {
        uint64_t v68 = MEMORY[0x1E4F143A8];
        uint64_t v69 = 3221225472;
        id v70 = __getSBSDisplayLayoutElementAppSwitcherIdentifierSymbolLoc_block_invoke;
        uint64_t v71 = &unk_1E52D9900;
        id v72 = &v73;
        long long v18 = SpringBoardServicesLibrary_1();
        id v19 = dlsym(v18, "SBSDisplayLayoutElementAppSwitcherIdentifier");
        *(void *)(v72[1] + 24) = v19;
        qword_1EB25B8F0 = *(void *)(v72[1] + 24);
        long long v17 = (void *)v74[3];
      }
      _Block_object_dispose(&v73, 8);
      if (!v17)
      {
        char v46 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v47 = [NSString stringWithUTF8String:"NSString *getSBSDisplayLayoutElementAppSwitcherIdentifier(void)"];
        objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, @"UIApplication.m", 491, @"%s", dlerror());

        goto LABEL_51;
      }
      int v20 = [v16 isEqualToString:*v17];

      uint64_t v21 = [v12 identifier];
      uint64_t v73 = 0;
      id v74 = &v73;
      uint64_t v75 = 0x2020000000;
      uint64_t v22 = (void *)qword_1EB25B8F8;
      uint64_t v76 = qword_1EB25B8F8;
      if (!qword_1EB25B8F8)
      {
        uint64_t v68 = MEMORY[0x1E4F143A8];
        uint64_t v69 = 3221225472;
        id v70 = __getSBSDisplayLayoutElementFloatingDockIdentifierSymbolLoc_block_invoke;
        uint64_t v71 = &unk_1E52D9900;
        id v72 = &v73;
        uint64_t v23 = SpringBoardServicesLibrary_1();
        uint64_t v24 = dlsym(v23, "SBSDisplayLayoutElementFloatingDockIdentifier");
        *(void *)(v72[1] + 24) = v24;
        qword_1EB25B8F8 = *(void *)(v72[1] + 24);
        uint64_t v22 = (void *)v74[3];
      }
      _Block_object_dispose(&v73, 8);
      if (!v22)
      {
        char v48 = [MEMORY[0x1E4F28B00] currentHandler];
        id v49 = [NSString stringWithUTF8String:"NSString *getSBSDisplayLayoutElementFloatingDockIdentifier(void)"];
        objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, @"UIApplication.m", 492, @"%s", dlerror());

LABEL_51:
        __break(1u);
      }
      int v25 = [v21 isEqualToString:*v22];

      uint64_t v26 = [v12 identifier];
      int v27 = [v26 isEqualToString:v58];

      uint64_t v28 = [v12 identifier];
      int v29 = [v28 isEqualToString:v57];

      char v30 = [v12 identifier];
      int v31 = [v30 isEqualToString:@"SBSpotlightAlert"];

      switch(v10)
      {
        case 2:
          uint64_t v32 = v61;
          if (!(v20 | v25)) {
            uint64_t v32 = 3;
          }
          goto LABEL_21;
        case 1:
          uint64_t v33 = 2;
          if (!v25) {
            uint64_t v33 = 0;
          }
          uint64_t v34 = v61;
          if (!v20) {
            uint64_t v34 = v33;
          }
          uint64_t v61 = v34;
          break;
        case 0:
          uint64_t v32 = v61;
          if (v20) {
            uint64_t v32 = 1;
          }
LABEL_21:
          uint64_t v61 = v32;
          break;
      }
      if (((v25 | v31 ^ 1) & 1) == 0 && [v12 conformsToProtocol:&unk_1ED7012A0]) {
        v55 |= [v12 layoutRole] == 3;
      }
      if ((v15 & (v25 ^ 1) | v20 | v27 | v29 | v31) == 1
        && [v12 conformsToProtocol:&unk_1ED7012A0])
      {
        id v35 = v12;
        if ([v35 layoutRole] == 1
          || [v35 layoutRole] == 4
          || [v35 layoutRole] == 3)
        {

          int v36 = v51;
          uint64_t applicationFlags = (uint64_t)v51->_applicationFlags;
          uint64_t v37 = *((void *)&v51->_applicationFlags + 1);
          goto LABEL_42;
        }
      }
    }
    uint64_t v60 = [obj countByEnumeratingWithState:&v64 objects:v77 count:16];
    if (v60) {
      continue;
    }
    break;
  }
LABEL_41:

  uint64_t v39 = [v54 elements];
  id v40 = [v39 firstObject];

  char v41 = [v40 identifier];
  __int16 v42 = _UIMainBundleIdentifier();
  int v43 = [v41 hasPrefix:v42];

  int v36 = v51;
  uint64_t applicationFlags = (uint64_t)v51->_applicationFlags;
  uint64_t v37 = *((void *)&v51->_applicationFlags + 1);
  if (v43) {
LABEL_42:
  }
    uint64_t v44 = 0x4000000000;
  else {
    uint64_t v44 = 0;
  }
  *(void *)&v36->_uint64_t applicationFlags = applicationFlags;
  *((void *)&v36->_applicationFlags + 1) = v37 & 0xFFFFFE3FFFFFFFFFLL | v44 | ((unint64_t)(v61 & 3) << 39);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__UIApplication_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke;
  aBlock[3] = &unk_1E52D9FC0;
  char v63 = ((v52 & 0x4000000000 | v61) != 0) | v55 & 1;
  void aBlock[4] = v36;
  BOOL v45 = (void (**)(void))_Block_copy(aBlock);
  if (pthread_main_np() == 1) {
    v45[2](v45);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v45);
  }

  id v9 = v50;
LABEL_48:
}

uint64_t __66__UIApplication_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _deliverRemainingKeyUpEvents];
  }
  return result;
}

uint64_t __93__UIApplication__performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming_block___block_invoke(uint64_t a1)
{
  return [(id)qword_1EB25B5B0 enqueuePostCommitBlock:*(void *)(a1 + 32)];
}

- (void)_performBlockAfterCATransactionCommitSynchronizes:(id)a3
{
  id v5 = a3;
  if (dyld_program_sdk_at_least() && pthread_main_np() != 1)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UIApplication.m" lineNumber:3409 description:@"Call must be made on main thread"];
  }
  if (pthread_main_np() == 1)
  {
    [(id)qword_1EB25B5B0 enqueuePostSynchronizeBlock:v5];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__UIApplication__performBlockAfterCATransactionCommitSynchronizes___block_invoke;
    block[3] = &unk_1E52DA040;
    id v8 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __67__UIApplication__performBlockAfterCATransactionCommitSynchronizes___block_invoke(uint64_t a1)
{
  return [(id)qword_1EB25B5B0 enqueuePostSynchronizeBlock:*(void *)(a1 + 32)];
}

+ (void)_attemptRequestingSystemUIServiceSceneWithRetry
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (byte_1EB25B4F8++)
  {
    id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("SystemUIService", &qword_1EB25B680) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)timespec buf = 67109120;
      int v11 = byte_1EB25B4F8;
      id v5 = "Requesting a scene for systemUIService from the default system shell (attempt %u).";
      uint64_t v6 = v4;
      uint32_t v7 = 8;
LABEL_6:
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("SystemUIService", &qword_1EB25B678) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)timespec buf = 0;
      id v5 = "Requesting a scene for systemUIService from the default system shell.";
      uint64_t v6 = v8;
      uint32_t v7 = 2;
      goto LABEL_6;
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__UIApplication__attemptRequestingSystemUIServiceSceneWithRetry__block_invoke;
  v9[3] = &__block_descriptor_40_e30_v24__0__FBSScene_8__NSError_16l;
  v9[4] = a1;
  [a1 _requestSystemUIServiceSceneWithCompletion:v9];
}

void __64__UIApplication__attemptRequestingSystemUIServiceSceneWithRetry__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (!v6)
  {
    uint64_t v9 = [v7 descriptionWithMultilinePrefix:0];
    uint64_t v10 = (void *)v9;
    int v11 = @"<no error provided>";
    if (v9) {
      int v11 = (__CFString *)v9;
    }
    uint64_t v12 = v11;

    if ([v8 isBSServiceConnectionError])
    {
      id v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("SystemUIService", &qword_1EB25B690) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v20 = 138543362;
        uint64_t v21 = v12;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "request for systemUIService scene failed due to an XPC error (the default shell probably crashed): %{public}@", (uint8_t *)&v20, 0xCu);
      }
      if (byte_1EB25B4F8 <= 2u)
      {
        [*(id *)(a1 + 32) _attemptRequestingSystemUIServiceSceneWithRetry];

        goto LABEL_10;
      }
      long long v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("SystemUIService", &qword_1EB25B698) + 8);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_16:
        id v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("SystemUIService", &qword_1EB25B6A8) + 8);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v20 = 138543362;
          uint64_t v21 = v12;
          _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Calling exit(0) because we cannot continue without a scene: %{public}@", (uint8_t *)&v20, 0xCu);
        }
        exit(0);
      }
      LOWORD(v20) = 0;
      int v15 = "Scene request retry attempts exhausted.";
      long long v16 = v18;
      uint32_t v17 = 2;
    }
    else
    {
      uint64_t v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("SystemUIService", &qword_1EB25B6A0) + 8);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      int v20 = 138543362;
      uint64_t v21 = v12;
      int v15 = "request for systemUIService scene from defaultShell failed: %{public}@";
      long long v16 = v14;
      uint32_t v17 = 12;
    }
    _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v20, v17);
    goto LABEL_16;
  }
  objc_storeStrong((id *)&qword_1EB25B688, a2);
LABEL_10:
}

+ (void)_requestSystemUIServiceSceneWithCompletion:(id)a3
{
  id v5 = a3;
  if (([(id)objc_opt_class() _isSystemUIService] & 1) == 0)
  {
    int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"UIApplication.m" lineNumber:3892 description:@"SystemUIService scene can not be requested from an app that isn't a SystemUIService"];
  }
  id v6 = [(id)qword_1EB25B590 defaultService];
  id v7 = objc_opt_new();
  id v8 = [(id)objc_opt_class() _systemUIServiceIdentifier];
  [v7 setIdentifier:v8];

  uint64_t v9 = [(id)objc_opt_class() _systemUIServiceClientSettings];
  [v7 setInitialClientSettings:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __60__UIApplication__requestSystemUIServiceSceneWithCompletion___block_invoke;
  v12[3] = &unk_1E5302708;
  id v13 = v5;
  id v10 = v5;
  [v6 requestSceneWithOptions:v7 completion:v12];
}

uint64_t __60__UIApplication__requestSystemUIServiceSceneWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)__completeAndRunAsPlugin
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFFFFFE7FFFFFFFLL | 0x80000000;
  int out_token = 0;
  uint64_t v3 = _UIMainBundleIdentifier();
  _UIViewServiceConnectionNotificationName(v3, v4);
  id v5 = objc_claimAutoreleasedReturnValue();
  id v6 = (const char *)[v5 UTF8String];

  notify_register_check(v6, &out_token);
  notify_set_state(out_token, 1uLL);
  notify_post(v6);
  id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25B6B0) + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)timespec buf = 136446210;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Posting notification %{public}s", buf, 0xCu);
  }
  self->_eventDispatcher->_mainEnvironment->_isSystemApplication = 0;
  byte_1EB25B4D9 = 0;
  __IsRunningTests = 0;
  __LaunchTime = CACurrentMediaTime();
  __ExecOrResumeTime = CACurrentMediaTime();
  if (__IsRunningTests)
  {
    id v8 = (void *)qword_1EB25B518;
    qword_1EB25B518 = @"launch suspended";

    [(UIApplication *)self startedTest:qword_1EB25B518];
  }
  _requestHardwareEventsIfNeeded();
  uint64_t v9 = +[FBSSceneTransitionContext transitionContext];
  [(UIApplication *)self _runWithMainScene:0 transitionContext:v9 completion:0];

  entr_act_end();
}

- (void)activityContinuationManager:(id)a3 displayProgressUI:(id)a4 dismissalHandler:(id)a5
{
  id v6 = a5;
  id v7 = _UINSLocalizedStringWithDefaultValue(@"Handoff", @"Handoff");
  id v8 = _UINSLocalizedStringWithDefaultValue(@"Waiting for Handoff to “%@”.", @"Waiting for Handoff to “%@”.");
  uint64_t v9 = [(UIApplication *)self _localizedApplicationName];
  id v10 = objc_msgSend(NSString, "localizedStringWithFormat:", v8, v9);
  int v11 = _UINSLocalizedStringWithDefaultValue(@"Cancel", @"Cancel");
  uint64_t v12 = +[_UIApplicationModalProgressController sharedInstance];
  if ([(UIApplication *)self _isDisplayingActivityContinuationUI])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __80__UIApplication_activityContinuationManager_displayProgressUI_dismissalHandler___block_invoke;
    v18[3] = &unk_1E52D9FE8;
    uint64_t v13 = &v19;
    id v19 = v6;
    id v14 = v6;
    [v12 reconfigureWithTitle:v7 message:v10 progress:0 buttonTitle:v11 dismissalHandler:v18];
  }
  else
  {
    [(UIApplication *)self _setIsDisplayingActivityContinuationUI:1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __80__UIApplication_activityContinuationManager_displayProgressUI_dismissalHandler___block_invoke_2;
    v16[3] = &unk_1E52D9FE8;
    uint64_t v13 = &v17;
    id v17 = v6;
    id v15 = v6;
    [v12 displayWithTitle:v7 message:v10 progress:0 buttonTitle:v11 sourceViewController:0 preDisplayTestBlock:0 dismissalHandler:v16];
  }
}

uint64_t __80__UIApplication_activityContinuationManager_displayProgressUI_dismissalHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __80__UIApplication_activityContinuationManager_displayProgressUI_dismissalHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)activityContinuationManager:(id)a3 configureProgressUIWithError:(id)a4
{
  if ([(UIApplication *)self _isDisplayingActivityContinuationUI])
  {
    id v8 = +[_UIApplicationModalProgressController sharedInstance];
    [(UIApplication *)self _setIsDisplayingActivityContinuationUI:0];
    id v5 = _UINSLocalizedStringWithDefaultValue(@"Handoff", @"Handoff");
    id v6 = _UINSLocalizedStringWithDefaultValue(@"Handoff Failed", @"Handoff Failed");
    id v7 = _UINSLocalizedStringWithDefaultValue(@"OK", @"OK");
    [v8 reconfigureWithTitle:v5 message:v6 progress:0 buttonTitle:v7 dismissalHandler:0];
  }
}

- (void)activityContinuationManager:(id)a3 hideProgressUIWithCompletion:(id)a4
{
  id v5 = (void (**)(void))a4;
  if ([(UIApplication *)self _isDisplayingActivityContinuationUI])
  {
    id v6 = +[_UIApplicationModalProgressController sharedInstance];
    [(UIApplication *)self _setIsDisplayingActivityContinuationUI:0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__UIApplication_activityContinuationManager_hideProgressUIWithCompletion___block_invoke;
    v7[3] = &unk_1E52D9FE8;
    id v8 = v5;
    [v6 hideAfterMinimumUptimeWithDismissalHandler:v7];
  }
  else if (v5)
  {
    v5[2](v5);
  }
}

uint64_t __74__UIApplication_activityContinuationManager_hideProgressUIWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)activityContinuationManagerUserCancelledError:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F281F8];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  id v5 = _UINSLocalizedStringWithDefaultValue(@"User cancelled waiting for the activity", @"User cancelled waiting for the activity");
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v3 errorWithDomain:v4 code:3072 userInfo:v6];

  return v7;
}

- (BOOL)activityContinuationManagerHandleErrorsByConfiguringProgressUI:(id)a3
{
  if ([(UIApplication *)self _isDisplayingActivityContinuationUI]) {
    char v3 = objc_opt_respondsToSelector() ^ 1;
  }
  else {
    char v3 = 0;
  }
  return v3 & 1;
}

- (BOOL)activityContinuationManager:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v5 = a4;
  if (objc_opt_respondsToSelector())
  {
    int v6 = [(UIApplicationDelegate *)self->_delegate application:self willContinueUserActivityWithType:v5];
    if (_UIStateRestorationDebugLogEnabled())
    {
      id v7 = @"No";
      if (v6) {
        id v7 = @"Yes";
      }
      NSLog(&cfstr_SDelegateRetur.isa, "-[UIApplication activityContinuationManager:willContinueUserActivityWithType:]", v7);
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)activityContinuationManager:(id)a3 continueUserActivity:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__UIApplication_activityContinuationManager_continueUserActivity___block_invoke;
    v15[3] = &unk_1E52D99A8;
    id v7 = v5;
    id v16 = v7;
    char v8 = [(UIApplicationDelegate *)delegate application:self continueUserActivity:v7 restorationHandler:v15];
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      if ([v7 _hasInteraction])
      {
        if (([v7 _accessedInteraction] & 1) == 0)
        {
          uint64_t v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &activityContinuationManager_continueUserActivity____s_category)+ 8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            id v10 = v9;
            int v11 = (objc_class *)objc_opt_class();
            uint64_t v12 = NSStringFromClass(v11);
            uint64_t v13 = NSStringFromSelector(sel_application_continueUserActivity_restorationHandler_);
            *(_DWORD *)timespec buf = 138412802;
            long long v18 = v12;
            __int16 v19 = 2112;
            int v20 = v13;
            __int16 v21 = 2112;
            id v22 = v7;
            _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "-[%@ %@] %@ has an interaction attached but it is not handled", buf, 0x20u);
          }
        }
      }
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

void __66__UIApplication_activityContinuationManager_continueUserActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__UIApplication_activityContinuationManager_continueUserActivity___block_invoke_2;
  v5[3] = &unk_1E52D9F98;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __66__UIApplication_activityContinuationManager_continueUserActivity___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
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
        if (objc_opt_respondsToSelector())
        {
          if (_UIStateRestorationDebugLogEnabled()) {
            NSLog(&cfstr_SCallingRestor.isa, "-[UIApplication activityContinuationManager:continueUserActivity:]_block_invoke_2", *(void *)(a1 + 40), v7);
          }
          [v7 restoreUserActivityState:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)activityContinuationManager:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v7 = a5;
  if (objc_opt_respondsToSelector()) {
    [(UIApplicationDelegate *)self->_delegate application:self didFailToContinueUserActivityWithType:v8 error:v7];
  }
}

+ (id)displayManagerObserver
{
  return +[_UIDisplayObserver sharedObserver];
}

- (void)workspaceShouldExit:(id)a3 withTransitionContext:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v6 && ([v6 isUISubclass] & 1) == 0)
  {
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UIApplication.m", 4234, @"transitionContext is of an unexpected class : %@", v6 object file lineNumber description];
  }
  id v10 = v6;
  kdebug_trace();
  id v7 = +[_UISceneLifecycleMultiplexer sharedInstance];
  id v8 = [(UIApplication *)self _mainScene];
  [v7 forceExitWithTransitionContext:v10 scene:v8];

  kdebug_trace();
}

void __75__UIApplication_workspace_didCreateScene_withTransitionContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = (id)objc_opt_new();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)workspace:(id)a3 willDestroyScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v10 = a4;
  id v11 = a5;
  id v31 = a6;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  kdebug_trace();
  uint64_t v32 = +[UIScene _sceneForFBSScene:v10];
  [v32 _invalidate];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v12 = [v11 actions];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    char v15 = 0;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v12);
        }
        long long v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ([v18 UIActionType] == 35)
        {
          id v19 = v18;
          int v20 = [v19 persistedIdentifiers];
          if (v20) {
            [(id)UIApp _discardSceneSessionsWithPersistentIdentifiers:v20 skippingPersistenceDeletion:0];
          }

          char v15 = 1;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v14);
  }
  else
  {
    char v15 = 0;
  }

  __int16 v21 = +[UIScene _persistenceIdentifierForScene:v10];
  if ((v15 & 1) == 0 && ([v10 isPersistable] & 1) == 0)
  {
    id v22 = [MEMORY[0x1E4F1CAD0] setWithObject:v21];
    [(UIApplication *)self _discardSceneSessionsWithPersistentIdentifiers:v22 skippingPersistenceDeletion:1];
  }
  if (qword_1EB25B688 && (id)qword_1EB25B688 == v10)
  {
    char v30 = *(NSObject **)(__UILogGetCategoryCachedImpl("UILog", &qword_1EB25B6B8) + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)timespec buf = 0;
      _os_log_impl(&dword_1853B0000, v30, OS_LOG_TYPE_ERROR, "systemUIService scene is going away - exiting", buf, 2u);
    }
    exit(0);
  }
  [v10 setDelegate:0];
  [(id)qword_1EB25B580 removeObject:v10];
  __cachedMostActiveWindowScene = 0;
  uint64_t v23 = [v10 settings];
  uint64_t v24 = [v23 displayConfiguration];
  int v25 = [v24 identity];

  if (v25) {
    +[UIScreen _FBSDisplayIdentityDisconnected:v25];
  }
  unsigned int applicationFlags = self->_applicationFlags;
  if (![(id)qword_1EB25B580 count]
    && ((applicationFlags >> 25) & 0xF) != 0
    && ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ForceEndIngnoringInteractionEventsForCarPlayApp, @"ForceEndIngnoringInteractionEventsForCarPlayApp", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1E8FD53CC))
  {
    if (qword_1EB25B670 != -1) {
      dispatch_once(&qword_1EB25B670, &__block_literal_global_1330);
    }
    if (byte_1EB25B4F7)
    {
      if (os_variant_has_internal_diagnostics())
      {
        int v29 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)timespec buf = 67109120;
          int v41 = (applicationFlags >> 25) & 0xF;
          _os_log_fault_impl(&dword_1853B0000, v29, OS_LOG_TYPE_FAULT, "The last scene was removed with %i missing calls to endIgnoringInteractionEvents", buf, 8u);
        }
      }
      else
      {
        int v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25B6C0) + 8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)timespec buf = 67109120;
          int v41 = (applicationFlags >> 25) & 0xF;
          _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "The last scene was removed with %i missing calls to endIgnoringInteractionEvents", buf, 8u);
        }
      }
      -[UIApplication __forceEndIgnoringInteractionEvents]((uint64_t)self);
    }
  }
  if (v31)
  {
    uint64_t v28 = (void *)UIApp;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __77__UIApplication_workspace_willDestroyScene_withTransitionContext_completion___block_invoke;
    v34[3] = &unk_1E52DA040;
    id v35 = v31;
    [v28 _scheduleSceneEventResponseForScene:v10 withResponseBlock:v34];
  }
  kdebug_trace();
}

void __77__UIApplication_workspace_willDestroyScene_withTransitionContext_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F62B18]);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)workspace:(id)a3 didReceiveActions:(id)a4
{
  id v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  kdebug_trace();
  uint64_t v5 = +[_UISceneLifecycleMultiplexer sharedInstance];
  if ([v5 lifecycleWantsUnnecessaryDelayForSceneDelivery]
    && ([v5 activatedOnce] & 1) == 0)
  {
    actionsPendingInitialization = self->_actionsPendingInitialization;
    if (!actionsPendingInitialization)
    {
      id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v8 = self->_actionsPendingInitialization;
      self->_actionsPendingInitialization = v7;

      actionsPendingInitialization = self->_actionsPendingInitialization;
    }
    [(NSMutableSet *)actionsPendingInitialization unionSet:v9];
  }
  else
  {
    [(UIApplication *)self _handleNonLaunchSpecificActions:v9 forScene:0 withTransitionContext:0 completion:0];
  }
  kdebug_trace();
}

- (void)_startHangTracer
{
  byte_1EB25B4F9 = 0;
  [(UIApplication *)self _updateHangTracer];
}

- (double)_execOrResumeTime
{
  return *(double *)&__ExecOrResumeTime;
}

- (double)_launchTime
{
  return *(double *)&__LaunchTime;
}

+ (BOOL)shouldBackgroundMainThreadOnSuspendedLaunch
{
  return 1;
}

- (void)_runWithDaemonScene:(id)a3 completion:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v36 = a4;
  kdebug_trace();
  unint64_t v7 = [(_UIApplicationInfoParser *)self->_appInfo interfaceOrientation];
  if (v7 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  *((void *)&self->_applicationFlags + 1) &= ~0x800000000uLL;
  BSSetMainThreadPriorityFixedForUI();
  id v9 = +[UIScreen mainScreen];
  unint64_t v35 = v8;
  [v9 _setInterfaceOrientation:v8];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v10 = +[UIScreen mainScreen];
  id v11 = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 forScreen:v10];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v43 + 1) + 8 * i) _updateTransformLayer];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v13);
  }

  [(UIApplication *)self setReceivesMemoryWarnings:1];
  long long v37 = v6;
  uint64_t v16 = +[UIScene _sceneForFBSScene:v6];
  [(UIApplication *)self _callInitializationDelegatesWithActions:0 forCanvas:v16 payload:0 fromOriginatingProcess:0];

  [(UIApplication *)self _stopDeactivatingForReason:10];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v17 = +[UIWindow allWindowsIncludingInternalWindows:0 onlyVisibleWindows:1];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        uint64_t v23 = [v22 _delegateViewController];
        if (v23)
        {
        }
        else if (([v22 _isTextEffectsWindow] & 1) == 0)
        {
          uint64_t v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &_runWithDaemonScene_completion____s_category)+ 8);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)timespec buf = 0;
            _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "Application windows are expected to have a root view controller at the end of application launch", buf, 2u);
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v19);
  }

  [(UIApplication *)self _fixupBackgroundHitTestWindow];
  uint64_t applicationFlags = (uint64_t)self->_applicationFlags;
  if ((applicationFlags & 0x80000) == 0)
  {
    uint64_t v26 = *((void *)&self->_applicationFlags + 1);
    *(void *)&self->_uint64_t applicationFlags = applicationFlags | 0x80000;
    *((void *)&self->_applicationFlags + 1) = v26;
  }
  int64_t v27 = v35;
  if (v35 >= 5) {
    int64_t v27 = +[UIDevice currentDeviceOrientationAllowingAmbiguous:1];
  }
  if ((unint64_t)(v27 - 1) <= 3)
  {
    uint64_t v28 = +[UIDevice currentDevice];
    if (([v28 isGeneratingDeviceOrientationNotifications] & 1) == 0) {
      *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFF1FFFFLL | (v27 << 17);
    }
    [v28 setOrientation:v27 animated:0];
  }
  p_uint64_t applicationFlags = &self->_applicationFlags;
  uint64_t v30 = (uint64_t)self->_applicationFlags;
  if ((v30 & 0x80000) != 0)
  {
    uint64_t v33 = *((void *)&self->_applicationFlags + 1);
    *(void *)p_uint64_t applicationFlags = v30 & 0xFFFFFFFFFFF7FFFFLL;
    *((void *)&self->_applicationFlags + 1) = v33;
    uint64_t v34 = self;
    uint64_t v32 = v36;
    [(UIApplication *)v34 _reportMainSceneUpdateFinished:v36];
    *(void *)p_applicationFlags |= 0x80000uLL;
  }
  else
  {
    id v31 = self;
    uint64_t v32 = v36;
    [(UIApplication *)v31 _reportMainSceneUpdateFinished:v36];
  }
  kdebug_trace();
}

uint64_t __64__UIApplication__runWithMainScene_transitionContext_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOrientation:*(void *)(a1 + 40) animated:1];
}

uint64_t __64__UIApplication__runWithMainScene_transitionContext_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveSnapshotWithName:@"AutomaticDefaultPNG"];
}

- (int64_t)_currentExpectedInterfaceOrientation
{
  p_uint64_t applicationFlags = &self->_applicationFlags;
  uint64_t v4 = *((void *)&self->_applicationFlags + 1);
  int64_t result = (v4 >> 17) & 7;
  if (!result)
  {
    int64_t result = [(UIApplication *)self _safeInterfaceOrientationForNoWindow];
    uint64_t v4 = *((void *)p_applicationFlags + 1);
  }
  *(void *)&self->_uint64_t applicationFlags = *(void *)p_applicationFlags;
  *((void *)&self->_applicationFlags + 1) = v4 & 0xFFFFFFFFFFF1FFFFLL;
  return result;
}

- (void)_unregisterForSignificantTimeChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v3 = (const void *)UIApp;
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v3, @"SignificantTimeChangeNotification", 0);
}

- (void)_unregisterForLanguageChangedNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v3 = (const void *)UIApp;
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v3, @"com.apple.language.changed", 0);
}

- (void)_unregisterForLocaleChangedNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v3 = (const void *)UIApp;
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v3, @"AppleNumberPreferencesChangedNotification", 0);
}

- (void)_unregisterForTimeChangedNotification
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  uint64_t v3 = (const void *)UIApp;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D200];
  CFNotificationCenterRemoveObserver(LocalCenter, v3, v4, 0);
}

void __54__UIApplication__registerForNameLayerTreeNotification__block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v5 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v0 = +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0, 0);
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
        [*(id *)(*((void *)&v5 + 1) + 8 * v4++) _recursivelyNameLayerTree];
      }
      while (v2 != v4);
      uint64_t v2 = [v0 countByEnumeratingWithState:&v5 objects:v9 count:16];
    }
    while (v2);
  }

  NSLog(&cfstr_NamedWindows.isa);
}

uint64_t __54__UIApplication__registerForNameLayerTreeNotification__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__UIApplication__registerForNameLayerTreeNotification__block_invoke_3(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  uint64_t v3 = state64;
  uint64_t result = getpid();
  if (v3 == (int)result) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return result;
}

- (int)_loadMainNibFileNamed:(id)a3 bundle:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v7 = [a4 loadNibNamed:v6 owner:self options:0];
  topLevelNibObjects = self->_topLevelNibObjects;
  self->_topLevelNibObjects = v7;

  if (self->_topLevelNibObjects)
  {
    int v9 = 0;
  }
  else
  {
    uint64_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &_loadMainNibFileNamed_bundle____s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Failed to load NSMainNibFile %@.", (uint8_t *)&v12, 0xCu);
    }
    int v9 = 2;
  }

  return v9;
}

- (id)_storyboardInitialMenu
{
  id storyboardInitialMenu = self->_storyboardInitialMenu;
  if (!storyboardInitialMenu)
  {
    uint64_t v4 = [(UIApplication *)self _mainStoryboardName];
    if ([(UIApplication *)self _hasStoryboard])
    {
      long long v5 = [MEMORY[0x1E4F28B50] mainBundle];
      id v6 = +[UIStoryboard storyboardWithName:v4 bundle:v5];

      long long v7 = [v6 _instantiateInitialMenu];
      id v8 = self->_storyboardInitialMenu;
      self->_id storyboardInitialMenu = v7;
    }
    id storyboardInitialMenu = self->_storyboardInitialMenu;
  }
  return storyboardInitialMenu;
}

- (id)userInfoDictionaryForRunLoopMode:(id)a3 requester:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v14[0] = @"_UIApplicationRunLoopMode";
    v14[1] = @"_UIApplicationRunLoopModeRequesterUserInfoKey";
    v15[0] = a3;
    v15[1] = a4;
    long long v5 = (void *)MEMORY[0x1E4F1C9E8];
    id v6 = a4;
    id v7 = a3;
    id v8 = [v5 dictionaryWithObjects:v15 forKeys:v14 count:2];
  }
  else
  {
    int v12 = @"_UIApplicationRunLoopMode";
    id v13 = a3;
    int v9 = (void *)MEMORY[0x1E4F1C9E8];
    id v10 = a3;
    id v8 = [v9 dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v6 = 0;
  }

  return v8;
}

- (void)pushRunLoopMode:(id)a3
{
}

- (void)pushRunLoopMode:(id)a3 requester:(id)a4
{
}

- (void)_pushRunLoopMode:(id)a3 requester:(id)a4 reason:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  if ([(id)UIApp _isSpringBoard])
  {
    id v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("SpringBoardRunLoopMode", &_pushRunLoopMode_requester_reason____s_category)+ 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = v11;
      id v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      int v17 = 138544130;
      uint64_t v18 = v8;
      __int16 v19 = 2114;
      id v20 = v10;
      __int16 v21 = 2114;
      id v22 = v14;
      __int16 v23 = 2050;
      id v24 = v9;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "Push:%{public}@ \"%{public}@\" requester:<%{public}@ %{public}p>", (uint8_t *)&v17, 0x2Au);
    }
  }
  _UIApplicationInstallAutoreleasePoolsIfNecessaryForMode(v8);
  GSEventPushRunLoopMode();
  char v15 = [(UIApplication *)self userInfoDictionaryForRunLoopMode:v8 requester:v9];
  uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 postNotificationName:@"_UIApplicationRunLoopModePushNotification" object:self userInfo:v15];
}

- (void)popRunLoopMode:(id)a3
{
}

- (void)popRunLoopMode:(id)a3 requester:(id)a4
{
}

- (void)_popRunLoopMode:(id)a3 requester:(id)a4 reason:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(id)UIApp _isSpringBoard])
  {
    id v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("SpringBoardRunLoopMode", &_popRunLoopMode_requester_reason____s_category)+ 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = v11;
      id v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      int v17 = 138544130;
      id v18 = v8;
      __int16 v19 = 2114;
      id v20 = v10;
      __int16 v21 = 2114;
      id v22 = v14;
      __int16 v23 = 2050;
      id v24 = v9;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "Pop:%{public}@ \"%{public}@\" requester:<%{public}@ %{public}p>", (uint8_t *)&v17, 0x2Au);
    }
  }
  GSEventPopRunLoopMode();
  char v15 = [(UIApplication *)self userInfoDictionaryForRunLoopMode:v8 requester:v9];
  uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 postNotificationName:@"_UIApplicationRunLoopModePopNotification" object:self userInfo:v15];
}

- (BOOL)isNetworkActivityIndicatorVisible
{
  return 0;
}

- (BOOL)handleDoubleHeightStatusBarTapWithStyleOverride:(unint64_t)a3
{
  return 0;
}

- (BOOL)handleStatusBarHoverActionForRegion:(int64_t)a3
{
  return 0;
}

+ (Class)_statusBarClass
{
  return (Class)objc_opt_class();
}

+ (Class)_statusBarWindowClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_hostsSystemStatusBar
{
  return 1;
}

- (void)_createStatusBarWithRequestedStyle:(int64_t)a3 orientation:(int64_t)a4 hidden:(BOOL)a5
{
}

- (void)_createStatusBarWithRequestedStyle:(int64_t)a3 orientation:(int64_t)a4 hidden:(BOOL)a5 forWindowScene:(id)a6
{
  id v9 = a6;
  if (![(UIApplication *)self _isSpringBoard])
  {
    if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_RaiseForStatusBarCreation, @"RaiseForStatusBarCreation", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1E8FD53C4)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      id v11 = v10;
      SEL v12 = a2;
      id v13 = self;
      uint64_t v14 = 5915;
LABEL_11:
      [v10 handleFailureInMethod:v12 object:v13 file:@"UIApplication.m" lineNumber:v14 description:@"App called -statusBar or -statusBarWindow on UIApplication: this code must be changed as there's no longer a status bar or status bar window. Use the statusBarManager object on the window scene instead."];

      goto LABEL_12;
    }
    if (!_UIIsPrivateMainBundle())
    {
      if (!dyld_program_sdk_at_least()) {
        goto LABEL_12;
      }
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      id v11 = v10;
      SEL v12 = a2;
      id v13 = self;
      uint64_t v14 = 5921;
      goto LABEL_11;
    }
    if (os_variant_has_internal_diagnostics())
    {
      id v22 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)timespec buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v22, OS_LOG_TYPE_FAULT, "App called -statusBar or -statusBarWindow on UIApplication: this code must be changed as there's no longer a status bar or status bar window. Use the statusBarManager object on the window scene instead.", buf, 2u);
      }
    }
    else
    {
      char v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_createStatusBarWithRequestedStyle_orientation_hidden_forWindowScene____s_category)+ 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int16 v23 = 0;
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "App called -statusBar or -statusBarWindow on UIApplication: this code must be changed as there's no longer a status bar or status bar window. Use the statusBarManager object on the window scene instead.", v23, 2u);
      }
    }
  }
LABEL_12:
  kdebug_trace();
  id v16 = objc_alloc((Class)[(id)objc_opt_class() _statusBarClass]);
  +[UIStatusBar_Base _heightForStyle:0 orientation:1 forStatusBarFrame:1 inWindow:0];
  id v18 = (UIStatusBar *)objc_msgSend(v16, "initWithFrame:", 0.0, 0.0, 0.0, v17);
  statusBar = self->_statusBar;
  self->_statusBar = v18;

  [(UIStatusBar_Base *)self->_statusBar setStyleDelegate:self];
  kdebug_trace();
  kdebug_trace();
  id v20 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_statusBarWindowClass")), "_initWithOrientation:", a4);
  kdebug_trace();
  [(UIApplication *)self _setStatusBarWindow:v20 forScene:v9];
  __int16 v21 = [v9 statusBarManager];

  if (v21)
  {
    kdebug_trace();
    [v21 updateStatusBarAppearance];
    kdebug_trace();
  }
  kdebug_trace();
  [v20 setStatusBar:self->_statusBar];
  [v20 setOrientation:a4 animationParameters:0];
  [v20 setWindowLevel:1000.0];
  [v20 _orderFrontWithoutMakingKey];
  kdebug_trace();
}

- (id)statusBarWindow
{
  [(UIApplication *)self _createStatusBarIfNeededWithOrientation:0 forWindowScene:0];
  embeddedScreenStatusBarWindow = self->_embeddedScreenStatusBarWindow;
  return embeddedScreenStatusBarWindow;
}

- (id)_statusBarWindow
{
  if (dyld_program_sdk_at_least())
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"UIApplication.m" lineNumber:6017 description:@"The status bar window cannot be accessed from within an application."];
  }
  return 0;
}

- (id)_statusBarWindowIfExistsForScene:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  if (v4
    && ([v4 _screen],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 _isEmbeddedScreen],
        v6,
        (v7 & 1) == 0))
  {
    id v9 = objc_getAssociatedObject(self, &_UIApplicationAdditionalStatusBarWindowsKey);
    id v10 = [v5 _FBSScene];
    id v11 = [v10 identityToken];
    SEL v12 = [v11 stringRepresentation];
    id v13 = [v9 objectForKey:v12];
    embeddedScreenStatusBarWindow = v13;
    if (!v13) {
      embeddedScreenStatusBarWindow = self->_embeddedScreenStatusBarWindow;
    }
    id v8 = embeddedScreenStatusBarWindow;
  }
  else
  {
    id v8 = self->_embeddedScreenStatusBarWindow;
  }

  return v8;
}

- (void)_setStatusBarWindow:(id)a3 forScene:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  char v7 = v6;
  if (v6
    && ([v6 _screen],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 _isEmbeddedScreen],
        v8,
        (v9 & 1) == 0))
  {
    embeddedScreenStatusBarWindow = objc_getAssociatedObject(self, &_UIApplicationAdditionalStatusBarWindowsKey);
    if (!embeddedScreenStatusBarWindow)
    {
      embeddedScreenStatusBarWindow = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0x10000 valueOptions:5 capacity:2];
      objc_setAssociatedObject(self, &_UIApplicationAdditionalStatusBarWindowsKey, embeddedScreenStatusBarWindow, (void *)1);
    }
    SEL v12 = [v7 _FBSScene];
    id v13 = [v12 identityToken];
    uint64_t v14 = [v13 stringRepresentation];
    [embeddedScreenStatusBarWindow setObject:v15 forKey:v14];
  }
  else
  {
    id v10 = (UIStatusBarWindow *)v15;
    embeddedScreenStatusBarWindow = self->_embeddedScreenStatusBarWindow;
    self->_embeddedScreenStatusBarWindow = v10;
  }
}

- (void)_statusBarWindow:(id)a3 didMoveFromScene:(id)a4 toScene:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8) {
    [(UIApplication *)self _setStatusBarWindow:0 forScene:v8];
  }
  if (v9) {
    [(UIApplication *)self _setStatusBarWindow:v10 forScene:v9];
  }
}

- (id)_findWindowForControllingOverallAppearance
{
  return +[UIWindow _findWindowForControllingOverallAppearance];
}

- (void)_setBackgroundStyle:(int64_t)a3
{
  id v5 = [(UIApplication *)self _mainScene];
  id v4 = +[UIScene _sceneForFBSScene:v5];
  [v4 _setBackgroundStyle:a3];
}

- (id)_implicitStatusBarAnimationParametersWithClass:(Class)a3
{
  id v4 = +[UIView _currentAnimationAttributes];
  if (v4)
  {
    id v5 = (void *)[[a3 alloc] initWithDefaultParameters];
    [v4 _duration];
    objc_msgSend(v5, "setDuration:");
    [v4 _delay];
    objc_msgSend(v5, "setDelay:");
    objc_msgSend(v5, "setCurve:", objc_msgSend(v4, "_curve"));
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_implicitStatusBarStyleAnimationParametersWithViewController:(id)a3
{
  id v4 = [a3 _preferredStatusBarStyleAnimationParameters];
  if (!v4)
  {
    id v4 = [(UIApplication *)self _implicitStatusBarAnimationParametersWithClass:objc_opt_class()];
    [v4 setStyleAnimation:1];
  }
  return v4;
}

- (id)_implicitStatusBarHiddenAnimationParametersWithViewController:(id)a3 animation:(int64_t)a4
{
  id v6 = [a3 _preferredStatusBarHideAnimationParameters];
  if (!v6)
  {
    id v6 = [(UIApplication *)self _implicitStatusBarAnimationParametersWithClass:objc_opt_class()];
    [v6 setHideAnimation:a4];
  }
  return v6;
}

void __55__UIApplication_setStatusBarStyle_animationParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 statusBarManager];
  [v3 updateStatusBarAppearanceWithAnimationParameters:*(void *)(a1 + 32)];
}

- (void)setStatusBarStyle:(int64_t)a3 animation:(int)a4 startTime:(double)a5 duration:(double)a6 curve:(int64_t)a7
{
  if (a4)
  {
    uint64_t v12 = *(void *)&a4;
    id v13 = [[UIStatusBarStyleAnimationParameters alloc] initWithDefaultParameters];
    [(UIStatusBarStyleAnimationParameters *)v13 setStyleAnimation:v12];
    [(UIStatusBarAnimationParameters *)v13 setStartTime:a5];
    [(UIStatusBarAnimationParameters *)v13 setDuration:a6];
    [(UIStatusBarAnimationParameters *)v13 setCurve:a7];
  }
  else
  {
    id v13 = 0;
  }
  [(UIApplication *)self setStatusBarStyle:a3 animationParameters:v13];
}

- (void)setStatusBarStyle:(int64_t)a3 animation:(int)a4
{
  if (a4)
  {
    uint64_t v6 = *(void *)&a4;
    char v7 = [[UIStatusBarStyleAnimationParameters alloc] initWithDefaultParameters];
    [(UIStatusBarStyleAnimationParameters *)v7 setStyleAnimation:v6];
  }
  else
  {
    char v7 = 0;
  }
  [(UIApplication *)self setStatusBarStyle:a3 animationParameters:v7];
}

- (void)setStatusBarStyle:(int64_t)a3 duration:(double)a4
{
  if (a4 <= 0.0)
  {
    char v7 = 0;
  }
  else
  {
    char v7 = [[UIStatusBarStyleAnimationParameters alloc] initWithDefaultParameters];
    [(UIStatusBarAnimationParameters *)v7 setDuration:a4];
  }
  [(UIApplication *)self setStatusBarStyle:a3 animationParameters:v7];
}

- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle animated:(BOOL)animated
{
  if (animated) {
    uint64_t v6 = [[UIStatusBarStyleAnimationParameters alloc] initWithDefaultParameters];
  }
  else {
    uint64_t v6 = 0;
  }
  char v7 = v6;
  [(UIApplication *)self setStatusBarStyle:statusBarStyle animationParameters:v6];
}

void __78__UIApplication_setStatusBarHidden_animationParameters_changeApplicationFlag___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 statusBarManager];
  [v3 updateStatusBarAppearanceWithAnimationParameters:*(void *)(a1 + 32)];
}

- (void)setStatusBarHidden:(BOOL)a3 duration:(double)a4 changeApplicationFlag:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  if (a4 <= 0.0)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [[UIStatusBarHideAnimationParameters alloc] initWithDefaultParameters];
    [(UIStatusBarAnimationParameters *)v9 setDuration:a4];
  }
  [(UIApplication *)self setStatusBarHidden:v6 animationParameters:v9 changeApplicationFlag:v5];
}

- (void)setStatusBarHidden:(BOOL)a3 duration:(double)a4
{
}

- (void)setStatusBarHidden:(BOOL)hidden animated:(BOOL)animated
{
}

- (void)_notifyWillChangeStatusBarFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (*((unsigned char *)&self->_applicationFlags + 6))
  {
    if ([(id)UIApp _appAdoptsUISceneLifecycle])
    {
      if (os_variant_has_internal_diagnostics())
      {
        id v13 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)timespec buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "deprecated app delegate method, -application:willChangeStatusBarFrame:, is incompatible with UIScene lifecycle", buf, 2u);
        }
      }
      else
      {
        uint64_t v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_notifyWillChangeStatusBarFrame____s_category) + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v14 = 0;
          _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "deprecated app delegate method, -application:willChangeStatusBarFrame:, is incompatible with UIScene lifecycle", v14, 2u);
        }
      }
    }
    -[UIApplicationDelegate application:willChangeStatusBarFrame:](self->_delegate, "application:willChangeStatusBarFrame:", self, x, y, width, height);
  }
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
  id v11 = [v9 dictionaryWithObject:v10 forKey:@"UIApplicationStatusBarFrameUserInfoKey"];
  [v8 postNotificationName:@"UIApplicationWillChangeStatusBarFrameNotification" object:self userInfo:v11];
}

- (void)_notifyDidChangeStatusBarFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ((*((unsigned char *)&self->_applicationFlags + 6) & 2) != 0)
  {
    if ([(id)UIApp _appAdoptsUISceneLifecycle])
    {
      if (os_variant_has_internal_diagnostics())
      {
        id v13 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)timespec buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "deprecated app delegate method, -application:didChangeStatusBarFrame:, is incompatible with UIScene lifecycle", buf, 2u);
        }
      }
      else
      {
        uint64_t v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_notifyDidChangeStatusBarFrame____s_category) + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v14 = 0;
          _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "deprecated app delegate method, -application:didChangeStatusBarFrame:, is incompatible with UIScene lifecycle", v14, 2u);
        }
      }
    }
    -[UIApplicationDelegate application:didChangeStatusBarFrame:](self->_delegate, "application:didChangeStatusBarFrame:", self, x, y, width, height);
  }
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
  id v11 = [v9 dictionaryWithObject:v10 forKey:@"UIApplicationStatusBarFrameUserInfoKey"];
  [v8 postNotificationName:@"UIApplicationDidChangeStatusBarFrameNotification" object:self userInfo:v11];
}

- (void)setStatusBarOrientation:(int64_t)a3 fromOrientation:(int64_t)a4 windowScene:(id)a5 animationParameters:(id)a6 updateBlock:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v85 = a7;
  if (!a4) {
    a4 = [v12 interfaceOrientation];
  }
  uint64_t v14 = [(UIApplication *)self _defaultSceneIfExists];
  uint64_t v15 = +[UIScene _sceneForFBSScene:v14];

  if (v12) {
    BOOL v16 = v15 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  BOOL v84 = (void *)v15;
  char v18 = !v16 && v15 == (void)v12;
  char v83 = v18;
  id v19 = v12;
  id v20 = [v19 statusBarManager];
  if (v12)
  {
    __int16 v21 = v19;
  }
  else if ([(id)UIApp _appAdoptsUISceneLifecycle])
  {
    __int16 v21 = 0;
  }
  else
  {
    id v22 = [(UIApplication *)self _defaultUIWindowHostingUISceneOrMainScreenPlaceholderIfExists];
    uint64_t v81 = [v22 _statusBarManager];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = v22;
    }
    else
    {
      if (qword_1EB25B5B8 != -1) {
        dispatch_once(&qword_1EB25B5B8, &__block_literal_global_1234);
      }
      if (!byte_1EB25B4E3)
      {
        if (qword_1EB25B5C8 != -1) {
          dispatch_once(&qword_1EB25B5C8, &__block_literal_global_1247_0);
        }
        if (!byte_1EB25B4E4)
        {
          if (os_variant_has_internal_diagnostics())
          {
            char v80 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)id v91 = 0;
              _os_log_fault_impl(&dword_1853B0000, v80, OS_LOG_TYPE_FAULT, "Forced fallback to deprecated retrieval of a windowScene with -[UIApplication _findUISceneForLegacyInterfaceOrientation]", v91, 2u);
            }
          }
          else
          {
            uint64_t v77 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25B738) + 8);
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)id v90 = 0;
              _os_log_impl(&dword_1853B0000, v77, OS_LOG_TYPE_ERROR, "Forced fallback to deprecated retrieval of a windowScene with -[UIApplication _findUISceneForLegacyInterfaceOrientation]", v90, 2u);
            }
          }
        }
      }
      id v23 = [(UIApplication *)self _findUISceneForLegacyInterfaceOrientation];
    }
    __int16 v21 = v23;

    id v20 = (void *)v81;
  }
  double v24 = 0.0;
  if (([v20 isStatusBarHidden] & 1) == 0)
  {
    [v20 defaultStatusBarHeightInOrientation:a3];
    double v24 = v25;
  }
  if (a4 != a3)
  {
    if ((*((unsigned char *)&self->_applicationFlags + 5) & 0x40) != 0
      && [(id)UIApp _appAdoptsUISceneLifecycle])
    {
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v78 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)id v89 = 0;
          _os_log_fault_impl(&dword_1853B0000, v78, OS_LOG_TYPE_FAULT, "deprecated app delegate method, -application:willChangeStatusBarOrientation:duration:, is incompatible with UIScene lifecycle", v89, 2u);
        }
      }
      else
      {
        uint64_t v75 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25B740) + 8);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)timespec buf = 0;
          _os_log_impl(&dword_1853B0000, v75, OS_LOG_TYPE_ERROR, "deprecated app delegate method, -application:willChangeStatusBarOrientation:duration:, is incompatible with UIScene lifecycle", buf, 2u);
        }
      }
    }
    id v82 = v19;
    uint64_t v26 = v13;
    int64_t v27 = v21;
    if ((*((unsigned char *)&self->_applicationFlags + 5) & 0x40) != 0)
    {
      delegate = self->_delegate;
      [v26 duration];
      -[UIApplicationDelegate application:willChangeStatusBarOrientation:duration:](delegate, "application:willChangeStatusBarOrientation:duration:", self, a3);
    }
    int v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
    id v31 = [NSNumber numberWithInt:a3];
    uint64_t v32 = [v30 dictionaryWithObject:v31 forKey:@"UIApplicationStatusBarOrientationUserInfoKey"];
    [v29 postNotificationName:@"UIApplicationWillChangeStatusBarOrientationNotification" object:self userInfo:v32];

    +[UIView _updateOrientationForMotionEngine:a3];
    if ([(id)UIApp _appAdoptsUISceneLifecycle])
    {
      [v20 statusBarFrameForStatusBarHeight:v24];
      __int16 v21 = v27;
    }
    else
    {
      [(UIApplication *)self statusBarFrameForOrientation:a3];
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      __int16 v21 = v27;
      [v27 _referenceBounds];
      double v33 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(a3, v35, v37, v39, v41, v42, v43);
    }
    [(UIApplication *)self _notifyWillChangeStatusBarFrame:v33];
    [(UIApplication *)self _setIdleTimerDisabled:1 forReason:@"UIAppOrientationChange"];
    [(UIApplication *)self _setIdleTimerDisabled:0 forReason:@"UIAppOrientationChange"];
    id v13 = v26;
    id v19 = v82;
  }
  if (![(UIApplication *)self _isSpringBoard])
  {
    long long v44 = +[UIScreen mainScreen];
    if (v12) {
      char v45 = v83;
    }
    else {
      char v45 = 1;
    }
    if ((v45 & 1) == 0)
    {
      uint64_t v46 = [v21 screen];

      long long v44 = (void *)v46;
    }
    [v44 _setInterfaceOrientation:a3];
  }
  uint64_t v47 = v85;
  if (v85) {
    (*((void (**)(id))v85 + 2))(v85);
  }
  char v48 = [(UIApplication *)self _statusBarWindowIfExistsForScene:v19];
  [v48 setOrientation:a3 animationParameters:v13];

  [v13 duration];
  objc_msgSend(v19, "_updateClientSettingsToInterfaceOrientation:withAnimationDuration:", a3);
  if (a4 != a3)
  {
    double v49 = 0.0;
    if (([v20 isStatusBarHidden] & 1) == 0)
    {
      [v20 defaultStatusBarHeightInOrientation:a4];
      double v49 = v50;
    }
    if (v24 != v49)
    {
      +[UIWindow _noteStatusBarHeightChanged:v24 oldHeight:v49];
      if (!v13 || ([v13 duration], v51 == 0.0))
      {
        uint64_t v57 = 0;
      }
      else
      {
        unint64_t v52 = (void *)MEMORY[0x1E4F1C9E8];
        objc_msgSend(NSNumber, "numberWithDouble:");
        id v53 = v19;
        id v54 = v13;
        v56 = char v55 = v21;
        uint64_t v57 = [v52 dictionaryWithObject:v56 forKey:@"UIApplicationStatusBarHeightChangedDurationKey"];

        __int16 v21 = v55;
        id v13 = v54;
        id v19 = v53;
      }
      uint64_t v58 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v58 postNotificationName:@"UIApplicationStatusBarHeightChangedNotification" object:self userInfo:v57];
    }
    uint64_t v59 = v21;
    if ((*((unsigned char *)&self->_applicationFlags + 5) & 0x80) != 0)
    {
      if ([(id)UIApp _appAdoptsUISceneLifecycle])
      {
        if (os_variant_has_internal_diagnostics())
        {
          int v79 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)int v87 = 0;
            _os_log_fault_impl(&dword_1853B0000, v79, OS_LOG_TYPE_FAULT, "deprecated app delegate method, -application:didChangeStatusBarOrientation:, is incompatible with UIScene lifecycle", v87, 2u);
          }

          uint64_t v47 = v85;
        }
        else
        {
          uint64_t v76 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25B748) + 8);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)id v86 = 0;
            _os_log_impl(&dword_1853B0000, v76, OS_LOG_TYPE_ERROR, "deprecated app delegate method, -application:didChangeStatusBarOrientation:, is incompatible with UIScene lifecycle", v86, 2u);
          }
        }
      }
      [(UIApplicationDelegate *)self->_delegate application:self didChangeStatusBarOrientation:a4];
    }
    uint64_t v60 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v61 = (void *)MEMORY[0x1E4F1C9E8];
    id v62 = [NSNumber numberWithInt:a4];
    char v63 = [v61 dictionaryWithObject:v62 forKey:@"UIApplicationStatusBarOrientationUserInfoKey"];
    [v60 postNotificationName:@"UIApplicationDidChangeStatusBarOrientationNotification" object:self userInfo:v63];

    if ([(id)UIApp _appAdoptsUISceneLifecycle])
    {
      [v20 statusBarFrameForStatusBarHeight:a4 inOrientation:v49];
      __int16 v21 = v59;
    }
    else
    {
      [(UIApplication *)self statusBarFrameForOrientation:a4];
      double v66 = v65;
      double v68 = v67;
      double v70 = v69;
      double v72 = v71;
      __int16 v21 = v59;
      [v59 _referenceBounds];
      double v64 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(a4, v66, v68, v70, v72, v73, v74);
    }
    [(UIApplication *)self _notifyDidChangeStatusBarFrame:v64];
  }
}

- (void)setStatusBarOrientation:(int64_t)a3 animationParameters:(id)a4
{
  id v6 = a4;
  id v8 = [(UIApplication *)self _defaultSceneIfExists];
  char v7 = +[UIScene _sceneForFBSScene:v8];
  [(UIApplication *)self setStatusBarOrientation:a3 fromOrientation:0 windowScene:v7 animationParameters:v6 updateBlock:0];
}

- (void)setStatusBarOrientation:(int64_t)a3 animation:(int)a4 duration:(double)a5
{
  char v7 = 0;
  if (a4 && a5 > 0.0)
  {
    uint64_t v9 = *(void *)&a4;
    id v10 = [[UIStatusBarOrientationAnimationParameters alloc] initWithDefaultParameters];
    [(UIStatusBarOrientationAnimationParameters *)v10 setOrientationAnimation:v9];
    [(UIStatusBarAnimationParameters *)v10 setDuration:a5];
    char v7 = v10;
  }
  id v11 = v7;
  -[UIApplication setStatusBarOrientation:animationParameters:](self, "setStatusBarOrientation:animationParameters:", a3, v7, a5);
}

- (void)_setStatusBarOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (a4) {
    id v6 = [[UIStatusBarOrientationAnimationParameters alloc] initWithDefaultParameters];
  }
  else {
    id v6 = 0;
  }
  char v7 = v6;
  [(UIApplication *)self setStatusBarOrientation:a3 animationParameters:v6];
}

- (void)_setStatusBarOrientation:(int64_t)a3
{
}

- (void)setStatusBarOrientation:(UIInterfaceOrientation)interfaceOrientation animated:(BOOL)animated
{
  BOOL v4 = animated;
  if (dyld_program_sdk_at_least())
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "-[UIApplication setStatusBarOrientation:] and -[UIApplication setStatusBarOrientation:animated:] API have been deprecated on iOS 8.0 and are no-ops on iOS 13.0", v12, 2u);
      }
    }
    else
    {
      char v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25B750) + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)timespec buf = 0;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "-[UIApplication setStatusBarOrientation:] and -[UIApplication setStatusBarOrientation:animated:] API have been deprecated on iOS 8.0 and are no-ops on iOS 13.0", buf, 2u);
      }
    }
    if (os_variant_has_internal_diagnostics())
    {
      id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25B758) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Dead deprecated API use (-[UIApplication setStatusBarOrientation:]). For apps to fix, not UIKit. Please update as soon as possible. As a stopgap, similar SPI still operates", v10, 2u);
      }
    }
  }
  else
  {
    if (qword_1EB25B760 != -1) {
      dispatch_once(&qword_1EB25B760, &__block_literal_global_1555);
    }
    if ((byte_1EB25B4FB & 1) == 0
      && [(UIApplication *)self _isAutorotationDisabledForAppWindows])
    {
      [(UIApplication *)self _setStatusBarOrientation:interfaceOrientation animated:v4];
    }
  }
}

void __50__UIApplication_setStatusBarOrientation_animated___block_invoke()
{
  v0 = _UIMainBundleIdentifier();
  int v1 = [v0 isEqualToString:@"com.google.ios.youtube"];

  if (v1) {
    byte_1EB25B4FB = 1;
  }
}

- (void)setStatusBarOrientation:(UIInterfaceOrientation)statusBarOrientation
{
}

- (int64_t)_carefulChoiceOrientationForWindow:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4
    && ([v4 screen],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 _isEmbeddedScreen],
        v6,
        !v7))
  {
    int64_t v8 = [(UIApplication *)self _safeInterfaceOrientationForWindowIfExists:v5];
  }
  else
  {
    int64_t v8 = [(UIApplication *)self _carefulChoiceOrientation];
  }
  int64_t v9 = v8;

  return v9;
}

- (int64_t)_fallbackInterfaceOrientationForSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4 currentOrientation:(int64_t)a5
{
  int64_t v9 = +[UIDevice currentDevice];
  uint64_t v10 = [v9 orientation];

  if ((unint64_t)(v10 - 1) >= 4) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  if (!a5) {
    a5 = [(UIApplication *)self _defaultSceneInterfaceOrientationReturningUnknownForNilScene:0];
  }
  if (_viewServiceFallbackOrientationMapResolver) {
    id v12 = (id)_viewServiceFallbackOrientationMapResolver;
  }
  else {
    id v12 = (id)[objc_alloc(MEMORY[0x1E4F4F6D8]) initWithTargetOrientation:v11 currentOrientation:a5];
  }
  id v13 = v12;
  int64_t v14 = [v12 interfaceOrientationForSupportedOrientations:a3 preferredOrientation:a4];

  return v14;
}

- (NSTimeInterval)statusBarOrientationAnimationDuration
{
  return 0.3;
}

- (id)_systemNavigationAction
{
  return self->_systemNavigationAction;
}

- (void)_setSystemNavigationAction:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (UISystemNavigationAction *)a3;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("StatusBar", &_setSystemNavigationAction____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    uint64_t v11 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = v11;
      id v13 = [(UISystemNavigationAction *)v5 titleForDestination:0];
      int64_t v14 = [(UISystemNavigationAction *)v5 URLForDestination:1];
      int v15 = 138412802;
      BOOL v16 = v5;
      __int16 v17 = 2112;
      char v18 = v13;
      __int16 v19 = 2112;
      id v20 = v14;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Setting system navigation action: %@. Primary title: “%@”, secondary URL: “%@”", (uint8_t *)&v15, 0x20u);
    }
  }
  p_systemNavigationAction = &self->_systemNavigationAction;
  systemNavigationAction = self->_systemNavigationAction;
  if (systemNavigationAction != v5)
  {
    if (systemNavigationAction)
    {
      [(UISystemNavigationAction *)systemNavigationAction invalidate];
      int64_t v9 = *p_systemNavigationAction;
      *p_systemNavigationAction = 0;
    }
    objc_storeStrong((id *)&self->_systemNavigationAction, a3);
    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"UIApplicationSystemNavigationActionChangedNotification" object:self];
  }
}

- (void)_clearSystemNavigationAction
{
}

- (id)statusBarSystemNavigationAction:(id)a3
{
  return self->_systemNavigationAction;
}

- (void)setGlowAnimationEnabled:(BOOL)a3 forStyle:(int64_t)a4
{
}

- (void)setDoubleHeightStatusText:(id)a3 forStyle:(int64_t)a4
{
}

- (void)setDoubleHeightPrefixText:(id)a3
{
}

- (void)setDoubleHeightStatusText:(id)a3
{
  id v5 = a3;
  NSLog(&cfstr_UiapplicationS_0.isa);
  id v3 = _UIMainBundleIdentifier();
  if ([v3 isEqualToString:@"com.apple.VoiceMemos"])
  {
    uint64_t v4 = 206;
LABEL_5:
    +[UIStatusBarServer postDoubleHeightStatusString:v5 forStyle:v4];
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"com.apple.nike"])
  {
    uint64_t v4 = 201;
    goto LABEL_5;
  }
  NSLog(&cfstr_BundleIdNotRec.isa);
LABEL_7:
}

- (id)_defaultTopNavBarTintColor
{
  return 0;
}

- (BOOL)isRunningInTaskSwitcher
{
  uint64_t v2 = +[_UISceneLifecycleMultiplexer sharedInstance];
  char v3 = [v2 runningInTaskSwitcher];

  return v3;
}

- (BOOL)_isLaunchedSuspended
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 2) >> 2) & 1;
}

- (void)suspend
{
}

- (void)suspendReturningToLastApp:(BOOL)a3
{
  id v5 = [(UIApplication *)self _mainScene];
  if (v5)
  {
    char v3 = objc_alloc_init(UIDismissSceneAction);
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
    [v5 sendActions:v4];
  }
}

- (unsigned)_frontmostApplicationPort
{
  return 0;
}

+ (BOOL)isRunningEventPump
{
  int v2 = isRunningEventPump__isRunningEventPump;
  if (isRunningEventPump__isRunningEventPump == 255)
  {
    isRunningEventPump__isRunningEventPump = 0;
    mach_port_t sp = 0;
    if (bootstrap_look_up(*MEMORY[0x1E4F14638], "com.apple.eventpump", &sp)) {
      BOOL v3 = 0;
    }
    else {
      BOOL v3 = sp + 1 >= 2;
    }
    if (v3)
    {
      mach_port_deallocate(*MEMORY[0x1E4F14960], sp);
      isRunningEventPump__isRunningEventPump = 1;
    }
    int v2 = isRunningEventPump__isRunningEventPump;
  }
  return v2 != 0;
}

- (void)_scrollsToTopInitiatorView:(id)a3 touchesEnded:(id)a4 withEvent:(id)a5
{
  uint64_t v10 = (UIStatusBar *)a3;
  id v8 = a4;
  id v9 = a5;
  if (self->_statusBar == v10 && (*((unsigned char *)&self->_applicationFlags + 10) & 0x20) != 0) {
    [(UIApplicationDelegate *)self->_delegate _application:self statusBarTouchesEnded:v9];
  }
}

- (void)setWantsLockEvents:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v4 = (void (*)(BOOL))getSBSUIAppSetWantsLockButtonEventsSymbolLoc_ptr;
  uint64_t v11 = getSBSUIAppSetWantsLockButtonEventsSymbolLoc_ptr;
  if (!getSBSUIAppSetWantsLockButtonEventsSymbolLoc_ptr)
  {
    id v5 = SpringBoardServicesLibrary_1();
    v9[3] = (uint64_t)dlsym(v5, "SBSUIAppSetWantsLockButtonEvents");
    getSBSUIAppSetWantsLockButtonEventsSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    uint64_t v4 = (void (*)(BOOL))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v4)
  {
    v4(v3);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    int v7 = [NSString stringWithUTF8String:"void softlink_SBSUIAppSetWantsLockButtonEvents(BOOL)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"UIApplication.m", 483, @"%s", dlerror());

    __break(1u);
  }
}

- (void)_postSimpleRemoteNotificationForAction:(int64_t)a3 andContext:(int64_t)a4 trackID:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = NSNumber;
  id v10 = a5;
  uint64_t v11 = [v9 numberWithInteger:a3];
  id v12 = [NSNumber numberWithInteger:a4];
  objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v11, @"UIApplicationSimpleRemoteActionType", v12, @"UIApplicationSimpleRemoteActionContext", v10, @"UIApplicationSimpleRemoteActionTrackID", 0);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 postNotificationName:@"UIApplicationSimpleRemoteActionNotification" object:self userInfo:v14];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_UIPressesContainsPressType(v6, 102))
  {
    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v9 = v8;
    id v10 = @"_UIApplicationVolumeUpButtonDownNotification";
LABEL_7:
    [v8 postNotificationName:v10 object:0];

    goto LABEL_8;
  }
  if (_UIPressesContainsPressType(v6, 103))
  {
    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v9 = v8;
    id v10 = @"_UIApplicationVolumeDownButtonDownNotification";
    goto LABEL_7;
  }
  if (_UIPressesContainsPressType(v6, 601))
  {
    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v9 = v8;
    id v10 = @"_UIApplicationCameraShutterButtonDownNotification";
    goto LABEL_7;
  }
  if ((_UIPressesContainsPressType(v6, 7) & 1) == 0
    && (_UIPressesContainsPressType(v6, 6) & 1) == 0
    && (_UIPressesContainsPressType(v6, 5) & 1) == 0)
  {
    if (_UIPressesContainsDirectionalPress(v6))
    {
      [(UIApplication *)self _sendMoveEventWithPressesEvent:v7];
    }
    else if (_UIPressesContainsExternalKeyboardSource(v6))
    {
      [(UIApplication *)self _handleKeyboardPressEvent:v7];
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)UIApplication;
      [(UIResponder *)&v11 pressesBegan:v6 withEvent:v7];
    }
  }
LABEL_8:
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_UIPressesContainsPressType(v6, 102))
  {
    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v9 = v8;
    id v10 = @"_UIApplicationVolumeUpButtonUpNotification";
LABEL_7:
    [v8 postNotificationName:v10 object:0];
LABEL_8:

    goto LABEL_9;
  }
  if (_UIPressesContainsPressType(v6, 103))
  {
    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v9 = v8;
    id v10 = @"_UIApplicationVolumeDownButtonUpNotification";
    goto LABEL_7;
  }
  if (_UIPressesContainsPressType(v6, 601))
  {
    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v9 = v8;
    id v10 = @"_UIApplicationCameraShutterButtonUpNotification";
    goto LABEL_7;
  }
  if (_UIPressesContainsPressType(v6, 7))
  {
    objc_super v11 = UIUnhandledBackButtonAction;
LABEL_15:
    id v9 = (void *)[[v11 alloc] initWithInfo:0 responder:0];
    id v12 = _FBSSceneForPressesEvent(v6, v7);
    id v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    [v12 sendActions:v13];

    goto LABEL_8;
  }
  if (_UIPressesContainsPressType(v6, 6)) {
    goto LABEL_9;
  }
  if (_UIPressesContainsPressType(v6, 5))
  {
    *((void *)&self->_applicationFlags + 1) |= 0x400000000000uLL;
    objc_super v11 = UIUnhandledMenuButtonAction;
    goto LABEL_15;
  }
  if (_UIPressesContainsDirectionalPress(v6))
  {
    v14.receiver = self;
    v14.super_class = (Class)UIApplication;
    [(UIResponder *)&v14 pressesEnded:v6 withEvent:v7];
  }
  else if (_UIPressesContainsExternalKeyboardSource(v6))
  {
    [(UIApplication *)self _handleKeyboardPressEvent:v7];
  }
LABEL_9:
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((_UIPressesContainsPressType(v6, 201) & 1) == 0
    && (_UIPressesContainsPressType(v6, 102) & 1) == 0
    && (_UIPressesContainsPressType(v6, 103) & 1) == 0
    && (_UIPressesContainsPressType(v6, 601) & 1) == 0
    && (_UIPressesContainsPressType(v6, 7) & 1) == 0
    && (_UIPressesContainsPressType(v6, 6) & 1) == 0
    && (_UIPressesContainsPressType(v6, 5) & 1) == 0
    && (_UIPressesContainsDirectionalPress(v6) & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)UIApplication;
    [(UIResponder *)&v8 pressesCancelled:v6 withEvent:v7];
  }
}

- (void)_headsetButtonDown:(__IOHIDEvent *)a3
{
  *((void *)&self->_applicationFlags + 1) |= 0x100uLL;
}

- (void)_headsetButtonUp:(__IOHIDEvent *)a3
{
  uint64_t applicationFlags = (uint64_t)self->_applicationFlags;
  uint64_t v5 = *((void *)&self->_applicationFlags + 1);
  *((void *)&self->_applicationFlags + 1) = v5 & 0xFFFFFFFFFFFFFEFFLL;
  if ((v5 & 0x600) == 0)
  {
    uint64_t v6 = ((v5 >> 4) + 1) & 0xF;
    *(void *)&self->_uint64_t applicationFlags = applicationFlags;
    *((void *)&self->_applicationFlags + 1) = v5 & 0xFFFFFFFFFFFFFE0FLL | (16 * v6);
    if (v6 == 2)
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__handleHeadsetButtonClick object:0];
      id v7 = sel__handleHeadsetButtonDoubleClick;
    }
    else
    {
      if (v6 != 1)
      {
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__handleHeadsetButtonClick object:0];
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__handleHeadsetButtonDoubleClick object:0];
        [(UIApplication *)self _handleHeadsetButtonTripleClick];
        return;
      }
      id v7 = sel__handleHeadsetButtonClick;
    }
    [(UIApplication *)self performSelector:v7 withObject:0 afterDelay:0.3];
    return;
  }
  if ((v5 & 0x200) != 0)
  {
    *(void *)&self->_uint64_t applicationFlags = applicationFlags;
    *((void *)&self->_applicationFlags + 1) = v5 & 0xFFFFFFFFFFFFFCFFLL;
    uint64_t v8 = 9;
  }
  else
  {
    if ((v5 & 0x400) == 0) {
      return;
    }
    *(void *)&self->_uint64_t applicationFlags = applicationFlags;
    *((void *)&self->_applicationFlags + 1) = v5 & 0xFFFFFFFFFFFFFAFFLL;
    uint64_t v8 = 11;
  }
  [(UIApplication *)self _sendHeadsetOriginatedMediaRemoteCommand:v8];
}

- (void)_handleHeadsetButtonClick
{
  uint64_t v2 = *((void *)&self->_applicationFlags + 1);
  if ((v2 & 0xF0) == 0x10)
  {
    *(void *)&self->_uint64_t applicationFlags = self->_applicationFlags;
    *((void *)&self->_applicationFlags + 1) = v2 & 0xFFFFFFFFFFFFFF0FLL;
    if (![(UIApplication *)self _shouldIgnoreHeadsetClicks])
    {
      if (*((unsigned char *)&self->_applicationFlags + 9))
      {
        [(UIApplication *)self _sendHeadsetOriginatedMediaRemoteCommand:8];
        *((void *)&self->_applicationFlags + 1) |= 0x200uLL;
      }
      else
      {
        [(UIApplication *)self _sendHeadsetOriginatedMediaRemoteCommand:2];
      }
    }
  }
}

- (void)_handleHeadsetButtonDoubleClick
{
  uint64_t v2 = *((void *)&self->_applicationFlags + 1);
  if ((v2 & 0xF0) == 0x20)
  {
    *(void *)&self->_uint64_t applicationFlags = self->_applicationFlags;
    *((void *)&self->_applicationFlags + 1) = v2 & 0xFFFFFFFFFFFFFF0FLL;
    if (![(UIApplication *)self _shouldIgnoreHeadsetClicks])
    {
      uint64_t v4 = *((void *)&self->_applicationFlags + 1);
      if ((v4 & 0x100) != 0)
      {
        if ((v4 & 0x400) == 0)
        {
          [(UIApplication *)self _sendHeadsetOriginatedMediaRemoteCommand:10];
          *((void *)&self->_applicationFlags + 1) |= 0x400uLL;
        }
      }
      else
      {
        [(UIApplication *)self _sendHeadsetOriginatedMediaRemoteCommand:4];
      }
    }
  }
}

- (void)_handleHeadsetButtonTripleClick
{
  uint64_t v2 = *((void *)&self->_applicationFlags + 1);
  if (__CFSUB__(v2 & 0xF0, 32, 0))
  {
    *(void *)&self->_uint64_t applicationFlags = self->_applicationFlags;
    *((void *)&self->_applicationFlags + 1) = v2 & 0xFFFFFFFFFFFFFF0FLL;
    if (![(UIApplication *)self _shouldIgnoreHeadsetClicks])
    {
      [(UIApplication *)self _sendHeadsetOriginatedMediaRemoteCommand:5];
    }
  }
}

- (void)_terminateWithStatus:(int)a3
{
  _applicationTerminating = 1;
  [(UIApplication *)self reportApplicationSuspended];
  kdebug_trace();
  [(UIApplication *)self applicationWillTerminate];
  [(id)UIApp applicationState];
  [(UIApplicationDelegate *)self->_delegate methodForSelector:sel_applicationWillTerminate_];
  entr_act_modify();
  if ((*((unsigned char *)&self->_applicationFlags + 5) & 0x10) != 0) {
    [(UIApplicationDelegate *)self->_delegate applicationWillTerminate:self];
  }
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"UIApplicationWillTerminateNotification" object:self];

  _logApplicationLifecycleMemoryMetricApplicationWillBeSuspended();
  [(id)UIApp applicationState];
  entr_act_end();
  kdebug_trace();
  if ((*((unsigned char *)&self->_applicationFlags + 8) & 8) == 0)
  {
    CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v6 synchronize];
  }
  _exit(a3);
}

- (void)terminateWithSuccess
{
}

- (void)applicationSuspend
{
  *(void *)&self->_applicationFlags |= 0x400000000uLL;
}

- (void)_applicationDidEnterBackground
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__UIApplication__applicationDidEnterBackground__block_invoke;
  v7[3] = &unk_1E52D9F70;
  void v7[4] = self;
  +[UIViewController _performWithoutDeferringTransitions:v7];
  [(UIApplication *)self _saveApplicationPreservationStateIfSupported];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__UIApplication__applicationDidEnterBackground__block_invoke_2;
  v6[3] = &unk_1E52D9F70;
  void v6[4] = self;
  +[UIView performWithoutAnimation:v6];
  BOOL v3 = _UIApplicationWaitForBackgroundAssertionsToFlush();
  uint64_t v4 = _applicationLifecycleMemoryMetricLogHandle();
  if (os_signpost_enabled(v4))
  {
    uint64_t v5 = _MXSignpostMetricsSnapshot();
    *(_DWORD *)timespec buf = 138543362;
    id v9 = v5;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ApplicationDidEnterBackground", "\n%{public, signpost:metrics}@", buf, 0xCu);
  }

  if (v3) {
    *((void *)&self->_applicationFlags + 1) |= 0x4000000000000uLL;
  }
  else {
    _logApplicationLifecycleMemoryMetricApplicationWillBeSuspended();
  }
}

void __47__UIApplication__applicationDidEnterBackground__block_invoke(uint64_t a1)
{
  entr_act_begin();
  [*(id *)(*(void *)(a1 + 32) + 24) methodForSelector:sel_applicationDidEnterBackground_];
  entr_act_modify();
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 182) & 0x40) != 0
    && ([(id)UIApp _appAdoptsUICanvasLifecycle] & 1) == 0
    && ([(id)UIApp _appAdoptsUISceneLifecycle] & 1) == 0)
  {
    kdebug_trace();
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "applicationDidEnterBackground:");
    kdebug_trace();
  }
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"UIApplicationDidEnterBackgroundNotification" object:*(void *)(a1 + 32) userInfo:0];
}

uint64_t __47__UIApplication__applicationDidEnterBackground__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSystemNavigationAction:0];
}

- (void)_updateAppPriorityForSuspendedState
{
  if ([getPGPictureInPictureProxyClass() isPictureInPictureSupported])
  {
    if ([getPGPictureInPictureProxyClass() isPictureInPictureActive])
    {
      uint64_t v3 = *((void *)&self->_applicationFlags + 1);
      if ((v3 & 0x20000000000) == 0)
      {
        *(void *)&self->_uint64_t applicationFlags = self->_applicationFlags;
        *((void *)&self->_applicationFlags + 1) = v3 | 0x20000000000;
        id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v4 = getPGPictureInPictureProxyPictureInPictureActiveChangedNotification();
        [v5 addObserver:self selector:sel__pipStateDidChange name:v4 object:0];
      }
    }
    else if (!+[_UIViewServiceSessionManager hasActiveSessions])
    {
      BSSetMainThreadPriorityFixedForUI();
    }
  }
}

- (void)_handleSuspensionActions
{
  if ([(UIApplication *)self isRunningQuitTest]) {
    *((void *)&self->_applicationFlags + 1) |= 0xC000uLL;
  }
  if ([(UIApplication *)self isRunningSuspendTest])
  {
    *((void *)&self->_applicationFlags + 1) &= ~0x4000uLL;
    [(UIApplication *)self reportApplicationSuspended];
  }
}

- (void)_handleTaskCompletionAndTerminate:(id)a3
{
  if ([a3 waitForBackgroundTaskCompletion])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    void v4[2] = __51__UIApplication__handleTaskCompletionAndTerminate___block_invoke;
    v4[3] = &unk_1E52D9F70;
    v4[4] = self;
    _UIApplicationCallWhenBackgroundTaskCountReachesZero(v4);
  }
  else
  {
    [(UIApplication *)self _terminateWithStatus:0];
  }
}

uint64_t __51__UIApplication__handleTaskCompletionAndTerminate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminateWithStatus:0];
}

- (void)_pipStateDidChange
{
  if ([(UIApplication *)self isSuspended])
  {
    [(UIApplication *)self _updateAppPriorityForSuspendedState];
  }
}

- (void)_setCompatibilityModeOnSettings:(id)a3
{
}

- (void)updateSuspendedSettings:(id)a3
{
  id v4 = a3;
  [(UIApplication *)self defaultImageSnapshotExpiration];
  uint64_t v6 = v5;
  id v7 = [(UIApplication *)self _mainScene];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__UIApplication_updateSuspendedSettings___block_invoke;
  v9[3] = &unk_1E5302800;
  id v10 = v4;
  uint64_t v11 = v6;
  id v8 = v4;
  [v7 updateUIClientSettingsWithBlock:v9];
}

void __41__UIApplication_updateSuspendedSettings___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) objectForKey:@"UISuspendedStatusBarStyleKey"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v3 integerValue];
      [v8 setStatusBarStyle:v4];
      [v8 setDefaultStatusBarStyle:v4];
    }
  }
  uint64_t v5 = [*(id *)(a1 + 32) objectForKey:@"UISuspendedStatusBarHiddenKey"];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 BOOLValue];
      [v8 setStatusBarHidden:v6];
      [v8 setDefaultStatusBarHidden:v6];
    }
  }
  id v7 = [*(id *)(a1 + 32) objectForKey:@"UISuspendedDefaultPNGKey"];
  [v8 setDefaultPNGName:v7];
  [v8 setDefaultPNGExpirationTime:*(double *)(a1 + 40)];
}

- (BOOL)_canOpenURL:(id)a3 publicURLsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  id v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v8 = [v7 URLOverrideForURL:v6];

  id v9 = [v8 scheme];
  id v10 = v9;
  if (v4 && ([v9 isEqualToString:@"app-prefs"] & 1) != 0)
  {
    char v11 = 0;
  }
  else if ([v10 isEqualToString:@"app-settings"])
  {
    char v11 = 1;
  }
  else
  {
    id v16 = 0;
    char v11 = [v7 isApplicationAvailableToOpenURL:v8 includePrivateURLSchemes:!v4 error:&v16];
    id v12 = v16;
    id v13 = v12;
    if ((v11 & 1) == 0)
    {
      objc_super v14 = [v12 localizedDescription];
      NSLog(&cfstr_CanopenurlFail.isa, v8, v14);
    }
  }

  return v11;
}

- (BOOL)_shouldAttemptOpenURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"UIApplication.m", 7826, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  uint64_t v6 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v7 = [v6 URLOverrideForURL:v5];

  if ([v7 isFileURL])
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    id v9 = [v7 scheme];
    int v8 = [v9 isEqualToString:@"app-prefs"] ^ 1;
  }
  return v8;
}

- (id)_urlWithSettingsPrivateURLSchemeIfNeeded:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 scheme];
  int v5 = [v4 isEqualToString:@"app-settings"];

  if (v5)
  {
    uint64_t v6 = NSString;
    id v7 = _UIMainBundleIdentifier();
    int v8 = [v6 stringWithFormat:@"%@:%@", @"app-prefs", v7];

    id v9 = [v3 resourceSpecifier];
    char v10 = [v9 isEqualToString:@"notifications"];

    if (v10)
    {
      char v11 = @"&target=com.apple.settings.notifications";
    }
    else
    {
      id v12 = [v3 resourceSpecifier];
      int v13 = [v12 isEqualToString:@"default-applications"];

      if (!v13)
      {
LABEL_7:
        uint64_t v15 = [MEMORY[0x1E4F1CB10] URLWithString:v8];

        id v3 = (id)v15;
        goto LABEL_8;
      }
      char v11 = @"&target=com.apple.settings.default-applications";
    }
    uint64_t v14 = [v8 stringByAppendingString:v11];

    int v8 = (void *)v14;
    goto LABEL_7;
  }
LABEL_8:
  return v3;
}

- (BOOL)_openURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_UIIsPrivateMainBundle())
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        int v16 = 136315394;
        __int16 v17 = "BUG IN CLIENT OF UIKIT";
        __int16 v18 = 2080;
        __int16 v19 = "The caller of UIApplication.openURL(_:) needs to migrate to the non-deprecated UIApplication.open(_:option"
              "s:completionHandler:)";
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "%s: %s. Next release this will be a no-op. You have been warned.", (uint8_t *)&v16, 0x16u);
      }
    }
    else
    {
      int v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25B770) + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136315394;
        __int16 v17 = "BUG IN CLIENT OF UIKIT";
        __int16 v18 = 2080;
        __int16 v19 = "The caller of UIApplication.openURL(_:) needs to migrate to the non-deprecated UIApplication.open(_:option"
              "s:completionHandler:)";
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "%s: %s. Next release this will be a no-op. You have been warned.", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    uint64_t v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &qword_1EB25B768) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      __int16 v17 = "BUG IN CLIENT OF UIKIT";
      __int16 v18 = 2080;
      __int16 v19 = "The caller of UIApplication.openURL(_:) needs to migrate to the non-deprecated UIApplication.open(_:options:"
            "completionHandler:)";
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "%s: %s. Force returning false (NO).", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_14;
  }
  if (!v4 || ![(UIApplication *)self _shouldAttemptOpenURL:v4])
  {
LABEL_14:
    BOOL v14 = 0;
    goto LABEL_15;
  }
  int v8 = objc_opt_new();
  id v9 = +[UIPasteboard _pasteboardWithName:@"com.apple.UIKit.pboard.general" create:0];
  char v10 = [v9 pasteSharingToken];
  [v8 setPasteSharingToken:v10];

  uint64_t v11 = [(UIApplication *)self _urlWithSettingsPrivateURLSchemeIfNeeded:v4];

  id v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  int v13 = [v12 openURL:v11 configuration:v8 error:0];
  BOOL v14 = v13 != 0;

  id v4 = (id)v11;
LABEL_15:

  return v14;
}

- (void)_openURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v16 = a3;
  id v8 = a5;
  id v9 = [(UIApplication *)self _removePrivateOptionsFromOptions:a4];
  char v10 = +[_UIApplicationConfigurationLoader sharedLoader];
  uint64_t v11 = [v10 applicationInitializationContext];
  id v12 = [v11 defaultSceneToken];

  if (v12)
  {
    int v13 = [v12 stringRepresentation];
    BOOL v14 = _UISVisibilityEnvironmentForSceneIdentityTokenString();

    uint64_t v15 = [(UIApplication *)self _currentOpenApplicationEndpointForEnvironment:v14];
  }
  else
  {
    uint64_t v15 = 0;
  }
  [(UIApplication *)self _openURL:v16 options:v9 openApplicationEndpoint:v15 completionHandler:v8];
}

- (id)_removePrivateOptionsFromOptions:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    v7[0] = @"UIApplicationOpenURLOptionIgnoreUniversalLinks";
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    id v5 = (id)[v3 mutableCopy];
    [v5 removeObjectsForKeys:v4];
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

- (void)_openURL:(id)a3 options:(id)a4 openApplicationEndpoint:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__UIApplication__openURL_options_openApplicationEndpoint_completionHandler___block_invoke;
  aBlock[3] = &unk_1E52D9FE8;
  id v14 = v13;
  id v40 = v14;
  uint64_t v15 = _Block_copy(aBlock);
  if (v10 && [(UIApplication *)self _shouldAttemptOpenURL:v10])
  {
    uint64_t v16 = [(UIApplication *)self _urlWithSettingsPrivateURLSchemeIfNeeded:v10];
    __int16 v17 = [v11 valueForKey:@"UIApplicationOpenURLOptionUniversalLinksOnly"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v31 = [v17 BOOLValue];
    }
    else {
      int v31 = 0;
    }
    __int16 v18 = [v11 valueForKey:@"UIApplicationOpenURLOptionIgnoreUniversalLinks"];
    objc_opt_class();
    uint64_t v32 = (void *)v16;
    double v33 = v18;
    double v34 = v17;
    if (objc_opt_isKindOfClass()) {
      int v19 = [v18 BOOLValue];
    }
    else {
      int v19 = 0;
    }
    uint64_t v20 = objc_opt_new();
    [v20 setTargetConnectionEndpoint:v12];
    uint64_t v21 = +[UIPasteboard _pasteboardWithName:@"com.apple.UIKit.pboard.general" create:0];
    id v22 = [v21 pasteSharingToken];
    [v20 setPasteSharingToken:v22];

    id v23 = [v11 valueForKey:@"UIApplicationOpenExternalURLOptionsEventAttributionKey"];
    if (v23)
    {
      double v24 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v26 = [v23 toUISClickAttribution];
        [v20 setClickAttribution:v26];
      }
    }
    if (v19) {
      [v20 setAllowURLOverrides:0];
    }
    if (v31)
    {
      int64_t v27 = (void *)MEMORY[0x1E4F22398];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __76__UIApplication__openURL_options_openApplicationEndpoint_completionHandler___block_invoke_3;
      v37[3] = &unk_1E5302828;
      uint64_t v28 = &v38;
      id v38 = v15;
      int v29 = v32;
      [v27 openWithURL:v32 configuration:v20 completionHandler:v37];
    }
    else
    {
      uint64_t v30 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __76__UIApplication__openURL_options_openApplicationEndpoint_completionHandler___block_invoke_4;
      v35[3] = &unk_1E5302850;
      uint64_t v28 = &v36;
      id v36 = v15;
      int v29 = v32;
      [v30 openURL:v32 configuration:v20 completionHandler:v35];
    }
  }
  else
  {
    (*((void (**)(void *, void))v15 + 2))(v15, 0);
  }
}

void __76__UIApplication__openURL_options_openApplicationEndpoint_completionHandler___block_invoke(uint64_t a1, char a2)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    void v4[2] = __76__UIApplication__openURL_options_openApplicationEndpoint_completionHandler___block_invoke_2;
    v4[3] = &unk_1E52E7D78;
    id v5 = v2;
    char v6 = a2;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __76__UIApplication__openURL_options_openApplicationEndpoint_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __76__UIApplication__openURL_options_openApplicationEndpoint_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__UIApplication__openURL_options_openApplicationEndpoint_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)openURL:(id)a3 withCompletionHandler:(id)a4
{
}

- (BOOL)canOpenURL:(NSURL *)url
{
  id v4 = url;
  if (qword_1EB25B778 != -1) {
    dispatch_once(&qword_1EB25B778, &__block_literal_global_1676);
  }
  if (byte_1EB25B4FC) {
    NSLog(&cfstr_SCalledForUrl.isa, "-[UIApplication canOpenURL:]", v4);
  }
  BOOL v5 = [(UIApplication *)self _canOpenURL:v4 publicURLsOnly:1];

  return v5;
}

void __28__UIApplication_canOpenURL___block_invoke()
{
  _UIKitPreferencesOnce();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v1 objectForKey:@"UIShouldLogCanOpenURL"];
  byte_1EB25B4FC = [v0 BOOLValue];
}

- (void)_applicationOpenURL:(id)a3 payload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UISOpenURLAction *)[UIOpenURLAction alloc] initWithURL:v7];

  [(UIApplication *)self _applicationOpenURLAction:v8 payload:v6 origin:0];
}

- (id)_currentOpenApplicationEndpointForEnvironment:(id)a3
{
  id v3 = [(BSServiceConnectionEndpointMonitor *)self->_endpointMonitor endpointsForEnvironment:a3];
  id v4 = [v3 anyObject];

  return v4;
}

- (void)_applicationOpenURLAction:(id)a3 payload:(id)a4 origin:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v39 = a5;
  id v11 = [v9 url];
  id v12 = [v11 scheme];
  id v13 = v12;
  if (v12 && ![v12 compare:@"doubletap" options:1])
  {
    double v33 = [v11 query];
    double v34 = [v33 queryKeysAndValues];
    [(UIApplication *)self applicationOpenToShortCut:v34];

    goto LABEL_14;
  }
  uint64_t v14 = *MEMORY[0x1E4F22340];
  uint64_t v15 = [v10 objectForKey:*MEMORY[0x1E4F22340]];

  uint64_t v16 = [v10 objectForKey:*MEMORY[0x1E4F22378]];
  int v17 = [v16 BOOLValue];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__UIApplication__applicationOpenURLAction_payload_origin___block_invoke;
  aBlock[3] = &unk_1E53028A0;
  void aBlock[4] = self;
  id v45 = v9;
  id v46 = v39;
  id v18 = v10;
  id v47 = v18;
  SEL v48 = a2;
  int v19 = _Block_copy(aBlock);
  uint64_t v20 = v19;
  if (!v15)
  {
    (*((void (**)(void *, void *))v19 + 2))(v19, v11);
LABEL_12:

LABEL_14:
    return;
  }
  uint64_t v21 = [v18 objectForKey:v14];
  if (!v17)
  {
    [(id)UIApp _defaultSceneIfExists];
    v31 = uint64_t v30 = v21;
    uint64_t v32 = +[UIScene _sceneForFBSScene:v31];

    int v29 = v30;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __58__UIApplication__applicationOpenURLAction_payload_origin___block_invoke_4;
    v40[3] = &unk_1E53028C8;
    v40[4] = self;
    id v41 = v20;
    _UIApplicationResolveURLUsingModalProgressControllerForNonOpenInPlaceBookmarkableString(v30, v32, v40);

    goto LABEL_11;
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __58__UIApplication__applicationOpenURLAction_payload_origin___block_invoke_2;
  v42[3] = &unk_1E53028C8;
  v42[4] = self;
  id v43 = v20;
  id v38 = v21;
  id v22 = v21;
  id v23 = v11;
  double v24 = v42;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = ___UIApplicationResolveURLForOpenInPlaceBookmarkableString_block_invoke;
  v49[3] = &unk_1E5302878;
  id v25 = v22;
  id v50 = v25;
  id v37 = v23;
  id v51 = v37;
  uint64_t v26 = v24;
  id v52 = v26;
  int64_t v27 = v49;
  uint64_t v54 = 0;
  char v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v28 = (void (*)(id, void *))off_1EB25B950;
  uint64_t v57 = off_1EB25B950;
  if (!off_1EB25B950)
  {
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __getFPDocumentURLFromBookmarkableStringSymbolLoc_block_invoke_0;
    v53[3] = &unk_1E52D9900;
    v53[4] = &v54;
    __getFPDocumentURLFromBookmarkableStringSymbolLoc_block_invoke_0(v53);
    uint64_t v28 = (void (*)(id, void *))v55[3];
  }
  _Block_object_dispose(&v54, 8);
  if (v28)
  {
    v28(v25, v27);

    int v29 = v38;
LABEL_11:

    goto LABEL_12;
  }
  double v35 = [MEMORY[0x1E4F28B00] currentHandler];
  id v36 = objc_msgSend(NSString, "stringWithUTF8String:", "void _FPDocumentURLFromBookmarkableString(CFStringRef, void (^__strong)(CFURLRef, CFErrorRef))");
  objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"UIApplication.m", 8008, @"%s", dlerror(), v37);

  __break(1u);
}

void __58__UIApplication__applicationOpenURLAction_payload_origin___block_invoke(uint64_t a1, void *a2)
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v45 = a2;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 181) & 4) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([*(id *)(a1 + 40) localOpenURLOptions],
          id v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      id v9 = [*(id *)(a1 + 40) localOpenURLOptions];
      id v10 = *(void **)(a1 + 48);
      id v11 = v9;
      id v12 = v10;
      id v13 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "openInPlace"));
      [v13 setValue:v14 forKey:@"UIApplicationOpenURLOptionsOpenInPlaceKey"];

      uint64_t v15 = [v11 annotation];

      if (v15)
      {
        id v46 = @"UIApplicationLaunchOptionsAnnotationKey";
        uint64_t v16 = [v11 annotation];
        v47[0] = v16;
        int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
        id v18 = _annotationValueToReportToDelegateForPayload(v17);

        if (v18) {
          [v13 setValue:v18 forKey:@"UIApplicationOpenURLOptionsAnnotationKey"];
        }
      }
      int v19 = [v11 sourceApplication];

      if (v19)
      {
        uint64_t v20 = [v11 sourceApplication];
        [v13 setValue:v20 forKey:@"UIApplicationOpenURLOptionsSourceApplicationKey"];
      }
      uint64_t v21 = [v11 eventAttribution];

      if (v21)
      {
        id v22 = [v11 eventAttribution];
        [v13 setValue:v22 forKey:@"UIApplicationOpenURLOptionsEventAttributionKey"];
      }
      if (v12) {
        [v13 setValue:v12 forKey:@"_UIApplicationOpenURLOptionsSourceProcessHandleKey"];
      }
    }
    else
    {
      id v23 = *(void **)(a1 + 56);
      id v11 = *(id *)(a1 + 48);
      double v24 = (void *)MEMORY[0x1E4F1CA60];
      id v25 = v23;
      uint64_t v26 = [v24 dictionary];
      int64_t v27 = [v25 objectForKey:*MEMORY[0x1E4F22378]];
      uint64_t v28 = [v27 BOOLValue];

      int v29 = [v25 objectForKey:@"UIApplicationLaunchOptionsSourceApplicationKey"];
      [v26 setValue:v29 forKey:@"UIApplicationOpenURLOptionsSourceApplicationKey"];

      uint64_t v30 = _annotationValueToReportToDelegateForPayload(v25);
      [v26 setValue:v30 forKey:@"UIApplicationOpenURLOptionsAnnotationKey"];

      int v31 = [NSNumber numberWithBool:v28];
      [v26 setValue:v31 forKey:@"UIApplicationOpenURLOptionsOpenInPlaceKey"];

      uint64_t v32 = [UIEventAttribution alloc];
      double v33 = [v25 objectForKey:@"UIApplicationLaunchOptionsEventAttributionKey"];

      double v34 = [(UIEventAttribution *)v32 initWithUISClickAttribution:v33];
      [v26 setValue:v34 forKey:@"UIApplicationOpenURLOptionsEventAttributionKey"];

      if (v11) {
        [v26 setValue:v11 forKey:@"_UIApplicationOpenURLOptionsSourceProcessHandleKey"];
      }
      id v13 = (void *)[v26 copy];
    }
    char v35 = [*(id *)(*(void *)(a1 + 32) + 24) application:*(void *)(a1 + 32) openURL:v45 options:v13];

    if (v35) {
      goto LABEL_24;
    }
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28B50] mainBundle];
    id v4 = [v3 infoDictionary];
    BOOL v5 = [v4 objectForKey:@"LSSupportsOpeningDocumentsInPlace"];

    if ([v5 BOOLValue])
    {
      id v41 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v42 = *(void *)(a1 + 64);
      uint64_t v43 = *(void *)(a1 + 32);
      long long v44 = NSStringFromSelector(sel_application_openURL_options_);
      [v41 handleFailureInMethod:v42, v43, @"UIApplication.m", 8170, @"Application has %@ key, but doesn't implement %@ on delegate %@", @"LSSupportsOpeningDocumentsInPlace", v44, *(void *)(*(void *)(a1 + 32) + 24) object file lineNumber description];
    }
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(v6 + 176);
    if ((v7 & 0x20000000000) != 0)
    {
      id v36 = *(void **)(v6 + 24);
      id v37 = [*(id *)(a1 + 56) objectForKey:@"UIApplicationLaunchOptionsSourceApplicationKey"];
      id v38 = _annotationValueToReportToDelegateForPayload(*(void **)(a1 + 56));
      char v39 = [v36 application:v6 openURL:v45 sourceApplication:v37 annotation:v38];

      if (v39) {
        goto LABEL_24;
      }
    }
    else
    {
      if ((v7 & 0x10000000000) == 0)
      {

LABEL_24:
        [*(id *)(a1 + 32) applicationOpenURL:v45];
        goto LABEL_25;
      }
      int v40 = [*(id *)(v6 + 24) application:*(void *)(a1 + 32) handleOpenURL:v45];

      if (v40) {
        goto LABEL_24;
      }
    }
  }
LABEL_25:
}

void __58__UIApplication__applicationOpenURLAction_payload_origin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__UIApplication__applicationOpenURLAction_payload_origin___block_invoke_3;
  block[3] = &unk_1E52E3298;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __58__UIApplication__applicationOpenURLAction_payload_origin___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _setHandlingURL:1 url:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _setHandlingURL:0 url:v3];
}

void __58__UIApplication__applicationOpenURLAction_payload_origin___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _setHandlingURL:1 url:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _setHandlingURL:0 url:v4];
}

- (void)_applicationHandleSiriTask:(id)a3
{
  if ((*((unsigned char *)&self->_applicationFlags + 7) & 0x20) != 0) {
    [(UIApplicationDelegate *)self->_delegate _application:self handleSiriTask:a3];
  }
}

- (void)_applicationHandleWatchKitRequest:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*((unsigned char *)&self->_applicationFlags + 7) & 0x40) != 0)
  {
    v11[0] = 0;
    v11[1] = v11;
    _DWORD v11[2] = 0x2020000000;
    char v12 = 0;
    delegate = self->_delegate;
    id v7 = [v4 request];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__UIApplication__applicationHandleWatchKitRequest___block_invoke;
    v8[3] = &unk_1E53028F0;
    id v10 = v11;
    id v9 = v5;
    [(UIApplicationDelegate *)delegate application:self handleWatchKitExtensionRequest:v7 reply:v8];

    _Block_object_dispose(v11, 8);
  }
}

void __51__UIApplication__applicationHandleWatchKitRequest___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"-[UIApplication _applicationHandleWatchKitRequest:]_block_invoke"];
    id v8 = NSStringFromSelector(sel_application_handleWatchKitExtensionRequest_reply_);
    id v9 = [*(id *)(a1 + 32) request];
    [v6 handleFailureInFunction:v7, @"UIApplication.m", 8232, @"Reply handler passed to -%@ called more than once for request %@.", v8, v9 file lineNumber description];

    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v3 + 24) = 1;
  if ([*(id *)(a1 + 32) canSendResponse])
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = +[UIWatchKitExtensionRequestActionResponse responseWithWatchKitExtensionResult:v10];
    [v4 sendResponse:v5];
  }
}

- (void)_applicationHandleIntentForwardingAction:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2050000000;
  id v5 = (void *)qword_1EB25B960;
  uint64_t v15 = qword_1EB25B960;
  if (!qword_1EB25B960)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    _DWORD v11[2] = __getINUIAppIntentForwardingActionExecutorClass_block_invoke;
    void v11[3] = &unk_1E52D9900;
    v11[4] = &v12;
    __getINUIAppIntentForwardingActionExecutorClass_block_invoke((uint64_t)v11);
    id v5 = (void *)v13[3];
  }
  uint64_t v6 = v5;
  _Block_object_dispose(&v12, 8);
  id v7 = (void *)[[v6 alloc] initWithApplication:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__UIApplication__applicationHandleIntentForwardingAction___block_invoke;
  v9[3] = &unk_1E5302918;
  id v10 = v4;
  id v8 = v4;
  [v7 executeAction:v8 completionHandler:v9];
}

void __58__UIApplication__applicationHandleIntentForwardingAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) canSendResponse]) {
    [*(id *)(a1 + 32) sendResponse:v3];
  }
}

- (void)_applicationHandleLinkConnectionAction:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v4 = (void *)qword_1EB25B970;
  uint64_t v14 = qword_1EB25B970;
  if (!qword_1EB25B970)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __getLNAppConnectionListenerClass_block_invoke;
    v10[3] = &unk_1E52D9900;
    void v10[4] = &v11;
    __getLNAppConnectionListenerClass_block_invoke((uint64_t)v10);
    id v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  uint64_t v6 = [v5 sharedListener];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__UIApplication__applicationHandleLinkConnectionAction___block_invoke;
  v8[3] = &unk_1E5302940;
  id v9 = v3;
  id v7 = v3;
  [v6 handleAction:v7 completionHandler:v8];
}

void __56__UIApplication__applicationHandleLinkConnectionAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) canSendResponse]) {
    [*(id *)(a1 + 32) sendResponse:v3];
  }
}

- (BOOL)isHandlingOpenShortCut
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 4) >> 3) & 1;
}

- (void)_setHandlingURL:(BOOL)a3 url:(id)a4
{
  uint64_t v6 = 0x200000;
  if (!a3) {
    uint64_t v6 = 0;
  }
  *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFFFFFFFFDFFFFFLL | v6;
  id v7 = [a4 scheme];
  char v8 = 0;
  if (a4 && v7)
  {
    id v10 = v7;
    BOOL v9 = [v7 compare:@"doubletap" options:1] == 0;
    id v7 = v10;
    char v8 = v9;
  }
  *(void *)&self->_uint64_t applicationFlags = *(void *)&self->_applicationFlags & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)(v8 & 1) << 35);
}

- (BOOL)isHandlingURL
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 2) >> 5) & 1;
}

- (void)showNetworkPromptsIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  softlink_SBSSpringBoardServerPort();
  uint64_t v5 = v4;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v6 = (void (*)(uint64_t, BOOL))getSBShowNetworkPromptsIfNecessarySymbolLoc_ptr;
  uint64_t v13 = getSBShowNetworkPromptsIfNecessarySymbolLoc_ptr;
  if (!getSBShowNetworkPromptsIfNecessarySymbolLoc_ptr)
  {
    id v7 = SpringBoardServicesLibrary_1();
    void v11[3] = (uint64_t)dlsym(v7, "SBShowNetworkPromptsIfNecessary");
    getSBShowNetworkPromptsIfNecessarySymbolLoc_ptr = (_UNKNOWN *)v11[3];
    uint64_t v6 = (void (*)(uint64_t, BOOL))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (v6)
  {
    v6(v5, v3);
  }
  else
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v9 = objc_msgSend(NSString, "stringWithUTF8String:", "kern_return_t softlink_SBShowNetworkPromptsIfNecessary(mach_port_t, uint8_t)");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"UIApplication.m", 499, @"%s", dlerror());

    __break(1u);
  }
}

- (void)setUsesBackgroundNetwork:(BOOL)a3
{
}

- (BOOL)usesBackgroundNetwork
{
  return [(UISApplicationState *)self->_appState _usesBackgroundNetwork];
}

- (id)userHomeDirectory
{
  id v2 = NSHomeDirectory();
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v3, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v2, 0);

  return v2;
}

- (id)userLibraryDirectory
{
  id v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  BOOL v3 = [v2 objectAtIndex:0];

  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v4, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v3, 0);

  return v3;
}

- (id)_localCachesDirectory
{
  id v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 2uLL, 1);
  BOOL v3 = [v2 objectAtIndex:0];

  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v4, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v3, 0);

  return v3;
}

- (void)_performWithUICACommitStateSnapshotting:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  if (v5)
  {
    uint64_t v10 = v5;
    if (pthread_main_np() != 1)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"UIApplication.m" lineNumber:8335 description:@"Call must be made on main thread"];
    }
    int v6 = __caCommitState;
    if (__caCommitState >= 2)
    {
      char v8 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v9 = [NSString stringWithUTF8String:"-[UIApplication _performWithUICACommitStateSnapshotting:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"UIApplication.m", 8339, @"can't begin snapshotting unless the commit state is idle or snapshotting (actual=%i)", __caCommitState);
    }
    __caCommitState = 1;
    v10[2]();
    uint64_t v5 = v10;
    __caCommitState = v6;
  }
}

- (void)_configureSnapshotContext:(id)a3 forScreen:(id)a4 scene:(id)a5
{
  id v22 = a5;
  id v7 = a4;
  id v8 = a3;
  [v7 _scale];
  double v10 = v9;
  [v7 _unjailedReferenceBounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  if (([v22 _sceneSessionRoleIsCarPlayOrNonInteractiveExternal] & 1) == 0)
  {
    int v19 = [v22 _effectiveSettings];
    [v19 frame];
    double v16 = v20;
    double v18 = v21;
    double v12 = (v20 - v20) * 0.5;
    double v14 = (v21 - v21) * 0.5;
  }
  objc_msgSend(v8, "setFrame:", v12, v14, v16, v18);
  [v8 setScale:v10];
}

- (id)nameOfDefaultImageToUpdateAtSuspension
{
  return 0;
}

- (BOOL)_updateDefaultImage
{
  BOOL v3 = [(UIApplication *)self nameOfDefaultImageToUpdateAtSuspension];
  if (v3) {
    [(UIApplication *)self _saveSnapshotWithName:v3];
  }

  return v3 != 0;
}

- (void)prepareForDefaultImageSnapshotForScreen:(id)a3
{
  if ([a3 _isMainLikeScreen])
  {
    [(UIApplication *)self prepareForDefaultImageSnapshot];
  }
}

- (BOOL)removeDefaultImage:(id)a3 forScreen:(id)a4
{
  id v6 = a3;
  id v7 = [a4 displayIdentity];
  id v8 = _UIApplicationMainSceneForDisplayIdentity(v7);

  double v9 = [(UIApplication *)self _createSnapshotContextForSceneRemoval:v8 withName:v6];

  if (v9) {
    char v10 = [v8 invalidateSnapshotWithContext:v9];
  }
  else {
    char v10 = 0;
  }
  if (os_variant_has_internal_diagnostics())
  {
    double v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIApplicationSnapshots", removeDefaultImage_forScreen____s_category)+ 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v13 = 0;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Warning: The UIApplication method removeDefaultImage:forScreen: is deprecated and likely does not do what you think it does. This is a user privacy issue if used for preventing sensitive content from displaying in system snapshots. Hide content optimistically when your scene enters background and/or call -requestSceneSessionRefresh instead. This will become a hard assert in future releases.", v13, 2u);
    }
  }

  return v10;
}

- (double)defaultImageSnapshotExpiration
{
  id v2 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (id)_createSnapshotContextForScene:(id)a3 withName:(id)a4 performLayoutWithSettings:(id)a5
{
  id v8 = a3;
  double v9 = (__CFString *)a4;
  id v10 = a5;
  uint64_t v11 = +[UIScreen _screenForScene:v8];
  double v12 = (void *)v11;
  id v13 = 0;
  if (v8 && v11)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F62A98]);
    double v15 = [v8 identifier];
    double v16 = (void *)[v14 initWithSceneID:v15 settings:v10];

    if (!v9) {
      double v9 = @"UIApplicationAutomaticSnapshotDefault";
    }
    [v16 setName:v9];
    double v17 = +[UIScene _sceneForFBSScene:v8];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __83__UIApplication__createSnapshotContextForScene_withName_performLayoutWithSettings___block_invoke;
    v19[3] = &unk_1E5302968;
    v19[4] = self;
    id v20 = v12;
    id v13 = v16;
    id v21 = v13;
    [v17 _applySnapshotSettings:v10 forActions:v19];
  }
  return v13;
}

void __83__UIApplication__createSnapshotContextForScene_withName_performLayoutWithSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = v3;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __83__UIApplication__createSnapshotContextForScene_withName_performLayoutWithSettings___block_invoke_2;
    v8[3] = &unk_1E52DD450;
    id v7 = *(void **)(a1 + 40);
    void v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    id v10 = v6;
    id v11 = *(id *)(a1 + 48);
    +[UIView performWithoutAnimation:v8];
  }
}

void __83__UIApplication__createSnapshotContextForScene_withName_performLayoutWithSettings___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x18C108260]();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__UIApplication__createSnapshotContextForScene_withName_performLayoutWithSettings___block_invoke_3;
  v19[3] = &unk_1E52D9F98;
  id v3 = *(void **)(a1 + 40);
  v19[4] = *(void *)(a1 + 32);
  id v20 = v3;
  +[UIViewController _performWithoutDeferringTransitions:v19];

  double v4 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = [*(id *)(a1 + 48) _allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v10 _includeInDefaultImageSnapshot] & 1) == 0)
        {
          id v11 = [v10 _associatingSceneLayer];
          if (v11) {
            [v4 addObject:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }
  [*(id *)(a1 + 56) setLayersToExclude:v4];
  double v12 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __83__UIApplication__createSnapshotContextForScene_withName_performLayoutWithSettings___block_invoke_4;
  v14[3] = &unk_1E52D9F70;
  void v14[4] = v12;
  [v12 _performWithUICACommitStateSnapshotting:v14];
  [*(id *)(a1 + 32) _configureSnapshotContext:*(void *)(a1 + 56) forScreen:*(void *)(a1 + 40) scene:*(void *)(a1 + 48)];
  id v13 = *(void **)(a1 + 56);
  [*(id *)(a1 + 32) defaultImageSnapshotExpiration];
  objc_msgSend(v13, "setExpirationInterval:");
}

uint64_t __83__UIApplication__createSnapshotContextForScene_withName_performLayoutWithSettings___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareForDefaultImageSnapshotForScreen:*(void *)(a1 + 40)];
}

uint64_t __83__UIApplication__createSnapshotContextForScene_withName_performLayoutWithSettings___block_invoke_4(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] flush];
  if (_runAfterCACommitDeferredBlocks(*(void **)(a1 + 32))) {
    [MEMORY[0x1E4F39CF8] flush];
  }
  id v2 = (void *)MEMORY[0x1E4F39CF8];
  return [v2 synchronize];
}

- (id)_createSnapshotContextForSceneRemoval:(id)a3 withName:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (__CFString *)a4;
  uint64_t v8 = +[UIScreen _screenForScene:v6];
  id v9 = (void *)v8;
  id v10 = 0;
  if (v6 && v8)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F62A98]);
    double v12 = [v6 identifier];
    id v13 = (void *)[v11 initWithSceneID:v12 settings:0];

    if (!v7) {
      uint64_t v7 = @"UIApplicationAutomaticSnapshotDefault";
    }
    [v13 setName:v7];
    id v14 = +[UIScene _sceneForFBSScene:v6];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__UIApplication__createSnapshotContextForSceneRemoval_withName___block_invoke;
    v16[3] = &unk_1E5302968;
    void v16[4] = self;
    id v10 = v13;
    id v17 = v10;
    id v18 = v9;
    [v14 _applySnapshotSettings:0 forActions:v16];
  }
  return v10;
}

void __64__UIApplication__createSnapshotContextForSceneRemoval_withName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__UIApplication__createSnapshotContextForSceneRemoval_withName___block_invoke_2;
  v6[3] = &unk_1E52DD450;
  double v4 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v5 = v3;
  +[UIView performWithoutAnimation:v6];
}

uint64_t __64__UIApplication__createSnapshotContextForSceneRemoval_withName___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureSnapshotContext:*(void *)(a1 + 40) forScreen:*(void *)(a1 + 48) scene:*(void *)(a1 + 56)];
  id v2 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) defaultImageSnapshotExpiration];
  return objc_msgSend(v2, "setExpirationInterval:");
}

- (void)_beginSnapshotSessionForScene:(id)a3 withSnapshotBlock:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    if (!v8) {
      goto LABEL_24;
    }
  }
  else
  {
    id v27 = v8;
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"UIApplication.m", 8541, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    id v8 = v27;
    if (!v27) {
      goto LABEL_24;
    }
  }
  SEL v30 = a2;
  uint64_t v32 = (void (**)(id, void *))v8;
  if (qword_1EB25B6C8) {
    HTSuspendHangTracing();
  }
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __65__UIApplication__beginSnapshotSessionForScene_withSnapshotBlock___block_invoke;
  v52[3] = &unk_1E52E3210;
  v52[4] = self;
  v52[5] = &v53;
  unint64_t v9 = [(UIApplication *)self _beginBackgroundTaskWithName:@"com.apple.uikit.applicationSnapshot" expirationHandler:v52];
  v54[3] = v9;
  *((void *)&self->_applicationFlags + 1) |= 0x200000000uLL;
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:0x1ED16A160 object:0];
  id v11 = +[UIScreen _screenForScene:v7];
  [v11 _setPerformingSystemSnapshot:1];
  double v12 = [MEMORY[0x1E4F1CA48] array];
  +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 forScreen:v11];
  int v31 = v10;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v49 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        id v18 = [v17 _scene];
        BOOL v19 = v18 == v7;

        if (v19) {
          [v12 addObject:v17];
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v14);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v20 = v12;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v57 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v44 + 1) + 8 * j) _willSnapshot];
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v57 count:16];
    }
    while (v21);
  }

  [v31 postNotificationName:@"_UIApplicationWillBeginSnapshotSessionNotification" object:self];
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __65__UIApplication__beginSnapshotSessionForScene_withSnapshotBlock___block_invoke_2;
  v33[3] = &unk_1E5302990;
  id v38 = &v40;
  id v24 = v20;
  id v34 = v24;
  id v25 = v11;
  id v35 = v25;
  id v36 = self;
  id v26 = v31;
  id v37 = v26;
  char v39 = &v53;
  v32[2](v32, v33);
  if (!*((unsigned char *)v41 + 24))
  {
    int v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:v30 object:self file:@"UIApplication.m" lineNumber:8621 description:@"snapshot completion was not called"];
  }
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v53, 8);
  id v8 = v32;
LABEL_24:
}

uint64_t __65__UIApplication__beginSnapshotSessionForScene_withSnapshotBlock___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    uint64_t result = objc_msgSend(*(id *)(result + 32), "_endBackgroundTask:");
    *(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 0;
  }
  return result;
}

uint64_t __65__UIApplication__beginSnapshotSessionForScene_withSnapshotBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "_didSnapshot", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 40) _setPerformingSystemSnapshot:0];
  *(void *)(*(void *)(a1 + 48) + 184) &= ~0x200000000uLL;
  [*(id *)(a1 + 56) postNotificationName:0x1ED16A160 object:0];
  [*(id *)(a1 + 48) _performWithUICACommitStateSnapshotting:&__block_literal_global_1721];
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "_endBackgroundTask:");
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
  objc_msgSend(*(id *)(a1 + 56), "postNotificationName:object:", @"_UIApplicationDidEndSnapshotSessionNotification", *(void *)(a1 + 48), (void)v8);
  uint64_t result = qword_1EB25B6C8;
  if (qword_1EB25B6C8) {
    return HTResumeHangTracing();
  }
  return result;
}

uint64_t __65__UIApplication__beginSnapshotSessionForScene_withSnapshotBlock___block_invoke_3()
{
  [MEMORY[0x1E4F39CF8] flush];
  v0 = (void *)MEMORY[0x1E4F39CF8];
  return [v0 synchronize];
}

- (void)_performSnapshotsWithAction:(id)a3 forScene:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"UIApplication.m", 8625, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"UIApplication.m", 8626, @"Invalid parameter not satisfying: %@", @"requestAction" object file lineNumber description];

LABEL_3:
  double v12 = +[UIScene _sceneForFBSScene:v10];
  int v13 = [v12 _isReadyForSuspension];
  _UIApplicationFlushCATransaction(0);
  [v12 _setIsRespondingToLifecycleEvent:1];
  if (v13) {
    [v12 _prepareForResume];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke;
  v19[3] = &unk_1E5302A30;
  v19[4] = self;
  id v20 = v10;
  id v21 = v9;
  id v22 = v11;
  id v14 = v11;
  id v15 = v9;
  id v16 = v10;
  [v12 _performSystemSnapshotWithActions:v19];
  [v12 _setIsRespondingToLifecycleEvent:0];
  if (v13) {
    [v12 _prepareForSuspend];
  }
}

void __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_2;
  v6[3] = &unk_1E5302A08;
  id v7 = v2;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = *(id *)(a1 + 56);
  [v3 _beginSnapshotSessionForScene:v7 withSnapshotBlock:v6];
}

void __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[UIScreen _screenForScene:*(void *)(a1 + 32)];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_3;
  v13[3] = &unk_1E53029B8;
  uint64_t v5 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 48);
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_4;
  v8[3] = &unk_1E53029E0;
  id v9 = *(id *)(a1 + 32);
  id v10 = v4;
  id v11 = v3;
  id v12 = *(id *)(a1 + 56);
  id v6 = v3;
  id v7 = v4;
  [v5 executeRequestsWithHandler:v13 completionHandler:v8 expirationHandler:&__block_literal_global_1730];
}

void __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [v3 nameOfDefaultImageToUpdateAtSuspension];
  id v6 = [v8 settings];
  id v7 = [v3 _createSnapshotContextForScene:v4 withName:v5 performLayoutWithSettings:v6];

  if (v7)
  {
    [*(id *)(a1 + 32) extendSnapshotContext:v7 forSnapshotAction:*(void *)(a1 + 48)];
    [v8 performSnapshotWithContext:v7];
  }
}

void __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_4(uint64_t a1)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_5;
  v8[3] = &unk_1E52D9F98;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  +[UIView performWithoutAnimation:v8];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v2, v3, v4, v5);
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v2, v3, v4, v5);
  }
}

void __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x18C108260]();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_6;
  v3[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  +[UIViewController _performWithoutDeferringTransitions:v3];
}

void __65__UIApplication__performSnapshotsWithAction_forScene_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[UIScene _sceneForFBSScene:*(void *)(a1 + 32)];
  if ([v2 _hostsWindows])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:", 1, 1, *(void *)(a1 + 40), 0);
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
          id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) _traitCollectionChangeTransitionCoordinator];
          [v8 _runAlongsideCompletionsAndClearAlongsideAnimations];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (BOOL)_saveSnapshotWithName:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v5 = [(UIApplication *)self _mainScene];
  uint64_t v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __39__UIApplication__saveSnapshotWithName___block_invoke;
    v10[3] = &unk_1E5302A58;
    void v10[4] = self;
    id v11 = v5;
    id v12 = v4;
    int v13 = &v14;
    [(UIApplication *)self _beginSnapshotSessionForScene:v11 withSnapshotBlock:v10];
    int v7 = *((unsigned __int8 *)v15 + 24);
  }
  else
  {
    id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &_saveSnapshotWithName____s_category) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)timespec buf = 136315394;
      BOOL v19 = "-[UIApplication _saveSnapshotWithName:]";
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "%s called for name %@ but main scene is nil, so skipping snapshot", buf, 0x16u);
    }
    int v7 = *((unsigned __int8 *)v15 + 24);
  }

  _Block_object_dispose(&v14, 8);
  return v7 != 0;
}

void __39__UIApplication__saveSnapshotWithName___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) _createSnapshotContextForScene:*(void *)(a1 + 40) withName:*(void *)(a1 + 48) performLayoutWithSettings:0];
  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) performSnapshotWithContext:v3];
  }
  if (v4) {
    v4[2]();
  }
}

- (void)prepareSnapshotsWithAction:(id)a3 forScene:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (id)_sceneHostingWorkspaceController
{
  sceneHostingWorkspaceController = self->_sceneHostingWorkspaceController;
  if (!sceneHostingWorkspaceController)
  {
    id v4 = [_UISceneHostingWorkspaceController alloc];
    uint64_t v5 = _UIMainBundleIdentifier();
    uint64_t v6 = [(_UISceneHostingWorkspaceController *)v4 initWithIdentifier:v5];
    int v7 = self->_sceneHostingWorkspaceController;
    self->_sceneHostingWorkspaceController = v6;

    sceneHostingWorkspaceController = self->_sceneHostingWorkspaceController;
  }
  return sceneHostingWorkspaceController;
}

- (BOOL)_isInteractionEvent:(__GSEvent *)a3
{
  unsigned int Type = GSEventGetType();
  int IsHardwareKeyboardEvent = GSEventIsHardwareKeyboardEvent();
  unsigned int v5 = (0x400C00u >> Type) & 1;
  if (Type > 0x16) {
    LOBYTE(v5) = 0;
  }
  if (IsHardwareKeyboardEvent) {
    return 0;
  }
  else {
    return v5;
  }
}

- (BOOL)launchApplicationWithIdentifier:(id)a3 suspended:(BOOL)a4
{
  BOOL v4 = a4;
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v21 = *MEMORY[0x1E4F625F8];
  int v7 = [NSNumber numberWithBool:v4];
  v22[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];

  long long v9 = [MEMORY[0x1E4F62AF8] sharedService];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __59__UIApplication_launchApplicationWithIdentifier_suspended___block_invoke;
  v14[3] = &unk_1E5302A80;
  uint64_t v16 = &v17;
  long long v10 = v6;
  id v15 = v10;
  [v9 openApplication:v5 options:v8 withResult:v14];

  dispatch_time_t v11 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v10, v11)) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = *((unsigned char *)v18 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

intptr_t __59__UIApplication_launchApplicationWithIdentifier_suspended___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)addStatusBarItem:(int)a3 removeOnExit:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  NSLog(&cfstr_Addstatusbarit.isa, a2, *(void *)&a3, a4);
  +[UIStatusBarServer addStatusBarItem:v4];
}

- (void)addStatusBarItem:(int)a3
{
}

- (void)removeStatusBarItem:(int)a3
{
}

- (void)setApplicationBadgeString:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F44680];
  id v4 = a3;
  id v5 = [v3 currentNotificationCenter];
  [v5 setBadgeString:v4 withCompletionHandler:0];
}

- (NSInteger)applicationIconBadgeNumber
{
  uint64_t v2 = [MEMORY[0x1E4F44680] currentNotificationCenter];
  uint64_t v3 = [v2 badgeNumber];
  NSInteger v4 = [v3 integerValue];

  return v4;
}

- (BOOL)applicationSupportsShakeToEdit
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 9) >> 3) & 1;
}

- (void)_setForcedUserInterfaceLayoutDirection:(int64_t)a3
{
  *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFFFFFFFC3FFFFFLL | ((unint64_t)(a3 & 7) << 23) | 0x400000;
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"_UIApplicationForcedUserInterfaceLayoutDirectionChangedNotification" object:0];
}

- (void)addWebClipToHomeScreen:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  CFStringRef v3 = (const __CFString *)a3;
  NSInteger v4 = (__CFString *)v3;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v16 = 0u;
  if (v3 && CFStringGetCString(v3, buffer, 1024, 0x8000100u))
  {
    softlink_SBSSpringBoardServerPort();
    uint64_t v6 = v5;
    uint64_t v11 = 0;
    BOOL v12 = &v11;
    uint64_t v13 = 0x2020000000;
    int v7 = (void (*)(uint64_t, char *))getSBAddWebClipToHomeScreenSymbolLoc_ptr;
    uint64_t v14 = getSBAddWebClipToHomeScreenSymbolLoc_ptr;
    if (!getSBAddWebClipToHomeScreenSymbolLoc_ptr)
    {
      id v8 = SpringBoardServicesLibrary_1();
      v12[3] = (uint64_t)dlsym(v8, "SBAddWebClipToHomeScreen");
      getSBAddWebClipToHomeScreenSymbolLoc_ptr = (_UNKNOWN *)v12[3];
      int v7 = (void (*)(uint64_t, char *))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v7)
    {
      long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v10 = objc_msgSend(NSString, "stringWithUTF8String:", "kern_return_t softlink_SBAddWebClipToHomeScreen(mach_port_t, char *)");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"UIApplication.m", 498, @"%s", dlerror());

      __break(1u);
    }
    v7(v6, buffer);
  }
}

+ (id)stringForStatusBarStyleOverrides:(unint64_t)a3
{
  if ((uint64_t)a3 >= 0x20000)
  {
    if ((uint64_t)a3 <= 0x3FFFFFF)
    {
      if ((uint64_t)a3 < 0x200000)
      {
        if ((uint64_t)a3 >= 0x80000)
        {
          if (a3 == 0x80000)
          {
            CFStringRef v3 = @"developerTools";
            goto LABEL_86;
          }
          if (a3 == 0x100000)
          {
            CFStringRef v3 = @"screenReplayRecording";
            goto LABEL_86;
          }
        }
        else
        {
          if (a3 == 0x20000)
          {
            CFStringRef v3 = @"webRTCCapture";
            goto LABEL_86;
          }
          if (a3 == 0x40000)
          {
            CFStringRef v3 = @"airPrint";
            goto LABEL_86;
          }
        }
      }
      else if ((uint64_t)a3 < 0x800000)
      {
        if (a3 == 0x200000)
        {
          CFStringRef v3 = @"loggingCapture";
          goto LABEL_86;
        }
        if (a3 == 0x400000)
        {
          CFStringRef v3 = @"autoAirPlayReady";
          goto LABEL_86;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x800000uLL:
            CFStringRef v3 = @"autoAirPlayPlaying";
            goto LABEL_86;
          case 0x1000000uLL:
            CFStringRef v3 = @"webRTCAudioCapture";
            goto LABEL_86;
          case 0x2000000uLL:
            CFStringRef v3 = @"fullScreenWebRTCCapture";
            goto LABEL_86;
        }
      }
    }
    else if ((uint64_t)a3 > 0xFFFFFFFFFLL)
    {
      if ((uint64_t)a3 <= 0x3FFFFFFFFFLL)
      {
        if (a3 == 0x1000000000)
        {
          CFStringRef v3 = @"activePushToTalkCall";
          goto LABEL_86;
        }
        if (a3 == 0x2000000000)
        {
          CFStringRef v3 = @"idlePushToTalkCall";
          goto LABEL_86;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x4000000000uLL:
            CFStringRef v3 = @"callHandoff";
            goto LABEL_86;
          case 0x8000000000uLL:
            CFStringRef v3 = @"videoConferenceHandoff";
            goto LABEL_86;
          case 0x20000000000uLL:
            CFStringRef v3 = @"nearbyInteractions";
            goto LABEL_86;
        }
      }
    }
    else if ((uint64_t)a3 <= 0xFFFFFFF)
    {
      if (a3 == 0x4000000)
      {
        CFStringRef v3 = @"fullScreenWebRTCAudioCapture";
        goto LABEL_86;
      }
      if (a3 == 0x8000000)
      {
        CFStringRef v3 = @"callRinging";
        goto LABEL_86;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x10000000uLL:
          CFStringRef v3 = @"videoConferenceRinging";
          goto LABEL_86;
        case 0x20000000uLL:
          CFStringRef v3 = @"stewie";
          goto LABEL_86;
        case 0x800000000uLL:
          CFStringRef v3 = @"stewieDisconnected";
          goto LABEL_86;
      }
    }
    goto LABEL_85;
  }
  if ((uint64_t)a3 > 255)
  {
    if ((uint64_t)a3 <= 4095)
    {
      if ((uint64_t)a3 > 1023)
      {
        if (a3 == 1024)
        {
          CFStringRef v3 = @"hearingAidRecording";
          goto LABEL_86;
        }
        if (a3 == 2048)
        {
          CFStringRef v3 = @"backgroundLocation";
          goto LABEL_86;
        }
      }
      else
      {
        if (a3 == 256)
        {
          CFStringRef v3 = @"assistantEyesFree";
          goto LABEL_86;
        }
        if (a3 == 512)
        {
          CFStringRef v3 = @"videoOut";
          goto LABEL_86;
        }
      }
    }
    else if ((uint64_t)a3 < 0x4000)
    {
      if (a3 == 4096)
      {
        CFStringRef v3 = @"carPlay";
        goto LABEL_86;
      }
      if (a3 == 0x2000)
      {
        CFStringRef v3 = @"sysdiagnose";
        goto LABEL_86;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x4000uLL:
          CFStringRef v3 = @"screenSharingServer";
          goto LABEL_86;
        case 0x8000uLL:
          CFStringRef v3 = @"diagnostics";
          goto LABEL_86;
        case 0x10000uLL:
          CFStringRef v3 = @"sos";
          goto LABEL_86;
      }
    }
    goto LABEL_85;
  }
  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 > 63)
    {
      if (a3 == 64)
      {
        CFStringRef v3 = @"navigationTeal";
        goto LABEL_86;
      }
      if (a3 == 128)
      {
        CFStringRef v3 = @"navigationBlue";
        goto LABEL_86;
      }
    }
    else
    {
      if (a3 == 16)
      {
        CFStringRef v3 = @"inVideoConference";
        goto LABEL_86;
      }
      if (a3 == 32)
      {
        CFStringRef v3 = @"screenSharing";
        goto LABEL_86;
      }
    }
LABEL_85:
    NSInteger v4 = objc_msgSend(a1, "_stringsForStatusBarStyleOverrides:");
    CFStringRef v3 = [v4 componentsJoinedByString:@", "];

    goto LABEL_86;
  }
  CFStringRef v3 = @"inCall";
  switch(a3)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      CFStringRef v3 = @"(all)";
      break;
    case 0uLL:
      CFStringRef v3 = @"(none)";
      break;
    case 1uLL:
      break;
    case 2uLL:
      CFStringRef v3 = @"inWorkout";
      break;
    case 4uLL:
      CFStringRef v3 = @"recording";
      break;
    case 8uLL:
      CFStringRef v3 = @"tethering";
      break;
    default:
      goto LABEL_85;
  }
LABEL_86:
  return v3;
}

+ (id)_stringsForStatusBarStyleOverrides:(unint64_t)a3
{
  NSInteger v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = v4;
  if (a3)
  {
    uint64_t v6 = @"inCall";
    goto LABEL_67;
  }
  if ((a3 & 2) != 0)
  {
    uint64_t v6 = @"inWorkout";
    goto LABEL_67;
  }
  if ((a3 & 4) != 0)
  {
    uint64_t v6 = @"recording";
    goto LABEL_67;
  }
  if ((a3 & 8) != 0)
  {
    uint64_t v6 = @"tethering";
    goto LABEL_67;
  }
  if ((a3 & 0x10) != 0)
  {
    uint64_t v6 = @"inVideoConference";
    goto LABEL_67;
  }
  if ((a3 & 0x20) != 0)
  {
    uint64_t v6 = @"screenSharing";
    goto LABEL_67;
  }
  if ((a3 & 0x40) != 0)
  {
    uint64_t v6 = @"navigationTeal";
    goto LABEL_67;
  }
  if ((a3 & 0x80) != 0)
  {
    uint64_t v6 = @"navigationBlue";
    goto LABEL_67;
  }
  if ((a3 & 0x100) != 0)
  {
    uint64_t v6 = @"assistantEyesFree";
    goto LABEL_67;
  }
  if ((a3 & 0x200) != 0)
  {
    uint64_t v6 = @"videoOut";
    goto LABEL_67;
  }
  if ((a3 & 0x400) != 0)
  {
    uint64_t v6 = @"hearingAidRecording";
    goto LABEL_67;
  }
  if ((a3 & 0x800) != 0)
  {
    uint64_t v6 = @"backgroundLocation";
    goto LABEL_67;
  }
  if ((a3 & 0x20000000000) != 0)
  {
    uint64_t v6 = @"nearbyInteractions";
    goto LABEL_67;
  }
  if ((a3 & 0x1000) != 0)
  {
    uint64_t v6 = @"carPlay";
    goto LABEL_67;
  }
  if ((a3 & 0x2000) != 0)
  {
    uint64_t v6 = @"sysdiagnose";
    goto LABEL_67;
  }
  if ((a3 & 0x4000) != 0)
  {
    uint64_t v6 = @"screenSharingServer";
    goto LABEL_67;
  }
  if ((a3 & 0x8000) != 0)
  {
    uint64_t v6 = @"diagnostics";
    goto LABEL_67;
  }
  if ((a3 & 0x10000) != 0)
  {
    uint64_t v6 = @"sos";
    goto LABEL_67;
  }
  if ((a3 & 0x20000) != 0)
  {
    uint64_t v6 = @"webRTCCapture";
    goto LABEL_67;
  }
  if ((a3 & 0x1000000) != 0)
  {
    uint64_t v6 = @"webRTCAudioCapture";
    goto LABEL_67;
  }
  if ((a3 & 0x2000000) != 0)
  {
    uint64_t v6 = @"fullScreenWebRTCCapture";
    goto LABEL_67;
  }
  if ((a3 & 0x4000000) != 0)
  {
    uint64_t v6 = @"fullScreenWebRTCAudioCapture";
    goto LABEL_67;
  }
  if ((a3 & 0x40000) != 0)
  {
    uint64_t v6 = @"airPrint";
    goto LABEL_67;
  }
  if ((a3 & 0x80000) != 0)
  {
    uint64_t v6 = @"developerTools";
    goto LABEL_67;
  }
  if ((a3 & 0x100000) != 0)
  {
    uint64_t v6 = @"screenReplayRecording";
    goto LABEL_67;
  }
  if ((a3 & 0x200000) != 0)
  {
    uint64_t v6 = @"loggingCapture";
    goto LABEL_67;
  }
  if ((a3 & 0x400000) != 0)
  {
    uint64_t v6 = @"autoAirPlayReady";
    goto LABEL_67;
  }
  if ((a3 & 0x800000) != 0)
  {
    uint64_t v6 = @"autoAirPlayPlaying";
    goto LABEL_67;
  }
  if ((a3 & 0x8000000) != 0)
  {
    uint64_t v6 = @"callRinging";
    goto LABEL_67;
  }
  if ((a3 & 0x10000000) != 0)
  {
    uint64_t v6 = @"videoConferenceRinging";
    goto LABEL_67;
  }
  if ((a3 & 0x20000000) != 0)
  {
    uint64_t v6 = @"stewie";
    goto LABEL_67;
  }
  if ((a3 & 0x800000000) != 0)
  {
    uint64_t v6 = @"stewieDisconnected";
    goto LABEL_67;
  }
  if ((a3 & 0x140000000) != 0)
  {
    uint64_t v6 = @"sharePlay";
LABEL_67:
    [v4 addObject:v6];
    goto LABEL_68;
  }
  if ((a3 & 0x280000000) != 0)
  {
    uint64_t v6 = @"sharePlayScreenSharing";
    goto LABEL_67;
  }
  if ((a3 & 0x10000000000) != 0)
  {
    uint64_t v6 = @"sharePlayInactive";
    goto LABEL_67;
  }
  if ((a3 & 0x400000000) != 0)
  {
    uint64_t v6 = @"playgrounds";
    goto LABEL_67;
  }
  if ((a3 & 0x1000000000) != 0)
  {
    uint64_t v6 = @"activePushToTalkCall";
    goto LABEL_67;
  }
  if ((a3 & 0x2000000000) != 0)
  {
    uint64_t v6 = @"idlePushToTalkCall";
    goto LABEL_67;
  }
  if ((a3 & 0x4000000000) != 0)
  {
    uint64_t v6 = @"callHandoff";
    goto LABEL_67;
  }
  if ((a3 & 0x8000000000) != 0)
  {
    uint64_t v6 = @"videoConferenceHandoff";
    goto LABEL_67;
  }
LABEL_68:
  return v5;
}

+ (id)stringForInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"Interface Unknown";
  }
  else {
    return off_1E53031C8[a3 - 1];
  }
}

- (BOOL)_shouldForceClassicMode
{
  return 0;
}

+ (BOOL)_shouldBigify
{
  if (!os_variant_has_internal_diagnostics()) {
    return 0;
  }
  NSInteger v4 = _UIKitUserDefaults();
  uint64_t v5 = [v4 objectForKey:@"UIApplicationLayoutUsesFullCanvasSizeKey"];
  uint64_t v6 = v5;
  if (v5) {
    char v2 = [v5 BOOLValue];
  }
  else {
    char v2 = 0;
  }

  return v2;
}

- (int64_t)_classicMode
{
  char v2 = objc_opt_class();
  return [v2 _classicMode];
}

uint64_t __37__UIApplication__fetchInfoPlistFlags__block_invoke(uint64_t a1, const char *a2, void *a3)
{
  id v4 = a3;
  if (object_getClass(v4) == (Class)MEMORY[0x1E4F145F0])
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    setenv(a2, string_ptr, 1);
  }

  return 1;
}

- (BOOL)_disableLayoutAwareShortcuts
{
  return [(_UIApplicationInfoParser *)self->_appInfo disableLayoutAwareShortcuts];
}

- (id)_event
{
  return self->_eventDispatcher->_mainEnvironment->_event;
}

- (id)_touchesEvent
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    int v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &_touchesEvent___s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      long long v9 = "-[UIApplication _touchesEvent]";
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "%s will no longer work as expected. Please stop using it.", (uint8_t *)&v8, 0xCu);
    }
  }
  mainEnvironment = self->_eventDispatcher->_mainEnvironment;
  id v4 = [(UIApplication *)self keyWindow];
  uint64_t v5 = -[UIEventEnvironment _touchesEventForWindow:]((uint64_t)mainEnvironment, v4);

  return v5;
}

- (double)_initialTouchTimestampForWindow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIApplication *)self _touchesEventForWindow:v4];
  [v5 _initialTouchTimestampForWindow:v4];
  double v7 = v6;

  return v7;
}

- (id)_motionEvent
{
  return self->_eventDispatcher->_mainEnvironment->_motionEvent;
}

- (id)_moveEventForWindow:(id)a3
{
  return -[UIEventEnvironment _moveEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (id)_wheelEventForWindow:(id)a3
{
  return -[UIEventEnvironment _wheelEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (id)_gameControllerEventForWindow:(id)a3
{
  return -[UIEventEnvironment _gameControllerEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (id)_physicalKeyboardEventForWindow:(id)a3
{
  return -[UIEventEnvironment _physicalKeyboardEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (id)_pencilEventForWindow:(id)a3
{
  return -[UIEventEnvironment _pencilEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (id)_dragEvents
{
  return -[UIEventEnvironment _dragEvents]((id *)&self->_eventDispatcher->_mainEnvironment->super.isa);
}

- (id)_scrollEventForWindow:(id)a3
{
  return -[UIEventEnvironment _scrollEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (id)_transformEventForWindow:(id)a3
{
  return -[UIEventEnvironment _transformEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (id)_hoverEventForWindowSpringBoardOnly:(id)a3
{
  id v4 = a3;
  if ([(UIApplication *)self _isSpringBoard])
  {
    uint64_t v5 = [(UIApplication *)self _hoverEventForWindow:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_remoteControlEvent
{
  return self->_eventDispatcher->_mainEnvironment->_remoteControlEvent;
}

- (id)_dynamicButtonEventForWindow:(id)a3
{
  return -[UIEventEnvironment _dynamicButtonEventForWindow:](self->_eventDispatcher->_mainEnvironment, a3);
}

- (void)_presentEditAlertController:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    id v4 = [(UIApplication *)self _motionKeyWindow];

    if (v4)
    {
      uint64_t v5 = [(UIApplication *)self _motionKeyWindow];
      double v6 = [v5 rootViewController];

      double v7 = [v6 presentedViewController];

      if (v7)
      {
        do
        {
          int v8 = [v6 presentedViewController];

          long long v9 = [v8 presentedViewController];

          double v6 = v8;
        }
        while (v9);
      }
      else
      {
        int v8 = v6;
      }
      [v8 presentViewController:v10 animated:1 completion:0];
    }
  }
}

- (void)_showEditAlertViewWithUndoManager:(id)a3 window:(id)a4
{
  id v5 = a3;
  double v6 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:1];
  int v7 = [v5 canUndo];
  int v8 = [v5 canRedo];
  int v9 = v7 & v8;
  if ((v7 & v8 & 1) == 0)
  {
    id v10 = _UIKitBundle();
    uint64_t v11 = [v10 localizedStringForKey:@"CANCEL_TITLE_IN_UNDO_ALERT" value:@"Cancel" table:@"Localizable"];

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke;
    v31[3] = &unk_1E52DC290;
    v31[4] = self;
    BOOL v12 = +[UIAlertAction actionWithTitle:v11 style:1 handler:v31];
    [v6 addAction:v12];
  }
  if ((v7 | v8) != 1)
  {
    long long v18 = _UINSLocalizedStringWithDefaultValue(@"Nothing to Undo", @"Nothing to Undo");
    goto LABEL_15;
  }
  if (v7)
  {
    uint64_t v13 = _UIKitBundle();
    uint64_t v14 = [v13 localizedStringForKey:@"UNDO_BUTTON_TITLE_IN_UNDO_ALERT" value:@"Undo" table:@"Localizable"];

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_3;
    v29[3] = &unk_1E5302AC8;
    v29[4] = self;
    id v15 = v5;
    id v30 = v15;
    long long v16 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v29];
    [v6 addAction:v16];

    if ((v8 & 1) == 0)
    {
LABEL_11:
      uint64_t v21 = [v5 undoMenuItemTitle];
      goto LABEL_13;
    }
    long long v17 = [v15 redoMenuItemTitle];
  }
  else
  {
    if (!v8) {
      goto LABEL_12;
    }
    long long v19 = _UIKitBundle();
    long long v17 = [v19 localizedStringForKey:@"REDO_BUTTON_TITLE_IN_UNDO_ALERT" value:@"Redo" table:@"Localizable"];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_5;
  v27[3] = &unk_1E5302AC8;
  v27[4] = self;
  id v28 = v5;
  long long v20 = +[UIAlertAction actionWithTitle:v17 style:0 handler:v27];
  [v6 addAction:v20];

  if (v7) {
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v21 = [v5 redoMenuItemTitle];
LABEL_13:
  long long v18 = (void *)v21;
  if (!v21)
  {
    long long v22 = _UIKitBundle();
    long long v18 = [v22 localizedStringForKey:@"UNDO_TITLE_LABEL_IN_UNDO_ALERT" value:@"Undo" table:@"Localizable"];
  }
LABEL_15:
  [v6 setTitle:v18];

  if (v9)
  {
    long long v23 = _UIKitBundle();
    long long v24 = [v23 localizedStringForKey:@"CANCEL_BUTTON_TITLE_IN_UNDO_ALERT" value:@"Cancel" table:@"Localizable"];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_7;
    v26[3] = &unk_1E52DC290;
    void v26[4] = self;
    long long v25 = +[UIAlertAction actionWithTitle:v24 style:1 handler:v26];
    [v6 addAction:v25];
  }
  objc_storeWeak((id *)&self->_editAlertController, v6);
  [(UIApplication *)self _presentEditAlertController:v6];
}

uint64_t __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 64), 0);
  return +[UIUndoGestureInteraction presentProductivityGestureTutorialIfNeededWithCompletion:&__block_literal_global_1846_0];
}

uint64_t __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_2()
{
  return +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:@"UndoCancel" trigger:@"Shake"];
}

void __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_3(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 64), 0);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_4;
  v2[3] = &unk_1E52D9F70;
  id v3 = *(id *)(a1 + 40);
  +[UIUndoGestureInteraction presentProductivityGestureTutorialIfNeededWithCompletion:v2];
}

uint64_t __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) canUndo];
  if (result)
  {
    [*(id *)(a1 + 32) undo];
    return +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:@"Undo" trigger:@"Shake"];
  }
  return result;
}

void __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_5(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 64), 0);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_6;
  v2[3] = &unk_1E52D9F70;
  id v3 = *(id *)(a1 + 40);
  +[UIUndoGestureInteraction presentProductivityGestureTutorialIfNeededWithCompletion:v2];
}

uint64_t __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_6(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) canRedo];
  if (result)
  {
    [*(id *)(a1 + 32) redo];
    return +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:@"Redo" trigger:@"Shake"];
  }
  return result;
}

id __58__UIApplication__showEditAlertViewWithUndoManager_window___block_invoke_7(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 64), 0);
}

- (BOOL)_shakeToUndoEnabledForWindow:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[UIDictationController isRunning];
  double v6 = [v4 windowScene];
  if ((([v6 _isTargetOfKeyboardEventDeferringEnvironment] & 1) != 0
     || [v4 _needsShakesWhenInactive])
    && [(UIApplication *)self applicationSupportsShakeToEdit]
    && !_AXSShakeToUndoDisabled())
  {
    int v7 = !+[UIKeyboard isInputSystemUI] && !v5;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_shouldShowAlertForUndoManager:(id)a3
{
  id v4 = a3;
  if (([v4 canUndo] & 1) != 0 || objc_msgSend(v4, "canRedo"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_editAlertController);
    BOOL v6 = WeakRetained == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_setupMotionFeedbackGenerator
{
  if (!self->_motionNotificationGenerator)
  {
    id v3 = [UINotificationFeedbackGenerator alloc];
    id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1ED3F60A8];
    BOOL v5 = +[_UINotificationFeedbackGeneratorConfiguration privateConfigurationForTypes:v4];
    BOOL v6 = [(UIFeedbackGenerator *)v3 initWithConfiguration:v5];
    motionNotificationGenerator = self->_motionNotificationGenerator;
    self->_motionNotificationGenerator = v6;

    int v8 = self->_motionNotificationGenerator;
    [(UIFeedbackGenerator *)v8 activateWithCompletionBlock:0];
  }
}

- (void)_teardownMotionEventBehavior
{
  [(UIFeedbackGenerator *)self->_motionNotificationGenerator deactivate];
  motionNotificationGenerator = self->_motionNotificationGenerator;
  self->_motionNotificationGenerator = 0;
}

- (void)motionBegan:(int64_t)a3 withEvent:(id)a4
{
  int v9 = [(UIApplication *)self _motionKeyWindow];
  BOOL v5 = [(UIApplication *)self _shakeToUndoEnabledForWindow:v9];
  BOOL v6 = v9;
  if (v5)
  {
    int v7 = [v9 firstResponder];
    int v8 = [v7 undoManager];

    if ([(UIApplication *)self _shouldShowAlertForUndoManager:v8]) {
      [(UIApplication *)self _setupMotionFeedbackGenerator];
    }

    BOOL v6 = v9;
  }
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  BOOL v5 = [(UIApplication *)self _motionKeyWindow];
  if ([(UIApplication *)self _shakeToUndoEnabledForWindow:v5])
  {
    BOOL v6 = [v5 firstResponder];
    int v7 = [v6 undoManager];

    if ([(UIApplication *)self _shouldShowAlertForUndoManager:v7])
    {
      [(UIApplication *)self _setupMotionFeedbackGenerator];
      motionNotificationGenerator = self->_motionNotificationGenerator;
      if (motionNotificationGenerator)
      {
        int v9 = motionNotificationGenerator;
        uint64_t v11 = MEMORY[0x1E4F143A8];
        uint64_t v12 = 3221225472;
        uint64_t v13 = __39__UIApplication_motionEnded_withEvent___block_invoke;
        uint64_t v14 = &unk_1E52DAF90;
        id v15 = self;
        id v16 = v7;
        id v17 = v5;
        long long v18 = v9;
        id v10 = v9;
        [(UIFeedbackGenerator *)v10 activateWithCompletionBlock:&v11];
      }
      else
      {
        [(UIApplication *)self _showEditAlertViewWithUndoManager:v7 window:v5];
      }
    }
  }
  [(UIApplication *)self _teardownMotionEventBehavior];
}

uint64_t __39__UIApplication_motionEnded_withEvent___block_invoke(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) _showEditAlertViewWithUndoManager:*(void *)(a1 + 40) window:*(void *)(a1 + 48)];
  if (a2) {
    [*(id *)(a1 + 56) _privateNotificationOccurred:1006];
  }
  id v4 = *(void **)(a1 + 56);
  return [v4 deactivate];
}

- (id)_exclusiveTouchWindows
{
  if (_exclusiveTouchWindows_once != -1) {
    dispatch_once(&_exclusiveTouchWindows_once, &__block_literal_global_1878);
  }
  return 0;
}

void __39__UIApplication__exclusiveTouchWindows__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &kUISuspendedReturnToLastAppKey_block_invoke_4___s_category)+ 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 136315138;
    char v2 = "-[UIApplication _exclusiveTouchWindows]_block_invoke";
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "%s now returns nil and will be removed soon, please stop calling it immediately!", (uint8_t *)&v1, 0xCu);
  }
}

- (BOOL)_isTrackingAnyTouch
{
  mainEnvironment = self->_eventDispatcher->_mainEnvironment;
  return mainEnvironment && [(NSMutableSet *)mainEnvironment->_windowsWithActiveTouchMaps count] != 0;
}

- (int64_t)overriddenRequestedStyleFromStyle:(int64_t)a3
{
  return a3;
}

- (unint64_t)statusBar:(id)a3 effectiveStyleOverridesForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5
{
  uint64_t v7 = *((void *)&self->_applicationFlags + 1);
  unint64_t v8 = [(_UIApplicationInfoParser *)self->_appInfo ignoredOverrides];
  int v9 = [(UIApplication *)self _mainScene];
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 settings];
    int v12 = [v11 isUISubclass];

    if (v12)
    {
      uint64_t v13 = [v10 uiSettings];
      v8 |= [v13 statusBarStyleOverridesToSuppress];
    }
  }
  if ((v7 & 0x200000000) != 0) {
    unint64_t v14 = 0;
  }
  else {
    unint64_t v14 = a5;
  }
  unint64_t v15 = v14 & ~v8;

  return v15;
}

- (void)statusBar:(id)a3 willAnimateFromHeight:(double)a4 toHeight:(double)a5 duration:(double)a6 animation:(int)a7
{
  if (self->_statusBar == a3)
  {
    [(UIApplication *)self statusBarFrame];
    -[UIApplication _notifyWillChangeStatusBarFrame:](self, "_notifyWillChangeStatusBarFrame:");
    if (a7 != 3)
    {
      if (a7 == 2)
      {
        +[UIWindow _noteStatusBarHeightChanged:a5 oldHeight:a4];
      }
      else
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __77__UIApplication_statusBar_willAnimateFromHeight_toHeight_duration_animation___block_invoke;
        v17[3] = &__block_descriptor_40_e24_v24__0___v___8___v__B_16l;
        *(double *)&v17[4] = a6;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __77__UIApplication_statusBar_willAnimateFromHeight_toHeight_duration_animation___block_invoke_2;
        v16[3] = &__block_descriptor_48_e5_v8__0l;
        *(double *)&void v16[4] = a5;
        *(double *)&void v16[5] = a4;
        +[UIView conditionallyAnimate:a6 > 0.0 withAnimation:v17 layout:v16 completion:0];
      }
    }
    id v12 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v13 = [NSNumber numberWithDouble:a6];
    unint64_t v14 = objc_msgSend(v12, "initWithObjectsAndKeys:", v13, @"UIApplicationStatusBarHeightChangedDurationKey", 0);

    unint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 postNotificationName:@"UIApplicationStatusBarHeightChangedNotification" object:self userInfo:v14];
  }
}

uint64_t __77__UIApplication_statusBar_willAnimateFromHeight_toHeight_duration_animation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:4 delay:a2 options:a3 animations:*(double *)(a1 + 32) completion:0.0];
}

uint64_t __77__UIApplication_statusBar_willAnimateFromHeight_toHeight_duration_animation___block_invoke_2(uint64_t a1)
{
  return +[UIWindow _noteStatusBarHeightChanged:*(double *)(a1 + 32) oldHeight:*(double *)(a1 + 40)];
}

- (void)statusBar:(id)a3 didAnimateFromHeight:(double)a4 toHeight:(double)a5 animation:(int)a6
{
  if (a6 == 3) {
    +[UIWindow _noteStatusBarHeightChanged:oldHeight:](UIWindow, "_noteStatusBarHeightChanged:oldHeight:", a3, a5, a4);
  }
  [(UIApplication *)self statusBarFrame];
  -[UIApplication _notifyDidChangeStatusBarFrame:](self, "_notifyDidChangeStatusBarFrame:");
}

- (int64_t)statusBar:(id)a3 styleForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5
{
  return a4;
}

- (CGRect)statusBarFrameForOrientation:(int64_t)a3
{
  id v4 = _UIStatusBarManagerForNoWindow();
  if ([v4 isStatusBarHidden])
  {
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    [v4 defaultStatusBarHeightInOrientation:a3];
    objc_msgSend(v4, "statusBarFrameForStatusBarHeight:");
    double v5 = v9;
    double v6 = v10;
    double v7 = v11;
    double v8 = v12;
  }

  double v13 = v5;
  double v14 = v6;
  double v15 = v7;
  double v16 = v8;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (double)statusBarHeight
{
  char v2 = _UIStatusBarManagerForNoWindow();
  [v2 statusBarHeight];
  double v4 = v3;

  return v4;
}

- (int64_t)activeInterfaceOrientation
{
  if ([(UIApplication *)self isFrontBoard]) {
    return 1;
  }
  orientationObserver = self->_orientationObserver;
  if (!orientationObserver)
  {
    double v5 = (FBSOrientationObserver *)objc_alloc_init(MEMORY[0x1E4F629F8]);
    double v6 = self->_orientationObserver;
    self->_orientationObserver = v5;

    orientationObserver = self->_orientationObserver;
  }
  int64_t v7 = [(FBSOrientationObserver *)orientationObserver activeInterfaceOrientation];
  if (BSInterfaceOrientationIsValid()) {
    return v7;
  }
  else {
    return 1;
  }
}

- (void)noteActiveInterfaceOrientationWillChangeToOrientation:(int64_t)a3
{
  id v5 = +[UIScreen mainScreen];
  [(UIApplication *)self noteActiveInterfaceOrientationWillChangeToOrientation:a3 screen:v5];
}

- (void)noteActiveInterfaceOrientationWillChangeToOrientation:(int64_t)a3 screen:(id)a4
{
  id v6 = a4;
  if ([(UIApplication *)self _isSpringBoard]) {
    [v6 _setInterfaceOrientation:a3];
  }
}

- (void)noteActiveInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithSettings:(id)a4 fromOrientation:(int64_t)a5
{
  id v8 = a4;
  id v9 = +[UIScreen mainScreen];
  [(UIApplication *)self noteActiveInterfaceOrientationDidChangeToOrientation:a3 willAnimateWithSettings:v8 fromOrientation:a5 screen:v9];
}

- (void)noteActiveInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithSettings:(id)a4 fromOrientation:(int64_t)a5 screen:(id)a6
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a6;
  if ([(id)UIApp _isSpringBoard])
  {
    double v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v15[0] = 0x1ED160180;
    double v11 = [NSNumber numberWithInteger:a3];
    v15[1] = 0x1ED1601A0;
    v16[0] = v11;
    double v12 = NSNumber;
    [v8 duration];
    double v13 = objc_msgSend(v12, "numberWithDouble:");
    v16[1] = v13;
    double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    [v10 postNotificationName:0x1ED160160 object:v9 userInfo:v14];
  }
}

- (BOOL)_usesEmoji
{
  return 0;
}

- (BOOL)ignoresInteractionEvents
{
  return (*((unsigned char *)&self->_applicationFlags + 3) & 0x1E) != 0;
}

- (unint64_t)blockInteractionEventsCount
{
  return (*(void *)&self->_applicationFlags >> 25) & 0xFLL;
}

- (void)_alertItemStateChanged
{
  if ([(UIApplication *)self _isSpringBoard]
    || ![(UIApplication *)self _isSpringBoardShowingAnAlert])
  {
    [(UIApplication *)self _stopDeactivatingForReason:13];
  }
  else
  {
    [(UIApplication *)self _deactivateForReason:13];
  }
}

- (void)significantTimeChange
{
  if ((*((unsigned char *)&self->_applicationFlags + 5) & 0x20) != 0) {
    [(UIApplicationDelegate *)self->_delegate applicationSignificantTimeChange:self];
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"UIApplicationSignificantTimeChangeNotification" object:self];
}

- (void)_unregisterForUserDefaultsChanges
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F28AC8] object:0];
}

uint64_t __70__UIApplication__registerForHangTracerEnabledStateChangedNotification__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 userInfo];
  double v4 = [v3 objectForKey:*MEMORY[0x1E4F655F8]];
  __hangTracerIsTaskedOn = [v4 BOOLValue];

  id v5 = *(void **)(a1 + 32);
  return [v5 _updateHangTracer];
}

void __62__UIApplication__registerForKeyboardLayoutChangedNotification__block_invoke()
{
  [(id)UIApp _updateSerializableKeyCommandsForResponder:0];
  _UIKeyCommandHardwareKeyboardLayoutChanged();
}

- (void)setBacklightLevel:(float)a3
{
  id v5 = +[UIDevice currentDevice];
  *(float *)&double v4 = a3;
  [v5 _setBacklightLevel:v4];
}

- (BOOL)_isSensitiveUIEnabled
{
  if (qword_1EB25B790 != -1) {
    dispatch_once(&qword_1EB25B790, &__block_literal_global_1891_0);
  }
  return byte_1EB25B4FD;
}

uint64_t __38__UIApplication__isSensitiveUIEnabled__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB25B4FD = result;
  return result;
}

- (BOOL)_overridesDynamicCaret
{
  return 1;
}

- (float)backlightLevel
{
  char v2 = +[UIDevice currentDevice];
  [v2 _backlightLevel];
  float v4 = v3;

  return v4;
}

- (void)setProximityEventsEnabled:(BOOL)a3
{
  float v4 = [(UIApplication *)self _mainScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__UIApplication_setProximityEventsEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  BOOL v6 = a3;
  [v4 updateUIClientSettingsWithBlock:v5];
}

void __43__UIApplication_setProximityEventsEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 proximityDetectionModes];
  int v5 = *(unsigned __int8 *)(a1 + 32);
  if (((v4 >> 1) & 1) != v5)
  {
    [v3 setProximityDetectionModes:v4 & 0xFFFFFFFFFFFFFFFDLL | (2 * (v5 != 0))];
    if (*(unsigned char *)(a1 + 32))
    {
      uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
      int64_t v7 = *(void **)(UIApp + 168);
      *(void *)(UIApp + 168) = v6;
    }
    else
    {
      [*(id *)(UIApp + 168) timeIntervalSinceNow];
      id v8 = *(void **)(UIApp + 168);
      *(void *)(UIApp + 168) = 0;
    }
    AnalyticsSendEventLazy();
  }
}

id __43__UIApplication_setProximityEventsEnabled___block_invoke_2(uint64_t a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"bundleId";
  char v2 = _UIMainBundleIdentifier();
  v6[1] = @"enabled";
  v7[0] = v2;
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

id __43__UIApplication_setProximityEventsEnabled___block_invoke_3(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"bundleId";
  char v2 = _UIMainBundleIdentifier();
  v8[0] = v2;
  v7[1] = @"enabled";
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 36)];
  v8[1] = v3;
  void v7[2] = @"enabledTime";
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
  v8[2] = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (void)setProximitySensingEnabled:(BOOL)proximitySensingEnabled
{
  BOOL v3 = proximitySensingEnabled;
  id v4 = +[UIDevice currentDevice];
  [v4 setProximityMonitoringEnabled:v3];
}

- (BOOL)isProximitySensingEnabled
{
  char v2 = +[UIDevice currentDevice];
  char v3 = [v2 isProximityMonitoringEnabled];

  return v3;
}

- (void)setSystemVolumeHUDEnabled:(BOOL)a3 forAudioCategory:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (__CFString *)a4;
  if (os_variant_has_internal_diagnostics()
    && [(id)UIApp _appAdoptsUISceneLifecycle])
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)timespec buf = 136315138;
        id v17 = "-[UIApplication setSystemVolumeHUDEnabled:forAudioCategory:]";
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Error in UIKit client: %s should not be called if the client adopts UIScene lifecycle as it will return unexpected results.", buf, 0xCu);
      }
    }
    else
    {
      double v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setSystemVolumeHUDEnabled_forAudioCategory____s_category)+ 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)timespec buf = 136315138;
        id v17 = "-[UIApplication setSystemVolumeHUDEnabled:forAudioCategory:]";
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Error in UIKit client: %s should not be called if the client adopts UIScene lifecycle as it will return unexpected results.", buf, 0xCu);
      }
    }
  }
  if (v6 && [(__CFString *)v6 length])
  {
    char v7 = 0;
  }
  else
  {

    char v7 = 1;
    uint64_t v6 = &stru_1ED0E84C0;
  }
  id v8 = [(UIApplication *)self _mainScene];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __60__UIApplication_setSystemVolumeHUDEnabled_forAudioCategory___block_invoke;
  v12[3] = &unk_1E5302B58;
  char v14 = v7;
  BOOL v15 = a3;
  double v13 = v6;
  id v9 = v6;
  [v8 updateUIClientSettingsWithBlock:v12];
}

void __60__UIApplication_setSystemVolumeHUDEnabled_forAudioCategory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (!*(unsigned char *)(a1 + 40))
  {
    int v5 = [v3 audioCategoriesDisablingVolumeHUD];
    if ([v5 count])
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v5];
      id v4 = (id)v6;
      if (!*(unsigned char *)(a1 + 41))
      {
        if (v6)
        {
LABEL_14:
          [v4 addObject:*(void *)(a1 + 32)];
LABEL_15:

          goto LABEL_16;
        }
LABEL_13:
        id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        goto LABEL_14;
      }
    }
    else
    {
      if (!*(unsigned char *)(a1 + 41)) {
        goto LABEL_13;
      }
      id v4 = 0;
    }
    [v4 removeObject:*(void *)(a1 + 32)];
    if (![v4 count])
    {

      id v4 = 0;
    }
    goto LABEL_15;
  }
  if (*(unsigned char *)(a1 + 41))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
  }
LABEL_16:
  char v7 = [v4 allObjects];
  [v8 setAudioCategoriesDisablingVolumeHUD:v7];
}

- (void)setSystemVolumeHUDEnabled:(BOOL)a3
{
}

- (void)_performMemoryWarning
{
  kdebug_trace();
  *((void *)&self->_applicationFlags + 1) |= 0x80000000uLL;
  [(UIApplication *)self didReceiveMemoryWarning];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"UIApplicationDidReceiveMemoryWarningNotification" object:self];

  +[UIViewController _traverseViewControllerHierarchyWithDelayedRelease:&__block_literal_global_1915_0];
  *((void *)&self->_applicationFlags + 1) &= ~0x80000000uLL;
  kdebug_trace();
}

uint64_t __38__UIApplication__performMemoryWarning__block_invoke(uint64_t a1, void *a2, int a3)
{
  if (a3) {
    return [a2 didReceiveMemoryWarning];
  }
  return result;
}

- (void)didReceiveMemoryWarning
{
  [(id)UIApp applicationState];
  [(UIApplicationDelegate *)self->_delegate methodForSelector:sel_applicationDidReceiveMemoryWarning_];
  entr_act_modify();
  if ((*((unsigned char *)&self->_applicationFlags + 5) & 8) != 0)
  {
    delegate = self->_delegate;
    [(UIApplicationDelegate *)delegate applicationDidReceiveMemoryWarning:self];
  }
}

- (void)_receivedMemoryNotification
{
  if ((*((unsigned char *)&self->_applicationFlags + 3) & 0x20) != 0 && !__jetsamDisabled)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Received memory warning.", v3, 2u);
    }
    [(UIApplication *)self _performMemoryWarning];
  }
}

uint64_t __43__UIApplication_setReceivesMemoryWarnings___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _receivedMemoryNotification];
}

- (void)_purgeSharedInstances
{
  +[UIKeyboardImpl releaseSharedInstance];
  +[UIImage _flushSharedImageCache];
}

- (id)_forceStageObservable
{
  forceStageObservable = self->_forceStageObservable;
  if (!forceStageObservable)
  {
    id v4 = (UIForceStageObservable *)objc_opt_new();
    int v5 = self->_forceStageObservable;
    self->_forceStageObservable = v4;

    forceStageObservable = self->_forceStageObservable;
  }
  return forceStageObservable;
}

- (void)_eatCurrentTouchForWindow:(id)a3
{
  -[UIEventEnvironment _currentTouchForWindow:]((uint64_t)self->_eventDispatcher->_mainEnvironment, a3);
  id v3 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    v3[264] = 1;
  }
}

- (BOOL)_eatCurrentTouchForWindow:(id)a3 ifPredicate:(id)a4
{
  uint64_t v6 = (unsigned int (**)(id, uint64_t))a4;
  uint64_t v7 = -[UIEventEnvironment _currentTouchForWindow:]((uint64_t)self->_eventDispatcher->_mainEnvironment, a3);
  id v8 = (unsigned char *)v7;
  if (v7 && !*(unsigned char *)(v7 + 264) && v6[2](v6, v7))
  {
    BOOL v9 = 1;
    v8[264] = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_windowForSystemAppButtonEventsForScreen:(id)a3
{
  return 0;
}

BOOL __37__UIApplication__keyWindowForScreen___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 screen];
  int v5 = v4;
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v6)
  {
    if (![v4 _isMainScreen]) {
      goto LABEL_3;
    }
LABEL_5:
    id v8 = [v3 firstResponder];
    BOOL v7 = v8 != 0;

    goto LABEL_6;
  }
  if (v4 == v6) {
    goto LABEL_5;
  }
LABEL_3:
  BOOL v7 = 0;
LABEL_6:

  return v7;
}

uint64_t __37__UIApplication__keyWindowForScreen___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 screen];
  int v5 = v4;
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    BOOL v7 = v4;
    if (v4 == v6) {
      goto LABEL_6;
    }
LABEL_7:
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  if (![v4 _isMainScreen]) {
    goto LABEL_7;
  }
  BOOL v7 = *(void **)(a1 + 32);
LABEL_6:
  uint64_t v8 = [v3 _canActAsKeyWindowForScreen:v7];
LABEL_8:

  return v8;
}

- (void)_sendButtonEventWithType:(int64_t)a3 phase:(int64_t)a4 timestamp:(double)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    double v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &_sendButtonEventWithType_phase_timestamp____s_category)+ 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      char v14 = "-[UIApplication _sendButtonEventWithType:phase:timestamp:]";
      __int16 v15 = 2112;
      double v16 = @"_sendButtonEventWithType:phase:timestamp:contextID:";
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%s: This method is deprecated. In order to look up the appropriate press event, please migrate to %@. The presses event associated with the key window's window scene will be used for now.", (uint8_t *)&v13, 0x16u);
    }
  }
  BOOL v9 = [(id)UIApp keyWindow];
  if (!v9)
  {
    double v10 = +[UIScreen mainScreen];
    double v11 = +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:v10];

    BOOL v9 = [v11 _topVisibleWindowPassingTest:&__block_literal_global_1926];
  }
  -[UIApplication _sendButtonEventWithType:phase:timestamp:contextID:](self, "_sendButtonEventWithType:phase:timestamp:contextID:", a3, a4, [v9 _contextId], a5);
}

uint64_t __58__UIApplication__sendButtonEventWithType_phase_timestamp___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 canBecomeKeyWindow] && (objc_msgSend(v2, "_isTextEffectsWindow") & 1) == 0) {
    uint64_t v3 = [v2 isInternalWindow] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_sendButtonEventWithType:(int64_t)a3 phase:(int64_t)a4 timestamp:(double)a5 contextID:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  if ((unint64_t)(a4 - 3) >= 2) {
    double v11 = 1.0;
  }
  else {
    double v11 = 0.0;
  }
  double v12 = objc_alloc_init(UIPressInfo);
  [(UIPressInfo *)v12 setType:a3];
  [(UIPressInfo *)v12 setPhase:a4];
  [(UIPressInfo *)v12 setTimestamp:a5];
  [(UIPressInfo *)v12 setForce:v11];
  [(UIPressInfo *)v12 setContextID:v6];
  [(UIApplication *)self _sendButtonEventWithPressInfo:v12];
}

- (BOOL)_prepareButtonEvent:(id)a3 type:(int64_t)a4 phase:(int64_t)a5 timestamp:(double)a6 contextID:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  if ((unint64_t)(a5 - 3) >= 2) {
    double v12 = 1.0;
  }
  else {
    double v12 = 0.0;
  }
  id v13 = a3;
  char v14 = objc_alloc_init(UIPressInfo);
  [(UIPressInfo *)v14 setType:a4];
  [(UIPressInfo *)v14 setPhase:a5];
  [(UIPressInfo *)v14 setTimestamp:a6];
  [(UIPressInfo *)v14 setForce:v12];
  [(UIPressInfo *)v14 setContextID:v7];
  BOOL v15 = [(UIApplication *)self _prepareButtonEvent:v13 withPressInfo:v14];

  return v15;
}

- (BOOL)_prepareButtonEvent:(id)a3 type:(int64_t)a4 phase:(int64_t)a5 timestamp:(double)a6 force:(double)a7 contextID:(unsigned int)a8
{
  return [(UIApplication *)self _prepareButtonEvent:a3 type:a4 phase:a5 timestamp:1 force:0 clickCount:*(void *)&a8 longClick:a6 contextID:a7];
}

- (BOOL)_prepareButtonEvent:(id)a3 type:(int64_t)a4 phase:(int64_t)a5 timestamp:(double)a6 force:(double)a7 clickCount:(unint64_t)a8 longClick:(BOOL)a9 contextID:(unsigned int)a10
{
  uint64_t v10 = *(void *)&a10;
  BOOL v11 = a9;
  id v18 = a3;
  long long v19 = objc_alloc_init(UIPressInfo);
  [(UIPressInfo *)v19 setType:a4];
  if (v11) {
    int64_t v20 = 1;
  }
  else {
    int64_t v20 = a5;
  }
  [(UIPressInfo *)v19 setPhase:v20];
  [(UIPressInfo *)v19 setTimestamp:a6];
  [(UIPressInfo *)v19 setForce:a7];
  [(UIPressInfo *)v19 setClickCount:a8];
  [(UIPressInfo *)v19 setLongClick:v11];
  [(UIPressInfo *)v19 setContextID:v10];
  BOOL v21 = [(UIApplication *)self _prepareButtonEvent:v18 withPressInfo:v19];

  return v21;
}

- (void)_sendButtonEventWithPressInfo:(id)a3
{
  mainEnvironment = self->_eventDispatcher->_mainEnvironment;
  id v5 = a3;
  uint64_t v6 = +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:", [v5 contextID]);
  id v7 = -[UIEventEnvironment _pressesEventForWindow:](mainEnvironment, v6);

  LODWORD(v6) = [(id)UIApp _prepareButtonEvent:v7 withPressInfo:v5];
  if (v6)
  {
    [(UIApplication *)self sendEvent:v7];
    [(UIApplication *)self _finishButtonEvent:v7];
  }
}

- (BOOL)_prepareButtonEvent:(id)a3 withPressInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 source];
  if ([v7 type] != -1)
  {
    if (v8 == 3)
    {
      +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:", [v7 contextID]);
    }
    else
    {
      [v6 _hidEvent];
      _UIEventHIDUIWindowForHIDEvent();
    uint64_t v10 = };
    -[UIEventEnvironment _pressForType:window:]((uint64_t)self->_eventDispatcher->_mainEnvironment, [v7 type], v10);
    BOOL v11 = (UIPress *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      double v12 = v11;
      uint64_t v13 = [(UIPress *)v11 phase];
      if ((v13 == [v7 phase] || !objc_msgSend(v7, "phase") && v13 == 2)
        && ([v7 isLongClick] & 1) == 0)
      {
        BOOL v9 = 0;
        if ([v7 phase] != 1 || v13 != 1) {
          goto LABEL_31;
        }
        [(UIPress *)v12 force];
        double v17 = v16;
        [v7 force];
        if (v17 == v18) {
          goto LABEL_30;
        }
      }
      if ([v7 phase])
      {
        [(UIPress *)v12 _loadStateFromPressInfo:v7];
        char v14 = [v6 allPresses];
        int v15 = [v14 containsObject:v12];

        if (!v15) {
          goto LABEL_30;
        }
LABEL_28:
        objc_msgSend(v6, "set_lastPreparedPress:", v12);
        BOOL v9 = 1;
LABEL_31:

        goto LABEL_32;
      }
    }
    else
    {
      if ([v7 phase])
      {
        [0 _loadStateFromPressInfo:v7];
        double v12 = 0;
        goto LABEL_30;
      }
      double v12 = objc_alloc_init(UIPress);
      -[UIEventEnvironment _setPress:forType:window:]((uint64_t)self->_eventDispatcher->_mainEnvironment, (uint64_t)v12, [v7 type], v10);
    }
    if (v8 == 3)
    {
      long long v19 = +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:", [v7 contextID]);
      int64_t v20 = [v19 screen];
    }
    else
    {
      [v6 _hidEvent];
      BOOL v21 = BKSHIDEventGetBaseAttributes();
      long long v22 = [v21 environment];
      long long v23 = [MEMORY[0x1E4F4F280] systemEnvironment];
      int v24 = [v22 isEqual:v23];

      int64_t v20 = [v6 _screen];
      if (v24)
      {
        long long v25 = [(UIApplication *)self _windowForSystemAppButtonEventsForScreen:v20];
        if (v25) {
          goto LABEL_26;
        }
      }
    }
    long long v25 = [(UIApplication *)self _keyWindowForScreen:v20];
LABEL_26:
    [(UIPress *)v12 setWindow:v25];
    long long v26 = [v25 _focusResponder];
    long long v27 = [(UIApplication *)self _firstEligibleResponderForPress:v26];

    if (v27)
    {
      [(UIPress *)v12 setResponder:v27];
      [(UIPress *)v12 _loadStateFromPressInfo:v7];
      [v6 _addPress:v12 forDelayedDelivery:0];

      goto LABEL_28;
    }

LABEL_30:
    BOOL v9 = 0;
    goto LABEL_31;
  }
  BOOL v9 = 0;
LABEL_32:

  return v9;
}

- (id)_firstEligibleResponderForPress:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)_cancelPressesWithType:(int64_t)a3 forPressesEvent:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 allPresses];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v14, "type", (void)v15) == a3) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  if ([v8 count]) {
    [(UIApplication *)self _cancelTouchesOrPresses:v8 withEvent:v6];
  }
}

- (void)_finishButtonEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 allPresses];
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
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v9 phase])
        {
          if ([v9 phase] == 3) {
            [v3 _removePress:v9];
          }
        }
        else
        {
          [v9 setPhase:2];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_cancelGestureRecognizers:(id)a3
{
}

- (void)_cancelTouchesIfNeededForViewRemovedFromResponderChain:(id)a3
{
  id v8 = a3;
  id v4 = (id)[v8 _window];
  id v5 = (id)[(id)UIApp _touchesEventForWindow:v4];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = [v5 touchesForView:v8];
    [(UIApplication *)self _cancelTouchesOrPresses:v7 withEvent:v6];
  }
}

void __51__UIApplication__cancelTouchesOrPresses_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) sendEvent:*(void *)(a1 + 40)];
  if (![*(id *)(a1 + 40) type])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = objc_msgSend(*(id *)(a1 + 40), "allTouches", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          if ([*(id *)(*((void *)&v8 + 1) + 8 * i) phase] != 2)
          {
            uint64_t v7 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
            [v7 peekApplicationEvent:*(void *)(a1 + 40)];

            goto LABEL_12;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)_cancelAllEventsOfType:(int64_t)a3 onEventRoutingScene:(id)a4
{
  id v7 = a4;
  id v18 = v7;
  if (!v7)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"UIApplication.m", 11287, @"Invalid parameter not satisfying: %@", @"eventRoutingScene" object file lineNumber description];

    id v7 = 0;
  }
  long long v8 = [v7 _allWindows];
  long long v9 = [v8 firstObject];

  if (v9)
  {
    switch(a3)
    {
      case 0:
        id v10 = (id)[(id)UIApp _touchesEventForWindow:v9];
        uint64_t v11 = [v10 allTouches];
        goto LABEL_10;
      case 3:
        id v13 = (id)[(id)UIApp _pressesEventForWindow:v9];
        goto LABEL_9;
      case 4:
        id v13 = (id)[(id)UIApp _physicalKeyboardEventForWindow:v9];
LABEL_9:
        id v10 = v13;
        uint64_t v11 = [v13 allPresses];
LABEL_10:
        char v14 = (void *)v11;
        if (v10 && v11) {
          [(UIApplication *)self _cancelTouchesOrPresses:v11 withEvent:v10];
        }
        break;
      case 8:
        objc_msgSend((id)objc_msgSend((id)UIApp, "_gameControllerEventForWindow:", v9), "_reset");
        goto LABEL_18;
      case 10:
        objc_msgSend((id)objc_msgSend((id)UIApp, "_scrollEventForWindow:", v9), "_removeGestureRecognizersFromWindows");
        goto LABEL_18;
      case 11:
        objc_msgSend((id)objc_msgSend((id)UIApp, "_hoverEventForWindow:", v9), "_cancelAllGestureRecognizersAndRemoveAllHoverTouches");
        goto LABEL_18;
      case 13:
        -[_UIPencilEvent _cancelAndRemoveAllDescriptorsAndInteractions]((uint64_t)(id)[(id)UIApp _pencilEventForWindow:v9]);
        goto LABEL_18;
      case 16:
        id v15 = (id)[(id)UIApp _dynamicButtonEventForWindow:v9];
        long long v16 = -[UIEvent _allGestureRecognizers](v15);
        [v15 _removeGestureRecognizersSendingCancelledEvent:v16];

        goto LABEL_18;
      default:
        long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIApplication.m", 11352, @"Unsupported eventType: %li", a3);

        goto LABEL_18;
    }
  }
  else
  {
LABEL_18:
    char v14 = 0;
  }
}

- (void)_cancelAllTouches
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(id)UIApp _appAdoptsUISceneLifecycle])
  {
    if (os_variant_has_internal_diagnostics())
    {
      long long v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &_cancelAllTouches___s_category) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)timespec buf = 136315138;
        long long v16 = "-[UIApplication _cancelAllTouches]";
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Calling %s as a multi-scene app may lead to unexpected results", buf, 0xCu);
      }
    }
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 1, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 _allowsEventUIWindowRouting]) {
          [(UIApplication *)self _cancelAllEventsOfType:0 onEventRoutingScene:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_cancelAllInputsOnEventRoutingScene:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 _allowsEventUIWindowRouting])
  {
    [(UIApplication *)self _cancelAllEventsOfType:0 onEventRoutingScene:v4];
    uint64_t v5 = [v4 _allWindows];
    uint64_t v6 = v5;
    if (v5 && [v5 count])
    {
      id v7 = [(UIApplication *)self _mainEventEnvironment];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v8 = v6;
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
            -[UIEventEnvironment _resetTouchMapForWindow:]((uint64_t)v7, *(void **)(*((void *)&v13 + 1) + 8 * v12++));
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
    -[UIApplication _cancelAllEventsOfType:onEventRoutingScene:](self, "_cancelAllEventsOfType:onEventRoutingScene:", 3, v4, (void)v13);
    [(UIApplication *)self _cancelAllEventsOfType:4 onEventRoutingScene:v4];
    [(UIApplication *)self _cancelAllEventsOfType:8 onEventRoutingScene:v4];
    [(UIApplication *)self _cancelAllEventsOfType:11 onEventRoutingScene:v4];
    [(UIApplication *)self _cancelAllEventsOfType:10 onEventRoutingScene:v4];
    [(UIApplication *)self _cancelAllEventsOfType:16 onEventRoutingScene:v4];
  }
}

- (void)_cancelAllInputs
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 1, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 _allowsEventUIWindowRouting]) {
          [(UIApplication *)self _cancelAllInputsOnEventRoutingScene:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_cancelUnfinishedTouchesForEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = objc_msgSend(v4, "allTouches", 0);
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
        long long v11 = *(_WORD **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 phase] <= 3)
        {
          uint64_t v12 = [v11 phase];
          if (v11) {
            BOOL v13 = v12 == 3;
          }
          else {
            BOOL v13 = 0;
          }
          if (!v13 || (v11[118] & 8) == 0) {
            [v5 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(UIApplication *)self _cancelTouchesOrPresses:v5 withEvent:v4];
}

- (void)_cancelUnfinishedPressesForEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = objc_msgSend(v4, "allPresses", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v11 phase] <= 3
          && ([v11 phase] != 3 || (objc_msgSend(v11, "sentPressesEnded") & 1) == 0))
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(UIApplication *)self _cancelTouchesOrPresses:v5 withEvent:v4];
  if ([v4 _isPhysicalKeyEvent]) {
    [(UIRepeatedAction *)self->_keyRepeatAction invalidate];
  }
}

- (void)_cancelUnfinishedPhysicalKeyboardPressesForUIWindowEventRoutingScene:(id)a3
{
  id v4 = [a3 _windows];
  id v6 = [v4 firstObject];

  id v5 = [(UIApplication *)self _physicalKeyboardEventForWindow:v6];
  if (v5) {
    [(UIApplication *)self _cancelUnfinishedPressesForEvent:v5];
  }
}

- (void)_cancelUnfinishedPhysicalKeyboardPresses
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 1, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 _allowsEventUIWindowRouting]) {
          [(UIApplication *)self _cancelUnfinishedPhysicalKeyboardPressesForUIWindowEventRoutingScene:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_registerBSActionHandler:(id)a3
{
  id v4 = a3;
  applicationBSActionHandlers = self->_applicationBSActionHandlers;
  id v8 = v4;
  if (!applicationBSActionHandlers)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_applicationBSActionHandlers;
    self->_applicationBSActionHandlers = v6;

    id v4 = v8;
    applicationBSActionHandlers = self->_applicationBSActionHandlers;
  }
  [(NSMutableArray *)applicationBSActionHandlers addObject:v4];
}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_2;
  v2[3] = &unk_1E52ED900;
  uint64_t v5 = a2;
  long long v3 = *(_OWORD *)(a1 + 32);
  id v4 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) canSendResponse];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_3;
    v6[3] = &unk_1E52D9CD0;
    uint64_t v5 = *(void **)(a1 + 40);
    void v6[4] = *(void *)(a1 + 32);
    void v6[5] = v4;
    return [v5 _updateStateRestorationArchiveForBackgroundEvent:v6 saveState:1 exitIfCouldNotRestoreState:1 updateSnapshot:v4 != 10 windowScene:v3];
  }
  return result;
}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_3(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4FB33F0] responseWithResult:*(void *)(a1 + 40)];
  [v1 sendResponse:v2];
}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_4(uint64_t a1)
{
  [(id)UIApp applicationState];
  [*(id *)(*(void *)(a1 + 32) + 24) methodForSelector:sel_application_didReceiveRemoteNotification_fetchCompletionHandler_];
  entr_act_modify();
  if (objc_opt_respondsToSelector())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_5;
    block[3] = &unk_1E52DCB30;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 32);
    id v7 = v2;
    uint64_t v8 = v3;
    id v9 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else if ([*(id *)(a1 + 40) canSendResponse])
  {
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = [MEMORY[0x1E4FB33F0] responseWithResult:1];
    [v4 sendResponse:v5];
  }
}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_5(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canSendResponse])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_6;
    v3[3] = &unk_1E52D9F70;
    id v2 = *(void **)(a1 + 40);
    id v4 = *(id *)(a1 + 32);
    [v2 _updateStateRestorationArchiveForBackgroundEvent:v3 saveState:1 exitIfCouldNotRestoreState:1 updateSnapshot:1 windowScene:*(void *)(a1 + 48)];
  }
}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_6(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4FB33F0] responseWithResult:0];
  [v1 sendResponse:v2];
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSnapshotAndStateRestorationWithAction:*(void *)(a1 + 40) windowScene:*(void *)(a1 + 48)];
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSnapshotAndStateRestorationWithAction:*(void *)(a1 + 40) windowScene:*(void *)(a1 + 48)];
}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_9(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_10;
  v2[3] = &unk_1E52DD450;
  long long v3 = *(_OWORD *)(a1 + 32);
  id v4 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_10(void *a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_11;
  v4[3] = &unk_1E52D9F98;
  id v2 = (void *)a1[4];
  long long v3 = (void *)a1[6];
  void v4[4] = a1[5];
  id v5 = v3;
  [v2 _updateStateRestorationArchiveForBackgroundEvent:v4 saveState:1 exitIfCouldNotRestoreState:1 updateSnapshot:1 windowScene:a1[7]];
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_11(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canSendResponse])
  {
    id v2 = *(void **)(a1 + 32);
    long long v3 = [MEMORY[0x1E4F4F678] response];
    [v2 sendResponse:v3];
  }
  id v4 = (void *)MEMORY[0x1E4F18DC0];
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 _releaseProcessAssertionForSessionIdentifier:v5];
}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_12(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) canSendResponse])
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = +[UIWillPresentNotificationActionResponse responseWithOptions:a2];
    [v4 sendResponse:v5];
  }
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSnapshotAndStateRestorationWithAction:*(void *)(a1 + 40) windowScene:*(void *)(a1 + 48)];
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSnapshotAndStateRestorationWithAction:*(void *)(a1 + 40) windowScene:*(void *)(a1 + 48)];
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSnapshotAndStateRestorationWithAction:*(void *)(a1 + 40) windowScene:*(void *)(a1 + 48)];
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSnapshotAndStateRestorationWithAction:*(void *)(a1 + 40) windowScene:*(void *)(a1 + 48)];
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_19(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSnapshotAndStateRestorationWithAction:*(void *)(a1 + 40) windowScene:*(void *)(a1 + 48)];
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_20(uint64_t a1)
{
  return [*(id *)(a1 + 32) bannerTapped];
}

void __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_21(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_22;
  block[3] = &unk_1E52D9F70;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_22(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismiss];
}

uint64_t __91__UIApplication__handleNonLaunchSpecificActions_forScene_withTransitionContext_completion___block_invoke_23(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 persistentIdentifier];
  uint64_t v6 = [*(id *)(a1 + 32) persistentIdentifier];
  uint64_t v7 = [v5 isEqualToString:v6];

  *a3 = v7;
  return v7;
}

- (void)_updateStateRestorationArchiveForBackgroundEvent:(id)a3 saveState:(BOOL)a4 exitIfCouldNotRestoreState:(BOOL)a5 updateSnapshot:(BOOL)a6 windowScene:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v12 = (void (**)(void))a3;
  id v13 = a7;
  if (([v13 _isActive] & 1) != 0 || -[UIApplication _isActivating](self, "_isActivating"))
  {
    if (v12) {
      v12[2](v12);
    }
  }
  else
  {
    if (v10 && v9 && (*((unsigned char *)&self->_applicationFlags + 12) & 1) != 0)
    {
      __tp.tv_sec = 0;
      __tp.tv_nsec = 0;
      clock_gettime(_CLOCK_MONOTONIC_RAW_APPROX, &__tp);
      __darwin_time_t v14 = __tp.tv_sec - self->_couldNotRestoreStateWhenLockedTime;
      long long v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("ApplicationStateRestoration", &qword_1EB25B7B0) + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)timespec buf = 134349056;
        __darwin_time_t v33 = v14;
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Application could not restore state when launched in background while locked (%{public}ld seconds ago). Skipping snapshot/state save when asked to update snapshot in background, and terminating app.", buf, 0xCu);
      }
      if (v14 >= 30)
      {
        long long v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("ApplicationStateRestoration", &qword_1EB25B7B8) + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)timespec buf = 134349056;
          __darwin_time_t v33 = v14;
          _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Exiting after being unable to access state restoration files - but it's been %{public}ld seconds since we tried to access them!", buf, 0xCu);
        }
        if (os_variant_has_internal_diagnostics())
        {
          id v17 = objc_alloc_init((Class)getSDRDiagnosticReporterClass());
          uint64_t v18 = [MEMORY[0x1E4F28B50] mainBundle];
          uint64_t v19 = [v18 bundleIdentifier];
          uint64_t v20 = [v17 signatureWithDomain:@"UIKit" type:@"Crash" subType:@"LongTimeBeforeLockedStateRestorationExit" detectedProcess:v19 triggerThresholdValues:0];

          dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __130__UIApplication__updateStateRestorationArchiveForBackgroundEvent_saveState_exitIfCouldNotRestoreState_updateSnapshot_windowScene___block_invoke;
          v29[3] = &unk_1E52DFCE0;
          dispatch_semaphore_t v30 = v21;
          long long v22 = v21;
          [v17 snapshotWithSignature:v20 duration:0 events:0 payload:0 actions:v29 reply:0.0];
          dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
        }
      }
      [(UIApplication *)self terminateWithSuccess];
    }
    if (([v13 _sceneSessionRoleIsCarPlayOrNonInteractiveExternal] & 1) == 0)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __130__UIApplication__updateStateRestorationArchiveForBackgroundEvent_saveState_exitIfCouldNotRestoreState_updateSnapshot_windowScene___block_invoke_2;
      v23[3] = &unk_1E52F2148;
      id v24 = v13;
      long long v25 = self;
      BOOL v27 = a6;
      BOOL v28 = v10;
      long long v26 = v12;
      [(UIApplication *)self _performBlockAfterCATransactionCommitSynchronizes:v23];
    }
  }
}

intptr_t __130__UIApplication__updateStateRestorationArchiveForBackgroundEvent_saveState_exitIfCouldNotRestoreState_updateSnapshot_windowScene___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __130__UIApplication__updateStateRestorationArchiveForBackgroundEvent_saveState_exitIfCouldNotRestoreState_updateSnapshot_windowScene___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) activationState] == 2)
  {
    [*(id *)(a1 + 32) _setIsRespondingToLifecycleEvent:1];
    char v2 = [*(id *)(a1 + 32) _isSuspendedEventsOnly];
    if ((v2 & 1) == 0) {
      [*(id *)(a1 + 32) _prepareForResume];
    }
    +[UIScreen _prepareScreensForAppResume];
    char v3 = [*(id *)(a1 + 40) _updateDefaultImage];
    if (*(unsigned char *)(a1 + 56) && (v3 & 1) == 0) {
      [*(id *)(a1 + 40) _saveSnapshotWithName:@"UIApplicationAutomaticSnapshotDefault"];
    }
    if (*(unsigned char *)(a1 + 57)) {
      [*(id *)(a1 + 40) _saveApplicationPreservationStateIfSupported];
    }
    if ((v2 & 1) == 0) {
      [*(id *)(a1 + 32) _prepareForSuspend];
    }
    [*(id *)(a1 + 32) _setIsRespondingToLifecycleEvent:0];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)_updateSnapshotAndStateRestorationWithAction:(id)a3 windowScene:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__UIApplication__updateSnapshotAndStateRestorationWithAction_windowScene___block_invoke;
  v8[3] = &unk_1E52D9F70;
  id v9 = v6;
  id v7 = v6;
  [(UIApplication *)self _updateStateRestorationArchiveForBackgroundEvent:v8 saveState:1 exitIfCouldNotRestoreState:1 updateSnapshot:1 windowScene:a4];
}

uint64_t __74__UIApplication__updateSnapshotAndStateRestorationWithAction_windowScene___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) canSendResponse];
  if (result)
  {
    char v3 = *(void **)(a1 + 32);
    return [v3 sendResponse:0];
  }
  return result;
}

- (void)_updateSnapshotForBackgroundApplication:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [(UIApplication *)self _mainScene];
  if (v5)
  {
    id v6 = +[UIScene _sceneForFBSScene:v5];
    [(UIApplication *)self _updateStateRestorationArchiveForBackgroundEvent:0 saveState:v3 exitIfCouldNotRestoreState:0 updateSnapshot:1 windowScene:v6];
  }
  else
  {
    id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &_updateSnapshotForBackgroundApplication____s_category)+ 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[UIApplication _updateSnapshotForBackgroundApplication:]";
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "%s called but main scene is nil, so skipping snapshot", (uint8_t *)&v8, 0xCu);
    }
  }
}

void __48__UIApplication__findBestActivityToMakeCurrent___block_invoke(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) _activityContinuationSuitableToBecomeCurrent];
  if (v1)
  {
    id v2 = v1;
    [v1 becomeCurrent];
    int v1 = v2;
  }
}

- (void)_removeResponder:(id)a3 forUserActivity:(id)a4
{
}

- (void)_addDocument:(id)a3 forUserActivity:(id)a4
{
}

- (void)_removeDocument:(id)a3 forUserActivity:(id)a4
{
}

- (id)_localizedApplicationName
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v3 = [MEMORY[0x1E4F223B8] bundleProxyForCurrentProcess];
  id v4 = [v3 localizedName];

  if (!v4)
  {
    id v5 = [v2 localizedInfoDictionary];
    uint64_t v6 = *MEMORY[0x1E4F1CC48];
    id v4 = [v5 objectForKey:*MEMORY[0x1E4F1CC48]];

    if (!v4)
    {
      id v7 = [v2 infoDictionary];
      id v4 = [v7 objectForKey:v6];

      if (!v4)
      {
        int v8 = [v2 localizedInfoDictionary];
        uint64_t v9 = *MEMORY[0x1E4F1D008];
        id v4 = [v8 objectForKey:*MEMORY[0x1E4F1D008]];

        if (!v4)
        {
          uint64_t v10 = [v2 infoDictionary];
          id v4 = [v10 objectForKey:v9];
        }
      }
    }
  }

  return v4;
}

- (void)_applicationShouldRequestHealthAuthorization
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(UIApplicationDelegate *)delegate applicationShouldRequestHealthAuthorization:self];
  }
}

- (void)_handleApplicationShortcutAction:(id)a3 onWindowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 uiShortcutItem];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __64__UIApplication__handleApplicationShortcutAction_onWindowScene___block_invoke;
    v10[3] = &unk_1E52DAF68;
    id v11 = v7;
    long long v12 = self;
    id v13 = v6;
    [(UIApplicationDelegate *)delegate application:self performActionForShortcutItem:v8 completionHandler:v10];
  }
}

void __64__UIApplication__handleApplicationShortcutAction_onWindowScene___block_invoke(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    id v2 = (void *)a1[5];
    uint64_t v3 = a1[6];
    objc_msgSend(v2, "_updateSnapshotAndStateRestorationWithAction:windowScene:", v3);
  }
  else
  {
    id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Application", &__kitLocation_block_invoke_5___s_category) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      id v6 = "-[UIApplication _handleApplicationShortcutAction:onWindowScene:]_block_invoke";
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "%s called but canvas is nil, so skipping snapshot", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_handleDaemonApplicationActivationWithScene:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = +[_UISceneLifecycleMultiplexer sharedInstance];
  char v9 = [v8 activatedOnce];

  *(void *)&self->_applicationFlags |= 0x200000000uLL;
  __IsRunningTests = 0;
  if (v9)
  {
    uint64_t v10 = (void *)qword_1EB25B518;
    qword_1EB25B518 = @"resume";

    __wasResumed = 1;
    getpid();
    int v11 = memorystatus_control();
    long long v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("AppLifecycle", &qword_1EB25B7D0) + 8);
    if (os_signpost_enabled(v12))
    {
      v16[0] = 67240192;
      v16[1] = v11;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AppResume", " enableTelemetry=YES WasFrozen=%{signpost.telemetry:number1,public,name=WasFrozen}i", (uint8_t *)v16, 8u);
    }
  }
  else
  {
    id v13 = [v6 settings];
    if ([v13 isForeground]) {
      __darwin_time_t v14 = @"launch";
    }
    else {
      __darwin_time_t v14 = @"launch suspended";
    }
    objc_storeStrong((id *)&qword_1EB25B518, v14);

    __wasResumed = 0;
  }
  _requestHardwareEventsIfNeeded();
  long long v15 = [(UIApplication *)self _firstCommitBlock];
  v15[2]();
  [(UIApplication *)self _runWithDaemonScene:v6 completion:v7];

  byte_1EB25B4E1 = 1;
  entr_act_end();
}

- (void)_updateOrientation
{
  int64_t v3 = +[UIDevice currentDeviceOrientationAllowingAmbiguous:1];
  id v4 = +[UIDevice currentDevice];
  uint64_t v5 = [v4 orientation];

  if (v3 != v5)
  {
    id v6 = +[UIDevice currentDevice];
    objc_msgSend(v6, "setOrientation:animated:", v3, -[UIApplication isSuspended](self, "isSuspended") ^ 1);
  }
}

- (void)_handleScreenshot
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"UIApplicationUserDidTakeScreenshotNotification" object:UIApp userInfo:0];
}

- (void)_enqueueHIDEvent:(__IOHIDEvent *)a3
{
}

- (void)_resendHoverEventForWindow:(id)a3
{
  int v4 = [a3 _contextId];
  if (v4)
  {
    int v5 = v4;
    eventFetcher = self->_eventFetcher;
    -[UIEventFetcher _resendHoverEventForContextID:]((uint64_t)eventFetcher, v5);
  }
}

- (void)_setHIDGameControllerEventObserver:(id)a3 onQueue:(id)a4
{
  id v6 = (OS_dispatch_queue *)a4;
  id v11 = a3;
  id v7 = _Block_copy(v11);
  id HIDGameControllerEventObserver = self->_HIDGameControllerEventObserver;
  self->_id HIDGameControllerEventObserver = v7;

  HIDGameControllerEventQueue = self->_HIDGameControllerEventQueue;
  self->_HIDGameControllerEventQueue = v6;
  uint64_t v10 = v6;

  -[UIEventFetcher _setHIDGameControllerEventObserver:onQueue:]((uint64_t)self->_eventFetcher, v11, v10);
}

- (void)_removeHIDGameControllerEventObserver
{
  id HIDGameControllerEventObserver = self->_HIDGameControllerEventObserver;
  self->_id HIDGameControllerEventObserver = 0;

  HIDGameControllerEventQueue = self->_HIDGameControllerEventQueue;
  self->_HIDGameControllerEventQueue = 0;

  eventFetcher = self->_eventFetcher;
  -[UIEventFetcher _removeHIDGameControllerEventObserver]((uint64_t)eventFetcher);
}

- (void)_setHIDEventObserver:(id)a3 onQueue:(id)a4
{
}

- (void)_removeHIDEventObserver
{
}

- (__CFRunLoop)_eventFetchRunLoop
{
  eventFetcher = self->_eventFetcher;
  if (eventFetcher) {
    return eventFetcher->_cfRunLoop;
  }
  else {
    return 0;
  }
}

- (void)_sendEventToGameControllerObserver:(__IOHIDEvent *)a3
{
  if (self->_HIDGameControllerEventObserver)
  {
    if (self->_HIDGameControllerEventQueue)
    {
      CFRetain(a3);
      HIDGameControllerEventQueue = self->_HIDGameControllerEventQueue;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      void v6[2] = __52__UIApplication__sendEventToGameControllerObserver___block_invoke;
      v6[3] = &unk_1E52D9CD0;
      void v6[4] = self;
      void v6[5] = a3;
      dispatch_async(HIDGameControllerEventQueue, v6);
    }
  }
}

void __52__UIApplication__sendEventToGameControllerObserver___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 368) + 16))();
  id v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

- (void)_handleHIDEvent:(__IOHIDEvent *)a3
{
  int Type = IOHIDEventGetType();
  if (Type == 32)
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    char v9 = [(UIApplication *)self _forceStageObservable];
    id v11 = v9;
    if (IntegerValue > 9) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = a3;
    }
    [v9 receiveObservedValue:v10];
  }
  else if (Type == 10 && self && IOHIDEventGetIntegerValue() == 1)
  {
    uint64_t v6 = IOHIDEventGetIntegerValue();
    if ((unint64_t)(v6 - 101) >= 6) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v6 - 100;
    }
    -[UIApplication _deviceOrientationDidChange:](self, v7);
  }
}

- (BOOL)_handlePhysicalButtonEvent:(id)a3
{
  return 1;
}

void __45__UIApplication__internalHandlePressesEvent___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v0, sel__handlePhysicalButtonEvent_);
  id v2 = (objc_class *)objc_opt_class();
  if (MethodImplementation != class_getMethodImplementation(v2, sel__handlePhysicalButtonEvent_)
    && ([(id)UIApp isFrontBoard] & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      int v4 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)timespec buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF UIKIT: Invalid use of FrontBoard specific SPI. Please remove.", buf, 2u);
      }
    }
    else
    {
      int64_t v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &__kitLocation_block_invoke_6___s_category) + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v5 = 0;
        _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Invalid use of FrontBoard specific SPI. Please remove.", v5, 2u);
      }
    }
  }
}

- (BOOL)_handleHIDEventBypassingUIEvent:(const __IOHIDEvent *)a3
{
  return 0;
}

uint64_t __57__UIApplication__internalHandleHIDEventBypassingUIEvent___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v0, sel__handleHIDEventBypassingUIEvent_);
  id v2 = (objc_class *)objc_opt_class();
  if (MethodImplementation == class_getMethodImplementation(v2, sel__handleHIDEventBypassingUIEvent_)) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = [(id)UIApp isFrontBoard];
  }
  byte_1EB25B4FF = result;
  return result;
}

- (BOOL)handleEvent:(__GSEvent *)a3
{
  return [(UIApplication *)self handleEvent:a3 withNewEvent:0];
}

- (void)_deviceOrientationDidChange:(unsigned char *)a1
{
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__UIApplication__deviceOrientationDidChange___block_invoke;
    v5[3] = &unk_1E52D9CD0;
    void v5[4] = a1;
    void v5[5] = a2;
    int64_t v3 = _Block_copy(v5);
    int v4 = v3;
    if (a1[180]) {
      objc_msgSend(a1, "__setQueuedOrientationChange:", v3);
    }
    else {
      (*((void (**)(void *))v3 + 2))(v3);
    }
  }
}

void __45__UIApplication__deviceOrientationDidChange___block_invoke(uint64_t a1)
{
  id v2 = +[UIDevice currentDevice];
  objc_msgSend(v2, "setOrientation:animated:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "isSuspended") ^ 1);
}

- (void)_handleDeviceOrientationChangedEvent:(__GSEvent *)a3
{
  uint64_t v4 = GSEventDeviceOrientation();
  -[UIApplication _deviceOrientationDidChange:](self, v4);
}

- (id)_motionKeyWindow
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(UIApplication *)self keyWindow];
  if (!v2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    int64_t v3 = +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1, 0);
    id v2 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v2)
    {
      uint64_t v4 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v2; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v10 != v4) {
            objc_enumerationMutation(v3);
          }
          uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if ([v6 _needsShakesWhenInactive])
          {
            uint64_t v7 = [v6 firstResponder];

            if (v7)
            {
              id v2 = v6;
              goto LABEL_13;
            }
          }
        }
        id v2 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v2) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v2;
}

uint64_t __46__UIApplication__responderBasedEventDeliverer__block_invoke()
{
  uint64_t result = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_ForceResponderChainIntegrity, @"ForceResponderChainIntegrity", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
  byte_1EB25B500 = (qword_1EB257808 > 0) & ~(_BYTE)result;
  return result;
}

- (void)_handleUnicodeEvent:(__IOHIDEvent *)a3
{
  IOHIDEventGetFloatValue();
  double v5 = v4;
  CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
  if (Children
    && (CFArrayRef v7 = Children, CFArrayGetCount(Children) >= 1)
    && (ValueAtIndedouble x = CFArrayGetValueAtIndex(v7, 0), IOHIDEventGetFloatValue(), v9 > v5))
  {
    [(UIApplication *)self _handleUnicodeEvent:ValueAtIndex];
  }
  else
  {
    unint64_t v10 = IOHIDEventGetIntegerValue() - 1;
    if (v10 > 3) {
      uint64_t v11 = 4;
    }
    else {
      uint64_t v11 = qword_186B9BAF8[v10];
    }
    unsigned int IntegerValue = IOHIDEventGetIntegerValue();
    id v15 = (id)[[NSString alloc] initWithBytes:IOHIDEventGetDataValue() length:IntegerValue encoding:v11];
    id v13 = +[UIPhysicalKeyboardEvent _eventWithInput:v15 inputFlags:128];
    uint64_t v14 = +[UIKeyboardImpl sharedInstance];
    [v14 handleKeyEvent:v13];
  }
}

- (__GSKeyboard)GSKeyboardForHWLayout:(id)a3 forceRebuild:(BOOL)a4
{
  return [(UIApplication *)self GSKeyboardForHWLayout:a3 forceRebuild:a4 createIfNeeded:1];
}

- (__GSKeyboard)GSKeyboardForHWLayout:(id)a3 forceRebuild:(BOOL)a4 createIfNeeded:(BOOL)a5
{
  return [(UIApplication *)self GSKeyboardForHWLayout:a3 senderID:_lastUsedKeyboardSenderID forceRebuild:a4 createIfNeeded:a5];
}

- (id)getKeyboardDevicePropertiesForSenderID:(unint64_t)a3 shouldUpdate:(BOOL)a4
{
  return [(UIApplication *)self getKeyboardDevicePropertiesForSenderID:a3 shouldUpdate:a4 usingSyntheticEvent:0];
}

- (id)getKeyboardDevicePropertiesForSenderID:(unint64_t)a3 shouldUpdate:(BOOL)a4 usingSyntheticEvent:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!qword_1EB25B7F8)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    double v9 = (void *)qword_1EB25B7F8;
    qword_1EB25B7F8 = v8;
  }
  if (!qword_1EB25B800)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v11 = (void *)qword_1EB25B800;
    qword_1EB25B800 = v10;
  }
  long long v12 = [NSNumber numberWithUnsignedLongLong:a3];
  if ([(id)qword_1EB25B800 containsObject:v12]) {
    goto LABEL_6;
  }
  if (v6)
  {
    uint64_t v14 = BKSHIDKeyboardGetDeviceProperties();
    if (v14)
    {
LABEL_9:
      [(id)qword_1EB25B7F8 setObject:v14 forKeyedSubscript:v12];

      goto LABEL_10;
    }
    long long v16 = _UIHardwareKeyboardLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315394;
      uint64_t v19 = "-[UIApplication getKeyboardDevicePropertiesForSenderID:shouldUpdate:usingSyntheticEvent:]";
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      _os_log_error_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "%s, failed to fetch device property for senderID (%llu) use primary keyboard info instead.", (uint8_t *)&v18, 0x16u);
    }

    if (!a5)
    {
      uint64_t v14 = BKSHIDKeyboardGetDeviceProperties();
      if (v14) {
        goto LABEL_9;
      }
      uint64_t v17 = _UIHardwareKeyboardLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136315138;
        uint64_t v19 = "-[UIApplication getKeyboardDevicePropertiesForSenderID:shouldUpdate:usingSyntheticEvent:]";
        _os_log_error_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "%s, failed to fetch primary keyboard info.", (uint8_t *)&v18, 0xCu);
      }
    }
    [(id)qword_1EB25B800 addObject:v12];
LABEL_6:
    id v13 = 0;
    goto LABEL_11;
  }
LABEL_10:
  id v13 = [(id)qword_1EB25B7F8 objectForKeyedSubscript:v12];
LABEL_11:

  return v13;
}

- (__GSKeyboard)GSKeyboardForHWLayout:(id)a3 senderID:(unint64_t)a4 forceRebuild:(BOOL)a5 createIfNeeded:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = v10;
  if (GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded___keyboard) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = !v6;
  }
  if (!v12)
  {
    if (GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded___keyboard)
    {
      if (!v10 && a5) {
        goto LABEL_8;
      }
    }
    else if (!v10)
    {
LABEL_8:
      id v13 = +[UIKeyboardInputModeController sharedInputModeController];
      uint64_t v14 = [v13 hardwareInputMode];
      uint64_t v15 = [v14 automaticHardwareLayout];

      uint64_t v11 = (void *)v15;
    }
    long long v16 = [NSNumber numberWithUnsignedLongLong:a4];
    uint64_t v17 = [(UIApplication *)self getKeyboardDevicePropertiesForSenderID:a4 shouldUpdate:0];
    int v18 = v17;
    if (v17)
    {
      if (v11)
      {
        uint64_t v19 = [v17 layout];
        int v20 = [v11 isEqualToString:v19] ^ 1;
      }
      else
      {
        LOBYTE(v20) = 0;
      }
      a5 |= v20;
      uint64_t v22 = _lastUsedKeyboardSenderID;
      if (!a5 && _lastUsedKeyboardSenderID == a4)
      {
        a5 = 0;
        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v22 = _lastUsedKeyboardSenderID;
    }
    if (v22 != a4) {
      _lastUsedKeyboardSenderID = a4;
    }
    if (v18)
    {
      long long v23 = v18;
    }
    else
    {
      long long v23 = [(UIApplication *)self getKeyboardDevicePropertiesForSenderID:a4 shouldUpdate:1];
      if (!v23)
      {
LABEL_32:
        unint64_t v21 = (__GSKeyboard *)GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded___keyboard;
        if (!a5 && GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded___keyboard)
        {
LABEL_52:

          goto LABEL_53;
        }
        if (!GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded___keyboard)
        {
          int v24 = -1;
          if (!v11) {
            goto LABEL_48;
          }
          goto LABEL_49;
        }
        long long v23 = v18;
        goto LABEL_36;
      }
    }
    if (![v23 standardType]
      || [v23 standardType] == 1
      || [v23 standardType] == 2)
    {
      int v24 = [v23 standardType];
    }
    else
    {
      int v24 = 2 * ([v23 countryCode] == 15);
    }
    if (!GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded___keyboard)
    {
LABEL_47:
      int v18 = v23;
      if (!v11)
      {
LABEL_48:
        long long v26 = +[UIKeyboardInputModeController sharedInputModeController];
        BOOL v27 = [v26 hardwareInputMode];
        uint64_t v11 = [v27 automaticHardwareLayout];
      }
LABEL_49:
      GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded___keyboard = GSKeyboardCreate();
      BOOL v28 = _UIHardwareKeyboardLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 136315650;
        __darwin_time_t v33 = "-[UIApplication GSKeyboardForHWLayout:senderID:forceRebuild:createIfNeeded:]";
        __int16 v34 = 2112;
        long long v35 = v11;
        __int16 v36 = 1024;
        int v37 = v24;
        _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_DEFAULT, "%s, New hardware layout is created with %@ layout and %d standardType.", (uint8_t *)&v32, 0x1Cu);
      }

      long long v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v29 postNotificationName:@"UITextInputCurrentKeyboardLayoutDidChangeNotification" object:0 userInfo:0];

      BKSHIDKeyboardSetLayout();
      id v30 = [(UIApplication *)self getKeyboardDevicePropertiesForSenderID:a4 shouldUpdate:1];
      unint64_t v21 = (__GSKeyboard *)GSKeyboardForHWLayout_senderID_forceRebuild_createIfNeeded___keyboard;
      goto LABEL_52;
    }
    if (v24 != -1)
    {
LABEL_46:
      GSKeyboardRelease();
      goto LABEL_47;
    }
LABEL_36:
    HWKeyboardint Type = GSKeyboardGetHWKeyboardType();
    switch(HWKeyboardType)
    {
      case 202:
        int v24 = 0;
        break;
      case 207:
        int v24 = 2;
        break;
      case 203:
        int v24 = 1;
        break;
      default:
        int v24 = -1;
        break;
    }
    goto LABEL_46;
  }
  unint64_t v21 = 0;
LABEL_53:

  return v21;
}

- (void)_hardwareKeyboardAvailabilityChanged:(id)a3
{
  double v4 = +[UIDevice currentDevice];
  int v5 = [v4 _isHardwareKeyboardAvailable];

  if (v5)
  {
    [(UIApplication *)self _updateSerializableKeyCommandsForResponder:0];
  }
}

- (__GSKeyboard)_hardwareKeyboard
{
  return [(UIApplication *)self _hardwareKeyboard:1];
}

- (__GSKeyboard)_hardwareKeyboard:(BOOL)a3
{
  return [(UIApplication *)self GSKeyboardForHWLayout:0 forceRebuild:0 createIfNeeded:a3];
}

- (__GSKeyboard)_hardwareKeyboardForPhysicalKeyboardEvent:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 _hidEvent])
  {
    [v6 _hidEvent];
    uint64_t SenderID = IOHIDEventGetSenderID();
  }
  else
  {
    uint64_t SenderID = 0;
  }
  uint64_t v8 = [(UIApplication *)self GSKeyboardForHWLayout:0 senderID:SenderID forceRebuild:0 createIfNeeded:v4];

  return v8;
}

- (void)_resetGSKeyboardModifierStateIfNecessary:(__IOHIDEvent *)a3
{
  if (!IOHIDEventGetIntegerValue())
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    uint64_t v4 = IOHIDEventGetIntegerValue();
    int IsGlobeKeyUsagePair = GSKeyboardIsGlobeKeyUsagePair();
    if (IsGlobeKeyUsagePair) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = IntegerValue == 7;
    }
    int v8 = v6 && (v4 & 0xFFFFFFFFFFFFFFF8) == 224;
    if (IsGlobeKeyUsagePair || v8)
    {
      if ([(id)UIApp GSKeyboardForHWLayout:0 senderID:IOHIDEventGetSenderID() forceRebuild:0 createIfNeeded:0])
      {
        GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
      }
    }
  }
}

- (id)_responderForKeyEvents
{
  int64_t v3 = +[UIWindow _applicationKeyWindow];
  uint64_t v4 = [v3 _responderForKeyEvents];
  int v5 = v4;
  if (!v4) {
    uint64_t v4 = self;
  }
  id v6 = v4;

  return v6;
}

- (id)_keyDownDictionary
{
  hardwareKeyDownCodeToEventMap = self->_hardwareKeyDownCodeToEventMap;
  if (!hardwareKeyDownCodeToEventMap)
  {
    uint64_t v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v5 = self->_hardwareKeyDownCodeToEventMap;
    self->_hardwareKeyDownCodeToEventMap = v4;

    hardwareKeyDownCodeToEventMap = self->_hardwareKeyDownCodeToEventMap;
  }
  return hardwareKeyDownCodeToEventMap;
}

- (id)_pressInfoForPhysicalKeyboardEvent:(id)a3
{
  id v4 = a3;
  int v5 = [v4 _isKeyDown];
  id v6 = objc_alloc_init(UIPressInfo);
  -[UIPressInfo setType:](v6, "setType:", [v4 _keyCode] + 2000);
  int v7 = [v4 _isKeyDown];
  double v8 = 0.0;
  if (v7) {
    double v8 = 1.0;
  }
  [(UIPressInfo *)v6 setForce:v8];
  if ([v4 _isKeyDown]) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 3;
  }
  [(UIPressInfo *)v6 setPhase:v9];
  [v4 timestamp];
  -[UIPressInfo setTimestamp:](v6, "setTimestamp:");
  [(UIPressInfo *)v6 setSource:1];
  [v4 _hidEvent];
  id v10 = BKSHIDEventGetBaseAttributes();
  -[UIPressInfo setContextID:](v6, "setContextID:", [v10 contextID]);

  if (v5)
  {
    uint64_t v11 = [[UIKey alloc] initWithKeyboardEvent:v4];
    BOOL v12 = [(UIApplication *)self _keyDownDictionary];
    id v13 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v4, "_keyCode"));
    [v12 setObject:v11 forKey:v13];
  }
  else
  {
    uint64_t v14 = [(UIApplication *)self _keyDownDictionary];
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v4, "_keyCode"));
    uint64_t v11 = [v14 objectForKey:v15];

    if (!v11) {
      goto LABEL_11;
    }
    BOOL v12 = [(UIApplication *)self _keyDownDictionary];
    id v13 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v4, "_keyCode"));
    [v12 removeObjectForKey:v13];
  }

LABEL_11:
  [(UIPressInfo *)v6 setKey:v11];

  return v6;
}

- (void)handleKeyHIDEvent:(__IOHIDEvent *)a3
{
}

- (void)_handleKeyHIDEvent:(__IOHIDEvent *)a3 usingSyntheticEvent:(BOOL)a4
{
  BOOL v4 = a4;
  CFRetain(a3);
  id v28 = [(UIApplication *)self _responderForKeyEvents];
  if (v4)
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    uint64_t v8 = IOHIDEventGetIntegerValue();
    int IsGlobeKeyUsagePair = GSKeyboardIsGlobeKeyUsagePair();
    BOOL v10 = !IsGlobeKeyUsagePair && IntegerValue == 7;
    BOOL v11 = v10 && (v8 & 0xFFFFFFFFFFFFFFF8) == 224;
    BOOL v12 = v11;
    if (IsGlobeKeyUsagePair || v12) {
      goto LABEL_23;
    }
  }
  id v13 = -[UIEventEnvironment _physicalKeyboardEventForHIDEvent:]((id *)&self->_eventDispatcher->_mainEnvironment->super.isa, (uint64_t)a3);
  uint64_t SenderID = IOHIDEventGetSenderID();
  if ((IOHIDEventGetEventFlags() & 0x40) != 0)
  {
    uint64_t v15 = [(UIApplication *)self getKeyboardDevicePropertiesForSenderID:SenderID shouldUpdate:1 usingSyntheticEvent:1];

    if (!v15)
    {
      uint64_t SenderID = _lastUsedKeyboardSenderID;
      IOHIDEventSetSenderID();
    }
  }
  objc_msgSend(v13, "_setHIDEvent:keyboard:", a3, -[UIApplication GSKeyboardForHWLayout:senderID:forceRebuild:createIfNeeded:](self, "GSKeyboardForHWLayout:senderID:forceRebuild:createIfNeeded:", 0, SenderID, 0, 1));
  long long v16 = +[UIKeyShortcutHUDService sharedHUDService];
  [v16 handleKeyboardEvent:v13];

  if ([v13 _isKeyDown])
  {
    int v17 = [v13 _isDeleteKey];
    int v18 = +[UIKeyboardImpl activeInstance];
    uint64_t v19 = v18;
    if (v17) {
      uint64_t v20 = 7;
    }
    else {
      uint64_t v20 = 1;
    }
    [v18 updateIdleDetection:v20];
  }
  if ([v13 _isGlobeKey]
    && (+[UIKeyboardImpl sharedInstance],
        unint64_t v21 = objc_claimAutoreleasedReturnValue(),
        int v22 = [v21 handleKeyCommand:v13 repeatOkay:0 beforePublicKeyCommands:1],
        v21,
        v22))
  {
LABEL_23:
    CFRelease(a3);
  }
  else
  {
    int v23 = [v13 _isKeyDown];
    physicalKeycodeSet = self->_physicalKeycodeSet;
    if (v23) {
      -[_UIKeyboardHIDEventOrderedDescriptorSet addEvent:](physicalKeycodeSet, (uint64_t)a3);
    }
    else {
      -[_UIKeyboardHIDEventOrderedDescriptorSet removeEvent:](physicalKeycodeSet, (uint64_t)a3);
    }
    CFRelease(a3);
    long long v25 = [v28 _keyCommandForEvent:v13];
    long long v26 = v25;
    if (v25 && [v25 _buttonType] != -1)
    {
      BOOL v27 = [(UIApplication *)self _pressInfoForPhysicalKeyboardEvent:v13];
      objc_msgSend(v27, "setType:", objc_msgSend(v26, "_buttonType"));
      [(id)UIApp _prepareButtonEvent:v13 withPressInfo:v27];
      [(UIApplication *)self sendEvent:v13];
      [(UIApplication *)self _finishButtonEvent:v13];
    }
    [(UIApplication *)self handleKeyUIEvent:v13];
  }
}

- (void)_handleKeyUIEvent:(id)a3
{
  id v8 = a3;
  int v4 = [v8 _isPhysicalKeyEvent];
  int v5 = v8;
  if (v4)
  {
    id v6 = v8;
    if ([v6 source] == 4)
    {
      int v7 = [(UIApplication *)self _pressInfoForPhysicalKeyboardEvent:v6];
      [(id)UIApp _prepareButtonEvent:v6 withPressInfo:v7];
      [(UIRepeatedAction *)self->_keyRepeatAction invalidate];
      [(UIApplication *)self sendEvent:v6];
      [(UIApplication *)self _finishButtonEvent:v6];
    }
    else
    {
      [(UIApplication *)self _handleKeyboardPressEvent:v6];
    }

    int v5 = v8;
  }
}

- (void)handleKeyUIEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(UIApplication *)self _responderForKeyEvents];
  [v5 _handleKeyUIEvent:v4];
}

- (id)_keyCommandForKeyboardEvent:(id)a3
{
  int64_t v3 = [(UIApplication *)self _keyCommandInvocationForKeyboardEvent:a3];
  id v4 = [v3 keyCommand];

  return v4;
}

- (BOOL)_hasKeyCommandForKeyboardEvent:(id)a3
{
  int64_t v3 = [(UIApplication *)self _keyCommandForKeyboardEvent:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_handleKeyCommandForKeyboardEvent:(id)a3 allowsRepeat:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(UIApplication *)self _keyCommandInvocationForKeyboardEvent:a3];
  if (v6) {
    BOOL v7 = [(UIApplication *)self _performKeyCommandInvocation:v6 allowsRepeat:v4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_keyCommandInvocationForKeyboardEvent:(id)a3
{
  id v4 = a3;
  if ([v4 _isKeyDown])
  {
    id v5 = [(UIApplication *)self _responderForKeyEvents];
    id v12 = 0;
    id v6 = [v5 _keyCommandForEvent:v4 target:&v12];
    id v7 = v12;

    if (v6)
    {
LABEL_3:
      id v8 = [[_UIKeyCommandInvocation alloc] initWithKeyCommand:v6 triggeringEvent:v4 target:v7];
      goto LABEL_6;
    }
  }
  else
  {
    keyUpKeyCommandMap = self->_keyUpKeyCommandMap;
    BOOL v10 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v4, "_keyCode"));
    id v6 = [(NSMutableDictionary *)keyUpKeyCommandMap objectForKey:v10];

    id v7 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  id v8 = 0;
LABEL_6:

  return v8;
}

- (BOOL)_performKeyCommandInvocation:(id)a3 allowsRepeat:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    int v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"UIApplication.m" lineNumber:13540 description:@"Attempted to perform a key command invocation with a nil invocation"];
  }
  id v8 = [v7 keyCommand];
  uint64_t v9 = [v7 target];
  BOOL v10 = [v7 triggeringEvent];
  if (![v10 _hidEvent]) {
    goto LABEL_8;
  }
  if (![v10 _isKeyDown])
  {
    [(UIRepeatedAction *)self->_keyRepeatAction invalidate];
    keyUpKeyCommandMap = self->_keyUpKeyCommandMap;
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v10, "_keyCode"));
    [(NSMutableDictionary *)keyUpKeyCommandMap removeObjectForKey:v14];

    BOOL v12 = -[UIApplication sendAction:toTarget:fromSender:forEvent:](self, "sendAction:toTarget:fromSender:forEvent:", [v8 upAction], v9, v8, v10);
    goto LABEL_18;
  }
  if (v9)
  {
    [(UIApplication *)self setupRepeatActionWithinvocationDelay:0 reset:0 andRepeat:-1.0];
    if (v4) {
      uint64_t v11 = [v8 repeatable] ^ 1;
    }
    else {
      uint64_t v11 = 1;
    }
    [(UIRepeatedAction *)self->_keyRepeatAction setDisableRepeat:v11];
    -[UIRepeatedAction scheduleWithTarget:selector:object:](self->_keyRepeatAction, "scheduleWithTarget:selector:object:", v9, [v8 action], v8);
    if ([v8 upAction])
    {
      uint64_t v15 = self->_keyUpKeyCommandMap;
      long long v16 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v10, "_keyCode"));
      [(NSMutableDictionary *)v15 setObject:v8 forKey:v16];
    }
    int v17 = TIStatisticGetKey();
    TIStatisticScalarIncrement();

    [v10 _hidEvent];
    uint64_t SenderID = IOHIDEventGetSenderID();
    if (SenderID)
    {
      uint64_t v19 = [(UIApplication *)self getKeyboardDevicePropertiesForSenderID:SenderID shouldUpdate:0];
      if (v19)
      {
        +[UIKBAnalyticsDispatcher keyboardShortcutInvokedWithKeyCommand:v8 keyEvent:v10 keyboardProperties:v19];
        uint64_t v20 = +[UIEventSessionActionAnalytics sharedInstance];
        [v20 didKeyCommand:v8];
      }
    }
    BOOL v12 = 1;
  }
  else
  {
LABEL_8:
    BOOL v12 = 0;
  }
LABEL_18:

  return v12;
}

- (id)repeatedAction:(id)a3 willInvokeWithObject:(id)a4 forPhase:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5 >= 2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = v8;
    objc_msgSend(v9, "set_inputFlags:", objc_msgSend(v9, "_inputFlags") | 1);
  }
  else
  {
    id v10 = v8;
  }

  return v8;
}

- (BOOL)shouldInvokeRepeatedAction:(id)a3 forPhase:(unint64_t)a4
{
  if (self->_keyRepeatAction != a3) {
    return 1;
  }
  int v5 = +[_UIEventDeferringManager isAnySceneBufferingEvents]();
  if (v5)
  {
    id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("KeyRepeat", &shouldInvokeRepeatedAction_forPhase____s_category) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "Allowing repeated key action to fire: NO reason: a scene is buffering events", v7, 2u);
    }
  }
  return v5 ^ 1;
}

- (void)setupRepeatActionWithinvocationDelay:(double)a3 reset:(BOOL)a4 andRepeat:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if (self->_keyRepeatAction)
  {
    if (!a4) {
      goto LABEL_3;
    }
LABEL_11:
    [(UIRepeatedAction *)self->_keyRepeatAction reset];
    if (!v5) {
      return;
    }
    goto LABEL_4;
  }
  uint64_t v15 = [[UIRepeatedAction alloc] initWithInvocation:0];
  keyRepeatAction = self->_keyRepeatAction;
  self->_keyRepeatAction = v15;

  [(UIRepeatedAction *)self->_keyRepeatAction setDelegate:self];
  if (v6) {
    goto LABEL_11;
  }
LABEL_3:
  if (!v5) {
    return;
  }
LABEL_4:
  _AXSKeyRepeatDelay();
  double v10 = v9;
  _AXSKeyRepeatInterval();
  double v12 = v11;
  if (a3 == -1.0) {
    double v13 = v10;
  }
  else {
    double v13 = a3;
  }
  [(UIRepeatedAction *)self->_keyRepeatAction setInvocationDelay:v13];
  uint64_t v14 = self->_keyRepeatAction;
  [(UIRepeatedAction *)v14 setRepeatedDelay:v12];
}

- (void)_handleKeyboardPressEvent:(id)a3
{
  id v4 = a3;
  if ([v4 _isPhysicalKeyEvent])
  {
    BOOL v5 = [(UIApplication *)self _responderForKeyEvents];
    id v6 = v4;
    uint64_t v7 = [v6 _hidEvent];
    uint64_t v8 = v7;
    if (v6 && v7)
    {
      if ([v6 _isEjectKey])
      {
        if ([v6 _isKeyDown])
        {
          double v9 = +[UIKeyboardImpl sharedInstance];
          [v9 ejectKeyDown];
        }
        goto LABEL_93;
      }
    }
    else if (!v7)
    {
      uint64_t v15 = 0;
      double v10 = -1.0;
      goto LABEL_17;
    }
    double v10 = -1.0;
    if ([v6 _isKeyDown]
      && _AXSKeyRepeatEnabled()
      && ((objc_opt_respondsToSelector() & 1) == 0
       || ([v6 _modifiedInput],
           double v11 = objc_claimAutoreleasedReturnValue(),
           int v12 = [v5 _shouldRepeatInsertText:v11],
           v11,
           v12)))
    {
      if (objc_opt_respondsToSelector())
      {
        double v13 = [v6 _modifiedInput];
        [v5 _delayUntilRepeatInsertText:v13];
        double v10 = v14;
      }
      uint64_t v15 = 1;
    }
    else
    {
      uint64_t v15 = 0;
    }
LABEL_17:
    [(UIApplication *)self setupRepeatActionWithinvocationDelay:1 reset:v15 andRepeat:v10];
    char v87 = 0;
    if ([v6 _shouldAttemptSecurePasteAuthentication])
    {
      long long v16 = [v6 _authenticationMessage];
      +[UIPasteboard _attemptAuthenticationWithMessage:v16];
    }
    if (v8)
    {
      if ([v6 _isKeyDown])
      {
        int v17 = +[UIKeyboardImpl sharedInstance];
        int v18 = [v17 handleKeyCommand:v6 repeatOkay:&v87 beforePublicKeyCommands:1];

        if (v18)
        {
          if ((v15 & (v87 == 0)) != 0) {
            LODWORD(v15) = 0;
          }
          [(UIRepeatedAction *)self->_keyRepeatAction setDisableRepeat:v15 == 0];
          [(UIRepeatedAction *)self->_keyRepeatAction setSkipInitialFire:1];
          keyRepeatAction = self->_keyRepeatAction;
          uint64_t v20 = +[UIKeyboardImpl sharedInstance];
          [(UIRepeatedAction *)keyRepeatAction scheduleWithTarget:v20 selector:sel_handleKeyEvent_ object:v6];

          unint64_t v21 = +[UIEventSessionActionAnalytics sharedInstance];
          [v21 didKeyCommand:0];
        }
        if (([v6 _isModifierKey] & 1) == 0)
        {
          int v22 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
          objc_msgSend(v22, "updateEventSource:options:", objc_msgSend(v6, "source"), 15);
        }
        uint64_t v15 = v15 != 0;
        if (v18) {
          goto LABEL_93;
        }
      }
      else
      {
        [(UIRepeatedAction *)self->_keyRepeatAction invalidate];
      }
    }
    if ([v6 type] != 4)
    {
      int v41 = 0;
      goto LABEL_77;
    }
    int v23 = [v6 _dispatchWindows];
    int v24 = [v23 anyObject];

    BOOL v84 = v24;
    long long v25 = [v24 windowScene];
    long long v26 = [v25 _focusSystemSceneComponent];

    char v83 = v26;
    id v85 = [v26 _eventDelivery];
    int v27 = [v85 shouldDeliverFocusKeyboardEvent:v6 toResponder:v5];
    id v28 = +[UIKeyboardImpl sharedInstance];
    int v78 = [v28 isCurrentEditResponderInEditingMode];

    long long v29 = [(UIApplication *)self _keyCommandInvocationForKeyboardEvent:v6];
    if (![v6 _isKeyDown])
    {
LABEL_46:
      if ([v6 _isKeyDown])
      {
        [v29 keyCommand];
        v43 = long long v42 = v29;
        int v41 = [v43 repeatable];

        long long v29 = v42;
        if (v42) {
          goto LABEL_48;
        }
      }
      else
      {
        int v41 = 0;
        if (v29)
        {
LABEL_48:
          uint64_t v76 = v5;
          int v81 = v41;
          long long v44 = +[UIKeyboardImpl sharedInstance];
          if ([v44 delegateRequiresKeyEvents])
          {
            [v29 keyCommand];
            int v45 = v27;
            v47 = long long v46 = v29;
            char v48 = [v47 _handleAfterKeyEvent];

            long long v29 = v46;
            int v27 = v45;

            if (v48)
            {
              BOOL v49 = 0;
LABEL_55:
              int v41 = v81;
              BOOL v5 = v76;
              goto LABEL_56;
            }
          }
          else
          {
          }
          BOOL v49 = [(UIApplication *)self _performKeyCommandInvocation:v29 allowsRepeat:v15];
          goto LABEL_55;
        }
      }
      BOOL v49 = 0;
LABEL_56:
      if (!v49 && ((v27 ^ 1) & 1) == 0)
      {
        long long v50 = v29;
        [v85 willDeliverFocusKeyboardEvent:v6];
        char v86 = 0;
        int64_t v51 = [(UIApplication *)self _pressTypeForKeyboardEvent:v6 isTextual:&v86];
        if (v51 == -1 || (v86 ? (char v52 = v78) : (char v52 = 0), (v52 & 1) != 0))
        {
          BOOL v49 = 0;
        }
        else
        {
          uint64_t v53 = v51;
          int v82 = v41;
          char v54 = v78 ^ 1;
          if (v51 != 4) {
            char v54 = 1;
          }
          if ((v54 & 1) == 0)
          {
            uint64_t v55 = +[UIKeyboard activeKeyboard];
            if ([v5 _disableAutomaticKeyboardUI]
              && ![v5 _enableAutomaticKeyboardPressDone])
            {
              uint64_t v53 = 4;
            }
            else
            {
              uint64_t v56 = [v55 _focusSystem];
              uint64_t v57 = [v56 _focusedView];
              int v79 = v55;
              int v58 = [v57 isDescendantOfView:v55];

              BOOL v59 = v58 == 0;
              uint64_t v55 = v79;
              if (v59) {
                uint64_t v53 = 4;
              }
              else {
                uint64_t v53 = 202;
              }
            }
          }
          [v6 _hidEvent];
          uint64_t v60 = _UIEventHIDUIWindowForHIDEvent();
          objc_msgSend(-[UIApplication _pressesEventForWindow:](self, "_pressesEventForWindow:", v60), "_setHIDEvent:", objc_msgSend(v6, "_hidEvent"));
          unsigned int v77 = [v6 _isKeyDown];
          [v6 timestamp];
          id v62 = +[UIPressInfo _keyboardPressInfoForType:isKeyDown:timestamp:contextID:modifierFlags:](UIPressInfo, "_keyboardPressInfoForType:isKeyDown:timestamp:contextID:modifierFlags:", v53, v77, [v60 _contextId], objc_msgSend(v6, "_modifierFlags"), v61);
          [(UIApplication *)self _sendButtonEventWithPressInfo:v62];

          BOOL v49 = 1;
          int v41 = v82;
        }
        long long v29 = v50;
      }

      if (v49) {
        goto LABEL_93;
      }
LABEL_77:
      if (!v8 || ![v6 _isKeyDown])
      {
        double v65 = +[UIKeyboardImpl sharedInstance];
        [v65 handleKeyEvent:v6];

        [(UIRepeatedAction *)self->_keyRepeatAction invalidate];
        double v66 = +[UIKeyboardImpl sharedInstance];
        int v67 = [v66 delegateRequiresKeyEvents];

        if (!v67)
        {
LABEL_93:

          goto LABEL_94;
        }
        double v68 = [(UIApplication *)self _keyCommandInvocationForKeyboardEvent:v6];
        double v69 = [v68 keyCommand];
        int v70 = [v69 _handleAfterKeyEvent];

        if (v70) {
          [(UIApplication *)self _performKeyCommandInvocation:v68 allowsRepeat:0];
        }
LABEL_92:

        goto LABEL_93;
      }
      int v63 = v15 ^ 1;
      if (v87) {
        int v63 = 1;
      }
      if (((v63 | v41) & 1) == 0)
      {
        double v64 = +[UIKeyboardImpl sharedInstance];
        if ([v64 _isKeyCommand:v6])
        {

LABEL_90:
          double v74 = +[UIKeyboardImpl sharedInstance];
          LODWORD(v15) = [v74 shouldAllowRepeatEvent:v6];

          goto LABEL_91;
        }
        BOOL v71 = [(UIApplication *)self _hasKeyCommandForKeyboardEvent:v6];

        if (v71) {
          goto LABEL_90;
        }
        double v72 = +[UIKeyboardImpl sharedInstance];
        char v73 = [v72 delegateRequiresKeyEvents];

        if ((v73 & 1) == 0) {
          goto LABEL_90;
        }
        LODWORD(v15) = [v6 _isModifierKey] ^ 1;
      }
LABEL_91:
      [(UIRepeatedAction *)self->_keyRepeatAction setDisableRepeat:v15 ^ 1];
      uint64_t v75 = self->_keyRepeatAction;
      double v68 = +[UIKeyboardImpl sharedInstance];
      [(UIRepeatedAction *)v75 scheduleWithTarget:v68 selector:sel_handleKeyEvent_ object:v6];
      goto LABEL_92;
    }
    if (v27)
    {
      id v30 = [v29 keyCommand];
      int v31 = [v85 shouldSkipKeyCommand:v30 whenDeliveringFocusKeyboardEvent:v6 toResponder:v5];

      if (v31)
      {

        long long v29 = 0;
      }
    }
    int v32 = +[UIKeyboardImpl sharedInstance];
    __darwin_time_t v33 = [v32 delegateAsResponder];

    if (v29)
    {
      __int16 v34 = [v29 keyCommand];
      if (([v34 wantsPriorityOverSystemBehavior] & 1) == 0 && ((v78 ^ 1) & 1) == 0)
      {
        int v80 = v27;
        long long v35 = v29;
        int v36 = [v33 conformsToProtocol:&unk_1ED42EEC0];

        if (!v36) {
          goto LABEL_44;
        }
        int v37 = +[UIKeyboardImpl sharedInstance];
        char v38 = [v37 _handlesKeyCommandForEvent:v6];

        if ((v38 & 1) == 0)
        {
          long long v39 = [v35 keyCommand];
          int v40 = [v39 _isLikelyToConflictWithTextInputForResponder:v33];

          if (!v40)
          {
LABEL_44:
            long long v29 = v35;
            int v27 = v80;
            goto LABEL_45;
          }
        }
        __int16 v34 = v35;
        long long v29 = 0;
        int v27 = v80;
      }
    }
LABEL_45:

    goto LABEL_46;
  }
LABEL_94:
}

void __71__UIApplication__immediatelyUpdateSerializableKeyCommandsForResponder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 _layoutAwareKeyCodes];
  uint64_t v5 = [v4 count];

  id v6 = (void *)MEMORY[0x1E4F4F2E0];
  if (v5)
  {
    uint64_t v7 = [v3 _layoutAwareKeyCodes];
    objc_msgSend(v6, "keyCommandWithKeyCode:modifierFlags:", objc_msgSend(v7, "firstIndex"), objc_msgSend(v3, "_layoutAwareModifierFlags"));
  }
  else
  {
    uint64_t v7 = [v3 _layoutAwareInput];
    objc_msgSend(v6, "keyCommandWithInput:modifierFlags:", v7, objc_msgSend(v3, "_layoutAwareModifierFlags"));
  }
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [v3 _eventDeferringEnvironment];

  double v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  double v10 = v9;
  if (v9)
  {
    [v9 addObject:v12];
  }
  else
  {
    double v11 = [MEMORY[0x1E4F1CA80] setWithObject:v12];
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v8];
  }
}

- (id)_keyCommands
{
  uint64_t v2 = [(UIApplication *)self keyCommands];
  id v3 = (void *)v2;
  id v4 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2) {
    id v4 = (void *)v2;
  }
  id v5 = v4;

  id v6 = +[_UIMainMenuSystem _sharedSystem];
  uint64_t v7 = [v6 _keyCommands];

  if ([v7 count])
  {
    uint64_t v8 = [v5 arrayByAddingObjectsFromArray:v7];

    id v5 = (id)v8;
  }

  return v5;
}

- (id)keyCommands
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__UIApplication_keyCommands__block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = self;
  if (qword_1EB25B810 != -1) {
    dispatch_once(&qword_1EB25B810, block);
  }
  return (id)qword_1EB25B808;
}

void __28__UIApplication_keyCommands__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFrontBoard] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    int v1 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputEscape" modifierFlags:0 action:sel__unlockPointerLockState_];
    uint64_t v2 = (void *)[v1 copy];

    [v2 _setEnumerationPriority:-2];
    objc_msgSend(v2, "setAttributes:", objc_msgSend(v2, "attributes") | 4);
    [v5 addObject:v2];
    uint64_t v3 = [v5 copy];
    id v4 = (void *)qword_1EB25B808;
    qword_1EB25B808 = v3;
  }
}

- (void)startDictation:(id)a3
{
  uint64_t v3 = +[UIDictationController sharedInstance];
  [v3 setReasonType:23];

  id v4 = +[UIDictationController sharedInstance];
  [v4 handleHardwareKeyboardGesture];
}

- (void)orderFrontCharacterPalette:(id)a3
{
  id v3 = +[UIKeyboardImpl sharedInstance];
  [v3 handleEmojiPopoverKeyCommand];
}

- (void)showHelp:(id)a3
{
  id v3 = +[UIKeyShortcutHUDService sharedHUDService];
  [v3 requestHUDPresentationIntoSearchMode];
}

- (BOOL)_areKeyboardHUDsEnabled
{
  if ([(UIApplication *)self isFrontBoard]) {
    return (*((unsigned __int8 *)&self->_applicationFlags + 12) >> 6) & 1;
  }
  else {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)_isGlobeKeyShortcutHUDEnabled
{
  if (qword_1EB25B818 != -1) {
    dispatch_once(&qword_1EB25B818, &__block_literal_global_2168);
  }
  BOOL result = [(UIApplication *)self isFrontBoard];
  if (byte_1EB25B501) {
    return 1;
  }
  return result;
}

void __46__UIApplication__isGlobeKeyShortcutHUDEnabled__block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EB25B501 = [v0 isEqualToString:@"com.apple.Spotlight"];
}

- (void)handleKeyEvent:(__GSEvent *)a3
{
  id v4 = [(UIApplication *)self _responderForKeyEvents];
  [v4 _handleKeyEvent:a3];
}

- (void)_handleGameControllerEvent:(id)a3
{
}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v4 = a3;
  if ([v4 subtype] >= 200 && objc_msgSend(v4, "subtype") <= 205)
  {
    if ([v4 subtype] == 200)
    {
      uint64_t v5 = [(id)UIApp userInterfaceLayoutDirection];
      BOOL v6 = v5 == 0;
      if (v5) {
        uint64_t v7 = 2;
      }
      else {
        uint64_t v7 = 1;
      }
      uint64_t v8 = 32;
      uint64_t v9 = 16;
    }
    else
    {
      if ([v4 subtype] != 201)
      {
        if ([v4 subtype] == 202)
        {
          uint64_t v7 = 1;
          uint64_t v11 = 1;
        }
        else if ([v4 subtype] == 204)
        {
          uint64_t v11 = 4;
          uint64_t v7 = 3;
        }
        else if ([v4 subtype] == 203)
        {
          uint64_t v7 = 2;
          uint64_t v11 = 2;
        }
        else
        {
          BOOL v12 = [v4 subtype] == 205;
          uint64_t v7 = 4 * v12;
          uint64_t v11 = 8 * v12;
        }
        goto LABEL_17;
      }
      uint64_t v10 = [(id)UIApp userInterfaceLayoutDirection];
      BOOL v6 = v10 == 0;
      if (v10) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = 2;
      }
      uint64_t v8 = 16;
      uint64_t v9 = 32;
    }
    if (v6) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = v8;
    }
LABEL_17:
    [(UIApplication *)self _sendMoveEventWithDirection:v7 heading:v11 fromEvent:v4];
    goto LABEL_18;
  }
  v13.receiver = self;
  v13.super_class = (Class)UIApplication;
  [(UIResponder *)&v13 _wheelChangedWithEvent:v4];
LABEL_18:
}

- (void)_sendMoveEventWithDirection:(int64_t)a3 heading:(unint64_t)a4 fromEvent:(id)a5
{
  id v8 = a5;
  [v8 _hidEvent];
  uint64_t v9 = _UIEventHIDUIWindowForHIDEvent();
  id v10 = [(UIApplication *)self _moveEventForWindow:v9];

  objc_msgSend(v10, "_setHIDEvent:", objc_msgSend(v8, "_hidEvent"));
  uint64_t v11 = [v8 _gsEvent];

  [v10 _setGSEvent:v11];
  [v10 _setMoveDirection:a3];
  [v10 _setFocusHeading:a4];
  [(UIApplication *)self sendEvent:v10];
}

- (void)_sendMoveEventWithPressesEvent:(id)a3
{
  id v6 = a3;
  id v4 = [v6 _lastPreparedPress];
  unint64_t v5 = [v4 type];

  if (v5 <= 3) {
    [(UIApplication *)self _sendMoveEventWithDirection:v5 + 1 heading:qword_186B9BB28[v5] fromEvent:v6];
  }
}

- (int64_t)_pressTypeForKeyboardEvent:(id)a3 isTextual:(BOOL *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 _keyCode];
  BOOL v7 = 0;
  int64_t v8 = -1;
  int v9 = 1;
  if (!(!v11 & v10))
  {
    switch(v6)
    {
      case 'O':
        int v9 = 0;
        BOOL v7 = 0;
        int64_t v8 = 3;
        if (!a4) {
          goto LABEL_21;
        }
        goto LABEL_20;
      case 'P':
        int v9 = 0;
        BOOL v7 = 0;
        int64_t v8 = 2;
        if (!a4) {
          goto LABEL_21;
        }
        goto LABEL_20;
      case 'Q':
        int v9 = 0;
        BOOL v7 = 0;
        int64_t v8 = 1;
        goto LABEL_19;
      case 'R':
        int v9 = 0;
        int64_t v8 = 0;
        BOOL v7 = 0;
        if (!a4) {
          goto LABEL_21;
        }
        goto LABEL_20;
      case 'S':
      case 'T':
      case 'U':
      case 'V':
      case 'W':
        goto LABEL_19;
      case 'X':
        goto LABEL_10;
      default:
        JUMPOUT(0);
    }
  }
  switch(v6)
  {
    case '(':
      goto LABEL_10;
    case ')':
      int v9 = 0;
      BOOL v7 = 0;
      int64_t v8 = 5;
      if (!a4) {
        goto LABEL_21;
      }
      goto LABEL_20;
    case '*':
      goto LABEL_19;
    case '+':
      int v9 = 0;
      BOOL v7 = 0;
      int64_t v8 = 203;
      if (!a4) {
        goto LABEL_21;
      }
      goto LABEL_20;
    case ',':
      int v9 = 0;
      BOOL v7 = 1;
      int64_t v8 = 6;
      if (!a4) {
        goto LABEL_21;
      }
      goto LABEL_20;
    default:
      if (v6 == 158)
      {
LABEL_10:
        int v9 = 0;
        BOOL v7 = 0;
        int64_t v8 = 4;
        if (!a4) {
          goto LABEL_21;
        }
      }
      else
      {
LABEL_19:
        if (!a4) {
          goto LABEL_21;
        }
      }
LABEL_20:
      *a4 = v7;
LABEL_21:
      if (v9)
      {
        if ([v5 _isKeyDown]) {
          uint64_t v12 = 0;
        }
        else {
          uint64_t v12 = 3;
        }
        objc_super v13 = [v5 _pressesForPhase:v12];
        double v14 = [v13 anyObject];

        uint64_t v15 = [v14 key];
        long long v16 = [v15 characters];
        int v17 = [v16 isEqualToString:@"UIKeyInputEscape"];

        if (v17) {
          int64_t v8 = 5;
        }
        else {
          int64_t v8 = -1;
        }
      }
      return v8;
  }
}

uint64_t __50__UIApplication__setIdleModeVisualEffectsEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIdleModeVisualEffectsEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)_isIdleModeVisualEffectsEnabled
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 8) >> 2) & 1;
}

- (void)_setSystemUserInterfaceStyle:(int64_t)a3
{
  if (a3)
  {
    if (self->_systemUserInterfaceStyle != a3)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      void v4[2] = __46__UIApplication__setSystemUserInterfaceStyle___block_invoke;
      v4[3] = &unk_1E52D9CD0;
      void v4[4] = self;
      void v4[5] = a3;
      [(UIApplication *)self _updateEffectiveUserInterfaceStyleAfterChange:v4];
      BOOL v3 = +[UIScene _scenesIncludingInternal:1];
      [v3 enumerateObjectsUsingBlock:&__block_literal_global_2172];
    }
  }
}

uint64_t __46__UIApplication__setSystemUserInterfaceStyle___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 128) = *(void *)(result + 40);
  return result;
}

void __46__UIApplication__setSystemUserInterfaceStyle___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 _systemAppearanceManager];
  [v3 updateUserInterfaceStyle];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"UIWindowSceneDidUpdateSystemUserInterfaceStyle" object:v2];
}

- (int64_t)_systemUserInterfaceStyle
{
  return self->_systemUserInterfaceStyle;
}

- (void)_updateEffectiveUserInterfaceStyleAfterChange:(id)a3
{
  id v4 = (void (**)(id))a3;
  if (v4)
  {
    int64_t v8 = v4;
    int64_t v5 = [(UIApplication *)self _pureEffectiveUserInterfaceStyle];
    v8[2](v8);
    BOOL v6 = v5 == [(UIApplication *)self _effectiveUserInterfaceStyle];
    id v4 = v8;
    if (!v6)
    {
      BOOL v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 postNotificationName:@"_UIApplicationEffectiveUserInterfaceStyleChangedNotification" object:self];

      id v4 = v8;
    }
  }
}

- (void)_maybeEffectiveUserInterfaceStyleChanged
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"_UIApplicationEffectiveUserInterfaceStyleChangedNotification" object:UIApp];
}

+ (void)_setDebugUserInterfaceStyleOverride:(int64_t)a3
{
  if (sDebugUserInterfaceStyleOverride != a3)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__UIApplication__setDebugUserInterfaceStyleOverride___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    void aBlock[4] = a3;
    id v4 = _Block_copy(aBlock);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__UIApplication__setDebugUserInterfaceStyleOverride___block_invoke_2;
    block[3] = &unk_1E52DA9A8;
    id v7 = v4;
    int64_t v8 = a3;
    id v5 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __53__UIApplication__setDebugUserInterfaceStyleOverride___block_invoke(uint64_t result)
{
  sDebugUserInterfaceStyleOverride = *(void *)(result + 32);
  return result;
}

uint64_t __53__UIApplication__setDebugUserInterfaceStyleOverride___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (UIApp) {
    return [(id)UIApp _updateEffectiveUserInterfaceStyleAfterChange:v1];
  }
  else {
    return (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
  }
}

- (id)_idleModeController
{
  idleModeController = self->_idleModeController;
  if (!idleModeController)
  {
    id v4 = [_UIIdleModeController alloc];
    id v5 = +[UIScreen mainScreen];
    BOOL v6 = [(_UIIdleModeController *)v4 initWithScreen:v5];
    id v7 = self->_idleModeController;
    self->_idleModeController = v6;

    idleModeController = self->_idleModeController;
  }
  return idleModeController;
}

- (void)_updateIdleModeStatus
{
  BOOL v3 = [(UIApplication *)self _mainScene];
  id v6 = [v3 settings];

  uint64_t v4 = [v6 idleModeEnabled];
  id v5 = [(UIApplication *)self _idleModeController];
  [v5 setIdleModeEnabled:v4];
}

- (BOOL)becomeFirstResponder
{
  id v2 = [(UIApplication *)self keyWindow];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (void)_setDisableBecomeFirstResponder:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (id)_currentHardwareKeyboardLayoutName
{
  if (pthread_main_np() != 1)
  {
    int64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIApplication.m" lineNumber:14497 description:@"Call must be made on main thread"];
  }
  uint64_t v4 = +[UIDevice currentDevice];
  int v5 = [v4 _isHardwareKeyboardAvailable];

  if (v5)
  {
    id v6 = [(UIApplication *)self _hardwareKeyboard:0];
    if (v6) {
      id v6 = (__GSKeyboard *)[(id)GSKeyboardGetLayout() copy];
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (unsigned)_currentHardwareKeyboardType
{
  uint64_t v3 = +[UIDevice currentDevice];
  int v4 = [v3 _isHardwareKeyboardAvailable];

  if (v4
    && [(UIApplication *)self _hardwareKeyboard:0]
    && (unsigned int v5 = GSKeyboardGetHWKeyboardType() - 202, v5 <= 5))
  {
    return dword_186B9BB48[v5];
  }
  else
  {
    return -1;
  }
}

- (void)setHardwareKeyboardLayoutName:(id)a3
{
}

- (void)setHardwareKeyboardLayoutName:(id)a3 forceRebuild:(BOOL)a4
{
  [(UIApplication *)self GSKeyboardForHWLayout:a3 forceRebuild:a4];
  unsigned int v4 = GSKeyboardGetModifierState() & 0x40000;
  unsigned int v5 = +[UIKeyboardImpl activeInstance];
  int v6 = [v5 isCapsLockASCIIToggle];

  BKSHIDServicesSetCapsLockRomanSwitchMode();
  if (!v6)
  {
    int64_t v8 = +[UIKeyboardImpl activeInstance];
    [v8 adjustCapsLockDelayOverride];

    if (BKSHIDServicesIsCapsLockLightOn() == v4 >> 18) {
      return;
    }
    goto LABEL_5;
  }
  id v7 = +[UIKeyboardImpl activeInstance];
  [v7 removeCapsLockDelayOverride];

  if (v4)
  {
LABEL_5:
    GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
    GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
  }
}

- (void)clearHardwareKeyboardState
{
}

- (void)setCapsLockDelayOverride:(double)a3
{
  unsigned int v4 = +[UIKeyboardImpl activeInstance];
  int v5 = [v4 isInHardwareKeyboardMode];

  if (v5)
  {
    v6.n128_f64[0] = a3;
    MEMORY[0x1F410C000](v6);
  }
}

- (NSArray)windows
{
  return (NSArray *)+[UIWindow allWindowsIncludingInternalWindows:0 onlyVisibleWindows:0];
}

- (id)_rootViewControllers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = +[UIWindow allWindowsIncludingInternalWindows:0 onlyVisibleWindows:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        int64_t v8 = [*(id *)(*((void *)&v15 + 1) + 8 * i) rootViewController];
        int v9 = v8;
        if (v8)
        {
          char v10 = [v8 view];
          char v11 = [v10 window];
          char v12 = [v11 _isTextEffectsWindow];

          if ((v12 & 1) == 0) {
            [v2 addObject:v9];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  if ([v2 count]) {
    id v13 = v2;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)_isAutorotationDisabledForAppWindows
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(UIApplication *)self _rootViewControllers];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "_viewControllerForSupportedInterfaceOrientations", (void)v10);
        if ([v7 shouldAutorotate]
          && ([v7 supportedInterfaceOrientations] & 0x1E) != 0)
        {

          BOOL v8 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

+ (BOOL)_isRunningWithFixedMainThreadPriority
{
  return __shouldFixMainThreadPriority;
}

- (void)setExpectsFaceContact:(BOOL)a3
{
}

- (void)setExpectsFaceContact:(BOOL)a3 inLandscape:(BOOL)a4
{
  uint64_t v6 = [(UIApplication *)self _mainScene];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __51__UIApplication_setExpectsFaceContact_inLandscape___block_invoke;
  void v7[3] = &__block_descriptor_34_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  BOOL v8 = a4;
  BOOL v9 = a3;
  [v6 updateUIClientSettingsWithBlock:v7];
}

void __51__UIApplication_setExpectsFaceContact_inLandscape___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 proximityDetectionModes];
  uint64_t v4 = 8;
  if (!*(unsigned char *)(a1 + 32)) {
    uint64_t v4 = 4;
  }
  uint64_t v5 = v4 | v3;
  uint64_t v6 = v3 & ~v4;
  if (*(unsigned char *)(a1 + 33)) {
    uint64_t v6 = v5;
  }
  [v7 setProximityDetectionModes:v6 & 0xFFFFFFFFFFFFFFFELL | ((v6 & 0xC) == 0)];
}

- (void)_setApplicationIsOpaque:(BOOL)a3
{
}

- (void)_setApplicationBackdropStyle:(int64_t)a3
{
  switch(a3)
  {
    case 2010:
      uint64_t v3 = 2;
      break;
    case 2030:
      uint64_t v3 = 4;
      break;
    case 2020:
      uint64_t v3 = 3;
      break;
    default:
      return;
  }
  [(UIApplication *)self _setBackgroundStyle:v3];
}

- (void)willDisplayMiniAlert
{
  id v3 = [(UIApplication *)self _mainScene];
  id v2 = +[UIScene _sceneForFBSScene:v3];
  [v2 _updateUIClientSettingsWithBlock:&__block_literal_global_2178];
}

void __37__UIApplication_willDisplayMiniAlert__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "setVisibleMiniAlertCount:", objc_msgSend(v2, "visibleMiniAlertCount") + 1);
}

- (void)didDismissMiniAlert
{
  id v3 = [(UIApplication *)self _mainScene];
  id v2 = +[UIScene _sceneForFBSScene:v3];
  [v2 _updateUIClientSettingsWithUITransitionBlock:&__block_literal_global_2181];
}

uint64_t __36__UIApplication_didDismissMiniAlert__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 visibleMiniAlertCount]) {
    uint64_t v3 = [v2 visibleMiniAlertCount] - 1;
  }
  else {
    uint64_t v3 = 0;
  }
  [v2 setVisibleMiniAlertCount:v3];

  return 1;
}

- (BOOL)isLocked
{
  return 0;
}

- (BOOL)isPasscodeRequiredToUnlock
{
  id v2 = [MEMORY[0x1E4F62AF8] sharedService];
  char v3 = [v2 isPasscodeLockedOrBlocked];

  return v3;
}

- (void)_requestDeviceUnlockWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UIApplication.m", 14782, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4FB33A8]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __52__UIApplication__requestDeviceUnlockWithCompletion___block_invoke;
  v10[3] = &unk_1E52EDA60;
  id v11 = v6;
  id v12 = v5;
  id v7 = v6;
  id v8 = v5;
  [v7 requestPasscodeUnlockUIWithCompletion:v10];
}

void __52__UIApplication__requestDeviceUnlockWithCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __52__UIApplication__requestDeviceUnlockWithCompletion___block_invoke_2;
  id v7 = &unk_1E52E7D78;
  id v8 = *(id *)(a1 + 40);
  char v9 = a2;
  dispatch_async(MEMORY[0x1E4F14428], &v4);
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v4, v5, v6, v7);
}

uint64_t __52__UIApplication__requestDeviceUnlockWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_isTerminating
{
  return _applicationTerminating;
}

- (void)registerUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
  uint64_t v4 = (void *)MEMORY[0x1E4F44680];
  uint64_t v5 = notificationSettings;
  id v6 = [v4 currentNotificationCenter];
  uint64_t v7 = [(UIUserNotificationSettings *)v5 categories];
  id v8 = objc_msgSend((id)v7, "bs_map:", UIUserNotificationCategoryToUNNotificationCategory);

  [v6 setNotificationCategories:v8];
  LOBYTE(v7) = [(UIUserNotificationSettings *)v5 types];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __50__UIApplication_registerUserNotificationSettings___block_invoke;
  v10[3] = &unk_1E5302D18;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  [v9 requestAuthorizationWithOptions:v7 & 7 completionHandler:v10];
}

void __50__UIApplication_registerUserNotificationSettings___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__UIApplication_registerUserNotificationSettings___block_invoke_2;
  v5[3] = &unk_1E5302CF0;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v3 getNotificationSettingsWithCompletionHandler:v5];
}

uint64_t __50__UIApplication_registerUserNotificationSettings___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = UIRemoteNotificationTypesFromUNNotificationSettings(a2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __50__UIApplication_registerUserNotificationSettings___block_invoke_3;
  v6[3] = &unk_1E5302CC8;
  uint64_t v4 = *(void **)(a1 + 32);
  void v6[4] = *(void *)(a1 + 40);
  void v6[5] = v3;
  return [v4 getNotificationCategoriesWithCompletionHandler:v6];
}

void __50__UIApplication_registerUserNotificationSettings___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "bs_map:", UNNotificationCategoryToUIUserNotificationCategory);
  uint64_t v4 = +[UIUserNotificationSettings settingsForTypes:*(void *)(a1 + 40) categories:v3];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __50__UIApplication_registerUserNotificationSettings___block_invoke_4;
  v6[3] = &unk_1E52D9F98;
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __50__UIApplication_registerUserNotificationSettings___block_invoke_4(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
    return objc_msgSend(v3, "application:didRegisterUserNotificationSettings:");
  }
  return result;
}

- (UIUserNotificationSettings)currentUserNotificationSettings
{
  id v2 = [MEMORY[0x1E4F44680] currentNotificationCenter];
  uint64_t v3 = [v2 notificationSettings];
  uint64_t v4 = [v2 notificationCategories];
  uint64_t v5 = UIRemoteNotificationTypesFromUNNotificationSettings(v3);
  id v6 = objc_msgSend(v4, "bs_map:", UNNotificationCategoryToUIUserNotificationCategory);
  id v7 = +[UIUserNotificationSettings settingsForTypes:v5 categories:v6];

  return (UIUserNotificationSettings *)v7;
}

uint64_t __47__UIApplication_registerForRemoteNotifications__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
    return objc_msgSend(v3, "application:didRegisterForRemoteNotificationsWithDeviceToken:");
  }
  return result;
}

- (BOOL)isRegisteredForRemoteNotifications
{
  id v2 = [MEMORY[0x1E4F39AB8] sharedInstance];
  char v3 = [v2 allowsRemoteNotifications];

  return v3;
}

- (void)unregisterForRemoteNotifications
{
  applicationPushRegistrdouble y = self->_applicationPushRegistry;
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] set];
  [(PKPushRegistry *)applicationPushRegistry setDesiredPushTypes:v4];

  [(PKPushRegistry *)self->_applicationPushRegistry setDelegate:0];
  uint64_t v5 = self->_applicationPushRegistry;
  self->_applicationPushRegistrdouble y = 0;
}

- (UIRemoteNotificationType)enabledRemoteNotificationTypes
{
  if (dyld_program_sdk_at_least())
  {
    NSLog(&cfstr_Enabledremoten.isa);
    return 0;
  }
  else
  {
    char v3 = [MEMORY[0x1E4F44680] currentNotificationCenter];
    uint64_t v4 = [v3 notificationSettings];
    UIRemoteNotificationType v5 = UIRemoteNotificationTypesFromUNNotificationSettings(v4);

    return v5;
  }
}

- (void)registerForRemoteNotificationTypes:(UIRemoteNotificationType)types
{
  if (dyld_program_sdk_at_least())
  {
    NSLog(&cfstr_Registerforrem.isa);
  }
  else
  {
    [(UIApplication *)self _registerForRemoteNotificationTypes:types];
  }
}

- (void)_registerForRemoteNotificationTypes:(unint64_t)a3
{
  unint64_t v4 = a3 & 7;
  UIRemoteNotificationType v5 = [MEMORY[0x1E4F44680] currentNotificationCenter];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __53__UIApplication__registerForRemoteNotificationTypes___block_invoke;
  v6[3] = &unk_1E5302D40;
  void v6[4] = self;
  [v5 requestAuthorizationWithOptions:v4 completionHandler:v6];
}

void __53__UIApplication__registerForRemoteNotificationTypes___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__UIApplication__registerForRemoteNotificationTypes___block_invoke_2;
  block[3] = &unk_1E52D9F70;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __53__UIApplication__registerForRemoteNotificationTypes___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerForRemoteNotifications];
}

- (void)pushRegistry:(id)a3 didReceiveIncomingPushWithPayload:(id)a4 forType:(id)a5 withCompletionHandler:(id)a6
{
  id v8 = a4;
  id v9 = (void (**)(void))a6;
  char v10 = objc_opt_respondsToSelector();
  [(id)UIApp applicationState];
  delegate = self->_delegate;
  if (v10)
  {
    [(UIApplicationDelegate *)delegate methodForSelector:sel_application_didReceiveRemoteNotification_fetchCompletionHandler_];
    entr_act_modify();
    id v12 = self->_delegate;
    long long v13 = [v8 dictionaryPayload];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __94__UIApplication_pushRegistry_didReceiveIncomingPushWithPayload_forType_withCompletionHandler___block_invoke;
    v17[3] = &unk_1E52FDB30;
    long long v18 = v9;
    double v14 = _UIAutologgingBackgroundFetchBlock(@"Warning: Application delegate received call to -application:didReceiveRemoteNotification:fetchCompletionHandler: but the completion handler was never called.", v17);
    [(UIApplicationDelegate *)v12 application:self didReceiveRemoteNotification:v13 fetchCompletionHandler:v14];
  }
  else
  {
    [(UIApplicationDelegate *)delegate methodForSelector:sel_application_didReceiveRemoteNotification_];
    entr_act_modify();
    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = self->_delegate;
      long long v16 = [v8 dictionaryPayload];
      [(UIApplicationDelegate *)v15 application:self didReceiveRemoteNotification:v16];
    }
    if (v9) {
      v9[2](v9);
    }
  }
}

uint64_t __94__UIApplication_pushRegistry_didReceiveIncomingPushWithPayload_forType_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentLocalNotificationNow:(UILocalNotification *)notification
{
  id v4 = (id)[(UILocalNotification *)notification copy];
  [v4 setFireDate:0];
  [v4 setTimeZone:0];
  [v4 setRepeatInterval:0];
  [(UIApplication *)self _scheduleLocalNotification:v4];
}

- (void)scheduleLocalNotification:(UILocalNotification *)notification
{
  id v4 = (id)[(UILocalNotification *)notification copy];
  [(UIApplication *)self _scheduleLocalNotification:v4];
}

- (void)_scheduleLocalNotification:(id)a3
{
  id v10 = a3;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    id v4 = [(UIApplication *)self currentUserNotificationSettings];
    char v5 = [v4 types];

    if ((v5 & 4) == 0)
    {
      id v6 = +[UIUserNotificationSettings settingsForTypes:7 categories:0];
      [(UIApplication *)self registerUserNotificationSettings:v6];
    }
  }
  id v7 = v10;
  if (v10)
  {
    id v8 = (*((void (**)(uint64_t, void *))UILocalNotificationToUNNotificationRequest + 2))((uint64_t)UILocalNotificationToUNNotificationRequest, v10);
    id v9 = [MEMORY[0x1E4F44680] currentNotificationCenter];
    [v9 addNotificationRequest:v8 withCompletionHandler:0];

    id v7 = v10;
  }
}

- (void)cancelLocalNotification:(UILocalNotification *)notification
{
  if (notification)
  {
    char v3 = (*((void (**)(uint64_t, void *))UILocalNotificationToUNNotificationRequest + 2))((uint64_t)UILocalNotificationToUNNotificationRequest, notification);
    if (v3)
    {
      id v6 = v3;
      id v4 = [MEMORY[0x1E4F1C978] arrayWithObject:v3];
      char v5 = [MEMORY[0x1E4F44680] currentNotificationCenter];
      [v5 removeSimilarNotificationRequests:v4];

      char v3 = v6;
    }
  }
}

- (void)cancelAllLocalNotifications
{
  id v2 = [MEMORY[0x1E4F44680] currentNotificationCenter];
  [v2 removeAllPendingNotificationRequests];
}

- (void)setScheduledLocalNotifications:(NSArray *)scheduledLocalNotifications
{
  id v9 = scheduledLocalNotifications;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    id v4 = [(UIApplication *)self currentUserNotificationSettings];
    char v5 = [v4 types];

    if ((v5 & 4) == 0)
    {
      id v6 = +[UIUserNotificationSettings settingsForTypes:7 categories:0];
      [(UIApplication *)self registerUserNotificationSettings:v6];
    }
  }
  id v7 = [(NSArray *)v9 bs_map:UILocalNotificationToUNNotificationRequest];
  id v8 = [MEMORY[0x1E4F44680] currentNotificationCenter];
  [v8 setNotificationRequests:v7];
}

- (NSArray)scheduledLocalNotifications
{
  id v2 = [MEMORY[0x1E4F44680] currentNotificationCenter];
  char v3 = [v2 pendingNotificationRequests];
  id v4 = objc_msgSend(v3, "bs_map:", UNNotificationRequestToUILocalNotification);

  return (NSArray *)v4;
}

- (BOOL)_requiresHighResolution
{
  appInfo = self->_appInfo;
  return !appInfo || [(_UIApplicationInfoParser *)appInfo requiresHighResolution];
}

- (BOOL)_taskSuspendingUnsupported
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 9) >> 6) & 1;
}

- (void)_openURL:(id)a3 originatingView:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__UIApplication__openURL_originatingView_options_completionHandler___block_invoke;
  aBlock[3] = &unk_1E52D9FE8;
  id v14 = v13;
  id v29 = v14;
  uint64_t v15 = (void (**)(void *, void))_Block_copy(aBlock);
  if (qword_1EB25B5B8 != -1) {
    dispatch_once(&qword_1EB25B5B8, &__block_literal_global_1234);
  }
  if (byte_1EB25B4E3)
  {
    long long v16 = [v11 _viewControllerForAncestor];
    long long v17 = [v16 extensionContext];

    if (!v17)
    {
      long long v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Extension", &qword_1EB25B820) + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v27 = 0;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Cannot open URL because an extension context could not be found.", v27, 2u);
      }
      v15[2](v15, 0);
    }
    [v17 openURL:v10 completionHandler:v15];
  }
  else if ([(UIApplication *)self isFrontBoard])
  {
    ((void (**)(void *, BOOL))v15)[2](v15, [(UIApplication *)self _openURL:v10]);
  }
  else
  {
    uint64_t v19 = [v11 window];
    uint64_t v20 = [v19 _windowHostingScene];
    unint64_t v21 = [v20 _currentOpenApplicationEndpoint];

    if (!v21)
    {
      int v22 = +[_UIApplicationConfigurationLoader sharedLoader];
      int v23 = [v22 applicationInitializationContext];
      int v24 = [v23 defaultSceneToken];

      if (v24)
      {
        long long v25 = [v24 stringRepresentation];
        long long v26 = _UISVisibilityEnvironmentForSceneIdentityTokenString();

        unint64_t v21 = [(UIApplication *)self _currentOpenApplicationEndpointForEnvironment:v26];
      }
      else
      {
        unint64_t v21 = 0;
      }
    }
    [(UIApplication *)self _openURL:v10 options:v12 openApplicationEndpoint:v21 completionHandler:v15];
  }
}

uint64_t __68__UIApplication__openURL_originatingView_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_openURL:(id)a3 originatingView:(id)a4 completionHandler:(id)a5
{
}

- (void)_hideNetworkActivityIndicator
{
}

- (void)_beginShowingNetworkActivityIndicator
{
  int64_t networkResourcesCurrentlyLoadingCount = self->_networkResourcesCurrentlyLoadingCount;
  if (!networkResourcesCurrentlyLoadingCount)
  {
    hideNetworkActivityIndicatorTimer = self->_hideNetworkActivityIndicatorTimer;
    if (hideNetworkActivityIndicatorTimer && [(NSTimer *)hideNetworkActivityIndicatorTimer isValid])
    {
      [(NSTimer *)self->_hideNetworkActivityIndicatorTimer invalidate];
      char v5 = self->_hideNetworkActivityIndicatorTimer;
      self->_hideNetworkActivityIndicatorTimer = 0;
    }
    [(id)UIApp setNetworkActivityIndicatorVisible:1];
    int64_t networkResourcesCurrentlyLoadingCount = self->_networkResourcesCurrentlyLoadingCount;
  }
  self->_int64_t networkResourcesCurrentlyLoadingCount = networkResourcesCurrentlyLoadingCount + 1;
}

- (void)_endShowingNetworkActivityIndicator
{
  int64_t v2 = self->_networkResourcesCurrentlyLoadingCount - 1;
  self->_int64_t networkResourcesCurrentlyLoadingCount = v2;
  if (!v2)
  {
    [(NSTimer *)self->_hideNetworkActivityIndicatorTimer invalidate];
    id v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__hideNetworkActivityIndicator selector:0 userInfo:0 repeats:0.1];
    hideNetworkActivityIndicatorTimer = self->_hideNetworkActivityIndicatorTimer;
    self->_hideNetworkActivityIndicatorTimer = v4;
  }
}

- (void)_setIgnoreHeadsetClicks:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)_shouldIgnoreHeadsetClicks
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 9) >> 4) & 1;
}

- (BOOL)shouldFenceStatusBarRotation
{
  return (*((unsigned char *)&self->_applicationFlags + 10) & 1) == 0;
}

- (BOOL)_executableWasLinkedWithUIKit
{
  return (*((unsigned char *)&self->_applicationFlags + 10) & 1) == 0;
}

- (unint64_t)_beginBackgroundTaskWithExpirationHandler:(id)a3
{
  return _UIApplicationBeginBackgroundTaskWithExpirationHandler(a3, 0);
}

- (id)_backgroundModes
{
  int64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 infoDictionary];
  id v4 = [v3 objectForKey:@"UIBackgroundModes"];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C978] array];
  }
  id v6 = v5;

  return v6;
}

- (void)_wakeTimerFired
{
  if (qword_1EB25B828)
  {
    (*(void (**)(void))(qword_1EB25B828 + 16))();
    _setNextWakeDate();
  }
}

- (BOOL)_UIApplicationLegacyVoipAllowed
{
  return UISelfTaskHasEntitlement(@"com.apple.developer.legacyvoip");
}

- (BOOL)setKeepAliveTimeout:(NSTimeInterval)timeout handler:(void *)keepAliveHandler
{
  id v6 = keepAliveHandler;
  if (dyld_program_sdk_at_least()
    && ![(UIApplication *)self _UIApplicationLegacyVoipAllowed])
  {
    NSLog(&cfstr_TheUiapplicati.isa, "-[UIApplication setKeepAliveTimeout:handler:]");
    goto LABEL_14;
  }
  if (timeout < 600.0)
  {
    NSLog(&cfstr_Keepalivetimeo.isa, 0x4082C00000000000);
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
  id v7 = [(UIApplication *)self _backgroundModes];
  if ([v7 containsObject:@"voip"])
  {
  }
  else
  {
    BOOL v8 = [(UIApplication *)self _UIApplicationLegacyVoipAllowed];

    if (!v8)
    {
      NSLog(&cfstr_OnlyVoipAppsCa.isa);
      goto LABEL_14;
    }
  }
  qword_1EB25B830 = *(void *)&timeout;
  id v9 = (void *)qword_1EB25B828;
  if (qword_1EB25B828)
  {
    qword_1EB25B828 = 0;
  }
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v10 = [v6 copy];
  id v11 = (void *)qword_1EB25B828;
  qword_1EB25B828 = v10;

  _setNextWakeDate();
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void)clearKeepAliveTimeout
{
  if (!dyld_program_sdk_at_least()
    || [(UIApplication *)self _UIApplicationLegacyVoipAllowed])
  {
    qword_1EB25B830 = 0;
    uint64_t v3 = (void *)qword_1EB25B828;
    if (qword_1EB25B828)
    {
      qword_1EB25B828 = 0;
    }
    _setNextWakeDate();
  }
}

- (void)_registerForKeyboardPrefChangedNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_appleKeyboardsPreferencesChanged, @"AppleKeyboardsPreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_checkBackgroundRefreshAPIAdoption
{
  int64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v2 infoDictionary];

  uint64_t v3 = [v4 objectForKeyedSubscript:@"UIBackgroundModes"];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v3 containsObject:@"fetch"] & 1) == 0
    && ([v3 containsObject:@"opportunistic-fetch"] & 1) == 0)
  {
    NSLog(&cfstr_YouVeImplement.isa);
  }
  if (_UIDeviceNativeUserInterfaceIdiom() != 4
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([v3 containsObject:@"remote-notification"] & 1) == 0
    && ([v3 containsObject:@"remote-notification-initiated-fetch"] & 1) == 0)
  {
    NSLog(&cfstr_YouVeImplement_0.isa);
  }
}

- (void)beginReceivingRemoteControlEvents
{
  int64_t remoteControlEventObservers = self->_remoteControlEventObservers;
  self->_int64_t remoteControlEventObservers = remoteControlEventObservers + 1;
  if (!remoteControlEventObservers)
  {
    __MRMediaRemoteSetCanBeNowPlayingApplication(1);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    void v4[2] = __50__UIApplication_beginReceivingRemoteControlEvents__block_invoke;
    v4[3] = &unk_1E5302D70;
    void v4[4] = self;
    __MRMediaRemoteSetCommandHandlerBlock(v4);
  }
}

void __50__UIApplication_beginReceivingRemoteControlEvents__block_invoke(uint64_t a1, int a2, const __CFDictionary *a3)
{
  if (a3)
  {
    uint64_t v31 = 0;
    int v32 = &v31;
    uint64_t v33 = 0x2020000000;
    id v6 = (id *)qword_1EB25B998;
    uint64_t v34 = qword_1EB25B998;
    if (!qword_1EB25B998)
    {
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      id v29 = __getkMRMediaRemoteOptionIsExternalPlayerCommandSymbolLoc_block_invoke;
      id v30 = &unk_1E52D9900;
      id v7 = MediaRemoteLibrary();
      v32[3] = (uint64_t)dlsym(v7, "kMRMediaRemoteOptionIsExternalPlayerCommand");
      qword_1EB25B998 = v32[3];
      id v6 = (id *)v32[3];
    }
    _Block_object_dispose(&v31, 8);
    if (!v6)
    {
      long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v26 = [NSString stringWithUTF8String:"NSString *getkMRMediaRemoteOptionIsExternalPlayerCommand(void)"];
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"UIApplication.m", 15446, @"%s", dlerror(), v27, v28, v29, v30);
      goto LABEL_73;
    }
    BOOL v8 = (id) CFDictionaryGetValue(a3, *v6);
    id v9 = v8;
    if (v8 && ([v8 BOOLValue] & 1) != 0)
    {
LABEL_66:
      CFRetain(&unk_1ED3F0DD8);

      return;
    }
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v10 = 6;
  switch(a2)
  {
    case 0:
      goto LABEL_39;
    case 1:
      uint64_t v10 = 7;
      goto LABEL_39;
    case 2:
      uint64_t v10 = 0;
      goto LABEL_39;
    case 3:
      uint64_t v10 = 5;
      goto LABEL_39;
    case 4:
      uint64_t v10 = 1;
      goto LABEL_39;
    case 5:
      uint64_t v10 = 2;
      goto LABEL_39;
    case 6:
      uint64_t v10 = 12;
      goto LABEL_39;
    case 7:
      uint64_t v10 = 13;
      goto LABEL_39;
    case 8:
      uint64_t v10 = 14;
      goto LABEL_39;
    case 9:
      uint64_t v10 = 16;
      goto LABEL_39;
    case 10:
      uint64_t v10 = 15;
      goto LABEL_39;
    case 11:
      uint64_t v10 = 17;
      goto LABEL_39;
    case 12:
      uint64_t v10 = 23;
      goto LABEL_39;
    case 13:
      uint64_t v10 = 25;
      goto LABEL_39;
    case 14:
      uint64_t v10 = 24;
      goto LABEL_39;
    case 15:
      uint64_t v10 = 26;
      goto LABEL_39;
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
      goto LABEL_66;
    case 21:
      uint64_t v10 = 27;
LABEL_39:
      if (a3)
      {
        uint64_t v31 = 0;
        int v32 = &v31;
        uint64_t v33 = 0x2020000000;
        id v11 = (id *)qword_1EB25B9A0;
        uint64_t v34 = qword_1EB25B9A0;
        if (!qword_1EB25B9A0)
        {
          uint64_t v27 = MEMORY[0x1E4F143A8];
          uint64_t v28 = 3221225472;
          id v29 = __getkMRMediaRemoteOptionMediaTypeSymbolLoc_block_invoke;
          id v30 = &unk_1E52D9900;
          BOOL v12 = MediaRemoteLibrary();
          v32[3] = (uint64_t)dlsym(v12, "kMRMediaRemoteOptionMediaType");
          qword_1EB25B9A0 = v32[3];
          id v11 = (id *)v32[3];
        }
        _Block_object_dispose(&v31, 8);
        if (!v11)
        {
          long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
          long long v26 = [NSString stringWithUTF8String:"NSString *getkMRMediaRemoteOptionMediaType(void)"];
          objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"UIApplication.m", 15436, @"%s", dlerror(), v27, v28, v29, v30);
          break;
        }
        Value = (void *)CFDictionaryGetValue(a3, *v11);
      }
      else
      {
        Value = 0;
      }
      id v14 = Value;
      uint64_t v31 = 0;
      int v32 = &v31;
      uint64_t v33 = 0x2020000000;
      uint64_t v15 = (void *)qword_1EB25B9A8;
      uint64_t v34 = qword_1EB25B9A8;
      if (!qword_1EB25B9A8)
      {
        uint64_t v27 = MEMORY[0x1E4F143A8];
        uint64_t v28 = 3221225472;
        id v29 = __getkMRMediaRemoteMediaTypeAudioSymbolLoc_block_invoke;
        id v30 = &unk_1E52D9900;
        long long v16 = MediaRemoteLibrary();
        v32[3] = (uint64_t)dlsym(v16, "kMRMediaRemoteMediaTypeAudio");
        qword_1EB25B9A8 = v32[3];
        uint64_t v15 = (void *)v32[3];
      }
      _Block_object_dispose(&v31, 8);
      if (!v15)
      {
        long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
        long long v26 = [NSString stringWithUTF8String:"NSString *getkMRMediaRemoteMediaTypeAudio(void)"];
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"UIApplication.m", 15438, @"%s", dlerror(), v27, v28, v29, v30);
        break;
      }
      if ([v14 isEqualToString:*v15])
      {
        uint64_t v17 = 3;
      }
      else
      {
        uint64_t v31 = 0;
        int v32 = &v31;
        uint64_t v33 = 0x2020000000;
        long long v18 = (void *)qword_1EB25B9B0;
        uint64_t v34 = qword_1EB25B9B0;
        if (!qword_1EB25B9B0)
        {
          uint64_t v27 = MEMORY[0x1E4F143A8];
          uint64_t v28 = 3221225472;
          id v29 = __getkMRMediaRemoteMediaTypeVideoSymbolLoc_block_invoke;
          id v30 = &unk_1E52D9900;
          uint64_t v19 = MediaRemoteLibrary();
          v32[3] = (uint64_t)dlsym(v19, "kMRMediaRemoteMediaTypeVideo");
          qword_1EB25B9B0 = v32[3];
          long long v18 = (void *)v32[3];
        }
        _Block_object_dispose(&v31, 8);
        if (!v18)
        {
          long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
          long long v26 = [NSString stringWithUTF8String:"NSString *getkMRMediaRemoteMediaTypeVideo(void)"];
          objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"UIApplication.m", 15440, @"%s", dlerror(), v27, v28, v29, v30);
          break;
        }
        if ([v14 isEqualToString:*v18])
        {
          uint64_t v17 = 2;
        }
        else
        {
          uint64_t v31 = 0;
          int v32 = &v31;
          uint64_t v33 = 0x2020000000;
          uint64_t v20 = (void *)qword_1EB25B9B8;
          uint64_t v34 = qword_1EB25B9B8;
          if (!qword_1EB25B9B8)
          {
            uint64_t v27 = MEMORY[0x1E4F143A8];
            uint64_t v28 = 3221225472;
            id v29 = __getkMRMediaRemoteMediaTypeImageSymbolLoc_block_invoke;
            id v30 = &unk_1E52D9900;
            unint64_t v21 = MediaRemoteLibrary();
            v32[3] = (uint64_t)dlsym(v21, "kMRMediaRemoteMediaTypeImage");
            qword_1EB25B9B8 = v32[3];
            uint64_t v20 = (void *)v32[3];
          }
          _Block_object_dispose(&v31, 8);
          if (!v20)
          {
            long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
            long long v26 = [NSString stringWithUTF8String:"NSString *getkMRMediaRemoteMediaTypeImage(void)"];
            objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"UIApplication.m", 15442, @"%s", dlerror(), v27, v28, v29, v30);
            break;
          }
          uint64_t v17 = [v14 isEqualToString:*v20];
        }
      }

      if (!a3)
      {
        int v24 = 0;
        goto LABEL_65;
      }
      uint64_t v31 = 0;
      int v32 = &v31;
      uint64_t v33 = 0x2020000000;
      int v22 = (id *)qword_1EB25B9C0;
      uint64_t v34 = qword_1EB25B9C0;
      if (!qword_1EB25B9C0)
      {
        uint64_t v27 = MEMORY[0x1E4F143A8];
        uint64_t v28 = 3221225472;
        id v29 = __getkMRMediaRemoteOptionTrackIDSymbolLoc_block_invoke;
        id v30 = &unk_1E52D9900;
        int v23 = MediaRemoteLibrary();
        v32[3] = (uint64_t)dlsym(v23, "kMRMediaRemoteOptionTrackID");
        qword_1EB25B9C0 = v32[3];
        int v22 = (id *)v32[3];
      }
      _Block_object_dispose(&v31, 8);
      if (v22)
      {
        int v24 = CFDictionaryGetValue(a3, *v22);
LABEL_65:
        [*(id *)(a1 + 32) _postSimpleRemoteNotificationForAction:v10 andContext:v17 trackID:v24];

        goto LABEL_66;
      }
      long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v26 = [NSString stringWithUTF8String:"NSNumber *getkMRMediaRemoteOptionTrackID(void)"];
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"UIApplication.m", 15444, @"%s", dlerror(), v27, v28, v29, v30);
      break;
    default:
      switch(a2)
      {
        case 'd':
          uint64_t v10 = 8;
          goto LABEL_39;
        case 'e':
          uint64_t v10 = 9;
          goto LABEL_39;
        case 'f':
          uint64_t v10 = 3;
          goto LABEL_39;
        case 'g':
          uint64_t v10 = 4;
          goto LABEL_39;
        case 'h':
          uint64_t v10 = 10;
          goto LABEL_39;
        case 'i':
          uint64_t v10 = 11;
          goto LABEL_39;
        case 'j':
          uint64_t v10 = 28;
          goto LABEL_39;
        case 'o':
          uint64_t v10 = 18;
          goto LABEL_39;
        case 'p':
          uint64_t v10 = 19;
          goto LABEL_39;
        case 'q':
          uint64_t v10 = 20;
          goto LABEL_39;
        case 'r':
          uint64_t v10 = 21;
          goto LABEL_39;
        case 's':
          uint64_t v10 = 22;
          goto LABEL_39;
        default:
          goto LABEL_66;
      }
  }
LABEL_73:

  __break(1u);
}

- (void)endReceivingRemoteControlEvents
{
  int64_t remoteControlEventObservers = self->_remoteControlEventObservers;
  BOOL v3 = remoteControlEventObservers == 1;
  BOOL v4 = remoteControlEventObservers < 1;
  int64_t v5 = remoteControlEventObservers - 1;
  if (!v4)
  {
    self->_int64_t remoteControlEventObservers = v5;
    if (v3)
    {
      __MRMediaRemoteSetCanBeNowPlayingApplication(0);
      __MRMediaRemoteSetCommandHandlerBlock(0);
    }
  }
}

- (BOOL)_hasRemoteControlEventObservers
{
  return self->_remoteControlEventObservers > 0;
}

- (void)_sendHeadsetOriginatedMediaRemoteCommand:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  BOOL v4 = (unsigned int (*)(uint64_t, void))getMRMediaRemoteSendCommandSymbolLoc_ptr;
  id v11 = getMRMediaRemoteSendCommandSymbolLoc_ptr;
  if (!getMRMediaRemoteSendCommandSymbolLoc_ptr)
  {
    int64_t v5 = MediaRemoteLibrary();
    v9[3] = (uint64_t)dlsym(v5, "MRMediaRemoteSendCommand");
    getMRMediaRemoteSendCommandSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    BOOL v4 = (unsigned int (*)(uint64_t, void))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v4)
  {
    if (!v4(v3, 0)) {
      NSLog(&cfstr_SUnableToSendC.isa, "-[UIApplication _sendHeadsetOriginatedMediaRemoteCommand:]", v3);
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = objc_msgSend(NSString, "stringWithUTF8String:", "Boolean __MRMediaRemoteSendCommand(MRMediaRemoteCommand, CFDictionaryRef)");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"UIApplication.m", 15450, @"%s", dlerror());

    __break(1u);
  }
}

- (void)_setSystemWindowsSecure:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_applicationFlags + 1) = *((void *)&self->_applicationFlags + 1) & 0xFFFFFFDFFFFFFFFFLL | v3;
  -[UIWindow _setSecure:](self->_backgroundHitTestWindow, "_setSecure:");
}

- (BOOL)_areSystemWindowsSecure
{
  return (*((unsigned __int8 *)&self->_applicationFlags + 12) >> 5) & 1;
}

- (int64_t)_availableTextServices
{
  return +[_UITextServiceSession availableTextServices];
}

- (id)_showServiceForType:(int64_t)a3 withContext:(id)a4
{
  return +[_UITextServiceSession showServiceForType:a3 withContext:a4];
}

- (id)_showServiceForText:(id)a3 type:(int64_t)a4 fromRect:(CGRect)a5 inView:(id)a6
{
  return +[_UITextServiceSession showServiceForText:type:fromRect:inView:](_UITextServiceSession, "showServiceForText:type:fromRect:inView:", a3, a4, a6, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (id)_showServiceForText:(id)a3 selectedTextRange:(_NSRange)a4 type:(int64_t)a5 fromRect:(CGRect)a6 inView:(id)a7
{
  return +[_UITextServiceSession showServiceForText:selectedTextRange:type:fromRect:inView:](_UITextServiceSession, "showServiceForText:selectedTextRange:type:fromRect:inView:", a3, a4.location, a4.length, a5, a7, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (id)_findPrintTarget:(id)a3
{
  id v4 = a3;
  if ([(UIApplication *)self _supportsPrintCommand])
  {
    int64_t v5 = [(UIApplication *)self _responderForKeyEvents];
    id v6 = _UIResponderTargetForAction(v5, sel_print_, v4);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_orderFrontCharacterPalette_ == a3 || sel__handleLegacyEmojiKeyboardShortcut_ == a3)
  {
    uint64_t v8 = +[UIKeyboardImpl activeInstance];
    unsigned __int8 v9 = [v8 canPresentOrDismissEmojiPopover];
  }
  else
  {
    if (sel_startDictation_ == a3)
    {
      unsigned __int8 v10 = +[UIDictationController canPerformDictation];
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)UIApplication;
      unsigned __int8 v10 = [(UIResponder *)&v12 canPerformAction:a3 withSender:v6];
    }
    unsigned __int8 v9 = v10;
  }

  return v9;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v7 = a3;
  int64_t v5 = [(UIApplication *)self _storyboardInitialMenu];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"UIApplication.m" lineNumber:15785 description:@"Legacy menu found in storyboard. Please recompile using the latest version of Xcode."];
    }
    [v7 _patch:v5];
  }
}

- (id)_preferredDefaultSceneSessionRole
{
  return [(_UIApplicationInfoParser *)self->_appInfo preferredDefaultSceneSessionRole];
}

- (void)requestSceneSessionActivation:(UISceneSession *)sceneSession userActivity:(NSUserActivity *)userActivity options:(UISceneActivationRequestOptions *)options errorHandler:(void *)errorHandler
{
  unsigned __int8 v10 = errorHandler;
  id v11 = options;
  objc_super v12 = userActivity;
  if (sceneSession) {
    +[UISceneSessionActivationRequest requestWithSession:sceneSession];
  }
  else {
  id v13 = +[UISceneSessionActivationRequest request];
  }
  [v13 setUserActivity:v12];

  [v13 setOptions:v11];
  [(UIApplication *)self activateSceneSessionForRequest:v13 errorHandler:v10];
}

- (void)activateSceneSessionForRequest:(UISceneSessionActivationRequest *)request errorHandler:(void *)errorHandler
{
  id v6 = request;
  id v7 = errorHandler;
  if (qword_1EB25B840 != -1) {
    dispatch_once(&qword_1EB25B840, &__block_literal_global_2277);
  }
  if (!byte_1EB25B503)
  {
    uint64_t v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Scene", &qword_1EB25B850) + 8);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)timespec buf = 0;
    uint64_t v20 = "Cannot request scene session activation because it is not supported on the current device.";
    goto LABEL_12;
  }
  if ([(_UIApplicationInfoParser *)self->_appInfo supportsMultiwindow])
  {
    uint64_t v8 = +[UIWindowScene _keyWindowScene]();
    unsigned __int8 v9 = [v8 _eventDeferringManager];
    unsigned __int8 v10 = -[_UIEventDeferringManager bufferKeyboardFocusEnvironmentEventsWithReason:]((uint64_t)v9, @"Scene Creation");

    id v11 = +[_UIWorkspaceSceneRequestOptionsFactory sharedFactory];
    id v12 = (id)qword_1EB25B590;
    id v13 = [v11 customEndpointForRequest:v6];
    if (!v13)
    {
      id v14 = (void *)MEMORY[0x1E4F62888];
      uint64_t v15 = [MEMORY[0x1E4F62888] defaultShellMachName];
      id v13 = [v14 endpointForMachName:v15 service:@"com.apple.frontboard.workspace-service" instance:0];
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __61__UIApplication_activateSceneSessionForRequest_errorHandler___block_invoke;
    v21[3] = &unk_1E5302DC0;
    id v22 = v10;
    id v24 = v13;
    id v25 = v7;
    id v23 = v12;
    id v16 = v13;
    id v17 = v12;
    id v18 = v10;
    [v11 buildWorkspaceRequestOptionsForRequest:v6 withContinuation:v21];

    goto LABEL_15;
  }
  uint64_t v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Scene", &qword_1EB25B858) + 8);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)timespec buf = 0;
    uint64_t v20 = "Cannot request scene session activation because the application does not support multiple scenes.";
LABEL_12:
    _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
  }
LABEL_13:
  if (v7)
  {
    id v11 = _UISceneErrorWithCode(0);
    (*((void (**)(void *, void *))v7 + 2))(v7, v11);
LABEL_15:
  }
}

void __61__UIApplication_activateSceneSessionForRequest_errorHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) invalidate];
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
    }
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __61__UIApplication_activateSceneSessionForRequest_errorHandler___block_invoke_2;
    v10[3] = &unk_1E5302D98;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 56);
    [v8 requestSceneFromEndpoint:v9 withOptions:v5 completion:v10];
  }
}

void __61__UIApplication_activateSceneSessionForRequest_errorHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [*(id *)(a1 + 32) invalidate];
  if (v4)
  {
    id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Scene", &UIApplicationBackgroundRefreshStatusDidChangeNotification_block_invoke_7___s_category)+ 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Scene session activation failed with error: %@", (uint8_t *)&v7, 0xCu);
    }
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
    }
  }
}

- (void)_requestSceneSessionActivationWithConfiguration:(id)a3 errorHandler:(id)a4
{
  id v5 = a4;
  id v6 = (id)[a3 copy];
  _UIWindowSceneActivationPrepareConfiguration(v6, 0, 0, 0, 0);
  _UIWindowSceneActivateConfiguration(v6, 0, v5);
}

- (void)requestSceneSessionDestruction:(UISceneSession *)sceneSession options:(UISceneDestructionRequestOptions *)options errorHandler:(void *)errorHandler
{
  v32[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = sceneSession;
  unsigned __int8 v10 = options;
  id v11 = errorHandler;
  if (!v9)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"UIApplication.m", 15988, @"Invalid parameter not satisfying: %@", @"sceneSession" object file lineNumber description];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__UIApplication_requestSceneSessionDestruction_options_errorHandler___block_invoke;
  aBlock[3] = &unk_1E52F31C8;
  id v12 = v11;
  id v31 = v12;
  id v13 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (qword_1EB25B840 != -1) {
    dispatch_once(&qword_1EB25B840, &__block_literal_global_2277);
  }
  if (!byte_1EB25B503)
  {
    uint64_t v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Scene", &qword_1EB25B860) + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)timespec buf = 0;
      uint64_t v20 = "Invalid attempt to call -[UIApplication requestSceneSessionDestruction:] from an unsupported device.";
LABEL_19:
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    }
LABEL_20:
    unint64_t v21 = _UISceneErrorWithCode(0);
    v13[2](v13, v21);
    goto LABEL_23;
  }
  if (![(_UIApplicationInfoParser *)self->_appInfo supportsMultiwindow])
  {
    uint64_t v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Scene", &qword_1EB25B868) + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)timespec buf = 0;
      uint64_t v20 = "Calling -[UIApplication requestSceneSessionDestruction:] requires multiwindow adoption.";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (v10
    && (self,
        id v14 = objc_claimAutoreleasedReturnValue(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v14,
        (isKindOfClass & 1) != 0))
  {
    uint64_t v16 = [(UISceneDestructionRequestOptions *)v10 windowDismissalAnimation];
    if (v16 == 3) {
      uint64_t v17 = 3;
    }
    else {
      uint64_t v17 = 1;
    }
    if (v16 == 2) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = v17;
    }
  }
  else
  {
    uint64_t v18 = 1;
  }
  unint64_t v21 = [(UISceneSession *)v9 persistentIdentifier];
  id v22 = objc_alloc_init(MEMORY[0x1E4FB33A8]);
  v32[0] = v21;
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __69__UIApplication_requestSceneSessionDestruction_options_errorHandler___block_invoke_2293;
  v26[3] = &unk_1E5302DE8;
  id v27 = v22;
  id v28 = v12;
  id v24 = v22;
  [v24 destroyScenesWithPersistentIdentifiers:v23 animationType:v18 destroySessions:1 completion:v26];

LABEL_23:
}

uint64_t __69__UIApplication_requestSceneSessionDestruction_options_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __69__UIApplication_requestSceneSessionDestruction_options_errorHandler___block_invoke_2293(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __69__UIApplication_requestSceneSessionDestruction_options_errorHandler___block_invoke_2;
  uint64_t v9 = &unk_1E52DA160;
  id v10 = v4;
  id v11 = *(id *)(a1 + 40);
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], &v6);
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v6, v7, v8, v9);
}

uint64_t __69__UIApplication_requestSceneSessionDestruction_options_errorHandler___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t result = *(void *)(result + 40);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)requestSceneSessionRefresh:(UISceneSession *)sceneSession
{
  id v5 = sceneSession;
  if (!v5)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"UIApplication.m", 16058, @"Invalid parameter not satisfying: %@", @"sceneSession != nil" object file lineNumber description];
  }
  if (![(UISceneSession *)v5 _trackingRefreshRequest])
  {
    [(UISceneSession *)v5 _setTrackingRefreshRequest:1];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__UIApplication_requestSceneSessionRefresh___block_invoke;
    aBlock[3] = &unk_1E52D9F70;
    uint64_t v6 = v5;
    id v29 = v6;
    uint64_t v7 = _Block_copy(aBlock);
    id v8 = [(UISceneSession *)v6 scene];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = (void *)UIApp;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __44__UIApplication_requestSceneSessionRefresh___block_invoke_2;
      v25[3] = &unk_1E52E3298;
      v25[4] = self;
      id v26 = v8;
      id v27 = v7;
      id v11 = v7;
      [v10 _performBlockAfterCATransactionCommits:v25];
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F62888];
      id v13 = (id)qword_1EB25B590;
      id v14 = [v12 defaultShellMachName];
      uint64_t v15 = [v12 endpointForMachName:v14 service:@"com.apple.frontboard.workspace-service" instance:0];

      uint64_t v16 = objc_opt_new();
      uint64_t v17 = [(UISceneSession *)v6 persistentIdentifier];
      [v16 setIdentifier:v17];

      id v18 = objc_alloc_init(MEMORY[0x1E4FB3428]);
      [v16 setScenePlacementConfiguration:v18];

      [v16 setRequestBackground:1];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      void v21[2] = __44__UIApplication_requestSceneSessionRefresh___block_invoke_3;
      v21[3] = &unk_1E5302E10;
      id v24 = v7;
      id v22 = v6;
      id v23 = self;
      id v19 = v7;
      [v13 requestSceneFromEndpoint:v15 withOptions:v16 completion:v21];
    }
  }
}

uint64_t __44__UIApplication_requestSceneSessionRefresh___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setTrackingRefreshRequest:0];
}

uint64_t __44__UIApplication_requestSceneSessionRefresh___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRefreshForUIScene:*(void *)(a1 + 40) disposeAfter:0 completion:*(void *)(a1 + 48)];
}

void __44__UIApplication_requestSceneSessionRefresh___block_invoke_3(void *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(a1[6] + 16))();
    uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneSessionRequests", &UIApplicationBackgroundRefreshStatusDidChangeNotification_block_invoke_8___s_category)+ 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      id v8 = (void *)a1[4];
      uint64_t v9 = v7;
      id v10 = [v8 persistentIdentifier];
      *(_DWORD *)timespec buf = 138412546;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Could not request UISceneSession with persistent identifier: \"%@\" due to error: %@", buf, 0x16u);
    }
  }
  else
  {
    id v11 = (void *)a1[5];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __44__UIApplication_requestSceneSessionRefresh___block_invoke_2300;
    void v15[3] = &unk_1E52E3298;
    id v12 = v5;
    uint64_t v13 = a1[5];
    id v14 = (void *)a1[6];
    id v16 = v12;
    uint64_t v17 = v13;
    id v18 = v14;
    [v11 _performBlockAfterCATransactionCommitSynchronizes:v15];
  }
}

void __44__UIApplication_requestSceneSessionRefresh___block_invoke_2300(uint64_t a1)
{
  id v2 = +[UIScene _sceneForFBSScene:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _performRefreshForUIScene:v2 disposeAfter:1 completion:*(void *)(a1 + 48)];
}

- (void)_performRefreshForUIScene:(id)a3 disposeAfter:(BOOL)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = (void (**)(void))a5;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"UIApplication.m", 16107, @"Invalid parameter not satisfying: %@", @"uiScene != nil" object file lineNumber description];
  }
  id v11 = v9;
  id v12 = [v11 _effectiveUISettings];
  int v13 = [v11 _hasInvalidated];

  if (v13)
  {

    goto LABEL_7;
  }
  if ([v12 isForeground])
  {
    int IsSEO = _UISceneLifecycleStateIsSEO(v12);

    if (!IsSEO)
    {
LABEL_7:
      if (v10) {
        v10[2](v10);
      }
      goto LABEL_13;
    }
  }
  else
  {
  }
  [v11 _setIsRespondingToLifecycleEvent:1];
  if ([v11 _isReadyForSuspension]) {
    [v11 _prepareForResume];
  }
  [(UIApplication *)self _saveRestorationUserActivityStateForScene:v11];
  uint64_t v15 = [v11 _FBSScene];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__UIApplication__performRefreshForUIScene_disposeAfter_completion___block_invoke;
  v18[3] = &unk_1E5302E38;
  void v18[4] = self;
  id v19 = v15;
  id v20 = v11;
  __int16 v21 = v10;
  BOOL v22 = a4;
  id v16 = v15;
  [(UIApplication *)self _beginSnapshotSessionForScene:v16 withSnapshotBlock:v18];

LABEL_13:
}

void __67__UIApplication__performRefreshForUIScene_disposeAfter_completion___block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  id v4 = [*(id *)(a1 + 32) _createSnapshotContextForScene:*(void *)(a1 + 40) withName:@"UIApplicationAutomaticSnapshotDefault" performLayoutWithSettings:0];
  if (v4) {
    [*(id *)(a1 + 40) performSnapshotWithContext:v4];
  }
  if (v3) {
    v3[2](v3);
  }
  [*(id *)(a1 + 48) _setIsRespondingToLifecycleEvent:0];
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
  int v6 = [*(id *)(a1 + 48) _isEligibleForSuspension];
  if (*(unsigned char *)(a1 + 64) && v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FB33A8]);
    id v8 = [*(id *)(a1 + 48) session];
    id v9 = [v8 persistentIdentifier];
    v15[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __67__UIApplication__performRefreshForUIScene_disposeAfter_completion___block_invoke_2;
    v12[3] = &unk_1E5302D18;
    id v13 = *(id *)(a1 + 48);
    id v14 = v7;
    id v11 = v7;
    [v11 destroyScenesWithPersistentIdentifiers:v10 animationType:1 destroySessions:0 completion:v12];
  }
  else if (v6)
  {
    [*(id *)(a1 + 48) _prepareForSuspend];
  }
}

void __67__UIApplication__performRefreshForUIScene_disposeAfter_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __67__UIApplication__performRefreshForUIScene_disposeAfter_completion___block_invoke_3;
  id v9 = &unk_1E52D9F98;
  id v10 = v4;
  id v11 = *(id *)(a1 + 32);
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], &v6);
  objc_msgSend(*(id *)(a1 + 40), "invalidate", v6, v7, v8, v9);
}

void __67__UIApplication__performRefreshForUIScene_disposeAfter_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneSessionRequests", &UIApplicationBackgroundRefreshStatusDidChangeNotification_block_invoke_9___s_category)+ 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      uint64_t v3 = *(void **)(a1 + 40);
      id v4 = v2;
      id v5 = [v3 session];
      uint64_t v6 = [v5 persistentIdentifier];
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      id v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "Failed to dismiss UIScene with persistent identifier: \"%@\" after refresh due to error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)_isDisplayingActivityContinuationUI
{
  return self->_isDisplayingActivityContinuationUI;
}

- (void)_setIsDisplayingActivityContinuationUI:(BOOL)a3
{
  self->_isDisplayingActivityContinuationUI = a3;
}

- (void)__setQueuedOrientationChange:(id)a3
{
}

- (NSString)_alternateIconName
{
  return self->__alternateIconName;
}

- (void)_setApplicationWantsGESEvents:(BOOL)a3
{
  self->_applicationWantsGESEvents = a3;
}

- (BOOL)_shouldAllowContentTextContextExtraction
{
  return self->__shouldAllowContentTextContextExtraction;
}

- (void)set_shouldAllowContentTextContextExtraction:(BOOL)a3
{
  self->__shouldAllowContentTextContextExtraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__alternateIconName, 0);
  objc_storeStrong(&self->___queuedOrientationChange, 0);
  objc_storeStrong((id *)&self->_shortcutService, 0);
  objc_storeStrong((id *)&self->_responderBasedEventDeliverer, 0);
  objc_storeStrong((id *)&self->_sceneHostingWorkspaceController, 0);
  objc_storeStrong((id *)&self->_orientationObserver, 0);
  objc_storeStrong((id *)&self->_endpointMonitor, 0);
  objc_storeStrong(&self->_storyboardInitialMenu, 0);
  objc_storeStrong((id *)&self->_applicationPushRegistry, 0);
  objc_storeStrong((id *)&self->_appState, 0);
  objc_storeStrong((id *)&self->_motionNotificationGenerator, 0);
  objc_storeStrong((id *)&self->_HIDGameControllerEventQueue, 0);
  objc_storeStrong(&self->_HIDGameControllerEventObserver, 0);
  objc_storeStrong((id *)&self->_forceStageObservable, 0);
  objc_storeStrong((id *)&self->__gestureDelayedEventComponentDispatcher, 0);
  objc_storeStrong((id *)&self->__gestureEnvironment, 0);
  objc_storeStrong((id *)&self->_activityContinuationManager, 0);
  objc_storeStrong((id *)&self->_systemNavigationAction, 0);
  objc_storeStrong((id *)&self->_cachedSystemAnimationFence, 0);
  objc_storeStrong((id *)&self->_fenceTask, 0);
  objc_storeStrong((id *)&self->_keyUpKeyCommandMap, 0);
  objc_storeStrong((id *)&self->_hardwareKeyDownCodeToEventMap, 0);
  objc_storeStrong((id *)&self->_keyRepeatAction, 0);
  objc_storeStrong((id *)&self->_idleTimerDisabledReasons, 0);
  objc_storeStrong((id *)&self->_actionsPendingInitialization, 0);
  objc_storeStrong((id *)&self->_appInfo, 0);
  objc_storeStrong((id *)&self->_backgroundHitTestWindow, 0);
  objc_storeStrong((id *)&self->_physicalKeycodeSet, 0);
  objc_storeStrong((id *)&self->_keyCommandRegistrationAssertions, 0);
  objc_storeStrong((id *)&self->_proximityEventsEnabledStartDate, 0);
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_eventFetcher, 0);
  objc_storeStrong((id *)&self->_applicationBSActionHandlers, 0);
  objc_storeStrong((id *)&self->_internalApplicationBSActionHandlers, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_idleModeController, 0);
  objc_storeStrong((id *)&self->_mainStoryboardName, 0);
  objc_storeStrong((id *)&self->_postCommitActions, 0);
  objc_storeStrong((id *)&self->_embeddedScreenStatusBarWindow, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_destroyWeak((id *)&self->_editAlertController);
  objc_storeStrong((id *)&self->_hideNetworkActivityIndicatorTimer, 0);
  objc_storeStrong((id *)&self->_topLevelNibObjects, 0);
}

- (int64_t)defaultStatusForCategory:(int64_t)a3 error:(id *)a4
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(MEMORY[0x1E4F22428], "queryResultForCategory:error:", a3);
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_14;
  }
  if (![v5 didRefresh])
  {
    if (!a4) {
      goto LABEL_15;
    }
    uint64_t v7 = [v6 referenceDate];
    uint64_t v8 = [v6 refreshAfter];
    id v9 = (void *)v8;
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      uint64_t v11 = 0;
    }
    else
    {
      v14[0] = @"UIApplicationCategoryDefaultStatusLastProvidedDateErrorKey";
      v14[1] = @"UIApplicationCategoryDefaultRetryAvailabilityDateErrorKey";
      v15[0] = v7;
      v15[1] = v8;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    }
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UIApplicationCategoryDefaultErrorDomain" code:1 userInfo:v11];
    *a4 = v12;

LABEL_14:
    a4 = 0;
    goto LABEL_15;
  }
  if ([v6 isDefaultForCategory]) {
    a4 = (id *)1;
  }
  else {
    a4 = (id *)2;
  }
LABEL_15:

  return (int64_t)a4;
}

- (BOOL)supportsAlternateIcons
{
  id v2 = LSApplicationProxyForSettingCurrentApplicationIcon();
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_setAlternateIconName:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = LSApplicationProxyForSettingCurrentApplicationIcon();
  if (v8)
  {
    if ((*((unsigned char *)&self->_applicationFlags + 13) & 0x20) == 0
      && [(UIApplication *)self applicationState] == UIApplicationStateActive)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke_3;
      v12[3] = &unk_1E5302828;
      id v9 = &v13;
      id v13 = v7;
      [v8 setAlternateIconName:v6 withResult:v12];
      goto LABEL_7;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke_2;
    v14[3] = &unk_1E52DA040;
    id v9 = &v15;
    id v15 = v7;
    BOOL v10 = MEMORY[0x1E4F14428];
    uint64_t v11 = v14;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke;
    block[3] = &unk_1E52DA040;
    id v9 = &v17;
    id v17 = v7;
    BOOL v10 = MEMORY[0x1E4F14428];
    uint64_t v11 = block;
  }
  dispatch_async(v10, v11);
LABEL_7:
}

void __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke_4;
    block[3] = &unk_1E52DA040;
    id v7 = &v12;
    id v12 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke_5;
    v8[3] = &unk_1E52DB330;
    id v7 = &v10;
    id v10 = *(id *)(a1 + 32);
    id v6 = v6;
    id v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

uint64_t __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __86__UIApplication_UIAlternateApplicationIcons___setAlternateIconName_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setAlternateIconName:(NSString *)alternateIconName completionHandler:(void *)completionHandler
{
  id v6 = completionHandler;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__UIApplication_UIAlternateApplicationIcons__setAlternateIconName_completionHandler___block_invoke;
  v8[3] = &unk_1E52F31C8;
  id v9 = v6;
  id v7 = v6;
  [(UIApplication *)self _setAlternateIconName:alternateIconName completionHandler:v8];
}

void __85__UIApplication_UIAlternateApplicationIcons__setAlternateIconName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  else
  {
    id v5 = +[UIWindow _applicationKeyWindow];
    if (!v5)
    {
      id v6 = +[UIScreen mainScreen];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      void v22[2] = __85__UIApplication_UIAlternateApplicationIcons__setAlternateIconName_completionHandler___block_invoke_2;
      v22[3] = &unk_1E52DFF48;
      id v7 = v6;
      id v23 = v7;
      uint64_t v8 = +[_UISceneLifecycleMultiplexer mostActiveSceneWithTest:v22];
      if (!v8)
      {
        uint64_t v8 = +[_UISceneLifecycleMultiplexer mostActiveSceneWithTest:&__block_literal_global_3383];
      }
      id v5 = [v8 _topVisibleWindowPassingTest:&__block_literal_global_3385];
      if (!v5)
      {
        id v5 = +[UIWindow _topVisibleWindowPassingTest:&__block_literal_global_3385];
      }
    }
    id v9 = +[UIViewController _viewControllerForFullScreenPresentationFromView:v5];
    id v10 = LSApplicationProxyForSettingCurrentApplicationIcon();
    uint64_t v11 = [v10 localizedNameForContext:0];

    id v12 = objc_opt_new();
    id v13 = NSString;
    id v14 = _UINSLocalizedStringWithDefaultValue(@"ALTERNATE_APP_ICONS_CONFIRMATION_MESSAGE", @"You have changed the icon for “%@”.");
    id v15 = objc_msgSend(v13, "localizedStringWithFormat:", v14, v11);
    [v12 setMessageText:v15];

    id v16 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:1];
    [v16 setContentViewController:v12];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__UIApplication_UIAlternateApplicationIcons__setAlternateIconName_completionHandler___block_invoke_5;
    aBlock[3] = &unk_1E52FB230;
    id v21 = *(id *)(a1 + 32);
    id v17 = _Block_copy(aBlock);
    id v18 = _UINSLocalizedStringWithDefaultValue(@"ALTERNATE_APP_ICONS_CONFIRMATION_DISMISS_BUTTON", @"OK");
    id v19 = +[UIAlertAction actionWithTitle:v18 style:0 handler:v17];
    [v16 addAction:v19];

    [v9 presentViewController:v16 animated:1 completion:0];
  }
}

uint64_t __85__UIApplication_UIAlternateApplicationIcons__setAlternateIconName_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _hostsWindows])
  {
    id v4 = v3;
    id v5 = [v4 _screen];
    if (v5 == *(void **)(a1 + 32))
    {
      id v7 = [v4 _effectiveUISettings];
      uint64_t IsForegroundActive = _UISceneLifecycleStateIsForegroundActive(v7);
    }
    else
    {
      uint64_t IsForegroundActive = 0;
    }
  }
  else
  {
    uint64_t IsForegroundActive = 0;
  }

  return IsForegroundActive;
}

uint64_t __85__UIApplication_UIAlternateApplicationIcons__setAlternateIconName_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 _hostsWindows])
  {
    id v3 = [v2 _effectiveUISettings];
    uint64_t v4 = [v3 isForeground];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __85__UIApplication_UIAlternateApplicationIcons__setAlternateIconName_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 canBecomeKeyWindow] && (objc_msgSend(v2, "_isTextEffectsWindow") & 1) == 0) {
    uint64_t v3 = [v2 isInternalWindow] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __85__UIApplication_UIAlternateApplicationIcons__setAlternateIconName_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_saveApplicationPreservationStateIfSupported
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)&self->_applicationFlags + 7) & 4) != 0)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    if ([(UIApplication *)self _appAdoptsUISceneLifecycle])
    {
      uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      uint64_t v4 = +[UIWindow allWindowsIncludingInternalWindows:0 onlyVisibleWindows:0];
    }
    id v5 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v12 = [v11 rootViewController];
          if (v12)
          {
            id v13 = (void *)v12;
            char v14 = [v11 _isTextEffectsWindow];

            if ((v14 & 1) == 0) {
              [v5 addObject:v11];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    if (-[UIApplication _appAdoptsUISceneLifecycle](self, "_appAdoptsUISceneLifecycle") || [v5 count]) {
      [(UIApplication *)self _saveApplicationPreservationState:v5 viewController:0 sessionIdentifier:0 beginHandler:0 completionHandler:0];
    }
    else {
      NSLog(&cfstr_NoWindowsHaveA.isa);
    }
    if (_UIStateRestorationDebugLogEnabled())
    {
      id v15 = [MEMORY[0x1E4F1C9C8] date];
      [v15 timeIntervalSinceDate:v3];
      NSLog(&cfstr_SavedRestorati.isa, v16);
    }
  }
}

- (void)saveApplicationPreservationStateWithSessionIdentifier:(id)a3 viewController:(id)a4 beginHandler:(id)a5 completionHandler:(id)a6
{
}

- (void)restoreApplicationPreservationStateWithSessionIdentifier:(id)a3 viewController:(id)a4 beginHandler:(id)a5 completionHandler:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((byte_1EB25B505 & 1) == 0)
  {
    uint64_t RestorationRetryCountAndUpdateIfNecessary = _getRestorationRetryCountAndUpdateIfNecessary(v18);
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"UIStateRestorationDeveloperMode", (CFStringRef)*MEMORY[0x1E4F1D3D8], 0);
    if (RestorationRetryCountAndUpdateIfNecessary > 0 || AppBooleanValue)
    {
      if (RestorationRetryCountAndUpdateIfNecessary <= 0 && _UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SDeveloperMode_0.isa, "-[UIApplication(StateRestoration) restoreApplicationPreservationStateWithSessionIdentifier:viewController:beginHandler:completionHandler:]", v18);
      }
      id v15 = self;
      objc_sync_enter(v15);
      qword_1EB25B890 = 0;
      *((void *)&v15->_applicationFlags + 1) |= 0x8000000uLL;
      _incrementRestorationMarkerCount(v15, v18, 1);
      objc_sync_exit(v15);

      +[UIResponder _startDeferredTrackingObjectsWithIdentifiers];
      [v10 _rebuildStateRestorationIdentifierPath];
      [(UIApplication *)v15 _restoreApplicationPreservationStateWithSessionIdentifier:v18 beginHandler:v11 completionHandler:v12];
      uint64_t v16 = v15;
      objc_sync_enter(v16);
      _decrementRestorationMarkerCount(v16, v18);
      objc_sync_exit(v16);

      +[UIResponder _cleanupAllStateRestorationTables];
      long long v17 = v15;
      objc_sync_enter(v17);
      *((void *)&v15->_applicationFlags + 1) &= ~0x8000000uLL;
      objc_sync_exit(v17);
    }
    else
    {
      NSLog(&cfstr_TooManyFailedA.isa, v18);
      _deleteRestorationArchive(v18);
    }
  }
}

- (void)removeApplicationPreservationStateWithSessionIdentifier:(id)a3
{
  id v5 = a3;
  uint64_t v3 = _restorationPath(v5);
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v4 removeItemAtURL:v3 error:0];
}

- (void)_setSaveStateRestorationArchiveWithFileProtectionCompleteUntilFirstUserAuthentication
{
  self->_saveStateRestorationArchiveWithFileProtectionCompleteUntilFirstUserAuthentication = 1;
}

- (unint64_t)_restorationArchiveProtectionClass
{
  if (!self->_saveStateRestorationArchiveWithFileProtectionCompleteUntilFirstUserAuthentication)
  {
    if (qword_1EB25B898 != -1) {
      dispatch_once(&qword_1EB25B898, &__block_literal_global_3472);
    }
    if (byte_1EB25B508 != 1) {
      return 805306368;
    }
  }
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SSavingRestora.isa, "-[UIApplication(StateRestoration) _restorationArchiveProtectionClass]");
  }
  return 0x40000000;
}

void __69__UIApplication_StateRestoration___restorationArchiveProtectionClass__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v5 = [v0 infoDictionary];

  uint64_t v1 = [v5 objectForKey:@"UIStateRestorationFileProtection"];
  int v2 = [v1 isEqualToString:*MEMORY[0x1E4F28358]];

  if (v2)
  {
    char HasEntitlement = UISelfTaskHasEntitlement((void *)*MEMORY[0x1E4F28340]);
    char v4 = UISelfTaskHasEntitlement((void *)*MEMORY[0x1E4F28348]);
    if ((HasEntitlement & 1) == 0 && (v4 & 1) == 0) {
      byte_1EB25B508 = 1;
    }
  }
}

- (void)_saveApplicationPreservationState:(id)a3 viewController:(id)a4 sessionIdentifier:(id)a5 beginHandler:(id)a6 completionHandler:(id)a7
{
  v115[2] = *MEMORY[0x1E4F143B8];
  id v88 = a3;
  id v80 = a4;
  id v86 = a5;
  BOOL v84 = (void (**)(id, id))a6;
  id v85 = (void (**)(id, BOOL))a7;
  byte_1EB25B509 = 0;
  id v91 = self;
  char v98 = objc_opt_respondsToSelector();
  id v97 = [(NSKeyedArchiver *)[UIStateRestorationKeyedArchiver alloc] initRequiringSecureCoding:v98 & 1];
  id v12 = +[_UIStateRestorationKeyedArchiverDelegate sharedDelegate];
  [v97 setDelegate:v12];

  if (v86)
  {
    if (v84) {
      v84[2](v84, v97);
    }
    goto LABEL_4;
  }
  if ((*((unsigned char *)&self->_applicationFlags + 7) & 4) != 0)
  {
    if (objc_opt_respondsToSelector())
    {
      char v40 = [(UIApplicationDelegate *)self->_delegate application:self shouldSaveSecureApplicationState:v97];
    }
    else
    {
      if (qword_1EB25B8A0 != -1) {
        dispatch_once(&qword_1EB25B8A0, &__block_literal_global_3479);
      }
      char v40 = [(UIApplicationDelegate *)self->_delegate application:self shouldSaveApplicationState:v97];
    }
    if (v40)
    {
      if (_UIStateRestorationDebugLogEnabled())
      {
        uint64_t v75 = @"NO";
        if (v98) {
          uint64_t v75 = @"YES";
        }
        NSLog(&cfstr_SApplicationSu.isa, "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v75);
      }
LABEL_4:
      id v110 = 0;
      id v111 = 0;
      id v109 = 0;
      _UIInitializeStateRestorationCollections(&v111, &v110, &v109);
      id v83 = v111;
      id v95 = v110;
      id v82 = v109;
      char v87 = [MEMORY[0x1E4F1CA48] array];
      id v96 = [MEMORY[0x1E4F1CA48] array];
      [v97 encodeInt:2 forKey:@"kUIStateRestorationArchiveMajorVersionKey"];
      [v97 encodeInt:1 forKey:@"kUIStateRestorationArchiveMinorVersionKey"];
      id v13 = +[UIDevice currentDevice];
      uint64_t v14 = [v13 userInterfaceIdiom];

      id v15 = [NSNumber numberWithInt:v14];
      [v97 encodeObject:v15 forKey:@"UIApplicationStateRestorationUserInterfaceIdiom"];

      uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
      [v97 encodeObject:v16 forKey:@"UIApplicationStateRestorationTimestamp"];

      long long v17 = +[UIDevice currentDevice];
      id v18 = [v17 systemVersion];
      [v97 encodeObject:v18 forKey:@"UIApplicationStateRestorationSystemVersion"];

      int v81 = [MEMORY[0x1E4F28B50] mainBundle];
      if (v81)
      {
        long long v19 = [v81 infoDictionary];
        long long v20 = [v19 objectForKey:*MEMORY[0x1E4F1D020]];

        if (v20) {
          [v97 encodeObject:v20 forKey:@"UIApplicationStateRestorationBundleVersion"];
        }
      }
      if (!v86 && (objc_opt_respondsToSelector() & 1) != 0) {
        [(UIApplicationDelegate *)self->_delegate application:self willEncodeRestorableStateWithCoder:v97];
      }
      if ([v88 count])
      {
        id v94 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v88, "count"));
        uint64_t v92 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v88, "count"));
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        id v21 = v88;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v105 objects:v113 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v106;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v106 != v23) {
                objc_enumerationMutation(v21);
              }
              id v25 = *(void **)(*((void *)&v105 + 1) + 8 * i);
              id v26 = [v25 rootViewController];
              if (_UIStateRestorationDebugLogEnabled())
              {
                id v27 = [v26 restorationIdentifier];
                NSLog(&cfstr_SRootviewcontr.isa, "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v27, v25, v26);
              }
              id v28 = [v26 restorationIdentifier];

              if (v28)
              {
                [v94 addObject:v26];
                id v29 = [v25 restorationIdentifier];

                if (v29)
                {
                  id v30 = [v25 traitCollection];
                  uint64_t v31 = [v30 verticalSizeClass];
                  int v32 = @"UIUserInterfaceSizeClassUnspecified";
                  if (v31 == 2) {
                    int v32 = @"UIUserInterfaceSizeClassRegular";
                  }
                  if (v31 == 1) {
                    int v32 = @"UIUserInterfaceSizeClassCompact";
                  }
                  uint64_t v33 = v32;
                  uint64_t v34 = [v30 horizontalSizeClass];

                  long long v35 = @"UIUserInterfaceSizeClassUnspecified";
                  if (v34 == 2) {
                    long long v35 = @"UIUserInterfaceSizeClassRegular";
                  }
                  if (v34 == 1) {
                    long long v35 = @"UIUserInterfaceSizeClassCompact";
                  }
                  v114[0] = @"VerticalSizeClassStringKey";
                  v114[1] = @"HorizontalSizeClassStringKey";
                  v115[0] = v33;
                  v115[1] = v35;
                  int v36 = (void *)MEMORY[0x1E4F1C9E8];
                  int v37 = v35;
                  char v38 = [v36 dictionaryWithObjects:v115 forKeys:v114 count:2];

                  long long v39 = [v25 restorationIdentifier];
                  [v92 setObject:v38 forKey:v39];
                }
              }
              else
              {
                if (_UIStateRestorationDebugLogEnabled()) {
                  NSLog(&cfstr_SRootViewContr.isa, "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v25, v26);
                }
                if (([v25 isHidden] & 1) == 0) {
                  [(UIApplication *)v91 ignoreSnapshotOnNextApplicationLaunch];
                }
              }
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v105 objects:v113 count:16];
          }
          while (v22);
        }

        if ([v92 count])
        {
          if (_UIStateRestorationDebugLogEnabled()) {
            NSLog(&cfstr_SSavingWindowT.isa, "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v92);
          }
          [v97 encodeObject:v92 forKey:@"WindowIdentifierToSizeClassMapKey"];
        }
      }
      else
      {
        if (v80)
        {
          id v94 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:");
          uint64_t v41 = [v94 count];
LABEL_48:
          if (v41)
          {
            long long v42 = [MEMORY[0x1E4F9F330] _activeActivityViewControllers];
            if ([v42 count])
            {
              long long v103 = 0u;
              long long v104 = 0u;
              long long v101 = 0u;
              long long v102 = 0u;
              id v43 = v42;
              uint64_t v44 = [v43 countByEnumeratingWithState:&v101 objects:v112 count:16];
              if (v44)
              {
                uint64_t v45 = *(void *)v102;
                do
                {
                  for (uint64_t j = 0; j != v44; ++j)
                  {
                    if (*(void *)v102 != v45) {
                      objc_enumerationMutation(v43);
                    }
                    uint64_t v47 = *(void **)(*((void *)&v101 + 1) + 8 * j);
                    char v48 = [v47 restorationIdentifier];

                    if (v48) {
                      _UIAddObjectToStateRestorationRoots(v47);
                    }
                  }
                  uint64_t v44 = [v43 countByEnumeratingWithState:&v101 objects:v112 count:16];
                }
                while (v44);
              }
            }
          }
          for (unint64_t k = 0; [v94 count] > k; ++k)
          {
            id v90 = objc_msgSend(v94, "objectAtIndex:");
            if (v88)
            {
              id v89 = [v88 objectAtIndex:k];
            }
            else
            {
              id v89 = 0;
            }
            _UIAddObjectToStateRestorationRoots(v90);
            while (2)
            {
              if ([v95 count])
              {
                BOOL v49 = (void *)[v95 copy];
                [v95 removeAllObjects];
                if (_UIStateRestorationDebugLogEnabled()) {
                  NSLog(&cfstr_SProcessingObj.isa, "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v49);
                }
                unint64_t v50 = 0;
LABEL_71:
                if ([v49 count] <= v50)
                {

                  continue;
                }
                int64_t v51 = [v49 objectAtIndex:v50];
                char v52 = _restorationIdentifierPathStringForObject(v51);
                if (_UIStateRestorationDebugLogEnabled()) {
                  NSLog(&cfstr_SCurrentObject.isa, "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v50, v52, v51);
                }
                if (v52)
                {
                  id v53 = [(NSKeyedArchiver *)[UIStateRestorationKeyedArchiver alloc] initRequiringSecureCoding:v98 & 1];
                  char v54 = +[_UIStateRestorationKeyedArchiverDelegate sharedDelegate];
                  [v53 setDelegate:v54];

                  _encodeStateRestorationClassForObject(v51, v53);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v55 = v51;
                    [v55 encodeRestorableStateWithCoder:v53];
                    [v53 encodeBool:1 forKey:@"kObjectIsViewControllerKey"];
                    if ([v55 isViewLoaded])
                    {
                      uint64_t v56 = [v55 view];
                      if (v56)
                      {
                        id v57 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                        _encodeRestorationStateForViewAndSubviews(v56, v55, v57, v98 & 1);
                        [v53 encodeObject:v57 forKey:@"kViewRestorationDataKey"];
                        [v53 encodeBool:1 forKey:@"kViewControllerViewWasLoadedKey"];
                      }
                    }
                    goto LABEL_85;
                  }
                  if ([v51 conformsToProtocol:&unk_1ED7013C0])
                  {
                    id v58 = v51;
                    if (objc_opt_respondsToSelector()) {
                      [v58 encodeRestorableStateWithCoder:v53];
                    }
LABEL_85:
                  }
                  else if (_UIStateRestorationDebugLogEnabled())
                  {
                    NSLog(&cfstr_SWarningObject.isa, "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v51);
                  }
                  [v53 finishEncoding];
                  BOOL v59 = [v53 encodedData];
                  [v97 encodeObject:v59 forKey:v52];

                  [v96 addObject:v52];
                }
                else if (_UIStateRestorationDebugLogEnabled())
                {
                  NSLog(&cfstr_SObjectInRootS.isa, "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v51);
                }

                ++v50;
                goto LABEL_71;
              }
              break;
            }
            uint64_t v60 = [v89 firstResponder];
            double v61 = [v60 _restorationIdentifierPath];
            if (v61) {
              [v87 addObject:v61];
            }
          }
          if ([v87 count])
          {
            if (_UIStateRestorationDebugLogEnabled()) {
              NSLog(&cfstr_SSavingFirstRe.isa, "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v87);
            }
            [v97 encodeObject:v87 forKey:@"kFirstRespondersKey"];
          }
          if (_UIStateRestorationDebugLogEnabled()) {
            NSLog(&cfstr_SSavingRootSet.isa, "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v96);
          }
          [v97 encodeObject:v96 forKey:@"kRootRestorationIdentifiersKey"];
          if (_UIStateRestorationDebugLogEnabled()) {
            NSLog(&cfstr_SSavingRootSet_0.isa, "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]", v82);
          }
          [v97 encodeObject:v82 forKey:@"kViewControllerRestorationClassMapKey"];
          id v62 = [(UIResponder *)v91 firstResponder];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v63 = [(UIResponder *)v91 firstResponder];
            int v64 = [v63 _isDisplayingShortcutViewController];

            if (v64)
            {
              byte_1EB25B509 = 1;
              goto LABEL_107;
            }
          }
          else
          {
          }
          if (byte_1EB25B509 != 1)
          {
LABEL_108:
            [v97 finishEncoding];
            double v65 = [v97 encodedData];

            uint64_t v66 = [(UIApplication *)v91 _restorationArchiveProtectionClass];
            int v67 = _restorationDirectory(v86);
            double v68 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v100 = 0;
            [v68 createDirectoryAtURL:v67 withIntermediateDirectories:1 attributes:0 error:&v100];
            id v69 = v100;

            if (v69) {
              NSLog(&cfstr_ErrorCreatingS.isa, v69);
            }

            int v70 = _restorationPath(v86);

            id v99 = 0;
            [v65 writeToURL:v70 options:v66 | 1 error:&v99];
            id v71 = v99;
            double v72 = v71;
            if (v71)
            {
              NSLog(&cfstr_ErrorWritingAr.isa, v71);
              int v73 = 0;
            }
            else
            {
              if (byte_1EB25B509 == 1)
              {
                if (_UIStateRestorationDebugLogEnabled()) {
                  NSLog(&cfstr_SWillIgnoreSna.isa, "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]");
                }
                double v74 = @"YES";
              }
              else
              {
                if (_UIStateRestorationDebugLogEnabled()) {
                  NSLog(&cfstr_SWillUseSnapsh.isa, "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]");
                }
                double v74 = @"NO";
              }
              uint64_t v76 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v74, @"kIgnoreSnapshotKey", 0);
              unsigned int v77 = _restorationDirectory(v86);
              int v78 = [v77 URLByAppendingPathComponent:@"restorationInfo.plist" isDirectory:0];

              [v76 writeToURL:v78 atomically:1];
              int v73 = 1;
            }

            id v97 = 0;
            goto LABEL_132;
          }
LABEL_107:
          [v97 encodeBool:1 forKey:@"kIgnoreSnapshotKey"];
          goto LABEL_108;
        }
        id v94 = 0;
      }
      uint64_t v41 = [v94 count];
      goto LABEL_48;
    }
  }
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SApplicationHa.isa, "-[UIApplication(StateRestoration) _saveApplicationPreservationState:viewController:sessionIdentifier:beginHandler:completionHandler:]");
  }
  _deleteRestorationArchive(0);
  int v73 = 0;
  id v82 = 0;
  id v83 = 0;
  id v95 = 0;
LABEL_132:
  BOOL v79 = v73 != 0;
  if (v83) {
    _UIReleaseStateRestorationCollections();
  }
  if (v97) {
    [v97 finishEncoding];
  }
  if (v85) {
    v85[2](v85, v79);
  }
}

void __133__UIApplication_StateRestoration___saveApplicationPreservationState_viewController_sessionIdentifier_beginHandler_completionHandler___block_invoke()
{
  id v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("ApplicationStateRestoration", &kRestorationTriesLeftKey_block_invoke_10___s_category)+ 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "Warning: The UIApplicationDelegate method application:shouldSaveApplicationState: is deprecated. Please replace the use of application:shouldSaveApplicationState: with application:shouldSaveSecureApplicationState:", v1, 2u);
  }
}

- (void)extendStateRestoration
{
}

- (void)completeStateRestoration
{
}

- (void)ignoreSnapshotOnNextApplicationLaunch
{
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SMarkingIgnore.isa, "-[UIApplication(StateRestoration) ignoreSnapshotOnNextApplicationLaunch]");
  }
  byte_1EB25B509 = 1;
}

+ (BOOL)_wantsApplicationBehaviorAsExtension
{
  return 0;
}

- (NSSet)_canvases
{
  int v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = +[UIScene _scenesIncludingInternal:0];
  char v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (NSSet)_openRepresentations
{
  if (qword_1EB25BA00 != -1) {
    dispatch_once(&qword_1EB25BA00, &__block_literal_global_4054);
  }
  int v2 = (void *)[(id)qword_1EB25B9F8 copy];
  return (NSSet *)v2;
}

- (void)_openCanvasDefinition:(id)a3 withUserActivity:(id)a4 options:(id)a5 errorHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v16 = (id)objc_opt_new();
  uint64_t v14 = [v11 objectForKeyedSubscript:@"_UICanvasRequestOriginKey"];

  id v15 = [v14 scene];
  [v16 setRequestingScene:v15];

  [(UIApplication *)self requestSceneSessionActivation:v13 userActivity:v12 options:v16 errorHandler:v10];
}

- (void)_closeCanvasDefinition:(id)a3 withOptions:(id)a4 errorHandler:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  uint64_t v9 = [a4 objectForKeyedSubscript:@"_UICanvasDismissalAnimationKey"];
  if (v9)
  {
    id v10 = objc_opt_new();
    objc_msgSend(v10, "setWindowDismissalAnimation:", objc_msgSend(v9, "integerValue"));
  }
  else
  {
    id v10 = 0;
  }
  [(UIApplication *)self requestSceneSessionDestruction:v11 options:v10 errorHandler:v8];
}

+ (void)registerObjectForStateRestoration:(id)object restorationIdentifier:(NSString *)restorationIdentifier
{
  if (object && restorationIdentifier && ([object conformsToProtocol:&unk_1ED7013C0] & 1) != 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SWarningIgnori.isa, "void _UIRegisterObjectForStateRestoration(id<UIStateRestoring>, NSString *)", object);
      }
    }
    else
    {
      objc_setAssociatedObject(object, &_MergedGlobals_1213, restorationIdentifier, (void *)1);
      _trackObjectWithIdentifier((uint64_t)object);
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    [v6 raise:@"UIRestorationObjectRegistrationException", @"To register an object for state restoration, must specify a valid non-nil object and a valid non-nil restoration identifier, and the object must implement the UIStateRestoring protocol." format];
  }
}

- (void)installNotificationObserverForNotificationName:(id)a3 forOneNotification:(BOOL)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v10 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__198;
  id v25 = __Block_byref_object_dispose__198;
  id v26 = 0;
  id v11 = v9;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  _DWORD v16[2] = __124__UIApplication_UIApplicationKeyboardTesting__installNotificationObserverForNotificationName_forOneNotification_usingBlock___block_invoke;
  void v16[3] = &unk_1E5309528;
  long long v19 = &v21;
  BOOL v20 = a4;
  id v12 = v11;
  id v17 = v12;
  id v13 = v8;
  id v18 = v13;
  uint64_t v14 = [v12 addObserverForName:v7 object:0 queue:v10 usingBlock:v16];
  id v15 = (void *)v22[5];
  v22[5] = v14;

  _Block_object_dispose(&v21, 8);
}

void __124__UIApplication_UIApplicationKeyboardTesting__installNotificationObserverForNotificationName_forOneNotification_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = v3;
    if (*(unsigned char *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "removeObserver:");
      uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    char v4 = v7;
  }
}

- (void)showKeyboardUsingBlock:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = (void (**)(void))a3;
  [(UIApplication *)self installNotificationObserverForNotificationName:@"UIKeyboardDidShowNotification" forOneNotification:1 usingBlock:a4];
  v6[2]();
}

- (void)_runSubTestForKeyboardBringupWithName:(id)a3 withShowKeyboardBlock:(id)a4 withHideKeyboardBlock:(id)a5 withExtraResultsBlock:(id)a6 withCleanupBlock:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __168__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardBringupWithName_withShowKeyboardBlock_withHideKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke;
  v21[3] = &unk_1E5309578;
  void v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  id v16 = v15;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  BOOL v20 = (void (**)(void))a4;
  [(UIApplication *)self installNotificationObserverForNotificationName:@"UIKeyboardDidShowNotification" forOneNotification:1 usingBlock:v21];
  [(UIApplication *)self startedTest:v19];
  [(UIApplication *)self startedSubTest:@"ShowKeyboard" forTest:v19];
  v20[2](v20);
}

void __168__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardBringupWithName_withShowKeyboardBlock_withHideKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedSubTest:@"ShowKeyboard" forTest:*(void *)(a1 + 40)];
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __168__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardBringupWithName_withShowKeyboardBlock_withHideKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_2;
  block[3] = &unk_1E5309550;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __168__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardBringupWithName_withShowKeyboardBlock_withHideKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runSubTestForKeyboardDismissalWithName:*(void *)(a1 + 40) withHideKeyboardBlock:*(void *)(a1 + 48) withExtraResultsBlock:*(void *)(a1 + 56) withCleanupBlock:*(void *)(a1 + 64)];
}

- (void)_runSubTestForKeyboardDismissalWithName:(id)a3 withHideKeyboardBlock:(id)a4 withExtraResultsBlock:(id)a5 withCleanupBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __148__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardDismissalWithName_withHideKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke;
  BOOL v20 = &unk_1E53095C8;
  uint64_t v21 = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = (void (**)(void))a4;
  [(UIApplication *)self installNotificationObserverForNotificationName:@"UIKeyboardDidHideNotification" forOneNotification:1 usingBlock:&v17];
  [(UIApplication *)self startedSubTest:@"HideKeyboard", v15, v17, v18, v19, v20, v21 forTest];
  v16[2](v16);
}

void __148__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardDismissalWithName_withHideKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) finishedSubTest:@"HideKeyboard" forTest:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    char v4 = (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
  else
  {
    char v4 = 0;
  }
  [*(id *)(a1 + 32) finishedTest:*(void *)(a1 + 40) extraResults:v4 withTeardownBlock:*(void *)(a1 + 56)];
}

- (void)_runSubTestForKeyboardSplitWithName:(id)a3 withShowKeyboardBlock:(id)a4 withExtraResultsBlock:(id)a5 withCleanupBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __144__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardSplitWithName_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke;
  aBlock[3] = &unk_1E53029E0;
  void aBlock[4] = self;
  id v14 = v10;
  id v22 = v14;
  id v15 = v12;
  id v23 = v15;
  id v16 = v13;
  id v24 = v16;
  uint64_t v17 = _Block_copy(aBlock);
  uint64_t v18 = v17;
  if (v11)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __144__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardSplitWithName_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_4;
    v19[3] = &unk_1E53095A0;
    id v20 = v17;
    [(UIApplication *)self showKeyboardUsingBlock:v11 withCompletionBlock:v19];
  }
  else
  {
    NSLog(&cfstr_NoBlockSpecifi.isa);
    dispatch_async(MEMORY[0x1E4F14428], v18);
  }
}

void __144__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardSplitWithName_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke(id *a1)
{
  id v2 = a1[4];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __144__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardSplitWithName_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_2;
  id v7 = &unk_1E53095C8;
  id v8 = v2;
  id v9 = a1[5];
  id v10 = a1[6];
  id v11 = a1[7];
  [v2 installNotificationObserverForNotificationName:@"UIKeyboardDidChangeFrameNotification" forOneNotification:1 usingBlock:&v4];
  objc_msgSend(a1[4], "startedTest:", a1[5], v4, v5, v6, v7, v8);
  [a1[4] startedSubTest:@"SplitKeyboard" forTest:a1[5]];
  uint64_t v3 = +[UIKeyboard activeKeyboard];
  [v3 _setSplit:1];
}

void __144__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardSplitWithName_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedSubTest:@"SplitKeyboard" forTest:*(void *)(a1 + 40)];
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __144__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardSplitWithName_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_3;
  v4[3] = &unk_1E53029E0;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  dispatch_after(v2, MEMORY[0x1E4F14428], v4);
}

uint64_t __144__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardSplitWithName_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runSubTestForKeyboardMergeWithName:*(void *)(a1 + 40) withExtraResultsBlock:*(void *)(a1 + 48) withCleanupBlock:*(void *)(a1 + 56)];
}

void __144__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardSplitWithName_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_4(uint64_t a1)
{
}

- (void)_runSubTestForKeyboardMergeWithName:(id)a3 withExtraResultsBlock:(id)a4 withCleanupBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __122__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardMergeWithName_withExtraResultsBlock_withCleanupBlock___block_invoke;
  uint64_t v18 = &unk_1E53095C8;
  id v19 = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(UIApplication *)self installNotificationObserverForNotificationName:@"UIKeyboardDidChangeFrameNotification" forOneNotification:1 usingBlock:&v15];
  [(UIApplication *)self startedSubTest:@"MergeKeyboard", v13, v15, v16, v17, v18, v19 forTest];
  id v14 = +[UIKeyboard activeKeyboard];
  [v14 _setSplit:0];
}

void __122__UIApplication_UIApplicationKeyboardTesting___runSubTestForKeyboardMergeWithName_withExtraResultsBlock_withCleanupBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) finishedSubTest:@"MergeKeyboard" forTest:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    uint64_t v4 = (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
  else
  {
    uint64_t v4 = 0;
  }
  [*(id *)(a1 + 32) finishedTest:*(void *)(a1 + 40) extraResults:v4 withTeardownBlock:*(void *)(a1 + 56)];
}

- (void)runTestForKeyboardBringupAndDismissalWithName:(id)a3 withShowKeyboardBlock:(id)a4 withHideKeyboardBlock:(id)a5 withExtraResultsBlock:(id)a6 withCleanupBlock:(id)a7
{
  if (a3 && a4 && a5)
  {
    -[UIApplication _runSubTestForKeyboardBringupWithName:withShowKeyboardBlock:withHideKeyboardBlock:withExtraResultsBlock:withCleanupBlock:](self, "_runSubTestForKeyboardBringupWithName:withShowKeyboardBlock:withHideKeyboardBlock:withExtraResultsBlock:withCleanupBlock:");
  }
  else
  {
    NSLog(&cfstr_YouMustSpecify.isa, a2);
  }
}

- (void)runTestForKeyboardRotationWithName:(id)a3 fromOrientation:(int64_t)a4 withShowKeyboardBlock:(id)a5 withExtraResultsBlock:(id)a6 withCleanupBlock:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v12)
  {
    if ((unint64_t)(a4 - 3) < 2) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 4;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __159__UIApplication_UIApplicationKeyboardTesting__runTestForKeyboardRotationWithName_fromOrientation_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke;
    aBlock[3] = &unk_1E53095F0;
    void aBlock[4] = self;
    id v24 = v14;
    id v23 = v12;
    id v25 = v15;
    uint64_t v26 = v16;
    uint64_t v17 = _Block_copy(aBlock);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __159__UIApplication_UIApplicationKeyboardTesting__runTestForKeyboardRotationWithName_fromOrientation_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_3;
    v19[3] = &unk_1E5309618;
    id v20 = v13;
    id v21 = v17;
    void v19[4] = self;
    id v18 = v17;
    [(UIApplication *)self rotateIfNeeded:a4 completion:v19];
  }
  else
  {
    NSLog(&cfstr_YouMustSpecify_0.isa);
  }
}

void __159__UIApplication_UIApplicationKeyboardTesting__runTestForKeyboardRotationWithName_fromOrientation_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __159__UIApplication_UIApplicationKeyboardTesting__runTestForKeyboardRotationWithName_fromOrientation_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_2;
  id v9 = &unk_1E53095C8;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v12 = v3;
  uint64_t v10 = v4;
  id v11 = v5;
  id v13 = *(id *)(a1 + 56);
  [v2 installNotificationObserverForNotificationName:@"UIKeyboardDidShowNotification" forOneNotification:1 usingBlock:&v6];
  objc_msgSend(*(id *)(a1 + 32), "startedTest:", *(void *)(a1 + 40), v6, v7, v8, v9, v10);
  [*(id *)(a1 + 32) rotateIfNeeded:*(void *)(a1 + 64)];
}

void __159__UIApplication_UIApplicationKeyboardTesting__runTestForKeyboardRotationWithName_fromOrientation_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    uint64_t v3 = (*(void (**)(void))(v2 + 16))();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  [*(id *)(a1 + 32) finishedTest:*(void *)(a1 + 40) extraResults:v3 withTeardownBlock:*(void *)(a1 + 56)];
}

void __159__UIApplication_UIApplicationKeyboardTesting__runTestForKeyboardRotationWithName_fromOrientation_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __159__UIApplication_UIApplicationKeyboardTesting__runTestForKeyboardRotationWithName_fromOrientation_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_4;
    v6[3] = &unk_1E53095A0;
    id v7 = *(id *)(a1 + 48);
    [v3 showKeyboardUsingBlock:v2 withCompletionBlock:v6];
  }
  else
  {
    NSLog(&cfstr_NoBlockSpecifi.isa);
    id v4 = *(void **)(a1 + 48);
    id v5 = MEMORY[0x1E4F14428];
    dispatch_async(v5, v4);
  }
}

void __159__UIApplication_UIApplicationKeyboardTesting__runTestForKeyboardRotationWithName_fromOrientation_withShowKeyboardBlock_withExtraResultsBlock_withCleanupBlock___block_invoke_4(uint64_t a1)
{
}

- (void)runTestForKeyboardSplitAndMergeWithName:(id)a3 withShowKeyboardBlock:(id)a4 withExtraResultsBlock:(id)a5 withCleanupBlock:(id)a6
{
  if (a3)
  {
    -[UIApplication _runSubTestForKeyboardSplitWithName:withShowKeyboardBlock:withExtraResultsBlock:withCleanupBlock:](self, "_runSubTestForKeyboardSplitWithName:withShowKeyboardBlock:withExtraResultsBlock:withCleanupBlock:");
  }
  else
  {
    NSLog(&cfstr_YouMustSpecify_1.isa, a2, a3, a4, a5, a6);
  }
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 objectForKey:@"quit"];
  if (v9)
  {

LABEL_4:
    objc_storeStrong((id *)&qword_1EB264610, a3);
    [(UIApplication *)self startedTest:v7];
    id v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"PPTFakeSuspendEvent", @"PPTMessageType", 0);
    [(UIApplication *)self _sendDictionaryToPPT:v11];

LABEL_5:
    char v12 = 1;
    goto LABEL_6;
  }
  uint64_t v10 = [v8 objectForKey:@"suspend"];

  if (v10) {
    goto LABEL_4;
  }
  id v14 = [v8 objectForKey:@"launch"];

  if (v14)
  {
    id v15 = _pptLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)timespec buf = 0;
      _os_log_error_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Application received PPT launch test command, but we're already running!", buf, 2u);
    }

    [(UIApplication *)self startedTest:v7];
    [(UIApplication *)self failedTest:v7];
    goto LABEL_5;
  }
  if ([v7 isEqualToString:@"leak"])
  {
    uint64_t v16 = [v8 objectForKey:@"leak"];
    int v17 = [v16 isEqualToString:@"yes"];

    if (v17) {
      [(UIApplication *)self startLeaking];
    }
    else {
      [(UIApplication *)self stopLeaking];
    }
    goto LABEL_5;
  }
  if ([v7 isEqualToString:@"resize"])
  {
    [(UIApplication *)self performSelector:sel__executeResizeTest withObject:self afterDelay:1.0];
    goto LABEL_5;
  }
  if (objc_opt_respondsToSelector()) {
    char v12 = [(UIApplicationDelegate *)self->_delegate application:self runTest:v7 options:v8];
  }
  else {
    char v12 = 0;
  }
LABEL_6:

  return v12;
}

- (void)_executeNextResizeSubTest
{
  uint64_t v3 = [(id)UIApp _mainScene];
  id v4 = +[UIScene _sceneForFBSScene:v3];

  [v4 _referenceBounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = 0;
  double v13 = 0.0;
  double v14 = 320.0;
  do
  {
    if (v14 > v13 && v14 < v5) {
      double v13 = v14;
    }
    double v14 = *(double *)((char *)&_UIWindowWidthsOnIPAD + v12 + 8);
    v12 += 8;
  }
  while (v12 != 32);
  if (_MergedGlobals_1256)
  {
    if (v13 <= 0.0) {
      double v13 = v5;
    }
    if (v13 == v5)
    {
      uint64_t v16 = 0;
      double v13 = 320.0;
      while (v13 <= v5)
      {
        double v13 = *(double *)((char *)&_UIWindowWidthsOnIPAD + v16 + 8);
        v16 += 8;
        if (v16 == 32)
        {
          double v13 = v5;
          break;
        }
      }
      int v17 = 0;
      _MergedGlobals_1256 = 0;
    }
    else
    {
      int v17 = 1;
    }
  }
  else
  {
    uint64_t v18 = 0;
    double v13 = 320.0;
    while (v13 <= v5)
    {
      double v13 = *(double *)((char *)&_UIWindowWidthsOnIPAD + v18 + 8);
      v18 += 8;
      if (v18 == 32)
      {
        int v17 = 0;
        double v13 = v5;
        goto LABEL_23;
      }
    }
    int v17 = 0;
  }
LABEL_23:
  uint64_t v19 = qword_1EB264650;
  if (v13 == *(double *)&qword_1EB264650) {
    int v17 = 1;
  }
  if (v17) {
    *(double *)&uint64_t v19 = v13;
  }
  if (v5 == v13) {
    double v20 = *(double *)&v19;
  }
  else {
    double v20 = v13;
  }
  if (v20 == v5)
  {
    [(UIApplication *)self finishedTest:@"resize"];
    [MEMORY[0x1E4F39CF8] begin];
    uint64_t v26 = [v4 _effectiveSettings];
    id v27 = (void *)[v26 mutableCopy];

    objc_msgSend(v27, "setFrame:", *(double *)&qword_1EB264638, unk_1EB264640, *(double *)&qword_1EB264648, *(double *)&qword_1EB264650);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __64__UIApplication_UIApplicationTesting___executeNextResizeSubTest__block_invoke_3;
    v28[3] = &unk_1E5309690;
    id v29 = v27;
    id v25 = v27;
    [v4 _enableOverrideSettingsForActions:v28];
    id v24 = v29;
  }
  else
  {
    id v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"resize %.0f->%.0f", *(void *)&v5, *(void *)&v20);
    [(UIApplication *)self startedSubTest:v21 forTest:@"resize"];
    [MEMORY[0x1E4F39CF8] begin];
    id v22 = [v4 _effectiveSettings];
    id v23 = (void *)[v22 mutableCopy];

    objc_msgSend(v23, "setFrame:", v7, v9, v11, v20);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __64__UIApplication_UIApplicationTesting___executeNextResizeSubTest__block_invoke;
    v30[3] = &unk_1E5302968;
    id v31 = v23;
    int v32 = self;
    id v33 = v21;
    id v24 = v21;
    id v25 = v23;
    [v4 _enableOverrideSettingsForActions:v30];
    [(UIApplication *)self performSelector:sel__executeNextResizeSubTest withObject:self afterDelay:1.0];
  }
}

void __64__UIApplication_UIApplicationTesting___executeNextResizeSubTest__block_invoke(void *a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__UIApplication_UIApplicationTesting___executeNextResizeSubTest__block_invoke_2;
  v5[3] = &unk_1E5309668;
  uint64_t v3 = a1[4];
  id v4 = (void *)a1[6];
  void v5[4] = a1[5];
  id v6 = v4;
  [a2 _applyOverrideSettings:v3 forActions:v5];
}

uint64_t __64__UIApplication_UIApplicationTesting___executeNextResizeSubTest__block_invoke_2(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] flush];
  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 finishedSubTest:v3 forTest:@"resize"];
}

uint64_t __64__UIApplication_UIApplicationTesting___executeNextResizeSubTest__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 _applyOverrideSettings:*(void *)(a1 + 32) forActions:&__block_literal_global_543];
}

uint64_t __64__UIApplication_UIApplicationTesting___executeNextResizeSubTest__block_invoke_4()
{
  [MEMORY[0x1E4F39CF8] flush];
  id v0 = (void *)MEMORY[0x1E4F39CF8];
  return [v0 commit];
}

- (void)_executeResizeTest
{
  _MergedGlobals_1256 = 1;
  uint64_t v3 = [(id)UIApp _mainScene];
  id v4 = +[UIScene _sceneForFBSScene:v3];
  [v4 _referenceBounds];
  qword_1EB264638 = v5;
  unk_1EB264640 = v6;
  qword_1EB264648 = v7;
  qword_1EB264650 = v8;

  [(UIApplication *)self startedTest:@"resize"];
  [(UIApplication *)self _executeNextResizeSubTest];
}

- (void)_noteAnimationStarted:(id)a3
{
  if (qword_1EB264620)
  {
    id v4 = [a3 userInfo];
    id v5 = [v4 objectForKey:0x1ED0EA520];

    if ([(id)qword_1EB264628 isEqualToString:v5]) {
      [(UIApplication *)self startedTest:qword_1EB264620];
    }
  }
}

- (void)_noteAnimationFinished:(id)a3
{
  if (qword_1EB264620)
  {
    id v4 = [a3 userInfo];
    id v9 = [v4 objectForKey:0x1ED0EA520];

    if ([(id)qword_1EB264630 isEqualToString:v9])
    {
      [(UIApplication *)self finishedTest:qword_1EB264620 extraResults:0];
      id v5 = (void *)qword_1EB264620;
      qword_1EB264620 = 0;

      uint64_t v6 = (void *)qword_1EB264628;
      qword_1EB264628 = 0;

      uint64_t v7 = (void *)qword_1EB264630;
      qword_1EB264630 = 0;

      uint64_t v8 = +[NSNotificationCenter uikitInternalCenter]();
      [v8 removeObserver:self name:0x1ED185E20 object:0];
      [v8 removeObserver:self name:0x1ED185E40 object:0];
    }
  }
}

- (void)runTest:(id)a3 forAnimation:(id)a4
{
}

- (void)runTest:(id)a3 startingBeforeAnimation:(id)a4 stoppingAfterAnimation:(id)a5
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v16)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_11:
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"UIApplicationTesting.m", 416, @"Invalid parameter not satisfying: %@", @"startAnimationName" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  double v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"UIApplicationTesting.m", 415, @"Invalid parameter not satisfying: %@", @"testName" object file lineNumber description];

  if (!v10) {
    goto LABEL_11;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_12:
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"UIApplicationTesting.m", 417, @"Invalid parameter not satisfying: %@", @"stopAnimationName" object file lineNumber description];

LABEL_4:
  if (qword_1EB264620)
  {
    NSLog(&cfstr_WarningTriedTo_1.isa, qword_1EB264620, qword_1EB264628, qword_1EB264630);
  }
  else
  {
    uint64_t v12 = +[NSNotificationCenter uikitInternalCenter]();
    [v12 addObserver:self selector:sel__noteAnimationStarted_ name:0x1ED185E20 object:0];
    [v12 addObserver:self selector:sel__noteAnimationFinished_ name:0x1ED185E40 object:0];
    objc_storeStrong((id *)&qword_1EB264620, a3);
    objc_storeStrong((id *)&qword_1EB264628, a4);
    objc_storeStrong((id *)&qword_1EB264630, a5);
  }
}

- (BOOL)reportApplicationSuspended
{
  if (__IsRunningTests) {
    BOOL v2 = qword_1EB264610 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    return 0;
  }
  uint64_t v3 = self;
  -[UIApplication finishedTest:extraResults:](self, "finishedTest:extraResults:");
  LOBYTE(v3) = [(UIApplication *)v3 isRunningQuitTest];
  id v4 = (void *)qword_1EB264610;
  qword_1EB264610 = 0;

  return (char)v3;
}

- (BOOL)isRunningQuitTest
{
  if (__IsRunningTests) {
    BOOL v2 = qword_1EB264610 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    return 0;
  }
  else {
    return [(id)qword_1EB264610 hasPrefix:@"quit"];
  }
}

- (BOOL)isRunningSuspendTest
{
  if (__IsRunningTests) {
    BOOL v2 = qword_1EB264610 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    return 0;
  }
  else {
    return [(id)qword_1EB264610 hasPrefix:@"suspend"];
  }
}

- (void)startedAnimationTest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)qword_1EB264608;
    if (!qword_1EB264608)
    {
      uint64_t v6 = objc_opt_new();
      uint64_t v7 = (void *)qword_1EB264608;
      qword_1EB264608 = v6;

      id v5 = (void *)qword_1EB264608;
    }
    [v5 addObject:v4];
    [(UIApplication *)self startedTest:v4];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __60__UIApplication_UIApplicationTesting__startedAnimationTest___block_invoke;
    uint64_t v12 = &unk_1E52D9F98;
    double v13 = self;
    id v8 = v4;
    id v14 = v8;
    [(UIApplication *)self installCACommitCompletionBlock:&v9];
    [(UIApplication *)self startedSubTest:@"setup", v8, v9, v10, v11, v12, v13 forTest];
  }
}

uint64_t __60__UIApplication_UIApplicationTesting__startedAnimationTest___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedSubTest:@"setup" forTest:*(void *)(a1 + 40)];
  BOOL v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 startedSubTest:@"duration" forTest:v3];
}

- (id)resultsForTest:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v5 = 0;
    goto LABEL_6;
  }
  id v4 = [(id)qword_1EB264600 objectForKey:v3];
  id v5 = v4;
  if (!v4)
  {
LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = [v4 objectForKey:@"SubTestResults"];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [v5 setObject:v7 forKey:@"SubTestResults"];
  }
LABEL_8:

  return v7;
}

- (void)finishedSubTest:(id)a3 forTest:(id)a4 waitForCommit:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __77__UIApplication_UIApplicationTesting__finishedSubTest_forTest_waitForCommit___block_invoke;
    v10[3] = &unk_1E52DCB30;
    void v10[4] = self;
    id v11 = v8;
    id v12 = v9;
    [(UIApplication *)self installCACommitCompletionBlock:v10];
  }
  else
  {
    [(UIApplication *)self finishedSubTest:v8 forTest:v9];
  }
}

uint64_t __77__UIApplication_UIApplicationTesting__finishedSubTest_forTest_waitForCommit___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedSubTest:*(void *)(a1 + 40) forTest:*(void *)(a1 + 48)];
}

- (BOOL)isPPTAvailable
{
  return [(UIApplication *)self _purplePPTServerPort] != 0;
}

- (void)startedIPTest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v5 setObject:@"StartedInterProcessTest" forKey:@"PPTMessageType"];
    [v5 setObject:v10 forKey:@"testName"];
    uint64_t v6 = [(UIApplication *)self _currentFrameCountForTestDisplay];
    [v5 setObject:v6 forKey:@"startingFrameCount"];

    uint64_t v7 = NSNumber;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    id v8 = objc_msgSend(v7, "numberWithDouble:");
    [v5 setObject:v8 forKey:@"startTimeIntervalSinceReferenceDate"];

    if (qword_1EB264618)
    {
      [v5 setObject:qword_1EB264618 forKey:@"aggregate"];
      id v9 = (void *)qword_1EB264618;
      qword_1EB264618 = 0;
    }
    -[UIApplication emitPPTStartTracePointForTestName:identifier:](self, "emitPPTStartTracePointForTestName:identifier:", v10, [v10 hash]);
    [(UIApplication *)self _sendDictionaryToPPT:v5];

    id v4 = v10;
  }
}

- (void)finishedIPTest:(id)a3
{
}

- (void)finishedIPTest:(id)a3 extraResults:(id)a4
{
}

- (void)finishedIPTest:(id)a3 waitForCommit:(BOOL)a4 extraResults:(id)a5 withTeardownBlock:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __99__UIApplication_UIApplicationTesting__finishedIPTest_waitForCommit_extraResults_withTeardownBlock___block_invoke;
    v13[3] = &unk_1E52DC7E8;
    v13[4] = self;
    id v14 = v10;
    id v15 = v11;
    id v16 = v12;
    [(UIApplication *)self installCACommitCompletionBlock:v13];
  }
  else
  {
    [(UIApplication *)self finishedIPTest:v10 extraResults:v11 withTeardownBlock:v12];
  }
}

uint64_t __99__UIApplication_UIApplicationTesting__finishedIPTest_waitForCommit_extraResults_withTeardownBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedIPTest:*(void *)(a1 + 40) extraResults:*(void *)(a1 + 48) withTeardownBlock:*(void *)(a1 + 56)];
}

- (void)finishedIPTest:(id)a3 extraResults:(id)a4 withTeardownBlock:(id)a5
{
  id v15 = a4;
  BOOL v8 = (void (**)(void))a5;
  if (a3)
  {
    id v9 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v10 = a3;
    id v11 = objc_alloc_init(v9);
    if (v15) {
      [v11 addEntriesFromDictionary:v15];
    }
    [v11 setObject:@"FinishedInterProcessTest" forKey:@"PPTMessageType"];
    [v11 setObject:v10 forKey:@"testName"];
    id v12 = [(UIApplication *)self _currentFrameCountForTestDisplay];
    [v11 setObject:v12 forKey:@"endingFrameCount"];

    double v13 = NSNumber;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    id v14 = objc_msgSend(v13, "numberWithDouble:");
    [v11 setObject:v14 forKey:@"endTimeIntervalSinceReferenceDate"];

    -[UIApplication emitPPTEndTracePointForTestName:identifier:](self, "emitPPTEndTracePointForTestName:identifier:", v10, [v10 hash]);
    if (v8) {
      v8[2](v8);
    }
    [(UIApplication *)self _sendDictionaryToPPT:v11];
  }
}

void __118__UIApplication_UIApplicationTesting__stopAndReportResultsForTest_extraResults_waitForNotification_withTeardownBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 outputData];
  [v3 addEntriesFromDictionary:v4];
}

void __118__UIApplication_UIApplicationTesting__stopAndReportResultsForTest_extraResults_waitForNotification_withTeardownBlock___block_invoke_392(uint64_t a1)
{
  [*(id *)(a1 + 32) performSelector:sel__reportResults_ withObject:*(void *)(a1 + 40) afterDelay:0.0];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (void)finishedTest:(id)a3 extraResults:(id)a4 withTeardownBlock:(id)a5
{
}

- (void)finishedTest:(id)a3 extraResults:(id)a4 waitForNotification:(id)a5
{
}

- (void)failedTest:(id)a3
{
}

- (void)failedTest:(id)a3 withFailure:(id)a4
{
}

- (void)failedTest:(id)a3 withResults:(id)a4
{
}

- (void)failedTest:(id)a3 withFailure:(id)a4 withResults:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8) {
    BOOL v11 = qword_1EB264610 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  int v12 = !v11;
  if (byte_1EB2645FA) {
    [(UIApplication *)self stopCHUDRecording];
  }
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v10];
  id v14 = [NSNumber numberWithBool:1];
  [v13 setObject:v14 forKey:@"failed"];

  if (v9) {
    [v13 setObject:v9 forKey:@"failureType"];
  }
  if (!v8) {
    goto LABEL_15;
  }
  [v13 setObject:v8 forKey:@"testName"];
  id v15 = _pptLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v8;
    _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "PPT failedTest: %@ (removing results)", (uint8_t *)&v16, 0xCu);
  }

  [(id)qword_1EB264600 removeObjectForKey:v8];
  if (!v12) {
    [(UIApplication *)self performSelector:sel__reportResults_ withObject:v13 afterDelay:0.0];
  }
  else {
LABEL_15:
  }
    [(UIApplication *)self _reportResults:v13];
}

- (void)emitPPTStartTracePointForTestName:(id)a3 identifier:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _pptLogHandle();
  uint64_t v7 = _pptLogHandle();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    int v16 = 138543362;
    id v17 = v5;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MainTest", "%{public, name=testName}@  isAnimation=YES ", (uint8_t *)&v16, 0xCu);
  }

  id v9 = v5;
  size_t v10 = strlen((const char *)[v9 UTF8String]);
  unint64_t v11 = 3 * ((v10 + 11) / 0xC);
  size_t v12 = 12 * ((v10 + 11) / 0xC);
  Buffer = createBuffer(v9, v12);
  [v9 length];
  kdebug_trace();
  if (v12 >= 4)
  {
    unint64_t v14 = 0;
    unint64_t v15 = v11 & 0x3FFFFFFFFFFFFFFFLL;
    do
    {
      kdebug_trace();
      v14 += 3;
    }
    while (v14 < v15);
  }
  free(Buffer);
}

- (void)startCHUDRecording:(id)a3
{
  id v15 = a3;
  CHUDSymbol = (unsigned int (*)(void))_getCHUDSymbol("chudAcquireRemoteAccess");
  id v4 = (unsigned int (*)(void))_getCHUDSymbol("chudIsRemoteAccessAcquired");
  id v5 = (uint64_t (*)(uint64_t))_getCHUDSymbol("chudStartRemotePerfMonitor");
  uint64_t v6 = (uint64_t (*)(void))_getCHUDSymbol("chudInitialize");
  uint64_t v7 = _getCHUDSymbol("chudMarkPID");
  if (v6 && v7 && CHUDSymbol && v4 && v5)
  {
    if ((startCHUDRecording__chudInitialized & 1) == 0)
    {
      uint64_t v8 = v6();
      if (v8)
      {
        NSLog(&cfstr_Chudinitialize_0.isa, v8);
        goto LABEL_19;
      }
      startCHUDRecording__chudInitialized = 1;
    }
    uint64_t v9 = 1;
    while (CHUDSymbol() || !v4())
    {
      NSLog(&cfstr_WaitingForShar.isa, v9, 5);
      sleep(2u);
      uint64_t v9 = (v9 + 1);
      if (v9 == 6) {
        goto LABEL_17;
      }
    }
    NSLog(&cfstr_ConnectedToSha.isa);
LABEL_17:
    size_t v10 = NSString;
    unint64_t v11 = [MEMORY[0x1E4F28F80] processInfo];
    size_t v12 = [v11 processName];
    id v13 = [v10 stringWithFormat:@"%@-%@", v12, v15];
    uint64_t v14 = v5([v13 UTF8String]);

    if (v14) {
      NSLog(&cfstr_Chudstartremot_0.isa, v14);
    }
  }
  else
  {
    NSLog(&cfstr_CouldnTStartSh.isa);
  }
LABEL_19:
}

- (void)stopCHUDRecording
{
  CHUDSymbol = (uint64_t (*)(void))_getCHUDSymbol("chudStopRemotePerfMonitor");
  id v3 = (uint64_t (*)(void))_getCHUDSymbol("chudReleaseRemoteAccess");
  if (CHUDSymbol) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    NSLog(&cfstr_CouldnTStopChu.isa);
  }
  else
  {
    id v5 = v3;
    uint64_t v6 = CHUDSymbol();
    if (v6) {
      NSLog(&cfstr_Chudstopremote_0.isa, v6);
    }
    uint64_t v7 = v5();
    if (v7) {
      NSLog(&cfstr_Chudreleaserem_0.isa, v7);
    }
  }
}

- (void)_leak
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 integerForKey:@"DebugLeakSize"];

  if (v3) {
    size_t v4 = v3;
  }
  else {
    size_t v4 = 0x100000;
  }
  id v5 = malloc_type_malloc(v4, 0x96CEB44CuLL);
  uint64_t v6 = 0;
  do
  {
    v5[v6] = 1;
    v6 += 4096;
  }
  while (v4 > v6);
  _leak_totalLeaked += v4;
}

- (void)startLeaking
{
  if (!__LeakTimer)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 floatForKey:@"DebugLeakRate"];
    float v5 = v4;

    float v6 = 1.0;
    if (v5 != 0.0) {
      float v6 = v5;
    }
    uint64_t v7 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__leak selector:0 userInfo:1 repeats:v6];
    uint64_t v8 = (void *)__LeakTimer;
    __LeakTimer = v7;
  }
}

- (void)stopLeaking
{
  if (__LeakTimer)
  {
    [(id)__LeakTimer invalidate];
    id v2 = (void *)__LeakTimer;
    __LeakTimer = 0;
  }
}

- (BOOL)rotateIfNeeded:(int64_t)a3
{
  int64_t v5 = [(UIApplication *)self _safeInterfaceOrientationForNoWindow];
  if ((unint64_t)(v5 - 3) > 1) {
    unint64_t v6 = (v5 - 1) | (a3 - 1);
  }
  else {
    unint64_t v6 = a3 - 3;
  }
  if (v6 < 2) {
    return 0;
  }
  if ((unint64_t)(a3 - 1) >= 4) {
    a3 = 0;
  }
  uint64_t v8 = [[UIPPTRequestAction alloc] initWithDesiredOrientation:a3];
  uint64_t v9 = [(UIApplication *)self _findUISceneForLegacyInterfaceOrientation];
  size_t v10 = [v9 _FBSScene];
  unint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  [v10 sendActions:v11];

  return 1;
}

- (void)rotateIfNeeded:(int64_t)a3 completion:(id)a4
{
}

- (void)rotateIfNeeded:(int64_t)a3 before:(id)a4 after:(id)a5
{
  uint64_t v8 = (void (**)(id, void))a4;
  uint64_t v9 = (void (**)(id, void))a5;
  if ([(UIApplication *)self _safeInterfaceOrientationForNoWindow] == a3)
  {
    if (v8) {
      v8[2](v8, 0);
    }
    if (v9) {
      v9[2](v9, 0);
    }
  }
  else
  {
    if (v8)
    {
      uint64_t v30 = 0;
      id v31 = &v30;
      uint64_t v32 = 0x3032000000;
      id v33 = __Block_byref_object_copy__199;
      uint64_t v34 = __Block_byref_object_dispose__199;
      id v35 = 0;
      size_t v10 = [(UIApplication *)self keyWindow];
      unint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      size_t v12 = [MEMORY[0x1E4F28F08] mainQueue];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke;
      v27[3] = &unk_1E5309708;
      v27[4] = self;
      id v28 = v8;
      id v29 = &v30;
      uint64_t v13 = [v11 addObserverForName:@"UIWindowWillRotateNotification" object:v10 queue:v12 usingBlock:v27];
      uint64_t v14 = (void *)v31[5];
      void v31[5] = v13;

      _Block_object_dispose(&v30, 8);
    }
    if (v9)
    {
      uint64_t v30 = 0;
      id v31 = &v30;
      uint64_t v32 = 0x3032000000;
      id v33 = __Block_byref_object_copy__199;
      uint64_t v34 = __Block_byref_object_dispose__199;
      id v35 = 0;
      id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      int v16 = +[UIWindow _applicationKeyWindow];
      id v17 = [MEMORY[0x1E4F28F08] mainQueue];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke_4;
      v24[3] = &unk_1E5309730;
      id v25 = v9;
      uint64_t v26 = &v30;
      uint64_t v18 = [v15 addObserverForName:@"UIWindowDidRotateNotification" object:v16 queue:v17 usingBlock:v24];
      uint64_t v19 = (void *)v31[5];
      void v31[5] = v18;

      _Block_object_dispose(&v30, 8);
    }
    if ((unint64_t)(a3 - 1) >= 4) {
      a3 = 0;
    }
    double v20 = [[UIPPTRequestAction alloc] initWithDesiredOrientation:a3];
    id v21 = [(UIApplication *)self _findUISceneForLegacyInterfaceOrientation];
    id v22 = [v21 _FBSScene];
    id v23 = [MEMORY[0x1E4F1CAD0] setWithObject:v20];
    [v22 sendActions:v23];
  }
}

void __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke_2;
  v6[3] = &unk_1E52DA040;
  id v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v2 installCACommitCompletionBlock:v6];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  int64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 16666666);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke_3;
  block[3] = &unk_1E52DA040;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke_4(uint64_t a1)
{
  dispatch_time_t v2 = (void *)UIApp;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke_5;
  v6[3] = &unk_1E52DA040;
  id v7 = *(id *)(a1 + 32);
  [v2 installCACommitCompletionBlock:v6];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

uint64_t __67__UIApplication_UIApplicationTesting__rotateIfNeeded_before_after___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestSceneActivationWithConfiguration:(id)a3 animated:(BOOL)a4 sender:(id)a5 errorHandler:(id)a6
{
  BOOL v7 = a4;
  id v9 = a3;
  id v10 = a6;
  unint64_t v11 = +[UISceneSessionActivationRequest request];
  size_t v12 = [v9 userActivity];
  [v11 setUserActivity:v12];

  uint64_t v13 = [v9 options];
  [v11 setOptions:v13];

  if (v7)
  {
    uint64_t v14 = [[_UIWindowSceneActivationAnimator alloc] initWithConfiguration:v9];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    _DWORD v16[2] = __119__UIApplication__UIWindowSceneActivationCommon___requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke;
    void v16[3] = &unk_1E530BCA8;
    id v17 = v14;
    id v18 = v9;
    id v19 = v11;
    double v20 = self;
    id v21 = v10;
    id v15 = v14;
    [(_UIWindowSceneActivationAnimator *)v15 prewarmWithCompletion:v16];
  }
  else
  {
    [(UIApplication *)self activateSceneSessionForRequest:v11 errorHandler:v10];
  }
}

uint64_t __119__UIApplication__UIWindowSceneActivationCommon___requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = [*(id *)(a1 + 40) preview];
    [v3 animateWithSourcePreview:v4 velocity:0.0];

    int64_t v5 = [*(id *)(a1 + 40) options];
    [*(id *)(a1 + 48) setOptions:v5];
  }
  else
  {
    [*(id *)(a1 + 32) cancel];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  unint64_t v6 = *(void **)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  return [v6 activateSceneSessionForRequest:v7 errorHandler:v8];
}

@end