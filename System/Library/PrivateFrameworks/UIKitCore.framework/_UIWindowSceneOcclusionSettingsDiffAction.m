@interface _UIWindowSceneOcclusionSettingsDiffAction
- (UIApplicationSceneSettingsDiffInspector)sceneSettingsBackgroundAndOcclusionDiffInspector;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)setSceneSettingsBackgroundAndOcclusionDiffInspector:(id)a3;
@end

@implementation _UIWindowSceneOcclusionSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  v28[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"_UIWindowSceneOcclusionSettingsDiffAction.m", 44, @"Invalid parameter not satisfying: %@", @"[uiScene isKindOfClass:[UIWindowScene class]]" object file lineNumber description];
  }
  char v26 = 0;
  v15 = [(_UIWindowSceneOcclusionSettingsDiffAction *)self sceneSettingsBackgroundAndOcclusionDiffInspector];
  [v15 inspectDiff:v14 withContext:&v26];

  if ((v26 & 3) != 0)
  {
    v16 = [v13 settings];
    v28[0] = v13;
    v27[0] = @"scene";
    v27[1] = @"isOccluded";
    v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "isOccluded"));
    v28[1] = v17;
    v27[2] = @"isBackgrounded";
    v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v16, "isForeground") ^ 1);
    v28[2] = v18;
    v27[3] = @"isCarDisplay";
    v19 = NSNumber;
    v20 = [v13 settings];
    v21 = [v20 displayConfiguration];
    v22 = objc_msgSend(v19, "numberWithBool:", objc_msgSend(v21, "isCarDisplay"));
    v28[3] = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];

    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 postNotificationName:@"UIApplicationSceneOcclusionChangedNotification" object:self userInfo:v23];
  }
}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsBackgroundAndOcclusionDiffInspector
{
  sceneSettingsBackgroundAndOcclusionDiffInspector = self->_sceneSettingsBackgroundAndOcclusionDiffInspector;
  if (!sceneSettingsBackgroundAndOcclusionDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsBackgroundAndOcclusionDiffInspector;
    self->_sceneSettingsBackgroundAndOcclusionDiffInspector = v4;

    [(FBSSceneSettingsDiffInspector *)self->_sceneSettingsBackgroundAndOcclusionDiffInspector observeOcclusionsWithBlock:&__block_literal_global_94];
    [(FBSSceneSettingsDiffInspector *)self->_sceneSettingsBackgroundAndOcclusionDiffInspector observeIsForegroundWithBlock:&__block_literal_global_2_7];
    sceneSettingsBackgroundAndOcclusionDiffInspector = self->_sceneSettingsBackgroundAndOcclusionDiffInspector;
  }
  return sceneSettingsBackgroundAndOcclusionDiffInspector;
}

- (void)setSceneSettingsBackgroundAndOcclusionDiffInspector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end