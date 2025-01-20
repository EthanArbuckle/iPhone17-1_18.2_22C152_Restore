@interface FBSSceneClientSettings(PRRenderingScene)
- (double)pr_contentSize;
- (id)pr_averageColor;
- (id)pr_desiredLegibilitySettings;
- (id)pr_preferredProminentColor;
- (uint64_t)pr_handlesWakeAnimation;
- (uint64_t)pr_hideChrome;
- (uint64_t)pr_hideDimmingLayer;
@end

@implementation FBSSceneClientSettings(PRRenderingScene)

- (id)pr_preferredProminentColor
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20719];

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

- (id)pr_averageColor
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20714];

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

- (id)pr_desiredLegibilitySettings
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20717];

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

- (uint64_t)pr_handlesWakeAnimation
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20713];

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

  uint64_t v7 = [v6 BOOLValue];
  return v7;
}

- (double)pr_contentSize
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20715];
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

  if (v6)
  {
    objc_msgSend(v6, "bs_CGSizeValue");
    double v8 = v7;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB30];
  }

  return v8;
}

- (uint64_t)pr_hideChrome
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20716];

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

  uint64_t v7 = [v6 BOOLValue];
  return v7;
}

- (uint64_t)pr_hideDimmingLayer
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20718];

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

  uint64_t v7 = [v6 BOOLValue];
  return v7;
}

@end