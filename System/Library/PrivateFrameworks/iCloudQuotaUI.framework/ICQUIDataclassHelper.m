@interface ICQUIDataclassHelper
+ (BOOL)_isPhotosDataclass:(id)a3;
+ (BOOL)isBackupEnabledForAccount:(id)a3;
+ (BOOL)isSharedPhotoLibraryEnabled;
+ (BOOL)isiCPLEnabledForAccount:(id)a3;
+ (id)dataclassesToEnableForAccount:(id)a3 excludedApps:(id)a4;
+ (id)enabledAppsForAccount:(id)a3 deprioritizedApps:(id)a4;
+ (id)footerTextForSyncWithiCloudSpecifiersFromDataclasses:(id)a3 forAccount:(id)a4;
+ (id)iconForDataclass:(id)a3;
+ (id)localizedTextForDataclass:(id)a3;
+ (id)unsyncedDataclassesExcludingPhotosForAccount:(id)a3;
+ (void)enableDataclass:(id)a3 forAccount:(id)a4 completion:(id)a5;
@end

@implementation ICQUIDataclassHelper

+ (id)dataclassesToEnableForAccount:(id)a3 excludedApps:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 provisionedDataclasses];
  v8 = [v7 allObjects];

  id v18 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v5, "isEnabledForDataclass:", v14, v18) & 1) == 0)
        {
          v15 = [MEMORY[0x263F25810] sharedManager];
          if ([v15 canAutoEnableDataclass:v14 forAccount:v5])
          {
          }
          else
          {
            char v16 = [a1 _isPhotosDataclass:v14];

            if ((v16 & 1) == 0) {
              continue;
            }
          }
          if (([v6 containsObject:v14] & 1) == 0) {
            [v18 addObject:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  return v18;
}

+ (id)enabledAppsForAccount:(id)a3 deprioritizedApps:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (enabledAppsForAccount_deprioritizedApps__onceToken != -1) {
    dispatch_once(&enabledAppsForAccount_deprioritizedApps__onceToken, &__block_literal_global_17);
  }
  v7 = (void *)enabledAppsForAccount_deprioritizedApps__settingsApps;
  v8 = (void *)MEMORY[0x263F08A98];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __64__ICQUIDataclassHelper_enabledAppsForAccount_deprioritizedApps___block_invoke_2;
  v17[3] = &unk_264923610;
  id v18 = v5;
  id v9 = v5;
  uint64_t v10 = [v8 predicateWithBlock:v17];
  uint64_t v11 = [v7 filteredArrayUsingPredicate:v10];
  uint64_t v12 = (void *)[v11 mutableCopy];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__ICQUIDataclassHelper_enabledAppsForAccount_deprioritizedApps___block_invoke_3;
  v15[3] = &unk_264922368;
  id v16 = v6;
  id v13 = v6;
  [v12 sortUsingComparator:v15];

  return v12;
}

void __64__ICQUIDataclassHelper_enabledAppsForAccount_deprioritizedApps___block_invoke()
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263EFAD48];
  v10[0] = *MEMORY[0x263EFAC58];
  v10[1] = v0;
  uint64_t v1 = *MEMORY[0x263EFACE8];
  v10[2] = *MEMORY[0x263EFACB8];
  v10[3] = v1;
  uint64_t v2 = *MEMORY[0x263EFAC90];
  uint64_t v11 = *MEMORY[0x263EFACC8];
  uint64_t v12 = v2;
  uint64_t v3 = *MEMORY[0x263EFAC60];
  uint64_t v13 = *MEMORY[0x263EFAC50];
  uint64_t v14 = v3;
  uint64_t v15 = *MEMORY[0x263EFAD08];
  uint64_t v16 = v11;
  uint64_t v4 = *MEMORY[0x263EFACE0];
  uint64_t v17 = *MEMORY[0x263EFAC28];
  uint64_t v18 = v4;
  uint64_t v5 = *MEMORY[0x263EFAC98];
  uint64_t v19 = *MEMORY[0x263EFAD40];
  uint64_t v20 = v5;
  uint64_t v6 = *MEMORY[0x263EFAD30];
  uint64_t v21 = *MEMORY[0x263EFAC80];
  uint64_t v22 = v6;
  uint64_t v7 = *MEMORY[0x263EFAC88];
  uint64_t v23 = *MEMORY[0x263EFAD38];
  uint64_t v24 = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:18];
  id v9 = (void *)enabledAppsForAccount_deprioritizedApps__settingsApps;
  enabledAppsForAccount_deprioritizedApps__settingsApps = v8;
}

uint64_t __64__ICQUIDataclassHelper_enabledAppsForAccount_deprioritizedApps___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEnabledForDataclass:a2];
}

uint64_t __64__ICQUIDataclassHelper_enabledAppsForAccount_deprioritizedApps___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  int v7 = [v5 containsObject:a2];
  unsigned int v8 = [*(id *)(a1 + 32) containsObject:v6];

  if (v7 ^ 1 | v8) {
    return (uint64_t)((unint64_t)((v7 ^ 1) & v8) << 63) >> 63;
  }
  else {
    return 1;
  }
}

+ (id)unsyncedDataclassesExcludingPhotosForAccount:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v9 = *MEMORY[0x263EFAC58];
  uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:1];
  int v7 = objc_msgSend(a1, "dataclassesToEnableForAccount:excludedApps:", v5, v6, v9, v10);

  return v7;
}

+ (id)localizedTextForDataclass:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if ([v3 isEqualToString:*MEMORY[0x263EFAC58]])
  {
    id v4 = (id)*MEMORY[0x263EFACC0];
  }
  if ([v3 isEqualToString:*MEMORY[0x263EFAC20]])
  {
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"ICLOUD_BACKUP" value:&stru_26DFF2C90 table:@"Localizable"];
  }
  else
  {
    if ([v3 isEqualToString:*MEMORY[0x263EFACB8]])
    {
      int v7 = (void *)MEMORY[0x263F086E0];
      id v5 = [(id)CPSystemRootDirectory() stringByAppendingPathComponent:@"System/Library/PreferenceBundles/AccountSettings/AppleAccountSettings.bundle"];
      unsigned int v8 = [v7 bundleWithPath:v5];
      uint64_t v9 = [v8 localizedStringForKey:@"ICLOUD_MAIL_LABEL" value:&stru_26DFF2C90 table:@"Localizable"];

      goto LABEL_9;
    }
    uint64_t v10 = (void *)MEMORY[0x263F23150];
    v12[0] = v4;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    uint64_t v6 = [v10 localizedTextForDataclasses:v5 usedAtBeginningOfSentence:1 forAccount:0];
  }
  uint64_t v9 = (void *)v6;
LABEL_9:

  return v9;
}

+ (id)iconForDataclass:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if ([v3 isEqualToString:*MEMORY[0x263EFAC58]])
  {
    id v4 = (id)*MEMORY[0x263EFACC0];
  }
  id v5 = objc_msgSend(MEMORY[0x263F5FC40], "acui_iconForDataclass:", v4);

  return v5;
}

+ (id)footerTextForSyncWithiCloudSpecifiersFromDataclasses:(id)a3 forAccount:(id)a4
{
  id v4 = a3;
  if ([v4 count] == 2)
  {
    id v5 = [v4 allObjects];
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];
    int v7 = +[ICQUIDataclassHelper localizedTextForDataclass:v6];

    unsigned int v8 = [v4 allObjects];
    uint64_t v9 = [v8 objectAtIndexedSubscript:1];
    uint64_t v10 = +[ICQUIDataclassHelper localizedTextForDataclass:v9];

    uint64_t v11 = NSString;
    uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:@"SYNC_WITH_ICLOUD_TWO_APPS_DISABLED" value:&stru_26DFF2C90 table:@"Localizable"];
LABEL_7:
    uint64_t v22 = objc_msgSend(v11, "stringWithFormat:", v13, v7, v10, v29);
    goto LABEL_8;
  }
  if ([v4 count] == 3)
  {
    uint64_t v14 = [v4 allObjects];
    uint64_t v15 = [v14 objectAtIndexedSubscript:0];
    int v7 = +[ICQUIDataclassHelper localizedTextForDataclass:v15];

    uint64_t v16 = [v4 allObjects];
    uint64_t v17 = [v16 objectAtIndexedSubscript:1];
    uint64_t v10 = +[ICQUIDataclassHelper localizedTextForDataclass:v17];

    uint64_t v18 = [v4 allObjects];
    uint64_t v19 = [v18 objectAtIndexedSubscript:2];
    uint64_t v12 = +[ICQUIDataclassHelper localizedTextForDataclass:v19];

    uint64_t v20 = NSString;
    uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v21 = [v13 localizedStringForKey:@"SYNC_WITH_ICLOUD_THREE_APPS_DISABLED" value:&stru_26DFF2C90 table:@"Localizable"];
    uint64_t v22 = objc_msgSend(v20, "stringWithFormat:", v21, v7, v10, v12);

LABEL_8:
    goto LABEL_9;
  }
  if ((unint64_t)[v4 count] >= 4)
  {
    uint64_t v23 = [v4 allObjects];
    uint64_t v24 = [v23 objectAtIndexedSubscript:0];
    int v7 = +[ICQUIDataclassHelper localizedTextForDataclass:v24];

    uint64_t v25 = [v4 allObjects];
    v26 = [v25 objectAtIndexedSubscript:1];
    uint64_t v10 = +[ICQUIDataclassHelper localizedTextForDataclass:v26];

    uint64_t v27 = [v4 count] - 2;
    uint64_t v11 = NSString;
    uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:@"SYNC_WITH_ICLOUD_MORE_THAN_THREE_APPS_DISABLED" value:&stru_26DFF2C90 table:@"Localizable"];
    uint64_t v29 = v27;
    goto LABEL_7;
  }
  uint64_t v22 = 0;
LABEL_9:

  return v22;
}

+ (void)enableDataclass:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 isEnabledForDataclass:v7])
  {
    uint64_t v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[ICQUIDataclassHelper enableDataclass:forAccount:completion:]((uint64_t)v7, v10);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__ICQUIDataclassHelper_enableDataclass_forAccount_completion___block_invoke;
    block[3] = &unk_2649221A0;
    uint64_t v11 = &v21;
    id v21 = v9;
    id v12 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    [v8 setEnabled:1 forDataclass:*MEMORY[0x263EFACC8]];
    uint64_t v13 = [v8 accountStore];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __62__ICQUIDataclassHelper_enableDataclass_forAccount_completion___block_invoke_2;
    v16[3] = &unk_264923638;
    uint64_t v11 = &v17;
    id v17 = v7;
    id v14 = v8;
    id v18 = v14;
    id v19 = v9;
    id v15 = v9;
    [v13 saveAccount:v14 withCompletionHandler:v16];
  }
}

uint64_t __62__ICQUIDataclassHelper_enableDataclass_forAccount_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__ICQUIDataclassHelper_enableDataclass_forAccount_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __62__ICQUIDataclassHelper_enableDataclass_forAccount_completion___block_invoke_2_cold_1(a1, (uint64_t)v5, v6);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__ICQUIDataclassHelper_enableDataclass_forAccount_completion___block_invoke_66;
  block[3] = &unk_264922160;
  id v7 = *(id *)(a1 + 48);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __62__ICQUIDataclassHelper_enableDataclass_forAccount_completion___block_invoke_66(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

+ (BOOL)isBackupEnabledForAccount:(id)a3
{
  id v3 = (void *)MEMORY[0x263F88978];
  id v4 = (void *)MEMORY[0x263EFB210];
  id v5 = a3;
  uint64_t v6 = [v4 defaultStore];
  LOBYTE(v3) = [v3 isBackupEnabledForAccount:v5 accountStore:v6];

  return (char)v3;
}

+ (BOOL)isiCPLEnabledForAccount:(id)a3
{
  return [MEMORY[0x263F88978] isICPLEnabledForAccount:a3];
}

+ (BOOL)isSharedPhotoLibraryEnabled
{
  uint64_t v2 = [MEMORY[0x263F14E98] systemPhotoLibraryURL];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F14E98]) initWithPhotoLibraryURL:v2];
  id v4 = objc_alloc_init(MEMORY[0x263F14E18]);
  [v4 setPhotoLibrary:v3];
  id v5 = [MEMORY[0x263F14E48] fetchActiveLibraryScopeWithOptions:v4];
  uint64_t v6 = [v5 firstObject];

  return v6 != 0;
}

+ (BOOL)_isPhotosDataclass:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x263EFAC58]];
}

+ (void)enableDataclass:(uint64_t)a1 forAccount:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22C821000, a2, OS_LOG_TYPE_DEBUG, "Dataclass %@ enabled already. Bailing.", (uint8_t *)&v2, 0xCu);
}

void __62__ICQUIDataclassHelper_enableDataclass_forAccount_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "Unable to enable dataclass %@ for account %@. Error: %@", (uint8_t *)&v5, 0x20u);
}

@end