@interface FBSSceneClientSettings(PosterUIFoundation)
- (uint64_t)pui_didFinishInitialization;
- (uint64_t)pui_inExtendedRenderSession;
- (uint64_t)pui_significantEventOptions;
- (uint64_t)pui_significantEventTime;
- (uint64_t)pui_userTapEventsRequested;
@end

@implementation FBSSceneClientSettings(PosterUIFoundation)

- (uint64_t)pui_inExtendedRenderSession
{
  v1 = [a1 otherSettings];
  [v1 flagForSetting:20513];
  uint64_t IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (uint64_t)pui_significantEventOptions
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20515];

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

  uint64_t v7 = [v6 integerValue];
  return v7;
}

- (uint64_t)pui_didFinishInitialization
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:20512];

  return v2;
}

- (uint64_t)pui_significantEventTime
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20514];

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

- (uint64_t)pui_userTapEventsRequested
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:20513];

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