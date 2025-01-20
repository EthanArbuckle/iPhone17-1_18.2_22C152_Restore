@interface _UIWindowSceneDisplaySettingsDiffAction
- (UIApplicationSceneSettingsDiffInspector)sceneSettingsDisplayDiffInspector;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)setSceneSettingsDisplayDiffInspector:(id)a3;
@end

@implementation _UIWindowSceneDisplaySettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"_UIWindowSceneDisplaySettingsDiffAction.m", 48, @"Invalid parameter not satisfying: %@", @"[uiScene isKindOfClass:[UIWindowScene class]]" object file lineNumber description];
  }
  id v16 = v13;
  char v28 = 0;
  v17 = [(_UIWindowSceneDisplaySettingsDiffAction *)self sceneSettingsDisplayDiffInspector];
  [v17 inspectDiff:v15 withContext:&v28];

  if (a6)
  {
    char v18 = v28;
  }
  else
  {
    v19 = [v14 uiSettings];
    int v20 = [v19 _containsSetting:39];

    char v18 = v28;
    if (v20)
    {
      char v18 = v28 | 2;
      v28 |= 2u;
    }
  }
  if ((v18 & 3) != 0)
  {
    v21 = [v14 settings];
    v22 = [v21 displayConfiguration];

    v23 = [v22 identity];
    v24 = +[UIScreen _screenWithFBSDisplayIdentity:v23];

    if (v24)
    {
      if ((v28 & 1) != 0 && ([(id)UIApp isFrontBoard] & 1) == 0) {
        [v24 _updateDisplayConfiguration:v22];
      }
      v25 = [v14 uiSettings];
      objc_msgSend(v24, "_setReferenceDisplayModeStatus:", objc_msgSend(v25, "screenReferenceDisplayModeStatus"));
    }
    char v18 = v28;
  }
  if (v18)
  {
    v26 = -[UIScene _renderingEnvironmentSceneComponentRegisteringIfNecessary:](v16, 0);
    -[_UIRenderingEnvironmentSceneComponent _invalidateTraitOverrides]((uint64_t)v26);
  }
}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsDisplayDiffInspector
{
  sceneSettingsDisplayDiffInspector = self->_sceneSettingsDisplayDiffInspector;
  if (!sceneSettingsDisplayDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsDisplayDiffInspector;
    self->_sceneSettingsDisplayDiffInspector = v4;

    [(FBSSceneSettingsDiffInspector *)self->_sceneSettingsDisplayDiffInspector observeDisplayConfigurationWithBlock:&__block_literal_global_91];
    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsDisplayDiffInspector observeScreenReferenceDisplayModeStatus:&__block_literal_global_2_5];
    sceneSettingsDisplayDiffInspector = self->_sceneSettingsDisplayDiffInspector;
  }
  return sceneSettingsDisplayDiffInspector;
}

- (void)setSceneSettingsDisplayDiffInspector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end