@interface PBUIWallpaperWindowSceneSettings
- (BOOL)disallowHomescreenRasterization;
- (BOOL)disallowLockscreenRasterization;
- (BOOL)homescreenStyleChangesDelayed;
- (BOOL)homescreenWallpaperHidden;
- (BOOL)liveWallpaperInteractive;
- (BOOL)liveWallpaperTouchActive;
- (BOOL)lockscreenWallpaperHidden;
- (BOOL)wallpaperAnimationSuspended;
- (BOOL)wallpaperRequired;
- (CGRect)lockscreenWallpaperContentsRect;
- (NSString)cachingIdentifier;
- (PBUIWallpaperWindowSceneStyleTransitionState)homescreenStyleTransitionState;
- (PBUIWallpaperWindowSceneStyleTransitionState)lockscreenStyleTransitionState;
- (double)homescreenWallpaperAlpha;
- (double)lockscreenOnlyWallpaperAlpha;
- (double)lockscreenWallpaperAlpha;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)wallpaperVariant;
@end

@implementation PBUIWallpaperWindowSceneSettings

- (int64_t)wallpaperVariant
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:727229969];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (CGRect)lockscreenWallpaperContentsRect
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:727229970];
  [v3 CGRectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)lockscreenWallpaperAlpha
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:727229971];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)homescreenWallpaperAlpha
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:727229972];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)lockscreenOnlyWallpaperAlpha
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:727229973];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (BOOL)disallowHomescreenRasterization
{
  v2 = [(FBSSettings *)self otherSettings];
  [v2 flagForSetting:727229974];
  char IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (BOOL)disallowLockscreenRasterization
{
  v2 = [(FBSSettings *)self otherSettings];
  [v2 flagForSetting:727229975];
  char IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (BOOL)homescreenWallpaperHidden
{
  v2 = [(FBSSettings *)self otherSettings];
  [v2 flagForSetting:727229976];
  char IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (BOOL)lockscreenWallpaperHidden
{
  v2 = [(FBSSettings *)self otherSettings];
  [v2 flagForSetting:727229977];
  char IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (BOOL)wallpaperAnimationSuspended
{
  v2 = [(FBSSettings *)self otherSettings];
  [v2 flagForSetting:727229978];
  char IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (BOOL)wallpaperRequired
{
  v2 = [(FBSSettings *)self otherSettings];
  [v2 flagForSetting:727229979];
  char IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (BOOL)homescreenStyleChangesDelayed
{
  v2 = [(FBSSettings *)self otherSettings];
  [v2 flagForSetting:727229980];
  char IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (NSString)cachingIdentifier
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:727229981];

  return (NSString *)v3;
}

- (PBUIWallpaperWindowSceneStyleTransitionState)homescreenStyleTransitionState
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:727229982];

  return (PBUIWallpaperWindowSceneStyleTransitionState *)v3;
}

- (PBUIWallpaperWindowSceneStyleTransitionState)lockscreenStyleTransitionState
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:727229983];

  return (PBUIWallpaperWindowSceneStyleTransitionState *)v3;
}

- (BOOL)liveWallpaperTouchActive
{
  v2 = [(FBSSettings *)self otherSettings];
  [v2 flagForSetting:727229984];
  char IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (BOOL)liveWallpaperInteractive
{
  v2 = [(FBSSettings *)self otherSettings];
  [v2 flagForSetting:727229985];
  char IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  double v4 = [PBUIMutableWallpaperWindowSceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  double v5 = PBUIWallpaperWindowSceneSettingKeyDescription(a3);
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PBUIWallpaperWindowSceneSettings;
    id v7 = [(FBSSettings *)&v10 keyDescriptionForSetting:a3];
  }
  double v8 = v7;

  return v8;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8 = a4;
  double v9 = PBUIWallpaperWindowSceneSettingValueDescription(a5, v8);
  objc_super v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PBUIWallpaperWindowSceneSettings;
    id v11 = [(FBSSettings *)&v14 valueDescriptionForFlag:a3 object:v8 ofSetting:a5];
  }
  double v12 = v11;

  return v12;
}

@end