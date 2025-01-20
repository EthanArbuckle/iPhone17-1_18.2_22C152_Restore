@interface UIApplication(IC)
+ (uint64_t)ic_openBluetoothSettings;
+ (uint64_t)ic_openGeneralSettings;
+ (uint64_t)ic_openICloudStorageSettings;
+ (uint64_t)ic_openNotificationSettings;
+ (void)ic_openSettings;
+ (void)ic_openSettingsToRoot:()IC path:;
- (uint64_t)ic_hasConnectedHostedWindowScene;
@end

@implementation UIApplication(IC)

+ (uint64_t)ic_openBluetoothSettings
{
  return objc_msgSend(a1, "ic_openSettingsToRoot:path:", @"Bluetooth", 0);
}

+ (uint64_t)ic_openICloudStorageSettings
{
  return objc_msgSend(a1, "ic_openSettingsToRoot:path:", @"APPLE_ACCOUNT", @"ICLOUD_SERVICE/STORAGE_AND_BACKUP/MANAGE_STORAGE");
}

+ (uint64_t)ic_openNotificationSettings
{
  return objc_msgSend(a1, "ic_openSettingsToRoot:path:", @"NOTES", @"NOTIFICATIONS");
}

+ (void)ic_openSettings
{
  id v1 = [MEMORY[0x1E4FB1438] sharedApplication];
  v0 = [MEMORY[0x1E4F1CB10] URLWithString:*MEMORY[0x1E4FB26C8]];
  [v1 openURL:v0 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

+ (uint64_t)ic_openGeneralSettings
{
  return objc_msgSend(a1, "ic_openSettingsToRoot:path:", &stru_1F0973378, 0);
}

- (uint64_t)ic_hasConnectedHostedWindowScene
{
  id v1 = [a1 connectedScenes];
  uint64_t v2 = objc_msgSend(v1, "ic_containsObjectPassingTest:", &__block_literal_global_51);

  return v2;
}

+ (void)ic_openSettingsToRoot:()IC path:
{
  id v11 = a4;
  v6 = [NSString stringWithFormat:@"prefs:root=%@", a3];
  if ([v11 length])
  {
    uint64_t v7 = [v6 stringByAppendingFormat:@"&path=%@", v11];

    v6 = (void *)v7;
  }
  v8 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  char v10 = [v9 openSensitiveURL:v8 withOptions:0];

  if ((v10 & 1) == 0) {
    objc_msgSend(a1, "ic_openSettings");
  }
}

@end