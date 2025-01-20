@interface PBUIWallpaperWindowSceneTwoCurveTransitionContext
- (BSAnimationSettings)inAnimationSettings;
- (BSAnimationSettings)outAnimationSettings;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (void)setInAnimationSettings:(id)a3;
- (void)setOutAnimationSettings:(id)a3;
@end

@implementation PBUIWallpaperWindowSceneTwoCurveTransitionContext

- (BSAnimationSettings)inAnimationSettings
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3263779365];

  return (BSAnimationSettings *)v3;
}

- (void)setInAnimationSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:3263779365];
}

- (BSAnimationSettings)outAnimationSettings
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3263779366];

  return (BSAnimationSettings *)v3;
}

- (void)setOutAnimationSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:3263779366];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 3263779365)
  {
    id v5 = @"inAnimationSettings";
  }
  else if (a3 == 3263779366)
  {
    id v5 = @"outAnimationSettings";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)PBUIWallpaperWindowSceneTwoCurveTransitionContext;
    -[FBSSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end