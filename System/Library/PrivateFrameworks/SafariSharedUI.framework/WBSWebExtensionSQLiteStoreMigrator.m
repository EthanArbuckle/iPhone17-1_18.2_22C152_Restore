@interface WBSWebExtensionSQLiteStoreMigrator
- (BOOL)_anyWebKitSQLiteStoresExistInFolder:(id)a3;
- (BOOL)_copySafariSQLiteStoreAndAssociatedFiles:(id)a3 toWebKitSQLiteStore:(id)a4 webKitWebExtensionFolder:(id)a5;
- (WBSWebExtensionSQLiteStoreMigrator)initWithUserDefaults:(id)a3 safariContainerSettingsDirectoryURL:(id)a4;
- (void)_copySQLiteStoresFromSafariExtensionFolder:(id)a3 toWebKitExtensionFolder:(id)a4;
- (void)_deleteLegacySafariWebExtensionDataForDefaultProfile;
- (void)_deleteLegacySafariWebExtensionDataForNamedProfiles;
- (void)_initialize;
- (void)_migrateAllSafariSQLiteStoresToWebKit;
- (void)_migrateExtensionSQLiteStoresForDefaultProfile;
- (void)_migrateExtensionSQLiteStoresForNamedProfileFolderURL:(id)a3;
- (void)_migrateExtensionSQLiteStoresForNamedProfiles;
- (void)_removeDirectories:(id)a3;
- (void)migrateSQLiteStorageToWebKitIfNecessary;
@end

@implementation WBSWebExtensionSQLiteStoreMigrator

- (void)migrateSQLiteStorageToWebKitIfNecessary
{
  if ([(NSUserDefaults *)self->_userDefaults BOOLForKey:@"DidMigrateWebExtensionSQLiteStorageToWebKit"])
  {
    v3 = WBS_LOG_CHANNEL_PREFIXExtensions();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v8 = 0;
    v4 = "Web Extension Storage Migration: Skipping web extension storage migration because it's already been done";
    v5 = (uint8_t *)&v8;
LABEL_7:
    _os_log_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    return;
  }
  if ([(NSUserDefaults *)self->_userDefaults BOOLForKey:@"WebExtensionSQLiteStorageMigrationInProgress"])
  {
    v3 = WBS_LOG_CHANNEL_PREFIXExtensions();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v7 = 0;
    v4 = "Web Extension Storage Migration: Skipping web extension storage migration because it's in progress";
    v5 = (uint8_t *)&v7;
    goto LABEL_7;
  }
  [(NSUserDefaults *)self->_userDefaults setBool:1 forKey:@"WebExtensionSQLiteStorageMigrationInProgress"];
  [(WBSWebExtensionSQLiteStoreMigrator *)self _migrateAllSafariSQLiteStoresToWebKit];
  [(NSUserDefaults *)self->_userDefaults setBool:1 forKey:@"DidMigrateWebExtensionSQLiteStorageToWebKit"];
  userDefaults = self->_userDefaults;
  [(NSUserDefaults *)userDefaults removeObjectForKey:@"WebExtensionSQLiteStorageMigrationInProgress"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webKitProfilesDirectoryURL, 0);
  objc_storeStrong((id *)&self->_safariProfilesDirectoryURL, 0);
  objc_storeStrong((id *)&self->_webKitWebExtensionSettingsDirectoryURLForDefaultProfile, 0);
  objc_storeStrong((id *)&self->_safariWebExtensionSettingsDirectoryURLForDefaultProfile, 0);
  objc_storeStrong((id *)&self->_storeFileNameMappings, 0);
  objc_storeStrong((id *)&self->_safariContainerSettingsDirectoryURL, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (WBSWebExtensionSQLiteStoreMigrator)initWithUserDefaults:(id)a3 safariContainerSettingsDirectoryURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSWebExtensionSQLiteStoreMigrator;
  v9 = [(WBSWebExtensionSQLiteStoreMigrator *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userDefaults, a3);
    objc_storeStrong((id *)&v10->_safariContainerSettingsDirectoryURL, a4);
    v11 = v10;
  }

  return v10;
}

- (void)_migrateAllSafariSQLiteStoresToWebKit
{
  [(WBSWebExtensionSQLiteStoreMigrator *)self _initialize];
  [(WBSWebExtensionSQLiteStoreMigrator *)self _migrateExtensionSQLiteStoresForDefaultProfile];
  [(WBSWebExtensionSQLiteStoreMigrator *)self _migrateExtensionSQLiteStoresForNamedProfiles];
  [(WBSWebExtensionSQLiteStoreMigrator *)self _deleteLegacySafariWebExtensionDataForDefaultProfile];
  [(WBSWebExtensionSQLiteStoreMigrator *)self _deleteLegacySafariWebExtensionDataForNamedProfiles];
}

- (void)_initialize
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F98360]) initWithFirst:@"local.db" second:@"LocalStorage.db"];
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F98360]), "initWithFirst:second:", @"sync.db", @"SyncStorage.db", v3);
  v17[1] = v4;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F98360]) initWithFirst:@"dnr-dynamic-rules.db" second:@"DeclarativeNetRequestRules.db"];
  v17[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  storeFileNameMappings = self->_storeFileNameMappings;
  self->_storeFileNameMappings = v6;

  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v8, "safari_webExtensionsSettingsDirectoryURL");
  v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
  safariWebExtensionSettingsDirectoryURLForDefaultProfile = self->_safariWebExtensionSettingsDirectoryURLForDefaultProfile;
  self->_safariWebExtensionSettingsDirectoryURLForDefaultProfile = v9;

  objc_msgSend(v8, "safari_profilesDirectoryURL");
  v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
  safariProfilesDirectoryURL = self->_safariProfilesDirectoryURL;
  self->_safariProfilesDirectoryURL = v11;

  objc_super v13 = [(NSURL *)self->_safariContainerSettingsDirectoryURL URLByDeletingLastPathComponent];
  v14 = [v13 URLByAppendingPathComponent:@"WebKit/WebExtensions" isDirectory:1];

  objc_storeStrong((id *)&self->_webKitProfilesDirectoryURL, v14);
  v15 = [v14 URLByAppendingPathComponent:@"Default" isDirectory:1];
  webKitWebExtensionSettingsDirectoryURLForDefaultProfile = self->_webKitWebExtensionSettingsDirectoryURLForDefaultProfile;
  self->_webKitWebExtensionSettingsDirectoryURLForDefaultProfile = v15;
}

- (void)_migrateExtensionSQLiteStoresForDefaultProfile
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_DEFAULT, "Web Extension Storage Migration: Migrating web extension store files for default profile", buf, 2u);
  }
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = objc_msgSend(v4, "safari_topLevelDirectoriesAtURL:", self->_safariWebExtensionSettingsDirectoryURLForDefaultProfile);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "lastPathComponent", (void)v13);
        v12 = [(NSURL *)self->_webKitWebExtensionSettingsDirectoryURLForDefaultProfile URLByAppendingPathComponent:v11 isDirectory:0];
        if (![(WBSWebExtensionSQLiteStoreMigrator *)self _anyWebKitSQLiteStoresExistInFolder:v12])[(WBSWebExtensionSQLiteStoreMigrator *)self _copySQLiteStoresFromSafariExtensionFolder:v10 toWebKitExtensionFolder:v12]; {
      }
        }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_migrateExtensionSQLiteStoresForNamedProfiles
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_DEFAULT, "Web Extension Storage Migration: Migrating web extension store files for all profiles", buf, 2u);
  }
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = objc_msgSend(v4, "safari_topLevelDirectoriesAtURL:", self->_safariProfilesDirectoryURL);

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[WBSWebExtensionSQLiteStoreMigrator _migrateExtensionSQLiteStoresForNamedProfileFolderURL:](self, "_migrateExtensionSQLiteStoresForNamedProfileFolderURL:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_deleteLegacySafariWebExtensionDataForDefaultProfile
{
  v3 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_DEFAULT, "Web Extension Storage Migration: Deleting legacy web extension data for default profile", v6, 2u);
  }
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = objc_msgSend(v4, "safari_topLevelDirectoriesAtURL:", self->_safariWebExtensionSettingsDirectoryURLForDefaultProfile);

  [(WBSWebExtensionSQLiteStoreMigrator *)self _removeDirectories:v5];
}

- (void)_deleteLegacySafariWebExtensionDataForNamedProfiles
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_DEFAULT, "Web Extension Storage Migration: Deleting legacy web extension data for all profiles", buf, 2u);
  }
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v4, "safari_topLevelDirectoriesAtURL:", self->_safariProfilesDirectoryURL);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "URLByAppendingPathComponent:", @"WebExtensions", (void)v11);
        long long v10 = objc_msgSend(v4, "safari_topLevelDirectoriesAtURL:", v9);
        [(WBSWebExtensionSQLiteStoreMigrator *)self _removeDirectories:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }
}

- (BOOL)_anyWebKitSQLiteStoresExistInFolder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 checkResourceIsReachableAndReturnError:0])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = self->_storeFileNameMappings;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "second", (void)v13);
          long long v10 = [v4 URLByAppendingPathComponent:v9 isDirectory:0];

          if ([v10 checkResourceIsReachableAndReturnError:0])
          {
            long long v11 = WBS_LOG_CHANNEL_PREFIXExtensions();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
              -[WBSWebExtensionSQLiteStoreMigrator _anyWebKitSQLiteStoresExistInFolder:]((uint64_t)v10, v11);
            }

            LOBYTE(v6) = 1;
            goto LABEL_15;
          }
        }
        uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_migrateExtensionSQLiteStoresForNamedProfileFolderURL:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v4 = [v16 lastPathComponent];
  id v5 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v4;
    _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_DEFAULT, "Web Extension Storage Migration: Migrating web extension store files for profile %{public}@", buf, 0xCu);
  }
  uint64_t v17 = [v16 URLByAppendingPathComponent:@"WebExtensions"];
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = objc_msgSend(v6, "safari_topLevelDirectoriesAtURL:", v17);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v13 = [v12 lastPathComponent];
        long long v14 = [(NSURL *)self->_webKitProfilesDirectoryURL URLByAppendingPathComponent:v4 isDirectory:1];
        long long v15 = [v14 URLByAppendingPathComponent:v13 isDirectory:1];
        if (![(WBSWebExtensionSQLiteStoreMigrator *)self _anyWebKitSQLiteStoresExistInFolder:v15])[(WBSWebExtensionSQLiteStoreMigrator *)self _copySQLiteStoresFromSafariExtensionFolder:v12 toWebKitExtensionFolder:v15]; {
      }
        }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)_copySQLiteStoresFromSafariExtensionFolder:(id)a3 toWebKitExtensionFolder:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = self;
  obj = self->_storeFileNameMappings;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v9)
  {
    uint64_t v11 = *(void *)v26;
    *(void *)&long long v10 = 138739971;
    long long v22 = v10;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "first", v22);
        long long v15 = [v24 URLByAppendingPathComponent:v14 isDirectory:0];

        id v16 = [v15 path];
        char v17 = [v7 fileExistsAtPath:v16];

        if (v17)
        {
          long long v18 = [v13 second];
          long long v19 = [v6 URLByAppendingPathComponent:v18 isDirectory:0];

          if (![(WBSWebExtensionSQLiteStoreMigrator *)v8 _copySafariSQLiteStoreAndAssociatedFiles:v15 toWebKitSQLiteStore:v19 webKitWebExtensionFolder:v6])
          {
            long long v21 = WBS_LOG_CHANNEL_PREFIXExtensions();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              -[WBSWebExtensionSQLiteStoreMigrator _copySQLiteStoresFromSafariExtensionFolder:toWebKitExtensionFolder:]((uint64_t)v15, v21);
            }
            [v7 removeItemAtURL:v6 error:0];

            goto LABEL_17;
          }
        }
        else
        {
          long long v20 = WBS_LOG_CHANNEL_PREFIXExtensions();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v22;
            v30 = v15;
            _os_log_debug_impl(&dword_1ABB70000, v20, OS_LOG_TYPE_DEBUG, "Not migrating web extension store file from '%{sensitive}@' because file doesn't exist", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_17:
}

- (BOOL)_copySafariSQLiteStoreAndAssociatedFiles:(id)a3 toWebKitSQLiteStore:(id)a4 webKitWebExtensionFolder:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v36 = a4;
  id v35 = a5;
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v8 = [&unk_1F0342128 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v8)
  {
    char v10 = 0;
    uint64_t v11 = *(void *)v40;
    *(void *)&long long v9 = 138740227;
    long long v34 = v9;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v40 != v11) {
        objc_enumerationMutation(&unk_1F0342128);
      }
      long long v13 = *(void **)(*((void *)&v39 + 1) + 8 * v12);
      if (!objc_msgSend(v13, "length", v34)) {
        break;
      }
      long long v14 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v15 = [v37 absoluteString];
      id v16 = [(id)v15 stringByAppendingString:v13];
      id v17 = [v14 URLWithString:v16];

      long long v18 = [v17 path];
      LOBYTE(v15) = [v7 fileExistsAtPath:v18];

      if (v15)
      {
        long long v19 = (void *)MEMORY[0x1E4F1CB10];
        long long v20 = [v36 absoluteString];
        long long v21 = [v20 stringByAppendingString:v13];
        id v22 = [v19 URLWithString:v21];

LABEL_10:
        v23 = WBS_LOG_CHANNEL_PREFIXExtensions();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v34;
          id v44 = v17;
          __int16 v45 = 2117;
          id v46 = v22;
          _os_log_impl(&dword_1ABB70000, v23, OS_LOG_TYPE_DEFAULT, "Web Extension Storage Migration: Migrating web extension store file from '%{sensitive}@' to '%{sensitive}@'", buf, 0x16u);
        }
        if ((v10 & 1) == 0)
        {
          id v24 = objc_msgSend(v7, "safari_ensureDirectoryExists:", v35);
          BOOL v25 = v24 == 0;

          if (v25)
          {
            uint64_t v32 = WBS_LOG_CHANNEL_PREFIXExtensions();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              -[WBSWebExtensionSQLiteStoreMigrator _copySafariSQLiteStoreAndAssociatedFiles:toWebKitSQLiteStore:webKitWebExtensionFolder:]((uint64_t)v35, v32);
            }
            goto LABEL_24;
          }
        }
        id v38 = 0;
        char v26 = [v7 copyItemAtURL:v17 toURL:v22 error:&v38];
        id v27 = v38;
        long long v28 = v27;
        if ((v26 & 1) == 0)
        {
          v30 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = objc_msgSend(v28, "safari_privacyPreservingDescription");
            -[WBSWebExtensionSQLiteStoreMigrator _copySafariSQLiteStoreAndAssociatedFiles:toWebKitSQLiteStore:webKitWebExtensionFolder:](v31, buf, v30);
          }

LABEL_24:
          BOOL v29 = 0;
          goto LABEL_25;
        }

        char v10 = 1;
      }

      if (v8 == ++v12)
      {
        uint64_t v8 = [&unk_1F0342128 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    id v17 = v37;
    id v22 = v36;
    goto LABEL_10;
  }
LABEL_18:
  BOOL v29 = 1;
LABEL_25:

  return v29;
}

- (void)_removeDirectories:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v14;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
        id v15 = 0;
        int v9 = [v3 removeItemAtURL:v8 error:&v15];
        id v10 = v15;
        if (v9)
        {
          uint64_t v11 = WBS_LOG_CHANNEL_PREFIXExtensions();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138739971;
            uint64_t v21 = v8;
            _os_log_impl(&dword_1ABB70000, v11, OS_LOG_TYPE_DEFAULT, "Web Extension Storage Migration: Deleting legacy web extension data at: '%{sensitive}@'", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v12 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            long long v13 = objc_msgSend(v10, "safari_privacyPreservingDescription");
            *(_DWORD *)buf = 138740227;
            uint64_t v21 = v8;
            __int16 v22 = 2114;
            v23 = v13;
            _os_log_error_impl(&dword_1ABB70000, v12, OS_LOG_TYPE_ERROR, "Failed to delete legacy Safari web extension data at '%{sensitive}@': %{public}@", buf, 0x16u);
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v5);
  }
}

- (void)_anyWebKitSQLiteStoresExistInFolder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138739971;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_DEBUG, "Web Extension Storage Migration: Not migrating web extension store file because file already exists at '%{sensitive}@'", (uint8_t *)&v2, 0xCu);
}

- (void)_copySQLiteStoresFromSafariExtensionFolder:(uint64_t)a1 toWebKitExtensionFolder:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138739971;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_ERROR, "Failed to migrate '%{sensitive}@', deleting destination WebKit extension folder", (uint8_t *)&v2, 0xCu);
}

- (void)_copySafariSQLiteStoreAndAssociatedFiles:(void *)a1 toWebKitSQLiteStore:(uint8_t *)buf webKitWebExtensionFolder:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Failed to migrate web extension store file: %{public}@", buf, 0xCu);
}

- (void)_copySafariSQLiteStoreAndAssociatedFiles:(uint64_t)a1 toWebKitSQLiteStore:(NSObject *)a2 webKitWebExtensionFolder:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138739971;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_ERROR, "Couldn't create folder for migration: '%{sensitive}@'", (uint8_t *)&v2, 0xCu);
}

@end