@interface NSFileManager(SafariNSFileManagerExtras)
- (BOOL)safari_removeDirectoryIfEmpty:()SafariNSFileManagerExtras;
- (BOOL)safari_zipContentsFromDirectory:()SafariNSFileManagerExtras toZipFileURL:error:;
- (id)_safari_libraryDirectoryForHomeDirectory:()SafariNSFileManagerExtras;
- (id)safari_autoFillQuirksDownloadDirectoryURL;
- (id)safari_createDirectoryWithUniqueName:()SafariNSFileManagerExtras relativeToDirectoryFileHandle:error:;
- (id)safari_createTemporaryDirectoryAppropriateForURL:()SafariNSFileManagerExtras error:;
- (id)safari_createTemporaryDirectoryWithTemplate:()SafariNSFileManagerExtras;
- (id)safari_ensureDirectoryExists:()SafariNSFileManagerExtras;
- (id)safari_frameworksDirectoryURLs;
- (id)safari_mobileSafariAppContainerDirectoryURLFromOutsideSafariAppContainer;
- (id)safari_mobileSafariContainerDirectoryURL;
- (id)safari_mobileSafariGroupContainerDirectoryURL;
- (id)safari_moveFileAtSubpath:()SafariNSFileManagerExtras relativeToFileHandle:toUniqueSubpath:relativeToFileHandle:error:;
- (id)safari_moveFileAtSubpath:()SafariNSFileManagerExtras relativeToFileHandle:toUniqueSubpath:relativeToFileHandle:error:usingExistingFileRecoveryBlock:;
- (id)safari_nonContaineredSettingsDirectoryURL;
- (id)safari_passwordsAppContainerDirectoryURL;
- (id)safari_pathWithUniqueFilenameForPath:()SafariNSFileManagerExtras;
- (id)safari_productionSafariSettingsDirectory;
- (id)safari_profileDirectoryURLWithID:()SafariNSFileManagerExtras createIfNeeded:;
- (id)safari_profilesDirectoryURL;
- (id)safari_safariLibraryDirectory;
- (id)safari_settingsDirectoryForHomeDirectory:()SafariNSFileManagerExtras;
- (id)safari_settingsDirectoryForLibraryDirectory:()SafariNSFileManagerExtras;
- (id)safari_settingsDirectoryURL;
- (id)safari_startPageBackgroundImageFileURLForDefaultProfile;
- (id)safari_startPageBackgroundImageFileURLForIdentifier:()SafariNSFileManagerExtras;
- (id)safari_startPageBackgroundImageFolderURL;
- (id)safari_startPageBackgroundImageMobileAssetFolderURL;
- (id)safari_startPageBackgroundImageThumbnailMobileAssetFolderURL;
- (id)safari_subdirectoryWithName:()SafariNSFileManagerExtras inUserDomainOfDirectory:;
- (id)safari_topLevelDirectoriesAtURL:()SafariNSFileManagerExtras;
- (id)safari_webExtensionsSettingsDirectoryURL;
- (uint64_t)_safari_removeFileAtURL:()SafariNSFileManagerExtras onlyIfFileExists:error:;
- (uint64_t)safari_currentProcessIsContainerized;
- (uint64_t)safari_imageExistsAtFileURL:()SafariNSFileManagerExtras;
- (uint64_t)safari_removeContentsOfDirectory:()SafariNSFileManagerExtras;
- (uint64_t)safari_removeFileAtURL:()SafariNSFileManagerExtras error:;
- (uint64_t)safari_removeFileOnlyAtURL:()SafariNSFileManagerExtras error:;
- (void)_safari_getMobileSafariContainerDirectoryURL:()SafariNSFileManagerExtras isContainerized:;
- (void)_safari_getPasswordsAppContainerDirectoryURL:()SafariNSFileManagerExtras isContainerized:;
- (void)safari_removeContentsOfDirectory:()SafariNSFileManagerExtras preservingContainerManagerMetadata:;
- (void)safari_subpathOfURL:()SafariNSFileManagerExtras relativeToDirectoryAtURL:error:;
@end

@implementation NSFileManager(SafariNSFileManagerExtras)

- (id)safari_ensureDirectoryExists:()SafariNSFileManagerExtras
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 path];
  id v14 = 0;
  char v6 = [a1 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v14];
  id v7 = v14;

  if (v6)
  {
    v8 = 0;
  }
  else
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXFileManager();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(v7, "safari_privacyPreservingDescription");
      [(NSFileManager(SafariNSFileManagerExtras) *)v10 safari_ensureDirectoryExists:v9];
    }

    v11 = (id)WBS_LOG_CHANNEL_PREFIXFileManager();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = [v4 path];
      [(NSFileManager(SafariNSFileManagerExtras) *)v12 safari_ensureDirectoryExists:v11];
    }

    v8 = v4;
    id v4 = 0;
  }

  return v4;
}

- (id)safari_settingsDirectoryForLibraryDirectory:()SafariNSFileManagerExtras
{
  v3 = [a3 URLByAppendingPathComponent:@"Safari" isDirectory:1];
  return v3;
}

- (id)safari_safariLibraryDirectory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__NSFileManager_SafariNSFileManagerExtras__safari_safariLibraryDirectory__block_invoke;
  block[3] = &unk_1E6159820;
  block[4] = a1;
  if (-[NSFileManager(SafariNSFileManagerExtras) safari_safariLibraryDirectory]::onceToken != -1) {
    dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) safari_safariLibraryDirectory]::onceToken, block);
  }
  return (id)-[NSFileManager(SafariNSFileManagerExtras) safari_safariLibraryDirectory]::safariLibraryDirectory;
}

- (id)_safari_libraryDirectoryForHomeDirectory:()SafariNSFileManagerExtras
{
  v3 = [a3 URLByAppendingPathComponent:@"Library" isDirectory:1];
  return v3;
}

- (id)safari_startPageBackgroundImageThumbnailMobileAssetFolderURL
{
  v1 = objc_msgSend(a1, "safari_startPageBackgroundImageFolderURL");
  v2 = [v1 URLByAppendingPathComponent:@"MobileAssetBackgroundImageThumbnails" isDirectory:1];

  return v2;
}

- (id)safari_startPageBackgroundImageMobileAssetFolderURL
{
  v1 = objc_msgSend(a1, "safari_startPageBackgroundImageFolderURL");
  v2 = [v1 URLByAppendingPathComponent:@"MobileAssetBackgroundImages" isDirectory:1];

  return v2;
}

- (id)safari_settingsDirectoryURL
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__NSFileManager_SafariNSFileManagerExtras__safari_settingsDirectoryURL__block_invoke;
  block[3] = &unk_1E6159820;
  block[4] = a1;
  if (-[NSFileManager(SafariNSFileManagerExtras) safari_settingsDirectoryURL]::onceToken != -1) {
    dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) safari_settingsDirectoryURL]::onceToken, block);
  }
  return (id)-[NSFileManager(SafariNSFileManagerExtras) safari_settingsDirectoryURL]::settingsDirectory;
}

- (id)safari_startPageBackgroundImageFileURLForDefaultProfile
{
  v1 = objc_msgSend(a1, "safari_startPageBackgroundImageFolderURL");
  v2 = [v1 URLByAppendingPathComponent:@"defaultBackground" isDirectory:0];

  return v2;
}

- (id)safari_startPageBackgroundImageFolderURL
{
  v1 = objc_msgSend(a1, "safari_mobileSafariContainerDirectoryURL");
  v2 = [v1 URLByAppendingPathComponent:@"Library/StartPage" isDirectory:1];

  return v2;
}

- (id)safari_mobileSafariContainerDirectoryURL
{
  id v3 = 0;
  objc_msgSend(a1, "_safari_getMobileSafariContainerDirectoryURL:isContainerized:", &v3, 0);
  id v1 = v3;
  return v1;
}

- (void)_safari_getMobileSafariContainerDirectoryURL:()SafariNSFileManagerExtras isContainerized:
{
  if (-[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::onceToken == -1)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::onceToken, &__block_literal_global_23);
  if (a3) {
LABEL_3:
  }
    *a3 = (id) -[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::containerURL;
LABEL_4:
  if (a4) {
    *a4 = -[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::isContainerized;
  }
}

- (id)safari_autoFillQuirksDownloadDirectoryURL
{
  v0 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/Safari"];
  id v1 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v0 isDirectory:1];

  return v1;
}

- (id)safari_startPageBackgroundImageFileURLForIdentifier:()SafariNSFileManagerExtras
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "safari_startPageBackgroundImageFolderURL");
  char v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:0];

  return v6;
}

- (id)safari_mobileSafariAppContainerDirectoryURLFromOutsideSafariAppContainer
{
  if (-[NSFileManager(SafariNSFileManagerExtras) safari_mobileSafariAppContainerDirectoryURLFromOutsideSafariAppContainer]::onceToken != -1) {
    dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) safari_mobileSafariAppContainerDirectoryURLFromOutsideSafariAppContainer]::onceToken, &__block_literal_global_21);
  }
  v0 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_mobileSafariAppContainerDirectoryURLFromOutsideSafariAppContainer]::containerURL;
  return v0;
}

- (void)_safari_getPasswordsAppContainerDirectoryURL:()SafariNSFileManagerExtras isContainerized:
{
  if (-[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::onceToken == -1)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::onceToken, &__block_literal_global_23);
  if (a3) {
LABEL_3:
  }
    *a3 = (id) -[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::containerURL;
LABEL_4:
  if (a4) {
    *a4 = -[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::isContainerized;
  }
}

- (id)safari_subdirectoryWithName:()SafariNSFileManagerExtras inUserDomainOfDirectory:
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F1CB10];
  v8 = NSSearchPathForDirectoriesInDomains(a4, 1uLL, 1);
  v9 = [v8 objectAtIndex:0];
  v10 = [v7 fileURLWithPath:v9 isDirectory:1];

  v11 = [v10 URLByAppendingPathComponent:v6 isDirectory:1];
  v12 = objc_msgSend(a1, "safari_ensureDirectoryExists:", v11);

  return v12;
}

- (id)safari_passwordsAppContainerDirectoryURL
{
  id v3 = 0;
  objc_msgSend(a1, "_safari_getPasswordsAppContainerDirectoryURL:isContainerized:", &v3, 0);
  id v1 = v3;
  return v1;
}

- (id)safari_mobileSafariGroupContainerDirectoryURL
{
  if (-[NSFileManager(SafariNSFileManagerExtras) safari_mobileSafariGroupContainerDirectoryURL]::onceToken != -1) {
    dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) safari_mobileSafariGroupContainerDirectoryURL]::onceToken, &__block_literal_global_25_1);
  }
  v0 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_mobileSafariGroupContainerDirectoryURL]::containerURL;
  return v0;
}

- (uint64_t)safari_currentProcessIsContainerized
{
  unsigned __int8 v2 = 0;
  objc_msgSend(a1, "_safari_getMobileSafariContainerDirectoryURL:isContainerized:", 0, &v2);
  return v2;
}

- (id)safari_webExtensionsSettingsDirectoryURL
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__NSFileManager_SafariNSFileManagerExtras__safari_webExtensionsSettingsDirectoryURL__block_invoke;
  block[3] = &unk_1E6159820;
  block[4] = a1;
  if (-[NSFileManager(SafariNSFileManagerExtras) safari_webExtensionsSettingsDirectoryURL]::onceToken != -1) {
    dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) safari_webExtensionsSettingsDirectoryURL]::onceToken, block);
  }
  unsigned __int8 v2 = objc_msgSend(a1, "safari_ensureDirectoryExists:", -[NSFileManager(SafariNSFileManagerExtras) safari_webExtensionsSettingsDirectoryURL]::settingsDirectory);
  return v2;
}

- (id)safari_settingsDirectoryForHomeDirectory:()SafariNSFileManagerExtras
{
  unsigned __int8 v2 = objc_msgSend(a1, "_safari_libraryDirectoryForHomeDirectory:");
  id v3 = objc_msgSend(a1, "safari_settingsDirectoryForLibraryDirectory:", v2);

  return v3;
}

- (id)safari_profilesDirectoryURL
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__NSFileManager_SafariNSFileManagerExtras__safari_profilesDirectoryURL__block_invoke;
  block[3] = &unk_1E6159820;
  block[4] = a1;
  if (-[NSFileManager(SafariNSFileManagerExtras) safari_profilesDirectoryURL]::onceToken != -1) {
    dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) safari_profilesDirectoryURL]::onceToken, block);
  }
  return (id)-[NSFileManager(SafariNSFileManagerExtras) safari_profilesDirectoryURL]::profilesDirectory;
}

- (id)safari_profileDirectoryURLWithID:()SafariNSFileManagerExtras createIfNeeded:
{
  id v6 = a3;
  id v7 = objc_msgSend(a1, "safari_profilesDirectoryURL");
  v8 = [v7 URLByAppendingPathComponent:v6];

  if (a4)
  {
    id v9 = (id)objc_msgSend(a1, "safari_ensureDirectoryExists:", v8);
LABEL_4:
    v12 = v8;
    v8 = 0;
    goto LABEL_6;
  }
  v10 = [v8 path];
  char v11 = [a1 fileExistsAtPath:v10];

  if (v11) {
    goto LABEL_4;
  }
  v12 = 0;
LABEL_6:

  return v12;
}

- (id)safari_nonContaineredSettingsDirectoryURL
{
  if (-[NSFileManager(SafariNSFileManagerExtras) safari_nonContaineredSettingsDirectoryURL]::onceToken != -1) {
    dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) safari_nonContaineredSettingsDirectoryURL]::onceToken, &__block_literal_global_40_0);
  }
  v0 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_nonContaineredSettingsDirectoryURL]::nonContaineredSettingsDirectoryURL;
  return v0;
}

- (id)safari_productionSafariSettingsDirectory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__NSFileManager_SafariNSFileManagerExtras__safari_productionSafariSettingsDirectory__block_invoke;
  block[3] = &unk_1E6159820;
  block[4] = a1;
  if (-[NSFileManager(SafariNSFileManagerExtras) safari_productionSafariSettingsDirectory]::settingsDirectoryInitialized != -1) {
    dispatch_once(&-[NSFileManager(SafariNSFileManagerExtras) safari_productionSafariSettingsDirectory]::settingsDirectoryInitialized, block);
  }
  return (id)-[NSFileManager(SafariNSFileManagerExtras) safari_productionSafariSettingsDirectory]::settingsDirectory;
}

- (id)safari_createTemporaryDirectoryWithTemplate:()SafariNSFileManagerExtras
{
  id v4 = a3;
  v5 = NSTemporaryDirectory();
  id v6 = [v5 stringByAppendingPathComponent:v4];
  id v7 = strdup((const char *)[v6 fileSystemRepresentation]);

  if (mkdtemp(v7))
  {
    v8 = [a1 stringWithFileSystemRepresentation:v7 length:strlen(v7)];
    free(v7);
    id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:1];
  }
  else
  {
    free(v7);
    id v9 = 0;
  }

  return v9;
}

- (void)safari_subpathOfURL:()SafariNSFileManagerExtras relativeToDirectoryAtURL:error:
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_msgSend(MEMORY[0x1E4F28CB0], "safari_fileHandleWithURL:options:createMode:error:", v8, 0, 0, a5);
  v10 = objc_msgSend(v9, "safari_fileURL");
  char v11 = [v10 path];

  if (!v11)
  {
    a5 = 0;
    goto LABEL_17;
  }
  v12 = objc_msgSend(MEMORY[0x1E4F28CB0], "safari_fileHandleWithURL:options:createMode:error:", v7, 0, 0, a5);
  v13 = objc_msgSend(v12, "safari_fileURL");
  id v14 = [v13 path];

  if (!v14) {
    goto LABEL_10;
  }
  if ([v14 hasPrefix:v11])
  {
    uint64_t v15 = [v11 length];
    if ([v11 hasSuffix:@"/"])
    {
      uint64_t v16 = [v14 substringFromIndex:v15];
LABEL_15:
      a5 = (void *)v16;
      goto LABEL_16;
    }
    uint64_t v21 = objc_msgSend(v14, "rangeOfString:options:range:", @"/", 8, v15, objc_msgSend(v14, "length") - v15);
    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = [v14 substringFromIndex:v21 + v22];
      goto LABEL_15;
    }
    if (a5)
    {
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F289D0];
      v26[0] = *MEMORY[0x1E4F28568];
      v26[1] = v24;
      v27[0] = @"URL is not a parent of the tested URL";
      v27[1] = v8;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
      v20 = [v23 errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:v19];
      goto LABEL_9;
    }
  }
  else if (a5)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F289D0];
    v28[0] = *MEMORY[0x1E4F28568];
    v28[1] = v18;
    v29[0] = @"URL is not a parent of the tested URL";
    v29[1] = v8;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
    v20 = [v17 errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:v19];
LABEL_9:
    *a5 = v20;

LABEL_10:
    a5 = 0;
  }
LABEL_16:

LABEL_17:
  return a5;
}

- (id)safari_createDirectoryWithUniqueName:()SafariNSFileManagerExtras relativeToDirectoryFileHandle:error:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = [[WBSUniqueFilenameEnumerator alloc] initWithFilename:v7];
  uint64_t v10 = [(WBSUniqueFilenameEnumerator *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v10)
  {
LABEL_15:
    uint64_t v16 = 0;
    goto LABEL_16;
  }
  uint64_t v11 = *(void *)v21;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v9);
      }
      v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      int v14 = objc_msgSend(v8, "fileDescriptor", (void)v20);
      id v15 = v13;
      if (!mkdirat(v14, (const char *)[v15 fileSystemRepresentation], 0x1C0u))
      {
        uint64_t v17 = objc_msgSend(v8, "safari_fileURL");
        uint64_t v16 = [v17 URLByAppendingPathComponent:v15];
LABEL_14:

        goto LABEL_16;
      }
      if (*__error() != 17)
      {
        if (!a5) {
          goto LABEL_15;
        }
        uint64_t v18 = objc_msgSend(v8, "safari_fileURL");
        uint64_t v17 = [v18 URLByAppendingPathComponent:v15];

        _NSErrorWithFilePathAndErrno();
        uint64_t v16 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    uint64_t v10 = [(WBSUniqueFilenameEnumerator *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    uint64_t v16 = 0;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_16:

  return v16;
}

- (id)safari_moveFileAtSubpath:()SafariNSFileManagerExtras relativeToFileHandle:toUniqueSubpath:relativeToFileHandle:error:
{
  id v7 = objc_msgSend(a1, "safari_moveFileAtSubpath:relativeToFileHandle:toUniqueSubpath:relativeToFileHandle:error:usingExistingFileRecoveryBlock:", a3, a4, a5, a6, a7, &__block_literal_global_56);
  return v7;
}

- (id)safari_moveFileAtSubpath:()SafariNSFileManagerExtras relativeToFileHandle:toUniqueSubpath:relativeToFileHandle:error:usingExistingFileRecoveryBlock:
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v49 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = a8;
  v46 = v12;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obj = [[WBSUniqueFilenameEnumerator alloc] initWithFilename:v12];
  uint64_t v15 = [(WBSUniqueFilenameEnumerator *)obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (!v15)
  {
LABEL_21:
    v29 = 0;
    goto LABEL_25;
  }
  uint64_t v16 = *(void *)v51;
  uint64_t v42 = *(void *)v51;
  uint64_t v43 = v15;
  do
  {
    uint64_t v17 = 0;
    while (2)
    {
      if (*(void *)v51 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v44 = v17;
      uint64_t v18 = *(void **)(*((void *)&v50 + 1) + 8 * v17);
      uint64_t v19 = 1;
      do
      {
        int v20 = objc_msgSend(v49, "fileDescriptor", v42);
        id v21 = v48;
        long long v22 = (const char *)[v21 fileSystemRepresentation];
        int v23 = [v13 fileDescriptor];
        id v24 = v18;
        if (!renameatx_np(v20, v22, v23, (const char *)[v24 fileSystemRepresentation], 0x14u))
        {
          objc_msgSend(v13, "safari_fileURL");
          id v30 = (id)objc_claimAutoreleasedReturnValue();
          v29 = [v30 URLByAppendingPathComponent:v24];
LABEL_24:

          goto LABEL_25;
        }
        int v25 = *__error();
        if (v25 != 17)
        {
          if (!a7) {
            goto LABEL_21;
          }
          v31 = objc_msgSend(v49, "safari_fileURL");
          v32 = [v31 URLByAppendingPathComponent:v21];

          v33 = objc_msgSend(v13, "safari_fileURL");
          v34 = [v33 URLByAppendingPathComponent:v24];

          if (v25 == 63)
          {
            size_t v35 = strnlen((const char *)[v24 fileSystemRepresentation], 0x100uLL);
            v36 = v34;
            if (v35 <= 0xFF)
            {
              id v37 = v34;
              if (strnlen((const char *)[v37 fileSystemRepresentation], 0x401uLL) <= 0x400) {
                v36 = v32;
              }
              else {
                v36 = v37;
              }
            }
            id v30 = v36;
          }
          else
          {
            id v30 = 0;
          }
          v38 = [MEMORY[0x1E4F1CA60] dictionary];
          v39 = [v32 path];
          [v38 setObject:v39 forKeyedSubscript:@"NSSourceFilePathErrorKey"];

          v40 = [v34 path];
          [v38 setObject:v40 forKeyedSubscript:@"NSDestinationFilePath"];

          _NSErrorWithFilePathErrnoVariantAndExtraUserInfo();
          *a7 = (id)objc_claimAutoreleasedReturnValue();

          v29 = 0;
          goto LABEL_24;
        }
        v26 = objc_msgSend(v13, "safari_fileURL");
        v27 = [v26 URLByAppendingPathComponent:v24];
        char v28 = v14[2](v14, v24, v27, v19);

        ++v19;
      }
      while ((v28 & 1) != 0);
      uint64_t v17 = v44 + 1;
      uint64_t v16 = v42;
      if (v44 + 1 != v43) {
        continue;
      }
      break;
    }
    v29 = 0;
    uint64_t v43 = [(WBSUniqueFilenameEnumerator *)obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  }
  while (v43);
LABEL_25:

  return v29;
}

- (uint64_t)safari_removeFileAtURL:()SafariNSFileManagerExtras error:
{
  return objc_msgSend(a1, "_safari_removeFileAtURL:onlyIfFileExists:error:", a3, 0, a4);
}

- (uint64_t)safari_removeFileOnlyAtURL:()SafariNSFileManagerExtras error:
{
  return objc_msgSend(a1, "_safari_removeFileAtURL:onlyIfFileExists:error:", a3, 1, a4);
}

- (uint64_t)_safari_removeFileAtURL:()SafariNSFileManagerExtras onlyIfFileExists:error:
{
  id v7 = a3;
  if ([v7 isFileURL])
  {
    id v8 = [v7 path];
    if (unlink((const char *)[v8 fileSystemRepresentation]) && ((a4 & 1) != 0 || *__error() != 2))
    {
      if (a5)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
        uint64_t v9 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:0];
    uint64_t v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)safari_pathWithUniqueFilenameForPath:()SafariNSFileManagerExtras
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 stringByDeletingLastPathComponent];
    id v6 = [v4 lastPathComponent];
    id v7 = objc_msgSend(v6, "safari_filenameByFixingIllegalCharacters");
    id v8 = [v5 stringByAppendingPathComponent:v7];

    uint64_t v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:0];
    uint64_t v10 = objc_msgSend(v9, "safari_URLWithUniqueFilename");
    uint64_t v11 = [v10 path];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)safari_frameworksDirectoryURLs
{
  v0 = [MEMORY[0x1E4F1CA48] array];
  id v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.Safari.Core"];
  unsigned __int8 v2 = [v1 bundleURL];
  id v3 = [v2 URLByDeletingLastPathComponent];
  [v0 addObject:v3];

  id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.SafariServices.framework"];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 bundleURL];
    id v7 = [v6 URLByDeletingLastPathComponent];
    [v0 addObject:v7];
  }
  return v0;
}

- (BOOL)safari_removeDirectoryIfEmpty:()SafariNSFileManagerExtras
{
  return rmdir((const char *)[a3 fileSystemRepresentation]) == 0;
}

- (void)safari_removeContentsOfDirectory:()SafariNSFileManagerExtras preservingContainerManagerMetadata:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  context = (void *)MEMORY[0x1BA9BCF20]();
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __112__NSFileManager_SafariNSFileManagerExtras__safari_removeContentsOfDirectory_preservingContainerManagerMetadata___block_invoke;
  v34[3] = &__block_descriptor_40_e27_B24__0__NSURL_8__NSError_16l;
  v34[4] = a2;
  id v7 = [v6 enumeratorAtURL:v25 includingPropertiesForKeys:0 options:17 errorHandler:v34];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v31;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * v11);
        if (!a4
          || ([*(id *)(*((void *)&v30 + 1) + 8 * v11) lastPathComponent],
              id v13 = objc_claimAutoreleasedReturnValue(),
              char v14 = [v13 isEqualToString:@".com.apple.mobile_container_manager.metadata.plist"],
              v13,
              (v14 & 1) == 0))
        {
          [v5 addObject:v12];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v41 count:16];
    }
    while (v9);
  }

  uint64_t v15 = (id)WBS_LOG_CHANNEL_PREFIXFileManager();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = NSStringFromSelector(a2);
    uint64_t v17 = [v5 count];
    *(_DWORD *)buf = 138543875;
    v36 = v16;
    __int16 v37 = 2048;
    uint64_t v38 = v17;
    __int16 v39 = 2113;
    id v40 = v25;
    _os_log_impl(&dword_1B728F000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: about to remove %zu items from %{private}@", buf, 0x20u);
  }
  uint64_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v19 = dispatch_queue_create("com.apple.Safari.Core.safari_removeContentsOfDirectory", v18);

  size_t v20 = [v5 count];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__NSFileManager_SafariNSFileManagerExtras__safari_removeContentsOfDirectory_preservingContainerManagerMetadata___block_invoke_79;
  block[3] = &unk_1E615B7C8;
  id v27 = v5;
  uint64_t v28 = a1;
  v29 = a2;
  id v21 = v5;
  dispatch_apply(v20, v19, block);
}

- (uint64_t)safari_removeContentsOfDirectory:()SafariNSFileManagerExtras
{
  return objc_msgSend(a1, "safari_removeContentsOfDirectory:preservingContainerManagerMetadata:", a3, 0);
}

- (id)safari_createTemporaryDirectoryAppropriateForURL:()SafariNSFileManagerExtras error:
{
  id v4 = [a1 URLForDirectory:99 inDomain:1 appropriateForURL:a3 create:1 error:a4];
  return v4;
}

- (id)safari_topLevelDirectoriesAtURL:()SafariNSFileManagerExtras
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = *MEMORY[0x1E4F1C628];
  v37[0] = *MEMORY[0x1E4F1C628];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __76__NSFileManager_SafariNSFileManagerExtras__safari_topLevelDirectoriesAtURL___block_invoke;
  void v29[3] = &__block_descriptor_40_e27_B24__0__NSURL_8__NSError_16l;
  v29[4] = a2;
  uint64_t v18 = [v3 enumeratorAtURL:v19 includingPropertiesForKeys:v5 options:1 errorHandler:v29];

  id v21 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v18;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v23 = 0;
        id v24 = 0;
        char v10 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v24, v4, &v23, v18);
        id v11 = v24;
        id v12 = v23;
        if (v12) {
          char v13 = 0;
        }
        else {
          char v13 = v10;
        }
        if (v13)
        {
          if ([v11 BOOLValue]) {
            [v21 addObject:v9];
          }
        }
        else
        {
          char v14 = (id)WBS_LOG_CHANNEL_PREFIXFileManager();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            id v15 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = objc_msgSend(v12, "safari_privacyPreservingDescription");
            *(_DWORD *)buf = 138543875;
            id v31 = v15;
            __int16 v32 = 2113;
            long long v33 = v9;
            __int16 v34 = 2114;
            size_t v35 = v16;
            _os_log_error_impl(&dword_1B728F000, v14, OS_LOG_TYPE_ERROR, "%{public}@: error while getting NSURLIsDirectoryKey resource value for %{private}@: %{public}@", buf, 0x20u);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v36 count:16];
    }
    while (v6);
  }

  return v21;
}

- (BOOL)safari_zipContentsFromDirectory:()SafariNSFileManagerExtras toZipFileURL:error:
{
  v36[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v10 = [v8 path];
  char v11 = [v9 createFileAtPath:v10 contents:0 attributes:0];

  if ((v11 & 1) == 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E4F289A0], -3000, @"Failed to create empty zip file.");
      BOOL v23 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v23 = 0;
    }
    goto LABEL_18;
  }
  v35[0] = @"createPKZip";
  v35[1] = @"sequesterResources";
  v36[0] = MEMORY[0x1E4F1CC38];
  v36[1] = MEMORY[0x1E4F1CC38];
  v35[2] = @"keepParent";
  v35[3] = @"copyResources";
  v36[2] = MEMORY[0x1E4F1CC38];
  v36[3] = MEMORY[0x1E4F1CC38];
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];
  uint64_t v31 = 0;
  __int16 v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v13 = (uint64_t (*)(void))getBOMCopierNewSymbolLoc(void)::ptr;
  __int16 v34 = getBOMCopierNewSymbolLoc(void)::ptr;
  if (!getBOMCopierNewSymbolLoc(void)::ptr)
  {
    char v14 = BomLibrary();
    v32[3] = (uint64_t)dlsym(v14, "BOMCopierNew");
    getBOMCopierNewSymbolLoc(void)::ptr = (_UNKNOWN *)v32[3];
    char v13 = (uint64_t (*)(void))v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v13)
  {
    long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v26 = [NSString stringWithUTF8String:"BOMCopier _SL_BOMCopierNew()"];
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"WBSNSFileManagerExtras.mm", 51, @"%s", dlerror());

    goto LABEL_22;
  }
  uint64_t v15 = v13();
  uint64_t v16 = [v7 fileSystemRepresentation];
  uint64_t v17 = [v8 fileSystemRepresentation];
  uint64_t v31 = 0;
  __int16 v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))getBOMCopierCopyWithOptionsSymbolLoc(void)::ptr;
  __int16 v34 = getBOMCopierCopyWithOptionsSymbolLoc(void)::ptr;
  if (!getBOMCopierCopyWithOptionsSymbolLoc(void)::ptr)
  {
    id v19 = BomLibrary();
    v32[3] = (uint64_t)dlsym(v19, "BOMCopierCopyWithOptions");
    getBOMCopierCopyWithOptionsSymbolLoc(void)::ptr = (_UNKNOWN *)v32[3];
    uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v18)
  {
    long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v28 = objc_msgSend(NSString, "stringWithUTF8String:", "int _SL_BOMCopierCopyWithOptions(BOMCopier, const char *, const char *, CFDictionaryRef)");
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, @"WBSNSFileManagerExtras.mm", 53, @"%s", dlerror());

    goto LABEL_22;
  }
  int v20 = v18(v15, v16, v17, v12);
  uint64_t v31 = 0;
  __int16 v32 = &v31;
  uint64_t v33 = 0x2020000000;
  id v21 = (void (*)(uint64_t))getBOMCopierFreeSymbolLoc(void)::ptr;
  __int16 v34 = getBOMCopierFreeSymbolLoc(void)::ptr;
  if (!getBOMCopierFreeSymbolLoc(void)::ptr)
  {
    long long v22 = BomLibrary();
    v32[3] = (uint64_t)dlsym(v22, "BOMCopierFree");
    getBOMCopierFreeSymbolLoc(void)::ptr = (_UNKNOWN *)v32[3];
    id v21 = (void (*)(uint64_t))v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v21)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v30 = [NSString stringWithUTF8String:"void _SL_BOMCopierFree(BOMCopier)"];
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, @"WBSNSFileManagerExtras.mm", 52, @"%s", dlerror());

LABEL_22:
    __break(1u);
  }
  v21(v15);
  BOOL v23 = v20 == 0;
  if (a5 && v20)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", @"WBSNSFileManagerExtrasBOMCopierErrorDomain", v20, @"Failed to copy contents into zip file.");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_18:
  return v23;
}

- (uint64_t)safari_imageExistsAtFileURL:()SafariNSFileManagerExtras
{
  id v3 = a3;
  if ([v3 isFileURL])
  {
    id v7 = 0;
    [v3 getResourceValue:&v7 forKey:*MEMORY[0x1E4F1C538] error:0];
    id v4 = v7;
    uint64_t v5 = [v4 conformsToType:*MEMORY[0x1E4F44400]];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)safari_ensureDirectoryExists:()SafariNSFileManagerExtras .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1B728F000, log, OS_LOG_TYPE_DEBUG, "Couldn't create directory %@", buf, 0xCu);
}

- (void)safari_ensureDirectoryExists:()SafariNSFileManagerExtras .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Couldn't create directory with error %{public}@", buf, 0xCu);
}

@end