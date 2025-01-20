@interface UISceneLifecycleMultiplexer
@end

@implementation UISceneLifecycleMultiplexer

uint64_t __78___UISceneLifecycleMultiplexer_lifecycleWantsUnnecessaryDelayForSceneDelivery__block_invoke()
{
  v0 = _UIKitUserDefaults();
  char v1 = [v0 BOOLForKey:@"UIRequireCrimsonLifecycle"];

  v2 = [(id)UIApp delegate];
  if (objc_opt_respondsToSelector())
  {
    char v3 = 1;
  }
  else
  {
    v4 = [(id)UIApp delegate];
    if (objc_opt_respondsToSelector()) {
      char v3 = 1;
    }
    else {
      char v3 = [(id)UIApp _appSupportsMultipleScenes];
    }
  }
  char v5 = [(id)UIApp _appAdoptsUISceneLifecycle];
  v6 = objc_opt_class();
  char v7 = _UIApplicationWantsExtensionBehavior(v6);
  uint64_t result = [(id)UIApp isFrontBoard];
  lifecycleWantsUnnecessaryDelayForSceneDelivery__lifecycleWantsUnnecessaryDelayForSceneDelivery = (v1 | v3 | v5 | v7 | result) ^ 1;
  return result;
}

void __75___UISceneLifecycleMultiplexer__mostActiveSceneIncludingInternal_withTest___block_invoke_10(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void *)(v7 + 40);
    v8 = (id *)(v7 + 40);
    if (!v9)
    {
      objc_storeStrong(v8, a2);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v10 activationState];
    }
    if (objc_msgSend(*(id *)(a1 + 56), "_compareLifecycleStateOfScene:toScene:") == -1)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v10 activationState];
    }
    if (![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) activationState]) {
      *a4 = 1;
    }
  }
}

uint64_t __75___UISceneLifecycleMultiplexer__mostActiveSceneIncludingInternal_withTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 _hasLifecycle] || objc_msgSend(v3, "activationState") < 0)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      uint64_t v5 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
    else {
      uint64_t v5 = 1;
    }
  }

  return v5;
}

uint64_t __62___UISceneLifecycleMultiplexer_mostActiveWindowSceneOnScreen___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [v3 screen];
    uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __67___UISceneLifecycleMultiplexer__mostActiveSceneForApplicationState__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 _isInternal]) {
    uint64_t v3 = [v2 _affectsAppLifecycleIfInternal];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_31()
{
  return [(id)UIApp _performBlockAfterCATransactionCommits:&__block_literal_global_36];
}

uint64_t __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_2_34()
{
  v0 = (void *)UIApp;
  char v1 = (unint64_t *)(UIApp + 176);
  uint64_t v2 = *(void *)(UIApp + 176);
  if ((v2 & 0x80000) != 0)
  {
    unint64_t v4 = *(void *)(UIApp + 184);
    *char v1 = v2 & 0xFFFFFFFFFFF7FFFFLL;
    v1[1] = v4;
    uint64_t result = [v0 _reportMainSceneUpdateFinished:0];
    *(void *)(UIApp + 176) |= 0x80000uLL;
  }
  else
  {
    return [v0 _reportMainSceneUpdateFinished:0];
  }
  return result;
}

void __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_2(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 1:
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
      [(id)UIApp _stopDeactivatingForReason:12];
      if (!*(unsigned char *)(a1 + 104))
      {
        [(id)UIApp applicationDidResume];
        id v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v28 postNotificationName:@"UIApplicationResumedNotification" object:UIApp userInfo:0];
      }
      return;
    case 2:
      uint64_t v6 = [*(id *)(a1 + 56) deviceOrientation];
      if (![*(id *)(a1 + 56) deviceOrientationEventsEnabled]) {
        goto LABEL_20;
      }
      if ((unint64_t)(v6 - 1) >= 4)
      {
        uint64_t v7 = [*(id *)(a1 + 56) interfaceOrientation];
      }
      else if (([(id)UIApp _appAdoptsUICanvasLifecycle] & 1) != 0 {
             || [(id)UIApp _appAdoptsUISceneLifecycle])
      }
      {
        uint64_t v7 = [*(id *)(a1 + 56) interfaceOrientation];
        if (v6 != [*(id *)(a1 + 56) interfaceOrientation])
        {
          v8 = _UIMainBundleIdentifier();
          char v9 = [@"com.apple.MobileSMS" isEqualToString:v8];

          if ((v9 & 1) == 0)
          {
            id v10 = *(void **)(a1 + 64);
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_3;
            v38[3] = &__block_descriptor_40_e5_v8__0l;
            v38[4] = v6;
            [v10 _enqueuePostSettingsUpdateResponseBlock:v38 inPhase:0x1ED0EB2E0];
          }
        }
      }
      else
      {
LABEL_20:
        uint64_t v7 = v6;
      }
      v26 = +[UIDevice currentDevice];
      objc_msgSend(v26, "setOrientation:animated:", v7, objc_msgSend(*(id *)(a1 + 72), "isForeground"));

      [*(id *)(a1 + 32) _scheduleFirstCommit];
      BSSetMainThreadPriorityFixedForUI();
      [(id)UIApp _deactivateForReason:12];
      if (!*(unsigned char *)(a1 + 104)
        || ([*(id *)(a1 + 32) lifecycleWantsUnnecessaryDelayForSceneDelivery] & 1) == 0)
      {
        if (![(id)UIApp _appAdoptsUICanvasLifecycle]
          || ([(id)UIApp _appAdoptsUISceneLifecycle] & 1) == 0)
        {
          [(id)UIApp _checkActivityContinuationAndBecomeCurrentIfNeeded];
        }
        [(id)UIApp _sendWillEnterForegroundCallbacks];
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
      }
      [(id)UIApp _stopDeactivatingForReason:11];
      v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v27 postNotificationName:@"UIApplicationResumedEventsOnlyNotification" object:UIApp userInfo:0];

      return;
    case 3:
      [(id)UIApp _updateAppPriorityForSuspendedState];
      v11 = (void *)UIApp;
      *(void *)(UIApp + 176) &= ~0x100000000uLL;
      [v11 _deactivateForReason:11];
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
      [(id)UIApp _cancelAllInputs];
      [(id)UIApp applicationWillSuspend];
      v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 postNotificationName:@"UIApplicationSuspendedNotification" object:UIApp userInfo:0];

      [(id)UIApp _applicationDidEnterBackground];
      LOBYTE(v12) = [*(id *)(a1 + 32) _prepareForClientSuspensionWithScene:*(void *)(a1 + 88)];
      int v13 = *(unsigned __int8 *)(a1 + 105);
      if (*(unsigned char *)(a1 + 105))
      {
        [(id)UIApp _handleSuspensionActions];
        v14 = (void *)UIApp;
      }
      else
      {
        uint64_t v16 = *(void *)(UIApp + 184);
        [(id)UIApp _handleSuspensionActions];
        v14 = (void *)UIApp;
        if ((v16 & 0x4000) == 0) {
          LODWORD(v12) = (*(unsigned __int8 *)(UIApp + 185) >> 6) & 1;
        }
      }
      char v17 = [v14 reportApplicationSuspended];
      if (v13) {
        char v18 = 1;
      }
      else {
        char v18 = (char)v12;
      }
      char v19 = v18 | v17;
      v20 = [*(id *)(a1 + 88) uiSettings];
      __int16 v21 = [v20 deactivationReasons];

      if ((v21 & 0x100) != 0)
      {
        v22 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
        [v22 setSuppressingKeyboard:1 forScene:*(void *)(a1 + 80)];
      }
      v23 = *(void **)(a1 + 64);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3254779904;
      v29[2] = __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_4;
      v29[3] = &unk_1ED0BEB60;
      char v35 = HIBYTE(v21) & 1;
      id v30 = *(id *)(a1 + 80);
      char v36 = (char)v12;
      id v24 = *(id *)(a1 + 40);
      char v37 = v19;
      uint64_t v25 = *(void *)(a1 + 32);
      id v31 = v24;
      uint64_t v32 = v25;
      id v33 = *(id *)(a1 + 88);
      id v34 = *(id *)(a1 + 96);
      [v23 _enqueuePostSettingsUpdateResponseBlock:v29 inPhase:0x1ED0EB2E0];

      return;
    case 4:
      [(id)UIApp _deactivateForReason:12];
      v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 postNotificationName:@"UIApplicationSuspendedEventsOnlyNotification" object:UIApp userInfo:0];

      objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
      return;
    case 5:
      if ([*(id *)(a1 + 32) lifecycleWantsUnnecessaryDelayForSceneDelivery])
      {
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
        uint64_t v3 = *(void **)(a1 + 32);
        uint64_t v4 = *(void *)(a1 + 48);
        uint64_t v5 = *(void *)(a1 + 96);
        [v3 completeApplicationLaunchWithFBSScene:v4 transitionContext:v5];
      }
      return;
    default:
      return;
  }
}

void __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 104);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3254779904;
  v8 = __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_2;
  char v9 = &unk_1ED0BEAC0;
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v3;
  id v12 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 88);
  id v18 = *(id *)(a1 + 96);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 72);
  __int16 v19 = *(_WORD *)(a1 + 108);
  id v16 = *(id *)(a1 + 80);
  _UIScenePerformActionsWithLifecycleActionMask(v2, &v6);
  if (*(_DWORD *)(a1 + 104))
  {
    __cachedMostActiveWindowScene = 0;
    uint64_t v4 = objc_msgSend((id)UIApp, "applicationState", v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
    uint64_t v5 = +[_UIApplicationIntelligenceSupport sharedInstance];
    [v5 setApplicationState:v4];
  }
  if (*(unsigned char *)(a1 + 110)) {
    [*(id *)(a1 + 64) _enqueuePostSettingsUpdateResponseBlock:&__block_literal_global_33 inPhase:0x1ED0EB2E0];
  }
}

void __46___UISceneLifecycleMultiplexer_sharedInstance__block_invoke()
{
  v0 = [_UISceneLifecycleMultiplexer alloc];
  uint64_t v1 = [(_UISceneLifecycleMultiplexer *)v0 initForAppSingleton:UIApp];
  int v2 = (void *)_MergedGlobals_980;
  _MergedGlobals_980 = v1;
}

uint64_t __52___UISceneLifecycleMultiplexer_collectBackingStores__block_invoke(uint64_t a1)
{
  return [(id)UIApp _endBackgroundTask:*(void *)(a1 + 32)];
}

void __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_3(uint64_t a1)
{
  id v2 = +[UIDevice currentDevice];
  [v2 setOrientation:*(void *)(a1 + 32) animated:0];
}

void __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_4(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_5;
  aBlock[3] = &unk_1E52DD128;
  char v9 = *(unsigned char *)(a1 + 72);
  id v7 = *(id *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 73);
  id v8 = *(id *)(a1 + 40);
  id v2 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v3 = v2;
  if (*(unsigned char *)(a1 + 74))
  {
    v2[2](v2);
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"UIApplicationWantsViewsToDisappearNotification" object:*(void *)(a1 + 48)];

    [(id)UIApp _handleTaskCompletionAndTerminate:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 40) isForeground])
  {
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v5 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      [v5 setSuppressingKeyboard:0 forScene:*(void *)(a1 + 32)];
    }
  }
  else
  {
    v3[2](v3);
  }
}

void __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke_5(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    [v2 setSuppressingKeyboard:0 forScene:*(void *)(a1 + 32)];
  }
  if (!*(unsigned char *)(a1 + 49) && (_UISceneLifecycleStateIsSEO(*(void **)(a1 + 40)) & 1) == 0)
  {
    uint64_t v3 = +[UIKeyboard activeKeyboard];
    [v3 _deactivateForBackgrounding];

    [(id)UIApp _purgeSharedInstances];
    CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 synchronize];
  }
}

void __69___UISceneLifecycleMultiplexer__prepareForClientSuspensionWithScene___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) objectForKey:@"UISuspendedStatusBarStyleKey"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v3 integerValue];
      [v7 setStatusBarStyle:v4];
      [v7 setDefaultStatusBarStyle:v4];
    }
  }
  uint64_t v5 = [*(id *)(a1 + 32) objectForKey:@"UISuspendedStatusBarHiddenKey"];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 BOOLValue];
      [v7 setStatusBarHidden:v6];
      [v7 setDefaultStatusBarHidden:v6];
    }
  }
  [v7 setDefaultPNGName:*(void *)(a1 + 40)];
  [v7 setDefaultPNGExpirationTime:*(double *)(a1 + 48)];
}

@end