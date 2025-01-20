@interface SharedDataMigration
+ (BOOL)_migrateCacheFileFromSubpath:(id)a3 toSubpath:(id)a4 ensureIsDirectory:(BOOL)a5;
+ (BOOL)migrateRecentSearches;
+ (BOOL)migrateThumbnails;
+ (id)_userCachesDirectoryPath;
+ (void)migratePersistentStorageDefaults;
+ (void)migrateTabDatabaseIfNeeded;
@end

@implementation SharedDataMigration

+ (id)_userCachesDirectoryPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  if ([v2 count])
  {
    v3 = [v2 objectAtIndex:0];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (BOOL)_migrateCacheFileFromSubpath:(id)a3 toSubpath:(id)a4 ensureIsDirectory:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  v10 = [(id)objc_opt_class() _userCachesDirectoryPath];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 stringByAppendingPathComponent:v7];
    if (v5)
    {
      char v37 = 0;
      char v13 = 1;
      if (![v9 fileExistsAtPath:v12 isDirectory:&v37] || !v37) {
        goto LABEL_23;
      }
    }
    else if (![v9 fileExistsAtPath:v12])
    {
      char v13 = 1;
LABEL_23:

      goto LABEL_24;
    }
    v14 = [v11 stringByAppendingPathComponent:v8];
    if ([v9 fileExistsAtPath:v14])
    {
      v15 = [v9 attributesOfItemAtPath:v12 error:0];
      id v16 = [v15 fileModificationDate];

      v17 = [v9 attributesOfItemAtPath:v14 error:0];
      v18 = [v17 fileModificationDate];

      if ([v18 compare:v16] != -1)
      {
        id v35 = 0;
        char v19 = [v9 removeItemAtPath:v12 error:&v35];
        id v20 = v35;
        v21 = v20;
        if ((v19 & 1) == 0)
        {
          v22 = [v20 description];
          NSLog((NSString *)@"Failed to remove %@ because %@", v12, v22);
        }
        char v13 = 1;
        goto LABEL_20;
      }
      id v36 = 0;
      char v23 = [v9 removeItemAtPath:v14 error:&v36];
      id v24 = v36;
      v25 = v24;
      if ((v23 & 1) == 0)
      {
        v26 = [v24 description];
        NSLog((NSString *)@"Failed to remove %@ because %@", v14, v26);
      }
    }
    v27 = [v12 lastPathComponent];
    NSLog((NSString *)@"Migrating %@ ...", v27);

    id v34 = 0;
    char v13 = [v9 moveItemAtPath:v12 toPath:v14 error:&v34];
    id v28 = v34;
    v29 = v28;
    if (v13)
    {
LABEL_22:

      goto LABEL_23;
    }
    v30 = [v28 description];
    NSLog((NSString *)@"Failed to migrate %@ because %@", v12, v30);

    id v33 = v29;
    char v31 = [v9 removeItemAtPath:v14 error:&v33];
    id v16 = v33;

    if (v31)
    {
LABEL_21:
      v29 = v16;
      goto LABEL_22;
    }
    v18 = [v16 description];
    NSLog((NSString *)@"Failed to remove %@ because %@", v14, v18);
LABEL_20:

    goto LABEL_21;
  }
  char v13 = 0;
LABEL_24:

  return v13;
}

+ (void)migratePersistentStorageDefaults
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = SafariLibraryPath();
  v3 = [v2 stringByResolvingSymlinksInPath];

  v4 = [v3 stringByAppendingPathComponent:@"WebKit/WebsiteData/LocalStorage"];
  BOOL v5 = [v3 stringByAppendingPathComponent:@"WebKit/WebsiteData/WebSQL"];
  [v6 setBool:1 forKey:@"WebKitLocalStorageEnabledPreferenceKey"];
  [v6 setObject:v4 forKey:*MEMORY[0x1E4FB6E70]];
  [v6 setObject:v5 forKey:*MEMORY[0x1E4FB6E30]];
  [v6 synchronize];
}

+ (BOOL)migrateRecentSearches
{
  v2 = [@"com.apple.mobilesafari" stringByAppendingPathComponent:@"RecentSearches.plist"];
  char v3 = [(id)objc_opt_class() _migrateCacheFileFromSubpath:@"Safari/RecentSearches.plist" toSubpath:v2 ensureIsDirectory:0];

  return v3;
}

+ (BOOL)migrateThumbnails
{
  v2 = [@"com.apple.mobilesafari" stringByAppendingPathComponent:@"Thumbnails"];
  char v3 = [(id)objc_opt_class() _migrateCacheFileFromSubpath:@"Safari/Thumbnails" toSubpath:v2 ensureIsDirectory:1];

  return v3;
}

+ (void)migrateTabDatabaseIfNeeded
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4FB60A8]);
  char v3 = [MEMORY[0x1E4FB6060] safariTabCollectionConfiguration];
  v4 = (void *)[v2 initWithConfiguration:v3 openDatabase:1];

  v40 = v4;
  if (([v4 hasCompletedMigration] & 1) == 0)
  {
    [v4 lockSync];
    id v35 = [MEMORY[0x1E4F78550] sharedBrowserSavedState];
    [v35 browserWindows];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v36)
    {
      uint64_t v34 = *(void *)v45;
      uint64_t v32 = *MEMORY[0x1E4F787C0];
      uint64_t v33 = *MEMORY[0x1E4F787C8];
      uint64_t v31 = *MEMORY[0x1E4F787B8];
      uint64_t v30 = *MEMORY[0x1E4F787A8];
      uint64_t v29 = *MEMORY[0x1E4F787B0];
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v45 != v34) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          id v7 = objc_alloc(MEMORY[0x1E4FB60D8]);
          id v8 = [v6 UUIDString];
          v9 = [v6 sceneID];
          v10 = (void *)[v7 initWithUUID:v8 sceneID:v9];

          v11 = [v6 UUID];
          v12 = [v35 savedTabsStateForBrowserControllerWithUUID:v11];

          if (v12)
          {
            [v40 saveWindowState:v10];
            char v13 = [v12 objectForKey:v33];
            v14 = [v12 objectForKey:v32];
            if ([v13 count] || objc_msgSend(v14, "count"))
            {
              v42[0] = MEMORY[0x1E4F143A8];
              v42[1] = 3221225472;
              v42[2] = __49__SharedDataMigration_migrateTabDatabaseIfNeeded__block_invoke;
              v42[3] = &unk_1E6D7B8A8;
              id v38 = v40;
              id v43 = v38;
              v15 = (void (**)(void, void))MEMORY[0x1E4E42950](v42);
              v39 = ((void (**)(void, void *))v15)[2](v15, v13);
              v41 = v14;
              char v37 = ((void (**)(void, void *))v15)[2](v15, v14);
              id v16 = [v10 localTabGroup];
              v17 = [v10 privateTabGroup];
              v18 = objc_msgSend(v12, "safari_numberForKey:", v31);
              unint64_t v19 = [v18 unsignedIntegerValue];

              if (v19 < [v13 count])
              {
                id v20 = [v13 objectAtIndexedSubscript:v19];
                v21 = objc_msgSend(v20, "safari_stringForKey:", v30);
                [v16 setLastSelectedTabUUID:v21];
                v22 = [v16 uuid];
                [v10 setActiveTabUUID:v21 forTabGroupWithUUID:v22];
              }
              char v23 = objc_msgSend(v12, "safari_numberForKey:", v29);
              unint64_t v24 = [v23 unsignedIntegerValue];

              v14 = v41;
              if (v24 < [v41 count])
              {
                v25 = [v41 objectAtIndexedSubscript:v24];
                v26 = objc_msgSend(v25, "safari_stringForKey:", v30);
                [v17 setLastSelectedTabUUID:v26];
                v27 = [v17 uuid];
                [v10 setActiveTabUUID:v26 forTabGroupWithUUID:v27];

                v14 = v41;
              }
              [v38 insertTabs:v39 inTabGroup:v16 afterTab:0];
              [v38 insertTabs:v37 inTabGroup:v17 afterTab:0];
            }
          }
        }
        uint64_t v36 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v36);
    }
    [v40 setCompletedMigration:1];
    [v40 unlockSync];
  }
}

id __49__SharedDataMigration_migrateTabDatabaseIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__SharedDataMigration_migrateTabDatabaseIfNeeded__block_invoke_2;
  v5[3] = &unk_1E6D7B880;
  id v6 = *(id *)(a1 + 32);
  char v3 = objc_msgSend(a2, "safari_mapObjectsUsingBlock:", v5);

  return v3;
}

id __49__SharedDataMigration_migrateTabDatabaseIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F787A8];
  id v4 = a2;
  BOOL v5 = objc_msgSend(v4, "safari_stringForKey:", v3);
  id v6 = objc_msgSend(v4, "safari_stringForKey:", *MEMORY[0x1E4F78798]);
  id v7 = objc_alloc(MEMORY[0x1E4F1CB10]);
  id v8 = objc_msgSend(v4, "safari_stringForKey:", *MEMORY[0x1E4F787A0]);

  v9 = (void *)[v7 initWithString:v8];
  id v10 = objc_alloc(MEMORY[0x1E4FB60A0]);
  v11 = [*(id *)(a1 + 32) currentDeviceIdentifier];
  v12 = (void *)[v10 initWithUUID:v5 title:v6 url:v9 deviceIdentifier:v11];

  return v12;
}

@end