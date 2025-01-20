@interface ICSPhotoSettingsController
- (ICSPhotoSettingsController)init;
@end

@implementation ICSPhotoSettingsController

- (ICSPhotoSettingsController)init
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = (id)objc_msgSend(MEMORY[0x263F086E0], "ics_loadBundle:atPath:", @"MobileSlideShowSettings.bundle", @"System/Library/PreferenceBundles");
  v4 = NSClassFromString(&cfstr_Mssphotostream.isa);
  if (v4)
  {
    v5 = (ICSPhotoSettingsController *)objc_alloc_init(v4);
  }
  else
  {
    v6 = LogSubsystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      v9 = @"MSSPhotoStreamInAccountSettingsController";
      __int16 v10 = 2112;
      v11 = @"MobileSlideShowSettings.bundle";
      _os_log_impl(&dword_262993000, v6, OS_LOG_TYPE_DEFAULT, "ICSPhotoSettingsController could not find the class %@ in the %@ bundle", (uint8_t *)&v8, 0x16u);
    }

    v5 = 0;
  }

  return v5;
}

@end