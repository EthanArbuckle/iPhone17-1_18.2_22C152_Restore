@interface FBSMutableSceneSettings(PRRenderingScene)
- (void)pr_setAdjustedLuminance:()PRRenderingScene;
- (void)pr_setTitleAlignment:()PRRenderingScene;
- (void)pr_setUnlockProgress:()PRRenderingScene;
- (void)pr_setWakeSourceIsSwipeToUnlock:()PRRenderingScene;
@end

@implementation FBSMutableSceneSettings(PRRenderingScene)

- (void)pr_setUnlockProgress:()PRRenderingScene
{
  id v4 = [a1 otherSettings];
  v3 = [NSNumber numberWithDouble:a2];
  [v4 setObject:v3 forSetting:20664];
}

- (void)pr_setWakeSourceIsSwipeToUnlock:()PRRenderingScene
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20663];
}

- (void)pr_setTitleAlignment:()PRRenderingScene
{
  id v5 = [a1 otherSettings];
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:20662];
}

- (void)pr_setAdjustedLuminance:()PRRenderingScene
{
  id v5 = [a1 otherSettings];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:20665];
}

@end