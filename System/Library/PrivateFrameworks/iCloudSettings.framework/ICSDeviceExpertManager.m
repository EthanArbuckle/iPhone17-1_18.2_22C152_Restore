@interface ICSDeviceExpertManager
+ (_NSLocalizedStringResource)appleAccountTitle;
+ (_NSLocalizedStringResource)backupTitle;
+ (_NSLocalizedStringResource)iCloudTitle;
+ (_NSLocalizedStringResource)manageStorageTitle;
+ (_NSLocalizedStringResource)savedToiCloudTitle;
@end

@implementation ICSDeviceExpertManager

+ (_NSLocalizedStringResource)appleAccountTitle
{
  id v2 = objc_alloc(MEMORY[0x263F08DB0]);
  v3 = [MEMORY[0x263EFF960] currentLocale];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 bundleURL];
  v6 = (void *)[v2 initWithKey:@"TITLE_APPLE_ACCOUNT" table:@"Localizable-iCloud" locale:v3 bundleURL:v5];

  return (_NSLocalizedStringResource *)v6;
}

+ (_NSLocalizedStringResource)iCloudTitle
{
  id v2 = objc_alloc(MEMORY[0x263F08DB0]);
  v3 = [MEMORY[0x263EFF960] currentLocale];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 bundleURL];
  v6 = (void *)[v2 initWithKey:@"TITLE_ICLOUD" table:@"Localizable-iCloud" locale:v3 bundleURL:v5];

  return (_NSLocalizedStringResource *)v6;
}

+ (_NSLocalizedStringResource)manageStorageTitle
{
  id v2 = objc_alloc(MEMORY[0x263F08DB0]);
  v3 = [MEMORY[0x263EFF960] currentLocale];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 bundleURL];
  v6 = (void *)[v2 initWithKey:@"MANAGE_STORAGE_TITLE_FALLBACK" table:@"Localizable-iCloud" locale:v3 bundleURL:v5];

  return (_NSLocalizedStringResource *)v6;
}

+ (_NSLocalizedStringResource)backupTitle
{
  id v2 = objc_alloc(MEMORY[0x263F08DB0]);
  v3 = [MEMORY[0x263EFF960] currentLocale];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 bundleURL];
  v6 = (void *)[v2 initWithKey:@"BACKUP_HEADER_TITLE" table:@"Localizable-Backup" locale:v3 bundleURL:v5];

  return (_NSLocalizedStringResource *)v6;
}

+ (_NSLocalizedStringResource)savedToiCloudTitle
{
  id v2 = objc_alloc(MEMORY[0x263F08DB0]);
  v3 = [MEMORY[0x263EFF960] currentLocale];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 bundleURL];
  v6 = (void *)[v2 initWithKey:@"TITLE_SAVED_TO_ICLOUD" table:@"Localizable-iCloud" locale:v3 bundleURL:v5];

  return (_NSLocalizedStringResource *)v6;
}

@end