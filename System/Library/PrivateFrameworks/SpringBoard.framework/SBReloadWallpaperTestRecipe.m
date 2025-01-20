@interface SBReloadWallpaperTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBReloadWallpaperTestRecipe

- (id)title
{
  return @"Reload Wallpaper";
}

- (void)handleVolumeIncrease
{
  id v2 = +[SBWallpaperController sharedInstance];
  [v2 _reloadWallpaperAndFlushCaches:1 completionHandler:0];
}

- (void)handleVolumeDecrease
{
  id v2 = +[SBWallpaperController sharedInstance];
  [v2 _reloadWallpaperAndFlushCaches:0 completionHandler:0];
}

@end