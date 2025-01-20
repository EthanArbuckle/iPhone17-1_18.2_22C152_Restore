@interface SBSUIInCallSceneClientSettings
- (BOOL)homeIndicatorAutoHidden;
- (BOOL)isCallConnected;
- (BOOL)prefersBannersHiddenFromClonedDisplay;
- (BOOL)prefersHiddenWhenDismissed;
- (BOOL)prefersLockedIdleDurationOnCoversheet;
- (BOOL)shouldBecomeVisibleWhenWakingDisplay;
- (BOOL)shouldNeverBeShownWhenLaunchingFaceTime;
- (BOOL)supportsDeviceLockActions;
- (BOOL)transientOverlayHomeIndicatorAutoHidden;
- (NSSet)preferredBackgroundActivitiesToSuppress;
- (UIEdgeInsets)expanseHUDDodgingInsets;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (unint64_t)preferredHardwareButtonEventTypes;
- (unint64_t)preferredStatusBarStyleOverridesToSuppress;
@end

@implementation SBSUIInCallSceneClientSettings

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [SBSUIMutableInCallSceneClientSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (unint64_t)preferredHardwareButtonEventTypes
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2001];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2002];

  return (NSSet *)v3;
}

- (unint64_t)preferredStatusBarStyleOverridesToSuppress
{
  v2 = [(SBSUIInCallSceneClientSettings *)self preferredBackgroundActivitiesToSuppress];
  return soft_STUIStyleOverridesForBackgroundActivityIdentifiers((uint64_t)v2);
}

- (BOOL)supportsDeviceLockActions
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2003];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)homeIndicatorAutoHidden
{
  return 0;
}

- (BOOL)shouldBecomeVisibleWhenWakingDisplay
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2005];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)transientOverlayHomeIndicatorAutoHidden
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2004];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isCallConnected
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2006];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (UIEdgeInsets)expanseHUDDodgingInsets
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2007];
  [v3 UIEdgeInsetsValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (BOOL)prefersBannersHiddenFromClonedDisplay
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2008];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)prefersHiddenWhenDismissed
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2009];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)shouldNeverBeShownWhenLaunchingFaceTime
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2010];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)prefersLockedIdleDurationOnCoversheet
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2011];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  unint64_t v3 = a3 - 2001;
  if (a3 - 2001 > 0xA || v3 == 6)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBSUIInCallSceneClientSettings;
    -[FBSSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
    double v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 > 0xA)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = off_1E5CCE028[v3];
  }
  return v5;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8 = a4;
  if (a5 - 2001 > 0xA || a5 == 2007)
  {
    v13.receiver = self;
    v13.super_class = (Class)SBSUIInCallSceneClientSettings;
    uint64_t v10 = [(FBSSettings *)&v13 valueDescriptionForFlag:a3 object:v8 ofSetting:a5];
  }
  else
  {
    uint64_t v10 = SBSUIInCallSceneClientSettingValueDescription(a5, v8);
  }
  double v11 = (void *)v10;

  return v11;
}

@end