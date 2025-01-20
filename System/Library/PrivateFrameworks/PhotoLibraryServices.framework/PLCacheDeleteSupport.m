@interface PLCacheDeleteSupport
+ (BOOL)clearPurgeableFlagForResource:(id)a3;
+ (BOOL)clearPurgeableFlagsForAllResourcesInPhotoLibraryURL:(id)a3;
+ (BOOL)isPurgeableFile:(id)a3 outIsPhotoType:(BOOL *)a4 outUrgencyLevel:(int64_t *)a5 error:(id *)a6;
+ (BOOL)markPurgeableForFileAtURL:(id)a3 withUrgency:(int64_t)a4 outInode:(unint64_t *)a5;
+ (BOOL)markPurgeableForFileAtURL:(id)a3 withUrgency:(int64_t)a4 outInode:(unint64_t *)a5 error:(id *)a6;
+ (BOOL)setClearPurgeableIsCloneStateOnPurgeableResourcesOnceWithPathManager:(id)a3 error:(id *)a4;
+ (BOOL)verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:(id)a3 countPresent:(int64_t *)a4 countMissing:(int64_t *)a5 countUnableToVerify:(int64_t *)a6 error:(id *)a7;
+ (fsid)fsidForURL:(id)a3;
+ (id)_clearablePurgeableResourceDirectoriesForPathManager:(id)a3;
+ (id)_purgeableResourceDirectoriesForPathManager:(id)a3;
+ (id)_unclearablePurgeableResourceDirectoriesForPathManager:(id)a3;
+ (id)purgeableStateDescriptionForFile:(id)a3;
+ (void)clearPurgeableIsCloneStateOnPurgeableResourcesOnceIfNecessaryInManagedObjectContext:(id)a3 pathManager:(id)a4;
- (BOOL)clearPurgeableFlagsForAllResources;
- (BOOL)isFilePurgedForFileID:(id)a3 purgedPath:(id)a4;
- (BOOL)markResourceAsPurgeable:(id)a3 withUrgency:(int64_t)a4;
- (NSDate)exitDeleteTime;
- (PLCacheDeleteSupport)initWithLibraryServicesManager:(id)a3 cplStatus:(id)a4;
- (id)_newShortLivedPhotoLibrary;
- (id)purgeableDirectories;
- (void)_markAsNotLocallyAvailableForResourcesWithFileIDsToPath:(id)a3 inLibrary:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)markAsNotLocallyAvailableForResourcesWithFileIDsToPath:(id)a3;
- (void)rescanResourcesFromFileSystem;
- (void)setExitDeleteTime:(id)a3;
@end

@implementation PLCacheDeleteSupport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitDeleteTime, 0);
  objc_storeStrong((id *)&self->_lsm, 0);
}

- (void)setExitDeleteTime:(id)a3
{
}

- (NSDate)exitDeleteTime
{
  return self->_exitDeleteTime;
}

- (void)_markAsNotLocallyAvailableForResourcesWithFileIDsToPath:(id)a3 inLibrary:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v40 = v5;
  v7 = [v5 allKeys];
  v8 = (void *)MEMORY[0x1E4F1C0D0];
  v9 = +[PLInternalResource entityName];
  v10 = [v8 fetchRequestWithEntityName:v9];

  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"fileID", v7];
  [v10 setPredicate:v11];
  v12 = [v6 managedObjectContext];
  id v45 = 0;
  v13 = [v12 executeFetchRequest:v10 error:&v45];
  id v14 = v45;
  if (!v13)
  {
    v15 = PLResourceCachingGetLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v47 = (uint64_t)v7;
    __int16 v48 = 2112;
    id v49 = v14;
    v30 = "Failed to fetch resources with fileIDs %@: %@";
    v31 = v15;
    os_log_type_t v32 = OS_LOG_TYPE_ERROR;
    uint32_t v33 = 22;
LABEL_22:
    _os_log_impl(&dword_19B3C7000, v31, v32, v30, buf, v33);
    goto LABEL_23;
  }
  if (![v13 count])
  {
    v15 = PLResourceCachingGetLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v47 = (uint64_t)v7;
    v30 = "Do not find any resources matching fileIDs: %@";
    v31 = v15;
    os_log_type_t v32 = OS_LOG_TYPE_INFO;
    uint32_t v33 = 12;
    goto LABEL_22;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    v34 = v13;
    v35 = v12;
    v36 = v11;
    v37 = v10;
    v38 = v7;
    id v39 = v6;
    uint64_t v18 = *(void *)v42;
    while (1)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v21 = [v20 cplFileURL];
        v22 = [v21 path];

        uint64_t v23 = [v20 fileID];
        v24 = [NSNumber numberWithLongLong:v23];
        v25 = [v40 objectForKeyedSubscript:v24];

        if ([v22 length] && objc_msgSend(v25, "containsString:", v22))
        {
          v26 = PLResourceCachingGetLog();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
            goto LABEL_15;
          }
          *(_DWORD *)buf = 134218242;
          uint64_t v47 = v23;
          __int16 v48 = 2112;
          id v49 = v25;
          v27 = v26;
          os_log_type_t v28 = OS_LOG_TYPE_INFO;
          v29 = "Marked resource as not locally available for fileID %lld path %@";
        }
        else
        {
          v26 = PLResourceCachingGetLog();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            goto LABEL_15;
          }
          *(_DWORD *)buf = 138412546;
          uint64_t v47 = (uint64_t)v22;
          __int16 v48 = 2112;
          id v49 = v25;
          v27 = v26;
          os_log_type_t v28 = OS_LOG_TYPE_ERROR;
          v29 = "Mismatch between resource file path %@ and purged path %@";
        }
        _os_log_impl(&dword_19B3C7000, v27, v28, v29, buf, 0x16u);
LABEL_15:

        [v20 markAsNotLocallyAvailableAfterPurge];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (!v17)
      {
        v7 = v38;
        id v6 = v39;
        v11 = v36;
        v10 = v37;
        v13 = v34;
        v12 = v35;
        break;
      }
    }
  }
LABEL_23:
}

- (void)markAsNotLocallyAvailableForResourcesWithFileIDsToPath:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(PLCacheDeleteSupport *)self _newShortLivedPhotoLibrary];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __79__PLCacheDeleteSupport_markAsNotLocallyAvailableForResourcesWithFileIDsToPath___block_invoke;
    v9[3] = &unk_1E5873A50;
    id v10 = v4;
    v11 = self;
    id v12 = v5;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__PLCacheDeleteSupport_markAsNotLocallyAvailableForResourcesWithFileIDsToPath___block_invoke_70;
    v7[3] = &unk_1E5875CE0;
    id v8 = v12;
    id v6 = v12;
    [v6 performTransactionAndWait:v9 completionHandler:v7];
  }
}

uint64_t __79__PLCacheDeleteSupport_markAsNotLocallyAvailableForResourcesWithFileIDsToPath___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    id v4 = [*(id *)(*(void *)(a1 + 40) + 16) libraryURL];
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_INFO, "Marking %ld resources as not locally available for libraryURL: %@", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 40) _markAsNotLocallyAvailableForResourcesWithFileIDsToPath:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 48)];
}

void __79__PLCacheDeleteSupport_markAsNotLocallyAvailableForResourcesWithFileIDsToPath___block_invoke_70(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) libraryBundle];
  [v1 touch];
}

- (BOOL)isFilePurgedForFileID:(id)a3 purgedPath:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 longLongValue] < 0)
  {
    __int16 v8 = [NSString stringWithFormat:@"Invalid fileID %@ for purgedPath %@", v5, v6];
    PLSimulateCrash();

    LOBYTE(v8) = 0;
  }
  else
  {
    [v5 unsignedLongLongValue];
    unsigned int v7 = openbyid_np();
    LODWORD(v8) = v7 >> 31;
    if ((v7 & 0x80000000) == 0)
    {
      int v9 = v7;
      uint64_t v10 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v5;
        __int16 v14 = 2112;
        id v15 = v6;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Received purging notification for fileID %@ purgedPath %@ that still exists", buf, 0x16u);
      }

      close(v9);
    }
  }

  return (char)v8;
}

- (void)rescanResourcesFromFileSystem
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLCacheDeleteSupport *)self _newShortLivedPhotoLibrary];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__92087;
  uint64_t v23 = __Block_byref_object_dispose__92088;
  id v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PLCacheDeleteSupport_rescanResourcesFromFileSystem__block_invoke;
  v11[3] = &unk_1E5874900;
  id v13 = &v15;
  v11[4] = self;
  id v4 = v3;
  id v12 = v4;
  __int16 v14 = &v19;
  [v4 performTransactionAndWait:v11];
  if (*((unsigned char *)v16 + 24))
  {
    id v5 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "Successfully updated resource local availability";
      unsigned int v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v7, v8, v6, buf, v9);
    }
  }
  else
  {
    id v5 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = v20[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v10;
      id v6 = "Failed to update resource local availability: %@";
      unsigned int v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 12;
      goto LABEL_6;
    }
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

void __53__PLCacheDeleteSupport_rescanResourcesFromFileSystem__block_invoke(uint64_t a1)
{
  v2 = objc_opt_class();
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  LOBYTE(v2) = [v2 verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:v3 countPresent:0 countMissing:0 countUnableToVerify:0 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)v2;
}

- (id)purgeableDirectories
{
  id v3 = objc_opt_class();
  uint64_t v4 = [(PLLibraryServicesManager *)self->_lsm pathManager];
  id v5 = [v3 _purgeableResourceDirectoriesForPathManager:v4];

  return v5;
}

- (BOOL)clearPurgeableFlagsForAllResources
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLLibraryServicesManager *)self->_lsm pathManager];
  uint64_t v4 = [v3 libraryURL];

  BOOL v5 = v4 != 0;
  if (v4)
  {
    if (![(id)objc_opt_class() clearPurgeableFlagsForAllResourcesInPhotoLibraryURL:v4])
    {
      BOOL v5 = 0;
      goto LABEL_10;
    }
    id v6 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Resetting fileID for all resources", buf, 2u);
    }

    id v7 = [(PLCacheDeleteSupport *)self _newShortLivedPhotoLibrary];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__PLCacheDeleteSupport_clearPurgeableFlagsForAllResources__block_invoke;
    v11[3] = &unk_1E5875CE0;
    id v12 = v7;
    os_log_type_t v8 = v7;
    [v8 performTransactionAndWait:v11];
  }
  else
  {
    os_log_type_t v8 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      lsm = self->_lsm;
      *(_DWORD *)buf = 138412290;
      __int16 v14 = lsm;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "No photoLibraryURL from library services manager %@", buf, 0xCu);
    }
  }

LABEL_10:
  return v5;
}

void __58__PLCacheDeleteSupport_clearPurgeableFlagsForAllResources__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = [*(id *)(a1 + 32) managedObjectContext];
  id v10 = 0;
  BOOL v2 = +[PLInternalResource batchResetFileIDInManagedObjectContext:v1 error:&v10];
  id v3 = v10;

  uint64_t v4 = PLResourceCachingGetLog();
  BOOL v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "Successfully reset internal resource fileIDs";
      id v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v7, v8, v6, buf, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    id v6 = "Failed to reset internal resource fileID: %@";
    id v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    uint32_t v9 = 12;
    goto LABEL_6;
  }
}

- (BOOL)markResourceAsPurgeable:(id)a3 withUrgency:(int64_t)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PLLibraryServicesManager *)self->_lsm pathManager];
  os_log_type_t v8 = [v7 capabilities];
  int v9 = [v8 isCentralizedCacheDeleteCapable];

  if (v9)
  {
    id v10 = [(PLLibraryServicesManager *)self->_lsm cplSettings];
    int v11 = [v10 isKeepOriginalsEnabled];

    if (v11
      && (+[PLInternalResource originalCPLResourceTypes],
          id v12 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "cplType")),
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v12 containsObject:v13],
          v13,
          v12,
          v14))
    {
      uint64_t v15 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = [v6 singleLineDescription];
        *(_DWORD *)buf = 138412290;
        v30 = v16;
        uint64_t v17 = "Download & Keep Originals mode, skip marking original resource %@ as purgeable";
        char v18 = v15;
        uint32_t v19 = 12;
LABEL_10:
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, v17, buf, v19);
      }
    }
    else
    {
      if (!self->_exitDeleteTime)
      {
        uint64_t v15 = [v6 fileURL];
        uint64_t v28 = 0;
        id v27 = 0;
        int v20 = [(id)objc_opt_class() markPurgeableForFileAtURL:v15 withUrgency:a4 outInode:&v28 error:&v27];
        id v22 = v27;
        if (v20)
        {
          if (v28)
          {
            uint64_t v23 = [v6 fileID];
            if (v23 != v28) {
              objc_msgSend(v6, "setFileID:");
            }
          }
          else
          {
            id v24 = PLResourceCachingGetLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v30 = (NSDate *)v15;
              _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Unexpected inode value of 0 for %@", buf, 0xCu);
            }

            v25 = [NSString stringWithFormat:@"Unexpected inode value of 0 for %@", v15];
            PLSimulateCrash();
          }
        }
        else if (PLIsErrorEqualToCode())
        {
          [v6 markAsNotLocallyAvailable];
        }

        goto LABEL_22;
      }
      uint64_t v15 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        exitDeleteTime = self->_exitDeleteTime;
        uint64_t v16 = [v6 singleLineDescription];
        *(_DWORD *)buf = 138412546;
        v30 = exitDeleteTime;
        __int16 v31 = 2112;
        os_log_type_t v32 = v16;
        uint64_t v17 = "In exit mode (%@), skip marking resource %@ as purgeable";
        char v18 = v15;
        uint32_t v19 = 22;
        goto LABEL_10;
      }
    }
    LOBYTE(v20) = 0;
LABEL_22:

    goto LABEL_23;
  }
  LOBYTE(v20) = 0;
LABEL_23:

  return v20;
}

- (id)_newShortLivedPhotoLibrary
{
  BOOL v2 = [(PLLibraryServicesManager *)self->_lsm databaseContext];
  id v3 = (void *)[v2 newShortLivedCplLibraryWithNameSuffix:"-[PLCacheDeleteSupport _newShortLivedPhotoLibrary]"];

  return v3;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2048;
    os_log_type_t v8 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PLCacheDeleteSupport;
  [(PLCacheDeleteSupport *)&v4 dealloc];
}

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412546;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2048;
    os_log_type_t v8 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p invalidate", (uint8_t *)&v5, 0x16u);
  }

  objc_super v4 = [(PLLibraryServicesManager *)self->_lsm cacheDeleteRegistration];
  [v4 unregisterCacheDeleteSupport:self withLibraryServicesManager:self->_lsm];
}

- (PLCacheDeleteSupport)initWithLibraryServicesManager:(id)a3 cplStatus:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PLCacheDeleteSupport;
  uint64_t v9 = [(PLCacheDeleteSupport *)&v21 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lsm, a3);
    lsm = v10->_lsm;
    if (!lsm)
    {
      id v12 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "libraryServicesManager passed to PLCacheDeleteSupport is nil", buf, 2u);
      }

      lsm = v10->_lsm;
    }
    uint64_t v13 = [(PLLibraryServicesManager *)lsm pathManager];
    int v14 = [v13 libraryURL];

    v10->_fsid = (fsid)[(id)objc_opt_class() fsidForURL:v14];
    uint64_t v15 = [v8 exitDeleteTime];
    exitDeleteTime = v10->_exitDeleteTime;
    v10->_exitDeleteTime = (NSDate *)v15;

    uint64_t v17 = [v7 cacheDeleteRegistration];
    [v17 registerCacheDeleteSupport:v10 withLibraryServicesManager:v7];
  }
  char v18 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = objc_opt_class();
    *(_DWORD *)buf = 138412802;
    uint64_t v23 = v19;
    __int16 v24 = 2048;
    v25 = v10;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "%@ %p initWithLibraryServicesManager:%@", buf, 0x20u);
  }

  return v10;
}

+ (void)clearPurgeableIsCloneStateOnPurgeableResourcesOnceIfNecessaryInManagedObjectContext:(id)a3 pathManager:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F8B858];
  id v8 = [v6 libraryURL];
  uint64_t v9 = [v7 appPrivateDataForLibraryURL:v8];

  id v10 = [v9 valueForKey:@"CacheDeleteSupport.clearPurgeableIsCloneStateOnPurgeableResourcesOnce"];
  int v11 = [v10 BOOLValue];

  if (!v11) {
    goto LABEL_15;
  }
  id v12 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Calling APFSIOC_GET_CLONE_INFO on all purgeable resources to clear is-clone flag", buf, 2u);
  }

  uint64_t v13 = (void *)MEMORY[0x1E4F1C0D0];
  int v14 = +[PLInternalResource entityName];
  uint64_t v15 = [v13 fetchRequestWithEntityName:v14];

  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %lld", @"fileID", -1);
  [v15 setPredicate:v16];

  uint64_t v33 = 0;
  *(void *)buf = 0;
  v30 = buf;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __120__PLCacheDeleteSupport_clearPurgeableIsCloneStateOnPurgeableResourcesOnceIfNecessaryInManagedObjectContext_pathManager___block_invoke;
  v28[3] = &unk_1E58716C8;
  v28[4] = buf;
  uint64_t v17 = [v5 enumerateObjectsFromFetchRequest:v15 count:&v33 usingDefaultBatchSizeWithBlock:v28];
  if (v17)
  {
    char v18 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v34 = 138412290;
      id v35 = v17;
      uint64_t v19 = "Failed to fetch purgeable resources for APFSIOC_GET_CLONE_INFO: %@";
      int v20 = v18;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      uint32_t v22 = 12;
LABEL_9:
      _os_log_impl(&dword_19B3C7000, v20, v21, v19, v34, v22);
    }
  }
  else
  {
    char v18 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *((void *)v30 + 3);
      *(_DWORD *)v34 = 134218240;
      id v35 = v33;
      __int16 v36 = 2048;
      uint64_t v37 = v23;
      uint64_t v19 = "Called APFSIOC_GET_CLONE_INFO on %lu purgeable resources (%lu failed)";
      int v20 = v18;
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
      uint32_t v22 = 22;
      goto LABEL_9;
    }
  }

  id v27 = 0;
  char v24 = [v9 setValue:0 forKey:@"CacheDeleteSupport.clearPurgeableIsCloneStateOnPurgeableResourcesOnce" error:&v27];
  id v25 = v27;
  if ((v24 & 1) == 0)
  {
    __int16 v26 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v34 = 138412290;
      id v35 = v25;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Failed to unset PLCacheDeleteSupportClearPurgeableIsCloneStateOnPurgeableResourcesOnceKey: %@", v34, 0xCu);
    }
  }
  _Block_object_dispose(buf, 8);

LABEL_15:
}

void __120__PLCacheDeleteSupport_clearPurgeableIsCloneStateOnPurgeableResourcesOnceIfNecessaryInManagedObjectContext_pathManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 fileURL];
  objc_super v4 = (const char *)[v3 fileSystemRepresentation];

  if (v4)
  {
    v8[0] = 0;
    v8[1] = 0;
    if (fsctl(v4, 0x40104A0EuLL, v8, 0) == -1)
    {
      id v5 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = __error();
        id v7 = strerror(*v6);
        *(_DWORD *)buf = 136315394;
        id v10 = v4;
        __int16 v11 = 2080;
        id v12 = v7;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Failed to get APFSIOC_GET_CLONE_INFO on resource at path %s: %s", buf, 0x16u);
      }

      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
}

+ (BOOL)setClearPurgeableIsCloneStateOnPurgeableResourcesOnceWithPathManager:(id)a3 error:(id *)a4
{
  id v5 = (void *)MEMORY[0x1E4F8B858];
  id v6 = [a3 libraryURL];
  id v7 = [v5 appPrivateDataForLibraryURL:v6];

  LOBYTE(a4) = [v7 setValue:MEMORY[0x1E4F1CC38] forKey:@"CacheDeleteSupport.clearPurgeableIsCloneStateOnPurgeableResourcesOnce" error:a4];
  return (char)a4;
}

+ (BOOL)verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:(id)a3 countPresent:(int64_t *)a4 countMissing:(int64_t *)a5 countUnableToVerify:(int64_t *)a6 error:(id *)a7
{
  v93[1] = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x2020000000;
  char v83 = 1;
  id v10 = +[PLInternalResource fetchRequest];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %lld AND %K >= %d", @"fileID", -1, @"localAvailability", 1);
  [v10 setPredicate:v11];
  [v10 setFetchBatchSize:100];
  v93[0] = @"fileID";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:1];
  [v10 setPropertiesToFetch:v12];
  v40 = (void *)v11;
  long long v43 = v10;

  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__92087;
  v78 = __Block_byref_object_dispose__92088;
  id v79 = 0;
  id obj = 0;
  long long v44 = [v45 executeFetchRequest:v10 error:&obj];
  objc_storeStrong(&v79, obj);
  if (v44)
  {
    uint64_t v13 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v44 count];
      *(_DWORD *)buf = 134217984;
      v85 = (const char *)v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Verifying localAvailability for %ld resources presumed to be local...", buf, 0xCu);
    }

    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x2020000000;
    uint64_t v72 = 0;
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x2020000000;
    uint64_t v68 = 0;
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2020000000;
    uint64_t v64 = 0;
    id v15 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    uint64_t v16 = [v45 pathManager];
    id v39 = [v16 libraryURL];

    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2810000000;
    v59[3] = &unk_19BBAE189;
    fsid v60 = 0;
    fsid v60 = +[PLCacheDeleteSupport fsidForURL:v39];
    uint64_t v17 = malloc_type_calloc(1uLL, 0x400uLL, 0x13E05E6AuLL);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __158__PLCacheDeleteSupport_verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext_countPresent_countMissing_countUnableToVerify_error___block_invoke;
    v50[3] = &unk_1E58716A0;
    v52 = v59;
    v53 = &v69;
    v58 = v17;
    v54 = &v61;
    id v41 = v15;
    id v51 = v41;
    v55 = &v80;
    v56 = &v74;
    v57 = &v65;
    uint64_t v18 = [v45 enumerateWithIncrementalSaveUsingObjects:v44 shouldRefreshAfterSave:0 withBlock:v50];
    uint64_t v19 = (void *)v75[5];
    v75[5] = v18;

    free(v17);
    if (a4) {
      *a4 = v66[3];
    }
    if (a5) {
      *a5 = v70[3];
    }
    if (a6) {
      *a6 = v62[3];
    }
    if ([v41 count])
    {
      int v20 = [MEMORY[0x1E4F28E78] string];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v21 = v41;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v92 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v47 != v23) {
              objc_enumerationMutation(v21);
            }
            id v25 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            __int16 v26 = strerror([v25 intValue]);
            id v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "countForObject:", v25));
            [v20 appendFormat:@"[error: %@/%s, count: %@] ", v25, v26, v27];
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v92 count:16];
        }
        while (v22);
      }

      uint64_t v28 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v85 = "+[PLCacheDeleteSupport verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:c"
              "ountPresent:countMissing:countUnableToVerify:error:]";
        __int16 v86 = 2114;
        v87 = v20;
        _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "%s: Encountered errors while verifying local availbility: %{public}@", buf, 0x16u);
      }
    }
    if (v75[5])
    {
      *((unsigned char *)v81 + 24) = 0;
      v29 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = (void *)v75[5];
        *(_DWORD *)buf = 136315394;
        v85 = "+[PLCacheDeleteSupport verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:c"
              "ountPresent:countMissing:countUnableToVerify:error:]";
        __int16 v86 = 2112;
        v87 = v30;
        _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "%s: Error updating resource local availability: %@", buf, 0x16u);
      }
    }
    uint64_t v31 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = (void *)v70[3];
      uint64_t v33 = v66[3];
      uint64_t v34 = v62[3];
      *(_DWORD *)buf = 136315906;
      v85 = "+[PLCacheDeleteSupport verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:cou"
            "ntPresent:countMissing:countUnableToVerify:error:]";
      __int16 v86 = 2048;
      v87 = v32;
      __int16 v88 = 2048;
      uint64_t v89 = v33;
      __int16 v90 = 2048;
      uint64_t v91 = v34;
      _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "%s: Count missing: %ld, Count present: %ld, Count unable to verify: %ld", buf, 0x2Au);
    }

    _Block_object_dispose(v59, 8);
    _Block_object_dispose(&v61, 8);
    _Block_object_dispose(&v65, 8);
    _Block_object_dispose(&v69, 8);
  }
  else
  {
    *((unsigned char *)v81 + 24) = 0;
    id v35 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      __int16 v36 = (void *)v75[5];
      *(_DWORD *)buf = 136315394;
      v85 = "+[PLCacheDeleteSupport verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:cou"
            "ntPresent:countMissing:countUnableToVerify:error:]";
      __int16 v86 = 2112;
      v87 = v36;
      _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "%s: Error fetching resources: %@", buf, 0x16u);
    }
  }
  if (a7) {
    *a7 = (id) v75[5];
  }
  BOOL v37 = *((unsigned char *)v81 + 24) != 0;

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v80, 8);

  return v37;
}

void __158__PLCacheDeleteSupport_verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext_countPresent_countMissing_countUnableToVerify_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 fileID];
  if (fsgetpath(*(char **)(a1 + 88), 0x400uLL, (fsid_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), v4) != -1)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    goto LABEL_17;
  }
  if (*__error() == 2)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v6 = *(void *)(v5 + 24);
    if (v6 > 49)
    {
LABEL_16:
      *(void *)(v5 + 24) = v6 + 1;
      [v3 markAsNotLocallyAvailable];
      goto LABEL_17;
    }
    id v7 = [v3 asset];
    id v8 = [v7 uuid];

    uint64_t v9 = PLResourceCachingGetLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v10)
      {
        uint64_t v11 = [v3 objectID];
        uint64_t v12 = [v3 fileID];
        uint64_t v13 = [v3 fileURL];
        int v24 = 136315906;
        id v25 = "+[PLCacheDeleteSupport verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:c"
              "ountPresent:countMissing:countUnableToVerify:error:]_block_invoke";
        __int16 v26 = 2114;
        uint64_t v27 = (uint64_t)v11;
        __int16 v28 = 2048;
        uint64_t v29 = v12;
        __int16 v30 = 2112;
        uint64_t v31 = v13;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "%s: Fixing broken localAvailability for resource: %{public}@, with fileID: %lld, expected at url: %@", (uint8_t *)&v24, 0x2Au);
LABEL_14:
      }
    }
    else if (v10)
    {
      uint64_t v11 = [v3 objectID];
      uint64_t v21 = [v3 fileID];
      uint64_t v13 = [v3 asset];
      uint64_t v22 = [v3 asset];
      uint64_t v23 = [v22 uuid];
      int v24 = 136316162;
      id v25 = "+[PLCacheDeleteSupport verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:cou"
            "ntPresent:countMissing:countUnableToVerify:error:]_block_invoke";
      __int16 v26 = 2114;
      uint64_t v27 = (uint64_t)v11;
      __int16 v28 = 2048;
      uint64_t v29 = v21;
      __int16 v30 = 2048;
      uint64_t v31 = v13;
      __int16 v32 = 2114;
      uint64_t v33 = v23;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "%s: Fixing broken localAvailability for resource: %{public}@, with fileID: %lld, asset %p uuid %{public}@", (uint8_t *)&v24, 0x34u);

      goto LABEL_14;
    }

    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v6 = *(void *)(v5 + 24);
    goto LABEL_16;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v14 = *(void **)(a1 + 32);
  id v15 = [NSNumber numberWithInt:*__error()];
  [v14 addObject:v15];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v16 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = *__error();
      int v24 = 136315650;
      id v25 = "+[PLCacheDeleteSupport verifyAndFixLocalAvailabilityForMissingResourcesUsingFileIDInManagedObjectContext:cou"
            "ntPresent:countMissing:countUnableToVerify:error:]_block_invoke";
      __int16 v26 = 2048;
      uint64_t v27 = v4;
      __int16 v28 = 1024;
      LODWORD(v29) = v17;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "%s: Error getting path from inode: %llu, errno: %d", (uint8_t *)&v24, 0x1Cu);
    }

    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:47014 userInfo:0];
    uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
    int v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
LABEL_17:
}

+ (fsid)fsidForURL:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(&v6, 0, sizeof(v6));
  id v3 = (const char *)[a3 fileSystemRepresentation];
  if (stat(v3, &v6))
  {
    uint64_t v4 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v8 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "could not get device ID for %s", buf, 0xCu);
    }

    return (fsid)0;
  }
  else
  {
    return (fsid)v6.st_dev;
  }
}

+ (id)_purgeableResourceDirectoriesForPathManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _clearablePurgeableResourceDirectoriesForPathManager:v4];
  stat v6 = [a1 _unclearablePurgeableResourceDirectoriesForPathManager:v4];

  id v7 = [v5 setByAddingObjectsFromSet:v6];

  return v7;
}

+ (id)_unclearablePurgeableResourceDirectoriesForPathManager:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v5 = [v3 photoDirectoryWithType:26];
  v11[0] = v5;
  stat v6 = [v3 photoDirectoryWithType:18];
  v11[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v8 = (void *)[v4 initWithArray:v7];

  if ([v3 isDCIM])
  {
    uint64_t v9 = [v3 photoDirectoryWithType:30];
    [v8 addObject:v9];
  }
  return v8;
}

+ (id)_clearablePurgeableResourceDirectoriesForPathManager:(id)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  id v5 = [v3 alloc];
  stat v6 = [v4 photoDirectoryWithType:4];
  v14[0] = v6;
  id v7 = [v4 photoDirectoryWithType:29];
  v14[1] = v7;
  id v8 = [v4 photoDirectoryWithType:10];
  v14[2] = v8;
  uint64_t v9 = [v4 photoDirectoryWithType:9];
  v14[3] = v9;
  BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  uint64_t v11 = (void *)[v5 initWithArray:v10];

  if ([v4 isDCIM]) {
    [v4 privateDirectoryWithSubType:7];
  }
  else {
  uint64_t v12 = [v4 photoDirectoryWithType:25];
  }

  [v11 addObject:v12];
  return v11;
}

+ (id)purgeableStateDescriptionForFile:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    char v9 = 0;
    uint64_t v8 = -1;
    if (!+[PLCacheDeleteSupport isPurgeableFile:v3 outIsPhotoType:&v9 outUrgencyLevel:&v8 error:0])goto LABEL_7; {
    if (!v9)
    }
    {
      stat v6 = @"[N]";
      goto LABEL_9;
    }
    if ((unint64_t)(v8 + 1) <= 3) {
      stat v6 = off_1E58716E8[v8 + 1];
    }
    else {
LABEL_7:
    }
      stat v6 = &stru_1EEB2EB80;
  }
  else
  {
    stat v6 = @"[E]";
  }
LABEL_9:

  return v6;
}

+ (BOOL)isPurgeableFile:(id)a3 outIsPhotoType:(BOOL *)a4 outUrgencyLevel:(int64_t *)a5 error:(id *)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  id v9 = a3;
  int v10 = fsctl((const char *)[v9 fileSystemRepresentation], 0x40084A47uLL, &v24, 0);
  if (v10)
  {
    int v11 = v10;
    int v12 = *__error();
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28798];
    uint64_t v31 = *MEMORY[0x1E4F28228];
    id v15 = [NSString stringWithUTF8String:strerror(v12)];
    v32[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    int v17 = [v13 errorWithDomain:v14 code:v12 userInfo:v16];

    uint64_t v18 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = strerror(v12);
      *(_DWORD *)buf = 138412802;
      id v26 = v9;
      __int16 v27 = 1024;
      int v28 = v11;
      __int16 v29 = 2080;
      __int16 v30 = v19;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Unable to check purgeable flag for %@ %d (%s)", buf, 0x1Cu);
    }

    if (a6) {
      *a6 = v17;
    }
  }
  else
  {
    __int16 v21 = v24;
    if (v24)
    {
      if (a4) {
        *a4 = v24 & 1;
      }
      if (a5)
      {
        if ((v21 & 0x200) != 0)
        {
          *a5 = 0;
        }
        else
        {
          if ((v21 & 0x400) != 0)
          {
            BOOL v20 = 1;
            *a5 = 1;
            goto LABEL_21;
          }
          if ((v21 & 0x800) != 0) {
            int64_t v22 = 2;
          }
          else {
            int64_t v22 = -1;
          }
          *a5 = v22;
        }
      }
      BOOL v20 = 1;
      goto LABEL_21;
    }
  }
  BOOL v20 = 0;
LABEL_21:

  return v20;
}

+ (BOOL)clearPurgeableFlagsForAllResourcesInPhotoLibraryURL:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = PLResourceCachingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Clearing purgeable flags for all resources in %@.", (uint8_t *)&buf, 0xCu);
  }

  id v25 = v3;
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F8B980]) initWithLibraryURL:v3];
  int v5 = [(id)objc_opt_class() _clearablePurgeableResourceDirectoriesForPathManager:v24];
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  long long buf = 0x100000002uLL;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    char v9 = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(id *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v12 = fsctl((const char *)[v11 fileSystemRepresentation], 0xC0204A49uLL, &buf, 0);
        if (!v12)
        {
          uint64_t v16 = PLResourceCachingGetLog();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_18;
          }
          *(_DWORD *)__int16 v30 = 138412290;
          id v31 = v11;
          int v17 = v16;
          uint64_t v18 = "Cleared purgeable flags under %@";
          goto LABEL_14;
        }
        uint64_t v13 = v12;
        int v14 = *__error();
        id v15 = PLResourceCachingGetLog();
        uint64_t v16 = v15;
        if (v14 == 2)
        {
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_18;
          }
          *(_DWORD *)__int16 v30 = 138412290;
          id v31 = v11;
          int v17 = v16;
          uint64_t v18 = "%@ does not exist, skip clearing the purgeable flags";
LABEL_14:
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, v18, v30, 0xCu);
          goto LABEL_18;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = __error();
          BOOL v20 = strerror(*v19);
          *(_DWORD *)__int16 v30 = 138412802;
          id v31 = v11;
          __int16 v32 = 1024;
          int v33 = v13;
          __int16 v34 = 2080;
          id v35 = v20;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to clear purgeable flag for %@ %d (%s)", v30, 0x1Cu);
        }

        __int16 v21 = NSString;
        int64_t v22 = __error();
        uint64_t v16 = [v21 stringWithFormat:@"Failed to clear purgeable flag for %@ %d (%s)", v11, v13, strerror(*v22)];
        PLSimulateCrash();
        char v9 = 0;
LABEL_18:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v36 count:16];
      if (!v7) {
        goto LABEL_22;
      }
    }
  }
  char v9 = 1;
LABEL_22:

  return v9 & 1;
}

+ (BOOL)clearPurgeableFlagForResource:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 pathManager];
  int v5 = [v4 capabilities];
  int v6 = [v5 isCentralizedCacheDeleteCapable];

  if (v6)
  {
    uint64_t v7 = [v3 fileURL];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
      int v10 = open((const char *)[v9 fileSystemRepresentation], 0);
      if (v10 < 0)
      {
        __int16 v21 = PLResourceCachingGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v33.st_dev = 138412546;
          *(void *)&v33.st_mode = v9;
          WORD2(v33.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&v33.st_ino + 6) = (__darwin_ino64_t)v3;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Missing file %@ to clear purgeable flag for %@, marking as not locally available", (uint8_t *)&v33, 0x16u);
        }

        [v3 markAsNotLocallyAvailable];
      }
      else
      {
        int v11 = v10;
        memset(&v33, 0, sizeof(v33));
        if (fstat(v10, &v33) != -1)
        {
          __darwin_ino64_t st_ino = v33.st_ino;
          if ([v3 fileID] != st_ino)
          {
            uint64_t v13 = PLResourceCachingGetLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 134218498;
              uint64_t v28 = [v3 fileID];
              __int16 v29 = 2048;
              __darwin_ino64_t v30 = st_ino;
              __int16 v31 = 2112;
              v32[0] = v9;
              _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Mismatch fileID between model %lld and file system %lld for file %@", buf, 0x20u);
            }
          }
          uint64_t v26 = 0;
          int v14 = ffsctl(v11, 0xC0084A44uLL, &v26, 0);
          BOOL v15 = v14 == 0;
          uint64_t v16 = PLResourceCachingGetLog();
          int v17 = v16;
          if (v14)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              uint64_t v18 = __error();
              uint64_t v19 = strerror(*v18);
              *(_DWORD *)long long buf = 138413058;
              uint64_t v28 = (uint64_t)v9;
              __int16 v29 = 2048;
              __darwin_ino64_t v30 = st_ino;
              __int16 v31 = 1024;
              LODWORD(v32[0]) = v14;
              WORD2(v32[0]) = 2080;
              *(void *)((char *)v32 + 6) = v19;
              _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Failed to clear purgeable flag for %@ (%lld): %d (%s", buf, 0x26u);
            }
          }
          else
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412546;
              uint64_t v28 = (uint64_t)v9;
              __int16 v29 = 2048;
              __darwin_ino64_t v30 = st_ino;
              _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_INFO, "Cleared purgeable flag for %@ (%lld)", buf, 0x16u);
            }

            [v3 setFileID:-1];
          }
          close(v11);
          goto LABEL_28;
        }
        int64_t v22 = PLResourceCachingGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = __error();
          uint64_t v24 = strerror(*v23);
          *(_DWORD *)long long buf = 138412546;
          uint64_t v28 = (uint64_t)v9;
          __int16 v29 = 2080;
          __darwin_ino64_t v30 = (__darwin_ino64_t)v24;
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Failed to get inode from %@ (%s), skip marking it as purgeable", buf, 0x16u);
        }

        close(v11);
      }
    }
    else
    {
      BOOL v20 = PLResourceCachingGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v33.st_dev = 138412290;
        *(void *)&v33.st_mode = v3;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Missing fileURL to clear purgeable flag for %@", (uint8_t *)&v33, 0xCu);
      }
    }
    BOOL v15 = 0;
LABEL_28:

    goto LABEL_29;
  }
  BOOL v15 = 0;
LABEL_29:

  return v15;
}

+ (BOOL)markPurgeableForFileAtURL:(id)a3 withUrgency:(int64_t)a4 outInode:(unint64_t *)a5 error:(id *)a6
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  int v10 = v9;
  if (!v9)
  {
    BOOL v15 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v57.st_dev = 138412290;
      *(void *)&v57.st_mode = 0;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Missing fileURL to mark purgeable for %@", (uint8_t *)&v57, 0xCu);
    }

    goto LABEL_21;
  }
  id v11 = v9;
  int v12 = open((const char *)[v11 fileSystemRepresentation], 0);
  if (v12 < 0)
  {
    int v16 = *__error();
    int v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28798];
    uint64_t v58 = *MEMORY[0x1E4F28228];
    uint64_t v19 = [NSString stringWithUTF8String:strerror(v16)];
    v59[0] = v19;
    BOOL v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:&v58 count:1];
    __int16 v21 = [v17 errorWithDomain:v18 code:v16 userInfo:v20];

    int64_t v22 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v57.st_dev = 138412802;
      *(void *)&v57.st_mode = v11;
      WORD2(v57.st_ino) = 2082;
      *(__darwin_ino64_t *)((char *)&v57.st_ino + 6) = (__darwin_ino64_t)strerror(v16);
      HIWORD(v57.st_gid) = 1024;
      v57.st_rdev = v16;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Missing file to mark purgeable for %@ (%{public}s [%d])", (uint8_t *)&v57, 0x1Cu);
    }

    if (a6) {
      *a6 = v21;
    }

    goto LABEL_21;
  }
  int v13 = v12;
  memset(&v57, 0, sizeof(v57));
  if (fstat(v12, &v57) == -1)
  {
    int v23 = *__error();
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28798];
    uint64_t v55 = *MEMORY[0x1E4F28228];
    uint64_t v26 = [NSString stringWithUTF8String:strerror(v23)];
    v56 = v26;
    long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    uint64_t v28 = [v24 errorWithDomain:v25 code:v23 userInfo:v27];

    __int16 v29 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412802;
      id v48 = v11;
      __int16 v49 = 2082;
      *(void *)v50 = strerror(v23);
      *(_WORD *)&v50[8] = 1024;
      *(_DWORD *)&v50[10] = v23;
      _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Failed to get inode from %@ (%{public}s [%d]), skip marking it as purgeable", buf, 0x1Cu);
    }

    if (a6) {
      *a6 = v28;
    }
    close(v13);

LABEL_21:
    BOOL v30 = 0;
    goto LABEL_36;
  }
  uint64_t v46 = 65537;
  switch(a4)
  {
    case 2:
      uint64_t v14 = 67585;
      goto LABEL_24;
    case 1:
      uint64_t v14 = 66561;
      goto LABEL_24;
    case 0:
      uint64_t v14 = 66049;
LABEL_24:
      uint64_t v46 = v14;
      break;
  }
  id v45 = v11;
  int v31 = ffsctl(v13, 0xC0084A44uLL, &v46, 0);
  BOOL v30 = v31 == 0;
  if (v31)
  {
    int v32 = v31;
    long long v44 = a6;
    int v33 = *__error();
    uint64_t v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28798];
    uint64_t v53 = *MEMORY[0x1E4F28228];
    __int16 v36 = [NSString stringWithUTF8String:strerror(v33)];
    v54 = v36;
    BOOL v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    uint64_t v38 = [v34 errorWithDomain:v35 code:v33 userInfo:v37];

    uint64_t v39 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = strerror(v33);
      *(_DWORD *)long long buf = 138413314;
      id v48 = v45;
      __int16 v49 = 1024;
      *(_DWORD *)v50 = v32;
      *(_WORD *)&void v50[4] = 2082;
      *(void *)&v50[6] = v40;
      *(_WORD *)&v50[14] = 1024;
      *(_DWORD *)&v50[16] = v33;
      __int16 v51 = 2048;
      uint64_t v52 = v46;
      _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "Failed to mark %@ as purgeable %d (%{public}s [%d]) (flags 0x%llx)", buf, 0x2Cu);
    }

    if (v44) {
      *long long v44 = v38;
    }
  }
  else
  {
    __darwin_ino64_t st_ino = v57.st_ino;
    long long v42 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412802;
      id v48 = v45;
      __int16 v49 = 2048;
      *(void *)v50 = st_ino;
      *(_WORD *)&v50[8] = 2048;
      *(void *)&v50[10] = v46;
      _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_INFO, "Marked %@ as purgeable with fileID %lld flags 0x%llx", buf, 0x20u);
    }

    if (a5) {
      *a5 = st_ino;
    }
  }
  close(v13);
LABEL_36:

  return v30;
}

+ (BOOL)markPurgeableForFileAtURL:(id)a3 withUrgency:(int64_t)a4 outInode:(unint64_t *)a5
{
  return [a1 markPurgeableForFileAtURL:a3 withUrgency:a4 outInode:a5 error:0];
}

@end