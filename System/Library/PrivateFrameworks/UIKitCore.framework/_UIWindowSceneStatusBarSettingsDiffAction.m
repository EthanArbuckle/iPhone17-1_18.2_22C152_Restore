@interface _UIWindowSceneStatusBarSettingsDiffAction
- (UIApplicationSceneSettingsDiffInspector)sceneSettingsStatusBarDiffInspector;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)_updateForcedStatusBarForegroundTransparentWithSceneSettings:(id)a3 transitionContext:(id)a4;
- (void)setSceneSettingsStatusBarDiffInspector:(id)a3;
@end

@implementation _UIWindowSceneStatusBarSettingsDiffAction

- (void).cxx_destruct
{
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"_UIWindowSceneStatusBarSettingsDiffAction.m", 78, @"Invalid parameter not satisfying: %@", @"[uiScene isKindOfClass:[UIWindowScene class]]" object file lineNumber description];
  }
  id v15 = v12;
  char v28 = 0;
  if (v13)
  {
    v16 = [(_UIWindowSceneStatusBarSettingsDiffAction *)self sceneSettingsStatusBarDiffInspector];
    [v16 inspectDiff:v13 withContext:&v28];
  }
  else
  {
    char v28 = 56;
  }
  v17 = [v15 _effectiveUISettings];
  char v18 = v28;
  if ((v28 & 4) != 0)
  {
    v19 = [v15 statusBarManager];
    [v19 updateStatusBarAppearance];

    char v18 = v28;
  }
  if ((v18 & 0x20) != 0)
  {
    [v17 safeAreaInsetsPortrait];
    double v21 = v20;
    [v17 defaultStatusBarHeightForOrientation:1];
    if (v21 < v22)
    {
      v23 = [v15 _allWindows];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __155___UIWindowSceneStatusBarSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke;
      v26[3] = &unk_1E52DC3A0;
      id v27 = v23;
      id v24 = v23;
      _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v14, v26, 0);
    }
  }
}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsStatusBarDiffInspector
{
  sceneSettingsStatusBarDiffInspector = self->_sceneSettingsStatusBarDiffInspector;
  if (!sceneSettingsStatusBarDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsStatusBarDiffInspector;
    self->_sceneSettingsStatusBarDiffInspector = v4;

    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsStatusBarDiffInspector observeStatusBarStyleOverridesToSuppressWithBlock:&__block_literal_global_95];
    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsStatusBarDiffInspector observeForcedStatusBarForegroundTransparentWithBlock:&__block_literal_global_2_8];
    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsStatusBarDiffInspector observeForcedStatusBarStyleWithBlock:&__block_literal_global_4_3];
    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsStatusBarDiffInspector observeStatusBarPartsWithBlock:&__block_literal_global_6_4];
    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsStatusBarDiffInspector observeStatusBarAvoidanceFrameWithBlock:&__block_literal_global_8_2];
    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsStatusBarDiffInspector observeStatusBarHeightWithBlock:&__block_literal_global_10_0];
    sceneSettingsStatusBarDiffInspector = self->_sceneSettingsStatusBarDiffInspector;
  }
  return sceneSettingsStatusBarDiffInspector;
}

- (void)_updateForcedStatusBarForegroundTransparentWithSceneSettings:(id)a3 transitionContext:(id)a4
{
  id v5 = a4;
  int v6 = [a3 forcedStatusBarForegroundTransparent];
  v7 = [(id)UIApp statusBarWindow];
  v8 = [v7 _scene];

  v9 = [v8 uiClientSettings];
  int v10 = [v9 isStatusBarForegroundTransparent];

  if (v6 != v10)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __124___UIWindowSceneStatusBarSettingsDiffAction__updateForcedStatusBarForegroundTransparentWithSceneSettings_transitionContext___block_invoke;
    v18[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    char v19 = v6;
    [v8 updateUIClientSettingsWithBlock:v18];
    v11 = [[UIStatusBarStyleAnimationParameters alloc] initWithDefaultParameters];
    id v12 = [v5 animationSettings];
    [v12 duration];
    -[UIStatusBarAnimationParameters setDuration:](v11, "setDuration:");

    id v13 = [v5 animationSettings];
    [v13 delay];
    -[UIStatusBarAnimationParameters setDelay:](v11, "setDelay:");

    id v14 = [v5 animationFence];
    +[UIWindow _synchronizeDrawingWithFence:v14];

    id v15 = [(id)UIApp statusBar];
    v16 = v15;
    double v17 = 1.0;
    if (v6) {
      double v17 = 0.0;
    }
    [v15 setForegroundAlpha:v11 animationParameters:v17];
  }
}

- (void)setSceneSettingsStatusBarDiffInspector:(id)a3
{
}

@end