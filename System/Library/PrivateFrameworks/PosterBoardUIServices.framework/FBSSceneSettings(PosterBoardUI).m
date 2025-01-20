@interface FBSSceneSettings(PosterBoardUI)
- (double)pruis_leadingTopButtonFrame;
- (double)pruis_trailingTopButtonFrame;
- (id)pruis_lockVibrancyConfiguration;
- (uint64_t)pruis_isLockPosterComplicationRowHidden;
- (uint64_t)pruis_isLockPosterFloatingLayerInlined;
- (uint64_t)pruis_lockPosterLiveContentLayerContextID;
- (uint64_t)pruis_lockPosterLiveContentLayerRenderID;
- (uint64_t)pruis_lockPosterLiveFloatingLayerContextID;
- (uint64_t)pruis_lockPosterLiveFloatingLayerRenderID;
- (uint64_t)pruis_lockPosterOverlayLayerContextID;
- (uint64_t)pruis_lockPosterOverlayLayerRenderID;
- (uint64_t)pruis_preferredSwitcherLayoutMode;
@end

@implementation FBSSceneSettings(PosterBoardUI)

- (uint64_t)pruis_preferredSwitcherLayoutMode
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:25562];

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

  uint64_t v7 = [v6 unsignedIntegerValue];
  return v7;
}

- (uint64_t)pruis_lockPosterOverlayLayerRenderID
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:25563];

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

  uint64_t v7 = [v6 unsignedLongLongValue];
  return v7;
}

- (uint64_t)pruis_lockPosterOverlayLayerContextID
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:25564];

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

  uint64_t v7 = [v6 unsignedLongLongValue];
  return v7;
}

- (uint64_t)pruis_lockPosterLiveContentLayerRenderID
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:25565];

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

  uint64_t v7 = [v6 unsignedLongLongValue];
  return v7;
}

- (uint64_t)pruis_lockPosterLiveContentLayerContextID
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:25566];

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

  uint64_t v7 = [v6 unsignedLongLongValue];
  return v7;
}

- (uint64_t)pruis_isLockPosterFloatingLayerInlined
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:25569];

  return v2;
}

- (uint64_t)pruis_lockPosterLiveFloatingLayerRenderID
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:25567];

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

  uint64_t v7 = [v6 unsignedLongLongValue];
  return v7;
}

- (uint64_t)pruis_lockPosterLiveFloatingLayerContextID
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:25568];

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

  uint64_t v7 = [v6 unsignedLongLongValue];
  return v7;
}

- (uint64_t)pruis_isLockPosterComplicationRowHidden
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:25570];

  return v2;
}

- (double)pruis_leadingTopButtonFrame
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:25571];

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

  [v6 CGRectValue];
  double v8 = v7;

  return v8;
}

- (double)pruis_trailingTopButtonFrame
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:25572];

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

  [v6 CGRectValue];
  double v8 = v7;

  return v8;
}

- (id)pruis_lockVibrancyConfiguration
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:25573];

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

@end