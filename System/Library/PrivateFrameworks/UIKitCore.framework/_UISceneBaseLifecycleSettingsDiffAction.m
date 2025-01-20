@interface _UISceneBaseLifecycleSettingsDiffAction
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
@end

@implementation _UISceneBaseLifecycleSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a7;
  if ([v10 _hasLifecycle])
  {
    v13 = [v10 _effectiveSettings];
    v14 = _UISceneLifecycleSettingsUpdateBlockWithCanvasAndTransitionContext(v10, v11, v13, v12);

    if (v14)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __153___UISceneBaseLifecycleSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke;
      v15[3] = &unk_1E52E0450;
      id v19 = v14;
      id v16 = v10;
      id v17 = v11;
      id v18 = v12;
      _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v18, v15, 0);
    }
  }
}

@end