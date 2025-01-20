@interface IMLogCategory
+ (OS_os_log)accessibility;
+ (OS_os_log)defaultCategory;
+ (OS_os_log)imageCache;
+ (OS_os_log)player;
@end

@implementation IMLogCategory

+ (OS_os_log)defaultCategory
{
  if (defaultCategory_onceToken != -1) {
    dispatch_once(&defaultCategory_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)defaultCategory_IMLogCategoryDefault;
  return (OS_os_log *)v2;
}

uint64_t __32__IMLogCategory_defaultCategory__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.podcasts.imframeworks", "Podcasts");
  uint64_t v1 = defaultCategory_IMLogCategoryDefault;
  defaultCategory_IMLogCategoryDefault = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (OS_os_log)accessibility
{
  if (accessibility_onceToken != -1) {
    dispatch_once(&accessibility_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)accessibility_IMLogCategoryAccessibility;
  return (OS_os_log *)v2;
}

uint64_t __30__IMLogCategory_accessibility__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.podcasts.imframeworks", "Accessibility");
  uint64_t v1 = accessibility_IMLogCategoryAccessibility;
  accessibility_IMLogCategoryAccessibility = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (OS_os_log)imageCache
{
  if (imageCache_onceToken != -1) {
    dispatch_once(&imageCache_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)imageCache_IMLogCategoryImageCache;
  return (OS_os_log *)v2;
}

uint64_t __27__IMLogCategory_imageCache__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.podcasts.imframeworks", "ImageCache");
  uint64_t v1 = imageCache_IMLogCategoryImageCache;
  imageCache_IMLogCategoryImageCache = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (OS_os_log)player
{
  if (player_onceToken != -1) {
    dispatch_once(&player_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)player_IMLogCategoryPlayer;
  return (OS_os_log *)v2;
}

uint64_t __23__IMLogCategory_player__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.podcasts.imframeworks", "Player");
  uint64_t v1 = player_IMLogCategoryPlayer;
  player_IMLogCategoryPlayer = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end