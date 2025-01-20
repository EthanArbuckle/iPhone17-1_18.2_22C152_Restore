@interface _UIKeyboardArbiterClientInputDestination
+ (id)currentBundleIdentifier;
- (BOOL)_didHandleKeyboardClientChange:(id)a3 shouldConsiderSnapshottingKeyboard:(BOOL)a4 isLocalEvent:(BOOL)a5;
- (BOOL)_sceneFocusPermittedForApplication;
- (BOOL)_sceneFocusUpdatePermittedForWindow:(id)a3;
- (BOOL)allowedToEnableKeyboardWindow;
- (BOOL)allowedToShowKeyboard;
- (BOOL)hasWindowHostingCallerID:(id)a3;
- (BOOL)hasWindowHostingPID:(int)a3;
- (BOOL)inputDestinationDidChange:(BOOL)a3 withIAVHeight:(double)a4 isIAVRelevant:(BOOL)a5 notifyRemote:(BOOL)a6 forScene:(id)a7;
- (BOOL)isHostedInAnotherProcess;
- (BOOL)needsToShowKeyboard;
- (BOOL)needsToShowKeyboardForViewServiceHost;
- (BOOL)shouldIgnoreInputDestinationChange:(BOOL)a3 withIAVHeight:(double)a4;
- (BOOL)shouldSnapshot;
- (BOOL)updatingKeyWindow;
- (BOOL)wantsToShowKeyboard;
- (CGRect)keyboardFrameIncludingRemoteIAV;
- (NSMutableDictionary)callerIDs;
- (NSMutableSet)activePIDs;
- (NSMutableSet)pendingKeyboardGrabs;
- (NSString)focusedSceneIdentityStringOrIdentifier;
- (_UIKeyboardArbiterClientInputDestination)init;
- (id)_activeScreen;
- (id)currentHostedPIDs;
- (id)prepareForHostedWindowWithScene:(id)a3;
- (unint64_t)localSceneCount;
- (void)_layoutKeyboardViews:(id)a3;
- (void)_performRequiredSceneUpdateIfPermittedForWindow:(uint64_t)a3 withContext:;
- (void)addWindowHostingPID:(int)a3 callerID:(id)a4;
- (void)applicationKeyWindowDidChange:(id)a3;
- (void)clearKeyboardSceneIdentifierEnteringForeground:(id)a3;
- (void)completeMoveKeyboard;
- (void)configureArbiterCommunication:(id)a3;
- (void)didBecomeActive:(id)a3;
- (void)didFailArbiterConnection;
- (void)didRemoveDeactivationReason:(id)a3;
- (void)didSuspend:(id)a3;
- (void)finishWithHostedWindow;
- (void)handleKeyboardUIDidChange:(id)a3;
- (void)handleKeyboardUITrackingChange:(id)a3;
- (void)keyboardUIDidChange:(id)a3 onComplete:(id)a4;
- (void)peekApplicationEvent:(id)a3;
- (void)performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate:(void *)a1;
- (void)performRequiredSceneUpdateIfPermittedForViewServiceHostWindow:(uint64_t)a3 servicePID:;
- (void)queue_activeProcessResignWithCompletion:(id)a3;
- (void)queue_endInputSessionWithCompletion:(id)a3;
- (void)queue_keyboardChanged:(id)a3 onComplete:(id)a4;
- (void)queue_keyboardUIDidChange:(id)a3 onComplete:(id)a4;
- (void)queue_sceneBecameFocused:(id)a3 withCompletion:(id)a4;
- (void)queue_setKeyboardDisabled:(BOOL)a3 withCompletion:(id)a4;
- (void)removeWindowHostingPID:(int)a3 callerID:(id)a4;
- (void)resignFirstResponderIfNeeded;
- (void)restorePreservedInputViewsIfNecessary;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setActivePIDs:(id)a3;
- (void)setCallerIDs:(id)a3;
- (void)setCurrentClientState:(id)a3;
- (void)setFocusedSceneIdentityStringOrIdentifier:(id)a3;
- (void)setKeyboardSceneIdentifierEnteringForegroundForScene:(id)a3;
- (void)setPendingKeyboardGrabs:(id)a3;
- (void)setSnapshotting:(BOOL)a3;
- (void)setSuppressingKeyboard:(BOOL)a3 forScene:(id)a4;
- (void)setUpdatingKeyWindow:(BOOL)a3;
- (void)setWindowEnabled:(BOOL)a3;
- (void)setWindowEnabled:(BOOL)a3 force:(BOOL)a4;
- (void)setWindowHostingPID:(int)a3 active:(BOOL)a4;
- (void)signalToProxyKeyboardChanged:(id)a3 onCompletion:(id)a4;
- (void)startConnection;
- (void)startConnectionWithCompletion:(id)a3;
- (void)stopConnection;
- (void)syncKeyboardUIChangeInfo:(id)a3;
- (void)updateWindowState;
- (void)userSelectedApp:(id)a3 onCompletion:(id)a4;
- (void)willAddDeactivationReason:(id)a3;
- (void)willResignActive:(id)a3;
- (void)willResume:(id)a3;
@end

@implementation _UIKeyboardArbiterClientInputDestination

- (_UIKeyboardArbiterClientInputDestination)init
{
  v12.receiver = self;
  v12.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  v2 = [(_UIKeyboardArbiterClient *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_clientChangeResponseLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendingKeyboardGrabs = v3->_pendingKeyboardGrabs;
    v3->_pendingKeyboardGrabs = v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activePIDs = v3->_activePIDs;
    v3->_activePIDs = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    callerIDs = v3->_callerIDs;
    v3->_callerIDs = v8;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v3 selector:sel_sceneDidDisconnect_ name:@"UISceneDidDisconnectNotification" object:0];
    [v10 addObserver:v3 selector:sel_willResume_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
    [v10 addObserver:v3 selector:sel_didSuspend_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
    [v10 addObserver:v3 selector:sel_applicationKeyWindowDidChange_ name:@"_UIWindowDidBecomeApplicationKeyNotification" object:0];
    [v10 addObserver:v3 selector:sel_willResignActive_ name:@"UIApplicationWillResignActiveNotification" object:0];
    [v10 addObserver:v3 selector:sel_didBecomeActive_ name:@"UIApplicationDidBecomeActiveNotification" object:0];
    [v10 addObserver:v3 selector:sel_willAddDeactivationReason_ name:@"_UIApplicationWillAddDeactivationReasonNotification" object:0];
    [v10 addObserver:v3 selector:sel_didRemoveDeactivationReason_ name:@"_UIApplicationDidRemoveDeactivationReasonNotification" object:0];
    [v10 addObserver:v3 selector:sel_applicationResume_ name:@"UIApplicationResumedEventsOnlyNotification" object:UIApp];
    [v10 addObserver:v3 selector:sel_sceneWillEnterForeground_ name:@"UISceneWillEnterForegroundNotification" object:0];
    [v10 addObserver:v3 selector:sel_sceneDidEnterBackground_ name:@"UISceneDidEnterBackgroundNotification" object:0];
    [v10 addObserver:v3 selector:sel_sceneDidActivate_ name:@"UISceneDidActivateNotification" object:0];
  }
  return v3;
}

- (id)currentHostedPIDs
{
  v2 = [(_UIKeyboardArbiterClientInputDestination *)self activePIDs];
  v3 = [v2 allObjects];

  return v3;
}

- (void)startConnection
{
}

- (void)startConnectionWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74___UIKeyboardArbiterClientInputDestination_startConnectionWithCompletion___block_invoke;
  v6[3] = &unk_1E53111B0;
  objc_copyWeak(&v7, &location);
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  [(_UIKeyboardArbiterClient *)&v5 startConnectionWithCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)stopConnection
{
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  [(_UIKeyboardArbiterClient *)&v3 stopConnection];
  [(_UIKeyboardArbiterClient *)self cleanSuppression];
}

- (void)configureArbiterCommunication:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F29280];
  id v4 = a3;
  objc_super v5 = [v3 interfaceWithProtocol:&unk_1ED6D2708];
  [v4 setRemoteObjectInterface:v5];

  v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED701060];
  [v4 setExportedInterface:v6];

  id v7 = KeyboardArbiterClientLog_3();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    int v10 = 138412802;
    v11 = v9;
    __int16 v12 = 2112;
    v13 = &unk_1ED6D2708;
    __int16 v14 = 2112;
    v15 = &unk_1ED701060;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination configureArbiterCommunication:]   >>> configuring input destination protocol for %@, remote: %@, exported: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)didFailArbiterConnection
{
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  [(_UIKeyboardArbiterClient *)&v3 didFailArbiterConnection];
  [(_UIKeyboardArbiterClient *)self setDisableBecomeFirstResponder:0];
}

- (void)setCurrentClientState:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_UIKeyboardArbiterClient *)self currentClientState];
  [v5 keyboardIAVHeight];
  double v7 = v6;
  [v4 keyboardIAVHeight];
  double v9 = vabdd_f64(v7, v8);

  if (v9 > 0.00000011920929) {
    [(_UIKeyboardArbiterClient *)self setDidSignalKeyboardChangedForCurrentKeyboard:0];
  }
  v10.receiver = self;
  v10.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  [(_UIKeyboardArbiterClient *)&v10 setCurrentClientState:v4];
}

- (void)setSnapshotting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(_UIKeyboardArbiterClient *)self snapshotting];
  v16.receiver = self;
  v16.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  [(_UIKeyboardArbiterClient *)&v16 setSnapshotting:v3];
  if (v5 != v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v6 = +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 0, 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
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
          v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v11 _isTextEffectsWindow]) {
            [v11 _updateRootViewConstraintsForInterfaceOrientationAndStatusBarHeight];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)shouldSnapshot
{
  BOOL v3 = +[_UIKeyboardArbiterClient mainBundleIdentifier];
  LOBYTE(self) = ![(_UIKeyboardArbiterClient *)self isSpotlight:v3];

  return (char)self;
}

- (void)restorePreservedInputViewsIfNecessary
{
  [(_UIKeyboardArbiterClientInputDestination *)self userSelectedApp:0 onCompletion:0];
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  [(_UIKeyboardArbiterClient *)&v3 restorePreservedInputViewsIfNecessary];
}

+ (id)currentBundleIdentifier
{
  if (qword_1EB25D280 != -1) {
    dispatch_once(&qword_1EB25D280, &__block_literal_global_207_3);
  }
  v2 = (void *)qword_1EB25D288;
  return v2;
}

- (void)willResume:(id)a3
{
  id v4 = a3;
  if (![(_UIKeyboardArbiterClient *)self enqueuedWillEnterForegroundActions])
  {
    [(_UIKeyboardArbiterClient *)self setEnqueuedWillEnterForegroundActions:1];
    BOOL v5 = [(id)UIApp _systemAnimationFenceExemptQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55___UIKeyboardArbiterClientInputDestination_willResume___block_invoke;
    v6[3] = &unk_1E52D9F98;
    void v6[4] = self;
    id v7 = v4;
    [v5 performAsync:v6];
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
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
      id v7 = [(_UIKeyboardArbiterClient *)self requiredScene];
      uint64_t v8 = v7;
      if (v7)
      {
        uint64_t v9 = [v7 identityToken];
        objc_super v10 = [v9 stringRepresentation];
      }
      else
      {
        objc_super v10 = [(_UIKeyboardArbiterClientInputDestination *)self focusedSceneIdentityStringOrIdentifier];
      }
      v11 = [(id)objc_opt_class() keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:v6];
      unsigned int v12 = BSEqualStrings();
      long long v13 = +[UIWindowScene _keyWindowScene]();
      int v14 = [v13 _isTargetOfKeyboardEventDeferringEnvironment];

      if ((v12 & 1) != 0 || v14)
      {
        BOOL v15 = [(_UIKeyboardArbiterClientInputDestination *)self wantsToShowKeyboard];
        objc_super v16 = KeyboardArbiterClientLog_3();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          int v19 = 138413314;
          v20 = v11;
          __int16 v21 = 1024;
          unsigned int v22 = v12;
          __int16 v23 = 1024;
          BOOL v24 = v15;
          __int16 v25 = 1024;
          BOOL v26 = [(_UIKeyboardArbiterClient *)self currentInputDestination];
          __int16 v27 = 1024;
          BOOL v28 = [(_UIKeyboardArbiterClient *)self keyboardVisible];
          _os_log_debug_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination sceneDidDisconnect:]  Performing required scene update for disconnecting scene: %@; needsUpdateToNil: %d; wantsToShowKeyboardForWindow: %d; hasCurrentKeyboard: %d; keyboardVisible: %d",
            (uint8_t *)&v19,
            0x24u);
        }

        if (v12)
        {
          v17 = 0;
          uint64_t v18 = 0x1000000;
        }
        else
        {
          v17 = +[UIWindow _applicationKeyWindow];
          uint64_t v18 = 16777472;
        }
        -[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:](self, v17, v18 | v12);
      }
    }
  }
  else
  {

    double v6 = 0;
  }
}

- (void)_performRequiredSceneUpdateIfPermittedForWindow:(uint64_t)a3 withContext:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    if ((a3 & 0x100) != 0) {
      int v6 = [a1 currentInputDestination] ^ 1;
    }
    else {
      int v6 = 1;
    }
    int v7 = [a1 updatingKeyWindow];
    int v8 = v7 ^ 1;
    if ((v7 & 1) == 0 && (a3 & 1) == 0) {
      int v8 = [a1 _sceneFocusUpdatePermittedForWindow:v5] & v6;
    }
    uint64_t v9 = a3 & 0x1000000;
    uint64_t v10 = a3 & 0x100000000;
    unint64_t v11 = a3 & 0x10000;
    unsigned int v12 = KeyboardArbiterClientLog_3();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67110656;
      *(_DWORD *)v35 = v8;
      *(_WORD *)&v35[4] = 2048;
      *(void *)&v35[6] = v5;
      __int16 v36 = 1024;
      int v37 = a3 & 1;
      __int16 v38 = 1024;
      int v39 = (unint64_t)(a3 & 0x100) >> 8;
      __int16 v40 = 1024;
      int v41 = v11 >> 16;
      __int16 v42 = 1024;
      unsigned int v43 = (a3 & 0x1000000) >> 24;
      __int16 v44 = 1024;
      int v45 = (a3 & 0x100000000uLL) >> 32;
      _os_log_debug_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:]  Update is permitted: %d; for window: %p; forcingUpdate: %d; consideringCurrentKeyboard: %d; updateFocusedSceneIdentity"
        "StringOrIdentifierIfNil: %d; updateProxyFocusContext: %d; notifyViewServiceHostIfNeeded: %d",
        buf,
        0x30u);
    }

    if (v8)
    {
      long long v13 = [v5 windowScene];
      int v14 = [v13 _settingsScene];

      BOOL v15 = [v5 windowScene];
      objc_super v16 = [v15 _settingsScene];

      v17 = [v16 _FBSScene];

      uint64_t v18 = [v17 identityToken];
      uint64_t v19 = [a1 focusedSceneIdentityStringOrIdentifier];
      BOOL v20 = (v19 | v11) == 0;
      if (!v5 || v17)
      {
        v31 = v14;
        unsigned int v22 = [v18 stringRepresentation];
        BOOL v24 = KeyboardArbiterClientLog_3();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v35 = v22;
          _os_log_debug_impl(&dword_1853B0000, v24, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:]  Setting required scene: %@", buf, 0xCu);
        }

        [a1 setRequiredScene:v17];
        if (!v20)
        {
          __int16 v25 = KeyboardArbiterClientLog_3();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v35 = v22;
            _os_log_debug_impl(&dword_1853B0000, v25, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:]  Focusing scene identity: %@", buf, 0xCu);
          }

          [a1 setFocusedSceneIdentityStringOrIdentifier:v22];
        }
        if (v9)
        {
          BOOL v26 = +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:contextID:](UIKBArbiterClientFocusContext, "focusContextForSceneIdentity:contextID:", v18, [v5 _contextId]);
          __int16 v27 = KeyboardArbiterClientLog_3();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v35 = v26;
            _os_log_debug_impl(&dword_1853B0000, v27, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:]  Updating proxy context: %@", buf, 0xCu);
          }

          BOOL v28 = [a1 arbiterProxy];
          [v28 setClientFocusContext:v26];
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
LABEL_31:
          if (v10
            && ([v5 _isTextEffectsWindow] & 1) == 0
            && ([v5 _isRemoteKeyboardWindow] & 1) == 0)
          {
            v32 = @"_UIRemoteKeyboardsHostedWindowUserInfoKey";
            id v33 = v5;
            uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
            v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v30 postNotificationName:@"_UIRemoteKeyboardsServiceWantsKeyboardFocusWithoutFirstResponderNotification" object:0 userInfo:v29];
          }
          goto LABEL_36;
        }
        v31 = v14;
        unsigned int v22 = [(id)objc_opt_class() keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:v14];
        __int16 v23 = KeyboardArbiterClientLog_3();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v35 = v22;
          _os_log_debug_impl(&dword_1853B0000, v23, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:]  Focusing scene identifier: %@", buf, 0xCu);
        }

        [a1 setFocusedSceneIdentityStringOrIdentifier:v22];
      }

      int v14 = v31;
      goto LABEL_31;
    }
  }
LABEL_36:
}

- (void)didSuspend:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(_UIKeyboardArbiterClientInputDestination *)self wantsToShowKeyboard];
  int v6 = KeyboardArbiterClientLog_3();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    BOOL v9 = v5;
    __int16 v10 = 1024;
    BOOL v11 = [(_UIKeyboardArbiterClient *)self currentInputDestination];
    __int16 v12 = 1024;
    BOOL v13 = [(_UIKeyboardArbiterClient *)self keyboardVisible];
    _os_log_debug_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination didSuspend:]  wantsToShowKeyboardForWindow: %d; currentInputDestination"
      ": %d; keyboardVisible: %d",
      buf,
      0x14u);
  }

  if (v5 && ![(_UIKeyboardArbiterClientInputDestination *)self isHostedInAnotherProcess]) {
    [(_UIKeyboardArbiterClientInputDestination *)self setWindowEnabled:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  [(_UIKeyboardArbiterClient *)&v7 didSuspend:v4];
  +[UIKeyboardSceneDelegate performOnControllers:&__block_literal_global_220_1];
}

- (void)willAddDeactivationReason:(id)a3
{
  id v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKey:@"_UIApplicationDeactivationReasonUserInfoKey"];
  int v6 = [v5 integerValue];

  switch(v6)
  {
    case 0:
      [(_UIKeyboardArbiterClient *)self setDeactivatedBySystemGesture:1];
      break;
    case 2:
      [(_UIKeyboardArbiterClient *)self setDeactivatedByControlCenter:1];
      break;
    case 5:
      self->_deactivatedBySystemAnimation = 1;
      break;
    case 7:
    case 14:
    case 15:
    case 16:
      objc_super v7 = [(_UIKeyboardArbiterClientInputDestination *)self focusedSceneIdentityStringOrIdentifier];
      self->_hadFocusBeforeOverlay = v7 != 0;

      if (v6 == 12) {
        goto LABEL_3;
      }
      break;
    case 12:
LABEL_3:
      id v8 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
      [v8 setDeactivating:1];

      break;
    default:
      return;
  }
}

- (void)didRemoveDeactivationReason:(id)a3
{
  id v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKey:@"_UIApplicationDeactivationReasonUserInfoKey"];
  int v6 = [v5 integerValue];

  switch(v6)
  {
    case 0:
      [(_UIKeyboardArbiterClient *)self setDeactivatedBySystemGesture:0];
      break;
    case 2:
      [(_UIKeyboardArbiterClient *)self setDeactivatedByControlCenter:0];
      break;
    case 5:
      self->_deactivatedBySystemAnimation = 0;
      break;
    case 7:
    case 14:
    case 15:
    case 16:
      if (self->_hadFocusBeforeOverlay)
      {
        objc_super v7 = [(_UIKeyboardArbiterClientInputDestination *)self focusedSceneIdentityStringOrIdentifier];

        if (v7)
        {
          id v8 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
          [v8 applicationShouldFocusWithBundle:0 onCompletion:&__block_literal_global_223_0];
        }
      }
      self->_hadFocusBeforeOverlay = 0;
      if (v6 == 12) {
        goto LABEL_6;
      }
      break;
    case 12:
LABEL_6:
      id v9 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
      [v9 setDeactivating:0];

      break;
    default:
      return;
  }
}

- (void)willResignActive:(id)a3
{
  BOOL v4 = [(_UIKeyboardArbiterClient *)self deactivatedByControlCenter]
    || self->_deactivatedBySystemAnimation;
  self->_resignActiveByControlCenter = v4;
  if ([(_UIKeyboardArbiterClient *)self currentInputDestination]
    && !self->_resignActiveByControlCenter
    && !+[UIKeyboard isSpotlight])
  {
    BOOL v5 = [(_UIKeyboardArbiterClient *)self currentClientState];
    id v6 = (id)[v5 copyWithIntersectability:0];

    [v6 setShouldTakeSnapshot:0];
    [(_UIKeyboardArbiterClientInputDestination *)self signalToProxyKeyboardChanged:v6 onCompletion:&__block_literal_global_226_0];
  }
}

- (void)didBecomeActive:(id)a3
{
  [(_UIKeyboardArbiterClient *)self checkConnection];
  if ([(_UIKeyboardArbiterClient *)self currentInputDestination]
    && !self->_resignActiveByControlCenter)
  {
    BOOL v4 = [(_UIKeyboardArbiterClient *)self backupState];
    BOOL v5 = v4;
    if (v4)
    {
      id v6 = (void *)[v4 copyWithIntersectability:1];
    }
    else
    {
      objc_super v7 = [(_UIKeyboardArbiterClient *)self currentClientState];
      id v6 = (void *)[v7 copyWithIntersectability:1];
    }
    [v6 setShouldTakeSnapshot:0];
    [(_UIKeyboardArbiterClientInputDestination *)self signalToProxyKeyboardChanged:v6 onCompletion:&__block_literal_global_228_2];
    if (![(_UIKeyboardArbiterClientInputDestination *)self isHostedInAnotherProcess]) {
      [(_UIKeyboardArbiterClientInputDestination *)self setWindowEnabled:1];
    }
  }
  self->_resignActiveByControlCenter = 0;
  [(_UIKeyboardArbiterClient *)self setDeactivatedByControlCenter:0];
  self->_deactivatedBySystemAnimation = 0;
}

- (void)setSuppressingKeyboard:(BOOL)a3 forScene:(id)a4
{
  BOOL v4 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = (UIWindowScene *)a4;
  objc_super v7 = KeyboardArbiterClientLog_3();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    BOOL v38 = v4;
    __int16 v39 = 2112;
    __int16 v40 = v6;
    __int16 v41 = 1024;
    BOOL v42 = [(_UIKeyboardArbiterClient *)self expectedSuppression];
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination setSuppressingKeyboard:forScene:]  setSuppressingKeyboard: %d forScene: %@ (expectedSuppression: %d)", buf, 0x18u);
  }

  if ([(_UIKeyboardArbiterClient *)self expectedSuppression] != v4)
  {
    [(_UIKeyboardArbiterClient *)self setExpectedSuppression:v4];
    if ([(_UIKeyboardArbiterClient *)self expectedSuppression])
    {
      id v8 = +[UIDevice currentDevice];
      uint64_t v9 = [v8 userInterfaceIdiom];

      if ((v9 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        dispatch_time_t v10 = dispatch_time(0, 500000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __76___UIKeyboardArbiterClientInputDestination_setSuppressingKeyboard_forScene___block_invoke;
        block[3] = &unk_1E52D9F70;
        block[4] = self;
        dispatch_after(v10, MEMORY[0x1E4F14428], block);
      }
    }
    BOOL v11 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    __int16 v12 = [v11 containerWindow];

    BOOL v13 = [(_UIKeyboardArbiterClient *)self kbUIStateDelegate];
    uint64_t v14 = [v12 screen];
    BOOL v15 = [v13 mostActiveWindowSceneOnScreen:v14];

    if (v4)
    {
      if (!v6) {
        id v6 = v15;
      }
      objc_storeStrong((id *)&self->_suppressedScene, v6);
    }
    else if (!v6)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      objc_super v16 = +[UIScene _scenesIncludingInternal:1];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v32;
LABEL_14:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v16);
          }
          BOOL v21 = *(UIWindowScene **)(*((void *)&v31 + 1) + 8 * v20);
          if (v21 == self->_suppressedScene) {
            break;
          }
          if (v18 == ++v20)
          {
            uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v36 count:16];
            if (v18) {
              goto LABEL_14;
            }
            goto LABEL_20;
          }
        }
        id v6 = v21;

        if (v6) {
          goto LABEL_23;
        }
      }
      else
      {
LABEL_20:
      }
      id v6 = v15;
    }
LABEL_23:
    unsigned int v22 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
    [v22 notifyHostedPIDsOfSuppression:v4];

    __int16 v23 = +[UIPeripheralHost sharedInstance];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76___UIKeyboardArbiterClientInputDestination_setSuppressingKeyboard_forScene___block_invoke_2;
    aBlock[3] = &unk_1E52DC3D0;
    id v24 = v23;
    id v28 = v24;
    BOOL v30 = v4;
    id v6 = v6;
    uint64_t v29 = v6;
    __int16 v25 = (void (**)(void))_Block_copy(aBlock);
    if ([(id)UIApp isSuspended])
    {
      BOOL v26 = +[UIInputViewAnimationStyle animationStyleImmediate];
      [v24 pushAnimationStyle:v26];

      +[UIView performWithoutAnimation:v25];
      [v24 popAnimationStyle];
    }
    else
    {
      v25[2](v25);
    }
  }
}

- (BOOL)shouldIgnoreInputDestinationChange:(BOOL)a3 withIAVHeight:(double)a4
{
  if ([(_UIKeyboardArbiterClient *)self currentInputDestination] != a3) {
    return 0;
  }
  objc_super v7 = [(_UIKeyboardArbiterClient *)self currentClientState];
  [v7 keyboardIAVHeight];
  BOOL v6 = vabdd_f64(v8, a4) < 0.00000011920929;

  return v6;
}

- (BOOL)inputDestinationDidChange:(BOOL)a3 withIAVHeight:(double)a4 isIAVRelevant:(BOOL)a5 notifyRemote:(BOOL)a6 forScene:(id)a7
{
  int v7 = a6;
  BOOL v8 = a5;
  BOOL v10 = a3;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  BOOL v13 = KeyboardArbiterClientLog_3();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = v10;
    __int16 v70 = 1024;
    int v71 = v7;
    _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination inputDestinationDidChange:withIAVHeight:isIAVRelevant:notifyRemote:forScene:]  inputDestDidChange: %{BOOL}d; shouldNotify: %{BOOL}d",
      (uint8_t *)&buf,
      0xEu);
  }

  if (![(_UIKeyboardArbiterClientInputDestination *)self shouldIgnoreInputDestinationChange:v10 withIAVHeight:a4])
  {
    [(_UIKeyboardArbiterClientInputDestination *)self focusedSceneIdentityStringOrIdentifier];

    context = (void *)MEMORY[0x18C108260]([(_UIKeyboardArbiterClient *)self checkConnection]);
    [(_UIKeyboardArbiterClient *)self setBackupState:0];
    objc_super v16 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
    uint64_t v17 = v16;
    double v18 = 0.0;
    if (v8) {
      double v18 = a4;
    }
    [v16 notifyIAVHeight:v18];

    BOOL v19 = [(_UIKeyboardArbiterClient *)self currentInputDestination];
    if (v10)
    {
      if (v19)
      {
        uint64_t v20 = [(_UIKeyboardArbiterClient *)self currentClientState];
        [v20 keyboardIAVHeight];
        if (v21 == a4)
        {
          BOOL v22 = [(_UIKeyboardArbiterClient *)self didSignalKeyboardChangedForCurrentKeyboard];

          if (v22)
          {
            __int16 v23 = KeyboardArbiterClientLog_3();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf) = 0;
              id v24 = "-[_UIKeyboardArbiterClientInputDestination inputDestinationDidChange:withIAVHeight:isIAVRelevant:not"
                    "ifyRemote:forScene:]  nothing changed, returning";
LABEL_20:
              _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&buf, 2u);
              goto LABEL_21;
            }
            goto LABEL_21;
          }
        }
        else
        {
        }
      }
      if ([(_UIKeyboardArbiterClient *)self currentInputDestination])
      {
        uint64_t v29 = [(_UIKeyboardArbiterClient *)self currentClientState];
        [v29 keyboardIAVHeight];
        if (v30 != a4)
        {
          long long v31 = [(_UIKeyboardArbiterClient *)self kbUIStateDelegate];
          int v32 = [v31 updatingPreferences];

          v7 |= v32 ^ 1;
        }
      }
      long long v33 = +[_UIKeyboardChangedInformation informationForKeyboardUpWithIAVHeight:a4];
      [(_UIKeyboardArbiterClientInputDestination *)self setCurrentClientState:v33];

      [(_UIKeyboardArbiterClient *)self resetSnapshotWithWindowCheck:0];
    }
    else
    {
      if (!v19)
      {
        BOOL v26 = [(_UIKeyboardArbiterClient *)self currentUIState];
        [v26 resetAnimationFencing];

        [(_UIKeyboardArbiterClient *)self setCurrentInputDestination:0];
        BOOL v27 = [(_UIKeyboardArbiterClient *)self keyboardVisible];
        id v28 = [(_UIKeyboardArbiterClient *)self eventObserver];
        [v28 setKeyboardIsVisible:v27];

        __int16 v23 = KeyboardArbiterClientLog_3();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          id v24 = "-[_UIKeyboardArbiterClientInputDestination inputDestinationDidChange:withIAVHeight:isIAVRelevant:notifyR"
                "emote:forScene:]  another keyboard hid us!";
          goto LABEL_20;
        }
LABEL_21:
        BOOL v15 = 0;
LABEL_43:

        goto LABEL_44;
      }
      if ([(_UIKeyboardArbiterClient *)self currentInputDestination])
      {
        __int16 v25 = +[_UIKeyboardChangedInformation informationForKeyboardDown];
        [(_UIKeyboardArbiterClientInputDestination *)self setCurrentClientState:v25];
      }
    }
    if ([(id)UIApp _isSpringBoard])
    {
      long long v34 = [v12 keyboardSceneDelegate];
      __int16 v23 = [v34 scene];
    }
    else
    {
      __int16 v23 = v12;
    }
    v35 = [(id)objc_opt_class() keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:v23];
    __int16 v36 = [(_UIKeyboardArbiterClient *)self currentClientState];
    [v36 setSourceSceneIdentityString:v35];

    int v37 = _UIMainBundleIdentifier();
    BOOL v38 = [(_UIKeyboardArbiterClient *)self currentClientState];
    [v38 setSourceBundleIdentifier:v37];

    __int16 v39 = [v23 screen];
    __int16 v40 = [v39 displayConfiguration];
    __int16 v41 = [v40 _nameForDisplayType];
    BOOL v42 = [(_UIKeyboardArbiterClient *)self currentClientState];
    [v42 setSourceDisplayIdentifier:v41];

    BOOL v43 = [(_UIKeyboardArbiterClientInputDestination *)self shouldSnapshot];
    __int16 v44 = [(_UIKeyboardArbiterClient *)self currentClientState];
    [v44 setShouldTakeSnapshot:v43];

    BOOL v45 = [(_UIKeyboardArbiterClientInputDestination *)self localSceneCount] > 1;
    uint64_t v46 = [(_UIKeyboardArbiterClient *)self currentClientState];
    [v46 setMultipleScenes:v45];

    v47 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v48 = [v47 hardwareKeyboardExclusivityIdentifier];
    v49 = [(_UIKeyboardArbiterClient *)self currentClientState];
    [v49 setIsOneness:v48 != 0];

    v50 = [(_UIKeyboardArbiterClient *)self currentUIState];
    uint64_t v51 = [v50 resizing];
    v52 = [(_UIKeyboardArbiterClient *)self currentClientState];
    [v52 setResizing:v51];

    BOOL v53 = [(_UIKeyboardArbiterClient *)self keyboardVisible];
    v54 = [(_UIKeyboardArbiterClient *)self eventObserver];
    [v54 setKeyboardIsVisible:v53];

    [(_UIKeyboardArbiterClient *)self setCurrentInputDestination:v10];
    id v55 = [(_UIKeyboardArbiterClient *)self currentClientState];
    if (v55) {
      int v56 = v7;
    }
    else {
      int v56 = 0;
    }
    if (v56 == 1
      && ([(_UIKeyboardArbiterClientInputDestination *)self allowedToShowKeyboard]
       || [(_UIKeyboardArbiterClient *)self hostedCount]))
    {
      v57 = [(_UIKeyboardArbiterClient *)self kbUIStateDelegate];
      char v58 = [v57 layoutIsResizing];

      if (v58)
      {
        BOOL v15 = 0;
LABEL_42:
        [(_UIKeyboardArbiterClient *)self setExpectingInitialState:0];
        +[UIKeyboardSceneDelegate performOnControllers:&__block_literal_global_235_3];
        goto LABEL_43;
      }
      v59 = +[_UIKBArbiterClientToken uniqueToken];
      v60 = [(id)objc_opt_class() keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:v12];
      [v59 setSceneIdentityString:v60];

      v61 = [(_UIKeyboardArbiterClientInputDestination *)self pendingKeyboardGrabs];
      [v61 addObject:v59];

      objc_initWeak(&buf, self);
      v62 = [(_UIKeyboardArbiterClient *)self currentClientState];
      v63 = (void *)[v62 copy];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __120___UIKeyboardArbiterClientInputDestination_inputDestinationDidChange_withIAVHeight_isIAVRelevant_notifyRemote_forScene___block_invoke;
      v66[3] = &unk_1E52D9960;
      objc_copyWeak(&v68, &buf);
      id v55 = v59;
      id v67 = v55;
      [(_UIKeyboardArbiterClientInputDestination *)self signalToProxyKeyboardChanged:v63 onCompletion:v66];

      objc_destroyWeak(&v68);
      objc_destroyWeak(&buf);
      BOOL v15 = 1;
    }
    else
    {
      BOOL v15 = 0;
    }

    goto LABEL_42;
  }
  uint64_t v14 = KeyboardArbiterClientLog_3();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination inputDestinationDidChange:withIAVHeight:isIAVRelevant:notifyRemote:forScene:]  returning early due to shouldIgnoreInputDestinationChange:", (uint8_t *)&buf, 2u);
  }

  BOOL v15 = 0;
LABEL_44:

  return v15;
}

- (void)_layoutKeyboardViews:(id)a3
{
  BOOL v4 = [(_UIKeyboardArbiterClient *)self inputWindowRootViewController];
  BOOL v5 = [v4 inputViewSet];
  id v24 = [v5 normalizePlaceholders];

  BOOL v6 = [(_UIKeyboardArbiterClient *)self inputWindowRootViewController];
  int v7 = [v6 placementIgnoringRotation];
  [v7 remoteIntrinsicContentSizeForInputViewInSet:v24 includingIAV:0];
  double v9 = v8;

  BOOL v10 = [(_UIKeyboardArbiterClient *)self inputWindowRootViewController];
  BOOL v11 = [v10 placementIgnoringRotation];
  [v11 remoteIntrinsicContentSizeForInputViewInSet:v24 includingIAV:1];
  double v13 = v12;

  double v14 = v13 - v9;
  BOOL v15 = [(_UIKeyboardArbiterClient *)self currentClientState];
  [v15 keyboardIAVHeight];
  if (vabdd_f64(v16, v14) > 0.00000011920929)
  {
    BOOL v17 = +[UIKeyboardImpl isFloating];

    if (v17) {
      goto LABEL_5;
    }
    BOOL v18 = [(_UIKeyboardArbiterClient *)self currentInputDestination];
    BOOL v15 = [(_UIKeyboardArbiterClient *)self inputWindowRootViewController];
    BOOL v19 = [v15 inputViewSet];
    uint64_t v20 = [v19 isInputAccessoryViewPlaceholder] ^ 1;
    uint64_t v21 = [(_UIKeyboardArbiterClient *)self handlingRemoteEvent] ^ 1;
    BOOL v22 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    __int16 v23 = [v22 scene];
    [(_UIKeyboardArbiterClientInputDestination *)self inputDestinationDidChange:v18 withIAVHeight:v20 isIAVRelevant:v21 notifyRemote:v23 forScene:v14];
  }
LABEL_5:
}

- (BOOL)_didHandleKeyboardClientChange:(id)a3 shouldConsiderSnapshottingKeyboard:(BOOL)a4 isLocalEvent:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = KeyboardArbiterClientLog_3();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v5;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination _didHandleKeyboardClientChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:]  Keyboard client did change: %@ is local: %d", buf, 0x12u);
  }

  BOOL v37 = [(_UIKeyboardArbiterClient *)self handlingRemoteEvent];
  [(_UIKeyboardArbiterClient *)self setHandlingRemoteEvent:!v5];
  BOOL v9 = [(_UIKeyboardArbiterClient *)self currentInputDestination];
  *(void *)id buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v52 = 0;
  BOOL v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke;
  v47[3] = &unk_1E53111D8;
  v47[4] = self;
  id v11 = v10;
  id v48 = v11;
  id v12 = v7;
  id v49 = v12;
  v50 = buf;
  +[UIKeyboardSceneDelegate performOnControllers:v47];
  if (!*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    double v13 = [(_UIKeyboardArbiterClient *)self currentClientState];
    double v14 = [v13 sourceBundleIdentifier];
    BOOL v15 = +[_UIKeyboardArbiterClient mainBundleIdentifier];
    int v16 = [v14 isEqualToString:v15];

    if (v16)
    {
      BOOL v17 = [(_UIKeyboardArbiterClient *)self currentClientState];
      [(_UIKeyboardArbiterClient *)self setBackupState:v17];
    }
    [(_UIKeyboardArbiterClientInputDestination *)self setCurrentClientState:v12];
  }
  BOOL v18 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v19 = [v18 hardwareKeyboardExclusivityIdentifier];

  uint64_t v20 = [v12 sourceBundleIdentifier];
  if ([(_UIKeyboardArbiterClient *)self isSpotlight:v20]) {
    unsigned int v21 = (v19 == 0) ^ [v12 isOneness];
  }
  else {
    unsigned int v21 = 0;
  }

  if ([(_UIKeyboardArbiterClient *)self currentInputDestination])
  {
    if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = v21;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }
  [(_UIKeyboardArbiterClient *)self setCurrentInputDestination:v22];
  if (v5)
  {
    if ([(_UIKeyboardArbiterClientInputDestination *)self localSceneCount] >= 2)
    {
      __int16 v23 = [v12 sourceSceneIdentityString];
      BOOL v5 = v23 == 0;
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  uint64_t v43 = 0;
  __int16 v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  if (v9 && (*(unsigned char *)(*(void *)&buf[8] + 24) ? (char v24 = 1) : (char v24 = v21), (v24 & 1) == 0))
  {
    BOOL v26 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    BOOL v27 = [v26 responder];

    if (([v27 _isHostingRemoteContent] & 1) == 0)
    {
      id v28 = [v27 _responderWindow];
      [v28 _setLastFirstResponder:v27];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v29 = [v27 interactionState];
        [v28 _setLastFirstResponderInteractionState:v29];
      }
      [v28 _setWantsResponderWithoutKeyboard:1];
      [v27 resignFirstResponder];
      [v28 _setWantsResponderWithoutKeyboard:0];
      double v30 = [v28 _firstResponder];
      [v28 _setLastNextResponder:v30];
    }
    *((unsigned char *)v44 + 24) = 1;
  }
  else
  {
    [(_UIKeyboardArbiterClient *)self setUpdatingHeight:1];
    [(_UIKeyboardArbiterClient *)self performOnExistingControllers:&__block_literal_global_241_0];
    if (v21) {
      int v25 = [(id)UIApp _isSpringBoard] ^ 1;
    }
    else {
      int v25 = 0;
    }
    if (((v5 | v25) & 1) == 0)
    {
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_3;
      v40[3] = &unk_1E52FD798;
      v40[4] = self;
      id v41 = v12;
      BOOL v42 = &v43;
      +[UIKeyboardSceneDelegate performOnControllers:v40];
    }
    [(_UIKeyboardArbiterClient *)self performOnExistingControllers:&__block_literal_global_243_2];
    [(_UIKeyboardArbiterClient *)self setUpdatingHeight:0];
  }
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_7;
  v38[3] = &unk_1E5311200;
  v38[4] = self;
  id v31 = v11;
  id v39 = v31;
  +[UIKeyboardSceneDelegate performOnControllers:v38];
  if (!*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    int v32 = [(_UIKeyboardArbiterClient *)self currentUIState];
    [v32 resetAnimationFencing];
  }
  [(_UIKeyboardArbiterClient *)self setHandlingRemoteEvent:v37];
  long long v33 = [(_UIKeyboardArbiterClient *)self changeInfoDelegate];
  [v33 didHandleKeyboardClientChange:self];

  os_unfair_lock_lock(&self->_clientChangeResponseLock);
  clientChangeResponseTransaction = self->_clientChangeResponseTransaction;
  self->_clientChangeResponseTransaction = 0;

  os_unfair_lock_unlock(&self->_clientChangeResponseLock);
  BOOL v35 = *((unsigned char *)v44 + 24) != 0;

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(buf, 8);

  return v35;
}

- (void)signalToProxyKeyboardChanged:(id)a3 onCompletion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = KeyboardArbiterClientLog_3();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination signalToProxyKeyboardChanged:onCompletion:]  Signaling keyboard changed %@", (uint8_t *)&v10, 0xCu);
  }

  [(_UIKeyboardArbiterClient *)self setDidSignalKeyboardChangedForCurrentKeyboard:1];
  BOOL v9 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
  [v9 signalKeyboardClientChanged:v6 onCompletion:v7];
}

- (unint64_t)localSceneCount
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = +[UIScene _scenesIncludingInternal:1];
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
        double v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v9 = [v8 keyboardSceneDelegate];

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

- (id)_activeScreen
{
  lastScreen = self->_lastScreen;
  if (lastScreen)
  {
    uint64_t v3 = lastScreen;
LABEL_3:
    uint64_t v4 = v3;
    goto LABEL_6;
  }
  unint64_t v5 = +[UIWindowScene _keyWindowScene]();
  uint64_t v6 = [v5 screen];

  if (!v6)
  {
    uint64_t v3 = +[UIScreen mainScreen];
    goto LABEL_3;
  }
  id v7 = +[UIWindowScene _keyWindowScene]();
  uint64_t v4 = [v7 screen];

LABEL_6:
  return v4;
}

- (void)applicationKeyWindowDidChange:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 object];
  uint64_t v6 = [v4 userInfo];

  id v7 = [v6 objectForKey:@"Reason"];

  if (v7) {
    BOOL v8 = [v7 unsignedIntegerValue] == 1;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = 16777472;
  int v10 = [v5 windowScene];
  if (_UISceneSystemShellManagesKeyboardFocusIsPossibleForScene(v10)
    && (_UISceneSystemShellManagesKeyboardFocusForScene(v10) & 1) == 0)
  {
    int v11 = [v10 _isConnecting];
    if (v11) {
      uint64_t v9 = 0x1000000;
    }
  }
  else
  {
    int v11 = 0;
  }
  long long v12 = KeyboardArbiterClientLog_3();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    long long v14 = [v5 windowScene];
    BOOL v15 = [v14 _settingsScene];

    uint64_t v16 = [v15 _FBSScene];

    BOOL v17 = [v16 identityToken];
    BOOL v18 = [v17 stringRepresentation];

    *(_DWORD *)id buf = 134218754;
    uint64_t v20 = v5;
    __int16 v21 = 2112;
    uint64_t v22 = v18;
    __int16 v23 = 2048;
    uint64_t v24 = [v7 unsignedIntegerValue];
    __int16 v25 = 1024;
    int v26 = v11;
    _os_log_debug_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination applicationKeyWindowDidChange:]  Application key window changed to window: %p; scene identity: %@; for reason: %lu; nonSystemShellManagedScene: %{BOOL}d",
      buf,
      0x26u);
  }
  if (v8) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v9;
  }
  -[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:](self, v5, v13);
  +[UIKeyboardSceneDelegate performOnControllers:&__block_literal_global_247_0];
}

- (BOOL)isHostedInAnotherProcess
{
  v2 = [(_UIKeyboardArbiterClient *)self existingInputWindowRootViewController];
  uint64_t v3 = [v2 view];
  id v4 = [v3 window];
  if ([v4 _isHostedInAnotherProcess])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = +[UIWindow _applicationKeyWindow];
    char v5 = [v6 _isHostedInAnotherProcess];
  }
  return v5;
}

- (BOOL)hasWindowHostingPID:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  char v5 = [(_UIKeyboardArbiterClientInputDestination *)self activePIDs];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)hasWindowHostingCallerID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = [(_UIKeyboardArbiterClientInputDestination *)self callerIDs];
    char v6 = [v5 allKeys];
    char v7 = [v6 containsObject:v4];
  }
  else
  {
    BOOL v8 = KeyboardArbiterClientLog_3();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination hasWindowHostingCallerID:]  nil callerID", v10, 2u);
    }

    char v7 = 0;
  }

  return v7;
}

- (void)addWindowHostingPID:(int)a3 callerID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  char v7 = [NSNumber numberWithInt:v4];
  [(_UIKeyboardArbiterClientInputDestination *)self setWindowHostingPID:v4 active:1];
  if (v6)
  {
    BOOL v8 = [(_UIKeyboardArbiterClientInputDestination *)self callerIDs];
    [v8 setObject:v7 forKey:v6];
  }
  else
  {
    BOOL v8 = KeyboardArbiterClientLog_3();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination addWindowHostingPID:callerID:]  nil callerID", v9, 2u);
    }
  }
}

- (void)removeWindowHostingPID:(int)a3 callerID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  char v7 = [NSNumber numberWithInt:v4];
  if (v6)
  {
    BOOL v8 = [(_UIKeyboardArbiterClientInputDestination *)self callerIDs];
    [v8 removeObjectForKey:v6];
  }
  else
  {
    BOOL v8 = KeyboardArbiterClientLog_3();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v12 = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination removeWindowHostingPID:callerID:]  nil callerID", v12, 2u);
    }
  }

  uint64_t v9 = [(_UIKeyboardArbiterClientInputDestination *)self callerIDs];
  int v10 = [v9 allValues];
  char v11 = [v10 containsObject:v7];

  if ((v11 & 1) == 0) {
    [(_UIKeyboardArbiterClientInputDestination *)self setWindowHostingPID:v4 active:0];
  }
}

- (void)setWindowHostingPID:(int)a3 active:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    uint64_t v5 = *(void *)&a3;
    objc_msgSend(NSNumber, "numberWithInt:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    char v7 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
    [v7 setWindowHostingPID:v5 active:v4];

    BOOL v8 = [(_UIKeyboardArbiterClientInputDestination *)self activePIDs];
    uint64_t v9 = v8;
    if (v4)
    {
      [v8 addObject:v10];

      if (![(_UIKeyboardArbiterClientInputDestination *)self isHostedInAnotherProcess]) {
        [(_UIKeyboardArbiterClientInputDestination *)self setWindowEnabled:[(_UIKeyboardArbiterClientInputDestination *)self allowedToShowKeyboard]];
      }
    }
    else
    {
      [v8 removeObject:v10];

      if (![(_UIKeyboardArbiterClient *)self hasAnyHostedViews]) {
        [(_UIKeyboardArbiterClientInputDestination *)self completeMoveKeyboard];
      }
    }
  }
}

- (BOOL)wantsToShowKeyboard
{
  if ([(_UIKeyboardArbiterClient *)self currentInputDestination]
    || [(_UIKeyboardArbiterClient *)self hasAnyHostedViews])
  {
    return 1;
  }
  BOOL v4 = [(_UIKeyboardArbiterClient *)self keyboardSnapshot];
  if (v4) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = [(_UIKeyboardArbiterClient *)self isOnScreenRotating];
  }

  return v3;
}

- (id)prepareForHostedWindowWithScene:(id)a3
{
  ++self->_hostedCount;
  BOOL v4 = [a3 screen];
  [(_UIKeyboardArbiterClient *)self checkConnection];
  if (self->_hostedCount == 1)
  {
    uint64_t v5 = +[UIPeripheralHost sharedInstance];
    [v5 forceReloadInputViews];
  }
  return 0;
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

- (CGRect)keyboardFrameIncludingRemoteIAV
{
  int v2 = [(_UIKeyboardArbiterClient *)self currentClientState];
  [v2 keyboardPositionWithRemoteIAV];
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

- (BOOL)needsToShowKeyboard
{
  BOOL v3 = [(_UIKeyboardArbiterClientInputDestination *)self allowedToShowKeyboard];
  if (v3)
  {
    LOBYTE(v3) = [(_UIKeyboardArbiterClientInputDestination *)self wantsToShowKeyboard];
  }
  return v3;
}

- (BOOL)needsToShowKeyboardForViewServiceHost
{
  BOOL v3 = [(_UIKeyboardArbiterClientInputDestination *)self allowedToShowKeyboard];
  if (v3)
  {
    LOBYTE(v3) = [(_UIKeyboardArbiterClientInputDestination *)self wantsToShowKeyboardForViewServiceHost];
  }
  return v3;
}

- (BOOL)allowedToShowKeyboard
{
  v4.receiver = self;
  v4.super_class = (Class)_UIKeyboardArbiterClientInputDestination;
  return [(_UIKeyboardArbiterClient *)&v4 allowedToShowKeyboard]
      || [(_UIKeyboardArbiterClientInputDestination *)self isHostedInAnotherProcess];
}

- (void)setKeyboardSceneIdentifierEnteringForegroundForScene:(id)a3
{
  objc_super v4 = [a3 _sceneIdentifier];
  keyboardSceneIdentifierEnteringForeground = self->_keyboardSceneIdentifierEnteringForeground;
  self->_keyboardSceneIdentifierEnteringForeground = v4;
}

- (void)clearKeyboardSceneIdentifierEnteringForeground:(id)a3
{
  objc_super v4 = [a3 object];
  keyboardSceneIdentifierEnteringForeground = self->_keyboardSceneIdentifierEnteringForeground;
  id v8 = v4;
  double v6 = [v4 _sceneIdentifier];
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
  objc_super v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v5 = [v4 scene];

  double v6 = v9;
  if (v9 == v5)
  {
    double v7 = [v9 _sceneIdentifier];
    keyboardSceneIdentifierEnteringForeground = self->_keyboardSceneIdentifierEnteringForeground;
    self->_keyboardSceneIdentifierEnteringForeground = v7;

    double v6 = v9;
  }
}

- (BOOL)allowedToEnableKeyboardWindow
{
  BOOL v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  objc_super v4 = [v3 scene];

  if (!v4) {
    goto LABEL_9;
  }
  keyboardSceneIdentifierEnteringForeground = self->_keyboardSceneIdentifierEnteringForeground;
  double v6 = [v4 _sceneIdentifier];
  LOBYTE(keyboardSceneIdentifierEnteringForeground) = [(NSString *)keyboardSceneIdentifierEnteringForeground isEqualToString:v6];

  if (keyboardSceneIdentifierEnteringForeground) {
    goto LABEL_7;
  }
  if (![v4 activationState]) {
    goto LABEL_7;
  }
  if ([v4 activationState] != 1) {
    goto LABEL_9;
  }
  double v7 = [(_UIKeyboardArbiterClient *)self currentUIState];
  int v8 = [v7 keyboardOnScreen];

  if (!v8) {
    goto LABEL_9;
  }
  if ([v4 _canDynamicallySpecifySupportedInterfaceOrientations]) {
    goto LABEL_7;
  }
  double v10 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v11 = [v10 visualModeManager];
  char v12 = [v11 windowingModeEnabled];

  double v13 = [v4 coordinateSpace];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;

  BOOL v18 = [v4 screen];
  [v18 bounds];
  double v20 = v19;
  double v22 = v21;

  if (v12) {
    goto LABEL_9;
  }
  if (v15 == v20 && v17 == v22) {
LABEL_7:
  }
    BOOL v9 = 1;
  else {
LABEL_9:
  }
    BOOL v9 = 0;

  return v9;
}

- (void)resignFirstResponderIfNeeded
{
  int v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v6 = [v2 responder];

  if (([v6 _isHostingRemoteContent] & 1) == 0)
  {
    BOOL v3 = [v6 _responderWindow];
    [v3 _setLastFirstResponder:v6];
    if (objc_opt_respondsToSelector())
    {
      objc_super v4 = [v6 interactionState];
      [v3 _setLastFirstResponderInteractionState:v4];
    }
    [v6 resignFirstResponder];
    id v5 = [v3 _firstResponder];
    [v3 _setLastNextResponder:v5];
  }
}

- (void)setWindowEnabled:(BOOL)a3
{
}

- (void)setWindowEnabled:(BOOL)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v6 = a3
    && [(_UIKeyboardArbiterClientInputDestination *)self allowedToEnableKeyboardWindow];
  if (v6 && v4) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = v6;
  }
  int v8 = [(_UIKeyboardArbiterClient *)self requiredScene];
  BOOL v9 = [v8 identityToken];

  double v10 = off_1E5311290[v7];
  double v11 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  char v12 = [v11 responder];
  double v13 = [v12 _responderWindow];
  uint64_t v14 = [v13 _contextId];

  if (!v14)
  {
    double v15 = +[UIWindow _applicationKeyWindow];
    uint64_t v14 = [v15 _contextId];
  }
  double v16 = KeyboardArbiterClientLog_3();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    double v19 = [v9 stringRepresentation];
    int v20 = 136315394;
    double v21 = v10;
    __int16 v22 = 2112;
    __int16 v23 = v19;
    _os_log_debug_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination setWindowEnabled:force:]  Setting window state: %s for scene identity: %@", (uint8_t *)&v20, 0x16u);
  }
  double v17 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
  BOOL v18 = +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:v9 contextID:v14];
  [v17 setWindowContextID:0 focusContext:v18 windowState:v7 withLevel:10000001.0];
}

- (void)updateWindowState
{
  BOOL v3 = [(_UIKeyboardArbiterClientInputDestination *)self needsToShowKeyboard];
  BOOL v4 = v3
    && [(_UIKeyboardArbiterClientInputDestination *)self needsToShowKeyboardForViewServiceHost];
  [(_UIKeyboardArbiterClientInputDestination *)self setWindowEnabled:v3 force:v4];
}

- (void)completeMoveKeyboard
{
  if (![(_UIKeyboardArbiterClientInputDestination *)self isHostedInAnotherProcess]) {
    [(_UIKeyboardArbiterClientInputDestination *)self setWindowEnabled:[(_UIKeyboardArbiterClientInputDestination *)self needsToShowKeyboard] force:0];
  }
  id v3 = [(_UIKeyboardArbiterClient *)self currentUIState];
  [v3 resetAnimationFencing];
}

- (void)userSelectedApp:(id)a3 onCompletion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && ![v6 isEqualToString:&stru_1ED0E84C0])
  {
    double v11 = 0;
  }
  else
  {
    int v8 = [(_UIKeyboardArbiterClient *)self requiredScene];
    BOOL v9 = [v8 identityToken];
    double v10 = [v9 stringRepresentation];
    [(_UIKeyboardArbiterClientInputDestination *)self setFocusedSceneIdentityStringOrIdentifier:v10];

    double v11 = [(_UIKeyboardArbiterClientInputDestination *)self focusedSceneIdentityStringOrIdentifier];
  }
  char v12 = KeyboardArbiterClientLog_3();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    double v17 = v11;
    _os_log_debug_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination userSelectedApp:onCompletion:]  Focus bundle: %@, focusedSceneIdentity: %@", (uint8_t *)&v14, 0x16u);
  }
  if (!v7) {
    id v7 = &__block_literal_global_256_2;
  }

  double v13 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
  [v13 applicationShouldFocusWithBundle:v6 onCompletion:v7];
}

- (void)performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = [a2 keyWindowCandidate];
    BOOL v4 = v3;
    if (v3)
    {
      id v5 = [v3 windowScene];
      id v6 = [v5 _settingsScene];

      id v7 = [v6 _FBSScene];

      int v8 = [v7 identityToken];
      BOOL v9 = [v8 stringRepresentation];

      double v10 = KeyboardArbiterClientLog_3();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 134218242;
        char v12 = v4;
        __int16 v13 = 2112;
        int v14 = v9;
        _os_log_debug_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate:]  Performing required scene update for candidate window: %p; scene: %@",
          (uint8_t *)&v11,
          0x16u);
      }

      -[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:](a1, v4, 16777217);
    }
  }
}

- (void)performRequiredSceneUpdateIfPermittedForViewServiceHostWindow:(uint64_t)a3 servicePID:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    if ([a1 expectedSuppression])
    {
      id v6 = [v5 windowScene];
      BOOL v7 = v6 == (void *)a1[22];
    }
    else
    {
      BOOL v7 = 0;
    }
    int v8 = (void *)a1[31];
    BOOL v9 = [NSNumber numberWithInt:a3];
    int v10 = [v8 containsObject:v9];

    int v11 = a3 ? v10 : 1;
    if (v5 && !v7 && v11)
    {
      char v12 = KeyboardArbiterClientLog_3();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v13 = 134217984;
        id v14 = v5;
        _os_log_debug_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination performRequiredSceneUpdateIfPermittedForViewServiceHostWindow:servicePID:]  Performing required scene update for window hosting remote ui: %p", (uint8_t *)&v13, 0xCu);
      }

      -[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:](a1, v5, 0x101010001);
    }
  }
}

- (BOOL)_sceneFocusPermittedForApplication
{
  int v3 = [(id)UIApp _shouldAllowKeyboardArbiter];
  if (v3)
  {
    LOBYTE(v3) = [(_UIKeyboardArbiterClientInputDestination *)self allowedToShowKeyboard];
  }
  return v3;
}

- (BOOL)_sceneFocusUpdatePermittedForWindow:(id)a3
{
  id v4 = a3;
  if (v4
    && [(id)UIApp _systemShellAllowsInteractionTrackingKeyboardFocusUpdateForWindow:v4]
    && [(_UIKeyboardArbiterClientInputDestination *)self _sceneFocusPermittedForApplication])
  {
    id v5 = [v4 windowScene];
    id v6 = v5;
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
      if ([(_UIKeyboardArbiterClientInputDestination *)self _sceneFocusPermittedForApplication])
      {
        BOOL v9 = [v6 _keyboardClientComponent];
        if ([v9 suppressKeyboardFocusRequests])
        {
LABEL_14:
          char v7 = 0;
          int v8 = v6;
LABEL_15:

          goto LABEL_20;
        }
        int v10 = +[UIWindowScene _keyWindowScene]();

        if (v10 == v6)
        {
        }
        else
        {
          int v11 = [v6 screen];
          if ((unint64_t)([v11 _userInterfaceIdiom] - 2) <= 2)
          {
LABEL_13:

            goto LABEL_14;
          }
          char v12 = +[_UIRemoteKeyboards keyboardWindowSceneForScreen:v11 create:0];
          int v13 = [v6 session];
          id v14 = [v13 role];
          char v15 = [v14 isEqualToString:@"UIWindowSceneSessionRoleExternalDisplayNonInteractive"];

          uint64_t v16 = [v6 activationState];
          uint64_t v17 = [v6 activationState];
          if (v12 && v12 == v6)
          {

            goto LABEL_13;
          }
          BOOL v26 = v16 == 1 || v17 == 0;

          char v7 = 0;
          if ((v15 & 1) != 0 || !v26) {
            goto LABEL_21;
          }
        }
        if (([v4 _isTextEffectsWindow] & 1) != 0
          || ([v4 _isRemoteKeyboardWindow] & 1) != 0
          || ([v4 windowScene],
              double v19 = objc_claimAutoreleasedReturnValue(),
              [v19 _FBSScene],
              int v20 = objc_claimAutoreleasedReturnValue(),
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
        int v8 = [(_UIKeyboardArbiterClientInputDestination *)self focusedSceneIdentityStringOrIdentifier];
        BOOL v9 = [(id)objc_opt_class() keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:v6];
        BOOL v23 = [(_UIKeyboardArbiterClient *)self keyboardVisible];
        if (v8) {
          int v24 = BSEqualStrings() ^ 1;
        }
        else {
          LOBYTE(v24) = 1;
        }
        id v27 = +[UIWindow _applicationKeyWindow];

        if (isKindOfClass)
        {
          char v28 = BSEqualStrings();
          if (v27 == v4) {
            char v29 = 0;
          }
          else {
            char v29 = v28;
          }
        }
        else
        {
          char v29 = 0;
        }
        if (v23) {
          char v7 = v24 | v29;
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

- (void)peekApplicationEvent:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 type])
  {
    id v5 = [(_UIKeyboardArbiterClient *)self eventObserver];
    [v5 peekApplicationEvent:v4];

    BOOL v6 = [(_UIKeyboardArbiterClientInputDestination *)self _sceneFocusPermittedForApplication];
    char v7 = [v4 allTouches];
    int v8 = [v7 anyObject];

    uint64_t v9 = [v8 phase];
    if (v6 && !v9)
    {
      int v10 = [v8 view];
      int v11 = [v10 _responderWindow];
      char v12 = objc_opt_class();
      int v13 = [v11 windowScene];
      id v14 = [v12 keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:v13];

      BOOL v15 = [(_UIKeyboardArbiterClientInputDestination *)self _sceneFocusUpdatePermittedForWindow:v11];
      uint64_t v16 = [v10 _wantsTargetOfKeyboardEventDeferringEnvironment];
      BOOL v17 = [v8 type] == 2;
      uint64_t v18 = +[UIDictationController activeInstance];
      [v18 cancelDictationForResponderIfNeeded:v10 wantsKeyboard:v16 isPencil:v17];

      +[UIKeyboardSceneDelegate performOnControllers:&__block_literal_global_264_1];
      double v19 = KeyboardArbiterClientLog_3();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id buf = 67109378;
        int v33 = v15;
        __int16 v34 = 2112;
        *(void *)BOOL v35 = v14;
        _os_log_debug_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination peekApplicationEvent:]  Update permitted: %d; for scene identity or identifier: %@",
          buf,
          0x12u);
      }

      if (v15)
      {
        id v31 = v14;
        BOOL v20 = [(_UIKeyboardArbiterClient *)self keyboardVisible];
        int v21 = [v8 _isPointerTouch];
        int v22 = KeyboardArbiterClientLog_3();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)id buf = 67110146;
          int v33 = !v20 | v21 | v16;
          __int16 v34 = 1024;
          *(_DWORD *)BOOL v35 = v20;
          *(_WORD *)&v35[4] = 1024;
          *(_DWORD *)&v35[6] = v16;
          __int16 v36 = 1024;
          int v37 = v21;
          __int16 v38 = 2112;
          id v39 = v14;
          _os_log_debug_impl(&dword_1853B0000, v22, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination peekApplicationEvent:]  Request scene focus: %d; keyboardOnScreen"
            ": %d; wantsKeyboard: %d; touchIsPointer: %d; for scene identity or identifier: %@",
            buf,
            0x24u);
        }

        if (!v20 | v21 | v16)
        {
          uint64_t v23 = 0x100010001;
          if (v16 && ![v10 isFirstResponder]) {
            uint64_t v23 = 65537;
          }
          -[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:](self, v11, v23);
          int v24 = [(_UIKeyboardArbiterClient *)self requiredScene];
          __int16 v25 = [v24 identityToken];

          uint64_t v26 = ([(_UIKeyboardArbiterClient *)self currentInputDestination] | v16) ^ 1;
          id v27 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
          uint64_t v28 = getpid();
          char v29 = +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:contextID:](UIKBArbiterClientFocusContext, "focusContextForSceneIdentity:contextID:", v25, [v11 _contextId]);
          [v27 focusApplicationWithProcessIdentifier:v28 context:v29 stealingKeyboard:v26 onCompletion:&__block_literal_global_267_2];

          if (([v11 _isApplicationKeyWindow] & 1) == 0)
          {
            [(_UIKeyboardArbiterClientInputDestination *)self setUpdatingKeyWindow:1];
            [v11 makeKeyWindow];
            [(_UIKeyboardArbiterClientInputDestination *)self setUpdatingKeyWindow:0];
          }
        }
        else
        {
          double v30 = [v11 windowScene];
          __int16 v25 = [v30 keyboardSceneDelegate];

          [v25 setKeyWindowCandidate:v11];
        }
        id v14 = v31;
      }
    }
  }
}

- (void)queue_endInputSessionWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80___UIKeyboardArbiterClientInputDestination_queue_endInputSessionWithCompletion___block_invoke;
  v6[3] = &unk_1E52DA040;
  id v7 = v3;
  id v5 = v3;
  [v4 performAsync:v6];
}

- (void)queue_keyboardChanged:(id)a3 onComplete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  os_unfair_lock_lock(&self->_clientChangeResponseLock);
  int v8 = (OS_os_transaction *)os_transaction_create();
  clientChangeResponseTransaction = self->_clientChangeResponseTransaction;
  self->_clientChangeResponseTransaction = v8;

  os_unfair_lock_unlock(&self->_clientChangeResponseLock);
  dispatch_time_t v10 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77___UIKeyboardArbiterClientInputDestination_queue_keyboardChanged_onComplete___block_invoke;
  block[3] = &unk_1E52D9F98;
  block[4] = self;
  id v11 = v6;
  id v21 = v11;
  dispatch_after(v10, MEMORY[0x1E4F14428], block);
  char v12 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77___UIKeyboardArbiterClientInputDestination_queue_keyboardChanged_onComplete___block_invoke_269;
  v15[3] = &unk_1E5311228;
  id v13 = v11;
  id v16 = v13;
  BOOL v17 = self;
  objc_copyWeak(&v19, &location);
  id v14 = v7;
  id v18 = v14;
  [v12 performAsync:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)handleKeyboardUITrackingChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIKeyboardArbiterClient *)self handlingRemoteEvent];
  [(_UIKeyboardArbiterClient *)self setHandlingRemoteEvent:1];
  [v4 keyboardPosition];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75___UIKeyboardArbiterClientInputDestination_handleKeyboardUITrackingChange___block_invoke;
  v15[3] = &__block_descriptor_64_e33_v16__0__UIKeyboardSceneDelegate_8l;
  void v15[4] = v7;
  v15[5] = v9;
  v15[6] = v11;
  v15[7] = v13;
  +[UIKeyboardSceneDelegate performOnControllers:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75___UIKeyboardArbiterClientInputDestination_handleKeyboardUITrackingChange___block_invoke_2;
  v14[3] = &__block_descriptor_64_e22_v24__0__UIWindow_8_B16l;
  v14[4] = v7;
  v14[5] = v9;
  v14[6] = v11;
  v14[7] = v13;
  +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v14];
  [(_UIKeyboardArbiterClient *)self setHandlingRemoteEvent:v5];
}

- (void)handleKeyboardUIDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  BOOL v21 = 0;
  BOOL v5 = [(_UIKeyboardArbiterClient *)self inputWindowRootViewController];
  BOOL v6 = ([v5 isRotating] & 1) != 0 || -[_UIKeyboardArbiterClient snapshotting](self, "snapshotting");

  BOOL v21 = v6;
  uint64_t v7 = [(_UIKeyboardArbiterClient *)self kbUIStateDelegate];
  char v8 = [v7 layoutIsResizing];

  if ((v8 & 1) != 0
    || ([(_UIKeyboardArbiterClient *)self inputWindowRootViewController],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isTransitioningBetweenFloatingStates],
        v9,
        v10))
  {
    *((unsigned char *)v19 + 24) = 1;
  }
  BOOL v11 = [(_UIKeyboardArbiterClient *)self handlingRemoteEvent];
  [(_UIKeyboardArbiterClient *)self setHandlingRemoteEvent:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70___UIKeyboardArbiterClientInputDestination_handleKeyboardUIDidChange___block_invoke;
  v14[3] = &unk_1E5311270;
  id v12 = v4;
  id v16 = self;
  BOOL v17 = &v18;
  id v15 = v12;
  +[UIKeyboardSceneDelegate performOnControllers:v14];
  [(_UIKeyboardArbiterClient *)self setHandlingRemoteEvent:v11];
  uint64_t v13 = [(_UIKeyboardArbiterClient *)self currentUIState];
  [v13 resetAnimationFencing];

  _Block_object_dispose(&v18, 8);
}

- (void)queue_keyboardUIDidChange:(id)a3 onComplete:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 hasValidNotification];
  uint64_t v9 = KeyboardArbiterClientLog_3();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      BOOL v11 = [v6 notificationInfo];
      *(_DWORD *)id buf = 138412290;
      id v19 = v11;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination queue_keyboardUIDidChange:onComplete:]  Destination posting notification: %@", buf, 0xCu);
    }
  }
  else if (v10)
  {
    *(_DWORD *)id buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination queue_keyboardUIDidChange:onComplete:]  Keyboard UI did change: %@", buf, 0xCu);
  }

  id v12 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81___UIKeyboardArbiterClientInputDestination_queue_keyboardUIDidChange_onComplete___block_invoke;
  v15[3] = &unk_1E52E3298;
  void v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [v12 performAsync:v15];
}

- (void)syncKeyboardUIChangeInfo:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = KeyboardArbiterClientLog_3();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination syncKeyboardUIChangeInfo:]  Sync Keyboard UI Change info: %@", (uint8_t *)&v6, 0xCu);
  }

  [(_UIKeyboardArbiterClientInputDestination *)self keyboardUIDidChange:v4 onComplete:0];
}

- (void)keyboardUIDidChange:(id)a3 onComplete:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (v6)
  {
    uint64_t v8 = [v6 currentInputMode];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      BOOL v10 = +[UIKeyboardInputModeController sharedInputModeController];
      BOOL v11 = [v10 currentInputMode];
      id v12 = [v11 identifier];
      id v13 = [v6 currentInputMode];
      char v14 = [v12 isEqualToString:v13];

      if (([v6 tracking] & 1) == 0)
      {
        if ((v14 & 1) == 0)
        {
          id v15 = [v6 currentInputMode];
          id v16 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v15];

          id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v17 postNotificationName:@"UITextInputCurrentInputModeWillChangeNotification" object:0];

          uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v18 postNotificationName:@"UITextInputWillPersistFindUINotification" object:0];

          id v19 = +[UIKeyboardInputModeController sharedInputModeController];
          [v19 updateCurrentInputMode:v16];
        }
        goto LABEL_9;
      }
    }
    else if (![v6 tracking])
    {
LABEL_9:
      if (([v6 hasValidNotification] & 1) == 0)
      {
        [(_UIKeyboardArbiterClient *)self setCurrentUIState:v6];
        int v22 = KeyboardArbiterClientLog_3();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 138412290;
          id v29 = v6;
          _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination keyboardUIDidChange:onComplete:]  Setting currentUIState: %@", (uint8_t *)&v28, 0xCu);
        }
      }
      BOOL v23 = [(_UIKeyboardArbiterClient *)self keyboardVisible];
      int v24 = [(_UIKeyboardArbiterClient *)self eventObserver];
      [v24 setKeyboardIsVisible:v23];

      __int16 v25 = +[UIKeyboardImpl activeInstance];
      [v25 setSuppressUpdateInputMode:1];

      [(_UIKeyboardArbiterClientInputDestination *)self handleKeyboardUIDidChange:v6];
      uint64_t v26 = +[UIKeyboardImpl activeInstance];
      [v26 setSuppressUpdateInputMode:0];

      if (v7) {
        [(id)UIApp _performBlockAfterCATransactionCommits:v7];
      }
LABEL_15:
      id v27 = [(_UIKeyboardArbiterClient *)self changeInfoDelegate];
      [v27 didHandleKeyboardUIChange:self];

      goto LABEL_16;
    }
    [(_UIKeyboardArbiterClient *)self setCurrentUIState:v6];
    BOOL v20 = [(_UIKeyboardArbiterClient *)self keyboardVisible];
    BOOL v21 = [(_UIKeyboardArbiterClient *)self eventObserver];
    [v21 setKeyboardIsVisible:v20];

    [(_UIKeyboardArbiterClientInputDestination *)self handleKeyboardUITrackingChange:v6];
    if (v7) {
      v7[2](v7);
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (void)queue_activeProcessResignWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84___UIKeyboardArbiterClientInputDestination_queue_activeProcessResignWithCompletion___block_invoke;
  v7[3] = &unk_1E52DA160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performAsync:v7];
}

- (void)queue_setKeyboardDisabled:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  if ([(_UIKeyboardArbiterClient *)self expectingInitialState] && !a3) {
    [(_UIKeyboardArbiterClient *)self setAvoidDisableKeyboard:1];
  }
  id v7 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85___UIKeyboardArbiterClientInputDestination_queue_setKeyboardDisabled_withCompletion___block_invoke;
  v9[3] = &unk_1E52E3538;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performAsync:v9];
}

- (void)queue_sceneBecameFocused:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84___UIKeyboardArbiterClientInputDestination_queue_sceneBecameFocused_withCompletion___block_invoke;
  v11[3] = &unk_1E52E3298;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performAsync:v11];
}

- (NSString)focusedSceneIdentityStringOrIdentifier
{
  return self->_focusedSceneIdentityStringOrIdentifier;
}

- (void)setFocusedSceneIdentityStringOrIdentifier:(id)a3
{
}

- (NSMutableSet)pendingKeyboardGrabs
{
  return self->_pendingKeyboardGrabs;
}

- (void)setPendingKeyboardGrabs:(id)a3
{
}

- (NSMutableSet)activePIDs
{
  return self->_activePIDs;
}

- (void)setActivePIDs:(id)a3
{
}

- (NSMutableDictionary)callerIDs
{
  return self->_callerIDs;
}

- (void)setCallerIDs:(id)a3
{
}

- (BOOL)updatingKeyWindow
{
  return self->_updatingKeyWindow;
}

- (void)setUpdatingKeyWindow:(BOOL)a3
{
  self->_updatingKeyWindow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callerIDs, 0);
  objc_storeStrong((id *)&self->_activePIDs, 0);
  objc_storeStrong((id *)&self->_pendingKeyboardGrabs, 0);
  objc_storeStrong((id *)&self->_focusedSceneIdentityStringOrIdentifier, 0);
  objc_storeStrong((id *)&self->_keyboardSceneIdentifierEnteringForeground, 0);
  objc_storeStrong((id *)&self->_clientChangeResponseTransaction, 0);
  objc_storeStrong((id *)&self->_lastScreen, 0);
  objc_storeStrong((id *)&self->_suppressedScene, 0);
}

@end