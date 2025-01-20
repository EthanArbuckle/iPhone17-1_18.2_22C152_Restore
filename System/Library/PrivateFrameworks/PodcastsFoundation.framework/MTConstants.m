@interface MTConstants
+ (BOOL)excludeDirectoryFromBackup:(id)a3;
+ (id)_watchManagedAssetsDirectoryURL;
+ (id)alignmentAssetURL;
+ (id)artworkAssetURL;
+ (id)attributesForNewDirectory;
+ (id)cachesDirectory;
+ (id)dataAssetsCacheURL;
+ (id)documentsDirectory;
+ (id)libraryDirectory;
+ (id)managedAssetsDirectoryURL;
+ (id)managedObjectModelDefinitionURL;
+ (id)preferredAssetCacheURL;
+ (id)sharedAssetsCacheURL;
+ (id)sharedCacheDirectory;
+ (id)sharedContainerURL;
+ (id)sharedDocumentsDirectory;
+ (id)shazamSignatureAssetURL;
+ (id)streamedMediaAssetURL;
+ (id)ttmlAssetURL;
+ (void)_repairFilePermissionsIfNeeded;
+ (void)removeExcludeFromBackupFlagFromDirectoryIfNeeded:(id)a3;
+ (void)repairPermissionsOfDirectoryIfNeeded:(id)a3;
@end

@implementation MTConstants

+ (id)managedAssetsDirectoryURL
{
  return (id)[MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/mobile/Media/Podcasts" isDirectory:1];
}

+ (id)ttmlAssetURL
{
  v2 = [a1 preferredAssetCacheURL];
  v3 = [v2 URLByAppendingPathComponent:@"TTML"];

  return v3;
}

+ (id)shazamSignatureAssetURL
{
  v2 = [a1 preferredAssetCacheURL];
  v3 = [v2 URLByAppendingPathComponent:@"ShazamSignatures"];

  return v3;
}

+ (id)alignmentAssetURL
{
  v2 = [a1 preferredAssetCacheURL];
  v3 = [v2 URLByAppendingPathComponent:@"Alignments"];

  return v3;
}

void __46__MTConstants_managedObjectModelDefinitionURL__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [MEMORY[0x1E4F28B50] mainBundle];
    v4 = [MEMORY[0x1E4F28F80] processInfo];
    v5 = [v4 processName];
    v6 = [*(id *)(a1 + 32) path];
    int v7 = 138412802;
    v8 = v3;
    __int16 v9 = 2112;
    v10 = v5;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1AC9D5000, v2, OS_LOG_TYPE_DEFAULT, "%@ [%@] MTConstants reporting managedObjectModelDefinitionURL as %@", (uint8_t *)&v7, 0x20u);
  }
}

void __35__MTConstants_sharedCacheDirectory__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 40) repairPermissionsOfDirectoryIfNeeded:*(void *)(a1 + 32)];
  }
  v2 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [MEMORY[0x1E4F28F80] processInfo];
    v4 = [v3 processName];
    v5 = [*(id *)(a1 + 32) path];
    int v6 = 138412546;
    int v7 = v4;
    __int16 v8 = 2112;
    __int16 v9 = v5;
    _os_log_impl(&dword_1AC9D5000, v2, OS_LOG_TYPE_DEFAULT, "%@ MTConstants reporting sharedCacheDirectory: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __39__MTConstants_sharedDocumentsDirectory__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 40) repairPermissionsOfDirectoryIfNeeded:*(void *)(a1 + 32)];
  }
  v2 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [MEMORY[0x1E4F28F80] processInfo];
    v4 = [v3 processName];
    v5 = [*(id *)(a1 + 32) path];
    int v6 = 138412546;
    int v7 = v4;
    __int16 v8 = 2112;
    __int16 v9 = v5;
    _os_log_impl(&dword_1AC9D5000, v2, OS_LOG_TYPE_DEFAULT, "%@ MTConstants reporting sharedDocumentsDirectory: %@", (uint8_t *)&v6, 0x16u);
  }
}

+ (void)repairPermissionsOfDirectoryIfNeeded:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if (!getuid())
  {
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v6 = [v4 path];
    int v7 = [v5 fileExistsAtPath:v6];

    if (v7)
    {
      __int16 v8 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v4;
        _os_log_impl(&dword_1AC9D5000, v8, OS_LOG_TYPE_DEFAULT, "Checking if file permissions need repairing for %@", buf, 0xCu);
      }

      __int16 v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v10 = [v4 path];
      id v33 = 0;
      __int16 v11 = [v9 attributesOfItemAtPath:v10 error:&v33];
      v12 = v33;

      if (!v11)
      {
        uint64_t v13 = _MTLogCategoryDefault();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v12;
          _os_log_impl(&dword_1AC9D5000, v13, OS_LOG_TYPE_DEFAULT, "Error while reading file attributes: %@", buf, 0xCu);
        }
        goto LABEL_24;
      }
      uint64_t v13 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F28320]];
      v14 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F282E0]];
      v15 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F28318]];
      v16 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F282D8]];
      if (([v15 isEqual:&unk_1F03D7F80] & 1) == 0
        && ([v16 isEqual:&unk_1F03D7F80] & 1) == 0)
      {
        v19 = _MTLogCategoryDefault();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v35 = v13;
          __int16 v36 = 2112;
          v37 = v14;
          _os_log_impl(&dword_1AC9D5000, v19, OS_LOG_TYPE_DEFAULT, "Permissions do not need repair. (File owner: %@, File Group Owner: %@)", buf, 0x16u);
        }
        v23 = v12;
        goto LABEL_23;
      }
      v30 = v16;
      v31 = v15;
      v17 = v14;
      v18 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v4;
        _os_log_impl(&dword_1AC9D5000, v18, OS_LOG_TYPE_DEFAULT, "Attempting to repair file permissions for %@", buf, 0xCu);
      }

      v19 = [a1 attributesForNewDirectory];
      v20 = [MEMORY[0x1E4F28CB8] defaultManager];
      v21 = [v4 path];
      v32 = v12;
      char v22 = [v20 setAttributes:v19 ofItemAtPath:v21 error:&v32];
      v23 = v32;

      v24 = _MTLogCategoryDefault();
      v25 = v24;
      if (v23 || (v22 & 1) == 0)
      {
        v14 = v17;
        v16 = v30;
        v15 = v31;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v23;
          v26 = "Error fixing file permissions: %@";
          v27 = v25;
          os_log_type_t v28 = OS_LOG_TYPE_ERROR;
          uint32_t v29 = 12;
          goto LABEL_18;
        }
      }
      else
      {
        v14 = v17;
        v16 = v30;
        v15 = v31;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v26 = "Successfully repaired file permissions.";
          v27 = v25;
          os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
          uint32_t v29 = 2;
LABEL_18:
          _os_log_impl(&dword_1AC9D5000, v27, v28, v26, buf, v29);
        }
      }

LABEL_23:
      v12 = v23;
LABEL_24:
    }
  }
}

void __33__MTConstants_sharedContainerURL__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [MEMORY[0x1E4F28F80] processInfo];
    v4 = [v3 processName];
    v5 = [*(id *)(a1 + 32) path];
    int v6 = 138412546;
    int v7 = v4;
    __int16 v8 = 2112;
    __int16 v9 = v5;
    _os_log_impl(&dword_1AC9D5000, v2, OS_LOG_TYPE_DEFAULT, "%@ MTConstants reporting sharedContainerURL: %@", (uint8_t *)&v6, 0x16u);
  }
}

+ (id)artworkAssetURL
{
  v2 = [a1 preferredAssetCacheURL];
  v3 = [v2 URLByAppendingPathComponent:@"Artwork"];

  return v3;
}

+ (id)preferredAssetCacheURL
{
  v3 = [a1 sharedAssetsCacheURL];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [a1 dataAssetsCacheURL];
  }
  int v6 = v5;

  return v6;
}

+ (id)sharedAssetsCacheURL
{
  v2 = [a1 sharedCacheDirectory];
  v3 = [v2 URLByAppendingPathComponent:@"Assets"];

  return v3;
}

+ (id)documentsDirectory
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = [v2 URLsForDirectory:9 inDomains:1];
  v4 = [v3 lastObject];

  return v4;
}

+ (id)sharedDocumentsDirectory
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [a1 sharedContainerURL];
  v4 = [v3 URLByAppendingPathComponent:@"Documents" isDirectory:1];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v4 path];
  char v7 = [v5 fileExistsAtPath:v6];

  id v8 = 0;
  if (v4 && (v7 & 1) == 0)
  {
    __int16 v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v10 = [a1 attributesForNewDirectory];
    id v20 = 0;
    char v7 = [v9 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:v10 error:&v20];
    id v8 = v20;
  }
  if (!v4 || v8)
  {
    __int16 v11 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_1AC9D5000, v11, OS_LOG_TYPE_ERROR, "Error retrieving shared documents directory: %@", buf, 0xCu);
    }
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __39__MTConstants_sharedDocumentsDirectory__block_invoke;
  v16[3] = &unk_1E5E61FF8;
  char v19 = v7;
  id v18 = a1;
  id v12 = v4;
  id v17 = v12;
  if (sharedDocumentsDirectory_onceToken != -1) {
    dispatch_once(&sharedDocumentsDirectory_onceToken, v16);
  }
  uint64_t v13 = v17;
  id v14 = v12;

  return v14;
}

+ (id)sharedCacheDirectory
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [v3 containerURLForSecurityApplicationGroupIdentifier:@"243LU875E5.groups.com.apple.podcasts"];

  id v5 = [v4 URLByAppendingPathComponent:@"Cache" isDirectory:1];
  if (v5)
  {
    int v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v7 = [v5 path];
    char v8 = [v6 fileExistsAtPath:v7];

    if (v8)
    {
      id v9 = 0;
      goto LABEL_6;
    }
    __int16 v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v12 = [a1 attributesForNewDirectory];
    id v23 = 0;
    int v13 = [v11 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:v12 error:&v23];
    id v9 = v23;

    if (v13)
    {
LABEL_6:
      [(id)objc_opt_class() excludeDirectoryFromBackup:v5];
      char v10 = 1;
      if (!v9) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
    char v10 = 0;
    if (!v9) {
      goto LABEL_12;
    }
  }
  else
  {
    char v10 = 0;
    id v9 = 0;
  }
LABEL_9:
  id v14 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v9;
    _os_log_impl(&dword_1AC9D5000, v14, OS_LOG_TYPE_ERROR, "Error retrieving shared cache directory: %@", buf, 0xCu);
  }

LABEL_12:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __35__MTConstants_sharedCacheDirectory__block_invoke;
  v19[3] = &unk_1E5E61FF8;
  char v22 = v10;
  id v21 = a1;
  id v15 = v5;
  id v20 = v15;
  if (sharedCacheDirectory_onceToken != -1) {
    dispatch_once(&sharedCacheDirectory_onceToken, v19);
  }
  v16 = v20;
  id v17 = v15;

  return v17;
}

+ (id)libraryDirectory
{
  v2 = [a1 cachesDirectory];
  v3 = [v2 URLByDeletingLastPathComponent];

  return v3;
}

+ (id)cachesDirectory
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = [v2 URLsForDirectory:13 inDomains:1];
  v4 = [v3 lastObject];

  return v4;
}

+ (BOOL)excludeDirectoryFromBackup:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F1C630];
  id v9 = 0;
  char v5 = [v3 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v4 error:&v9];
  id v6 = v9;
  if ((v5 & 1) == 0)
  {
    char v7 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_1AC9D5000, v7, OS_LOG_TYPE_ERROR, "Error excluding %@ from backup %@", buf, 0x16u);
    }
  }
  return v5;
}

+ (id)sharedContainerURL
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [v2 containerURLForSecurityApplicationGroupIdentifier:@"243LU875E5.groups.com.apple.podcasts"];

  if (!v3)
  {
    id v12 = 0;
    uint64_t v4 = [MEMORY[0x1E4F223F8] bundleRecordWithApplicationIdentifier:@"com.apple.podcasts" error:&v12];
    id v5 = v12;
    if (v5)
    {
      id v6 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v14 = @"com.apple.podcasts";
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_impl(&dword_1AC9D5000, v6, OS_LOG_TYPE_ERROR, "Error creating bundle record with identifier %@: %@", buf, 0x16u);
      }
    }
    char v7 = [v4 groupContainerURLs];
    id v3 = [v7 objectForKey:@"243LU875E5.groups.com.apple.podcasts"];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33__MTConstants_sharedContainerURL__block_invoke;
  v10[3] = &unk_1E5E611F0;
  id v8 = v3;
  id v11 = v8;
  if (sharedContainerURL_onceToken != -1) {
    dispatch_once(&sharedContainerURL_onceToken, v10);
  }

  return v8;
}

+ (id)managedObjectModelDefinitionURL
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 URLForResource:@"MTLibrary" withExtension:@"momd"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MTConstants_managedObjectModelDefinitionURL__block_invoke;
  block[3] = &unk_1E5E611F0;
  id v4 = v3;
  id v7 = v4;
  if (managedObjectModelDefinitionURL_onceToken != -1) {
    dispatch_once(&managedObjectModelDefinitionURL_onceToken, block);
  }

  return v4;
}

+ (void)_repairFilePermissionsIfNeeded
{
  id v5 = [a1 sharedContainerURL];
  id v3 = [v5 URLByAppendingPathComponent:@"Documents" isDirectory:1];
  [a1 repairPermissionsOfDirectoryIfNeeded:v3];
  id v4 = [v5 URLByAppendingPathComponent:@"Cache" isDirectory:1];
  [a1 repairPermissionsOfDirectoryIfNeeded:v4];
}

+ (id)attributesForNewDirectory
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F282E0];
  v5[0] = *MEMORY[0x1E4F28320];
  v5[1] = v2;
  v6[0] = @"mobile";
  v6[1] = @"mobile";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

+ (void)removeExcludeFromBackupFlagFromDirectoryIfNeeded:(id)a3
{
  id v3 = a3;
  if (+[PFClientUtil isPodcastsApp])
  {
    id v4 = dispatch_get_global_queue(-2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__MTConstants_removeExcludeFromBackupFlagFromDirectoryIfNeeded___block_invoke;
    block[3] = &unk_1E5E611F0;
    id v6 = v3;
    dispatch_async(v4, block);
  }
}

void __64__MTConstants_removeExcludeFromBackupFlagFromDirectoryIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4F1C630];
  id v14 = 0;
  int v4 = [v2 setResourceValue:MEMORY[0x1E4F1CC28] forKey:v3 error:&v14];
  id v5 = v14;
  id v6 = _MTLogCategoryDefault();
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v8;
      id v9 = "Removed 'NSURLIsExcludedFromBackupKey' flag from cache directory %@";
      char v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1AC9D5000, v10, v11, v9, buf, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    id v18 = v5;
    id v9 = "Unable to remove extended attributed for %@ - %@";
    char v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

+ (id)dataAssetsCacheURL
{
  uint64_t v2 = [a1 cachesDirectory];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Assets"];

  return v3;
}

+ (id)streamedMediaAssetURL
{
  uint64_t v2 = [a1 preferredAssetCacheURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"StreamedMedia"];

  return v3;
}

+ (id)_watchManagedAssetsDirectoryURL
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 sharedCacheDirectory];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"Episodes" isDirectory:1];

  int v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [v3 path];
  char v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v7 = 0;
    goto LABEL_4;
  }
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v17 = 0;
  int v9 = [v8 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v17];
  id v7 = v17;

  if (v9)
  {
LABEL_4:
    if (!v7) {
      goto LABEL_8;
    }
  }
  char v10 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v7;
    _os_log_impl(&dword_1AC9D5000, v10, OS_LOG_TYPE_ERROR, "Error retrieving managed assets directory: %@", buf, 0xCu);
  }

LABEL_8:
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__MTConstants__watchManagedAssetsDirectoryURL__block_invoke;
  v15[3] = &unk_1E5E611F0;
  id v11 = v3;
  id v16 = v11;
  if (_watchManagedAssetsDirectoryURL_onceToken != -1) {
    dispatch_once(&_watchManagedAssetsDirectoryURL_onceToken, v15);
  }
  uint32_t v12 = v16;
  id v13 = v11;

  return v13;
}

void __46__MTConstants__watchManagedAssetsDirectoryURL__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [MEMORY[0x1E4F28F80] processInfo];
    int v4 = [v3 processName];
    id v5 = [*(id *)(a1 + 32) path];
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2112;
    int v9 = v5;
    _os_log_impl(&dword_1AC9D5000, v2, OS_LOG_TYPE_DEFAULT, "%@ MTConstants reporting managed assets directory: %@", (uint8_t *)&v6, 0x16u);
  }
}

@end