@interface MSDKManagedDevice(Wallpaper)
@end

@implementation MSDKManagedDevice(Wallpaper)

- (void)_manageWallpaperSettingsWithAction:()Wallpaper .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[MSDKManagedDevice(Wallpaper) _manageWallpaperSettingsWithAction:]";
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "%s - Failed to setup XPC connection.", (uint8_t *)&v1, 0xCu);
}

@end