@interface FBSMutableSceneClientSettings(PosterUIFoundation)
- (void)pui_setDidFinishInitialization:()PosterUIFoundation;
- (void)pui_setInExtendedRenderSession:()PosterUIFoundation;
- (void)pui_setSignificantEventOptions:()PosterUIFoundation;
- (void)pui_setSignificantEventTime:()PosterUIFoundation;
- (void)pui_setUserTapEventsRequested:()PosterUIFoundation;
@end

@implementation FBSMutableSceneClientSettings(PosterUIFoundation)

- (void)pui_setDidFinishInitialization:()PosterUIFoundation
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20512];
}

- (void)pui_setInExtendedRenderSession:()PosterUIFoundation
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20513];
}

- (void)pui_setSignificantEventTime:()PosterUIFoundation
{
  id v5 = [a1 otherSettings];
  v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [v5 setObject:v4 forSetting:20514];
}

- (void)pui_setSignificantEventOptions:()PosterUIFoundation
{
  id v5 = [a1 otherSettings];
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:20515];
}

- (void)pui_setUserTapEventsRequested:()PosterUIFoundation
{
  id v5 = [a1 otherSettings];
  v4 = [NSNumber numberWithBool:a3];
  [v5 setObject:v4 forSetting:20513];
}

@end