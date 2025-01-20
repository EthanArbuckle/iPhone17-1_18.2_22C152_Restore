@interface SBRunWallpaperMigrationTestRecipe
- (id)title;
- (void)handleVolumeIncrease;
@end

@implementation SBRunWallpaperMigrationTestRecipe

- (id)title
{
  return @"Run Wallpaper Migration";
}

- (void)handleVolumeIncrease
{
  v2 = +[SBWallpaperController sharedInstance];
  v3 = [v2 wallpaperConfigurationManager];
  [v3 performMigrationWithFailureHandler:&__block_literal_global_186];

  id v4 = +[SBWallpaperController sharedInstance];
  [v4 _updateWallpaperForLocations:3 options:0 withCompletion:0];
}

void __57__SBRunWallpaperMigrationTestRecipe_handleVolumeIncrease__block_invoke()
{
}

@end