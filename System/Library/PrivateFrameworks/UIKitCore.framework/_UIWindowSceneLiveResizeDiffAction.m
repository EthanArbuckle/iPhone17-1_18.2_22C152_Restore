@interface _UIWindowSceneLiveResizeDiffAction
- (UIApplicationSceneSettingsDiffInspector)sceneSettingsLiveResizeDiffInspector;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)setSceneSettingsLiveResizeDiffInspector:(id)a3;
@end

@implementation _UIWindowSceneLiveResizeDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v11 = a3;
  id v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UIWindowSceneLiveResizeDiffAction.m", 37, @"Invalid parameter not satisfying: %@", @"[uiScene isKindOfClass:[UIWindowScene class]]" object file lineNumber description];
  }
  id v13 = v11;
  char v16 = 0;
  v14 = [(_UIWindowSceneLiveResizeDiffAction *)self sceneSettingsLiveResizeDiffInspector];
  [v14 inspectDiff:v12 withContext:&v16];

  if (v16) {
    -[UIWindowScene _inLiveResizeDidChange](v13);
  }
}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsLiveResizeDiffInspector
{
  sceneSettingsLiveResizeDiffInspector = self->_sceneSettingsLiveResizeDiffInspector;
  if (!sceneSettingsLiveResizeDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsLiveResizeDiffInspector;
    self->_sceneSettingsLiveResizeDiffInspector = v4;

    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsLiveResizeDiffInspector observeInLiveResizeWithBlock:&__block_literal_global_576];
    sceneSettingsLiveResizeDiffInspector = self->_sceneSettingsLiveResizeDiffInspector;
  }
  return sceneSettingsLiveResizeDiffInspector;
}

- (void)setSceneSettingsLiveResizeDiffInspector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end