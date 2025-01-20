@interface _UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction
- (UIApplicationSceneSettingsDiffInspector)sceneSettingsApplicationLifecycleEventDiffInspector;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)setSceneSettingsApplicationLifecycleEventDiffInspector:(id)a3;
@end

@implementation _UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  v16 = (char *)a5;
  id v17 = a6;
  id v18 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && ([v14 conformsToProtocol:&unk_1ED4B12C8] & 1) == 0)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"_UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction.m", 48, @"Invalid parameter not satisfying: %@", @"[uiScene isKindOfClass:[UIWindowScene class]] || [uiScene conformsToProtocol:@protocol(_UISceneUIWindowHosting)]" object file lineNumber description];
  }
  char v37 = 0;
  v19 = [(_UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction *)self sceneSettingsApplicationLifecycleEventDiffInspector];
  [v19 inspectDiff:v16 withContext:&v37];

  if ([v14 _hasLifecycle])
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __186___UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke;
    v33[3] = &unk_1E52DAF68;
    id v34 = v14;
    id v35 = v17;
    id v36 = v18;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v36, v33, 0);
  }
  char v20 = v37;
  if (v37)
  {
    [(id)UIApp _updateIdleModeStatus];
    char v20 = v37;
  }
  if ((v20 & 2) != 0)
  {
    v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIAlertControllerStackManager", &_performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType____s_category)+ 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v16;
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "canShowAlerts Updated: %@", buf, 0xCu);
    }
    v22 = [v15 uiSettings];
    char v23 = [v22 canShowAlerts];
    id v24 = v14;
    if (NSClassFromString(&cfstr_Uiwindowscene.isa))
    {
      if (objc_opt_isKindOfClass()) {
        v25 = v24;
      }
      else {
        v25 = 0;
      }
    }
    else
    {
      v25 = 0;
    }
    id v26 = v25;
    v27 = v26;
    if (!v24 || v26)
    {

      if (!v27)
      {
LABEL_24:

        goto LABEL_25;
      }
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __186___UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_100;
      v30[3] = &unk_1E52E0478;
      id v31 = v27;
      char v32 = v23;
      _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v18, v30, 0);
      id v24 = v31;
    }
    else
    {
      v28 = BSLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v39 = "uiScene";
        __int16 v40 = 2082;
        v41 = "UIWindowScene";
        _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_DEFAULT, "BSSafeCast: \"%{public}s\" was not of expected class \"%{public}s\"", buf, 0x16u);
      }
    }
    goto LABEL_24;
  }
LABEL_25:
}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsApplicationLifecycleEventDiffInspector
{
  sceneSettingsApplicationLifecycleEventDiffInspector = self->_sceneSettingsApplicationLifecycleEventDiffInspector;
  if (!sceneSettingsApplicationLifecycleEventDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsApplicationLifecycleEventDiffInspector;
    self->_sceneSettingsApplicationLifecycleEventDiffInspector = v4;

    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsApplicationLifecycleEventDiffInspector observeIdleModeEnabledWithBlock:&__block_literal_global_93];
    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsApplicationLifecycleEventDiffInspector observeCanShowAlertsWithBlock:&__block_literal_global_2_6];
    sceneSettingsApplicationLifecycleEventDiffInspector = self->_sceneSettingsApplicationLifecycleEventDiffInspector;
  }
  return sceneSettingsApplicationLifecycleEventDiffInspector;
}

- (void)setSceneSettingsApplicationLifecycleEventDiffInspector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end