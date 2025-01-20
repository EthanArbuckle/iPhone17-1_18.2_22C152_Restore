@interface PLThumbnailManagerCore
+ (BOOL)_hasTableChangesOnlyFromFormatIDs:(id)a3 toFormatIDs:(id)a4;
+ (BOOL)_hasTableFormatsAndAllAreCompressedForFormatIDs:(id)a3;
+ (BOOL)_isSuppressingTargetConfigComparedToSavedConfigForPathManager:(id)a3;
+ (BOOL)hasThumbnailConfigMismatchWithPathManager:(id)a3 comparedToConfigPhase:(int64_t)a4;
+ (BOOL)isMissingThumbnailTablesWithPathManager:(id)a3;
+ (BOOL)isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:(id)a3;
+ (BOOL)wantsTableOnlyRebuildForThumbnailConfigDict:(id)a3;
+ (id)_configurationThumbnailFormatIDsWithPathManager:(id)a3;
+ (id)_formatIDsForIthmbFilesWithPathManager:(id)a3;
+ (id)_generateTableFormatsFromFormatIDs:(id)a3;
+ (id)_generateUncompressedImageTableSpecificationsForRunningConfigWithPathManager:(id)a3;
+ (id)_thumbnailFormatsFromIDs:(id)a3;
+ (id)supportedThumbnailFormatIDsForDeviceConfiguration:(id)a3;
+ (id)tableThumbnailFormatsForConfigPhase:(int64_t)a3 withPathManager:(id)a4;
+ (id)thumbnailConfigurationDictWithPathManager:(id)a3;
+ (id)thumbnailConfigurationPathWithPathManager:(id)a3;
+ (id)thumbnailFormatIDsForConfigPhase:(int64_t)a3 withPathManager:(id)a4;
+ (id)thumbnailFormatsForConfigPhase:(int64_t)a3 withPathManager:(id)a4;
+ (int)configurationThumbnailVersionWithPathManager:(id)a3;
+ (int)thumbnailVersionForConfigPhase:(int64_t)a3 withPathManager:(id)a4;
+ (int64_t)allocatedFileSizeOfThumbnailTablesWithPathManager:(id)a3;
+ (int64_t)requiredThumbnailResetTypeWithPathManager:(id)a3 comparedToConfigPhase:(int64_t)a4;
+ (void)enumerateThumbnailTablesWithPathManager:(id)a3 fileManager:(id)a4 handler:(id)a5;
+ (void)invalidateCachedConfig;
+ (void)invalidateIsSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:(id)a3;
+ (void)markThumbnailConfigurationForTableOnlyRebuildForThumbnailConfigDict:(id)a3;
+ (void)markThumbnailConfigurationTableOnlyRebuildFinishedForThumbnailConfigDict:(id)a3;
+ (void)removeThumbnailTablesUnsupportedOnly:(BOOL)a3 withPathManager:(id)a4;
+ (void)removeThumbnailTablesUnsupportedOnly:(BOOL)a3 withPathManager:(id)a4 fileManagerDelegate:(id)a5;
+ (void)stampThumbnailConfiguration:(id)a3 toFile:(BOOL)a4 withPathManager:(id)a5;
- (NSMutableDictionary)thumbManagersByFormat;
- (PLPhotoLibraryPathManager)pathManager;
- (PLThumbnailManagerCore)initWithPhotoLibraryPathManager:(id)a3;
- (id)_thumbManagerForFormatID:(unsigned __int16)a3;
- (id)fastThumbPersistenceManagers;
- (id)thumbManagerForFormatID:(unsigned __int16)a3 thumbFileManagerClass:(Class)a4 readOnly:(BOOL)a5;
- (void)dealloc;
@end

@implementation PLThumbnailManagerCore

+ (BOOL)isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 photoDirectoryWithType:1];
  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&s_isSupressingLock);
    v6 = [(id)s_isSuppressingTargetConfigByBundleDirectory objectForKeyedSubscript:v5];
    if (!v6)
    {
      id v7 = objc_initWeak(location, a1);

      v8 = [PLLazyObject alloc];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __92__PLThumbnailManagerCore_isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager___block_invoke;
      v18 = &unk_1E589F5F8;
      objc_copyWeak(&v20, location);
      id v19 = v4;
      v6 = [(PLLazyObject *)v8 initWithBlock:&v15];

      objc_destroyWeak(&v20);
      objc_destroyWeak(location);
      v9 = (void *)s_isSuppressingTargetConfigByBundleDirectory;
      if (!s_isSuppressingTargetConfigByBundleDirectory)
      {
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v15, v16, v17, v18);
        v11 = (void *)s_isSuppressingTargetConfigByBundleDirectory;
        s_isSuppressingTargetConfigByBundleDirectory = v10;

        v9 = (void *)s_isSuppressingTargetConfigByBundleDirectory;
      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v5, v15, v16, v17, v18);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&s_isSupressingLock);
    v12 = [v6 objectValue];
    char v13 = [v12 BOOLValue];
  }
  else
  {
    v6 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v4;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Unable to determine thumbnail manager target config suppression state, can't determine libraryKey from path manager: %@", (uint8_t *)location, 0xCu);
    }
    char v13 = 0;
  }

  return v13;
}

id __92__PLThumbnailManagerCore_isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "_isSuppressingTargetConfigComparedToSavedConfigForPathManager:", *(void *)(a1 + 32)));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void __75__PLThumbnailManagerCore_thumbnailFormatIDsForConfigPhase_withPathManager___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = +[PLDeviceConfiguration defaultDeviceConfiguration];
  uint64_t v2 = [v1 supportedThumbnailFormatIDsForDeviceConfiguration:v4];
  v3 = (void *)thumbnailFormatIDsForConfigPhase_withPathManager__s_cachedTargetFormatIDs;
  thumbnailFormatIDsForConfigPhase_withPathManager__s_cachedTargetFormatIDs = v2;
}

void __73__PLThumbnailManagerCore_thumbnailFormatsForConfigPhase_withPathManager___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  id v4 = [v1 thumbnailFormatIDsForConfigPhase:2 withPathManager:*(void *)(a1 + 32)];
  uint64_t v2 = [v1 _thumbnailFormatsFromIDs:v4];
  v3 = (void *)thumbnailFormatsForConfigPhase_withPathManager__s_cachedFormats;
  thumbnailFormatsForConfigPhase_withPathManager__s_cachedFormats = v2;
}

+ (int64_t)requiredThumbnailResetTypeWithPathManager:(id)a3 comparedToConfigPhase:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([a1 hasThumbnailConfigMismatchWithPathManager:v6 comparedToConfigPhase:a4])
  {
    pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
    if (PLIsReallyAssetsd_isAssetsd
      || (__PLIsAssetsdProxyService & 1) != 0
      || PFProcessIsLaunchedToExecuteTests())
    {
      int v7 = [a1 thumbnailVersionForConfigPhase:0 withPathManager:v6];
      int v8 = [a1 thumbnailVersionForConfigPhase:a4 withPathManager:v6];
      v9 = [a1 thumbnailFormatIDsForConfigPhase:0 withPathManager:v6];
      uint64_t v10 = [a1 thumbnailFormatIDsForConfigPhase:a4 withPathManager:v6];
      int v11 = [a1 _hasTableChangesOnlyFromFormatIDs:v9 toFormatIDs:v10];
      int v12 = v11;
      if (v11) {
        int v11 = [a1 _hasTableFormatsAndAllAreCompressedForFormatIDs:v10];
      }
      if (v7 != 30 || v8 <= 30) {
        int v14 = v11;
      }
      else {
        int v14 = 1;
      }
      if (v14) {
        int64_t v15 = 1;
      }
      else {
        int64_t v15 = 2;
      }
      uint64_t v16 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138544386;
        id v19 = v9;
        __int16 v20 = 2114;
        v21 = v10;
        __int16 v22 = 1024;
        int v23 = v12;
        __int16 v24 = 1024;
        int v25 = v14;
        __int16 v26 = 1024;
        int v27 = v14 ^ 1;
        _os_log_impl(&dword_19BCFB000, v16, OS_LOG_TYPE_DEFAULT, "Detected thumbnail configuration change: from formats: %{public}@ to formats: %{public}@, tableChangesOnly: %d, migrationToCompressedTablesOnly: %d, fullRebuild: %d", (uint8_t *)&v18, 0x28u);
      }
    }
    else
    {
      int64_t v15 = 3;
    }
  }
  else
  {
    int64_t v15 = 0;
  }

  return v15;
}

+ (BOOL)hasThumbnailConfigMismatchWithPathManager:(id)a3 comparedToConfigPhase:(int64_t)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [a1 thumbnailFormatIDsForConfigPhase:0 withPathManager:v6];
  int v8 = [a1 thumbnailFormatIDsForConfigPhase:a4 withPathManager:v6];
  int v9 = [a1 configurationThumbnailVersionWithPathManager:v6];
  if (v9 <= 29)
  {
    if ([v8 count])
    {
      uint64_t v10 = [v8 firstObject];
      v26[0] = v10;
      int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    }
    else
    {
      int v11 = MEMORY[0x1E4F1CBF0];
    }
    if ([v7 count])
    {
      char v13 = [v7 firstObject];
      int v25 = v13;
      int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    }
    else
    {
      int v14 = (void *)MEMORY[0x1E4F1CBF0];
    }
    if (v9 == [a1 thumbnailVersionForConfigPhase:a4 withPathManager:v6]
      && ([v14 isEqualToArray:v11] & 1) != 0)
    {
      BOOL v12 = 0;
    }
    else
    {
      int64_t v15 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 67109890;
        int v18 = v9;
        __int16 v19 = 1024;
        int v20 = [a1 thumbnailVersionForConfigPhase:a4 withPathManager:v6];
        __int16 v21 = 2114;
        __int16 v22 = v7;
        __int16 v23 = 2114;
        __int16 v24 = v8;
        _os_log_impl(&dword_19BCFB000, v15, OS_LOG_TYPE_DEFAULT, "hasThumbnailConfigMismatch (legacy) thumbnailVersion %d vs current %d, formats: %{public}@ vs desired: %{public}@", (uint8_t *)&v17, 0x22u);
      }

      BOOL v12 = 1;
    }

LABEL_21:
    goto LABEL_22;
  }
  if (v9 != [a1 thumbnailVersionForConfigPhase:a4 withPathManager:v6]
    || ([v7 isEqualToArray:v8] & 1) == 0)
  {
    int v11 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 67109890;
      int v18 = v9;
      __int16 v19 = 1024;
      int v20 = [a1 thumbnailVersionForConfigPhase:a4 withPathManager:v6];
      __int16 v21 = 2114;
      __int16 v22 = v7;
      __int16 v23 = 2114;
      __int16 v24 = v8;
      _os_log_impl(&dword_19BCFB000, v11, OS_LOG_TYPE_DEFAULT, "hasThumbnailConfigMismatch (modern) thumbnailVersion %d vs current %d, formats: %{public}@ vs desired: %{public}@", (uint8_t *)&v17, 0x22u);
    }
    BOOL v12 = 1;
    goto LABEL_21;
  }
  BOOL v12 = 0;
LABEL_22:

  return v12;
}

+ (BOOL)_isSuppressingTargetConfigComparedToSavedConfigForPathManager:(id)a3
{
  id v4 = a3;
  int v5 = [a1 thumbnailVersionForConfigPhase:0 withPathManager:v4];
  id v6 = [a1 thumbnailFormatIDsForConfigPhase:0 withPathManager:v4];
  int v7 = [a1 thumbnailVersionForConfigPhase:2 withPathManager:v4];
  int v8 = [a1 thumbnailFormatIDsForConfigPhase:2 withPathManager:v4];

  int v9 = [a1 _hasTableChangesOnlyFromFormatIDs:v6 toFormatIDs:v8];
  if (v9) {
    LOBYTE(v9) = [a1 _hasTableFormatsAndAllAreCompressedForFormatIDs:v8];
  }
  char v10 = (v5 == 30) & ~(_BYTE)v9;
  if (v7 <= 30) {
    char v10 = 0;
  }
  char v11 = v10 | v9;

  return v11;
}

+ (id)thumbnailFormatIDsForConfigPhase:(int64_t)a3 withPathManager:(id)a4
{
  id v6 = a4;
  if (a3 == 2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__PLThumbnailManagerCore_thumbnailFormatIDsForConfigPhase_withPathManager___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (thumbnailFormatIDsForConfigPhase_withPathManager__s_onceToken != -1) {
      dispatch_once(&thumbnailFormatIDsForConfigPhase_withPathManager__s_onceToken, block);
    }
    id v7 = (id)thumbnailFormatIDsForConfigPhase_withPathManager__s_cachedTargetFormatIDs;
  }
  else if (a3 == 1)
  {
    if ([a1 isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:v6])
    {
      id v8 = a1;
      uint64_t v9 = 0;
    }
    else
    {
      id v8 = a1;
      uint64_t v9 = 2;
    }
    id v7 = [v8 thumbnailFormatIDsForConfigPhase:v9 withPathManager:v6];
  }
  else
  {
    if (a3)
    {
      char v10 = 0;
      goto LABEL_14;
    }
    id v7 = [a1 _configurationThumbnailFormatIDsWithPathManager:v6];
  }
  char v10 = v7;
LABEL_14:

  return v10;
}

+ (id)thumbnailFormatsForConfigPhase:(int64_t)a3 withPathManager:(id)a4
{
  id v6 = a4;
  if (a3 == 2
    || (char v7 = [a1 isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:v6], a3 == 1)
    && (v7 & 1) == 0)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__PLThumbnailManagerCore_thumbnailFormatsForConfigPhase_withPathManager___block_invoke;
    v11[3] = &unk_1E589EF38;
    id v13 = a1;
    id v12 = v6;
    if (thumbnailFormatsForConfigPhase_withPathManager__s_onceToken != -1) {
      dispatch_once(&thumbnailFormatsForConfigPhase_withPathManager__s_onceToken, v11);
    }
    id v8 = (id)thumbnailFormatsForConfigPhase_withPathManager__s_cachedFormats;
  }
  else
  {
    uint64_t v9 = [a1 thumbnailFormatIDsForConfigPhase:a3 withPathManager:v6];
    id v8 = [a1 _thumbnailFormatsFromIDs:v9];
  }
  return v8;
}

+ (int)thumbnailVersionForConfigPhase:(int64_t)a3 withPathManager:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 2:
      int v8 = 31;
      break;
    case 1:
      if ([a1 isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:v6])
      {
        id v9 = a1;
        uint64_t v10 = 0;
      }
      else
      {
        id v9 = a1;
        uint64_t v10 = 2;
      }
      int v7 = [v9 thumbnailVersionForConfigPhase:v10 withPathManager:v6];
      goto LABEL_11;
    case 0:
      int v7 = [a1 configurationThumbnailVersionWithPathManager:v6];
LABEL_11:
      int v8 = v7;
      break;
    default:
      int v8 = 0;
      break;
  }

  return v8;
}

+ (id)_configurationThumbnailFormatIDsWithPathManager:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = [(id)objc_opt_class() thumbnailConfigurationDictWithPathManager:v4];
    id v6 = [v5 objectForKey:@"PLThumbnailManagerThumbnailFormatsKey"];
    int v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v9 = [v5 objectForKey:@"PLThumbnailManagerThumbnailFormatKey"];
      unsigned __int16 v10 = [v9 intValue];

      char v11 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v12 = +[PLImageFormat formatWithID:v10];
      if (v12) {
        [v11 addObject:v12];
      }
      uint64_t v27 = v12;
      if (!PLIsLimitedLibraryClient())
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v13 = objc_msgSend(a1, "_formatIDsForIthmbFilesWithPathManager:", v4, v12);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v35 != v16) {
                objc_enumerationMutation(v13);
              }
              int v18 = +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", (unsigned __int16)[*(id *)(*((void *)&v34 + 1) + 8 * i) integerValue]);
              if (v18) {
                [v11 addObject:v18];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
          }
          while (v15);
        }
      }
      v29 = v5;
      __int16 v19 = objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_16, v27);
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v31 != v23) {
              objc_enumerationMutation(v20);
            }
            int v25 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedShort:", objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * j), "formatID"));
            [v8 addObject:v25];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v22);
      }

      int v5 = v29;
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

+ (int)configurationThumbnailVersionWithPathManager:(id)a3
{
  v3 = [a1 thumbnailConfigurationDictWithPathManager:a3];
  id v4 = [v3 objectForKey:@"PLThumbnailManagerVersionKey"];
  int v5 = [v4 intValue];

  return v5;
}

+ (id)thumbnailConfigurationDictWithPathManager:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 alloc];
  int v7 = [a1 thumbnailConfigurationPathWithPathManager:v5];

  id v8 = (id)[v6 initWithContentsOfFile:v7];
  if (!v8) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v8;
}

+ (id)_thumbnailFormatsFromIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int16 v10 = +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", (unsigned __int16)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "intValue", (void)v13));
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  char v11 = (void *)[v4 copy];
  return v11;
}

+ (BOOL)_hasTableChangesOnlyFromFormatIDs:(id)a3 toFormatIDs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 firstObject];
  uint64_t v8 = [v6 firstObject];
  int v9 = [v7 isEqualToNumber:v8];

  if (v9) {
    int v10 = [v5 isEqualToArray:v6] ^ 1;
  }
  else {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)thumbManagerForFormatID:(unsigned __int16)a3 thumbFileManagerClass:(Class)a4 readOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = a3;
  [(NSLock *)self->_thumbManagersLock lock];
  if (self->_lastUsedThumbManagerFormatID != v7 || (int v9 = self->_lastUsedThumbManager) == 0)
  {
    int v10 = [(PLThumbnailManagerCore *)self thumbManagersByFormat];
    char v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:v7];
    uint64_t v12 = [v10 objectForKeyedSubscript:v11];

    long long v13 = [MEMORY[0x1E4F1CA98] null];

    if (v12 == v13)
    {
      long long v14 = +[PLImageFormat formatWithID:v7];
      if ([v14 isTable])
      {
        long long v15 = [(PLThumbnailManagerCore *)self pathManager];
        long long v16 = [NSString stringWithFormat:@"%d.%@", v7, @"ithmb"];
        int v17 = [v15 photoDirectoryWithType:11 createIfNeeded:1 error:0];
        uint64_t v18 = [v17 stringByAppendingPathComponent:v16];

        uint64_t v19 = [v14 createTableWithPath:v18 readOnly:v5 format:v14];
      }
      else
      {
        id v20 = [a4 alloc];
        uint64_t v18 = [(PLThumbnailManagerCore *)self pathManager];
        uint64_t v19 = [v20 initWithImageFormat:v14 pathManager:v18];
      }
      int v9 = (PLThumbPersistenceManager *)v19;

      if (v9)
      {
        uint64_t v21 = [(PLThumbnailManagerCore *)self thumbManagersByFormat];
        uint64_t v22 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:v7];
        [v21 setObject:v9 forKeyedSubscript:v22];

        uint64_t v23 = v9;
      }
    }
    else
    {
      int v9 = (PLThumbPersistenceManager *)v12;
    }
    objc_storeStrong((id *)&self->_lastUsedThumbManager, v9);
    self->_lastUsedThumbManagerFormatID = v7;
  }
  [(NSLock *)self->_thumbManagersLock unlock];
  return v9;
}

- (NSMutableDictionary)thumbManagersByFormat
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

+ (id)thumbnailConfigurationPathWithPathManager:(id)a3
{
  id v3 = [a3 photoDirectoryWithType:11 createIfNeeded:1 error:0];
  id v4 = [v3 stringByAppendingPathComponent:@"thumbnailConfiguration"];

  return v4;
}

- (PLPhotoLibraryPathManager)pathManager
{
  return (PLPhotoLibraryPathManager *)objc_getProperty(self, a2, 64, 1);
}

- (PLThumbnailManagerCore)initWithPhotoLibraryPathManager:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    __int16 v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PLThumbnailManagerCore.m", 215, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
  }
  v30.receiver = self;
  v30.super_class = (Class)PLThumbnailManagerCore;
  uint64_t v7 = [(PLThumbnailManagerCore *)&v30 init];
  if (v7)
  {
    obuint64_t j = a3;
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    int v9 = +[PLThumbnailManagerCore thumbnailFormatIDsForConfigPhase:1 withPathManager:v6];
    int v10 = [v8 sharedKeySetForKeys:v9];

    char v11 = [MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:v10];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
          [(NSMutableDictionary *)v11 setObject:v18 forKey:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v14);
    }

    thumbManagersByFormat = v7->_thumbManagersByFormat;
    v7->_thumbManagersByFormat = v11;
    id v20 = v11;

    objc_storeStrong((id *)&v7->_pathManager, obj);
    uint64_t v21 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    thumbManagersLock = v7->_thumbManagersLock;
    v7->_thumbManagersLock = v21;

    v7->_ivarLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

+ (id)supportedThumbnailFormatIDsForDeviceConfiguration:(id)a3
{
  id v3 = a3;
  if ([v3 shouldUseNanoThumbnailFormats])
  {
    int v4 = [v3 supportsASTC];
    BOOL v5 = &unk_1EEC14E18;
    id v6 = &unk_1EEC14E00;
  }
  else
  {
    if ([v3 isTV])
    {
      uint64_t v7 = &unk_1EEC14E30;
      goto LABEL_11;
    }
    if ([v3 isPad])
    {
      uint64_t v7 = &unk_1EEC14E48;
      goto LABEL_11;
    }
    int v4 = [v3 isMac];
    BOOL v5 = &unk_1EEC14E78;
    id v6 = &unk_1EEC14E60;
  }
  if (v4) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v5;
  }
LABEL_11:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_thumbManagersByFormat, 0);
  objc_storeStrong((id *)&self->_fastImageTables, 0);
  objc_storeStrong((id *)&self->_lastUsedThumbManager, 0);
  objc_storeStrong((id *)&self->_thumbManagersLock, 0);
  objc_storeStrong((id *)&self->_thumbnailConfigurationDict, 0);
}

- (id)fastThumbPersistenceManagers
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (!self->_fastImageTables)
  {
    int v4 = objc_opt_class();
    BOOL v5 = [(PLThumbnailManagerCore *)self pathManager];
    id v6 = [v4 tableThumbnailFormatsForConfigPhase:1 withPathManager:v5];

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = -[PLThumbnailManagerCore _thumbManagerForFormatID:](self, "_thumbManagerForFormatID:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v12), "formatID", (void)v20));
          if (v13) {
            [v7 addObject:v13];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v10);
    }

    uint64_t v14 = (NSArray *)[v7 copy];
    fastImageTables = self->_fastImageTables;
    self->_fastImageTables = v14;

    long long v16 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = self->_fastImageTables;
      *(_DWORD *)buf = 138412290;
      int v25 = v17;
      _os_log_impl(&dword_19BCFB000, v16, OS_LOG_TYPE_DEBUG, "#### fastThumbPersistenceManagers %@", buf, 0xCu);
    }
  }
  os_unfair_lock_unlock(p_ivarLock);
  uint64_t v18 = self->_fastImageTables;
  return v18;
}

- (void)dealloc
{
  thumbManagersLock = self->_thumbManagersLock;
  self->_thumbManagersLock = 0;

  v4.receiver = self;
  v4.super_class = (Class)PLThumbnailManagerCore;
  [(PLThumbnailManagerCore *)&v4 dealloc];
}

- (id)_thumbManagerForFormatID:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = objc_opt_class();
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  uint64_t v6 = (PLIsReallyAssetsd_isAssetsd == 0) & (__PLIsAssetsdProxyService ^ 1u);
  return [(PLThumbnailManagerCore *)self thumbManagerForFormatID:v3 thumbFileManagerClass:v5 readOnly:v6];
}

+ (void)stampThumbnailConfiguration:(id)a3 toFile:(BOOL)a4 withPathManager:(id)a5
{
  BOOL v6 = a4;
  id v14 = a3;
  id v8 = a5;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(a1, "thumbnailVersionForConfigPhase:withPathManager:", 2, v8));
  [v14 setObject:v9 forKey:@"PLThumbnailManagerVersionKey"];

  uint64_t v10 = [a1 thumbnailFormatIDsForConfigPhase:2 withPathManager:v8];
  uint64_t v11 = [v10 firstObject];
  [v14 setObject:v11 forKey:@"PLThumbnailManagerThumbnailFormatKey"];

  [v14 setObject:v10 forKey:@"PLThumbnailManagerThumbnailFormatsKey"];
  if (v6)
  {
    uint64_t v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v14 format:100 options:0 error:0];
    uint64_t v13 = [a1 thumbnailConfigurationPathWithPathManager:v8];
    [v12 writeToFile:v13 options:1073741825 error:0];
  }
}

+ (BOOL)wantsTableOnlyRebuildForThumbnailConfigDict:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"PLThumbnailManagerRebuildingTablesOnly"];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (void)markThumbnailConfigurationTableOnlyRebuildFinishedForThumbnailConfigDict:(id)a3
{
}

+ (void)markThumbnailConfigurationForTableOnlyRebuildForThumbnailConfigDict:(id)a3
{
}

+ (void)enumerateThumbnailTablesWithPathManager:(id)a3 fileManager:(id)a4 handler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v31 = (void (**)(id, void *, void))a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"PLThumbnailManagerCore.m", 491, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, a1, @"PLThumbnailManagerCore.m", 492, @"Invalid parameter not satisfying: %@", @"fileManager" object file lineNumber description];

LABEL_3:
  if (!v31)
  {
    long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"PLThumbnailManagerCore.m", 493, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  id v10 = v8;
  objc_sync_enter(v10);
  id v30 = v10;
  uint64_t v11 = [v10 photoDirectoryWithType:11 createIfNeeded:1 error:0];
  [v9 contentsOfDirectoryAtPath:v11 error:0];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v16 = [v11 stringByAppendingPathComponent:v15];
        char v33 = 0;
        int v17 = [v9 fileExistsAtPath:v16 isDirectory:&v33];
        if (v33) {
          int v18 = 0;
        }
        else {
          int v18 = v17;
        }
        if (v18 == 1)
        {
          uint64_t v19 = [v15 pathExtension];
          int v20 = [v19 isEqualToString:@"ithmb"];

          if (v20)
          {
            long long v21 = [v15 stringByDeletingPathExtension];
            uint64_t v22 = [v21 integerValue];
            long long v23 = [a1 thumbnailFormatIDsForConfigPhase:1 withPathManager:v30];
            __int16 v24 = [MEMORY[0x1E4F28ED0] numberWithInteger:v22];
            int v25 = [v23 containsObject:v24];

            v31[2](v31, v16, v25 ^ 1u);
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v12);
  }

  objc_sync_exit(v30);
}

+ (int64_t)allocatedFileSizeOfThumbnailTablesWithPathManager:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v17[0] = *MEMORY[0x1E4F1C718];
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PLThumbnailManagerCore_allocatedFileSizeOfThumbnailTablesWithPathManager___block_invoke;
  v10[3] = &unk_1E589EFA8;
  id v7 = v6;
  id v11 = v7;
  uint64_t v12 = &v13;
  [a1 enumerateThumbnailTablesWithPathManager:v4 fileManager:v5 handler:v10];
  int64_t v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __76__PLThumbnailManagerCore_allocatedFileSizeOfThumbnailTablesWithPathManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CB10];
  id v4 = a2;
  id v8 = (id)[[v3 alloc] initFileURLWithPath:v4 isDirectory:0];

  id v5 = [v8 resourceValuesForKeys:*(void *)(a1 + 32) error:0];
  BOOL v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1C718]];
  uint64_t v7 = [v6 longLongValue];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v7;
}

+ (void)removeThumbnailTablesUnsupportedOnly:(BOOL)a3 withPathManager:(id)a4 fileManagerDelegate:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F28CB8];
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_alloc_init(v8);
  [v11 setDelegate:v9];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__PLThumbnailManagerCore_removeThumbnailTablesUnsupportedOnly_withPathManager_fileManagerDelegate___block_invoke;
  v13[3] = &unk_1E589EF80;
  BOOL v15 = a3;
  id v14 = v11;
  id v12 = v11;
  [a1 enumerateThumbnailTablesWithPathManager:v10 fileManager:v12 handler:v13];
}

uint64_t __99__PLThumbnailManagerCore_removeThumbnailTablesUnsupportedOnly_withPathManager_fileManagerDelegate___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  if (*(unsigned char *)(result + 40)) {
    BOOL v3 = a3 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3) {
    return [*(id *)(result + 32) removeItemAtPath:a2 error:0];
  }
  return result;
}

+ (void)removeThumbnailTablesUnsupportedOnly:(BOOL)a3 withPathManager:(id)a4
{
}

+ (BOOL)isMissingThumbnailTablesWithPathManager:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v21 = v4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = [a1 thumbnailFormatIDsForConfigPhase:1 withPathManager:v4];
  BOOL v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = ((char *)i + 1))
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v10 = +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", (unsigned __int16)[v9 intValue]);
        if ([v10 isTable])
        {
          unsigned __int16 v11 = [v9 intValue];
          id v12 = NSString;
          uint64_t v13 = v11;
          id v14 = v21;
          uint64_t v15 = [v12 stringWithFormat:@"%d.%@", v13, @"ithmb"];
          uint64_t v16 = [v14 photoDirectoryWithType:11 createIfNeeded:1 error:0];

          int v17 = [v16 stringByAppendingPathComponent:v15];

          LOBYTE(v15) = [v20 fileExistsAtPath:v17];
          if ((v15 & 1) == 0)
          {
            BOOL v6 = PLThumbnailsGetLog();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
            {
              int v18 = [v9 intValue];
              *(_DWORD *)buf = 67109120;
              int v27 = v18;
              _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_DEFAULT, "Missing thumbnail table for format %d", buf, 8u);
            }

            LOBYTE(v6) = 1;
            goto LABEL_14;
          }
        }
      }
      BOOL v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return (char)v6;
}

+ (BOOL)_hasTableFormatsAndAllAreCompressedForFormatIDs:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = [v3 predicateWithBlock:&__block_literal_global_44];
  BOOL v6 = [v4 filteredArrayUsingPredicate:v5];

  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_46];
  id v8 = [v6 filteredArrayUsingPredicate:v7];

  if ([v6 count])
  {
    uint64_t v9 = [v8 count];
    BOOL v10 = v9 == [v6 count];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

BOOL __74__PLThumbnailManagerCore__hasTableFormatsAndAllAreCompressedForFormatIDs___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", [a2 unsignedShortValue]);
  BOOL v3 = [v2 thumbnailKind] == 3 || objc_msgSend(v2, "thumbnailKind") == 4;

  return v3;
}

uint64_t __74__PLThumbnailManagerCore__hasTableFormatsAndAllAreCompressedForFormatIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", [a2 unsignedShortValue]);
  uint64_t v3 = [v2 isTable];

  return v3;
}

+ (id)tableThumbnailFormatsForConfigPhase:(int64_t)a3 withPathManager:(id)a4
{
  id v6 = a4;
  if (a3 == 2
    || (char v7 = [a1 isSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:v6], a3 == 1)
    && (v7 & 1) == 0)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__PLThumbnailManagerCore_tableThumbnailFormatsForConfigPhase_withPathManager___block_invoke;
    v11[3] = &unk_1E589EF38;
    id v13 = a1;
    id v12 = v6;
    if (tableThumbnailFormatsForConfigPhase_withPathManager__s_onceToken != -1) {
      dispatch_once(&tableThumbnailFormatsForConfigPhase_withPathManager__s_onceToken, v11);
    }
    id v8 = (id)tableThumbnailFormatsForConfigPhase_withPathManager__s_cachedFormats;
  }
  else
  {
    uint64_t v9 = [a1 thumbnailFormatIDsForConfigPhase:a3 withPathManager:v6];
    id v8 = [a1 _generateTableFormatsFromFormatIDs:v9];
  }
  return v8;
}

void __78__PLThumbnailManagerCore_tableThumbnailFormatsForConfigPhase_withPathManager___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  id v4 = [v1 thumbnailFormatIDsForConfigPhase:2 withPathManager:*(void *)(a1 + 32)];
  uint64_t v2 = [v1 _generateTableFormatsFromFormatIDs:v4];
  uint64_t v3 = (void *)tableThumbnailFormatsForConfigPhase_withPathManager__s_cachedFormats;
  tableThumbnailFormatsForConfigPhase_withPathManager__s_cachedFormats = v2;
}

+ (void)invalidateIsSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:(id)a3
{
  id v3 = [a3 photoDirectoryWithType:1];
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&s_isSupressingLock);
    [(id)s_isSuppressingTargetConfigByBundleDirectory setObject:0 forKeyedSubscript:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)&s_isSupressingLock);
  }
}

+ (void)invalidateCachedConfig
{
  os_unfair_lock_lock((os_unfair_lock_t)&s_isSupressingLock);
  [(id)s_isSuppressingTargetConfigByBundleDirectory removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)&s_isSupressingLock);
}

+ (id)_formatIDsForIthmbFilesWithPathManager:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v22 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  objc_sync_enter(v4);
  obuint64_t j = v4;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v6 = [v4 photoDirectoryWithType:11 createIfNeeded:1 error:0];
  [v5 contentsOfDirectoryAtPath:v6 error:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v7);
        }
        unsigned __int16 v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v12 = [v6 stringByAppendingPathComponent:v11];
        char v23 = 0;
        int v13 = [v5 fileExistsAtPath:v12 isDirectory:&v23];
        if (v23) {
          int v14 = 0;
        }
        else {
          int v14 = v13;
        }
        if (v14 == 1)
        {
          uint64_t v15 = [v11 pathExtension];
          int v16 = [v15 isEqualToString:@"ithmb"];

          if (v16)
          {
            int v17 = [v11 stringByDeletingPathExtension];
            uint64_t v18 = [v17 integerValue];
            if (v18 >= 1)
            {
              uint64_t v19 = [MEMORY[0x1E4F28ED0] numberWithInteger:v18];
              [v22 addObject:v19];
            }
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  objc_sync_exit(obj);
  return v22;
}

+ (id)_generateUncompressedImageTableSpecificationsForRunningConfigWithPathManager:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [a1 tableThumbnailFormatsForConfigPhase:1 withPathManager:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned __int16 v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 thumbnailKind] == 1)
        {
          id v12 = [v11 thumbnailSpecification];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

uint64_t __74__PLThumbnailManagerCore__configurationThumbnailFormatIDsWithPathManager___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

+ (id)_generateTableFormatsFromFormatIDs:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", (unsigned __int16)[*(id *)(*((void *)&v35 + 1) + 8 * i) intValue]);
        if ([v10 isTable]) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v48 count:16];
    }
    while (v7);
  }
  uint64_t v29 = v5;

  id v30 = v4;
  unsigned __int16 v11 = [v4 sortedArrayUsingComparator:&__block_literal_global_676];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v47 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        long long v17 = PLThumbnailsGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v18 = [v16 shortDescription];
          [v16 size];
          int v20 = (int)v19;
          [v16 size];
          int v22 = (int)v21;
          int v23 = [v16 isCropped];
          *(_DWORD *)buf = 138413058;
          uint64_t v40 = (uint64_t)v18;
          __int16 v41 = 1024;
          int v42 = v20;
          __int16 v43 = 1024;
          int v44 = v22;
          __int16 v45 = 1024;
          int v46 = v23;
          _os_log_impl(&dword_19BCFB000, v17, OS_LOG_TYPE_DEBUG, "#### Format %@ : %d x %d, crop %d", buf, 0x1Eu);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v47 count:16];
    }
    while (v13);
  }
  id v24 = v11;
  long long v25 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v40 = (uint64_t)v24;
    _os_log_impl(&dword_19BCFB000, v25, OS_LOG_TYPE_DEBUG, "#### fastTableFormats %@", buf, 0xCu);
  }

  long long v26 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = [v24 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v40 = v27;
    _os_log_impl(&dword_19BCFB000, v26, OS_LOG_TYPE_DEBUG, "#### fastFormatCount %lu", buf, 0xCu);
  }

  return v24;
}

uint64_t __61__PLThumbnailManagerCore__generateTableFormatsFromFormatIDs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

@end