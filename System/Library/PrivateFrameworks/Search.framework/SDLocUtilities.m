@interface SDLocUtilities
+ (id)displayNameForBundleIdentifer:(id)a3;
+ (id)localizedSearchStringWithIdentifier:(id)a3;
+ (void)clearAppsDisplayNameMapping;
+ (void)initialize;
@end

@implementation SDLocUtilities

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v3 = sSearchFrameworkBundle;
    sSearchFrameworkBundle = v2;
    MEMORY[0x270F9A758](v2, v3);
  }
}

+ (id)localizedSearchStringWithIdentifier:(id)a3
{
  return (id)[(id)sSearchFrameworkBundle localizedStringForKey:a3 value:&stru_26CF85E78 table:@"Search"];
}

+ (id)displayNameForBundleIdentifer:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  if (displayNameForBundleIdentifer__onceToken != -1) {
    dispatch_once(&displayNameForBundleIdentifer__onceToken, &__block_literal_global_10);
  }
  pthread_rwlock_rdlock(&sAppDisplayNameReadWriteLock);
  p_vtable = SPDaemonConnection.vtable;
  v5 = [(id)sAppDisplayNameDictionary objectForKey:v3];
  pthread_rwlock_unlock(&sAppDisplayNameReadWriteLock);
  if (!v5)
  {
    pthread_rwlock_wrlock(&sAppDisplayNameReadWriteLock);
    if ([(__CFString *)v3 isEqualToString:*MEMORY[0x263F790E0]])
    {
      v7 = (__CFString *)(id)*MEMORY[0x263F79060];

      uint64_t v3 = v7;
    }
    if ([(__CFString *)v3 isEqualToString:*MEMORY[0x263F79058]])
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = @"com.apple.MobileAddressBook";
    }
    else if ([(__CFString *)v3 isEqualToString:*MEMORY[0x263F790C8]])
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = @"DOMAIN_SYNDICATED_LINKS";
    }
    else if ([(__CFString *)v3 isEqualToString:*MEMORY[0x263F790D0]])
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = @"DOMAIN_SYNDICATED_PHOTOS_FROM_APPS";
    }
    else if ([(__CFString *)v3 isEqualToString:*MEMORY[0x263F790E8]])
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = @"DOMAIN_SYNDICATED_PHOTOS_FROM_MESSAGES";
    }
    else if ([(__CFString *)v3 isEqualToString:*MEMORY[0x263F790F0]])
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = @"DOMAIN_SYNDICATED_PHOTOS_FROM_NOTES";
    }
    else if ([(__CFString *)v3 isEqualToString:*MEMORY[0x263F790D8]])
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = @"DOMAIN_SYNDICATED_PHOTOS_FROM_FILES";
    }
    else if ([(__CFString *)v3 isEqualToString:@"com.apple.application"])
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = @"DOMAIN_APPLICATION";
    }
    else if ([(__CFString *)v3 isEqualToString:@"com.apple.app-clips"])
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = @"DOMAIN_APP_CLIPS";
    }
    else if ([(__CFString *)v3 isEqualToString:@"com.apple.peopled"])
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = @"DOMAIN_PEOPLE";
    }
    else if ([(__CFString *)v3 isEqualToString:@"com.apple.people.askToBuyRequest"])
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = @"DOMAIN_PEOPLE_ASK_TO_BUY";
    }
    else if ([(__CFString *)v3 isEqualToString:@"com.apple.people.screenTimeRequest"])
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = @"DOMAIN_PEOPLE_SCREEN_TIME_REQUEST";
    }
    else if ([(__CFString *)v3 isEqualToString:@"com.apple.people.findMy"])
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = @"DOMAIN_PEOPLE_FIND_MY";
    }
    else if ([(__CFString *)v3 isEqualToString:*MEMORY[0x263F79038]] {
           && _os_feature_enabled_impl())
    }
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = @"DOMAIN_EVENTS";
    }
    else
    {
      v12 = [MEMORY[0x263F01880] defaultWorkspace];
      int v13 = [v12 applicationIsInstalled:v3];

      if (v13)
      {
        v14 = SPFastApplicationsGetNoBuild();
        v15 = [v14 objectForKeyedSubscript:v3];

        v5 = [v15 displayName];
        if (!v5)
        {
          v16 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:0];
          v5 = [v16 localizedName];
        }
        p_vtable = (void **)(SPDaemonConnection + 24);
        goto LABEL_36;
      }
      v17 = +[SDAppUninstallMonitor applicationsExcludedFromUninstall];
      int v18 = [v17 containsObject:v3];

      if (!v18)
      {
        v5 = 0;
        goto LABEL_36;
      }
      v8 = (void *)sSearchFrameworkBundle;
      v9 = v3;
    }
    v5 = [v8 localizedStringForKey:v9 value:&stru_26CF85E78 table:@"Search"];
LABEL_36:
    if (v5) {
      v10 = v5;
    }
    else {
      v10 = (void *)*MEMORY[0x263EFFD08];
    }
    [p_vtable[414] setObject:v10 forKey:v3];
    pthread_rwlock_unlock(&sAppDisplayNameReadWriteLock);
    goto LABEL_40;
  }
  if (v5 == (void *)*MEMORY[0x263EFFD08])
  {
    id v6 = 0;
    goto LABEL_41;
  }
LABEL_40:
  id v6 = v5;
  v5 = v6;
LABEL_41:

  return v6;
}

uint64_t __48__SDLocUtilities_displayNameForBundleIdentifer___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = (void *)sAppDisplayNameDictionary;
  sAppDisplayNameDictionary = (uint64_t)v0;

  [(id)sAppDisplayNameDictionary setObject:*MEMORY[0x263EFFD08] forKey:@"com.apple.springboard"];

  return pthread_rwlock_init(&sAppDisplayNameReadWriteLock, 0);
}

+ (void)clearAppsDisplayNameMapping
{
}

@end