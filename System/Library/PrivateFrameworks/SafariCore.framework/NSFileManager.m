@interface NSFileManager
@end

@implementation NSFileManager

void __71__NSFileManager_SafariNSFileManagerExtras__safari_settingsDirectoryURL__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "safari_safariLibraryDirectory");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend(v1, "safari_settingsDirectoryForLibraryDirectory:");
  v3 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_settingsDirectoryURL]::settingsDirectory;
  -[NSFileManager(SafariNSFileManagerExtras) safari_settingsDirectoryURL]::settingsDirectory = v2;
}

void __73__NSFileManager_SafariNSFileManagerExtras__safari_safariLibraryDirectory__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "safari_mobileSafariContainerDirectoryURL");
  id v9 = (id)v2;
  if (v2)
  {
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_safari_libraryDirectoryForHomeDirectory:", v2);
    id v4 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_safariLibraryDirectory]::safariLibraryDirectory;
    -[NSFileManager(SafariNSFileManagerExtras) safari_safariLibraryDirectory]::safariLibraryDirectory = v3;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CB10];
    id v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    v6 = [v4 objectAtIndex:0];
    uint64_t v7 = [v5 fileURLWithPath:v6 isDirectory:1];
    v8 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_safariLibraryDirectory]::safariLibraryDirectory;
    -[NSFileManager(SafariNSFileManagerExtras) safari_safariLibraryDirectory]::safariLibraryDirectory = v7;
  }
}

void __105__NSFileManager_SafariNSFileManagerExtras___safari_getMobileSafariContainerDirectoryURL_isContainerized___block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  getpid();
  int v0 = sandbox_container_path_for_pid();
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  char v2 = objc_msgSend(v1, "safari_isPasswordsAppBundle");
  if (v0) {
    char v3 = 1;
  }
  else {
    char v3 = v2;
  }

  if (v3)
  {
    id v12 = 0;
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.mobilesafari" allowPlaceholder:0 error:&v12];
    id v5 = v12;
    uint64_t v6 = [v4 dataContainerURL];
    uint64_t v7 = (void *)-[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::containerURL;
    -[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::containerURL = v6;

    if (!-[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::containerURL)
    {
      v8 = (id)WBS_LOG_CHANNEL_PREFIXOther();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = objc_msgSend(v5, "safari_privacyPreservingDescription");
        *(_DWORD *)buf = 138543362;
        v14 = v9;
        _os_log_impl(&dword_1B728F000, v8, OS_LOG_TYPE_INFO, "Safari received a nil container URL from LSApplicationRecord which must not happen unless Safari has been deleted: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v5 = (id)[[NSString alloc] initWithUTF8String:v15];
    uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
    v11 = (void *)-[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::containerURL;
    -[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::containerURL = v10;

    -[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::isContainerized = 1;
  }
}

void __116__NSFileManager_SafariNSFileManagerExtras__safari_mobileSafariAppContainerDirectoryURLFromOutsideSafariAppContainer__block_invoke()
{
  id v4 = 0;
  int v0 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.mobilesafari" allowPlaceholder:0 error:&v4];
  id v1 = v4;
  uint64_t v2 = [v0 dataContainerURL];
  char v3 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_mobileSafariAppContainerDirectoryURLFromOutsideSafariAppContainer]::containerURL;
  -[NSFileManager(SafariNSFileManagerExtras) safari_mobileSafariAppContainerDirectoryURLFromOutsideSafariAppContainer]::containerURL = v2;
}

void __105__NSFileManager_SafariNSFileManagerExtras___safari_getPasswordsAppContainerDirectoryURL_isContainerized___block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v0 = [MEMORY[0x1E4F28B50] mainBundle];
  if (!objc_msgSend(v0, "safari_isPasswordsAppBundle"))
  {

    goto LABEL_5;
  }
  getpid();
  BOOL v1 = sandbox_container_path_for_pid() == 0;

  if (!v1)
  {
LABEL_5:
    id v8 = 0;
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.Passwords" allowPlaceholder:0 error:&v8];
    id v2 = v8;
    uint64_t v6 = [v5 dataContainerURL];
    uint64_t v7 = (void *)-[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::containerURL;
    -[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::containerURL = v6;

    goto LABEL_6;
  }
  id v2 = (id)[[NSString alloc] initWithUTF8String:v9];
  uint64_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2 isDirectory:1];
  id v4 = (void *)-[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::containerURL;
  -[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::containerURL = v3;

  -[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::isContainerized = 1;
LABEL_6:
}

void __89__NSFileManager_SafariNSFileManagerExtras__safari_mobileSafariGroupContainerDirectoryURL__block_invoke()
{
  int v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v1 = [v0 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.safari"];
  id v2 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_mobileSafariGroupContainerDirectoryURL]::containerURL;
  -[NSFileManager(SafariNSFileManagerExtras) safari_mobileSafariGroupContainerDirectoryURL]::containerURL = v1;

  if (!-[NSFileManager(SafariNSFileManagerExtras) safari_mobileSafariGroupContainerDirectoryURL]::containerURL)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXFileManager();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __89__NSFileManager_SafariNSFileManagerExtras__safari_mobileSafariGroupContainerDirectoryURL__block_invoke_cold_1(v3);
    }
  }
}

void __84__NSFileManager_SafariNSFileManagerExtras__safari_webExtensionsSettingsDirectoryURL__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "safari_settingsDirectoryURL");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 URLByAppendingPathComponent:@"WebExtensions"];
  id v2 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_webExtensionsSettingsDirectoryURL]::settingsDirectory;
  -[NSFileManager(SafariNSFileManagerExtras) safari_webExtensionsSettingsDirectoryURL]::settingsDirectory = v1;
}

void __71__NSFileManager_SafariNSFileManagerExtras__safari_profilesDirectoryURL__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "safari_settingsDirectoryURL");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 URLByAppendingPathComponent:@"Profiles"];
  id v2 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_profilesDirectoryURL]::profilesDirectory;
  -[NSFileManager(SafariNSFileManagerExtras) safari_profilesDirectoryURL]::profilesDirectory = v1;
}

void __85__NSFileManager_SafariNSFileManagerExtras__safari_nonContaineredSettingsDirectoryURL__block_invoke()
{
  id v2 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/Safari"];
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:");
  uint64_t v1 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_nonContaineredSettingsDirectoryURL]::nonContaineredSettingsDirectoryURL;
  -[NSFileManager(SafariNSFileManagerExtras) safari_nonContaineredSettingsDirectoryURL]::nonContaineredSettingsDirectoryURL = v0;
}

void __84__NSFileManager_SafariNSFileManagerExtras__safari_productionSafariSettingsDirectory__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "safari_safariLibraryDirectory");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 URLByAppendingPathComponent:@"Safari" isDirectory:1];
  id v2 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_productionSafariSettingsDirectory]::settingsDirectory;
  -[NSFileManager(SafariNSFileManagerExtras) safari_productionSafariSettingsDirectory]::settingsDirectory = v1;
}

uint64_t __133__NSFileManager_SafariNSFileManagerExtras__safari_moveFileAtSubpath_relativeToFileHandle_toUniqueSubpath_relativeToFileHandle_error___block_invoke()
{
  return 0;
}

uint64_t __112__NSFileManager_SafariNSFileManagerExtras__safari_removeContentsOfDirectory_preservingContainerManagerMetadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id)WBS_LOG_CHANNEL_PREFIXFileManager();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 32));
    uint64_t v10 = objc_msgSend(v6, "safari_privacyPreservingDescription");
    int v11 = 138543875;
    id v12 = v9;
    __int16 v13 = 2113;
    id v14 = v5;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_error_impl(&dword_1B728F000, v7, OS_LOG_TYPE_ERROR, "%{public}@: error while enumerating %{private}@: %{public}@", (uint8_t *)&v11, 0x20u);
  }
  return 1;
}

void __112__NSFileManager_SafariNSFileManagerExtras__safari_removeContentsOfDirectory_preservingContainerManagerMetadata___block_invoke_79(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v4 = *(void **)(a1 + 40);
  id v9 = 0;
  [v4 removeItemAtURL:v3 error:&v9];
  id v5 = v9;
  if (v5)
  {
    id v6 = (id)WBS_LOG_CHANNEL_PREFIXFileManager();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
      id v8 = objc_msgSend(v5, "safari_privacyPreservingDescription");
      *(_DWORD *)buf = 138543875;
      int v11 = v7;
      __int16 v12 = 2113;
      __int16 v13 = v3;
      __int16 v14 = 2114;
      __int16 v15 = v8;
      _os_log_error_impl(&dword_1B728F000, v6, OS_LOG_TYPE_ERROR, "%{public}@: error while removing %{private}@: %{public}@", buf, 0x20u);
    }
  }
}

uint64_t __76__NSFileManager_SafariNSFileManagerExtras__safari_topLevelDirectoriesAtURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id)WBS_LOG_CHANNEL_PREFIXFileManager();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 32));
    uint64_t v10 = objc_msgSend(v6, "safari_privacyPreservingDescription");
    int v11 = 138543875;
    __int16 v12 = v9;
    __int16 v13 = 2113;
    id v14 = v5;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_error_impl(&dword_1B728F000, v7, OS_LOG_TYPE_ERROR, "%{public}@: error while enumerating %{private}@: %{public}@", (uint8_t *)&v11, 0x20u);
  }
  return 1;
}

void __89__NSFileManager_SafariNSFileManagerExtras__safari_mobileSafariGroupContainerDirectoryURL__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  id v2 = @"group.com.apple.safari";
  _os_log_fault_impl(&dword_1B728F000, log, OS_LOG_TYPE_FAULT, "Failed to get MobileSafari group container path, groupID = %{public}@", (uint8_t *)&v1, 0xCu);
}

@end