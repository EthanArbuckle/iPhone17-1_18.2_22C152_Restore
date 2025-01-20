@interface PLDiskSpaceManagement
+ (int64_t)_processCloudSharedAsset:(id)a3 shouldFreeSpace:(BOOL)a4;
+ (unint64_t)_purgeAssetsFromFetchRequest:(id)a3 photoLibrary:(id)a4 recentlyUsedGUIDS:(id)a5 recentlyUsedAssetObjectIDs:(id)a6 shouldFreeSpace:(BOOL)a7 bytesToPurge:(unint64_t)a8;
+ (unint64_t)_scanAndDeleteCacheFilesInDirectory:(id)a3 shouldFreeSpace:(BOOL)a4 bytesToPurge:(unint64_t)a5;
+ (unint64_t)_scanFilesInPhotoLibrary:(id)a3 fromCloudSharingCacheDataDirectoryShouldFreeSpace:(BOOL)a4 bytesToPurge:(unint64_t)a5;
+ (unint64_t)_scanFilesInPhotoLibrary:(id)a3 fromPhotoMetadataDirectoryShouldFreeSpace:(BOOL)a4 bytesToPurge:(unint64_t)a5 skipAssets:(id)a6;
+ (unint64_t)_scanFilesInPhotoLibrary:(id)a3 fromReimportPhotoCloudSharingDataDirectoryShouldFreeSpace:(BOOL)a4 bytesToPurge:(unint64_t)a5;
+ (unint64_t)performCloudSharingSpaceManagementWithBytesToPurge:(unint64_t)a3 shouldFreeSpace:(BOOL)a4 shouldKeepRecentlyViewedAssets:(BOOL)a5 fromPhotoLibrary:(id)a6;
+ (void)_processPurgeWithPhotoLibrary:(id)a3 shouldFreeSpace:(BOOL)a4 shouldKeepRecentlyViewedAssets:(BOOL)a5 bytesToPurge:(unint64_t)a6 bytesProcessed:(unint64_t *)a7;
@end

@implementation PLDiskSpaceManagement

+ (int64_t)_processCloudSharedAsset:(id)a3 shouldFreeSpace:(BOOL)a4
{
  BOOL v40 = a4;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isCloudSharedAsset])
  {
    context = (void *)MEMORY[0x19F38D3B0]();
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v38 = v4;
    v6 = [v4 allFileURLs];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      int64_t v9 = 0;
      uint64_t v10 = *(void *)v53;
      uint64_t v43 = *MEMORY[0x1E4F1C5F8];
      uint64_t v42 = *(void *)v53;
      v39 = v6;
      while (1)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v53 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          unsigned __int8 v51 = 0;
          v13 = [v12 path];
          int v14 = [v5 fileExistsAtPath:v13 isDirectory:&v51];
          int v15 = v51;

          if (v14) {
            BOOL v16 = v15 == 0;
          }
          else {
            BOOL v16 = 0;
          }
          if (v16)
          {
            id v49 = 0;
            id v50 = 0;
            int v17 = [v12 getResourceValue:&v50 forKey:v43 error:&v49];
            id v18 = v50;
            v19 = v49;
            if (v17) {
              BOOL v20 = v18 == 0;
            }
            else {
              BOOL v20 = 1;
            }
            if (v20)
            {
              v21 = PLPhotoSharingGetLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v58 = v12;
                __int16 v59 = 2112;
                v60 = v19;
                _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "couldn't get file size for %@. Error: %@", buf, 0x16u);
              }
LABEL_32:

              uint64_t v10 = v42;
            }
            else
            {
              int64_t v22 = v9;
              v9 += [v18 unsignedLongLongValue];
              if (v40)
              {
                v23 = [v12 path];
                v24 = +[PLPhotoLibrary fileReservationForFileAtPath:v23 exclusive:1];

                if (v24)
                {
                  [v38 setCloudPlaceholderKind:3];
                  id v48 = 0;
                  int v25 = [v5 removeItemAtURL:v12 error:&v48];
                  v21 = v48;
                  if (v25)
                  {
                    [v41 addObject:v12];
                    v26 = PLPhotoSharingGetLog();
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v58 = v12;
                      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "deleted derivative file at %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v26 = PLPhotoSharingGetLog();
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      v58 = v12;
                      __int16 v59 = 2112;
                      v60 = v21;
                      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "couldn't delete file at %@. Error: %@", buf, 0x16u);
                    }
                    int64_t v9 = v22;
                  }
                  v6 = v39;
                }
                else
                {
                  v21 = PLPhotoSharingGetLog();
                  int64_t v9 = v22;
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v58 = v12;
                    _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "file reservation not permitted for %@", buf, 0xCu);
                  }
                  v6 = v39;
                }
                goto LABEL_32;
              }
              v6 = v39;
            }

            continue;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v52 objects:v61 count:16];
        if (!v8) {
          goto LABEL_39;
        }
      }
    }
    int64_t v9 = 0;
LABEL_39:

    id v4 = v38;
    if (v40 && [v41 count])
    {
      int64_t v27 = v9;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v28 = [v38 modernResources];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v56 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v45;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v45 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v44 + 1) + 8 * j);
            v34 = [v33 fileURL];
            int v35 = [v41 containsObject:v34];

            if (v35) {
              [v33 markAsNotLocallyAvailable];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v56 count:16];
        }
        while (v30);
      }

      int64_t v9 = v27;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

+ (unint64_t)_scanAndDeleteCacheFilesInDirectory:(id)a3 shouldFreeSpace:(BOOL)a4 bytesToPurge:(unint64_t)a5
{
  BOOL v33 = a4;
  v47[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F1C6E8];
  uint64_t v7 = *MEMORY[0x1E4F1C670];
  v47[0] = *MEMORY[0x1E4F1C6E8];
  v47[1] = v7;
  uint64_t v34 = *MEMORY[0x1E4F1C5F8];
  v47[2] = *MEMORY[0x1E4F1C5F8];
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];
  v32 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v30 = v5;
  [v32 enumeratorAtURL:v5 includingPropertiesForKeys:v8 options:0 errorHandler:&__block_literal_global_76];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (!v9)
  {
    unint64_t v38 = 0;
    goto LABEL_30;
  }
  uint64_t v10 = v9;
  unint64_t v38 = 0;
  uint64_t v39 = *(void *)v41;
  uint64_t v35 = *MEMORY[0x1E4F8C4D0];
  while (2)
  {
    uint64_t v11 = 0;
    uint64_t v36 = v10;
    do
    {
      if (*(void *)v41 != v39) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x19F38D3B0]();
      int v14 = [v12 resourceValuesForKeys:v8 error:0];
      int v15 = [v14 objectForKeyedSubscript:v6];
      BOOL v16 = [v14 objectForKeyedSubscript:v7];
      if ([v16 BOOLValue]) {
        BOOL v17 = v15 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (v17) {
        goto LABEL_11;
      }
      uint64_t v18 = v7;
      uint64_t v19 = v6;
      BOOL v20 = v8;
      char v21 = [v15 isEqualToString:v35];

      if ((v21 & 1) != 0
        || ([v14 objectForKeyedSubscript:v34],
            int64_t v22 = objc_claimAutoreleasedReturnValue(),
            v38 += [v22 unsignedLongLongValue],
            v22,
            !v33))
      {
        uint64_t v8 = v20;
      }
      else
      {
        v23 = [v12 path];
        int v24 = [v32 removeItemAtPath:v23 error:0];

        if (!v24)
        {
          int v25 = PLPhotoSharingGetLog();
          uint64_t v8 = v20;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v45 = v12;
            _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "failed to remove %@", buf, 0xCu);
          }

          BOOL v16 = [v14 objectForKeyedSubscript:v34];
          v38 -= [v16 unsignedLongLongValue];
          uint64_t v6 = v19;
          uint64_t v7 = v18;
          uint64_t v10 = v36;
LABEL_11:

          goto LABEL_19;
        }
        uint64_t v8 = v20;
        if (v38 >= a5)
        {
          int64_t v27 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "enough bytes have been freed, finishing", buf, 2u);
          }

          goto LABEL_30;
        }
      }
      uint64_t v6 = v19;
      uint64_t v7 = v18;
      uint64_t v10 = v36;
LABEL_19:

      ++v11;
    }
    while (v10 != v11);
    uint64_t v26 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    uint64_t v10 = v26;
    if (v26) {
      continue;
    }
    break;
  }
LABEL_30:

  return v38;
}

uint64_t __90__PLDiskSpaceManagement__scanAndDeleteCacheFilesInDirectory_shouldFreeSpace_bytesToPurge___block_invoke()
{
  return 1;
}

+ (unint64_t)_scanFilesInPhotoLibrary:(id)a3 fromPhotoMetadataDirectoryShouldFreeSpace:(BOOL)a4 bytesToPurge:(unint64_t)a5 skipAssets:(id)a6
{
  BOOL v45 = a4;
  v61[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v48 = a6;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
  long long v44 = v8;
  uint64_t v10 = [v8 pathManager];
  uint64_t v11 = [v10 photoDirectoryWithType:10];
  uint64_t v12 = [v9 fileURLWithPath:v11 isDirectory:1];

  uint64_t v53 = *MEMORY[0x1E4F1C670];
  uint64_t v13 = *MEMORY[0x1E4F1C670];
  uint64_t v54 = *MEMORY[0x1E4F1C6E8];
  v61[0] = *MEMORY[0x1E4F1C6E8];
  v61[1] = v13;
  uint64_t v42 = *MEMORY[0x1E4F1C5F8];
  v61[2] = *MEMORY[0x1E4F1C5F8];
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];
  long long v47 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v43 = (void *)v12;
  id v49 = (void *)v14;
  [v47 enumeratorAtURL:v12 includingPropertiesForKeys:v14 options:0 errorHandler:&__block_literal_global_1531];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v52 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (!v52)
  {
    unint64_t v46 = 0;
    int v15 = (void *)v14;
    goto LABEL_35;
  }
  unint64_t v40 = a5;
  unint64_t v46 = 0;
  uint64_t v51 = *(void *)v57;
  int v15 = (void *)v14;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v57 != v51) {
        objc_enumerationMutation(obj);
      }
      BOOL v17 = *(void **)(*((void *)&v56 + 1) + 8 * v16);
      uint64_t v18 = (void *)MEMORY[0x19F38D3B0]();
      uint64_t v19 = [v17 resourceValuesForKeys:v15 error:0];
      BOOL v20 = [v19 objectForKeyedSubscript:v54];
      char v21 = [v20 stringByDeletingPathExtension];
      int64_t v22 = [v19 objectForKeyedSubscript:v53];
      int v23 = [v22 BOOLValue];
      if (v20) {
        BOOL v24 = v23 == 0;
      }
      else {
        BOOL v24 = 1;
      }
      if (!v24)
      {
        uint64_t v26 = [v20 pathExtension];
        int64_t v27 = +[PLManagedAsset extensionForLargeThumbnailFile];
        if ([v26 isEqualToString:v27])
        {
          char v29 = [v48 containsObject:v21];

          if (v29)
          {
            int v25 = 1;
            int v15 = v49;
            goto LABEL_26;
          }
          uint64_t v30 = +[PLManagedAsset extensionForMediumThumbnailFile];
          int64_t v22 = [v21 stringByAppendingPathExtension:v30];

          uint64_t v31 = [v17 path];
          v32 = [v31 stringByDeletingLastPathComponent];

          uint64_t v26 = [v32 stringByAppendingPathComponent:v22];

          if (![v47 fileExistsAtPath:v26])
          {
LABEL_20:
            int v25 = 1;
            goto LABEL_24;
          }
          if (v45)
          {
            int64_t v27 = [v17 path];
            int v25 = 1;
            uint64_t v33 = +[PLPhotoLibrary fileReservationForFileAtPath:v27 exclusive:1];
            if (v33)
            {
              long long v41 = (void *)v33;
              uint64_t v34 = [v17 path];
              int v35 = [v47 removeItemAtPath:v34 error:0];

              if (!v35) {
                goto LABEL_20;
              }
              uint64_t v36 = [v19 objectForKeyedSubscript:v42];
              unint64_t v37 = [v36 unsignedLongLongValue] + v46;

              unint64_t v46 = v37;
              if (v37 < v40) {
                goto LABEL_20;
              }
              int64_t v27 = PLPhotoSharingGetLog();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "enough bytes have been freed, finishing", buf, 2u);
              }
              int v25 = 0;
            }
LABEL_23:

LABEL_24:
            int v15 = v49;
            goto LABEL_25;
          }
          int64_t v27 = [v19 objectForKeyedSubscript:v42];
          v46 += [v27 unsignedLongLongValue];
        }
        int v25 = 1;
        goto LABEL_23;
      }
      int v25 = 1;
LABEL_25:

LABEL_26:
      if (!v25) {
        goto LABEL_35;
      }
      ++v16;
    }
    while (v52 != v16);
    uint64_t v38 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    uint64_t v52 = v38;
  }
  while (v38);
LABEL_35:

  return v46;
}

uint64_t __116__PLDiskSpaceManagement__scanFilesInPhotoLibrary_fromPhotoMetadataDirectoryShouldFreeSpace_bytesToPurge_skipAssets___block_invoke()
{
  return 1;
}

+ (unint64_t)_scanFilesInPhotoLibrary:(id)a3 fromCloudSharingCacheDataDirectoryShouldFreeSpace:(BOOL)a4 bytesToPurge:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v9 = [a3 pathManager];
  uint64_t v10 = [v9 photoDirectoryWithType:24 createIfNeeded:0 error:0];
  uint64_t v11 = [v8 fileURLWithPath:v10 isDirectory:1];

  unint64_t v12 = [a1 _scanAndDeleteCacheFilesInDirectory:v11 shouldFreeSpace:v6 bytesToPurge:a5];
  return v12;
}

+ (unint64_t)_scanFilesInPhotoLibrary:(id)a3 fromReimportPhotoCloudSharingDataDirectoryShouldFreeSpace:(BOOL)a4 bytesToPurge:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v9 = [a3 pathManager];
  uint64_t v10 = [v9 privateCacheDirectoryWithSubType:3];
  uint64_t v11 = [v8 fileURLWithPath:v10 isDirectory:1];

  unint64_t v12 = [a1 _scanAndDeleteCacheFilesInDirectory:v11 shouldFreeSpace:v6 bytesToPurge:a5];
  return v12;
}

+ (unint64_t)_purgeAssetsFromFetchRequest:(id)a3 photoLibrary:(id)a4 recentlyUsedGUIDS:(id)a5 recentlyUsedAssetObjectIDs:(id)a6 shouldFreeSpace:(BOOL)a7 bytesToPurge:(unint64_t)a8
{
  v53[6] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"PSSpaceManagementDebuggingEnabled", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
  v53[0] = @"additionalAttributes";
  v53[1] = @"modernResources";
  v53[2] = @"cloudFeedAssetsEntry";
  v53[3] = @"extendedAttributes";
  v53[4] = @"mediaAnalysisAttributes";
  v53[5] = @"photoAnalysisAttributes";
  BOOL v18 = AppBooleanValue != 0;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:6];
  [v13 setRelationshipKeyPathsForPrefetching:v19];

  BOOL v32 = v18;
  BOOL v33 = a7;
  BOOL v20 = [v14 managedObjectContext];
  uint64_t v31 = [PLEnumerateAndSaveController alloc];
  char v21 = NSStringFromClass((Class)a1);
  uint64_t v22 = [v14 pathManager];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __141__PLDiskSpaceManagement__purgeAssetsFromFetchRequest_photoLibrary_recentlyUsedGUIDS_recentlyUsedAssetObjectIDs_shouldFreeSpace_bytesToPurge___block_invoke;
  v44[3] = &unk_1E586FB88;
  id v23 = v20;
  id v45 = v23;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __141__PLDiskSpaceManagement__purgeAssetsFromFetchRequest_photoLibrary_recentlyUsedGUIDS_recentlyUsedAssetObjectIDs_shouldFreeSpace_bytesToPurge___block_invoke_2;
  v36[3] = &unk_1E58624E8;
  id v30 = v15;
  id v37 = v30;
  BOOL v42 = v33;
  id v24 = v16;
  id v38 = v24;
  uint64_t v39 = &v47;
  BOOL v43 = v32;
  id v40 = a1;
  unint64_t v41 = a8;
  int v25 = [(PLEnumerateAndSaveController *)v31 initWithName:v21 fetchRequest:v13 context:v23 pathManager:v22 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v44 didFetchObjectIDsBlock:0 processResultBlock:v36];

  id v35 = 0;
  LOBYTE(v22) = [(PLEnumerateAndSaveController *)v25 processObjectsWithError:&v35];
  id v26 = v35;
  if ((v22 & 1) == 0)
  {
    int64_t v27 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v26;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "PLDiskSpaceManagement: Failed to process purge request. Error: %@", buf, 0xCu);
    }
  }
  unint64_t v28 = v48[3];

  _Block_object_dispose(&v47, 8);
  return v28;
}

id __141__PLDiskSpaceManagement__purgeAssetsFromFetchRequest_photoLibrary_recentlyUsedGUIDS_recentlyUsedAssetObjectIDs_shouldFreeSpace_bytesToPurge___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __141__PLDiskSpaceManagement__purgeAssetsFromFetchRequest_photoLibrary_recentlyUsedGUIDS_recentlyUsedAssetObjectIDs_shouldFreeSpace_bytesToPurge___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [v6 cloudAssetGUID];
  LODWORD(v7) = [v7 containsObject:v8];

  if (v7)
  {
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v10 = [v6 objectID];
    [v9 addObject:v10];
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 56) _processCloudSharedAsset:v6 shouldFreeSpace:*(unsigned __int8 *)(a1 + 72)];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v11;
    if (*(unsigned char *)(a1 + 73))
    {
      uint64_t v12 = v11;
      id v13 = [v6 cloudShareAlbum];
      id v14 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v13 title];
        id v16 = [v6 cloudBatchPublishDate];
        BOOL v17 = [v6 dateCreated];
        BOOL v18 = [v6 pathForOriginalFile];
        uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        int v21 = 138413570;
        uint64_t v22 = v15;
        __int16 v23 = 2112;
        id v24 = v16;
        __int16 v25 = 2112;
        id v26 = v17;
        __int16 v27 = 2112;
        unint64_t v28 = v18;
        __int16 v29 = 2048;
        uint64_t v30 = v12;
        __int16 v31 = 2048;
        uint64_t v32 = v19;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "%@ asset %@ %@ %@ size %lu total %lld", (uint8_t *)&v21, 0x3Eu);
      }
    }
    if (*(unsigned char *)(a1 + 72) && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 64))
    {
      BOOL v20 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "enough bytes have been freed, finishing", (uint8_t *)&v21, 2u);
      }

      *a4 = 1;
    }
  }
}

+ (void)_processPurgeWithPhotoLibrary:(id)a3 shouldFreeSpace:(BOOL)a4 shouldKeepRecentlyViewedAssets:(BOOL)a5 bytesToPurge:(unint64_t)a6 bytesProcessed:(unint64_t *)a7
{
  BOOL v27 = a5;
  BOOL v9 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  uint64_t v12 = [v11 pathManager];
  id v13 = +[PLManagedAsset persistedRecentlyUsedGUIDSWithPathManager:v12];

  id v14 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = [v13 count];
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "recentlyUsedGUIDS contains %lu entries", buf, 0xCu);
  }

  id v15 = +[PLManagedAsset fetchRequestForSortedCloudSharedAssetsWithPlaceholderKinds:&unk_1EEBF1430 additionalPredicate:0 ascending:1];
  id v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  unint64_t v17 = [a1 _purgeAssetsFromFetchRequest:v15 photoLibrary:v11 recentlyUsedGUIDS:v13 recentlyUsedAssetObjectIDs:v16 shouldFreeSpace:v9 bytesToPurge:a6];
  unint64_t v18 = v17;
  if (v17 < a6)
  {
    uint64_t v26 = +[PLManagedAsset fetchRequestForSortedCloudSharedAssetsWithPlaceholderKinds:&unk_1EEBF1448 additionalPredicate:0 ascending:1];
    unint64_t v19 = objc_msgSend(a1, "_purgeAssetsFromFetchRequest:photoLibrary:recentlyUsedGUIDS:recentlyUsedAssetObjectIDs:shouldFreeSpace:bytesToPurge:")+ v18;
    if (v19 < a6)
    {
      if (!v27 && [v16 count])
      {
        id v24 = (void *)MEMORY[0x1E4F1C0D0];
        BOOL v20 = +[PLManagedAsset entityName];
        __int16 v25 = [v24 fetchRequestWithEntityName:v20];

        int v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v16];
        [v25 setPredicate:v21];

        [v25 setFetchBatchSize:100];
        v19 += [a1 _purgeAssetsFromFetchRequest:v25 photoLibrary:v11 recentlyUsedGUIDS:0 recentlyUsedAssetObjectIDs:0 shouldFreeSpace:v9 bytesToPurge:a6];
        if (v19 >= a6)
        {
          if (a7) {
            *a7 = v19;
          }

          __int16 v23 = (void *)v26;
          goto LABEL_17;
        }
      }
      if (a6 > v19 || !v9)
      {
        if (v27) {
          uint64_t v22 = v13;
        }
        else {
          uint64_t v22 = 0;
        }
        v19 += [a1 _scanFilesInPhotoLibrary:v11 fromPhotoMetadataDirectoryShouldFreeSpace:v9 bytesToPurge:a6 - v19 skipAssets:v22];
      }
    }
    __int16 v23 = (void *)v26;
    if (a7) {
      *a7 = v19;
    }
LABEL_17:

    goto LABEL_20;
  }
  if (a7) {
    *a7 = v17;
  }
LABEL_20:
}

+ (unint64_t)performCloudSharingSpaceManagementWithBytesToPurge:(unint64_t)a3 shouldFreeSpace:(BOOL)a4 shouldKeepRecentlyViewedAssets:(BOOL)a5 fromPhotoLibrary:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v11 = [a1 _scanFilesInPhotoLibrary:v10 fromReimportPhotoCloudSharingDataDirectoryShouldFreeSpace:v7 bytesToPurge:a3];
  unint64_t v12 = v25[3] + v11;
  v25[3] = v12;
  if (!v7 || a3 > v12)
  {
    uint64_t v13 = [a1 _scanFilesInPhotoLibrary:v10 fromCloudSharingCacheDataDirectoryShouldFreeSpace:v7 bytesToPurge:a3 - v12];
    unint64_t v12 = v25[3] + v13;
    v25[3] = v12;
    if (!v7 || v12 < a3)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __140__PLDiskSpaceManagement_performCloudSharingSpaceManagementWithBytesToPurge_shouldFreeSpace_shouldKeepRecentlyViewedAssets_fromPhotoLibrary___block_invoke;
      v17[3] = &unk_1E58624C0;
      id v20 = a1;
      id v14 = v10;
      BOOL v22 = v7;
      BOOL v23 = a5;
      unint64_t v21 = a3;
      id v18 = v14;
      unint64_t v19 = &v24;
      id v15 = (void *)MEMORY[0x19F38D650](v17);
      if (v7) {
        [v14 performTransactionAndWait:v15];
      }
      else {
        [v14 performBlockAndWait:v15];
      }
      unint64_t v12 = v25[3];
    }
  }
  _Block_object_dispose(&v24, 8);

  return v12;
}

uint64_t __140__PLDiskSpaceManagement_performCloudSharingSpaceManagementWithBytesToPurge_shouldFreeSpace_shouldKeepRecentlyViewedAssets_fromPhotoLibrary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 48) _processPurgeWithPhotoLibrary:*(void *)(a1 + 32) shouldFreeSpace:*(unsigned __int8 *)(a1 + 64) shouldKeepRecentlyViewedAssets:*(unsigned __int8 *)(a1 + 65) bytesToPurge:*(void *)(a1 + 56) bytesProcessed:*(void *)(*(void *)(a1 + 40) + 8) + 24];
}

@end