@interface MFUserDefaultMigrator
+ (BOOL)migratePreferencesToSharedAppGroup;
+ (id)_keysToMigrateToSharedAppGroup;
+ (id)currentDeviceIdentifer;
+ (id)log;
+ (id)mobileMailDefaultForKey:(id)a3;
+ (id)oldKeysToNewKeysMap;
+ (void)_migrateExtPropertiesPlist;
+ (void)migrateDefaults:(id)a3;
+ (void)migrateDefaultsFromOldKeysToNewKeys:(id)a3;
+ (void)migratePropertyForOldKey:(id)a3 newKey:(id)a4;
+ (void)removeMobileMailDefaultForKey:(id)a3;
@end

@implementation MFUserDefaultMigrator

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MFUserDefaultMigrator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_35 != -1) {
    dispatch_once(&log_onceToken_35, block);
  }
  v2 = (void *)log_log_35;
  return v2;
}

void __28__MFUserDefaultMigrator_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_35;
  log_log_35 = (uint64_t)v1;
}

+ (id)oldKeysToNewKeysMap
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"ReplyToSelf";
  v5[0] = *MEMORY[0x1E4F600C8];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

+ (id)_keysToMigrateToSharedAppGroup
{
  v2 = [&unk_1EFF50AD8 arrayByAddingObjectsFromArray:&unk_1EFF50AF0];
  return v2;
}

+ (void)_migrateExtPropertiesPlist
{
  v38[4] = *MEMORY[0x1E4F143B8];
  v27 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.mobilemail"];
  v2 = [v27 dataContainerURL];
  id v3 = [v2 path];

  v28 = v3;
  if ([v3 length])
  {
    uint64_t v4 = [@"com.apple.MailAccount-ExtProperties" stringByAppendingPathExtension:@"plist"];
    v5 = NSString;
    v38[0] = v3;
    v38[1] = @"Library";
    v38[2] = @"Preferences";
    v38[3] = v4;
    v25 = (void *)v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
    v26 = [v5 pathWithComponents:v6];

    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v8 = [v7 fileExistsAtPath:v26];

    v9 = +[MFUserDefaultMigrator log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = @"Not Found";
      if (v8) {
        v10 = @"Found";
      }
      *(_DWORD *)buf = 138543618;
      v35 = v10;
      __int16 v36 = 2112;
      v37 = v26;
      _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_DEFAULT, "extPropertiesDomain %{public}@ at path: %@", buf, 0x16u);
    }

    if (v8)
    {
      v24 = (void *)_CFPreferencesCopyValueWithContainer();
      if ([v24 BOOLValue])
      {
        v11 = +[MFUserDefaultMigrator log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_DEFAULT, "extPropertiesDomain already migrated to shared app group.", buf, 2u);
        }
      }
      else
      {
        v23 = _CFPreferencesCopyKeyListWithContainer();
        if ([v23 count])
        {
          v13 = +[MFUserDefaultMigrator log];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "Migrating extPropertiesDomain to shared app group.", buf, 2u);
          }

          v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          v15 = v23;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v30;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v30 != v17) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * i);
                v20 = (void *)_CFPreferencesCopyValueWithContainer();
                [v14 setObject:v20 forKey:v19];
                _CFPreferencesSetValueWithContainer();
              }
              uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
            }
            while (v16);
          }

          v21 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
          [v21 setObject:v14 forKey:@"com.apple.MailAccount-ExtProperties"];

          v22 = +[MFUserDefaultMigrator log];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v14;
            _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_DEFAULT, "Migrated following extPropertiesDomain defaults to shared app group: %@", buf, 0xCu);
          }
        }
        else
        {
          v14 = +[MFUserDefaultMigrator log];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "No keys found to migrate in extPropertiesDomain.", buf, 2u);
          }
        }

        _CFPreferencesSetValueWithContainer();
        v11 = v23;
      }
    }
  }
  else
  {
    v12 = +[MFUserDefaultMigrator log];
    v25 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_DEFAULT, "MobileMail container path not found - Skipping extProperties migration.", buf, 2u);
    }
  }
}

+ (BOOL)migratePreferencesToSharedAppGroup
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 oldKeysToNewKeysMap];
  [a1 migrateDefaultsFromOldKeysToNewKeys:v3];

  uint64_t v4 = [a1 _keysToMigrateToSharedAppGroup];
  [a1 migrateDefaults:v4];

  [a1 _migrateExtPropertiesPlist];
  v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v6 = [a1 currentDeviceIdentifer];
  [v5 setObject:v6 forKey:@"DeviceIdentifier"];

  v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  [v7 synchronize];

  *(_OWORD *)v14 = xmmword_1A8AC6718;
  uint64_t v15 = 0;
  size_t size = 0xAAAAAAAAAAAAAAAALL;
  pid_t v8 = sysctl(v14, 3u, 0, &size, 0, 0);
  if (!v8)
  {
    v9 = (char *)malloc_type_malloc(size, 0xE81E6E4FuLL);
    pid_t v8 = sysctl(v14, 3u, v9, &size, 0, 0);
    if (!v8)
    {
      if (size < 0x288)
      {
LABEL_12:
        free(v9);
        return 1;
      }
      size_t v11 = size / 0x288;
      v12 = v9 + 243;
      while (1)
      {
        pid_t v8 = *(_DWORD *)(v12 - 203);
        if (v8 >= 1 && !strncmp("maild", v12, 0x10uLL)) {
          break;
        }
        v12 += 648;
        if (!--v11) {
          goto LABEL_12;
        }
      }
      free(v9);
      goto LABEL_5;
    }
    free(v9);
  }
  if (v8 >= 1) {
LABEL_5:
  }
    kill(v8, 9);
  return 1;
}

+ (void)migrateDefaults:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(a1, "migratePropertyForOldKey:newKey:", *(void *)(*((void *)&v8 + 1) + 8 * v7), *(void *)(*((void *)&v8 + 1) + 8 * v7), (void)v8);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (void)migrateDefaultsFromOldKeysToNewKeys:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__MFUserDefaultMigrator_migrateDefaultsFromOldKeysToNewKeys___block_invoke;
  v3[3] = &__block_descriptor_40_e35_v32__0__NSString_8__NSString_16_B24l;
  v3[4] = a1;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __61__MFUserDefaultMigrator_migrateDefaultsFromOldKeysToNewKeys___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) migratePropertyForOldKey:a2 newKey:a3];
}

+ (void)migratePropertyForOldKey:(id)a3 newKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  long long v9 = [v8 valueForKey:v7];

  if (!v9)
  {
    long long v10 = [a1 mobileMailDefaultForKey:v6];
    if (v10)
    {
      long long v11 = +[MFUserDefaultMigrator log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412802;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v7;
        __int16 v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_DEFAULT, "Migrating %@ to %@ with default %@", (uint8_t *)&v13, 0x20u);
      }

      [v8 setObject:v10 forKey:v7];
      [a1 removeMobileMailDefaultForKey:v6];
    }
    else
    {
      v12 = +[MFUserDefaultMigrator log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v6;
        _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_DEFAULT, "No default for key %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

+ (id)currentDeviceIdentifer
{
  v2 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.mobilemail"];
  id v3 = [v2 dataContainerURL];
  id v4 = [v3 path];

  uint64_t v5 = (void *)_CFPreferencesCopyValueWithContainer();
  return v5;
}

+ (id)mobileMailDefaultForKey:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.mobilemail"];
  uint64_t v5 = [v4 dataContainerURL];
  id v6 = [v5 path];

  id v7 = (void *)_CFPreferencesCopyValueWithContainer();
  return v7;
}

+ (void)removeMobileMailDefaultForKey:(id)a3
{
  id v6 = a3;
  id v3 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.mobilemail"];
  id v4 = [v3 dataContainerURL];
  uint64_t v5 = [v4 path];

  _CFPreferencesSetValueWithContainer();
  _CFPreferencesSynchronizeWithContainer();
}

@end