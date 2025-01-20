@interface AADataclassManager(iCloudSettings)
- (uint64_t)_isHiddenDataclass:()iCloudSettings;
- (uint64_t)appIsNeitherInstalledOrPlaceholder:()iCloudSettings;
- (uint64_t)isAppRestrictedOnThisDevice:()iCloudSettings;
- (uint64_t)shouldShowDataclass:()iCloudSettings forAccount:;
@end

@implementation AADataclassManager(iCloudSettings)

- (uint64_t)_isHiddenDataclass:()iCloudSettings
{
  uint64_t v3 = _isHiddenDataclass__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_isHiddenDataclass__onceToken, &__block_literal_global_1);
  }
  uint64_t v5 = [(id)_isHiddenDataclass__dataclassesToHide containsObject:v4];

  return v5;
}

- (uint64_t)shouldShowDataclass:()iCloudSettings forAccount:
{
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x263F25820] isMultiUserMode] & 1) != 0
    || ([MEMORY[0x263F25810] sharedManager],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isSystemAppMCRestrictedOrRemovedForDataclass:v6 forAccount:v7],
        v8,
        (v9 & 1) != 0)
    || ([a1 _isHiddenDataclass:v6] & 1) != 0
    || [v6 isEqualToString:*MEMORY[0x263EFAD28]]
    && ([v7 isProvisionedForDataclass:*MEMORY[0x263EFACC0]] & 1) != 0
    || ([a1 isAppRestrictedOnThisDevice:v6] & 1) != 0)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [v7 isProvisionedForDataclass:v6];
  }

  return v10;
}

- (uint64_t)appIsNeitherInstalledOrPlaceholder:()iCloudSettings
{
  uint64_t v3 = (void *)MEMORY[0x263F25810];
  id v4 = a3;
  uint64_t v5 = [v3 sharedManager];
  id v6 = [v5 appBundleIdentifierForDataclass:v4];

  id v7 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v6];
  v8 = [v7 appState];
  if ([v8 isInstalled])
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = [v7 appState];
    uint64_t v9 = [v10 isPlaceholder] ^ 1;
  }
  return v9;
}

- (uint64_t)isAppRestrictedOnThisDevice:()iCloudSettings
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [v3 isEqualToString:*MEMORY[0x263EFAC90]];
  }

  return 0;
}

@end