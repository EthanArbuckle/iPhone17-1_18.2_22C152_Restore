@interface SBToggleClassroomPluginTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBToggleClassroomPluginTestRecipe

- (id)title
{
  return @"Toggle Classroom Plugin";
}

- (void)handleVolumeIncrease
{
  v2 = +[SBLockScreenManager sharedInstance];
  v3 = [v2 lockScreenEnvironment];
  id v5 = [v3 pluginPresenter];

  v4 = [MEMORY[0x1E4FA7958] contextWithName:@"ClassroomLockScreen"];
  [v5 enableLockScreenPluginWithContext:v4];
}

- (void)handleVolumeDecrease
{
  v2 = +[SBLockScreenManager sharedInstance];
  v3 = [v2 lockScreenEnvironment];
  id v5 = [v3 pluginPresenter];

  v4 = [MEMORY[0x1E4FA7958] contextWithName:@"ClassroomLockScreen"];
  [v5 disableLockScreenPluginWithContext:v4];
}

@end