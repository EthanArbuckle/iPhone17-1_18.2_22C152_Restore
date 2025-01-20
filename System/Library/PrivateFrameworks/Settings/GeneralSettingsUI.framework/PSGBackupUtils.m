@interface PSGBackupUtils
+ (BOOL)hasValidDisplayNameOfDomain:(id)a3;
+ (BOOL)isDomainNameIgnored:(id)a3;
+ (BOOL)isDomainWhitelisted:(id)a3;
+ (BOOL)isiCloudPhotosEnabled;
+ (BOOL)shouldIgnoreBundleId:(id)a3;
+ (id)alertBodyForBackupDisabledAppsInfo:(id)a3 ofType:(unint64_t)a4;
+ (id)alertTitleForBackupDisabledAppsInfo:(id)a3;
+ (id)bundleIdForDomainInfo:(id)a3;
+ (id)displayNameForDomainInfo:(id)a3;
+ (void)configureAlertMessageOfType:(unint64_t)a3 AndTitleForBackUpDisabledApps:(id)a4 completion:(id)a5;
+ (void)fetchBackupDisabledAppsWithBackupManager:(id)a3 completion:(id)a4;
@end

@implementation PSGBackupUtils

+ (void)configureAlertMessageOfType:(unint64_t)a3 AndTitleForBackUpDisabledApps:(id)a4 completion:(id)a5
{
  id v11 = a4;
  v8 = (void (**)(id, uint64_t, void *, void *))a5;
  if ([v11 backupDisabledAppCount] || objc_msgSend(v11, "includePhoto"))
  {
    v9 = [a1 alertTitleForBackupDisabledAppsInfo:v11];
    v10 = [a1 alertBodyForBackupDisabledAppsInfo:v11 ofType:a3];
    v8[2](v8, 1, v9, v10);
  }
  else
  {
    v8[2](v8, 0, 0, 0);
  }
}

+ (BOOL)shouldIgnoreBundleId:(id)a3
{
  return [a3 isEqualToString:@"com.apple.youtube"];
}

+ (id)alertBodyForBackupDisabledAppsInfo:(id)a3 ofType:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 backupDisabledAppCount];
  v7 = @"_ERASE";
  if (!a4) {
    v7 = @"_BACKUP";
  }
  v8 = v7;
  v9 = [v5 backupDisabledAppsForDisplay];
  int v10 = [v5 includePhoto];

  if (v10)
  {
    if (v6 != 2)
    {
      uint64_t v11 = v6 - 1;
      if (v6 == 1)
      {
        v19 = NSString;
        v12 = [@"PHOTO_AND_ONE_APP_BACK_UP_DISABLED_MESSAGE" stringByAppendingString:v8];
        v15 = PSG_LocalizedStringForBackupAlert(v12);
        uint64_t v22 = [v9 firstObject];
        v16 = (void *)v22;
LABEL_19:
        v13 = objc_msgSend(v19, "localizedStringWithFormat:", v15, v22, v24, v25);
        goto LABEL_20;
      }
      if (!v6)
      {
        v12 = [@"PHOTO_BACK_UP_DISABLED_ONLY_MESSAGE" stringByAppendingString:v8];
        v13 = PSG_LocalizedStringForBackupAlert(v12);
        goto LABEL_21;
      }
      v19 = NSString;
      v20 = @"PHOTO_AND_MORE_THAN_TWO_APPS_BACK_UP_DISABLED_MESSAGE";
LABEL_18:
      v12 = [(__CFString *)v20 stringByAppendingString:v8];
      v15 = PSG_LocalizedStringForBackupAlert(v12);
      uint64_t v22 = [v9 objectAtIndexedSubscript:0];
      v16 = (void *)v22;
      uint64_t v24 = v11;
      uint64_t v25 = v11;
      goto LABEL_19;
    }
    v14 = NSString;
    v18 = @"PHOTO_AND_TWO_APPS_BACK_UP_DISABLED_MESSAGE";
    goto LABEL_14;
  }
  if (v6 == 2)
  {
    v14 = NSString;
    v18 = @"TWO_APPS_BACK_UP_DISABLED_MESSAGE";
LABEL_14:
    v12 = [(__CFString *)v18 stringByAppendingString:v8];
    v15 = PSG_LocalizedStringForBackupAlert(v12);
    v16 = [v9 objectAtIndexedSubscript:0];
    uint64_t v17 = [v9 objectAtIndexedSubscript:1];
    goto LABEL_15;
  }
  uint64_t v11 = v6 - 1;
  if (v6 != 1)
  {
    v19 = NSString;
    v20 = @"TWO_MORE_APPS_BACK_UP_DISABLED_MESSAGE";
    goto LABEL_18;
  }
  v14 = NSString;
  v12 = [@"SINGAL_APP_BACK_UP_DISABLED_MESSAGE" stringByAppendingString:v8];
  v15 = PSG_LocalizedStringForBackupAlert(v12);
  v16 = [v9 firstObject];
  uint64_t v17 = [v9 firstObject];
LABEL_15:
  v21 = (void *)v17;
  v13 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v16, v17);

LABEL_20:
LABEL_21:

  return v13;
}

+ (id)alertTitleForBackupDisabledAppsInfo:(id)a3
{
  id v3 = a3;
  if ([v3 includePhoto])
  {
    unint64_t v4 = [v3 backupDisabledAppCount];
    if (v4 > 2) {
      id v5 = @"PHOTO_AND_OTHER_APPS_BACK_UP_DISABLED_TITLE";
    }
    else {
      id v5 = off_264E8D148[v4];
    }
  }
  else
  {
    id v5 = @"APP_BACK_UP_DISABLED_TITLE";
  }
  uint64_t v6 = PSG_LocalizedStringForBackupAlert(v5);

  return v6;
}

+ (void)fetchBackupDisabledAppsWithBackupManager:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  if (v6)
  {
    v9 = dispatch_get_global_queue(2, 0);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70__PSGBackupUtils_fetchBackupDisabledAppsWithBackupManager_completion___block_invoke;
    v10[3] = &unk_264E8D128;
    id v11 = v6;
    id v14 = a1;
    id v12 = v8;
    id v13 = v7;
    dispatch_async(v9, v10);
  }
  else
  {
    (*((void (**)(id, void *))v7 + 2))(v7, v8);
  }
}

void __70__PSGBackupUtils_fetchBackupDisabledAppsWithBackupManager_completion___block_invoke(id *a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = [a1[4] disabledDomainInfos];
  uint64_t v17 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    int v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v3);
        }
        int v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v11 = a1[7];
        id v12 = [v10 bundleID];
        LOBYTE(v11) = [v11 shouldIgnoreBundleId:v12];

        if ((v11 & 1) == 0)
        {
          if ([v10 isCameraRollDomain])
          {
            v6 |= [a1[7] isiCloudPhotosEnabled] ^ 1;
          }
          else if (v7 > 1 || ([a1[7] isDomainNameIgnored:v10] & 1) != 0)
          {
            v7 += [a1[7] hasValidDisplayNameOfDomain:v10];
          }
          else
          {
            id v13 = [a1[7] displayNameForDomainInfo:v10];
            if (v13)
            {
              [v17 addObject:v13];
              ++v7;
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
    int v7 = 0;
  }

  [a1[5] setBackupDisabledAppCount:v7];
  [a1[5] setBackupDisabledAppsForDisplay:v17];
  [a1[5] setIncludePhoto:v6 & 1];
  id v14 = _PSGLoggingFacility();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v26 = v16;
    __int16 v27 = 1024;
    int v28 = v7;
    _os_log_impl(&dword_23D28D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Backup disabled app count: %d", buf, 0x12u);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__PSGBackupUtils_fetchBackupDisabledAppsWithBackupManager_completion___block_invoke_63;
  block[3] = &unk_264E8D100;
  id v20 = a1[6];
  id v19 = a1[5];
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __70__PSGBackupUtils_fetchBackupDisabledAppsWithBackupManager_completion___block_invoke_63(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)displayNameForDomainInfo:(id)a3
{
  id v4 = a3;
  if ([v4 isCameraRollDomain])
  {
    uint64_t v5 = @"PHOTO_LIBRARY";
LABEL_7:
    int v10 = PSG_LocalizedStringForBackupInfo(v5);
    goto LABEL_8;
  }
  int v6 = [v4 domainName];
  int v7 = [v6 isEqualToString:@"KeyboardDomain"];

  if (v7)
  {
    uint64_t v5 = @"CJ_KEYBOARD_DATA";
    goto LABEL_7;
  }
  uint64_t v8 = [v4 domainName];
  int v9 = [v8 isEqualToString:@"HealthDomain"];

  if (v9)
  {
    NSLog(&cfstr_FoundHealthDom.isa);
    uint64_t v5 = @"HEALTH_DATA";
    goto LABEL_7;
  }
  if (([v4 isAppDomain] & 1) != 0 || objc_msgSend(a1, "isDomainWhitelisted:", v4))
  {
    id v12 = [v4 bundleID];
    id v13 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v12];
    id v14 = v13;
    if (v13
      && ([v13 appState],
          v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v15 isInstalled],
          v15,
          v16))
    {
      int v10 = [v14 localizedName];
    }
    else
    {
      int v10 = 0;
    }
  }
  else
  {
    int v10 = 0;
  }
LABEL_8:

  return v10;
}

+ (BOOL)hasValidDisplayNameOfDomain:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 domainName];
  if ([v5 isEqualToString:@"BooksDomain"])
  {
    char v6 = 0;
  }
  else
  {
    int v7 = [v4 domainName];
    char v8 = [v7 isEqualToString:@"AppDomain-com.apple.Health"];

    if (v8)
    {
      char v6 = 0;
      goto LABEL_8;
    }
    if ([v4 isCameraRollDomain])
    {
      char v6 = 1;
      goto LABEL_8;
    }
    uint64_t v5 = [v4 domainName];
    if ([v5 isEqualToString:@"KeyboardDomain"])
    {
      char v6 = 1;
    }
    else
    {
      int v10 = [v4 domainName];
      if (([v10 isEqualToString:@"HealthDomain"] & 1) != 0
        || ([v4 isAppDomain] & 1) != 0)
      {
        char v6 = 1;
      }
      else
      {
        char v6 = [a1 isDomainWhitelisted:v4];
      }
    }
  }

LABEL_8:
  return v6;
}

+ (BOOL)isiCloudPhotosEnabled
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  char v3 = [v2 fileExistsAtPath:@"/var/mobile/Media/PhotoData/CPL/initialsync_marker"];

  return v3;
}

+ (id)bundleIdForDomainInfo:(id)a3
{
  id v4 = a3;
  if ([v4 isCameraRollDomain])
  {
    uint64_t v5 = @"com.apple.camera";
  }
  else
  {
    char v6 = [v4 domainName];
    char v7 = [v6 isEqualToString:@"KeyboardDomain"];

    if (v7)
    {
      uint64_t v5 = @"com.apple.keyboard";
    }
    else
    {
      char v8 = [v4 domainName];
      int v9 = [v8 isEqualToString:@"HealthDomain"];

      if (v9)
      {
        NSLog(&cfstr_FoundHealthDom.isa);
        uint64_t v5 = @"com.apple.Health";
      }
      else if (([v4 isAppDomain] & 1) != 0 || objc_msgSend(a1, "isDomainWhitelisted:", v4))
      {
        uint64_t v5 = [v4 bundleID];
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
  }

  return v5;
}

+ (BOOL)isDomainWhitelisted:(id)a3
{
  uint64_t v3 = isDomainWhitelisted__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isDomainWhitelisted__onceToken, &__block_literal_global_6);
  }
  uint64_t v5 = (void *)isDomainWhitelisted__whitelist;
  char v6 = [v4 bundleID];

  char v7 = [v5 containsObject:v6];
  return v7;
}

void __38__PSGBackupUtils_isDomainWhitelisted___block_invoke()
{
  v4[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F5FF40];
  v4[0] = *MEMORY[0x263F5FF48];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x263F5FF38];
  v4[2] = *MEMORY[0x263F5FF30];
  v4[3] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:4];
  uint64_t v3 = (void *)isDomainWhitelisted__whitelist;
  isDomainWhitelisted__whitelist = v2;
}

+ (BOOL)isDomainNameIgnored:(id)a3
{
  uint64_t v3 = [a3 domainName];
  if ([v3 isEqualToString:@"BooksDomain"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"AppDomain-com.apple.Health"];
  }

  return v4;
}

@end