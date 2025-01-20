@interface FBSMutableSceneClientSettings(PRRenderingScene)
- (id)pr_desiredLegibilitySettings;
- (void)pr_setAverageColor:()PRRenderingScene;
- (void)pr_setContentSize:()PRRenderingScene;
- (void)pr_setDesiredLegibilitySettings:()PRRenderingScene;
- (void)pr_setHandlesWakeAnimation:()PRRenderingScene;
- (void)pr_setHideChrome:()PRRenderingScene;
- (void)pr_setHideDimmingLayer:()PRRenderingScene;
- (void)pr_setPreferredProminentColor:()PRRenderingScene;
@end

@implementation FBSMutableSceneClientSettings(PRRenderingScene)

- (void)pr_setPreferredProminentColor:()PRRenderingScene
{
  id v4 = a3;
  id v5 = [a1 otherSettings];
  [v5 setObject:v4 forSetting:20719];
}

- (void)pr_setAverageColor:()PRRenderingScene
{
  id v4 = a3;
  id v5 = [a1 otherSettings];
  [v5 setObject:v4 forSetting:20714];
}

- (id)pr_desiredLegibilitySettings
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20717];

  return v2;
}

- (void)pr_setDesiredLegibilitySettings:()PRRenderingScene
{
  id v4 = a3;
  id v5 = [a1 otherSettings];
  [v5 setObject:v4 forSetting:20717];
}

- (void)pr_setHandlesWakeAnimation:()PRRenderingScene
{
  id v5 = [a1 otherSettings];
  id v4 = [NSNumber numberWithBool:a3];
  [v5 setObject:v4 forSetting:20713];
}

- (void)pr_setContentSize:()PRRenderingScene
{
  if (a2 == *MEMORY[0x1E4F1DB30] && a3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    id v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGSize:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = [a1 otherSettings];
  [v5 setObject:v6 forSetting:20715];
}

- (void)pr_setHideChrome:()PRRenderingScene
{
  id v5 = [a1 otherSettings];
  id v4 = [NSNumber numberWithBool:a3];
  [v5 setObject:v4 forSetting:20716];
}

- (void)pr_setHideDimmingLayer:()PRRenderingScene
{
  id v5 = [a1 otherSettings];
  id v4 = [NSNumber numberWithBool:a3];
  [v5 setObject:v4 forSetting:20718];
}

@end