@interface _UIWindowSceneDeviceOrientationSettingsDiffAction
- (FBSSceneSettingsDiffInspector)sceneSettingsDeviceOrientationDiffInspector;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)_updateDeviceOrientationWithSettingObserverContext:(id)a3 windowScene:(id)a4 transitionContext:(id)a5;
@end

@implementation _UIWindowSceneDeviceOrientationSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_UIWindowSceneDeviceOrientationSettingsDiffAction.m", 37, @"Invalid parameter not satisfying: %@", @"[uiScene isKindOfClass:[UIWindowScene class]]" object file lineNumber description];
  }
  unsigned __int8 v18 = 0;
  id v15 = v12;
  v16 = [(_UIWindowSceneDeviceOrientationSettingsDiffAction *)self sceneSettingsDeviceOrientationDiffInspector];
  [v16 inspectDiff:v14 withContext:&v18];

  [(_UIWindowSceneDeviceOrientationSettingsDiffAction *)self _updateDeviceOrientationWithSettingObserverContext:v18 windowScene:v15 transitionContext:v13];
}

- (FBSSceneSettingsDiffInspector)sceneSettingsDeviceOrientationDiffInspector
{
  sceneSettingsDeviceOrientationDiffInspector = self->_sceneSettingsDeviceOrientationDiffInspector;
  if (!sceneSettingsDeviceOrientationDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsDeviceOrientationDiffInspector;
    self->_sceneSettingsDeviceOrientationDiffInspector = v4;

    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsDeviceOrientationDiffInspector observeDeviceOrientationWithBlock:&__block_literal_global_87];
    sceneSettingsDeviceOrientationDiffInspector = self->_sceneSettingsDeviceOrientationDiffInspector;
  }
  return (FBSSceneSettingsDiffInspector *)sceneSettingsDeviceOrientationDiffInspector;
}

- (void)_updateDeviceOrientationWithSettingObserverContext:(id)a3 windowScene:(id)a4 transitionContext:(id)a5
{
  char v6 = (char)a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = a5;
    v9 = [v7 _settingsScene];
    v10 = [v9 _FBSScene];

    v11 = [v10 uiSettings];
    uint64_t v12 = [v11 deviceOrientation];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __134___UIWindowSceneDeviceOrientationSettingsDiffAction__updateDeviceOrientationWithSettingObserverContext_windowScene_transitionContext___block_invoke;
    v13[3] = &unk_1E52E0000;
    id v14 = v7;
    uint64_t v15 = v12;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v8, v13, 0);
  }
}

- (void).cxx_destruct
{
}

@end