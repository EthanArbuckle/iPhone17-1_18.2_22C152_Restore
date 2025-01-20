@interface UIKeyboardArbiterClient
@end

@implementation UIKeyboardArbiterClient

void __56___UIKeyboardArbiterClient_automaticSharedArbiterClient__block_invoke()
{
  if (+[_UIKeyboardArbiterClient enabled])
  {
    if (+[UIKeyboard isKeyboardProcess])
    {
      v0 = off_1E52D59C8;
    }
    else
    {
      int v1 = [(id)UIApp _isSpringBoard];
      v0 = off_1E52D59C0;
      if (v1) {
        v0 = off_1E52D59D0;
      }
    }
    id v2 = objc_alloc_init(*v0);
    v3 = (void *)qword_1EB2602F8;
    qword_1EB2602F8 = (uint64_t)v2;
  }
}

void __39___UIKeyboardArbiterClient_serviceName__block_invoke()
{
  id v2 = [MEMORY[0x1E4F4F778] environmentAliases];
  uint64_t v0 = [v2 resolveMachService:@"com.apple.UIKit.KeyboardManagement.hosted"];
  int v1 = (void *)qword_1EB260300;
  qword_1EB260300 = v0;
}

void __40___UIKeyboardArbiterClient_arbiterProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = KeyboardArbiterClientLog_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClient arbiterProxy]  Failed to access remote service: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __58___UIKeyboardArbiterClient_startConnectionWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = KeyboardArbiterClientLog_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClient startConnectionWithCompletion:]_block_invoke  XPC connection interrupted", v7, 2u);
  }

  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained connection];

  id v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "queue_failedConnection:", v5);
}

void __58___UIKeyboardArbiterClient_startConnectionWithCompletion___block_invoke_133(uint64_t a1)
{
  id v2 = KeyboardArbiterClientLog_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClient startConnectionWithCompletion:]_block_invoke  XPC unexpectedly invalidated", v7, 2u);
  }

  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained connection];

  id v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "queue_failedConnection:", v5);
}

void __58___UIKeyboardArbiterClient_startConnectionWithCompletion___block_invoke_136(uint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  id v9 = a2;
  id v10 = a3;
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    if (a5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      (*(void (**)(uint64_t, uint64_t, void, void))(v11 + 16))(v11, 1, 0, [WeakRetained avoidDisableKeyboard] ^ 1);
    }
    else
    {
      (*(void (**)(void, uint64_t, void, void))(v11 + 16))(*(void *)(a1 + 32), 1, 0, 0);
    }
  }
  v13 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58___UIKeyboardArbiterClient_startConnectionWithCompletion___block_invoke_2;
  v16[3] = &unk_1E52EBD80;
  objc_copyWeak(v20, (id *)(a1 + 40));
  char v21 = a5;
  id v14 = v9;
  id v17 = v14;
  id v15 = v10;
  id v18 = v15;
  v20[1] = a4;
  id v19 = *(id *)(a1 + 32);
  [v13 performAsync:v16];

  objc_destroyWeak(v20);
}

void __58___UIKeyboardArbiterClient_startConnectionWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([WeakRetained expectingInitialState])
  {
  }
  else
  {
    if (!*(unsigned char *)(a1 + 72))
    {
LABEL_9:

      goto LABEL_10;
    }
    id v4 = objc_loadWeakRetained(v2);
    char v5 = [v4 avoidDisableKeyboard];

    if (v5) {
      goto LABEL_10;
    }
  }
  if (*(void *)(a1 + 32))
  {
    id v6 = objc_loadWeakRetained(v2);
    [v6 _didHandleKeyboardClientChange:*(void *)(a1 + 32) shouldConsiderSnapshottingKeyboard:0 isLocalEvent:0];
  }
  if (*(void *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained(v2);
    [WeakRetained syncKeyboardUIChangeInfo:*(void *)(a1 + 40)];
    goto LABEL_9;
  }
LABEL_10:
  id v7 = objc_loadWeakRetained(v2);
  [v7 setExpectingInitialState:0];

  id v8 = objc_loadWeakRetained(v2);
  [v8 _updateEventSource:*(void *)(a1 + 64) options:3];

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      id v10 = objc_loadWeakRetained(v2);
      (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v9 + 16))(v9, 1, 1, [v10 avoidDisableKeyboard] ^ 1);
    }
    else
    {
      (*(void (**)(void, uint64_t, uint64_t, void))(v9 + 16))(*(void *)(a1 + 48), 1, 1, 0);
    }
  }
  id v11 = objc_loadWeakRetained(v2);
  [v11 setAvoidDisableKeyboard:0];
}

uint64_t __46___UIKeyboardArbiterClient_isOnScreenRotating__block_invoke(uint64_t result, void *a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v2 = result;
    result = [a2 isOnScreenRotating];
    *(unsigned char *)(*(void *)(*(void *)(v2 + 32) + 8) + 24) |= result;
  }
  return result;
}

uint64_t __64___UIKeyboardArbiterClient_queue_endInputSessionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __51___UIKeyboardArbiterClient_queue_failedConnection___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 104);
  if (v2 == *(void **)(a1 + 40))
  {
    *(void *)(v1 + 104) = 0;

    [*(id *)(a1 + 40) invalidate];
    [*(id *)(a1 + 32) didFailArbiterConnection];
    dispatch_time_t v4 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51___UIKeyboardArbiterClient_queue_failedConnection___block_invoke_2;
    block[3] = &unk_1E52D9F70;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __51___UIKeyboardArbiterClient_queue_failedConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkConnection];
}

uint64_t __68___UIKeyboardArbiterClient_queue_setLastEventSource_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateEventSource:*(void *)(a1 + 48) options:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __68___UIKeyboardArbiterClient_queue_keyboardSuppressed_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 12);
  if (*(unsigned char *)(a1 + 48)) {
    int v4 = v3 + 1;
  }
  else {
    int v4 = v3 - 1;
  }
  *(_DWORD *)(v2 + 12) = v4;
  char v5 = +[UIPeripheralHost sharedInstance];
  [v5 setDeactivatedKeyboard:*(unsigned __int8 *)(a1 + 48) forScene:0];

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v6();
}

uint64_t __61___UIKeyboardArbiterClient_queue_keyboardChanged_onComplete___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleKeyboardChanged:*(void *)(a1 + 40) isLocal:0 onComplete:*(void *)(a1 + 48)];
}

uint64_t __64___UIKeyboardArbiterClient_queue_keyboardChangedWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) keyboardChangedCompleted];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (([@"_UIScrollKeyboardDuration" isEqual:v4] & 1) != 0
    || [@"_UIScrollKeyboardIAVOffset" isEqual:v4])
  {
    id v6 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      char isKindOfClass = v7 <= 1.0 && v7 >= 0.0;
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (([@"_UIScrollKeyboardCancelInfo" isEqual:v4] & 1) == 0
    && ([@"_UIKeyboardContextID" isEqual:v4] & 1) == 0
    && ![@"_UIKeyboardLayerID" isEqual:v4]
    && ![@"_UIScrollKeyboardPlacementFrom" isEqual:v4]
    && ![@"_UIScrollKeyboardPlacementTo" isEqual:v4])
  {
    if (![@"Origin" isEqual:v4])
    {
      char isKindOfClass = 0;
      goto LABEL_19;
    }
    id v6 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 pointValue];
      if (v9 == 0.0)
      {
        char isKindOfClass = 1;
LABEL_18:

        goto LABEL_19;
      }
    }
LABEL_17:
    char isKindOfClass = 0;
    goto LABEL_18;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
LABEL_19:

  return isKindOfClass & 1;
}

uint64_t __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 startTransition:*(void *)(a1 + 32) withInfo:*(void *)(a1 + 40)];
}

uint64_t __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 updateTransition:*(void *)(a1 + 32) withInfo:*(void *)(a1 + 40)];
}

uint64_t __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 completeTransition:*(void *)(a1 + 32) withInfo:*(void *)(a1 + 40)];
}

void __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v10 = [v4 objectForKey:@"Quiet"];
  uint64_t v6 = [v10 BOOLValue];
  float v7 = [*(id *)(a1 + 40) objectForKey:@"Animated"];
  uint64_t v8 = [v7 BOOLValue];
  double v9 = [*(id *)(a1 + 40) objectForKey:@"Notify"];
  objc_msgSend(v5, "setPlacement:quietly:animated:generateSplitNotification:", v3, v6, v8, objc_msgSend(v9, "BOOLValue"));
}

uint64_t __79___UIKeyboardArbiterClient_queue_keyboardTransition_event_withInfo_onComplete___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(v2 + 42);
  *(unsigned char *)(v2 + 42) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 55) = 1;
  [*(id *)(a1 + 32) _performOnDistributedControllersExceptSelf:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 55) = 0;
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    uint64_t result = (*(uint64_t (**)(void))(result + 16))();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 42) = v3;
  return result;
}

uint64_t __114___UIKeyboardArbiterClient_setDisableBecomeFirstResponder_forSuppressionAssertion_updatePlacement_wantsAssistant___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDisableBecomeFirstResponder:*(unsigned __int8 *)(a1 + 40) forSuppressionAssertion:*(unsigned __int8 *)(a1 + 41) updatePlacement:*(unsigned __int8 *)(a1 + 42) wantsAssistant:*(unsigned __int8 *)(a1 + 43)];
}

uint64_t __43___UIKeyboardArbiterClient_verifyPlacement__block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadPlacement];
}

uint64_t __44___UIKeyboardArbiterClient_cleanSuppression__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cleanDeactivation];
}

void __71___UIKeyboardArbiterClient__performOnDistributedControllersExceptSelf___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1ED4B2FB0]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __65___UIKeyboardArbiterClient_restorePreservedInputViewsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _restoreInputViewsWithId:@"inputui-keyboard-inputviews-preservation-key" animated:1];
}

void __56___UIKeyboardArbiterClient_controllerDidLayoutSubviews___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) keyboardActive]) {
    [*(id *)(a1 + 32) _layoutKeyboardViews:*(void *)(a1 + 40)];
  }
  int v2 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(v3 + 24);
  if (v4 >= v2 * v2)
  {
    uint64_t v6 = KeyboardArbiterClientLog_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClient controllerDidLayoutSubviews:]  Warning - input views recursively changing sizes - aborting", buf, 2u);
    }
  }
  else
  {
    *(_DWORD *)(v3 + 24) = v4 + 1;
    id v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) copy];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (v11 != *(void **)(a1 + 40)) {
            objc_msgSend(v11, "checkPlaceholdersForRemoteKeyboards", (void)v12);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }

    --*(_DWORD *)(*(void *)(a1 + 32) + 24);
  }
}

void __49___UIKeyboardArbiterClient_reloadForSnapshotting__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([(id)UIApp _isSpringBoard]) {
    [v4 containerRootController];
  }
  else {
  int v2 = [v4 existingContainerRootController];
  }
  uint64_t v3 = +[UIInputViewAnimationStyle animationStyleImmediate];
  [v4 pushAnimationStyle:v3];

  [v4 forceReloadInputViews];
  [v4 popAnimationStyle];
}

uint64_t __39___UIKeyboardArbiterClient_didSuspend___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDisableBecomeFirstResponder:0];
  int v2 = (void *)UIApp;
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _endBackgroundTask:v3];
}

void __39___UIKeyboardArbiterClient_didSuspend___block_invoke_2(uint64_t a1)
{
  id v2 = [(id)UIApp _systemAnimationFenceExemptQueue];
  [v2 performAsync:*(void *)(a1 + 32)];
}

uint64_t __39___UIKeyboardArbiterClient_didSuspend___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldSnapshot];
  if (result)
  {
    uint64_t result = +[UIKeyboard isKeyboardProcess];
    if ((result & 1) == 0) {
      uint64_t result = [*(id *)(a1 + 32) reloadForSnapshotting];
    }
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

uint64_t __39___UIKeyboardArbiterClient_willResume___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldSnapshot]
    && !+[UIKeyboard isKeyboardProcess])
  {
    [*(id *)(a1 + 32) reloadForSnapshotting];
  }
  [*(id *)(a1 + 32) startConnection];
  id v2 = *(void **)(a1 + 32);
  return [v2 setEnqueuedWillEnterForegroundActions:0];
}

void __48___UIKeyboardArbiterClient_mainBundleIdentifier__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v2 bundleIdentifier];
  uint64_t v1 = (void *)qword_1EB260318;
  qword_1EB260318 = v0;
}

@end