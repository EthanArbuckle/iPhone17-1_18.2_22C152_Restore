@interface FBSSceneClientSettingsDiff(PRScene)
- (uint64_t)pr_depthEffectDisabledDidChange;
- (uint64_t)pr_parallaxEnabledDidChange;
@end

@implementation FBSSceneClientSettingsDiff(PRScene)

- (uint64_t)pr_parallaxEnabledDidChange
{
  return objc_msgSend(a1, "pui_inspect:", 20615);
}

- (uint64_t)pr_depthEffectDisabledDidChange
{
  return objc_msgSend(a1, "pui_inspect:", 20614);
}

@end