@interface FBSSceneSettingsDiff(PRScene)
- (uint64_t)pr_posterPropertiesDidChange;
@end

@implementation FBSSceneSettingsDiff(PRScene)

- (uint64_t)pr_posterPropertiesDidChange
{
  return objc_msgSend(a1, "pui_inspect:", 20564);
}

@end