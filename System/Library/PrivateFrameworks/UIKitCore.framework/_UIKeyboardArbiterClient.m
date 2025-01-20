@interface _UIKeyboardArbiterClient
+ (BOOL)enabled;
+ (id)automaticSharedArbiterClient;
+ (id)keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:(id)a3;
+ (id)mainBundleIdentifier;
+ (id)serviceName;
- (BOOL)_didHandleKeyboardClientChange:(id)a3 shouldConsiderSnapshottingKeyboard:(BOOL)a4 isLocalEvent:(BOOL)a5;
- (BOOL)_isArbiterClientReadyForWritingToolsToHandleKeyboardTracking;
- (BOOL)allowedToShowKeyboard;
- (BOOL)assertionActivationStateForType:(unint64_t)a3;
- (BOOL)avoidDisableKeyboard;
- (BOOL)currentInputDestination;
- (BOOL)deactivatedByControlCenter;
- (BOOL)deactivatedBySystemGesture;
- (BOOL)didSignalKeyboardChangedForCurrentKeyboard;
- (BOOL)disableBecomeFirstResponder;
- (BOOL)enqueuedWillEnterForegroundActions;
- (BOOL)expectedSuppression;
- (BOOL)expectingInitialState;
- (BOOL)handlingKeyboardTransition;
- (BOOL)handlingRemoteEvent;
- (BOOL)hasActiveKeyboardSuppressionAssertionsForReason:(id)a3;
- (BOOL)hasAnyHostedViews;
- (BOOL)hasWindowHostingCallerID:(id)a3;
- (BOOL)hasWindowHostingPID:(int)a3;
- (BOOL)isHostedInAnotherProcess;
- (BOOL)isOnScreenRotating;
- (BOOL)isSpotlight:(id)a3;
- (BOOL)keyboardActive;
- (BOOL)keyboardClientDidChange:(id)a3;
- (BOOL)keyboardUIHost;
- (BOOL)keyboardVisible;
- (BOOL)remoteKeyboardUndocked;
- (BOOL)remoteKeyboardUndocked:(BOOL)a3;
- (BOOL)shouldAllowInputViewsRestoredForId:(id)a3;
- (BOOL)shouldFence;
- (BOOL)shouldSnapshot;
- (BOOL)snapshotting;
- (BOOL)updatingHeight;
- (BOOL)windowEnabled;
- (FBSScene)requiredScene;
- (NSXPCConnection)connection;
- (UIInputWindowController)inputWindowRootViewController;
- (UIView)keyboardSnapshot;
- (_UIKBArbiterClientKeyboardChangeDelegate)changeInfoDelegate;
- (_UIKeyboardArbiterClient)init;
- (_UIKeyboardArbiterClient)initWithShouldConnect:(BOOL)a3;
- (_UIKeyboardChangedInformation)backupState;
- (_UIKeyboardChangedInformation)currentClientState;
- (_UIKeyboardUIInformation)currentUIState;
- (_UIKeyboardUIStateDelegate)kbUIStateDelegate;
- (_UIRemoteKeyboardsEventObserver)eventObserver;
- (double)heightForRemoteIAVPlaceholderIfNecessary;
- (id)arbiterConnection;
- (id)arbiterProxy;
- (id)currentHostedPIDs;
- (id)existingInputWindowRootViewController;
- (id)prepareForHostedWindowWithScene:(id)a3;
- (id)vendEmojiKeyboardPrewarmingAssertionForReason:(id)a3;
- (id)vendKeyboardSuppressionAssertionForReason:(id)a3;
- (id)vendKeyboardSuppressionAssertionForReason:(id)a3 type:(unint64_t)a4;
- (int64_t)keyboardSource;
- (int64_t)lastEventSource;
- (unint64_t)hostedCount;
- (unint64_t)localSceneCount;
- (void)_handleKeyboardChanged:(id)a3 isLocal:(BOOL)a4 onComplete:(id)a5;
- (void)_performOnDistributedControllersExceptSelf:(id)a3;
- (void)_postInputSourceDidChangeNotificationForResponder:(id)a3;
- (void)_updateEventSource:(int64_t)a3 options:(unint64_t)a4;
- (void)_updateEventSource:(int64_t)a3 options:(unint64_t)a4 responder:(id)a5;
- (void)applicationResume:(id)a3;
- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4;
- (void)checkConnection;
- (void)checkState;
- (void)cleanSuppression;
- (void)completeTransition:(id)a3 withInfo:(id)a4;
- (void)configureArbiterCommunication:(id)a3;
- (void)controllerDidLayoutSubviews:(id)a3;
- (void)dealloc;
- (void)didFailArbiterConnection;
- (void)didSuspend:(id)a3;
- (void)ignoreLayoutNotifications:(id)a3;
- (void)keyboardChangedCompleted;
- (void)performOnControllers:(id)a3;
- (void)performOnDistributedControllers:(id)a3;
- (void)performOnExistingControllers:(id)a3;
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
- (void)queue_setLastEventSource:(int64_t)a3 withCompletion:(id)a4;
- (void)registerController:(id)a3;
- (void)reloadForSnapshotting;
- (void)restorePreservedInputViewsIfNecessary;
- (void)sceneUpdated;
- (void)setAvoidDisableKeyboard:(BOOL)a3;
- (void)setBackupState:(id)a3;
- (void)setChangeInfoDelegate:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCurrentClientState:(id)a3;
- (void)setCurrentInputDestination:(BOOL)a3;
- (void)setCurrentUIState:(id)a3;
- (void)setDeactivatedByControlCenter:(BOOL)a3;
- (void)setDeactivatedBySystemGesture:(BOOL)a3;
- (void)setDidSignalKeyboardChangedForCurrentKeyboard:(BOOL)a3;
- (void)setDisableBecomeFirstResponder:(BOOL)a3;
- (void)setDisableBecomeFirstResponder:(BOOL)a3 forSuppressionAssertion:(BOOL)a4;
- (void)setDisableBecomeFirstResponder:(BOOL)a3 forSuppressionAssertion:(BOOL)a4 updatePlacement:(BOOL)a5;
- (void)setDisableBecomeFirstResponder:(BOOL)a3 forSuppressionAssertion:(BOOL)a4 updatePlacement:(BOOL)a5 wantsAssistant:(BOOL)a6;
- (void)setEnqueuedWillEnterForegroundActions:(BOOL)a3;
- (void)setEventObserver:(id)a3;
- (void)setExpectedSuppression:(BOOL)a3;
- (void)setExpectingInitialState:(BOOL)a3;
- (void)setHandlingKeyboardTransition:(BOOL)a3;
- (void)setHandlingRemoteEvent:(BOOL)a3;
- (void)setHeightForRemoteIAVPlaceholderIfNecessary:(double)a3;
- (void)setHostedCount:(unint64_t)a3;
- (void)setInputWindowRootViewController:(id)a3;
- (void)setKbUIStateDelegate:(id)a3;
- (void)setKeyboardSnapshot:(id)a3;
- (void)setKeyboardSource:(int64_t)a3;
- (void)setKeyboardUIHost:(BOOL)a3;
- (void)setLastEventSource:(int64_t)a3;
- (void)setPlacement:(id)a3 quietly:(BOOL)a4 animated:(BOOL)a5 generateSplitNotification:(BOOL)a6;
- (void)setRequiredScene:(id)a3;
- (void)setShouldFence:(BOOL)a3;
- (void)setSnapshotting:(BOOL)a3;
- (void)setUpdatingHeight:(BOOL)a3;
- (void)setWindowEnabled:(BOOL)a3;
- (void)signalToProxyKeyboardChanged:(id)a3 onCompletion:(id)a4;
- (void)startConnection;
- (void)startConnectionWithCompletion:(id)a3;
- (void)startTransition:(id)a3 withInfo:(id)a4;
- (void)stopConnection;
- (void)unregisterController:(id)a3;
- (void)updateTransition:(id)a3 withInfo:(id)a4;
- (void)verifyPlacement;
- (void)willResume:(id)a3;
@end

@implementation _UIKeyboardArbiterClient

+ (BOOL)enabled
{
  if ((_UIApplicationIsApplicationWidgetExtension() & 1) != 0
    || (_UIApplicationIsKeyboardExtension() & 1) != 0
    || (_UIApplicationIsKeyboardMediaService() & 1) != 0
    || (_UIApplicationIsWidgetServer() & 1) != 0)
  {
    return 0;
  }
  else
  {
    return _UIApplicationIsFirstPartyStickers() ^ 1;
  }
}

+ (id)automaticSharedArbiterClient
{
  if (_MergedGlobals_1021 != -1) {
    dispatch_once(&_MergedGlobals_1021, &__block_literal_global_164);
  }
  v2 = (void *)qword_1EB2602F8;
  return v2;
}

- (_UIKeyboardArbiterClient)init
{
  return [(_UIKeyboardArbiterClient *)self initWithShouldConnect:1];
}

- (_UIKeyboardArbiterClient)initWithShouldConnect:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIKeyboardArbiterClient;
  v4 = [(_UIKeyboardArbiterClient *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->_shouldFence = 1;
    v6 = objc_alloc_init(_UIRemoteKeyboardsEventObserver);
    eventObserver = v5->_eventObserver;
    v5->_eventObserver = v6;

    [(_UIRemoteKeyboardsEventObserver *)v5->_eventObserver setDelegate:v5];
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    windowControllers = v5->_windowControllers;
    v5->_windowControllers = (NSHashTable *)v8;

    if (v3) {
      [(_UIKeyboardArbiterClient *)v5 checkConnection];
    }
    v10 = [[_UIAssertionController alloc] initWithAssertionSubject:v5];
    assertionController = v5->_assertionController;
    v5->_assertionController = v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v5 selector:sel_applicationResume_ name:@"UIApplicationResumedEventsOnlyNotification" object:UIApp];
    [v12 addObserver:v5 selector:sel_willResume_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
    [v12 addObserver:v5 selector:sel_didSuspend_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
  }
  return v5;
}

- (void)dealloc
{
  v6[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIApplicationResumedEventsOnlyNotification";
  v6[1] = @"UIApplicationWillEnterForegroundNotification";
  v6[2] = @"UIApplicationDidEnterBackgroundNotification";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  [(_UIKeyboardArbiterClient *)self stopConnection];
  [(_UIKeyboardArbiterClient *)self resetSnapshotWithWindowCheck:0];
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardArbiterClient;
  [(_UIKeyboardArbiterClient *)&v5 dealloc];
}

- (id)currentHostedPIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)serviceName
{
  if (qword_1EB260308 != -1) {
    dispatch_once(&qword_1EB260308, &__block_literal_global_32_1);
  }
  v2 = (void *)qword_1EB260300;
  return v2;
}

- (void)configureArbiterCommunication:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F29280];
  id v4 = a3;
  objc_super v5 = [v3 interfaceWithProtocol:&unk_1ED6D2550];
  [v4 setRemoteObjectInterface:v5];

  id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED4B3170];
  [v4 setExportedInterface:v6];
}

- (id)arbiterConnection
{
  BOOL v3 = KeyboardArbiterClientLog_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClient arbiterConnection]  Starting arbiter connection", v12, 2u);
  }

  id v4 = objc_alloc(MEMORY[0x1E4F29268]);
  objc_super v5 = [(id)objc_opt_class() serviceName];
  id v6 = (void *)[v4 initWithMachServiceName:v5 options:4096];

  [(_UIKeyboardArbiterClient *)self configureArbiterCommunication:v6];
  v7 = [v6 exportedInterface];
  uint64_t v8 = _UIKBArbiterSetForPlacements();
  [v7 setClasses:v8 forSelector:sel_queue_keyboardTransition_event_withInfo_onComplete_ argumentIndex:2 ofReply:0];

  v9 = [v6 remoteObjectInterface];
  v10 = _UIKBArbiterSetForPlacements();
  [v9 setClasses:v10 forSelector:sel_transition_eventStage_withInfo_ argumentIndex:2 ofReply:0];

  return v6;
}

- (id)arbiterProxy
{
  v2 = [(_UIKeyboardArbiterClient *)self connection];
  BOOL v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_130_0];

  return v3;
}

- (void)startConnection
{
}

- (void)startConnectionWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_UIKeyboardArbiterClient *)self connection];

  if (!v5)
  {
    if ([(id)UIApp _shouldAllowKeyboardArbiter])
    {
      id v6 = +[UIDevice currentDevice];
      uint64_t v7 = [v6 userInterfaceIdiom];

      if ((unint64_t)(v7 - 2) >= 3)
      {
        uint64_t v8 = [(_UIKeyboardArbiterClient *)self arbiterConnection];
        connection = self->_connection;
        self->_connection = v8;

        uint64_t v10 = BSDispatchQueueCreateWithQualityOfService();
        v11 = [(_UIKeyboardArbiterClient *)self connection];
        v27 = (void *)v10;
        [v11 _setQueue:v10];

        objc_initWeak(location, self);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __58___UIKeyboardArbiterClient_startConnectionWithCompletion___block_invoke;
        v33[3] = &unk_1E52DC308;
        objc_copyWeak(&v34, location);
        v12 = [(_UIKeyboardArbiterClient *)self connection];
        [v12 setInterruptionHandler:v33];

        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __58___UIKeyboardArbiterClient_startConnectionWithCompletion___block_invoke_133;
        v31[3] = &unk_1E52DC308;
        objc_copyWeak(&v32, location);
        v13 = [(_UIKeyboardArbiterClient *)self connection];
        [v13 setInvalidationHandler:v31];

        objc_super v14 = [(_UIKeyboardArbiterClient *)self connection];
        [v14 setExportedObject:self];

        v15 = [(_UIKeyboardArbiterClient *)self connection];

        if (!v15)
        {
LABEL_15:
          objc_destroyWeak(&v32);
          objc_destroyWeak(&v34);
          objc_destroyWeak(location);

          goto LABEL_16;
        }
        v16 = [(_UIKeyboardArbiterClient *)self connection];
        [v16 resume];

        [(_UIKeyboardArbiterClient *)self setExpectingInitialState:1];
        [(_UIKeyboardArbiterClient *)self setAvoidDisableKeyboard:0];
        v17 = [(_UIKeyboardArbiterClient *)self requiredScene];
        v18 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
        BOOL v19 = [(_UIKeyboardArbiterClient *)self currentInputDestination];
        if (v19)
        {
          v20 = [(_UIKeyboardArbiterClient *)self currentClientState];
          if (!v17)
          {
LABEL_7:
            v21 = 0;
LABEL_10:
            v22 = [(_UIKeyboardArbiterClient *)self currentHostedPIDs];
            BOOL v23 = [(_UIKeyboardArbiterClient *)self shouldFence];
            BOOL v24 = [(_UIKeyboardArbiterClient *)self expectedSuppression];
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __58___UIKeyboardArbiterClient_startConnectionWithCompletion___block_invoke_136;
            v28[3] = &unk_1E52EBDA8;
            id v29 = v4;
            objc_copyWeak(&v30, location);
            [v18 startArbitrationWithExpectedState:v20 focusContext:v21 hostingPIDs:v22 usingFence:v23 withSuppression:v24 onConnected:v28];

            if (v17)
            {
            }
            if (v19) {

            }
            objc_destroyWeak(&v30);
            goto LABEL_15;
          }
        }
        else
        {
          v20 = 0;
          if (!v17) {
            goto LABEL_7;
          }
        }
        v26 = [v17 identityToken];
        v25 = +[UIWindow _applicationKeyWindow];
        v21 = +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:contextID:](UIKBArbiterClientFocusContext, "focusContextForSceneIdentity:contextID:", v26, [v25 _contextId]);
        goto LABEL_10;
      }
    }
  }
LABEL_16:
}

- (BOOL)_isArbiterClientReadyForWritingToolsToHandleKeyboardTracking
{
  return 1;
}

- (void)stopConnection
{
  BOOL v3 = [(_UIKeyboardArbiterClient *)self connection];
  [v3 setInvalidationHandler:0];

  id v4 = [(_UIKeyboardArbiterClient *)self connection];
  [v4 setInterruptionHandler:0];

  objc_super v5 = [(_UIKeyboardArbiterClient *)self connection];
  [v5 invalidate];

  connection = self->_connection;
  self->_connection = 0;
}

- (void)checkConnection
{
  BOOL v3 = [(_UIKeyboardArbiterClient *)self connection];
  if (v3)
  {
  }
  else if ([(_UIKeyboardArbiterClient *)self allowedToShowKeyboard])
  {
    [(_UIKeyboardArbiterClient *)self startConnection];
  }
}

- (void)checkState
{
  if ([(id)UIApp _shouldAllowKeyboardArbiter])
  {
    [(_UIKeyboardArbiterClient *)self checkConnection];
  }
  else
  {
    BOOL v3 = [(_UIKeyboardArbiterClient *)self connection];

    if (v3)
    {
      [(_UIKeyboardArbiterClient *)self stopConnection];
    }
  }
}

- (BOOL)keyboardVisible
{
  v2 = [(_UIKeyboardArbiterClient *)self currentUIState];
  char v3 = [v2 keyboardOnScreen];

  return v3;
}

- (BOOL)isOnScreenRotating
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46___UIKeyboardArbiterClient_isOnScreenRotating__block_invoke;
  v4[3] = &unk_1E52EBDD0;
  v4[4] = &v5;
  [(_UIKeyboardArbiterClient *)self performOnExistingControllers:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isHostedInAnotherProcess
{
  return 0;
}

- (BOOL)hasAnyHostedViews
{
  char v2 = [(_UIKeyboardArbiterClient *)self currentHostedPIDs];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasWindowHostingCallerID:(id)a3
{
  return 0;
}

- (BOOL)hasWindowHostingPID:(int)a3
{
  return 0;
}

- (BOOL)keyboardActive
{
  if ([(_UIKeyboardArbiterClient *)self currentInputDestination]) {
    return 1;
  }
  return [(_UIKeyboardArbiterClient *)self keyboardUIHost];
}

- (BOOL)remoteKeyboardUndocked
{
  return [(_UIKeyboardArbiterClient *)self remoteKeyboardUndocked:0];
}

- (BOOL)remoteKeyboardUndocked:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIKeyboardArbiterClient *)self currentInputDestination] && !v3
    || ![(_UIKeyboardArbiterClient *)self keyboardVisible])
  {
    return 0;
  }
  uint64_t v5 = [(_UIKeyboardArbiterClient *)self currentUIState];
  [v5 keyboardPosition];
  BOOL v7 = v6 != 0.0;

  return v7;
}

- (BOOL)isSpotlight:(id)a3
{
  id v3 = a3;
  id v4 = +[UIDevice currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    char v6 = [v3 isEqualToString:@"com.apple.Spotlight"];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)hasActiveKeyboardSuppressionAssertionsForReason:(id)a3
{
  return [(_UIAssertionController *)self->_assertionController hasAssertionsForReason:a3];
}

- (id)vendKeyboardSuppressionAssertionForReason:(id)a3
{
  return [(_UIKeyboardArbiterClient *)self vendKeyboardSuppressionAssertionForReason:a3 type:0];
}

- (id)vendKeyboardSuppressionAssertionForReason:(id)a3 type:(unint64_t)a4
{
  return [(_UIAssertionController *)self->_assertionController vendAssertionOfType:a4 initialState:1 reason:a3 requiresExplicitInvalidation:0];
}

- (id)vendEmojiKeyboardPrewarmingAssertionForReason:(id)a3
{
  return [(_UIAssertionController *)self->_assertionController vendAssertionOfType:2 initialState:1 reason:a3 requiresExplicitInvalidation:0];
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  return a3 <= 1 && [(_UIKeyboardArbiterClient *)self disableBecomeFirstResponder];
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (a4 <= 1) {
    [(_UIKeyboardArbiterClient *)self setDisableBecomeFirstResponder:a3 forSuppressionAssertion:1 updatePlacement:1 wantsAssistant:0];
  }
}

- (double)heightForRemoteIAVPlaceholderIfNecessary
{
  int v3 = [(id)UIApp _isSpringBoard];
  double result = 0.0;
  if (v3) {
    return self->_heightForRemoteIAVPlaceholderIfNecessary;
  }
  return result;
}

- (UIInputWindowController)inputWindowRootViewController
{
  char v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  int v3 = [v2 containerRootController];

  return (UIInputWindowController *)v3;
}

- (id)existingInputWindowRootViewController
{
  char v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  int v3 = [v2 existingContainerRootController];

  return v3;
}

- (void)queue_endInputSessionWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64___UIKeyboardArbiterClient_queue_endInputSessionWithCompletion___block_invoke;
  v6[3] = &unk_1E52DA040;
  id v7 = v3;
  id v5 = v3;
  [v4 performAsync:v6];
}

- (void)queue_failedConnection:(id)a3
{
  id v4 = a3;
  id v5 = KeyboardArbiterClientLog_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClient queue_failedConnection:]  Did fail arbiter connection", buf, 2u);
  }

  char v6 = [v4 interruptionHandler];
  id v7 = [v4 invalidationHandler];
  [v4 setInterruptionHandler:0];
  [v4 setInvalidationHandler:0];
  char v8 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51___UIKeyboardArbiterClient_queue_failedConnection___block_invoke;
  v10[3] = &unk_1E52D9F98;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 performAsync:v10];
}

- (void)didFailArbiterConnection
{
  id v3 = [_UIKeyboardUIInformation alloc];
  id v4 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:](v3, "initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:", 0, 0, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(_UIKeyboardArbiterClient *)self setCurrentUIState:v4];

  id v5 = +[_UIKeyboardChangedInformation informationForKeyboardDown];
  [(_UIKeyboardArbiterClient *)self _didHandleKeyboardClientChange:v5 shouldConsiderSnapshottingKeyboard:0 isLocalEvent:1];

  [(_UIKeyboardArbiterClient *)self cleanSuppression];
}

- (void)queue_setLastEventSource:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68___UIKeyboardArbiterClient_queue_setLastEventSource_withCompletion___block_invoke;
  v9[3] = &unk_1E52DC8B0;
  id v10 = v6;
  int64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [v7 performAsync:v9];
}

- (void)queue_keyboardSuppressed:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68___UIKeyboardArbiterClient_queue_keyboardSuppressed_withCompletion___block_invoke;
  v9[3] = &unk_1E52E3538;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performAsync:v9];
}

- (void)queue_keyboardChanged:(id)a3 onComplete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61___UIKeyboardArbiterClient_queue_keyboardChanged_onComplete___block_invoke;
  v11[3] = &unk_1E52E3298;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performAsync:v11];
}

- (void)_handleKeyboardChanged:(id)a3 isLocal:(BOOL)a4 onComplete:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v8 = (void (**)(void))a5;
  if ([(id)UIApp systemIsAnimatingApplicationLifecycleEvent]
    && ([v10 keyboardPosition], CGRectGetHeight(v12) != 0.0))
  {
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v9 = -[_UIKeyboardArbiterClient _didHandleKeyboardClientChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:](self, "_didHandleKeyboardClientChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:", v10, [v10 shouldTakeSnapshot], v6);
    if (!v8) {
      goto LABEL_8;
    }
    if (v9)
    {
      [(id)UIApp _performBlockAfterCATransactionCommits:v8];
      goto LABEL_8;
    }
  }
  v8[2](v8);
LABEL_8:
}

- (void)queue_keyboardChangedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64___UIKeyboardArbiterClient_queue_keyboardChangedWithCompletion___block_invoke;
  v7[3] = &unk_1E52DA160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performAsync:v7];
}

- (void)queue_keyboardIAVChanged:(double)a3 onComplete:(id)a4
{
  if (a4) {
    (*((void (**)(id, double))a4 + 2))(a4, a3);
  }
}

- (void)queue_keyboardTransition:(id)a3 event:(unint64_t)a4 withInfo:(id)a5 onComplete:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  CGRect v12 = (void (**)(void))a6;
  if ([(_UIKeyboardArbiterClient *)self keyboardActive]
    && !+[UIKeyboard isKeyboardProcess])
  {
    goto LABEL_18;
  }
  if (+[UIKeyboard isKeyboardProcess])
  {
    if ([v10 isEqualToString:0x1ED149D80])
    {
      id v13 = [v11 objectForKeyedSubscript:0x1ED149DC0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v15 = (void *)[v11 mutableCopy];
        v16 = +[UIInputViewSetPlacement placement];
        [v15 setObject:v16 forKeyedSubscript:0x1ED149DC0];

        id v11 = v15;
      }
      uint64_t v17 = objc_msgSend(v11, "bs_filter:", &__block_literal_global_150_0);

      id v11 = (id)v17;
      goto LABEL_8;
    }
LABEL_18:
    if (v12) {
      v12[2](v12);
    }
    goto LABEL_20;
  }
LABEL_8:
  switch(a4)
  {
    case 0uLL:
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_2;
      aBlock[3] = &unk_1E52EBE18;
      id v36 = v10;
      id v37 = v11;
      v18 = _Block_copy(aBlock);

      id v19 = v36;
      goto LABEL_16;
    case 1uLL:
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_3;
      v32[3] = &unk_1E52EBE18;
      id v33 = v10;
      id v34 = v11;
      v18 = _Block_copy(v32);

      id v19 = v33;
      goto LABEL_16;
    case 2uLL:
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_4;
      v29[3] = &unk_1E52EBE18;
      id v30 = v10;
      id v31 = v11;
      v18 = _Block_copy(v29);

      id v19 = v30;
      goto LABEL_16;
    case 3uLL:
      if (+[UIKeyboard isKeyboardProcess]) {
        goto LABEL_18;
      }
      if (![@"Placement" isEqualToString:v10]) {
        goto LABEL_14;
      }
      v20 = [v11 objectForKey:@"Placement"];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_5;
      v26[3] = &unk_1E52EBE18;
      id v27 = v20;
      id v28 = v11;
      id v19 = v20;
      v18 = _Block_copy(v26);

LABEL_16:
      if (!v18) {
        goto LABEL_18;
      }
      v21 = [(id)UIApp _systemAnimationFenceExemptQueue];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_6;
      v23[3] = &unk_1E52E45C8;
      v23[4] = self;
      id v24 = v18;
      v25 = v12;
      id v22 = v18;
      [v21 performAsync:v23];

      break;
    default:
LABEL_14:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unknown transition data: %@/%lu/%@", v10, a4, v11 format];
      goto LABEL_18;
  }
LABEL_20:
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
  v31[3] = *MEMORY[0x1E4F143B8];
  if (self->_disableBecomeFirstResponder != a3)
  {
    BOOL v6 = a6;
    BOOL v7 = a5;
    BOOL v8 = a4;
    BOOL v9 = a3;
    if (a3
      || (+[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate"), id v11 = objc_claimAutoreleasedReturnValue(), v12 = [v11 isWaitingForInputUI], v11, !v12))
    {
      id v13 = [(_UIKeyboardArbiterClient *)self existingInputWindowRootViewController];
      objc_super v14 = [v13 placement];
      BOOL v15 = v9
         && [(_UIAssertionController *)self->_assertionController hasAssertionsForReason:@"WritingTools"];
      v16 = +[UIPeripheralHost sharedInstance];
      [v16 setDeactivatedKeyboard:v9 forScene:0 forSuppressionAssertion:v8 updatePlacement:v7 wantsAssistant:v6 keepAccessories:v15];

      uint64_t v17 = [v13 placement];
      self->_disableBecomeFirstResponder = v9;
      if (+[UIKeyboard usesInputSystemUI])
      {
        if (v9) {
          uint64_t v18 = 1;
        }
        else {
          uint64_t v18 = [v17 showsKeyboard];
        }
        id v19 = +[UIKeyboardImpl activeInstance];
        v20 = [v19 remoteTextInputPartner];
        v30[0] = @"disabled";
        v21 = [NSNumber numberWithBool:v9];
        v31[0] = v21;
        v30[1] = @"forSuppressionAssertion";
        id v22 = [NSNumber numberWithBool:v8];
        v31[1] = v22;
        v30[2] = @"updatePlacement";
        BOOL v23 = [NSNumber numberWithBool:v18];
        v31[2] = v23;
        id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
        [v20 forwardApplicationOperation:sel_setRemoteDisableBecomeFirstResponder_ object:v24];
      }
    }
    else
    {
      id v13 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __114___UIKeyboardArbiterClient_setDisableBecomeFirstResponder_forSuppressionAssertion_updatePlacement_wantsAssistant___block_invoke;
      v25[3] = &unk_1E52E7FF0;
      v25[4] = self;
      BOOL v26 = v9;
      BOOL v27 = v8;
      BOOL v28 = v7;
      BOOL v29 = v6;
      [v13 addPostWaitingForInputUIBlock:v25];
    }
  }
}

- (void)verifyPlacement
{
}

- (void)queue_getDebugInfoWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)queue_sceneBecameFocused:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)_postInputSourceDidChangeNotificationForResponder:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4
    || (+[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate"), id v5 = objc_claimAutoreleasedReturnValue(), [v5 responder], v4 = (id)objc_claimAutoreleasedReturnValue(), v5, v4))
  {
    v15[0] = @"UITextInputSourceDidChangeInputSourceKey";
    BOOL v6 = [NSNumber numberWithInteger:self->_lastEventSource];
    v15[1] = @"UITextInputResponderCapabilitiesChangedInputResponderKey";
    v16[0] = v6;
    v16[1] = v4;
    BOOL v7 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v8 = (void **)v16;
    BOOL v9 = (__CFString **)v15;
    uint64_t v10 = 2;
  }
  else
  {
    id v13 = @"UITextInputSourceDidChangeInputSourceKey";
    BOOL v6 = [NSNumber numberWithInteger:self->_lastEventSource];
    objc_super v14 = v6;
    BOOL v7 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v8 = &v14;
    BOOL v9 = &v13;
    uint64_t v10 = 1;
  }
  id v11 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:v10];

  int v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"UITextInputSourceDidChangeNotification" object:0 userInfo:v11];
}

- (void)_updateEventSource:(int64_t)a3 options:(unint64_t)a4
{
}

- (void)_updateEventSource:(int64_t)a3 options:(unint64_t)a4 responder:(id)a5
{
  char v5 = a4;
  id v10 = a5;
  if (!a3)
  {
    if ((v5 & 8) == 0)
    {
      a3 = [(_UIKeyboardArbiterClient *)self keyboardSource];
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ((v5 & 8) != 0) {
LABEL_6:
  }
    [(_UIKeyboardArbiterClient *)self setKeyboardSource:a3];
LABEL_7:
  if (self->_lastEventSource == a3) {
    goto LABEL_13;
  }
  self->_lastEventSource = a3;
  if (v5)
  {
    +[UIScribbleInteraction _lastEventSourceChanged:a3];
    if ((v5 & 4) == 0)
    {
LABEL_10:
      if ((v5 & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_18;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_10;
  }
  BOOL v8 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
  [v8 signalEventSourceChanged:a3 completionHandler:&__block_literal_global_183_0];

  if ((v5 & 2) == 0)
  {
LABEL_11:
    if ((v5 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_18:
  BOOL v9 = +[UIKeyboardImpl activeInstance];
  [v9 _suppressSoftwareKeyboardStateChangedIgnoringPolicyDelegate:0];

  if (v5) {
LABEL_12:
  }
    [(_UIKeyboardArbiterClient *)self _postInputSourceDidChangeNotificationForResponder:v10];
LABEL_13:
}

- (void)cleanSuppression
{
  if (self->_externalSuppression >= 1)
  {
    do
    {
      id v3 = +[UIPeripheralHost sharedInstance];
      [v3 setDeactivatedKeyboard:0 forScene:0];

      int externalSuppression = self->_externalSuppression;
      BOOL v5 = __OFSUB__(externalSuppression--, 1);
      self->_int externalSuppression = externalSuppression;
    }
    while (!((externalSuppression < 0) ^ v5 | (externalSuppression == 0)));
  }
  +[UIKeyboardSceneDelegate performOnControllers:&__block_literal_global_185];
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

- (void)unregisterController:(id)a3
{
  id v4 = a3;
  [v4 setControllerDelegate:0];
  [(NSHashTable *)self->_windowControllers removeObject:v4];
}

- (void)performOnControllers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  BOOL v5 = (void *)[(NSHashTable *)self->_windowControllers copy];
  BOOL v6 = [(_UIKeyboardArbiterClient *)self inputWindowRootViewController];
  if (v6 && [v5 containsObject:v6]) {
    v4[2](v4, v6);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        if (*(void **)(*((void *)&v12 + 1) + 8 * v11) != v6) {
          ((void (*)(void (**)(id, void *)))v4[2])(v4);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)performOnExistingControllers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  BOOL v5 = (void *)[(NSHashTable *)self->_windowControllers copy];
  BOOL v6 = [(_UIKeyboardArbiterClient *)self existingInputWindowRootViewController];
  if (v6 && [v5 containsObject:v6]) {
    v4[2](v4, v6);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        if (*(void **)(*((void *)&v12 + 1) + 8 * v11) != v6) {
          ((void (*)(void (**)(id, void *)))v4[2])(v4);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_performOnDistributedControllersExceptSelf:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71___UIKeyboardArbiterClient__performOnDistributedControllersExceptSelf___block_invoke;
  v6[3] = &unk_1E52EBE60;
  id v7 = v4;
  id v5 = v4;
  [(_UIKeyboardArbiterClient *)self performOnControllers:v6];
}

- (void)performOnDistributedControllers:(id)a3
{
  id v4 = (void (*)(void))*((void *)a3 + 2);
  id v5 = a3;
  v4();
  [(_UIKeyboardArbiterClient *)self _performOnDistributedControllersExceptSelf:v5];
}

- (void)restorePreservedInputViewsIfNecessary
{
}

- (BOOL)shouldAllowInputViewsRestoredForId:(id)a3
{
  id v4 = a3;
  if ([(_UIKeyboardArbiterClient *)self keyboardVisible]
    && ![(_UIKeyboardArbiterClient *)self keyboardActive])
  {
    char v5 = [v4 isEqual:@"inputui-keyboard-inputviews-preservation-key"];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (FBSScene)requiredScene
{
  char v2 = self->_requiredScene;
  id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v4 = v3;
  if (!v2)
  {
    char v5 = [v3 scene];
    char v2 = [v5 _FBSScene];

    if (!v2)
    {
      BOOL v6 = [v4 responder];
      id v7 = [v6 _responderWindow];
      uint64_t v8 = [v7 windowScene];
      uint64_t v9 = [v8 _settingsScene];
      char v2 = [v9 _FBSScene];
    }
  }

  return v2;
}

- (void)controllerDidLayoutSubviews:(id)a3
{
  id v4 = a3;
  if (self->_ignoreLayoutSubviews <= 0 && [(_UIKeyboardArbiterClient *)self keyboardActive])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56___UIKeyboardArbiterClient_controllerDidLayoutSubviews___block_invoke;
    v5[3] = &unk_1E52D9F98;
    v5[4] = self;
    id v6 = v4;
    [(_UIKeyboardArbiterClient *)self ignoreLayoutNotifications:v5];
  }
}

- (void)ignoreLayoutNotifications:(id)a3
{
}

- (void)signalToProxyKeyboardChanged:(id)a3 onCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (unint64_t)localSceneCount
{
  return 1;
}

- (void)keyboardChangedCompleted
{
  id v2 = [(_UIKeyboardArbiterClient *)self currentUIState];
  [v2 resetAnimationFencing];
}

- (void)sceneUpdated
{
  if ([(_UIKeyboardArbiterClient *)self snapshotting])
  {
    [(_UIKeyboardArbiterClient *)self reloadForSnapshotting];
  }
}

- (void)reloadForSnapshotting
{
}

- (BOOL)shouldSnapshot
{
  return 0;
}

- (void)setSnapshotting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v5 = KeyboardArbiterClientLog_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClient setSnapshotting:]  setSnapshotting: %d", (uint8_t *)v6, 8u);
  }

  self->_snapshotting = v3;
  [(_UIKeyboardArbiterClient *)self reloadForSnapshotting];
}

- (void)queue_keyboardUIDidChange:(id)a3 onComplete:(id)a4
{
  id v11 = a4;
  BOOL handlingRemoteEvent = self->_handlingRemoteEvent;
  self->_BOOL handlingRemoteEvent = 1;
  [(_UIKeyboardArbiterClient *)self setCurrentUIState:a3];
  BOOL v7 = [(_UIKeyboardArbiterClient *)self keyboardVisible];
  uint64_t v8 = [(_UIKeyboardArbiterClient *)self eventObserver];
  [v8 setKeyboardIsVisible:v7];

  uint64_t v9 = [(_UIKeyboardArbiterClient *)self changeInfoDelegate];
  [v9 didHandleKeyboardUIChange:self];

  uint64_t v10 = v11;
  if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
    uint64_t v10 = v11;
  }
  self->_BOOL handlingRemoteEvent = handlingRemoteEvent;
}

- (BOOL)keyboardClientDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 sourceSceneIdentityString];
  uint64_t v6 = [(_UIKeyboardArbiterClient *)self currentClientState];
  BOOL v7 = [(id)v6 sourceSceneIdentityString];
  char v8 = [(id)v5 isEqualToString:v7];

  uint64_t v9 = [(_UIKeyboardArbiterClient *)self currentUIState];
  LOBYTE(v5) = [v9 keyboardOnScreen];
  LOBYTE(v6) = [v4 keyboardOnScreen];

  return (v8 | v5 ^ v6) ^ 1;
}

- (BOOL)_didHandleKeyboardClientChange:(id)a3 shouldConsiderSnapshottingKeyboard:(BOOL)a4 isLocalEvent:(BOOL)a5
{
  id v7 = a3;
  BOOL handlingRemoteEvent = self->_handlingRemoteEvent;
  self->_BOOL handlingRemoteEvent = !a5;
  if (!a5)
  {
    uint64_t v9 = +[UIKeyboardImpl activeInstance];
    int v10 = [v9 automaticMinimizationEnabled];
    int v11 = [v7 automaticMinimizationEnabled];

    if (v10 != v11)
    {
      uint64_t v12 = [v7 automaticMinimizationEnabled];
      long long v13 = +[UIKeyboardImpl activeInstance];
      [v13 setAutomaticMinimizationEnabled:v12];

      long long v14 = +[UIKeyboardImpl activeInstance];
      long long v15 = [v14 geometryDelegate];
      [v15 syncMinimizedStateToHardwareKeyboardAttachedState];
    }
  }
  [(_UIKeyboardArbiterClient *)self keyboardActive];
  BOOL v16 = [(_UIKeyboardArbiterClient *)self keyboardClientDidChange:v7];
  uint64_t v17 = [v7 sourceBundleIdentifier];
  [(_UIKeyboardArbiterClient *)self isSpotlight:v17];

  if (v16)
  {
    uint64_t v18 = [(_UIKeyboardArbiterClient *)self currentClientState];
    [(_UIKeyboardArbiterClient *)self setBackupState:v18];

    [(_UIKeyboardArbiterClient *)self setCurrentClientState:v7];
    id v19 = [(_UIKeyboardArbiterClient *)self changeInfoDelegate];
    [v19 didHandleKeyboardClientChange:self];
  }
  self->_BOOL handlingRemoteEvent = handlingRemoteEvent;

  return 1;
}

+ (id)keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:(id)a3
{
  id v4 = [a3 _FBSScene];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 identityToken];
    id v7 = [v6 stringRepresentation];
  }
  else
  {
    id v7 = [a3 _sceneIdentifier];
  }

  return v7;
}

- (BOOL)allowedToShowKeyboard
{
  if ([(id)UIApp isSuspendedEventsOnly]) {
    int v3 = [(id)UIApp isSuspendedUnderLock] ^ 1;
  }
  else {
    int v3 = 0;
  }
  if ([(_UIKeyboardArbiterClient *)self isHostedInAnotherProcess]
    || (([(id)UIApp isSuspended] ^ 1 | v3) & 1) != 0)
  {
    return 1;
  }
  uint64_t v5 = [(_UIKeyboardArbiterClient *)self kbUIStateDelegate];
  char v6 = [v5 isActivatingInForeground];

  return v6;
}

- (void)didSuspend:(id)a3
{
  uint64_t v4 = [(id)UIApp _beginBackgroundTaskWithName:@"_UIKeyboardArbiterClient XPC disconnection" expirationHandler:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39___UIKeyboardArbiterClient_didSuspend___block_invoke;
  aBlock[3] = &unk_1E52D9CD0;
  void aBlock[4] = self;
  aBlock[5] = v4;
  uint64_t v5 = _Block_copy(aBlock);
  connection = self->_connection;
  if (connection)
  {
    self->_connection = 0;
    id v7 = connection;

    [(NSXPCConnection *)v7 setInterruptionHandler:0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __39___UIKeyboardArbiterClient_didSuspend___block_invoke_2;
    v13[3] = &unk_1E52DA040;
    id v14 = v5;
    [(NSXPCConnection *)v7 setInvalidationHandler:v13];
    [(NSXPCConnection *)v7 invalidate];
  }
  char v8 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39___UIKeyboardArbiterClient_didSuspend___block_invoke_3;
  v10[3] = &unk_1E52E3538;
  BOOL v12 = connection != 0;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  [v8 performAsync:v10];
}

- (void)applicationResume:(id)a3
{
  if (!self->_windowEnabled) {
    [(_UIKeyboardArbiterClient *)self willResume:a3];
  }
}

- (void)willResume:(id)a3
{
  if (![(_UIKeyboardArbiterClient *)self enqueuedWillEnterForegroundActions])
  {
    [(_UIKeyboardArbiterClient *)self setEnqueuedWillEnterForegroundActions:1];
    uint64_t v4 = [(id)UIApp _systemAnimationFenceExemptQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39___UIKeyboardArbiterClient_willResume___block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    [v4 performAsync:v5];
  }
}

+ (id)mainBundleIdentifier
{
  if (qword_1EB260310 != -1) {
    dispatch_once(&qword_1EB260310, &__block_literal_global_225);
  }
  id v2 = (void *)qword_1EB260318;
  return v2;
}

- (id)prepareForHostedWindowWithScene:(id)a3
{
  return 0;
}

- (_UIKeyboardChangedInformation)currentClientState
{
  return self->_currentClientState;
}

- (void)setCurrentClientState:(id)a3
{
}

- (_UIKeyboardUIInformation)currentUIState
{
  return self->_currentUIState;
}

- (void)setCurrentUIState:(id)a3
{
}

- (BOOL)shouldFence
{
  return self->_shouldFence;
}

- (void)setShouldFence:(BOOL)a3
{
  self->_shouldFence = a3;
}

- (_UIKeyboardUIStateDelegate)kbUIStateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_kbUIStateDelegate);
  return (_UIKeyboardUIStateDelegate *)WeakRetained;
}

- (void)setKbUIStateDelegate:(id)a3
{
}

- (void)setInputWindowRootViewController:(id)a3
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

- (BOOL)snapshotting
{
  return self->_snapshotting;
}

- (BOOL)handlingRemoteEvent
{
  return self->_handlingRemoteEvent;
}

- (void)setHandlingRemoteEvent:(BOOL)a3
{
  self->_BOOL handlingRemoteEvent = a3;
}

- (_UIKBArbiterClientKeyboardChangeDelegate)changeInfoDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeInfoDelegate);
  return (_UIKBArbiterClientKeyboardChangeDelegate *)WeakRetained;
}

- (void)setChangeInfoDelegate:(id)a3
{
}

- (BOOL)disableBecomeFirstResponder
{
  return self->_disableBecomeFirstResponder;
}

- (BOOL)expectingInitialState
{
  return self->_expectingInitialState;
}

- (void)setExpectingInitialState:(BOOL)a3
{
  self->_expectingInitialState = a3;
}

- (BOOL)avoidDisableKeyboard
{
  return self->_avoidDisableKeyboard;
}

- (void)setAvoidDisableKeyboard:(BOOL)a3
{
  self->_avoidDisableKeyboard = a3;
}

- (BOOL)currentInputDestination
{
  return self->_currentInputDestination;
}

- (void)setCurrentInputDestination:(BOOL)a3
{
  self->_currentInputDestination = a3;
}

- (BOOL)keyboardUIHost
{
  return self->_keyboardUIHost;
}

- (void)setKeyboardUIHost:(BOOL)a3
{
  self->_keyboardUIHost = a3;
}

- (BOOL)expectedSuppression
{
  return self->_expectedSuppression;
}

- (void)setExpectedSuppression:(BOOL)a3
{
  self->_expectedSuppression = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)enqueuedWillEnterForegroundActions
{
  return self->_enqueuedWillEnterForegroundActions;
}

- (void)setEnqueuedWillEnterForegroundActions:(BOOL)a3
{
  self->_enqueuedWillEnterForegroundActions = a3;
}

- (UIView)keyboardSnapshot
{
  return self->_keyboardSnapshot;
}

- (void)setKeyboardSnapshot:(id)a3
{
}

- (BOOL)windowEnabled
{
  return self->_windowEnabled;
}

- (void)setWindowEnabled:(BOOL)a3
{
  self->_windowEnabled = a3;
}

- (BOOL)updatingHeight
{
  return self->_updatingHeight;
}

- (void)setUpdatingHeight:(BOOL)a3
{
  self->_updatingHeight = a3;
}

- (BOOL)didSignalKeyboardChangedForCurrentKeyboard
{
  return self->_didSignalKeyboardChangedForCurrentKeyboard;
}

- (void)setDidSignalKeyboardChangedForCurrentKeyboard:(BOOL)a3
{
  self->_didSignalKeyboardChangedForCurrentKeyboard = a3;
}

- (_UIKeyboardChangedInformation)backupState
{
  return self->_backupState;
}

- (void)setBackupState:(id)a3
{
}

- (int64_t)keyboardSource
{
  return self->_keyboardSource;
}

- (void)setKeyboardSource:(int64_t)a3
{
  self->_keyboardSource = a3;
}

- (unint64_t)hostedCount
{
  return self->_hostedCount;
}

- (void)setHostedCount:(unint64_t)a3
{
  self->_hostedCount = a3;
}

- (_UIRemoteKeyboardsEventObserver)eventObserver
{
  return self->_eventObserver;
}

- (void)setEventObserver:(id)a3
{
}

- (BOOL)deactivatedByControlCenter
{
  return self->_deactivatedByControlCenter;
}

- (void)setDeactivatedByControlCenter:(BOOL)a3
{
  self->_deactivatedByControlCenter = a3;
}

- (BOOL)deactivatedBySystemGesture
{
  return self->_deactivatedBySystemGesture;
}

- (void)setDeactivatedBySystemGesture:(BOOL)a3
{
  self->_deactivatedBySystemGesture = a3;
}

- (void)setRequiredScene:(id)a3
{
}

- (BOOL)handlingKeyboardTransition
{
  return self->_handlingKeyboardTransition;
}

- (void)setHandlingKeyboardTransition:(BOOL)a3
{
  self->_handlingKeyboardTransition = a3;
}

- (void)setHeightForRemoteIAVPlaceholderIfNecessary:(double)a3
{
  self->_heightForRemoteIAVPlaceholderIfNecessary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredScene, 0);
  objc_storeStrong((id *)&self->_eventObserver, 0);
  objc_storeStrong((id *)&self->_backupState, 0);
  objc_storeStrong((id *)&self->_keyboardSnapshot, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_changeInfoDelegate);
  objc_storeStrong((id *)&self->_inputWindowRootViewController, 0);
  objc_destroyWeak((id *)&self->_kbUIStateDelegate);
  objc_storeStrong((id *)&self->_currentUIState, 0);
  objc_storeStrong((id *)&self->_currentClientState, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_windowControllers, 0);
}

- (void)startTransition:(id)a3 withInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
  [v8 transition:v7 eventStage:0 withInfo:v6];
}

- (void)updateTransition:(id)a3 withInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
  [v8 transition:v7 eventStage:1 withInfo:v6];
}

- (void)completeTransition:(id)a3 withInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
  [v8 transition:v7 eventStage:2 withInfo:v6];
}

- (void)setPlacement:(id)a3 quietly:(BOOL)a4 animated:(BOOL)a5 generateSplitNotification:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  v17[4] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = [(_UIKeyboardArbiterClient *)self arbiterProxy];
  v17[0] = v10;
  v16[0] = @"Placement";
  v16[1] = @"Quiet";
  BOOL v12 = [NSNumber numberWithBool:v8];
  v17[1] = v12;
  v16[2] = @"Animated";
  long long v13 = [NSNumber numberWithBool:v7];
  v17[2] = v13;
  void v16[3] = @"Notify";
  id v14 = [NSNumber numberWithBool:v6];
  v17[3] = v14;
  long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

  [v11 transition:@"Placement" eventStage:3 withInfo:v15];
}

@end