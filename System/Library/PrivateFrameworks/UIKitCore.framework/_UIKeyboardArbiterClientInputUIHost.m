@interface _UIKeyboardArbiterClientInputUIHost
- (BOOL)allowedToShowKeyboard;
- (BOOL)inputDestinationInWindowedMode;
- (BOOL)isCurrentInputDestination;
- (BOOL)isSpotlight:(id)a3;
- (BOOL)remoteKeyboardUndocked:(BOOL)a3;
- (BOOL)shouldSnapshot;
- (BOOL)showing;
- (CGRect)keyboardFrameIncludingRemoteIAV;
- (UIKeyboardScenePresentationModeManager)presentationModeManager;
- (_UIKeyboardArbiterClientInputUIHost)init;
- (id)arbiterProxy;
- (id)currentHostedPIDs;
- (void)_layoutKeyboardViews:(id)a3;
- (void)_updateKeyboardUIScenePresentationMode;
- (void)completeKeyboardChange;
- (void)configureArbiterCommunication:(id)a3;
- (void)inputSessionDidEndUnexpectedly;
- (void)keyboardSendNotification:(unint64_t)a3 withInfo:(id)a4 isStart:(BOOL)a5;
- (void)keyboardVisibilityDidChangeWithFrame:(CGRect)a3 visible:(BOOL)a4 tracking:(BOOL)a5;
- (void)queue_sceneBecameFocused:(id)a3 withCompletion:(id)a4;
- (void)resetSnapshotWithWindowCheck:(BOOL)a3;
- (void)scenePresentationModeManager:(id)a3 didChangeToMode:(unint64_t)a4;
- (void)setCurrentUIState:(id)a3;
- (void)setInputDestinationInWindowedMode:(BOOL)a3;
- (void)setShowing:(BOOL)a3;
- (void)signalKeyboardUIDidChange:(id)a3 onCompletion:(id)a4;
- (void)snapsShotKeyboard;
@end

@implementation _UIKeyboardArbiterClientInputUIHost

- (_UIKeyboardArbiterClientInputUIHost)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIKeyboardArbiterClientInputUIHost;
  v2 = [(_UIKeyboardArbiterClient *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(_UIKeyboardArbiterClient *)v2 setKeyboardUIHost:1];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_applicationKeyWindowWillChange_ name:@"_UIWindowWillBecomeApplicationKeyNotification" object:0];
    [v4 addObserver:v3 selector:sel_inputSessionDidEndUnexpectedly name:@"RTIInputSessionDidEndUnexpectedlyNotification" object:0];
    v5 = objc_alloc_init(UIKeyboardScenePresentationModeManager);
    presentationModeManager = v3->_presentationModeManager;
    v3->_presentationModeManager = v5;

    [(UIKeyboardScenePresentationModeManager *)v3->_presentationModeManager setDelegate:v3];
  }
  return v3;
}

- (void)configureArbiterCommunication:(id)a3
{
  id v8 = a3;
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED701000];
  [v8 setRemoteObjectInterface:v3];

  v4 = +[_UIKeyboardArbiterClient mainBundleIdentifier];
  int v5 = [v4 isEqualToString:@"com.ios.uikit.TestingHarness"];

  v6 = &protocolRef__UIKBArbiterDelegateInputDestination;
  if (!v5) {
    v6 = &protocolRef__UIKBArbiterDelegateProtocol;
  }
  v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:*v6];
  [v8 setExportedInterface:v7];
}

- (id)arbiterProxy
{
  v2 = [(_UIKeyboardArbiterClient *)self connection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_388];

  return v3;
}

- (BOOL)allowedToShowKeyboard
{
  return 1;
}

- (BOOL)isCurrentInputDestination
{
  return 0;
}

- (BOOL)isSpotlight:(id)a3
{
  return 0;
}

- (id)currentHostedPIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)remoteKeyboardUndocked:(BOOL)a3
{
  return 0;
}

- (void)setCurrentUIState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIKeyboardArbiterClient *)self currentUIState];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(_UIKeyboardArbiterClient *)self currentUIState];
    [v7 keyboardPosition];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [v4 keyboardPosition];
    v23.origin.x = v16;
    v23.origin.y = v17;
    v23.size.width = v18;
    v23.size.height = v19;
    v22.origin.x = v9;
    v22.origin.y = v11;
    v22.size.width = v13;
    v22.size.height = v15;
    BOOL v20 = CGRectEqualToRect(v22, v23);

    if (v20) {
      [(_UIKeyboardArbiterClient *)self setDidSignalKeyboardChangedForCurrentKeyboard:0];
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)_UIKeyboardArbiterClientInputUIHost;
  [(_UIKeyboardArbiterClient *)&v21 setCurrentUIState:v4];
}

- (void)signalKeyboardUIDidChange:(id)a3 onCompletion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = +[UIKeyboard keyboardApplicationIdentifier];
  [v6 setApplicationIdentifier:v8];

  CGFloat v9 = +[UIKeyboard keyboardBundleIdentifier];
  [v6 setBundleIdentifier:v9];

  double v10 = KeyboardArbiterClientLog_2();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputUIHost signalKeyboardUIDidChange:onCompletion:]  Signaling keyboard UI did change: %@", (uint8_t *)&v12, 0xCu);
  }

  if (([v6 hasValidNotification] & 1) == 0) {
    [(_UIKeyboardArbiterClientInputUIHost *)self setCurrentUIState:v6];
  }
  [(_UIKeyboardArbiterClient *)self setDidSignalKeyboardChangedForCurrentKeyboard:1];
  [(_UIKeyboardArbiterClient *)self checkConnection];
  CGFloat v11 = [(_UIKeyboardArbiterClientInputUIHost *)self arbiterProxy];
  [v11 signalKeyboardUIDidChange:v6 onCompletion:v7];
}

- (void)snapsShotKeyboard
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __56___UIKeyboardArbiterClientInputUIHost_snapsShotKeyboard__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)resetSnapshotWithWindowCheck:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_UIKeyboardArbiterClient *)self keyboardSnapshot];

  if (v5)
  {
    id v6 = [(_UIKeyboardArbiterClient *)self keyboardSnapshot];
    [v6 removeFromSuperview];

    [(_UIKeyboardArbiterClient *)self setKeyboardSnapshot:0];
    if (v3)
    {
      [(_UIKeyboardArbiterClientInputUIHost *)self completeKeyboardChange];
    }
  }
}

- (BOOL)shouldSnapshot
{
  return 1;
}

- (void)_updateKeyboardUIScenePresentationMode
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UIKeyboardArbiterClientInputUIHost *)self presentationModeManager];
  uint64_t v4 = [v3 presentationMode];
  uint64_t v5 = [(_UIKeyboardArbiterClient *)self currentUIState];
  [v5 setKeyboardScenePresentationMode:v4];

  id v6 = KeyboardArbiterClientLog_2();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(_UIKeyboardArbiterClient *)self currentUIState];
    int v8 = 134217984;
    uint64_t v9 = [v7 keyboardScenePresentationMode];
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputUIHost _updateKeyboardUIScenePresentationMode]  _updateKeyboardUIScenePresentationMode to: %lu", (uint8_t *)&v8, 0xCu);
  }
}

- (void)inputSessionDidEndUnexpectedly
{
  BOOL v3 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69___UIKeyboardArbiterClientInputUIHost_inputSessionDidEndUnexpectedly__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [v3 performAsync:v4];
}

- (void)keyboardSendNotification:(unint64_t)a3 withInfo:(id)a4 isStart:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (([v8 shouldSendInClient] & 1) == 0)
  {
    uint64_t v9 = [_UIKeyboardUIInformation alloc];
    [v8 duration];
    CGFloat v11 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:](v9, "initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:", 0, 0, 0, v10 > 0.0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v8 setType:a3];
    [(_UIKeyboardUIInformation *)v11 addNotificationInfo:v8 isStart:v5];
    objc_initWeak(&location, self);
    int v12 = KeyboardArbiterClientLog_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = @"end";
      if (v5) {
        id v13 = @"start";
      }
      *(_DWORD *)buf = 138412546;
      CGFloat v18 = v13;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputUIHost keyboardSendNotification:withInfo:isStart:]  InputUI sending %@ notification: %@", buf, 0x16u);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81___UIKeyboardArbiterClientInputUIHost_keyboardSendNotification_withInfo_isStart___block_invoke;
    v14[3] = &unk_1E52DC308;
    objc_copyWeak(&v15, &location);
    [(_UIKeyboardArbiterClientInputUIHost *)self signalKeyboardUIDidChange:v11 onCompletion:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)keyboardVisibilityDidChangeWithFrame:(CGRect)a3 visible:(BOOL)a4 tracking:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  int v12 = [(_UIKeyboardArbiterClient *)self inputWindowRootViewController];
  BOOL v13 = ([v12 isRotating] & 1) != 0 || -[_UIKeyboardArbiterClient snapshotting](self, "snapshotting");

  uint64_t v14 = [(_UIKeyboardArbiterClient *)self kbUIStateDelegate];
  char v15 = [v14 layoutIsResizing];

  if ((v15 & 1) != 0
    || ([(_UIKeyboardArbiterClient *)self inputWindowRootViewController],
        CGFloat v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 isTransitioningBetweenFloatingStates],
        v16,
        ((v17 | v13) & 1) != 0))
  {
    uint64_t v18 = 0;
  }
  else
  {
    __int16 v19 = [(_UIKeyboardArbiterClient *)self kbUIStateDelegate];
    int v20 = [v19 shouldSkipKeyboardPresentationFence];

    uint64_t v18 = v20 ^ 1u;
  }
  BOOL v21 = [(_UIKeyboardArbiterClient *)self keyboardVisible];
  CGRect v22 = [(_UIKeyboardArbiterClient *)self currentUIState];
  v45 = (_UIKeyboardUIInformation *)[v22 copy];

  if (v6)
  {
    if (v21)
    {
      CGRect v23 = [(_UIKeyboardArbiterClient *)self currentUIState];
      if (v23)
      {
        v24 = [(_UIKeyboardArbiterClient *)self currentUIState];
        [v24 keyboardPosition];
        v53.origin.double x = x;
        v53.origin.double y = y;
        v53.size.double width = width;
        v53.size.double height = height;
        if (CGRectEqualToRect(v52, v53))
        {
          BOOL v25 = [(_UIKeyboardArbiterClient *)self didSignalKeyboardChangedForCurrentKeyboard];

          if (v25)
          {
            v26 = KeyboardArbiterClientLog_2();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputUIHost keyboardVisibilityDidChangeWithFrame:visible:tracking:]  InputUI not updating currentUIState because nothing changed", buf, 2u);
            }
            goto LABEL_28;
          }
        }
        else
        {
        }
      }
    }
    v29 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:]([_UIKeyboardUIInformation alloc], "initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:", 1, +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"), v5, v18, x, y, width, height);

    [(_UIKeyboardArbiterClientInputUIHost *)self resetSnapshotWithWindowCheck:0];
  }
  else
  {
    if (!v21) {
      goto LABEL_20;
    }
    v27 = [_UIKeyboardUIInformation alloc];
    BOOL v28 = +[UIView _isInAnimationBlock];
    v29 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:](v27, "initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:", 0, v28, v5, 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  v45 = v29;
LABEL_20:
  v30 = +[UIKeyboardInputModeController sharedInputModeController];
  v31 = [v30 currentInputMode];
  v32 = +[UIKeyboardInputModeController sharedInputModeController];
  v33 = [v32 currentInputModeInPreference];
  if ([v31 isEqual:v33])
  {
    BOOL v34 = v6;

LABEL_24:
    goto LABEL_25;
  }
  v35 = +[UIKeyboardInputModeController sharedInputModeController];
  v36 = [v35 currentInputMode];
  v37 = [v36 identifier];
  BOOL v34 = v6;
  char v38 = [v37 isEqualToString:@"autofillsignup"];

  if ((v38 & 1) == 0)
  {
    v30 = +[UIKeyboardInputModeController sharedInputModeController];
    v31 = [v30 currentInputMode];
    v32 = [v31 identifier];
    [(_UIKeyboardUIInformation *)v45 setCurrentInputMode:v32];
    goto LABEL_24;
  }
LABEL_25:
  v26 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [(_UIKeyboardUIInformation *)v45 setAssistantBarVisible:[v26 hasVisibleAssistantBar]];
  [(_UIKeyboardUIInformation *)v45 setRequiresHeightForIntegratedAssistantBar:[v26 hasIntegratedAssistantBar]];
  [(_UIKeyboardArbiterClientInputUIHost *)self _updateKeyboardUIScenePresentationMode];
  v39 = [(_UIKeyboardArbiterClient *)self currentUIState];
  -[_UIKeyboardUIInformation setKeyboardScenePresentationMode:](v45, "setKeyboardScenePresentationMode:", [v39 keyboardScenePresentationMode]);

  v40 = +[UIKeyboardImpl activeInstance];
  -[_UIKeyboardUIInformation setResizing:](v45, "setResizing:", [v40 layoutIsResizing]);

  v41 = [(_UIKeyboardArbiterClient *)self eventObserver];
  [v41 setKeyboardIsVisible:v34];

  objc_initWeak(&location, self);
  v42 = KeyboardArbiterClientLog_2();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = [(_UIKeyboardUIInformation *)v45 animationFence];
    *(_DWORD *)buf = 138412290;
    v50 = v43;
    _os_log_impl(&dword_1853B0000, v42, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputUIHost keyboardVisibilityDidChangeWithFrame:visible:tracking:]  InputUI created fence: %@", buf, 0xCu);
  }
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __93___UIKeyboardArbiterClientInputUIHost_keyboardVisibilityDidChangeWithFrame_visible_tracking___block_invoke;
  v46[3] = &unk_1E52DC308;
  objc_copyWeak(&v47, &location);
  [(_UIKeyboardArbiterClientInputUIHost *)self signalKeyboardUIDidChange:v45 onCompletion:v46];
  [(_UIKeyboardArbiterClient *)self setExpectingInitialState:0];
  v44 = [(_UIKeyboardArbiterClient *)self currentUIState];
  [v44 resetAnimationFencing];

  +[UIKeyboardSceneDelegate performOnControllers:&__block_literal_global_142_0];
  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
LABEL_28:
}

- (void)completeKeyboardChange
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61___UIKeyboardArbiterClientInputUIHost_completeKeyboardChange__block_invoke;
  v5[3] = &unk_1E52D9F70;
  v5[4] = self;
  [(id)UIApp _performBlockAfterCATransactionCommits:v5];
  [(_UIKeyboardArbiterClientInputUIHost *)self resetSnapshotWithWindowCheck:1];
  BOOL v3 = [(_UIKeyboardArbiterClient *)self changeInfoDelegate];
  [v3 didHandleKeyboardUIChange:self];

  uint64_t v4 = [(_UIKeyboardArbiterClient *)self currentUIState];
  [v4 resetAnimationFencing];
}

- (void)_layoutKeyboardViews:(id)a3
{
  uint64_t v4 = [(_UIKeyboardArbiterClient *)self inputWindowRootViewController];
  BOOL v5 = [v4 inputViewSet];
  id v33 = [v5 normalizePlaceholders];

  BOOL v6 = [(_UIKeyboardArbiterClient *)self inputWindowRootViewController];
  id v7 = [v6 placementIgnoringRotation];
  [v7 remoteIntrinsicContentSizeForInputViewInSet:v33 includingIAV:0];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  CGFloat v16 = [(_UIKeyboardArbiterClient *)self inputWindowRootViewController];
  [v16 _inputViewPadding];
  double v18 = v15 + fabs(v17);

  if (!+[UIKeyboardImpl isFloating])
  {
    __int16 v19 = [(_UIKeyboardArbiterClient *)self currentUIState];
    [v19 keyboardPosition];
    double v22 = v20;
    double v23 = v21;
    if (v13 * v18 == 0.0 && v21 * v20 == 0.0)
    {
    }
    else
    {

      if (v13 != v22 || v18 != v23)
      {
LABEL_10:
        v31 = [v33 inputView];
        v32 = [v31 window];
        v24 = [v32 rootViewController];

        objc_opt_class();
        if (((objc_opt_isKindOfClass() & 1) == 0
           || ([v24 isTranslating] & 1) == 0 && (objc_msgSend(v24, "isSplitting") & 1) == 0)
          && ![(_UIKeyboardArbiterClient *)self handlingKeyboardTransition])
        {
          -[_UIKeyboardArbiterClientInputUIHost keyboardVisibilityDidChangeWithFrame:visible:tracking:](self, "keyboardVisibilityDidChangeWithFrame:visible:tracking:", [(_UIKeyboardArbiterClientInputUIHost *)self showing], 0, v9, v11, v13, v18);
        }
        goto LABEL_15;
      }
    }
  }
  v24 = [(_UIKeyboardArbiterClient *)self currentUIState];
  uint64_t v25 = [v24 applicationIdentifier];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [(_UIKeyboardArbiterClient *)self currentUIState];
    BOOL v28 = [v27 applicationIdentifier];
    v29 = +[UIKeyboard keyboardApplicationIdentifier];
    char v30 = [v28 isEqualToString:v29];

    if (v30) {
      goto LABEL_16;
    }
    [(_UIKeyboardArbiterClient *)self setDidSignalKeyboardChangedForCurrentKeyboard:0];
    goto LABEL_10;
  }
LABEL_15:

LABEL_16:
}

- (void)queue_sceneBecameFocused:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)scenePresentationModeManager:(id)a3 didChangeToMode:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = KeyboardArbiterClientLog_2();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2048;
    unint64_t v11 = a4;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputUIHost scenePresentationModeManager:didChangeToMode:]  scenePresentationModeManager: %@ didChangeToMode: %lu", (uint8_t *)&v8, 0x16u);
  }

  [(_UIKeyboardArbiterClientInputUIHost *)self _updateKeyboardUIScenePresentationMode];
}

- (CGRect)keyboardFrameIncludingRemoteIAV
{
  double x = self->_keyboardFrameIncludingRemoteIAV.origin.x;
  double y = self->_keyboardFrameIncludingRemoteIAV.origin.y;
  double width = self->_keyboardFrameIncludingRemoteIAV.size.width;
  double height = self->_keyboardFrameIncludingRemoteIAV.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)showing
{
  return self->_showing;
}

- (void)setShowing:(BOOL)a3
{
  self->_showing = a3;
}

- (UIKeyboardScenePresentationModeManager)presentationModeManager
{
  return self->_presentationModeManager;
}

- (BOOL)inputDestinationInWindowedMode
{
  return self->_inputDestinationInWindowedMode;
}

- (void)setInputDestinationInWindowedMode:(BOOL)a3
{
  self->_inputDestinationInWindowedMode = a3;
}

- (void).cxx_destruct
{
}

@end