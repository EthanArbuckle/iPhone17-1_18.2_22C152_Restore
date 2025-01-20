@interface _UIWindowSceneAccessibilityContrastSettingsDiffAction
- (UIApplicationSceneSettingsDiffInspector)sceneSettingsAccessibilityContrastDiffInspector;
- (void)_animateAccessibilityContrastChangeInScene:(id)a3 transitionContext:(id)a4 applyChangesBlock:(id)a5;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)setSceneSettingsAccessibilityContrastDiffInspector:(id)a3;
@end

@implementation _UIWindowSceneAccessibilityContrastSettingsDiffAction

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsAccessibilityContrastDiffInspector
{
  sceneSettingsAccessibilityContrastDiffInspector = self->_sceneSettingsAccessibilityContrastDiffInspector;
  if (!sceneSettingsAccessibilityContrastDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsAccessibilityContrastDiffInspector;
    self->_sceneSettingsAccessibilityContrastDiffInspector = v4;

    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsAccessibilityContrastDiffInspector observeAccessibilityContrastWithBlock:&__block_literal_global_127];
    sceneSettingsAccessibilityContrastDiffInspector = self->_sceneSettingsAccessibilityContrastDiffInspector;
  }
  return sceneSettingsAccessibilityContrastDiffInspector;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && ([v12 conformsToProtocol:&unk_1ED4B12C8] & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_UIWindowSceneAccessibilityContrastSettingsDiffAction.m", 49, @"Invalid parameter not satisfying: %@", @"[uiScene isKindOfClass:[UIWindowScene class]] || [uiScene conformsToProtocol:@protocol(_UISceneUIWindowHosting)]" object file lineNumber description];
  }
  char v20 = 0;
  v15 = [(_UIWindowSceneAccessibilityContrastSettingsDiffAction *)self sceneSettingsAccessibilityContrastDiffInspector];
  [v15 inspectDiff:v14 withContext:&v20];

  if (v20)
  {
    v16 = [v13 animationFence];
    [v12 _synchronizeDrawingWithFence:v16];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __167___UIWindowSceneAccessibilityContrastSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke;
    v18[3] = &unk_1E52D9F70;
    id v19 = v12;
    [(_UIWindowSceneAccessibilityContrastSettingsDiffAction *)self _animateAccessibilityContrastChangeInScene:v19 transitionContext:v13 applyChangesBlock:v18];
  }
}

- (void)_animateAccessibilityContrastChangeInScene:(id)a3 transitionContext:(id)a4 applyChangesBlock:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(void))a5;
  v9 = [a4 animationSettings];
  if (v9 && ([(id)UIApp _isSpringBoard] & 1) == 0)
  {
    v10 = [[_UIWindowSceneAccessibilityContrastAnimationSnapshotWindow alloc] initWithWindowScene:v7];
    [(UIWindow *)v10 setWindowLevel:15000001.0];
    [(UIView *)v10 bounds];
    v15 = _UISnapshotScreenAtViewRectAfterCommit(v10, 0, v11, v12, v13, v14);
    [(UIView *)v10 addSubview:v15];
    [(UIWindow *)v10 setHidden:0];
    v8[2](v8);
    v16 = (void *)MEMORY[0x1E4F4F680];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __136___UIWindowSceneAccessibilityContrastSettingsDiffAction__animateAccessibilityContrastChangeInScene_transitionContext_applyChangesBlock___block_invoke;
    v20[3] = &unk_1E52DC3A0;
    v21 = v10;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __136___UIWindowSceneAccessibilityContrastSettingsDiffAction__animateAccessibilityContrastChangeInScene_transitionContext_applyChangesBlock___block_invoke_2;
    v18[3] = &unk_1E52DC3A0;
    id v19 = v21;
    v17 = v21;
    [v16 tryAnimatingWithSettings:v9 actions:v20 completion:v18];
  }
  else
  {
    v8[2](v8);
  }
}

- (void)setSceneSettingsAccessibilityContrastDiffInspector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end