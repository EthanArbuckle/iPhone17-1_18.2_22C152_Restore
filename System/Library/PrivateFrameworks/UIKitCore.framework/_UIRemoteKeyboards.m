@interface _UIRemoteKeyboards
+ (BOOL)enabled;
+ (BOOL)useSystemService;
+ (BOOL)wantsUnassociatedWindowSceneForKeyboardWindow;
+ (id)bundlesThatShouldNotPreventRestoration;
+ (id)createArbiterConnection;
+ (id)keyboardWindowSceneForScreen:(id)a3 create:(BOOL)a4;
+ (id)serviceName;
+ (id)sharedRemoteKeyboards;
- (BOOL)_isArbiterClientReadyForWritingToolsToHandleKeyboardTracking;
- (BOOL)_isWritingToolsHandlingKeyboardTracking;
- (BOOL)_isWritingToolsReadyToHandleKeyboardTracking;
- (BOOL)_sceneFocusPermittedForApplication;
- (BOOL)_sceneFocusUpdatePermittedForWindow:(id)a3;
- (BOOL)_usesInvisibleKeyboardBehindWTUI;
- (BOOL)allowedToEnableKeyboardWindow;
- (BOOL)allowedToShowKeyboard;
- (BOOL)assertionActivationStateForType:(unint64_t)a3;
- (BOOL)assistantBarVisible;
- (BOOL)currentKeyboard;
- (BOOL)currentStateHasEqualRect:(CGRect)a3 andIAVPosition:(CGRect)a4;
- (BOOL)didHandleKeyboardChange:(id)a3 shouldConsiderSnapshottingKeyboard:(BOOL)a4 isLocalEvent:(BOOL)a5;
- (BOOL)didSignalKeyboardChangedForCurrentKeyboard;
- (BOOL)disableBecomeFirstResponder;
- (BOOL)enableMultiscreenHack;
- (BOOL)handlingRemoteEvent;
- (BOOL)handlingViewServiceEvent;
- (BOOL)hasActiveKeyboardSuppressionAssertionsForReason:(id)a3;
- (BOOL)hasAnyHostedViews;
- (BOOL)hasLocalMinimumKeyboardHeightForScene:(id)a3;
- (BOOL)hasWindowHostingCallerID:(id)a3;
- (BOOL)isFloating;
- (BOOL)isOnScreenRotating;
- (BOOL)isShowingPasswordAutofillPanel:(id)a3;
- (BOOL)isUpdatingKeyWindow;
- (BOOL)isWritingToolsHostingViewService;
- (BOOL)keyboardVisible;
- (BOOL)needsToShowKeyboardForViewServiceHostWindow:(id)a3;
- (BOOL)needsToShowKeyboardForWindow:(id)a3;
- (BOOL)oldPathForSnapshot;
- (BOOL)pendingAutofillRequest;
- (BOOL)refreshWithLocalMinimumKeyboardHeight:(double)a3 forScene:(id)a4;
- (BOOL)remoteKeyboardUndocked;
- (BOOL)remoteKeyboardUndocked:(BOOL)a3;
- (BOOL)sceneIsFullScreen;
- (BOOL)shouldAllowInputViewsRestoredForId:(id)a3;
- (BOOL)shouldFence;
- (BOOL)showsInvisibleKeyboardBehindWTUI;
- (BOOL)snapshotting;
- (BOOL)updatingHeight;
- (BOOL)wantsAssistantWhileSuppressingKeyboard;
- (BOOL)wantsToShowKeyboardForViewServiceHostWindow:(id)a3;
- (BOOL)wantsToShowKeyboardForWindow:(id)a3;
- (CGPoint)persistentOffset;
- (CGRect)keyboardFrameIncludingRemoteIAV;
- (CGRect)keyboardPosition;
- (Class)keyboardWindowClass;
- (FBSScene)requiredScene;
- (NSArray)currentHostedPIDs;
- (NSString)focusedSceneIdentityStringOrIdentifier;
- (NSString)yieldingKeyboardToIgnoredScene;
- (NSXPCConnection)connection;
- (UIRemoteKeyboardWindow)keyboardWindow;
- (UIViewController)stickerPrewarmingViewController;
- (_UIKeyboardArbitration)proxy;
- (_UIKeyboardChangedInformation)backupState;
- (_UIKeyboardChangedInformation)currentState;
- (_UIRemoteKeyboards)init;
- (double)heightForRemoteIAVPlaceholderIfNecessary;
- (double)intersectionHeightForWindowScene:(id)a3;
- (double)intersectionHeightForWindowScene:(id)a3 isLocalMinimumHeightOut:(BOOL *)a4 ignoreHorizontalOffset:(BOOL)a5;
- (id)_activeScreen;
- (id)inputWindowRootViewController;
- (id)prepareForHostedWindowWithScene:(id)a3;
- (id)vendEmojiKeyboardPrewarmingAssertionForReason:(id)a3;
- (id)vendKeyboardSuppressionAssertionForReason:(id)a3;
- (id)vendKeyboardSuppressionAssertionForReason:(id)a3 type:(unint64_t)a4;
- (id)viewHostForWindow:(id)a3;
- (int64_t)lastEventSource;
- (unint64_t)localSceneCount;
- (void)_lostWindow:(id)a3;
- (void)_performOnDistributedControllersExceptSelf:(id)a3;
- (void)_performRequiredSceneUpdateIfPermittedForWindow:(uint64_t)a3 withContext:;
- (void)_postInputSourceDidChangeNotificationForResponder:(id)a3;
- (void)_updateEventSource:(int64_t)a3 options:(unint64_t)a4;
- (void)_updateEventSource:(int64_t)keyboardSource options:(unint64_t)a4 responder:(id)a5;
- (void)addHostedWindowView:(id)a3 fromPID:(int)a4 forScene:(id)a5 callerID:(id)a6;
- (void)addIgnoredSceneIdentityTokenString:(id)a3;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidBecomeActive:(id)a3 forceSignalToProxy:(BOOL)a4;
- (void)applicationDidRemoveDeactivationReason:(id)a3;
- (void)applicationDidSuspend:(id)a3;
- (void)applicationKeyWindowDidChange:(id)a3;
- (void)applicationKeyWindowWillChange:(id)a3;
- (void)applicationResumedEventsOnly:(id)a3;
- (void)applicationWillAddDeactivationReason:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillResume:(id)a3;
- (void)assertNeedsAutofillUI;
- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4;
- (void)checkConnection;
- (void)checkState;
- (void)cleanSuppression;
- (void)clearKeyboardSceneIdentifierEnteringForeground:(id)a3;
- (void)completeMoveKeyboardForWindow:(id)a3;
- (void)completeTransition:(id)a3 withInfo:(id)a4;
- (void)controllerDidLayoutSubviews:(id)a3;
- (void)dealloc;
- (void)finishWithHostedWindow;
- (void)forceKeyboardAway;
- (void)ignoreLayoutNotifications:(id)a3;
- (void)keyboardChangedCompleted;
- (void)peekApplicationEvent:(id)a3;
- (void)performOnControllers:(id)a3;
- (void)performOnDistributedControllers:(id)a3;
- (void)performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate:(void *)a1;
- (void)performRequiredSceneUpdateIfPermittedForViewServiceHostWindow:(uint64_t)a3 servicePID:;
- (void)prepareToMoveKeyboard:(CGRect)a3 withIAV:(CGRect)a4 isIAVRelevant:(BOOL)a5 showing:(BOOL)a6 notifyRemote:(BOOL)a7 forScene:(id)a8;
- (void)preserveKeyboardWithId:(id)a3;
- (void)prewarmWithSTKPrewarmingViewControllerClass:(Class)a3;
- (void)queue_activeProcessResignWithCompletion:(id)a3;
- (void)queue_endInputSessionWithCompletion:(id)a3;
- (void)queue_failedConnection:(id)a3;
- (void)queue_getDebugInfoWithCompletion:(id)a3;
- (void)queue_keyboardChanged:(id)a3 onComplete:(id)a4;
- (void)queue_keyboardChangedWithCompletion:(id)a3;
- (void)queue_keyboardIAVChanged:(double)a3 onComplete:(id)a4;
- (void)queue_keyboardSuppressed:(BOOL)a3 withCompletion:(id)a4;
- (void)queue_keyboardTransition:(id)a3 event:(unint64_t)a4 withInfo:(id)a5 onComplete:(id)a6;
- (void)queue_keyboardUIDidChange:(id)a3 onComplete:(id)a4;
- (void)queue_sceneBecameFocused:(id)a3 withCompletion:(id)a4;
- (void)queue_setKeyboardDisabled:(BOOL)a3 withCompletion:(id)a4;
- (void)queue_setLastEventSource:(int64_t)a3 withCompletion:(id)a4;
- (void)registerController:(id)a3;
- (void)reloadForSnapshotting;
- (void)removeIgnoredSceneIdentityTokenString:(id)a3;
- (void)resetSnapshotWithWindowCheck:(BOOL)a3;
- (void)restoreKeyboardIfNeeded;
- (void)restoreKeyboardWithId:(id)a3;
- (void)restorePreservedInputViewsIfNecessary;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneUpdated;
- (void)sceneWillEnterForeground:(id)a3;
- (void)screenDidDisconnect:(id)a3;
- (void)setBackupState:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCurrentKeyboard:(BOOL)a3;
- (void)setCurrentState:(id)a3;
- (void)setDidSignalKeyboardChangedForCurrentKeyboard:(BOOL)a3;
- (void)setDisableBecomeFirstResponder:(BOOL)a3;
- (void)setDisableBecomeFirstResponder:(BOOL)a3 forSuppressionAssertion:(BOOL)a4;
- (void)setDisableBecomeFirstResponder:(BOOL)a3 forSuppressionAssertion:(BOOL)a4 updatePlacement:(BOOL)a5;
- (void)setDisableBecomeFirstResponder:(BOOL)a3 forSuppressionAssertion:(BOOL)a4 updatePlacement:(BOOL)a5 wantsAssistant:(BOOL)a6;
- (void)setEnableMultiscreenHack:(BOOL)a3;
- (void)setFocusedSceneIdentityStringOrIdentifier:(id)a3;
- (void)setHandlingRemoteEvent:(BOOL)a3;
- (void)setHandlingViewServiceEvent:(BOOL)a3;
- (void)setKeyboardSceneIdentifierEnteringForegroundForScene:(id)a3;
- (void)setLastEventSource:(int64_t)a3;
- (void)setPendingAutofillRequest:(BOOL)a3;
- (void)setPlacement:(id)a3 quietly:(BOOL)a4 animated:(BOOL)a5 generateSplitNotification:(BOOL)a6;
- (void)setRequiredScene:(id)a3;
- (void)setShouldFence:(BOOL)a3;
- (void)setSnapshotting:(BOOL)a3;
- (void)setStickerPrewarmingViewController:(id)a3;
- (void)setStickerPrewarmingViewControllerEnabled:(BOOL)a3;
- (void)setSuppressingKeyboard:(BOOL)a3 forScene:(id)a4;
- (void)setUpdatingKeyWindow:(BOOL)a3;
- (void)setWantsAssistantWhileSuppressingKeyboard:(BOOL)a3;
- (void)setWindowEnabled:(BOOL)a3;
- (void)setWindowEnabled:(BOOL)a3 force:(BOOL)a4;
- (void)setWindowLevel:(double)a3 sceneLevel:(double)a4 forResponder:(id)a5;
- (void)setYieldingKeyboardToIgnoredScene:(id)a3;
- (void)signalToProxyKeyboardChanged:(id)a3 onCompletion:(id)a4;
- (void)startConnection;
- (void)startTransition:(id)a3 withInfo:(id)a4;
- (void)stopConnection;
- (void)toggleSuppressionForWritingToolIfNeeded;
- (void)unregisterController:(id)a3;
- (void)updateCurrentState:(id)a3;
- (void)updateLastScreen:(id)a3;
- (void)updateLocalKeyboardChanged:(id)a3;
- (void)updateTransition:(id)a3 withInfo:(id)a4;
- (void)userSelectedApp:(id)a3 onCompletion:(id)a4;
- (void)userSelectedProcessIdentifier:(int)a3 withSceneIdentity:(id)a4 onCompletion:(id)a5;
@end

@implementation _UIRemoteKeyboards

+ (id)sharedRemoteKeyboards
{
  if ([a1 enabled])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43___UIRemoteKeyboards_sharedRemoteKeyboards__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (qword_1EB25C6A8 != -1) {
      dispatch_once(&qword_1EB25C6A8, block);
    }
    id v3 = (id)qword_1EB25C6A0;
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

+ (BOOL)enabled
{
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference__UIRemoteKeyboardsEnabled, @"_UIRemoteKeyboardsEnabled") & 1) != 0|| byte_1EB2576D4)
  {
    id v3 = _UIMainBundleIdentifier();
    if ([&unk_1ED3F08C8 containsObject:v3]) {
      goto LABEL_11;
    }
    if (qword_1EB25C758 != -1) {
      dispatch_once(&qword_1EB25C758, &__block_literal_global_1138_0);
    }
    if ((byte_1EB25C66C & 1) != 0
      || (_UIApplicationIsApplicationWidgetExtension() & 1) != 0
      || (_UIApplicationIsKeyboardExtension() & 1) != 0
      || (_UIApplicationIsWidgetServer() & 1) != 0)
    {
LABEL_11:
      LOBYTE(v2) = 0;
    }
    else
    {
      int v2 = _UIApplicationIsUniversalControl() ^ 1;
    }
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (id)_activeScreen
{
  lastScreen = self->_lastScreen;
  if (lastScreen)
  {
    id v3 = lastScreen;
LABEL_3:
    v4 = v3;
    goto LABEL_6;
  }
  v5 = +[UIWindowScene _keyWindowScene]();
  v6 = [v5 screen];

  if (!v6)
  {
    id v3 = +[UIScreen mainScreen];
    goto LABEL_3;
  }
  v7 = +[UIWindowScene _keyWindowScene]();
  v4 = [v7 screen];

LABEL_6:
  return v4;
}

- (BOOL)keyboardVisible
{
  int v2 = [(_UIRemoteKeyboards *)self currentState];
  char v3 = [v2 keyboardOnScreen];

  return v3;
}

- (_UIKeyboardChangedInformation)currentState
{
  return (_UIKeyboardChangedInformation *)objc_getProperty(self, a2, 240, 1);
}

- (UIRemoteKeyboardWindow)keyboardWindow
{
  char v3 = [(_UIRemoteKeyboards *)self keyboardWindowClass];
  v4 = [(_UIRemoteKeyboards *)self _activeScreen];
  v5 = [(objc_class *)v3 remoteKeyboardWindowForScreen:v4 create:0];

  return (UIRemoteKeyboardWindow *)v5;
}

- (Class)keyboardWindowClass
{
  id v2 = (id)objc_opt_class();
  return (Class)v2;
}

- (BOOL)isWritingToolsHostingViewService
{
  id v2 = [(_UIRemoteKeyboards *)self currentState];
  char v3 = [v2 hostBundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.WritingToolsUIService"];

  return v4;
}

- (_UIRemoteKeyboards)init
{
  v22.receiver = self;
  v22.super_class = (Class)_UIRemoteKeyboards;
  id v2 = [(_UIRemoteKeyboards *)&v22 init];
  char v3 = v2;
  if (v2)
  {
    v2->_shouldFence = 1;
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    windowControllers = v3->_windowControllers;
    v3->_windowControllers = (NSHashTable *)v4;

    uint64_t v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    minimumKeyboardHeights = v3->_minimumKeyboardHeights;
    v3->_minimumKeyboardHeights = (NSMapTable *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    activePIDs = v3->_activePIDs;
    v3->_activePIDs = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    activeCIDs = v3->_activeCIDs;
    v3->_activeCIDs = v10;

    [(_UIRemoteKeyboards *)v3 checkConnection];
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendingKeyboardGrabs = v3->_pendingKeyboardGrabs;
    v3->_pendingKeyboardGrabs = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    ignoredSceneIdentityTokenStringSet = v3->_ignoredSceneIdentityTokenStringSet;
    v3->_ignoredSceneIdentityTokenStringSet = v14;

    v16 = objc_alloc_init(_UIRemoteKeyboardsEventObserver);
    eventObserver = v3->_eventObserver;
    v3->_eventObserver = v16;

    [(_UIRemoteKeyboardsEventObserver *)v3->_eventObserver setDelegate:v3];
    v18 = [[_UIAssertionController alloc] initWithAssertionSubject:v3];
    assertionController = v3->_assertionController;
    v3->_assertionController = v18;

    if (!+[UIKeyboard inputUIOOP])
    {
      v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v20 addObserver:v3 selector:sel_sceneDidDisconnect_ name:@"UISceneDidDisconnectNotification" object:0];
      [v20 addObserver:v3 selector:sel_applicationWillResume_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
      [v20 addObserver:v3 selector:sel_applicationDidSuspend_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
      [v20 addObserver:v3 selector:sel_applicationWillResignActive_ name:@"UIApplicationWillResignActiveNotification" object:0];
      [v20 addObserver:v3 selector:sel_applicationDidBecomeActive_ name:@"UIApplicationDidBecomeActiveNotification" object:0];
      [v20 addObserver:v3 selector:sel_applicationDidBecomeActive_ name:0x1ED180300 object:0];
      [v20 addObserver:v3 selector:sel_applicationWillAddDeactivationReason_ name:@"_UIApplicationWillAddDeactivationReasonNotification" object:0];
      [v20 addObserver:v3 selector:sel_applicationDidRemoveDeactivationReason_ name:@"_UIApplicationDidRemoveDeactivationReasonNotification" object:0];
      [v20 addObserver:v3 selector:sel_applicationResumedEventsOnly_ name:@"UIApplicationResumedEventsOnlyNotification" object:UIApp];
      [v20 addObserver:v3 selector:sel_applicationKeyWindowWillChange_ name:@"_UIWindowWillBecomeApplicationKeyNotification" object:0];
      [v20 addObserver:v3 selector:sel_applicationKeyWindowDidChange_ name:@"_UIWindowDidBecomeApplicationKeyNotification" object:0];
      [v20 addObserver:v3 selector:sel_sceneWillEnterForeground_ name:@"UISceneWillEnterForegroundNotification" object:0];
      [v20 addObserver:v3 selector:sel_sceneDidEnterBackground_ name:@"UISceneDidEnterBackgroundNotification" object:0];
      [v20 addObserver:v3 selector:sel_sceneDidActivate_ name:@"UISceneDidActivateNotification" object:0];
      [v20 addObserver:v3 selector:sel_screenDidDisconnect_ name:@"_UIScreenDidDisconnectNotification" object:0];
      if ([(id)UIApp _isSpringBoard]) {
        [v20 addObserver:v3 selector:sel_willLock_ name:@"_UISystemApplicationWillLockNotification" object:0];
      }
    }
  }
  return v3;
}

+ (id)keyboardWindowSceneForScreen:(id)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([a1 enabled] & 1) != 0
    && [a1 wantsUnassociatedWindowSceneForKeyboardWindow])
  {
    uint64_t v7 = +[UIWindowScene _unassociatedWindowSceneForScreen:v6 create:v4];
  }
  else
  {
    uint64_t v7 = +[UIWindowScene _keyboardWindowSceneForScreen:v6 create:v4];
  }
  v8 = (void *)v7;

  return v8;
}

+ (BOOL)wantsUnassociatedWindowSceneForKeyboardWindow
{
  id v2 = [a1 sharedRemoteKeyboards];
  if (objc_msgSend((id)objc_msgSend(v2, "keyboardWindowClass"), "_isHostedInAnotherProcess")) {
    char v3 = 1;
  }
  else {
    char v3 = [(id)UIApp isFrontBoard];
  }

  return v3;
}

- (BOOL)wantsAssistantWhileSuppressingKeyboard
{
  return self->_wantsAssistantWhileSuppressingKeyboard;
}

- (BOOL)hasLocalMinimumKeyboardHeightForScene:(id)a3
{
  id v4 = a3;
  minimumKeyboardHeights = self->_minimumKeyboardHeights;
  id v6 = [v4 _FBSScene];
  uint64_t v7 = v6;
  if (v6)
  {
    v8 = [v6 identityToken];
    v9 = [v8 stringRepresentation];
  }
  else
  {
    v9 = [v4 _sceneIdentifier];
  }

  v10 = [(NSMapTable *)minimumKeyboardHeights objectForKey:v9];
  [v10 doubleValue];
  double v12 = v11;

  return v12 > 0.0;
}

- (BOOL)snapshotting
{
  return self->_takingSnapshot;
}

- (double)heightForRemoteIAVPlaceholderIfNecessary
{
  if (![(_UIRemoteKeyboards *)self keyboardVisible]) {
    return self->_remoteIAVHeight;
  }
  char v3 = [(_UIRemoteKeyboards *)self currentState];
  [v3 keyboardPositionWithIAV];
  double v5 = v4;
  id v6 = [(_UIRemoteKeyboards *)self currentState];
  [v6 keyboardPosition];
  double v8 = v5 - v7;

  return v8;
}

- (void)prepareToMoveKeyboard:(CGRect)a3 withIAV:(CGRect)a4 isIAVRelevant:(BOOL)a5 showing:(BOOL)a6 notifyRemote:(BOOL)a7 forScene:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  BOOL v10 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v15 = a3.size.height;
  double v16 = a3.size.width;
  double v17 = a3.origin.y;
  double v18 = a3.origin.x;
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v20 = a8;
  if (![(_UIRemoteKeyboards *)self _usesInvisibleKeyboardBehindWTUI])
  {
LABEL_5:
    v21 = KeyboardArbiterClientLog_1();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v160.origin.double x = v18;
      v160.origin.double y = v17;
      v160.size.double width = v16;
      v160.size.double height = v15;
      objc_super v22 = NSStringFromCGRect(v160);
      v23 = [NSNumber numberWithBool:v9];
      v24 = [NSNumber numberWithBool:v8];
      *(_DWORD *)buf = 138412802;
      *(void *)v154 = v22;
      *(_WORD *)&v154[8] = 2112;
      v155 = v23;
      *(_WORD *)v156 = 2112;
      *(void *)&v156[2] = v24;
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "-[_UIRemoteKeyboards prepareToMoveKeyboard:withIAV:isIAVRelevant:showing:notifyRemote:forScene:] position: %@ visible: %@; notifyRemote: %@",
        buf,
        0x20u);
    }
    context = (void *)MEMORY[0x18C108260]();
    v25 = [v20 screen];
    v26 = v25;
    BOOL v27 = 0;
    if (self->_enableMultiscreenHack && v9)
    {
      BOOL v27 = self->_lastScreen != v25;
      [(_UIRemoteKeyboards *)self updateLastScreen:v25];
    }
    v150 = v26;
    [(_UIRemoteKeyboards *)self setBackupState:0];
    v28 = [(_UIRemoteKeyboards *)self proxy];
    v29 = v28;
    double v30 = height - v15;
    if (!v10) {
      double v30 = 0.0;
    }
    [v28 notifyIAVHeight:v30];

    v31 = [(_UIRemoteKeyboards *)self keyboardWindow];
    v32 = [v31 rootViewController];
    int v33 = ([v32 isRotating] & 1) != 0 || self->_takingSnapshot;

    v34 = [v20 keyboardSceneDelegate];
    v35 = [v34 responder];
    v36 = [v35 _window];

    v148 = v36;
    int v147 = v8;
    if (v36) {
      v33 |= [v36 _requiresKeyboardPresentationFence] ^ 1;
    }
    v37 = +[UIKeyboardImpl activeInstance];
    int v38 = [v37 layoutIsResizing];

    int v140 = v38;
    if (v38)
    {
      char v39 = 1;
    }
    else
    {
      v40 = [(_UIRemoteKeyboards *)self keyboardWindow];
      v41 = [v40 rootViewController];
      char v42 = [v41 isTransitioningBetweenFloatingStates];

      char v39 = v42 | v33;
    }
    v43 = objc_opt_class();
    BOOL v44 = [(_UIRemoteKeyboards *)self keyboardVisible];
    BOOL v45 = v44;
    if (v9)
    {
      v46 = v150;
      if (!v27 && v44)
      {
        if ([(_UIRemoteKeyboards *)self currentKeyboard])
        {
          if (-[_UIRemoteKeyboards currentStateHasEqualRect:andIAVPosition:](self, "currentStateHasEqualRect:andIAVPosition:", v18, v17, v16, v15, x, y, width, height))
          {
            if ([(_UIRemoteKeyboards *)self didSignalKeyboardChangedForCurrentKeyboard])
            {
              if (![(_UIRemoteKeyboards *)self isFloating]) {
                goto LABEL_89;
              }
              [(_UIRemoteKeyboards *)self persistentOffset];
              double v143 = v48;
              double v145 = v47;
              +[UIKeyboardImpl persistentOffset];
              if (v145 == v50 && v143 == v49) {
                goto LABEL_89;
              }
            }
          }
        }
      }
      v51 = [(objc_class *)[(_UIRemoteKeyboards *)self keyboardWindowClass] remoteKeyboardWindowForScreen:v150 create:1];
      int v141 = [v51 _isHostedInAnotherProcess];
      if ([v20 _isKeyWindowScene])
      {
        v52 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:0];
        [v52 windowLevel];
        [v51 setWindowLevel:v53 + 1.0];
      }
      if (v45)
      {
        v54 = [(_UIRemoteKeyboards *)self currentState];
        [v54 keyboardPosition];
        v164.origin.double x = v18;
        v164.origin.double y = v17;
        v164.size.double width = v16;
        v164.size.double height = v15;
        if (!CGRectEqualToRect(v161, v164))
        {
          v55 = +[UIKeyboardImpl activeInstance];
          BOOL v56 = ([v55 updatingPreferences] & 1) == 0
             && [(_UIRemoteKeyboards *)self allowedToEnableKeyboardWindow];
          v147 |= v56;
        }
      }
      CGFloat v144 = v15;
      double v62 = v15;
      CGFloat v57 = height;
      v63 = objc_msgSend(v43, "informationForKeyboardUp:withIAV:", v18, v17, v16, v62, x, y, width, height);
      [(_UIRemoteKeyboards *)self updateCurrentState:v63];

      [(_UIRemoteKeyboards *)self resetSnapshotWithWindowCheck:0];
    }
    else
    {
      if (![(_UIRemoteKeyboards *)self currentKeyboard])
      {
        if ((v39 & 1) == 0)
        {
          v58 = [(_UIRemoteKeyboards *)self currentState];
          v59 = [v58 animationFence];
          [v20 _synchronizeDrawingWithFence:v59];
        }
        id v60 = [(_UIRemoteKeyboards *)self currentState];
        [v60 resetAnimationFencing];
        goto LABEL_88;
      }
      CGFloat v144 = v15;
      if (!v45)
      {
        CGFloat v142 = v18;
        CGFloat v57 = height;
        CGFloat v61 = v17;
        int v141 = 1;
        goto LABEL_46;
      }
      CGFloat v57 = height;
      v51 = [v43 informationForKeyboardDown];
      [(_UIRemoteKeyboards *)self updateCurrentState:v51];
      int v141 = 1;
    }
    CGFloat v142 = v18;
    CGFloat v61 = v17;

LABEL_46:
    CGFloat v64 = v16;
    CGFloat v65 = x;
    id v60 = v20;
    v66 = [v60 _FBSScene];
    v67 = v66;
    BOOL v146 = v45;
    CGFloat v68 = y;
    CGFloat v69 = width;
    if (v66)
    {
      v70 = [v66 identityToken];
      v71 = [v70 stringRepresentation];
    }
    else
    {
      v71 = [v60 _sceneIdentifier];
    }

    v72 = [(_UIRemoteKeyboards *)self currentState];
    [v72 setSourceSceneIdentityString:v71];

    v73 = _UIMainBundleIdentifier();
    v74 = [(_UIRemoteKeyboards *)self currentState];
    [v74 setSourceBundleIdentifier:v73];

    v75 = [v60 screen];
    v76 = [v75 displayConfiguration];
    v77 = [v76 _nameForDisplayType];
    v78 = [(_UIRemoteKeyboards *)self currentState];
    [v78 setSourceDisplayIdentifier:v77];

    v79 = _UIMainBundleIdentifier();
    uint64_t v80 = [v79 isEqualToString:@"com.apple.Spotlight"] ^ 1;

    v81 = [(_UIRemoteKeyboards *)self currentState];
    [v81 setShouldTakeSnapshot:v80];

    BOOL v82 = [(_UIRemoteKeyboards *)self localSceneCount] > 1;
    v83 = [(_UIRemoteKeyboards *)self currentState];
    [v83 setMultipleScenes:v82];

    v84 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v85 = [v84 hardwareKeyboardExclusivityIdentifier];
    v86 = [(_UIRemoteKeyboards *)self currentState];
    [v86 setIsOneness:v85 != 0];

    BOOL v87 = +[UIKeyboardImpl isFloating];
    v88 = [(_UIRemoteKeyboards *)self currentState];
    [v88 setIsFloating:v87];

    +[UIKeyboardImpl persistentOffset];
    double v90 = v89;
    double v92 = v91;
    v93 = [(_UIRemoteKeyboards *)self currentState];
    objc_msgSend(v93, "setPersistentOffset:", v90, v92);

    [(_UIRemoteKeyboards *)self setCurrentKeyboard:v9];
    [(_UIRemoteKeyboards *)self setYieldingKeyboardToIgnoredScene:0];
    v94 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v95 = [v94 hasVisibleAssistantBar];
    v96 = [(_UIRemoteKeyboards *)self currentState];
    [v96 setAssistantBarVisible:v95];

    v97 = [v94 visualModeManager];
    LODWORD(v77) = [v97 windowingModeEnabled];

    v98 = [v94 visualModeManager];
    int v99 = [v98 shouldShowWithinAppWindow];

    BOOL v100 = +[UIKeyboardImpl isFloating];
    BOOL v101 = +[UIKeyboardImpl isFloatingForced];
    if (v77)
    {
      BOOL v102 = v101;
      if (v99)
      {
        uint64_t v103 = 1;
      }
      else
      {
        v104 = [(_UIRemoteKeyboards *)self currentState];
        int v105 = [v104 keyboardOnScreen];

        uint64_t v106 = 3;
        if (v102) {
          uint64_t v107 = 3;
        }
        else {
          uint64_t v107 = 0;
        }
        if (v100) {
          uint64_t v106 = v107;
        }
        if (v105) {
          uint64_t v103 = v106;
        }
        else {
          uint64_t v103 = 2;
        }
      }
      v108 = +[UIKeyboardVisualModeManager visualModeLog];
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
      {
        v139 = [(_UIRemoteKeyboards *)self currentState];
        int v138 = [v139 keyboardOnScreen];
        *(_DWORD *)buf = 67110400;
        *(_DWORD *)v154 = 1;
        *(_WORD *)&v154[4] = 1024;
        *(_DWORD *)&v154[6] = v99;
        LOWORD(v155) = 1024;
        *(_DWORD *)((char *)&v155 + 2) = v138;
        HIWORD(v155) = 1024;
        *(_DWORD *)v156 = v100;
        *(_WORD *)&v156[4] = 1024;
        *(_DWORD *)&v156[6] = v102;
        __int16 v157 = 2048;
        uint64_t v158 = v103;
        _os_log_debug_impl(&dword_1853B0000, v108, OS_LOG_TYPE_DEBUG, "prepareToMoveKeyboard (SM: %d, WVM: %d, OS: %d, FL: %d, FF: %d) -> uiPosition: %lu", buf, 0x2Au);
      }
      v109 = [(_UIRemoteKeyboards *)self currentState];
      [v109 setUiPosition:v103];
    }
    v110 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v111 = [v110 containerRootController];
    int v112 = [v111 isSnapshotting];

    BOOL v113 = v146;
    if (![(_UIRemoteKeyboards *)self _isWritingToolsHandlingKeyboardTracking]) {
      goto LABEL_67;
    }
    if (![(_UIRemoteKeyboards *)self hasActiveKeyboardSuppressionAssertionsForReason:@"WritingTools"])goto LABEL_67; {
    v114 = [(_UIRemoteKeyboards *)self currentState];
    }
    [v114 keyboardPosition];
    v165.origin.double x = v115;
    v165.origin.double y = v116;
    v165.size.double width = v117;
    v165.size.double height = v118;
    v162.origin.double x = v142;
    v162.origin.double y = v61;
    v162.size.double width = v64;
    v162.size.double height = v144;
    BOOL v119 = CGRectEqualToRect(v162, v165);

    v120 = [(_UIRemoteKeyboards *)self currentState];
    [v120 keyboardPositionWithIAV];
    v166.origin.double x = v121;
    v166.origin.double y = v122;
    v166.size.double width = v123;
    v166.size.double height = v124;
    v163.origin.double x = v65;
    v163.origin.double y = v68;
    v163.size.double width = v69;
    v163.size.double height = v57;
    BOOL v125 = CGRectEqualToRect(v163, v166);

    if (![(_UIRemoteKeyboards *)self currentKeyboard] || v119 && v125)
    {
      v133 = KeyboardArbiterClientLog_1();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v133, OS_LOG_TYPE_DEFAULT, "-prepareToMoveKeyboards: do not signalKeyboardChanged since it has been suppressed for WritingTools", buf, 2u);
      }

      int v126 = 1;
    }
    else
    {
LABEL_67:
      int v126 = 0;
    }
    [(_UIRemoteKeyboardsEventObserver *)self->_eventObserver setKeyboardIsVisible:[(_UIRemoteKeyboards *)self keyboardVisible]];
    if ((v112 | v147 ^ 1)) {
      goto LABEL_82;
    }
    if ([(_UIRemoteKeyboards *)self allowedToShowKeyboard])
    {
      if ((v140 | v126))
      {
LABEL_82:
        self->_expectingInitialState = 0;
        [(_UIRemoteKeyboards *)self checkConnection];
        if (((v141 | v113) & 1) == 0 && [v60 _isKeyWindowScene]) {
          [(_UIRemoteKeyboards *)self setWindowEnabled:[(_UIRemoteKeyboards *)self allowedToShowKeyboard]];
        }
        v137 = [(_UIRemoteKeyboards *)self currentState];
        [v137 resetAnimationFencing];

        if ([(_UIRemoteKeyboards *)self pendingAutofillRequest]) {
          [(_UIRemoteKeyboards *)self assertNeedsAutofillUI];
        }
        +[UIKeyboardSceneDelegate performOnControllers:&__block_literal_global_641];

LABEL_88:
        v46 = v150;

LABEL_89:
        goto LABEL_90;
      }
    }
    else
    {
      int v127 = v140;
      if (!self->_hostedCount) {
        int v127 = 1;
      }
      if ((v126 | v127)) {
        goto LABEL_82;
      }
    }
    v128 = +[_UIRemoteKeyboardsToken uniqueToken];
    v129 = [v60 _FBSScene];
    v130 = v129;
    if (v129)
    {
      v131 = [v129 identityToken];
      v132 = [v131 stringRepresentation];

      BOOL v113 = v146;
    }
    else
    {
      v132 = [v60 _sceneIdentifier];
    }

    [v128 setSceneIdentityString:v132];
    [(NSMutableSet *)self->_pendingKeyboardGrabs addObject:v128];
    v134 = [(_UIRemoteKeyboards *)self currentState];
    v135 = (void *)[v134 copy];
    v151[0] = MEMORY[0x1E4F143A8];
    v151[1] = 3221225472;
    v151[2] = __96___UIRemoteKeyboards_prepareToMoveKeyboard_withIAV_isIAVRelevant_showing_notifyRemote_forScene___block_invoke;
    v151[3] = &unk_1E52D9F98;
    v151[4] = self;
    id v152 = v128;
    id v136 = v128;
    [(_UIRemoteKeyboards *)self signalToProxyKeyboardChanged:v135 onCompletion:v151];

    goto LABEL_82;
  }
  if (!self->_showsInvisibleKeyboardBehindWTUI || self->_dontSuppressKeyboardAgain)
  {
    self->_showsInvisibleKeyboardBehindWTUI = 0;
    goto LABEL_5;
  }
LABEL_90:
}

- (void)setBackupState:(id)a3
{
}

- (void)applicationDidBecomeActive:(id)a3
{
}

- (BOOL)didHandleKeyboardChange:(id)a3 shouldConsiderSnapshottingKeyboard:(BOOL)a4 isLocalEvent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x2020000000;
  char v95 = 0;
  BOOL handlingRemoteEvent = self->_handlingRemoteEvent;
  self->_BOOL handlingRemoteEvent = !v5;
  BOOL v9 = +[UIKeyboardImpl activeInstance];
  BOOL v10 = v9;
  if (self->_handlingRemoteEvent)
  {
    if (([v9 isMinimized] & 1) != 0
      || (int v11 = [v10 automaticMinimizationEnabled],
          v11 != [v8 automaticMinimizationEnabled]))
    {
      objc_msgSend(v10, "setAutomaticMinimizationEnabled:", objc_msgSend(v8, "automaticMinimizationEnabled"));
      double v12 = [v10 geometryDelegate];
      [v12 syncMinimizedStateToHardwareKeyboardAttachedState];
    }
  }
  BOOL v13 = [(_UIRemoteKeyboards *)self currentKeyboard];
  uint64_t v88 = 0;
  double v89 = &v88;
  uint64_t v90 = 0x2020000000;
  char v91 = 0;
  v14 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke;
  v84[3] = &unk_1E52FD798;
  id v65 = v14;
  id v85 = v65;
  id v15 = v8;
  id v86 = v15;
  BOOL v87 = &v88;
  +[UIKeyboardSceneDelegate performOnControllers:v84];
  double v16 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v17 = [v16 hardwareKeyboardExclusivityIdentifier];

  double v18 = [v15 sourceBundleIdentifier];
  BOOL v67 = v6;
  if ([v18 isEqualToString:@"com.apple.Spotlight"]) {
    unsigned int v19 = (v17 == 0) ^ [v15 isOneness];
  }
  else {
    unsigned int v19 = 0;
  }

  id v20 = [v15 sourceBundleIdentifier];
  unsigned int v21 = [v20 isEqualToString:@"com.apple.CoreAuthUI"];

  objc_super v22 = [v15 sourceBundleIdentifier];
  int v68 = [v22 isEqualToString:@"com.apple.siri"];

  ignoredSceneIdentityTokenStringSet = self->_ignoredSceneIdentityTokenStringSet;
  v24 = [v15 sourceSceneIdentityString];
  int v69 = [(NSMutableSet *)ignoredSceneIdentityTokenStringSet containsObject:v24];

  v25 = [(_UIRemoteKeyboards *)self currentState];
  uint64_t v26 = [v25 uiPosition];
  if (v26 != [v15 uiPosition])
  {
    int v27 = [(id)UIApp _isSpringBoard];

    if (!v27) {
      goto LABEL_12;
    }
    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "uiPosition"));
    [v25 postNotificationName:@"UIKeyboardDidChangeUIPosition" object:v28];
  }
LABEL_12:
  if (!*((unsigned char *)v89 + 24))
  {
    v29 = [(_UIRemoteKeyboards *)self currentState];
    double v30 = [v29 sourceBundleIdentifier];
    v31 = _UIMainBundleIdentifier();
    int v32 = [v30 isEqualToString:v31];

    if (v32)
    {
      int v33 = [(_UIRemoteKeyboards *)self currentState];
      [(_UIRemoteKeyboards *)self setBackupState:v33];
    }
    [(_UIRemoteKeyboards *)self updateCurrentState:v15];
  }
  if ([(_UIRemoteKeyboards *)self currentKeyboard])
  {
    if (*((unsigned char *)v89 + 24)) {
      int v34 = 1;
    }
    else {
      int v34 = v19;
    }
    uint64_t v35 = v34 | v21;
  }
  else
  {
    uint64_t v35 = 0;
  }
  [(_UIRemoteKeyboards *)self setCurrentKeyboard:v35];
  v36 = [(_UIRemoteKeyboards *)self yieldingKeyboardToIgnoredScene];

  if (v36)
  {
    v37 = [(_UIRemoteKeyboards *)self yieldingKeyboardToIgnoredScene];
    int v38 = [v15 sourceSceneIdentityString];
    int v39 = [v37 isEqualToString:v38];

    if (v39 && ([v15 keyboardOnScreen] & 1) == 0)
    {
      v40 = KeyboardArbiterClientLog_1();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v40, OS_LOG_TYPE_DEFAULT, "ignoredScene is done with keyboard: reclaim currentKeyboard and end yielding", buf, 2u);
      }

      [(_UIRemoteKeyboards *)self setCurrentKeyboard:1];
      [(_UIRemoteKeyboards *)self setYieldingKeyboardToIgnoredScene:0];
    }
  }
  else if ((v13 & v69) == 1 {
         && [v15 keyboardOnScreen]
  }
         && ([(id)UIApp _isSpringBoard] & 1) == 0)
  {
    v41 = KeyboardArbiterClientLog_1();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v41, OS_LOG_TYPE_DEFAULT, "ignoredScene is taking the keyboard: begin yielding", buf, 2u);
    }

    char v42 = [v15 sourceSceneIdentityString];
    [(_UIRemoteKeyboards *)self setYieldingKeyboardToIgnoredScene:v42];
  }
  [(_UIRemoteKeyboardsEventObserver *)self->_eventObserver setKeyboardIsVisible:[(_UIRemoteKeyboards *)self keyboardVisible]];
  if (v5)
  {
    if ([(_UIRemoteKeyboards *)self localSceneCount] >= 2)
    {
      v43 = [v15 sourceSceneIdentityString];
      BOOL v5 = v43 == 0;
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  if (v13
    && v67
    && ([(_UIRemoteKeyboards *)self currentState],
        BOOL v44 = objc_claimAutoreleasedReturnValue(),
        int v45 = [v44 keyboardOnScreen],
        v44,
        v45))
  {
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_451;
    v80[3] = &unk_1E52DF220;
    v80[4] = self;
    char v81 = v68;
    char v82 = v19;
    +[UIView performWithoutAnimation:v80];
  }
  else if (self->_keyboardSnapshot)
  {
    [(_UIRemoteKeyboards *)self resetSnapshotWithWindowCheck:0];
  }
  BOOL v46 = [(_UIRemoteKeyboards *)self isShowingPasswordAutofillPanel:v15];
  BOOL v47 = v46;
  if (!v13 || (*((unsigned char *)v89 + 24) ? (int v48 = 1) : (int v48 = v19), ((v48 | v21 | v68 | v69 | v46) & 1) != 0))
  {
    self->_updatingHeight = 1;
    [(_UIRemoteKeyboards *)self performOnControllers:&__block_literal_global_457];
    if (v19)
    {
      int v49 = [(id)UIApp _isSpringBoard] ^ 1;
      if (!v21)
      {
LABEL_50:
        int v50 = 0;
LABEL_53:
        int v51 = v68;
        if (v68) {
          int v51 = [(id)UIApp _isSpringBoard] ^ 1;
        }
        if (((v5 | v49 | v50 | v51 | v47 | v69) & 1) == 0)
        {
          v74[0] = MEMORY[0x1E4F143A8];
          v74[1] = 3221225472;
          v74[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_6;
          v74[3] = &unk_1E52FD798;
          id v75 = v15;
          v76 = self;
          v77 = &v92;
          +[UIKeyboardSceneDelegate performOnControllers:v74];
        }
        [(_UIRemoteKeyboards *)self toggleSuppressionForWritingToolIfNeeded];
        [(_UIRemoteKeyboards *)self performOnControllers:&__block_literal_global_459];
        self->_updatingHeight = 0;
        v52 = off_1E52D4000;
        goto LABEL_65;
      }
    }
    else
    {
      int v49 = 0;
      if (!v21) {
        goto LABEL_50;
      }
    }
    int v50 = [(id)UIApp _isSpringBoard] ^ 1;
    goto LABEL_53;
  }
  if (!v5)
  {
    double v53 = +[UIPeripheralHost sharedInstance];
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_3;
    v78[3] = &unk_1E52D9F70;
    id v79 = v15;
    [v53 performWithoutDeactivation:v78];
  }
  v52 = off_1E52D4000;
  v54 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v55 = [v54 responder];

  if (([v55 _isHostingRemoteContent] & 1) == 0)
  {
    BOOL v56 = [v55 _responderWindow];
    [v56 _setLastFirstResponder:v55];
    if (objc_opt_respondsToSelector())
    {
      CGFloat v57 = [v55 interactionState];
      [v56 _setLastFirstResponderInteractionState:v57];
    }
    [v56 _setWantsResponderWithoutKeyboard:1];
    [v55 resignFirstResponder];
    [v56 _setWantsResponderWithoutKeyboard:0];
    v58 = [v56 _firstResponder];
    [v56 _setLastNextResponder:v58];
  }
  *((unsigned char *)v93 + 24) = 1;

LABEL_65:
  v59 = v52[21];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_9;
  v72[3] = &unk_1E52E9EE0;
  id v60 = v65;
  id v73 = v60;
  [(__objc2_class *)v59 performOnControllers:v72];
  if (([v15 isLocal] & 1) == 0)
  {
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_10;
    v70[3] = &unk_1E52E9EE0;
    id v71 = v15;
    +[UIKeyboardSceneDelegate performOnControllers:v70];
  }
  if (!*((unsigned char *)v89 + 24))
  {
    CGFloat v61 = [(_UIRemoteKeyboards *)self currentState];
    [v61 resetAnimationFencing];
  }
  self->_BOOL handlingRemoteEvent = handlingRemoteEvent;
  char v62 = *((unsigned char *)v93 + 24);

  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v92, 8);

  return v62;
}

- (void)applicationWillAddDeactivationReason:(id)a3
{
  double v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKey:@"_UIApplicationDeactivationReasonUserInfoKey"];
  int v6 = [v5 integerValue];

  switch(v6)
  {
    case 2:
      self->_deactivatedByControlCenter = 1;
      break;
    case 7:
    case 14:
    case 15:
    case 16:
      double v7 = [(_UIRemoteKeyboards *)self focusedSceneIdentityStringOrIdentifier];
      self->_hadFocusBeforeOverladouble y = v7 != 0;

      break;
    case 13:
      self->_deactivatedBySystemAlert = 1;
      break;
    default:
      break;
  }
  if (![(_UIRemoteKeyboards *)self currentKeyboard])
  {
    if (![(_UIRemoteKeyboards *)self keyboardVisible]) {
      return;
    }
    id v10 = [(_UIRemoteKeyboards *)self currentState];
    id v8 = [v10 hostBundleIdentifier];
    BOOL v9 = _UIMainBundleIdentifier();
    if (([v8 isEqualToString:v9] & 1) == 0)
    {

      goto LABEL_13;
    }
  }
  if (v6 != 12) {
    return;
  }
  id v10 = [(_UIRemoteKeyboards *)self proxy];
  [v10 setDeactivating:1];
LABEL_13:
}

- (BOOL)currentKeyboard
{
  return self->_currentKeyboard;
}

- (void)applicationDidRemoveDeactivationReason:(id)a3
{
  double v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKey:@"_UIApplicationDeactivationReasonUserInfoKey"];
  int v6 = [v5 integerValue];

  switch(v6)
  {
    case 2:
      self->_deactivatedByControlCenter = 0;
      break;
    case 7:
    case 14:
    case 15:
    case 16:
      if (self->_hadFocusBeforeOverlay)
      {
        double v7 = [(_UIRemoteKeyboards *)self focusedSceneIdentityStringOrIdentifier];

        if (v7)
        {
          id v8 = [(_UIRemoteKeyboards *)self proxy];
          [v8 applicationShouldFocusWithBundle:0 onCompletion:&__block_literal_global_716];
        }
      }
      self->_hadFocusBeforeOverladouble y = 0;
      if (v6 == 12) {
        goto LABEL_6;
      }
      break;
    case 12:
LABEL_6:
      id v9 = [(_UIRemoteKeyboards *)self proxy];
      [v9 setDeactivating:0];

      break;
    case 13:
      self->_deactivatedBySystemAlert = 0;
      break;
    default:
      return;
  }
}

- (BOOL)wantsToShowKeyboardForWindow:(id)a3
{
  id v4 = a3;
  if ([(_UIRemoteKeyboards *)self currentKeyboard])
  {
    BOOL v5 = 1;
  }
  else
  {
    int v6 = [(_UIRemoteKeyboards *)self viewHostForWindow:v4];
    BOOL v5 = ([v6 hasHostedViews] & 1) != 0
      || self->_keyboardSnapshot
      || [(_UIRemoteKeyboards *)self isOnScreenRotating];
  }
  return v5;
}

- (id)viewHostForWindow:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rootViewController];
  BOOL v5 = [v4 view];
  int v6 = [v5 conformsToProtocol:&unk_1ED5DB8B8];

  if (v6)
  {
    double v7 = [v3 rootViewController];
    id v8 = [v7 view];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)isOnScreenRotating
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40___UIRemoteKeyboards_isOnScreenRotating__block_invoke;
  v4[3] = &unk_1E52EBDD0;
  v4[4] = &v5;
  [(_UIRemoteKeyboards *)self performOnControllers:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)performOnControllers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = (void *)[(NSHashTable *)self->_windowControllers copy];
  int v6 = [(_UIRemoteKeyboards *)self keyboardWindow];
  uint64_t v7 = [v6 rootViewController];

  if (v7 && [v5 containsObject:v7]) {
    v4[2](v4, v7);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v5;
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
        if (*(void **)(*((void *)&v13 + 1) + 8 * v12) != v7) {
          ((void (*)(void (**)(id, void *)))v4[2])(v4);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)resetSnapshotWithWindowCheck:(BOOL)a3
{
  keyboardSnapshot = self->_keyboardSnapshot;
  if (keyboardSnapshot)
  {
    BOOL v5 = a3;
    [(UIView *)keyboardSnapshot removeFromSuperview];
    int v6 = self->_keyboardSnapshot;
    self->_keyboardSnapshot = 0;

    if (v5)
    {
      [(_UIRemoteKeyboards *)self completeMoveKeyboardForWindow:0];
    }
  }
}

- (void)updateCurrentState:(id)a3
{
  id v16 = a3;
  [v16 keyboardPosition];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v16 keyboardPositionWithIAV];
  if (!-[_UIRemoteKeyboards currentStateHasEqualRect:andIAVPosition:](self, "currentStateHasEqualRect:andIAVPosition:", v5, v7, v9, v11, v12, v13, v14, v15))[(_UIRemoteKeyboards *)self setDidSignalKeyboardChangedForCurrentKeyboard:0]; {
  [(_UIRemoteKeyboards *)self setCurrentState:v16];
  }
}

- (void)setCurrentState:(id)a3
{
}

- (void)setCurrentKeyboard:(BOOL)a3
{
  self->_currentKeyboard = a3;
}

- (void)reloadForSnapshotting
{
}

- (BOOL)isShowingPasswordAutofillPanel:(id)a3
{
  id v3 = a3;
  double v4 = +[UIKeyboardImpl activeInstance];
  if ([v4 _everPresentedPasswordAutofillPanel])
  {
    double v5 = [v3 hostBundleIdentifier];
    char v6 = [v5 isEqualToString:@"com.apple.InputUI"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)currentStateHasEqualRect:(CGRect)a3 andIAVPosition:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  double v13 = [(_UIRemoteKeyboards *)self currentState];
  [v13 keyboardPosition];
  v27.origin.CGFloat x = v14;
  v27.origin.CGFloat y = v15;
  v27.size.CGFloat width = v16;
  v27.size.CGFloat height = v17;
  v25.origin.CGFloat x = v11;
  v25.origin.CGFloat y = v10;
  v25.size.CGFloat width = v9;
  v25.size.CGFloat height = v8;
  if (CGRectEqualToRect(v25, v27))
  {
    uint64_t v18 = [(_UIRemoteKeyboards *)self currentState];
    [v18 keyboardPositionWithIAV];
    v28.origin.CGFloat x = v19;
    v28.origin.CGFloat y = v20;
    v28.size.CGFloat width = v21;
    v28.size.CGFloat height = v22;
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    BOOL v23 = CGRectEqualToRect(v26, v28);
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)oldPathForSnapshot
{
  if (+[UIKeyboard inputUIOOP]) {
    return 1;
  }
  if (!self->_takingSnapshot) {
    return 0;
  }
  return [(_UIRemoteKeyboards *)self sceneIsFullScreen];
}

- (void)applicationResumedEventsOnly:(id)a3
{
  if (!self->_windowEnabled) {
    [(_UIRemoteKeyboards *)self applicationWillResume:a3];
  }
}

- (void)sceneDidActivate:(id)a3
{
  id v9 = a3;
  -[_UIRemoteKeyboards clearKeyboardSceneIdentifierEnteringForeground:](self, "clearKeyboardSceneIdentifierEnteringForeground:");
  if ([(_UIRemoteKeyboards *)self currentKeyboard])
  {
    double v4 = [(_UIRemoteKeyboards *)self keyboardWindow];
    int v5 = [v4 isHidden];

    if (v5)
    {
      char v6 = [v9 object];
      double v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      CGFloat v8 = [v7 scene];

      if (v6 == v8) {
        [(_UIRemoteKeyboards *)self applicationDidBecomeActive:0];
      }
    }
  }
}

- (void)clearKeyboardSceneIdentifierEnteringForeground:(id)a3
{
  double v4 = [a3 object];
  keyboardSceneIdentifierEnteringForeground = self->_keyboardSceneIdentifierEnteringForeground;
  id v8 = v4;
  char v6 = [v4 _sceneIdentifier];
  LODWORD(keyboardSceneIdentifierEnteringForeground) = [(NSString *)keyboardSceneIdentifierEnteringForeground isEqualToString:v6];

  if (keyboardSceneIdentifierEnteringForeground)
  {
    double v7 = self->_keyboardSceneIdentifierEnteringForeground;
    self->_keyboardSceneIdentifierEnteringForeground = 0;
  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v9 = [a3 object];
  double v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v5 = [v4 scene];

  char v6 = v9;
  if (v9 == v5)
  {
    double v7 = [v9 _sceneIdentifier];
    keyboardSceneIdentifierEnteringForeground = self->_keyboardSceneIdentifierEnteringForeground;
    self->_keyboardSceneIdentifierEnteringForeground = v7;

    char v6 = v9;
  }
}

- (void)registerController:(id)a3
{
  id v4 = a3;
  if (([v4 conformsToProtocol:&unk_1ED5DE500] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Object does not implement expected protocol: %@", v4 format];
  }
  [(NSHashTable *)self->_windowControllers addObject:v4];
  [v4 setControllerDelegate:self];
}

- (void)applicationKeyWindowDidChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 16777472;
  id v5 = a3;
  char v6 = [v5 object];
  double v7 = [v5 userInfo];

  id v8 = [v7 objectForKey:@"Reason"];

  if (v8 && [v8 unsignedIntegerValue] == 1) {
    uint64_t v4 = 0;
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyboardFocus", &applicationKeyWindowDidChange____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    CGFloat v10 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      CGFloat v11 = v10;
      double v12 = _UIRemoteKeyboardsFBSSceneIdentityStringFromSettingsSceneOfWindow(v6);
      int v13 = 136315906;
      CGFloat v14 = "-[_UIRemoteKeyboards applicationKeyWindowDidChange:]";
      __int16 v15 = 2048;
      CGFloat v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2048;
      uint64_t v20 = [v8 unsignedIntegerValue];
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "%s: Application key window changed to window: %p; scene identity: %@; for reason: %lu",
        (uint8_t *)&v13,
        0x2Au);
    }
  }
  -[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:](self, v6, v4);
  +[UIKeyboardSceneDelegate performOnControllers:&__block_literal_global_629];
}

- (void)startConnection
{
  if (!+[UIKeyboard inputUIOOP])
  {
    id v3 = [(_UIRemoteKeyboards *)self connection];

    if (!v3)
    {
      if ([(id)UIApp _shouldAllowKeyboardArbiter])
      {
        [(_UIRemoteKeyboards *)self resetSnapshotWithWindowCheck:0];
        uint64_t v4 = +[UIDevice currentDevice];
        uint64_t v5 = [v4 userInterfaceIdiom];

        if ((unint64_t)(v5 - 2) >= 3)
        {
          char v6 = [(id)objc_opt_class() createArbiterConnection];
          objc_storeStrong((id *)&self->_connection, v6);
          double v7 = (void *)BSDispatchQueueCreateWithQualityOfService();
          [v6 _setQueue:v7];
          objc_initWeak(location, v6);
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          id v8 = &unk_1E52D9960;
          v22[2] = __37___UIRemoteKeyboards_startConnection__block_invoke;
          v22[3] = &unk_1E52D9960;
          objc_copyWeak(&v23, location);
          v22[4] = self;
          [v6 setInterruptionHandler:v22];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __37___UIRemoteKeyboards_startConnection__block_invoke_2;
          v20[3] = &unk_1E52D9960;
          objc_copyWeak(&v21, location);
          v20[4] = self;
          [v6 setInvalidationHandler:v20];
          [v6 setExportedObject:self];
          if (v6)
          {
            [v6 resume];
            uint64_t v18 = v7;
            self->_expectingInitialState = 1;
            self->_remoteIAVHeight = 0.0;
            id v9 = [(_UIRemoteKeyboards *)self requiredScene];
            CGFloat v10 = [(_UIRemoteKeyboards *)self proxy];
            BOOL v11 = [(_UIRemoteKeyboards *)self currentKeyboard];
            if (v11)
            {
              double v12 = [(_UIRemoteKeyboards *)self currentState];
            }
            else
            {
              double v12 = 0;
            }
            if (v9)
            {
              __int16 v17 = [v9 identityToken];
              id v8 = +[UIWindow _applicationKeyWindow];
              int v13 = +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:v17 window:v8];
            }
            else
            {
              int v13 = 0;
            }
            CGFloat v14 = [(_UIRemoteKeyboards *)self currentHostedPIDs];
            BOOL shouldFence = self->_shouldFence;
            BOOL expectedSuppression = self->_expectedSuppression;
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __37___UIRemoteKeyboards_startConnection__block_invoke_3;
            v19[3] = &unk_1E52FD770;
            v19[4] = self;
            [v10 startArbitrationWithExpectedState:v12 focusContext:v13 hostingPIDs:v14 usingFence:shouldFence withSuppression:expectedSuppression onConnected:v19];

            if (v9)
            {
            }
            if (v11) {

            }
            double v7 = v18;
          }
          objc_destroyWeak(&v21);
          objc_destroyWeak(&v23);
          objc_destroyWeak(location);
        }
      }
    }
  }
}

- (void)checkConnection
{
  id v3 = [(_UIRemoteKeyboards *)self connection];
  if (v3)
  {
  }
  else if ([(_UIRemoteKeyboards *)self allowedToShowKeyboard] {
         || ([(_UIRemoteKeyboards *)self keyboardWindow],
  }
             uint64_t v4 = objc_claimAutoreleasedReturnValue(),
             int v5 = [v4 _isHostedInAnotherProcess],
             v4,
             v5))
  {
    [(_UIRemoteKeyboards *)self startConnection];
  }
}

- (void)peekApplicationEvent:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_UIRemoteKeyboards *)self _usesInvisibleKeyboardBehindWTUI]
    && self->_showsInvisibleKeyboardBehindWTUI)
  {
    self->_dontSuppressKeyboardAgain = 1;
  }
  if (![v4 type])
  {
    [(_UIRemoteKeyboardsEventObserver *)self->_eventObserver peekApplicationEvent:v4];
    BOOL v5 = [(_UIRemoteKeyboards *)self _sceneFocusPermittedForApplication];
    char v6 = [v4 allTouches];
    double v7 = [v6 anyObject];

    if (v5 && ![v7 phase])
    {
      id v8 = [v7 view];
      id v9 = [v7 window];
      char v10 = [v9 _isRemoteKeyboardWindow];

      if (v10) {
        [v7 window];
      }
      else {
      BOOL v11 = [v8 _responderWindow];
      }
      double v12 = [v11 windowScene];
      int v13 = [v12 _FBSScene];
      CGFloat v14 = v13;
      if (v13)
      {
        __int16 v15 = [v13 identityToken];
        CGFloat v16 = [v15 stringRepresentation];
      }
      else
      {
        CGFloat v16 = [v12 _sceneIdentifier];
      }

      BOOL v17 = [(_UIRemoteKeyboards *)self _sceneFocusUpdatePermittedForWindow:v11];
      uint64_t v18 = [v8 _wantsTargetOfKeyboardEventDeferringEnvironment];
      if ((v10 & 1) == 0)
      {
        BOOL v19 = [v7 type] == 2;
        uint64_t v20 = +[UIDictationController activeInstance];
        [v20 cancelDictationForResponderIfNeeded:v8 wantsKeyboard:v18 isPencil:v19];
      }
      +[UIKeyboardSceneDelegate performOnControllers:&__block_literal_global_705];
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyboardFocus", &qword_1EB25C718);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        int v33 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v37 = "-[_UIRemoteKeyboards peekApplicationEvent:]";
          __int16 v38 = 1024;
          int v39 = v17;
          __int16 v40 = 2112;
          *(void *)v41 = v16;
          _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_ERROR, "%s: Update permitted: %d; for scene identity or identifier: %@",
            buf,
            0x1Cu);
        }
      }
      if (v17)
      {
        uint64_t v35 = v16;
        BOOL v22 = [(_UIRemoteKeyboards *)self keyboardVisible];
        int v23 = [v7 _isPointerTouch];
        unint64_t v24 = __UILogGetCategoryCachedImpl("KeyboardFocus", &qword_1EB25C720);
        if (*(unsigned char *)v24)
        {
          int v34 = *(NSObject **)(v24 + 8);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            v37 = "-[_UIRemoteKeyboards peekApplicationEvent:]";
            __int16 v38 = 1024;
            int v39 = !v22 | v23 | v18;
            __int16 v40 = 1024;
            *(_DWORD *)v41 = v22;
            *(_WORD *)&v41[4] = 1024;
            *(_DWORD *)&v41[6] = v18;
            __int16 v42 = 1024;
            int v43 = v23;
            __int16 v44 = 2112;
            int v45 = v16;
            _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "%s: Request scene focus: %d; keyboardOnScreen: %d; wantsKeyboard: %d; touchIsPointer: %d; for scene identi"
              "ty or identifier: %@",
              buf,
              0x2Eu);
          }
        }
        if (!v22 | v23 | v18)
        {
          uint64_t v25 = 0x100010001;
          if (v18 && ![v8 isFirstResponder]) {
            uint64_t v25 = 65537;
          }
          -[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:](self, v11, v25);
          CGRect v26 = [(_UIRemoteKeyboards *)self requiredScene];
          CGRect v27 = [v26 identityToken];

          uint64_t v28 = ([(_UIRemoteKeyboards *)self currentKeyboard] | v18) ^ 1;
          v29 = [(_UIRemoteKeyboards *)self proxy];
          uint64_t v30 = getpid();
          v31 = +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:v27 window:v11];
          [v29 focusApplicationWithProcessIdentifier:v30 context:v31 stealingKeyboard:v28 onCompletion:&__block_literal_global_709_0];

          if (([v11 _isApplicationKeyWindow] & 1) == 0)
          {
            [(_UIRemoteKeyboards *)self setUpdatingKeyWindow:1];
            [v11 makeKeyWindow];
            [(_UIRemoteKeyboards *)self setUpdatingKeyWindow:0];
          }
        }
        else
        {
          int v32 = [v11 windowScene];
          CGRect v27 = [v32 keyboardSceneDelegate];

          [v27 setKeyWindowCandidate:v11];
        }
        CGFloat v16 = v35;
      }
    }
  }
}

- (BOOL)allowedToShowKeyboard
{
  if ([(id)UIApp isSuspendedEventsOnly]) {
    int v3 = [(id)UIApp isSuspendedUnderLock] ^ 1;
  }
  else {
    int v3 = 0;
  }
  id v4 = [(_UIRemoteKeyboards *)self keyboardWindow];
  if (([v4 _isHostedInAnotherProcess] & 1) != 0
    || (([(id)UIApp isSuspended] ^ 1 | v3) & 1) != 0
    || +[UIKeyboardImpl isActivatingForeground])
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [(id)UIApp _isSpringBoard];
  }

  return v5;
}

- (BOOL)_sceneFocusPermittedForApplication
{
  int v3 = [(id)UIApp _shouldAllowKeyboardArbiter];
  if (v3)
  {
    LOBYTE(v3) = [(_UIRemoteKeyboards *)self allowedToShowKeyboard];
  }
  return v3;
}

- (void)_performRequiredSceneUpdateIfPermittedForWindow:(uint64_t)a3 withContext:
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    if ((a3 & 0x100) != 0) {
      int v6 = [a1 currentKeyboard] ^ 1;
    }
    else {
      int v6 = 1;
    }
    int v7 = [a1 isUpdatingKeyWindow];
    int v8 = v7 ^ 1;
    if ((v7 & 1) == 0 && (a3 & 1) == 0) {
      int v8 = [a1 _sceneFocusUpdatePermittedForWindow:v5] & v6;
    }
    uint64_t v9 = a3 & 0x1000000;
    uint64_t v10 = a3 & 0x100000000;
    unint64_t v11 = a3 & 0x10000;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyboardFocus", &qword_1EB25C6E0);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      int v34 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316930;
        __int16 v42 = "-[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:]";
        __int16 v43 = 1024;
        *(_DWORD *)__int16 v44 = v8;
        *(_WORD *)&v44[4] = 2048;
        *(void *)&v44[6] = v5;
        __int16 v45 = 1024;
        int v46 = a3 & 1;
        __int16 v47 = 1024;
        int v48 = (unint64_t)(a3 & 0x100) >> 8;
        __int16 v49 = 1024;
        int v50 = v11 >> 16;
        __int16 v51 = 1024;
        unsigned int v52 = (a3 & 0x1000000) >> 24;
        __int16 v53 = 1024;
        int v54 = (a3 & 0x100000000uLL) >> 32;
        _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "%s: Update is permitted: %d; for window: %p; forcingUpdate: %d; consideringCurrentKeyboard: %d; updateFocusedS"
          "ceneIdentityStringOrIdentifierIfNil: %d; updateProxyFocusContext: %d; notifyViewServiceHostIfNeeded: %d",
          buf,
          0x3Au);
      }
    }
    if (v8)
    {
      int v13 = [v5 windowScene];
      CGFloat v14 = [v13 _settingsScene];

      __int16 v15 = [v5 windowScene];
      CGFloat v16 = [v15 _settingsScene];

      BOOL v17 = [v16 _FBSScene];

      uint64_t v18 = [v17 identityToken];
      uint64_t v19 = [a1 focusedSceneIdentityStringOrIdentifier];
      BOOL v20 = (v19 | v11) == 0;
      if (!v5 || v17)
      {
        uint64_t v25 = [v18 stringRepresentation];
        unint64_t v26 = __UILogGetCategoryCachedImpl("KeyboardFocus", &qword_1EB25C6E8);
        if (*(unsigned char *)v26)
        {
          log = *(NSObject **)(v26 + 8);
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v42 = "-[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:]";
            __int16 v43 = 2112;
            *(void *)__int16 v44 = v25;
            _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "%s: Setting required scene: %@", buf, 0x16u);
          }
        }
        [a1 setRequiredScene:v17];
        if (!v20)
        {
          unint64_t v27 = __UILogGetCategoryCachedImpl("KeyboardFocus", &qword_1EB25C6F0);
          if (*(unsigned char *)v27)
          {
            uint64_t v35 = *(NSObject **)(v27 + 8);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              __int16 v42 = "-[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:]";
              __int16 v43 = 2112;
              *(void *)__int16 v44 = v25;
              _os_log_impl(&dword_1853B0000, v35, OS_LOG_TYPE_ERROR, "%s: Focusing scene identity: %@", buf, 0x16u);
            }
          }
          [a1 setFocusedSceneIdentityStringOrIdentifier:v25];
        }
        if (v9)
        {
          uint64_t v28 = +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:v18 window:v5];
          unint64_t v29 = __UILogGetCategoryCachedImpl("KeyboardFocus", &qword_1EB25C6F8);
          if (*(unsigned char *)v29)
          {
            v36 = *(NSObject **)(v29 + 8);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              __int16 v42 = "-[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:]";
              __int16 v43 = 2112;
              *(void *)__int16 v44 = v28;
              _os_log_impl(&dword_1853B0000, v36, OS_LOG_TYPE_ERROR, "%s: Updating proxy context: %@", buf, 0x16u);
            }
          }
          uint64_t v30 = [a1 proxy];
          [v30 setClientFocusContext:v28];
        }
      }
      else
      {
        if (v14) {
          BOOL v21 = (v19 | v11) == 0;
        }
        else {
          BOOL v21 = 1;
        }
        if (v21)
        {
LABEL_29:
          if (v10
            && ([v5 _isTextEffectsWindow] & 1) == 0
            && ([v5 _isRemoteKeyboardWindow] & 1) == 0)
          {
            int v39 = @"_UIRemoteKeyboardsHostedWindowUserInfoKey";
            id v40 = v5;
            int v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
            int v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v33 postNotificationName:@"_UIRemoteKeyboardsServiceWantsKeyboardFocusWithoutFirstResponderNotification" object:0 userInfo:v32];
          }
          goto LABEL_34;
        }
        BOOL v22 = [v14 _FBSScene];
        int v23 = v22;
        if (v22)
        {
          unint64_t v24 = [v22 identityToken];
          uint64_t v25 = [v24 stringRepresentation];
        }
        else
        {
          uint64_t v25 = [v14 _sceneIdentifier];
        }

        unint64_t v31 = __UILogGetCategoryCachedImpl("KeyboardFocus", &qword_1EB25C700);
        if (*(unsigned char *)v31)
        {
          v37 = *(NSObject **)(v31 + 8);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v42 = "-[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:]";
            __int16 v43 = 2112;
            *(void *)__int16 v44 = v25;
            _os_log_impl(&dword_1853B0000, v37, OS_LOG_TYPE_ERROR, "%s: Focusing scene identifier: %@", buf, 0x16u);
          }
        }
        [a1 setFocusedSceneIdentityStringOrIdentifier:v25];
      }

      goto LABEL_29;
    }
  }
LABEL_34:
}

- (BOOL)_sceneFocusUpdatePermittedForWindow:(id)a3
{
  id v4 = a3;
  if (v4
    && [(id)UIApp _systemShellAllowsInteractionTrackingKeyboardFocusUpdateForWindow:v4]
    && [(_UIRemoteKeyboards *)self _sceneFocusPermittedForApplication])
  {
    id v5 = [v4 windowScene];
    int v6 = v5;
    char v7 = 0;
    if (self)
    {
      int v8 = v5;
      if (!v5)
      {
LABEL_20:

LABEL_21:
        goto LABEL_17;
      }
      if ([(_UIRemoteKeyboards *)self _sceneFocusPermittedForApplication])
      {
        uint64_t v9 = [v6 _keyboardClientComponent];
        if ([v9 suppressKeyboardFocusRequests])
        {
LABEL_14:
          char v7 = 0;
          int v8 = v6;
LABEL_15:

          goto LABEL_20;
        }
        uint64_t v10 = +[UIWindowScene _keyWindowScene]();

        if (v10 == v6)
        {
        }
        else
        {
          unint64_t v11 = [v6 screen];
          if ((unint64_t)([v11 _userInterfaceIdiom] - 2) <= 2)
          {
LABEL_13:

            goto LABEL_14;
          }
          double v12 = +[_UIRemoteKeyboards keyboardWindowSceneForScreen:v11 create:0];
          int v13 = [v6 session];
          CGFloat v14 = [v13 role];
          char v15 = [v14 isEqualToString:@"UIWindowSceneSessionRoleExternalDisplayNonInteractive"];

          uint64_t v16 = [v6 activationState];
          uint64_t v17 = [v6 activationState];
          if (v12 && v12 == v6)
          {

            goto LABEL_13;
          }
          BOOL v27 = v16 == 1 || v17 == 0;

          char v7 = 0;
          if ((v15 & 1) != 0 || !v27) {
            goto LABEL_21;
          }
        }
        if (([v4 _isTextEffectsWindow] & 1) != 0
          || ([v4 _isRemoteKeyboardWindow] & 1) != 0
          || ([v4 windowScene],
              uint64_t v19 = objc_claimAutoreleasedReturnValue(),
              [v19 _FBSScene],
              BOOL v20 = objc_claimAutoreleasedReturnValue(),
              v20,
              v19,
              v20)
          || ![v4 _isHostedInAnotherProcess])
        {
          char isKindOfClass = 0;
        }
        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
        }
        int v22 = [v4 _canUpdateSceneFocus];
        if ((isKindOfClass & 1) == 0 && !v22 || ![v4 _appearsInLoupe])
        {
          char v7 = 0;
          goto LABEL_21;
        }
        int v8 = [(_UIRemoteKeyboards *)self focusedSceneIdentityStringOrIdentifier];
        int v23 = [v6 _FBSScene];
        unint64_t v24 = v23;
        if (v23)
        {
          uint64_t v25 = [v23 identityToken];
          uint64_t v9 = [v25 stringRepresentation];
        }
        else
        {
          uint64_t v9 = [v6 _sceneIdentifier];
        }

        BOOL v28 = [(_UIRemoteKeyboards *)self keyboardVisible];
        if (v8) {
          int v29 = BSEqualStrings() ^ 1;
        }
        else {
          LOBYTE(v29) = 1;
        }
        id v30 = +[UIWindow _applicationKeyWindow];

        if (isKindOfClass)
        {
          char v31 = BSEqualStrings();
          if (v30 == v4) {
            char v32 = 0;
          }
          else {
            char v32 = v31;
          }
        }
        else
        {
          char v32 = 0;
        }
        if (v28) {
          char v7 = v29 | v32;
        }
        else {
          char v7 = 1;
        }
        goto LABEL_15;
      }
      char v7 = 0;
    }
    int v8 = v6;
    goto LABEL_20;
  }
  char v7 = 0;
LABEL_17:

  return v7;
}

- (BOOL)isUpdatingKeyWindow
{
  return self->_updatingKeyWindow;
}

- (_UIKeyboardArbitration)proxy
{
  char v2 = [(_UIRemoteKeyboards *)self connection];
  int v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_405_0];

  return (_UIKeyboardArbitration *)v3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 232, 1);
}

- (NSString)focusedSceneIdentityStringOrIdentifier
{
  return self->_focusedSceneIdentityStringOrIdentifier;
}

- (void)setRequiredScene:(id)a3
{
}

- (void)_updateEventSource:(int64_t)keyboardSource options:(unint64_t)a4 responder:(id)a5
{
  char v5 = a4;
  id v8 = a5;
  if (keyboardSource)
  {
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ((v5 & 8) != 0)
  {
LABEL_6:
    self->_keyboardSource = keyboardSource;
    goto LABEL_7;
  }
  keyboardSource = self->_keyboardSource;
LABEL_7:
  if ((v5 & 0x10) == 0 && self->_lastEventSource == keyboardSource) {
    goto LABEL_14;
  }
  self->_lastEventSource = keyboardSource;
  id v11 = v8;
  if ((v5 & 1) == 0)
  {
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
LABEL_18:
    uint64_t v10 = [(_UIRemoteKeyboards *)self proxy];
    [v10 signalEventSourceChanged:keyboardSource completionHandler:&__block_literal_global_702];

    id v8 = v11;
    if ((v5 & 1) == 0)
    {
LABEL_12:
      if ((v5 & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    goto LABEL_19;
  }
  +[UIScribbleInteraction _lastEventSourceChanged:keyboardSource];
  id v8 = v11;
  if ((v5 & 4) != 0) {
    goto LABEL_18;
  }
LABEL_11:
  if ((v5 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_19:
  [(_UIRemoteKeyboards *)self _postInputSourceDidChangeNotificationForResponder:v11];
  id v8 = v11;
  if ((v5 & 2) != 0)
  {
LABEL_13:
    uint64_t v9 = +[UIKeyboardImpl activeInstance];
    [v9 _suppressSoftwareKeyboardStateChangedIgnoringPolicyDelegate:0];

    id v8 = v11;
  }
LABEL_14:
}

- (void)_updateEventSource:(int64_t)a3 options:(unint64_t)a4
{
}

- (FBSScene)requiredScene
{
  char v2 = self->_requiredScene;
  int v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v4 = v3;
  if (!v2)
  {
    char v5 = [v3 scene];
    char v2 = [v5 _FBSScene];

    if (!v2)
    {
      int v6 = [v4 responder];
      char v7 = [v6 _responderWindow];
      id v8 = [v7 windowScene];
      uint64_t v9 = [v8 _settingsScene];
      char v2 = [v9 _FBSScene];
    }
  }

  return v2;
}

- (NSArray)currentHostedPIDs
{
  char v2 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_activePIDs];
  int v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)_postInputSourceDidChangeNotificationForResponder:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4
    || (+[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate"), v5 = objc_claimAutoreleasedReturnValue(), [v5 responder], id v4 = (id)objc_claimAutoreleasedReturnValue(), v5, v4))
  {
    v15[0] = @"UITextInputSourceDidChangeInputSourceKey";
    int v6 = [NSNumber numberWithInteger:self->_lastEventSource];
    v15[1] = @"UITextInputResponderCapabilitiesChangedInputResponderKey";
    v16[0] = v6;
    v16[1] = v4;
    char v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = (void **)v16;
    uint64_t v9 = (__CFString **)v15;
    uint64_t v10 = 2;
  }
  else
  {
    int v13 = @"UITextInputSourceDidChangeInputSourceKey";
    int v6 = [NSNumber numberWithInteger:self->_lastEventSource];
    CGFloat v14 = v6;
    char v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = &v14;
    uint64_t v9 = &v13;
    uint64_t v10 = 1;
  }
  id v11 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:v10];

  double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"UITextInputSourceDidChangeNotification" object:0 userInfo:v11];
}

+ (id)createArbiterConnection
{
  int v2 = [a1 useSystemService];
  id v3 = objc_alloc(MEMORY[0x1E4F29268]);
  id v4 = v3;
  if (v2)
  {
    char v5 = +[_UIRemoteKeyboards serviceName];
    int v6 = (void *)[v4 initWithMachServiceName:v5 options:4096];
  }
  else
  {
    int v6 = (void *)[v3 initWithServiceName:@"com.apple.UIKit.KeyboardManagement"];
  }
  char v7 = _UIKeyboardArbitration_Interface();
  [v6 setRemoteObjectInterface:v7];

  id v8 = _UIKeyboardArbitrationClient_Interface();
  [v6 setExportedInterface:v8];

  return v6;
}

+ (BOOL)useSystemService
{
  BOOL result = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference__UIRemoteKeyboardsUseSystemService, @"_UIRemoteKeyboardsUseSystemService");
  if (byte_1EB2576DC) {
    return 1;
  }
  return result;
}

+ (id)serviceName
{
  if (qword_1EB25C6B8 != -1) {
    dispatch_once(&qword_1EB25C6B8, &__block_literal_global_415_0);
  }
  int v2 = (void *)qword_1EB25C6B0;
  return v2;
}

- (BOOL)hasWindowHostingCallerID:(id)a3
{
  if (a3) {
    return -[NSMutableArray containsObject:](self->_activeCIDs, "containsObject:");
  }
  else {
    return [(_UIRemoteKeyboards *)self hasAnyHostedViews];
  }
}

- (void)controllerDidLayoutSubviews:(id)a3
{
  id v4 = a3;
  if (self->_ignoreLayoutSubviews <= 0 && [(_UIRemoteKeyboards *)self currentKeyboard])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50___UIRemoteKeyboards_controllerDidLayoutSubviews___block_invoke;
    v5[3] = &unk_1E52D9F98;
    v5[4] = self;
    id v6 = v4;
    [(_UIRemoteKeyboards *)self ignoreLayoutNotifications:v5];
  }
}

- (void)applicationWillResume:(id)a3
{
  id v4 = a3;
  if (!self->_enqueuedWillEnterForegroundActions)
  {
    self->_enqueuedWillEnterForegroundActions = 1;
    char v5 = [(id)UIApp _systemAnimationFenceExemptQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44___UIRemoteKeyboards_applicationWillResume___block_invoke;
    v6[3] = &unk_1E52D9F98;
    v6[4] = self;
    id v7 = v4;
    [v5 performAsync:v6];
  }
}

- (BOOL)remoteKeyboardUndocked:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIRemoteKeyboards *)self currentKeyboard] && !v3
    || ![(_UIRemoteKeyboards *)self keyboardVisible])
  {
    return 0;
  }
  char v5 = [(_UIRemoteKeyboards *)self currentState];
  [v5 keyboardPosition];
  BOOL v7 = v6 != 0.0;

  return v7;
}

- (BOOL)handlingRemoteEvent
{
  return self->_handlingRemoteEvent;
}

- (void)applicationKeyWindowWillChange:(id)a3
{
  id v4 = a3;
  char v5 = [(_UIRemoteKeyboards *)self keyboardWindow];

  if (v5)
  {
    int v6 = [(id)UIApp isFrontBoard];
    BOOL v7 = [v4 object];
    id v8 = v7;
    if (v6) {
      uint64_t v9 = [v7 _overriddenInterfaceOrientation];
    }
    else {
      uint64_t v9 = [v7 interfaceOrientation];
    }
    uint64_t v10 = v9;
    id v11 = +[UIWindow _applicationKeyWindow];
    double v12 = v11;
    if (v6)
    {
      uint64_t v13 = [v11 _overriddenInterfaceOrientation];
      if (!v8) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v13 = [v11 interfaceOrientation];
      if (!v8)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    if (!v12 || v10 != v13)
    {
      CGFloat v14 = [(_UIRemoteKeyboards *)self keyboardWindow];
      uint64_t v15 = [v14 interfaceOrientation];

      if (v15 != v10)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __53___UIRemoteKeyboards_applicationKeyWindowWillChange___block_invoke;
        block[3] = &unk_1E52DC3D0;
        char v19 = v6;
        id v17 = v8;
        uint64_t v18 = self;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
    goto LABEL_13;
  }
LABEL_14:
}

- (void)checkState
{
  if ([(id)UIApp _shouldAllowKeyboardArbiter])
  {
    [(_UIRemoteKeyboards *)self checkConnection];
  }
  else
  {
    BOOL v3 = [(_UIRemoteKeyboards *)self connection];

    if (v3)
    {
      [(_UIRemoteKeyboards *)self stopConnection];
    }
  }
}

- (void)applicationDidBecomeActive:(id)a3 forceSignalToProxy:(BOOL)a4
{
  id v12 = a3;
  if (a4 || [(_UIRemoteKeyboards *)self currentKeyboard] && !self->_deactivatedByControlCenter)
  {
    int v6 = [(_UIRemoteKeyboards *)self backupState];
    BOOL v7 = v6;
    if (v6)
    {
      id v8 = (void *)[v6 copyWithIntersectability:1];
    }
    else
    {
      uint64_t v9 = [(_UIRemoteKeyboards *)self currentState];
      id v8 = (void *)[v9 copyWithIntersectability:1];
    }
    [v8 setShouldTakeSnapshot:0];
    [(_UIRemoteKeyboards *)self signalToProxyKeyboardChanged:v8 onCompletion:&__block_literal_global_720];
    uint64_t v10 = [(_UIRemoteKeyboards *)self keyboardWindow];
    char v11 = [v10 _isHostedInAnotherProcess];

    if ((v11 & 1) == 0) {
      [(_UIRemoteKeyboards *)self setWindowEnabled:1];
    }
  }
  self->_deactivatedByControlCenter = 0;
}

- (void)dealloc
{
  v6[14] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UISceneDidDisconnectNotification";
  v6[1] = @"UIApplicationWillEnterForegroundNotification";
  v6[2] = @"UIApplicationDidEnterBackgroundNotification";
  v6[3] = @"UIApplicationWillResignActiveNotification";
  v6[4] = @"UIApplicationDidBecomeActiveNotification";
  void v6[5] = @"_UIApplicationWillAddDeactivationReasonNotification";
  v6[6] = @"_UIApplicationDidRemoveDeactivationReasonNotification";
  v6[7] = @"UIApplicationResumedEventsOnlyNotification";
  v6[8] = @"_UIWindowWillBecomeApplicationKeyNotification";
  v6[9] = @"_UIWindowDidBecomeApplicationKeyNotification";
  v6[10] = @"UISceneWillEnterForegroundNotification";
  v6[11] = @"UISceneDidEnterBackgroundNotification";
  v6[12] = @"UISceneDidActivateNotification";
  v6[13] = @"_UISystemApplicationWillLockNotification";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:14];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  [(_UIRemoteKeyboards *)self stopConnection];
  [(_UIRemoteKeyboards *)self resetSnapshotWithWindowCheck:0];
  v5.receiver = self;
  v5.super_class = (Class)_UIRemoteKeyboards;
  [(_UIRemoteKeyboards *)&v5 dealloc];
}

- (void)signalToProxyKeyboardChanged:(id)a3 onCompletion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = KeyboardArbiterClientLog_1();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "-[_UIRemoteKeyboards signalToProxyKeyboardChanged:onCompletion:]  Signaling keyboard changed %@", (uint8_t *)&v11, 0xCu);
  }

  [(_UIRemoteKeyboards *)self setDidSignalKeyboardChangedForCurrentKeyboard:1];
  uint64_t v9 = _UIMainBundleIdentifier();
  [v6 setSourceBundleIdentifier:v9];

  [(_UIRemoteKeyboards *)self updateLocalKeyboardChanged:v6];
  uint64_t v10 = [(_UIRemoteKeyboards *)self proxy];
  [v10 signalKeyboardChanged:v6 onCompletion:v7];
}

- (void)updateLocalKeyboardChanged:(id)a3
{
  BOOL v3 = (void *)[a3 copyWithoutFence];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49___UIRemoteKeyboards_updateLocalKeyboardChanged___block_invoke;
  v5[3] = &unk_1E52E9EE0;
  id v6 = v3;
  id v4 = v3;
  +[UIKeyboardSceneDelegate performOnControllers:v5];
}

- (void)assertNeedsAutofillUI
{
  if (+[UIKeyboard usesInputSystemUIForAutoFillOnly])
  {
    BOOL v3 = [(_UIRemoteKeyboards *)self currentKeyboard];
    id v4 = _UIKeyboardExtendedLog();
    objc_super v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Requesting scene for autofill UI", v6, 2u);
      }

      objc_super v5 = [(_UIRemoteKeyboards *)self proxy];
      [v5 signalAutofillUIBringupWithCompletion:&__block_literal_global_412_0];
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "Requesting scene for autofill UI: request is pending -- not yet the current keyboard", buf, 2u);
    }

    [(_UIRemoteKeyboards *)self setPendingAutofillRequest:!v3];
  }
}

- (void)restoreKeyboardIfNeeded
{
  if ([(_UIRemoteKeyboards *)self _usesInvisibleKeyboardBehindWTUI]
    && self->_dontSuppressKeyboardAgain)
  {
    goto LABEL_5;
  }
  uint64_t v3 = [(_UIRemoteKeyboards *)self keyboardWindow];
  if (v3)
  {
    id v4 = (void *)v3;
    objc_super v5 = [(_UIRemoteKeyboards *)self currentState];
    BOOL v6 = [(_UIRemoteKeyboards *)self isShowingPasswordAutofillPanel:v5];

    if (v6)
    {
LABEL_5:
      *(_WORD *)&self->_dontSuppressKeyboardAgain = 0;
      [(_UIRemoteKeyboards *)self applicationDidBecomeActive:0 forceSignalToProxy:1];
    }
  }
}

- (void)queue_activeProcessResignWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62___UIRemoteKeyboards_queue_activeProcessResignWithCompletion___block_invoke;
  v7[3] = &unk_1E52DA160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performAsync:v7];
}

- (void)queue_failedConnection:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 interruptionHandler];
  id v6 = [v4 invalidationHandler];
  [v4 setInterruptionHandler:0];
  [v4 setInvalidationHandler:0];
  id v7 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45___UIRemoteKeyboards_queue_failedConnection___block_invoke;
  v9[3] = &unk_1E52D9F98;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 performAsync:v9];
}

- (void)setShouldFence:(BOOL)a3
{
  if (self->_shouldFence != a3)
  {
    self->_BOOL shouldFence = a3;
    id v4 = [(_UIRemoteKeyboards *)self proxy];
    [v4 setWantsFencing:self->_shouldFence];
  }
}

- (unint64_t)localSceneCount
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = +[UIScene _scenesIncludingInternal:1];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v9 = [v8 keyboardSceneDelegate];

          if (v9) {
            ++v5;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)addIgnoredSceneIdentityTokenString:(id)a3
{
  if (a3) {
    -[NSMutableSet addObject:](self->_ignoredSceneIdentityTokenStringSet, "addObject:");
  }
}

- (void)removeIgnoredSceneIdentityTokenString:(id)a3
{
  if (a3) {
    -[NSMutableSet removeObject:](self->_ignoredSceneIdentityTokenStringSet, "removeObject:");
  }
}

- (BOOL)_isArbiterClientReadyForWritingToolsToHandleKeyboardTracking
{
  return 1;
}

- (BOOL)_isWritingToolsReadyToHandleKeyboardTracking
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  int v2 = (void *)qword_1EB25C760;
  uint64_t v9 = qword_1EB25C760;
  if (!qword_1EB25C760)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getWTWritingToolsControllerClass_block_invoke;
    v5[3] = &unk_1E52D9900;
    void v5[4] = &v6;
    __getWTWritingToolsControllerClass_block_invoke((uint64_t)v5);
    int v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    return [(id)objc_opt_class() _isWritingToolsReadyToHandleKeyboardTracking];
  }
  else {
    return 0;
  }
}

- (BOOL)_isWritingToolsHandlingKeyboardTracking
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61___UIRemoteKeyboards__isWritingToolsHandlingKeyboardTracking__block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = self;
  if (qword_1EB25C6C0 != -1) {
    dispatch_once(&qword_1EB25C6C0, block);
  }
  return byte_1EB25C66B;
}

- (BOOL)_usesInvisibleKeyboardBehindWTUI
{
  return ![(_UIRemoteKeyboards *)self _isWritingToolsHandlingKeyboardTracking];
}

- (BOOL)showsInvisibleKeyboardBehindWTUI
{
  BOOL v3 = [(_UIRemoteKeyboards *)self _usesInvisibleKeyboardBehindWTUI];
  if (v3) {
    LOBYTE(v3) = self->_showsInvisibleKeyboardBehindWTUI;
  }
  return v3;
}

- (void)toggleSuppressionForWritingToolIfNeeded
{
  if (![(_UIRemoteKeyboards *)self _usesInvisibleKeyboardBehindWTUI]) {
    return;
  }
  self->_showsInvisibleKeyboardBehindWTUI = 0;
  BOOL v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v17 = [v3 responder];

  if ([v17 _isWritingToolsActive])
  {
    uint64_t v4 = [(_UIRemoteKeyboards *)self currentState];
    unint64_t v5 = [v4 hostBundleIdentifier];
    if ([v5 isEqualToString:@"com.apple.WritingToolsUIService"])
    {

      goto LABEL_7;
    }
    uint64_t v6 = [(_UIRemoteKeyboards *)self currentState];
    id v7 = [v6 sourceBundleIdentifier];
    int v8 = [v7 isEqualToString:@"com.apple.WritingToolsUIService"];

    if (v8)
    {
LABEL_7:
      [(_UIRemoteKeyboards *)self setCurrentKeyboard:1];
      uint64_t v9 = [(_UIRemoteKeyboards *)self currentState];
      int v10 = [v9 keyboardOnScreen];

      if (v10)
      {
        self->_showsInvisibleKeyboardBehindWTUI = 1;
        if ([v17 _writingToolsWantsKeyboardSuppression])
        {
          long long v11 = v17;
          uint64_t v12 = 0;
LABEL_10:
          [v11 _setWritingToolsWantsKeyboardSuppression:v12];
          goto LABEL_19;
        }
        uint64_t v15 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        long long v13 = [v15 containerRootController];

        if ([v13 isTransitioning])
        {
          [v13 addPendingActivity:&__block_literal_global_447];
        }
        else
        {
          uint64_t v16 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
          [v16 forceReloadInputViews];
        }
      }
      else
      {
        if (self->_dontSuppressKeyboardAgain) {
          goto LABEL_19;
        }
        long long v13 = [(_UIRemoteKeyboards *)self currentState];
        if (![v13 keyboardOnScreen])
        {
          char v14 = [v17 _writingToolsWantsKeyboardSuppression];

          if (v14) {
            goto LABEL_19;
          }
          long long v11 = v17;
          uint64_t v12 = 1;
          goto LABEL_10;
        }
      }
    }
  }
LABEL_19:
}

- (void)keyboardChangedCompleted
{
  id v7 = [(_UIRemoteKeyboards *)self currentState];
  BOOL v3 = [v7 sourceBundleIdentifier];
  if ([v3 isEqualToString:@"com.apple.siri"])
  {
  }
  else
  {
    ignoredSceneIdentityTokenStringSet = self->_ignoredSceneIdentityTokenStringSet;
    unint64_t v5 = [(_UIRemoteKeyboards *)self currentState];
    uint64_t v6 = [v5 sourceSceneIdentityString];
    LOBYTE(ignoredSceneIdentityTokenStringSet) = [(NSMutableSet *)ignoredSceneIdentityTokenStringSet containsObject:v6];

    if ((ignoredSceneIdentityTokenStringSet & 1) == 0)
    {
      [(_UIRemoteKeyboards *)self resetSnapshotWithWindowCheck:1];
    }
  }
}

- (void)queue_keyboardUIDidChange:(id)a3 onComplete:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)queue_endInputSessionWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)queue_keyboardChanged:(id)a3 onComplete:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = +[UIKeyboardVisualModeManager visualModeLog];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    id v17 = self;
    __int16 v18 = 2048;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_debug_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEBUG, "queue_keyboardChanged (self: %p, info: %p), %@", buf, 0x20u);
  }

  uint64_t v9 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55___UIRemoteKeyboards_queue_keyboardChanged_onComplete___block_invoke;
  v12[3] = &unk_1E52E3298;
  id v13 = v6;
  char v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 performAsync:v12];
}

- (void)queue_keyboardChangedWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58___UIRemoteKeyboards_queue_keyboardChangedWithCompletion___block_invoke;
  v7[3] = &unk_1E52DA160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performAsync:v7];
}

- (void)queue_keyboardIAVChanged:(double)a3 onComplete:(id)a4
{
  id v6 = (void (**)(void))a4;
  if ([(id)UIApp _isSpringBoard])
  {
    id v7 = [(id)UIApp _systemAnimationFenceExemptQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58___UIRemoteKeyboards_queue_keyboardIAVChanged_onComplete___block_invoke;
    v8[3] = &unk_1E52DC8B0;
    v8[4] = self;
    double v10 = a3;
    uint64_t v9 = v6;
    [v7 performAsync:v8];
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

- (void)queue_sceneBecameFocused:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62___UIRemoteKeyboards_queue_sceneBecameFocused_withCompletion___block_invoke;
  v11[3] = &unk_1E52E3298;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performAsync:v11];
}

- (void)queue_getDebugInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = [(id)UIApp _systemAnimationFenceExemptQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55___UIRemoteKeyboards_queue_getDebugInfoWithCompletion___block_invoke;
    v6[3] = &unk_1E52DA160;
    v6[4] = self;
    id v7 = v4;
    [v5 performAsync:v6];
  }
}

- (void)stopConnection
{
  BOOL v3 = [(_UIRemoteKeyboards *)self connection];
  [v3 setInvalidationHandler:0];

  id v4 = [(_UIRemoteKeyboards *)self connection];
  [v4 setInterruptionHandler:0];

  unint64_t v5 = [(_UIRemoteKeyboards *)self connection];
  [v5 invalidate];

  connection = self->_connection;
  self->_connection = 0;

  [(_UIRemoteKeyboards *)self cleanSuppression];
}

- (void)cleanSuppression
{
  if (self->_externalSuppression >= 1)
  {
    do
    {
      BOOL v3 = +[UIPeripheralHost sharedInstance];
      [v3 setDeactivatedKeyboard:0 forScene:0];

      int externalSuppression = self->_externalSuppression;
      BOOL v5 = __OFSUB__(externalSuppression--, 1);
      self->_int externalSuppression = externalSuppression;
    }
    while (!((externalSuppression < 0) ^ v5 | (externalSuppression == 0)));
  }
  +[UIKeyboardSceneDelegate performOnControllers:&__block_literal_global_614_0];
}

- (void)setSnapshotting:(BOOL)a3
{
  int v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int takingSnapshot = self->_takingSnapshot;
  self->_int takingSnapshot = a3;
  id v6 = _UIMainBundleIdentifier();
  char v7 = [v6 isEqualToString:@"com.apple.Spotlight"];

  if ((v7 & 1) == 0) {
    [(_UIRemoteKeyboards *)self reloadForSnapshotting];
  }
  if (takingSnapshot != v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 0, 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v13 _isTextEffectsWindow]) {
            [v13 _updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)sceneUpdated
{
  if (self->_takingSnapshot) {
    [(_UIRemoteKeyboards *)self reloadForSnapshotting];
  }
}

- (BOOL)sceneIsFullScreen
{
  int v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  int v3 = [v2 scene];
  id v4 = [v3 _FBSScene];

  BOOL v5 = [v4 settings];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = +[UIScreen mainScreen];
  [v10 _referenceBounds];
  BOOL v13 = v9 == v12 && v7 == v11;

  return v13;
}

- (void)setWindowEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(_UIRemoteKeyboards *)self hasAnyHostedViews]
    || !self->_handlingRemoteEvent
    || self->_handlingViewServiceEvent)
  {
    [(_UIRemoteKeyboards *)self setWindowEnabled:v3 force:0];
  }
}

- (void)setWindowEnabled:(BOOL)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (![(_UIRemoteKeyboards *)self _usesInvisibleKeyboardBehindWTUI]
    || !self->_showsInvisibleKeyboardBehindWTUI)
  {
    if (v5) {
      BOOL v5 = [(_UIRemoteKeyboards *)self allowedToEnableKeyboardWindow];
    }
    if (v5 && v4) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = v5;
    }
    double v8 = [(_UIRemoteKeyboards *)self requiredScene];
    double v9 = [v8 identityToken];

    uint64_t v10 = off_1E52FD830[v7];
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyboardFocus", &setWindowEnabled_force____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      __int16 v20 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = v20;
        uint64_t v22 = [v9 stringRepresentation];
        int v23 = 136315650;
        unint64_t v24 = "-[_UIRemoteKeyboards setWindowEnabled:force:]";
        __int16 v25 = 2080;
        unint64_t v26 = v10;
        __int16 v27 = 2112;
        BOOL v28 = v22;
        _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "%s: Setting window state: %s for scene identity: %@", (uint8_t *)&v23, 0x20u);
      }
    }
    double v12 = +[UIWindow _applicationKeyWindow];
    BOOL v13 = +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:v9 window:v12];

    long long v14 = [(_UIRemoteKeyboards *)self proxy];
    long long v15 = [(_UIRemoteKeyboards *)self keyboardWindow];
    objc_msgSend(v14, "setWindowContextID:focusContext:windowState:withLevel:", objc_msgSend(v15, "_contextId"), v13, v7, self->_requiredLevel);

    long long v16 = [(_UIRemoteKeyboards *)self keyboardWindow];
    [v16 setHidden:v5 ^ 1];

    if (self->_windowEnabled != v5)
    {
      self->_windowEnabled = v5;
      long long v17 = +[UIKeyboardImpl activeInstance];
      __int16 v18 = [v17 inputModeIndicatorController];
      [v18 keyboardWindowEnabled:v5];
    }
    if (v5)
    {
      uint64_t v19 = [(_UIRemoteKeyboards *)self keyboardWindow];
      [v19 _matchDeviceOrientation];
    }
  }
}

- (void)_lostWindow:(id)a3
{
  id v10 = a3;
  BOOL v4 = [v10 _screen];
  BOOL v5 = +[UIScreen mainScreen];

  if (v4 != v5)
  {
    double v6 = +[UIKeyboardImpl activeInstance];
    [v6 updateLayout];
  }
  lastScreen = self->_lastScreen;
  double v8 = [v10 _screen];

  if (lastScreen == v8)
  {
    double v9 = self->_lastScreen;
    self->_lastScreen = 0;
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = [v4 object];

    if (v6 && [(UIScene *)v6 _hasInvalidated])
    {
      if (v6 == self->_suppressedScene)
      {
        self->_suppressedScene = 0;
      }
      uint64_t v7 = [(_UIRemoteKeyboards *)self requiredScene];
      double v8 = v7;
      if (v7)
      {
        double v9 = [v7 identityToken];
        id v10 = [v9 stringRepresentation];
      }
      else
      {
        id v10 = [(_UIRemoteKeyboards *)self focusedSceneIdentityStringOrIdentifier];
      }
      double v11 = [(UIScene *)v6 _FBSScene];
      double v12 = v11;
      if (v11)
      {
        BOOL v13 = [v11 identityToken];
        long long v14 = [v13 stringRepresentation];
      }
      else
      {
        long long v14 = [(UIScene *)v6 _sceneIdentifier];
      }

      unsigned int v15 = BSEqualStrings();
      long long v16 = +[UIWindowScene _keyWindowScene]();
      int v17 = [v16 _isTargetOfKeyboardEventDeferringEnvironment];

      if ((v15 & 1) != 0 || v17)
      {
        __int16 v18 = [(_UIRemoteKeyboards *)self keyboardWindow];
        BOOL v19 = [(_UIRemoteKeyboards *)self wantsToShowKeyboardForWindow:v18];

        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyboardFocus", &sceneDidDisconnect____s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          int v23 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            unint64_t v24 = v23;
            int v25 = 136316418;
            unint64_t v26 = "-[_UIRemoteKeyboards sceneDidDisconnect:]";
            __int16 v27 = 2112;
            BOOL v28 = v14;
            __int16 v29 = 1024;
            unsigned int v30 = v15;
            __int16 v31 = 1024;
            BOOL v32 = v19;
            __int16 v33 = 1024;
            BOOL v34 = [(_UIRemoteKeyboards *)self currentKeyboard];
            __int16 v35 = 1024;
            BOOL v36 = [(_UIRemoteKeyboards *)self keyboardVisible];
            _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "%s: Performing required scene update for disconnecting scene: %@; needsUpdateToNil: %d; wantsToShowKeyboar"
              "dForWindow: %d; hasCurrentKeyboard: %d; keyboardVisible: %d",
              (uint8_t *)&v25,
              0x2Eu);
          }
        }
        if (v15)
        {
          id v21 = 0;
          uint64_t v22 = 0x1000000;
        }
        else
        {
          id v21 = +[UIWindow _applicationKeyWindow];
          uint64_t v22 = 16777472;
        }
        -[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:](self, v21, v22 | v15);
      }
    }
  }
  else
  {

    double v6 = 0;
  }
}

- (void)applicationDidSuspend:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(_UIRemoteKeyboards *)self _usesInvisibleKeyboardBehindWTUI]
    && self->_showsInvisibleKeyboardBehindWTUI)
  {
    self->_dontSuppressKeyboardAgain = 1;
    [(_UIRemoteKeyboards *)self restoreKeyboardIfNeeded];
  }
  id v4 = [(_UIRemoteKeyboards *)self keyboardWindow];
  BOOL v5 = [(_UIRemoteKeyboards *)self wantsToShowKeyboardForWindow:v4];

  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyboardFocus", &applicationDidSuspend____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    unsigned int v15 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v16 = v15;
      *(_DWORD *)buf = 136315906;
      unint64_t v24 = "-[_UIRemoteKeyboards applicationDidSuspend:]";
      __int16 v25 = 1024;
      BOOL v26 = v5;
      __int16 v27 = 1024;
      BOOL v28 = [(_UIRemoteKeyboards *)self currentKeyboard];
      __int16 v29 = 1024;
      BOOL v30 = [(_UIRemoteKeyboards *)self keyboardVisible];
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "%s: wantsToShowKeyboardForWindow: %d; hasCurrentKeyboard: %d; keyboardVisible: %d",
        buf,
        0x1Eu);
    }
  }
  if (v5)
  {
    uint64_t v7 = [(_UIRemoteKeyboards *)self keyboardWindow];
    char v8 = [v7 _isHostedInAnotherProcess];

    if ((v8 & 1) == 0) {
      [(_UIRemoteKeyboards *)self setWindowEnabled:0];
    }
  }
  uint64_t v9 = [(id)UIApp _beginBackgroundTaskWithName:@"_UIRemoteKeyboard XPC disconnection" expirationHandler:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44___UIRemoteKeyboards_applicationDidSuspend___block_invoke;
  aBlock[3] = &unk_1E52D9CD0;
  aBlock[4] = self;
  aBlock[5] = v9;
  id v10 = _Block_copy(aBlock);
  connection = self->_connection;
  if (connection)
  {
    self->_connection = 0;
    double v12 = connection;

    [(NSXPCConnection *)v12 setInterruptionHandler:0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __44___UIRemoteKeyboards_applicationDidSuspend___block_invoke_2;
    v20[3] = &unk_1E52DA040;
    id v21 = v10;
    [(NSXPCConnection *)v12 setInvalidationHandler:v20];
    [(NSXPCConnection *)v12 invalidate];
  }
  BOOL v13 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __44___UIRemoteKeyboards_applicationDidSuspend___block_invoke_3;
  v17[3] = &unk_1E52E3538;
  BOOL v19 = connection != 0;
  v17[4] = self;
  id v18 = v10;
  id v14 = v10;
  [v13 performAsync:v17];
}

- (void)performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    BOOL v3 = [a2 keyWindowCandidate];
    id v4 = v3;
    if (v3)
    {
      BOOL v5 = [v3 windowScene];
      double v6 = [v5 _settingsScene];

      uint64_t v7 = [v6 _FBSScene];

      char v8 = [v7 identityToken];
      uint64_t v9 = [v8 stringRepresentation];

      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyboardFocus", &performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        double v11 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v12 = 136315650;
          BOOL v13 = "-[_UIRemoteKeyboards performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate:]";
          __int16 v14 = 2048;
          unsigned int v15 = v4;
          __int16 v16 = 2112;
          int v17 = v9;
          _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "%s: Performing required scene update for candidate window: %p; scene: %@",
            (uint8_t *)&v12,
            0x20u);
        }
      }
      -[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:](a1, v4, 0);
    }
  }
}

- (BOOL)needsToShowKeyboardForWindow:(id)a3
{
  id v4 = a3;
  if ([(_UIRemoteKeyboards *)self allowedToShowKeyboard]) {
    BOOL v5 = [(_UIRemoteKeyboards *)self wantsToShowKeyboardForWindow:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)needsToShowKeyboardForViewServiceHostWindow:(id)a3
{
  id v4 = a3;
  if ([(_UIRemoteKeyboards *)self allowedToShowKeyboard]) {
    BOOL v5 = [(_UIRemoteKeyboards *)self wantsToShowKeyboardForViewServiceHostWindow:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)setKeyboardSceneIdentifierEnteringForegroundForScene:(id)a3
{
  id v4 = [a3 _sceneIdentifier];
  keyboardSceneIdentifierEnteringForeground = self->_keyboardSceneIdentifierEnteringForeground;
  self->_keyboardSceneIdentifierEnteringForeground = v4;
}

- (void)screenDidDisconnect:(id)a3
{
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v7 = [v4 scene];

  if (-[_UIRemoteKeyboards currentKeyboard](self, "currentKeyboard") && [v7 activationState] == 1)
  {
    BOOL v5 = [v7 _sceneIdentifier];
    keyboardSceneIdentifierEnteringForeground = self->_keyboardSceneIdentifierEnteringForeground;
    self->_keyboardSceneIdentifierEnteringForeground = v5;
  }
}

- (BOOL)allowedToEnableKeyboardWindow
{
  BOOL v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v4 = [v3 scene];

  if (!v4) {
    goto LABEL_11;
  }
  if (self->_deactivatedByControlCenter) {
    goto LABEL_9;
  }
  if (self->_deactivatedBySystemAlert) {
    goto LABEL_9;
  }
  keyboardSceneIdentifierEnteringForeground = self->_keyboardSceneIdentifierEnteringForeground;
  double v6 = [v4 _sceneIdentifier];
  LOBYTE(keyboardSceneIdentifierEnteringForeground) = [(NSString *)keyboardSceneIdentifierEnteringForeground isEqualToString:v6];

  if (keyboardSceneIdentifierEnteringForeground) {
    goto LABEL_9;
  }
  if (![v4 activationState]) {
    goto LABEL_9;
  }
  if ([v4 activationState] != 1) {
    goto LABEL_11;
  }
  id v7 = [(_UIRemoteKeyboards *)self currentState];
  int v8 = [v7 keyboardOnScreen];

  if (!v8) {
    goto LABEL_11;
  }
  if ([v4 _canDynamicallySpecifySupportedInterfaceOrientations]) {
    goto LABEL_9;
  }
  id v10 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v11 = [v10 visualModeManager];
  char v12 = [v11 windowingModeEnabled];

  BOOL v13 = [v4 coordinateSpace];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;

  uint64_t v18 = [v4 screen];
  [v18 bounds];
  double v20 = v19;
  double v22 = v21;

  if (v12) {
    goto LABEL_11;
  }
  if (v15 == v20 && v17 == v22) {
LABEL_9:
  }
    BOOL v9 = 1;
  else {
LABEL_11:
  }
    BOOL v9 = 0;

  return v9;
}

- (BOOL)wantsToShowKeyboardForViewServiceHostWindow:(id)a3
{
  BOOL v3 = [(_UIRemoteKeyboards *)self viewHostForWindow:a3];
  char v4 = [v3 hasHostedViews];

  return v4;
}

- (void)updateLastScreen:(id)a3
{
  id v5 = a3;
  if (self->_enableMultiscreenHack)
  {
    id v10 = v5;
    p_lastScreen = &self->_lastScreen;
    if (self->_lastScreen)
    {
      id v7 = [(objc_class *)[(_UIRemoteKeyboards *)self keyboardWindowClass] remoteKeyboardWindowForScreen:self->_lastScreen create:0];
      int v8 = v7;
      if (v7)
      {
        id v9 = [v7 screen];

        if (v9 != v10) {
          [v8 invalidate];
        }
      }
    }
    objc_storeStrong((id *)p_lastScreen, a3);
    id v5 = v10;
  }
}

- (void)completeMoveKeyboardForWindow:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIRemoteKeyboards *)self keyboardWindowClass];
  double v6 = [v4 screen];
  id v7 = [(objc_class *)v5 remoteKeyboardWindowForScreen:v6 create:0];

  if (v7 == v4)
  {
    if ([(_UIRemoteKeyboards *)self currentKeyboard])
    {
      id v9 = [v4 rootViewController];
      id v10 = [v9 inputViewSet];
      char v11 = [v10 isInputViewPlaceholder];

      if ((v11 & 1) == 0)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __52___UIRemoteKeyboards_completeMoveKeyboardForWindow___block_invoke;
        v13[3] = &unk_1E52D9F70;
        v13[4] = self;
        [(id)UIApp _performBlockAfterCATransactionCommits:v13];
      }
    }
  }
  else if (v7)
  {
    if (([v7 _isHostedInAnotherProcess] & 1) == 0)
    {
      BOOL v8 = [(_UIRemoteKeyboards *)self needsToShowKeyboardForWindow:v7];
      [(_UIRemoteKeyboards *)self setWindowEnabled:v8];
      if (!v8)
      {
        if ([(_UIRemoteKeyboards *)self allowedToShowKeyboard]) {
          [v7 invalidate];
        }
      }
    }
  }
  char v12 = [(_UIRemoteKeyboards *)self currentState];
  [v12 resetAnimationFencing];
}

- (void)setWindowLevel:(double)a3 sceneLevel:(double)a4 forResponder:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [(_UIRemoteKeyboards *)self keyboardWindowClass];
  id v10 = [v8 _responderWindow];
  char v11 = [v10 screen];
  char v12 = [(objc_class *)v9 remoteKeyboardWindowForScreen:v11 create:0];

  [v12 setWindowLevel:a3];
  BOOL v13 = [v8 _responderWindow];
  double v14 = [v13 windowScene];
  double v15 = [v14 _settingsScene];

  double v16 = [v15 _FBSScene];

  double v17 = [v16 identityToken];
  uint64_t v18 = [v17 stringRepresentation];

  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyboardFocus", &qword_1EB25C708);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    uint64_t v37 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      int v39 = 136315650;
      id v40 = "-[_UIRemoteKeyboards setWindowLevel:sceneLevel:forResponder:]";
      __int16 v41 = 2112;
      *(void *)__int16 v42 = v8;
      *(_WORD *)&v42[8] = 2112;
      __int16 v43 = v18;
      _os_log_impl(&dword_1853B0000, v37, OS_LOG_TYPE_ERROR, "%s: Setting window level for responder: %@; scene identity: %@",
        (uint8_t *)&v39,
        0x20u);
    }
  }
  double v20 = [v8 _responderWindow];
  double v21 = [v8 _responderWindow];
  double v22 = [v21 windowScene];
  if ([v22 _isTargetOfKeyboardEventDeferringEnvironment]) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = 16777217;
  }
  -[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:](self, v20, v23);

  unint64_t v24 = [(_UIRemoteKeyboards *)self requiredScene];
  __int16 v25 = [v24 identityToken];

  BOOL v26 = [v12 activeSceneIdentity];
  __int16 v27 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v28 = [v27 hardwareKeyboardExclusivityIdentifier];
  BOOL v29 = v28 != 0;

  int v30 = BSEqualObjects() ^ 1;
  double requiredLevel = self->_requiredLevel;
  if (requiredLevel == a4) {
    int v32 = v30;
  }
  else {
    int v32 = 1;
  }
  if (self->_hasExclusivityIdentifier == v29) {
    int v33 = v32;
  }
  else {
    int v33 = 1;
  }
  unint64_t v34 = __UILogGetCategoryCachedImpl("KeyboardFocus", &qword_1EB25C710);
  if (*(unsigned char *)v34)
  {
    __int16 v38 = *(NSObject **)(v34 + 8);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      int v39 = 136315906;
      id v40 = "-[_UIRemoteKeyboards setWindowLevel:sceneLevel:forResponder:]";
      __int16 v41 = 1024;
      *(_DWORD *)__int16 v42 = v33;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = v30;
      LOWORD(v43) = 1024;
      *(_DWORD *)((char *)&v43 + 2) = requiredLevel != a4;
      _os_log_impl(&dword_1853B0000, v38, OS_LOG_TYPE_ERROR, "%s: Should reset scene: %d; identitiesAreDifferent: %d; levelsAreDifferent: %d",
        (uint8_t *)&v39,
        0x1Eu);
    }
  }
  if (v33)
  {
    self->_double requiredLevel = a4;
    self->_hasExclusivityIdentifier = v29;
    [v12 resetScene];
  }
  BOOL v35 = [(_UIRemoteKeyboards *)self needsToShowKeyboardForWindow:v12];
  BOOL v36 = v35
     && [(_UIRemoteKeyboards *)self needsToShowKeyboardForViewServiceHostWindow:v12];
  [(_UIRemoteKeyboards *)self setWindowEnabled:v35 force:v36];
}

- (void)ignoreLayoutNotifications:(id)a3
{
}

- (void)unregisterController:(id)a3
{
  id v4 = a3;
  [v4 setControllerDelegate:0];
  [(NSHashTable *)self->_windowControllers removeObject:v4];
}

- (void)_performOnDistributedControllersExceptSelf:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65___UIRemoteKeyboards__performOnDistributedControllersExceptSelf___block_invoke;
  v6[3] = &unk_1E52EBE60;
  id v7 = v4;
  id v5 = v4;
  [(_UIRemoteKeyboards *)self performOnControllers:v6];
}

- (void)performOnDistributedControllers:(id)a3
{
  id v4 = (void (*)(void))*((void *)a3 + 2);
  id v5 = a3;
  v4();
  [(_UIRemoteKeyboards *)self _performOnDistributedControllersExceptSelf:v5];
}

- (id)prepareForHostedWindowWithScene:(id)a3
{
  id v4 = a3;
  id v5 = [v4 screen];
  double v6 = [(objc_class *)[(_UIRemoteKeyboards *)self keyboardWindowClass] remoteKeyboardWindowForScreen:v5 create:0];
  ++self->_hostedCount;
  id v7 = [(objc_class *)[(_UIRemoteKeyboards *)self keyboardWindowClass] remoteKeyboardWindowForScreen:v5 create:1];
  uint64_t v8 = [v7 windowScene];
  if (!v8
    || (id v9 = (void *)v8,
        [v7 windowScene],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 _hasInvalidated],
        v10,
        v9,
        v11))
  {
    [v7 setWindowScene:v4];
  }
  [(_UIRemoteKeyboards *)self checkConnection];
  if (self->_hostedCount == 1)
  {
    if (v6) {
      [v6 invalidate];
    }
    char v12 = +[UIPeripheralHost sharedInstance];
    [v12 forceReloadInputViews];
  }
  return v7;
}

- (void)finishWithHostedWindow
{
  int v2 = self->_hostedCount - 1;
  self->_hostedCount = v2;
  if (!v2)
  {
    id v3 = +[UIPeripheralHost sharedInstance];
    [v3 forceReloadInputViews];
  }
}

- (BOOL)refreshWithLocalMinimumKeyboardHeight:(double)a3 forScene:(id)a4
{
  id v6 = a4;
  minimumKeyboardHeights = self->_minimumKeyboardHeights;
  uint64_t v8 = [v6 _FBSScene];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 identityToken];
    int v11 = [v10 stringRepresentation];
  }
  else
  {
    int v11 = [v6 _sceneIdentifier];
  }

  char v12 = [(NSMapTable *)minimumKeyboardHeights objectForKey:v11];
  [v12 doubleValue];
  double v14 = v13;

  if (v14 != a3)
  {
    double v15 = self->_minimumKeyboardHeights;
    if (a3 == 0.0)
    {
      double v16 = [v6 _FBSScene];
      double v17 = v16;
      if (v16)
      {
        uint64_t v18 = [v16 identityToken];
        double v19 = [v18 stringRepresentation];
      }
      else
      {
        double v19 = [v6 _sceneIdentifier];
      }

      [(NSMapTable *)v15 removeObjectForKey:v19];
    }
    else
    {
      double v19 = [NSNumber numberWithDouble:a3];
      double v20 = [v6 _FBSScene];
      double v21 = v20;
      if (v20)
      {
        double v22 = [v20 identityToken];
        uint64_t v23 = [v22 stringRepresentation];
      }
      else
      {
        uint64_t v23 = [v6 _sceneIdentifier];
      }

      [(NSMapTable *)v15 setObject:v19 forKey:v23];
    }
  }
  return v14 != a3;
}

- (double)intersectionHeightForWindowScene:(id)a3
{
  [(_UIRemoteKeyboards *)self intersectionHeightForWindowScene:a3 isLocalMinimumHeightOut:0 ignoreHorizontalOffset:0];
  return result;
}

- (double)intersectionHeightForWindowScene:(id)a3 isLocalMinimumHeightOut:(BOOL *)a4 ignoreHorizontalOffset:(BOOL)a5
{
  BOOL v7 = a5;
  id v10 = a3;
  if (+[UIKeyboard inputUIOOP])
  {
    id v5 = off_1E52D4000;
    int v11 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    char v12 = [v11 keyboardArbiterClient];

    double v13 = [v12 currentClientState];
    if (+[UIKeyboard usesInputSystemUI])
    {
      uint64_t v94 = a4;
      BOOL v14 = v7;
      id v6 = [v12 currentUIState];
      double v15 = [v6 bundleIdentifier];
      double v16 = _UIMainBundleIdentifier();
      if (([v15 isEqualToString:v16] & 1) == 0)
      {

        BOOL v7 = v14;
LABEL_11:

        a4 = v94;
        goto LABEL_12;
      }
      int v17 = [v12 keyboardVisible];

      BOOL v7 = v14;
      a4 = v94;
      if (v17)
      {
        uint64_t v18 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        id v6 = [v18 responder];

        double v15 = [v6 inputView];
        if (v15
          || ([v6 inputViewController],
              double v19 = objc_claimAutoreleasedReturnValue(),
              [v19 view],
              double v15 = objc_claimAutoreleasedReturnValue(),
              v19,
              BOOL v7 = v14,
              v15))
        {
          [v15 frame];
          if (v20 == 0.0)
          {

            CGFloat height = 0.0;
LABEL_74:

LABEL_75:
            double v32 = height;
            goto LABEL_76;
          }
        }
        goto LABEL_11;
      }
    }
LABEL_12:
    BOOL v28 = [v12 currentUIState];
    [v28 keyboardPosition];
    double v23 = v29;
    CGFloat v25 = v30;
    double v27 = v31;

    goto LABEL_13;
  }
  double v13 = [(_UIRemoteKeyboards *)self currentState];
  [v13 keyboardPosition];
  double v23 = v22;
  CGFloat v25 = v24;
  double v27 = v26;
LABEL_13:
  double v32 = 0.0;
  if (v13 && ([v13 avoidIntersectability] & 1) == 0)
  {
    char v12 = _UIMainBundleIdentifier();
    if (([v12 isEqualToString:@"com.apple.Spotlight"] & 1) != 0
      || ([(id)UIApp _isSpringBoard] & 1) != 0)
    {
      char v95 = a4;
      BOOL v85 = v7;
      char v33 = 0;
    }
    else
    {
      id v6 = [v13 sourceBundleIdentifier];
      CGFloat height = 0.0;
      if ([v6 isEqualToString:@"com.apple.Spotlight"]) {
        goto LABEL_74;
      }
      char v95 = a4;
      BOOL v85 = v7;
      char v33 = 1;
    }
    unint64_t v34 = _UIMainBundleIdentifier();
    if (([v34 isEqualToString:@"com.apple.CoreAuthUI"] & 1) != 0
      || ([(id)UIApp _isSpringBoard] & 1) != 0)
    {
      int v35 = 0;
    }
    else
    {
      id v5 = [v13 sourceBundleIdentifier];
      if ([v5 isEqualToString:@"com.apple.CoreAuthUI"])
      {

        CGFloat height = 0.0;
        if ((v33 & 1) == 0) {
          goto LABEL_75;
        }
        goto LABEL_74;
      }
      int v35 = 1;
    }
    v93 = self;
    if (!v10 || +[UIKeyboard inputUIOOP])
    {
      if (v35) {

      }
      if (v33) {
LABEL_28:
      }
      +[UIWindowScene _keyWindowScene]();
      BOOL v36 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v37 = -[UIWindowScene _keyWindow](v36);

      if (v37 && ([v37 _isHostedInAnotherProcess] & 1) == 0)
      {
        uint64_t v38 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v10];
      }
      else
      {
        uint64_t v38 = +[UITextEffectsWindow activeTextEffectsWindowForWindowScene:v10];
      }
      char v12 = (void *)v38;
      __int16 v43 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      uint64_t v44 = [v43 visualModeManager];
      int v45 = [v44 windowingModeEnabled];

      if (v45 && ([v12 hostedViewReference], !CGRectIsEmpty(v96))) {
        [v12 hostedViewReference];
      }
      else {
        [v12 actualSceneFrame];
      }
      CGFloat v90 = v47;
      CGFloat v92 = v46;
      CGFloat v86 = v49;
      CGFloat v88 = v48;
      [v12 _sceneBounds];
      double v51 = v50;
      double v53 = v52;
      +[UIKeyboardImpl normalizedPersistentOffset];
      double v55 = v54;
      double v84 = v56;
      double v57 = v53;
      v58 = v93;
      if ([v12 interfaceOrientation])
      {
        v59 = [(_UIRemoteKeyboards *)v93 keyboardWindow];
        if ([v59 interfaceOrientation])
        {
          BOOL v60 = (unint64_t)([v12 interfaceOrientation] - 3) < 2;
          CGFloat v61 = [(_UIRemoteKeyboards *)v93 keyboardWindow];
          char v62 = v60 ^ ((unint64_t)([v61 interfaceOrientation] - 3) < 2);

          BOOL v63 = (v62 & 1) == 0;
          v58 = v93;
          if (v63) {
            double v57 = v53;
          }
          else {
            double v57 = v51;
          }
        }
        else
        {

          double v57 = v53;
        }
      }
      if ([v12 _shouldResizeWithScene])
      {
        CGFloat v64 = [v12 screen];
        [v64 bounds];
        double v51 = v65;
        double v53 = v66;

        double v57 = v53;
      }
      minimumKeyboardHeights = v58->_minimumKeyboardHeights;
      int v68 = [v10 _FBSScene];
      int v69 = v68;
      if (v68)
      {
        v70 = [v68 identityToken];
        id v71 = [v70 stringRepresentation];
      }
      else
      {
        id v71 = [v10 _sceneIdentifier];
      }

      v72 = [(NSMapTable *)minimumKeyboardHeights objectForKey:v71];
      [v72 doubleValue];
      double v74 = v73;

      id v6 = v37;
      if (v74 > 0.0)
      {
        v97.origin.CGFloat y = v90;
        v97.origin.CGFloat x = v92;
        v97.size.CGFloat height = v86;
        v97.size.CGFloat width = v88;
        double v75 = v74 + v57 - CGRectGetMaxY(v97);
        if (v95) {
          *char v95 = v75 > v27;
        }
        if (v27 < v75) {
          double v27 = v75;
        }
        CGFloat v25 = v51;
      }
      double v76 = v57 - v27;
      if (v85) {
        CGFloat v25 = v51;
      }
      if (v76 != 0.0
        && v84 != 0.0
        && ![(_UIRemoteKeyboards *)v58 wantsAssistantWhileSuppressingKeyboard])
      {
        if (+[UIKeyboardImpl isFloating])
        {
          +[UIKeyboardImpl floatingPersistentOffset];
          +[UIInputViewSetPlacementFloating frameAtOffset:keyboardSize:screenSize:](UIInputViewSetPlacementFloating, "frameAtOffset:keyboardSize:screenSize:");
          double v23 = v77;
          double v76 = v78;
          CGFloat v25 = v79;
          double v27 = v80;
        }
        else
        {
          +[UIInputViewSetPlacementUndocked computeOffsetForOffset:withSize:chromeBuffer:onScreenSize:](UIInputViewSetPlacementUndocked, "computeOffsetForOffset:withSize:chromeBuffer:onScreenSize:", v55, v84, v51, v27, 92.0, 0.0, 0.0, 0.0, *(void *)&v51, *(void *)&v53);
          double v23 = v23 + v81;
          double v76 = v76 - v82;
        }
      }
      v98.origin.CGFloat x = v23;
      v98.origin.CGFloat y = v76;
      v98.size.CGFloat width = v25;
      v98.size.CGFloat height = v27;
      v100.origin.CGFloat y = v90;
      v100.origin.CGFloat x = v92;
      v100.size.CGFloat height = v86;
      v100.size.CGFloat width = v88;
      CGRect v99 = CGRectIntersection(v98, v100);
      CGFloat height = v99.size.height;
      goto LABEL_74;
    }
    BOOL v87 = v6;
    double v89 = v5;
    int v39 = [v13 sourceDisplayIdentifier];
    id v40 = [v10 screen];
    __int16 v41 = [v40 displayConfiguration];
    __int16 v42 = [v41 _nameForDisplayType];
    char v91 = [v39 isEqual:v42];

    if (v35) {
    if (v33)
    }

    if (v91) {
      goto LABEL_28;
    }
  }
LABEL_76:

  return v32;
}

- (CGRect)keyboardFrameIncludingRemoteIAV
{
  int v2 = [(_UIRemoteKeyboards *)self currentState];
  [v2 keyboardPositionWithRemoteIAV];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)keyboardPosition
{
  int v2 = [(_UIRemoteKeyboards *)self currentState];
  [v2 keyboardPosition];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (BOOL)isFloating
{
  int v2 = [(_UIRemoteKeyboards *)self currentState];
  char v3 = [v2 isFloating];

  return v3;
}

- (CGPoint)persistentOffset
{
  int v2 = [(_UIRemoteKeyboards *)self currentState];
  [v2 persistentOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat y = v8;
  result.CGFloat x = v7;
  return result;
}

- (BOOL)assistantBarVisible
{
  int v2 = [(_UIRemoteKeyboards *)self currentState];
  char v3 = [v2 assistantBarVisible];

  return v3;
}

- (BOOL)remoteKeyboardUndocked
{
  return [(_UIRemoteKeyboards *)self remoteKeyboardUndocked:0];
}

- (void)addHostedWindowView:(id)a3 fromPID:(int)a4 forScene:(id)a5 callerID:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    double v13 = [v11 screen];
    [(_UIRemoteKeyboards *)self updateLastScreen:v13];
  }
  double v14 = [(_UIRemoteKeyboards *)self keyboardWindowClass];
  double v15 = [(_UIRemoteKeyboards *)self _activeScreen];
  double v16 = [(objc_class *)v14 remoteKeyboardWindowForScreen:v15 create:1];

  [v16 setHidden:0];
  int v17 = [(_UIRemoteKeyboards *)self viewHostForWindow:v16];
  objc_initWeak(&location, v17);

  uint64_t v18 = [NSNumber numberWithInt:v8];
  double v19 = [(_UIRemoteKeyboards *)self proxy];
  [v19 setWindowHostingPID:v8 active:1];

  [(NSMutableArray *)self->_activePIDs addObject:v18];
  if (v12) {
    [(NSMutableArray *)self->_activeCIDs addObject:v12];
  }
  char v20 = [v16 _isHostedInAnotherProcess];
  if ((v20 & 1) == 0) {
    [(_UIRemoteKeyboards *)self setWindowEnabled:[(_UIRemoteKeyboards *)self allowedToShowKeyboard]];
  }
  id v21 = objc_loadWeakRetained(&location);
  [v16 updateLastRemoteView:1 forView:v10 inContainer:v21];

  id v22 = objc_loadWeakRetained(&location);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68___UIRemoteKeyboards_addHostedWindowView_fromPID_forScene_callerID___block_invoke;
  v26[3] = &unk_1E52FD7E0;
  v26[4] = self;
  id v23 = v18;
  id v27 = v23;
  char v32 = v20;
  int v31 = v8;
  id v24 = v12;
  id v28 = v24;
  objc_copyWeak(&v30, &location);
  id v25 = v10;
  id v29 = v25;
  [v22 addHostedView:v25 withViewRemovalHandler:v26];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (void)performRequiredSceneUpdateIfPermittedForViewServiceHostWindow:(uint64_t)a3 servicePID:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  double v6 = v5;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 96))
    {
      double v7 = [v5 windowScene];
      BOOL v8 = v7 == *(void **)(a1 + 88);
    }
    else
    {
      BOOL v8 = 0;
    }
    double v9 = *(void **)(a1 + 40);
    id v10 = [NSNumber numberWithInt:a3];
    int v11 = [v9 containsObject:v10];

    int v12 = a3 ? v11 : 1;
    if (v6 && !v8 && v12)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyboardFocus", &performRequiredSceneUpdateIfPermittedForViewServiceHostWindow_servicePID____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        double v14 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136315394;
          double v16 = "-[_UIRemoteKeyboards performRequiredSceneUpdateIfPermittedForViewServiceHostWindow:servicePID:]";
          __int16 v17 = 2048;
          uint64_t v18 = v6;
          _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "%s: Performing required scene update for window hosting remote ui: %p", (uint8_t *)&v15, 0x16u);
        }
      }
      -[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:]((void *)a1, v6, 0x101010001);
    }
  }
}

- (BOOL)hasAnyHostedViews
{
  return [(NSMutableArray *)self->_activePIDs count] != 0;
}

- (void)setSuppressingKeyboard:(BOOL)a3 forScene:(id)a4
{
  BOOL v4 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  double v6 = (UIWindowScene *)a4;
  if (self->_expectedSuppression != v4)
  {
    self->_BOOL expectedSuppression = v4;
    if (v4 && (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      dispatch_time_t v7 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54___UIRemoteKeyboards_setSuppressingKeyboard_forScene___block_invoke;
      block[3] = &unk_1E52D9F70;
      void block[4] = self;
      dispatch_after(v7, MEMORY[0x1E4F14428], block);
    }
    BOOL v8 = [(_UIRemoteKeyboards *)self keyboardWindow];
    double v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      int v11 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      id v10 = [v11 containerWindow];
    }
    int v12 = [v10 screen];
    double v13 = +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:v12];

    if (v4)
    {
      if (!v6) {
        double v6 = v13;
      }
      objc_storeStrong((id *)&self->_suppressedScene, v6);
    }
    else if (!v6)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      double v14 = +[UIScene _scenesIncludingInternal:1];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v30;
LABEL_15:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(UIWindowScene **)(*((void *)&v29 + 1) + 8 * v18);
          if (v19 == self->_suppressedScene) {
            break;
          }
          if (v16 == ++v18)
          {
            uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
            if (v16) {
              goto LABEL_15;
            }
            goto LABEL_21;
          }
        }
        double v6 = v19;

        if (v6) {
          goto LABEL_24;
        }
      }
      else
      {
LABEL_21:
      }
      double v6 = v13;
    }
LABEL_24:
    char v20 = [(_UIRemoteKeyboards *)self proxy];
    [v20 notifyHostedPIDsOfSuppression:v4];

    id v21 = +[UIPeripheralHost sharedInstance];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54___UIRemoteKeyboards_setSuppressingKeyboard_forScene___block_invoke_2;
    aBlock[3] = &unk_1E52DC3D0;
    id v22 = v21;
    id v26 = v22;
    BOOL v28 = v4;
    double v6 = v6;
    id v27 = v6;
    id v23 = (void (**)(void))_Block_copy(aBlock);
    if ([(id)UIApp isSuspended])
    {
      id v24 = +[UIInputViewAnimationStyle animationStyleImmediate];
      [v22 pushAnimationStyle:v24];

      +[UIView performWithoutAnimation:v23];
      [v22 popAnimationStyle];
    }
    else
    {
      v23[2](v23);
    }
  }
}

- (void)queue_keyboardSuppressed:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  dispatch_time_t v7 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62___UIRemoteKeyboards_queue_keyboardSuppressed_withCompletion___block_invoke;
  v9[3] = &unk_1E52E3538;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performAsync:v9];
}

- (void)queue_keyboardTransition:(id)a3 event:(unint64_t)a4 withInfo:(id)a5 onComplete:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  int v12 = (void (**)(void))a6;
  if ([(_UIRemoteKeyboards *)self keyboardActive])
  {
LABEL_11:
    if (v12) {
      v12[2](v12);
    }
  }
  else
  {
    switch(a4)
    {
      case 0uLL:
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke;
        aBlock[3] = &unk_1E52EBE18;
        id v31 = v10;
        id v32 = v11;
        double v13 = _Block_copy(aBlock);

        id v14 = v31;
        goto LABEL_9;
      case 1uLL:
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_2;
        v27[3] = &unk_1E52EBE18;
        id v28 = v10;
        id v29 = v11;
        double v13 = _Block_copy(v27);

        id v14 = v28;
        goto LABEL_9;
      case 2uLL:
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_3;
        v24[3] = &unk_1E52EBE18;
        id v25 = v10;
        id v26 = v11;
        double v13 = _Block_copy(v24);

        id v14 = v25;
        goto LABEL_9;
      case 3uLL:
        if (![@"Placement" isEqualToString:v10]) {
          goto LABEL_7;
        }
        uint64_t v15 = [v11 objectForKey:@"Placement"];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_4;
        v21[3] = &unk_1E52EBE18;
        id v22 = v15;
        id v23 = v11;
        id v14 = v15;
        double v13 = _Block_copy(v21);

LABEL_9:
        if (!v13) {
          goto LABEL_11;
        }
        uint64_t v16 = [(id)UIApp _systemAnimationFenceExemptQueue];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_5;
        v18[3] = &unk_1E52E45C8;
        v18[4] = self;
        id v19 = v13;
        char v20 = v12;
        id v17 = v13;
        [v16 performAsync:v18];

        break;
      default:
LABEL_7:
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unknown transition data: %@/%lu/%@", v10, a4, v11 format];
        goto LABEL_11;
    }
  }
}

- (void)setDisableBecomeFirstResponder:(BOOL)a3
{
}

- (void)setDisableBecomeFirstResponder:(BOOL)a3 forSuppressionAssertion:(BOOL)a4
{
}

- (void)setDisableBecomeFirstResponder:(BOOL)a3 forSuppressionAssertion:(BOOL)a4 updatePlacement:(BOOL)a5
{
}

- (void)setDisableBecomeFirstResponder:(BOOL)a3 forSuppressionAssertion:(BOOL)a4 updatePlacement:(BOOL)a5 wantsAssistant:(BOOL)a6
{
  if (self->_disablingKeyboard != a3)
  {
    BOOL v6 = a6;
    BOOL v7 = a5;
    BOOL v8 = a4;
    BOOL v9 = a3;
    BOOL v11 = [(_UIAssertionController *)self->_assertionController hasAssertionsForReason:@"WritingTools"];
    int v12 = +[UIPeripheralHost sharedInstance];
    [v12 setDeactivatedKeyboard:v9 forScene:0 forSuppressionAssertion:v8 updatePlacement:v7 wantsAssistant:v6 keepAccessories:v11];

    self->_disablingKeyboard = v9;
  }
}

- (void)setWantsAssistantWhileSuppressingKeyboard:(BOOL)a3
{
  if (self->_wantsAssistantWhileSuppressingKeyboard != a3)
  {
    BOOL v3 = a3;
    self->_wantsAssistantWhileSuppressingKeyboard = a3;
    if (a3)
    {
      id v5 = +[UIKeyboardImpl activeInstance];
      [v5 _setShouldSuppressAssistantBar:0];
    }
    BOOL v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    [v6 _updateVisibilityObserversWithReset:0];

    if ([(_UIRemoteKeyboards *)self disableBecomeFirstResponder])
    {
      BOOL v7 = [(_UIAssertionController *)self->_assertionController hasAssertionsForReason:@"WritingTools"];
      id v10 = +[UIPeripheralHost sharedInstance];
      BOOL v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      BOOL v9 = [v8 nextAnimationStyle];
      [v10 updatePlacementForDeactivatedKeyboard:1 forSuppressionAssertion:1 wantsAssistant:v3 keepAccessories:v7 animationStyle:v9];
    }
  }
}

- (BOOL)disableBecomeFirstResponder
{
  return self->_disablingKeyboard;
}

- (BOOL)hasActiveKeyboardSuppressionAssertionsForReason:(id)a3
{
  return [(_UIAssertionController *)self->_assertionController hasAssertionsForReason:a3];
}

- (id)vendKeyboardSuppressionAssertionForReason:(id)a3
{
  return [(_UIRemoteKeyboards *)self vendKeyboardSuppressionAssertionForReason:a3 type:0];
}

- (id)vendKeyboardSuppressionAssertionForReason:(id)a3 type:(unint64_t)a4
{
  return [(_UIAssertionController *)self->_assertionController vendAssertionOfType:a4 initialState:1 reason:a3 requiresExplicitInvalidation:0];
}

- (id)vendEmojiKeyboardPrewarmingAssertionForReason:(id)a3
{
  return [(_UIAssertionController *)self->_assertionController vendAssertionOfType:2 initialState:1 reason:a3 requiresExplicitInvalidation:0];
}

- (void)prewarmWithSTKPrewarmingViewControllerClass:(Class)a3
{
  v28[4] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (UIViewController *)objc_alloc_init(a3);
  stickerPrewarmingViewController = self->_stickerPrewarmingViewController;
  self->_stickerPrewarmingViewController = v4;

  BOOL v6 = [(_UIRemoteKeyboards *)self keyboardWindow];
  BOOL v7 = [v6 rootViewController];

  BOOL v8 = [(UIViewController *)self->_stickerPrewarmingViewController view];
  BOOL v9 = v8;
  if (v8) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
  }
  else
  {
    BOOL v11 = [(UIViewController *)self->_stickerPrewarmingViewController view];
    int v12 = [v11 window];
    double v13 = [(_UIRemoteKeyboards *)self keyboardWindow];

    if (v12 != v13)
    {
      [v7 addChildViewController:self->_stickerPrewarmingViewController];
      id v14 = [v7 view];
      uint64_t v15 = [(UIViewController *)self->_stickerPrewarmingViewController view];
      [v14 addSubview:v15];
      [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v26 = [v15 topAnchor];
      id v27 = v14;
      id v25 = [v14 bottomAnchor];
      id v24 = [v26 constraintEqualToAnchor:v25];
      v28[0] = v24;
      id v23 = [v15 leadingAnchor];
      uint64_t v16 = [v14 trailingAnchor];
      id v17 = [v23 constraintEqualToAnchor:v16];
      v28[1] = v17;
      uint64_t v18 = [v15 widthAnchor];
      id v19 = [v18 constraintEqualToConstant:1.0];
      v28[2] = v19;
      char v20 = [v15 heightAnchor];
      id v21 = [v20 constraintEqualToConstant:1.0];
      v28[3] = v21;
      id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];

      [MEMORY[0x1E4F5B268] activateConstraints:v22];
      [(UIViewController *)self->_stickerPrewarmingViewController didMoveToParentViewController:v7];
    }
  }
}

- (void)setStickerPrewarmingViewControllerEnabled:(BOOL)a3
{
  stickerPrewarmingViewController = self->_stickerPrewarmingViewController;
  if (a3)
  {
    if (!stickerPrewarmingViewController
      && +[UIKeyboard isRemoteEmojiCollectionViewEnabled])
    {
      uint64_t v13 = 0;
      id v14 = &v13;
      uint64_t v15 = 0x2050000000;
      Class v16 = 0;
      Class v16 = NSClassFromString(&cfstr_Stkprewarmingv.isa);
      uint64_t v5 = v14[3];
      BOOL v6 = _UIKeyboardExtendedLog();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
      if (v5)
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEBUG, "Using existing STKPrewarmingViewController class", buf, 2u);
        }

        [(_UIRemoteKeyboards *)self prewarmWithSTKPrewarmingViewControllerClass:v14[3]];
      }
      else
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEBUG, "Soft linking STKPrewarmingViewController", buf, 2u);
        }

        BOOL v10 = dispatch_get_global_queue(17, 0);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __64___UIRemoteKeyboards_setStickerPrewarmingViewControllerEnabled___block_invoke;
        v11[3] = &unk_1E52E3210;
        void v11[4] = self;
        v11[5] = &v13;
        dispatch_async(v10, v11);
      }
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    [(UIViewController *)stickerPrewarmingViewController willMoveToParentViewController:0];
    BOOL v8 = [(UIViewController *)self->_stickerPrewarmingViewController view];
    [v8 removeFromSuperview];

    [(UIViewController *)self->_stickerPrewarmingViewController removeFromParentViewController];
    BOOL v9 = self->_stickerPrewarmingViewController;
    self->_stickerPrewarmingViewController = 0;
  }
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  if (a3 > 1)
  {
    if (a3 != 2) {
      return 0;
    }
    uint64_t v5 = [(UIViewController *)self->_stickerPrewarmingViewController _window];
    BOOL v6 = [(_UIRemoteKeyboards *)self keyboardWindow];
    BOOL v7 = v5 == v6;

    return v7;
  }
  else
  {
    return [(_UIRemoteKeyboards *)self disableBecomeFirstResponder];
  }
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  BOOL v4 = a3;
  if (a4 > 1)
  {
    if (a4 == 2)
    {
      -[_UIRemoteKeyboards setStickerPrewarmingViewControllerEnabled:](self, "setStickerPrewarmingViewControllerEnabled:");
    }
  }
  else
  {
    BOOL v6 = [(_UIRemoteKeyboards *)self wantsAssistantWhileSuppressingKeyboard];
    [(_UIRemoteKeyboards *)self setDisableBecomeFirstResponder:v4 forSuppressionAssertion:1 updatePlacement:1 wantsAssistant:v6];
  }
}

- (void)queue_setKeyboardDisabled:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63___UIRemoteKeyboards_queue_setKeyboardDisabled_withCompletion___block_invoke;
  v9[3] = &unk_1E52E3538;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performAsync:v9];
}

- (void)forceKeyboardAway
{
  BOOL v3 = +[_UIKeyboardChangedInformation informationForKeyboardDown];
  [(_UIRemoteKeyboards *)self updateLocalKeyboardChanged:v3];
  BOOL v4 = [(_UIRemoteKeyboards *)self proxy];
  uint64_t v5 = (void *)[v3 copy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39___UIRemoteKeyboards_forceKeyboardAway__block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  [v4 signalKeyboardChanged:v5 onCompletion:v7];
}

- (void)preserveKeyboardWithId:(id)a3
{
  BOOL v4 = +[_UIKeyboardChangedInformation informationForKeyboardPreserve:a3];
  [(_UIRemoteKeyboards *)self updateLocalKeyboardChanged:v4];
  uint64_t v5 = [(_UIRemoteKeyboards *)self proxy];
  id v6 = (void *)[v4 copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45___UIRemoteKeyboards_preserveKeyboardWithId___block_invoke;
  v8[3] = &unk_1E52D9F98;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 signalKeyboardChanged:v6 onCompletion:v8];
}

- (void)restoreKeyboardWithId:(id)a3
{
  BOOL v4 = +[_UIKeyboardChangedInformation informationForKeyboardRestore:a3];
  [(_UIRemoteKeyboards *)self updateLocalKeyboardChanged:v4];
  uint64_t v5 = [(_UIRemoteKeyboards *)self proxy];
  id v6 = (void *)[v4 copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44___UIRemoteKeyboards_restoreKeyboardWithId___block_invoke;
  v8[3] = &unk_1E52D9F98;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 signalKeyboardChanged:v6 onCompletion:v8];
}

- (void)userSelectedApp:(id)a3 onCompletion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && ![v6 isEqualToString:&stru_1ED0E84C0])
  {
    BOOL v11 = 0;
  }
  else
  {
    id v8 = [(_UIRemoteKeyboards *)self requiredScene];
    id v9 = [v8 identityToken];
    id v10 = [v9 stringRepresentation];
    [(_UIRemoteKeyboards *)self setFocusedSceneIdentityStringOrIdentifier:v10];

    BOOL v11 = [(_UIRemoteKeyboards *)self focusedSceneIdentityStringOrIdentifier];
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyboardFocus", &userSelectedApp_onCompletion____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    id v14 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315650;
      Class v16 = "-[_UIRemoteKeyboards userSelectedApp:onCompletion:]";
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      char v20 = v11;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "%s: Focus bundle: %@, sceneIdentity: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  if (!v7) {
    id v7 = &__block_literal_global_694;
  }
  uint64_t v13 = [(_UIRemoteKeyboards *)self proxy];
  [v13 applicationShouldFocusWithBundle:v6 onCompletion:v7];
}

- (void)userSelectedProcessIdentifier:(int)a3 withSceneIdentity:(id)a4 onCompletion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = [v9 stringRepresentation];
  if (!v9)
  {
    BOOL v11 = [(_UIRemoteKeyboards *)self requiredScene];
    int v12 = [v11 identityToken];
    uint64_t v13 = [v12 stringRepresentation];
    [(_UIRemoteKeyboards *)self setFocusedSceneIdentityStringOrIdentifier:v13];

    uint64_t v14 = [(_UIRemoteKeyboards *)self focusedSceneIdentityStringOrIdentifier];

    id v10 = (void *)v14;
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyboardFocus", userSelectedProcessIdentifier_withSceneIdentity_onCompletion____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    __int16 v19 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315650;
      uint64_t v21 = "-[_UIRemoteKeyboards userSelectedProcessIdentifier:withSceneIdentity:onCompletion:]";
      __int16 v22 = 1024;
      int v23 = v6;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "%s: Focus PID: %d, sceneIdentity: %@", (uint8_t *)&v20, 0x1Cu);
    }
  }
  if (!v8) {
    id v8 = &__block_literal_global_699_0;
  }
  Class v16 = [(_UIRemoteKeyboards *)self proxy];
  __int16 v17 = +[UIWindow _applicationKeyWindow];
  id v18 = +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:v9 window:v17];

  [v16 focusApplicationWithProcessIdentifier:v6 context:v18 onCompletion:v8];
}

- (void)queue_setLastEventSource:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62___UIRemoteKeyboards_queue_setLastEventSource_withCompletion___block_invoke;
  v9[3] = &unk_1E52DC8B0;
  id v10 = v6;
  int64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [v7 performAsync:v9];
}

- (void)restorePreservedInputViewsIfNecessary
{
  [(_UIRemoteKeyboards *)self userSelectedApp:0 onCompletion:0];
  +[UIKeyboardSceneDelegate performOnControllers:&__block_literal_global_711];
}

+ (id)bundlesThatShouldNotPreventRestoration
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"com.apple.StickerKit.StickerPickerService"];
}

- (BOOL)shouldAllowInputViewsRestoredForId:(id)a3
{
  id v4 = a3;
  if ([(_UIRemoteKeyboards *)self keyboardActive])
  {
    BOOL v5 = 1;
  }
  else if ([(_UIRemoteKeyboards *)self _isWritingToolsHandlingKeyboardTracking])
  {
    id v6 = [(_UIRemoteKeyboards *)self yieldingKeyboardToIgnoredScene];
    BOOL v5 = v6 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  id v7 = [(id)objc_opt_class() bundlesThatShouldNotPreventRestoration];
  id v8 = [(_UIRemoteKeyboards *)self currentState];
  id v9 = [v8 sourceBundleIdentifier];
  if (([v7 containsObject:v9] & 1) != 0
    || ![(_UIRemoteKeyboards *)self keyboardVisible]
    || v5)
  {
    char v10 = 1;
  }
  else
  {
    char v10 = [v4 isEqual:@"remote-keyboards"];
  }

  return v10;
}

- (void)applicationWillResignActive:(id)a3
{
  if ([(_UIRemoteKeyboards *)self currentKeyboard])
  {
    if (!self->_deactivatedByControlCenter)
    {
      id v4 = _UIMainBundleIdentifier();
      char v5 = [v4 isEqualToString:@"com.apple.Spotlight"];

      if ((v5 & 1) == 0)
      {
        id v6 = [(_UIRemoteKeyboards *)self currentState];
        id v7 = (void *)[v6 copyWithIntersectability:0];

        [v7 setShouldTakeSnapshot:0];
        [(_UIRemoteKeyboards *)self signalToProxyKeyboardChanged:v7 onCompletion:&__block_literal_global_718];
      }
    }
  }
  id v8 = [(_UIRemoteKeyboards *)self inputWindowRootViewController];
  id v9 = [v8 presentedViewController];

  if (v9)
  {
    id v11 = [(_UIRemoteKeyboards *)self inputWindowRootViewController];
    char v10 = [v11 presentedViewController];
    [v10 dismissViewControllerAnimated:0 completion:0];
  }
}

- (void)setEnableMultiscreenHack:(BOOL)a3
{
  _UIMainBundleIdentifier();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (([v10 isEqualToString:@"com.apple.mobilenotes"] & 1) == 0
    && ([v10 isEqualToString:@"com.apple.sidecar.extension.display"] & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3B8];
    id v8 = _UIMainBundleIdentifier();
    id v9 = NSStringFromSelector(a2);
    [v6 raise:v7, @"Application '%@' not permitted to use '%@'", v8, v9 format];
  }
  self->_enableMultiscreenHack = a3;
}

- (id)inputWindowRootViewController
{
  int v2 = [(_UIRemoteKeyboards *)self keyboardWindow];
  BOOL v3 = [v2 rootViewController];

  return v3;
}

- (void)setFocusedSceneIdentityStringOrIdentifier:(id)a3
{
}

- (int64_t)lastEventSource
{
  return self->_lastEventSource;
}

- (void)setLastEventSource:(int64_t)a3
{
  self->_lastEventSource = a3;
}

- (BOOL)updatingHeight
{
  return self->_updatingHeight;
}

- (BOOL)shouldFence
{
  return self->_shouldFence;
}

- (BOOL)enableMultiscreenHack
{
  return self->_enableMultiscreenHack;
}

- (void)setConnection:(id)a3
{
}

- (_UIKeyboardChangedInformation)backupState
{
  return (_UIKeyboardChangedInformation *)objc_getProperty(self, a2, 248, 1);
}

- (BOOL)didSignalKeyboardChangedForCurrentKeyboard
{
  return self->_didSignalKeyboardChangedForCurrentKeyboard;
}

- (void)setDidSignalKeyboardChangedForCurrentKeyboard:(BOOL)a3
{
  self->_didSignalKeyboardChangedForCurrentKeyboard = a3;
}

- (void)setUpdatingKeyWindow:(BOOL)a3
{
  self->_updatingKeyWindow = a3;
}

- (UIViewController)stickerPrewarmingViewController
{
  return self->_stickerPrewarmingViewController;
}

- (void)setStickerPrewarmingViewController:(id)a3
{
}

- (BOOL)pendingAutofillRequest
{
  return self->_pendingAutofillRequest;
}

- (void)setPendingAutofillRequest:(BOOL)a3
{
  self->_pendingAutofillRequest = a3;
}

- (NSString)yieldingKeyboardToIgnoredScene
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setYieldingKeyboardToIgnoredScene:(id)a3
{
}

- (void)setHandlingRemoteEvent:(BOOL)a3
{
  self->_BOOL handlingRemoteEvent = a3;
}

- (BOOL)handlingViewServiceEvent
{
  return self->_handlingViewServiceEvent;
}

- (void)setHandlingViewServiceEvent:(BOOL)a3
{
  self->_handlingViewServiceEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yieldingKeyboardToIgnoredScene, 0);
  objc_storeStrong((id *)&self->_stickerPrewarmingViewController, 0);
  objc_storeStrong((id *)&self->_backupState, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_keyboardSceneIdentifierEnteringForeground, 0);
  objc_storeStrong((id *)&self->_eventObserver, 0);
  objc_storeStrong((id *)&self->_minimumKeyboardHeights, 0);
  objc_storeStrong((id *)&self->_lastScreen, 0);
  objc_storeStrong((id *)&self->_ignoredSceneIdentityTokenStringSet, 0);
  objc_storeStrong((id *)&self->_pendingKeyboardGrabs, 0);
  objc_storeStrong((id *)&self->_suppressedScene, 0);
  objc_storeStrong((id *)&self->_focusedSceneIdentityStringOrIdentifier, 0);
  objc_storeStrong((id *)&self->_keyboardSnapshot, 0);
  objc_storeStrong((id *)&self->_activeCIDs, 0);
  objc_storeStrong((id *)&self->_activePIDs, 0);
  objc_storeStrong((id *)&self->_requiredScene, 0);
  objc_storeStrong((id *)&self->_windowControllers, 0);
}

- (void)startTransition:(id)a3 withInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIRemoteKeyboards *)self proxy];
  [v8 transition:v7 eventStage:0 withInfo:v6];
}

- (void)updateTransition:(id)a3 withInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIRemoteKeyboards *)self proxy];
  [v8 transition:v7 eventStage:1 withInfo:v6];
}

- (void)completeTransition:(id)a3 withInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIRemoteKeyboards *)self proxy];
  [v8 transition:v7 eventStage:2 withInfo:v6];
}

- (void)setPlacement:(id)a3 quietly:(BOOL)a4 animated:(BOOL)a5 generateSplitNotification:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  v17[4] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = [(_UIRemoteKeyboards *)self proxy];
  v17[0] = v10;
  v16[0] = @"Placement";
  v16[1] = @"Quiet";
  int v12 = [NSNumber numberWithBool:v8];
  v17[1] = v12;
  v16[2] = @"Animated";
  uint64_t v13 = [NSNumber numberWithBool:v7];
  v17[2] = v13;
  void v16[3] = @"Notify";
  uint64_t v14 = [NSNumber numberWithBool:v6];
  v17[3] = v14;
  int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

  [v11 transition:@"Placement" eventStage:3 withInfo:v15];
}

@end