@interface UISceneLifecycleSettingsUpdateBlockWithCanvasAndTransitionContext
@end

@implementation UISceneLifecycleSettingsUpdateBlockWithCanvasAndTransitionContext

uint64_t ___UISceneLifecycleSettingsUpdateBlockWithCanvasAndTransitionContext_block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _isRespondingToLifecycleEvent];
  int64_t v3 = +[UIScene _activationStateFromSceneSettings:*(void *)(a1 + 40)];
  int64_t v4 = +[UIScene _activationStateFromSceneSettings:*(void *)(a1 + 48)];
  if (_UISceneLifecycleCompositeActionMaskHighestLifecycleActionType(_UISceneLifecycleCompositeActionMaskFromStateToState__staticStateMap[4 * v3 + 5 + v4])
    || (uint64_t v5 = [*(id *)(a1 + 40) deactivationReasons],
        v5 != [*(id *)(a1 + 48) deactivationReasons]))
  {
    unsigned int v17 = v2;
    v6 = [*(id *)(a1 + 32) _lifecycleMonitor];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = ___UISceneLifecycleSettingsUpdateBlockWithCanvasAndTransitionContext_block_invoke_2;
    v22[3] = &unk_1E52E03E8;
    id v23 = *(id *)(a1 + 32);
    int64_t v25 = v4;
    id v24 = *(id *)(a1 + 48);
    [v6 transitionToTargetState:v7 fromState:v8 withTransitionContext:v9 preparations:v22];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v10 = [*(id *)(a1 + 32) _sceneComponents];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v15, "_scene:didTransitionFromActivationState:withReasonsMask:", *(void *)(a1 + 32), v3, objc_msgSend(*(id *)(a1 + 40), "deactivationReasons"));
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v12);
    }

    uint64_t v2 = v17;
  }
  return [*(id *)(a1 + 32) _setIsRespondingToLifecycleEvent:v2];
}

void ___UISceneLifecycleSettingsUpdateBlockWithCanvasAndTransitionContext_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = a2;
  [*(id *)(a1 + 32) _setIsRespondingToLifecycleEvent:1];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int64_t v3 = [*(id *)(a1 + 32) _sceneComponents];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "_scene:willTransitionToActivationState:withReasonsMask:", *(void *)(a1 + 32), *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "deactivationReasons"));
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9[2](v9, 0);
}

@end