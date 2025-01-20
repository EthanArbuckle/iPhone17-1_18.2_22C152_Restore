@interface FBSSceneClientSettings(PREditingScene)
- (uint64_t)pr_areContentsCoveredByModalPresentation;
- (uint64_t)pr_isEditingFocusActive;
@end

@implementation FBSSceneClientSettings(PREditingScene)

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

@end