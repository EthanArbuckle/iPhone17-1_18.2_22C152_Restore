@interface SFDeviceSupportsWebKitFullscreenAPI
@end

@implementation SFDeviceSupportsWebKitFullscreenAPI

void ___SFDeviceSupportsWebKitFullscreenAPI_block_invoke()
{
  id v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v0 = [v2 userInterfaceIdiom];

  if (v0 == 1)
  {
    _SFDeviceSupportsWebKitFullscreenAPI::supportsFullscreen = 1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v1 = [v3 userInterfaceIdiom];

    if (v1)
    {
      _SFDeviceSupportsWebKitFullscreenAPI::supportsFullscreen = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      _SFDeviceSupportsWebKitFullscreenAPI::supportsFullscreen = [v4 BOOLForKey:@"EnableFullScreenAPIOnPhone"];
    }
  }
}

@end