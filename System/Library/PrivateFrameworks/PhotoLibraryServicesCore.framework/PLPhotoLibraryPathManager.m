@interface PLPhotoLibraryPathManager
+ (BOOL)bundleScopeShouldBePersistedForRebuild:(unsigned __int16)a3;
+ (BOOL)ignoreFilesystemCheckForWellKnownPhotoLibraryIdentifier:(int64_t)a3;
+ (BOOL)isMultiLibraryModeEnabled;
+ (BOOL)isSystemPhotoLibraryURL:(id)a3;
+ (BOOL)setSystemLibraryURL:(id)a3 options:(unsigned __int16)a4 error:(id *)a5;
+ (BOOL)shouldAutoUpgradeWellKnownPhotoLibraryIdentifier:(int64_t)a3;
+ (BOOL)shouldProcessHighlightsForWellKnownPhotoLibraryIdentifier:(int64_t)a3;
+ (id)allPhotosPathsOnThisDevice;
+ (id)libraryURLFromDatabaseURL:(id)a3;
+ (id)managedPathWithUuid:(const char *)a3 base:(const char *)a4 fileMarker:(const char *)a5 extension:(const char *)a6;
+ (id)photosLibraryExtension;
+ (id)rootURLForPhotoLibraryDomain:(int64_t)a3;
+ (id)systemLibraryBaseDirectory;
+ (id)systemLibraryPathManager;
+ (id)systemLibraryURL;
+ (id)wellKnownPhotoLibraryURLForIdentifier:(int64_t)a3;
+ (int64_t)wellKnownPhotoLibraryIdentifierForURL:(id)a3;
+ (unint64_t)libraryCreateOptionsForWellKnownLibraryIdentifier:(int64_t)a3;
+ (void)assertSingleLibraryMode;
+ (void)enableMultiLibraryMode;
+ (void)throwMultiLibraryAPIMisuse;
+ (void)throwMultiLibraryAPIMisuseForLibraryPath:(id)a3;
- (BOOL)isDCIM;
- (BOOL)isUBF;
- (NSString)description;
- (PLPhotoLibraryPathManager)init;
- (PLPhotoLibraryPathManager)initWithBaseDirectory:(id)a3;
- (PLPhotoLibraryPathManager)initWithLibraryURL:(id)a3;
- (PLPhotoLibraryPathManager)initWithLibraryURL:(id)a3 bundleScope:(unsigned __int16)a4;
- (PLPhotoLibraryPathManager)initWithLibraryURL:(id)a3 bundleScope:(unsigned __int16)a4 libraryFormat:(unsigned __int8)a5;
- (id)_commonPathsToExcludeFromTimeMachineAndICloudBackups;
- (id)_existingPrivateCacheDirectoriesToExclude;
- (id)_pathsToExcludeFromAllBackups;
- (id)_pathsToExcludeFromICloudBackups;
- (id)_pathsToExcludeFromICloudBackupsWithICPLEnabled;
- (id)_pathsToExcludeFromTimeMachineBackups;
- (id)_pathsToExplicitlyIncludeInAllBackups;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)rebuildHistoryFilePath;
- (id)redactedDescription;
- (id)sqliteErrorIndicatorFilePath;
- (unsigned)_bundleFormatFromLibraryURL:(id)a3 libraryFormat:(unsigned __int8)a4;
- (unsigned)bundleScope;
- (void)resetBackupExclusionPathsForBackupType:(int64_t)a3;
- (void)setBackupExclusionAttributesForWellKnownLibrariesOrWithCreateOptions:(unint64_t)a3 andBackupType:(int64_t)a4;
- (void)setOrCompareLibraryURL:(id)a3;
- (void)updateBackupExclusionPathsForBackupType:(int64_t)a3;
@end

@implementation PLPhotoLibraryPathManager

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_internalPathManager;
}

- (BOOL)isUBF
{
  return self->_format == 2;
}

- (unsigned)bundleScope
{
  return [(PLPhotoLibraryPathManagerCore *)self->_internalPathManager bundleScope];
}

+ (id)systemLibraryPathManager
{
  v3 = [PLPhotoLibraryPathManager alloc];
  v4 = [a1 systemLibraryURL];
  v5 = [(PLPhotoLibraryPathManager *)v3 initWithLibraryURL:v4];

  return v5;
}

- (PLPhotoLibraryPathManager)initWithLibraryURL:(id)a3 bundleScope:(unsigned __int16)a4
{
  return [(PLPhotoLibraryPathManager *)self initWithLibraryURL:a3 bundleScope:a4 libraryFormat:0];
}

- (PLPhotoLibraryPathManager)initWithLibraryURL:(id)a3
{
  return [(PLPhotoLibraryPathManager *)self initWithLibraryURL:a3 bundleScope:0];
}

+ (id)systemLibraryURL
{
  return +[PLPhotoLibraryPathManagerCore systemLibraryURL];
}

- (PLPhotoLibraryPathManager)initWithLibraryURL:(id)a3 bundleScope:(unsigned __int16)a4 libraryFormat:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v9 = a3;
  if (!v9)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLPhotoLibraryPathManagerImpl.m", 81, @"Invalid parameter not satisfying: %@", @"libraryURL" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)PLPhotoLibraryPathManager;
  v10 = [(PLPhotoLibraryPathManager *)&v25 init];
  v11 = v10;
  if (v10)
  {
    [(PLPhotoLibraryPathManager *)v10 setOrCompareLibraryURL:v9];
    int v12 = [(PLPhotoLibraryPathManager *)v11 _bundleFormatFromLibraryURL:v9 libraryFormat:v5];
    v11->_format = v12;
    if (v12 == 2)
    {
      v13 = [[PLPhotoLibraryPathManagerUBF alloc] initWithLibraryURL:v9 bundleScope:0];
      internalPathManager = v11->_internalPathManager;
      v11->_internalPathManager = &v13->super;

      if (!v6) {
        goto LABEL_9;
      }
      v15 = [(PLPhotoLibraryPathManager *)v11 photoDirectoryWithType:[(PLPhotoLibraryPathManagerCore *)v11->_internalPathManager photoLibraryPathTypeForBundleScope:v6]];
      v16 = [PLPhotoLibraryPathManagerUBF alloc];
      v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15 isDirectory:1];
      uint64_t v18 = [(PLPhotoLibraryPathManagerUBF *)v16 initWithLibraryURL:v17 bundleScope:v6];
      v19 = v11->_internalPathManager;
      v11->_internalPathManager = (PLPhotoLibraryPathManagerCore *)v18;
    }
    else
    {
      v20 = [[PLPhotoLibraryPathManagerDCIM alloc] initWithLibraryURL:v9 bundleScope:0];
      v21 = v11->_internalPathManager;
      v11->_internalPathManager = &v20->super;

      v15 = [[PLImportFileManager alloc] initWithPathManager:v11];
      [(PLPhotoLibraryPathManagerCore *)v11->_internalPathManager setImportFileManager:v15];
    }

LABEL_9:
    if (!v11->_internalPathManager)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, v11, @"PLPhotoLibraryPathManagerImpl.m", 102, @"Failed to create a valid path manager for url: %@", v9 object file lineNumber description];
    }
  }

  return v11;
}

- (void)setOrCompareLibraryURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  unsigned __int8 v6 = atomic_load(sMultiLibraryMode);
  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E4F1CB10];
    v8 = [v4 path];
    id v17 = [v7 fileURLWithPath:v8 isDirectory:1];

    os_unfair_lock_lock(&sSingletonPhotoLibraryPathLock);
    id WeakRetained = objc_loadWeakRetained(&sSingletonPhotoLibraryPath);
    if (WeakRetained)
    {
      int v10 = PLIsUBFOnDCIMLibraryURLForSingletonLibraryPath(v17, WeakRetained);
      v11 = [v17 path];
      char v12 = [v11 isEqualToString:WeakRetained];

      if ((v12 & 1) == 0 && !v10)
      {
        os_unfair_lock_unlock(&sSingletonPhotoLibraryPathLock);
        v13 = objc_opt_class();
        v14 = [v17 path];
        [v13 throwMultiLibraryAPIMisuseForLibraryPath:v14];

LABEL_10:
        id v4 = v17;
        goto LABEL_11;
      }
      objc_storeStrong((id *)&self->_singletonPhotoLibraryPath, WeakRetained);
    }
    else
    {
      v15 = [v17 path];
      singletonPhotoLibraryPath = self->_singletonPhotoLibraryPath;
      self->_singletonPhotoLibraryPath = v15;
    }
    objc_storeWeak(&sSingletonPhotoLibraryPath, self->_singletonPhotoLibraryPath);
    os_unfair_lock_unlock(&sSingletonPhotoLibraryPathLock);
    goto LABEL_10;
  }
LABEL_11:
}

- (unsigned)_bundleFormatFromLibraryURL:(id)a3 libraryFormat:(unsigned __int8)a4
{
  int v4 = a4;
  id v5 = a3;
  if (v4 != 2 && v4 != 1)
  {
    if (v4)
    {
      LOBYTE(v4) = 0;
    }
    else if ([(id)objc_opt_class() isSystemPhotoLibraryURL:v5])
    {
      if (PLMobileSlideShowPhotoLibraryTestingMode_onceToken != -1) {
        dispatch_once(&PLMobileSlideShowPhotoLibraryTestingMode_onceToken, &__block_literal_global_3810);
      }
      if (PLMobileSlideShowPhotoLibraryTestingMode_sMobileSlideShowPhotoLibraryTestingMode == 2) {
        LOBYTE(v4) = 2;
      }
      else {
        LOBYTE(v4) = 1;
      }
    }
    else
    {
      LOBYTE(v4) = 2;
    }
  }

  return v4;
}

+ (BOOL)isSystemPhotoLibraryURL:(id)a3
{
  return +[PLPhotoLibraryPathManagerCore isSystemPhotoLibraryURL:a3];
}

+ (void)assertSingleLibraryMode
{
  if ([a1 isMultiLibraryModeEnabled])
  {
    [a1 throwMultiLibraryAPIMisuse];
  }
}

+ (BOOL)isMultiLibraryModeEnabled
{
  unsigned __int8 v2 = atomic_load(sMultiLibraryMode);
  return v2 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singletonPhotoLibraryPath, 0);
  objc_storeStrong((id *)&self->_internalPathManager, 0);
}

+ (int64_t)wellKnownPhotoLibraryIdentifierForURL:(id)a3
{
  return +[PLPhotoLibraryPathManagerCore wellKnownPhotoLibraryIdentifierForURL:a3];
}

+ (void)enableMultiLibraryMode
{
  if ((atomic_exchange((atomic_uchar *volatile)sMultiLibraryMode, 1u) & 1) == 0)
  {
    sMultiLibraryModeEnablingCallStack = [MEMORY[0x1E4F29060] callStackSymbols];
    MEMORY[0x1F41817F8]();
  }
}

- (id)sqliteErrorIndicatorFilePath
{
  unsigned __int8 v2 = [(PLPhotoLibraryPathManager *)self photoDirectoryWithType:2];
  v3 = [v2 stringByAppendingPathComponent:@"sqliteerror"];

  return v3;
}

- (id)rebuildHistoryFilePath
{
  unsigned __int8 v2 = [(PLPhotoLibraryPathManager *)self photoDirectoryWithType:2];
  v3 = [v2 stringByAppendingPathComponent:@"rebuildHistory"];

  return v3;
}

- (void)setBackupExclusionAttributesForWellKnownLibrariesOrWithCreateOptions:(unint64_t)a3 andBackupType:(int64_t)a4
{
  char v5 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(PLPhotoLibraryPathManager *)self isUBF])
  {
    id v24 = 0;
    int v7 = [(PLPhotoLibraryPathManager *)self createPathsForNewLibrariesWithError:&v24];
    id v8 = v24;
    if (!v7)
    {
LABEL_21:

      return;
    }
    id v9 = objc_opt_class();
    int v10 = [(PLPhotoLibraryPathManager *)self libraryURL];
    uint64_t v11 = [v9 wellKnownPhotoLibraryIdentifierForURL:v10];

    if (v11)
    {
      if (+[PLPhotoLibraryPathManagerCore backupSupportedForWellKnownLibraryIdentifier:v11])
      {
        goto LABEL_15;
      }
    }
    else
    {
      char v12 = objc_opt_class();
      v13 = [(PLPhotoLibraryPathManager *)self libraryURL];
      int v14 = [v12 isSystemPhotoLibraryURL:v13];

      if ((v5 & 0x20) != 0 || v14)
      {
LABEL_15:
        [(PLPhotoLibraryPathManager *)self resetBackupExclusionPathsForBackupType:a4];
        v19 = [(PLPhotoLibraryPathManager *)self libraryURL];
        id v23 = 0;
        BOOL v20 = +[PLPhotoLibraryPathManagerCore setTimeMachineExclusionAttribute:0 url:v19 error:&v23];
        id v17 = v23;

        if (!v20)
        {
          uint64_t v18 = PLLibraryServicesGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v17;
            goto LABEL_18;
          }
          goto LABEL_19;
        }
        goto LABEL_20;
      }
    }
    v15 = [(PLPhotoLibraryPathManager *)self libraryURL];
    id v22 = 0;
    BOOL v16 = +[PLPhotoLibraryPathManagerCore setTimeMachineExclusionAttribute:1 url:v15 error:&v22];
    id v17 = v22;

    if (!v16)
    {
      uint64_t v18 = PLLibraryServicesGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v17;
LABEL_18:
        _os_log_impl(&dword_19BCFB000, v18, OS_LOG_TYPE_ERROR, "Failed to set the backup exclusion marker for the library bundle. Error: %@", buf, 0xCu);
      }
LABEL_19:
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!a4)
  {
    id v21 = [(PLPhotoLibraryPathManager *)self _existingPrivateCacheDirectoriesToExclude];
    [v21 enumerateObjectsUsingBlock:&__block_literal_global_7855];
  }
}

void __112__PLPhotoLibraryPathManager_setBackupExclusionAttributesForWellKnownLibrariesOrWithCreateOptions_andBackupType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2 isDirectory:1];
  id v7 = 0;
  BOOL v4 = +[PLPhotoLibraryPathManagerCore setTimeMachineExclusionAttribute:1 url:v3 error:&v7];
  id v5 = v7;
  if (!v4)
  {
    unsigned __int8 v6 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v9 = v2;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Failed to set backup exclusion marker [DCIM private caches], path: %@, error: %@", buf, 0x16u);
    }
  }
}

- (void)updateBackupExclusionPathsForBackupType:(int64_t)a3
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__7860;
  v7[4] = __Block_byref_object_dispose__7861;
  id v8 = 0;
  switch(a3)
  {
    case 3:
      v3 = [(PLPhotoLibraryPathManager *)self _pathsToExcludeFromICloudBackupsWithICPLEnabled];
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __69__PLPhotoLibraryPathManager_updateBackupExclusionPathsForBackupType___block_invoke_62;
      v4[3] = &unk_1E58A1008;
      v4[4] = v7;
      [v3 enumerateObjectsUsingBlock:v4];
      goto LABEL_7;
    case 2:
      v3 = [(PLPhotoLibraryPathManager *)self _pathsToExcludeFromICloudBackups];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __69__PLPhotoLibraryPathManager_updateBackupExclusionPathsForBackupType___block_invoke_61;
      v5[3] = &unk_1E58A1008;
      v5[4] = v7;
      [v3 enumerateObjectsUsingBlock:v5];
      goto LABEL_7;
    case 1:
      v3 = [(PLPhotoLibraryPathManager *)self _pathsToExcludeFromTimeMachineBackups];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __69__PLPhotoLibraryPathManager_updateBackupExclusionPathsForBackupType___block_invoke;
      v6[3] = &unk_1E58A1008;
      v6[4] = v7;
      [v3 enumerateObjectsUsingBlock:v6];
LABEL_7:

      break;
  }
  _Block_object_dispose(v7, 8);
}

void __69__PLPhotoLibraryPathManager_updateBackupExclusionPathsForBackupType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v5 + 40);
  BOOL v6 = +[PLPhotoLibraryPathManagerCore setTimeMachineExclusionAttribute:1 url:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (!v6)
  {
    id v7 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Failed to set backup exclusion marker [time-machine], path: %@, error: %@", buf, 0x16u);
    }
  }
}

void __69__PLPhotoLibraryPathManager_updateBackupExclusionPathsForBackupType___block_invoke_61(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v5 + 40);
  BOOL v6 = +[PLPhotoLibraryPathManagerCore setICloudBackupExclusionAttribute:1 url:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (!v6)
  {
    id v7 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Failed to set backup exclusion marker [iCloud], path: %@, error: %@", buf, 0x16u);
    }
  }
}

void __69__PLPhotoLibraryPathManager_updateBackupExclusionPathsForBackupType___block_invoke_62(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v5 + 40);
  BOOL v6 = +[PLPhotoLibraryPathManagerCore setICloudBackupExclusionAttribute:1 url:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (!v6)
  {
    id v7 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Failed to set backup exclusion marker [iCloud-iCPL-enabled], path: %@, error: %@", buf, 0x16u);
    }
  }
}

- (void)resetBackupExclusionPathsForBackupType:(int64_t)a3
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__7860;
  v12[4] = __Block_byref_object_dispose__7861;
  id v13 = 0;
  uint64_t v5 = [(PLPhotoLibraryPathManager *)self _pathsToExcludeFromAllBackups];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PLPhotoLibraryPathManager_resetBackupExclusionPathsForBackupType___block_invoke;
  v11[3] = &unk_1E58A1008;
  v11[4] = v12;
  [v5 enumerateObjectsUsingBlock:v11];

  BOOL v6 = [(PLPhotoLibraryPathManager *)self _pathsToExplicitlyIncludeInAllBackups];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PLPhotoLibraryPathManager_resetBackupExclusionPathsForBackupType___block_invoke_58;
  v10[3] = &unk_1E58A1008;
  v10[4] = v12;
  [v6 enumerateObjectsUsingBlock:v10];

  if (a3 == 2)
  {
    id v7 = [(PLPhotoLibraryPathManager *)self _pathsToExcludeFromICloudBackupsWithICPLEnabled];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__PLPhotoLibraryPathManager_resetBackupExclusionPathsForBackupType___block_invoke_59;
    v9[3] = &unk_1E58A1008;
    v9[4] = v12;
    [v7 enumerateObjectsUsingBlock:v9];
    goto LABEL_5;
  }
  if (a3 == 3)
  {
    id v7 = [(PLPhotoLibraryPathManager *)self _pathsToExcludeFromICloudBackups];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__PLPhotoLibraryPathManager_resetBackupExclusionPathsForBackupType___block_invoke_60;
    v8[3] = &unk_1E58A1008;
    v8[4] = v12;
    [v7 enumerateObjectsUsingBlock:v8];
LABEL_5:
  }
  [(PLPhotoLibraryPathManager *)self updateBackupExclusionPathsForBackupType:a3];
  _Block_object_dispose(v12, 8);
}

void __68__PLPhotoLibraryPathManager_resetBackupExclusionPathsForBackupType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v5 + 40);
  BOOL v6 = +[PLPhotoLibraryPathManagerCore setTimeMachineExclusionAttribute:1 url:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (!v6)
  {
    id v7 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Failed to set backup exclusion marker [all], path: %@, error: %@", buf, 0x16u);
    }
  }
}

void __68__PLPhotoLibraryPathManager_resetBackupExclusionPathsForBackupType___block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v5 + 40);
  BOOL v6 = +[PLPhotoLibraryPathManagerCore setTimeMachineExclusionAttribute:0 url:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (!v6)
  {
    id v7 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      id v16 = v3;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Failed to clear backup exclusion marker [include], path: %@, error: %@", buf, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v13 = *(id *)(v9 + 40);
  BOOL v10 = +[PLPhotoLibraryPathManagerCore setICloudBackupExclusionAttribute:0 url:v4 error:&v13];
  objc_storeStrong((id *)(v9 + 40), v13);
  if (!v10)
  {
    id v11 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      id v16 = v3;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl(&dword_19BCFB000, v11, OS_LOG_TYPE_ERROR, "Failed to clear backup backup exclusion marker [include], path: %@, error: %@", buf, 0x16u);
    }
  }
}

void __68__PLPhotoLibraryPathManager_resetBackupExclusionPathsForBackupType___block_invoke_59(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v5 + 40);
  BOOL v6 = +[PLPhotoLibraryPathManagerCore setICloudBackupExclusionAttribute:0 url:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (!v6)
  {
    id v7 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Failed to clear backup exclusion marker [iCloud], path: %@, error: %@", buf, 0x16u);
    }
  }
}

void __68__PLPhotoLibraryPathManager_resetBackupExclusionPathsForBackupType___block_invoke_60(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v5 + 40);
  BOOL v6 = +[PLPhotoLibraryPathManagerCore setICloudBackupExclusionAttribute:0 url:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (!v6)
  {
    id v7 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Failed to clear backup exclusion marker [iCloud-iCPL-enabled], path: %@, error: %@", buf, 0x16u);
    }
  }
}

- (id)_pathsToExplicitlyIncludeInAllBackups
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v4 = [(PLPhotoLibraryPathManager *)self photoDirectoryWithType:13];
  [v3 addObject:v4];

  uint64_t v5 = [(PLPhotoLibraryPathManager *)self photoDirectoryWithType:27];
  [v3 addObject:v5];

  return v3;
}

- (id)_pathsToExcludeFromICloudBackupsWithICPLEnabled
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v4 = [(PLPhotoLibraryPathManager *)self photoDirectoryWithType:2 createIfNeeded:1 error:0];
  [v3 addObject:v4];

  uint64_t v5 = [(PLPhotoLibraryPathManager *)self photoDirectoryWithType:4 createIfNeeded:1 error:0];
  [v3 addObject:v5];

  BOOL v6 = [(PLPhotoLibraryPathManager *)self photoDirectoryWithType:7 createIfNeeded:1 error:0];
  [v3 addObject:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PLPhotoLibraryPathManager__pathsToExcludeFromICloudBackupsWithICPLEnabled__block_invoke;
  v10[3] = &unk_1E58A0FE0;
  id v7 = v3;
  id v11 = v7;
  __int16 v12 = self;
  [(PLPhotoLibraryPathManager *)self enumerateBundleScopesWithBlock:v10];
  id v8 = v7;

  return v8;
}

void __76__PLPhotoLibraryPathManager__pathsToExcludeFromICloudBackupsWithICPLEnabled__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1)
  {
    BOOL v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) photoDirectoryWithType:a3 createIfNeeded:1 error:0];
    [v4 addObject:v5];
  }
}

- (id)_pathsToExcludeFromICloudBackups
{
  uint64_t v3 = [(PLPhotoLibraryPathManager *)self _commonPathsToExcludeFromTimeMachineAndICloudBackups];
  BOOL v4 = [(PLPhotoLibraryPathManager *)self photoDirectoryWithType:10 createIfNeeded:1 error:0];
  [v3 addObject:v4];

  return v3;
}

- (id)_pathsToExcludeFromTimeMachineBackups
{
  uint64_t v3 = [(PLPhotoLibraryPathManager *)self _commonPathsToExcludeFromTimeMachineAndICloudBackups];
  BOOL v4 = [(PLPhotoLibraryPathManager *)self photoDirectoryWithType:11 createIfNeeded:1 error:0];
  [v3 addObject:v4];

  return v3;
}

- (id)_commonPathsToExcludeFromTimeMachineAndICloudBackups
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v4 = [(PLPhotoLibraryPathManager *)self photoDirectoryWithType:2 createIfNeeded:1 error:0];
  [v3 addObject:v4];

  id v5 = [(PLPhotoLibraryPathManager *)self photoDirectoryWithType:14 createIfNeeded:1 error:0];
  [v3 addObject:v5];

  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __81__PLPhotoLibraryPathManager__commonPathsToExcludeFromTimeMachineAndICloudBackups__block_invoke;
  v15 = &unk_1E58A0FE0;
  id v16 = self;
  id v6 = v3;
  id v17 = v6;
  [(PLPhotoLibraryPathManager *)self enumerateBundleScopesWithBlock:&v12];
  id v7 = -[PLPhotoLibraryPathManager photoDirectoryWithType:leafType:createIfNeeded:error:](self, "photoDirectoryWithType:leafType:createIfNeeded:error:", 13, 3, 1, 0, v12, v13, v14, v15, v16);
  [v6 addObject:v7];

  id v8 = [(PLPhotoLibraryPathManager *)self photoDirectoryWithType:13 leafType:2 createIfNeeded:1 error:0];
  [v6 addObject:v8];

  uint64_t v9 = v17;
  id v10 = v6;

  return v10;
}

void __81__PLPhotoLibraryPathManager__commonPathsToExcludeFromTimeMachineAndICloudBackups__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (([(id)objc_opt_class() bundleScopeShouldBePersistedForRebuild:a2] & 1) == 0)
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) photoDirectoryWithType:a3 createIfNeeded:1 error:0];
    [v5 addObject:v6];
  }
}

- (id)_pathsToExcludeFromAllBackups
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v4 = [(PLPhotoLibraryPathManager *)self privateCacheDirectoryWithSubType:0 createIfNeeded:1 error:0];
  [v3 addObject:v4];

  id v5 = [(PLPhotoLibraryPathManager *)self photoDirectoryWithType:18 createIfNeeded:1 error:0];
  id v6 = [v5 stringByDeletingLastPathComponent];
  [v3 addObject:v6];

  id v7 = [(PLPhotoLibraryPathManager *)self _existingPrivateCacheDirectoriesToExclude];
  [v3 addObjectsFromArray:v7];

  id v8 = [(PLPhotoLibraryPathManager *)self externalDirectoryWithSubType:0 createIfNeeded:1 error:0];
  if (v8) {
    [v3 addObject:v8];
  }
  uint64_t v9 = [(PLPhotoLibraryPathManager *)self photoDirectoryWithType:3 createIfNeeded:1 error:0];
  [v3 addObject:v9];

  id v10 = [(PLPhotoLibraryPathManager *)self internalDirectoryWithSubType:5 additionalPathComponents:0 createIfNeeded:1 error:0];
  [v3 addObject:v10];

  return v3;
}

- (id)_existingPrivateCacheDirectoriesToExclude
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  BOOL v4 = [(PLPhotoLibraryPathManagerCore *)self->_internalPathManager basePrivateDirectoryPath];
  uint64_t v5 = [v3 fileURLWithPath:v4 isDirectory:1];

  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = *MEMORY[0x1E4F1C628];
  v30[0] = *MEMORY[0x1E4F1C6E8];
  v30[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  id v23 = (void *)v5;
  uint64_t v9 = [v6 enumeratorAtURL:v5 includingPropertiesForKeys:v8 options:4 errorHandler:0];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v15 = [v14 lastPathComponent];
        if ([v15 isEqualToString:@"caches"])
        {
          id v16 = [v23 path];
          id v17 = [v14 URLByDeletingLastPathComponent];
          uint64_t v18 = [v17 URLByDeletingLastPathComponent];
          uint64_t v19 = [v18 path];
          int v20 = [v16 isEqualToString:v19];

          if (!v20) {
            continue;
          }
          v15 = [v14 path];
          [v22 addObject:v15];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  return v22;
}

- (id)redactedDescription
{
  id v3 = [(PLPhotoLibraryPathManager *)self photoDirectoryWithType:1];
  BOOL v4 = +[PLFileUtilities redactedDescriptionForPath:v3];

  uint64_t v5 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PLPhotoLibraryPathManager;
  id v6 = [(PLPhotoLibraryPathManager *)&v10 description];
  uint64_t v7 = PLStringFromPLPhotoLibraryPathManagerLibraryFormatShort(self->_format);
  id v8 = [v5 stringWithFormat:@"%@ [%@] [%@]", v6, v7, v4];

  return v8;
}

- (NSString)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoLibraryPathManager;
  BOOL v4 = [(PLPhotoLibraryPathManager *)&v9 description];
  uint64_t v5 = PLStringFromPLPhotoLibraryPathManagerLibraryFormatShort(self->_format);
  id v6 = [(PLPhotoLibraryPathManager *)self photoDirectoryWithType:1];
  uint64_t v7 = [v3 stringWithFormat:@"%@ [%@] [%@]", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isDCIM
{
  return self->_format != 2;
}

- (PLPhotoLibraryPathManager)initWithBaseDirectory:(id)a3
{
  BOOL v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3 isDirectory:1];
  uint64_t v5 = [(PLPhotoLibraryPathManager *)self initWithLibraryURL:v4];

  return v5;
}

- (PLPhotoLibraryPathManager)init
{
  return 0;
}

+ (id)allPhotosPathsOnThisDevice
{
  return +[PLPhotoLibraryPathManagerDCIM allPhotosPathsOnThisDevice];
}

+ (id)photosLibraryExtension
{
  return +[PLPhotoLibraryPathManagerCore photosLibraryExtension];
}

+ (id)rootURLForPhotoLibraryDomain:(int64_t)a3
{
  return +[PLPhotoLibraryPathManagerCore rootURLForPhotoLibraryDomain:a3];
}

+ (BOOL)shouldProcessHighlightsForWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return +[PLPhotoLibraryPathManagerCore shouldProcessHighlightsForWellKnownPhotoLibraryIdentifier:a3];
}

+ (BOOL)ignoreFilesystemCheckForWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return +[PLPhotoLibraryPathManagerCore ignoreFilesystemCheckForWellKnownPhotoLibraryIdentifier:a3];
}

+ (BOOL)shouldAutoUpgradeWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return +[PLPhotoLibraryPathManagerCore shouldAutoUpgradeWellKnownPhotoLibraryIdentifier:a3];
}

+ (unint64_t)libraryCreateOptionsForWellKnownLibraryIdentifier:(int64_t)a3
{
  return +[PLPhotoLibraryPathManagerCore libraryCreateOptionsForWellKnownLibraryIdentifier:a3];
}

+ (id)wellKnownPhotoLibraryURLForIdentifier:(int64_t)a3
{
  return +[PLPhotoLibraryPathManagerCore wellKnownPhotoLibraryURLForIdentifier:a3];
}

+ (id)libraryURLFromDatabaseURL:(id)a3
{
  return +[PLPhotoLibraryPathManagerCore libraryURLFromDatabaseURL:a3];
}

+ (BOOL)setSystemLibraryURL:(id)a3 options:(unsigned __int16)a4 error:(id *)a5
{
  return +[PLPhotoLibraryPathManagerCore setSystemLibraryURL:a3 options:a4 error:a5];
}

+ (id)systemLibraryBaseDirectory
{
  return +[PLPhotoLibraryPathManagerCore systemLibraryBaseDirectory];
}

+ (id)managedPathWithUuid:(const char *)a3 base:(const char *)a4 fileMarker:(const char *)a5 extension:(const char *)a6
{
  return +[PLPhotoLibraryPathManagerCore managedPathWithUuid:a3 base:a4 fileMarker:a5 extension:a6];
}

+ (BOOL)bundleScopeShouldBePersistedForRebuild:(unsigned __int16)a3
{
  return (a3 < 6u) & (0x11u >> a3);
}

+ (void)throwMultiLibraryAPIMisuse
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BCFB000, v2, OS_LOG_TYPE_ERROR, "Error: API misuse. Operating in multi library mode but calling single library mode API.", buf, 2u);
  }

  if (PFOSVariantHasInternalDiagnostics())
  {
    id v3 = PLBackendGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "File radar with sysdiagnose to component: Photos Backend Storage | all", buf, 2u);
    }

    BOOL v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Ask for help in #help-photos-disclosed", buf, 2u);
    }
  }
  uint64_t v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "Call stack that enabled multi-library mode:", buf, 2u);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = (id)sMultiLibraryModeEnablingCallStack;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = PLBackendGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v26 = v11;
          _os_log_impl(&dword_19BCFB000, v12, OS_LOG_TYPE_ERROR, "  %@", buf, 0xCu);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v8);
  }

  uint64_t v13 = (void *)sMultiLibraryModeEnablingCallStack;
  if (!sMultiLibraryModeEnablingCallStack) {
    uint64_t v13 = &unk_1EEC14FE0;
  }
  id v14 = v13;
  v15 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v16 = *MEMORY[0x1E4F1C3B8];
  id v23 = @"EnablingCallStack";
  id v24 = v14;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  id v18 = [v15 exceptionWithName:v16 reason:@"Calling single library mode API while in multi library mode" userInfo:v17];

  objc_exception_throw(v18);
}

+ (void)throwMultiLibraryAPIMisuseForLibraryPath:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id WeakRetained = objc_loadWeakRetained(&sSingletonPhotoLibraryPath);
    int v7 = 138412546;
    id v8 = WeakRetained;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error: API misuse. Operating in single library mode for %@ but a different library was requested: %@", (uint8_t *)&v7, 0x16u);
  }
  id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Requesting different library while in single library mode" userInfo:0];
  objc_exception_throw(v6);
}

@end