@interface SBSUIMutableLoginUISceneClientSettings
- (NSString)statusBarUserNameOverride;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)idleTimerMode;
- (int64_t)rotationMode;
- (unint64_t)wallpaperMode;
- (void)setIdleTimerMode:(int64_t)a3;
- (void)setRotationMode:(int64_t)a3;
- (void)setStatusBarUserNameOverride:(id)a3;
- (void)setWallpaperMode:(unint64_t)a3;
@end

@implementation SBSUIMutableLoginUISceneClientSettings

- (int64_t)idleTimerMode
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:736840726];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setIdleTimerMode:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  int64_t v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:736840726];
}

- (NSString)statusBarUserNameOverride
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:736840727];

  return (NSString *)v3;
}

- (void)setStatusBarUserNameOverride:(id)a3
{
  id v4 = a3;
  id v6 = [(FBSSettings *)self otherSettings];
  id v5 = (void *)[v4 copy];

  [v6 setObject:v5 forSetting:736840727];
}

- (int64_t)rotationMode
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:736840728];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setRotationMode:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  int64_t v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:736840728];
}

- (unint64_t)wallpaperMode
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:736840729];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)setWallpaperMode:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:736840729];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [SBSUILoginUISceneClientSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 736840726 > 3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBSUIMutableLoginUISceneClientSettings;
    -[FBSSettings keyDescriptionForSetting:](&v5, sel_keyDescriptionForSetting_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5CCDD30[a3 - 736840726];
  }
  return v3;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8 = a4;
  v9 = SBSUILoginUISceneClientSettingValueDescription(a5, v8);
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBSUIMutableLoginUISceneClientSettings;
    id v11 = [(FBSSettings *)&v14 valueDescriptionForFlag:a3 object:v8 ofSetting:a5];
  }
  v12 = v11;

  return v12;
}

@end