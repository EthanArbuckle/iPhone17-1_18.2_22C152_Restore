@interface UIBacklightEnvironment
@end

@implementation UIBacklightEnvironment

void __42___UIBacklightEnvironment__traitOverrides__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  v4 = self;
  [v5 setNSIntegerValue:v3 forTrait:v4];

  [v5 _setNSIntegerValue:*(void *)(a1 + 40) forTraitToken:0x1ED3F5CA0];
}

void __48___UIBacklightEnvironment__postSynchronizeQueue__block_invoke()
{
  v0 = objc_alloc_init(_UIAfterCACommitQueue);
  v1 = (void *)qword_1EB260E98;
  qword_1EB260E98 = (uint64_t)v0;
}

void __83___UIBacklightEnvironment__notifyObserversEnvironmentVisualStateWillChangeToState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v2 _willExitAlwaysOn];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v2 performSelector:sel_puic_willExitAlwaysOn];
  }
}

void __83___UIBacklightEnvironment__notifyObserversEnvironmentVisualStateWillChangeToState___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v2 _willEnterAlwaysOn];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v2 performSelector:sel_puic_willEnterAlwaysOn];
  }
}

void __87___UIBacklightEnvironment__notifyObserversIfEnvironmentVisualStateDidChangeToActiveOn___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v2 _didExitAlwaysOn];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v2 performSelector:sel_puic_didExitAlwaysOn];
  }
}

void __89___UIBacklightEnvironment__notifyObserversIfEnvironmentVisualStateDidChangeFromActiveOn___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v2 _didEnterAlwaysOn];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v2 performSelector:sel_puic_didEnterAlwaysOn];
  }
}

uint64_t __74___UIBacklightEnvironment_transitionTraitsInUpdate_animations_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIBacklightEnvironment", &UIAlwaysOnFallbackTimelineIdentifier_block_invoke___s_category)+ 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void **)(a1 + 32);
      v4 = v2;
      id v5 = [v3 context];
      if ([v5 isAnimated]) {
        v6 = @"Animated";
      }
      else {
        v6 = @"Non-animated";
      }
      v7 = [*(id *)(a1 + 40) _windowScene];
      v8 = [v7 succinctDescription];
      int v11 = 138412546;
      v12 = v6;
      __int16 v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%@ transitionTraitsInUpdate about to call _componentDidUpdateTraitOverrides on %{public}@", (uint8_t *)&v11, 0x16u);
    }
    v9 = [*(id *)(a1 + 40) _windowScene];
    [v9 _componentDidUpdateTraitOverrides:*(void *)(a1 + 40)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __74___UIBacklightEnvironment_transitionTraitsInUpdate_animations_completion___block_invoke_148(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74___UIBacklightEnvironment_transitionTraitsInUpdate_animations_completion___block_invoke_159(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = objc_msgSend(WeakRetained, "windows", 0);

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) layoutIfNeeded];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

uint64_t __106___UIBacklightEnvironment__performOnChildViewControllersForAlwaysOnTimelines_performBlock_withCompletion___block_invoke(uint64_t a1)
{
  if (pthread_main_np() != 1)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 72) file:@"_UIBacklightEnvironment.m" lineNumber:425 description:@"Call must be made on main thread"];
  }
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 32) count];
  if (!result && *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  return result;
}

void __75___UIBacklightEnvironment_updateSceneWithFrameSpecifier_layout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 48) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [*(id *)(a1 + 40) addObject:v3];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 performSelector:sel_puic_updateWithFrameSpecifier_ withObject:*(void *)(a1 + 32)];
  }
  else
  {
    [v3 _updateWithFrameSpecifier:*(void *)(a1 + 32)];
  }
}

uint64_t __75___UIBacklightEnvironment_updateSceneWithFrameSpecifier_layout_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 _updateWithFrameSpecifier:*(void *)(a1 + 32) completion:a3];
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) previousVisualState];
  id v3 = [*(id *)(a1 + 40) visualState];
  [*(id *)(a1 + 40) isAnimated];
  kdebug_trace();

  uint64_t v4 = *(void **)(a1 + 48);
  return [v4 sceneContentsDidUpdate];
}

void __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_2(uint64_t a1)
{
  if (pthread_main_np() != 1)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"_UIBacklightEnvironment.m" lineNumber:511 description:@"Call must be made on main thread"];
  }
  [MEMORY[0x1E4F39CF8] begin];
  id v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_3;
  v13[3] = &unk_1E52E8A30;
  __int16 v14 = *(_WORD *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 64);
  v13[4] = v3;
  v13[5] = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_5;
  v8[3] = &unk_1E52E65E0;
  id v5 = v2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v12 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 48);
  [v3 transitionTraitsInUpdate:v5 animations:v13 completion:v8];
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_3(uint64_t a1)
{
  kdebug_trace();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_4;
  v3[3] = &unk_1E52E8A30;
  long long v4 = *(_OWORD *)(a1 + 32);
  __int16 v5 = *(_WORD *)(a1 + 48);
  return [(id)v4 updateSceneWithFrameSpecifier:0 layout:0 completion:v3];
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_4(uint64_t a1)
{
  if (pthread_main_np() != 1)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"_UIBacklightEnvironment.m" lineNumber:519 description:@"Call must be made on main thread"];
  }
  [MEMORY[0x1E4F39CF8] commit];
  return kdebug_trace();
}

void __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) sceneContentsAnimationDidComplete];
  char v2 = [*(id *)(a1 + 32) areSceneContentsUpdated];
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    __int16 v5 = *(void **)(a1 + 40);
    [v5 _notifyObserversIfEnvironmentVisualStateDidChangeToActiveOn:v4];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_6;
    v9[3] = &unk_1E52E3968;
    id v6 = *(id *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 40);
    long long v8 = *(void **)(a1 + 48);
    id v11 = v6;
    v9[4] = v7;
    id v10 = v8;
    [v3 _commit:0 andPerformPostSynchronizeBlock:v9];
  }
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_6(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  char v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  return [v2 _notifyObserversIfEnvironmentVisualStateDidChangeToActiveOn:v3];
}

void __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_7(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAnimated]) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  if (*(unsigned char *)(*(void *)(a1 + 40) + 24)
    && [*(id *)(a1 + 32) isAnimated]
    && *(void *)(a1 + 48))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_8;
    block[3] = &unk_1E52DA040;
    id v4 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    char v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v2();
  }
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_9(uint64_t a1)
{
  kdebug_trace();
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 _commit:1 andPerformPostSynchronizeBlock:v3];
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_11(uint64_t a1)
{
  [*(id *)(a1 + 32) sceneContentsAnimationDidComplete];
  char v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 _notifyObserversIfEnvironmentVisualStateDidChangeFromActiveOn:v3];
}

void __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_12(uint64_t a1)
{
  if (pthread_main_np() != 1)
  {
    __int16 v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"_UIBacklightEnvironment.m" lineNumber:598 description:@"Call must be made on main thread"];
  }
  uint64_t v3 = *(void **)(a1 + 32);
  char v2 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_14;
  v8[3] = &unk_1E52D9F70;
  id v9 = v2;
  [v3 transitionTraitsInUpdate:v9 animations:&__block_literal_global_173_0 completion:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_15;
  v6[3] = &unk_1E52D9F70;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v4 _commit:1 andPerformPostSynchronizeBlock:v6];
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) sceneContentsAnimationDidComplete];
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) sceneContentsDidUpdate];
}

uint64_t __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_16(void *a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  if (a1[4])
  {
    char v2 = (void *)a1[5];
    return objc_msgSend(v2, "updateSceneWithFrameSpecifier:layout:completion:");
  }
  else
  {
    id v4 = *(uint64_t (**)(void))(a1[6] + 16);
    return v4();
  }
}

void __93___UIBacklightEnvironment_environment_timelinesForDateInterval_previousSpecifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v5 performSelector:sel_puic_timelinesForDateInterval_ withObject:*(void *)(a1 + 32)];
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      [*(id *)(a1 + 48) addObject:v5];
      goto LABEL_7;
    }
    uint64_t v3 = [v5 _timelinesForDateInterval:*(void *)(a1 + 32)];
  }
  id v4 = (void *)v3;
  [*(id *)(a1 + 40) addObjectsFromArray:v3];

LABEL_7:
}

void __93___UIBacklightEnvironment_environment_timelinesForDateInterval_previousSpecifier_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93___UIBacklightEnvironment_environment_timelinesForDateInterval_previousSpecifier_completion___block_invoke_3;
  v10[3] = &unk_1E52F20F8;
  id v6 = (void *)a1[6];
  uint64_t v8 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v13 = a1[7];
  v10[4] = v7;
  id v11 = v6;
  id v12 = v5;
  id v9 = v5;
  [a2 _timelinesForDateInterval:v8 completion:v10];
}

void __93___UIBacklightEnvironment_environment_timelinesForDateInterval_previousSpecifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (pthread_main_np() != 1)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"_UIBacklightEnvironment.m" lineNumber:667 description:@"Call must be made on main thread"];
  }
  [*(id *)(a1 + 40) addObjectsFromArray:v4];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __93___UIBacklightEnvironment_environment_timelinesForDateInterval_previousSpecifier_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end