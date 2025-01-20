@interface PLAssetsdSyncService
- (PLAssetsdSyncService)initWithLibraryServicesManager:(id)a3;
- (id)_fileRestoreExclusionPaths;
- (id)_readRestoreAlbumMetadataForAlbum:(id)a3;
- (void)_addAsset:(id)a3 toAlbumsForUUID:(id)a4 inLibrary:(id)a5;
- (void)_cleanupAlbumMetadataAsideFilesAfterRestore;
- (void)_finalizeOTARestoreEndedAndRecreateAlbums:(BOOL)a3;
- (void)_linkPathsAside:(id)a3;
- (void)_recoverAsideFiles:(id)a3;
- (void)_updatePendingCountForMissingAsset:(id)a3 inLibrary:(id)a4;
- (void)_updateRestoredAssetWithUUID:(id)a3 paths:(id)a4 fixAddedDate:(BOOL)a5;
- (void)finalizeOTARestoreRecreatingAlbums:(BOOL)a3;
- (void)updateRestoredAssetWithUUID:(id)a3 paths:(id)a4 fixAddedDate:(BOOL)a5;
@end

@implementation PLAssetsdSyncService

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_libraryServicesManager);
  objc_storeStrong((id *)&self->_libraryTransaction, 0);
  objc_storeStrong((id *)&self->_updateGroup, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

- (void)_addAsset:(id)a3 toAlbumsForUUID:(id)a4 inLibrary:(id)a5
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v65 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F1CA60];
  v61 = self;
  v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v12 = [v11 pathManager];
  v13 = [v12 pathToAssetsToAlbumsMapping];
  v14 = [v10 dictionaryWithContentsOfFile:v13];

  if (!v14)
  {
    v16 = PLMigrationGetLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v17 = "Error: Did not find the assets to albums mapping file.";
LABEL_10:
    v18 = v16;
    uint32_t v19 = 2;
    goto LABEL_11;
  }
  if (![v14 count])
  {
    v16 = PLMigrationGetLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v17 = "Error: The assests to albums mappings is empty.";
    goto LABEL_10;
  }
  v15 = [v14 objectForKey:v65];
  if (!v15)
  {
    v16 = PLMigrationGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v75 = v65;
      v17 = "Error: did not find the list of albums asset %@ is associated with";
      v18 = v16;
      uint32_t v19 = 12;
LABEL_11:
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    }
LABEL_12:

    v15 = 0;
  }
  v20 = [v8 pathForOriginalFile];
  v21 = [v20 stringByDeletingLastPathComponent];

  v22 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v21 isDirectory:1];
  int v73 = 0;
  +[PLModelMigrator shouldImportAssetsFromDCIMSubDirectoryAtURL:v22 assetsKind:&v73];
  if (v73 == 1)
  {
    v23 = [v9 allImportedPhotosAlbumCreateIfNeeded:0];
    if (v23) {
      goto LABEL_16;
    }
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __60__PLAssetsdSyncService__addAsset_toAlbumsForUUID_inLibrary___block_invoke;
    v71[3] = &unk_1E5875CE0;
    id v24 = v9;
    id v72 = v24;
    [v24 performTransactionAndWait:v71];
    v23 = [v24 allImportedPhotosAlbumCreateIfNeeded:0];

    if (v23)
    {
LABEL_16:
      v25 = [v23 mutableAssets];
      [v25 addObject:v8];
    }
  }
  if (+[PLAvalanche shouldOnlyShowAvalanchePicks]
    && [v8 isPartOfBurst]
    && ([v8 avalanchePickTypeIsVisible] & 1) == 0)
  {
    [v8 setVisibilityState:2];

    v15 = 0;
  }
  if ([v15 count])
  {
    v55 = v22;
    v56 = v21;
    v57 = v15;
    v58 = v14;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = v15;
    uint64_t v26 = [obj countByEnumeratingWithState:&v67 objects:v78 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v68;
      id v63 = v8;
      uint64_t v59 = *(void *)v68;
      id v60 = v9;
      do
      {
        uint64_t v29 = 0;
        uint64_t v62 = v27;
        do
        {
          if (*(void *)v68 != v28) {
            objc_enumerationMutation(obj);
          }
          v30 = *(void **)(*((void *)&v67 + 1) + 8 * v29);
          v31 = objc_msgSend(v9, "albumWithUuid:", v30, v55, v56, v57, v58);
          v32 = v31;
          if (v31)
          {
            if ([v31 kindValue] == 1000)
            {
              v33 = [v32 mutableAssets];
              uint64_t v34 = [v33 count];

              v35 = [v32 mutableAssets];
              uint64_t v36 = objc_msgSend(v35, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, v34, 1024, &__block_literal_global_81_58054);

              if (v36 == 0x7FFFFFFFFFFFFFFFLL) {
                uint64_t v37 = v34;
              }
              else {
                uint64_t v37 = v36;
              }
              v38 = [v32 mutableAssets];
              [v38 insertObject:v8 atIndex:v37];

              [v32 reducePendingItemsCountBy:1];
            }
            else
            {
              v66 = [(PLAssetsdSyncService *)v61 _readRestoreAlbumMetadataForAlbum:v30];
              v41 = [v66 assetUUIDs];
              unint64_t v42 = [v41 count];

              v43 = [v32 mutableAssets];
              unint64_t v44 = [v43 count];

              if (v42)
              {
                unint64_t v45 = 0;
                unint64_t v46 = 1;
                while (1)
                {
                  if (v45 == v44)
                  {
                    unint64_t v45 = v44;
                    goto LABEL_46;
                  }
                  v47 = [v66 assetUUIDs];
                  v48 = [v47 objectAtIndex:v46 - 1];

                  v49 = [v32 mutableAssets];
                  v50 = [v49 objectAtIndex:v45];
                  v51 = [v50 uuid];

                  if ([v48 isEqual:v65]) {
                    break;
                  }
                  unsigned int v52 = [v48 isEqual:v51];

                  if (v46 < v42)
                  {
                    v45 += v52;
                    ++v46;
                    if (v45 <= v44) {
                      continue;
                    }
                  }
                  goto LABEL_48;
                }

LABEL_46:
                id v8 = v63;
              }
              else
              {
                unint64_t v45 = v44;
              }
              v53 = [v32 mutableAssets];
              [v53 insertObject:v8 atIndex:v45];

              [v32 reducePendingItemsCountBy:1];
LABEL_48:

              uint64_t v27 = v62;
              id v8 = v63;
              uint64_t v28 = v59;
              id v9 = v60;
            }
          }
          else
          {
            v39 = PLMigrationGetLog();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v40 = [v8 uuid];
              *(_DWORD *)buf = 138412546;
              id v75 = v30;
              __int16 v76 = 2112;
              v77 = v40;
              _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "Error: Failed  to find the album %@, which asset %@ supposedly belongs to", buf, 0x16u);
            }
          }

          ++v29;
        }
        while (v29 != v27);
        uint64_t v27 = [obj countByEnumeratingWithState:&v67 objects:v78 count:16];
      }
      while (v27);
    }

    v15 = v57;
    v14 = v58;
    v22 = v55;
    v21 = v56;
  }
  v54 = objc_msgSend(v9, "otaRestoreProgressAlbum", v55, v56, v57, v58);
  [v54 reducePendingItemsCountBy:1];
}

id __60__PLAssetsdSyncService__addAsset_toAlbumsForUUID_inLibrary___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) allImportedPhotosAlbumCreateIfNeeded:1];
}

uint64_t __60__PLAssetsdSyncService__addAsset_toAlbumsForUUID_inLibrary___block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 dateCreated];
  v6 = [v4 dateCreated];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_readRestoreAlbumMetadataForAlbum:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 stringByAppendingPathExtension:@"albummetadata"];
  v5 = [v4 stringByAppendingPathExtension:@"aside"];

  v6 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v7 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v8 = [v7 pathManager];
  uint64_t v9 = [v8 privateDirectoryWithSubType:4 createIfNeeded:0 error:0];
  v10 = [v6 fileURLWithPath:v9 isDirectory:1];

  v11 = [v10 URLByAppendingPathComponent:v5 isDirectory:0];
  v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  v13 = [v11 path];
  LOBYTE(v9) = [v12 fileExistsAtPath:v13];

  if (v9)
  {
    v14 = [[PLPersistedAlbumMetadata alloc] initWithPersistedDataAtURL:v11];
  }
  else
  {
    v15 = PLMigrationGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      v18 = v11;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Restore album metadata file %@ doesn't exist!!!!", (uint8_t *)&v17, 0xCu);
    }

    v14 = 0;
  }

  return v14;
}

- (id)_fileRestoreExclusionPaths
{
  v2 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v3 = [v2 pathManager];

  id v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = [v3 photoDirectoryWithType:9];
  if (v5) {
    [v4 addObject:v5];
  }
  v6 = [v3 photoDirectoryWithType:10];

  if (v6) {
    [v4 addObject:v6];
  }

  return v4;
}

- (void)_cleanupAlbumMetadataAsideFilesAfterRestore
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v5 = [v4 pathManager];
  v6 = [v5 privateDirectoryWithSubType:4 createIfNeeded:1 error:0];

  if (v6)
  {
    id v24 = v6;
    uint64_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:1];
    uint64_t v8 = *MEMORY[0x1E4F1C6E8];
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C6E8]];
    v23 = v7;
    v10 = [v3 enumeratorAtURL:v7 includingPropertiesForKeys:v9 options:0 errorHandler:&__block_literal_global_58068];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v26 + 1) + 8 * v15);
          id v25 = 0;
          int v17 = [v16 getResourceValue:&v25 forKey:v8 error:0];
          id v18 = v25;
          uint64_t v19 = v18;
          if (v17 && [v18 length])
          {
            v20 = [v16 pathExtension];
            v21 = v20;
            if (v20 && [v20 isEqualToString:@"aside"]) {
              [v3 removeItemAtURL:v16 error:0];
            }
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v13);
    }

    v22 = v23;
    v6 = v24;
  }
  else
  {
    v22 = PLMigrationGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "_cleanupAlbumMetadataAsideFilesAfterRestore: albumsMetadataPath is nil, returning", buf, 2u);
    }
  }
}

uint64_t __67__PLAssetsdSyncService__cleanupAlbumMetadataAsideFilesAfterRestore__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v6 = PLMigrationGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [v4 path];
    int v9 = 138412546;
    v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Unable to enumerate '%@': %@", (uint8_t *)&v9, 0x16u);
  }
  return 1;
}

- (void)_recoverAsideFiles:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    id v8 = 0;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v6 = 138412546;
    long long v17 = v6;
    do
    {
      uint64_t v10 = 0;
      __int16 v11 = v8;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
        uint64_t v13 = objc_msgSend(v12, "stringByAppendingPathExtension:", @"aside", v17);
        id v19 = v11;
        char v14 = [v4 moveItemAtPath:v13 toPath:v12 error:&v19];
        id v8 = v19;

        if ((v14 & 1) == 0)
        {
          uint64_t v15 = [v12 stringByAppendingPathExtension:@"aside"];
          [v4 removeItemAtPath:v15 error:0];

          v16 = PLMigrationGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            id v25 = v12;
            __int16 v26 = 2112;
            id v27 = v8;
            _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Error: could not move from aside to path %@, error: %@", buf, 0x16u);
          }
        }
        ++v10;
        __int16 v11 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v7);
  }
}

- (void)_linkPathsAside:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    id v8 = 0;
    uint64_t v9 = *(void *)v20;
    *(void *)&long long v6 = 138412546;
    long long v16 = v6;
    do
    {
      uint64_t v10 = 0;
      __int16 v11 = v8;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
        uint64_t v13 = objc_msgSend(v12, "stringByAppendingPathExtension:", @"aside", v16);
        id v18 = v11;
        char v14 = [v4 linkItemAtPath:v12 toPath:v13 error:&v18];
        id v8 = v18;

        if ((v14 & 1) == 0)
        {
          uint64_t v15 = PLMigrationGetLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            id v24 = v12;
            __int16 v25 = 2112;
            id v26 = v8;
            _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Error: could not link path %@ aside, error: %@", buf, 0x16u);
          }
        }
        ++v10;
        __int16 v11 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v7);
  }
}

- (void)_updatePendingCountForMissingAsset:(id)a3 inLibrary:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v5 = a4;
  long long v6 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v7 = [v5 pathManager];
  id v8 = [v7 pathToAssetsToAlbumsMapping];
  uint64_t v9 = [v6 dictionaryWithContentsOfFile:v8];

  if (!v9)
  {
    __int16 v11 = PLMigrationGetLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    id v12 = "Error: Did not find the assets to albums mapping file.";
LABEL_10:
    uint64_t v13 = v11;
    uint32_t v14 = 2;
    goto LABEL_11;
  }
  if (![v9 count])
  {
    __int16 v11 = PLMigrationGetLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    id v12 = "Error: The assests to albums mappings is empty.";
    goto LABEL_10;
  }
  uint64_t v10 = [v9 objectForKey:v27];
  if (v10) {
    goto LABEL_13;
  }
  __int16 v11 = PLMigrationGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v27;
    id v12 = "Error: did not find the list of albums asset %@ is associated with";
    uint64_t v13 = v11;
    uint32_t v14 = 12;
LABEL_11:
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
  }
LABEL_12:

  uint64_t v10 = 0;
LABEL_13:
  if ([v10 count])
  {
    __int16 v25 = v10;
    id v26 = v9;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v21 = objc_msgSend(v5, "albumWithUuid:", v20, v25, v26);
          long long v22 = v21;
          if (v21)
          {
            [v21 reducePendingItemsCountBy:1];
          }
          else
          {
            long long v23 = PLMigrationGetLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v33 = v20;
              __int16 v34 = 2112;
              id v35 = v27;
              _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Error: Failed  to find the album %@, which asset %@ supposedly belongs to", buf, 0x16u);
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v17);
    }

    uint64_t v10 = v25;
    uint64_t v9 = v26;
  }
  id v24 = objc_msgSend(v5, "otaRestoreProgressAlbum", v25, v26);
  [v24 reducePendingItemsCountBy:1];
}

- (void)_updateRestoredAssetWithUUID:(id)a3 paths:(id)a4 fixAddedDate:(BOOL)a5
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F8BA48] transaction:"-[PLAssetsdSyncService _updateRestoredAssetWithUUID:paths:fixAddedDate:]"];
  __int16 v11 = v6;
  v13 = id v12 = v7;
  id v8 = v13;
  id v9 = v7;
  id v10 = v6;
  pl_dispatch_group_async();
  pl_dispatch_group_notify();
}

void __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke(uint64_t a1)
{
  v2 = _os_activity_create(&dword_19B3C7000, "Executing isolation queue block", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  id v3 = *(void **)(a1 + 32);
  if (!v3[4])
  {
    uint64_t v4 = [MEMORY[0x1E4F8BA48] transaction:"-[PLAssetsdSyncService _updateRestoredAssetWithUUID:paths:fixAddedDate:]_block_invoke"];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;

    id v3 = *(void **)(a1 + 32);
  }
  id v7 = (void *)[v3 newShortLivedLibraryWithName:"-[PLAssetsdSyncService _updateRestoredAssetWithUUID:paths:fixAddedDate:]_block_invoke"];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 24);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_2;
  v12[3] = &unk_1E586BE50;
  id v13 = *(id *)(a1 + 40);
  id v9 = v7;
  id v14 = v9;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 32);
  id v15 = v10;
  uint64_t v16 = v11;
  char v17 = *(unsigned char *)(a1 + 64);
  [v9 withDispatchGroup:v8 performTransaction:v12];
  [*(id *)(a1 + 56) stillAlive];

  os_activity_scope_leave(&state);
}

void __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_65(uint64_t a1)
{
  v2 = _os_activity_create(&dword_19B3C7000, "dispatch_group_notify block invoke", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v2, &v5);
  if (!dispatch_group_wait(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24), 0))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 32);
    if (v4)
    {
      *(void *)(v3 + 32) = 0;
    }
  }
  os_activity_scope_leave(&v5);
}

void __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_2(id *a1)
{
  v1 = a1;
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  if ([a1[4] length])
  {
    uint64_t v2 = +[PLManagedAsset assetWithUUID:v1[4] inLibrary:v1[5]];
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      uint64_t v4 = [v1[5] libraryServicesManager];
      os_activity_scope_state_s v5 = [v4 modelMigrator];
      id v6 = [v5 deviceRestoreMigrationSupport];
      uint64_t v7 = [v6 isRestoreFromBackupSourceMegaBackup];

      if (v7)
      {
        uint64_t v8 = [v3 objectIDsForRelationshipNamed:@"master"];
        uint64_t v9 = [v8 count];

        if (v9)
        {
          id v10 = PLMigrationGetLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            id v11 = v1[4];
            *(_DWORD *)buf = 138543362;
            uint64_t v148 = (uint64_t)v11;
            _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "updateRestoredAsset: Mega-backup: Asset with UUID %{public}@ has a CloudMaster, skipping", buf, 0xCu);
          }

          [v3 setComplete:1];
          id v12 = [v3 filePathsWithoutThumbs];
          id v13 = (void *)[v12 mutableCopy];

          [v13 addObjectsFromArray:v1[6]];
          id v14 = [v1[7] libraryServicesManager];
          id v15 = [v14 modelMigrator];
          uint64_t v16 = [v13 allObjects];
          [v15 applyDataProtectionToPhotosPaths:v16 fromKeyClass:4 toKeyClass:3];

          id v17 = 0;
          goto LABEL_110;
        }
      }
      long long v21 = PLMigrationGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = v1[4];
        id v23 = v1[6];
        *(_DWORD *)buf = 138543874;
        uint64_t v148 = (uint64_t)v22;
        __int16 v149 = 1024;
        *(_DWORD *)v150 = v7;
        *(_WORD *)&v150[4] = 2112;
        *(void *)&v150[6] = v23;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "updateRestoredAsset: Restoring asset with UUID %{public}@, isMegaBackup: %d, restored paths: %@", buf, 0x1Cu);
      }

      uint64_t v24 = [v3 persistedFileSystemAttributesFileURL];
      if (!+[PLManagedAsset hasRequiredExtendedAttributesForMainFileURL:v24])
      {
        __int16 v25 = PLMigrationGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v148 = v24;
          _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "updateRestoredAsset: ERROR - missing required extended attributes for file at URL: %@", buf, 0xCu);
        }
      }
      v117 = (void *)v24;
      id v26 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v27 = [v3 sidecars];
      unint64_t v28 = [v27 count] + 1;
      unint64_t v29 = [v1[6] count];

      long long v30 = [MEMORY[0x1E4F1CA48] array];
      if (v28 <= v29)
      {
        [v3 setComplete:1];
        v38 = [v1[7] libraryServicesManager];
        v39 = [v38 modelMigrator];
        [v39 postProcessFixesAfterOTARestoreForCompleteAsset:v3 fixAddedDate:*((unsigned __int8 *)v1 + 64) isMegaBackup:v7];

        v40 = [v3 filePathsWithoutThumbs];
        v41 = (void *)[v40 mutableCopy];

        [v41 addObjectsFromArray:v1[6]];
        unint64_t v42 = [v1[7] libraryServicesManager];
        v43 = [v42 modelMigrator];
        unint64_t v44 = [v41 allObjects];
        [v43 applyDataProtectionToPhotosPaths:v44 fromKeyClass:4 toKeyClass:3];

        [v1[7] _addAsset:v3 toAlbumsForUUID:v1[4] inLibrary:v1[5]];
        +[PLChangeNotificationCenter forceFetchingAlbumReload];
        id v17 = 0;
        unint64_t v45 = v117;
      }
      else
      {
        v106 = v3;
        long long v31 = [v3 filePathsWithoutThumbs];
        long long v139 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v139 objects:v151 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v140;
          char v35 = 1;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v140 != v34) {
                objc_enumerationMutation(v31);
              }
              uint64_t v37 = *(void **)(*((void *)&v139 + 1) + 8 * i);
              if ([v26 fileExistsAtPath:v37])
              {
                v35 &= [v37 rangeOfString:@".XMP" options:1] != 0x7FFFFFFFFFFFFFFFLL;
                [v30 addObject:v37];
              }
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v139 objects:v151 count:16];
          }
          while (v33);
        }
        else
        {
          char v35 = 1;
        }

        unint64_t v46 = (void *)MEMORY[0x1E4F1CA80];
        uint64_t v3 = v106;
        v47 = [v106 filePathsWithoutThumbs];
        v41 = [v46 setWithSet:v47];

        v1 = a1;
        v48 = [MEMORY[0x1E4F1CAD0] setWithArray:a1[6]];
        [v41 minusSet:v48];

        v49 = PLMigrationGetLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          id v50 = a1[4];
          id v51 = a1[6];
          *(_DWORD *)buf = 138412546;
          uint64_t v148 = (uint64_t)v50;
          __int16 v149 = 2112;
          *(void *)v150 = v51;
          _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_ERROR, "updateRestoredAsset: Missing some expected paths for asset %@: %@", buf, 0x16u);
        }

        unint64_t v45 = v117;
        if (v35)
        {
          unsigned int v52 = +[PLAssetTransactionReason transactionReason:@"[UpdateRestoredAsset] No image information can be recovered (every file is XMP.)  Deleting."];
          v53 = PLMigrationGetLog();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            id v54 = a1[4];
            *(_DWORD *)buf = 138412290;
            uint64_t v148 = (uint64_t)v54;
            _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_DEFAULT, "updateRestoredAsset: will expunge asset %@", buf, 0xCu);
          }

          [v106 deleteWithReason:v52];
          [a1[7] _updatePendingCountForMissingAsset:a1[4] inLibrary:a1[5]];

          id v17 = 0;
        }
        else
        {
          [a1[7] _linkPathsAside:v30];
          v55 = PLMigrationGetLog();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            id v56 = a1[4];
            id v57 = a1[6];
            *(_DWORD *)buf = 138412546;
            uint64_t v148 = (uint64_t)v56;
            __int16 v149 = 2112;
            *(void *)v150 = v57;
            _os_log_impl(&dword_19B3C7000, v55, OS_LOG_TYPE_DEFAULT, "updateRestoredAsset: attempting to reimport asset %@ with incomplete restore paths %@", buf, 0x16u);
          }

          v58 = PLMigrationGetLog();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            id v59 = a1[4];
            *(_DWORD *)buf = 138412290;
            uint64_t v148 = (uint64_t)v59;
            _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_DEFAULT, "updateRestoredAsset: deleting existing asset data from db only asset %@", buf, 0xCu);
          }

          [v106 deleteFromDatabaseOnly];
          [a1[7] _recoverAsideFiles:v30];
          id v17 = v30;
        }
      }

      int v20 = 0;
      goto LABEL_41;
    }
  }
  uint64_t v18 = [v1[6] count];
  id v17 = 0;
  uint64_t v3 = 0;
  id v19 = 0;
  int v20 = 1;
  if (!v18)
  {
LABEL_41:
    uint64_t v60 = [v17 count];
    id v19 = v17;
    if (!v60) {
      goto LABEL_105;
    }
  }
  v104 = v19;
  v61 = PLMigrationGetLog();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v62 = @"Reimporting partially restored";
    id v63 = v1[4];
    id v64 = v1[6];
    if (v20) {
      uint64_t v62 = @"Failed to fetch";
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v148 = (uint64_t)v62;
    __int16 v149 = 2112;
    *(void *)v150 = v63;
    *(_WORD *)&v150[8] = 2112;
    *(void *)&v150[10] = v64;
    _os_log_impl(&dword_19B3C7000, v61, OS_LOG_TYPE_DEFAULT, "updateRestoredAsset: %@ asset with UUID %@, will attempt import with restored paths: %@", buf, 0x20u);
  }

  v110 = [v1[7] _fileRestoreExclusionPaths];
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v65 = v1[6];
  uint64_t v66 = [v65 countByEnumeratingWithState:&v135 objects:v146 count:16];
  if (!v66)
  {

    goto LABEL_72;
  }
  uint64_t v67 = v66;
  uint64_t v118 = *(void *)v136;
  int v68 = 1;
  int v69 = 1;
  id obj = v65;
  do
  {
    for (uint64_t j = 0; j != v67; ++j)
    {
      if (*(void *)v136 != v118) {
        objc_enumerationMutation(obj);
      }
      v71 = *(void **)(*((void *)&v135 + 1) + 8 * j);
      id v134 = 0;
      id v72 = objc_msgSend(MEMORY[0x1E4F8B908], "realPathForPath:error:", v71, &v134, v104);
      id v73 = v134;
      if (v72)
      {
        v74 = [v72 pathExtension];
        BOOL v75 = [v74 caseInsensitiveCompare:@"XMP"] == 0;

        v69 &= v75;
        if ((v68 & 1) == 0)
        {
          int v68 = 0;
          goto LABEL_67;
        }
        long long v132 = 0u;
        long long v133 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        __int16 v76 = v110;
        uint64_t v77 = [v76 countByEnumeratingWithState:&v130 objects:v145 count:16];
        if (v77)
        {
          uint64_t v78 = v77;
          uint64_t v79 = *(void *)v131;
          while (2)
          {
            for (uint64_t k = 0; k != v78; ++k)
            {
              if (*(void *)v131 != v79) {
                objc_enumerationMutation(v76);
              }
              if ([MEMORY[0x1E4F8B908] filePath:v72 hasPrefix:*(void *)(*((void *)&v130 + 1) + 8 * k)])
              {
                int v68 = 1;
                goto LABEL_66;
              }
            }
            uint64_t v78 = [v76 countByEnumeratingWithState:&v130 objects:v145 count:16];
            if (v78) {
              continue;
            }
            break;
          }
        }
        int v68 = 0;
      }
      else
      {
        __int16 v76 = PLMigrationGetLog();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v148 = (uint64_t)v71;
          __int16 v149 = 2112;
          *(void *)v150 = v73;
          _os_log_impl(&dword_19B3C7000, v76, OS_LOG_TYPE_ERROR, "Couldn't resolve realpath for path: %@, error: %@", buf, 0x16u);
        }
      }
LABEL_66:

LABEL_67:
    }
    uint64_t v67 = [obj countByEnumeratingWithState:&v135 objects:v146 count:16];
  }
  while (v67);

  v1 = a1;
  if (((v69 | v68) & 1) == 0)
  {
    id v17 = a1[6];
    v81 = v104;
    goto LABEL_104;
  }
LABEL_72:
  v81 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v104);
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id v108 = v1[6];
  uint64_t v82 = [v108 countByEnumeratingWithState:&v126 objects:v144 count:16];
  if (v82)
  {
    uint64_t v83 = v82;
    uint64_t v111 = *(void *)v127;
    do
    {
      uint64_t v84 = 0;
      uint64_t v107 = v83;
      do
      {
        if (*(void *)v127 != v111) {
          objc_enumerationMutation(v108);
        }
        v85 = *(void **)(*((void *)&v126 + 1) + 8 * v84);
        id v125 = 0;
        v86 = [MEMORY[0x1E4F8B908] realPathForPath:v85 error:&v125];
        id v87 = v125;
        v88 = v87;
        if (v86)
        {
          id v113 = v87;
          uint64_t v114 = v84;
          v89 = [v86 pathExtension];
          uint64_t v90 = [v89 caseInsensitiveCompare:@"XMP"];

          v91 = [a1[5] pathManager];
          obja = [v91 photoDirectoryWithType:4];

          v92 = [a1[5] pathManager];
          uint64_t v93 = [v92 photoDirectoryWithType:28];

          v112 = (void *)v93;
          if (!v90
            && (([MEMORY[0x1E4F8B908] filePath:v86 hasPrefix:obja] & 1) != 0
             || [MEMORY[0x1E4F8B908] filePath:v86 hasPrefix:v93]))
          {
            v101 = PLMigrationGetLog();
            if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v148 = (uint64_t)v86;
              _os_log_impl(&dword_19B3C7000, v101, OS_LOG_TYPE_DEFAULT, "Deleting XMP restore file at path: %@", buf, 0xCu);
            }

            [v81 removeItemAtPath:v86 error:0];
          }
          else
          {
            long long v123 = 0u;
            long long v124 = 0u;
            long long v121 = 0u;
            long long v122 = 0u;
            id v94 = v110;
            uint64_t v95 = [v94 countByEnumeratingWithState:&v121 objects:v143 count:16];
            if (v95)
            {
              uint64_t v96 = v95;
              uint64_t v97 = *(void *)v122;
              do
              {
                for (uint64_t m = 0; m != v96; ++m)
                {
                  if (*(void *)v122 != v97) {
                    objc_enumerationMutation(v94);
                  }
                  if ([MEMORY[0x1E4F8B908] filePath:v86 hasPrefix:*(void *)(*((void *)&v121 + 1) + 8 * m)])
                  {
                    v99 = PLBackendGetLog();
                    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v148 = (uint64_t)v86;
                      _os_log_impl(&dword_19B3C7000, v99, OS_LOG_TYPE_DEFAULT, "Deleting excluded restore file at path: %@", buf, 0xCu);
                    }

                    [v81 removeItemAtPath:v86 error:0];
                  }
                }
                uint64_t v96 = [v94 countByEnumeratingWithState:&v121 objects:v143 count:16];
              }
              while (v96);
            }

            uint64_t v83 = v107;
          }
          v88 = v113;
          uint64_t v84 = v114;

          v100 = obja;
        }
        else
        {
          v100 = PLMigrationGetLog();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v148 = (uint64_t)v85;
            __int16 v149 = 2112;
            *(void *)v150 = v88;
            _os_log_impl(&dword_19B3C7000, v100, OS_LOG_TYPE_ERROR, "Couldn't resolve realpath for path: %@, error: %@", buf, 0x16u);
          }
        }

        ++v84;
      }
      while (v84 != v83);
      uint64_t v83 = [v108 countByEnumeratingWithState:&v126 objects:v144 count:16];
    }
    while (v83);
  }

  v1 = a1;
  if ([a1[4] length]) {
    [a1[7] _updatePendingCountForMissingAsset:a1[4] inLibrary:a1[5]];
  }
  id v17 = 0;
LABEL_104:

LABEL_105:
  if ([v17 count])
  {
    id v119 = v1[5];
    id v17 = v17;
    id v120 = v1[4];
    pl_dispatch_group_async();
  }
  else
  {
    v102 = PLMigrationGetLog();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      id v103 = v1[4];
      *(_DWORD *)buf = 138543362;
      uint64_t v148 = (uint64_t)v103;
      _os_log_impl(&dword_19B3C7000, v102, OS_LOG_TYPE_ERROR, "Failed to restore asset %{public}@. No valid paths to import", buf, 0xCu);
    }
  }
LABEL_110:
}

void __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_60(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  uint64_t v3 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_2_61;
  v6[3] = &unk_1E586BE28;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 48);
  char v11 = *(unsigned char *)(a1 + 64);
  id v10 = *(id *)(a1 + 56);
  [WeakRetained performFileSystemAssetImporterWorkWithLibrary:v4 block:v6];
}

void __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_2_61(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 24);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_3;
  v9[3] = &unk_1E5870F88;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v6;
  uint64_t v11 = v7;
  id v12 = v3;
  char v15 = *(unsigned char *)(a1 + 64);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 32);
  id v8 = v3;
  [v4 withDispatchGroup:v5 performTransaction:v9];
}

void __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_3(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F38D3B0]();
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*((void *)&v19 + 1) + 8 * i) isDirectory:0];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v6);
  }

  id v10 = [*(id *)(a1 + 40) libraryServicesManager];
  uint64_t v11 = [v10 modelMigrator];
  [v11 applyDataProtectionToPhotosPaths:*(void *)(a1 + 32) fromKeyClass:4 toKeyClass:3];

  id v12 = [*(id *)(a1 + 48) addAssetWithURLs:v3 assetPayload:0 forceInsert:1 forceUpdate:0 fixAddedDate:*(unsigned __int8 *)(a1 + 72)];
  id v13 = *(void **)(a1 + 40);
  if (v12)
  {
    [v13 _addAsset:v12 toAlbumsForUUID:*(void *)(a1 + 56) inLibrary:*(void *)(a1 + 64)];
    id v18 = 0;
    BOOL v14 = +[PLResourceInstaller installInternalResourcesForExistingAsset:v12 assumeNoExistingResources:1 referencedResourceURLs:0 error:&v18];
    id v15 = v18;
    if (!v14)
    {
      uint64_t v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = [v12 uuid];
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v17;
        __int16 v25 = 2112;
        id v26 = v15;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to build modern resources for asset uuid: %@, reason: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    [v13 _updatePendingCountForMissingAsset:*(void *)(a1 + 56) inLibrary:*(void *)(a1 + 64)];
  }
}

- (void)_finalizeOTARestoreEndedAndRecreateAlbums:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = PLMigrationGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"NO";
    if (v3) {
      uint64_t v5 = @"YES";
    }
    *(_DWORD *)buf = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "_finalizeOTARestoreEndedAndRecreateAlbums: %{public}@", buf, 0xCu);
  }

  uint64_t v7 = [MEMORY[0x1E4F8BA48] transaction:"-[PLAssetsdSyncService _finalizeOTARestoreEndedAndRecreateAlbums:]"];
  id v6 = v7;
  pl_dispatch_group_async();
}

void __66__PLAssetsdSyncService__finalizeOTARestoreEndedAndRecreateAlbums___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _os_activity_create(&dword_19B3C7000, "Executing isolation queue block", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 48))
  {
    id v4 = PLMigrationGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 48)) {
        uint64_t v5 = @"YES";
      }
      else {
        uint64_t v5 = @"NO";
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring redundant call to _finalizeOTARestoreEndedAndRecreateAlbums: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    *(unsigned char *)(v3 + 48) = 1;
    id v6 = (void *)[*(id *)(a1 + 32) newShortLivedLibraryWithName:"-[PLAssetsdSyncService _finalizeOTARestoreEndedAndRecreateAlbums:]_block_invoke"];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 24);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__PLAssetsdSyncService__finalizeOTARestoreEndedAndRecreateAlbums___block_invoke_2;
    v10[3] = &unk_1E5874318;
    id v4 = v6;
    uint64_t v11 = v4;
    char v13 = *(unsigned char *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    [v4 withDispatchGroup:v7 performTransaction:v10];
    [*(id *)(a1 + 32) _cleanupAlbumMetadataAsideFilesAfterRestore];
    id v8 = [*(id *)(a1 + 32) libraryServicesManager];
    id v9 = [v8 modelMigrator];
    [v9 applyDataProtectionToAllPhotosFilesOnce];
  }
  [*(id *)(a1 + 40) stillAlive];
  os_activity_scope_leave(&state);
}

uint64_t __66__PLAssetsdSyncService__finalizeOTARestoreEndedAndRecreateAlbums___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) cleanupIncompleteAssetsAfterOTARestore];
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) recreateAlbumsAndPersonsFromMetadata];
  }
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 stillAlive];
}

- (void)finalizeOTARestoreRecreatingAlbums:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  *(_OWORD *)sel = 0u;
  long long v9 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v9) = v5;
  if (v5)
  {
    *((void *)&v9 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: finalizeOTARestoreRecreatingAlbums:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  -[PLAssetsdSyncService _finalizeOTARestoreEndedAndRecreateAlbums:](self, "_finalizeOTARestoreEndedAndRecreateAlbums:", v3, (void)v9);
  if (v10) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if ((void)v11)
  {
    id v6 = PLRequestGetLog();
    uint64_t v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      BOOL v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)updateRestoredAssetWithUUID:(id)a3 paths:(id)a4 fixAddedDate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v14 = 0u;
  int v10 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v14) = v10;
  if (v10)
  {
    *((void *)&v14 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: updateRestoredAssetWithUUID:paths:fixAddedDate:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v14 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  -[PLAssetsdSyncService _updateRestoredAssetWithUUID:paths:fixAddedDate:](self, "_updateRestoredAssetWithUUID:paths:fixAddedDate:", v8, v9, v5, (void)v14);
  if (v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if ((void)v16)
  {
    long long v11 = PLRequestGetLog();
    id v12 = v11;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      long long v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v12, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (PLAssetsdSyncService)initWithLibraryServicesManager:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLAssetsdSyncService;
  BOOL v5 = [(PLAbstractLibraryServicesManagerService *)&v11 initWithLibraryServicesManager:v4];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.private.photos.service.sync", 0);
    isolationQueue = v5->_isolationQueue;
    v5->_isolationQueue = (OS_dispatch_queue *)v6;

    dispatch_group_t v8 = dispatch_group_create();
    updateGroup = v5->_updateGroup;
    v5->_updateGroup = (OS_dispatch_group *)v8;

    objc_storeWeak((id *)&v5->_libraryServicesManager, v4);
  }

  return v5;
}

@end