@interface SFSafariSettingsBrowsingDataExportController
+ (id)_sandboxExtensionForURL:(id)a3;
+ (void)exportBookmarksToFileWithURL:(id)a3 completionHandler:(id)a4;
+ (void)exportExtensionsToDirectoryWithURL:(id)a3 profileIdentifiersToExportFrom:(id)a4 tabGroupManager:(id)a5 completionHandler:(id)a6;
+ (void)exportHistoryToDirectoryWithURL:(id)a3 profileIdentifiersToExportFrom:(id)a4 tabGroupManager:(id)a5 completionHandler:(id)a6;
@end

@implementation SFSafariSettingsBrowsingDataExportController

+ (void)exportHistoryToDirectoryWithURL:(id)a3 profileIdentifiersToExportFrom:(id)a4 tabGroupManager:(id)a5 completionHandler:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v31 = a5;
  dispatch_block_t block = a6;
  v11 = dispatch_group_create();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v29 = *(void *)v35;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(obj);
        }
        v15 = [v31 profileWithIdentifier:*(void *)(*((void *)&v34 + 1) + 8 * v14)];
        v16 = [v15 title];
        v17 = objc_msgSend(v16, "safari_filenameByFixingIllegalCharacters");

        v18 = (void *)MEMORY[0x1E4F982B0];
        if ([v15 isDefault]) {
          v19 = 0;
        }
        else {
          v19 = v17;
        }
        v20 = [v18 fileURLFromExportFolderURL:v9 profileTitle:v19 forBrowsingDataExportType:2];
        v21 = objc_msgSend(v20, "safari_URLWithUniqueFilename");

        v22 = [MEMORY[0x1E4F28CB8] defaultManager];
        v23 = [v21 path];
        [v22 createFileAtPath:v23 contents:0 attributes:0];

        id v24 = objc_alloc_init(MEMORY[0x1E4FB60F8]);
        v25 = [a1 _sandboxExtensionForURL:v9];
        if (v25)
        {
          dispatch_group_enter(v11);
          v26 = [v15 identifier];
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __145__SFSafariSettingsBrowsingDataExportController_exportHistoryToDirectoryWithURL_profileIdentifiersToExportFrom_tabGroupManager_completionHandler___block_invoke;
          v32[3] = &unk_1E54EC1C0;
          v33 = v11;
          [v24 exportSafariHistoryToURL:v21 sandboxExtension:v25 profileIdentifier:v26 completionHandler:v32];
        }
        ++v14;
      }
      while (v13 != v14);
      uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v13);
  }

  dispatch_group_notify(v11, MEMORY[0x1E4F14428], block);
}

void __145__SFSafariSettingsBrowsingDataExportController_exportHistoryToDirectoryWithURL_profileIdentifiersToExportFrom_tabGroupManager_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXExport();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __145__SFSafariSettingsBrowsingDataExportController_exportHistoryToDirectoryWithURL_profileIdentifiersToExportFrom_tabGroupManager_completionHandler___block_invoke_cold_1(v4, v3);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (void)exportBookmarksToFileWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4FB60F8]);
  id v9 = [a1 _sandboxExtensionForURL:v6];
  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __95__SFSafariSettingsBrowsingDataExportController_exportBookmarksToFileWithURL_completionHandler___block_invoke;
    v10[3] = &unk_1E54EC1E8;
    id v11 = v7;
    [v8 exportBookmarksToURL:v6 sandboxExtension:v9 completionHandler:v10];
  }
  else
  {
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __95__SFSafariSettingsBrowsingDataExportController_exportBookmarksToFileWithURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXExport();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __95__SFSafariSettingsBrowsingDataExportController_exportBookmarksToFileWithURL_completionHandler___block_invoke_cold_1(v4, v3);
    }
  }
  dispatch_async(MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 32));
}

+ (void)exportExtensionsToDirectoryWithURL:(id)a3 profileIdentifiersToExportFrom:(id)a4 tabGroupManager:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __148__SFSafariSettingsBrowsingDataExportController_exportExtensionsToDirectoryWithURL_profileIdentifiersToExportFrom_tabGroupManager_completionHandler___block_invoke;
  v17[3] = &unk_1E54EC210;
  id v18 = v11;
  id v19 = v10;
  id v20 = v9;
  id v21 = v12;
  id v13 = v12;
  id v14 = v9;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(MEMORY[0x1E4F14428], v17);
}

void __148__SFSafariSettingsBrowsingDataExportController_exportExtensionsToDirectoryWithURL_profileIdentifiersToExportFrom_tabGroupManager_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  long long v35 = [[SFExtensionsProfilesDataSource alloc] initWithTabGroupManager:*(void *)(a1 + 32)];
  group = dispatch_group_create();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v36 = a1;
  id obj = *(id *)(a1 + 40);
  uint64_t v37 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v37)
  {
    uint64_t v34 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v47 != v34) {
          objc_enumerationMutation(obj);
        }
        id v3 = [*(id *)(v36 + 32) profileWithIdentifier:*(void *)(*((void *)&v46 + 1) + 8 * i)];
        v4 = [v3 title];
        uint64_t v5 = objc_msgSend(v4, "safari_filenameByFixingIllegalCharacters");

        id v6 = (void *)MEMORY[0x1E4F982B0];
        uint64_t v7 = *(void *)(v36 + 48);
        v38 = (void *)v5;
        if ([v3 isDefault]) {
          uint64_t v8 = 0;
        }
        else {
          uint64_t v8 = v5;
        }
        id v9 = [v6 fileURLFromExportFolderURL:v7 profileTitle:v8 forBrowsingDataExportType:4];
        id v10 = objc_msgSend(v9, "safari_URLWithUniqueFilename");

        id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v12 = [v10 path];
        [v11 createFileAtPath:v12 contents:0 attributes:0];

        id v13 = [(SFExtensionsProfilesDataSource *)v35 profileServerIDToContentBlockerManagers];
        id v14 = [v3 serverID];
        id v15 = [v13 objectForKeyedSubscript:v14];
        v53[0] = v15;
        id v16 = [(SFExtensionsProfilesDataSource *)v35 profileServerIDToWebExtensionsControllers];
        v17 = [v3 serverID];
        id v18 = [v16 objectForKeyedSubscript:v17];
        v53[1] = v18;
        id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];

        id v20 = [MEMORY[0x1E4F1CA48] array];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v21 = v19;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v43 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = [*(id *)(*((void *)&v42 + 1) + 8 * j) extensionsDataForExport];
              [v20 addObjectsFromArray:v26];
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v42 objects:v52 count:16];
          }
          while (v23);
        }

        id v27 = objc_alloc(MEMORY[0x1E4F98AD8]);
        id v41 = 0;
        v28 = (void *)[v27 initWithURL:v10 error:&v41];
        id v29 = v41;
        if (v29)
        {
          v30 = WBS_LOG_CHANNEL_PREFIXExport();
          id v31 = v38;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            __148__SFSafariSettingsBrowsingDataExportController_exportExtensionsToDirectoryWithURL_profileIdentifiersToExportFrom_tabGroupManager_completionHandler___block_invoke_cold_1(v50, v30, v29, &v51);
          }
        }
        else
        {
          dispatch_group_enter(group);
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __148__SFSafariSettingsBrowsingDataExportController_exportExtensionsToDirectoryWithURL_profileIdentifiersToExportFrom_tabGroupManager_completionHandler___block_invoke_7;
          v39[3] = &unk_1E54EC1C0;
          v40 = group;
          [v28 exportExtensionDictionaries:v20 completionHandler:v39];

          id v31 = v38;
        }
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v37);
  }

  dispatch_group_notify(group, MEMORY[0x1E4F14428], *(dispatch_block_t *)(v36 + 56));
}

void __148__SFSafariSettingsBrowsingDataExportController_exportExtensionsToDirectoryWithURL_profileIdentifiersToExportFrom_tabGroupManager_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXExport();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __148__SFSafariSettingsBrowsingDataExportController_exportExtensionsToDirectoryWithURL_profileIdentifiersToExportFrom_tabGroupManager_completionHandler___block_invoke_7_cold_1(v4, v3);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (id)_sandboxExtensionForURL:(id)a3
{
  id v3 = a3;
  [v3 fileSystemRepresentation];
  v4 = (const char *)sandbox_extension_issue_file();
  if (v4)
  {
    uint64_t v5 = (void *)[[NSString alloc] initWithBytesNoCopy:v4 length:strlen(v4) encoding:4 freeWhenDone:1];
  }
  else
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXExport();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[SFSafariSettingsBrowsingDataExportController _sandboxExtensionForURL:]((uint64_t)v3, v6);
    }
    uint64_t v5 = 0;
  }

  return v5;
}

void __145__SFSafariSettingsBrowsingDataExportController_exportHistoryToDirectoryWithURL_profileIdentifiersToExportFrom_tabGroupManager_completionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0(&dword_18C354000, v5, v6, "Error exporting history: %{public}@", v7, v8, v9, v10, 2u);
}

void __95__SFSafariSettingsBrowsingDataExportController_exportBookmarksToFileWithURL_completionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0(&dword_18C354000, v5, v6, "Error exporting bookmarks: %{public}@", v7, v8, v9, v10, 2u);
}

void __148__SFSafariSettingsBrowsingDataExportController_exportExtensionsToDirectoryWithURL_profileIdentifiersToExportFrom_tabGroupManager_completionHandler___block_invoke_cold_1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl(&dword_18C354000, v7, OS_LOG_TYPE_ERROR, "Error exporting extensions: %{public}@", a1, 0xCu);
}

void __148__SFSafariSettingsBrowsingDataExportController_exportExtensionsToDirectoryWithURL_profileIdentifiersToExportFrom_tabGroupManager_completionHandler___block_invoke_7_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0(&dword_18C354000, v5, v6, "Error exporting extensions: %{public}@", v7, v8, v9, v10, 2u);
}

+ (void)_sandboxExtensionForURL:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = *__error();
  int v5 = 138478083;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_18C354000, v3, OS_LOG_TYPE_ERROR, "Can't issue extension to %{private}@: %{errno}i", (uint8_t *)&v5, 0x12u);
}

@end