@interface SBSUIMutableInCallSceneClientSettings
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
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (unint64_t)preferredHardwareButtonEventTypes;
- (unint64_t)preferredStatusBarStyleOverridesToSuppress;
- (void)setCallConnected:(BOOL)a3;
- (void)setExpanseHUDDodgingInsets:(UIEdgeInsets)a3;
- (void)setPreferredBackgroundActivitiesToSuppress:(id)a3;
- (void)setPreferredHardwareButtonEventTypes:(unint64_t)a3;
- (void)setPreferredStatusBarStyleOverridesToSuppress:(unint64_t)a3;
- (void)setPrefersBannersHiddenFromClonedDisplay:(BOOL)a3;
- (void)setPrefersHiddenWhenDismissed:(BOOL)a3;
- (void)setPrefersLockedIdleDurationOnCoversheet:(BOOL)a3;
- (void)setShouldBecomeVisibleWhenWakingDisplay:(BOOL)a3;
- (void)setShouldNeverBeShownWhenLaunchingFaceTime:(BOOL)a3;
- (void)setSupportsDeviceLockActions:(BOOL)a3;
- (void)setTransientOverlayHomeIndicatorAutoHidden:(BOOL)a3;
@end

@implementation SBSUIMutableInCallSceneClientSettings

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SBSUIInCallSceneClientSettings alloc];
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
  v2 = [(SBSUIMutableInCallSceneClientSettings *)self preferredBackgroundActivitiesToSuppress];
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

- (void)setPreferredHardwareButtonEventTypes:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  char v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:2001];
}

- (void)setPreferredStatusBarStyleOverridesToSuppress:(unint64_t)a3
{
  soft_STUIBackgroundActivityIdentifiersForStyleOverrides(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(SBSUIMutableInCallSceneClientSettings *)self setPreferredBackgroundActivitiesToSuppress:v4];
}

- (void)setPreferredBackgroundActivitiesToSuppress:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:2002];
}

- (void)setSupportsDeviceLockActions:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:2003];
}

- (void)setTransientOverlayHomeIndicatorAutoHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:2004];
}

- (void)setShouldBecomeVisibleWhenWakingDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:2005];
}

- (void)setCallConnected:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:2006];
}

- (void)setExpanseHUDDodgingInsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  double v7 = [(FBSSettings *)self otherSettings];
  *(CGFloat *)double v9 = top;
  *(CGFloat *)&v9[1] = left;
  *(CGFloat *)&v9[2] = bottom;
  *(CGFloat *)&v9[3] = right;
  double v8 = [MEMORY[0x1E4F29238] valueWithBytes:v9 objCType:"{UIEdgeInsets=dddd}"];
  [v7 setObject:v8 forSetting:2007];
}

- (void)setPrefersBannersHiddenFromClonedDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:2008];
}

- (void)setPrefersHiddenWhenDismissed:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:2009];
}

- (void)setShouldNeverBeShownWhenLaunchingFaceTime:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:2010];
}

- (void)setPrefersLockedIdleDurationOnCoversheet:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:2011];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 2001 > 0xA)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBSUIMutableInCallSceneClientSettings;
    -[FBSSettings keyDescriptionForSetting:](&v5, sel_keyDescriptionForSetting_);
    BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v3 = off_1E5CCE028[a3 - 2001];
  }
  return v3;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  if (a5 - 2001 > 0xA)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBSUIMutableInCallSceneClientSettings;
    objc_super v5 = -[FBSSettings valueDescriptionForFlag:object:ofSetting:](&v7, sel_valueDescriptionForFlag_object_ofSetting_, a3, a4);
  }
  else
  {
    objc_super v5 = SBSUIInCallSceneClientSettingValueDescription(a5, a4);
  }
  return v5;
}

@end