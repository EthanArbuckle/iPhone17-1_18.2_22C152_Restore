@interface _UIWindowSceneUserInterfaceStyleSettingsDiffAction
- (UIApplicationSceneSettingsDiffInspector)sceneSettingsUserInterfaceStyleDiffInspector;
- (void)_animateUserInterfaceStyleChangeInScene:(id)a3 transitionContext:(id)a4 applyChangesBlock:(id)a5;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)setSceneSettingsUserInterfaceStyleDiffInspector:(id)a3;
@end

@implementation _UIWindowSceneUserInterfaceStyleSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && ([v13 conformsToProtocol:&unk_1ED4B12C8] & 1) == 0)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"_UIWindowSceneUserInterfaceStyleSettingsDiffAction.m", 51, @"Invalid parameter not satisfying: %@", @"[uiScene isKindOfClass:[UIWindowScene class]] || [uiScene conformsToProtocol:@protocol(_UISceneUIWindowHosting)]" object file lineNumber description];
  }
  char v32 = 0;
  v17 = [(_UIWindowSceneUserInterfaceStyleSettingsDiffAction *)self sceneSettingsUserInterfaceStyleDiffInspector];
  [v17 inspectDiff:v16 withContext:&v32];

  if (v32)
  {
    v18 = [v15 animationFence];
    [v13 _synchronizeDrawingWithFence:v18];

    v19 = [v14 uiSettings];
    uint64_t v20 = [v19 userInterfaceStyle];
    v21 = *(id *)(__UILogGetCategoryCachedImpl("InterfaceStyle", &_performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType____s_category_0)+ 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v13;
      if (v22)
      {
        v23 = NSString;
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        v26 = [v23 stringWithFormat:@"<%@: %p>", v25, v22];
      }
      else
      {
        v26 = @"(nil)";
      }

      v27 = v26;
      v28 = [v22 _persistenceIdentifier];
      *(_DWORD *)buf = 134349570;
      uint64_t v34 = v20;
      __int16 v35 = 2114;
      v36 = v26;
      __int16 v37 = 2114;
      v38 = v28;
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "Scene did update interface style to %{public}ld, %{public}@ (%{public}@)", buf, 0x20u);
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __164___UIWindowSceneUserInterfaceStyleSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke;
    v30[3] = &unk_1E52D9F70;
    id v31 = v13;
    [(_UIWindowSceneUserInterfaceStyleSettingsDiffAction *)self _animateUserInterfaceStyleChangeInScene:v31 transitionContext:v15 applyChangesBlock:v30];
  }
}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsUserInterfaceStyleDiffInspector
{
  sceneSettingsUserInterfaceStyleDiffInspector = self->_sceneSettingsUserInterfaceStyleDiffInspector;
  if (!sceneSettingsUserInterfaceStyleDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsUserInterfaceStyleDiffInspector;
    self->_sceneSettingsUserInterfaceStyleDiffInspector = v4;

    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsUserInterfaceStyleDiffInspector observeUserInterfaceStyleWithBlock:&__block_literal_global_446];
    sceneSettingsUserInterfaceStyleDiffInspector = self->_sceneSettingsUserInterfaceStyleDiffInspector;
  }
  return sceneSettingsUserInterfaceStyleDiffInspector;
}

- (void)_animateUserInterfaceStyleChangeInScene:(id)a3 transitionContext:(id)a4 applyChangesBlock:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(void))a5;
  v9 = [a4 animationSettings];
  if (!v9 || ([(id)UIApp _isSpringBoard] & 1) != 0 || (_UIApplicationProcessIsDruid() & 1) != 0)
  {
    v8[2](v8);
  }
  else
  {
    v10 = [[_UIWindowSceneUserInterfaceStyleAnimationSnapshotWindow alloc] initWithWindowScene:v7];
    [(UIWindow *)v10 setWindowLevel:15000001.0];
    [(UIView *)v10 bounds];
    id v15 = _UISnapshotScreenAtViewRectAfterCommit(v10, 0, v11, v12, v13, v14);
    [(UIView *)v10 addSubview:v15];
    [(UIWindow *)v10 setHidden:0];
    v8[2](v8);
    id v16 = (void *)MEMORY[0x1E4F4F680];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __130___UIWindowSceneUserInterfaceStyleSettingsDiffAction__animateUserInterfaceStyleChangeInScene_transitionContext_applyChangesBlock___block_invoke;
    v20[3] = &unk_1E52DC3A0;
    v21 = v10;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __130___UIWindowSceneUserInterfaceStyleSettingsDiffAction__animateUserInterfaceStyleChangeInScene_transitionContext_applyChangesBlock___block_invoke_2;
    v18[3] = &unk_1E52DC3A0;
    v19 = v21;
    v17 = v21;
    [v16 tryAnimatingWithSettings:v9 actions:v20 completion:v18];
  }
}

- (void)setSceneSettingsUserInterfaceStyleDiffInspector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end