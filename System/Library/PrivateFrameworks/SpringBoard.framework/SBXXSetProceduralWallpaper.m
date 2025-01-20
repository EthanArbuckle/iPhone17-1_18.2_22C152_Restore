@interface SBXXSetProceduralWallpaper
@end

@implementation SBXXSetProceduralWallpaper

void ___SBXXSetProceduralWallpaper_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = +[SBWallpaperController sharedInstance];
  v3 = [v2 wallpaperConfigurationManager];
  [v3 setProceduralWallpaperIdentifier:*(void *)(a1 + 32) options:*(void *)(a1 + 40) forVariants:*(unsigned __int8 *)(a1 + 48)];

  v4 = SBLogWallpaper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "SETTING PROCEDURAL WALLPAPER %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

@end