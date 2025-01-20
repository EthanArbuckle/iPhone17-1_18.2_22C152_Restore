@interface _UIScenePointerLockDiffAction
- (UIApplicationSceneSettingsDiffInspector)sceneSettingsPointerLockedDiffInspector;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)setSceneSettingsPointerLockedDiffInspector:(id)a3;
@end

@implementation _UIScenePointerLockDiffAction

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsPointerLockedDiffInspector
{
  sceneSettingsPointerLockedDiffInspector = self->_sceneSettingsPointerLockedDiffInspector;
  if (!sceneSettingsPointerLockedDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsPointerLockedDiffInspector;
    self->_sceneSettingsPointerLockedDiffInspector = v4;

    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsPointerLockedDiffInspector observePointerLockStatusWithBlock:&__block_literal_global_595];
    sceneSettingsPointerLockedDiffInspector = self->_sceneSettingsPointerLockedDiffInspector;
  }
  return sceneSettingsPointerLockedDiffInspector;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v11 = a3;
  id v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && ([v11 conformsToProtocol:&unk_1ED4B12C8] & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UIScenePointerLockDiffAction.m", 42, @"Invalid parameter not satisfying: %@", @"[uiScene isKindOfClass:[UIWindowScene class]] || [uiScene conformsToProtocol:@protocol(_UISceneUIWindowHosting)]" object file lineNumber description];
  }
  char v16 = 0;
  v13 = [(_UIScenePointerLockDiffAction *)self sceneSettingsPointerLockedDiffInspector];
  [v13 inspectDiff:v12 withContext:&v16];

  if (v16)
  {
    v14 = [v11 pointerLockState];
    [v14 _pointerLockStatusUpdated];
  }
}

- (void)setSceneSettingsPointerLockedDiffInspector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end