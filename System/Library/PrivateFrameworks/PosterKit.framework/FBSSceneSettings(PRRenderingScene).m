@interface FBSSceneSettings(PRRenderingScene)
- (double)pr_unlockProgress;
- (uint64_t)pr_adjustedLuminance;
- (uint64_t)pr_titleAlignment;
- (uint64_t)pr_wakeSourceIsSwipeToUnlock;
@end

@implementation FBSSceneSettings(PRRenderingScene)

- (uint64_t)pr_adjustedLuminance
{
  v2 = [a1 otherSettings];
  v3 = [v2 objectForSetting:20665];
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
  id v7 = v6;

  if (v7)
  {
    uint64_t v8 = [v7 integerValue];
  }
  else
  {
    v9 = objc_msgSend(a1, "bls_visualState");
    v10 = v9;
    if (v9) {
      uint64_t v8 = [v9 adjustedLuminance];
    }
    else {
      uint64_t v8 = 2;
    }
  }
  return v8;
}

- (double)pr_unlockProgress
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20664];
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

  if (v6)
  {
    [v6 floatValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (uint64_t)pr_wakeSourceIsSwipeToUnlock
{
  v1 = [a1 otherSettings];
  [v1 flagForSetting:20663];
  uint64_t IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (uint64_t)pr_titleAlignment
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20662];
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

  if (v6) {
    uint64_t v7 = [v6 unsignedIntegerValue];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

@end