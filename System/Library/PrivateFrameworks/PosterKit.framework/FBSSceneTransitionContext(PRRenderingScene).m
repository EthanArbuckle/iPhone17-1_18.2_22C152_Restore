@interface FBSSceneTransitionContext(PRRenderingScene)
- (BOOL)pr_finishUnlockingWithParameters:()PRRenderingScene;
- (double)pr_finishUnlockParameters;
- (uint64_t)pr_updateSnapshot;
- (void)pr_setFinishUnlockParameters:()PRRenderingScene;
- (void)pr_setUpdateSnapshot:()PRRenderingScene;
@end

@implementation FBSSceneTransitionContext(PRRenderingScene)

- (uint64_t)pr_updateSnapshot
{
  v1 = [a1 otherSettings];
  [v1 flagForSetting:20563];
  uint64_t IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (void)pr_setUpdateSnapshot:()PRRenderingScene
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagIfYes() forSetting:20563];
}

- (BOOL)pr_finishUnlockingWithParameters:()PRRenderingScene
{
  v4 = [a1 otherSettings];
  v5 = [v4 objectForSetting:20564];

  if (a3 && v5)
  {
    objc_msgSend(v5, "bs_CGSizeValue");
    *a3 = v6;
    a3[1] = v7;
  }

  return v5 != 0;
}

- (double)pr_finishUnlockParameters
{
  id v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:20564];

  if (v2)
  {
    objc_msgSend(v2, "bs_CGSizeValue");
    double v4 = v3;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB30];
  }

  return v4;
}

- (void)pr_setFinishUnlockParameters:()PRRenderingScene
{
  v5 = [a1 otherSettings];
  *(double *)uint64_t v7 = a2;
  *(double *)&v7[1] = a3;
  uint64_t v6 = [MEMORY[0x1E4F29238] valueWithBytes:v7 objCType:"{CGSize=dd}"];
  [v5 setObject:v6 forSetting:20564];
}

@end