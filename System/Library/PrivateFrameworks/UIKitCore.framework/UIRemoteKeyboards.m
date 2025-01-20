@interface UIRemoteKeyboards
@end

@implementation UIRemoteKeyboards

void __43___UIRemoteKeyboards_sharedRemoteKeyboards__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_1EB25C6A0;
  qword_1EB25C6A0 = v0;
}

uint64_t __43___UIRemoteKeyboards_peekApplicationEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _clearEligibilityToRequestKeyboardFocusWithoutUserInteraction];
}

uint64_t __52___UIRemoteKeyboards_applicationKeyWindowDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setKeyWindowCandidate:0];
}

uint64_t __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_7(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 216) = 1;
  uint64_t result = [*(id *)(a1 + 40) forceReloadInputViews];
  *(unsigned char *)(*(void *)(a1 + 32) + 216) = 0;
  return result;
}

uint64_t __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 updateRemoteKeyboardChanged:*(void *)(a1 + 32)];
}

void __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  v3 = [v12 scene];
  v4 = [v3 _FBSScene];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 identityToken];
    v7 = [v6 stringRepresentation];
  }
  else
  {
    v7 = [v3 _sceneIdentifier];
  }

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "ignoresPinning"));
    [v8 setObject:v9 forKey:v7];

    if (([v12 ignoresPinning] & 1) == 0) {
      [v12 setIgnoresPinning:1];
    }
    v10 = [*(id *)(a1 + 40) sourceSceneIdentityString];
    int v11 = [v10 isEqual:v7];

    if (v11) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

void __44___UIRemoteKeyboards_applicationWillResume___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = _UIMainBundleIdentifier();
  char v3 = [v2 isEqualToString:@"com.apple.Spotlight"];

  if ((v3 & 1) == 0) {
    [*(id *)(a1 + 32) reloadForSnapshotting];
  }
  v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) name];
  v6 = [@"notification: " stringByAppendingString:v5];
  v7 = v6;
  if (v4)
  {
    uint64_t v8 = [v6 UTF8String];
    v9 = [v4 keyboardWindow];
    int v10 = [v4 wantsToShowKeyboardForWindow:v9];

    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyboardFocus", &_resumeConnectionForReason____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v20 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136315650;
        v22 = "-[_UIRemoteKeyboards _resumeConnectionForReason:]";
        __int16 v23 = 2080;
        uint64_t v24 = v8;
        __int16 v25 = 1024;
        int v26 = v10;
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "%s: Performing resume required scene update for reason: %s; wantsKeyboard: %d",
          (uint8_t *)&v21,
          0x1Cu);
      }
    }
    id v12 = +[UIWindow _applicationKeyWindow];
    -[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:](v4, v12, 1);
    [v4 startConnection];
  }
  [*(id *)(a1 + 32) resetSnapshotWithWindowCheck:0];
  v13 = *(void **)(a1 + 32);
  v14 = [v13 keyboardWindow];
  LODWORD(v13) = [v13 wantsToShowKeyboardForWindow:v14];

  if (v13)
  {
    v15 = [*(id *)(a1 + 32) keyboardWindow];
    v16 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:0];
    [v16 windowLevel];
    [v15 setWindowLevel:v17 + 1.0];

    v18 = [*(id *)(a1 + 32) keyboardWindow];
    LODWORD(v16) = [v18 _isHostedInAnotherProcess];

    if (v16)
    {
      v19 = [*(id *)(a1 + 32) keyboardWindow];
      [v19 setHidden:0];
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setWindowEnabled:", objc_msgSend(*(id *)(a1 + 32), "allowedToShowKeyboard"));
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 83) = 0;
}

uint64_t __40___UIRemoteKeyboards_isOnScreenRotating__block_invoke(uint64_t result, void *a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v2 = result;
    uint64_t result = [a2 isOnScreenRotating];
    *(unsigned char *)(*(void *)(*(void *)(v2 + 32) + 8) + 24) |= result;
  }
  return result;
}

void __43___UIRemoteKeyboards_reloadForSnapshotting__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([(id)UIApp _isSpringBoard]) {
    [v4 containerRootController];
  }
  else {
  uint64_t v2 = [v4 existingContainerRootController];
  }
  if ([v2 isSnapshotting])
  {
    char v3 = +[UIInputViewAnimationStyle animationStyleImmediate];
    [v4 pushAnimationStyle:v3];

    [v4 forceReloadInputViews];
    [v4 popAnimationStyle];
  }
}

void __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_9(uint64_t a1, void *a2)
{
  id v10 = a2;
  char v3 = [v10 scene];
  id v4 = [v3 _FBSScene];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 identityToken];
    v7 = [v6 stringRepresentation];
  }
  else
  {
    v7 = [v3 _sceneIdentifier];
  }

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectForKey:v7];
    char v9 = [v8 BOOLValue];

    if ((v9 & 1) == 0) {
      [v10 setIgnoresPinning:0];
    }
  }
}

void __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 scene];
  v5 = [v4 _FBSScene];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 identityToken];
    uint64_t v8 = [v7 stringRepresentation];
  }
  else
  {
    uint64_t v8 = [v4 _sceneIdentifier];
  }

  uint64_t v9 = [*(id *)(a1 + 32) sourceSceneIdentityString];
  if (v9)
  {
    id v10 = (void *)v9;
    int v11 = [*(id *)(a1 + 32) sourceSceneIdentityString];
    if ([v11 isEqualToString:v8])
    {

      goto LABEL_26;
    }
    uint64_t v12 = [*(id *)(a1 + 32) sourceDisplayIdentifier];
    if (v12)
    {
      v13 = (void *)v12;
      [*(id *)(a1 + 32) sourceDisplayIdentifier];
      v14 = v30 = v8;
      v15 = [v3 scene];
      v16 = [v15 screen];
      double v17 = [v16 displayConfiguration];
      v18 = [v17 _nameForDisplayType];
      int v29 = [v14 isEqualToString:v18];

      uint64_t v8 = v30;
      if (!v29) {
        goto LABEL_26;
      }
    }
    else
    {
    }
  }
  int v19 = [*(id *)(a1 + 32) hostProcessIdentifier];
  *(unsigned char *)(*(void *)(a1 + 40) + 216) = v19 == getpid();
  if (([*(id *)(a1 + 32) keyboardOnScreen] & 1) != 0 || !*(unsigned char *)(*(void *)(a1 + 40) + 216))
  {
    uint64_t v21 = [*(id *)(a1 + 32) keyboardPreserveKey];
    if (v21
      && (v22 = (void *)v21, int v23 = [*(id *)(a1 + 32) shouldRestoreKeyboard], v22, v23))
    {
      uint64_t v24 = [*(id *)(a1 + 32) keyboardPreserveKey];
      [v3 _restoreInputViewsWithId:v24 animated:1];
    }
    else if (!+[UIKeyboard usesInputSystemUI])
    {
      if (!_UIApplicationIsFirstPartyStickers()
        || (+[UIKeyboard activeKeyboard],
            __int16 v25 = objc_claimAutoreleasedReturnValue(),
            [v25 window],
            int v26 = objc_claimAutoreleasedReturnValue(),
            v26,
            v25,
            !v26))
      {
        uint64_t v27 = _UIMainBundleIdentifier();
        if ([v27 isEqualToString:@"com.apple.siri"])
        {
          char v28 = [*(id *)(a1 + 32) keyboardOnScreen];

          if ((v28 & 1) == 0) {
            [v3 updateLightEffectsBackdropAnimated:1];
          }
        }
        else
        {
        }
        *(unsigned char *)(*(void *)(a1 + 40) + 216) = 1;
        [v3 forceReloadInputViews];
        *(unsigned char *)(*(void *)(a1 + 40) + 216) = 0;
      }
    }
  }
  else
  {
    dispatch_time_t v20 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_7;
    block[3] = &unk_1E52D9F98;
    block[4] = *(void *)(a1 + 40);
    id v32 = v3;
    dispatch_after(v20, MEMORY[0x1E4F14428], block);
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 216) = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_26:
}

uint64_t __37___UIRemoteKeyboards_startConnection__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateEventSource:*(void *)(a1 + 40) options:1];
}

void __33___UIRemoteKeyboards_serviceName__block_invoke()
{
  id v3 = [MEMORY[0x1E4F4F778] environmentAliases];
  uint64_t v0 = [v3 resolveMachService:@"com.apple.UIKit.KeyboardManagement.hosted"];
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)qword_1EB25C6B0;
  qword_1EB25C6B0 = v1;
}

void __37___UIRemoteKeyboards_startConnection__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, char a5)
{
  id v8 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37___UIRemoteKeyboards_startConnection__block_invoke_4;
  block[3] = &unk_1E52D9CD0;
  block[4] = *(void *)(a1 + 32);
  void block[5] = a4;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  uint64_t v9 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37___UIRemoteKeyboards_startConnection__block_invoke_5;
  v12[3] = &unk_1E52E89B8;
  uint64_t v10 = *(void *)(a1 + 32);
  char v15 = a5;
  v12[4] = v10;
  id v13 = v8;
  uint64_t v14 = a4;
  id v11 = v8;
  [v9 performAsync:v12];
}

uint64_t __37___UIRemoteKeyboards_startConnection__block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 112) removeAllObjects];
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[64] || *(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      [v2 didHandleKeyboardChange:v3 shouldConsiderSnapshottingKeyboard:0 isLocalEvent:0];
    }
  }
  if (*(unsigned char *)(a1 + 56))
  {
    [(id)UIApp _setDisableBecomeFirstResponder:1];
    [*(id *)(a1 + 32) setDisableBecomeFirstResponder:1];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  return [v4 _updateEventSource:v5 options:19];
}

void __27___UIRemoteKeyboards_proxy__block_invoke(uint64_t a1, uint64_t a2)
{
}

uint64_t __49___UIRemoteKeyboards_updateLocalKeyboardChanged___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateLocalKeyboardChanged:*(void *)(a1 + 32)];
}

uint64_t __62___UIRemoteKeyboards_queue_activeProcessResignWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) keyboardWindow];

  if (v2) {
    [*(id *)(a1 + 32) applicationDidBecomeActive:0 forceSignalToProxy:1];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __45___UIRemoteKeyboards_queue_failedConnection___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 232);
  if (v2 == *(void **)(a1 + 40))
  {
    *(void *)(v1 + 232) = 0;

    [*(id *)(a1 + 40) invalidate];
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = +[_UIKeyboardChangedInformation informationForKeyboardDown];
    [v4 didHandleKeyboardChange:v5 shouldConsiderSnapshottingKeyboard:0 isLocalEvent:1];

    [*(id *)(a1 + 32) cleanSuppression];
    [*(id *)(a1 + 32) setDisableBecomeFirstResponder:0];
    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45___UIRemoteKeyboards_queue_failedConnection___block_invoke_2;
    block[3] = &unk_1E52D9F70;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v6, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __45___UIRemoteKeyboards_queue_failedConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkConnection];
}

void __37___UIRemoteKeyboards_startConnection__block_invoke(uint64_t a1)
{
  NSLog(&cfstr_XpcConnectionI.isa);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "queue_failedConnection:", WeakRetained);
}

void __37___UIRemoteKeyboards_startConnection__block_invoke_2(uint64_t a1)
{
  NSLog(&cfstr_XpcUnexpectedl.isa);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "queue_failedConnection:", WeakRetained);
}

void __61___UIRemoteKeyboards__isWritingToolsHandlingKeyboardTracking__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) _isWritingToolsReadyToHandleKeyboardTracking];
  int v3 = [*(id *)(a1 + 32) _isArbiterClientReadyForWritingToolsToHandleKeyboardTracking];
  byte_1EB25C66B = v2 & v3;
  id v4 = KeyboardArbiterClientLog_1();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = "Y";
    if (byte_1EB25C66B) {
      dispatch_time_t v6 = "Y";
    }
    else {
      dispatch_time_t v6 = "N";
    }
    if (v2) {
      v7 = "Y";
    }
    else {
      v7 = "N";
    }
    int v8 = 136315650;
    uint64_t v9 = v6;
    __int16 v10 = 2080;
    id v11 = v7;
    if (!v3) {
      uint64_t v5 = "N";
    }
    __int16 v12 = 2080;
    id v13 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "isWritingToolsHandlingKeyboardTracking:%s (WT ready:%s, Arbiter ready:%s)", (uint8_t *)&v8, 0x20u);
  }
}

void __61___UIRemoteKeyboards_toggleSuppressionForWritingToolIfNeeded__block_invoke()
{
  id v0 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v0 forceReloadInputViews];
}

void __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_451(uint64_t a1)
{
  [*(id *)(a1 + 32) resetSnapshotWithWindowCheck:0];
  int v2 = [*(id *)(a1 + 32) keyboardWindow];
  uint64_t v3 = [v2 snapshotView];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v3;

  [*(id *)(*(void *)(a1 + 32) + 56) setUserInteractionEnabled:0];
  dispatch_time_t v6 = [*(id *)(*(void *)(a1 + 32) + 56) layer];
  [v6 setAllowsHitTesting:0];

  if ((*(unsigned char *)(a1 + 40) || *(unsigned char *)(a1 + 41)) && (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v9 = [v7 containerWindow];
    [v9 addSubview:*(void *)(*(void *)(a1 + 32) + 56)];

    int64_t v8 = 500000000;
  }
  else
  {
    v7 = [*(id *)(a1 + 32) keyboardWindow];
    [v7 addSubview:*(void *)(*(void *)(a1 + 32) + 56)];
    int64_t v8 = 100000000;
  }

  dispatch_time_t v10 = dispatch_time(0, v8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_2;
  block[3] = &unk_1E52D9F70;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v10, MEMORY[0x1E4F14428], block);
}

uint64_t __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetSnapshotWithWindowCheck:0];
}

void __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_3(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_4;
  v1[3] = &unk_1E52E9EE0;
  id v2 = *(id *)(a1 + 32);
  +[UIKeyboardSceneDelegate performOnControllers:v1];
}

void __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_4(uint64_t a1, void *a2)
{
  id v17 = a2;
  uint64_t v3 = [v17 scene];
  uint64_t v4 = [v3 _FBSScene];
  uint64_t v5 = v4;
  if (v4)
  {
    dispatch_time_t v6 = [v4 identityToken];
    v7 = [v6 stringRepresentation];
  }
  else
  {
    v7 = [v3 _sceneIdentifier];
  }

  int64_t v8 = [*(id *)(a1 + 32) sourceSceneIdentityString];
  if ([v8 isEqualToString:v7])
  {
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 32) sourceDisplayIdentifier];
    dispatch_time_t v10 = [v17 scene];
    id v11 = [v10 screen];
    __int16 v12 = [v11 displayConfiguration];
    id v13 = [v12 _nameForDisplayType];
    char v14 = [v9 isEqualToString:v13];

    if (v14)
    {
      char v15 = @"remote-keyboards";
LABEL_10:
      v16 = [*(id *)(a1 + 32) keyboardPreserveKey];
      [v17 _preserveInputViewsWithId:v16];

      goto LABEL_11;
    }
  }
  if (([*(id *)(a1 + 32) shouldRestoreKeyboard] & 1) == 0)
  {
    char v15 = [*(id *)(a1 + 32) keyboardPreserveKey];
    if (v15) {
      goto LABEL_10;
    }
  }
LABEL_11:
}

uint64_t __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setDontDismissReachability:1];
}

uint64_t __94___UIRemoteKeyboards_didHandleKeyboardChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 setDontDismissReachability:0];
}

void __55___UIRemoteKeyboards_queue_keyboardChanged_onComplete___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) sourceSceneIdentityString];

  if (v2)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 40) + 112);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v39 != v6) {
            objc_enumerationMutation(v3);
          }
          int64_t v8 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v9 = [*(id *)(a1 + 32) sourceSceneIdentityString];
          if (v9)
          {
            dispatch_time_t v10 = (void *)v9;
            id v11 = [v8 sceneIdentityString];
            __int16 v12 = [*(id *)(a1 + 32) sourceSceneIdentityString];
            char v13 = [v11 isEqual:v12];

            if (v13)
            {
              uint64_t v14 = 1;
              goto LABEL_17;
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    uint64_t v14 = 0;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) sourceBundleIdentifier];
    char v15 = _UIMainBundleIdentifier();
    if ([v3 isEqualToString:v15])
    {
      uint64_t v14 = 1;
    }
    else
    {
      v16 = [*(id *)(a1 + 32) hostBundleIdentifier];
      id v17 = _UIMainBundleIdentifier();
      uint64_t v14 = [v16 isEqualToString:v17];
    }
  }
LABEL_17:

  int v18 = [(id)UIApp systemIsAnimatingApplicationLifecycleEvent];
  int v19 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  dispatch_time_t v20 = [v19 hardwareKeyboardExclusivityIdentifier];

  if (*(unsigned char *)(*(void *)(a1 + 40) + 81)
    || [(id)UIApp _isSpringBoard]
    && [*(id *)(*(void *)(a1 + 40) + 112) count])
  {
    goto LABEL_18;
  }
  int v23 = _UIMainBundleIdentifier();
  int v24 = [v23 isEqualToString:@"com.apple.Spotlight"];
  if (v24)
  {
    __int16 v25 = [*(id *)(a1 + 32) hostBundleIdentifier];
    if ([v25 isEqualToString:@"com.apple.Spotlight"])
    {
      v36 = v25;
    }
    else
    {
      if ((v20 == 0) != [*(id *)(a1 + 32) isOneness])
      {

        goto LABEL_18;
      }
      v36 = v25;
    }
  }
  int v26 = _UIMainBundleIdentifier();
  int v27 = [v26 isEqualToString:@"com.apple.CoreAuthUI"];
  if (v27)
  {
    char v28 = [*(id *)(a1 + 32) hostBundleIdentifier];
    if (![v28 isEqualToString:@"com.apple.CoreAuthUI"])
    {
      int v33 = 1;
      goto LABEL_41;
    }
    v37 = v28;
  }
  uint64_t v29 = v14;
  v30 = _UIMainBundleIdentifier();
  if (![v30 isEqualToString:@"com.apple.siri"])
  {

    int v33 = 0;
    uint64_t v14 = v29;
    char v28 = v37;
    if (v27) {
      goto LABEL_41;
    }
LABEL_37:

    if (v24) {
      goto LABEL_42;
    }
    goto LABEL_38;
  }
  [*(id *)(a1 + 32) hostBundleIdentifier];
  id v32 = v31 = v23;
  int v33 = [v32 isEqualToString:@"com.apple.siri"] ^ 1;

  int v23 = v31;
  uint64_t v14 = v29;
  char v28 = v37;
  if ((v27 & 1) == 0) {
    goto LABEL_37;
  }
LABEL_41:

  if ((v24 & 1) == 0)
  {
LABEL_38:

    if (!v33) {
      goto LABEL_43;
    }
LABEL_18:
    uint64_t v21 = *(void *)(a1 + 48);
    if (!v21) {
      return;
    }
    v22 = *(void (**)(void))(v21 + 16);
    goto LABEL_20;
  }
LABEL_42:

  if (v33) {
    goto LABEL_18;
  }
LABEL_43:
  if (v18 && ([*(id *)(a1 + 32) keyboardPosition], CGRectGetHeight(v44) != 0.0))
  {
    uint64_t v35 = *(void *)(a1 + 48);
    if (v35)
    {
LABEL_49:
      v22 = *(void (**)(void))(v35 + 16);
LABEL_20:
      v22();
    }
  }
  else
  {
    int v34 = objc_msgSend(*(id *)(a1 + 40), "didHandleKeyboardChange:shouldConsiderSnapshottingKeyboard:isLocalEvent:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "shouldTakeSnapshot", v36), v14);
    uint64_t v35 = *(void *)(a1 + 48);
    if (v35)
    {
      if (v34)
      {
        objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:");
        return;
      }
      goto LABEL_49;
    }
  }
}

uint64_t __58___UIRemoteKeyboards_queue_keyboardChangedWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) keyboardChangedCompleted];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __58___UIRemoteKeyboards_queue_keyboardIAVChanged_onComplete___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(double *)(a1 + 48);
  if (*(double *)(v2 + 152) != v3)
  {
    *(double *)(v2 + 152) = v3;
    if (([*(id *)(a1 + 32) keyboardVisible] & 1) == 0)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 208) = 1;
      uint64_t v4 = +[UIPeripheralHost sharedInstance];
      [v4 forceReloadInputViews];

      *(unsigned char *)(*(void *)(a1 + 32) + 208) = 0;
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

void __62___UIRemoteKeyboards_queue_sceneBecameFocused_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyboardFocus", &qword_1EB25C6C8);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    int v19 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      dispatch_time_t v20 = *(void **)(a1 + 32);
      uint64_t v21 = v19;
      v22 = [v20 stringRepresentation];
      *(_DWORD *)buf = 136315394;
      int v33 = "-[_UIRemoteKeyboards queue_sceneBecameFocused:withCompletion:]_block_invoke";
      __int16 v34 = 2112;
      uint64_t v35 = v22;
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "%s: Scene became focused: %@", buf, 0x16u);
    }
  }
  if (*(void *)(a1 + 32))
  {
    +[UIScene _scenesIncludingInternal:1];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = (id *)[v3 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v4; uint64_t i = (id *)((char *)i + 1))
        {
          if (*(void *)v29 != v5) {
            objc_enumerationMutation(v3);
          }
          v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          int64_t v8 = objc_msgSend(v7, "_FBSScene", (void)v28);
          uint64_t v9 = [v8 identityToken];
          int v10 = BSEqualObjects();

          if (v10)
          {
            uint64_t v4 = v7;
            goto LABEL_13;
          }
        }
        uint64_t v4 = (id *)[v3 countByEnumeratingWithState:&v28 objects:v38 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    id v11 = -[UIWindowScene _keyWindow](v4);
    if (v11 && ([v4 _isTargetOfKeyboardEventDeferringEnvironment] & 1) == 0)
    {
      unint64_t v12 = __UILogGetCategoryCachedImpl("KeyboardFocus", &qword_1EB25C6D0);
      if (*(unsigned char *)v12)
      {
        int v24 = *(NSObject **)(v12 + 8);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          __int16 v25 = *(void **)(a1 + 32);
          int v26 = v24;
          int v27 = [v25 stringRepresentation];
          *(_DWORD *)buf = 136315650;
          int v33 = "-[_UIRemoteKeyboards queue_sceneBecameFocused:withCompletion:]_block_invoke";
          __int16 v34 = 2048;
          uint64_t v35 = v11;
          __int16 v36 = 2112;
          v37 = v27;
          _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_ERROR, "%s: Performing required scene update because it was focused in the arbiter: %p; scene: %@",
            buf,
            0x20u);
        }
      }
      -[_UIRemoteKeyboards _performRequiredSceneUpdateIfPermittedForWindow:withContext:](*(void **)(a1 + 40), v11, 65537);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 40), "focusedSceneIdentityStringOrIdentifier", (void)v28);
  uint64_t v14 = (void *)v13;
  if (!v4)
  {
    if (v13)
    {
      char v15 = [*(id *)(a1 + 32) stringRepresentation];
      char v16 = BSEqualStrings();

      if ((v16 & 1) == 0)
      {
        unint64_t v17 = __UILogGetCategoryCachedImpl("KeyboardFocus", &qword_1EB25C6D8);
        if (*(unsigned char *)v17)
        {
          int v23 = *(NSObject **)(v17 + 8);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            int v33 = "-[_UIRemoteKeyboards queue_sceneBecameFocused:withCompletion:]_block_invoke";
            _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "%s: Setting focused scene identity or identifier to nil because a scene from another application was focused", buf, 0xCu);
          }
        }
        [*(id *)(a1 + 40) setFocusedSceneIdentityStringOrIdentifier:0];
      }
    }
  }
  uint64_t v18 = *(void *)(a1 + 48);
  if (v18) {
    (*(void (**)(void))(v18 + 16))();
  }
}

void __55___UIRemoteKeyboards_queue_getDebugInfoWithCompletion___block_invoke(uint64_t a1)
{
  v140 = [(id)UIApp keyWindow];
  uint64_t v1 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  uint64_t v2 = [v1 responder];
  id v3 = -[UIWindow _fbsScene](v140);
  uint64_t v4 = [v3 settings];

  uint64_t v5 = [v140 _firstResponder];
  uint64_t v6 = [v1 inputViews];
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v2)
  {
    int64_t v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      [v7 setObject:v9 forKey:@"keyboardResponder"];
    }
  }
  uint64_t v10 = [v2 inputView];
  if (v10)
  {
    id v11 = (void *)v10;
    unint64_t v12 = [v2 inputView];
    uint64_t v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      [v7 setObject:v14 forKey:@"keyboardResponder.inputView"];
    }
  }
  uint64_t v15 = [v2 inputViewController];
  if (v15)
  {
    char v16 = (void *)v15;
    unint64_t v17 = [v2 inputViewController];
    uint64_t v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      [v7 setObject:v19 forKey:@"keyboardResponder.inputViewController"];
    }
  }
  uint64_t v20 = [v2 inputAccessoryView];
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    v22 = [v2 inputAccessoryView];
    int v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    id v24 = (id)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      [v7 setObject:v24 forKey:@"keyboardResponder.inputAccessoryView"];
    }
  }
  uint64_t v25 = [v2 inputAccessoryViewController];
  if (v25)
  {
    int v26 = (void *)v25;
    int v27 = [v2 inputAccessoryViewController];
    long long v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    id v29 = (id)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      [v7 setObject:v29 forKey:@"keyboardResponder.inputAccessoryViewController"];
    }
  }
  if ([v2 _disableAutomaticKeyboardBehavior])
  {
    long long v30 = [NSNumber numberWithBool:1];
    [v7 setObject:v30 forKey:@"keyboardResponderDisableKeyboardBehaviour"];
  }
  if ([v2 _disableAutomaticKeyboardUI])
  {
    long long v31 = [NSNumber numberWithBool:1];
    [v7 setObject:v31 forKey:@"keyboardResponderDisableKeyboardUI"];
  }
  uint64_t v32 = [v2 _requiresKeyboardWhenFirstResponder];
  if (v2)
  {
    int v33 = [NSNumber numberWithBool:v32];
    [v7 setObject:v33 forKey:@"keyboardResponderRequiresKeyboard"];
  }
  if (v140)
  {
    __int16 v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    id v35 = (id)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      [v7 setObject:v35 forKey:@"keyWindow"];
    }
  }
  if (v5)
  {
    __int16 v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    id v37 = (id)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      [v7 setObject:v37 forKey:@"keyWindowFirstResponder"];
    }
  }
  uint64_t v38 = [v5 inputView];
  if (v38)
  {
    uint64_t v39 = (void *)v38;
    long long v40 = [v5 inputView];
    long long v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    id v42 = (id)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      [v7 setObject:v42 forKey:@"keyWindowFirstResponder.inputView"];
    }
  }
  uint64_t v43 = [v5 inputViewController];
  if (v43)
  {
    CGRect v44 = (void *)v43;
    v45 = [v5 inputViewController];
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    id v47 = (id)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      [v7 setObject:v47 forKey:@"keyWindowFirstResponder.inputViewController"];
    }
  }
  uint64_t v48 = [v5 inputAccessoryView];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [v5 inputAccessoryView];
    v51 = (objc_class *)objc_opt_class();
    NSStringFromClass(v51);
    id v52 = (id)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      [v7 setObject:v52 forKey:@"keyWindowFirstResponder.inputAccessoryView"];
    }
  }
  uint64_t v53 = [v5 inputAccessoryViewController];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [v5 inputAccessoryViewController];
    v56 = (objc_class *)objc_opt_class();
    NSStringFromClass(v56);
    id v57 = (id)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      [v7 setObject:v57 forKey:@"keyWindowFirstResponder.inputAccessoryViewController"];
    }
  }
  if ([v5 _disableAutomaticKeyboardBehavior])
  {
    v58 = [NSNumber numberWithBool:1];
    [v7 setObject:v58 forKey:@"keyWindowFirstResponderDisableKeyboardBehaviour"];
  }
  if ([v5 _disableAutomaticKeyboardUI])
  {
    v59 = [NSNumber numberWithBool:1];
    [v7 setObject:v59 forKey:@"keyWindowFirstResponderDisableKeyboardUI"];
  }
  uint64_t v60 = [v5 _requiresKeyboardWhenFirstResponder];
  if (v5)
  {
    v61 = [NSNumber numberWithBool:v60];
    [v7 setObject:v61 forKey:@"keyWindowFirstResponderRequiresKeyboard"];
  }
  uint64_t v62 = [v6 keyboard];
  if (v62)
  {
    v63 = (void *)v62;
    v64 = [v6 keyboard];
    v65 = (objc_class *)objc_opt_class();
    NSStringFromClass(v65);
    id v66 = (id)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      [v7 setObject:v66 forKey:@"inputViews.keyboard"];
    }
  }
  if (v6)
  {
    if (v6[8])
    {
      v67 = (objc_class *)objc_opt_class();
      NSStringFromClass(v67);
      id v68 = (id)objc_claimAutoreleasedReturnValue();

      if (v68) {
        [v7 setObject:v68 forKey:@"inputViews ? inputViews->_inputView : nil"];
      }
    }
    if (v6[11])
    {
      v69 = (objc_class *)objc_opt_class();
      NSStringFromClass(v69);
      id v70 = (id)objc_claimAutoreleasedReturnValue();

      if (v70) {
        [v7 setObject:v70 forKey:@"inputViews ? inputViews->_inputViewController : nil"];
      }
    }
    if (v6[9])
    {
      v71 = (objc_class *)objc_opt_class();
      NSStringFromClass(v71);
      id v72 = (id)objc_claimAutoreleasedReturnValue();

      if (v72) {
        [v7 setObject:v72 forKey:@"inputViews ? inputViews->_inputAccessoryView : nil"];
      }
    }
    if (v6[12])
    {
      v73 = (objc_class *)objc_opt_class();
      NSStringFromClass(v73);
      id v74 = (id)objc_claimAutoreleasedReturnValue();

      if (v74) {
        [v7 setObject:v74 forKey:@"inputViews ? inputViews->_accessoryViewController : nil"];
      }
    }
    if (v6[10])
    {
      v75 = (objc_class *)objc_opt_class();
      NSStringFromClass(v75);
      id v76 = (id)objc_claimAutoreleasedReturnValue();

      if (v76) {
        [v7 setObject:v76 forKey:@"inputViews ? inputViews->_inputAssistantView : nil"];
      }
    }
    if (v6[13])
    {
      v77 = (objc_class *)objc_opt_class();
      NSStringFromClass(v77);
      id v78 = (id)objc_claimAutoreleasedReturnValue();

      if (v78)
      {
        [v7 setObject:v78 forKey:@"inputViews ? inputViews->_assistantViewController : nil"];
      }
    }
  }
  v133 = v5;
  v79 = [*(id *)(a1 + 32) keyboardWindow];
  v80 = [v1 existingContainerWindow];
  v81 = [v79 rootViewController];
  v82 = -[UIViewController _windowForAutorotationBelowWindow:](v81, v80);
  v131 = v81;
  -[UIViewController _primaryViewControllerForAutorotationBelowWindow:](v81, v80);
  v138 = v137 = v82;
  if (v82)
  {
    v83 = (objc_class *)objc_opt_class();
    NSStringFromClass(v83);
    id v84 = (id)objc_claimAutoreleasedReturnValue();

    if (v84)
    {
      [v7 setObject:v84 forKey:@"rotateWindow"];
    }
  }
  if (v138)
  {
    v85 = (objc_class *)objc_opt_class();
    NSStringFromClass(v85);
    id v86 = (id)objc_claimAutoreleasedReturnValue();

    if (v86)
    {
      [v7 setObject:v86 forKey:@"rotateVC"];
    }
    v87 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)UIApp, "interfaceOrientation"));
    [v7 setObject:v87 forKey:@"UIApp.interfaceOrientation"];

    v88 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v138, "interfaceOrientation"));
    v89 = @"rotateVC.interfaceOrientation";
  }
  else
  {
    v88 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)UIApp, "interfaceOrientation"));
    v89 = @"UIApp.interfaceOrientation";
  }
  [v7 setObject:v88 forKey:v89];

  v90 = v140;
  if (v140)
  {
    v91 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v140, "interfaceOrientation"));
    [v7 setObject:v91 forKey:@"keyWindow.interfaceOrientation"];

    v90 = v140;
  }
  if (v4)
  {
    v92 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "interfaceOrientation"));
    [v7 setObject:v92 forKey:@"keyWindowSceneSettings.interfaceOrientation"];

    v90 = v140;
  }
  if (v82)
  {
    v93 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v82, "interfaceOrientation"));
    [v7 setObject:v93 forKey:@"rotateWindow.interfaceOrientation"];

    v90 = v140;
  }
  if (v138)
  {
    v94 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v138, "supportedInterfaceOrientations"));
    [v7 setObject:v94 forKey:@"rotateVC.supportedInterfaceOrientations"];

    v90 = v140;
  }
  if (v79)
  {
    v95 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v79, "interfaceOrientation"));
    [v7 setObject:v95 forKey:@"keyboardWindow.interfaceOrientation"];

    [v79 frame];
    v96 = NSStringFromCGRect(v142);
    [v7 setObject:v96 forKey:@"keyboardWindow.frame"];

    v97 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v79, "isHidden"));
    [v7 setObject:v97 forKey:@"keyboardWindow.isHidden"];

    v90 = v140;
  }
  if (v90)
  {
    [v90 frame];
    v98 = NSStringFromCGRect(v143);
    [v7 setObject:v98 forKey:@"keyWindow.frame"];
  }
  if (v82)
  {
    [v82 frame];
    v99 = NSStringFromCGRect(v144);
    [v7 setObject:v99 forKey:@"rotateWindow.frame"];
  }
  v100 = +[UIPeripheralHost sharedInstance];
  uint64_t v101 = [v100 _isKeyboardDeactivated];
  if (v101)
  {
    v102 = [NSNumber numberWithInt:v101];
    [v7 setObject:v102 forKey:@"suppressionCount"];
  }
  v135 = v2;
  v136 = v80;
  if ([*(id *)(a1 + 32) disableBecomeFirstResponder])
  {
    v103 = [NSNumber numberWithBool:1];
    [v7 setObject:v103 forKey:@"responderDisabled"];
  }
  v132 = v6;
  v104 = NSString;
  if ([v100 automaticAppearanceEnabled]) {
    v105 = @"YES";
  }
  else {
    v105 = @"NO";
  }
  if ([v100 automaticAppearanceInternalEnabled]) {
    v106 = @"YES";
  }
  else {
    v106 = @"NO";
  }
  uint64_t v107 = [v104 stringWithFormat:@"en %@ / int %@", v105, v106];
  if (v107) {
    [v7 setObject:v107 forKey:@"automaticAppearance"];
  }
  v130 = (void *)v107;
  v134 = v4;
  v108 = [v79 rootViewController];
  v109 = [v108 placement];

  if (v109)
  {
    v110 = (objc_class *)objc_opt_class();
    NSStringFromClass(v110);
    id v111 = (id)objc_claimAutoreleasedReturnValue();

    if (v111)
    {
      [v7 setObject:v111 forKey:@"placementKeyboard"];
    }
  }
  v112 = [v80 rootViewController];
  v113 = [v112 placement];

  if (v113)
  {
    v114 = (objc_class *)objc_opt_class();
    NSStringFromClass(v114);
    id v115 = (id)objc_claimAutoreleasedReturnValue();

    if (v115)
    {
      [v7 setObject:v115 forKey:@"placementEffects"];
    }
  }
  v116 = +[UIKeyboardImpl activeInstance];
  v117 = [v116 _getCurrentKeyplaneName];

  if (v117) {
    [v7 setObject:v117 forKey:@"currentKeyboard"];
  }
  uint64_t v118 = objc_opt_class();
  uint64_t v119 = objc_opt_class();
  if (v79)
  {
    if (v118 != v119)
    {
      v120 = (objc_class *)objc_opt_class();
      NSStringFromClass(v120);
      id v121 = (id)objc_claimAutoreleasedReturnValue();

      if (v121)
      {
        [v7 setObject:v121 forKey:@"keyboardWindow"];
      }
    }
  }
  uint64_t v122 = objc_opt_class();
  if (v122 != objc_opt_class())
  {
    if (v80)
    {
      v123 = (objc_class *)objc_opt_class();
      NSStringFromClass(v123);
      id v124 = (id)objc_claimAutoreleasedReturnValue();

      if (v124)
      {
        [v7 setObject:v124 forKey:@"effectsWindow"];
      }
    }
  }
  v125 = v1;
  v126 = [v1 scene];
  v127 = +[UITextEffectsHostingInfo hostingInfoForWindowScene:v126];
  int v128 = [v127 useHostedInstance];

  if (v128)
  {
    v129 = [NSNumber numberWithBool:1];
    [v7 setObject:v129 forKey:@"effectsHosting"];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __38___UIRemoteKeyboards_cleanSuppression__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cleanDeactivation];
}

uint64_t __44___UIRemoteKeyboards_applicationDidSuspend___block_invoke(uint64_t a1)
{
  [(id)UIApp _setDisableBecomeFirstResponder:0];
  [*(id *)(a1 + 32) setDisableBecomeFirstResponder:0];
  uint64_t v2 = (void *)UIApp;
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _endBackgroundTask:v3];
}

void __44___UIRemoteKeyboards_applicationDidSuspend___block_invoke_2(uint64_t a1)
{
  id v2 = [(id)UIApp _systemAnimationFenceExemptQueue];
  [v2 performAsync:*(void *)(a1 + 32)];
}

void __44___UIRemoteKeyboards_applicationDidSuspend___block_invoke_3(uint64_t a1)
{
  id v2 = _UIMainBundleIdentifier();
  char v3 = [v2 isEqualToString:@"com.apple.Spotlight"];

  if ((v3 & 1) == 0) {
    [*(id *)(a1 + 32) reloadForSnapshotting];
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void __53___UIRemoteKeyboards_applicationKeyWindowWillChange___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  char v3 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v4 = [v3 _overriddenInterfaceOrientation];
  }
  else {
    uint64_t v4 = [v3 interfaceOrientation];
  }
  uint64_t v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 40) keyboardWindow];
  uint64_t v7 = [v6 interfaceOrientation];

  if (v7 != v5)
  {
    id v10 = [*(id *)(a1 + 40) keyboardWindow];
    int64_t v8 = [*(id *)(a1 + 40) keyboardWindow];
    id v9 = [v8 rootViewController];
    [v10 _setRotatableClient:v9 toOrientation:v5 updateStatusBar:0 duration:0 force:1 isRotating:0.0];
  }
}

void __96___UIRemoteKeyboards_prepareToMoveKeyboard_withIAV_isIAVRelevant_showing_notifyRemote_forScene___block_invoke(uint64_t a1)
{
  int v2 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __96___UIRemoteKeyboards_prepareToMoveKeyboard_withIAV_isIAVRelevant_showing_notifyRemote_forScene___block_invoke_2;
  v4[3] = &unk_1E52D9F98;
  char v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 performAsync:v4];
}

uint64_t __96___UIRemoteKeyboards_prepareToMoveKeyboard_withIAV_isIAVRelevant_showing_notifyRemote_forScene___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) removeObject:*(void *)(a1 + 40)];
}

uint64_t __96___UIRemoteKeyboards_prepareToMoveKeyboard_withIAV_isIAVRelevant_showing_notifyRemote_forScene___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 _clearPreservedInputViewsWithId:@"remote-keyboards" clearKeyboard:0];
}

void __52___UIRemoteKeyboards_completeMoveKeyboardForWindow___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) proxy];
  [v1 signalKeyboardChangeComplete];
}

void __50___UIRemoteKeyboards_controllerDidLayoutSubviews___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) focusedSceneIdentityStringOrIdentifier];

  char v3 = [*(id *)(a1 + 32) keyboardWindow];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) keyboardWindow];
    id v5 = [v4 rootViewController];

    uint64_t v6 = [v5 inputViewSet];
    uint64_t v7 = [v6 normalizePlaceholders];

    int64_t v8 = [v5 placementIgnoringRotation];
    [v8 remoteIntrinsicContentSizeForInputViewInSet:v7 includingIAV:0];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    unint64_t v17 = [v5 placementIgnoringRotation];
    [v17 remoteIntrinsicContentSizeForInputViewInSet:v7 includingIAV:1];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    int v26 = [*(id *)(a1 + 32) currentState];
    [v26 keyboardPosition];
    BOOL v29 = v14 == v28 && v16 == v27;
    if (v29)
    {
      long long v31 = [*(id *)(a1 + 32) currentState];
      [v31 keyboardPositionWithIAV];
      double v53 = v32;
      double v54 = v21;
      double v33 = v19;
      double v34 = v12;
      double v35 = v10;
      double v37 = v36;

      BOOL v29 = v23 == v37;
      double v10 = v35;
      double v12 = v34;
      double v19 = v33;
      double v21 = v54;
      if (v29 && v25 == v53)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
    }
    if (v2)
    {
      long long v30 = *(unsigned char **)(a1 + 32);
      if (v30[215]) {
        int v2 = 0;
      }
      else {
        int v2 = (void *)[v30 allowedToEnableKeyboardWindow];
      }
    }
    uint64_t v38 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v39 = *(void **)(a1 + 32);
    long long v40 = [v38 inputViews];
    uint64_t v41 = [v40 isInputAccessoryViewPlaceholder] ^ 1;
    id v42 = [v38 scene];
    objc_msgSend(v39, "prepareToMoveKeyboard:withIAV:isIAVRelevant:showing:notifyRemote:forScene:", v41, 1, v2, v42, v10, v12, v14, v16, v19, v21, v23, v25);

    goto LABEL_16;
  }
LABEL_17:
  int v43 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "count", *(void *)&v53);
  uint64_t v44 = *(void *)(a1 + 32);
  int v45 = *(_DWORD *)(v44 + 104);
  if (v45 >= v43 * v43)
  {
    NSLog(&cfstr_WarningInputVi.isa);
  }
  else
  {
    *(_DWORD *)(v44 + 104) = v45 + 1;
    v46 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) copy];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v47 = v46;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v56 != v50) {
            objc_enumerationMutation(v47);
          }
          id v52 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          if (v52 != *(void **)(a1 + 40)) {
            [v52 checkPlaceholdersForRemoteKeyboards];
          }
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v55 objects:v59 count:16];
      }
      while (v49);
    }

    --*(_DWORD *)(*(void *)(a1 + 32) + 104);
  }
}

void __65___UIRemoteKeyboards__performOnDistributedControllersExceptSelf___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1ED4B2FB0]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __68___UIRemoteKeyboards_addHostedWindowView_fromPID_forScene_callerID___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObjectAtIndex:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "indexOfObject:", *(void *)(a1 + 40)));
  if (!*(unsigned char *)(a1 + 76))
  {
    int v2 = [*(id *)(a1 + 32) currentState];
    if ([v2 keyboardOnScreen]
      && ![*(id *)(*(void *)(a1 + 32) + 40) containsObject:*(void *)(a1 + 40)])
    {
      uint64_t v7 = [*(id *)(a1 + 32) currentState];
      int v8 = [v7 processIdentifier];
      int v9 = *(_DWORD *)(a1 + 72);

      if (v8 == v9) {
        [*(id *)(a1 + 32) setWindowEnabled:0];
      }
    }
    else
    {
    }
  }
  if (*(void *)(a1 + 48)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "removeObjectAtIndex:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "indexOfObject:"));
  }
  if (([*(id *)(*(void *)(a1 + 32) + 40) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) proxy];
    [v3 setWindowHostingPID:*(unsigned int *)(a1 + 72) active:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (([WeakRetained hasHostedViews] & 1) == 0)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [WeakRetained _window];
    [v4 completeMoveKeyboardForWindow:v5];
  }
  uint64_t v6 = [WeakRetained _window];
  [v6 updateLastRemoteView:0 forView:*(void *)(a1 + 56) inContainer:WeakRetained];
}

uint64_t __54___UIRemoteKeyboards_setSuppressingKeyboard_forScene___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSuppressingKeyboard:0 forScene:0];
}

uint64_t __54___UIRemoteKeyboards_setSuppressingKeyboard_forScene___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeactivatedKeyboard:*(unsigned __int8 *)(a1 + 48) forScene:*(void *)(a1 + 40)];
}

uint64_t __62___UIRemoteKeyboards_queue_keyboardSuppressed_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 100);
  if (*(unsigned char *)(a1 + 48)) {
    int v4 = v3 + 1;
  }
  else {
    int v4 = v3 - 1;
  }
  *(_DWORD *)(v2 + 100) = v4;
  id v5 = +[UIPeripheralHost sharedInstance];
  [v5 setDeactivatedKeyboard:*(unsigned __int8 *)(a1 + 48) forScene:0];

  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v6();
}

uint64_t __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke(uint64_t a1, void *a2)
{
  return [a2 startTransition:*(void *)(a1 + 32) withInfo:*(void *)(a1 + 40)];
}

uint64_t __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateTransition:*(void *)(a1 + 32) withInfo:*(void *)(a1 + 40)];
}

uint64_t __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 completeTransition:*(void *)(a1 + 32) withInfo:*(void *)(a1 + 40)];
}

void __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v10 = [v4 objectForKey:@"Quiet"];
  uint64_t v6 = [v10 BOOLValue];
  uint64_t v7 = [*(id *)(a1 + 40) objectForKey:@"Animated"];
  uint64_t v8 = [v7 BOOLValue];
  int v9 = [*(id *)(a1 + 40) objectForKey:@"Notify"];
  objc_msgSend(v5, "setPlacement:quietly:animated:generateSplitNotification:", v3, v6, v8, objc_msgSend(v9, "BOOLValue"));
}

uint64_t __73___UIRemoteKeyboards_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(v2 + 215);
  *(unsigned char *)(v2 + 215) = 1;
  [*(id *)(a1 + 32) _performOnDistributedControllersExceptSelf:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    uint64_t result = (*(uint64_t (**)(void))(result + 16))();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 215) = v3;
  return result;
}

void __64___UIRemoteKeyboards_setStickerPrewarmingViewControllerEnabled___block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2050000000;
  uint64_t v2 = (void *)qword_1EB25C770;
  uint64_t v10 = qword_1EB25C770;
  if (!qword_1EB25C770)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getSTKPrewarmingViewControllerClass_block_invoke;
    v6[3] = &unk_1E52D9900;
    v6[4] = &v7;
    __getSTKPrewarmingViewControllerClass_block_invoke((uint64_t)v6);
    uint64_t v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64___UIRemoteKeyboards_setStickerPrewarmingViewControllerEnabled___block_invoke_2;
  block[3] = &unk_1E52E4728;
  long long v5 = *(_OWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64___UIRemoteKeyboards_setStickerPrewarmingViewControllerEnabled___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) prewarmWithSTKPrewarmingViewControllerClass:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

uint64_t __63___UIRemoteKeyboards_queue_setKeyboardDisabled_withCompletion___block_invoke(uint64_t a1)
{
  [(id)UIApp _setDisableBecomeFirstResponder:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 32) setDisableBecomeFirstResponder:*(unsigned __int8 *)(a1 + 48) forSuppressionAssertion:0 updatePlacement:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __39___UIRemoteKeyboards_forceKeyboardAway__block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39___UIRemoteKeyboards_forceKeyboardAway__block_invoke_2;
  v4[3] = &unk_1E52D9F98;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 performAsync:v4];
}

uint64_t __39___UIRemoteKeyboards_forceKeyboardAway__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didHandleKeyboardChange:*(void *)(a1 + 40) shouldConsiderSnapshottingKeyboard:0 isLocalEvent:1];
}

void __45___UIRemoteKeyboards_preserveKeyboardWithId___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45___UIRemoteKeyboards_preserveKeyboardWithId___block_invoke_2;
  v4[3] = &unk_1E52D9F98;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 performAsync:v4];
}

uint64_t __45___UIRemoteKeyboards_preserveKeyboardWithId___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didHandleKeyboardChange:*(void *)(a1 + 40) shouldConsiderSnapshottingKeyboard:0 isLocalEvent:1];
}

void __44___UIRemoteKeyboards_restoreKeyboardWithId___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44___UIRemoteKeyboards_restoreKeyboardWithId___block_invoke_2;
  v4[3] = &unk_1E52D9F98;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 performAsync:v4];
}

uint64_t __44___UIRemoteKeyboards_restoreKeyboardWithId___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didHandleKeyboardChange:*(void *)(a1 + 40) shouldConsiderSnapshottingKeyboard:0 isLocalEvent:1];
}

uint64_t __62___UIRemoteKeyboards_queue_setLastEventSource_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(v2 + 215);
  *(unsigned char *)(v2 + 215) = 1;
  [*(id *)(a1 + 32) _updateEventSource:*(void *)(a1 + 48) options:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    uint64_t result = (*(uint64_t (**)(void))(result + 16))();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 215) = v3;
  return result;
}

uint64_t __59___UIRemoteKeyboards_restorePreservedInputViewsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _restoreInputViewsWithId:@"remote-keyboards" animated:1];
}

@end