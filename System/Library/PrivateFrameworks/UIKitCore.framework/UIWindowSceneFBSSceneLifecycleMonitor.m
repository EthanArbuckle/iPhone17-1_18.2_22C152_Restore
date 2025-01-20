@interface UIWindowSceneFBSSceneLifecycleMonitor
@end

@implementation UIWindowSceneFBSSceneLifecycleMonitor

void __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke_4(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 80);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke_5;
  v10[3] = &unk_1E52DFD68;
  v3 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 64);
  id v11 = v4;
  uint64_t v14 = v5;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  _UIScenePerformActionsWithLifecycleActionMask(v2, v10);
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 24))
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 32) file:@"_UISceneLifecycleMonitor.m" lineNumber:269 description:@"reached end of scene transition block but still preserving transitioning state!"];

    uint64_t v6 = *(void *)(a1 + 32);
  }
  if (*(void *)(v6 + 16))
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 32) file:@"_UISceneLifecycleMonitor.m" lineNumber:270 description:@"reached end of scene transition block but still preserving false transition state!"];
  }
  if (*(_DWORD *)(a1 + 80))
  {
    __cachedMostActiveWindowScene = 0;
    v7 = +[_UIApplicationIntelligenceSupport sharedInstance];
    [v7 connectedScenesUpdated];
  }
}

uint64_t __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke_5(uint64_t result, int a2)
{
  uint64_t v2 = result;
  switch(a2)
  {
    case 1:
      [*(id *)(result + 32) willBecomeActive];
      (*(void (**)(void))(*(void *)(v2 + 40) + 16))();
      v3 = *(void **)(v2 + 32);
      result = [v3 didBecomeActive];
      break;
    case 2:
      [*(id *)(*(void *)(*(void *)(result + 64) + 8) + 40) _enqueuePostSettingsUpdateResponseBlock:*(void *)(result + 48) inPhase:0x1ED0EB320];
      [*(id *)(v2 + 32) willEnterForeground];
      (*(void (**)(void))(*(void *)(v2 + 40) + 16))();
      id v4 = *(void **)(v2 + 32);
      result = [v4 didEnterForeground];
      break;
    case 3:
      [*(id *)(*(void *)(*(void *)(result + 64) + 8) + 40) _enqueuePostSettingsUpdateResponseBlock:*(void *)(result + 56) inPhase:0x1ED0EB320];
      [*(id *)(v2 + 32) willEnterBackground];
      (*(void (**)(void))(*(void *)(v2 + 40) + 16))();
      uint64_t v5 = *(void **)(v2 + 32);
      result = [v5 didEnterBackground];
      break;
    case 4:
      [*(id *)(result + 32) willResignActive];
      (*(void (**)(void))(*(void *)(v2 + 40) + 16))();
      uint64_t v6 = *(void **)(v2 + 32);
      result = [v6 didResignActive];
      break;
    case 5:
      [*(id *)(result + 32) willConnect];
      *(unsigned char *)(*(void *)(v2 + 32) + 25) = 1;
      (*(void (**)(void))(*(void *)(v2 + 40) + 16))();
      v7 = *(void **)(v2 + 32);
      result = [v7 didConnect];
      break;
    case 6:
      [*(id *)(result + 32) willDisonnect];
      (*(void (**)(void))(*(void *)(v2 + 40) + 16))();
      *(unsigned char *)(*(void *)(v2 + 32) + 25) = 0;
      v8 = *(void **)(v2 + 32);
      result = [v8 didDisonnect];
      break;
    default:
      return result;
  }
  return result;
}

void __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke_3(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = a3 ^ 1;
  if (a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [NSNumber numberWithInteger:a2];
  }
  id v6 = v5;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v5);
  if ((a3 & 1) == 0)
  {
  }
}

uint64_t __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _prepareForResume];
}

uint64_t __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _prepareForSuspend];
}

void __60___UIWindowSceneFBSSceneLifecycleMonitor_didEnterBackground__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60___UIWindowSceneFBSSceneLifecycleMonitor_didEnterBackground__block_invoke_2;
  v2[3] = &unk_1E52DAE80;
  id v3 = v1;
  [v3 _updateUIClientSettingsWithBlock:v2];
}

void __60___UIWindowSceneFBSSceneLifecycleMonitor_didEnterBackground__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setSupportedInterfaceOrientations:", objc_msgSend(v2, "_currentlySupportedInterfaceOrientations"));
}

uint64_t __58___UIWindowSceneFBSSceneLifecycleMonitor_willBecomeActive__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateUIClientSettingsWithBlock:&__block_literal_global_63];
}

uint64_t __58___UIWindowSceneFBSSceneLifecycleMonitor_willBecomeActive__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSupportedInterfaceOrientations:0];
}

@end