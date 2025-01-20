@interface PLCloudSharingEnablingJob
+ (void)deleteAllLocalSharedAlbumsInLibrary:(id)a3 keepPendingAlbums:(BOOL)a4 withReason:(id)a5;
+ (void)disableCloudSharingWithLibraryServicesManager:(id)a3;
+ (void)enableCloudSharing:(BOOL)a3 withPathManager:(id)a4;
- (BOOL)enableSharing;
- (BOOL)shouldArchiveXPCToDisk;
- (id)description;
- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4;
- (int64_t)daemonOperation;
- (void)encodeToXPCObject:(id)a3;
- (void)runDaemonSide;
- (void)setEnableSharing:(BOOL)a3;
@end

@implementation PLCloudSharingEnablingJob

- (void)setEnableSharing:(BOOL)a3
{
  *(&self->super._shouldPrioritize + 1) = a3;
}

- (BOOL)enableSharing
{
  return *(&self->super._shouldPrioritize + 1);
}

- (void)runDaemonSide
{
  v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudSharingEnablingJob runDaemonSide]"];
  v4 = [(id)objc_opt_class() lowPriorityOperationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__PLCloudSharingEnablingJob_runDaemonSide__block_invoke;
  v6[3] = &unk_1E5875E18;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v4 addOperationWithBlock:v6];
}

void __42__PLCloudSharingEnablingJob_runDaemonSide__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F38D3B0]();
  v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [*(id *)(a1 + 32) enableSharing];
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "PLCloudSharingEnabledJob runDaemonSide %d", buf, 8u);
  }

  if ([*(id *)(a1 + 32) enableSharing])
  {
    +[PLPhotoSharingHelper clearCachedAccountState];
    id v5 = [*(id *)(a1 + 32) transientPhotoLibrary];
    v6 = v5;
    if (v5)
    {
      id v7 = [v5 pathManager];
      v8 = [v7 photoDirectoryWithType:22 additionalPathComponents:@"personID"];

      v9 = +[PLPhotoSharingHelper sharingPersonID];
      if (v9)
      {
        v10 = [MEMORY[0x1E4F28CB8] defaultManager];
        v11 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v12 = [*(id *)(a1 + 32) libraryServicesManager];
        v13 = [(id)v12 pathManager];
        v14 = [v13 photoDirectoryWithType:22];
        v15 = [v11 fileURLWithPath:v14 isDirectory:1];

        id v26 = 0;
        LOBYTE(v12) = [v15 getResourceValue:&v26 forKey:*MEMORY[0x1E4F1C5C0] error:0];
        id v23 = v26;
        v16 = 0;
        if ((v12 & 1) == 0)
        {
          id v25 = 0;
          char v17 = [v10 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:&v25];
          v16 = v25;
          if ((v17 & 1) == 0)
          {
            v18 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v19 = [v15 path];
              *(_DWORD *)buf = 138412546;
              v28 = v19;
              __int16 v29 = 2112;
              v30 = v16;
              _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "ERROR: Unable to create directory \"%@\": %@", buf, 0x16u);
            }
          }
        }
        [v10 removeItemAtPath:v8 error:0];
        v20 = [v9 dataUsingEncoding:4];
        if (([v20 writeToFile:v8 options:1073741825 error:0] & 1) == 0)
        {
          v21 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v28 = v9;
            __int16 v29 = 2112;
            v30 = v8;
            __int16 v31 = 2112;
            v32 = v16;
            _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "ERROR: Unable to write personID %@ to file %@: %@", buf, 0x20u);
          }
        }
      }
      +[PLPhotoSharingHelper updateSharedAlbumsCachedServerConfigurationLimits];
      v22 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "will perform initial poll", buf, 2u);
      }

      +[PLPhotoSharingHelper pollForAlbumListUpdates];
    }
    else
    {
      v8 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "PLCloudSharingEnablingJob unable to create PLPhotoLibrary instance. Enabling failed.", buf, 2u);
      }
    }
  }
  else
  {
    v6 = [*(id *)(a1 + 32) libraryServicesManager];
    +[PLCloudSharingEnablingJob disableCloudSharingWithLibraryServicesManager:v6];
  }

  v24.receiver = *(id *)(a1 + 32);
  v24.super_class = (Class)PLCloudSharingEnablingJob;
  objc_msgSendSuper2(&v24, sel_runDaemonSide);
  [*(id *)(a1 + 40) stillAlive];
}

- (BOOL)shouldArchiveXPCToDisk
{
  return 1;
}

- (int64_t)daemonOperation
{
  return 2;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PLCloudSharingEnablingJob;
  v3 = [(PLDaemonJob *)&v6 description];
  int v4 = objc_msgSend(v3, "stringByAppendingFormat:", @" enableSharing %d", -[PLCloudSharingEnablingJob enableSharing](self, "enableSharing"));

  return v4;
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLCloudSharingEnablingJob;
  id v7 = [(PLCloudSharingJob *)&v9 initFromXPCObject:v6 libraryServicesManager:a4];
  if (v7) {
    objc_msgSend(v7, "setEnableSharing:", xpc_dictionary_get_BOOL(v6, "enableSharing"));
  }

  return v7;
}

- (void)encodeToXPCObject:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PLCloudSharingEnablingJob;
  id v4 = a3;
  [(PLDaemonJob *)&v5 encodeToXPCObject:v4];
  xpc_dictionary_set_BOOL(v4, "enableSharing", [(PLCloudSharingEnablingJob *)self enableSharing]);
}

+ (void)deleteAllLocalSharedAlbumsInLibrary:(id)a3 keepPendingAlbums:(BOOL)a4 withReason:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:a1 file:@"PLCloudSharingEnablingJob.m" lineNumber:176 description:@"deleteAllLocalSharedAlbumsInLibrary only valid in assetsd!"];
  }
  objc_super v9 = +[PLCloudSharedAlbum allCloudSharedAlbumsInLibrary:v8];
  if ([v9 count])
  {
    v10 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = [v9 count];
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "PLCloudSharingEnablingJob will delete all %lu shared albums", buf, 0xCu);
    }

    v11 = +[PLNotificationManager sharedManager];
    uint64_t v12 = [v8 managedObjectContext];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    objc_super v24 = __94__PLCloudSharingEnablingJob_deleteAllLocalSharedAlbumsInLibrary_keepPendingAlbums_withReason___block_invoke;
    id v25 = &unk_1E5871F88;
    BOOL v27 = a4;
    id v26 = v11;
    id v13 = v11;
    v14 = [v12 enumerateWithIncrementalSaveUsingObjects:v9 withBlock:&v22];

    if (v14)
    {
      v15 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = (uint64_t)v14;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "PLCloudSharingEnablingJob failed to delete shared albums: %@", buf, 0xCu);
      }
    }
  }
  v16 = +[PLManagedAsset allCloudSharedAssetsInLibrary:](PLManagedAsset, "allCloudSharedAssetsInLibrary:", v8, v22, v23, v24, v25);
  if ([v16 count])
  {
    char v17 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v16 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = v18;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "PLCloudSharingEnablingJob will delete all %lu orphaned shared assets", buf, 0xCu);
    }

    v19 = [v8 managedObjectContext];
    id v20 = (id)[v19 deleteObjectsWithIncrementalSave:v16];
  }
}

void __94__PLCloudSharingEnablingJob_deleteAllLocalSharedAlbumsInLibrary_keepPendingAlbums_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(a1 + 40) || [v3 cloudRelationshipStateLocalValue] != 1)
  {
    [*(id *)(a1 + 32) noteDidDeleteSharedAlbum:v3];
    [v3 delete];
  }
}

+ (void)disableCloudSharingWithLibraryServicesManager:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Telling mstreamd to forget sharing data", buf, 2u);
  }

  +[PLPhotoSharingHelper forgetSharingPersonID:0];
  objc_super v5 = [v3 pathManager];
  id v6 = [v5 photoDirectoryWithType:22 additionalPathComponents:@"recentlyUsedGUIDS"];
  id v7 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = v6;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Removing recently used GUIDs from %@", buf, 0xCu);
  }

  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v31 = 0;
  char v9 = [v8 removeItemAtPath:v6 error:&v31];
  id v10 = v31;

  if ((v9 & 1) == 0)
  {
    v11 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v33 = v6;
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Failed to remove %@: %@", buf, 0x16u);
    }

    id v10 = 0;
  }
  uint64_t v12 = [v5 photoDirectoryWithType:23];
  if ([v12 length])
  {
    id v13 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Removing cloud sharing metadata %@", buf, 0xCu);
    }

    v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v30 = v10;
    char v15 = [v14 removeItemAtPath:v12 error:&v30];
    id v16 = v30;

    if (v15)
    {
      id v10 = v16;
    }
    else
    {
      char v17 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v33 = v12;
        __int16 v34 = 2112;
        id v35 = v16;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Failed to remove %@: %@", buf, 0x16u);
      }

      id v10 = 0;
    }
  }
  uint64_t v18 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Removing persisted person info", buf, 2u);
  }

  v19 = [v3 libraryBundle];
  id v20 = [v19 personInfoManager];
  [v20 removePersistedInfo];

  v21 = [v3 databaseContext];
  uint64_t v22 = (void *)[v21 newShortLivedLibraryWithName:"+[PLCloudSharingEnablingJob disableCloudSharingWithLibraryServicesManager:]"];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __75__PLCloudSharingEnablingJob_disableCloudSharingWithLibraryServicesManager___block_invoke;
  v28[3] = &unk_1E5875CE0;
  id v23 = v22;
  id v29 = v23;
  [v23 performTransactionAndWait:v28];
  objc_super v24 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "Discarding all notifications", buf, 2u);
  }

  id v25 = +[PLNotificationManager sharedManager];
  [v25 discardAllNotifications];

  id v26 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "Rebuilding cloud feed entries", buf, 2u);
  }

  BOOL v27 = [[PLCloudFeedEntriesManager alloc] initWithPhotoLibrary:v23];
  [(PLCloudFeedEntriesManager *)v27 rebuildAllEntries:0];
}

void __75__PLCloudSharingEnablingJob_disableCloudSharingWithLibraryServicesManager___block_invoke(uint64_t a1)
{
  v2 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "PLCloudSharingEnablingJob deleting all shared albums and assets while disabling", v4, 2u);
  }

  id v3 = +[PLAssetTransactionReason transactionReason:@"[PLCloudSharingEnablingJob]Deleting all shared albums and assets while disabling"];
  +[PLCloudSharingEnablingJob deleteAllLocalSharedAlbumsInLibrary:*(void *)(a1 + 32) keepPendingAlbums:0 withReason:v3];
}

+ (void)enableCloudSharing:(BOOL)a3 withPathManager:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"Disabling";
    if (v4) {
      id v8 = @"Enabling";
    }
    int v11 = 138412290;
    uint64_t v12 = v8;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "%@ shared album", (uint8_t *)&v11, 0xCu);
  }

  [a1 deleteAllRecoveryEventsWithPathManager:v6];
  char v9 = objc_opt_new();
  [v9 setEnableSharing:v4];
  [v9 runAndWaitForMessageToBeSent];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.PreferenceChanged", 0, 0, 1u);
}

@end