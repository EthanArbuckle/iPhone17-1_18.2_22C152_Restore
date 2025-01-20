@interface SBSUIInCallWindowSceneSettingsDiffAction
- (id)_inCallSceneSettingsDiffInspector;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
@end

@implementation SBSUIInCallWindowSceneSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SBSUIInCallWindowSceneSettingsDiffAction.m", 31, @"Invalid parameter not satisfying: %@", @"[uiScene isKindOfClass:[SBSUIInCallWindowScene class]]" object file lineNumber description];
  }
  id v17 = v13;
  char v27 = 0;
  __int16 v26 = 0;
  v18 = [(SBSUIInCallWindowSceneSettingsDiffAction *)self _inCallSceneSettingsDiffInspector];
  [v18 inspectDiff:v16 withContext:&v26];

  if ((_BYTE)v26)
  {
    id v23 = v14;
    id v24 = v17;
    id v25 = v15;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContext();
  }
  if (HIBYTE(v26))
  {
    id v22 = v17;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContext();
  }
  if (v27)
  {
    v19 = [v14 settings];
    uint64_t v20 = [v19 isAttachedToWindowedAccessory];
    [v19 windowedAccessoryCutoutFrameInScreen];
    objc_msgSend(v17, "_setAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", v20);
  }
}

void __154__SBSUIInCallWindowSceneSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) settings];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v7 isAttachedToWindowedAccessory];
  [v7 windowedAccessoryCutoutFrameInScreen];
  objc_msgSend(v2, "_setAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", v3);
  v4 = *(void **)(a1 + 40);
  uint64_t v5 = [v7 inCallPresentationMode];
  v6 = objc_msgSend(*(id *)(a1 + 48), "SBSUI_inCallAnalyticsSource");
  [v4 _updatePresentationMode:v5 analyticsSource:v6];
}

uint64_t __154__SBSUIInCallWindowSceneSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleFrameChanged];
}

- (id)_inCallSceneSettingsDiffInspector
{
  inCallSceneSettingsDiffInspector = self->_inCallSceneSettingsDiffInspector;
  if (!inCallSceneSettingsDiffInspector)
  {
    v4 = objc_alloc_init(SBSUIInCallSceneSettingsDiffInspector);
    uint64_t v5 = self->_inCallSceneSettingsDiffInspector;
    self->_inCallSceneSettingsDiffInspector = v4;

    [(SBSUIInCallSceneSettingsDiffInspector *)self->_inCallSceneSettingsDiffInspector observeInCallPresentationModeWithBlock:&__block_literal_global_28];
    [(FBSSceneSettingsDiffInspector *)self->_inCallSceneSettingsDiffInspector observeFrameWithBlock:&__block_literal_global_12];
    [(SBSUIInCallSceneSettingsDiffInspector *)self->_inCallSceneSettingsDiffInspector observeAttachedToWindowedAccessoryWithBlock:&__block_literal_global_14];
    inCallSceneSettingsDiffInspector = self->_inCallSceneSettingsDiffInspector;
  }
  return inCallSceneSettingsDiffInspector;
}

void __77__SBSUIInCallWindowSceneSettingsDiffAction__inCallSceneSettingsDiffInspector__block_invoke(uint64_t a1, unsigned char *a2)
{
  *a2 = 1;
}

void __77__SBSUIInCallWindowSceneSettingsDiffAction__inCallSceneSettingsDiffInspector__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 1) = 1;
}

void __77__SBSUIInCallWindowSceneSettingsDiffAction__inCallSceneSettingsDiffInspector__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 2) = 1;
}

- (void).cxx_destruct
{
}

@end