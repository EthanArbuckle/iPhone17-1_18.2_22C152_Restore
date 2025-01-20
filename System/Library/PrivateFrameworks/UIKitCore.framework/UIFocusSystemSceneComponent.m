@interface UIFocusSystemSceneComponent
@end

@implementation UIFocusSystemSceneComponent

void __49___UIFocusSystemSceneComponent__setupFocusSystem__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateFocusSystemState];
}

uint64_t __49___UIFocusSystemSceneComponent__setupFocusSystem__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _installFocusIfNeededForFocusSystemSceneComponent:*(void *)(a1 + 32)];
}

uint64_t __49___UIFocusSystemSceneComponent__setupFocusSystem__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateFocusSystemState];
  v2 = *(void **)(a1 + 32);
  return [v2 _delayedSetupFocusDebugWindow];
}

uint64_t __52___UIFocusSystemSceneComponent__tearDownFocusSystem__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _removeFocusIfNeededForFocusSystemSceneComponent:*(void *)(a1 + 32)];
}

void __63___UIFocusSystemSceneComponent__updateDeviceCapabilityObserver__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _adjustFocusSystemAvailability];
}

void __63___UIFocusSystemSceneComponent__updateDeviceCapabilityObserver__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _adjustFocusSystemAvailability];
}

uint64_t __54___UIFocusSystemSceneComponent__windowsForFocusSearch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 windowLevel];
  double v7 = v6;
  [v5 windowLevel];
  if (v7 >= v8)
  {
    [v4 windowLevel];
    double v11 = v10;
    [v5 windowLevel];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

void __58___UIFocusSystemSceneComponent___applicationIsSpringBoard__block_invoke()
{
  if ([(id)UIApp _isSpringBoard])
  {
    id v1 = [MEMORY[0x1E4F28B50] mainBundle];
    v0 = [v1 bundleIdentifier];
    _MergedGlobals_1069 = [v0 isEqualToString:@"com.apple.springboard"];
  }
  else
  {
    _MergedGlobals_1069 = 0;
  }
}

void __47___UIFocusSystemSceneComponent_coordinateSpace__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    id v4 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "Unable to find coordinate space for scene %@. Falling back to screen space.", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIFocusSystemSceneComponentDidFinishInitializationNotification_block_invoke___s_category)+ 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v3;
      _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Unable to find coordinate space for scene %@. Falling back to screen space.", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __70___UIFocusSystemSceneComponent__focusSystem_willUpdateFocusInContext___block_invoke(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 _countOfFocusedAncestorTrackingViewsInSubtree])
  {
    if ([v3 _tracksFocusedAncestors]) {
      [v3 _ancestorWillUpdateFocusInContext:a1[4] withAnimationCoordinator:a1[5]];
    }
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = objc_msgSend(v3, "subviews", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*(void *)(a1[6] + 8) + 24) + 16))();
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

void __69___UIFocusSystemSceneComponent__focusSystem_didUpdateFocusInContext___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) nextFocusedItem];
  [v1 _updateFocusEffectForItem:v2];
}

@end