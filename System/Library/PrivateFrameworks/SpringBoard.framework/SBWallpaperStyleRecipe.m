@interface SBWallpaperStyleRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBWallpaperStyleRecipe

- (id)title
{
  return @"Homescreen Wallpaper Style Changer";
}

- (void)handleVolumeIncrease
{
  id v4 = +[SBWallpaperController sharedInstance];
  uint64_t v2 = [v4 activeVariant];
  v3 = [MEMORY[0x1E4F4F898] factoryWithDuration:0.3];
  [v4 setWallpaperStyle:23 forPriority:4 forVariant:v2 withAnimationFactory:v3];
}

- (void)handleVolumeDecrease
{
  id v4 = +[SBWallpaperController sharedInstance];
  uint64_t v2 = [v4 activeVariant];
  v3 = [MEMORY[0x1E4F4F898] factoryWithDuration:0.3];
  [v4 removeWallpaperStyleForPriority:4 forVariant:v2 withAnimationFactory:v3];
}

@end