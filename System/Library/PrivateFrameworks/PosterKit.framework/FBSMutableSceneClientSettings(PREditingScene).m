@interface FBSMutableSceneClientSettings(PREditingScene)
- (uint64_t)pr_areContentsCoveredByModalPresentation;
- (uint64_t)pr_isEditingFocusActive;
- (void)pr_setContentsCoveredByModalPresentation:()PREditingScene;
- (void)pr_setEditingFocusActive:()PREditingScene;
@end

@implementation FBSMutableSceneClientSettings(PREditingScene)

- (uint64_t)pr_isEditingFocusActive
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20812];

  return v2;
}

- (uint64_t)pr_areContentsCoveredByModalPresentation
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20813];

  return v2;
}

- (void)pr_setEditingFocusActive:()PREditingScene
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20812];
}

- (void)pr_setContentsCoveredByModalPresentation:()PREditingScene
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20813];
}

@end