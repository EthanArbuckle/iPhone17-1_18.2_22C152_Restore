@interface _UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction
- (id)sceneSettingsSafeAreaInsetsDiffInspector;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)_updateSafeAreaInsetsWithSettingsObserverContext:(id)a3 windowHostingScene:(id)a4 transitionContext:(id)a5;
@end

@implementation _UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a5;
  if (([v12 _hostsWindows] & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction.m", 60, @"Invalid parameter not satisfying: %@", @"[uiScene _hostsWindows]" object file lineNumber description];
  }
  unsigned int v18 = 0;
  id v15 = v12;
  v16 = [(_UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction *)self sceneSettingsSafeAreaInsetsDiffInspector];
  [v16 inspectDiff:v14 withContext:&v18];

  [(_UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction *)self _updateSafeAreaInsetsWithSettingsObserverContext:v18 windowHostingScene:v15 transitionContext:v13];
}

- (id)sceneSettingsSafeAreaInsetsDiffInspector
{
  sceneSettingsSafeAreaInsetsDiffInspector = self->_sceneSettingsSafeAreaInsetsDiffInspector;
  if (!sceneSettingsSafeAreaInsetsDiffInspector)
  {
    v4 = objc_alloc_init(UIApplicationSceneSettingsDiffInspector);
    v5 = self->_sceneSettingsSafeAreaInsetsDiffInspector;
    self->_sceneSettingsSafeAreaInsetsDiffInspector = v4;

    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsSafeAreaInsetsDiffInspector observeSafeAreaInsetsPortraitWithBlock:&__block_literal_global_89];
    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsSafeAreaInsetsDiffInspector observeSafeAreaInsetsLandscapeLeftWithBlock:&__block_literal_global_2_4];
    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsSafeAreaInsetsDiffInspector observeSafeAreaInsetsPortraitUpsideDownWithBlock:&__block_literal_global_4_2];
    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsSafeAreaInsetsDiffInspector observeSafeAreaInsetsLandscapeRightWithBlock:&__block_literal_global_6_3];
    sceneSettingsSafeAreaInsetsDiffInspector = self->_sceneSettingsSafeAreaInsetsDiffInspector;
  }
  return sceneSettingsSafeAreaInsetsDiffInspector;
}

- (void)_updateSafeAreaInsetsWithSettingsObserverContext:(id)a3 windowHostingScene:(id)a4 transitionContext:(id)a5
{
  if (a3.var0)
  {
    uint64_t v13 = v5;
    uint64_t v14 = v6;
    id v8 = a5;
    v9 = [a4 _allWindows];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __143___UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction__updateSafeAreaInsetsWithSettingsObserverContext_windowHostingScene_transitionContext___block_invoke;
    v11[3] = &unk_1E52DC3A0;
    id v12 = v9;
    id v10 = v9;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v8, v11, 0);
  }
}

- (void).cxx_destruct
{
}

@end