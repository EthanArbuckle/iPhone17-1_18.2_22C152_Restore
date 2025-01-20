@interface FBSSceneClientSettings(PRScene)
- (id)pr_statusBarTintColor;
- (id)pr_timeDescriptor;
- (id)pr_vibrancyConfiguration;
- (uint64_t)pr_isDepthEffectDisabled;
- (uint64_t)pr_isParallaxEnabled;
@end

@implementation FBSSceneClientSettings(PRScene)

- (id)pr_timeDescriptor
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20612];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)pr_statusBarTintColor
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20613];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (uint64_t)pr_isDepthEffectDisabled
{
  v1 = [a1 otherSettings];
  [v1 flagForSetting:20614];
  uint64_t IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (uint64_t)pr_isParallaxEnabled
{
  v1 = [a1 otherSettings];
  [v1 flagForSetting:20615];
  uint64_t IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (id)pr_vibrancyConfiguration
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20616];

  return v2;
}

@end