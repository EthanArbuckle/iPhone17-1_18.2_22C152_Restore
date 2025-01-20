@interface FBSSceneTransitionContext(PosterUIFoundation)
- (uint64_t)pui_deviceOrientation;
- (uint64_t)pui_significantEvent;
- (void)pui_setDeviceOrientation:()PosterUIFoundation;
- (void)pui_setSignificantEvent:()PosterUIFoundation;
@end

@implementation FBSSceneTransitionContext(PosterUIFoundation)

- (uint64_t)pui_significantEvent
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20512];

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

- (void)pui_setSignificantEvent:()PosterUIFoundation
{
  id v5 = [a1 otherSettings];
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:20512];
}

- (uint64_t)pui_deviceOrientation
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20513];
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
    uint64_t v7 = [v6 integerValue];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)pui_setDeviceOrientation:()PosterUIFoundation
{
  id v5 = [a1 otherSettings];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:20513];
}

@end