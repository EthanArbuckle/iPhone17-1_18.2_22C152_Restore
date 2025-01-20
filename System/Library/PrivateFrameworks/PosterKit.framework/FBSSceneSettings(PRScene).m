@interface FBSSceneSettings(PRScene)
- (double)pr_horizontalTitleBoundingRect;
- (double)pr_verticalTitleBoundingRect;
- (id)pr_caseColor;
- (id)pr_posterAmbientConfiguration;
- (id)pr_posterConfigurableOptions;
- (id)pr_posterConfiguredProperties;
- (id)pr_posterTitleStyleConfiguration;
- (uint64_t)pr_isAlternateDateEnabled;
- (uint64_t)pr_isDepthEffectDisallowed;
- (uint64_t)pr_isParallaxDisallowed;
- (uint64_t)pr_isParallaxEffectivelyEnabled;
- (uint64_t)pr_isParallaxEnabled;
@end

@implementation FBSSceneSettings(PRScene)

- (id)pr_posterConfiguredProperties
{
  v2 = [a1 transientLocalSettings];
  v3 = [v2 objectForSetting:20564];

  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    id v5 = v3;
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
    }
    else
    {
      v6 = 0;
    }
    id v11 = v6;
  }
  else
  {
    id v5 = [a1 otherSettings];
    v7 = [v5 objectForSetting:20564];
    uint64_t v8 = objc_opt_class();
    id v9 = v7;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    id v11 = v10;
  }
  return v11;
}

- (id)pr_caseColor
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20562];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)pr_posterConfigurableOptions
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20563];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)pr_posterTitleStyleConfiguration
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20565];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)pr_posterAmbientConfiguration
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20566];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (uint64_t)pr_isDepthEffectDisallowed
{
  v1 = [a1 otherSettings];
  [v1 flagForSetting:20567];
  uint64_t IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (uint64_t)pr_isParallaxEnabled
{
  v1 = [a1 otherSettings];
  [v1 flagForSetting:20568];
  uint64_t IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (uint64_t)pr_isParallaxDisallowed
{
  v1 = [a1 otherSettings];
  [v1 flagForSetting:20569];
  uint64_t IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (uint64_t)pr_isParallaxEffectivelyEnabled
{
  uint64_t result = objc_msgSend(a1, "pr_isParallaxEnabled");
  if (result) {
    return objc_msgSend(a1, "pr_isParallaxDisallowed") ^ 1;
  }
  return result;
}

- (uint64_t)pr_isAlternateDateEnabled
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20763];

  return v2;
}

- (double)pr_horizontalTitleBoundingRect
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20572];

  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  [v6 CGRectValue];
  double v8 = v7;

  return v8;
}

- (double)pr_verticalTitleBoundingRect
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20573];

  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  [v6 CGRectValue];
  double v8 = v7;

  return v8;
}

@end