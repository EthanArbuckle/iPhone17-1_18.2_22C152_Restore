@interface PSListController(DeepLinking)
- (void)addNavigationEventForSystemSettings:()DeepLinking;
- (void)addNavigationEventForSystemSettings:()DeepLinking andRelativeLinkToSoftwareUpdate:;
@end

@implementation PSListController(DeepLinking)

- (void)addNavigationEventForSystemSettings:()DeepLinking
{
  id v4 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  [v4 addNavigationEventForSystemSettings:location[0] andRelativeLinkToSoftwareUpdate:0];
  objc_storeStrong(location, 0);
}

- (void)addNavigationEventForSystemSettings:()DeepLinking andRelativeLinkToSoftwareUpdate:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v20 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  char v15 = 0;
  if (v18)
  {
    id v16 = (id)[NSString stringWithFormat:@"%@/%@", @"settings-navigation://com.apple.Settings.General/SOFTWARE_UPDATE_LINK", v18];
    char v15 = 1;
    id v4 = (__CFString *)v16;
  }
  else
  {
    id v4 = @"settings-navigation://com.apple.Settings.General/SOFTWARE_UPDATE_LINK";
  }
  id v17 = v4;
  if (v15) {

  }
  v7 = v20;
  id v6 = objc_alloc(MEMORY[0x263F08DB0]);
  id v5 = location[0];
  id v12 = (id)[MEMORY[0x263EFF960] currentLocale];
  id v11 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = (id)[v11 bundleURL];
  id v9 = (id)objc_msgSend(v6, "initWithKey:table:locale:bundleURL:", v5, 0, v12);
  id v8 = (id)[NSURL URLWithString:v17];
  objc_msgSend(v7, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", @"com.apple.graphic-icon.software-update", v9, MEMORY[0x263EFFA68]);

  id v14 = _SUSUILoggingFacility();
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v21, (uint64_t)"-[PSListController(DeepLinking) addNavigationEventForSystemSettings:andRelativeLinkToSoftwareUpdate:]", (uint64_t)v17);
    _os_log_impl(&dword_228401000, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "%s: NavigationEventForSystemSettings added to '%@'", v21, 0x16u);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

@end