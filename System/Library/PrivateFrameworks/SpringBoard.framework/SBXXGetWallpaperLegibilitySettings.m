@interface SBXXGetWallpaperLegibilitySettings
@end

@implementation SBXXGetWallpaperLegibilitySettings

void ___SBXXGetWallpaperLegibilitySettings_block_invoke(uint64_t a1)
{
  id v5 = +[SBWallpaperController sharedInstance];
  uint64_t v2 = [v5 legibilitySettingsForVariant:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end